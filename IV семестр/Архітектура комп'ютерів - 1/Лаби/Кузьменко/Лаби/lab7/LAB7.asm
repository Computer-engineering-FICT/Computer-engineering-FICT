link l1:ct
link l2:rdm
link l3:rdd
link ewh:16
link m:14,13,12,11,10,z,z,z,z,z,z,z

dw 0008h:0000010000001001%     \���� ������� �᫮����� ���室�
dw 000Ah:1000111111011100%     \���� ������� �����᪮� ����樨 �
dw 0009h:0111010000001111%     \���� ������� 㬭������ 3 ᯮᮡ��
dw 000Bh:0000110000001000%     \���� ������� ����᫮����� ���室� 8 need

dw 0004h:0001010001100010%     \input1
dw 0005h:0011010000010000%     \write 1 operand
dw 0006h:0001010001100010%     \input2
dw 0007h:0011010000010001%     \write count for mul
dw 000Ch:0100010011100010%     \output from register r6

dw 000Fh:8005h                 \�ਢ�뢠�� � ����� �����⥫� -5
dw 0010h:0FFF9h                \-7
dw 0011h:0010h                 \16

accept dev[1]:i,62h,64h,2,3
accept dev[2]:o,0E2h,0E4h,2,3
accept dev_buf[1]:0FFF9h,10h

accept r6:1234h
accept r4:1111h
accept r7:0004h
accept r15:20h
org 300h     {cjp nz, loading;}
org 200h     {cjp nz, input;}
org 600h     {cjp nz, writeOper;}
org 800h     {cjp nz, output;}
org 000h     {cjp nz, condJump;}
org 100h     {cjp nz, forcejump;}
org 180h     {cjp nz, andcom;}
org 0E00h    {cjp nz, mul;}

\--------------------------NonConditionalCommand---------------------\
forcejump {xor r7,r7,r7;}
          {and r7,r8,1FFh;}
          {cjp nz,loading;}
\--------------------------FormNewAdress-----------------------------\
newComm   {or nil,r7, bus_d; cjp not z, loading;}

\--------------------------ConditionalCommand------------------------\
condJump  {and nil, r15, 0040h;load rm,flags;}
          {cjp not rm_z,makeOut;}
          {or sla,r15,r15,z;}
          {xor r7,r7,r7;}
          {and r7,r8,1FFh;}
          {cjp nz,loading;}
\---------------------------Input------------------------------------\
input {xor r0,r0,r0;}
      {or nil,r0,z;oey;ewh;}
      {and r0,r8,3FFh;}
      {or nil,r0,z;oey;ewl;}
ready {cjp rdd,ready;i;or r10,bus_d,z;}
      {and r10,80h;load rm,flags;}
      {cjp rm_z,ready;}
      {xor r10,r10,r10;}
      {or nil,r10,z;oey;ewh;}
      {add r0,2h;}
      {or nil, r0,z; oey;ewl;}
readop  {cjp rdd,readop;i;or r1,bus_d,z;}
      {cjp not z, nextCom;}

\----------------------PreparingMultiplication------------------------\
writeOper  {xor r0,r0,r0;}
           {and r0,r8,3FFh;}
           {or nil,r0,z;oey;ewl;}
readyWR    {cjp rdm,readyWR;w;or nil,r1,z;oey;}
read1234   {cjp rdm, read1234; r; or r2,bus_d,z;}\test
           {cjp not z, nextCom;}
\---------------------------------------------------------------------\
\---------------------------------------------------------------------\
\---------------------------Work_with_Memory--------------------------\
\---------------------------------------------------------------------\
loading       {xor nil,r0,r0;oey;ewh;} \����塞 ॣ���� ����
              {or  nil,r7,z;oey;ewl;}  \�����뢠�� ���� �������
comread       {cjp rdm, comread;r; or r8,bus_d,z;load rm,flags;}\ ���뢠�� �������
              {cjp rm_n,dbAdress;}\ �᫨ �ଠ� ������� ����

              {and r0,r8,200h;}
              {cjp rm_z,end;}
              {and r0,r8,7800h;}\ �����뢠�� � r0 ��� ����樨 �१ ����
              {add nil,r0,z,z; oey; jmap;}

nextCom       {add r7,r7,1,z;}
              {cjp not z,loading;}

\---------------------------------------------------------------------\
\----------------------------Multiplication---------------------------\
\---------------------------------------------------------------------\
mul       {xor r13,r13,r13;}
          {xor r14,r14,r14;}
          {xor r0,r0,r0;}
          {or r0, r0,10h;}\load adress of first operand
          {or nil, r0,z;oey;ewl;}
readOper1 {cjp rdm, readOper1; r; or r11, bus_d,z;}
          {xor r0,r0,r0;}
          {or r0,r0,11h;}\load counts
          {or nil,r0,z;oey;ewl;}
readCount {cjp rdm, readCount; r; or r9, bus_d,z;}
          {xor r0,r0,r0;}
          {or r0,3FFh,z;}
          {and nil, r8, r0; oey; ewl;}
readOper2 {cjp rdm, readOper2; r; or r12, bus_d, z;}
          {and nil,r11,8000h;load rm,flags;}
          {cjp rm_z,check;}       \�᫨ r11 - ������⥫쭮� � � �� �� ��ॢ����
          {add r10, r10, 8000h, z;} \�⠢�� �⬥�� � r10
          {xor r11,r11,0FFFFh;}     \�� � ᫥��饥 - ��ॢ�� r2 � ��
          {add r11,r11,1,z;}
          {and r11,r11,7fffh;}    \����塞 ������� ���
check     {or r12,r12,r12; load rm,flags; cjp not rm_n, shift;}\�஢�ઠ ��������� ��� � r3. �᫨ 0 - shift
          {add r10, r10, 8000h,z;} \�� � ᫥��饥 _ �������筮 r2
          {and r12, r12, 7fffh;}
start     {and nil, r11, 8000h; load rm, flags;}
          {cjp rm_z, shift;}\�஢��塞 ���訩 ��� � r2. �᫨ 0 - shift
          {add r14, r14, r12, z; load rm, flags;} \r14 = r14+r3. ����㦠�� ��� ��९������� � rm
          {add r13, r13, z, rm_c;} \r11 = r11+��� ��९�������
shift     {or sll, r11, r11, z;} \ᤢ�� ����� r2
          {sub r9, r9, z, z; load rm, flags; cjp rm_z, setSign;}\���६��� ���稪�.�᫨ 0_���室 �� ����
          {or sl.16, r14, r14, z;}\ᤢ�� ����� r14
          {or sl.25, r13, r13, z; cjp nz, start;} \����� ����� r13.���室 �� ����
setSign   {load rm, z;} \���㫥��� rm
          {or sll, r10, r10; cjp not rm_c, nextCom;}\ ᤢ�� ����� r10. �᫨ ᤢ��㫨 0 - end.
          {or r13, r13, 8000h;}\ ᬥ�� ����� �� ����⥫��
          {cjp not z,nextCom;}
\----------------------------------------------------------------------\
\-------------------------DoubleAdressCommand--------------------------\
\----------------------------------------------------------------------\
dbAdress {or r0,r8;}
         {and r0,318h;}
         {xor r0,r0,318h;load rm,flags;}
         {cjp not rm_z,end;}
         {or r0,r8;}                 \�����뢠�� �������
         {and r0,7C00h;}             \c��뢠�� ��� ����樨
         {add nil, r0,z,z; oey; jmap;}
\---------------------------------------------------------------------\
\-------------------------LogicalAndCommand---------------------------\
\---------------------------------------------------------------------\
andcom {or r0,r8;}                 \�����뢠�� �������
       {and r0,0E0h;}              \���뢠�� ���� ��ண� ॣ����
       {or srl,r0,r0,z;}
       {or srl,r0,r0,z;}
       {or srl,r0,r0,z;}
       {or srl,r0,r0,z;}
       {or srl,r0,r0,z;}
       {ewb;oey;or nil,r0,r0;load rb;}
       {sub r0,2h,nz;}
       {ewa;oey;or nil, r0, r0; load ra;}
       {and rb,ra;} \�����᪠� ������ � ����� ���� ���࠭���� ������� � ������� � ���� ���࠭�
       {cjp not z, nextCom;}       \���室�� �� ���� �ᯠ����� ����
\------------------------------------------------------------------------\
\--------------------------------Output----------------------------------\
\------------------------------------------------------------------------\
makeOut  {xor r7,r7,r7;}
         {add r7,r7,0Ch,z;}
         {cjp not z, loading;}
output   {xor r0,r0,r0;}
         {and r0,r8,3FFh;}
         {xor nil,r0,r0;oey;ewh;}
         {or nil,r0,z;oey;ewl;}
readyOut {cjp rdd,readyOut;o;or r0,bus_d,z;}
         {and r0,r0,0080h;load rm, flags;}
         {cjp rm_z, readyOut;}
         {xor r0,r0,r0;}
         {and r0,r8,3FFh;}
         {add r0,r0,2h;}
         {xor nil,r0,r0; oey; ewh;}
         {xor nil, r0,z; oey; ewl;}
writeOut {cjp rdd,writeOut;o;or nil,r14,z;oey;}
         {cjp not z, nextCom;}
end{} \����� �ணࠬ��
