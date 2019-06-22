PROGRAM Bakalavrat;

USES Crt, DOS, Graph{ 640*480 }, Summit, Mouse, Service, Imitate;

VAR Driver, Mode: Integer;
Procedure AllInit;
Begin
     Randomize;
     Driver:= VGA;
     Mode:= VGAhi;
     InitGraph( Driver, Mode, '' );
     InitMouse( 0, 0, GetMaxX-2, GetMaxY-2, GetMaxX div 2, GetMaxY div 2 );
     MouseShow;
End;

Procedure CreationCount;
Var Key: Char;
    BeginSummit, EndSummit: PSummit;
Begin
   Menu;
   Button(NminX,NminY,NmaxX,NmaxY,'New'        ,0 ,7,False);
   Button(LminX,LminY,LmaxX,LmaxY,'Open  Ctr+O',0 ,7,False);
   Button(SminX,SminY,SmaxX,SmaxY,'Save  Ctr+S',0 ,7,False);
   Button(CminX,CminY,CmaxX,CmaxY,'Option'     ,0 ,7,False);
   Button(AminX,AminY,AmaxX,AmaxY,'About'      ,0 ,7,False);
   Button(HminX,HminY,HmaxX,HmaxY,'?'          ,0 ,7,False);
   Button(XminX,XminY,XmaxX,XmaxY,'X'          ,0, 7,False);
   Button(JminX,JminY,JmaxX,JmaxY,'üèî'        ,15,0,False);
   Button(OminX,OminY,OmaxX,OmaxY,'Ok'         ,15,0,False);
   if ( ParamCount <> 0 ) then Open;
   repeat
      GetMouseStatus;
{      if AllOkToShowMethod then ShowMethod; {}
      if AllOkToPressButton(NminX,NminY,NmaxX,NmaxY,'New',0 ,7) or
                           (Key = 'N') or (Key = 'n') then AllNew;
      if AllOkToPressButton(LminX,LminY,LmaxX,LmaxY,'Open  Ctr+O',0,7) or
                           (Key = #15) then Open;
      if AllOkToPressButton(SminX,SminY,SmaxX,SmaxY,'Save  Ctr+S',0,7) or
                           (Key = #19) then Save;
      if AllOkToPressButton(CminX,CminY,CmaxX,CmaxY,'Option',0,7) then Option;
      if AllOkToPressButton(AminX,AminY,AmaxX,AmaxY,'About',0,7) then About;
      if AllOkToPressButton(HminX,HminY,HmaxX,HmaxY,'?',0,7) or
                            (Key = #59) then Help;
      if (AllOkToPressButton(XminX,XminY,XmaxX,XmaxY,'X',0,7) or
                    (Key = #27)) and ExitProgramm then Break;
      if AllOkToPressButton(JminX,JminY,JmaxX,JmaxY,'üèî',15,0) then ShowJPF;
      if( AllOkToPressButton(OminX,OminY,OmaxX,OmaxY,'Ok',15,0)or(Key = #13)or
          (Key = #9) ) and ( StartPRecordSummit <> Nil )
          then if Modelirovanie then Break;
      if AllOkToAddSummit then AddSummit;
      if AllOkToChangeValueSummit then ChangeValueSummit;
      if AllOkToNewLine(BeginSummit, EndSummit) then
                NewLine(BeginSummit, EndSummit);
      if AllOkToChangeValueLine(BeginSummit, EndSummit) then
                ChangeValueLine(BeginSummit, EndSummit);
      if AllOkToDelSummit then DelSummit;
      if AllOkToDelLine(BeginSummit, EndSummit) then
                DelLine(BeginSummit, EndSummit);
      if AllOkToMoveSummit then MoveSummit;
      if KeyPressed then Key:= ReadKey else Key:= #255;
      if (Key = 'C') or (Key = 'c') then ShowAllAnew;
      if Key = #0 then
      begin
         Key:= ReadKey;
         if Key = #45 then Break;
      end;{}
   until False;
End;

Procedure AllDone;
Begin
   DestroyAllObject_And_DisposeRecordSummit;
   CloseGraph;
End;

BEGIN
   {SwapVectors;
   Exec('keyrus.com','');
   SwapVectors;{}
   AllInit;
   FieldCount( 8, 15 );
   CreationCount;
   AllDone;
END.