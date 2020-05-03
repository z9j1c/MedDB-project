/*
    Запросы по должностям часто имеют условие на дату вступления в должность,
    сама же таблица обновляется нечасто.
*/
CREATE INDEX POSITION_DATE_INDEX ON POSITION (
        begin_dt DESC
    );

/*
    Для таблицы EMPLOYEE имеет смысл индекс только по дате рождения,
    нацеленный на запросы об ограничении обязанностей сотрудников в силу возраста;
    таблица EMPLOYEE обновляется нечасто.
*/
CREATE INDEX EMPLOYEE_BIRTH_INDEX ON EMPLOYEE (
        birth_dt ASC
    );

/*
    Индекс направлен на запросы с ограничением по одному timestamp'у
    или на ограничения с использованием AND/OR между условиями на
    begin_dttm и end_dttm.
*/
CREATE INDEX DUTY_BEGIN_TIME_INDEX ON DUTY (
        begin_dttm DESC,
        end_dttm DESC
    );

/*
    Индекс направлен на запросы по возрастным группам
    пациентов с простыми условиями на даты рождения
*/
CREATE INDEX PATIENT_BIRTH_INDEX ON PATIENT (
        birth_dt DESC
    );

/*
    Индекс направлен на запросы о выдаче лекарств пациентов (проверки, что выдачы
    состоялись)
*/
CREATE INDEX MEDICINE_DISPERSING_INDEX ON MEDICINE_DISPERSING (
        patient_id,
        employee_id
    );

/*
    Индекс направлен на простые запросы с условием на определённый
    service_id (тип исследования)
*/
CREATE INDEX CLINICAL_RECORD_SERVICE_INDEX ON CLINICAL_RECORD (
        service_id
    );

/*
    Индекс направлен на запросы по определённому пациенту (мед. карте)
*/
CREATE INDEX CLINICAL_RECORD_MEDFILE_INDEX ON CLINICAL_RECORD (
        medfile_id,
        providing_dt DESC
    );


/*
    Два индекса по таблице SPECIALIST_ADVICE направлены на запросы,
    выбирающие либо по поациенту, либо по сотруднику. Дополнительно индексы
    строятся по дате.
*/
CREATE INDEX ADVICE_EMLOYEE_INDEX ON SPECIALIST_ADVICE (
        employee_id,
        advice_dt DESC
    );
CREATE INDEX ADVICE_PATIENT_INDEX ON SPECIALIST_ADVICE (
        medfile_id,
        advice_dt DESC
    );

/*
     Два индекса по таблице MEDFILE направлены на запросы,
     выбирающие либо по пациенту, либо по сотруднику.
     Дополнительно индексы простраиваются по дате регистрации карты.
     Таблица MEDFILE обновляется относительно нечасто.
*/
CREATE INDEX MEDFILE_EMPLOYEE_INDEX ON MEDFILE (
        medfile_id,
        register_dt ASC
    );
CREATE INDEX MEDFILE_PATIENT_INDEX ON MEDFILE (
        patient_id,
        register_dt ASC
    );