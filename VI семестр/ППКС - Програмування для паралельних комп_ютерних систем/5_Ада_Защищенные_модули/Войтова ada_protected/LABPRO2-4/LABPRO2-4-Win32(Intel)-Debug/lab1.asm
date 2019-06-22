
                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT Lab4 
;  Record Layout Information:
;     -- lab4.synchro
;     for Synchro use record
;         F1 at 68 range 0 .. 31;
;         F2 at 72 range 0 .. 31;
;     end record;
; 
;     -- lab4.op_mz
;     for OP_MZ use record
; --      MZ at 48 range 0..<dynamic-sized>; cannot specify place
;     end record;
; 
;     -- lab4.op_alfa
;     for OP_alfa use record
;         Alf at 48 range 0 .. 31;
;     end record;
; 
;     -- lab4.op_mr
;     for OP_MR use record
; --      MR at 48 range 0..<dynamic-sized>; cannot specify place
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
                       ;  Start of procedure lab4.synchro.inputsignal   
                       ;                                
                                          PUBLIC lab4.synchro.inputsignal 
                       lab4.synchro.inputsignal PROC NEAR 
;  Source Line # 66
   66| 000000 64                          FS:           
   66| 000001 8B15                        MOV    EDX, 4 
   66| 000003 04000000                                  
   66| 000007 8B52                        MOV    EDX, [EDX-4] 
   66| 000009 FC                                        
   66| 00000A 55                          PUSH   EBP    
   66| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 66
   66| 00000D 8B42                        MOV    EAX, [EDX+48] 
   66| 00000F 30                                        
   66| 000010 8078                        CMP    BYTE PTR [EAX-16], 0 ;  Synchro__elab_bool
   66| 000012 F0                                        
   66| 000013 00                                        
   66| 000014 75                          JNE    SHORT L18 
   66| 000015 0A                                        
   66| 000016 68                          PUSH   program_error 
   66| 000017 00000000                                  
   66| 00001B E8                          CALL   rts_raise 
   66| 00001C 00000000                                  
   66|                 L18:                             
;  Source Line # 68
   68| 000020 8B45                        MOV    EAX, [EBP+8] ;  po_access
   68| 000022 08                                        
   68| 000023 8B58                        MOV    EBX, [EAX+72] 
   68| 000025 48                                        
   68| 000026 43                          INC    EBX    
   68| 000027 CE                          INTO          
   68| 000028 8B4D                        MOV    ECX, [EBP+8] ;  po_access
   68| 00002A 08                                        
   68| 00002B 8959                        MOV    [ECX+72], EBX 
   68| 00002D 48                                        
;  Source Line # 69
   69| 00002E 8BE5                        MOV    ESP, EBP 
   69| 000030 5D                          POP    EBP    
   69| 000031 C2                          RET    8      
   69| 000032 0800                                      
                       ;                                
                       lab4.synchro.inputsignal ENDP    


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000304     DD     00000501 
                                          DD     00000042 
                                          DD     lab4.synchro.inputsignal 
                                          DD     __lcl.00000305 
                                          DD     00000042 
                                          DD     lab4.synchro.inputsignal+0000000DH 
                                          DD     __lcl.00000305 
                                          DD     00000044 
                                          DD     lab4.synchro.inputsignal+00000020H 
                                          DD     __lcl.00000305 
                                          DD     00000045 
                                          DD     lab4.synchro.inputsignal+0000002EH 
                                          DD     __lcl.00000305 
                                          DD     00000045 
                                          DD     lab4.synchro.inputsignal+00000030H 
                                          DD     __lcl.00000305 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure lab4.synchro.calcendsignal   
                       ;                                
                                          PUBLIC lab4.synchro.calcendsignal 
                       lab4.synchro.calcendsignal PROC NEAR 
;  Source Line # 70
   70| 000000 64                          FS:           
   70| 000001 8B15                        MOV    EDX, 4 
   70| 000003 04000000                                  
   70| 000007 8B52                        MOV    EDX, [EDX-4] 
   70| 000009 FC                                        
   70| 00000A 55                          PUSH   EBP    
   70| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 70
   70| 00000D 8B42                        MOV    EAX, [EDX+48] 
   70| 00000F 30                                        
   70| 000010 8078                        CMP    BYTE PTR [EAX-16], 0 ;  Synchro__elab_bool
   70| 000012 F0                                        
   70| 000013 00                                        
   70| 000014 75                          JNE    SHORT L18 
   70| 000015 0A                                        
   70| 000016 68                          PUSH   program_error 
   70| 000017 00000000                                  
   70| 00001B E8                          CALL   rts_raise 
   70| 00001C 00000000                                  
   70|                 L18:                             
;  Source Line # 72
   72| 000020 8B45                        MOV    EAX, [EBP+8] ;  po_access
   72| 000022 08                                        
   72| 000023 8B58                        MOV    EBX, [EAX+68] 
   72| 000025 44                                        
   72| 000026 43                          INC    EBX    
   72| 000027 CE                          INTO          
   72| 000028 8B4D                        MOV    ECX, [EBP+8] ;  po_access
   72| 00002A 08                                        
   72| 00002B 8959                        MOV    [ECX+68], EBX 
   72| 00002D 44                                        
;  Source Line # 73
   73| 00002E 8BE5                        MOV    ESP, EBP 
   73| 000030 5D                          POP    EBP    
   73| 000031 C2                          RET    8      
   73| 000032 0800                                      
                       ;                                
                       lab4.synchro.calcendsignal ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000303     DD     00000501 
                                          DD     00000046 
                                          DD     lab4.synchro.calcendsignal 
                                          DD     __lcl.00000305 
                                          DD     00000046 
                                          DD     lab4.synchro.calcendsignal+0000000DH 
                                          DD     __lcl.00000305 
                                          DD     00000048 
                                          DD     lab4.synchro.calcendsignal+00000020H 
                                          DD     __lcl.00000305 
                                          DD     00000049 
                                          DD     lab4.synchro.calcendsignal+0000002EH 
                                          DD     __lcl.00000305 
                                          DD     00000049 
                                          DD     lab4.synchro.calcendsignal+00000030H 
                                          DD     __lcl.00000305 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure lab4.synchro.outputsync   
                       ;                                
                                          PUBLIC lab4.synchro.outputsync 
                       lab4.synchro.outputsync PROC NEAR 
;  Source Line # 74
   74| 000000 64                          FS:           
   74| 000001 8B15                        MOV    EDX, 4 
   74| 000003 04000000                                  
   74| 000007 8B52                        MOV    EDX, [EDX-4] 
   74| 000009 FC                                        
   74| 00000A 55                          PUSH   EBP    
   74| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 74
   74| 00000D 8B42                        MOV    EAX, [EDX+48] 
   74| 00000F 30                                        
   74| 000010 8078                        CMP    BYTE PTR [EAX-16], 0 ;  Synchro__elab_bool
   74| 000012 F0                                        
   74| 000013 00                                        
   74| 000014 75                          JNE    SHORT L17 
   74| 000015 0A                                        
   74| 000016 68                          PUSH   program_error 
   74| 000017 00000000                                  
   74| 00001B E8                          CALL   rts_raise 
   74| 00001C 00000000                                  
;  Source Line # 77
   77|                 L17:                             
   77| 000020 8BE5                        MOV    ESP, EBP 
   77| 000022 5D                          POP    EBP    
   77| 000023 C2                          RET    16     
   77| 000024 1000                                      
                       ;                                
                       lab4.synchro.outputsync ENDP     

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000302     DD     00000401 
                                          DD     0000004A 
                                          DD     lab4.synchro.outputsync 
                                          DD     __lcl.00000305 
                                          DD     0000004A 
                                          DD     lab4.synchro.outputsync+0000000DH 
                                          DD     __lcl.00000305 
                                          DD     0000004D 
                                          DD     lab4.synchro.outputsync+00000020H 
                                          DD     __lcl.00000305 
                                          DD     0000004D 
                                          DD     lab4.synchro.outputsync+00000022H 
                                          DD     __lcl.00000305 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.synchro.inputsync   
                       ;                                
                                          PUBLIC lab4.synchro.inputsync 
                       lab4.synchro.inputsync PROC NEAR 
;  Source Line # 78
   78| 000000 64                          FS:           
   78| 000001 8B15                        MOV    EDX, 4 
   78| 000003 04000000                                  
   78| 000007 8B52                        MOV    EDX, [EDX-4] 
   78| 000009 FC                                        
   78| 00000A 55                          PUSH   EBP    
   78| 00000B 8BEC                        MOV    EBP, ESP 
;  Source Line # 78
   78| 00000D 8B42                        MOV    EAX, [EDX+48] 
   78| 00000F 30                                        
   78| 000010 8078                        CMP    BYTE PTR [EAX-16], 0 ;  Synchro__elab_bool
   78| 000012 F0                                        
   78| 000013 00                                        
   78| 000014 75                          JNE    SHORT L17 
   78| 000015 0A                                        
   78| 000016 68                          PUSH   program_error 
   78| 000017 00000000                                  
   78| 00001B E8                          CALL   rts_raise 
   78| 00001C 00000000                                  
;  Source Line # 81
   81|                 L17:                             
   81| 000020 8BE5                        MOV    ESP, EBP 
   81| 000022 5D                          POP    EBP    
   81| 000023 C2                          RET    16     
   81| 000024 1000                                      
                       ;                                
                       lab4.synchro.inputsync ENDP      

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000301     DD     00000401 
                                          DD     0000004E 
                                          DD     lab4.synchro.inputsync 
                                          DD     __lcl.00000305 
                                          DD     0000004E 
                                          DD     lab4.synchro.inputsync+0000000DH 
                                          DD     __lcl.00000305 
                                          DD     00000051 
                                          DD     lab4.synchro.inputsync+00000020H 
                                          DD     __lcl.00000305 
                                          DD     00000051 
                                          DD     lab4.synchro.inputsync+00000022H 
                                          DD     __lcl.00000305 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.synchro__all_barriers   
                       ;                                
                                          PUBLIC lab4.synchro__all_barriers 
                       lab4.synchro__all_barriers PROC NEAR 
;  Source Line # 81
   81| 000000 55                          PUSH   EBP    
   81| 000001 8BEC                        MOV    EBP, ESP 
   81| 000003 83EC                        SUB    ESP, 4 
   81| 000005 04                                        
   81| 000006 C745                        MOV    DWORD PTR [EBP-4], 0 
   81| 000008 FC                                        
   81| 000009 00000000                                  
   81| 00000D 8B45                        MOV    EAX, [EBP+8] ;  po_access
   81| 00000F 08                                        
   81| 000010 8B1D                        MOV    EBX, package1.p 
   81| 000012 00000000                                  
   81| 000016 4B                          DEC    EBX    
   81| 000017 CE                          INTO          
   81| 000018 3958                        CMP    [EAX+68], EBX 
   81| 00001A 44                                        
   81| 00001B 75                          JNE    SHORT L18 
   81| 00001C 0B                                        
   81| 00001D 8B45                        MOV    EAX, [EBP-4] 
   81| 00001F FC                                        
   81| 000020 0D                          OR     EAX, 1 
   81| 000021 01000000                                  
   81| 000025 8945                        MOV    [EBP-4], EAX 
   81| 000027 FC                                        
   81|                 L18:                             
   81| 000028 8B45                        MOV    EAX, [EBP+8] ;  po_access
   81| 00002A 08                                        
   81| 00002B 8378                        CMP    DWORD PTR [EAX+72], 1 
   81| 00002D 48                                        
   81| 00002E 01                                        
   81| 00002F 75                          JNE    SHORT L20 
   81| 000030 0B                                        
   81| 000031 8B45                        MOV    EAX, [EBP-4] 
   81| 000033 FC                                        
   81| 000034 0D                          OR     EAX, 2 
   81| 000035 02000000                                  
   81| 000039 8945                        MOV    [EBP-4], EAX 
   81| 00003B FC                                        
   81|                 L20:                             
   81| 00003C 8B45                        MOV    EAX, [EBP-4] 
   81| 00003E FC                                        
   81| 00003F 8BE5                        MOV    ESP, EBP 
   81| 000041 5D                          POP    EBP    
   81| 000042 C2                          RET    4      
   81| 000043 0400                                      
                       ;                                
                       lab4.synchro__all_barriers ENDP  
                       ;                                
                       ;  Start of procedure lab4.op_mz.setmz   
                       ;                                
                                          PUBLIC lab4.op_mz.setmz 
                       lab4.op_mz.setmz   PROC   NEAR   
;  Source Line # 86
   86| 000000 64                          FS:           
   86| 000001 8B15                        MOV    EDX, 4 
   86| 000003 04000000                                  
   86| 000007 8B52                        MOV    EDX, [EDX-4] 
   86| 000009 FC                                        
   86| 00000A 55                          PUSH   EBP    
   86| 00000B 8BEC                        MOV    EBP, ESP 
   86| 00000D 83EC                        SUB    ESP, 16 
   86| 00000F 10                                        
;  Source Line # 86
   86| 000010 8B42                        MOV    EAX, [EDX+48] 
   86| 000012 30                                        
   86| 000013 8078                        CMP    BYTE PTR [EAX-15], 0 ;  OP_MZ__elab_bool
   86| 000015 F1                                        
   86| 000016 00                                        
   86| 000017 75                          JNE    SHORT L18 
   86| 000018 0A                                        
   86| 000019 68                          PUSH   program_error 
   86| 00001A 00000000                                  
   86| 00001E E8                          CALL   rts_raise 
   86| 00001F 00000000                                  
   86|                 L18:                             
   86| 000023 8B05                        MOV    EAX, package1.n 
   86| 000025 00000000                                  
   86| 000029 8945                        MOV    [EBP-16], EAX 
   86| 00002B F0                                        
;  Source Line # 88
   88| 00002C 837D                        CMP    DWORD PTR [EBP-16], 0 
   88| 00002E F0                                        
   88| 00002F 00                                        
   88| 000030 0F8E                        JLE    L17    
   88| 000032 B2000000                                  
   88| 000036 C745                        MOV    DWORD PTR [EBP-12], 1 
   88| 000038 F4                                        
   88| 000039 01000000                                  
   88|                 L22:                             
   88| 00003D 8B05                        MOV    EAX, package1.n 
   88| 00003F 00000000                                  
   88| 000043 8945                        MOV    [EBP-8], EAX 
   88| 000045 F8                                        
;  Source Line # 89
   89| 000046 837D                        CMP    DWORD PTR [EBP-8], 0 
   89| 000048 F8                                        
   89| 000049 00                                        
   89| 00004A 0F8E                        JLE    L23    
   89| 00004C 84000000                                  
   89| 000050 C745                        MOV    DWORD PTR [EBP-4], 1 
   89| 000052 FC                                        
   89| 000053 01000000                                  
   89|                 L25:                             
;  Source Line # 90
   90| 000057 8B45                        MOV    EAX, [EBP+12] ;  params
   90| 000059 0C                                        
   90| 00005A 8B18                        MOV    EBX, [EAX+0] 
   90| 00005C 8B4D                        MOV    ECX, [EBP-12] 
   90| 00005E F4                                        
   90| 00005F 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
   90| 000061 00000000                                  
   90|                 L30:                             
   90| 000065 0F8F                        JG     L31    
   90| 000067 83000000                                  
   90| 00006B 8D49                        LEA    ECX, [ECX-1] 
   90| 00006D FF                                        
   90| 00006E 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
   90| 000071 00000000                                  
   90| 000075 8B55                        MOV    EDX, [EBP-4] 
   90| 000077 FC                                        
   90| 000078 3B15                        CMP    EDX, package1.vec__constrained_array____1 
   90| 00007A 00000000                                  
   90|                 L32:                             
   90| 00007E 0F8F                        JG     L33    
   90| 000080 76000000                                  
   90| 000084 8D1495                      LEA    EDX, [4*EDX-4] 
   90| 000087 FCFFFFFF                                  
   90| 00008B 03CA                        ADD    ECX, EDX 
   90| 00008D 8B75                        MOV    ESI, [EBP+8] ;  po_access
   90| 00008F 08                                        
   90| 000090 8B7D                        MOV    EDI, [EBP-12] 
   90| 000092 F4                                        
   90| 000093 3B3D                        CMP    EDI, package1.matr__constrained_array____1 
   90| 000095 00000000                                  
   90|                 L34:                             
   90| 000099 7F                          JG     SHORT L35 
   90| 00009A 6B                                        
   90| 00009B 8D7F                        LEA    EDI, [EDI-1] 
   90| 00009D FF                                        
   90| 00009E 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
   90| 0000A1 00000000                                  
   90| 0000A5 8B45                        MOV    EAX, [EBP-4] 
   90| 0000A7 FC                                        
   90| 0000A8 3B05                        CMP    EAX, package1.vec__constrained_array____1 
   90| 0000AA 00000000                                  
   90|                 L36:                             
   90| 0000AE 7F                          JG     SHORT L37 
   90| 0000AF 62                                        
   90| 0000B0 8D0485                      LEA    EAX, [4*EAX-4] 
   90| 0000B3 FCFFFFFF                                  
   90| 0000B7 03F8                        ADD    EDI, EAX 
   90| 0000B9 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
   90| 0000BC 895C3E                      MOV    [ESI+EDI+48], EBX 
   90| 0000BF 30                                        
;  Source Line # 91
   91| 0000C0 8B55                        MOV    EDX, [EBP-8] 
   91| 0000C2 F8                                        
   91| 0000C3 3955                        CMP    [EBP-4], EDX 
   91| 0000C5 FC                                        
   91| 0000C6 74                          JE     SHORT L23 
   91| 0000C7 0C                                        
   91| 0000C8 8B45                        MOV    EAX, [EBP-4] 
   91| 0000CA FC                                        
   91| 0000CB 40                          INC    EAX    
   91| 0000CC 8945                        MOV    [EBP-4], EAX 
   91| 0000CE FC                                        
   91| 0000CF E9                          JMP    L25    
   91| 0000D0 83FFFFFF                                  
   91|                 L23:                             
;  Source Line # 92
   92| 0000D4 8B45                        MOV    EAX, [EBP-16] 
   92| 0000D6 F0                                        
   92| 0000D7 3945                        CMP    [EBP-12], EAX 
   92| 0000D9 F4                                        
   92| 0000DA 74                          JE     SHORT L17 
   92| 0000DB 0C                                        
   92| 0000DC 8B45                        MOV    EAX, [EBP-12] 
   92| 0000DE F4                                        
   92| 0000DF 40                          INC    EAX    
   92| 0000E0 8945                        MOV    [EBP-12], EAX 
   92| 0000E2 F4                                        
   92| 0000E3 E9                          JMP    L22    
   92| 0000E4 55FFFFFF                                  
   92|                 L17:                             
;  Source Line # 93
   93| 0000E8 8BE5                        MOV    ESP, EBP 
   93| 0000EA 5D                          POP    EBP    
   93| 0000EB C2                          RET    8      
   93| 0000EC 0800                                      
   93|                 L31:                             
   93| 0000EE 8D05                        LEA    EAX, L30+5 
   93| 0000F0 6A000000                                  
   93| 0000F4 50                          PUSH   EAX    
   93| 0000F5 E9                          JMP    rts_raise_constraint_error 
   93| 0000F6 00000000                                  
   93|                 L33:                             
   93| 0000FA 8D05                        LEA    EAX, L32+5 
   93| 0000FC 83000000                                  
   93| 000100 50                          PUSH   EAX    
   93| 000101 E9                          JMP    rts_raise_constraint_error 
   93| 000102 00000000                                  
   93|                 L35:                             
   93| 000106 8D05                        LEA    EAX, L34+5 
   93| 000108 9E000000                                  
   93| 00010C 50                          PUSH   EAX    
   93| 00010D E9                          JMP    rts_raise_constraint_error 
   93| 00010E 00000000                                  
   93|                 L37:                             
   93| 000112 8D05                        LEA    EAX, L36+5 
   93| 000114 B3000000                                  
   93| 000118 50                          PUSH   EAX    
   93| 000119 E9                          JMP    rts_raise_constraint_error 
   93| 00011A 00000000                                  
                       ;                                
                       lab4.op_mz.setmz   ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000300     DD     00000901 
                                          DD     00000056 
                                          DD     lab4.op_mz.setmz 
                                          DD     __lcl.00000305 
                                          DD     00000056 
                                          DD     lab4.op_mz.setmz+00000010H 
                                          DD     __lcl.00000305 
                                          DD     00000058 
                                          DD     lab4.op_mz.setmz+0000002CH 
                                          DD     __lcl.00000305 
                                          DD     00000059 
                                          DD     lab4.op_mz.setmz+00000046H 
                                          DD     __lcl.00000305 
                                          DD     0000005A 
                                          DD     lab4.op_mz.setmz+00000057H 
                                          DD     __lcl.00000305 
                                          DD     0000005B 
                                          DD     lab4.op_mz.setmz+000000C0H 
                                          DD     __lcl.00000305 
                                          DD     0000005C 
                                          DD     lab4.op_mz.setmz+000000D4H 
                                          DD     __lcl.00000305 
                                          DD     0000005D 
                                          DD     lab4.op_mz.setmz+000000E8H 
                                          DD     __lcl.00000305 
                                          DD     0000005D 
                                          DD     lab4.op_mz.setmz+0000011AH 
                                          DD     __lcl.00000305 
; ********* End of segment, Total Size = 112

                       ;                                
                       ;  Start of procedure lab4.op_mz.getmz   
                       ;                                
                                          PUBLIC lab4.op_mz.getmz 
                       lab4.op_mz.getmz   PROC   NEAR   
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
   95| 000010 8078                        CMP    BYTE PTR [EAX-15], 0 ;  OP_MZ__elab_bool
   95| 000012 F1                                        
   95| 000013 00                                        
   95| 000014 75                          JNE    SHORT L18 
   95| 000015 0A                                        
   95| 000016 68                          PUSH   program_error 
   95| 000017 00000000                                  
   95| 00001B E8                          CALL   rts_raise 
   95| 00001C 00000000                                  
   95|                 L18:                             
;  Source Line # 97
   97| 000020 8B05                        MOV    EAX, package1.matr__constrained_array____1 
   97| 000022 00000000                                  
   97| 000026 2D                          SUB    EAX, 1 
   97| 000027 01000000                                  
   97| 00002B 7D                          JGE    SHORT L20 
   97| 00002C 03                                        
   97| 00002D 33C0                        XOR    EAX, EAX 
   97| 00002F 48                          DEC    EAX    
   97|                 L20:                             
   97| 000030 CE                          INTO          
   97| 000031 40                          INC    EAX    
   97| 000032 CE                          INTO          
   97| 000033 0FAF05                      IMUL   EAX, package1.matr__COMP_SU_SIZE 
   97| 000036 00000000                                  
   97| 00003A CE                          INTO          
   97| 00003B 8B5D                        MOV    EBX, [EBP+8] ;  po_access
   97| 00003D 08                                        
   97| 00003E 8B4D                        MOV    ECX, [EBP+12] ;  params
   97| 000040 0C                                        
   97| 000041 8B11                        MOV    EDX, [ECX+0] 
   97| 000043 50                          PUSH   EAX    
   97| 000044 8D5B                        LEA    EBX, [EBX+48] 
   97| 000046 30                                        
   97| 000047 53                          PUSH   EBX    
   97| 000048 52                          PUSH   EDX    
   97| 000049 E8                          CALL   _rts_block_move 
   97| 00004A 00000000                                  
   97| 00004E 8BE5                        MOV    ESP, EBP 
   97| 000050 5D                          POP    EBP    
   97| 000051 C2                          RET    8      
   97| 000052 0800                                      
                       ;                                
                       lab4.op_mz.getmz   ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000299     DD     00000401 
                                          DD     0000005F 
                                          DD     lab4.op_mz.getmz 
                                          DD     __lcl.00000305 
                                          DD     0000005F 
                                          DD     lab4.op_mz.getmz+0000000DH 
                                          DD     __lcl.00000305 
                                          DD     00000061 
                                          DD     lab4.op_mz.getmz+00000020H 
                                          DD     __lcl.00000305 
                                          DD     00000061 
                                          DD     lab4.op_mz.getmz+00000050H 
                                          DD     __lcl.00000305 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.op_alfa.setalfa   
                       ;                                
                                          PUBLIC lab4.op_alfa.setalfa 
                       lab4.op_alfa.setalfa PROC NEAR   
;  Source Line # 103
  103| 000000 64                          FS:           
  103| 000001 8B15                        MOV    EDX, 4 
  103| 000003 04000000                                  
  103| 000007 8B52                        MOV    EDX, [EDX-4] 
  103| 000009 FC                                        
  103| 00000A 55                          PUSH   EBP    
  103| 00000B 8BEC                        MOV    EBP, ESP 
  103| 00000D 83EC                        SUB    ESP, 8 
  103| 00000F 08                                        
;  Source Line # 103
  103| 000010 8B42                        MOV    EAX, [EDX+48] 
  103| 000012 30                                        
  103| 000013 8955                        MOV    [EBP-8], EDX ; Spill
  103| 000015 F8                                        
  103| 000016 8078                        CMP    BYTE PTR [EAX-14], 0 ;  OP_alfa__elab_bool
  103| 000018 F2                                        
  103| 000019 00                                        
  103| 00001A 75                          JNE    SHORT L18 
  103| 00001B 0A                                        
  103| 00001C 68                          PUSH   program_error 
  103| 00001D 00000000                                  
  103| 000021 E8                          CALL   rts_raise 
  103| 000022 00000000                                  
  103|                 L18:                             
;  Source Line # 105
  105| 000026 8B45                        MOV    EAX, [EBP+12] ;  params
  105| 000028 0C                                        
  105| 000029 8B55                        MOV    EDX, [EBP-8] ; Spill
  105| 00002B F8                                        
  105| 00002C 8B5A                        MOV    EBX, [EDX+48] 
  105| 00002E 30                                        
  105| 00002F 8B08                        MOV    ECX, [EAX+0] 
  105| 000031 898B                        MOV    [EBX-348], ECX ;  Alfa
  105| 000033 A4FEFFFF                                  
;  Source Line # 106
  106| 000037 8BE5                        MOV    ESP, EBP 
  106| 000039 5D                          POP    EBP    
  106| 00003A C2                          RET    8      
  106| 00003B 0800                                      
                       ;                                
                       lab4.op_alfa.setalfa ENDP        

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000298     DD     00000501 
                                          DD     00000067 
                                          DD     lab4.op_alfa.setalfa 
                                          DD     __lcl.00000305 
                                          DD     00000067 
                                          DD     lab4.op_alfa.setalfa+00000010H 
                                          DD     __lcl.00000305 
                                          DD     00000069 
                                          DD     lab4.op_alfa.setalfa+00000026H 
                                          DD     __lcl.00000305 
                                          DD     0000006A 
                                          DD     lab4.op_alfa.setalfa+00000037H 
                                          DD     __lcl.00000305 
                                          DD     0000006A 
                                          DD     lab4.op_alfa.setalfa+00000039H 
                                          DD     __lcl.00000305 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure lab4.op_alfa.getalfa   
                       ;                                
                                          PUBLIC lab4.op_alfa.getalfa 
                       lab4.op_alfa.getalfa PROC NEAR   
;  Source Line # 108
  108| 000000 64                          FS:           
  108| 000001 8B15                        MOV    EDX, 4 
  108| 000003 04000000                                  
  108| 000007 8B52                        MOV    EDX, [EDX-4] 
  108| 000009 FC                                        
  108| 00000A 55                          PUSH   EBP    
  108| 00000B 8BEC                        MOV    EBP, ESP 
  108| 00000D 83EC                        SUB    ESP, 8 
  108| 00000F 08                                        
;  Source Line # 108
  108| 000010 8B42                        MOV    EAX, [EDX+48] 
  108| 000012 30                                        
  108| 000013 8955                        MOV    [EBP-8], EDX ; Spill
  108| 000015 F8                                        
  108| 000016 8078                        CMP    BYTE PTR [EAX-14], 0 ;  OP_alfa__elab_bool
  108| 000018 F2                                        
  108| 000019 00                                        
  108| 00001A 75                          JNE    SHORT L18 
  108| 00001B 0A                                        
  108| 00001C 68                          PUSH   program_error 
  108| 00001D 00000000                                  
  108| 000021 E8                          CALL   rts_raise 
  108| 000022 00000000                                  
  108|                 L18:                             
;  Source Line # 110
  110| 000026 8B55                        MOV    EDX, [EBP-8] ; Spill
  110| 000028 F8                                        
  110| 000029 8B42                        MOV    EAX, [EDX+48] 
  110| 00002B 30                                        
  110| 00002C 8B5D                        MOV    EBX, [EBP+12] ;  params
  110| 00002E 0C                                        
  110| 00002F 8B0B                        MOV    ECX, [EBX+0] 
  110| 000031 8BB0                        MOV    ESI, [EAX-348] ;  Alfa
  110| 000033 A4FEFFFF                                  
  110| 000037 8931                        MOV    [ECX+0], ESI 
  110| 000039 8BE5                        MOV    ESP, EBP 
  110| 00003B 5D                          POP    EBP    
  110| 00003C C2                          RET    8      
  110| 00003D 0800                                      
                       ;                                
                       lab4.op_alfa.getalfa ENDP        

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000297     DD     00000401 
                                          DD     0000006C 
                                          DD     lab4.op_alfa.getalfa 
                                          DD     __lcl.00000305 
                                          DD     0000006C 
                                          DD     lab4.op_alfa.getalfa+00000010H 
                                          DD     __lcl.00000305 
                                          DD     0000006E 
                                          DD     lab4.op_alfa.getalfa+00000026H 
                                          DD     __lcl.00000305 
                                          DD     0000006E 
                                          DD     lab4.op_alfa.getalfa+0000003BH 
                                          DD     __lcl.00000305 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.op_mr.setmr   
                       ;                                
                                          PUBLIC lab4.op_mr.setmr 
                       lab4.op_mr.setmr   PROC   NEAR   
;  Source Line # 116
  116| 000000 64                          FS:           
  116| 000001 8B15                        MOV    EDX, 4 
  116| 000003 04000000                                  
  116| 000007 8B52                        MOV    EDX, [EDX-4] 
  116| 000009 FC                                        
  116| 00000A 55                          PUSH   EBP    
  116| 00000B 8BEC                        MOV    EBP, ESP 
  116| 00000D 83EC                        SUB    ESP, 16 
  116| 00000F 10                                        
;  Source Line # 116
  116| 000010 8B42                        MOV    EAX, [EDX+48] 
  116| 000012 30                                        
  116| 000013 8078                        CMP    BYTE PTR [EAX-13], 0 ;  OP_MR__elab_bool
  116| 000015 F3                                        
  116| 000016 00                                        
  116| 000017 75                          JNE    SHORT L18 
  116| 000018 0A                                        
  116| 000019 68                          PUSH   program_error 
  116| 00001A 00000000                                  
  116| 00001E E8                          CALL   rts_raise 
  116| 00001F 00000000                                  
  116|                 L18:                             
  116| 000023 8B05                        MOV    EAX, package1.n 
  116| 000025 00000000                                  
  116| 000029 8945                        MOV    [EBP-16], EAX 
  116| 00002B F0                                        
;  Source Line # 118
  118| 00002C 837D                        CMP    DWORD PTR [EBP-16], 0 
  118| 00002E F0                                        
  118| 00002F 00                                        
  118| 000030 0F8E                        JLE    L17    
  118| 000032 B2000000                                  
  118| 000036 C745                        MOV    DWORD PTR [EBP-12], 1 
  118| 000038 F4                                        
  118| 000039 01000000                                  
  118|                 L22:                             
  118| 00003D 8B05                        MOV    EAX, package1.n 
  118| 00003F 00000000                                  
  118| 000043 8945                        MOV    [EBP-8], EAX 
  118| 000045 F8                                        
;  Source Line # 119
  119| 000046 837D                        CMP    DWORD PTR [EBP-8], 0 
  119| 000048 F8                                        
  119| 000049 00                                        
  119| 00004A 0F8E                        JLE    L23    
  119| 00004C 84000000                                  
  119| 000050 C745                        MOV    DWORD PTR [EBP-4], 1 
  119| 000052 FC                                        
  119| 000053 01000000                                  
  119|                 L25:                             
;  Source Line # 120
  120| 000057 8B45                        MOV    EAX, [EBP+12] ;  params
  120| 000059 0C                                        
  120| 00005A 8B18                        MOV    EBX, [EAX+0] 
  120| 00005C 8B4D                        MOV    ECX, [EBP-12] 
  120| 00005E F4                                        
  120| 00005F 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  120| 000061 00000000                                  
  120|                 L30:                             
  120| 000065 0F8F                        JG     L31    
  120| 000067 83000000                                  
  120| 00006B 8D49                        LEA    ECX, [ECX-1] 
  120| 00006D FF                                        
  120| 00006E 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  120| 000071 00000000                                  
  120| 000075 8B55                        MOV    EDX, [EBP-4] 
  120| 000077 FC                                        
  120| 000078 3B15                        CMP    EDX, package1.vec__constrained_array____1 
  120| 00007A 00000000                                  
  120|                 L32:                             
  120| 00007E 0F8F                        JG     L33    
  120| 000080 76000000                                  
  120| 000084 8D1495                      LEA    EDX, [4*EDX-4] 
  120| 000087 FCFFFFFF                                  
  120| 00008B 03CA                        ADD    ECX, EDX 
  120| 00008D 8B75                        MOV    ESI, [EBP+8] ;  po_access
  120| 00008F 08                                        
  120| 000090 8B7D                        MOV    EDI, [EBP-12] 
  120| 000092 F4                                        
  120| 000093 3B3D                        CMP    EDI, package1.matr__constrained_array____1 
  120| 000095 00000000                                  
  120|                 L34:                             
  120| 000099 7F                          JG     SHORT L35 
  120| 00009A 6B                                        
  120| 00009B 8D7F                        LEA    EDI, [EDI-1] 
  120| 00009D FF                                        
  120| 00009E 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
  120| 0000A1 00000000                                  
  120| 0000A5 8B45                        MOV    EAX, [EBP-4] 
  120| 0000A7 FC                                        
  120| 0000A8 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  120| 0000AA 00000000                                  
  120|                 L36:                             
  120| 0000AE 7F                          JG     SHORT L37 
  120| 0000AF 62                                        
  120| 0000B0 8D0485                      LEA    EAX, [4*EAX-4] 
  120| 0000B3 FCFFFFFF                                  
  120| 0000B7 03F8                        ADD    EDI, EAX 
  120| 0000B9 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  120| 0000BC 895C3E                      MOV    [ESI+EDI+48], EBX 
  120| 0000BF 30                                        
;  Source Line # 121
  121| 0000C0 8B55                        MOV    EDX, [EBP-8] 
  121| 0000C2 F8                                        
  121| 0000C3 3955                        CMP    [EBP-4], EDX 
  121| 0000C5 FC                                        
  121| 0000C6 74                          JE     SHORT L23 
  121| 0000C7 0C                                        
  121| 0000C8 8B45                        MOV    EAX, [EBP-4] 
  121| 0000CA FC                                        
  121| 0000CB 40                          INC    EAX    
  121| 0000CC 8945                        MOV    [EBP-4], EAX 
  121| 0000CE FC                                        
  121| 0000CF E9                          JMP    L25    
  121| 0000D0 83FFFFFF                                  
  121|                 L23:                             
;  Source Line # 122
  122| 0000D4 8B45                        MOV    EAX, [EBP-16] 
  122| 0000D6 F0                                        
  122| 0000D7 3945                        CMP    [EBP-12], EAX 
  122| 0000D9 F4                                        
  122| 0000DA 74                          JE     SHORT L17 
  122| 0000DB 0C                                        
  122| 0000DC 8B45                        MOV    EAX, [EBP-12] 
  122| 0000DE F4                                        
  122| 0000DF 40                          INC    EAX    
  122| 0000E0 8945                        MOV    [EBP-12], EAX 
  122| 0000E2 F4                                        
  122| 0000E3 E9                          JMP    L22    
  122| 0000E4 55FFFFFF                                  
  122|                 L17:                             
;  Source Line # 123
  123| 0000E8 8BE5                        MOV    ESP, EBP 
  123| 0000EA 5D                          POP    EBP    
  123| 0000EB C2                          RET    8      
  123| 0000EC 0800                                      
  123|                 L31:                             
  123| 0000EE 8D05                        LEA    EAX, L30+5 
  123| 0000F0 6A000000                                  
  123| 0000F4 50                          PUSH   EAX    
  123| 0000F5 E9                          JMP    rts_raise_constraint_error 
  123| 0000F6 00000000                                  
  123|                 L33:                             
  123| 0000FA 8D05                        LEA    EAX, L32+5 
  123| 0000FC 83000000                                  
  123| 000100 50                          PUSH   EAX    
  123| 000101 E9                          JMP    rts_raise_constraint_error 
  123| 000102 00000000                                  
  123|                 L35:                             
  123| 000106 8D05                        LEA    EAX, L34+5 
  123| 000108 9E000000                                  
  123| 00010C 50                          PUSH   EAX    
  123| 00010D E9                          JMP    rts_raise_constraint_error 
  123| 00010E 00000000                                  
  123|                 L37:                             
  123| 000112 8D05                        LEA    EAX, L36+5 
  123| 000114 B3000000                                  
  123| 000118 50                          PUSH   EAX    
  123| 000119 E9                          JMP    rts_raise_constraint_error 
  123| 00011A 00000000                                  
                       ;                                
                       lab4.op_mr.setmr   ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000296     DD     00000901 
                                          DD     00000074 
                                          DD     lab4.op_mr.setmr 
                                          DD     __lcl.00000305 
                                          DD     00000074 
                                          DD     lab4.op_mr.setmr+00000010H 
                                          DD     __lcl.00000305 
                                          DD     00000076 
                                          DD     lab4.op_mr.setmr+0000002CH 
                                          DD     __lcl.00000305 
                                          DD     00000077 
                                          DD     lab4.op_mr.setmr+00000046H 
                                          DD     __lcl.00000305 
                                          DD     00000078 
                                          DD     lab4.op_mr.setmr+00000057H 
                                          DD     __lcl.00000305 
                                          DD     00000079 
                                          DD     lab4.op_mr.setmr+000000C0H 
                                          DD     __lcl.00000305 
                                          DD     0000007A 
                                          DD     lab4.op_mr.setmr+000000D4H 
                                          DD     __lcl.00000305 
                                          DD     0000007B 
                                          DD     lab4.op_mr.setmr+000000E8H 
                                          DD     __lcl.00000305 
                                          DD     0000007B 
                                          DD     lab4.op_mr.setmr+0000011AH 
                                          DD     __lcl.00000305 
; ********* End of segment, Total Size = 112

                       ;                                
                       ;  Start of procedure lab4.op_mr.getmr   
                       ;                                
                                          PUBLIC lab4.op_mr.getmr 
                       lab4.op_mr.getmr   PROC   NEAR   
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
  125| 000010 8078                        CMP    BYTE PTR [EAX-13], 0 ;  OP_MR__elab_bool
  125| 000012 F3                                        
  125| 000013 00                                        
  125| 000014 75                          JNE    SHORT L18 
  125| 000015 0A                                        
  125| 000016 68                          PUSH   program_error 
  125| 000017 00000000                                  
  125| 00001B E8                          CALL   rts_raise 
  125| 00001C 00000000                                  
  125|                 L18:                             
;  Source Line # 127
  127| 000020 8B05                        MOV    EAX, package1.matr__constrained_array____1 
  127| 000022 00000000                                  
  127| 000026 2D                          SUB    EAX, 1 
  127| 000027 01000000                                  
  127| 00002B 7D                          JGE    SHORT L20 
  127| 00002C 03                                        
  127| 00002D 33C0                        XOR    EAX, EAX 
  127| 00002F 48                          DEC    EAX    
  127|                 L20:                             
  127| 000030 CE                          INTO          
  127| 000031 40                          INC    EAX    
  127| 000032 CE                          INTO          
  127| 000033 0FAF05                      IMUL   EAX, package1.matr__COMP_SU_SIZE 
  127| 000036 00000000                                  
  127| 00003A CE                          INTO          
  127| 00003B 8B5D                        MOV    EBX, [EBP+8] ;  po_access
  127| 00003D 08                                        
  127| 00003E 8B4D                        MOV    ECX, [EBP+12] ;  params
  127| 000040 0C                                        
  127| 000041 8B11                        MOV    EDX, [ECX+0] 
  127| 000043 50                          PUSH   EAX    
  127| 000044 8D5B                        LEA    EBX, [EBX+48] 
  127| 000046 30                                        
  127| 000047 53                          PUSH   EBX    
  127| 000048 52                          PUSH   EDX    
  127| 000049 E8                          CALL   _rts_block_move 
  127| 00004A 00000000                                  
  127| 00004E 8BE5                        MOV    ESP, EBP 
  127| 000050 5D                          POP    EBP    
  127| 000051 C2                          RET    8      
  127| 000052 0800                                      
                       ;                                
                       lab4.op_mr.getmr   ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000295     DD     00000401 
                                          DD     0000007D 
                                          DD     lab4.op_mr.getmr 
                                          DD     __lcl.00000305 
                                          DD     0000007D 
                                          DD     lab4.op_mr.getmr+0000000DH 
                                          DD     __lcl.00000305 
                                          DD     0000007F 
                                          DD     lab4.op_mr.getmr+00000020H 
                                          DD     __lcl.00000305 
                                          DD     0000007F 
                                          DD     lab4.op_mr.getmr+00000050H 
                                          DD     __lcl.00000305 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.t1__body   
                       ;                                
                                          PUBLIC lab4.t1__body 
                       lab4.t1__body      PROC   NEAR   
;  Source Line # 140
  140| 000000 64                          FS:           
  140| 000001 8B15                        MOV    EDX, 4 
  140| 000003 04000000                                  
  140| 000007 8B52                        MOV    EDX, [EDX-4] 
  140| 000009 FC                                        
  140| 00000A 55                          PUSH   EBP    
  140| 00000B 8BEC                        MOV    EBP, ESP 
  140| 00000D 83EC                        SUB    ESP, 72 
  140| 00000F 48                                        
;  Source Line # 142
  142| 000010 8B02                        MOV    EAX, [EDX+0] 
  142| 000012 8945                        MOV    [EBP-52], EAX ;  dyn_temp
  142| 000014 CC                                        
  142| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  142| 000017 00000000                                  
  142| 00001B 83EB                        SUB    EBX, 1 
  142| 00001D 01                                        
  142| 00001E 7D                          JGE    SHORT L33 
  142| 00001F 03                                        
  142| 000020 33DB                        XOR    EBX, EBX 
  142| 000022 4B                          DEC    EBX    
  142|                 L33:                             
  142| 000023 CE                          INTO          
  142| 000024 43                          INC    EBX    
  142| 000025 CE                          INTO          
  142| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  142| 000029 00000000                                  
  142| 00002D CE                          INTO          
  142| 00002E 53                          PUSH   EBX    
  142| 00002F 8955                        MOV    [EBP-72], EDX ; Spill
  142| 000031 B8                                        
  142| 000032 E8                          CALL   rts_ss_allocate 
  142| 000033 00000000                                  
  142| 000037 8945                        MOV    [EBP-48], EAX ;  MZ1
  142| 000039 D0                                        
  142| 00003A 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
  142| 00003C 00000000                                  
  142| 000040 83E9                        SUB    ECX, 1 
  142| 000042 01                                        
  142| 000043 7D                          JGE    SHORT L34 
  142| 000044 03                                        
  142| 000045 33C9                        XOR    ECX, ECX 
  142| 000047 49                          DEC    ECX    
  142|                 L34:                             
  142| 000048 CE                          INTO          
  142| 000049 41                          INC    ECX    
  142| 00004A CE                          INTO          
  142| 00004B 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  142| 00004E 00000000                                  
  142| 000052 CE                          INTO          
  142| 000053 51                          PUSH   ECX    
  142| 000054 E8                          CALL   rts_ss_allocate 
  142| 000055 00000000                                  
  142| 000059 8945                        MOV    [EBP-44], EAX ;  MR1
  142| 00005B D4                                        
;  Source Line # 143
  143| 00005C E8                          CALL   rts_activation_succeeded 
  143| 00005D 00000000                                  
;  Source Line # 144
  144| 000061 68                          PUSH   __lcl.00000170 
  144| 000062 00000000                                  
  144| 000066 68                          PUSH   __lcl.00000169 
  144| 000067 00000000                                  
  144| 00006B E8                          CALL   ada.text_io.put_line__2 
  144| 00006C 00000000                                  
;  Source Line # 146
  146| 000070 6A                          PUSH   0      
  146| 000071 00                                        
  146| 000072 6A                          PUSH   1      
  146| 000073 01                                        
  146| 000074 6A                          PUSH   0      
  146| 000075 00                                        
  146| 000076 8B55                        MOV    EDX, [EBP-72] ; Spill
  146| 000078 B8                                        
  146| 000079 8B72                        MOV    ESI, [EDX+48] 
  146| 00007B 30                                        
  146| 00007C 8DB6                        LEA    ESI, [ESI-508] ;  Synchro
  146| 00007E 04FEFFFF                                  
  146| 000082 56                          PUSH   ESI    
  146| 000083 E8                          CALL   rts_protected_entry_call 
  146| 000084 00000000                                  
;  Source Line # 148
  148| 000088 8D7D                        LEA    EDI, [EBP-40] 
  148| 00008A D8                                        
  148| 00008B 897D                        MOV    [EBP-36], EDI 
  148| 00008D DC                                        
  148| 00008E 68                          PUSH   lab4.op_alfa.getalfa 
  148| 00008F 00000000                                  
  148| 000093 8D5D                        LEA    EBX, [EBP-36] 
  148| 000095 DC                                        
  148| 000096 53                          PUSH   EBX    
  148| 000097 8B55                        MOV    EDX, [EBP-72] ; Spill
  148| 000099 B8                                        
  148| 00009A 8B4A                        MOV    ECX, [EDX+48] 
  148| 00009C 30                                        
  148| 00009D 8D89                        LEA    ECX, [ECX-428] ;  OP_alfa
  148| 00009F 54FEFFFF                                  
  148| 0000A3 51                          PUSH   ECX    
  148| 0000A4 E8                          CALL   rts_entryless_protected_subp_call 
  148| 0000A5 00000000                                  
  148| 0000A9 8B45                        MOV    EAX, [EBP-40] 
  148| 0000AB D8                                        
  148| 0000AC 8945                        MOV    [EBP-64], EAX ;  alfa1
  148| 0000AE C0                                        
;  Source Line # 149
  149| 0000AF 8B75                        MOV    ESI, [EBP-48] ;  MZ1
  149| 0000B1 D0                                        
  149| 0000B2 8975                        MOV    [EBP-32], ESI 
  149| 0000B4 E0                                        
  149| 0000B5 68                          PUSH   lab4.op_mz.getmz 
  149| 0000B6 00000000                                  
  149| 0000BA 8D7D                        LEA    EDI, [EBP-32] 
  149| 0000BC E0                                        
  149| 0000BD 57                          PUSH   EDI    
  149| 0000BE 8B55                        MOV    EDX, [EBP-72] ; Spill
  149| 0000C0 B8                                        
  149| 0000C1 8B5A                        MOV    EBX, [EDX+48] 
  149| 0000C3 30                                        
  149| 0000C4 8B8B                        MOV    ECX, [EBX-256] ;  OP_MZ
  149| 0000C6 00FFFFFF                                  
  149| 0000CA 51                          PUSH   ECX    
  149| 0000CB E8                          CALL   rts_entryless_protected_subp_call 
  149| 0000CC 00000000                                  
;  Source Line # 150
  150| 0000D0 8B45                        MOV    EAX, [EBP-44] ;  MR1
  150| 0000D2 D4                                        
  150| 0000D3 8945                        MOV    [EBP-28], EAX 
  150| 0000D5 E4                                        
  150| 0000D6 68                          PUSH   lab4.op_mr.getmr 
  150| 0000D7 00000000                                  
  150| 0000DB 8D75                        LEA    ESI, [EBP-28] 
  150| 0000DD E4                                        
  150| 0000DE 56                          PUSH   ESI    
  150| 0000DF 8B55                        MOV    EDX, [EBP-72] ; Spill
  150| 0000E1 B8                                        
  150| 0000E2 8B7A                        MOV    EDI, [EDX+48] 
  150| 0000E4 30                                        
  150| 0000E5 8B9F                        MOV    EBX, [EDI-188] ;  OP_MR
  150| 0000E7 44FFFFFF                                  
  150| 0000EB 53                          PUSH   EBX    
  150| 0000EC E8                          CALL   rts_entryless_protected_subp_call 
  150| 0000ED 00000000                                  
  150| 0000F1 8B0D                        MOV    ECX, package1.n 
  150| 0000F3 00000000                                  
  150| 0000F7 894D                        MOV    [EBP-24], ECX 
  150| 0000F9 E8                                        
;  Source Line # 152
  152| 0000FA 837D                        CMP    DWORD PTR [EBP-24], 0 
  152| 0000FC E8                                        
  152| 0000FD 00                                        
  152| 0000FE 0F8E                        JLE    L18    
  152| 000100 DF010000                                  
  152| 000104 C745                        MOV    DWORD PTR [EBP-20], 1 
  152| 000106 EC                                        
  152| 000107 01000000                                  
  152|                 L20:                             
  152| 00010B 8B05                        MOV    EAX, package1.h 
  152| 00010D 00000000                                  
  152| 000111 8945                        MOV    [EBP-16], EAX 
  152| 000113 F0                                        
;  Source Line # 153
  153| 000114 837D                        CMP    DWORD PTR [EBP-16], 0 
  153| 000116 F0                                        
  153| 000117 00                                        
  153| 000118 0F8E                        JLE    L21    
  153| 00011A B1010000                                  
  153| 00011E C745                        MOV    DWORD PTR [EBP-12], 1 
  153| 000120 F4                                        
  153| 000121 01000000                                  
  153|                 L23:                             
;  Source Line # 154
  154| 000125 C745                        MOV    DWORD PTR [EBP-60], 0 ;  Sum1
  154| 000127 C4                                        
  154| 000128 00000000                                  
;  Source Line # 155
  155| 00012C C745                        MOV    DWORD PTR [EBP-56], 0 ;  Sum2
  155| 00012E C8                                        
  155| 00012F 00000000                                  
  155| 000133 8B05                        MOV    EAX, package1.n 
  155| 000135 00000000                                  
  155| 000139 8945                        MOV    [EBP-8], EAX 
  155| 00013B F8                                        
;  Source Line # 156
  156| 00013C 837D                        CMP    DWORD PTR [EBP-8], 0 
  156| 00013E F8                                        
  156| 00013F 00                                        
  156| 000140 0F8E                        JLE    L24    
  156| 000142 1B010000                                  
  156| 000146 C745                        MOV    DWORD PTR [EBP-4], 1 
  156| 000148 FC                                        
  156| 000149 01000000                                  
  156|                 L26:                             
;  Source Line # 157
  157| 00014D 8B55                        MOV    EDX, [EBP-72] ; Spill
  157| 00014F B8                                        
  157| 000150 8B42                        MOV    EAX, [EDX+48] 
  157| 000152 30                                        
  157| 000153 8B98                        MOV    EBX, [EAX-364] ;  MB
  157| 000155 94FEFFFF                                  
  157| 000159 8B4D                        MOV    ECX, [EBP-4] 
  157| 00015B FC                                        
  157| 00015C 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  157| 00015E 00000000                                  
  157|                 L35:                             
  157| 000162 0F8F                        JG     L36    
  157| 000164 D2010000                                  
  157| 000168 8D49                        LEA    ECX, [ECX-1] 
  157| 00016A FF                                        
  157| 00016B 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  157| 00016E 00000000                                  
  157| 000172 8B75                        MOV    ESI, [EBP-12] 
  157| 000174 F4                                        
  157| 000175 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  157| 000177 00000000                                  
  157|                 L37:                             
  157| 00017B 0F8F                        JG     L38    
  157| 00017D C5010000                                  
  157| 000181 8D34B5                      LEA    ESI, [4*ESI-4] 
  157| 000184 FCFFFFFF                                  
  157| 000188 03CE                        ADD    ECX, ESI 
  157| 00018A 8B7D                        MOV    EDI, [EBP-48] ;  MZ1
  157| 00018C D0                                        
  157| 00018D 8B55                        MOV    EDX, [EBP-20] 
  157| 00018F EC                                        
  157| 000190 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  157| 000192 00000000                                  
  157|                 L39:                             
  157| 000196 0F8F                        JG     L40    
  157| 000198 B6010000                                  
  157| 00019C 8D52                        LEA    EDX, [EDX-1] 
  157| 00019E FF                                        
  157| 00019F 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  157| 0001A2 00000000                                  
  157| 0001A6 8B45                        MOV    EAX, [EBP-4] 
  157| 0001A8 FC                                        
  157| 0001A9 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  157| 0001AB 00000000                                  
  157|                 L41:                             
  157| 0001AF 0F8F                        JG     L42    
  157| 0001B1 A9010000                                  
  157| 0001B5 8D0485                      LEA    EAX, [4*EAX-4] 
  157| 0001B8 FCFFFFFF                                  
  157| 0001BC 03D0                        ADD    EDX, EAX 
  157| 0001BE 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  157| 0001C1 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  157| 0001C5 CE                          INTO          
  157| 0001C6 035D                        ADD    EBX, [EBP-60] ;  Sum1
  157| 0001C8 C4                                        
  157| 0001C9 CE                          INTO          
  157| 0001CA 895D                        MOV    [EBP-60], EBX ;  Sum1
  157| 0001CC C4                                        
;  Source Line # 158
  158| 0001CD 8B55                        MOV    EDX, [EBP-72] ; Spill
  158| 0001CF B8                                        
  158| 0001D0 8B72                        MOV    ESI, [EDX+48] 
  158| 0001D2 30                                        
  158| 0001D3 8B8E                        MOV    ECX, [ESI-356] ;  ME
  158| 0001D5 9CFEFFFF                                  
  158| 0001D9 8B7D                        MOV    EDI, [EBP-4] 
  158| 0001DB FC                                        
  158| 0001DC 3B3D                        CMP    EDI, package1.matr__constrained_array____1 
  158| 0001DE 00000000                                  
  158|                 L43:                             
  158| 0001E2 0F8F                        JG     L44    
  158| 0001E4 82010000                                  
  158| 0001E8 8D7F                        LEA    EDI, [EDI-1] 
  158| 0001EA FF                                        
  158| 0001EB 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
  158| 0001EE 00000000                                  
  158| 0001F2 8B45                        MOV    EAX, [EBP-12] 
  158| 0001F4 F4                                        
  158| 0001F5 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  158| 0001F7 00000000                                  
  158|                 L45:                             
  158| 0001FB 0F8F                        JG     L46    
  158| 0001FD 75010000                                  
  158| 000201 8D0485                      LEA    EAX, [4*EAX-4] 
  158| 000204 FCFFFFFF                                  
  158| 000208 03F8                        ADD    EDI, EAX 
  158| 00020A 8B5D                        MOV    EBX, [EBP-44] ;  MR1
  158| 00020C D4                                        
  158| 00020D 8B55                        MOV    EDX, [EBP-20] 
  158| 00020F EC                                        
  158| 000210 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  158| 000212 00000000                                  
  158|                 L47:                             
  158| 000216 0F8F                        JG     L48    
  158| 000218 66010000                                  
  158| 00021C 8D52                        LEA    EDX, [EDX-1] 
  158| 00021E FF                                        
  158| 00021F 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  158| 000222 00000000                                  
  158| 000226 8B75                        MOV    ESI, [EBP-4] 
  158| 000228 FC                                        
  158| 000229 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  158| 00022B 00000000                                  
  158|                 L49:                             
  158| 00022F 0F8F                        JG     L50    
  158| 000231 59010000                                  
  158| 000235 8D34B5                      LEA    ESI, [4*ESI-4] 
  158| 000238 FCFFFFFF                                  
  158| 00023C 03D6                        ADD    EDX, ESI 
  158| 00023E 8B0C39                      MOV    ECX, [ECX+EDI+0] 
  158| 000241 0FAF0C13                    IMUL   ECX, [EBX+EDX+0] 
  158| 000245 CE                          INTO          
  158| 000246 034D                        ADD    ECX, [EBP-56] ;  Sum2
  158| 000248 C8                                        
  158| 000249 CE                          INTO          
  158| 00024A 894D                        MOV    [EBP-56], ECX ;  Sum2
  158| 00024C C8                                        
;  Source Line # 159
  159| 00024D 8B45                        MOV    EAX, [EBP-8] 
  159| 00024F F8                                        
  159| 000250 3945                        CMP    [EBP-4], EAX 
  159| 000252 FC                                        
  159| 000253 74                          JE     SHORT L24 
  159| 000254 0C                                        
  159| 000255 8B45                        MOV    EAX, [EBP-4] 
  159| 000257 FC                                        
  159| 000258 40                          INC    EAX    
  159| 000259 8945                        MOV    [EBP-4], EAX 
  159| 00025B FC                                        
  159| 00025C E9                          JMP    L26    
  159| 00025D ECFEFFFF                                  
  159|                 L24:                             
;  Source Line # 160
  160| 000261 8B45                        MOV    EAX, [EBP-60] ;  Sum1
  160| 000263 C4                                        
  160| 000264 0FAF45                      IMUL   EAX, [EBP-64] ;  alfa1
  160| 000267 C0                                        
  160| 000268 CE                          INTO          
  160| 000269 0345                        ADD    EAX, [EBP-56] ;  Sum2
  160| 00026B C8                                        
  160| 00026C CE                          INTO          
  160| 00026D 8B55                        MOV    EDX, [EBP-72] ; Spill
  160| 00026F B8                                        
  160| 000270 8B5A                        MOV    EBX, [EDX+48] 
  160| 000272 30                                        
  160| 000273 8B8B                        MOV    ECX, [EBX-368] ;  MA
  160| 000275 90FEFFFF                                  
  160| 000279 8B75                        MOV    ESI, [EBP-20] 
  160| 00027B EC                                        
  160| 00027C 3B35                        CMP    ESI, package1.matr__constrained_array____1 
  160| 00027E 00000000                                  
  160|                 L51:                             
  160| 000282 0F8F                        JG     L52    
  160| 000284 12010000                                  
  160| 000288 8D76                        LEA    ESI, [ESI-1] 
  160| 00028A FF                                        
  160| 00028B 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  160| 00028E 00000000                                  
  160| 000292 8B7D                        MOV    EDI, [EBP-12] 
  160| 000294 F4                                        
  160| 000295 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  160| 000297 00000000                                  
  160|                 L53:                             
  160| 00029B 0F8F                        JG     L54    
  160| 00029D 05010000                                  
  160| 0002A1 8D3CBD                      LEA    EDI, [4*EDI-4] 
  160| 0002A4 FCFFFFFF                                  
  160| 0002A8 03F7                        ADD    ESI, EDI 
  160| 0002AA 890431                      MOV    [ECX+ESI+0], EAX 
;  Source Line # 161
  161| 0002AD C745                        MOV    DWORD PTR [EBP-60], 0 ;  Sum1
  161| 0002AF C4                                        
  161| 0002B0 00000000                                  
;  Source Line # 162
  162| 0002B4 C745                        MOV    DWORD PTR [EBP-56], 0 ;  Sum2
  162| 0002B6 C8                                        
  162| 0002B7 00000000                                  
;  Source Line # 163
  163| 0002BB 8B45                        MOV    EAX, [EBP-16] 
  163| 0002BD F0                                        
  163| 0002BE 3945                        CMP    [EBP-12], EAX 
  163| 0002C0 F4                                        
  163| 0002C1 74                          JE     SHORT L21 
  163| 0002C2 0C                                        
  163| 0002C3 8B45                        MOV    EAX, [EBP-12] 
  163| 0002C5 F4                                        
  163| 0002C6 40                          INC    EAX    
  163| 0002C7 8945                        MOV    [EBP-12], EAX 
  163| 0002C9 F4                                        
  163| 0002CA E9                          JMP    L23    
  163| 0002CB 56FEFFFF                                  
  163|                 L21:                             
;  Source Line # 164
  164| 0002CF 8B45                        MOV    EAX, [EBP-24] 
  164| 0002D1 E8                                        
  164| 0002D2 3945                        CMP    [EBP-20], EAX 
  164| 0002D4 EC                                        
  164| 0002D5 74                          JE     SHORT L18 
  164| 0002D6 0C                                        
  164| 0002D7 8B45                        MOV    EAX, [EBP-20] 
  164| 0002D9 EC                                        
  164| 0002DA 40                          INC    EAX    
  164| 0002DB 8945                        MOV    [EBP-20], EAX 
  164| 0002DD EC                                        
  164| 0002DE E9                          JMP    L20    
  164| 0002DF 28FEFFFF                                  
  164|                 L18:                             
;  Source Line # 166
  166| 0002E3 6A                          PUSH   0      
  166| 0002E4 00                                        
  166| 0002E5 6A                          PUSH   0      
  166| 0002E6 00                                        
  166| 0002E7 6A                          PUSH   0      
  166| 0002E8 00                                        
  166| 0002E9 8B55                        MOV    EDX, [EBP-72] ; Spill
  166| 0002EB B8                                        
  166| 0002EC 8B42                        MOV    EAX, [EDX+48] 
  166| 0002EE 30                                        
  166| 0002EF 8D80                        LEA    EAX, [EAX-508] ;  Synchro
  166| 0002F1 04FEFFFF                                  
  166| 0002F5 50                          PUSH   EAX    
  166| 0002F6 E8                          CALL   rts_protected_entry_call 
  166| 0002F7 00000000                                  
;  Source Line # 168
  168| 0002FB 68                          PUSH   __lcl.00000190 
  168| 0002FC 00000000                                  
  168| 000300 68                          PUSH   __lcl.00000189 
  168| 000301 00000000                                  
  168| 000305 E8                          CALL   ada.text_io.put_line__2 
  168| 000306 00000000                                  
;  Source Line # 169
  169| 00030A 8B55                        MOV    EDX, [EBP-72] ; Spill
  169| 00030C B8                                        
  169| 00030D 8B5A                        MOV    EBX, [EDX+48] 
  169| 00030F 30                                        
  169| 000310 8B8B                        MOV    ECX, [EBX-368] ;  MA
  169| 000312 90FEFFFF                                  
  169| 000316 51                          PUSH   ECX    
  169| 000317 E8                          CALL   package1.matr_print 
  169| 000318 00000000                                  
;  Source Line # 170
  170| 00031C 68                          PUSH   __lcl.00000192 
  170| 00031D 00000000                                  
  170| 000321 68                          PUSH   __lcl.00000191 
  170| 000322 00000000                                  
  170| 000326 E8                          CALL   ada.text_io.put_line__2 
  170| 000327 00000000                                  
  170| 00032B 8D75                        LEA    ESI, [EBP-52] ;  dyn_temp
  170| 00032D CC                                        
  170| 00032E 56                          PUSH   ESI    
  170| 00032F E8                          CALL   rts_ss_release 
  170| 000330 00000000                                  
;  Source Line # 171
  171| 000334 8BE5                        MOV    ESP, EBP 
  171| 000336 5D                          POP    EBP    
  171| 000337 C2                          RET    4      
  171| 000338 0400                                      
  171|                 L36:                             
  171| 00033A 8D05                        LEA    EAX, L35+5 
  171| 00033C 67010000                                  
  171| 000340 50                          PUSH   EAX    
  171| 000341 E9                          JMP    rts_raise_constraint_error 
  171| 000342 00000000                                  
  171|                 L38:                             
  171| 000346 8D05                        LEA    EAX, L37+5 
  171| 000348 80010000                                  
  171| 00034C 50                          PUSH   EAX    
  171| 00034D E9                          JMP    rts_raise_constraint_error 
  171| 00034E 00000000                                  
  171|                 L40:                             
  171| 000352 8D05                        LEA    EAX, L39+5 
  171| 000354 9B010000                                  
  171| 000358 50                          PUSH   EAX    
  171| 000359 E9                          JMP    rts_raise_constraint_error 
  171| 00035A 00000000                                  
  171|                 L42:                             
  171| 00035E 8D05                        LEA    EAX, L41+5 
  171| 000360 B4010000                                  
  171| 000364 50                          PUSH   EAX    
  171| 000365 E9                          JMP    rts_raise_constraint_error 
  171| 000366 00000000                                  
  171|                 L44:                             
  171| 00036A 8D05                        LEA    EAX, L43+5 
  171| 00036C E7010000                                  
  171| 000370 50                          PUSH   EAX    
  171| 000371 E9                          JMP    rts_raise_constraint_error 
  171| 000372 00000000                                  
  171|                 L46:                             
  171| 000376 8D05                        LEA    EAX, L45+5 
  171| 000378 00020000                                  
  171| 00037C 50                          PUSH   EAX    
  171| 00037D E9                          JMP    rts_raise_constraint_error 
  171| 00037E 00000000                                  
  171|                 L48:                             
  171| 000382 8D05                        LEA    EAX, L47+5 
  171| 000384 1B020000                                  
  171| 000388 50                          PUSH   EAX    
  171| 000389 E9                          JMP    rts_raise_constraint_error 
  171| 00038A 00000000                                  
  171|                 L50:                             
  171| 00038E 8D05                        LEA    EAX, L49+5 
  171| 000390 34020000                                  
  171| 000394 50                          PUSH   EAX    
  171| 000395 E9                          JMP    rts_raise_constraint_error 
  171| 000396 00000000                                  
  171|                 L52:                             
  171| 00039A 8D05                        LEA    EAX, L51+5 
  171| 00039C 87020000                                  
  171| 0003A0 50                          PUSH   EAX    
  171| 0003A1 E9                          JMP    rts_raise_constraint_error 
  171| 0003A2 00000000                                  
  171|                 L54:                             
  171| 0003A6 8D05                        LEA    EAX, L53+5 
  171| 0003A8 A0020000                                  
  171| 0003AC 50                          PUSH   EAX    
  171| 0003AD E9                          JMP    rts_raise_constraint_error 
  171| 0003AE 00000000                                  
                       ;                                
                       lab4.t1__body      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000294     DD     00001B01 
                                          DD     0000008C 
                                          DD     lab4.t1__body 
                                          DD     __lcl.00000305 
                                          DD     0000008E 
                                          DD     lab4.t1__body+00000010H 
                                          DD     __lcl.00000305 
                                          DD     0000008F 
                                          DD     lab4.t1__body+0000005CH 
                                          DD     __lcl.00000305 
                                          DD     00000090 
                                          DD     lab4.t1__body+00000061H 
                                          DD     __lcl.00000305 
                                          DD     00000092 
                                          DD     lab4.t1__body+00000070H 
                                          DD     __lcl.00000305 
                                          DD     00000094 
                                          DD     lab4.t1__body+00000088H 
                                          DD     __lcl.00000305 
                                          DD     00000095 
                                          DD     lab4.t1__body+000000AFH 
                                          DD     __lcl.00000305 
                                          DD     00000096 
                                          DD     lab4.t1__body+000000D0H 
                                          DD     __lcl.00000305 
                                          DD     00000098 
                                          DD     lab4.t1__body+000000FAH 
                                          DD     __lcl.00000305 
                                          DD     00000099 
                                          DD     lab4.t1__body+00000114H 
                                          DD     __lcl.00000305 
                                          DD     0000009A 
                                          DD     lab4.t1__body+00000125H 
                                          DD     __lcl.00000305 
                                          DD     0000009B 
                                          DD     lab4.t1__body+0000012CH 
                                          DD     __lcl.00000305 
                                          DD     0000009C 
                                          DD     lab4.t1__body+0000013CH 
                                          DD     __lcl.00000305 
                                          DD     0000009D 
                                          DD     lab4.t1__body+0000014DH 
                                          DD     __lcl.00000305 
                                          DD     0000009E 
                                          DD     lab4.t1__body+000001CDH 
                                          DD     __lcl.00000305 
                                          DD     0000009F 
                                          DD     lab4.t1__body+0000024DH 
                                          DD     __lcl.00000305 
                                          DD     000000A0 
                                          DD     lab4.t1__body+00000261H 
                                          DD     __lcl.00000305 
                                          DD     000000A1 
                                          DD     lab4.t1__body+000002ADH 
                                          DD     __lcl.00000305 
                                          DD     000000A2 
                                          DD     lab4.t1__body+000002B4H 
                                          DD     __lcl.00000305 
                                          DD     000000A3 
                                          DD     lab4.t1__body+000002BBH 
                                          DD     __lcl.00000305 
                                          DD     000000A4 
                                          DD     lab4.t1__body+000002CFH 
                                          DD     __lcl.00000305 
                                          DD     000000A6 
                                          DD     lab4.t1__body+000002E3H 
                                          DD     __lcl.00000305 
                                          DD     000000A8 
                                          DD     lab4.t1__body+000002FBH 
                                          DD     __lcl.00000305 
                                          DD     000000A9 
                                          DD     lab4.t1__body+0000030AH 
                                          DD     __lcl.00000305 
                                          DD     000000AA 
                                          DD     lab4.t1__body+0000031CH 
                                          DD     __lcl.00000305 
                                          DD     000000AB 
                                          DD     lab4.t1__body+00000334H 
                                          DD     __lcl.00000305 
                                          DD     000000AB 
                                          DD     lab4.t1__body+000003AEH 
                                          DD     __lcl.00000305 
; ********* End of segment, Total Size = 328

                       ;                                
                       ;  Start of procedure lab4.t2__body   
                       ;                                
                                          PUBLIC lab4.t2__body 
                       lab4.t2__body      PROC   NEAR   
;  Source Line # 174
  174| 000000 64                          FS:           
  174| 000001 8B15                        MOV    EDX, 4 
  174| 000003 04000000                                  
  174| 000007 8B52                        MOV    EDX, [EDX-4] 
  174| 000009 FC                                        
  174| 00000A 55                          PUSH   EBP    
  174| 00000B 8BEC                        MOV    EBP, ESP 
  174| 00000D 83EC                        SUB    ESP, 76 
  174| 00000F 4C                                        
;  Source Line # 176
  176| 000010 8B02                        MOV    EAX, [EDX+0] 
  176| 000012 8945                        MOV    [EBP-56], EAX ;  dyn_temp
  176| 000014 C8                                        
  176| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  176| 000017 00000000                                  
  176| 00001B 83EB                        SUB    EBX, 1 
  176| 00001D 01                                        
  176| 00001E 7D                          JGE    SHORT L33 
  176| 00001F 03                                        
  176| 000020 33DB                        XOR    EBX, EBX 
  176| 000022 4B                          DEC    EBX    
  176|                 L33:                             
  176| 000023 CE                          INTO          
  176| 000024 43                          INC    EBX    
  176| 000025 CE                          INTO          
  176| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  176| 000029 00000000                                  
  176| 00002D CE                          INTO          
  176| 00002E 53                          PUSH   EBX    
  176| 00002F 8955                        MOV    [EBP-76], EDX ; Spill
  176| 000031 B4                                        
  176| 000032 E8                          CALL   rts_ss_allocate 
  176| 000033 00000000                                  
  176| 000037 8945                        MOV    [EBP-52], EAX ;  MZ2
  176| 000039 CC                                        
  176| 00003A 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
  176| 00003C 00000000                                  
  176| 000040 83E9                        SUB    ECX, 1 
  176| 000042 01                                        
  176| 000043 7D                          JGE    SHORT L34 
  176| 000044 03                                        
  176| 000045 33C9                        XOR    ECX, ECX 
  176| 000047 49                          DEC    ECX    
  176|                 L34:                             
  176| 000048 CE                          INTO          
  176| 000049 41                          INC    ECX    
  176| 00004A CE                          INTO          
  176| 00004B 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  176| 00004E 00000000                                  
  176| 000052 CE                          INTO          
  176| 000053 51                          PUSH   ECX    
  176| 000054 E8                          CALL   rts_ss_allocate 
  176| 000055 00000000                                  
  176| 000059 8945                        MOV    [EBP-48], EAX ;  MR2
  176| 00005B D0                                        
;  Source Line # 177
  177| 00005C E8                          CALL   rts_activation_succeeded 
  177| 00005D 00000000                                  
;  Source Line # 178
  178| 000061 68                          PUSH   __lcl.00000201 
  178| 000062 00000000                                  
  178| 000066 68                          PUSH   __lcl.00000200 
  178| 000067 00000000                                  
  178| 00006B E8                          CALL   ada.text_io.put_line__2 
  178| 00006C 00000000                                  
;  Source Line # 180
  180| 000070 6A                          PUSH   0      
  180| 000071 00                                        
  180| 000072 6A                          PUSH   1      
  180| 000073 01                                        
  180| 000074 6A                          PUSH   0      
  180| 000075 00                                        
  180| 000076 8B55                        MOV    EDX, [EBP-76] ; Spill
  180| 000078 B4                                        
  180| 000079 8B72                        MOV    ESI, [EDX+48] 
  180| 00007B 30                                        
  180| 00007C 8DB6                        LEA    ESI, [ESI-508] ;  Synchro
  180| 00007E 04FEFFFF                                  
  180| 000082 56                          PUSH   ESI    
  180| 000083 E8                          CALL   rts_protected_entry_call 
  180| 000084 00000000                                  
;  Source Line # 182
  182| 000088 8D7D                        LEA    EDI, [EBP-44] 
  182| 00008A D4                                        
  182| 00008B 897D                        MOV    [EBP-40], EDI 
  182| 00008D D8                                        
  182| 00008E 68                          PUSH   lab4.op_alfa.getalfa 
  182| 00008F 00000000                                  
  182| 000093 8D5D                        LEA    EBX, [EBP-40] 
  182| 000095 D8                                        
  182| 000096 53                          PUSH   EBX    
  182| 000097 8B55                        MOV    EDX, [EBP-76] ; Spill
  182| 000099 B4                                        
  182| 00009A 8B4A                        MOV    ECX, [EDX+48] 
  182| 00009C 30                                        
  182| 00009D 8D89                        LEA    ECX, [ECX-428] ;  OP_alfa
  182| 00009F 54FEFFFF                                  
  182| 0000A3 51                          PUSH   ECX    
  182| 0000A4 E8                          CALL   rts_entryless_protected_subp_call 
  182| 0000A5 00000000                                  
  182| 0000A9 8B45                        MOV    EAX, [EBP-44] 
  182| 0000AB D4                                        
  182| 0000AC 8945                        MOV    [EBP-68], EAX ;  alfa2
  182| 0000AE BC                                        
;  Source Line # 183
  183| 0000AF 8B75                        MOV    ESI, [EBP-52] ;  MZ2
  183| 0000B1 CC                                        
  183| 0000B2 8975                        MOV    [EBP-36], ESI 
  183| 0000B4 DC                                        
  183| 0000B5 68                          PUSH   lab4.op_mz.getmz 
  183| 0000B6 00000000                                  
  183| 0000BA 8D7D                        LEA    EDI, [EBP-36] 
  183| 0000BC DC                                        
  183| 0000BD 57                          PUSH   EDI    
  183| 0000BE 8B55                        MOV    EDX, [EBP-76] ; Spill
  183| 0000C0 B4                                        
  183| 0000C1 8B5A                        MOV    EBX, [EDX+48] 
  183| 0000C3 30                                        
  183| 0000C4 8B8B                        MOV    ECX, [EBX-256] ;  OP_MZ
  183| 0000C6 00FFFFFF                                  
  183| 0000CA 51                          PUSH   ECX    
  183| 0000CB E8                          CALL   rts_entryless_protected_subp_call 
  183| 0000CC 00000000                                  
;  Source Line # 184
  184| 0000D0 8B45                        MOV    EAX, [EBP-48] ;  MR2
  184| 0000D2 D0                                        
  184| 0000D3 8945                        MOV    [EBP-32], EAX 
  184| 0000D5 E0                                        
  184| 0000D6 68                          PUSH   lab4.op_mr.getmr 
  184| 0000D7 00000000                                  
  184| 0000DB 8D75                        LEA    ESI, [EBP-32] 
  184| 0000DD E0                                        
  184| 0000DE 56                          PUSH   ESI    
  184| 0000DF 8B55                        MOV    EDX, [EBP-76] ; Spill
  184| 0000E1 B4                                        
  184| 0000E2 8B7A                        MOV    EDI, [EDX+48] 
  184| 0000E4 30                                        
  184| 0000E5 8B9F                        MOV    EBX, [EDI-188] ;  OP_MR
  184| 0000E7 44FFFFFF                                  
  184| 0000EB 53                          PUSH   EBX    
  184| 0000EC E8                          CALL   rts_entryless_protected_subp_call 
  184| 0000ED 00000000                                  
  184| 0000F1 8B0D                        MOV    ECX, package1.n 
  184| 0000F3 00000000                                  
  184| 0000F7 894D                        MOV    [EBP-28], ECX 
  184| 0000F9 E4                                        
;  Source Line # 186
  186| 0000FA 837D                        CMP    DWORD PTR [EBP-28], 0 
  186| 0000FC E4                                        
  186| 0000FD 00                                        
  186| 0000FE 0F8E                        JLE    L18    
  186| 000100 00020000                                  
  186| 000104 C745                        MOV    DWORD PTR [EBP-24], 1 
  186| 000106 E8                                        
  186| 000107 01000000                                  
  186|                 L20:                             
  186| 00010B 8B05                        MOV    EAX, package1.h 
  186| 00010D 00000000                                  
  186| 000111 40                          INC    EAX    
  186| 000112 CE                          INTO          
  186| 000113 8945                        MOV    [EBP-20], EAX 
  186| 000115 EC                                        
  186| 000116 8B1D                        MOV    EBX, package1.h 
  186| 000118 00000000                                  
  186| 00011C D1E3                        SHL    EBX, 1 
  186| 00011E CE                          INTO          
  186| 00011F 895D                        MOV    [EBP-16], EBX 
  186| 000121 F0                                        
;  Source Line # 187
  187| 000122 8B4D                        MOV    ECX, [EBP-16] 
  187| 000124 F0                                        
  187| 000125 394D                        CMP    [EBP-20], ECX 
  187| 000127 EC                                        
  187| 000128 0F8F                        JG     L21    
  187| 00012A C2010000                                  
  187| 00012E 8B45                        MOV    EAX, [EBP-20] 
  187| 000130 EC                                        
  187| 000131 8945                        MOV    [EBP-12], EAX 
  187| 000133 F4                                        
  187|                 L23:                             
;  Source Line # 188
  188| 000134 C745                        MOV    DWORD PTR [EBP-64], 0 ;  Sum1
  188| 000136 C0                                        
  188| 000137 00000000                                  
;  Source Line # 189
  189| 00013B C745                        MOV    DWORD PTR [EBP-60], 0 ;  Sum2
  189| 00013D C4                                        
  189| 00013E 00000000                                  
  189| 000142 8B05                        MOV    EAX, package1.n 
  189| 000144 00000000                                  
  189| 000148 8945                        MOV    [EBP-8], EAX 
  189| 00014A F8                                        
;  Source Line # 190
  190| 00014B 837D                        CMP    DWORD PTR [EBP-8], 0 
  190| 00014D F8                                        
  190| 00014E 00                                        
  190| 00014F 0F8E                        JLE    L24    
  190| 000151 24010000                                  
  190| 000155 C745                        MOV    DWORD PTR [EBP-4], 1 
  190| 000157 FC                                        
  190| 000158 01000000                                  
  190|                 L26:                             
;  Source Line # 191
  191| 00015C 8B55                        MOV    EDX, [EBP-76] ; Spill
  191| 00015E B4                                        
  191| 00015F 8B42                        MOV    EAX, [EDX+48] 
  191| 000161 30                                        
  191| 000162 8B98                        MOV    EBX, [EAX-364] ;  MB
  191| 000164 94FEFFFF                                  
  191| 000168 8B4D                        MOV    ECX, [EBP-4] 
  191| 00016A FC                                        
  191| 00016B 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  191| 00016D 00000000                                  
  191|                 L35:                             
  191| 000171 0F8F                        JG     L36    
  191| 000173 C4010000                                  
  191| 000177 8D49                        LEA    ECX, [ECX-1] 
  191| 000179 FF                                        
  191| 00017A 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  191| 00017D 00000000                                  
  191| 000181 8B75                        MOV    ESI, [EBP-12] 
  191| 000183 F4                                        
  191| 000184 83FE                        CMP    ESI, 1 
  191| 000186 01                                        
  191|                 L37:                             
  191| 000187 0F8C                        JL     L38    
  191| 000189 BA010000                                  
  191| 00018D 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  191| 00018F 00000000                                  
  191| 000193 0F8F                        JG     L38    
  191| 000195 AE010000                                  
  191| 000199 8D34B5                      LEA    ESI, [4*ESI-4] 
  191| 00019C FCFFFFFF                                  
  191| 0001A0 03CE                        ADD    ECX, ESI 
  191| 0001A2 8B7D                        MOV    EDI, [EBP-52] ;  MZ2
  191| 0001A4 CC                                        
  191| 0001A5 8B55                        MOV    EDX, [EBP-24] 
  191| 0001A7 E8                                        
  191| 0001A8 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  191| 0001AA 00000000                                  
  191|                 L39:                             
  191| 0001AE 0F8F                        JG     L40    
  191| 0001B0 9F010000                                  
  191| 0001B4 8D52                        LEA    EDX, [EDX-1] 
  191| 0001B6 FF                                        
  191| 0001B7 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  191| 0001BA 00000000                                  
  191| 0001BE 8B45                        MOV    EAX, [EBP-4] 
  191| 0001C0 FC                                        
  191| 0001C1 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  191| 0001C3 00000000                                  
  191|                 L41:                             
  191| 0001C7 0F8F                        JG     L42    
  191| 0001C9 92010000                                  
  191| 0001CD 8D0485                      LEA    EAX, [4*EAX-4] 
  191| 0001D0 FCFFFFFF                                  
  191| 0001D4 03D0                        ADD    EDX, EAX 
  191| 0001D6 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  191| 0001D9 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  191| 0001DD CE                          INTO          
  191| 0001DE 035D                        ADD    EBX, [EBP-64] ;  Sum1
  191| 0001E0 C0                                        
  191| 0001E1 CE                          INTO          
  191| 0001E2 895D                        MOV    [EBP-64], EBX ;  Sum1
  191| 0001E4 C0                                        
;  Source Line # 192
  192| 0001E5 8B55                        MOV    EDX, [EBP-76] ; Spill
  192| 0001E7 B4                                        
  192| 0001E8 8B72                        MOV    ESI, [EDX+48] 
  192| 0001EA 30                                        
  192| 0001EB 8B8E                        MOV    ECX, [ESI-356] ;  ME
  192| 0001ED 9CFEFFFF                                  
  192| 0001F1 8B7D                        MOV    EDI, [EBP-4] 
  192| 0001F3 FC                                        
  192| 0001F4 3B3D                        CMP    EDI, package1.matr__constrained_array____1 
  192| 0001F6 00000000                                  
  192|                 L43:                             
  192| 0001FA 0F8F                        JG     L44    
  192| 0001FC 6B010000                                  
  192| 000200 8D7F                        LEA    EDI, [EDI-1] 
  192| 000202 FF                                        
  192| 000203 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
  192| 000206 00000000                                  
  192| 00020A 8B45                        MOV    EAX, [EBP-12] 
  192| 00020C F4                                        
  192| 00020D 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  192| 00020F 00000000                                  
  192|                 L45:                             
  192| 000213 0F8F                        JG     L46    
  192| 000215 5E010000                                  
  192| 000219 8D0485                      LEA    EAX, [4*EAX-4] 
  192| 00021C FCFFFFFF                                  
  192| 000220 03F8                        ADD    EDI, EAX 
  192| 000222 8B5D                        MOV    EBX, [EBP-48] ;  MR2
  192| 000224 D0                                        
  192| 000225 8B55                        MOV    EDX, [EBP-24] 
  192| 000227 E8                                        
  192| 000228 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  192| 00022A 00000000                                  
  192|                 L47:                             
  192| 00022E 0F8F                        JG     L48    
  192| 000230 4F010000                                  
  192| 000234 8D52                        LEA    EDX, [EDX-1] 
  192| 000236 FF                                        
  192| 000237 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  192| 00023A 00000000                                  
  192| 00023E 8B75                        MOV    ESI, [EBP-4] 
  192| 000240 FC                                        
  192| 000241 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  192| 000243 00000000                                  
  192|                 L49:                             
  192| 000247 0F8F                        JG     L50    
  192| 000249 42010000                                  
  192| 00024D 8D34B5                      LEA    ESI, [4*ESI-4] 
  192| 000250 FCFFFFFF                                  
  192| 000254 03D6                        ADD    EDX, ESI 
  192| 000256 8B0C39                      MOV    ECX, [ECX+EDI+0] 
  192| 000259 0FAF0C13                    IMUL   ECX, [EBX+EDX+0] 
  192| 00025D CE                          INTO          
  192| 00025E 034D                        ADD    ECX, [EBP-60] ;  Sum2
  192| 000260 C4                                        
  192| 000261 CE                          INTO          
  192| 000262 894D                        MOV    [EBP-60], ECX ;  Sum2
  192| 000264 C4                                        
;  Source Line # 193
  193| 000265 8B45                        MOV    EAX, [EBP-8] 
  193| 000267 F8                                        
  193| 000268 3945                        CMP    [EBP-4], EAX 
  193| 00026A FC                                        
  193| 00026B 74                          JE     SHORT L24 
  193| 00026C 0C                                        
  193| 00026D 8B45                        MOV    EAX, [EBP-4] 
  193| 00026F FC                                        
  193| 000270 40                          INC    EAX    
  193| 000271 8945                        MOV    [EBP-4], EAX 
  193| 000273 FC                                        
  193| 000274 E9                          JMP    L26    
  193| 000275 E3FEFFFF                                  
  193|                 L24:                             
;  Source Line # 194
  194| 000279 8B45                        MOV    EAX, [EBP-64] ;  Sum1
  194| 00027B C0                                        
  194| 00027C 0FAF45                      IMUL   EAX, [EBP-68] ;  alfa2
  194| 00027F BC                                        
  194| 000280 CE                          INTO          
  194| 000281 0345                        ADD    EAX, [EBP-60] ;  Sum2
  194| 000283 C4                                        
  194| 000284 CE                          INTO          
  194| 000285 8B55                        MOV    EDX, [EBP-76] ; Spill
  194| 000287 B4                                        
  194| 000288 8B5A                        MOV    EBX, [EDX+48] 
  194| 00028A 30                                        
  194| 00028B 8B8B                        MOV    ECX, [EBX-368] ;  MA
  194| 00028D 90FEFFFF                                  
  194| 000291 8B75                        MOV    ESI, [EBP-24] 
  194| 000293 E8                                        
  194| 000294 3B35                        CMP    ESI, package1.matr__constrained_array____1 
  194| 000296 00000000                                  
  194|                 L51:                             
  194| 00029A 0F8F                        JG     L52    
  194| 00029C FB000000                                  
  194| 0002A0 8D76                        LEA    ESI, [ESI-1] 
  194| 0002A2 FF                                        
  194| 0002A3 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  194| 0002A6 00000000                                  
  194| 0002AA 8B7D                        MOV    EDI, [EBP-12] 
  194| 0002AC F4                                        
  194| 0002AD 83FF                        CMP    EDI, 1 
  194| 0002AF 01                                        
  194|                 L53:                             
  194| 0002B0 0F8C                        JL     L54    
  194| 0002B2 F1000000                                  
  194| 0002B6 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  194| 0002B8 00000000                                  
  194| 0002BC 0F8F                        JG     L54    
  194| 0002BE E5000000                                  
  194| 0002C2 8D3CBD                      LEA    EDI, [4*EDI-4] 
  194| 0002C5 FCFFFFFF                                  
  194| 0002C9 03F7                        ADD    ESI, EDI 
  194| 0002CB 890431                      MOV    [ECX+ESI+0], EAX 
;  Source Line # 195
  195| 0002CE C745                        MOV    DWORD PTR [EBP-64], 0 ;  Sum1
  195| 0002D0 C0                                        
  195| 0002D1 00000000                                  
;  Source Line # 196
  196| 0002D5 C745                        MOV    DWORD PTR [EBP-60], 0 ;  Sum2
  196| 0002D7 C4                                        
  196| 0002D8 00000000                                  
;  Source Line # 197
  197| 0002DC 8B45                        MOV    EAX, [EBP-16] 
  197| 0002DE F0                                        
  197| 0002DF 3945                        CMP    [EBP-12], EAX 
  197| 0002E1 F4                                        
  197| 0002E2 74                          JE     SHORT L21 
  197| 0002E3 0C                                        
  197| 0002E4 8B45                        MOV    EAX, [EBP-12] 
  197| 0002E6 F4                                        
  197| 0002E7 40                          INC    EAX    
  197| 0002E8 8945                        MOV    [EBP-12], EAX 
  197| 0002EA F4                                        
  197| 0002EB E9                          JMP    L23    
  197| 0002EC 44FEFFFF                                  
  197|                 L21:                             
;  Source Line # 198
  198| 0002F0 8B45                        MOV    EAX, [EBP-28] 
  198| 0002F2 E4                                        
  198| 0002F3 3945                        CMP    [EBP-24], EAX 
  198| 0002F5 E8                                        
  198| 0002F6 74                          JE     SHORT L18 
  198| 0002F7 0C                                        
  198| 0002F8 8B45                        MOV    EAX, [EBP-24] 
  198| 0002FA E8                                        
  198| 0002FB 40                          INC    EAX    
  198| 0002FC 8945                        MOV    [EBP-24], EAX 
  198| 0002FE E8                                        
  198| 0002FF E9                          JMP    L20    
  198| 000300 07FEFFFF                                  
  198|                 L18:                             
;  Source Line # 200
  200| 000304 68                          PUSH   lab4.synchro.calcendsignal 
  200| 000305 00000000                                  
  200| 000309 6A                          PUSH   0      
  200| 00030A 00                                        
  200| 00030B 8B55                        MOV    EDX, [EBP-76] ; Spill
  200| 00030D B4                                        
  200| 00030E 8B42                        MOV    EAX, [EDX+48] 
  200| 000310 30                                        
  200| 000311 8D80                        LEA    EAX, [EAX-508] ;  Synchro
  200| 000313 04FEFFFF                                  
  200| 000317 50                          PUSH   EAX    
  200| 000318 E8                          CALL   rts_protected_procedure_call 
  200| 000319 00000000                                  
;  Source Line # 202
  202| 00031D 68                          PUSH   __lcl.00000220 
  202| 00031E 00000000                                  
  202| 000322 68                          PUSH   __lcl.00000219 
  202| 000323 00000000                                  
  202| 000327 E8                          CALL   ada.text_io.put_line__2 
  202| 000328 00000000                                  
  202| 00032C 8D5D                        LEA    EBX, [EBP-56] ;  dyn_temp
  202| 00032E C8                                        
  202| 00032F 53                          PUSH   EBX    
  202| 000330 E8                          CALL   rts_ss_release 
  202| 000331 00000000                                  
;  Source Line # 203
  203| 000335 8BE5                        MOV    ESP, EBP 
  203| 000337 5D                          POP    EBP    
  203| 000338 C2                          RET    4      
  203| 000339 0400                                      
  203|                 L36:                             
  203| 00033B 8D05                        LEA    EAX, L35+5 
  203| 00033D 76010000                                  
  203| 000341 50                          PUSH   EAX    
  203| 000342 E9                          JMP    rts_raise_constraint_error 
  203| 000343 00000000                                  
  203|                 L38:                             
  203| 000347 8D05                        LEA    EAX, L37+5 
  203| 000349 8C010000                                  
  203| 00034D 50                          PUSH   EAX    
  203| 00034E E9                          JMP    rts_raise_constraint_error 
  203| 00034F 00000000                                  
  203|                 L40:                             
  203| 000353 8D05                        LEA    EAX, L39+5 
  203| 000355 B3010000                                  
  203| 000359 50                          PUSH   EAX    
  203| 00035A E9                          JMP    rts_raise_constraint_error 
  203| 00035B 00000000                                  
  203|                 L42:                             
  203| 00035F 8D05                        LEA    EAX, L41+5 
  203| 000361 CC010000                                  
  203| 000365 50                          PUSH   EAX    
  203| 000366 E9                          JMP    rts_raise_constraint_error 
  203| 000367 00000000                                  
  203|                 L44:                             
  203| 00036B 8D05                        LEA    EAX, L43+5 
  203| 00036D FF010000                                  
  203| 000371 50                          PUSH   EAX    
  203| 000372 E9                          JMP    rts_raise_constraint_error 
  203| 000373 00000000                                  
  203|                 L46:                             
  203| 000377 8D05                        LEA    EAX, L45+5 
  203| 000379 18020000                                  
  203| 00037D 50                          PUSH   EAX    
  203| 00037E E9                          JMP    rts_raise_constraint_error 
  203| 00037F 00000000                                  
  203|                 L48:                             
  203| 000383 8D05                        LEA    EAX, L47+5 
  203| 000385 33020000                                  
  203| 000389 50                          PUSH   EAX    
  203| 00038A E9                          JMP    rts_raise_constraint_error 
  203| 00038B 00000000                                  
  203|                 L50:                             
  203| 00038F 8D05                        LEA    EAX, L49+5 
  203| 000391 4C020000                                  
  203| 000395 50                          PUSH   EAX    
  203| 000396 E9                          JMP    rts_raise_constraint_error 
  203| 000397 00000000                                  
  203|                 L52:                             
  203| 00039B 8D05                        LEA    EAX, L51+5 
  203| 00039D 9F020000                                  
  203| 0003A1 50                          PUSH   EAX    
  203| 0003A2 E9                          JMP    rts_raise_constraint_error 
  203| 0003A3 00000000                                  
  203|                 L54:                             
  203| 0003A7 8D05                        LEA    EAX, L53+5 
  203| 0003A9 B5020000                                  
  203| 0003AD 50                          PUSH   EAX    
  203| 0003AE E9                          JMP    rts_raise_constraint_error 
  203| 0003AF 00000000                                  
                       ;                                
                       lab4.t2__body      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000293     DD     00001901 
                                          DD     000000AE 
                                          DD     lab4.t2__body 
                                          DD     __lcl.00000305 
                                          DD     000000B0 
                                          DD     lab4.t2__body+00000010H 
                                          DD     __lcl.00000305 
                                          DD     000000B1 
                                          DD     lab4.t2__body+0000005CH 
                                          DD     __lcl.00000305 
                                          DD     000000B2 
                                          DD     lab4.t2__body+00000061H 
                                          DD     __lcl.00000305 
                                          DD     000000B4 
                                          DD     lab4.t2__body+00000070H 
                                          DD     __lcl.00000305 
                                          DD     000000B6 
                                          DD     lab4.t2__body+00000088H 
                                          DD     __lcl.00000305 
                                          DD     000000B7 
                                          DD     lab4.t2__body+000000AFH 
                                          DD     __lcl.00000305 
                                          DD     000000B8 
                                          DD     lab4.t2__body+000000D0H 
                                          DD     __lcl.00000305 
                                          DD     000000BA 
                                          DD     lab4.t2__body+000000FAH 
                                          DD     __lcl.00000305 
                                          DD     000000BB 
                                          DD     lab4.t2__body+00000122H 
                                          DD     __lcl.00000305 
                                          DD     000000BC 
                                          DD     lab4.t2__body+00000134H 
                                          DD     __lcl.00000305 
                                          DD     000000BD 
                                          DD     lab4.t2__body+0000013BH 
                                          DD     __lcl.00000305 
                                          DD     000000BE 
                                          DD     lab4.t2__body+0000014BH 
                                          DD     __lcl.00000305 
                                          DD     000000BF 
                                          DD     lab4.t2__body+0000015CH 
                                          DD     __lcl.00000305 
                                          DD     000000C0 
                                          DD     lab4.t2__body+000001E5H 
                                          DD     __lcl.00000305 
                                          DD     000000C1 
                                          DD     lab4.t2__body+00000265H 
                                          DD     __lcl.00000305 
                                          DD     000000C2 
                                          DD     lab4.t2__body+00000279H 
                                          DD     __lcl.00000305 
                                          DD     000000C3 
                                          DD     lab4.t2__body+000002CEH 
                                          DD     __lcl.00000305 
                                          DD     000000C4 
                                          DD     lab4.t2__body+000002D5H 
                                          DD     __lcl.00000305 
                                          DD     000000C5 
                                          DD     lab4.t2__body+000002DCH 
                                          DD     __lcl.00000305 
                                          DD     000000C6 
                                          DD     lab4.t2__body+000002F0H 
                                          DD     __lcl.00000305 
                                          DD     000000C8 
                                          DD     lab4.t2__body+00000304H 
                                          DD     __lcl.00000305 
                                          DD     000000CA 
                                          DD     lab4.t2__body+0000031DH 
                                          DD     __lcl.00000305 
                                          DD     000000CB 
                                          DD     lab4.t2__body+00000335H 
                                          DD     __lcl.00000305 
                                          DD     000000CB 
                                          DD     lab4.t2__body+000003AFH 
                                          DD     __lcl.00000305 
; ********* End of segment, Total Size = 304

                       ;                                
                       ;  Start of procedure lab4.t3__body   
                       ;                                
                                          PUBLIC lab4.t3__body 
                       lab4.t3__body      PROC   NEAR   
;  Source Line # 206
  206| 000000 64                          FS:           
  206| 000001 8B15                        MOV    EDX, 4 
  206| 000003 04000000                                  
  206| 000007 8B52                        MOV    EDX, [EDX-4] 
  206| 000009 FC                                        
  206| 00000A 55                          PUSH   EBP    
  206| 00000B 8BEC                        MOV    EBP, ESP 
  206| 00000D 83EC                        SUB    ESP, 76 
  206| 00000F 4C                                        
;  Source Line # 208
  208| 000010 8B02                        MOV    EAX, [EDX+0] 
  208| 000012 8945                        MOV    [EBP-56], EAX ;  dyn_temp
  208| 000014 C8                                        
  208| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  208| 000017 00000000                                  
  208| 00001B 83EB                        SUB    EBX, 1 
  208| 00001D 01                                        
  208| 00001E 7D                          JGE    SHORT L33 
  208| 00001F 03                                        
  208| 000020 33DB                        XOR    EBX, EBX 
  208| 000022 4B                          DEC    EBX    
  208|                 L33:                             
  208| 000023 CE                          INTO          
  208| 000024 43                          INC    EBX    
  208| 000025 CE                          INTO          
  208| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  208| 000029 00000000                                  
  208| 00002D CE                          INTO          
  208| 00002E 53                          PUSH   EBX    
  208| 00002F 8955                        MOV    [EBP-76], EDX ; Spill
  208| 000031 B4                                        
  208| 000032 E8                          CALL   rts_ss_allocate 
  208| 000033 00000000                                  
  208| 000037 8945                        MOV    [EBP-52], EAX ;  MZ3
  208| 000039 CC                                        
  208| 00003A 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
  208| 00003C 00000000                                  
  208| 000040 83E9                        SUB    ECX, 1 
  208| 000042 01                                        
  208| 000043 7D                          JGE    SHORT L34 
  208| 000044 03                                        
  208| 000045 33C9                        XOR    ECX, ECX 
  208| 000047 49                          DEC    ECX    
  208|                 L34:                             
  208| 000048 CE                          INTO          
  208| 000049 41                          INC    ECX    
  208| 00004A CE                          INTO          
  208| 00004B 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  208| 00004E 00000000                                  
  208| 000052 CE                          INTO          
  208| 000053 51                          PUSH   ECX    
  208| 000054 E8                          CALL   rts_ss_allocate 
  208| 000055 00000000                                  
  208| 000059 8945                        MOV    [EBP-48], EAX ;  MR3
  208| 00005B D0                                        
;  Source Line # 209
  209| 00005C E8                          CALL   rts_activation_succeeded 
  209| 00005D 00000000                                  
;  Source Line # 210
  210| 000061 68                          PUSH   __lcl.00000227 
  210| 000062 00000000                                  
  210| 000066 68                          PUSH   __lcl.00000226 
  210| 000067 00000000                                  
  210| 00006B E8                          CALL   ada.text_io.put_line__2 
  210| 00006C 00000000                                  
;  Source Line # 212
  212| 000070 6A                          PUSH   0      
  212| 000071 00                                        
  212| 000072 6A                          PUSH   1      
  212| 000073 01                                        
  212| 000074 6A                          PUSH   0      
  212| 000075 00                                        
  212| 000076 8B55                        MOV    EDX, [EBP-76] ; Spill
  212| 000078 B4                                        
  212| 000079 8B72                        MOV    ESI, [EDX+48] 
  212| 00007B 30                                        
  212| 00007C 8DB6                        LEA    ESI, [ESI-508] ;  Synchro
  212| 00007E 04FEFFFF                                  
  212| 000082 56                          PUSH   ESI    
  212| 000083 E8                          CALL   rts_protected_entry_call 
  212| 000084 00000000                                  
;  Source Line # 214
  214| 000088 8D7D                        LEA    EDI, [EBP-44] 
  214| 00008A D4                                        
  214| 00008B 897D                        MOV    [EBP-40], EDI 
  214| 00008D D8                                        
  214| 00008E 68                          PUSH   lab4.op_alfa.getalfa 
  214| 00008F 00000000                                  
  214| 000093 8D5D                        LEA    EBX, [EBP-40] 
  214| 000095 D8                                        
  214| 000096 53                          PUSH   EBX    
  214| 000097 8B55                        MOV    EDX, [EBP-76] ; Spill
  214| 000099 B4                                        
  214| 00009A 8B4A                        MOV    ECX, [EDX+48] 
  214| 00009C 30                                        
  214| 00009D 8D89                        LEA    ECX, [ECX-428] ;  OP_alfa
  214| 00009F 54FEFFFF                                  
  214| 0000A3 51                          PUSH   ECX    
  214| 0000A4 E8                          CALL   rts_entryless_protected_subp_call 
  214| 0000A5 00000000                                  
  214| 0000A9 8B45                        MOV    EAX, [EBP-44] 
  214| 0000AB D4                                        
  214| 0000AC 8945                        MOV    [EBP-68], EAX ;  alfa3
  214| 0000AE BC                                        
;  Source Line # 215
  215| 0000AF 8B75                        MOV    ESI, [EBP-52] ;  MZ3
  215| 0000B1 CC                                        
  215| 0000B2 8975                        MOV    [EBP-36], ESI 
  215| 0000B4 DC                                        
  215| 0000B5 68                          PUSH   lab4.op_mz.getmz 
  215| 0000B6 00000000                                  
  215| 0000BA 8D7D                        LEA    EDI, [EBP-36] 
  215| 0000BC DC                                        
  215| 0000BD 57                          PUSH   EDI    
  215| 0000BE 8B55                        MOV    EDX, [EBP-76] ; Spill
  215| 0000C0 B4                                        
  215| 0000C1 8B5A                        MOV    EBX, [EDX+48] 
  215| 0000C3 30                                        
  215| 0000C4 8B8B                        MOV    ECX, [EBX-256] ;  OP_MZ
  215| 0000C6 00FFFFFF                                  
  215| 0000CA 51                          PUSH   ECX    
  215| 0000CB E8                          CALL   rts_entryless_protected_subp_call 
  215| 0000CC 00000000                                  
;  Source Line # 216
  216| 0000D0 8B45                        MOV    EAX, [EBP-48] ;  MR3
  216| 0000D2 D0                                        
  216| 0000D3 8945                        MOV    [EBP-32], EAX 
  216| 0000D5 E0                                        
  216| 0000D6 68                          PUSH   lab4.op_mr.getmr 
  216| 0000D7 00000000                                  
  216| 0000DB 8D75                        LEA    ESI, [EBP-32] 
  216| 0000DD E0                                        
  216| 0000DE 56                          PUSH   ESI    
  216| 0000DF 8B55                        MOV    EDX, [EBP-76] ; Spill
  216| 0000E1 B4                                        
  216| 0000E2 8B7A                        MOV    EDI, [EDX+48] 
  216| 0000E4 30                                        
  216| 0000E5 8B9F                        MOV    EBX, [EDI-188] ;  OP_MR
  216| 0000E7 44FFFFFF                                  
  216| 0000EB 53                          PUSH   EBX    
  216| 0000EC E8                          CALL   rts_entryless_protected_subp_call 
  216| 0000ED 00000000                                  
  216| 0000F1 8B0D                        MOV    ECX, package1.n 
  216| 0000F3 00000000                                  
  216| 0000F7 894D                        MOV    [EBP-28], ECX 
  216| 0000F9 E4                                        
;  Source Line # 218
  218| 0000FA 837D                        CMP    DWORD PTR [EBP-28], 0 
  218| 0000FC E4                                        
  218| 0000FD 00                                        
  218| 0000FE 0F8E                        JLE    L18    
  218| 000100 02020000                                  
  218| 000104 C745                        MOV    DWORD PTR [EBP-24], 1 
  218| 000106 E8                                        
  218| 000107 01000000                                  
  218|                 L20:                             
  218| 00010B 8B05                        MOV    EAX, package1.h 
  218| 00010D 00000000                                  
  218| 000111 D1E0                        SHL    EAX, 1 
  218| 000113 CE                          INTO          
  218| 000114 40                          INC    EAX    
  218| 000115 CE                          INTO          
  218| 000116 8945                        MOV    [EBP-20], EAX 
  218| 000118 EC                                        
  218| 000119 6B1D                        IMUL   EBX, package1.h, 3 
  218| 00011B 00000000                                  
  218| 00011F 03                                        
  218| 000120 CE                          INTO          
  218| 000121 895D                        MOV    [EBP-16], EBX 
  218| 000123 F0                                        
;  Source Line # 219
  219| 000124 8B4D                        MOV    ECX, [EBP-16] 
  219| 000126 F0                                        
  219| 000127 394D                        CMP    [EBP-20], ECX 
  219| 000129 EC                                        
  219| 00012A 0F8F                        JG     L21    
  219| 00012C C2010000                                  
  219| 000130 8B45                        MOV    EAX, [EBP-20] 
  219| 000132 EC                                        
  219| 000133 8945                        MOV    [EBP-12], EAX 
  219| 000135 F4                                        
  219|                 L23:                             
;  Source Line # 220
  220| 000136 C745                        MOV    DWORD PTR [EBP-64], 0 ;  Sum1
  220| 000138 C0                                        
  220| 000139 00000000                                  
;  Source Line # 221
  221| 00013D C745                        MOV    DWORD PTR [EBP-60], 0 ;  Sum2
  221| 00013F C4                                        
  221| 000140 00000000                                  
  221| 000144 8B05                        MOV    EAX, package1.n 
  221| 000146 00000000                                  
  221| 00014A 8945                        MOV    [EBP-8], EAX 
  221| 00014C F8                                        
;  Source Line # 222
  222| 00014D 837D                        CMP    DWORD PTR [EBP-8], 0 
  222| 00014F F8                                        
  222| 000150 00                                        
  222| 000151 0F8E                        JLE    L24    
  222| 000153 24010000                                  
  222| 000157 C745                        MOV    DWORD PTR [EBP-4], 1 
  222| 000159 FC                                        
  222| 00015A 01000000                                  
  222|                 L26:                             
;  Source Line # 223
  223| 00015E 8B55                        MOV    EDX, [EBP-76] ; Spill
  223| 000160 B4                                        
  223| 000161 8B42                        MOV    EAX, [EDX+48] 
  223| 000163 30                                        
  223| 000164 8B98                        MOV    EBX, [EAX-364] ;  MB
  223| 000166 94FEFFFF                                  
  223| 00016A 8B4D                        MOV    ECX, [EBP-4] 
  223| 00016C FC                                        
  223| 00016D 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  223| 00016F 00000000                                  
  223|                 L35:                             
  223| 000173 0F8F                        JG     L36    
  223| 000175 C4010000                                  
  223| 000179 8D49                        LEA    ECX, [ECX-1] 
  223| 00017B FF                                        
  223| 00017C 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  223| 00017F 00000000                                  
  223| 000183 8B75                        MOV    ESI, [EBP-12] 
  223| 000185 F4                                        
  223| 000186 83FE                        CMP    ESI, 1 
  223| 000188 01                                        
  223|                 L37:                             
  223| 000189 0F8C                        JL     L38    
  223| 00018B BA010000                                  
  223| 00018F 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  223| 000191 00000000                                  
  223| 000195 0F8F                        JG     L38    
  223| 000197 AE010000                                  
  223| 00019B 8D34B5                      LEA    ESI, [4*ESI-4] 
  223| 00019E FCFFFFFF                                  
  223| 0001A2 03CE                        ADD    ECX, ESI 
  223| 0001A4 8B7D                        MOV    EDI, [EBP-52] ;  MZ3
  223| 0001A6 CC                                        
  223| 0001A7 8B55                        MOV    EDX, [EBP-24] 
  223| 0001A9 E8                                        
  223| 0001AA 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  223| 0001AC 00000000                                  
  223|                 L39:                             
  223| 0001B0 0F8F                        JG     L40    
  223| 0001B2 9F010000                                  
  223| 0001B6 8D52                        LEA    EDX, [EDX-1] 
  223| 0001B8 FF                                        
  223| 0001B9 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  223| 0001BC 00000000                                  
  223| 0001C0 8B45                        MOV    EAX, [EBP-4] 
  223| 0001C2 FC                                        
  223| 0001C3 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  223| 0001C5 00000000                                  
  223|                 L41:                             
  223| 0001C9 0F8F                        JG     L42    
  223| 0001CB 92010000                                  
  223| 0001CF 8D0485                      LEA    EAX, [4*EAX-4] 
  223| 0001D2 FCFFFFFF                                  
  223| 0001D6 03D0                        ADD    EDX, EAX 
  223| 0001D8 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  223| 0001DB 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  223| 0001DF CE                          INTO          
  223| 0001E0 035D                        ADD    EBX, [EBP-64] ;  Sum1
  223| 0001E2 C0                                        
  223| 0001E3 CE                          INTO          
  223| 0001E4 895D                        MOV    [EBP-64], EBX ;  Sum1
  223| 0001E6 C0                                        
;  Source Line # 224
  224| 0001E7 8B55                        MOV    EDX, [EBP-76] ; Spill
  224| 0001E9 B4                                        
  224| 0001EA 8B72                        MOV    ESI, [EDX+48] 
  224| 0001EC 30                                        
  224| 0001ED 8B8E                        MOV    ECX, [ESI-356] ;  ME
  224| 0001EF 9CFEFFFF                                  
  224| 0001F3 8B7D                        MOV    EDI, [EBP-4] 
  224| 0001F5 FC                                        
  224| 0001F6 3B3D                        CMP    EDI, package1.matr__constrained_array____1 
  224| 0001F8 00000000                                  
  224|                 L43:                             
  224| 0001FC 0F8F                        JG     L44    
  224| 0001FE 6B010000                                  
  224| 000202 8D7F                        LEA    EDI, [EDI-1] 
  224| 000204 FF                                        
  224| 000205 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
  224| 000208 00000000                                  
  224| 00020C 8B45                        MOV    EAX, [EBP-12] 
  224| 00020E F4                                        
  224| 00020F 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  224| 000211 00000000                                  
  224|                 L45:                             
  224| 000215 0F8F                        JG     L46    
  224| 000217 5E010000                                  
  224| 00021B 8D0485                      LEA    EAX, [4*EAX-4] 
  224| 00021E FCFFFFFF                                  
  224| 000222 03F8                        ADD    EDI, EAX 
  224| 000224 8B5D                        MOV    EBX, [EBP-48] ;  MR3
  224| 000226 D0                                        
  224| 000227 8B55                        MOV    EDX, [EBP-24] 
  224| 000229 E8                                        
  224| 00022A 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  224| 00022C 00000000                                  
  224|                 L47:                             
  224| 000230 0F8F                        JG     L48    
  224| 000232 4F010000                                  
  224| 000236 8D52                        LEA    EDX, [EDX-1] 
  224| 000238 FF                                        
  224| 000239 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  224| 00023C 00000000                                  
  224| 000240 8B75                        MOV    ESI, [EBP-4] 
  224| 000242 FC                                        
  224| 000243 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  224| 000245 00000000                                  
  224|                 L49:                             
  224| 000249 0F8F                        JG     L50    
  224| 00024B 42010000                                  
  224| 00024F 8D34B5                      LEA    ESI, [4*ESI-4] 
  224| 000252 FCFFFFFF                                  
  224| 000256 03D6                        ADD    EDX, ESI 
  224| 000258 8B0C39                      MOV    ECX, [ECX+EDI+0] 
  224| 00025B 0FAF0C13                    IMUL   ECX, [EBX+EDX+0] 
  224| 00025F CE                          INTO          
  224| 000260 034D                        ADD    ECX, [EBP-60] ;  Sum2
  224| 000262 C4                                        
  224| 000263 CE                          INTO          
  224| 000264 894D                        MOV    [EBP-60], ECX ;  Sum2
  224| 000266 C4                                        
;  Source Line # 225
  225| 000267 8B45                        MOV    EAX, [EBP-8] 
  225| 000269 F8                                        
  225| 00026A 3945                        CMP    [EBP-4], EAX 
  225| 00026C FC                                        
  225| 00026D 74                          JE     SHORT L24 
  225| 00026E 0C                                        
  225| 00026F 8B45                        MOV    EAX, [EBP-4] 
  225| 000271 FC                                        
  225| 000272 40                          INC    EAX    
  225| 000273 8945                        MOV    [EBP-4], EAX 
  225| 000275 FC                                        
  225| 000276 E9                          JMP    L26    
  225| 000277 E3FEFFFF                                  
  225|                 L24:                             
;  Source Line # 226
  226| 00027B 8B45                        MOV    EAX, [EBP-64] ;  Sum1
  226| 00027D C0                                        
  226| 00027E 0FAF45                      IMUL   EAX, [EBP-68] ;  alfa3
  226| 000281 BC                                        
  226| 000282 CE                          INTO          
  226| 000283 0345                        ADD    EAX, [EBP-60] ;  Sum2
  226| 000285 C4                                        
  226| 000286 CE                          INTO          
  226| 000287 8B55                        MOV    EDX, [EBP-76] ; Spill
  226| 000289 B4                                        
  226| 00028A 8B5A                        MOV    EBX, [EDX+48] 
  226| 00028C 30                                        
  226| 00028D 8B8B                        MOV    ECX, [EBX-368] ;  MA
  226| 00028F 90FEFFFF                                  
  226| 000293 8B75                        MOV    ESI, [EBP-24] 
  226| 000295 E8                                        
  226| 000296 3B35                        CMP    ESI, package1.matr__constrained_array____1 
  226| 000298 00000000                                  
  226|                 L51:                             
  226| 00029C 0F8F                        JG     L52    
  226| 00029E FB000000                                  
  226| 0002A2 8D76                        LEA    ESI, [ESI-1] 
  226| 0002A4 FF                                        
  226| 0002A5 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  226| 0002A8 00000000                                  
  226| 0002AC 8B7D                        MOV    EDI, [EBP-12] 
  226| 0002AE F4                                        
  226| 0002AF 83FF                        CMP    EDI, 1 
  226| 0002B1 01                                        
  226|                 L53:                             
  226| 0002B2 0F8C                        JL     L54    
  226| 0002B4 F1000000                                  
  226| 0002B8 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  226| 0002BA 00000000                                  
  226| 0002BE 0F8F                        JG     L54    
  226| 0002C0 E5000000                                  
  226| 0002C4 8D3CBD                      LEA    EDI, [4*EDI-4] 
  226| 0002C7 FCFFFFFF                                  
  226| 0002CB 03F7                        ADD    ESI, EDI 
  226| 0002CD 890431                      MOV    [ECX+ESI+0], EAX 
;  Source Line # 227
  227| 0002D0 C745                        MOV    DWORD PTR [EBP-64], 0 ;  Sum1
  227| 0002D2 C0                                        
  227| 0002D3 00000000                                  
;  Source Line # 228
  228| 0002D7 C745                        MOV    DWORD PTR [EBP-60], 0 ;  Sum2
  228| 0002D9 C4                                        
  228| 0002DA 00000000                                  
;  Source Line # 229
  229| 0002DE 8B45                        MOV    EAX, [EBP-16] 
  229| 0002E0 F0                                        
  229| 0002E1 3945                        CMP    [EBP-12], EAX 
  229| 0002E3 F4                                        
  229| 0002E4 74                          JE     SHORT L21 
  229| 0002E5 0C                                        
  229| 0002E6 8B45                        MOV    EAX, [EBP-12] 
  229| 0002E8 F4                                        
  229| 0002E9 40                          INC    EAX    
  229| 0002EA 8945                        MOV    [EBP-12], EAX 
  229| 0002EC F4                                        
  229| 0002ED E9                          JMP    L23    
  229| 0002EE 44FEFFFF                                  
  229|                 L21:                             
;  Source Line # 230
  230| 0002F2 8B45                        MOV    EAX, [EBP-28] 
  230| 0002F4 E4                                        
  230| 0002F5 3945                        CMP    [EBP-24], EAX 
  230| 0002F7 E8                                        
  230| 0002F8 74                          JE     SHORT L18 
  230| 0002F9 0C                                        
  230| 0002FA 8B45                        MOV    EAX, [EBP-24] 
  230| 0002FC E8                                        
  230| 0002FD 40                          INC    EAX    
  230| 0002FE 8945                        MOV    [EBP-24], EAX 
  230| 000300 E8                                        
  230| 000301 E9                          JMP    L20    
  230| 000302 05FEFFFF                                  
  230|                 L18:                             
;  Source Line # 232
  232| 000306 68                          PUSH   lab4.synchro.calcendsignal 
  232| 000307 00000000                                  
  232| 00030B 6A                          PUSH   0      
  232| 00030C 00                                        
  232| 00030D 8B55                        MOV    EDX, [EBP-76] ; Spill
  232| 00030F B4                                        
  232| 000310 8B42                        MOV    EAX, [EDX+48] 
  232| 000312 30                                        
  232| 000313 8D80                        LEA    EAX, [EAX-508] ;  Synchro
  232| 000315 04FEFFFF                                  
  232| 000319 50                          PUSH   EAX    
  232| 00031A E8                          CALL   rts_protected_procedure_call 
  232| 00031B 00000000                                  
;  Source Line # 234
  234| 00031F 68                          PUSH   __lcl.00000246 
  234| 000320 00000000                                  
  234| 000324 68                          PUSH   __lcl.00000245 
  234| 000325 00000000                                  
  234| 000329 E8                          CALL   ada.text_io.put_line__2 
  234| 00032A 00000000                                  
  234| 00032E 8D5D                        LEA    EBX, [EBP-56] ;  dyn_temp
  234| 000330 C8                                        
  234| 000331 53                          PUSH   EBX    
  234| 000332 E8                          CALL   rts_ss_release 
  234| 000333 00000000                                  
;  Source Line # 235
  235| 000337 8BE5                        MOV    ESP, EBP 
  235| 000339 5D                          POP    EBP    
  235| 00033A C2                          RET    4      
  235| 00033B 0400                                      
  235|                 L36:                             
  235| 00033D 8D05                        LEA    EAX, L35+5 
  235| 00033F 78010000                                  
  235| 000343 50                          PUSH   EAX    
  235| 000344 E9                          JMP    rts_raise_constraint_error 
  235| 000345 00000000                                  
  235|                 L38:                             
  235| 000349 8D05                        LEA    EAX, L37+5 
  235| 00034B 8E010000                                  
  235| 00034F 50                          PUSH   EAX    
  235| 000350 E9                          JMP    rts_raise_constraint_error 
  235| 000351 00000000                                  
  235|                 L40:                             
  235| 000355 8D05                        LEA    EAX, L39+5 
  235| 000357 B5010000                                  
  235| 00035B 50                          PUSH   EAX    
  235| 00035C E9                          JMP    rts_raise_constraint_error 
  235| 00035D 00000000                                  
  235|                 L42:                             
  235| 000361 8D05                        LEA    EAX, L41+5 
  235| 000363 CE010000                                  
  235| 000367 50                          PUSH   EAX    
  235| 000368 E9                          JMP    rts_raise_constraint_error 
  235| 000369 00000000                                  
  235|                 L44:                             
  235| 00036D 8D05                        LEA    EAX, L43+5 
  235| 00036F 01020000                                  
  235| 000373 50                          PUSH   EAX    
  235| 000374 E9                          JMP    rts_raise_constraint_error 
  235| 000375 00000000                                  
  235|                 L46:                             
  235| 000379 8D05                        LEA    EAX, L45+5 
  235| 00037B 1A020000                                  
  235| 00037F 50                          PUSH   EAX    
  235| 000380 E9                          JMP    rts_raise_constraint_error 
  235| 000381 00000000                                  
  235|                 L48:                             
  235| 000385 8D05                        LEA    EAX, L47+5 
  235| 000387 35020000                                  
  235| 00038B 50                          PUSH   EAX    
  235| 00038C E9                          JMP    rts_raise_constraint_error 
  235| 00038D 00000000                                  
  235|                 L50:                             
  235| 000391 8D05                        LEA    EAX, L49+5 
  235| 000393 4E020000                                  
  235| 000397 50                          PUSH   EAX    
  235| 000398 E9                          JMP    rts_raise_constraint_error 
  235| 000399 00000000                                  
  235|                 L52:                             
  235| 00039D 8D05                        LEA    EAX, L51+5 
  235| 00039F A1020000                                  
  235| 0003A3 50                          PUSH   EAX    
  235| 0003A4 E9                          JMP    rts_raise_constraint_error 
  235| 0003A5 00000000                                  
  235|                 L54:                             
  235| 0003A9 8D05                        LEA    EAX, L53+5 
  235| 0003AB B7020000                                  
  235| 0003AF 50                          PUSH   EAX    
  235| 0003B0 E9                          JMP    rts_raise_constraint_error 
  235| 0003B1 00000000                                  
                       ;                                
                       lab4.t3__body      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000292     DD     00001901 
                                          DD     000000CE 
                                          DD     lab4.t3__body 
                                          DD     __lcl.00000305 
                                          DD     000000D0 
                                          DD     lab4.t3__body+00000010H 
                                          DD     __lcl.00000305 
                                          DD     000000D1 
                                          DD     lab4.t3__body+0000005CH 
                                          DD     __lcl.00000305 
                                          DD     000000D2 
                                          DD     lab4.t3__body+00000061H 
                                          DD     __lcl.00000305 
                                          DD     000000D4 
                                          DD     lab4.t3__body+00000070H 
                                          DD     __lcl.00000305 
                                          DD     000000D6 
                                          DD     lab4.t3__body+00000088H 
                                          DD     __lcl.00000305 
                                          DD     000000D7 
                                          DD     lab4.t3__body+000000AFH 
                                          DD     __lcl.00000305 
                                          DD     000000D8 
                                          DD     lab4.t3__body+000000D0H 
                                          DD     __lcl.00000305 
                                          DD     000000DA 
                                          DD     lab4.t3__body+000000FAH 
                                          DD     __lcl.00000305 
                                          DD     000000DB 
                                          DD     lab4.t3__body+00000124H 
                                          DD     __lcl.00000305 
                                          DD     000000DC 
                                          DD     lab4.t3__body+00000136H 
                                          DD     __lcl.00000305 
                                          DD     000000DD 
                                          DD     lab4.t3__body+0000013DH 
                                          DD     __lcl.00000305 
                                          DD     000000DE 
                                          DD     lab4.t3__body+0000014DH 
                                          DD     __lcl.00000305 
                                          DD     000000DF 
                                          DD     lab4.t3__body+0000015EH 
                                          DD     __lcl.00000305 
                                          DD     000000E0 
                                          DD     lab4.t3__body+000001E7H 
                                          DD     __lcl.00000305 
                                          DD     000000E1 
                                          DD     lab4.t3__body+00000267H 
                                          DD     __lcl.00000305 
                                          DD     000000E2 
                                          DD     lab4.t3__body+0000027BH 
                                          DD     __lcl.00000305 
                                          DD     000000E3 
                                          DD     lab4.t3__body+000002D0H 
                                          DD     __lcl.00000305 
                                          DD     000000E4 
                                          DD     lab4.t3__body+000002D7H 
                                          DD     __lcl.00000305 
                                          DD     000000E5 
                                          DD     lab4.t3__body+000002DEH 
                                          DD     __lcl.00000305 
                                          DD     000000E6 
                                          DD     lab4.t3__body+000002F2H 
                                          DD     __lcl.00000305 
                                          DD     000000E8 
                                          DD     lab4.t3__body+00000306H 
                                          DD     __lcl.00000305 
                                          DD     000000EA 
                                          DD     lab4.t3__body+0000031FH 
                                          DD     __lcl.00000305 
                                          DD     000000EB 
                                          DD     lab4.t3__body+00000337H 
                                          DD     __lcl.00000305 
                                          DD     000000EB 
                                          DD     lab4.t3__body+000003B1H 
                                          DD     __lcl.00000305 
; ********* End of segment, Total Size = 304

                       ;                                
                       ;  Start of procedure lab4.t4__body   
                       ;                                
                                          PUBLIC lab4.t4__body 
                       lab4.t4__body      PROC   NEAR   
;  Source Line # 238
  238| 000000 64                          FS:           
  238| 000001 8B15                        MOV    EDX, 4 
  238| 000003 04000000                                  
  238| 000007 8B52                        MOV    EDX, [EDX-4] 
  238| 000009 FC                                        
  238| 00000A 55                          PUSH   EBP    
  238| 00000B 8BEC                        MOV    EBP, ESP 
  238| 00000D 83EC                        SUB    ESP, 72 
  238| 00000F 48                                        
;  Source Line # 240
  240| 000010 8B02                        MOV    EAX, [EDX+0] 
  240| 000012 8945                        MOV    [EBP-52], EAX ;  dyn_temp
  240| 000014 CC                                        
  240| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  240| 000017 00000000                                  
  240| 00001B 83EB                        SUB    EBX, 1 
  240| 00001D 01                                        
  240| 00001E 7D                          JGE    SHORT L33 
  240| 00001F 03                                        
  240| 000020 33DB                        XOR    EBX, EBX 
  240| 000022 4B                          DEC    EBX    
  240|                 L33:                             
  240| 000023 CE                          INTO          
  240| 000024 43                          INC    EBX    
  240| 000025 CE                          INTO          
  240| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  240| 000029 00000000                                  
  240| 00002D CE                          INTO          
  240| 00002E 53                          PUSH   EBX    
  240| 00002F 8955                        MOV    [EBP-72], EDX ; Spill
  240| 000031 B8                                        
  240| 000032 E8                          CALL   rts_ss_allocate 
  240| 000033 00000000                                  
  240| 000037 8945                        MOV    [EBP-48], EAX ;  MZ4
  240| 000039 D0                                        
  240| 00003A 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
  240| 00003C 00000000                                  
  240| 000040 83E9                        SUB    ECX, 1 
  240| 000042 01                                        
  240| 000043 7D                          JGE    SHORT L34 
  240| 000044 03                                        
  240| 000045 33C9                        XOR    ECX, ECX 
  240| 000047 49                          DEC    ECX    
  240|                 L34:                             
  240| 000048 CE                          INTO          
  240| 000049 41                          INC    ECX    
  240| 00004A CE                          INTO          
  240| 00004B 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  240| 00004E 00000000                                  
  240| 000052 CE                          INTO          
  240| 000053 51                          PUSH   ECX    
  240| 000054 E8                          CALL   rts_ss_allocate 
  240| 000055 00000000                                  
  240| 000059 8945                        MOV    [EBP-44], EAX ;  MR4
  240| 00005B D4                                        
;  Source Line # 241
  241| 00005C E8                          CALL   rts_activation_succeeded 
  241| 00005D 00000000                                  
;  Source Line # 242
  242| 000061 68                          PUSH   __lcl.00000253 
  242| 000062 00000000                                  
  242| 000066 68                          PUSH   __lcl.00000252 
  242| 000067 00000000                                  
  242| 00006B E8                          CALL   ada.text_io.put_line__2 
  242| 00006C 00000000                                  
;  Source Line # 245
  245| 000070 8B55                        MOV    EDX, [EBP-72] ; Spill
  245| 000072 B8                                        
  245| 000073 8B72                        MOV    ESI, [EDX+48] 
  245| 000075 30                                        
  245| 000076 8BBE                        MOV    EDI, [ESI-364] ;  MB
  245| 000078 94FEFFFF                                  
  245| 00007C 57                          PUSH   EDI    
  245| 00007D E8                          CALL   package1.matr_input 
  245| 00007E 00000000                                  
;  Source Line # 246
  246| 000082 8B5D                        MOV    EBX, [EBP-48] ;  MZ4
  246| 000084 D0                                        
  246| 000085 53                          PUSH   EBX    
  246| 000086 E8                          CALL   package1.matr_input 
  246| 000087 00000000                                  
;  Source Line # 247
  247| 00008B 8B55                        MOV    EDX, [EBP-72] ; Spill
  247| 00008D B8                                        
  247| 00008E 8B4A                        MOV    ECX, [EDX+48] 
  247| 000090 30                                        
  247| 000091 8B81                        MOV    EAX, [ECX-356] ;  ME
  247| 000093 9CFEFFFF                                  
  247| 000097 50                          PUSH   EAX    
  247| 000098 E8                          CALL   package1.matr_input 
  247| 000099 00000000                                  
;  Source Line # 248
  248| 00009D 8B75                        MOV    ESI, [EBP-44] ;  MR4
  248| 00009F D4                                        
  248| 0000A0 56                          PUSH   ESI    
  248| 0000A1 E8                          CALL   package1.matr_input 
  248| 0000A2 00000000                                  
;  Source Line # 249
  249| 0000A6 C745                        MOV    DWORD PTR [EBP-64], 2 ;  alfa4
  249| 0000A8 C0                                        
  249| 0000A9 02000000                                  
;  Source Line # 251
  251| 0000AD 8B7D                        MOV    EDI, [EBP-64] ;  alfa4
  251| 0000AF C0                                        
  251| 0000B0 897D                        MOV    [EBP-40], EDI 
  251| 0000B2 D8                                        
  251| 0000B3 68                          PUSH   lab4.op_alfa.setalfa 
  251| 0000B4 00000000                                  
  251| 0000B8 8D5D                        LEA    EBX, [EBP-40] 
  251| 0000BA D8                                        
  251| 0000BB 53                          PUSH   EBX    
  251| 0000BC 8B55                        MOV    EDX, [EBP-72] ; Spill
  251| 0000BE B8                                        
  251| 0000BF 8B4A                        MOV    ECX, [EDX+48] 
  251| 0000C1 30                                        
  251| 0000C2 8D89                        LEA    ECX, [ECX-428] ;  OP_alfa
  251| 0000C4 54FEFFFF                                  
  251| 0000C8 51                          PUSH   ECX    
  251| 0000C9 E8                          CALL   rts_entryless_protected_subp_call 
  251| 0000CA 00000000                                  
;  Source Line # 252
  252| 0000CE 8B45                        MOV    EAX, [EBP-44] ;  MR4
  252| 0000D0 D4                                        
  252| 0000D1 8945                        MOV    [EBP-36], EAX 
  252| 0000D3 DC                                        
  252| 0000D4 68                          PUSH   lab4.op_mr.setmr 
  252| 0000D5 00000000                                  
  252| 0000D9 8D75                        LEA    ESI, [EBP-36] 
  252| 0000DB DC                                        
  252| 0000DC 56                          PUSH   ESI    
  252| 0000DD 8B55                        MOV    EDX, [EBP-72] ; Spill
  252| 0000DF B8                                        
  252| 0000E0 8B7A                        MOV    EDI, [EDX+48] 
  252| 0000E2 30                                        
  252| 0000E3 8B9F                        MOV    EBX, [EDI-188] ;  OP_MR
  252| 0000E5 44FFFFFF                                  
  252| 0000E9 53                          PUSH   EBX    
  252| 0000EA E8                          CALL   rts_entryless_protected_subp_call 
  252| 0000EB 00000000                                  
;  Source Line # 253
  253| 0000EF 8B4D                        MOV    ECX, [EBP-48] ;  MZ4
  253| 0000F1 D0                                        
  253| 0000F2 894D                        MOV    [EBP-32], ECX 
  253| 0000F4 E0                                        
  253| 0000F5 68                          PUSH   lab4.op_mz.setmz 
  253| 0000F6 00000000                                  
  253| 0000FA 8D45                        LEA    EAX, [EBP-32] 
  253| 0000FC E0                                        
  253| 0000FD 50                          PUSH   EAX    
  253| 0000FE 8B55                        MOV    EDX, [EBP-72] ; Spill
  253| 000100 B8                                        
  253| 000101 8B72                        MOV    ESI, [EDX+48] 
  253| 000103 30                                        
  253| 000104 8BBE                        MOV    EDI, [ESI-256] ;  OP_MZ
  253| 000106 00FFFFFF                                  
  253| 00010A 57                          PUSH   EDI    
  253| 00010B E8                          CALL   rts_entryless_protected_subp_call 
  253| 00010C 00000000                                  
;  Source Line # 255
  255| 000110 68                          PUSH   lab4.synchro.inputsignal 
  255| 000111 00000000                                  
  255| 000115 6A                          PUSH   0      
  255| 000116 00                                        
  255| 000117 8B55                        MOV    EDX, [EBP-72] ; Spill
  255| 000119 B8                                        
  255| 00011A 8B5A                        MOV    EBX, [EDX+48] 
  255| 00011C 30                                        
  255| 00011D 8D9B                        LEA    EBX, [EBX-508] ;  Synchro
  255| 00011F 04FEFFFF                                  
  255| 000123 53                          PUSH   EBX    
  255| 000124 E8                          CALL   rts_protected_procedure_call 
  255| 000125 00000000                                  
  255| 000129 8B0D                        MOV    ECX, package1.n 
  255| 00012B 00000000                                  
  255| 00012F 894D                        MOV    [EBP-28], ECX 
  255| 000131 E4                                        
;  Source Line # 257
  257| 000132 837D                        CMP    DWORD PTR [EBP-28], 0 
  257| 000134 E4                                        
  257| 000135 00                                        
  257| 000136 0F8E                        JLE    L18    
  257| 000138 FF010000                                  
  257| 00013C C745                        MOV    DWORD PTR [EBP-24], 1 
  257| 00013E E8                                        
  257| 00013F 01000000                                  
  257|                 L20:                             
  257| 000143 6B05                        IMUL   EAX, package1.h, 3 
  257| 000145 00000000                                  
  257| 000149 03                                        
  257| 00014A CE                          INTO          
  257| 00014B 40                          INC    EAX    
  257| 00014C CE                          INTO          
  257| 00014D 8945                        MOV    [EBP-20], EAX 
  257| 00014F EC                                        
  257| 000150 8B1D                        MOV    EBX, package1.n 
  257| 000152 00000000                                  
  257| 000156 895D                        MOV    [EBP-16], EBX 
  257| 000158 F0                                        
;  Source Line # 258
  258| 000159 8B4D                        MOV    ECX, [EBP-16] 
  258| 00015B F0                                        
  258| 00015C 394D                        CMP    [EBP-20], ECX 
  258| 00015E EC                                        
  258| 00015F 0F8F                        JG     L21    
  258| 000161 C2010000                                  
  258| 000165 8B45                        MOV    EAX, [EBP-20] 
  258| 000167 EC                                        
  258| 000168 8945                        MOV    [EBP-12], EAX 
  258| 00016A F4                                        
  258|                 L23:                             
;  Source Line # 259
  259| 00016B C745                        MOV    DWORD PTR [EBP-60], 0 ;  Sum1
  259| 00016D C4                                        
  259| 00016E 00000000                                  
;  Source Line # 260
  260| 000172 C745                        MOV    DWORD PTR [EBP-56], 0 ;  Sum2
  260| 000174 C8                                        
  260| 000175 00000000                                  
  260| 000179 8B05                        MOV    EAX, package1.n 
  260| 00017B 00000000                                  
  260| 00017F 8945                        MOV    [EBP-8], EAX 
  260| 000181 F8                                        
;  Source Line # 261
  261| 000182 837D                        CMP    DWORD PTR [EBP-8], 0 
  261| 000184 F8                                        
  261| 000185 00                                        
  261| 000186 0F8E                        JLE    L24    
  261| 000188 24010000                                  
  261| 00018C C745                        MOV    DWORD PTR [EBP-4], 1 
  261| 00018E FC                                        
  261| 00018F 01000000                                  
  261|                 L26:                             
;  Source Line # 262
  262| 000193 8B55                        MOV    EDX, [EBP-72] ; Spill
  262| 000195 B8                                        
  262| 000196 8B42                        MOV    EAX, [EDX+48] 
  262| 000198 30                                        
  262| 000199 8B98                        MOV    EBX, [EAX-364] ;  MB
  262| 00019B 94FEFFFF                                  
  262| 00019F 8B4D                        MOV    ECX, [EBP-4] 
  262| 0001A1 FC                                        
  262| 0001A2 3B0D                        CMP    ECX, package1.matr__constrained_array____1 
  262| 0001A4 00000000                                  
  262|                 L35:                             
  262| 0001A8 0F8F                        JG     L36    
  262| 0001AA C4010000                                  
  262| 0001AE 8D49                        LEA    ECX, [ECX-1] 
  262| 0001B0 FF                                        
  262| 0001B1 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  262| 0001B4 00000000                                  
  262| 0001B8 8B75                        MOV    ESI, [EBP-12] 
  262| 0001BA F4                                        
  262| 0001BB 83FE                        CMP    ESI, 1 
  262| 0001BD 01                                        
  262|                 L37:                             
  262| 0001BE 0F8C                        JL     L38    
  262| 0001C0 BA010000                                  
  262| 0001C4 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  262| 0001C6 00000000                                  
  262| 0001CA 0F8F                        JG     L38    
  262| 0001CC AE010000                                  
  262| 0001D0 8D34B5                      LEA    ESI, [4*ESI-4] 
  262| 0001D3 FCFFFFFF                                  
  262| 0001D7 03CE                        ADD    ECX, ESI 
  262| 0001D9 8B7D                        MOV    EDI, [EBP-48] ;  MZ4
  262| 0001DB D0                                        
  262| 0001DC 8B55                        MOV    EDX, [EBP-24] 
  262| 0001DE E8                                        
  262| 0001DF 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  262| 0001E1 00000000                                  
  262|                 L39:                             
  262| 0001E5 0F8F                        JG     L40    
  262| 0001E7 9F010000                                  
  262| 0001EB 8D52                        LEA    EDX, [EDX-1] 
  262| 0001ED FF                                        
  262| 0001EE 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  262| 0001F1 00000000                                  
  262| 0001F5 8B45                        MOV    EAX, [EBP-4] 
  262| 0001F7 FC                                        
  262| 0001F8 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  262| 0001FA 00000000                                  
  262|                 L41:                             
  262| 0001FE 0F8F                        JG     L42    
  262| 000200 92010000                                  
  262| 000204 8D0485                      LEA    EAX, [4*EAX-4] 
  262| 000207 FCFFFFFF                                  
  262| 00020B 03D0                        ADD    EDX, EAX 
  262| 00020D 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  262| 000210 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  262| 000214 CE                          INTO          
  262| 000215 035D                        ADD    EBX, [EBP-60] ;  Sum1
  262| 000217 C4                                        
  262| 000218 CE                          INTO          
  262| 000219 895D                        MOV    [EBP-60], EBX ;  Sum1
  262| 00021B C4                                        
;  Source Line # 263
  263| 00021C 8B55                        MOV    EDX, [EBP-72] ; Spill
  263| 00021E B8                                        
  263| 00021F 8B72                        MOV    ESI, [EDX+48] 
  263| 000221 30                                        
  263| 000222 8B8E                        MOV    ECX, [ESI-356] ;  ME
  263| 000224 9CFEFFFF                                  
  263| 000228 8B7D                        MOV    EDI, [EBP-4] 
  263| 00022A FC                                        
  263| 00022B 3B3D                        CMP    EDI, package1.matr__constrained_array____1 
  263| 00022D 00000000                                  
  263|                 L43:                             
  263| 000231 0F8F                        JG     L44    
  263| 000233 6B010000                                  
  263| 000237 8D7F                        LEA    EDI, [EDI-1] 
  263| 000239 FF                                        
  263| 00023A 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
  263| 00023D 00000000                                  
  263| 000241 8B45                        MOV    EAX, [EBP-12] 
  263| 000243 F4                                        
  263| 000244 3B05                        CMP    EAX, package1.vec__constrained_array____1 
  263| 000246 00000000                                  
  263|                 L45:                             
  263| 00024A 0F8F                        JG     L46    
  263| 00024C 5E010000                                  
  263| 000250 8D0485                      LEA    EAX, [4*EAX-4] 
  263| 000253 FCFFFFFF                                  
  263| 000257 03F8                        ADD    EDI, EAX 
  263| 000259 8B5D                        MOV    EBX, [EBP-44] ;  MR4
  263| 00025B D4                                        
  263| 00025C 8B55                        MOV    EDX, [EBP-24] 
  263| 00025E E8                                        
  263| 00025F 3B15                        CMP    EDX, package1.matr__constrained_array____1 
  263| 000261 00000000                                  
  263|                 L47:                             
  263| 000265 0F8F                        JG     L48    
  263| 000267 4F010000                                  
  263| 00026B 8D52                        LEA    EDX, [EDX-1] 
  263| 00026D FF                                        
  263| 00026E 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  263| 000271 00000000                                  
  263| 000275 8B75                        MOV    ESI, [EBP-4] 
  263| 000277 FC                                        
  263| 000278 3B35                        CMP    ESI, package1.vec__constrained_array____1 
  263| 00027A 00000000                                  
  263|                 L49:                             
  263| 00027E 0F8F                        JG     L50    
  263| 000280 42010000                                  
  263| 000284 8D34B5                      LEA    ESI, [4*ESI-4] 
  263| 000287 FCFFFFFF                                  
  263| 00028B 03D6                        ADD    EDX, ESI 
  263| 00028D 8B0C39                      MOV    ECX, [ECX+EDI+0] 
  263| 000290 0FAF0C13                    IMUL   ECX, [EBX+EDX+0] 
  263| 000294 CE                          INTO          
  263| 000295 034D                        ADD    ECX, [EBP-56] ;  Sum2
  263| 000297 C8                                        
  263| 000298 CE                          INTO          
  263| 000299 894D                        MOV    [EBP-56], ECX ;  Sum2
  263| 00029B C8                                        
;  Source Line # 264
  264| 00029C 8B45                        MOV    EAX, [EBP-8] 
  264| 00029E F8                                        
  264| 00029F 3945                        CMP    [EBP-4], EAX 
  264| 0002A1 FC                                        
  264| 0002A2 74                          JE     SHORT L24 
  264| 0002A3 0C                                        
  264| 0002A4 8B45                        MOV    EAX, [EBP-4] 
  264| 0002A6 FC                                        
  264| 0002A7 40                          INC    EAX    
  264| 0002A8 8945                        MOV    [EBP-4], EAX 
  264| 0002AA FC                                        
  264| 0002AB E9                          JMP    L26    
  264| 0002AC E3FEFFFF                                  
  264|                 L24:                             
;  Source Line # 265
  265| 0002B0 8B45                        MOV    EAX, [EBP-60] ;  Sum1
  265| 0002B2 C4                                        
  265| 0002B3 0FAF45                      IMUL   EAX, [EBP-64] ;  alfa4
  265| 0002B6 C0                                        
  265| 0002B7 CE                          INTO          
  265| 0002B8 0345                        ADD    EAX, [EBP-56] ;  Sum2
  265| 0002BA C8                                        
  265| 0002BB CE                          INTO          
  265| 0002BC 8B55                        MOV    EDX, [EBP-72] ; Spill
  265| 0002BE B8                                        
  265| 0002BF 8B5A                        MOV    EBX, [EDX+48] 
  265| 0002C1 30                                        
  265| 0002C2 8B8B                        MOV    ECX, [EBX-368] ;  MA
  265| 0002C4 90FEFFFF                                  
  265| 0002C8 8B75                        MOV    ESI, [EBP-24] 
  265| 0002CA E8                                        
  265| 0002CB 3B35                        CMP    ESI, package1.matr__constrained_array____1 
  265| 0002CD 00000000                                  
  265|                 L51:                             
  265| 0002D1 0F8F                        JG     L52    
  265| 0002D3 FB000000                                  
  265| 0002D7 8D76                        LEA    ESI, [ESI-1] 
  265| 0002D9 FF                                        
  265| 0002DA 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
  265| 0002DD 00000000                                  
  265| 0002E1 8B7D                        MOV    EDI, [EBP-12] 
  265| 0002E3 F4                                        
  265| 0002E4 83FF                        CMP    EDI, 1 
  265| 0002E6 01                                        
  265|                 L53:                             
  265| 0002E7 0F8C                        JL     L54    
  265| 0002E9 F1000000                                  
  265| 0002ED 3B3D                        CMP    EDI, package1.vec__constrained_array____1 
  265| 0002EF 00000000                                  
  265| 0002F3 0F8F                        JG     L54    
  265| 0002F5 E5000000                                  
  265| 0002F9 8D3CBD                      LEA    EDI, [4*EDI-4] 
  265| 0002FC FCFFFFFF                                  
  265| 000300 03F7                        ADD    ESI, EDI 
  265| 000302 890431                      MOV    [ECX+ESI+0], EAX 
;  Source Line # 266
  266| 000305 C745                        MOV    DWORD PTR [EBP-60], 0 ;  Sum1
  266| 000307 C4                                        
  266| 000308 00000000                                  
;  Source Line # 267
  267| 00030C C745                        MOV    DWORD PTR [EBP-56], 0 ;  Sum2
  267| 00030E C8                                        
  267| 00030F 00000000                                  
;  Source Line # 268
  268| 000313 8B45                        MOV    EAX, [EBP-16] 
  268| 000315 F0                                        
  268| 000316 3945                        CMP    [EBP-12], EAX 
  268| 000318 F4                                        
  268| 000319 74                          JE     SHORT L21 
  268| 00031A 0C                                        
  268| 00031B 8B45                        MOV    EAX, [EBP-12] 
  268| 00031D F4                                        
  268| 00031E 40                          INC    EAX    
  268| 00031F 8945                        MOV    [EBP-12], EAX 
  268| 000321 F4                                        
  268| 000322 E9                          JMP    L23    
  268| 000323 44FEFFFF                                  
  268|                 L21:                             
;  Source Line # 269
  269| 000327 8B45                        MOV    EAX, [EBP-28] 
  269| 000329 E4                                        
  269| 00032A 3945                        CMP    [EBP-24], EAX 
  269| 00032C E8                                        
  269| 00032D 74                          JE     SHORT L18 
  269| 00032E 0C                                        
  269| 00032F 8B45                        MOV    EAX, [EBP-24] 
  269| 000331 E8                                        
  269| 000332 40                          INC    EAX    
  269| 000333 8945                        MOV    [EBP-24], EAX 
  269| 000335 E8                                        
  269| 000336 E9                          JMP    L20    
  269| 000337 08FEFFFF                                  
  269|                 L18:                             
;  Source Line # 271
  271| 00033B 68                          PUSH   lab4.synchro.calcendsignal 
  271| 00033C 00000000                                  
  271| 000340 6A                          PUSH   0      
  271| 000341 00                                        
  271| 000342 8B55                        MOV    EDX, [EBP-72] ; Spill
  271| 000344 B8                                        
  271| 000345 8B42                        MOV    EAX, [EDX+48] 
  271| 000347 30                                        
  271| 000348 8D80                        LEA    EAX, [EAX-508] ;  Synchro
  271| 00034A 04FEFFFF                                  
  271| 00034E 50                          PUSH   EAX    
  271| 00034F E8                          CALL   rts_protected_procedure_call 
  271| 000350 00000000                                  
;  Source Line # 273
  273| 000354 68                          PUSH   __lcl.00000272 
  273| 000355 00000000                                  
  273| 000359 68                          PUSH   __lcl.00000271 
  273| 00035A 00000000                                  
  273| 00035E E8                          CALL   ada.text_io.put_line__2 
  273| 00035F 00000000                                  
  273| 000363 8D5D                        LEA    EBX, [EBP-52] ;  dyn_temp
  273| 000365 CC                                        
  273| 000366 53                          PUSH   EBX    
  273| 000367 E8                          CALL   rts_ss_release 
  273| 000368 00000000                                  
;  Source Line # 274
  274| 00036C 8BE5                        MOV    ESP, EBP 
  274| 00036E 5D                          POP    EBP    
  274| 00036F C2                          RET    4      
  274| 000370 0400                                      
  274|                 L36:                             
  274| 000372 8D05                        LEA    EAX, L35+5 
  274| 000374 AD010000                                  
  274| 000378 50                          PUSH   EAX    
  274| 000379 E9                          JMP    rts_raise_constraint_error 
  274| 00037A 00000000                                  
  274|                 L38:                             
  274| 00037E 8D05                        LEA    EAX, L37+5 
  274| 000380 C3010000                                  
  274| 000384 50                          PUSH   EAX    
  274| 000385 E9                          JMP    rts_raise_constraint_error 
  274| 000386 00000000                                  
  274|                 L40:                             
  274| 00038A 8D05                        LEA    EAX, L39+5 
  274| 00038C EA010000                                  
  274| 000390 50                          PUSH   EAX    
  274| 000391 E9                          JMP    rts_raise_constraint_error 
  274| 000392 00000000                                  
  274|                 L42:                             
  274| 000396 8D05                        LEA    EAX, L41+5 
  274| 000398 03020000                                  
  274| 00039C 50                          PUSH   EAX    
  274| 00039D E9                          JMP    rts_raise_constraint_error 
  274| 00039E 00000000                                  
  274|                 L44:                             
  274| 0003A2 8D05                        LEA    EAX, L43+5 
  274| 0003A4 36020000                                  
  274| 0003A8 50                          PUSH   EAX    
  274| 0003A9 E9                          JMP    rts_raise_constraint_error 
  274| 0003AA 00000000                                  
  274|                 L46:                             
  274| 0003AE 8D05                        LEA    EAX, L45+5 
  274| 0003B0 4F020000                                  
  274| 0003B4 50                          PUSH   EAX    
  274| 0003B5 E9                          JMP    rts_raise_constraint_error 
  274| 0003B6 00000000                                  
  274|                 L48:                             
  274| 0003BA 8D05                        LEA    EAX, L47+5 
  274| 0003BC 6A020000                                  
  274| 0003C0 50                          PUSH   EAX    
  274| 0003C1 E9                          JMP    rts_raise_constraint_error 
  274| 0003C2 00000000                                  
  274|                 L50:                             
  274| 0003C6 8D05                        LEA    EAX, L49+5 
  274| 0003C8 83020000                                  
  274| 0003CC 50                          PUSH   EAX    
  274| 0003CD E9                          JMP    rts_raise_constraint_error 
  274| 0003CE 00000000                                  
  274|                 L52:                             
  274| 0003D2 8D05                        LEA    EAX, L51+5 
  274| 0003D4 D6020000                                  
  274| 0003D8 50                          PUSH   EAX    
  274| 0003D9 E9                          JMP    rts_raise_constraint_error 
  274| 0003DA 00000000                                  
  274|                 L54:                             
  274| 0003DE 8D05                        LEA    EAX, L53+5 
  274| 0003E0 EC020000                                  
  274| 0003E4 50                          PUSH   EAX    
  274| 0003E5 E9                          JMP    rts_raise_constraint_error 
  274| 0003E6 00000000                                  
                       ;                                
                       lab4.t4__body      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000291     DD     00001E01 
                                          DD     000000EE 
                                          DD     lab4.t4__body 
                                          DD     __lcl.00000305 
                                          DD     000000F0 
                                          DD     lab4.t4__body+00000010H 
                                          DD     __lcl.00000305 
                                          DD     000000F1 
                                          DD     lab4.t4__body+0000005CH 
                                          DD     __lcl.00000305 
                                          DD     000000F2 
                                          DD     lab4.t4__body+00000061H 
                                          DD     __lcl.00000305 
                                          DD     000000F5 
                                          DD     lab4.t4__body+00000070H 
                                          DD     __lcl.00000305 
                                          DD     000000F6 
                                          DD     lab4.t4__body+00000082H 
                                          DD     __lcl.00000305 
                                          DD     000000F7 
                                          DD     lab4.t4__body+0000008BH 
                                          DD     __lcl.00000305 
                                          DD     000000F8 
                                          DD     lab4.t4__body+0000009DH 
                                          DD     __lcl.00000305 
                                          DD     000000F9 
                                          DD     lab4.t4__body+000000A6H 
                                          DD     __lcl.00000305 
                                          DD     000000FB 
                                          DD     lab4.t4__body+000000ADH 
                                          DD     __lcl.00000305 
                                          DD     000000FC 
                                          DD     lab4.t4__body+000000CEH 
                                          DD     __lcl.00000305 
                                          DD     000000FD 
                                          DD     lab4.t4__body+000000EFH 
                                          DD     __lcl.00000305 
                                          DD     000000FF 
                                          DD     lab4.t4__body+00000110H 
                                          DD     __lcl.00000305 
                                          DD     00000101 
                                          DD     lab4.t4__body+00000132H 
                                          DD     __lcl.00000305 
                                          DD     00000102 
                                          DD     lab4.t4__body+00000159H 
                                          DD     __lcl.00000305 
                                          DD     00000103 
                                          DD     lab4.t4__body+0000016BH 
                                          DD     __lcl.00000305 
                                          DD     00000104 
                                          DD     lab4.t4__body+00000172H 
                                          DD     __lcl.00000305 
                                          DD     00000105 
                                          DD     lab4.t4__body+00000182H 
                                          DD     __lcl.00000305 
                                          DD     00000106 
                                          DD     lab4.t4__body+00000193H 
                                          DD     __lcl.00000305 
                                          DD     00000107 
                                          DD     lab4.t4__body+0000021CH 
                                          DD     __lcl.00000305 
                                          DD     00000108 
                                          DD     lab4.t4__body+0000029CH 
                                          DD     __lcl.00000305 
                                          DD     00000109 
                                          DD     lab4.t4__body+000002B0H 
                                          DD     __lcl.00000305 
                                          DD     0000010A 
                                          DD     lab4.t4__body+00000305H 
                                          DD     __lcl.00000305 
                                          DD     0000010B 
                                          DD     lab4.t4__body+0000030CH 
                                          DD     __lcl.00000305 
                                          DD     0000010C 
                                          DD     lab4.t4__body+00000313H 
                                          DD     __lcl.00000305 
                                          DD     0000010D 
                                          DD     lab4.t4__body+00000327H 
                                          DD     __lcl.00000305 
                                          DD     0000010F 
                                          DD     lab4.t4__body+0000033BH 
                                          DD     __lcl.00000305 
                                          DD     00000111 
                                          DD     lab4.t4__body+00000354H 
                                          DD     __lcl.00000305 
                                          DD     00000112 
                                          DD     lab4.t4__body+0000036CH 
                                          DD     __lcl.00000305 
                                          DD     00000112 
                                          DD     lab4.t4__body+000003E6H 
                                          DD     __lcl.00000305 
; ********* End of segment, Total Size = 364

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
   13| 00000D 8A8424                      MOV    AL, [ESP-520] 
   13| 000010 F8FDFFFF                                  
   13| 000014 81EC                        SUB    ESP, 520 
   13| 000016 08020000                                  
   13| 00001A 8B42                        MOV    EAX, [EDX+48] 
   13| 00001C 30                                        
   13| 00001D 8945                        MOV    [EBP-4], EAX 
   13| 00001F FC                                        
   13| 000020 896A                        MOV    [EDX+48], EBP 
   13| 000022 30                                        
;  Source Line # 14
   14| 000023 8B02                        MOV    EAX, [EDX+0] 
   14| 000025 8985                        MOV    [EBP-372], EAX ;  dyn_temp
   14| 000027 8CFEFFFF                                  
   14| 00002B 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
   14| 00002D 00000000                                  
   14| 000031 83EB                        SUB    EBX, 1 
   14| 000033 01                                        
   14| 000034 7D                          JGE    SHORT L18 
   14| 000035 03                                        
   14| 000036 33DB                        XOR    EBX, EBX 
   14| 000038 4B                          DEC    EBX    
   14|                 L18:                             
   14| 000039 CE                          INTO          
   14| 00003A 43                          INC    EBX    
   14| 00003B CE                          INTO          
   14| 00003C 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   14| 00003F 00000000                                  
   14| 000043 CE                          INTO          
   14| 000044 53                          PUSH   EBX    
   14| 000045 8995                        MOV    [EBP-520], EDX ; Spill
   14| 000047 F8FDFFFF                                  
   14| 00004B E8                          CALL   rts_ss_allocate 
   14| 00004C 00000000                                  
   14| 000050 8985                        MOV    [EBP-368], EAX ;  MA
   14| 000052 90FEFFFF                                  
   14| 000056 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
   14| 000058 00000000                                  
   14| 00005C 83E9                        SUB    ECX, 1 
   14| 00005E 01                                        
   14| 00005F 7D                          JGE    SHORT L19 
   14| 000060 03                                        
   14| 000061 33C9                        XOR    ECX, ECX 
   14| 000063 49                          DEC    ECX    
   14|                 L19:                             
   14| 000064 CE                          INTO          
   14| 000065 41                          INC    ECX    
   14| 000066 CE                          INTO          
   14| 000067 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
   14| 00006A 00000000                                  
   14| 00006E CE                          INTO          
   14| 00006F 51                          PUSH   ECX    
   14| 000070 E8                          CALL   rts_ss_allocate 
   14| 000071 00000000                                  
   14| 000075 8985                        MOV    [EBP-364], EAX ;  MB
   14| 000077 94FEFFFF                                  
   14| 00007B 8B35                        MOV    ESI, package1.matr__constrained_array____1 
   14| 00007D 00000000                                  
   14| 000081 83EE                        SUB    ESI, 1 
   14| 000083 01                                        
   14| 000084 7D                          JGE    SHORT L20 
   14| 000085 03                                        
   14| 000086 33F6                        XOR    ESI, ESI 
   14| 000088 4E                          DEC    ESI    
   14|                 L20:                             
   14| 000089 CE                          INTO          
   14| 00008A 46                          INC    ESI    
   14| 00008B CE                          INTO          
   14| 00008C 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
   14| 00008F 00000000                                  
   14| 000093 CE                          INTO          
   14| 000094 56                          PUSH   ESI    
   14| 000095 E8                          CALL   rts_ss_allocate 
   14| 000096 00000000                                  
   14| 00009A 8985                        MOV    [EBP-360], EAX ;  MZ
   14| 00009C 98FEFFFF                                  
   14| 0000A0 8B3D                        MOV    EDI, package1.matr__constrained_array____1 
   14| 0000A2 00000000                                  
   14| 0000A6 83EF                        SUB    EDI, 1 
   14| 0000A8 01                                        
   14| 0000A9 7D                          JGE    SHORT L21 
   14| 0000AA 03                                        
   14| 0000AB 33FF                        XOR    EDI, EDI 
   14| 0000AD 4F                          DEC    EDI    
   14|                 L21:                             
   14| 0000AE CE                          INTO          
   14| 0000AF 47                          INC    EDI    
   14| 0000B0 CE                          INTO          
   14| 0000B1 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
   14| 0000B4 00000000                                  
   14| 0000B8 CE                          INTO          
   14| 0000B9 57                          PUSH   EDI    
   14| 0000BA E8                          CALL   rts_ss_allocate 
   14| 0000BB 00000000                                  
   14| 0000BF 8985                        MOV    [EBP-356], EAX ;  ME
   14| 0000C1 9CFEFFFF                                  
   14| 0000C5 8B15                        MOV    EDX, package1.matr__constrained_array____1 
   14| 0000C7 00000000                                  
   14| 0000CB 83EA                        SUB    EDX, 1 
   14| 0000CD 01                                        
   14| 0000CE 7D                          JGE    SHORT L22 
   14| 0000CF 03                                        
   14| 0000D0 33D2                        XOR    EDX, EDX 
   14| 0000D2 4A                          DEC    EDX    
   14|                 L22:                             
   14| 0000D3 CE                          INTO          
   14| 0000D4 42                          INC    EDX    
   14| 0000D5 CE                          INTO          
   14| 0000D6 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
   14| 0000D9 00000000                                  
   14| 0000DD CE                          INTO          
   14| 0000DE 52                          PUSH   EDX    
   14| 0000DF E8                          CALL   rts_ss_allocate 
   14| 0000E0 00000000                                  
   14| 0000E4 8985                        MOV    [EBP-352], EAX ;  MR
   14| 0000E6 A0FEFFFF                                  
;  Source Line # 22
   22| 0000EA C645                        MOV    BYTE PTR [EBP-16], 0 ;  Synchro__elab_bool
   22| 0000EC F0                                        
   22| 0000ED 00                                        
   22| 0000EE 6A                          PUSH   0      
   22| 0000EF 00                                        
   22| 0000F0 8D9D                        LEA    EBX, [EBP-344] ;  master_record
   22| 0000F2 A8FEFFFF                                  
   22| 0000F6 53                          PUSH   EBX    
   22| 0000F7 E8                          CALL   rts_init_master 
   22| 0000F8 00000000                                  
   22| 0000FC C785                        MOV    DWORD PTR [EBP-440], 0 ;  Synchro
   22| 0000FE 48FEFFFF                                  
   22| 000102 00000000                                  
   22| 000106 C785                        MOV    DWORD PTR [EBP-436], 0 ;  Synchro
   22| 000108 4CFEFFFF                                  
   22| 00010C 00000000                                  
   22| 000110 6A                          PUSH   0      
   22| 000111 00                                        
   22| 000112 68                          PUSH   lab4.synchro__protected_type_desc 
   22| 000113 00000000                                  
   22| 000117 6A                          PUSH   30     
   22| 000118 1E                                        
   22| 000119 8D8D                        LEA    ECX, [EBP-508] ;  Synchro
   22| 00011B 04FEFFFF                                  
   22| 00011F 51                          PUSH   ECX    
   22| 000120 8DB5                        LEA    ESI, [EBP-288] ;  cleanup
   22| 000122 E0FEFFFF                                  
   22| 000126 56                          PUSH   ESI    
   22| 000127 8DBD                        LEA    EDI, [EBP-344] ;  master_record
   22| 000129 A8FEFFFF                                  
   22| 00012D 57                          PUSH   EDI    
   22| 00012E E8                          CALL   rts_init_po 
   22| 00012F 00000000                                  
;  Source Line # 34
   34| 000133 C645                        MOV    BYTE PTR [EBP-15], 0 ;  OP_MZ__elab_bool
   34| 000135 F1                                        
   34| 000136 00                                        
   34| 000137 8B15                        MOV    EDX, package1.matr__constrained_array____1 
   34| 000139 00000000                                  
   34| 00013D 83EA                        SUB    EDX, 1 
   34| 00013F 01                                        
   34| 000140 7D                          JGE    SHORT L23 
   34| 000141 03                                        
   34| 000142 33D2                        XOR    EDX, EDX 
   34| 000144 4A                          DEC    EDX    
   34|                 L23:                             
   34| 000145 CE                          INTO          
   34| 000146 42                          INC    EDX    
   34| 000147 CE                          INTO          
   34| 000148 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
   34| 00014B 00000000                                  
   34| 00014F CE                          INTO          
   34| 000150 83C2                        ADD    EDX, 7 
   34| 000152 07                                        
   34| 000153 CE                          INTO          
   34| 000154 83E2                        AND    EDX, -8 
   34| 000156 F8                                        
   34| 000157 83C2                        ADD    EDX, 48 
   34| 000159 30                                        
   34| 00015A CE                          INTO          
   34| 00015B 52                          PUSH   EDX    
   34| 00015C E8                          CALL   rts_ss_allocate 
   34| 00015D 00000000                                  
   34| 000161 8985                        MOV    [EBP-256], EAX ;  OP_MZ
   34| 000163 00FFFFFF                                  
   34| 000167 6A                          PUSH   0      
   34| 000168 00                                        
   34| 000169 68                          PUSH   lab4.op_mz__protected_type_desc 
   34| 00016A 00000000                                  
   34| 00016E 6A                          PUSH   30     
   34| 00016F 1E                                        
   34| 000170 8B9D                        MOV    EBX, [EBP-256] ;  OP_MZ
   34| 000172 00FFFFFF                                  
   34| 000176 53                          PUSH   EBX    
   34| 000177 8D8D                        LEA    ECX, [EBP-252] ;  cleanup
   34| 000179 04FFFFFF                                  
   34| 00017D 51                          PUSH   ECX    
   34| 00017E 8DB5                        LEA    ESI, [EBP-344] ;  master_record
   34| 000180 A8FEFFFF                                  
   34| 000184 56                          PUSH   ESI    
   34| 000185 E8                          CALL   rts_init_po 
   34| 000186 00000000                                  
;  Source Line # 43
   43| 00018A C645                        MOV    BYTE PTR [EBP-14], 0 ;  OP_alfa__elab_bool
   43| 00018C F2                                        
   43| 00018D 00                                        
   43| 00018E 6A                          PUSH   0      
   43| 00018F 00                                        
   43| 000190 68                          PUSH   lab4.op_alfa__protected_type_desc 
   43| 000191 00000000                                  
   43| 000195 6A                          PUSH   30     
   43| 000196 1E                                        
   43| 000197 8DBD                        LEA    EDI, [EBP-428] ;  OP_alfa
   43| 000199 54FEFFFF                                  
   43| 00019D 57                          PUSH   EDI    
   43| 00019E 8D95                        LEA    EDX, [EBP-220] ;  cleanup
   43| 0001A0 24FFFFFF                                  
   43| 0001A4 52                          PUSH   EDX    
   43| 0001A5 8D85                        LEA    EAX, [EBP-344] ;  master_record
   43| 0001A7 A8FEFFFF                                  
   43| 0001AB 50                          PUSH   EAX    
   43| 0001AC E8                          CALL   rts_init_po 
   43| 0001AD 00000000                                  
;  Source Line # 52
   52| 0001B1 C645                        MOV    BYTE PTR [EBP-13], 0 ;  OP_MR__elab_bool
   52| 0001B3 F3                                        
   52| 0001B4 00                                        
   52| 0001B5 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
   52| 0001B7 00000000                                  
   52| 0001BB 83EB                        SUB    EBX, 1 
   52| 0001BD 01                                        
   52| 0001BE 7D                          JGE    SHORT L24 
   52| 0001BF 03                                        
   52| 0001C0 33DB                        XOR    EBX, EBX 
   52| 0001C2 4B                          DEC    EBX    
   52|                 L24:                             
   52| 0001C3 CE                          INTO          
   52| 0001C4 43                          INC    EBX    
   52| 0001C5 CE                          INTO          
   52| 0001C6 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   52| 0001C9 00000000                                  
   52| 0001CD CE                          INTO          
   52| 0001CE 83C3                        ADD    EBX, 7 
   52| 0001D0 07                                        
   52| 0001D1 CE                          INTO          
   52| 0001D2 83E3                        AND    EBX, -8 
   52| 0001D4 F8                                        
   52| 0001D5 83C3                        ADD    EBX, 48 
   52| 0001D7 30                                        
   52| 0001D8 CE                          INTO          
   52| 0001D9 53                          PUSH   EBX    
   52| 0001DA E8                          CALL   rts_ss_allocate 
   52| 0001DB 00000000                                  
   52| 0001DF 8985                        MOV    [EBP-188], EAX ;  OP_MR
   52| 0001E1 44FFFFFF                                  
   52| 0001E5 6A                          PUSH   0      
   52| 0001E6 00                                        
   52| 0001E7 68                          PUSH   lab4.op_mr__protected_type_desc 
   52| 0001E8 00000000                                  
   52| 0001EC 6A                          PUSH   30     
   52| 0001ED 1E                                        
   52| 0001EE 8B8D                        MOV    ECX, [EBP-188] ;  OP_MR
   52| 0001F0 44FFFFFF                                  
   52| 0001F4 51                          PUSH   ECX    
   52| 0001F5 8DB5                        LEA    ESI, [EBP-184] ;  cleanup
   52| 0001F7 48FFFFFF                                  
   52| 0001FB 56                          PUSH   ESI    
   52| 0001FC 8DBD                        LEA    EDI, [EBP-344] ;  master_record
   52| 0001FE A8FEFFFF                                  
   52| 000202 57                          PUSH   EDI    
   52| 000203 E8                          CALL   rts_init_po 
   52| 000204 00000000                                  
;  Source Line # 65
   65| 000208 C645                        MOV    BYTE PTR [EBP-16], 1 ;  Synchro__elab_bool
   65| 00020A F0                                        
   65| 00020B 01                                        
;  Source Line # 85
   85| 00020C C645                        MOV    BYTE PTR [EBP-15], 1 ;  OP_MZ__elab_bool
   85| 00020E F1                                        
   85| 00020F 01                                        
;  Source Line # 102
  102| 000210 C645                        MOV    BYTE PTR [EBP-14], 1 ;  OP_alfa__elab_bool
  102| 000212 F2                                        
  102| 000213 01                                        
;  Source Line # 115
  115| 000214 C645                        MOV    BYTE PTR [EBP-13], 1 ;  OP_MR__elab_bool
  115| 000216 F3                                        
  115| 000217 01                                        
;  Source Line # 134
  134| 000218 C645                        MOV    BYTE PTR [EBP-12], 0 ;  T1__elab_bool
  134| 00021A F4                                        
  134| 00021B 00                                        
  134| 00021C 8D95                        LEA    EDX, [EBP-152] ;  activation_list
  134| 00021E 68FFFFFF                                  
  134| 000222 52                          PUSH   EDX    
  134| 000223 E8                          CALL   rts_initialize_activation_list 
  134| 000224 00000000                                  
  134| 000228 68                          PUSH   __lcl.00000278 
  134| 000229 00000000                                  
  134| 00022D 6A                          PUSH   0      
  134| 00022E 00                                        
  134| 00022F 8D5D                        LEA    EBX, [EBP-12] ;  T1__elab_bool
  134| 000231 F4                                        
  134| 000232 53                          PUSH   EBX    
  134| 000233 6A                          PUSH   0      
  134| 000234 00                                        
  134| 000235 8D45                        LEA    EAX, [EBP-80] ;  T1
  134| 000237 B0                                        
  134| 000238 50                          PUSH   EAX    
  134| 000239 6A                          PUSH   0      
  134| 00023A 00                                        
  134| 00023B 68                          PUSH   lab4.t1__body 
  134| 00023C 00000000                                  
  134| 000240 8D8D                        LEA    ECX, [EBP-344] ;  master_record
  134| 000242 A8FEFFFF                                  
  134| 000246 51                          PUSH   ECX    
  134| 000247 8DB5                        LEA    ESI, [EBP-152] ;  activation_list
  134| 000249 68FFFFFF                                  
  134| 00024D 56                          PUSH   ESI    
  134| 00024E 6A                          PUSH   0      
  134| 00024F 00                                        
  134| 000250 E8                          CALL   rts_initialize_task_with_name 
  134| 000251 00000000                                  
;  Source Line # 135
  135| 000255 C645                        MOV    BYTE PTR [EBP-11], 0 ;  T2__elab_bool
  135| 000257 F5                                        
  135| 000258 00                                        
  135| 000259 68                          PUSH   __lcl.00000279 
  135| 00025A 00000000                                  
  135| 00025E 6A                          PUSH   0      
  135| 00025F 00                                        
  135| 000260 8D7D                        LEA    EDI, [EBP-11] ;  T2__elab_bool
  135| 000262 F5                                        
  135| 000263 57                          PUSH   EDI    
  135| 000264 6A                          PUSH   0      
  135| 000265 00                                        
  135| 000266 8D55                        LEA    EDX, [EBP-64] ;  T2
  135| 000268 C0                                        
  135| 000269 52                          PUSH   EDX    
  135| 00026A 6A                          PUSH   0      
  135| 00026B 00                                        
  135| 00026C 68                          PUSH   lab4.t2__body 
  135| 00026D 00000000                                  
  135| 000271 8D9D                        LEA    EBX, [EBP-344] ;  master_record
  135| 000273 A8FEFFFF                                  
  135| 000277 53                          PUSH   EBX    
  135| 000278 8D85                        LEA    EAX, [EBP-152] ;  activation_list
  135| 00027A 68FFFFFF                                  
  135| 00027E 50                          PUSH   EAX    
  135| 00027F 6A                          PUSH   0      
  135| 000280 00                                        
  135| 000281 E8                          CALL   rts_initialize_task_with_name 
  135| 000282 00000000                                  
;  Source Line # 136
  136| 000286 C645                        MOV    BYTE PTR [EBP-10], 0 ;  T3__elab_bool
  136| 000288 F6                                        
  136| 000289 00                                        
  136| 00028A 68                          PUSH   __lcl.00000280 
  136| 00028B 00000000                                  
  136| 00028F 6A                          PUSH   0      
  136| 000290 00                                        
  136| 000291 8D4D                        LEA    ECX, [EBP-10] ;  T3__elab_bool
  136| 000293 F6                                        
  136| 000294 51                          PUSH   ECX    
  136| 000295 6A                          PUSH   0      
  136| 000296 00                                        
  136| 000297 8D75                        LEA    ESI, [EBP-48] ;  T3
  136| 000299 D0                                        
  136| 00029A 56                          PUSH   ESI    
  136| 00029B 6A                          PUSH   0      
  136| 00029C 00                                        
  136| 00029D 68                          PUSH   lab4.t3__body 
  136| 00029E 00000000                                  
  136| 0002A2 8DBD                        LEA    EDI, [EBP-344] ;  master_record
  136| 0002A4 A8FEFFFF                                  
  136| 0002A8 57                          PUSH   EDI    
  136| 0002A9 8D95                        LEA    EDX, [EBP-152] ;  activation_list
  136| 0002AB 68FFFFFF                                  
  136| 0002AF 52                          PUSH   EDX    
  136| 0002B0 6A                          PUSH   0      
  136| 0002B1 00                                        
  136| 0002B2 E8                          CALL   rts_initialize_task_with_name 
  136| 0002B3 00000000                                  
;  Source Line # 137
  137| 0002B7 C645                        MOV    BYTE PTR [EBP-9], 0 ;  T4__elab_bool
  137| 0002B9 F7                                        
  137| 0002BA 00                                        
  137| 0002BB 68                          PUSH   __lcl.00000281 
  137| 0002BC 00000000                                  
  137| 0002C0 6A                          PUSH   0      
  137| 0002C1 00                                        
  137| 0002C2 8D5D                        LEA    EBX, [EBP-9] ;  T4__elab_bool
  137| 0002C4 F7                                        
  137| 0002C5 53                          PUSH   EBX    
  137| 0002C6 6A                          PUSH   0      
  137| 0002C7 00                                        
  137| 0002C8 8D45                        LEA    EAX, [EBP-32] ;  T4
  137| 0002CA E0                                        
  137| 0002CB 50                          PUSH   EAX    
  137| 0002CC 6A                          PUSH   0      
  137| 0002CD 00                                        
  137| 0002CE 68                          PUSH   lab4.t4__body 
  137| 0002CF 00000000                                  
  137| 0002D3 8D8D                        LEA    ECX, [EBP-344] ;  master_record
  137| 0002D5 A8FEFFFF                                  
  137| 0002D9 51                          PUSH   ECX    
  137| 0002DA 8DB5                        LEA    ESI, [EBP-152] ;  activation_list
  137| 0002DC 68FFFFFF                                  
  137| 0002E0 56                          PUSH   ESI    
  137| 0002E1 6A                          PUSH   0      
  137| 0002E2 00                                        
  137| 0002E3 E8                          CALL   rts_initialize_task_with_name 
  137| 0002E4 00000000                                  
;  Source Line # 140
  140| 0002E8 C645                        MOV    BYTE PTR [EBP-12], 1 ;  T1__elab_bool
  140| 0002EA F4                                        
  140| 0002EB 01                                        
;  Source Line # 174
  174| 0002EC C645                        MOV    BYTE PTR [EBP-11], 1 ;  T2__elab_bool
  174| 0002EE F5                                        
  174| 0002EF 01                                        
;  Source Line # 206
  206| 0002F0 C645                        MOV    BYTE PTR [EBP-10], 1 ;  T3__elab_bool
  206| 0002F2 F6                                        
  206| 0002F3 01                                        
;  Source Line # 238
  238| 0002F4 C645                        MOV    BYTE PTR [EBP-9], 1 ;  T4__elab_bool
  238| 0002F6 F7                                        
  238| 0002F7 01                                        
;  Source Line # 276
  276| 0002F8 8DBD                        LEA    EDI, [EBP-152] ;  activation_list
  276| 0002FA 68FFFFFF                                  
  276| 0002FE 57                          PUSH   EDI    
  276| 0002FF E8                          CALL   rts_activate_tasks 
  276| 000300 00000000                                  
  276| 000304 8D95                        LEA    EDX, [EBP-344] ;  master_record
  276| 000306 A8FEFFFF                                  
  276| 00030A 52                          PUSH   EDX    
  276| 00030B E8                          CALL   rts_finalize_and_pop 
  276| 00030C 00000000                                  
  276| 000310 8D9D                        LEA    EBX, [EBP-372] ;  dyn_temp
  276| 000312 8CFEFFFF                                  
  276| 000316 53                          PUSH   EBX    
  276| 000317 E8                          CALL   rts_ss_release 
  276| 000318 00000000                                  
;  Source Line # 278
  278| 00031C 8B95                        MOV    EDX, [EBP-520] ; Spill
  278| 00031E F8FDFFFF                                  
  278| 000322 8B4D                        MOV    ECX, [EBP-4] 
  278| 000324 FC                                        
  278| 000325 894A                        MOV    [EDX+48], ECX 
  278| 000327 30                                        
  278| 000328 8BE5                        MOV    ESP, EBP 
  278| 00032A 5D                          POP    EBP    
  278| 00032B C3                          RET           
                       ;                                
                       lab4               ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000290     DD     00001501 
                                          DD     0000000D 
                                          DD     lab4   
                                          DD     __lcl.00000305 
                                          DD     0000000E 
                                          DD     lab4+00000023H 
                                          DD     __lcl.00000305 
                                          DD     00000016 
                                          DD     lab4+000000EAH 
                                          DD     __lcl.00000305 
                                          DD     00000022 
                                          DD     lab4+00000133H 
                                          DD     __lcl.00000305 
                                          DD     0000002B 
                                          DD     lab4+0000018AH 
                                          DD     __lcl.00000305 
                                          DD     00000034 
                                          DD     lab4+000001B1H 
                                          DD     __lcl.00000305 
                                          DD     00000041 
                                          DD     lab4+00000208H 
                                          DD     __lcl.00000305 
                                          DD     00000055 
                                          DD     lab4+0000020CH 
                                          DD     __lcl.00000305 
                                          DD     00000066 
                                          DD     lab4+00000210H 
                                          DD     __lcl.00000305 
                                          DD     00000073 
                                          DD     lab4+00000214H 
                                          DD     __lcl.00000305 
                                          DD     00000086 
                                          DD     lab4+00000218H 
                                          DD     __lcl.00000305 
                                          DD     00000087 
                                          DD     lab4+00000255H 
                                          DD     __lcl.00000305 
                                          DD     00000088 
                                          DD     lab4+00000286H 
                                          DD     __lcl.00000305 
                                          DD     00000089 
                                          DD     lab4+000002B7H 
                                          DD     __lcl.00000305 
                                          DD     0000008C 
                                          DD     lab4+000002E8H 
                                          DD     __lcl.00000305 
                                          DD     000000AE 
                                          DD     lab4+000002ECH 
                                          DD     __lcl.00000305 
                                          DD     000000CE 
                                          DD     lab4+000002F0H 
                                          DD     __lcl.00000305 
                                          DD     000000EE 
                                          DD     lab4+000002F4H 
                                          DD     __lcl.00000305 
                                          DD     00000114 
                                          DD     lab4+000002F8H 
                                          DD     __lcl.00000305 
                                          DD     00000116 
                                          DD     lab4+0000031CH 
                                          DD     __lcl.00000305 
                                          DD     00000116 
                                          DD     lab4+00000328H 
                                          DD     __lcl.00000305 
; ********* End of segment, Total Size = 256


; ************* Initialized part of the global segment :
                                          ALIGN 4       
     000000            __lcl.00000281     DB     'Lab4.T4' 
                                          DB     00H    
     000008            __lcl.00000280     DB     'Lab4.T3' 
                                          DB     00H    
     000010            __lcl.00000279     DB     'Lab4.T2' 
                                          DB     00H    
     000018            __lcl.00000278     DB     'Lab4.T1' 
                                          DB     00H    
     000020            __lcl.00000272     DD     00000001 
                                          DD     00000007 
     000028            __lcl.00000271     DB     'T4 stop' 
                                          DB     00     
     000030            __lcl.00000253     DD     00000001 
                                          DD     00000008 
     000038            __lcl.00000252     DB     'T4 start' 
     000040            __lcl.00000246     DD     00000001 
                                          DD     00000007 
     000048            __lcl.00000245     DB     'T3 stop' 
                                          DB     00     
     000050            __lcl.00000227     DD     00000001 
                                          DD     00000008 
     000058            __lcl.00000226     DB     'T3 start' 
     000060            __lcl.00000220     DD     00000001 
                                          DD     00000007 
     000068            __lcl.00000219     DB     'T2 stop' 
                                          DB     00     
     000070            __lcl.00000201     DD     00000001 
                                          DD     00000008 
     000078            __lcl.00000200     DB     'T2 start' 
     000080            __lcl.00000192     DD     00000001 
                                          DD     00000007 
     000088            __lcl.00000191     DB     'T1 stop' 
                                          DB     00     
     000090            __lcl.00000190     DD     00000001 
                                          DD     0000000D 
     000098            __lcl.00000189     DB     '             ' 
                                          DB     00H,00H,00H 
     0000A8            __lcl.00000170     DD     00000001 
                                          DD     00000008 
     0000B0            __lcl.00000169     DB     'T1 start' 
     0000B8            lab4.op_mr__protected_type_desc DB 00 
                                          DB     3 DUP(00) 
                                          DD     FFFFFFFF 
                                          DD     00000000 
     0000C4            lab4.op_alfa__protected_type_desc DB 00 
                                          DB     3 DUP(00) 
                                          DD     FFFFFFFF 
                                          DD     00000000 
     0000D0            lab4.op_mz__protected_type_desc DB 00 
                                          DB     3 DUP(00) 
                                          DD     FFFFFFFF 
                                          DD     00000000 
     0000DC            lab4.synchro__protected_type_desc DB 01 
                                          DB     3 DUP(00) 
                                          DD     00000001 
                                          DD     00000000 
                                          DB     01     
                                          DB     3 DUP(00) 
                                          DD     00000018 
                                          DD     lab4.synchro__all_barriers 
                                          DD     lab4.synchro.outputsync 
                                          DD     lab4.synchro.inputsync 
; ********* End of segment, Total Size = 252


; ************* .av_dbgr segment :
                                          ALIGN 4       
                                          DD     00000000 
                                          DD     00000000 
     000008            lab4__rootpart____1 DD    lab4__subp_body_subpdesc____1 
; ********* End of segment, Total Size = 16


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000289     DB     04H    
                                          DB     'Lab4' 
                                          DB     00H,00H,00H 
     000008            lab4__subp_body_subpdesc____1 DD __lcl.00000289 
                                          DD     00000001 
                                          DD     __lcl.00000126 
                                          DD     0000000D 
                                          DD     00000114 
                                          DD     00000116 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000282 
                                          DD     __lcl.00000283 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000284 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000290 
                                          DD     00000208 
                                          DD     __lcl.00000001 
     00006C            __lcl.00000288     DB     02H    
                                          DB     'MA'   
                                          DB     00     
     000070            __lcl.00000287     DB     02H    
                                          DB     'MB'   
                                          DB     00     
     000074            __lcl.00000286     DB     02H    
                                          DB     'ME'   
                                          DB     00     
     000078            __lcl.00000285     DB     04H    
                                          DB     'Alfa' 
                                          DB     00H,00H,00H 
     000080            __lcl.00000284     DD     0000000E 
                                          DD     __lcl.00000168 
                                          DD     __lcl.00000167 
                                          DD     FFFFFFE0 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000166 
                                          DD     __lcl.00000165 
                                          DD     FFFFFFD0 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000164 
                                          DD     __lcl.00000163 
                                          DD     FFFFFFC0 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000162 
                                          DD     __lcl.00000161 
                                          DD     FFFFFFB0 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000125 
                                          DD     __lcl.00000124 
                                          DD     FFFFFF44 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000114 
                                          DD     __lcl.00000113 
                                          DD     FFFFFE54 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000105 
                                          DD     __lcl.00000104 
                                          DD     FFFFFF00 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000029 
                                          DD     __lcl.00000028 
                                          DD     FFFFFE04 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000285 
                                          DD     __lcl.00000005 
                                          DD     FFFFFEA4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000119 
                                          DD     __lcl.00000018 
                                          DD     FFFFFEA0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000286 
                                          DD     __lcl.00000018 
                                          DD     FFFFFE9C 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000098 
                                          DD     __lcl.00000018 
                                          DD     FFFFFE98 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000287 
                                          DD     __lcl.00000018 
                                          DD     FFFFFE94 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000288 
                                          DD     __lcl.00000018 
                                          DD     FFFFFE90 
                                          DD     00000103 
                                          DD     00000000 
     00019C            __lcl.00000283     DD     00000008 
                                          DD     lab4.synchro__protected_body_subpdesc____1 
                                          DD     lab4.op_mz__protected_body_subpdesc____1 
                                          DD     lab4.op_alfa__protected_body_subpdesc____1 
                                          DD     lab4.op_mr__protected_body_subpdesc____1 
                                          DD     lab4.t1__task_subpdesc____1 
                                          DD     lab4.t2__task_subpdesc____1 
                                          DD     lab4.t3__task_subpdesc____1 
                                          DD     lab4.t4__task_subpdesc____1 
     0001C0            __lcl.00000282     DD     00000008 
                                          DD     __lcl.00000168 
                                          DD     __lcl.00000167 
                                          DD     __lcl.00000166 
                                          DD     __lcl.00000165 
                                          DD     __lcl.00000164 
                                          DD     __lcl.00000163 
                                          DD     __lcl.00000162 
                                          DD     __lcl.00000161 
                                          DD     __lcl.00000125 
                                          DD     __lcl.00000124 
                                          DD     __lcl.00000114 
                                          DD     __lcl.00000113 
                                          DD     __lcl.00000105 
                                          DD     __lcl.00000104 
                                          DD     __lcl.00000029 
                                          DD     __lcl.00000028 
     000204            lab4.t4__task_subpdesc____1 DD __lcl.00000168 
                                          DD     00000010 
                                          DD     __lcl.00000126 
                                          DD     000000EE 
                                          DD     000000F1 
                                          DD     00000112 
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
                                          DD     __lcl.00000273 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000277 
                                          DD     __lcl.00000167 
                                          DD     00000000 
                                          DD     __lcl.00000291 
                                          DD     00000048 
                                          DD     __lcl.00000001 
     000268            __lcl.00000277     DD     00000001 
                                          DD     __lcl.00000270 
     000270            __lcl.00000276     DB     05H    
                                          DB     'alfa4' 
                                          DW     0000   
     000278            __lcl.00000275     DB     03H    
                                          DB     'MZ4'  
     00027C            __lcl.00000274     DB     03H    
                                          DB     'MR4'  
     000280            __lcl.00000273     DD     00000005 
                                          DD     __lcl.00000274 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFD4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000275 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFD0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000196 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFC8 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000197 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFC4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000276 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFC0 
                                          DD     00000003 
                                          DD     00000000 
     0002E8            __lcl.00000270     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     00000101 
                                          DD     00000101 
                                          DD     0000010D 
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
                                          DD     __lcl.00000268 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000269 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00034C            __lcl.00000269     DD     00000001 
                                          DD     __lcl.00000267 
     000354            __lcl.00000268     DD     00000001 
                                          DD     __lcl.00000138 
                                          DD     __lcl.00000256 
                                          DD     FFFFFFE8 
                                          DD     00000003 
                                          DD     00000001 
     00036C            __lcl.00000267     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     00000102 
                                          DD     00000102 
                                          DD     0000010C 
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
                                          DD     __lcl.00000265 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000266 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0003D0            __lcl.00000266     DD     00000001 
                                          DD     __lcl.00000264 
     0003D8            __lcl.00000265     DD     00000001 
                                          DD     __lcl.00000135 
                                          DD     __lcl.00000259 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     0003F0            __lcl.00000264     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     00000105 
                                          DD     00000105 
                                          DD     00000108 
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
                                          DD     __lcl.00000263 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000454            __lcl.00000263     DD     00000001 
                                          DD     __lcl.00000181 
                                          DD     __lcl.00000262 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     00046C            __lcl.00000262     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000260 
                                          DD     __lcl.00000261 
     000488            __lcl.00000261     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000494            __lcl.00000260     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0004A0            __lcl.00000259     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000257 
                                          DD     __lcl.00000258 
     0004BC            __lcl.00000258     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     0004C8            __lcl.00000257     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     0004D4            __lcl.00000256     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000254 
                                          DD     __lcl.00000255 
     0004F0            __lcl.00000255     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE4 
     0004FC            __lcl.00000254     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000508            lab4.t3__task_subpdesc____1 DD __lcl.00000166 
                                          DD     0000000F 
                                          DD     __lcl.00000126 
                                          DD     000000CE 
                                          DD     000000D1 
                                          DD     000000EB 
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
                                          DD     __lcl.00000247 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000251 
                                          DD     __lcl.00000165 
                                          DD     00000000 
                                          DD     __lcl.00000292 
                                          DD     0000004C 
                                          DD     __lcl.00000001 
     00056C            __lcl.00000251     DD     00000001 
                                          DD     __lcl.00000244 
     000574            __lcl.00000250     DB     05H    
                                          DB     'alfa3' 
                                          DW     0000   
     00057C            __lcl.00000249     DB     03H    
                                          DB     'MZ3'  
     000580            __lcl.00000248     DB     03H    
                                          DB     'MR3'  
     000584            __lcl.00000247     DD     00000005 
                                          DD     __lcl.00000248 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFD0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000249 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFCC 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000196 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFC4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000197 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFC0 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000250 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFBC 
                                          DD     00000003 
                                          DD     00000000 
     0005EC            __lcl.00000244     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     000000DA 
                                          DD     000000DA 
                                          DD     000000E6 
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
                                          DD     __lcl.00000242 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000243 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000650            __lcl.00000243     DD     00000001 
                                          DD     __lcl.00000241 
     000658            __lcl.00000242     DD     00000001 
                                          DD     __lcl.00000138 
                                          DD     __lcl.00000230 
                                          DD     FFFFFFE8 
                                          DD     00000003 
                                          DD     00000001 
     000670            __lcl.00000241     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     000000DB 
                                          DD     000000DB 
                                          DD     000000E5 
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
                                          DD     __lcl.00000239 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000240 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0006D4            __lcl.00000240     DD     00000001 
                                          DD     __lcl.00000238 
     0006DC            __lcl.00000239     DD     00000001 
                                          DD     __lcl.00000135 
                                          DD     __lcl.00000233 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     0006F4            __lcl.00000238     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     000000DE 
                                          DD     000000DE 
                                          DD     000000E1 
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
                                          DD     __lcl.00000237 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000758            __lcl.00000237     DD     00000001 
                                          DD     __lcl.00000181 
                                          DD     __lcl.00000236 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000770            __lcl.00000236     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000234 
                                          DD     __lcl.00000235 
     00078C            __lcl.00000235     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000798            __lcl.00000234     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0007A4            __lcl.00000233     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000231 
                                          DD     __lcl.00000232 
     0007C0            __lcl.00000232     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     0007CC            __lcl.00000231     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     0007D8            __lcl.00000230     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000228 
                                          DD     __lcl.00000229 
     0007F4            __lcl.00000229     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE4 
     000800            __lcl.00000228     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00080C            lab4.t2__task_subpdesc____1 DD __lcl.00000164 
                                          DD     0000000E 
                                          DD     __lcl.00000126 
                                          DD     000000AE 
                                          DD     000000B1 
                                          DD     000000CB 
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
                                          DD     __lcl.00000221 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000225 
                                          DD     __lcl.00000163 
                                          DD     00000000 
                                          DD     __lcl.00000293 
                                          DD     0000004C 
                                          DD     __lcl.00000001 
     000870            __lcl.00000225     DD     00000001 
                                          DD     __lcl.00000218 
     000878            __lcl.00000224     DB     05H    
                                          DB     'alfa2' 
                                          DW     0000   
     000880            __lcl.00000223     DB     03H    
                                          DB     'MZ2'  
     000884            __lcl.00000222     DB     03H    
                                          DB     'MR2'  
     000888            __lcl.00000221     DD     00000005 
                                          DD     __lcl.00000222 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFD0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000223 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFCC 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000196 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFC4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000197 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFC0 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000224 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFBC 
                                          DD     00000003 
                                          DD     00000000 
     0008F0            __lcl.00000218     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     000000BA 
                                          DD     000000BA 
                                          DD     000000C6 
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
                                          DD     __lcl.00000216 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000217 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000954            __lcl.00000217     DD     00000001 
                                          DD     __lcl.00000215 
     00095C            __lcl.00000216     DD     00000001 
                                          DD     __lcl.00000138 
                                          DD     __lcl.00000204 
                                          DD     FFFFFFE8 
                                          DD     00000003 
                                          DD     00000001 
     000974            __lcl.00000215     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     000000BB 
                                          DD     000000BB 
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
                                          DD     __lcl.00000213 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000214 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0009D8            __lcl.00000214     DD     00000001 
                                          DD     __lcl.00000212 
     0009E0            __lcl.00000213     DD     00000001 
                                          DD     __lcl.00000135 
                                          DD     __lcl.00000207 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     0009F8            __lcl.00000212     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     000000BE 
                                          DD     000000BE 
                                          DD     000000C1 
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
                                          DD     __lcl.00000211 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000A5C            __lcl.00000211     DD     00000001 
                                          DD     __lcl.00000181 
                                          DD     __lcl.00000210 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000A74            __lcl.00000210     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000208 
                                          DD     __lcl.00000209 
     000A90            __lcl.00000209     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000A9C            __lcl.00000208     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000AA8            __lcl.00000207     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000205 
                                          DD     __lcl.00000206 
     000AC4            __lcl.00000206     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     000AD0            __lcl.00000205     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     000ADC            __lcl.00000204     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000202 
                                          DD     __lcl.00000203 
     000AF8            __lcl.00000203     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE4 
     000B04            __lcl.00000202     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000B10            lab4.t1__task_subpdesc____1 DD __lcl.00000162 
                                          DD     0000000D 
                                          DD     __lcl.00000126 
                                          DD     0000008C 
                                          DD     0000008F 
                                          DD     000000AB 
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
                                          DD     __lcl.00000193 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000199 
                                          DD     __lcl.00000161 
                                          DD     00000000 
                                          DD     __lcl.00000294 
                                          DD     00000048 
                                          DD     __lcl.00000001 
     000B74            __lcl.00000199     DD     00000001 
                                          DD     __lcl.00000188 
     000B7C            __lcl.00000198     DB     05H    
                                          DB     'alfa1' 
                                          DW     0000   
     000B84            __lcl.00000197     DB     04H    
                                          DB     'Sum1' 
                                          DB     00H,00H,00H 
     000B8C            __lcl.00000196     DB     04H    
                                          DB     'Sum2' 
                                          DB     00H,00H,00H 
     000B94            __lcl.00000195     DB     03H    
                                          DB     'MZ1'  
     000B98            __lcl.00000194     DB     03H    
                                          DB     'MR1'  
     000B9C            __lcl.00000193     DD     00000005 
                                          DD     __lcl.00000194 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFD4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000195 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFD0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000196 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFC8 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000197 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFC4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000198 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFC0 
                                          DD     00000003 
                                          DD     00000000 
     000C04            __lcl.00000188     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     00000098 
                                          DD     00000098 
                                          DD     000000A4 
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
                                          DD     __lcl.00000186 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000187 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000C68            __lcl.00000187     DD     00000001 
                                          DD     __lcl.00000185 
     000C70            __lcl.00000186     DD     00000001 
                                          DD     __lcl.00000138 
                                          DD     __lcl.00000173 
                                          DD     FFFFFFEC 
                                          DD     00000003 
                                          DD     00000001 
     000C88            __lcl.00000185     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     00000099 
                                          DD     00000099 
                                          DD     000000A3 
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
                                          DD     __lcl.00000183 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000184 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000CEC            __lcl.00000184     DD     00000001 
                                          DD     __lcl.00000182 
     000CF4            __lcl.00000183     DD     00000001 
                                          DD     __lcl.00000135 
                                          DD     __lcl.00000176 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     000D0C            __lcl.00000182     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     0000009C 
                                          DD     0000009C 
                                          DD     0000009F 
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
                                          DD     __lcl.00000180 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000D70            __lcl.00000181     DB     01H    
                                          DB     'z'    
                                          DW     0000   
     000D74            __lcl.00000180     DD     00000001 
                                          DD     __lcl.00000181 
                                          DD     __lcl.00000179 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000D8C            __lcl.00000179     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000177 
                                          DD     __lcl.00000178 
     000DA8            __lcl.00000178     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000DB4            __lcl.00000177     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000DC0            __lcl.00000176     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000174 
                                          DD     __lcl.00000175 
     000DDC            __lcl.00000175     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     000DE8            __lcl.00000174     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000DF4            __lcl.00000173     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000171 
                                          DD     __lcl.00000172 
     000E10            __lcl.00000172     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE8 
     000E1C            __lcl.00000171     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000E28            __lcl.00000168     DB     02H    
                                          DB     'T4'   
                                          DB     00     
     000E2C            __lcl.00000167     DD     __lcl.00000168 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     000E3C            __lcl.00000166     DB     02H    
                                          DB     'T3'   
                                          DB     00     
     000E40            __lcl.00000165     DD     __lcl.00000166 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     000E50            __lcl.00000164     DB     02H    
                                          DB     'T2'   
                                          DB     00     
     000E54            __lcl.00000163     DD     __lcl.00000164 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     000E64            __lcl.00000162     DB     02H    
                                          DB     'T1'   
                                          DB     00     
     000E68            __lcl.00000161     DD     __lcl.00000162 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     000E78            lab4.op_mr__protected_body_subpdesc____1 DD __lcl.00000125 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     00000073 
                                          DD     00000073 
                                          DD     00000081 
                                          DD     00000005 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000160 
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
     000EDC            __lcl.00000160     DD     00000002 
                                          DD     lab4.op_mr.setmr__subp_body_subpdesc____1 
                                          DD     lab4.op_mr.getmr__subp_body_subpdesc____1 
     000EE8            lab4.op_mr.getmr__subp_body_subpdesc____1 DD __lcl.00000123 
                                          DD     0000000C 
                                          DD     __lcl.00000126 
                                          DD     0000007D 
                                          DD     0000007E 
                                          DD     00000080 
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
                                          DD     __lcl.00000295 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000F4C            lab4.op_mr.setmr__subp_body_subpdesc____1 DD __lcl.00000122 
                                          DD     0000000B 
                                          DD     __lcl.00000126 
                                          DD     00000074 
                                          DD     00000075 
                                          DD     0000007B 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000158 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000159 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000296 
                                          DD     00000010 
                                          DD     __lcl.00000001 
     000FB0            __lcl.00000159     DD     00000001 
                                          DD     __lcl.00000157 
     000FB8            __lcl.00000158     DD     00000001 
                                          DD     __lcl.00000100 
                                          DD     __lcl.00000018 
                                          DD     00000000 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     0000000C 
     000FD4            __lcl.00000157     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     00000076 
                                          DD     00000076 
                                          DD     0000007A 
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
                                          DD     __lcl.00000156 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001038            __lcl.00000156     DD     00000001 
                                          DD     __lcl.00000154 
     001040            __lcl.00000155     DD     00000001 
                                          DD     __lcl.00000138 
                                          DD     __lcl.00000149 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     001058            __lcl.00000154     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     00000077 
                                          DD     00000077 
                                          DD     00000079 
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
                                          DD     __lcl.00000153 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0010BC            __lcl.00000153     DD     00000001 
                                          DD     __lcl.00000135 
                                          DD     __lcl.00000152 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0010D4            __lcl.00000152     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000150 
                                          DD     __lcl.00000151 
     0010F0            __lcl.00000151     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     0010FC            __lcl.00000150     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001108            __lcl.00000149     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000147 
                                          DD     __lcl.00000148 
     001124            __lcl.00000148     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     001130            __lcl.00000147     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00113C            __lcl.00000146     DB     07H    
                                          DB     'OP_Alfa' 
     001144            lab4.op_alfa__protected_body_subpdesc____1 DD __lcl.00000146 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     00000066 
                                          DD     00000066 
                                          DD     00000070 
                                          DD     00000005 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000145 
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
     0011A8            __lcl.00000145     DD     00000002 
                                          DD     lab4.op_alfa.setalfa__subp_body_subpdesc____1 
                                          DD     lab4.op_alfa.getalfa__subp_body_subpdesc____1 
     0011B4            lab4.op_alfa.getalfa__subp_body_subpdesc____1 DD __lcl.00000112 
                                          DD     0000000A 
                                          DD     __lcl.00000126 
                                          DD     0000006C 
                                          DD     0000006D 
                                          DD     0000006F 
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
                                          DD     __lcl.00000297 
                                          DD     00000008 
                                          DD     __lcl.00000001 
     001218            lab4.op_alfa.setalfa__subp_body_subpdesc____1 DD __lcl.00000111 
                                          DD     00000009 
                                          DD     __lcl.00000126 
                                          DD     00000067 
                                          DD     00000068 
                                          DD     0000006A 
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
                                          DD     __lcl.00000298 
                                          DD     00000008 
                                          DD     __lcl.00000001 
     00127C            __lcl.00000144     DD     00000001 
                                          DD     __lcl.00000109 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00010000 
                                          DB     4 DUP(00) 
                                          DD     0000000C 
     001298            lab4.op_mz__protected_body_subpdesc____1 DD __lcl.00000105 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     00000055 
                                          DD     00000055 
                                          DD     00000063 
                                          DD     00000005 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000143 
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
     0012FC            __lcl.00000143     DD     00000002 
                                          DD     lab4.op_mz.setmz__subp_body_subpdesc____1 
                                          DD     lab4.op_mz.getmz__subp_body_subpdesc____1 
     001308            lab4.op_mz.getmz__subp_body_subpdesc____1 DD __lcl.00000103 
                                          DD     00000008 
                                          DD     __lcl.00000126 
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
                                          DD     __lcl.00000299 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00136C            lab4.op_mz.setmz__subp_body_subpdesc____1 DD __lcl.00000102 
                                          DD     00000007 
                                          DD     __lcl.00000126 
                                          DD     00000056 
                                          DD     00000057 
                                          DD     0000005D 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000141 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000142 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000300 
                                          DD     00000010 
                                          DD     __lcl.00000001 
     0013D0            __lcl.00000142     DD     00000001 
                                          DD     __lcl.00000140 
     0013D8            __lcl.00000141     DD     00000001 
                                          DD     __lcl.00000100 
                                          DD     __lcl.00000018 
                                          DD     00000000 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     0000000C 
     0013F4            __lcl.00000140     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     00000058 
                                          DD     00000058 
                                          DD     0000005C 
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
                                          DD     __lcl.00000137 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000139 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001458            __lcl.00000139     DD     00000001 
                                          DD     __lcl.00000136 
     001460            __lcl.00000138     DB     01H    
                                          DB     'i'    
                                          DW     0000   
     001464            __lcl.00000137     DD     00000001 
                                          DD     __lcl.00000138 
                                          DD     __lcl.00000130 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     00147C            __lcl.00000136     DB     8 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     00000059 
                                          DD     00000059 
                                          DD     0000005B 
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
                                          DD     __lcl.00000134 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0014E0            __lcl.00000135     DB     01H    
                                          DB     'j'    
                                          DW     0000   
     0014E4            __lcl.00000134     DD     00000001 
                                          DD     __lcl.00000135 
                                          DD     __lcl.00000133 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0014FC            __lcl.00000133     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000131 
                                          DD     __lcl.00000132 
     001518            __lcl.00000132     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     001524            __lcl.00000131     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001530            __lcl.00000130     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000128 
                                          DD     __lcl.00000129 
     00154C            __lcl.00000129     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     001558            __lcl.00000128     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001564            lab4.synchro__protected_body_subpdesc____1 DD __lcl.00000029 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000126 
                                          DD     00000041 
                                          DD     00000041 
                                          DD     00000052 
                                          DD     00000005 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000127 
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
     0015C8            __lcl.00000127     DD     00000004 
                                          DD     lab4.synchro.
inputsignal__subp_body_subpdesc____1                    
                                          DD     lab4.synchro.
calcendsignal__subp_body_subpdesc____1                  
                                          DD     lab4.synchro.
outputsync__subp_body_subpdesc____1                     
                                          DD     lab4.synchro.inputsync__subp_body_subpdesc____1
                                                        
     0015DC            lab4.synchro.inputsync__subp_body_subpdesc____1 DD __lcl.00000025 
                                          DD     00000005 
                                          DD     __lcl.00000126 
                                          DD     0000004E 
                                          DD     0000004F 
                                          DD     00000051 
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
                                          DD     __lcl.00000301 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001640            lab4.synchro.outputsync__subp_body_subpdesc____1 DD __lcl.00000024 
                                          DD     00000004 
                                          DD     __lcl.00000126 
                                          DD     0000004A 
                                          DD     0000004B 
                                          DD     0000004D 
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
                                          DD     __lcl.00000302 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0016A4            lab4.synchro.calcendsignal__subp_body_subpdesc____1 DD __lcl.00000027 
                                          DD     00000003 
                                          DD     __lcl.00000126 
                                          DD     00000046 
                                          DD     00000047 
                                          DD     00000049 
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
                                          DD     __lcl.00000303 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001708            __lcl.00000126     DB     07H    
                                          DB     '..\lab1' 
     001710            lab4.synchro.inputsignal__subp_body_subpdesc____1 DD __lcl.00000026 
                                          DD     00000002 
                                          DD     __lcl.00000126 
                                          DD     00000042 
                                          DD     00000043 
                                          DD     00000045 
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
                                          DD     __lcl.00000304 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001774            __lcl.00000125     DB     05H    
                                          DB     'OP_MR' 
                                          DW     0000   
     00177C            __lcl.00000124     DD     __lcl.00000125 
                                          DD     00000020 
                                          DD     __lcl.00000118 
                                          DD     __lcl.00000121 
     00178C            __lcl.00000123     DB     05H    
                                          DB     'GetMR' 
                                          DW     0000   
     001794            __lcl.00000122     DB     05H    
                                          DB     'SetMR' 
                                          DW     0000   
     00179C            __lcl.00000121     DD     00000002 
                                          DD     __lcl.00000122 
                                          DD     00000000 
                                          DD     __lcl.00000120 
                                          DD     __lcl.00000123 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0017B8            __lcl.00000120     DD     00000001 
                                          DD     __lcl.00000100 
                                          DD     __lcl.00000018 
                                          DB     4 DUP(00) 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0017D4            __lcl.00000119     DB     02H    
                                          DB     'MR'   
                                          DB     00     
     0017D8            __lcl.00000118     DD     00000001 
                                          DD     __lcl.00000119 
                                          DD     __lcl.00000018 
                                          DD     00000030 
                                          DD     00000000 
                                          DD     __lcl.00000117 
                                          DD     00000100 
                                          DD     00000000 
     0017F8            __lcl.00000117     DD     00000001 
                                          DD     __lcl.00000115 
                                          DD     __lcl.00000116 
     001804            __lcl.00000116     DD     00000002 
                                          DD     package1.matr__constrained_array____1 
     00180C            __lcl.00000115     DD     00000000 
                                          DD     00000001 
     001814            __lcl.00000114     DB     07H    
                                          DB     'OP_alfa' 
     00181C            __lcl.00000113     DD     __lcl.00000114 
                                          DD     00000020 
                                          DD     __lcl.00000106 
                                          DD     __lcl.00000110 
     00182C            __lcl.00000112     DB     07H    
                                          DB     'GetAlfa' 
     001834            __lcl.00000111     DB     07H    
                                          DB     'SetAlfa' 
     00183C            __lcl.00000110     DD     00000002 
                                          DD     __lcl.00000111 
                                          DD     00000000 
                                          DD     __lcl.00000108 
                                          DD     __lcl.00000112 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001858            __lcl.00000109     DB     01H    
                                          DB     'A'    
                                          DW     0000   
     00185C            __lcl.00000108     DD     00000001 
                                          DD     __lcl.00000109 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     00010000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     001878            __lcl.00000107     DB     03H    
                                          DB     'Alf'  
     00187C            __lcl.00000106     DD     00000001 
                                          DD     __lcl.00000107 
                                          DD     __lcl.00000005 
                                          DD     00000030 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
     00189C            __lcl.00000105     DB     05H    
                                          DB     'OP_MZ' 
                                          DW     0000   
     0018A4            __lcl.00000104     DD     __lcl.00000105 
                                          DD     00000020 
                                          DD     __lcl.00000097 
                                          DD     __lcl.00000101 
     0018B4            __lcl.00000103     DB     05H    
                                          DB     'GetMZ' 
                                          DW     0000   
     0018BC            __lcl.00000102     DB     05H    
                                          DB     'SetMZ' 
                                          DW     0000   
     0018C4            __lcl.00000101     DD     00000002 
                                          DD     __lcl.00000102 
                                          DD     00000000 
                                          DD     __lcl.00000099 
                                          DD     __lcl.00000103 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0018E0            __lcl.00000100     DB     01H    
                                          DB     'M'    
                                          DW     0000   
     0018E4            __lcl.00000099     DD     00000001 
                                          DD     __lcl.00000100 
                                          DD     __lcl.00000018 
                                          DB     4 DUP(00) 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     001900            __lcl.00000098     DB     02H    
                                          DB     'MZ'   
                                          DB     00     
     001904            __lcl.00000097     DD     00000001 
                                          DD     __lcl.00000098 
                                          DD     __lcl.00000018 
                                          DD     00000030 
                                          DD     00000000 
                                          DD     __lcl.00000096 
                                          DD     00000100 
                                          DD     00000000 
     001924            __lcl.00000096     DD     00000001 
                                          DD     __lcl.00000094 
                                          DD     __lcl.00000095 
     001930            __lcl.00000095     DD     00000002 
                                          DD     package1.matr__constrained_array____1 
     001938            __lcl.00000094     DD     00000000 
                                          DD     00000001 
     001940            __lcl.00000093     DB     0CH    
                                          DB     'Pr_Type_Desc' 
                                          DB     00H,00H,00H 
     001950            __lcl.00000092     DD     __lcl.00000093 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     __lcl.00000084 
                                          DD     00000000 
     001968            __lcl.00000091     DB     10H    
                                          DB     'Compute_Barriers' 
                                          DB     00H,00H,00H 
     00197C            __lcl.00000090     DB     14H    
                                          DB     'Compute_All_Barriers' 
                                          DB     00H,00H,00H 
     001994            __lcl.00000089     DB     0AH    
                                          DB     'Entry_Code' 
                                          DB     00     
     0019A0            __lcl.00000088     DB     10H    
                                          DB     'Depends_On_Count' 
                                          DB     00H,00H,00H 
     0019B4            __lcl.00000087     DB     0CH    
                                          DB     'Handler_List' 
                                          DB     00H,00H,00H 
     0019C4            __lcl.00000086     DB     0EH    
                                          DB     'Max_Name_Index' 
                                          DB     00     
     0019D4            __lcl.00000085     DB     07H    
                                          DB     'PT_Kind' 
     0019DC            __lcl.00000084     DD     00000007 
                                          DD     __lcl.00000085 
                                          DD     __lcl.00000037 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
                                          DD     00000000 
                                          DD     __lcl.00000086 
                                          DD     __lcl.00000041 
                                          DD     00000004 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
                                          DD     00000000 
                                          DD     __lcl.00000087 
                                          DD     __lcl.00000062 
                                          DD     00000008 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000088 
                                          DD     __lcl.00000068 
                                          DD     0000000C 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000067 
                                          DD     __lcl.00000089 
                                          DD     __lcl.00000071 
                                          DD     00000010 
                                          DD     00000000 
                                          DD     __lcl.00000075 
                                          DD     00000200 
                                          DD     __lcl.00000067 
                                          DD     __lcl.00000090 
                                          DD     __lcl.00000050 
                                          DD     00000014 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000077 
                                          DD     __lcl.00000091 
                                          DD     __lcl.00000071 
                                          DD     00000014 
                                          DD     00000000 
                                          DD     __lcl.00000082 
                                          DD     00000100 
                                          DD     __lcl.00000079 
     001AA4            __lcl.00000083     DD     __lcl.00000067 
                                          DD     00000001 
                                          DD     00000000 
     001AB0            __lcl.00000082     DD     00000001 
                                          DD     __lcl.00000080 
                                          DD     __lcl.00000081 
     001ABC            __lcl.00000081     DD     00000001 
                                          DD     00000002 
     001AC4            __lcl.00000080     DD     00000000 
                                          DD     00000000 
     001ACC            __lcl.00000079     DD     __lcl.00000067 
                                          DD     00000001 
                                          DD     __lcl.00000078 
     001AD8            __lcl.00000078     DD     00000000 
                                          DD     00000000 
                                          DD     00000002 
     001AE4            __lcl.00000077     DD     __lcl.00000067 
                                          DD     00000001 
                                          DD     __lcl.00000076 
     001AF0            __lcl.00000076     DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
     001AFC            __lcl.00000075     DD     00000001 
                                          DD     __lcl.00000073 
                                          DD     __lcl.00000074 
     001B08            __lcl.00000074     DD     00000001 
                                          DD     00000002 
     001B10            __lcl.00000073     DD     00000000 
                                          DD     00000000 
     001B18            __lcl.00000072     DB     0AH    
                                          DB     'Code_Array' 
                                          DB     00     
     001B24            __lcl.00000071     DD     __lcl.00000072 
                                          DD     00000011 
                                          DD     0000000E 
                                          DD     __lcl.00000070 
                                          DD     __lcl.00000050 
                                          DD     __lcl.00000069 
     001B3C            __lcl.00000070     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     001B48            __lcl.00000069     DD     00000001 
                                          DD     __lcl.00000041 
     001B50            __lcl.00000068     DB     4 DUP(00) 
                                          DD     00000001 
                                          DD     00000002 
     001B5C            __lcl.00000067     DD     00000000 
                                          DD     00000001 
                                          DD     __lcl.00000066 
     001B68            __lcl.00000066     DD     00000000 
                                          DD     00000001 
                                          DD     00000001 
                                          DD     00000002 
     001B78            __lcl.00000065     DD     00000000 
                                          DD     00000001 
                                          DD     __lcl.00000064 
     001B84            __lcl.00000064     DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
     001B90            __lcl.00000063     DB     13H    
                                          DB     'Handler_List_Access' 
     001BA4            __lcl.00000062     DD     __lcl.00000063 
                                          DD     00000003 
                                          DD     0000000D 
                                          DD     __lcl.00000060 
     001BB4            __lcl.00000061     DB     11H    
                                          DB     'Handler_List_Type' 
                                          DW     0000   
     001BC8            __lcl.00000060     DD     __lcl.00000061 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     __lcl.00000057 
                                          DD     00000000 
     001BE0            __lcl.00000059     DB     07H    
                                          DB     'Handler' 
     001BE8            __lcl.00000058     DB     0CH    
                                          DB     'Num_Handlers' 
                                          DB     00H,00H,00H 
     001BF8            __lcl.00000057     DD     00000002 
                                          DD     __lcl.00000058 
                                          DD     __lcl.00000045 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
                                          DD     00000000 
                                          DD     __lcl.00000059 
                                          DD     __lcl.00000052 
                                          DD     00000004 
                                          DD     00000000 
                                          DD     __lcl.00000056 
                                          DD     00000100 
                                          DD     00000000 
     001C34            __lcl.00000056     DD     00000001 
                                          DD     __lcl.00000054 
                                          DD     __lcl.00000055 
     001C40            __lcl.00000055     DD     00000001 
                                          DD     00000001 
     001C48            __lcl.00000054     DD     00000000 
                                          DD     00000001 
     001C50            __lcl.00000053     DB     0DH    
                                          DB     'Handler_Array' 
                                          DW     0000   
     001C60            __lcl.00000052     DD     __lcl.00000053 
                                          DD     00000011 
                                          DD     0000000E 
                                          DD     __lcl.00000047 
                                          DD     __lcl.00000050 
                                          DD     __lcl.00000046 
     001C78            __lcl.00000051     DB     0CH    
                                          DB     'Code_Address' 
                                          DB     00H,00H,00H 
     001C88            __lcl.00000050     DD     __lcl.00000051 
                                          DD     00000003 
                                          DD     0000000D 
                                          DD     __lcl.00000048 
     001C98            __lcl.00000049     DB     0AH    
                                          DB     'Raw_Object' 
                                          DB     00     
     001CA4            __lcl.00000048     DD     __lcl.00000049 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     00000000 
     001CBC            __lcl.00000047     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     001CC8            __lcl.00000046     DD     00000001 
                                          DD     __lcl.00000045 
     001CD0            __lcl.00000045     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000042 
                                          DD     __lcl.00000043 
                                          DD     __lcl.00000044 
     001CEC            __lcl.00000044     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     001CF8            __lcl.00000043     DD     00000008 
                                          DD     00000003 
                                          DD     00000000 
     001D04            __lcl.00000042     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     001D10            __lcl.00000041     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000038 
                                          DD     __lcl.00000039 
                                          DD     __lcl.00000040 
     001D2C            __lcl.00000040     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     001D38            __lcl.00000039     DD     00000008 
                                          DD     00000003 
                                          DD     00000000 
     001D44            __lcl.00000038     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     001D50            __lcl.00000037     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000034 
                                          DD     __lcl.00000035 
                                          DD     __lcl.00000036 
     001D6C            __lcl.00000036     DD     00000003 
                                          DD     00000001 
                                          DB     02     
                                          DB     00H,00H,00H 
     001D78            __lcl.00000035     DD     00000003 
                                          DD     00000001 
                                          DB     00     
                                          DB     00H,00H,00H 
     001D84            __lcl.00000034     DB     4 DUP(00) 
                                          DD     00000005 
                                          DD     00000003 
                                          DD     00000003 
                                          DD     __lcl.00000030 
     001D98            __lcl.00000033     DB     08H    
                                          DB     'PT_Large' 
                                          DB     00H,00H,00H 
     001DA4            __lcl.00000032     DB     08H    
                                          DB     'PT_Small' 
                                          DB     00H,00H,00H 
     001DB0            __lcl.00000031     DB     0DH    
                                          DB     'PT_No_Entries' 
                                          DW     0000   
     001DC0            __lcl.00000030     DD     __lcl.00000031 
                                          DD     00000000 
                                          DD     __lcl.00000032 
                                          DD     00000001 
                                          DD     __lcl.00000033 
                                          DD     00000002 
     001DD8            __lcl.00000029     DB     07H    
                                          DB     'Synchro' 
     001DE0            __lcl.00000028     DD     __lcl.00000029 
                                          DD     00000020 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000023 
     001DF0            __lcl.00000027     DB     0DH    
                                          DB     'CalcEndSignal' 
                                          DW     0000   
     001E00            __lcl.00000026     DB     0BH    
                                          DB     'InputSignal' 
     001E0C            __lcl.00000025     DB     09H    
                                          DB     'InputSync' 
                                          DW     0000   
     001E18            __lcl.00000024     DB     0AH    
                                          DB     'OutputSync' 
                                          DB     00     
     001E24            __lcl.00000023     DD     00000004 
                                          DD     __lcl.00000024 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000025 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000026 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001E58            __lcl.00000022     DB     02H    
                                          DB     'F2'   
                                          DB     00     
     001E5C            __lcl.00000021     DB     02H    
                                          DB     'F1'   
                                          DB     00     
     001E60            __lcl.00000020     DD     00000002 
                                          DD     __lcl.00000021 
                                          DD     __lcl.00000005 
                                          DD     00000044 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000022 
                                          DD     __lcl.00000005 
                                          DD     00000048 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
     001E9C            __lcl.00000019     DB     04H    
                                          DB     'Matr' 
                                          DB     00H,00H,00H 
     001EA4            __lcl.00000018     DD     __lcl.00000019 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000010 
                                          DD     __lcl.00000016 
                                          DD     __lcl.00000009 
     001EBC            __lcl.00000017     DB     03H    
                                          DB     'Vec'  
     001EC0            __lcl.00000016     DD     __lcl.00000017 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000015 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000014 
     001ED8            __lcl.00000015     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     001EE4            __lcl.00000014     DD     00000001 
                                          DD     __lcl.00000013 
     001EEC            __lcl.00000013     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000011 
                                          DD     __lcl.00000012 
     001F08            __lcl.00000012     DD     00000008 
                                          DD     00000007 
                                          DD     package1.vec__constrained_array____1 
     001F14            __lcl.00000011     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001F20            __lcl.00000010     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__COMP_SU_SIZE 
     001F2C            __lcl.00000009     DD     00000001 
                                          DD     __lcl.00000008 
     001F34            __lcl.00000008     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000007 
     001F50            __lcl.00000007     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__constrained_array____1 
     001F5C            __lcl.00000006     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001F68            __lcl.00000005     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000003 
                                          DD     __lcl.00000004 
     001F84            __lcl.00000004     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     001F90            __lcl.00000003     DD     00000008 
                                          DD     00000003 
                                          DD     80000000 
     001F9C            __lcl.00000002     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     001FA8            __lcl.00000001     DD     00000000 
; ********* End of segment, Total Size = 8108


; ************* .av_dbgi segment :
                                          ALIGN 4       
     001FAC            __lcl.00000305     DB     11     
                                          DB     'D:\LABPRO2-4\lab1' 
; ********* End of segment, Total Size = 8126

                       ;                                
                       CODE               ENDS          

