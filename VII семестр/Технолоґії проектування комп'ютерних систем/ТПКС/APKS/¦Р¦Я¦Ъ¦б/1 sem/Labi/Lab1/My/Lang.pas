unit Lang;

interface
const
  Divider                 = ' - ';

  {�������}
(*
  {���. ���������}
  Title                 = '������ ��������� ��������';
  About                 = '� ���������...';

  {��������� ���������}
  Mes                   = '���������';
  Err                   = '������';
  Quest                 = '������';

  {���������}
  GraphIsModifiedNeedSave = '����-����� ���� ��������, ��������� ���������?';
  HaveFileVithThisName  = '���� � ����� ������ ��� ����������, ������������?';
  ErrorOpenGraphFile    = '������ ��� �������� �����, �������� ���� �� �������� ' +
                          '����������� ������ ����-����, ��� ���������.';
  NoErrors              = '�������� ������������ ����� ������� ���������';
  EmptyTop              = '������ �������!';
  HaveNoBegin           = '����������� ������� ''������''!';
  HaveNoEnd             = '����������� ������� ''�����''!';
  MoreThanOneBegin      = '����� ���� ������ ���� ������� ''������''!';
  MoreThanOneEnd        = '����� ���� ������ ���� ������� ''�����''!';
  HaveNoOper            = '������ �������������� ����-�� ���� ����������� �������!';
  TopHaveNoTies         = '������� �� �������� � �������!';
  TopHaveToManyTies     = '������� ����� ������� ����� ������!';
  UncorrectJumpNum      = '������������ ����� ��������!';
  TempHaveNoIn          = '����������� ��������������� �������� �������!';
  TempHaveNoOut         = '����������� ��������������� ��������� �������!';
  TopHaveNoPathToEnd    = '������� �� ����� ������ � ������� ''�����''!';
  CycleHaveNoExit       = '���� �� ����� ������!';
  CondTiesInOneTop      = '������ �������� ������� ������ � ���� � �� �� �������!';
  AlreadyHaveThisNum    = '����� ����� �����, ������� ��� ������������!';
  NoBeginEndPath        = '��������� ������� �� ������� � ��������'

  {����������� ������}
  BeginTitle            = '������';
  EndTitle              = '�����';
*)
  {english}
//(*
  {���. ���������}
  Title                 = 'Synthesis of the digital automatic device';
  About                 = 'About...';

  {��������� ���������}
  Mes                   = 'Message';
  Err                   = 'Error';
  Quest                 = 'Question';

  {���������}
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

  {����������� ������}
  BeginTitle            = 'Begin';
  EndTitle              = 'End';
//*)

implementation

end.
