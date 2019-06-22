link l3: ct\Завдання зв'язку між L1 і CT
link l1: rdm
accept r1:0 \Початкова r3
accept r2:7fffh \установка r1
accept r3:7fffh \регістрів r2
accept r11:17 \і лічильника циклів r4

{or r0,r2,z;} \  копируем r1 в rq
{xor sll,r0,r0,r2;} \ RM_C теперь содержит знак резултата = R1[15] xor R2[15]
{xor sr.9,R1,R1;} \ R3[15]= знак результата, R3[14..0]=0

{or sll,nil,r2,z;} \ rm_c <= r1[15]
{cjp not RM_C,label0;} \ Если число отрицательное
{xor R2,R2,1111111111111111%;} \ Инверсия множимого
{add R2,R2,z,nz;} / +1
label0
{or sll,nil,R3,z;}\ rm_c <= r2[15]
{cjp not RM_C,label1;}
{xor R3,R3,1111111111111111%;}
{add R3,R3,z,nz;}
{cont;load rm, z;}    \Обнулення RM
{label1 cjp not rm_c,label2;}   \Аналіз цифри множника
{add r1,r1,r9,z;}      \Додавання множеного до R12
{label2 or srl,r1,r1,z;}   \Зсув в R12 і R10 суми
{or sr.9,r3,r3,z;}  \часткових добутків
{sub r3,r3,z,z;load rm,flags;cem_c;}  \Декремент і перевірка
{cjp not rm_z, label1; }    \на нуль лічильника (R11)
{}
