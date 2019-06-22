link l3:ct
accept r10:0 \младшие розряды результата
accept r11:0 \старшие розряды результата
accept r2:0FFF9h \x = -7 в ДК
accept r3:8005h \у = -5 в ПК
accept r4:8000h \для определения старшего бита в r2
accept r9:0     \для определения знака результата
accept r8:10h   \счетчик циклов

{load rm,z;}
{and nil,r2,8000h;load rm,flags;}
{cjp rm_z,check;}\если r2 - положительное, то в ПК не переводим.
{add r9, r9, 8000h, z;}\ставим отметку в r9
{xor r2,r2,0FFFFh;}\это и следущее - перевод r2 в ПК
{add r2,r2,1,z;}
{and r2, r2, 7fffh;}\обнуляем знаковый бит
check    {or r3,r3,r3; load rm,flags; cjp not rm_n, shift;}\проверка знакового бита в r3. Если 0 - shift
         {add r9, r9, 8000h,z;}\это и следущее - аналогично r2
         {and r3, r3, 7fffh;}
start    {and nil, r2, r4; load rm, flags; cjp rm_z, shift;}\проверяем старший бит в r2.Если 0 -shift
         {add r10, r10, r3, z; load rm, flags;} \r10 = r10+r3. Загружаем бит переполнения в rm
         {add r11, r11, z, rm_c;} \r11 = r11+бит переполнения
shift    {or sll, r2, r2, z;} \сдвиг влево r2
         {sub r8, r8, z, z; load rm, flags; cjp rm_z, setSign;}\декремент счетчика. Если 0 - setSign
         {or sl.16, r10, r10, z;}\сдвиг влево r10
         {or sl.25, r11, r11, z; cjp nz, start;} \сдвиг влево r11. Переход на метку start
setSign  {load rm, z;} \обнуление rm
         {or sll, r9, r9; cjp not rm_c, end;} \сдвиг влево r9. Если сдвинули 0 - end.
         {xor r11, r11, 0ffffh;} \это и следущее - смена знака результата на отрицательный
         {xor r10, r10, 0ffffh;}
end{} \конец программы
