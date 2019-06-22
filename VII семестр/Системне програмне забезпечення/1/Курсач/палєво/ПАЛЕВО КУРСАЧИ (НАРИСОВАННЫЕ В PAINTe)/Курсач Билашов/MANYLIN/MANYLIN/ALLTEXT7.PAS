unit alltext7;
interface
uses add_man7,graph;
const  max_way=9;max_name=32;CharInNote=40;
       maxflagname=8;
type
 text_num=(well_come,inf_file_is_created,us_file,us_window,us_edit,
   full_joion_patology,uncknown_patology,us_F8_processors,
   fill_of_nodes_mas,kol_of_nodes,create_rand_dag,tbl_win_of_visualized,
   win_dag,win_time,win_3d,win_any,
   us_F9_algoritm,
   h10,h11,h12,h13,h14,h15,h16,h17,h18,
   h20,h21,h22,h23,h24,h25,
   h30,h31,h32,h33,h34,h35,h36,h37,h38,h39,h310,h311,
   h40,h41,h42,h43,h44,h45,h46,h47,h48,h49,h410,h411,

   end_of_work,Start_all_algoritms_for_random_DAG,
   Analiz_of_the_algoritm,Number_of_NODES_is,_Fill_with_lines,_for_,
   identical_DAG,
   cannot_create_line,
   Del_NODE_and_LINES,No_enoph_room,is_set,Set_is_OFF,press,
   File_exemple_txt_saving,incorrect_function_key,
   Refresh_processors_,end_of_optimaze,
   only_for_dag_options,Set_graph,
   correct_work_at_lines_,first_set_node_enter,
   see_time_of_working,incorrect_key,
   beg,work_,stand_at,ending,data_about_node,
   modeling_by_processors,Algoritms_of_,
   Processors,Chose_algoritm,algoritm_time_statistics,by_processors,
   By_time,time_comparing,Deleting_this_FILE,yes,no_,So_windows,
   Modeling_system,Processors_balansing,
   Time_statistics,
   us_quit,
   _F3_Loading_File,
_Save_File,_F2_Save_As,_Delete_ALL,_DELETE_LEVEL,_F5_New_DAG,_F6_experiment,
_BW_state,_Next_Text,_e_Artitachure,_w_See_image,_a_Grafics,_k_Full_optimization,
_b_Edit_DAG,_j_Insert_Claster,_Shift_1_All_at_one_processor,_Shift_2_All_at_AnOther,
_inc_proc,_dec_proc,_Shift_C_Coping_DAG_to_NEW_Level,
_R_Correct_visual_processors,_Set_TWO_nodes_at_ONE_Klaster,
_HIGH_way_place_at_processor,_1,_2,_3,_4,_5,_6,_7,_8,_F4_Grafics,
_File_1_Modeling_step,_File_2_Change_volume,_See_number_of_the_PROCESSOR,
_Viewing_Line_number,_Algoritm_Steps,_Time_relay_1,_All_Lines_are_equal,
_See_a_number_of_the_node,_Time_of_WORK,LESENKA_,Harkar_,ALG_1_,
ALG_2_,Nearest_way,Referat_,Clear_all_LINES,Init_for_2_3_options,
At_one_processor,_l_,by_by);
procedure InitNewLanguage(i:text_style);
function note(i:text_num):string;
function flag_name(i:integer):string;
function get_name_way(i:integer):string;
function tbl_str_names(i:integer):string;
procedure help;
implementation
const
  max_txt=1;
type
  text_mass=array[well_come..by_by] of string[CharInNote];
const
  t1:text_mass=
  ('Wellcome !!!',
'File created',
'File',
'Window',
'Editor',
'full joion',
'uncknown',
'F8-processors',
'Fill of nodes mass',
'Количество вершин ',
'Create Random DAG:',
'Screen Status Window.',
'DAG',
'Time',
'3-dim',
'uncknown',
'F9-algoritms',
'MAIN OPTIONS:',
'Exit to Menu',
'SAVE in File',
'Compare algoritmicus',
'Create Random DAG',
'Rusult of last comparing',
'Time Comparing)',
'LOADING File,',
'QUIT to DOS',
'Screen Control:',
'Centr to point',
'Screen moving',
'Insert the NODE',
'Ruturn MASHTAB and COORD',
'MASHTAB changed',
'EDITOR OPTIONs:',
'Screen options',
'Create the NODE',
'Move the NODE',
'Nodes volume',
'Lines volum',
'Number of processor',
'Editor Window',
'Create the LINE between nodes',
'Delete LINE',
'Delete NODE',
'Ярусно-параллельная форма',
'ALGORITMIKUSIKUS:',
'Get alg_number by key[1..9]',
'List of algoritm',
'All nodes at One processor',
'All nodes at N- processors',
'упорядочить processors',
'Sort position of processors',
'Swap Processors',
'Small lines',
'iqual nodes lines volume !',
'порядковый номер узла/время исполнения',
'выделить истенные линии',
'end_of_work',
'Сравние выделенных алгоритмов',
'Analiz of the algoritm',
'Number of NODES is',
'Fill with lines',
'For ',
' identical DAG.',
'cannot_create_line',
'Delte the NODE and It LINES',
'No enoph room...',
'is set',
'Set is OFF',
'Press',
'File exemple.txt is saving...',
'incorrect function key ',
'Refresh processors',
'end_of_optimaze',
'only_for_dag_options',
'Set graph',
'correct work at lines',
'Сначала выделите узел ENTER-ом',
'Видите время исполнения',
'incorrect key ',
'Начало',
'Работа',
'Простой',
'Окончание',
'Данные об узле...',
'modeling_by_processors',
'Algoritms of перебора.',
'Processors',
'Chose what algoritm useing',
' for algoritm time statistics',
'by processors: ',
'By time: ',
'разность времени :',
'Deleting this FILE ? ',
'YES',
'NO',
'So-windows...',
'Modeling system.',
'Processors balansing.',
'Time statistics.',
'Quit',
'F3  Loading File',
'    Save File',
'F2  Save As...',
'    Delete ALL',
'    DELETE LEVEL',
'F5  New DAG',
'F6  experiment',
'    BW visual',
'    New Text',
'(e)-Artichecture',
'(w)-See image',
'(a)-Grafics',
'(k)-Full optimization',
'(b)-Edit DAG',
'(j)-Insert Claster',
'Shift-1 All at one processor',
'Shift-2 All at AnOther',
')       inc(процессор)',
'(       dec(процессор)',
'Shift-C Coping DAG to NEW Level',
'R       Correct visual processors',
'Set TWO nodes at ONE Klaster',
'HIGH way place at processor',
'1',
'2',
'3',
'4',
'5',
'6',
'7',
'8',
'F4-Grafics',
'File_1-Modeling step by step (SHARKAR)',
'File_2-Change volume of LINES',
'See number of the PROCESSOR',
'Viewing Line_number',
'Algoritm Steps.',
'Time relay=1',
'All Lines are equal',
'See a number of the node',
'Time of WORK',
'LESENKA',
'Harkar',
'ALG 1',
'ALG 2',
'Nearest way',
'Referat',
'Clear all LINES',
'Init for 2&3 options',
'At one processor',
'English text',
'?');
procedure help;
var i:integer;
begin
 settextjustify(0,2);
 if getmaxy<200 then setusercharsize(1,1,3,4);
 clr;setcolor(aink);
 setcolor(6);
 outtextxy(80,mmyy(20),note(h10));
 setcolor(aink);
 outtextxy(20,mmyy(30), 'ESC   - '+note(h11));
 outtextxy(20,mmyy(40), 'F2    - '+note(h12));
 outtextxy(20,mmyy(50), 'F3    - '+note(h17));
 outtextxy(20,mmyy(60), 'F4    - '+note(h13));
 outtextxy(20,mmyy(70), 'F5,O  - '+note(h14));
 outtextxy(20,mmyy(80), 'F6    - '+note(h15));
 outtextxy(20,mmyy(90), 'F7    - '+note(h31));
 outtextxy(20,mmyy(100),'F4+F1 - '+note(h16));
 outtextxy(20,mmyy(110),'ALT-X -  '+note(h18));
 setcolor(6);
 outtextxy(360,mmyy(20) ,note(h20));
 setcolor(aink);
 outtextxy(300,mmyy(30), 'C            - '+note(h21));
 outtextxy(300,mmyy(40), 'SHIFT A,S,W,Z- '+note(h22));
 outtextxy(300,mmyy(50), 'ENTER        - '+note(h23));
 outtextxy(300,mmyy(60), 'SPACE        - '+note(h24));
 outtextxy(300,mmyy(70), '+,-          - '+note(h25));
 outtextxy(300,mmyy(90), 'SHIFT-C   - New LEVEL');
 outtextxy(300,mmyy(100),'[,]       - Go to LEVEL');
 outtextxy(300,mmyy(110),'SHIFT [,] - Move LEVEL');
 outtextxy(300,mmyy(120),'CTRL-F10  - Delete LEVEL');
 outtextxy(300,mmyy(130),'T         - Compare LEVELS (i,i+1)');
 setcolor(6);
 outtextxy(360,mmyy(160) ,note(h30));
 setcolor(aink);

 outtextxy(300,mmyy(180),'n         - '+note(h32));
 outtextxy(300,mmyy(190),'m         - '+note(h33));
 outtextxy(300,mmyy(200),'L+L       - '+note(h34));
 outtextxy(293,mmyy(210),'Enter+Enter - '+note(h35));
 outtextxy(300,mmyy(220),'(,)       - '+note(h36));
 outtextxy(300,mmyy(230),'b         - '+note(h37));
 outtextxy(300,mmyy(240),'l         - '+note(h38));
 outtextxy(300,mmyy(250),'BackSpace - '+note(h39));
 outtextxy(300,mmyy(260),'SHIFT-D   - '+note(h310));
 outtextxy(300,mmyy(270),'SHIFT-Y   - '+note(h311));

 setcolor(6);
 outtextxy(80,mmyy(160) ,note(h40));
 setcolor(aink);
 outtextxy(20,mmyy(170),' 1..8  -'+note(h41));
 outtextxy(20,mmyy(180),'  F4   - '+note(h42));
 outtextxy(20,mmyy(190),'SHIFT-1- '+note(h43));
 outtextxy(20,mmyy(200),'SHIFT-2- '+note(h44));
 outtextxy(20,mmyy(210),'   R   - '+note(h45));
 outtextxy(20,mmyy(220),'SHIFT-L- '+note(h411));
 outtextxy(20,mmyy(230),'   I   - Information of the NODE');

 setcolor(6);outtextxy(60,mmyy(255),'ОЧЕРЕДНОСТЬ ИСПОЛНЕНИЯ');
 setcolor(7);
 outtextxy(60,mmyy(265),'(временная диаграмма)');setcolor(aink);
 outtextxy(20,mmyy(280),'PageUp  - вершина выше');
 outtextxy(20,mmyy(290),'PageDown- вершина ниже');
 outtextxy(20,mmyy(300),'Home    - пересылка раньше');
 outtextxy(20,mmyy(310),'End     - пересылка позже');

 setcolor(2);
{ outtextxy(20,mmyy(300) ,'P - '+note(h47)+', p-'+note(h48));
 outtextxy(20,mmyy(320),'3 - '+note(h49));
 outtextxy(20,mmyy(330),', - '+note(h410));}

  for i:= 0 to 15 do
  begin
    setfillstyle(i,7);bar3d(320+i*20,mmyy(360),340+i*20,mmyy(380),0,false);
    setcolor(i);
    setfillstyle(1,i);bar3d(1+i*20,mmyy(360),21+i*20,mmyy(380),0,false);
    setcolor(aink);
    outtextxy(11+i*20,mmyy(350),st(i));
    outtextxy(330+i*20,mmyy(350),st(i));
  end;
 pause;setusercharsize(1,1,1,1);
end;
function note(i:text_num):string;
  begin
    note:=t1[i];
  end;
function get_name_way(i:integer):string;
 begin
   if (i<1) or (i>max_way) then get_name_way:='Uncknown_WAY !!! '+st(i)
   else get_name_way:=t1[text_num(ord(LESENKA_)-1+i)];
 end;
function flag_name(i:integer):string;
 begin
    if i-1=maxflagname then flag_name:='Процессоры ожидают пересылки'else
    if i=maxflagname then flag_name:='Использование теней'else
    if (i<1) or (i>=maxflagname) then flag_name:='Uncknown_flag !!! '+st(i)
   else flag_name:=t1[text_num(ord(_See_number_of_the_PROCESSOR)-1+i)];
 end;
function tbl_str_names(i:integer):string;
 begin
   if (i<1) or (i>max_name) then tbl_str_names:='Uncknown_Name !!! '+st(i)
                     else tbl_str_names:=t1[text_num(ord(i)+ord(_F3_Loading_File)-1)];
 end;
procedure InitNewLanguage(i:text_style);
  var f:text;
      s1:string;
      j:text_num;
begin
  s1:='data\text'+st(ord(i)+1)+'6.txt';
  assign(f,s1);{$I-}reset(f);{$I+}
  if ioresult=0 then
  begin
    for j:=well_come to by_by do
     begin
       if not eof(f) then readln(f,s1) else s1:='';
       t1[j]:=s1;
     end;
    close(f);
  end;
end;
begin
  my_text:=russian;
end.