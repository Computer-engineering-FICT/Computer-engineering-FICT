-- выборка из 2 таблиц
SELECT user_name, mail_type FROM `IO-34_2Team`.User, `IO-34_2Team`.Mail
WHERE Mail.User_user_id=User.user_id;

-- сортировка
SELECT * FROM `IO-34_2Team`.Mail ORDER BY  mail_read DESC;

-- агрегатные ф-ции
SELECT SUM(mail_read) FROM `IO-34_2Team`.Mail;

--  дополнительные условия
SELECT mail_type FROM `IO-34_2Team`.Mail WHERE mail_read IN 
(SELECT mail_read FROM `IO-34_2Team`.Mail WHERE mail_read=1)
;


SELECT MAX(user_id) FROM `IO-34_2Team`.User;

SELECT MID(mail_type, 1, 3) FROM `IO-34_2Team`.Mail;