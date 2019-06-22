uses GraphABC,Utils;

   Var x0,y0:integer;
         t: DateTime;
         s1,s2,s3:string;
begin
SetWindowCaption('Часы');
SetWindowSize(500,100);
SetFontName('Arial');
SetFontStyle(fsBoldItalic);
SetFontSize(50);
SetFontColor(RGB(Random(255),Random(255),Random(255)));

  x0 := (WindowWidth - TextWidth('00 : 00 : 00')) div 2;
  y0 := (WindowHeight - TextHeight('00 : 00 : 00')) div 2;
  while True do
  begin
    t := CurrentDateTime;
    str(t.Hour:2,s1);
    str(t.Minute:2,s2);
    str(t.Second:2,s3);
    TextOut(x0,y0,s1+' : '+s2+' : '+s3+' ');
    Sleep(1000);
  end;
end.
