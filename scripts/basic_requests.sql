/* CRUD[ CREATE ] */

-- New employee
INSERT INTO EMPLOYEE values (11, 'Дроздова Карина Дмитрьевна', '1982-03-07', 2);
INSERT INTO POSITION values (11, 'Врач-невролог', '2008-09-01');

-- Info about new conference
INSERT INTO CONFERENCE values(11, 'Разведение мышей в условиях ограниченной видимости', 543);
INSERT INTO CONF_X_EMPLOYEE values(11, 11);
INSERT INTO CONF_X_EMPLOYEE values(11, 6);


/* CRUD[ READ ] */

-- Get all conferences visits by all visitors
SELECT
    CONFERENCE.conf_title as title,
    EMPLOYEE.employee_nm as name
FROM
    CONF_X_EMPLOYEE LEFT JOIN
    CONFERENCE ON CONF_X_EMPLOYEE.conf_id = CONFERENCE.conf_id LEFT JOIN
    EMPLOYEE ON CONF_X_EMPLOYEE.employee_id = EMPLOYEE.employee_id
ORDER BY name;

-- Get all subjects and conclusions for 'Субботин Герасим Валерьевич'
SELECT
    SPECIALIST_ADVICE.subject_txt as subject,
    SPECIALIST_ADVICE.conclusion_txt as conclusion
FROM
    SPECIALIST_ADVICE LEFT JOIN EMPLOYEE
    ON EMPLOYEE.employee_id = SPECIALIST_ADVICE.employee_id
WHERE EMPLOYEE.employee_nm = 'Субботин Герасим Валерьевич';

/* CRUD[ UPDATE ] */

-- Doctor has got married --> change surname
UPDATE EMPLOYEE
    SET employee_nm = 'Горбунова Анна Анатольевна'
WHERE employee_nm = 'Иванкова Анна Анатольевна';

-- Doctor has changed sex
UPDATE EMPLOYEE
    SET sex_code = 2
WHERE employee_nm = 'Мишин Терентий Лукьевич';


/* CRUD[ DELETE ] */

-- Article was removed from all journals, it is a plagiarism
DELETE FROM ARTICLE WHERE doi_code = '10.1030/gg5g66';