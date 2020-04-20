/* Список работников, чей стаж составляет 25 или более лет */
SELECT EMPLOYEE.employee_nm
FROM POSITION LEFT JOIN EMPLOYEE ON POSITION.employee_id = EMPLOYEE.employee_id
GROUP BY employee.employee_id HAVING SUM(
        CASE WHEN POSITION.end_dt > '3000-01-01' THEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', POSITION.begin_dt)
        ELSE DATE_PART('year', POSITION.end_dt) - DATE_PART('year', POSITION.begin_dt) END
    ) >= 25;

/* Список из количества проведённых консультаций по каждому врачу, проведшему хотя бы одну, в порядке убывания */
SELECT COUNT(*) as cnt, EMPLOYEE.employee_nm
FROM SPECIALIST_ADVICE LEFT JOIN EMPLOYEE ON SPECIALIST_ADVICE.employee_id = EMPLOYEE.employee_id
GROUP BY EMPLOYEE.employee_nm ORDER BY cnt DESC;

/* Список сотрудниц от самых старших до самых молодых с указанием следующего по возрасту сотрудника */
SELECT employee_nm as name, LEAD(employee_nm) OVER(ORDER BY birth_dt) as prev_name, birth_dt FROM EMPLOYEE
WHERE sex_code = 2;

/* Вывести для каждого автора статей количество его работ */
SELECT DISTINCT EMPLOYEE.employee_nm AS name, COUNT(*) OVER(PARTITION BY ARTICLE.employee_id) as cnt
FROM ARTICLE LEFT JOIN EMPLOYEE ON ARTICLE.employee_id = EMPLOYEE.employee_id;

/* Список пациентов, у которых есть 2-я мед. карта, заведённая в 2013 году или позже */
SELECT PATIENT.patient_nm FROM
    (SELECT
        RANK() OVER(PARTITION BY patient_id ORDER BY register_dt) as rnk,
        patient_id,
        register_dt
        FROM MEDFILE
    ) AS RANKED_FILE LEFT JOIN PATIENT ON PATIENT.patient_id = RANKED_FILE.patient_id
WHERE RANKED_FILE.register_dt >= '2013-01-01' AND RANKED_FILE.rnk = 2;