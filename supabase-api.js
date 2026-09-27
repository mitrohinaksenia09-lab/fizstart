(function(){
  function isConfigured(){
    const cfg = window.SUPABASE_CONFIG || {};
    return Boolean(
      cfg.enabled &&
      cfg.url &&
      cfg.anonKey &&
      !cfg.url.includes('YOUR-PROJECT') &&
      !cfg.anonKey.includes('YOUR-ANON') &&
      window.supabase
    );
  }

  function createClient(){
    const cfg = window.SUPABASE_CONFIG;
    return window.supabase.createClient(cfg.url, cfg.anonKey);
  }

  function byOrder(a,b){ return (a.sort_order || 0) - (b.sort_order || 0); }

  async function selectAll(client, table){
    const { data, error } = await client.from(table).select('*');
    if(error) throw new Error(`${table}: ${error.message}`);
    return data || [];
  }

  async function loadDataFromSupabase(){
    if(!isConfigured()) return null;
    const client = createClient();

    const [
      theoryRows,
      subsectionRows,
      formulaRows,
      mistakeRows,
      practiceRows,
      taskRows,
      examRows,
      examTaskRows
    ] = await Promise.all([
      selectAll(client, 'theory_sections'),
      selectAll(client, 'theory_subsections'),
      selectAll(client, 'formulas'),
      selectAll(client, 'mistakes'),
      selectAll(client, 'practice_tasks'),
      selectAll(client, 'tasks'),
      selectAll(client, 'exams'),
      selectAll(client, 'exam_tasks')
    ]);

    const formulasByTheory = groupBy(formulaRows.filter(f => f.theory_id && !f.subsection_id), 'theory_id');
    const formulasBySubsection = groupBy(formulaRows.filter(f => f.subsection_id), 'subsection_id');
    const mistakesBySubsection = groupBy(mistakeRows, 'subsection_id');
    const practiceBySubsection = groupBy(practiceRows, 'subsection_id');
    const subsectionsByTheory = groupBy(subsectionRows, 'theory_id');
    const examTasksByExam = groupBy(examTaskRows, 'exam_id');

    const theory = theoryRows.sort(byOrder).map(section => {
      const subsections = (subsectionsByTheory[section.id] || []).sort(byOrder).map(sub => ({
        id: sub.id,
        title: sub.title,
        level: sub.level,
        duration: sub.duration,
        goal: sub.goal,
        text: sub.text,
        formulas: (formulasBySubsection[sub.id] || []).sort(byOrder).map(f => f.formula),
        example: sub.example,
        mistakes: (mistakesBySubsection[sub.id] || []).sort(byOrder).map(m => m.text),
        practice: (practiceBySubsection[sub.id] || []).sort(byOrder).map(toTaskShape)
      }));

      return {
        id: section.id,
        title: section.title,
        progress: section.progress || 0,
        description: section.description,
        topics: subsections.map(s => s.title),
        formulas: (formulasByTheory[section.id] || []).sort(byOrder).map(f => f.formula),
        sections: subsections
      };
    });

    const exams = examRows.sort(byOrder).map(exam => ({
      id: exam.id,
      title: exam.title,
      description: exam.description,
      level: exam.level,
      duration: exam.duration,
      tasks: (examTasksByExam[exam.id] || []).sort(byOrder).map(toTaskShape)
    }));

    return {
      theory,
      tasks: taskRows.sort(byOrder).map(toTaskShape),
      exams
    };
  }

  function groupBy(rows, key){
    return rows.reduce((acc, row) => {
      const value = row[key];
      if(!value) return acc;
      if(!acc[value]) acc[value] = [];
      acc[value].push(row);
      return acc;
    }, {});
  }

  function toTaskShape(row){
    return {
      id: row.id,
      number: row.number,
      topic: row.topic,
      subtopic: row.subtopic,
      difficulty: row.difficulty,
      question: row.question,
      answer: row.answer,
      unit: row.unit || '',
      solution: row.solution
    };
  }

  window.FizStartSupabase = {
    isConfigured,
    loadDataFromSupabase
  };
})();
