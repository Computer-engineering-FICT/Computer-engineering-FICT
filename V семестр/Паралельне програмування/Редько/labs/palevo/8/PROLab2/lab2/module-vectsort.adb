separate (Module)
procedure VectSort(a: in out Vector) is
   flag: boolean := true;
   help: integer;
begin
   while flag loop
      flag := false;
      for i in 2..N loop
         if a(i-1) < a(i) then
            help := a(i-1);
            a(i-1) := a(i);
            a(i) := help;
            flag := true;
         end if;
      end loop;
   end loop;
end VectSort;
