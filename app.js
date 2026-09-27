const pages = document.querySelectorAll('.page');
const links = document.querySelectorAll('.nav-link, .open-page');

function openPage(id){
  pages.forEach(p=>p.classList.toggle('active',p.id===id));
  document.querySelectorAll('.nav-link').forEach(a=>a.classList.toggle('active',a.dataset.page===id));
  if(id === 'profile') window.FizStartAuth?.renderProfile?.();
  window.scrollTo({top:0,behavior:'smooth'});
}

links.forEach(el=>el.addEventListener('click',e=>{
  e.preventDefault();
  openPage(el.dataset.page);
}));

document.getElementById('themeBtn').onclick=()=>document.body.classList.toggle('dark');

document.getElementById('aiSend').onclick=()=>{
  const input=document.getElementById('aiInput');
  if(!input.value.trim()) return;
  const chat=document.querySelector('.chat');
  const msg=document.createElement('div');
  msg.className='msg user';
  msg.textContent=input.value;
  chat.insertBefore(msg, document.querySelector('.quick'));
  const bot=document.createElement('div');
  bot.className='msg bot';
  bot.innerHTML='<b>ФизСтарт AI:</b><br>Давай разберём это шаг за шагом. Сначала определим тему, выпишем данные и выберем формулу. Потом решим и проверим ответ.';
  chat.insertBefore(bot, document.querySelector('.quick'));
  input.value='';
};

function normalizeAnswer(value){
  return String(value || '')
    .toLowerCase()
    .replace(',', '.')
    .replace(/ё/g, 'е')
    .replace(/\s+/g, ' ')
    .replace(/−/g, '-')
    .replace(/–/g, '-')
    .replace(/10\^15/g, '1e15')
    .replace(/2\*10\^8/g, '2e8')
    .replace(/2·10\^8/g, '2e8')
    .trim();
}


function escapeHtml(value){
  return String(value || '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}

function formatRichText(value){
  return escapeHtml(value).replace(/\n/g, '<br>');
}

function renderTheory(){
  const list = document.getElementById('theoryList');
  const detail = document.getElementById('theoryDetail');
  if(!list || !detail) return;
  detail.hidden = true;
  list.hidden = false;
  list.innerHTML = FIZSTART_DB.theory.map(item => `
    <article class="theory-card" data-theory-id="${item.id}">
      <div class="theory-icon">${getTheoryIcon(item.id)}</div>
      <div class="task-meta">
        <span class="pill">${item.sections.length} подразделов</span>
        <span class="pill">материалы + задания</span>
      </div>
      <h3>${item.title}</h3>
      <p>${item.description}</p>
      <div class="details">
        <b>Подразделы:</b> ${item.sections.map(s=>s.title).join(', ')}
      </div>
      <button class="primary small open-theory" data-theory-id="${item.id}">Открыть подразделы</button>
    </article>
  `).join('');
}

function getTheoryIcon(id){
  const icons = { mechanics:'⚙️', mkt:'🌡️', electro:'⚡', oscillations:'〰️', optics:'🔭', quantum:'⚛️' };
  return icons[id] || '📘';
}

function openTheorySubsections(theoryId){
  const list = document.getElementById('theoryList');
  const detail = document.getElementById('theoryDetail');
  const theory = FIZSTART_DB.theory.find(item => item.id === theoryId);
  if(!theory || !list || !detail) return;

  list.hidden = true;
  detail.hidden = false;
  detail.innerHTML = `
    <button class="ghost small" id="backToTheory">← Назад ко всем разделам</button>
    <div class="material-hero">
      <div>
        <p class="label">РАЗДЕЛ ТЕОРИИ</p>
        <h2>${theory.title}</h2>
        <p class="muted">${theory.description}</p>
        <div class="formula-list big">
          ${theory.formulas.map(f=>`<span class="formula">${f}</span>`).join('')}
        </div>
      </div>
      <div class="material-progress">
        <b>${theory.sections.length}</b>
        <span>подразделов внутри</span>
        <p>Открой подраздел, изучи материал и сразу закрепи его заданиями.</p>
      </div>
    </div>

    <h3 class="block-title">Подразделы раздела «${theory.title}»</h3>
    <div class="subsection-grid">
      ${theory.sections.map((section, index) => `
        <article class="subsection-card">
          <div class="subtopic-head">
            <span class="number">${String(index + 1).padStart(2,'0')}</span>
            <div>
              <h3>${section.title}</h3>
              <div class="task-meta">
                <span class="pill">${section.level}</span>
                <span class="pill">${section.duration}</span>
                <span class="pill">${section.practice.length} задания</span>
              </div>
            </div>
          </div>
          <p>${section.goal}</p>
          <div class="formula-list">${section.formulas.slice(0,3).map(f=>`<span class="formula">${f}</span>`).join('')}</div>
          <button class="primary small open-subtopic" data-theory-id="${theory.id}" data-section-index="${index}">Открыть материал</button>
        </article>
      `).join('')}
    </div>
  `;
  document.getElementById('backToTheory').onclick = renderTheory;
  window.scrollTo({top:0,behavior:'smooth'});
}

function openSubtopicMaterial(theoryId, sectionIndex){
  const list = document.getElementById('theoryList');
  const detail = document.getElementById('theoryDetail');
  const theory = FIZSTART_DB.theory.find(item => item.id === theoryId);
  const section = theory?.sections[Number(sectionIndex)];
  if(!theory || !section || !list || !detail) return;

  list.hidden = true;
  detail.hidden = false;
  detail.innerHTML = `
    <button class="ghost small" id="backToSubsections">← Назад к подразделам</button>

    <div class="lesson-layout">
      <article class="lesson-main">
        <p class="label">МАТЕРИАЛ</p>
        <h2>${section.title}</h2>
        <p class="muted">${theory.title} · ${section.level} · ${section.duration}</p>

        <div class="lesson-block"><h3>Цель урока</h3><p>${section.goal}</p></div>
        <div class="lesson-block"><h3>Теория</h3><div class="rich-text">${formatRichText(section.text)}</div></div>
        <div class="lesson-block"><h3>Основные формулы</h3><div class="formula-list big">${section.formulas.map(f=>`<span class="formula">${f}</span>`).join('')}</div></div>
        <div class="lesson-block"><h3>Пример решения</h3><p class="example">${section.example}</p></div>
        <div class="lesson-block"><h3>Типичные ошибки</h3><ul>${section.mistakes.map(m=>`<li>${m}</li>`).join('')}</ul></div>

        <div class="complete-box">
          <h3>Материал пройден?</h3>
          <p>После изучения материала реши задания ниже, чтобы закрепить тему.</p>
          <a href="#practice-${theory.id}-${sectionIndex}" class="primary small">Перейти к заданиям</a>
        </div>
      </article>

      <aside class="lesson-side">
        <h3>Навигация</h3>
        <a href="#">Теория</a>
        <a href="#practice-${theory.id}-${sectionIndex}">Задания</a>
        <a href="#">Формулы</a>
        <div class="side-stat"><b>${section.practice.length}</b><span>задания для закрепления</span></div>
      </aside>
    </div>

    <section class="practice-zone" id="practice-${theory.id}-${sectionIndex}">
      <p class="label">ЗАКРЕПЛЕНИЕ</p>
      <h2>Задания по подразделу «${section.title}»</h2>
      <p class="muted">Реши задания после материала. Сайт проверит ответ и покажет объяснение.</p>
      <div class="practice-list">${section.practice.map((task, index) => renderAnswerCard(task, `Задание ${index+1}`, section.title, 'practice-card')).join('')}</div>
    </section>
  `;
  document.getElementById('backToSubsections').onclick = () => openTheorySubsections(theory.id);
  window.scrollTo({top:0,behavior:'smooth'});
}

function renderAnswerCard(task, label, topic, cls='task-card'){
  return `
    <article class="${cls}" data-answer="${task.answer}">
      <div class="task-meta">
        <span class="pill">${label}</span>
        <span class="pill">${topic || task.topic || ''}</span>
        ${task.difficulty ? `<span class="pill">${task.difficulty}</span>` : ''}
        ${task.unit ? `<span class="pill">ответ в ${task.unit}</span>` : ''}
      </div>
      <h3>${task.question}</h3>
      <div class="answer-box"><input placeholder="Введите ответ${task.unit ? ', ' + task.unit : ''}"><button class="primary small check-answer">Проверить</button></div>
      <div class="result"></div>
      <div class="details" hidden><b>Решение:</b> ${task.solution}</div>
    </article>
  `;
}

function renderTopicFilter(){
  const select = document.getElementById('topicFilter');
  if(!select) return;
  const topics = [...new Set(FIZSTART_DB.tasks.map(t => t.topic))];
  select.innerHTML = '<option value="">Все темы</option>' + topics.map(t=>`<option value="${t}">${t}</option>`).join('');
}

function renderTasks(){
  const box = document.getElementById('taskList');
  const search = (document.getElementById('taskSearch')?.value || '').toLowerCase();
  const topic = document.getElementById('topicFilter')?.value || '';
  if(!box) return;
  const tasks = FIZSTART_DB.tasks.filter(t => {
    const matchesSearch = `${t.topic} ${t.subtopic || ''} ${t.question} ${t.number}`.toLowerCase().includes(search);
    const matchesTopic = !topic || t.topic === topic;
    return matchesSearch && matchesTopic;
  });
  box.innerHTML = tasks.map(task => renderAnswerCard(task, `${task.number} · ${task.subtopic || ''}`, task.topic, 'task-card')).join('');
}

let examTimerInterval = null;
let currentExamId = null;

function applyTrainingVariants(){
  if(window.FIZSTART_TRAINING_VARIANTS && window.FIZSTART_DB){
    window.FIZSTART_DB.exams = window.FIZSTART_TRAINING_VARIANTS;
  }
}

function renderExams(){
  applyTrainingVariants();
  const box = document.getElementById('examList');
  const detail = document.getElementById('examDetail');
  if(!box) return;
  if(examTimerInterval){ clearInterval(examTimerInterval); examTimerInterval = null; }
  currentExamId = null;
  if(detail) detail.hidden = true;
  box.hidden = false;
  box.innerHTML = FIZSTART_DB.exams.map((exam, index) => `
    <article class="exam-card training-card">
      <div class="task-meta">
        <span class="pill">ЕГЭ</span>
        <span class="pill">3 ч 55 мин</span>
        <span class="pill">26 заданий</span>
      </div>
      <h3>Вариант ${index + 1}</h3>
      <p>Полный тренировочный вариант по физике: задания 1-20 с автоматической проверкой и задания 21-26 для развёрнутого решения.</p>
      <p class="muted small-text">Скачать вариант нельзя: задания открываются только внутри сайта.</p>
      <div class="card-actions">
        <button class="primary small open-exam" data-exam-id="${exam.id}">Начать вариант</button>
      </div>
    </article>
  `).join('');
}

function formatTime(totalSeconds){
  const h = Math.floor(totalSeconds / 3600);
  const m = Math.floor((totalSeconds % 3600) / 60);
  const s = totalSeconds % 60;
  return `${String(h).padStart(2,'0')}:${String(m).padStart(2,'0')}:${String(s).padStart(2,'0')}`;
}

function normalizeExamAnswer(value){
  return String(value || '')
    .toLowerCase()
    .replace(/ё/g, 'е')
    .replace(/−/g, '-')
    .replace(/–/g, '-')
    .replace(/,/g, '.')
    .replace(/\s+/g, '')
    .replace(/;/g, '')
    .trim();
}

function compareExamAnswer(userValue, correctValue, taskNumber, unorderedTasks=[]){
  const user = normalizeExamAnswer(userValue);
  const correct = normalizeExamAnswer(correctValue);
  if(!user) return false;
  if(user === correct) return true;
  if(unorderedTasks.includes(Number(taskNumber))){
    const cleanUser = user.replace(/\D/g,'').split('').sort().join('');
    const cleanCorrect = correct.replace(/\D/g,'').split('').sort().join('');
    return !!cleanUser && cleanUser === cleanCorrect;
  }
  return false;
}

function getTrainingVariantMedia(examId, taskNumber){
  return window.TRAINING_VARIANT_MEDIA?.[examId]?.[String(taskNumber)] || [];
}

function renderExamTaskBody(examId, task){
  const media = getTrainingVariantMedia(examId, task.number);
  const imagesHtml = media.length
    ? `<div class="task-source-images">${media.map((src, index) => `<figure class="task-source-figure"><img src="${src}" alt="${task.number === 1 ? 'Изображение задания' : 'Фрагмент задания'} ${task.number}, часть ${index + 1}" class="task-source-image" loading="lazy"></figure>`).join('')}</div>`
    : `<div class="exam-task-text">${formatTaskText(task.text)}</div>`;
  return `${imagesHtml}`;
}

function openExam(examId){
  applyTrainingVariants();
  const box = document.getElementById('examList');
  const detail = document.getElementById('examDetail');
  const exam = FIZSTART_DB.exams.find(e=>e.id===examId);
  if(!exam || !box || !detail) return;
  if(examTimerInterval){ clearInterval(examTimerInterval); examTimerInterval = null; }
  currentExamId = exam.id;
  box.hidden = true;
  detail.hidden = false;

  const tasks = exam.tasks || [];
  const taskNav = tasks.map(task => `<button type="button" class="page-jump" data-page-target="task-${task.number}">${task.number}</button>`).join('');
  const taskCards = tasks.map(task => `
    <article class="exam-task-card" id="task-${task.number}">
      <div class="task-meta"><span class="pill">Задание ${task.number}</span>${task.number <= 20 ? '<span class="pill">Автопроверка</span>' : '<span class="pill manual-pill">Развёрнутая часть</span>'}<span class="pill source-pill">Оригинал из варианта</span></div>
      ${renderExamTaskBody(exam.id, task)}
      <label class="inline-answer ${task.number > 20 ? 'manual' : ''}">
        <span>${task.number <= 20 ? 'Ответ' : 'Решение'}</span>
        ${task.number > 20
          ? `<textarea data-num="${task.number}" class="exam-answer" placeholder="Введите развёрнутое решение для №${task.number}"></textarea>`
          : `<input data-num="${task.number}" class="exam-answer" placeholder="Ответ №${task.number}">`}
      </label>
    </article>
  `).join('');

  detail.innerHTML = `
    <button class="ghost small" id="backToExams">← Назад к вариантам</button>
    <div class="exam-run-header">
      <div>
        <p class="label">ТРЕНИРОВОЧНЫЕ ВАРИАНТЫ</p>
        <h2>${exam.title}</h2>
        <p class="muted">Время выполнения: 3 часа 55 минут. Каждое задание показано внутри сайта в том виде, как оно выглядит в исходном варианте, включая графики, рисунки и таблицы. Скачать исходный файл нельзя.</p>
      </div>
      <div class="timer-card exam-control-card">
        <span>Осталось времени</span>
        <b id="examTimer">03:55:00</b>
        <small>235 минут</small>
        <div class="exam-header-actions">
          <button class="primary finish-exam" data-exam-id="${exam.id}">Завершить и проверить</button>
          <button class="ghost reset-exam" data-exam-id="${exam.id}">Очистить</button>
        </div>
      </div>
    </div>

    <div class="exam-workspace extracted-mode full-exam-workspace">
      <section class="exam-pages-panel">
        <div class="exam-panel-head sticky-head">
          <div>
            <h3>Задания варианта</h3>
            <p class="muted small-text">Решай задания по порядку. Ответы сохраняются в браузере до завершения проверки.</p>
          </div>
          <div class="page-nav">${taskNav}</div>
        </div>
        <div class="exam-tasks-list">${taskCards}</div>
      </section>

    </div>
  `;
  document.getElementById('backToExams').onclick = renderExams;
  document.querySelectorAll('.page-jump').forEach(btn => {
    btn.addEventListener('click', () => document.getElementById(btn.dataset.pageTarget)?.scrollIntoView({behavior:'smooth', block:'start'}));
  });
  document.querySelectorAll('.exam-answer').forEach(input=>{
    const saved = localStorage.getItem(`fizstart_${exam.id}_${input.dataset.num}`);
    if(saved) input.value = saved;
    input.addEventListener('input', () => localStorage.setItem(`fizstart_${exam.id}_${input.dataset.num}`, input.value));
  });
  startExamTimer(exam);
  window.scrollTo({top:0,behavior:'smooth'});
}

function formatTaskText(text){
  const safe = escapeHtml(text || 'Текст задания не найден.');
  return safe
    .split('\n')
    .map(line => line.trim() ? `<p>${line}</p>` : '')
    .join('');
}

function startExamTimer(exam){
  let remaining = (exam.duration || 235) * 60;
  const timer = document.getElementById('examTimer');
  if(timer) timer.textContent = formatTime(remaining);
  examTimerInterval = setInterval(()=>{
    remaining -= 1;
    if(timer) timer.textContent = formatTime(Math.max(remaining,0));
    if(remaining <= 0){
      clearInterval(examTimerInterval);
      examTimerInterval = null;
      finishExam(exam.id, true);
    }
  }, 1000);
}

function finishExam(examId, byTimer=false){
  const exam = FIZSTART_DB.exams.find(e=>e.id===examId);
  if(!exam) return;
  if(examTimerInterval){ clearInterval(examTimerInterval); examTimerInterval = null; }
  const keys = exam.answerKeys || {};
  const unordered = exam.unorderedTasks || [];
  const rows = [];
  let correctCount = 0;
  let wrongCount = 0;
  for(let num=1; num<=20; num++){
    const input = document.querySelector(`.exam-answer[data-num="${num}"]`);
    const user = input?.value || '';
    const correct = keys[String(num)] || '';
    const ok = compareExamAnswer(user, correct, num, unordered);
    if(ok) correctCount++; else wrongCount++;
    rows.push({num, user, correct, status: ok ? 'correct' : 'wrong'});
  }
  for(let num=21; num<=26; num++){
    const input = document.querySelector(`.exam-answer[data-num="${num}"]`);
    rows.push({num, user: input?.value || '', correct: 'Проверяется вручную по критериям', status: 'manual'});
  }
  showExamResults(exam, rows, correctCount, wrongCount, byTimer);
}

function showExamResults(exam, rows, correctCount, wrongCount, byTimer=false){
  const old = document.querySelector('.result-modal-wrap');
  if(old) old.remove();
  const percent = Math.round((correctCount / 20) * 100);
  const htmlRows = rows.map(row => `
    <tr class="${row.status}">
      <td>№${row.num}</td>
      <td>${row.status === 'correct' ? 'Верно' : row.status === 'wrong' ? 'Неверно' : 'Ручная проверка'}</td>
      <td>${escapeHtml(row.user || '—')}</td>
      <td>${escapeHtml(row.correct || '—')}</td>
    </tr>
  `).join('');
  const saveState = window.FizStartAuth?.saveExamResult?.({
    examId: exam.id,
    examTitle: exam.title,
    correctCount,
    wrongCount,
    percent,
    rows
  }) || { saved: false, reason: 'auth-module-not-loaded' };

  const saveNotice = saveState.saved
    ? '<div class="save-notice success">Результат сохранён в личном кабинете.</div>'
    : '<div class="save-notice warning">Войдите в аккаунт, чтобы сохранить этот результат в личном кабинете.</div>';

  const wrap = document.createElement('div');
  wrap.className = 'result-modal-wrap';
  wrap.innerHTML = `
    <div class="result-modal">
      <button class="modal-close" aria-label="Закрыть">×</button>
      <p class="label">РЕЗУЛЬТАТЫ</p>
      <h2>${byTimer ? 'Время вышло' : 'Вариант завершён'}</h2>
      <p class="muted">${exam.title}. Автоматически проверены задания 1–20. Задания 21–26 относятся к развёрнутой части и требуют проверки по критериям.</p>
      ${saveNotice}
      <div class="result-summary">
        <div><b>${correctCount}</b><span>верно из 20</span></div>
        <div><b>${wrongCount}</b><span>неверно / пусто</span></div>
        <div><b>${percent}%</b><span>точность</span></div>
      </div>
      <div class="result-table-wrap">
        <table class="result-table">
          <thead><tr><th>Задание</th><th>Статус</th><th>Ваш ответ</th><th>Правильный ответ</th></tr></thead>
          <tbody>${htmlRows}</tbody>
        </table>
      </div>
      <button class="primary modal-close-btn">Понятно</button>
    </div>
  `;
  document.body.appendChild(wrap);
  wrap.querySelector('.modal-close').onclick = () => wrap.remove();
  wrap.querySelector('.modal-close-btn').onclick = () => wrap.remove();
}
document.addEventListener('click', (event) => {
  const theoryButton = event.target.closest('.open-theory');
  if(theoryButton){ openTheorySubsections(theoryButton.dataset.theoryId); return; }

  const theoryCard = event.target.closest('.theory-card');
  if(theoryCard && !event.target.closest('button')){ openTheorySubsections(theoryCard.dataset.theoryId); return; }

  const subtopicButton = event.target.closest('.open-subtopic');
  if(subtopicButton){ openSubtopicMaterial(subtopicButton.dataset.theoryId, subtopicButton.dataset.sectionIndex); return; }

  const examButton = event.target.closest('.open-exam');
  if(examButton){ openExam(examButton.dataset.examId); return; }

  const finishButton = event.target.closest('.finish-exam');
  if(finishButton){ finishExam(finishButton.dataset.examId); return; }

  const resetButton = event.target.closest('.reset-exam');
  if(resetButton){
    const examId = resetButton.dataset.examId;
    document.querySelectorAll('.exam-answer').forEach(input => { input.value = ''; localStorage.removeItem(`fizstart_${examId}_${input.dataset.num}`); });
    return;
  }

  if(!event.target.classList.contains('check-answer')) return;
  const card = event.target.closest('.task-card, .practice-card, .exam-task-card');
  const input = card.querySelector('input');
  const result = card.querySelector('.result');
  const details = card.querySelector('.details');
  const correct = normalizeAnswer(card.dataset.answer);
  const user = normalizeAnswer(input.value);
  if(!user){ result.textContent = 'Введите ответ перед проверкой.'; result.style.color = '#f04a08'; return; }
  if(user === correct){ result.textContent = 'Верно ✅'; result.style.color = '#20a464'; }
  else { result.textContent = `Неверно. Правильный ответ: ${card.dataset.answer}`; result.style.color = '#f04a08'; }
  details.hidden = false;
});

document.getElementById('taskSearch')?.addEventListener('input', renderTasks);
document.getElementById('topicFilter')?.addEventListener('change', renderTasks);

async function initializeKnowledgeBase(){
  const status = document.getElementById('dbStatus');
  if(status) status.textContent = 'Загрузка базы...';

  try {
    if(window.FizStartSupabase?.isConfigured()){
      const remoteData = await window.FizStartSupabase.loadDataFromSupabase();
      if(remoteData){
        window.FIZSTART_DB = remoteData;
        if(status) status.textContent = 'Supabase подключён';
      }
    } else {
      if(status) status.textContent = 'Локальная база';
    }
  } catch (error) {
    console.error('Ошибка загрузки Supabase:', error);
    window.FIZSTART_DB = window.LOCAL_FIZSTART_DB || window.FIZSTART_DB;
    if(status) status.textContent = 'Локальная база';
  }

  applyTrainingVariants();
  renderTheory();
  renderTopicFilter();
  renderTasks();
  renderExams();
}

initializeKnowledgeBase();
