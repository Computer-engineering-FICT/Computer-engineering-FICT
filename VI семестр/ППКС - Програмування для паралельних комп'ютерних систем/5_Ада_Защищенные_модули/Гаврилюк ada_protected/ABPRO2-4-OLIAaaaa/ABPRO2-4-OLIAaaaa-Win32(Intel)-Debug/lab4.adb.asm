
                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT Lab4 
;  Record Layout Information:
;     -- lab4.synchroandop
;     for SynchroAndOP use record
;         F1 at 72 range 0 .. 31;
;         F2 at 76 range 0 .. 31;
;         F3 at 80 range 0 .. 31;
; --      B at 96 range 0..<dynamic-sized>; cannot specify place
; --      MO at <dynamic-offset>; cannot specify place
; --      C at <dynamic-offset>; cannot specify place
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
                       ;  Start of procedure lab4.synchroandop.input   
                       ;                                
                                          PUBLIC lab4.synchroandop.input 
                       lab4.synchroandop.input PROC NEAR 
;  Source Line # 57
   57| 000000 55                          PUSH   EBP    
   57| 000001 8BEC                        MOV    EBP, ESP 
;  Source Line # 59
   59| 000003 8B45                        MOV    EAX, [EBP+8] ;  po_access
   59| 000005 08                                        
   59| 000006 8B58                        MOV    EBX, [EAX+72] 
   59| 000008 48                                        
   59| 000009 43                          INC    EBX    
   59| 00000A 8B4D                        MOV    ECX, [EBP+8] ;  po_access
   59| 00000C 08                                        
   59| 00000D 8959                        MOV    [ECX+72], EBX 
   59| 00000F 48                                        
;  Source Line # 60
   60| 000010 8BE5                        MOV    ESP, EBP 
   60| 000012 5D                          POP    EBP    
   60| 000013 C2                          RET    8      
   60| 000014 0800                                      
                       ;                                
                       lab4.synchroandop.input ENDP     


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000388     DD     00000401 
                                          DD     00000039 
                                          DD     lab4.synchroandop.input 
                                          DD     __lcl.00000389 
                                          DD     0000003B 
                                          DD     lab4.synchroandop.input+00000003H 
                                          DD     __lcl.00000389 
                                          DD     0000003C 
                                          DD     lab4.synchroandop.input+00000010H 
                                          DD     __lcl.00000389 
                                          DD     0000003C 
                                          DD     lab4.synchroandop.input+00000012H 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.synchroandop.csignal   
                       ;                                
                                          PUBLIC lab4.synchroandop.csignal 
                       lab4.synchroandop.csignal PROC NEAR 
;  Source Line # 62
   62| 000000 55                          PUSH   EBP    
   62| 000001 8BEC                        MOV    EBP, ESP 
;  Source Line # 64
   64| 000003 8B45                        MOV    EAX, [EBP+8] ;  po_access
   64| 000005 08                                        
   64| 000006 8B58                        MOV    EBX, [EAX+76] 
   64| 000008 4C                                        
   64| 000009 43                          INC    EBX    
   64| 00000A 8B4D                        MOV    ECX, [EBP+8] ;  po_access
   64| 00000C 08                                        
   64| 00000D 8959                        MOV    [ECX+76], EBX 
   64| 00000F 4C                                        
;  Source Line # 65
   65| 000010 8BE5                        MOV    ESP, EBP 
   65| 000012 5D                          POP    EBP    
   65| 000013 C2                          RET    8      
   65| 000014 0800                                      
                       ;                                
                       lab4.synchroandop.csignal ENDP   

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000387     DD     00000401 
                                          DD     0000003E 
                                          DD     lab4.synchroandop.csignal 
                                          DD     __lcl.00000389 
                                          DD     00000040 
                                          DD     lab4.synchroandop.csignal+00000003H 
                                          DD     __lcl.00000389 
                                          DD     00000041 
                                          DD     lab4.synchroandop.csignal+00000010H 
                                          DD     __lcl.00000389 
                                          DD     00000041 
                                          DD     lab4.synchroandop.csignal+00000012H 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.synchroandop.endsignal   
                       ;                                
                                          PUBLIC lab4.synchroandop.endsignal 
                       lab4.synchroandop.endsignal PROC NEAR 
;  Source Line # 67
   67| 000000 55                          PUSH   EBP    
   67| 000001 8BEC                        MOV    EBP, ESP 
;  Source Line # 69
   69| 000003 8B45                        MOV    EAX, [EBP+8] ;  po_access
   69| 000005 08                                        
   69| 000006 8B58                        MOV    EBX, [EAX+80] 
   69| 000008 50                                        
   69| 000009 43                          INC    EBX    
   69| 00000A 8B4D                        MOV    ECX, [EBP+8] ;  po_access
   69| 00000C 08                                        
   69| 00000D 8959                        MOV    [ECX+80], EBX 
   69| 00000F 50                                        
;  Source Line # 70
   70| 000010 8BE5                        MOV    ESP, EBP 
   70| 000012 5D                          POP    EBP    
   70| 000013 C2                          RET    8      
   70| 000014 0800                                      
                       ;                                
                       lab4.synchroandop.endsignal ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000386     DD     00000401 
                                          DD     00000043 
                                          DD     lab4.synchroandop.endsignal 
                                          DD     __lcl.00000389 
                                          DD     00000045 
                                          DD     lab4.synchroandop.endsignal+00000003H 
                                          DD     __lcl.00000389 
                                          DD     00000046 
                                          DD     lab4.synchroandop.endsignal+00000010H 
                                          DD     __lcl.00000389 
                                          DD     00000046 
                                          DD     lab4.synchroandop.endsignal+00000012H 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 52

                       ;                                
                       ;  Start of procedure lab4.synchroandop.setmo   
                       ;                                
                                          PUBLIC lab4.synchroandop.setmo 
                       lab4.synchroandop.setmo PROC NEAR 
;  Source Line # 72
   72| 000000 55                          PUSH   EBP    
   72| 000001 8BEC                        MOV    EBP, ESP 
   72| 000003 83EC                        SUB    ESP, 16 
   72| 000005 10                                        
;  Source Line # 73
   73| 000006 8B05                        MOV    EAX, package1.n 
   73| 000008 00000000                                  
   73| 00000C 8945                        MOV    [EBP-16], EAX 
   73| 00000E F0                                        
;  Source Line # 74
   74| 00000F 837D                        CMP    DWORD PTR [EBP-16], 0 
   74| 000011 F0                                        
   74| 000012 00                                        
   74| 000013 0F8E                        JLE    L34    
   74| 000015 85000000                                  
   74| 000019 C745                        MOV    DWORD PTR [EBP-12], 1 
   74| 00001B F4                                        
   74| 00001C 01000000                                  
   74|                 L37:                             
   74| 000020 8B05                        MOV    EAX, package1.n 
   74| 000022 00000000                                  
   74| 000026 8945                        MOV    [EBP-8], EAX 
   74| 000028 F8                                        
;  Source Line # 75
   75| 000029 837D                        CMP    DWORD PTR [EBP-8], 0 
   75| 00002B F8                                        
   75| 00002C 00                                        
   75| 00002D 7E                          JLE    SHORT L38 
   75| 00002E 5B                                        
   75| 00002F C745                        MOV    DWORD PTR [EBP-4], 1 
   75| 000031 FC                                        
   75| 000032 01000000                                  
   75|                 L40:                             
;  Source Line # 76
   76| 000036 8B45                        MOV    EAX, [EBP+12] ;  params
   76| 000038 0C                                        
   76| 000039 8B18                        MOV    EBX, [EAX+0] 
   76| 00003B 8B4D                        MOV    ECX, [EBP-12] 
   76| 00003D F4                                        
   76| 00003E 8D49                        LEA    ECX, [ECX-1] 
   76| 000040 FF                                        
   76| 000041 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
   76| 000044 00000000                                  
   76| 000048 8B55                        MOV    EDX, [EBP-4] 
   76| 00004A FC                                        
   76| 00004B 8D1495                      LEA    EDX, [4*EDX-4] 
   76| 00004E FCFFFFFF                                  
   76| 000052 03CA                        ADD    ECX, EDX 
   76| 000054 8B75                        MOV    ESI, [EBP+8] ;  po_access
   76| 000056 08                                        
   76| 000057 8B7D                        MOV    EDI, [EBP-12] 
   76| 000059 F4                                        
   76| 00005A 8D7F                        LEA    EDI, [EDI-1] 
   76| 00005C FF                                        
   76| 00005D 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
   76| 000060 00000000                                  
   76| 000064 037E                        ADD    EDI, [ESI+84] 
   76| 000066 54                                        
   76| 000067 8B45                        MOV    EAX, [EBP-4] 
   76| 000069 FC                                        
   76| 00006A 8D0485                      LEA    EAX, [4*EAX-4] 
   76| 00006D FCFFFFFF                                  
   76| 000071 03F8                        ADD    EDI, EAX 
   76| 000073 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
   76| 000076 891C3E                      MOV    [ESI+EDI+0], EBX 
;  Source Line # 77
   77| 000079 8B55                        MOV    EDX, [EBP-8] 
   77| 00007B F8                                        
   77| 00007C 3955                        CMP    [EBP-4], EDX 
   77| 00007E FC                                        
   77| 00007F 74                          JE     SHORT L38 
   77| 000080 09                                        
   77| 000081 8B45                        MOV    EAX, [EBP-4] 
   77| 000083 FC                                        
   77| 000084 40                          INC    EAX    
   77| 000085 8945                        MOV    [EBP-4], EAX 
   77| 000087 FC                                        
   77| 000088 EB                          JMP    SHORT L40 
   77| 000089 AC                                        
   77|                 L38:                             
;  Source Line # 78
   78| 00008A 8B45                        MOV    EAX, [EBP-16] 
   78| 00008C F0                                        
   78| 00008D 3945                        CMP    [EBP-12], EAX 
   78| 00008F F4                                        
   78| 000090 74                          JE     SHORT L34 
   78| 000091 0C                                        
   78| 000092 8B45                        MOV    EAX, [EBP-12] 
   78| 000094 F4                                        
   78| 000095 40                          INC    EAX    
   78| 000096 8945                        MOV    [EBP-12], EAX 
   78| 000098 F4                                        
   78| 000099 E9                          JMP    L37    
   78| 00009A 82FFFFFF                                  
   78|                 L34:                             
;  Source Line # 79
   79| 00009E 8BE5                        MOV    ESP, EBP 
   79| 0000A0 5D                          POP    EBP    
   79| 0000A1 C2                          RET    8      
   79| 0000A2 0800                                      
                       ;                                
                       lab4.synchroandop.setmo ENDP     

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000385     DD     00000901 
                                          DD     00000048 
                                          DD     lab4.synchroandop.setmo 
                                          DD     __lcl.00000389 
                                          DD     00000049 
                                          DD     lab4.synchroandop.setmo+00000006H 
                                          DD     __lcl.00000389 
                                          DD     0000004A 
                                          DD     lab4.synchroandop.setmo+0000000FH 
                                          DD     __lcl.00000389 
                                          DD     0000004B 
                                          DD     lab4.synchroandop.setmo+00000029H 
                                          DD     __lcl.00000389 
                                          DD     0000004C 
                                          DD     lab4.synchroandop.setmo+00000036H 
                                          DD     __lcl.00000389 
                                          DD     0000004D 
                                          DD     lab4.synchroandop.setmo+00000079H 
                                          DD     __lcl.00000389 
                                          DD     0000004E 
                                          DD     lab4.synchroandop.setmo+0000008AH 
                                          DD     __lcl.00000389 
                                          DD     0000004F 
                                          DD     lab4.synchroandop.setmo+0000009EH 
                                          DD     __lcl.00000389 
                                          DD     0000004F 
                                          DD     lab4.synchroandop.setmo+000000A0H 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 112

                       ;                                
                       ;  Start of procedure lab4.synchroandop.getmo   
                       ;                                
                                          PUBLIC lab4.synchroandop.getmo 
                       lab4.synchroandop.getmo PROC NEAR 
;  Source Line # 80
   80| 000000 55                          PUSH   EBP    
   80| 000001 8BEC                        MOV    EBP, ESP 
;  Source Line # 82
   82| 000003 8B05                        MOV    EAX, package1.matr__constrained_array____1 
   82| 000005 00000000                                  
   82| 000009 2D                          SUB    EAX, 1 
   82| 00000A 01000000                                  
   82| 00000E 7D                          JGE    SHORT L35 
   82| 00000F 03                                        
   82| 000010 33C0                        XOR    EAX, EAX 
   82| 000012 48                          DEC    EAX    
   82|                 L35:                             
   82| 000013 CE                          INTO          
   82| 000014 40                          INC    EAX    
   82| 000015 CE                          INTO          
   82| 000016 0FAF05                      IMUL   EAX, package1.matr__COMP_SU_SIZE 
   82| 000019 00000000                                  
   82| 00001D 8B5D                        MOV    EBX, [EBP+8] ;  po_access
   82| 00001F 08                                        
   82| 000020 8B4B                        MOV    ECX, [EBX+84] 
   82| 000022 54                                        
   82| 000023 8B55                        MOV    EDX, [EBP+12] ;  params
   82| 000025 0C                                        
   82| 000026 8B32                        MOV    ESI, [EDX+0] 
   82| 000028 50                          PUSH   EAX    
   82| 000029 8D1C0B                      LEA    EBX, [EBX+ECX+0] 
   82| 00002C 53                          PUSH   EBX    
   82| 00002D 56                          PUSH   ESI    
   82| 00002E E8                          CALL   _rts_block_move 
   82| 00002F 00000000                                  
   82| 000033 8BE5                        MOV    ESP, EBP 
   82| 000035 5D                          POP    EBP    
   82| 000036 C2                          RET    8      
   82| 000037 0800                                      
                       ;                                
                       lab4.synchroandop.getmo ENDP     

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000384     DD     00000301 
                                          DD     00000050 
                                          DD     lab4.synchroandop.getmo 
                                          DD     __lcl.00000389 
                                          DD     00000052 
                                          DD     lab4.synchroandop.getmo+00000003H 
                                          DD     __lcl.00000389 
                                          DD     00000052 
                                          DD     lab4.synchroandop.getmo+00000035H 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 40

                       ;                                
                       ;  Start of procedure lab4.synchroandop.setc   
                       ;                                
                                          PUBLIC lab4.synchroandop.setc 
                       lab4.synchroandop.setc PROC NEAR 
;  Source Line # 85
   85| 000000 55                          PUSH   EBP    
   85| 000001 8BEC                        MOV    EBP, ESP 
   85| 000003 83EC                        SUB    ESP, 8 
   85| 000005 08                                        
;  Source Line # 86
   86| 000006 8B05                        MOV    EAX, package1.n 
   86| 000008 00000000                                  
   86| 00000C 8945                        MOV    [EBP-8], EAX 
   86| 00000E F8                                        
;  Source Line # 87
   87| 00000F 837D                        CMP    DWORD PTR [EBP-8], 0 
   87| 000011 F8                                        
   87| 000012 00                                        
   87| 000013 7E                          JLE    SHORT L34 
   87| 000014 4A                                        
   87| 000015 C745                        MOV    DWORD PTR [EBP-4], 1 
   87| 000017 FC                                        
   87| 000018 01000000                                  
   87|                 L37:                             
;  Source Line # 88
   88| 00001C 8B45                        MOV    EAX, [EBP+8] ;  po_access
   88| 00001E 08                                        
   88| 00001F 8B5D                        MOV    EBX, [EBP-4] 
   88| 000021 FC                                        
   88| 000022 8D1C9D                      LEA    EBX, [4*EBX-4] 
   88| 000025 FCFFFFFF                                  
   88| 000029 0358                        ADD    EBX, [EAX+88] 
   88| 00002B 58                                        
   88| 00002C 8B4D                        MOV    ECX, [EBP+12] ;  params
   88| 00002E 0C                                        
   88| 00002F 8B11                        MOV    EDX, [ECX+0] 
   88| 000031 8B75                        MOV    ESI, [EBP-4] 
   88| 000033 FC                                        
   88| 000034 8B3C18                      MOV    EDI, [EAX+EBX+0] 
   88| 000037 037CB2                      ADD    EDI, [EDX+4*ESI-4] 
   88| 00003A FC                                        
   88| 00003B 8B45                        MOV    EAX, [EBP+8] ;  po_access
   88| 00003D 08                                        
   88| 00003E 8B5D                        MOV    EBX, [EBP-4] 
   88| 000040 FC                                        
   88| 000041 8D1C9D                      LEA    EBX, [4*EBX-4] 
   88| 000044 FCFFFFFF                                  
   88| 000048 0358                        ADD    EBX, [EAX+88] 
   88| 00004A 58                                        
   88| 00004B 893C18                      MOV    [EAX+EBX+0], EDI 
;  Source Line # 89
   89| 00004E 8B4D                        MOV    ECX, [EBP-8] 
   89| 000050 F8                                        
   89| 000051 394D                        CMP    [EBP-4], ECX 
   89| 000053 FC                                        
   89| 000054 74                          JE     SHORT L34 
   89| 000055 09                                        
   89| 000056 8B45                        MOV    EAX, [EBP-4] 
   89| 000058 FC                                        
   89| 000059 40                          INC    EAX    
   89| 00005A 8945                        MOV    [EBP-4], EAX 
   89| 00005C FC                                        
   89| 00005D EB                          JMP    SHORT L37 
   89| 00005E BD                                        
   89|                 L34:                             
;  Source Line # 90
   90| 00005F 8BE5                        MOV    ESP, EBP 
   90| 000061 5D                          POP    EBP    
   90| 000062 C2                          RET    8      
   90| 000063 0800                                      
                       ;                                
                       lab4.synchroandop.setc ENDP      

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000383     DD     00000701 
                                          DD     00000055 
                                          DD     lab4.synchroandop.setc 
                                          DD     __lcl.00000389 
                                          DD     00000056 
                                          DD     lab4.synchroandop.setc+00000006H 
                                          DD     __lcl.00000389 
                                          DD     00000057 
                                          DD     lab4.synchroandop.setc+0000000FH 
                                          DD     __lcl.00000389 
                                          DD     00000058 
                                          DD     lab4.synchroandop.setc+0000001CH 
                                          DD     __lcl.00000389 
                                          DD     00000059 
                                          DD     lab4.synchroandop.setc+0000004EH 
                                          DD     __lcl.00000389 
                                          DD     0000005A 
                                          DD     lab4.synchroandop.setc+0000005FH 
                                          DD     __lcl.00000389 
                                          DD     0000005A 
                                          DD     lab4.synchroandop.setc+00000061H 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 88

                       ;                                
                       ;  Start of procedure lab4.synchroandop.getc   
                       ;                                
                                          PUBLIC lab4.synchroandop.getc 
                       lab4.synchroandop.getc PROC NEAR 
;  Source Line # 91
   91| 000000 55                          PUSH   EBP    
   91| 000001 8BEC                        MOV    EBP, ESP 
;  Source Line # 93
   93| 000003 8B05                        MOV    EAX, package1.vec__constrained_array____1 
   93| 000005 00000000                                  
   93| 000009 2D                          SUB    EAX, 1 
   93| 00000A 01000000                                  
   93| 00000E 7D                          JGE    SHORT L35 
   93| 00000F 03                                        
   93| 000010 33C0                        XOR    EAX, EAX 
   93| 000012 48                          DEC    EAX    
   93|                 L35:                             
   93| 000013 CE                          INTO          
   93| 000014 40                          INC    EAX    
   93| 000015 CE                          INTO          
   93| 000016 C1E0                        SHL    EAX, 2 
   93| 000018 02                                        
   93| 000019 8B5D                        MOV    EBX, [EBP+8] ;  po_access
   93| 00001B 08                                        
   93| 00001C 8B4B                        MOV    ECX, [EBX+88] 
   93| 00001E 58                                        
   93| 00001F 8B55                        MOV    EDX, [EBP+12] ;  params
   93| 000021 0C                                        
   93| 000022 8B32                        MOV    ESI, [EDX+0] 
   93| 000024 50                          PUSH   EAX    
   93| 000025 8D1C0B                      LEA    EBX, [EBX+ECX+0] 
   93| 000028 53                          PUSH   EBX    
   93| 000029 56                          PUSH   ESI    
   93| 00002A E8                          CALL   _rts_block_move 
   93| 00002B 00000000                                  
   93| 00002F 8BE5                        MOV    ESP, EBP 
   93| 000031 5D                          POP    EBP    
   93| 000032 C2                          RET    8      
   93| 000033 0800                                      
                       ;                                
                       lab4.synchroandop.getc ENDP      

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000382     DD     00000301 
                                          DD     0000005B 
                                          DD     lab4.synchroandop.getc 
                                          DD     __lcl.00000389 
                                          DD     0000005D 
                                          DD     lab4.synchroandop.getc+00000003H 
                                          DD     __lcl.00000389 
                                          DD     0000005D 
                                          DD     lab4.synchroandop.getc+00000031H 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 40

                       ;                                
                       ;  Start of procedure lab4.synchroandop.setb   
                       ;                                
                                          PUBLIC lab4.synchroandop.setb 
                       lab4.synchroandop.setb PROC NEAR 
;  Source Line # 96
   96| 000000 55                          PUSH   EBP    
   96| 000001 8BEC                        MOV    EBP, ESP 
   96| 000003 83EC                        SUB    ESP, 16 
   96| 000005 10                                        
;  Source Line # 97
   97| 000006 8B05                        MOV    EAX, package1.n 
   97| 000008 00000000                                  
   97| 00000C 8945                        MOV    [EBP-16], EAX 
   97| 00000E F0                                        
;  Source Line # 98
   98| 00000F 837D                        CMP    DWORD PTR [EBP-16], 0 
   98| 000011 F0                                        
   98| 000012 00                                        
   98| 000013 7E                          JLE    SHORT L34 
   98| 000014 55                                        
   98| 000015 C745                        MOV    DWORD PTR [EBP-12], 1 
   98| 000017 F4                                        
   98| 000018 01000000                                  
   98|                 L37:                             
   98| 00001C 8B05                        MOV    EAX, package1.n 
   98| 00001E 00000000                                  
   98| 000022 8945                        MOV    [EBP-8], EAX 
   98| 000024 F8                                        
;  Source Line # 99
   99| 000025 837D                        CMP    DWORD PTR [EBP-8], 0 
   99| 000027 F8                                        
   99| 000028 00                                        
   99| 000029 7E                          JLE    SHORT L38 
   99| 00002A 2E                                        
   99| 00002B C745                        MOV    DWORD PTR [EBP-4], 1 
   99| 00002D FC                                        
   99| 00002E 01000000                                  
   99|                 L40:                             
;  Source Line # 100
  100| 000032 8B45                        MOV    EAX, [EBP+12] ;  params
  100| 000034 0C                                        
  100| 000035 8B18                        MOV    EBX, [EAX+0] 
  100| 000037 8B4D                        MOV    ECX, [EBP-12] 
  100| 000039 F4                                        
  100| 00003A 8B55                        MOV    EDX, [EBP+8] ;  po_access
  100| 00003C 08                                        
  100| 00003D 8B75                        MOV    ESI, [EBP-12] 
  100| 00003F F4                                        
  100| 000040 8B7C8B                      MOV    EDI, [EBX+4*ECX-4] 
  100| 000043 FC                                        
  100| 000044 897CB2                      MOV    [EDX+4*ESI+92], EDI 
  100| 000047 5C                                        
;  Source Line # 101
  101| 000048 8B45                        MOV    EAX, [EBP-8] 
  101| 00004A F8                                        
  101| 00004B 3945                        CMP    [EBP-4], EAX 
  101| 00004D FC                                        
  101| 00004E 74                          JE     SHORT L38 
  101| 00004F 09                                        
  101| 000050 8B45                        MOV    EAX, [EBP-4] 
  101| 000052 FC                                        
  101| 000053 40                          INC    EAX    
  101| 000054 8945                        MOV    [EBP-4], EAX 
  101| 000056 FC                                        
  101| 000057 EB                          JMP    SHORT L40 
  101| 000058 D9                                        
  101|                 L38:                             
;  Source Line # 102
  102| 000059 8B45                        MOV    EAX, [EBP-16] 
  102| 00005B F0                                        
  102| 00005C 3945                        CMP    [EBP-12], EAX 
  102| 00005E F4                                        
  102| 00005F 74                          JE     SHORT L34 
  102| 000060 09                                        
  102| 000061 8B45                        MOV    EAX, [EBP-12] 
  102| 000063 F4                                        
  102| 000064 40                          INC    EAX    
  102| 000065 8945                        MOV    [EBP-12], EAX 
  102| 000067 F4                                        
  102| 000068 EB                          JMP    SHORT L37 
  102| 000069 B2                                        
  102|                 L34:                             
;  Source Line # 103
  103| 00006A 8BE5                        MOV    ESP, EBP 
  103| 00006C 5D                          POP    EBP    
  103| 00006D C2                          RET    8      
  103| 00006E 0800                                      
                       ;                                
                       lab4.synchroandop.setb ENDP      

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000381     DD     00000901 
                                          DD     00000060 
                                          DD     lab4.synchroandop.setb 
                                          DD     __lcl.00000389 
                                          DD     00000061 
                                          DD     lab4.synchroandop.setb+00000006H 
                                          DD     __lcl.00000389 
                                          DD     00000062 
                                          DD     lab4.synchroandop.setb+0000000FH 
                                          DD     __lcl.00000389 
                                          DD     00000063 
                                          DD     lab4.synchroandop.setb+00000025H 
                                          DD     __lcl.00000389 
                                          DD     00000064 
                                          DD     lab4.synchroandop.setb+00000032H 
                                          DD     __lcl.00000389 
                                          DD     00000065 
                                          DD     lab4.synchroandop.setb+00000048H 
                                          DD     __lcl.00000389 
                                          DD     00000066 
                                          DD     lab4.synchroandop.setb+00000059H 
                                          DD     __lcl.00000389 
                                          DD     00000067 
                                          DD     lab4.synchroandop.setb+0000006AH 
                                          DD     __lcl.00000389 
                                          DD     00000067 
                                          DD     lab4.synchroandop.setb+0000006CH 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 112

                       ;                                
                       ;  Start of procedure lab4.synchroandop.getb   
                       ;                                
                                          PUBLIC lab4.synchroandop.getb 
                       lab4.synchroandop.getb PROC NEAR 
;  Source Line # 104
  104| 000000 55                          PUSH   EBP    
  104| 000001 8BEC                        MOV    EBP, ESP 
;  Source Line # 106
  106| 000003 8B05                        MOV    EAX, package1.vec__constrained_array____1 
  106| 000005 00000000                                  
  106| 000009 2D                          SUB    EAX, 1 
  106| 00000A 01000000                                  
  106| 00000E 7D                          JGE    SHORT L35 
  106| 00000F 03                                        
  106| 000010 33C0                        XOR    EAX, EAX 
  106| 000012 48                          DEC    EAX    
  106|                 L35:                             
  106| 000013 CE                          INTO          
  106| 000014 40                          INC    EAX    
  106| 000015 CE                          INTO          
  106| 000016 C1E0                        SHL    EAX, 2 
  106| 000018 02                                        
  106| 000019 8B5D                        MOV    EBX, [EBP+8] ;  po_access
  106| 00001B 08                                        
  106| 00001C 8B4D                        MOV    ECX, [EBP+12] ;  params
  106| 00001E 0C                                        
  106| 00001F 8B11                        MOV    EDX, [ECX+0] 
  106| 000021 50                          PUSH   EAX    
  106| 000022 8D5B                        LEA    EBX, [EBX+96] 
  106| 000024 60                                        
  106| 000025 53                          PUSH   EBX    
  106| 000026 52                          PUSH   EDX    
  106| 000027 E8                          CALL   _rts_block_move 
  106| 000028 00000000                                  
  106| 00002C 8BE5                        MOV    ESP, EBP 
  106| 00002E 5D                          POP    EBP    
  106| 00002F C2                          RET    8      
  106| 000030 0800                                      
                       ;                                
                       lab4.synchroandop.getb ENDP      

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000380     DD     00000301 
                                          DD     00000068 
                                          DD     lab4.synchroandop.getb 
                                          DD     __lcl.00000389 
                                          DD     0000006A 
                                          DD     lab4.synchroandop.getb+00000003H 
                                          DD     __lcl.00000389 
                                          DD     0000006A 
                                          DD     lab4.synchroandop.getb+0000002EH 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 40

                       ;                                
                       ;  Start of procedure lab4.synchroandop.inputsync   
                       ;                                
                                          PUBLIC lab4.synchroandop.inputsync 
                       lab4.synchroandop.inputsync PROC NEAR 
;  Source Line # 112
  112| 000000 C2                          RET    16     
  112| 000001 1000                                      
                       ;                                
                       lab4.synchroandop.inputsync ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000379     DD     00000201 
                                          DD     00000070 
                                          DD     lab4.synchroandop.inputsync 
                                          DD     __lcl.00000389 
                                          DD     00000070 
                                          DD     lab4.synchroandop.inputsync+FFFFFFFFH 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 28

                       ;                                
                       ;  Start of procedure lab4.synchroandop.csync   
                       ;                                
                                          PUBLIC lab4.synchroandop.csync 
                       lab4.synchroandop.csync PROC NEAR 
;  Source Line # 117
  117| 000000 C2                          RET    16     
  117| 000001 1000                                      
                       ;                                
                       lab4.synchroandop.csync ENDP     

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000378     DD     00000201 
                                          DD     00000075 
                                          DD     lab4.synchroandop.csync 
                                          DD     __lcl.00000389 
                                          DD     00000075 
                                          DD     lab4.synchroandop.csync+FFFFFFFFH 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 28

                       ;                                
                       ;  Start of procedure lab4.synchroandop.endsync   
                       ;                                
                                          PUBLIC lab4.synchroandop.endsync 
                       lab4.synchroandop.endsync PROC NEAR 
;  Source Line # 122
  122| 000000 C2                          RET    16     
  122| 000001 1000                                      
                       ;                                
                       lab4.synchroandop.endsync ENDP   

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000377     DD     00000201 
                                          DD     0000007A 
                                          DD     lab4.synchroandop.endsync 
                                          DD     __lcl.00000389 
                                          DD     0000007A 
                                          DD     lab4.synchroandop.endsync+FFFFFFFFH 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 28

                       ;                                
                       ;  Start of procedure lab4.synchroandop__all_barriers   
                       ;                                
                                          PUBLIC lab4.synchroandop__all_barriers 
                       lab4.synchroandop__all_barriers PROC NEAR 
;  Source Line # 122
  122| 000000 55                          PUSH   EBP    
  122| 000001 8BEC                        MOV    EBP, ESP 
  122| 000003 83EC                        SUB    ESP, 4 
  122| 000005 04                                        
  122| 000006 C745                        MOV    DWORD PTR [EBP-4], 0 
  122| 000008 FC                                        
  122| 000009 00000000                                  
  122| 00000D 8B45                        MOV    EAX, [EBP+8] ;  po_access
  122| 00000F 08                                        
  122| 000010 8378                        CMP    DWORD PTR [EAX+72], 3 
  122| 000012 48                                        
  122| 000013 03                                        
  122| 000014 75                          JNE    SHORT L35 
  122| 000015 0B                                        
  122| 000016 8B45                        MOV    EAX, [EBP-4] 
  122| 000018 FC                                        
  122| 000019 0D                          OR     EAX, 1 
  122| 00001A 01000000                                  
  122| 00001E 8945                        MOV    [EBP-4], EAX 
  122| 000020 FC                                        
  122|                 L35:                             
  122| 000021 8B45                        MOV    EAX, [EBP+8] ;  po_access
  122| 000023 08                                        
  122| 000024 8B1D                        MOV    EBX, package1.p 
  122| 000026 00000000                                  
  122| 00002A 3958                        CMP    [EAX+76], EBX 
  122| 00002C 4C                                        
  122| 00002D 75                          JNE    SHORT L37 
  122| 00002E 0B                                        
  122| 00002F 8B45                        MOV    EAX, [EBP-4] 
  122| 000031 FC                                        
  122| 000032 0D                          OR     EAX, 2 
  122| 000033 02000000                                  
  122| 000037 8945                        MOV    [EBP-4], EAX 
  122| 000039 FC                                        
  122|                 L37:                             
  122| 00003A 8B45                        MOV    EAX, [EBP+8] ;  po_access
  122| 00003C 08                                        
  122| 00003D 8B1D                        MOV    EBX, package1.p 
  122| 00003F 00000000                                  
  122| 000043 4B                          DEC    EBX    
  122| 000044 3958                        CMP    [EAX+76], EBX 
  122| 000046 4C                                        
  122| 000047 75                          JNE    SHORT L39 
  122| 000048 0B                                        
  122| 000049 8B45                        MOV    EAX, [EBP-4] 
  122| 00004B FC                                        
  122| 00004C 0D                          OR     EAX, 4 
  122| 00004D 04000000                                  
  122| 000051 8945                        MOV    [EBP-4], EAX 
  122| 000053 FC                                        
  122|                 L39:                             
  122| 000054 8B45                        MOV    EAX, [EBP-4] 
  122| 000056 FC                                        
  122| 000057 8BE5                        MOV    ESP, EBP 
  122| 000059 5D                          POP    EBP    
  122| 00005A C2                          RET    4      
  122| 00005B 0400                                      
                       ;                                
                       lab4.synchroandop__all_barriers ENDP  
                       ;                                
                       ;  Start of procedure lab4.t1__body   
                       ;                                
                                          PUBLIC lab4.t1__body 
                       lab4.t1__body      PROC   NEAR   
;  Source Line # 134
  134| 000000 64                          FS:           
  134| 000001 8B15                        MOV    EDX, 4 
  134| 000003 04000000                                  
  134| 000007 8B52                        MOV    EDX, [EDX-4] 
  134| 000009 FC                                        
  134| 00000A 55                          PUSH   EBP    
  134| 00000B 8BEC                        MOV    EBP, ESP 
  134| 00000D 83EC                        SUB    ESP, 104 
  134| 00000F 68                                        
;  Source Line # 136
  136| 000010 8B02                        MOV    EAX, [EDX+0] 
  136| 000012 8945                        MOV    [EBP-92], EAX ;  dyn_temp
  136| 000014 A4                                        
  136| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  136| 000017 00000000                                  
  136| 00001B 83EB                        SUB    EBX, 1 
  136| 00001D 01                                        
  136| 00001E 7D                          JGE    SHORT L70 
  136| 00001F 03                                        
  136| 000020 33DB                        XOR    EBX, EBX 
  136| 000022 4B                          DEC    EBX    
  136|                 L70:                             
  136| 000023 CE                          INTO          
  136| 000024 43                          INC    EBX    
  136| 000025 CE                          INTO          
  136| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  136| 000029 00000000                                  
  136| 00002D 53                          PUSH   EBX    
  136| 00002E 8955                        MOV    [EBP-104], EDX ; Spill
  136| 000030 98                                        
  136| 000031 E8                          CALL   rts_ss_allocate 
  136| 000032 00000000                                  
  136| 000036 8945                        MOV    [EBP-88], EAX ;  MC
  136| 000038 A8                                        
  136| 000039 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
  136| 00003B 00000000                                  
  136| 00003F 83E9                        SUB    ECX, 1 
  136| 000041 01                                        
  136| 000042 7D                          JGE    SHORT L71 
  136| 000043 03                                        
  136| 000044 33C9                        XOR    ECX, ECX 
  136| 000046 49                          DEC    ECX    
  136|                 L71:                             
  136| 000047 CE                          INTO          
  136| 000048 41                          INC    ECX    
  136| 000049 CE                          INTO          
  136| 00004A 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  136| 00004D 00000000                                  
  136| 000051 51                          PUSH   ECX    
  136| 000052 E8                          CALL   rts_ss_allocate 
  136| 000053 00000000                                  
  136| 000057 8945                        MOV    [EBP-84], EAX ;  MO1
  136| 000059 AC                                        
;  Source Line # 137
  137| 00005A 8B35                        MOV    ESI, package1.vec__constrained_array____1 
  137| 00005C 00000000                                  
  137| 000060 83EE                        SUB    ESI, 1 
  137| 000062 01                                        
  137| 000063 7D                          JGE    SHORT L72 
  137| 000064 03                                        
  137| 000065 33F6                        XOR    ESI, ESI 
  137| 000067 4E                          DEC    ESI    
  137|                 L72:                             
  137| 000068 CE                          INTO          
  137| 000069 46                          INC    ESI    
  137| 00006A CE                          INTO          
  137| 00006B C1E6                        SHL    ESI, 2 
  137| 00006D 02                                        
  137| 00006E 56                          PUSH   ESI    
  137| 00006F E8                          CALL   rts_ss_allocate 
  137| 000070 00000000                                  
  137| 000074 8945                        MOV    [EBP-80], EAX ;  B1
  137| 000076 B0                                        
  137| 000077 8B3D                        MOV    EDI, package1.vec__constrained_array____1 
  137| 000079 00000000                                  
  137| 00007D 83EF                        SUB    EDI, 1 
  137| 00007F 01                                        
  137| 000080 7D                          JGE    SHORT L73 
  137| 000081 03                                        
  137| 000082 33FF                        XOR    EDI, EDI 
  137| 000084 4F                          DEC    EDI    
  137|                 L73:                             
  137| 000085 CE                          INTO          
  137| 000086 47                          INC    EDI    
  137| 000087 CE                          INTO          
  137| 000088 C1E7                        SHL    EDI, 2 
  137| 00008A 02                                        
  137| 00008B 57                          PUSH   EDI    
  137| 00008C E8                          CALL   rts_ss_allocate 
  137| 00008D 00000000                                  
  137| 000091 8945                        MOV    [EBP-76], EAX ;  C1
  137| 000093 B4                                        
;  Source Line # 138
  138| 000094 E8                          CALL   rts_activation_succeeded 
  138| 000095 00000000                                  
;  Source Line # 139
  139| 000099 68                          PUSH   __lcl.00000165 
  139| 00009A 00000000                                  
  139| 00009E 68                          PUSH   __lcl.00000164 
  139| 00009F 00000000                                  
  139| 0000A3 E8                          CALL   ada.text_io.put_line__2 
  139| 0000A4 00000000                                  
;  Source Line # 142
  142| 0000A8 8B55                        MOV    EDX, [EBP-104] ; Spill
  142| 0000AA 98                                        
  142| 0000AB 8B5A                        MOV    EBX, [EDX+48] 
  142| 0000AD 30                                        
  142| 0000AE 8B8B                        MOV    ECX, [EBX-256] ;  MX
  142| 0000B0 00FFFFFF                                  
  142| 0000B4 51                          PUSH   ECX    
  142| 0000B5 E8                          CALL   package1.matr_input 
  142| 0000B6 00000000                                  
;  Source Line # 144
  144| 0000BA 68                          PUSH   lab4.synchroandop.input 
  144| 0000BB 00000000                                  
  144| 0000BF 6A                          PUSH   0      
  144| 0000C0 00                                        
  144| 0000C1 8B55                        MOV    EDX, [EBP-104] ; Spill
  144| 0000C3 98                                        
  144| 0000C4 8B72                        MOV    ESI, [EDX+48] 
  144| 0000C6 30                                        
  144| 0000C7 8BBE                        MOV    EDI, [ESI-184] ;  SynchroAndOP
  144| 0000C9 48FFFFFF                                  
  144| 0000CD 57                          PUSH   EDI    
  144| 0000CE E8                          CALL   rts_protected_procedure_call 
  144| 0000CF 00000000                                  
;  Source Line # 146
  146| 0000D3 6A                          PUSH   0      
  146| 0000D4 00                                        
  146| 0000D5 6A                          PUSH   0      
  146| 0000D6 00                                        
  146| 0000D7 6A                          PUSH   0      
  146| 0000D8 00                                        
  146| 0000D9 8B55                        MOV    EDX, [EBP-104] ; Spill
  146| 0000DB 98                                        
  146| 0000DC 8B42                        MOV    EAX, [EDX+48] 
  146| 0000DE 30                                        
  146| 0000DF 8B98                        MOV    EBX, [EAX-184] ;  SynchroAndOP
  146| 0000E1 48FFFFFF                                  
  146| 0000E5 53                          PUSH   EBX    
  146| 0000E6 E8                          CALL   rts_protected_entry_call 
  146| 0000E7 00000000                                  
;  Source Line # 148
  148| 0000EB 8B4D                        MOV    ECX, [EBP-80] ;  B1
  148| 0000ED B0                                        
  148| 0000EE 894D                        MOV    [EBP-72], ECX 
  148| 0000F0 B8                                        
  148| 0000F1 68                          PUSH   lab4.synchroandop.getb 
  148| 0000F2 00000000                                  
  148| 0000F6 8D75                        LEA    ESI, [EBP-72] 
  148| 0000F8 B8                                        
  148| 0000F9 56                          PUSH   ESI    
  148| 0000FA 8B55                        MOV    EDX, [EBP-104] ; Spill
  148| 0000FC 98                                        
  148| 0000FD 8B7A                        MOV    EDI, [EDX+48] 
  148| 0000FF 30                                        
  148| 000100 8B87                        MOV    EAX, [EDI-184] ;  SynchroAndOP
  148| 000102 48FFFFFF                                  
  148| 000106 50                          PUSH   EAX    
  148| 000107 E8                          CALL   rts_entryless_protected_subp_call 
  148| 000108 00000000                                  
  148| 00010C 8B1D                        MOV    EBX, package1.h 
  148| 00010E 00000000                                  
  148| 000112 895D                        MOV    [EBP-68], EBX 
  148| 000114 BC                                        
;  Source Line # 150
  150| 000115 837D                        CMP    DWORD PTR [EBP-68], 0 
  150| 000117 BC                                        
  150| 000118 00                                        
  150| 000119 0F8E                        JLE    L35    
  150| 00011B 8F000000                                  
  150| 00011F C745                        MOV    DWORD PTR [EBP-64], 1 
  150| 000121 C0                                        
  150| 000122 01000000                                  
  150|                 L37:                             
;  Source Line # 151
  151| 000126 C745                        MOV    DWORD PTR [EBP-96], 0 ;  Sum1
  151| 000128 A0                                        
  151| 000129 00000000                                  
  151| 00012D 8B05                        MOV    EAX, package1.n 
  151| 00012F 00000000                                  
  151| 000133 8945                        MOV    [EBP-60], EAX 
  151| 000135 C4                                        
;  Source Line # 152
  152| 000136 837D                        CMP    DWORD PTR [EBP-60], 0 
  152| 000138 C4                                        
  152| 000139 00                                        
  152| 00013A 7E                          JLE    SHORT L38 
  152| 00013B 51                                        
  152| 00013C C745                        MOV    DWORD PTR [EBP-56], 1 
  152| 00013E C8                                        
  152| 00013F 01000000                                  
  152|                 L40:                             
;  Source Line # 153
  153| 000143 8B45                        MOV    EAX, [EBP-80] ;  B1
  153| 000145 B0                                        
  153| 000146 8B5D                        MOV    EBX, [EBP-56] 
  153| 000148 C8                                        
  153| 000149 8B55                        MOV    EDX, [EBP-104] ; Spill
  153| 00014B 98                                        
  153| 00014C 8B4A                        MOV    ECX, [EDX+48] 
  153| 00014E 30                                        
  153| 00014F 8BB1                        MOV    ESI, [ECX-252] ;  MZ
  153| 000151 04FFFFFF                                  
  153| 000155 8B7D                        MOV    EDI, [EBP-64] 
  153| 000157 C0                                        
  153| 000158 8D7F                        LEA    EDI, [EDI-1] 
  153| 00015A FF                                        
  153| 00015B 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
  153| 00015E 00000000                                  
  153| 000162 8B55                        MOV    EDX, [EBP-56] 
  153| 000164 C8                                        
  153| 000165 8D1495                      LEA    EDX, [4*EDX-4] 
  153| 000168 FCFFFFFF                                  
  153| 00016C 03FA                        ADD    EDI, EDX 
  153| 00016E 8B4498                      MOV    EAX, [EAX+4*EBX-4] 
  153| 000171 FC                                        
  153| 000172 0FAF043E                    IMUL   EAX, [ESI+EDI+0] 
  153| 000176 0345                        ADD    EAX, [EBP-96] ;  Sum1
  153| 000178 A0                                        
  153| 000179 8945                        MOV    [EBP-96], EAX ;  Sum1
  153| 00017B A0                                        
;  Source Line # 154
  154| 00017C 8B5D                        MOV    EBX, [EBP-60] 
  154| 00017E C4                                        
  154| 00017F 395D                        CMP    [EBP-56], EBX 
  154| 000181 C8                                        
  154| 000182 74                          JE     SHORT L38 
  154| 000183 09                                        
  154| 000184 8B45                        MOV    EAX, [EBP-56] 
  154| 000186 C8                                        
  154| 000187 40                          INC    EAX    
  154| 000188 8945                        MOV    [EBP-56], EAX 
  154| 00018A C8                                        
  154| 00018B EB                          JMP    SHORT L40 
  154| 00018C B6                                        
  154|                 L38:                             
;  Source Line # 155
  155| 00018D 8B45                        MOV    EAX, [EBP-76] ;  C1
  155| 00018F B4                                        
  155| 000190 8B5D                        MOV    EBX, [EBP-64] 
  155| 000192 C0                                        
  155| 000193 8B4D                        MOV    ECX, [EBP-96] ;  Sum1
  155| 000195 A0                                        
  155| 000196 894C98                      MOV    [EAX+4*EBX-4], ECX 
  155| 000199 FC                                        
;  Source Line # 156
  156| 00019A 8B55                        MOV    EDX, [EBP-68] 
  156| 00019C BC                                        
  156| 00019D 3955                        CMP    [EBP-64], EDX 
  156| 00019F C0                                        
  156| 0001A0 74                          JE     SHORT L35 
  156| 0001A1 0C                                        
  156| 0001A2 8B45                        MOV    EAX, [EBP-64] 
  156| 0001A4 C0                                        
  156| 0001A5 40                          INC    EAX    
  156| 0001A6 8945                        MOV    [EBP-64], EAX 
  156| 0001A8 C0                                        
  156| 0001A9 E9                          JMP    L37    
  156| 0001AA 78FFFFFF                                  
  156|                 L35:                             
;  Source Line # 157
  157| 0001AE 8B45                        MOV    EAX, [EBP-76] ;  C1
  157| 0001B0 B4                                        
  157| 0001B1 8945                        MOV    [EBP-52], EAX 
  157| 0001B3 CC                                        
  157| 0001B4 68                          PUSH   lab4.synchroandop.setc 
  157| 0001B5 00000000                                  
  157| 0001B9 8D5D                        LEA    EBX, [EBP-52] 
  157| 0001BB CC                                        
  157| 0001BC 53                          PUSH   EBX    
  157| 0001BD 8B55                        MOV    EDX, [EBP-104] ; Spill
  157| 0001BF 98                                        
  157| 0001C0 8B4A                        MOV    ECX, [EDX+48] 
  157| 0001C2 30                                        
  157| 0001C3 8BB1                        MOV    ESI, [ECX-184] ;  SynchroAndOP
  157| 0001C5 48FFFFFF                                  
  157| 0001C9 56                          PUSH   ESI    
  157| 0001CA E8                          CALL   rts_protected_procedure_call 
  157| 0001CB 00000000                                  
;  Source Line # 159
  159| 0001CF 68                          PUSH   lab4.synchroandop.csignal 
  159| 0001D0 00000000                                  
  159| 0001D4 6A                          PUSH   0      
  159| 0001D5 00                                        
  159| 0001D6 8B55                        MOV    EDX, [EBP-104] ; Spill
  159| 0001D8 98                                        
  159| 0001D9 8B7A                        MOV    EDI, [EDX+48] 
  159| 0001DB 30                                        
  159| 0001DC 8B87                        MOV    EAX, [EDI-184] ;  SynchroAndOP
  159| 0001DE 48FFFFFF                                  
  159| 0001E2 50                          PUSH   EAX    
  159| 0001E3 E8                          CALL   rts_protected_procedure_call 
  159| 0001E4 00000000                                  
;  Source Line # 161
  161| 0001E8 8B5D                        MOV    EBX, [EBP-84] ;  MO1
  161| 0001EA AC                                        
  161| 0001EB 895D                        MOV    [EBP-48], EBX 
  161| 0001ED D0                                        
  161| 0001EE 68                          PUSH   lab4.synchroandop.getmo 
  161| 0001EF 00000000                                  
  161| 0001F3 8D4D                        LEA    ECX, [EBP-48] 
  161| 0001F5 D0                                        
  161| 0001F6 51                          PUSH   ECX    
  161| 0001F7 8B55                        MOV    EDX, [EBP-104] ; Spill
  161| 0001F9 98                                        
  161| 0001FA 8B72                        MOV    ESI, [EDX+48] 
  161| 0001FC 30                                        
  161| 0001FD 8BBE                        MOV    EDI, [ESI-184] ;  SynchroAndOP
  161| 0001FF 48FFFFFF                                  
  161| 000203 57                          PUSH   EDI    
  161| 000204 E8                          CALL   rts_entryless_protected_subp_call 
  161| 000205 00000000                                  
  161| 000209 8B05                        MOV    EAX, package1.n 
  161| 00020B 00000000                                  
  161| 00020F 8945                        MOV    [EBP-44], EAX 
  161| 000211 D4                                        
;  Source Line # 163
  163| 000212 837D                        CMP    DWORD PTR [EBP-44], 0 
  163| 000214 D4                                        
  163| 000215 00                                        
  163| 000216 0F8E                        JLE    L45    
  163| 000218 E7000000                                  
  163| 00021C C745                        MOV    DWORD PTR [EBP-40], 1 
  163| 00021E D8                                        
  163| 00021F 01000000                                  
  163|                 L47:                             
  163| 000223 8B05                        MOV    EAX, package1.h 
  163| 000225 00000000                                  
  163| 000229 8945                        MOV    [EBP-36], EAX 
  163| 00022B DC                                        
;  Source Line # 164
  164| 00022C 837D                        CMP    DWORD PTR [EBP-36], 0 
  164| 00022E DC                                        
  164| 00022F 00                                        
  164| 000230 0F8E                        JLE    L48    
  164| 000232 B9000000                                  
  164| 000236 C745                        MOV    DWORD PTR [EBP-32], 1 
  164| 000238 E0                                        
  164| 000239 01000000                                  
  164|                 L50:                             
;  Source Line # 165
  165| 00023D C745                        MOV    DWORD PTR [EBP-96], 0 ;  Sum1
  165| 00023F A0                                        
  165| 000240 00000000                                  
  165| 000244 8B05                        MOV    EAX, package1.n 
  165| 000246 00000000                                  
  165| 00024A 8945                        MOV    [EBP-28], EAX 
  165| 00024C E4                                        
;  Source Line # 166
  166| 00024D 837D                        CMP    DWORD PTR [EBP-28], 0 
  166| 00024F E4                                        
  166| 000250 00                                        
  166| 000251 7E                          JLE    SHORT L51 
  166| 000252 66                                        
  166| 000253 C745                        MOV    DWORD PTR [EBP-24], 1 
  166| 000255 E8                                        
  166| 000256 01000000                                  
  166|                 L53:                             
;  Source Line # 167
  167| 00025A 8B55                        MOV    EDX, [EBP-104] ; Spill
  167| 00025C 98                                        
  167| 00025D 8B42                        MOV    EAX, [EDX+48] 
  167| 00025F 30                                        
  167| 000260 8B98                        MOV    EBX, [EAX-256] ;  MX
  167| 000262 00FFFFFF                                  
  167| 000266 8B4D                        MOV    ECX, [EBP-24] 
  167| 000268 E8                                        
  167| 000269 8D49                        LEA    ECX, [ECX-1] 
  167| 00026B FF                                        
  167| 00026C 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  167| 00026F 00000000                                  
  167| 000273 8B75                        MOV    ESI, [EBP-32] 
  167| 000275 E0                                        
  167| 000276 8D34B5                      LEA    ESI, [4*ESI-4] 
  167| 000279 FCFFFFFF                                  
  167| 00027D 03CE                        ADD    ECX, ESI 
  167| 00027F 8B7D                        MOV    EDI, [EBP-84] ;  MO1
  167| 000281 AC                                        
  167| 000282 8B55                        MOV    EDX, [EBP-40] 
  167| 000284 D8                                        
  167| 000285 8D52                        LEA    EDX, [EDX-1] 
  167| 000287 FF                                        
  167| 000288 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  167| 00028B 00000000                                  
  167| 00028F 8B45                        MOV    EAX, [EBP-24] 
  167| 000291 E8                                        
  167| 000292 8D0485                      LEA    EAX, [4*EAX-4] 
  167| 000295 FCFFFFFF                                  
  167| 000299 03D0                        ADD    EDX, EAX 
  167| 00029B 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  167| 00029E 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  167| 0002A2 035D                        ADD    EBX, [EBP-96] ;  Sum1
  167| 0002A4 A0                                        
  167| 0002A5 895D                        MOV    [EBP-96], EBX ;  Sum1
  167| 0002A7 A0                                        
;  Source Line # 168
  168| 0002A8 8B75                        MOV    ESI, [EBP-28] 
  168| 0002AA E4                                        
  168| 0002AB 3975                        CMP    [EBP-24], ESI 
  168| 0002AD E8                                        
  168| 0002AE 74                          JE     SHORT L51 
  168| 0002AF 09                                        
  168| 0002B0 8B45                        MOV    EAX, [EBP-24] 
  168| 0002B2 E8                                        
  168| 0002B3 40                          INC    EAX    
  168| 0002B4 8945                        MOV    [EBP-24], EAX 
  168| 0002B6 E8                                        
  168| 0002B7 EB                          JMP    SHORT L53 
  168| 0002B8 A1                                        
  168|                 L51:                             
;  Source Line # 169
  169| 0002B9 8B45                        MOV    EAX, [EBP-88] ;  MC
  169| 0002BB A8                                        
  169| 0002BC 8B5D                        MOV    EBX, [EBP-40] 
  169| 0002BE D8                                        
  169| 0002BF 8D5B                        LEA    EBX, [EBX-1] 
  169| 0002C1 FF                                        
  169| 0002C2 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  169| 0002C5 00000000                                  
  169| 0002C9 8B4D                        MOV    ECX, [EBP-32] 
  169| 0002CB E0                                        
  169| 0002CC 8D0C8D                      LEA    ECX, [4*ECX-4] 
  169| 0002CF FCFFFFFF                                  
  169| 0002D3 03D9                        ADD    EBX, ECX 
  169| 0002D5 8B55                        MOV    EDX, [EBP-96] ;  Sum1
  169| 0002D7 A0                                        
  169| 0002D8 891418                      MOV    [EAX+EBX+0], EDX 
;  Source Line # 170
  170| 0002DB 8B75                        MOV    ESI, [EBP-36] 
  170| 0002DD DC                                        
  170| 0002DE 3975                        CMP    [EBP-32], ESI 
  170| 0002E0 E0                                        
  170| 0002E1 74                          JE     SHORT L48 
  170| 0002E2 0C                                        
  170| 0002E3 8B45                        MOV    EAX, [EBP-32] 
  170| 0002E5 E0                                        
  170| 0002E6 40                          INC    EAX    
  170| 0002E7 8945                        MOV    [EBP-32], EAX 
  170| 0002E9 E0                                        
  170| 0002EA E9                          JMP    L50    
  170| 0002EB 4EFFFFFF                                  
  170|                 L48:                             
;  Source Line # 171
  171| 0002EF 8B45                        MOV    EAX, [EBP-44] 
  171| 0002F1 D4                                        
  171| 0002F2 3945                        CMP    [EBP-40], EAX 
  171| 0002F4 D8                                        
  171| 0002F5 74                          JE     SHORT L45 
  171| 0002F6 0C                                        
  171| 0002F7 8B45                        MOV    EAX, [EBP-40] 
  171| 0002F9 D8                                        
  171| 0002FA 40                          INC    EAX    
  171| 0002FB 8945                        MOV    [EBP-40], EAX 
  171| 0002FD D8                                        
  171| 0002FE E9                          JMP    L47    
  171| 0002FF 20FFFFFF                                  
  171|                 L45:                             
;  Source Line # 173
  173| 000303 6A                          PUSH   0      
  173| 000304 00                                        
  173| 000305 6A                          PUSH   1      
  173| 000306 01                                        
  173| 000307 6A                          PUSH   0      
  173| 000308 00                                        
  173| 000309 8B55                        MOV    EDX, [EBP-104] ; Spill
  173| 00030B 98                                        
  173| 00030C 8B42                        MOV    EAX, [EDX+48] 
  173| 00030E 30                                        
  173| 00030F 8B98                        MOV    EBX, [EAX-184] ;  SynchroAndOP
  173| 000311 48FFFFFF                                  
  173| 000315 53                          PUSH   EBX    
  173| 000316 E8                          CALL   rts_protected_entry_call 
  173| 000317 00000000                                  
;  Source Line # 175
  175| 00031B 8B4D                        MOV    ECX, [EBP-76] ;  C1
  175| 00031D B4                                        
  175| 00031E 894D                        MOV    [EBP-20], ECX 
  175| 000320 EC                                        
  175| 000321 68                          PUSH   lab4.synchroandop.getc 
  175| 000322 00000000                                  
  175| 000326 8D75                        LEA    ESI, [EBP-20] 
  175| 000328 EC                                        
  175| 000329 56                          PUSH   ESI    
  175| 00032A 8B55                        MOV    EDX, [EBP-104] ; Spill
  175| 00032C 98                                        
  175| 00032D 8B7A                        MOV    EDI, [EDX+48] 
  175| 00032F 30                                        
  175| 000330 8B87                        MOV    EAX, [EDI-184] ;  SynchroAndOP
  175| 000332 48FFFFFF                                  
  175| 000336 50                          PUSH   EAX    
  175| 000337 E8                          CALL   rts_entryless_protected_subp_call 
  175| 000338 00000000                                  
  175| 00033C 8B1D                        MOV    EBX, package1.h 
  175| 00033E 00000000                                  
  175| 000342 895D                        MOV    [EBP-16], EBX 
  175| 000344 F0                                        
;  Source Line # 177
  177| 000345 837D                        CMP    DWORD PTR [EBP-16], 0 
  177| 000347 F0                                        
  177| 000348 00                                        
  177| 000349 0F8E                        JLE    L60    
  177| 00034B 8F000000                                  
  177| 00034F C745                        MOV    DWORD PTR [EBP-12], 1 
  177| 000351 F4                                        
  177| 000352 01000000                                  
  177|                 L62:                             
;  Source Line # 178
  178| 000356 C745                        MOV    DWORD PTR [EBP-96], 0 ;  Sum1
  178| 000358 A0                                        
  178| 000359 00000000                                  
  178| 00035D 8B05                        MOV    EAX, package1.n 
  178| 00035F 00000000                                  
  178| 000363 8945                        MOV    [EBP-8], EAX 
  178| 000365 F8                                        
;  Source Line # 179
  179| 000366 837D                        CMP    DWORD PTR [EBP-8], 0 
  179| 000368 F8                                        
  179| 000369 00                                        
  179| 00036A 7E                          JLE    SHORT L63 
  179| 00036B 48                                        
  179| 00036C C745                        MOV    DWORD PTR [EBP-4], 1 
  179| 00036E FC                                        
  179| 00036F 01000000                                  
  179|                 L65:                             
;  Source Line # 180
  180| 000373 8B45                        MOV    EAX, [EBP-76] ;  C1
  180| 000375 B4                                        
  180| 000376 8B5D                        MOV    EBX, [EBP-4] 
  180| 000378 FC                                        
  180| 000379 8B4D                        MOV    ECX, [EBP-88] ;  MC
  180| 00037B A8                                        
  180| 00037C 8B55                        MOV    EDX, [EBP-4] 
  180| 00037E FC                                        
  180| 00037F 8D52                        LEA    EDX, [EDX-1] 
  180| 000381 FF                                        
  180| 000382 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  180| 000385 00000000                                  
  180| 000389 8B75                        MOV    ESI, [EBP-12] 
  180| 00038B F4                                        
  180| 00038C 8D34B5                      LEA    ESI, [4*ESI-4] 
  180| 00038F FCFFFFFF                                  
  180| 000393 03D6                        ADD    EDX, ESI 
  180| 000395 8B7C98                      MOV    EDI, [EAX+4*EBX-4] 
  180| 000398 FC                                        
  180| 000399 0FAF3C11                    IMUL   EDI, [ECX+EDX+0] 
  180| 00039D 037D                        ADD    EDI, [EBP-96] ;  Sum1
  180| 00039F A0                                        
  180| 0003A0 897D                        MOV    [EBP-96], EDI ;  Sum1
  180| 0003A2 A0                                        
;  Source Line # 181
  181| 0003A3 8B45                        MOV    EAX, [EBP-8] 
  181| 0003A5 F8                                        
  181| 0003A6 3945                        CMP    [EBP-4], EAX 
  181| 0003A8 FC                                        
  181| 0003A9 74                          JE     SHORT L63 
  181| 0003AA 09                                        
  181| 0003AB 8B45                        MOV    EAX, [EBP-4] 
  181| 0003AD FC                                        
  181| 0003AE 40                          INC    EAX    
  181| 0003AF 8945                        MOV    [EBP-4], EAX 
  181| 0003B1 FC                                        
  181| 0003B2 EB                          JMP    SHORT L65 
  181| 0003B3 BF                                        
  181|                 L63:                             
;  Source Line # 182
  182| 0003B4 8B55                        MOV    EDX, [EBP-104] ; Spill
  182| 0003B6 98                                        
  182| 0003B7 8B42                        MOV    EAX, [EDX+48] 
  182| 0003B9 30                                        
  182| 0003BA 8B98                        MOV    EBX, [EAX-248] ;  A
  182| 0003BC 08FFFFFF                                  
  182| 0003C0 8B4D                        MOV    ECX, [EBP-12] 
  182| 0003C2 F4                                        
  182| 0003C3 8B75                        MOV    ESI, [EBP-96] ;  Sum1
  182| 0003C5 A0                                        
  182| 0003C6 89748B                      MOV    [EBX+4*ECX-4], ESI 
  182| 0003C9 FC                                        
;  Source Line # 183
  183| 0003CA 8B7D                        MOV    EDI, [EBP-16] 
  183| 0003CC F0                                        
  183| 0003CD 397D                        CMP    [EBP-12], EDI 
  183| 0003CF F4                                        
  183| 0003D0 74                          JE     SHORT L60 
  183| 0003D1 0C                                        
  183| 0003D2 8B45                        MOV    EAX, [EBP-12] 
  183| 0003D4 F4                                        
  183| 0003D5 40                          INC    EAX    
  183| 0003D6 8945                        MOV    [EBP-12], EAX 
  183| 0003D8 F4                                        
  183| 0003D9 E9                          JMP    L62    
  183| 0003DA 78FFFFFF                                  
  183|                 L60:                             
;  Source Line # 185
  185| 0003DE 6A                          PUSH   0      
  185| 0003DF 00                                        
  185| 0003E0 6A                          PUSH   2      
  185| 0003E1 02                                        
  185| 0003E2 6A                          PUSH   0      
  185| 0003E3 00                                        
  185| 0003E4 8B55                        MOV    EDX, [EBP-104] ; Spill
  185| 0003E6 98                                        
  185| 0003E7 8B42                        MOV    EAX, [EDX+48] 
  185| 0003E9 30                                        
  185| 0003EA 8B98                        MOV    EBX, [EAX-184] ;  SynchroAndOP
  185| 0003EC 48FFFFFF                                  
  185| 0003F0 53                          PUSH   EBX    
  185| 0003F1 E8                          CALL   rts_protected_entry_call 
  185| 0003F2 00000000                                  
;  Source Line # 187
  187| 0003F6 68                          PUSH   __lcl.00000207 
  187| 0003F7 00000000                                  
  187| 0003FB 68                          PUSH   __lcl.00000206 
  187| 0003FC 00000000                                  
  187| 000400 E8                          CALL   ada.text_io.put_line__2 
  187| 000401 00000000                                  
  187| 000405 8D4D                        LEA    ECX, [EBP-92] ;  dyn_temp
  187| 000407 A4                                        
  187| 000408 51                          PUSH   ECX    
  187| 000409 E8                          CALL   rts_ss_release 
  187| 00040A 00000000                                  
;  Source Line # 188
  188| 00040E 8BE5                        MOV    ESP, EBP 
  188| 000410 5D                          POP    EBP    
  188| 000411 C2                          RET    4      
  188| 000412 0400                                      
                       ;                                
                       lab4.t1__body      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000376     DD     00002901 
                                          DD     00000086 
                                          DD     lab4.t1__body 
                                          DD     __lcl.00000389 
                                          DD     00000088 
                                          DD     lab4.t1__body+00000010H 
                                          DD     __lcl.00000389 
                                          DD     00000089 
                                          DD     lab4.t1__body+0000005AH 
                                          DD     __lcl.00000389 
                                          DD     0000008A 
                                          DD     lab4.t1__body+00000094H 
                                          DD     __lcl.00000389 
                                          DD     0000008B 
                                          DD     lab4.t1__body+00000099H 
                                          DD     __lcl.00000389 
                                          DD     0000008E 
                                          DD     lab4.t1__body+000000A8H 
                                          DD     __lcl.00000389 
                                          DD     00000090 
                                          DD     lab4.t1__body+000000BAH 
                                          DD     __lcl.00000389 
                                          DD     00000092 
                                          DD     lab4.t1__body+000000D3H 
                                          DD     __lcl.00000389 
                                          DD     00000094 
                                          DD     lab4.t1__body+000000EBH 
                                          DD     __lcl.00000389 
                                          DD     00000096 
                                          DD     lab4.t1__body+00000115H 
                                          DD     __lcl.00000389 
                                          DD     00000097 
                                          DD     lab4.t1__body+00000126H 
                                          DD     __lcl.00000389 
                                          DD     00000098 
                                          DD     lab4.t1__body+00000136H 
                                          DD     __lcl.00000389 
                                          DD     00000099 
                                          DD     lab4.t1__body+00000143H 
                                          DD     __lcl.00000389 
                                          DD     0000009A 
                                          DD     lab4.t1__body+0000017CH 
                                          DD     __lcl.00000389 
                                          DD     0000009B 
                                          DD     lab4.t1__body+0000018DH 
                                          DD     __lcl.00000389 
                                          DD     0000009C 
                                          DD     lab4.t1__body+0000019AH 
                                          DD     __lcl.00000389 
                                          DD     0000009D 
                                          DD     lab4.t1__body+000001AEH 
                                          DD     __lcl.00000389 
                                          DD     0000009F 
                                          DD     lab4.t1__body+000001CFH 
                                          DD     __lcl.00000389 
                                          DD     000000A1 
                                          DD     lab4.t1__body+000001E8H 
                                          DD     __lcl.00000389 
                                          DD     000000A3 
                                          DD     lab4.t1__body+00000212H 
                                          DD     __lcl.00000389 
                                          DD     000000A4 
                                          DD     lab4.t1__body+0000022CH 
                                          DD     __lcl.00000389 
                                          DD     000000A5 
                                          DD     lab4.t1__body+0000023DH 
                                          DD     __lcl.00000389 
                                          DD     000000A6 
                                          DD     lab4.t1__body+0000024DH 
                                          DD     __lcl.00000389 
                                          DD     000000A7 
                                          DD     lab4.t1__body+0000025AH 
                                          DD     __lcl.00000389 
                                          DD     000000A8 
                                          DD     lab4.t1__body+000002A8H 
                                          DD     __lcl.00000389 
                                          DD     000000A9 
                                          DD     lab4.t1__body+000002B9H 
                                          DD     __lcl.00000389 
                                          DD     000000AA 
                                          DD     lab4.t1__body+000002DBH 
                                          DD     __lcl.00000389 
                                          DD     000000AB 
                                          DD     lab4.t1__body+000002EFH 
                                          DD     __lcl.00000389 
                                          DD     000000AD 
                                          DD     lab4.t1__body+00000303H 
                                          DD     __lcl.00000389 
                                          DD     000000AF 
                                          DD     lab4.t1__body+0000031BH 
                                          DD     __lcl.00000389 
                                          DD     000000B1 
                                          DD     lab4.t1__body+00000345H 
                                          DD     __lcl.00000389 
                                          DD     000000B2 
                                          DD     lab4.t1__body+00000356H 
                                          DD     __lcl.00000389 
                                          DD     000000B3 
                                          DD     lab4.t1__body+00000366H 
                                          DD     __lcl.00000389 
                                          DD     000000B4 
                                          DD     lab4.t1__body+00000373H 
                                          DD     __lcl.00000389 
                                          DD     000000B5 
                                          DD     lab4.t1__body+000003A3H 
                                          DD     __lcl.00000389 
                                          DD     000000B6 
                                          DD     lab4.t1__body+000003B4H 
                                          DD     __lcl.00000389 
                                          DD     000000B7 
                                          DD     lab4.t1__body+000003CAH 
                                          DD     __lcl.00000389 
                                          DD     000000B9 
                                          DD     lab4.t1__body+000003DEH 
                                          DD     __lcl.00000389 
                                          DD     000000BB 
                                          DD     lab4.t1__body+000003F6H 
                                          DD     __lcl.00000389 
                                          DD     000000BC 
                                          DD     lab4.t1__body+0000040EH 
                                          DD     __lcl.00000389 
                                          DD     000000BC 
                                          DD     lab4.t1__body+00000410H 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 496

                       ;                                
                       ;  Start of procedure lab4.t2__body   
                       ;                                
                                          PUBLIC lab4.t2__body 
                       lab4.t2__body      PROC   NEAR   
;  Source Line # 191
  191| 000000 64                          FS:           
  191| 000001 8B15                        MOV    EDX, 4 
  191| 000003 04000000                                  
  191| 000007 8B52                        MOV    EDX, [EDX-4] 
  191| 000009 FC                                        
  191| 00000A 55                          PUSH   EBP    
  191| 00000B 8BEC                        MOV    EBP, ESP 
  191| 00000D 83EC                        SUB    ESP, 116 
  191| 00000F 74                                        
;  Source Line # 193
  193| 000010 8B02                        MOV    EAX, [EDX+0] 
  193| 000012 8945                        MOV    [EBP-104], EAX ;  dyn_temp
  193| 000014 98                                        
  193| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  193| 000017 00000000                                  
  193| 00001B 83EB                        SUB    EBX, 1 
  193| 00001D 01                                        
  193| 00001E 7D                          JGE    SHORT L70 
  193| 00001F 03                                        
  193| 000020 33DB                        XOR    EBX, EBX 
  193| 000022 4B                          DEC    EBX    
  193|                 L70:                             
  193| 000023 CE                          INTO          
  193| 000024 43                          INC    EBX    
  193| 000025 CE                          INTO          
  193| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  193| 000029 00000000                                  
  193| 00002D 53                          PUSH   EBX    
  193| 00002E 8955                        MOV    [EBP-116], EDX ; Spill
  193| 000030 8C                                        
  193| 000031 E8                          CALL   rts_ss_allocate 
  193| 000032 00000000                                  
  193| 000036 8945                        MOV    [EBP-100], EAX ;  MC
  193| 000038 9C                                        
  193| 000039 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
  193| 00003B 00000000                                  
  193| 00003F 83E9                        SUB    ECX, 1 
  193| 000041 01                                        
  193| 000042 7D                          JGE    SHORT L71 
  193| 000043 03                                        
  193| 000044 33C9                        XOR    ECX, ECX 
  193| 000046 49                          DEC    ECX    
  193|                 L71:                             
  193| 000047 CE                          INTO          
  193| 000048 41                          INC    ECX    
  193| 000049 CE                          INTO          
  193| 00004A 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  193| 00004D 00000000                                  
  193| 000051 51                          PUSH   ECX    
  193| 000052 E8                          CALL   rts_ss_allocate 
  193| 000053 00000000                                  
  193| 000057 8945                        MOV    [EBP-96], EAX ;  MO2
  193| 000059 A0                                        
;  Source Line # 194
  194| 00005A 8B35                        MOV    ESI, package1.vec__constrained_array____1 
  194| 00005C 00000000                                  
  194| 000060 83EE                        SUB    ESI, 1 
  194| 000062 01                                        
  194| 000063 7D                          JGE    SHORT L72 
  194| 000064 03                                        
  194| 000065 33F6                        XOR    ESI, ESI 
  194| 000067 4E                          DEC    ESI    
  194|                 L72:                             
  194| 000068 CE                          INTO          
  194| 000069 46                          INC    ESI    
  194| 00006A CE                          INTO          
  194| 00006B C1E6                        SHL    ESI, 2 
  194| 00006D 02                                        
  194| 00006E 56                          PUSH   ESI    
  194| 00006F E8                          CALL   rts_ss_allocate 
  194| 000070 00000000                                  
  194| 000074 8945                        MOV    [EBP-92], EAX ;  B2
  194| 000076 A4                                        
  194| 000077 8B3D                        MOV    EDI, package1.vec__constrained_array____1 
  194| 000079 00000000                                  
  194| 00007D 83EF                        SUB    EDI, 1 
  194| 00007F 01                                        
  194| 000080 7D                          JGE    SHORT L73 
  194| 000081 03                                        
  194| 000082 33FF                        XOR    EDI, EDI 
  194| 000084 4F                          DEC    EDI    
  194|                 L73:                             
  194| 000085 CE                          INTO          
  194| 000086 47                          INC    EDI    
  194| 000087 CE                          INTO          
  194| 000088 C1E7                        SHL    EDI, 2 
  194| 00008A 02                                        
  194| 00008B 57                          PUSH   EDI    
  194| 00008C E8                          CALL   rts_ss_allocate 
  194| 00008D 00000000                                  
  194| 000091 8945                        MOV    [EBP-88], EAX ;  C2
  194| 000093 A8                                        
;  Source Line # 195
  195| 000094 E8                          CALL   rts_activation_succeeded 
  195| 000095 00000000                                  
;  Source Line # 196
  196| 000099 68                          PUSH   __lcl.00000216 
  196| 00009A 00000000                                  
  196| 00009E 68                          PUSH   __lcl.00000215 
  196| 00009F 00000000                                  
  196| 0000A3 E8                          CALL   ada.text_io.put_line__2 
  196| 0000A4 00000000                                  
;  Source Line # 199
  199| 0000A8 6A                          PUSH   0      
  199| 0000A9 00                                        
  199| 0000AA 6A                          PUSH   0      
  199| 0000AB 00                                        
  199| 0000AC 6A                          PUSH   0      
  199| 0000AD 00                                        
  199| 0000AE 8B55                        MOV    EDX, [EBP-116] ; Spill
  199| 0000B0 8C                                        
  199| 0000B1 8B5A                        MOV    EBX, [EDX+48] 
  199| 0000B3 30                                        
  199| 0000B4 8B8B                        MOV    ECX, [EBX-184] ;  SynchroAndOP
  199| 0000B6 48FFFFFF                                  
  199| 0000BA 51                          PUSH   ECX    
  199| 0000BB E8                          CALL   rts_protected_entry_call 
  199| 0000BC 00000000                                  
;  Source Line # 201
  201| 0000C0 8B75                        MOV    ESI, [EBP-92] ;  B2
  201| 0000C2 A4                                        
  201| 0000C3 8975                        MOV    [EBP-84], ESI 
  201| 0000C5 AC                                        
  201| 0000C6 68                          PUSH   lab4.synchroandop.getb 
  201| 0000C7 00000000                                  
  201| 0000CB 8D7D                        LEA    EDI, [EBP-84] 
  201| 0000CD AC                                        
  201| 0000CE 57                          PUSH   EDI    
  201| 0000CF 8B55                        MOV    EDX, [EBP-116] ; Spill
  201| 0000D1 8C                                        
  201| 0000D2 8B42                        MOV    EAX, [EDX+48] 
  201| 0000D4 30                                        
  201| 0000D5 8B98                        MOV    EBX, [EAX-184] ;  SynchroAndOP
  201| 0000D7 48FFFFFF                                  
  201| 0000DB 53                          PUSH   EBX    
  201| 0000DC E8                          CALL   rts_entryless_protected_subp_call 
  201| 0000DD 00000000                                  
  201| 0000E1 8B0D                        MOV    ECX, package1.h 
  201| 0000E3 00000000                                  
  201| 0000E7 41                          INC    ECX    
  201| 0000E8 894D                        MOV    [EBP-80], ECX 
  201| 0000EA B0                                        
  201| 0000EB 8B35                        MOV    ESI, package1.h 
  201| 0000ED 00000000                                  
  201| 0000F1 D1E6                        SHL    ESI, 1 
  201| 0000F3 8975                        MOV    [EBP-76], ESI 
  201| 0000F5 B4                                        
;  Source Line # 203
  203| 0000F6 8B7D                        MOV    EDI, [EBP-76] 
  203| 0000F8 B4                                        
  203| 0000F9 397D                        CMP    [EBP-80], EDI 
  203| 0000FB B0                                        
  203| 0000FC 0F8F                        JG     L35    
  203| 0000FE 8E000000                                  
  203| 000102 8B45                        MOV    EAX, [EBP-80] 
  203| 000104 B0                                        
  203| 000105 8945                        MOV    [EBP-72], EAX 
  203| 000107 B8                                        
  203|                 L37:                             
;  Source Line # 204
  204| 000108 C745                        MOV    DWORD PTR [EBP-108], 0 ;  Sum1
  204| 00010A 94                                        
  204| 00010B 00000000                                  
  204| 00010F 8B05                        MOV    EAX, package1.n 
  204| 000111 00000000                                  
  204| 000115 8945                        MOV    [EBP-68], EAX 
  204| 000117 BC                                        
;  Source Line # 205
  205| 000118 837D                        CMP    DWORD PTR [EBP-68], 0 
  205| 00011A BC                                        
  205| 00011B 00                                        
  205| 00011C 7E                          JLE    SHORT L38 
  205| 00011D 51                                        
  205| 00011E C745                        MOV    DWORD PTR [EBP-64], 1 
  205| 000120 C0                                        
  205| 000121 01000000                                  
  205|                 L40:                             
;  Source Line # 206
  206| 000125 8B45                        MOV    EAX, [EBP-92] ;  B2
  206| 000127 A4                                        
  206| 000128 8B5D                        MOV    EBX, [EBP-64] 
  206| 00012A C0                                        
  206| 00012B 8B55                        MOV    EDX, [EBP-116] ; Spill
  206| 00012D 8C                                        
  206| 00012E 8B4A                        MOV    ECX, [EDX+48] 
  206| 000130 30                                        
  206| 000131 8BB1                        MOV    ESI, [ECX-252] ;  MZ
  206| 000133 04FFFFFF                                  
  206| 000137 8B7D                        MOV    EDI, [EBP-72] 
  206| 000139 B8                                        
  206| 00013A 8D7F                        LEA    EDI, [EDI-1] 
  206| 00013C FF                                        
  206| 00013D 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
  206| 000140 00000000                                  
  206| 000144 8B55                        MOV    EDX, [EBP-64] 
  206| 000146 C0                                        
  206| 000147 8D1495                      LEA    EDX, [4*EDX-4] 
  206| 00014A FCFFFFFF                                  
  206| 00014E 03FA                        ADD    EDI, EDX 
  206| 000150 8B4498                      MOV    EAX, [EAX+4*EBX-4] 
  206| 000153 FC                                        
  206| 000154 0FAF043E                    IMUL   EAX, [ESI+EDI+0] 
  206| 000158 0345                        ADD    EAX, [EBP-108] ;  Sum1
  206| 00015A 94                                        
  206| 00015B 8945                        MOV    [EBP-108], EAX ;  Sum1
  206| 00015D 94                                        
;  Source Line # 207
  207| 00015E 8B5D                        MOV    EBX, [EBP-68] 
  207| 000160 BC                                        
  207| 000161 395D                        CMP    [EBP-64], EBX 
  207| 000163 C0                                        
  207| 000164 74                          JE     SHORT L38 
  207| 000165 09                                        
  207| 000166 8B45                        MOV    EAX, [EBP-64] 
  207| 000168 C0                                        
  207| 000169 40                          INC    EAX    
  207| 00016A 8945                        MOV    [EBP-64], EAX 
  207| 00016C C0                                        
  207| 00016D EB                          JMP    SHORT L40 
  207| 00016E B6                                        
  207|                 L38:                             
;  Source Line # 208
  208| 00016F 8B45                        MOV    EAX, [EBP-88] ;  C2
  208| 000171 A8                                        
  208| 000172 8B5D                        MOV    EBX, [EBP-72] 
  208| 000174 B8                                        
  208| 000175 8B4D                        MOV    ECX, [EBP-108] ;  Sum1
  208| 000177 94                                        
  208| 000178 894C98                      MOV    [EAX+4*EBX-4], ECX 
  208| 00017B FC                                        
;  Source Line # 209
  209| 00017C 8B55                        MOV    EDX, [EBP-76] 
  209| 00017E B4                                        
  209| 00017F 3955                        CMP    [EBP-72], EDX 
  209| 000181 B8                                        
  209| 000182 74                          JE     SHORT L35 
  209| 000183 0C                                        
  209| 000184 8B45                        MOV    EAX, [EBP-72] 
  209| 000186 B8                                        
  209| 000187 40                          INC    EAX    
  209| 000188 8945                        MOV    [EBP-72], EAX 
  209| 00018A B8                                        
  209| 00018B E9                          JMP    L37    
  209| 00018C 78FFFFFF                                  
  209|                 L35:                             
;  Source Line # 210
  210| 000190 8B45                        MOV    EAX, [EBP-88] ;  C2
  210| 000192 A8                                        
  210| 000193 8945                        MOV    [EBP-60], EAX 
  210| 000195 C4                                        
  210| 000196 68                          PUSH   lab4.synchroandop.setc 
  210| 000197 00000000                                  
  210| 00019B 8D5D                        LEA    EBX, [EBP-60] 
  210| 00019D C4                                        
  210| 00019E 53                          PUSH   EBX    
  210| 00019F 8B55                        MOV    EDX, [EBP-116] ; Spill
  210| 0001A1 8C                                        
  210| 0001A2 8B4A                        MOV    ECX, [EDX+48] 
  210| 0001A4 30                                        
  210| 0001A5 8BB1                        MOV    ESI, [ECX-184] ;  SynchroAndOP
  210| 0001A7 48FFFFFF                                  
  210| 0001AB 56                          PUSH   ESI    
  210| 0001AC E8                          CALL   rts_protected_procedure_call 
  210| 0001AD 00000000                                  
;  Source Line # 212
  212| 0001B1 68                          PUSH   lab4.synchroandop.csignal 
  212| 0001B2 00000000                                  
  212| 0001B6 6A                          PUSH   0      
  212| 0001B7 00                                        
  212| 0001B8 8B55                        MOV    EDX, [EBP-116] ; Spill
  212| 0001BA 8C                                        
  212| 0001BB 8B7A                        MOV    EDI, [EDX+48] 
  212| 0001BD 30                                        
  212| 0001BE 8B87                        MOV    EAX, [EDI-184] ;  SynchroAndOP
  212| 0001C0 48FFFFFF                                  
  212| 0001C4 50                          PUSH   EAX    
  212| 0001C5 E8                          CALL   rts_protected_procedure_call 
  212| 0001C6 00000000                                  
;  Source Line # 214
  214| 0001CA 8B5D                        MOV    EBX, [EBP-96] ;  MO2
  214| 0001CC A0                                        
  214| 0001CD 895D                        MOV    [EBP-56], EBX 
  214| 0001CF C8                                        
  214| 0001D0 68                          PUSH   lab4.synchroandop.getmo 
  214| 0001D1 00000000                                  
  214| 0001D5 8D4D                        LEA    ECX, [EBP-56] 
  214| 0001D7 C8                                        
  214| 0001D8 51                          PUSH   ECX    
  214| 0001D9 8B55                        MOV    EDX, [EBP-116] ; Spill
  214| 0001DB 8C                                        
  214| 0001DC 8B72                        MOV    ESI, [EDX+48] 
  214| 0001DE 30                                        
  214| 0001DF 8BBE                        MOV    EDI, [ESI-184] ;  SynchroAndOP
  214| 0001E1 48FFFFFF                                  
  214| 0001E5 57                          PUSH   EDI    
  214| 0001E6 E8                          CALL   rts_entryless_protected_subp_call 
  214| 0001E7 00000000                                  
  214| 0001EB 8B05                        MOV    EAX, package1.n 
  214| 0001ED 00000000                                  
  214| 0001F1 8945                        MOV    [EBP-52], EAX 
  214| 0001F3 CC                                        
;  Source Line # 216
  216| 0001F4 837D                        CMP    DWORD PTR [EBP-52], 0 
  216| 0001F6 CC                                        
  216| 0001F7 00                                        
  216| 0001F8 0F8E                        JLE    L45    
  216| 0001FA F4000000                                  
  216| 0001FE C745                        MOV    DWORD PTR [EBP-48], 1 
  216| 000200 D0                                        
  216| 000201 01000000                                  
  216|                 L47:                             
  216| 000205 8B05                        MOV    EAX, package1.h 
  216| 000207 00000000                                  
  216| 00020B 40                          INC    EAX    
  216| 00020C 8945                        MOV    [EBP-44], EAX 
  216| 00020E D4                                        
  216| 00020F 8B1D                        MOV    EBX, package1.h 
  216| 000211 00000000                                  
  216| 000215 D1E3                        SHL    EBX, 1 
  216| 000217 895D                        MOV    [EBP-40], EBX 
  216| 000219 D8                                        
;  Source Line # 217
  217| 00021A 8B4D                        MOV    ECX, [EBP-40] 
  217| 00021C D8                                        
  217| 00021D 394D                        CMP    [EBP-44], ECX 
  217| 00021F D4                                        
  217| 000220 0F8F                        JG     L48    
  217| 000222 B8000000                                  
  217| 000226 8B45                        MOV    EAX, [EBP-44] 
  217| 000228 D4                                        
  217| 000229 8945                        MOV    [EBP-36], EAX 
  217| 00022B DC                                        
  217|                 L50:                             
;  Source Line # 218
  218| 00022C C745                        MOV    DWORD PTR [EBP-108], 0 ;  Sum1
  218| 00022E 94                                        
  218| 00022F 00000000                                  
  218| 000233 8B05                        MOV    EAX, package1.n 
  218| 000235 00000000                                  
  218| 000239 8945                        MOV    [EBP-32], EAX 
  218| 00023B E0                                        
;  Source Line # 219
  219| 00023C 837D                        CMP    DWORD PTR [EBP-32], 0 
  219| 00023E E0                                        
  219| 00023F 00                                        
  219| 000240 7E                          JLE    SHORT L51 
  219| 000241 66                                        
  219| 000242 C745                        MOV    DWORD PTR [EBP-28], 1 
  219| 000244 E4                                        
  219| 000245 01000000                                  
  219|                 L53:                             
;  Source Line # 220
  220| 000249 8B55                        MOV    EDX, [EBP-116] ; Spill
  220| 00024B 8C                                        
  220| 00024C 8B42                        MOV    EAX, [EDX+48] 
  220| 00024E 30                                        
  220| 00024F 8B98                        MOV    EBX, [EAX-256] ;  MX
  220| 000251 00FFFFFF                                  
  220| 000255 8B4D                        MOV    ECX, [EBP-28] 
  220| 000257 E4                                        
  220| 000258 8D49                        LEA    ECX, [ECX-1] 
  220| 00025A FF                                        
  220| 00025B 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  220| 00025E 00000000                                  
  220| 000262 8B75                        MOV    ESI, [EBP-36] 
  220| 000264 DC                                        
  220| 000265 8D34B5                      LEA    ESI, [4*ESI-4] 
  220| 000268 FCFFFFFF                                  
  220| 00026C 03CE                        ADD    ECX, ESI 
  220| 00026E 8B7D                        MOV    EDI, [EBP-96] ;  MO2
  220| 000270 A0                                        
  220| 000271 8B55                        MOV    EDX, [EBP-48] 
  220| 000273 D0                                        
  220| 000274 8D52                        LEA    EDX, [EDX-1] 
  220| 000276 FF                                        
  220| 000277 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  220| 00027A 00000000                                  
  220| 00027E 8B45                        MOV    EAX, [EBP-28] 
  220| 000280 E4                                        
  220| 000281 8D0485                      LEA    EAX, [4*EAX-4] 
  220| 000284 FCFFFFFF                                  
  220| 000288 03D0                        ADD    EDX, EAX 
  220| 00028A 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  220| 00028D 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  220| 000291 035D                        ADD    EBX, [EBP-108] ;  Sum1
  220| 000293 94                                        
  220| 000294 895D                        MOV    [EBP-108], EBX ;  Sum1
  220| 000296 94                                        
;  Source Line # 221
  221| 000297 8B75                        MOV    ESI, [EBP-32] 
  221| 000299 E0                                        
  221| 00029A 3975                        CMP    [EBP-28], ESI 
  221| 00029C E4                                        
  221| 00029D 74                          JE     SHORT L51 
  221| 00029E 09                                        
  221| 00029F 8B45                        MOV    EAX, [EBP-28] 
  221| 0002A1 E4                                        
  221| 0002A2 40                          INC    EAX    
  221| 0002A3 8945                        MOV    [EBP-28], EAX 
  221| 0002A5 E4                                        
  221| 0002A6 EB                          JMP    SHORT L53 
  221| 0002A7 A1                                        
  221|                 L51:                             
;  Source Line # 222
  222| 0002A8 8B45                        MOV    EAX, [EBP-100] ;  MC
  222| 0002AA 9C                                        
  222| 0002AB 8B5D                        MOV    EBX, [EBP-48] 
  222| 0002AD D0                                        
  222| 0002AE 8D5B                        LEA    EBX, [EBX-1] 
  222| 0002B0 FF                                        
  222| 0002B1 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  222| 0002B4 00000000                                  
  222| 0002B8 8B4D                        MOV    ECX, [EBP-36] 
  222| 0002BA DC                                        
  222| 0002BB 8D0C8D                      LEA    ECX, [4*ECX-4] 
  222| 0002BE FCFFFFFF                                  
  222| 0002C2 03D9                        ADD    EBX, ECX 
  222| 0002C4 8B55                        MOV    EDX, [EBP-108] ;  Sum1
  222| 0002C6 94                                        
  222| 0002C7 891418                      MOV    [EAX+EBX+0], EDX 
;  Source Line # 223
  223| 0002CA 8B75                        MOV    ESI, [EBP-40] 
  223| 0002CC D8                                        
  223| 0002CD 3975                        CMP    [EBP-36], ESI 
  223| 0002CF DC                                        
  223| 0002D0 74                          JE     SHORT L48 
  223| 0002D1 0C                                        
  223| 0002D2 8B45                        MOV    EAX, [EBP-36] 
  223| 0002D4 DC                                        
  223| 0002D5 40                          INC    EAX    
  223| 0002D6 8945                        MOV    [EBP-36], EAX 
  223| 0002D8 DC                                        
  223| 0002D9 E9                          JMP    L50    
  223| 0002DA 4EFFFFFF                                  
  223|                 L48:                             
;  Source Line # 224
  224| 0002DE 8B45                        MOV    EAX, [EBP-52] 
  224| 0002E0 CC                                        
  224| 0002E1 3945                        CMP    [EBP-48], EAX 
  224| 0002E3 D0                                        
  224| 0002E4 74                          JE     SHORT L45 
  224| 0002E5 0C                                        
  224| 0002E6 8B45                        MOV    EAX, [EBP-48] 
  224| 0002E8 D0                                        
  224| 0002E9 40                          INC    EAX    
  224| 0002EA 8945                        MOV    [EBP-48], EAX 
  224| 0002EC D0                                        
  224| 0002ED E9                          JMP    L47    
  224| 0002EE 13FFFFFF                                  
  224|                 L45:                             
;  Source Line # 226
  226| 0002F2 6A                          PUSH   0      
  226| 0002F3 00                                        
  226| 0002F4 6A                          PUSH   1      
  226| 0002F5 01                                        
  226| 0002F6 6A                          PUSH   0      
  226| 0002F7 00                                        
  226| 0002F8 8B55                        MOV    EDX, [EBP-116] ; Spill
  226| 0002FA 8C                                        
  226| 0002FB 8B42                        MOV    EAX, [EDX+48] 
  226| 0002FD 30                                        
  226| 0002FE 8B98                        MOV    EBX, [EAX-184] ;  SynchroAndOP
  226| 000300 48FFFFFF                                  
  226| 000304 53                          PUSH   EBX    
  226| 000305 E8                          CALL   rts_protected_entry_call 
  226| 000306 00000000                                  
;  Source Line # 228
  228| 00030A 8B4D                        MOV    ECX, [EBP-88] ;  C2
  228| 00030C A8                                        
  228| 00030D 894D                        MOV    [EBP-24], ECX 
  228| 00030F E8                                        
  228| 000310 68                          PUSH   lab4.synchroandop.getc 
  228| 000311 00000000                                  
  228| 000315 8D75                        LEA    ESI, [EBP-24] 
  228| 000317 E8                                        
  228| 000318 56                          PUSH   ESI    
  228| 000319 8B55                        MOV    EDX, [EBP-116] ; Spill
  228| 00031B 8C                                        
  228| 00031C 8B7A                        MOV    EDI, [EDX+48] 
  228| 00031E 30                                        
  228| 00031F 8B87                        MOV    EAX, [EDI-184] ;  SynchroAndOP
  228| 000321 48FFFFFF                                  
  228| 000325 50                          PUSH   EAX    
  228| 000326 E8                          CALL   rts_entryless_protected_subp_call 
  228| 000327 00000000                                  
  228| 00032B 8B1D                        MOV    EBX, package1.h 
  228| 00032D 00000000                                  
  228| 000331 43                          INC    EBX    
  228| 000332 895D                        MOV    [EBP-20], EBX 
  228| 000334 EC                                        
  228| 000335 8B0D                        MOV    ECX, package1.h 
  228| 000337 00000000                                  
  228| 00033B D1E1                        SHL    ECX, 1 
  228| 00033D 894D                        MOV    [EBP-16], ECX 
  228| 00033F F0                                        
;  Source Line # 230
  230| 000340 8B75                        MOV    ESI, [EBP-16] 
  230| 000342 F0                                        
  230| 000343 3975                        CMP    [EBP-20], ESI 
  230| 000345 EC                                        
  230| 000346 0F8F                        JG     L60    
  230| 000348 8E000000                                  
  230| 00034C 8B45                        MOV    EAX, [EBP-20] 
  230| 00034E EC                                        
  230| 00034F 8945                        MOV    [EBP-12], EAX 
  230| 000351 F4                                        
  230|                 L62:                             
;  Source Line # 231
  231| 000352 C745                        MOV    DWORD PTR [EBP-108], 0 ;  Sum1
  231| 000354 94                                        
  231| 000355 00000000                                  
  231| 000359 8B05                        MOV    EAX, package1.n 
  231| 00035B 00000000                                  
  231| 00035F 8945                        MOV    [EBP-8], EAX 
  231| 000361 F8                                        
;  Source Line # 232
  232| 000362 837D                        CMP    DWORD PTR [EBP-8], 0 
  232| 000364 F8                                        
  232| 000365 00                                        
  232| 000366 7E                          JLE    SHORT L63 
  232| 000367 48                                        
  232| 000368 C745                        MOV    DWORD PTR [EBP-4], 1 
  232| 00036A FC                                        
  232| 00036B 01000000                                  
  232|                 L65:                             
;  Source Line # 233
  233| 00036F 8B45                        MOV    EAX, [EBP-88] ;  C2
  233| 000371 A8                                        
  233| 000372 8B5D                        MOV    EBX, [EBP-4] 
  233| 000374 FC                                        
  233| 000375 8B4D                        MOV    ECX, [EBP-100] ;  MC
  233| 000377 9C                                        
  233| 000378 8B55                        MOV    EDX, [EBP-4] 
  233| 00037A FC                                        
  233| 00037B 8D52                        LEA    EDX, [EDX-1] 
  233| 00037D FF                                        
  233| 00037E 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  233| 000381 00000000                                  
  233| 000385 8B75                        MOV    ESI, [EBP-12] 
  233| 000387 F4                                        
  233| 000388 8D34B5                      LEA    ESI, [4*ESI-4] 
  233| 00038B FCFFFFFF                                  
  233| 00038F 03D6                        ADD    EDX, ESI 
  233| 000391 8B7C98                      MOV    EDI, [EAX+4*EBX-4] 
  233| 000394 FC                                        
  233| 000395 0FAF3C11                    IMUL   EDI, [ECX+EDX+0] 
  233| 000399 037D                        ADD    EDI, [EBP-108] ;  Sum1
  233| 00039B 94                                        
  233| 00039C 897D                        MOV    [EBP-108], EDI ;  Sum1
  233| 00039E 94                                        
;  Source Line # 234
  234| 00039F 8B45                        MOV    EAX, [EBP-8] 
  234| 0003A1 F8                                        
  234| 0003A2 3945                        CMP    [EBP-4], EAX 
  234| 0003A4 FC                                        
  234| 0003A5 74                          JE     SHORT L63 
  234| 0003A6 09                                        
  234| 0003A7 8B45                        MOV    EAX, [EBP-4] 
  234| 0003A9 FC                                        
  234| 0003AA 40                          INC    EAX    
  234| 0003AB 8945                        MOV    [EBP-4], EAX 
  234| 0003AD FC                                        
  234| 0003AE EB                          JMP    SHORT L65 
  234| 0003AF BF                                        
  234|                 L63:                             
;  Source Line # 235
  235| 0003B0 8B55                        MOV    EDX, [EBP-116] ; Spill
  235| 0003B2 8C                                        
  235| 0003B3 8B42                        MOV    EAX, [EDX+48] 
  235| 0003B5 30                                        
  235| 0003B6 8B98                        MOV    EBX, [EAX-248] ;  A
  235| 0003B8 08FFFFFF                                  
  235| 0003BC 8B4D                        MOV    ECX, [EBP-12] 
  235| 0003BE F4                                        
  235| 0003BF 8B75                        MOV    ESI, [EBP-108] ;  Sum1
  235| 0003C1 94                                        
  235| 0003C2 89748B                      MOV    [EBX+4*ECX-4], ESI 
  235| 0003C5 FC                                        
;  Source Line # 236
  236| 0003C6 8B7D                        MOV    EDI, [EBP-16] 
  236| 0003C8 F0                                        
  236| 0003C9 397D                        CMP    [EBP-12], EDI 
  236| 0003CB F4                                        
  236| 0003CC 74                          JE     SHORT L60 
  236| 0003CD 0C                                        
  236| 0003CE 8B45                        MOV    EAX, [EBP-12] 
  236| 0003D0 F4                                        
  236| 0003D1 40                          INC    EAX    
  236| 0003D2 8945                        MOV    [EBP-12], EAX 
  236| 0003D4 F4                                        
  236| 0003D5 E9                          JMP    L62    
  236| 0003D6 78FFFFFF                                  
  236|                 L60:                             
;  Source Line # 238
  238| 0003DA 68                          PUSH   lab4.synchroandop.endsignal 
  238| 0003DB 00000000                                  
  238| 0003DF 6A                          PUSH   0      
  238| 0003E0 00                                        
  238| 0003E1 8B55                        MOV    EDX, [EBP-116] ; Spill
  238| 0003E3 8C                                        
  238| 0003E4 8B42                        MOV    EAX, [EDX+48] 
  238| 0003E6 30                                        
  238| 0003E7 8B98                        MOV    EBX, [EAX-184] ;  SynchroAndOP
  238| 0003E9 48FFFFFF                                  
  238| 0003ED 53                          PUSH   EBX    
  238| 0003EE E8                          CALL   rts_protected_procedure_call 
  238| 0003EF 00000000                                  
;  Source Line # 240
  240| 0003F3 68                          PUSH   __lcl.00000257 
  240| 0003F4 00000000                                  
  240| 0003F8 68                          PUSH   __lcl.00000256 
  240| 0003F9 00000000                                  
  240| 0003FD E8                          CALL   ada.text_io.put_line__2 
  240| 0003FE 00000000                                  
  240| 000402 8D4D                        LEA    ECX, [EBP-104] ;  dyn_temp
  240| 000404 98                                        
  240| 000405 51                          PUSH   ECX    
  240| 000406 E8                          CALL   rts_ss_release 
  240| 000407 00000000                                  
;  Source Line # 241
  241| 00040B 8BE5                        MOV    ESP, EBP 
  241| 00040D 5D                          POP    EBP    
  241| 00040E C2                          RET    4      
  241| 00040F 0400                                      
                       ;                                
                       lab4.t2__body      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000375     DD     00002701 
                                          DD     000000BF 
                                          DD     lab4.t2__body 
                                          DD     __lcl.00000389 
                                          DD     000000C1 
                                          DD     lab4.t2__body+00000010H 
                                          DD     __lcl.00000389 
                                          DD     000000C2 
                                          DD     lab4.t2__body+0000005AH 
                                          DD     __lcl.00000389 
                                          DD     000000C3 
                                          DD     lab4.t2__body+00000094H 
                                          DD     __lcl.00000389 
                                          DD     000000C4 
                                          DD     lab4.t2__body+00000099H 
                                          DD     __lcl.00000389 
                                          DD     000000C7 
                                          DD     lab4.t2__body+000000A8H 
                                          DD     __lcl.00000389 
                                          DD     000000C9 
                                          DD     lab4.t2__body+000000C0H 
                                          DD     __lcl.00000389 
                                          DD     000000CB 
                                          DD     lab4.t2__body+000000F6H 
                                          DD     __lcl.00000389 
                                          DD     000000CC 
                                          DD     lab4.t2__body+00000108H 
                                          DD     __lcl.00000389 
                                          DD     000000CD 
                                          DD     lab4.t2__body+00000118H 
                                          DD     __lcl.00000389 
                                          DD     000000CE 
                                          DD     lab4.t2__body+00000125H 
                                          DD     __lcl.00000389 
                                          DD     000000CF 
                                          DD     lab4.t2__body+0000015EH 
                                          DD     __lcl.00000389 
                                          DD     000000D0 
                                          DD     lab4.t2__body+0000016FH 
                                          DD     __lcl.00000389 
                                          DD     000000D1 
                                          DD     lab4.t2__body+0000017CH 
                                          DD     __lcl.00000389 
                                          DD     000000D2 
                                          DD     lab4.t2__body+00000190H 
                                          DD     __lcl.00000389 
                                          DD     000000D4 
                                          DD     lab4.t2__body+000001B1H 
                                          DD     __lcl.00000389 
                                          DD     000000D6 
                                          DD     lab4.t2__body+000001CAH 
                                          DD     __lcl.00000389 
                                          DD     000000D8 
                                          DD     lab4.t2__body+000001F4H 
                                          DD     __lcl.00000389 
                                          DD     000000D9 
                                          DD     lab4.t2__body+0000021AH 
                                          DD     __lcl.00000389 
                                          DD     000000DA 
                                          DD     lab4.t2__body+0000022CH 
                                          DD     __lcl.00000389 
                                          DD     000000DB 
                                          DD     lab4.t2__body+0000023CH 
                                          DD     __lcl.00000389 
                                          DD     000000DC 
                                          DD     lab4.t2__body+00000249H 
                                          DD     __lcl.00000389 
                                          DD     000000DD 
                                          DD     lab4.t2__body+00000297H 
                                          DD     __lcl.00000389 
                                          DD     000000DE 
                                          DD     lab4.t2__body+000002A8H 
                                          DD     __lcl.00000389 
                                          DD     000000DF 
                                          DD     lab4.t2__body+000002CAH 
                                          DD     __lcl.00000389 
                                          DD     000000E0 
                                          DD     lab4.t2__body+000002DEH 
                                          DD     __lcl.00000389 
                                          DD     000000E2 
                                          DD     lab4.t2__body+000002F2H 
                                          DD     __lcl.00000389 
                                          DD     000000E4 
                                          DD     lab4.t2__body+0000030AH 
                                          DD     __lcl.00000389 
                                          DD     000000E6 
                                          DD     lab4.t2__body+00000340H 
                                          DD     __lcl.00000389 
                                          DD     000000E7 
                                          DD     lab4.t2__body+00000352H 
                                          DD     __lcl.00000389 
                                          DD     000000E8 
                                          DD     lab4.t2__body+00000362H 
                                          DD     __lcl.00000389 
                                          DD     000000E9 
                                          DD     lab4.t2__body+0000036FH 
                                          DD     __lcl.00000389 
                                          DD     000000EA 
                                          DD     lab4.t2__body+0000039FH 
                                          DD     __lcl.00000389 
                                          DD     000000EB 
                                          DD     lab4.t2__body+000003B0H 
                                          DD     __lcl.00000389 
                                          DD     000000EC 
                                          DD     lab4.t2__body+000003C6H 
                                          DD     __lcl.00000389 
                                          DD     000000EE 
                                          DD     lab4.t2__body+000003DAH 
                                          DD     __lcl.00000389 
                                          DD     000000F0 
                                          DD     lab4.t2__body+000003F3H 
                                          DD     __lcl.00000389 
                                          DD     000000F1 
                                          DD     lab4.t2__body+0000040BH 
                                          DD     __lcl.00000389 
                                          DD     000000F1 
                                          DD     lab4.t2__body+0000040DH 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 472

                       ;                                
                       ;  Start of procedure lab4.t3__body   
                       ;                                
                                          PUBLIC lab4.t3__body 
                       lab4.t3__body      PROC   NEAR   
;  Source Line # 244
  244| 000000 64                          FS:           
  244| 000001 8B15                        MOV    EDX, 4 
  244| 000003 04000000                                  
  244| 000007 8B52                        MOV    EDX, [EDX-4] 
  244| 000009 FC                                        
  244| 00000A 55                          PUSH   EBP    
  244| 00000B 8BEC                        MOV    EBP, ESP 
  244| 00000D 83EC                        SUB    ESP, 116 
  244| 00000F 74                                        
;  Source Line # 246
  246| 000010 8B02                        MOV    EAX, [EDX+0] 
  246| 000012 8945                        MOV    [EBP-104], EAX ;  dyn_temp
  246| 000014 98                                        
  246| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  246| 000017 00000000                                  
  246| 00001B 83EB                        SUB    EBX, 1 
  246| 00001D 01                                        
  246| 00001E 7D                          JGE    SHORT L70 
  246| 00001F 03                                        
  246| 000020 33DB                        XOR    EBX, EBX 
  246| 000022 4B                          DEC    EBX    
  246|                 L70:                             
  246| 000023 CE                          INTO          
  246| 000024 43                          INC    EBX    
  246| 000025 CE                          INTO          
  246| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  246| 000029 00000000                                  
  246| 00002D 53                          PUSH   EBX    
  246| 00002E 8955                        MOV    [EBP-116], EDX ; Spill
  246| 000030 8C                                        
  246| 000031 E8                          CALL   rts_ss_allocate 
  246| 000032 00000000                                  
  246| 000036 8945                        MOV    [EBP-100], EAX ;  MC
  246| 000038 9C                                        
  246| 000039 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
  246| 00003B 00000000                                  
  246| 00003F 83E9                        SUB    ECX, 1 
  246| 000041 01                                        
  246| 000042 7D                          JGE    SHORT L71 
  246| 000043 03                                        
  246| 000044 33C9                        XOR    ECX, ECX 
  246| 000046 49                          DEC    ECX    
  246|                 L71:                             
  246| 000047 CE                          INTO          
  246| 000048 41                          INC    ECX    
  246| 000049 CE                          INTO          
  246| 00004A 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  246| 00004D 00000000                                  
  246| 000051 51                          PUSH   ECX    
  246| 000052 E8                          CALL   rts_ss_allocate 
  246| 000053 00000000                                  
  246| 000057 8945                        MOV    [EBP-96], EAX ;  MO3
  246| 000059 A0                                        
;  Source Line # 247
  247| 00005A 8B35                        MOV    ESI, package1.vec__constrained_array____1 
  247| 00005C 00000000                                  
  247| 000060 83EE                        SUB    ESI, 1 
  247| 000062 01                                        
  247| 000063 7D                          JGE    SHORT L72 
  247| 000064 03                                        
  247| 000065 33F6                        XOR    ESI, ESI 
  247| 000067 4E                          DEC    ESI    
  247|                 L72:                             
  247| 000068 CE                          INTO          
  247| 000069 46                          INC    ESI    
  247| 00006A CE                          INTO          
  247| 00006B C1E6                        SHL    ESI, 2 
  247| 00006D 02                                        
  247| 00006E 56                          PUSH   ESI    
  247| 00006F E8                          CALL   rts_ss_allocate 
  247| 000070 00000000                                  
  247| 000074 8945                        MOV    [EBP-92], EAX ;  B3
  247| 000076 A4                                        
  247| 000077 8B3D                        MOV    EDI, package1.vec__constrained_array____1 
  247| 000079 00000000                                  
  247| 00007D 83EF                        SUB    EDI, 1 
  247| 00007F 01                                        
  247| 000080 7D                          JGE    SHORT L73 
  247| 000081 03                                        
  247| 000082 33FF                        XOR    EDI, EDI 
  247| 000084 4F                          DEC    EDI    
  247|                 L73:                             
  247| 000085 CE                          INTO          
  247| 000086 47                          INC    EDI    
  247| 000087 CE                          INTO          
  247| 000088 C1E7                        SHL    EDI, 2 
  247| 00008A 02                                        
  247| 00008B 57                          PUSH   EDI    
  247| 00008C E8                          CALL   rts_ss_allocate 
  247| 00008D 00000000                                  
  247| 000091 8945                        MOV    [EBP-88], EAX ;  C3
  247| 000093 A8                                        
;  Source Line # 248
  248| 000094 E8                          CALL   rts_activation_succeeded 
  248| 000095 00000000                                  
;  Source Line # 249
  249| 000099 68                          PUSH   __lcl.00000264 
  249| 00009A 00000000                                  
  249| 00009E 68                          PUSH   __lcl.00000263 
  249| 00009F 00000000                                  
  249| 0000A3 E8                          CALL   ada.text_io.put_line__2 
  249| 0000A4 00000000                                  
;  Source Line # 252
  252| 0000A8 8B55                        MOV    EDX, [EBP-116] ; Spill
  252| 0000AA 8C                                        
  252| 0000AB 8B5A                        MOV    EBX, [EDX+48] 
  252| 0000AD 30                                        
  252| 0000AE 8B8B                        MOV    ECX, [EBX-252] ;  MZ
  252| 0000B0 04FFFFFF                                  
  252| 0000B4 51                          PUSH   ECX    
  252| 0000B5 E8                          CALL   package1.matr_input 
  252| 0000B6 00000000                                  
;  Source Line # 254
  254| 0000BA 68                          PUSH   lab4.synchroandop.input 
  254| 0000BB 00000000                                  
  254| 0000BF 6A                          PUSH   0      
  254| 0000C0 00                                        
  254| 0000C1 8B55                        MOV    EDX, [EBP-116] ; Spill
  254| 0000C3 8C                                        
  254| 0000C4 8B72                        MOV    ESI, [EDX+48] 
  254| 0000C6 30                                        
  254| 0000C7 8BBE                        MOV    EDI, [ESI-184] ;  SynchroAndOP
  254| 0000C9 48FFFFFF                                  
  254| 0000CD 57                          PUSH   EDI    
  254| 0000CE E8                          CALL   rts_protected_procedure_call 
  254| 0000CF 00000000                                  
;  Source Line # 256
  256| 0000D3 6A                          PUSH   0      
  256| 0000D4 00                                        
  256| 0000D5 6A                          PUSH   0      
  256| 0000D6 00                                        
  256| 0000D7 6A                          PUSH   0      
  256| 0000D8 00                                        
  256| 0000D9 8B55                        MOV    EDX, [EBP-116] ; Spill
  256| 0000DB 8C                                        
  256| 0000DC 8B42                        MOV    EAX, [EDX+48] 
  256| 0000DE 30                                        
  256| 0000DF 8B98                        MOV    EBX, [EAX-184] ;  SynchroAndOP
  256| 0000E1 48FFFFFF                                  
  256| 0000E5 53                          PUSH   EBX    
  256| 0000E6 E8                          CALL   rts_protected_entry_call 
  256| 0000E7 00000000                                  
;  Source Line # 258
  258| 0000EB 8B4D                        MOV    ECX, [EBP-92] ;  B3
  258| 0000ED A4                                        
  258| 0000EE 894D                        MOV    [EBP-84], ECX 
  258| 0000F0 AC                                        
  258| 0000F1 68                          PUSH   lab4.synchroandop.getb 
  258| 0000F2 00000000                                  
  258| 0000F6 8D75                        LEA    ESI, [EBP-84] 
  258| 0000F8 AC                                        
  258| 0000F9 56                          PUSH   ESI    
  258| 0000FA 8B55                        MOV    EDX, [EBP-116] ; Spill
  258| 0000FC 8C                                        
  258| 0000FD 8B7A                        MOV    EDI, [EDX+48] 
  258| 0000FF 30                                        
  258| 000100 8B87                        MOV    EAX, [EDI-184] ;  SynchroAndOP
  258| 000102 48FFFFFF                                  
  258| 000106 50                          PUSH   EAX    
  258| 000107 E8                          CALL   rts_entryless_protected_subp_call 
  258| 000108 00000000                                  
  258| 00010C 8B1D                        MOV    EBX, package1.h 
  258| 00010E 00000000                                  
  258| 000112 D1E3                        SHL    EBX, 1 
  258| 000114 43                          INC    EBX    
  258| 000115 895D                        MOV    [EBP-80], EBX 
  258| 000117 B0                                        
  258| 000118 8B0D                        MOV    ECX, package1.h 
  258| 00011A 00000000                                  
  258| 00011E 8D0C49                      LEA    ECX, [ECX+2*ECX+0] 
  258| 000121 894D                        MOV    [EBP-76], ECX 
  258| 000123 B4                                        
;  Source Line # 260
  260| 000124 8B75                        MOV    ESI, [EBP-76] 
  260| 000126 B4                                        
  260| 000127 3975                        CMP    [EBP-80], ESI 
  260| 000129 B0                                        
  260| 00012A 0F8F                        JG     L35    
  260| 00012C 8E000000                                  
  260| 000130 8B45                        MOV    EAX, [EBP-80] 
  260| 000132 B0                                        
  260| 000133 8945                        MOV    [EBP-72], EAX 
  260| 000135 B8                                        
  260|                 L37:                             
;  Source Line # 261
  261| 000136 C745                        MOV    DWORD PTR [EBP-108], 0 ;  Sum1
  261| 000138 94                                        
  261| 000139 00000000                                  
  261| 00013D 8B05                        MOV    EAX, package1.n 
  261| 00013F 00000000                                  
  261| 000143 8945                        MOV    [EBP-68], EAX 
  261| 000145 BC                                        
;  Source Line # 262
  262| 000146 837D                        CMP    DWORD PTR [EBP-68], 0 
  262| 000148 BC                                        
  262| 000149 00                                        
  262| 00014A 7E                          JLE    SHORT L38 
  262| 00014B 51                                        
  262| 00014C C745                        MOV    DWORD PTR [EBP-64], 1 
  262| 00014E C0                                        
  262| 00014F 01000000                                  
  262|                 L40:                             
;  Source Line # 263
  263| 000153 8B45                        MOV    EAX, [EBP-92] ;  B3
  263| 000155 A4                                        
  263| 000156 8B5D                        MOV    EBX, [EBP-64] 
  263| 000158 C0                                        
  263| 000159 8B55                        MOV    EDX, [EBP-116] ; Spill
  263| 00015B 8C                                        
  263| 00015C 8B4A                        MOV    ECX, [EDX+48] 
  263| 00015E 30                                        
  263| 00015F 8BB1                        MOV    ESI, [ECX-252] ;  MZ
  263| 000161 04FFFFFF                                  
  263| 000165 8B7D                        MOV    EDI, [EBP-72] 
  263| 000167 B8                                        
  263| 000168 8D7F                        LEA    EDI, [EDI-1] 
  263| 00016A FF                                        
  263| 00016B 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
  263| 00016E 00000000                                  
  263| 000172 8B55                        MOV    EDX, [EBP-64] 
  263| 000174 C0                                        
  263| 000175 8D1495                      LEA    EDX, [4*EDX-4] 
  263| 000178 FCFFFFFF                                  
  263| 00017C 03FA                        ADD    EDI, EDX 
  263| 00017E 8B4498                      MOV    EAX, [EAX+4*EBX-4] 
  263| 000181 FC                                        
  263| 000182 0FAF043E                    IMUL   EAX, [ESI+EDI+0] 
  263| 000186 0345                        ADD    EAX, [EBP-108] ;  Sum1
  263| 000188 94                                        
  263| 000189 8945                        MOV    [EBP-108], EAX ;  Sum1
  263| 00018B 94                                        
;  Source Line # 264
  264| 00018C 8B5D                        MOV    EBX, [EBP-68] 
  264| 00018E BC                                        
  264| 00018F 395D                        CMP    [EBP-64], EBX 
  264| 000191 C0                                        
  264| 000192 74                          JE     SHORT L38 
  264| 000193 09                                        
  264| 000194 8B45                        MOV    EAX, [EBP-64] 
  264| 000196 C0                                        
  264| 000197 40                          INC    EAX    
  264| 000198 8945                        MOV    [EBP-64], EAX 
  264| 00019A C0                                        
  264| 00019B EB                          JMP    SHORT L40 
  264| 00019C B6                                        
  264|                 L38:                             
;  Source Line # 265
  265| 00019D 8B45                        MOV    EAX, [EBP-88] ;  C3
  265| 00019F A8                                        
  265| 0001A0 8B5D                        MOV    EBX, [EBP-72] 
  265| 0001A2 B8                                        
  265| 0001A3 8B4D                        MOV    ECX, [EBP-108] ;  Sum1
  265| 0001A5 94                                        
  265| 0001A6 894C98                      MOV    [EAX+4*EBX-4], ECX 
  265| 0001A9 FC                                        
;  Source Line # 266
  266| 0001AA 8B55                        MOV    EDX, [EBP-76] 
  266| 0001AC B4                                        
  266| 0001AD 3955                        CMP    [EBP-72], EDX 
  266| 0001AF B8                                        
  266| 0001B0 74                          JE     SHORT L35 
  266| 0001B1 0C                                        
  266| 0001B2 8B45                        MOV    EAX, [EBP-72] 
  266| 0001B4 B8                                        
  266| 0001B5 40                          INC    EAX    
  266| 0001B6 8945                        MOV    [EBP-72], EAX 
  266| 0001B8 B8                                        
  266| 0001B9 E9                          JMP    L37    
  266| 0001BA 78FFFFFF                                  
  266|                 L35:                             
;  Source Line # 267
  267| 0001BE 8B45                        MOV    EAX, [EBP-88] ;  C3
  267| 0001C0 A8                                        
  267| 0001C1 8945                        MOV    [EBP-60], EAX 
  267| 0001C3 C4                                        
  267| 0001C4 68                          PUSH   lab4.synchroandop.setc 
  267| 0001C5 00000000                                  
  267| 0001C9 8D5D                        LEA    EBX, [EBP-60] 
  267| 0001CB C4                                        
  267| 0001CC 53                          PUSH   EBX    
  267| 0001CD 8B55                        MOV    EDX, [EBP-116] ; Spill
  267| 0001CF 8C                                        
  267| 0001D0 8B4A                        MOV    ECX, [EDX+48] 
  267| 0001D2 30                                        
  267| 0001D3 8BB1                        MOV    ESI, [ECX-184] ;  SynchroAndOP
  267| 0001D5 48FFFFFF                                  
  267| 0001D9 56                          PUSH   ESI    
  267| 0001DA E8                          CALL   rts_protected_procedure_call 
  267| 0001DB 00000000                                  
;  Source Line # 269
  269| 0001DF 68                          PUSH   lab4.synchroandop.csignal 
  269| 0001E0 00000000                                  
  269| 0001E4 6A                          PUSH   0      
  269| 0001E5 00                                        
  269| 0001E6 8B55                        MOV    EDX, [EBP-116] ; Spill
  269| 0001E8 8C                                        
  269| 0001E9 8B7A                        MOV    EDI, [EDX+48] 
  269| 0001EB 30                                        
  269| 0001EC 8B87                        MOV    EAX, [EDI-184] ;  SynchroAndOP
  269| 0001EE 48FFFFFF                                  
  269| 0001F2 50                          PUSH   EAX    
  269| 0001F3 E8                          CALL   rts_protected_procedure_call 
  269| 0001F4 00000000                                  
;  Source Line # 271
  271| 0001F8 8B5D                        MOV    EBX, [EBP-96] ;  MO3
  271| 0001FA A0                                        
  271| 0001FB 895D                        MOV    [EBP-56], EBX 
  271| 0001FD C8                                        
  271| 0001FE 68                          PUSH   lab4.synchroandop.getmo 
  271| 0001FF 00000000                                  
  271| 000203 8D4D                        LEA    ECX, [EBP-56] 
  271| 000205 C8                                        
  271| 000206 51                          PUSH   ECX    
  271| 000207 8B55                        MOV    EDX, [EBP-116] ; Spill
  271| 000209 8C                                        
  271| 00020A 8B72                        MOV    ESI, [EDX+48] 
  271| 00020C 30                                        
  271| 00020D 8BBE                        MOV    EDI, [ESI-184] ;  SynchroAndOP
  271| 00020F 48FFFFFF                                  
  271| 000213 57                          PUSH   EDI    
  271| 000214 E8                          CALL   rts_entryless_protected_subp_call 
  271| 000215 00000000                                  
  271| 000219 8B05                        MOV    EAX, package1.n 
  271| 00021B 00000000                                  
  271| 00021F 8945                        MOV    [EBP-52], EAX 
  271| 000221 CC                                        
;  Source Line # 273
  273| 000222 837D                        CMP    DWORD PTR [EBP-52], 0 
  273| 000224 CC                                        
  273| 000225 00                                        
  273| 000226 0F8E                        JLE    L45    
  273| 000228 F7000000                                  
  273| 00022C C745                        MOV    DWORD PTR [EBP-48], 1 
  273| 00022E D0                                        
  273| 00022F 01000000                                  
  273|                 L47:                             
  273| 000233 8B05                        MOV    EAX, package1.h 
  273| 000235 00000000                                  
  273| 000239 D1E0                        SHL    EAX, 1 
  273| 00023B 40                          INC    EAX    
  273| 00023C 8945                        MOV    [EBP-44], EAX 
  273| 00023E D4                                        
  273| 00023F 8B1D                        MOV    EBX, package1.h 
  273| 000241 00000000                                  
  273| 000245 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
  273| 000248 895D                        MOV    [EBP-40], EBX 
  273| 00024A D8                                        
;  Source Line # 274
  274| 00024B 8B4D                        MOV    ECX, [EBP-40] 
  274| 00024D D8                                        
  274| 00024E 394D                        CMP    [EBP-44], ECX 
  274| 000250 D4                                        
  274| 000251 0F8F                        JG     L48    
  274| 000253 B8000000                                  
  274| 000257 8B45                        MOV    EAX, [EBP-44] 
  274| 000259 D4                                        
  274| 00025A 8945                        MOV    [EBP-36], EAX 
  274| 00025C DC                                        
  274|                 L50:                             
;  Source Line # 275
  275| 00025D C745                        MOV    DWORD PTR [EBP-108], 0 ;  Sum1
  275| 00025F 94                                        
  275| 000260 00000000                                  
  275| 000264 8B05                        MOV    EAX, package1.n 
  275| 000266 00000000                                  
  275| 00026A 8945                        MOV    [EBP-32], EAX 
  275| 00026C E0                                        
;  Source Line # 276
  276| 00026D 837D                        CMP    DWORD PTR [EBP-32], 0 
  276| 00026F E0                                        
  276| 000270 00                                        
  276| 000271 7E                          JLE    SHORT L51 
  276| 000272 66                                        
  276| 000273 C745                        MOV    DWORD PTR [EBP-28], 1 
  276| 000275 E4                                        
  276| 000276 01000000                                  
  276|                 L53:                             
;  Source Line # 277
  277| 00027A 8B55                        MOV    EDX, [EBP-116] ; Spill
  277| 00027C 8C                                        
  277| 00027D 8B42                        MOV    EAX, [EDX+48] 
  277| 00027F 30                                        
  277| 000280 8B98                        MOV    EBX, [EAX-256] ;  MX
  277| 000282 00FFFFFF                                  
  277| 000286 8B4D                        MOV    ECX, [EBP-28] 
  277| 000288 E4                                        
  277| 000289 8D49                        LEA    ECX, [ECX-1] 
  277| 00028B FF                                        
  277| 00028C 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  277| 00028F 00000000                                  
  277| 000293 8B75                        MOV    ESI, [EBP-36] 
  277| 000295 DC                                        
  277| 000296 8D34B5                      LEA    ESI, [4*ESI-4] 
  277| 000299 FCFFFFFF                                  
  277| 00029D 03CE                        ADD    ECX, ESI 
  277| 00029F 8B7D                        MOV    EDI, [EBP-96] ;  MO3
  277| 0002A1 A0                                        
  277| 0002A2 8B55                        MOV    EDX, [EBP-48] 
  277| 0002A4 D0                                        
  277| 0002A5 8D52                        LEA    EDX, [EDX-1] 
  277| 0002A7 FF                                        
  277| 0002A8 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  277| 0002AB 00000000                                  
  277| 0002AF 8B45                        MOV    EAX, [EBP-28] 
  277| 0002B1 E4                                        
  277| 0002B2 8D0485                      LEA    EAX, [4*EAX-4] 
  277| 0002B5 FCFFFFFF                                  
  277| 0002B9 03D0                        ADD    EDX, EAX 
  277| 0002BB 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  277| 0002BE 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  277| 0002C2 035D                        ADD    EBX, [EBP-108] ;  Sum1
  277| 0002C4 94                                        
  277| 0002C5 895D                        MOV    [EBP-108], EBX ;  Sum1
  277| 0002C7 94                                        
;  Source Line # 278
  278| 0002C8 8B75                        MOV    ESI, [EBP-32] 
  278| 0002CA E0                                        
  278| 0002CB 3975                        CMP    [EBP-28], ESI 
  278| 0002CD E4                                        
  278| 0002CE 74                          JE     SHORT L51 
  278| 0002CF 09                                        
  278| 0002D0 8B45                        MOV    EAX, [EBP-28] 
  278| 0002D2 E4                                        
  278| 0002D3 40                          INC    EAX    
  278| 0002D4 8945                        MOV    [EBP-28], EAX 
  278| 0002D6 E4                                        
  278| 0002D7 EB                          JMP    SHORT L53 
  278| 0002D8 A1                                        
  278|                 L51:                             
;  Source Line # 279
  279| 0002D9 8B45                        MOV    EAX, [EBP-100] ;  MC
  279| 0002DB 9C                                        
  279| 0002DC 8B5D                        MOV    EBX, [EBP-48] 
  279| 0002DE D0                                        
  279| 0002DF 8D5B                        LEA    EBX, [EBX-1] 
  279| 0002E1 FF                                        
  279| 0002E2 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  279| 0002E5 00000000                                  
  279| 0002E9 8B4D                        MOV    ECX, [EBP-36] 
  279| 0002EB DC                                        
  279| 0002EC 8D0C8D                      LEA    ECX, [4*ECX-4] 
  279| 0002EF FCFFFFFF                                  
  279| 0002F3 03D9                        ADD    EBX, ECX 
  279| 0002F5 8B55                        MOV    EDX, [EBP-108] ;  Sum1
  279| 0002F7 94                                        
  279| 0002F8 891418                      MOV    [EAX+EBX+0], EDX 
;  Source Line # 280
  280| 0002FB 8B75                        MOV    ESI, [EBP-40] 
  280| 0002FD D8                                        
  280| 0002FE 3975                        CMP    [EBP-36], ESI 
  280| 000300 DC                                        
  280| 000301 74                          JE     SHORT L48 
  280| 000302 0C                                        
  280| 000303 8B45                        MOV    EAX, [EBP-36] 
  280| 000305 DC                                        
  280| 000306 40                          INC    EAX    
  280| 000307 8945                        MOV    [EBP-36], EAX 
  280| 000309 DC                                        
  280| 00030A E9                          JMP    L50    
  280| 00030B 4EFFFFFF                                  
  280|                 L48:                             
;  Source Line # 281
  281| 00030F 8B45                        MOV    EAX, [EBP-52] 
  281| 000311 CC                                        
  281| 000312 3945                        CMP    [EBP-48], EAX 
  281| 000314 D0                                        
  281| 000315 74                          JE     SHORT L45 
  281| 000316 0C                                        
  281| 000317 8B45                        MOV    EAX, [EBP-48] 
  281| 000319 D0                                        
  281| 00031A 40                          INC    EAX    
  281| 00031B 8945                        MOV    [EBP-48], EAX 
  281| 00031D D0                                        
  281| 00031E E9                          JMP    L47    
  281| 00031F 10FFFFFF                                  
  281|                 L45:                             
;  Source Line # 283
  283| 000323 6A                          PUSH   0      
  283| 000324 00                                        
  283| 000325 6A                          PUSH   1      
  283| 000326 01                                        
  283| 000327 6A                          PUSH   0      
  283| 000328 00                                        
  283| 000329 8B55                        MOV    EDX, [EBP-116] ; Spill
  283| 00032B 8C                                        
  283| 00032C 8B42                        MOV    EAX, [EDX+48] 
  283| 00032E 30                                        
  283| 00032F 8B98                        MOV    EBX, [EAX-184] ;  SynchroAndOP
  283| 000331 48FFFFFF                                  
  283| 000335 53                          PUSH   EBX    
  283| 000336 E8                          CALL   rts_protected_entry_call 
  283| 000337 00000000                                  
;  Source Line # 285
  285| 00033B 8B4D                        MOV    ECX, [EBP-88] ;  C3
  285| 00033D A8                                        
  285| 00033E 894D                        MOV    [EBP-24], ECX 
  285| 000340 E8                                        
  285| 000341 68                          PUSH   lab4.synchroandop.getc 
  285| 000342 00000000                                  
  285| 000346 8D75                        LEA    ESI, [EBP-24] 
  285| 000348 E8                                        
  285| 000349 56                          PUSH   ESI    
  285| 00034A 8B55                        MOV    EDX, [EBP-116] ; Spill
  285| 00034C 8C                                        
  285| 00034D 8B7A                        MOV    EDI, [EDX+48] 
  285| 00034F 30                                        
  285| 000350 8B87                        MOV    EAX, [EDI-184] ;  SynchroAndOP
  285| 000352 48FFFFFF                                  
  285| 000356 50                          PUSH   EAX    
  285| 000357 E8                          CALL   rts_entryless_protected_subp_call 
  285| 000358 00000000                                  
  285| 00035C 8B1D                        MOV    EBX, package1.h 
  285| 00035E 00000000                                  
  285| 000362 D1E3                        SHL    EBX, 1 
  285| 000364 43                          INC    EBX    
  285| 000365 895D                        MOV    [EBP-20], EBX 
  285| 000367 EC                                        
  285| 000368 8B0D                        MOV    ECX, package1.h 
  285| 00036A 00000000                                  
  285| 00036E 8D0C49                      LEA    ECX, [ECX+2*ECX+0] 
  285| 000371 894D                        MOV    [EBP-16], ECX 
  285| 000373 F0                                        
;  Source Line # 287
  287| 000374 8B75                        MOV    ESI, [EBP-16] 
  287| 000376 F0                                        
  287| 000377 3975                        CMP    [EBP-20], ESI 
  287| 000379 EC                                        
  287| 00037A 0F8F                        JG     L60    
  287| 00037C 8E000000                                  
  287| 000380 8B45                        MOV    EAX, [EBP-20] 
  287| 000382 EC                                        
  287| 000383 8945                        MOV    [EBP-12], EAX 
  287| 000385 F4                                        
  287|                 L62:                             
;  Source Line # 288
  288| 000386 C745                        MOV    DWORD PTR [EBP-108], 0 ;  Sum1
  288| 000388 94                                        
  288| 000389 00000000                                  
  288| 00038D 8B05                        MOV    EAX, package1.n 
  288| 00038F 00000000                                  
  288| 000393 8945                        MOV    [EBP-8], EAX 
  288| 000395 F8                                        
;  Source Line # 289
  289| 000396 837D                        CMP    DWORD PTR [EBP-8], 0 
  289| 000398 F8                                        
  289| 000399 00                                        
  289| 00039A 7E                          JLE    SHORT L63 
  289| 00039B 48                                        
  289| 00039C C745                        MOV    DWORD PTR [EBP-4], 1 
  289| 00039E FC                                        
  289| 00039F 01000000                                  
  289|                 L65:                             
;  Source Line # 290
  290| 0003A3 8B45                        MOV    EAX, [EBP-88] ;  C3
  290| 0003A5 A8                                        
  290| 0003A6 8B5D                        MOV    EBX, [EBP-4] 
  290| 0003A8 FC                                        
  290| 0003A9 8B4D                        MOV    ECX, [EBP-100] ;  MC
  290| 0003AB 9C                                        
  290| 0003AC 8B55                        MOV    EDX, [EBP-4] 
  290| 0003AE FC                                        
  290| 0003AF 8D52                        LEA    EDX, [EDX-1] 
  290| 0003B1 FF                                        
  290| 0003B2 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  290| 0003B5 00000000                                  
  290| 0003B9 8B75                        MOV    ESI, [EBP-12] 
  290| 0003BB F4                                        
  290| 0003BC 8D34B5                      LEA    ESI, [4*ESI-4] 
  290| 0003BF FCFFFFFF                                  
  290| 0003C3 03D6                        ADD    EDX, ESI 
  290| 0003C5 8B7C98                      MOV    EDI, [EAX+4*EBX-4] 
  290| 0003C8 FC                                        
  290| 0003C9 0FAF3C11                    IMUL   EDI, [ECX+EDX+0] 
  290| 0003CD 037D                        ADD    EDI, [EBP-108] ;  Sum1
  290| 0003CF 94                                        
  290| 0003D0 897D                        MOV    [EBP-108], EDI ;  Sum1
  290| 0003D2 94                                        
;  Source Line # 291
  291| 0003D3 8B45                        MOV    EAX, [EBP-8] 
  291| 0003D5 F8                                        
  291| 0003D6 3945                        CMP    [EBP-4], EAX 
  291| 0003D8 FC                                        
  291| 0003D9 74                          JE     SHORT L63 
  291| 0003DA 09                                        
  291| 0003DB 8B45                        MOV    EAX, [EBP-4] 
  291| 0003DD FC                                        
  291| 0003DE 40                          INC    EAX    
  291| 0003DF 8945                        MOV    [EBP-4], EAX 
  291| 0003E1 FC                                        
  291| 0003E2 EB                          JMP    SHORT L65 
  291| 0003E3 BF                                        
  291|                 L63:                             
;  Source Line # 292
  292| 0003E4 8B55                        MOV    EDX, [EBP-116] ; Spill
  292| 0003E6 8C                                        
  292| 0003E7 8B42                        MOV    EAX, [EDX+48] 
  292| 0003E9 30                                        
  292| 0003EA 8B98                        MOV    EBX, [EAX-248] ;  A
  292| 0003EC 08FFFFFF                                  
  292| 0003F0 8B4D                        MOV    ECX, [EBP-12] 
  292| 0003F2 F4                                        
  292| 0003F3 8B75                        MOV    ESI, [EBP-108] ;  Sum1
  292| 0003F5 94                                        
  292| 0003F6 89748B                      MOV    [EBX+4*ECX-4], ESI 
  292| 0003F9 FC                                        
;  Source Line # 293
  293| 0003FA 8B7D                        MOV    EDI, [EBP-16] 
  293| 0003FC F0                                        
  293| 0003FD 397D                        CMP    [EBP-12], EDI 
  293| 0003FF F4                                        
  293| 000400 74                          JE     SHORT L60 
  293| 000401 0C                                        
  293| 000402 8B45                        MOV    EAX, [EBP-12] 
  293| 000404 F4                                        
  293| 000405 40                          INC    EAX    
  293| 000406 8945                        MOV    [EBP-12], EAX 
  293| 000408 F4                                        
  293| 000409 E9                          JMP    L62    
  293| 00040A 78FFFFFF                                  
  293|                 L60:                             
;  Source Line # 295
  295| 00040E 68                          PUSH   lab4.synchroandop.endsignal 
  295| 00040F 00000000                                  
  295| 000413 6A                          PUSH   0      
  295| 000414 00                                        
  295| 000415 8B55                        MOV    EDX, [EBP-116] ; Spill
  295| 000417 8C                                        
  295| 000418 8B42                        MOV    EAX, [EDX+48] 
  295| 00041A 30                                        
  295| 00041B 8B98                        MOV    EBX, [EAX-184] ;  SynchroAndOP
  295| 00041D 48FFFFFF                                  
  295| 000421 53                          PUSH   EBX    
  295| 000422 E8                          CALL   rts_protected_procedure_call 
  295| 000423 00000000                                  
;  Source Line # 296
  296| 000427 68                          PUSH   __lcl.00000305 
  296| 000428 00000000                                  
  296| 00042C 68                          PUSH   __lcl.00000304 
  296| 00042D 00000000                                  
  296| 000431 E8                          CALL   ada.text_io.put_line__2 
  296| 000432 00000000                                  
  296| 000436 8D4D                        LEA    ECX, [EBP-104] ;  dyn_temp
  296| 000438 98                                        
  296| 000439 51                          PUSH   ECX    
  296| 00043A E8                          CALL   rts_ss_release 
  296| 00043B 00000000                                  
;  Source Line # 297
  297| 00043F 8BE5                        MOV    ESP, EBP 
  297| 000441 5D                          POP    EBP    
  297| 000442 C2                          RET    4      
  297| 000443 0400                                      
                       ;                                
                       lab4.t3__body      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000374     DD     00002901 
                                          DD     000000F4 
                                          DD     lab4.t3__body 
                                          DD     __lcl.00000389 
                                          DD     000000F6 
                                          DD     lab4.t3__body+00000010H 
                                          DD     __lcl.00000389 
                                          DD     000000F7 
                                          DD     lab4.t3__body+0000005AH 
                                          DD     __lcl.00000389 
                                          DD     000000F8 
                                          DD     lab4.t3__body+00000094H 
                                          DD     __lcl.00000389 
                                          DD     000000F9 
                                          DD     lab4.t3__body+00000099H 
                                          DD     __lcl.00000389 
                                          DD     000000FC 
                                          DD     lab4.t3__body+000000A8H 
                                          DD     __lcl.00000389 
                                          DD     000000FE 
                                          DD     lab4.t3__body+000000BAH 
                                          DD     __lcl.00000389 
                                          DD     00000100 
                                          DD     lab4.t3__body+000000D3H 
                                          DD     __lcl.00000389 
                                          DD     00000102 
                                          DD     lab4.t3__body+000000EBH 
                                          DD     __lcl.00000389 
                                          DD     00000104 
                                          DD     lab4.t3__body+00000124H 
                                          DD     __lcl.00000389 
                                          DD     00000105 
                                          DD     lab4.t3__body+00000136H 
                                          DD     __lcl.00000389 
                                          DD     00000106 
                                          DD     lab4.t3__body+00000146H 
                                          DD     __lcl.00000389 
                                          DD     00000107 
                                          DD     lab4.t3__body+00000153H 
                                          DD     __lcl.00000389 
                                          DD     00000108 
                                          DD     lab4.t3__body+0000018CH 
                                          DD     __lcl.00000389 
                                          DD     00000109 
                                          DD     lab4.t3__body+0000019DH 
                                          DD     __lcl.00000389 
                                          DD     0000010A 
                                          DD     lab4.t3__body+000001AAH 
                                          DD     __lcl.00000389 
                                          DD     0000010B 
                                          DD     lab4.t3__body+000001BEH 
                                          DD     __lcl.00000389 
                                          DD     0000010D 
                                          DD     lab4.t3__body+000001DFH 
                                          DD     __lcl.00000389 
                                          DD     0000010F 
                                          DD     lab4.t3__body+000001F8H 
                                          DD     __lcl.00000389 
                                          DD     00000111 
                                          DD     lab4.t3__body+00000222H 
                                          DD     __lcl.00000389 
                                          DD     00000112 
                                          DD     lab4.t3__body+0000024BH 
                                          DD     __lcl.00000389 
                                          DD     00000113 
                                          DD     lab4.t3__body+0000025DH 
                                          DD     __lcl.00000389 
                                          DD     00000114 
                                          DD     lab4.t3__body+0000026DH 
                                          DD     __lcl.00000389 
                                          DD     00000115 
                                          DD     lab4.t3__body+0000027AH 
                                          DD     __lcl.00000389 
                                          DD     00000116 
                                          DD     lab4.t3__body+000002C8H 
                                          DD     __lcl.00000389 
                                          DD     00000117 
                                          DD     lab4.t3__body+000002D9H 
                                          DD     __lcl.00000389 
                                          DD     00000118 
                                          DD     lab4.t3__body+000002FBH 
                                          DD     __lcl.00000389 
                                          DD     00000119 
                                          DD     lab4.t3__body+0000030FH 
                                          DD     __lcl.00000389 
                                          DD     0000011B 
                                          DD     lab4.t3__body+00000323H 
                                          DD     __lcl.00000389 
                                          DD     0000011D 
                                          DD     lab4.t3__body+0000033BH 
                                          DD     __lcl.00000389 
                                          DD     0000011F 
                                          DD     lab4.t3__body+00000374H 
                                          DD     __lcl.00000389 
                                          DD     00000120 
                                          DD     lab4.t3__body+00000386H 
                                          DD     __lcl.00000389 
                                          DD     00000121 
                                          DD     lab4.t3__body+00000396H 
                                          DD     __lcl.00000389 
                                          DD     00000122 
                                          DD     lab4.t3__body+000003A3H 
                                          DD     __lcl.00000389 
                                          DD     00000123 
                                          DD     lab4.t3__body+000003D3H 
                                          DD     __lcl.00000389 
                                          DD     00000124 
                                          DD     lab4.t3__body+000003E4H 
                                          DD     __lcl.00000389 
                                          DD     00000125 
                                          DD     lab4.t3__body+000003FAH 
                                          DD     __lcl.00000389 
                                          DD     00000127 
                                          DD     lab4.t3__body+0000040EH 
                                          DD     __lcl.00000389 
                                          DD     00000128 
                                          DD     lab4.t3__body+00000427H 
                                          DD     __lcl.00000389 
                                          DD     00000129 
                                          DD     lab4.t3__body+0000043FH 
                                          DD     __lcl.00000389 
                                          DD     00000129 
                                          DD     lab4.t3__body+00000441H 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 496

                       ;                                
                       ;  Start of procedure lab4.t4__body   
                       ;                                
                                          PUBLIC lab4.t4__body 
                       lab4.t4__body      PROC   NEAR   
;  Source Line # 300
  300| 000000 64                          FS:           
  300| 000001 8B15                        MOV    EDX, 4 
  300| 000003 04000000                                  
  300| 000007 8B52                        MOV    EDX, [EDX-4] 
  300| 000009 FC                                        
  300| 00000A 55                          PUSH   EBP    
  300| 00000B 8BEC                        MOV    EBP, ESP 
  300| 00000D 83EC                        SUB    ESP, 124 
  300| 00000F 7C                                        
;  Source Line # 302
  302| 000010 8B02                        MOV    EAX, [EDX+0] 
  302| 000012 8945                        MOV    [EBP-112], EAX ;  dyn_temp
  302| 000014 90                                        
  302| 000015 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
  302| 000017 00000000                                  
  302| 00001B 83EB                        SUB    EBX, 1 
  302| 00001D 01                                        
  302| 00001E 7D                          JGE    SHORT L70 
  302| 00001F 03                                        
  302| 000020 33DB                        XOR    EBX, EBX 
  302| 000022 4B                          DEC    EBX    
  302|                 L70:                             
  302| 000023 CE                          INTO          
  302| 000024 43                          INC    EBX    
  302| 000025 CE                          INTO          
  302| 000026 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  302| 000029 00000000                                  
  302| 00002D 53                          PUSH   EBX    
  302| 00002E 8955                        MOV    [EBP-124], EDX ; Spill
  302| 000030 84                                        
  302| 000031 E8                          CALL   rts_ss_allocate 
  302| 000032 00000000                                  
  302| 000036 8945                        MOV    [EBP-108], EAX ;  MC
  302| 000038 94                                        
  302| 000039 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
  302| 00003B 00000000                                  
  302| 00003F 83E9                        SUB    ECX, 1 
  302| 000041 01                                        
  302| 000042 7D                          JGE    SHORT L71 
  302| 000043 03                                        
  302| 000044 33C9                        XOR    ECX, ECX 
  302| 000046 49                          DEC    ECX    
  302|                 L71:                             
  302| 000047 CE                          INTO          
  302| 000048 41                          INC    ECX    
  302| 000049 CE                          INTO          
  302| 00004A 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  302| 00004D 00000000                                  
  302| 000051 51                          PUSH   ECX    
  302| 000052 E8                          CALL   rts_ss_allocate 
  302| 000053 00000000                                  
  302| 000057 8945                        MOV    [EBP-104], EAX ;  MO4
  302| 000059 98                                        
;  Source Line # 303
  303| 00005A 8B35                        MOV    ESI, package1.vec__constrained_array____1 
  303| 00005C 00000000                                  
  303| 000060 83EE                        SUB    ESI, 1 
  303| 000062 01                                        
  303| 000063 7D                          JGE    SHORT L72 
  303| 000064 03                                        
  303| 000065 33F6                        XOR    ESI, ESI 
  303| 000067 4E                          DEC    ESI    
  303|                 L72:                             
  303| 000068 CE                          INTO          
  303| 000069 46                          INC    ESI    
  303| 00006A CE                          INTO          
  303| 00006B C1E6                        SHL    ESI, 2 
  303| 00006D 02                                        
  303| 00006E 56                          PUSH   ESI    
  303| 00006F E8                          CALL   rts_ss_allocate 
  303| 000070 00000000                                  
  303| 000074 8945                        MOV    [EBP-100], EAX ;  B4
  303| 000076 9C                                        
  303| 000077 8B3D                        MOV    EDI, package1.vec__constrained_array____1 
  303| 000079 00000000                                  
  303| 00007D 83EF                        SUB    EDI, 1 
  303| 00007F 01                                        
  303| 000080 7D                          JGE    SHORT L73 
  303| 000081 03                                        
  303| 000082 33FF                        XOR    EDI, EDI 
  303| 000084 4F                          DEC    EDI    
  303|                 L73:                             
  303| 000085 CE                          INTO          
  303| 000086 47                          INC    EDI    
  303| 000087 CE                          INTO          
  303| 000088 C1E7                        SHL    EDI, 2 
  303| 00008A 02                                        
  303| 00008B 57                          PUSH   EDI    
  303| 00008C E8                          CALL   rts_ss_allocate 
  303| 00008D 00000000                                  
  303| 000091 8945                        MOV    [EBP-96], EAX ;  C4
  303| 000093 A0                                        
;  Source Line # 304
  304| 000094 E8                          CALL   rts_activation_succeeded 
  304| 000095 00000000                                  
;  Source Line # 305
  305| 000099 68                          PUSH   __lcl.00000312 
  305| 00009A 00000000                                  
  305| 00009E 68                          PUSH   __lcl.00000311 
  305| 00009F 00000000                                  
  305| 0000A3 E8                          CALL   ada.text_io.put_line__2 
  305| 0000A4 00000000                                  
;  Source Line # 308
  308| 0000A8 8B55                        MOV    EDX, [EBP-104] ;  MO4
  308| 0000AA 98                                        
  308| 0000AB 52                          PUSH   EDX    
  308| 0000AC E8                          CALL   package1.matr_input 
  308| 0000AD 00000000                                  
;  Source Line # 309
  309| 0000B1 8B5D                        MOV    EBX, [EBP-100] ;  B4
  309| 0000B3 9C                                        
  309| 0000B4 53                          PUSH   EBX    
  309| 0000B5 E8                          CALL   package1.vec_input 
  309| 0000B6 00000000                                  
;  Source Line # 310
  310| 0000BA 8B4D                        MOV    ECX, [EBP-100] ;  B4
  310| 0000BC 9C                                        
  310| 0000BD 894D                        MOV    [EBP-92], ECX 
  310| 0000BF A4                                        
  310| 0000C0 68                          PUSH   lab4.synchroandop.setb 
  310| 0000C1 00000000                                  
  310| 0000C5 8D75                        LEA    ESI, [EBP-92] 
  310| 0000C7 A4                                        
  310| 0000C8 56                          PUSH   ESI    
  310| 0000C9 8B55                        MOV    EDX, [EBP-124] ; Spill
  310| 0000CB 84                                        
  310| 0000CC 8B7A                        MOV    EDI, [EDX+48] 
  310| 0000CE 30                                        
  310| 0000CF 8B87                        MOV    EAX, [EDI-184] ;  SynchroAndOP
  310| 0000D1 48FFFFFF                                  
  310| 0000D5 50                          PUSH   EAX    
  310| 0000D6 E8                          CALL   rts_protected_procedure_call 
  310| 0000D7 00000000                                  
;  Source Line # 311
  311| 0000DB 8B5D                        MOV    EBX, [EBP-104] ;  MO4
  311| 0000DD 98                                        
  311| 0000DE 895D                        MOV    [EBP-88], EBX 
  311| 0000E0 A8                                        
  311| 0000E1 68                          PUSH   lab4.synchroandop.setmo 
  311| 0000E2 00000000                                  
  311| 0000E6 8D4D                        LEA    ECX, [EBP-88] 
  311| 0000E8 A8                                        
  311| 0000E9 51                          PUSH   ECX    
  311| 0000EA 8B55                        MOV    EDX, [EBP-124] ; Spill
  311| 0000EC 84                                        
  311| 0000ED 8B72                        MOV    ESI, [EDX+48] 
  311| 0000EF 30                                        
  311| 0000F0 8BBE                        MOV    EDI, [ESI-184] ;  SynchroAndOP
  311| 0000F2 48FFFFFF                                  
  311| 0000F6 57                          PUSH   EDI    
  311| 0000F7 E8                          CALL   rts_protected_procedure_call 
  311| 0000F8 00000000                                  
;  Source Line # 313
  313| 0000FC 68                          PUSH   lab4.synchroandop.input 
  313| 0000FD 00000000                                  
  313| 000101 6A                          PUSH   0      
  313| 000102 00                                        
  313| 000103 8B55                        MOV    EDX, [EBP-124] ; Spill
  313| 000105 84                                        
  313| 000106 8B42                        MOV    EAX, [EDX+48] 
  313| 000108 30                                        
  313| 000109 8B98                        MOV    EBX, [EAX-184] ;  SynchroAndOP
  313| 00010B 48FFFFFF                                  
  313| 00010F 53                          PUSH   EBX    
  313| 000110 E8                          CALL   rts_protected_procedure_call 
  313| 000111 00000000                                  
;  Source Line # 315
  315| 000115 6A                          PUSH   0      
  315| 000116 00                                        
  315| 000117 6A                          PUSH   0      
  315| 000118 00                                        
  315| 000119 6A                          PUSH   0      
  315| 00011A 00                                        
  315| 00011B 8B55                        MOV    EDX, [EBP-124] ; Spill
  315| 00011D 84                                        
  315| 00011E 8B4A                        MOV    ECX, [EDX+48] 
  315| 000120 30                                        
  315| 000121 8BB1                        MOV    ESI, [ECX-184] ;  SynchroAndOP
  315| 000123 48FFFFFF                                  
  315| 000127 56                          PUSH   ESI    
  315| 000128 E8                          CALL   rts_protected_entry_call 
  315| 000129 00000000                                  
;  Source Line # 317
  317| 00012D 8B7D                        MOV    EDI, [EBP-100] ;  B4
  317| 00012F 9C                                        
  317| 000130 897D                        MOV    [EBP-84], EDI 
  317| 000132 AC                                        
  317| 000133 68                          PUSH   lab4.synchroandop.getb 
  317| 000134 00000000                                  
  317| 000138 8D45                        LEA    EAX, [EBP-84] 
  317| 00013A AC                                        
  317| 00013B 50                          PUSH   EAX    
  317| 00013C 8B55                        MOV    EDX, [EBP-124] ; Spill
  317| 00013E 84                                        
  317| 00013F 8B5A                        MOV    EBX, [EDX+48] 
  317| 000141 30                                        
  317| 000142 8B8B                        MOV    ECX, [EBX-184] ;  SynchroAndOP
  317| 000144 48FFFFFF                                  
  317| 000148 51                          PUSH   ECX    
  317| 000149 E8                          CALL   rts_entryless_protected_subp_call 
  317| 00014A 00000000                                  
  317| 00014E 8B35                        MOV    ESI, package1.h 
  317| 000150 00000000                                  
  317| 000154 8D3476                      LEA    ESI, [ESI+2*ESI+0] 
  317| 000157 46                          INC    ESI    
  317| 000158 8975                        MOV    [EBP-80], ESI 
  317| 00015A B0                                        
  317| 00015B 8B3D                        MOV    EDI, package1.n 
  317| 00015D 00000000                                  
  317| 000161 897D                        MOV    [EBP-76], EDI 
  317| 000163 B4                                        
;  Source Line # 319
  319| 000164 8B45                        MOV    EAX, [EBP-76] 
  319| 000166 B4                                        
  319| 000167 3945                        CMP    [EBP-80], EAX 
  319| 000169 B0                                        
  319| 00016A 0F8F                        JG     L35    
  319| 00016C 8E000000                                  
  319| 000170 8B45                        MOV    EAX, [EBP-80] 
  319| 000172 B0                                        
  319| 000173 8945                        MOV    [EBP-72], EAX 
  319| 000175 B8                                        
  319|                 L37:                             
;  Source Line # 320
  320| 000176 C745                        MOV    DWORD PTR [EBP-116], 0 ;  Sum1
  320| 000178 8C                                        
  320| 000179 00000000                                  
  320| 00017D 8B05                        MOV    EAX, package1.n 
  320| 00017F 00000000                                  
  320| 000183 8945                        MOV    [EBP-68], EAX 
  320| 000185 BC                                        
;  Source Line # 321
  321| 000186 837D                        CMP    DWORD PTR [EBP-68], 0 
  321| 000188 BC                                        
  321| 000189 00                                        
  321| 00018A 7E                          JLE    SHORT L38 
  321| 00018B 51                                        
  321| 00018C C745                        MOV    DWORD PTR [EBP-64], 1 
  321| 00018E C0                                        
  321| 00018F 01000000                                  
  321|                 L40:                             
;  Source Line # 322
  322| 000193 8B45                        MOV    EAX, [EBP-100] ;  B4
  322| 000195 9C                                        
  322| 000196 8B5D                        MOV    EBX, [EBP-64] 
  322| 000198 C0                                        
  322| 000199 8B55                        MOV    EDX, [EBP-124] ; Spill
  322| 00019B 84                                        
  322| 00019C 8B4A                        MOV    ECX, [EDX+48] 
  322| 00019E 30                                        
  322| 00019F 8BB1                        MOV    ESI, [ECX-252] ;  MZ
  322| 0001A1 04FFFFFF                                  
  322| 0001A5 8B7D                        MOV    EDI, [EBP-72] 
  322| 0001A7 B8                                        
  322| 0001A8 8D7F                        LEA    EDI, [EDI-1] 
  322| 0001AA FF                                        
  322| 0001AB 0FAF3D                      IMUL   EDI, package1.matr__COMP_SU_SIZE 
  322| 0001AE 00000000                                  
  322| 0001B2 8B55                        MOV    EDX, [EBP-64] 
  322| 0001B4 C0                                        
  322| 0001B5 8D1495                      LEA    EDX, [4*EDX-4] 
  322| 0001B8 FCFFFFFF                                  
  322| 0001BC 03FA                        ADD    EDI, EDX 
  322| 0001BE 8B4498                      MOV    EAX, [EAX+4*EBX-4] 
  322| 0001C1 FC                                        
  322| 0001C2 0FAF043E                    IMUL   EAX, [ESI+EDI+0] 
  322| 0001C6 0345                        ADD    EAX, [EBP-116] ;  Sum1
  322| 0001C8 8C                                        
  322| 0001C9 8945                        MOV    [EBP-116], EAX ;  Sum1
  322| 0001CB 8C                                        
;  Source Line # 323
  323| 0001CC 8B5D                        MOV    EBX, [EBP-68] 
  323| 0001CE BC                                        
  323| 0001CF 395D                        CMP    [EBP-64], EBX 
  323| 0001D1 C0                                        
  323| 0001D2 74                          JE     SHORT L38 
  323| 0001D3 09                                        
  323| 0001D4 8B45                        MOV    EAX, [EBP-64] 
  323| 0001D6 C0                                        
  323| 0001D7 40                          INC    EAX    
  323| 0001D8 8945                        MOV    [EBP-64], EAX 
  323| 0001DA C0                                        
  323| 0001DB EB                          JMP    SHORT L40 
  323| 0001DC B6                                        
  323|                 L38:                             
;  Source Line # 324
  324| 0001DD 8B45                        MOV    EAX, [EBP-96] ;  C4
  324| 0001DF A0                                        
  324| 0001E0 8B5D                        MOV    EBX, [EBP-72] 
  324| 0001E2 B8                                        
  324| 0001E3 8B4D                        MOV    ECX, [EBP-116] ;  Sum1
  324| 0001E5 8C                                        
  324| 0001E6 894C98                      MOV    [EAX+4*EBX-4], ECX 
  324| 0001E9 FC                                        
;  Source Line # 325
  325| 0001EA 8B55                        MOV    EDX, [EBP-76] 
  325| 0001EC B4                                        
  325| 0001ED 3955                        CMP    [EBP-72], EDX 
  325| 0001EF B8                                        
  325| 0001F0 74                          JE     SHORT L35 
  325| 0001F1 0C                                        
  325| 0001F2 8B45                        MOV    EAX, [EBP-72] 
  325| 0001F4 B8                                        
  325| 0001F5 40                          INC    EAX    
  325| 0001F6 8945                        MOV    [EBP-72], EAX 
  325| 0001F8 B8                                        
  325| 0001F9 E9                          JMP    L37    
  325| 0001FA 78FFFFFF                                  
  325|                 L35:                             
;  Source Line # 326
  326| 0001FE 8B45                        MOV    EAX, [EBP-96] ;  C4
  326| 000200 A0                                        
  326| 000201 8945                        MOV    [EBP-60], EAX 
  326| 000203 C4                                        
  326| 000204 68                          PUSH   lab4.synchroandop.setc 
  326| 000205 00000000                                  
  326| 000209 8D5D                        LEA    EBX, [EBP-60] 
  326| 00020B C4                                        
  326| 00020C 53                          PUSH   EBX    
  326| 00020D 8B55                        MOV    EDX, [EBP-124] ; Spill
  326| 00020F 84                                        
  326| 000210 8B4A                        MOV    ECX, [EDX+48] 
  326| 000212 30                                        
  326| 000213 8BB1                        MOV    ESI, [ECX-184] ;  SynchroAndOP
  326| 000215 48FFFFFF                                  
  326| 000219 56                          PUSH   ESI    
  326| 00021A E8                          CALL   rts_protected_procedure_call 
  326| 00021B 00000000                                  
;  Source Line # 328
  328| 00021F 68                          PUSH   lab4.synchroandop.csignal 
  328| 000220 00000000                                  
  328| 000224 6A                          PUSH   0      
  328| 000225 00                                        
  328| 000226 8B55                        MOV    EDX, [EBP-124] ; Spill
  328| 000228 84                                        
  328| 000229 8B7A                        MOV    EDI, [EDX+48] 
  328| 00022B 30                                        
  328| 00022C 8B87                        MOV    EAX, [EDI-184] ;  SynchroAndOP
  328| 00022E 48FFFFFF                                  
  328| 000232 50                          PUSH   EAX    
  328| 000233 E8                          CALL   rts_protected_procedure_call 
  328| 000234 00000000                                  
;  Source Line # 330
  330| 000238 8B5D                        MOV    EBX, [EBP-104] ;  MO4
  330| 00023A 98                                        
  330| 00023B 895D                        MOV    [EBP-56], EBX 
  330| 00023D C8                                        
  330| 00023E 68                          PUSH   lab4.synchroandop.getmo 
  330| 00023F 00000000                                  
  330| 000243 8D4D                        LEA    ECX, [EBP-56] 
  330| 000245 C8                                        
  330| 000246 51                          PUSH   ECX    
  330| 000247 8B55                        MOV    EDX, [EBP-124] ; Spill
  330| 000249 84                                        
  330| 00024A 8B72                        MOV    ESI, [EDX+48] 
  330| 00024C 30                                        
  330| 00024D 8BBE                        MOV    EDI, [ESI-184] ;  SynchroAndOP
  330| 00024F 48FFFFFF                                  
  330| 000253 57                          PUSH   EDI    
  330| 000254 E8                          CALL   rts_entryless_protected_subp_call 
  330| 000255 00000000                                  
  330| 000259 8B05                        MOV    EAX, package1.n 
  330| 00025B 00000000                                  
  330| 00025F 8945                        MOV    [EBP-52], EAX 
  330| 000261 CC                                        
;  Source Line # 332
  332| 000262 837D                        CMP    DWORD PTR [EBP-52], 0 
  332| 000264 CC                                        
  332| 000265 00                                        
  332| 000266 0F8E                        JLE    L45    
  332| 000268 F5000000                                  
  332| 00026C C745                        MOV    DWORD PTR [EBP-48], 1 
  332| 00026E D0                                        
  332| 00026F 01000000                                  
  332|                 L47:                             
  332| 000273 8B05                        MOV    EAX, package1.h 
  332| 000275 00000000                                  
  332| 000279 8D0440                      LEA    EAX, [EAX+2*EAX+0] 
  332| 00027C 40                          INC    EAX    
  332| 00027D 8945                        MOV    [EBP-44], EAX 
  332| 00027F D4                                        
  332| 000280 8B1D                        MOV    EBX, package1.n 
  332| 000282 00000000                                  
  332| 000286 895D                        MOV    [EBP-40], EBX 
  332| 000288 D8                                        
;  Source Line # 333
  333| 000289 8B4D                        MOV    ECX, [EBP-40] 
  333| 00028B D8                                        
  333| 00028C 394D                        CMP    [EBP-44], ECX 
  333| 00028E D4                                        
  333| 00028F 0F8F                        JG     L48    
  333| 000291 B8000000                                  
  333| 000295 8B45                        MOV    EAX, [EBP-44] 
  333| 000297 D4                                        
  333| 000298 8945                        MOV    [EBP-36], EAX 
  333| 00029A DC                                        
  333|                 L50:                             
;  Source Line # 334
  334| 00029B C745                        MOV    DWORD PTR [EBP-116], 0 ;  Sum1
  334| 00029D 8C                                        
  334| 00029E 00000000                                  
  334| 0002A2 8B05                        MOV    EAX, package1.n 
  334| 0002A4 00000000                                  
  334| 0002A8 8945                        MOV    [EBP-32], EAX 
  334| 0002AA E0                                        
;  Source Line # 335
  335| 0002AB 837D                        CMP    DWORD PTR [EBP-32], 0 
  335| 0002AD E0                                        
  335| 0002AE 00                                        
  335| 0002AF 7E                          JLE    SHORT L51 
  335| 0002B0 66                                        
  335| 0002B1 C745                        MOV    DWORD PTR [EBP-28], 1 
  335| 0002B3 E4                                        
  335| 0002B4 01000000                                  
  335|                 L53:                             
;  Source Line # 336
  336| 0002B8 8B55                        MOV    EDX, [EBP-124] ; Spill
  336| 0002BA 84                                        
  336| 0002BB 8B42                        MOV    EAX, [EDX+48] 
  336| 0002BD 30                                        
  336| 0002BE 8B98                        MOV    EBX, [EAX-256] ;  MX
  336| 0002C0 00FFFFFF                                  
  336| 0002C4 8B4D                        MOV    ECX, [EBP-28] 
  336| 0002C6 E4                                        
  336| 0002C7 8D49                        LEA    ECX, [ECX-1] 
  336| 0002C9 FF                                        
  336| 0002CA 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
  336| 0002CD 00000000                                  
  336| 0002D1 8B75                        MOV    ESI, [EBP-36] 
  336| 0002D3 DC                                        
  336| 0002D4 8D34B5                      LEA    ESI, [4*ESI-4] 
  336| 0002D7 FCFFFFFF                                  
  336| 0002DB 03CE                        ADD    ECX, ESI 
  336| 0002DD 8B7D                        MOV    EDI, [EBP-104] ;  MO4
  336| 0002DF 98                                        
  336| 0002E0 8B55                        MOV    EDX, [EBP-48] 
  336| 0002E2 D0                                        
  336| 0002E3 8D52                        LEA    EDX, [EDX-1] 
  336| 0002E5 FF                                        
  336| 0002E6 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  336| 0002E9 00000000                                  
  336| 0002ED 8B45                        MOV    EAX, [EBP-28] 
  336| 0002EF E4                                        
  336| 0002F0 8D0485                      LEA    EAX, [4*EAX-4] 
  336| 0002F3 FCFFFFFF                                  
  336| 0002F7 03D0                        ADD    EDX, EAX 
  336| 0002F9 8B1C0B                      MOV    EBX, [EBX+ECX+0] 
  336| 0002FC 0FAF1C17                    IMUL   EBX, [EDI+EDX+0] 
  336| 000300 035D                        ADD    EBX, [EBP-116] ;  Sum1
  336| 000302 8C                                        
  336| 000303 895D                        MOV    [EBP-116], EBX ;  Sum1
  336| 000305 8C                                        
;  Source Line # 337
  337| 000306 8B75                        MOV    ESI, [EBP-32] 
  337| 000308 E0                                        
  337| 000309 3975                        CMP    [EBP-28], ESI 
  337| 00030B E4                                        
  337| 00030C 74                          JE     SHORT L51 
  337| 00030D 09                                        
  337| 00030E 8B45                        MOV    EAX, [EBP-28] 
  337| 000310 E4                                        
  337| 000311 40                          INC    EAX    
  337| 000312 8945                        MOV    [EBP-28], EAX 
  337| 000314 E4                                        
  337| 000315 EB                          JMP    SHORT L53 
  337| 000316 A1                                        
  337|                 L51:                             
;  Source Line # 338
  338| 000317 8B45                        MOV    EAX, [EBP-108] ;  MC
  338| 000319 94                                        
  338| 00031A 8B5D                        MOV    EBX, [EBP-48] 
  338| 00031C D0                                        
  338| 00031D 8D5B                        LEA    EBX, [EBX-1] 
  338| 00031F FF                                        
  338| 000320 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
  338| 000323 00000000                                  
  338| 000327 8B4D                        MOV    ECX, [EBP-36] 
  338| 000329 DC                                        
  338| 00032A 8D0C8D                      LEA    ECX, [4*ECX-4] 
  338| 00032D FCFFFFFF                                  
  338| 000331 03D9                        ADD    EBX, ECX 
  338| 000333 8B55                        MOV    EDX, [EBP-116] ;  Sum1
  338| 000335 8C                                        
  338| 000336 891418                      MOV    [EAX+EBX+0], EDX 
;  Source Line # 339
  339| 000339 8B75                        MOV    ESI, [EBP-40] 
  339| 00033B D8                                        
  339| 00033C 3975                        CMP    [EBP-36], ESI 
  339| 00033E DC                                        
  339| 00033F 74                          JE     SHORT L48 
  339| 000340 0C                                        
  339| 000341 8B45                        MOV    EAX, [EBP-36] 
  339| 000343 DC                                        
  339| 000344 40                          INC    EAX    
  339| 000345 8945                        MOV    [EBP-36], EAX 
  339| 000347 DC                                        
  339| 000348 E9                          JMP    L50    
  339| 000349 4EFFFFFF                                  
  339|                 L48:                             
;  Source Line # 340
  340| 00034D 8B45                        MOV    EAX, [EBP-52] 
  340| 00034F CC                                        
  340| 000350 3945                        CMP    [EBP-48], EAX 
  340| 000352 D0                                        
  340| 000353 74                          JE     SHORT L45 
  340| 000354 0C                                        
  340| 000355 8B45                        MOV    EAX, [EBP-48] 
  340| 000357 D0                                        
  340| 000358 40                          INC    EAX    
  340| 000359 8945                        MOV    [EBP-48], EAX 
  340| 00035B D0                                        
  340| 00035C E9                          JMP    L47    
  340| 00035D 12FFFFFF                                  
  340|                 L45:                             
;  Source Line # 342
  342| 000361 6A                          PUSH   0      
  342| 000362 00                                        
  342| 000363 6A                          PUSH   1      
  342| 000364 01                                        
  342| 000365 6A                          PUSH   0      
  342| 000366 00                                        
  342| 000367 8B55                        MOV    EDX, [EBP-124] ; Spill
  342| 000369 84                                        
  342| 00036A 8B42                        MOV    EAX, [EDX+48] 
  342| 00036C 30                                        
  342| 00036D 8B98                        MOV    EBX, [EAX-184] ;  SynchroAndOP
  342| 00036F 48FFFFFF                                  
  342| 000373 53                          PUSH   EBX    
  342| 000374 E8                          CALL   rts_protected_entry_call 
  342| 000375 00000000                                  
;  Source Line # 344
  344| 000379 8B4D                        MOV    ECX, [EBP-96] ;  C4
  344| 00037B A0                                        
  344| 00037C 894D                        MOV    [EBP-24], ECX 
  344| 00037E E8                                        
  344| 00037F 68                          PUSH   lab4.synchroandop.getc 
  344| 000380 00000000                                  
  344| 000384 8D75                        LEA    ESI, [EBP-24] 
  344| 000386 E8                                        
  344| 000387 56                          PUSH   ESI    
  344| 000388 8B55                        MOV    EDX, [EBP-124] ; Spill
  344| 00038A 84                                        
  344| 00038B 8B7A                        MOV    EDI, [EDX+48] 
  344| 00038D 30                                        
  344| 00038E 8B87                        MOV    EAX, [EDI-184] ;  SynchroAndOP
  344| 000390 48FFFFFF                                  
  344| 000394 50                          PUSH   EAX    
  344| 000395 E8                          CALL   rts_entryless_protected_subp_call 
  344| 000396 00000000                                  
  344| 00039A 8B1D                        MOV    EBX, package1.h 
  344| 00039C 00000000                                  
  344| 0003A0 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
  344| 0003A3 43                          INC    EBX    
  344| 0003A4 895D                        MOV    [EBP-20], EBX 
  344| 0003A6 EC                                        
  344| 0003A7 8B0D                        MOV    ECX, package1.n 
  344| 0003A9 00000000                                  
  344| 0003AD 894D                        MOV    [EBP-16], ECX 
  344| 0003AF F0                                        
;  Source Line # 346
  346| 0003B0 8B75                        MOV    ESI, [EBP-16] 
  346| 0003B2 F0                                        
  346| 0003B3 3975                        CMP    [EBP-20], ESI 
  346| 0003B5 EC                                        
  346| 0003B6 0F8F                        JG     L60    
  346| 0003B8 8E000000                                  
  346| 0003BC 8B45                        MOV    EAX, [EBP-20] 
  346| 0003BE EC                                        
  346| 0003BF 8945                        MOV    [EBP-12], EAX 
  346| 0003C1 F4                                        
  346|                 L62:                             
;  Source Line # 347
  347| 0003C2 C745                        MOV    DWORD PTR [EBP-116], 0 ;  Sum1
  347| 0003C4 8C                                        
  347| 0003C5 00000000                                  
  347| 0003C9 8B05                        MOV    EAX, package1.n 
  347| 0003CB 00000000                                  
  347| 0003CF 8945                        MOV    [EBP-8], EAX 
  347| 0003D1 F8                                        
;  Source Line # 348
  348| 0003D2 837D                        CMP    DWORD PTR [EBP-8], 0 
  348| 0003D4 F8                                        
  348| 0003D5 00                                        
  348| 0003D6 7E                          JLE    SHORT L63 
  348| 0003D7 48                                        
  348| 0003D8 C745                        MOV    DWORD PTR [EBP-4], 1 
  348| 0003DA FC                                        
  348| 0003DB 01000000                                  
  348|                 L65:                             
;  Source Line # 349
  349| 0003DF 8B45                        MOV    EAX, [EBP-96] ;  C4
  349| 0003E1 A0                                        
  349| 0003E2 8B5D                        MOV    EBX, [EBP-4] 
  349| 0003E4 FC                                        
  349| 0003E5 8B4D                        MOV    ECX, [EBP-108] ;  MC
  349| 0003E7 94                                        
  349| 0003E8 8B55                        MOV    EDX, [EBP-4] 
  349| 0003EA FC                                        
  349| 0003EB 8D52                        LEA    EDX, [EDX-1] 
  349| 0003ED FF                                        
  349| 0003EE 0FAF15                      IMUL   EDX, package1.matr__COMP_SU_SIZE 
  349| 0003F1 00000000                                  
  349| 0003F5 8B75                        MOV    ESI, [EBP-12] 
  349| 0003F7 F4                                        
  349| 0003F8 8D34B5                      LEA    ESI, [4*ESI-4] 
  349| 0003FB FCFFFFFF                                  
  349| 0003FF 03D6                        ADD    EDX, ESI 
  349| 000401 8B7C98                      MOV    EDI, [EAX+4*EBX-4] 
  349| 000404 FC                                        
  349| 000405 0FAF3C11                    IMUL   EDI, [ECX+EDX+0] 
  349| 000409 037D                        ADD    EDI, [EBP-116] ;  Sum1
  349| 00040B 8C                                        
  349| 00040C 897D                        MOV    [EBP-116], EDI ;  Sum1
  349| 00040E 8C                                        
;  Source Line # 350
  350| 00040F 8B45                        MOV    EAX, [EBP-8] 
  350| 000411 F8                                        
  350| 000412 3945                        CMP    [EBP-4], EAX 
  350| 000414 FC                                        
  350| 000415 74                          JE     SHORT L63 
  350| 000416 09                                        
  350| 000417 8B45                        MOV    EAX, [EBP-4] 
  350| 000419 FC                                        
  350| 00041A 40                          INC    EAX    
  350| 00041B 8945                        MOV    [EBP-4], EAX 
  350| 00041D FC                                        
  350| 00041E EB                          JMP    SHORT L65 
  350| 00041F BF                                        
  350|                 L63:                             
;  Source Line # 351
  351| 000420 8B55                        MOV    EDX, [EBP-124] ; Spill
  351| 000422 84                                        
  351| 000423 8B42                        MOV    EAX, [EDX+48] 
  351| 000425 30                                        
  351| 000426 8B98                        MOV    EBX, [EAX-248] ;  A
  351| 000428 08FFFFFF                                  
  351| 00042C 8B4D                        MOV    ECX, [EBP-12] 
  351| 00042E F4                                        
  351| 00042F 8B75                        MOV    ESI, [EBP-116] ;  Sum1
  351| 000431 8C                                        
  351| 000432 89748B                      MOV    [EBX+4*ECX-4], ESI 
  351| 000435 FC                                        
;  Source Line # 352
  352| 000436 8B7D                        MOV    EDI, [EBP-16] 
  352| 000438 F0                                        
  352| 000439 397D                        CMP    [EBP-12], EDI 
  352| 00043B F4                                        
  352| 00043C 74                          JE     SHORT L60 
  352| 00043D 0C                                        
  352| 00043E 8B45                        MOV    EAX, [EBP-12] 
  352| 000440 F4                                        
  352| 000441 40                          INC    EAX    
  352| 000442 8945                        MOV    [EBP-12], EAX 
  352| 000444 F4                                        
  352| 000445 E9                          JMP    L62    
  352| 000446 78FFFFFF                                  
  352|                 L60:                             
;  Source Line # 354
  354| 00044A 68                          PUSH   lab4.synchroandop.endsignal 
  354| 00044B 00000000                                  
  354| 00044F 6A                          PUSH   0      
  354| 000450 00                                        
  354| 000451 8B55                        MOV    EDX, [EBP-124] ; Spill
  354| 000453 84                                        
  354| 000454 8B42                        MOV    EAX, [EDX+48] 
  354| 000456 30                                        
  354| 000457 8B98                        MOV    EBX, [EAX-184] ;  SynchroAndOP
  354| 000459 48FFFFFF                                  
  354| 00045D 53                          PUSH   EBX    
  354| 00045E E8                          CALL   rts_protected_procedure_call 
  354| 00045F 00000000                                  
;  Source Line # 356
  356| 000463 68                          PUSH   __lcl.00000353 
  356| 000464 00000000                                  
  356| 000468 68                          PUSH   __lcl.00000352 
  356| 000469 00000000                                  
  356| 00046D E8                          CALL   ada.text_io.put_line__2 
  356| 00046E 00000000                                  
;  Source Line # 357
  357| 000472 8B55                        MOV    EDX, [EBP-124] ; Spill
  357| 000474 84                                        
  357| 000475 8B4A                        MOV    ECX, [EDX+48] 
  357| 000477 30                                        
  357| 000478 8BB1                        MOV    ESI, [ECX-248] ;  A
  357| 00047A 08FFFFFF                                  
  357| 00047E 56                          PUSH   ESI    
  357| 00047F E8                          CALL   package1.vec_print 
  357| 000480 00000000                                  
;  Source Line # 359
  359| 000484 68                          PUSH   __lcl.00000355 
  359| 000485 00000000                                  
  359| 000489 68                          PUSH   __lcl.00000354 
  359| 00048A 00000000                                  
  359| 00048E E8                          CALL   ada.text_io.put_line__2 
  359| 00048F 00000000                                  
  359| 000493 8D7D                        LEA    EDI, [EBP-112] ;  dyn_temp
  359| 000495 90                                        
  359| 000496 57                          PUSH   EDI    
  359| 000497 E8                          CALL   rts_ss_release 
  359| 000498 00000000                                  
;  Source Line # 360
  360| 00049C 8BE5                        MOV    ESP, EBP 
  360| 00049E 5D                          POP    EBP    
  360| 00049F C2                          RET    4      
  360| 0004A0 0400                                      
                       ;                                
                       lab4.t4__body      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000373     DD     00002E01 
                                          DD     0000012C 
                                          DD     lab4.t4__body 
                                          DD     __lcl.00000389 
                                          DD     0000012E 
                                          DD     lab4.t4__body+00000010H 
                                          DD     __lcl.00000389 
                                          DD     0000012F 
                                          DD     lab4.t4__body+0000005AH 
                                          DD     __lcl.00000389 
                                          DD     00000130 
                                          DD     lab4.t4__body+00000094H 
                                          DD     __lcl.00000389 
                                          DD     00000131 
                                          DD     lab4.t4__body+00000099H 
                                          DD     __lcl.00000389 
                                          DD     00000134 
                                          DD     lab4.t4__body+000000A8H 
                                          DD     __lcl.00000389 
                                          DD     00000135 
                                          DD     lab4.t4__body+000000B1H 
                                          DD     __lcl.00000389 
                                          DD     00000136 
                                          DD     lab4.t4__body+000000BAH 
                                          DD     __lcl.00000389 
                                          DD     00000137 
                                          DD     lab4.t4__body+000000DBH 
                                          DD     __lcl.00000389 
                                          DD     00000139 
                                          DD     lab4.t4__body+000000FCH 
                                          DD     __lcl.00000389 
                                          DD     0000013B 
                                          DD     lab4.t4__body+00000115H 
                                          DD     __lcl.00000389 
                                          DD     0000013D 
                                          DD     lab4.t4__body+0000012DH 
                                          DD     __lcl.00000389 
                                          DD     0000013F 
                                          DD     lab4.t4__body+00000164H 
                                          DD     __lcl.00000389 
                                          DD     00000140 
                                          DD     lab4.t4__body+00000176H 
                                          DD     __lcl.00000389 
                                          DD     00000141 
                                          DD     lab4.t4__body+00000186H 
                                          DD     __lcl.00000389 
                                          DD     00000142 
                                          DD     lab4.t4__body+00000193H 
                                          DD     __lcl.00000389 
                                          DD     00000143 
                                          DD     lab4.t4__body+000001CCH 
                                          DD     __lcl.00000389 
                                          DD     00000144 
                                          DD     lab4.t4__body+000001DDH 
                                          DD     __lcl.00000389 
                                          DD     00000145 
                                          DD     lab4.t4__body+000001EAH 
                                          DD     __lcl.00000389 
                                          DD     00000146 
                                          DD     lab4.t4__body+000001FEH 
                                          DD     __lcl.00000389 
                                          DD     00000148 
                                          DD     lab4.t4__body+0000021FH 
                                          DD     __lcl.00000389 
                                          DD     0000014A 
                                          DD     lab4.t4__body+00000238H 
                                          DD     __lcl.00000389 
                                          DD     0000014C 
                                          DD     lab4.t4__body+00000262H 
                                          DD     __lcl.00000389 
                                          DD     0000014D 
                                          DD     lab4.t4__body+00000289H 
                                          DD     __lcl.00000389 
                                          DD     0000014E 
                                          DD     lab4.t4__body+0000029BH 
                                          DD     __lcl.00000389 
                                          DD     0000014F 
                                          DD     lab4.t4__body+000002ABH 
                                          DD     __lcl.00000389 
                                          DD     00000150 
                                          DD     lab4.t4__body+000002B8H 
                                          DD     __lcl.00000389 
                                          DD     00000151 
                                          DD     lab4.t4__body+00000306H 
                                          DD     __lcl.00000389 
                                          DD     00000152 
                                          DD     lab4.t4__body+00000317H 
                                          DD     __lcl.00000389 
                                          DD     00000153 
                                          DD     lab4.t4__body+00000339H 
                                          DD     __lcl.00000389 
                                          DD     00000154 
                                          DD     lab4.t4__body+0000034DH 
                                          DD     __lcl.00000389 
                                          DD     00000156 
                                          DD     lab4.t4__body+00000361H 
                                          DD     __lcl.00000389 
                                          DD     00000158 
                                          DD     lab4.t4__body+00000379H 
                                          DD     __lcl.00000389 
                                          DD     0000015A 
                                          DD     lab4.t4__body+000003B0H 
                                          DD     __lcl.00000389 
                                          DD     0000015B 
                                          DD     lab4.t4__body+000003C2H 
                                          DD     __lcl.00000389 
                                          DD     0000015C 
                                          DD     lab4.t4__body+000003D2H 
                                          DD     __lcl.00000389 
                                          DD     0000015D 
                                          DD     lab4.t4__body+000003DFH 
                                          DD     __lcl.00000389 
                                          DD     0000015E 
                                          DD     lab4.t4__body+0000040FH 
                                          DD     __lcl.00000389 
                                          DD     0000015F 
                                          DD     lab4.t4__body+00000420H 
                                          DD     __lcl.00000389 
                                          DD     00000160 
                                          DD     lab4.t4__body+00000436H 
                                          DD     __lcl.00000389 
                                          DD     00000162 
                                          DD     lab4.t4__body+0000044AH 
                                          DD     __lcl.00000389 
                                          DD     00000164 
                                          DD     lab4.t4__body+00000463H 
                                          DD     __lcl.00000389 
                                          DD     00000165 
                                          DD     lab4.t4__body+00000472H 
                                          DD     __lcl.00000389 
                                          DD     00000167 
                                          DD     lab4.t4__body+00000484H 
                                          DD     __lcl.00000389 
                                          DD     00000168 
                                          DD     lab4.t4__body+0000049CH 
                                          DD     __lcl.00000389 
                                          DD     00000168 
                                          DD     lab4.t4__body+0000049EH 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 556

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
   13| 00000D 81EC                        SUB    ESP, 272 
   13| 00000F 10010000                                  
   13| 000013 8B42                        MOV    EAX, [EDX+48] 
   13| 000015 30                                        
   13| 000016 8945                        MOV    [EBP-4], EAX 
   13| 000018 FC                                        
   13| 000019 896A                        MOV    [EDX+48], EBP 
   13| 00001B 30                                        
;  Source Line # 14
   14| 00001C 8B02                        MOV    EAX, [EDX+0] 
   14| 00001E 8985                        MOV    [EBP-260], EAX ;  dyn_temp
   14| 000020 FCFEFFFF                                  
   14| 000024 8B1D                        MOV    EBX, package1.matr__constrained_array____1 
   14| 000026 00000000                                  
   14| 00002A 83EB                        SUB    EBX, 1 
   14| 00002C 01                                        
   14| 00002D 7D                          JGE    SHORT L35 
   14| 00002E 03                                        
   14| 00002F 33DB                        XOR    EBX, EBX 
   14| 000031 4B                          DEC    EBX    
   14|                 L35:                             
   14| 000032 CE                          INTO          
   14| 000033 43                          INC    EBX    
   14| 000034 CE                          INTO          
   14| 000035 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   14| 000038 00000000                                  
   14| 00003C 53                          PUSH   EBX    
   14| 00003D 8995                        MOV    [EBP-272], EDX ; Spill
   14| 00003F F0FEFFFF                                  
   14| 000043 E8                          CALL   rts_ss_allocate 
   14| 000044 00000000                                  
   14| 000048 8985                        MOV    [EBP-256], EAX ;  MX
   14| 00004A 00FFFFFF                                  
   14| 00004E 8B0D                        MOV    ECX, package1.matr__constrained_array____1 
   14| 000050 00000000                                  
   14| 000054 83E9                        SUB    ECX, 1 
   14| 000056 01                                        
   14| 000057 7D                          JGE    SHORT L36 
   14| 000058 03                                        
   14| 000059 33C9                        XOR    ECX, ECX 
   14| 00005B 49                          DEC    ECX    
   14|                 L36:                             
   14| 00005C CE                          INTO          
   14| 00005D 41                          INC    ECX    
   14| 00005E CE                          INTO          
   14| 00005F 0FAF0D                      IMUL   ECX, package1.matr__COMP_SU_SIZE 
   14| 000062 00000000                                  
   14| 000066 51                          PUSH   ECX    
   14| 000067 E8                          CALL   rts_ss_allocate 
   14| 000068 00000000                                  
   14| 00006C 8985                        MOV    [EBP-252], EAX ;  MZ
   14| 00006E 04FFFFFF                                  
;  Source Line # 15
   15| 000072 8B35                        MOV    ESI, package1.vec__constrained_array____1 
   15| 000074 00000000                                  
   15| 000078 83EE                        SUB    ESI, 1 
   15| 00007A 01                                        
   15| 00007B 7D                          JGE    SHORT L37 
   15| 00007C 03                                        
   15| 00007D 33F6                        XOR    ESI, ESI 
   15| 00007F 4E                          DEC    ESI    
   15|                 L37:                             
   15| 000080 CE                          INTO          
   15| 000081 46                          INC    ESI    
   15| 000082 CE                          INTO          
   15| 000083 C1E6                        SHL    ESI, 2 
   15| 000085 02                                        
   15| 000086 56                          PUSH   ESI    
   15| 000087 E8                          CALL   rts_ss_allocate 
   15| 000088 00000000                                  
   15| 00008C 8985                        MOV    [EBP-248], EAX ;  A
   15| 00008E 08FFFFFF                                  
;  Source Line # 22
   22| 000092 C645                        MOV    BYTE PTR [EBP-12], 0 ;  SynchroAndOP__elab_bool
   22| 000094 F4                                        
   22| 000095 00                                        
   22| 000096 6A                          PUSH   0      
   22| 000097 00                                        
   22| 000098 8DBD                        LEA    EDI, [EBP-244] ;  master_record
   22| 00009A 0CFFFFFF                                  
   22| 00009E 57                          PUSH   EDI    
   22| 00009F E8                          CALL   rts_init_master 
   22| 0000A0 00000000                                  
   22| 0000A4 8B15                        MOV    EDX, package1.vec__constrained_array____1 
   22| 0000A6 00000000                                  
   22| 0000AA 83EA                        SUB    EDX, 1 
   22| 0000AC 01                                        
   22| 0000AD 7D                          JGE    SHORT L38 
   22| 0000AE 03                                        
   22| 0000AF 33D2                        XOR    EDX, EDX 
   22| 0000B1 4A                          DEC    EDX    
   22|                 L38:                             
   22| 0000B2 CE                          INTO          
   22| 0000B3 42                          INC    EDX    
   22| 0000B4 CE                          INTO          
   22| 0000B5 C1E2                        SHL    EDX, 2 
   22| 0000B7 02                                        
   22| 0000B8 83C2                        ADD    EDX, 96 
   22| 0000BA 60                                        
   22| 0000BB 8995                        MOV    [EBP-188], EDX ;  dyn_temp
   22| 0000BD 44FFFFFF                                  
   22| 0000C1 8B1D                        MOV    EBX, package1.vec__constrained_array____1 
   22| 0000C3 00000000                                  
   22| 0000C7 83EB                        SUB    EBX, 1 
   22| 0000C9 01                                        
   22| 0000CA 7D                          JGE    SHORT L39 
   22| 0000CB 03                                        
   22| 0000CC 33DB                        XOR    EBX, EBX 
   22| 0000CE 4B                          DEC    EBX    
   22|                 L39:                             
   22| 0000CF CE                          INTO          
   22| 0000D0 43                          INC    EBX    
   22| 0000D1 CE                          INTO          
   22| 0000D2 C1E3                        SHL    EBX, 2 
   22| 0000D4 02                                        
   22| 0000D5 83C3                        ADD    EBX, 7 
   22| 0000D7 07                                        
   22| 0000D8 83E3                        AND    EBX, -8 
   22| 0000DA F8                                        
   22| 0000DB 8B0D                        MOV    ECX, package1.vec__constrained_array____1 
   22| 0000DD 00000000                                  
   22| 0000E1 83E9                        SUB    ECX, 1 
   22| 0000E3 01                                        
   22| 0000E4 7D                          JGE    SHORT L40 
   22| 0000E5 03                                        
   22| 0000E6 33C9                        XOR    ECX, ECX 
   22| 0000E8 49                          DEC    ECX    
   22|                 L40:                             
   22| 0000E9 CE                          INTO          
   22| 0000EA 41                          INC    ECX    
   22| 0000EB CE                          INTO          
   22| 0000EC C1E1                        SHL    ECX, 2 
   22| 0000EE 02                                        
   22| 0000EF 83C1                        ADD    ECX, 7 
   22| 0000F1 07                                        
   22| 0000F2 83E1                        AND    ECX, -8 
   22| 0000F4 F8                                        
   22| 0000F5 03D9                        ADD    EBX, ECX 
   22| 0000F7 8B35                        MOV    ESI, package1.matr__constrained_array____1 
   22| 0000F9 00000000                                  
   22| 0000FD 83EE                        SUB    ESI, 1 
   22| 0000FF 01                                        
   22| 000100 7D                          JGE    SHORT L41 
   22| 000101 03                                        
   22| 000102 33F6                        XOR    ESI, ESI 
   22| 000104 4E                          DEC    ESI    
   22|                 L41:                             
   22| 000105 CE                          INTO          
   22| 000106 46                          INC    ESI    
   22| 000107 CE                          INTO          
   22| 000108 0FAF35                      IMUL   ESI, package1.matr__COMP_SU_SIZE 
   22| 00010B 00000000                                  
   22| 00010F 83C6                        ADD    ESI, 7 
   22| 000111 07                                        
   22| 000112 83E6                        AND    ESI, -8 
   22| 000114 F8                                        
   22| 000115 03DE                        ADD    EBX, ESI 
   22| 000117 83C3                        ADD    EBX, 96 
   22| 000119 60                                        
   22| 00011A 53                          PUSH   EBX    
   22| 00011B E8                          CALL   rts_ss_allocate 
   22| 00011C 00000000                                  
   22| 000120 8985                        MOV    [EBP-184], EAX ;  SynchroAndOP
   22| 000122 48FFFFFF                                  
   22| 000126 8BBD                        MOV    EDI, [EBP-184] ;  SynchroAndOP
   22| 000128 48FFFFFF                                  
   22| 00012C C747                        MOV    DWORD PTR [EDI+72], 0 
   22| 00012E 48                                        
   22| 00012F 00000000                                  
   22| 000133 8B95                        MOV    EDX, [EBP-184] ;  SynchroAndOP
   22| 000135 48FFFFFF                                  
   22| 000139 C742                        MOV    DWORD PTR [EDX+76], 0 
   22| 00013B 4C                                        
   22| 00013C 00000000                                  
   22| 000140 8B8D                        MOV    ECX, [EBP-184] ;  SynchroAndOP
   22| 000142 48FFFFFF                                  
   22| 000146 C741                        MOV    DWORD PTR [ECX+80], 0 
   22| 000148 50                                        
   22| 000149 00000000                                  
   22| 00014D 8BB5                        MOV    ESI, [EBP-184] ;  SynchroAndOP
   22| 00014F 48FFFFFF                                  
   22| 000153 8B9D                        MOV    EBX, [EBP-188] ;  dyn_temp
   22| 000155 44FFFFFF                                  
   22| 000159 895E                        MOV    [ESI+84], EBX 
   22| 00015B 54                                        
   22| 00015C 8B05                        MOV    EAX, package1.matr__constrained_array____1 
   22| 00015E 00000000                                  
   22| 000162 2D                          SUB    EAX, 1 
   22| 000163 01000000                                  
   22| 000167 7D                          JGE    SHORT L42 
   22| 000168 03                                        
   22| 000169 33C0                        XOR    EAX, EAX 
   22| 00016B 48                          DEC    EAX    
   22|                 L42:                             
   22| 00016C CE                          INTO          
   22| 00016D 40                          INC    EAX    
   22| 00016E CE                          INTO          
   22| 00016F 0FAF05                      IMUL   EAX, package1.matr__COMP_SU_SIZE 
   22| 000172 00000000                                  
   22| 000176 0385                        ADD    EAX, [EBP-188] ;  dyn_temp
   22| 000178 44FFFFFF                                  
   22| 00017C 8985                        MOV    [EBP-188], EAX ;  dyn_temp
   22| 00017E 44FFFFFF                                  
   22| 000182 8BBD                        MOV    EDI, [EBP-184] ;  SynchroAndOP
   22| 000184 48FFFFFF                                  
   22| 000188 8B95                        MOV    EDX, [EBP-188] ;  dyn_temp
   22| 00018A 44FFFFFF                                  
   22| 00018E 8957                        MOV    [EDI+88], EDX 
   22| 000190 58                                        
   22| 000191 8B0D                        MOV    ECX, package1.vec__constrained_array____1 
   22| 000193 00000000                                  
   22| 000197 83E9                        SUB    ECX, 1 
   22| 000199 01                                        
   22| 00019A 7D                          JGE    SHORT L43 
   22| 00019B 03                                        
   22| 00019C 33C9                        XOR    ECX, ECX 
   22| 00019E 49                          DEC    ECX    
   22|                 L43:                             
   22| 00019F CE                          INTO          
   22| 0001A0 41                          INC    ECX    
   22| 0001A1 CE                          INTO          
   22| 0001A2 C1E1                        SHL    ECX, 2 
   22| 0001A4 02                                        
   22| 0001A5 038D                        ADD    ECX, [EBP-188] ;  dyn_temp
   22| 0001A7 44FFFFFF                                  
   22| 0001AB 898D                        MOV    [EBP-188], ECX ;  dyn_temp
   22| 0001AD 44FFFFFF                                  
   22| 0001B1 6A                          PUSH   0      
   22| 0001B2 00                                        
   22| 0001B3 68                          PUSH   lab4.synchroandop__protected_type_desc 
   22| 0001B4 00000000                                  
   22| 0001B8 6A                          PUSH   30     
   22| 0001B9 1E                                        
   22| 0001BA 8BB5                        MOV    ESI, [EBP-184] ;  SynchroAndOP
   22| 0001BC 48FFFFFF                                  
   22| 0001C0 56                          PUSH   ESI    
   22| 0001C1 8D9D                        LEA    EBX, [EBP-180] ;  cleanup
   22| 0001C3 4CFFFFFF                                  
   22| 0001C7 53                          PUSH   EBX    
   22| 0001C8 8D85                        LEA    EAX, [EBP-244] ;  master_record
   22| 0001CA 0CFFFFFF                                  
   22| 0001CE 50                          PUSH   EAX    
   22| 0001CF E8                          CALL   rts_init_po 
   22| 0001D0 00000000                                  
;  Source Line # 55
   55| 0001D4 C645                        MOV    BYTE PTR [EBP-12], 1 ;  SynchroAndOP__elab_bool
   55| 0001D6 F4                                        
   55| 0001D7 01                                        
;  Source Line # 128
  128| 0001D8 C645                        MOV    BYTE PTR [EBP-11], 0 ;  T1__elab_bool
  128| 0001DA F5                                        
  128| 0001DB 00                                        
  128| 0001DC 8DBD                        LEA    EDI, [EBP-148] ;  activation_list
  128| 0001DE 6CFFFFFF                                  
  128| 0001E2 57                          PUSH   EDI    
  128| 0001E3 E8                          CALL   rts_initialize_activation_list 
  128| 0001E4 00000000                                  
  128| 0001E8 68                          PUSH   __lcl.00000361 
  128| 0001E9 00000000                                  
  128| 0001ED 6A                          PUSH   0      
  128| 0001EE 00                                        
  128| 0001EF 8D55                        LEA    EDX, [EBP-11] ;  T1__elab_bool
  128| 0001F1 F5                                        
  128| 0001F2 52                          PUSH   EDX    
  128| 0001F3 6A                          PUSH   0      
  128| 0001F4 00                                        
  128| 0001F5 8D4D                        LEA    ECX, [EBP-76] ;  T1
  128| 0001F7 B4                                        
  128| 0001F8 51                          PUSH   ECX    
  128| 0001F9 6A                          PUSH   0      
  128| 0001FA 00                                        
  128| 0001FB 68                          PUSH   lab4.t1__body 
  128| 0001FC 00000000                                  
  128| 000200 8DB5                        LEA    ESI, [EBP-244] ;  master_record
  128| 000202 0CFFFFFF                                  
  128| 000206 56                          PUSH   ESI    
  128| 000207 8D9D                        LEA    EBX, [EBP-148] ;  activation_list
  128| 000209 6CFFFFFF                                  
  128| 00020D 53                          PUSH   EBX    
  128| 00020E 6A                          PUSH   0      
  128| 00020F 00                                        
  128| 000210 E8                          CALL   rts_initialize_task_with_name 
  128| 000211 00000000                                  
;  Source Line # 129
  129| 000215 C645                        MOV    BYTE PTR [EBP-10], 0 ;  T2__elab_bool
  129| 000217 F6                                        
  129| 000218 00                                        
  129| 000219 68                          PUSH   __lcl.00000362 
  129| 00021A 00000000                                  
  129| 00021E 6A                          PUSH   0      
  129| 00021F 00                                        
  129| 000220 8D45                        LEA    EAX, [EBP-10] ;  T2__elab_bool
  129| 000222 F6                                        
  129| 000223 50                          PUSH   EAX    
  129| 000224 6A                          PUSH   0      
  129| 000225 00                                        
  129| 000226 8D7D                        LEA    EDI, [EBP-60] ;  T2
  129| 000228 C4                                        
  129| 000229 57                          PUSH   EDI    
  129| 00022A 6A                          PUSH   0      
  129| 00022B 00                                        
  129| 00022C 68                          PUSH   lab4.t2__body 
  129| 00022D 00000000                                  
  129| 000231 8D95                        LEA    EDX, [EBP-244] ;  master_record
  129| 000233 0CFFFFFF                                  
  129| 000237 52                          PUSH   EDX    
  129| 000238 8D8D                        LEA    ECX, [EBP-148] ;  activation_list
  129| 00023A 6CFFFFFF                                  
  129| 00023E 51                          PUSH   ECX    
  129| 00023F 6A                          PUSH   0      
  129| 000240 00                                        
  129| 000241 E8                          CALL   rts_initialize_task_with_name 
  129| 000242 00000000                                  
;  Source Line # 130
  130| 000246 C645                        MOV    BYTE PTR [EBP-9], 0 ;  T3__elab_bool
  130| 000248 F7                                        
  130| 000249 00                                        
  130| 00024A 68                          PUSH   __lcl.00000363 
  130| 00024B 00000000                                  
  130| 00024F 6A                          PUSH   0      
  130| 000250 00                                        
  130| 000251 8D75                        LEA    ESI, [EBP-9] ;  T3__elab_bool
  130| 000253 F7                                        
  130| 000254 56                          PUSH   ESI    
  130| 000255 6A                          PUSH   0      
  130| 000256 00                                        
  130| 000257 8D5D                        LEA    EBX, [EBP-44] ;  T3
  130| 000259 D4                                        
  130| 00025A 53                          PUSH   EBX    
  130| 00025B 6A                          PUSH   0      
  130| 00025C 00                                        
  130| 00025D 68                          PUSH   lab4.t3__body 
  130| 00025E 00000000                                  
  130| 000262 8D85                        LEA    EAX, [EBP-244] ;  master_record
  130| 000264 0CFFFFFF                                  
  130| 000268 50                          PUSH   EAX    
  130| 000269 8DBD                        LEA    EDI, [EBP-148] ;  activation_list
  130| 00026B 6CFFFFFF                                  
  130| 00026F 57                          PUSH   EDI    
  130| 000270 6A                          PUSH   0      
  130| 000271 00                                        
  130| 000272 E8                          CALL   rts_initialize_task_with_name 
  130| 000273 00000000                                  
;  Source Line # 131
  131| 000277 C645                        MOV    BYTE PTR [EBP-8], 0 ;  T4__elab_bool
  131| 000279 F8                                        
  131| 00027A 00                                        
  131| 00027B 68                          PUSH   __lcl.00000364 
  131| 00027C 00000000                                  
  131| 000280 6A                          PUSH   0      
  131| 000281 00                                        
  131| 000282 8D55                        LEA    EDX, [EBP-8] ;  T4__elab_bool
  131| 000284 F8                                        
  131| 000285 52                          PUSH   EDX    
  131| 000286 6A                          PUSH   0      
  131| 000287 00                                        
  131| 000288 8D4D                        LEA    ECX, [EBP-28] ;  T4
  131| 00028A E4                                        
  131| 00028B 51                          PUSH   ECX    
  131| 00028C 6A                          PUSH   0      
  131| 00028D 00                                        
  131| 00028E 68                          PUSH   lab4.t4__body 
  131| 00028F 00000000                                  
  131| 000293 8DB5                        LEA    ESI, [EBP-244] ;  master_record
  131| 000295 0CFFFFFF                                  
  131| 000299 56                          PUSH   ESI    
  131| 00029A 8D9D                        LEA    EBX, [EBP-148] ;  activation_list
  131| 00029C 6CFFFFFF                                  
  131| 0002A0 53                          PUSH   EBX    
  131| 0002A1 6A                          PUSH   0      
  131| 0002A2 00                                        
  131| 0002A3 E8                          CALL   rts_initialize_task_with_name 
  131| 0002A4 00000000                                  
;  Source Line # 134
  134| 0002A8 C645                        MOV    BYTE PTR [EBP-11], 1 ;  T1__elab_bool
  134| 0002AA F5                                        
  134| 0002AB 01                                        
;  Source Line # 191
  191| 0002AC C645                        MOV    BYTE PTR [EBP-10], 1 ;  T2__elab_bool
  191| 0002AE F6                                        
  191| 0002AF 01                                        
;  Source Line # 244
  244| 0002B0 C645                        MOV    BYTE PTR [EBP-9], 1 ;  T3__elab_bool
  244| 0002B2 F7                                        
  244| 0002B3 01                                        
;  Source Line # 300
  300| 0002B4 C645                        MOV    BYTE PTR [EBP-8], 1 ;  T4__elab_bool
  300| 0002B6 F8                                        
  300| 0002B7 01                                        
;  Source Line # 362
  362| 0002B8 8D85                        LEA    EAX, [EBP-148] ;  activation_list
  362| 0002BA 6CFFFFFF                                  
  362| 0002BE 50                          PUSH   EAX    
  362| 0002BF E8                          CALL   rts_activate_tasks 
  362| 0002C0 00000000                                  
  362| 0002C4 8DBD                        LEA    EDI, [EBP-244] ;  master_record
  362| 0002C6 0CFFFFFF                                  
  362| 0002CA 57                          PUSH   EDI    
  362| 0002CB E8                          CALL   rts_finalize_and_pop 
  362| 0002CC 00000000                                  
  362| 0002D0 8D95                        LEA    EDX, [EBP-260] ;  dyn_temp
  362| 0002D2 FCFEFFFF                                  
  362| 0002D6 52                          PUSH   EDX    
  362| 0002D7 E8                          CALL   rts_ss_release 
  362| 0002D8 00000000                                  
;  Source Line # 364
  364| 0002DC 8B95                        MOV    EDX, [EBP-272] ; Spill
  364| 0002DE F0FEFFFF                                  
  364| 0002E2 8B4D                        MOV    ECX, [EBP-4] 
  364| 0002E4 FC                                        
  364| 0002E5 894A                        MOV    [EDX+48], ECX 
  364| 0002E7 30                                        
  364| 0002E8 8BE5                        MOV    ESP, EBP 
  364| 0002EA 5D                          POP    EBP    
  364| 0002EB C3                          RET           
                       ;                                
                       lab4               ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000372     DD     00001001 
                                          DD     0000000D 
                                          DD     lab4   
                                          DD     __lcl.00000389 
                                          DD     0000000E 
                                          DD     lab4+0000001CH 
                                          DD     __lcl.00000389 
                                          DD     0000000F 
                                          DD     lab4+00000072H 
                                          DD     __lcl.00000389 
                                          DD     00000016 
                                          DD     lab4+00000092H 
                                          DD     __lcl.00000389 
                                          DD     00000037 
                                          DD     lab4+000001D4H 
                                          DD     __lcl.00000389 
                                          DD     00000080 
                                          DD     lab4+000001D8H 
                                          DD     __lcl.00000389 
                                          DD     00000081 
                                          DD     lab4+00000215H 
                                          DD     __lcl.00000389 
                                          DD     00000082 
                                          DD     lab4+00000246H 
                                          DD     __lcl.00000389 
                                          DD     00000083 
                                          DD     lab4+00000277H 
                                          DD     __lcl.00000389 
                                          DD     00000086 
                                          DD     lab4+000002A8H 
                                          DD     __lcl.00000389 
                                          DD     000000BF 
                                          DD     lab4+000002ACH 
                                          DD     __lcl.00000389 
                                          DD     000000F4 
                                          DD     lab4+000002B0H 
                                          DD     __lcl.00000389 
                                          DD     0000012C 
                                          DD     lab4+000002B4H 
                                          DD     __lcl.00000389 
                                          DD     0000016A 
                                          DD     lab4+000002B8H 
                                          DD     __lcl.00000389 
                                          DD     0000016C 
                                          DD     lab4+000002DCH 
                                          DD     __lcl.00000389 
                                          DD     0000016C 
                                          DD     lab4+000002E8H 
                                          DD     __lcl.00000389 
; ********* End of segment, Total Size = 196


; ************* Initialized part of the global segment :
                                          ALIGN 4       
     000000            __lcl.00000364     DB     'Lab4.T4' 
                                          DB     00H    
     000008            __lcl.00000363     DB     'Lab4.T3' 
                                          DB     00H    
     000010            __lcl.00000362     DB     'Lab4.T2' 
                                          DB     00H    
     000018            __lcl.00000361     DB     'Lab4.T1' 
                                          DB     00H    
     000020            __lcl.00000355     DD     00000001 
                                          DD     00000007 
     000028            __lcl.00000354     DB     'T4 stop' 
                                          DB     00     
     000030            __lcl.00000353     DD     00000001 
                                          DD     0000000D 
     000038            __lcl.00000352     DB     '             ' 
                                          DB     00H,00H,00H 
     000048            __lcl.00000312     DD     00000001 
                                          DD     00000008 
     000050            __lcl.00000311     DB     'T4 start' 
     000058            __lcl.00000305     DD     00000001 
                                          DD     00000007 
     000060            __lcl.00000304     DB     'T3 stop' 
                                          DB     00     
     000068            __lcl.00000264     DD     00000001 
                                          DD     00000008 
     000070            __lcl.00000263     DB     'T3 start' 
     000078            __lcl.00000257     DD     00000001 
                                          DD     00000007 
     000080            __lcl.00000256     DB     'T2 stop' 
                                          DB     00     
     000088            __lcl.00000216     DD     00000001 
                                          DD     00000008 
     000090            __lcl.00000215     DB     'T2 start' 
     000098            __lcl.00000207     DD     00000001 
                                          DD     00000007 
     0000A0            __lcl.00000206     DB     'T1 stop' 
                                          DB     00     
     0000A8            __lcl.00000165     DD     00000001 
                                          DD     00000008 
     0000B0            __lcl.00000164     DB     'T1 start' 
     0000B8            lab4.synchroandop__protected_type_desc DB 01 
                                          DB     3 DUP(00) 
                                          DD     00000002 
                                          DD     00000000 
                                          DB     01     
                                          DB     3 DUP(00) 
                                          DD     00000018 
                                          DD     lab4.synchroandop__all_barriers 
                                          DD     lab4.synchroandop.inputsync 
                                          DD     lab4.synchroandop.csync 
                                          DD     lab4.synchroandop.endsync 
; ********* End of segment, Total Size = 220


; ************* .av_dbgr segment :
                                          ALIGN 4       
                                          DD     00000000 
                                          DD     00000000 
     000008            lab4__rootpart____1 DD    lab4__subp_body_subpdesc____1 
; ********* End of segment, Total Size = 16


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000371     DB     04H    
                                          DB     'Lab4' 
                                          DB     00H,00H,00H 
     000008            lab4__subp_body_subpdesc____1 DD __lcl.00000371 
                                          DD     00000001 
                                          DD     __lcl.00000119 
                                          DD     0000000D 
                                          DD     0000016A 
                                          DD     0000016C 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000365 
                                          DD     __lcl.00000366 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000367 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000372 
                                          DD     00000110 
                                          DD     __lcl.00000001 
     00006C            __lcl.00000370     DB     02H    
                                          DB     'MX'   
                                          DB     00     
     000070            __lcl.00000369     DB     02H    
                                          DB     'MZ'   
                                          DB     00     
     000074            __lcl.00000368     DB     01H    
                                          DB     'A'    
                                          DW     0000   
     000078            __lcl.00000367     DD     00000008 
                                          DD     __lcl.00000163 
                                          DD     __lcl.00000162 
                                          DD     FFFFFFE4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000161 
                                          DD     __lcl.00000160 
                                          DD     FFFFFFD4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000159 
                                          DD     __lcl.00000158 
                                          DD     FFFFFFC4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000157 
                                          DD     __lcl.00000156 
                                          DD     FFFFFFB4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000054 
                                          DD     __lcl.00000053 
                                          DD     FFFFFF48 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000368 
                                          DD     __lcl.00000016 
                                          DD     FFFFFF08 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000369 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF04 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000370 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF00 
                                          DD     00000103 
                                          DD     00000000 
     00011C            __lcl.00000366     DD     00000005 
                                          DD     lab4.synchroandop__protected_body_subpdesc____1
                                                        
                                          DD     lab4.t1__task_subpdesc____1 
                                          DD     lab4.t2__task_subpdesc____1 
                                          DD     lab4.t3__task_subpdesc____1 
                                          DD     lab4.t4__task_subpdesc____1 
     000134            __lcl.00000365     DD     00000005 
                                          DD     __lcl.00000163 
                                          DD     __lcl.00000162 
                                          DD     __lcl.00000161 
                                          DD     __lcl.00000160 
                                          DD     __lcl.00000159 
                                          DD     __lcl.00000158 
                                          DD     __lcl.00000157 
                                          DD     __lcl.00000156 
                                          DD     __lcl.00000054 
                                          DD     __lcl.00000053 
     000160            lab4.t4__task_subpdesc____1 DD __lcl.00000163 
                                          DD     00000012 
                                          DD     __lcl.00000119 
                                          DD     0000012C 
                                          DD     00000130 
                                          DD     00000168 
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
                                          DD     __lcl.00000356 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000360 
                                          DD     __lcl.00000162 
                                          DD     00000000 
                                          DD     __lcl.00000373 
                                          DD     0000007C 
                                          DD     __lcl.00000001 
     0001C4            __lcl.00000360     DD     00000003 
                                          DD     __lcl.00000323 
                                          DD     __lcl.00000340 
                                          DD     __lcl.00000351 
     0001D4            __lcl.00000359     DB     03H    
                                          DB     'MO4'  
     0001D8            __lcl.00000358     DB     02H    
                                          DB     'B4'   
                                          DB     00     
     0001DC            __lcl.00000357     DB     02H    
                                          DB     'C4'   
                                          DB     00     
     0001E0            __lcl.00000356     DD     00000005 
                                          DD     __lcl.00000357 
                                          DD     __lcl.00000016 
                                          DD     FFFFFFA0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000358 
                                          DD     __lcl.00000016 
                                          DD     FFFFFF9C 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000359 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF98 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF94 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000213 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF8C 
                                          DD     00000003 
                                          DD     00000000 
     000248            __lcl.00000351     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     0000015A 
                                          DD     0000015A 
                                          DD     00000160 
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
                                          DD     __lcl.00000349 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000350 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0002AC            __lcl.00000350     DD     00000001 
                                          DD     __lcl.00000348 
     0002B4            __lcl.00000349     DD     00000001 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000343 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     0002CC            __lcl.00000348     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     0000015C 
                                          DD     0000015C 
                                          DD     0000015E 
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
                                          DD     __lcl.00000347 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000330            __lcl.00000347     DD     00000001 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000346 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000348            __lcl.00000346     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000344 
                                          DD     __lcl.00000345 
     000364            __lcl.00000345     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000370            __lcl.00000344     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00037C            __lcl.00000343     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000341 
                                          DD     __lcl.00000342 
     000398            __lcl.00000342     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     0003A4            __lcl.00000341     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     0003B0            __lcl.00000340     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     0000014C 
                                          DD     0000014C 
                                          DD     00000154 
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
                                          DD     __lcl.00000338 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000339 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000414            __lcl.00000339     DD     00000001 
                                          DD     __lcl.00000337 
     00041C            __lcl.00000338     DD     00000001 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000326 
                                          DD     FFFFFFD0 
                                          DD     00000003 
                                          DD     00000001 
     000434            __lcl.00000337     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     0000014D 
                                          DD     0000014D 
                                          DD     00000153 
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
                                          DD     __lcl.00000335 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000336 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000498            __lcl.00000336     DD     00000001 
                                          DD     __lcl.00000334 
     0004A0            __lcl.00000335     DD     00000001 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000329 
                                          DD     FFFFFFDC 
                                          DD     00000003 
                                          DD     00000001 
     0004B8            __lcl.00000334     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     0000014F 
                                          DD     0000014F 
                                          DD     00000151 
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
                                          DD     __lcl.00000333 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00051C            __lcl.00000333     DD     00000001 
                                          DD     __lcl.00000187 
                                          DD     __lcl.00000332 
                                          DD     FFFFFFE4 
                                          DD     00000003 
                                          DD     00000001 
     000534            __lcl.00000332     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000330 
                                          DD     __lcl.00000331 
     000550            __lcl.00000331     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE0 
     00055C            __lcl.00000330     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000568            __lcl.00000329     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000327 
                                          DD     __lcl.00000328 
     000584            __lcl.00000328     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD8 
     000590            __lcl.00000327     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD4 
     00059C            __lcl.00000326     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000324 
                                          DD     __lcl.00000325 
     0005B8            __lcl.00000325     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFCC 
     0005C4            __lcl.00000324     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0005D0            __lcl.00000323     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     0000013F 
                                          DD     0000013F 
                                          DD     00000145 
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
                                          DD     __lcl.00000321 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000322 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000634            __lcl.00000322     DD     00000001 
                                          DD     __lcl.00000320 
     00063C            __lcl.00000321     DD     00000001 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000315 
                                          DD     FFFFFFB8 
                                          DD     00000003 
                                          DD     00000001 
     000654            __lcl.00000320     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     00000141 
                                          DD     00000141 
                                          DD     00000143 
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
                                          DD     __lcl.00000319 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0006B8            __lcl.00000319     DD     00000001 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000318 
                                          DD     FFFFFFC0 
                                          DD     00000003 
                                          DD     00000001 
     0006D0            __lcl.00000318     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000316 
                                          DD     __lcl.00000317 
     0006EC            __lcl.00000317     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFBC 
     0006F8            __lcl.00000316     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000704            __lcl.00000315     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000313 
                                          DD     __lcl.00000314 
     000720            __lcl.00000314     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFB4 
     00072C            __lcl.00000313     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFB0 
     000738            lab4.t3__task_subpdesc____1 DD __lcl.00000161 
                                          DD     00000011 
                                          DD     __lcl.00000119 
                                          DD     000000F4 
                                          DD     000000F8 
                                          DD     00000129 
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
                                          DD     __lcl.00000306 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000310 
                                          DD     __lcl.00000160 
                                          DD     00000000 
                                          DD     __lcl.00000374 
                                          DD     00000074 
                                          DD     __lcl.00000001 
     00079C            __lcl.00000310     DD     00000003 
                                          DD     __lcl.00000275 
                                          DD     __lcl.00000292 
                                          DD     __lcl.00000303 
     0007AC            __lcl.00000309     DB     03H    
                                          DB     'MO3'  
     0007B0            __lcl.00000308     DB     02H    
                                          DB     'B3'   
                                          DB     00     
     0007B4            __lcl.00000307     DB     02H    
                                          DB     'C3'   
                                          DB     00     
     0007B8            __lcl.00000306     DD     00000005 
                                          DD     __lcl.00000307 
                                          DD     __lcl.00000016 
                                          DD     FFFFFFA8 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000308 
                                          DD     __lcl.00000016 
                                          DD     FFFFFFA4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000309 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFA0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF9C 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000213 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF94 
                                          DD     00000003 
                                          DD     00000000 
     000820            __lcl.00000303     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     0000011F 
                                          DD     0000011F 
                                          DD     00000125 
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
                                          DD     __lcl.00000301 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000302 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000884            __lcl.00000302     DD     00000001 
                                          DD     __lcl.00000300 
     00088C            __lcl.00000301     DD     00000001 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000295 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     0008A4            __lcl.00000300     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     00000121 
                                          DD     00000121 
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
                                          DD     __lcl.00000299 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000908            __lcl.00000299     DD     00000001 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000298 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000920            __lcl.00000298     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000296 
                                          DD     __lcl.00000297 
     00093C            __lcl.00000297     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000948            __lcl.00000296     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000954            __lcl.00000295     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000293 
                                          DD     __lcl.00000294 
     000970            __lcl.00000294     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     00097C            __lcl.00000293     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     000988            __lcl.00000292     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     00000111 
                                          DD     00000111 
                                          DD     00000119 
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
                                          DD     __lcl.00000290 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000291 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0009EC            __lcl.00000291     DD     00000001 
                                          DD     __lcl.00000289 
     0009F4            __lcl.00000290     DD     00000001 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000278 
                                          DD     FFFFFFD0 
                                          DD     00000003 
                                          DD     00000001 
     000A0C            __lcl.00000289     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     00000112 
                                          DD     00000112 
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
                                          DD     __lcl.00000287 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000288 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000A70            __lcl.00000288     DD     00000001 
                                          DD     __lcl.00000286 
     000A78            __lcl.00000287     DD     00000001 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000281 
                                          DD     FFFFFFDC 
                                          DD     00000003 
                                          DD     00000001 
     000A90            __lcl.00000286     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     00000114 
                                          DD     00000114 
                                          DD     00000116 
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
                                          DD     __lcl.00000285 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000AF4            __lcl.00000285     DD     00000001 
                                          DD     __lcl.00000187 
                                          DD     __lcl.00000284 
                                          DD     FFFFFFE4 
                                          DD     00000003 
                                          DD     00000001 
     000B0C            __lcl.00000284     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000282 
                                          DD     __lcl.00000283 
     000B28            __lcl.00000283     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE0 
     000B34            __lcl.00000282     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000B40            __lcl.00000281     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000279 
                                          DD     __lcl.00000280 
     000B5C            __lcl.00000280     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD8 
     000B68            __lcl.00000279     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD4 
     000B74            __lcl.00000278     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000276 
                                          DD     __lcl.00000277 
     000B90            __lcl.00000277     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFCC 
     000B9C            __lcl.00000276     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000BA8            __lcl.00000275     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     00000104 
                                          DD     00000104 
                                          DD     0000010A 
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
                                          DD     __lcl.00000273 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000274 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000C0C            __lcl.00000274     DD     00000001 
                                          DD     __lcl.00000272 
     000C14            __lcl.00000273     DD     00000001 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000267 
                                          DD     FFFFFFB8 
                                          DD     00000003 
                                          DD     00000001 
     000C2C            __lcl.00000272     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     00000106 
                                          DD     00000106 
                                          DD     00000108 
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
                                          DD     __lcl.00000271 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000C90            __lcl.00000271     DD     00000001 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000270 
                                          DD     FFFFFFC0 
                                          DD     00000003 
                                          DD     00000001 
     000CA8            __lcl.00000270     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000268 
                                          DD     __lcl.00000269 
     000CC4            __lcl.00000269     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFBC 
     000CD0            __lcl.00000268     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000CDC            __lcl.00000267     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000265 
                                          DD     __lcl.00000266 
     000CF8            __lcl.00000266     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFB4 
     000D04            __lcl.00000265     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFB0 
     000D10            lab4.t2__task_subpdesc____1 DD __lcl.00000159 
                                          DD     00000010 
                                          DD     __lcl.00000119 
                                          DD     000000BF 
                                          DD     000000C3 
                                          DD     000000F1 
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
                                          DD     __lcl.00000258 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000262 
                                          DD     __lcl.00000158 
                                          DD     00000000 
                                          DD     __lcl.00000375 
                                          DD     00000074 
                                          DD     __lcl.00000001 
     000D74            __lcl.00000262     DD     00000003 
                                          DD     __lcl.00000227 
                                          DD     __lcl.00000244 
                                          DD     __lcl.00000255 
     000D84            __lcl.00000261     DB     03H    
                                          DB     'MO2'  
     000D88            __lcl.00000260     DB     02H    
                                          DB     'B2'   
                                          DB     00     
     000D8C            __lcl.00000259     DB     02H    
                                          DB     'C2'   
                                          DB     00     
     000D90            __lcl.00000258     DD     00000005 
                                          DD     __lcl.00000259 
                                          DD     __lcl.00000016 
                                          DD     FFFFFFA8 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000260 
                                          DD     __lcl.00000016 
                                          DD     FFFFFFA4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000261 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFA0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000018 
                                          DD     FFFFFF9C 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000213 
                                          DD     __lcl.00000005 
                                          DD     FFFFFF94 
                                          DD     00000003 
                                          DD     00000000 
     000DF8            __lcl.00000255     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     000000E6 
                                          DD     000000E6 
                                          DD     000000EC 
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
                                          DD     __lcl.00000253 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000254 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000E5C            __lcl.00000254     DD     00000001 
                                          DD     __lcl.00000252 
     000E64            __lcl.00000253     DD     00000001 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000247 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     000E7C            __lcl.00000252     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     000000E8 
                                          DD     000000E8 
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
                                          DD     __lcl.00000251 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000EE0            __lcl.00000251     DD     00000001 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000250 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000EF8            __lcl.00000250     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000248 
                                          DD     __lcl.00000249 
     000F14            __lcl.00000249     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000F20            __lcl.00000248     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000F2C            __lcl.00000247     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000245 
                                          DD     __lcl.00000246 
     000F48            __lcl.00000246     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     000F54            __lcl.00000245     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFEC 
     000F60            __lcl.00000244     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     000000D8 
                                          DD     000000D8 
                                          DD     000000E0 
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
     000FC4            __lcl.00000243     DD     00000001 
                                          DD     __lcl.00000241 
     000FCC            __lcl.00000242     DD     00000001 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000230 
                                          DD     FFFFFFD0 
                                          DD     00000003 
                                          DD     00000001 
     000FE4            __lcl.00000241     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     000000D9 
                                          DD     000000D9 
                                          DD     000000DF 
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
     001048            __lcl.00000240     DD     00000001 
                                          DD     __lcl.00000238 
     001050            __lcl.00000239     DD     00000001 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000233 
                                          DD     FFFFFFDC 
                                          DD     00000003 
                                          DD     00000001 
     001068            __lcl.00000238     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     000000DB 
                                          DD     000000DB 
                                          DD     000000DD 
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
     0010CC            __lcl.00000237     DD     00000001 
                                          DD     __lcl.00000187 
                                          DD     __lcl.00000236 
                                          DD     FFFFFFE4 
                                          DD     00000003 
                                          DD     00000001 
     0010E4            __lcl.00000236     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000234 
                                          DD     __lcl.00000235 
     001100            __lcl.00000235     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE0 
     00110C            __lcl.00000234     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001118            __lcl.00000233     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000231 
                                          DD     __lcl.00000232 
     001134            __lcl.00000232     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD8 
     001140            __lcl.00000231     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD4 
     00114C            __lcl.00000230     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000228 
                                          DD     __lcl.00000229 
     001168            __lcl.00000229     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFCC 
     001174            __lcl.00000228     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001180            __lcl.00000227     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     000000CB 
                                          DD     000000CB 
                                          DD     000000D1 
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
     0011E4            __lcl.00000226     DD     00000001 
                                          DD     __lcl.00000224 
     0011EC            __lcl.00000225     DD     00000001 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000219 
                                          DD     FFFFFFB8 
                                          DD     00000003 
                                          DD     00000001 
     001204            __lcl.00000224     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     000000CD 
                                          DD     000000CD 
                                          DD     000000CF 
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
                                          DD     __lcl.00000223 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001268            __lcl.00000223     DD     00000001 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000222 
                                          DD     FFFFFFC0 
                                          DD     00000003 
                                          DD     00000001 
     001280            __lcl.00000222     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000220 
                                          DD     __lcl.00000221 
     00129C            __lcl.00000221     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFBC 
     0012A8            __lcl.00000220     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0012B4            __lcl.00000219     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000217 
                                          DD     __lcl.00000218 
     0012D0            __lcl.00000218     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFB4 
     0012DC            __lcl.00000217     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFB0 
     0012E8            lab4.t1__task_subpdesc____1 DD __lcl.00000157 
                                          DD     0000000F 
                                          DD     __lcl.00000119 
                                          DD     00000086 
                                          DD     0000008A 
                                          DD     000000BC 
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
                                          DD     __lcl.00000208 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000214 
                                          DD     __lcl.00000156 
                                          DD     00000000 
                                          DD     __lcl.00000376 
                                          DD     00000068 
                                          DD     __lcl.00000001 
     00134C            __lcl.00000214     DD     00000003 
                                          DD     __lcl.00000176 
                                          DD     __lcl.00000194 
                                          DD     __lcl.00000205 
     00135C            __lcl.00000213     DB     04H    
                                          DB     'Sum1' 
                                          DB     00H,00H,00H 
     001364            __lcl.00000212     DB     02H    
                                          DB     'MC'   
                                          DB     00     
     001368            __lcl.00000211     DB     03H    
                                          DB     'MO1'  
     00136C            __lcl.00000210     DB     02H    
                                          DB     'B1'   
                                          DB     00     
     001370            __lcl.00000209     DB     02H    
                                          DB     'C1'   
                                          DB     00     
     001374            __lcl.00000208     DD     00000005 
                                          DD     __lcl.00000209 
                                          DD     __lcl.00000016 
                                          DD     FFFFFFB4 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000210 
                                          DD     __lcl.00000016 
                                          DD     FFFFFFB0 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000211 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFAC 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFA8 
                                          DD     00000103 
                                          DD     00000000 
                                          DD     __lcl.00000213 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFA0 
                                          DD     00000003 
                                          DD     00000000 
     0013DC            __lcl.00000205     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     000000B1 
                                          DD     000000B1 
                                          DD     000000B7 
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
                                          DD     __lcl.00000203 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000204 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001440            __lcl.00000204     DD     00000001 
                                          DD     __lcl.00000202 
     001448            __lcl.00000203     DD     00000001 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000197 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     001460            __lcl.00000202     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     000000B3 
                                          DD     000000B3 
                                          DD     000000B5 
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
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0014C4            __lcl.00000201     DD     00000001 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000200 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0014DC            __lcl.00000200     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000198 
                                          DD     __lcl.00000199 
     0014F8            __lcl.00000199     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     001504            __lcl.00000198     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001510            __lcl.00000197     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000195 
                                          DD     __lcl.00000196 
     00152C            __lcl.00000196     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     001538            __lcl.00000195     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001544            __lcl.00000194     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     000000A3 
                                          DD     000000A3 
                                          DD     000000AB 
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
                                          DD     __lcl.00000192 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000193 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0015A8            __lcl.00000193     DD     00000001 
                                          DD     __lcl.00000191 
     0015B0            __lcl.00000192     DD     00000001 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000179 
                                          DD     FFFFFFD8 
                                          DD     00000003 
                                          DD     00000001 
     0015C8            __lcl.00000191     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     000000A4 
                                          DD     000000A4 
                                          DD     000000AA 
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
                                          DD     __lcl.00000189 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000190 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00162C            __lcl.00000190     DD     00000001 
                                          DD     __lcl.00000188 
     001634            __lcl.00000189     DD     00000001 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000182 
                                          DD     FFFFFFE0 
                                          DD     00000003 
                                          DD     00000001 
     00164C            __lcl.00000188     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     000000A6 
                                          DD     000000A6 
                                          DD     000000A8 
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
                                          DD     __lcl.00000186 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0016B0            __lcl.00000187     DB     01H    
                                          DB     'z'    
                                          DW     0000   
     0016B4            __lcl.00000186     DD     00000001 
                                          DD     __lcl.00000187 
                                          DD     __lcl.00000185 
                                          DD     FFFFFFE8 
                                          DD     00000003 
                                          DD     00000001 
     0016CC            __lcl.00000185     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000183 
                                          DD     __lcl.00000184 
     0016E8            __lcl.00000184     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFE4 
     0016F4            __lcl.00000183     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001700            __lcl.00000182     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000180 
                                          DD     __lcl.00000181 
     00171C            __lcl.00000181     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFDC 
     001728            __lcl.00000180     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001734            __lcl.00000179     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000177 
                                          DD     __lcl.00000178 
     001750            __lcl.00000178     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFD4 
     00175C            __lcl.00000177     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001768            __lcl.00000176     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     00000096 
                                          DD     00000096 
                                          DD     0000009C 
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
                                          DD     __lcl.00000174 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000175 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0017CC            __lcl.00000175     DD     00000001 
                                          DD     __lcl.00000173 
     0017D4            __lcl.00000174     DD     00000001 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000168 
                                          DD     FFFFFFC0 
                                          DD     00000003 
                                          DD     00000001 
     0017EC            __lcl.00000173     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     00000098 
                                          DD     00000098 
                                          DD     0000009A 
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
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001850            __lcl.00000172     DD     00000001 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000171 
                                          DD     FFFFFFC8 
                                          DD     00000003 
                                          DD     00000001 
     001868            __lcl.00000171     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000169 
                                          DD     __lcl.00000170 
     001884            __lcl.00000170     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFC4 
     001890            __lcl.00000169     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00189C            __lcl.00000168     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000166 
                                          DD     __lcl.00000167 
     0018B8            __lcl.00000167     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFBC 
     0018C4            __lcl.00000166     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0018D0            __lcl.00000163     DB     02H    
                                          DB     'T4'   
                                          DB     00     
     0018D4            __lcl.00000162     DD     __lcl.00000163 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     0018E4            __lcl.00000161     DB     02H    
                                          DB     'T3'   
                                          DB     00     
     0018E8            __lcl.00000160     DD     __lcl.00000161 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     0018F8            __lcl.00000159     DB     02H    
                                          DB     'T2'   
                                          DB     00     
     0018FC            __lcl.00000158     DD     __lcl.00000159 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     00190C            __lcl.00000157     DB     02H    
                                          DB     'T1'   
                                          DB     00     
     001910            __lcl.00000156     DD     __lcl.00000157 
                                          DD     00000014 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
     001920            lab4.synchroandop__protected_body_subpdesc____1 DD __lcl.00000054 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     00000037 
                                          DD     00000037 
                                          DD     0000007B 
                                          DD     00000005 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000155 
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
     001984            __lcl.00000155     DD     0000000C 
                                          DD     lab4.synchroandop.
input__subp_body_subpdesc____1                          
                                          DD     lab4.synchroandop.
csignal__subp_body_subpdesc____1                        
                                          DD     lab4.synchroandop.
endsignal__subp_body_subpdesc____1                      
                                          DD     lab4.synchroandop.
setmo__subp_body_subpdesc____1                          
                                          DD     lab4.synchroandop.
getmo__subp_body_subpdesc____1                          
                                          DD     lab4.synchroandop.setc__subp_body_subpdesc____1
                                                        
                                          DD     lab4.synchroandop.getc__subp_body_subpdesc____1
                                                        
                                          DD     lab4.synchroandop.setb__subp_body_subpdesc____1
                                                        
                                          DD     lab4.synchroandop.getb__subp_body_subpdesc____1
                                                        
                                          DD     lab4.synchroandop.
inputsync__subp_body_subpdesc____1                      
                                          DD     lab4.synchroandop.
csync__subp_body_subpdesc____1                          
                                          DD     lab4.synchroandop.
endsync__subp_body_subpdesc____1                        
     0019B8            lab4.synchroandop.endsync__subp_body_subpdesc____1 DD __lcl.00000043 
                                          DD     0000000D 
                                          DD     __lcl.00000119 
                                          DD     00000077 
                                          DD     00000078 
                                          DD     0000007A 
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
                                          DD     __lcl.00000377 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001A1C            lab4.synchroandop.csync__subp_body_subpdesc____1 DD __lcl.00000042 
                                          DD     0000000C 
                                          DD     __lcl.00000119 
                                          DD     00000072 
                                          DD     00000073 
                                          DD     00000075 
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
                                          DD     __lcl.00000378 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001A80            lab4.synchroandop.inputsync__subp_body_subpdesc____1 DD __lcl.00000041 
                                          DD     0000000B 
                                          DD     __lcl.00000119 
                                          DD     0000006D 
                                          DD     0000006E 
                                          DD     00000070 
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
                                          DD     __lcl.00000379 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001AE4            lab4.synchroandop.getb__subp_body_subpdesc____1 DD __lcl.00000052 
                                          DD     0000000A 
                                          DD     __lcl.00000119 
                                          DD     00000068 
                                          DD     00000069 
                                          DD     0000006B 
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
                                          DD     __lcl.00000380 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001B48            lab4.synchroandop.setb__subp_body_subpdesc____1 DD __lcl.00000051 
                                          DD     00000009 
                                          DD     __lcl.00000119 
                                          DD     00000060 
                                          DD     00000061 
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
                                          DD     __lcl.00000153 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000154 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000381 
                                          DD     00000010 
                                          DD     __lcl.00000001 
     001BAC            __lcl.00000154     DD     00000001 
                                          DD     __lcl.00000152 
     001BB4            __lcl.00000153     DD     00000001 
                                          DD     __lcl.00000037 
                                          DD     __lcl.00000016 
                                          DD     00000000 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     0000000C 
     001BD0            __lcl.00000152     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     00000062 
                                          DD     00000062 
                                          DD     00000066 
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
                                          DD     __lcl.00000150 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000151 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001C34            __lcl.00000151     DD     00000001 
                                          DD     __lcl.00000149 
     001C3C            __lcl.00000150     DD     00000001 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000144 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     001C54            __lcl.00000149     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     00000063 
                                          DD     00000063 
                                          DD     00000065 
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
                                          DD     __lcl.00000148 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001CB8            __lcl.00000148     DD     00000001 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000147 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     001CD0            __lcl.00000147     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000145 
                                          DD     __lcl.00000146 
     001CEC            __lcl.00000146     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     001CF8            __lcl.00000145     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001D04            __lcl.00000144     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000142 
                                          DD     __lcl.00000143 
     001D20            __lcl.00000143     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     001D2C            __lcl.00000142     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001D38            lab4.synchroandop.getc__subp_body_subpdesc____1 DD __lcl.00000050 
                                          DD     00000008 
                                          DD     __lcl.00000119 
                                          DD     0000005B 
                                          DD     0000005C 
                                          DD     0000005E 
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
                                          DD     __lcl.00000382 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001D9C            lab4.synchroandop.setc__subp_body_subpdesc____1 DD __lcl.00000049 
                                          DD     00000007 
                                          DD     __lcl.00000119 
                                          DD     00000055 
                                          DD     00000056 
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
                                          DD     __lcl.00000140 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000141 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000383 
                                          DD     00000008 
                                          DD     __lcl.00000001 
     001E00            __lcl.00000141     DD     00000001 
                                          DD     __lcl.00000139 
     001E08            __lcl.00000140     DD     00000001 
                                          DD     __lcl.00000037 
                                          DD     __lcl.00000016 
                                          DD     00000000 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     0000000C 
     001E24            __lcl.00000139     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     00000057 
                                          DD     00000057 
                                          DD     00000059 
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
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001E88            __lcl.00000138     DD     00000001 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000137 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     001EA0            __lcl.00000137     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000135 
                                          DD     __lcl.00000136 
     001EBC            __lcl.00000136     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     001EC8            __lcl.00000135     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001ED4            lab4.synchroandop.getmo__subp_body_subpdesc____1 DD __lcl.00000048 
                                          DD     00000006 
                                          DD     __lcl.00000119 
                                          DD     00000050 
                                          DD     00000051 
                                          DD     00000053 
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
                                          DD     __lcl.00000384 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001F38            lab4.synchroandop.setmo__subp_body_subpdesc____1 DD __lcl.00000047 
                                          DD     00000005 
                                          DD     __lcl.00000119 
                                          DD     00000048 
                                          DD     00000049 
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
                                          DD     __lcl.00000133 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000134 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000385 
                                          DD     00000010 
                                          DD     __lcl.00000001 
     001F9C            __lcl.00000134     DD     00000001 
                                          DD     __lcl.00000132 
     001FA4            __lcl.00000133     DD     00000001 
                                          DD     __lcl.00000037 
                                          DD     __lcl.00000018 
                                          DD     00000000 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     0000000C 
     001FC0            __lcl.00000132     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     0000004A 
                                          DD     0000004A 
                                          DD     0000004E 
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
                                          DD     __lcl.00000129 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000131 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002024            __lcl.00000131     DD     00000001 
                                          DD     __lcl.00000128 
     00202C            __lcl.00000130     DB     01H    
                                          DB     'i'    
                                          DW     0000   
     002030            __lcl.00000129     DD     00000001 
                                          DD     __lcl.00000130 
                                          DD     __lcl.00000122 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     002048            __lcl.00000128     DB     8 DUP(00) 
                                          DD     __lcl.00000119 
                                          DD     0000004B 
                                          DD     0000004B 
                                          DD     0000004D 
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
                                          DD     __lcl.00000126 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0020AC            __lcl.00000127     DB     01H    
                                          DB     'j'    
                                          DW     0000   
     0020B0            __lcl.00000126     DD     00000001 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000125 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0020C8            __lcl.00000125     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000123 
                                          DD     __lcl.00000124 
     0020E4            __lcl.00000124     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     0020F0            __lcl.00000123     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0020FC            __lcl.00000122     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000120 
                                          DD     __lcl.00000121 
     002118            __lcl.00000121     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     002124            __lcl.00000120     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002130            lab4.synchroandop.endsignal__subp_body_subpdesc____1 DD __lcl.00000046 
                                          DD     00000004 
                                          DD     __lcl.00000119 
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
                                          DD     __lcl.00000386 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002194            lab4.synchroandop.csignal__subp_body_subpdesc____1 DD __lcl.00000045 
                                          DD     00000003 
                                          DD     __lcl.00000119 
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
                                          DD     __lcl.00000387 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0021F8            __lcl.00000119     DB     0BH    
                                          DB     '..\lab4.adb' 
     002204            lab4.synchroandop.input__subp_body_subpdesc____1 DD __lcl.00000044 
                                          DD     00000002 
                                          DD     __lcl.00000119 
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
                                          DD     __lcl.00000388 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002268            __lcl.00000118     DB     0CH    
                                          DB     'Pr_Type_Desc' 
                                          DB     00H,00H,00H 
     002278            __lcl.00000117     DD     __lcl.00000118 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     __lcl.00000109 
                                          DD     00000000 
     002290            __lcl.00000116     DB     10H    
                                          DB     'Compute_Barriers' 
                                          DB     00H,00H,00H 
     0022A4            __lcl.00000115     DB     14H    
                                          DB     'Compute_All_Barriers' 
                                          DB     00H,00H,00H 
     0022BC            __lcl.00000114     DB     0AH    
                                          DB     'Entry_Code' 
                                          DB     00     
     0022C8            __lcl.00000113     DB     10H    
                                          DB     'Depends_On_Count' 
                                          DB     00H,00H,00H 
     0022DC            __lcl.00000112     DB     0CH    
                                          DB     'Handler_List' 
                                          DB     00H,00H,00H 
     0022EC            __lcl.00000111     DB     0EH    
                                          DB     'Max_Name_Index' 
                                          DB     00     
     0022FC            __lcl.00000110     DB     07H    
                                          DB     'PT_Kind' 
     002304            __lcl.00000109     DD     00000007 
                                          DD     __lcl.00000110 
                                          DD     __lcl.00000062 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
                                          DD     00000000 
                                          DD     __lcl.00000111 
                                          DD     __lcl.00000066 
                                          DD     00000004 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
                                          DD     00000000 
                                          DD     __lcl.00000112 
                                          DD     __lcl.00000087 
                                          DD     00000008 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000113 
                                          DD     __lcl.00000093 
                                          DD     0000000C 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000092 
                                          DD     __lcl.00000114 
                                          DD     __lcl.00000096 
                                          DD     00000010 
                                          DD     00000000 
                                          DD     __lcl.00000100 
                                          DD     00000200 
                                          DD     __lcl.00000092 
                                          DD     __lcl.00000115 
                                          DD     __lcl.00000075 
                                          DD     00000014 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000102 
                                          DD     __lcl.00000116 
                                          DD     __lcl.00000096 
                                          DD     00000014 
                                          DD     00000000 
                                          DD     __lcl.00000107 
                                          DD     00000100 
                                          DD     __lcl.00000104 
     0023CC            __lcl.00000108     DD     __lcl.00000092 
                                          DD     00000001 
                                          DD     00000000 
     0023D8            __lcl.00000107     DD     00000001 
                                          DD     __lcl.00000105 
                                          DD     __lcl.00000106 
     0023E4            __lcl.00000106     DD     00000001 
                                          DD     00000002 
     0023EC            __lcl.00000105     DD     00000000 
                                          DD     00000000 
     0023F4            __lcl.00000104     DD     __lcl.00000092 
                                          DD     00000001 
                                          DD     __lcl.00000103 
     002400            __lcl.00000103     DD     00000000 
                                          DD     00000000 
                                          DD     00000002 
     00240C            __lcl.00000102     DD     __lcl.00000092 
                                          DD     00000001 
                                          DD     __lcl.00000101 
     002418            __lcl.00000101     DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
     002424            __lcl.00000100     DD     00000001 
                                          DD     __lcl.00000098 
                                          DD     __lcl.00000099 
     002430            __lcl.00000099     DD     00000001 
                                          DD     00000002 
     002438            __lcl.00000098     DD     00000000 
                                          DD     00000000 
     002440            __lcl.00000097     DB     0AH    
                                          DB     'Code_Array' 
                                          DB     00     
     00244C            __lcl.00000096     DD     __lcl.00000097 
                                          DD     00000011 
                                          DD     0000000E 
                                          DD     __lcl.00000095 
                                          DD     __lcl.00000075 
                                          DD     __lcl.00000094 
     002464            __lcl.00000095     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     002470            __lcl.00000094     DD     00000001 
                                          DD     __lcl.00000066 
     002478            __lcl.00000093     DB     4 DUP(00) 
                                          DD     00000001 
                                          DD     00000002 
     002484            __lcl.00000092     DD     00000000 
                                          DD     00000001 
                                          DD     __lcl.00000091 
     002490            __lcl.00000091     DD     00000000 
                                          DD     00000001 
                                          DD     00000001 
                                          DD     00000002 
     0024A0            __lcl.00000090     DD     00000000 
                                          DD     00000001 
                                          DD     __lcl.00000089 
     0024AC            __lcl.00000089     DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
     0024B8            __lcl.00000088     DB     13H    
                                          DB     'Handler_List_Access' 
     0024CC            __lcl.00000087     DD     __lcl.00000088 
                                          DD     00000003 
                                          DD     0000000D 
                                          DD     __lcl.00000085 
     0024DC            __lcl.00000086     DB     11H    
                                          DB     'Handler_List_Type' 
                                          DW     0000   
     0024F0            __lcl.00000085     DD     __lcl.00000086 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     __lcl.00000082 
                                          DD     00000000 
     002508            __lcl.00000084     DB     07H    
                                          DB     'Handler' 
     002510            __lcl.00000083     DB     0CH    
                                          DB     'Num_Handlers' 
                                          DB     00H,00H,00H 
     002520            __lcl.00000082     DD     00000002 
                                          DD     __lcl.00000083 
                                          DD     __lcl.00000070 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000001 
                                          DD     00000000 
                                          DD     __lcl.00000084 
                                          DD     __lcl.00000077 
                                          DD     00000004 
                                          DD     00000000 
                                          DD     __lcl.00000081 
                                          DD     00000100 
                                          DD     00000000 
     00255C            __lcl.00000081     DD     00000001 
                                          DD     __lcl.00000079 
                                          DD     __lcl.00000080 
     002568            __lcl.00000080     DD     00000001 
                                          DD     00000001 
     002570            __lcl.00000079     DD     00000000 
                                          DD     00000001 
     002578            __lcl.00000078     DB     0DH    
                                          DB     'Handler_Array' 
                                          DW     0000   
     002588            __lcl.00000077     DD     __lcl.00000078 
                                          DD     00000011 
                                          DD     0000000E 
                                          DD     __lcl.00000072 
                                          DD     __lcl.00000075 
                                          DD     __lcl.00000071 
     0025A0            __lcl.00000076     DB     0CH    
                                          DB     'Code_Address' 
                                          DB     00H,00H,00H 
     0025B0            __lcl.00000075     DD     __lcl.00000076 
                                          DD     00000003 
                                          DD     0000000D 
                                          DD     __lcl.00000073 
     0025C0            __lcl.00000074     DB     0AH    
                                          DB     'Raw_Object' 
                                          DB     00     
     0025CC            __lcl.00000073     DD     __lcl.00000074 
                                          DD     00000006 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     00000000 
     0025E4            __lcl.00000072     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     0025F0            __lcl.00000071     DD     00000001 
                                          DD     __lcl.00000070 
     0025F8            __lcl.00000070     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000067 
                                          DD     __lcl.00000068 
                                          DD     __lcl.00000069 
     002614            __lcl.00000069     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     002620            __lcl.00000068     DD     00000008 
                                          DD     00000003 
                                          DD     00000000 
     00262C            __lcl.00000067     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     002638            __lcl.00000066     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000063 
                                          DD     __lcl.00000064 
                                          DD     __lcl.00000065 
     002654            __lcl.00000065     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     002660            __lcl.00000064     DD     00000008 
                                          DD     00000003 
                                          DD     00000000 
     00266C            __lcl.00000063     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     002678            __lcl.00000062     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000059 
                                          DD     __lcl.00000060 
                                          DD     __lcl.00000061 
     002694            __lcl.00000061     DD     00000003 
                                          DD     00000001 
                                          DB     02     
                                          DB     00H,00H,00H 
     0026A0            __lcl.00000060     DD     00000003 
                                          DD     00000001 
                                          DB     00     
                                          DB     00H,00H,00H 
     0026AC            __lcl.00000059     DB     4 DUP(00) 
                                          DD     00000005 
                                          DD     00000003 
                                          DD     00000003 
                                          DD     __lcl.00000055 
     0026C0            __lcl.00000058     DB     08H    
                                          DB     'PT_Large' 
                                          DB     00H,00H,00H 
     0026CC            __lcl.00000057     DB     08H    
                                          DB     'PT_Small' 
                                          DB     00H,00H,00H 
     0026D8            __lcl.00000056     DB     0DH    
                                          DB     'PT_No_Entries' 
                                          DW     0000   
     0026E8            __lcl.00000055     DD     __lcl.00000056 
                                          DD     00000000 
                                          DD     __lcl.00000057 
                                          DD     00000001 
                                          DD     __lcl.00000058 
                                          DD     00000002 
     002700            __lcl.00000054     DB     0CH    
                                          DB     'SynchroAndOP' 
                                          DB     00H,00H,00H 
     002710            __lcl.00000053     DD     __lcl.00000054 
                                          DD     00000020 
                                          DD     __lcl.00000029 
                                          DD     __lcl.00000040 
     002720            __lcl.00000052     DB     04H    
                                          DB     'GetB' 
                                          DB     00H,00H,00H 
     002728            __lcl.00000051     DB     04H    
                                          DB     'SetB' 
                                          DB     00H,00H,00H 
     002730            __lcl.00000050     DB     04H    
                                          DB     'GetC' 
                                          DB     00H,00H,00H 
     002738            __lcl.00000049     DB     04H    
                                          DB     'SetC' 
                                          DB     00H,00H,00H 
     002740            __lcl.00000048     DB     05H    
                                          DB     'GetMO' 
                                          DW     0000   
     002748            __lcl.00000047     DB     05H    
                                          DB     'SetMO' 
                                          DW     0000   
     002750            __lcl.00000046     DB     09H    
                                          DB     'EndSignal' 
                                          DW     0000   
     00275C            __lcl.00000045     DB     07H    
                                          DB     'CSignal' 
     002764            __lcl.00000044     DB     05H    
                                          DB     'Input' 
                                          DW     0000   
     00276C            __lcl.00000043     DB     07H    
                                          DB     'EndSync' 
     002774            __lcl.00000042     DB     05H    
                                          DB     'CSync' 
                                          DW     0000   
     00277C            __lcl.00000041     DB     09H    
                                          DB     'InputSync' 
                                          DW     0000   
     002788            __lcl.00000040     DD     0000000C 
                                          DD     __lcl.00000041 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000042 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000043 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000044 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000045 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000046 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000047 
                                          DD     00000000 
                                          DD     __lcl.00000036 
                                          DD     __lcl.00000048 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000049 
                                          DD     00000000 
                                          DD     __lcl.00000038 
                                          DD     __lcl.00000050 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000051 
                                          DD     00000000 
                                          DD     __lcl.00000039 
                                          DD     __lcl.00000052 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00281C            __lcl.00000039     DD     00000001 
                                          DD     __lcl.00000037 
                                          DD     __lcl.00000016 
                                          DB     4 DUP(00) 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     002838            __lcl.00000038     DD     00000001 
                                          DD     __lcl.00000037 
                                          DD     __lcl.00000016 
                                          DB     4 DUP(00) 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     002854            __lcl.00000037     DB     01H    
                                          DB     'M'    
                                          DW     0000   
     002858            __lcl.00000036     DD     00000001 
                                          DD     __lcl.00000037 
                                          DD     __lcl.00000018 
                                          DB     4 DUP(00) 
                                          DD     00010100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     002874            __lcl.00000035     DB     01H    
                                          DB     'C'    
                                          DW     0000   
     002878            __lcl.00000034     DB     02H    
                                          DB     'MO'   
                                          DB     00     
     00287C            __lcl.00000033     DB     01H    
                                          DB     'B'    
                                          DW     0000   
     002880            __lcl.00000032     DB     02H    
                                          DB     'F3'   
                                          DB     00     
     002884            __lcl.00000031     DB     02H    
                                          DB     'F2'   
                                          DB     00     
     002888            __lcl.00000030     DB     02H    
                                          DB     'F1'   
                                          DB     00     
     00288C            __lcl.00000029     DD     00000006 
                                          DD     __lcl.00000030 
                                          DD     __lcl.00000005 
                                          DD     00000048 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000005 
                                          DD     0000004C 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000032 
                                          DD     __lcl.00000005 
                                          DD     00000050 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000033 
                                          DD     __lcl.00000016 
                                          DD     00000060 
                                          DD     00000000 
                                          DD     __lcl.00000022 
                                          DD     00000100 
                                          DD     00000000 
                                          DD     __lcl.00000034 
                                          DD     __lcl.00000018 
                                          DD     00000054 
                                          DD     00000000 
                                          DD     __lcl.00000025 
                                          DD     00000200 
                                          DD     00000000 
                                          DD     __lcl.00000035 
                                          DD     __lcl.00000016 
                                          DD     00000058 
                                          DD     00000000 
                                          DD     __lcl.00000028 
                                          DD     00000200 
                                          DD     00000000 
     002938            __lcl.00000028     DD     00000001 
                                          DD     __lcl.00000026 
                                          DD     __lcl.00000027 
     002944            __lcl.00000027     DD     00000002 
                                          DD     package1.vec__constrained_array____1 
     00294C            __lcl.00000026     DD     00000000 
                                          DD     00000001 
     002954            __lcl.00000025     DD     00000001 
                                          DD     __lcl.00000023 
                                          DD     __lcl.00000024 
     002960            __lcl.00000024     DD     00000002 
                                          DD     package1.matr__constrained_array____1 
     002968            __lcl.00000023     DD     00000000 
                                          DD     00000001 
     002970            __lcl.00000022     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000021 
     00297C            __lcl.00000021     DD     00000002 
                                          DD     package1.vec__constrained_array____1 
     002984            __lcl.00000020     DD     00000000 
                                          DD     00000001 
     00298C            __lcl.00000019     DB     04H    
                                          DB     'Matr' 
                                          DB     00H,00H,00H 
     002994            __lcl.00000018     DD     __lcl.00000019 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000010 
                                          DD     __lcl.00000016 
                                          DD     __lcl.00000009 
     0029AC            __lcl.00000017     DB     03H    
                                          DB     'Vec'  
     0029B0            __lcl.00000016     DD     __lcl.00000017 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000015 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000014 
     0029C8            __lcl.00000015     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     0029D4            __lcl.00000014     DD     00000001 
                                          DD     __lcl.00000013 
     0029DC            __lcl.00000013     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000011 
                                          DD     __lcl.00000012 
     0029F8            __lcl.00000012     DD     00000008 
                                          DD     00000007 
                                          DD     package1.vec__constrained_array____1 
     002A04            __lcl.00000011     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002A10            __lcl.00000010     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__COMP_SU_SIZE 
     002A1C            __lcl.00000009     DD     00000001 
                                          DD     __lcl.00000008 
     002A24            __lcl.00000008     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000007 
     002A40            __lcl.00000007     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__constrained_array____1 
     002A4C            __lcl.00000006     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002A58            __lcl.00000005     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000003 
                                          DD     __lcl.00000004 
     002A74            __lcl.00000004     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     002A80            __lcl.00000003     DD     00000008 
                                          DD     00000003 
                                          DD     80000000 
     002A8C            __lcl.00000002     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     002A98            __lcl.00000001     DD     00000000 
; ********* End of segment, Total Size = 10908


; ************* .av_dbgi segment :
                                          ALIGN 4       
     002A9C            __lcl.00000389     DB     1D     
                                          DB     'D:\ABPRO2-4-OLIAaaaa\lab4.adb' 
; ********* End of segment, Total Size = 10938

                       ;                                
                       CODE               ENDS          

