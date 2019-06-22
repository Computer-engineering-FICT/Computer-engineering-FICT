
/* добавление типа пользователей */
/*
insert into categoryusers (name) Value ("аналитик");
insert into categoryusers (name) Value ("эксперт");
insert into categoryusers (name) Value ("кандидат");
select *
from categoryusers;
*/
/* добавление пользователей */
/*
insert into user (login,password,name,category_id,photo) value("Ivanov","password","Иванов Иван Иванович",1,null);
insert into user (login,password,name,category_id,photo) value("Petrov","petrov","Петров Григорий Александрович",2,null);
insert into user (login,password,name,category_id,photo) value("Sidorov","123456","Сидоров Максим Константинович",3,null);
insert into user (login,password,name,category_id,photo) value("Ivanenko","IvArPet","Иваненко Артем Петрович",2,null);
insert into user (login,password,name,category_id,photo) value("Irina","Irina","Григориева Ирина Петровна",3,null);
insert into user (login,password,name,category_id,photo) value("Zuzua","Zuzua111","Зюзя Владимир Александрович",1,null);
*/
/* добавление контактов */
/*
insert into contcacts (contact,user_id) value ("+38068888888",1);
insert into contcacts (contact,user_id) value ("+38068888887",1);
insert into contcacts (contact,user_id) value ("+38050344232",2);
insert into contcacts (contact,user_id) value ("+38068234209",3);
insert into contcacts (contact,user_id) value ("+38069543492",6);
insert into contcacts (contact,user_id) value ("+38092359022",5);
insert into contcacts (contact,user_id) value ("+38023451412",4);
*/
/* добавление мест работы */
/*
insert into placeofwork (work,User_id) Value ("менеджер",1);
insert into placeofwork (work,User_id) Value ("инженер",2);
insert into placeofwork (work,User_id) Value ("стажер",3);
insert into placeofwork (work,User_id) Value ("программист",4);
insert into placeofwork (work,User_id) Value ("без работы",5);
insert into placeofwork (work,User_id) Value ("менеджер",6);
*/
/* добавление группы экспертов */
/*insert into groupofexperts (Director_id) Value(1);
select * 
From groupofexperts;
*/
/* добавление составов групп экспертов */
/*
insert into consists (user_id,groupOfExperts_id)value(2,7);
insert into consists (user_id,groupOfExperts_id) value(4,7);

select * 
From consists;
*/
/* добавление тестов */
/*
insert into test (Author_id,task) value (2,"Тест1");
insert into test (Author_id,task) value (4,"Тест2");
insert into test (Author_id,task) value (2,"Тест3");
insert into test (Author_id,task) value (2,"Тест4");

select * 
From test;
*/

/* добавление единиц измерения*/
/*
insert into units (name) value ("метр");
insert into units (name) value ("час");
insert into units (name) value ("гривна");
insert into units (name) value ("человек");
insert into units (name) value ("штука");
select * 
From units;
*/


/* добавление типа ресурса*/
/*
insert into resursetype (name,units_id) value("эксперт",4);
insert into resursetype (name,units_id) value("сварщик",4);
insert into resursetype (name,units_id) value("плотник",4);
insert into resursetype (name,units_id) value("время",2);
insert into resursetype (name,units_id) value("деньги",3);
insert into resursetype (name,units_id) value("гвозди",5);

select * 
From resursetype;
*/

/* добавление заявки*/
/*
insert into request (user_id,ResurseType_id,content) value(3,1,"Хочу стать экспертом");
insert into request (user_id,ResurseType_id,content) value(6,3,"Хочу стать плотником");
select * 
From request;
*/

/* добавление результата тестирования*/
/*
insert into resulttest(test_id,Request_id,result) value(2,1,"Тест не пройден");
insert into resulttest(test_id,Request_id,result) value(3,2,"Тест пройден на отлично");
select * 
From resulttest;
*/

/* добавление ресурса*/
/*
insert into resurse (ResurseType_id,comment) value(6,"100 мм - 5 штук");
insert into resurse (ResurseType_id,comment) value(3,"1 плотник");

select * 
From resurse;
*/

/* добавление задачи*/
/*
insert into task (name,criterion,analysisTime,ParentTask_id) value("поремонтировать стол","стол не шатается","01:00:00",null);
select * 
From task;
*/
/* добавление необходимых ресурсов для задачи*/
/*
insert into resurseuse (Resurse_id,Task_id,count,target) value (1,1,"5","починить стол");
insert into resurseuse (Resurse_id,Task_id,count,target) value (2,1,"1","починить стол");
select * 
From resurseuse;
*/