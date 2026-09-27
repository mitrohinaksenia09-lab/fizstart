(function(){
  const AI_CONFIG = {
    // local — работает сразу без сервера.
    // api — будет отправлять запросы на backend /api/ai, если ты его запустишь.
    mode: localStorage.getItem('fizstart_ai_mode') || 'local',
    endpoint: 'http://localhost:3001/api/ai'
  };

  const els = {
    input: document.getElementById('aiInput'),
    send: document.getElementById('aiSend'),
    messages: document.getElementById('aiMessages'),
    history: document.getElementById('aiHistory'),
    clear: document.getElementById('clearAiChat'),
    modeLabel: document.getElementById('aiModeLabel')
  };

  if(!els.input || !els.send || !els.messages) return;

  const state = {
    history: JSON.parse(localStorage.getItem('fizstart_ai_history') || '[]'),
    chat: JSON.parse(localStorage.getItem('fizstart_ai_chat') || '[]')
  };

  function save(){
    localStorage.setItem('fizstart_ai_history', JSON.stringify(state.history.slice(0, 12)));
    localStorage.setItem('fizstart_ai_chat', JSON.stringify(state.chat.slice(-30)));
  }

  function escapeHtml(value){
    return String(value || '')
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;')
      .replace(/'/g, '&#039;');
  }

  function formatAnswer(text){
    return escapeHtml(text)
      .replace(/\*\*(.*?)\*\*/g, '<b>$1</b>')
      .replace(/\n\n/g, '</p><p>')
      .replace(/\n/g, '<br>');
  }

  function addMessage(role, text, persist=true){
    const div = document.createElement('div');
    div.className = `msg ${role === 'user' ? 'user' : 'bot'} rich-ai-answer`;
    div.innerHTML = role === 'user'
      ? escapeHtml(text)
      : `<b>ФизСтарт AI:</b><p>${formatAnswer(text)}</p>`;
    els.messages.appendChild(div);
    els.messages.scrollTop = els.messages.scrollHeight;
    if(persist){
      state.chat.push({role, text, date: new Date().toISOString()});
      save();
    }
    return div;
  }

  function renderSavedChat(){
    if(!state.chat.length) return;
    els.messages.innerHTML = '';
    state.chat.forEach(item => addMessage(item.role, item.text, false));
  }

  function renderHistory(){
    if(!els.history) return;
    if(!state.history.length){
      els.history.innerHTML = '<p class="muted small-text">История пока пустая.</p>';
      return;
    }
    els.history.innerHTML = state.history.slice(0, 8).map(item => `
      <button class="history-item" data-prompt="${escapeHtml(item)}">${escapeHtml(item.length > 44 ? item.slice(0,44) + '…' : item)}</button>
    `).join('');
  }

  function updateModeLabel(){
    if(!els.modeLabel) return;
    els.modeLabel.textContent = AI_CONFIG.mode === 'api' ? 'Реальный AI через API' : 'Локальный режим';
  }

  function getDB(){
    return window.FIZSTART_DB || window.LOCAL_FIZSTART_DB || {theory:[], tasks:[], exams:[]};
  }

  function normalize(text){
    return String(text || '').toLowerCase().replace(/ё/g,'е').replace(/[.,!?;:()«»]/g,' ').replace(/\s+/g,' ').trim();
  }

  function tokenize(text){
    return normalize(text).split(' ').filter(w => w.length > 2);
  }

  function collectTheorySnippets(){
    const db = getDB();
    const snippets = [];
    (db.theory || []).forEach(section => {
      snippets.push({
        title: section.title,
        type: 'section',
        text: `${section.title}. ${section.description || ''} ${(section.formulas || []).join(' ')}`,
        formulas: section.formulas || []
      });
      (section.sections || []).forEach(sub => {
        snippets.push({
          title: `${section.title} → ${sub.title}`,
          type: 'topic',
          text: `${sub.title}. ${sub.goal || ''} ${sub.text || ''} ${(sub.formulas || []).join(' ')} ${(sub.mistakes || []).join(' ')}`,
          formulas: sub.formulas || [],
          example: sub.example || '',
          mistakes: sub.mistakes || []
        });
      });
    });
    return snippets;
  }

  function scoreSnippet(query, snippet){
    const words = tokenize(query);
    const target = normalize(`${snippet.title} ${snippet.text}`);
    let score = 0;
    words.forEach(w => {
      if(target.includes(w)) score += 2;
      if(normalize(snippet.title).includes(w)) score += 4;
    });
    return score;
  }

  function findBestTheory(query){
    return collectTheorySnippets()
      .map(s => ({...s, score: scoreSnippet(query, s)}))
      .filter(s => s.score > 0)
      .sort((a,b) => b.score - a.score)
      .slice(0, 3);
  }

  function findFormula(query){
    const db = getDB();
    const items = [];
    const hints = [
      {keys:['второй закон ньютона','ньютон','сила ускорение','сила'], title:'Второй закон Ньютона', formula:'ΣF = m · a', note:'Равнодействующая сил равна произведению массы на ускорение.'},
      {keys:['импульс','количество движения'], title:'Импульс тела', formula:'p = m · v', note:'Импульс равен произведению массы тела на его скорость.'},
      {keys:['кинетическая энергия','энергия скорость'], title:'Кинетическая энергия', formula:'Eₖ = m · v² / 2', note:'Энергия движения тела.'},
      {keys:['потенциальная энергия','высота','mgh'], title:'Потенциальная энергия тяжести', formula:'Eₚ = m · g · h', note:'Энергия зависит от массы, высоты и ускорения свободного падения.'},
      {keys:['закон гука','упругость','пружина'], title:'Закон Гука', formula:'Fупр = k · Δx', note:'Сила упругости пропорциональна удлинению пружины.'},
      {keys:['давление','паскаль'], title:'Давление', formula:'p = F / S', note:'Давление равно силе, делённой на площадь.'},
      {keys:['архимед','сила архимеда'], title:'Сила Архимеда', formula:'Fₐ = ρ · g · V', note:'Выталкивающая сила зависит от плотности жидкости и объёма погруженной части.'},
      {keys:['период','частота'], title:'Период и частота', formula:'T = 1 / ν', note:'Период и частота — обратные величины.'},
      {keys:['волна','длина волны'], title:'Связь скорости волны', formula:'v = λ · ν', note:'Скорость волны равна произведению длины волны на частоту.'},
      {keys:['ом','сила тока','напряжение','сопротивление'], title:'Закон Ома', formula:'I = U / R', note:'Сила тока равна напряжению, делённому на сопротивление.'},
      {keys:['кулон','заряд'], title:'Закон Кулона', formula:'F = k · |q₁q₂| / r²', note:'Сила взаимодействия зарядов обратно пропорциональна квадрату расстояния.'}
    ];
    const q = normalize(query);
    hints.forEach(h => {
      if(h.keys.some(k => q.includes(normalize(k)))) items.push(h);
    });
    if(items.length) return items[0];

    (db.theory || []).forEach(section => {
      (section.sections || []).forEach(sub => {
        (sub.formulas || []).forEach(f => {
          const field = normalize(`${section.title} ${sub.title} ${f}`);
          if(tokenize(q).some(w => field.includes(w))) items.push({title: `${section.title}: ${sub.title}`, formula: f, note:'Формула найдена в базе теории ФизСтарт.'});
        });
      });
    });
    return items[0] || null;
  }

  function parseNumberAfter(text, words){
    const q = normalize(text).replace(',', '.');
    for(const word of words){
      const re = new RegExp(`${word}[^0-9-]*(-?\\d+(?:\\.\\d+)?)`, 'i');
      const m = q.match(re);
      if(m) return Number(m[1]);
    }
    return null;
  }

  function trySolveSimpleTask(query){
    const q = normalize(query).replace(',', '.');
    const nums = (q.match(/-?\d+(?:\.\d+)?/g) || []).map(Number);

    if((q.includes('скорост') || q.includes('v ')) && (q.includes('время') || q.includes('сек') || q.includes(' с')) && (q.includes('путь') || q.includes('расстояние') || q.includes('прош'))){
      const v = parseNumberAfter(q, ['скорость', 'v']) ?? nums[0];
      const t = parseNumberAfter(q, ['время', 'секунд', 'секунды']) ?? nums.find(n => n !== v);
      if(Number.isFinite(v) && Number.isFinite(t)){
        const s = v * t;
        return `Это задача на равномерное движение.\n\n**Дано:**\nскорость v = ${v} м/с\nвремя t = ${t} с\n\n**Формула:** S = v · t\n\n**Решение:**\nS = ${v} · ${t} = **${round(s)} м**\n\nОтвет: **${round(s)}**.`;
      }
    }

    if(q.includes('кинет') && q.includes('энерг') && (q.includes('масс') || q.includes('кг')) && (q.includes('скорост') || q.includes('м/с'))){
      const m = parseNumberAfter(q, ['масса', 'массой']) ?? nums[0];
      const v = parseNumberAfter(q, ['скорость', 'скоростью']) ?? nums.find(n => n !== m);
      if(Number.isFinite(m) && Number.isFinite(v)){
        const e = m * v * v / 2;
        return `Это задача на кинетическую энергию.\n\n**Дано:**\nмасса m = ${m} кг\nскорость v = ${v} м/с\n\n**Формула:** Eₖ = m · v² / 2\n\n**Решение:**\nEₖ = ${m} · ${v}² / 2 = **${round(e)} Дж**\n\nОтвет: **${round(e)}**.`;
      }
    }

    if((q.includes('сила') || q.includes('f')) && q.includes('масс') && q.includes('ускор')){
      const f = parseNumberAfter(q, ['сила', 'f']) ?? nums[0];
      const m = parseNumberAfter(q, ['масса', 'массой']) ?? nums.find(n => n !== f);
      if(Number.isFinite(f) && Number.isFinite(m)){
        const a = f / m;
        return `Это задача на второй закон Ньютона.\n\n**Дано:**\nсила F = ${f} Н\nмасса m = ${m} кг\n\n**Формула:** F = m · a, значит a = F / m\n\n**Решение:**\na = ${f} / ${m} = **${round(a)} м/с²**\n\nОтвет: **${round(a)}**.`;
      }
    }

    if(q.includes('потенциаль') && q.includes('энерг') && q.includes('масс') && (q.includes('высот') || q.includes(' h'))){
      const m = parseNumberAfter(q, ['масса', 'массой']) ?? nums[0];
      const h = parseNumberAfter(q, ['высота', 'высоте', 'h']) ?? nums.find(n => n !== m);
      if(Number.isFinite(m) && Number.isFinite(h)){
        const e = m * 10 * h;
        return `Это задача на потенциальную энергию в поле тяжести.\n\nБерём g = 10 м/с² для ЕГЭ.\n\n**Формула:** Eₚ = m · g · h\n\n**Решение:**\nEₚ = ${m} · 10 · ${h} = **${round(e)} Дж**\n\nОтвет: **${round(e)}**.`;
      }
    }

    return null;
  }

  function round(n){
    return Number.isInteger(n) ? String(n) : String(Math.round(n * 1000) / 1000);
  }

  function buildPlan(query){
    const daysMatch = normalize(query).match(/(\d+)\s*(дн|день|дня|дней)/);
    const days = daysMatch ? Number(daysMatch[1]) : 30;
    const goalMatch = normalize(query).match(/(60|70|80|90|100)\+?/);
    const goal = goalMatch ? goalMatch[1] + '+' : '80+';
    const weeks = Math.max(1, Math.ceil(days / 7));
    const topics = ['Механика', 'МКТ и термодинамика', 'Электродинамика', 'Оптика', 'Квантовая физика', 'Полные тренировочные варианты'];
    const plan = Array.from({length: weeks}).map((_, i) => `Неделя ${i+1}: ${topics[i % topics.length]} — теория, 20–30 заданий, один мини-тест`).join('\n');
    return `Составляю план подготовки к ЕГЭ на **${days} дней** с целью **${goal} баллов**.\n\n${plan}\n\nКаждый день:\n1. 20 минут — повтор формул.\n2. 40–60 минут — теория или разбор ошибок.\n3. 40–60 минут — задания.\n4. 10 минут — записать ошибки в список слабых тем.\n\nРаз в неделю проходи один тренировочный вариант с таймером 3:55:00.`;
  }

  function checkSolution(query){
    const q = normalize(query);
    if(q.includes('проверь') || q.includes('решение')){
      const hasFormula = /[=]|s\s*=|f\s*=|e\s*=|p\s*=|a\s*=/.test(q);
      const hasUnits = /(м|дж|н|кг|с|вт|па|ом|кл|гн|а)\b/.test(q);
      if(hasFormula && hasUnits){
        return `Я вижу в решении формулу и единицы измерения — это хороший знак.\n\nПроверка по шагам:\n1. **Формула есть** — хорошо.\n2. **Подстановка чисел есть** — проверь, все ли величины переведены в СИ.\n3. **Единицы указаны** — хорошо.\n\nЧтобы проверить точнее, пришли полное условие задачи и все шаги решения. Тогда я скажу, где верно, а где ошибка.`;
      }
      return `Давай проверим решение правильно. Пришли его в таком виде:\n\n1. Дано.\n2. Формула.\n3. Подстановка чисел.\n4. Ответ.\n\nЯ отмечу каждый шаг: **верно**, **ошибка** или **нужно уточнить**.`;
    }
    return null;
  }

  function searchTask(query){
    const db = getDB();
    const words = tokenize(query);
    const tasks = (db.tasks || []).map(t => {
      const text = normalize(`${t.number} ${t.topic} ${t.subtopic || ''} ${t.question}`);
      let score = 0;
      words.forEach(w => { if(text.includes(w)) score += 1; });
      return {...t, score};
    }).filter(t => t.score > 0).sort((a,b)=>b.score-a.score).slice(0, 2);
    return tasks;
  }

  function buildLocalAnswer(query){
    const q = normalize(query);

    const solved = trySolveSimpleTask(query);
    if(solved) return solved;

    const checked = checkSolution(query);
    if(checked) return checked;

    if(q.includes('план') || q.includes('подготов') || q.includes('дней') || q.includes('балл')){
      return buildPlan(query);
    }

    if(q.includes('формул') || q.includes('найди') || q.includes('какая формула') || q.includes('закон')){
      const f = findFormula(query);
      if(f){
        return `Нашёл подходящую формулу.\n\n**${f.title}**\n\n${f.formula}\n\n${f.note}\n\nКак применять:\n1. Выпиши данные из условия.\n2. Переведи всё в СИ.\n3. Подставь числа в формулу.\n4. Проверь единицы измерения.`;
      }
    }

    const matches = findBestTheory(query);
    if(matches.length){
      const main = matches[0];
      const formulas = (main.formulas || []).slice(0, 5).map(f => `• ${f}`).join('\n');
      const example = main.example ? `\n\n**Пример:**\n${main.example}` : '';
      const mistakes = (main.mistakes || []).length ? `\n\n**Частые ошибки:**\n${main.mistakes.slice(0,4).map(m=>'• '+m).join('\n')}` : '';
      return `Тема найдена в базе: **${main.title}**.\n\n${shorten(main.text, 900)}\n\n${formulas ? '**Основные формулы:**\n' + formulas : ''}${example}${mistakes}\n\nХочешь, я дам 3 задания для закрепления этой темы?`;
    }

    const taskMatches = searchTask(query);
    if(taskMatches.length){
      const lines = taskMatches.map(t => `**${t.number || 'Задание'} · ${t.topic}**\n${t.question}\nПодсказка: сначала определи формулу, затем подставь данные.`).join('\n\n');
      return `Я нашёл похожие задания в банке:\n\n${lines}`;
    }

    return `Я понял запрос, но хочу уточнить тему.\n\nНапиши одним из способов:\n• «Объясни кинематику»\n• «Найди формулу для силы Архимеда»\n• «Реши задачу: скорость 8 м/с, время 12 с»\n• «Проверь решение: ...»\n\nТак я дам точный учебный разбор.`;
  }

  function shorten(text, limit){
    text = String(text || '').replace(/\s+/g, ' ').trim();
    return text.length > limit ? text.slice(0, limit).trim() + '…' : text;
  }

  async function askApi(message){
    const context = findBestTheory(message).map(m => `${m.title}: ${shorten(m.text, 1200)}`).join('\n\n');
    const response = await fetch(AI_CONFIG.endpoint, {
      method: 'POST',
      headers: {'Content-Type':'application/json'},
      body: JSON.stringify({message, context, history: state.chat.slice(-8)})
    });
    if(!response.ok) throw new Error('AI API недоступен');
    const data = await response.json();
    return data.answer || 'AI ответил пустым сообщением.';
  }

  async function sendPrompt(prompt){
    const message = String(prompt || els.input.value || '').trim();
    if(!message) return;
    els.input.value = '';
    addMessage('user', message);
    state.history = [message, ...state.history.filter(h => h !== message)].slice(0, 12);
    renderHistory();
    save();

    const loader = addMessage('bot', 'Думаю над ответом…', false);
    try{
      let answer;
      if(AI_CONFIG.mode === 'api'){
        answer = await askApi(message);
      } else {
        await new Promise(r => setTimeout(r, 350));
        answer = buildLocalAnswer(message);
      }
      loader.remove();
      addMessage('bot', answer);
    }catch(err){
      loader.remove();
      const fallback = buildLocalAnswer(message);
      addMessage('bot', `Не получилось подключиться к backend AI, поэтому отвечаю в локальном режиме.\n\n${fallback}`);
    }
  }

  els.send.onclick = () => sendPrompt();
  els.input.addEventListener('keydown', (e) => {
    if(e.key === 'Enter' && !e.shiftKey){
      e.preventDefault();
      sendPrompt();
    }
  });

  document.addEventListener('click', (e) => {
    const promptButton = e.target.closest('[data-prompt]');
    if(promptButton){
      e.preventDefault();
      sendPrompt(promptButton.dataset.prompt);
      return;
    }
    const action = e.target.closest('.ai-action');
    if(action){
      document.querySelectorAll('.ai-action').forEach(btn => btn.classList.remove('active'));
      action.classList.add('active');
    }
  });

  if(els.clear){
    els.clear.onclick = () => {
      state.chat = [];
      localStorage.removeItem('fizstart_ai_chat');
      els.messages.innerHTML = `
        <div class="msg bot rich-ai-answer">
          <b>ФизСтарт AI:</b>
          <p>Чат очищен. Напиши вопрос по физике, и я помогу разобраться.</p>
        </div>`;
    };
  }

  renderSavedChat();
  renderHistory();
  updateModeLabel();
})();
