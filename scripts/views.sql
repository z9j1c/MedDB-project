/* === 1st PART === */

/*
    Основная информация о пациентах:
        id, имя, год рождения.
    Может пригодиться при составлении списков, с которыми будут работать люди,
    не имеющие полного доступа к персональным данным.
*/
CREATE VIEW PATIENT_GENERAL_INFO AS
    SELECT patient_id,
           patient_nm,
           DATE_PART('year', birth_dt) as birth_year
    FROM PATIENT;

/*
    Основная информация о сотрудниках
*/
CREATE VIEW EMPLOYEE_GENERAL_INFO AS
    SELECT employee_id,
           employee_nm,
           DATE_PART('year', birth_dt) as birth_year
    FROM EMPLOYEE;

/*
    VIEW последних занимаемых должностей по каждому сотруднику:
    текущие должности и последние должности уже не работающих сотрудников
*/
CREATE VIEW LAST_POSITION AS
    SELECT ALL_POS.employee_id,
           ALL_POS.position_title
    FROM POSITION ALL_POS
    WHERE ALL_POS.begin_dt = (select max(begin_dt) from position where ALL_POS.employee_id = employee_id);

/*
    VIEW уже оказанных медицинских услуг:
    id назначения, id услуги, дата оказания
*/
CREATE VIEW PROVIDED_SERVICE AS
    SELECT record_id,
           service_id,
           providing_dt
    FROM CLINICAL_RECORD
    WHERE providing_dt < CURRENT_DATE;


/* === 2nd PART === */

/*
    Статистика посещения сотрудниками конференций:
        title - название конференции
        people_count -количество участвоваших сотрудников
*/
CREATE VIEW CONF_STAT AS
    SELECT CNF.conf_title AS title,
           PEOPLE.cnt AS people_count
    FROM CONFERENCE CNF
        LEFT JOIN (SELECT DISTINCT conf_id, count(*) OVER(PARTITION BY conf_id) AS cnt FROM CONF_X_EMPLOYEE) PEOPLE
            ON CNF.conf_id = PEOPLE.conf_id;

/*
    VIEW статистики по статьям:
        employee_id - ID сотрудника
        articles_count - кол-во статей сотрудника
        patients_count - кол-во пациентов сотрудника

*/
CREATE VIEW ARTICLE_CORR_PATIENTS AS
    SELECT EMPLOYEE.employee_id,
           (CASE WHEN ART_STAT.articles_cnt IS NULL THEN 0 ELSE ART_STAT.articles_cnt END) AS articles_count,
           (CASE WHEN PATIENT_STAT.patients_cnt IS NULL THEN 0 ELSE PATIENT_STAT.patients_cnt END) AS patients_count
    FROM EMPLOYEE
        LEFT JOIN (SELECT DISTINCT employee_id,
                                   COUNT(*) OVER(PARTITION BY employee_id) AS articles_cnt
                   FROM article) ART_STAT
            ON ART_STAT.employee_id = EMPLOYEE.employee_id
        LEFT JOIN (SELECT DISTINCT doctor_id,
                                   COUNT(*) OVER(PARTITION BY doctor_id) AS patients_cnt
                   FROM MEDFILE) PATIENT_STAT
            ON PATIENT_STAT.doctor_id = EMPLOYEE.employee_id;

/*
    (Вспомогательное VIEW для MEDICINE_STAT)
     Добавление к информации о выданном лекарстве к таблице выдачи (MEDICINE_DISPERSING)
*/
CREATE VIEW MEDICINE_COMMON AS
    SELECT M.medicine_title,
           M.dispersing_id,
           DISP.patient_id,
           DISP.employee_id
    FROM MEDICINE M RIGHT JOIN MEDICINE_DISPERSING DISP ON M.dispersing_id = DISP.dispersing_id

/*
    VIEW статистики по выданным лекарствам
        title - название лекарства
        dispersed_times - количество выдач лекарства
        patient_id - количество пациентов, получавших лекарство
*/
CREATE VIEW MEDICINE_STAT AS
    SELECT MC.medicine_title AS title,
           COUNT(MC.dispersing_id) OVER(PARTITION BY MC.medicine_title) AS dispersed_times,
           (SELECT COUNT(DISTINCT patient_id) FROM MEDICINE_COMMON WHERE MC.medicine_title = MEDICINE_COMMON.medicine_title) AS pat
    FROM MEDICINE_COMMON MC;