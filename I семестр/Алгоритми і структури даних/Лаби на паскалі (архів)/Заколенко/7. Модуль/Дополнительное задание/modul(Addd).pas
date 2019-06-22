Unit AddD;
interface
  type
    func=function(a:real;b:real):real;
  function add(a:real;b:real):real;
  procedure exec(var a1:real;var b1:real;add:func;var S:real);
implementation
  function add(a:real;b:real):real;
    begin
      add:=a+b;
    end;
  procedure exec(var a1:real;var b1:real;add:func;var S:real);
    BEGIN
      read(a1);
      read(b1);
      S:=add(a1,b1);
    END;
end.
