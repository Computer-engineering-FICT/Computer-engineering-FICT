unit ListControl;

interface
 uses classes;

 type
   TMatrList = class(TList)
       FColCount : integer;
       FRowCount : integer;
       function MatrGet(RID,CID:Integer): Pointer;virtual;
       procedure MatrPut(RID,CID:Integer; Item: Pointer);virtual;
     public
       constructor Create(Rows,Cols:integer);
       function RowCount:integer;
       function ColCount:integer;
       procedure Resize(Rows,Cols:integer);
       property MatrItems[RIndex,CIndex: Integer]: Pointer read MatrGet write MatrPut; default;
   end;

   TIntVector = class(TList)
       function MatrGet(ID:Integer): integer;virtual;
       procedure MatrPut(ID:Integer; Item: integer);virtual;
     public
       constructor Create(Count:integer);
       procedure Reset(Value:integer);
       property MatrItems[ID: Integer]: Integer read MatrGet write MatrPut; default;
   end;

   TIntMatrix = class(TMatrList)
       function MatrGet(RID,CID:Integer): integer;virtual;
       procedure MatrPut(RID,CID:Integer; Item: integer);virtual;
     public
       constructor Create(Rows,Cols:integer);
       property MatrItems[RIndex,CIndex: Integer]: Integer read MatrGet write MatrPut; default;
   end;



implementation

    constructor TMatrList.Create(Rows,Cols:integer);
    var i:integer;
    begin
      Inherited Create;
      FRowCount:=Rows;
      FColCount:=Cols;
      for i:=1 to Rows*Cols do Add(nil);
    end;

    procedure TMatrList.Resize(Rows,Cols:integer);
    var i:integer;
    begin
      Clear;
      FRowCount:=Rows;
      FColCount:=Cols;
      for i:=1 to Rows*Cols do Add(nil);
    end;

    function TMatrList.RowCount:integer;
    begin
      Result:=FRowCount
    end;

    function TMatrList.ColCount:integer;
    begin
      Result:=FColCount
    end;

    function TMatrList.MatrGet(RID,CID:Integer): Pointer;
    begin
      Result:=Get(ColCount*RID+CID)
    end;

    procedure TMatrList.MatrPut(RID,CID:Integer; Item: Pointer);
    begin
      Put(ColCount*RID+CID,Item)
    end;

    // IntVector

    constructor TIntVector.Create(Count:integer);
    var i:integer;
        Res:^integer;
    begin
      Inherited Create;
      for i:=0 to Count-1 do
      begin
        new(Res);
        Res^:=0;
        Items[i]:=Res;
      end;
    end;

    procedure TIntVector.Reset(Value:integer);
    var i:integer;
        Res:^integer;
    begin
      for i:=0 to Count-1 do
      begin
        Res:=Get(i);
        Res^:=Value 
      end;
    end;

    function TIntVector.MatrGet(ID:Integer): Integer;
    var Res:^integer;
    begin
      Res:=Get(ID);
      Result:=Res^
    end;

    procedure TIntVector.MatrPut(ID:Integer; Item: Integer);
    var Res:^integer;
    begin
      Res:=Get(ID);
      Res^:=Item;
    end;

    // IntMatrixs

    constructor TIntMatrix.Create(Rows,Cols:integer);
    var i:integer;
        Res:^integer;
    begin
      Inherited Create(Rows,Cols);
      for i:=0 to Count-1 do
      begin
        new(Res);
        Res^:=0;
        Items[i]:=Res;
      end;
    end;

    function TIntMatrix.MatrGet(RID,CID:Integer): Integer;
    var Res:^integer;
    begin
      Res:=Get(ColCount*RID+CID);
      Result:=Res^
    end;

    procedure TIntMatrix.MatrPut(RID,CID:Integer; Item: Integer);
    var Res:^integer;
    begin
      Res:=Get(ColCount*RID+CID);
      Res^:=Item;
    end;


end.
