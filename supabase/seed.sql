-- ФизСтарт: загрузка базы знаний
-- Обновлено: материалы по механике перенесены из загруженных файлов MEKhANIKA.docx / текст.txt.

delete from exam_tasks;
delete from exams;
delete from tasks;
delete from practice_tasks;
delete from mistakes;
delete from formulas;
delete from theory_subsections;
delete from theory_sections;

insert into theory_sections (id,title,description,progress,sort_order) values ('mechanics','Механика','Материалы из загруженного файла: кинематика, динамика, силы, импульс, работа и энергия, механические колебания, статика и гидростатика.',0,1);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','Sₓ = vₓ · t',1);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','x(t) = x₀ + vₓ · t',2);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','aₓ = Δvₓ / Δt = (vₓ - v₀ₓ) / Δt',3);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','vₓ(t) = v₀ₓ + aₓ · t',4);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','x(t) = x₀ + v₀ₓ · t + (aₓ · t²) / 2',5);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','Sₓ = v₀ₓ · t + (aₓ · t²) / 2',6);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','Sₓ = (vₓ² - v₀ₓ²) / (2 · aₓ)',7);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','Sₓ = ((v₀ₓ + vₓ) · t) / 2',8);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','ω = Δφ / Δt = v / R = 2π / T = 2πν',9);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','v = ω · R',10);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','T = t / N = 2πR / v = 2π / ω',11);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','ν = N / t = 1 / T = ω / 2π',12);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','aₙ = v² / R = ω² · R',13);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','t_пол = √(2H / g)',14);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','L = v₀ · √(2H / g)',15);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','L_max = (v₀² · sin 2α) / g',16);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','H_max = (v₀² · sin² α) / (2g)',17);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','ΣFᵢ = m · a',18);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','F_упр = -k · Δx',19);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','F_тр.п ≤ μ · N',20);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','F_тр.ск = μ · N',21);
insert into formulas (theory_id,formula,sort_order) values ('mechanics','F_гр = G · (m₁ · m₂) / R²',22);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('mechanics-kinematics','mechanics','Кинематика','База','55 мин','Разобраться с механическим движением, равномерным и равноускоренным движением, движением по окружности и баллистикой.','Механическое движение тела — изменение положения тела в пространстве относительно других тел с течением времени.

Кинематика описывает геометрические свойства движения без учёта причин, которые его вызывают. Главная задача кинематики — математически определить положение и характеристики движения тела во времени.

Материальная точка — тело, размерами которого можно пренебречь по сравнению с расстоянием, которое оно прошло.

Основные понятия:
· Траектория — линия, вдоль которой движется тело.
· Путь — длина участка траектории, пройденного телом.
· Радиус-вектор — вектор из начала координат в положение материальной точки.
· Перемещение — вектор, соединяющий начальное и конечное положение тела.
· Система отсчёта — тело отсчёта, система координат и часы.

Кинематические характеристики:
· Скорость — векторная величина, показывающая быстроту изменения положения тела.
· Ускорение — векторная величина, показывающая быстроту изменения скорости по величине и направлению.

Равномерное прямолинейное движение — движение, при котором тело за равные промежутки времени совершает одинаковые перемещения.

Равноускоренное движение — движение с постоянным ускорением.

Равномерное движение по окружности — движение, при котором скорость по модулю постоянна, но направление скорости постоянно меняется.

Баллистика изучает движение тел, брошенных в пространстве. В школьных задачах тело обычно считают материальной точкой, а сопротивлением воздуха пренебрегают.','Тело движется равномерно со скоростью 8 м/с в течение 12 с. Тогда путь равен S = v · t = 8 · 12 = 96 м.',1);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','Sₓ = vₓ · t',1);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','x(t) = x₀ + vₓ · t',2);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','aₓ = Δvₓ / Δt = (vₓ - v₀ₓ) / Δt',3);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','vₓ(t) = v₀ₓ + aₓ · t',4);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','x(t) = x₀ + v₀ₓ · t + (aₓ · t²) / 2',5);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','Sₓ = v₀ₓ · t + (aₓ · t²) / 2',6);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','Sₓ = (vₓ² - v₀ₓ²) / (2 · aₓ)',7);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','Sₓ = ((v₀ₓ + vₓ) · t) / 2',8);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','ω = Δφ / Δt = v / R = 2π / T = 2πν',9);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','v = ω · R',10);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','T = t / N = 2πR / v = 2π / ω',11);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','ν = N / t = 1 / T = ω / 2π',12);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','aₙ = v² / R = ω² · R',13);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','t_пол = √(2H / g)',14);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','L = v₀ · √(2H / g)',15);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','L_max = (v₀² · sin 2α) / g',16);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-kinematics','H_max = (v₀² · sin² α) / (2g)',17);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-kinematics','путают путь и перемещение',1);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-kinematics','забывают переводить км/ч в м/с',2);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-kinematics','считают, что при движении по окружности ускорения нет',3);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-kinematics','не различают период и частоту',4);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-kinematics','в баллистике забывают разложить скорость на горизонтальную и вертикальную составляющие',5);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-kinematics-p1','mechanics-kinematics','Тело движется равномерно со скоростью 8 м/с. Какой путь оно пройдёт за 12 секунд?','96','м','S = v · t = 8 · 12 = 96 м.','База','Задание 1','Механика','Кинематика',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-kinematics-p2','mechanics-kinematics','Скорость тела изменилась с 4 м/с до 16 м/с за 6 секунд. Найдите ускорение.','2','м/с²','a = (v - v₀) / t = (16 - 4) / 6 = 2 м/с².','База','Задание 2','Механика','Кинематика',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-kinematics-p3','mechanics-kinematics','Тело движется по окружности радиуса 5 м со скоростью 10 м/с. Найдите центростремительное ускорение.','20','м/с²','aₙ = v²/R = 10²/5 = 20 м/с².','Средний','Задание 3','Механика','Движение по окружности',3);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('mechanics-dynamics','mechanics','Динамика и законы Ньютона','База','45 мин','Понять причины движения тел, научиться применять законы Ньютона и основные силы.','Динамика изучает причины возникновения механического движения.

Инерциальная система отсчёта — система, в которой тело либо покоится, либо движется прямолинейно и равномерно, если на него не действуют другие тела или действие тел скомпенсировано.

Сила — мера взаимодействия между телами. Это векторная физическая величина, которая показывает, как одно тело действует на другое.

В задачах по динамике важно:
· выбрать тело, движение которого рассматривается;
· отметить все силы на рисунке;
· выбрать оси координат;
· записать второй закон Ньютона в проекциях.','На тело массой 5 кг действует равнодействующая сила 20 Н. По второму закону Ньютона ускорение a = F/m = 20/5 = 4 м/с².',2);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-dynamics','ΣFᵢ = m · a',1);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-dynamics','F_упр = -k · Δx',2);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-dynamics','F_тр.п ≤ μ · N',3);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-dynamics','F_тр.ск = μ · N',4);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-dynamics','F_гр = G · (m₁ · m₂) / R²',5);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-dynamics','F_тяж = m · g',6);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-dynamics','g(h) = G · M / (R + h)²',7);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-dynamics','F_Арх = ρ_ж · g · V_п.ч',8);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-dynamics','F₁₂ = -F₂₁',9);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-dynamics','g = G·M/R²',10);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-dynamics','не находят равнодействующую силу',1);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-dynamics','путают массу и вес',2);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-dynamics','забывают силу реакции опоры',3);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-dynamics','не учитывают направление силы трения',4);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-dynamics','записывают второй закон Ньютона без проекций',5);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-dynamics-p1','mechanics-dynamics','На тело массой 6 кг действует равнодействующая сила 18 Н. Найдите ускорение тела.','3','м/с²','a = F/m = 18/6 = 3 м/с².','База','Задание 1','Механика','Динамика',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-dynamics-p2','mechanics-dynamics','Масса тела 7 кг. Найдите силу тяжести при g = 10 м/с².','70','Н','F_тяж = mg = 7 · 10 = 70 Н.','База','Задание 2','Механика','Динамика',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('mechanics-friction','mechanics','Сила трения','База','25 мин','Различать трение покоя, скольжения и качения, применять формулы силы трения.','Сила трения покоя возникает, когда тело не движется относительно поверхности, но есть попытка сдвинуть его.

Сила трения скольжения возникает при скольжении одного тела по поверхности другого.

Сила трения качения возникает при качении, когда тело деформирует поверхность при движении.

Сила трения всегда направлена против относительного движения или против возможного движения тела.','Если коэффициент трения скольжения равен 0,2, а сила реакции опоры 50 Н, сила трения F = μN = 0,2 · 50 = 10 Н.',3);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-friction','F_тр.п ≤ μ · N',1);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-friction','F_тр.ск = μ · N',2);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-friction','считают трение покоя всегда равным μN',1);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-friction','забывают, что трение направлено против движения',2);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-friction','путают силу трения и силу тяги',3);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-friction','не находят силу реакции опоры',4);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-friction-p1','mechanics-friction','Коэффициент трения 0,3, сила реакции опоры 40 Н. Найдите силу трения скольжения.','12','Н','F_тр = μN = 0,3 · 40 = 12 Н.','База','Задание 1','Механика','Сила трения',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-friction-p2','mechanics-friction','Как направлена сила трения скольжения относительно движения тела?','против движения','','Сила трения скольжения направлена против относительного движения тела по поверхности.','База','Задание 2','Механика','Сила трения',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('mechanics-momentum','mechanics','Импульс и закон сохранения импульса','Средний','35 мин','Научиться находить импульс тела и применять закон сохранения импульса.','Импульс тела — векторная физическая величина, численно равная произведению массы тела на его скорость.

Импульс является количественной характеристикой движения.

Если внешние силы на систему не действуют или их сумма равна нулю, полный импульс системы сохраняется.','Тело массой 3 кг движется со скоростью 4 м/с. Его импульс p = mv = 3 · 4 = 12 кг·м/с.',4);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-momentum','p = m · v',1);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-momentum','Δp = (F₁ + F₂ + ... + Fₙ) · Δt',2);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-momentum','p₁ + p₂ = p₁'' + p₂''',3);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-momentum','ΣF = m · (Δv / Δt)',4);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-momentum','Δp_сист = 0 => p_сист = const',5);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-momentum','забывают, что импульс — вектор',1);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-momentum','не учитывают направление скоростей',2);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-momentum','применяют закон сохранения импульса к незамкнутой системе',3);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-momentum','путают импульс тела и импульс силы',4);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-momentum-p1','mechanics-momentum','Тело массой 4 кг движется со скоростью 6 м/с. Найдите импульс тела.','24','кг·м/с','p = m · v = 4 · 6 = 24 кг·м/с.','База','Задание 1','Механика','Импульс',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-momentum-p2','mechanics-momentum','До взаимодействия импульс системы равен 15 кг·м/с. Чему он будет равен после взаимодействия, если система замкнута?','15','кг·м/с','В замкнутой системе импульс сохраняется: p_до = p_после = 15 кг·м/с.','База','Задание 2','Механика','Импульс',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('mechanics-energy','mechanics','Механическая работа и энергия','Средний','50 мин','Разобраться с работой силы, мощностью, кинетической и потенциальной энергией.','Работа силы — величина, определяемая как скалярное произведение вектора силы на вектор перемещения.

Мощность характеризует скорость совершения работы.

Кинетическая энергия — энергия механического движения тела.

Потенциальная энергия зависит от взаимного положения тел в системе.

Консервативные силы сохраняют механическую энергию замкнутой системы, а диссипативные силы рассеивают её.','Тело массой 2 кг движется со скоростью 3 м/с. Его кинетическая энергия E = mv²/2 = 2 · 9 / 2 = 9 Дж.',5);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-energy','A = F · S · cos α',1);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-energy','N = ΔA / Δt',2);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-energy','N = F · v · cos α',3);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-energy','η = (A_пол / A_зат) · 100%',4);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-energy','E_кин = (m · v²) / 2 = p² / (2m)',5);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-energy','ΔE_кин = A_F₁ + A_F₂ + ... + A_Fₙ',6);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-energy','A_пот = E_пот.н - E_пот.к',7);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-energy','E_кин.к + ΣE_пот.к = E_кин.н + ΣE_пот.н = const',8);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-energy','E_тяж = m · g · h',9);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-energy','E_упр = (k · x²) / 2',10);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-energy','E_грав = -G · (M · m) / R',11);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-energy','забывают квадрат скорости в кинетической энергии',1);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-energy','не учитывают угол между силой и перемещением',2);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-energy','путают работу и мощность',3);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-energy','не выбирают нулевой уровень потенциальной энергии',4);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-energy-p1','mechanics-energy','Сила 10 Н переместила тело на 5 м в направлении действия силы. Найдите работу.','50','Дж','A = F · S · cos0° = 10 · 5 = 50 Дж.','База','Задание 1','Механика','Работа и энергия',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-energy-p2','mechanics-energy','Тело массой 2 кг движется со скоростью 4 м/с. Найдите кинетическую энергию.','16','Дж','E_кин = mv²/2 = 2 · 16 / 2 = 16 Дж.','База','Задание 2','Механика','Работа и энергия',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('mechanics-oscillations-waves','mechanics','Механические колебания и волны','Средний','45 мин','Понять период, частоту, амплитуду, гармонические колебания и длину волны.','Механические колебания — движение, повторяющееся в пространстве и во времени точно или почти точно.

Период колебаний — время, за которое система совершает одно полное колебание.

Частота — величина, обратная периоду.

Гармонические колебания — колебания, при которых координата зависит от времени по гармоническому закону.

Амплитуда — наибольшее отклонение от положения равновесия.

Фаза показывает, какая часть периода прошла с начала колебаний.','Если тело совершает 20 колебаний за 10 секунд, частота ν = N/t = 20/10 = 2 Гц.',6);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-oscillations-waves','x(t) = A · cos(ωt + φ₀)',1);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-oscillations-waves','v(t) = -Aω · sin(ωt + φ₀)',2);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-oscillations-waves','a(t) = -Aω² · cos(ωt + φ₀)',3);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-oscillations-waves','E_пот = (m · ω² · x²) / 2',4);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-oscillations-waves','E = (m · ω² · A²) / 2',5);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-oscillations-waves','v_max = A · ω',6);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-oscillations-waves','a_max = A · ω²',7);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-oscillations-waves','ω = 2π · ν',8);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-oscillations-waves','T = 1 / ν',9);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-oscillations-waves','T = 2π · √(l / g)',10);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-oscillations-waves','T = 2π · √(m / k)',11);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-oscillations-waves','λ = v · T = v / ν',12);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-oscillations-waves','путают период и частоту',1);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-oscillations-waves','забывают, что ω = 2πν',2);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-oscillations-waves','не различают амплитуду и координату',3);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-oscillations-waves','не переводят сантиметры в метры',4);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-oscillations-waves-p1','mechanics-oscillations-waves','Тело совершило 30 колебаний за 15 секунд. Найдите частоту.','2','Гц','ν = N/t = 30/15 = 2 Гц.','База','Задание 1','Механика','Колебания и волны',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-oscillations-waves-p2','mechanics-oscillations-waves','Частота колебаний 5 Гц. Найдите период.','0.2','с','T = 1/ν = 1/5 = 0,2 с.','База','Задание 2','Механика','Колебания и волны',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('mechanics-statics','mechanics','Статика','Средний','30 мин','Научиться применять момент силы и условия равновесия тела.','Момент силы относительно оси вращения — произведение силы на её плечо.

Плечо силы — кратчайшее расстояние от оси вращения до линии действия силы.

Для равновесия тела должны выполняться два условия:
· сумма сил равна нулю;
· сумма моментов сил равна нулю.','Если сила 20 Н действует на плечо 0,4 м, момент силы M = F · L = 20 · 0,4 = 8 Н·м.',7);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-statics','M = ±F · L',1);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-statics','ΣFᵢ = 0',2);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-statics','ΣMᵢ = 0',3);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-statics','путают плечо силы с длиной рычага',1);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-statics','забывают учитывать направление момента',2);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-statics','записывают только сумму сил и забывают правило моментов',3);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-statics-p1','mechanics-statics','Сила 15 Н действует на плечо 0,2 м. Найдите момент силы.','3','Н·м','M = F · L = 15 · 0,2 = 3 Н·м.','База','Задание 1','Механика','Статика',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-statics-p2','mechanics-statics','Какой должна быть сумма моментов сил при равновесии тела?','0','','Второе условие равновесия: ΣMᵢ = 0.','База','Задание 2','Механика','Статика',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('mechanics-hydrostatics','mechanics','Гидростатика','Средний','40 мин','Разобраться с давлением жидкости, законом Паскаля, силой Архимеда и условиями плавания тел.','Давление — физическая величина, равная отношению силы, действующей перпендикулярно поверхности, к площади этой поверхности.

Закон Паскаля: давление, оказываемое на жидкость или газ, передаётся в любую точку одинаково по всем направлениям.

Сила Архимеда действует на тело, погружённое в жидкость или газ, и направлена вверх.

Условия плавания тел:
· если mg > F_A, тело тонет;
· если mg = F_A, тело плавает в толще жидкости;
· если mg < F_A, тело плавает на поверхности.','Давление воды на глубине 4 м: p = ρgh = 1000 · 10 · 4 = 40000 Па.',8);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-hydrostatics','p = F / S',1);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-hydrostatics','p = ρ_ж · g · h',2);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-hydrostatics','F = p · S',3);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-hydrostatics','F_Арх = ρ_ж · g · V_п.ч',4);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-hydrostatics','F₁ / F₂ = S₁ / S₂',5);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-hydrostatics','p₁ = p₂ => h₁ = h₂',6);
insert into formulas (subsection_id,formula,sort_order) values ('mechanics-hydrostatics','ρ₁ · h₁ = ρ₂ · h₂',7);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-hydrostatics','путают давление и силу давления',1);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-hydrostatics','забывают переводить площадь в м²',2);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-hydrostatics','в формуле Архимеда берут плотность тела вместо плотности жидкости',3);
insert into mistakes (subsection_id,text,sort_order) values ('mechanics-hydrostatics','не учитывают глубину',4);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-hydrostatics-p1','mechanics-hydrostatics','Найдите давление воды на глубине 5 м. ρ = 1000 кг/м³, g = 10 м/с².','50000','Па','p = ρgh = 1000 · 10 · 5 = 50000 Па.','База','Задание 1','Механика','Гидростатика',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mechanics-hydrostatics-p2','mechanics-hydrostatics','На поршень площадью 2 м² действует давление 100 Па. Найдите силу давления.','200','Н','F = p · S = 100 · 2 = 200 Н.','База','Задание 2','Механика','Гидростатика',2);

insert into theory_sections (id,title,description,progress,sort_order) values ('mkt','Молекулярная физика и термодинамика','МКТ, идеальный газ, тепловые процессы, первый закон термодинамики и КПД.',0,2);
insert into formulas (theory_id,formula,sort_order) values ('mkt','pV = νRT',1);
insert into formulas (theory_id,formula,sort_order) values ('mkt','U = 3/2νRT',2);
insert into formulas (theory_id,formula,sort_order) values ('mkt','Q = cmΔt',3);
insert into formulas (theory_id,formula,sort_order) values ('mkt','Q = λm',4);
insert into formulas (theory_id,formula,sort_order) values ('mkt','Q = ΔU + A',5);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('mkt-1','mkt','Основы МКТ','База','35 мин','Понять связь температуры и движения молекул.','МКТ объясняет свойства вещества движением и взаимодействием молекул. Температура связана со средней кинетической энергией частиц: чем выше температура, тем быстрее движутся частицы.','При нагревании средняя скорость молекул увеличивается, поэтому растёт температура тела.',1);
insert into formulas (subsection_id,formula,sort_order) values ('mkt-1','Eₖ ~ T',1);
insert into formulas (subsection_id,formula,sort_order) values ('mkt-1','m = ρV',2);
insert into formulas (subsection_id,formula,sort_order) values ('mkt-1','N = νNₐ',3);
insert into mistakes (subsection_id,text,sort_order) values ('mkt-1','считают, что молекулы в твёрдом теле не движутся',1);
insert into mistakes (subsection_id,text,sort_order) values ('mkt-1','путают температуру и количество теплоты',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mkt-1-p1','mkt-1','Что происходит со средней скоростью молекул при повышении температуры?','увеличивается','','Температура связана со средней кинетической энергией частиц.','База','Задание 1','Молекулярная физика и термодинамика','Основы МКТ',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mkt-1-p2','mkt-1','Найдите массу вещества объёмом 2 м³ при плотности 5 кг/м³.','10','кг','m = ρV = 5 · 2 = 10 кг.','База','Задание 2','Молекулярная физика и термодинамика','Основы МКТ',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('mkt-2','mkt','Идеальный газ','Средний','45 мин','Научиться работать с уравнением состояния идеального газа.','Идеальный газ — модель, где молекулы считаются материальными точками и взаимодействуют только при столкновениях. Главное уравнение связывает давление, объём, температуру и количество вещества.','Если температура газа выросла при постоянном объёме, давление тоже увеличится.',2);
insert into formulas (subsection_id,formula,sort_order) values ('mkt-2','pV = νRT',1);
insert into formulas (subsection_id,formula,sort_order) values ('mkt-2','p₁V₁/T₁ = p₂V₂/T₂',2);
insert into formulas (subsection_id,formula,sort_order) values ('mkt-2','T(K) = t°C + 273',3);
insert into mistakes (subsection_id,text,sort_order) values ('mkt-2','не переводят температуру в Кельвины',1);
insert into mistakes (subsection_id,text,sort_order) values ('mkt-2','забывают, какая величина постоянна',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mkt-2-p1','mkt-2','Газ нагрели при постоянном объёме. Как изменится давление?','увеличится','','При V = const давление прямо пропорционально температуре.','База','Задание 1','Молекулярная физика и термодинамика','Идеальный газ',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mkt-2-p2','mkt-2','При постоянной температуре объём газа увеличили в 2 раза. Как изменится давление?','уменьшится в 2 раза','','При T = const pV = const, поэтому давление уменьшится в 2 раза.','База','Задание 2','Молекулярная физика и термодинамика','Идеальный газ',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('mkt-3','mkt','Термодинамика','Средний','50 мин','Научиться считать теплоту, работу и изменение внутренней энергии.','Термодинамика рассматривает теплоту, работу газа и изменение внутренней энергии. Первый закон термодинамики показывает, куда уходит полученная теплота.','Газ получил 500 Дж теплоты и совершил 200 Дж работы. Тогда ΔU = 300 Дж.',3);
insert into formulas (subsection_id,formula,sort_order) values ('mkt-3','Q = ΔU + A',1);
insert into formulas (subsection_id,formula,sort_order) values ('mkt-3','A = pΔV',2);
insert into formulas (subsection_id,formula,sort_order) values ('mkt-3','Q = cmΔt',3);
insert into formulas (subsection_id,formula,sort_order) values ('mkt-3','U = 3/2νRT',4);
insert into mistakes (subsection_id,text,sort_order) values ('mkt-3','путают знаки работы',1);
insert into mistakes (subsection_id,text,sort_order) values ('mkt-3','не понимают, кто совершает работу',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mkt-3-p1','mkt-3','Газ получил 400 Дж теплоты и совершил работу 150 Дж. Найдите изменение внутренней энергии.','250','Дж','ΔU = Q - A = 400 - 150 = 250 Дж.','База','Задание 1','Молекулярная физика и термодинамика','Термодинамика',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mkt-3-p2','mkt-3','Тело массой 2 кг нагрели на 10 °C. c = 100 Дж/(кг·°C). Найдите количество теплоты.','2000','Дж','Q = cmΔt = 100 · 2 · 10 = 2000 Дж.','База','Задание 2','Молекулярная физика и термодинамика','Термодинамика',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('mkt-4','mkt','Тепловые машины','Сложный','35 мин','Понять КПД тепловой машины и холодильника.','Тепловая машина превращает часть полученной теплоты в работу. КПД показывает, какая доля теплоты превратилась в полезную работу.','Если машина получила 1000 Дж теплоты и отдала холодильнику 600 Дж, работа равна 400 Дж, КПД 40%.',4);
insert into formulas (subsection_id,formula,sort_order) values ('mkt-4','η = A / Q₁',1);
insert into formulas (subsection_id,formula,sort_order) values ('mkt-4','A = Q₁ - Q₂',2);
insert into formulas (subsection_id,formula,sort_order) values ('mkt-4','η = (Q₁ - Q₂) / Q₁',3);
insert into mistakes (subsection_id,text,sort_order) values ('mkt-4','путают Q₁ и Q₂',1);
insert into mistakes (subsection_id,text,sort_order) values ('mkt-4','забывают переводить КПД в проценты',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mkt-4-p1','mkt-4','Тепловая машина получила 800 Дж и отдала 500 Дж. Найдите работу.','300','Дж','A = Q₁ - Q₂ = 800 - 500 = 300 Дж.','База','Задание 1','Молекулярная физика и термодинамика','Тепловые машины',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('mkt-4-p2','mkt-4','Машина получила 1000 Дж и совершила работу 250 Дж. Найдите КПД в процентах.','25','%','η = A/Q₁ = 250/1000 = 0,25 = 25%.','База','Задание 2','Молекулярная физика и термодинамика','Тепловые машины',2);

insert into theory_sections (id,title,description,progress,sort_order) values ('electro','Электродинамика','Электростатика, постоянный ток, магнитное поле и электромагнитная индукция.',0,3);
insert into formulas (theory_id,formula,sort_order) values ('electro','F = kq₁q₂/r²',1);
insert into formulas (theory_id,formula,sort_order) values ('electro','I = U/R',2);
insert into formulas (theory_id,formula,sort_order) values ('electro','P = UI',3);
insert into formulas (theory_id,formula,sort_order) values ('electro','F = BIl sinα',4);
insert into formulas (theory_id,formula,sort_order) values ('electro','ε = -ΔΦ/Δt',5);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('electro-1','electro','Электростатика','Средний','45 мин','Понять взаимодействие зарядов и электрическое поле.','Электростатика изучает взаимодействие неподвижных зарядов и электрическое поле. Одноимённые заряды отталкиваются, разноимённые притягиваются.','При увеличении расстояния между зарядами в 2 раза сила уменьшается в 4 раза.',1);
insert into formulas (subsection_id,formula,sort_order) values ('electro-1','F = kq₁q₂/r²',1);
insert into formulas (subsection_id,formula,sort_order) values ('electro-1','E = F/q',2);
insert into formulas (subsection_id,formula,sort_order) values ('electro-1','φ = W/q',3);
insert into formulas (subsection_id,formula,sort_order) values ('electro-1','C = q/U',4);
insert into mistakes (subsection_id,text,sort_order) values ('electro-1','забывают квадрат расстояния',1);
insert into mistakes (subsection_id,text,sort_order) values ('electro-1','не учитывают знак зарядов',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('electro-1-p1','electro-1','Если расстояние между зарядами увеличить в 3 раза, во сколько раз уменьшится сила?','9','раз','Сила обратно пропорциональна квадрату расстояния: 3² = 9.','База','Задание 1','Электродинамика','Электростатика',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('electro-1-p2','electro-1','На заряд 2 Кл действует сила 10 Н. Найдите напряжённость поля.','5','Н/Кл','E = F/q = 10/2 = 5 Н/Кл.','База','Задание 2','Электродинамика','Электростатика',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('electro-2','electro','Постоянный ток','База','45 мин','Научиться решать задачи на закон Ома и мощность тока.','Электрический ток — направленное движение заряженных частиц. В простых цепях часто используют закон Ома и формулы работы и мощности тока.','При U = 12 В и R = 4 Ом сила тока I = 3 А.',2);
insert into formulas (subsection_id,formula,sort_order) values ('electro-2','I = U/R',1);
insert into formulas (subsection_id,formula,sort_order) values ('electro-2','R = ρl/S',2);
insert into formulas (subsection_id,formula,sort_order) values ('electro-2','P = UI',3);
insert into formulas (subsection_id,formula,sort_order) values ('electro-2','A = UIt',4);
insert into mistakes (subsection_id,text,sort_order) values ('electro-2','путают последовательное и параллельное соединение',1);
insert into mistakes (subsection_id,text,sort_order) values ('electro-2','не переводят мА в А',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('electro-2-p1','electro-2','Напряжение 12 В, сопротивление 4 Ом. Найдите силу тока.','3','А','I = U/R = 12/4 = 3 А.','База','Задание 1','Электродинамика','Постоянный ток',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('electro-2-p2','electro-2','Сила тока 2 А, напряжение 10 В. Найдите мощность.','20','Вт','P = UI = 10 · 2 = 20 Вт.','База','Задание 2','Электродинамика','Постоянный ток',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('electro-3','electro','Магнитное поле','Средний','45 мин','Понять действие магнитного поля на проводник и заряд.','Магнитное поле действует на движущиеся заряды и проводники с током. Направление силы часто определяют правилами левой и правой руки.','Если проводник перпендикулярен полю, sinα = 1 и сила максимальна.',3);
insert into formulas (subsection_id,formula,sort_order) values ('electro-3','F = BIl sinα',1);
insert into formulas (subsection_id,formula,sort_order) values ('electro-3','F = qvB sinα',2);
insert into formulas (subsection_id,formula,sort_order) values ('electro-3','Φ = BS cosα',3);
insert into mistakes (subsection_id,text,sort_order) values ('electro-3','забывают синус угла',1);
insert into mistakes (subsection_id,text,sort_order) values ('electro-3','путают направление силы Ампера и Лоренца',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('electro-3-p1','electro-3','B = 2 Тл, I = 3 А, l = 0,5 м, угол 90°. Найдите силу Ампера.','3','Н','F = BIl = 2 · 3 · 0,5 = 3 Н.','База','Задание 1','Электродинамика','Магнитное поле',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('electro-3-p2','electro-3','Когда сила Ампера максимальна: при 0° или 90°?','90','°','F = BIl sinα, максимум при sinα = 1, то есть при 90°.','База','Задание 2','Электродинамика','Магнитное поле',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('electro-4','electro','Электромагнитная индукция','Сложный','50 мин','Понять индукционный ток и закон Фарадея.','Индукционный ток возникает при изменении магнитного потока через контур. Чем быстрее меняется поток, тем больше ЭДС индукции.','Если магнитный поток изменился на 0,4 Вб за 2 с, модуль ЭДС равен 0,2 В.',4);
insert into formulas (subsection_id,formula,sort_order) values ('electro-4','ε = -ΔΦ/Δt',1);
insert into formulas (subsection_id,formula,sort_order) values ('electro-4','Φ = BS cosα',2);
insert into formulas (subsection_id,formula,sort_order) values ('electro-4','I = ε/R',3);
insert into mistakes (subsection_id,text,sort_order) values ('electro-4','не понимают знак минус в законе Ленца',1);
insert into mistakes (subsection_id,text,sort_order) values ('electro-4','путают поток и индукцию',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('electro-4-p1','electro-4','Магнитный поток изменился на 0,6 Вб за 3 с. Найдите модуль ЭДС.','0.2','В','|ε| = ΔΦ/Δt = 0,6/3 = 0,2 В.','База','Задание 1','Электродинамика','Электромагнитная индукция',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('electro-4-p2','electro-4','Что является причиной индукционного тока?','изменение магнитного потока','','Индукция возникает при изменении магнитного потока через контур.','База','Задание 2','Электродинамика','Электромагнитная индукция',2);

insert into theory_sections (id,title,description,progress,sort_order) values ('oscillations','Колебания и волны','Механические колебания, волны, звук, резонанс и электромагнитные колебания.',0,4);
insert into formulas (theory_id,formula,sort_order) values ('oscillations','T = 1/f',1);
insert into formulas (theory_id,formula,sort_order) values ('oscillations','ω = 2πf',2);
insert into formulas (theory_id,formula,sort_order) values ('oscillations','v = λf',3);
insert into formulas (theory_id,formula,sort_order) values ('oscillations','T = 2π√(l/g)',4);
insert into formulas (theory_id,formula,sort_order) values ('oscillations','W = LI²/2',5);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('oscillations-1','oscillations','Гармонические колебания','Средний','40 мин','Понять период, частоту и амплитуду колебаний.','Колебания — повторяющиеся движения около положения равновесия. В задачах важно различать период, частоту, амплитуду и циклическую частоту.','Если частота 2 Гц, период T = 1/2 = 0,5 с.',1);
insert into formulas (subsection_id,formula,sort_order) values ('oscillations-1','T = 1/f',1);
insert into formulas (subsection_id,formula,sort_order) values ('oscillations-1','ω = 2πf',2);
insert into formulas (subsection_id,formula,sort_order) values ('oscillations-1','x = A cos(ωt)',3);
insert into mistakes (subsection_id,text,sort_order) values ('oscillations-1','путают период и частоту',1);
insert into mistakes (subsection_id,text,sort_order) values ('oscillations-1','забывают, что амплитуда — максимальное отклонение',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('oscillations-1-p1','oscillations-1','Частота колебаний 4 Гц. Найдите период.','0.25','с','T = 1/f = 1/4 = 0,25 с.','База','Задание 1','Колебания и волны','Гармонические колебания',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('oscillations-1-p2','oscillations-1','Тело совершило 20 колебаний за 10 с. Найдите частоту.','2','Гц','f = N/t = 20/10 = 2 Гц.','База','Задание 2','Колебания и волны','Гармонические колебания',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('oscillations-2','oscillations','Механические волны и звук','База','35 мин','Научиться использовать связь скорости, длины волны и частоты.','Волна переносит энергию без переноса вещества. Скорость волны равна произведению длины волны на частоту.','При скорости 340 м/с и частоте 170 Гц длина звуковой волны равна 2 м.',2);
insert into formulas (subsection_id,formula,sort_order) values ('oscillations-2','v = λf',1);
insert into formulas (subsection_id,formula,sort_order) values ('oscillations-2','λ = v/f',2);
insert into formulas (subsection_id,formula,sort_order) values ('oscillations-2','f = v/λ',3);
insert into mistakes (subsection_id,text,sort_order) values ('oscillations-2','путают частоту и период',1);
insert into mistakes (subsection_id,text,sort_order) values ('oscillations-2','не переводят кГц в Гц',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('oscillations-2-p1','oscillations-2','Скорость волны 300 м/с, частота 100 Гц. Найдите длину волны.','3','м','λ = v/f = 300/100 = 3 м.','База','Задание 1','Колебания и волны','Механические волны и звук',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('oscillations-2-p2','oscillations-2','Длина волны 2 м, частота 50 Гц. Найдите скорость волны.','100','м/с','v = λf = 2 · 50 = 100 м/с.','База','Задание 2','Колебания и волны','Механические волны и звук',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('oscillations-3','oscillations','Электромагнитные колебания','Сложный','40 мин','Разобраться с колебательным контуром.','В LC-контуре энергия периодически переходит из энергии электрического поля конденсатора в энергию магнитного поля катушки.','При максимальном заряде конденсатора энергия электрического поля максимальна, а ток равен нулю.',3);
insert into formulas (subsection_id,formula,sort_order) values ('oscillations-3','Wₑ = q²/2C',1);
insert into formulas (subsection_id,formula,sort_order) values ('oscillations-3','Wₘ = LI²/2',2);
insert into formulas (subsection_id,formula,sort_order) values ('oscillations-3','T = 2π√(LC)',3);
insert into mistakes (subsection_id,text,sort_order) values ('oscillations-3','путают момент максимального заряда и максимального тока',1);
insert into mistakes (subsection_id,text,sort_order) values ('oscillations-3','забывают корень в формуле периода',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('oscillations-3-p1','oscillations-3','Когда ток в LC-контуре максимален: при максимальном заряде или при нулевом заряде?','при нулевом заряде','','Когда заряд конденсатора равен нулю, энергия электрического поля перешла в магнитную, ток максимален.','База','Задание 1','Колебания и волны','Электромагнитные колебания',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('oscillations-3-p2','oscillations-3','Если L = 2 Гн, I = 3 А. Найдите энергию магнитного поля.','9','Дж','W = LI²/2 = 2 · 9 / 2 = 9 Дж.','База','Задание 2','Колебания и волны','Электромагнитные колебания',2);

insert into theory_sections (id,title,description,progress,sort_order) values ('optics','Оптика','Геометрическая оптика, линзы, зеркала, интерференция и дифракция.',0,5);
insert into formulas (theory_id,formula,sort_order) values ('optics','n = c/v',1);
insert into formulas (theory_id,formula,sort_order) values ('optics','1/F = 1/d + 1/f',2);
insert into formulas (theory_id,formula,sort_order) values ('optics','D = 1/F',3);
insert into formulas (theory_id,formula,sort_order) values ('optics','sinα/sinβ = n₂/n₁',4);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('optics-1','optics','Геометрическая оптика','База','40 мин','Понять отражение, преломление и построение изображений.','Геометрическая оптика рассматривает распространение света как лучей. В задачах важно уметь использовать законы отражения и преломления.','При отражении угол падения равен углу отражения.',1);
insert into formulas (subsection_id,formula,sort_order) values ('optics-1','α = β',1);
insert into formulas (subsection_id,formula,sort_order) values ('optics-1','n = c/v',2);
insert into formulas (subsection_id,formula,sort_order) values ('optics-1','sinα/sinβ = n₂/n₁',3);
insert into mistakes (subsection_id,text,sort_order) values ('optics-1','путают угол к поверхности и угол к нормали',1);
insert into mistakes (subsection_id,text,sort_order) values ('optics-1','забывают, что угол отсчитывается от перпендикуляра',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('optics-1-p1','optics-1','Угол падения света 30°. Чему равен угол отражения?','30','°','По закону отражения угол падения равен углу отражения.','База','Задание 1','Оптика','Геометрическая оптика',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('optics-1-p2','optics-1','Показатель преломления среды 1,5. Скорость света в вакууме 3·10⁸ м/с. Найдите скорость света в среде.','2e8','м/с','v = c/n = 3·10⁸/1,5 = 2·10⁸ м/с.','База','Задание 2','Оптика','Геометрическая оптика',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('optics-2','optics','Линзы','Средний','45 мин','Научиться решать задачи на тонкую линзу.','Линза создаёт изображение за счёт преломления света. В ЕГЭ часто встречаются задачи на фокусное расстояние, оптическую силу и построение изображения.','Фокусное расстояние 0,5 м означает оптическую силу D = 2 дптр.',2);
insert into formulas (subsection_id,formula,sort_order) values ('optics-2','1/F = 1/d + 1/f',1);
insert into formulas (subsection_id,formula,sort_order) values ('optics-2','D = 1/F',2);
insert into formulas (subsection_id,formula,sort_order) values ('optics-2','Γ = f/d',3);
insert into mistakes (subsection_id,text,sort_order) values ('optics-2','не переводят сантиметры в метры',1);
insert into mistakes (subsection_id,text,sort_order) values ('optics-2','путают собирающую и рассеивающую линзу',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('optics-2-p1','optics-2','Фокусное расстояние линзы 0,25 м. Найдите оптическую силу.','4','дптр','D = 1/F = 1/0,25 = 4 дптр.','База','Задание 1','Оптика','Линзы',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('optics-2-p2','optics-2','Предмет находится на 30 см от линзы, изображение — на 60 см. Найдите увеличение.','2','','Γ = f/d = 60/30 = 2.','База','Задание 2','Оптика','Линзы',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('optics-3','optics','Волновая оптика','Сложный','40 мин','Понять интерференцию, дифракцию и поляризацию.','Волновая оптика учитывает волновую природу света. Интерференция — сложение волн, дифракция — огибание препятствий, поляризация связана с поперечностью световой волны.','Максимум интерференции наблюдается, когда разность хода равна целому числу длин волн.',3);
insert into formulas (subsection_id,formula,sort_order) values ('optics-3','Δ = kλ',1);
insert into formulas (subsection_id,formula,sort_order) values ('optics-3','Δ = (k + 1/2)λ',2);
insert into formulas (subsection_id,formula,sort_order) values ('optics-3','d sinφ = kλ',3);
insert into mistakes (subsection_id,text,sort_order) values ('optics-3','путают условие максимума и минимума',1);
insert into mistakes (subsection_id,text,sort_order) values ('optics-3','не понимают смысл разности хода',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('optics-3-p1','optics-3','Разность хода равна 2λ. Максимум или минимум наблюдается?','максимум','','Целое число длин волн даёт максимум интерференции.','База','Задание 1','Оптика','Волновая оптика',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('optics-3-p2','optics-3','Какое явление показывает огибание светом препятствий?','дифракция','','Огибание препятствий волной называется дифракцией.','База','Задание 2','Оптика','Волновая оптика',2);

insert into theory_sections (id,title,description,progress,sort_order) values ('quantum','Квантовая физика','Фотоэффект, фотоны, атом Бора, радиоактивность и ядерные реакции.',0,6);
insert into formulas (theory_id,formula,sort_order) values ('quantum','E = hν',1);
insert into formulas (theory_id,formula,sort_order) values ('quantum','hν = Aвых + Eₖ',2);
insert into formulas (theory_id,formula,sort_order) values ('quantum','E = mc²',3);
insert into formulas (theory_id,formula,sort_order) values ('quantum','N = N₀ · 2^(-t/T)',4);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('quantum-1','quantum','Фотоэффект','Средний','45 мин','Понять энергию фотона и уравнение Эйнштейна.','Свет можно рассматривать как поток фотонов. Фотоэффект — выбивание электронов из вещества светом. Энергия фотона зависит от частоты, а не от яркости света.','Если энергия фотона больше работы выхода, электрон вылетает из металла.',1);
insert into formulas (subsection_id,formula,sort_order) values ('quantum-1','E = hν',1);
insert into formulas (subsection_id,formula,sort_order) values ('quantum-1','hν = Aвых + Eₖ',2);
insert into formulas (subsection_id,formula,sort_order) values ('quantum-1','ν = c/λ',3);
insert into mistakes (subsection_id,text,sort_order) values ('quantum-1','путают частоту и длину волны',1);
insert into mistakes (subsection_id,text,sort_order) values ('quantum-1','считают, что яркость меняет энергию фотона',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('quantum-1-p1','quantum-1','Энергия фотона равна 6,6·10⁻¹⁹ Дж. h = 6,6·10⁻³⁴ Дж·с. Найдите частоту.','1e15','Гц','ν = E/h = 10¹⁵ Гц.','База','Задание 1','Квантовая физика','Фотоэффект',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('quantum-1-p2','quantum-1','Что увеличивает энергию фотона: частота или яркость?','частота','','E = hν, энергия фотона зависит от частоты.','База','Задание 2','Квантовая физика','Фотоэффект',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('quantum-2','quantum','Атом Бора','Средний','40 мин','Понять энергетические уровни атома.','Модель Бора объясняет уровни энергии атома и испускание фотонов при переходах электронов. При переходе на более низкий уровень атом излучает фотон.','При переходе электрона на более низкий уровень излучается фотон с энергией, равной разности уровней.',2);
insert into formulas (subsection_id,formula,sort_order) values ('quantum-2','hν = E₂ - E₁',1);
insert into formulas (subsection_id,formula,sort_order) values ('quantum-2','E = hν',2);
insert into mistakes (subsection_id,text,sort_order) values ('quantum-2','путают поглощение и излучение',1);
insert into mistakes (subsection_id,text,sort_order) values ('quantum-2','ошибаются со знаком изменения энергии',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('quantum-2-p1','quantum-2','Электрон перешёл на более низкий уровень энергии. Фотон поглощается или излучается?','излучается','','При переходе вниз энергия уменьшается, избыток энергии уходит в виде фотона.','База','Задание 1','Квантовая физика','Атом Бора',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('quantum-2-p2','quantum-2','Разность энергий уровней равна 3 эВ. Чему равна энергия излучённого фотона?','3','эВ','Энергия фотона равна разности уровней.','База','Задание 2','Квантовая физика','Атом Бора',2);
insert into theory_subsections (id,theory_id,title,level,duration,goal,text,example,sort_order) values ('quantum-3','quantum','Ядерная физика','Сложный','55 мин','Разобраться с радиоактивностью и ядерными реакциями.','Ядерная физика изучает строение ядра, радиоактивность и ядерные реакции. Радиоактивный распад описывается периодом полураспада.','Через один период полураспада остаётся половина исходных ядер.',3);
insert into formulas (subsection_id,formula,sort_order) values ('quantum-3','E = mc²',1);
insert into formulas (subsection_id,formula,sort_order) values ('quantum-3','N = N₀ · 2^(-t/T)',2);
insert into formulas (subsection_id,formula,sort_order) values ('quantum-3','A = λN',3);
insert into mistakes (subsection_id,text,sort_order) values ('quantum-3','путают массу и дефект массы',1);
insert into mistakes (subsection_id,text,sort_order) values ('quantum-3','не понимают смысл периода полураспада',2);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('quantum-3-p1','quantum-3','Через один период полураспада осталось 80 ядер. Сколько было изначально?','160','ядер','За один период число ядер уменьшается в 2 раза. Значит было 160.','База','Задание 1','Квантовая физика','Ядерная физика',1);
insert into practice_tasks (id,subsection_id,question,answer,unit,solution,difficulty,number,topic,subtopic,sort_order) values ('quantum-3-p2','quantum-3','Через два периода полураспада осталось 25% вещества. Верно или неверно?','верно','','После двух периодов остаётся 1/4 = 25%.','База','Задание 2','Квантовая физика','Ядерная физика',2);

insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-1','№1','Механика','Кинематика','База','Тело движется равномерно со скоростью 6 м/с. Какой путь оно пройдёт за 15 секунд?','90','м','s = vt = 6 · 15 = 90 м.',1);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-2','№2','Механика','Кинематика','База','Скорость тела изменилась с 2 м/с до 12 м/с за 5 секунд. Найдите ускорение.','2','м/с²','a = (v - v₀) / t = (12 - 2) / 5 = 2 м/с².',2);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-3','№3','Механика','Динамика и законы Ньютона','База','На тело массой 5 кг действует сила 20 Н. Найдите ускорение.','4','м/с²','a = F / m = 20 / 5 = 4 м/с².',3);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-4','№4','Механика','Динамика и законы Ньютона','База','Масса тела 3 кг. Найдите силу тяжести при g = 10 м/с².','30','Н','Fтяж = mg = 3 · 10 = 30 Н.',4);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-5','№5','Механика','Законы сохранения','Средний','Тело массой 2 кг движется со скоростью 5 м/с. Найдите импульс.','10','кг·м/с','p = mv = 2 · 5 = 10 кг·м/с.',5);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-6','№6','Механика','Законы сохранения','Средний','Тело массой 4 кг подняли на высоту 3 м. Найдите потенциальную энергию при g = 10 м/с².','120','Дж','Eₚ = mgh = 4 · 10 · 3 = 120 Дж.',6);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-7','№7','Механика','Статика и гидростатика','Средний','Сила 10 Н действует на плечо 0,5 м. Найдите момент силы.','5','Н·м','M = Fl = 10 · 0,5 = 5 Н·м.',7);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-8','№8','Механика','Статика и гидростатика','Средний','Найдите давление воды на глубине 3 м. ρ = 1000 кг/м³, g = 10 м/с².','30000','Па','p = ρgh = 1000 · 10 · 3 = 30000 Па.',8);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-9','№9','Механика','Движение по окружности','Средний','Тело движется по окружности радиуса 2 м со скоростью 4 м/с. Найдите центростремительное ускорение.','8','м/с²','aц = v²/R = 16/2 = 8 м/с².',9);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-10','№10','Механика','Движение по окружности','Средний','Тело делает 5 оборотов за 10 секунд. Найдите частоту.','0.5','Гц','f = N/t = 5/10 = 0,5 Гц.',10);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-11','№11','Молекулярная физика и термодинамика','Основы МКТ','База','Что происходит со средней скоростью молекул при повышении температуры?','увеличивается','','Температура связана со средней кинетической энергией частиц.',11);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-12','№12','Молекулярная физика и термодинамика','Основы МКТ','База','Найдите массу вещества объёмом 2 м³ при плотности 5 кг/м³.','10','кг','m = ρV = 5 · 2 = 10 кг.',12);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-13','№13','Молекулярная физика и термодинамика','Идеальный газ','Средний','Газ нагрели при постоянном объёме. Как изменится давление?','увеличится','','При V = const давление прямо пропорционально температуре.',13);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-14','№14','Молекулярная физика и термодинамика','Идеальный газ','Средний','При постоянной температуре объём газа увеличили в 2 раза. Как изменится давление?','уменьшится в 2 раза','','При T = const pV = const, поэтому давление уменьшится в 2 раза.',14);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-15','№15','Молекулярная физика и термодинамика','Термодинамика','Средний','Газ получил 400 Дж теплоты и совершил работу 150 Дж. Найдите изменение внутренней энергии.','250','Дж','ΔU = Q - A = 400 - 150 = 250 Дж.',15);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-16','№16','Молекулярная физика и термодинамика','Термодинамика','Средний','Тело массой 2 кг нагрели на 10 °C. c = 100 Дж/(кг·°C). Найдите количество теплоты.','2000','Дж','Q = cmΔt = 100 · 2 · 10 = 2000 Дж.',16);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-17','№17','Молекулярная физика и термодинамика','Тепловые машины','Сложный','Тепловая машина получила 800 Дж и отдала 500 Дж. Найдите работу.','300','Дж','A = Q₁ - Q₂ = 800 - 500 = 300 Дж.',17);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-18','№18','Молекулярная физика и термодинамика','Тепловые машины','Сложный','Машина получила 1000 Дж и совершила работу 250 Дж. Найдите КПД в процентах.','25','%','η = A/Q₁ = 250/1000 = 0,25 = 25%.',18);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-19','№19','Электродинамика','Электростатика','Средний','Если расстояние между зарядами увеличить в 3 раза, во сколько раз уменьшится сила?','9','раз','Сила обратно пропорциональна квадрату расстояния: 3² = 9.',19);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-20','№20','Электродинамика','Электростатика','Средний','На заряд 2 Кл действует сила 10 Н. Найдите напряжённость поля.','5','Н/Кл','E = F/q = 10/2 = 5 Н/Кл.',20);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-21','№21','Электродинамика','Постоянный ток','База','Напряжение 12 В, сопротивление 4 Ом. Найдите силу тока.','3','А','I = U/R = 12/4 = 3 А.',21);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-22','№22','Электродинамика','Постоянный ток','База','Сила тока 2 А, напряжение 10 В. Найдите мощность.','20','Вт','P = UI = 10 · 2 = 20 Вт.',22);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-23','№23','Электродинамика','Магнитное поле','Средний','B = 2 Тл, I = 3 А, l = 0,5 м, угол 90°. Найдите силу Ампера.','3','Н','F = BIl = 2 · 3 · 0,5 = 3 Н.',23);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-24','№24','Электродинамика','Магнитное поле','Средний','Когда сила Ампера максимальна: при 0° или 90°?','90','°','F = BIl sinα, максимум при sinα = 1, то есть при 90°.',24);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-25','№25','Электродинамика','Электромагнитная индукция','Сложный','Магнитный поток изменился на 0,6 Вб за 3 с. Найдите модуль ЭДС.','0.2','В','|ε| = ΔΦ/Δt = 0,6/3 = 0,2 В.',25);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-26','№26','Электродинамика','Электромагнитная индукция','Сложный','Что является причиной индукционного тока?','изменение магнитного потока','','Индукция возникает при изменении магнитного потока через контур.',26);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-27','№1','Колебания и волны','Гармонические колебания','Средний','Частота колебаний 4 Гц. Найдите период.','0.25','с','T = 1/f = 1/4 = 0,25 с.',27);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-28','№2','Колебания и волны','Гармонические колебания','Средний','Тело совершило 20 колебаний за 10 с. Найдите частоту.','2','Гц','f = N/t = 20/10 = 2 Гц.',28);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-29','№3','Колебания и волны','Механические волны и звук','База','Скорость волны 300 м/с, частота 100 Гц. Найдите длину волны.','3','м','λ = v/f = 300/100 = 3 м.',29);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-30','№4','Колебания и волны','Механические волны и звук','База','Длина волны 2 м, частота 50 Гц. Найдите скорость волны.','100','м/с','v = λf = 2 · 50 = 100 м/с.',30);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-31','№5','Колебания и волны','Электромагнитные колебания','Сложный','Когда ток в LC-контуре максимален: при максимальном заряде или при нулевом заряде?','при нулевом заряде','','Когда заряд конденсатора равен нулю, энергия электрического поля перешла в магнитную, ток максимален.',31);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-32','№6','Колебания и волны','Электромагнитные колебания','Сложный','Если L = 2 Гн, I = 3 А. Найдите энергию магнитного поля.','9','Дж','W = LI²/2 = 2 · 9 / 2 = 9 Дж.',32);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-33','№7','Оптика','Геометрическая оптика','База','Угол падения света 30°. Чему равен угол отражения?','30','°','По закону отражения угол падения равен углу отражения.',33);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-34','№8','Оптика','Геометрическая оптика','База','Показатель преломления среды 1,5. Скорость света в вакууме 3·10⁸ м/с. Найдите скорость света в среде.','2e8','м/с','v = c/n = 3·10⁸/1,5 = 2·10⁸ м/с.',34);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-35','№9','Оптика','Линзы','Средний','Фокусное расстояние линзы 0,25 м. Найдите оптическую силу.','4','дптр','D = 1/F = 1/0,25 = 4 дптр.',35);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-36','№10','Оптика','Линзы','Средний','Предмет находится на 30 см от линзы, изображение — на 60 см. Найдите увеличение.','2','','Γ = f/d = 60/30 = 2.',36);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-37','№11','Оптика','Волновая оптика','Сложный','Разность хода равна 2λ. Максимум или минимум наблюдается?','максимум','','Целое число длин волн даёт максимум интерференции.',37);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-38','№12','Оптика','Волновая оптика','Сложный','Какое явление показывает огибание светом препятствий?','дифракция','','Огибание препятствий волной называется дифракцией.',38);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-39','№13','Квантовая физика','Фотоэффект','Средний','Энергия фотона равна 6,6·10⁻¹⁹ Дж. h = 6,6·10⁻³⁴ Дж·с. Найдите частоту.','1e15','Гц','ν = E/h = 10¹⁵ Гц.',39);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-40','№14','Квантовая физика','Фотоэффект','Средний','Что увеличивает энергию фотона: частота или яркость?','частота','','E = hν, энергия фотона зависит от частоты.',40);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-41','№15','Квантовая физика','Атом Бора','Средний','Электрон перешёл на более низкий уровень энергии. Фотон поглощается или излучается?','излучается','','При переходе вниз энергия уменьшается, избыток энергии уходит в виде фотона.',41);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-42','№16','Квантовая физика','Атом Бора','Средний','Разность энергий уровней равна 3 эВ. Чему равна энергия излучённого фотона?','3','эВ','Энергия фотона равна разности уровней.',42);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-43','№17','Квантовая физика','Ядерная физика','Сложный','Через один период полураспада осталось 80 ядер. Сколько было изначально?','160','ядер','За один период число ядер уменьшается в 2 раза. Значит было 160.',43);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-44','№18','Квантовая физика','Ядерная физика','Сложный','Через два периода полураспада осталось 25% вещества. Верно или неверно?','верно','','После двух периодов остаётся 1/4 = 25%.',44);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-kinematics-p1','Задание 1','Механика','Кинематика','База','Тело движется равномерно со скоростью 8 м/с. Какой путь оно пройдёт за 12 секунд?','96','м','S = v · t = 8 · 12 = 96 м.',45);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-kinematics-p2','Задание 2','Механика','Кинематика','База','Скорость тела изменилась с 4 м/с до 16 м/с за 6 секунд. Найдите ускорение.','2','м/с²','a = (v - v₀) / t = (16 - 4) / 6 = 2 м/с².',46);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-kinematics-p3','Задание 3','Механика','Движение по окружности','Средний','Тело движется по окружности радиуса 5 м со скоростью 10 м/с. Найдите центростремительное ускорение.','20','м/с²','aₙ = v²/R = 10²/5 = 20 м/с².',47);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-dynamics-p1','Задание 1','Механика','Динамика','База','На тело массой 6 кг действует равнодействующая сила 18 Н. Найдите ускорение тела.','3','м/с²','a = F/m = 18/6 = 3 м/с².',48);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-dynamics-p2','Задание 2','Механика','Динамика','База','Масса тела 7 кг. Найдите силу тяжести при g = 10 м/с².','70','Н','F_тяж = mg = 7 · 10 = 70 Н.',49);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-friction-p1','Задание 1','Механика','Сила трения','База','Коэффициент трения 0,3, сила реакции опоры 40 Н. Найдите силу трения скольжения.','12','Н','F_тр = μN = 0,3 · 40 = 12 Н.',50);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-friction-p2','Задание 2','Механика','Сила трения','База','Как направлена сила трения скольжения относительно движения тела?','против движения','','Сила трения скольжения направлена против относительного движения тела по поверхности.',51);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-momentum-p1','Задание 1','Механика','Импульс','База','Тело массой 4 кг движется со скоростью 6 м/с. Найдите импульс тела.','24','кг·м/с','p = m · v = 4 · 6 = 24 кг·м/с.',52);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-momentum-p2','Задание 2','Механика','Импульс','База','До взаимодействия импульс системы равен 15 кг·м/с. Чему он будет равен после взаимодействия, если система замкнута?','15','кг·м/с','В замкнутой системе импульс сохраняется: p_до = p_после = 15 кг·м/с.',53);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-energy-p1','Задание 1','Механика','Работа и энергия','База','Сила 10 Н переместила тело на 5 м в направлении действия силы. Найдите работу.','50','Дж','A = F · S · cos0° = 10 · 5 = 50 Дж.',54);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-energy-p2','Задание 2','Механика','Работа и энергия','База','Тело массой 2 кг движется со скоростью 4 м/с. Найдите кинетическую энергию.','16','Дж','E_кин = mv²/2 = 2 · 16 / 2 = 16 Дж.',55);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-oscillations-waves-p1','Задание 1','Механика','Колебания и волны','База','Тело совершило 30 колебаний за 15 секунд. Найдите частоту.','2','Гц','ν = N/t = 30/15 = 2 Гц.',56);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-oscillations-waves-p2','Задание 2','Механика','Колебания и волны','База','Частота колебаний 5 Гц. Найдите период.','0.2','с','T = 1/ν = 1/5 = 0,2 с.',57);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-statics-p1','Задание 1','Механика','Статика','База','Сила 15 Н действует на плечо 0,2 м. Найдите момент силы.','3','Н·м','M = F · L = 15 · 0,2 = 3 Н·м.',58);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-statics-p2','Задание 2','Механика','Статика','База','Какой должна быть сумма моментов сил при равновесии тела?','0','','Второе условие равновесия: ΣMᵢ = 0.',59);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-hydrostatics-p1','Задание 1','Механика','Гидростатика','База','Найдите давление воды на глубине 5 м. ρ = 1000 кг/м³, g = 10 м/с².','50000','Па','p = ρgh = 1000 · 10 · 5 = 50000 Па.',60);
insert into tasks (id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('bank-mechanics-hydrostatics-p2','Задание 2','Механика','Гидростатика','База','На поршень площадью 2 м² действует давление 100 Па. Найдите силу давления.','200','Н','F = p · S = 100 · 2 = 200 Н.',61);

insert into exams (id,title,description,level,duration,sort_order) values ('exam-1','Пробный вариант ЕГЭ №1','Диагностический вариант для первого знакомства с форматом экзамена.','Базовый',235,1);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-1','exam-1','№1','Механика','','База','Тело движется равномерно со скоростью 5 м/с. Какой путь оно пройдёт за 12 с?','60','м','s = vt = 5 · 12 = 60 м.',1);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-2','exam-1','№2','Механика','','База','Скорость изменилась с 4 до 16 м/с за 6 с. Найдите ускорение.','2','м/с²','a = (16 - 4)/6 = 2 м/с².',2);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-3','exam-1','№7','МКТ','','Средний','Газ получил 400 Дж теплоты и совершил работу 150 Дж. Найдите ΔU.','250','Дж','ΔU = Q - A = 400 - 150 = 250 Дж.',3);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-4','exam-1','№10','МКТ','','База','При постоянной температуре объём газа увеличили в 2 раза. Как изменилось давление?','уменьшилось в 2 раза','','pV = const, значит давление уменьшается в 2 раза.',4);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-5','exam-1','№11','Электродинамика','','База','Напряжение 12 В, сопротивление 4 Ом. Найдите силу тока.','3','А','I = U/R = 12/4 = 3 А.',5);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-6','exam-1','№13','Электродинамика','','Средний','Если расстояние между зарядами увеличили в 2 раза, во сколько раз уменьшится сила?','4','раз','F ~ 1/r², значит уменьшится в 4 раза.',6);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-7','exam-1','№16','Колебания и волны','','База','Частота 5 Гц. Найдите период.','0.2','с','T = 1/f = 1/5 = 0,2 с.',7);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-8','exam-1','№19','Оптика','','Средний','Фокусное расстояние линзы 0,5 м. Найдите оптическую силу.','2','дптр','D = 1/F = 1/0,5 = 2 дптр.',8);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-9','exam-1','№24','Квантовая физика','','Высокая','Энергия фотона 6,6·10⁻¹⁹ Дж, h = 6,6·10⁻³⁴ Дж·с. Найдите частоту.','1e15','Гц','ν = E/h = 10¹⁵ Гц.',9);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-10','exam-1','№26','Механика','','Высокая','Тело массой 2 кг поднято на 5 м. Найдите потенциальную энергию при g = 10 м/с².','100','Дж','Eп = mgh = 2 · 10 · 5 = 100 Дж.',10);

insert into exams (id,title,description,level,duration,sort_order) values ('exam-2','Пробный вариант ЕГЭ №2','Вариант с упором на механику, МКТ и электродинамику.','Средний',235,2);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-11','exam-2','№1','Механика','','База','Тело за 20 с прошло 100 м равномерно. Найдите скорость.','5','м/с','v = s/t = 100/20 = 5 м/с.',1);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-12','exam-2','№4','Механика','','Средний','Сила 30 Н действует на тело массой 10 кг. Найдите ускорение.','3','м/с²','a = F/m = 30/10 = 3 м/с².',2);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-13','exam-2','№8','МКТ','','База','Масса вещества объёмом 4 м³, плотность 2 кг/м³. Найдите массу.','8','кг','m = ρV = 2 · 4 = 8 кг.',3);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-14','exam-2','№11','Электродинамика','','Средний','Сила тока 4 А, напряжение 5 В. Найдите мощность.','20','Вт','P = UI = 5 · 4 = 20 Вт.',4);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-15','exam-2','№15','Электродинамика','','Сложный','Магнитный поток изменился на 1,2 Вб за 4 с. Найдите модуль ЭДС.','0.3','В','|ε| = ΔΦ/Δt = 1,2/4 = 0,3 В.',5);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-16','exam-2','№17','Колебания и волны','','База','Волна имеет длину 4 м и частоту 25 Гц. Найдите скорость.','100','м/с','v = λf = 4 · 25 = 100 м/с.',6);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-17','exam-2','№19','Оптика','','База','Угол падения 40°. Найдите угол отражения.','40','°','По закону отражения угол отражения равен углу падения.',7);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-18','exam-2','№22','Оптика','','Средний','Показатель преломления 1,5, c = 3·10⁸ м/с. Найдите скорость света в среде.','2e8','м/с','v = c/n = 2·10⁸ м/с.',8);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-19','exam-2','№24','Квантовая физика','','Средний','Электрон перешёл на более низкий уровень. Фотон поглощается или излучается?','излучается','','При переходе вниз атом излучает фотон.',9);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-20','exam-2','№25','Квантовая физика','','Высокая','Через два периода полураспада осталось какая доля вещества?','25','%','После двух периодов остаётся 1/4 = 25%.',10);

insert into exams (id,title,description,level,duration,sort_order) values ('exam-3','Пробный вариант ЕГЭ №3','Тренировочный вариант с задачами повышенной сложности.','Сложный',235,3);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-21','exam-3','№2','Механика','','База','Тело ускоряется от 0 до 20 м/с за 10 с. Найдите ускорение.','2','м/с²','a = (20 - 0)/10 = 2 м/с².',1);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-22','exam-3','№5','Механика','','Средний','Тело массой 3 кг движется со скоростью 4 м/с. Найдите кинетическую энергию.','24','Дж','Eк = mv²/2 = 3 · 16 / 2 = 24 Дж.',2);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-23','exam-3','№8','МКТ','','Средний','Тело массой 2 кг нагрели на 5 °C, c = 200 Дж/(кг·°C). Найдите Q.','2000','Дж','Q = cmΔt = 200 · 2 · 5 = 2000 Дж.',3);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-24','exam-3','№11','Электродинамика','','База','Сопротивление 10 Ом, ток 2 А. Найдите напряжение.','20','В','U = IR = 2 · 10 = 20 В.',4);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-25','exam-3','№14','Электродинамика','','Средний','B = 1 Тл, I = 2 А, l = 3 м, угол 90°. Найдите силу Ампера.','6','Н','F = BIl = 1 · 2 · 3 = 6 Н.',5);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-26','exam-3','№16','Колебания и волны','','База','Тело совершило 30 колебаний за 15 с. Найдите частоту.','2','Гц','f = N/t = 30/15 = 2 Гц.',6);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-27','exam-3','№18','Оптика','','Средний','Фокусное расстояние 0,25 м. Найдите оптическую силу.','4','дптр','D = 1/F = 1/0,25 = 4 дптр.',7);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-28','exam-3','№20','Оптика','','Сложный','Разность хода равна 3λ. Что наблюдается: максимум или минимум?','максимум','','Целое число длин волн даёт максимум.',8);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-29','exam-3','№24','Квантовая физика','','Средний','От чего зависит энергия фотона: от частоты или яркости?','частоты','','E = hν, энергия зависит от частоты.',9);
insert into exam_tasks (id,exam_id,number,topic,subtopic,difficulty,question,answer,unit,solution,sort_order) values ('exam-task-30','exam-3','№26','Квантовая физика','','Высокая','Через один период полураспада осталось 60 ядер. Сколько было изначально?','120','ядер','За один период число ядер уменьшается в 2 раза.',10);

