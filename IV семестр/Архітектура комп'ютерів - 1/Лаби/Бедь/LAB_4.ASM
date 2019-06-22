link ewh: 16
link l1: ct
link l2: rdm

accept rdm_delay: 2

equ COD:5000h

dw 1000h:500fh
dw 000fh:0fffbh

\Адреса мікрокоманди
accept r7:1000h
accept r15:8007h

\Область програми
{xor nil, r11, r11; oey; ewh;}
{or nil, r7, z; oey; ewl;}
\Завантеження мікрокоманди з ОП у регістр R8
load_k
{cjp rdm, load_k; r; or r8, bus_d, z; load rm, flags;}
\Перевірка адресації
{cjp rm_n, double_a;}
  \Перевірка і занесення операції в R12
  {and r12, r8, 7800h;}
  {xor nil, r12, COD; load rm, flags;}
  {cjp not rm_z, nMainMul;}
  \Перевірка адресації
  {and nil, r8, 0400h; load rm, flags;}
  {cjp not rm_z, indirect;}
  \Завантеження адреси операнда на шину даних
  {xor nil, r11, r11; oey; ewh;}
  {or r11, r11, r8;}
  {and r11, r11, 03ffh;}
  {or nil, r11, z; oey; ewl;}
  \Завантаження операнда з ОП в R10
  load_o
  {cjp rdm, load_o; r; or r10, bus_d, z;}
  \Множення
    \Підготовка даних в регістрах
 \r11,r10 - M
 \r12 - X
 {xor r11, r11, r11;}
    {xor r12, r12, r12;}
    {or r12, r12, r15;}
    {xor r15, r15, r15;}
    \Перевірка знаку для X
    {or r9, r9, 8000h;}
    {and r9, r9, r12; load rm, flags;}
    {and r12, r12, 7fffh;}
    \Перевірка знаку для Y
    {or r13, r13, 8000h;}
    {and r13, r13, r10; load rm, flags;}
    {cjp rm_z, lable1;}
    {sub r10, z, r10, nz;}

    \Множення 2-им способом
  lable1
    {or r5, r5, 0001h;}
    {and r5, r5, r12;load rm, flags;}
    {cjp rm_z, lable2;}
    {add r15, r15, r10, z; load rm, flags;}
    {add r14, r14, r11, rm_c;}
  lable2
    {or srl, r12, r12, z;}
    {or sll, r10, r10, z;}
    {or sl.25, r11, r11, z;}
    {or r12, r12, z; load rm, flags;}
    {cjp not rm_z, lable1;}
    \Встановлення знаку результату
    {xor r9, r9, r13;}
    {or r14, r14, r9;}
 {cjp nz, end_cmd;}
        \Непряма адресація
        indirect
  {}
\Двоадресна команда
double_a
{}
\Не моя операція
nMainMul
{}
end_cmd
\Формування адреси наступної команди
{add r7, r7, z, nz;}
