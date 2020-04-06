/* This script fills up database tables with test data */
SET DATESTYLE TO DMY;

/* PATIENTS table */
INSERT INTO PATIENTS values (1, 'Васильева Ольга Ивановна', '1/2/1980', 2, 643);
INSERT INTO PATIENTS values (2, 'Алгол Пётр Васильевич', '5/7/1985', 1, 643);
INSERT INTO PATIENTS values (3, 'Быков Родион Ярославович', '29/8/1991', 1, 643);
INSERT INTO PATIENTS values (4, 'Владимирова Мила Андреевна', '12/12/1976', 2, 112);
INSERT INTO PATIENTS values (5, 'Самсонова Хельга Авксентьевна', '6/10/1981', 2, 398);
INSERT INTO PATIENTS values (6, 'Ситников Владимир Вадимович', '30/7/1993', 1, 643);
INSERT INTO PATIENTS values (7, 'Некрасов Корнелий Сергеевич', '13/4/1985', 1, 643);
INSERT INTO PATIENTS values (8, 'Пономарёв Артур Филатович', '13/1/1999', 1, 398);
INSERT INTO PATIENTS values (9, 'Аксёнова Оксана Эльдаровна', '8/4/1989', 2, 643);
INSERT INTO PATIENTS values (10, 'Николаева Кристина Леонидовна', '5/11/1977', 2, 112);

/* EMPLOYEES table */
INSERT INTO EMPLOYEES values (1, 'Маслова Стелла Константиновна', 'Заведующий отделением', '6/8/1963', 2, '1/3/1988');
INSERT INTO EMPLOYEES values (2, 'Одинцова Лейла Леонидовна', 'Врач-нефролог', '7/5/1967', 2, '1/5/1995');
INSERT INTO EMPLOYEES values (3, 'Петров Остап Эдуардович', 'Врач-нефролог', '19/11/1967', 1, '1/8/1995');
INSERT INTO EMPLOYEES values (4, 'Вишняков Павел Юлианович', 'Врач-нефролог', '8/8/1971', 1, '1/8/1997');
INSERT INTO EMPLOYEES values (5, 'Субботин Герасим Валерьевич', 'Старший научный сотрудник', '4/5/1972', 1, '1/6/2001');
INSERT INTO EMPLOYEES values (6, 'Шестакова Алиса Михаиловна', 'Младший научный сотрудник', '13/11/1995', 2, '1/3/2017');
INSERT INTO EMPLOYEES values (7, 'Мишин Терентий Лукьевич', 'Младший научный сотрудник', '24/4/1994', 1, '1/2/2015');
INSERT INTO EMPLOYEES values (8, 'Макарова Алла Серапионовна', 'Старшая медсестра', '3/9/1973', 2, '1/7/1991');
INSERT INTO EMPLOYEES values (9, 'Носова Анастасия Сергеевна', 'Постовая медсестра', '15/10/1988', 2, '1/2/1992');
INSERT INTO EMPLOYEES values (10, 'Иванкова Анна Анатольевна', 'Постовая медсестра', '16/1/1991', 2, '1/2/1992');

/* FILES table */
INSERT INTO FILES values (1, 1, 3, '1/2/2005');
INSERT INTO FILES values (2, 2, 2, '1/4/2005');
INSERT INTO FILES values (3, 3, 3, '4/3/2010');
INSERT INTO FILES values (4, 4, 3, '5/4/2011');
INSERT INTO FILES values (5, 5, 2, '15/1/2012');
INSERT INTO FILES values (6, 6, 4, '18/2/2012');
INSERT INTO FILES values (7, 7, 3, '2/2/2013');
INSERT INTO FILES values (8, 3, 3, '12/5/2013');
INSERT INTO FILES values (9, 8, 2, '6/3/2014');
INSERT INTO FILES values (10, 9, 2, '8/12/2015');
INSERT INTO FILES values (11, 10, 2, '19/11/2018');

/* CLINICAL_SUMMARIES table */
INSERT INTO CLINICAL_SUMMARIES values (1, 'Почечная недостаточность', 'Полный покой и УЗИ', 'Не есть яблоки');
INSERT INTO CLINICAL_SUMMARIES values (2, 'Непереносимость лимонов', 'МРТ всего', 'Тяжёлая хроническая форма');
INSERT INTO CLINICAL_SUMMARIES values (3, 'Наглость хитромордая', 'Клизма', 'Рекомендованы ежедневные пробежки');
INSERT INTO CLINICAL_SUMMARIES values (4, 'Подвижность левой почки', 'Бииохимия мочи', 'Работа-работа-работа');
INSERT INTO CLINICAL_SUMMARIES values (5, 'Подвижность правой почки', 'Исследование гормонов мочи', 'Не пить компот');
INSERT INTO CLINICAL_SUMMARIES values (6, 'Нефроптоз', 'Электрокардиография', 'Не есть паштет');
INSERT INTO CLINICAL_SUMMARIES values (7, 'Гидронефроз', 'УЗДГ артерий верхних и нижних конечностей', 'Посещать бассейн');
INSERT INTO CLINICAL_SUMMARIES values (8, 'Наглость хитромордая', 'Электроэнцефалография', 'Не принимать анальгетики');
INSERT INTO CLINICAL_SUMMARIES values (9, 'Уретрит', 'Ультразвуковая допплерография сосудов головного мозга', 'Не принимать опиоиды');
INSERT INTO CLINICAL_SUMMARIES values (10, 'Цистит', 'Оценка эластических свойств сосудов', 'Посещать бассейн');
INSERT INTO CLINICAL_SUMMARIES values (11, 'Пиелонефрит', 'Спирометрия', 'Больше гулять ради витамина D3');

/* DUTIES table */
INSERT INTO DUTIES values (1, '2019-01-09 12:00:00', '2019-01-10 12:00:00', '204');
INSERT INTO DUTIES values (2, '2019-01-10 12:00:00', '2019-01-11 12:00:00', '205');
INSERT INTO DUTIES values (3, '2019-01-11 12:00:00', '2019-01-12 12:00:00', '204');
INSERT INTO DUTIES values (4, '2019-01-12 12:00:00', '2019-01-13 12:00:00', '205');
INSERT INTO DUTIES values (5, '2019-01-13 12:00:00', '2019-01-14 12:00:00', '205');
INSERT INTO DUTIES values (6, '2019-01-14 12:00:00', '2019-01-15 12:00:00', '205a');
INSERT INTO DUTIES values (7, '2019-01-15 12:00:00', '2019-01-16 12:00:00', '204');
INSERT INTO DUTIES values (8, '2019-01-16 12:00:00', '2019-01-17 12:00:00', '205');
INSERT INTO DUTIES values (9, '2019-01-17 12:00:00', '2019-01-18 12:00:00', '204');
INSERT INTO DUTIES values (10, '2019-01-18 12:00:00', '2019-01-19 12:00:00', '205');

/* CLINICAL_RECORDS table */
INSERT INTO CLINICAL_RECORDS values (1, '466', 1, '1/12/2006', '2/12/2006', 2);
INSERT INTO CLINICAL_RECORDS values (2, '34535', 2, '2/1/2006', '2/1/2006', 3);
INSERT INTO CLINICAL_RECORDS values (3, '65667', 3, '14/11/2011', '16/11/2011', 2);
INSERT INTO CLINICAL_RECORDS values (4, '23434', 4, '1/11/2012', '3/11/2012', 4);
INSERT INTO CLINICAL_RECORDS values (5, '888', 5, '7/12/2013', '8/12/2013', 4);
INSERT INTO CLINICAL_RECORDS values (6, '666', 6, '9/3/2014', '9/4/2014', 3);
INSERT INTO CLINICAL_RECORDS values (7, '131', 2, '4/2/2006', '5/2/2006', 2);
INSERT INTO CLINICAL_RECORDS values (8, '125', 2, '5/6/2006', '13/6/2006', 2);
INSERT INTO CLINICAL_RECORDS values (9, '252', 9, '12/7/2016', '30/7/2016', 3);
INSERT INTO CLINICAL_RECORDS values (10, '777', 10, '17/7/2019', '17/8/2019', 3);

/* SPECIALIST_ADVICES table */
INSERT INTO SPECIALIST_ADVICES values ('23rrfff', 5, 1, '1/12/2006', 'Боли в спине', 'Реокмендовано не лежать на гвоздях');
INSERT INTO SPECIALIST_ADVICES values ('4578457', 6, 2, '5/1/2006', 'Плохой сон', 'Не спать');
INSERT INTO SPECIALIST_ADVICES values ('jfnj556', 5, 3, '1/12/2011', 'Невкусно есть яблоки', 'Не есть');
INSERT INTO SPECIALIST_ADVICES values ('57hhhjj', 5, 4, '1/1/2013', 'Боли в животе', 'Принимать ношпу');
INSERT INTO SPECIALIST_ADVICES values ('56ggggg', 6, 4, '1/1/2014', 'Повышенный Ca', 'Принимать соотв. препараты');
INSERT INTO SPECIALIST_ADVICES values ('kkmkmkk', 6, 2, '7/7/2006', 'Повышенный Mg', 'Принимать соотв. препараты');
INSERT INTO SPECIALIST_ADVICES values ('56ggggg', 5, 2, '8/8/2006', 'Повышенный F', 'Принимать соотв. препараты');
INSERT INTO SPECIALIST_ADVICES values ('jnjn555', 6, 8, '8/1/2020', 'Повышенный Ca', 'Принимать соотв. препараты');
INSERT INTO SPECIALIST_ADVICES values ('clpdl34', 6, 8, '9/1/2020', 'Повышенный Mg', 'Принимать соотв. препараты');
INSERT INTO SPECIALIST_ADVICES values ('32kmkk7', 6, 8, '10/1/2020', 'Повышенный F', 'Принимать соотв. препараты');

/* MEDICINE_DISPERSING table */
INSERT INTO MEDICINE_DISPErSING values (1, 1, 9);
INSERT INTO MEDICINE_DISPErSING values (2, 2, 10);
INSERT INTO MEDICINE_DISPErSING values (3, 3, 10);
INSERT INTO MEDICINE_DISPErSING values (4, 3, 9);
INSERT INTO MEDICINE_DISPErSING values (5, 6, 9);
INSERT INTO MEDICINE_DISPErSING values (6, 6, 9);
INSERT INTO MEDICINE_DISPErSING values (7, 5, 10);
INSERT INTO MEDICINE_DISPErSING values (8, 9, 9);
INSERT INTO MEDICINE_DISPErSING values (9, 7, 10);
INSERT INTO MEDICINE_DISPErSING values (10, 7, 9);

/* MEDICINE table */
INSERT INTO MEDICINE values (1, 'Стадол');
INSERT INTO MEDICINE values (2, 'Допидолор');
INSERT INTO MEDICINE values (3, 'Просидол');
INSERT INTO MEDICINE values (4, 'Скенан');
INSERT INTO MEDICINE values (5, 'Инстанил');
INSERT INTO MEDICINE values (6, 'М-Эслон');
INSERT INTO MEDICINE values (7, 'Просидол');
INSERT INTO MEDICINE values (8, 'Инстанил');
INSERT INTO MEDICINE values (9, 'М-Эслон');
INSERT INTO MEDICINE values (10, 'Просидол');

/* ARTICLES table */
INSERT INTO MEDICINE values ('10.1000/xyz123', 6);
INSERT INTO MEDICINE values ('10.10450/xyz123', 5);
INSERT INTO MEDICINE values ('10.1000/xjkz23', 7);
INSERT INTO MEDICINE values ('10.1000/xyz153', 7);
INSERT INTO MEDICINE values ('10.1000/xyz888', 5);
INSERT INTO MEDICINE values ('10.3002/xyz435', 7);
INSERT INTO MEDICINE values ('10.5868/xfz123', 5);
INSERT INTO MEDICINE values ('10.1030/gg5g66', 7);
INSERT INTO MEDICINE values ('10.1023kmvkf5', 6);
INSERT INTO MEDICINE values ('10.2222/xtk183', 5);

/* CONFERENCES table */
INSERT INTO CONFERENCES values (1, 'Global NNHN', 304);
INSERT INTO CONFERENCES values (2, 'NeuroConf 1', 314);
INSERT INTO CONFERENCES values (3, 'NeuroConf 2', 336);
INSERT INTO CONFERENCES values (4, 'NephroConf 1', 214);
INSERT INTO CONFERENCES values (5, 'NephroConf 2', 222);
INSERT INTO CONFERENCES values (6, 'NephroConf 3', 145);
INSERT INTO CONFERENCES values (7, 'NephroConf 4', 111);
INSERT INTO CONFERENCES values (8, 'WHO Conf 2017', 302);
INSERT INTO CONFERENCES values (9, 'WHO Conf 2018', 172);
INSERT INTO CONFERENCES values (10, 'WHO Conf 2019', 136);

/* SCIENTIFIC_COUNCIL */
INSERT INTO SCIENTIFIC_COUNCIL values (1, '8/1/2019', 'РАССМОТРЕТЬ!');
INSERT INTO SCIENTIFIC_COUNCIL values (2, '15/1/2019', 'ВЗЯТЬ НА КАРАНДАШ!');
INSERT INTO SCIENTIFIC_COUNCIL values (3, '22/1/2019', 'ПОДВЕРГНУТЬ ИССЛЕДОВАНИЮ!');
INSERT INTO SCIENTIFIC_COUNCIL values (4, '29/1/2019', 'ЗАКРЫТЬ!');
INSERT INTO SCIENTIFIC_COUNCIL values (5, '1/3/2019', 'ЗАПРЕТИТЬ!');
INSERT INTO SCIENTIFIC_COUNCIL values (6, '8/3/2019', 'УДАЛИТЬ!');
INSERT INTO SCIENTIFIC_COUNCIL values (7, '15/3/2019', 'ВЫЧЕРКНУТЬ!');
INSERT INTO SCIENTIFIC_COUNCIL values (8, '22/3/2019', 'ПОСТАВИТЬ НОВЫЕ ЗАДАЧИ!');
INSERT INTO SCIENTIFIC_COUNCIL values (9, '29/3/2019', 'СТАТЬ УДАРНИКАМИ НАЧУНОГО ТРУДА!');
INSERT INTO SCIENTIFIC_COUNCIL values (10, '3/5/2019', 'ОБОГНАТЬ И ПЕРЕГНАТЬ!');

/* CONF_X_EMPLOYEES table */
INSERT INTO CONF_X_EMPLOYEES values (1, 1);
INSERT INTO CONF_X_EMPLOYEES values (2, 3);
INSERT INTO CONF_X_EMPLOYEES values (2, 2);
INSERT INTO CONF_X_EMPLOYEES values (2, 4);
INSERT INTO CONF_X_EMPLOYEES values (3, 5);
INSERT INTO CONF_X_EMPLOYEES values (3, 6);
INSERT INTO CONF_X_EMPLOYEES values (4, 1);
INSERT INTO CONF_X_EMPLOYEES values (5, 2);
INSERT INTO CONF_X_EMPLOYEES values (6, 2);
INSERT INTO CONF_X_EMPLOYEES values (7, 3);
INSERT INTO CONF_X_EMPLOYEES values (8, 3);
INSERT INTO CONF_X_EMPLOYEES values (9, 1);
INSERT INTO CONF_X_EMPLOYEES values (10, 2);

/* COUNCIL_X_EMPLOYESS table */
INSERT INTO COUNCIL_X_EMPLOYESS values (1, 5);
INSERT INTO COUNCIL_X_EMPLOYESS values (1, 6);
INSERT INTO COUNCIL_X_EMPLOYESS values (2, 5);
INSERT INTO COUNCIL_X_EMPLOYESS values (2, 7);
INSERT INTO COUNCIL_X_EMPLOYESS values (3, 5);
INSERT INTO COUNCIL_X_EMPLOYESS values (3, 7);
INSERT INTO COUNCIL_X_EMPLOYESS values (4, 5);
INSERT INTO COUNCIL_X_EMPLOYESS values (4, 6);
INSERT INTO COUNCIL_X_EMPLOYESS values (5, 5);
INSERT INTO COUNCIL_X_EMPLOYESS values (5, 6);
INSERT INTO COUNCIL_X_EMPLOYESS values (6, 5);
INSERT INTO COUNCIL_X_EMPLOYESS values (6, 6);
INSERT INTO COUNCIL_X_EMPLOYESS values (7, 5);
INSERT INTO COUNCIL_X_EMPLOYESS values (7, 7);
INSERT INTO COUNCIL_X_EMPLOYESS values (8, 5);
INSERT INTO COUNCIL_X_EMPLOYESS values (8, 6);
INSERT INTO COUNCIL_X_EMPLOYESS values (9, 5);
INSERT INTO COUNCIL_X_EMPLOYESS values (9, 6);
INSERT INTO COUNCIL_X_EMPLOYESS values (10, 5);
INSERT INTO COUNCIL_X_EMPLOYESS values (10, 7);

/* DUTIES_X_EMPLOYEES table */
INSERT INTO DUTIES_X_EMPLOYEES values (9, 1);
INSERT INTO DUTIES_X_EMPLOYEES values (10, 2);
INSERT INTO DUTIES_X_EMPLOYEES values (8, 2);
INSERT INTO DUTIES_X_EMPLOYEES values (9, 3);
INSERT INTO DUTIES_X_EMPLOYEES values (10, 4);
INSERT INTO DUTIES_X_EMPLOYEES values (9, 5);
INSERT INTO DUTIES_X_EMPLOYEES values (8, 5);
INSERT INTO DUTIES_X_EMPLOYEES values (10, 6);
INSERT INTO DUTIES_X_EMPLOYEES values (9, 7);
INSERT INTO DUTIES_X_EMPLOYEES values (8, 7);
INSERT INTO DUTIES_X_EMPLOYEES values (8, 8);
INSERT INTO DUTIES_X_EMPLOYEES values (10, 8);
INSERT INTO DUTIES_X_EMPLOYEES values (9, 9);
INSERT INTO DUTIES_X_EMPLOYEES values (10, 10);