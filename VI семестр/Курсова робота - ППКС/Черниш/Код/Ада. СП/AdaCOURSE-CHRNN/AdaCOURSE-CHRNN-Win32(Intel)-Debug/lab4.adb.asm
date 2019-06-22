
                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT Lab4 
;  Record Layout Information:
;     -- lab4.mon
;     for MON use record
;         F1 at 76 range 0 .. 31;
;         F2 at 80 range 0 .. 31;
;         SortT2 at 84 range 0 .. 31;
;         SortT3 at 88 range 0 .. 31;
;         SortT4 at 92 range 0 .. 31;
; --      MO at 104 range 0..<dynamic-sized>; cannot specify place
; --      D at <dynamic-offset>; cannot specify place
;         alfa at 100 range 0 .. 31;
;     end record;
; 
;     -- lab4.start.t1
;     for T1 use record
;     end record;
; 
;     -- lab4.start.t2
;     for T2 use record
;     end record;
; 
;     -- lab4.start.t3
;     for T3 use record
;     end record;
; 
;     -- lab4.start.t4
;     for T4 use record
;     end record;
                       ;                                
                       Listing of Generated Code        
                       ;                                
                       EXCEP              RECORD FLAG:1, SPSAV:1, IPCOUNT:6 
                       ;                                
                       CODE               SEGMENT PUBLIC BYTE 'CODE' USE32 ;  Lab4
                                          ASSUME CS:CODE 
                       ;                                
                       ;  Start of procedure lab4.mon.datasignal   
                       ;                                
                                          PUBLIC lab4.mon.datasignal 
                       lab4.mon.datasignal PROC  NEAR   
;  Source Line # 67
   67| 000000 64                          FS:           
   67| 000001 8B15                        MOV    EDX, 4 
   67| 000003 04000000                                  
   67| 000007 8B52                        MOV    EDX, [EDX-4] 
   67| 000009 FC                                        
   67| 00000A 55                          PUSH   EBP    
   67| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 67
   67| 00000D 8B42                        MOV    EAX, [EDX+48] 
   67| 00000F 30                                        
   67| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
   67| 000012 F8                                        
   67| 000013 00                                        
   67| 000014 75                          JNE    SHORT L39 
   67| 000015 0A                                        
   67| 000016 68                          PUSH   program_error 
   67| 000017 00000000                                  
   67| 00001B E8                          CALL   rts_raise 
   67| 00001C 00000000                                  
   67|                 L39:                             
;  Source Line # 69
   69| 000020 8B45                        MOV    EAX, [EBP+8] ;  po_access
   69| 000022 08                                        
   69| 000023 8B58                        MOV    EBX, [EAX+76] 
   69| 000025 4C                                        
   69| 000026 43                          INC    EBX    
   69| 000027 CE                          INTO          
   69| 000028 8B4D                        MOV    ECX, [EBP+8] ;  po_access
   69| 00002A 08                                        
   69| 00002B 8959                        MOV    [ECX+76], EBX 
   69| 00002D 4C                                        
;  Source Line # 70
   70| 00002E 8BE5                        MOV    ESP, EBP 
   70| 000030 5D                          POP    EBP    
   70| 000031 C2                          RET    8      
   70| 000032 0800                                      
                       ;                                
                       lab4.mon.datasignal ENDP         


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000466     DD     00000501 
                                          DD     00000043 
                                          DD     lab4.mon.datasignal 
                                          DD     __lcl.00000467 
                                          DD     00000043 
                                          DD     lab4.mon.datasignal+0000000DH 
                                          DD     __lcl.00000467 
                                          DD     00000045 
                                          DD     lab4.mon.datasignal+00000020H 
                                          DD     __lcl.00000467 
                                          DD     00000046 
                                          DD     lab4.mon.datasignal+0000002EH 
                                          DD     __lcl.00000467 
                                          DD     00000046 
                                          DD     lab4.mon.datasignal+00000030H 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure lab4.mon.aht2   
                       ;                                
                                          PUBLIC lab4.mon.aht2 
                       lab4.mon.aht2      PROC   NEAR   
;  Source Line # 72
   72| 000000 64                          FS:           
   72| 000001 8B15                        MOV    EDX, 4 
   72| 000003 04000000                                  
   72| 000007 8B52                        MOV    EDX, [EDX-4] 
   72| 000009 FC                                        
   72| 00000A 55                          PUSH   EBP    
   72| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 72
   72| 00000D 8B42                        MOV    EAX, [EDX+48] 
   72| 00000F 30                                        
   72| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
   72| 000012 F8                                        
   72| 000013 00                                        
   72| 000014 75                          JNE    SHORT L39 
   72| 000015 0A                                        
   72| 000016 68                          PUSH   program_error 
   72| 000017 00000000                                  
   72| 00001B E8                          CALL   rts_raise 
   72| 00001C 00000000                                  
   72|                 L39:                             
;  Source Line # 74
   74| 000020 8B45                        MOV    EAX, [EBP+8] ;  po_access
   74| 000022 08                                        
   74| 000023 C740                        MOV    DWORD PTR [EAX+84], 1 
   74| 000025 54                                        
   74| 000026 01000000                                  
;  Source Line # 75
   75| 00002A 8BE5                        MOV    ESP, EBP 
   75| 00002C 5D                          POP    EBP    
   75| 00002D C2                          RET    8      
   75| 00002E 0800                                      
                       ;                                
                       lab4.mon.aht2      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000465     DD     00000501 
                                          DD     00000048 
                                          DD     lab4.mon.aht2 
                                          DD     __lcl.00000467 
                                          DD     00000048 
                                          DD     lab4.mon.aht2+0000000DH 
                                          DD     __lcl.00000467 
                                          DD     0000004A 
                                          DD     lab4.mon.aht2+00000020H 
                                          DD     __lcl.00000467 
                                          DD     0000004B 
                                          DD     lab4.mon.aht2+0000002AH 
                                          DD     __lcl.00000467 
                                          DD     0000004B 
                                          DD     lab4.mon.aht2+0000002CH 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure lab4.mon.a2ht4   
                       ;                                
                                          PUBLIC lab4.mon.a2ht4 
                       lab4.mon.a2ht4     PROC   NEAR   
;  Source Line # 76
   76| 000000 64                          FS:           
   76| 000001 8B15                        MOV    EDX, 4 
   76| 000003 04000000                                  
   76| 000007 8B52                        MOV    EDX, [EDX-4] 
   76| 000009 FC                                        
   76| 00000A 55                          PUSH   EBP    
   76| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 76
   76| 00000D 8B42                        MOV    EAX, [EDX+48] 
   76| 00000F 30                                        
   76| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
   76| 000012 F8                                        
   76| 000013 00                                        
   76| 000014 75                          JNE    SHORT L39 
   76| 000015 0A                                        
   76| 000016 68                          PUSH   program_error 
   76| 000017 00000000                                  
   76| 00001B E8                          CALL   rts_raise 
   76| 00001C 00000000                                  
   76|                 L39:                             
;  Source Line # 78
   78| 000020 8B45                        MOV    EAX, [EBP+8] ;  po_access
   78| 000022 08                                        
   78| 000023 C740                        MOV    DWORD PTR [EAX+92], 1 
   78| 000025 5C                                        
   78| 000026 01000000                                  
;  Source Line # 79
   79| 00002A 8BE5                        MOV    ESP, EBP 
   79| 00002C 5D                          POP    EBP    
   79| 00002D C2                          RET    8      
   79| 00002E 0800                                      
                       ;                                
                       lab4.mon.a2ht4     ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000464     DD     00000501 
                                          DD     0000004C 
                                          DD     lab4.mon.a2ht4 
                                          DD     __lcl.00000467 
                                          DD     0000004C 
                                          DD     lab4.mon.a2ht4+0000000DH 
                                          DD     __lcl.00000467 
                                          DD     0000004E 
                                          DD     lab4.mon.a2ht4+00000020H 
                                          DD     __lcl.00000467 
                                          DD     0000004F 
                                          DD     lab4.mon.a2ht4+0000002AH 
                                          DD     __lcl.00000467 
                                          DD     0000004F 
                                          DD     lab4.mon.a2ht4+0000002CH 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure lab4.mon.aht3   
                       ;                                
                                          PUBLIC lab4.mon.aht3 
                       lab4.mon.aht3      PROC   NEAR   
;  Source Line # 80
   80| 000000 64                          FS:           
   80| 000001 8B15                        MOV    EDX, 4 
   80| 000003 04000000                                  
   80| 000007 8B52                        MOV    EDX, [EDX-4] 
   80| 000009 FC                                        
   80| 00000A 55                          PUSH   EBP    
   80| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 80
   80| 00000D 8B42                        MOV    EAX, [EDX+48] 
   80| 00000F 30                                        
   80| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
   80| 000012 F8                                        
   80| 000013 00                                        
   80| 000014 75                          JNE    SHORT L39 
   80| 000015 0A                                        
   80| 000016 68                          PUSH   program_error 
   80| 000017 00000000                                  
   80| 00001B E8                          CALL   rts_raise 
   80| 00001C 00000000                                  
   80|                 L39:                             
;  Source Line # 82
   82| 000020 8B45                        MOV    EAX, [EBP+8] ;  po_access
   82| 000022 08                                        
   82| 000023 C740                        MOV    DWORD PTR [EAX+88], 1 
   82| 000025 58                                        
   82| 000026 01000000                                  
;  Source Line # 83
   83| 00002A 8BE5                        MOV    ESP, EBP 
   83| 00002C 5D                          POP    EBP    
   83| 00002D C2                          RET    8      
   83| 00002E 0800                                      
                       ;                                
                       lab4.mon.aht3      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000463     DD     00000501 
                                          DD     00000050 
                                          DD     lab4.mon.aht3 
                                          DD     __lcl.00000467 
                                          DD     00000050 
                                          DD     lab4.mon.aht3+0000000DH 
                                          DD     __lcl.00000467 
                                          DD     00000052 
                                          DD     lab4.mon.aht3+00000020H 
                                          DD     __lcl.00000467 
                                          DD     00000053 
                                          DD     lab4.mon.aht3+0000002AH 
                                          DD     __lcl.00000467 
                                          DD     00000053 
                                          DD     lab4.mon.aht3+0000002CH 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure lab4.mon.setmo   
                       ;                                
                                          PUBLIC lab4.mon.setmo 
                       lab4.mon.setmo     PROC   NEAR   
;  Source Line # 85
   85| 000000 64                          FS:           
   85| 000001 8B15                        MOV    EDX, 4 
   85| 000003 04000000                                  
   85| 000007 8B52                        MOV    EDX, [EDX-4] 
   85| 000009 FC                                        
   85| 00000A 55                          PUSH   EBP    
   85| 00000B 8BEC                        MOV    EBP, ESP 
   85| 00000D 83EC                        SUB    ESP, 16 
   85| 00000F 10                                        
;  Source Line # 85
   85| 000010 8B42                        MOV    EAX, [EDX+48] 
   85| 000012 30                                        
   85| 000013 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
   85| 000015 F8                                        
   85| 000016 00                                        
   85| 000017 75                          JNE    SHORT L39 
   85| 000018 0A                                        
   85| 000019 68                          PUSH   program_error 
   85| 00001A 00000000                                  
   85| 00001E E8                          CALL   rts_raise 
   85| 00001F 00000000                                  
   85|                 L39:                             
   85| 000023 8B05                        MOV    EAX, package1.n 
   85| 000025 00000000                                  
   85| 000029 8945                        MOV    [EBP-16], EAX 
   85| 00002B F0                                        
;  Source Line # 87
   87| 00002C 837D                        CMP    DWORD PTR [EBP-16], 0 
   87| 00002E F0                                        
   87| 00002F 00                                        
   87| 000030 0F8E                        JLE    L38    
   87| 000032 B2000000                                  
   87| 000036 C745                        MOV    DWORD PTR [EBP-12], 1 
   87| 000038 F4                                        
   87| 000039 01000000                                  
   87|                 L43:                             
   87| 00003D 8B05                        MOV    EAX, package1.n 
   87| 00003F 00000000                                  
   87| 000043 8945                        MOV    [EBP-8], EAX 
   87| 000045 F8                                        
;  Source Line # 88
   88| 000046 837D                        CMP    DWORD PTR [EBP-8], 0 
   88| 000048 F8                                        
   88| 000049 00                                        
   88| 00004A 0F8E                        JLE    L44    
   88| 00004C 84000000                                  
   88| 000050 C745                        MOV    DWORD PTR [EBP-4], 1 
   88| 000052 FC                                        
   88| 000053 01000000                                  
   88|                 L46:                             
;  Source Line # 89
   89| 000057 8B45                        MOV    EAX, [EBP+12] ;  params
   89| 000059 0C                                        
   89| 00005A 8B18                        MOV    EBX, [EAX+0] 
   89| 00005C 8B4D                        MOV    ECX, [EBP-12] 
   89| 00005E F4                                        
   89| 00005F 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
   89| 000061 00000000                                  
   89|                 L51:                             
   89| 000065 0F8F                        JG     L52    
   89| 000067 83000000                                  
   89| 00006B 8D49                        LEA    ECX, [ECX-1] 
   89| 00006D FF                                        
   89| 00006E 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
   89| 000071 00000000                                  
   89| 000075 8B55                        MOV    EDX, [EBP-4] 
   89| 000077 FC                                        
   89| 000078 3B15                        CMP    EDX, package1.vec__constrained_array____1 
   89| 00007A 00000000                                  
   89|                 L53:                             
   89| 00007E 0F8F                        JG     L54    
   89| 000080 76000000                                  
   89| 000084 8D1495                      LEA    EDX, [4*EDX-4] 
   89| 000087 FCFFFFFF                                  
   89| 00008B 03CA                        ADD    ECX, EDX 
   89| 00008D 8B75                        MOV    ESI, [EBP+8] ;  po_access
   89| 00008F 08                                        
   89| 000090 8B7D                        MOV    EDI, [EBP-12] 
   89| 000092 F4                                        
   89| 000093 3B3D                        CMP    EDI, package1.matr__constrained_array____1 
   89| 000095 00000000                                  
   89|                 L55:                             
   89| 000099 7F                          JG     SHORT L56 
   89| 00009A 6B                                        
   89| 00009B 8D7F                        LEA    EDI, [EDI-1] 
   89| 00009D FF                                        
   89| 00009E 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
   89| 0000A1 00000000                                  
   89| 0000A5 8B45                        MOV    EAX, [EBP-4] 
   89| 0000A7 FC                                        
   89| 0000A8 3B05                        CMP    EAX, package1.vec__constrained_array____1 
   89| 0000AA 00000000                                  
   89|                 L57:                             
   89| 0000AE 7F                          JG     SHORT L58 
   89| 0000AF 62                                        
   89| 0000B0 8D0485                      LEA    EAX, [4*EAX-4] 
   89| 0000B3 FCFFFFFF                                  
   89| 0000B7 03F8                        ADD    EDI, EAX 
   89| 0000B9 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
   89| 0000BC 895C3E                      MOV    [ESI+EDI+104], EBX 
   89| 0000BF 68                                        
;  Source Line # 90
   90| 0000C0 8B55                        MOV    EDX, [EBP-8] 
   90| 0000C2 F8                                        
   90| 0000C3 3955                        CMP    [EBP-4], EDX 
   90| 0000C5 FC                                        
   90| 0000C6 74                          JE     SHORT L44 
   90| 0000C7 0C                                        
   90| 0000C8 8B45                        MOV    EAX, [EBP-4] 
   90| 0000CA FC                                        
   90| 0000CB 40                          INC    EAX    
   90| 0000CC 8945                        MOV    [EBP-4], EAX 
   90| 0000CE FC                                        
   90| 0000CF E9                          JMP    L46    
   90| 0000D0 83FFFFFF                                  
   90|                 L44:                             
;  Source Line # 91
   91| 0000D4 8B45                        MOV    EAX, [EBP-16] 
   91| 0000D6 F0                                        
   91| 0000D7 3945                        CMP    [EBP-12], EAX 
   91| 0000D9 F4                                        
   91| 0000DA 74                          JE     SHORT L38 
   91| 0000DB 0C                                        
   91| 0000DC 8B45                        MOV    EAX, [EBP-12] 
   91| 0000DE F4                                        
   91| 0000DF 40                          INC    EAX    
   91| 0000E0 8945                        MOV    [EBP-12], EAX 
   91| 0000E2 F4                                        
   91| 0000E3 E9                          JMP    L43    
   91| 0000E4 55FFFFFF                                  
   91|                 L38:                             
;  Source Line # 92
   92| 0000E8 8BE5                        MOV    ESP, EBP 
   92| 0000EA 5D                          POP    EBP    
   92| 0000EB C2                          RET    8      
   92| 0000EC 0800                                      
   92|                 L52:                             
   92| 0000EE 8D05                        LEA    EAX, L51+5 
   92| 0000F0 6A000000                                  
   92| 0000F4 50                          PUSH   EAX    
   92| 0000F5 E9                          JMP    rts_raise_constraint_error 
   92| 0000F6 00000000                                  
   92|                 L54:                             
   92| 0000FA 8D05                        LEA    EAX, L53+5 
   92| 0000FC 83000000                                  
   92| 000100 50                          PUSH   EAX    
   92| 000101 E9                          JMP    rts_raise_constraint_error 
   92| 000102 00000000                                  
   92|                 L56:                             
   92| 000106 8D05                        LEA    EAX, L55+5 
   92| 000108 9E000000                                  
   92| 00010C 50                          PUSH   EAX    
   92| 00010D E9                          JMP    rts_raise_constraint_error 
   92| 00010E 00000000                                  
   92|                 L58:                             
   92| 000112 8D05                        LEA    EAX, L57+5 
   92| 000114 B3000000                                  
   92| 000118 50                          PUSH   EAX    
   92| 000119 E9                          JMP    rts_raise_constraint_error 
   92| 00011A 00000000                                  
                       ;                                
                       lab4.mon.setmo     ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000462     DD     00000901 
                                          DD     00000055 
                                          DD     lab4.mon.setmo 
                                          DD     __lcl.00000467 
                                          DD     00000055 
                                          DD     lab4.mon.setmo+00000010H 
                                          DD     __lcl.00000467 
                                          DD     00000057 
                                          DD     lab4.mon.setmo+0000002CH 
                                          DD     __lcl.00000467 
                                          DD     00000058 
                                          DD     lab4.mon.setmo+00000046H 
                                          DD     __lcl.00000467 
                                          DD     00000059 
                                          DD     lab4.mon.setmo+00000057H 
                                          DD     __lcl.00000467 
                                          DD     0000005A 
                                          DD     lab4.mon.setmo+000000C0H 
                                          DD     __lcl.00000467 
                                          DD     0000005B 
                                          DD     lab4.mon.setmo+000000D4H 
                                          DD     __lcl.00000467 
                                          DD     0000005C 
                                          DD     lab4.mon.setmo+000000E8H 
                                          DD     __lcl.00000467 
                                          DD     0000005C 
                                          DD     lab4.mon.setmo+0000011AH 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 112

                       ;                                
                       ;  Start of procedure lab4.mon.setalfa   
                       ;                                
                                          PUBLIC lab4.mon.setalfa 
                       lab4.mon.setalfa   PROC   NEAR   
;  Source Line # 93
   93| 000000 64                          FS:           
   93| 000001 8B15                        MOV    EDX, 4 
   93| 000003 04000000                                  
   93| 000007 8B52                        MOV    EDX, [EDX-4] 
   93| 000009 FC                                        
   93| 00000A 55                          PUSH   EBP    
   93| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 93
   93| 00000D 8B42                        MOV    EAX, [EDX+48] 
   93| 00000F 30                                        
   93| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
   93| 000012 F8                                        
   93| 000013 00                                        
   93| 000014 75                          JNE    SHORT L39 
   93| 000015 0A                                        
   93| 000016 68                          PUSH   program_error 
   93| 000017 00000000                                  
   93| 00001B E8                          CALL   rts_raise 
   93| 00001C 00000000                                  
   93|                 L39:                             
;  Source Line # 95
   95| 000020 8B45                        MOV    EAX, [EBP+12] ;  params
   95| 000022 0C                                        
   95| 000023 8B5D                        MOV    EBX, [EBP+8] ;  po_access
   95| 000025 08                                        
   95| 000026 8B08                        MOV    ECX, [EAX+0] 
   95| 000028 894B                        MOV    [EBX+100], ECX 
   95| 00002A 64                                        
;  Source Line # 96
   96| 00002B 8BE5                        MOV    ESP, EBP 
   96| 00002D 5D                          POP    EBP    
   96| 00002E C2                          RET    8      
   96| 00002F 0800                                      
                       ;                                
                       lab4.mon.setalfa   ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000461     DD     00000501 
                                          DD     0000005D 
                                          DD     lab4.mon.setalfa 
                                          DD     __lcl.00000467 
                                          DD     0000005D 
                                          DD     lab4.mon.setalfa+0000000DH 
                                          DD     __lcl.00000467 
                                          DD     0000005F 
                                          DD     lab4.mon.setalfa+00000020H 
                                          DD     __lcl.00000467 
                                          DD     00000060 
                                          DD     lab4.mon.setalfa+0000002BH 
                                          DD     __lcl.00000467 
                                          DD     00000060 
                                          DD     lab4.mon.setalfa+0000002DH 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure lab4.mon.setd   
                       ;                                
                                          PUBLIC lab4.mon.setd 
                       lab4.mon.setd      PROC   NEAR   
;  Source Line # 97
   97| 000000 64                          FS:           
   97| 000001 8B15                        MOV    EDX, 4 
   97| 000003 04000000                                  
   97| 000007 8B52                        MOV    EDX, [EDX-4] 
   97| 000009 FC                                        
   97| 00000A 55                          PUSH   EBP    
   97| 00000B 8BEC                        MOV    EBP, ESP 
   97| 00000D 83EC                        SUB    ESP, 8 
   97| 00000F 08                                        
;  Source Line # 97
   97| 000010 8B42                        MOV    EAX, [EDX+48] 
   97| 000012 30                                        
   97| 000013 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
   97| 000015 F8                                        
   97| 000016 00                                        
   97| 000017 75                          JNE    SHORT L39 
   97| 000018 0A                                        
   97| 000019 68                          PUSH   program_error 
   97| 00001A 00000000                                  
   97| 00001E E8                          CALL   rts_raise 
   97| 00001F 00000000                                  
   97|                 L39:                             
   97| 000023 8B05                        MOV    EAX, package1.n 
   97| 000025 00000000                                  
   97| 000029 8945                        MOV    [EBP-8], EAX 
   97| 00002B F8                                        
;  Source Line # 99
   99| 00002C 837D                        CMP    DWORD PTR [EBP-8], 0 
   99| 00002E F8                                        
   99| 00002F 00                                        
   99| 000030 7E                          JLE    SHORT L38 
   99| 000031 47                                        
   99| 000032 C745                        MOV    DWORD PTR [EBP-4], 1 
   99| 000034 FC                                        
   99| 000035 01000000                                  
   99|                 L43:                             
;  Source Line # 100
  100| 000039 8B45                        MOV    EAX, [EBP+12] ;  params
  100| 00003B 0C                                        
  100| 00003C 8B18                        MOV    EBX, [EAX+0] 
  100| 00003E 8B4D                        MOV    ECX, [EBP-4] 
  100| 000040 FC                                        
  100| 000041 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  100| 000043 00000000                                  
  100|                 L46:                             
  100| 000047 7F                          JG     SHORT L47 
  100| 000048 36                                        
  100| 000049 8B55                        MOV    EDX, [EBP+8] ;  po_access
  100| 00004B 08                                        
  100| 00004C 8B75                        MOV    ESI, [EBP-4] 
  100| 00004E FC                                        
  100| 00004F 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  100| 000051 00000000                                  
  100|                 L48:                             
  100| 000055 7F                          JG     SHORT L49 
  100| 000056 34                                        
  100| 000057 8D34B5                      LEA    ESI, [4*ESI-4] 
  100| 00005A FCFFFFFF                                  
  100| 00005E 0372                        ADD    ESI, [EDX+96] 
  100| 000060 60                                        
  100| 000061 8B7C8B                      MOV    EDI, [EBX+4*ECX-4] 
  100| 000064 FC                                        
  100| 000065 893C32                      MOV    [EDX+ESI+0], EDI 
;  Source Line # 101
  101| 000068 8B45                        MOV    EAX, [EBP-8] 
  101| 00006A F8                                        
  101| 00006B 3945                        CMP    [EBP-4], EAX 
  101| 00006D FC                                        
  101| 00006E 74                          JE     SHORT L38 
  101| 00006F 09                                        
  101| 000070 8B45                        MOV    EAX, [EBP-4] 
  101| 000072 FC                                        
  101| 000073 40                          INC    EAX    
  101| 000074 8945                        MOV    [EBP-4], EAX 
  101| 000076 FC                                        
  101| 000077 EB                          JMP    SHORT L43 
  101| 000078 C0                                        
  101|                 L38:                             
;  Source Line # 102
  102| 000079 8BE5                        MOV    ESP, EBP 
  102| 00007B 5D                          POP    EBP    
  102| 00007C C2                          RET    8      
  102| 00007D 0800                                      
  102|                 L47:                             
  102| 00007F 8D05                        LEA    EAX, L46+5 
  102| 000081 4C000000                                  
  102| 000085 50                          PUSH   EAX    
  102| 000086 E9                          JMP    rts_raise_constraint_error 
  102| 000087 00000000                                  
  102|                 L49:                             
  102| 00008B 8D05                        LEA    EAX, L48+5 
  102| 00008D 5A000000                                  
  102| 000091 50                          PUSH   EAX    
  102| 000092 E9                          JMP    rts_raise_constraint_error 
  102| 000093 00000000                                  
                       ;                                
                       lab4.mon.setd      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000460     DD     00000701 
                                          DD     00000061 
                                          DD     lab4.mon.setd 
                                          DD     __lcl.00000467 
                                          DD     00000061 
                                          DD     lab4.mon.setd+00000010H 
                                          DD     __lcl.00000467 
                                          DD     00000063 
                                          DD     lab4.mon.setd+0000002CH 
                                          DD     __lcl.00000467 
                                          DD     00000064 
                                          DD     lab4.mon.setd+00000039H 
                                          DD     __lcl.00000467 
                                          DD     00000065 
                                          DD     lab4.mon.setd+00000068H 
                                          DD     __lcl.00000467 
                                          DD     00000066 
                                          DD     lab4.mon.setd+00000079H 
                                          DD     __lcl.00000467 
                                          DD     00000066 
                                          DD     lab4.mon.setd+00000093H 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 88

                       ;                                
                       ;  Start of procedure lab4.mon.getmo   
                       ;                                
                                          PUBLIC lab4.mon.getmo 
                       lab4.mon.getmo     PROC   NEAR   
;  Source Line # 103
  103| 000000 64                          FS:           
  103| 000001 8B15                        MOV    EDX, 4 
  103| 000003 04000000                                  
  103| 000007 8B52                        MOV    EDX, [EDX-4] 
  103| 000009 FC                                        
  103| 00000A 55                          PUSH   EBP    
  103| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 103
  103| 00000D 8B42                        MOV    EAX, [EDX+48] 
  103| 00000F 30                                        
  103| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
  103| 000012 F8                                        
  103| 000013 00                                        
  103| 000014 75                          JNE    SHORT L39 
  103| 000015 0A                                        
  103| 000016 68                          PUSH   program_error 
  103| 000017 00000000                                  
  103| 00001B E8                          CALL   rts_raise 
  103| 00001C 00000000                                  
  103|                 L39:                             
;  Source Line # 105
  105| 000020 8B05                        MOV    EAX, package1.matr__constrained_array____1 
  105| 000022 00000000                                  
  105| 000026 2D                          SUB    EAX, 1 
  105| 000027 01000000                                  
  105| 00002B 7D                          JGE    SHORT L41 
  105| 00002C 03                                        
  105| 00002D 33C0                        XOR    EAX, EAX 
  105| 00002F 48                          DEC    EAX    
  105|                 L41:                             
  105| 000030 CE                          INTO          
  105| 000031 40                          INC    EAX    
  105| 000032 CE                          INTO          
  105| 000033 0FAF05                      IMUL   EAX, package1.matr__COMP_SU_SIZE 
  105| 000036 00000000                                  
  105| 00003A CE                          INTO          
  105| 00003B 8B5D                        MOV    EBX, [EBP+8] ;  po_access
  105| 00003D 08                                        
  105| 00003E 8B4D                        MOV    ECX, [EBP+12] ;  params
  105| 000040 0C                                        
  105| 000041 8B11                        MOV    EDX, [ECX+0] 
  105| 000043 50                          PUSH   EAX    
  105| 000044 8D5B                        LEA    EBX, [EBX+104] 
  105| 000046 68                                        
  105| 000047 53                          PUSH   EBX    
  105| 000048 52                          PUSH   EDX    
  105| 000049 E8                          CALL   _rts_block_move 
  105| 00004A 00000000                                  
  105| 00004E 8BE5                        MOV    ESP, EBP 
  105| 000050 5D                          POP    EBP    
  105| 000051 C2                          RET    8      
  105| 000052 0800                                      
                       ;                                
                       lab4.mon.getmo     ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000459     DD     00000401 
                                          DD     00000067 
                                          DD     lab4.mon.getmo 
                                          DD     __lcl.00000467 
                                          DD     00000067 
                                          DD     lab4.mon.getmo+0000000DH 
                                          DD     __lcl.00000467 
                                          DD     00000069 
                                          DD     lab4.mon.getmo+00000020H 
                                          DD     __lcl.00000467 
                                          DD     00000069 
                                          DD     lab4.mon.getmo+00000050H 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.mon.getalfa   
                       ;                                
                                          PUBLIC lab4.mon.getalfa 
                       lab4.mon.getalfa   PROC   NEAR   
;  Source Line # 107
  107| 000000 64                          FS:           
  107| 000001 8B15                        MOV    EDX, 4 
  107| 000003 04000000                                  
  107| 000007 8B52                        MOV    EDX, [EDX-4] 
  107| 000009 FC                                        
  107| 00000A 55                          PUSH   EBP    
  107| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 107
  107| 00000D 8B42                        MOV    EAX, [EDX+48] 
  107| 00000F 30                                        
  107| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
  107| 000012 F8                                        
  107| 000013 00                                        
  107| 000014 75                          JNE    SHORT L39 
  107| 000015 0A                                        
  107| 000016 68                          PUSH   program_error 
  107| 000017 00000000                                  
  107| 00001B E8                          CALL   rts_raise 
  107| 00001C 00000000                                  
  107|                 L39:                             
;  Source Line # 109
  109| 000020 8B45                        MOV    EAX, [EBP+8] ;  po_access
  109| 000022 08                                        
  109| 000023 8B5D                        MOV    EBX, [EBP+12] ;  params
  109| 000025 0C                                        
  109| 000026 8B0B                        MOV    ECX, [EBX+0] 
  109| 000028 8B50                        MOV    EDX, [EAX+100] 
  109| 00002A 64                                        
  109| 00002B 8911                        MOV    [ECX+0], EDX 
  109| 00002D 8BE5                        MOV    ESP, EBP 
  109| 00002F 5D                          POP    EBP    
  109| 000030 C2                          RET    8      
  109| 000031 0800                                      
                       ;                                
                       lab4.mon.getalfa   ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000458     DD     00000401 
                                          DD     0000006B 
                                          DD     lab4.mon.getalfa 
                                          DD     __lcl.00000467 
                                          DD     0000006B 
                                          DD     lab4.mon.getalfa+0000000DH 
                                          DD     __lcl.00000467 
                                          DD     0000006D 
                                          DD     lab4.mon.getalfa+00000020H 
                                          DD     __lcl.00000467 
                                          DD     0000006D 
                                          DD     lab4.mon.getalfa+0000002FH 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.mon.getd   
                       ;                                
                                          PUBLIC lab4.mon.getd 
                       lab4.mon.getd      PROC   NEAR   
;  Source Line # 111
  111| 000000 64                          FS:           
  111| 000001 8B15                        MOV    EDX, 4 
  111| 000003 04000000                                  
  111| 000007 8B52                        MOV    EDX, [EDX-4] 
  111| 000009 FC                                        
  111| 00000A 55                          PUSH   EBP    
  111| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 111
  111| 00000D 8B42                        MOV    EAX, [EDX+48] 
  111| 00000F 30                                        
  111| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
  111| 000012 F8                                        
  111| 000013 00                                        
  111| 000014 75                          JNE    SHORT L39 
  111| 000015 0A                                        
  111| 000016 68                          PUSH   program_error 
  111| 000017 00000000                                  
  111| 00001B E8                          CALL   rts_raise 
  111| 00001C 00000000                                  
  111|                 L39:                             
;  Source Line # 113
  113| 000020 8B05                        MOV    EAX, package1.vec__constrained_array____1 
  113| 000022 00000000                                  
  113| 000026 2D                          SUB    EAX, 1 
  113| 000027 01000000                                  
  113| 00002B 7D                          JGE    SHORT L41 
  113| 00002C 03                                        
  113| 00002D 33C0                        XOR    EAX, EAX 
  113| 00002F 48                          DEC    EAX    
  113|                 L41:                             
  113| 000030 CE                          INTO          
  113| 000031 40                          INC    EAX    
  113| 000032 CE                          INTO          
  113| 000033 D1E0                        SHL    EAX, 1 
  113| 000035 CE                          INTO          
  113| 000036 D1E0                        SHL    EAX, 1 
  113| 000038 CE                          INTO          
  113| 000039 8B5D                        MOV    EBX, [EBP+8] ;  po_access
  113| 00003B 08                                        
  113| 00003C 8B4B                        MOV    ECX, [EBX+96] 
  113| 00003E 60                                        
  113| 00003F 8B55                        MOV    EDX, [EBP+12] ;  params
  113| 000041 0C                                        
  113| 000042 8B32                        MOV    ESI, [EDX+0] 
  113| 000044 50                          PUSH   EAX    
  113| 000045 8D1C0B                      LEA    EBX, [EBX+ECX+0] 
  113| 000048 53                          PUSH   EBX    
  113| 000049 56                          PUSH   ESI    
  113| 00004A E8                          CALL   _rts_block_move 
  113| 00004B 00000000                                  
  113| 00004F 8BE5                        MOV    ESP, EBP 
  113| 000051 5D                          POP    EBP    
  113| 000052 C2                          RET    8      
  113| 000053 0800                                      
                       ;                                
                       lab4.mon.getd      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000457     DD     00000401 
                                          DD     0000006F 
                                          DD     lab4.mon.getd 
                                          DD     __lcl.00000467 
                                          DD     0000006F 
                                          DD     lab4.mon.getd+0000000DH 
                                          DD     __lcl.00000467 
                                          DD     00000071 
                                          DD     lab4.mon.getd+00000020H 
                                          DD     __lcl.00000467 
                                          DD     00000071 
                                          DD     lab4.mon.getd+00000051H 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.mon.inputed   
                       ;                                
                                          PUBLIC lab4.mon.inputed 
                       lab4.mon.inputed   PROC   NEAR   
;  Source Line # 116
  116| 000000 64                          FS:           
  116| 000001 8B15                        MOV    EDX, 4 
  116| 000003 04000000                                  
  116| 000007 8B52                        MOV    EDX, [EDX-4] 
  116| 000009 FC                                        
  116| 00000A 55                          PUSH   EBP    
  116| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 116
  116| 00000D 8B42                        MOV    EAX, [EDX+48] 
  116| 00000F 30                                        
  116| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
  116| 000012 F8                                        
  116| 000013 00                                        
  116| 000014 75                          JNE    SHORT L38 
  116| 000015 0A                                        
  116| 000016 68                          PUSH   program_error 
  116| 000017 00000000                                  
  116| 00001B E8                          CALL   rts_raise 
  116| 00001C 00000000                                  
;  Source Line # 119
  119|                 L38:                             
  119| 000020 8BE5                        MOV    ESP, EBP 
  119| 000022 5D                          POP    EBP    
  119| 000023 C2                          RET    16     
  119| 000024 1000                                      
                       ;                                
                       lab4.mon.inputed   ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000456     DD     00000401 
                                          DD     00000074 
                                          DD     lab4.mon.inputed 
                                          DD     __lcl.00000467 
                                          DD     00000074 
                                          DD     lab4.mon.inputed+0000000DH 
                                          DD     __lcl.00000467 
                                          DD     00000077 
                                          DD     lab4.mon.inputed+00000020H 
                                          DD     __lcl.00000467 
                                          DD     00000077 
                                          DD     lab4.mon.inputed+00000022H 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.mon.sortedt2   
                       ;                                
                                          PUBLIC lab4.mon.sortedt2 
                       lab4.mon.sortedt2  PROC   NEAR   
;  Source Line # 121
  121| 000000 64                          FS:           
  121| 000001 8B15                        MOV    EDX, 4 
  121| 000003 04000000                                  
  121| 000007 8B52                        MOV    EDX, [EDX-4] 
  121| 000009 FC                                        
  121| 00000A 55                          PUSH   EBP    
  121| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 121
  121| 00000D 8B42                        MOV    EAX, [EDX+48] 
  121| 00000F 30                                        
  121| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
  121| 000012 F8                                        
  121| 000013 00                                        
  121| 000014 75                          JNE    SHORT L38 
  121| 000015 0A                                        
  121| 000016 68                          PUSH   program_error 
  121| 000017 00000000                                  
  121| 00001B E8                          CALL   rts_raise 
  121| 00001C 00000000                                  
;  Source Line # 124
  124|                 L38:                             
  124| 000020 8BE5                        MOV    ESP, EBP 
  124| 000022 5D                          POP    EBP    
  124| 000023 C2                          RET    16     
  124| 000024 1000                                      
                       ;                                
                       lab4.mon.sortedt2  ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000455     DD     00000401 
                                          DD     00000079 
                                          DD     lab4.mon.sortedt2 
                                          DD     __lcl.00000467 
                                          DD     00000079 
                                          DD     lab4.mon.sortedt2+0000000DH 
                                          DD     __lcl.00000467 
                                          DD     0000007C 
                                          DD     lab4.mon.sortedt2+00000020H 
                                          DD     __lcl.00000467 
                                          DD     0000007C 
                                          DD     lab4.mon.sortedt2+00000022H 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.mon.sortedt3   
                       ;                                
                                          PUBLIC lab4.mon.sortedt3 
                       lab4.mon.sortedt3  PROC   NEAR   
;  Source Line # 125
  125| 000000 64                          FS:           
  125| 000001 8B15                        MOV    EDX, 4 
  125| 000003 04000000                                  
  125| 000007 8B52                        MOV    EDX, [EDX-4] 
  125| 000009 FC                                        
  125| 00000A 55                          PUSH   EBP    
  125| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 125
  125| 00000D 8B42                        MOV    EAX, [EDX+48] 
  125| 00000F 30                                        
  125| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
  125| 000012 F8                                        
  125| 000013 00                                        
  125| 000014 75                          JNE    SHORT L38 
  125| 000015 0A                                        
  125| 000016 68                          PUSH   program_error 
  125| 000017 00000000                                  
  125| 00001B E8                          CALL   rts_raise 
  125| 00001C 00000000                                  
;  Source Line # 128
  128|                 L38:                             
  128| 000020 8BE5                        MOV    ESP, EBP 
  128| 000022 5D                          POP    EBP    
  128| 000023 C2                          RET    16     
  128| 000024 1000                                      
                       ;                                
                       lab4.mon.sortedt3  ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000454     DD     00000401 
                                          DD     0000007D 
                                          DD     lab4.mon.sortedt3 
                                          DD     __lcl.00000467 
                                          DD     0000007D 
                                          DD     lab4.mon.sortedt3+0000000DH 
                                          DD     __lcl.00000467 
                                          DD     00000080 
                                          DD     lab4.mon.sortedt3+00000020H 
                                          DD     __lcl.00000467 
                                          DD     00000080 
                                          DD     lab4.mon.sortedt3+00000022H 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.mon.sortedt4   
                       ;                                
                                          PUBLIC lab4.mon.sortedt4 
                       lab4.mon.sortedt4  PROC   NEAR   
;  Source Line # 129
  129| 000000 64                          FS:           
  129| 000001 8B15                        MOV    EDX, 4 
  129| 000003 04000000                                  
  129| 000007 8B52                        MOV    EDX, [EDX-4] 
  129| 000009 FC                                        
  129| 00000A 55                          PUSH   EBP    
  129| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 129
  129| 00000D 8B42                        MOV    EAX, [EDX+48] 
  129| 00000F 30                                        
  129| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
  129| 000012 F8                                        
  129| 000013 00                                        
  129| 000014 75                          JNE    SHORT L38 
  129| 000015 0A                                        
  129| 000016 68                          PUSH   program_error 
  129| 000017 00000000                                  
  129| 00001B E8                          CALL   rts_raise 
  129| 00001C 00000000                                  
;  Source Line # 132
  132|                 L38:                             
  132| 000020 8BE5                        MOV    ESP, EBP 
  132| 000022 5D                          POP    EBP    
  132| 000023 C2                          RET    16     
  132| 000024 1000                                      
                       ;                                
                       lab4.mon.sortedt4  ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000453     DD     00000401 
                                          DD     00000081 
                                          DD     lab4.mon.sortedt4 
                                          DD     __lcl.00000467 
                                          DD     00000081 
                                          DD     lab4.mon.sortedt4+0000000DH 
                                          DD     __lcl.00000467 
                                          DD     00000084 
                                          DD     lab4.mon.sortedt4+00000020H 
                                          DD     __lcl.00000467 
                                          DD     00000084 
                                          DD     lab4.mon.sortedt4+00000022H 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.mon__all_barriers   
                       ;                                
                                          PUBLIC lab4.mon__all_barriers 
                       lab4.mon__all_barriers PROC NEAR 
;  Source Line # 132
  132| 000000 55                          PUSH   EBP    
  132| 000001 8BEC                        MOV    EBP, ESP 
  132| 000003 83EC                        SUB    ESP, 4 
  132| 000005 04                                        
  132| 000006 C745                        MOV    DWORD PTR [EBP-4], 0 
  132| 000008 FC                                        
  132| 000009 00000000                                  
  132| 00000D 8B45                        MOV    EAX, [EBP+8] ;  po_access
  132| 00000F 08                                        
  132| 000010 8378                        CMP    DWORD PTR [EAX+76], 3 
  132| 000012 4C                                        
  132| 000013 03                                        
  132| 000014 75                          JNE    SHORT L39 
  132| 000015 0B                                        
  132| 000016 8B45                        MOV    EAX, [EBP-4] 
  132| 000018 FC                                        
  132| 000019 0D                          OR     EAX, 1 
  132| 00001A 01000000                                  
  132| 00001E 8945                        MOV    [EBP-4], EAX 
  132| 000020 FC                                        
  132|                 L39:                             
  132| 000021 8B45                        MOV    EAX, [EBP+8] ;  po_access
  132| 000023 08                                        
  132| 000024 8378                        CMP    DWORD PTR [EAX+84], 1 
  132| 000026 54                                        
  132| 000027 01                                        
  132| 000028 75                          JNE    SHORT L41 
  132| 000029 0B                                        
  132| 00002A 8B45                        MOV    EAX, [EBP-4] 
  132| 00002C FC                                        
  132| 00002D 0D                          OR     EAX, 2 
  132| 00002E 02000000                                  
  132| 000032 8945                        MOV    [EBP-4], EAX 
  132| 000034 FC                                        
  132|                 L41:                             
  132| 000035 8B45                        MOV    EAX, [EBP+8] ;  po_access
  132| 000037 08                                        
  132| 000038 8378                        CMP    DWORD PTR [EAX+88], 1 
  132| 00003A 58                                        
  132| 00003B 01                                        
  132| 00003C 75                          JNE    SHORT L43 
  132| 00003D 0B                                        
  132| 00003E 8B45                        MOV    EAX, [EBP-4] 
  132| 000040 FC                                        
  132| 000041 0D                          OR     EAX, 4 
  132| 000042 04000000                                  
  132| 000046 8945                        MOV    [EBP-4], EAX 
  132| 000048 FC                                        
  132|                 L43:                             
  132| 000049 8B45                        MOV    EAX, [EBP+8] ;  po_access
  132| 00004B 08                                        
  132| 00004C 8378                        CMP    DWORD PTR [EAX+92], 1 
  132| 00004E 5C                                        
  132| 00004F 01                                        
  132| 000050 75                          JNE    SHORT L45 
  132| 000051 0B                                        
  132| 000052 8B45                        MOV    EAX, [EBP-4] 
  132| 000054 FC                                        
  132| 000055 0D                          OR     EAX, 8 
  132| 000056 08000000                                  
  132| 00005A 8945                        MOV    [EBP-4], EAX 
  132| 00005C FC                                        
  132|                 L45:                             
  132| 00005D 8B45                        MOV    EAX, [EBP-4] 
  132| 00005F FC                                        
  132| 000060 8BE5                        MOV    ESP, EBP 
  132| 000062 5D                          POP    EBP    
  132| 000063 C2                          RET    4      
  132| 000064 0400                                      
                       ;                                
                       lab4.mon__all_barriers ENDP      
                       ;                                
                       ;  Start of procedure lab4.start.t1__body   
                       ;                                
                                          PUBLIC lab4.start.t1__body 
                       lab4.start.t1__body PROC  NEAR   
;  Source Line # 145
  145| 000000 64                          FS:           
  145| 000001 8B15                        MOV    EDX, 4 
  145| 000003 04000000                                  
  145| 000007 8B52                        MOV    EDX, [EDX-4] 
  145| 000009 FC                                        
  145| 00000A 55                          PUSH   EBP    
  145| 00000B 8BEC                        MOV    EBP, ESP 
  145| 00000D 81EC                        SUB    ESP, 156 
  145| 00000F 9C000000                                  
;  Source Line # 147
  147| 000013 8B02                        MOV    EAX, [EDX+0] 
  147| 000015 8985                        MOV    [EBP-140], EAX ;  dyn_temp
  147| 000017 74FFFFFF                                  
  147| 00001B 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  147| 00001D 00000000                                  
  147| 000021 83EB                        SUB    EBX, 1 
  147| 000023 01                                        
  147| 000024 7D                          JGE    SHORT L102 
  147| 000025 03                                        
  147| 000026 33DB                        XOR    EBX, EBX 
  147| 000028 4B                          DEC    EBX    
  147|                 L102:                            
  147| 000029 CE                          INTO          
  147| 00002A 43                          INC    EBX    
  147| 00002B CE                          INTO          
  147| 00002C 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  147| 00002F 00000000                                  
  147| 000033 CE                          INTO          
  147| 000034 53                          PUSH   EBX    
  147| 000035 8995                        MOV    [EBP-156], EDX ; Spill
  147| 000037 64FFFFFF                                  
  147| 00003B E8                          CALL   rts_ss_allocate 
  147| 00003C 00000000                                  
  147| 000040 8985                        MOV    [EBP-136], EAX ;  MO1
  147| 000042 78FFFFFF                                  
  147| 000046 8B0D                        MOV    ECX, package1.vec__constrained_array____1 
  147| 000048 00000000                                  
  147| 00004C 83E9                        SUB    ECX, 1 
  147| 00004E 01                                        
  147| 00004F 7D                          JGE    SHORT L103 
  147| 000050 03                                        
  147| 000051 33C9                        XOR    ECX, ECX 
  147| 000053 49                          DEC    ECX    
  147|                 L103:                            
  147| 000054 CE                          INTO          
  147| 000055 41                          INC    ECX    
  147| 000056 CE                          INTO          
  147| 000057 D1E1                        SHL    ECX, 1 
  147| 000059 CE                          INTO          
  147| 00005A D1E1                        SHL    ECX, 1 
  147| 00005C CE                          INTO          
  147| 00005D 51                          PUSH   ECX    
  147| 00005E E8                          CALL   rts_ss_allocate 
  147| 00005F 00000000                                  
  147| 000063 8945                        MOV    [EBP-128], EAX ;  D1
  147| 000065 80                                        
;  Source Line # 148
  148| 000066 8B35                        MOV    ESI, package1.matr__constrained_array____1 
  148| 000068 00000000                                  
  148| 00006C 83EE                        SUB    ESI, 1 
  148| 00006E 01                                        
  148| 00006F 7D                          JGE    SHORT L104 
  148| 000070 03                                        
  148| 000071 33F6                        XOR    ESI, ESI 
  148| 000073 4E                          DEC    ESI    
  148|                 L104:                            
  148| 000074 CE                          INTO          
  148| 000075 46                          INC    ESI    
  148| 000076 CE                          INTO          
  148| 000077 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  148| 00007A 00000000                                  
  148| 00007E CE                          INTO          
  148| 00007F 56                          PUSH   ESI    
  148| 000080 E8                          CALL   rts_ss_allocate 
  148| 000081 00000000                                  
  148| 000085 8945                        MOV    [EBP-124], EAX ;  MTF
  148| 000087 84                                        
;  Source Line # 150
  150| 000088 8B3D                        MOV    EDI, package1.vec__constrained_array____1 
  150| 00008A 00000000                                  
  150| 00008E 83EF                        SUB    EDI, 1 
  150| 000090 01                                        
  150| 000091 7D                          JGE    SHORT L105 
  150| 000092 03                                        
  150| 000093 33FF                        XOR    EDI, EDI 
  150| 000095 4F                          DEC    EDI    
  150|                 L105:                            
  150| 000096 CE                          INTO          
  150| 000097 47                          INC    EDI    
  150| 000098 CE                          INTO          
  150| 000099 D1E7                        SHL    EDI, 1 
  150| 00009B CE                          INTO          
  150| 00009C D1E7                        SHL    EDI, 1 
  150| 00009E CE                          INTO          
  150| 00009F 57                          PUSH   EDI    
  150| 0000A0 E8                          CALL   rts_ss_allocate 
  150| 0000A1 00000000                                  
  150| 0000A5 8945                        MOV    [EBP-112], EAX ;  Tv
  150| 0000A7 90                                        
;  Source Line # 151
  151| 0000A8 E8                          CALL   rts_activation_succeeded 
  151| 0000A9 00000000                                  
;  Source Line # 152
  152| 0000AD 68                          PUSH   __lcl.00000169 
  152| 0000AE 00000000                                  
  152| 0000B2 68                          PUSH   __lcl.00000168 
  152| 0000B3 00000000                                  
  152| 0000B7 E8                          CALL   ada.text_io.put_line__2 
  152| 0000B8 00000000                                  
;  Source Line # 155
  155| 0000BC C785                        MOV    DWORD PTR [EBP-132], 1 ;  alfa1
  155| 0000BE 7CFFFFFF                                  
  155| 0000C2 01000000                                  
;  Source Line # 156
  156| 0000C6 8B95                        MOV    EDX, [EBP-132] ;  alfa1
  156| 0000C8 7CFFFFFF                                  
  156| 0000CC 8955                        MOV    [EBP-108], EDX 
  156| 0000CE 94                                        
  156| 0000CF 68                          PUSH   lab4.mon.setalfa 
  156| 0000D0 00000000                                  
  156| 0000D4 8D5D                        LEA    EBX, [EBP-108] 
  156| 0000D6 94                                        
  156| 0000D7 53                          PUSH   EBX    
  156| 0000D8 8B95                        MOV    EDX, [EBP-156] ; Spill
  156| 0000DA 64FFFFFF                                  
  156| 0000DE 8B4A                        MOV    ECX, [EDX+48] 
  156| 0000E0 30                                        
  156| 0000E1 8B71                        MOV    ESI, [ECX-44] ;  MON
  156| 0000E3 D4                                        
  156| 0000E4 56                          PUSH   ESI    
  156| 0000E5 E8                          CALL   rts_protected_procedure_call 
  156| 0000E6 00000000                                  
;  Source Line # 157
  157| 0000EA 8B95                        MOV    EDX, [EBP-156] ; Spill
  157| 0000EC 64FFFFFF                                  
  157| 0000F0 8B7A                        MOV    EDI, [EDX+48] 
  157| 0000F2 30                                        
  157| 0000F3 8B87                        MOV    EAX, [EDI-132] ;  C
  157| 0000F5 7CFFFFFF                                  
  157| 0000F9 50                          PUSH   EAX    
  157| 0000FA E8                          CALL   package1.vec_input 
  157| 0000FB 00000000                                  
;  Source Line # 159
  159| 0000FF 68                          PUSH   lab4.mon.datasignal 
  159| 000100 00000000                                  
  159| 000104 6A                          PUSH   0      
  159| 000105 00                                        
  159| 000106 8B95                        MOV    EDX, [EBP-156] ; Spill
  159| 000108 64FFFFFF                                  
  159| 00010C 8B5A                        MOV    EBX, [EDX+48] 
  159| 00010E 30                                        
  159| 00010F 8B4B                        MOV    ECX, [EBX-44] ;  MON
  159| 000111 D4                                        
  159| 000112 51                          PUSH   ECX    
  159| 000113 E8                          CALL   rts_protected_procedure_call 
  159| 000114 00000000                                  
;  Source Line # 161
  161| 000118 6A                          PUSH   0      
  161| 000119 00                                        
  161| 00011A 6A                          PUSH   0      
  161| 00011B 00                                        
  161| 00011C 6A                          PUSH   0      
  161| 00011D 00                                        
  161| 00011E 8B95                        MOV    EDX, [EBP-156] ; Spill
  161| 000120 64FFFFFF                                  
  161| 000124 8B72                        MOV    ESI, [EDX+48] 
  161| 000126 30                                        
  161| 000127 8B7E                        MOV    EDI, [ESI-44] ;  MON
  161| 000129 D4                                        
  161| 00012A 57                          PUSH   EDI    
  161| 00012B E8                          CALL   rts_protected_entry_call 
  161| 00012C 00000000                                  
;  Source Line # 163
  163| 000130 8B85                        MOV    EAX, [EBP-136] ;  MO1
  163| 000132 78FFFFFF                                  
  163| 000136 8945                        MOV    [EBP-104], EAX 
  163| 000138 98                                        
  163| 000139 68                          PUSH   lab4.mon.getmo 
  163| 00013A 00000000                                  
  163| 00013E 8D5D                        LEA    EBX, [EBP-104] 
  163| 000140 98                                        
  163| 000141 53                          PUSH   EBX    
  163| 000142 8B95                        MOV    EDX, [EBP-156] ; Spill
  163| 000144 64FFFFFF                                  
  163| 000148 8B4A                        MOV    ECX, [EDX+48] 
  163| 00014A 30                                        
  163| 00014B 8B71                        MOV    ESI, [ECX-44] ;  MON
  163| 00014D D4                                        
  163| 00014E 56                          PUSH   ESI    
  163| 00014F E8                          CALL   rts_entryless_protected_subp_call 
  163| 000150 00000000                                  
;  Source Line # 164
  164| 000154 8B7D                        MOV    EDI, [EBP-128] ;  D1
  164| 000156 80                                        
  164| 000157 897D                        MOV    [EBP-100], EDI 
  164| 000159 9C                                        
  164| 00015A 68                          PUSH   lab4.mon.getd 
  164| 00015B 00000000                                  
  164| 00015F 8D45                        LEA    EAX, [EBP-100] 
  164| 000161 9C                                        
  164| 000162 50                          PUSH   EAX    
  164| 000163 8B95                        MOV    EDX, [EBP-156] ; Spill
  164| 000165 64FFFFFF                                  
  164| 000169 8B5A                        MOV    EBX, [EDX+48] 
  164| 00016B 30                                        
  164| 00016C 8B4B                        MOV    ECX, [EBX-44] ;  MON
  164| 00016E D4                                        
  164| 00016F 51                          PUSH   ECX    
  164| 000170 E8                          CALL   rts_entryless_protected_subp_call 
  164| 000171 00000000                                  
  164| 000175 8B35                        MOV    ESI, package1.n 
  164| 000177 00000000                                  
  164| 00017B 8975                        MOV    [EBP-96], ESI 
  164| 00017D A0                                        
;  Source Line # 166
  166| 00017E 837D                        CMP    DWORD PTR [EBP-96], 0 
  166| 000180 A0                                        
  166| 000181 00                                        
  166| 000182 0F8E                        JLE    L39    
  166| 000184 4A010000                                  
  166| 000188 C745                        MOV    DWORD PTR [EBP-92], 1 
  166| 00018A A4                                        
  166| 00018B 01000000                                  
  166|                 L41:                             
  166| 00018F 8B05                        MOV    EAX, package1.h 
  166| 000191 00000000                                  
  166| 000195 8945                        MOV    [EBP-88], EAX 
  166| 000197 A8                                        
;  Source Line # 167
  167| 000198 837D                        CMP    DWORD PTR [EBP-88], 0 
  167| 00019A A8                                        
  167| 00019B 00                                        
  167| 00019C 0F8E                        JLE    L42    
  167| 00019E 1C010000                                  
  167| 0001A2 C745                        MOV    DWORD PTR [EBP-84], 1 
  167| 0001A4 AC                                        
  167| 0001A5 01000000                                  
  167|                 L44:                             
;  Source Line # 168
  168| 0001A9 C785                        MOV    DWORD PTR [EBP-148], 0 ;  Sum1
  168| 0001AB 6CFFFFFF                                  
  168| 0001AF 00000000                                  
  168| 0001B3 8B05                        MOV    EAX, package1.n 
  168| 0001B5 00000000                                  
  168| 0001B9 8945                        MOV    [EBP-80], EAX 
  168| 0001BB B0                                        
;  Source Line # 169
  169| 0001BC 837D                        CMP    DWORD PTR [EBP-80], 0 
  169| 0001BE B0                                        
  169| 0001BF 00                                        
  169| 0001C0 0F8E                        JLE    L45    
  169| 0001C2 A7000000                                  
  169| 0001C6 C745                        MOV    DWORD PTR [EBP-76], 1 
  169| 0001C8 B4                                        
  169| 0001C9 01000000                                  
  169|                 L47:                             
;  Source Line # 170
  170| 0001CD 8B95                        MOV    EDX, [EBP-156] ; Spill
  170| 0001CF 64FFFFFF                                  
  170| 0001D3 8B42                        MOV    EAX, [EDX+48] 
  170| 0001D5 30                                        
  170| 0001D6 8B98                        MOV    EBX, [EAX-140] ;  MT
  170| 0001D8 74FFFFFF                                  
  170| 0001DC 8B4D                        MOV    ECX, [EBP-76] 
  170| 0001DE B4                                        
  170| 0001DF 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  170| 0001E1 00000000                                  
  170|                 L106:                            
  170| 0001E5 0F8F                        JG     L107   
  170| 0001E7 56070000                                  
  170| 0001EB 8D49                        LEA    ECX, [ECX-1] 
  170| 0001ED FF                                        
  170| 0001EE 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  170| 0001F1 00000000                                  
  170| 0001F5 8B75                        MOV    ESI, [EBP-84] 
  170| 0001F7 AC                                        
  170| 0001F8 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  170| 0001FA 00000000                                  
  170|                 L108:                            
  170| 0001FE 0F8F                        JG     L109   
  170| 000200 49070000                                  
  170| 000204 8D34B5                      LEA    ESI, [4*ESI-4] 
  170| 000207 FCFFFFFF                                  
  170| 00020B 03CE                        ADD    ECX, ESI 
  170| 00020D 8BBD                        MOV    EDI, [EBP-136] ;  MO1
  170| 00020F 78FFFFFF                                  
  170| 000213 8B55                        MOV    EDX, [EBP-92] 
  170| 000215 A4                                        
  170| 000216 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  170| 000218 00000000                                  
  170|                 L110:                            
  170| 00021C 0F8F                        JG     L111   
  170| 00021E 37070000                                  
  170| 000222 8D52                        LEA    EDX, [EDX-1] 
  170| 000224 FF                                        
  170| 000225 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  170| 000228 00000000                                  
  170| 00022C 8B45                        MOV    EAX, [EBP-76] 
  170| 00022E B4                                        
  170| 00022F 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  170| 000231 00000000                                  
  170|                 L112:                            
  170| 000235 0F8F                        JG     L113   
  170| 000237 2A070000                                  
  170| 00023B 8D0485                      LEA    EAX, [4*EAX-4] 
  170| 00023E FCFFFFFF                                  
  170| 000242 03D0                        ADD    EDX, EAX 
  170| 000244 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  170| 000247 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  170| 00024B CE                          INTO          
  170| 00024C 039D                        ADD    EBX, [EBP-148] ;  Sum1
  170| 00024E 6CFFFFFF                                  
  170| 000252 CE                          INTO          
  170| 000253 899D                        MOV    [EBP-148], EBX ;  Sum1
  170| 000255 6CFFFFFF                                  
;  Source Line # 171
  171| 000259 8B75                        MOV    ESI, [EBP-80] 
  171| 00025B B0                                        
  171| 00025C 3975                        CMP    [EBP-76], ESI 
  171| 00025E B4                                        
  171| 00025F 74                          JE     SHORT L45 
  171| 000260 0C                                        
  171| 000261 8B45                        MOV    EAX, [EBP-76] 
  171| 000263 B4                                        
  171| 000264 40                          INC    EAX    
  171| 000265 8945                        MOV    [EBP-76], EAX 
  171| 000267 B4                                        
  171| 000268 E9                          JMP    L47    
  171| 000269 60FFFFFF                                  
  171|                 L45:                             
;  Source Line # 172
  172| 00026D 8B45                        MOV    EAX, [EBP-124] ;  MTF
  172| 00026F 84                                        
  172| 000270 8B5D                        MOV    EBX, [EBP-92] 
  172| 000272 A4                                        
  172| 000273 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
  172| 000275 00000000                                  
  172|                 L114:                            
  172| 000279 0F8F                        JG     L115   
  172| 00027B F2060000                                  
  172| 00027F 8D5B                        LEA    EBX, [EBX-1] 
  172| 000281 FF                                        
  172| 000282 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  172| 000285 00000000                                  
  172| 000289 8B4D                        MOV    ECX, [EBP-84] 
  172| 00028B AC                                        
  172| 00028C 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  172| 00028E 00000000                                  
  172|                 L116:                            
  172| 000292 0F8F                        JG     L117   
  172| 000294 E5060000                                  
  172| 000298 8D0C8D                      LEA    ECX, [4*ECX-4] 
  172| 00029B FCFFFFFF                                  
  172| 00029F 03D9                        ADD    EBX, ECX 
  172| 0002A1 8B95                        MOV    EDX, [EBP-148] ;  Sum1
  172| 0002A3 6CFFFFFF                                  
  172| 0002A7 891418                      MOV    [EAX+EBX+0], EDX 
;  Source Line # 173
  173| 0002AA 8B75                        MOV    ESI, [EBP-88] 
  173| 0002AC A8                                        
  173| 0002AD 3975                        CMP    [EBP-84], ESI 
  173| 0002AF AC                                        
  173| 0002B0 74                          JE     SHORT L42 
  173| 0002B1 0C                                        
  173| 0002B2 8B45                        MOV    EAX, [EBP-84] 
  173| 0002B4 AC                                        
  173| 0002B5 40                          INC    EAX    
  173| 0002B6 8945                        MOV    [EBP-84], EAX 
  173| 0002B8 AC                                        
  173| 0002B9 E9                          JMP    L44    
  173| 0002BA EBFEFFFF                                  
  173|                 L42:                             
;  Source Line # 174
  174| 0002BE 8B45                        MOV    EAX, [EBP-96] 
  174| 0002C0 A0                                        
  174| 0002C1 3945                        CMP    [EBP-92], EAX 
  174| 0002C3 A4                                        
  174| 0002C4 74                          JE     SHORT L39 
  174| 0002C5 0C                                        
  174| 0002C6 8B45                        MOV    EAX, [EBP-92] 
  174| 0002C8 A4                                        
  174| 0002C9 40                          INC    EAX    
  174| 0002CA 8945                        MOV    [EBP-92], EAX 
  174| 0002CC A4                                        
  174| 0002CD E9                          JMP    L41    
  174| 0002CE BDFEFFFF                                  
  174|                 L39:                             
;  Source Line # 175
  175| 0002D2 C785                        MOV    DWORD PTR [EBP-148], 0 ;  Sum1
  175| 0002D4 6CFFFFFF                                  
  175| 0002D8 00000000                                  
  175| 0002DC 8B05                        MOV    EAX, package1.h 
  175| 0002DE 00000000                                  
  175| 0002E2 8945                        MOV    [EBP-72], EAX 
  175| 0002E4 B8                                        
;  Source Line # 176
  176| 0002E5 837D                        CMP    DWORD PTR [EBP-72], 0 
  176| 0002E7 B8                                        
  176| 0002E8 00                                        
  176| 0002E9 0F8E                        JLE    L54    
  176| 0002EB F5000000                                  
  176| 0002EF C745                        MOV    DWORD PTR [EBP-68], 1 
  176| 0002F1 BC                                        
  176| 0002F2 01000000                                  
  176|                 L56:                             
  176| 0002F6 8B05                        MOV    EAX, package1.n 
  176| 0002F8 00000000                                  
  176| 0002FC 8945                        MOV    [EBP-64], EAX 
  176| 0002FE C0                                        
;  Source Line # 177
  177| 0002FF 837D                        CMP    DWORD PTR [EBP-64], 0 
  177| 000301 C0                                        
  177| 000302 00                                        
  177| 000303 7E                          JLE    SHORT L57 
  177| 000304 74                                        
  177| 000305 C745                        MOV    DWORD PTR [EBP-60], 1 
  177| 000307 C4                                        
  177| 000308 01000000                                  
  177|                 L59:                             
;  Source Line # 178
  178| 00030C 8B45                        MOV    EAX, [EBP-128] ;  D1
  178| 00030E 80                                        
  178| 00030F 8B5D                        MOV    EBX, [EBP-60] 
  178| 000311 C4                                        
  178| 000312 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
  178| 000314 00000000                                  
  178|                 L118:                            
  178| 000318 0F8F                        JG     L119   
  178| 00031A 6B060000                                  
  178| 00031E 8B4D                        MOV    ECX, [EBP-124] ;  MTF
  178| 000320 84                                        
  178| 000321 8B55                        MOV    EDX, [EBP-60] 
  178| 000323 C4                                        
  178| 000324 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  178| 000326 00000000                                  
  178|                 L120:                            
  178| 00032A 0F8F                        JG     L121   
  178| 00032C 65060000                                  
  178| 000330 8D52                        LEA    EDX, [EDX-1] 
  178| 000332 FF                                        
  178| 000333 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  178| 000336 00000000                                  
  178| 00033A 8B75                        MOV    ESI, [EBP-68] 
  178| 00033C BC                                        
  178| 00033D 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  178| 00033F 00000000                                  
  178|                 L122:                            
  178| 000343 0F8F                        JG     L123   
  178| 000345 58060000                                  
  178| 000349 8D34B5                      LEA    ESI, [4*ESI-4] 
  178| 00034C FCFFFFFF                                  
  178| 000350 03D6                        ADD    EDX, ESI 
  178| 000352 8B7C98                      MOV    EDI, [EAX+4*EBX-4] 
  178| 000355 FC                                        
  178| 000356 0FAF3C11                    IMUL   EDI, [ECX+EDX+0] 
  178| 00035A CE                          INTO          
  178| 00035B 03BD                        ADD    EDI, [EBP-148] ;  Sum1
  178| 00035D 6CFFFFFF                                  
  178| 000361 CE                          INTO          
  178| 000362 89BD                        MOV    [EBP-148], EDI ;  Sum1
  178| 000364 6CFFFFFF                                  
;  Source Line # 179
  179| 000368 8B45                        MOV    EAX, [EBP-64] 
  179| 00036A C0                                        
  179| 00036B 3945                        CMP    [EBP-60], EAX 
  179| 00036D C4                                        
  179| 00036E 74                          JE     SHORT L57 
  179| 00036F 09                                        
  179| 000370 8B45                        MOV    EAX, [EBP-60] 
  179| 000372 C4                                        
  179| 000373 40                          INC    EAX    
  179| 000374 8945                        MOV    [EBP-60], EAX 
  179| 000376 C4                                        
  179| 000377 EB                          JMP    SHORT L59 
  179| 000378 93                                        
  179|                 L57:                             
;  Source Line # 180
  180| 000379 8B95                        MOV    EDX, [EBP-156] ; Spill
  180| 00037B 64FFFFFF                                  
  180| 00037F 8B42                        MOV    EAX, [EDX+48] 
  180| 000381 30                                        
  180| 000382 8B98                        MOV    EBX, [EAX-132] ;  C
  180| 000384 7CFFFFFF                                  
  180| 000388 8B4D                        MOV    ECX, [EBP-68] 
  180| 00038A BC                                        
  180| 00038B 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  180| 00038D 00000000                                  
  180|                 L124:                            
  180| 000391 0F8F                        JG     L125   
  180| 000393 16060000                                  
  180| 000397 8B748B                      MOV    ESI, [EBX+4*ECX-4] 
  180| 00039A FC                                        
  180| 00039B 0FAFB5                      IMUL   ESI, [EBP-132] ;  alfa1
  180| 00039E 7CFFFFFF                                  
  180| 0003A2 CE                          INTO          
  180| 0003A3 03B5                        ADD    ESI, [EBP-148] ;  Sum1
  180| 0003A5 6CFFFFFF                                  
  180| 0003A9 CE                          INTO          
  180| 0003AA 8B7A                        MOV    EDI, [EDX+48] 
  180| 0003AC 30                                        
  180| 0003AD 8B97                        MOV    EDX, [EDI-136] ;  A
  180| 0003AF 78FFFFFF                                  
  180| 0003B3 8B45                        MOV    EAX, [EBP-68] 
  180| 0003B5 BC                                        
  180| 0003B6 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  180| 0003B8 00000000                                  
  180|                 L126:                            
  180| 0003BC 0F8F                        JG     L127   
  180| 0003BE F7050000                                  
  180| 0003C2 897482                      MOV    [EDX+4*EAX-4], ESI 
  180| 0003C5 FC                                        
;  Source Line # 181
  181| 0003C6 C785                        MOV    DWORD PTR [EBP-148], 0 ;  Sum1
  181| 0003C8 6CFFFFFF                                  
  181| 0003CC 00000000                                  
;  Source Line # 182
  182| 0003D0 8B5D                        MOV    EBX, [EBP-72] 
  182| 0003D2 B8                                        
  182| 0003D3 395D                        CMP    [EBP-68], EBX 
  182| 0003D5 BC                                        
  182| 0003D6 74                          JE     SHORT L54 
  182| 0003D7 0C                                        
  182| 0003D8 8B45                        MOV    EAX, [EBP-68] 
  182| 0003DA BC                                        
  182| 0003DB 40                          INC    EAX    
  182| 0003DC 8945                        MOV    [EBP-68], EAX 
  182| 0003DE BC                                        
  182| 0003DF E9                          JMP    L56    
  182| 0003E0 12FFFFFF                                  
  182|                 L54:                             
  182| 0003E4 8B05                        MOV    EAX, package1.h 
  182| 0003E6 00000000                                  
  182| 0003EA 8945                        MOV    [EBP-56], EAX 
  182| 0003EC C8                                        
;  Source Line # 183
  183| 0003ED 837D                        CMP    DWORD PTR [EBP-56], 0 
  183| 0003EF C8                                        
  183| 0003F0 00                                        
  183| 0003F1 0F8E                        JLE    L64    
  183| 0003F3 15010000                                  
  183| 0003F7 C745                        MOV    DWORD PTR [EBP-52], 1 
  183| 0003F9 CC                                        
  183| 0003FA 01000000                                  
  183|                 L66:                             
  183| 0003FE 8B05                        MOV    EAX, package1.h 
  183| 000400 00000000                                  
  183| 000404 8945                        MOV    [EBP-48], EAX 
  183| 000406 D0                                        
;  Source Line # 184
  184| 000407 837D                        CMP    DWORD PTR [EBP-48], 0 
  184| 000409 D0                                        
  184| 00040A 00                                        
  184| 00040B 0F8E                        JLE    L67    
  184| 00040D E7000000                                  
  184| 000411 C745                        MOV    DWORD PTR [EBP-44], 1 
  184| 000413 D4                                        
  184| 000414 01000000                                  
  184|                 L69:                             
;  Source Line # 185
  185| 000418 8B95                        MOV    EDX, [EBP-156] ; Spill
  185| 00041A 64FFFFFF                                  
  185| 00041E 8B42                        MOV    EAX, [EDX+48] 
  185| 000420 30                                        
  185| 000421 8B98                        MOV    EBX, [EAX-136] ;  A
  185| 000423 78FFFFFF                                  
  185| 000427 8B4D                        MOV    ECX, [EBP-52] 
  185| 000429 CC                                        
  185| 00042A 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  185| 00042C 00000000                                  
  185|                 L128:                            
  185| 000430 0F8F                        JG     L129   
  185| 000432 8F050000                                  
  185| 000436 8B72                        MOV    ESI, [EDX+48] 
  185| 000438 30                                        
  185| 000439 8BBE                        MOV    EDI, [ESI-136] ;  A
  185| 00043B 78FFFFFF                                  
  185| 00043F 8B55                        MOV    EDX, [EBP-44] 
  185| 000441 D4                                        
  185| 000442 3B15                        CMP    EDX, package1.vec__constrained_array____1 
  185| 000444 00000000                                  
  185|                 L130:                            
  185| 000448 0F8F                        JG     L131   
  185| 00044A 83050000                                  
  185| 00044E 8B4497                      MOV    EAX, [EDI+4*EDX-4] 
  185| 000451 FC                                        
  185| 000452 39448B                      CMP    [EBX+4*ECX-4], EAX 
  185| 000455 FC                                        
  185| 000456 0F8E                        JLE    L70    
  185| 000458 88000000                                  
;  Source Line # 187
  187| 00045C 8B95                        MOV    EDX, [EBP-156] ; Spill
  187| 00045E 64FFFFFF                                  
  187| 000462 8B42                        MOV    EAX, [EDX+48] 
  187| 000464 30                                        
  187| 000465 8B98                        MOV    EBX, [EAX-136] ;  A
  187| 000467 78FFFFFF                                  
  187| 00046B 8B4D                        MOV    ECX, [EBP-52] 
  187| 00046D CC                                        
  187| 00046E 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  187| 000470 00000000                                  
  187|                 L132:                            
  187| 000474 0F8F                        JG     L133   
  187| 000476 63050000                                  
  187| 00047A 8B748B                      MOV    ESI, [EBX+4*ECX-4] 
  187| 00047D FC                                        
  187| 00047E 89B5                        MOV    [EBP-144], ESI ;  Temp
  187| 000480 70FFFFFF                                  
;  Source Line # 188
  188| 000484 8B7A                        MOV    EDI, [EDX+48] 
  188| 000486 30                                        
  188| 000487 8B97                        MOV    EDX, [EDI-136] ;  A
  188| 000489 78FFFFFF                                  
  188| 00048D 8B45                        MOV    EAX, [EBP-44] 
  188| 00048F D4                                        
  188| 000490 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  188| 000492 00000000                                  
  188|                 L134:                            
  188| 000496 0F8F                        JG     L135   
  188| 000498 4D050000                                  
  188| 00049C 8B9D                        MOV    EBX, [EBP-156] ; Spill
  188| 00049E 64FFFFFF                                  
  188| 0004A2 8B4B                        MOV    ECX, [EBX+48] 
  188| 0004A4 30                                        
  188| 0004A5 8BB1                        MOV    ESI, [ECX-136] ;  A
  188| 0004A7 78FFFFFF                                  
  188| 0004AB 8B7D                        MOV    EDI, [EBP-52] 
  188| 0004AD CC                                        
  188| 0004AE 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  188| 0004B0 00000000                                  
  188|                 L136:                            
  188| 0004B4 0F8F                        JG     L137   
  188| 0004B6 3B050000                                  
  188| 0004BA 8B5482                      MOV    EDX, [EDX+4*EAX-4] 
  188| 0004BD FC                                        
  188| 0004BE 8954BE                      MOV    [ESI+4*EDI-4], EDX 
  188| 0004C1 FC                                        
;  Source Line # 189
  189| 0004C2 8B43                        MOV    EAX, [EBX+48] 
  189| 0004C4 30                                        
  189| 0004C5 8B98                        MOV    EBX, [EAX-136] ;  A
  189| 0004C7 78FFFFFF                                  
  189| 0004CB 8B4D                        MOV    ECX, [EBP-44] 
  189| 0004CD D4                                        
  189| 0004CE 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  189| 0004D0 00000000                                  
  189|                 L138:                            
  189| 0004D4 0F8F                        JG     L139   
  189| 0004D6 27050000                                  
  189| 0004DA 8BB5                        MOV    ESI, [EBP-144] ;  Temp
  189| 0004DC 70FFFFFF                                  
  189| 0004E0 89748B                      MOV    [EBX+4*ECX-4], ESI 
  189| 0004E3 FC                                        
;  Source Line # 190
;  Source Line # 191
  191|                 L70:                             
;  Source Line # 192
  192| 0004E4 8B45                        MOV    EAX, [EBP-48] 
  192| 0004E6 D0                                        
  192| 0004E7 3945                        CMP    [EBP-44], EAX 
  192| 0004E9 D4                                        
  192| 0004EA 74                          JE     SHORT L67 
  192| 0004EB 0C                                        
  192| 0004EC 8B45                        MOV    EAX, [EBP-44] 
  192| 0004EE D4                                        
  192| 0004EF 40                          INC    EAX    
  192| 0004F0 8945                        MOV    [EBP-44], EAX 
  192| 0004F2 D4                                        
  192| 0004F3 E9                          JMP    L69    
  192| 0004F4 20FFFFFF                                  
  192|                 L67:                             
;  Source Line # 193
  193| 0004F8 8B45                        MOV    EAX, [EBP-56] 
  193| 0004FA C8                                        
  193| 0004FB 3945                        CMP    [EBP-52], EAX 
  193| 0004FD CC                                        
  193| 0004FE 74                          JE     SHORT L64 
  193| 0004FF 0C                                        
  193| 000500 8B45                        MOV    EAX, [EBP-52] 
  193| 000502 CC                                        
  193| 000503 40                          INC    EAX    
  193| 000504 8945                        MOV    [EBP-52], EAX 
  193| 000506 CC                                        
  193| 000507 E9                          JMP    L66    
  193| 000508 F2FEFFFF                                  
  193|                 L64:                             
;  Source Line # 195
  195| 00050C 6A                          PUSH   0      
  195| 00050D 00                                        
  195| 00050E 6A                          PUSH   1      
  195| 00050F 01                                        
  195| 000510 6A                          PUSH   0      
  195| 000511 00                                        
  195| 000512 8B95                        MOV    EDX, [EBP-156] ; Spill
  195| 000514 64FFFFFF                                  
  195| 000518 8B42                        MOV    EAX, [EDX+48] 
  195| 00051A 30                                        
  195| 00051B 8B58                        MOV    EBX, [EAX-44] ;  MON
  195| 00051D D4                                        
  195| 00051E 53                          PUSH   EBX    
  195| 00051F E8                          CALL   rts_protected_entry_call 
  195| 000520 00000000                                  
;  Source Line # 197
  197| 000524 C745                        MOV    DWORD PTR [EBP-120], 1 ;  Uk1
  197| 000526 88                                        
  197| 000527 01000000                                  
;  Source Line # 198
  198| 00052B 8B0D                        MOV    ECX, package1.h 
  198| 00052D 00000000                                  
  198| 000531 41                          INC    ECX    
  198| 000532 CE                          INTO          
  198| 000533 894D                        MOV    [EBP-116], ECX ;  Uk2
  198| 000535 8C                                        
  198| 000536 8B35                        MOV    ESI, package1.h 
  198| 000538 00000000                                  
  198| 00053C D1E6                        SHL    ESI, 1 
  198| 00053E CE                          INTO          
  198| 00053F 8975                        MOV    [EBP-40], ESI 
  198| 000541 D8                                        
;  Source Line # 200
  200| 000542 837D                        CMP    DWORD PTR [EBP-40], 0 
  200| 000544 D8                                        
  200| 000545 00                                        
  200| 000546 0F8E                        JLE    L76    
  200| 000548 1B010000                                  
  200| 00054C C745                        MOV    DWORD PTR [EBP-36], 1 
  200| 00054E DC                                        
  200| 00054F 01000000                                  
  200|                 L78:                             
;  Source Line # 201
  201| 000553 8B05                        MOV    EAX, package1.h 
  201| 000555 00000000                                  
  201| 000559 D1E0                        SHL    EAX, 1 
  201| 00055B CE                          INTO          
  201| 00055C 3945                        CMP    [EBP-116], EAX ;  Uk2
  201| 00055E 8C                                        
  201| 00055F 0F9DC7                      SETGE  BH     
  201| 000562 8B95                        MOV    EDX, [EBP-156] ; Spill
  201| 000564 64FFFFFF                                  
  201| 000568 8B4A                        MOV    ECX, [EDX+48] 
  201| 00056A 30                                        
  201| 00056B 8BB1                        MOV    ESI, [ECX-136] ;  A
  201| 00056D 78FFFFFF                                  
  201| 000571 8B7D                        MOV    EDI, [EBP-120] ;  Uk1
  201| 000573 88                                        
  201| 000574 83FF                        CMP    EDI, 1 
  201| 000576 01                                        
  201|                 L140:                            
  201| 000577 0F8C                        JL     L141   
  201| 000579 90040000                                  
  201| 00057D 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  201| 00057F 00000000                                  
  201| 000583 0F8F                        JG     L141   
  201| 000585 84040000                                  
  201| 000589 8B42                        MOV    EAX, [EDX+48] 
  201| 00058B 30                                        
  201| 00058C 8B90                        MOV    EDX, [EAX-136] ;  A
  201| 00058E 78FFFFFF                                  
  201| 000592 8B4D                        MOV    ECX, [EBP-116] ;  Uk2
  201| 000594 8C                                        
  201| 000595 83F9                        CMP    ECX, 1 
  201| 000597 01                                        
  201|                 L142:                            
  201| 000598 0F8C                        JL     L143   
  201| 00059A 7B040000                                  
  201| 00059E 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  201| 0005A0 00000000                                  
  201| 0005A4 0F8F                        JG     L143   
  201| 0005A6 6F040000                                  
  201| 0005AA 8B448A                      MOV    EAX, [EDX+4*ECX-4] 
  201| 0005AD FC                                        
  201| 0005AE 3944BE                      CMP    [ESI+4*EDI-4], EAX 
  201| 0005B1 FC                                        
  201| 0005B2 0F9EC3                      SETLE  BL     
  201| 0005B5 8B35                        MOV    ESI, package1.h 
  201| 0005B7 00000000                                  
  201| 0005BB 3975                        CMP    [EBP-120], ESI ;  Uk1
  201| 0005BD 88                                        
  201| 0005BE 0F9CC6                      SETL   DH     
  201| 0005C1 22DE                        AND    BL, DH 
  201| 0005C3 0AFB                        OR     BH, BL 
  201| 0005C5 0AFF                        OR     BH, BH 
  201| 0005C7 74                          JE     SHORT L80 
  201| 0005C8 42                                        
;  Source Line # 203
  203| 0005C9 8B95                        MOV    EDX, [EBP-156] ; Spill
  203| 0005CB 64FFFFFF                                  
  203| 0005CF 8B42                        MOV    EAX, [EDX+48] 
  203| 0005D1 30                                        
  203| 0005D2 8B98                        MOV    EBX, [EAX-136] ;  A
  203| 0005D4 78FFFFFF                                  
  203| 0005D8 8B4D                        MOV    ECX, [EBP-120] ;  Uk1
  203| 0005DA 88                                        
  203| 0005DB 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  203| 0005DD 00000000                                  
  203|                 L144:                            
  203| 0005E1 0F8F                        JG     L145   
  203| 0005E3 3E040000                                  
  203| 0005E7 8B75                        MOV    ESI, [EBP-112] ;  Tv
  203| 0005E9 90                                        
  203| 0005EA 8B7D                        MOV    EDI, [EBP-36] 
  203| 0005EC DC                                        
  203| 0005ED 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  203| 0005EF 00000000                                  
  203|                 L146:                            
  203| 0005F3 0F8F                        JG     L147   
  203| 0005F5 38040000                                  
  203| 0005F9 8B548B                      MOV    EDX, [EBX+4*ECX-4] 
  203| 0005FC FC                                        
  203| 0005FD 8954BE                      MOV    [ESI+4*EDI-4], EDX 
  203| 000600 FC                                        
;  Source Line # 204
  204| 000601 8B45                        MOV    EAX, [EBP-120] ;  Uk1
  204| 000603 88                                        
  204| 000604 40                          INC    EAX    
  204| 000605 CE                          INTO          
  204| 000606 8945                        MOV    [EBP-120], EAX ;  Uk1
  204| 000608 88                                        
;  Source Line # 205
  205| 000609 EB                          JMP    SHORT L79 
  205| 00060A 48                                        
  205|                 L80:                             
;  Source Line # 206
;  Source Line # 208
  208| 00060B 8B95                        MOV    EDX, [EBP-156] ; Spill
  208| 00060D 64FFFFFF                                  
  208| 000611 8B42                        MOV    EAX, [EDX+48] 
  208| 000613 30                                        
  208| 000614 8B98                        MOV    EBX, [EAX-136] ;  A
  208| 000616 78FFFFFF                                  
  208| 00061A 8B4D                        MOV    ECX, [EBP-116] ;  Uk2
  208| 00061C 8C                                        
  208| 00061D 83F9                        CMP    ECX, 1 
  208| 00061F 01                                        
  208|                 L148:                            
  208| 000620 0F8C                        JL     L149   
  208| 000622 17040000                                  
  208| 000626 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  208| 000628 00000000                                  
  208| 00062C 0F8F                        JG     L149   
  208| 00062E 0B040000                                  
  208| 000632 8B75                        MOV    ESI, [EBP-112] ;  Tv
  208| 000634 90                                        
  208| 000635 8B7D                        MOV    EDI, [EBP-36] 
  208| 000637 DC                                        
  208| 000638 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  208| 00063A 00000000                                  
  208|                 L150:                            
  208| 00063E 0F8F                        JG     L151   
  208| 000640 05040000                                  
  208| 000644 8B548B                      MOV    EDX, [EBX+4*ECX-4] 
  208| 000647 FC                                        
  208| 000648 8954BE                      MOV    [ESI+4*EDI-4], EDX 
  208| 00064B FC                                        
;  Source Line # 209
  209| 00064C 8B45                        MOV    EAX, [EBP-116] ;  Uk2
  209| 00064E 8C                                        
  209| 00064F 40                          INC    EAX    
  209| 000650 8945                        MOV    [EBP-116], EAX ;  Uk2
  209| 000652 8C                                        
;  Source Line # 210
;  Source Line # 211
  211|                 L79:                             
;  Source Line # 212
  212| 000653 8B45                        MOV    EAX, [EBP-40] 
  212| 000655 D8                                        
  212| 000656 3945                        CMP    [EBP-36], EAX 
  212| 000658 DC                                        
  212| 000659 74                          JE     SHORT L76 
  212| 00065A 0C                                        
  212| 00065B 8B45                        MOV    EAX, [EBP-36] 
  212| 00065D DC                                        
  212| 00065E 40                          INC    EAX    
  212| 00065F 8945                        MOV    [EBP-36], EAX 
  212| 000661 DC                                        
  212| 000662 E9                          JMP    L78    
  212| 000663 ECFEFFFF                                  
  212|                 L76:                             
  212| 000667 8B05                        MOV    EAX, package1.h 
  212| 000669 00000000                                  
  212| 00066D D1E0                        SHL    EAX, 1 
  212| 00066F CE                          INTO          
  212| 000670 8945                        MOV    [EBP-32], EAX 
  212| 000672 E0                                        
;  Source Line # 213
  213| 000673 837D                        CMP    DWORD PTR [EBP-32], 0 
  213| 000675 E0                                        
  213| 000676 00                                        
  213| 000677 7E                          JLE    SHORT L83 
  213| 000678 50                                        
  213| 000679 C745                        MOV    DWORD PTR [EBP-28], 1 
  213| 00067B E4                                        
  213| 00067C 01000000                                  
  213|                 L85:                             
;  Source Line # 214
  214| 000680 8B45                        MOV    EAX, [EBP-112] ;  Tv
  214| 000682 90                                        
  214| 000683 8B5D                        MOV    EBX, [EBP-28] 
  214| 000685 E4                                        
  214| 000686 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
  214| 000688 00000000                                  
  214|                 L152:                            
  214| 00068C 0F8F                        JG     L153   
  214| 00068E C3030000                                  
  214| 000692 8B95                        MOV    EDX, [EBP-156] ; Spill
  214| 000694 64FFFFFF                                  
  214| 000698 8B4A                        MOV    ECX, [EDX+48] 
  214| 00069A 30                                        
  214| 00069B 8BB1                        MOV    ESI, [ECX-136] ;  A
  214| 00069D 78FFFFFF                                  
  214| 0006A1 8B7D                        MOV    EDI, [EBP-28] 
  214| 0006A3 E4                                        
  214| 0006A4 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  214| 0006A6 00000000                                  
  214|                 L154:                            
  214| 0006AA 0F8F                        JG     L155   
  214| 0006AC B1030000                                  
  214| 0006B0 8B4498                      MOV    EAX, [EAX+4*EBX-4] 
  214| 0006B3 FC                                        
  214| 0006B4 8944BE                      MOV    [ESI+4*EDI-4], EAX 
  214| 0006B7 FC                                        
;  Source Line # 215
  215| 0006B8 8B5D                        MOV    EBX, [EBP-32] 
  215| 0006BA E0                                        
  215| 0006BB 395D                        CMP    [EBP-28], EBX 
  215| 0006BD E4                                        
  215| 0006BE 74                          JE     SHORT L83 
  215| 0006BF 09                                        
  215| 0006C0 8B45                        MOV    EAX, [EBP-28] 
  215| 0006C2 E4                                        
  215| 0006C3 40                          INC    EAX    
  215| 0006C4 8945                        MOV    [EBP-28], EAX 
  215| 0006C6 E4                                        
  215| 0006C7 EB                          JMP    SHORT L85 
  215| 0006C8 B7                                        
  215|                 L83:                             
;  Source Line # 217
  217| 0006C9 6A                          PUSH   0      
  217| 0006CA 00                                        
  217| 0006CB 6A                          PUSH   3      
  217| 0006CC 03                                        
  217| 0006CD 6A                          PUSH   0      
  217| 0006CE 00                                        
  217| 0006CF 8B95                        MOV    EDX, [EBP-156] ; Spill
  217| 0006D1 64FFFFFF                                  
  217| 0006D5 8B42                        MOV    EAX, [EDX+48] 
  217| 0006D7 30                                        
  217| 0006D8 8B58                        MOV    EBX, [EAX-44] ;  MON
  217| 0006DA D4                                        
  217| 0006DB 53                          PUSH   EBX    
  217| 0006DC E8                          CALL   rts_protected_entry_call 
  217| 0006DD 00000000                                  
;  Source Line # 219
  219| 0006E1 C745                        MOV    DWORD PTR [EBP-120], 1 ;  Uk1
  219| 0006E3 88                                        
  219| 0006E4 01000000                                  
;  Source Line # 220
  220| 0006E8 8B0D                        MOV    ECX, package1.h 
  220| 0006EA 00000000                                  
  220| 0006EE D1E1                        SHL    ECX, 1 
  220| 0006F0 CE                          INTO          
  220| 0006F1 41                          INC    ECX    
  220| 0006F2 CE                          INTO          
  220| 0006F3 894D                        MOV    [EBP-116], ECX ;  Uk2
  220| 0006F5 8C                                        
  220| 0006F6 8B35                        MOV    ESI, package1.n 
  220| 0006F8 00000000                                  
  220| 0006FC 8975                        MOV    [EBP-24], ESI 
  220| 0006FE E8                                        
;  Source Line # 222
  222| 0006FF 837D                        CMP    DWORD PTR [EBP-24], 0 
  222| 000701 E8                                        
  222| 000702 00                                        
  222| 000703 0F8E                        JLE    L88    
  222| 000705 1B010000                                  
  222| 000709 C745                        MOV    DWORD PTR [EBP-20], 1 
  222| 00070B EC                                        
  222| 00070C 01000000                                  
  222|                 L90:                             
;  Source Line # 223
  223| 000710 8B05                        MOV    EAX, package1.n 
  223| 000712 00000000                                  
  223| 000716 3945                        CMP    [EBP-116], EAX ;  Uk2
  223| 000718 8C                                        
  223| 000719 0F9DC7                      SETGE  BH     
  223| 00071C 8B95                        MOV    EDX, [EBP-156] ; Spill
  223| 00071E 64FFFFFF                                  
  223| 000722 8B4A                        MOV    ECX, [EDX+48] 
  223| 000724 30                                        
  223| 000725 8BB1                        MOV    ESI, [ECX-136] ;  A
  223| 000727 78FFFFFF                                  
  223| 00072B 8B7D                        MOV    EDI, [EBP-120] ;  Uk1
  223| 00072D 88                                        
  223| 00072E 83FF                        CMP    EDI, 1 
  223| 000730 01                                        
  223|                 L156:                            
  223| 000731 0F8C                        JL     L157   
  223| 000733 36030000                                  
  223| 000737 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  223| 000739 00000000                                  
  223| 00073D 0F8F                        JG     L157   
  223| 00073F 2A030000                                  
  223| 000743 8B42                        MOV    EAX, [EDX+48] 
  223| 000745 30                                        
  223| 000746 8B90                        MOV    EDX, [EAX-136] ;  A
  223| 000748 78FFFFFF                                  
  223| 00074C 8B4D                        MOV    ECX, [EBP-116] ;  Uk2
  223| 00074E 8C                                        
  223| 00074F 83F9                        CMP    ECX, 1 
  223| 000751 01                                        
  223|                 L158:                            
  223| 000752 0F8C                        JL     L159   
  223| 000754 21030000                                  
  223| 000758 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  223| 00075A 00000000                                  
  223| 00075E 0F8F                        JG     L159   
  223| 000760 15030000                                  
  223| 000764 8B448A                      MOV    EAX, [EDX+4*ECX-4] 
  223| 000767 FC                                        
  223| 000768 3944BE                      CMP    [ESI+4*EDI-4], EAX 
  223| 00076B FC                                        
  223| 00076C 0F9EC3                      SETLE  BL     
  223| 00076F 8B35                        MOV    ESI, package1.h 
  223| 000771 00000000                                  
  223| 000775 D1E6                        SHL    ESI, 1 
  223| 000777 CE                          INTO          
  223| 000778 3975                        CMP    [EBP-120], ESI ;  Uk1
  223| 00077A 88                                        
  223| 00077B 0F9CC6                      SETL   DH     
  223| 00077E 22DE                        AND    BL, DH 
  223| 000780 0AFB                        OR     BH, BL 
  223| 000782 0AFF                        OR     BH, BH 
  223| 000784 74                          JE     SHORT L92 
  223| 000785 42                                        
;  Source Line # 225
  225| 000786 8B95                        MOV    EDX, [EBP-156] ; Spill
  225| 000788 64FFFFFF                                  
  225| 00078C 8B42                        MOV    EAX, [EDX+48] 
  225| 00078E 30                                        
  225| 00078F 8B98                        MOV    EBX, [EAX-136] ;  A
  225| 000791 78FFFFFF                                  
  225| 000795 8B4D                        MOV    ECX, [EBP-120] ;  Uk1
  225| 000797 88                                        
  225| 000798 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  225| 00079A 00000000                                  
  225|                 L160:                            
  225| 00079E 0F8F                        JG     L161   
  225| 0007A0 E1020000                                  
  225| 0007A4 8B75                        MOV    ESI, [EBP-112] ;  Tv
  225| 0007A6 90                                        
  225| 0007A7 8B7D                        MOV    EDI, [EBP-20] 
  225| 0007A9 EC                                        
  225| 0007AA 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  225| 0007AC 00000000                                  
  225|                 L162:                            
  225| 0007B0 0F8F                        JG     L163   
  225| 0007B2 DB020000                                  
  225| 0007B6 8B548B                      MOV    EDX, [EBX+4*ECX-4] 
  225| 0007B9 FC                                        
  225| 0007BA 8954BE                      MOV    [ESI+4*EDI-4], EDX 
  225| 0007BD FC                                        
;  Source Line # 226
  226| 0007BE 8B45                        MOV    EAX, [EBP-120] ;  Uk1
  226| 0007C0 88                                        
  226| 0007C1 40                          INC    EAX    
  226| 0007C2 CE                          INTO          
  226| 0007C3 8945                        MOV    [EBP-120], EAX ;  Uk1
  226| 0007C5 88                                        
;  Source Line # 227
  227| 0007C6 EB                          JMP    SHORT L91 
  227| 0007C7 48                                        
  227|                 L92:                             
;  Source Line # 228
;  Source Line # 230
  230| 0007C8 8B95                        MOV    EDX, [EBP-156] ; Spill
  230| 0007CA 64FFFFFF                                  
  230| 0007CE 8B42                        MOV    EAX, [EDX+48] 
  230| 0007D0 30                                        
  230| 0007D1 8B98                        MOV    EBX, [EAX-136] ;  A
  230| 0007D3 78FFFFFF                                  
  230| 0007D7 8B4D                        MOV    ECX, [EBP-116] ;  Uk2
  230| 0007D9 8C                                        
  230| 0007DA 83F9                        CMP    ECX, 1 
  230| 0007DC 01                                        
  230|                 L164:                            
  230| 0007DD 0F8C                        JL     L165   
  230| 0007DF BA020000                                  
  230| 0007E3 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  230| 0007E5 00000000                                  
  230| 0007E9 0F8F                        JG     L165   
  230| 0007EB AE020000                                  
  230| 0007EF 8B75                        MOV    ESI, [EBP-112] ;  Tv
  230| 0007F1 90                                        
  230| 0007F2 8B7D                        MOV    EDI, [EBP-20] 
  230| 0007F4 EC                                        
  230| 0007F5 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  230| 0007F7 00000000                                  
  230|                 L166:                            
  230| 0007FB 0F8F                        JG     L167   
  230| 0007FD A8020000                                  
  230| 000801 8B548B                      MOV    EDX, [EBX+4*ECX-4] 
  230| 000804 FC                                        
  230| 000805 8954BE                      MOV    [ESI+4*EDI-4], EDX 
  230| 000808 FC                                        
;  Source Line # 231
  231| 000809 8B45                        MOV    EAX, [EBP-116] ;  Uk2
  231| 00080B 8C                                        
  231| 00080C 40                          INC    EAX    
  231| 00080D 8945                        MOV    [EBP-116], EAX ;  Uk2
  231| 00080F 8C                                        
;  Source Line # 232
;  Source Line # 233
  233|                 L91:                             
;  Source Line # 234
  234| 000810 8B45                        MOV    EAX, [EBP-24] 
  234| 000812 E8                                        
  234| 000813 3945                        CMP    [EBP-20], EAX 
  234| 000815 EC                                        
  234| 000816 74                          JE     SHORT L88 
  234| 000817 0C                                        
  234| 000818 8B45                        MOV    EAX, [EBP-20] 
  234| 00081A EC                                        
  234| 00081B 40                          INC    EAX    
  234| 00081C 8945                        MOV    [EBP-20], EAX 
  234| 00081E EC                                        
  234| 00081F E9                          JMP    L90    
  234| 000820 ECFEFFFF                                  
  234|                 L88:                             
  234| 000824 8B05                        MOV    EAX, package1.n 
  234| 000826 00000000                                  
  234| 00082A 8945                        MOV    [EBP-16], EAX 
  234| 00082C F0                                        
;  Source Line # 236
  236| 00082D 837D                        CMP    DWORD PTR [EBP-16], 0 
  236| 00082F F0                                        
  236| 000830 00                                        
  236| 000831 7E                          JLE    SHORT L95 
  236| 000832 50                                        
  236| 000833 C745                        MOV    DWORD PTR [EBP-12], 1 
  236| 000835 F4                                        
  236| 000836 01000000                                  
  236|                 L97:                             
;  Source Line # 237
  237| 00083A 8B45                        MOV    EAX, [EBP-112] ;  Tv
  237| 00083C 90                                        
  237| 00083D 8B5D                        MOV    EBX, [EBP-12] 
  237| 00083F F4                                        
  237| 000840 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
  237| 000842 00000000                                  
  237|                 L168:                            
  237| 000846 0F8F                        JG     L169   
  237| 000848 69020000                                  
  237| 00084C 8B95                        MOV    EDX, [EBP-156] ; Spill
  237| 00084E 64FFFFFF                                  
  237| 000852 8B4A                        MOV    ECX, [EDX+48] 
  237| 000854 30                                        
  237| 000855 8BB1                        MOV    ESI, [ECX-136] ;  A
  237| 000857 78FFFFFF                                  
  237| 00085B 8B7D                        MOV    EDI, [EBP-12] 
  237| 00085D F4                                        
  237| 00085E 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  237| 000860 00000000                                  
  237|                 L170:                            
  237| 000864 0F8F                        JG     L171   
  237| 000866 57020000                                  
  237| 00086A 8B4498                      MOV    EAX, [EAX+4*EBX-4] 
  237| 00086D FC                                        
  237| 00086E 8944BE                      MOV    [ESI+4*EDI-4], EAX 
  237| 000871 FC                                        
;  Source Line # 238
  238| 000872 8B5D                        MOV    EBX, [EBP-16] 
  238| 000874 F0                                        
  238| 000875 395D                        CMP    [EBP-12], EBX 
  238| 000877 F4                                        
  238| 000878 74                          JE     SHORT L95 
  238| 000879 09                                        
  238| 00087A 8B45                        MOV    EAX, [EBP-12] 
  238| 00087C F4                                        
  238| 00087D 40                          INC    EAX    
  238| 00087E 8945                        MOV    [EBP-12], EAX 
  238| 000880 F4                                        
  238| 000881 EB                          JMP    SHORT L97 
  238| 000882 B7                                        
  238|                 L95:                             
;  Source Line # 240
  240| 000883 833D                        CMP    DWORD PTR package1.n, 24 
  240| 000885 00000000                                  
  240| 000889 18                                        
  240| 00088A 7D                          JGE    SHORT L100 
  240| 00088B 15                                        
;  Source Line # 241
  241| 00088C 8B95                        MOV    EDX, [EBP-156] ; Spill
  241| 00088E 64FFFFFF                                  
  241| 000892 8B42                        MOV    EAX, [EDX+48] 
  241| 000894 30                                        
  241| 000895 8B98                        MOV    EBX, [EAX-136] ;  A
  241| 000897 78FFFFFF                                  
  241| 00089B 53                          PUSH   EBX    
  241| 00089C E8                          CALL   package1.vec_print 
  241| 00089D 00000000                                  
;  Source Line # 242
  242|                 L100:                            
;  Source Line # 244
  244| 0008A1 8D45                        LEA    EAX, [EBP-8] 
  244| 0008A3 F8                                        
  244| 0008A4 50                          PUSH   EAX    
  244| 0008A5 E8                          CALL   ada.calendar.clock 
  244| 0008A6 00000000                                  
  244| 0008AA 8B95                        MOV    EDX, [EBP-156] ; Spill
  244| 0008AC 64FFFFFF                                  
  244| 0008B0 8B5A                        MOV    EBX, [EDX+48] 
  244| 0008B2 30                                        
  244| 0008B3 8D30                        LEA    ESI, [EAX+0] 
  244| 0008B5 8D7B                        LEA    EDI, [EBX-116] ;  time2
  244| 0008B7 8C                                        
  244| 0008B8 A5                          MOVSD         
  244| 0008B9 A5                          MOVSD         
;  Source Line # 245
  245| 0008BA 8B4A                        MOV    ECX, [EDX+48] 
  245| 0008BC 30                                        
  245| 0008BD 8D49                        LEA    ECX, [ECX-124] ;  time1
  245| 0008BF 84                                        
  245| 0008C0 51                          PUSH   ECX    
  245| 0008C1 8B42                        MOV    EAX, [EDX+48] 
  245| 0008C3 30                                        
  245| 0008C4 8D40                        LEA    EAX, [EAX-116] ;  time2
  245| 0008C6 8C                                        
  245| 0008C7 50                          PUSH   EAX    
  245| 0008C8 E8                          CALL   ada.calendar.-__2 
  245| 0008C9 00000000                                  
  245| 0008CD 8B95                        MOV    EDX, [EBP-156] ; Spill
  245| 0008CF 64FFFFFF                                  
  245| 0008D3 8B5A                        MOV    EBX, [EDX+48] 
  245| 0008D5 30                                        
  245| 0008D6 8943                        MOV    [EBX-128], EAX ;  Time_all
  245| 0008D8 80                                        
;  Source Line # 246
  246| 0008D9 0FB635                      MOVZX  ESI, BYTE PTR ada.integer_text_io.default_base
  246| 0008DC 00000000                                  
  246| 0008E0 56                          PUSH   ESI    
  246| 0008E1 FF35                        PUSH   DWORD PTR ada.integer_text_io.default_width 
  246| 0008E3 00000000                                  
  246| 0008E7 8B7A                        MOV    EDI, [EDX+48] 
  246| 0008E9 30                                        
  246| 0008EA B9                          MOV    ECX, 16384 
  246| 0008EB 00400000                                  
  246| 0008EF 8B47                        MOV    EAX, [EDI-128] ;  Time_all
  246| 0008F1 80                                        
  246| 0008F2 99                          CDQ           
  246| 0008F3 F7F9                        IDIV   ECX    
  246| 0008F5 8BDA                        MOV    EBX, EDX 
  246| 0008F7 33D9                        XOR    EBX, ECX 
  246| 0008F9 C1FB                        SAR    EBX, 30 
  246| 0008FB 1E                                        
  246| 0008FC 83E3                        AND    EBX, -2 
  246| 0008FE FE                                        
  246| 0008FF 83CB                        OR     EBX, 1 
  246| 000901 01                                        
  246| 000902 0BD2                        OR     EDX, EDX 
  246| 000904 7D                          JGE    SHORT L172 
  246| 000905 02                                        
  246| 000906 F7DA                        NEG    EDX    
  246|                 L172:                            
  246| 000908 D1E2                        SHL    EDX, 1 
  246| 00090A 0BC9                        OR     ECX, ECX 
  246| 00090C 7D                          JGE    SHORT L173 
  246| 00090D 02                                        
  246| 00090E F7D9                        NEG    ECX    
  246|                 L173:                            
  246| 000910 0BD2                        OR     EDX, EDX 
  246| 000912 74                          JE     SHORT L174 
  246| 000913 06                                        
  246| 000914 3BCA                        CMP    ECX, EDX 
  246| 000916 77                          JA     SHORT L174 
  246| 000917 02                                        
  246| 000918 03C3                        ADD    EAX, EBX 
  246|                 L174:                            
  246| 00091A 50                          PUSH   EAX    
  246| 00091B E8                          CALL   ada.integer_text_io.put__2 
  246| 00091C 00000000                                  
;  Source Line # 248
  248| 000920 68                          PUSH   __lcl.00000246 
  248| 000921 00000000                                  
  248| 000925 68                          PUSH   __lcl.00000245 
  248| 000926 00000000                                  
  248| 00092A E8                          CALL   ada.text_io.put_line__2 
  248| 00092B 00000000                                  
  248| 00092F 8DB5                        LEA    ESI, [EBP-140] ;  dyn_temp
  248| 000931 74FFFFFF                                  
  248| 000935 56                          PUSH   ESI    
  248| 000936 E8                          CALL   rts_ss_release 
  248| 000937 00000000                                  
;  Source Line # 249
  249| 00093B 8BE5                        MOV    ESP, EBP 
  249| 00093D 5D                          POP    EBP    
  249| 00093E C2                          RET    4      
  249| 00093F 0400                                      
  249|                 L107:                            
  249| 000941 8D05                        LEA    EAX, L106+5 
  249| 000943 EA010000                                  
  249| 000947 50                          PUSH   EAX    
  249| 000948 E9                          JMP    rts_raise_constraint_error 
  249| 000949 00000000                                  
  249|                 L109:                            
  249| 00094D 8D05                        LEA    EAX, L108+5 
  249| 00094F 03020000                                  
  249| 000953 50                          PUSH   EAX    
  249| 000954 E9                          JMP    rts_raise_constraint_error 
  249| 000955 00000000                                  
  249|                 L111:                            
  249| 000959 8D05                        LEA    EAX, L110+5 
  249| 00095B 21020000                                  
  249| 00095F 50                          PUSH   EAX    
  249| 000960 E9                          JMP    rts_raise_constraint_error 
  249| 000961 00000000                                  
  249|                 L113:                            
  249| 000965 8D05                        LEA    EAX, L112+5 
  249| 000967 3A020000                                  
  249| 00096B 50                          PUSH   EAX    
  249| 00096C E9                          JMP    rts_raise_constraint_error 
  249| 00096D 00000000                                  
  249|                 L115:                            
  249| 000971 8D05                        LEA    EAX, L114+5 
  249| 000973 7E020000                                  
  249| 000977 50                          PUSH   EAX    
  249| 000978 E9                          JMP    rts_raise_constraint_error 
  249| 000979 00000000                                  
  249|                 L117:                            
  249| 00097D 8D05                        LEA    EAX, L116+5 
  249| 00097F 97020000                                  
  249| 000983 50                          PUSH   EAX    
  249| 000984 E9                          JMP    rts_raise_constraint_error 
  249| 000985 00000000                                  
  249|                 L119:                            
  249| 000989 8D05                        LEA    EAX, L118+5 
  249| 00098B 1D030000                                  
  249| 00098F 50                          PUSH   EAX    
  249| 000990 E9                          JMP    rts_raise_constraint_error 
  249| 000991 00000000                                  
  249|                 L121:                            
  249| 000995 8D05                        LEA    EAX, L120+5 
  249| 000997 2F030000                                  
  249| 00099B 50                          PUSH   EAX    
  249| 00099C E9                          JMP    rts_raise_constraint_error 
  249| 00099D 00000000                                  
  249|                 L123:                            
  249| 0009A1 8D05                        LEA    EAX, L122+5 
  249| 0009A3 48030000                                  
  249| 0009A7 50                          PUSH   EAX    
  249| 0009A8 E9                          JMP    rts_raise_constraint_error 
  249| 0009A9 00000000                                  
  249|                 L125:                            
  249| 0009AD 8D05                        LEA    EAX, L124+5 
  249| 0009AF 96030000                                  
  249| 0009B3 50                          PUSH   EAX    
  249| 0009B4 E9                          JMP    rts_raise_constraint_error 
  249| 0009B5 00000000                                  
  249|                 L127:                            
  249| 0009B9 8D05                        LEA    EAX, L126+5 
  249| 0009BB C1030000                                  
  249| 0009BF 50                          PUSH   EAX    
  249| 0009C0 E9                          JMP    rts_raise_constraint_error 
  249| 0009C1 00000000                                  
  249|                 L129:                            
  249| 0009C5 8D05                        LEA    EAX, L128+5 
  249| 0009C7 35040000                                  
  249| 0009CB 50                          PUSH   EAX    
  249| 0009CC E9                          JMP    rts_raise_constraint_error 
  249| 0009CD 00000000                                  
  249|                 L131:                            
  249| 0009D1 8D05                        LEA    EAX, L130+5 
  249| 0009D3 4D040000                                  
  249| 0009D7 50                          PUSH   EAX    
  249| 0009D8 E9                          JMP    rts_raise_constraint_error 
  249| 0009D9 00000000                                  
  249|                 L133:                            
  249| 0009DD 8D05                        LEA    EAX, L132+5 
  249| 0009DF 79040000                                  
  249| 0009E3 50                          PUSH   EAX    
  249| 0009E4 E9                          JMP    rts_raise_constraint_error 
  249| 0009E5 00000000                                  
  249|                 L135:                            
  249| 0009E9 8D05                        LEA    EAX, L134+5 
  249| 0009EB 9B040000                                  
  249| 0009EF 50                          PUSH   EAX    
  249| 0009F0 E9                          JMP    rts_raise_constraint_error 
  249| 0009F1 00000000                                  
  249|                 L137:                            
  249| 0009F5 8D05                        LEA    EAX, L136+5 
  249| 0009F7 B9040000                                  
  249| 0009FB 50                          PUSH   EAX    
  249| 0009FC E9                          JMP    rts_raise_constraint_error 
  249| 0009FD 00000000                                  
  249|                 L139:                            
  249| 000A01 8D05                        LEA    EAX, L138+5 
  249| 000A03 D9040000                                  
  249| 000A07 50                          PUSH   EAX    
  249| 000A08 E9                          JMP    rts_raise_constraint_error 
  249| 000A09 00000000                                  
  249|                 L141:                            
  249| 000A0D 8D05                        LEA    EAX, L140+5 
  249| 000A0F 7C050000                                  
  249| 000A13 50                          PUSH   EAX    
  249| 000A14 E9                          JMP    rts_raise_constraint_error 
  249| 000A15 00000000                                  
  249|                 L143:                            
  249| 000A19 8D05                        LEA    EAX, L142+5 
  249| 000A1B 9D050000                                  
  249| 000A1F 50                          PUSH   EAX    
  249| 000A20 E9                          JMP    rts_raise_constraint_error 
  249| 000A21 00000000                                  
  249|                 L145:                            
  249| 000A25 8D05                        LEA    EAX, L144+5 
  249| 000A27 E6050000                                  
  249| 000A2B 50                          PUSH   EAX    
  249| 000A2C E9                          JMP    rts_raise_constraint_error 
  249| 000A2D 00000000                                  
  249|                 L147:                            
  249| 000A31 8D05                        LEA    EAX, L146+5 
  249| 000A33 F8050000                                  
  249| 000A37 50                          PUSH   EAX    
  249| 000A38 E9                          JMP    rts_raise_constraint_error 
  249| 000A39 00000000                                  
  249|                 L149:                            
  249| 000A3D 8D05                        LEA    EAX, L148+5 
  249| 000A3F 25060000                                  
  249| 000A43 50                          PUSH   EAX    
  249| 000A44 E9                          JMP    rts_raise_constraint_error 
  249| 000A45 00000000                                  
  249|                 L151:                            
  249| 000A49 8D05                        LEA    EAX, L150+5 
  249| 000A4B 43060000                                  
  249| 000A4F 50                          PUSH   EAX    
  249| 000A50 E9                          JMP    rts_raise_constraint_error 
  249| 000A51 00000000                                  
  249|                 L153:                            
  249| 000A55 8D05                        LEA    EAX, L152+5 
  249| 000A57 91060000                                  
  249| 000A5B 50                          PUSH   EAX    
  249| 000A5C E9                          JMP    rts_raise_constraint_error 
  249| 000A5D 00000000                                  
  249|                 L155:                            
  249| 000A61 8D05                        LEA    EAX, L154+5 
  249| 000A63 AF060000                                  
  249| 000A67 50                          PUSH   EAX    
  249| 000A68 E9                          JMP    rts_raise_constraint_error 
  249| 000A69 00000000                                  
  249|                 L157:                            
  249| 000A6D 8D05                        LEA    EAX, L156+5 
  249| 000A6F 36070000                                  
  249| 000A73 50                          PUSH   EAX    
  249| 000A74 E9                          JMP    rts_raise_constraint_error 
  249| 000A75 00000000                                  
  249|                 L159:                            
  249| 000A79 8D05                        LEA    EAX, L158+5 
  249| 000A7B 57070000                                  
  249| 000A7F 50                          PUSH   EAX    
  249| 000A80 E9                          JMP    rts_raise_constraint_error 
  249| 000A81 00000000                                  
  249|                 L161:                            
  249| 000A85 8D05                        LEA    EAX, L160+5 
  249| 000A87 A3070000                                  
  249| 000A8B 50                          PUSH   EAX    
  249| 000A8C E9                          JMP    rts_raise_constraint_error 
  249| 000A8D 00000000                                  
  249|                 L163:                            
  249| 000A91 8D05                        LEA    EAX, L162+5 
  249| 000A93 B5070000                                  
  249| 000A97 50                          PUSH   EAX    
  249| 000A98 E9                          JMP    rts_raise_constraint_error 
  249| 000A99 00000000                                  
  249|                 L165:                            
  249| 000A9D 8D05                        LEA    EAX, L164+5 
  249| 000A9F E2070000                                  
  249| 000AA3 50                          PUSH   EAX    
  249| 000AA4 E9                          JMP    rts_raise_constraint_error 
  249| 000AA5 00000000                                  
  249|                 L167:                            
  249| 000AA9 8D05                        LEA    EAX, L166+5 
  249| 000AAB 00080000                                  
  249| 000AAF 50                          PUSH   EAX    
  249| 000AB0 E9                          JMP    rts_raise_constraint_error 
  249| 000AB1 00000000                                  
  249|                 L169:                            
  249| 000AB5 8D05                        LEA    EAX, L168+5 
  249| 000AB7 4B080000                                  
  249| 000ABB 50                          PUSH   EAX    
  249| 000ABC E9                          JMP    rts_raise_constraint_error 
  249| 000ABD 00000000                                  
  249|                 L171:                            
  249| 000AC1 8D05                        LEA    EAX, L170+5 
  249| 000AC3 69080000                                  
  249| 000AC7 50                          PUSH   EAX    
  249| 000AC8 E9                          JMP    rts_raise_constraint_error 
  249| 000AC9 00000000                                  
                       ;                                
                       lab4.start.t1__body ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000452     DD     00005301 
                                          DD     00000091 
                                          DD     lab4.start.t1__body 
                                          DD     __lcl.00000467 
                                          DD     00000093 
                                          DD     lab4.start.t1__body+00000013H 
                                          DD     __lcl.00000467 
                                          DD     00000094 
                                          DD     lab4.start.t1__body+00000066H 
                                          DD     __lcl.00000467 
                                          DD     00000096 
                                          DD     lab4.start.t1__body+00000088H 
                                          DD     __lcl.00000467 
                                          DD     00000097 
                                          DD     lab4.start.t1__body+000000A8H 
                                          DD     __lcl.00000467 
                                          DD     00000098 
                                          DD     lab4.start.t1__body+000000ADH 
                                          DD     __lcl.00000467 
                                          DD     0000009B 
                                          DD     lab4.start.t1__body+000000BCH 
                                          DD     __lcl.00000467 
                                          DD     0000009C 
                                          DD     lab4.start.t1__body+000000C6H 
                                          DD     __lcl.00000467 
                                          DD     0000009D 
                                          DD     lab4.start.t1__body+000000EAH 
                                          DD     __lcl.00000467 
                                          DD     0000009F 
                                          DD     lab4.start.t1__body+000000FFH 
                                          DD     __lcl.00000467 
                                          DD     000000A1 
                                          DD     lab4.start.t1__body+00000118H 
                                          DD     __lcl.00000467 
                                          DD     000000A3 
                                          DD     lab4.start.t1__body+00000130H 
                                          DD     __lcl.00000467 
                                          DD     000000A4 
                                          DD     lab4.start.t1__body+00000154H 
                                          DD     __lcl.00000467 
                                          DD     000000A6 
                                          DD     lab4.start.t1__body+0000017EH 
                                          DD     __lcl.00000467 
                                          DD     000000A7 
                                          DD     lab4.start.t1__body+00000198H 
                                          DD     __lcl.00000467 
                                          DD     000000A8 
                                          DD     lab4.start.t1__body+000001A9H 
                                          DD     __lcl.00000467 
                                          DD     000000A9 
                                          DD     lab4.start.t1__body+000001BCH 
                                          DD     __lcl.00000467 
                                          DD     000000AA 
                                          DD     lab4.start.t1__body+000001CDH 
                                          DD     __lcl.00000467 
                                          DD     000000AB 
                                          DD     lab4.start.t1__body+00000259H 
                                          DD     __lcl.00000467 
                                          DD     000000AC 
                                          DD     lab4.start.t1__body+0000026DH 
                                          DD     __lcl.00000467 
                                          DD     000000AD 
                                          DD     lab4.start.t1__body+000002AAH 
                                          DD     __lcl.00000467 
                                          DD     000000AE 
                                          DD     lab4.start.t1__body+000002BEH 
                                          DD     __lcl.00000467 
                                          DD     000000AF 
                                          DD     lab4.start.t1__body+000002D2H 
                                          DD     __lcl.00000467 
                                          DD     000000B0 
                                          DD     lab4.start.t1__body+000002E5H 
                                          DD     __lcl.00000467 
                                          DD     000000B1 
                                          DD     lab4.start.t1__body+000002FFH 
                                          DD     __lcl.00000467 
                                          DD     000000B2 
                                          DD     lab4.start.t1__body+0000030CH 
                                          DD     __lcl.00000467 
                                          DD     000000B3 
                                          DD     lab4.start.t1__body+00000368H 
                                          DD     __lcl.00000467 
                                          DD     000000B4 
                                          DD     lab4.start.t1__body+00000379H 
                                          DD     __lcl.00000467 
                                          DD     000000B5 
                                          DD     lab4.start.t1__body+000003C6H 
                                          DD     __lcl.00000467 
                                          DD     000000B6 
                                          DD     lab4.start.t1__body+000003D0H 
                                          DD     __lcl.00000467 
                                          DD     000000B7 
                                          DD     lab4.start.t1__body+000003EDH 
                                          DD     __lcl.00000467 
                                          DD     000000B8 
                                          DD     lab4.start.t1__body+00000407H 
                                          DD     __lcl.00000467 
                                          DD     000000B9 
                                          DD     lab4.start.t1__body+00000418H 
                                          DD     __lcl.00000467 
                                          DD     000000BB 
                                          DD     lab4.start.t1__body+0000045CH 
                                          DD     __lcl.00000467 
                                          DD     000000BC 
                                          DD     lab4.start.t1__body+00000484H 
                                          DD     __lcl.00000467 
                                          DD     000000BD 
                                          DD     lab4.start.t1__body+000004C2H 
                                          DD     __lcl.00000467 
                                          DD     000000BE 
                                          DD     lab4.start.t1__body+000004E4H 
                                          DD     __lcl.00000467 
                                          DD     000000BF 
                                          DD     lab4.start.t1__body+000004E4H 
                                          DD     __lcl.00000467 
                                          DD     000000C0 
                                          DD     lab4.start.t1__body+000004E4H 
                                          DD     __lcl.00000467 
                                          DD     000000C1 
                                          DD     lab4.start.t1__body+000004F8H 
                                          DD     __lcl.00000467 
                                          DD     000000C3 
                                          DD     lab4.start.t1__body+0000050CH 
                                          DD     __lcl.00000467 
                                          DD     000000C5 
                                          DD     lab4.start.t1__body+00000524H 
                                          DD     __lcl.00000467 
                                          DD     000000C6 
                                          DD     lab4.start.t1__body+0000052BH 
                                          DD     __lcl.00000467 
                                          DD     000000C8 
                                          DD     lab4.start.t1__body+00000542H 
                                          DD     __lcl.00000467 
                                          DD     000000C9 
                                          DD     lab4.start.t1__body+00000553H 
                                          DD     __lcl.00000467 
                                          DD     000000CB 
                                          DD     lab4.start.t1__body+000005C9H 
                                          DD     __lcl.00000467 
                                          DD     000000CC 
                                          DD     lab4.start.t1__body+00000601H 
                                          DD     __lcl.00000467 
                                          DD     000000CD 
                                          DD     lab4.start.t1__body+00000609H 
                                          DD     __lcl.00000467 
                                          DD     000000CE 
                                          DD     lab4.start.t1__body+0000060BH 
                                          DD     __lcl.00000467 
                                          DD     000000D0 
                                          DD     lab4.start.t1__body+0000060BH 
                                          DD     __lcl.00000467 
                                          DD     000000D1 
                                          DD     lab4.start.t1__body+0000064CH 
                                          DD     __lcl.00000467 
                                          DD     000000D2 
                                          DD     lab4.start.t1__body+00000653H 
                                          DD     __lcl.00000467 
                                          DD     000000D3 
                                          DD     lab4.start.t1__body+00000653H 
                                          DD     __lcl.00000467 
                                          DD     000000D4 
                                          DD     lab4.start.t1__body+00000653H 
                                          DD     __lcl.00000467 
                                          DD     000000D5 
                                          DD     lab4.start.t1__body+00000673H 
                                          DD     __lcl.00000467 
                                          DD     000000D6 
                                          DD     lab4.start.t1__body+00000680H 
                                          DD     __lcl.00000467 
                                          DD     000000D7 
                                          DD     lab4.start.t1__body+000006B8H 
                                          DD     __lcl.00000467 
                                          DD     000000D9 
                                          DD     lab4.start.t1__body+000006C9H 
                                          DD     __lcl.00000467 
                                          DD     000000DB 
                                          DD     lab4.start.t1__body+000006E1H 
                                          DD     __lcl.00000467 
                                          DD     000000DC 
                                          DD     lab4.start.t1__body+000006E8H 
                                          DD     __lcl.00000467 
                                          DD     000000DE 
                                          DD     lab4.start.t1__body+000006FFH 
                                          DD     __lcl.00000467 
                                          DD     000000DF 
                                          DD     lab4.start.t1__body+00000710H 
                                          DD     __lcl.00000467 
                                          DD     000000E1 
                                          DD     lab4.start.t1__body+00000786H 
                                          DD     __lcl.00000467 
                                          DD     000000E2 
                                          DD     lab4.start.t1__body+000007BEH 
                                          DD     __lcl.00000467 
                                          DD     000000E3 
                                          DD     lab4.start.t1__body+000007C6H 
                                          DD     __lcl.00000467 
                                          DD     000000E4 
                                          DD     lab4.start.t1__body+000007C8H 
                                          DD     __lcl.00000467 
                                          DD     000000E6 
                                          DD     lab4.start.t1__body+000007C8H 
                                          DD     __lcl.00000467 
                                          DD     000000E7 
                                          DD     lab4.start.t1__body+00000809H 
                                          DD     __lcl.00000467 
                                          DD     000000E8 
                                          DD     lab4.start.t1__body+00000810H 
                                          DD     __lcl.00000467 
                                          DD     000000E9 
                                          DD     lab4.start.t1__body+00000810H 
                                          DD     __lcl.00000467 
                                          DD     000000EA 
                                          DD     lab4.start.t1__body+00000810H 
                                          DD     __lcl.00000467 
                                          DD     000000EC 
                                          DD     lab4.start.t1__body+0000082DH 
                                          DD     __lcl.00000467 
                                          DD     000000ED 
                                          DD     lab4.start.t1__body+0000083AH 
                                          DD     __lcl.00000467 
                                          DD     000000EE 
                                          DD     lab4.start.t1__body+00000872H 
                                          DD     __lcl.00000467 
                                          DD     000000F0 
                                          DD     lab4.start.t1__body+00000883H 
                                          DD     __lcl.00000467 
                                          DD     000000F1 
                                          DD     lab4.start.t1__body+0000088CH 
                                          DD     __lcl.00000467 
                                          DD     000000F2 
                                          DD     lab4.start.t1__body+000008A1H 
                                          DD     __lcl.00000467 
                                          DD     000000F4 
                                          DD     lab4.start.t1__body+000008A1H 
                                          DD     __lcl.00000467 
                                          DD     000000F5 
                                          DD     lab4.start.t1__body+000008BAH 
                                          DD     __lcl.00000467 
                                          DD     000000F6 
                                          DD     lab4.start.t1__body+000008D9H 
                                          DD     __lcl.00000467 
                                          DD     000000F8 
                                          DD     lab4.start.t1__body+00000920H 
                                          DD     __lcl.00000467 
                                          DD     000000F9 
                                          DD     lab4.start.t1__body+0000093BH 
                                          DD     __lcl.00000467 
                                          DD     000000F9 
                                          DD     lab4.start.t1__body+00000AC9H 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 1000

                       ;                                
                       ;  Start of procedure lab4.start.t2__body   
                       ;                                
                                          PUBLIC lab4.start.t2__body 
                       lab4.start.t2__body PROC  NEAR   
;  Source Line # 252
  252| 000000 64                          FS:           
  252| 000001 8B15                        MOV    EDX, 4 
  252| 000003 04000000                                  
  252| 000007 8B52                        MOV    EDX, [EDX-4] 
  252| 000009 FC                                        
  252| 00000A 55                          PUSH   EBP    
  252| 00000B 8BEC                        MOV    EBP, ESP 
  252| 00000D 81EC                        SUB    ESP, 136 
  252| 00000F 88000000                                  
;  Source Line # 254
  254| 000013 8B02                        MOV    EAX, [EDX+0] 
  254| 000015 8945                        MOV    [EBP-112], EAX ;  dyn_temp
  254| 000017 90                                        
  254| 000018 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  254| 00001A 00000000                                  
  254| 00001E 83EB                        SUB    EBX, 1 
  254| 000020 01                                        
  254| 000021 7D                          JGE    SHORT L76 
  254| 000022 03                                        
  254| 000023 33DB                        XOR    EBX, EBX 
  254| 000025 4B                          DEC    EBX    
  254|                 L76:                             
  254| 000026 CE                          INTO          
  254| 000027 43                          INC    EBX    
  254| 000028 CE                          INTO          
  254| 000029 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  254| 00002C 00000000                                  
  254| 000030 CE                          INTO          
  254| 000031 53                          PUSH   EBX    
  254| 000032 8995                        MOV    [EBP-136], EDX ; Spill
  254| 000034 78FFFFFF                                  
  254| 000038 E8                          CALL   rts_ss_allocate 
  254| 000039 00000000                                  
  254| 00003D 8945                        MOV    [EBP-108], EAX ;  MO2
  254| 00003F 94                                        
  254| 000040 8B0D                        MOV    ECX, package1.vec__constrained_array____1 
  254| 000042 00000000                                  
  254| 000046 83E9                        SUB    ECX, 1 
  254| 000048 01                                        
  254| 000049 7D                          JGE    SHORT L77 
  254| 00004A 03                                        
  254| 00004B 33C9                        XOR    ECX, ECX 
  254| 00004D 49                          DEC    ECX    
  254|                 L77:                             
  254| 00004E CE                          INTO          
  254| 00004F 41                          INC    ECX    
  254| 000050 CE                          INTO          
  254| 000051 D1E1                        SHL    ECX, 1 
  254| 000053 CE                          INTO          
  254| 000054 D1E1                        SHL    ECX, 1 
  254| 000056 CE                          INTO          
  254| 000057 51                          PUSH   ECX    
  254| 000058 E8                          CALL   rts_ss_allocate 
  254| 000059 00000000                                  
  254| 00005D 8945                        MOV    [EBP-100], EAX ;  D2
  254| 00005F 9C                                        
;  Source Line # 255
  255| 000060 8B35                        MOV    ESI, package1.matr__constrained_array____1 
  255| 000062 00000000                                  
  255| 000066 83EE                        SUB    ESI, 1 
  255| 000068 01                                        
  255| 000069 7D                          JGE    SHORT L78 
  255| 00006A 03                                        
  255| 00006B 33F6                        XOR    ESI, ESI 
  255| 00006D 4E                          DEC    ESI    
  255|                 L78:                             
  255| 00006E CE                          INTO          
  255| 00006F 46                          INC    ESI    
  255| 000070 CE                          INTO          
  255| 000071 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  255| 000074 00000000                                  
  255| 000078 CE                          INTO          
  255| 000079 56                          PUSH   ESI    
  255| 00007A E8                          CALL   rts_ss_allocate 
  255| 00007B 00000000                                  
  255| 00007F 8945                        MOV    [EBP-96], EAX ;  MTF
  255| 000081 A0                                        
;  Source Line # 256
  256| 000082 8B3D                        MOV    EDI, package1.vec__constrained_array____1 
  256| 000084 00000000                                  
  256| 000088 83EF                        SUB    EDI, 1 
  256| 00008A 01                                        
  256| 00008B 7D                          JGE    SHORT L79 
  256| 00008C 03                                        
  256| 00008D 33FF                        XOR    EDI, EDI 
  256| 00008F 4F                          DEC    EDI    
  256|                 L79:                             
  256| 000090 CE                          INTO          
  256| 000091 47                          INC    EDI    
  256| 000092 CE                          INTO          
  256| 000093 D1E7                        SHL    EDI, 1 
  256| 000095 CE                          INTO          
  256| 000096 D1E7                        SHL    EDI, 1 
  256| 000098 CE                          INTO          
  256| 000099 57                          PUSH   EDI    
  256| 00009A E8                          CALL   rts_ss_allocate 
  256| 00009B 00000000                                  
  256| 00009F 8945                        MOV    [EBP-92], EAX ;  Tv
  256| 0000A1 A4                                        
;  Source Line # 257
  257| 0000A2 E8                          CALL   rts_activation_succeeded 
  257| 0000A3 00000000                                  
;  Source Line # 258
  258| 0000A7 68                          PUSH   __lcl.00000259 
  258| 0000A8 00000000                                  
  258| 0000AC 68                          PUSH   __lcl.00000258 
  258| 0000AD 00000000                                  
  258| 0000B1 E8                          CALL   ada.text_io.put_line__2 
  258| 0000B2 00000000                                  
;  Source Line # 261
  261| 0000B6 8B95                        MOV    EDX, [EBP-136] ; Spill
  261| 0000B8 78FFFFFF                                  
  261| 0000BC 8B5A                        MOV    EBX, [EDX+48] 
  261| 0000BE 30                                        
  261| 0000BF 8B8B                        MOV    ECX, [EBX-140] ;  MT
  261| 0000C1 74FFFFFF                                  
  261| 0000C5 51                          PUSH   ECX    
  261| 0000C6 E8                          CALL   package1.matr_input 
  261| 0000C7 00000000                                  
;  Source Line # 262
  262| 0000CB 8B75                        MOV    ESI, [EBP-100] ;  D2
  262| 0000CD 9C                                        
  262| 0000CE 56                          PUSH   ESI    
  262| 0000CF E8                          CALL   package1.vec_input 
  262| 0000D0 00000000                                  
;  Source Line # 263
  263| 0000D4 8B7D                        MOV    EDI, [EBP-100] ;  D2
  263| 0000D6 9C                                        
  263| 0000D7 897D                        MOV    [EBP-88], EDI 
  263| 0000D9 A8                                        
  263| 0000DA 68                          PUSH   lab4.mon.setd 
  263| 0000DB 00000000                                  
  263| 0000DF 8D45                        LEA    EAX, [EBP-88] 
  263| 0000E1 A8                                        
  263| 0000E2 50                          PUSH   EAX    
  263| 0000E3 8B95                        MOV    EDX, [EBP-136] ; Spill
  263| 0000E5 78FFFFFF                                  
  263| 0000E9 8B5A                        MOV    EBX, [EDX+48] 
  263| 0000EB 30                                        
  263| 0000EC 8B4B                        MOV    ECX, [EBX-44] ;  MON
  263| 0000EE D4                                        
  263| 0000EF 51                          PUSH   ECX    
  263| 0000F0 E8                          CALL   rts_protected_procedure_call 
  263| 0000F1 00000000                                  
;  Source Line # 265
  265| 0000F5 68                          PUSH   lab4.mon.datasignal 
  265| 0000F6 00000000                                  
  265| 0000FA 6A                          PUSH   0      
  265| 0000FB 00                                        
  265| 0000FC 8B95                        MOV    EDX, [EBP-136] ; Spill
  265| 0000FE 78FFFFFF                                  
  265| 000102 8B72                        MOV    ESI, [EDX+48] 
  265| 000104 30                                        
  265| 000105 8B7E                        MOV    EDI, [ESI-44] ;  MON
  265| 000107 D4                                        
  265| 000108 57                          PUSH   EDI    
  265| 000109 E8                          CALL   rts_protected_procedure_call 
  265| 00010A 00000000                                  
;  Source Line # 267
  267| 00010E 6A                          PUSH   0      
  267| 00010F 00                                        
  267| 000110 6A                          PUSH   0      
  267| 000111 00                                        
  267| 000112 6A                          PUSH   0      
  267| 000113 00                                        
  267| 000114 8B95                        MOV    EDX, [EBP-136] ; Spill
  267| 000116 78FFFFFF                                  
  267| 00011A 8B42                        MOV    EAX, [EDX+48] 
  267| 00011C 30                                        
  267| 00011D 8B58                        MOV    EBX, [EAX-44] ;  MON
  267| 00011F D4                                        
  267| 000120 53                          PUSH   EBX    
  267| 000121 E8                          CALL   rts_protected_entry_call 
  267| 000122 00000000                                  
;  Source Line # 269
  269| 000126 8B4D                        MOV    ECX, [EBP-108] ;  MO2
  269| 000128 94                                        
  269| 000129 894D                        MOV    [EBP-84], ECX 
  269| 00012B AC                                        
  269| 00012C 68                          PUSH   lab4.mon.getmo 
  269| 00012D 00000000                                  
  269| 000131 8D75                        LEA    ESI, [EBP-84] 
  269| 000133 AC                                        
  269| 000134 56                          PUSH   ESI    
  269| 000135 8B95                        MOV    EDX, [EBP-136] ; Spill
  269| 000137 78FFFFFF                                  
  269| 00013B 8B7A                        MOV    EDI, [EDX+48] 
  269| 00013D 30                                        
  269| 00013E 8B47                        MOV    EAX, [EDI-44] ;  MON
  269| 000140 D4                                        
  269| 000141 50                          PUSH   EAX    
  269| 000142 E8                          CALL   rts_entryless_protected_subp_call 
  269| 000143 00000000                                  
;  Source Line # 270
  270| 000147 8D5D                        LEA    EBX, [EBP-80] 
  270| 000149 B0                                        
  270| 00014A 895D                        MOV    [EBP-76], EBX 
  270| 00014C B4                                        
  270| 00014D 68                          PUSH   lab4.mon.getalfa 
  270| 00014E 00000000                                  
  270| 000152 8D4D                        LEA    ECX, [EBP-76] 
  270| 000154 B4                                        
  270| 000155 51                          PUSH   ECX    
  270| 000156 8B95                        MOV    EDX, [EBP-136] ; Spill
  270| 000158 78FFFFFF                                  
  270| 00015C 8B72                        MOV    ESI, [EDX+48] 
  270| 00015E 30                                        
  270| 00015F 8B7E                        MOV    EDI, [ESI-44] ;  MON
  270| 000161 D4                                        
  270| 000162 57                          PUSH   EDI    
  270| 000163 E8                          CALL   rts_entryless_protected_subp_call 
  270| 000164 00000000                                  
  270| 000168 8B45                        MOV    EAX, [EBP-80] 
  270| 00016A B0                                        
  270| 00016B 8945                        MOV    [EBP-104], EAX ;  alfa2
  270| 00016D 98                                        
  270| 00016E 8B1D                        MOV    EBX, package1.n 
  270| 000170 00000000                                  
  270| 000174 895D                        MOV    [EBP-72], EBX 
  270| 000176 B8                                        
;  Source Line # 272
  272| 000177 837D                        CMP    DWORD PTR [EBP-72], 0 
  272| 000179 B8                                        
  272| 00017A 00                                        
  272| 00017B 0F8E                        JLE    L39    
  272| 00017D 5C010000                                  
  272| 000181 C745                        MOV    DWORD PTR [EBP-68], 1 
  272| 000183 BC                                        
  272| 000184 01000000                                  
  272|                 L41:                             
  272| 000188 8B05                        MOV    EAX, package1.h 
  272| 00018A 00000000                                  
  272| 00018E 40                          INC    EAX    
  272| 00018F CE                          INTO          
  272| 000190 8945                        MOV    [EBP-64], EAX 
  272| 000192 C0                                        
  272| 000193 8B1D                        MOV    EBX, package1.h 
  272| 000195 00000000                                  
  272| 000199 D1E3                        SHL    EBX, 1 
  272| 00019B CE                          INTO          
  272| 00019C 895D                        MOV    [EBP-60], EBX 
  272| 00019E C4                                        
;  Source Line # 273
  273| 00019F 8B4D                        MOV    ECX, [EBP-60] 
  273| 0001A1 C4                                        
  273| 0001A2 394D                        CMP    [EBP-64], ECX 
  273| 0001A4 C0                                        
  273| 0001A5 0F8F                        JG     L42    
  273| 0001A7 1E010000                                  
  273| 0001AB 8B45                        MOV    EAX, [EBP-64] 
  273| 0001AD C0                                        
  273| 0001AE 8945                        MOV    [EBP-56], EAX 
  273| 0001B0 C8                                        
  273|                 L44:                             
;  Source Line # 274
  274| 0001B1 C745                        MOV    DWORD PTR [EBP-128], 0 ;  Sum1
  274| 0001B3 80                                        
  274| 0001B4 00000000                                  
  274| 0001B8 8B05                        MOV    EAX, package1.n 
  274| 0001BA 00000000                                  
  274| 0001BE 8945                        MOV    [EBP-52], EAX 
  274| 0001C0 CC                                        
;  Source Line # 275
  275| 0001C1 837D                        CMP    DWORD PTR [EBP-52], 0 
  275| 0001C3 CC                                        
  275| 0001C4 00                                        
  275| 0001C5 0F8E                        JLE    L45    
  275| 0001C7 A7000000                                  
  275| 0001CB C745                        MOV    DWORD PTR [EBP-48], 1 
  275| 0001CD D0                                        
  275| 0001CE 01000000                                  
  275|                 L47:                             
;  Source Line # 276
  276| 0001D2 8B95                        MOV    EDX, [EBP-136] ; Spill
  276| 0001D4 78FFFFFF                                  
  276| 0001D8 8B42                        MOV    EAX, [EDX+48] 
  276| 0001DA 30                                        
  276| 0001DB 8B98                        MOV    EBX, [EAX-140] ;  MT
  276| 0001DD 74FFFFFF                                  
  276| 0001E1 8B4D                        MOV    ECX, [EBP-48] 
  276| 0001E3 D0                                        
  276| 0001E4 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  276| 0001E6 00000000                                  
  276|                 L80:                             
  276| 0001EA 0F8F                        JG     L81    
  276| 0001EC 99030000                                  
  276| 0001F0 8D49                        LEA    ECX, [ECX-1] 
  276| 0001F2 FF                                        
  276| 0001F3 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  276| 0001F6 00000000                                  
  276| 0001FA 8B75                        MOV    ESI, [EBP-56] 
  276| 0001FC C8                                        
  276| 0001FD 83FE                        CMP    ESI, 1 
  276| 0001FF 01                                        
  276|                 L82:                             
  276| 000200 0F8C                        JL     L83    
  276| 000202 8F030000                                  
  276| 000206 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  276| 000208 00000000                                  
  276| 00020C 0F8F                        JG     L83    
  276| 00020E 83030000                                  
  276| 000212 8D34B5                      LEA    ESI, [4*ESI-4] 
  276| 000215 FCFFFFFF                                  
  276| 000219 03CE                        ADD    ECX, ESI 
  276| 00021B 8B7D                        MOV    EDI, [EBP-108] ;  MO2
  276| 00021D 94                                        
  276| 00021E 8B55                        MOV    EDX, [EBP-68] 
  276| 000220 BC                                        
  276| 000221 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  276| 000223 00000000                                  
  276|                 L84:                             
  276| 000227 0F8F                        JG     L85    
  276| 000229 74030000                                  
  276| 00022D 8D52                        LEA    EDX, [EDX-1] 
  276| 00022F FF                                        
  276| 000230 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  276| 000233 00000000                                  
  276| 000237 8B45                        MOV    EAX, [EBP-48] 
  276| 000239 D0                                        
  276| 00023A 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  276| 00023C 00000000                                  
  276|                 L86:                             
  276| 000240 0F8F                        JG     L87    
  276| 000242 67030000                                  
  276| 000246 8D0485                      LEA    EAX, [4*EAX-4] 
  276| 000249 FCFFFFFF                                  
  276| 00024D 03D0                        ADD    EDX, EAX 
  276| 00024F 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  276| 000252 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  276| 000256 CE                          INTO          
  276| 000257 035D                        ADD    EBX, [EBP-128] ;  Sum1
  276| 000259 80                                        
  276| 00025A CE                          INTO          
  276| 00025B 895D                        MOV    [EBP-128], EBX ;  Sum1
  276| 00025D 80                                        
;  Source Line # 277
  277| 00025E 8B75                        MOV    ESI, [EBP-52] 
  277| 000260 CC                                        
  277| 000261 3975                        CMP    [EBP-48], ESI 
  277| 000263 D0                                        
  277| 000264 74                          JE     SHORT L45 
  277| 000265 0C                                        
  277| 000266 8B45                        MOV    EAX, [EBP-48] 
  277| 000268 D0                                        
  277| 000269 40                          INC    EAX    
  277| 00026A 8945                        MOV    [EBP-48], EAX 
  277| 00026C D0                                        
  277| 00026D E9                          JMP    L47    
  277| 00026E 60FFFFFF                                  
  277|                 L45:                             
;  Source Line # 278
  278| 000272 8B45                        MOV    EAX, [EBP-96] ;  MTF
  278| 000274 A0                                        
  278| 000275 8B5D                        MOV    EBX, [EBP-68] 
  278| 000277 BC                                        
  278| 000278 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
  278| 00027A 00000000                                  
  278|                 L88:                             
  278| 00027E 0F8F                        JG     L89    
  278| 000280 35030000                                  
  278| 000284 8D5B                        LEA    EBX, [EBX-1] 
  278| 000286 FF                                        
  278| 000287 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  278| 00028A 00000000                                  
  278| 00028E 8B4D                        MOV    ECX, [EBP-56] 
  278| 000290 C8                                        
  278| 000291 83F9                        CMP    ECX, 1 
  278| 000293 01                                        
  278|                 L90:                             
  278| 000294 0F8C                        JL     L91    
  278| 000296 2B030000                                  
  278| 00029A 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  278| 00029C 00000000                                  
  278| 0002A0 0F8F                        JG     L91    
  278| 0002A2 1F030000                                  
  278| 0002A6 8D0C8D                      LEA    ECX, [4*ECX-4] 
  278| 0002A9 FCFFFFFF                                  
  278| 0002AD 03D9                        ADD    EBX, ECX 
  278| 0002AF 8B55                        MOV    EDX, [EBP-128] ;  Sum1
  278| 0002B1 80                                        
  278| 0002B2 891418                      MOV    [EAX+EBX+0], EDX 
;  Source Line # 279
  279| 0002B5 8B75                        MOV    ESI, [EBP-60] 
  279| 0002B7 C4                                        
  279| 0002B8 3975                        CMP    [EBP-56], ESI 
  279| 0002BA C8                                        
  279| 0002BB 74                          JE     SHORT L42 
  279| 0002BC 0C                                        
  279| 0002BD 8B45                        MOV    EAX, [EBP-56] 
  279| 0002BF C8                                        
  279| 0002C0 40                          INC    EAX    
  279| 0002C1 8945                        MOV    [EBP-56], EAX 
  279| 0002C3 C8                                        
  279| 0002C4 E9                          JMP    L44    
  279| 0002C5 E8FEFFFF                                  
  279|                 L42:                             
;  Source Line # 280
  280| 0002C9 8B45                        MOV    EAX, [EBP-72] 
  280| 0002CB B8                                        
  280| 0002CC 3945                        CMP    [EBP-68], EAX 
  280| 0002CE BC                                        
  280| 0002CF 74                          JE     SHORT L39 
  280| 0002D0 0C                                        
  280| 0002D1 8B45                        MOV    EAX, [EBP-68] 
  280| 0002D3 BC                                        
  280| 0002D4 40                          INC    EAX    
  280| 0002D5 8945                        MOV    [EBP-68], EAX 
  280| 0002D7 BC                                        
  280| 0002D8 E9                          JMP    L41    
  280| 0002D9 ABFEFFFF                                  
  280|                 L39:                             
;  Source Line # 281
  281| 0002DD C745                        MOV    DWORD PTR [EBP-128], 0 ;  Sum1
  281| 0002DF 80                                        
  281| 0002E0 00000000                                  
  281| 0002E4 8B05                        MOV    EAX, package1.h 
  281| 0002E6 00000000                                  
  281| 0002EA 40                          INC    EAX    
  281| 0002EB CE                          INTO          
  281| 0002EC 8945                        MOV    [EBP-44], EAX 
  281| 0002EE D4                                        
  281| 0002EF 8B1D                        MOV    EBX, package1.h 
  281| 0002F1 00000000                                  
  281| 0002F5 D1E3                        SHL    EBX, 1 
  281| 0002F7 CE                          INTO          
  281| 0002F8 895D                        MOV    [EBP-40], EBX 
  281| 0002FA D8                                        
;  Source Line # 282
  282| 0002FB 8B4D                        MOV    ECX, [EBP-40] 
  282| 0002FD D8                                        
  282| 0002FE 394D                        CMP    [EBP-44], ECX 
  282| 000300 D4                                        
  282| 000301 0F8F                        JG     L54    
  282| 000303 F9000000                                  
  282| 000307 8B45                        MOV    EAX, [EBP-44] 
  282| 000309 D4                                        
  282| 00030A 8945                        MOV    [EBP-36], EAX 
  282| 00030C DC                                        
  282|                 L56:                             
  282| 00030D 8B05                        MOV    EAX, package1.n 
  282| 00030F 00000000                                  
  282| 000313 8945                        MOV    [EBP-32], EAX 
  282| 000315 E0                                        
;  Source Line # 283
  283| 000316 837D                        CMP    DWORD PTR [EBP-32], 0 
  283| 000318 E0                                        
  283| 000319 00                                        
  283| 00031A 7E                          JLE    SHORT L57 
  283| 00031B 77                                        
  283| 00031C C745                        MOV    DWORD PTR [EBP-28], 1 
  283| 00031E E4                                        
  283| 00031F 01000000                                  
  283|                 L59:                             
;  Source Line # 284
  284| 000323 8B45                        MOV    EAX, [EBP-100] ;  D2
  284| 000325 9C                                        
  284| 000326 8B5D                        MOV    EBX, [EBP-28] 
  284| 000328 E4                                        
  284| 000329 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
  284| 00032B 00000000                                  
  284|                 L92:                             
  284| 00032F 0F8F                        JG     L93    
  284| 000331 9C020000                                  
  284| 000335 8B4D                        MOV    ECX, [EBP-96] ;  MTF
  284| 000337 A0                                        
  284| 000338 8B55                        MOV    EDX, [EBP-28] 
  284| 00033A E4                                        
  284| 00033B 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  284| 00033D 00000000                                  
  284|                 L94:                             
  284| 000341 0F8F                        JG     L95    
  284| 000343 96020000                                  
  284| 000347 8D52                        LEA    EDX, [EDX-1] 
  284| 000349 FF                                        
  284| 00034A 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  284| 00034D 00000000                                  
  284| 000351 8B75                        MOV    ESI, [EBP-36] 
  284| 000353 DC                                        
  284| 000354 83FE                        CMP    ESI, 1 
  284| 000356 01                                        
  284|                 L96:                             
  284| 000357 0F8C                        JL     L97    
  284| 000359 8C020000                                  
  284| 00035D 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  284| 00035F 00000000                                  
  284| 000363 0F8F                        JG     L97    
  284| 000365 80020000                                  
  284| 000369 8D34B5                      LEA    ESI, [4*ESI-4] 
  284| 00036C FCFFFFFF                                  
  284| 000370 03D6                        ADD    EDX, ESI 
  284| 000372 8B7C98                      MOV    EDI, [EAX+4*EBX-4] 
  284| 000375 FC                                        
  284| 000376 0FAF3C11                    IMUL   EDI, [ECX+EDX+0] 
  284| 00037A CE                          INTO          
  284| 00037B 037D                        ADD    EDI, [EBP-128] ;  Sum1
  284| 00037D 80                                        
  284| 00037E CE                          INTO          
  284| 00037F 897D                        MOV    [EBP-128], EDI ;  Sum1
  284| 000381 80                                        
;  Source Line # 285
  285| 000382 8B45                        MOV    EAX, [EBP-32] 
  285| 000384 E0                                        
  285| 000385 3945                        CMP    [EBP-28], EAX 
  285| 000387 E4                                        
  285| 000388 74                          JE     SHORT L57 
  285| 000389 09                                        
  285| 00038A 8B45                        MOV    EAX, [EBP-28] 
  285| 00038C E4                                        
  285| 00038D 40                          INC    EAX    
  285| 00038E 8945                        MOV    [EBP-28], EAX 
  285| 000390 E4                                        
  285| 000391 EB                          JMP    SHORT L59 
  285| 000392 90                                        
  285|                 L57:                             
;  Source Line # 286
  286| 000393 8B95                        MOV    EDX, [EBP-136] ; Spill
  286| 000395 78FFFFFF                                  
  286| 000399 8B42                        MOV    EAX, [EDX+48] 
  286| 00039B 30                                        
  286| 00039C 8B98                        MOV    EBX, [EAX-132] ;  C
  286| 00039E 7CFFFFFF                                  
  286| 0003A2 8B4D                        MOV    ECX, [EBP-36] 
  286| 0003A4 DC                                        
  286| 0003A5 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  286| 0003A7 00000000                                  
  286|                 L98:                             
  286| 0003AB 0F8F                        JG     L99    
  286| 0003AD 44020000                                  
  286| 0003B1 8B748B                      MOV    ESI, [EBX+4*ECX-4] 
  286| 0003B4 FC                                        
  286| 0003B5 0FAF75                      IMUL   ESI, [EBP-104] ;  alfa2
  286| 0003B8 98                                        
  286| 0003B9 CE                          INTO          
  286| 0003BA 0375                        ADD    ESI, [EBP-128] ;  Sum1
  286| 0003BC 80                                        
  286| 0003BD CE                          INTO          
  286| 0003BE 8B7A                        MOV    EDI, [EDX+48] 
  286| 0003C0 30                                        
  286| 0003C1 8B97                        MOV    EDX, [EDI-136] ;  A
  286| 0003C3 78FFFFFF                                  
  286| 0003C7 8B45                        MOV    EAX, [EBP-36] 
  286| 0003C9 DC                                        
  286| 0003CA 3D                          CMP    EAX, 1 
  286| 0003CB 01000000                                  
  286|                 L100:                            
  286| 0003CF 0F8C                        JL     L101   
  286| 0003D1 2C020000                                  
  286| 0003D5 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  286| 0003D7 00000000                                  
  286| 0003DB 0F8F                        JG     L101   
  286| 0003DD 20020000                                  
  286| 0003E1 897482                      MOV    [EDX+4*EAX-4], ESI 
  286| 0003E4 FC                                        
;  Source Line # 287
  287| 0003E5 C745                        MOV    DWORD PTR [EBP-128], 0 ;  Sum1
  287| 0003E7 80                                        
  287| 0003E8 00000000                                  
;  Source Line # 288
  288| 0003EC 8B5D                        MOV    EBX, [EBP-40] 
  288| 0003EE D8                                        
  288| 0003EF 395D                        CMP    [EBP-36], EBX 
  288| 0003F1 DC                                        
  288| 0003F2 74                          JE     SHORT L54 
  288| 0003F3 0C                                        
  288| 0003F4 8B45                        MOV    EAX, [EBP-36] 
  288| 0003F6 DC                                        
  288| 0003F7 40                          INC    EAX    
  288| 0003F8 8945                        MOV    [EBP-36], EAX 
  288| 0003FA DC                                        
  288| 0003FB E9                          JMP    L56    
  288| 0003FC 0DFFFFFF                                  
  288|                 L54:                             
  288| 000400 8B05                        MOV    EAX, package1.h 
  288| 000402 00000000                                  
  288| 000406 40                          INC    EAX    
  288| 000407 CE                          INTO          
  288| 000408 8945                        MOV    [EBP-24], EAX 
  288| 00040A E8                                        
  288| 00040B 8B1D                        MOV    EBX, package1.h 
  288| 00040D 00000000                                  
  288| 000411 D1E3                        SHL    EBX, 1 
  288| 000413 CE                          INTO          
  288| 000414 895D                        MOV    [EBP-20], EBX 
  288| 000416 EC                                        
;  Source Line # 289
  289| 000417 8B4D                        MOV    ECX, [EBP-20] 
  289| 000419 EC                                        
  289| 00041A 394D                        CMP    [EBP-24], ECX 
  289| 00041C E8                                        
  289| 00041D 0F8F                        JG     L64    
  289| 00041F 2F010000                                  
  289| 000423 8B45                        MOV    EAX, [EBP-24] 
  289| 000425 E8                                        
  289| 000426 8945                        MOV    [EBP-16], EAX 
  289| 000428 F0                                        
  289|                 L66:                             
  289| 000429 8B05                        MOV    EAX, package1.h 
  289| 00042B 00000000                                  
  289| 00042F 40                          INC    EAX    
  289| 000430 CE                          INTO          
  289| 000431 8945                        MOV    [EBP-12], EAX 
  289| 000433 F4                                        
  289| 000434 8B1D                        MOV    EBX, package1.h 
  289| 000436 00000000                                  
  289| 00043A D1E3                        SHL    EBX, 1 
  289| 00043C CE                          INTO          
  289| 00043D 895D                        MOV    [EBP-8], EBX 
  289| 00043F F8                                        
;  Source Line # 290
  290| 000440 8B4D                        MOV    ECX, [EBP-8] 
  290| 000442 F8                                        
  290| 000443 394D                        CMP    [EBP-12], ECX 
  290| 000445 F4                                        
  290| 000446 0F8F                        JG     L67    
  290| 000448 F2000000                                  
  290| 00044C 8B45                        MOV    EAX, [EBP-12] 
  290| 00044E F4                                        
  290| 00044F 8945                        MOV    [EBP-4], EAX 
  290| 000451 FC                                        
  290|                 L69:                             
;  Source Line # 291
  291| 000452 8B95                        MOV    EDX, [EBP-136] ; Spill
  291| 000454 78FFFFFF                                  
  291| 000458 8B42                        MOV    EAX, [EDX+48] 
  291| 00045A 30                                        
  291| 00045B 8B98                        MOV    EBX, [EAX-136] ;  A
  291| 00045D 78FFFFFF                                  
  291| 000461 8B4D                        MOV    ECX, [EBP-16] 
  291| 000463 F0                                        
  291| 000464 83F9                        CMP    ECX, 1 
  291| 000466 01                                        
  291|                 L102:                            
  291| 000467 0F8C                        JL     L103   
  291| 000469 A0010000                                  
  291| 00046D 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  291| 00046F 00000000                                  
  291| 000473 0F8F                        JG     L103   
  291| 000475 94010000                                  
  291| 000479 8B72                        MOV    ESI, [EDX+48] 
  291| 00047B 30                                        
  291| 00047C 8BBE                        MOV    EDI, [ESI-136] ;  A
  291| 00047E 78FFFFFF                                  
  291| 000482 8B55                        MOV    EDX, [EBP-4] 
  291| 000484 FC                                        
  291| 000485 83FA                        CMP    EDX, 1 
  291| 000487 01                                        
  291|                 L104:                            
  291| 000488 0F8C                        JL     L105   
  291| 00048A 8B010000                                  
  291| 00048E 3B15                        CMP    EDX, package1.vec__constrained_array____1 
  291| 000490 00000000                                  
  291| 000494 0F8F                        JG     L105   
  291| 000496 7F010000                                  
  291| 00049A 8B4497                      MOV    EAX, [EDI+4*EDX-4] 
  291| 00049D FC                                        
  291| 00049E 39448B                      CMP    [EBX+4*ECX-4], EAX 
  291| 0004A1 FC                                        
  291| 0004A2 0F8E                        JLE    L70    
  291| 0004A4 82000000                                  
;  Source Line # 293
  293| 0004A8 8B95                        MOV    EDX, [EBP-136] ; Spill
  293| 0004AA 78FFFFFF                                  
  293| 0004AE 8B42                        MOV    EAX, [EDX+48] 
  293| 0004B0 30                                        
  293| 0004B1 8B98                        MOV    EBX, [EAX-136] ;  A
  293| 0004B3 78FFFFFF                                  
  293| 0004B7 8B4D                        MOV    ECX, [EBP-16] 
  293| 0004B9 F0                                        
  293| 0004BA 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  293| 0004BC 00000000                                  
  293|                 L106:                            
  293| 0004C0 0F8F                        JG     L107   
  293| 0004C2 5F010000                                  
  293| 0004C6 8B748B                      MOV    ESI, [EBX+4*ECX-4] 
  293| 0004C9 FC                                        
  293| 0004CA 8975                        MOV    [EBP-124], ESI ;  Temp
  293| 0004CC 84                                        
;  Source Line # 294
  294| 0004CD 8B7A                        MOV    EDI, [EDX+48] 
  294| 0004CF 30                                        
  294| 0004D0 8B97                        MOV    EDX, [EDI-136] ;  A
  294| 0004D2 78FFFFFF                                  
  294| 0004D6 8B45                        MOV    EAX, [EBP-4] 
  294| 0004D8 FC                                        
  294| 0004D9 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  294| 0004DB 00000000                                  
  294|                 L108:                            
  294| 0004DF 0F8F                        JG     L109   
  294| 0004E1 4C010000                                  
  294| 0004E5 8B9D                        MOV    EBX, [EBP-136] ; Spill
  294| 0004E7 78FFFFFF                                  
  294| 0004EB 8B4B                        MOV    ECX, [EBX+48] 
  294| 0004ED 30                                        
  294| 0004EE 8BB1                        MOV    ESI, [ECX-136] ;  A
  294| 0004F0 78FFFFFF                                  
  294| 0004F4 8B7D                        MOV    EDI, [EBP-16] 
  294| 0004F6 F0                                        
  294| 0004F7 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  294| 0004F9 00000000                                  
  294|                 L110:                            
  294| 0004FD 0F8F                        JG     L111   
  294| 0004FF 3A010000                                  
  294| 000503 8B5482                      MOV    EDX, [EDX+4*EAX-4] 
  294| 000506 FC                                        
  294| 000507 8954BE                      MOV    [ESI+4*EDI-4], EDX 
  294| 00050A FC                                        
;  Source Line # 295
  295| 00050B 8B43                        MOV    EAX, [EBX+48] 
  295| 00050D 30                                        
  295| 00050E 8B98                        MOV    EBX, [EAX-136] ;  A
  295| 000510 78FFFFFF                                  
  295| 000514 8B4D                        MOV    ECX, [EBP-4] 
  295| 000516 FC                                        
  295| 000517 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  295| 000519 00000000                                  
  295|                 L112:                            
  295| 00051D 0F8F                        JG     L113   
  295| 00051F 26010000                                  
  295| 000523 8B75                        MOV    ESI, [EBP-124] ;  Temp
  295| 000525 84                                        
  295| 000526 89748B                      MOV    [EBX+4*ECX-4], ESI 
  295| 000529 FC                                        
;  Source Line # 296
;  Source Line # 297
  297|                 L70:                             
;  Source Line # 298
  298| 00052A 8B45                        MOV    EAX, [EBP-8] 
  298| 00052C F8                                        
  298| 00052D 3945                        CMP    [EBP-4], EAX 
  298| 00052F FC                                        
  298| 000530 74                          JE     SHORT L67 
  298| 000531 0C                                        
  298| 000532 8B45                        MOV    EAX, [EBP-4] 
  298| 000534 FC                                        
  298| 000535 40                          INC    EAX    
  298| 000536 8945                        MOV    [EBP-4], EAX 
  298| 000538 FC                                        
  298| 000539 E9                          JMP    L69    
  298| 00053A 14FFFFFF                                  
  298|                 L67:                             
;  Source Line # 299
  299| 00053E 8B45                        MOV    EAX, [EBP-20] 
  299| 000540 EC                                        
  299| 000541 3945                        CMP    [EBP-16], EAX 
  299| 000543 F0                                        
  299| 000544 74                          JE     SHORT L64 
  299| 000545 0C                                        
  299| 000546 8B45                        MOV    EAX, [EBP-16] 
  299| 000548 F0                                        
  299| 000549 40                          INC    EAX    
  299| 00054A 8945                        MOV    [EBP-16], EAX 
  299| 00054C F0                                        
  299| 00054D E9                          JMP    L66    
  299| 00054E D7FEFFFF                                  
  299|                 L64:                             
;  Source Line # 301
  301| 000552 68                          PUSH   lab4.mon.aht2 
  301| 000553 00000000                                  
  301| 000557 6A                          PUSH   0      
  301| 000558 00                                        
  301| 000559 8B95                        MOV    EDX, [EBP-136] ; Spill
  301| 00055B 78FFFFFF                                  
  301| 00055F 8B42                        MOV    EAX, [EDX+48] 
  301| 000561 30                                        
  301| 000562 8B58                        MOV    EBX, [EAX-44] ;  MON
  301| 000564 D4                                        
  301| 000565 53                          PUSH   EBX    
  301| 000566 E8                          CALL   rts_protected_procedure_call 
  301| 000567 00000000                                  
;  Source Line # 303
  303| 00056B 68                          PUSH   __lcl.00000303 
  303| 00056C 00000000                                  
  303| 000570 68                          PUSH   __lcl.00000302 
  303| 000571 00000000                                  
  303| 000575 E8                          CALL   ada.text_io.put_line__2 
  303| 000576 00000000                                  
  303| 00057A 8D4D                        LEA    ECX, [EBP-112] ;  dyn_temp
  303| 00057C 90                                        
  303| 00057D 51                          PUSH   ECX    
  303| 00057E E8                          CALL   rts_ss_release 
  303| 00057F 00000000                                  
;  Source Line # 304
  304| 000583 8BE5                        MOV    ESP, EBP 
  304| 000585 5D                          POP    EBP    
  304| 000586 C2                          RET    4      
  304| 000587 0400                                      
  304|                 L81:                             
  304| 000589 8D05                        LEA    EAX, L80+5 
  304| 00058B EF010000                                  
  304| 00058F 50                          PUSH   EAX    
  304| 000590 E9                          JMP    rts_raise_constraint_error 
  304| 000591 00000000                                  
  304|                 L83:                             
  304| 000595 8D05                        LEA    EAX, L82+5 
  304| 000597 05020000                                  
  304| 00059B 50                          PUSH   EAX    
  304| 00059C E9                          JMP    rts_raise_constraint_error 
  304| 00059D 00000000                                  
  304|                 L85:                             
  304| 0005A1 8D05                        LEA    EAX, L84+5 
  304| 0005A3 2C020000                                  
  304| 0005A7 50                          PUSH   EAX    
  304| 0005A8 E9                          JMP    rts_raise_constraint_error 
  304| 0005A9 00000000                                  
  304|                 L87:                             
  304| 0005AD 8D05                        LEA    EAX, L86+5 
  304| 0005AF 45020000                                  
  304| 0005B3 50                          PUSH   EAX    
  304| 0005B4 E9                          JMP    rts_raise_constraint_error 
  304| 0005B5 00000000                                  
  304|                 L89:                             
  304| 0005B9 8D05                        LEA    EAX, L88+5 
  304| 0005BB 83020000                                  
  304| 0005BF 50                          PUSH   EAX    
  304| 0005C0 E9                          JMP    rts_raise_constraint_error 
  304| 0005C1 00000000                                  
  304|                 L91:                             
  304| 0005C5 8D05                        LEA    EAX, L90+5 
  304| 0005C7 99020000                                  
  304| 0005CB 50                          PUSH   EAX    
  304| 0005CC E9                          JMP    rts_raise_constraint_error 
  304| 0005CD 00000000                                  
  304|                 L93:                             
  304| 0005D1 8D05                        LEA    EAX, L92+5 
  304| 0005D3 34030000                                  
  304| 0005D7 50                          PUSH   EAX    
  304| 0005D8 E9                          JMP    rts_raise_constraint_error 
  304| 0005D9 00000000                                  
  304|                 L95:                             
  304| 0005DD 8D05                        LEA    EAX, L94+5 
  304| 0005DF 46030000                                  
  304| 0005E3 50                          PUSH   EAX    
  304| 0005E4 E9                          JMP    rts_raise_constraint_error 
  304| 0005E5 00000000                                  
  304|                 L97:                             
  304| 0005E9 8D05                        LEA    EAX, L96+5 
  304| 0005EB 5C030000                                  
  304| 0005EF 50                          PUSH   EAX    
  304| 0005F0 E9                          JMP    rts_raise_constraint_error 
  304| 0005F1 00000000                                  
  304|                 L99:                             
  304| 0005F5 8D05                        LEA    EAX, L98+5 
  304| 0005F7 B0030000                                  
  304| 0005FB 50                          PUSH   EAX    
  304| 0005FC E9                          JMP    rts_raise_constraint_error 
  304| 0005FD 00000000                                  
  304|                 L101:                            
  304| 000601 8D05                        LEA    EAX, L100+5 
  304| 000603 D4030000                                  
  304| 000607 50                          PUSH   EAX    
  304| 000608 E9                          JMP    rts_raise_constraint_error 
  304| 000609 00000000                                  
  304|                 L103:                            
  304| 00060D 8D05                        LEA    EAX, L102+5 
  304| 00060F 6C040000                                  
  304| 000613 50                          PUSH   EAX    
  304| 000614 E9                          JMP    rts_raise_constraint_error 
  304| 000615 00000000                                  
  304|                 L105:                            
  304| 000619 8D05                        LEA    EAX, L104+5 
  304| 00061B 8D040000                                  
  304| 00061F 50                          PUSH   EAX    
  304| 000620 E9                          JMP    rts_raise_constraint_error 
  304| 000621 00000000                                  
  304|                 L107:                            
  304| 000625 8D05                        LEA    EAX, L106+5 
  304| 000627 C5040000                                  
  304| 00062B 50                          PUSH   EAX    
  304| 00062C E9                          JMP    rts_raise_constraint_error 
  304| 00062D 00000000                                  
  304|                 L109:                            
  304| 000631 8D05                        LEA    EAX, L108+5 
  304| 000633 E4040000                                  
  304| 000637 50                          PUSH   EAX    
  304| 000638 E9                          JMP    rts_raise_constraint_error 
  304| 000639 00000000                                  
  304|                 L111:                            
  304| 00063D 8D05                        LEA    EAX, L110+5 
  304| 00063F 02050000                                  
  304| 000643 50                          PUSH   EAX    
  304| 000644 E9                          JMP    rts_raise_constraint_error 
  304| 000645 00000000                                  
  304|                 L113:                            
  304| 000649 8D05                        LEA    EAX, L112+5 
  304| 00064B 22050000                                  
  304| 00064F 50                          PUSH   EAX    
  304| 000650 E9                          JMP    rts_raise_constraint_error 
  304| 000651 00000000                                  
                       ;                                
                       lab4.start.t2__body ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000451     DD     00002C01 
                                          DD     000000FC 
                                          DD     lab4.start.t2__body 
                                          DD     __lcl.00000467 
                                          DD     000000FE 
                                          DD     lab4.start.t2__body+00000013H 
                                          DD     __lcl.00000467 
                                          DD     000000FF 
                                          DD     lab4.start.t2__body+00000060H 
                                          DD     __lcl.00000467 
                                          DD     00000100 
                                          DD     lab4.start.t2__body+00000082H 
                                          DD     __lcl.00000467 
                                          DD     00000101 
                                          DD     lab4.start.t2__body+000000A2H 
                                          DD     __lcl.00000467 
                                          DD     00000102 
                                          DD     lab4.start.t2__body+000000A7H 
                                          DD     __lcl.00000467 
                                          DD     00000105 
                                          DD     lab4.start.t2__body+000000B6H 
                                          DD     __lcl.00000467 
                                          DD     00000106 
                                          DD     lab4.start.t2__body+000000CBH 
                                          DD     __lcl.00000467 
                                          DD     00000107 
                                          DD     lab4.start.t2__body+000000D4H 
                                          DD     __lcl.00000467 
                                          DD     00000109 
                                          DD     lab4.start.t2__body+000000F5H 
                                          DD     __lcl.00000467 
                                          DD     0000010B 
                                          DD     lab4.start.t2__body+0000010EH 
                                          DD     __lcl.00000467 
                                          DD     0000010D 
                                          DD     lab4.start.t2__body+00000126H 
                                          DD     __lcl.00000467 
                                          DD     0000010E 
                                          DD     lab4.start.t2__body+00000147H 
                                          DD     __lcl.00000467 
                                          DD     00000110 
                                          DD     lab4.start.t2__body+00000177H 
                                          DD     __lcl.00000467 
                                          DD     00000111 
                                          DD     lab4.start.t2__body+0000019FH 
                                          DD     __lcl.00000467 
                                          DD     00000112 
                                          DD     lab4.start.t2__body+000001B1H 
                                          DD     __lcl.00000467 
                                          DD     00000113 
                                          DD     lab4.start.t2__body+000001C1H 
                                          DD     __lcl.00000467 
                                          DD     00000114 
                                          DD     lab4.start.t2__body+000001D2H 
                                          DD     __lcl.00000467 
                                          DD     00000115 
                                          DD     lab4.start.t2__body+0000025EH 
                                          DD     __lcl.00000467 
                                          DD     00000116 
                                          DD     lab4.start.t2__body+00000272H 
                                          DD     __lcl.00000467 
                                          DD     00000117 
                                          DD     lab4.start.t2__body+000002B5H 
                                          DD     __lcl.00000467 
                                          DD     00000118 
                                          DD     lab4.start.t2__body+000002C9H 
                                          DD     __lcl.00000467 
                                          DD     00000119 
                                          DD     lab4.start.t2__body+000002DDH 
                                          DD     __lcl.00000467 
                                          DD     0000011A 
                                          DD     lab4.start.t2__body+000002FBH 
                                          DD     __lcl.00000467 
                                          DD     0000011B 
                                          DD     lab4.start.t2__body+00000316H 
                                          DD     __lcl.00000467 
                                          DD     0000011C 
                                          DD     lab4.start.t2__body+00000323H 
                                          DD     __lcl.00000467 
                                          DD     0000011D 
                                          DD     lab4.start.t2__body+00000382H 
                                          DD     __lcl.00000467 
                                          DD     0000011E 
                                          DD     lab4.start.t2__body+00000393H 
                                          DD     __lcl.00000467 
                                          DD     0000011F 
                                          DD     lab4.start.t2__body+000003E5H 
                                          DD     __lcl.00000467 
                                          DD     00000120 
                                          DD     lab4.start.t2__body+000003ECH 
                                          DD     __lcl.00000467 
                                          DD     00000121 
                                          DD     lab4.start.t2__body+00000417H 
                                          DD     __lcl.00000467 
                                          DD     00000122 
                                          DD     lab4.start.t2__body+00000440H 
                                          DD     __lcl.00000467 
                                          DD     00000123 
                                          DD     lab4.start.t2__body+00000452H 
                                          DD     __lcl.00000467 
                                          DD     00000125 
                                          DD     lab4.start.t2__body+000004A8H 
                                          DD     __lcl.00000467 
                                          DD     00000126 
                                          DD     lab4.start.t2__body+000004CDH 
                                          DD     __lcl.00000467 
                                          DD     00000127 
                                          DD     lab4.start.t2__body+0000050BH 
                                          DD     __lcl.00000467 
                                          DD     00000128 
                                          DD     lab4.start.t2__body+0000052AH 
                                          DD     __lcl.00000467 
                                          DD     00000129 
                                          DD     lab4.start.t2__body+0000052AH 
                                          DD     __lcl.00000467 
                                          DD     0000012A 
                                          DD     lab4.start.t2__body+0000052AH 
                                          DD     __lcl.00000467 
                                          DD     0000012B 
                                          DD     lab4.start.t2__body+0000053EH 
                                          DD     __lcl.00000467 
                                          DD     0000012D 
                                          DD     lab4.start.t2__body+00000552H 
                                          DD     __lcl.00000467 
                                          DD     0000012F 
                                          DD     lab4.start.t2__body+0000056BH 
                                          DD     __lcl.00000467 
                                          DD     00000130 
                                          DD     lab4.start.t2__body+00000583H 
                                          DD     __lcl.00000467 
                                          DD     00000130 
                                          DD     lab4.start.t2__body+00000651H 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 532

                       ;                                
                       ;  Start of procedure lab4.start.t3__body   
                       ;                                
                                          PUBLIC lab4.start.t3__body 
                       lab4.start.t3__body PROC  NEAR   
;  Source Line # 307
  307| 000000 64                          FS:           
  307| 000001 8B15                        MOV    EDX, 4 
  307| 000003 04000000                                  
  307| 000007 8B52                        MOV    EDX, [EDX-4] 
  307| 000009 FC                                        
  307| 00000A 55                          PUSH   EBP    
  307| 00000B 8BEC                        MOV    EBP, ESP 
  307| 00000D 81EC                        SUB    ESP, 140 
  307| 00000F 8C000000                                  
;  Source Line # 309
  309| 000013 8B02                        MOV    EAX, [EDX+0] 
  309| 000015 8945                        MOV    [EBP-124], EAX ;  dyn_temp
  309| 000017 84                                        
  309| 000018 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  309| 00001A 00000000                                  
  309| 00001E 83EB                        SUB    EBX, 1 
  309| 000020 01                                        
  309| 000021 7D                          JGE    SHORT L76 
  309| 000022 03                                        
  309| 000023 33DB                        XOR    EBX, EBX 
  309| 000025 4B                          DEC    EBX    
  309|                 L76:                             
  309| 000026 CE                          INTO          
  309| 000027 43                          INC    EBX    
  309| 000028 CE                          INTO          
  309| 000029 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  309| 00002C 00000000                                  
  309| 000030 CE                          INTO          
  309| 000031 53                          PUSH   EBX    
  309| 000032 8995                        MOV    [EBP-140], EDX ; Spill
  309| 000034 74FFFFFF                                  
  309| 000038 E8                          CALL   rts_ss_allocate 
  309| 000039 00000000                                  
  309| 00003D 8945                        MOV    [EBP-120], EAX ;  MO3
  309| 00003F 88                                        
  309| 000040 8B0D                        MOV    ECX, package1.vec__constrained_array____1 
  309| 000042 00000000                                  
  309| 000046 83E9                        SUB    ECX, 1 
  309| 000048 01                                        
  309| 000049 7D                          JGE    SHORT L77 
  309| 00004A 03                                        
  309| 00004B 33C9                        XOR    ECX, ECX 
  309| 00004D 49                          DEC    ECX    
  309|                 L77:                             
  309| 00004E CE                          INTO          
  309| 00004F 41                          INC    ECX    
  309| 000050 CE                          INTO          
  309| 000051 D1E1                        SHL    ECX, 1 
  309| 000053 CE                          INTO          
  309| 000054 D1E1                        SHL    ECX, 1 
  309| 000056 CE                          INTO          
  309| 000057 51                          PUSH   ECX    
  309| 000058 E8                          CALL   rts_ss_allocate 
  309| 000059 00000000                                  
  309| 00005D 8945                        MOV    [EBP-100], EAX ;  D3
  309| 00005F 9C                                        
;  Source Line # 310
  310| 000060 8B35                        MOV    ESI, package1.matr__constrained_array____1 
  310| 000062 00000000                                  
  310| 000066 83EE                        SUB    ESI, 1 
  310| 000068 01                                        
  310| 000069 7D                          JGE    SHORT L78 
  310| 00006A 03                                        
  310| 00006B 33F6                        XOR    ESI, ESI 
  310| 00006D 4E                          DEC    ESI    
  310|                 L78:                             
  310| 00006E CE                          INTO          
  310| 00006F 46                          INC    ESI    
  310| 000070 CE                          INTO          
  310| 000071 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  310| 000074 00000000                                  
  310| 000078 CE                          INTO          
  310| 000079 56                          PUSH   ESI    
  310| 00007A E8                          CALL   rts_ss_allocate 
  310| 00007B 00000000                                  
  310| 00007F 8945                        MOV    [EBP-96], EAX ;  MTF
  310| 000081 A0                                        
  310| 000082 8B3D                        MOV    EDI, package1.vec__constrained_array____1 
  310| 000084 00000000                                  
  310| 000088 83EF                        SUB    EDI, 1 
  310| 00008A 01                                        
  310| 00008B 7D                          JGE    SHORT L79 
  310| 00008C 03                                        
  310| 00008D 33FF                        XOR    EDI, EDI 
  310| 00008F 4F                          DEC    EDI    
  310|                 L79:                             
  310| 000090 CE                          INTO          
  310| 000091 47                          INC    EDI    
  310| 000092 CE                          INTO          
  310| 000093 D1E7                        SHL    EDI, 1 
  310| 000095 CE                          INTO          
  310| 000096 D1E7                        SHL    EDI, 1 
  310| 000098 CE                          INTO          
  310| 000099 57                          PUSH   EDI    
  310| 00009A E8                          CALL   rts_ss_allocate 
  310| 00009B 00000000                                  
  310| 00009F 8945                        MOV    [EBP-92], EAX ;  Tv
  310| 0000A1 A4                                        
;  Source Line # 311
  311| 0000A2 E8                          CALL   rts_activation_succeeded 
  311| 0000A3 00000000                                  
;  Source Line # 312
  312| 0000A7 68                          PUSH   __lcl.00000310 
  312| 0000A8 00000000                                  
  312| 0000AC 68                          PUSH   __lcl.00000309 
  312| 0000AD 00000000                                  
  312| 0000B1 E8                          CALL   ada.text_io.put_line__2 
  312| 0000B2 00000000                                  
;  Source Line # 315
  315| 0000B6 8B55                        MOV    EDX, [EBP-120] ;  MO3
  315| 0000B8 88                                        
  315| 0000B9 52                          PUSH   EDX    
  315| 0000BA E8                          CALL   package1.matr_input 
  315| 0000BB 00000000                                  
;  Source Line # 316
  316| 0000BF 8B5D                        MOV    EBX, [EBP-120] ;  MO3
  316| 0000C1 88                                        
  316| 0000C2 895D                        MOV    [EBP-88], EBX 
  316| 0000C4 A8                                        
  316| 0000C5 68                          PUSH   lab4.mon.setmo 
  316| 0000C6 00000000                                  
  316| 0000CA 8D4D                        LEA    ECX, [EBP-88] 
  316| 0000CC A8                                        
  316| 0000CD 51                          PUSH   ECX    
  316| 0000CE 8B95                        MOV    EDX, [EBP-140] ; Spill
  316| 0000D0 74FFFFFF                                  
  316| 0000D4 8B72                        MOV    ESI, [EDX+48] 
  316| 0000D6 30                                        
  316| 0000D7 8B7E                        MOV    EDI, [ESI-44] ;  MON
  316| 0000D9 D4                                        
  316| 0000DA 57                          PUSH   EDI    
  316| 0000DB E8                          CALL   rts_protected_procedure_call 
  316| 0000DC 00000000                                  
;  Source Line # 318
  318| 0000E0 68                          PUSH   lab4.mon.datasignal 
  318| 0000E1 00000000                                  
  318| 0000E5 6A                          PUSH   0      
  318| 0000E6 00                                        
  318| 0000E7 8B95                        MOV    EDX, [EBP-140] ; Spill
  318| 0000E9 74FFFFFF                                  
  318| 0000ED 8B42                        MOV    EAX, [EDX+48] 
  318| 0000EF 30                                        
  318| 0000F0 8B58                        MOV    EBX, [EAX-44] ;  MON
  318| 0000F2 D4                                        
  318| 0000F3 53                          PUSH   EBX    
  318| 0000F4 E8                          CALL   rts_protected_procedure_call 
  318| 0000F5 00000000                                  
;  Source Line # 320
  320| 0000F9 6A                          PUSH   0      
  320| 0000FA 00                                        
  320| 0000FB 6A                          PUSH   0      
  320| 0000FC 00                                        
  320| 0000FD 6A                          PUSH   0      
  320| 0000FE 00                                        
  320| 0000FF 8B95                        MOV    EDX, [EBP-140] ; Spill
  320| 000101 74FFFFFF                                  
  320| 000105 8B4A                        MOV    ECX, [EDX+48] 
  320| 000107 30                                        
  320| 000108 8B71                        MOV    ESI, [ECX-44] ;  MON
  320| 00010A D4                                        
  320| 00010B 56                          PUSH   ESI    
  320| 00010C E8                          CALL   rts_protected_entry_call 
  320| 00010D 00000000                                  
;  Source Line # 322
  322| 000111 8D7D                        LEA    EDI, [EBP-84] 
  322| 000113 AC                                        
  322| 000114 897D                        MOV    [EBP-80], EDI 
  322| 000116 B0                                        
  322| 000117 68                          PUSH   lab4.mon.getalfa 
  322| 000118 00000000                                  
  322| 00011C 8D45                        LEA    EAX, [EBP-80] 
  322| 00011E B0                                        
  322| 00011F 50                          PUSH   EAX    
  322| 000120 8B95                        MOV    EDX, [EBP-140] ; Spill
  322| 000122 74FFFFFF                                  
  322| 000126 8B5A                        MOV    EBX, [EDX+48] 
  322| 000128 30                                        
  322| 000129 8B4B                        MOV    ECX, [EBX-44] ;  MON
  322| 00012B D4                                        
  322| 00012C 51                          PUSH   ECX    
  322| 00012D E8                          CALL   rts_entryless_protected_subp_call 
  322| 00012E 00000000                                  
  322| 000132 8B75                        MOV    ESI, [EBP-84] 
  322| 000134 AC                                        
  322| 000135 8975                        MOV    [EBP-116], ESI ;  alfa3
  322| 000137 8C                                        
;  Source Line # 323
  323| 000138 8B7D                        MOV    EDI, [EBP-100] ;  D3
  323| 00013A 9C                                        
  323| 00013B 897D                        MOV    [EBP-76], EDI 
  323| 00013D B4                                        
  323| 00013E 68                          PUSH   lab4.mon.getd 
  323| 00013F 00000000                                  
  323| 000143 8D45                        LEA    EAX, [EBP-76] 
  323| 000145 B4                                        
  323| 000146 50                          PUSH   EAX    
  323| 000147 8B95                        MOV    EDX, [EBP-140] ; Spill
  323| 000149 74FFFFFF                                  
  323| 00014D 8B5A                        MOV    EBX, [EDX+48] 
  323| 00014F 30                                        
  323| 000150 8B4B                        MOV    ECX, [EBX-44] ;  MON
  323| 000152 D4                                        
  323| 000153 51                          PUSH   ECX    
  323| 000154 E8                          CALL   rts_entryless_protected_subp_call 
  323| 000155 00000000                                  
  323| 000159 8B35                        MOV    ESI, package1.n 
  323| 00015B 00000000                                  
  323| 00015F 8975                        MOV    [EBP-72], ESI 
  323| 000161 B8                                        
;  Source Line # 325
  325| 000162 837D                        CMP    DWORD PTR [EBP-72], 0 
  325| 000164 B8                                        
  325| 000165 00                                        
  325| 000166 0F8E                        JLE    L39    
  325| 000168 6A010000                                  
  325| 00016C C745                        MOV    DWORD PTR [EBP-68], 1 
  325| 00016E BC                                        
  325| 00016F 01000000                                  
  325|                 L41:                             
  325| 000173 8B05                        MOV    EAX, package1.h 
  325| 000175 00000000                                  
  325| 000179 D1E0                        SHL    EAX, 1 
  325| 00017B CE                          INTO          
  325| 00017C 40                          INC    EAX    
  325| 00017D CE                          INTO          
  325| 00017E 8945                        MOV    [EBP-64], EAX 
  325| 000180 C0                                        
  325| 000181 6B1D                        IMUL   EBX, package1.h, 3 
  325| 000183 00000000                                  
  325| 000187 03                                        
  325| 000188 CE                          INTO          
  325| 000189 895D                        MOV    [EBP-60], EBX 
  325| 00018B C4                                        
;  Source Line # 326
  326| 00018C 8B4D                        MOV    ECX, [EBP-60] 
  326| 00018E C4                                        
  326| 00018F 394D                        CMP    [EBP-64], ECX 
  326| 000191 C0                                        
  326| 000192 0F8F                        JG     L42    
  326| 000194 2A010000                                  
  326| 000198 8B45                        MOV    EAX, [EBP-64] 
  326| 00019A C0                                        
  326| 00019B 8945                        MOV    [EBP-56], EAX 
  326| 00019D C8                                        
  326|                 L44:                             
;  Source Line # 327
  327| 00019E C785                        MOV    DWORD PTR [EBP-132], 0 ;  Sum1
  327| 0001A0 7CFFFFFF                                  
  327| 0001A4 00000000                                  
  327| 0001A8 8B05                        MOV    EAX, package1.n 
  327| 0001AA 00000000                                  
  327| 0001AE 8945                        MOV    [EBP-52], EAX 
  327| 0001B0 CC                                        
;  Source Line # 328
  328| 0001B1 837D                        CMP    DWORD PTR [EBP-52], 0 
  328| 0001B3 CC                                        
  328| 0001B4 00                                        
  328| 0001B5 0F8E                        JLE    L45    
  328| 0001B7 AD000000                                  
  328| 0001BB C745                        MOV    DWORD PTR [EBP-48], 1 
  328| 0001BD D0                                        
  328| 0001BE 01000000                                  
  328|                 L47:                             
;  Source Line # 329
  329| 0001C2 8B95                        MOV    EDX, [EBP-140] ; Spill
  329| 0001C4 74FFFFFF                                  
  329| 0001C8 8B42                        MOV    EAX, [EDX+48] 
  329| 0001CA 30                                        
  329| 0001CB 8B98                        MOV    EBX, [EAX-140] ;  MT
  329| 0001CD 74FFFFFF                                  
  329| 0001D1 8B4D                        MOV    ECX, [EBP-48] 
  329| 0001D3 D0                                        
  329| 0001D4 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  329| 0001D6 00000000                                  
  329|                 L80:                             
  329| 0001DA 0F8F                        JG     L81    
  329| 0001DC BB030000                                  
  329| 0001E0 8D49                        LEA    ECX, [ECX-1] 
  329| 0001E2 FF                                        
  329| 0001E3 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  329| 0001E6 00000000                                  
  329| 0001EA 8B75                        MOV    ESI, [EBP-56] 
  329| 0001EC C8                                        
  329| 0001ED 83FE                        CMP    ESI, 1 
  329| 0001EF 01                                        
  329|                 L82:                             
  329| 0001F0 0F8C                        JL     L83    
  329| 0001F2 B1030000                                  
  329| 0001F6 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  329| 0001F8 00000000                                  
  329| 0001FC 0F8F                        JG     L83    
  329| 0001FE A5030000                                  
  329| 000202 8D34B5                      LEA    ESI, [4*ESI-4] 
  329| 000205 FCFFFFFF                                  
  329| 000209 03CE                        ADD    ECX, ESI 
  329| 00020B 8B7D                        MOV    EDI, [EBP-120] ;  MO3
  329| 00020D 88                                        
  329| 00020E 8B55                        MOV    EDX, [EBP-68] 
  329| 000210 BC                                        
  329| 000211 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  329| 000213 00000000                                  
  329|                 L84:                             
  329| 000217 0F8F                        JG     L85    
  329| 000219 96030000                                  
  329| 00021D 8D52                        LEA    EDX, [EDX-1] 
  329| 00021F FF                                        
  329| 000220 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  329| 000223 00000000                                  
  329| 000227 8B45                        MOV    EAX, [EBP-48] 
  329| 000229 D0                                        
  329| 00022A 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  329| 00022C 00000000                                  
  329|                 L86:                             
  329| 000230 0F8F                        JG     L87    
  329| 000232 89030000                                  
  329| 000236 8D0485                      LEA    EAX, [4*EAX-4] 
  329| 000239 FCFFFFFF                                  
  329| 00023D 03D0                        ADD    EDX, EAX 
  329| 00023F 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  329| 000242 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  329| 000246 CE                          INTO          
  329| 000247 039D                        ADD    EBX, [EBP-132] ;  Sum1
  329| 000249 7CFFFFFF                                  
  329| 00024D CE                          INTO          
  329| 00024E 899D                        MOV    [EBP-132], EBX ;  Sum1
  329| 000250 7CFFFFFF                                  
;  Source Line # 330
  330| 000254 8B75                        MOV    ESI, [EBP-52] 
  330| 000256 CC                                        
  330| 000257 3975                        CMP    [EBP-48], ESI 
  330| 000259 D0                                        
  330| 00025A 74                          JE     SHORT L45 
  330| 00025B 0C                                        
  330| 00025C 8B45                        MOV    EAX, [EBP-48] 
  330| 00025E D0                                        
  330| 00025F 40                          INC    EAX    
  330| 000260 8945                        MOV    [EBP-48], EAX 
  330| 000262 D0                                        
  330| 000263 E9                          JMP    L47    
  330| 000264 5AFFFFFF                                  
  330|                 L45:                             
;  Source Line # 331
  331| 000268 8B45                        MOV    EAX, [EBP-96] ;  MTF
  331| 00026A A0                                        
  331| 00026B 8B5D                        MOV    EBX, [EBP-68] 
  331| 00026D BC                                        
  331| 00026E 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
  331| 000270 00000000                                  
  331|                 L88:                             
  331| 000274 0F8F                        JG     L89    
  331| 000276 51030000                                  
  331| 00027A 8D5B                        LEA    EBX, [EBX-1] 
  331| 00027C FF                                        
  331| 00027D 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  331| 000280 00000000                                  
  331| 000284 8B4D                        MOV    ECX, [EBP-56] 
  331| 000286 C8                                        
  331| 000287 83F9                        CMP    ECX, 1 
  331| 000289 01                                        
  331|                 L90:                             
  331| 00028A 0F8C                        JL     L91    
  331| 00028C 47030000                                  
  331| 000290 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  331| 000292 00000000                                  
  331| 000296 0F8F                        JG     L91    
  331| 000298 3B030000                                  
  331| 00029C 8D0C8D                      LEA    ECX, [4*ECX-4] 
  331| 00029F FCFFFFFF                                  
  331| 0002A3 03D9                        ADD    EBX, ECX 
  331| 0002A5 8B95                        MOV    EDX, [EBP-132] ;  Sum1
  331| 0002A7 7CFFFFFF                                  
  331| 0002AB 891418                      MOV    [EAX+EBX+0], EDX 
;  Source Line # 332
  332| 0002AE 8B75                        MOV    ESI, [EBP-60] 
  332| 0002B0 C4                                        
  332| 0002B1 3975                        CMP    [EBP-56], ESI 
  332| 0002B3 C8                                        
  332| 0002B4 74                          JE     SHORT L42 
  332| 0002B5 0C                                        
  332| 0002B6 8B45                        MOV    EAX, [EBP-56] 
  332| 0002B8 C8                                        
  332| 0002B9 40                          INC    EAX    
  332| 0002BA 8945                        MOV    [EBP-56], EAX 
  332| 0002BC C8                                        
  332| 0002BD E9                          JMP    L44    
  332| 0002BE DCFEFFFF                                  
  332|                 L42:                             
;  Source Line # 333
  333| 0002C2 8B45                        MOV    EAX, [EBP-72] 
  333| 0002C4 B8                                        
  333| 0002C5 3945                        CMP    [EBP-68], EAX 
  333| 0002C7 BC                                        
  333| 0002C8 74                          JE     SHORT L39 
  333| 0002C9 0C                                        
  333| 0002CA 8B45                        MOV    EAX, [EBP-68] 
  333| 0002CC BC                                        
  333| 0002CD 40                          INC    EAX    
  333| 0002CE 8945                        MOV    [EBP-68], EAX 
  333| 0002D0 BC                                        
  333| 0002D1 E9                          JMP    L41    
  333| 0002D2 9DFEFFFF                                  
  333|                 L39:                             
;  Source Line # 334
  334| 0002D6 C785                        MOV    DWORD PTR [EBP-132], 0 ;  Sum1
  334| 0002D8 7CFFFFFF                                  
  334| 0002DC 00000000                                  
  334| 0002E0 8B05                        MOV    EAX, package1.h 
  334| 0002E2 00000000                                  
  334| 0002E6 D1E0                        SHL    EAX, 1 
  334| 0002E8 CE                          INTO          
  334| 0002E9 40                          INC    EAX    
  334| 0002EA CE                          INTO          
  334| 0002EB 8945                        MOV    [EBP-44], EAX 
  334| 0002ED D4                                        
  334| 0002EE 6B1D                        IMUL   EBX, package1.h, 3 
  334| 0002F0 00000000                                  
  334| 0002F4 03                                        
  334| 0002F5 CE                          INTO          
  334| 0002F6 895D                        MOV    [EBP-40], EBX 
  334| 0002F8 D8                                        
;  Source Line # 335
  335| 0002F9 8B4D                        MOV    ECX, [EBP-40] 
  335| 0002FB D8                                        
  335| 0002FC 394D                        CMP    [EBP-44], ECX 
  335| 0002FE D4                                        
  335| 0002FF 0F8F                        JG     L54    
  335| 000301 09010000                                  
  335| 000305 8B45                        MOV    EAX, [EBP-44] 
  335| 000307 D4                                        
  335| 000308 8945                        MOV    [EBP-36], EAX 
  335| 00030A DC                                        
  335|                 L56:                             
  335| 00030B 8B05                        MOV    EAX, package1.n 
  335| 00030D 00000000                                  
  335| 000311 8945                        MOV    [EBP-32], EAX 
  335| 000313 E0                                        
;  Source Line # 336
  336| 000314 837D                        CMP    DWORD PTR [EBP-32], 0 
  336| 000316 E0                                        
  336| 000317 00                                        
  336| 000318 0F8E                        JLE    L57    
  336| 00031A 7D000000                                  
  336| 00031E C745                        MOV    DWORD PTR [EBP-28], 1 
  336| 000320 E4                                        
  336| 000321 01000000                                  
  336|                 L59:                             
;  Source Line # 337
  337| 000325 8B45                        MOV    EAX, [EBP-100] ;  D3
  337| 000327 9C                                        
  337| 000328 8B5D                        MOV    EBX, [EBP-28] 
  337| 00032A E4                                        
  337| 00032B 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
  337| 00032D 00000000                                  
  337|                 L92:                             
  337| 000331 0F8F                        JG     L93    
  337| 000333 AC020000                                  
  337| 000337 8B4D                        MOV    ECX, [EBP-96] ;  MTF
  337| 000339 A0                                        
  337| 00033A 8B55                        MOV    EDX, [EBP-28] 
  337| 00033C E4                                        
  337| 00033D 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  337| 00033F 00000000                                  
  337|                 L94:                             
  337| 000343 0F8F                        JG     L95    
  337| 000345 A6020000                                  
  337| 000349 8D52                        LEA    EDX, [EDX-1] 
  337| 00034B FF                                        
  337| 00034C 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  337| 00034F 00000000                                  
  337| 000353 8B75                        MOV    ESI, [EBP-36] 
  337| 000355 DC                                        
  337| 000356 83FE                        CMP    ESI, 1 
  337| 000358 01                                        
  337|                 L96:                             
  337| 000359 0F8C                        JL     L97    
  337| 00035B 9C020000                                  
  337| 00035F 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  337| 000361 00000000                                  
  337| 000365 0F8F                        JG     L97    
  337| 000367 90020000                                  
  337| 00036B 8D34B5                      LEA    ESI, [4*ESI-4] 
  337| 00036E FCFFFFFF                                  
  337| 000372 03D6                        ADD    EDX, ESI 
  337| 000374 8B7C98                      MOV    EDI, [EAX+4*EBX-4] 
  337| 000377 FC                                        
  337| 000378 0FAF3C11                    IMUL   EDI, [ECX+EDX+0] 
  337| 00037C CE                          INTO          
  337| 00037D 03BD                        ADD    EDI, [EBP-132] ;  Sum1
  337| 00037F 7CFFFFFF                                  
  337| 000383 CE                          INTO          
  337| 000384 89BD                        MOV    [EBP-132], EDI ;  Sum1
  337| 000386 7CFFFFFF                                  
;  Source Line # 338
  338| 00038A 8B45                        MOV    EAX, [EBP-32] 
  338| 00038C E0                                        
  338| 00038D 3945                        CMP    [EBP-28], EAX 
  338| 00038F E4                                        
  338| 000390 74                          JE     SHORT L57 
  338| 000391 09                                        
  338| 000392 8B45                        MOV    EAX, [EBP-28] 
  338| 000394 E4                                        
  338| 000395 40                          INC    EAX    
  338| 000396 8945                        MOV    [EBP-28], EAX 
  338| 000398 E4                                        
  338| 000399 EB                          JMP    SHORT L59 
  338| 00039A 8A                                        
  338|                 L57:                             
;  Source Line # 339
  339| 00039B 8B95                        MOV    EDX, [EBP-140] ; Spill
  339| 00039D 74FFFFFF                                  
  339| 0003A1 8B42                        MOV    EAX, [EDX+48] 
  339| 0003A3 30                                        
  339| 0003A4 8B98                        MOV    EBX, [EAX-132] ;  C
  339| 0003A6 7CFFFFFF                                  
  339| 0003AA 8B4D                        MOV    ECX, [EBP-36] 
  339| 0003AC DC                                        
  339| 0003AD 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  339| 0003AF 00000000                                  
  339|                 L98:                             
  339| 0003B3 0F8F                        JG     L99    
  339| 0003B5 4E020000                                  
  339| 0003B9 8B748B                      MOV    ESI, [EBX+4*ECX-4] 
  339| 0003BC FC                                        
  339| 0003BD 0FAF75                      IMUL   ESI, [EBP-116] ;  alfa3
  339| 0003C0 8C                                        
  339| 0003C1 CE                          INTO          
  339| 0003C2 03B5                        ADD    ESI, [EBP-132] ;  Sum1
  339| 0003C4 7CFFFFFF                                  
  339| 0003C8 CE                          INTO          
  339| 0003C9 8B7A                        MOV    EDI, [EDX+48] 
  339| 0003CB 30                                        
  339| 0003CC 8B97                        MOV    EDX, [EDI-136] ;  A
  339| 0003CE 78FFFFFF                                  
  339| 0003D2 8B45                        MOV    EAX, [EBP-36] 
  339| 0003D4 DC                                        
  339| 0003D5 3D                          CMP    EAX, 1 
  339| 0003D6 01000000                                  
  339|                 L100:                            
  339| 0003DA 0F8C                        JL     L101   
  339| 0003DC 33020000                                  
  339| 0003E0 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  339| 0003E2 00000000                                  
  339| 0003E6 0F8F                        JG     L101   
  339| 0003E8 27020000                                  
  339| 0003EC 897482                      MOV    [EDX+4*EAX-4], ESI 
  339| 0003EF FC                                        
;  Source Line # 340
  340| 0003F0 C785                        MOV    DWORD PTR [EBP-132], 0 ;  Sum1
  340| 0003F2 7CFFFFFF                                  
  340| 0003F6 00000000                                  
;  Source Line # 341
  341| 0003FA 8B5D                        MOV    EBX, [EBP-40] 
  341| 0003FC D8                                        
  341| 0003FD 395D                        CMP    [EBP-36], EBX 
  341| 0003FF DC                                        
  341| 000400 74                          JE     SHORT L54 
  341| 000401 0C                                        
  341| 000402 8B45                        MOV    EAX, [EBP-36] 
  341| 000404 DC                                        
  341| 000405 40                          INC    EAX    
  341| 000406 8945                        MOV    [EBP-36], EAX 
  341| 000408 DC                                        
  341| 000409 E9                          JMP    L56    
  341| 00040A FDFEFFFF                                  
  341|                 L54:                             
  341| 00040E 8B05                        MOV    EAX, package1.h 
  341| 000410 00000000                                  
  341| 000414 D1E0                        SHL    EAX, 1 
  341| 000416 CE                          INTO          
  341| 000417 40                          INC    EAX    
  341| 000418 CE                          INTO          
  341| 000419 8945                        MOV    [EBP-24], EAX 
  341| 00041B E8                                        
  341| 00041C 6B1D                        IMUL   EBX, package1.h, 3 
  341| 00041E 00000000                                  
  341| 000422 03                                        
  341| 000423 CE                          INTO          
  341| 000424 895D                        MOV    [EBP-20], EBX 
  341| 000426 EC                                        
;  Source Line # 342
  342| 000427 8B4D                        MOV    ECX, [EBP-20] 
  342| 000429 EC                                        
  342| 00042A 394D                        CMP    [EBP-24], ECX 
  342| 00042C E8                                        
  342| 00042D 0F8F                        JG     L64    
  342| 00042F 31010000                                  
  342| 000433 8B45                        MOV    EAX, [EBP-24] 
  342| 000435 E8                                        
  342| 000436 8945                        MOV    [EBP-16], EAX 
  342| 000438 F0                                        
  342|                 L66:                             
  342| 000439 8B05                        MOV    EAX, package1.h 
  342| 00043B 00000000                                  
  342| 00043F D1E0                        SHL    EAX, 1 
  342| 000441 CE                          INTO          
  342| 000442 40                          INC    EAX    
  342| 000443 CE                          INTO          
  342| 000444 8945                        MOV    [EBP-12], EAX 
  342| 000446 F4                                        
  342| 000447 6B1D                        IMUL   EBX, package1.h, 3 
  342| 000449 00000000                                  
  342| 00044D 03                                        
  342| 00044E CE                          INTO          
  342| 00044F 895D                        MOV    [EBP-8], EBX 
  342| 000451 F8                                        
;  Source Line # 343
  343| 000452 8B4D                        MOV    ECX, [EBP-8] 
  343| 000454 F8                                        
  343| 000455 394D                        CMP    [EBP-12], ECX 
  343| 000457 F4                                        
  343| 000458 0F8F                        JG     L67    
  343| 00045A F2000000                                  
  343| 00045E 8B45                        MOV    EAX, [EBP-12] 
  343| 000460 F4                                        
  343| 000461 8945                        MOV    [EBP-4], EAX 
  343| 000463 FC                                        
  343|                 L69:                             
;  Source Line # 344
  344| 000464 8B95                        MOV    EDX, [EBP-140] ; Spill
  344| 000466 74FFFFFF                                  
  344| 00046A 8B42                        MOV    EAX, [EDX+48] 
  344| 00046C 30                                        
  344| 00046D 8B98                        MOV    EBX, [EAX-136] ;  A
  344| 00046F 78FFFFFF                                  
  344| 000473 8B4D                        MOV    ECX, [EBP-16] 
  344| 000475 F0                                        
  344| 000476 83F9                        CMP    ECX, 1 
  344| 000478 01                                        
  344|                 L102:                            
  344| 000479 0F8C                        JL     L103   
  344| 00047B A0010000                                  
  344| 00047F 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  344| 000481 00000000                                  
  344| 000485 0F8F                        JG     L103   
  344| 000487 94010000                                  
  344| 00048B 8B72                        MOV    ESI, [EDX+48] 
  344| 00048D 30                                        
  344| 00048E 8BBE                        MOV    EDI, [ESI-136] ;  A
  344| 000490 78FFFFFF                                  
  344| 000494 8B55                        MOV    EDX, [EBP-4] 
  344| 000496 FC                                        
  344| 000497 83FA                        CMP    EDX, 1 
  344| 000499 01                                        
  344|                 L104:                            
  344| 00049A 0F8C                        JL     L105   
  344| 00049C 8B010000                                  
  344| 0004A0 3B15                        CMP    EDX, package1.vec__constrained_array____1 
  344| 0004A2 00000000                                  
  344| 0004A6 0F8F                        JG     L105   
  344| 0004A8 7F010000                                  
  344| 0004AC 8B4497                      MOV    EAX, [EDI+4*EDX-4] 
  344| 0004AF FC                                        
  344| 0004B0 39448B                      CMP    [EBX+4*ECX-4], EAX 
  344| 0004B3 FC                                        
  344| 0004B4 0F8E                        JLE    L70    
  344| 0004B6 82000000                                  
;  Source Line # 346
  346| 0004BA 8B95                        MOV    EDX, [EBP-140] ; Spill
  346| 0004BC 74FFFFFF                                  
  346| 0004C0 8B42                        MOV    EAX, [EDX+48] 
  346| 0004C2 30                                        
  346| 0004C3 8B98                        MOV    EBX, [EAX-136] ;  A
  346| 0004C5 78FFFFFF                                  
  346| 0004C9 8B4D                        MOV    ECX, [EBP-16] 
  346| 0004CB F0                                        
  346| 0004CC 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  346| 0004CE 00000000                                  
  346|                 L106:                            
  346| 0004D2 0F8F                        JG     L107   
  346| 0004D4 5F010000                                  
  346| 0004D8 8B748B                      MOV    ESI, [EBX+4*ECX-4] 
  346| 0004DB FC                                        
  346| 0004DC 8975                        MOV    [EBP-128], ESI ;  Temp
  346| 0004DE 80                                        
;  Source Line # 347
  347| 0004DF 8B7A                        MOV    EDI, [EDX+48] 
  347| 0004E1 30                                        
  347| 0004E2 8B97                        MOV    EDX, [EDI-136] ;  A
  347| 0004E4 78FFFFFF                                  
  347| 0004E8 8B45                        MOV    EAX, [EBP-4] 
  347| 0004EA FC                                        
  347| 0004EB 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  347| 0004ED 00000000                                  
  347|                 L108:                            
  347| 0004F1 0F8F                        JG     L109   
  347| 0004F3 4C010000                                  
  347| 0004F7 8B9D                        MOV    EBX, [EBP-140] ; Spill
  347| 0004F9 74FFFFFF                                  
  347| 0004FD 8B4B                        MOV    ECX, [EBX+48] 
  347| 0004FF 30                                        
  347| 000500 8BB1                        MOV    ESI, [ECX-136] ;  A
  347| 000502 78FFFFFF                                  
  347| 000506 8B7D                        MOV    EDI, [EBP-16] 
  347| 000508 F0                                        
  347| 000509 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  347| 00050B 00000000                                  
  347|                 L110:                            
  347| 00050F 0F8F                        JG     L111   
  347| 000511 3A010000                                  
  347| 000515 8B5482                      MOV    EDX, [EDX+4*EAX-4] 
  347| 000518 FC                                        
  347| 000519 8954BE                      MOV    [ESI+4*EDI-4], EDX 
  347| 00051C FC                                        
;  Source Line # 348
  348| 00051D 8B43                        MOV    EAX, [EBX+48] 
  348| 00051F 30                                        
  348| 000520 8B98                        MOV    EBX, [EAX-136] ;  A
  348| 000522 78FFFFFF                                  
  348| 000526 8B4D                        MOV    ECX, [EBP-4] 
  348| 000528 FC                                        
  348| 000529 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  348| 00052B 00000000                                  
  348|                 L112:                            
  348| 00052F 0F8F                        JG     L113   
  348| 000531 26010000                                  
  348| 000535 8B75                        MOV    ESI, [EBP-128] ;  Temp
  348| 000537 80                                        
  348| 000538 89748B                      MOV    [EBX+4*ECX-4], ESI 
  348| 00053B FC                                        
;  Source Line # 349
;  Source Line # 350
  350|                 L70:                             
;  Source Line # 351
  351| 00053C 8B45                        MOV    EAX, [EBP-8] 
  351| 00053E F8                                        
  351| 00053F 3945                        CMP    [EBP-4], EAX 
  351| 000541 FC                                        
  351| 000542 74                          JE     SHORT L67 
  351| 000543 0C                                        
  351| 000544 8B45                        MOV    EAX, [EBP-4] 
  351| 000546 FC                                        
  351| 000547 40                          INC    EAX    
  351| 000548 8945                        MOV    [EBP-4], EAX 
  351| 00054A FC                                        
  351| 00054B E9                          JMP    L69    
  351| 00054C 14FFFFFF                                  
  351|                 L67:                             
;  Source Line # 352
  352| 000550 8B45                        MOV    EAX, [EBP-20] 
  352| 000552 EC                                        
  352| 000553 3945                        CMP    [EBP-16], EAX 
  352| 000555 F0                                        
  352| 000556 74                          JE     SHORT L64 
  352| 000557 0C                                        
  352| 000558 8B45                        MOV    EAX, [EBP-16] 
  352| 00055A F0                                        
  352| 00055B 40                          INC    EAX    
  352| 00055C 8945                        MOV    [EBP-16], EAX 
  352| 00055E F0                                        
  352| 00055F E9                          JMP    L66    
  352| 000560 D5FEFFFF                                  
  352|                 L64:                             
;  Source Line # 354
  354| 000564 68                          PUSH   lab4.mon.aht3 
  354| 000565 00000000                                  
  354| 000569 6A                          PUSH   0      
  354| 00056A 00                                        
  354| 00056B 8B95                        MOV    EDX, [EBP-140] ; Spill
  354| 00056D 74FFFFFF                                  
  354| 000571 8B42                        MOV    EAX, [EDX+48] 
  354| 000573 30                                        
  354| 000574 8B58                        MOV    EBX, [EAX-44] ;  MON
  354| 000576 D4                                        
  354| 000577 53                          PUSH   EBX    
  354| 000578 E8                          CALL   rts_protected_procedure_call 
  354| 000579 00000000                                  
;  Source Line # 356
  356| 00057D 68                          PUSH   __lcl.00000354 
  356| 00057E 00000000                                  
  356| 000582 68                          PUSH   __lcl.00000353 
  356| 000583 00000000                                  
  356| 000587 E8                          CALL   ada.text_io.put_line__2 
  356| 000588 00000000                                  
  356| 00058C 8D4D                        LEA    ECX, [EBP-124] ;  dyn_temp
  356| 00058E 84                                        
  356| 00058F 51                          PUSH   ECX    
  356| 000590 E8                          CALL   rts_ss_release 
  356| 000591 00000000                                  
;  Source Line # 357
  357| 000595 8BE5                        MOV    ESP, EBP 
  357| 000597 5D                          POP    EBP    
  357| 000598 C2                          RET    4      
  357| 000599 0400                                      
  357|                 L81:                             
  357| 00059B 8D05                        LEA    EAX, L80+5 
  357| 00059D DF010000                                  
  357| 0005A1 50                          PUSH   EAX    
  357| 0005A2 E9                          JMP    rts_raise_constraint_error 
  357| 0005A3 00000000                                  
  357|                 L83:                             
  357| 0005A7 8D05                        LEA    EAX, L82+5 
  357| 0005A9 F5010000                                  
  357| 0005AD 50                          PUSH   EAX    
  357| 0005AE E9                          JMP    rts_raise_constraint_error 
  357| 0005AF 00000000                                  
  357|                 L85:                             
  357| 0005B3 8D05                        LEA    EAX, L84+5 
  357| 0005B5 1C020000                                  
  357| 0005B9 50                          PUSH   EAX    
  357| 0005BA E9                          JMP    rts_raise_constraint_error 
  357| 0005BB 00000000                                  
  357|                 L87:                             
  357| 0005BF 8D05                        LEA    EAX, L86+5 
  357| 0005C1 35020000                                  
  357| 0005C5 50                          PUSH   EAX    
  357| 0005C6 E9                          JMP    rts_raise_constraint_error 
  357| 0005C7 00000000                                  
  357|                 L89:                             
  357| 0005CB 8D05                        LEA    EAX, L88+5 
  357| 0005CD 79020000                                  
  357| 0005D1 50                          PUSH   EAX    
  357| 0005D2 E9                          JMP    rts_raise_constraint_error 
  357| 0005D3 00000000                                  
  357|                 L91:                             
  357| 0005D7 8D05                        LEA    EAX, L90+5 
  357| 0005D9 8F020000                                  
  357| 0005DD 50                          PUSH   EAX    
  357| 0005DE E9                          JMP    rts_raise_constraint_error 
  357| 0005DF 00000000                                  
  357|                 L93:                             
  357| 0005E3 8D05                        LEA    EAX, L92+5 
  357| 0005E5 36030000                                  
  357| 0005E9 50                          PUSH   EAX    
  357| 0005EA E9                          JMP    rts_raise_constraint_error 
  357| 0005EB 00000000                                  
  357|                 L95:                             
  357| 0005EF 8D05                        LEA    EAX, L94+5 
  357| 0005F1 48030000                                  
  357| 0005F5 50                          PUSH   EAX    
  357| 0005F6 E9                          JMP    rts_raise_constraint_error 
  357| 0005F7 00000000                                  
  357|                 L97:                             
  357| 0005FB 8D05                        LEA    EAX, L96+5 
  357| 0005FD 5E030000                                  
  357| 000601 50                          PUSH   EAX    
  357| 000602 E9                          JMP    rts_raise_constraint_error 
  357| 000603 00000000                                  
  357|                 L99:                             
  357| 000607 8D05                        LEA    EAX, L98+5 
  357| 000609 B8030000                                  
  357| 00060D 50                          PUSH   EAX    
  357| 00060E E9                          JMP    rts_raise_constraint_error 
  357| 00060F 00000000                                  
  357|                 L101:                            
  357| 000613 8D05                        LEA    EAX, L100+5 
  357| 000615 DF030000                                  
  357| 000619 50                          PUSH   EAX    
  357| 00061A E9                          JMP    rts_raise_constraint_error 
  357| 00061B 00000000                                  
  357|                 L103:                            
  357| 00061F 8D05                        LEA    EAX, L102+5 
  357| 000621 7E040000                                  
  357| 000625 50                          PUSH   EAX    
  357| 000626 E9                          JMP    rts_raise_constraint_error 
  357| 000627 00000000                                  
  357|                 L105:                            
  357| 00062B 8D05                        LEA    EAX, L104+5 
  357| 00062D 9F040000                                  
  357| 000631 50                          PUSH   EAX    
  357| 000632 E9                          JMP    rts_raise_constraint_error 
  357| 000633 00000000                                  
  357|                 L107:                            
  357| 000637 8D05                        LEA    EAX, L106+5 
  357| 000639 D7040000                                  
  357| 00063D 50                          PUSH   EAX    
  357| 00063E E9                          JMP    rts_raise_constraint_error 
  357| 00063F 00000000                                  
  357|                 L109:                            
  357| 000643 8D05                        LEA    EAX, L108+5 
  357| 000645 F6040000                                  
  357| 000649 50                          PUSH   EAX    
  357| 00064A E9                          JMP    rts_raise_constraint_error 
  357| 00064B 00000000                                  
  357|                 L111:                            
  357| 00064F 8D05                        LEA    EAX, L110+5 
  357| 000651 14050000                                  
  357| 000655 50                          PUSH   EAX    
  357| 000656 E9                          JMP    rts_raise_constraint_error 
  357| 000657 00000000                                  
  357|                 L113:                            
  357| 00065B 8D05                        LEA    EAX, L112+5 
  357| 00065D 34050000                                  
  357| 000661 50                          PUSH   EAX    
  357| 000662 E9                          JMP    rts_raise_constraint_error 
  357| 000663 00000000                                  
                       ;                                
                       lab4.start.t3__body ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000450     DD     00002A01 
                                          DD     00000133 
                                          DD     lab4.start.t3__body 
                                          DD     __lcl.00000467 
                                          DD     00000135 
                                          DD     lab4.start.t3__body+00000013H 
                                          DD     __lcl.00000467 
                                          DD     00000136 
                                          DD     lab4.start.t3__body+00000060H 
                                          DD     __lcl.00000467 
                                          DD     00000137 
                                          DD     lab4.start.t3__body+000000A2H 
                                          DD     __lcl.00000467 
                                          DD     00000138 
                                          DD     lab4.start.t3__body+000000A7H 
                                          DD     __lcl.00000467 
                                          DD     0000013B 
                                          DD     lab4.start.t3__body+000000B6H 
                                          DD     __lcl.00000467 
                                          DD     0000013C 
                                          DD     lab4.start.t3__body+000000BFH 
                                          DD     __lcl.00000467 
                                          DD     0000013E 
                                          DD     lab4.start.t3__body+000000E0H 
                                          DD     __lcl.00000467 
                                          DD     00000140 
                                          DD     lab4.start.t3__body+000000F9H 
                                          DD     __lcl.00000467 
                                          DD     00000142 
                                          DD     lab4.start.t3__body+00000111H 
                                          DD     __lcl.00000467 
                                          DD     00000143 
                                          DD     lab4.start.t3__body+00000138H 
                                          DD     __lcl.00000467 
                                          DD     00000145 
                                          DD     lab4.start.t3__body+00000162H 
                                          DD     __lcl.00000467 
                                          DD     00000146 
                                          DD     lab4.start.t3__body+0000018CH 
                                          DD     __lcl.00000467 
                                          DD     00000147 
                                          DD     lab4.start.t3__body+0000019EH 
                                          DD     __lcl.00000467 
                                          DD     00000148 
                                          DD     lab4.start.t3__body+000001B1H 
                                          DD     __lcl.00000467 
                                          DD     00000149 
                                          DD     lab4.start.t3__body+000001C2H 
                                          DD     __lcl.00000467 
                                          DD     0000014A 
                                          DD     lab4.start.t3__body+00000254H 
                                          DD     __lcl.00000467 
                                          DD     0000014B 
                                          DD     lab4.start.t3__body+00000268H 
                                          DD     __lcl.00000467 
                                          DD     0000014C 
                                          DD     lab4.start.t3__body+000002AEH 
                                          DD     __lcl.00000467 
                                          DD     0000014D 
                                          DD     lab4.start.t3__body+000002C2H 
                                          DD     __lcl.00000467 
                                          DD     0000014E 
                                          DD     lab4.start.t3__body+000002D6H 
                                          DD     __lcl.00000467 
                                          DD     0000014F 
                                          DD     lab4.start.t3__body+000002F9H 
                                          DD     __lcl.00000467 
                                          DD     00000150 
                                          DD     lab4.start.t3__body+00000314H 
                                          DD     __lcl.00000467 
                                          DD     00000151 
                                          DD     lab4.start.t3__body+00000325H 
                                          DD     __lcl.00000467 
                                          DD     00000152 
                                          DD     lab4.start.t3__body+0000038AH 
                                          DD     __lcl.00000467 
                                          DD     00000153 
                                          DD     lab4.start.t3__body+0000039BH 
                                          DD     __lcl.00000467 
                                          DD     00000154 
                                          DD     lab4.start.t3__body+000003F0H 
                                          DD     __lcl.00000467 
                                          DD     00000155 
                                          DD     lab4.start.t3__body+000003FAH 
                                          DD     __lcl.00000467 
                                          DD     00000156 
                                          DD     lab4.start.t3__body+00000427H 
                                          DD     __lcl.00000467 
                                          DD     00000157 
                                          DD     lab4.start.t3__body+00000452H 
                                          DD     __lcl.00000467 
                                          DD     00000158 
                                          DD     lab4.start.t3__body+00000464H 
                                          DD     __lcl.00000467 
                                          DD     0000015A 
                                          DD     lab4.start.t3__body+000004BAH 
                                          DD     __lcl.00000467 
                                          DD     0000015B 
                                          DD     lab4.start.t3__body+000004DFH 
                                          DD     __lcl.00000467 
                                          DD     0000015C 
                                          DD     lab4.start.t3__body+0000051DH 
                                          DD     __lcl.00000467 
                                          DD     0000015D 
                                          DD     lab4.start.t3__body+0000053CH 
                                          DD     __lcl.00000467 
                                          DD     0000015E 
                                          DD     lab4.start.t3__body+0000053CH 
                                          DD     __lcl.00000467 
                                          DD     0000015F 
                                          DD     lab4.start.t3__body+0000053CH 
                                          DD     __lcl.00000467 
                                          DD     00000160 
                                          DD     lab4.start.t3__body+00000550H 
                                          DD     __lcl.00000467 
                                          DD     00000162 
                                          DD     lab4.start.t3__body+00000564H 
                                          DD     __lcl.00000467 
                                          DD     00000164 
                                          DD     lab4.start.t3__body+0000057DH 
                                          DD     __lcl.00000467 
                                          DD     00000165 
                                          DD     lab4.start.t3__body+00000595H 
                                          DD     __lcl.00000467 
                                          DD     00000165 
                                          DD     lab4.start.t3__body+00000663H 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 508

                       ;                                
                       ;  Start of procedure lab4.start.t4__body   
                       ;                                
                                          PUBLIC lab4.start.t4__body 
                       lab4.start.t4__body PROC  NEAR   
;  Source Line # 360
  360| 000000 64                          FS:           
  360| 000001 8B15                        MOV    EDX, 4 
  360| 000003 04000000                                  
  360| 000007 8B52                        MOV    EDX, [EDX-4] 
  360| 000009 FC                                        
  360| 00000A 55                          PUSH   EBP    
  360| 00000B 8BEC                        MOV    EBP, ESP 
  360| 00000D 81EC                        SUB    ESP, 160 
  360| 00000F A0000000                                  
;  Source Line # 362
  362| 000013 8B02                        MOV    EAX, [EDX+0] 
  362| 000015 8985                        MOV    [EBP-144], EAX ;  dyn_temp
  362| 000017 70FFFFFF                                  
  362| 00001B 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  362| 00001D 00000000                                  
  362| 000021 83EB                        SUB    EBX, 1 
  362| 000023 01                                        
  362| 000024 7D                          JGE    SHORT L88 
  362| 000025 03                                        
  362| 000026 33DB                        XOR    EBX, EBX 
  362| 000028 4B                          DEC    EBX    
  362|                 L88:                             
  362| 000029 CE                          INTO          
  362| 00002A 43                          INC    EBX    
  362| 00002B CE                          INTO          
  362| 00002C 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  362| 00002F 00000000                                  
  362| 000033 CE                          INTO          
  362| 000034 53                          PUSH   EBX    
  362| 000035 8995                        MOV    [EBP-160], EDX ; Spill
  362| 000037 60FFFFFF                                  
  362| 00003B E8                          CALL   rts_ss_allocate 
  362| 00003C 00000000                                  
  362| 000040 8985                        MOV    [EBP-140], EAX ;  MO4
  362| 000042 74FFFFFF                                  
  362| 000046 8B0D                        MOV    ECX, package1.vec__constrained_array____1 
  362| 000048 00000000                                  
  362| 00004C 83E9                        SUB    ECX, 1 
  362| 00004E 01                                        
  362| 00004F 7D                          JGE    SHORT L89 
  362| 000050 03                                        
  362| 000051 33C9                        XOR    ECX, ECX 
  362| 000053 49                          DEC    ECX    
  362|                 L89:                             
  362| 000054 CE                          INTO          
  362| 000055 41                          INC    ECX    
  362| 000056 CE                          INTO          
  362| 000057 D1E1                        SHL    ECX, 1 
  362| 000059 CE                          INTO          
  362| 00005A D1E1                        SHL    ECX, 1 
  362| 00005C CE                          INTO          
  362| 00005D 51                          PUSH   ECX    
  362| 00005E E8                          CALL   rts_ss_allocate 
  362| 00005F 00000000                                  
  362| 000063 8985                        MOV    [EBP-132], EAX ;  D4
  362| 000065 7CFFFFFF                                  
;  Source Line # 363
  363| 000069 8B35                        MOV    ESI, package1.matr__constrained_array____1 
  363| 00006B 00000000                                  
  363| 00006F 83EE                        SUB    ESI, 1 
  363| 000071 01                                        
  363| 000072 7D                          JGE    SHORT L90 
  363| 000073 03                                        
  363| 000074 33F6                        XOR    ESI, ESI 
  363| 000076 4E                          DEC    ESI    
  363|                 L90:                             
  363| 000077 CE                          INTO          
  363| 000078 46                          INC    ESI    
  363| 000079 CE                          INTO          
  363| 00007A 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  363| 00007D 00000000                                  
  363| 000081 CE                          INTO          
  363| 000082 56                          PUSH   ESI    
  363| 000083 E8                          CALL   rts_ss_allocate 
  363| 000084 00000000                                  
  363| 000088 8945                        MOV    [EBP-128], EAX ;  MTF
  363| 00008A 80                                        
;  Source Line # 365
  365| 00008B 8B3D                        MOV    EDI, package1.vec__constrained_array____1 
  365| 00008D 00000000                                  
  365| 000091 83EF                        SUB    EDI, 1 
  365| 000093 01                                        
  365| 000094 7D                          JGE    SHORT L91 
  365| 000095 03                                        
  365| 000096 33FF                        XOR    EDI, EDI 
  365| 000098 4F                          DEC    EDI    
  365|                 L91:                             
  365| 000099 CE                          INTO          
  365| 00009A 47                          INC    EDI    
  365| 00009B CE                          INTO          
  365| 00009C D1E7                        SHL    EDI, 1 
  365| 00009E CE                          INTO          
  365| 00009F D1E7                        SHL    EDI, 1 
  365| 0000A1 CE                          INTO          
  365| 0000A2 57                          PUSH   EDI    
  365| 0000A3 E8                          CALL   rts_ss_allocate 
  365| 0000A4 00000000                                  
  365| 0000A8 8945                        MOV    [EBP-116], EAX ;  Tv
  365| 0000AA 8C                                        
;  Source Line # 366
  366| 0000AB E8                          CALL   rts_activation_succeeded 
  366| 0000AC 00000000                                  
;  Source Line # 367
  367| 0000B0 68                          PUSH   __lcl.00000361 
  367| 0000B1 00000000                                  
  367| 0000B5 68                          PUSH   __lcl.00000360 
  367| 0000B6 00000000                                  
  367| 0000BA E8                          CALL   ada.text_io.put_line__2 
  367| 0000BB 00000000                                  
;  Source Line # 370
  370| 0000BF 6A                          PUSH   0      
  370| 0000C0 00                                        
  370| 0000C1 6A                          PUSH   0      
  370| 0000C2 00                                        
  370| 0000C3 6A                          PUSH   0      
  370| 0000C4 00                                        
  370| 0000C5 8B95                        MOV    EDX, [EBP-160] ; Spill
  370| 0000C7 60FFFFFF                                  
  370| 0000CB 8B5A                        MOV    EBX, [EDX+48] 
  370| 0000CD 30                                        
  370| 0000CE 8B4B                        MOV    ECX, [EBX-44] ;  MON
  370| 0000D0 D4                                        
  370| 0000D1 51                          PUSH   ECX    
  370| 0000D2 E8                          CALL   rts_protected_entry_call 
  370| 0000D3 00000000                                  
;  Source Line # 372
  372| 0000D7 8D75                        LEA    ESI, [EBP-112] 
  372| 0000D9 90                                        
  372| 0000DA 8975                        MOV    [EBP-108], ESI 
  372| 0000DC 94                                        
  372| 0000DD 68                          PUSH   lab4.mon.getalfa 
  372| 0000DE 00000000                                  
  372| 0000E2 8D7D                        LEA    EDI, [EBP-108] 
  372| 0000E4 94                                        
  372| 0000E5 57                          PUSH   EDI    
  372| 0000E6 8B95                        MOV    EDX, [EBP-160] ; Spill
  372| 0000E8 60FFFFFF                                  
  372| 0000EC 8B42                        MOV    EAX, [EDX+48] 
  372| 0000EE 30                                        
  372| 0000EF 8B58                        MOV    EBX, [EAX-44] ;  MON
  372| 0000F1 D4                                        
  372| 0000F2 53                          PUSH   EBX    
  372| 0000F3 E8                          CALL   rts_entryless_protected_subp_call 
  372| 0000F4 00000000                                  
  372| 0000F8 8B4D                        MOV    ECX, [EBP-112] 
  372| 0000FA 90                                        
  372| 0000FB 898D                        MOV    [EBP-136], ECX ;  alfa4
  372| 0000FD 78FFFFFF                                  
;  Source Line # 373
  373| 000101 8BB5                        MOV    ESI, [EBP-132] ;  D4
  373| 000103 7CFFFFFF                                  
  373| 000107 8975                        MOV    [EBP-104], ESI 
  373| 000109 98                                        
  373| 00010A 68                          PUSH   lab4.mon.getd 
  373| 00010B 00000000                                  
  373| 00010F 8D7D                        LEA    EDI, [EBP-104] 
  373| 000111 98                                        
  373| 000112 57                          PUSH   EDI    
  373| 000113 8B95                        MOV    EDX, [EBP-160] ; Spill
  373| 000115 60FFFFFF                                  
  373| 000119 8B42                        MOV    EAX, [EDX+48] 
  373| 00011B 30                                        
  373| 00011C 8B58                        MOV    EBX, [EAX-44] ;  MON
  373| 00011E D4                                        
  373| 00011F 53                          PUSH   EBX    
  373| 000120 E8                          CALL   rts_entryless_protected_subp_call 
  373| 000121 00000000                                  
;  Source Line # 374
  374| 000125 8B8D                        MOV    ECX, [EBP-140] ;  MO4
  374| 000127 74FFFFFF                                  
  374| 00012B 894D                        MOV    [EBP-100], ECX 
  374| 00012D 9C                                        
  374| 00012E 68                          PUSH   lab4.mon.getmo 
  374| 00012F 00000000                                  
  374| 000133 8D75                        LEA    ESI, [EBP-100] 
  374| 000135 9C                                        
  374| 000136 56                          PUSH   ESI    
  374| 000137 8B95                        MOV    EDX, [EBP-160] ; Spill
  374| 000139 60FFFFFF                                  
  374| 00013D 8B7A                        MOV    EDI, [EDX+48] 
  374| 00013F 30                                        
  374| 000140 8B47                        MOV    EAX, [EDI-44] ;  MON
  374| 000142 D4                                        
  374| 000143 50                          PUSH   EAX    
  374| 000144 E8                          CALL   rts_entryless_protected_subp_call 
  374| 000145 00000000                                  
  374| 000149 8B1D                        MOV    EBX, package1.n 
  374| 00014B 00000000                                  
  374| 00014F 895D                        MOV    [EBP-96], EBX 
  374| 000151 A0                                        
;  Source Line # 376
  376| 000152 837D                        CMP    DWORD PTR [EBP-96], 0 
  376| 000154 A0                                        
  376| 000155 00                                        
  376| 000156 0F8E                        JLE    L39    
  376| 000158 6A010000                                  
  376| 00015C C745                        MOV    DWORD PTR [EBP-92], 1 
  376| 00015E A4                                        
  376| 00015F 01000000                                  
  376|                 L41:                             
  376| 000163 6B05                        IMUL   EAX, package1.h, 3 
  376| 000165 00000000                                  
  376| 000169 03                                        
  376| 00016A CE                          INTO          
  376| 00016B 40                          INC    EAX    
  376| 00016C CE                          INTO          
  376| 00016D 8945                        MOV    [EBP-88], EAX 
  376| 00016F A8                                        
  376| 000170 8B1D                        MOV    EBX, package1.n 
  376| 000172 00000000                                  
  376| 000176 895D                        MOV    [EBP-84], EBX 
  376| 000178 AC                                        
;  Source Line # 377
  377| 000179 8B4D                        MOV    ECX, [EBP-84] 
  377| 00017B AC                                        
  377| 00017C 394D                        CMP    [EBP-88], ECX 
  377| 00017E A8                                        
  377| 00017F 0F8F                        JG     L42    
  377| 000181 2D010000                                  
  377| 000185 8B45                        MOV    EAX, [EBP-88] 
  377| 000187 A8                                        
  377| 000188 8945                        MOV    [EBP-80], EAX 
  377| 00018A B0                                        
  377|                 L44:                             
;  Source Line # 378
  378| 00018B C785                        MOV    DWORD PTR [EBP-152], 0 ;  Sum1
  378| 00018D 68FFFFFF                                  
  378| 000191 00000000                                  
  378| 000195 8B05                        MOV    EAX, package1.n 
  378| 000197 00000000                                  
  378| 00019B 8945                        MOV    [EBP-76], EAX 
  378| 00019D B4                                        
;  Source Line # 379
  379| 00019E 837D                        CMP    DWORD PTR [EBP-76], 0 
  379| 0001A0 B4                                        
  379| 0001A1 00                                        
  379| 0001A2 0F8E                        JLE    L45    
  379| 0001A4 B0000000                                  
  379| 0001A8 C745                        MOV    DWORD PTR [EBP-72], 1 
  379| 0001AA B8                                        
  379| 0001AB 01000000                                  
  379|                 L47:                             
;  Source Line # 380
  380| 0001AF 8B95                        MOV    EDX, [EBP-160] ; Spill
  380| 0001B1 60FFFFFF                                  
  380| 0001B5 8B42                        MOV    EAX, [EDX+48] 
  380| 0001B7 30                                        
  380| 0001B8 8B98                        MOV    EBX, [EAX-140] ;  MT
  380| 0001BA 74FFFFFF                                  
  380| 0001BE 8B4D                        MOV    ECX, [EBP-72] 
  380| 0001C0 B8                                        
  380| 0001C1 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  380| 0001C3 00000000                                  
  380|                 L92:                             
  380| 0001C7 0F8F                        JG     L93    
  380| 0001C9 BC050000                                  
  380| 0001CD 8D49                        LEA    ECX, [ECX-1] 
  380| 0001CF FF                                        
  380| 0001D0 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  380| 0001D3 00000000                                  
  380| 0001D7 8B75                        MOV    ESI, [EBP-80] 
  380| 0001D9 B0                                        
  380| 0001DA 83FE                        CMP    ESI, 1 
  380| 0001DC 01                                        
  380|                 L94:                             
  380| 0001DD 0F8C                        JL     L95    
  380| 0001DF B2050000                                  
  380| 0001E3 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  380| 0001E5 00000000                                  
  380| 0001E9 0F8F                        JG     L95    
  380| 0001EB A6050000                                  
  380| 0001EF 8D34B5                      LEA    ESI, [4*ESI-4] 
  380| 0001F2 FCFFFFFF                                  
  380| 0001F6 03CE                        ADD    ECX, ESI 
  380| 0001F8 8BBD                        MOV    EDI, [EBP-140] ;  MO4
  380| 0001FA 74FFFFFF                                  
  380| 0001FE 8B55                        MOV    EDX, [EBP-92] 
  380| 000200 A4                                        
  380| 000201 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  380| 000203 00000000                                  
  380|                 L96:                             
  380| 000207 0F8F                        JG     L97    
  380| 000209 94050000                                  
  380| 00020D 8D52                        LEA    EDX, [EDX-1] 
  380| 00020F FF                                        
  380| 000210 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  380| 000213 00000000                                  
  380| 000217 8B45                        MOV    EAX, [EBP-72] 
  380| 000219 B8                                        
  380| 00021A 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  380| 00021C 00000000                                  
  380|                 L98:                             
  380| 000220 0F8F                        JG     L99    
  380| 000222 87050000                                  
  380| 000226 8D0485                      LEA    EAX, [4*EAX-4] 
  380| 000229 FCFFFFFF                                  
  380| 00022D 03D0                        ADD    EDX, EAX 
  380| 00022F 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  380| 000232 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  380| 000236 CE                          INTO          
  380| 000237 039D                        ADD    EBX, [EBP-152] ;  Sum1
  380| 000239 68FFFFFF                                  
  380| 00023D CE                          INTO          
  380| 00023E 899D                        MOV    [EBP-152], EBX ;  Sum1
  380| 000240 68FFFFFF                                  
;  Source Line # 381
  381| 000244 8B75                        MOV    ESI, [EBP-76] 
  381| 000246 B4                                        
  381| 000247 3975                        CMP    [EBP-72], ESI 
  381| 000249 B8                                        
  381| 00024A 74                          JE     SHORT L45 
  381| 00024B 0C                                        
  381| 00024C 8B45                        MOV    EAX, [EBP-72] 
  381| 00024E B8                                        
  381| 00024F 40                          INC    EAX    
  381| 000250 8945                        MOV    [EBP-72], EAX 
  381| 000252 B8                                        
  381| 000253 E9                          JMP    L47    
  381| 000254 57FFFFFF                                  
  381|                 L45:                             
;  Source Line # 382
  382| 000258 8B45                        MOV    EAX, [EBP-128] ;  MTF
  382| 00025A 80                                        
  382| 00025B 8B5D                        MOV    EBX, [EBP-92] 
  382| 00025D A4                                        
  382| 00025E 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
  382| 000260 00000000                                  
  382|                 L100:                            
  382| 000264 0F8F                        JG     L101   
  382| 000266 4F050000                                  
  382| 00026A 8D5B                        LEA    EBX, [EBX-1] 
  382| 00026C FF                                        
  382| 00026D 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  382| 000270 00000000                                  
  382| 000274 8B4D                        MOV    ECX, [EBP-80] 
  382| 000276 B0                                        
  382| 000277 83F9                        CMP    ECX, 1 
  382| 000279 01                                        
  382|                 L102:                            
  382| 00027A 0F8C                        JL     L103   
  382| 00027C 45050000                                  
  382| 000280 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  382| 000282 00000000                                  
  382| 000286 0F8F                        JG     L103   
  382| 000288 39050000                                  
  382| 00028C 8D0C8D                      LEA    ECX, [4*ECX-4] 
  382| 00028F FCFFFFFF                                  
  382| 000293 03D9                        ADD    EBX, ECX 
  382| 000295 8B95                        MOV    EDX, [EBP-152] ;  Sum1
  382| 000297 68FFFFFF                                  
  382| 00029B 891418                      MOV    [EAX+EBX+0], EDX 
;  Source Line # 383
  383| 00029E 8B75                        MOV    ESI, [EBP-84] 
  383| 0002A0 AC                                        
  383| 0002A1 3975                        CMP    [EBP-80], ESI 
  383| 0002A3 B0                                        
  383| 0002A4 74                          JE     SHORT L42 
  383| 0002A5 0C                                        
  383| 0002A6 8B45                        MOV    EAX, [EBP-80] 
  383| 0002A8 B0                                        
  383| 0002A9 40                          INC    EAX    
  383| 0002AA 8945                        MOV    [EBP-80], EAX 
  383| 0002AC B0                                        
  383| 0002AD E9                          JMP    L44    
  383| 0002AE D9FEFFFF                                  
  383|                 L42:                             
;  Source Line # 384
  384| 0002B2 8B45                        MOV    EAX, [EBP-96] 
  384| 0002B4 A0                                        
  384| 0002B5 3945                        CMP    [EBP-92], EAX 
  384| 0002B7 A4                                        
  384| 0002B8 74                          JE     SHORT L39 
  384| 0002B9 0C                                        
  384| 0002BA 8B45                        MOV    EAX, [EBP-92] 
  384| 0002BC A4                                        
  384| 0002BD 40                          INC    EAX    
  384| 0002BE 8945                        MOV    [EBP-92], EAX 
  384| 0002C0 A4                                        
  384| 0002C1 E9                          JMP    L41    
  384| 0002C2 9DFEFFFF                                  
  384|                 L39:                             
;  Source Line # 385
  385| 0002C6 C785                        MOV    DWORD PTR [EBP-152], 0 ;  Sum1
  385| 0002C8 68FFFFFF                                  
  385| 0002CC 00000000                                  
  385| 0002D0 6B05                        IMUL   EAX, package1.h, 3 
  385| 0002D2 00000000                                  
  385| 0002D6 03                                        
  385| 0002D7 CE                          INTO          
  385| 0002D8 40                          INC    EAX    
  385| 0002D9 CE                          INTO          
  385| 0002DA 8945                        MOV    [EBP-68], EAX 
  385| 0002DC BC                                        
  385| 0002DD 8B1D                        MOV    EBX, package1.n 
  385| 0002DF 00000000                                  
  385| 0002E3 895D                        MOV    [EBP-64], EBX 
  385| 0002E5 C0                                        
;  Source Line # 386
  386| 0002E6 8B4D                        MOV    ECX, [EBP-64] 
  386| 0002E8 C0                                        
  386| 0002E9 394D                        CMP    [EBP-68], ECX 
  386| 0002EB BC                                        
  386| 0002EC 0F8F                        JG     L54    
  386| 0002EE 0F010000                                  
  386| 0002F2 8B45                        MOV    EAX, [EBP-68] 
  386| 0002F4 BC                                        
  386| 0002F5 8945                        MOV    [EBP-60], EAX 
  386| 0002F7 C4                                        
  386|                 L56:                             
  386| 0002F8 8B05                        MOV    EAX, package1.n 
  386| 0002FA 00000000                                  
  386| 0002FE 8945                        MOV    [EBP-56], EAX 
  386| 000300 C8                                        
;  Source Line # 387
  387| 000301 837D                        CMP    DWORD PTR [EBP-56], 0 
  387| 000303 C8                                        
  387| 000304 00                                        
  387| 000305 0F8E                        JLE    L57    
  387| 000307 80000000                                  
  387| 00030B C745                        MOV    DWORD PTR [EBP-52], 1 
  387| 00030D CC                                        
  387| 00030E 01000000                                  
  387|                 L59:                             
;  Source Line # 388
  388| 000312 8B85                        MOV    EAX, [EBP-132] ;  D4
  388| 000314 7CFFFFFF                                  
  388| 000318 8B5D                        MOV    EBX, [EBP-52] 
  388| 00031A CC                                        
  388| 00031B 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
  388| 00031D 00000000                                  
  388|                 L104:                            
  388| 000321 0F8F                        JG     L105   
  388| 000323 AA040000                                  
  388| 000327 8B4D                        MOV    ECX, [EBP-128] ;  MTF
  388| 000329 80                                        
  388| 00032A 8B55                        MOV    EDX, [EBP-52] 
  388| 00032C CC                                        
  388| 00032D 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  388| 00032F 00000000                                  
  388|                 L106:                            
  388| 000333 0F8F                        JG     L107   
  388| 000335 A4040000                                  
  388| 000339 8D52                        LEA    EDX, [EDX-1] 
  388| 00033B FF                                        
  388| 00033C 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  388| 00033F 00000000                                  
  388| 000343 8B75                        MOV    ESI, [EBP-60] 
  388| 000345 C4                                        
  388| 000346 83FE                        CMP    ESI, 1 
  388| 000348 01                                        
  388|                 L108:                            
  388| 000349 0F8C                        JL     L109   
  388| 00034B 9A040000                                  
  388| 00034F 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  388| 000351 00000000                                  
  388| 000355 0F8F                        JG     L109   
  388| 000357 8E040000                                  
  388| 00035B 8D34B5                      LEA    ESI, [4*ESI-4] 
  388| 00035E FCFFFFFF                                  
  388| 000362 03D6                        ADD    EDX, ESI 
  388| 000364 8B7C98                      MOV    EDI, [EAX+4*EBX-4] 
  388| 000367 FC                                        
  388| 000368 0FAF3C11                    IMUL   EDI, [ECX+EDX+0] 
  388| 00036C CE                          INTO          
  388| 00036D 03BD                        ADD    EDI, [EBP-152] ;  Sum1
  388| 00036F 68FFFFFF                                  
  388| 000373 CE                          INTO          
  388| 000374 89BD                        MOV    [EBP-152], EDI ;  Sum1
  388| 000376 68FFFFFF                                  
;  Source Line # 389
  389| 00037A 8B45                        MOV    EAX, [EBP-56] 
  389| 00037C C8                                        
  389| 00037D 3945                        CMP    [EBP-52], EAX 
  389| 00037F CC                                        
  389| 000380 74                          JE     SHORT L57 
  389| 000381 09                                        
  389| 000382 8B45                        MOV    EAX, [EBP-52] 
  389| 000384 CC                                        
  389| 000385 40                          INC    EAX    
  389| 000386 8945                        MOV    [EBP-52], EAX 
  389| 000388 CC                                        
  389| 000389 EB                          JMP    SHORT L59 
  389| 00038A 87                                        
  389|                 L57:                             
;  Source Line # 390
  390| 00038B 8B95                        MOV    EDX, [EBP-160] ; Spill
  390| 00038D 60FFFFFF                                  
  390| 000391 8B42                        MOV    EAX, [EDX+48] 
  390| 000393 30                                        
  390| 000394 8B98                        MOV    EBX, [EAX-132] ;  C
  390| 000396 7CFFFFFF                                  
  390| 00039A 8B4D                        MOV    ECX, [EBP-60] 
  390| 00039C C4                                        
  390| 00039D 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  390| 00039F 00000000                                  
  390|                 L110:                            
  390| 0003A3 0F8F                        JG     L111   
  390| 0003A5 4C040000                                  
  390| 0003A9 8B748B                      MOV    ESI, [EBX+4*ECX-4] 
  390| 0003AC FC                                        
  390| 0003AD 0FAFB5                      IMUL   ESI, [EBP-136] ;  alfa4
  390| 0003B0 78FFFFFF                                  
  390| 0003B4 CE                          INTO          
  390| 0003B5 03B5                        ADD    ESI, [EBP-152] ;  Sum1
  390| 0003B7 68FFFFFF                                  
  390| 0003BB CE                          INTO          
  390| 0003BC 8B7A                        MOV    EDI, [EDX+48] 
  390| 0003BE 30                                        
  390| 0003BF 8B97                        MOV    EDX, [EDI-136] ;  A
  390| 0003C1 78FFFFFF                                  
  390| 0003C5 8B45                        MOV    EAX, [EBP-60] 
  390| 0003C7 C4                                        
  390| 0003C8 3D                          CMP    EAX, 1 
  390| 0003C9 01000000                                  
  390|                 L112:                            
  390| 0003CD 0F8C                        JL     L113   
  390| 0003CF 2E040000                                  
  390| 0003D3 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  390| 0003D5 00000000                                  
  390| 0003D9 0F8F                        JG     L113   
  390| 0003DB 22040000                                  
  390| 0003DF 897482                      MOV    [EDX+4*EAX-4], ESI 
  390| 0003E2 FC                                        
;  Source Line # 391
  391| 0003E3 C785                        MOV    DWORD PTR [EBP-152], 0 ;  Sum1
  391| 0003E5 68FFFFFF                                  
  391| 0003E9 00000000                                  
;  Source Line # 392
  392| 0003ED 8B5D                        MOV    EBX, [EBP-64] 
  392| 0003EF C0                                        
  392| 0003F0 395D                        CMP    [EBP-60], EBX 
  392| 0003F2 C4                                        
  392| 0003F3 74                          JE     SHORT L54 
  392| 0003F4 0C                                        
  392| 0003F5 8B45                        MOV    EAX, [EBP-60] 
  392| 0003F7 C4                                        
  392| 0003F8 40                          INC    EAX    
  392| 0003F9 8945                        MOV    [EBP-60], EAX 
  392| 0003FB C4                                        
  392| 0003FC E9                          JMP    L56    
  392| 0003FD F7FEFFFF                                  
  392|                 L54:                             
  392| 000401 6B05                        IMUL   EAX, package1.h, 3 
  392| 000403 00000000                                  
  392| 000407 03                                        
  392| 000408 CE                          INTO          
  392| 000409 40                          INC    EAX    
  392| 00040A CE                          INTO          
  392| 00040B 8945                        MOV    [EBP-48], EAX 
  392| 00040D D0                                        
  392| 00040E 8B1D                        MOV    EBX, package1.n 
  392| 000410 00000000                                  
  392| 000414 895D                        MOV    [EBP-44], EBX 
  392| 000416 D4                                        
;  Source Line # 393
  393| 000417 8B4D                        MOV    ECX, [EBP-44] 
  393| 000419 D4                                        
  393| 00041A 394D                        CMP    [EBP-48], ECX 
  393| 00041C D0                                        
  393| 00041D 0F8F                        JG     L64    
  393| 00041F 34010000                                  
  393| 000423 8B45                        MOV    EAX, [EBP-48] 
  393| 000425 D0                                        
  393| 000426 8945                        MOV    [EBP-40], EAX 
  393| 000428 D8                                        
  393|                 L66:                             
  393| 000429 6B05                        IMUL   EAX, package1.h, 3 
  393| 00042B 00000000                                  
  393| 00042F 03                                        
  393| 000430 CE                          INTO          
  393| 000431 40                          INC    EAX    
  393| 000432 CE                          INTO          
  393| 000433 8945                        MOV    [EBP-36], EAX 
  393| 000435 DC                                        
  393| 000436 8B1D                        MOV    EBX, package1.n 
  393| 000438 00000000                                  
  393| 00043C 895D                        MOV    [EBP-32], EBX 
  393| 00043E E0                                        
;  Source Line # 394
  394| 00043F 8B4D                        MOV    ECX, [EBP-32] 
  394| 000441 E0                                        
  394| 000442 394D                        CMP    [EBP-36], ECX 
  394| 000444 DC                                        
  394| 000445 0F8F                        JG     L67    
  394| 000447 F8000000                                  
  394| 00044B 8B45                        MOV    EAX, [EBP-36] 
  394| 00044D DC                                        
  394| 00044E 8945                        MOV    [EBP-28], EAX 
  394| 000450 E4                                        
  394|                 L69:                             
;  Source Line # 395
  395| 000451 8B95                        MOV    EDX, [EBP-160] ; Spill
  395| 000453 60FFFFFF                                  
  395| 000457 8B42                        MOV    EAX, [EDX+48] 
  395| 000459 30                                        
  395| 00045A 8B98                        MOV    EBX, [EAX-136] ;  A
  395| 00045C 78FFFFFF                                  
  395| 000460 8B4D                        MOV    ECX, [EBP-40] 
  395| 000462 D8                                        
  395| 000463 83F9                        CMP    ECX, 1 
  395| 000465 01                                        
  395|                 L114:                            
  395| 000466 0F8C                        JL     L115   
  395| 000468 A1030000                                  
  395| 00046C 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  395| 00046E 00000000                                  
  395| 000472 0F8F                        JG     L115   
  395| 000474 95030000                                  
  395| 000478 8B72                        MOV    ESI, [EDX+48] 
  395| 00047A 30                                        
  395| 00047B 8BBE                        MOV    EDI, [ESI-136] ;  A
  395| 00047D 78FFFFFF                                  
  395| 000481 8B55                        MOV    EDX, [EBP-28] 
  395| 000483 E4                                        
  395| 000484 83FA                        CMP    EDX, 1 
  395| 000486 01                                        
  395|                 L116:                            
  395| 000487 0F8C                        JL     L117   
  395| 000489 8C030000                                  
  395| 00048D 3B15                        CMP    EDX, package1.vec__constrained_array____1 
  395| 00048F 00000000                                  
  395| 000493 0F8F                        JG     L117   
  395| 000495 80030000                                  
  395| 000499 8B4497                      MOV    EAX, [EDI+4*EDX-4] 
  395| 00049C FC                                        
  395| 00049D 39448B                      CMP    [EBX+4*ECX-4], EAX 
  395| 0004A0 FC                                        
  395| 0004A1 0F8E                        JLE    L70    
  395| 0004A3 88000000                                  
;  Source Line # 397
  397| 0004A7 8B95                        MOV    EDX, [EBP-160] ; Spill
  397| 0004A9 60FFFFFF                                  
  397| 0004AD 8B42                        MOV    EAX, [EDX+48] 
  397| 0004AF 30                                        
  397| 0004B0 8B98                        MOV    EBX, [EAX-136] ;  A
  397| 0004B2 78FFFFFF                                  
  397| 0004B6 8B4D                        MOV    ECX, [EBP-40] 
  397| 0004B8 D8                                        
  397| 0004B9 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  397| 0004BB 00000000                                  
  397|                 L118:                            
  397| 0004BF 0F8F                        JG     L119   
  397| 0004C1 60030000                                  
  397| 0004C5 8B748B                      MOV    ESI, [EBX+4*ECX-4] 
  397| 0004C8 FC                                        
  397| 0004C9 89B5                        MOV    [EBP-148], ESI ;  Temp
  397| 0004CB 6CFFFFFF                                  
;  Source Line # 398
  398| 0004CF 8B7A                        MOV    EDI, [EDX+48] 
  398| 0004D1 30                                        
  398| 0004D2 8B97                        MOV    EDX, [EDI-136] ;  A
  398| 0004D4 78FFFFFF                                  
  398| 0004D8 8B45                        MOV    EAX, [EBP-28] 
  398| 0004DA E4                                        
  398| 0004DB 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  398| 0004DD 00000000                                  
  398|                 L120:                            
  398| 0004E1 0F8F                        JG     L121   
  398| 0004E3 4A030000                                  
  398| 0004E7 8B9D                        MOV    EBX, [EBP-160] ; Spill
  398| 0004E9 60FFFFFF                                  
  398| 0004ED 8B4B                        MOV    ECX, [EBX+48] 
  398| 0004EF 30                                        
  398| 0004F0 8BB1                        MOV    ESI, [ECX-136] ;  A
  398| 0004F2 78FFFFFF                                  
  398| 0004F6 8B7D                        MOV    EDI, [EBP-40] 
  398| 0004F8 D8                                        
  398| 0004F9 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  398| 0004FB 00000000                                  
  398|                 L122:                            
  398| 0004FF 0F8F                        JG     L123   
  398| 000501 38030000                                  
  398| 000505 8B5482                      MOV    EDX, [EDX+4*EAX-4] 
  398| 000508 FC                                        
  398| 000509 8954BE                      MOV    [ESI+4*EDI-4], EDX 
  398| 00050C FC                                        
;  Source Line # 399
  399| 00050D 8B43                        MOV    EAX, [EBX+48] 
  399| 00050F 30                                        
  399| 000510 8B98                        MOV    EBX, [EAX-136] ;  A
  399| 000512 78FFFFFF                                  
  399| 000516 8B4D                        MOV    ECX, [EBP-28] 
  399| 000518 E4                                        
  399| 000519 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  399| 00051B 00000000                                  
  399|                 L124:                            
  399| 00051F 0F8F                        JG     L125   
  399| 000521 24030000                                  
  399| 000525 8BB5                        MOV    ESI, [EBP-148] ;  Temp
  399| 000527 6CFFFFFF                                  
  399| 00052B 89748B                      MOV    [EBX+4*ECX-4], ESI 
  399| 00052E FC                                        
;  Source Line # 400
;  Source Line # 401
  401|                 L70:                             
;  Source Line # 402
  402| 00052F 8B45                        MOV    EAX, [EBP-32] 
  402| 000531 E0                                        
  402| 000532 3945                        CMP    [EBP-28], EAX 
  402| 000534 E4                                        
  402| 000535 74                          JE     SHORT L67 
  402| 000536 0C                                        
  402| 000537 8B45                        MOV    EAX, [EBP-28] 
  402| 000539 E4                                        
  402| 00053A 40                          INC    EAX    
  402| 00053B 8945                        MOV    [EBP-28], EAX 
  402| 00053D E4                                        
  402| 00053E E9                          JMP    L69    
  402| 00053F 0EFFFFFF                                  
  402|                 L67:                             
;  Source Line # 403
  403| 000543 8B45                        MOV    EAX, [EBP-44] 
  403| 000545 D4                                        
  403| 000546 3945                        CMP    [EBP-40], EAX 
  403| 000548 D8                                        
  403| 000549 74                          JE     SHORT L64 
  403| 00054A 0C                                        
  403| 00054B 8B45                        MOV    EAX, [EBP-40] 
  403| 00054D D8                                        
  403| 00054E 40                          INC    EAX    
  403| 00054F 8945                        MOV    [EBP-40], EAX 
  403| 000551 D8                                        
  403| 000552 E9                          JMP    L66    
  403| 000553 D2FEFFFF                                  
  403|                 L64:                             
;  Source Line # 405
  405| 000557 6A                          PUSH   0      
  405| 000558 00                                        
  405| 000559 6A                          PUSH   2      
  405| 00055A 02                                        
  405| 00055B 6A                          PUSH   0      
  405| 00055C 00                                        
  405| 00055D 8B95                        MOV    EDX, [EBP-160] ; Spill
  405| 00055F 60FFFFFF                                  
  405| 000563 8B42                        MOV    EAX, [EDX+48] 
  405| 000565 30                                        
  405| 000566 8B58                        MOV    EBX, [EAX-44] ;  MON
  405| 000568 D4                                        
  405| 000569 53                          PUSH   EBX    
  405| 00056A E8                          CALL   rts_protected_entry_call 
  405| 00056B 00000000                                  
;  Source Line # 407
  407| 00056F 8B0D                        MOV    ECX, package1.h 
  407| 000571 00000000                                  
  407| 000575 D1E1                        SHL    ECX, 1 
  407| 000577 CE                          INTO          
  407| 000578 41                          INC    ECX    
  407| 000579 CE                          INTO          
  407| 00057A 894D                        MOV    [EBP-124], ECX ;  Uk1
  407| 00057C 84                                        
;  Source Line # 408
  408| 00057D 6B35                        IMUL   ESI, package1.h, 3 
  408| 00057F 00000000                                  
  408| 000583 03                                        
  408| 000584 CE                          INTO          
  408| 000585 46                          INC    ESI    
  408| 000586 CE                          INTO          
  408| 000587 8975                        MOV    [EBP-120], ESI ;  Uk2
  408| 000589 88                                        
  408| 00058A 8B3D                        MOV    EDI, package1.h 
  408| 00058C 00000000                                  
  408| 000590 D1E7                        SHL    EDI, 1 
  408| 000592 CE                          INTO          
  408| 000593 47                          INC    EDI    
  408| 000594 CE                          INTO          
  408| 000595 897D                        MOV    [EBP-24], EDI 
  408| 000597 E8                                        
  408| 000598 8B15                        MOV    EDX, package1.n 
  408| 00059A 00000000                                  
  408| 00059E 8955                        MOV    [EBP-20], EDX 
  408| 0005A0 EC                                        
;  Source Line # 410
  410| 0005A1 8B45                        MOV    EAX, [EBP-20] 
  410| 0005A3 EC                                        
  410| 0005A4 3945                        CMP    [EBP-24], EAX 
  410| 0005A6 E8                                        
  410| 0005A7 0F8F                        JG     L76    
  410| 0005A9 2B010000                                  
  410| 0005AD 8B45                        MOV    EAX, [EBP-24] 
  410| 0005AF E8                                        
  410| 0005B0 8945                        MOV    [EBP-16], EAX 
  410| 0005B2 F0                                        
  410|                 L78:                             
;  Source Line # 411
  411| 0005B3 8B05                        MOV    EAX, package1.n 
  411| 0005B5 00000000                                  
  411| 0005B9 3945                        CMP    [EBP-120], EAX ;  Uk2
  411| 0005BB 88                                        
  411| 0005BC 0F9DC7                      SETGE  BH     
  411| 0005BF 8B95                        MOV    EDX, [EBP-160] ; Spill
  411| 0005C1 60FFFFFF                                  
  411| 0005C5 8B4A                        MOV    ECX, [EDX+48] 
  411| 0005C7 30                                        
  411| 0005C8 8BB1                        MOV    ESI, [ECX-136] ;  A
  411| 0005CA 78FFFFFF                                  
  411| 0005CE 8B7D                        MOV    EDI, [EBP-124] ;  Uk1
  411| 0005D0 84                                        
  411| 0005D1 83FF                        CMP    EDI, 1 
  411| 0005D3 01                                        
  411|                 L126:                            
  411| 0005D4 0F8C                        JL     L127   
  411| 0005D6 7B020000                                  
  411| 0005DA 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  411| 0005DC 00000000                                  
  411| 0005E0 0F8F                        JG     L127   
  411| 0005E2 6F020000                                  
  411| 0005E6 8B42                        MOV    EAX, [EDX+48] 
  411| 0005E8 30                                        
  411| 0005E9 8B90                        MOV    EDX, [EAX-136] ;  A
  411| 0005EB 78FFFFFF                                  
  411| 0005EF 8B4D                        MOV    ECX, [EBP-120] ;  Uk2
  411| 0005F1 88                                        
  411| 0005F2 83F9                        CMP    ECX, 1 
  411| 0005F4 01                                        
  411|                 L128:                            
  411| 0005F5 0F8C                        JL     L129   
  411| 0005F7 66020000                                  
  411| 0005FB 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  411| 0005FD 00000000                                  
  411| 000601 0F8F                        JG     L129   
  411| 000603 5A020000                                  
  411| 000607 8B448A                      MOV    EAX, [EDX+4*ECX-4] 
  411| 00060A FC                                        
  411| 00060B 3944BE                      CMP    [ESI+4*EDI-4], EAX 
  411| 00060E FC                                        
  411| 00060F 0F9EC3                      SETLE  BL     
  411| 000612 6B35                        IMUL   ESI, package1.h, 3 
  411| 000614 00000000                                  
  411| 000618 03                                        
  411| 000619 CE                          INTO          
  411| 00061A 3975                        CMP    [EBP-124], ESI ;  Uk1
  411| 00061C 84                                        
  411| 00061D 0F9CC6                      SETL   DH     
  411| 000620 22DE                        AND    BL, DH 
  411| 000622 0AFB                        OR     BH, BL 
  411| 000624 0AFF                        OR     BH, BH 
  411| 000626 74                          JE     SHORT L80 
  411| 000627 4B                                        
;  Source Line # 413
  413| 000628 8B95                        MOV    EDX, [EBP-160] ; Spill
  413| 00062A 60FFFFFF                                  
  413| 00062E 8B42                        MOV    EAX, [EDX+48] 
  413| 000630 30                                        
  413| 000631 8B98                        MOV    EBX, [EAX-136] ;  A
  413| 000633 78FFFFFF                                  
  413| 000637 8B4D                        MOV    ECX, [EBP-124] ;  Uk1
  413| 000639 84                                        
  413| 00063A 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  413| 00063C 00000000                                  
  413|                 L130:                            
  413| 000640 0F8F                        JG     L131   
  413| 000642 27020000                                  
  413| 000646 8B75                        MOV    ESI, [EBP-116] ;  Tv
  413| 000648 8C                                        
  413| 000649 8B7D                        MOV    EDI, [EBP-16] 
  413| 00064B F0                                        
  413| 00064C 83FF                        CMP    EDI, 1 
  413| 00064E 01                                        
  413|                 L132:                            
  413| 00064F 0F8C                        JL     L133   
  413| 000651 24020000                                  
  413| 000655 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  413| 000657 00000000                                  
  413| 00065B 0F8F                        JG     L133   
  413| 00065D 18020000                                  
  413| 000661 8B548B                      MOV    EDX, [EBX+4*ECX-4] 
  413| 000664 FC                                        
  413| 000665 8954BE                      MOV    [ESI+4*EDI-4], EDX 
  413| 000668 FC                                        
;  Source Line # 414
  414| 000669 8B45                        MOV    EAX, [EBP-124] ;  Uk1
  414| 00066B 84                                        
  414| 00066C 40                          INC    EAX    
  414| 00066D CE                          INTO          
  414| 00066E 8945                        MOV    [EBP-124], EAX ;  Uk1
  414| 000670 84                                        
;  Source Line # 415
  415| 000671 EB                          JMP    SHORT L79 
  415| 000672 51                                        
  415|                 L80:                             
;  Source Line # 416
;  Source Line # 418
  418| 000673 8B95                        MOV    EDX, [EBP-160] ; Spill
  418| 000675 60FFFFFF                                  
  418| 000679 8B42                        MOV    EAX, [EDX+48] 
  418| 00067B 30                                        
  418| 00067C 8B98                        MOV    EBX, [EAX-136] ;  A
  418| 00067E 78FFFFFF                                  
  418| 000682 8B4D                        MOV    ECX, [EBP-120] ;  Uk2
  418| 000684 88                                        
  418| 000685 83F9                        CMP    ECX, 1 
  418| 000687 01                                        
  418|                 L134:                            
  418| 000688 0F8C                        JL     L135   
  418| 00068A F7010000                                  
  418| 00068E 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  418| 000690 00000000                                  
  418| 000694 0F8F                        JG     L135   
  418| 000696 EB010000                                  
  418| 00069A 8B75                        MOV    ESI, [EBP-116] ;  Tv
  418| 00069C 8C                                        
  418| 00069D 8B7D                        MOV    EDI, [EBP-16] 
  418| 00069F F0                                        
  418| 0006A0 83FF                        CMP    EDI, 1 
  418| 0006A2 01                                        
  418|                 L136:                            
  418| 0006A3 0F8C                        JL     L137   
  418| 0006A5 E8010000                                  
  418| 0006A9 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  418| 0006AB 00000000                                  
  418| 0006AF 0F8F                        JG     L137   
  418| 0006B1 DC010000                                  
  418| 0006B5 8B548B                      MOV    EDX, [EBX+4*ECX-4] 
  418| 0006B8 FC                                        
  418| 0006B9 8954BE                      MOV    [ESI+4*EDI-4], EDX 
  418| 0006BC FC                                        
;  Source Line # 419
  419| 0006BD 8B45                        MOV    EAX, [EBP-120] ;  Uk2
  419| 0006BF 88                                        
  419| 0006C0 40                          INC    EAX    
  419| 0006C1 8945                        MOV    [EBP-120], EAX ;  Uk2
  419| 0006C3 88                                        
;  Source Line # 420
;  Source Line # 421
  421|                 L79:                             
;  Source Line # 422
  422| 0006C4 8B45                        MOV    EAX, [EBP-20] 
  422| 0006C6 EC                                        
  422| 0006C7 3945                        CMP    [EBP-16], EAX 
  422| 0006C9 F0                                        
  422| 0006CA 74                          JE     SHORT L76 
  422| 0006CB 0C                                        
  422| 0006CC 8B45                        MOV    EAX, [EBP-16] 
  422| 0006CE F0                                        
  422| 0006CF 40                          INC    EAX    
  422| 0006D0 8945                        MOV    [EBP-16], EAX 
  422| 0006D2 F0                                        
  422| 0006D3 E9                          JMP    L78    
  422| 0006D4 DBFEFFFF                                  
  422|                 L76:                             
  422| 0006D8 8B05                        MOV    EAX, package1.h 
  422| 0006DA 00000000                                  
  422| 0006DE D1E0                        SHL    EAX, 1 
  422| 0006E0 CE                          INTO          
  422| 0006E1 40                          INC    EAX    
  422| 0006E2 CE                          INTO          
  422| 0006E3 8945                        MOV    [EBP-12], EAX 
  422| 0006E5 F4                                        
  422| 0006E6 8B1D                        MOV    EBX, package1.n 
  422| 0006E8 00000000                                  
  422| 0006EC 895D                        MOV    [EBP-8], EBX 
  422| 0006EE F8                                        
;  Source Line # 424
  424| 0006EF 8B4D                        MOV    ECX, [EBP-8] 
  424| 0006F1 F8                                        
  424| 0006F2 394D                        CMP    [EBP-12], ECX 
  424| 0006F4 F4                                        
  424| 0006F5 7F                          JG     SHORT L83 
  424| 0006F6 58                                        
  424| 0006F7 8B45                        MOV    EAX, [EBP-12] 
  424| 0006F9 F4                                        
  424| 0006FA 8945                        MOV    [EBP-4], EAX 
  424| 0006FC FC                                        
  424|                 L85:                             
;  Source Line # 425
  425| 0006FD 8B45                        MOV    EAX, [EBP-116] ;  Tv
  425| 0006FF 8C                                        
  425| 000700 8B5D                        MOV    EBX, [EBP-4] 
  425| 000702 FC                                        
  425| 000703 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
  425| 000705 00000000                                  
  425|                 L138:                            
  425| 000709 0F8F                        JG     L139   
  425| 00070B 8E010000                                  
  425| 00070F 8B95                        MOV    EDX, [EBP-160] ; Spill
  425| 000711 60FFFFFF                                  
  425| 000715 8B4A                        MOV    ECX, [EDX+48] 
  425| 000717 30                                        
  425| 000718 8BB1                        MOV    ESI, [ECX-136] ;  A
  425| 00071A 78FFFFFF                                  
  425| 00071E 8B7D                        MOV    EDI, [EBP-4] 
  425| 000720 FC                                        
  425| 000721 83FF                        CMP    EDI, 1 
  425| 000723 01                                        
  425|                 L140:                            
  425| 000724 0F8C                        JL     L141   
  425| 000726 7F010000                                  
  425| 00072A 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  425| 00072C 00000000                                  
  425| 000730 0F8F                        JG     L141   
  425| 000732 73010000                                  
  425| 000736 8B4498                      MOV    EAX, [EAX+4*EBX-4] 
  425| 000739 FC                                        
  425| 00073A 8944BE                      MOV    [ESI+4*EDI-4], EAX 
  425| 00073D FC                                        
;  Source Line # 426
  426| 00073E 8B5D                        MOV    EBX, [EBP-8] 
  426| 000740 F8                                        
  426| 000741 395D                        CMP    [EBP-4], EBX 
  426| 000743 FC                                        
  426| 000744 74                          JE     SHORT L83 
  426| 000745 09                                        
  426| 000746 8B45                        MOV    EAX, [EBP-4] 
  426| 000748 FC                                        
  426| 000749 40                          INC    EAX    
  426| 00074A 8945                        MOV    [EBP-4], EAX 
  426| 00074C FC                                        
  426| 00074D EB                          JMP    SHORT L85 
  426| 00074E AE                                        
  426|                 L83:                             
;  Source Line # 428
  428| 00074F 68                          PUSH   lab4.mon.a2ht4 
  428| 000750 00000000                                  
  428| 000754 6A                          PUSH   0      
  428| 000755 00                                        
  428| 000756 8B95                        MOV    EDX, [EBP-160] ; Spill
  428| 000758 60FFFFFF                                  
  428| 00075C 8B42                        MOV    EAX, [EDX+48] 
  428| 00075E 30                                        
  428| 00075F 8B58                        MOV    EBX, [EAX-44] ;  MON
  428| 000761 D4                                        
  428| 000762 53                          PUSH   EBX    
  428| 000763 E8                          CALL   rts_protected_procedure_call 
  428| 000764 00000000                                  
;  Source Line # 430
  430| 000768 68                          PUSH   __lcl.00000420 
  430| 000769 00000000                                  
  430| 00076D 68                          PUSH   __lcl.00000419 
  430| 00076E 00000000                                  
  430| 000772 E8                          CALL   ada.text_io.put_line__2 
  430| 000773 00000000                                  
  430| 000777 8D8D                        LEA    ECX, [EBP-144] ;  dyn_temp
  430| 000779 70FFFFFF                                  
  430| 00077D 51                          PUSH   ECX    
  430| 00077E E8                          CALL   rts_ss_release 
  430| 00077F 00000000                                  
;  Source Line # 431
  431| 000783 8BE5                        MOV    ESP, EBP 
  431| 000785 5D                          POP    EBP    
  431| 000786 C2                          RET    4      
  431| 000787 0400                                      
  431|                 L93:                             
  431| 000789 8D05                        LEA    EAX, L92+5 
  431| 00078B CC010000                                  
  431| 00078F 50                          PUSH   EAX    
  431| 000790 E9                          JMP    rts_raise_constraint_error 
  431| 000791 00000000                                  
  431|                 L95:                             
  431| 000795 8D05                        LEA    EAX, L94+5 
  431| 000797 E2010000                                  
  431| 00079B 50                          PUSH   EAX    
  431| 00079C E9                          JMP    rts_raise_constraint_error 
  431| 00079D 00000000                                  
  431|                 L97:                             
  431| 0007A1 8D05                        LEA    EAX, L96+5 
  431| 0007A3 0C020000                                  
  431| 0007A7 50                          PUSH   EAX    
  431| 0007A8 E9                          JMP    rts_raise_constraint_error 
  431| 0007A9 00000000                                  
  431|                 L99:                             
  431| 0007AD 8D05                        LEA    EAX, L98+5 
  431| 0007AF 25020000                                  
  431| 0007B3 50                          PUSH   EAX    
  431| 0007B4 E9                          JMP    rts_raise_constraint_error 
  431| 0007B5 00000000                                  
  431|                 L101:                            
  431| 0007B9 8D05                        LEA    EAX, L100+5 
  431| 0007BB 69020000                                  
  431| 0007BF 50                          PUSH   EAX    
  431| 0007C0 E9                          JMP    rts_raise_constraint_error 
  431| 0007C1 00000000                                  
  431|                 L103:                            
  431| 0007C5 8D05                        LEA    EAX, L102+5 
  431| 0007C7 7F020000                                  
  431| 0007CB 50                          PUSH   EAX    
  431| 0007CC E9                          JMP    rts_raise_constraint_error 
  431| 0007CD 00000000                                  
  431|                 L105:                            
  431| 0007D1 8D05                        LEA    EAX, L104+5 
  431| 0007D3 26030000                                  
  431| 0007D7 50                          PUSH   EAX    
  431| 0007D8 E9                          JMP    rts_raise_constraint_error 
  431| 0007D9 00000000                                  
  431|                 L107:                            
  431| 0007DD 8D05                        LEA    EAX, L106+5 
  431| 0007DF 38030000                                  
  431| 0007E3 50                          PUSH   EAX    
  431| 0007E4 E9                          JMP    rts_raise_constraint_error 
  431| 0007E5 00000000                                  
  431|                 L109:                            
  431| 0007E9 8D05                        LEA    EAX, L108+5 
  431| 0007EB 4E030000                                  
  431| 0007EF 50                          PUSH   EAX    
  431| 0007F0 E9                          JMP    rts_raise_constraint_error 
  431| 0007F1 00000000                                  
  431|                 L111:                            
  431| 0007F5 8D05                        LEA    EAX, L110+5 
  431| 0007F7 A8030000                                  
  431| 0007FB 50                          PUSH   EAX    
  431| 0007FC E9                          JMP    rts_raise_constraint_error 
  431| 0007FD 00000000                                  
  431|                 L113:                            
  431| 000801 8D05                        LEA    EAX, L112+5 
  431| 000803 D2030000                                  
  431| 000807 50                          PUSH   EAX    
  431| 000808 E9                          JMP    rts_raise_constraint_error 
  431| 000809 00000000                                  
  431|                 L115:                            
  431| 00080D 8D05                        LEA    EAX, L114+5 
  431| 00080F 6B040000                                  
  431| 000813 50                          PUSH   EAX    
  431| 000814 E9                          JMP    rts_raise_constraint_error 
  431| 000815 00000000                                  
  431|                 L117:                            
  431| 000819 8D05                        LEA    EAX, L116+5 
  431| 00081B 8C040000                                  
  431| 00081F 50                          PUSH   EAX    
  431| 000820 E9                          JMP    rts_raise_constraint_error 
  431| 000821 00000000                                  
  431|                 L119:                            
  431| 000825 8D05                        LEA    EAX, L118+5 
  431| 000827 C4040000                                  
  431| 00082B 50                          PUSH   EAX    
  431| 00082C E9                          JMP    rts_raise_constraint_error 
  431| 00082D 00000000                                  
  431|                 L121:                            
  431| 000831 8D05                        LEA    EAX, L120+5 
  431| 000833 E6040000                                  
  431| 000837 50                          PUSH   EAX    
  431| 000838 E9                          JMP    rts_raise_constraint_error 
  431| 000839 00000000                                  
  431|                 L123:                            
  431| 00083D 8D05                        LEA    EAX, L122+5 
  431| 00083F 04050000                                  
  431| 000843 50                          PUSH   EAX    
  431| 000844 E9                          JMP    rts_raise_constraint_error 
  431| 000845 00000000                                  
  431|                 L125:                            
  431| 000849 8D05                        LEA    EAX, L124+5 
  431| 00084B 24050000                                  
  431| 00084F 50                          PUSH   EAX    
  431| 000850 E9                          JMP    rts_raise_constraint_error 
  431| 000851 00000000                                  
  431|                 L127:                            
  431| 000855 8D05                        LEA    EAX, L126+5 
  431| 000857 D9050000                                  
  431| 00085B 50                          PUSH   EAX    
  431| 00085C E9                          JMP    rts_raise_constraint_error 
  431| 00085D 00000000                                  
  431|                 L129:                            
  431| 000861 8D05                        LEA    EAX, L128+5 
  431| 000863 FA050000                                  
  431| 000867 50                          PUSH   EAX    
  431| 000868 E9                          JMP    rts_raise_constraint_error 
  431| 000869 00000000                                  
  431|                 L131:                            
  431| 00086D 8D05                        LEA    EAX, L130+5 
  431| 00086F 45060000                                  
  431| 000873 50                          PUSH   EAX    
  431| 000874 E9                          JMP    rts_raise_constraint_error 
  431| 000875 00000000                                  
  431|                 L133:                            
  431| 000879 8D05                        LEA    EAX, L132+5 
  431| 00087B 54060000                                  
  431| 00087F 50                          PUSH   EAX    
  431| 000880 E9                          JMP    rts_raise_constraint_error 
  431| 000881 00000000                                  
  431|                 L135:                            
  431| 000885 8D05                        LEA    EAX, L134+5 
  431| 000887 8D060000                                  
  431| 00088B 50                          PUSH   EAX    
  431| 00088C E9                          JMP    rts_raise_constraint_error 
  431| 00088D 00000000                                  
  431|                 L137:                            
  431| 000891 8D05                        LEA    EAX, L136+5 
  431| 000893 A8060000                                  
  431| 000897 50                          PUSH   EAX    
  431| 000898 E9                          JMP    rts_raise_constraint_error 
  431| 000899 00000000                                  
  431|                 L139:                            
  431| 00089D 8D05                        LEA    EAX, L138+5 
  431| 00089F 0E070000                                  
  431| 0008A3 50                          PUSH   EAX    
  431| 0008A4 E9                          JMP    rts_raise_constraint_error 
  431| 0008A5 00000000                                  
  431|                 L141:                            
  431| 0008A9 8D05                        LEA    EAX, L140+5 
  431| 0008AB 29070000                                  
  431| 0008AF 50                          PUSH   EAX    
  431| 0008B0 E9                          JMP    rts_raise_constraint_error 
  431| 0008B1 00000000                                  
                       ;                                
                       lab4.start.t4__body ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000449     DD     00003A01 
                                          DD     00000168 
                                          DD     lab4.start.t4__body 
                                          DD     __lcl.00000467 
                                          DD     0000016A 
                                          DD     lab4.start.t4__body+00000013H 
                                          DD     __lcl.00000467 
                                          DD     0000016B 
                                          DD     lab4.start.t4__body+00000069H 
                                          DD     __lcl.00000467 
                                          DD     0000016D 
                                          DD     lab4.start.t4__body+0000008BH 
                                          DD     __lcl.00000467 
                                          DD     0000016E 
                                          DD     lab4.start.t4__body+000000ABH 
                                          DD     __lcl.00000467 
                                          DD     0000016F 
                                          DD     lab4.start.t4__body+000000B0H 
                                          DD     __lcl.00000467 
                                          DD     00000172 
                                          DD     lab4.start.t4__body+000000BFH 
                                          DD     __lcl.00000467 
                                          DD     00000174 
                                          DD     lab4.start.t4__body+000000D7H 
                                          DD     __lcl.00000467 
                                          DD     00000175 
                                          DD     lab4.start.t4__body+00000101H 
                                          DD     __lcl.00000467 
                                          DD     00000176 
                                          DD     lab4.start.t4__body+00000125H 
                                          DD     __lcl.00000467 
                                          DD     00000178 
                                          DD     lab4.start.t4__body+00000152H 
                                          DD     __lcl.00000467 
                                          DD     00000179 
                                          DD     lab4.start.t4__body+00000179H 
                                          DD     __lcl.00000467 
                                          DD     0000017A 
                                          DD     lab4.start.t4__body+0000018BH 
                                          DD     __lcl.00000467 
                                          DD     0000017B 
                                          DD     lab4.start.t4__body+0000019EH 
                                          DD     __lcl.00000467 
                                          DD     0000017C 
                                          DD     lab4.start.t4__body+000001AFH 
                                          DD     __lcl.00000467 
                                          DD     0000017D 
                                          DD     lab4.start.t4__body+00000244H 
                                          DD     __lcl.00000467 
                                          DD     0000017E 
                                          DD     lab4.start.t4__body+00000258H 
                                          DD     __lcl.00000467 
                                          DD     0000017F 
                                          DD     lab4.start.t4__body+0000029EH 
                                          DD     __lcl.00000467 
                                          DD     00000180 
                                          DD     lab4.start.t4__body+000002B2H 
                                          DD     __lcl.00000467 
                                          DD     00000181 
                                          DD     lab4.start.t4__body+000002C6H 
                                          DD     __lcl.00000467 
                                          DD     00000182 
                                          DD     lab4.start.t4__body+000002E6H 
                                          DD     __lcl.00000467 
                                          DD     00000183 
                                          DD     lab4.start.t4__body+00000301H 
                                          DD     __lcl.00000467 
                                          DD     00000184 
                                          DD     lab4.start.t4__body+00000312H 
                                          DD     __lcl.00000467 
                                          DD     00000185 
                                          DD     lab4.start.t4__body+0000037AH 
                                          DD     __lcl.00000467 
                                          DD     00000186 
                                          DD     lab4.start.t4__body+0000038BH 
                                          DD     __lcl.00000467 
                                          DD     00000187 
                                          DD     lab4.start.t4__body+000003E3H 
                                          DD     __lcl.00000467 
                                          DD     00000188 
                                          DD     lab4.start.t4__body+000003EDH 
                                          DD     __lcl.00000467 
                                          DD     00000189 
                                          DD     lab4.start.t4__body+00000417H 
                                          DD     __lcl.00000467 
                                          DD     0000018A 
                                          DD     lab4.start.t4__body+0000043FH 
                                          DD     __lcl.00000467 
                                          DD     0000018B 
                                          DD     lab4.start.t4__body+00000451H 
                                          DD     __lcl.00000467 
                                          DD     0000018D 
                                          DD     lab4.start.t4__body+000004A7H 
                                          DD     __lcl.00000467 
                                          DD     0000018E 
                                          DD     lab4.start.t4__body+000004CFH 
                                          DD     __lcl.00000467 
                                          DD     0000018F 
                                          DD     lab4.start.t4__body+0000050DH 
                                          DD     __lcl.00000467 
                                          DD     00000190 
                                          DD     lab4.start.t4__body+0000052FH 
                                          DD     __lcl.00000467 
                                          DD     00000191 
                                          DD     lab4.start.t4__body+0000052FH 
                                          DD     __lcl.00000467 
                                          DD     00000192 
                                          DD     lab4.start.t4__body+0000052FH 
                                          DD     __lcl.00000467 
                                          DD     00000193 
                                          DD     lab4.start.t4__body+00000543H 
                                          DD     __lcl.00000467 
                                          DD     00000195 
                                          DD     lab4.start.t4__body+00000557H 
                                          DD     __lcl.00000467 
                                          DD     00000197 
                                          DD     lab4.start.t4__body+0000056FH 
                                          DD     __lcl.00000467 
                                          DD     00000198 
                                          DD     lab4.start.t4__body+0000057DH 
                                          DD     __lcl.00000467 
                                          DD     0000019A 
                                          DD     lab4.start.t4__body+000005A1H 
                                          DD     __lcl.00000467 
                                          DD     0000019B 
                                          DD     lab4.start.t4__body+000005B3H 
                                          DD     __lcl.00000467 
                                          DD     0000019D 
                                          DD     lab4.start.t4__body+00000628H 
                                          DD     __lcl.00000467 
                                          DD     0000019E 
                                          DD     lab4.start.t4__body+00000669H 
                                          DD     __lcl.00000467 
                                          DD     0000019F 
                                          DD     lab4.start.t4__body+00000671H 
                                          DD     __lcl.00000467 
                                          DD     000001A0 
                                          DD     lab4.start.t4__body+00000673H 
                                          DD     __lcl.00000467 
                                          DD     000001A2 
                                          DD     lab4.start.t4__body+00000673H 
                                          DD     __lcl.00000467 
                                          DD     000001A3 
                                          DD     lab4.start.t4__body+000006BDH 
                                          DD     __lcl.00000467 
                                          DD     000001A4 
                                          DD     lab4.start.t4__body+000006C4H 
                                          DD     __lcl.00000467 
                                          DD     000001A5 
                                          DD     lab4.start.t4__body+000006C4H 
                                          DD     __lcl.00000467 
                                          DD     000001A6 
                                          DD     lab4.start.t4__body+000006C4H 
                                          DD     __lcl.00000467 
                                          DD     000001A8 
                                          DD     lab4.start.t4__body+000006EFH 
                                          DD     __lcl.00000467 
                                          DD     000001A9 
                                          DD     lab4.start.t4__body+000006FDH 
                                          DD     __lcl.00000467 
                                          DD     000001AA 
                                          DD     lab4.start.t4__body+0000073EH 
                                          DD     __lcl.00000467 
                                          DD     000001AC 
                                          DD     lab4.start.t4__body+0000074FH 
                                          DD     __lcl.00000467 
                                          DD     000001AE 
                                          DD     lab4.start.t4__body+00000768H 
                                          DD     __lcl.00000467 
                                          DD     000001AF 
                                          DD     lab4.start.t4__body+00000783H 
                                          DD     __lcl.00000467 
                                          DD     000001AF 
                                          DD     lab4.start.t4__body+000008B1H 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 700

                       ;                                
                       ;  Start of procedure lab4.start   
                       ;                                
                                          PUBLIC lab4.start 
                       lab4.start         PROC   NEAR   
;  Source Line # 135
  135| 000000 55                          PUSH   EBP    
  135| 000001 8BEC                        MOV    EBP, ESP 
  135| 000003 81EC                        SUB    ESP, 196 
  135| 000005 C4000000                                  
;  Source Line # 139
  139| 000009 C645                        MOV    BYTE PTR [EBP-4], 0 ;  T1__elab_bool
  139| 00000B FC                                        
  139| 00000C 00                                        
  139| 00000D 6A                          PUSH   0      
  139| 00000E 00                                        
  139| 00000F 8D85                        LEA    EAX, [EBP-196] ;  master_record
  139| 000011 3CFFFFFF                                  
  139| 000015 50                          PUSH   EAX    
  139| 000016 E8                          CALL   rts_init_master 
  139| 000017 00000000                                  
  139| 00001B 8D9D                        LEA    EBX, [EBP-140] ;  activation_list
  139| 00001D 74FFFFFF                                  
  139| 000021 53                          PUSH   EBX    
  139| 000022 E8                          CALL   rts_initialize_activation_list 
  139| 000023 00000000                                  
  139| 000027 68                          PUSH   __lcl.00000426 
  139| 000028 00000000                                  
  139| 00002C 6A                          PUSH   0      
  139| 00002D 00                                        
  139| 00002E 8D4D                        LEA    ECX, [EBP-4] ;  T1__elab_bool
  139| 000030 FC                                        
  139| 000031 51                          PUSH   ECX    
  139| 000032 6A                          PUSH   0      
  139| 000033 00                                        
  139| 000034 8D55                        LEA    EDX, [EBP-68] ;  T1
  139| 000036 BC                                        
  139| 000037 52                          PUSH   EDX    
  139| 000038 6A                          PUSH   0      
  139| 000039 00                                        
  139| 00003A 68                          PUSH   lab4.start.t1__body 
  139| 00003B 00000000                                  
  139| 00003F 8DB5                        LEA    ESI, [EBP-196] ;  master_record
  139| 000041 3CFFFFFF                                  
  139| 000045 56                          PUSH   ESI    
  139| 000046 8DBD                        LEA    EDI, [EBP-140] ;  activation_list
  139| 000048 74FFFFFF                                  
  139| 00004C 57                          PUSH   EDI    
  139| 00004D 6A                          PUSH   0      
  139| 00004E 00                                        
  139| 00004F E8                          CALL   rts_initialize_task_with_name 
  139| 000050 00000000                                  
;  Source Line # 140
  140| 000054 C645                        MOV    BYTE PTR [EBP-3], 0 ;  T2__elab_bool
  140| 000056 FD                                        
  140| 000057 00                                        
  140| 000058 68                          PUSH   __lcl.00000427 
  140| 000059 00000000                                  
  140| 00005D 6A                          PUSH   0      
  140| 00005E 00                                        
  140| 00005F 8D45                        LEA    EAX, [EBP-3] ;  T2__elab_bool
  140| 000061 FD                                        
  140| 000062 50                          PUSH   EAX    
  140| 000063 6A                          PUSH   0      
  140| 000064 00                                        
  140| 000065 8D5D                        LEA    EBX, [EBP-52] ;  T2
  140| 000067 CC                                        
  140| 000068 53                          PUSH   EBX    
  140| 000069 6A                          PUSH   0      
  140| 00006A 00                                        
  140| 00006B 68                          PUSH   lab4.start.t2__body 
  140| 00006C 00000000                                  
  140| 000070 8D8D                        LEA    ECX, [EBP-196] ;  master_record
  140| 000072 3CFFFFFF                                  
  140| 000076 51                          PUSH   ECX    
  140| 000077 8D95                        LEA    EDX, [EBP-140] ;  activation_list
  140| 000079 74FFFFFF                                  
  140| 00007D 52                          PUSH   EDX    
  140| 00007E 6A                          PUSH   0      
  140| 00007F 00                                        
  140| 000080 E8                          CALL   rts_initialize_task_with_name 
  140| 000081 00000000                                  
;  Source Line # 141
  141| 000085 C645                        MOV    BYTE PTR [EBP-2], 0 ;  T3__elab_bool
  141| 000087 FE                                        
  141| 000088 00                                        
  141| 000089 68                          PUSH   __lcl.00000428 
  141| 00008A 00000000                                  
  141| 00008E 6A                          PUSH   0      
  141| 00008F 00                                        
  141| 000090 8D75                        LEA    ESI, [EBP-2] ;  T3__elab_bool
  141| 000092 FE                                        
  141| 000093 56                          PUSH   ESI    
  141| 000094 6A                          PUSH   0      
  141| 000095 00                                        
  141| 000096 8D7D                        LEA    EDI, [EBP-36] ;  T3
  141| 000098 DC                                        
  141| 000099 57                          PUSH   EDI    
  141| 00009A 6A                          PUSH   0      
  141| 00009B 00                                        
  141| 00009C 68                          PUSH   lab4.start.t3__body 
  141| 00009D 00000000                                  
  141| 0000A1 8D85                        LEA    EAX, [EBP-196] ;  master_record
  141| 0000A3 3CFFFFFF                                  
  141| 0000A7 50                          PUSH   EAX    
  141| 0000A8 8D9D                        LEA    EBX, [EBP-140] ;  activation_list
  141| 0000AA 74FFFFFF                                  
  141| 0000AE 53                          PUSH   EBX    
  141| 0000AF 6A                          PUSH   0      
  141| 0000B0 00                                        
  141| 0000B1 E8                          CALL   rts_initialize_task_with_name 
  141| 0000B2 00000000                                  
;  Source Line # 142
  142| 0000B6 C645                        MOV    BYTE PTR [EBP-1], 0 ;  T4__elab_bool
  142| 0000B8 FF                                        
  142| 0000B9 00                                        
  142| 0000BA 68                          PUSH   __lcl.00000429 
  142| 0000BB 00000000                                  
  142| 0000BF 6A                          PUSH   0      
  142| 0000C0 00                                        
  142| 0000C1 8D4D                        LEA    ECX, [EBP-1] ;  T4__elab_bool
  142| 0000C3 FF                                        
  142| 0000C4 51                          PUSH   ECX    
  142| 0000C5 6A                          PUSH   0      
  142| 0000C6 00                                        
  142| 0000C7 8D55                        LEA    EDX, [EBP-20] ;  T4
  142| 0000C9 EC                                        
  142| 0000CA 52                          PUSH   EDX    
  142| 0000CB 6A                          PUSH   0      
  142| 0000CC 00                                        
  142| 0000CD 68                          PUSH   lab4.start.t4__body 
  142| 0000CE 00000000                                  
  142| 0000D2 8DB5                        LEA    ESI, [EBP-196] ;  master_record
  142| 0000D4 3CFFFFFF                                  
  142| 0000D8 56                          PUSH   ESI    
  142| 0000D9 8DBD                        LEA    EDI, [EBP-140] ;  activation_list
  142| 0000DB 74FFFFFF                                  
  142| 0000DF 57                          PUSH   EDI    
  142| 0000E0 6A                          PUSH   0      
  142| 0000E1 00                                        
  142| 0000E2 E8                          CALL   rts_initialize_task_with_name 
  142| 0000E3 00000000                                  
;  Source Line # 145
  145| 0000E7 C645                        MOV    BYTE PTR [EBP-4], 1 ;  T1__elab_bool
  145| 0000E9 FC                                        
  145| 0000EA 01                                        
;  Source Line # 252
  252| 0000EB C645                        MOV    BYTE PTR [EBP-3], 1 ;  T2__elab_bool
  252| 0000ED FD                                        
  252| 0000EE 01                                        
;  Source Line # 307
  307| 0000EF C645                        MOV    BYTE PTR [EBP-2], 1 ;  T3__elab_bool
  307| 0000F1 FE                                        
  307| 0000F2 01                                        
;  Source Line # 360
  360| 0000F3 C645                        MOV    BYTE PTR [EBP-1], 1 ;  T4__elab_bool
  360| 0000F5 FF                                        
  360| 0000F6 01                                        
;  Source Line # 433
  433| 0000F7 8D85                        LEA    EAX, [EBP-140] ;  activation_list
  433| 0000F9 74FFFFFF                                  
  433| 0000FD 50                          PUSH   EAX    
  433| 0000FE E8                          CALL   rts_activate_tasks 
  433| 0000FF 00000000                                  
  433| 000103 8D9D                        LEA    EBX, [EBP-196] ;  master_record
  433| 000105 3CFFFFFF                                  
  433| 000109 53                          PUSH   EBX    
  433| 00010A E8                          CALL   rts_finalize_and_pop 
  433| 00010B 00000000                                  
;  Source Line # 435
  435| 00010F 8BE5                        MOV    ESP, EBP 
  435| 000111 5D                          POP    EBP    
  435| 000112 C3                          RET           
                       ;                                
                       lab4.start         ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000448     DD     00000C01 
                                          DD     00000087 
                                          DD     lab4.start 
                                          DD     __lcl.00000467 
                                          DD     0000008B 
                                          DD     lab4.start+00000009H 
                                          DD     __lcl.00000467 
                                          DD     0000008C 
                                          DD     lab4.start+00000054H 
                                          DD     __lcl.00000467 
                                          DD     0000008D 
                                          DD     lab4.start+00000085H 
                                          DD     __lcl.00000467 
                                          DD     0000008E 
                                          DD     lab4.start+000000B6H 
                                          DD     __lcl.00000467 
                                          DD     00000091 
                                          DD     lab4.start+000000E7H 
                                          DD     __lcl.00000467 
                                          DD     000000FC 
                                          DD     lab4.start+000000EBH 
                                          DD     __lcl.00000467 
                                          DD     00000133 
                                          DD     lab4.start+000000EFH 
                                          DD     __lcl.00000467 
                                          DD     00000168 
                                          DD     lab4.start+000000F3H 
                                          DD     __lcl.00000467 
                                          DD     000001B1 
                                          DD     lab4.start+000000F7H 
                                          DD     __lcl.00000467 
                                          DD     000001B3 
                                          DD     lab4.start+0000010FH 
                                          DD     __lcl.00000467 
                                          DD     000001B3 
                                          DD     lab4.start+0000010FH 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 148

                       ;                                
                       ;  Start of procedure lab4       
                       ;                                
                                          PUBLIC lab4   
                       lab4               PROC   NEAR   
;  Source Line # 15
   15| 000000 64                          FS:           
   15| 000001 8B15                        MOV    EDX, 4 
   15| 000003 04000000                                  
   15| 000007 8B52                        MOV    EDX, [EDX-4] 
   15| 000009 FC                                        
   15| 00000A 55                          PUSH   EBP    
   15| 00000B 8BEC                        MOV    EBP, ESP 
   15| 00000D 8A8424                      MOV    AL, [ESP-156] 
   15| 000010 64FFFFFF                                  
   15| 000014 81EC                        SUB    ESP, 156 
   15| 000016 9C000000                                  
   15| 00001A 8B42                        MOV    EAX, [EDX+48] 
   15| 00001C 30                                        
   15| 00001D 8945                        MOV    [EBP-4], EAX 
   15| 00001F FC                                        
   15| 000020 896A                        MOV    [EDX+48], EBP 
   15| 000022 30                                        
;  Source Line # 16
   16| 000023 8B02                        MOV    EAX, [EDX+0] 
   16| 000025 8985                        MOV    [EBP-144], EAX ;  dyn_temp
   16| 000027 70FFFFFF                                  
   16| 00002B 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
   16| 00002D 00000000                                  
   16| 000031 83EB                        SUB    EBX, 1 
   16| 000033 01                                        
   16| 000034 7D                          JGE    SHORT L39 
   16| 000035 03                                        
   16| 000036 33DB                        XOR    EBX, EBX 
   16| 000038 4B                          DEC    EBX    
   16|                 L39:                             
   16| 000039 CE                          INTO          
   16| 00003A 43                          INC    EBX    
   16| 00003B CE                          INTO          
   16| 00003C 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   16| 00003F 00000000                                  
   16| 000043 CE                          INTO          
   16| 000044 53                          PUSH   EBX    
   16| 000045 8995                        MOV    [EBP-156], EDX ; Spill
   16| 000047 64FFFFFF                                  
   16| 00004B E8                          CALL   rts_ss_allocate 
   16| 00004C 00000000                                  
   16| 000050 8985                        MOV    [EBP-140], EAX ;  MT
   16| 000052 74FFFFFF                                  
;  Source Line # 17
   17| 000056 8B0D                        MOV    ECX, package1.vec__constrained_array____1 
   17| 000058 00000000                                  
   17| 00005C 83E9                        SUB    ECX, 1 
   17| 00005E 01                                        
   17| 00005F 7D                          JGE    SHORT L40 
   17| 000060 03                                        
   17| 000061 33C9                        XOR    ECX, ECX 
   17| 000063 49                          DEC    ECX    
   17|                 L40:                             
   17| 000064 CE                          INTO          
   17| 000065 41                          INC    ECX    
   17| 000066 CE                          INTO          
   17| 000067 D1E1                        SHL    ECX, 1 
   17| 000069 CE                          INTO          
   17| 00006A D1E1                        SHL    ECX, 1 
   17| 00006C CE                          INTO          
   17| 00006D 51                          PUSH   ECX    
   17| 00006E E8                          CALL   rts_ss_allocate 
   17| 00006F 00000000                                  
   17| 000073 8985                        MOV    [EBP-136], EAX ;  A
   17| 000075 78FFFFFF                                  
;  Source Line # 18
   18| 000079 8B35                        MOV    ESI, package1.vec__constrained_array____1 
   18| 00007B 00000000                                  
   18| 00007F 83EE                        SUB    ESI, 1 
   18| 000081 01                                        
   18| 000082 7D                          JGE    SHORT L41 
   18| 000083 03                                        
   18| 000084 33F6                        XOR    ESI, ESI 
   18| 000086 4E                          DEC    ESI    
   18|                 L41:                             
   18| 000087 CE                          INTO          
   18| 000088 46                          INC    ESI    
   18| 000089 CE                          INTO          
   18| 00008A D1E6                        SHL    ESI, 1 
   18| 00008C CE                          INTO          
   18| 00008D D1E6                        SHL    ESI, 1 
   18| 00008F CE                          INTO          
   18| 000090 56                          PUSH   ESI    
   18| 000091 E8                          CALL   rts_ss_allocate 
   18| 000092 00000000                                  
   18| 000096 8985                        MOV    [EBP-132], EAX ;  C
   18| 000098 7CFFFFFF                                  
;  Source Line # 28
   28| 00009C C645                        MOV    BYTE PTR [EBP-8], 0 ;  MON__elab_bool
   28| 00009E F8                                        
   28| 00009F 00                                        
   28| 0000A0 6A                          PUSH   0      
   28| 0000A1 00                                        
   28| 0000A2 8D7D                        LEA    EDI, [EBP-104] ;  master_record
   28| 0000A4 98                                        
   28| 0000A5 57                          PUSH   EDI    
   28| 0000A6 E8                          CALL   rts_init_master 
   28| 0000A7 00000000                                  
   28| 0000AB 8B15                        MOV    EDX, package1.matr__constrained_array____1 
   28| 0000AD 00000000                                  
   28| 0000B1 83EA                        SUB    EDX, 1 
   28| 0000B3 01                                        
   28| 0000B4 7D                          JGE    SHORT L42 
   28| 0000B5 03                                        
   28| 0000B6 33D2                        XOR    EDX, EDX 
   28| 0000B8 4A                          DEC    EDX    
   28|                 L42:                             
   28| 0000B9 CE                          INTO          
   28| 0000BA 42                          INC    EDX    
   28| 0000BB CE                          INTO          
   28| 0000BC 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
   28| 0000BF 00000000                                  
   28| 0000C3 CE                          INTO          
   28| 0000C4 83C2                        ADD    EDX, 104 
   28| 0000C6 68                                        
   28| 0000C7 8955                        MOV    [EBP-48], EDX ;  dyn_temp
   28| 0000C9 D0                                        
   28| 0000CA 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
   28| 0000CC 00000000                                  
   28| 0000D0 83EB                        SUB    EBX, 1 
   28| 0000D2 01                                        
   28| 0000D3 7D                          JGE    SHORT L43 
   28| 0000D4 03                                        
   28| 0000D5 33DB                        XOR    EBX, EBX 
   28| 0000D7 4B                          DEC    EBX    
   28|                 L43:                             
   28| 0000D8 CE                          INTO          
   28| 0000D9 43                          INC    EBX    
   28| 0000DA CE                          INTO          
   28| 0000DB 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   28| 0000DE 00000000                                  
   28| 0000E2 CE                          INTO          
   28| 0000E3 83C3                        ADD    EBX, 7 
   28| 0000E5 07                                        
   28| 0000E6 CE                          INTO          
   28| 0000E7 83E3                        AND    EBX, -8 
   28| 0000E9 F8                                        
   28| 0000EA 8B0D                        MOV    ECX, package1.vec__constrained_array____1 
   28| 0000EC 00000000                                  
   28| 0000F0 83E9                        SUB    ECX, 1 
   28| 0000F2 01                                        
   28| 0000F3 7D                          JGE    SHORT L44 
   28| 0000F4 03                                        
   28| 0000F5 33C9                        XOR    ECX, ECX 
   28| 0000F7 49                          DEC    ECX    
   28|                 L44:                             
   28| 0000F8 CE                          INTO          
   28| 0000F9 41                          INC    ECX    
   28| 0000FA CE                          INTO          
   28| 0000FB D1E1                        SHL    ECX, 1 
   28| 0000FD CE                          INTO          
   28| 0000FE D1E1                        SHL    ECX, 1 
   28| 000100 CE                          INTO          
   28| 000101 83C1                        ADD    ECX, 7 
   28| 000103 07                                        
   28| 000104 CE                          INTO          
   28| 000105 83E1                        AND    ECX, -8 
   28| 000107 F8                                        
   28| 000108 03D9                        ADD    EBX, ECX 
   28| 00010A CE                          INTO          
   28| 00010B 83C3                        ADD    EBX, 104 
   28| 00010D 68                                        
   28| 00010E CE                          INTO          
   28| 00010F 53                          PUSH   EBX    
   28| 000110 E8                          CALL   rts_ss_allocate 
   28| 000111 00000000                                  
   28| 000115 8945                        MOV    [EBP-44], EAX ;  MON
   28| 000117 D4                                        
   28| 000118 8B75                        MOV    ESI, [EBP-44] ;  MON
   28| 00011A D4                                        
   28| 00011B C746                        MOV    DWORD PTR [ESI+76], 0 
   28| 00011D 4C                                        
   28| 00011E 00000000                                  
   28| 000122 8B7D                        MOV    EDI, [EBP-44] ;  MON
   28| 000124 D4                                        
   28| 000125 C747                        MOV    DWORD PTR [EDI+80], 0 
   28| 000127 50                                        
   28| 000128 00000000                                  
   28| 00012C 8B55                        MOV    EDX, [EBP-44] ;  MON
   28| 00012E D4                                        
   28| 00012F C742                        MOV    DWORD PTR [EDX+84], 0 
   28| 000131 54                                        
   28| 000132 00000000                                  
   28| 000136 8B4D                        MOV    ECX, [EBP-44] ;  MON
   28| 000138 D4                                        
   28| 000139 C741                        MOV    DWORD PTR [ECX+88], 0 
   28| 00013B 58                                        
   28| 00013C 00000000                                  
   28| 000140 8B5D                        MOV    EBX, [EBP-44] ;  MON
   28| 000142 D4                                        
   28| 000143 C743                        MOV    DWORD PTR [EBX+92], 0 
   28| 000145 5C                                        
   28| 000146 00000000                                  
   28| 00014A 8B45                        MOV    EAX, [EBP-44] ;  MON
   28| 00014C D4                                        
   28| 00014D 8B75                        MOV    ESI, [EBP-48] ;  dyn_temp
   28| 00014F D0                                        
   28| 000150 8970                        MOV    [EAX+96], ESI 
   28| 000152 60                                        
   28| 000153 8B3D                        MOV    EDI, package1.vec__constrained_array____1 
   28| 000155 00000000                                  
   28| 000159 83EF                        SUB    EDI, 1 
   28| 00015B 01                                        
   28| 00015C 7D                          JGE    SHORT L45 
   28| 00015D 03                                        
   28| 00015E 33FF                        XOR    EDI, EDI 
   28| 000160 4F                          DEC    EDI    
   28|                 L45:                             
   28| 000161 CE                          INTO          
   28| 000162 47                          INC    EDI    
   28| 000163 CE                          INTO          
   28| 000164 D1E7                        SHL    EDI, 1 
   28| 000166 CE                          INTO          
   28| 000167 D1E7                        SHL    EDI, 1 
   28| 000169 CE                          INTO          
   28| 00016A 037D                        ADD    EDI, [EBP-48] ;  dyn_temp
   28| 00016C D0                                        
   28| 00016D 897D                        MOV    [EBP-48], EDI ;  dyn_temp
   28| 00016F D0                                        
   28| 000170 6A                          PUSH   0      
   28| 000171 00                                        
   28| 000172 68                          PUSH   lab4.mon__protected_type_desc 
   28| 000173 00000000                                  
   28| 000177 6A                          PUSH   30     
   28| 000178 1E                                        
   28| 000179 8B55                        MOV    EDX, [EBP-44] ;  MON
   28| 00017B D4                                        
   28| 00017C 52                          PUSH   EDX    
   28| 00017D 8D4D                        LEA    ECX, [EBP-40] ;  cleanup
   28| 00017F D8                                        
   28| 000180 51                          PUSH   ECX    
   28| 000181 8D5D                        LEA    EBX, [EBP-104] ;  master_record
   28| 000183 98                                        
   28| 000184 53                          PUSH   EBX    
   28| 000185 E8                          CALL   rts_init_po 
   28| 000186 00000000                                  
;  Source Line # 65
   65| 00018A C645                        MOV    BYTE PTR [EBP-8], 1 ;  MON__elab_bool
   65| 00018C F8                                        
   65| 00018D 01                                        
;  Source Line # 439
  439| 00018E 68                          PUSH   __lcl.00000435 
  439| 00018F 00000000                                  
  439| 000193 68                          PUSH   __lcl.00000434 
  439| 000194 00000000                                  
  439| 000198 E8                          CALL   ada.text_io.put_line__2 
  439| 000199 00000000                                  
;  Source Line # 440
  440| 00019D 0FB605                      MOVZX  EAX, BYTE PTR ada.integer_text_io.default_base
  440| 0001A0 00000000                                  
  440| 0001A4 50                          PUSH   EAX    
  440| 0001A5 FF35                        PUSH   DWORD PTR ada.integer_text_io.default_width 
  440| 0001A7 00000000                                  
  440| 0001AB FF35                        PUSH   DWORD PTR package1.n 
  440| 0001AD 00000000                                  
  440| 0001B1 E8                          CALL   ada.integer_text_io.put__2 
  440| 0001B2 00000000                                  
;  Source Line # 441
  441| 0001B6 6A                          PUSH   0      
  441| 0001B7 00                                        
  441| 0001B8 8D75                        LEA    ESI, [EBP-108] ;  T
  441| 0001BA 94                                        
  441| 0001BB 56                          PUSH   ESI    
  441| 0001BC E8                          CALL   ada.integer_text_io.get__2 
  441| 0001BD 00000000                                  
;  Source Line # 442
  442| 0001C1 8D7D                        LEA    EDI, [EBP-124] ;  time1
  442| 0001C3 84                                        
  442| 0001C4 57                          PUSH   EDI    
  442| 0001C5 E8                          CALL   ada.calendar.clock 
  442| 0001C6 00000000                                  
;  Source Line # 443
  443| 0001CA E8                          CALL   lab4.start 
  443| 0001CB 00000000                                  
  443| 0001CF 8D55                        LEA    EDX, [EBP-104] ;  master_record
  443| 0001D1 98                                        
  443| 0001D2 52                          PUSH   EDX    
  443| 0001D3 E8                          CALL   rts_finalize_and_pop 
  443| 0001D4 00000000                                  
  443| 0001D8 8D8D                        LEA    ECX, [EBP-144] ;  dyn_temp
  443| 0001DA 70FFFFFF                                  
  443| 0001DE 51                          PUSH   ECX    
  443| 0001DF E8                          CALL   rts_ss_release 
  443| 0001E0 00000000                                  
;  Source Line # 444
  444| 0001E4 8B95                        MOV    EDX, [EBP-156] ; Spill
  444| 0001E6 64FFFFFF                                  
  444| 0001EA 8B4D                        MOV    ECX, [EBP-4] 
  444| 0001EC FC                                        
  444| 0001ED 894A                        MOV    [EDX+48], ECX 
  444| 0001EF 30                                        
  444| 0001F0 8BE5                        MOV    ESP, EBP 
  444| 0001F2 5D                          POP    EBP    
  444| 0001F3 C3                          RET           
                       ;                                
                       lab4               ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000447     DD     00000D01 
                                          DD     0000000F 
                                          DD     lab4   
                                          DD     __lcl.00000467 
                                          DD     00000010 
                                          DD     lab4+00000023H 
                                          DD     __lcl.00000467 
                                          DD     00000011 
                                          DD     lab4+00000056H 
                                          DD     __lcl.00000467 
                                          DD     00000012 
                                          DD     lab4+00000079H 
                                          DD     __lcl.00000467 
                                          DD     0000001C 
                                          DD     lab4+0000009CH 
                                          DD     __lcl.00000467 
                                          DD     00000041 
                                          DD     lab4+0000018AH 
                                          DD     __lcl.00000467 
                                          DD     000001B7 
                                          DD     lab4+0000018EH 
                                          DD     __lcl.00000467 
                                          DD     000001B8 
                                          DD     lab4+0000019DH 
                                          DD     __lcl.00000467 
                                          DD     000001B9 
                                          DD     lab4+000001B6H 
                                          DD     __lcl.00000467 
                                          DD     000001BA 
                                          DD     lab4+000001C1H 
                                          DD     __lcl.00000467 
                                          DD     000001BB 
                                          DD     lab4+000001CAH 
                                          DD     __lcl.00000467 
                                          DD     000001BC 
                                          DD     lab4+000001E4H 
                                          DD     __lcl.00000467 
                                          DD     000001BC 
                                          DD     lab4+000001F0H 
                                          DD     __lcl.00000467 
; ********* End of segment, Total Size = 160


; ************* Initialized part of the global segment :
                                          ALIGN 4       
     000000            __lcl.00000435     DD     00000001 
                                          DD     00000005 
     000008            __lcl.00000434     DB     'N == ' 
     00000D            __lcl.00000429     DB     'Lab4.START.T4' 
                                          DB     00H    
     00001B            __lcl.00000428     DB     'Lab4.START.T3' 
                                          DB     00H    
     000029            __lcl.00000427     DB     'Lab4.START.T2' 
                                          DB     00H    
     000037            __lcl.00000426     DB     'Lab4.START.T1' 
                                          DB     00H    
                                          DB     00H,00H,00H 
     000048            __lcl.00000420     DD     00000001 
                                          DD     00000007 
     000050            __lcl.00000419     DB     'T4 stop' 
                                          DB     00     
     000058            __lcl.00000361     DD     00000001 
                                          DD     00000008 
     000060            __lcl.00000360     DB     'T4 start' 
     000068            __lcl.00000354     DD     00000001 
                                          DD     00000007 
     000070            __lcl.00000353     DB     'T3 stop' 
                                          DB     00     
     000078            __lcl.00000310     DD     00000001 
                                          DD     00000008 
     000080            __lcl.00000309     DB     'T3 start' 
     000088            __lcl.00000303     DD     00000001 
                                          DD     00000007 
     000090            __lcl.00000302     DB     'T2 stop' 
                                          DB     00     
     000098            __lcl.00000259     DD     00000001 
                                          DD     00000008 
     0000A0            __lcl.00000258     DB     'T2 start' 
     0000A8            __lcl.00000246     DD     00000001 
                                          DD     00000007 
     0000B0            __lcl.00000245     DB     'T1 stop' 
                                          DB     00     
     0000B8            __lcl.00000169     DD     00000001 
                                          DD     00000008 
     0000C0            __lcl.00000168     DB     'T1 start' 
     0000C8            lab4.mon__protected_type_desc DB 01 
                                          DB     3 DUP(00) 
                                          DD     00000003 
                                          DD     00000000 
                                          DB     01     
                                          DB     3 DUP(00) 
                                          DD     00000018 
                                          DD     lab4.mon__all_barriers 
                                          DD     lab4.mon.inputed 
                                          DD     lab4.mon.sortedt2 
                                          DD     lab4.mon.sortedt3 
                                          DD     lab4.mon.sortedt4 
; ********* End of segment, Total Size = 240


; ************* .av_dbgr segment :
                                          ALIGN 4       
                                          DD     00000000 
                                          DD     00000000 
     000008            lab4__rootpart____1 DD    lab4__subp_body_subpdesc____1 
; ********* End of segment, Total Size = 16


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000446     DB     04H    
                                          DB     'Lab4' 
                                          DB     00H,00H,00H 
     000008            lab4__subp_body_subpdesc____1 DD __lcl.00000446 
                                          DD     00000001 
                                          DD     __lcl.00000135 
                                          DD     0000000F 
                                          DD     000001B6 
                                          DD     000001BC 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000436 
                                          DD     __lcl.00000437 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000438 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000447 
                                          DD     0000009C 
                                          DD     __lcl.00000001 
     00006C            __lcl.00000445     DB     02H    
                                          DB     'MT'   
                                          DB     00     
     000070            __lcl.00000444     DB     01H    
                                          DB     'A'    
                                          DW     0000   
     000074            __lcl.00000443     DB     01H    
                                          DB     'C'    
                                          DW     0000   
     000078            __lcl.00000442     DB     08H    
                                          DB     'Time_all' 
                                          DB     00H,00H,00H 
     000084            __lcl.00000441     DB     05H    
                                          DB     'time1' 
                                          DW     0000   
     00008C            __lcl.00000440     DB     05H    
                                          DB     'time2' 
                                          DW     0000   
     000094            __lcl.00000439     DB     01H    
                                          DB     'T'    
                                          DW     0000   
     000098            __lcl.00000438     DD     00000008 
                                          DD     __lcl.00000070 
                                          DD     __lcl.00000069 
                                          DD     FFFFFFD4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000439 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF94 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000440 
                                          DD     __lcl.00000033 
                                          DD     FFFFFF8C 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000441 
                                          DD     __lcl.00000033 
                                          DD     FFFFFF84 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000442 
                                          DD     __lcl.00000024 
                                          DD     FFFFFF80 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000443 
                                          DD     __lcl.00000016 
                                          DD     FFFFFF7C 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000444 
                                          DD     __lcl.00000016 
                                          DD     FFFFFF78 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000445 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF74 
                                          DD     00000103 
                                          DD     00000000 
     00013C            __lcl.00000437     DD     00000002 
                                          DD     lab4.mon__protected_body_subpdesc____1 
                                          DD     lab4.start__subp_body_subpdesc____1 
     000148            __lcl.00000436     DD     00000001 
                                          DD     __lcl.00000070 
                                          DD     __lcl.00000069 
     000154            __lcl.00000433     DB     05H    
                                          DB     'START' 
                                          DW     0000   
     00015C            lab4.start__subp_body_subpdesc____1 DD __lcl.00000433 
                                          DD     00000011 
                                          DD     __lcl.00000135 
                                          DD     00000087 
                                          DD     000001B1 
                                          DD     000001B3 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000430 
                                          DD     __lcl.00000431 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000432 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000448 
                                          DD     000000C4 
                                          DD     __lcl.00000001 
     0001C0            __lcl.00000432     DD     00000004 
                                          DD     __lcl.00000167 
                                          DD     __lcl.00000166 
                                          DD     FFFFFFEC 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000165 
                                          DD     __lcl.00000164 
                                          DD     FFFFFFDC 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000163 
                                          DD     __lcl.00000162 
                                          DD     FFFFFFCC 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000161 
                                          DD     __lcl.00000160 
                                          DD     FFFFFFBC 
                                          DD     00000003 
                                          DD     00000000 
     000214            __lcl.00000431     DD     00000004 
                                          DD     lab4.start.t1__task_subpdesc____1 
                                          DD     lab4.start.t2__task_subpdesc____1 
                                          DD     lab4.start.t3__task_subpdesc____1 
                                          DD     lab4.start.t4__task_subpdesc____1 
     000228            __lcl.00000430     DD     00000004 
                                          DD     __lcl.00000167 
                                          DD     __lcl.00000166 
                                          DD     __lcl.00000165 
                                          DD     __lcl.00000164 
                                          DD     __lcl.00000163 
                                          DD     __lcl.00000162 
                                          DD     __lcl.00000161 
                                          DD     __lcl.00000160 
     00024C            lab4.start.t4__task_subpdesc____1 DD __lcl.00000167 
                                          DD     00000015 
                                          DD     __lcl.00000135 
                                          DD     00000168 
                                          DD     0000016E 
                                          DD     000001AF 
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
                                          DD     __lcl.00000421 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000425 
                                          DD     __lcl.00000166 
                                          DD     00000000 
                                          DD     __lcl.00000449 
                                          DD     000000A0 
                                          DD     __lcl.00000001 
     0002B0            __lcl.00000425     DD     00000005 
                                          DD     __lcl.00000378 
                                          DD     __lcl.00000389 
                                          DD     __lcl.00000403 
                                          DD     __lcl.00000413 
                                          DD     __lcl.00000418 
     0002C8            __lcl.00000424     DB     03H    
                                          DB     'MO4'  
     0002CC            __lcl.00000423     DB     05H    
                                          DB     'alfa4' 
                                          DW     0000   
     0002D4            __lcl.00000422     DB     02H    
                                          DB     'D4'   
                                          DB     00     
     0002D8            __lcl.00000421     DD     00000009 
                                          DD     __lcl.00000248 
                                          DD     __lcl.00000016 
                                          DD     FFFFFF8C 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000249 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF88 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000250 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF84 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000251 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF80 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000422 
                                          DD     __lcl.00000016 
                                          DD     FFFFFF7C 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000423 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF78 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000424 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF74 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000255 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF6C 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000256 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF68 
                                          DD     00000003 
                                          DD     00000000 
     000390            __lcl.00000418     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000001A8 
                                          DD     000001A8 
                                          DD     000001AA 
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
                                          DD     __lcl.00000417 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0003F4            __lcl.00000417     DD     00000001 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000416 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     00040C            __lcl.00000416     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000414 
                                          DD     __lcl.00000415 
     000428            __lcl.00000415     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000434            __lcl.00000414     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF4 
     000440            __lcl.00000413     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     0000019A 
                                          DD     0000019A 
                                          DD     000001A6 
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
                                          DD     __lcl.00000411 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000412 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0004A4            __lcl.00000412     DD     00000002 
                                          DD     __lcl.00000407 
                                          DD     __lcl.00000409 
     0004B0            __lcl.00000411     DD     00000001 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000406 
                                          DD     FFFFFFF0 
                                          DD     00000003 
                                          DD     00000001 
     0004C8            __lcl.00000410     DB     09H    
                                          DB     'Begin#417' 
                                          DW     0000   
     0004D4            __lcl.00000409     DD     __lcl.00000410 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000001A1 
                                          DD     000001A1 
                                          DD     000001A4 
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
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000538            __lcl.00000408     DB     09H    
                                          DB     'Begin#412' 
                                          DW     0000   
     000544            __lcl.00000407     DD     __lcl.00000408 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     0000019C 
                                          DD     0000019C 
                                          DD     0000019F 
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
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0005A8            __lcl.00000406     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000404 
                                          DD     __lcl.00000405 
     0005C4            __lcl.00000405     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     0005D0            __lcl.00000404     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE8 
     0005DC            __lcl.00000403     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000189 
                                          DD     00000189 
                                          DD     00000193 
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
                                          DD     __lcl.00000401 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000402 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000640            __lcl.00000402     DD     00000001 
                                          DD     __lcl.00000400 
     000648            __lcl.00000401     DD     00000001 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000392 
                                          DD     FFFFFFD8 
                                          DD     00000003 
                                          DD     00000001 
     000660            __lcl.00000400     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     0000018A 
                                          DD     0000018A 
                                          DD     00000192 
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
                                          DD     __lcl.00000398 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000399 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0006C4            __lcl.00000399     DD     00000001 
                                          DD     __lcl.00000396 
     0006CC            __lcl.00000398     DD     00000001 
                                          DD     __lcl.00000208 
                                          DD     __lcl.00000395 
                                          DD     FFFFFFE4 
                                          DD     00000003 
                                          DD     00000001 
     0006E4            __lcl.00000397     DB     09H    
                                          DB     'Begin#396' 
                                          DW     0000   
     0006F0            __lcl.00000396     DD     __lcl.00000397 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     0000018C 
                                          DD     0000018C 
                                          DD     00000190 
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
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000754            __lcl.00000395     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000393 
                                          DD     __lcl.00000394 
     000770            __lcl.00000394     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE0 
     00077C            __lcl.00000393     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFDC 
     000788            __lcl.00000392     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000390 
                                          DD     __lcl.00000391 
     0007A4            __lcl.00000391     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD4 
     0007B0            __lcl.00000390     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD0 
     0007BC            __lcl.00000389     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000182 
                                          DD     00000182 
                                          DD     00000188 
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
                                          DD     __lcl.00000387 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000388 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000820            __lcl.00000388     DD     00000001 
                                          DD     __lcl.00000386 
     000828            __lcl.00000387     DD     00000001 
                                          DD     __lcl.00000146 
                                          DD     __lcl.00000381 
                                          DD     FFFFFFC4 
                                          DD     00000003 
                                          DD     00000001 
     000840            __lcl.00000386     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000183 
                                          DD     00000183 
                                          DD     00000185 
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
                                          DD     __lcl.00000385 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0008A4            __lcl.00000385     DD     00000001 
                                          DD     __lcl.00000143 
                                          DD     __lcl.00000384 
                                          DD     FFFFFFCC 
                                          DD     00000003 
                                          DD     00000001 
     0008BC            __lcl.00000384     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000382 
                                          DD     __lcl.00000383 
     0008D8            __lcl.00000383     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFC8 
     0008E4            __lcl.00000382     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0008F0            __lcl.00000381     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000379 
                                          DD     __lcl.00000380 
     00090C            __lcl.00000380     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFC0 
     000918            __lcl.00000379     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFBC 
     000924            __lcl.00000378     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000178 
                                          DD     00000178 
                                          DD     00000180 
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
                                          DD     __lcl.00000376 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000377 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000988            __lcl.00000377     DD     00000001 
                                          DD     __lcl.00000375 
     000990            __lcl.00000376     DD     00000001 
                                          DD     __lcl.00000146 
                                          DD     __lcl.00000364 
                                          DD     FFFFFFA4 
                                          DD     00000003 
                                          DD     00000001 
     0009A8            __lcl.00000375     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000179 
                                          DD     00000179 
                                          DD     0000017F 
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
                                          DD     __lcl.00000373 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000374 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000A0C            __lcl.00000374     DD     00000001 
                                          DD     __lcl.00000372 
     000A14            __lcl.00000373     DD     00000001 
                                          DD     __lcl.00000143 
                                          DD     __lcl.00000367 
                                          DD     FFFFFFB0 
                                          DD     00000003 
                                          DD     00000001 
     000A2C            __lcl.00000372     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     0000017B 
                                          DD     0000017B 
                                          DD     0000017D 
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
                                          DD     __lcl.00000371 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000A90            __lcl.00000371     DD     00000001 
                                          DD     __lcl.00000180 
                                          DD     __lcl.00000370 
                                          DD     FFFFFFB8 
                                          DD     00000003 
                                          DD     00000001 
     000AA8            __lcl.00000370     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000368 
                                          DD     __lcl.00000369 
     000AC4            __lcl.00000369     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFB4 
     000AD0            __lcl.00000368     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000ADC            __lcl.00000367     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000365 
                                          DD     __lcl.00000366 
     000AF8            __lcl.00000366     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFAC 
     000B04            __lcl.00000365     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFA8 
     000B10            __lcl.00000364     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000362 
                                          DD     __lcl.00000363 
     000B2C            __lcl.00000363     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFA0 
     000B38            __lcl.00000362     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000B44            lab4.start.t3__task_subpdesc____1 DD __lcl.00000165 
                                          DD     00000014 
                                          DD     __lcl.00000135 
                                          DD     00000133 
                                          DD     00000137 
                                          DD     00000165 
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
                                          DD     __lcl.00000355 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000359 
                                          DD     __lcl.00000164 
                                          DD     00000000 
                                          DD     __lcl.00000450 
                                          DD     0000008C 
                                          DD     __lcl.00000001 
     000BA8            __lcl.00000359     DD     00000003 
                                          DD     __lcl.00000327 
                                          DD     __lcl.00000338 
                                          DD     __lcl.00000352 
     000BB8            __lcl.00000358     DB     03H    
                                          DB     'MO3'  
     000BBC            __lcl.00000357     DB     05H    
                                          DB     'alfa3' 
                                          DW     0000   
     000BC4            __lcl.00000356     DB     02H    
                                          DB     'D3'   
                                          DB     00     
     000BC8            __lcl.00000355     DD     0000000A 
                                          DD     __lcl.00000248 
                                          DD     __lcl.00000016 
                                          DD     FFFFFFA4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000251 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFA0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000356 
                                          DD     __lcl.00000016 
                                          DD     FFFFFF9C 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF98 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000249 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF94 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000250 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF90 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000357 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF8C 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000358 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF88 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000255 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF80 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000256 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF7C 
                                          DD     00000003 
                                          DD     00000000 
     000C94            __lcl.00000352     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000156 
                                          DD     00000156 
                                          DD     00000160 
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
                                          DD     __lcl.00000350 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000351 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000CF8            __lcl.00000351     DD     00000001 
                                          DD     __lcl.00000349 
     000D00            __lcl.00000350     DD     00000001 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000341 
                                          DD     FFFFFFF0 
                                          DD     00000003 
                                          DD     00000001 
     000D18            __lcl.00000349     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000157 
                                          DD     00000157 
                                          DD     0000015F 
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
                                          DD     __lcl.00000347 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000348 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000D7C            __lcl.00000348     DD     00000001 
                                          DD     __lcl.00000345 
     000D84            __lcl.00000347     DD     00000001 
                                          DD     __lcl.00000208 
                                          DD     __lcl.00000344 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000D9C            __lcl.00000346     DB     09H    
                                          DB     'Begin#345' 
                                          DW     0000   
     000DA8            __lcl.00000345     DD     __lcl.00000346 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000159 
                                          DD     00000159 
                                          DD     0000015D 
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
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000E0C            __lcl.00000344     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000342 
                                          DD     __lcl.00000343 
     000E28            __lcl.00000343     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000E34            __lcl.00000342     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF4 
     000E40            __lcl.00000341     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000339 
                                          DD     __lcl.00000340 
     000E5C            __lcl.00000340     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     000E68            __lcl.00000339     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE8 
     000E74            __lcl.00000338     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     0000014F 
                                          DD     0000014F 
                                          DD     00000155 
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
                                          DD     __lcl.00000336 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000337 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000ED8            __lcl.00000337     DD     00000001 
                                          DD     __lcl.00000335 
     000EE0            __lcl.00000336     DD     00000001 
                                          DD     __lcl.00000146 
                                          DD     __lcl.00000330 
                                          DD     FFFFFFDC 
                                          DD     00000003 
                                          DD     00000001 
     000EF8            __lcl.00000335     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000150 
                                          DD     00000150 
                                          DD     00000152 
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
                                          DD     __lcl.00000334 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000F5C            __lcl.00000334     DD     00000001 
                                          DD     __lcl.00000143 
                                          DD     __lcl.00000333 
                                          DD     FFFFFFE4 
                                          DD     00000003 
                                          DD     00000001 
     000F74            __lcl.00000333     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000331 
                                          DD     __lcl.00000332 
     000F90            __lcl.00000332     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE0 
     000F9C            __lcl.00000331     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000FA8            __lcl.00000330     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000328 
                                          DD     __lcl.00000329 
     000FC4            __lcl.00000329     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD8 
     000FD0            __lcl.00000328     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD4 
     000FDC            __lcl.00000327     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000145 
                                          DD     00000145 
                                          DD     0000014D 
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
                                          DD     __lcl.00000325 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000326 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001040            __lcl.00000326     DD     00000001 
                                          DD     __lcl.00000324 
     001048            __lcl.00000325     DD     00000001 
                                          DD     __lcl.00000146 
                                          DD     __lcl.00000313 
                                          DD     FFFFFFBC 
                                          DD     00000003 
                                          DD     00000001 
     001060            __lcl.00000324     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000146 
                                          DD     00000146 
                                          DD     0000014C 
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
                                          DD     __lcl.00000322 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000323 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0010C4            __lcl.00000323     DD     00000001 
                                          DD     __lcl.00000321 
     0010CC            __lcl.00000322     DD     00000001 
                                          DD     __lcl.00000143 
                                          DD     __lcl.00000316 
                                          DD     FFFFFFC8 
                                          DD     00000003 
                                          DD     00000001 
     0010E4            __lcl.00000321     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000148 
                                          DD     00000148 
                                          DD     0000014A 
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
                                          DD     __lcl.00000320 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001148            __lcl.00000320     DD     00000001 
                                          DD     __lcl.00000180 
                                          DD     __lcl.00000319 
                                          DD     FFFFFFD0 
                                          DD     00000003 
                                          DD     00000001 
     001160            __lcl.00000319     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000317 
                                          DD     __lcl.00000318 
     00117C            __lcl.00000318     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFCC 
     001188            __lcl.00000317     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001194            __lcl.00000316     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000314 
                                          DD     __lcl.00000315 
     0011B0            __lcl.00000315     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFC4 
     0011BC            __lcl.00000314     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFC0 
     0011C8            __lcl.00000313     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000311 
                                          DD     __lcl.00000312 
     0011E4            __lcl.00000312     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFB8 
     0011F0            __lcl.00000311     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0011FC            lab4.start.t2__task_subpdesc____1 DD __lcl.00000163 
                                          DD     00000013 
                                          DD     __lcl.00000135 
                                          DD     000000FC 
                                          DD     00000101 
                                          DD     00000130 
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
                                          DD     __lcl.00000304 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000308 
                                          DD     __lcl.00000162 
                                          DD     00000000 
                                          DD     __lcl.00000451 
                                          DD     00000088 
                                          DD     __lcl.00000001 
     001260            __lcl.00000308     DD     00000003 
                                          DD     __lcl.00000276 
                                          DD     __lcl.00000287 
                                          DD     __lcl.00000301 
     001270            __lcl.00000307     DB     03H    
                                          DB     'MO2'  
     001274            __lcl.00000306     DB     05H    
                                          DB     'alfa2' 
                                          DW     0000   
     00127C            __lcl.00000305     DB     02H    
                                          DB     'D2'   
                                          DB     00     
     001280            __lcl.00000304     DD     00000009 
                                          DD     __lcl.00000248 
                                          DD     __lcl.00000016 
                                          DD     FFFFFFA4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000251 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFA0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000305 
                                          DD     __lcl.00000016 
                                          DD     FFFFFF9C 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000306 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF98 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000307 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF94 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000249 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF8C 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000250 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF88 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000255 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF84 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000256 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF80 
                                          DD     00000003 
                                          DD     00000000 
     001338            __lcl.00000301     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000121 
                                          DD     00000121 
                                          DD     0000012B 
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
                                          DD     __lcl.00000299 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000300 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00139C            __lcl.00000300     DD     00000001 
                                          DD     __lcl.00000298 
     0013A4            __lcl.00000299     DD     00000001 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000290 
                                          DD     FFFFFFF0 
                                          DD     00000003 
                                          DD     00000001 
     0013BC            __lcl.00000298     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000122 
                                          DD     00000122 
                                          DD     0000012A 
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
                                          DD     __lcl.00000296 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000297 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001420            __lcl.00000297     DD     00000001 
                                          DD     __lcl.00000294 
     001428            __lcl.00000296     DD     00000001 
                                          DD     __lcl.00000208 
                                          DD     __lcl.00000293 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     001440            __lcl.00000295     DB     09H    
                                          DB     'Begin#292' 
                                          DW     0000   
     00144C            __lcl.00000294     DD     __lcl.00000295 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000124 
                                          DD     00000124 
                                          DD     00000128 
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
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0014B0            __lcl.00000293     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000291 
                                          DD     __lcl.00000292 
     0014CC            __lcl.00000292     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     0014D8            __lcl.00000291     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF4 
     0014E4            __lcl.00000290     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000288 
                                          DD     __lcl.00000289 
     001500            __lcl.00000289     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     00150C            __lcl.00000288     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE8 
     001518            __lcl.00000287     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     0000011A 
                                          DD     0000011A 
                                          DD     00000120 
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
                                          DD     __lcl.00000285 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000286 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00157C            __lcl.00000286     DD     00000001 
                                          DD     __lcl.00000284 
     001584            __lcl.00000285     DD     00000001 
                                          DD     __lcl.00000146 
                                          DD     __lcl.00000279 
                                          DD     FFFFFFDC 
                                          DD     00000003 
                                          DD     00000001 
     00159C            __lcl.00000284     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     0000011B 
                                          DD     0000011B 
                                          DD     0000011D 
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
                                          DD     __lcl.00000283 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001600            __lcl.00000283     DD     00000001 
                                          DD     __lcl.00000143 
                                          DD     __lcl.00000282 
                                          DD     FFFFFFE4 
                                          DD     00000003 
                                          DD     00000001 
     001618            __lcl.00000282     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000280 
                                          DD     __lcl.00000281 
     001634            __lcl.00000281     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE0 
     001640            __lcl.00000280     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00164C            __lcl.00000279     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000277 
                                          DD     __lcl.00000278 
     001668            __lcl.00000278     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD8 
     001674            __lcl.00000277     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD4 
     001680            __lcl.00000276     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000110 
                                          DD     00000110 
                                          DD     00000118 
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
                                          DD     __lcl.00000274 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000275 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0016E4            __lcl.00000275     DD     00000001 
                                          DD     __lcl.00000273 
     0016EC            __lcl.00000274     DD     00000001 
                                          DD     __lcl.00000146 
                                          DD     __lcl.00000262 
                                          DD     FFFFFFBC 
                                          DD     00000003 
                                          DD     00000001 
     001704            __lcl.00000273     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000111 
                                          DD     00000111 
                                          DD     00000117 
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
                                          DD     __lcl.00000271 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000272 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001768            __lcl.00000272     DD     00000001 
                                          DD     __lcl.00000270 
     001770            __lcl.00000271     DD     00000001 
                                          DD     __lcl.00000143 
                                          DD     __lcl.00000265 
                                          DD     FFFFFFC8 
                                          DD     00000003 
                                          DD     00000001 
     001788            __lcl.00000270     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000113 
                                          DD     00000113 
                                          DD     00000115 
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
                                          DD     __lcl.00000269 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0017EC            __lcl.00000269     DD     00000001 
                                          DD     __lcl.00000180 
                                          DD     __lcl.00000268 
                                          DD     FFFFFFD0 
                                          DD     00000003 
                                          DD     00000001 
     001804            __lcl.00000268     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000266 
                                          DD     __lcl.00000267 
     001820            __lcl.00000267     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFCC 
     00182C            __lcl.00000266     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001838            __lcl.00000265     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000263 
                                          DD     __lcl.00000264 
     001854            __lcl.00000264     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFC4 
     001860            __lcl.00000263     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFC0 
     00186C            __lcl.00000262     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000260 
                                          DD     __lcl.00000261 
     001888            __lcl.00000261     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFB8 
     001894            __lcl.00000260     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0018A0            lab4.start.t1__task_subpdesc____1 DD __lcl.00000161 
                                          DD     00000012 
                                          DD     __lcl.00000135 
                                          DD     00000091 
                                          DD     00000097 
                                          DD     000000F9 
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
                                          DD     __lcl.00000247 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000257 
                                          DD     __lcl.00000160 
                                          DD     00000000 
                                          DD     __lcl.00000452 
                                          DD     0000009C 
                                          DD     __lcl.00000001 
     001904            __lcl.00000257     DD     00000007 
                                          DD     __lcl.00000187 
                                          DD     __lcl.00000198 
                                          DD     __lcl.00000214 
                                          DD     __lcl.00000224 
                                          DD     __lcl.00000229 
                                          DD     __lcl.00000239 
                                          DD     __lcl.00000244 
     001924            __lcl.00000256     DB     04H    
                                          DB     'Sum1' 
                                          DB     00H,00H,00H 
     00192C            __lcl.00000255     DB     04H    
                                          DB     'Temp' 
                                          DB     00H,00H,00H 
     001934            __lcl.00000254     DB     03H    
                                          DB     'MO1'  
     001938            __lcl.00000253     DB     05H    
                                          DB     'alfa1' 
                                          DW     0000   
     001940            __lcl.00000252     DB     02H    
                                          DB     'D1'   
                                          DB     00     
     001944            __lcl.00000251     DB     03H    
                                          DB     'MTF'  
     001948            __lcl.00000250     DB     03H    
                                          DB     'Uk1'  
     00194C            __lcl.00000249     DB     03H    
                                          DB     'Uk2'  
     001950            __lcl.00000248     DB     02H    
                                          DB     'Tv'   
                                          DB     00     
     001954            __lcl.00000247     DD     00000009 
                                          DD     __lcl.00000248 
                                          DD     __lcl.00000016 
                                          DD     FFFFFF90 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000249 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF8C 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000250 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF88 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000251 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF84 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000252 
                                          DD     __lcl.00000016 
                                          DD     FFFFFF80 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000253 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF7C 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000254 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF78 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000255 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF70 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000256 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF6C 
                                          DD     00000003 
                                          DD     00000000 
     001A0C            __lcl.00000244     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000EC 
                                          DD     000000EC 
                                          DD     000000EE 
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
                                          DD     __lcl.00000243 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001A70            __lcl.00000243     DD     00000001 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000242 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     001A88            __lcl.00000242     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000240 
                                          DD     __lcl.00000241 
     001AA4            __lcl.00000241     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     001AB0            __lcl.00000240     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001ABC            __lcl.00000239     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000DE 
                                          DD     000000DE 
                                          DD     000000EA 
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
                                          DD     __lcl.00000237 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000238 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001B20            __lcl.00000238     DD     00000002 
                                          DD     __lcl.00000233 
                                          DD     __lcl.00000235 
     001B2C            __lcl.00000237     DD     00000001 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000232 
                                          DD     FFFFFFEC 
                                          DD     00000003 
                                          DD     00000001 
     001B44            __lcl.00000236     DB     09H    
                                          DB     'Begin#229' 
                                          DW     0000   
     001B50            __lcl.00000235     DD     __lcl.00000236 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000E5 
                                          DD     000000E5 
                                          DD     000000E8 
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
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001BB4            __lcl.00000234     DB     09H    
                                          DB     'Begin#224' 
                                          DW     0000   
     001BC0            __lcl.00000233     DD     __lcl.00000234 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000E0 
                                          DD     000000E0 
                                          DD     000000E3 
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
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001C24            __lcl.00000232     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000230 
                                          DD     __lcl.00000231 
     001C40            __lcl.00000231     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE8 
     001C4C            __lcl.00000230     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001C58            __lcl.00000229     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000D5 
                                          DD     000000D5 
                                          DD     000000D7 
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
                                          DD     __lcl.00000228 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001CBC            __lcl.00000228     DD     00000001 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000227 
                                          DD     FFFFFFE4 
                                          DD     00000003 
                                          DD     00000001 
     001CD4            __lcl.00000227     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000225 
                                          DD     __lcl.00000226 
     001CF0            __lcl.00000226     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE0 
     001CFC            __lcl.00000225     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001D08            __lcl.00000224     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000C8 
                                          DD     000000C8 
                                          DD     000000D4 
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
                                          DD     __lcl.00000222 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000223 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001D6C            __lcl.00000223     DD     00000002 
                                          DD     __lcl.00000218 
                                          DD     __lcl.00000220 
     001D78            __lcl.00000222     DD     00000001 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000217 
                                          DD     FFFFFFDC 
                                          DD     00000003 
                                          DD     00000001 
     001D90            __lcl.00000221     DB     09H    
                                          DB     'Begin#207' 
                                          DW     0000   
     001D9C            __lcl.00000220     DD     __lcl.00000221 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000CF 
                                          DD     000000CF 
                                          DD     000000D2 
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
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001E00            __lcl.00000219     DB     09H    
                                          DB     'Begin#202' 
                                          DW     0000   
     001E0C            __lcl.00000218     DD     __lcl.00000219 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000CA 
                                          DD     000000CA 
                                          DD     000000CD 
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
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001E70            __lcl.00000217     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000215 
                                          DD     __lcl.00000216 
     001E8C            __lcl.00000216     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD8 
     001E98            __lcl.00000215     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001EA4            __lcl.00000214     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000B7 
                                          DD     000000B7 
                                          DD     000000C1 
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
                                          DD     __lcl.00000211 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000213 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001F08            __lcl.00000213     DD     00000001 
                                          DD     __lcl.00000210 
     001F10            __lcl.00000212     DB     06H    
                                          DB     'Count1' 
                                          DB     00     
     001F18            __lcl.00000211     DD     00000001 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000201 
                                          DD     FFFFFFCC 
                                          DD     00000003 
                                          DD     00000001 
     001F30            __lcl.00000210     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000B8 
                                          DD     000000B8 
                                          DD     000000C0 
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
                                          DD     __lcl.00000207 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000209 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001F94            __lcl.00000209     DD     00000001 
                                          DD     __lcl.00000205 
     001F9C            __lcl.00000208     DB     06H    
                                          DB     'Count2' 
                                          DB     00     
     001FA4            __lcl.00000207     DD     00000001 
                                          DD     __lcl.00000208 
                                          DD     __lcl.00000204 
                                          DD     FFFFFFD4 
                                          DD     00000003 
                                          DD     00000001 
     001FBC            __lcl.00000206     DB     09H    
                                          DB     'Begin#186' 
                                          DW     0000   
     001FC8            __lcl.00000205     DD     __lcl.00000206 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000BA 
                                          DD     000000BA 
                                          DD     000000BE 
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
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00202C            __lcl.00000204     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000202 
                                          DD     __lcl.00000203 
     002048            __lcl.00000203     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD0 
     002054            __lcl.00000202     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002060            __lcl.00000201     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000199 
                                          DD     __lcl.00000200 
     00207C            __lcl.00000200     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFC8 
     002088            __lcl.00000199     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002094            __lcl.00000198     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000B0 
                                          DD     000000B0 
                                          DD     000000B6 
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
                                          DD     __lcl.00000196 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000197 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0020F8            __lcl.00000197     DD     00000001 
                                          DD     __lcl.00000195 
     002100            __lcl.00000196     DD     00000001 
                                          DD     __lcl.00000146 
                                          DD     __lcl.00000190 
                                          DD     FFFFFFBC 
                                          DD     00000003 
                                          DD     00000001 
     002118            __lcl.00000195     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000B1 
                                          DD     000000B1 
                                          DD     000000B3 
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
                                          DD     __lcl.00000194 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00217C            __lcl.00000194     DD     00000001 
                                          DD     __lcl.00000143 
                                          DD     __lcl.00000193 
                                          DD     FFFFFFC4 
                                          DD     00000003 
                                          DD     00000001 
     002194            __lcl.00000193     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000191 
                                          DD     __lcl.00000192 
     0021B0            __lcl.00000192     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFC0 
     0021BC            __lcl.00000191     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0021C8            __lcl.00000190     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000188 
                                          DD     __lcl.00000189 
     0021E4            __lcl.00000189     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFB8 
     0021F0            __lcl.00000188     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0021FC            __lcl.00000187     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000A6 
                                          DD     000000A6 
                                          DD     000000AE 
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
                                          DD     __lcl.00000185 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000186 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002260            __lcl.00000186     DD     00000001 
                                          DD     __lcl.00000184 
     002268            __lcl.00000185     DD     00000001 
                                          DD     __lcl.00000146 
                                          DD     __lcl.00000172 
                                          DD     FFFFFFA4 
                                          DD     00000003 
                                          DD     00000001 
     002280            __lcl.00000184     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000A7 
                                          DD     000000A7 
                                          DD     000000AD 
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
                                          DD     __lcl.00000182 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000183 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0022E4            __lcl.00000183     DD     00000001 
                                          DD     __lcl.00000181 
     0022EC            __lcl.00000182     DD     00000001 
                                          DD     __lcl.00000143 
                                          DD     __lcl.00000175 
                                          DD     FFFFFFAC 
                                          DD     00000003 
                                          DD     00000001 
     002304            __lcl.00000181     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     000000A9 
                                          DD     000000A9 
                                          DD     000000AB 
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
                                          DD     __lcl.00000179 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002368            __lcl.00000180     DB     01H    
                                          DB     'z'    
                                          DW     0000   
     00236C            __lcl.00000179     DD     00000001 
                                          DD     __lcl.00000180 
                                          DD     __lcl.00000178 
                                          DD     FFFFFFB4 
                                          DD     00000003 
                                          DD     00000001 
     002384            __lcl.00000178     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000176 
                                          DD     __lcl.00000177 
     0023A0            __lcl.00000177     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFB0 
     0023AC            __lcl.00000176     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0023B8            __lcl.00000175     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000173 
                                          DD     __lcl.00000174 
     0023D4            __lcl.00000174     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFA8 
     0023E0            __lcl.00000173     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0023EC            __lcl.00000172     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000170 
                                          DD     __lcl.00000171 
     002408            __lcl.00000171     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFA0 
     002414            __lcl.00000170     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002420            __lcl.00000167     DB     02H    
                                          DB     'T4'   
                                          DB     00     
     002424            __lcl.00000166     DD     __lcl.00000167 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     002434            __lcl.00000165     DB     02H    
                                          DB     'T3'   
                                          DB     00     
     002438            __lcl.00000164     DD     __lcl.00000165 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     002448            __lcl.00000163     DB     02H    
                                          DB     'T2'   
                                          DB     00     
     00244C            __lcl.00000162     DD     __lcl.00000163 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     00245C            __lcl.00000161     DB     02H    
                                          DB     'T1'   
                                          DB     00     
     002460            __lcl.00000160     DD     __lcl.00000161 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     002470            lab4.mon__protected_body_subpdesc____1 DD __lcl.00000070 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000041 
                                          DD     00000041 
                                          DD     00000085 
                                          DD     00000005 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000159 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0024D4            __lcl.00000159     DD     0000000E 
                                          DD     lab4.mon.datasignal__subp_body_subpdesc____1 
                                          DD     lab4.mon.aht2__subp_body_subpdesc____1 
                                          DD     lab4.mon.a2ht4__subp_body_subpdesc____1 
                                          DD     lab4.mon.aht3__subp_body_subpdesc____1 
                                          DD     lab4.mon.setmo__subp_body_subpdesc____1 
                                          DD     lab4.mon.setalfa__subp_body_subpdesc____1 
                                          DD     lab4.mon.setd__subp_body_subpdesc____1 
                                          DD     lab4.mon.getmo__subp_body_subpdesc____1 
                                          DD     lab4.mon.getalfa__subp_body_subpdesc____1 
                                          DD     lab4.mon.getd__subp_body_subpdesc____1 
                                          DD     lab4.mon.inputed__subp_body_subpdesc____1 
                                          DD     lab4.mon.sortedt2__subp_body_subpdesc____1 
                                          DD     lab4.mon.sortedt3__subp_body_subpdesc____1 
                                          DD     lab4.mon.sortedt4__subp_body_subpdesc____1 
     002510            lab4.mon.sortedt4__subp_body_subpdesc____1 DD __lcl.00000058 
                                          DD     0000000F 
                                          DD     __lcl.00000135 
                                          DD     00000081 
                                          DD     00000082 
                                          DD     00000084 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000453 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002574            lab4.mon.sortedt3__subp_body_subpdesc____1 DD __lcl.00000057 
                                          DD     0000000E 
                                          DD     __lcl.00000135 
                                          DD     0000007D 
                                          DD     0000007E 
                                          DD     00000080 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000454 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0025D8            lab4.mon.sortedt2__subp_body_subpdesc____1 DD __lcl.00000056 
                                          DD     0000000D 
                                          DD     __lcl.00000135 
                                          DD     00000079 
                                          DD     0000007A 
                                          DD     0000007C 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000455 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00263C            lab4.mon.inputed__subp_body_subpdesc____1 DD __lcl.00000055 
                                          DD     0000000C 
                                          DD     __lcl.00000135 
                                          DD     00000074 
                                          DD     00000075 
                                          DD     00000077 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000456 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0026A0            lab4.mon.getd__subp_body_subpdesc____1 DD __lcl.00000068 
                                          DD     0000000B 
                                          DD     __lcl.00000135 
                                          DD     0000006F 
                                          DD     00000070 
                                          DD     00000072 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000016 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000457 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002704            lab4.mon.getalfa__subp_body_subpdesc____1 DD __lcl.00000067 
                                          DD     0000000A 
                                          DD     __lcl.00000135 
                                          DD     0000006B 
                                          DD     0000006C 
                                          DD     0000006E 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000458 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002768            lab4.mon.getmo__subp_body_subpdesc____1 DD __lcl.00000066 
                                          DD     00000009 
                                          DD     __lcl.00000135 
                                          DD     00000067 
                                          DD     00000068 
                                          DD     0000006A 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000018 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000459 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0027CC            lab4.mon.setd__subp_body_subpdesc____1 DD __lcl.00000065 
                                          DD     00000008 
                                          DD     __lcl.00000135 
                                          DD     00000061 
                                          DD     00000062 
                                          DD     00000066 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000157 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000158 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000460 
                                          DD     00000008 
                                          DD     __lcl.00000001 
     002830            __lcl.00000158     DD     00000001 
                                          DD     __lcl.00000156 
     002838            __lcl.00000157     DD     00000001 
                                          DD     __lcl.00000051 
                                          DD     __lcl.00000016 
                                          DD     00000000 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     0000000C 
     002854            __lcl.00000156     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000063 
                                          DD     00000063 
                                          DD     00000065 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000155 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0028B8            __lcl.00000155     DD     00000001 
                                          DD     __lcl.00000146 
                                          DD     __lcl.00000154 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0028D0            __lcl.00000154     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000152 
                                          DD     __lcl.00000153 
     0028EC            __lcl.00000153     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     0028F8            __lcl.00000152     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002904            lab4.mon.setalfa__subp_body_subpdesc____1 DD __lcl.00000064 
                                          DD     00000007 
                                          DD     __lcl.00000135 
                                          DD     0000005D 
                                          DD     0000005E 
                                          DD     00000060 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000151 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000461 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002968            __lcl.00000151     DD     00000001 
                                          DD     __lcl.00000051 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00010000 
                                          DB     4 DUP(00) 
                                          DD     0000000C 
     002984            lab4.mon.setmo__subp_body_subpdesc____1 DD __lcl.00000063 
                                          DD     00000006 
                                          DD     __lcl.00000135 
                                          DD     00000055 
                                          DD     00000056 
                                          DD     0000005C 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000149 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000150 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000462 
                                          DD     00000010 
                                          DD     __lcl.00000001 
     0029E8            __lcl.00000150     DD     00000001 
                                          DD     __lcl.00000148 
     0029F0            __lcl.00000149     DD     00000001 
                                          DD     __lcl.00000051 
                                          DD     __lcl.00000018 
                                          DD     00000000 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     0000000C 
     002A0C            __lcl.00000148     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000057 
                                          DD     00000057 
                                          DD     0000005B 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000145 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000147 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002A70            __lcl.00000147     DD     00000001 
                                          DD     __lcl.00000144 
     002A78            __lcl.00000146     DB     01H    
                                          DB     'i'    
                                          DW     0000   
     002A7C            __lcl.00000145     DD     00000001 
                                          DD     __lcl.00000146 
                                          DD     __lcl.00000138 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     002A94            __lcl.00000144     DB     8 DUP(00) 
                                          DD     __lcl.00000135 
                                          DD     00000058 
                                          DD     00000058 
                                          DD     0000005A 
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
                                          DD     __lcl.00000142 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002AF8            __lcl.00000143     DB     01H    
                                          DB     'j'    
                                          DW     0000   
     002AFC            __lcl.00000142     DD     00000001 
                                          DD     __lcl.00000143 
                                          DD     __lcl.00000141 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     002B14            __lcl.00000141     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000139 
                                          DD     __lcl.00000140 
     002B30            __lcl.00000140     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     002B3C            __lcl.00000139     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002B48            __lcl.00000138     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000136 
                                          DD     __lcl.00000137 
     002B64            __lcl.00000137     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     002B70            __lcl.00000136     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002B7C            lab4.mon.aht3__subp_body_subpdesc____1 DD __lcl.00000062 
                                          DD     00000005 
                                          DD     __lcl.00000135 
                                          DD     00000050 
                                          DD     00000051 
                                          DD     00000053 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000463 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002BE0            lab4.mon.a2ht4__subp_body_subpdesc____1 DD __lcl.00000061 
                                          DD     00000004 
                                          DD     __lcl.00000135 
                                          DD     0000004C 
                                          DD     0000004D 
                                          DD     0000004F 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000464 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002C44            lab4.mon.aht2__subp_body_subpdesc____1 DD __lcl.00000060 
                                          DD     00000003 
                                          DD     __lcl.00000135 
                                          DD     00000048 
                                          DD     00000049 
                                          DD     0000004B 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000465 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002CA8            __lcl.00000135     DB     0BH    
                                          DB     '..\lab4.adb' 
     002CB4            lab4.mon.datasignal__subp_body_subpdesc____1 DD __lcl.00000059 
                                          DD     00000002 
                                          DD     __lcl.00000135 
                                          DD     00000043 
                                          DD     00000044 
                                          DD     00000046 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000466 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002D18            __lcl.00000134     DB     0CH    
                                          DB     'Pr_Type_Desc' 
                                          DB     00H,00H,00H 
     002D28            __lcl.00000133     DD     __lcl.00000134 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     __lcl.00000125 
                                          DD     00000000 
     002D40            __lcl.00000132     DB     10H    
                                          DB     'Compute_Barriers' 
                                          DB     00H,00H,00H 
     002D54            __lcl.00000131     DB     14H    
                                          DB     'Compute_All_Barriers' 
                                          DB     00H,00H,00H 
     002D6C            __lcl.00000130     DB     0AH    
                                          DB     'Entry_Code' 
                                          DB     00     
     002D78            __lcl.00000129     DB     10H    
                                          DB     'Depends_On_Count' 
                                          DB     00H,00H,00H 
     002D8C            __lcl.00000128     DB     0CH    
                                          DB     'Handler_List' 
                                          DB     00H,00H,00H 
     002D9C            __lcl.00000127     DB     0EH    
                                          DB     'Max_Name_Index' 
                                          DB     00     
     002DAC            __lcl.00000126     DB     07H    
                                          DB     'PT_Kind' 
     002DB4            __lcl.00000125     DD     00000007 
                                          DD     __lcl.00000126 
                                          DD     __lcl.00000078 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
                                          DD     00000000 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000082 
                                          DD     00000004 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
                                          DD     00000000 
                                          DD     __lcl.00000128 
                                          DD     __lcl.00000103 
                                          DD     00000008 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000129 
                                          DD     __lcl.00000109 
                                          DD     0000000C 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000108 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000112 
                                          DD     00000010 
                                          DD     00000000 
                                          DD     __lcl.00000116 
                                          DD     00000200 
                                          DD     __lcl.00000108 
                                          DD     __lcl.00000131 
                                          DD     __lcl.00000091 
                                          DD     00000014 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000118 
                                          DD     __lcl.00000132 
                                          DD     __lcl.00000112 
                                          DD     00000014 
                                          DD     00000000 
                                          DD     __lcl.00000123 
                                          DD     00000100 
                                          DD     __lcl.00000120 
     002E7C            __lcl.00000124     DD     __lcl.00000108 
                                          DD     00000001 
                                          DD     00000000 
     002E88            __lcl.00000123     DD     00000001 
                                          DD     __lcl.00000121 
                                          DD     __lcl.00000122 
     002E94            __lcl.00000122     DD     00000001 
                                          DD     00000002 
     002E9C            __lcl.00000121     DD     00000000 
                                          DD     00000000 
     002EA4            __lcl.00000120     DD     __lcl.00000108 
                                          DD     00000001 
                                          DD     __lcl.00000119 
     002EB0            __lcl.00000119     DD     00000000 
                                          DD     00000000 
                                          DD     00000002 
     002EBC            __lcl.00000118     DD     __lcl.00000108 
                                          DD     00000001 
                                          DD     __lcl.00000117 
     002EC8            __lcl.00000117     DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
     002ED4            __lcl.00000116     DD     00000001 
                                          DD     __lcl.00000114 
                                          DD     __lcl.00000115 
     002EE0            __lcl.00000115     DD     00000001 
                                          DD     00000002 
     002EE8            __lcl.00000114     DD     00000000 
                                          DD     00000000 
     002EF0            __lcl.00000113     DB     0AH    
                                          DB     'Code_Array' 
                                          DB     00     
     002EFC            __lcl.00000112     DD     __lcl.00000113 
                                          DD     00000011 
                                          DD     0000000E 
                                          DD     __lcl.00000111 
                                          DD     __lcl.00000091 
                                          DD     __lcl.00000110 
     002F14            __lcl.00000111     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     002F20            __lcl.00000110     DD     00000001 
                                          DD     __lcl.00000082 
     002F28            __lcl.00000109     DB     4 DUP(00) 
                                          DD     00000001 
                                          DD     00000002 
     002F34            __lcl.00000108     DD     00000000 
                                          DD     00000001 
                                          DD     __lcl.00000107 
     002F40            __lcl.00000107     DD     00000000 
                                          DD     00000001 
                                          DD     00000001 
                                          DD     00000002 
     002F50            __lcl.00000106     DD     00000000 
                                          DD     00000001 
                                          DD     __lcl.00000105 
     002F5C            __lcl.00000105     DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
     002F68            __lcl.00000104     DB     13H    
                                          DB     'Handler_List_Access' 
     002F7C            __lcl.00000103     DD     __lcl.00000104 
                                          DD     00000003 
                                          DD     0000000D 
                                          DD     __lcl.00000101 
     002F8C            __lcl.00000102     DB     11H    
                                          DB     'Handler_List_Type' 
                                          DW     0000   
     002FA0            __lcl.00000101     DD     __lcl.00000102 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     __lcl.00000098 
                                          DD     00000000 
     002FB8            __lcl.00000100     DB     07H    
                                          DB     'Handler' 
     002FC0            __lcl.00000099     DB     0CH    
                                          DB     'Num_Handlers' 
                                          DB     00H,00H,00H 
     002FD0            __lcl.00000098     DD     00000002 
                                          DD     __lcl.00000099 
                                          DD     __lcl.00000086 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
                                          DD     00000000 
                                          DD     __lcl.00000100 
                                          DD     __lcl.00000093 
                                          DD     00000004 
                                          DD     00000000 
                                          DD     __lcl.00000097 
                                          DD     00000100 
                                          DD     00000000 
     00300C            __lcl.00000097     DD     00000001 
                                          DD     __lcl.00000095 
                                          DD     __lcl.00000096 
     003018            __lcl.00000096     DD     00000001 
                                          DD     00000001 
     003020            __lcl.00000095     DD     00000000 
                                          DD     00000001 
     003028            __lcl.00000094     DB     0DH    
                                          DB     'Handler_Array' 
                                          DW     0000   
     003038            __lcl.00000093     DD     __lcl.00000094 
                                          DD     00000011 
                                          DD     0000000E 
                                          DD     __lcl.00000088 
                                          DD     __lcl.00000091 
                                          DD     __lcl.00000087 
     003050            __lcl.00000092     DB     0CH    
                                          DB     'Code_Address' 
                                          DB     00H,00H,00H 
     003060            __lcl.00000091     DD     __lcl.00000092 
                                          DD     00000003 
                                          DD     0000000D 
                                          DD     __lcl.00000089 
     003070            __lcl.00000090     DB     0AH    
                                          DB     'Raw_Object' 
                                          DB     00     
     00307C            __lcl.00000089     DD     __lcl.00000090 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     00000000 
     003094            __lcl.00000088     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     0030A0            __lcl.00000087     DD     00000001 
                                          DD     __lcl.00000086 
     0030A8            __lcl.00000086     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000083 
                                          DD     __lcl.00000084 
                                          DD     __lcl.00000085 
     0030C4            __lcl.00000085     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     0030D0            __lcl.00000084     DD     00000008 
                                          DD     00000003 
                                          DD     00000000 
     0030DC            __lcl.00000083     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     0030E8            __lcl.00000082     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000079 
                                          DD     __lcl.00000080 
                                          DD     __lcl.00000081 
     003104            __lcl.00000081     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     003110            __lcl.00000080     DD     00000008 
                                          DD     00000003 
                                          DD     00000000 
     00311C            __lcl.00000079     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     003128            __lcl.00000078     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000075 
                                          DD     __lcl.00000076 
                                          DD     __lcl.00000077 
     003144            __lcl.00000077     DD     00000003 
                                          DD     00000001 
                                          DB     02     
                                          DB     00H,00H,00H 
     003150            __lcl.00000076     DD     00000003 
                                          DD     00000001 
                                          DB     00     
                                          DB     00H,00H,00H 
     00315C            __lcl.00000075     DB     4 DUP(00) 
                                          DD     00000005 
                                          DD     00000003 
                                          DD     00000003 
                                          DD     __lcl.00000071 
     003170            __lcl.00000074     DB     08H    
                                          DB     'PT_Large' 
                                          DB     00H,00H,00H 
     00317C            __lcl.00000073     DB     08H    
                                          DB     'PT_Small' 
                                          DB     00H,00H,00H 
     003188            __lcl.00000072     DB     0DH    
                                          DB     'PT_No_Entries' 
                                          DW     0000   
     003198            __lcl.00000071     DD     __lcl.00000072 
                                          DD     00000000 
                                          DD     __lcl.00000073 
                                          DD     00000001 
                                          DD     __lcl.00000074 
                                          DD     00000002 
     0031B0            __lcl.00000070     DB     03H    
                                          DB     'MON'  
     0031B4            __lcl.00000069     DD     __lcl.00000070 
                                          DD     00000020 
                                          DD     __lcl.00000041 
                                          DD     __lcl.00000054 
     0031C4            __lcl.00000068     DB     04H    
                                          DB     'GetD' 
                                          DB     00H,00H,00H 
     0031CC            __lcl.00000067     DB     07H    
                                          DB     'GetAlfa' 
     0031D4            __lcl.00000066     DB     05H    
                                          DB     'GetMO' 
                                          DW     0000   
     0031DC            __lcl.00000065     DB     04H    
                                          DB     'SetD' 
                                          DB     00H,00H,00H 
     0031E4            __lcl.00000064     DB     07H    
                                          DB     'SetAlfa' 
     0031EC            __lcl.00000063     DB     05H    
                                          DB     'SetMO' 
                                          DW     0000   
     0031F4            __lcl.00000062     DB     04H    
                                          DB     'AhT3' 
                                          DB     00H,00H,00H 
     0031FC            __lcl.00000061     DB     05H    
                                          DB     'A2hT4' 
                                          DW     0000   
     003204            __lcl.00000060     DB     04H    
                                          DB     'AhT2' 
                                          DB     00H,00H,00H 
     00320C            __lcl.00000059     DB     0AH    
                                          DB     'DataSignal' 
                                          DB     00     
     003218            __lcl.00000058     DB     08H    
                                          DB     'SortedT4' 
                                          DB     00H,00H,00H 
     003224            __lcl.00000057     DB     08H    
                                          DB     'SortedT3' 
                                          DB     00H,00H,00H 
     003230            __lcl.00000056     DB     08H    
                                          DB     'SortedT2' 
                                          DB     00H,00H,00H 
     00323C            __lcl.00000055     DB     07H    
                                          DB     'Inputed' 
     003244            __lcl.00000054     DD     0000000E 
                                          DD     __lcl.00000055 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000056 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000057 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000058 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000059 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000060 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000061 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000062 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000063 
                                          DD     00000000 
                                          DD     __lcl.00000050 
                                          DD     __lcl.00000064 
                                          DD     00000000 
                                          DD     __lcl.00000052 
                                          DD     __lcl.00000065 
                                          DD     00000000 
                                          DD     __lcl.00000053 
                                          DD     __lcl.00000066 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000067 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000068 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0032F0            __lcl.00000053     DD     00000001 
                                          DD     __lcl.00000051 
                                          DD     __lcl.00000016 
                                          DB     4 DUP(00) 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     00330C            __lcl.00000052     DD     00000001 
                                          DD     __lcl.00000051 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     00010000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     003328            __lcl.00000051     DB     01H    
                                          DB     'M'    
                                          DW     0000   
     00332C            __lcl.00000050     DD     00000001 
                                          DD     __lcl.00000051 
                                          DD     __lcl.00000018 
                                          DB     4 DUP(00) 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     003348            __lcl.00000049     DB     04H    
                                          DB     'alfa' 
                                          DB     00H,00H,00H 
     003350            __lcl.00000048     DB     01H    
                                          DB     'D'    
                                          DW     0000   
     003354            __lcl.00000047     DB     02H    
                                          DB     'MO'   
                                          DB     00     
     003358            __lcl.00000046     DB     06H    
                                          DB     'SortT4' 
                                          DB     00     
     003360            __lcl.00000045     DB     06H    
                                          DB     'SortT3' 
                                          DB     00     
     003368            __lcl.00000044     DB     06H    
                                          DB     'SortT2' 
                                          DB     00     
     003370            __lcl.00000043     DB     02H    
                                          DB     'F2'   
                                          DB     00     
     003374            __lcl.00000042     DB     02H    
                                          DB     'F1'   
                                          DB     00     
     003378            __lcl.00000041     DD     00000008 
                                          DD     __lcl.00000042 
                                          DD     __lcl.00000005 
                                          DD     0000004C 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000043 
                                          DD     __lcl.00000005 
                                          DD     00000050 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000044 
                                          DD     __lcl.00000005 
                                          DD     00000054 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000045 
                                          DD     __lcl.00000005 
                                          DD     00000058 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000046 
                                          DD     __lcl.00000005 
                                          DD     0000005C 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000047 
                                          DD     __lcl.00000018 
                                          DD     00000068 
                                          DD     00000000 
                                          DD     __lcl.00000037 
                                          DD     00000100 
                                          DD     00000000 
                                          DD     __lcl.00000048 
                                          DD     __lcl.00000016 
                                          DD     00000060 
                                          DD     00000000 
                                          DD     __lcl.00000040 
                                          DD     00000200 
                                          DD     00000000 
                                          DD     __lcl.00000049 
                                          DD     __lcl.00000005 
                                          DD     00000064 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
     00345C            __lcl.00000040     DD     00000001 
                                          DD     __lcl.00000038 
                                          DD     __lcl.00000039 
     003468            __lcl.00000039     DD     00000002 
                                          DD     package1.vec__constrained_array____1 
     003470            __lcl.00000038     DD     00000000 
                                          DD     00000001 
     003478            __lcl.00000037     DD     00000001 
                                          DD     __lcl.00000035 
                                          DD     __lcl.00000036 
     003484            __lcl.00000036     DD     00000002 
                                          DD     package1.matr__constrained_array____1 
     00348C            __lcl.00000035     DD     00000000 
                                          DD     00000001 
     003494            __lcl.00000034     DB     04H    
                                          DB     'Time' 
                                          DB     00H,00H,00H 
     00349C            __lcl.00000033     DD     __lcl.00000034 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000008 
                                          DD     __lcl.00000030 
                                          DD     00000000 
     0034B4            __lcl.00000032     DB     11H    
                                          DB     'seconds_since_day' 
                                          DW     0000   
     0034C8            __lcl.00000031     DB     0CH    
                                          DB     'day_in_epoch' 
                                          DB     00H,00H,00H 
     0034D8            __lcl.00000030     DD     00000002 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000029 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000032 
                                          DD     __lcl.00000024 
                                          DD     00000004 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
     003514            __lcl.00000029     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000003 
                                          DD     __lcl.00000025 
                                          DD     __lcl.00000026 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000028 
     003534            __lcl.00000028     DD     0000000C 
                                          DD     00000004 
                                          DQ     3FF0000000000000 
     003544            __lcl.00000027     DD     00000008 
                                          DD     00000003 
                                          DD     00011C82 
     003550            __lcl.00000026     DD     00000008 
                                          DD     00000003 
                                          DD     FFFEE37E 
     00355C            __lcl.00000025     DB     4 DUP(00) 
                                          DD     00000013 
                                          DD     00000008 
                                          DB     4 DUP(00) 
                                          DQ     3FF0000000000000 
     003574            __lcl.00000024     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000003 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000021 
                                          DD     __lcl.00000022 
                                          DD     __lcl.00000023 
     003594            __lcl.00000023     DD     0000000C 
                                          DD     00000004 
                                          DQ     3F1A36E2EB1C432D 
     0035A4            __lcl.00000022     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     0035B0            __lcl.00000021     DD     00000008 
                                          DD     00000003 
                                          DD     80000000 
     0035BC            __lcl.00000020     DB     4 DUP(00) 
                                          DD     00000013 
                                          DD     00000008 
                                          DB     4 DUP(00) 
                                          DQ     3F10000000000000 
     0035D4            __lcl.00000019     DB     04H    
                                          DB     'Matr' 
                                          DB     00H,00H,00H 
     0035DC            __lcl.00000018     DD     __lcl.00000019 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000010 
                                          DD     __lcl.00000016 
                                          DD     __lcl.00000009 
     0035F4            __lcl.00000017     DB     03H    
                                          DB     'Vec'  
     0035F8            __lcl.00000016     DD     __lcl.00000017 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000015 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000014 
     003610            __lcl.00000015     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     00361C            __lcl.00000014     DD     00000001 
                                          DD     __lcl.00000013 
     003624            __lcl.00000013     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000011 
                                          DD     __lcl.00000012 
     003640            __lcl.00000012     DD     00000008 
                                          DD     00000007 
                                          DD     package1.vec__constrained_array____1 
     00364C            __lcl.00000011     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     003658            __lcl.00000010     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__COMP_SU_SIZE 
     003664            __lcl.00000009     DD     00000001 
                                          DD     __lcl.00000008 
     00366C            __lcl.00000008     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000007 
     003688            __lcl.00000007     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__constrained_array____1 
     003694            __lcl.00000006     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0036A0            __lcl.00000005     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000003 
                                          DD     __lcl.00000004 
     0036BC            __lcl.00000004     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     0036C8            __lcl.00000003     DD     00000008 
                                          DD     00000003 
                                          DD     80000000 
     0036D4            __lcl.00000002     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     0036E0            __lcl.00000001     DD     00000000 
; ********* End of segment, Total Size = 14052


; ************* .av_dbgi segment :
                                          ALIGN 4       
     0036E4            __lcl.00000467     DB     1B     
                                          DB     'D:\AdaCOURSE-CHRNN\lab4.adb' 
; ********* End of segment, Total Size = 14080

                       ;                                
                       CODE               ENDS          

