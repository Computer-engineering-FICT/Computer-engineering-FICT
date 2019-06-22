
                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT Lab4 
;  Record Layout Information:
;     -- lab4.monitor
;     for Monitor use record
;         F1 at 68 range 0 .. 31;
;         F2 at 72 range 0 .. 31;
; --      MC at 80 range 0..<dynamic-sized>; cannot specify place
;         alfa at 76 range 0 .. 31;
;     end record;
; 
;     -- lab4.t1
;     for T1 use record
;     end record;
; 
;     -- lab4.t2
;     for T2 use record
;     end record;
; 
;     -- lab4.t3
;     for T3 use record
;     end record;
; 
;     -- lab4.t4
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
                       ;  Start of procedure lab4.monitor.input   
                       ;                                
                                          PUBLIC lab4.monitor.input 
                       lab4.monitor.input PROC   NEAR   
;  Source Line # 50
   50| 000000 64                          FS:           
   50| 000001 8B15                        MOV    EDX, 4 
   50| 000003 04000000                                  
   50| 000007 8B52                        MOV    EDX, [EDX-4] 
   50| 000009 FC                                        
   50| 00000A 55                          PUSH   EBP    
   50| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 50
   50| 00000D 8B42                        MOV    EAX, [EDX+48] 
   50| 00000F 30                                        
   50| 000010 8078                        CMP    BYTE PTR [EAX-12], 0 ;  Monitor__elab_bool
   50| 000012 F4                                        
   50| 000013 00                                        
   50| 000014 75                          JNE    SHORT L16 
   50| 000015 0A                                        
   50| 000016 68                          PUSH   program_error 
   50| 000017 00000000                                  
   50| 00001B E8                          CALL   rts_raise 
   50| 00001C 00000000                                  
   50|                 L16:                             
;  Source Line # 52
   52| 000020 8B45                        MOV    EAX, [EBP+8] ;  po_access
   52| 000022 08                                        
   52| 000023 8B58                        MOV    EBX, [EAX+68] 
   52| 000025 44                                        
   52| 000026 43                          INC    EBX    
   52| 000027 CE                          INTO          
   52| 000028 8B4D                        MOV    ECX, [EBP+8] ;  po_access
   52| 00002A 08                                        
   52| 00002B 8959                        MOV    [ECX+68], EBX 
   52| 00002D 44                                        
;  Source Line # 53
   53| 00002E 8BE5                        MOV    ESP, EBP 
   53| 000030 5D                          POP    EBP    
   53| 000031 C2                          RET    8      
   53| 000032 0800                                      
                       ;                                
                       lab4.monitor.input ENDP          


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000259     DD     00000501 
                                          DD     00000032 
                                          DD     lab4.monitor.input 
                                          DD     __lcl.00000260 
                                          DD     00000032 
                                          DD     lab4.monitor.input+0000000DH 
                                          DD     __lcl.00000260 
                                          DD     00000034 
                                          DD     lab4.monitor.input+00000020H 
                                          DD     __lcl.00000260 
                                          DD     00000035 
                                          DD     lab4.monitor.input+0000002EH 
                                          DD     __lcl.00000260 
                                          DD     00000035 
                                          DD     lab4.monitor.input+00000030H 
                                          DD     __lcl.00000260 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure lab4.monitor.endñount   
                       ;                                
                                          PUBLIC lab4.monitor.endñount 
                       lab4.monitor.endñount PROC NEAR  
;  Source Line # 55
   55| 000000 64                          FS:           
   55| 000001 8B15                        MOV    EDX, 4 
   55| 000003 04000000                                  
   55| 000007 8B52                        MOV    EDX, [EDX-4] 
   55| 000009 FC                                        
   55| 00000A 55                          PUSH   EBP    
   55| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 55
   55| 00000D 8B42                        MOV    EAX, [EDX+48] 
   55| 00000F 30                                        
   55| 000010 8078                        CMP    BYTE PTR [EAX-12], 0 ;  Monitor__elab_bool
   55| 000012 F4                                        
   55| 000013 00                                        
   55| 000014 75                          JNE    SHORT L16 
   55| 000015 0A                                        
   55| 000016 68                          PUSH   program_error 
   55| 000017 00000000                                  
   55| 00001B E8                          CALL   rts_raise 
   55| 00001C 00000000                                  
   55|                 L16:                             
;  Source Line # 57
   57| 000020 8B45                        MOV    EAX, [EBP+8] ;  po_access
   57| 000022 08                                        
   57| 000023 8B58                        MOV    EBX, [EAX+72] 
   57| 000025 48                                        
   57| 000026 43                          INC    EBX    
   57| 000027 CE                          INTO          
   57| 000028 8B4D                        MOV    ECX, [EBP+8] ;  po_access
   57| 00002A 08                                        
   57| 00002B 8959                        MOV    [ECX+72], EBX 
   57| 00002D 48                                        
;  Source Line # 58
   58| 00002E 8BE5                        MOV    ESP, EBP 
   58| 000030 5D                          POP    EBP    
   58| 000031 C2                          RET    8      
   58| 000032 0800                                      
                       ;                                
                       lab4.monitor.endñount ENDP       

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000258     DD     00000501 
                                          DD     00000037 
                                          DD     lab4.monitor.endñount 
                                          DD     __lcl.00000260 
                                          DD     00000037 
                                          DD     lab4.monitor.endñount+0000000DH 
                                          DD     __lcl.00000260 
                                          DD     00000039 
                                          DD     lab4.monitor.endñount+00000020H 
                                          DD     __lcl.00000260 
                                          DD     0000003A 
                                          DD     lab4.monitor.endñount+0000002EH 
                                          DD     __lcl.00000260 
                                          DD     0000003A 
                                          DD     lab4.monitor.endñount+00000030H 
                                          DD     __lcl.00000260 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure lab4.monitor.setmc   
                       ;                                
                                          PUBLIC lab4.monitor.setmc 
                       lab4.monitor.setmc PROC   NEAR   
;  Source Line # 60
   60| 000000 64                          FS:           
   60| 000001 8B15                        MOV    EDX, 4 
   60| 000003 04000000                                  
   60| 000007 8B52                        MOV    EDX, [EDX-4] 
   60| 000009 FC                                        
   60| 00000A 55                          PUSH   EBP    
   60| 00000B 8BEC                        MOV    EBP, ESP 
   60| 00000D 83EC                        SUB    ESP, 16 
   60| 00000F 10                                        
;  Source Line # 60
   60| 000010 8B42                        MOV    EAX, [EDX+48] 
   60| 000012 30                                        
   60| 000013 8078                        CMP    BYTE PTR [EAX-12], 0 ;  Monitor__elab_bool
   60| 000015 F4                                        
   60| 000016 00                                        
   60| 000017 75                          JNE    SHORT L16 
   60| 000018 0A                                        
   60| 000019 68                          PUSH   program_error 
   60| 00001A 00000000                                  
   60| 00001E E8                          CALL   rts_raise 
   60| 00001F 00000000                                  
   60|                 L16:                             
   60| 000023 8B05                        MOV    EAX, package1.n 
   60| 000025 00000000                                  
   60| 000029 8945                        MOV    [EBP-16], EAX 
   60| 00002B F0                                        
;  Source Line # 62
   62| 00002C 837D                        CMP    DWORD PTR [EBP-16], 0 
   62| 00002E F0                                        
   62| 00002F 00                                        
   62| 000030 0F8E                        JLE    L15    
   62| 000032 B2000000                                  
   62| 000036 C745                        MOV    DWORD PTR [EBP-12], 1 
   62| 000038 F4                                        
   62| 000039 01000000                                  
   62|                 L20:                             
   62| 00003D 8B05                        MOV    EAX, package1.n 
   62| 00003F 00000000                                  
   62| 000043 8945                        MOV    [EBP-8], EAX 
   62| 000045 F8                                        
;  Source Line # 63
   63| 000046 837D                        CMP    DWORD PTR [EBP-8], 0 
   63| 000048 F8                                        
   63| 000049 00                                        
   63| 00004A 0F8E                        JLE    L21    
   63| 00004C 84000000                                  
   63| 000050 C745                        MOV    DWORD PTR [EBP-4], 1 
   63| 000052 FC                                        
   63| 000053 01000000                                  
   63|                 L23:                             
;  Source Line # 64
   64| 000057 8B45                        MOV    EAX, [EBP+12] ;  params
   64| 000059 0C                                        
   64| 00005A 8B18                        MOV    EBX, [EAX+0] 
   64| 00005C 8B4D                        MOV    ECX, [EBP-12] 
   64| 00005E F4                                        
   64| 00005F 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
   64| 000061 00000000                                  
   64|                 L28:                             
   64| 000065 0F8F                        JG     L29    
   64| 000067 83000000                                  
   64| 00006B 8D49                        LEA    ECX, [ECX-1] 
   64| 00006D FF                                        
   64| 00006E 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
   64| 000071 00000000                                  
   64| 000075 8B55                        MOV    EDX, [EBP-4] 
   64| 000077 FC                                        
   64| 000078 3B15                        CMP    EDX, package1.vec__constrained_array____1 
   64| 00007A 00000000                                  
   64|                 L30:                             
   64| 00007E 0F8F                        JG     L31    
   64| 000080 76000000                                  
   64| 000084 8D1495                      LEA    EDX, [4*EDX-4] 
   64| 000087 FCFFFFFF                                  
   64| 00008B 03CA                        ADD    ECX, EDX 
   64| 00008D 8B75                        MOV    ESI, [EBP+8] ;  po_access
   64| 00008F 08                                        
   64| 000090 8B7D                        MOV    EDI, [EBP-12] 
   64| 000092 F4                                        
   64| 000093 3B3D                        CMP    EDI, package1.matr__constrained_array____1 
   64| 000095 00000000                                  
   64|                 L32:                             
   64| 000099 7F                          JG     SHORT L33 
   64| 00009A 6B                                        
   64| 00009B 8D7F                        LEA    EDI, [EDI-1] 
   64| 00009D FF                                        
   64| 00009E 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
   64| 0000A1 00000000                                  
   64| 0000A5 8B45                        MOV    EAX, [EBP-4] 
   64| 0000A7 FC                                        
   64| 0000A8 3B05                        CMP    EAX, package1.vec__constrained_array____1 
   64| 0000AA 00000000                                  
   64|                 L34:                             
   64| 0000AE 7F                          JG     SHORT L35 
   64| 0000AF 62                                        
   64| 0000B0 8D0485                      LEA    EAX, [4*EAX-4] 
   64| 0000B3 FCFFFFFF                                  
   64| 0000B7 03F8                        ADD    EDI, EAX 
   64| 0000B9 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
   64| 0000BC 895C3E                      MOV    [ESI+EDI+80], EBX 
   64| 0000BF 50                                        
;  Source Line # 65
   65| 0000C0 8B55                        MOV    EDX, [EBP-8] 
   65| 0000C2 F8                                        
   65| 0000C3 3955                        CMP    [EBP-4], EDX 
   65| 0000C5 FC                                        
   65| 0000C6 74                          JE     SHORT L21 
   65| 0000C7 0C                                        
   65| 0000C8 8B45                        MOV    EAX, [EBP-4] 
   65| 0000CA FC                                        
   65| 0000CB 40                          INC    EAX    
   65| 0000CC 8945                        MOV    [EBP-4], EAX 
   65| 0000CE FC                                        
   65| 0000CF E9                          JMP    L23    
   65| 0000D0 83FFFFFF                                  
   65|                 L21:                             
;  Source Line # 66
   66| 0000D4 8B45                        MOV    EAX, [EBP-16] 
   66| 0000D6 F0                                        
   66| 0000D7 3945                        CMP    [EBP-12], EAX 
   66| 0000D9 F4                                        
   66| 0000DA 74                          JE     SHORT L15 
   66| 0000DB 0C                                        
   66| 0000DC 8B45                        MOV    EAX, [EBP-12] 
   66| 0000DE F4                                        
   66| 0000DF 40                          INC    EAX    
   66| 0000E0 8945                        MOV    [EBP-12], EAX 
   66| 0000E2 F4                                        
   66| 0000E3 E9                          JMP    L20    
   66| 0000E4 55FFFFFF                                  
   66|                 L15:                             
;  Source Line # 67
   67| 0000E8 8BE5                        MOV    ESP, EBP 
   67| 0000EA 5D                          POP    EBP    
   67| 0000EB C2                          RET    8      
   67| 0000EC 0800                                      
   67|                 L29:                             
   67| 0000EE 8D05                        LEA    EAX, L28+5 
   67| 0000F0 6A000000                                  
   67| 0000F4 50                          PUSH   EAX    
   67| 0000F5 E9                          JMP    rts_raise_constraint_error 
   67| 0000F6 00000000                                  
   67|                 L31:                             
   67| 0000FA 8D05                        LEA    EAX, L30+5 
   67| 0000FC 83000000                                  
   67| 000100 50                          PUSH   EAX    
   67| 000101 E9                          JMP    rts_raise_constraint_error 
   67| 000102 00000000                                  
   67|                 L33:                             
   67| 000106 8D05                        LEA    EAX, L32+5 
   67| 000108 9E000000                                  
   67| 00010C 50                          PUSH   EAX    
   67| 00010D E9                          JMP    rts_raise_constraint_error 
   67| 00010E 00000000                                  
   67|                 L35:                             
   67| 000112 8D05                        LEA    EAX, L34+5 
   67| 000114 B3000000                                  
   67| 000118 50                          PUSH   EAX    
   67| 000119 E9                          JMP    rts_raise_constraint_error 
   67| 00011A 00000000                                  
                       ;                                
                       lab4.monitor.setmc ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000257     DD     00000901 
                                          DD     0000003C 
                                          DD     lab4.monitor.setmc 
                                          DD     __lcl.00000260 
                                          DD     0000003C 
                                          DD     lab4.monitor.setmc+00000010H 
                                          DD     __lcl.00000260 
                                          DD     0000003E 
                                          DD     lab4.monitor.setmc+0000002CH 
                                          DD     __lcl.00000260 
                                          DD     0000003F 
                                          DD     lab4.monitor.setmc+00000046H 
                                          DD     __lcl.00000260 
                                          DD     00000040 
                                          DD     lab4.monitor.setmc+00000057H 
                                          DD     __lcl.00000260 
                                          DD     00000041 
                                          DD     lab4.monitor.setmc+000000C0H 
                                          DD     __lcl.00000260 
                                          DD     00000042 
                                          DD     lab4.monitor.setmc+000000D4H 
                                          DD     __lcl.00000260 
                                          DD     00000043 
                                          DD     lab4.monitor.setmc+000000E8H 
                                          DD     __lcl.00000260 
                                          DD     00000043 
                                          DD     lab4.monitor.setmc+0000011AH 
                                          DD     __lcl.00000260 
; ********* End of segment, Total Size = 112

                       ;                                
                       ;  Start of procedure lab4.monitor.getmc   
                       ;                                
                                          PUBLIC lab4.monitor.getmc 
                       lab4.monitor.getmc PROC   NEAR   
;  Source Line # 68
   68| 000000 64                          FS:           
   68| 000001 8B15                        MOV    EDX, 4 
   68| 000003 04000000                                  
   68| 000007 8B52                        MOV    EDX, [EDX-4] 
   68| 000009 FC                                        
   68| 00000A 55                          PUSH   EBP    
   68| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 68
   68| 00000D 8B42                        MOV    EAX, [EDX+48] 
   68| 00000F 30                                        
   68| 000010 8078                        CMP    BYTE PTR [EAX-12], 0 ;  Monitor__elab_bool
   68| 000012 F4                                        
   68| 000013 00                                        
   68| 000014 75                          JNE    SHORT L16 
   68| 000015 0A                                        
   68| 000016 68                          PUSH   program_error 
   68| 000017 00000000                                  
   68| 00001B E8                          CALL   rts_raise 
   68| 00001C 00000000                                  
   68|                 L16:                             
;  Source Line # 70
   70| 000020 8B05                        MOV    EAX, package1.matr__constrained_array____1 
   70| 000022 00000000                                  
   70| 000026 2D                          SUB    EAX, 1 
   70| 000027 01000000                                  
   70| 00002B 7D                          JGE    SHORT L18 
   70| 00002C 03                                        
   70| 00002D 33C0                        XOR    EAX, EAX 
   70| 00002F 48                          DEC    EAX    
   70|                 L18:                             
   70| 000030 CE                          INTO          
   70| 000031 40                          INC    EAX    
   70| 000032 CE                          INTO          
   70| 000033 0FAF05                      IMUL   EAX, package1.matr__COMP_SU_SIZE 
   70| 000036 00000000                                  
   70| 00003A CE                          INTO          
   70| 00003B 8B5D                        MOV    EBX, [EBP+8] ;  po_access
   70| 00003D 08                                        
   70| 00003E 8B4D                        MOV    ECX, [EBP+12] ;  params
   70| 000040 0C                                        
   70| 000041 8B11                        MOV    EDX, [ECX+0] 
   70| 000043 50                          PUSH   EAX    
   70| 000044 8D5B                        LEA    EBX, [EBX+80] 
   70| 000046 50                                        
   70| 000047 53                          PUSH   EBX    
   70| 000048 52                          PUSH   EDX    
   70| 000049 E8                          CALL   _rts_block_move 
   70| 00004A 00000000                                  
   70| 00004E 8BE5                        MOV    ESP, EBP 
   70| 000050 5D                          POP    EBP    
   70| 000051 C2                          RET    8      
   70| 000052 0800                                      
                       ;                                
                       lab4.monitor.getmc ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000256     DD     00000401 
                                          DD     00000044 
                                          DD     lab4.monitor.getmc 
                                          DD     __lcl.00000260 
                                          DD     00000044 
                                          DD     lab4.monitor.getmc+0000000DH 
                                          DD     __lcl.00000260 
                                          DD     00000046 
                                          DD     lab4.monitor.getmc+00000020H 
                                          DD     __lcl.00000260 
                                          DD     00000046 
                                          DD     lab4.monitor.getmc+00000050H 
                                          DD     __lcl.00000260 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.monitor.setalfa   
                       ;                                
                                          PUBLIC lab4.monitor.setalfa 
                       lab4.monitor.setalfa PROC NEAR   
;  Source Line # 73
   73| 000000 64                          FS:           
   73| 000001 8B15                        MOV    EDX, 4 
   73| 000003 04000000                                  
   73| 000007 8B52                        MOV    EDX, [EDX-4] 
   73| 000009 FC                                        
   73| 00000A 55                          PUSH   EBP    
   73| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 73
   73| 00000D 8B42                        MOV    EAX, [EDX+48] 
   73| 00000F 30                                        
   73| 000010 8078                        CMP    BYTE PTR [EAX-12], 0 ;  Monitor__elab_bool
   73| 000012 F4                                        
   73| 000013 00                                        
   73| 000014 75                          JNE    SHORT L16 
   73| 000015 0A                                        
   73| 000016 68                          PUSH   program_error 
   73| 000017 00000000                                  
   73| 00001B E8                          CALL   rts_raise 
   73| 00001C 00000000                                  
   73|                 L16:                             
;  Source Line # 75
   75| 000020 8B45                        MOV    EAX, [EBP+12] ;  params
   75| 000022 0C                                        
   75| 000023 8B5D                        MOV    EBX, [EBP+8] ;  po_access
   75| 000025 08                                        
   75| 000026 8B08                        MOV    ECX, [EAX+0] 
   75| 000028 894B                        MOV    [EBX+76], ECX 
   75| 00002A 4C                                        
;  Source Line # 76
   76| 00002B 8BE5                        MOV    ESP, EBP 
   76| 00002D 5D                          POP    EBP    
   76| 00002E C2                          RET    8      
   76| 00002F 0800                                      
                       ;                                
                       lab4.monitor.setalfa ENDP        

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000255     DD     00000501 
                                          DD     00000049 
                                          DD     lab4.monitor.setalfa 
                                          DD     __lcl.00000260 
                                          DD     00000049 
                                          DD     lab4.monitor.setalfa+0000000DH 
                                          DD     __lcl.00000260 
                                          DD     0000004B 
                                          DD     lab4.monitor.setalfa+00000020H 
                                          DD     __lcl.00000260 
                                          DD     0000004C 
                                          DD     lab4.monitor.setalfa+0000002BH 
                                          DD     __lcl.00000260 
                                          DD     0000004C 
                                          DD     lab4.monitor.setalfa+0000002DH 
                                          DD     __lcl.00000260 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure lab4.monitor.getalfa   
                       ;                                
                                          PUBLIC lab4.monitor.getalfa 
                       lab4.monitor.getalfa PROC NEAR   
;  Source Line # 77
   77| 000000 64                          FS:           
   77| 000001 8B15                        MOV    EDX, 4 
   77| 000003 04000000                                  
   77| 000007 8B52                        MOV    EDX, [EDX-4] 
   77| 000009 FC                                        
   77| 00000A 55                          PUSH   EBP    
   77| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 77
   77| 00000D 8B42                        MOV    EAX, [EDX+48] 
   77| 00000F 30                                        
   77| 000010 8078                        CMP    BYTE PTR [EAX-12], 0 ;  Monitor__elab_bool
   77| 000012 F4                                        
   77| 000013 00                                        
   77| 000014 75                          JNE    SHORT L16 
   77| 000015 0A                                        
   77| 000016 68                          PUSH   program_error 
   77| 000017 00000000                                  
   77| 00001B E8                          CALL   rts_raise 
   77| 00001C 00000000                                  
   77|                 L16:                             
;  Source Line # 79
   79| 000020 8B45                        MOV    EAX, [EBP+8] ;  po_access
   79| 000022 08                                        
   79| 000023 8B5D                        MOV    EBX, [EBP+12] ;  params
   79| 000025 0C                                        
   79| 000026 8B0B                        MOV    ECX, [EBX+0] 
   79| 000028 8B50                        MOV    EDX, [EAX+76] 
   79| 00002A 4C                                        
   79| 00002B 8911                        MOV    [ECX+0], EDX 
   79| 00002D 8BE5                        MOV    ESP, EBP 
   79| 00002F 5D                          POP    EBP    
   79| 000030 C2                          RET    8      
   79| 000031 0800                                      
                       ;                                
                       lab4.monitor.getalfa ENDP        

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000254     DD     00000401 
                                          DD     0000004D 
                                          DD     lab4.monitor.getalfa 
                                          DD     __lcl.00000260 
                                          DD     0000004D 
                                          DD     lab4.monitor.getalfa+0000000DH 
                                          DD     __lcl.00000260 
                                          DD     0000004F 
                                          DD     lab4.monitor.getalfa+00000020H 
                                          DD     __lcl.00000260 
                                          DD     0000004F 
                                          DD     lab4.monitor.getalfa+0000002FH 
                                          DD     __lcl.00000260 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.monitor.inputsynchro   
                       ;                                
                                          PUBLIC lab4.monitor.inputsynchro 
                       lab4.monitor.inputsynchro PROC NEAR 
;  Source Line # 82
   82| 000000 64                          FS:           
   82| 000001 8B15                        MOV    EDX, 4 
   82| 000003 04000000                                  
   82| 000007 8B52                        MOV    EDX, [EDX-4] 
   82| 000009 FC                                        
   82| 00000A 55                          PUSH   EBP    
   82| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 82
   82| 00000D 8B42                        MOV    EAX, [EDX+48] 
   82| 00000F 30                                        
   82| 000010 8078                        CMP    BYTE PTR [EAX-12], 0 ;  Monitor__elab_bool
   82| 000012 F4                                        
   82| 000013 00                                        
   82| 000014 75                          JNE    SHORT L15 
   82| 000015 0A                                        
   82| 000016 68                          PUSH   program_error 
   82| 000017 00000000                                  
   82| 00001B E8                          CALL   rts_raise 
   82| 00001C 00000000                                  
;  Source Line # 85
   85|                 L15:                             
   85| 000020 8BE5                        MOV    ESP, EBP 
   85| 000022 5D                          POP    EBP    
   85| 000023 C2                          RET    16     
   85| 000024 1000                                      
                       ;                                
                       lab4.monitor.inputsynchro ENDP   

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000253     DD     00000401 
                                          DD     00000052 
                                          DD     lab4.monitor.inputsynchro 
                                          DD     __lcl.00000260 
                                          DD     00000052 
                                          DD     lab4.monitor.inputsynchro+0000000DH 
                                          DD     __lcl.00000260 
                                          DD     00000055 
                                          DD     lab4.monitor.inputsynchro+00000020H 
                                          DD     __lcl.00000260 
                                          DD     00000055 
                                          DD     lab4.monitor.inputsynchro+00000022H 
                                          DD     __lcl.00000260 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.monitor.outputsynchro   
                       ;                                
                                          PUBLIC lab4.monitor.outputsynchro 
                       lab4.monitor.outputsynchro PROC NEAR 
;  Source Line # 87
   87| 000000 64                          FS:           
   87| 000001 8B15                        MOV    EDX, 4 
   87| 000003 04000000                                  
   87| 000007 8B52                        MOV    EDX, [EDX-4] 
   87| 000009 FC                                        
   87| 00000A 55                          PUSH   EBP    
   87| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 87
   87| 00000D 8B42                        MOV    EAX, [EDX+48] 
   87| 00000F 30                                        
   87| 000010 8078                        CMP    BYTE PTR [EAX-12], 0 ;  Monitor__elab_bool
   87| 000012 F4                                        
   87| 000013 00                                        
   87| 000014 75                          JNE    SHORT L15 
   87| 000015 0A                                        
   87| 000016 68                          PUSH   program_error 
   87| 000017 00000000                                  
   87| 00001B E8                          CALL   rts_raise 
   87| 00001C 00000000                                  
;  Source Line # 90
   90|                 L15:                             
   90| 000020 8BE5                        MOV    ESP, EBP 
   90| 000022 5D                          POP    EBP    
   90| 000023 C2                          RET    16     
   90| 000024 1000                                      
                       ;                                
                       lab4.monitor.outputsynchro ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000252     DD     00000401 
                                          DD     00000057 
                                          DD     lab4.monitor.outputsynchro 
                                          DD     __lcl.00000260 
                                          DD     00000057 
                                          DD     lab4.monitor.outputsynchro+0000000DH 
                                          DD     __lcl.00000260 
                                          DD     0000005A 
                                          DD     lab4.monitor.outputsynchro+00000020H 
                                          DD     __lcl.00000260 
                                          DD     0000005A 
                                          DD     lab4.monitor.outputsynchro+00000022H 
                                          DD     __lcl.00000260 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.monitor__all_barriers   
                       ;                                
                                          PUBLIC lab4.monitor__all_barriers 
                       lab4.monitor__all_barriers PROC NEAR 
;  Source Line # 90
   90| 000000 55                          PUSH   EBP    
   90| 000001 8BEC                        MOV    EBP, ESP 
   90| 000003 83EC                        SUB    ESP, 4 
   90| 000005 04                                        
   90| 000006 C745                        MOV    DWORD PTR [EBP-4], 0 
   90| 000008 FC                                        
   90| 000009 00000000                                  
   90| 00000D 8B45                        MOV    EAX, [EBP+8] ;  po_access
   90| 00000F 08                                        
   90| 000010 8378                        CMP    DWORD PTR [EAX+68], 3 
   90| 000012 44                                        
   90| 000013 03                                        
   90| 000014 75                          JNE    SHORT L16 
   90| 000015 0B                                        
   90| 000016 8B45                        MOV    EAX, [EBP-4] 
   90| 000018 FC                                        
   90| 000019 0D                          OR     EAX, 1 
   90| 00001A 01000000                                  
   90| 00001E 8945                        MOV    [EBP-4], EAX 
   90| 000020 FC                                        
   90|                 L16:                             
   90| 000021 8B45                        MOV    EAX, [EBP+8] ;  po_access
   90| 000023 08                                        
   90| 000024 8B1D                        MOV    EBX, package1.p 
   90| 000026 00000000                                  
   90| 00002A 4B                          DEC    EBX    
   90| 00002B CE                          INTO          
   90| 00002C 3958                        CMP    [EAX+72], EBX 
   90| 00002E 48                                        
   90| 00002F 75                          JNE    SHORT L18 
   90| 000030 0B                                        
   90| 000031 8B45                        MOV    EAX, [EBP-4] 
   90| 000033 FC                                        
   90| 000034 0D                          OR     EAX, 2 
   90| 000035 02000000                                  
   90| 000039 8945                        MOV    [EBP-4], EAX 
   90| 00003B FC                                        
   90|                 L18:                             
   90| 00003C 8B45                        MOV    EAX, [EBP-4] 
   90| 00003E FC                                        
   90| 00003F 8BE5                        MOV    ESP, EBP 
   90| 000041 5D                          POP    EBP    
   90| 000042 C2                          RET    4      
   90| 000043 0400                                      
                       ;                                
                       lab4.monitor__all_barriers ENDP  
                       ;                                
                       ;  Start of procedure lab4.t1__body   
                       ;                                
                                          PUBLIC lab4.t1__body 
                       lab4.t1__body      PROC   NEAR   
;  Source Line # 102
  102| 000000 64                          FS:           
  102| 000001 8B15                        MOV    EDX, 4 
  102| 000003 04000000                                  
  102| 000007 8B52                        MOV    EDX, [EDX-4] 
  102| 000009 FC                                        
  102| 00000A 55                          PUSH   EBP    
  102| 00000B 8BEC                        MOV    EBP, ESP 
  102| 00000D 83EC                        SUB    ESP, 60 
  102| 00000F 3C                                        
;  Source Line # 104
  104| 000010 8B02                        MOV    EAX, [EDX+0] 
  104| 000012 8945                        MOV    [EBP-48], EAX ;  dyn_temp
  104| 000014 D0                                        
  104| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  104| 000017 00000000                                  
  104| 00001B 83EB                        SUB    EBX, 1 
  104| 00001D 01                                        
  104| 00001E 7D                          JGE    SHORT L31 
  104| 00001F 03                                        
  104| 000020 33DB                        XOR    EBX, EBX 
  104| 000022 4B                          DEC    EBX    
  104|                 L31:                             
  104| 000023 CE                          INTO          
  104| 000024 43                          INC    EBX    
  104| 000025 CE                          INTO          
  104| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  104| 000029 00000000                                  
  104| 00002D CE                          INTO          
  104| 00002E 53                          PUSH   EBX    
  104| 00002F 8955                        MOV    [EBP-60], EDX ; Spill
  104| 000031 C4                                        
  104| 000032 E8                          CALL   rts_ss_allocate 
  104| 000033 00000000                                  
  104| 000037 8945                        MOV    [EBP-44], EAX ;  MC1
  104| 000039 D4                                        
;  Source Line # 106
  106| 00003A E8                          CALL   rts_activation_succeeded 
  106| 00003B 00000000                                  
;  Source Line # 107
  107| 00003F 68                          PUSH   __lcl.00000133 
  107| 000040 00000000                                  
  107| 000044 68                          PUSH   __lcl.00000132 
  107| 000045 00000000                                  
  107| 000049 E8                          CALL   ada.text_io.put_line__2 
  107| 00004A 00000000                                  
;  Source Line # 109
  109| 00004E 8B55                        MOV    EDX, [EBP-60] ; Spill
  109| 000050 C4                                        
  109| 000051 8B4A                        MOV    ECX, [EDX+48] 
  109| 000053 30                                        
  109| 000054 8BB1                        MOV    ESI, [ECX-252] ;  MZ
  109| 000056 04FFFFFF                                  
  109| 00005A 56                          PUSH   ESI    
  109| 00005B E8                          CALL   package1.matr_input 
  109| 00005C 00000000                                  
;  Source Line # 111
  111| 000060 68                          PUSH   lab4.monitor.input 
  111| 000061 00000000                                  
  111| 000065 6A                          PUSH   0      
  111| 000066 00                                        
  111| 000067 8B55                        MOV    EDX, [EBP-60] ; Spill
  111| 000069 C4                                        
  111| 00006A 8B7A                        MOV    EDI, [EDX+48] 
  111| 00006C 30                                        
  111| 00006D 8B9F                        MOV    EBX, [EDI-184] ;  Monitor
  111| 00006F 48FFFFFF                                  
  111| 000073 53                          PUSH   EBX    
  111| 000074 E8                          CALL   rts_protected_procedure_call 
  111| 000075 00000000                                  
;  Source Line # 113
  113| 000079 6A                          PUSH   0      
  113| 00007A 00                                        
  113| 00007B 6A                          PUSH   0      
  113| 00007C 00                                        
  113| 00007D 6A                          PUSH   0      
  113| 00007E 00                                        
  113| 00007F 8B55                        MOV    EDX, [EBP-60] ; Spill
  113| 000081 C4                                        
  113| 000082 8B42                        MOV    EAX, [EDX+48] 
  113| 000084 30                                        
  113| 000085 8B88                        MOV    ECX, [EAX-184] ;  Monitor
  113| 000087 48FFFFFF                                  
  113| 00008B 51                          PUSH   ECX    
  113| 00008C E8                          CALL   rts_protected_entry_call 
  113| 00008D 00000000                                  
;  Source Line # 115
  115| 000091 8D75                        LEA    ESI, [EBP-36] 
  115| 000093 DC                                        
  115| 000094 8975                        MOV    [EBP-32], ESI 
  115| 000096 E0                                        
  115| 000097 68                          PUSH   lab4.monitor.getalfa 
  115| 000098 00000000                                  
  115| 00009C 8D7D                        LEA    EDI, [EBP-32] 
  115| 00009E E0                                        
  115| 00009F 57                          PUSH   EDI    
  115| 0000A0 8B55                        MOV    EDX, [EBP-60] ; Spill
  115| 0000A2 C4                                        
  115| 0000A3 8B5A                        MOV    EBX, [EDX+48] 
  115| 0000A5 30                                        
  115| 0000A6 8B83                        MOV    EAX, [EBX-184] ;  Monitor
  115| 0000A8 48FFFFFF                                  
  115| 0000AC 50                          PUSH   EAX    
  115| 0000AD E8                          CALL   rts_entryless_protected_subp_call 
  115| 0000AE 00000000                                  
  115| 0000B2 8B4D                        MOV    ECX, [EBP-36] 
  115| 0000B4 DC                                        
  115| 0000B5 894D                        MOV    [EBP-40], ECX ;  alfa1
  115| 0000B7 D8                                        
;  Source Line # 116
  116| 0000B8 8B75                        MOV    ESI, [EBP-44] ;  MC1
  116| 0000BA D4                                        
  116| 0000BB 8975                        MOV    [EBP-28], ESI 
  116| 0000BD E4                                        
  116| 0000BE 68                          PUSH   lab4.monitor.getmc 
  116| 0000BF 00000000                                  
  116| 0000C3 8D7D                        LEA    EDI, [EBP-28] 
  116| 0000C5 E4                                        
  116| 0000C6 57                          PUSH   EDI    
  116| 0000C7 8B55                        MOV    EDX, [EBP-60] ; Spill
  116| 0000C9 C4                                        
  116| 0000CA 8B5A                        MOV    EBX, [EDX+48] 
  116| 0000CC 30                                        
  116| 0000CD 8B83                        MOV    EAX, [EBX-184] ;  Monitor
  116| 0000CF 48FFFFFF                                  
  116| 0000D3 50                          PUSH   EAX    
  116| 0000D4 E8                          CALL   rts_entryless_protected_subp_call 
  116| 0000D5 00000000                                  
  116| 0000D9 8B0D                        MOV    ECX, package1.n 
  116| 0000DB 00000000                                  
  116| 0000DF 894D                        MOV    [EBP-24], ECX 
  116| 0000E1 E8                                        
;  Source Line # 118
  118| 0000E2 837D                        CMP    DWORD PTR [EBP-24], 0 
  118| 0000E4 E8                                        
  118| 0000E5 00                                        
  118| 0000E6 0F8E                        JLE    L16    
  118| 0000E8 84010000                                  
  118| 0000EC C745                        MOV    DWORD PTR [EBP-20], 1 
  118| 0000EE EC                                        
  118| 0000EF 01000000                                  
  118|                 L18:                             
  118| 0000F3 8B05                        MOV    EAX, package1.h 
  118| 0000F5 00000000                                  
  118| 0000F9 8945                        MOV    [EBP-16], EAX 
  118| 0000FB F0                                        
;  Source Line # 119
  119| 0000FC 837D                        CMP    DWORD PTR [EBP-16], 0 
  119| 0000FE F0                                        
  119| 0000FF 00                                        
  119| 000100 0F8E                        JLE    L19    
  119| 000102 56010000                                  
  119| 000106 C745                        MOV    DWORD PTR [EBP-12], 1 
  119| 000108 F4                                        
  119| 000109 01000000                                  
  119|                 L21:                             
;  Source Line # 120
  120| 00010D C745                        MOV    DWORD PTR [EBP-52], 0 ;  Sum1
  120| 00010F CC                                        
  120| 000110 00000000                                  
  120| 000114 8B05                        MOV    EAX, package1.n 
  120| 000116 00000000                                  
  120| 00011A 8945                        MOV    [EBP-8], EAX 
  120| 00011C F8                                        
;  Source Line # 121
  121| 00011D 837D                        CMP    DWORD PTR [EBP-8], 0 
  121| 00011F F8                                        
  121| 000120 00                                        
  121| 000121 0F8E                        JLE    L22    
  121| 000123 9B000000                                  
  121| 000127 C745                        MOV    DWORD PTR [EBP-4], 1 
  121| 000129 FC                                        
  121| 00012A 01000000                                  
  121|                 L24:                             
;  Source Line # 122
  122| 00012E 8B55                        MOV    EDX, [EBP-60] ; Spill
  122| 000130 C4                                        
  122| 000131 8B42                        MOV    EAX, [EDX+48] 
  122| 000133 30                                        
  122| 000134 8B98                        MOV    EBX, [EAX-252] ;  MZ
  122| 000136 04FFFFFF                                  
  122| 00013A 8B4D                        MOV    ECX, [EBP-4] 
  122| 00013C FC                                        
  122| 00013D 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  122| 00013F 00000000                                  
  122|                 L32:                             
  122| 000143 0F8F                        JG     L33    
  122| 000145 5E010000                                  
  122| 000149 8D49                        LEA    ECX, [ECX-1] 
  122| 00014B FF                                        
  122| 00014C 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  122| 00014F 00000000                                  
  122| 000153 8B75                        MOV    ESI, [EBP-12] 
  122| 000155 F4                                        
  122| 000156 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  122| 000158 00000000                                  
  122|                 L34:                             
  122| 00015C 0F8F                        JG     L35    
  122| 00015E 51010000                                  
  122| 000162 8D34B5                      LEA    ESI, [4*ESI-4] 
  122| 000165 FCFFFFFF                                  
  122| 000169 03CE                        ADD    ECX, ESI 
  122| 00016B 8B7D                        MOV    EDI, [EBP-44] ;  MC1
  122| 00016D D4                                        
  122| 00016E 8B55                        MOV    EDX, [EBP-20] 
  122| 000170 EC                                        
  122| 000171 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  122| 000173 00000000                                  
  122|                 L36:                             
  122| 000177 0F8F                        JG     L37    
  122| 000179 42010000                                  
  122| 00017D 8D52                        LEA    EDX, [EDX-1] 
  122| 00017F FF                                        
  122| 000180 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  122| 000183 00000000                                  
  122| 000187 8B45                        MOV    EAX, [EBP-4] 
  122| 000189 FC                                        
  122| 00018A 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  122| 00018C 00000000                                  
  122|                 L38:                             
  122| 000190 0F8F                        JG     L39    
  122| 000192 35010000                                  
  122| 000196 8D0485                      LEA    EAX, [4*EAX-4] 
  122| 000199 FCFFFFFF                                  
  122| 00019D 03D0                        ADD    EDX, EAX 
  122| 00019F 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  122| 0001A2 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  122| 0001A6 CE                          INTO          
  122| 0001A7 035D                        ADD    EBX, [EBP-52] ;  Sum1
  122| 0001A9 CC                                        
  122| 0001AA CE                          INTO          
  122| 0001AB 895D                        MOV    [EBP-52], EBX ;  Sum1
  122| 0001AD CC                                        
;  Source Line # 123
  123| 0001AE 8B75                        MOV    ESI, [EBP-8] 
  123| 0001B0 F8                                        
  123| 0001B1 3975                        CMP    [EBP-4], ESI 
  123| 0001B3 FC                                        
  123| 0001B4 74                          JE     SHORT L22 
  123| 0001B5 0C                                        
  123| 0001B6 8B45                        MOV    EAX, [EBP-4] 
  123| 0001B8 FC                                        
  123| 0001B9 40                          INC    EAX    
  123| 0001BA 8945                        MOV    [EBP-4], EAX 
  123| 0001BC FC                                        
  123| 0001BD E9                          JMP    L24    
  123| 0001BE 6CFFFFFF                                  
  123|                 L22:                             
;  Source Line # 124
  124| 0001C2 8B45                        MOV    EAX, [EBP-52] ;  Sum1
  124| 0001C4 CC                                        
  124| 0001C5 0FAF45                      IMUL   EAX, [EBP-40] ;  alfa1
  124| 0001C8 D8                                        
  124| 0001C9 CE                          INTO          
  124| 0001CA 8B55                        MOV    EDX, [EBP-60] ; Spill
  124| 0001CC C4                                        
  124| 0001CD 8B5A                        MOV    EBX, [EDX+48] 
  124| 0001CF 30                                        
  124| 0001D0 8B8B                        MOV    ECX, [EBX-244] ;  MB
  124| 0001D2 0CFFFFFF                                  
  124| 0001D6 8B75                        MOV    ESI, [EBP-20] 
  124| 0001D8 EC                                        
  124| 0001D9 3B35                        CMP    ESI, package1.matr__constrained_array____1 
  124| 0001DB 00000000                                  
  124|                 L40:                             
  124| 0001DF 0F8F                        JG     L41    
  124| 0001E1 F2000000                                  
  124| 0001E5 8D76                        LEA    ESI, [ESI-1] 
  124| 0001E7 FF                                        
  124| 0001E8 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  124| 0001EB 00000000                                  
  124| 0001EF 8B7D                        MOV    EDI, [EBP-12] 
  124| 0001F1 F4                                        
  124| 0001F2 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  124| 0001F4 00000000                                  
  124|                 L42:                             
  124| 0001F8 0F8F                        JG     L43    
  124| 0001FA E5000000                                  
  124| 0001FE 8D3CBD                      LEA    EDI, [4*EDI-4] 
  124| 000201 FCFFFFFF                                  
  124| 000205 03F7                        ADD    ESI, EDI 
  124| 000207 030431                      ADD    EAX, [ECX+ESI+0] 
  124| 00020A CE                          INTO          
  124| 00020B 8B52                        MOV    EDX, [EDX+48] 
  124| 00020D 30                                        
  124| 00020E 8B9A                        MOV    EBX, [EDX-248] ;  MA
  124| 000210 08FFFFFF                                  
  124| 000214 8B4D                        MOV    ECX, [EBP-20] 
  124| 000216 EC                                        
  124| 000217 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  124| 000219 00000000                                  
  124|                 L44:                             
  124| 00021D 0F8F                        JG     L45    
  124| 00021F CC000000                                  
  124| 000223 8D49                        LEA    ECX, [ECX-1] 
  124| 000225 FF                                        
  124| 000226 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  124| 000229 00000000                                  
  124| 00022D 8B7D                        MOV    EDI, [EBP-12] 
  124| 00022F F4                                        
  124| 000230 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  124| 000232 00000000                                  
  124|                 L46:                             
  124| 000236 0F8F                        JG     L47    
  124| 000238 BF000000                                  
  124| 00023C 8D3CBD                      LEA    EDI, [4*EDI-4] 
  124| 00023F FCFFFFFF                                  
  124| 000243 03CF                        ADD    ECX, EDI 
  124| 000245 89040B                      MOV    [EBX+ECX+0], EAX 
;  Source Line # 125
  125| 000248 8B75                        MOV    ESI, [EBP-16] 
  125| 00024A F0                                        
  125| 00024B 3975                        CMP    [EBP-12], ESI 
  125| 00024D F4                                        
  125| 00024E 74                          JE     SHORT L19 
  125| 00024F 0C                                        
  125| 000250 8B45                        MOV    EAX, [EBP-12] 
  125| 000252 F4                                        
  125| 000253 40                          INC    EAX    
  125| 000254 8945                        MOV    [EBP-12], EAX 
  125| 000256 F4                                        
  125| 000257 E9                          JMP    L21    
  125| 000258 B1FEFFFF                                  
  125|                 L19:                             
;  Source Line # 126
  126| 00025C 8B45                        MOV    EAX, [EBP-24] 
  126| 00025E E8                                        
  126| 00025F 3945                        CMP    [EBP-20], EAX 
  126| 000261 EC                                        
  126| 000262 74                          JE     SHORT L16 
  126| 000263 0C                                        
  126| 000264 8B45                        MOV    EAX, [EBP-20] 
  126| 000266 EC                                        
  126| 000267 40                          INC    EAX    
  126| 000268 8945                        MOV    [EBP-20], EAX 
  126| 00026A EC                                        
  126| 00026B E9                          JMP    L18    
  126| 00026C 83FEFFFF                                  
  126|                 L16:                             
;  Source Line # 128
  128| 000270 68                          PUSH   lab4.monitor.endñount 
  128| 000271 00000000                                  
  128| 000275 6A                          PUSH   0      
  128| 000276 00                                        
  128| 000277 8B55                        MOV    EDX, [EBP-60] ; Spill
  128| 000279 C4                                        
  128| 00027A 8B42                        MOV    EAX, [EDX+48] 
  128| 00027C 30                                        
  128| 00027D 8B98                        MOV    EBX, [EAX-184] ;  Monitor
  128| 00027F 48FFFFFF                                  
  128| 000283 53                          PUSH   EBX    
  128| 000284 E8                          CALL   rts_protected_procedure_call 
  128| 000285 00000000                                  
;  Source Line # 130
  130| 000289 68                          PUSH   __lcl.00000153 
  130| 00028A 00000000                                  
  130| 00028E 68                          PUSH   __lcl.00000152 
  130| 00028F 00000000                                  
  130| 000293 E8                          CALL   ada.text_io.put_line__2 
  130| 000294 00000000                                  
  130| 000298 8D4D                        LEA    ECX, [EBP-48] ;  dyn_temp
  130| 00029A D0                                        
  130| 00029B 51                          PUSH   ECX    
  130| 00029C E8                          CALL   rts_ss_release 
  130| 00029D 00000000                                  
;  Source Line # 131
  131| 0002A1 8BE5                        MOV    ESP, EBP 
  131| 0002A3 5D                          POP    EBP    
  131| 0002A4 C2                          RET    4      
  131| 0002A5 0400                                      
  131|                 L33:                             
  131| 0002A7 8D05                        LEA    EAX, L32+5 
  131| 0002A9 48010000                                  
  131| 0002AD 50                          PUSH   EAX    
  131| 0002AE E9                          JMP    rts_raise_constraint_error 
  131| 0002AF 00000000                                  
  131|                 L35:                             
  131| 0002B3 8D05                        LEA    EAX, L34+5 
  131| 0002B5 61010000                                  
  131| 0002B9 50                          PUSH   EAX    
  131| 0002BA E9                          JMP    rts_raise_constraint_error 
  131| 0002BB 00000000                                  
  131|                 L37:                             
  131| 0002BF 8D05                        LEA    EAX, L36+5 
  131| 0002C1 7C010000                                  
  131| 0002C5 50                          PUSH   EAX    
  131| 0002C6 E9                          JMP    rts_raise_constraint_error 
  131| 0002C7 00000000                                  
  131|                 L39:                             
  131| 0002CB 8D05                        LEA    EAX, L38+5 
  131| 0002CD 95010000                                  
  131| 0002D1 50                          PUSH   EAX    
  131| 0002D2 E9                          JMP    rts_raise_constraint_error 
  131| 0002D3 00000000                                  
  131|                 L41:                             
  131| 0002D7 8D05                        LEA    EAX, L40+5 
  131| 0002D9 E4010000                                  
  131| 0002DD 50                          PUSH   EAX    
  131| 0002DE E9                          JMP    rts_raise_constraint_error 
  131| 0002DF 00000000                                  
  131|                 L43:                             
  131| 0002E3 8D05                        LEA    EAX, L42+5 
  131| 0002E5 FD010000                                  
  131| 0002E9 50                          PUSH   EAX    
  131| 0002EA E9                          JMP    rts_raise_constraint_error 
  131| 0002EB 00000000                                  
  131|                 L45:                             
  131| 0002EF 8D05                        LEA    EAX, L44+5 
  131| 0002F1 22020000                                  
  131| 0002F5 50                          PUSH   EAX    
  131| 0002F6 E9                          JMP    rts_raise_constraint_error 
  131| 0002F7 00000000                                  
  131|                 L47:                             
  131| 0002FB 8D05                        LEA    EAX, L46+5 
  131| 0002FD 3B020000                                  
  131| 000301 50                          PUSH   EAX    
  131| 000302 E9                          JMP    rts_raise_constraint_error 
  131| 000303 00000000                                  
                       ;                                
                       lab4.t1__body      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000251     DD     00001601 
                                          DD     00000066 
                                          DD     lab4.t1__body 
                                          DD     __lcl.00000260 
                                          DD     00000068 
                                          DD     lab4.t1__body+00000010H 
                                          DD     __lcl.00000260 
                                          DD     0000006A 
                                          DD     lab4.t1__body+0000003AH 
                                          DD     __lcl.00000260 
                                          DD     0000006B 
                                          DD     lab4.t1__body+0000003FH 
                                          DD     __lcl.00000260 
                                          DD     0000006D 
                                          DD     lab4.t1__body+0000004EH 
                                          DD     __lcl.00000260 
                                          DD     0000006F 
                                          DD     lab4.t1__body+00000060H 
                                          DD     __lcl.00000260 
                                          DD     00000071 
                                          DD     lab4.t1__body+00000079H 
                                          DD     __lcl.00000260 
                                          DD     00000073 
                                          DD     lab4.t1__body+00000091H 
                                          DD     __lcl.00000260 
                                          DD     00000074 
                                          DD     lab4.t1__body+000000B8H 
                                          DD     __lcl.00000260 
                                          DD     00000076 
                                          DD     lab4.t1__body+000000E2H 
                                          DD     __lcl.00000260 
                                          DD     00000077 
                                          DD     lab4.t1__body+000000FCH 
                                          DD     __lcl.00000260 
                                          DD     00000078 
                                          DD     lab4.t1__body+0000010DH 
                                          DD     __lcl.00000260 
                                          DD     00000079 
                                          DD     lab4.t1__body+0000011DH 
                                          DD     __lcl.00000260 
                                          DD     0000007A 
                                          DD     lab4.t1__body+0000012EH 
                                          DD     __lcl.00000260 
                                          DD     0000007B 
                                          DD     lab4.t1__body+000001AEH 
                                          DD     __lcl.00000260 
                                          DD     0000007C 
                                          DD     lab4.t1__body+000001C2H 
                                          DD     __lcl.00000260 
                                          DD     0000007D 
                                          DD     lab4.t1__body+00000248H 
                                          DD     __lcl.00000260 
                                          DD     0000007E 
                                          DD     lab4.t1__body+0000025CH 
                                          DD     __lcl.00000260 
                                          DD     00000080 
                                          DD     lab4.t1__body+00000270H 
                                          DD     __lcl.00000260 
                                          DD     00000082 
                                          DD     lab4.t1__body+00000289H 
                                          DD     __lcl.00000260 
                                          DD     00000083 
                                          DD     lab4.t1__body+000002A1H 
                                          DD     __lcl.00000260 
                                          DD     00000083 
                                          DD     lab4.t1__body+00000303H 
                                          DD     __lcl.00000260 
; ********* End of segment, Total Size = 268

                       ;                                
                       ;  Start of procedure lab4.t2__body   
                       ;                                
                                          PUBLIC lab4.t2__body 
                       lab4.t2__body      PROC   NEAR   
;  Source Line # 134
  134| 000000 64                          FS:           
  134| 000001 8B15                        MOV    EDX, 4 
  134| 000003 04000000                                  
  134| 000007 8B52                        MOV    EDX, [EDX-4] 
  134| 000009 FC                                        
  134| 00000A 55                          PUSH   EBP    
  134| 00000B 8BEC                        MOV    EBP, ESP 
  134| 00000D 83EC                        SUB    ESP, 64 
  134| 00000F 40                                        
;  Source Line # 136
  136| 000010 8B02                        MOV    EAX, [EDX+0] 
  136| 000012 8945                        MOV    [EBP-52], EAX ;  dyn_temp
  136| 000014 CC                                        
  136| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  136| 000017 00000000                                  
  136| 00001B 83EB                        SUB    EBX, 1 
  136| 00001D 01                                        
  136| 00001E 7D                          JGE    SHORT L31 
  136| 00001F 03                                        
  136| 000020 33DB                        XOR    EBX, EBX 
  136| 000022 4B                          DEC    EBX    
  136|                 L31:                             
  136| 000023 CE                          INTO          
  136| 000024 43                          INC    EBX    
  136| 000025 CE                          INTO          
  136| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  136| 000029 00000000                                  
  136| 00002D CE                          INTO          
  136| 00002E 53                          PUSH   EBX    
  136| 00002F 8955                        MOV    [EBP-64], EDX ; Spill
  136| 000031 C0                                        
  136| 000032 E8                          CALL   rts_ss_allocate 
  136| 000033 00000000                                  
  136| 000037 8945                        MOV    [EBP-48], EAX ;  MC2
  136| 000039 D0                                        
;  Source Line # 137
  137| 00003A E8                          CALL   rts_activation_succeeded 
  137| 00003B 00000000                                  
;  Source Line # 138
  138| 00003F 68                          PUSH   __lcl.00000160 
  138| 000040 00000000                                  
  138| 000044 68                          PUSH   __lcl.00000159 
  138| 000045 00000000                                  
  138| 000049 E8                          CALL   ada.text_io.put_line__2 
  138| 00004A 00000000                                  
;  Source Line # 141
  141| 00004E 6A                          PUSH   0      
  141| 00004F 00                                        
  141| 000050 6A                          PUSH   0      
  141| 000051 00                                        
  141| 000052 6A                          PUSH   0      
  141| 000053 00                                        
  141| 000054 8B55                        MOV    EDX, [EBP-64] ; Spill
  141| 000056 C0                                        
  141| 000057 8B4A                        MOV    ECX, [EDX+48] 
  141| 000059 30                                        
  141| 00005A 8BB1                        MOV    ESI, [ECX-184] ;  Monitor
  141| 00005C 48FFFFFF                                  
  141| 000060 56                          PUSH   ESI    
  141| 000061 E8                          CALL   rts_protected_entry_call 
  141| 000062 00000000                                  
;  Source Line # 143
  143| 000066 8D7D                        LEA    EDI, [EBP-40] 
  143| 000068 D8                                        
  143| 000069 897D                        MOV    [EBP-36], EDI 
  143| 00006B DC                                        
  143| 00006C 68                          PUSH   lab4.monitor.getalfa 
  143| 00006D 00000000                                  
  143| 000071 8D5D                        LEA    EBX, [EBP-36] 
  143| 000073 DC                                        
  143| 000074 53                          PUSH   EBX    
  143| 000075 8B55                        MOV    EDX, [EBP-64] ; Spill
  143| 000077 C0                                        
  143| 000078 8B42                        MOV    EAX, [EDX+48] 
  143| 00007A 30                                        
  143| 00007B 8B88                        MOV    ECX, [EAX-184] ;  Monitor
  143| 00007D 48FFFFFF                                  
  143| 000081 51                          PUSH   ECX    
  143| 000082 E8                          CALL   rts_entryless_protected_subp_call 
  143| 000083 00000000                                  
  143| 000087 8B75                        MOV    ESI, [EBP-40] 
  143| 000089 D8                                        
  143| 00008A 8975                        MOV    [EBP-44], ESI ;  alfa2
  143| 00008C D4                                        
;  Source Line # 144
  144| 00008D 8B7D                        MOV    EDI, [EBP-48] ;  MC2
  144| 00008F D0                                        
  144| 000090 897D                        MOV    [EBP-32], EDI 
  144| 000092 E0                                        
  144| 000093 68                          PUSH   lab4.monitor.getmc 
  144| 000094 00000000                                  
  144| 000098 8D5D                        LEA    EBX, [EBP-32] 
  144| 00009A E0                                        
  144| 00009B 53                          PUSH   EBX    
  144| 00009C 8B55                        MOV    EDX, [EBP-64] ; Spill
  144| 00009E C0                                        
  144| 00009F 8B42                        MOV    EAX, [EDX+48] 
  144| 0000A1 30                                        
  144| 0000A2 8B88                        MOV    ECX, [EAX-184] ;  Monitor
  144| 0000A4 48FFFFFF                                  
  144| 0000A8 51                          PUSH   ECX    
  144| 0000A9 E8                          CALL   rts_entryless_protected_subp_call 
  144| 0000AA 00000000                                  
  144| 0000AE 8B35                        MOV    ESI, package1.n 
  144| 0000B0 00000000                                  
  144| 0000B4 8975                        MOV    [EBP-28], ESI 
  144| 0000B6 E4                                        
;  Source Line # 146
  146| 0000B7 837D                        CMP    DWORD PTR [EBP-28], 0 
  146| 0000B9 E4                                        
  146| 0000BA 00                                        
  146| 0000BB 0F8E                        JLE    L16    
  146| 0000BD A5010000                                  
  146| 0000C1 C745                        MOV    DWORD PTR [EBP-24], 1 
  146| 0000C3 E8                                        
  146| 0000C4 01000000                                  
  146|                 L18:                             
  146| 0000C8 8B05                        MOV    EAX, package1.h 
  146| 0000CA 00000000                                  
  146| 0000CE 40                          INC    EAX    
  146| 0000CF CE                          INTO          
  146| 0000D0 8945                        MOV    [EBP-20], EAX 
  146| 0000D2 EC                                        
  146| 0000D3 8B1D                        MOV    EBX, package1.h 
  146| 0000D5 00000000                                  
  146| 0000D9 D1E3                        SHL    EBX, 1 
  146| 0000DB CE                          INTO          
  146| 0000DC 895D                        MOV    [EBP-16], EBX 
  146| 0000DE F0                                        
;  Source Line # 147
  147| 0000DF 8B4D                        MOV    ECX, [EBP-16] 
  147| 0000E1 F0                                        
  147| 0000E2 394D                        CMP    [EBP-20], ECX 
  147| 0000E4 EC                                        
  147| 0000E5 0F8F                        JG     L19    
  147| 0000E7 67010000                                  
  147| 0000EB 8B45                        MOV    EAX, [EBP-20] 
  147| 0000ED EC                                        
  147| 0000EE 8945                        MOV    [EBP-12], EAX 
  147| 0000F0 F4                                        
  147|                 L21:                             
;  Source Line # 148
  148| 0000F1 C745                        MOV    DWORD PTR [EBP-56], 0 ;  Sum1
  148| 0000F3 C8                                        
  148| 0000F4 00000000                                  
  148| 0000F8 8B05                        MOV    EAX, package1.n 
  148| 0000FA 00000000                                  
  148| 0000FE 8945                        MOV    [EBP-8], EAX 
  148| 000100 F8                                        
;  Source Line # 149
  149| 000101 837D                        CMP    DWORD PTR [EBP-8], 0 
  149| 000103 F8                                        
  149| 000104 00                                        
  149| 000105 0F8E                        JLE    L22    
  149| 000107 A4000000                                  
  149| 00010B C745                        MOV    DWORD PTR [EBP-4], 1 
  149| 00010D FC                                        
  149| 00010E 01000000                                  
  149|                 L24:                             
;  Source Line # 150
  150| 000112 8B55                        MOV    EDX, [EBP-64] ; Spill
  150| 000114 C0                                        
  150| 000115 8B42                        MOV    EAX, [EDX+48] 
  150| 000117 30                                        
  150| 000118 8B98                        MOV    EBX, [EAX-252] ;  MZ
  150| 00011A 04FFFFFF                                  
  150| 00011E 8B4D                        MOV    ECX, [EBP-4] 
  150| 000120 FC                                        
  150| 000121 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  150| 000123 00000000                                  
  150|                 L32:                             
  150| 000127 0F8F                        JG     L33    
  150| 000129 70010000                                  
  150| 00012D 8D49                        LEA    ECX, [ECX-1] 
  150| 00012F FF                                        
  150| 000130 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  150| 000133 00000000                                  
  150| 000137 8B75                        MOV    ESI, [EBP-12] 
  150| 000139 F4                                        
  150| 00013A 83FE                        CMP    ESI, 1 
  150| 00013C 01                                        
  150|                 L34:                             
  150| 00013D 0F8C                        JL     L35    
  150| 00013F 66010000                                  
  150| 000143 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  150| 000145 00000000                                  
  150| 000149 0F8F                        JG     L35    
  150| 00014B 5A010000                                  
  150| 00014F 8D34B5                      LEA    ESI, [4*ESI-4] 
  150| 000152 FCFFFFFF                                  
  150| 000156 03CE                        ADD    ECX, ESI 
  150| 000158 8B7D                        MOV    EDI, [EBP-48] ;  MC2
  150| 00015A D0                                        
  150| 00015B 8B55                        MOV    EDX, [EBP-24] 
  150| 00015D E8                                        
  150| 00015E 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  150| 000160 00000000                                  
  150|                 L36:                             
  150| 000164 0F8F                        JG     L37    
  150| 000166 4B010000                                  
  150| 00016A 8D52                        LEA    EDX, [EDX-1] 
  150| 00016C FF                                        
  150| 00016D 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  150| 000170 00000000                                  
  150| 000174 8B45                        MOV    EAX, [EBP-4] 
  150| 000176 FC                                        
  150| 000177 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  150| 000179 00000000                                  
  150|                 L38:                             
  150| 00017D 0F8F                        JG     L39    
  150| 00017F 3E010000                                  
  150| 000183 8D0485                      LEA    EAX, [4*EAX-4] 
  150| 000186 FCFFFFFF                                  
  150| 00018A 03D0                        ADD    EDX, EAX 
  150| 00018C 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  150| 00018F 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  150| 000193 CE                          INTO          
  150| 000194 035D                        ADD    EBX, [EBP-56] ;  Sum1
  150| 000196 C8                                        
  150| 000197 CE                          INTO          
  150| 000198 895D                        MOV    [EBP-56], EBX ;  Sum1
  150| 00019A C8                                        
;  Source Line # 151
  151| 00019B 8B75                        MOV    ESI, [EBP-8] 
  151| 00019D F8                                        
  151| 00019E 3975                        CMP    [EBP-4], ESI 
  151| 0001A0 FC                                        
  151| 0001A1 74                          JE     SHORT L22 
  151| 0001A2 0C                                        
  151| 0001A3 8B45                        MOV    EAX, [EBP-4] 
  151| 0001A5 FC                                        
  151| 0001A6 40                          INC    EAX    
  151| 0001A7 8945                        MOV    [EBP-4], EAX 
  151| 0001A9 FC                                        
  151| 0001AA E9                          JMP    L24    
  151| 0001AB 63FFFFFF                                  
  151|                 L22:                             
;  Source Line # 152
  152| 0001AF 8B45                        MOV    EAX, [EBP-56] ;  Sum1
  152| 0001B1 C8                                        
  152| 0001B2 0FAF45                      IMUL   EAX, [EBP-44] ;  alfa2
  152| 0001B5 D4                                        
  152| 0001B6 CE                          INTO          
  152| 0001B7 8B55                        MOV    EDX, [EBP-64] ; Spill
  152| 0001B9 C0                                        
  152| 0001BA 8B5A                        MOV    EBX, [EDX+48] 
  152| 0001BC 30                                        
  152| 0001BD 8B8B                        MOV    ECX, [EBX-244] ;  MB
  152| 0001BF 0CFFFFFF                                  
  152| 0001C3 8B75                        MOV    ESI, [EBP-24] 
  152| 0001C5 E8                                        
  152| 0001C6 3B35                        CMP    ESI, package1.matr__constrained_array____1 
  152| 0001C8 00000000                                  
  152|                 L40:                             
  152| 0001CC 0F8F                        JG     L41    
  152| 0001CE FB000000                                  
  152| 0001D2 8D76                        LEA    ESI, [ESI-1] 
  152| 0001D4 FF                                        
  152| 0001D5 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  152| 0001D8 00000000                                  
  152| 0001DC 8B7D                        MOV    EDI, [EBP-12] 
  152| 0001DE F4                                        
  152| 0001DF 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  152| 0001E1 00000000                                  
  152|                 L42:                             
  152| 0001E5 0F8F                        JG     L43    
  152| 0001E7 EE000000                                  
  152| 0001EB 8D3CBD                      LEA    EDI, [4*EDI-4] 
  152| 0001EE FCFFFFFF                                  
  152| 0001F2 03F7                        ADD    ESI, EDI 
  152| 0001F4 030431                      ADD    EAX, [ECX+ESI+0] 
  152| 0001F7 CE                          INTO          
  152| 0001F8 8B52                        MOV    EDX, [EDX+48] 
  152| 0001FA 30                                        
  152| 0001FB 8B9A                        MOV    EBX, [EDX-248] ;  MA
  152| 0001FD 08FFFFFF                                  
  152| 000201 8B4D                        MOV    ECX, [EBP-24] 
  152| 000203 E8                                        
  152| 000204 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  152| 000206 00000000                                  
  152|                 L44:                             
  152| 00020A 0F8F                        JG     L45    
  152| 00020C D5000000                                  
  152| 000210 8D49                        LEA    ECX, [ECX-1] 
  152| 000212 FF                                        
  152| 000213 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  152| 000216 00000000                                  
  152| 00021A 8B7D                        MOV    EDI, [EBP-12] 
  152| 00021C F4                                        
  152| 00021D 83FF                        CMP    EDI, 1 
  152| 00021F 01                                        
  152|                 L46:                             
  152| 000220 0F8C                        JL     L47    
  152| 000222 CB000000                                  
  152| 000226 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  152| 000228 00000000                                  
  152| 00022C 0F8F                        JG     L47    
  152| 00022E BF000000                                  
  152| 000232 8D3CBD                      LEA    EDI, [4*EDI-4] 
  152| 000235 FCFFFFFF                                  
  152| 000239 03CF                        ADD    ECX, EDI 
  152| 00023B 89040B                      MOV    [EBX+ECX+0], EAX 
;  Source Line # 153
  153| 00023E 8B75                        MOV    ESI, [EBP-16] 
  153| 000240 F0                                        
  153| 000241 3975                        CMP    [EBP-12], ESI 
  153| 000243 F4                                        
  153| 000244 74                          JE     SHORT L19 
  153| 000245 0C                                        
  153| 000246 8B45                        MOV    EAX, [EBP-12] 
  153| 000248 F4                                        
  153| 000249 40                          INC    EAX    
  153| 00024A 8945                        MOV    [EBP-12], EAX 
  153| 00024C F4                                        
  153| 00024D E9                          JMP    L21    
  153| 00024E 9FFEFFFF                                  
  153|                 L19:                             
;  Source Line # 154
  154| 000252 8B45                        MOV    EAX, [EBP-28] 
  154| 000254 E4                                        
  154| 000255 3945                        CMP    [EBP-24], EAX 
  154| 000257 E8                                        
  154| 000258 74                          JE     SHORT L16 
  154| 000259 0C                                        
  154| 00025A 8B45                        MOV    EAX, [EBP-24] 
  154| 00025C E8                                        
  154| 00025D 40                          INC    EAX    
  154| 00025E 8945                        MOV    [EBP-24], EAX 
  154| 000260 E8                                        
  154| 000261 E9                          JMP    L18    
  154| 000262 62FEFFFF                                  
  154|                 L16:                             
;  Source Line # 156
  156| 000266 68                          PUSH   lab4.monitor.endñount 
  156| 000267 00000000                                  
  156| 00026B 6A                          PUSH   0      
  156| 00026C 00                                        
  156| 00026D 8B55                        MOV    EDX, [EBP-64] ; Spill
  156| 00026F C0                                        
  156| 000270 8B42                        MOV    EAX, [EDX+48] 
  156| 000272 30                                        
  156| 000273 8B98                        MOV    EBX, [EAX-184] ;  Monitor
  156| 000275 48FFFFFF                                  
  156| 000279 53                          PUSH   EBX    
  156| 00027A E8                          CALL   rts_protected_procedure_call 
  156| 00027B 00000000                                  
;  Source Line # 158
  158| 00027F 68                          PUSH   __lcl.00000179 
  158| 000280 00000000                                  
  158| 000284 68                          PUSH   __lcl.00000178 
  158| 000285 00000000                                  
  158| 000289 E8                          CALL   ada.text_io.put_line__2 
  158| 00028A 00000000                                  
  158| 00028E 8D4D                        LEA    ECX, [EBP-52] ;  dyn_temp
  158| 000290 CC                                        
  158| 000291 51                          PUSH   ECX    
  158| 000292 E8                          CALL   rts_ss_release 
  158| 000293 00000000                                  
;  Source Line # 159
  159| 000297 8BE5                        MOV    ESP, EBP 
  159| 000299 5D                          POP    EBP    
  159| 00029A C2                          RET    4      
  159| 00029B 0400                                      
  159|                 L33:                             
  159| 00029D 8D05                        LEA    EAX, L32+5 
  159| 00029F 2C010000                                  
  159| 0002A3 50                          PUSH   EAX    
  159| 0002A4 E9                          JMP    rts_raise_constraint_error 
  159| 0002A5 00000000                                  
  159|                 L35:                             
  159| 0002A9 8D05                        LEA    EAX, L34+5 
  159| 0002AB 42010000                                  
  159| 0002AF 50                          PUSH   EAX    
  159| 0002B0 E9                          JMP    rts_raise_constraint_error 
  159| 0002B1 00000000                                  
  159|                 L37:                             
  159| 0002B5 8D05                        LEA    EAX, L36+5 
  159| 0002B7 69010000                                  
  159| 0002BB 50                          PUSH   EAX    
  159| 0002BC E9                          JMP    rts_raise_constraint_error 
  159| 0002BD 00000000                                  
  159|                 L39:                             
  159| 0002C1 8D05                        LEA    EAX, L38+5 
  159| 0002C3 82010000                                  
  159| 0002C7 50                          PUSH   EAX    
  159| 0002C8 E9                          JMP    rts_raise_constraint_error 
  159| 0002C9 00000000                                  
  159|                 L41:                             
  159| 0002CD 8D05                        LEA    EAX, L40+5 
  159| 0002CF D1010000                                  
  159| 0002D3 50                          PUSH   EAX    
  159| 0002D4 E9                          JMP    rts_raise_constraint_error 
  159| 0002D5 00000000                                  
  159|                 L43:                             
  159| 0002D9 8D05                        LEA    EAX, L42+5 
  159| 0002DB EA010000                                  
  159| 0002DF 50                          PUSH   EAX    
  159| 0002E0 E9                          JMP    rts_raise_constraint_error 
  159| 0002E1 00000000                                  
  159|                 L45:                             
  159| 0002E5 8D05                        LEA    EAX, L44+5 
  159| 0002E7 0F020000                                  
  159| 0002EB 50                          PUSH   EAX    
  159| 0002EC E9                          JMP    rts_raise_constraint_error 
  159| 0002ED 00000000                                  
  159|                 L47:                             
  159| 0002F1 8D05                        LEA    EAX, L46+5 
  159| 0002F3 25020000                                  
  159| 0002F7 50                          PUSH   EAX    
  159| 0002F8 E9                          JMP    rts_raise_constraint_error 
  159| 0002F9 00000000                                  
                       ;                                
                       lab4.t2__body      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000250     DD     00001401 
                                          DD     00000086 
                                          DD     lab4.t2__body 
                                          DD     __lcl.00000260 
                                          DD     00000088 
                                          DD     lab4.t2__body+00000010H 
                                          DD     __lcl.00000260 
                                          DD     00000089 
                                          DD     lab4.t2__body+0000003AH 
                                          DD     __lcl.00000260 
                                          DD     0000008A 
                                          DD     lab4.t2__body+0000003FH 
                                          DD     __lcl.00000260 
                                          DD     0000008D 
                                          DD     lab4.t2__body+0000004EH 
                                          DD     __lcl.00000260 
                                          DD     0000008F 
                                          DD     lab4.t2__body+00000066H 
                                          DD     __lcl.00000260 
                                          DD     00000090 
                                          DD     lab4.t2__body+0000008DH 
                                          DD     __lcl.00000260 
                                          DD     00000092 
                                          DD     lab4.t2__body+000000B7H 
                                          DD     __lcl.00000260 
                                          DD     00000093 
                                          DD     lab4.t2__body+000000DFH 
                                          DD     __lcl.00000260 
                                          DD     00000094 
                                          DD     lab4.t2__body+000000F1H 
                                          DD     __lcl.00000260 
                                          DD     00000095 
                                          DD     lab4.t2__body+00000101H 
                                          DD     __lcl.00000260 
                                          DD     00000096 
                                          DD     lab4.t2__body+00000112H 
                                          DD     __lcl.00000260 
                                          DD     00000097 
                                          DD     lab4.t2__body+0000019BH 
                                          DD     __lcl.00000260 
                                          DD     00000098 
                                          DD     lab4.t2__body+000001AFH 
                                          DD     __lcl.00000260 
                                          DD     00000099 
                                          DD     lab4.t2__body+0000023EH 
                                          DD     __lcl.00000260 
                                          DD     0000009A 
                                          DD     lab4.t2__body+00000252H 
                                          DD     __lcl.00000260 
                                          DD     0000009C 
                                          DD     lab4.t2__body+00000266H 
                                          DD     __lcl.00000260 
                                          DD     0000009E 
                                          DD     lab4.t2__body+0000027FH 
                                          DD     __lcl.00000260 
                                          DD     0000009F 
                                          DD     lab4.t2__body+00000297H 
                                          DD     __lcl.00000260 
                                          DD     0000009F 
                                          DD     lab4.t2__body+000002F9H 
                                          DD     __lcl.00000260 
; ********* End of segment, Total Size = 244

                       ;                                
                       ;  Start of procedure lab4.t3__body   
                       ;                                
                                          PUBLIC lab4.t3__body 
                       lab4.t3__body      PROC   NEAR   
;  Source Line # 162
  162| 000000 64                          FS:           
  162| 000001 8B15                        MOV    EDX, 4 
  162| 000003 04000000                                  
  162| 000007 8B52                        MOV    EDX, [EDX-4] 
  162| 000009 FC                                        
  162| 00000A 55                          PUSH   EBP    
  162| 00000B 8BEC                        MOV    EBP, ESP 
  162| 00000D 83EC                        SUB    ESP, 64 
  162| 00000F 40                                        
;  Source Line # 164
  164| 000010 8B02                        MOV    EAX, [EDX+0] 
  164| 000012 8945                        MOV    [EBP-52], EAX ;  dyn_temp
  164| 000014 CC                                        
  164| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  164| 000017 00000000                                  
  164| 00001B 83EB                        SUB    EBX, 1 
  164| 00001D 01                                        
  164| 00001E 7D                          JGE    SHORT L31 
  164| 00001F 03                                        
  164| 000020 33DB                        XOR    EBX, EBX 
  164| 000022 4B                          DEC    EBX    
  164|                 L31:                             
  164| 000023 CE                          INTO          
  164| 000024 43                          INC    EBX    
  164| 000025 CE                          INTO          
  164| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  164| 000029 00000000                                  
  164| 00002D CE                          INTO          
  164| 00002E 53                          PUSH   EBX    
  164| 00002F 8955                        MOV    [EBP-64], EDX ; Spill
  164| 000031 C0                                        
  164| 000032 E8                          CALL   rts_ss_allocate 
  164| 000033 00000000                                  
  164| 000037 8945                        MOV    [EBP-48], EAX ;  MC3
  164| 000039 D0                                        
;  Source Line # 165
  165| 00003A E8                          CALL   rts_activation_succeeded 
  165| 00003B 00000000                                  
;  Source Line # 166
  166| 00003F 68                          PUSH   __lcl.00000185 
  166| 000040 00000000                                  
  166| 000044 68                          PUSH   __lcl.00000184 
  166| 000045 00000000                                  
  166| 000049 E8                          CALL   ada.text_io.put_line__2 
  166| 00004A 00000000                                  
;  Source Line # 169
  169| 00004E 8B4D                        MOV    ECX, [EBP-48] ;  MC3
  169| 000050 D0                                        
  169| 000051 51                          PUSH   ECX    
  169| 000052 E8                          CALL   package1.matr_input 
  169| 000053 00000000                                  
;  Source Line # 170
  170| 000057 8B75                        MOV    ESI, [EBP-48] ;  MC3
  170| 000059 D0                                        
  170| 00005A 8975                        MOV    [EBP-40], ESI 
  170| 00005C D8                                        
  170| 00005D 68                          PUSH   lab4.monitor.setmc 
  170| 00005E 00000000                                  
  170| 000062 8D7D                        LEA    EDI, [EBP-40] 
  170| 000064 D8                                        
  170| 000065 57                          PUSH   EDI    
  170| 000066 8B55                        MOV    EDX, [EBP-64] ; Spill
  170| 000068 C0                                        
  170| 000069 8B5A                        MOV    EBX, [EDX+48] 
  170| 00006B 30                                        
  170| 00006C 8B83                        MOV    EAX, [EBX-184] ;  Monitor
  170| 00006E 48FFFFFF                                  
  170| 000072 50                          PUSH   EAX    
  170| 000073 E8                          CALL   rts_protected_procedure_call 
  170| 000074 00000000                                  
;  Source Line # 172
  172| 000078 68                          PUSH   lab4.monitor.input 
  172| 000079 00000000                                  
  172| 00007D 6A                          PUSH   0      
  172| 00007E 00                                        
  172| 00007F 8B55                        MOV    EDX, [EBP-64] ; Spill
  172| 000081 C0                                        
  172| 000082 8B4A                        MOV    ECX, [EDX+48] 
  172| 000084 30                                        
  172| 000085 8BB1                        MOV    ESI, [ECX-184] ;  Monitor
  172| 000087 48FFFFFF                                  
  172| 00008B 56                          PUSH   ESI    
  172| 00008C E8                          CALL   rts_protected_procedure_call 
  172| 00008D 00000000                                  
;  Source Line # 174
  174| 000091 6A                          PUSH   0      
  174| 000092 00                                        
  174| 000093 6A                          PUSH   0      
  174| 000094 00                                        
  174| 000095 6A                          PUSH   0      
  174| 000096 00                                        
  174| 000097 8B55                        MOV    EDX, [EBP-64] ; Spill
  174| 000099 C0                                        
  174| 00009A 8B7A                        MOV    EDI, [EDX+48] 
  174| 00009C 30                                        
  174| 00009D 8B9F                        MOV    EBX, [EDI-184] ;  Monitor
  174| 00009F 48FFFFFF                                  
  174| 0000A3 53                          PUSH   EBX    
  174| 0000A4 E8                          CALL   rts_protected_entry_call 
  174| 0000A5 00000000                                  
;  Source Line # 176
  176| 0000A9 8D45                        LEA    EAX, [EBP-36] 
  176| 0000AB DC                                        
  176| 0000AC 8945                        MOV    [EBP-32], EAX 
  176| 0000AE E0                                        
  176| 0000AF 68                          PUSH   lab4.monitor.getalfa 
  176| 0000B0 00000000                                  
  176| 0000B4 8D4D                        LEA    ECX, [EBP-32] 
  176| 0000B6 E0                                        
  176| 0000B7 51                          PUSH   ECX    
  176| 0000B8 8B55                        MOV    EDX, [EBP-64] ; Spill
  176| 0000BA C0                                        
  176| 0000BB 8B72                        MOV    ESI, [EDX+48] 
  176| 0000BD 30                                        
  176| 0000BE 8BBE                        MOV    EDI, [ESI-184] ;  Monitor
  176| 0000C0 48FFFFFF                                  
  176| 0000C4 57                          PUSH   EDI    
  176| 0000C5 E8                          CALL   rts_entryless_protected_subp_call 
  176| 0000C6 00000000                                  
  176| 0000CA 8B5D                        MOV    EBX, [EBP-36] 
  176| 0000CC DC                                        
  176| 0000CD 895D                        MOV    [EBP-44], EBX ;  alfa3
  176| 0000CF D4                                        
  176| 0000D0 8B05                        MOV    EAX, package1.n 
  176| 0000D2 00000000                                  
  176| 0000D6 8945                        MOV    [EBP-28], EAX 
  176| 0000D8 E4                                        
;  Source Line # 178
  178| 0000D9 837D                        CMP    DWORD PTR [EBP-28], 0 
  178| 0000DB E4                                        
  178| 0000DC 00                                        
  178| 0000DD 0F8E                        JLE    L16    
  178| 0000DF A7010000                                  
  178| 0000E3 C745                        MOV    DWORD PTR [EBP-24], 1 
  178| 0000E5 E8                                        
  178| 0000E6 01000000                                  
  178|                 L18:                             
  178| 0000EA 8B05                        MOV    EAX, package1.h 
  178| 0000EC 00000000                                  
  178| 0000F0 D1E0                        SHL    EAX, 1 
  178| 0000F2 CE                          INTO          
  178| 0000F3 40                          INC    EAX    
  178| 0000F4 CE                          INTO          
  178| 0000F5 8945                        MOV    [EBP-20], EAX 
  178| 0000F7 EC                                        
  178| 0000F8 6B1D                        IMUL   EBX, package1.h, 3 
  178| 0000FA 00000000                                  
  178| 0000FE 03                                        
  178| 0000FF CE                          INTO          
  178| 000100 895D                        MOV    [EBP-16], EBX 
  178| 000102 F0                                        
;  Source Line # 179
  179| 000103 8B4D                        MOV    ECX, [EBP-16] 
  179| 000105 F0                                        
  179| 000106 394D                        CMP    [EBP-20], ECX 
  179| 000108 EC                                        
  179| 000109 0F8F                        JG     L19    
  179| 00010B 67010000                                  
  179| 00010F 8B45                        MOV    EAX, [EBP-20] 
  179| 000111 EC                                        
  179| 000112 8945                        MOV    [EBP-12], EAX 
  179| 000114 F4                                        
  179|                 L21:                             
;  Source Line # 180
  180| 000115 C745                        MOV    DWORD PTR [EBP-56], 0 ;  Sum1
  180| 000117 C8                                        
  180| 000118 00000000                                  
  180| 00011C 8B05                        MOV    EAX, package1.n 
  180| 00011E 00000000                                  
  180| 000122 8945                        MOV    [EBP-8], EAX 
  180| 000124 F8                                        
;  Source Line # 181
  181| 000125 837D                        CMP    DWORD PTR [EBP-8], 0 
  181| 000127 F8                                        
  181| 000128 00                                        
  181| 000129 0F8E                        JLE    L22    
  181| 00012B A4000000                                  
  181| 00012F C745                        MOV    DWORD PTR [EBP-4], 1 
  181| 000131 FC                                        
  181| 000132 01000000                                  
  181|                 L24:                             
;  Source Line # 182
  182| 000136 8B55                        MOV    EDX, [EBP-64] ; Spill
  182| 000138 C0                                        
  182| 000139 8B42                        MOV    EAX, [EDX+48] 
  182| 00013B 30                                        
  182| 00013C 8B98                        MOV    EBX, [EAX-252] ;  MZ
  182| 00013E 04FFFFFF                                  
  182| 000142 8B4D                        MOV    ECX, [EBP-4] 
  182| 000144 FC                                        
  182| 000145 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  182| 000147 00000000                                  
  182|                 L32:                             
  182| 00014B 0F8F                        JG     L33    
  182| 00014D 70010000                                  
  182| 000151 8D49                        LEA    ECX, [ECX-1] 
  182| 000153 FF                                        
  182| 000154 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  182| 000157 00000000                                  
  182| 00015B 8B75                        MOV    ESI, [EBP-12] 
  182| 00015D F4                                        
  182| 00015E 83FE                        CMP    ESI, 1 
  182| 000160 01                                        
  182|                 L34:                             
  182| 000161 0F8C                        JL     L35    
  182| 000163 66010000                                  
  182| 000167 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  182| 000169 00000000                                  
  182| 00016D 0F8F                        JG     L35    
  182| 00016F 5A010000                                  
  182| 000173 8D34B5                      LEA    ESI, [4*ESI-4] 
  182| 000176 FCFFFFFF                                  
  182| 00017A 03CE                        ADD    ECX, ESI 
  182| 00017C 8B7D                        MOV    EDI, [EBP-48] ;  MC3
  182| 00017E D0                                        
  182| 00017F 8B55                        MOV    EDX, [EBP-24] 
  182| 000181 E8                                        
  182| 000182 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  182| 000184 00000000                                  
  182|                 L36:                             
  182| 000188 0F8F                        JG     L37    
  182| 00018A 4B010000                                  
  182| 00018E 8D52                        LEA    EDX, [EDX-1] 
  182| 000190 FF                                        
  182| 000191 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  182| 000194 00000000                                  
  182| 000198 8B45                        MOV    EAX, [EBP-4] 
  182| 00019A FC                                        
  182| 00019B 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  182| 00019D 00000000                                  
  182|                 L38:                             
  182| 0001A1 0F8F                        JG     L39    
  182| 0001A3 3E010000                                  
  182| 0001A7 8D0485                      LEA    EAX, [4*EAX-4] 
  182| 0001AA FCFFFFFF                                  
  182| 0001AE 03D0                        ADD    EDX, EAX 
  182| 0001B0 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  182| 0001B3 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  182| 0001B7 CE                          INTO          
  182| 0001B8 035D                        ADD    EBX, [EBP-56] ;  Sum1
  182| 0001BA C8                                        
  182| 0001BB CE                          INTO          
  182| 0001BC 895D                        MOV    [EBP-56], EBX ;  Sum1
  182| 0001BE C8                                        
;  Source Line # 183
  183| 0001BF 8B75                        MOV    ESI, [EBP-8] 
  183| 0001C1 F8                                        
  183| 0001C2 3975                        CMP    [EBP-4], ESI 
  183| 0001C4 FC                                        
  183| 0001C5 74                          JE     SHORT L22 
  183| 0001C6 0C                                        
  183| 0001C7 8B45                        MOV    EAX, [EBP-4] 
  183| 0001C9 FC                                        
  183| 0001CA 40                          INC    EAX    
  183| 0001CB 8945                        MOV    [EBP-4], EAX 
  183| 0001CD FC                                        
  183| 0001CE E9                          JMP    L24    
  183| 0001CF 63FFFFFF                                  
  183|                 L22:                             
;  Source Line # 184
  184| 0001D3 8B45                        MOV    EAX, [EBP-56] ;  Sum1
  184| 0001D5 C8                                        
  184| 0001D6 0FAF45                      IMUL   EAX, [EBP-44] ;  alfa3
  184| 0001D9 D4                                        
  184| 0001DA CE                          INTO          
  184| 0001DB 8B55                        MOV    EDX, [EBP-64] ; Spill
  184| 0001DD C0                                        
  184| 0001DE 8B5A                        MOV    EBX, [EDX+48] 
  184| 0001E0 30                                        
  184| 0001E1 8B8B                        MOV    ECX, [EBX-244] ;  MB
  184| 0001E3 0CFFFFFF                                  
  184| 0001E7 8B75                        MOV    ESI, [EBP-24] 
  184| 0001E9 E8                                        
  184| 0001EA 3B35                        CMP    ESI, package1.matr__constrained_array____1 
  184| 0001EC 00000000                                  
  184|                 L40:                             
  184| 0001F0 0F8F                        JG     L41    
  184| 0001F2 FB000000                                  
  184| 0001F6 8D76                        LEA    ESI, [ESI-1] 
  184| 0001F8 FF                                        
  184| 0001F9 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  184| 0001FC 00000000                                  
  184| 000200 8B7D                        MOV    EDI, [EBP-12] 
  184| 000202 F4                                        
  184| 000203 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  184| 000205 00000000                                  
  184|                 L42:                             
  184| 000209 0F8F                        JG     L43    
  184| 00020B EE000000                                  
  184| 00020F 8D3CBD                      LEA    EDI, [4*EDI-4] 
  184| 000212 FCFFFFFF                                  
  184| 000216 03F7                        ADD    ESI, EDI 
  184| 000218 030431                      ADD    EAX, [ECX+ESI+0] 
  184| 00021B CE                          INTO          
  184| 00021C 8B52                        MOV    EDX, [EDX+48] 
  184| 00021E 30                                        
  184| 00021F 8B9A                        MOV    EBX, [EDX-248] ;  MA
  184| 000221 08FFFFFF                                  
  184| 000225 8B4D                        MOV    ECX, [EBP-24] 
  184| 000227 E8                                        
  184| 000228 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  184| 00022A 00000000                                  
  184|                 L44:                             
  184| 00022E 0F8F                        JG     L45    
  184| 000230 D5000000                                  
  184| 000234 8D49                        LEA    ECX, [ECX-1] 
  184| 000236 FF                                        
  184| 000237 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  184| 00023A 00000000                                  
  184| 00023E 8B7D                        MOV    EDI, [EBP-12] 
  184| 000240 F4                                        
  184| 000241 83FF                        CMP    EDI, 1 
  184| 000243 01                                        
  184|                 L46:                             
  184| 000244 0F8C                        JL     L47    
  184| 000246 CB000000                                  
  184| 00024A 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  184| 00024C 00000000                                  
  184| 000250 0F8F                        JG     L47    
  184| 000252 BF000000                                  
  184| 000256 8D3CBD                      LEA    EDI, [4*EDI-4] 
  184| 000259 FCFFFFFF                                  
  184| 00025D 03CF                        ADD    ECX, EDI 
  184| 00025F 89040B                      MOV    [EBX+ECX+0], EAX 
;  Source Line # 185
  185| 000262 8B75                        MOV    ESI, [EBP-16] 
  185| 000264 F0                                        
  185| 000265 3975                        CMP    [EBP-12], ESI 
  185| 000267 F4                                        
  185| 000268 74                          JE     SHORT L19 
  185| 000269 0C                                        
  185| 00026A 8B45                        MOV    EAX, [EBP-12] 
  185| 00026C F4                                        
  185| 00026D 40                          INC    EAX    
  185| 00026E 8945                        MOV    [EBP-12], EAX 
  185| 000270 F4                                        
  185| 000271 E9                          JMP    L21    
  185| 000272 9FFEFFFF                                  
  185|                 L19:                             
;  Source Line # 186
  186| 000276 8B45                        MOV    EAX, [EBP-28] 
  186| 000278 E4                                        
  186| 000279 3945                        CMP    [EBP-24], EAX 
  186| 00027B E8                                        
  186| 00027C 74                          JE     SHORT L16 
  186| 00027D 0C                                        
  186| 00027E 8B45                        MOV    EAX, [EBP-24] 
  186| 000280 E8                                        
  186| 000281 40                          INC    EAX    
  186| 000282 8945                        MOV    [EBP-24], EAX 
  186| 000284 E8                                        
  186| 000285 E9                          JMP    L18    
  186| 000286 60FEFFFF                                  
  186|                 L16:                             
;  Source Line # 188
  188| 00028A 68                          PUSH   lab4.monitor.endñount 
  188| 00028B 00000000                                  
  188| 00028F 6A                          PUSH   0      
  188| 000290 00                                        
  188| 000291 8B55                        MOV    EDX, [EBP-64] ; Spill
  188| 000293 C0                                        
  188| 000294 8B42                        MOV    EAX, [EDX+48] 
  188| 000296 30                                        
  188| 000297 8B98                        MOV    EBX, [EAX-184] ;  Monitor
  188| 000299 48FFFFFF                                  
  188| 00029D 53                          PUSH   EBX    
  188| 00029E E8                          CALL   rts_protected_procedure_call 
  188| 00029F 00000000                                  
;  Source Line # 190
  190| 0002A3 68                          PUSH   __lcl.00000204 
  190| 0002A4 00000000                                  
  190| 0002A8 68                          PUSH   __lcl.00000203 
  190| 0002A9 00000000                                  
  190| 0002AD E8                          CALL   ada.text_io.put_line__2 
  190| 0002AE 00000000                                  
  190| 0002B2 8D4D                        LEA    ECX, [EBP-52] ;  dyn_temp
  190| 0002B4 CC                                        
  190| 0002B5 51                          PUSH   ECX    
  190| 0002B6 E8                          CALL   rts_ss_release 
  190| 0002B7 00000000                                  
;  Source Line # 191
  191| 0002BB 8BE5                        MOV    ESP, EBP 
  191| 0002BD 5D                          POP    EBP    
  191| 0002BE C2                          RET    4      
  191| 0002BF 0400                                      
  191|                 L33:                             
  191| 0002C1 8D05                        LEA    EAX, L32+5 
  191| 0002C3 50010000                                  
  191| 0002C7 50                          PUSH   EAX    
  191| 0002C8 E9                          JMP    rts_raise_constraint_error 
  191| 0002C9 00000000                                  
  191|                 L35:                             
  191| 0002CD 8D05                        LEA    EAX, L34+5 
  191| 0002CF 66010000                                  
  191| 0002D3 50                          PUSH   EAX    
  191| 0002D4 E9                          JMP    rts_raise_constraint_error 
  191| 0002D5 00000000                                  
  191|                 L37:                             
  191| 0002D9 8D05                        LEA    EAX, L36+5 
  191| 0002DB 8D010000                                  
  191| 0002DF 50                          PUSH   EAX    
  191| 0002E0 E9                          JMP    rts_raise_constraint_error 
  191| 0002E1 00000000                                  
  191|                 L39:                             
  191| 0002E5 8D05                        LEA    EAX, L38+5 
  191| 0002E7 A6010000                                  
  191| 0002EB 50                          PUSH   EAX    
  191| 0002EC E9                          JMP    rts_raise_constraint_error 
  191| 0002ED 00000000                                  
  191|                 L41:                             
  191| 0002F1 8D05                        LEA    EAX, L40+5 
  191| 0002F3 F5010000                                  
  191| 0002F7 50                          PUSH   EAX    
  191| 0002F8 E9                          JMP    rts_raise_constraint_error 
  191| 0002F9 00000000                                  
  191|                 L43:                             
  191| 0002FD 8D05                        LEA    EAX, L42+5 
  191| 0002FF 0E020000                                  
  191| 000303 50                          PUSH   EAX    
  191| 000304 E9                          JMP    rts_raise_constraint_error 
  191| 000305 00000000                                  
  191|                 L45:                             
  191| 000309 8D05                        LEA    EAX, L44+5 
  191| 00030B 33020000                                  
  191| 00030F 50                          PUSH   EAX    
  191| 000310 E9                          JMP    rts_raise_constraint_error 
  191| 000311 00000000                                  
  191|                 L47:                             
  191| 000315 8D05                        LEA    EAX, L46+5 
  191| 000317 49020000                                  
  191| 00031B 50                          PUSH   EAX    
  191| 00031C E9                          JMP    rts_raise_constraint_error 
  191| 00031D 00000000                                  
                       ;                                
                       lab4.t3__body      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000249     DD     00001601 
                                          DD     000000A2 
                                          DD     lab4.t3__body 
                                          DD     __lcl.00000260 
                                          DD     000000A4 
                                          DD     lab4.t3__body+00000010H 
                                          DD     __lcl.00000260 
                                          DD     000000A5 
                                          DD     lab4.t3__body+0000003AH 
                                          DD     __lcl.00000260 
                                          DD     000000A6 
                                          DD     lab4.t3__body+0000003FH 
                                          DD     __lcl.00000260 
                                          DD     000000A9 
                                          DD     lab4.t3__body+0000004EH 
                                          DD     __lcl.00000260 
                                          DD     000000AA 
                                          DD     lab4.t3__body+00000057H 
                                          DD     __lcl.00000260 
                                          DD     000000AC 
                                          DD     lab4.t3__body+00000078H 
                                          DD     __lcl.00000260 
                                          DD     000000AE 
                                          DD     lab4.t3__body+00000091H 
                                          DD     __lcl.00000260 
                                          DD     000000B0 
                                          DD     lab4.t3__body+000000A9H 
                                          DD     __lcl.00000260 
                                          DD     000000B2 
                                          DD     lab4.t3__body+000000D9H 
                                          DD     __lcl.00000260 
                                          DD     000000B3 
                                          DD     lab4.t3__body+00000103H 
                                          DD     __lcl.00000260 
                                          DD     000000B4 
                                          DD     lab4.t3__body+00000115H 
                                          DD     __lcl.00000260 
                                          DD     000000B5 
                                          DD     lab4.t3__body+00000125H 
                                          DD     __lcl.00000260 
                                          DD     000000B6 
                                          DD     lab4.t3__body+00000136H 
                                          DD     __lcl.00000260 
                                          DD     000000B7 
                                          DD     lab4.t3__body+000001BFH 
                                          DD     __lcl.00000260 
                                          DD     000000B8 
                                          DD     lab4.t3__body+000001D3H 
                                          DD     __lcl.00000260 
                                          DD     000000B9 
                                          DD     lab4.t3__body+00000262H 
                                          DD     __lcl.00000260 
                                          DD     000000BA 
                                          DD     lab4.t3__body+00000276H 
                                          DD     __lcl.00000260 
                                          DD     000000BC 
                                          DD     lab4.t3__body+0000028AH 
                                          DD     __lcl.00000260 
                                          DD     000000BE 
                                          DD     lab4.t3__body+000002A3H 
                                          DD     __lcl.00000260 
                                          DD     000000BF 
                                          DD     lab4.t3__body+000002BBH 
                                          DD     __lcl.00000260 
                                          DD     000000BF 
                                          DD     lab4.t3__body+0000031DH 
                                          DD     __lcl.00000260 
; ********* End of segment, Total Size = 268

                       ;                                
                       ;  Start of procedure lab4.t4__body   
                       ;                                
                                          PUBLIC lab4.t4__body 
                       lab4.t4__body      PROC   NEAR   
;  Source Line # 194
  194| 000000 64                          FS:           
  194| 000001 8B15                        MOV    EDX, 4 
  194| 000003 04000000                                  
  194| 000007 8B52                        MOV    EDX, [EDX-4] 
  194| 000009 FC                                        
  194| 00000A 55                          PUSH   EBP    
  194| 00000B 8BEC                        MOV    EBP, ESP 
  194| 00000D 83EC                        SUB    ESP, 60 
  194| 00000F 3C                                        
;  Source Line # 196
  196| 000010 8B02                        MOV    EAX, [EDX+0] 
  196| 000012 8945                        MOV    [EBP-48], EAX ;  dyn_temp
  196| 000014 D0                                        
  196| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  196| 000017 00000000                                  
  196| 00001B 83EB                        SUB    EBX, 1 
  196| 00001D 01                                        
  196| 00001E 7D                          JGE    SHORT L31 
  196| 00001F 03                                        
  196| 000020 33DB                        XOR    EBX, EBX 
  196| 000022 4B                          DEC    EBX    
  196|                 L31:                             
  196| 000023 CE                          INTO          
  196| 000024 43                          INC    EBX    
  196| 000025 CE                          INTO          
  196| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  196| 000029 00000000                                  
  196| 00002D CE                          INTO          
  196| 00002E 53                          PUSH   EBX    
  196| 00002F 8955                        MOV    [EBP-60], EDX ; Spill
  196| 000031 C4                                        
  196| 000032 E8                          CALL   rts_ss_allocate 
  196| 000033 00000000                                  
  196| 000037 8945                        MOV    [EBP-44], EAX ;  MC4
  196| 000039 D4                                        
;  Source Line # 197
  197| 00003A E8                          CALL   rts_activation_succeeded 
  197| 00003B 00000000                                  
;  Source Line # 198
  198| 00003F 68                          PUSH   __lcl.00000210 
  198| 000040 00000000                                  
  198| 000044 68                          PUSH   __lcl.00000209 
  198| 000045 00000000                                  
  198| 000049 E8                          CALL   ada.text_io.put_line__2 
  198| 00004A 00000000                                  
;  Source Line # 201
  201| 00004E 8B55                        MOV    EDX, [EBP-60] ; Spill
  201| 000050 C4                                        
  201| 000051 8B4A                        MOV    ECX, [EDX+48] 
  201| 000053 30                                        
  201| 000054 8BB1                        MOV    ESI, [ECX-244] ;  MB
  201| 000056 0CFFFFFF                                  
  201| 00005A 56                          PUSH   ESI    
  201| 00005B E8                          CALL   package1.matr_input 
  201| 00005C 00000000                                  
;  Source Line # 202
  202| 000060 C745                        MOV    DWORD PTR [EBP-40], 1 ;  alfa4
  202| 000062 D8                                        
  202| 000063 01000000                                  
;  Source Line # 203
  203| 000067 8B7D                        MOV    EDI, [EBP-40] ;  alfa4
  203| 000069 D8                                        
  203| 00006A 897D                        MOV    [EBP-36], EDI 
  203| 00006C DC                                        
  203| 00006D 68                          PUSH   lab4.monitor.setalfa 
  203| 00006E 00000000                                  
  203| 000072 8D5D                        LEA    EBX, [EBP-36] 
  203| 000074 DC                                        
  203| 000075 53                          PUSH   EBX    
  203| 000076 8B55                        MOV    EDX, [EBP-60] ; Spill
  203| 000078 C4                                        
  203| 000079 8B42                        MOV    EAX, [EDX+48] 
  203| 00007B 30                                        
  203| 00007C 8B88                        MOV    ECX, [EAX-184] ;  Monitor
  203| 00007E 48FFFFFF                                  
  203| 000082 51                          PUSH   ECX    
  203| 000083 E8                          CALL   rts_protected_procedure_call 
  203| 000084 00000000                                  
;  Source Line # 205
  205| 000088 68                          PUSH   lab4.monitor.input 
  205| 000089 00000000                                  
  205| 00008D 6A                          PUSH   0      
  205| 00008E 00                                        
  205| 00008F 8B55                        MOV    EDX, [EBP-60] ; Spill
  205| 000091 C4                                        
  205| 000092 8B72                        MOV    ESI, [EDX+48] 
  205| 000094 30                                        
  205| 000095 8BBE                        MOV    EDI, [ESI-184] ;  Monitor
  205| 000097 48FFFFFF                                  
  205| 00009B 57                          PUSH   EDI    
  205| 00009C E8                          CALL   rts_protected_procedure_call 
  205| 00009D 00000000                                  
;  Source Line # 207
  207| 0000A1 6A                          PUSH   0      
  207| 0000A2 00                                        
  207| 0000A3 6A                          PUSH   0      
  207| 0000A4 00                                        
  207| 0000A5 6A                          PUSH   0      
  207| 0000A6 00                                        
  207| 0000A7 8B55                        MOV    EDX, [EBP-60] ; Spill
  207| 0000A9 C4                                        
  207| 0000AA 8B5A                        MOV    EBX, [EDX+48] 
  207| 0000AC 30                                        
  207| 0000AD 8B83                        MOV    EAX, [EBX-184] ;  Monitor
  207| 0000AF 48FFFFFF                                  
  207| 0000B3 50                          PUSH   EAX    
  207| 0000B4 E8                          CALL   rts_protected_entry_call 
  207| 0000B5 00000000                                  
;  Source Line # 209
  209| 0000B9 8B4D                        MOV    ECX, [EBP-44] ;  MC4
  209| 0000BB D4                                        
  209| 0000BC 894D                        MOV    [EBP-32], ECX 
  209| 0000BE E0                                        
  209| 0000BF 68                          PUSH   lab4.monitor.getmc 
  209| 0000C0 00000000                                  
  209| 0000C4 8D75                        LEA    ESI, [EBP-32] 
  209| 0000C6 E0                                        
  209| 0000C7 56                          PUSH   ESI    
  209| 0000C8 8B55                        MOV    EDX, [EBP-60] ; Spill
  209| 0000CA C4                                        
  209| 0000CB 8B7A                        MOV    EDI, [EDX+48] 
  209| 0000CD 30                                        
  209| 0000CE 8B9F                        MOV    EBX, [EDI-184] ;  Monitor
  209| 0000D0 48FFFFFF                                  
  209| 0000D4 53                          PUSH   EBX    
  209| 0000D5 E8                          CALL   rts_entryless_protected_subp_call 
  209| 0000D6 00000000                                  
  209| 0000DA 8B05                        MOV    EAX, package1.n 
  209| 0000DC 00000000                                  
  209| 0000E0 8945                        MOV    [EBP-28], EAX 
  209| 0000E2 E4                                        
;  Source Line # 211
  211| 0000E3 837D                        CMP    DWORD PTR [EBP-28], 0 
  211| 0000E5 E4                                        
  211| 0000E6 00                                        
  211| 0000E7 0F8E                        JLE    L16    
  211| 0000E9 A4010000                                  
  211| 0000ED C745                        MOV    DWORD PTR [EBP-24], 1 
  211| 0000EF E8                                        
  211| 0000F0 01000000                                  
  211|                 L18:                             
  211| 0000F4 6B05                        IMUL   EAX, package1.h, 3 
  211| 0000F6 00000000                                  
  211| 0000FA 03                                        
  211| 0000FB CE                          INTO          
  211| 0000FC 40                          INC    EAX    
  211| 0000FD CE                          INTO          
  211| 0000FE 8945                        MOV    [EBP-20], EAX 
  211| 000100 EC                                        
  211| 000101 8B1D                        MOV    EBX, package1.n 
  211| 000103 00000000                                  
  211| 000107 895D                        MOV    [EBP-16], EBX 
  211| 000109 F0                                        
;  Source Line # 212
  212| 00010A 8B4D                        MOV    ECX, [EBP-16] 
  212| 00010C F0                                        
  212| 00010D 394D                        CMP    [EBP-20], ECX 
  212| 00010F EC                                        
  212| 000110 0F8F                        JG     L19    
  212| 000112 67010000                                  
  212| 000116 8B45                        MOV    EAX, [EBP-20] 
  212| 000118 EC                                        
  212| 000119 8945                        MOV    [EBP-12], EAX 
  212| 00011B F4                                        
  212|                 L21:                             
;  Source Line # 213
  213| 00011C C745                        MOV    DWORD PTR [EBP-52], 0 ;  Sum1
  213| 00011E CC                                        
  213| 00011F 00000000                                  
  213| 000123 8B05                        MOV    EAX, package1.n 
  213| 000125 00000000                                  
  213| 000129 8945                        MOV    [EBP-8], EAX 
  213| 00012B F8                                        
;  Source Line # 214
  214| 00012C 837D                        CMP    DWORD PTR [EBP-8], 0 
  214| 00012E F8                                        
  214| 00012F 00                                        
  214| 000130 0F8E                        JLE    L22    
  214| 000132 A4000000                                  
  214| 000136 C745                        MOV    DWORD PTR [EBP-4], 1 
  214| 000138 FC                                        
  214| 000139 01000000                                  
  214|                 L24:                             
;  Source Line # 215
  215| 00013D 8B55                        MOV    EDX, [EBP-60] ; Spill
  215| 00013F C4                                        
  215| 000140 8B42                        MOV    EAX, [EDX+48] 
  215| 000142 30                                        
  215| 000143 8B98                        MOV    EBX, [EAX-252] ;  MZ
  215| 000145 04FFFFFF                                  
  215| 000149 8B4D                        MOV    ECX, [EBP-4] 
  215| 00014B FC                                        
  215| 00014C 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  215| 00014E 00000000                                  
  215|                 L32:                             
  215| 000152 0F8F                        JG     L33    
  215| 000154 90010000                                  
  215| 000158 8D49                        LEA    ECX, [ECX-1] 
  215| 00015A FF                                        
  215| 00015B 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  215| 00015E 00000000                                  
  215| 000162 8B75                        MOV    ESI, [EBP-12] 
  215| 000164 F4                                        
  215| 000165 83FE                        CMP    ESI, 1 
  215| 000167 01                                        
  215|                 L34:                             
  215| 000168 0F8C                        JL     L35    
  215| 00016A 86010000                                  
  215| 00016E 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  215| 000170 00000000                                  
  215| 000174 0F8F                        JG     L35    
  215| 000176 7A010000                                  
  215| 00017A 8D34B5                      LEA    ESI, [4*ESI-4] 
  215| 00017D FCFFFFFF                                  
  215| 000181 03CE                        ADD    ECX, ESI 
  215| 000183 8B7D                        MOV    EDI, [EBP-44] ;  MC4
  215| 000185 D4                                        
  215| 000186 8B55                        MOV    EDX, [EBP-24] 
  215| 000188 E8                                        
  215| 000189 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  215| 00018B 00000000                                  
  215|                 L36:                             
  215| 00018F 0F8F                        JG     L37    
  215| 000191 6B010000                                  
  215| 000195 8D52                        LEA    EDX, [EDX-1] 
  215| 000197 FF                                        
  215| 000198 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  215| 00019B 00000000                                  
  215| 00019F 8B45                        MOV    EAX, [EBP-4] 
  215| 0001A1 FC                                        
  215| 0001A2 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  215| 0001A4 00000000                                  
  215|                 L38:                             
  215| 0001A8 0F8F                        JG     L39    
  215| 0001AA 5E010000                                  
  215| 0001AE 8D0485                      LEA    EAX, [4*EAX-4] 
  215| 0001B1 FCFFFFFF                                  
  215| 0001B5 03D0                        ADD    EDX, EAX 
  215| 0001B7 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  215| 0001BA 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  215| 0001BE CE                          INTO          
  215| 0001BF 035D                        ADD    EBX, [EBP-52] ;  Sum1
  215| 0001C1 CC                                        
  215| 0001C2 CE                          INTO          
  215| 0001C3 895D                        MOV    [EBP-52], EBX ;  Sum1
  215| 0001C5 CC                                        
;  Source Line # 216
  216| 0001C6 8B75                        MOV    ESI, [EBP-8] 
  216| 0001C8 F8                                        
  216| 0001C9 3975                        CMP    [EBP-4], ESI 
  216| 0001CB FC                                        
  216| 0001CC 74                          JE     SHORT L22 
  216| 0001CD 0C                                        
  216| 0001CE 8B45                        MOV    EAX, [EBP-4] 
  216| 0001D0 FC                                        
  216| 0001D1 40                          INC    EAX    
  216| 0001D2 8945                        MOV    [EBP-4], EAX 
  216| 0001D4 FC                                        
  216| 0001D5 E9                          JMP    L24    
  216| 0001D6 63FFFFFF                                  
  216|                 L22:                             
;  Source Line # 217
  217| 0001DA 8B45                        MOV    EAX, [EBP-52] ;  Sum1
  217| 0001DC CC                                        
  217| 0001DD 0FAF45                      IMUL   EAX, [EBP-40] ;  alfa4
  217| 0001E0 D8                                        
  217| 0001E1 CE                          INTO          
  217| 0001E2 8B55                        MOV    EDX, [EBP-60] ; Spill
  217| 0001E4 C4                                        
  217| 0001E5 8B5A                        MOV    EBX, [EDX+48] 
  217| 0001E7 30                                        
  217| 0001E8 8B8B                        MOV    ECX, [EBX-244] ;  MB
  217| 0001EA 0CFFFFFF                                  
  217| 0001EE 8B75                        MOV    ESI, [EBP-24] 
  217| 0001F0 E8                                        
  217| 0001F1 3B35                        CMP    ESI, package1.matr__constrained_array____1 
  217| 0001F3 00000000                                  
  217|                 L40:                             
  217| 0001F7 0F8F                        JG     L41    
  217| 0001F9 1B010000                                  
  217| 0001FD 8D76                        LEA    ESI, [ESI-1] 
  217| 0001FF FF                                        
  217| 000200 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  217| 000203 00000000                                  
  217| 000207 8B7D                        MOV    EDI, [EBP-12] 
  217| 000209 F4                                        
  217| 00020A 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  217| 00020C 00000000                                  
  217|                 L42:                             
  217| 000210 0F8F                        JG     L43    
  217| 000212 0E010000                                  
  217| 000216 8D3CBD                      LEA    EDI, [4*EDI-4] 
  217| 000219 FCFFFFFF                                  
  217| 00021D 03F7                        ADD    ESI, EDI 
  217| 00021F 030431                      ADD    EAX, [ECX+ESI+0] 
  217| 000222 CE                          INTO          
  217| 000223 8B52                        MOV    EDX, [EDX+48] 
  217| 000225 30                                        
  217| 000226 8B9A                        MOV    EBX, [EDX-248] ;  MA
  217| 000228 08FFFFFF                                  
  217| 00022C 8B4D                        MOV    ECX, [EBP-24] 
  217| 00022E E8                                        
  217| 00022F 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  217| 000231 00000000                                  
  217|                 L44:                             
  217| 000235 0F8F                        JG     L45    
  217| 000237 F5000000                                  
  217| 00023B 8D49                        LEA    ECX, [ECX-1] 
  217| 00023D FF                                        
  217| 00023E 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  217| 000241 00000000                                  
  217| 000245 8B7D                        MOV    EDI, [EBP-12] 
  217| 000247 F4                                        
  217| 000248 83FF                        CMP    EDI, 1 
  217| 00024A 01                                        
  217|                 L46:                             
  217| 00024B 0F8C                        JL     L47    
  217| 00024D EB000000                                  
  217| 000251 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  217| 000253 00000000                                  
  217| 000257 0F8F                        JG     L47    
  217| 000259 DF000000                                  
  217| 00025D 8D3CBD                      LEA    EDI, [4*EDI-4] 
  217| 000260 FCFFFFFF                                  
  217| 000264 03CF                        ADD    ECX, EDI 
  217| 000266 89040B                      MOV    [EBX+ECX+0], EAX 
;  Source Line # 218
  218| 000269 8B75                        MOV    ESI, [EBP-16] 
  218| 00026B F0                                        
  218| 00026C 3975                        CMP    [EBP-12], ESI 
  218| 00026E F4                                        
  218| 00026F 74                          JE     SHORT L19 
  218| 000270 0C                                        
  218| 000271 8B45                        MOV    EAX, [EBP-12] 
  218| 000273 F4                                        
  218| 000274 40                          INC    EAX    
  218| 000275 8945                        MOV    [EBP-12], EAX 
  218| 000277 F4                                        
  218| 000278 E9                          JMP    L21    
  218| 000279 9FFEFFFF                                  
  218|                 L19:                             
;  Source Line # 219
  219| 00027D 8B45                        MOV    EAX, [EBP-28] 
  219| 00027F E4                                        
  219| 000280 3945                        CMP    [EBP-24], EAX 
  219| 000282 E8                                        
  219| 000283 74                          JE     SHORT L16 
  219| 000284 0C                                        
  219| 000285 8B45                        MOV    EAX, [EBP-24] 
  219| 000287 E8                                        
  219| 000288 40                          INC    EAX    
  219| 000289 8945                        MOV    [EBP-24], EAX 
  219| 00028B E8                                        
  219| 00028C E9                          JMP    L18    
  219| 00028D 63FEFFFF                                  
  219|                 L16:                             
;  Source Line # 221
  221| 000291 6A                          PUSH   0      
  221| 000292 00                                        
  221| 000293 6A                          PUSH   1      
  221| 000294 01                                        
  221| 000295 6A                          PUSH   0      
  221| 000296 00                                        
  221| 000297 8B55                        MOV    EDX, [EBP-60] ; Spill
  221| 000299 C4                                        
  221| 00029A 8B42                        MOV    EAX, [EDX+48] 
  221| 00029C 30                                        
  221| 00029D 8B98                        MOV    EBX, [EAX-184] ;  Monitor
  221| 00029F 48FFFFFF                                  
  221| 0002A3 53                          PUSH   EBX    
  221| 0002A4 E8                          CALL   rts_protected_entry_call 
  221| 0002A5 00000000                                  
;  Source Line # 223
  223| 0002A9 68                          PUSH   __lcl.00000229 
  223| 0002AA 00000000                                  
  223| 0002AE 68                          PUSH   __lcl.00000228 
  223| 0002AF 00000000                                  
  223| 0002B3 E8                          CALL   ada.text_io.put_line__2 
  223| 0002B4 00000000                                  
;  Source Line # 224
  224| 0002B8 8B55                        MOV    EDX, [EBP-60] ; Spill
  224| 0002BA C4                                        
  224| 0002BB 8B4A                        MOV    ECX, [EDX+48] 
  224| 0002BD 30                                        
  224| 0002BE 8BB1                        MOV    ESI, [ECX-248] ;  MA
  224| 0002C0 08FFFFFF                                  
  224| 0002C4 56                          PUSH   ESI    
  224| 0002C5 E8                          CALL   package1.matr_print 
  224| 0002C6 00000000                                  
;  Source Line # 226
  226| 0002CA 68                          PUSH   __lcl.00000231 
  226| 0002CB 00000000                                  
  226| 0002CF 68                          PUSH   __lcl.00000230 
  226| 0002D0 00000000                                  
  226| 0002D4 E8                          CALL   ada.text_io.put_line__2 
  226| 0002D5 00000000                                  
  226| 0002D9 8D7D                        LEA    EDI, [EBP-48] ;  dyn_temp
  226| 0002DB D0                                        
  226| 0002DC 57                          PUSH   EDI    
  226| 0002DD E8                          CALL   rts_ss_release 
  226| 0002DE 00000000                                  
;  Source Line # 227
  227| 0002E2 8BE5                        MOV    ESP, EBP 
  227| 0002E4 5D                          POP    EBP    
  227| 0002E5 C2                          RET    4      
  227| 0002E6 0400                                      
  227|                 L33:                             
  227| 0002E8 8D05                        LEA    EAX, L32+5 
  227| 0002EA 57010000                                  
  227| 0002EE 50                          PUSH   EAX    
  227| 0002EF E9                          JMP    rts_raise_constraint_error 
  227| 0002F0 00000000                                  
  227|                 L35:                             
  227| 0002F4 8D05                        LEA    EAX, L34+5 
  227| 0002F6 6D010000                                  
  227| 0002FA 50                          PUSH   EAX    
  227| 0002FB E9                          JMP    rts_raise_constraint_error 
  227| 0002FC 00000000                                  
  227|                 L37:                             
  227| 000300 8D05                        LEA    EAX, L36+5 
  227| 000302 94010000                                  
  227| 000306 50                          PUSH   EAX    
  227| 000307 E9                          JMP    rts_raise_constraint_error 
  227| 000308 00000000                                  
  227|                 L39:                             
  227| 00030C 8D05                        LEA    EAX, L38+5 
  227| 00030E AD010000                                  
  227| 000312 50                          PUSH   EAX    
  227| 000313 E9                          JMP    rts_raise_constraint_error 
  227| 000314 00000000                                  
  227|                 L41:                             
  227| 000318 8D05                        LEA    EAX, L40+5 
  227| 00031A FC010000                                  
  227| 00031E 50                          PUSH   EAX    
  227| 00031F E9                          JMP    rts_raise_constraint_error 
  227| 000320 00000000                                  
  227|                 L43:                             
  227| 000324 8D05                        LEA    EAX, L42+5 
  227| 000326 15020000                                  
  227| 00032A 50                          PUSH   EAX    
  227| 00032B E9                          JMP    rts_raise_constraint_error 
  227| 00032C 00000000                                  
  227|                 L45:                             
  227| 000330 8D05                        LEA    EAX, L44+5 
  227| 000332 3A020000                                  
  227| 000336 50                          PUSH   EAX    
  227| 000337 E9                          JMP    rts_raise_constraint_error 
  227| 000338 00000000                                  
  227|                 L47:                             
  227| 00033C 8D05                        LEA    EAX, L46+5 
  227| 00033E 50020000                                  
  227| 000342 50                          PUSH   EAX    
  227| 000343 E9                          JMP    rts_raise_constraint_error 
  227| 000344 00000000                                  
                       ;                                
                       lab4.t4__body      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000248     DD     00001901 
                                          DD     000000C2 
                                          DD     lab4.t4__body 
                                          DD     __lcl.00000260 
                                          DD     000000C4 
                                          DD     lab4.t4__body+00000010H 
                                          DD     __lcl.00000260 
                                          DD     000000C5 
                                          DD     lab4.t4__body+0000003AH 
                                          DD     __lcl.00000260 
                                          DD     000000C6 
                                          DD     lab4.t4__body+0000003FH 
                                          DD     __lcl.00000260 
                                          DD     000000C9 
                                          DD     lab4.t4__body+0000004EH 
                                          DD     __lcl.00000260 
                                          DD     000000CA 
                                          DD     lab4.t4__body+00000060H 
                                          DD     __lcl.00000260 
                                          DD     000000CB 
                                          DD     lab4.t4__body+00000067H 
                                          DD     __lcl.00000260 
                                          DD     000000CD 
                                          DD     lab4.t4__body+00000088H 
                                          DD     __lcl.00000260 
                                          DD     000000CF 
                                          DD     lab4.t4__body+000000A1H 
                                          DD     __lcl.00000260 
                                          DD     000000D1 
                                          DD     lab4.t4__body+000000B9H 
                                          DD     __lcl.00000260 
                                          DD     000000D3 
                                          DD     lab4.t4__body+000000E3H 
                                          DD     __lcl.00000260 
                                          DD     000000D4 
                                          DD     lab4.t4__body+0000010AH 
                                          DD     __lcl.00000260 
                                          DD     000000D5 
                                          DD     lab4.t4__body+0000011CH 
                                          DD     __lcl.00000260 
                                          DD     000000D6 
                                          DD     lab4.t4__body+0000012CH 
                                          DD     __lcl.00000260 
                                          DD     000000D7 
                                          DD     lab4.t4__body+0000013DH 
                                          DD     __lcl.00000260 
                                          DD     000000D8 
                                          DD     lab4.t4__body+000001C6H 
                                          DD     __lcl.00000260 
                                          DD     000000D9 
                                          DD     lab4.t4__body+000001DAH 
                                          DD     __lcl.00000260 
                                          DD     000000DA 
                                          DD     lab4.t4__body+00000269H 
                                          DD     __lcl.00000260 
                                          DD     000000DB 
                                          DD     lab4.t4__body+0000027DH 
                                          DD     __lcl.00000260 
                                          DD     000000DD 
                                          DD     lab4.t4__body+00000291H 
                                          DD     __lcl.00000260 
                                          DD     000000DF 
                                          DD     lab4.t4__body+000002A9H 
                                          DD     __lcl.00000260 
                                          DD     000000E0 
                                          DD     lab4.t4__body+000002B8H 
                                          DD     __lcl.00000260 
                                          DD     000000E2 
                                          DD     lab4.t4__body+000002CAH 
                                          DD     __lcl.00000260 
                                          DD     000000E3 
                                          DD     lab4.t4__body+000002E2H 
                                          DD     __lcl.00000260 
                                          DD     000000E3 
                                          DD     lab4.t4__body+00000344H 
                                          DD     __lcl.00000260 
; ********* End of segment, Total Size = 304

                       ;                                
                       ;  Start of procedure lab4       
                       ;                                
                                          PUBLIC lab4   
                       lab4               PROC   NEAR   
;  Source Line # 13
   13| 000000 64                          FS:           
   13| 000001 8B15                        MOV    EDX, 4 
   13| 000003 04000000                                  
   13| 000007 8B52                        MOV    EDX, [EDX-4] 
   13| 000009 FC                                        
   13| 00000A 55                          PUSH   EBP    
   13| 00000B 8BEC                        MOV    EBP, ESP 
   13| 00000D 8A8424                      MOV    AL, [ESP-268] 
   13| 000010 F4FEFFFF                                  
   13| 000014 81EC                        SUB    ESP, 268 
   13| 000016 0C010000                                  
   13| 00001A 8B42                        MOV    EAX, [EDX+48] 
   13| 00001C 30                                        
   13| 00001D 8945                        MOV    [EBP-4], EAX 
   13| 00001F FC                                        
   13| 000020 896A                        MOV    [EDX+48], EBP 
   13| 000022 30                                        
;  Source Line # 14
   14| 000023 8B02                        MOV    EAX, [EDX+0] 
   14| 000025 8985                        MOV    [EBP-256], EAX ;  dyn_temp
   14| 000027 00FFFFFF                                  
   14| 00002B 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
   14| 00002D 00000000                                  
   14| 000031 83EB                        SUB    EBX, 1 
   14| 000033 01                                        
   14| 000034 7D                          JGE    SHORT L16 
   14| 000035 03                                        
   14| 000036 33DB                        XOR    EBX, EBX 
   14| 000038 4B                          DEC    EBX    
   14|                 L16:                             
   14| 000039 CE                          INTO          
   14| 00003A 43                          INC    EBX    
   14| 00003B CE                          INTO          
   14| 00003C 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   14| 00003F 00000000                                  
   14| 000043 CE                          INTO          
   14| 000044 53                          PUSH   EBX    
   14| 000045 8995                        MOV    [EBP-268], EDX ; Spill
   14| 000047 F4FEFFFF                                  
   14| 00004B E8                          CALL   rts_ss_allocate 
   14| 00004C 00000000                                  
   14| 000050 8985                        MOV    [EBP-252], EAX ;  MZ
   14| 000052 04FFFFFF                                  
   14| 000056 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
   14| 000058 00000000                                  
   14| 00005C 83E9                        SUB    ECX, 1 
   14| 00005E 01                                        
   14| 00005F 7D                          JGE    SHORT L17 
   14| 000060 03                                        
   14| 000061 33C9                        XOR    ECX, ECX 
   14| 000063 49                          DEC    ECX    
   14|                 L17:                             
   14| 000064 CE                          INTO          
   14| 000065 41                          INC    ECX    
   14| 000066 CE                          INTO          
   14| 000067 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
   14| 00006A 00000000                                  
   14| 00006E CE                          INTO          
   14| 00006F 51                          PUSH   ECX    
   14| 000070 E8                          CALL   rts_ss_allocate 
   14| 000071 00000000                                  
   14| 000075 8985                        MOV    [EBP-248], EAX ;  MA
   14| 000077 08FFFFFF                                  
   14| 00007B 8B35                        MOV    ESI, package1.matr__constrained_array____1 
   14| 00007D 00000000                                  
   14| 000081 83EE                        SUB    ESI, 1 
   14| 000083 01                                        
   14| 000084 7D                          JGE    SHORT L18 
   14| 000085 03                                        
   14| 000086 33F6                        XOR    ESI, ESI 
   14| 000088 4E                          DEC    ESI    
   14|                 L18:                             
   14| 000089 CE                          INTO          
   14| 00008A 46                          INC    ESI    
   14| 00008B CE                          INTO          
   14| 00008C 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
   14| 00008F 00000000                                  
   14| 000093 CE                          INTO          
   14| 000094 56                          PUSH   ESI    
   14| 000095 E8                          CALL   rts_ss_allocate 
   14| 000096 00000000                                  
   14| 00009A 8985                        MOV    [EBP-244], EAX ;  MB
   14| 00009C 0CFFFFFF                                  
;  Source Line # 21
   21| 0000A0 C645                        MOV    BYTE PTR [EBP-12], 0 ;  Monitor__elab_bool
   21| 0000A2 F4                                        
   21| 0000A3 00                                        
   21| 0000A4 6A                          PUSH   0      
   21| 0000A5 00                                        
   21| 0000A6 8DBD                        LEA    EDI, [EBP-240] ;  master_record
   21| 0000A8 10FFFFFF                                  
   21| 0000AC 57                          PUSH   EDI    
   21| 0000AD E8                          CALL   rts_init_master 
   21| 0000AE 00000000                                  
   21| 0000B2 8B15                        MOV    EDX, package1.matr__constrained_array____1 
   21| 0000B4 00000000                                  
   21| 0000B8 83EA                        SUB    EDX, 1 
   21| 0000BA 01                                        
   21| 0000BB 7D                          JGE    SHORT L19 
   21| 0000BC 03                                        
   21| 0000BD 33D2                        XOR    EDX, EDX 
   21| 0000BF 4A                          DEC    EDX    
   21|                 L19:                             
   21| 0000C0 CE                          INTO          
   21| 0000C1 42                          INC    EDX    
   21| 0000C2 CE                          INTO          
   21| 0000C3 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
   21| 0000C6 00000000                                  
   21| 0000CA CE                          INTO          
   21| 0000CB 83C2                        ADD    EDX, 7 
   21| 0000CD 07                                        
   21| 0000CE CE                          INTO          
   21| 0000CF 83E2                        AND    EDX, -8 
   21| 0000D1 F8                                        
   21| 0000D2 83C2                        ADD    EDX, 80 
   21| 0000D4 50                                        
   21| 0000D5 CE                          INTO          
   21| 0000D6 52                          PUSH   EDX    
   21| 0000D7 E8                          CALL   rts_ss_allocate 
   21| 0000D8 00000000                                  
   21| 0000DC 8985                        MOV    [EBP-184], EAX ;  Monitor
   21| 0000DE 48FFFFFF                                  
   21| 0000E2 8B9D                        MOV    EBX, [EBP-184] ;  Monitor
   21| 0000E4 48FFFFFF                                  
   21| 0000E8 C743                        MOV    DWORD PTR [EBX+68], 0 
   21| 0000EA 44                                        
   21| 0000EB 00000000                                  
   21| 0000EF 8B8D                        MOV    ECX, [EBP-184] ;  Monitor
   21| 0000F1 48FFFFFF                                  
   21| 0000F5 C741                        MOV    DWORD PTR [ECX+72], 0 
   21| 0000F7 48                                        
   21| 0000F8 00000000                                  
   21| 0000FC 6A                          PUSH   0      
   21| 0000FD 00                                        
   21| 0000FE 68                          PUSH   lab4.monitor__protected_type_desc 
   21| 0000FF 00000000                                  
   21| 000103 6A                          PUSH   30     
   21| 000104 1E                                        
   21| 000105 8BB5                        MOV    ESI, [EBP-184] ;  Monitor
   21| 000107 48FFFFFF                                  
   21| 00010B 56                          PUSH   ESI    
   21| 00010C 8DBD                        LEA    EDI, [EBP-180] ;  cleanup
   21| 00010E 4CFFFFFF                                  
   21| 000112 57                          PUSH   EDI    
   21| 000113 8D95                        LEA    EDX, [EBP-240] ;  master_record
   21| 000115 10FFFFFF                                  
   21| 000119 52                          PUSH   EDX    
   21| 00011A E8                          CALL   rts_init_po 
   21| 00011B 00000000                                  
;  Source Line # 48
   48| 00011F C645                        MOV    BYTE PTR [EBP-12], 1 ;  Monitor__elab_bool
   48| 000121 F4                                        
   48| 000122 01                                        
;  Source Line # 96
   96| 000123 C645                        MOV    BYTE PTR [EBP-11], 0 ;  T1__elab_bool
   96| 000125 F5                                        
   96| 000126 00                                        
   96| 000127 8D85                        LEA    EAX, [EBP-148] ;  activation_list
   96| 000129 6CFFFFFF                                  
   96| 00012D 50                          PUSH   EAX    
   96| 00012E E8                          CALL   rts_initialize_activation_list 
   96| 00012F 00000000                                  
   96| 000133 68                          PUSH   __lcl.00000236 
   96| 000134 00000000                                  
   96| 000138 6A                          PUSH   0      
   96| 000139 00                                        
   96| 00013A 8D5D                        LEA    EBX, [EBP-11] ;  T1__elab_bool
   96| 00013C F5                                        
   96| 00013D 53                          PUSH   EBX    
   96| 00013E 6A                          PUSH   0      
   96| 00013F 00                                        
   96| 000140 8D4D                        LEA    ECX, [EBP-76] ;  T1
   96| 000142 B4                                        
   96| 000143 51                          PUSH   ECX    
   96| 000144 6A                          PUSH   0      
   96| 000145 00                                        
   96| 000146 68                          PUSH   lab4.t1__body 
   96| 000147 00000000                                  
   96| 00014B 8DB5                        LEA    ESI, [EBP-240] ;  master_record
   96| 00014D 10FFFFFF                                  
   96| 000151 56                          PUSH   ESI    
   96| 000152 8DBD                        LEA    EDI, [EBP-148] ;  activation_list
   96| 000154 6CFFFFFF                                  
   96| 000158 57                          PUSH   EDI    
   96| 000159 6A                          PUSH   0      
   96| 00015A 00                                        
   96| 00015B E8                          CALL   rts_initialize_task_with_name 
   96| 00015C 00000000                                  
;  Source Line # 97
   97| 000160 C645                        MOV    BYTE PTR [EBP-10], 0 ;  T2__elab_bool
   97| 000162 F6                                        
   97| 000163 00                                        
   97| 000164 68                          PUSH   __lcl.00000237 
   97| 000165 00000000                                  
   97| 000169 6A                          PUSH   0      
   97| 00016A 00                                        
   97| 00016B 8D55                        LEA    EDX, [EBP-10] ;  T2__elab_bool
   97| 00016D F6                                        
   97| 00016E 52                          PUSH   EDX    
   97| 00016F 6A                          PUSH   0      
   97| 000170 00                                        
   97| 000171 8D45                        LEA    EAX, [EBP-60] ;  T2
   97| 000173 C4                                        
   97| 000174 50                          PUSH   EAX    
   97| 000175 6A                          PUSH   0      
   97| 000176 00                                        
   97| 000177 68                          PUSH   lab4.t2__body 
   97| 000178 00000000                                  
   97| 00017C 8D9D                        LEA    EBX, [EBP-240] ;  master_record
   97| 00017E 10FFFFFF                                  
   97| 000182 53                          PUSH   EBX    
   97| 000183 8D8D                        LEA    ECX, [EBP-148] ;  activation_list
   97| 000185 6CFFFFFF                                  
   97| 000189 51                          PUSH   ECX    
   97| 00018A 6A                          PUSH   0      
   97| 00018B 00                                        
   97| 00018C E8                          CALL   rts_initialize_task_with_name 
   97| 00018D 00000000                                  
;  Source Line # 98
   98| 000191 C645                        MOV    BYTE PTR [EBP-9], 0 ;  T3__elab_bool
   98| 000193 F7                                        
   98| 000194 00                                        
   98| 000195 68                          PUSH   __lcl.00000238 
   98| 000196 00000000                                  
   98| 00019A 6A                          PUSH   0      
   98| 00019B 00                                        
   98| 00019C 8D75                        LEA    ESI, [EBP-9] ;  T3__elab_bool
   98| 00019E F7                                        
   98| 00019F 56                          PUSH   ESI    
   98| 0001A0 6A                          PUSH   0      
   98| 0001A1 00                                        
   98| 0001A2 8D7D                        LEA    EDI, [EBP-44] ;  T3
   98| 0001A4 D4                                        
   98| 0001A5 57                          PUSH   EDI    
   98| 0001A6 6A                          PUSH   0      
   98| 0001A7 00                                        
   98| 0001A8 68                          PUSH   lab4.t3__body 
   98| 0001A9 00000000                                  
   98| 0001AD 8D95                        LEA    EDX, [EBP-240] ;  master_record
   98| 0001AF 10FFFFFF                                  
   98| 0001B3 52                          PUSH   EDX    
   98| 0001B4 8D85                        LEA    EAX, [EBP-148] ;  activation_list
   98| 0001B6 6CFFFFFF                                  
   98| 0001BA 50                          PUSH   EAX    
   98| 0001BB 6A                          PUSH   0      
   98| 0001BC 00                                        
   98| 0001BD E8                          CALL   rts_initialize_task_with_name 
   98| 0001BE 00000000                                  
;  Source Line # 99
   99| 0001C2 C645                        MOV    BYTE PTR [EBP-8], 0 ;  T4__elab_bool
   99| 0001C4 F8                                        
   99| 0001C5 00                                        
   99| 0001C6 68                          PUSH   __lcl.00000239 
   99| 0001C7 00000000                                  
   99| 0001CB 6A                          PUSH   0      
   99| 0001CC 00                                        
   99| 0001CD 8D5D                        LEA    EBX, [EBP-8] ;  T4__elab_bool
   99| 0001CF F8                                        
   99| 0001D0 53                          PUSH   EBX    
   99| 0001D1 6A                          PUSH   0      
   99| 0001D2 00                                        
   99| 0001D3 8D4D                        LEA    ECX, [EBP-28] ;  T4
   99| 0001D5 E4                                        
   99| 0001D6 51                          PUSH   ECX    
   99| 0001D7 6A                          PUSH   0      
   99| 0001D8 00                                        
   99| 0001D9 68                          PUSH   lab4.t4__body 
   99| 0001DA 00000000                                  
   99| 0001DE 8DB5                        LEA    ESI, [EBP-240] ;  master_record
   99| 0001E0 10FFFFFF                                  
   99| 0001E4 56                          PUSH   ESI    
   99| 0001E5 8DBD                        LEA    EDI, [EBP-148] ;  activation_list
   99| 0001E7 6CFFFFFF                                  
   99| 0001EB 57                          PUSH   EDI    
   99| 0001EC 6A                          PUSH   0      
   99| 0001ED 00                                        
   99| 0001EE E8                          CALL   rts_initialize_task_with_name 
   99| 0001EF 00000000                                  
;  Source Line # 102
  102| 0001F3 C645                        MOV    BYTE PTR [EBP-11], 1 ;  T1__elab_bool
  102| 0001F5 F5                                        
  102| 0001F6 01                                        
;  Source Line # 134
  134| 0001F7 C645                        MOV    BYTE PTR [EBP-10], 1 ;  T2__elab_bool
  134| 0001F9 F6                                        
  134| 0001FA 01                                        
;  Source Line # 162
  162| 0001FB C645                        MOV    BYTE PTR [EBP-9], 1 ;  T3__elab_bool
  162| 0001FD F7                                        
  162| 0001FE 01                                        
;  Source Line # 194
  194| 0001FF C645                        MOV    BYTE PTR [EBP-8], 1 ;  T4__elab_bool
  194| 000201 F8                                        
  194| 000202 01                                        
;  Source Line # 229
  229| 000203 8D95                        LEA    EDX, [EBP-148] ;  activation_list
  229| 000205 6CFFFFFF                                  
  229| 000209 52                          PUSH   EDX    
  229| 00020A E8                          CALL   rts_activate_tasks 
  229| 00020B 00000000                                  
  229| 00020F 8D85                        LEA    EAX, [EBP-240] ;  master_record
  229| 000211 10FFFFFF                                  
  229| 000215 50                          PUSH   EAX    
  229| 000216 E8                          CALL   rts_finalize_and_pop 
  229| 000217 00000000                                  
  229| 00021B 8D9D                        LEA    EBX, [EBP-256] ;  dyn_temp
  229| 00021D 00FFFFFF                                  
  229| 000221 53                          PUSH   EBX    
  229| 000222 E8                          CALL   rts_ss_release 
  229| 000223 00000000                                  
;  Source Line # 231
  231| 000227 8B95                        MOV    EDX, [EBP-268] ; Spill
  231| 000229 F4FEFFFF                                  
  231| 00022D 8B4D                        MOV    ECX, [EBP-4] 
  231| 00022F FC                                        
  231| 000230 894A                        MOV    [EDX+48], ECX 
  231| 000232 30                                        
  231| 000233 8BE5                        MOV    ESP, EBP 
  231| 000235 5D                          POP    EBP    
  231| 000236 C3                          RET           
                       ;                                
                       lab4               ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000247     DD     00000F01 
                                          DD     0000000D 
                                          DD     lab4   
                                          DD     __lcl.00000260 
                                          DD     0000000E 
                                          DD     lab4+00000023H 
                                          DD     __lcl.00000260 
                                          DD     00000015 
                                          DD     lab4+000000A0H 
                                          DD     __lcl.00000260 
                                          DD     00000030 
                                          DD     lab4+0000011FH 
                                          DD     __lcl.00000260 
                                          DD     00000060 
                                          DD     lab4+00000123H 
                                          DD     __lcl.00000260 
                                          DD     00000061 
                                          DD     lab4+00000160H 
                                          DD     __lcl.00000260 
                                          DD     00000062 
                                          DD     lab4+00000191H 
                                          DD     __lcl.00000260 
                                          DD     00000063 
                                          DD     lab4+000001C2H 
                                          DD     __lcl.00000260 
                                          DD     00000066 
                                          DD     lab4+000001F3H 
                                          DD     __lcl.00000260 
                                          DD     00000086 
                                          DD     lab4+000001F7H 
                                          DD     __lcl.00000260 
                                          DD     000000A2 
                                          DD     lab4+000001FBH 
                                          DD     __lcl.00000260 
                                          DD     000000C2 
                                          DD     lab4+000001FFH 
                                          DD     __lcl.00000260 
                                          DD     000000E5 
                                          DD     lab4+00000203H 
                                          DD     __lcl.00000260 
                                          DD     000000E7 
                                          DD     lab4+00000227H 
                                          DD     __lcl.00000260 
                                          DD     000000E7 
                                          DD     lab4+00000233H 
                                          DD     __lcl.00000260 
; ********* End of segment, Total Size = 184


; ************* Initialized part of the global segment :
                                          ALIGN 4       
     000000            __lcl.00000239     DB     'Lab4.T4' 
                                          DB     00H    
     000008            __lcl.00000238     DB     'Lab4.T3' 
                                          DB     00H    
     000010            __lcl.00000237     DB     'Lab4.T2' 
                                          DB     00H    
     000018            __lcl.00000236     DB     'Lab4.T1' 
                                          DB     00H    
     000020            __lcl.00000231     DD     00000001 
                                          DD     00000007 
     000028            __lcl.00000230     DB     'T4 stop' 
                                          DB     00     
     000030            __lcl.00000229     DD     00000001 
                                          DD     0000000D 
     000038            __lcl.00000228     DB     '             ' 
                                          DB     00H,00H,00H 
     000048            __lcl.00000210     DD     00000001 
                                          DD     00000008 
     000050            __lcl.00000209     DB     'T4 start' 
     000058            __lcl.00000204     DD     00000001 
                                          DD     00000007 
     000060            __lcl.00000203     DB     'T3 stop' 
                                          DB     00     
     000068            __lcl.00000185     DD     00000001 
                                          DD     00000008 
     000070            __lcl.00000184     DB     'T3 start' 
     000078            __lcl.00000179     DD     00000001 
                                          DD     00000007 
     000080            __lcl.00000178     DB     'T2 stop' 
                                          DB     00     
     000088            __lcl.00000160     DD     00000001 
                                          DD     00000008 
     000090            __lcl.00000159     DB     'T2 start' 
     000098            __lcl.00000153     DD     00000001 
                                          DD     00000007 
     0000A0            __lcl.00000152     DB     'T1 stop' 
                                          DB     00     
     0000A8            __lcl.00000133     DD     00000001 
                                          DD     00000008 
     0000B0            __lcl.00000132     DB     'T1 start' 
     0000B8            lab4.monitor__protected_type_desc DB 01 
                                          DB     3 DUP(00) 
                                          DD     00000001 
                                          DD     00000000 
                                          DB     01     
                                          DB     3 DUP(00) 
                                          DD     00000018 
                                          DD     lab4.monitor__all_barriers 
                                          DD     lab4.monitor.inputsynchro 
                                          DD     lab4.monitor.outputsynchro 
; ********* End of segment, Total Size = 216


; ************* .av_dbgr segment :
                                          ALIGN 4       
                                          DD     00000000 
                                          DD     00000000 
     000008            lab4__rootpart____1 DD    lab4__subp_body_subpdesc____1 
; ********* End of segment, Total Size = 16


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000246     DB     04H    
                                          DB     'Lab4' 
                                          DB     00H,00H,00H 
     000008            lab4__subp_body_subpdesc____1 DD __lcl.00000246 
                                          DD     00000001 
                                          DD     __lcl.00000106 
                                          DD     0000000D 
                                          DD     000000E5 
                                          DD     000000E7 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000240 
                                          DD     __lcl.00000241 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000242 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000247 
                                          DD     0000010C 
                                          DD     __lcl.00000001 
     00006C            __lcl.00000245     DB     02H    
                                          DB     'MZ'   
                                          DB     00     
     000070            __lcl.00000244     DB     02H    
                                          DB     'MA'   
                                          DB     00     
     000074            __lcl.00000243     DB     02H    
                                          DB     'MB'   
                                          DB     00     
     000078            __lcl.00000242     DD     00000008 
                                          DD     __lcl.00000131 
                                          DD     __lcl.00000130 
                                          DD     FFFFFFE4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000129 
                                          DD     __lcl.00000128 
                                          DD     FFFFFFD4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000126 
                                          DD     FFFFFFC4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000125 
                                          DD     __lcl.00000124 
                                          DD     FFFFFFB4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000041 
                                          DD     __lcl.00000040 
                                          DD     FFFFFF48 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000243 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF0C 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000244 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF08 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000245 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF04 
                                          DD     00000103 
                                          DD     00000000 
     00011C            __lcl.00000241     DD     00000005 
                                          DD     lab4.monitor__protected_body_subpdesc____1 
                                          DD     lab4.t1__task_subpdesc____1 
                                          DD     lab4.t2__task_subpdesc____1 
                                          DD     lab4.t3__task_subpdesc____1 
                                          DD     lab4.t4__task_subpdesc____1 
     000134            __lcl.00000240     DD     00000005 
                                          DD     __lcl.00000131 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000129 
                                          DD     __lcl.00000128 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000126 
                                          DD     __lcl.00000125 
                                          DD     __lcl.00000124 
                                          DD     __lcl.00000041 
                                          DD     __lcl.00000040 
     000160            lab4.t4__task_subpdesc____1 DD __lcl.00000131 
                                          DD     0000000E 
                                          DD     __lcl.00000106 
                                          DD     000000C2 
                                          DD     000000C5 
                                          DD     000000E3 
                                          DD     00000002 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000232 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000235 
                                          DD     __lcl.00000130 
                                          DD     00000000 
                                          DD     __lcl.00000248 
                                          DD     0000003C 
                                          DD     __lcl.00000001 
     0001C4            __lcl.00000235     DD     00000001 
                                          DD     __lcl.00000227 
     0001CC            __lcl.00000234     DB     03H    
                                          DB     'MC4'  
     0001D0            __lcl.00000233     DB     05H    
                                          DB     'alfa4' 
                                          DW     0000   
     0001D8            __lcl.00000232     DD     00000003 
                                          DD     __lcl.00000233 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFD8 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000234 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFD4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000157 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFCC 
                                          DD     00000003 
                                          DD     00000000 
     000218            __lcl.00000227     DB     8 DUP(00) 
                                          DD     __lcl.00000106 
                                          DD     000000D3 
                                          DD     000000D3 
                                          DD     000000DB 
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
                                          DD     __lcl.00000225 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000226 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00027C            __lcl.00000226     DD     00000001 
                                          DD     __lcl.00000224 
     000284            __lcl.00000225     DD     00000001 
                                          DD     __lcl.00000117 
                                          DD     __lcl.00000213 
                                          DD     FFFFFFE8 
                                          DD     00000003 
                                          DD     00000001 
     00029C            __lcl.00000224     DB     8 DUP(00) 
                                          DD     __lcl.00000106 
                                          DD     000000D4 
                                          DD     000000D4 
                                          DD     000000DA 
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
     000300            __lcl.00000223     DD     00000001 
                                          DD     __lcl.00000221 
     000308            __lcl.00000222     DD     00000001 
                                          DD     __lcl.00000114 
                                          DD     __lcl.00000216 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     000320            __lcl.00000221     DB     8 DUP(00) 
                                          DD     __lcl.00000106 
                                          DD     000000D6 
                                          DD     000000D6 
                                          DD     000000D8 
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
                                          DD     __lcl.00000220 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000384            __lcl.00000220     DD     00000001 
                                          DD     __lcl.00000144 
                                          DD     __lcl.00000219 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     00039C            __lcl.00000219     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000217 
                                          DD     __lcl.00000218 
     0003B8            __lcl.00000218     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     0003C4            __lcl.00000217     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0003D0            __lcl.00000216     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000214 
                                          DD     __lcl.00000215 
     0003EC            __lcl.00000215     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     0003F8            __lcl.00000214     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     000404            __lcl.00000213     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000211 
                                          DD     __lcl.00000212 
     000420            __lcl.00000212     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE4 
     00042C            __lcl.00000211     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000438            lab4.t3__task_subpdesc____1 DD __lcl.00000129 
                                          DD     0000000D 
                                          DD     __lcl.00000106 
                                          DD     000000A2 
                                          DD     000000A5 
                                          DD     000000BF 
                                          DD     00000002 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000205 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000208 
                                          DD     __lcl.00000128 
                                          DD     00000000 
                                          DD     __lcl.00000249 
                                          DD     00000040 
                                          DD     __lcl.00000001 
     00049C            __lcl.00000208     DD     00000001 
                                          DD     __lcl.00000202 
     0004A4            __lcl.00000207     DB     03H    
                                          DB     'MC3'  
     0004A8            __lcl.00000206     DB     05H    
                                          DB     'alfa3' 
                                          DW     0000   
     0004B0            __lcl.00000205     DD     00000003 
                                          DD     __lcl.00000206 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFD4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000207 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFD0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000157 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFC8 
                                          DD     00000003 
                                          DD     00000000 
     0004F0            __lcl.00000202     DB     8 DUP(00) 
                                          DD     __lcl.00000106 
                                          DD     000000B2 
                                          DD     000000B2 
                                          DD     000000BA 
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
                                          DD     __lcl.00000200 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000201 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000554            __lcl.00000201     DD     00000001 
                                          DD     __lcl.00000199 
     00055C            __lcl.00000200     DD     00000001 
                                          DD     __lcl.00000117 
                                          DD     __lcl.00000188 
                                          DD     FFFFFFE8 
                                          DD     00000003 
                                          DD     00000001 
     000574            __lcl.00000199     DB     8 DUP(00) 
                                          DD     __lcl.00000106 
                                          DD     000000B3 
                                          DD     000000B3 
                                          DD     000000B9 
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
                                          DD     __lcl.00000197 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000198 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0005D8            __lcl.00000198     DD     00000001 
                                          DD     __lcl.00000196 
     0005E0            __lcl.00000197     DD     00000001 
                                          DD     __lcl.00000114 
                                          DD     __lcl.00000191 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     0005F8            __lcl.00000196     DB     8 DUP(00) 
                                          DD     __lcl.00000106 
                                          DD     000000B5 
                                          DD     000000B5 
                                          DD     000000B7 
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
                                          DD     __lcl.00000195 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00065C            __lcl.00000195     DD     00000001 
                                          DD     __lcl.00000144 
                                          DD     __lcl.00000194 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000674            __lcl.00000194     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000192 
                                          DD     __lcl.00000193 
     000690            __lcl.00000193     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     00069C            __lcl.00000192     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0006A8            __lcl.00000191     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000189 
                                          DD     __lcl.00000190 
     0006C4            __lcl.00000190     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     0006D0            __lcl.00000189     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     0006DC            __lcl.00000188     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000186 
                                          DD     __lcl.00000187 
     0006F8            __lcl.00000187     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE4 
     000704            __lcl.00000186     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000710            lab4.t2__task_subpdesc____1 DD __lcl.00000127 
                                          DD     0000000C 
                                          DD     __lcl.00000106 
                                          DD     00000086 
                                          DD     00000089 
                                          DD     0000009F 
                                          DD     00000002 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000180 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000183 
                                          DD     __lcl.00000126 
                                          DD     00000000 
                                          DD     __lcl.00000250 
                                          DD     00000040 
                                          DD     __lcl.00000001 
     000774            __lcl.00000183     DD     00000001 
                                          DD     __lcl.00000177 
     00077C            __lcl.00000182     DB     03H    
                                          DB     'MC2'  
     000780            __lcl.00000181     DB     05H    
                                          DB     'alfa2' 
                                          DW     0000   
     000788            __lcl.00000180     DD     00000003 
                                          DD     __lcl.00000181 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFD4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000182 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFD0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000157 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFC8 
                                          DD     00000003 
                                          DD     00000000 
     0007C8            __lcl.00000177     DB     8 DUP(00) 
                                          DD     __lcl.00000106 
                                          DD     00000092 
                                          DD     00000092 
                                          DD     0000009A 
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
                                          DD     __lcl.00000175 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000176 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00082C            __lcl.00000176     DD     00000001 
                                          DD     __lcl.00000174 
     000834            __lcl.00000175     DD     00000001 
                                          DD     __lcl.00000117 
                                          DD     __lcl.00000163 
                                          DD     FFFFFFE8 
                                          DD     00000003 
                                          DD     00000001 
     00084C            __lcl.00000174     DB     8 DUP(00) 
                                          DD     __lcl.00000106 
                                          DD     00000093 
                                          DD     00000093 
                                          DD     00000099 
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
                                          DD     __lcl.00000172 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000173 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0008B0            __lcl.00000173     DD     00000001 
                                          DD     __lcl.00000171 
     0008B8            __lcl.00000172     DD     00000001 
                                          DD     __lcl.00000114 
                                          DD     __lcl.00000166 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     0008D0            __lcl.00000171     DB     8 DUP(00) 
                                          DD     __lcl.00000106 
                                          DD     00000095 
                                          DD     00000095 
                                          DD     00000097 
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
                                          DD     __lcl.00000170 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000934            __lcl.00000170     DD     00000001 
                                          DD     __lcl.00000144 
                                          DD     __lcl.00000169 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     00094C            __lcl.00000169     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000167 
                                          DD     __lcl.00000168 
     000968            __lcl.00000168     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000974            __lcl.00000167     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000980            __lcl.00000166     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000164 
                                          DD     __lcl.00000165 
     00099C            __lcl.00000165     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     0009A8            __lcl.00000164     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     0009B4            __lcl.00000163     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000161 
                                          DD     __lcl.00000162 
     0009D0            __lcl.00000162     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE4 
     0009DC            __lcl.00000161     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0009E8            lab4.t1__task_subpdesc____1 DD __lcl.00000125 
                                          DD     0000000B 
                                          DD     __lcl.00000106 
                                          DD     00000066 
                                          DD     0000006A 
                                          DD     00000083 
                                          DD     00000002 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000154 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000158 
                                          DD     __lcl.00000124 
                                          DD     00000000 
                                          DD     __lcl.00000251 
                                          DD     0000003C 
                                          DD     __lcl.00000001 
     000A4C            __lcl.00000158     DD     00000001 
                                          DD     __lcl.00000151 
     000A54            __lcl.00000157     DB     04H    
                                          DB     'Sum1' 
                                          DB     00H,00H,00H 
     000A5C            __lcl.00000156     DB     03H    
                                          DB     'MC1'  
     000A60            __lcl.00000155     DB     05H    
                                          DB     'alfa1' 
                                          DW     0000   
     000A68            __lcl.00000154     DD     00000003 
                                          DD     __lcl.00000155 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFD8 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000156 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFD4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000157 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFCC 
                                          DD     00000003 
                                          DD     00000000 
     000AA8            __lcl.00000151     DB     8 DUP(00) 
                                          DD     __lcl.00000106 
                                          DD     00000076 
                                          DD     00000076 
                                          DD     0000007E 
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
                                          DD     __lcl.00000149 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000150 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000B0C            __lcl.00000150     DD     00000001 
                                          DD     __lcl.00000148 
     000B14            __lcl.00000149     DD     00000001 
                                          DD     __lcl.00000117 
                                          DD     __lcl.00000136 
                                          DD     FFFFFFEC 
                                          DD     00000003 
                                          DD     00000001 
     000B2C            __lcl.00000148     DB     8 DUP(00) 
                                          DD     __lcl.00000106 
                                          DD     00000077 
                                          DD     00000077 
                                          DD     0000007D 
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
                                          DD     __lcl.00000146 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000147 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000B90            __lcl.00000147     DD     00000001 
                                          DD     __lcl.00000145 
     000B98            __lcl.00000146     DD     00000001 
                                          DD     __lcl.00000114 
                                          DD     __lcl.00000139 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     000BB0            __lcl.00000145     DB     8 DUP(00) 
                                          DD     __lcl.00000106 
                                          DD     00000079 
                                          DD     00000079 
                                          DD     0000007B 
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
                                          DD     __lcl.00000143 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000C14            __lcl.00000144     DB     01H    
                                          DB     'z'    
                                          DW     0000   
     000C18            __lcl.00000143     DD     00000001 
                                          DD     __lcl.00000144 
                                          DD     __lcl.00000142 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000C30            __lcl.00000142     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000140 
                                          DD     __lcl.00000141 
     000C4C            __lcl.00000141     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000C58            __lcl.00000140     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000C64            __lcl.00000139     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000137 
                                          DD     __lcl.00000138 
     000C80            __lcl.00000138     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     000C8C            __lcl.00000137     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000C98            __lcl.00000136     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000134 
                                          DD     __lcl.00000135 
     000CB4            __lcl.00000135     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE8 
     000CC0            __lcl.00000134     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000CCC            __lcl.00000131     DB     02H    
                                          DB     'T4'   
                                          DB     00     
     000CD0            __lcl.00000130     DD     __lcl.00000131 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     000CE0            __lcl.00000129     DB     02H    
                                          DB     'T3'   
                                          DB     00     
     000CE4            __lcl.00000128     DD     __lcl.00000129 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     000CF4            __lcl.00000127     DB     02H    
                                          DB     'T2'   
                                          DB     00     
     000CF8            __lcl.00000126     DD     __lcl.00000127 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     000D08            __lcl.00000125     DB     02H    
                                          DB     'T1'   
                                          DB     00     
     000D0C            __lcl.00000124     DD     __lcl.00000125 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     000D1C            lab4.monitor__protected_body_subpdesc____1 DD __lcl.00000041 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000106 
                                          DD     00000030 
                                          DD     00000030 
                                          DD     0000005B 
                                          DD     00000005 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000123 
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
     000D80            __lcl.00000123     DD     00000008 
                                          DD     lab4.monitor.input__subp_body_subpdesc____1 
                                          DD     lab4.monitor.endñount__subp_body_subpdesc____1
                                          DD     lab4.monitor.setmc__subp_body_subpdesc____1 
                                          DD     lab4.monitor.getmc__subp_body_subpdesc____1 
                                          DD     lab4.monitor.setalfa__subp_body_subpdesc____1 
                                          DD     lab4.monitor.getalfa__subp_body_subpdesc____1 
                                          DD     lab4.monitor.
inputsynchro__subp_body_subpdesc____1                   
                                          DD     lab4.monitor.
outputsynchro__subp_body_subpdesc____1                  
     000DA4            lab4.monitor.outputsynchro__subp_body_subpdesc____1 DD __lcl.00000033 
                                          DD     00000009 
                                          DD     __lcl.00000106 
                                          DD     00000057 
                                          DD     00000058 
                                          DD     0000005A 
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
                                          DD     __lcl.00000252 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000E08            lab4.monitor.inputsynchro__subp_body_subpdesc____1 DD __lcl.00000032 
                                          DD     00000008 
                                          DD     __lcl.00000106 
                                          DD     00000052 
                                          DD     00000053 
                                          DD     00000055 
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
                                          DD     __lcl.00000253 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000E6C            lab4.monitor.getalfa__subp_body_subpdesc____1 DD __lcl.00000039 
                                          DD     00000007 
                                          DD     __lcl.00000106 
                                          DD     0000004D 
                                          DD     0000004E 
                                          DD     00000050 
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
                                          DD     __lcl.00000254 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000ED0            lab4.monitor.setalfa__subp_body_subpdesc____1 DD __lcl.00000038 
                                          DD     00000006 
                                          DD     __lcl.00000106 
                                          DD     00000049 
                                          DD     0000004A 
                                          DD     0000004C 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000122 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000255 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000F34            __lcl.00000122     DD     00000001 
                                          DD     __lcl.00000029 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00010000 
                                          DB     4 DUP(00) 
                                          DD     0000000C 
     000F50            lab4.monitor.getmc__subp_body_subpdesc____1 DD __lcl.00000037 
                                          DD     00000005 
                                          DD     __lcl.00000106 
                                          DD     00000044 
                                          DD     00000045 
                                          DD     00000047 
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
                                          DD     __lcl.00000256 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000FB4            lab4.monitor.setmc__subp_body_subpdesc____1 DD __lcl.00000036 
                                          DD     00000004 
                                          DD     __lcl.00000106 
                                          DD     0000003C 
                                          DD     0000003D 
                                          DD     00000043 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000120 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000121 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000257 
                                          DD     00000010 
                                          DD     __lcl.00000001 
     001018            __lcl.00000121     DD     00000001 
                                          DD     __lcl.00000119 
     001020            __lcl.00000120     DD     00000001 
                                          DD     __lcl.00000029 
                                          DD     __lcl.00000018 
                                          DD     00000000 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     0000000C 
     00103C            __lcl.00000119     DB     8 DUP(00) 
                                          DD     __lcl.00000106 
                                          DD     0000003E 
                                          DD     0000003E 
                                          DD     00000042 
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
                                          DD     __lcl.00000116 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000118 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0010A0            __lcl.00000118     DD     00000001 
                                          DD     __lcl.00000115 
     0010A8            __lcl.00000117     DB     01H    
                                          DB     'i'    
                                          DW     0000   
     0010AC            __lcl.00000116     DD     00000001 
                                          DD     __lcl.00000117 
                                          DD     __lcl.00000109 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     0010C4            __lcl.00000115     DB     8 DUP(00) 
                                          DD     __lcl.00000106 
                                          DD     0000003F 
                                          DD     0000003F 
                                          DD     00000041 
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
                                          DD     __lcl.00000113 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001128            __lcl.00000114     DB     01H    
                                          DB     'j'    
                                          DW     0000   
     00112C            __lcl.00000113     DD     00000001 
                                          DD     __lcl.00000114 
                                          DD     __lcl.00000112 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     001144            __lcl.00000112     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000110 
                                          DD     __lcl.00000111 
     001160            __lcl.00000111     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     00116C            __lcl.00000110     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001178            __lcl.00000109     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000107 
                                          DD     __lcl.00000108 
     001194            __lcl.00000108     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     0011A0            __lcl.00000107     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0011AC            lab4.monitor.endñount__subp_body_subpdesc____1 DD __lcl.00000035 
                                          DD     00000003 
                                          DD     __lcl.00000106 
                                          DD     00000037 
                                          DD     00000038 
                                          DD     0000003A 
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
                                          DD     __lcl.00000258 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001210            __lcl.00000106     DB     0BH    
                                          DB     '..\lab4.adb' 
     00121C            lab4.monitor.input__subp_body_subpdesc____1 DD __lcl.00000034 
                                          DD     00000002 
                                          DD     __lcl.00000106 
                                          DD     00000032 
                                          DD     00000033 
                                          DD     00000035 
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
                                          DD     __lcl.00000259 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001280            __lcl.00000105     DB     0CH    
                                          DB     'Pr_Type_Desc' 
                                          DB     00H,00H,00H 
     001290            __lcl.00000104     DD     __lcl.00000105 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     __lcl.00000096 
                                          DD     00000000 
     0012A8            __lcl.00000103     DB     10H    
                                          DB     'Compute_Barriers' 
                                          DB     00H,00H,00H 
     0012BC            __lcl.00000102     DB     14H    
                                          DB     'Compute_All_Barriers' 
                                          DB     00H,00H,00H 
     0012D4            __lcl.00000101     DB     0AH    
                                          DB     'Entry_Code' 
                                          DB     00     
     0012E0            __lcl.00000100     DB     10H    
                                          DB     'Depends_On_Count' 
                                          DB     00H,00H,00H 
     0012F4            __lcl.00000099     DB     0CH    
                                          DB     'Handler_List' 
                                          DB     00H,00H,00H 
     001304            __lcl.00000098     DB     0EH    
                                          DB     'Max_Name_Index' 
                                          DB     00     
     001314            __lcl.00000097     DB     07H    
                                          DB     'PT_Kind' 
     00131C            __lcl.00000096     DD     00000007 
                                          DD     __lcl.00000097 
                                          DD     __lcl.00000049 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
                                          DD     00000000 
                                          DD     __lcl.00000098 
                                          DD     __lcl.00000053 
                                          DD     00000004 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
                                          DD     00000000 
                                          DD     __lcl.00000099 
                                          DD     __lcl.00000074 
                                          DD     00000008 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000100 
                                          DD     __lcl.00000080 
                                          DD     0000000C 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000079 
                                          DD     __lcl.00000101 
                                          DD     __lcl.00000083 
                                          DD     00000010 
                                          DD     00000000 
                                          DD     __lcl.00000087 
                                          DD     00000200 
                                          DD     __lcl.00000079 
                                          DD     __lcl.00000102 
                                          DD     __lcl.00000062 
                                          DD     00000014 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000089 
                                          DD     __lcl.00000103 
                                          DD     __lcl.00000083 
                                          DD     00000014 
                                          DD     00000000 
                                          DD     __lcl.00000094 
                                          DD     00000100 
                                          DD     __lcl.00000091 
     0013E4            __lcl.00000095     DD     __lcl.00000079 
                                          DD     00000001 
                                          DD     00000000 
     0013F0            __lcl.00000094     DD     00000001 
                                          DD     __lcl.00000092 
                                          DD     __lcl.00000093 
     0013FC            __lcl.00000093     DD     00000001 
                                          DD     00000002 
     001404            __lcl.00000092     DD     00000000 
                                          DD     00000000 
     00140C            __lcl.00000091     DD     __lcl.00000079 
                                          DD     00000001 
                                          DD     __lcl.00000090 
     001418            __lcl.00000090     DD     00000000 
                                          DD     00000000 
                                          DD     00000002 
     001424            __lcl.00000089     DD     __lcl.00000079 
                                          DD     00000001 
                                          DD     __lcl.00000088 
     001430            __lcl.00000088     DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
     00143C            __lcl.00000087     DD     00000001 
                                          DD     __lcl.00000085 
                                          DD     __lcl.00000086 
     001448            __lcl.00000086     DD     00000001 
                                          DD     00000002 
     001450            __lcl.00000085     DD     00000000 
                                          DD     00000000 
     001458            __lcl.00000084     DB     0AH    
                                          DB     'Code_Array' 
                                          DB     00     
     001464            __lcl.00000083     DD     __lcl.00000084 
                                          DD     00000011 
                                          DD     0000000E 
                                          DD     __lcl.00000082 
                                          DD     __lcl.00000062 
                                          DD     __lcl.00000081 
     00147C            __lcl.00000082     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     001488            __lcl.00000081     DD     00000001 
                                          DD     __lcl.00000053 
     001490            __lcl.00000080     DB     4 DUP(00) 
                                          DD     00000001 
                                          DD     00000002 
     00149C            __lcl.00000079     DD     00000000 
                                          DD     00000001 
                                          DD     __lcl.00000078 
     0014A8            __lcl.00000078     DD     00000000 
                                          DD     00000001 
                                          DD     00000001 
                                          DD     00000002 
     0014B8            __lcl.00000077     DD     00000000 
                                          DD     00000001 
                                          DD     __lcl.00000076 
     0014C4            __lcl.00000076     DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
     0014D0            __lcl.00000075     DB     13H    
                                          DB     'Handler_List_Access' 
     0014E4            __lcl.00000074     DD     __lcl.00000075 
                                          DD     00000003 
                                          DD     0000000D 
                                          DD     __lcl.00000072 
     0014F4            __lcl.00000073     DB     11H    
                                          DB     'Handler_List_Type' 
                                          DW     0000   
     001508            __lcl.00000072     DD     __lcl.00000073 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     __lcl.00000069 
                                          DD     00000000 
     001520            __lcl.00000071     DB     07H    
                                          DB     'Handler' 
     001528            __lcl.00000070     DB     0CH    
                                          DB     'Num_Handlers' 
                                          DB     00H,00H,00H 
     001538            __lcl.00000069     DD     00000002 
                                          DD     __lcl.00000070 
                                          DD     __lcl.00000057 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
                                          DD     00000000 
                                          DD     __lcl.00000071 
                                          DD     __lcl.00000064 
                                          DD     00000004 
                                          DD     00000000 
                                          DD     __lcl.00000068 
                                          DD     00000100 
                                          DD     00000000 
     001574            __lcl.00000068     DD     00000001 
                                          DD     __lcl.00000066 
                                          DD     __lcl.00000067 
     001580            __lcl.00000067     DD     00000001 
                                          DD     00000001 
     001588            __lcl.00000066     DD     00000000 
                                          DD     00000001 
     001590            __lcl.00000065     DB     0DH    
                                          DB     'Handler_Array' 
                                          DW     0000   
     0015A0            __lcl.00000064     DD     __lcl.00000065 
                                          DD     00000011 
                                          DD     0000000E 
                                          DD     __lcl.00000059 
                                          DD     __lcl.00000062 
                                          DD     __lcl.00000058 
     0015B8            __lcl.00000063     DB     0CH    
                                          DB     'Code_Address' 
                                          DB     00H,00H,00H 
     0015C8            __lcl.00000062     DD     __lcl.00000063 
                                          DD     00000003 
                                          DD     0000000D 
                                          DD     __lcl.00000060 
     0015D8            __lcl.00000061     DB     0AH    
                                          DB     'Raw_Object' 
                                          DB     00     
     0015E4            __lcl.00000060     DD     __lcl.00000061 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     00000000 
     0015FC            __lcl.00000059     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     001608            __lcl.00000058     DD     00000001 
                                          DD     __lcl.00000057 
     001610            __lcl.00000057     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000054 
                                          DD     __lcl.00000055 
                                          DD     __lcl.00000056 
     00162C            __lcl.00000056     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     001638            __lcl.00000055     DD     00000008 
                                          DD     00000003 
                                          DD     00000000 
     001644            __lcl.00000054     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     001650            __lcl.00000053     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000050 
                                          DD     __lcl.00000051 
                                          DD     __lcl.00000052 
     00166C            __lcl.00000052     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     001678            __lcl.00000051     DD     00000008 
                                          DD     00000003 
                                          DD     00000000 
     001684            __lcl.00000050     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     001690            __lcl.00000049     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000046 
                                          DD     __lcl.00000047 
                                          DD     __lcl.00000048 
     0016AC            __lcl.00000048     DD     00000003 
                                          DD     00000001 
                                          DB     02     
                                          DB     00H,00H,00H 
     0016B8            __lcl.00000047     DD     00000003 
                                          DD     00000001 
                                          DB     00     
                                          DB     00H,00H,00H 
     0016C4            __lcl.00000046     DB     4 DUP(00) 
                                          DD     00000005 
                                          DD     00000003 
                                          DD     00000003 
                                          DD     __lcl.00000042 
     0016D8            __lcl.00000045     DB     08H    
                                          DB     'PT_Large' 
                                          DB     00H,00H,00H 
     0016E4            __lcl.00000044     DB     08H    
                                          DB     'PT_Small' 
                                          DB     00H,00H,00H 
     0016F0            __lcl.00000043     DB     0DH    
                                          DB     'PT_No_Entries' 
                                          DW     0000   
     001700            __lcl.00000042     DD     __lcl.00000043 
                                          DD     00000000 
                                          DD     __lcl.00000044 
                                          DD     00000001 
                                          DD     __lcl.00000045 
                                          DD     00000002 
     001718            __lcl.00000041     DB     07H    
                                          DB     'Monitor' 
     001720            __lcl.00000040     DD     __lcl.00000041 
                                          DD     00000020 
                                          DD     __lcl.00000023 
                                          DD     __lcl.00000031 
     001730            __lcl.00000039     DB     07H    
                                          DB     'GetAlfa' 
     001738            __lcl.00000038     DB     07H    
                                          DB     'SetAlfa' 
     001740            __lcl.00000037     DB     05H    
                                          DB     'GetMC' 
                                          DW     0000   
     001748            __lcl.00000036     DB     05H    
                                          DB     'SetMC' 
                                          DW     0000   
     001750            __lcl.00000035     DB     08H    
                                          DB     'End'  
                                          DB     D1H    
                                          DB     'ount' 
                                          DB     00H,00H,00H 
     00175C            __lcl.00000034     DB     05H    
                                          DB     'Input' 
                                          DW     0000   
     001764            __lcl.00000033     DB     0DH    
                                          DB     'OutputSynchro' 
                                          DW     0000   
     001774            __lcl.00000032     DB     0CH    
                                          DB     'InputSynchro' 
                                          DB     00H,00H,00H 
     001784            __lcl.00000031     DD     00000008 
                                          DD     __lcl.00000032 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000033 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000034 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000035 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000036 
                                          DD     00000000 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000037 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000038 
                                          DD     00000000 
                                          DD     __lcl.00000030 
                                          DD     __lcl.00000039 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0017E8            __lcl.00000030     DD     00000001 
                                          DD     __lcl.00000029 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     00010000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     001804            __lcl.00000029     DB     01H    
                                          DB     'M'    
                                          DW     0000   
     001808            __lcl.00000028     DD     00000001 
                                          DD     __lcl.00000029 
                                          DD     __lcl.00000018 
                                          DB     4 DUP(00) 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     001824            __lcl.00000027     DB     04H    
                                          DB     'alfa' 
                                          DB     00H,00H,00H 
     00182C            __lcl.00000026     DB     02H    
                                          DB     'MC'   
                                          DB     00     
     001830            __lcl.00000025     DB     02H    
                                          DB     'F2'   
                                          DB     00     
     001834            __lcl.00000024     DB     02H    
                                          DB     'F1'   
                                          DB     00     
     001838            __lcl.00000023     DD     00000004 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000005 
                                          DD     00000044 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000025 
                                          DD     __lcl.00000005 
                                          DD     00000048 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000026 
                                          DD     __lcl.00000018 
                                          DD     00000050 
                                          DD     00000000 
                                          DD     __lcl.00000022 
                                          DD     00000100 
                                          DD     00000000 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000005 
                                          DD     0000004C 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
     0018AC            __lcl.00000022     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000021 
     0018B8            __lcl.00000021     DD     00000002 
                                          DD     package1.matr__constrained_array____1 
     0018C0            __lcl.00000020     DD     00000000 
                                          DD     00000001 
     0018C8            __lcl.00000019     DB     04H    
                                          DB     'Matr' 
                                          DB     00H,00H,00H 
     0018D0            __lcl.00000018     DD     __lcl.00000019 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000010 
                                          DD     __lcl.00000016 
                                          DD     __lcl.00000009 
     0018E8            __lcl.00000017     DB     03H    
                                          DB     'Vec'  
     0018EC            __lcl.00000016     DD     __lcl.00000017 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000015 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000014 
     001904            __lcl.00000015     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     001910            __lcl.00000014     DD     00000001 
                                          DD     __lcl.00000013 
     001918            __lcl.00000013     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000011 
                                          DD     __lcl.00000012 
     001934            __lcl.00000012     DD     00000008 
                                          DD     00000007 
                                          DD     package1.vec__constrained_array____1 
     001940            __lcl.00000011     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00194C            __lcl.00000010     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__COMP_SU_SIZE 
     001958            __lcl.00000009     DD     00000001 
                                          DD     __lcl.00000008 
     001960            __lcl.00000008     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000007 
     00197C            __lcl.00000007     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__constrained_array____1 
     001988            __lcl.00000006     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001994            __lcl.00000005     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000003 
                                          DD     __lcl.00000004 
     0019B0            __lcl.00000004     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     0019BC            __lcl.00000003     DD     00000008 
                                          DD     00000003 
                                          DD     80000000 
     0019C8            __lcl.00000002     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     0019D4            __lcl.00000001     DD     00000000 
; ********* End of segment, Total Size = 6616


; ************* .av_dbgi segment :
                                          ALIGN 4       
     0019D8            __lcl.00000260     DB     16     
                                          DB     'D:\LAB2-4VOVA\lab4.adb' 
; ********* End of segment, Total Size = 6639

                       ;                                
                       CODE               ENDS          

