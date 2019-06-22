    #Продивитись список викладачів
    SELECT Name
    FROM lector;
    
    #Продивитись додаткову інформацію користувача Hades
    SELECT Info
    FROM user
    WHERE (user.Name = 'Hades');
    
    #Обрати з розкладу час занятть викладача Hermes Zeus
    SELECT Time
    FROM lessonDate, lector
    WHERE (lessonDate.ID_lector = lector.ID) AND (lector.Name = 'Hermes Zeus');
    
    #Обрати студентів, яким поставлено оцінки
    SELECT ID,Name,Code
    FROM student
    WHERE ID IN (SELECT ID_student FROM mark);
    
    #Продивитись аудиторії на 3 поверсі, в яких не відбувається жодного заняття
    SELECT ID,Number
    FROM room
    WHERE (room.Number > 300) AND (room.Number < 400) AND room.ID NOT IN (SELECT ID_room FROM lesson);
    
    #Обрати предмети, з яких є лабораторні
    SELECT Name
    FROM subject
    WHERE (subject.ID NOT IN (SELECT ID_subject FROM plan WHERE plan.ID_load NOT IN 
            (SELECT ID FROM loadType WHERE (loadType.Name = 'lab'))));
    
    #Продивитись (для подальшого сумування) рейтингові бали студента Hades Cronus у викладача Hermes Zeus
    SELECT Time,Value
    FROM mark
    JOIN lessonDate ON (mark.ID_lesson = lessonDate.ID)
    WHERE (ID_type IN (SELECT ID FROM markTYPE WHERE Name = 'point'))
    AND (ID_student = (SELECT ID FROM student WHERE Name = 'Hades Cronus'))
    AND (ID_lector IN (SELECT ID FROM lector WHERE Name= 'Hermes Zeus'));