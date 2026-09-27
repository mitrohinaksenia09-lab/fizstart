
(function(){
  const STORAGE = {
    users: 'fizstart_users_v1',
    current: 'fizstart_current_user_v1',
    results: 'fizstart_results_v1'
  };

  const OAUTH_CONFIG = {
    mode: 'demo',
    // Для реального режима сюда добавляются client_id и redirect_uri VK / Яндекс ID.
    // В демо-режиме кнопки создают локальный аккаунт, чтобы можно было тестировать личный кабинет без сервера.
    vkClientId: '',
    yandexClientId: '',
    redirectUri: window.location.origin + window.location.pathname
  };

  const $ = (selector) => document.querySelector(selector);

  function read(key, fallback){
    try { return JSON.parse(localStorage.getItem(key)) ?? fallback; }
    catch { return fallback; }
  }

  function write(key, value){
    localStorage.setItem(key, JSON.stringify(value));
  }

  function setMessage(text, type='info'){
    const box = $('#authMessage');
    if(!box) return;
    box.textContent = text;
    box.className = `auth-message ${type}`;
  }

  function getUsers(){
    return read(STORAGE.users, []);
  }

  function saveUsers(users){
    write(STORAGE.users, users);
  }

  function simpleHash(value){
    return btoa(unescape(encodeURIComponent(String(value))));
  }

  function publicUser(user){
    if(!user) return null;
    const { password, ...safe } = user;
    return safe;
  }

  function getCurrentUser(){
    return read(STORAGE.current, null);
  }

  function setCurrentUser(user){
    write(STORAGE.current, publicUser(user));
    updateAuthUI();
  }

  function logout(){
    localStorage.removeItem(STORAGE.current);
    updateAuthUI();
    setMessage('Вы вышли из аккаунта.', 'info');
  }

  function requireConsent(checkboxId){
    const checkbox = document.getElementById(checkboxId);
    return !!checkbox?.checked;
  }

  function registerEmail({ name, email, password }){
    const cleanEmail = String(email || '').trim().toLowerCase();
    const cleanName = String(name || '').trim();
    if(!cleanName) throw new Error('Введите имя.');
    if(!cleanEmail.includes('@')) throw new Error('Введите корректный e-mail.');
    if(String(password || '').length < 6) throw new Error('Пароль должен быть не короче 6 символов.');
    if(!requireConsent('registerPersonal')) throw new Error('Нужно согласиться с обработкой персональных данных.');

    const users = getUsers();
    if(users.some(u => u.email === cleanEmail)) throw new Error('Пользователь с таким e-mail уже существует.');

    const user = {
      id: `email_${Date.now()}`,
      name: cleanName,
      email: cleanEmail,
      provider: 'email',
      password: simpleHash(password),
      createdAt: new Date().toISOString()
    };

    users.push(user);
    saveUsers(users);
    setCurrentUser(user);
    setMessage('Аккаунт создан. Теперь результаты будут сохраняться в личном кабинете.', 'success');
    return user;
  }

  function loginEmail({ email, password }){
    const cleanEmail = String(email || '').trim().toLowerCase();
    if(!requireConsent('loginPersonal')) throw new Error('Нужно согласиться с обработкой персональных данных.');

    const user = getUsers().find(u => u.email === cleanEmail && u.password === simpleHash(password));
    if(!user) throw new Error('Неверный e-mail или пароль.');

    setCurrentUser(user);
    setMessage('Вы вошли в аккаунт. Результаты вариантов будут сохраняться.', 'success');
    return user;
  }

  function loginOAuth(provider){
    if(OAUTH_CONFIG.mode === 'oauth'){
      // Заготовка для реального OAuth-режима.
      // Реальные client_id, redirect_uri и обработчик callback нужно подключать после регистрации приложения в VK / Яндекс ID.
      setMessage(`OAuth для ${provider === 'vk' ? 'VK' : 'Яндекс ID'} требует настройки приложения и callback URL. Сейчас включён локальный режим.`, 'info');
    }

    const providerName = provider === 'vk' ? 'VK' : 'Яндекс ID';
    const users = getUsers();
    const id = `oauth_${provider}`;
    let user = users.find(u => u.id === id);

    if(!user){
      user = {
        id,
        name: provider === 'vk' ? 'Пользователь VK' : 'Пользователь Яндекс',
        email: provider === 'vk' ? 'vk-user@fizstart.local' : 'yandex-user@fizstart.local',
        provider,
        createdAt: new Date().toISOString()
      };
      users.push(user);
      saveUsers(users);
    }

    setCurrentUser(user);
    setMessage(`Вход через ${providerName} выполнен в демо-режиме. Результаты будут сохраняться в этом аккаунте.`, 'success');
    return user;
  }

  function getAllResults(){
    return read(STORAGE.results, {});
  }

  function getUserResults(userId){
    const all = getAllResults();
    return all[userId] || [];
  }

  function saveExamResult(result){
    const user = getCurrentUser();
    if(!user){
      return { saved: false, reason: 'not-authenticated' };
    }

    const all = getAllResults();
    const userResults = all[user.id] || [];
    userResults.unshift({
      id: `result_${Date.now()}`,
      examId: result.examId,
      examTitle: result.examTitle,
      correctCount: result.correctCount,
      wrongCount: result.wrongCount,
      percent: result.percent,
      rows: result.rows || [],
      createdAt: new Date().toISOString()
    });

    all[user.id] = userResults.slice(0, 50);
    write(STORAGE.results, all);
    renderProfile();
    return { saved: true };
  }

  function clearCurrentUserResults(){
    const user = getCurrentUser();
    if(!user) return;
    const all = getAllResults();
    all[user.id] = [];
    write(STORAGE.results, all);
    renderProfile();
  }

  function formatDate(value){
    const date = new Date(value);
    return date.toLocaleDateString('ru-RU', { day:'2-digit', month:'2-digit', year:'numeric', hour:'2-digit', minute:'2-digit' });
  }

  function providerLabel(provider){
    if(provider === 'vk') return 'VK';
    if(provider === 'yandex') return 'Яндекс ID';
    return 'E-mail';
  }

  function renderProfile(){
    const user = getCurrentUser();
    const userBox = $('#profileUserBox');
    const list = $('#profileResultsList');
    if(!userBox || !list) return;

    if(!user){
      userBox.innerHTML = `<b>Гость</b><span>Войдите, чтобы видеть результаты</span>`;
      $('#profileAttempts').textContent = '0';
      $('#profileBest').textContent = '0%';
      $('#profileAverage').textContent = '0%';
      $('#profileLast').textContent = '—';
      list.innerHTML = `
        <div class="empty-results">
          <h3>Результаты пока не сохранены</h3>
          <p>Войдите или зарегистрируйтесь, затем решите тренировочный вариант.</p>
          <button class="primary open-page" data-page="login">Войти</button>
        </div>
      `;
      return;
    }

    const results = getUserResults(user.id);
    const best = results.length ? Math.max(...results.map(r => r.percent || 0)) : 0;
    const avg = results.length ? Math.round(results.reduce((sum, r) => sum + (r.percent || 0), 0) / results.length) : 0;

    userBox.innerHTML = `<b>${user.name}</b><span>${providerLabel(user.provider)} · ${user.email}</span>`;
    $('#profileAttempts').textContent = String(results.length);
    $('#profileBest').textContent = `${best}%`;
    $('#profileAverage').textContent = `${avg}%`;
    $('#profileLast').textContent = results[0]?.examTitle || '—';

    if(!results.length){
      list.innerHTML = `
        <div class="empty-results">
          <h3>Нет сохранённых попыток</h3>
          <p>Открой раздел «Тренировочные варианты», реши вариант и нажми «Завершить и проверить».</p>
          <button class="primary open-page" data-page="tests">Решить вариант</button>
        </div>
      `;
      return;
    }

    list.innerHTML = results.map(item => `
      <article class="result-history-item">
        <div>
          <h3>${item.examTitle}</h3>
          <p>${formatDate(item.createdAt)}</p>
        </div>
        <div class="result-history-stats">
          <span><b>${item.correctCount}</b> верно</span>
          <span><b>${item.wrongCount}</b> неверно</span>
          <strong>${item.percent}%</strong>
        </div>
      </article>
    `).join('');
  }

  function updateAuthUI(){
    const user = getCurrentUser();
    const currentUserCard = $('#currentUserCard');
    const currentUserText = $('#currentUserText');
    const loginButtons = document.querySelectorAll('[data-page="login"]');
    const profileLink = document.querySelector('.nav-link[data-page="profile"]');

    if(currentUserCard && currentUserText){
      currentUserCard.hidden = !user;
      if(user){
        currentUserText.textContent = `${user.name} · ${providerLabel(user.provider)} · ${user.email}`;
      }
    }

    loginButtons.forEach(button => {
      if(user && button.tagName === 'BUTTON') button.textContent = 'Кабинет';
      if(!user && button.tagName === 'BUTTON') button.textContent = 'Войти';
      if(user && button.classList.contains('open-page')) button.dataset.page = 'profile';
      if(!user && button.classList.contains('open-page')) button.dataset.page = 'login';
    });

    if(profileLink){
      profileLink.style.display = user ? '' : '';
    }

    renderProfile();
  }

  function setupAuth(){
    document.querySelectorAll('.auth-tab').forEach(button => {
      button.addEventListener('click', () => {
        document.querySelectorAll('.auth-tab').forEach(b => b.classList.remove('active'));
        document.querySelectorAll('.auth-form-v2').forEach(f => f.classList.remove('active'));
        button.classList.add('active');
        document.getElementById(`${button.dataset.authTab}Form`)?.classList.add('active');
        setMessage('');
      });
    });

    document.getElementById('registerForm')?.addEventListener('submit', (event) => {
      event.preventDefault();
      try {
        registerEmail({
          name: $('#registerName').value,
          email: $('#registerEmail').value,
          password: $('#registerPassword').value
        });
      } catch(error){
        setMessage(error.message, 'error');
      }
    });

    document.getElementById('loginForm')?.addEventListener('submit', (event) => {
      event.preventDefault();
      try {
        loginEmail({
          email: $('#loginEmail').value,
          password: $('#loginPassword').value
        });
      } catch(error){
        setMessage(error.message, 'error');
      }
    });

    document.querySelectorAll('.oauth-btn').forEach(button => {
      button.addEventListener('click', () => loginOAuth(button.dataset.provider));
    });

    document.getElementById('logoutBtn')?.addEventListener('click', logout);
    document.getElementById('clearResultsBtn')?.addEventListener('click', clearCurrentUserResults);

    document.addEventListener('click', (event) => {
      const openButton = event.target.closest('.open-page');
      if(openButton?.dataset.page === 'profile'){
        setTimeout(renderProfile, 0);
      }
    });

    updateAuthUI();
  }

  window.FizStartAuth = {
    getCurrentUser,
    saveExamResult,
    renderProfile,
    logout
  };

  document.addEventListener('DOMContentLoaded', setupAuth);
})();
