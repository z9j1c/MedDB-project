--- SECTION 1

/*
    Функция для соответствующего триггера - POSITION_UPDATER_TRG
*/
CREATE OR REPLACE FUNCTION update_position_date() RETURNS TRIGGER AS $$
    BEGIN
        UPDATE POSITION SET end_dt = NEW.begin_dt
            WHERE begin_dt = (SELECT begin_dt FROM POSITION WHERE employee_id = NEW.employee_id AND end_dt = '1/1/9999');
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

/*
    Триггер на добавление записей в версионную таблицу должностей POSITION
    Цель: автоматически обновлять дату окончания записи о предыдущей должности
*/
CREATE TRIGGER POSITION_UPDATER_TRG
    BEFORE INSERT
    ON POSITION
    FOR EACH ROW
    EXECUTE PROCEDURE update_position_date();


--- SECTION 2

/*
    Функция для соответствующего триггера - EMPLOYEE_STATUS_UPDATER_TRG
*/
CREATE OR REPLACE FUNCTION update_employee_status() RETURNS TRIGGER AS $$
    BEGIN
        IF TG_OP = 'INSERT' THEN
            UPDATE EMPLOYEE SET status_txt = 'Working' WHERE NEW.employee_id = employee_id;
        ELSEIF TG_OP = 'UPDATE' AND NEW.end_dt <> '1/1/9999' THEN
            UPDATE EMPLOYEE SET status_txt = 'Former' WHERE NEW.employee_id = employee_id;
        END IF;
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

/*
    Триггер на добавление и обновление записей в версионную таблицу должностей POSITION
    Цель: автоматически обновлять статус работника в таблице EMPLOYEE
*/
CREATE TRIGGER EMPLOYEE_STATUS_UPDATER_TRG
    AFTER INSERT OR UPDATE
    ON POSITION
    FOR EACH ROW
    EXECUTE PROCEDURE update_employee_status();