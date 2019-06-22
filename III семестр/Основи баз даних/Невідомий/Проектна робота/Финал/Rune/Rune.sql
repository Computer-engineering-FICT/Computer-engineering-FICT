    #����������� ������ ����������
    SELECT Name
    FROM lector;
    
    #����������� ��������� ���������� ����������� Hades
    SELECT Info
    FROM user
    WHERE (user.Name = 'Hades');
    
    #������ � �������� ��� ������� ��������� Hermes Zeus
    SELECT Time
    FROM lessonDate, lector
    WHERE (lessonDate.ID_lector = lector.ID) AND (lector.Name = 'Hermes Zeus');
    
    #������ ��������, ���� ���������� ������
    SELECT ID,Name,Code
    FROM student
    WHERE ID IN (SELECT ID_student FROM mark);
    
    #����������� ������� �� 3 ������, � ���� �� ���������� ������� �������
    SELECT ID,Number
    FROM room
    WHERE (room.Number > 300) AND (room.Number < 400) AND room.ID NOT IN (SELECT ID_room FROM lesson);
    
    #������ ��������, � ���� � ����������
    SELECT Name
    FROM subject
    WHERE (subject.ID NOT IN (SELECT ID_subject FROM plan WHERE plan.ID_load NOT IN 
            (SELECT ID FROM loadType WHERE (loadType.Name = 'lab'))));
    
    #����������� (��� ���������� ���������) ��������� ���� �������� Hades Cronus � ��������� Hermes Zeus
    SELECT Time,Value
    FROM mark
    JOIN lessonDate ON (mark.ID_lesson = lessonDate.ID)
    WHERE (ID_type IN (SELECT ID FROM markTYPE WHERE Name = 'point'))
    AND (ID_student = (SELECT ID FROM student WHERE Name = 'Hades Cronus'))
    AND (ID_lector IN (SELECT ID FROM lector WHERE Name= 'Hermes Zeus'));