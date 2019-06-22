Unit Degree;
Interface
  Type
    func=function(a:real;b:integer):string;
  function stup(a:real;b:integer):string;
  procedure writeln(var a1:real;var b1:integer;stup:func);
Implementation
  function stup(a:real;b:integer):string;
    var
      i,n:integer;
      S:real;
      k:string;
    begin
      if a=0 then
        if b<=0 then stup:='Uncertainly'
          else stup:='0'
        else
          begin
            S:=1;
            n:=abs(b);
            for i:=1 to n do S:=S*a;
            if b>=0 then
              begin
                str(S,k);
                stup:=k
              end
              else
                begin
                  S:=1/S;
                  str(S,k);
                  stup:=k
                end;
          end;
    end;
  procedure writeln(var a1:real;var b1:integer;stup:func);
    begin
      write('input x,x=');
      read(a1);
      write('input y,y=');
      read(b1);
      write(a1,'^',b1,'=',stup(a1,b1),'; ')
    end;
end.