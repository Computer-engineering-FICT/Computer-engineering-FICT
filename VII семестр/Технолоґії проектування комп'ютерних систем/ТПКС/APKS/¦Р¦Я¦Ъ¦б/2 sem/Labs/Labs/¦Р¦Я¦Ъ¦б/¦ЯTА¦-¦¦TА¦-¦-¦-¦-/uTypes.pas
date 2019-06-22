unit uTypes;

interface
type
  TNode = record
    Name: string;
  end;

  TNodes = array of TNode;

  TConn = array of array of integer;

  TWay = array of integer;
  TWays = array of TWay;

  TCycles = array of integer;
implementation

end.
