
                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT Lab1 
;  Record Layout Information:
;     -- lab1.task_start.t1
;     for T1 use record
;     end record;
; 
;     -- lab1.task_start.t2
;     for T2 use record
;     end record;
                       ;                                
                       Listing of Generated Code        
                       ;                                
                       EXCEP              RECORD FLAG:1, SPSAV:1, IPCOUNT:6 
                       ;                                
                       CODE               SEGMENT PUBLIC BYTE 'CODE' USE32 ;  Lab1
                                          ASSUME CS:CODE 
                       ;                                
                       ;  Start of procedure lab1.task_start.t1__body   
                       ;                                
                                          PUBLIC lab1.task_start.t1__body 
                       lab1.task_start.t1__body PROC NEAR 
;  Source Line # 26
   26| 000000 64                          FS:           
   26| 000001 8B15                        MOV    EDX, 4 
   26| 000003 04000000                                  
   26| 000007 8B52                        MOV    EDX, [EDX-4] 
   26| 000009 FC                                        
   26| 00000A 55                          PUSH   EBP    
   26| 00000B 8BEC                        MOV    EBP, ESP 
   26| 00000D 83EC                        SUB    ESP, 72 
   26| 00000F 48                                        
;  Source Line # 27
   27| 000010 C745                        MOV    DWORD PTR [EBP-64], 0 ;  Sum
   27| 000012 C0                                        
   27| 000013 00000000                                  
;  Source Line # 28
   28| 000017 C745                        MOV    DWORD PTR [EBP-60], 0 ;  Alfa1
   28| 000019 C4                                        
   28| 00001A 00000000                                  
;  Source Line # 29
   29| 00001E 8B02                        MOV    EAX, [EDX+0] 
   29| 000020 8945                        MOV    [EBP-56], EAX ;  dyn_temp
   29| 000022 C8                                        
   29| 000023 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
   29| 000025 00000000                                  
   29| 000029 83EB                        SUB    EBX, 1 
   29| 00002B 01                                        
   29| 00002C 7D                          JGE    SHORT L37 
   29| 00002D 03                                        
   29| 00002E 33DB                        XOR    EBX, EBX 
   29| 000030 4B                          DEC    EBX    
   29|                 L37:                             
   29| 000031 CE                          INTO          
   29| 000032 43                          INC    EBX    
   29| 000033 CE                          INTO          
   29| 000034 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   29| 000037 00000000                                  
   29| 00003B CE                          INTO          
   29| 00003C 53                          PUSH   EBX    
   29| 00003D 8955                        MOV    [EBP-72], EDX ; Spill
   29| 00003F B8                                        
   29| 000040 E8                          CALL   rts_ss_allocate 
   29| 000041 00000000                                  
   29| 000045 8945                        MOV    [EBP-52], EAX ;  MX1
   29| 000047 CC                                        
   29| 000048 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
   29| 00004A 00000000                                  
   29| 00004E 83E9                        SUB    ECX, 1 
   29| 000050 01                                        
   29| 000051 7D                          JGE    SHORT L38 
   29| 000052 03                                        
   29| 000053 33C9                        XOR    ECX, ECX 
   29| 000055 49                          DEC    ECX    
   29|                 L38:                             
   29| 000056 CE                          INTO          
   29| 000057 41                          INC    ECX    
   29| 000058 CE                          INTO          
   29| 000059 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
   29| 00005C 00000000                                  
   29| 000060 CE                          INTO          
   29| 000061 51                          PUSH   ECX    
   29| 000062 E8                          CALL   rts_ss_allocate 
   29| 000063 00000000                                  
   29| 000067 8945                        MOV    [EBP-48], EAX ;  MBUF
   29| 000069 D0                                        
;  Source Line # 30
   30| 00006A 8B35                        MOV    ESI, package1.vec__constrained_array____1 
   30| 00006C 00000000                                  
   30| 000070 83EE                        SUB    ESI, 1 
   30| 000072 01                                        
   30| 000073 7D                          JGE    SHORT L39 
   30| 000074 03                                        
   30| 000075 33F6                        XOR    ESI, ESI 
   30| 000077 4E                          DEC    ESI    
   30|                 L39:                             
   30| 000078 CE                          INTO          
   30| 000079 46                          INC    ESI    
   30| 00007A CE                          INTO          
   30| 00007B D1E6                        SHL    ESI, 1 
   30| 00007D CE                          INTO          
   30| 00007E D1E6                        SHL    ESI, 1 
   30| 000080 CE                          INTO          
   30| 000081 56                          PUSH   ESI    
   30| 000082 E8                          CALL   rts_ss_allocate 
   30| 000083 00000000                                  
   30| 000087 8945                        MOV    [EBP-44], EAX ;  C1
   30| 000089 D4                                        
;  Source Line # 31
   31| 00008A E8                          CALL   rts_activation_succeeded 
   31| 00008B 00000000                                  
;  Source Line # 32
   32| 00008F 68                          PUSH   __lcl.00000033 
   32| 000090 00000000                                  
   32| 000094 68                          PUSH   __lcl.00000032 
   32| 000095 00000000                                  
   32| 000099 E8                          CALL   ada.text_io.put_line__2 
   32| 00009A 00000000                                  
;  Source Line # 34
   34| 00009E 8B55                        MOV    EDX, [EBP-72] ; Spill
   34| 0000A0 B8                                        
   34| 0000A1 8B7A                        MOV    EDI, [EDX+48] 
   34| 0000A3 30                                        
   34| 0000A4 8B5F                        MOV    EBX, [EDI-44] ;  MX
   34| 0000A6 D4                                        
   34| 0000A7 53                          PUSH   EBX    
   34| 0000A8 E8                          CALL   package1.matr_input 
   34| 0000A9 00000000                                  
;  Source Line # 35
   35| 0000AD 8B55                        MOV    EDX, [EBP-72] ; Spill
   35| 0000AF B8                                        
   35| 0000B0 8B4A                        MOV    ECX, [EDX+48] 
   35| 0000B2 30                                        
   35| 0000B3 8B71                        MOV    ESI, [ECX-28] ;  C
   35| 0000B5 E4                                        
   35| 0000B6 56                          PUSH   ESI    
   35| 0000B7 E8                          CALL   package1.vec_input 
   35| 0000B8 00000000                                  
;  Source Line # 36
   36| 0000BC 8B55                        MOV    EDX, [EBP-72] ; Spill
   36| 0000BE B8                                        
   36| 0000BF 8B42                        MOV    EAX, [EDX+48] 
   36| 0000C1 30                                        
   36| 0000C2 8B78                        MOV    EDI, [EAX-32] ;  B
   36| 0000C4 E0                                        
   36| 0000C5 57                          PUSH   EDI    
   36| 0000C6 E8                          CALL   package1.vec_input 
   36| 0000C7 00000000                                  
;  Source Line # 38
   38| 0000CB 8B55                        MOV    EDX, [EBP-72] ; Spill
   38| 0000CD B8                                        
   38| 0000CE 8B5A                        MOV    EBX, [EDX+48] 
   38| 0000D0 30                                        
   38| 0000D1 8D5B                        LEA    EBX, [EBX-20] ;  S1
   38| 0000D3 EC                                        
   38| 0000D4 53                          PUSH   EBX    
   38| 0000D5 E8                          CALL   ada.synchronous_task_control.set_true 
   38| 0000D6 00000000                                  
;  Source Line # 40
   40| 0000DA 8B55                        MOV    EDX, [EBP-72] ; Spill
   40| 0000DC B8                                        
   40| 0000DD 8B4A                        MOV    ECX, [EDX+48] 
   40| 0000DF 30                                        
   40| 0000E0 8D49                        LEA    ECX, [ECX-16] ;  S2
   40| 0000E2 F0                                        
   40| 0000E3 51                          PUSH   ECX    
   40| 0000E4 E8                          CALL   ada.synchronous_task_control.suspend_until_true
                                                        
   40| 0000E5 00000000                                  
;  Source Line # 44
   44| 0000E9 8B55                        MOV    EDX, [EBP-72] ; Spill
   44| 0000EB B8                                        
   44| 0000EC 8B72                        MOV    ESI, [EDX+48] 
   44| 0000EE 30                                        
   44| 0000EF 8D76                        LEA    ESI, [ESI-8] ;  var1
   44| 0000F1 F8                                        
   44| 0000F2 56                          PUSH   ESI    
   44| 0000F3 E8                          CALL   ada.synchronous_task_control.suspend_until_true
                                                        
   44| 0000F4 00000000                                  
;  Source Line # 45
   45| 0000F8 8B55                        MOV    EDX, [EBP-72] ; Spill
   45| 0000FA B8                                        
   45| 0000FB 8B42                        MOV    EAX, [EDX+48] 
   45| 0000FD 30                                        
   45| 0000FE 8B78                        MOV    EDI, [EAX-24] ;  Alfa
   45| 000100 E8                                        
   45| 000101 897D                        MOV    [EBP-60], EDI ;  Alfa1
   45| 000103 C4                                        
;  Source Line # 46
   46| 000104 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
   46| 000106 00000000                                  
   46| 00010A 83EB                        SUB    EBX, 1 
   46| 00010C 01                                        
   46| 00010D 7D                          JGE    SHORT L40 
   46| 00010E 03                                        
   46| 00010F 33DB                        XOR    EBX, EBX 
   46| 000111 4B                          DEC    EBX    
   46|                 L40:                             
   46| 000112 CE                          INTO          
   46| 000113 43                          INC    EBX    
   46| 000114 CE                          INTO          
   46| 000115 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   46| 000118 00000000                                  
   46| 00011C CE                          INTO          
   46| 00011D 8B4A                        MOV    ECX, [EDX+48] 
   46| 00011F 30                                        
   46| 000120 8B71                        MOV    ESI, [ECX-44] ;  MX
   46| 000122 D4                                        
   46| 000123 8B55                        MOV    EDX, [EBP-52] ;  MX1
   46| 000125 CC                                        
   46| 000126 53                          PUSH   EBX    
   46| 000127 56                          PUSH   ESI    
   46| 000128 52                          PUSH   EDX    
   46| 000129 E8                          CALL   _rts_block_move 
   46| 00012A 00000000                                  
;  Source Line # 47
   47| 00012E 8B05                        MOV    EAX, package1.vec__constrained_array____1 
   47| 000130 00000000                                  
   47| 000134 2D                          SUB    EAX, 1 
   47| 000135 01000000                                  
   47| 000139 7D                          JGE    SHORT L41 
   47| 00013A 03                                        
   47| 00013B 33C0                        XOR    EAX, EAX 
   47| 00013D 48                          DEC    EAX    
   47|                 L41:                             
   47| 00013E CE                          INTO          
   47| 00013F 40                          INC    EAX    
   47| 000140 CE                          INTO          
   47| 000141 D1E0                        SHL    EAX, 1 
   47| 000143 CE                          INTO          
   47| 000144 D1E0                        SHL    EAX, 1 
   47| 000146 CE                          INTO          
   47| 000147 8B55                        MOV    EDX, [EBP-72] ; Spill
   47| 000149 B8                                        
   47| 00014A 8B7A                        MOV    EDI, [EDX+48] 
   47| 00014C 30                                        
   47| 00014D 8B5F                        MOV    EBX, [EDI-28] ;  C
   47| 00014F E4                                        
   47| 000150 8B4D                        MOV    ECX, [EBP-44] ;  C1
   47| 000152 D4                                        
   47| 000153 50                          PUSH   EAX    
   47| 000154 53                          PUSH   EBX    
   47| 000155 51                          PUSH   ECX    
   47| 000156 E8                          CALL   _rts_block_move 
   47| 000157 00000000                                  
;  Source Line # 48
   48| 00015B 8B55                        MOV    EDX, [EBP-72] ; Spill
   48| 00015D B8                                        
   48| 00015E 8B72                        MOV    ESI, [EDX+48] 
   48| 000160 30                                        
   48| 000161 8D76                        LEA    ESI, [ESI-8] ;  var1
   48| 000163 F8                                        
   48| 000164 56                          PUSH   ESI    
   48| 000165 E8                          CALL   ada.synchronous_task_control.set_true 
   48| 000166 00000000                                  
   48| 00016A 8B05                        MOV    EAX, package1.n 
   48| 00016C 00000000                                  
   48| 000170 8945                        MOV    [EBP-40], EAX 
   48| 000172 D8                                        
;  Source Line # 51
   51| 000173 837D                        CMP    DWORD PTR [EBP-40], 0 
   51| 000175 D8                                        
   51| 000176 00                                        
   51| 000177 0F8E                        JLE    L12    
   51| 000179 3C010000                                  
   51| 00017D C745                        MOV    DWORD PTR [EBP-36], 1 
   51| 00017F DC                                        
   51| 000180 01000000                                  
   51|                 L14:                             
   51| 000184 8B05                        MOV    EAX, package1.h 
   51| 000186 00000000                                  
   51| 00018A 8945                        MOV    [EBP-32], EAX 
   51| 00018C E0                                        
;  Source Line # 52
   52| 00018D 837D                        CMP    DWORD PTR [EBP-32], 0 
   52| 00018F E0                                        
   52| 000190 00                                        
   52| 000191 0F8E                        JLE    L15    
   52| 000193 0E010000                                  
   52| 000197 C745                        MOV    DWORD PTR [EBP-28], 1 
   52| 000199 E4                                        
   52| 00019A 01000000                                  
   52|                 L17:                             
;  Source Line # 53
   53| 00019E C745                        MOV    DWORD PTR [EBP-64], 0 ;  Sum
   53| 0001A0 C0                                        
   53| 0001A1 00000000                                  
   53| 0001A5 8B05                        MOV    EAX, package1.n 
   53| 0001A7 00000000                                  
   53| 0001AB 8945                        MOV    [EBP-24], EAX 
   53| 0001AD E8                                        
;  Source Line # 54
   54| 0001AE 837D                        CMP    DWORD PTR [EBP-24], 0 
   54| 0001B0 E8                                        
   54| 0001B1 00                                        
   54| 0001B2 0F8E                        JLE    L18    
   54| 0001B4 98000000                                  
   54| 0001B8 C745                        MOV    DWORD PTR [EBP-20], 1 
   54| 0001BA EC                                        
   54| 0001BB 01000000                                  
   54|                 L20:                             
;  Source Line # 55
   55| 0001BF 8B45                        MOV    EAX, [EBP-52] ;  MX1
   55| 0001C1 CC                                        
   55| 0001C2 8B5D                        MOV    EBX, [EBP-36] 
   55| 0001C4 DC                                        
   55| 0001C5 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
   55| 0001C7 00000000                                  
   55|                 L42:                             
   55| 0001CB 0F8F                        JG     L43    
   55| 0001CD 05020000                                  
   55| 0001D1 8D5B                        LEA    EBX, [EBX-1] 
   55| 0001D3 FF                                        
   55| 0001D4 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   55| 0001D7 00000000                                  
   55| 0001DB 8B4D                        MOV    ECX, [EBP-20] 
   55| 0001DD EC                                        
   55| 0001DE 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
   55| 0001E0 00000000                                  
   55|                 L44:                             
   55| 0001E4 0F8F                        JG     L45    
   55| 0001E6 F8010000                                  
   55| 0001EA 8D0C8D                      LEA    ECX, [4*ECX-4] 
   55| 0001ED FCFFFFFF                                  
   55| 0001F1 03D9                        ADD    EBX, ECX 
   55| 0001F3 8B55                        MOV    EDX, [EBP-72] ; Spill
   55| 0001F5 B8                                        
   55| 0001F6 8B72                        MOV    ESI, [EDX+48] 
   55| 0001F8 30                                        
   55| 0001F9 8B7E                        MOV    EDI, [ESI-40] ;  MY
   55| 0001FB D8                                        
   55| 0001FC 8B4D                        MOV    ECX, [EBP-20] 
   55| 0001FE EC                                        
   55| 0001FF 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
   55| 000201 00000000                                  
   55|                 L46:                             
   55| 000205 0F8F                        JG     L47    
   55| 000207 E3010000                                  
   55| 00020B 8D49                        LEA    ECX, [ECX-1] 
   55| 00020D FF                                        
   55| 00020E 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
   55| 000211 00000000                                  
   55| 000215 8B55                        MOV    EDX, [EBP-28] 
   55| 000217 E4                                        
   55| 000218 3B15                        CMP    EDX, package1.vec__constrained_array____1 
   55| 00021A 00000000                                  
   55|                 L48:                             
   55| 00021E 0F8F                        JG     L49    
   55| 000220 D6010000                                  
   55| 000224 8D1495                      LEA    EDX, [4*EDX-4] 
   55| 000227 FCFFFFFF                                  
   55| 00022B 03CA                        ADD    ECX, EDX 
   55| 00022D 8B0418                      MOV    EAX, [EAX+EBX+0] 
   55| 000230 0FAF040F                    IMUL   EAX, [EDI+ECX+0] 
   55| 000234 CE                          INTO          
   55| 000235 0345                        ADD    EAX, [EBP-64] ;  Sum
   55| 000237 C0                                        
   55| 000238 CE                          INTO          
   55| 000239 8945                        MOV    [EBP-64], EAX ;  Sum
   55| 00023B C0                                        
;  Source Line # 56
   56| 00023C 8B5D                        MOV    EBX, [EBP-24] 
   56| 00023E E8                                        
   56| 00023F 395D                        CMP    [EBP-20], EBX 
   56| 000241 EC                                        
   56| 000242 74                          JE     SHORT L18 
   56| 000243 0C                                        
   56| 000244 8B45                        MOV    EAX, [EBP-20] 
   56| 000246 EC                                        
   56| 000247 40                          INC    EAX    
   56| 000248 8945                        MOV    [EBP-20], EAX 
   56| 00024A EC                                        
   56| 00024B E9                          JMP    L20    
   56| 00024C 6FFFFFFF                                  
   56|                 L18:                             
;  Source Line # 57
   57| 000250 8B45                        MOV    EAX, [EBP-48] ;  MBUF
   57| 000252 D0                                        
   57| 000253 8B5D                        MOV    EBX, [EBP-36] 
   57| 000255 DC                                        
   57| 000256 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
   57| 000258 00000000                                  
   57|                 L50:                             
   57| 00025C 0F8F                        JG     L51    
   57| 00025E A4010000                                  
   57| 000262 8D5B                        LEA    EBX, [EBX-1] 
   57| 000264 FF                                        
   57| 000265 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   57| 000268 00000000                                  
   57| 00026C 8B4D                        MOV    ECX, [EBP-28] 
   57| 00026E E4                                        
   57| 00026F 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
   57| 000271 00000000                                  
   57|                 L52:                             
   57| 000275 0F8F                        JG     L53    
   57| 000277 97010000                                  
   57| 00027B 8D0C8D                      LEA    ECX, [4*ECX-4] 
   57| 00027E FCFFFFFF                                  
   57| 000282 03D9                        ADD    EBX, ECX 
   57| 000284 8B55                        MOV    EDX, [EBP-64] ;  Sum
   57| 000286 C0                                        
   57| 000287 891418                      MOV    [EAX+EBX+0], EDX 
;  Source Line # 58
   58| 00028A C745                        MOV    DWORD PTR [EBP-64], 0 ;  Sum
   58| 00028C C0                                        
   58| 00028D 00000000                                  
;  Source Line # 59
   59| 000291 8B75                        MOV    ESI, [EBP-32] 
   59| 000293 E0                                        
   59| 000294 3975                        CMP    [EBP-28], ESI 
   59| 000296 E4                                        
   59| 000297 74                          JE     SHORT L15 
   59| 000298 0C                                        
   59| 000299 8B45                        MOV    EAX, [EBP-28] 
   59| 00029B E4                                        
   59| 00029C 40                          INC    EAX    
   59| 00029D 8945                        MOV    [EBP-28], EAX 
   59| 00029F E4                                        
   59| 0002A0 E9                          JMP    L17    
   59| 0002A1 F9FEFFFF                                  
   59|                 L15:                             
;  Source Line # 60
   60| 0002A5 8B45                        MOV    EAX, [EBP-40] 
   60| 0002A7 D8                                        
   60| 0002A8 3945                        CMP    [EBP-36], EAX 
   60| 0002AA DC                                        
   60| 0002AB 74                          JE     SHORT L12 
   60| 0002AC 0C                                        
   60| 0002AD 8B45                        MOV    EAX, [EBP-36] 
   60| 0002AF DC                                        
   60| 0002B0 40                          INC    EAX    
   60| 0002B1 8945                        MOV    [EBP-36], EAX 
   60| 0002B3 DC                                        
   60| 0002B4 E9                          JMP    L14    
   60| 0002B5 CBFEFFFF                                  
   60|                 L12:                             
   60| 0002B9 8B05                        MOV    EAX, package1.h 
   60| 0002BB 00000000                                  
   60| 0002BF 8945                        MOV    [EBP-16], EAX 
   60| 0002C1 F0                                        
;  Source Line # 62
   62| 0002C2 837D                        CMP    DWORD PTR [EBP-16], 0 
   62| 0002C4 F0                                        
   62| 0002C5 00                                        
   62| 0002C6 0F8E                        JLE    L27    
   62| 0002C8 DD000000                                  
   62| 0002CC C745                        MOV    DWORD PTR [EBP-12], 1 
   62| 0002CE F4                                        
   62| 0002CF 01000000                                  
   62|                 L29:                             
;  Source Line # 63
   63| 0002D3 C745                        MOV    DWORD PTR [EBP-64], 0 ;  Sum
   63| 0002D5 C0                                        
   63| 0002D6 00000000                                  
   63| 0002DA 8B05                        MOV    EAX, package1.n 
   63| 0002DC 00000000                                  
   63| 0002E0 8945                        MOV    [EBP-8], EAX 
   63| 0002E2 F8                                        
;  Source Line # 64
   64| 0002E3 837D                        CMP    DWORD PTR [EBP-8], 0 
   64| 0002E5 F8                                        
   64| 0002E6 00                                        
   64| 0002E7 7E                          JLE    SHORT L30 
   64| 0002E8 6E                                        
   64| 0002E9 C745                        MOV    DWORD PTR [EBP-4], 1 
   64| 0002EB FC                                        
   64| 0002EC 01000000                                  
   64|                 L32:                             
;  Source Line # 65
   65| 0002F0 8B45                        MOV    EAX, [EBP-44] ;  C1
   65| 0002F2 D4                                        
   65| 0002F3 8B5D                        MOV    EBX, [EBP-4] 
   65| 0002F5 FC                                        
   65| 0002F6 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
   65| 0002F8 00000000                                  
   65|                 L54:                             
   65| 0002FC 0F8F                        JG     L55    
   65| 0002FE 1C010000                                  
   65| 000302 8B4D                        MOV    ECX, [EBP-48] ;  MBUF
   65| 000304 D0                                        
   65| 000305 8B55                        MOV    EDX, [EBP-4] 
   65| 000307 FC                                        
   65| 000308 3B15                        CMP    EDX, package1.matr__constrained_array____1 
   65| 00030A 00000000                                  
   65|                 L56:                             
   65| 00030E 0F8F                        JG     L57    
   65| 000310 16010000                                  
   65| 000314 8D52                        LEA    EDX, [EDX-1] 
   65| 000316 FF                                        
   65| 000317 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
   65| 00031A 00000000                                  
   65| 00031E 8B75                        MOV    ESI, [EBP-12] 
   65| 000320 F4                                        
   65| 000321 3B35                        CMP    ESI, package1.vec__constrained_array____1 
   65| 000323 00000000                                  
   65|                 L58:                             
   65| 000327 0F8F                        JG     L59    
   65| 000329 09010000                                  
   65| 00032D 8D34B5                      LEA    ESI, [4*ESI-4] 
   65| 000330 FCFFFFFF                                  
   65| 000334 03D6                        ADD    EDX, ESI 
   65| 000336 8B7C98                      MOV    EDI, [EAX+4*EBX-4] 
   65| 000339 FC                                        
   65| 00033A 0FAF3C11                    IMUL   EDI, [ECX+EDX+0] 
   65| 00033E CE                          INTO          
   65| 00033F 037D                        ADD    EDI, [EBP-64] ;  Sum
   65| 000341 C0                                        
   65| 000342 CE                          INTO          
   65| 000343 897D                        MOV    [EBP-64], EDI ;  Sum
   65| 000345 C0                                        
;  Source Line # 66
   66| 000346 8B45                        MOV    EAX, [EBP-8] 
   66| 000348 F8                                        
   66| 000349 3945                        CMP    [EBP-4], EAX 
   66| 00034B FC                                        
   66| 00034C 74                          JE     SHORT L30 
   66| 00034D 09                                        
   66| 00034E 8B45                        MOV    EAX, [EBP-4] 
   66| 000350 FC                                        
   66| 000351 40                          INC    EAX    
   66| 000352 8945                        MOV    [EBP-4], EAX 
   66| 000354 FC                                        
   66| 000355 EB                          JMP    SHORT L32 
   66| 000356 99                                        
   66|                 L30:                             
;  Source Line # 67
   67| 000357 8B55                        MOV    EDX, [EBP-72] ; Spill
   67| 000359 B8                                        
   67| 00035A 8B42                        MOV    EAX, [EDX+48] 
   67| 00035C 30                                        
   67| 00035D 8B58                        MOV    EBX, [EAX-32] ;  B
   67| 00035F E0                                        
   67| 000360 8B4D                        MOV    ECX, [EBP-12] 
   67| 000362 F4                                        
   67| 000363 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
   67| 000365 00000000                                  
   67|                 L60:                             
   67| 000369 0F8F                        JG     L61    
   67| 00036B D3000000                                  
   67| 00036F 8B748B                      MOV    ESI, [EBX+4*ECX-4] 
   67| 000372 FC                                        
   67| 000373 0FAF75                      IMUL   ESI, [EBP-60] ;  Alfa1
   67| 000376 C4                                        
   67| 000377 CE                          INTO          
   67| 000378 2B75                        SUB    ESI, [EBP-64] ;  Sum
   67| 00037A C0                                        
   67| 00037B CE                          INTO          
   67| 00037C 8B7A                        MOV    EDI, [EDX+48] 
   67| 00037E 30                                        
   67| 00037F 8B57                        MOV    EDX, [EDI-36] ;  A
   67| 000381 DC                                        
   67| 000382 8B45                        MOV    EAX, [EBP-12] 
   67| 000384 F4                                        
   67| 000385 3B05                        CMP    EAX, package1.vec__constrained_array____1 
   67| 000387 00000000                                  
   67|                 L62:                             
   67| 00038B 0F8F                        JG     L63    
   67| 00038D BD000000                                  
   67| 000391 897482                      MOV    [EDX+4*EAX-4], ESI 
   67| 000394 FC                                        
;  Source Line # 68
   68| 000395 8B5D                        MOV    EBX, [EBP-16] 
   68| 000397 F0                                        
   68| 000398 395D                        CMP    [EBP-12], EBX 
   68| 00039A F4                                        
   68| 00039B 74                          JE     SHORT L27 
   68| 00039C 0C                                        
   68| 00039D 8B45                        MOV    EAX, [EBP-12] 
   68| 00039F F4                                        
   68| 0003A0 40                          INC    EAX    
   68| 0003A1 8945                        MOV    [EBP-12], EAX 
   68| 0003A3 F4                                        
   68| 0003A4 E9                          JMP    L29    
   68| 0003A5 2AFFFFFF                                  
   68|                 L27:                             
;  Source Line # 70
   70| 0003A9 8B55                        MOV    EDX, [EBP-72] ; Spill
   70| 0003AB B8                                        
   70| 0003AC 8B42                        MOV    EAX, [EDX+48] 
   70| 0003AE 30                                        
   70| 0003AF 8D40                        LEA    EAX, [EAX-12] ;  S3
   70| 0003B1 F4                                        
   70| 0003B2 50                          PUSH   EAX    
   70| 0003B3 E8                          CALL   ada.synchronous_task_control.set_true 
   70| 0003B4 00000000                                  
;  Source Line # 72
   72| 0003B8 68                          PUSH   __lcl.00000069 
   72| 0003B9 00000000                                  
   72| 0003BD 68                          PUSH   __lcl.00000068 
   72| 0003BE 00000000                                  
   72| 0003C2 E8                          CALL   ada.text_io.put_line__2 
   72| 0003C3 00000000                                  
   72| 0003C7 8D5D                        LEA    EBX, [EBP-56] ;  dyn_temp
   72| 0003C9 C8                                        
   72| 0003CA 53                          PUSH   EBX    
   72| 0003CB E8                          CALL   rts_ss_release 
   72| 0003CC 00000000                                  
;  Source Line # 73
   73| 0003D0 8BE5                        MOV    ESP, EBP 
   73| 0003D2 5D                          POP    EBP    
   73| 0003D3 C2                          RET    4      
   73| 0003D4 0400                                      
   73|                 L43:                             
   73| 0003D6 8D05                        LEA    EAX, L42+5 
   73| 0003D8 D0010000                                  
   73| 0003DC 50                          PUSH   EAX    
   73| 0003DD E9                          JMP    rts_raise_constraint_error 
   73| 0003DE 00000000                                  
   73|                 L45:                             
   73| 0003E2 8D05                        LEA    EAX, L44+5 
   73| 0003E4 E9010000                                  
   73| 0003E8 50                          PUSH   EAX    
   73| 0003E9 E9                          JMP    rts_raise_constraint_error 
   73| 0003EA 00000000                                  
   73|                 L47:                             
   73| 0003EE 8D05                        LEA    EAX, L46+5 
   73| 0003F0 0A020000                                  
   73| 0003F4 50                          PUSH   EAX    
   73| 0003F5 E9                          JMP    rts_raise_constraint_error 
   73| 0003F6 00000000                                  
   73|                 L49:                             
   73| 0003FA 8D05                        LEA    EAX, L48+5 
   73| 0003FC 23020000                                  
   73| 000400 50                          PUSH   EAX    
   73| 000401 E9                          JMP    rts_raise_constraint_error 
   73| 000402 00000000                                  
   73|                 L51:                             
   73| 000406 8D05                        LEA    EAX, L50+5 
   73| 000408 61020000                                  
   73| 00040C 50                          PUSH   EAX    
   73| 00040D E9                          JMP    rts_raise_constraint_error 
   73| 00040E 00000000                                  
   73|                 L53:                             
   73| 000412 8D05                        LEA    EAX, L52+5 
   73| 000414 7A020000                                  
   73| 000418 50                          PUSH   EAX    
   73| 000419 E9                          JMP    rts_raise_constraint_error 
   73| 00041A 00000000                                  
   73|                 L55:                             
   73| 00041E 8D05                        LEA    EAX, L54+5 
   73| 000420 01030000                                  
   73| 000424 50                          PUSH   EAX    
   73| 000425 E9                          JMP    rts_raise_constraint_error 
   73| 000426 00000000                                  
   73|                 L57:                             
   73| 00042A 8D05                        LEA    EAX, L56+5 
   73| 00042C 13030000                                  
   73| 000430 50                          PUSH   EAX    
   73| 000431 E9                          JMP    rts_raise_constraint_error 
   73| 000432 00000000                                  
   73|                 L59:                             
   73| 000436 8D05                        LEA    EAX, L58+5 
   73| 000438 2C030000                                  
   73| 00043C 50                          PUSH   EAX    
   73| 00043D E9                          JMP    rts_raise_constraint_error 
   73| 00043E 00000000                                  
   73|                 L61:                             
   73| 000442 8D05                        LEA    EAX, L60+5 
   73| 000444 6E030000                                  
   73| 000448 50                          PUSH   EAX    
   73| 000449 E9                          JMP    rts_raise_constraint_error 
   73| 00044A 00000000                                  
   73|                 L63:                             
   73| 00044E 8D05                        LEA    EAX, L62+5 
   73| 000450 90030000                                  
   73| 000454 50                          PUSH   EAX    
   73| 000455 E9                          JMP    rts_raise_constraint_error 
   73| 000456 00000000                                  
                       ;                                
                       lab1.task_start.t1__body ENDP    


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000138     DD     00002601 
                                          DD     0000001A 
                                          DD     lab1.task_start.t1__body 
                                          DD     __lcl.00000139 
                                          DD     0000001B 
                                          DD     lab1.task_start.t1__body+00000010H 
                                          DD     __lcl.00000139 
                                          DD     0000001C 
                                          DD     lab1.task_start.t1__body+00000017H 
                                          DD     __lcl.00000139 
                                          DD     0000001D 
                                          DD     lab1.task_start.t1__body+0000001EH 
                                          DD     __lcl.00000139 
                                          DD     0000001E 
                                          DD     lab1.task_start.t1__body+0000006AH 
                                          DD     __lcl.00000139 
                                          DD     0000001F 
                                          DD     lab1.task_start.t1__body+0000008AH 
                                          DD     __lcl.00000139 
                                          DD     00000020 
                                          DD     lab1.task_start.t1__body+0000008FH 
                                          DD     __lcl.00000139 
                                          DD     00000022 
                                          DD     lab1.task_start.t1__body+0000009EH 
                                          DD     __lcl.00000139 
                                          DD     00000023 
                                          DD     lab1.task_start.t1__body+000000ADH 
                                          DD     __lcl.00000139 
                                          DD     00000024 
                                          DD     lab1.task_start.t1__body+000000BCH 
                                          DD     __lcl.00000139 
                                          DD     00000026 
                                          DD     lab1.task_start.t1__body+000000CBH 
                                          DD     __lcl.00000139 
                                          DD     00000028 
                                          DD     lab1.task_start.t1__body+000000DAH 
                                          DD     __lcl.00000139 
                                          DD     0000002C 
                                          DD     lab1.task_start.t1__body+000000E9H 
                                          DD     __lcl.00000139 
                                          DD     0000002D 
                                          DD     lab1.task_start.t1__body+000000F8H 
                                          DD     __lcl.00000139 
                                          DD     0000002E 
                                          DD     lab1.task_start.t1__body+00000104H 
                                          DD     __lcl.00000139 
                                          DD     0000002F 
                                          DD     lab1.task_start.t1__body+0000012EH 
                                          DD     __lcl.00000139 
                                          DD     00000030 
                                          DD     lab1.task_start.t1__body+0000015BH 
                                          DD     __lcl.00000139 
                                          DD     00000033 
                                          DD     lab1.task_start.t1__body+00000173H 
                                          DD     __lcl.00000139 
                                          DD     00000034 
                                          DD     lab1.task_start.t1__body+0000018DH 
                                          DD     __lcl.00000139 
                                          DD     00000035 
                                          DD     lab1.task_start.t1__body+0000019EH 
                                          DD     __lcl.00000139 
                                          DD     00000036 
                                          DD     lab1.task_start.t1__body+000001AEH 
                                          DD     __lcl.00000139 
                                          DD     00000037 
                                          DD     lab1.task_start.t1__body+000001BFH 
                                          DD     __lcl.00000139 
                                          DD     00000038 
                                          DD     lab1.task_start.t1__body+0000023CH 
                                          DD     __lcl.00000139 
                                          DD     00000039 
                                          DD     lab1.task_start.t1__body+00000250H 
                                          DD     __lcl.00000139 
                                          DD     0000003A 
                                          DD     lab1.task_start.t1__body+0000028AH 
                                          DD     __lcl.00000139 
                                          DD     0000003B 
                                          DD     lab1.task_start.t1__body+00000291H 
                                          DD     __lcl.00000139 
                                          DD     0000003C 
                                          DD     lab1.task_start.t1__body+000002A5H 
                                          DD     __lcl.00000139 
                                          DD     0000003E 
                                          DD     lab1.task_start.t1__body+000002C2H 
                                          DD     __lcl.00000139 
                                          DD     0000003F 
                                          DD     lab1.task_start.t1__body+000002D3H 
                                          DD     __lcl.00000139 
                                          DD     00000040 
                                          DD     lab1.task_start.t1__body+000002E3H 
                                          DD     __lcl.00000139 
                                          DD     00000041 
                                          DD     lab1.task_start.t1__body+000002F0H 
                                          DD     __lcl.00000139 
                                          DD     00000042 
                                          DD     lab1.task_start.t1__body+00000346H 
                                          DD     __lcl.00000139 
                                          DD     00000043 
                                          DD     lab1.task_start.t1__body+00000357H 
                                          DD     __lcl.00000139 
                                          DD     00000044 
                                          DD     lab1.task_start.t1__body+00000395H 
                                          DD     __lcl.00000139 
                                          DD     00000046 
                                          DD     lab1.task_start.t1__body+000003A9H 
                                          DD     __lcl.00000139 
                                          DD     00000048 
                                          DD     lab1.task_start.t1__body+000003B8H 
                                          DD     __lcl.00000139 
                                          DD     00000049 
                                          DD     lab1.task_start.t1__body+000003D0H 
                                          DD     __lcl.00000139 
                                          DD     00000049 
                                          DD     lab1.task_start.t1__body+00000456H 
                                          DD     __lcl.00000139 
; ********* End of segment, Total Size = 460

                       ;                                
                       ;  Start of procedure lab1.task_start.t2__body   
                       ;                                
                                          PUBLIC lab1.task_start.t2__body 
                       lab1.task_start.t2__body PROC NEAR 
;  Source Line # 76
   76| 000000 64                          FS:           
   76| 000001 8B15                        MOV    EDX, 4 
   76| 000003 04000000                                  
   76| 000007 8B52                        MOV    EDX, [EDX-4] 
   76| 000009 FC                                        
   76| 00000A 55                          PUSH   EBP    
   76| 00000B 8BEC                        MOV    EBP, ESP 
   76| 00000D 83EC                        SUB    ESP, 80 
   76| 00000F 50                                        
;  Source Line # 77
   77| 000010 C745                        MOV    DWORD PTR [EBP-72], 0 ;  Sum
   77| 000012 B8                                        
   77| 000013 00000000                                  
;  Source Line # 78
   78| 000017 C745                        MOV    DWORD PTR [EBP-68], 0 ;  Alfa2
   78| 000019 BC                                        
   78| 00001A 00000000                                  
;  Source Line # 79
   79| 00001E 8B02                        MOV    EAX, [EDX+0] 
   79| 000020 8945                        MOV    [EBP-64], EAX ;  dyn_temp
   79| 000022 C0                                        
   79| 000023 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
   79| 000025 00000000                                  
   79| 000029 83EB                        SUB    EBX, 1 
   79| 00002B 01                                        
   79| 00002C 7D                          JGE    SHORT L37 
   79| 00002D 03                                        
   79| 00002E 33DB                        XOR    EBX, EBX 
   79| 000030 4B                          DEC    EBX    
   79|                 L37:                             
   79| 000031 CE                          INTO          
   79| 000032 43                          INC    EBX    
   79| 000033 CE                          INTO          
   79| 000034 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   79| 000037 00000000                                  
   79| 00003B CE                          INTO          
   79| 00003C 53                          PUSH   EBX    
   79| 00003D 8955                        MOV    [EBP-80], EDX ; Spill
   79| 00003F B0                                        
   79| 000040 E8                          CALL   rts_ss_allocate 
   79| 000041 00000000                                  
   79| 000045 8945                        MOV    [EBP-60], EAX ;  MX2
   79| 000047 C4                                        
   79| 000048 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
   79| 00004A 00000000                                  
   79| 00004E 83E9                        SUB    ECX, 1 
   79| 000050 01                                        
   79| 000051 7D                          JGE    SHORT L38 
   79| 000052 03                                        
   79| 000053 33C9                        XOR    ECX, ECX 
   79| 000055 49                          DEC    ECX    
   79|                 L38:                             
   79| 000056 CE                          INTO          
   79| 000057 41                          INC    ECX    
   79| 000058 CE                          INTO          
   79| 000059 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
   79| 00005C 00000000                                  
   79| 000060 CE                          INTO          
   79| 000061 51                          PUSH   ECX    
   79| 000062 E8                          CALL   rts_ss_allocate 
   79| 000063 00000000                                  
   79| 000067 8945                        MOV    [EBP-56], EAX ;  MBUF
   79| 000069 C8                                        
;  Source Line # 80
   80| 00006A 8B35                        MOV    ESI, package1.vec__constrained_array____1 
   80| 00006C 00000000                                  
   80| 000070 83EE                        SUB    ESI, 1 
   80| 000072 01                                        
   80| 000073 7D                          JGE    SHORT L39 
   80| 000074 03                                        
   80| 000075 33F6                        XOR    ESI, ESI 
   80| 000077 4E                          DEC    ESI    
   80|                 L39:                             
   80| 000078 CE                          INTO          
   80| 000079 46                          INC    ESI    
   80| 00007A CE                          INTO          
   80| 00007B D1E6                        SHL    ESI, 1 
   80| 00007D CE                          INTO          
   80| 00007E D1E6                        SHL    ESI, 1 
   80| 000080 CE                          INTO          
   80| 000081 56                          PUSH   ESI    
   80| 000082 E8                          CALL   rts_ss_allocate 
   80| 000083 00000000                                  
   80| 000087 8945                        MOV    [EBP-52], EAX ;  C2
   80| 000089 CC                                        
;  Source Line # 81
   81| 00008A E8                          CALL   rts_activation_succeeded 
   81| 00008B 00000000                                  
;  Source Line # 82
   82| 00008F 68                          PUSH   __lcl.00000080 
   82| 000090 00000000                                  
   82| 000094 68                          PUSH   __lcl.00000079 
   82| 000095 00000000                                  
   82| 000099 E8                          CALL   ada.text_io.put_line__2 
   82| 00009A 00000000                                  
;  Source Line # 84
   84| 00009E 8B55                        MOV    EDX, [EBP-80] ; Spill
   84| 0000A0 B0                                        
   84| 0000A1 8B7A                        MOV    EDI, [EDX+48] 
   84| 0000A3 30                                        
   84| 0000A4 8B5F                        MOV    EBX, [EDI-40] ;  MY
   84| 0000A6 D8                                        
   84| 0000A7 53                          PUSH   EBX    
   84| 0000A8 E8                          CALL   package1.matr_input 
   84| 0000A9 00000000                                  
;  Source Line # 85
   85| 0000AD 8B55                        MOV    EDX, [EBP-80] ; Spill
   85| 0000AF B0                                        
   85| 0000B0 8B4A                        MOV    ECX, [EDX+48] 
   85| 0000B2 30                                        
   85| 0000B3 C741                        MOV    DWORD PTR [ECX-24], 1 ;  Alfa
   85| 0000B5 E8                                        
   85| 0000B6 01000000                                  
;  Source Line # 87
   87| 0000BA 8B72                        MOV    ESI, [EDX+48] 
   87| 0000BC 30                                        
   87| 0000BD 8D76                        LEA    ESI, [ESI-16] ;  S2
   87| 0000BF F0                                        
   87| 0000C0 56                          PUSH   ESI    
   87| 0000C1 E8                          CALL   ada.synchronous_task_control.set_true 
   87| 0000C2 00000000                                  
;  Source Line # 89
   89| 0000C6 8B55                        MOV    EDX, [EBP-80] ; Spill
   89| 0000C8 B0                                        
   89| 0000C9 8B42                        MOV    EAX, [EDX+48] 
   89| 0000CB 30                                        
   89| 0000CC 8D40                        LEA    EAX, [EAX-20] ;  S1
   89| 0000CE EC                                        
   89| 0000CF 50                          PUSH   EAX    
   89| 0000D0 E8                          CALL   ada.synchronous_task_control.suspend_until_true
                                                        
   89| 0000D1 00000000                                  
;  Source Line # 93
   93| 0000D5 8B55                        MOV    EDX, [EBP-80] ; Spill
   93| 0000D7 B0                                        
   93| 0000D8 8B7A                        MOV    EDI, [EDX+48] 
   93| 0000DA 30                                        
   93| 0000DB 8D7F                        LEA    EDI, [EDI-8] ;  var1
   93| 0000DD F8                                        
   93| 0000DE 57                          PUSH   EDI    
   93| 0000DF E8                          CALL   ada.synchronous_task_control.suspend_until_true
                                                        
   93| 0000E0 00000000                                  
;  Source Line # 94
   94| 0000E4 8B55                        MOV    EDX, [EBP-80] ; Spill
   94| 0000E6 B0                                        
   94| 0000E7 8B5A                        MOV    EBX, [EDX+48] 
   94| 0000E9 30                                        
   94| 0000EA 8B4B                        MOV    ECX, [EBX-24] ;  Alfa
   94| 0000EC E8                                        
   94| 0000ED 894D                        MOV    [EBP-68], ECX ;  Alfa2
   94| 0000EF BC                                        
;  Source Line # 95
   95| 0000F0 8B35                        MOV    ESI, package1.matr__constrained_array____1 
   95| 0000F2 00000000                                  
   95| 0000F6 83EE                        SUB    ESI, 1 
   95| 0000F8 01                                        
   95| 0000F9 7D                          JGE    SHORT L40 
   95| 0000FA 03                                        
   95| 0000FB 33F6                        XOR    ESI, ESI 
   95| 0000FD 4E                          DEC    ESI    
   95|                 L40:                             
   95| 0000FE CE                          INTO          
   95| 0000FF 46                          INC    ESI    
   95| 000100 CE                          INTO          
   95| 000101 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
   95| 000104 00000000                                  
   95| 000108 CE                          INTO          
   95| 000109 8B42                        MOV    EAX, [EDX+48] 
   95| 00010B 30                                        
   95| 00010C 8B78                        MOV    EDI, [EAX-44] ;  MX
   95| 00010E D4                                        
   95| 00010F 8B55                        MOV    EDX, [EBP-60] ;  MX2
   95| 000111 C4                                        
   95| 000112 56                          PUSH   ESI    
   95| 000113 57                          PUSH   EDI    
   95| 000114 52                          PUSH   EDX    
   95| 000115 E8                          CALL   _rts_block_move 
   95| 000116 00000000                                  
;  Source Line # 96
   96| 00011A 8B1D                        MOV    EBX, package1.vec__constrained_array____1 
   96| 00011C 00000000                                  
   96| 000120 83EB                        SUB    EBX, 1 
   96| 000122 01                                        
   96| 000123 7D                          JGE    SHORT L41 
   96| 000124 03                                        
   96| 000125 33DB                        XOR    EBX, EBX 
   96| 000127 4B                          DEC    EBX    
   96|                 L41:                             
   96| 000128 CE                          INTO          
   96| 000129 43                          INC    EBX    
   96| 00012A CE                          INTO          
   96| 00012B D1E3                        SHL    EBX, 1 
   96| 00012D CE                          INTO          
   96| 00012E D1E3                        SHL    EBX, 1 
   96| 000130 CE                          INTO          
   96| 000131 8B55                        MOV    EDX, [EBP-80] ; Spill
   96| 000133 B0                                        
   96| 000134 8B4A                        MOV    ECX, [EDX+48] 
   96| 000136 30                                        
   96| 000137 8B71                        MOV    ESI, [ECX-28] ;  C
   96| 000139 E4                                        
   96| 00013A 8B45                        MOV    EAX, [EBP-52] ;  C2
   96| 00013C CC                                        
   96| 00013D 53                          PUSH   EBX    
   96| 00013E 56                          PUSH   ESI    
   96| 00013F 50                          PUSH   EAX    
   96| 000140 E8                          CALL   _rts_block_move 
   96| 000141 00000000                                  
;  Source Line # 97
   97| 000145 8B55                        MOV    EDX, [EBP-80] ; Spill
   97| 000147 B0                                        
   97| 000148 8B7A                        MOV    EDI, [EDX+48] 
   97| 00014A 30                                        
   97| 00014B 8D7F                        LEA    EDI, [EDI-8] ;  var1
   97| 00014D F8                                        
   97| 00014E 57                          PUSH   EDI    
   97| 00014F E8                          CALL   ada.synchronous_task_control.set_true 
   97| 000150 00000000                                  
   97| 000154 8B1D                        MOV    EBX, package1.n 
   97| 000156 00000000                                  
   97| 00015A 895D                        MOV    [EBP-48], EBX 
   97| 00015C D0                                        
;  Source Line # 100
  100| 00015D 837D                        CMP    DWORD PTR [EBP-48], 0 
  100| 00015F D0                                        
  100| 000160 00                                        
  100| 000161 0F8E                        JLE    L12    
  100| 000163 5A010000                                  
  100| 000167 C745                        MOV    DWORD PTR [EBP-44], 1 
  100| 000169 D4                                        
  100| 00016A 01000000                                  
  100|                 L14:                             
  100| 00016E 8B05                        MOV    EAX, package1.h 
  100| 000170 00000000                                  
  100| 000174 40                          INC    EAX    
  100| 000175 CE                          INTO          
  100| 000176 8945                        MOV    [EBP-40], EAX 
  100| 000178 D8                                        
  100| 000179 8B1D                        MOV    EBX, package1.n 
  100| 00017B 00000000                                  
  100| 00017F 895D                        MOV    [EBP-36], EBX 
  100| 000181 DC                                        
;  Source Line # 101
  101| 000182 8B4D                        MOV    ECX, [EBP-36] 
  101| 000184 DC                                        
  101| 000185 394D                        CMP    [EBP-40], ECX 
  101| 000187 D8                                        
  101| 000188 0F8F                        JG     L15    
  101| 00018A 1F010000                                  
  101| 00018E 8B45                        MOV    EAX, [EBP-40] 
  101| 000190 D8                                        
  101| 000191 8945                        MOV    [EBP-32], EAX 
  101| 000193 E0                                        
  101|                 L17:                             
;  Source Line # 102
  102| 000194 C745                        MOV    DWORD PTR [EBP-72], 0 ;  Sum
  102| 000196 B8                                        
  102| 000197 00000000                                  
  102| 00019B 8B05                        MOV    EAX, package1.n 
  102| 00019D 00000000                                  
  102| 0001A1 8945                        MOV    [EBP-28], EAX 
  102| 0001A3 E4                                        
;  Source Line # 103
  103| 0001A4 837D                        CMP    DWORD PTR [EBP-28], 0 
  103| 0001A6 E4                                        
  103| 0001A7 00                                        
  103| 0001A8 0F8E                        JLE    L18    
  103| 0001AA A1000000                                  
  103| 0001AE C745                        MOV    DWORD PTR [EBP-24], 1 
  103| 0001B0 E8                                        
  103| 0001B1 01000000                                  
  103|                 L20:                             
;  Source Line # 104
  104| 0001B5 8B45                        MOV    EAX, [EBP-60] ;  MX2
  104| 0001B7 C4                                        
  104| 0001B8 8B5D                        MOV    EBX, [EBP-44] 
  104| 0001BA D4                                        
  104| 0001BB 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
  104| 0001BD 00000000                                  
  104|                 L42:                             
  104| 0001C1 0F8F                        JG     L43    
  104| 0001C3 54020000                                  
  104| 0001C7 8D5B                        LEA    EBX, [EBX-1] 
  104| 0001C9 FF                                        
  104| 0001CA 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  104| 0001CD 00000000                                  
  104| 0001D1 8B4D                        MOV    ECX, [EBP-24] 
  104| 0001D3 E8                                        
  104| 0001D4 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  104| 0001D6 00000000                                  
  104|                 L44:                             
  104| 0001DA 0F8F                        JG     L45    
  104| 0001DC 47020000                                  
  104| 0001E0 8D0C8D                      LEA    ECX, [4*ECX-4] 
  104| 0001E3 FCFFFFFF                                  
  104| 0001E7 03D9                        ADD    EBX, ECX 
  104| 0001E9 8B55                        MOV    EDX, [EBP-80] ; Spill
  104| 0001EB B0                                        
  104| 0001EC 8B72                        MOV    ESI, [EDX+48] 
  104| 0001EE 30                                        
  104| 0001EF 8B7E                        MOV    EDI, [ESI-40] ;  MY
  104| 0001F1 D8                                        
  104| 0001F2 8B4D                        MOV    ECX, [EBP-24] 
  104| 0001F4 E8                                        
  104| 0001F5 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  104| 0001F7 00000000                                  
  104|                 L46:                             
  104| 0001FB 0F8F                        JG     L47    
  104| 0001FD 32020000                                  
  104| 000201 8D49                        LEA    ECX, [ECX-1] 
  104| 000203 FF                                        
  104| 000204 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  104| 000207 00000000                                  
  104| 00020B 8B55                        MOV    EDX, [EBP-32] 
  104| 00020D E0                                        
  104| 00020E 83FA                        CMP    EDX, 1 
  104| 000210 01                                        
  104|                 L48:                             
  104| 000211 0F8C                        JL     L49    
  104| 000213 28020000                                  
  104| 000217 3B15                        CMP    EDX, package1.vec__constrained_array____1 
  104| 000219 00000000                                  
  104| 00021D 0F8F                        JG     L49    
  104| 00021F 1C020000                                  
  104| 000223 8D1495                      LEA    EDX, [4*EDX-4] 
  104| 000226 FCFFFFFF                                  
  104| 00022A 03CA                        ADD    ECX, EDX 
  104| 00022C 8B0418                      MOV    EAX, [EAX+EBX+0] 
  104| 00022F 0FAF040F                    IMUL   EAX, [EDI+ECX+0] 
  104| 000233 CE                          INTO          
  104| 000234 0345                        ADD    EAX, [EBP-72] ;  Sum
  104| 000236 B8                                        
  104| 000237 CE                          INTO          
  104| 000238 8945                        MOV    [EBP-72], EAX ;  Sum
  104| 00023A B8                                        
;  Source Line # 105
  105| 00023B 8B5D                        MOV    EBX, [EBP-28] 
  105| 00023D E4                                        
  105| 00023E 395D                        CMP    [EBP-24], EBX 
  105| 000240 E8                                        
  105| 000241 74                          JE     SHORT L18 
  105| 000242 0C                                        
  105| 000243 8B45                        MOV    EAX, [EBP-24] 
  105| 000245 E8                                        
  105| 000246 40                          INC    EAX    
  105| 000247 8945                        MOV    [EBP-24], EAX 
  105| 000249 E8                                        
  105| 00024A E9                          JMP    L20    
  105| 00024B 66FFFFFF                                  
  105|                 L18:                             
;  Source Line # 106
  106| 00024F 8B45                        MOV    EAX, [EBP-56] ;  MBUF
  106| 000251 C8                                        
  106| 000252 8B5D                        MOV    EBX, [EBP-44] 
  106| 000254 D4                                        
  106| 000255 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
  106| 000257 00000000                                  
  106|                 L50:                             
  106| 00025B 0F8F                        JG     L51    
  106| 00025D EA010000                                  
  106| 000261 8D5B                        LEA    EBX, [EBX-1] 
  106| 000263 FF                                        
  106| 000264 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  106| 000267 00000000                                  
  106| 00026B 8B4D                        MOV    ECX, [EBP-32] 
  106| 00026D E0                                        
  106| 00026E 83F9                        CMP    ECX, 1 
  106| 000270 01                                        
  106|                 L52:                             
  106| 000271 0F8C                        JL     L53    
  106| 000273 E0010000                                  
  106| 000277 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  106| 000279 00000000                                  
  106| 00027D 0F8F                        JG     L53    
  106| 00027F D4010000                                  
  106| 000283 8D0C8D                      LEA    ECX, [4*ECX-4] 
  106| 000286 FCFFFFFF                                  
  106| 00028A 03D9                        ADD    EBX, ECX 
  106| 00028C 8B55                        MOV    EDX, [EBP-72] ;  Sum
  106| 00028E B8                                        
  106| 00028F 891418                      MOV    [EAX+EBX+0], EDX 
;  Source Line # 107
  107| 000292 C745                        MOV    DWORD PTR [EBP-72], 0 ;  Sum
  107| 000294 B8                                        
  107| 000295 00000000                                  
;  Source Line # 108
  108| 000299 8B75                        MOV    ESI, [EBP-36] 
  108| 00029B DC                                        
  108| 00029C 3975                        CMP    [EBP-32], ESI 
  108| 00029E E0                                        
  108| 00029F 74                          JE     SHORT L15 
  108| 0002A0 0C                                        
  108| 0002A1 8B45                        MOV    EAX, [EBP-32] 
  108| 0002A3 E0                                        
  108| 0002A4 40                          INC    EAX    
  108| 0002A5 8945                        MOV    [EBP-32], EAX 
  108| 0002A7 E0                                        
  108| 0002A8 E9                          JMP    L17    
  108| 0002A9 E7FEFFFF                                  
  108|                 L15:                             
;  Source Line # 109
  109| 0002AD 8B45                        MOV    EAX, [EBP-48] 
  109| 0002AF D0                                        
  109| 0002B0 3945                        CMP    [EBP-44], EAX 
  109| 0002B2 D4                                        
  109| 0002B3 74                          JE     SHORT L12 
  109| 0002B4 0C                                        
  109| 0002B5 8B45                        MOV    EAX, [EBP-44] 
  109| 0002B7 D4                                        
  109| 0002B8 40                          INC    EAX    
  109| 0002B9 8945                        MOV    [EBP-44], EAX 
  109| 0002BB D4                                        
  109| 0002BC E9                          JMP    L14    
  109| 0002BD ADFEFFFF                                  
  109|                 L12:                             
  109| 0002C1 8B05                        MOV    EAX, package1.h 
  109| 0002C3 00000000                                  
  109| 0002C7 40                          INC    EAX    
  109| 0002C8 CE                          INTO          
  109| 0002C9 8945                        MOV    [EBP-20], EAX 
  109| 0002CB EC                                        
  109| 0002CC 8B1D                        MOV    EBX, package1.n 
  109| 0002CE 00000000                                  
  109| 0002D2 895D                        MOV    [EBP-16], EBX 
  109| 0002D4 F0                                        
;  Source Line # 111
  111| 0002D5 8B4D                        MOV    ECX, [EBP-16] 
  111| 0002D7 F0                                        
  111| 0002D8 394D                        CMP    [EBP-20], ECX 
  111| 0002DA EC                                        
  111| 0002DB 0F8F                        JG     L27    
  111| 0002DD F0000000                                  
  111| 0002E1 8B45                        MOV    EAX, [EBP-20] 
  111| 0002E3 EC                                        
  111| 0002E4 8945                        MOV    [EBP-12], EAX 
  111| 0002E6 F4                                        
  111|                 L29:                             
;  Source Line # 112
  112| 0002E7 C745                        MOV    DWORD PTR [EBP-72], 0 ;  Sum
  112| 0002E9 B8                                        
  112| 0002EA 00000000                                  
  112| 0002EE 8B05                        MOV    EAX, package1.n 
  112| 0002F0 00000000                                  
  112| 0002F4 8945                        MOV    [EBP-8], EAX 
  112| 0002F6 F8                                        
;  Source Line # 113
  113| 0002F7 837D                        CMP    DWORD PTR [EBP-8], 0 
  113| 0002F9 F8                                        
  113| 0002FA 00                                        
  113| 0002FB 7E                          JLE    SHORT L30 
  113| 0002FC 77                                        
  113| 0002FD C745                        MOV    DWORD PTR [EBP-4], 1 
  113| 0002FF FC                                        
  113| 000300 01000000                                  
  113|                 L32:                             
;  Source Line # 114
  114| 000304 8B45                        MOV    EAX, [EBP-52] ;  C2
  114| 000306 CC                                        
  114| 000307 8B5D                        MOV    EBX, [EBP-4] 
  114| 000309 FC                                        
  114| 00030A 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
  114| 00030C 00000000                                  
  114|                 L54:                             
  114| 000310 0F8F                        JG     L55    
  114| 000312 4D010000                                  
  114| 000316 8B4D                        MOV    ECX, [EBP-56] ;  MBUF
  114| 000318 C8                                        
  114| 000319 8B55                        MOV    EDX, [EBP-4] 
  114| 00031B FC                                        
  114| 00031C 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  114| 00031E 00000000                                  
  114|                 L56:                             
  114| 000322 0F8F                        JG     L57    
  114| 000324 47010000                                  
  114| 000328 8D52                        LEA    EDX, [EDX-1] 
  114| 00032A FF                                        
  114| 00032B 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  114| 00032E 00000000                                  
  114| 000332 8B75                        MOV    ESI, [EBP-12] 
  114| 000334 F4                                        
  114| 000335 83FE                        CMP    ESI, 1 
  114| 000337 01                                        
  114|                 L58:                             
  114| 000338 0F8C                        JL     L59    
  114| 00033A 3D010000                                  
  114| 00033E 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  114| 000340 00000000                                  
  114| 000344 0F8F                        JG     L59    
  114| 000346 31010000                                  
  114| 00034A 8D34B5                      LEA    ESI, [4*ESI-4] 
  114| 00034D FCFFFFFF                                  
  114| 000351 03D6                        ADD    EDX, ESI 
  114| 000353 8B7C98                      MOV    EDI, [EAX+4*EBX-4] 
  114| 000356 FC                                        
  114| 000357 0FAF3C11                    IMUL   EDI, [ECX+EDX+0] 
  114| 00035B CE                          INTO          
  114| 00035C 037D                        ADD    EDI, [EBP-72] ;  Sum
  114| 00035E B8                                        
  114| 00035F CE                          INTO          
  114| 000360 897D                        MOV    [EBP-72], EDI ;  Sum
  114| 000362 B8                                        
;  Source Line # 115
  115| 000363 8B45                        MOV    EAX, [EBP-8] 
  115| 000365 F8                                        
  115| 000366 3945                        CMP    [EBP-4], EAX 
  115| 000368 FC                                        
  115| 000369 74                          JE     SHORT L30 
  115| 00036A 09                                        
  115| 00036B 8B45                        MOV    EAX, [EBP-4] 
  115| 00036D FC                                        
  115| 00036E 40                          INC    EAX    
  115| 00036F 8945                        MOV    [EBP-4], EAX 
  115| 000371 FC                                        
  115| 000372 EB                          JMP    SHORT L32 
  115| 000373 90                                        
  115|                 L30:                             
;  Source Line # 116
  116| 000374 8B55                        MOV    EDX, [EBP-80] ; Spill
  116| 000376 B0                                        
  116| 000377 8B42                        MOV    EAX, [EDX+48] 
  116| 000379 30                                        
  116| 00037A 8B58                        MOV    EBX, [EAX-32] ;  B
  116| 00037C E0                                        
  116| 00037D 8B4D                        MOV    ECX, [EBP-12] 
  116| 00037F F4                                        
  116| 000380 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  116| 000382 00000000                                  
  116|                 L60:                             
  116| 000386 0F8F                        JG     L61    
  116| 000388 FB000000                                  
  116| 00038C 8B748B                      MOV    ESI, [EBX+4*ECX-4] 
  116| 00038F FC                                        
  116| 000390 0FAF75                      IMUL   ESI, [EBP-68] ;  Alfa2
  116| 000393 BC                                        
  116| 000394 CE                          INTO          
  116| 000395 2B75                        SUB    ESI, [EBP-72] ;  Sum
  116| 000397 B8                                        
  116| 000398 CE                          INTO          
  116| 000399 8B7A                        MOV    EDI, [EDX+48] 
  116| 00039B 30                                        
  116| 00039C 8B57                        MOV    EDX, [EDI-36] ;  A
  116| 00039E DC                                        
  116| 00039F 8B45                        MOV    EAX, [EBP-12] 
  116| 0003A1 F4                                        
  116| 0003A2 3D                          CMP    EAX, 1 
  116| 0003A3 01000000                                  
  116|                 L62:                             
  116| 0003A7 0F8C                        JL     L63    
  116| 0003A9 E6000000                                  
  116| 0003AD 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  116| 0003AF 00000000                                  
  116| 0003B3 0F8F                        JG     L63    
  116| 0003B5 DA000000                                  
  116| 0003B9 897482                      MOV    [EDX+4*EAX-4], ESI 
  116| 0003BC FC                                        
;  Source Line # 117
  117| 0003BD 8B5D                        MOV    EBX, [EBP-16] 
  117| 0003BF F0                                        
  117| 0003C0 395D                        CMP    [EBP-12], EBX 
  117| 0003C2 F4                                        
  117| 0003C3 74                          JE     SHORT L27 
  117| 0003C4 0C                                        
  117| 0003C5 8B45                        MOV    EAX, [EBP-12] 
  117| 0003C7 F4                                        
  117| 0003C8 40                          INC    EAX    
  117| 0003C9 8945                        MOV    [EBP-12], EAX 
  117| 0003CB F4                                        
  117| 0003CC E9                          JMP    L29    
  117| 0003CD 16FFFFFF                                  
  117|                 L27:                             
;  Source Line # 120
  120| 0003D1 8B55                        MOV    EDX, [EBP-80] ; Spill
  120| 0003D3 B0                                        
  120| 0003D4 8B42                        MOV    EAX, [EDX+48] 
  120| 0003D6 30                                        
  120| 0003D7 8D40                        LEA    EAX, [EAX-12] ;  S3
  120| 0003D9 F4                                        
  120| 0003DA 50                          PUSH   EAX    
  120| 0003DB E8                          CALL   ada.synchronous_task_control.suspend_until_true
                                                        
  120| 0003DC 00000000                                  
;  Source Line # 123
  123| 0003E0 6A                          PUSH   1      
  123| 0003E1 01                                        
  123| 0003E2 E8                          CALL   ada.text_io.new_line__2 
  123| 0003E3 00000000                                  
;  Source Line # 124
  124| 0003E7 8B55                        MOV    EDX, [EBP-80] ; Spill
  124| 0003E9 B0                                        
  124| 0003EA 8B5A                        MOV    EBX, [EDX+48] 
  124| 0003EC 30                                        
  124| 0003ED 8B4B                        MOV    ECX, [EBX-36] ;  A
  124| 0003EF DC                                        
  124| 0003F0 51                          PUSH   ECX    
  124| 0003F1 E8                          CALL   package1.vec_print 
  124| 0003F2 00000000                                  
;  Source Line # 125
  125| 0003F6 6A                          PUSH   1      
  125| 0003F7 01                                        
  125| 0003F8 E8                          CALL   ada.text_io.new_line__2 
  125| 0003F9 00000000                                  
;  Source Line # 126
  126| 0003FD 68                          PUSH   __lcl.00000110 
  126| 0003FE 00000000                                  
  126| 000402 68                          PUSH   __lcl.00000109 
  126| 000403 00000000                                  
  126| 000407 E8                          CALL   ada.text_io.put_line__2 
  126| 000408 00000000                                  
  126| 00040C 8D75                        LEA    ESI, [EBP-64] ;  dyn_temp
  126| 00040E C0                                        
  126| 00040F 56                          PUSH   ESI    
  126| 000410 E8                          CALL   rts_ss_release 
  126| 000411 00000000                                  
;  Source Line # 127
  127| 000415 8BE5                        MOV    ESP, EBP 
  127| 000417 5D                          POP    EBP    
  127| 000418 C2                          RET    4      
  127| 000419 0400                                      
  127|                 L43:                             
  127| 00041B 8D05                        LEA    EAX, L42+5 
  127| 00041D C6010000                                  
  127| 000421 50                          PUSH   EAX    
  127| 000422 E9                          JMP    rts_raise_constraint_error 
  127| 000423 00000000                                  
  127|                 L45:                             
  127| 000427 8D05                        LEA    EAX, L44+5 
  127| 000429 DF010000                                  
  127| 00042D 50                          PUSH   EAX    
  127| 00042E E9                          JMP    rts_raise_constraint_error 
  127| 00042F 00000000                                  
  127|                 L47:                             
  127| 000433 8D05                        LEA    EAX, L46+5 
  127| 000435 00020000                                  
  127| 000439 50                          PUSH   EAX    
  127| 00043A E9                          JMP    rts_raise_constraint_error 
  127| 00043B 00000000                                  
  127|                 L49:                             
  127| 00043F 8D05                        LEA    EAX, L48+5 
  127| 000441 16020000                                  
  127| 000445 50                          PUSH   EAX    
  127| 000446 E9                          JMP    rts_raise_constraint_error 
  127| 000447 00000000                                  
  127|                 L51:                             
  127| 00044B 8D05                        LEA    EAX, L50+5 
  127| 00044D 60020000                                  
  127| 000451 50                          PUSH   EAX    
  127| 000452 E9                          JMP    rts_raise_constraint_error 
  127| 000453 00000000                                  
  127|                 L53:                             
  127| 000457 8D05                        LEA    EAX, L52+5 
  127| 000459 76020000                                  
  127| 00045D 50                          PUSH   EAX    
  127| 00045E E9                          JMP    rts_raise_constraint_error 
  127| 00045F 00000000                                  
  127|                 L55:                             
  127| 000463 8D05                        LEA    EAX, L54+5 
  127| 000465 15030000                                  
  127| 000469 50                          PUSH   EAX    
  127| 00046A E9                          JMP    rts_raise_constraint_error 
  127| 00046B 00000000                                  
  127|                 L57:                             
  127| 00046F 8D05                        LEA    EAX, L56+5 
  127| 000471 27030000                                  
  127| 000475 50                          PUSH   EAX    
  127| 000476 E9                          JMP    rts_raise_constraint_error 
  127| 000477 00000000                                  
  127|                 L59:                             
  127| 00047B 8D05                        LEA    EAX, L58+5 
  127| 00047D 3D030000                                  
  127| 000481 50                          PUSH   EAX    
  127| 000482 E9                          JMP    rts_raise_constraint_error 
  127| 000483 00000000                                  
  127|                 L61:                             
  127| 000487 8D05                        LEA    EAX, L60+5 
  127| 000489 8B030000                                  
  127| 00048D 50                          PUSH   EAX    
  127| 00048E E9                          JMP    rts_raise_constraint_error 
  127| 00048F 00000000                                  
  127|                 L63:                             
  127| 000493 8D05                        LEA    EAX, L62+5 
  127| 000495 AC030000                                  
  127| 000499 50                          PUSH   EAX    
  127| 00049A E9                          JMP    rts_raise_constraint_error 
  127| 00049B 00000000                                  
                       ;                                
                       lab1.task_start.t2__body ENDP    

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000137     DD     00002801 
                                          DD     0000004C 
                                          DD     lab1.task_start.t2__body 
                                          DD     __lcl.00000139 
                                          DD     0000004D 
                                          DD     lab1.task_start.t2__body+00000010H 
                                          DD     __lcl.00000139 
                                          DD     0000004E 
                                          DD     lab1.task_start.t2__body+00000017H 
                                          DD     __lcl.00000139 
                                          DD     0000004F 
                                          DD     lab1.task_start.t2__body+0000001EH 
                                          DD     __lcl.00000139 
                                          DD     00000050 
                                          DD     lab1.task_start.t2__body+0000006AH 
                                          DD     __lcl.00000139 
                                          DD     00000051 
                                          DD     lab1.task_start.t2__body+0000008AH 
                                          DD     __lcl.00000139 
                                          DD     00000052 
                                          DD     lab1.task_start.t2__body+0000008FH 
                                          DD     __lcl.00000139 
                                          DD     00000054 
                                          DD     lab1.task_start.t2__body+0000009EH 
                                          DD     __lcl.00000139 
                                          DD     00000055 
                                          DD     lab1.task_start.t2__body+000000ADH 
                                          DD     __lcl.00000139 
                                          DD     00000057 
                                          DD     lab1.task_start.t2__body+000000BAH 
                                          DD     __lcl.00000139 
                                          DD     00000059 
                                          DD     lab1.task_start.t2__body+000000C6H 
                                          DD     __lcl.00000139 
                                          DD     0000005D 
                                          DD     lab1.task_start.t2__body+000000D5H 
                                          DD     __lcl.00000139 
                                          DD     0000005E 
                                          DD     lab1.task_start.t2__body+000000E4H 
                                          DD     __lcl.00000139 
                                          DD     0000005F 
                                          DD     lab1.task_start.t2__body+000000F0H 
                                          DD     __lcl.00000139 
                                          DD     00000060 
                                          DD     lab1.task_start.t2__body+0000011AH 
                                          DD     __lcl.00000139 
                                          DD     00000061 
                                          DD     lab1.task_start.t2__body+00000145H 
                                          DD     __lcl.00000139 
                                          DD     00000064 
                                          DD     lab1.task_start.t2__body+0000015DH 
                                          DD     __lcl.00000139 
                                          DD     00000065 
                                          DD     lab1.task_start.t2__body+00000182H 
                                          DD     __lcl.00000139 
                                          DD     00000066 
                                          DD     lab1.task_start.t2__body+00000194H 
                                          DD     __lcl.00000139 
                                          DD     00000067 
                                          DD     lab1.task_start.t2__body+000001A4H 
                                          DD     __lcl.00000139 
                                          DD     00000068 
                                          DD     lab1.task_start.t2__body+000001B5H 
                                          DD     __lcl.00000139 
                                          DD     00000069 
                                          DD     lab1.task_start.t2__body+0000023BH 
                                          DD     __lcl.00000139 
                                          DD     0000006A 
                                          DD     lab1.task_start.t2__body+0000024FH 
                                          DD     __lcl.00000139 
                                          DD     0000006B 
                                          DD     lab1.task_start.t2__body+00000292H 
                                          DD     __lcl.00000139 
                                          DD     0000006C 
                                          DD     lab1.task_start.t2__body+00000299H 
                                          DD     __lcl.00000139 
                                          DD     0000006D 
                                          DD     lab1.task_start.t2__body+000002ADH 
                                          DD     __lcl.00000139 
                                          DD     0000006F 
                                          DD     lab1.task_start.t2__body+000002D5H 
                                          DD     __lcl.00000139 
                                          DD     00000070 
                                          DD     lab1.task_start.t2__body+000002E7H 
                                          DD     __lcl.00000139 
                                          DD     00000071 
                                          DD     lab1.task_start.t2__body+000002F7H 
                                          DD     __lcl.00000139 
                                          DD     00000072 
                                          DD     lab1.task_start.t2__body+00000304H 
                                          DD     __lcl.00000139 
                                          DD     00000073 
                                          DD     lab1.task_start.t2__body+00000363H 
                                          DD     __lcl.00000139 
                                          DD     00000074 
                                          DD     lab1.task_start.t2__body+00000374H 
                                          DD     __lcl.00000139 
                                          DD     00000075 
                                          DD     lab1.task_start.t2__body+000003BDH 
                                          DD     __lcl.00000139 
                                          DD     00000078 
                                          DD     lab1.task_start.t2__body+000003D1H 
                                          DD     __lcl.00000139 
                                          DD     0000007B 
                                          DD     lab1.task_start.t2__body+000003E0H 
                                          DD     __lcl.00000139 
                                          DD     0000007C 
                                          DD     lab1.task_start.t2__body+000003E7H 
                                          DD     __lcl.00000139 
                                          DD     0000007D 
                                          DD     lab1.task_start.t2__body+000003F6H 
                                          DD     __lcl.00000139 
                                          DD     0000007E 
                                          DD     lab1.task_start.t2__body+000003FDH 
                                          DD     __lcl.00000139 
                                          DD     0000007F 
                                          DD     lab1.task_start.t2__body+00000415H 
                                          DD     __lcl.00000139 
                                          DD     0000007F 
                                          DD     lab1.task_start.t2__body+0000049BH 
                                          DD     __lcl.00000139 
; ********* End of segment, Total Size = 484

                       ;                                
                       ;  Start of procedure lab1.task_start   
                       ;                                
                                          PUBLIC lab1.task_start 
                       lab1.task_start    PROC   NEAR   
;  Source Line # 24
   24| 000000 55                          PUSH   EBP    
   24| 000001 8BEC                        MOV    EBP, ESP 
   24| 000003 81EC                        SUB    ESP, 164 
   24| 000005 A4000000                                  
;  Source Line # 25
   25| 000009 C645                        MOV    BYTE PTR [EBP-4], 0 ;  T1__elab_bool
   25| 00000B FC                                        
   25| 00000C 00                                        
   25| 00000D 6A                          PUSH   0      
   25| 00000E 00                                        
   25| 00000F 8D85                        LEA    EAX, [EBP-164] ;  master_record
   25| 000011 5CFFFFFF                                  
   25| 000015 50                          PUSH   EAX    
   25| 000016 E8                          CALL   rts_init_master 
   25| 000017 00000000                                  
   25| 00001B 8D5D                        LEA    EBX, [EBP-108] ;  activation_list
   25| 00001D 94                                        
   25| 00001E 53                          PUSH   EBX    
   25| 00001F E8                          CALL   rts_initialize_activation_list 
   25| 000020 00000000                                  
   25| 000024 68                          PUSH   __lcl.00000116 
   25| 000025 00000000                                  
   25| 000029 6A                          PUSH   0      
   25| 00002A 00                                        
   25| 00002B 8D4D                        LEA    ECX, [EBP-4] ;  T1__elab_bool
   25| 00002D FC                                        
   25| 00002E 51                          PUSH   ECX    
   25| 00002F 6A                          PUSH   0      
   25| 000030 00                                        
   25| 000031 8D55                        LEA    EDX, [EBP-36] ;  T1
   25| 000033 DC                                        
   25| 000034 52                          PUSH   EDX    
   25| 000035 6A                          PUSH   0      
   25| 000036 00                                        
   25| 000037 68                          PUSH   lab1.task_start.t1__body 
   25| 000038 00000000                                  
   25| 00003C 8DB5                        LEA    ESI, [EBP-164] ;  master_record
   25| 00003E 5CFFFFFF                                  
   25| 000042 56                          PUSH   ESI    
   25| 000043 8D7D                        LEA    EDI, [EBP-108] ;  activation_list
   25| 000045 94                                        
   25| 000046 57                          PUSH   EDI    
   25| 000047 6A                          PUSH   0      
   25| 000048 00                                        
   25| 000049 E8                          CALL   rts_initialize_task_with_name 
   25| 00004A 00000000                                  
;  Source Line # 26
   26| 00004E C645                        MOV    BYTE PTR [EBP-4], 1 ;  T1__elab_bool
   26| 000050 FC                                        
   26| 000051 01                                        
;  Source Line # 75
   75| 000052 C645                        MOV    BYTE PTR [EBP-3], 0 ;  T2__elab_bool
   75| 000054 FD                                        
   75| 000055 00                                        
   75| 000056 68                          PUSH   __lcl.00000117 
   75| 000057 00000000                                  
   75| 00005B 6A                          PUSH   0      
   75| 00005C 00                                        
   75| 00005D 8D45                        LEA    EAX, [EBP-3] ;  T2__elab_bool
   75| 00005F FD                                        
   75| 000060 50                          PUSH   EAX    
   75| 000061 6A                          PUSH   0      
   75| 000062 00                                        
   75| 000063 8D5D                        LEA    EBX, [EBP-20] ;  T2
   75| 000065 EC                                        
   75| 000066 53                          PUSH   EBX    
   75| 000067 6A                          PUSH   0      
   75| 000068 00                                        
   75| 000069 68                          PUSH   lab1.task_start.t2__body 
   75| 00006A 00000000                                  
   75| 00006E 8D8D                        LEA    ECX, [EBP-164] ;  master_record
   75| 000070 5CFFFFFF                                  
   75| 000074 51                          PUSH   ECX    
   75| 000075 8D55                        LEA    EDX, [EBP-108] ;  activation_list
   75| 000077 94                                        
   75| 000078 52                          PUSH   EDX    
   75| 000079 6A                          PUSH   0      
   75| 00007A 00                                        
   75| 00007B E8                          CALL   rts_initialize_task_with_name 
   75| 00007C 00000000                                  
;  Source Line # 76
   76| 000080 C645                        MOV    BYTE PTR [EBP-3], 1 ;  T2__elab_bool
   76| 000082 FD                                        
   76| 000083 01                                        
;  Source Line # 129
  129| 000084 8D75                        LEA    ESI, [EBP-108] ;  activation_list
  129| 000086 94                                        
  129| 000087 56                          PUSH   ESI    
  129| 000088 E8                          CALL   rts_activate_tasks 
  129| 000089 00000000                                  
  129| 00008D 8DBD                        LEA    EDI, [EBP-164] ;  master_record
  129| 00008F 5CFFFFFF                                  
  129| 000093 57                          PUSH   EDI    
  129| 000094 E8                          CALL   rts_finalize_and_pop 
  129| 000095 00000000                                  
;  Source Line # 131
  131| 000099 8BE5                        MOV    ESP, EBP 
  131| 00009B 5D                          POP    EBP    
  131| 00009C C3                          RET           
                       ;                                
                       lab1.task_start    ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000136     DD     00000801 
                                          DD     00000018 
                                          DD     lab1.task_start 
                                          DD     __lcl.00000139 
                                          DD     00000019 
                                          DD     lab1.task_start+00000009H 
                                          DD     __lcl.00000139 
                                          DD     0000001A 
                                          DD     lab1.task_start+0000004EH 
                                          DD     __lcl.00000139 
                                          DD     0000004B 
                                          DD     lab1.task_start+00000052H 
                                          DD     __lcl.00000139 
                                          DD     0000004C 
                                          DD     lab1.task_start+00000080H 
                                          DD     __lcl.00000139 
                                          DD     00000081 
                                          DD     lab1.task_start+00000084H 
                                          DD     __lcl.00000139 
                                          DD     00000083 
                                          DD     lab1.task_start+00000099H 
                                          DD     __lcl.00000139 
                                          DD     00000083 
                                          DD     lab1.task_start+00000099H 
                                          DD     __lcl.00000139 
; ********* End of segment, Total Size = 100

                       ;                                
                       ;  Start of procedure lab1       
                       ;                                
                                          PUBLIC lab1   
                       lab1               PROC   NEAR   
;  Source Line # 14
   14| 000000 64                          FS:           
   14| 000001 8B15                        MOV    EDX, 4 
   14| 000003 04000000                                  
   14| 000007 8B52                        MOV    EDX, [EDX-4] 
   14| 000009 FC                                        
   14| 00000A 55                          PUSH   EBP    
   14| 00000B 8BEC                        MOV    EBP, ESP 
   14| 00000D 8A4424                      MOV    AL, [ESP-60] 
   14| 000010 C4                                        
   14| 000011 83EC                        SUB    ESP, 60 
   14| 000013 3C                                        
   14| 000014 8B42                        MOV    EAX, [EDX+48] 
   14| 000016 30                                        
   14| 000017 8945                        MOV    [EBP-4], EAX 
   14| 000019 FC                                        
   14| 00001A 896A                        MOV    [EDX+48], EBP 
   14| 00001C 30                                        
;  Source Line # 17
   17| 00001D 8B02                        MOV    EAX, [EDX+0] 
   17| 00001F 8945                        MOV    [EBP-48], EAX ;  dyn_temp
   17| 000021 D0                                        
   17| 000022 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
   17| 000024 00000000                                  
   17| 000028 83EB                        SUB    EBX, 1 
   17| 00002A 01                                        
   17| 00002B 7D                          JGE    SHORT L12 
   17| 00002C 03                                        
   17| 00002D 33DB                        XOR    EBX, EBX 
   17| 00002F 4B                          DEC    EBX    
   17|                 L12:                             
   17| 000030 CE                          INTO          
   17| 000031 43                          INC    EBX    
   17| 000032 CE                          INTO          
   17| 000033 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   17| 000036 00000000                                  
   17| 00003A CE                          INTO          
   17| 00003B 53                          PUSH   EBX    
   17| 00003C 8955                        MOV    [EBP-60], EDX ; Spill
   17| 00003E C4                                        
   17| 00003F E8                          CALL   rts_ss_allocate 
   17| 000040 00000000                                  
   17| 000044 8945                        MOV    [EBP-44], EAX ;  MX
   17| 000046 D4                                        
   17| 000047 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
   17| 000049 00000000                                  
   17| 00004D 83E9                        SUB    ECX, 1 
   17| 00004F 01                                        
   17| 000050 7D                          JGE    SHORT L13 
   17| 000051 03                                        
   17| 000052 33C9                        XOR    ECX, ECX 
   17| 000054 49                          DEC    ECX    
   17|                 L13:                             
   17| 000055 CE                          INTO          
   17| 000056 41                          INC    ECX    
   17| 000057 CE                          INTO          
   17| 000058 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
   17| 00005B 00000000                                  
   17| 00005F CE                          INTO          
   17| 000060 51                          PUSH   ECX    
   17| 000061 E8                          CALL   rts_ss_allocate 
   17| 000062 00000000                                  
   17| 000066 8945                        MOV    [EBP-40], EAX ;  MY
   17| 000068 D8                                        
;  Source Line # 18
   18| 000069 8B35                        MOV    ESI, package1.vec__constrained_array____1 
   18| 00006B 00000000                                  
   18| 00006F 83EE                        SUB    ESI, 1 
   18| 000071 01                                        
   18| 000072 7D                          JGE    SHORT L14 
   18| 000073 03                                        
   18| 000074 33F6                        XOR    ESI, ESI 
   18| 000076 4E                          DEC    ESI    
   18|                 L14:                             
   18| 000077 CE                          INTO          
   18| 000078 46                          INC    ESI    
   18| 000079 CE                          INTO          
   18| 00007A D1E6                        SHL    ESI, 1 
   18| 00007C CE                          INTO          
   18| 00007D D1E6                        SHL    ESI, 1 
   18| 00007F CE                          INTO          
   18| 000080 56                          PUSH   ESI    
   18| 000081 E8                          CALL   rts_ss_allocate 
   18| 000082 00000000                                  
   18| 000086 8945                        MOV    [EBP-36], EAX ;  A
   18| 000088 DC                                        
   18| 000089 8B3D                        MOV    EDI, package1.vec__constrained_array____1 
   18| 00008B 00000000                                  
   18| 00008F 83EF                        SUB    EDI, 1 
   18| 000091 01                                        
   18| 000092 7D                          JGE    SHORT L15 
   18| 000093 03                                        
   18| 000094 33FF                        XOR    EDI, EDI 
   18| 000096 4F                          DEC    EDI    
   18|                 L15:                             
   18| 000097 CE                          INTO          
   18| 000098 47                          INC    EDI    
   18| 000099 CE                          INTO          
   18| 00009A D1E7                        SHL    EDI, 1 
   18| 00009C CE                          INTO          
   18| 00009D D1E7                        SHL    EDI, 1 
   18| 00009F CE                          INTO          
   18| 0000A0 57                          PUSH   EDI    
   18| 0000A1 E8                          CALL   rts_ss_allocate 
   18| 0000A2 00000000                                  
   18| 0000A6 8945                        MOV    [EBP-32], EAX ;  B
   18| 0000A8 E0                                        
   18| 0000A9 8B15                        MOV    EDX, package1.vec__constrained_array____1 
   18| 0000AB 00000000                                  
   18| 0000AF 83EA                        SUB    EDX, 1 
   18| 0000B1 01                                        
   18| 0000B2 7D                          JGE    SHORT L16 
   18| 0000B3 03                                        
   18| 0000B4 33D2                        XOR    EDX, EDX 
   18| 0000B6 4A                          DEC    EDX    
   18|                 L16:                             
   18| 0000B7 CE                          INTO          
   18| 0000B8 42                          INC    EDX    
   18| 0000B9 CE                          INTO          
   18| 0000BA D1E2                        SHL    EDX, 1 
   18| 0000BC CE                          INTO          
   18| 0000BD D1E2                        SHL    EDX, 1 
   18| 0000BF CE                          INTO          
   18| 0000C0 52                          PUSH   EDX    
   18| 0000C1 E8                          CALL   rts_ss_allocate 
   18| 0000C2 00000000                                  
   18| 0000C6 8945                        MOV    [EBP-28], EAX ;  C
   18| 0000C8 E4                                        
;  Source Line # 22
   22| 0000C9 C745                        MOV    DWORD PTR [EBP-20], 0 ;  S1
   22| 0000CB EC                                        
   22| 0000CC 00000000                                  
   22| 0000D0 C745                        MOV    DWORD PTR [EBP-16], 0 ;  S2
   22| 0000D2 F0                                        
   22| 0000D3 00000000                                  
   22| 0000D7 C745                        MOV    DWORD PTR [EBP-12], 0 ;  S3
   22| 0000D9 F4                                        
   22| 0000DA 00000000                                  
   22| 0000DE C745                        MOV    DWORD PTR [EBP-8], 0 ;  var1
   22| 0000E0 F8                                        
   22| 0000E1 00000000                                  
;  Source Line # 134
  134| 0000E5 8D5D                        LEA    EBX, [EBP-8] ;  var1
  134| 0000E7 F8                                        
  134| 0000E8 53                          PUSH   EBX    
  134| 0000E9 E8                          CALL   ada.synchronous_task_control.set_true 
  134| 0000EA 00000000                                  
;  Source Line # 135
  135| 0000EE E8                          CALL   lab1.task_start 
  135| 0000EF 00000000                                  
  135| 0000F3 8D4D                        LEA    ECX, [EBP-48] ;  dyn_temp
  135| 0000F5 D0                                        
  135| 0000F6 51                          PUSH   ECX    
  135| 0000F7 E8                          CALL   rts_ss_release 
  135| 0000F8 00000000                                  
;  Source Line # 136
  136| 0000FC 8B55                        MOV    EDX, [EBP-60] ; Spill
  136| 0000FE C4                                        
  136| 0000FF 8B4D                        MOV    ECX, [EBP-4] 
  136| 000101 FC                                        
  136| 000102 894A                        MOV    [EDX+48], ECX 
  136| 000104 30                                        
  136| 000105 8BE5                        MOV    ESP, EBP 
  136| 000107 5D                          POP    EBP    
  136| 000108 C3                          RET           
                       ;                                
                       lab1               ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000135     DD     00000801 
                                          DD     0000000E 
                                          DD     lab1   
                                          DD     __lcl.00000139 
                                          DD     00000011 
                                          DD     lab1+0000001DH 
                                          DD     __lcl.00000139 
                                          DD     00000012 
                                          DD     lab1+00000069H 
                                          DD     __lcl.00000139 
                                          DD     00000016 
                                          DD     lab1+000000C9H 
                                          DD     __lcl.00000139 
                                          DD     00000086 
                                          DD     lab1+000000E5H 
                                          DD     __lcl.00000139 
                                          DD     00000087 
                                          DD     lab1+000000EEH 
                                          DD     __lcl.00000139 
                                          DD     00000088 
                                          DD     lab1+000000FCH 
                                          DD     __lcl.00000139 
                                          DD     00000088 
                                          DD     lab1+00000105H 
                                          DD     __lcl.00000139 
; ********* End of segment, Total Size = 100


; ************* Initialized part of the global segment :
                                          ALIGN 4       
     000000            __lcl.00000117     DB     'Lab1.Task_start.T2' 
                                          DB     00H    
     000013            __lcl.00000116     DB     'Lab1.Task_start.T1' 
                                          DB     00H    
                                          DW     0000   
     000028            __lcl.00000110     DD     00000001 
                                          DD     00000007 
     000030            __lcl.00000109     DB     'T2 stop' 
                                          DB     00     
     000038            __lcl.00000080     DD     00000001 
                                          DD     00000008 
     000040            __lcl.00000079     DB     'T2 start' 
     000048            __lcl.00000069     DD     00000001 
                                          DD     00000007 
     000050            __lcl.00000068     DB     'T1 stop' 
                                          DB     00     
     000058            __lcl.00000033     DD     00000001 
                                          DD     00000008 
     000060            __lcl.00000032     DB     'T1 start' 
; ********* End of segment, Total Size = 104


; ************* .av_dbgr segment :
                                          ALIGN 4       
                                          DD     00000000 
                                          DD     00000000 
     000008            lab1__rootpart____1 DD    lab1__subp_body_subpdesc____1 
; ********* End of segment, Total Size = 16


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000134     DB     04H    
                                          DB     'Lab1' 
                                          DB     00H,00H,00H 
     000008            lab1__subp_body_subpdesc____1 DD __lcl.00000134 
                                          DD     00000001 
                                          DD     __lcl.00000046 
                                          DD     0000000E 
                                          DD     00000085 
                                          DD     00000088 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000122 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000123 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000135 
                                          DD     0000003C 
                                          DD     __lcl.00000001 
     00006C            __lcl.00000133     DB     02H    
                                          DB     'MX'   
                                          DB     00     
     000070            __lcl.00000132     DB     02H    
                                          DB     'MY'   
                                          DB     00     
     000074            __lcl.00000131     DB     01H    
                                          DB     'A'    
                                          DW     0000   
     000078            __lcl.00000130     DB     01H    
                                          DB     'B'    
                                          DW     0000   
     00007C            __lcl.00000129     DB     01H    
                                          DB     'C'    
                                          DW     0000   
     000080            __lcl.00000128     DB     04H    
                                          DB     'Alfa' 
                                          DB     00H,00H,00H 
     000088            __lcl.00000127     DB     02H    
                                          DB     'S1'   
                                          DB     00     
     00008C            __lcl.00000126     DB     02H    
                                          DB     'S2'   
                                          DB     00     
     000090            __lcl.00000125     DB     02H    
                                          DB     'S3'   
                                          DB     00     
     000094            __lcl.00000124     DB     04H    
                                          DB     'var1' 
                                          DB     00H,00H,00H 
     00009C            __lcl.00000123     DD     0000000A 
                                          DD     __lcl.00000124 
                                          DD     __lcl.00000029 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000125 
                                          DD     __lcl.00000029 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000126 
                                          DD     __lcl.00000029 
                                          DD     FFFFFFF0 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000029 
                                          DD     FFFFFFEC 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000128 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFE8 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000129 
                                          DD     __lcl.00000016 
                                          DD     FFFFFFE4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000016 
                                          DD     FFFFFFE0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000131 
                                          DD     __lcl.00000016 
                                          DD     FFFFFFDC 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000132 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFD8 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000133 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFD4 
                                          DD     00000103 
                                          DD     00000000 
     000168            __lcl.00000122     DD     00000001 
                                          DD     lab1.task_start__subp_body_subpdesc____1 
     000170            __lcl.00000121     DB     0AH    
                                          DB     'Task_start' 
                                          DB     00     
     00017C            lab1.task_start__subp_body_subpdesc____1 DD __lcl.00000121 
                                          DD     00000002 
                                          DD     __lcl.00000046 
                                          DD     00000018 
                                          DD     00000081 
                                          DD     00000083 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000118 
                                          DD     __lcl.00000119 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000120 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000136 
                                          DD     000000A4 
                                          DD     __lcl.00000001 
     0001E0            __lcl.00000120     DD     00000002 
                                          DD     __lcl.00000078 
                                          DD     __lcl.00000077 
                                          DD     FFFFFFEC 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000030 
                                          DD     FFFFFFDC 
                                          DD     00000003 
                                          DD     00000000 
     00020C            __lcl.00000119     DD     00000002 
                                          DD     lab1.task_start.t1__task_subpdesc____1 
                                          DD     lab1.task_start.t2__task_subpdesc____1 
     000218            __lcl.00000118     DD     00000002 
                                          DD     __lcl.00000078 
                                          DD     __lcl.00000077 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000030 
     00022C            lab1.task_start.t2__task_subpdesc____1 DD __lcl.00000078 
                                          DD     00000004 
                                          DD     __lcl.00000046 
                                          DD     0000004C 
                                          DD     00000051 
                                          DD     0000007F 
                                          DD     00000002 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000111 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000115 
                                          DD     __lcl.00000077 
                                          DD     00000000 
                                          DD     __lcl.00000137 
                                          DD     00000050 
                                          DD     __lcl.00000001 
     000290            __lcl.00000115     DD     00000002 
                                          DD     __lcl.00000097 
                                          DD     __lcl.00000108 
     00029C            __lcl.00000114     DB     05H    
                                          DB     'Alfa2' 
                                          DW     0000   
     0002A4            __lcl.00000113     DB     03H    
                                          DB     'MX2'  
     0002A8            __lcl.00000112     DB     02H    
                                          DB     'C2'   
                                          DB     00     
     0002AC            __lcl.00000111     DD     00000005 
                                          DD     __lcl.00000112 
                                          DD     __lcl.00000016 
                                          DD     FFFFFFCC 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000072 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFC8 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000113 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFC4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000114 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFBC 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000075 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFB8 
                                          DD     00000003 
                                          DD     00000000 
     000314            __lcl.00000108     DB     8 DUP(00) 
                                          DD     __lcl.00000046 
                                          DD     0000006F 
                                          DD     0000006F 
                                          DD     00000075 
                                          DD     00000003 
                                          DD     00000004 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000106 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000107 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000378            __lcl.00000107     DD     00000001 
                                          DD     __lcl.00000105 
     000380            __lcl.00000106     DD     00000001 
                                          DD     __lcl.00000065 
                                          DD     __lcl.00000100 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     000398            __lcl.00000105     DB     8 DUP(00) 
                                          DD     __lcl.00000046 
                                          DD     00000071 
                                          DD     00000071 
                                          DD     00000073 
                                          DD     00000003 
                                          DD     00000005 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000104 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0003FC            __lcl.00000104     DD     00000001 
                                          DD     __lcl.00000062 
                                          DD     __lcl.00000103 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000414            __lcl.00000103     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000101 
                                          DD     __lcl.00000102 
     000430            __lcl.00000102     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     00043C            __lcl.00000101     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000448            __lcl.00000100     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000098 
                                          DD     __lcl.00000099 
     000464            __lcl.00000099     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     000470            __lcl.00000098     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     00047C            __lcl.00000097     DB     8 DUP(00) 
                                          DD     __lcl.00000046 
                                          DD     00000064 
                                          DD     00000064 
                                          DD     0000006D 
                                          DD     00000003 
                                          DD     00000004 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000095 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000096 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0004E0            __lcl.00000096     DD     00000001 
                                          DD     __lcl.00000094 
     0004E8            __lcl.00000095     DD     00000001 
                                          DD     __lcl.00000052 
                                          DD     __lcl.00000083 
                                          DD     FFFFFFD4 
                                          DD     00000003 
                                          DD     00000001 
     000500            __lcl.00000094     DB     8 DUP(00) 
                                          DD     __lcl.00000046 
                                          DD     00000065 
                                          DD     00000065 
                                          DD     0000006C 
                                          DD     00000003 
                                          DD     00000005 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000092 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000093 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000564            __lcl.00000093     DD     00000001 
                                          DD     __lcl.00000091 
     00056C            __lcl.00000092     DD     00000001 
                                          DD     __lcl.00000048 
                                          DD     __lcl.00000086 
                                          DD     FFFFFFE0 
                                          DD     00000003 
                                          DD     00000001 
     000584            __lcl.00000091     DB     8 DUP(00) 
                                          DD     __lcl.00000046 
                                          DD     00000067 
                                          DD     00000067 
                                          DD     00000069 
                                          DD     00000003 
                                          DD     00000006 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000090 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0005E8            __lcl.00000090     DD     00000001 
                                          DD     __lcl.00000044 
                                          DD     __lcl.00000089 
                                          DD     FFFFFFE8 
                                          DD     00000003 
                                          DD     00000001 
     000600            __lcl.00000089     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000087 
                                          DD     __lcl.00000088 
     00061C            __lcl.00000088     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE4 
     000628            __lcl.00000087     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000634            __lcl.00000086     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000084 
                                          DD     __lcl.00000085 
     000650            __lcl.00000085     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFDC 
     00065C            __lcl.00000084     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD8 
     000668            __lcl.00000083     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000081 
                                          DD     __lcl.00000082 
     000684            __lcl.00000082     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD0 
     000690            __lcl.00000081     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00069C            __lcl.00000078     DB     02H    
                                          DB     'T2'   
                                          DB     00     
     0006A0            __lcl.00000077     DD     __lcl.00000078 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     0006B0            lab1.task_start.t1__task_subpdesc____1 DD __lcl.00000031 
                                          DD     00000003 
                                          DD     __lcl.00000046 
                                          DD     0000001A 
                                          DD     0000001F 
                                          DD     00000049 
                                          DD     00000002 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000070 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000076 
                                          DD     __lcl.00000030 
                                          DD     00000000 
                                          DD     __lcl.00000138 
                                          DD     00000048 
                                          DD     __lcl.00000001 
     000714            __lcl.00000076     DD     00000002 
                                          DD     __lcl.00000054 
                                          DD     __lcl.00000067 
     000720            __lcl.00000075     DB     03H    
                                          DB     'Sum'  
     000724            __lcl.00000074     DB     05H    
                                          DB     'Alfa1' 
                                          DW     0000   
     00072C            __lcl.00000073     DB     03H    
                                          DB     'MX1'  
     000730            __lcl.00000072     DB     04H    
                                          DB     'MBUF' 
                                          DB     00H,00H,00H 
     000738            __lcl.00000071     DB     02H    
                                          DB     'C1'   
                                          DB     00     
     00073C            __lcl.00000070     DD     00000005 
                                          DD     __lcl.00000071 
                                          DD     __lcl.00000016 
                                          DD     FFFFFFD4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000072 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFD0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000073 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFCC 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000074 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFC4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000075 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFC0 
                                          DD     00000003 
                                          DD     00000000 
     0007A4            __lcl.00000067     DB     8 DUP(00) 
                                          DD     __lcl.00000046 
                                          DD     0000003E 
                                          DD     0000003E 
                                          DD     00000044 
                                          DD     00000003 
                                          DD     00000004 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000064 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000066 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000808            __lcl.00000066     DD     00000001 
                                          DD     __lcl.00000063 
     000810            __lcl.00000065     DB     01H    
                                          DB     'J'    
                                          DW     0000   
     000814            __lcl.00000064     DD     00000001 
                                          DD     __lcl.00000065 
                                          DD     __lcl.00000057 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     00082C            __lcl.00000063     DB     8 DUP(00) 
                                          DD     __lcl.00000046 
                                          DD     00000040 
                                          DD     00000040 
                                          DD     00000042 
                                          DD     00000003 
                                          DD     00000005 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000061 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000890            __lcl.00000062     DB     01H    
                                          DB     'I'    
                                          DW     0000   
     000894            __lcl.00000061     DD     00000001 
                                          DD     __lcl.00000062 
                                          DD     __lcl.00000060 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0008AC            __lcl.00000060     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000058 
                                          DD     __lcl.00000059 
     0008C8            __lcl.00000059     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     0008D4            __lcl.00000058     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0008E0            __lcl.00000057     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000055 
                                          DD     __lcl.00000056 
     0008FC            __lcl.00000056     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     000908            __lcl.00000055     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000914            __lcl.00000054     DB     8 DUP(00) 
                                          DD     __lcl.00000046 
                                          DD     00000033 
                                          DD     00000033 
                                          DD     0000003C 
                                          DD     00000003 
                                          DD     00000004 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000051 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000053 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000978            __lcl.00000053     DD     00000001 
                                          DD     __lcl.00000050 
     000980            __lcl.00000052     DB     01H    
                                          DB     'i'    
                                          DW     0000   
     000984            __lcl.00000051     DD     00000001 
                                          DD     __lcl.00000052 
                                          DD     __lcl.00000036 
                                          DD     FFFFFFDC 
                                          DD     00000003 
                                          DD     00000001 
     00099C            __lcl.00000050     DB     8 DUP(00) 
                                          DD     __lcl.00000046 
                                          DD     00000034 
                                          DD     00000034 
                                          DD     0000003B 
                                          DD     00000003 
                                          DD     00000005 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000047 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000049 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000A00            __lcl.00000049     DD     00000001 
                                          DD     __lcl.00000045 
     000A08            __lcl.00000048     DB     01H    
                                          DB     'j'    
                                          DW     0000   
     000A0C            __lcl.00000047     DD     00000001 
                                          DD     __lcl.00000048 
                                          DD     __lcl.00000039 
                                          DD     FFFFFFE4 
                                          DD     00000003 
                                          DD     00000001 
     000A24            __lcl.00000046     DB     0BH    
                                          DB     '..\lab1.adb' 
     000A30            __lcl.00000045     DB     8 DUP(00) 
                                          DD     __lcl.00000046 
                                          DD     00000036 
                                          DD     00000036 
                                          DD     00000038 
                                          DD     00000003 
                                          DD     00000006 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000043 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000A94            __lcl.00000044     DB     01H    
                                          DB     'z'    
                                          DW     0000   
     000A98            __lcl.00000043     DD     00000001 
                                          DD     __lcl.00000044 
                                          DD     __lcl.00000042 
                                          DD     FFFFFFEC 
                                          DD     00000003 
                                          DD     00000001 
     000AB0            __lcl.00000042     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000040 
                                          DD     __lcl.00000041 
     000ACC            __lcl.00000041     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE8 
     000AD8            __lcl.00000040     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000AE4            __lcl.00000039     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000037 
                                          DD     __lcl.00000038 
     000B00            __lcl.00000038     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE0 
     000B0C            __lcl.00000037     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000B18            __lcl.00000036     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000034 
                                          DD     __lcl.00000035 
     000B34            __lcl.00000035     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD8 
     000B40            __lcl.00000034     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000B4C            __lcl.00000031     DB     02H    
                                          DB     'T1'   
                                          DB     00     
     000B50            __lcl.00000030     DD     __lcl.00000031 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     000B60            __lcl.00000029     DD     __lcl.00000027 
                                          DD     00000006 
                                          DD     0000010E 
                                          DD     00000004 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000026 
     000B78            __lcl.00000028     DD     00000001 
                                          DD     __lcl.00000025 
                                          DD     __lcl.00000023 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
     000B98            __lcl.00000027     DB     11H    
                                          DB     'Suspension_Object' 
                                          DW     0000   
     000BAC            __lcl.00000026     DD     __lcl.00000027 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000004 
                                          DD     __lcl.00000024 
                                          DD     00000000 
     000BC4            __lcl.00000025     DB     05H    
                                          DB     'State' 
                                          DW     0000   
     000BCC            __lcl.00000024     DD     00000001 
                                          DD     __lcl.00000025 
                                          DD     __lcl.00000023 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
     000BEC            __lcl.00000023     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000009 
                                          DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000021 
                                          DD     __lcl.00000022 
     000C08            __lcl.00000022     DD     00000009 
                                          DD     00000003 
                                          DD     FFFFFFFF 
     000C14            __lcl.00000021     DD     00000009 
                                          DD     00000003 
                                          DD     00000000 
     000C20            __lcl.00000020     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000009 
     000C2C            __lcl.00000019     DB     04H    
                                          DB     'Matr' 
                                          DB     00H,00H,00H 
     000C34            __lcl.00000018     DD     __lcl.00000019 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000010 
                                          DD     __lcl.00000016 
                                          DD     __lcl.00000009 
     000C4C            __lcl.00000017     DB     03H    
                                          DB     'Vec'  
     000C50            __lcl.00000016     DD     __lcl.00000017 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000015 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000014 
     000C68            __lcl.00000015     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     000C74            __lcl.00000014     DD     00000001 
                                          DD     __lcl.00000013 
     000C7C            __lcl.00000013     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000011 
                                          DD     __lcl.00000012 
     000C98            __lcl.00000012     DD     00000008 
                                          DD     00000007 
                                          DD     package1.vec__constrained_array____1 
     000CA4            __lcl.00000011     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000CB0            __lcl.00000010     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__COMP_SU_SIZE 
     000CBC            __lcl.00000009     DD     00000001 
                                          DD     __lcl.00000008 
     000CC4            __lcl.00000008     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000007 
     000CE0            __lcl.00000007     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__constrained_array____1 
     000CEC            __lcl.00000006     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000CF8            __lcl.00000005     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000003 
                                          DD     __lcl.00000004 
     000D14            __lcl.00000004     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     000D20            __lcl.00000003     DD     00000008 
                                          DD     00000003 
                                          DD     80000000 
     000D2C            __lcl.00000002     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     000D38            __lcl.00000001     DD     00000000 
; ********* End of segment, Total Size = 3388


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000D3C            __lcl.00000139     DB     1B     
                                          DB     'D:\LABPRO2-1(ALLH)\lab1.adb' 
; ********* End of segment, Total Size = 3416

                       ;                                
                       CODE               ENDS          

