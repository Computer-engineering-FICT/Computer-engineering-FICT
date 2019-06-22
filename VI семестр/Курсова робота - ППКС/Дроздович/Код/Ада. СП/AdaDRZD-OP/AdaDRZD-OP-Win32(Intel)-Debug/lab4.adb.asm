
                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT Lab4 
;  Record Layout Information:
;     -- lab4.mon
;     for MON use record
;         F1 at 68 range 0 .. 31;
;         F2 at 72 range 0 .. 31;
; --      MB at 88 range 0..<dynamic-sized>; cannot specify place
; --      MZ at <dynamic-offset>; cannot specify place
;         alfa at 80 range 0 .. 31;
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
;  Source Line # 57
   57| 000000 64                          FS:           
   57| 000001 8B15                        MOV    EDX, 4 
   57| 000003 04000000                                  
   57| 000007 8B52                        MOV    EDX, [EDX-4] 
   57| 000009 FC                                        
   57| 00000A 55                          PUSH   EBP    
   57| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 57
   57| 00000D 8B42                        MOV    EAX, [EDX+48] 
   57| 00000F 30                                        
   57| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
   57| 000012 F8                                        
   57| 000013 00                                        
   57| 000014 75                          JNE    SHORT L30 
   57| 000015 0A                                        
   57| 000016 68                          PUSH   program_error 
   57| 000017 00000000                                  
   57| 00001B E8                          CALL   rts_raise 
   57| 00001C 00000000                                  
   57|                 L30:                             
;  Source Line # 59
   59| 000020 8B45                        MOV    EAX, [EBP+8] ;  po_access
   59| 000022 08                                        
   59| 000023 8B58                        MOV    EBX, [EAX+68] 
   59| 000025 44                                        
   59| 000026 43                          INC    EBX    
   59| 000027 CE                          INTO          
   59| 000028 8B4D                        MOV    ECX, [EBP+8] ;  po_access
   59| 00002A 08                                        
   59| 00002B 8959                        MOV    [ECX+68], EBX 
   59| 00002D 44                                        
;  Source Line # 60
   60| 00002E 8BE5                        MOV    ESP, EBP 
   60| 000030 5D                          POP    EBP    
   60| 000031 C2                          RET    8      
   60| 000032 0800                                      
                       ;                                
                       lab4.mon.datasignal ENDP         


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000381     DD     00000501 
                                          DD     00000039 
                                          DD     lab4.mon.datasignal 
                                          DD     __lcl.00000382 
                                          DD     00000039 
                                          DD     lab4.mon.datasignal+0000000DH 
                                          DD     __lcl.00000382 
                                          DD     0000003B 
                                          DD     lab4.mon.datasignal+00000020H 
                                          DD     __lcl.00000382 
                                          DD     0000003C 
                                          DD     lab4.mon.datasignal+0000002EH 
                                          DD     __lcl.00000382 
                                          DD     0000003C 
                                          DD     lab4.mon.datasignal+00000030H 
                                          DD     __lcl.00000382 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure lab4.mon.calculationsignal   
                       ;                                
                                          PUBLIC lab4.mon.calculationsignal 
                       lab4.mon.calculationsignal PROC NEAR 
;  Source Line # 62
   62| 000000 64                          FS:           
   62| 000001 8B15                        MOV    EDX, 4 
   62| 000003 04000000                                  
   62| 000007 8B52                        MOV    EDX, [EDX-4] 
   62| 000009 FC                                        
   62| 00000A 55                          PUSH   EBP    
   62| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 62
   62| 00000D 8B42                        MOV    EAX, [EDX+48] 
   62| 00000F 30                                        
   62| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
   62| 000012 F8                                        
   62| 000013 00                                        
   62| 000014 75                          JNE    SHORT L30 
   62| 000015 0A                                        
   62| 000016 68                          PUSH   program_error 
   62| 000017 00000000                                  
   62| 00001B E8                          CALL   rts_raise 
   62| 00001C 00000000                                  
   62|                 L30:                             
;  Source Line # 64
   64| 000020 8B45                        MOV    EAX, [EBP+8] ;  po_access
   64| 000022 08                                        
   64| 000023 8B58                        MOV    EBX, [EAX+72] 
   64| 000025 48                                        
   64| 000026 43                          INC    EBX    
   64| 000027 CE                          INTO          
   64| 000028 8B4D                        MOV    ECX, [EBP+8] ;  po_access
   64| 00002A 08                                        
   64| 00002B 8959                        MOV    [ECX+72], EBX 
   64| 00002D 48                                        
;  Source Line # 65
   65| 00002E 8BE5                        MOV    ESP, EBP 
   65| 000030 5D                          POP    EBP    
   65| 000031 C2                          RET    8      
   65| 000032 0800                                      
                       ;                                
                       lab4.mon.calculationsignal ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000380     DD     00000501 
                                          DD     0000003E 
                                          DD     lab4.mon.calculationsignal 
                                          DD     __lcl.00000382 
                                          DD     0000003E 
                                          DD     lab4.mon.calculationsignal+0000000DH 
                                          DD     __lcl.00000382 
                                          DD     00000040 
                                          DD     lab4.mon.calculationsignal+00000020H 
                                          DD     __lcl.00000382 
                                          DD     00000041 
                                          DD     lab4.mon.calculationsignal+0000002EH 
                                          DD     __lcl.00000382 
                                          DD     00000041 
                                          DD     lab4.mon.calculationsignal+00000030H 
                                          DD     __lcl.00000382 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure lab4.mon.setmb   
                       ;                                
                                          PUBLIC lab4.mon.setmb 
                       lab4.mon.setmb     PROC   NEAR   
;  Source Line # 67
   67| 000000 64                          FS:           
   67| 000001 8B15                        MOV    EDX, 4 
   67| 000003 04000000                                  
   67| 000007 8B52                        MOV    EDX, [EDX-4] 
   67| 000009 FC                                        
   67| 00000A 55                          PUSH   EBP    
   67| 00000B 8BEC                        MOV    EBP, ESP 
   67| 00000D 83EC                        SUB    ESP, 16 
   67| 00000F 10                                        
;  Source Line # 67
   67| 000010 8B42                        MOV    EAX, [EDX+48] 
   67| 000012 30                                        
   67| 000013 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
   67| 000015 F8                                        
   67| 000016 00                                        
   67| 000017 75                          JNE    SHORT L30 
   67| 000018 0A                                        
   67| 000019 68                          PUSH   program_error 
   67| 00001A 00000000                                  
   67| 00001E E8                          CALL   rts_raise 
   67| 00001F 00000000                                  
   67|                 L30:                             
   67| 000023 8B05                        MOV    EAX, package1.n 
   67| 000025 00000000                                  
   67| 000029 8945                        MOV    [EBP-16], EAX 
   67| 00002B F0                                        
;  Source Line # 69
   69| 00002C 837D                        CMP    DWORD PTR [EBP-16], 0 
   69| 00002E F0                                        
   69| 00002F 00                                        
   69| 000030 0F8E                        JLE    L29    
   69| 000032 B2000000                                  
   69| 000036 C745                        MOV    DWORD PTR [EBP-12], 1 
   69| 000038 F4                                        
   69| 000039 01000000                                  
   69|                 L34:                             
   69| 00003D 8B05                        MOV    EAX, package1.n 
   69| 00003F 00000000                                  
   69| 000043 8945                        MOV    [EBP-8], EAX 
   69| 000045 F8                                        
;  Source Line # 70
   70| 000046 837D                        CMP    DWORD PTR [EBP-8], 0 
   70| 000048 F8                                        
   70| 000049 00                                        
   70| 00004A 0F8E                        JLE    L35    
   70| 00004C 84000000                                  
   70| 000050 C745                        MOV    DWORD PTR [EBP-4], 1 
   70| 000052 FC                                        
   70| 000053 01000000                                  
   70|                 L37:                             
;  Source Line # 71
   71| 000057 8B45                        MOV    EAX, [EBP+12] ;  params
   71| 000059 0C                                        
   71| 00005A 8B18                        MOV    EBX, [EAX+0] 
   71| 00005C 8B4D                        MOV    ECX, [EBP-12] 
   71| 00005E F4                                        
   71| 00005F 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
   71| 000061 00000000                                  
   71|                 L42:                             
   71| 000065 0F8F                        JG     L43    
   71| 000067 83000000                                  
   71| 00006B 8D49                        LEA    ECX, [ECX-1] 
   71| 00006D FF                                        
   71| 00006E 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
   71| 000071 00000000                                  
   71| 000075 8B55                        MOV    EDX, [EBP-4] 
   71| 000077 FC                                        
   71| 000078 3B15                        CMP    EDX, package1.vec__constrained_array____1 
   71| 00007A 00000000                                  
   71|                 L44:                             
   71| 00007E 0F8F                        JG     L45    
   71| 000080 76000000                                  
   71| 000084 8D1495                      LEA    EDX, [4*EDX-4] 
   71| 000087 FCFFFFFF                                  
   71| 00008B 03CA                        ADD    ECX, EDX 
   71| 00008D 8B75                        MOV    ESI, [EBP+8] ;  po_access
   71| 00008F 08                                        
   71| 000090 8B7D                        MOV    EDI, [EBP-12] 
   71| 000092 F4                                        
   71| 000093 3B3D                        CMP    EDI, package1.matr__constrained_array____1 
   71| 000095 00000000                                  
   71|                 L46:                             
   71| 000099 7F                          JG     SHORT L47 
   71| 00009A 6B                                        
   71| 00009B 8D7F                        LEA    EDI, [EDI-1] 
   71| 00009D FF                                        
   71| 00009E 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
   71| 0000A1 00000000                                  
   71| 0000A5 8B45                        MOV    EAX, [EBP-4] 
   71| 0000A7 FC                                        
   71| 0000A8 3B05                        CMP    EAX, package1.vec__constrained_array____1 
   71| 0000AA 00000000                                  
   71|                 L48:                             
   71| 0000AE 7F                          JG     SHORT L49 
   71| 0000AF 62                                        
   71| 0000B0 8D0485                      LEA    EAX, [4*EAX-4] 
   71| 0000B3 FCFFFFFF                                  
   71| 0000B7 03F8                        ADD    EDI, EAX 
   71| 0000B9 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
   71| 0000BC 895C3E                      MOV    [ESI+EDI+88], EBX 
   71| 0000BF 58                                        
;  Source Line # 72
   72| 0000C0 8B55                        MOV    EDX, [EBP-8] 
   72| 0000C2 F8                                        
   72| 0000C3 3955                        CMP    [EBP-4], EDX 
   72| 0000C5 FC                                        
   72| 0000C6 74                          JE     SHORT L35 
   72| 0000C7 0C                                        
   72| 0000C8 8B45                        MOV    EAX, [EBP-4] 
   72| 0000CA FC                                        
   72| 0000CB 40                          INC    EAX    
   72| 0000CC 8945                        MOV    [EBP-4], EAX 
   72| 0000CE FC                                        
   72| 0000CF E9                          JMP    L37    
   72| 0000D0 83FFFFFF                                  
   72|                 L35:                             
;  Source Line # 73
   73| 0000D4 8B45                        MOV    EAX, [EBP-16] 
   73| 0000D6 F0                                        
   73| 0000D7 3945                        CMP    [EBP-12], EAX 
   73| 0000D9 F4                                        
   73| 0000DA 74                          JE     SHORT L29 
   73| 0000DB 0C                                        
   73| 0000DC 8B45                        MOV    EAX, [EBP-12] 
   73| 0000DE F4                                        
   73| 0000DF 40                          INC    EAX    
   73| 0000E0 8945                        MOV    [EBP-12], EAX 
   73| 0000E2 F4                                        
   73| 0000E3 E9                          JMP    L34    
   73| 0000E4 55FFFFFF                                  
   73|                 L29:                             
;  Source Line # 74
   74| 0000E8 8BE5                        MOV    ESP, EBP 
   74| 0000EA 5D                          POP    EBP    
   74| 0000EB C2                          RET    8      
   74| 0000EC 0800                                      
   74|                 L43:                             
   74| 0000EE 8D05                        LEA    EAX, L42+5 
   74| 0000F0 6A000000                                  
   74| 0000F4 50                          PUSH   EAX    
   74| 0000F5 E9                          JMP    rts_raise_constraint_error 
   74| 0000F6 00000000                                  
   74|                 L45:                             
   74| 0000FA 8D05                        LEA    EAX, L44+5 
   74| 0000FC 83000000                                  
   74| 000100 50                          PUSH   EAX    
   74| 000101 E9                          JMP    rts_raise_constraint_error 
   74| 000102 00000000                                  
   74|                 L47:                             
   74| 000106 8D05                        LEA    EAX, L46+5 
   74| 000108 9E000000                                  
   74| 00010C 50                          PUSH   EAX    
   74| 00010D E9                          JMP    rts_raise_constraint_error 
   74| 00010E 00000000                                  
   74|                 L49:                             
   74| 000112 8D05                        LEA    EAX, L48+5 
   74| 000114 B3000000                                  
   74| 000118 50                          PUSH   EAX    
   74| 000119 E9                          JMP    rts_raise_constraint_error 
   74| 00011A 00000000                                  
                       ;                                
                       lab4.mon.setmb     ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000379     DD     00000901 
                                          DD     00000043 
                                          DD     lab4.mon.setmb 
                                          DD     __lcl.00000382 
                                          DD     00000043 
                                          DD     lab4.mon.setmb+00000010H 
                                          DD     __lcl.00000382 
                                          DD     00000045 
                                          DD     lab4.mon.setmb+0000002CH 
                                          DD     __lcl.00000382 
                                          DD     00000046 
                                          DD     lab4.mon.setmb+00000046H 
                                          DD     __lcl.00000382 
                                          DD     00000047 
                                          DD     lab4.mon.setmb+00000057H 
                                          DD     __lcl.00000382 
                                          DD     00000048 
                                          DD     lab4.mon.setmb+000000C0H 
                                          DD     __lcl.00000382 
                                          DD     00000049 
                                          DD     lab4.mon.setmb+000000D4H 
                                          DD     __lcl.00000382 
                                          DD     0000004A 
                                          DD     lab4.mon.setmb+000000E8H 
                                          DD     __lcl.00000382 
                                          DD     0000004A 
                                          DD     lab4.mon.setmb+0000011AH 
                                          DD     __lcl.00000382 
; ********* End of segment, Total Size = 112

                       ;                                
                       ;  Start of procedure lab4.mon.setalfa   
                       ;                                
                                          PUBLIC lab4.mon.setalfa 
                       lab4.mon.setalfa   PROC   NEAR   
;  Source Line # 75
   75| 000000 64                          FS:           
   75| 000001 8B15                        MOV    EDX, 4 
   75| 000003 04000000                                  
   75| 000007 8B52                        MOV    EDX, [EDX-4] 
   75| 000009 FC                                        
   75| 00000A 55                          PUSH   EBP    
   75| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 75
   75| 00000D 8B42                        MOV    EAX, [EDX+48] 
   75| 00000F 30                                        
   75| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
   75| 000012 F8                                        
   75| 000013 00                                        
   75| 000014 75                          JNE    SHORT L30 
   75| 000015 0A                                        
   75| 000016 68                          PUSH   program_error 
   75| 000017 00000000                                  
   75| 00001B E8                          CALL   rts_raise 
   75| 00001C 00000000                                  
   75|                 L30:                             
;  Source Line # 77
   77| 000020 8B45                        MOV    EAX, [EBP+12] ;  params
   77| 000022 0C                                        
   77| 000023 8B5D                        MOV    EBX, [EBP+8] ;  po_access
   77| 000025 08                                        
   77| 000026 8B08                        MOV    ECX, [EAX+0] 
   77| 000028 894B                        MOV    [EBX+80], ECX 
   77| 00002A 50                                        
;  Source Line # 78
   78| 00002B 8BE5                        MOV    ESP, EBP 
   78| 00002D 5D                          POP    EBP    
   78| 00002E C2                          RET    8      
   78| 00002F 0800                                      
                       ;                                
                       lab4.mon.setalfa   ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000378     DD     00000501 
                                          DD     0000004B 
                                          DD     lab4.mon.setalfa 
                                          DD     __lcl.00000382 
                                          DD     0000004B 
                                          DD     lab4.mon.setalfa+0000000DH 
                                          DD     __lcl.00000382 
                                          DD     0000004D 
                                          DD     lab4.mon.setalfa+00000020H 
                                          DD     __lcl.00000382 
                                          DD     0000004E 
                                          DD     lab4.mon.setalfa+0000002BH 
                                          DD     __lcl.00000382 
                                          DD     0000004E 
                                          DD     lab4.mon.setalfa+0000002DH 
                                          DD     __lcl.00000382 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure lab4.mon.setmz   
                       ;                                
                                          PUBLIC lab4.mon.setmz 
                       lab4.mon.setmz     PROC   NEAR   
;  Source Line # 79
   79| 000000 64                          FS:           
   79| 000001 8B15                        MOV    EDX, 4 
   79| 000003 04000000                                  
   79| 000007 8B52                        MOV    EDX, [EDX-4] 
   79| 000009 FC                                        
   79| 00000A 55                          PUSH   EBP    
   79| 00000B 8BEC                        MOV    EBP, ESP 
   79| 00000D 83EC                        SUB    ESP, 16 
   79| 00000F 10                                        
;  Source Line # 79
   79| 000010 8B42                        MOV    EAX, [EDX+48] 
   79| 000012 30                                        
   79| 000013 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
   79| 000015 F8                                        
   79| 000016 00                                        
   79| 000017 75                          JNE    SHORT L30 
   79| 000018 0A                                        
   79| 000019 68                          PUSH   program_error 
   79| 00001A 00000000                                  
   79| 00001E E8                          CALL   rts_raise 
   79| 00001F 00000000                                  
   79|                 L30:                             
   79| 000023 8B05                        MOV    EAX, package1.n 
   79| 000025 00000000                                  
   79| 000029 8945                        MOV    [EBP-16], EAX 
   79| 00002B F0                                        
;  Source Line # 81
   81| 00002C 837D                        CMP    DWORD PTR [EBP-16], 0 
   81| 00002E F0                                        
   81| 00002F 00                                        
   81| 000030 0F8E                        JLE    L29    
   81| 000032 B4000000                                  
   81| 000036 C745                        MOV    DWORD PTR [EBP-12], 1 
   81| 000038 F4                                        
   81| 000039 01000000                                  
   81|                 L34:                             
   81| 00003D 8B05                        MOV    EAX, package1.n 
   81| 00003F 00000000                                  
   81| 000043 8945                        MOV    [EBP-8], EAX 
   81| 000045 F8                                        
;  Source Line # 82
   82| 000046 837D                        CMP    DWORD PTR [EBP-8], 0 
   82| 000048 F8                                        
   82| 000049 00                                        
   82| 00004A 0F8E                        JLE    L35    
   82| 00004C 86000000                                  
   82| 000050 C745                        MOV    DWORD PTR [EBP-4], 1 
   82| 000052 FC                                        
   82| 000053 01000000                                  
   82|                 L37:                             
;  Source Line # 83
   83| 000057 8B45                        MOV    EAX, [EBP+12] ;  params
   83| 000059 0C                                        
   83| 00005A 8B18                        MOV    EBX, [EAX+0] 
   83| 00005C 8B4D                        MOV    ECX, [EBP-12] 
   83| 00005E F4                                        
   83| 00005F 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
   83| 000061 00000000                                  
   83|                 L42:                             
   83| 000065 0F8F                        JG     L43    
   83| 000067 85000000                                  
   83| 00006B 8D49                        LEA    ECX, [ECX-1] 
   83| 00006D FF                                        
   83| 00006E 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
   83| 000071 00000000                                  
   83| 000075 8B55                        MOV    EDX, [EBP-4] 
   83| 000077 FC                                        
   83| 000078 3B15                        CMP    EDX, package1.vec__constrained_array____1 
   83| 00007A 00000000                                  
   83|                 L44:                             
   83| 00007E 0F8F                        JG     L45    
   83| 000080 78000000                                  
   83| 000084 8D1495                      LEA    EDX, [4*EDX-4] 
   83| 000087 FCFFFFFF                                  
   83| 00008B 03CA                        ADD    ECX, EDX 
   83| 00008D 8B75                        MOV    ESI, [EBP+8] ;  po_access
   83| 00008F 08                                        
   83| 000090 8B7D                        MOV    EDI, [EBP-12] 
   83| 000092 F4                                        
   83| 000093 3B3D                        CMP    EDI, package1.matr__constrained_array____1 
   83| 000095 00000000                                  
   83|                 L46:                             
   83| 000099 7F                          JG     SHORT L47 
   83| 00009A 6D                                        
   83| 00009B 8D7F                        LEA    EDI, [EDI-1] 
   83| 00009D FF                                        
   83| 00009E 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
   83| 0000A1 00000000                                  
   83| 0000A5 037E                        ADD    EDI, [ESI+76] 
   83| 0000A7 4C                                        
   83| 0000A8 8B45                        MOV    EAX, [EBP-4] 
   83| 0000AA FC                                        
   83| 0000AB 3B05                        CMP    EAX, package1.vec__constrained_array____1 
   83| 0000AD 00000000                                  
   83|                 L48:                             
   83| 0000B1 7F                          JG     SHORT L49 
   83| 0000B2 61                                        
   83| 0000B3 8D0485                      LEA    EAX, [4*EAX-4] 
   83| 0000B6 FCFFFFFF                                  
   83| 0000BA 03F8                        ADD    EDI, EAX 
   83| 0000BC 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
   83| 0000BF 891C3E                      MOV    [ESI+EDI+0], EBX 
;  Source Line # 84
   84| 0000C2 8B55                        MOV    EDX, [EBP-8] 
   84| 0000C4 F8                                        
   84| 0000C5 3955                        CMP    [EBP-4], EDX 
   84| 0000C7 FC                                        
   84| 0000C8 74                          JE     SHORT L35 
   84| 0000C9 0C                                        
   84| 0000CA 8B45                        MOV    EAX, [EBP-4] 
   84| 0000CC FC                                        
   84| 0000CD 40                          INC    EAX    
   84| 0000CE 8945                        MOV    [EBP-4], EAX 
   84| 0000D0 FC                                        
   84| 0000D1 E9                          JMP    L37    
   84| 0000D2 81FFFFFF                                  
   84|                 L35:                             
;  Source Line # 85
   85| 0000D6 8B45                        MOV    EAX, [EBP-16] 
   85| 0000D8 F0                                        
   85| 0000D9 3945                        CMP    [EBP-12], EAX 
   85| 0000DB F4                                        
   85| 0000DC 74                          JE     SHORT L29 
   85| 0000DD 0C                                        
   85| 0000DE 8B45                        MOV    EAX, [EBP-12] 
   85| 0000E0 F4                                        
   85| 0000E1 40                          INC    EAX    
   85| 0000E2 8945                        MOV    [EBP-12], EAX 
   85| 0000E4 F4                                        
   85| 0000E5 E9                          JMP    L34    
   85| 0000E6 53FFFFFF                                  
   85|                 L29:                             
;  Source Line # 86
   86| 0000EA 8BE5                        MOV    ESP, EBP 
   86| 0000EC 5D                          POP    EBP    
   86| 0000ED C2                          RET    8      
   86| 0000EE 0800                                      
   86|                 L43:                             
   86| 0000F0 8D05                        LEA    EAX, L42+5 
   86| 0000F2 6A000000                                  
   86| 0000F6 50                          PUSH   EAX    
   86| 0000F7 E9                          JMP    rts_raise_constraint_error 
   86| 0000F8 00000000                                  
   86|                 L45:                             
   86| 0000FC 8D05                        LEA    EAX, L44+5 
   86| 0000FE 83000000                                  
   86| 000102 50                          PUSH   EAX    
   86| 000103 E9                          JMP    rts_raise_constraint_error 
   86| 000104 00000000                                  
   86|                 L47:                             
   86| 000108 8D05                        LEA    EAX, L46+5 
   86| 00010A 9E000000                                  
   86| 00010E 50                          PUSH   EAX    
   86| 00010F E9                          JMP    rts_raise_constraint_error 
   86| 000110 00000000                                  
   86|                 L49:                             
   86| 000114 8D05                        LEA    EAX, L48+5 
   86| 000116 B6000000                                  
   86| 00011A 50                          PUSH   EAX    
   86| 00011B E9                          JMP    rts_raise_constraint_error 
   86| 00011C 00000000                                  
                       ;                                
                       lab4.mon.setmz     ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000377     DD     00000901 
                                          DD     0000004F 
                                          DD     lab4.mon.setmz 
                                          DD     __lcl.00000382 
                                          DD     0000004F 
                                          DD     lab4.mon.setmz+00000010H 
                                          DD     __lcl.00000382 
                                          DD     00000051 
                                          DD     lab4.mon.setmz+0000002CH 
                                          DD     __lcl.00000382 
                                          DD     00000052 
                                          DD     lab4.mon.setmz+00000046H 
                                          DD     __lcl.00000382 
                                          DD     00000053 
                                          DD     lab4.mon.setmz+00000057H 
                                          DD     __lcl.00000382 
                                          DD     00000054 
                                          DD     lab4.mon.setmz+000000C2H 
                                          DD     __lcl.00000382 
                                          DD     00000055 
                                          DD     lab4.mon.setmz+000000D6H 
                                          DD     __lcl.00000382 
                                          DD     00000056 
                                          DD     lab4.mon.setmz+000000EAH 
                                          DD     __lcl.00000382 
                                          DD     00000056 
                                          DD     lab4.mon.setmz+0000011CH 
                                          DD     __lcl.00000382 
; ********* End of segment, Total Size = 112

                       ;                                
                       ;  Start of procedure lab4.mon.getmb   
                       ;                                
                                          PUBLIC lab4.mon.getmb 
                       lab4.mon.getmb     PROC   NEAR   
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
   87| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
   87| 000012 F8                                        
   87| 000013 00                                        
   87| 000014 75                          JNE    SHORT L30 
   87| 000015 0A                                        
   87| 000016 68                          PUSH   program_error 
   87| 000017 00000000                                  
   87| 00001B E8                          CALL   rts_raise 
   87| 00001C 00000000                                  
   87|                 L30:                             
;  Source Line # 89
   89| 000020 8B05                        MOV    EAX, package1.matr__constrained_array____1 
   89| 000022 00000000                                  
   89| 000026 2D                          SUB    EAX, 1 
   89| 000027 01000000                                  
   89| 00002B 7D                          JGE    SHORT L32 
   89| 00002C 03                                        
   89| 00002D 33C0                        XOR    EAX, EAX 
   89| 00002F 48                          DEC    EAX    
   89|                 L32:                             
   89| 000030 CE                          INTO          
   89| 000031 40                          INC    EAX    
   89| 000032 CE                          INTO          
   89| 000033 0FAF05                      IMUL   EAX, package1.matr__COMP_SU_SIZE 
   89| 000036 00000000                                  
   89| 00003A CE                          INTO          
   89| 00003B 8B5D                        MOV    EBX, [EBP+8] ;  po_access
   89| 00003D 08                                        
   89| 00003E 8B4D                        MOV    ECX, [EBP+12] ;  params
   89| 000040 0C                                        
   89| 000041 8B11                        MOV    EDX, [ECX+0] 
   89| 000043 50                          PUSH   EAX    
   89| 000044 8D5B                        LEA    EBX, [EBX+88] 
   89| 000046 58                                        
   89| 000047 53                          PUSH   EBX    
   89| 000048 52                          PUSH   EDX    
   89| 000049 E8                          CALL   _rts_block_move 
   89| 00004A 00000000                                  
   89| 00004E 8BE5                        MOV    ESP, EBP 
   89| 000050 5D                          POP    EBP    
   89| 000051 C2                          RET    8      
   89| 000052 0800                                      
                       ;                                
                       lab4.mon.getmb     ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000376     DD     00000401 
                                          DD     00000057 
                                          DD     lab4.mon.getmb 
                                          DD     __lcl.00000382 
                                          DD     00000057 
                                          DD     lab4.mon.getmb+0000000DH 
                                          DD     __lcl.00000382 
                                          DD     00000059 
                                          DD     lab4.mon.getmb+00000020H 
                                          DD     __lcl.00000382 
                                          DD     00000059 
                                          DD     lab4.mon.getmb+00000050H 
                                          DD     __lcl.00000382 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.mon.getalfa   
                       ;                                
                                          PUBLIC lab4.mon.getalfa 
                       lab4.mon.getalfa   PROC   NEAR   
;  Source Line # 91
   91| 000000 64                          FS:           
   91| 000001 8B15                        MOV    EDX, 4 
   91| 000003 04000000                                  
   91| 000007 8B52                        MOV    EDX, [EDX-4] 
   91| 000009 FC                                        
   91| 00000A 55                          PUSH   EBP    
   91| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 91
   91| 00000D 8B42                        MOV    EAX, [EDX+48] 
   91| 00000F 30                                        
   91| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
   91| 000012 F8                                        
   91| 000013 00                                        
   91| 000014 75                          JNE    SHORT L30 
   91| 000015 0A                                        
   91| 000016 68                          PUSH   program_error 
   91| 000017 00000000                                  
   91| 00001B E8                          CALL   rts_raise 
   91| 00001C 00000000                                  
   91|                 L30:                             
;  Source Line # 93
   93| 000020 8B45                        MOV    EAX, [EBP+8] ;  po_access
   93| 000022 08                                        
   93| 000023 8B5D                        MOV    EBX, [EBP+12] ;  params
   93| 000025 0C                                        
   93| 000026 8B0B                        MOV    ECX, [EBX+0] 
   93| 000028 8B50                        MOV    EDX, [EAX+80] 
   93| 00002A 50                                        
   93| 00002B 8911                        MOV    [ECX+0], EDX 
   93| 00002D 8BE5                        MOV    ESP, EBP 
   93| 00002F 5D                          POP    EBP    
   93| 000030 C2                          RET    8      
   93| 000031 0800                                      
                       ;                                
                       lab4.mon.getalfa   ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000375     DD     00000401 
                                          DD     0000005B 
                                          DD     lab4.mon.getalfa 
                                          DD     __lcl.00000382 
                                          DD     0000005B 
                                          DD     lab4.mon.getalfa+0000000DH 
                                          DD     __lcl.00000382 
                                          DD     0000005D 
                                          DD     lab4.mon.getalfa+00000020H 
                                          DD     __lcl.00000382 
                                          DD     0000005D 
                                          DD     lab4.mon.getalfa+0000002FH 
                                          DD     __lcl.00000382 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.mon.getmz   
                       ;                                
                                          PUBLIC lab4.mon.getmz 
                       lab4.mon.getmz     PROC   NEAR   
;  Source Line # 95
   95| 000000 64                          FS:           
   95| 000001 8B15                        MOV    EDX, 4 
   95| 000003 04000000                                  
   95| 000007 8B52                        MOV    EDX, [EDX-4] 
   95| 000009 FC                                        
   95| 00000A 55                          PUSH   EBP    
   95| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 95
   95| 00000D 8B42                        MOV    EAX, [EDX+48] 
   95| 00000F 30                                        
   95| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
   95| 000012 F8                                        
   95| 000013 00                                        
   95| 000014 75                          JNE    SHORT L30 
   95| 000015 0A                                        
   95| 000016 68                          PUSH   program_error 
   95| 000017 00000000                                  
   95| 00001B E8                          CALL   rts_raise 
   95| 00001C 00000000                                  
   95|                 L30:                             
;  Source Line # 97
   97| 000020 8B05                        MOV    EAX, package1.matr__constrained_array____1 
   97| 000022 00000000                                  
   97| 000026 2D                          SUB    EAX, 1 
   97| 000027 01000000                                  
   97| 00002B 7D                          JGE    SHORT L32 
   97| 00002C 03                                        
   97| 00002D 33C0                        XOR    EAX, EAX 
   97| 00002F 48                          DEC    EAX    
   97|                 L32:                             
   97| 000030 CE                          INTO          
   97| 000031 40                          INC    EAX    
   97| 000032 CE                          INTO          
   97| 000033 0FAF05                      IMUL   EAX, package1.matr__COMP_SU_SIZE 
   97| 000036 00000000                                  
   97| 00003A CE                          INTO          
   97| 00003B 8B5D                        MOV    EBX, [EBP+8] ;  po_access
   97| 00003D 08                                        
   97| 00003E 8B4B                        MOV    ECX, [EBX+76] 
   97| 000040 4C                                        
   97| 000041 8B55                        MOV    EDX, [EBP+12] ;  params
   97| 000043 0C                                        
   97| 000044 8B32                        MOV    ESI, [EDX+0] 
   97| 000046 50                          PUSH   EAX    
   97| 000047 8D1C0B                      LEA    EBX, [EBX+ECX+0] 
   97| 00004A 53                          PUSH   EBX    
   97| 00004B 56                          PUSH   ESI    
   97| 00004C E8                          CALL   _rts_block_move 
   97| 00004D 00000000                                  
   97| 000051 8BE5                        MOV    ESP, EBP 
   97| 000053 5D                          POP    EBP    
   97| 000054 C2                          RET    8      
   97| 000055 0800                                      
                       ;                                
                       lab4.mon.getmz     ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000374     DD     00000401 
                                          DD     0000005F 
                                          DD     lab4.mon.getmz 
                                          DD     __lcl.00000382 
                                          DD     0000005F 
                                          DD     lab4.mon.getmz+0000000DH 
                                          DD     __lcl.00000382 
                                          DD     00000061 
                                          DD     lab4.mon.getmz+00000020H 
                                          DD     __lcl.00000382 
                                          DD     00000061 
                                          DD     lab4.mon.getmz+00000053H 
                                          DD     __lcl.00000382 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.mon.inputed   
                       ;                                
                                          PUBLIC lab4.mon.inputed 
                       lab4.mon.inputed   PROC   NEAR   
;  Source Line # 100
  100| 000000 64                          FS:           
  100| 000001 8B15                        MOV    EDX, 4 
  100| 000003 04000000                                  
  100| 000007 8B52                        MOV    EDX, [EDX-4] 
  100| 000009 FC                                        
  100| 00000A 55                          PUSH   EBP    
  100| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 100
  100| 00000D 8B42                        MOV    EAX, [EDX+48] 
  100| 00000F 30                                        
  100| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
  100| 000012 F8                                        
  100| 000013 00                                        
  100| 000014 75                          JNE    SHORT L29 
  100| 000015 0A                                        
  100| 000016 68                          PUSH   program_error 
  100| 000017 00000000                                  
  100| 00001B E8                          CALL   rts_raise 
  100| 00001C 00000000                                  
;  Source Line # 103
  103|                 L29:                             
  103| 000020 8BE5                        MOV    ESP, EBP 
  103| 000022 5D                          POP    EBP    
  103| 000023 C2                          RET    16     
  103| 000024 1000                                      
                       ;                                
                       lab4.mon.inputed   ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000373     DD     00000401 
                                          DD     00000064 
                                          DD     lab4.mon.inputed 
                                          DD     __lcl.00000382 
                                          DD     00000064 
                                          DD     lab4.mon.inputed+0000000DH 
                                          DD     __lcl.00000382 
                                          DD     00000067 
                                          DD     lab4.mon.inputed+00000020H 
                                          DD     __lcl.00000382 
                                          DD     00000067 
                                          DD     lab4.mon.inputed+00000022H 
                                          DD     __lcl.00000382 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.mon.finish   
                       ;                                
                                          PUBLIC lab4.mon.finish 
                       lab4.mon.finish    PROC   NEAR   
;  Source Line # 105
  105| 000000 64                          FS:           
  105| 000001 8B15                        MOV    EDX, 4 
  105| 000003 04000000                                  
  105| 000007 8B52                        MOV    EDX, [EDX-4] 
  105| 000009 FC                                        
  105| 00000A 55                          PUSH   EBP    
  105| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 105
  105| 00000D 8B42                        MOV    EAX, [EDX+48] 
  105| 00000F 30                                        
  105| 000010 8078                        CMP    BYTE PTR [EAX-8], 0 ;  MON__elab_bool
  105| 000012 F8                                        
  105| 000013 00                                        
  105| 000014 75                          JNE    SHORT L29 
  105| 000015 0A                                        
  105| 000016 68                          PUSH   program_error 
  105| 000017 00000000                                  
  105| 00001B E8                          CALL   rts_raise 
  105| 00001C 00000000                                  
;  Source Line # 108
  108|                 L29:                             
  108| 000020 8BE5                        MOV    ESP, EBP 
  108| 000022 5D                          POP    EBP    
  108| 000023 C2                          RET    16     
  108| 000024 1000                                      
                       ;                                
                       lab4.mon.finish    ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000372     DD     00000401 
                                          DD     00000069 
                                          DD     lab4.mon.finish 
                                          DD     __lcl.00000382 
                                          DD     00000069 
                                          DD     lab4.mon.finish+0000000DH 
                                          DD     __lcl.00000382 
                                          DD     0000006C 
                                          DD     lab4.mon.finish+00000020H 
                                          DD     __lcl.00000382 
                                          DD     0000006C 
                                          DD     lab4.mon.finish+00000022H 
                                          DD     __lcl.00000382 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.mon__all_barriers   
                       ;                                
                                          PUBLIC lab4.mon__all_barriers 
                       lab4.mon__all_barriers PROC NEAR 
;  Source Line # 108
  108| 000000 55                          PUSH   EBP    
  108| 000001 8BEC                        MOV    EBP, ESP 
  108| 000003 83EC                        SUB    ESP, 4 
  108| 000005 04                                        
  108| 000006 C745                        MOV    DWORD PTR [EBP-4], 0 
  108| 000008 FC                                        
  108| 000009 00000000                                  
  108| 00000D 8B45                        MOV    EAX, [EBP+8] ;  po_access
  108| 00000F 08                                        
  108| 000010 8B1D                        MOV    EBX, package1.p 
  108| 000012 00000000                                  
  108| 000016 3958                        CMP    [EAX+68], EBX 
  108| 000018 44                                        
  108| 000019 75                          JNE    SHORT L30 
  108| 00001A 0B                                        
  108| 00001B 8B45                        MOV    EAX, [EBP-4] 
  108| 00001D FC                                        
  108| 00001E 0D                          OR     EAX, 1 
  108| 00001F 01000000                                  
  108| 000023 8945                        MOV    [EBP-4], EAX 
  108| 000025 FC                                        
  108|                 L30:                             
  108| 000026 8B45                        MOV    EAX, [EBP+8] ;  po_access
  108| 000028 08                                        
  108| 000029 8B1D                        MOV    EBX, package1.p 
  108| 00002B 00000000                                  
  108| 00002F 4B                          DEC    EBX    
  108| 000030 CE                          INTO          
  108| 000031 3958                        CMP    [EAX+72], EBX 
  108| 000033 48                                        
  108| 000034 75                          JNE    SHORT L32 
  108| 000035 0B                                        
  108| 000036 8B45                        MOV    EAX, [EBP-4] 
  108| 000038 FC                                        
  108| 000039 0D                          OR     EAX, 2 
  108| 00003A 02000000                                  
  108| 00003E 8945                        MOV    [EBP-4], EAX 
  108| 000040 FC                                        
  108|                 L32:                             
  108| 000041 8B45                        MOV    EAX, [EBP-4] 
  108| 000043 FC                                        
  108| 000044 8BE5                        MOV    ESP, EBP 
  108| 000046 5D                          POP    EBP    
  108| 000047 C2                          RET    4      
  108| 000048 0400                                      
                       ;                                
                       lab4.mon__all_barriers ENDP      
                       ;                                
                       ;  Start of procedure lab4.start.t1__body   
                       ;                                
                                          PUBLIC lab4.start.t1__body 
                       lab4.start.t1__body PROC  NEAR   
;  Source Line # 121
  121| 000000 64                          FS:           
  121| 000001 8B15                        MOV    EDX, 4 
  121| 000003 04000000                                  
  121| 000007 8B52                        MOV    EDX, [EDX-4] 
  121| 000009 FC                                        
  121| 00000A 55                          PUSH   EBP    
  121| 00000B 8BEC                        MOV    EBP, ESP 
  121| 00000D 83EC                        SUB    ESP, 108 
  121| 00000F 6C                                        
;  Source Line # 123
  123| 000010 8B02                        MOV    EAX, [EDX+0] 
  123| 000012 8945                        MOV    [EBP-96], EAX ;  dyn_temp
  123| 000014 A0                                        
  123| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  123| 000017 00000000                                  
  123| 00001B 83EB                        SUB    EBX, 1 
  123| 00001D 01                                        
  123| 00001E 7D                          JGE    SHORT L62 
  123| 00001F 03                                        
  123| 000020 33DB                        XOR    EBX, EBX 
  123| 000022 4B                          DEC    EBX    
  123|                 L62:                             
  123| 000023 CE                          INTO          
  123| 000024 43                          INC    EBX    
  123| 000025 CE                          INTO          
  123| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  123| 000029 00000000                                  
  123| 00002D CE                          INTO          
  123| 00002E 53                          PUSH   EBX    
  123| 00002F 8955                        MOV    [EBP-108], EDX ; Spill
  123| 000031 94                                        
  123| 000032 E8                          CALL   rts_ss_allocate 
  123| 000033 00000000                                  
  123| 000037 8945                        MOV    [EBP-92], EAX ;  MB1
  123| 000039 A4                                        
  123| 00003A 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
  123| 00003C 00000000                                  
  123| 000040 83E9                        SUB    ECX, 1 
  123| 000042 01                                        
  123| 000043 7D                          JGE    SHORT L63 
  123| 000044 03                                        
  123| 000045 33C9                        XOR    ECX, ECX 
  123| 000047 49                          DEC    ECX    
  123|                 L63:                             
  123| 000048 CE                          INTO          
  123| 000049 41                          INC    ECX    
  123| 00004A CE                          INTO          
  123| 00004B 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  123| 00004E 00000000                                  
  123| 000052 CE                          INTO          
  123| 000053 51                          PUSH   ECX    
  123| 000054 E8                          CALL   rts_ss_allocate 
  123| 000055 00000000                                  
  123| 000059 8945                        MOV    [EBP-88], EAX ;  MZ1
  123| 00005B A8                                        
  123| 00005C 8B35                        MOV    ESI, package1.matr__constrained_array____1 
  123| 00005E 00000000                                  
  123| 000062 83EE                        SUB    ESI, 1 
  123| 000064 01                                        
  123| 000065 7D                          JGE    SHORT L64 
  123| 000066 03                                        
  123| 000067 33F6                        XOR    ESI, ESI 
  123| 000069 4E                          DEC    ESI    
  123|                 L64:                             
  123| 00006A CE                          INTO          
  123| 00006B 46                          INC    ESI    
  123| 00006C CE                          INTO          
  123| 00006D 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  123| 000070 00000000                                  
  123| 000074 CE                          INTO          
  123| 000075 56                          PUSH   ESI    
  123| 000076 E8                          CALL   rts_ss_allocate 
  123| 000077 00000000                                  
  123| 00007B 8945                        MOV    [EBP-84], EAX ;  MT1
  123| 00007D AC                                        
;  Source Line # 125
  125| 00007E E8                          CALL   rts_activation_succeeded 
  125| 00007F 00000000                                  
;  Source Line # 126
  126| 000083 68                          PUSH   __lcl.00000168 
  126| 000084 00000000                                  
  126| 000088 68                          PUSH   __lcl.00000167 
  126| 000089 00000000                                  
  126| 00008D E8                          CALL   ada.text_io.put_line__2 
  126| 00008E 00000000                                  
;  Source Line # 128
  128| 000092 8B7D                        MOV    EDI, [EBP-92] ;  MB1
  128| 000094 A4                                        
  128| 000095 57                          PUSH   EDI    
  128| 000096 E8                          CALL   package1.matr_input 
  128| 000097 00000000                                  
;  Source Line # 129
  129| 00009B 8B55                        MOV    EDX, [EBP-92] ;  MB1
  129| 00009D A4                                        
  129| 00009E 8955                        MOV    [EBP-76], EDX 
  129| 0000A0 B4                                        
  129| 0000A1 68                          PUSH   lab4.mon.setmb 
  129| 0000A2 00000000                                  
  129| 0000A6 8D5D                        LEA    EBX, [EBP-76] 
  129| 0000A8 B4                                        
  129| 0000A9 53                          PUSH   EBX    
  129| 0000AA 8B55                        MOV    EDX, [EBP-108] ; Spill
  129| 0000AC 94                                        
  129| 0000AD 8B4A                        MOV    ECX, [EDX+48] 
  129| 0000AF 30                                        
  129| 0000B0 8B71                        MOV    ESI, [ECX-44] ;  MON
  129| 0000B2 D4                                        
  129| 0000B3 56                          PUSH   ESI    
  129| 0000B4 E8                          CALL   rts_protected_procedure_call 
  129| 0000B5 00000000                                  
;  Source Line # 130
  130| 0000B9 8B55                        MOV    EDX, [EBP-108] ; Spill
  130| 0000BB 94                                        
  130| 0000BC 8B42                        MOV    EAX, [EDX+48] 
  130| 0000BE 30                                        
  130| 0000BF 8BB8                        MOV    EDI, [EAX-140] ;  MA
  130| 0000C1 74FFFFFF                                  
  130| 0000C5 57                          PUSH   EDI    
  130| 0000C6 E8                          CALL   package1.matr_input 
  130| 0000C7 00000000                                  
;  Source Line # 132
  132| 0000CB 68                          PUSH   lab4.mon.datasignal 
  132| 0000CC 00000000                                  
  132| 0000D0 6A                          PUSH   0      
  132| 0000D1 00                                        
  132| 0000D2 8B55                        MOV    EDX, [EBP-108] ; Spill
  132| 0000D4 94                                        
  132| 0000D5 8B5A                        MOV    EBX, [EDX+48] 
  132| 0000D7 30                                        
  132| 0000D8 8B4B                        MOV    ECX, [EBX-44] ;  MON
  132| 0000DA D4                                        
  132| 0000DB 51                          PUSH   ECX    
  132| 0000DC E8                          CALL   rts_protected_procedure_call 
  132| 0000DD 00000000                                  
;  Source Line # 134
  134| 0000E1 6A                          PUSH   0      
  134| 0000E2 00                                        
  134| 0000E3 6A                          PUSH   0      
  134| 0000E4 00                                        
  134| 0000E5 6A                          PUSH   0      
  134| 0000E6 00                                        
  134| 0000E7 8B55                        MOV    EDX, [EBP-108] ; Spill
  134| 0000E9 94                                        
  134| 0000EA 8B72                        MOV    ESI, [EDX+48] 
  134| 0000EC 30                                        
  134| 0000ED 8B46                        MOV    EAX, [ESI-44] ;  MON
  134| 0000EF D4                                        
  134| 0000F0 50                          PUSH   EAX    
  134| 0000F1 E8                          CALL   rts_protected_entry_call 
  134| 0000F2 00000000                                  
;  Source Line # 136
  136| 0000F6 8B7D                        MOV    EDI, [EBP-88] ;  MZ1
  136| 0000F8 A8                                        
  136| 0000F9 897D                        MOV    [EBP-72], EDI 
  136| 0000FB B8                                        
  136| 0000FC 68                          PUSH   lab4.mon.getmz 
  136| 0000FD 00000000                                  
  136| 000101 8D5D                        LEA    EBX, [EBP-72] 
  136| 000103 B8                                        
  136| 000104 53                          PUSH   EBX    
  136| 000105 8B55                        MOV    EDX, [EBP-108] ; Spill
  136| 000107 94                                        
  136| 000108 8B4A                        MOV    ECX, [EDX+48] 
  136| 00010A 30                                        
  136| 00010B 8B71                        MOV    ESI, [ECX-44] ;  MON
  136| 00010D D4                                        
  136| 00010E 56                          PUSH   ESI    
  136| 00010F E8                          CALL   rts_entryless_protected_subp_call 
  136| 000110 00000000                                  
;  Source Line # 137
  137| 000114 8B45                        MOV    EAX, [EBP-92] ;  MB1
  137| 000116 A4                                        
  137| 000117 8945                        MOV    [EBP-68], EAX 
  137| 000119 BC                                        
  137| 00011A 68                          PUSH   lab4.mon.getmb 
  137| 00011B 00000000                                  
  137| 00011F 8D7D                        LEA    EDI, [EBP-68] 
  137| 000121 BC                                        
  137| 000122 57                          PUSH   EDI    
  137| 000123 8B55                        MOV    EDX, [EBP-108] ; Spill
  137| 000125 94                                        
  137| 000126 8B5A                        MOV    EBX, [EDX+48] 
  137| 000128 30                                        
  137| 000129 8B4B                        MOV    ECX, [EBX-44] ;  MON
  137| 00012B D4                                        
  137| 00012C 51                          PUSH   ECX    
  137| 00012D E8                          CALL   rts_entryless_protected_subp_call 
  137| 00012E 00000000                                  
;  Source Line # 138
  138| 000132 8D75                        LEA    ESI, [EBP-64] 
  138| 000134 C0                                        
  138| 000135 8975                        MOV    [EBP-60], ESI 
  138| 000137 C4                                        
  138| 000138 68                          PUSH   lab4.mon.getalfa 
  138| 000139 00000000                                  
  138| 00013D 8D45                        LEA    EAX, [EBP-60] 
  138| 00013F C4                                        
  138| 000140 50                          PUSH   EAX    
  138| 000141 8B55                        MOV    EDX, [EBP-108] ; Spill
  138| 000143 94                                        
  138| 000144 8B7A                        MOV    EDI, [EDX+48] 
  138| 000146 30                                        
  138| 000147 8B5F                        MOV    EBX, [EDI-44] ;  MON
  138| 000149 D4                                        
  138| 00014A 53                          PUSH   EBX    
  138| 00014B E8                          CALL   rts_entryless_protected_subp_call 
  138| 00014C 00000000                                  
  138| 000150 8B4D                        MOV    ECX, [EBP-64] 
  138| 000152 C0                                        
  138| 000153 894D                        MOV    [EBP-80], ECX ;  alfa1
  138| 000155 B0                                        
  138| 000156 8B35                        MOV    ESI, package1.n 
  138| 000158 00000000                                  
  138| 00015C 8975                        MOV    [EBP-56], ESI 
  138| 00015E C8                                        
;  Source Line # 140
  140| 00015F 837D                        CMP    DWORD PTR [EBP-56], 0 
  140| 000161 C8                                        
  140| 000162 00                                        
  140| 000163 0F8E                        JLE    L30    
  140| 000165 7E010000                                  
  140| 000169 C745                        MOV    DWORD PTR [EBP-52], 1 
  140| 00016B CC                                        
  140| 00016C 01000000                                  
  140|                 L32:                             
  140| 000170 8B05                        MOV    EAX, package1.h 
  140| 000172 00000000                                  
  140| 000176 8945                        MOV    [EBP-48], EAX 
  140| 000178 D0                                        
;  Source Line # 141
  141| 000179 837D                        CMP    DWORD PTR [EBP-48], 0 
  141| 00017B D0                                        
  141| 00017C 00                                        
  141| 00017D 0F8E                        JLE    L33    
  141| 00017F 50010000                                  
  141| 000183 C745                        MOV    DWORD PTR [EBP-44], 1 
  141| 000185 D4                                        
  141| 000186 01000000                                  
  141|                 L35:                             
;  Source Line # 142
  142| 00018A C745                        MOV    DWORD PTR [EBP-100], 0 ;  Sum1
  142| 00018C 9C                                        
  142| 00018D 00000000                                  
  142| 000191 8B05                        MOV    EAX, package1.n 
  142| 000193 00000000                                  
  142| 000197 8945                        MOV    [EBP-40], EAX 
  142| 000199 D8                                        
;  Source Line # 143
  143| 00019A 837D                        CMP    DWORD PTR [EBP-40], 0 
  143| 00019C D8                                        
  143| 00019D 00                                        
  143| 00019E 0F8E                        JLE    L36    
  143| 0001A0 9B000000                                  
  143| 0001A4 C745                        MOV    DWORD PTR [EBP-36], 1 
  143| 0001A6 DC                                        
  143| 0001A7 01000000                                  
  143|                 L38:                             
;  Source Line # 144
  144| 0001AB 8B55                        MOV    EDX, [EBP-108] ; Spill
  144| 0001AD 94                                        
  144| 0001AE 8B42                        MOV    EAX, [EDX+48] 
  144| 0001B0 30                                        
  144| 0001B1 8B98                        MOV    EBX, [EAX-132] ;  MK
  144| 0001B3 7CFFFFFF                                  
  144| 0001B7 8B4D                        MOV    ECX, [EBP-36] 
  144| 0001B9 DC                                        
  144| 0001BA 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  144| 0001BC 00000000                                  
  144|                 L65:                             
  144| 0001C0 0F8F                        JG     L66    
  144| 0001C2 33030000                                  
  144| 0001C6 8D49                        LEA    ECX, [ECX-1] 
  144| 0001C8 FF                                        
  144| 0001C9 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  144| 0001CC 00000000                                  
  144| 0001D0 8B75                        MOV    ESI, [EBP-44] 
  144| 0001D2 D4                                        
  144| 0001D3 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  144| 0001D5 00000000                                  
  144|                 L67:                             
  144| 0001D9 0F8F                        JG     L68    
  144| 0001DB 26030000                                  
  144| 0001DF 8D34B5                      LEA    ESI, [4*ESI-4] 
  144| 0001E2 FCFFFFFF                                  
  144| 0001E6 03CE                        ADD    ECX, ESI 
  144| 0001E8 8B7D                        MOV    EDI, [EBP-88] ;  MZ1
  144| 0001EA A8                                        
  144| 0001EB 8B55                        MOV    EDX, [EBP-52] 
  144| 0001ED CC                                        
  144| 0001EE 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  144| 0001F0 00000000                                  
  144|                 L69:                             
  144| 0001F4 0F8F                        JG     L70    
  144| 0001F6 17030000                                  
  144| 0001FA 8D52                        LEA    EDX, [EDX-1] 
  144| 0001FC FF                                        
  144| 0001FD 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  144| 000200 00000000                                  
  144| 000204 8B45                        MOV    EAX, [EBP-36] 
  144| 000206 DC                                        
  144| 000207 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  144| 000209 00000000                                  
  144|                 L71:                             
  144| 00020D 0F8F                        JG     L72    
  144| 00020F 0A030000                                  
  144| 000213 8D0485                      LEA    EAX, [4*EAX-4] 
  144| 000216 FCFFFFFF                                  
  144| 00021A 03D0                        ADD    EDX, EAX 
  144| 00021C 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  144| 00021F 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  144| 000223 CE                          INTO          
  144| 000224 035D                        ADD    EBX, [EBP-100] ;  Sum1
  144| 000226 9C                                        
  144| 000227 CE                          INTO          
  144| 000228 895D                        MOV    [EBP-100], EBX ;  Sum1
  144| 00022A 9C                                        
;  Source Line # 145
  145| 00022B 8B75                        MOV    ESI, [EBP-40] 
  145| 00022D D8                                        
  145| 00022E 3975                        CMP    [EBP-36], ESI 
  145| 000230 DC                                        
  145| 000231 74                          JE     SHORT L36 
  145| 000232 0C                                        
  145| 000233 8B45                        MOV    EAX, [EBP-36] 
  145| 000235 DC                                        
  145| 000236 40                          INC    EAX    
  145| 000237 8945                        MOV    [EBP-36], EAX 
  145| 000239 DC                                        
  145| 00023A E9                          JMP    L38    
  145| 00023B 6CFFFFFF                                  
  145|                 L36:                             
;  Source Line # 146
  146| 00023F 8B55                        MOV    EDX, [EBP-108] ; Spill
  146| 000241 94                                        
  146| 000242 8B42                        MOV    EAX, [EDX+48] 
  146| 000244 30                                        
  146| 000245 8B98                        MOV    EBX, [EAX-136] ;  MC
  146| 000247 78FFFFFF                                  
  146| 00024B 8B4D                        MOV    ECX, [EBP-52] 
  146| 00024D CC                                        
  146| 00024E 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  146| 000250 00000000                                  
  146|                 L73:                             
  146| 000254 0F8F                        JG     L74    
  146| 000256 CF020000                                  
  146| 00025A 8D49                        LEA    ECX, [ECX-1] 
  146| 00025C FF                                        
  146| 00025D 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  146| 000260 00000000                                  
  146| 000264 8B75                        MOV    ESI, [EBP-44] 
  146| 000266 D4                                        
  146| 000267 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  146| 000269 00000000                                  
  146|                 L75:                             
  146| 00026D 0F8F                        JG     L76    
  146| 00026F C2020000                                  
  146| 000273 8D34B5                      LEA    ESI, [4*ESI-4] 
  146| 000276 FCFFFFFF                                  
  146| 00027A 03CE                        ADD    ECX, ESI 
  146| 00027C 8B7D                        MOV    EDI, [EBP-80] ;  alfa1
  146| 00027E B0                                        
  146| 00027F 0FAF7D                      IMUL   EDI, [EBP-100] ;  Sum1
  146| 000282 9C                                        
  146| 000283 CE                          INTO          
  146| 000284 033C0B                      ADD    EDI, [EBX+ECX+0] 
  146| 000287 CE                          INTO          
  146| 000288 8B55                        MOV    EDX, [EBP-84] ;  MT1
  146| 00028A AC                                        
  146| 00028B 8B45                        MOV    EAX, [EBP-52] 
  146| 00028D CC                                        
  146| 00028E 3B05                        CMP    EAX, package1.matr__constrained_array____1 
  146| 000290 00000000                                  
  146|                 L77:                             
  146| 000294 0F8F                        JG     L78    
  146| 000296 A7020000                                  
  146| 00029A 8D40                        LEA    EAX, [EAX-1] 
  146| 00029C FF                                        
  146| 00029D 0FAF05                      IMUL   EAX, package1.matr__COMP_SU_SIZE 
  146| 0002A0 00000000                                  
  146| 0002A4 8B5D                        MOV    EBX, [EBP-44] 
  146| 0002A6 D4                                        
  146| 0002A7 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
  146| 0002A9 00000000                                  
  146|                 L79:                             
  146| 0002AD 0F8F                        JG     L80    
  146| 0002AF 9A020000                                  
  146| 0002B3 8D1C9D                      LEA    EBX, [4*EBX-4] 
  146| 0002B6 FCFFFFFF                                  
  146| 0002BA 03C3                        ADD    EAX, EBX 
  146| 0002BC 893C02                      MOV    [EDX+EAX+0], EDI 
;  Source Line # 147
  147| 0002BF 8B75                        MOV    ESI, [EBP-48] 
  147| 0002C1 D0                                        
  147| 0002C2 3975                        CMP    [EBP-44], ESI 
  147| 0002C4 D4                                        
  147| 0002C5 74                          JE     SHORT L33 
  147| 0002C6 0C                                        
  147| 0002C7 8B45                        MOV    EAX, [EBP-44] 
  147| 0002C9 D4                                        
  147| 0002CA 40                          INC    EAX    
  147| 0002CB 8945                        MOV    [EBP-44], EAX 
  147| 0002CD D4                                        
  147| 0002CE E9                          JMP    L35    
  147| 0002CF B7FEFFFF                                  
  147|                 L33:                             
;  Source Line # 148
  148| 0002D3 8B45                        MOV    EAX, [EBP-56] 
  148| 0002D5 C8                                        
  148| 0002D6 3945                        CMP    [EBP-52], EAX 
  148| 0002D8 CC                                        
  148| 0002D9 74                          JE     SHORT L30 
  148| 0002DA 0C                                        
  148| 0002DB 8B45                        MOV    EAX, [EBP-52] 
  148| 0002DD CC                                        
  148| 0002DE 40                          INC    EAX    
  148| 0002DF 8945                        MOV    [EBP-52], EAX 
  148| 0002E1 CC                                        
  148| 0002E2 E9                          JMP    L32    
  148| 0002E3 89FEFFFF                                  
  148|                 L30:                             
  148| 0002E7 8B05                        MOV    EAX, package1.n 
  148| 0002E9 00000000                                  
  148| 0002ED 8945                        MOV    [EBP-32], EAX 
  148| 0002EF E0                                        
;  Source Line # 149
  149| 0002F0 837D                        CMP    DWORD PTR [EBP-32], 0 
  149| 0002F2 E0                                        
  149| 0002F3 00                                        
  149| 0002F4 0F8E                        JLE    L45    
  149| 0002F6 38010000                                  
  149| 0002FA C745                        MOV    DWORD PTR [EBP-28], 1 
  149| 0002FC E4                                        
  149| 0002FD 01000000                                  
  149|                 L47:                             
  149| 000301 8B05                        MOV    EAX, package1.h 
  149| 000303 00000000                                  
  149| 000307 8945                        MOV    [EBP-24], EAX 
  149| 000309 E8                                        
;  Source Line # 150
  150| 00030A 837D                        CMP    DWORD PTR [EBP-24], 0 
  150| 00030C E8                                        
  150| 00030D 00                                        
  150| 00030E 0F8E                        JLE    L48    
  150| 000310 0A010000                                  
  150| 000314 C745                        MOV    DWORD PTR [EBP-20], 1 
  150| 000316 EC                                        
  150| 000317 01000000                                  
  150|                 L50:                             
;  Source Line # 151
  151| 00031B C745                        MOV    DWORD PTR [EBP-100], 0 ;  Sum1
  151| 00031D 9C                                        
  151| 00031E 00000000                                  
  151| 000322 8B05                        MOV    EAX, package1.n 
  151| 000324 00000000                                  
  151| 000328 8945                        MOV    [EBP-16], EAX 
  151| 00032A F0                                        
;  Source Line # 152
  152| 00032B 837D                        CMP    DWORD PTR [EBP-16], 0 
  152| 00032D F0                                        
  152| 00032E 00                                        
  152| 00032F 0F8E                        JLE    L51    
  152| 000331 92000000                                  
  152| 000335 C745                        MOV    DWORD PTR [EBP-12], 1 
  152| 000337 F4                                        
  152| 000338 01000000                                  
  152|                 L53:                             
;  Source Line # 153
  153| 00033C 8B45                        MOV    EAX, [EBP-84] ;  MT1
  153| 00033E AC                                        
  153| 00033F 8B5D                        MOV    EBX, [EBP-12] 
  153| 000341 F4                                        
  153| 000342 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
  153| 000344 00000000                                  
  153|                 L81:                             
  153| 000348 0F8F                        JG     L82    
  153| 00034A 0B020000                                  
  153| 00034E 8D5B                        LEA    EBX, [EBX-1] 
  153| 000350 FF                                        
  153| 000351 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  153| 000354 00000000                                  
  153| 000358 8B4D                        MOV    ECX, [EBP-20] 
  153| 00035A EC                                        
  153| 00035B 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  153| 00035D 00000000                                  
  153|                 L83:                             
  153| 000361 0F8F                        JG     L84    
  153| 000363 FE010000                                  
  153| 000367 8D0C8D                      LEA    ECX, [4*ECX-4] 
  153| 00036A FCFFFFFF                                  
  153| 00036E 03D9                        ADD    EBX, ECX 
  153| 000370 8B55                        MOV    EDX, [EBP-92] ;  MB1
  153| 000372 A4                                        
  153| 000373 8B75                        MOV    ESI, [EBP-28] 
  153| 000375 E4                                        
  153| 000376 3B35                        CMP    ESI, package1.matr__constrained_array____1 
  153| 000378 00000000                                  
  153|                 L85:                             
  153| 00037C 0F8F                        JG     L86    
  153| 00037E EF010000                                  
  153| 000382 8D76                        LEA    ESI, [ESI-1] 
  153| 000384 FF                                        
  153| 000385 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  153| 000388 00000000                                  
  153| 00038C 8B7D                        MOV    EDI, [EBP-12] 
  153| 00038E F4                                        
  153| 00038F 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  153| 000391 00000000                                  
  153|                 L87:                             
  153| 000395 0F8F                        JG     L88    
  153| 000397 E2010000                                  
  153| 00039B 8D3CBD                      LEA    EDI, [4*EDI-4] 
  153| 00039E FCFFFFFF                                  
  153| 0003A2 03F7                        ADD    ESI, EDI 
  153| 0003A4 8B0418                      MOV    EAX, [EAX+EBX+0] 
  153| 0003A7 0FAF0432                    IMUL   EAX, [EDX+ESI+0] 
  153| 0003AB CE                          INTO          
  153| 0003AC 0345                        ADD    EAX, [EBP-100] ;  Sum1
  153| 0003AE 9C                                        
  153| 0003AF CE                          INTO          
  153| 0003B0 8945                        MOV    [EBP-100], EAX ;  Sum1
  153| 0003B2 9C                                        
;  Source Line # 154
  154| 0003B3 8B4D                        MOV    ECX, [EBP-16] 
  154| 0003B5 F0                                        
  154| 0003B6 394D                        CMP    [EBP-12], ECX 
  154| 0003B8 F4                                        
  154| 0003B9 74                          JE     SHORT L51 
  154| 0003BA 0C                                        
  154| 0003BB 8B45                        MOV    EAX, [EBP-12] 
  154| 0003BD F4                                        
  154| 0003BE 40                          INC    EAX    
  154| 0003BF 8945                        MOV    [EBP-12], EAX 
  154| 0003C1 F4                                        
  154| 0003C2 E9                          JMP    L53    
  154| 0003C3 75FFFFFF                                  
  154|                 L51:                             
;  Source Line # 155
  155| 0003C7 8B55                        MOV    EDX, [EBP-108] ; Spill
  155| 0003C9 94                                        
  155| 0003CA 8B42                        MOV    EAX, [EDX+48] 
  155| 0003CC 30                                        
  155| 0003CD 8B98                        MOV    EBX, [EAX-140] ;  MA
  155| 0003CF 74FFFFFF                                  
  155| 0003D3 8B4D                        MOV    ECX, [EBP-28] 
  155| 0003D5 E4                                        
  155| 0003D6 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  155| 0003D8 00000000                                  
  155|                 L89:                             
  155| 0003DC 0F8F                        JG     L90    
  155| 0003DE A7010000                                  
  155| 0003E2 8D49                        LEA    ECX, [ECX-1] 
  155| 0003E4 FF                                        
  155| 0003E5 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  155| 0003E8 00000000                                  
  155| 0003EC 8B75                        MOV    ESI, [EBP-20] 
  155| 0003EE EC                                        
  155| 0003EF 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  155| 0003F1 00000000                                  
  155|                 L91:                             
  155| 0003F5 0F8F                        JG     L92    
  155| 0003F7 9A010000                                  
  155| 0003FB 8D34B5                      LEA    ESI, [4*ESI-4] 
  155| 0003FE FCFFFFFF                                  
  155| 000402 03CE                        ADD    ECX, ESI 
  155| 000404 8B7D                        MOV    EDI, [EBP-100] ;  Sum1
  155| 000406 9C                                        
  155| 000407 893C0B                      MOV    [EBX+ECX+0], EDI 
;  Source Line # 156
  156| 00040A 8B55                        MOV    EDX, [EBP-24] 
  156| 00040C E8                                        
  156| 00040D 3955                        CMP    [EBP-20], EDX 
  156| 00040F EC                                        
  156| 000410 74                          JE     SHORT L48 
  156| 000411 0C                                        
  156| 000412 8B45                        MOV    EAX, [EBP-20] 
  156| 000414 EC                                        
  156| 000415 40                          INC    EAX    
  156| 000416 8945                        MOV    [EBP-20], EAX 
  156| 000418 EC                                        
  156| 000419 E9                          JMP    L50    
  156| 00041A FDFEFFFF                                  
  156|                 L48:                             
;  Source Line # 157
  157| 00041E 8B45                        MOV    EAX, [EBP-32] 
  157| 000420 E0                                        
  157| 000421 3945                        CMP    [EBP-28], EAX 
  157| 000423 E4                                        
  157| 000424 74                          JE     SHORT L45 
  157| 000425 0C                                        
  157| 000426 8B45                        MOV    EAX, [EBP-28] 
  157| 000428 E4                                        
  157| 000429 40                          INC    EAX    
  157| 00042A 8945                        MOV    [EBP-28], EAX 
  157| 00042C E4                                        
  157| 00042D E9                          JMP    L47    
  157| 00042E CFFEFFFF                                  
  157|                 L45:                             
;  Source Line # 159
  159| 000432 6A                          PUSH   0      
  159| 000433 00                                        
  159| 000434 6A                          PUSH   1      
  159| 000435 01                                        
  159| 000436 6A                          PUSH   0      
  159| 000437 00                                        
  159| 000438 8B55                        MOV    EDX, [EBP-108] ; Spill
  159| 00043A 94                                        
  159| 00043B 8B42                        MOV    EAX, [EDX+48] 
  159| 00043D 30                                        
  159| 00043E 8B58                        MOV    EBX, [EAX-44] ;  MON
  159| 000440 D4                                        
  159| 000441 53                          PUSH   EBX    
  159| 000442 E8                          CALL   rts_protected_entry_call 
  159| 000443 00000000                                  
;  Source Line # 161
  161| 000447 833D                        CMP    DWORD PTR package1.n, 24 
  161| 000449 00000000                                  
  161| 00044D 18                                        
  161| 00044E 7D                          JGE    SHORT L60 
  161| 00044F 12                                        
;  Source Line # 162
  162| 000450 8B55                        MOV    EDX, [EBP-108] ; Spill
  162| 000452 94                                        
  162| 000453 8B42                        MOV    EAX, [EDX+48] 
  162| 000455 30                                        
  162| 000456 8B98                        MOV    EBX, [EAX-140] ;  MA
  162| 000458 74FFFFFF                                  
  162| 00045C 53                          PUSH   EBX    
  162| 00045D E8                          CALL   package1.matr_print 
  162| 00045E 00000000                                  
;  Source Line # 163
  163|                 L60:                             
;  Source Line # 165
  165| 000462 8D45                        LEA    EAX, [EBP-8] 
  165| 000464 F8                                        
  165| 000465 50                          PUSH   EAX    
  165| 000466 E8                          CALL   ada.calendar.clock 
  165| 000467 00000000                                  
  165| 00046B 8B55                        MOV    EDX, [EBP-108] ; Spill
  165| 00046D 94                                        
  165| 00046E 8B5A                        MOV    EBX, [EDX+48] 
  165| 000470 30                                        
  165| 000471 8D30                        LEA    ESI, [EAX+0] 
  165| 000473 8D7B                        LEA    EDI, [EBX-116] ;  time2
  165| 000475 8C                                        
  165| 000476 A5                          MOVSD         
  165| 000477 A5                          MOVSD         
;  Source Line # 166
  166| 000478 8B4A                        MOV    ECX, [EDX+48] 
  166| 00047A 30                                        
  166| 00047B 8D49                        LEA    ECX, [ECX-124] ;  time1
  166| 00047D 84                                        
  166| 00047E 51                          PUSH   ECX    
  166| 00047F 8B42                        MOV    EAX, [EDX+48] 
  166| 000481 30                                        
  166| 000482 8D40                        LEA    EAX, [EAX-116] ;  time2
  166| 000484 8C                                        
  166| 000485 50                          PUSH   EAX    
  166| 000486 E8                          CALL   ada.calendar.-__2 
  166| 000487 00000000                                  
  166| 00048B 8B55                        MOV    EDX, [EBP-108] ; Spill
  166| 00048D 94                                        
  166| 00048E 8B5A                        MOV    EBX, [EDX+48] 
  166| 000490 30                                        
  166| 000491 8943                        MOV    [EBX-128], EAX ;  Time_all
  166| 000493 80                                        
;  Source Line # 167
  167| 000494 0FB635                      MOVZX  ESI, BYTE PTR ada.integer_text_io.default_base
  167| 000497 00000000                                  
  167| 00049B 56                          PUSH   ESI    
  167| 00049C FF35                        PUSH   DWORD PTR ada.integer_text_io.default_width 
  167| 00049E 00000000                                  
  167| 0004A2 8B7A                        MOV    EDI, [EDX+48] 
  167| 0004A4 30                                        
  167| 0004A5 B9                          MOV    ECX, 16384 
  167| 0004A6 00400000                                  
  167| 0004AA 8B47                        MOV    EAX, [EDI-128] ;  Time_all
  167| 0004AC 80                                        
  167| 0004AD 99                          CDQ           
  167| 0004AE F7F9                        IDIV   ECX    
  167| 0004B0 8BDA                        MOV    EBX, EDX 
  167| 0004B2 33D9                        XOR    EBX, ECX 
  167| 0004B4 C1FB                        SAR    EBX, 30 
  167| 0004B6 1E                                        
  167| 0004B7 83E3                        AND    EBX, -2 
  167| 0004B9 FE                                        
  167| 0004BA 83CB                        OR     EBX, 1 
  167| 0004BC 01                                        
  167| 0004BD 0BD2                        OR     EDX, EDX 
  167| 0004BF 7D                          JGE    SHORT L93 
  167| 0004C0 02                                        
  167| 0004C1 F7DA                        NEG    EDX    
  167|                 L93:                             
  167| 0004C3 D1E2                        SHL    EDX, 1 
  167| 0004C5 0BC9                        OR     ECX, ECX 
  167| 0004C7 7D                          JGE    SHORT L94 
  167| 0004C8 02                                        
  167| 0004C9 F7D9                        NEG    ECX    
  167|                 L94:                             
  167| 0004CB 0BD2                        OR     EDX, EDX 
  167| 0004CD 74                          JE     SHORT L95 
  167| 0004CE 06                                        
  167| 0004CF 3BCA                        CMP    ECX, EDX 
  167| 0004D1 77                          JA     SHORT L95 
  167| 0004D2 02                                        
  167| 0004D3 03C3                        ADD    EAX, EBX 
  167|                 L95:                             
  167| 0004D5 50                          PUSH   EAX    
  167| 0004D6 E8                          CALL   ada.integer_text_io.put__2 
  167| 0004D7 00000000                                  
;  Source Line # 169
  169| 0004DB 68                          PUSH   __lcl.00000205 
  169| 0004DC 00000000                                  
  169| 0004E0 68                          PUSH   __lcl.00000204 
  169| 0004E1 00000000                                  
  169| 0004E5 E8                          CALL   ada.text_io.put_line__2 
  169| 0004E6 00000000                                  
  169| 0004EA 8D75                        LEA    ESI, [EBP-96] ;  dyn_temp
  169| 0004EC A0                                        
  169| 0004ED 56                          PUSH   ESI    
  169| 0004EE E8                          CALL   rts_ss_release 
  169| 0004EF 00000000                                  
;  Source Line # 170
  170| 0004F3 8BE5                        MOV    ESP, EBP 
  170| 0004F5 5D                          POP    EBP    
  170| 0004F6 C2                          RET    4      
  170| 0004F7 0400                                      
  170|                 L66:                             
  170| 0004F9 8D05                        LEA    EAX, L65+5 
  170| 0004FB C5010000                                  
  170| 0004FF 50                          PUSH   EAX    
  170| 000500 E9                          JMP    rts_raise_constraint_error 
  170| 000501 00000000                                  
  170|                 L68:                             
  170| 000505 8D05                        LEA    EAX, L67+5 
  170| 000507 DE010000                                  
  170| 00050B 50                          PUSH   EAX    
  170| 00050C E9                          JMP    rts_raise_constraint_error 
  170| 00050D 00000000                                  
  170|                 L70:                             
  170| 000511 8D05                        LEA    EAX, L69+5 
  170| 000513 F9010000                                  
  170| 000517 50                          PUSH   EAX    
  170| 000518 E9                          JMP    rts_raise_constraint_error 
  170| 000519 00000000                                  
  170|                 L72:                             
  170| 00051D 8D05                        LEA    EAX, L71+5 
  170| 00051F 12020000                                  
  170| 000523 50                          PUSH   EAX    
  170| 000524 E9                          JMP    rts_raise_constraint_error 
  170| 000525 00000000                                  
  170|                 L74:                             
  170| 000529 8D05                        LEA    EAX, L73+5 
  170| 00052B 59020000                                  
  170| 00052F 50                          PUSH   EAX    
  170| 000530 E9                          JMP    rts_raise_constraint_error 
  170| 000531 00000000                                  
  170|                 L76:                             
  170| 000535 8D05                        LEA    EAX, L75+5 
  170| 000537 72020000                                  
  170| 00053B 50                          PUSH   EAX    
  170| 00053C E9                          JMP    rts_raise_constraint_error 
  170| 00053D 00000000                                  
  170|                 L78:                             
  170| 000541 8D05                        LEA    EAX, L77+5 
  170| 000543 99020000                                  
  170| 000547 50                          PUSH   EAX    
  170| 000548 E9                          JMP    rts_raise_constraint_error 
  170| 000549 00000000                                  
  170|                 L80:                             
  170| 00054D 8D05                        LEA    EAX, L79+5 
  170| 00054F B2020000                                  
  170| 000553 50                          PUSH   EAX    
  170| 000554 E9                          JMP    rts_raise_constraint_error 
  170| 000555 00000000                                  
  170|                 L82:                             
  170| 000559 8D05                        LEA    EAX, L81+5 
  170| 00055B 4D030000                                  
  170| 00055F 50                          PUSH   EAX    
  170| 000560 E9                          JMP    rts_raise_constraint_error 
  170| 000561 00000000                                  
  170|                 L84:                             
  170| 000565 8D05                        LEA    EAX, L83+5 
  170| 000567 66030000                                  
  170| 00056B 50                          PUSH   EAX    
  170| 00056C E9                          JMP    rts_raise_constraint_error 
  170| 00056D 00000000                                  
  170|                 L86:                             
  170| 000571 8D05                        LEA    EAX, L85+5 
  170| 000573 81030000                                  
  170| 000577 50                          PUSH   EAX    
  170| 000578 E9                          JMP    rts_raise_constraint_error 
  170| 000579 00000000                                  
  170|                 L88:                             
  170| 00057D 8D05                        LEA    EAX, L87+5 
  170| 00057F 9A030000                                  
  170| 000583 50                          PUSH   EAX    
  170| 000584 E9                          JMP    rts_raise_constraint_error 
  170| 000585 00000000                                  
  170|                 L90:                             
  170| 000589 8D05                        LEA    EAX, L89+5 
  170| 00058B E1030000                                  
  170| 00058F 50                          PUSH   EAX    
  170| 000590 E9                          JMP    rts_raise_constraint_error 
  170| 000591 00000000                                  
  170|                 L92:                             
  170| 000595 8D05                        LEA    EAX, L91+5 
  170| 000597 FA030000                                  
  170| 00059B 50                          PUSH   EAX    
  170| 00059C E9                          JMP    rts_raise_constraint_error 
  170| 00059D 00000000                                  
                       ;                                
                       lab4.start.t1__body ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000371     DD     00002801 
                                          DD     00000079 
                                          DD     lab4.start.t1__body 
                                          DD     __lcl.00000382 
                                          DD     0000007B 
                                          DD     lab4.start.t1__body+00000010H 
                                          DD     __lcl.00000382 
                                          DD     0000007D 
                                          DD     lab4.start.t1__body+0000007EH 
                                          DD     __lcl.00000382 
                                          DD     0000007E 
                                          DD     lab4.start.t1__body+00000083H 
                                          DD     __lcl.00000382 
                                          DD     00000080 
                                          DD     lab4.start.t1__body+00000092H 
                                          DD     __lcl.00000382 
                                          DD     00000081 
                                          DD     lab4.start.t1__body+0000009BH 
                                          DD     __lcl.00000382 
                                          DD     00000082 
                                          DD     lab4.start.t1__body+000000B9H 
                                          DD     __lcl.00000382 
                                          DD     00000084 
                                          DD     lab4.start.t1__body+000000CBH 
                                          DD     __lcl.00000382 
                                          DD     00000086 
                                          DD     lab4.start.t1__body+000000E1H 
                                          DD     __lcl.00000382 
                                          DD     00000088 
                                          DD     lab4.start.t1__body+000000F6H 
                                          DD     __lcl.00000382 
                                          DD     00000089 
                                          DD     lab4.start.t1__body+00000114H 
                                          DD     __lcl.00000382 
                                          DD     0000008A 
                                          DD     lab4.start.t1__body+00000132H 
                                          DD     __lcl.00000382 
                                          DD     0000008C 
                                          DD     lab4.start.t1__body+0000015FH 
                                          DD     __lcl.00000382 
                                          DD     0000008D 
                                          DD     lab4.start.t1__body+00000179H 
                                          DD     __lcl.00000382 
                                          DD     0000008E 
                                          DD     lab4.start.t1__body+0000018AH 
                                          DD     __lcl.00000382 
                                          DD     0000008F 
                                          DD     lab4.start.t1__body+0000019AH 
                                          DD     __lcl.00000382 
                                          DD     00000090 
                                          DD     lab4.start.t1__body+000001ABH 
                                          DD     __lcl.00000382 
                                          DD     00000091 
                                          DD     lab4.start.t1__body+0000022BH 
                                          DD     __lcl.00000382 
                                          DD     00000092 
                                          DD     lab4.start.t1__body+0000023FH 
                                          DD     __lcl.00000382 
                                          DD     00000093 
                                          DD     lab4.start.t1__body+000002BFH 
                                          DD     __lcl.00000382 
                                          DD     00000094 
                                          DD     lab4.start.t1__body+000002D3H 
                                          DD     __lcl.00000382 
                                          DD     00000095 
                                          DD     lab4.start.t1__body+000002F0H 
                                          DD     __lcl.00000382 
                                          DD     00000096 
                                          DD     lab4.start.t1__body+0000030AH 
                                          DD     __lcl.00000382 
                                          DD     00000097 
                                          DD     lab4.start.t1__body+0000031BH 
                                          DD     __lcl.00000382 
                                          DD     00000098 
                                          DD     lab4.start.t1__body+0000032BH 
                                          DD     __lcl.00000382 
                                          DD     00000099 
                                          DD     lab4.start.t1__body+0000033CH 
                                          DD     __lcl.00000382 
                                          DD     0000009A 
                                          DD     lab4.start.t1__body+000003B3H 
                                          DD     __lcl.00000382 
                                          DD     0000009B 
                                          DD     lab4.start.t1__body+000003C7H 
                                          DD     __lcl.00000382 
                                          DD     0000009C 
                                          DD     lab4.start.t1__body+0000040AH 
                                          DD     __lcl.00000382 
                                          DD     0000009D 
                                          DD     lab4.start.t1__body+0000041EH 
                                          DD     __lcl.00000382 
                                          DD     0000009F 
                                          DD     lab4.start.t1__body+00000432H 
                                          DD     __lcl.00000382 
                                          DD     000000A1 
                                          DD     lab4.start.t1__body+00000447H 
                                          DD     __lcl.00000382 
                                          DD     000000A2 
                                          DD     lab4.start.t1__body+00000450H 
                                          DD     __lcl.00000382 
                                          DD     000000A3 
                                          DD     lab4.start.t1__body+00000462H 
                                          DD     __lcl.00000382 
                                          DD     000000A5 
                                          DD     lab4.start.t1__body+00000462H 
                                          DD     __lcl.00000382 
                                          DD     000000A6 
                                          DD     lab4.start.t1__body+00000478H 
                                          DD     __lcl.00000382 
                                          DD     000000A7 
                                          DD     lab4.start.t1__body+00000494H 
                                          DD     __lcl.00000382 
                                          DD     000000A9 
                                          DD     lab4.start.t1__body+000004DBH 
                                          DD     __lcl.00000382 
                                          DD     000000AA 
                                          DD     lab4.start.t1__body+000004F3H 
                                          DD     __lcl.00000382 
                                          DD     000000AA 
                                          DD     lab4.start.t1__body+0000059DH 
                                          DD     __lcl.00000382 
; ********* End of segment, Total Size = 484

                       ;                                
                       ;  Start of procedure lab4.start.t2__body   
                       ;                                
                                          PUBLIC lab4.start.t2__body 
                       lab4.start.t2__body PROC  NEAR   
;  Source Line # 173
  173| 000000 64                          FS:           
  173| 000001 8B15                        MOV    EDX, 4 
  173| 000003 04000000                                  
  173| 000007 8B52                        MOV    EDX, [EDX-4] 
  173| 000009 FC                                        
  173| 00000A 55                          PUSH   EBP    
  173| 00000B 8BEC                        MOV    EBP, ESP 
  173| 00000D 83EC                        SUB    ESP, 104 
  173| 00000F 68                                        
;  Source Line # 175
  175| 000010 8B02                        MOV    EAX, [EDX+0] 
  175| 000012 8945                        MOV    [EBP-92], EAX ;  dyn_temp
  175| 000014 A4                                        
  175| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  175| 000017 00000000                                  
  175| 00001B 83EB                        SUB    EBX, 1 
  175| 00001D 01                                        
  175| 00001E 7D                          JGE    SHORT L60 
  175| 00001F 03                                        
  175| 000020 33DB                        XOR    EBX, EBX 
  175| 000022 4B                          DEC    EBX    
  175|                 L60:                             
  175| 000023 CE                          INTO          
  175| 000024 43                          INC    EBX    
  175| 000025 CE                          INTO          
  175| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  175| 000029 00000000                                  
  175| 00002D CE                          INTO          
  175| 00002E 53                          PUSH   EBX    
  175| 00002F 8955                        MOV    [EBP-104], EDX ; Spill
  175| 000031 98                                        
  175| 000032 E8                          CALL   rts_ss_allocate 
  175| 000033 00000000                                  
  175| 000037 8945                        MOV    [EBP-88], EAX ;  MB2
  175| 000039 A8                                        
  175| 00003A 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
  175| 00003C 00000000                                  
  175| 000040 83E9                        SUB    ECX, 1 
  175| 000042 01                                        
  175| 000043 7D                          JGE    SHORT L61 
  175| 000044 03                                        
  175| 000045 33C9                        XOR    ECX, ECX 
  175| 000047 49                          DEC    ECX    
  175|                 L61:                             
  175| 000048 CE                          INTO          
  175| 000049 41                          INC    ECX    
  175| 00004A CE                          INTO          
  175| 00004B 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  175| 00004E 00000000                                  
  175| 000052 CE                          INTO          
  175| 000053 51                          PUSH   ECX    
  175| 000054 E8                          CALL   rts_ss_allocate 
  175| 000055 00000000                                  
  175| 000059 8945                        MOV    [EBP-84], EAX ;  MZ2
  175| 00005B AC                                        
  175| 00005C 8B35                        MOV    ESI, package1.matr__constrained_array____1 
  175| 00005E 00000000                                  
  175| 000062 83EE                        SUB    ESI, 1 
  175| 000064 01                                        
  175| 000065 7D                          JGE    SHORT L62 
  175| 000066 03                                        
  175| 000067 33F6                        XOR    ESI, ESI 
  175| 000069 4E                          DEC    ESI    
  175|                 L62:                             
  175| 00006A CE                          INTO          
  175| 00006B 46                          INC    ESI    
  175| 00006C CE                          INTO          
  175| 00006D 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  175| 000070 00000000                                  
  175| 000074 CE                          INTO          
  175| 000075 56                          PUSH   ESI    
  175| 000076 E8                          CALL   rts_ss_allocate 
  175| 000077 00000000                                  
  175| 00007B 8945                        MOV    [EBP-80], EAX ;  MT2
  175| 00007D B0                                        
;  Source Line # 177
  177| 00007E E8                          CALL   rts_activation_succeeded 
  177| 00007F 00000000                                  
;  Source Line # 178
  178| 000083 68                          PUSH   __lcl.00000214 
  178| 000084 00000000                                  
  178| 000088 68                          PUSH   __lcl.00000213 
  178| 000089 00000000                                  
  178| 00008D E8                          CALL   ada.text_io.put_line__2 
  178| 00008E 00000000                                  
;  Source Line # 180
  180| 000092 8B55                        MOV    EDX, [EBP-104] ; Spill
  180| 000094 98                                        
  180| 000095 8B7A                        MOV    EDI, [EDX+48] 
  180| 000097 30                                        
  180| 000098 8B9F                        MOV    EBX, [EDI-136] ;  MC
  180| 00009A 78FFFFFF                                  
  180| 00009E 53                          PUSH   EBX    
  180| 00009F E8                          CALL   package1.matr_input 
  180| 0000A0 00000000                                  
;  Source Line # 182
  182| 0000A4 68                          PUSH   lab4.mon.datasignal 
  182| 0000A5 00000000                                  
  182| 0000A9 6A                          PUSH   0      
  182| 0000AA 00                                        
  182| 0000AB 8B55                        MOV    EDX, [EBP-104] ; Spill
  182| 0000AD 98                                        
  182| 0000AE 8B4A                        MOV    ECX, [EDX+48] 
  182| 0000B0 30                                        
  182| 0000B1 8B71                        MOV    ESI, [ECX-44] ;  MON
  182| 0000B3 D4                                        
  182| 0000B4 56                          PUSH   ESI    
  182| 0000B5 E8                          CALL   rts_protected_procedure_call 
  182| 0000B6 00000000                                  
;  Source Line # 183
  183| 0000BA 6A                          PUSH   0      
  183| 0000BB 00                                        
  183| 0000BC 6A                          PUSH   0      
  183| 0000BD 00                                        
  183| 0000BE 6A                          PUSH   0      
  183| 0000BF 00                                        
  183| 0000C0 8B55                        MOV    EDX, [EBP-104] ; Spill
  183| 0000C2 98                                        
  183| 0000C3 8B42                        MOV    EAX, [EDX+48] 
  183| 0000C5 30                                        
  183| 0000C6 8B78                        MOV    EDI, [EAX-44] ;  MON
  183| 0000C8 D4                                        
  183| 0000C9 57                          PUSH   EDI    
  183| 0000CA E8                          CALL   rts_protected_entry_call 
  183| 0000CB 00000000                                  
;  Source Line # 185
  185| 0000CF 8B5D                        MOV    EBX, [EBP-84] ;  MZ2
  185| 0000D1 AC                                        
  185| 0000D2 895D                        MOV    [EBP-72], EBX 
  185| 0000D4 B8                                        
  185| 0000D5 68                          PUSH   lab4.mon.getmz 
  185| 0000D6 00000000                                  
  185| 0000DA 8D4D                        LEA    ECX, [EBP-72] 
  185| 0000DC B8                                        
  185| 0000DD 51                          PUSH   ECX    
  185| 0000DE 8B55                        MOV    EDX, [EBP-104] ; Spill
  185| 0000E0 98                                        
  185| 0000E1 8B72                        MOV    ESI, [EDX+48] 
  185| 0000E3 30                                        
  185| 0000E4 8B46                        MOV    EAX, [ESI-44] ;  MON
  185| 0000E6 D4                                        
  185| 0000E7 50                          PUSH   EAX    
  185| 0000E8 E8                          CALL   rts_entryless_protected_subp_call 
  185| 0000E9 00000000                                  
;  Source Line # 186
  186| 0000ED 8B7D                        MOV    EDI, [EBP-88] ;  MB2
  186| 0000EF A8                                        
  186| 0000F0 897D                        MOV    [EBP-68], EDI 
  186| 0000F2 BC                                        
  186| 0000F3 68                          PUSH   lab4.mon.getmb 
  186| 0000F4 00000000                                  
  186| 0000F8 8D5D                        LEA    EBX, [EBP-68] 
  186| 0000FA BC                                        
  186| 0000FB 53                          PUSH   EBX    
  186| 0000FC 8B55                        MOV    EDX, [EBP-104] ; Spill
  186| 0000FE 98                                        
  186| 0000FF 8B4A                        MOV    ECX, [EDX+48] 
  186| 000101 30                                        
  186| 000102 8B71                        MOV    ESI, [ECX-44] ;  MON
  186| 000104 D4                                        
  186| 000105 56                          PUSH   ESI    
  186| 000106 E8                          CALL   rts_entryless_protected_subp_call 
  186| 000107 00000000                                  
;  Source Line # 187
  187| 00010B 8D45                        LEA    EAX, [EBP-64] 
  187| 00010D C0                                        
  187| 00010E 8945                        MOV    [EBP-60], EAX 
  187| 000110 C4                                        
  187| 000111 68                          PUSH   lab4.mon.getalfa 
  187| 000112 00000000                                  
  187| 000116 8D7D                        LEA    EDI, [EBP-60] 
  187| 000118 C4                                        
  187| 000119 57                          PUSH   EDI    
  187| 00011A 8B55                        MOV    EDX, [EBP-104] ; Spill
  187| 00011C 98                                        
  187| 00011D 8B5A                        MOV    EBX, [EDX+48] 
  187| 00011F 30                                        
  187| 000120 8B4B                        MOV    ECX, [EBX-44] ;  MON
  187| 000122 D4                                        
  187| 000123 51                          PUSH   ECX    
  187| 000124 E8                          CALL   rts_entryless_protected_subp_call 
  187| 000125 00000000                                  
  187| 000129 8B75                        MOV    ESI, [EBP-64] 
  187| 00012B C0                                        
  187| 00012C 8975                        MOV    [EBP-76], ESI ;  alfa2
  187| 00012E B4                                        
  187| 00012F 8B05                        MOV    EAX, package1.n 
  187| 000131 00000000                                  
  187| 000135 8945                        MOV    [EBP-56], EAX 
  187| 000137 C8                                        
;  Source Line # 189
  189| 000138 837D                        CMP    DWORD PTR [EBP-56], 0 
  189| 00013A C8                                        
  189| 00013B 00                                        
  189| 00013C 0F8E                        JLE    L30    
  189| 00013E 9F010000                                  
  189| 000142 C745                        MOV    DWORD PTR [EBP-52], 1 
  189| 000144 CC                                        
  189| 000145 01000000                                  
  189|                 L32:                             
  189| 000149 8B05                        MOV    EAX, package1.h 
  189| 00014B 00000000                                  
  189| 00014F 40                          INC    EAX    
  189| 000150 CE                          INTO          
  189| 000151 8945                        MOV    [EBP-48], EAX 
  189| 000153 D0                                        
  189| 000154 8B1D                        MOV    EBX, package1.h 
  189| 000156 00000000                                  
  189| 00015A D1E3                        SHL    EBX, 1 
  189| 00015C CE                          INTO          
  189| 00015D 895D                        MOV    [EBP-44], EBX 
  189| 00015F D4                                        
;  Source Line # 190
  190| 000160 8B4D                        MOV    ECX, [EBP-44] 
  190| 000162 D4                                        
  190| 000163 394D                        CMP    [EBP-48], ECX 
  190| 000165 D0                                        
  190| 000166 0F8F                        JG     L33    
  190| 000168 61010000                                  
  190| 00016C 8B45                        MOV    EAX, [EBP-48] 
  190| 00016E D0                                        
  190| 00016F 8945                        MOV    [EBP-40], EAX 
  190| 000171 D8                                        
  190|                 L35:                             
;  Source Line # 191
  191| 000172 C745                        MOV    DWORD PTR [EBP-96], 0 ;  Sum1
  191| 000174 A0                                        
  191| 000175 00000000                                  
  191| 000179 8B05                        MOV    EAX, package1.n 
  191| 00017B 00000000                                  
  191| 00017F 8945                        MOV    [EBP-36], EAX 
  191| 000181 DC                                        
;  Source Line # 192
  192| 000182 837D                        CMP    DWORD PTR [EBP-36], 0 
  192| 000184 DC                                        
  192| 000185 00                                        
  192| 000186 0F8E                        JLE    L36    
  192| 000188 A4000000                                  
  192| 00018C C745                        MOV    DWORD PTR [EBP-32], 1 
  192| 00018E E0                                        
  192| 00018F 01000000                                  
  192|                 L38:                             
;  Source Line # 193
  193| 000193 8B55                        MOV    EDX, [EBP-104] ; Spill
  193| 000195 98                                        
  193| 000196 8B42                        MOV    EAX, [EDX+48] 
  193| 000198 30                                        
  193| 000199 8B98                        MOV    EBX, [EAX-132] ;  MK
  193| 00019B 7CFFFFFF                                  
  193| 00019F 8B4D                        MOV    ECX, [EBP-32] 
  193| 0001A1 E0                                        
  193| 0001A2 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  193| 0001A4 00000000                                  
  193|                 L63:                             
  193| 0001A8 0F8F                        JG     L64    
  193| 0001AA D3020000                                  
  193| 0001AE 8D49                        LEA    ECX, [ECX-1] 
  193| 0001B0 FF                                        
  193| 0001B1 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  193| 0001B4 00000000                                  
  193| 0001B8 8B75                        MOV    ESI, [EBP-40] 
  193| 0001BA D8                                        
  193| 0001BB 83FE                        CMP    ESI, 1 
  193| 0001BD 01                                        
  193|                 L65:                             
  193| 0001BE 0F8C                        JL     L66    
  193| 0001C0 C9020000                                  
  193| 0001C4 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  193| 0001C6 00000000                                  
  193| 0001CA 0F8F                        JG     L66    
  193| 0001CC BD020000                                  
  193| 0001D0 8D34B5                      LEA    ESI, [4*ESI-4] 
  193| 0001D3 FCFFFFFF                                  
  193| 0001D7 03CE                        ADD    ECX, ESI 
  193| 0001D9 8B7D                        MOV    EDI, [EBP-84] ;  MZ2
  193| 0001DB AC                                        
  193| 0001DC 8B55                        MOV    EDX, [EBP-52] 
  193| 0001DE CC                                        
  193| 0001DF 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  193| 0001E1 00000000                                  
  193|                 L67:                             
  193| 0001E5 0F8F                        JG     L68    
  193| 0001E7 AE020000                                  
  193| 0001EB 8D52                        LEA    EDX, [EDX-1] 
  193| 0001ED FF                                        
  193| 0001EE 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  193| 0001F1 00000000                                  
  193| 0001F5 8B45                        MOV    EAX, [EBP-32] 
  193| 0001F7 E0                                        
  193| 0001F8 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  193| 0001FA 00000000                                  
  193|                 L69:                             
  193| 0001FE 0F8F                        JG     L70    
  193| 000200 A1020000                                  
  193| 000204 8D0485                      LEA    EAX, [4*EAX-4] 
  193| 000207 FCFFFFFF                                  
  193| 00020B 03D0                        ADD    EDX, EAX 
  193| 00020D 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  193| 000210 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  193| 000214 CE                          INTO          
  193| 000215 035D                        ADD    EBX, [EBP-96] ;  Sum1
  193| 000217 A0                                        
  193| 000218 CE                          INTO          
  193| 000219 895D                        MOV    [EBP-96], EBX ;  Sum1
  193| 00021B A0                                        
;  Source Line # 194
  194| 00021C 8B75                        MOV    ESI, [EBP-36] 
  194| 00021E DC                                        
  194| 00021F 3975                        CMP    [EBP-32], ESI 
  194| 000221 E0                                        
  194| 000222 74                          JE     SHORT L36 
  194| 000223 0C                                        
  194| 000224 8B45                        MOV    EAX, [EBP-32] 
  194| 000226 E0                                        
  194| 000227 40                          INC    EAX    
  194| 000228 8945                        MOV    [EBP-32], EAX 
  194| 00022A E0                                        
  194| 00022B E9                          JMP    L38    
  194| 00022C 63FFFFFF                                  
  194|                 L36:                             
;  Source Line # 195
  195| 000230 8B55                        MOV    EDX, [EBP-104] ; Spill
  195| 000232 98                                        
  195| 000233 8B42                        MOV    EAX, [EDX+48] 
  195| 000235 30                                        
  195| 000236 8B98                        MOV    EBX, [EAX-136] ;  MC
  195| 000238 78FFFFFF                                  
  195| 00023C 8B4D                        MOV    ECX, [EBP-52] 
  195| 00023E CC                                        
  195| 00023F 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  195| 000241 00000000                                  
  195|                 L71:                             
  195| 000245 0F8F                        JG     L72    
  195| 000247 66020000                                  
  195| 00024B 8D49                        LEA    ECX, [ECX-1] 
  195| 00024D FF                                        
  195| 00024E 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  195| 000251 00000000                                  
  195| 000255 8B75                        MOV    ESI, [EBP-40] 
  195| 000257 D8                                        
  195| 000258 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  195| 00025A 00000000                                  
  195|                 L73:                             
  195| 00025E 0F8F                        JG     L74    
  195| 000260 59020000                                  
  195| 000264 8D34B5                      LEA    ESI, [4*ESI-4] 
  195| 000267 FCFFFFFF                                  
  195| 00026B 03CE                        ADD    ECX, ESI 
  195| 00026D 8B7D                        MOV    EDI, [EBP-76] ;  alfa2
  195| 00026F B4                                        
  195| 000270 0FAF7D                      IMUL   EDI, [EBP-96] ;  Sum1
  195| 000273 A0                                        
  195| 000274 CE                          INTO          
  195| 000275 033C0B                      ADD    EDI, [EBX+ECX+0] 
  195| 000278 CE                          INTO          
  195| 000279 8B55                        MOV    EDX, [EBP-80] ;  MT2
  195| 00027B B0                                        
  195| 00027C 8B45                        MOV    EAX, [EBP-52] 
  195| 00027E CC                                        
  195| 00027F 3B05                        CMP    EAX, package1.matr__constrained_array____1 
  195| 000281 00000000                                  
  195|                 L75:                             
  195| 000285 0F8F                        JG     L76    
  195| 000287 3E020000                                  
  195| 00028B 8D40                        LEA    EAX, [EAX-1] 
  195| 00028D FF                                        
  195| 00028E 0FAF05                      IMUL   EAX, package1.matr__COMP_SU_SIZE 
  195| 000291 00000000                                  
  195| 000295 8B5D                        MOV    EBX, [EBP-40] 
  195| 000297 D8                                        
  195| 000298 83FB                        CMP    EBX, 1 
  195| 00029A 01                                        
  195|                 L77:                             
  195| 00029B 0F8C                        JL     L78    
  195| 00029D 34020000                                  
  195| 0002A1 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
  195| 0002A3 00000000                                  
  195| 0002A7 0F8F                        JG     L78    
  195| 0002A9 28020000                                  
  195| 0002AD 8D1C9D                      LEA    EBX, [4*EBX-4] 
  195| 0002B0 FCFFFFFF                                  
  195| 0002B4 03C3                        ADD    EAX, EBX 
  195| 0002B6 893C02                      MOV    [EDX+EAX+0], EDI 
;  Source Line # 196
  196| 0002B9 8B75                        MOV    ESI, [EBP-44] 
  196| 0002BB D4                                        
  196| 0002BC 3975                        CMP    [EBP-40], ESI 
  196| 0002BE D8                                        
  196| 0002BF 74                          JE     SHORT L33 
  196| 0002C0 0C                                        
  196| 0002C1 8B45                        MOV    EAX, [EBP-40] 
  196| 0002C3 D8                                        
  196| 0002C4 40                          INC    EAX    
  196| 0002C5 8945                        MOV    [EBP-40], EAX 
  196| 0002C7 D8                                        
  196| 0002C8 E9                          JMP    L35    
  196| 0002C9 A5FEFFFF                                  
  196|                 L33:                             
;  Source Line # 197
  197| 0002CD 8B45                        MOV    EAX, [EBP-56] 
  197| 0002CF C8                                        
  197| 0002D0 3945                        CMP    [EBP-52], EAX 
  197| 0002D2 CC                                        
  197| 0002D3 74                          JE     SHORT L30 
  197| 0002D4 0C                                        
  197| 0002D5 8B45                        MOV    EAX, [EBP-52] 
  197| 0002D7 CC                                        
  197| 0002D8 40                          INC    EAX    
  197| 0002D9 8945                        MOV    [EBP-52], EAX 
  197| 0002DB CC                                        
  197| 0002DC E9                          JMP    L32    
  197| 0002DD 68FEFFFF                                  
  197|                 L30:                             
  197| 0002E1 8B05                        MOV    EAX, package1.n 
  197| 0002E3 00000000                                  
  197| 0002E7 8945                        MOV    [EBP-28], EAX 
  197| 0002E9 E4                                        
;  Source Line # 198
  198| 0002EA 837D                        CMP    DWORD PTR [EBP-28], 0 
  198| 0002EC E4                                        
  198| 0002ED 00                                        
  198| 0002EE 0F8E                        JLE    L45    
  198| 0002F0 59010000                                  
  198| 0002F4 C745                        MOV    DWORD PTR [EBP-24], 1 
  198| 0002F6 E8                                        
  198| 0002F7 01000000                                  
  198|                 L47:                             
  198| 0002FB 8B05                        MOV    EAX, package1.h 
  198| 0002FD 00000000                                  
  198| 000301 40                          INC    EAX    
  198| 000302 CE                          INTO          
  198| 000303 8945                        MOV    [EBP-20], EAX 
  198| 000305 EC                                        
  198| 000306 8B1D                        MOV    EBX, package1.h 
  198| 000308 00000000                                  
  198| 00030C D1E3                        SHL    EBX, 1 
  198| 00030E CE                          INTO          
  198| 00030F 895D                        MOV    [EBP-16], EBX 
  198| 000311 F0                                        
;  Source Line # 199
  199| 000312 8B4D                        MOV    ECX, [EBP-16] 
  199| 000314 F0                                        
  199| 000315 394D                        CMP    [EBP-20], ECX 
  199| 000317 EC                                        
  199| 000318 0F8F                        JG     L48    
  199| 00031A 1B010000                                  
  199| 00031E 8B45                        MOV    EAX, [EBP-20] 
  199| 000320 EC                                        
  199| 000321 8945                        MOV    [EBP-12], EAX 
  199| 000323 F4                                        
  199|                 L50:                             
;  Source Line # 200
  200| 000324 C745                        MOV    DWORD PTR [EBP-96], 0 ;  Sum1
  200| 000326 A0                                        
  200| 000327 00000000                                  
  200| 00032B 8B05                        MOV    EAX, package1.n 
  200| 00032D 00000000                                  
  200| 000331 8945                        MOV    [EBP-8], EAX 
  200| 000333 F8                                        
;  Source Line # 201
  201| 000334 837D                        CMP    DWORD PTR [EBP-8], 0 
  201| 000336 F8                                        
  201| 000337 00                                        
  201| 000338 0F8E                        JLE    L51    
  201| 00033A 9B000000                                  
  201| 00033E C745                        MOV    DWORD PTR [EBP-4], 1 
  201| 000340 FC                                        
  201| 000341 01000000                                  
  201|                 L53:                             
;  Source Line # 202
  202| 000345 8B45                        MOV    EAX, [EBP-80] ;  MT2
  202| 000347 B0                                        
  202| 000348 8B5D                        MOV    EBX, [EBP-4] 
  202| 00034A FC                                        
  202| 00034B 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
  202| 00034D 00000000                                  
  202|                 L79:                             
  202| 000351 0F8F                        JG     L80    
  202| 000353 8A010000                                  
  202| 000357 8D5B                        LEA    EBX, [EBX-1] 
  202| 000359 FF                                        
  202| 00035A 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  202| 00035D 00000000                                  
  202| 000361 8B4D                        MOV    ECX, [EBP-12] 
  202| 000363 F4                                        
  202| 000364 83F9                        CMP    ECX, 1 
  202| 000366 01                                        
  202|                 L81:                             
  202| 000367 0F8C                        JL     L82    
  202| 000369 80010000                                  
  202| 00036D 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  202| 00036F 00000000                                  
  202| 000373 0F8F                        JG     L82    
  202| 000375 74010000                                  
  202| 000379 8D0C8D                      LEA    ECX, [4*ECX-4] 
  202| 00037C FCFFFFFF                                  
  202| 000380 03D9                        ADD    EBX, ECX 
  202| 000382 8B55                        MOV    EDX, [EBP-88] ;  MB2
  202| 000384 A8                                        
  202| 000385 8B75                        MOV    ESI, [EBP-24] 
  202| 000387 E8                                        
  202| 000388 3B35                        CMP    ESI, package1.matr__constrained_array____1 
  202| 00038A 00000000                                  
  202|                 L83:                             
  202| 00038E 0F8F                        JG     L84    
  202| 000390 65010000                                  
  202| 000394 8D76                        LEA    ESI, [ESI-1] 
  202| 000396 FF                                        
  202| 000397 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  202| 00039A 00000000                                  
  202| 00039E 8B7D                        MOV    EDI, [EBP-4] 
  202| 0003A0 FC                                        
  202| 0003A1 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  202| 0003A3 00000000                                  
  202|                 L85:                             
  202| 0003A7 0F8F                        JG     L86    
  202| 0003A9 58010000                                  
  202| 0003AD 8D3CBD                      LEA    EDI, [4*EDI-4] 
  202| 0003B0 FCFFFFFF                                  
  202| 0003B4 03F7                        ADD    ESI, EDI 
  202| 0003B6 8B0418                      MOV    EAX, [EAX+EBX+0] 
  202| 0003B9 0FAF0432                    IMUL   EAX, [EDX+ESI+0] 
  202| 0003BD CE                          INTO          
  202| 0003BE 0345                        ADD    EAX, [EBP-96] ;  Sum1
  202| 0003C0 A0                                        
  202| 0003C1 CE                          INTO          
  202| 0003C2 8945                        MOV    [EBP-96], EAX ;  Sum1
  202| 0003C4 A0                                        
;  Source Line # 203
  203| 0003C5 8B4D                        MOV    ECX, [EBP-8] 
  203| 0003C7 F8                                        
  203| 0003C8 394D                        CMP    [EBP-4], ECX 
  203| 0003CA FC                                        
  203| 0003CB 74                          JE     SHORT L51 
  203| 0003CC 0C                                        
  203| 0003CD 8B45                        MOV    EAX, [EBP-4] 
  203| 0003CF FC                                        
  203| 0003D0 40                          INC    EAX    
  203| 0003D1 8945                        MOV    [EBP-4], EAX 
  203| 0003D3 FC                                        
  203| 0003D4 E9                          JMP    L53    
  203| 0003D5 6CFFFFFF                                  
  203|                 L51:                             
;  Source Line # 204
  204| 0003D9 8B55                        MOV    EDX, [EBP-104] ; Spill
  204| 0003DB 98                                        
  204| 0003DC 8B42                        MOV    EAX, [EDX+48] 
  204| 0003DE 30                                        
  204| 0003DF 8B98                        MOV    EBX, [EAX-140] ;  MA
  204| 0003E1 74FFFFFF                                  
  204| 0003E5 8B4D                        MOV    ECX, [EBP-24] 
  204| 0003E7 E8                                        
  204| 0003E8 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  204| 0003EA 00000000                                  
  204|                 L87:                             
  204| 0003EE 0F8F                        JG     L88    
  204| 0003F0 1D010000                                  
  204| 0003F4 8D49                        LEA    ECX, [ECX-1] 
  204| 0003F6 FF                                        
  204| 0003F7 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  204| 0003FA 00000000                                  
  204| 0003FE 8B75                        MOV    ESI, [EBP-12] 
  204| 000400 F4                                        
  204| 000401 83FE                        CMP    ESI, 1 
  204| 000403 01                                        
  204|                 L89:                             
  204| 000404 0F8C                        JL     L90    
  204| 000406 13010000                                  
  204| 00040A 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  204| 00040C 00000000                                  
  204| 000410 0F8F                        JG     L90    
  204| 000412 07010000                                  
  204| 000416 8D34B5                      LEA    ESI, [4*ESI-4] 
  204| 000419 FCFFFFFF                                  
  204| 00041D 03CE                        ADD    ECX, ESI 
  204| 00041F 8B7D                        MOV    EDI, [EBP-96] ;  Sum1
  204| 000421 A0                                        
  204| 000422 893C0B                      MOV    [EBX+ECX+0], EDI 
;  Source Line # 205
  205| 000425 8B55                        MOV    EDX, [EBP-16] 
  205| 000427 F0                                        
  205| 000428 3955                        CMP    [EBP-12], EDX 
  205| 00042A F4                                        
  205| 00042B 74                          JE     SHORT L48 
  205| 00042C 0C                                        
  205| 00042D 8B45                        MOV    EAX, [EBP-12] 
  205| 00042F F4                                        
  205| 000430 40                          INC    EAX    
  205| 000431 8945                        MOV    [EBP-12], EAX 
  205| 000433 F4                                        
  205| 000434 E9                          JMP    L50    
  205| 000435 EBFEFFFF                                  
  205|                 L48:                             
;  Source Line # 206
  206| 000439 8B45                        MOV    EAX, [EBP-28] 
  206| 00043B E4                                        
  206| 00043C 3945                        CMP    [EBP-24], EAX 
  206| 00043E E8                                        
  206| 00043F 74                          JE     SHORT L45 
  206| 000440 0C                                        
  206| 000441 8B45                        MOV    EAX, [EBP-24] 
  206| 000443 E8                                        
  206| 000444 40                          INC    EAX    
  206| 000445 8945                        MOV    [EBP-24], EAX 
  206| 000447 E8                                        
  206| 000448 E9                          JMP    L47    
  206| 000449 AEFEFFFF                                  
  206|                 L45:                             
;  Source Line # 208
  208| 00044D 68                          PUSH   lab4.mon.calculationsignal 
  208| 00044E 00000000                                  
  208| 000452 6A                          PUSH   0      
  208| 000453 00                                        
  208| 000454 8B55                        MOV    EDX, [EBP-104] ; Spill
  208| 000456 98                                        
  208| 000457 8B42                        MOV    EAX, [EDX+48] 
  208| 000459 30                                        
  208| 00045A 8B58                        MOV    EBX, [EAX-44] ;  MON
  208| 00045C D4                                        
  208| 00045D 53                          PUSH   EBX    
  208| 00045E E8                          CALL   rts_protected_procedure_call 
  208| 00045F 00000000                                  
;  Source Line # 210
  210| 000463 68                          PUSH   __lcl.00000250 
  210| 000464 00000000                                  
  210| 000468 68                          PUSH   __lcl.00000249 
  210| 000469 00000000                                  
  210| 00046D E8                          CALL   ada.text_io.put_line__2 
  210| 00046E 00000000                                  
  210| 000472 8D4D                        LEA    ECX, [EBP-92] ;  dyn_temp
  210| 000474 A4                                        
  210| 000475 51                          PUSH   ECX    
  210| 000476 E8                          CALL   rts_ss_release 
  210| 000477 00000000                                  
;  Source Line # 211
  211| 00047B 8BE5                        MOV    ESP, EBP 
  211| 00047D 5D                          POP    EBP    
  211| 00047E C2                          RET    4      
  211| 00047F 0400                                      
  211|                 L64:                             
  211| 000481 8D05                        LEA    EAX, L63+5 
  211| 000483 AD010000                                  
  211| 000487 50                          PUSH   EAX    
  211| 000488 E9                          JMP    rts_raise_constraint_error 
  211| 000489 00000000                                  
  211|                 L66:                             
  211| 00048D 8D05                        LEA    EAX, L65+5 
  211| 00048F C3010000                                  
  211| 000493 50                          PUSH   EAX    
  211| 000494 E9                          JMP    rts_raise_constraint_error 
  211| 000495 00000000                                  
  211|                 L68:                             
  211| 000499 8D05                        LEA    EAX, L67+5 
  211| 00049B EA010000                                  
  211| 00049F 50                          PUSH   EAX    
  211| 0004A0 E9                          JMP    rts_raise_constraint_error 
  211| 0004A1 00000000                                  
  211|                 L70:                             
  211| 0004A5 8D05                        LEA    EAX, L69+5 
  211| 0004A7 03020000                                  
  211| 0004AB 50                          PUSH   EAX    
  211| 0004AC E9                          JMP    rts_raise_constraint_error 
  211| 0004AD 00000000                                  
  211|                 L72:                             
  211| 0004B1 8D05                        LEA    EAX, L71+5 
  211| 0004B3 4A020000                                  
  211| 0004B7 50                          PUSH   EAX    
  211| 0004B8 E9                          JMP    rts_raise_constraint_error 
  211| 0004B9 00000000                                  
  211|                 L74:                             
  211| 0004BD 8D05                        LEA    EAX, L73+5 
  211| 0004BF 63020000                                  
  211| 0004C3 50                          PUSH   EAX    
  211| 0004C4 E9                          JMP    rts_raise_constraint_error 
  211| 0004C5 00000000                                  
  211|                 L76:                             
  211| 0004C9 8D05                        LEA    EAX, L75+5 
  211| 0004CB 8A020000                                  
  211| 0004CF 50                          PUSH   EAX    
  211| 0004D0 E9                          JMP    rts_raise_constraint_error 
  211| 0004D1 00000000                                  
  211|                 L78:                             
  211| 0004D5 8D05                        LEA    EAX, L77+5 
  211| 0004D7 A0020000                                  
  211| 0004DB 50                          PUSH   EAX    
  211| 0004DC E9                          JMP    rts_raise_constraint_error 
  211| 0004DD 00000000                                  
  211|                 L80:                             
  211| 0004E1 8D05                        LEA    EAX, L79+5 
  211| 0004E3 56030000                                  
  211| 0004E7 50                          PUSH   EAX    
  211| 0004E8 E9                          JMP    rts_raise_constraint_error 
  211| 0004E9 00000000                                  
  211|                 L82:                             
  211| 0004ED 8D05                        LEA    EAX, L81+5 
  211| 0004EF 6C030000                                  
  211| 0004F3 50                          PUSH   EAX    
  211| 0004F4 E9                          JMP    rts_raise_constraint_error 
  211| 0004F5 00000000                                  
  211|                 L84:                             
  211| 0004F9 8D05                        LEA    EAX, L83+5 
  211| 0004FB 93030000                                  
  211| 0004FF 50                          PUSH   EAX    
  211| 000500 E9                          JMP    rts_raise_constraint_error 
  211| 000501 00000000                                  
  211|                 L86:                             
  211| 000505 8D05                        LEA    EAX, L85+5 
  211| 000507 AC030000                                  
  211| 00050B 50                          PUSH   EAX    
  211| 00050C E9                          JMP    rts_raise_constraint_error 
  211| 00050D 00000000                                  
  211|                 L88:                             
  211| 000511 8D05                        LEA    EAX, L87+5 
  211| 000513 F3030000                                  
  211| 000517 50                          PUSH   EAX    
  211| 000518 E9                          JMP    rts_raise_constraint_error 
  211| 000519 00000000                                  
  211|                 L90:                             
  211| 00051D 8D05                        LEA    EAX, L89+5 
  211| 00051F 09040000                                  
  211| 000523 50                          PUSH   EAX    
  211| 000524 E9                          JMP    rts_raise_constraint_error 
  211| 000525 00000000                                  
                       ;                                
                       lab4.start.t2__body ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000370     DD     00002001 
                                          DD     000000AD 
                                          DD     lab4.start.t2__body 
                                          DD     __lcl.00000382 
                                          DD     000000AF 
                                          DD     lab4.start.t2__body+00000010H 
                                          DD     __lcl.00000382 
                                          DD     000000B1 
                                          DD     lab4.start.t2__body+0000007EH 
                                          DD     __lcl.00000382 
                                          DD     000000B2 
                                          DD     lab4.start.t2__body+00000083H 
                                          DD     __lcl.00000382 
                                          DD     000000B4 
                                          DD     lab4.start.t2__body+00000092H 
                                          DD     __lcl.00000382 
                                          DD     000000B6 
                                          DD     lab4.start.t2__body+000000A4H 
                                          DD     __lcl.00000382 
                                          DD     000000B7 
                                          DD     lab4.start.t2__body+000000BAH 
                                          DD     __lcl.00000382 
                                          DD     000000B9 
                                          DD     lab4.start.t2__body+000000CFH 
                                          DD     __lcl.00000382 
                                          DD     000000BA 
                                          DD     lab4.start.t2__body+000000EDH 
                                          DD     __lcl.00000382 
                                          DD     000000BB 
                                          DD     lab4.start.t2__body+0000010BH 
                                          DD     __lcl.00000382 
                                          DD     000000BD 
                                          DD     lab4.start.t2__body+00000138H 
                                          DD     __lcl.00000382 
                                          DD     000000BE 
                                          DD     lab4.start.t2__body+00000160H 
                                          DD     __lcl.00000382 
                                          DD     000000BF 
                                          DD     lab4.start.t2__body+00000172H 
                                          DD     __lcl.00000382 
                                          DD     000000C0 
                                          DD     lab4.start.t2__body+00000182H 
                                          DD     __lcl.00000382 
                                          DD     000000C1 
                                          DD     lab4.start.t2__body+00000193H 
                                          DD     __lcl.00000382 
                                          DD     000000C2 
                                          DD     lab4.start.t2__body+0000021CH 
                                          DD     __lcl.00000382 
                                          DD     000000C3 
                                          DD     lab4.start.t2__body+00000230H 
                                          DD     __lcl.00000382 
                                          DD     000000C4 
                                          DD     lab4.start.t2__body+000002B9H 
                                          DD     __lcl.00000382 
                                          DD     000000C5 
                                          DD     lab4.start.t2__body+000002CDH 
                                          DD     __lcl.00000382 
                                          DD     000000C6 
                                          DD     lab4.start.t2__body+000002EAH 
                                          DD     __lcl.00000382 
                                          DD     000000C7 
                                          DD     lab4.start.t2__body+00000312H 
                                          DD     __lcl.00000382 
                                          DD     000000C8 
                                          DD     lab4.start.t2__body+00000324H 
                                          DD     __lcl.00000382 
                                          DD     000000C9 
                                          DD     lab4.start.t2__body+00000334H 
                                          DD     __lcl.00000382 
                                          DD     000000CA 
                                          DD     lab4.start.t2__body+00000345H 
                                          DD     __lcl.00000382 
                                          DD     000000CB 
                                          DD     lab4.start.t2__body+000003C5H 
                                          DD     __lcl.00000382 
                                          DD     000000CC 
                                          DD     lab4.start.t2__body+000003D9H 
                                          DD     __lcl.00000382 
                                          DD     000000CD 
                                          DD     lab4.start.t2__body+00000425H 
                                          DD     __lcl.00000382 
                                          DD     000000CE 
                                          DD     lab4.start.t2__body+00000439H 
                                          DD     __lcl.00000382 
                                          DD     000000D0 
                                          DD     lab4.start.t2__body+0000044DH 
                                          DD     __lcl.00000382 
                                          DD     000000D2 
                                          DD     lab4.start.t2__body+00000463H 
                                          DD     __lcl.00000382 
                                          DD     000000D3 
                                          DD     lab4.start.t2__body+0000047BH 
                                          DD     __lcl.00000382 
                                          DD     000000D3 
                                          DD     lab4.start.t2__body+00000525H 
                                          DD     __lcl.00000382 
; ********* End of segment, Total Size = 388

                       ;                                
                       ;  Start of procedure lab4.start.t3__body   
                       ;                                
                                          PUBLIC lab4.start.t3__body 
                       lab4.start.t3__body PROC  NEAR   
;  Source Line # 214
  214| 000000 64                          FS:           
  214| 000001 8B15                        MOV    EDX, 4 
  214| 000003 04000000                                  
  214| 000007 8B52                        MOV    EDX, [EDX-4] 
  214| 000009 FC                                        
  214| 00000A 55                          PUSH   EBP    
  214| 00000B 8BEC                        MOV    EBP, ESP 
  214| 00000D 83EC                        SUB    ESP, 108 
  214| 00000F 6C                                        
;  Source Line # 216
  216| 000010 8B02                        MOV    EAX, [EDX+0] 
  216| 000012 8945                        MOV    [EBP-96], EAX ;  dyn_temp
  216| 000014 A0                                        
  216| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  216| 000017 00000000                                  
  216| 00001B 83EB                        SUB    EBX, 1 
  216| 00001D 01                                        
  216| 00001E 7D                          JGE    SHORT L60 
  216| 00001F 03                                        
  216| 000020 33DB                        XOR    EBX, EBX 
  216| 000022 4B                          DEC    EBX    
  216|                 L60:                             
  216| 000023 CE                          INTO          
  216| 000024 43                          INC    EBX    
  216| 000025 CE                          INTO          
  216| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  216| 000029 00000000                                  
  216| 00002D CE                          INTO          
  216| 00002E 53                          PUSH   EBX    
  216| 00002F 8955                        MOV    [EBP-108], EDX ; Spill
  216| 000031 94                                        
  216| 000032 E8                          CALL   rts_ss_allocate 
  216| 000033 00000000                                  
  216| 000037 8945                        MOV    [EBP-92], EAX ;  MB3
  216| 000039 A4                                        
  216| 00003A 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
  216| 00003C 00000000                                  
  216| 000040 83E9                        SUB    ECX, 1 
  216| 000042 01                                        
  216| 000043 7D                          JGE    SHORT L61 
  216| 000044 03                                        
  216| 000045 33C9                        XOR    ECX, ECX 
  216| 000047 49                          DEC    ECX    
  216|                 L61:                             
  216| 000048 CE                          INTO          
  216| 000049 41                          INC    ECX    
  216| 00004A CE                          INTO          
  216| 00004B 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  216| 00004E 00000000                                  
  216| 000052 CE                          INTO          
  216| 000053 51                          PUSH   ECX    
  216| 000054 E8                          CALL   rts_ss_allocate 
  216| 000055 00000000                                  
  216| 000059 8945                        MOV    [EBP-88], EAX ;  MZ3
  216| 00005B A8                                        
  216| 00005C 8B35                        MOV    ESI, package1.matr__constrained_array____1 
  216| 00005E 00000000                                  
  216| 000062 83EE                        SUB    ESI, 1 
  216| 000064 01                                        
  216| 000065 7D                          JGE    SHORT L62 
  216| 000066 03                                        
  216| 000067 33F6                        XOR    ESI, ESI 
  216| 000069 4E                          DEC    ESI    
  216|                 L62:                             
  216| 00006A CE                          INTO          
  216| 00006B 46                          INC    ESI    
  216| 00006C CE                          INTO          
  216| 00006D 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  216| 000070 00000000                                  
  216| 000074 CE                          INTO          
  216| 000075 56                          PUSH   ESI    
  216| 000076 E8                          CALL   rts_ss_allocate 
  216| 000077 00000000                                  
  216| 00007B 8945                        MOV    [EBP-84], EAX ;  MT3
  216| 00007D AC                                        
;  Source Line # 218
  218| 00007E E8                          CALL   rts_activation_succeeded 
  218| 00007F 00000000                                  
;  Source Line # 219
  219| 000083 68                          PUSH   __lcl.00000258 
  219| 000084 00000000                                  
  219| 000088 68                          PUSH   __lcl.00000257 
  219| 000089 00000000                                  
  219| 00008D E8                          CALL   ada.text_io.put_line__2 
  219| 00008E 00000000                                  
;  Source Line # 221
  221| 000092 8B7D                        MOV    EDI, [EBP-88] ;  MZ3
  221| 000094 A8                                        
  221| 000095 57                          PUSH   EDI    
  221| 000096 E8                          CALL   package1.matr_input 
  221| 000097 00000000                                  
;  Source Line # 222
  222| 00009B 8B55                        MOV    EDX, [EBP-88] ;  MZ3
  222| 00009D A8                                        
  222| 00009E 8955                        MOV    [EBP-76], EDX 
  222| 0000A0 B4                                        
  222| 0000A1 68                          PUSH   lab4.mon.setmz 
  222| 0000A2 00000000                                  
  222| 0000A6 8D5D                        LEA    EBX, [EBP-76] 
  222| 0000A8 B4                                        
  222| 0000A9 53                          PUSH   EBX    
  222| 0000AA 8B55                        MOV    EDX, [EBP-108] ; Spill
  222| 0000AC 94                                        
  222| 0000AD 8B4A                        MOV    ECX, [EDX+48] 
  222| 0000AF 30                                        
  222| 0000B0 8B71                        MOV    ESI, [ECX-44] ;  MON
  222| 0000B2 D4                                        
  222| 0000B3 56                          PUSH   ESI    
  222| 0000B4 E8                          CALL   rts_protected_procedure_call 
  222| 0000B5 00000000                                  
;  Source Line # 224
  224| 0000B9 68                          PUSH   lab4.mon.datasignal 
  224| 0000BA 00000000                                  
  224| 0000BE 6A                          PUSH   0      
  224| 0000BF 00                                        
  224| 0000C0 8B55                        MOV    EDX, [EBP-108] ; Spill
  224| 0000C2 94                                        
  224| 0000C3 8B42                        MOV    EAX, [EDX+48] 
  224| 0000C5 30                                        
  224| 0000C6 8B78                        MOV    EDI, [EAX-44] ;  MON
  224| 0000C8 D4                                        
  224| 0000C9 57                          PUSH   EDI    
  224| 0000CA E8                          CALL   rts_protected_procedure_call 
  224| 0000CB 00000000                                  
;  Source Line # 225
  225| 0000CF 6A                          PUSH   0      
  225| 0000D0 00                                        
  225| 0000D1 6A                          PUSH   0      
  225| 0000D2 00                                        
  225| 0000D3 6A                          PUSH   0      
  225| 0000D4 00                                        
  225| 0000D5 8B55                        MOV    EDX, [EBP-108] ; Spill
  225| 0000D7 94                                        
  225| 0000D8 8B5A                        MOV    EBX, [EDX+48] 
  225| 0000DA 30                                        
  225| 0000DB 8B4B                        MOV    ECX, [EBX-44] ;  MON
  225| 0000DD D4                                        
  225| 0000DE 51                          PUSH   ECX    
  225| 0000DF E8                          CALL   rts_protected_entry_call 
  225| 0000E0 00000000                                  
;  Source Line # 227
  227| 0000E4 8B75                        MOV    ESI, [EBP-88] ;  MZ3
  227| 0000E6 A8                                        
  227| 0000E7 8975                        MOV    [EBP-72], ESI 
  227| 0000E9 B8                                        
  227| 0000EA 68                          PUSH   lab4.mon.getmz 
  227| 0000EB 00000000                                  
  227| 0000EF 8D45                        LEA    EAX, [EBP-72] 
  227| 0000F1 B8                                        
  227| 0000F2 50                          PUSH   EAX    
  227| 0000F3 8B55                        MOV    EDX, [EBP-108] ; Spill
  227| 0000F5 94                                        
  227| 0000F6 8B7A                        MOV    EDI, [EDX+48] 
  227| 0000F8 30                                        
  227| 0000F9 8B5F                        MOV    EBX, [EDI-44] ;  MON
  227| 0000FB D4                                        
  227| 0000FC 53                          PUSH   EBX    
  227| 0000FD E8                          CALL   rts_entryless_protected_subp_call 
  227| 0000FE 00000000                                  
;  Source Line # 228
  228| 000102 8B4D                        MOV    ECX, [EBP-92] ;  MB3
  228| 000104 A4                                        
  228| 000105 894D                        MOV    [EBP-68], ECX 
  228| 000107 BC                                        
  228| 000108 68                          PUSH   lab4.mon.getmb 
  228| 000109 00000000                                  
  228| 00010D 8D75                        LEA    ESI, [EBP-68] 
  228| 00010F BC                                        
  228| 000110 56                          PUSH   ESI    
  228| 000111 8B55                        MOV    EDX, [EBP-108] ; Spill
  228| 000113 94                                        
  228| 000114 8B42                        MOV    EAX, [EDX+48] 
  228| 000116 30                                        
  228| 000117 8B78                        MOV    EDI, [EAX-44] ;  MON
  228| 000119 D4                                        
  228| 00011A 57                          PUSH   EDI    
  228| 00011B E8                          CALL   rts_entryless_protected_subp_call 
  228| 00011C 00000000                                  
;  Source Line # 229
  229| 000120 8D5D                        LEA    EBX, [EBP-64] 
  229| 000122 C0                                        
  229| 000123 895D                        MOV    [EBP-60], EBX 
  229| 000125 C4                                        
  229| 000126 68                          PUSH   lab4.mon.getalfa 
  229| 000127 00000000                                  
  229| 00012B 8D4D                        LEA    ECX, [EBP-60] 
  229| 00012D C4                                        
  229| 00012E 51                          PUSH   ECX    
  229| 00012F 8B55                        MOV    EDX, [EBP-108] ; Spill
  229| 000131 94                                        
  229| 000132 8B72                        MOV    ESI, [EDX+48] 
  229| 000134 30                                        
  229| 000135 8B46                        MOV    EAX, [ESI-44] ;  MON
  229| 000137 D4                                        
  229| 000138 50                          PUSH   EAX    
  229| 000139 E8                          CALL   rts_entryless_protected_subp_call 
  229| 00013A 00000000                                  
  229| 00013E 8B7D                        MOV    EDI, [EBP-64] 
  229| 000140 C0                                        
  229| 000141 897D                        MOV    [EBP-80], EDI ;  alfa3
  229| 000143 B0                                        
  229| 000144 8B1D                        MOV    EBX, package1.n 
  229| 000146 00000000                                  
  229| 00014A 895D                        MOV    [EBP-56], EBX 
  229| 00014C C8                                        
;  Source Line # 231
  231| 00014D 837D                        CMP    DWORD PTR [EBP-56], 0 
  231| 00014F C8                                        
  231| 000150 00                                        
  231| 000151 0F8E                        JLE    L30    
  231| 000153 A1010000                                  
  231| 000157 C745                        MOV    DWORD PTR [EBP-52], 1 
  231| 000159 CC                                        
  231| 00015A 01000000                                  
  231|                 L32:                             
  231| 00015E 8B05                        MOV    EAX, package1.h 
  231| 000160 00000000                                  
  231| 000164 D1E0                        SHL    EAX, 1 
  231| 000166 CE                          INTO          
  231| 000167 40                          INC    EAX    
  231| 000168 CE                          INTO          
  231| 000169 8945                        MOV    [EBP-48], EAX 
  231| 00016B D0                                        
  231| 00016C 6B1D                        IMUL   EBX, package1.h, 3 
  231| 00016E 00000000                                  
  231| 000172 03                                        
  231| 000173 CE                          INTO          
  231| 000174 895D                        MOV    [EBP-44], EBX 
  231| 000176 D4                                        
;  Source Line # 232
  232| 000177 8B4D                        MOV    ECX, [EBP-44] 
  232| 000179 D4                                        
  232| 00017A 394D                        CMP    [EBP-48], ECX 
  232| 00017C D0                                        
  232| 00017D 0F8F                        JG     L33    
  232| 00017F 61010000                                  
  232| 000183 8B45                        MOV    EAX, [EBP-48] 
  232| 000185 D0                                        
  232| 000186 8945                        MOV    [EBP-40], EAX 
  232| 000188 D8                                        
  232|                 L35:                             
;  Source Line # 233
  233| 000189 C745                        MOV    DWORD PTR [EBP-100], 0 ;  Sum1
  233| 00018B 9C                                        
  233| 00018C 00000000                                  
  233| 000190 8B05                        MOV    EAX, package1.n 
  233| 000192 00000000                                  
  233| 000196 8945                        MOV    [EBP-36], EAX 
  233| 000198 DC                                        
;  Source Line # 234
  234| 000199 837D                        CMP    DWORD PTR [EBP-36], 0 
  234| 00019B DC                                        
  234| 00019C 00                                        
  234| 00019D 0F8E                        JLE    L36    
  234| 00019F A4000000                                  
  234| 0001A3 C745                        MOV    DWORD PTR [EBP-32], 1 
  234| 0001A5 E0                                        
  234| 0001A6 01000000                                  
  234|                 L38:                             
;  Source Line # 235
  235| 0001AA 8B55                        MOV    EDX, [EBP-108] ; Spill
  235| 0001AC 94                                        
  235| 0001AD 8B42                        MOV    EAX, [EDX+48] 
  235| 0001AF 30                                        
  235| 0001B0 8B98                        MOV    EBX, [EAX-132] ;  MK
  235| 0001B2 7CFFFFFF                                  
  235| 0001B6 8B4D                        MOV    ECX, [EBP-32] 
  235| 0001B8 E0                                        
  235| 0001B9 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  235| 0001BB 00000000                                  
  235|                 L63:                             
  235| 0001BF 0F8F                        JG     L64    
  235| 0001C1 D5020000                                  
  235| 0001C5 8D49                        LEA    ECX, [ECX-1] 
  235| 0001C7 FF                                        
  235| 0001C8 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  235| 0001CB 00000000                                  
  235| 0001CF 8B75                        MOV    ESI, [EBP-40] 
  235| 0001D1 D8                                        
  235| 0001D2 83FE                        CMP    ESI, 1 
  235| 0001D4 01                                        
  235|                 L65:                             
  235| 0001D5 0F8C                        JL     L66    
  235| 0001D7 CB020000                                  
  235| 0001DB 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  235| 0001DD 00000000                                  
  235| 0001E1 0F8F                        JG     L66    
  235| 0001E3 BF020000                                  
  235| 0001E7 8D34B5                      LEA    ESI, [4*ESI-4] 
  235| 0001EA FCFFFFFF                                  
  235| 0001EE 03CE                        ADD    ECX, ESI 
  235| 0001F0 8B7D                        MOV    EDI, [EBP-88] ;  MZ3
  235| 0001F2 A8                                        
  235| 0001F3 8B55                        MOV    EDX, [EBP-52] 
  235| 0001F5 CC                                        
  235| 0001F6 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  235| 0001F8 00000000                                  
  235|                 L67:                             
  235| 0001FC 0F8F                        JG     L68    
  235| 0001FE B0020000                                  
  235| 000202 8D52                        LEA    EDX, [EDX-1] 
  235| 000204 FF                                        
  235| 000205 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  235| 000208 00000000                                  
  235| 00020C 8B45                        MOV    EAX, [EBP-32] 
  235| 00020E E0                                        
  235| 00020F 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  235| 000211 00000000                                  
  235|                 L69:                             
  235| 000215 0F8F                        JG     L70    
  235| 000217 A3020000                                  
  235| 00021B 8D0485                      LEA    EAX, [4*EAX-4] 
  235| 00021E FCFFFFFF                                  
  235| 000222 03D0                        ADD    EDX, EAX 
  235| 000224 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  235| 000227 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  235| 00022B CE                          INTO          
  235| 00022C 035D                        ADD    EBX, [EBP-100] ;  Sum1
  235| 00022E 9C                                        
  235| 00022F CE                          INTO          
  235| 000230 895D                        MOV    [EBP-100], EBX ;  Sum1
  235| 000232 9C                                        
;  Source Line # 236
  236| 000233 8B75                        MOV    ESI, [EBP-36] 
  236| 000235 DC                                        
  236| 000236 3975                        CMP    [EBP-32], ESI 
  236| 000238 E0                                        
  236| 000239 74                          JE     SHORT L36 
  236| 00023A 0C                                        
  236| 00023B 8B45                        MOV    EAX, [EBP-32] 
  236| 00023D E0                                        
  236| 00023E 40                          INC    EAX    
  236| 00023F 8945                        MOV    [EBP-32], EAX 
  236| 000241 E0                                        
  236| 000242 E9                          JMP    L38    
  236| 000243 63FFFFFF                                  
  236|                 L36:                             
;  Source Line # 237
  237| 000247 8B55                        MOV    EDX, [EBP-108] ; Spill
  237| 000249 94                                        
  237| 00024A 8B42                        MOV    EAX, [EDX+48] 
  237| 00024C 30                                        
  237| 00024D 8B98                        MOV    EBX, [EAX-136] ;  MC
  237| 00024F 78FFFFFF                                  
  237| 000253 8B4D                        MOV    ECX, [EBP-52] 
  237| 000255 CC                                        
  237| 000256 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  237| 000258 00000000                                  
  237|                 L71:                             
  237| 00025C 0F8F                        JG     L72    
  237| 00025E 68020000                                  
  237| 000262 8D49                        LEA    ECX, [ECX-1] 
  237| 000264 FF                                        
  237| 000265 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  237| 000268 00000000                                  
  237| 00026C 8B75                        MOV    ESI, [EBP-40] 
  237| 00026E D8                                        
  237| 00026F 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  237| 000271 00000000                                  
  237|                 L73:                             
  237| 000275 0F8F                        JG     L74    
  237| 000277 5B020000                                  
  237| 00027B 8D34B5                      LEA    ESI, [4*ESI-4] 
  237| 00027E FCFFFFFF                                  
  237| 000282 03CE                        ADD    ECX, ESI 
  237| 000284 8B7D                        MOV    EDI, [EBP-80] ;  alfa3
  237| 000286 B0                                        
  237| 000287 0FAF7D                      IMUL   EDI, [EBP-100] ;  Sum1
  237| 00028A 9C                                        
  237| 00028B CE                          INTO          
  237| 00028C 033C0B                      ADD    EDI, [EBX+ECX+0] 
  237| 00028F CE                          INTO          
  237| 000290 8B55                        MOV    EDX, [EBP-84] ;  MT3
  237| 000292 AC                                        
  237| 000293 8B45                        MOV    EAX, [EBP-52] 
  237| 000295 CC                                        
  237| 000296 3B05                        CMP    EAX, package1.matr__constrained_array____1 
  237| 000298 00000000                                  
  237|                 L75:                             
  237| 00029C 0F8F                        JG     L76    
  237| 00029E 40020000                                  
  237| 0002A2 8D40                        LEA    EAX, [EAX-1] 
  237| 0002A4 FF                                        
  237| 0002A5 0FAF05                      IMUL   EAX, package1.matr__COMP_SU_SIZE 
  237| 0002A8 00000000                                  
  237| 0002AC 8B5D                        MOV    EBX, [EBP-40] 
  237| 0002AE D8                                        
  237| 0002AF 83FB                        CMP    EBX, 1 
  237| 0002B1 01                                        
  237|                 L77:                             
  237| 0002B2 0F8C                        JL     L78    
  237| 0002B4 36020000                                  
  237| 0002B8 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
  237| 0002BA 00000000                                  
  237| 0002BE 0F8F                        JG     L78    
  237| 0002C0 2A020000                                  
  237| 0002C4 8D1C9D                      LEA    EBX, [4*EBX-4] 
  237| 0002C7 FCFFFFFF                                  
  237| 0002CB 03C3                        ADD    EAX, EBX 
  237| 0002CD 893C02                      MOV    [EDX+EAX+0], EDI 
;  Source Line # 238
  238| 0002D0 8B75                        MOV    ESI, [EBP-44] 
  238| 0002D2 D4                                        
  238| 0002D3 3975                        CMP    [EBP-40], ESI 
  238| 0002D5 D8                                        
  238| 0002D6 74                          JE     SHORT L33 
  238| 0002D7 0C                                        
  238| 0002D8 8B45                        MOV    EAX, [EBP-40] 
  238| 0002DA D8                                        
  238| 0002DB 40                          INC    EAX    
  238| 0002DC 8945                        MOV    [EBP-40], EAX 
  238| 0002DE D8                                        
  238| 0002DF E9                          JMP    L35    
  238| 0002E0 A5FEFFFF                                  
  238|                 L33:                             
;  Source Line # 239
  239| 0002E4 8B45                        MOV    EAX, [EBP-56] 
  239| 0002E6 C8                                        
  239| 0002E7 3945                        CMP    [EBP-52], EAX 
  239| 0002E9 CC                                        
  239| 0002EA 74                          JE     SHORT L30 
  239| 0002EB 0C                                        
  239| 0002EC 8B45                        MOV    EAX, [EBP-52] 
  239| 0002EE CC                                        
  239| 0002EF 40                          INC    EAX    
  239| 0002F0 8945                        MOV    [EBP-52], EAX 
  239| 0002F2 CC                                        
  239| 0002F3 E9                          JMP    L32    
  239| 0002F4 66FEFFFF                                  
  239|                 L30:                             
  239| 0002F8 8B05                        MOV    EAX, package1.n 
  239| 0002FA 00000000                                  
  239| 0002FE 8945                        MOV    [EBP-28], EAX 
  239| 000300 E4                                        
;  Source Line # 240
  240| 000301 837D                        CMP    DWORD PTR [EBP-28], 0 
  240| 000303 E4                                        
  240| 000304 00                                        
  240| 000305 0F8E                        JLE    L45    
  240| 000307 5B010000                                  
  240| 00030B C745                        MOV    DWORD PTR [EBP-24], 1 
  240| 00030D E8                                        
  240| 00030E 01000000                                  
  240|                 L47:                             
  240| 000312 8B05                        MOV    EAX, package1.h 
  240| 000314 00000000                                  
  240| 000318 D1E0                        SHL    EAX, 1 
  240| 00031A CE                          INTO          
  240| 00031B 40                          INC    EAX    
  240| 00031C CE                          INTO          
  240| 00031D 8945                        MOV    [EBP-20], EAX 
  240| 00031F EC                                        
  240| 000320 6B1D                        IMUL   EBX, package1.h, 3 
  240| 000322 00000000                                  
  240| 000326 03                                        
  240| 000327 CE                          INTO          
  240| 000328 895D                        MOV    [EBP-16], EBX 
  240| 00032A F0                                        
;  Source Line # 241
  241| 00032B 8B4D                        MOV    ECX, [EBP-16] 
  241| 00032D F0                                        
  241| 00032E 394D                        CMP    [EBP-20], ECX 
  241| 000330 EC                                        
  241| 000331 0F8F                        JG     L48    
  241| 000333 1B010000                                  
  241| 000337 8B45                        MOV    EAX, [EBP-20] 
  241| 000339 EC                                        
  241| 00033A 8945                        MOV    [EBP-12], EAX 
  241| 00033C F4                                        
  241|                 L50:                             
;  Source Line # 242
  242| 00033D C745                        MOV    DWORD PTR [EBP-100], 0 ;  Sum1
  242| 00033F 9C                                        
  242| 000340 00000000                                  
  242| 000344 8B05                        MOV    EAX, package1.n 
  242| 000346 00000000                                  
  242| 00034A 8945                        MOV    [EBP-8], EAX 
  242| 00034C F8                                        
;  Source Line # 243
  243| 00034D 837D                        CMP    DWORD PTR [EBP-8], 0 
  243| 00034F F8                                        
  243| 000350 00                                        
  243| 000351 0F8E                        JLE    L51    
  243| 000353 9B000000                                  
  243| 000357 C745                        MOV    DWORD PTR [EBP-4], 1 
  243| 000359 FC                                        
  243| 00035A 01000000                                  
  243|                 L53:                             
;  Source Line # 244
  244| 00035E 8B45                        MOV    EAX, [EBP-84] ;  MT3
  244| 000360 AC                                        
  244| 000361 8B5D                        MOV    EBX, [EBP-4] 
  244| 000363 FC                                        
  244| 000364 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
  244| 000366 00000000                                  
  244|                 L79:                             
  244| 00036A 0F8F                        JG     L80    
  244| 00036C 8A010000                                  
  244| 000370 8D5B                        LEA    EBX, [EBX-1] 
  244| 000372 FF                                        
  244| 000373 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  244| 000376 00000000                                  
  244| 00037A 8B4D                        MOV    ECX, [EBP-12] 
  244| 00037C F4                                        
  244| 00037D 83F9                        CMP    ECX, 1 
  244| 00037F 01                                        
  244|                 L81:                             
  244| 000380 0F8C                        JL     L82    
  244| 000382 80010000                                  
  244| 000386 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  244| 000388 00000000                                  
  244| 00038C 0F8F                        JG     L82    
  244| 00038E 74010000                                  
  244| 000392 8D0C8D                      LEA    ECX, [4*ECX-4] 
  244| 000395 FCFFFFFF                                  
  244| 000399 03D9                        ADD    EBX, ECX 
  244| 00039B 8B55                        MOV    EDX, [EBP-92] ;  MB3
  244| 00039D A4                                        
  244| 00039E 8B75                        MOV    ESI, [EBP-24] 
  244| 0003A0 E8                                        
  244| 0003A1 3B35                        CMP    ESI, package1.matr__constrained_array____1 
  244| 0003A3 00000000                                  
  244|                 L83:                             
  244| 0003A7 0F8F                        JG     L84    
  244| 0003A9 65010000                                  
  244| 0003AD 8D76                        LEA    ESI, [ESI-1] 
  244| 0003AF FF                                        
  244| 0003B0 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  244| 0003B3 00000000                                  
  244| 0003B7 8B7D                        MOV    EDI, [EBP-4] 
  244| 0003B9 FC                                        
  244| 0003BA 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  244| 0003BC 00000000                                  
  244|                 L85:                             
  244| 0003C0 0F8F                        JG     L86    
  244| 0003C2 58010000                                  
  244| 0003C6 8D3CBD                      LEA    EDI, [4*EDI-4] 
  244| 0003C9 FCFFFFFF                                  
  244| 0003CD 03F7                        ADD    ESI, EDI 
  244| 0003CF 8B0418                      MOV    EAX, [EAX+EBX+0] 
  244| 0003D2 0FAF0432                    IMUL   EAX, [EDX+ESI+0] 
  244| 0003D6 CE                          INTO          
  244| 0003D7 0345                        ADD    EAX, [EBP-100] ;  Sum1
  244| 0003D9 9C                                        
  244| 0003DA CE                          INTO          
  244| 0003DB 8945                        MOV    [EBP-100], EAX ;  Sum1
  244| 0003DD 9C                                        
;  Source Line # 245
  245| 0003DE 8B4D                        MOV    ECX, [EBP-8] 
  245| 0003E0 F8                                        
  245| 0003E1 394D                        CMP    [EBP-4], ECX 
  245| 0003E3 FC                                        
  245| 0003E4 74                          JE     SHORT L51 
  245| 0003E5 0C                                        
  245| 0003E6 8B45                        MOV    EAX, [EBP-4] 
  245| 0003E8 FC                                        
  245| 0003E9 40                          INC    EAX    
  245| 0003EA 8945                        MOV    [EBP-4], EAX 
  245| 0003EC FC                                        
  245| 0003ED E9                          JMP    L53    
  245| 0003EE 6CFFFFFF                                  
  245|                 L51:                             
;  Source Line # 246
  246| 0003F2 8B55                        MOV    EDX, [EBP-108] ; Spill
  246| 0003F4 94                                        
  246| 0003F5 8B42                        MOV    EAX, [EDX+48] 
  246| 0003F7 30                                        
  246| 0003F8 8B98                        MOV    EBX, [EAX-140] ;  MA
  246| 0003FA 74FFFFFF                                  
  246| 0003FE 8B4D                        MOV    ECX, [EBP-24] 
  246| 000400 E8                                        
  246| 000401 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  246| 000403 00000000                                  
  246|                 L87:                             
  246| 000407 0F8F                        JG     L88    
  246| 000409 1D010000                                  
  246| 00040D 8D49                        LEA    ECX, [ECX-1] 
  246| 00040F FF                                        
  246| 000410 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  246| 000413 00000000                                  
  246| 000417 8B75                        MOV    ESI, [EBP-12] 
  246| 000419 F4                                        
  246| 00041A 83FE                        CMP    ESI, 1 
  246| 00041C 01                                        
  246|                 L89:                             
  246| 00041D 0F8C                        JL     L90    
  246| 00041F 13010000                                  
  246| 000423 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  246| 000425 00000000                                  
  246| 000429 0F8F                        JG     L90    
  246| 00042B 07010000                                  
  246| 00042F 8D34B5                      LEA    ESI, [4*ESI-4] 
  246| 000432 FCFFFFFF                                  
  246| 000436 03CE                        ADD    ECX, ESI 
  246| 000438 8B7D                        MOV    EDI, [EBP-100] ;  Sum1
  246| 00043A 9C                                        
  246| 00043B 893C0B                      MOV    [EBX+ECX+0], EDI 
;  Source Line # 247
  247| 00043E 8B55                        MOV    EDX, [EBP-16] 
  247| 000440 F0                                        
  247| 000441 3955                        CMP    [EBP-12], EDX 
  247| 000443 F4                                        
  247| 000444 74                          JE     SHORT L48 
  247| 000445 0C                                        
  247| 000446 8B45                        MOV    EAX, [EBP-12] 
  247| 000448 F4                                        
  247| 000449 40                          INC    EAX    
  247| 00044A 8945                        MOV    [EBP-12], EAX 
  247| 00044C F4                                        
  247| 00044D E9                          JMP    L50    
  247| 00044E EBFEFFFF                                  
  247|                 L48:                             
;  Source Line # 248
  248| 000452 8B45                        MOV    EAX, [EBP-28] 
  248| 000454 E4                                        
  248| 000455 3945                        CMP    [EBP-24], EAX 
  248| 000457 E8                                        
  248| 000458 74                          JE     SHORT L45 
  248| 000459 0C                                        
  248| 00045A 8B45                        MOV    EAX, [EBP-24] 
  248| 00045C E8                                        
  248| 00045D 40                          INC    EAX    
  248| 00045E 8945                        MOV    [EBP-24], EAX 
  248| 000460 E8                                        
  248| 000461 E9                          JMP    L47    
  248| 000462 ACFEFFFF                                  
  248|                 L45:                             
;  Source Line # 250
  250| 000466 68                          PUSH   lab4.mon.calculationsignal 
  250| 000467 00000000                                  
  250| 00046B 6A                          PUSH   0      
  250| 00046C 00                                        
  250| 00046D 8B55                        MOV    EDX, [EBP-108] ; Spill
  250| 00046F 94                                        
  250| 000470 8B42                        MOV    EAX, [EDX+48] 
  250| 000472 30                                        
  250| 000473 8B58                        MOV    EBX, [EAX-44] ;  MON
  250| 000475 D4                                        
  250| 000476 53                          PUSH   EBX    
  250| 000477 E8                          CALL   rts_protected_procedure_call 
  250| 000478 00000000                                  
;  Source Line # 252
  252| 00047C 68                          PUSH   __lcl.00000294 
  252| 00047D 00000000                                  
  252| 000481 68                          PUSH   __lcl.00000293 
  252| 000482 00000000                                  
  252| 000486 E8                          CALL   ada.text_io.put_line__2 
  252| 000487 00000000                                  
  252| 00048B 8D4D                        LEA    ECX, [EBP-96] ;  dyn_temp
  252| 00048D A0                                        
  252| 00048E 51                          PUSH   ECX    
  252| 00048F E8                          CALL   rts_ss_release 
  252| 000490 00000000                                  
;  Source Line # 253
  253| 000494 8BE5                        MOV    ESP, EBP 
  253| 000496 5D                          POP    EBP    
  253| 000497 C2                          RET    4      
  253| 000498 0400                                      
  253|                 L64:                             
  253| 00049A 8D05                        LEA    EAX, L63+5 
  253| 00049C C4010000                                  
  253| 0004A0 50                          PUSH   EAX    
  253| 0004A1 E9                          JMP    rts_raise_constraint_error 
  253| 0004A2 00000000                                  
  253|                 L66:                             
  253| 0004A6 8D05                        LEA    EAX, L65+5 
  253| 0004A8 DA010000                                  
  253| 0004AC 50                          PUSH   EAX    
  253| 0004AD E9                          JMP    rts_raise_constraint_error 
  253| 0004AE 00000000                                  
  253|                 L68:                             
  253| 0004B2 8D05                        LEA    EAX, L67+5 
  253| 0004B4 01020000                                  
  253| 0004B8 50                          PUSH   EAX    
  253| 0004B9 E9                          JMP    rts_raise_constraint_error 
  253| 0004BA 00000000                                  
  253|                 L70:                             
  253| 0004BE 8D05                        LEA    EAX, L69+5 
  253| 0004C0 1A020000                                  
  253| 0004C4 50                          PUSH   EAX    
  253| 0004C5 E9                          JMP    rts_raise_constraint_error 
  253| 0004C6 00000000                                  
  253|                 L72:                             
  253| 0004CA 8D05                        LEA    EAX, L71+5 
  253| 0004CC 61020000                                  
  253| 0004D0 50                          PUSH   EAX    
  253| 0004D1 E9                          JMP    rts_raise_constraint_error 
  253| 0004D2 00000000                                  
  253|                 L74:                             
  253| 0004D6 8D05                        LEA    EAX, L73+5 
  253| 0004D8 7A020000                                  
  253| 0004DC 50                          PUSH   EAX    
  253| 0004DD E9                          JMP    rts_raise_constraint_error 
  253| 0004DE 00000000                                  
  253|                 L76:                             
  253| 0004E2 8D05                        LEA    EAX, L75+5 
  253| 0004E4 A1020000                                  
  253| 0004E8 50                          PUSH   EAX    
  253| 0004E9 E9                          JMP    rts_raise_constraint_error 
  253| 0004EA 00000000                                  
  253|                 L78:                             
  253| 0004EE 8D05                        LEA    EAX, L77+5 
  253| 0004F0 B7020000                                  
  253| 0004F4 50                          PUSH   EAX    
  253| 0004F5 E9                          JMP    rts_raise_constraint_error 
  253| 0004F6 00000000                                  
  253|                 L80:                             
  253| 0004FA 8D05                        LEA    EAX, L79+5 
  253| 0004FC 6F030000                                  
  253| 000500 50                          PUSH   EAX    
  253| 000501 E9                          JMP    rts_raise_constraint_error 
  253| 000502 00000000                                  
  253|                 L82:                             
  253| 000506 8D05                        LEA    EAX, L81+5 
  253| 000508 85030000                                  
  253| 00050C 50                          PUSH   EAX    
  253| 00050D E9                          JMP    rts_raise_constraint_error 
  253| 00050E 00000000                                  
  253|                 L84:                             
  253| 000512 8D05                        LEA    EAX, L83+5 
  253| 000514 AC030000                                  
  253| 000518 50                          PUSH   EAX    
  253| 000519 E9                          JMP    rts_raise_constraint_error 
  253| 00051A 00000000                                  
  253|                 L86:                             
  253| 00051E 8D05                        LEA    EAX, L85+5 
  253| 000520 C5030000                                  
  253| 000524 50                          PUSH   EAX    
  253| 000525 E9                          JMP    rts_raise_constraint_error 
  253| 000526 00000000                                  
  253|                 L88:                             
  253| 00052A 8D05                        LEA    EAX, L87+5 
  253| 00052C 0C040000                                  
  253| 000530 50                          PUSH   EAX    
  253| 000531 E9                          JMP    rts_raise_constraint_error 
  253| 000532 00000000                                  
  253|                 L90:                             
  253| 000536 8D05                        LEA    EAX, L89+5 
  253| 000538 22040000                                  
  253| 00053C 50                          PUSH   EAX    
  253| 00053D E9                          JMP    rts_raise_constraint_error 
  253| 00053E 00000000                                  
                       ;                                
                       lab4.start.t3__body ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000369     DD     00002101 
                                          DD     000000D6 
                                          DD     lab4.start.t3__body 
                                          DD     __lcl.00000382 
                                          DD     000000D8 
                                          DD     lab4.start.t3__body+00000010H 
                                          DD     __lcl.00000382 
                                          DD     000000DA 
                                          DD     lab4.start.t3__body+0000007EH 
                                          DD     __lcl.00000382 
                                          DD     000000DB 
                                          DD     lab4.start.t3__body+00000083H 
                                          DD     __lcl.00000382 
                                          DD     000000DD 
                                          DD     lab4.start.t3__body+00000092H 
                                          DD     __lcl.00000382 
                                          DD     000000DE 
                                          DD     lab4.start.t3__body+0000009BH 
                                          DD     __lcl.00000382 
                                          DD     000000E0 
                                          DD     lab4.start.t3__body+000000B9H 
                                          DD     __lcl.00000382 
                                          DD     000000E1 
                                          DD     lab4.start.t3__body+000000CFH 
                                          DD     __lcl.00000382 
                                          DD     000000E3 
                                          DD     lab4.start.t3__body+000000E4H 
                                          DD     __lcl.00000382 
                                          DD     000000E4 
                                          DD     lab4.start.t3__body+00000102H 
                                          DD     __lcl.00000382 
                                          DD     000000E5 
                                          DD     lab4.start.t3__body+00000120H 
                                          DD     __lcl.00000382 
                                          DD     000000E7 
                                          DD     lab4.start.t3__body+0000014DH 
                                          DD     __lcl.00000382 
                                          DD     000000E8 
                                          DD     lab4.start.t3__body+00000177H 
                                          DD     __lcl.00000382 
                                          DD     000000E9 
                                          DD     lab4.start.t3__body+00000189H 
                                          DD     __lcl.00000382 
                                          DD     000000EA 
                                          DD     lab4.start.t3__body+00000199H 
                                          DD     __lcl.00000382 
                                          DD     000000EB 
                                          DD     lab4.start.t3__body+000001AAH 
                                          DD     __lcl.00000382 
                                          DD     000000EC 
                                          DD     lab4.start.t3__body+00000233H 
                                          DD     __lcl.00000382 
                                          DD     000000ED 
                                          DD     lab4.start.t3__body+00000247H 
                                          DD     __lcl.00000382 
                                          DD     000000EE 
                                          DD     lab4.start.t3__body+000002D0H 
                                          DD     __lcl.00000382 
                                          DD     000000EF 
                                          DD     lab4.start.t3__body+000002E4H 
                                          DD     __lcl.00000382 
                                          DD     000000F0 
                                          DD     lab4.start.t3__body+00000301H 
                                          DD     __lcl.00000382 
                                          DD     000000F1 
                                          DD     lab4.start.t3__body+0000032BH 
                                          DD     __lcl.00000382 
                                          DD     000000F2 
                                          DD     lab4.start.t3__body+0000033DH 
                                          DD     __lcl.00000382 
                                          DD     000000F3 
                                          DD     lab4.start.t3__body+0000034DH 
                                          DD     __lcl.00000382 
                                          DD     000000F4 
                                          DD     lab4.start.t3__body+0000035EH 
                                          DD     __lcl.00000382 
                                          DD     000000F5 
                                          DD     lab4.start.t3__body+000003DEH 
                                          DD     __lcl.00000382 
                                          DD     000000F6 
                                          DD     lab4.start.t3__body+000003F2H 
                                          DD     __lcl.00000382 
                                          DD     000000F7 
                                          DD     lab4.start.t3__body+0000043EH 
                                          DD     __lcl.00000382 
                                          DD     000000F8 
                                          DD     lab4.start.t3__body+00000452H 
                                          DD     __lcl.00000382 
                                          DD     000000FA 
                                          DD     lab4.start.t3__body+00000466H 
                                          DD     __lcl.00000382 
                                          DD     000000FC 
                                          DD     lab4.start.t3__body+0000047CH 
                                          DD     __lcl.00000382 
                                          DD     000000FD 
                                          DD     lab4.start.t3__body+00000494H 
                                          DD     __lcl.00000382 
                                          DD     000000FD 
                                          DD     lab4.start.t3__body+0000053EH 
                                          DD     __lcl.00000382 
; ********* End of segment, Total Size = 400

                       ;                                
                       ;  Start of procedure lab4.start.t4__body   
                       ;                                
                                          PUBLIC lab4.start.t4__body 
                       lab4.start.t4__body PROC  NEAR   
;  Source Line # 256
  256| 000000 64                          FS:           
  256| 000001 8B15                        MOV    EDX, 4 
  256| 000003 04000000                                  
  256| 000007 8B52                        MOV    EDX, [EDX-4] 
  256| 000009 FC                                        
  256| 00000A 55                          PUSH   EBP    
  256| 00000B 8BEC                        MOV    EBP, ESP 
  256| 00000D 83EC                        SUB    ESP, 108 
  256| 00000F 6C                                        
;  Source Line # 258
  258| 000010 8B02                        MOV    EAX, [EDX+0] 
  258| 000012 8945                        MOV    [EBP-96], EAX ;  dyn_temp
  258| 000014 A0                                        
  258| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  258| 000017 00000000                                  
  258| 00001B 83EB                        SUB    EBX, 1 
  258| 00001D 01                                        
  258| 00001E 7D                          JGE    SHORT L60 
  258| 00001F 03                                        
  258| 000020 33DB                        XOR    EBX, EBX 
  258| 000022 4B                          DEC    EBX    
  258|                 L60:                             
  258| 000023 CE                          INTO          
  258| 000024 43                          INC    EBX    
  258| 000025 CE                          INTO          
  258| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  258| 000029 00000000                                  
  258| 00002D CE                          INTO          
  258| 00002E 53                          PUSH   EBX    
  258| 00002F 8955                        MOV    [EBP-108], EDX ; Spill
  258| 000031 94                                        
  258| 000032 E8                          CALL   rts_ss_allocate 
  258| 000033 00000000                                  
  258| 000037 8945                        MOV    [EBP-92], EAX ;  MB4
  258| 000039 A4                                        
  258| 00003A 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
  258| 00003C 00000000                                  
  258| 000040 83E9                        SUB    ECX, 1 
  258| 000042 01                                        
  258| 000043 7D                          JGE    SHORT L61 
  258| 000044 03                                        
  258| 000045 33C9                        XOR    ECX, ECX 
  258| 000047 49                          DEC    ECX    
  258|                 L61:                             
  258| 000048 CE                          INTO          
  258| 000049 41                          INC    ECX    
  258| 00004A CE                          INTO          
  258| 00004B 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  258| 00004E 00000000                                  
  258| 000052 CE                          INTO          
  258| 000053 51                          PUSH   ECX    
  258| 000054 E8                          CALL   rts_ss_allocate 
  258| 000055 00000000                                  
  258| 000059 8945                        MOV    [EBP-88], EAX ;  MZ4
  258| 00005B A8                                        
  258| 00005C 8B35                        MOV    ESI, package1.matr__constrained_array____1 
  258| 00005E 00000000                                  
  258| 000062 83EE                        SUB    ESI, 1 
  258| 000064 01                                        
  258| 000065 7D                          JGE    SHORT L62 
  258| 000066 03                                        
  258| 000067 33F6                        XOR    ESI, ESI 
  258| 000069 4E                          DEC    ESI    
  258|                 L62:                             
  258| 00006A CE                          INTO          
  258| 00006B 46                          INC    ESI    
  258| 00006C CE                          INTO          
  258| 00006D 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  258| 000070 00000000                                  
  258| 000074 CE                          INTO          
  258| 000075 56                          PUSH   ESI    
  258| 000076 E8                          CALL   rts_ss_allocate 
  258| 000077 00000000                                  
  258| 00007B 8945                        MOV    [EBP-84], EAX ;  MT4
  258| 00007D AC                                        
;  Source Line # 260
  260| 00007E E8                          CALL   rts_activation_succeeded 
  260| 00007F 00000000                                  
;  Source Line # 261
  261| 000083 68                          PUSH   __lcl.00000302 
  261| 000084 00000000                                  
  261| 000088 68                          PUSH   __lcl.00000301 
  261| 000089 00000000                                  
  261| 00008D E8                          CALL   ada.text_io.put_line__2 
  261| 00008E 00000000                                  
;  Source Line # 263
  263| 000092 8B55                        MOV    EDX, [EBP-108] ; Spill
  263| 000094 94                                        
  263| 000095 8B7A                        MOV    EDI, [EDX+48] 
  263| 000097 30                                        
  263| 000098 8B9F                        MOV    EBX, [EDI-132] ;  MK
  263| 00009A 7CFFFFFF                                  
  263| 00009E 53                          PUSH   EBX    
  263| 00009F E8                          CALL   package1.matr_input 
  263| 0000A0 00000000                                  
;  Source Line # 264
  264| 0000A4 C745                        MOV    DWORD PTR [EBP-80], 1 ;  alfa4
  264| 0000A6 B0                                        
  264| 0000A7 01000000                                  
;  Source Line # 265
  265| 0000AB 8B4D                        MOV    ECX, [EBP-80] ;  alfa4
  265| 0000AD B0                                        
  265| 0000AE 894D                        MOV    [EBP-76], ECX 
  265| 0000B0 B4                                        
  265| 0000B1 68                          PUSH   lab4.mon.setalfa 
  265| 0000B2 00000000                                  
  265| 0000B6 8D75                        LEA    ESI, [EBP-76] 
  265| 0000B8 B4                                        
  265| 0000B9 56                          PUSH   ESI    
  265| 0000BA 8B55                        MOV    EDX, [EBP-108] ; Spill
  265| 0000BC 94                                        
  265| 0000BD 8B42                        MOV    EAX, [EDX+48] 
  265| 0000BF 30                                        
  265| 0000C0 8B78                        MOV    EDI, [EAX-44] ;  MON
  265| 0000C2 D4                                        
  265| 0000C3 57                          PUSH   EDI    
  265| 0000C4 E8                          CALL   rts_protected_procedure_call 
  265| 0000C5 00000000                                  
;  Source Line # 267
  267| 0000C9 68                          PUSH   lab4.mon.datasignal 
  267| 0000CA 00000000                                  
  267| 0000CE 6A                          PUSH   0      
  267| 0000CF 00                                        
  267| 0000D0 8B55                        MOV    EDX, [EBP-108] ; Spill
  267| 0000D2 94                                        
  267| 0000D3 8B5A                        MOV    EBX, [EDX+48] 
  267| 0000D5 30                                        
  267| 0000D6 8B4B                        MOV    ECX, [EBX-44] ;  MON
  267| 0000D8 D4                                        
  267| 0000D9 51                          PUSH   ECX    
  267| 0000DA E8                          CALL   rts_protected_procedure_call 
  267| 0000DB 00000000                                  
;  Source Line # 268
  268| 0000DF 6A                          PUSH   0      
  268| 0000E0 00                                        
  268| 0000E1 6A                          PUSH   0      
  268| 0000E2 00                                        
  268| 0000E3 6A                          PUSH   0      
  268| 0000E4 00                                        
  268| 0000E5 8B55                        MOV    EDX, [EBP-108] ; Spill
  268| 0000E7 94                                        
  268| 0000E8 8B72                        MOV    ESI, [EDX+48] 
  268| 0000EA 30                                        
  268| 0000EB 8B46                        MOV    EAX, [ESI-44] ;  MON
  268| 0000ED D4                                        
  268| 0000EE 50                          PUSH   EAX    
  268| 0000EF E8                          CALL   rts_protected_entry_call 
  268| 0000F0 00000000                                  
;  Source Line # 270
  270| 0000F4 8B7D                        MOV    EDI, [EBP-88] ;  MZ4
  270| 0000F6 A8                                        
  270| 0000F7 897D                        MOV    [EBP-72], EDI 
  270| 0000F9 B8                                        
  270| 0000FA 68                          PUSH   lab4.mon.getmz 
  270| 0000FB 00000000                                  
  270| 0000FF 8D5D                        LEA    EBX, [EBP-72] 
  270| 000101 B8                                        
  270| 000102 53                          PUSH   EBX    
  270| 000103 8B55                        MOV    EDX, [EBP-108] ; Spill
  270| 000105 94                                        
  270| 000106 8B4A                        MOV    ECX, [EDX+48] 
  270| 000108 30                                        
  270| 000109 8B71                        MOV    ESI, [ECX-44] ;  MON
  270| 00010B D4                                        
  270| 00010C 56                          PUSH   ESI    
  270| 00010D E8                          CALL   rts_entryless_protected_subp_call 
  270| 00010E 00000000                                  
;  Source Line # 271
  271| 000112 8B45                        MOV    EAX, [EBP-92] ;  MB4
  271| 000114 A4                                        
  271| 000115 8945                        MOV    [EBP-68], EAX 
  271| 000117 BC                                        
  271| 000118 68                          PUSH   lab4.mon.getmb 
  271| 000119 00000000                                  
  271| 00011D 8D7D                        LEA    EDI, [EBP-68] 
  271| 00011F BC                                        
  271| 000120 57                          PUSH   EDI    
  271| 000121 8B55                        MOV    EDX, [EBP-108] ; Spill
  271| 000123 94                                        
  271| 000124 8B5A                        MOV    EBX, [EDX+48] 
  271| 000126 30                                        
  271| 000127 8B4B                        MOV    ECX, [EBX-44] ;  MON
  271| 000129 D4                                        
  271| 00012A 51                          PUSH   ECX    
  271| 00012B E8                          CALL   rts_entryless_protected_subp_call 
  271| 00012C 00000000                                  
;  Source Line # 272
  272| 000130 8D75                        LEA    ESI, [EBP-64] 
  272| 000132 C0                                        
  272| 000133 8975                        MOV    [EBP-60], ESI 
  272| 000135 C4                                        
  272| 000136 68                          PUSH   lab4.mon.getalfa 
  272| 000137 00000000                                  
  272| 00013B 8D45                        LEA    EAX, [EBP-60] 
  272| 00013D C4                                        
  272| 00013E 50                          PUSH   EAX    
  272| 00013F 8B55                        MOV    EDX, [EBP-108] ; Spill
  272| 000141 94                                        
  272| 000142 8B7A                        MOV    EDI, [EDX+48] 
  272| 000144 30                                        
  272| 000145 8B5F                        MOV    EBX, [EDI-44] ;  MON
  272| 000147 D4                                        
  272| 000148 53                          PUSH   EBX    
  272| 000149 E8                          CALL   rts_entryless_protected_subp_call 
  272| 00014A 00000000                                  
  272| 00014E 8B4D                        MOV    ECX, [EBP-64] 
  272| 000150 C0                                        
  272| 000151 894D                        MOV    [EBP-80], ECX ;  alfa4
  272| 000153 B0                                        
  272| 000154 8B35                        MOV    ESI, package1.n 
  272| 000156 00000000                                  
  272| 00015A 8975                        MOV    [EBP-56], ESI 
  272| 00015C C8                                        
;  Source Line # 274
  274| 00015D 837D                        CMP    DWORD PTR [EBP-56], 0 
  274| 00015F C8                                        
  274| 000160 00                                        
  274| 000161 0F8E                        JLE    L30    
  274| 000163 9E010000                                  
  274| 000167 C745                        MOV    DWORD PTR [EBP-52], 1 
  274| 000169 CC                                        
  274| 00016A 01000000                                  
  274|                 L32:                             
  274| 00016E 6B05                        IMUL   EAX, package1.h, 3 
  274| 000170 00000000                                  
  274| 000174 03                                        
  274| 000175 CE                          INTO          
  274| 000176 40                          INC    EAX    
  274| 000177 CE                          INTO          
  274| 000178 8945                        MOV    [EBP-48], EAX 
  274| 00017A D0                                        
  274| 00017B 8B1D                        MOV    EBX, package1.n 
  274| 00017D 00000000                                  
  274| 000181 895D                        MOV    [EBP-44], EBX 
  274| 000183 D4                                        
;  Source Line # 275
  275| 000184 8B4D                        MOV    ECX, [EBP-44] 
  275| 000186 D4                                        
  275| 000187 394D                        CMP    [EBP-48], ECX 
  275| 000189 D0                                        
  275| 00018A 0F8F                        JG     L33    
  275| 00018C 61010000                                  
  275| 000190 8B45                        MOV    EAX, [EBP-48] 
  275| 000192 D0                                        
  275| 000193 8945                        MOV    [EBP-40], EAX 
  275| 000195 D8                                        
  275|                 L35:                             
;  Source Line # 276
  276| 000196 C745                        MOV    DWORD PTR [EBP-100], 0 ;  Sum1
  276| 000198 9C                                        
  276| 000199 00000000                                  
  276| 00019D 8B05                        MOV    EAX, package1.n 
  276| 00019F 00000000                                  
  276| 0001A3 8945                        MOV    [EBP-36], EAX 
  276| 0001A5 DC                                        
;  Source Line # 277
  277| 0001A6 837D                        CMP    DWORD PTR [EBP-36], 0 
  277| 0001A8 DC                                        
  277| 0001A9 00                                        
  277| 0001AA 0F8E                        JLE    L36    
  277| 0001AC A4000000                                  
  277| 0001B0 C745                        MOV    DWORD PTR [EBP-32], 1 
  277| 0001B2 E0                                        
  277| 0001B3 01000000                                  
  277|                 L38:                             
;  Source Line # 278
  278| 0001B7 8B55                        MOV    EDX, [EBP-108] ; Spill
  278| 0001B9 94                                        
  278| 0001BA 8B42                        MOV    EAX, [EDX+48] 
  278| 0001BC 30                                        
  278| 0001BD 8B98                        MOV    EBX, [EAX-132] ;  MK
  278| 0001BF 7CFFFFFF                                  
  278| 0001C3 8B4D                        MOV    ECX, [EBP-32] 
  278| 0001C5 E0                                        
  278| 0001C6 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  278| 0001C8 00000000                                  
  278|                 L63:                             
  278| 0001CC 0F8F                        JG     L64    
  278| 0001CE D2020000                                  
  278| 0001D2 8D49                        LEA    ECX, [ECX-1] 
  278| 0001D4 FF                                        
  278| 0001D5 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  278| 0001D8 00000000                                  
  278| 0001DC 8B75                        MOV    ESI, [EBP-40] 
  278| 0001DE D8                                        
  278| 0001DF 83FE                        CMP    ESI, 1 
  278| 0001E1 01                                        
  278|                 L65:                             
  278| 0001E2 0F8C                        JL     L66    
  278| 0001E4 C8020000                                  
  278| 0001E8 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  278| 0001EA 00000000                                  
  278| 0001EE 0F8F                        JG     L66    
  278| 0001F0 BC020000                                  
  278| 0001F4 8D34B5                      LEA    ESI, [4*ESI-4] 
  278| 0001F7 FCFFFFFF                                  
  278| 0001FB 03CE                        ADD    ECX, ESI 
  278| 0001FD 8B7D                        MOV    EDI, [EBP-88] ;  MZ4
  278| 0001FF A8                                        
  278| 000200 8B55                        MOV    EDX, [EBP-52] 
  278| 000202 CC                                        
  278| 000203 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  278| 000205 00000000                                  
  278|                 L67:                             
  278| 000209 0F8F                        JG     L68    
  278| 00020B AD020000                                  
  278| 00020F 8D52                        LEA    EDX, [EDX-1] 
  278| 000211 FF                                        
  278| 000212 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  278| 000215 00000000                                  
  278| 000219 8B45                        MOV    EAX, [EBP-32] 
  278| 00021B E0                                        
  278| 00021C 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  278| 00021E 00000000                                  
  278|                 L69:                             
  278| 000222 0F8F                        JG     L70    
  278| 000224 A0020000                                  
  278| 000228 8D0485                      LEA    EAX, [4*EAX-4] 
  278| 00022B FCFFFFFF                                  
  278| 00022F 03D0                        ADD    EDX, EAX 
  278| 000231 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  278| 000234 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  278| 000238 CE                          INTO          
  278| 000239 035D                        ADD    EBX, [EBP-100] ;  Sum1
  278| 00023B 9C                                        
  278| 00023C CE                          INTO          
  278| 00023D 895D                        MOV    [EBP-100], EBX ;  Sum1
  278| 00023F 9C                                        
;  Source Line # 279
  279| 000240 8B75                        MOV    ESI, [EBP-36] 
  279| 000242 DC                                        
  279| 000243 3975                        CMP    [EBP-32], ESI 
  279| 000245 E0                                        
  279| 000246 74                          JE     SHORT L36 
  279| 000247 0C                                        
  279| 000248 8B45                        MOV    EAX, [EBP-32] 
  279| 00024A E0                                        
  279| 00024B 40                          INC    EAX    
  279| 00024C 8945                        MOV    [EBP-32], EAX 
  279| 00024E E0                                        
  279| 00024F E9                          JMP    L38    
  279| 000250 63FFFFFF                                  
  279|                 L36:                             
;  Source Line # 280
  280| 000254 8B55                        MOV    EDX, [EBP-108] ; Spill
  280| 000256 94                                        
  280| 000257 8B42                        MOV    EAX, [EDX+48] 
  280| 000259 30                                        
  280| 00025A 8B98                        MOV    EBX, [EAX-136] ;  MC
  280| 00025C 78FFFFFF                                  
  280| 000260 8B4D                        MOV    ECX, [EBP-52] 
  280| 000262 CC                                        
  280| 000263 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  280| 000265 00000000                                  
  280|                 L71:                             
  280| 000269 0F8F                        JG     L72    
  280| 00026B 65020000                                  
  280| 00026F 8D49                        LEA    ECX, [ECX-1] 
  280| 000271 FF                                        
  280| 000272 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  280| 000275 00000000                                  
  280| 000279 8B75                        MOV    ESI, [EBP-40] 
  280| 00027B D8                                        
  280| 00027C 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  280| 00027E 00000000                                  
  280|                 L73:                             
  280| 000282 0F8F                        JG     L74    
  280| 000284 58020000                                  
  280| 000288 8D34B5                      LEA    ESI, [4*ESI-4] 
  280| 00028B FCFFFFFF                                  
  280| 00028F 03CE                        ADD    ECX, ESI 
  280| 000291 8B7D                        MOV    EDI, [EBP-80] ;  alfa4
  280| 000293 B0                                        
  280| 000294 0FAF7D                      IMUL   EDI, [EBP-100] ;  Sum1
  280| 000297 9C                                        
  280| 000298 CE                          INTO          
  280| 000299 033C0B                      ADD    EDI, [EBX+ECX+0] 
  280| 00029C CE                          INTO          
  280| 00029D 8B55                        MOV    EDX, [EBP-84] ;  MT4
  280| 00029F AC                                        
  280| 0002A0 8B45                        MOV    EAX, [EBP-52] 
  280| 0002A2 CC                                        
  280| 0002A3 3B05                        CMP    EAX, package1.matr__constrained_array____1 
  280| 0002A5 00000000                                  
  280|                 L75:                             
  280| 0002A9 0F8F                        JG     L76    
  280| 0002AB 3D020000                                  
  280| 0002AF 8D40                        LEA    EAX, [EAX-1] 
  280| 0002B1 FF                                        
  280| 0002B2 0FAF05                      IMUL   EAX, package1.matr__COMP_SU_SIZE 
  280| 0002B5 00000000                                  
  280| 0002B9 8B5D                        MOV    EBX, [EBP-40] 
  280| 0002BB D8                                        
  280| 0002BC 83FB                        CMP    EBX, 1 
  280| 0002BE 01                                        
  280|                 L77:                             
  280| 0002BF 0F8C                        JL     L78    
  280| 0002C1 33020000                                  
  280| 0002C5 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
  280| 0002C7 00000000                                  
  280| 0002CB 0F8F                        JG     L78    
  280| 0002CD 27020000                                  
  280| 0002D1 8D1C9D                      LEA    EBX, [4*EBX-4] 
  280| 0002D4 FCFFFFFF                                  
  280| 0002D8 03C3                        ADD    EAX, EBX 
  280| 0002DA 893C02                      MOV    [EDX+EAX+0], EDI 
;  Source Line # 281
  281| 0002DD 8B75                        MOV    ESI, [EBP-44] 
  281| 0002DF D4                                        
  281| 0002E0 3975                        CMP    [EBP-40], ESI 
  281| 0002E2 D8                                        
  281| 0002E3 74                          JE     SHORT L33 
  281| 0002E4 0C                                        
  281| 0002E5 8B45                        MOV    EAX, [EBP-40] 
  281| 0002E7 D8                                        
  281| 0002E8 40                          INC    EAX    
  281| 0002E9 8945                        MOV    [EBP-40], EAX 
  281| 0002EB D8                                        
  281| 0002EC E9                          JMP    L35    
  281| 0002ED A5FEFFFF                                  
  281|                 L33:                             
;  Source Line # 282
  282| 0002F1 8B45                        MOV    EAX, [EBP-56] 
  282| 0002F3 C8                                        
  282| 0002F4 3945                        CMP    [EBP-52], EAX 
  282| 0002F6 CC                                        
  282| 0002F7 74                          JE     SHORT L30 
  282| 0002F8 0C                                        
  282| 0002F9 8B45                        MOV    EAX, [EBP-52] 
  282| 0002FB CC                                        
  282| 0002FC 40                          INC    EAX    
  282| 0002FD 8945                        MOV    [EBP-52], EAX 
  282| 0002FF CC                                        
  282| 000300 E9                          JMP    L32    
  282| 000301 69FEFFFF                                  
  282|                 L30:                             
  282| 000305 8B05                        MOV    EAX, package1.n 
  282| 000307 00000000                                  
  282| 00030B 8945                        MOV    [EBP-28], EAX 
  282| 00030D E4                                        
;  Source Line # 283
  283| 00030E 837D                        CMP    DWORD PTR [EBP-28], 0 
  283| 000310 E4                                        
  283| 000311 00                                        
  283| 000312 0F8E                        JLE    L45    
  283| 000314 58010000                                  
  283| 000318 C745                        MOV    DWORD PTR [EBP-24], 1 
  283| 00031A E8                                        
  283| 00031B 01000000                                  
  283|                 L47:                             
  283| 00031F 6B05                        IMUL   EAX, package1.h, 3 
  283| 000321 00000000                                  
  283| 000325 03                                        
  283| 000326 CE                          INTO          
  283| 000327 40                          INC    EAX    
  283| 000328 CE                          INTO          
  283| 000329 8945                        MOV    [EBP-20], EAX 
  283| 00032B EC                                        
  283| 00032C 8B1D                        MOV    EBX, package1.n 
  283| 00032E 00000000                                  
  283| 000332 895D                        MOV    [EBP-16], EBX 
  283| 000334 F0                                        
;  Source Line # 284
  284| 000335 8B4D                        MOV    ECX, [EBP-16] 
  284| 000337 F0                                        
  284| 000338 394D                        CMP    [EBP-20], ECX 
  284| 00033A EC                                        
  284| 00033B 0F8F                        JG     L48    
  284| 00033D 1B010000                                  
  284| 000341 8B45                        MOV    EAX, [EBP-20] 
  284| 000343 EC                                        
  284| 000344 8945                        MOV    [EBP-12], EAX 
  284| 000346 F4                                        
  284|                 L50:                             
;  Source Line # 285
  285| 000347 C745                        MOV    DWORD PTR [EBP-100], 0 ;  Sum1
  285| 000349 9C                                        
  285| 00034A 00000000                                  
  285| 00034E 8B05                        MOV    EAX, package1.n 
  285| 000350 00000000                                  
  285| 000354 8945                        MOV    [EBP-8], EAX 
  285| 000356 F8                                        
;  Source Line # 286
  286| 000357 837D                        CMP    DWORD PTR [EBP-8], 0 
  286| 000359 F8                                        
  286| 00035A 00                                        
  286| 00035B 0F8E                        JLE    L51    
  286| 00035D 9B000000                                  
  286| 000361 C745                        MOV    DWORD PTR [EBP-4], 1 
  286| 000363 FC                                        
  286| 000364 01000000                                  
  286|                 L53:                             
;  Source Line # 287
  287| 000368 8B45                        MOV    EAX, [EBP-84] ;  MT4
  287| 00036A AC                                        
  287| 00036B 8B5D                        MOV    EBX, [EBP-4] 
  287| 00036D FC                                        
  287| 00036E 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
  287| 000370 00000000                                  
  287|                 L79:                             
  287| 000374 0F8F                        JG     L80    
  287| 000376 8A010000                                  
  287| 00037A 8D5B                        LEA    EBX, [EBX-1] 
  287| 00037C FF                                        
  287| 00037D 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  287| 000380 00000000                                  
  287| 000384 8B4D                        MOV    ECX, [EBP-12] 
  287| 000386 F4                                        
  287| 000387 83F9                        CMP    ECX, 1 
  287| 000389 01                                        
  287|                 L81:                             
  287| 00038A 0F8C                        JL     L82    
  287| 00038C 80010000                                  
  287| 000390 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
  287| 000392 00000000                                  
  287| 000396 0F8F                        JG     L82    
  287| 000398 74010000                                  
  287| 00039C 8D0C8D                      LEA    ECX, [4*ECX-4] 
  287| 00039F FCFFFFFF                                  
  287| 0003A3 03D9                        ADD    EBX, ECX 
  287| 0003A5 8B55                        MOV    EDX, [EBP-92] ;  MB4
  287| 0003A7 A4                                        
  287| 0003A8 8B75                        MOV    ESI, [EBP-24] 
  287| 0003AA E8                                        
  287| 0003AB 3B35                        CMP    ESI, package1.matr__constrained_array____1 
  287| 0003AD 00000000                                  
  287|                 L83:                             
  287| 0003B1 0F8F                        JG     L84    
  287| 0003B3 65010000                                  
  287| 0003B7 8D76                        LEA    ESI, [ESI-1] 
  287| 0003B9 FF                                        
  287| 0003BA 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  287| 0003BD 00000000                                  
  287| 0003C1 8B7D                        MOV    EDI, [EBP-4] 
  287| 0003C3 FC                                        
  287| 0003C4 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  287| 0003C6 00000000                                  
  287|                 L85:                             
  287| 0003CA 0F8F                        JG     L86    
  287| 0003CC 58010000                                  
  287| 0003D0 8D3CBD                      LEA    EDI, [4*EDI-4] 
  287| 0003D3 FCFFFFFF                                  
  287| 0003D7 03F7                        ADD    ESI, EDI 
  287| 0003D9 8B0418                      MOV    EAX, [EAX+EBX+0] 
  287| 0003DC 0FAF0432                    IMUL   EAX, [EDX+ESI+0] 
  287| 0003E0 CE                          INTO          
  287| 0003E1 0345                        ADD    EAX, [EBP-100] ;  Sum1
  287| 0003E3 9C                                        
  287| 0003E4 CE                          INTO          
  287| 0003E5 8945                        MOV    [EBP-100], EAX ;  Sum1
  287| 0003E7 9C                                        
;  Source Line # 288
  288| 0003E8 8B4D                        MOV    ECX, [EBP-8] 
  288| 0003EA F8                                        
  288| 0003EB 394D                        CMP    [EBP-4], ECX 
  288| 0003ED FC                                        
  288| 0003EE 74                          JE     SHORT L51 
  288| 0003EF 0C                                        
  288| 0003F0 8B45                        MOV    EAX, [EBP-4] 
  288| 0003F2 FC                                        
  288| 0003F3 40                          INC    EAX    
  288| 0003F4 8945                        MOV    [EBP-4], EAX 
  288| 0003F6 FC                                        
  288| 0003F7 E9                          JMP    L53    
  288| 0003F8 6CFFFFFF                                  
  288|                 L51:                             
;  Source Line # 289
  289| 0003FC 8B55                        MOV    EDX, [EBP-108] ; Spill
  289| 0003FE 94                                        
  289| 0003FF 8B42                        MOV    EAX, [EDX+48] 
  289| 000401 30                                        
  289| 000402 8B98                        MOV    EBX, [EAX-140] ;  MA
  289| 000404 74FFFFFF                                  
  289| 000408 8B4D                        MOV    ECX, [EBP-24] 
  289| 00040A E8                                        
  289| 00040B 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  289| 00040D 00000000                                  
  289|                 L87:                             
  289| 000411 0F8F                        JG     L88    
  289| 000413 1D010000                                  
  289| 000417 8D49                        LEA    ECX, [ECX-1] 
  289| 000419 FF                                        
  289| 00041A 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  289| 00041D 00000000                                  
  289| 000421 8B75                        MOV    ESI, [EBP-12] 
  289| 000423 F4                                        
  289| 000424 83FE                        CMP    ESI, 1 
  289| 000426 01                                        
  289|                 L89:                             
  289| 000427 0F8C                        JL     L90    
  289| 000429 13010000                                  
  289| 00042D 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  289| 00042F 00000000                                  
  289| 000433 0F8F                        JG     L90    
  289| 000435 07010000                                  
  289| 000439 8D34B5                      LEA    ESI, [4*ESI-4] 
  289| 00043C FCFFFFFF                                  
  289| 000440 03CE                        ADD    ECX, ESI 
  289| 000442 8B7D                        MOV    EDI, [EBP-100] ;  Sum1
  289| 000444 9C                                        
  289| 000445 893C0B                      MOV    [EBX+ECX+0], EDI 
;  Source Line # 290
  290| 000448 8B55                        MOV    EDX, [EBP-16] 
  290| 00044A F0                                        
  290| 00044B 3955                        CMP    [EBP-12], EDX 
  290| 00044D F4                                        
  290| 00044E 74                          JE     SHORT L48 
  290| 00044F 0C                                        
  290| 000450 8B45                        MOV    EAX, [EBP-12] 
  290| 000452 F4                                        
  290| 000453 40                          INC    EAX    
  290| 000454 8945                        MOV    [EBP-12], EAX 
  290| 000456 F4                                        
  290| 000457 E9                          JMP    L50    
  290| 000458 EBFEFFFF                                  
  290|                 L48:                             
;  Source Line # 291
  291| 00045C 8B45                        MOV    EAX, [EBP-28] 
  291| 00045E E4                                        
  291| 00045F 3945                        CMP    [EBP-24], EAX 
  291| 000461 E8                                        
  291| 000462 74                          JE     SHORT L45 
  291| 000463 0C                                        
  291| 000464 8B45                        MOV    EAX, [EBP-24] 
  291| 000466 E8                                        
  291| 000467 40                          INC    EAX    
  291| 000468 8945                        MOV    [EBP-24], EAX 
  291| 00046A E8                                        
  291| 00046B E9                          JMP    L47    
  291| 00046C AFFEFFFF                                  
  291|                 L45:                             
;  Source Line # 293
  293| 000470 68                          PUSH   lab4.mon.calculationsignal 
  293| 000471 00000000                                  
  293| 000475 6A                          PUSH   0      
  293| 000476 00                                        
  293| 000477 8B55                        MOV    EDX, [EBP-108] ; Spill
  293| 000479 94                                        
  293| 00047A 8B42                        MOV    EAX, [EDX+48] 
  293| 00047C 30                                        
  293| 00047D 8B58                        MOV    EBX, [EAX-44] ;  MON
  293| 00047F D4                                        
  293| 000480 53                          PUSH   EBX    
  293| 000481 E8                          CALL   rts_protected_procedure_call 
  293| 000482 00000000                                  
;  Source Line # 295
  295| 000486 68                          PUSH   __lcl.00000338 
  295| 000487 00000000                                  
  295| 00048B 68                          PUSH   __lcl.00000337 
  295| 00048C 00000000                                  
  295| 000490 E8                          CALL   ada.text_io.put_line__2 
  295| 000491 00000000                                  
  295| 000495 8D4D                        LEA    ECX, [EBP-96] ;  dyn_temp
  295| 000497 A0                                        
  295| 000498 51                          PUSH   ECX    
  295| 000499 E8                          CALL   rts_ss_release 
  295| 00049A 00000000                                  
;  Source Line # 296
  296| 00049E 8BE5                        MOV    ESP, EBP 
  296| 0004A0 5D                          POP    EBP    
  296| 0004A1 C2                          RET    4      
  296| 0004A2 0400                                      
  296|                 L64:                             
  296| 0004A4 8D05                        LEA    EAX, L63+5 
  296| 0004A6 D1010000                                  
  296| 0004AA 50                          PUSH   EAX    
  296| 0004AB E9                          JMP    rts_raise_constraint_error 
  296| 0004AC 00000000                                  
  296|                 L66:                             
  296| 0004B0 8D05                        LEA    EAX, L65+5 
  296| 0004B2 E7010000                                  
  296| 0004B6 50                          PUSH   EAX    
  296| 0004B7 E9                          JMP    rts_raise_constraint_error 
  296| 0004B8 00000000                                  
  296|                 L68:                             
  296| 0004BC 8D05                        LEA    EAX, L67+5 
  296| 0004BE 0E020000                                  
  296| 0004C2 50                          PUSH   EAX    
  296| 0004C3 E9                          JMP    rts_raise_constraint_error 
  296| 0004C4 00000000                                  
  296|                 L70:                             
  296| 0004C8 8D05                        LEA    EAX, L69+5 
  296| 0004CA 27020000                                  
  296| 0004CE 50                          PUSH   EAX    
  296| 0004CF E9                          JMP    rts_raise_constraint_error 
  296| 0004D0 00000000                                  
  296|                 L72:                             
  296| 0004D4 8D05                        LEA    EAX, L71+5 
  296| 0004D6 6E020000                                  
  296| 0004DA 50                          PUSH   EAX    
  296| 0004DB E9                          JMP    rts_raise_constraint_error 
  296| 0004DC 00000000                                  
  296|                 L74:                             
  296| 0004E0 8D05                        LEA    EAX, L73+5 
  296| 0004E2 87020000                                  
  296| 0004E6 50                          PUSH   EAX    
  296| 0004E7 E9                          JMP    rts_raise_constraint_error 
  296| 0004E8 00000000                                  
  296|                 L76:                             
  296| 0004EC 8D05                        LEA    EAX, L75+5 
  296| 0004EE AE020000                                  
  296| 0004F2 50                          PUSH   EAX    
  296| 0004F3 E9                          JMP    rts_raise_constraint_error 
  296| 0004F4 00000000                                  
  296|                 L78:                             
  296| 0004F8 8D05                        LEA    EAX, L77+5 
  296| 0004FA C4020000                                  
  296| 0004FE 50                          PUSH   EAX    
  296| 0004FF E9                          JMP    rts_raise_constraint_error 
  296| 000500 00000000                                  
  296|                 L80:                             
  296| 000504 8D05                        LEA    EAX, L79+5 
  296| 000506 79030000                                  
  296| 00050A 50                          PUSH   EAX    
  296| 00050B E9                          JMP    rts_raise_constraint_error 
  296| 00050C 00000000                                  
  296|                 L82:                             
  296| 000510 8D05                        LEA    EAX, L81+5 
  296| 000512 8F030000                                  
  296| 000516 50                          PUSH   EAX    
  296| 000517 E9                          JMP    rts_raise_constraint_error 
  296| 000518 00000000                                  
  296|                 L84:                             
  296| 00051C 8D05                        LEA    EAX, L83+5 
  296| 00051E B6030000                                  
  296| 000522 50                          PUSH   EAX    
  296| 000523 E9                          JMP    rts_raise_constraint_error 
  296| 000524 00000000                                  
  296|                 L86:                             
  296| 000528 8D05                        LEA    EAX, L85+5 
  296| 00052A CF030000                                  
  296| 00052E 50                          PUSH   EAX    
  296| 00052F E9                          JMP    rts_raise_constraint_error 
  296| 000530 00000000                                  
  296|                 L88:                             
  296| 000534 8D05                        LEA    EAX, L87+5 
  296| 000536 16040000                                  
  296| 00053A 50                          PUSH   EAX    
  296| 00053B E9                          JMP    rts_raise_constraint_error 
  296| 00053C 00000000                                  
  296|                 L90:                             
  296| 000540 8D05                        LEA    EAX, L89+5 
  296| 000542 2C040000                                  
  296| 000546 50                          PUSH   EAX    
  296| 000547 E9                          JMP    rts_raise_constraint_error 
  296| 000548 00000000                                  
                       ;                                
                       lab4.start.t4__body ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000368     DD     00002201 
                                          DD     00000100 
                                          DD     lab4.start.t4__body 
                                          DD     __lcl.00000382 
                                          DD     00000102 
                                          DD     lab4.start.t4__body+00000010H 
                                          DD     __lcl.00000382 
                                          DD     00000104 
                                          DD     lab4.start.t4__body+0000007EH 
                                          DD     __lcl.00000382 
                                          DD     00000105 
                                          DD     lab4.start.t4__body+00000083H 
                                          DD     __lcl.00000382 
                                          DD     00000107 
                                          DD     lab4.start.t4__body+00000092H 
                                          DD     __lcl.00000382 
                                          DD     00000108 
                                          DD     lab4.start.t4__body+000000A4H 
                                          DD     __lcl.00000382 
                                          DD     00000109 
                                          DD     lab4.start.t4__body+000000ABH 
                                          DD     __lcl.00000382 
                                          DD     0000010B 
                                          DD     lab4.start.t4__body+000000C9H 
                                          DD     __lcl.00000382 
                                          DD     0000010C 
                                          DD     lab4.start.t4__body+000000DFH 
                                          DD     __lcl.00000382 
                                          DD     0000010E 
                                          DD     lab4.start.t4__body+000000F4H 
                                          DD     __lcl.00000382 
                                          DD     0000010F 
                                          DD     lab4.start.t4__body+00000112H 
                                          DD     __lcl.00000382 
                                          DD     00000110 
                                          DD     lab4.start.t4__body+00000130H 
                                          DD     __lcl.00000382 
                                          DD     00000112 
                                          DD     lab4.start.t4__body+0000015DH 
                                          DD     __lcl.00000382 
                                          DD     00000113 
                                          DD     lab4.start.t4__body+00000184H 
                                          DD     __lcl.00000382 
                                          DD     00000114 
                                          DD     lab4.start.t4__body+00000196H 
                                          DD     __lcl.00000382 
                                          DD     00000115 
                                          DD     lab4.start.t4__body+000001A6H 
                                          DD     __lcl.00000382 
                                          DD     00000116 
                                          DD     lab4.start.t4__body+000001B7H 
                                          DD     __lcl.00000382 
                                          DD     00000117 
                                          DD     lab4.start.t4__body+00000240H 
                                          DD     __lcl.00000382 
                                          DD     00000118 
                                          DD     lab4.start.t4__body+00000254H 
                                          DD     __lcl.00000382 
                                          DD     00000119 
                                          DD     lab4.start.t4__body+000002DDH 
                                          DD     __lcl.00000382 
                                          DD     0000011A 
                                          DD     lab4.start.t4__body+000002F1H 
                                          DD     __lcl.00000382 
                                          DD     0000011B 
                                          DD     lab4.start.t4__body+0000030EH 
                                          DD     __lcl.00000382 
                                          DD     0000011C 
                                          DD     lab4.start.t4__body+00000335H 
                                          DD     __lcl.00000382 
                                          DD     0000011D 
                                          DD     lab4.start.t4__body+00000347H 
                                          DD     __lcl.00000382 
                                          DD     0000011E 
                                          DD     lab4.start.t4__body+00000357H 
                                          DD     __lcl.00000382 
                                          DD     0000011F 
                                          DD     lab4.start.t4__body+00000368H 
                                          DD     __lcl.00000382 
                                          DD     00000120 
                                          DD     lab4.start.t4__body+000003E8H 
                                          DD     __lcl.00000382 
                                          DD     00000121 
                                          DD     lab4.start.t4__body+000003FCH 
                                          DD     __lcl.00000382 
                                          DD     00000122 
                                          DD     lab4.start.t4__body+00000448H 
                                          DD     __lcl.00000382 
                                          DD     00000123 
                                          DD     lab4.start.t4__body+0000045CH 
                                          DD     __lcl.00000382 
                                          DD     00000125 
                                          DD     lab4.start.t4__body+00000470H 
                                          DD     __lcl.00000382 
                                          DD     00000127 
                                          DD     lab4.start.t4__body+00000486H 
                                          DD     __lcl.00000382 
                                          DD     00000128 
                                          DD     lab4.start.t4__body+0000049EH 
                                          DD     __lcl.00000382 
                                          DD     00000128 
                                          DD     lab4.start.t4__body+00000548H 
                                          DD     __lcl.00000382 
; ********* End of segment, Total Size = 412

                       ;                                
                       ;  Start of procedure lab4.start   
                       ;                                
                                          PUBLIC lab4.start 
                       lab4.start         PROC   NEAR   
;  Source Line # 111
  111| 000000 55                          PUSH   EBP    
  111| 000001 8BEC                        MOV    EBP, ESP 
  111| 000003 81EC                        SUB    ESP, 196 
  111| 000005 C4000000                                  
;  Source Line # 115
  115| 000009 C645                        MOV    BYTE PTR [EBP-4], 0 ;  T1__elab_bool
  115| 00000B FC                                        
  115| 00000C 00                                        
  115| 00000D 6A                          PUSH   0      
  115| 00000E 00                                        
  115| 00000F 8D85                        LEA    EAX, [EBP-196] ;  master_record
  115| 000011 3CFFFFFF                                  
  115| 000015 50                          PUSH   EAX    
  115| 000016 E8                          CALL   rts_init_master 
  115| 000017 00000000                                  
  115| 00001B 8D9D                        LEA    EBX, [EBP-140] ;  activation_list
  115| 00001D 74FFFFFF                                  
  115| 000021 53                          PUSH   EBX    
  115| 000022 E8                          CALL   rts_initialize_activation_list 
  115| 000023 00000000                                  
  115| 000027 68                          PUSH   __lcl.00000345 
  115| 000028 00000000                                  
  115| 00002C 6A                          PUSH   0      
  115| 00002D 00                                        
  115| 00002E 8D4D                        LEA    ECX, [EBP-4] ;  T1__elab_bool
  115| 000030 FC                                        
  115| 000031 51                          PUSH   ECX    
  115| 000032 6A                          PUSH   0      
  115| 000033 00                                        
  115| 000034 8D55                        LEA    EDX, [EBP-68] ;  T1
  115| 000036 BC                                        
  115| 000037 52                          PUSH   EDX    
  115| 000038 6A                          PUSH   0      
  115| 000039 00                                        
  115| 00003A 68                          PUSH   lab4.start.t1__body 
  115| 00003B 00000000                                  
  115| 00003F 8DB5                        LEA    ESI, [EBP-196] ;  master_record
  115| 000041 3CFFFFFF                                  
  115| 000045 56                          PUSH   ESI    
  115| 000046 8DBD                        LEA    EDI, [EBP-140] ;  activation_list
  115| 000048 74FFFFFF                                  
  115| 00004C 57                          PUSH   EDI    
  115| 00004D 6A                          PUSH   0      
  115| 00004E 00                                        
  115| 00004F E8                          CALL   rts_initialize_task_with_name 
  115| 000050 00000000                                  
;  Source Line # 116
  116| 000054 C645                        MOV    BYTE PTR [EBP-3], 0 ;  T2__elab_bool
  116| 000056 FD                                        
  116| 000057 00                                        
  116| 000058 68                          PUSH   __lcl.00000346 
  116| 000059 00000000                                  
  116| 00005D 6A                          PUSH   0      
  116| 00005E 00                                        
  116| 00005F 8D45                        LEA    EAX, [EBP-3] ;  T2__elab_bool
  116| 000061 FD                                        
  116| 000062 50                          PUSH   EAX    
  116| 000063 6A                          PUSH   0      
  116| 000064 00                                        
  116| 000065 8D5D                        LEA    EBX, [EBP-52] ;  T2
  116| 000067 CC                                        
  116| 000068 53                          PUSH   EBX    
  116| 000069 6A                          PUSH   0      
  116| 00006A 00                                        
  116| 00006B 68                          PUSH   lab4.start.t2__body 
  116| 00006C 00000000                                  
  116| 000070 8D8D                        LEA    ECX, [EBP-196] ;  master_record
  116| 000072 3CFFFFFF                                  
  116| 000076 51                          PUSH   ECX    
  116| 000077 8D95                        LEA    EDX, [EBP-140] ;  activation_list
  116| 000079 74FFFFFF                                  
  116| 00007D 52                          PUSH   EDX    
  116| 00007E 6A                          PUSH   0      
  116| 00007F 00                                        
  116| 000080 E8                          CALL   rts_initialize_task_with_name 
  116| 000081 00000000                                  
;  Source Line # 117
  117| 000085 C645                        MOV    BYTE PTR [EBP-2], 0 ;  T3__elab_bool
  117| 000087 FE                                        
  117| 000088 00                                        
  117| 000089 68                          PUSH   __lcl.00000347 
  117| 00008A 00000000                                  
  117| 00008E 6A                          PUSH   0      
  117| 00008F 00                                        
  117| 000090 8D75                        LEA    ESI, [EBP-2] ;  T3__elab_bool
  117| 000092 FE                                        
  117| 000093 56                          PUSH   ESI    
  117| 000094 6A                          PUSH   0      
  117| 000095 00                                        
  117| 000096 8D7D                        LEA    EDI, [EBP-36] ;  T3
  117| 000098 DC                                        
  117| 000099 57                          PUSH   EDI    
  117| 00009A 6A                          PUSH   0      
  117| 00009B 00                                        
  117| 00009C 68                          PUSH   lab4.start.t3__body 
  117| 00009D 00000000                                  
  117| 0000A1 8D85                        LEA    EAX, [EBP-196] ;  master_record
  117| 0000A3 3CFFFFFF                                  
  117| 0000A7 50                          PUSH   EAX    
  117| 0000A8 8D9D                        LEA    EBX, [EBP-140] ;  activation_list
  117| 0000AA 74FFFFFF                                  
  117| 0000AE 53                          PUSH   EBX    
  117| 0000AF 6A                          PUSH   0      
  117| 0000B0 00                                        
  117| 0000B1 E8                          CALL   rts_initialize_task_with_name 
  117| 0000B2 00000000                                  
;  Source Line # 118
  118| 0000B6 C645                        MOV    BYTE PTR [EBP-1], 0 ;  T4__elab_bool
  118| 0000B8 FF                                        
  118| 0000B9 00                                        
  118| 0000BA 68                          PUSH   __lcl.00000348 
  118| 0000BB 00000000                                  
  118| 0000BF 6A                          PUSH   0      
  118| 0000C0 00                                        
  118| 0000C1 8D4D                        LEA    ECX, [EBP-1] ;  T4__elab_bool
  118| 0000C3 FF                                        
  118| 0000C4 51                          PUSH   ECX    
  118| 0000C5 6A                          PUSH   0      
  118| 0000C6 00                                        
  118| 0000C7 8D55                        LEA    EDX, [EBP-20] ;  T4
  118| 0000C9 EC                                        
  118| 0000CA 52                          PUSH   EDX    
  118| 0000CB 6A                          PUSH   0      
  118| 0000CC 00                                        
  118| 0000CD 68                          PUSH   lab4.start.t4__body 
  118| 0000CE 00000000                                  
  118| 0000D2 8DB5                        LEA    ESI, [EBP-196] ;  master_record
  118| 0000D4 3CFFFFFF                                  
  118| 0000D8 56                          PUSH   ESI    
  118| 0000D9 8DBD                        LEA    EDI, [EBP-140] ;  activation_list
  118| 0000DB 74FFFFFF                                  
  118| 0000DF 57                          PUSH   EDI    
  118| 0000E0 6A                          PUSH   0      
  118| 0000E1 00                                        
  118| 0000E2 E8                          CALL   rts_initialize_task_with_name 
  118| 0000E3 00000000                                  
;  Source Line # 121
  121| 0000E7 C645                        MOV    BYTE PTR [EBP-4], 1 ;  T1__elab_bool
  121| 0000E9 FC                                        
  121| 0000EA 01                                        
;  Source Line # 173
  173| 0000EB C645                        MOV    BYTE PTR [EBP-3], 1 ;  T2__elab_bool
  173| 0000ED FD                                        
  173| 0000EE 01                                        
;  Source Line # 214
  214| 0000EF C645                        MOV    BYTE PTR [EBP-2], 1 ;  T3__elab_bool
  214| 0000F1 FE                                        
  214| 0000F2 01                                        
;  Source Line # 256
  256| 0000F3 C645                        MOV    BYTE PTR [EBP-1], 1 ;  T4__elab_bool
  256| 0000F5 FF                                        
  256| 0000F6 01                                        
;  Source Line # 298
  298| 0000F7 8D85                        LEA    EAX, [EBP-140] ;  activation_list
  298| 0000F9 74FFFFFF                                  
  298| 0000FD 50                          PUSH   EAX    
  298| 0000FE E8                          CALL   rts_activate_tasks 
  298| 0000FF 00000000                                  
  298| 000103 8D9D                        LEA    EBX, [EBP-196] ;  master_record
  298| 000105 3CFFFFFF                                  
  298| 000109 53                          PUSH   EBX    
  298| 00010A E8                          CALL   rts_finalize_and_pop 
  298| 00010B 00000000                                  
;  Source Line # 300
  300| 00010F 8BE5                        MOV    ESP, EBP 
  300| 000111 5D                          POP    EBP    
  300| 000112 C3                          RET           
                       ;                                
                       lab4.start         ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000367     DD     00000C01 
                                          DD     0000006F 
                                          DD     lab4.start 
                                          DD     __lcl.00000382 
                                          DD     00000073 
                                          DD     lab4.start+00000009H 
                                          DD     __lcl.00000382 
                                          DD     00000074 
                                          DD     lab4.start+00000054H 
                                          DD     __lcl.00000382 
                                          DD     00000075 
                                          DD     lab4.start+00000085H 
                                          DD     __lcl.00000382 
                                          DD     00000076 
                                          DD     lab4.start+000000B6H 
                                          DD     __lcl.00000382 
                                          DD     00000079 
                                          DD     lab4.start+000000E7H 
                                          DD     __lcl.00000382 
                                          DD     000000AD 
                                          DD     lab4.start+000000EBH 
                                          DD     __lcl.00000382 
                                          DD     000000D6 
                                          DD     lab4.start+000000EFH 
                                          DD     __lcl.00000382 
                                          DD     00000100 
                                          DD     lab4.start+000000F3H 
                                          DD     __lcl.00000382 
                                          DD     0000012A 
                                          DD     lab4.start+000000F7H 
                                          DD     __lcl.00000382 
                                          DD     0000012C 
                                          DD     lab4.start+0000010FH 
                                          DD     __lcl.00000382 
                                          DD     0000012C 
                                          DD     lab4.start+0000010FH 
                                          DD     __lcl.00000382 
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
   16| 000034 7D                          JGE    SHORT L30 
   16| 000035 03                                        
   16| 000036 33DB                        XOR    EBX, EBX 
   16| 000038 4B                          DEC    EBX    
   16|                 L30:                             
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
   16| 000050 8985                        MOV    [EBP-140], EAX ;  MA
   16| 000052 74FFFFFF                                  
   16| 000056 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
   16| 000058 00000000                                  
   16| 00005C 83E9                        SUB    ECX, 1 
   16| 00005E 01                                        
   16| 00005F 7D                          JGE    SHORT L31 
   16| 000060 03                                        
   16| 000061 33C9                        XOR    ECX, ECX 
   16| 000063 49                          DEC    ECX    
   16|                 L31:                             
   16| 000064 CE                          INTO          
   16| 000065 41                          INC    ECX    
   16| 000066 CE                          INTO          
   16| 000067 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
   16| 00006A 00000000                                  
   16| 00006E CE                          INTO          
   16| 00006F 51                          PUSH   ECX    
   16| 000070 E8                          CALL   rts_ss_allocate 
   16| 000071 00000000                                  
   16| 000075 8985                        MOV    [EBP-136], EAX ;  MC
   16| 000077 78FFFFFF                                  
   16| 00007B 8B35                        MOV    ESI, package1.matr__constrained_array____1 
   16| 00007D 00000000                                  
   16| 000081 83EE                        SUB    ESI, 1 
   16| 000083 01                                        
   16| 000084 7D                          JGE    SHORT L32 
   16| 000085 03                                        
   16| 000086 33F6                        XOR    ESI, ESI 
   16| 000088 4E                          DEC    ESI    
   16|                 L32:                             
   16| 000089 CE                          INTO          
   16| 00008A 46                          INC    ESI    
   16| 00008B CE                          INTO          
   16| 00008C 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
   16| 00008F 00000000                                  
   16| 000093 CE                          INTO          
   16| 000094 56                          PUSH   ESI    
   16| 000095 E8                          CALL   rts_ss_allocate 
   16| 000096 00000000                                  
   16| 00009A 8985                        MOV    [EBP-132], EAX ;  MK
   16| 00009C 7CFFFFFF                                  
;  Source Line # 26
   26| 0000A0 C645                        MOV    BYTE PTR [EBP-8], 0 ;  MON__elab_bool
   26| 0000A2 F8                                        
   26| 0000A3 00                                        
   26| 0000A4 6A                          PUSH   0      
   26| 0000A5 00                                        
   26| 0000A6 8D7D                        LEA    EDI, [EBP-104] ;  master_record
   26| 0000A8 98                                        
   26| 0000A9 57                          PUSH   EDI    
   26| 0000AA E8                          CALL   rts_init_master 
   26| 0000AB 00000000                                  
   26| 0000AF 8B15                        MOV    EDX, package1.matr__constrained_array____1 
   26| 0000B1 00000000                                  
   26| 0000B5 83EA                        SUB    EDX, 1 
   26| 0000B7 01                                        
   26| 0000B8 7D                          JGE    SHORT L33 
   26| 0000B9 03                                        
   26| 0000BA 33D2                        XOR    EDX, EDX 
   26| 0000BC 4A                          DEC    EDX    
   26|                 L33:                             
   26| 0000BD CE                          INTO          
   26| 0000BE 42                          INC    EDX    
   26| 0000BF CE                          INTO          
   26| 0000C0 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
   26| 0000C3 00000000                                  
   26| 0000C7 CE                          INTO          
   26| 0000C8 83C2                        ADD    EDX, 88 
   26| 0000CA 58                                        
   26| 0000CB 8955                        MOV    [EBP-48], EDX ;  dyn_temp
   26| 0000CD D0                                        
   26| 0000CE 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
   26| 0000D0 00000000                                  
   26| 0000D4 83EB                        SUB    EBX, 1 
   26| 0000D6 01                                        
   26| 0000D7 7D                          JGE    SHORT L34 
   26| 0000D8 03                                        
   26| 0000D9 33DB                        XOR    EBX, EBX 
   26| 0000DB 4B                          DEC    EBX    
   26|                 L34:                             
   26| 0000DC CE                          INTO          
   26| 0000DD 43                          INC    EBX    
   26| 0000DE CE                          INTO          
   26| 0000DF 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   26| 0000E2 00000000                                  
   26| 0000E6 CE                          INTO          
   26| 0000E7 83C3                        ADD    EBX, 7 
   26| 0000E9 07                                        
   26| 0000EA CE                          INTO          
   26| 0000EB 83E3                        AND    EBX, -8 
   26| 0000ED F8                                        
   26| 0000EE 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
   26| 0000F0 00000000                                  
   26| 0000F4 83E9                        SUB    ECX, 1 
   26| 0000F6 01                                        
   26| 0000F7 7D                          JGE    SHORT L35 
   26| 0000F8 03                                        
   26| 0000F9 33C9                        XOR    ECX, ECX 
   26| 0000FB 49                          DEC    ECX    
   26|                 L35:                             
   26| 0000FC CE                          INTO          
   26| 0000FD 41                          INC    ECX    
   26| 0000FE CE                          INTO          
   26| 0000FF 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
   26| 000102 00000000                                  
   26| 000106 CE                          INTO          
   26| 000107 83C1                        ADD    ECX, 7 
   26| 000109 07                                        
   26| 00010A CE                          INTO          
   26| 00010B 83E1                        AND    ECX, -8 
   26| 00010D F8                                        
   26| 00010E 03D9                        ADD    EBX, ECX 
   26| 000110 CE                          INTO          
   26| 000111 83C3                        ADD    EBX, 88 
   26| 000113 58                                        
   26| 000114 CE                          INTO          
   26| 000115 53                          PUSH   EBX    
   26| 000116 E8                          CALL   rts_ss_allocate 
   26| 000117 00000000                                  
   26| 00011B 8945                        MOV    [EBP-44], EAX ;  MON
   26| 00011D D4                                        
   26| 00011E 8B75                        MOV    ESI, [EBP-44] ;  MON
   26| 000120 D4                                        
   26| 000121 C746                        MOV    DWORD PTR [ESI+68], 0 
   26| 000123 44                                        
   26| 000124 00000000                                  
   26| 000128 8B7D                        MOV    EDI, [EBP-44] ;  MON
   26| 00012A D4                                        
   26| 00012B C747                        MOV    DWORD PTR [EDI+72], 0 
   26| 00012D 48                                        
   26| 00012E 00000000                                  
   26| 000132 8B55                        MOV    EDX, [EBP-44] ;  MON
   26| 000134 D4                                        
   26| 000135 8B4D                        MOV    ECX, [EBP-48] ;  dyn_temp
   26| 000137 D0                                        
   26| 000138 894A                        MOV    [EDX+76], ECX 
   26| 00013A 4C                                        
   26| 00013B 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
   26| 00013D 00000000                                  
   26| 000141 83EB                        SUB    EBX, 1 
   26| 000143 01                                        
   26| 000144 7D                          JGE    SHORT L36 
   26| 000145 03                                        
   26| 000146 33DB                        XOR    EBX, EBX 
   26| 000148 4B                          DEC    EBX    
   26|                 L36:                             
   26| 000149 CE                          INTO          
   26| 00014A 43                          INC    EBX    
   26| 00014B CE                          INTO          
   26| 00014C 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   26| 00014F 00000000                                  
   26| 000153 CE                          INTO          
   26| 000154 035D                        ADD    EBX, [EBP-48] ;  dyn_temp
   26| 000156 D0                                        
   26| 000157 895D                        MOV    [EBP-48], EBX ;  dyn_temp
   26| 000159 D0                                        
   26| 00015A 6A                          PUSH   0      
   26| 00015B 00                                        
   26| 00015C 68                          PUSH   lab4.mon__protected_type_desc 
   26| 00015D 00000000                                  
   26| 000161 6A                          PUSH   30     
   26| 000162 1E                                        
   26| 000163 8B45                        MOV    EAX, [EBP-44] ;  MON
   26| 000165 D4                                        
   26| 000166 50                          PUSH   EAX    
   26| 000167 8D75                        LEA    ESI, [EBP-40] ;  cleanup
   26| 000169 D8                                        
   26| 00016A 56                          PUSH   ESI    
   26| 00016B 8D7D                        LEA    EDI, [EBP-104] ;  master_record
   26| 00016D 98                                        
   26| 00016E 57                          PUSH   EDI    
   26| 00016F E8                          CALL   rts_init_po 
   26| 000170 00000000                                  
;  Source Line # 55
   55| 000174 C645                        MOV    BYTE PTR [EBP-8], 1 ;  MON__elab_bool
   55| 000176 F8                                        
   55| 000177 01                                        
;  Source Line # 304
  304| 000178 68                          PUSH   __lcl.00000354 
  304| 000179 00000000                                  
  304| 00017D 68                          PUSH   __lcl.00000353 
  304| 00017E 00000000                                  
  304| 000182 E8                          CALL   ada.text_io.put_line__2 
  304| 000183 00000000                                  
;  Source Line # 305
  305| 000187 0FB615                      MOVZX  EDX, BYTE PTR ada.integer_text_io.default_base
  305| 00018A 00000000                                  
  305| 00018E 52                          PUSH   EDX    
  305| 00018F FF35                        PUSH   DWORD PTR ada.integer_text_io.default_width 
  305| 000191 00000000                                  
  305| 000195 FF35                        PUSH   DWORD PTR package1.n 
  305| 000197 00000000                                  
  305| 00019B E8                          CALL   ada.integer_text_io.put__2 
  305| 00019C 00000000                                  
;  Source Line # 307
  307| 0001A0 8D4D                        LEA    ECX, [EBP-124] ;  time1
  307| 0001A2 84                                        
  307| 0001A3 51                          PUSH   ECX    
  307| 0001A4 E8                          CALL   ada.calendar.clock 
  307| 0001A5 00000000                                  
;  Source Line # 308
  308| 0001A9 E8                          CALL   lab4.start 
  308| 0001AA 00000000                                  
  308| 0001AE 8D5D                        LEA    EBX, [EBP-104] ;  master_record
  308| 0001B0 98                                        
  308| 0001B1 53                          PUSH   EBX    
  308| 0001B2 E8                          CALL   rts_finalize_and_pop 
  308| 0001B3 00000000                                  
  308| 0001B7 8DB5                        LEA    ESI, [EBP-144] ;  dyn_temp
  308| 0001B9 70FFFFFF                                  
  308| 0001BD 56                          PUSH   ESI    
  308| 0001BE E8                          CALL   rts_ss_release 
  308| 0001BF 00000000                                  
;  Source Line # 309
  309| 0001C3 8B95                        MOV    EDX, [EBP-156] ; Spill
  309| 0001C5 64FFFFFF                                  
  309| 0001C9 8B4D                        MOV    ECX, [EBP-4] 
  309| 0001CB FC                                        
  309| 0001CC 894A                        MOV    [EDX+48], ECX 
  309| 0001CE 30                                        
  309| 0001CF 8BE5                        MOV    ESP, EBP 
  309| 0001D1 5D                          POP    EBP    
  309| 0001D2 C3                          RET           
                       ;                                
                       lab4               ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000366     DD     00000A01 
                                          DD     0000000F 
                                          DD     lab4   
                                          DD     __lcl.00000382 
                                          DD     00000010 
                                          DD     lab4+00000023H 
                                          DD     __lcl.00000382 
                                          DD     0000001A 
                                          DD     lab4+000000A0H 
                                          DD     __lcl.00000382 
                                          DD     00000037 
                                          DD     lab4+00000174H 
                                          DD     __lcl.00000382 
                                          DD     00000130 
                                          DD     lab4+00000178H 
                                          DD     __lcl.00000382 
                                          DD     00000131 
                                          DD     lab4+00000187H 
                                          DD     __lcl.00000382 
                                          DD     00000133 
                                          DD     lab4+000001A0H 
                                          DD     __lcl.00000382 
                                          DD     00000134 
                                          DD     lab4+000001A9H 
                                          DD     __lcl.00000382 
                                          DD     00000135 
                                          DD     lab4+000001C3H 
                                          DD     __lcl.00000382 
                                          DD     00000135 
                                          DD     lab4+000001CFH 
                                          DD     __lcl.00000382 
; ********* End of segment, Total Size = 124


; ************* Initialized part of the global segment :
                                          ALIGN 4       
     000000            __lcl.00000354     DD     00000001 
                                          DD     00000005 
     000008            __lcl.00000353     DB     'N == ' 
     00000D            __lcl.00000348     DB     'Lab4.START.T4' 
                                          DB     00H    
     00001B            __lcl.00000347     DB     'Lab4.START.T3' 
                                          DB     00H    
     000029            __lcl.00000346     DB     'Lab4.START.T2' 
                                          DB     00H    
     000037            __lcl.00000345     DB     'Lab4.START.T1' 
                                          DB     00H    
                                          DB     00H,00H,00H 
     000048            __lcl.00000338     DD     00000001 
                                          DD     00000007 
     000050            __lcl.00000337     DB     'T4 stop' 
                                          DB     00     
     000058            __lcl.00000302     DD     00000001 
                                          DD     00000008 
     000060            __lcl.00000301     DB     'T4 start' 
     000068            __lcl.00000294     DD     00000001 
                                          DD     00000007 
     000070            __lcl.00000293     DB     'T3 stop' 
                                          DB     00     
     000078            __lcl.00000258     DD     00000001 
                                          DD     00000008 
     000080            __lcl.00000257     DB     'T3 start' 
     000088            __lcl.00000250     DD     00000001 
                                          DD     00000007 
     000090            __lcl.00000249     DB     'T2 stop' 
                                          DB     00     
     000098            __lcl.00000214     DD     00000001 
                                          DD     00000008 
     0000A0            __lcl.00000213     DB     'T2 start' 
     0000A8            __lcl.00000205     DD     00000001 
                                          DD     00000007 
     0000B0            __lcl.00000204     DB     'T1 stop' 
                                          DB     00     
     0000B8            __lcl.00000168     DD     00000001 
                                          DD     00000008 
     0000C0            __lcl.00000167     DB     'T1 start' 
     0000C8            lab4.mon__protected_type_desc DB 01 
                                          DB     3 DUP(00) 
                                          DD     00000001 
                                          DD     00000000 
                                          DB     01     
                                          DB     3 DUP(00) 
                                          DD     00000018 
                                          DD     lab4.mon__all_barriers 
                                          DD     lab4.mon.inputed 
                                          DD     lab4.mon.finish 
; ********* End of segment, Total Size = 232


; ************* .av_dbgr segment :
                                          ALIGN 4       
                                          DD     00000000 
                                          DD     00000000 
     000008            lab4__rootpart____1 DD    lab4__subp_body_subpdesc____1 
; ********* End of segment, Total Size = 16


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000365     DB     04H    
                                          DB     'Lab4' 
                                          DB     00H,00H,00H 
     000008            lab4__subp_body_subpdesc____1 DD __lcl.00000365 
                                          DD     00000001 
                                          DD     __lcl.00000128 
                                          DD     0000000F 
                                          DD     0000012F 
                                          DD     00000135 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000355 
                                          DD     __lcl.00000356 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000357 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000366 
                                          DD     0000009C 
                                          DD     __lcl.00000001 
     00006C            __lcl.00000364     DB     02H    
                                          DB     'MA'   
                                          DB     00     
     000070            __lcl.00000363     DB     02H    
                                          DB     'MC'   
                                          DB     00     
     000074            __lcl.00000362     DB     02H    
                                          DB     'MK'   
                                          DB     00     
     000078            __lcl.00000361     DB     08H    
                                          DB     'Time_all' 
                                          DB     00H,00H,00H 
     000084            __lcl.00000360     DB     05H    
                                          DB     'time1' 
                                          DW     0000   
     00008C            __lcl.00000359     DB     05H    
                                          DB     'time2' 
                                          DW     0000   
     000094            __lcl.00000358     DB     01H    
                                          DB     'A'    
                                          DW     0000   
     000098            __lcl.00000357     DD     00000008 
                                          DD     __lcl.00000063 
                                          DD     __lcl.00000062 
                                          DD     FFFFFFD4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000358 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF94 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000359 
                                          DD     __lcl.00000033 
                                          DD     FFFFFF8C 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000360 
                                          DD     __lcl.00000033 
                                          DD     FFFFFF84 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000361 
                                          DD     __lcl.00000024 
                                          DD     FFFFFF80 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000362 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF7C 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000363 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF78 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000364 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF74 
                                          DD     00000103 
                                          DD     00000000 
     00013C            __lcl.00000356     DD     00000002 
                                          DD     lab4.mon__protected_body_subpdesc____1 
                                          DD     lab4.start__subp_body_subpdesc____1 
     000148            __lcl.00000355     DD     00000001 
                                          DD     __lcl.00000063 
                                          DD     __lcl.00000062 
     000154            __lcl.00000352     DB     05H    
                                          DB     'START' 
                                          DW     0000   
     00015C            lab4.start__subp_body_subpdesc____1 DD __lcl.00000352 
                                          DD     0000000D 
                                          DD     __lcl.00000128 
                                          DD     0000006F 
                                          DD     0000012A 
                                          DD     0000012C 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000349 
                                          DD     __lcl.00000350 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000351 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000367 
                                          DD     000000C4 
                                          DD     __lcl.00000001 
     0001C0            __lcl.00000351     DD     00000004 
                                          DD     __lcl.00000166 
                                          DD     __lcl.00000165 
                                          DD     FFFFFFEC 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000164 
                                          DD     __lcl.00000163 
                                          DD     FFFFFFDC 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000162 
                                          DD     __lcl.00000161 
                                          DD     FFFFFFCC 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000160 
                                          DD     __lcl.00000159 
                                          DD     FFFFFFBC 
                                          DD     00000003 
                                          DD     00000000 
     000214            __lcl.00000350     DD     00000004 
                                          DD     lab4.start.t1__task_subpdesc____1 
                                          DD     lab4.start.t2__task_subpdesc____1 
                                          DD     lab4.start.t3__task_subpdesc____1 
                                          DD     lab4.start.t4__task_subpdesc____1 
     000228            __lcl.00000349     DD     00000004 
                                          DD     __lcl.00000166 
                                          DD     __lcl.00000165 
                                          DD     __lcl.00000164 
                                          DD     __lcl.00000163 
                                          DD     __lcl.00000162 
                                          DD     __lcl.00000161 
                                          DD     __lcl.00000160 
                                          DD     __lcl.00000159 
     00024C            lab4.start.t4__task_subpdesc____1 DD __lcl.00000166 
                                          DD     00000011 
                                          DD     __lcl.00000128 
                                          DD     00000100 
                                          DD     00000104 
                                          DD     00000128 
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
                                          DD     __lcl.00000339 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000344 
                                          DD     __lcl.00000165 
                                          DD     00000000 
                                          DD     __lcl.00000368 
                                          DD     0000006C 
                                          DD     __lcl.00000001 
     0002B0            __lcl.00000344     DD     00000002 
                                          DD     __lcl.00000319 
                                          DD     __lcl.00000336 
     0002BC            __lcl.00000343     DB     03H    
                                          DB     'MB4'  
     0002C0            __lcl.00000342     DB     03H    
                                          DB     'MZ4'  
     0002C4            __lcl.00000341     DB     03H    
                                          DB     'MT4'  
     0002C8            __lcl.00000340     DB     05H    
                                          DB     'alfa4' 
                                          DW     0000   
     0002D0            __lcl.00000339     DD     00000005 
                                          DD     __lcl.00000340 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFB0 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000341 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFAC 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000342 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFA8 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000343 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFA4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000211 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF9C 
                                          DD     00000003 
                                          DD     00000000 
     000338            __lcl.00000336     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     0000011B 
                                          DD     0000011B 
                                          DD     00000123 
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
                                          DD     __lcl.00000334 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000335 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00039C            __lcl.00000335     DD     00000001 
                                          DD     __lcl.00000333 
     0003A4            __lcl.00000334     DD     00000001 
                                          DD     __lcl.00000139 
                                          DD     __lcl.00000322 
                                          DD     FFFFFFE8 
                                          DD     00000003 
                                          DD     00000001 
     0003BC            __lcl.00000333     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     0000011C 
                                          DD     0000011C 
                                          DD     00000122 
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
                                          DD     __lcl.00000331 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000332 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000420            __lcl.00000332     DD     00000001 
                                          DD     __lcl.00000330 
     000428            __lcl.00000331     DD     00000001 
                                          DD     __lcl.00000136 
                                          DD     __lcl.00000325 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     000440            __lcl.00000330     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     0000011E 
                                          DD     0000011E 
                                          DD     00000120 
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
                                          DD     __lcl.00000329 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0004A4            __lcl.00000329     DD     00000001 
                                          DD     __lcl.00000179 
                                          DD     __lcl.00000328 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0004BC            __lcl.00000328     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000326 
                                          DD     __lcl.00000327 
     0004D8            __lcl.00000327     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     0004E4            __lcl.00000326     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0004F0            __lcl.00000325     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000323 
                                          DD     __lcl.00000324 
     00050C            __lcl.00000324     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     000518            __lcl.00000323     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     000524            __lcl.00000322     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000320 
                                          DD     __lcl.00000321 
     000540            __lcl.00000321     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE4 
     00054C            __lcl.00000320     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000558            __lcl.00000319     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     00000112 
                                          DD     00000112 
                                          DD     0000011A 
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
                                          DD     __lcl.00000317 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000318 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0005BC            __lcl.00000318     DD     00000001 
                                          DD     __lcl.00000316 
     0005C4            __lcl.00000317     DD     00000001 
                                          DD     __lcl.00000139 
                                          DD     __lcl.00000305 
                                          DD     FFFFFFCC 
                                          DD     00000003 
                                          DD     00000001 
     0005DC            __lcl.00000316     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     00000113 
                                          DD     00000113 
                                          DD     00000119 
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
                                          DD     __lcl.00000314 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000315 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000640            __lcl.00000315     DD     00000001 
                                          DD     __lcl.00000313 
     000648            __lcl.00000314     DD     00000001 
                                          DD     __lcl.00000136 
                                          DD     __lcl.00000308 
                                          DD     FFFFFFD8 
                                          DD     00000003 
                                          DD     00000001 
     000660            __lcl.00000313     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     00000115 
                                          DD     00000115 
                                          DD     00000117 
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
                                          DD     __lcl.00000312 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0006C4            __lcl.00000312     DD     00000001 
                                          DD     __lcl.00000179 
                                          DD     __lcl.00000311 
                                          DD     FFFFFFE0 
                                          DD     00000003 
                                          DD     00000001 
     0006DC            __lcl.00000311     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000309 
                                          DD     __lcl.00000310 
     0006F8            __lcl.00000310     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFDC 
     000704            __lcl.00000309     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000710            __lcl.00000308     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000306 
                                          DD     __lcl.00000307 
     00072C            __lcl.00000307     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD4 
     000738            __lcl.00000306     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD0 
     000744            __lcl.00000305     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000303 
                                          DD     __lcl.00000304 
     000760            __lcl.00000304     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFC8 
     00076C            __lcl.00000303     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000778            lab4.start.t3__task_subpdesc____1 DD __lcl.00000164 
                                          DD     00000010 
                                          DD     __lcl.00000128 
                                          DD     000000D6 
                                          DD     000000DA 
                                          DD     000000FD 
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
                                          DD     __lcl.00000295 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000300 
                                          DD     __lcl.00000163 
                                          DD     00000000 
                                          DD     __lcl.00000369 
                                          DD     0000006C 
                                          DD     __lcl.00000001 
     0007DC            __lcl.00000300     DD     00000002 
                                          DD     __lcl.00000275 
                                          DD     __lcl.00000292 
     0007E8            __lcl.00000299     DB     03H    
                                          DB     'MB3'  
     0007EC            __lcl.00000298     DB     03H    
                                          DB     'MZ3'  
     0007F0            __lcl.00000297     DB     03H    
                                          DB     'MT3'  
     0007F4            __lcl.00000296     DB     05H    
                                          DB     'alfa3' 
                                          DW     0000   
     0007FC            __lcl.00000295     DD     00000005 
                                          DD     __lcl.00000296 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFB0 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000297 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFAC 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000298 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFA8 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000299 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFA4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000211 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF9C 
                                          DD     00000003 
                                          DD     00000000 
     000864            __lcl.00000292     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     000000F0 
                                          DD     000000F0 
                                          DD     000000F8 
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
                                          DD     __lcl.00000290 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000291 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0008C8            __lcl.00000291     DD     00000001 
                                          DD     __lcl.00000289 
     0008D0            __lcl.00000290     DD     00000001 
                                          DD     __lcl.00000139 
                                          DD     __lcl.00000278 
                                          DD     FFFFFFE8 
                                          DD     00000003 
                                          DD     00000001 
     0008E8            __lcl.00000289     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     000000F1 
                                          DD     000000F1 
                                          DD     000000F7 
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
                                          DD     __lcl.00000287 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000288 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00094C            __lcl.00000288     DD     00000001 
                                          DD     __lcl.00000286 
     000954            __lcl.00000287     DD     00000001 
                                          DD     __lcl.00000136 
                                          DD     __lcl.00000281 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     00096C            __lcl.00000286     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     000000F3 
                                          DD     000000F3 
                                          DD     000000F5 
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
                                          DD     __lcl.00000285 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0009D0            __lcl.00000285     DD     00000001 
                                          DD     __lcl.00000179 
                                          DD     __lcl.00000284 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0009E8            __lcl.00000284     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000282 
                                          DD     __lcl.00000283 
     000A04            __lcl.00000283     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000A10            __lcl.00000282     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000A1C            __lcl.00000281     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000279 
                                          DD     __lcl.00000280 
     000A38            __lcl.00000280     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     000A44            __lcl.00000279     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     000A50            __lcl.00000278     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000276 
                                          DD     __lcl.00000277 
     000A6C            __lcl.00000277     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE4 
     000A78            __lcl.00000276     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000A84            __lcl.00000275     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     000000E7 
                                          DD     000000E7 
                                          DD     000000EF 
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
                                          DD     __lcl.00000273 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000274 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000AE8            __lcl.00000274     DD     00000001 
                                          DD     __lcl.00000272 
     000AF0            __lcl.00000273     DD     00000001 
                                          DD     __lcl.00000139 
                                          DD     __lcl.00000261 
                                          DD     FFFFFFCC 
                                          DD     00000003 
                                          DD     00000001 
     000B08            __lcl.00000272     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     000000E8 
                                          DD     000000E8 
                                          DD     000000EE 
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
                                          DD     __lcl.00000270 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000271 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000B6C            __lcl.00000271     DD     00000001 
                                          DD     __lcl.00000269 
     000B74            __lcl.00000270     DD     00000001 
                                          DD     __lcl.00000136 
                                          DD     __lcl.00000264 
                                          DD     FFFFFFD8 
                                          DD     00000003 
                                          DD     00000001 
     000B8C            __lcl.00000269     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     000000EA 
                                          DD     000000EA 
                                          DD     000000EC 
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
                                          DD     __lcl.00000268 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000BF0            __lcl.00000268     DD     00000001 
                                          DD     __lcl.00000179 
                                          DD     __lcl.00000267 
                                          DD     FFFFFFE0 
                                          DD     00000003 
                                          DD     00000001 
     000C08            __lcl.00000267     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000265 
                                          DD     __lcl.00000266 
     000C24            __lcl.00000266     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFDC 
     000C30            __lcl.00000265     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000C3C            __lcl.00000264     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000262 
                                          DD     __lcl.00000263 
     000C58            __lcl.00000263     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD4 
     000C64            __lcl.00000262     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD0 
     000C70            __lcl.00000261     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000259 
                                          DD     __lcl.00000260 
     000C8C            __lcl.00000260     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFC8 
     000C98            __lcl.00000259     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000CA4            lab4.start.t2__task_subpdesc____1 DD __lcl.00000162 
                                          DD     0000000F 
                                          DD     __lcl.00000128 
                                          DD     000000AD 
                                          DD     000000B1 
                                          DD     000000D3 
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
                                          DD     __lcl.00000251 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000256 
                                          DD     __lcl.00000161 
                                          DD     00000000 
                                          DD     __lcl.00000370 
                                          DD     00000068 
                                          DD     __lcl.00000001 
     000D08            __lcl.00000256     DD     00000002 
                                          DD     __lcl.00000231 
                                          DD     __lcl.00000248 
     000D14            __lcl.00000255     DB     03H    
                                          DB     'MB2'  
     000D18            __lcl.00000254     DB     03H    
                                          DB     'MZ2'  
     000D1C            __lcl.00000253     DB     03H    
                                          DB     'MT2'  
     000D20            __lcl.00000252     DB     05H    
                                          DB     'alfa2' 
                                          DW     0000   
     000D28            __lcl.00000251     DD     00000005 
                                          DD     __lcl.00000252 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFB4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000253 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFB0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000254 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFAC 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000255 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFA8 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000211 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFA0 
                                          DD     00000003 
                                          DD     00000000 
     000D90            __lcl.00000248     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     000000C6 
                                          DD     000000C6 
                                          DD     000000CE 
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
                                          DD     __lcl.00000246 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000247 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000DF4            __lcl.00000247     DD     00000001 
                                          DD     __lcl.00000245 
     000DFC            __lcl.00000246     DD     00000001 
                                          DD     __lcl.00000139 
                                          DD     __lcl.00000234 
                                          DD     FFFFFFE8 
                                          DD     00000003 
                                          DD     00000001 
     000E14            __lcl.00000245     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     000000C7 
                                          DD     000000C7 
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
                                          DD     __lcl.00000243 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000244 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000E78            __lcl.00000244     DD     00000001 
                                          DD     __lcl.00000242 
     000E80            __lcl.00000243     DD     00000001 
                                          DD     __lcl.00000136 
                                          DD     __lcl.00000237 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     000E98            __lcl.00000242     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     000000C9 
                                          DD     000000C9 
                                          DD     000000CB 
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
                                          DD     __lcl.00000241 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000EFC            __lcl.00000241     DD     00000001 
                                          DD     __lcl.00000179 
                                          DD     __lcl.00000240 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000F14            __lcl.00000240     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000238 
                                          DD     __lcl.00000239 
     000F30            __lcl.00000239     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000F3C            __lcl.00000238     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000F48            __lcl.00000237     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000235 
                                          DD     __lcl.00000236 
     000F64            __lcl.00000236     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     000F70            __lcl.00000235     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     000F7C            __lcl.00000234     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000232 
                                          DD     __lcl.00000233 
     000F98            __lcl.00000233     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE4 
     000FA4            __lcl.00000232     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000FB0            __lcl.00000231     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     000000BD 
                                          DD     000000BD 
                                          DD     000000C5 
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
                                          DD     __lcl.00000229 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000230 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001014            __lcl.00000230     DD     00000001 
                                          DD     __lcl.00000228 
     00101C            __lcl.00000229     DD     00000001 
                                          DD     __lcl.00000139 
                                          DD     __lcl.00000217 
                                          DD     FFFFFFCC 
                                          DD     00000003 
                                          DD     00000001 
     001034            __lcl.00000228     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     000000BE 
                                          DD     000000BE 
                                          DD     000000C4 
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
                                          DD     __lcl.00000226 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000227 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001098            __lcl.00000227     DD     00000001 
                                          DD     __lcl.00000225 
     0010A0            __lcl.00000226     DD     00000001 
                                          DD     __lcl.00000136 
                                          DD     __lcl.00000220 
                                          DD     FFFFFFD8 
                                          DD     00000003 
                                          DD     00000001 
     0010B8            __lcl.00000225     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     000000C0 
                                          DD     000000C0 
                                          DD     000000C2 
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
                                          DD     __lcl.00000224 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00111C            __lcl.00000224     DD     00000001 
                                          DD     __lcl.00000179 
                                          DD     __lcl.00000223 
                                          DD     FFFFFFE0 
                                          DD     00000003 
                                          DD     00000001 
     001134            __lcl.00000223     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000221 
                                          DD     __lcl.00000222 
     001150            __lcl.00000222     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFDC 
     00115C            __lcl.00000221     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001168            __lcl.00000220     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000218 
                                          DD     __lcl.00000219 
     001184            __lcl.00000219     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD4 
     001190            __lcl.00000218     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD0 
     00119C            __lcl.00000217     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000215 
                                          DD     __lcl.00000216 
     0011B8            __lcl.00000216     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFC8 
     0011C4            __lcl.00000215     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0011D0            lab4.start.t1__task_subpdesc____1 DD __lcl.00000160 
                                          DD     0000000E 
                                          DD     __lcl.00000128 
                                          DD     00000079 
                                          DD     0000007D 
                                          DD     000000AA 
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
                                          DD     __lcl.00000206 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000159 
                                          DD     00000000 
                                          DD     __lcl.00000371 
                                          DD     0000006C 
                                          DD     __lcl.00000001 
     001234            __lcl.00000212     DD     00000002 
                                          DD     __lcl.00000186 
                                          DD     __lcl.00000203 
     001240            __lcl.00000211     DB     04H    
                                          DB     'Sum1' 
                                          DB     00H,00H,00H 
     001248            __lcl.00000210     DB     03H    
                                          DB     'MB1'  
     00124C            __lcl.00000209     DB     03H    
                                          DB     'MZ1'  
     001250            __lcl.00000208     DB     03H    
                                          DB     'MT1'  
     001254            __lcl.00000207     DB     05H    
                                          DB     'alfa1' 
                                          DW     0000   
     00125C            __lcl.00000206     DD     00000005 
                                          DD     __lcl.00000207 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFB0 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000208 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFAC 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000209 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFA8 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000210 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFA4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000211 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF9C 
                                          DD     00000003 
                                          DD     00000000 
     0012C4            __lcl.00000203     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     00000095 
                                          DD     00000095 
                                          DD     0000009D 
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
                                          DD     __lcl.00000201 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000202 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001328            __lcl.00000202     DD     00000001 
                                          DD     __lcl.00000200 
     001330            __lcl.00000201     DD     00000001 
                                          DD     __lcl.00000139 
                                          DD     __lcl.00000189 
                                          DD     FFFFFFE4 
                                          DD     00000003 
                                          DD     00000001 
     001348            __lcl.00000200     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     00000096 
                                          DD     00000096 
                                          DD     0000009C 
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
                                          DD     __lcl.00000198 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000199 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0013AC            __lcl.00000199     DD     00000001 
                                          DD     __lcl.00000197 
     0013B4            __lcl.00000198     DD     00000001 
                                          DD     __lcl.00000136 
                                          DD     __lcl.00000192 
                                          DD     FFFFFFEC 
                                          DD     00000003 
                                          DD     00000001 
     0013CC            __lcl.00000197     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     00000098 
                                          DD     00000098 
                                          DD     0000009A 
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
                                          DD     __lcl.00000196 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001430            __lcl.00000196     DD     00000001 
                                          DD     __lcl.00000179 
                                          DD     __lcl.00000195 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     001448            __lcl.00000195     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000193 
                                          DD     __lcl.00000194 
     001464            __lcl.00000194     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     001470            __lcl.00000193     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00147C            __lcl.00000192     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000190 
                                          DD     __lcl.00000191 
     001498            __lcl.00000191     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE8 
     0014A4            __lcl.00000190     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0014B0            __lcl.00000189     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000187 
                                          DD     __lcl.00000188 
     0014CC            __lcl.00000188     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE0 
     0014D8            __lcl.00000187     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0014E4            __lcl.00000186     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     0000008C 
                                          DD     0000008C 
                                          DD     00000094 
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
                                          DD     __lcl.00000184 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000185 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001548            __lcl.00000185     DD     00000001 
                                          DD     __lcl.00000183 
     001550            __lcl.00000184     DD     00000001 
                                          DD     __lcl.00000139 
                                          DD     __lcl.00000171 
                                          DD     FFFFFFCC 
                                          DD     00000003 
                                          DD     00000001 
     001568            __lcl.00000183     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     0000008D 
                                          DD     0000008D 
                                          DD     00000093 
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
                                          DD     __lcl.00000181 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000182 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0015CC            __lcl.00000182     DD     00000001 
                                          DD     __lcl.00000180 
     0015D4            __lcl.00000181     DD     00000001 
                                          DD     __lcl.00000136 
                                          DD     __lcl.00000174 
                                          DD     FFFFFFD4 
                                          DD     00000003 
                                          DD     00000001 
     0015EC            __lcl.00000180     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     0000008F 
                                          DD     0000008F 
                                          DD     00000091 
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
                                          DD     __lcl.00000178 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001650            __lcl.00000179     DB     01H    
                                          DB     'z'    
                                          DW     0000   
     001654            __lcl.00000178     DD     00000001 
                                          DD     __lcl.00000179 
                                          DD     __lcl.00000177 
                                          DD     FFFFFFDC 
                                          DD     00000003 
                                          DD     00000001 
     00166C            __lcl.00000177     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000175 
                                          DD     __lcl.00000176 
     001688            __lcl.00000176     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD8 
     001694            __lcl.00000175     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0016A0            __lcl.00000174     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000172 
                                          DD     __lcl.00000173 
     0016BC            __lcl.00000173     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD0 
     0016C8            __lcl.00000172     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0016D4            __lcl.00000171     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000169 
                                          DD     __lcl.00000170 
     0016F0            __lcl.00000170     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFC8 
     0016FC            __lcl.00000169     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001708            __lcl.00000166     DB     02H    
                                          DB     'T4'   
                                          DB     00     
     00170C            __lcl.00000165     DD     __lcl.00000166 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     00171C            __lcl.00000164     DB     02H    
                                          DB     'T3'   
                                          DB     00     
     001720            __lcl.00000163     DD     __lcl.00000164 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     001730            __lcl.00000162     DB     02H    
                                          DB     'T2'   
                                          DB     00     
     001734            __lcl.00000161     DD     __lcl.00000162 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     001744            __lcl.00000160     DB     02H    
                                          DB     'T1'   
                                          DB     00     
     001748            __lcl.00000159     DD     __lcl.00000160 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     001758            lab4.mon__protected_body_subpdesc____1 DD __lcl.00000063 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     00000037 
                                          DD     00000037 
                                          DD     0000006D 
                                          DD     00000005 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000158 
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
     0017BC            __lcl.00000158     DD     0000000A 
                                          DD     lab4.mon.datasignal__subp_body_subpdesc____1 
                                          DD     lab4.mon.
calculationsignal__subp_body_subpdesc____1              
                                          DD     lab4.mon.setmb__subp_body_subpdesc____1 
                                          DD     lab4.mon.setalfa__subp_body_subpdesc____1 
                                          DD     lab4.mon.setmz__subp_body_subpdesc____1 
                                          DD     lab4.mon.getmb__subp_body_subpdesc____1 
                                          DD     lab4.mon.getalfa__subp_body_subpdesc____1 
                                          DD     lab4.mon.getmz__subp_body_subpdesc____1 
                                          DD     lab4.mon.inputed__subp_body_subpdesc____1 
                                          DD     lab4.mon.finish__subp_body_subpdesc____1 
     0017E8            lab4.mon.finish__subp_body_subpdesc____1 DD __lcl.00000053 
                                          DD     0000000B 
                                          DD     __lcl.00000128 
                                          DD     00000069 
                                          DD     0000006A 
                                          DD     0000006C 
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
                                          DD     __lcl.00000372 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00184C            lab4.mon.inputed__subp_body_subpdesc____1 DD __lcl.00000052 
                                          DD     0000000A 
                                          DD     __lcl.00000128 
                                          DD     00000064 
                                          DD     00000065 
                                          DD     00000067 
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
                                          DD     __lcl.00000373 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0018B0            lab4.mon.getmz__subp_body_subpdesc____1 DD __lcl.00000061 
                                          DD     00000009 
                                          DD     __lcl.00000128 
                                          DD     0000005F 
                                          DD     00000060 
                                          DD     00000062 
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
                                          DD     __lcl.00000374 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001914            lab4.mon.getalfa__subp_body_subpdesc____1 DD __lcl.00000060 
                                          DD     00000008 
                                          DD     __lcl.00000128 
                                          DD     0000005B 
                                          DD     0000005C 
                                          DD     0000005E 
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
                                          DD     __lcl.00000375 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001978            lab4.mon.getmb__subp_body_subpdesc____1 DD __lcl.00000059 
                                          DD     00000007 
                                          DD     __lcl.00000128 
                                          DD     00000057 
                                          DD     00000058 
                                          DD     0000005A 
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
                                          DD     __lcl.00000376 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0019DC            lab4.mon.setmz__subp_body_subpdesc____1 DD __lcl.00000058 
                                          DD     00000006 
                                          DD     __lcl.00000128 
                                          DD     0000004F 
                                          DD     00000050 
                                          DD     00000056 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000156 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000157 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000377 
                                          DD     00000010 
                                          DD     __lcl.00000001 
     001A40            __lcl.00000157     DD     00000001 
                                          DD     __lcl.00000155 
     001A48            __lcl.00000156     DD     00000001 
                                          DD     __lcl.00000048 
                                          DD     __lcl.00000018 
                                          DD     00000000 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     0000000C 
     001A64            __lcl.00000155     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     00000051 
                                          DD     00000051 
                                          DD     00000055 
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
                                          DD     __lcl.00000153 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000154 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001AC8            __lcl.00000154     DD     00000001 
                                          DD     __lcl.00000152 
     001AD0            __lcl.00000153     DD     00000001 
                                          DD     __lcl.00000139 
                                          DD     __lcl.00000147 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     001AE8            __lcl.00000152     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     00000052 
                                          DD     00000052 
                                          DD     00000054 
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
                                          DD     __lcl.00000151 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001B4C            __lcl.00000151     DD     00000001 
                                          DD     __lcl.00000136 
                                          DD     __lcl.00000150 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     001B64            __lcl.00000150     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000148 
                                          DD     __lcl.00000149 
     001B80            __lcl.00000149     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     001B8C            __lcl.00000148     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001B98            __lcl.00000147     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000145 
                                          DD     __lcl.00000146 
     001BB4            __lcl.00000146     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     001BC0            __lcl.00000145     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001BCC            lab4.mon.setalfa__subp_body_subpdesc____1 DD __lcl.00000057 
                                          DD     00000005 
                                          DD     __lcl.00000128 
                                          DD     0000004B 
                                          DD     0000004C 
                                          DD     0000004E 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000144 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000378 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001C30            __lcl.00000144     DD     00000001 
                                          DD     __lcl.00000048 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00010000 
                                          DB     4 DUP(00) 
                                          DD     0000000C 
     001C4C            lab4.mon.setmb__subp_body_subpdesc____1 DD __lcl.00000056 
                                          DD     00000004 
                                          DD     __lcl.00000128 
                                          DD     00000043 
                                          DD     00000044 
                                          DD     0000004A 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000142 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000143 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000379 
                                          DD     00000010 
                                          DD     __lcl.00000001 
     001CB0            __lcl.00000143     DD     00000001 
                                          DD     __lcl.00000141 
     001CB8            __lcl.00000142     DD     00000001 
                                          DD     __lcl.00000048 
                                          DD     __lcl.00000018 
                                          DD     00000000 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     0000000C 
     001CD4            __lcl.00000141     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     00000045 
                                          DD     00000045 
                                          DD     00000049 
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
                                          DD     __lcl.00000138 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000140 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001D38            __lcl.00000140     DD     00000001 
                                          DD     __lcl.00000137 
     001D40            __lcl.00000139     DB     01H    
                                          DB     'i'    
                                          DW     0000   
     001D44            __lcl.00000138     DD     00000001 
                                          DD     __lcl.00000139 
                                          DD     __lcl.00000131 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     001D5C            __lcl.00000137     DB     8 DUP(00) 
                                          DD     __lcl.00000128 
                                          DD     00000046 
                                          DD     00000046 
                                          DD     00000048 
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
                                          DD     __lcl.00000135 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001DC0            __lcl.00000136     DB     01H    
                                          DB     'j'    
                                          DW     0000   
     001DC4            __lcl.00000135     DD     00000001 
                                          DD     __lcl.00000136 
                                          DD     __lcl.00000134 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     001DDC            __lcl.00000134     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000132 
                                          DD     __lcl.00000133 
     001DF8            __lcl.00000133     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     001E04            __lcl.00000132     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001E10            __lcl.00000131     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000129 
                                          DD     __lcl.00000130 
     001E2C            __lcl.00000130     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     001E38            __lcl.00000129     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001E44            lab4.mon.calculationsignal__subp_body_subpdesc____1 DD __lcl.00000055 
                                          DD     00000003 
                                          DD     __lcl.00000128 
                                          DD     0000003E 
                                          DD     0000003F 
                                          DD     00000041 
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
                                          DD     __lcl.00000380 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001EA8            __lcl.00000128     DB     0BH    
                                          DB     '..\lab4.adb' 
     001EB4            lab4.mon.datasignal__subp_body_subpdesc____1 DD __lcl.00000054 
                                          DD     00000002 
                                          DD     __lcl.00000128 
                                          DD     00000039 
                                          DD     0000003A 
                                          DD     0000003C 
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
                                          DD     __lcl.00000381 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001F18            __lcl.00000127     DB     0CH    
                                          DB     'Pr_Type_Desc' 
                                          DB     00H,00H,00H 
     001F28            __lcl.00000126     DD     __lcl.00000127 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     __lcl.00000118 
                                          DD     00000000 
     001F40            __lcl.00000125     DB     10H    
                                          DB     'Compute_Barriers' 
                                          DB     00H,00H,00H 
     001F54            __lcl.00000124     DB     14H    
                                          DB     'Compute_All_Barriers' 
                                          DB     00H,00H,00H 
     001F6C            __lcl.00000123     DB     0AH    
                                          DB     'Entry_Code' 
                                          DB     00     
     001F78            __lcl.00000122     DB     10H    
                                          DB     'Depends_On_Count' 
                                          DB     00H,00H,00H 
     001F8C            __lcl.00000121     DB     0CH    
                                          DB     'Handler_List' 
                                          DB     00H,00H,00H 
     001F9C            __lcl.00000120     DB     0EH    
                                          DB     'Max_Name_Index' 
                                          DB     00     
     001FAC            __lcl.00000119     DB     07H    
                                          DB     'PT_Kind' 
     001FB4            __lcl.00000118     DD     00000007 
                                          DD     __lcl.00000119 
                                          DD     __lcl.00000071 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
                                          DD     00000000 
                                          DD     __lcl.00000120 
                                          DD     __lcl.00000075 
                                          DD     00000004 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
                                          DD     00000000 
                                          DD     __lcl.00000121 
                                          DD     __lcl.00000096 
                                          DD     00000008 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000122 
                                          DD     __lcl.00000102 
                                          DD     0000000C 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000101 
                                          DD     __lcl.00000123 
                                          DD     __lcl.00000105 
                                          DD     00000010 
                                          DD     00000000 
                                          DD     __lcl.00000109 
                                          DD     00000200 
                                          DD     __lcl.00000101 
                                          DD     __lcl.00000124 
                                          DD     __lcl.00000084 
                                          DD     00000014 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000111 
                                          DD     __lcl.00000125 
                                          DD     __lcl.00000105 
                                          DD     00000014 
                                          DD     00000000 
                                          DD     __lcl.00000116 
                                          DD     00000100 
                                          DD     __lcl.00000113 
     00207C            __lcl.00000117     DD     __lcl.00000101 
                                          DD     00000001 
                                          DD     00000000 
     002088            __lcl.00000116     DD     00000001 
                                          DD     __lcl.00000114 
                                          DD     __lcl.00000115 
     002094            __lcl.00000115     DD     00000001 
                                          DD     00000002 
     00209C            __lcl.00000114     DD     00000000 
                                          DD     00000000 
     0020A4            __lcl.00000113     DD     __lcl.00000101 
                                          DD     00000001 
                                          DD     __lcl.00000112 
     0020B0            __lcl.00000112     DD     00000000 
                                          DD     00000000 
                                          DD     00000002 
     0020BC            __lcl.00000111     DD     __lcl.00000101 
                                          DD     00000001 
                                          DD     __lcl.00000110 
     0020C8            __lcl.00000110     DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
     0020D4            __lcl.00000109     DD     00000001 
                                          DD     __lcl.00000107 
                                          DD     __lcl.00000108 
     0020E0            __lcl.00000108     DD     00000001 
                                          DD     00000002 
     0020E8            __lcl.00000107     DD     00000000 
                                          DD     00000000 
     0020F0            __lcl.00000106     DB     0AH    
                                          DB     'Code_Array' 
                                          DB     00     
     0020FC            __lcl.00000105     DD     __lcl.00000106 
                                          DD     00000011 
                                          DD     0000000E 
                                          DD     __lcl.00000104 
                                          DD     __lcl.00000084 
                                          DD     __lcl.00000103 
     002114            __lcl.00000104     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     002120            __lcl.00000103     DD     00000001 
                                          DD     __lcl.00000075 
     002128            __lcl.00000102     DB     4 DUP(00) 
                                          DD     00000001 
                                          DD     00000002 
     002134            __lcl.00000101     DD     00000000 
                                          DD     00000001 
                                          DD     __lcl.00000100 
     002140            __lcl.00000100     DD     00000000 
                                          DD     00000001 
                                          DD     00000001 
                                          DD     00000002 
     002150            __lcl.00000099     DD     00000000 
                                          DD     00000001 
                                          DD     __lcl.00000098 
     00215C            __lcl.00000098     DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
     002168            __lcl.00000097     DB     13H    
                                          DB     'Handler_List_Access' 
     00217C            __lcl.00000096     DD     __lcl.00000097 
                                          DD     00000003 
                                          DD     0000000D 
                                          DD     __lcl.00000094 
     00218C            __lcl.00000095     DB     11H    
                                          DB     'Handler_List_Type' 
                                          DW     0000   
     0021A0            __lcl.00000094     DD     __lcl.00000095 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     __lcl.00000091 
                                          DD     00000000 
     0021B8            __lcl.00000093     DB     07H    
                                          DB     'Handler' 
     0021C0            __lcl.00000092     DB     0CH    
                                          DB     'Num_Handlers' 
                                          DB     00H,00H,00H 
     0021D0            __lcl.00000091     DD     00000002 
                                          DD     __lcl.00000092 
                                          DD     __lcl.00000079 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
                                          DD     00000000 
                                          DD     __lcl.00000093 
                                          DD     __lcl.00000086 
                                          DD     00000004 
                                          DD     00000000 
                                          DD     __lcl.00000090 
                                          DD     00000100 
                                          DD     00000000 
     00220C            __lcl.00000090     DD     00000001 
                                          DD     __lcl.00000088 
                                          DD     __lcl.00000089 
     002218            __lcl.00000089     DD     00000001 
                                          DD     00000001 
     002220            __lcl.00000088     DD     00000000 
                                          DD     00000001 
     002228            __lcl.00000087     DB     0DH    
                                          DB     'Handler_Array' 
                                          DW     0000   
     002238            __lcl.00000086     DD     __lcl.00000087 
                                          DD     00000011 
                                          DD     0000000E 
                                          DD     __lcl.00000081 
                                          DD     __lcl.00000084 
                                          DD     __lcl.00000080 
     002250            __lcl.00000085     DB     0CH    
                                          DB     'Code_Address' 
                                          DB     00H,00H,00H 
     002260            __lcl.00000084     DD     __lcl.00000085 
                                          DD     00000003 
                                          DD     0000000D 
                                          DD     __lcl.00000082 
     002270            __lcl.00000083     DB     0AH    
                                          DB     'Raw_Object' 
                                          DB     00     
     00227C            __lcl.00000082     DD     __lcl.00000083 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     00000000 
     002294            __lcl.00000081     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     0022A0            __lcl.00000080     DD     00000001 
                                          DD     __lcl.00000079 
     0022A8            __lcl.00000079     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000076 
                                          DD     __lcl.00000077 
                                          DD     __lcl.00000078 
     0022C4            __lcl.00000078     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     0022D0            __lcl.00000077     DD     00000008 
                                          DD     00000003 
                                          DD     00000000 
     0022DC            __lcl.00000076     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     0022E8            __lcl.00000075     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000072 
                                          DD     __lcl.00000073 
                                          DD     __lcl.00000074 
     002304            __lcl.00000074     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     002310            __lcl.00000073     DD     00000008 
                                          DD     00000003 
                                          DD     00000000 
     00231C            __lcl.00000072     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     002328            __lcl.00000071     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000068 
                                          DD     __lcl.00000069 
                                          DD     __lcl.00000070 
     002344            __lcl.00000070     DD     00000003 
                                          DD     00000001 
                                          DB     02     
                                          DB     00H,00H,00H 
     002350            __lcl.00000069     DD     00000003 
                                          DD     00000001 
                                          DB     00     
                                          DB     00H,00H,00H 
     00235C            __lcl.00000068     DB     4 DUP(00) 
                                          DD     00000005 
                                          DD     00000003 
                                          DD     00000003 
                                          DD     __lcl.00000064 
     002370            __lcl.00000067     DB     08H    
                                          DB     'PT_Large' 
                                          DB     00H,00H,00H 
     00237C            __lcl.00000066     DB     08H    
                                          DB     'PT_Small' 
                                          DB     00H,00H,00H 
     002388            __lcl.00000065     DB     0DH    
                                          DB     'PT_No_Entries' 
                                          DW     0000   
     002398            __lcl.00000064     DD     __lcl.00000065 
                                          DD     00000000 
                                          DD     __lcl.00000066 
                                          DD     00000001 
                                          DD     __lcl.00000067 
                                          DD     00000002 
     0023B0            __lcl.00000063     DB     03H    
                                          DB     'MON'  
     0023B4            __lcl.00000062     DD     __lcl.00000063 
                                          DD     00000020 
                                          DD     __lcl.00000041 
                                          DD     __lcl.00000051 
     0023C4            __lcl.00000061     DB     05H    
                                          DB     'GetMZ' 
                                          DW     0000   
     0023CC            __lcl.00000060     DB     07H    
                                          DB     'GetAlfa' 
     0023D4            __lcl.00000059     DB     05H    
                                          DB     'GetMB' 
                                          DW     0000   
     0023DC            __lcl.00000058     DB     05H    
                                          DB     'SetMZ' 
                                          DW     0000   
     0023E4            __lcl.00000057     DB     07H    
                                          DB     'SetAlfa' 
     0023EC            __lcl.00000056     DB     05H    
                                          DB     'SetMB' 
                                          DW     0000   
     0023F4            __lcl.00000055     DB     11H    
                                          DB     'CalculationSignal' 
                                          DW     0000   
     002408            __lcl.00000054     DB     0AH    
                                          DB     'DataSignal' 
                                          DB     00     
     002414            __lcl.00000053     DB     06H    
                                          DB     'Finish' 
                                          DB     00     
     00241C            __lcl.00000052     DB     07H    
                                          DB     'Inputed' 
     002424            __lcl.00000051     DD     0000000A 
                                          DD     __lcl.00000052 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000053 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000054 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000055 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000056 
                                          DD     00000000 
                                          DD     __lcl.00000047 
                                          DD     __lcl.00000057 
                                          DD     00000000 
                                          DD     __lcl.00000049 
                                          DD     __lcl.00000058 
                                          DD     00000000 
                                          DD     __lcl.00000050 
                                          DD     __lcl.00000059 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000060 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000061 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0024A0            __lcl.00000050     DD     00000001 
                                          DD     __lcl.00000048 
                                          DD     __lcl.00000018 
                                          DB     4 DUP(00) 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0024BC            __lcl.00000049     DD     00000001 
                                          DD     __lcl.00000048 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     00010000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0024D8            __lcl.00000048     DB     01H    
                                          DB     'M'    
                                          DW     0000   
     0024DC            __lcl.00000047     DD     00000001 
                                          DD     __lcl.00000048 
                                          DD     __lcl.00000018 
                                          DB     4 DUP(00) 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0024F8            __lcl.00000046     DB     04H    
                                          DB     'alfa' 
                                          DB     00H,00H,00H 
     002500            __lcl.00000045     DB     02H    
                                          DB     'MZ'   
                                          DB     00     
     002504            __lcl.00000044     DB     02H    
                                          DB     'MB'   
                                          DB     00     
     002508            __lcl.00000043     DB     02H    
                                          DB     'F2'   
                                          DB     00     
     00250C            __lcl.00000042     DB     02H    
                                          DB     'F1'   
                                          DB     00     
     002510            __lcl.00000041     DD     00000005 
                                          DD     __lcl.00000042 
                                          DD     __lcl.00000005 
                                          DD     00000044 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000043 
                                          DD     __lcl.00000005 
                                          DD     00000048 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000044 
                                          DD     __lcl.00000018 
                                          DD     00000058 
                                          DD     00000000 
                                          DD     __lcl.00000037 
                                          DD     00000100 
                                          DD     00000000 
                                          DD     __lcl.00000045 
                                          DD     __lcl.00000018 
                                          DD     0000004C 
                                          DD     00000000 
                                          DD     __lcl.00000040 
                                          DD     00000200 
                                          DD     00000000 
                                          DD     __lcl.00000046 
                                          DD     __lcl.00000005 
                                          DD     00000050 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
     0025A0            __lcl.00000040     DD     00000001 
                                          DD     __lcl.00000038 
                                          DD     __lcl.00000039 
     0025AC            __lcl.00000039     DD     00000002 
                                          DD     package1.matr__constrained_array____1 
     0025B4            __lcl.00000038     DD     00000000 
                                          DD     00000001 
     0025BC            __lcl.00000037     DD     00000001 
                                          DD     __lcl.00000035 
                                          DD     __lcl.00000036 
     0025C8            __lcl.00000036     DD     00000002 
                                          DD     package1.matr__constrained_array____1 
     0025D0            __lcl.00000035     DD     00000000 
                                          DD     00000001 
     0025D8            __lcl.00000034     DB     04H    
                                          DB     'Time' 
                                          DB     00H,00H,00H 
     0025E0            __lcl.00000033     DD     __lcl.00000034 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000008 
                                          DD     __lcl.00000030 
                                          DD     00000000 
     0025F8            __lcl.00000032     DB     11H    
                                          DB     'seconds_since_day' 
                                          DW     0000   
     00260C            __lcl.00000031     DB     0CH    
                                          DB     'day_in_epoch' 
                                          DB     00H,00H,00H 
     00261C            __lcl.00000030     DD     00000002 
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
     002658            __lcl.00000029     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000003 
                                          DD     __lcl.00000025 
                                          DD     __lcl.00000026 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000028 
     002678            __lcl.00000028     DD     0000000C 
                                          DD     00000004 
                                          DQ     3FF0000000000000 
     002688            __lcl.00000027     DD     00000008 
                                          DD     00000003 
                                          DD     00011C82 
     002694            __lcl.00000026     DD     00000008 
                                          DD     00000003 
                                          DD     FFFEE37E 
     0026A0            __lcl.00000025     DB     4 DUP(00) 
                                          DD     00000013 
                                          DD     00000008 
                                          DB     4 DUP(00) 
                                          DQ     3FF0000000000000 
     0026B8            __lcl.00000024     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000003 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000021 
                                          DD     __lcl.00000022 
                                          DD     __lcl.00000023 
     0026D8            __lcl.00000023     DD     0000000C 
                                          DD     00000004 
                                          DQ     3F1A36E2EB1C432D 
     0026E8            __lcl.00000022     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     0026F4            __lcl.00000021     DD     00000008 
                                          DD     00000003 
                                          DD     80000000 
     002700            __lcl.00000020     DB     4 DUP(00) 
                                          DD     00000013 
                                          DD     00000008 
                                          DB     4 DUP(00) 
                                          DQ     3F10000000000000 
     002718            __lcl.00000019     DB     04H    
                                          DB     'Matr' 
                                          DB     00H,00H,00H 
     002720            __lcl.00000018     DD     __lcl.00000019 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000010 
                                          DD     __lcl.00000016 
                                          DD     __lcl.00000009 
     002738            __lcl.00000017     DB     03H    
                                          DB     'Vec'  
     00273C            __lcl.00000016     DD     __lcl.00000017 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000015 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000014 
     002754            __lcl.00000015     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     002760            __lcl.00000014     DD     00000001 
                                          DD     __lcl.00000013 
     002768            __lcl.00000013     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000011 
                                          DD     __lcl.00000012 
     002784            __lcl.00000012     DD     00000008 
                                          DD     00000007 
                                          DD     package1.vec__constrained_array____1 
     002790            __lcl.00000011     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00279C            __lcl.00000010     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__COMP_SU_SIZE 
     0027A8            __lcl.00000009     DD     00000001 
                                          DD     __lcl.00000008 
     0027B0            __lcl.00000008     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000007 
     0027CC            __lcl.00000007     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__constrained_array____1 
     0027D8            __lcl.00000006     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0027E4            __lcl.00000005     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000003 
                                          DD     __lcl.00000004 
     002800            __lcl.00000004     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     00280C            __lcl.00000003     DD     00000008 
                                          DD     00000003 
                                          DD     80000000 
     002818            __lcl.00000002     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     002824            __lcl.00000001     DD     00000000 
; ********* End of segment, Total Size = 10280


; ************* .av_dbgi segment :
                                          ALIGN 4       
     002828            __lcl.00000382     DB     16     
                                          DB     'D:\AdaDRZD-OP\lab4.adb' 
; ********* End of segment, Total Size = 10303

                       ;                                
                       CODE               ENDS          

