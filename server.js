import 'dotenv/config';
import express from 'express';
import cors from 'cors';
import OpenAI from 'openai';

const app = express();
const port = process.env.PORT || 3001;

app.use(cors());
app.use(express.json({ limit: '1mb' }));
app.use(express.static('.'));

const client = process.env.OPENAI_API_KEY ? new OpenAI({ apiKey: process.env.OPENAI_API_KEY }) : null;

const SYSTEM_PROMPT = `Ты — ФизСтарт AI, учебный помощник по ЕГЭ по физике.
Отвечай на русском языке, понятно для 10–11 класса.
Не просто выдавай ответ: веди ученика по шагам.
Структура ответа для задач: Дано → Формула → Решение → Ответ → Проверка.
Для теории: простое объяснение → формулы → пример → типичная ошибка.
Если данных не хватает, задай уточняющий вопрос.
Не выдумывай факты, если в контексте нет ответа.`;

app.post('/api/ai', async (req, res) => {
  try {
    if (!client) {
      return res.status(503).json({ error: 'OPENAI_API_KEY не задан. Используйте локальный режим или добавьте ключ в .env.' });
    }

    const { message, context = '', history = [] } = req.body || {};
    if (!message || typeof message !== 'string') {
      return res.status(400).json({ error: 'Поле message обязательно.' });
    }

    const historyText = Array.isArray(history)
      ? history.slice(-8).map(item => `${item.role === 'user' ? 'Ученик' : 'AI'}: ${item.text}`).join('\n')
      : '';

    const response = await client.responses.create({
      model: process.env.OPENAI_MODEL || 'gpt-5.6',
      input: [
        { role: 'system', content: SYSTEM_PROMPT },
        {
          role: 'user',
          content: `Контекст из базы ФизСтарт:\n${context || 'Контекст не передан.'}\n\nИстория диалога:\n${historyText || 'Истории нет.'}\n\nВопрос ученика:\n${message}`
        }
      ]
    });

    res.json({ answer: response.output_text || 'Не удалось получить текст ответа.' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Ошибка AI backend', details: error.message });
  }
});

app.listen(port, () => {
  console.log(`ФизСтарт запущен: http://localhost:${port}`);
});
