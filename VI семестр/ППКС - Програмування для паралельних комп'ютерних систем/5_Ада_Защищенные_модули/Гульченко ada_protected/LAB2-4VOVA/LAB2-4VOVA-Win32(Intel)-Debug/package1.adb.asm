
                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT Package1 
                       ;                                
                       Listing of Generated Code        
                       ;                                
                       EXCEP              RECORD FLAG:1, SPSAV:1, IPCOUNT:6 
                       ;                                
                       CODE               SEGMENT PUBLIC BYTE 'CODE' USE32 ;  Package1
                                          ASSUME CS:CODE 
                       ;                                
                       ;  Start of procedure package1__elab_spec   
                       ;                                
                                          PUBLIC package1__elab_spec 
                       package1__elab_spec PROC  NEAR   
;  Source Line # 5
    5| 000000 55                          PUSH   EBP    
    5| 000001 8BEC                        MOV    EBP, ESP 
;  Source Line # 8
    8| 000003 8B05                        MOV    EAX, package1.n 
    8| 000005 00000000                                  
    8| 000009 99                          CDQ           
    8| 00000A F73D                        IDIV   DWORD PTR package1.p 
    8| 00000C 00000000                                  
    8| 000010 8905                        MOV    package1.h, EAX 
    8| 000012 00000000                                  
;  Source Line # 10
   10| 000016 8B1D                        MOV    EBX, package1.n 
   10| 000018 00000000                                  
   10| 00001C 891D                        MOV    package1.vec__constrained_array____1, EBX 
   10| 00001E 00000000                                  
;  Source Line # 11
   11| 000022 8B0D                        MOV    ECX, package1.n 
   11| 000024 00000000                                  
   11| 000028 890D                        MOV    package1.matr__constrained_array____1, ECX 
   11| 00002A 00000000                                  
   11| 00002E 8B35                        MOV    ESI, package1.vec__constrained_array____1 
   11| 000030 00000000                                  
   11| 000034 83EE                        SUB    ESI, 1 
   11| 000036 01                                        
   11| 000037 7D                          JGE    SHORT L2 
   11| 000038 03                                        
   11| 000039 33F6                        XOR    ESI, ESI 
   11| 00003B 4E                          DEC    ESI    
   11|                 L2:                              
   11| 00003C CE                          INTO          
   11| 00003D 46                          INC    ESI    
   11| 00003E CE                          INTO          
   11| 00003F D1E6                        SHL    ESI, 1 
   11| 000041 CE                          INTO          
   11| 000042 D1E6                        SHL    ESI, 1 
   11| 000044 CE                          INTO          
   11| 000045 8935                        MOV    package1.matr__COMP_SU_SIZE, ESI 
   11| 000047 00000000                                  
;  Source Line # 19
   19| 00004B 8BE5                        MOV    ESP, EBP 
   19| 00004D 5D                          POP    EBP    
   19| 00004E C3                          RET           
                       ;                                
                       package1__elab_spec ENDP         


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000025     DD     00000601 
                                          DD     00000005 
                                          DD     package1__elab_spec 
                                          DD     __lcl.00000026 
                                          DD     00000008 
                                          DD     package1__elab_spec+00000003H 
                                          DD     __lcl.00000026 
                                          DD     0000000A 
                                          DD     package1__elab_spec+00000016H 
                                          DD     __lcl.00000026 
                                          DD     0000000B 
                                          DD     package1__elab_spec+00000022H 
                                          DD     __lcl.00000026 
                                          DD     00000013 
                                          DD     package1__elab_spec+0000004BH 
                                          DD     __lcl.00000026 
                                          DD     00000013 
                                          DD     package1__elab_spec+0000004BH 
                                          DD     __lcl.00000026 
; ********* End of segment, Total Size = 76


; ************* Uninitialized part of the global segment :
                                          ALIGN 4       
     000000            package1.matr__COMP_SU_SIZE DD DUP(?) 
     000004            package1.matr__constrained_array____1 DD DUP(?) 
     000008            package1.vec__constrained_array____1 DD DUP(?) 
     00000C            package1.h         DD     DUP(?) 
; ********* End of segment, Total Size = 16


; ************* Initialized part of the global segment :
                                          ALIGN 4       
     000000            package1.matr_input__elab_bool DB 00 
     000001            package1.vec_input__elab_bool DB 00 
     000002            package1.matr_print__elab_bool DB 00 
     000003            package1.vec_print__elab_bool DB 00 
     000004            package1.constant_out__elab_bool DB 00 
                                          DB     00H,00H,00H 
     000008            package1.p         DD     00000004 
     00000C            package1.n         DD     00000004 
; ********* End of segment, Total Size = 16


; ************* .av_dbgr segment :
                                          ALIGN 4       
                                          DD     00000000 
                                          DD     00000000 
     000008            package1__rootpart____1 DD package1__pkg_subpdesc____1 
; ********* End of segment, Total Size = 16


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000024     DB     0FH    
                                          DB     '..\package1.adb' 
     000010            __lcl.00000023     DB     08H    
                                          DB     'Package1' 
                                          DB     00H,00H,00H 
     00001C            __lcl.00000022     DB     01H    
                                          DB     'N'    
                                          DW     0000   
     000020            __lcl.00000021     DB     01H    
                                          DB     'P'    
                                          DW     0000   
     000024            __lcl.00000020     DB     01H    
                                          DB     'H'    
                                          DW     0000   
     000028            __lcl.00000019     DD     00000003 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     package1.h 
                                          DD     00000000 
                                          DD     __lcl.00000021 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     package1.p 
                                          DD     00000000 
                                          DD     __lcl.00000022 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     package1.n 
                                          DD     00000000 
     000068            __lcl.00000018     DD     00000002 
                                          DD     __lcl.00000017 
                                          DD     package1.matr__typeform 
                                          DD     __lcl.00000011 
                                          DD     package1.vec__typeform 
     00007C            package1__pkg_subpdesc____1 DD __lcl.00000023 
                                          DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     00000005 
                                          DD     00000005 
                                          DD     00000013 
                                          DD     00000001 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000018 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000019 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000025 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0000DC            __lcl.00000017     DB     04H    
                                          DB     'Matr' 
                                          DB     00H,00H,00H 
     0000E4            package1.matr__typeform DD __lcl.00000017 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000016 
                                          DD     package1.vec__typeform 
                                          DD     __lcl.00000015 
     0000FC            __lcl.00000016     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__COMP_SU_SIZE 
     000108            __lcl.00000015     DD     00000001 
                                          DD     __lcl.00000014 
     000110            __lcl.00000014     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000012 
                                          DD     __lcl.00000013 
     00012C            __lcl.00000013     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__constrained_array____1 
     000138            __lcl.00000012     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000144            __lcl.00000011     DB     03H    
                                          DB     'Vec'  
     000148            package1.vec__typeform DD __lcl.00000011 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000010 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000009 
     000160            __lcl.00000010     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     00016C            __lcl.00000009     DD     00000001 
                                          DD     __lcl.00000008 
     000174            __lcl.00000008     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000007 
     000190            __lcl.00000007     DD     00000008 
                                          DD     00000007 
                                          DD     package1.vec__constrained_array____1 
     00019C            __lcl.00000006     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0001A8            __lcl.00000005     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000003 
                                          DD     __lcl.00000004 
     0001C4            __lcl.00000004     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     0001D0            __lcl.00000003     DD     00000008 
                                          DD     00000003 
                                          DD     80000000 
     0001DC            __lcl.00000002     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     0001E8            __lcl.00000001     DD     00000000 
; ********* End of segment, Total Size = 492


; ************* .av_dbgi segment :
                                          ALIGN 4       
     0001EC            __lcl.00000026     DB     1A     
                                          DB     'D:\LAB2-4VOVA\package1.adb' 
; ********* End of segment, Total Size = 519

                       ;                                
                       CODE               ENDS          

                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT Package1 
                       ;                                
                       Listing of Generated Code        
                       ;                                
                       EXCEP              RECORD FLAG:1, SPSAV:1, IPCOUNT:6 
                       ;                                
                       CODE               SEGMENT PUBLIC BYTE 'CODE' USE32 ;  Package1
                                          ASSUME CS:CODE 
                       ;                                
                       ;  Start of procedure package1.matr_input   
                       ;                                
                                          PUBLIC package1.matr_input 
                       package1.matr_input PROC  NEAR   
;  Source Line # 24
   24| 000000 55                          PUSH   EBP    
   24| 000001 8BEC                        MOV    EBP, ESP 
   24| 000003 83EC                        SUB    ESP, 16 
   24| 000005 10                                        
   24| 000006 803D                        CMP    BYTE PTR package1.matr_input__elab_bool, 0 
   24| 000008 00000000                                  
   24| 00000C 00                                        
   24|                 L17:                             
   24| 00000D 0F84                        JE     L18    
   24| 00000F 8B000000                                  
;  Source Line # 24
   24| 000013 8B05                        MOV    EAX, package1.n 
   24| 000015 00000000                                  
   24| 000019 8945                        MOV    [EBP-16], EAX 
   24| 00001B F0                                        
;  Source Line # 26
   26| 00001C 837D                        CMP    DWORD PTR [EBP-16], 0 
   26| 00001E F0                                        
   26| 00001F 00                                        
   26| 000020 0F8E                        JLE    L6     
   26| 000022 72000000                                  
   26| 000026 C745                        MOV    DWORD PTR [EBP-12], 1 
   26| 000028 F4                                        
   26| 000029 01000000                                  
   26|                 L9:                              
   26| 00002D 8B05                        MOV    EAX, package1.n 
   26| 00002F 00000000                                  
   26| 000033 8945                        MOV    [EBP-8], EAX 
   26| 000035 F8                                        
;  Source Line # 27
   27| 000036 837D                        CMP    DWORD PTR [EBP-8], 0 
   27| 000038 F8                                        
   27| 000039 00                                        
   27| 00003A 7E                          JLE    SHORT L10 
   27| 00003B 4B                                        
   27| 00003C C745                        MOV    DWORD PTR [EBP-4], 1 
   27| 00003E FC                                        
   27| 00003F 01000000                                  
   27|                 L12:                             
;  Source Line # 28
   28| 000043 8B45                        MOV    EAX, [EBP+8] ;  M
   28| 000045 08                                        
   28| 000046 8B5D                        MOV    EBX, [EBP-12] 
   28| 000048 F4                                        
   28| 000049 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
   28| 00004B 00000000                                  
   28|                 L19:                             
   28| 00004F 7F                          JG     SHORT L20 
   28| 000050 4F                                        
   28| 000051 8D5B                        LEA    EBX, [EBX-1] 
   28| 000053 FF                                        
   28| 000054 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   28| 000057 00000000                                  
   28| 00005B 8B4D                        MOV    ECX, [EBP-4] 
   28| 00005D FC                                        
   28| 00005E 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
   28| 000060 00000000                                  
   28|                 L21:                             
   28| 000064 7F                          JG     SHORT L22 
   28| 000065 46                                        
   28| 000066 8D0C8D                      LEA    ECX, [4*ECX-4] 
   28| 000069 FCFFFFFF                                  
   28| 00006D 03D9                        ADD    EBX, ECX 
   28| 00006F C70418                      MOV    DWORD PTR [EAX+EBX+0], 1 
   28| 000072 01000000                                  
;  Source Line # 29
   29| 000076 8B55                        MOV    EDX, [EBP-8] 
   29| 000078 F8                                        
   29| 000079 3955                        CMP    [EBP-4], EDX 
   29| 00007B FC                                        
   29| 00007C 74                          JE     SHORT L10 
   29| 00007D 09                                        
   29| 00007E 8B45                        MOV    EAX, [EBP-4] 
   29| 000080 FC                                        
   29| 000081 40                          INC    EAX    
   29| 000082 8945                        MOV    [EBP-4], EAX 
   29| 000084 FC                                        
   29| 000085 EB                          JMP    SHORT L12 
   29| 000086 BC                                        
   29|                 L10:                             
;  Source Line # 30
   30| 000087 8B45                        MOV    EAX, [EBP-16] 
   30| 000089 F0                                        
   30| 00008A 3945                        CMP    [EBP-12], EAX 
   30| 00008C F4                                        
   30| 00008D 74                          JE     SHORT L6 
   30| 00008E 09                                        
   30| 00008F 8B45                        MOV    EAX, [EBP-12] 
   30| 000091 F4                                        
   30| 000092 40                          INC    EAX    
   30| 000093 8945                        MOV    [EBP-12], EAX 
   30| 000095 F4                                        
   30| 000096 EB                          JMP    SHORT L9 
   30| 000097 95                                        
   30|                 L6:                              
;  Source Line # 31
   31| 000098 8BE5                        MOV    ESP, EBP 
   31| 00009A 5D                          POP    EBP    
   31| 00009B C2                          RET    4      
   31| 00009C 0400                                      
   31|                 L18:                             
   31| 00009E F6                          DB     246    
   31| 00009F F4                          DB     244    
   31|                 L20:                             
   31| 0000A0 8D05                        LEA    EAX, L19+5 
   31| 0000A2 54000000                                  
   31| 0000A6 50                          PUSH   EAX    
   31| 0000A7 E9                          JMP    rts_raise_constraint_error 
   31| 0000A8 00000000                                  
   31|                 L22:                             
   31| 0000AC 8D05                        LEA    EAX, L21+5 
   31| 0000AE 69000000                                  
   31| 0000B2 50                          PUSH   EAX    
   31| 0000B3 E9                          JMP    rts_raise_constraint_error 
   31| 0000B4 00000000                                  
                       ;                                
                       package1.matr_input ENDP         


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000101     DD     00000901 
                                          DD     00000018 
                                          DD     package1.matr_input 
                                          DD     __lcl.00000102 
                                          DD     00000018 
                                          DD     package1.matr_input+00000013H 
                                          DD     __lcl.00000102 
                                          DD     0000001A 
                                          DD     package1.matr_input+0000001CH 
                                          DD     __lcl.00000102 
                                          DD     0000001B 
                                          DD     package1.matr_input+00000036H 
                                          DD     __lcl.00000102 
                                          DD     0000001C 
                                          DD     package1.matr_input+00000043H 
                                          DD     __lcl.00000102 
                                          DD     0000001D 
                                          DD     package1.matr_input+00000076H 
                                          DD     __lcl.00000102 
                                          DD     0000001E 
                                          DD     package1.matr_input+00000087H 
                                          DD     __lcl.00000102 
                                          DD     0000001F 
                                          DD     package1.matr_input+00000098H 
                                          DD     __lcl.00000102 
                                          DD     0000001F 
                                          DD     package1.matr_input+000000B4H 
                                          DD     __lcl.00000102 
; ********* End of segment, Total Size = 112

                       ;                                
                       ;  Start of procedure package1.vec_input   
                       ;                                
                                          PUBLIC package1.vec_input 
                       package1.vec_input PROC   NEAR   
;  Source Line # 33
   33| 000000 55                          PUSH   EBP    
   33| 000001 8BEC                        MOV    EBP, ESP 
   33| 000003 83EC                        SUB    ESP, 8 
   33| 000005 08                                        
   33| 000006 803D                        CMP    BYTE PTR package1.vec_input__elab_bool, 0 
   33| 000008 00000000                                  
   33| 00000C 00                                        
   33|                 L12:                             
   33| 00000D 74                          JE     SHORT L13 
   33| 00000E 43                                        
;  Source Line # 33
   33| 00000F 8B05                        MOV    EAX, package1.n 
   33| 000011 00000000                                  
   33| 000015 8945                        MOV    [EBP-8], EAX 
   33| 000017 F8                                        
;  Source Line # 35
   35| 000018 837D                        CMP    DWORD PTR [EBP-8], 0 
   35| 00001A F8                                        
   35| 00001B 00                                        
   35| 00001C 7E                          JLE    SHORT L6 
   35| 00001D 2E                                        
   35| 00001E C745                        MOV    DWORD PTR [EBP-4], 1 
   35| 000020 FC                                        
   35| 000021 01000000                                  
   35|                 L9:                              
;  Source Line # 36
   36| 000025 8B45                        MOV    EAX, [EBP+8] ;  V
   36| 000027 08                                        
   36| 000028 8B5D                        MOV    EBX, [EBP-4] 
   36| 00002A FC                                        
   36| 00002B 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
   36| 00002D 00000000                                  
   36|                 L14:                             
   36| 000031 7F                          JG     SHORT L15 
   36| 000032 21                                        
   36| 000033 C74498                      MOV    DWORD PTR [EAX+4*EBX-4], 1 
   36| 000036 FC                                        
   36| 000037 01000000                                  
;  Source Line # 37
   37| 00003B 8B4D                        MOV    ECX, [EBP-8] 
   37| 00003D F8                                        
   37| 00003E 394D                        CMP    [EBP-4], ECX 
   37| 000040 FC                                        
   37| 000041 74                          JE     SHORT L6 
   37| 000042 09                                        
   37| 000043 8B45                        MOV    EAX, [EBP-4] 
   37| 000045 FC                                        
   37| 000046 40                          INC    EAX    
   37| 000047 8945                        MOV    [EBP-4], EAX 
   37| 000049 FC                                        
   37| 00004A EB                          JMP    SHORT L9 
   37| 00004B D9                                        
   37|                 L6:                              
;  Source Line # 38
   38| 00004C 8BE5                        MOV    ESP, EBP 
   38| 00004E 5D                          POP    EBP    
   38| 00004F C2                          RET    4      
   38| 000050 0400                                      
   38|                 L13:                             
   38| 000052 F6                          DB     246    
   38| 000053 F4                          DB     244    
   38|                 L15:                             
   38| 000054 8D05                        LEA    EAX, L14+5 
   38| 000056 36000000                                  
   38| 00005A 50                          PUSH   EAX    
   38| 00005B E9                          JMP    rts_raise_constraint_error 
   38| 00005C 00000000                                  
                       ;                                
                       package1.vec_input ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000100     DD     00000701 
                                          DD     00000021 
                                          DD     package1.vec_input 
                                          DD     __lcl.00000102 
                                          DD     00000021 
                                          DD     package1.vec_input+0000000FH 
                                          DD     __lcl.00000102 
                                          DD     00000023 
                                          DD     package1.vec_input+00000018H 
                                          DD     __lcl.00000102 
                                          DD     00000024 
                                          DD     package1.vec_input+00000025H 
                                          DD     __lcl.00000102 
                                          DD     00000025 
                                          DD     package1.vec_input+0000003BH 
                                          DD     __lcl.00000102 
                                          DD     00000026 
                                          DD     package1.vec_input+0000004CH 
                                          DD     __lcl.00000102 
                                          DD     00000026 
                                          DD     package1.vec_input+0000005CH 
                                          DD     __lcl.00000102 
; ********* End of segment, Total Size = 88

                       ;                                
                       ;  Start of procedure package1.constant_out   
                       ;                                
                                          PUBLIC package1.constant_out 
                       package1.constant_out PROC NEAR  
;  Source Line # 40
   40| 000000 55                          PUSH   EBP    
   40| 000001 8BEC                        MOV    EBP, ESP 
   40| 000003 803D                        CMP    BYTE PTR package1.constant_out__elab_bool, 0 
   40| 000005 00000000                                  
   40| 000009 00                                        
   40|                 L7:                              
   40| 00000A 74                          JE     SHORT L8 
   40| 00000B 1F                                        
;  Source Line # 42
   42| 00000C 0FB605                      MOVZX  EAX, BYTE PTR ada.integer_text_io.default_base
   42| 00000F 00000000                                  
   42| 000013 50                          PUSH   EAX    
   42| 000014 6A                          PUSH   4      
   42| 000015 04                                        
   42| 000016 FF75                        PUSH   DWORD PTR [EBP+8] ;  a
   42| 000018 08                                        
   42| 000019 E8                          CALL   ada.integer_text_io.put__2 
   42| 00001A 00000000                                  
;  Source Line # 43
   43| 00001E 6A                          PUSH   1      
   43| 00001F 01                                        
   43| 000020 E8                          CALL   ada.text_io.new_line__2 
   43| 000021 00000000                                  
;  Source Line # 44
   44| 000025 8BE5                        MOV    ESP, EBP 
   44| 000027 5D                          POP    EBP    
   44| 000028 C2                          RET    4      
   44| 000029 0400                                      
   44|                 L8:                              
   44| 00002B F6                          DB     246    
   44| 00002C F4                          DB     244    
                       ;                                
                       package1.constant_out ENDP       

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000099     DD     00000501 
                                          DD     00000028 
                                          DD     package1.constant_out 
                                          DD     __lcl.00000102 
                                          DD     0000002A 
                                          DD     package1.constant_out+0000000CH 
                                          DD     __lcl.00000102 
                                          DD     0000002B 
                                          DD     package1.constant_out+0000001EH 
                                          DD     __lcl.00000102 
                                          DD     0000002C 
                                          DD     package1.constant_out+00000025H 
                                          DD     __lcl.00000102 
                                          DD     0000002C 
                                          DD     package1.constant_out+00000029H 
                                          DD     __lcl.00000102 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure package1.vec_print   
                       ;                                
                                          PUBLIC package1.vec_print 
                       package1.vec_print PROC   NEAR   
;  Source Line # 46
   46| 000000 55                          PUSH   EBP    
   46| 000001 8BEC                        MOV    EBP, ESP 
   46| 000003 83EC                        SUB    ESP, 8 
   46| 000005 08                                        
   46| 000006 803D                        CMP    BYTE PTR package1.vec_print__elab_bool, 0 
   46| 000008 00000000                                  
   46| 00000C 00                                        
   46|                 L12:                             
   46| 00000D 74                          JE     SHORT L13 
   46| 00000E 4E                                        
;  Source Line # 46
   46| 00000F 8B05                        MOV    EAX, package1.n 
   46| 000011 00000000                                  
   46| 000015 8945                        MOV    [EBP-8], EAX 
   46| 000017 F8                                        
;  Source Line # 48
   48| 000018 837D                        CMP    DWORD PTR [EBP-8], 0 
   48| 00001A F8                                        
   48| 00001B 00                                        
   48| 00001C 7E                          JLE    SHORT L6 
   48| 00001D 39                                        
   48| 00001E C745                        MOV    DWORD PTR [EBP-4], 1 
   48| 000020 FC                                        
   48| 000021 01000000                                  
   48|                 L9:                              
;  Source Line # 49
   49| 000025 0FB605                      MOVZX  EAX, BYTE PTR ada.integer_text_io.default_base
   49| 000028 00000000                                  
   49| 00002C 50                          PUSH   EAX    
   49| 00002D 6A                          PUSH   4      
   49| 00002E 04                                        
   49| 00002F 8B5D                        MOV    EBX, [EBP+8] ;  v
   49| 000031 08                                        
   49| 000032 8B4D                        MOV    ECX, [EBP-4] 
   49| 000034 FC                                        
   49| 000035 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
   49| 000037 00000000                                  
   49|                 L14:                             
   49| 00003B 7F                          JG     SHORT L15 
   49| 00003C 22                                        
   49| 00003D FF748B                      PUSH   DWORD PTR [EBX+4*ECX-4] 
   49| 000040 FC                                        
   49| 000041 E8                          CALL   ada.integer_text_io.put__2 
   49| 000042 00000000                                  
;  Source Line # 50
   50| 000046 8B55                        MOV    EDX, [EBP-8] 
   50| 000048 F8                                        
   50| 000049 3955                        CMP    [EBP-4], EDX 
   50| 00004B FC                                        
   50| 00004C 74                          JE     SHORT L6 
   50| 00004D 09                                        
   50| 00004E 8B45                        MOV    EAX, [EBP-4] 
   50| 000050 FC                                        
   50| 000051 40                          INC    EAX    
   50| 000052 8945                        MOV    [EBP-4], EAX 
   50| 000054 FC                                        
   50| 000055 EB                          JMP    SHORT L9 
   50| 000056 CE                                        
   50|                 L6:                              
;  Source Line # 51
   51| 000057 8BE5                        MOV    ESP, EBP 
   51| 000059 5D                          POP    EBP    
   51| 00005A C2                          RET    4      
   51| 00005B 0400                                      
   51|                 L13:                             
   51| 00005D F6                          DB     246    
   51| 00005E F4                          DB     244    
   51|                 L15:                             
   51| 00005F 8D05                        LEA    EAX, L14+5 
   51| 000061 40000000                                  
   51| 000065 50                          PUSH   EAX    
   51| 000066 E9                          JMP    rts_raise_constraint_error 
   51| 000067 00000000                                  
                       ;                                
                       package1.vec_print ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000098     DD     00000701 
                                          DD     0000002E 
                                          DD     package1.vec_print 
                                          DD     __lcl.00000102 
                                          DD     0000002E 
                                          DD     package1.vec_print+0000000FH 
                                          DD     __lcl.00000102 
                                          DD     00000030 
                                          DD     package1.vec_print+00000018H 
                                          DD     __lcl.00000102 
                                          DD     00000031 
                                          DD     package1.vec_print+00000025H 
                                          DD     __lcl.00000102 
                                          DD     00000032 
                                          DD     package1.vec_print+00000046H 
                                          DD     __lcl.00000102 
                                          DD     00000033 
                                          DD     package1.vec_print+00000057H 
                                          DD     __lcl.00000102 
                                          DD     00000033 
                                          DD     package1.vec_print+00000067H 
                                          DD     __lcl.00000102 
; ********* End of segment, Total Size = 88

                       ;                                
                       ;  Start of procedure package1.matr_print   
                       ;                                
                                          PUBLIC package1.matr_print 
                       package1.matr_print PROC  NEAR   
;  Source Line # 53
   53| 000000 55                          PUSH   EBP    
   53| 000001 8BEC                        MOV    EBP, ESP 
   53| 000003 83EC                        SUB    ESP, 8 
   53| 000005 08                                        
   53| 000006 803D                        CMP    BYTE PTR package1.matr_print__elab_bool, 0 
   53| 000008 00000000                                  
   53| 00000C 00                                        
   53|                 L12:                             
   53| 00000D 74                          JE     SHORT L13 
   53| 00000E 55                                        
;  Source Line # 53
   53| 00000F 8B05                        MOV    EAX, package1.n 
   53| 000011 00000000                                  
   53| 000015 8945                        MOV    [EBP-8], EAX 
   53| 000017 F8                                        
;  Source Line # 55
   55| 000018 837D                        CMP    DWORD PTR [EBP-8], 0 
   55| 00001A F8                                        
   55| 00001B 00                                        
   55| 00001C 7E                          JLE    SHORT L6 
   55| 00001D 40                                        
   55| 00001E C745                        MOV    DWORD PTR [EBP-4], 1 
   55| 000020 FC                                        
   55| 000021 01000000                                  
   55|                 L9:                              
;  Source Line # 56
   56| 000025 8B45                        MOV    EAX, [EBP+8] ;  m
   56| 000027 08                                        
   56| 000028 8B5D                        MOV    EBX, [EBP-4] 
   56| 00002A FC                                        
   56| 00002B 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
   56| 00002D 00000000                                  
   56|                 L14:                             
   56| 000031 7F                          JG     SHORT L15 
   56| 000032 33                                        
   56| 000033 8D5B                        LEA    EBX, [EBX-1] 
   56| 000035 FF                                        
   56| 000036 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   56| 000039 00000000                                  
   56| 00003D 8D0418                      LEA    EAX, [EAX+EBX+0] 
   56| 000040 50                          PUSH   EAX    
   56| 000041 E8                          CALL   package1.vec_print 
   56| 000042 00000000                                  
;  Source Line # 57
   57| 000046 6A                          PUSH   1      
   57| 000047 01                                        
   57| 000048 E8                          CALL   ada.text_io.new_line__2 
   57| 000049 00000000                                  
;  Source Line # 58
   58| 00004D 8B4D                        MOV    ECX, [EBP-8] 
   58| 00004F F8                                        
   58| 000050 394D                        CMP    [EBP-4], ECX 
   58| 000052 FC                                        
   58| 000053 74                          JE     SHORT L6 
   58| 000054 09                                        
   58| 000055 8B45                        MOV    EAX, [EBP-4] 
   58| 000057 FC                                        
   58| 000058 40                          INC    EAX    
   58| 000059 8945                        MOV    [EBP-4], EAX 
   58| 00005B FC                                        
   58| 00005C EB                          JMP    SHORT L9 
   58| 00005D C7                                        
   58|                 L6:                              
;  Source Line # 59
   59| 00005E 8BE5                        MOV    ESP, EBP 
   59| 000060 5D                          POP    EBP    
   59| 000061 C2                          RET    4      
   59| 000062 0400                                      
   59|                 L13:                             
   59| 000064 F6                          DB     246    
   59| 000065 F4                          DB     244    
   59|                 L15:                             
   59| 000066 8D05                        LEA    EAX, L14+5 
   59| 000068 36000000                                  
   59| 00006C 50                          PUSH   EAX    
   59| 00006D E9                          JMP    rts_raise_constraint_error 
   59| 00006E 00000000                                  
                       ;                                
                       package1.matr_print ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000097     DD     00000801 
                                          DD     00000035 
                                          DD     package1.matr_print 
                                          DD     __lcl.00000102 
                                          DD     00000035 
                                          DD     package1.matr_print+0000000FH 
                                          DD     __lcl.00000102 
                                          DD     00000037 
                                          DD     package1.matr_print+00000018H 
                                          DD     __lcl.00000102 
                                          DD     00000038 
                                          DD     package1.matr_print+00000025H 
                                          DD     __lcl.00000102 
                                          DD     00000039 
                                          DD     package1.matr_print+00000046H 
                                          DD     __lcl.00000102 
                                          DD     0000003A 
                                          DD     package1.matr_print+0000004DH 
                                          DD     __lcl.00000102 
                                          DD     0000003B 
                                          DD     package1.matr_print+0000005EH 
                                          DD     __lcl.00000102 
                                          DD     0000003B 
                                          DD     package1.matr_print+0000006EH 
                                          DD     __lcl.00000102 
; ********* End of segment, Total Size = 100

                       ;                                
                       ;  Start of procedure package1__elab_body   
                       ;                                
                                          PUBLIC package1__elab_body 
                       package1__elab_body PROC  NEAR   
;  Source Line # 22
   22| 000000 55                          PUSH   EBP    
   22| 000001 8BEC                        MOV    EBP, ESP 
;  Source Line # 24
   24| 000003 C605                        MOV    BYTE PTR package1.matr_input__elab_bool, 1 
   24| 000005 00000000                                  
   24| 000009 01                                        
;  Source Line # 33
   33| 00000A C605                        MOV    BYTE PTR package1.vec_input__elab_bool, 1 
   33| 00000C 00000000                                  
   33| 000010 01                                        
;  Source Line # 40
   40| 000011 C605                        MOV    BYTE PTR package1.constant_out__elab_bool, 1 
   40| 000013 00000000                                  
   40| 000017 01                                        
;  Source Line # 46
   46| 000018 C605                        MOV    BYTE PTR package1.vec_print__elab_bool, 1 
   46| 00001A 00000000                                  
   46| 00001E 01                                        
;  Source Line # 53
   53| 00001F C605                        MOV    BYTE PTR package1.matr_print__elab_bool, 1 
   53| 000021 00000000                                  
   53| 000025 01                                        
;  Source Line # 61
   61| 000026 8BE5                        MOV    ESP, EBP 
   61| 000028 5D                          POP    EBP    
   61| 000029 C3                          RET           
                       ;                                
                       package1__elab_body ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000096     DD     00000801 
                                          DD     00000016 
                                          DD     package1__elab_body 
                                          DD     __lcl.00000102 
                                          DD     00000018 
                                          DD     package1__elab_body+00000003H 
                                          DD     __lcl.00000102 
                                          DD     00000021 
                                          DD     package1__elab_body+0000000AH 
                                          DD     __lcl.00000102 
                                          DD     00000028 
                                          DD     package1__elab_body+00000011H 
                                          DD     __lcl.00000102 
                                          DD     0000002E 
                                          DD     package1__elab_body+00000018H 
                                          DD     __lcl.00000102 
                                          DD     00000035 
                                          DD     package1__elab_body+0000001FH 
                                          DD     __lcl.00000102 
                                          DD     0000003D 
                                          DD     package1__elab_body+00000026H 
                                          DD     __lcl.00000102 
                                          DD     0000003D 
                                          DD     package1__elab_body+00000026H 
                                          DD     __lcl.00000102 
; ********* End of segment, Total Size = 100


; ************* .av_dbgr segment :
                                          ALIGN 4       
                                          DD     00000000 
                                          DD     00000000 
     000018            package1__body_rootpart____1 DD package1__pkg_body_subpdesc____1 
; ********* End of segment, Total Size = 32


; ************* .av_dbgi segment :
                                          ALIGN 4       
                                          DB     00     
     000208            __lcl.00000095     DB     08H    
                                          DB     'Package1' 
                                          DB     00H,00H,00H 
     000214            __lcl.00000094     DD     00000005 
                                          DD     package1.matr_input__subp_body_subpdesc____1 
                                          DD     package1.vec_input__subp_body_subpdesc____1 
                                          DD     package1.constant_out__subp_body_subpdesc____1
                                          DD     package1.vec_print__subp_body_subpdesc____1 
                                          DD     package1.matr_print__subp_body_subpdesc____1 
     00022C            package1__pkg_body_subpdesc____1 DD __lcl.00000095 
                                          DD     00000006 
                                          DD     __lcl.00000055 
                                          DD     00000016 
                                          DD     0000003D 
                                          DD     0000003D 
                                          DD     00000001 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000094 
                                          DD     00000000 
                                          DD     __lcl.00000027 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     package1__pkg_subpdesc____1 
                                          DD     00000000 
                                          DD     __lcl.00000096 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     00028C            __lcl.00000093     DB     0AH    
                                          DB     'Matr_print' 
                                          DB     00     
     000298            package1.matr_print__subp_body_subpdesc____1 DD __lcl.00000093 
                                          DD     00000005 
                                          DD     __lcl.00000055 
                                          DD     00000035 
                                          DD     00000036 
                                          DD     0000003B 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000090 
                                          DD     __lcl.00000027 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000092 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000097 
                                          DD     00000008 
                                          DD     __lcl.00000027 
     0002FC            __lcl.00000092     DD     00000001 
                                          DD     __lcl.00000089 
     000304            __lcl.00000091     DB     01H    
                                          DB     'm'    
                                          DW     0000   
     000308            __lcl.00000090     DD     00000001 
                                          DD     __lcl.00000091 
                                          DD     __lcl.00000044 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000324            __lcl.00000089     DB     8 DUP(00) 
                                          DD     __lcl.00000055 
                                          DD     00000037 
                                          DD     00000037 
                                          DD     0000003A 
                                          DD     00000003 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000088 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     000388            __lcl.00000088     DD     00000001 
                                          DD     __lcl.00000057 
                                          DD     __lcl.00000087 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0003A0            __lcl.00000087     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000085 
                                          DD     __lcl.00000086 
     0003BC            __lcl.00000086     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     0003C8            __lcl.00000085     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0003D4            __lcl.00000084     DB     09H    
                                          DB     'Vec_print' 
                                          DW     0000   
     0003E0            package1.vec_print__subp_body_subpdesc____1 DD __lcl.00000084 
                                          DD     00000004 
                                          DD     __lcl.00000055 
                                          DD     0000002E 
                                          DD     0000002F 
                                          DD     00000033 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000081 
                                          DD     __lcl.00000027 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000083 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000098 
                                          DD     00000008 
                                          DD     __lcl.00000027 
     000444            __lcl.00000083     DD     00000001 
                                          DD     __lcl.00000080 
     00044C            __lcl.00000082     DB     01H    
                                          DB     'v'    
                                          DW     0000   
     000450            __lcl.00000081     DD     00000001 
                                          DD     __lcl.00000082 
                                          DD     __lcl.00000042 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     00046C            __lcl.00000080     DB     8 DUP(00) 
                                          DD     __lcl.00000055 
                                          DD     00000030 
                                          DD     00000030 
                                          DD     00000032 
                                          DD     00000003 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000079 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     0004D0            __lcl.00000079     DD     00000001 
                                          DD     __lcl.00000057 
                                          DD     __lcl.00000078 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0004E8            __lcl.00000078     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000076 
                                          DD     __lcl.00000077 
     000504            __lcl.00000077     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000510            __lcl.00000076     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00051C            __lcl.00000075     DB     0CH    
                                          DB     'Constant_Out' 
                                          DB     00H,00H,00H 
     00052C            package1.constant_out__subp_body_subpdesc____1 DD __lcl.00000075 
                                          DD     00000003 
                                          DD     __lcl.00000055 
                                          DD     00000028 
                                          DD     00000029 
                                          DD     0000002C 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000073 
                                          DD     __lcl.00000027 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000099 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     000590            __lcl.00000074     DB     01H    
                                          DB     'a'    
                                          DW     0000   
     000594            __lcl.00000073     DD     00000001 
                                          DD     __lcl.00000074 
                                          DD     __lcl.00000031 
                                          DD     00000008 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0005B0            __lcl.00000072     DB     09H    
                                          DB     'Vec_Input' 
                                          DW     0000   
     0005BC            package1.vec_input__subp_body_subpdesc____1 DD __lcl.00000072 
                                          DD     00000002 
                                          DD     __lcl.00000055 
                                          DD     00000021 
                                          DD     00000022 
                                          DD     00000026 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000069 
                                          DD     __lcl.00000027 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000071 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000100 
                                          DD     00000008 
                                          DD     __lcl.00000027 
     000620            __lcl.00000071     DD     00000001 
                                          DD     __lcl.00000068 
     000628            __lcl.00000070     DB     01H    
                                          DB     'V'    
                                          DW     0000   
     00062C            __lcl.00000069     DD     00000001 
                                          DD     __lcl.00000070 
                                          DD     __lcl.00000042 
                                          DD     00000008 
                                          DD     00000102 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000648            __lcl.00000068     DB     8 DUP(00) 
                                          DD     __lcl.00000055 
                                          DD     00000023 
                                          DD     00000023 
                                          DD     00000025 
                                          DD     00000003 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000067 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     0006AC            __lcl.00000067     DD     00000001 
                                          DD     __lcl.00000057 
                                          DD     __lcl.00000066 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0006C4            __lcl.00000066     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000064 
                                          DD     __lcl.00000065 
     0006E0            __lcl.00000065     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     0006EC            __lcl.00000064     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0006F8            __lcl.00000063     DB     0AH    
                                          DB     'Matr_Input' 
                                          DB     00     
     000704            package1.matr_input__subp_body_subpdesc____1 DD __lcl.00000063 
                                          DD     00000001 
                                          DD     __lcl.00000055 
                                          DD     00000018 
                                          DD     00000019 
                                          DD     0000001F 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000060 
                                          DD     __lcl.00000027 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000062 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000101 
                                          DD     00000010 
                                          DD     __lcl.00000027 
     000768            __lcl.00000062     DD     00000001 
                                          DD     __lcl.00000059 
     000770            __lcl.00000061     DB     01H    
                                          DB     'M'    
                                          DW     0000   
     000774            __lcl.00000060     DD     00000001 
                                          DD     __lcl.00000061 
                                          DD     __lcl.00000044 
                                          DD     00000008 
                                          DD     00000102 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000790            __lcl.00000059     DB     8 DUP(00) 
                                          DD     __lcl.00000055 
                                          DD     0000001A 
                                          DD     0000001A 
                                          DD     0000001E 
                                          DD     00000003 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000056 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000058 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     0007F4            __lcl.00000058     DD     00000001 
                                          DD     __lcl.00000054 
     0007FC            __lcl.00000057     DB     01H    
                                          DB     'i'    
                                          DW     0000   
     000800            __lcl.00000056     DD     00000001 
                                          DD     __lcl.00000057 
                                          DD     __lcl.00000048 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     000818            __lcl.00000055     DB     0FH    
                                          DB     '..\package1.adb' 
     000828            __lcl.00000054     DB     8 DUP(00) 
                                          DD     __lcl.00000055 
                                          DD     0000001B 
                                          DD     0000001B 
                                          DD     0000001D 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000052 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     00088C            __lcl.00000053     DB     01H    
                                          DB     'j'    
                                          DW     0000   
     000890            __lcl.00000052     DD     00000001 
                                          DD     __lcl.00000053 
                                          DD     __lcl.00000051 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0008A8            __lcl.00000051     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000049 
                                          DD     __lcl.00000050 
     0008C4            __lcl.00000050     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     0008D0            __lcl.00000049     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0008DC            __lcl.00000048     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000046 
                                          DD     __lcl.00000047 
     0008F8            __lcl.00000047     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     000904            __lcl.00000046     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000910            __lcl.00000045     DB     04H    
                                          DB     'Matr' 
                                          DB     00H,00H,00H 
     000918            __lcl.00000044     DD     __lcl.00000045 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000036 
                                          DD     __lcl.00000042 
                                          DD     __lcl.00000035 
     000930            __lcl.00000043     DB     03H    
                                          DB     'Vec'  
     000934            __lcl.00000042     DD     __lcl.00000043 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000041 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000040 
     00094C            __lcl.00000041     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     000958            __lcl.00000040     DD     00000001 
                                          DD     __lcl.00000039 
     000960            __lcl.00000039     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000037 
                                          DD     __lcl.00000038 
     00097C            __lcl.00000038     DD     00000008 
                                          DD     00000007 
                                          DD     package1.vec__constrained_array____1 
     000988            __lcl.00000037     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000994            __lcl.00000036     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__COMP_SU_SIZE 
     0009A0            __lcl.00000035     DD     00000001 
                                          DD     __lcl.00000034 
     0009A8            __lcl.00000034     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000032 
                                          DD     __lcl.00000033 
     0009C4            __lcl.00000033     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__constrained_array____1 
     0009D0            __lcl.00000032     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0009DC            __lcl.00000031     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000029 
                                          DD     __lcl.00000030 
     0009F8            __lcl.00000030     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     000A04            __lcl.00000029     DD     00000008 
                                          DD     00000003 
                                          DD     80000000 
     000A10            __lcl.00000028     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     000A1C            __lcl.00000027     DD     00000000 
; ********* End of segment, Total Size = 2592


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000A20            __lcl.00000102     DB     1A     
                                          DB     'D:\LAB2-4VOVA\package1.adb' 
; ********* End of segment, Total Size = 2619

                       ;                                
                       CODE               ENDS          

