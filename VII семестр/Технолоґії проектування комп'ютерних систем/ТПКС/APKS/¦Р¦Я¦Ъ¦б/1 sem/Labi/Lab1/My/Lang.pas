unit Lang;

interface
const
  Divider                 = ' - ';

  {русский}
(*
  {Осн. заголовки}
  Title                 = 'Синтез цифрового автомата';
  About                 = 'О программе...';

  {Заголовки сообщений}
  Mes                   = 'Сообщение';
  Err                   = 'Ошибка';
  Quest                 = 'Запрос';

  {Сообщения}
  GraphIsModifiedNeedSave = 'Граф-схема была изменена, сохранить изменения?';
  HaveFileVithThisName  = 'Файл с таким именем уже существует, перезаписать?';
  ErrorOpenGraphFile    = 'Ошибка при открытии файла, возможно файл не является ' +
                          'стандартным файлом граф-схем, или поврежден.';
  NoErrors              = 'Проверка корректности графа успешно завершена';
  EmptyTop              = 'Пустая вершина!';
  HaveNoBegin           = 'Отсутствует вершина ''Начало''!';
  HaveNoEnd             = 'Отсутствует вершина ''Конец''!';
  MoreThanOneBegin      = 'Может быть только одна вершина ''Начало''!';
  MoreThanOneEnd        = 'Может быть только одна вершина ''Конец''!';
  HaveNoOper            = 'Должна присутствовать хотя-бы одна операторная вершина!';
  TopHaveNoTies         = 'Вершина не связанна с другими!';
  TopHaveToManyTies     = 'Вершина имеет слишком много связей!';
  UncorrectJumpNum      = 'Некорректный номер перехода!';
  TempHaveNoIn          = 'Отсутствуют соответствующие входящие вершины!';
  TempHaveNoOut         = 'Отсутствует соответствующая выходящая вершина!';
  TopHaveNoPathToEnd    = 'Вершина не имеет выхода к вершине ''Конец''!';
  CycleHaveNoExit       = 'Цикл не имеет выхода!';
  CondTiesInOneTop      = 'Выходы условной вершины входят в одну и ту же вершину!';
  AlreadyHaveThisNum    = 'Выход имеет номер, который уже используется!';
  NoBeginEndPath        = 'Начальная вершина не связана с конечной'

  {Обозначения вершин}
  BeginTitle            = 'Начало';
  EndTitle              = 'Конец';
*)
  {english}
//(*
  {Осн. заголовки}
  Title                 = 'Synthesis of the digital automatic device';
  About                 = 'About...';

  {Заголовки сообщений}
  Mes                   = 'Message';
  Err                   = 'Error';
  Quest                 = 'Question';

  {Сообщения}
  GraphIsModifiedNeedSave = 'The graph-sceme was changed. Save changes?';
  HaveFileVithThisName  = 'The file with such name already exists, rewrite?';
  ErrorOpenGraphFile    = 'Error opening file, probably a file is not a standard ' +
                          'file of graph-sceme, or is damaged.';
  NoErrors              = 'Check of a correctness the graph is successfully completed.';
  EmptyTop              = 'Empty top!';
  HaveNoBegin           = 'There is no top ''Begin''!';
  HaveNoEnd             = 'There is no top ''End''!';
  MoreThanOneBegin      = 'There may be only one top ''Begin''!';
  MoreThanOneEnd        = 'There may be only one top ''End''!';
  HaveNoOper            = 'There should be even one operational top!';
  TopHaveNoTies         = 'The top is not connected with others!';
  TopHaveToManyTies     = 'The top has too many ties!';
  UncorrectJumpNum      = 'Incorrect number of jump!';
  TempHaveNoIn          = 'There are no appropriate entering tops!';
  TempHaveNoOut         = 'There is no appropriate leaving top!';
//  TopHaveNoPathToEnd    = 'The top has no an path to top ''End''!';
  CycleHaveNoExit       = 'The cycle has no an exit!';
  CondTiesInOneTop      = 'Outputs of conditional top enter into the one top!';
  AlreadyHaveThisNum    = 'This jump number already in use!';
  NoBeginEndPath        = 'Have no path ''Begin'' - ''End''!';
  TopHaveNoPathToBegin  = 'Top have no path to ''Begin''!';
  TopHaveNoPathToEnd    = 'Top have no path to ''End''!';
  CycleWithNoOper       = 'Need to have operatinal top in the cycle!';
  CycleWithNoCond       = 'Need to have conditional top in the cycle!';

  {Обозначения вершин}
  BeginTitle            = 'Begin';
  EndTitle              = 'End';
//*)

implementation

end.
