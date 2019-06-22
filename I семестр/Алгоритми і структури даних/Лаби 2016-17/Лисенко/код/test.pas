var
  file_: text;
begin
  rewrite(file_, 'text');
  writeln(file_, 65);
  writeln(file_,'q');
  writeln(file_,56);
  writeln(file_,'ö');
  writeln(file_,94);
  writeln(file_,'e');
  close(file_);
end.