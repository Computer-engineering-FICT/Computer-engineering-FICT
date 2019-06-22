
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
   11| 00003F C1E6                        SHL    ESI, 2 
   11| 000041 02                                        
   11| 000042 8935                        MOV    package1.matr__COMP_SU_SIZE, ESI 
   11| 000044 00000000                                  
;  Source Line # 19
   19| 000048 8BE5                        MOV    ESP, EBP 
   19| 00004A 5D                          POP    EBP    
   19| 00004B C3                          RET           
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
                                          DD     package1__elab_spec+00000048H 
                                          DD     __lcl.00000026 
                                          DD     00000013 
                                          DD     package1__elab_spec+00000048H 
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
                                          DD     00000108 
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
                                          DD     00000108 
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
     0001EC            __lcl.00000026     DB     21     
                                          DB     'D:\ABPRO2-4-OLIAaaaa\package1.adb' 
; ********* End of segment, Total Size = 526

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
;  Source Line # 25
   25| 000006 8B05                        MOV    EAX, package1.n 
   25| 000008 00000000                                  
   25| 00000C 8945                        MOV    [EBP-16], EAX 
   25| 00000E F0                                        
;  Source Line # 26
   26| 00000F 837D                        CMP    DWORD PTR [EBP-16], 0 
   26| 000011 F0                                        
   26| 000012 00                                        
   26| 000013 7E                          JLE    SHORT L6 
   26| 000014 62                                        
   26| 000015 C745                        MOV    DWORD PTR [EBP-12], 1 
   26| 000017 F4                                        
   26| 000018 01000000                                  
   26|                 L9:                              
   26| 00001C 8B05                        MOV    EAX, package1.n 
   26| 00001E 00000000                                  
   26| 000022 8945                        MOV    [EBP-8], EAX 
   26| 000024 F8                                        
;  Source Line # 27
   27| 000025 837D                        CMP    DWORD PTR [EBP-8], 0 
   27| 000027 F8                                        
   27| 000028 00                                        
   27| 000029 7E                          JLE    SHORT L10 
   27| 00002A 3B                                        
   27| 00002B C745                        MOV    DWORD PTR [EBP-4], 1 
   27| 00002D FC                                        
   27| 00002E 01000000                                  
   27|                 L12:                             
;  Source Line # 28
   28| 000032 8B45                        MOV    EAX, [EBP+8] ;  M
   28| 000034 08                                        
   28| 000035 8B5D                        MOV    EBX, [EBP-12] 
   28| 000037 F4                                        
   28| 000038 8D5B                        LEA    EBX, [EBX-1] 
   28| 00003A FF                                        
   28| 00003B 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   28| 00003E 00000000                                  
   28| 000042 8B4D                        MOV    ECX, [EBP-4] 
   28| 000044 FC                                        
   28| 000045 8D0C8D                      LEA    ECX, [4*ECX-4] 
   28| 000048 FCFFFFFF                                  
   28| 00004C 03D9                        ADD    EBX, ECX 
   28| 00004E C70418                      MOV    DWORD PTR [EAX+EBX+0], 1 
   28| 000051 01000000                                  
;  Source Line # 29
   29| 000055 8B55                        MOV    EDX, [EBP-8] 
   29| 000057 F8                                        
   29| 000058 3955                        CMP    [EBP-4], EDX 
   29| 00005A FC                                        
   29| 00005B 74                          JE     SHORT L10 
   29| 00005C 09                                        
   29| 00005D 8B45                        MOV    EAX, [EBP-4] 
   29| 00005F FC                                        
   29| 000060 40                          INC    EAX    
   29| 000061 8945                        MOV    [EBP-4], EAX 
   29| 000063 FC                                        
   29| 000064 EB                          JMP    SHORT L12 
   29| 000065 CC                                        
   29|                 L10:                             
;  Source Line # 30
   30| 000066 8B45                        MOV    EAX, [EBP-16] 
   30| 000068 F0                                        
   30| 000069 3945                        CMP    [EBP-12], EAX 
   30| 00006B F4                                        
   30| 00006C 74                          JE     SHORT L6 
   30| 00006D 09                                        
   30| 00006E 8B45                        MOV    EAX, [EBP-12] 
   30| 000070 F4                                        
   30| 000071 40                          INC    EAX    
   30| 000072 8945                        MOV    [EBP-12], EAX 
   30| 000074 F4                                        
   30| 000075 EB                          JMP    SHORT L9 
   30| 000076 A5                                        
   30|                 L6:                              
;  Source Line # 31
   31| 000077 8BE5                        MOV    ESP, EBP 
   31| 000079 5D                          POP    EBP    
   31| 00007A C2                          RET    4      
   31| 00007B 0400                                      
                       ;                                
                       package1.matr_input ENDP         


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000101     DD     00000901 
                                          DD     00000018 
                                          DD     package1.matr_input 
                                          DD     __lcl.00000102 
                                          DD     00000019 
                                          DD     package1.matr_input+00000006H 
                                          DD     __lcl.00000102 
                                          DD     0000001A 
                                          DD     package1.matr_input+0000000FH 
                                          DD     __lcl.00000102 
                                          DD     0000001B 
                                          DD     package1.matr_input+00000025H 
                                          DD     __lcl.00000102 
                                          DD     0000001C 
                                          DD     package1.matr_input+00000032H 
                                          DD     __lcl.00000102 
                                          DD     0000001D 
                                          DD     package1.matr_input+00000055H 
                                          DD     __lcl.00000102 
                                          DD     0000001E 
                                          DD     package1.matr_input+00000066H 
                                          DD     __lcl.00000102 
                                          DD     0000001F 
                                          DD     package1.matr_input+00000077H 
                                          DD     __lcl.00000102 
                                          DD     0000001F 
                                          DD     package1.matr_input+00000079H 
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
;  Source Line # 34
   34| 000006 8B05                        MOV    EAX, package1.n 
   34| 000008 00000000                                  
   34| 00000C 8945                        MOV    [EBP-8], EAX 
   34| 00000E F8                                        
;  Source Line # 35
   35| 00000F 837D                        CMP    DWORD PTR [EBP-8], 0 
   35| 000011 F8                                        
   35| 000012 00                                        
   35| 000013 7E                          JLE    SHORT L6 
   35| 000014 26                                        
   35| 000015 C745                        MOV    DWORD PTR [EBP-4], 1 
   35| 000017 FC                                        
   35| 000018 01000000                                  
   35|                 L9:                              
;  Source Line # 36
   36| 00001C 8B45                        MOV    EAX, [EBP+8] ;  V
   36| 00001E 08                                        
   36| 00001F 8B5D                        MOV    EBX, [EBP-4] 
   36| 000021 FC                                        
   36| 000022 C74498                      MOV    DWORD PTR [EAX+4*EBX-4], 1 
   36| 000025 FC                                        
   36| 000026 01000000                                  
;  Source Line # 37
   37| 00002A 8B4D                        MOV    ECX, [EBP-8] 
   37| 00002C F8                                        
   37| 00002D 394D                        CMP    [EBP-4], ECX 
   37| 00002F FC                                        
   37| 000030 74                          JE     SHORT L6 
   37| 000031 09                                        
   37| 000032 8B45                        MOV    EAX, [EBP-4] 
   37| 000034 FC                                        
   37| 000035 40                          INC    EAX    
   37| 000036 8945                        MOV    [EBP-4], EAX 
   37| 000038 FC                                        
   37| 000039 EB                          JMP    SHORT L9 
   37| 00003A E1                                        
   37|                 L6:                              
;  Source Line # 38
   38| 00003B 8BE5                        MOV    ESP, EBP 
   38| 00003D 5D                          POP    EBP    
   38| 00003E C2                          RET    4      
   38| 00003F 0400                                      
                       ;                                
                       package1.vec_input ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000100     DD     00000701 
                                          DD     00000021 
                                          DD     package1.vec_input 
                                          DD     __lcl.00000102 
                                          DD     00000022 
                                          DD     package1.vec_input+00000006H 
                                          DD     __lcl.00000102 
                                          DD     00000023 
                                          DD     package1.vec_input+0000000FH 
                                          DD     __lcl.00000102 
                                          DD     00000024 
                                          DD     package1.vec_input+0000001CH 
                                          DD     __lcl.00000102 
                                          DD     00000025 
                                          DD     package1.vec_input+0000002AH 
                                          DD     __lcl.00000102 
                                          DD     00000026 
                                          DD     package1.vec_input+0000003BH 
                                          DD     __lcl.00000102 
                                          DD     00000026 
                                          DD     package1.vec_input+0000003DH 
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
;  Source Line # 42
   42| 000003 0FB605                      MOVZX  EAX, BYTE PTR ada.integer_text_io.default_base
   42| 000006 00000000                                  
   42| 00000A 50                          PUSH   EAX    
   42| 00000B 6A                          PUSH   4      
   42| 00000C 04                                        
   42| 00000D FF75                        PUSH   DWORD PTR [EBP+8] ;  a
   42| 00000F 08                                        
   42| 000010 E8                          CALL   ada.integer_text_io.put__2 
   42| 000011 00000000                                  
;  Source Line # 43
   43| 000015 6A                          PUSH   1      
   43| 000016 01                                        
   43| 000017 E8                          CALL   ada.text_io.new_line__2 
   43| 000018 00000000                                  
;  Source Line # 44
   44| 00001C 8BE5                        MOV    ESP, EBP 
   44| 00001E 5D                          POP    EBP    
   44| 00001F C2                          RET    4      
   44| 000020 0400                                      
                       ;                                
                       package1.constant_out ENDP       

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000099     DD     00000501 
                                          DD     00000028 
                                          DD     package1.constant_out 
                                          DD     __lcl.00000102 
                                          DD     0000002A 
                                          DD     package1.constant_out+00000003H 
                                          DD     __lcl.00000102 
                                          DD     0000002B 
                                          DD     package1.constant_out+00000015H 
                                          DD     __lcl.00000102 
                                          DD     0000002C 
                                          DD     package1.constant_out+0000001CH 
                                          DD     __lcl.00000102 
                                          DD     0000002C 
                                          DD     package1.constant_out+0000001EH 
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
;  Source Line # 47
   47| 000006 8B05                        MOV    EAX, package1.n 
   47| 000008 00000000                                  
   47| 00000C 8945                        MOV    [EBP-8], EAX 
   47| 00000E F8                                        
;  Source Line # 48
   48| 00000F 837D                        CMP    DWORD PTR [EBP-8], 0 
   48| 000011 F8                                        
   48| 000012 00                                        
   48| 000013 7E                          JLE    SHORT L6 
   48| 000014 31                                        
   48| 000015 C745                        MOV    DWORD PTR [EBP-4], 1 
   48| 000017 FC                                        
   48| 000018 01000000                                  
   48|                 L9:                              
;  Source Line # 49
   49| 00001C 0FB605                      MOVZX  EAX, BYTE PTR ada.integer_text_io.default_base
   49| 00001F 00000000                                  
   49| 000023 50                          PUSH   EAX    
   49| 000024 6A                          PUSH   4      
   49| 000025 04                                        
   49| 000026 8B5D                        MOV    EBX, [EBP+8] ;  v
   49| 000028 08                                        
   49| 000029 8B4D                        MOV    ECX, [EBP-4] 
   49| 00002B FC                                        
   49| 00002C FF748B                      PUSH   DWORD PTR [EBX+4*ECX-4] 
   49| 00002F FC                                        
   49| 000030 E8                          CALL   ada.integer_text_io.put__2 
   49| 000031 00000000                                  
;  Source Line # 50
   50| 000035 8B55                        MOV    EDX, [EBP-8] 
   50| 000037 F8                                        
   50| 000038 3955                        CMP    [EBP-4], EDX 
   50| 00003A FC                                        
   50| 00003B 74                          JE     SHORT L6 
   50| 00003C 09                                        
   50| 00003D 8B45                        MOV    EAX, [EBP-4] 
   50| 00003F FC                                        
   50| 000040 40                          INC    EAX    
   50| 000041 8945                        MOV    [EBP-4], EAX 
   50| 000043 FC                                        
   50| 000044 EB                          JMP    SHORT L9 
   50| 000045 D6                                        
   50|                 L6:                              
;  Source Line # 51
   51| 000046 8BE5                        MOV    ESP, EBP 
   51| 000048 5D                          POP    EBP    
   51| 000049 C2                          RET    4      
   51| 00004A 0400                                      
                       ;                                
                       package1.vec_print ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000098     DD     00000701 
                                          DD     0000002E 
                                          DD     package1.vec_print 
                                          DD     __lcl.00000102 
                                          DD     0000002F 
                                          DD     package1.vec_print+00000006H 
                                          DD     __lcl.00000102 
                                          DD     00000030 
                                          DD     package1.vec_print+0000000FH 
                                          DD     __lcl.00000102 
                                          DD     00000031 
                                          DD     package1.vec_print+0000001CH 
                                          DD     __lcl.00000102 
                                          DD     00000032 
                                          DD     package1.vec_print+00000035H 
                                          DD     __lcl.00000102 
                                          DD     00000033 
                                          DD     package1.vec_print+00000046H 
                                          DD     __lcl.00000102 
                                          DD     00000033 
                                          DD     package1.vec_print+00000048H 
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
;  Source Line # 54
   54| 000006 8B05                        MOV    EAX, package1.n 
   54| 000008 00000000                                  
   54| 00000C 8945                        MOV    [EBP-8], EAX 
   54| 00000E F8                                        
;  Source Line # 55
   55| 00000F 837D                        CMP    DWORD PTR [EBP-8], 0 
   55| 000011 F8                                        
   55| 000012 00                                        
   55| 000013 7E                          JLE    SHORT L6 
   55| 000014 38                                        
   55| 000015 C745                        MOV    DWORD PTR [EBP-4], 1 
   55| 000017 FC                                        
   55| 000018 01000000                                  
   55|                 L9:                              
;  Source Line # 56
   56| 00001C 8B45                        MOV    EAX, [EBP+8] ;  m
   56| 00001E 08                                        
   56| 00001F 8B5D                        MOV    EBX, [EBP-4] 
   56| 000021 FC                                        
   56| 000022 8D5B                        LEA    EBX, [EBX-1] 
   56| 000024 FF                                        
   56| 000025 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   56| 000028 00000000                                  
   56| 00002C 8D0418                      LEA    EAX, [EAX+EBX+0] 
   56| 00002F 50                          PUSH   EAX    
   56| 000030 E8                          CALL   package1.vec_print 
   56| 000031 00000000                                  
;  Source Line # 57
   57| 000035 6A                          PUSH   1      
   57| 000036 01                                        
   57| 000037 E8                          CALL   ada.text_io.new_line__2 
   57| 000038 00000000                                  
;  Source Line # 58
   58| 00003C 8B4D                        MOV    ECX, [EBP-8] 
   58| 00003E F8                                        
   58| 00003F 394D                        CMP    [EBP-4], ECX 
   58| 000041 FC                                        
   58| 000042 74                          JE     SHORT L6 
   58| 000043 09                                        
   58| 000044 8B45                        MOV    EAX, [EBP-4] 
   58| 000046 FC                                        
   58| 000047 40                          INC    EAX    
   58| 000048 8945                        MOV    [EBP-4], EAX 
   58| 00004A FC                                        
   58| 00004B EB                          JMP    SHORT L9 
   58| 00004C CF                                        
   58|                 L6:                              
;  Source Line # 59
   59| 00004D 8BE5                        MOV    ESP, EBP 
   59| 00004F 5D                          POP    EBP    
   59| 000050 C2                          RET    4      
   59| 000051 0400                                      
                       ;                                
                       package1.matr_print ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000097     DD     00000801 
                                          DD     00000035 
                                          DD     package1.matr_print 
                                          DD     __lcl.00000102 
                                          DD     00000036 
                                          DD     package1.matr_print+00000006H 
                                          DD     __lcl.00000102 
                                          DD     00000037 
                                          DD     package1.matr_print+0000000FH 
                                          DD     __lcl.00000102 
                                          DD     00000038 
                                          DD     package1.matr_print+0000001CH 
                                          DD     __lcl.00000102 
                                          DD     00000039 
                                          DD     package1.matr_print+00000035H 
                                          DD     __lcl.00000102 
                                          DD     0000003A 
                                          DD     package1.matr_print+0000003CH 
                                          DD     __lcl.00000102 
                                          DD     0000003B 
                                          DD     package1.matr_print+0000004DH 
                                          DD     __lcl.00000102 
                                          DD     0000003B 
                                          DD     package1.matr_print+0000004FH 
                                          DD     __lcl.00000102 
; ********* End of segment, Total Size = 100

                       ;                                
                       ;  Start of procedure package1__elab_body   
                       ;                                
                                          PUBLIC package1__elab_body 
                       package1__elab_body PROC  NEAR   
;  Source Line # 61
   61| 000000 C3                          RET           
                       ;                                
                       package1__elab_body ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000096     DD     00000201 
                                          DD     0000003D 
                                          DD     package1__elab_body 
                                          DD     __lcl.00000102 
                                          DD     0000003D 
                                          DD     package1__elab_body+FFFFFFFDH 
                                          DD     __lcl.00000102 
; ********* End of segment, Total Size = 28


; ************* .av_dbgr segment :
                                          ALIGN 4       
                                          DD     00000000 
                                          DD     00000000 
     000018            package1__body_rootpart____1 DD package1__pkg_body_subpdesc____1 
; ********* End of segment, Total Size = 32


; ************* .av_dbgi segment :
                                          ALIGN 4       
                                          DW     0000   
     000210            __lcl.00000095     DB     08H    
                                          DB     'Package1' 
                                          DB     00H,00H,00H 
     00021C            __lcl.00000094     DD     00000005 
                                          DD     package1.matr_input__subp_body_subpdesc____1 
                                          DD     package1.vec_input__subp_body_subpdesc____1 
                                          DD     package1.constant_out__subp_body_subpdesc____1
                                          DD     package1.vec_print__subp_body_subpdesc____1 
                                          DD     package1.matr_print__subp_body_subpdesc____1 
     000234            package1__pkg_body_subpdesc____1 DD __lcl.00000095 
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
     000294            __lcl.00000093     DB     0AH    
                                          DB     'Matr_print' 
                                          DB     00     
     0002A0            package1.matr_print__subp_body_subpdesc____1 DD __lcl.00000093 
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
     000304            __lcl.00000092     DD     00000001 
                                          DD     __lcl.00000089 
     00030C            __lcl.00000091     DB     01H    
                                          DB     'm'    
                                          DW     0000   
     000310            __lcl.00000090     DD     00000001 
                                          DD     __lcl.00000091 
                                          DD     __lcl.00000044 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     00032C            __lcl.00000089     DB     8 DUP(00) 
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
     000390            __lcl.00000088     DD     00000001 
                                          DD     __lcl.00000057 
                                          DD     __lcl.00000087 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0003A8            __lcl.00000087     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000085 
                                          DD     __lcl.00000086 
     0003C4            __lcl.00000086     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     0003D0            __lcl.00000085     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0003DC            __lcl.00000084     DB     09H    
                                          DB     'Vec_print' 
                                          DW     0000   
     0003E8            package1.vec_print__subp_body_subpdesc____1 DD __lcl.00000084 
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
     00044C            __lcl.00000083     DD     00000001 
                                          DD     __lcl.00000080 
     000454            __lcl.00000082     DB     01H    
                                          DB     'v'    
                                          DW     0000   
     000458            __lcl.00000081     DD     00000001 
                                          DD     __lcl.00000082 
                                          DD     __lcl.00000042 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000474            __lcl.00000080     DB     8 DUP(00) 
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
     0004D8            __lcl.00000079     DD     00000001 
                                          DD     __lcl.00000057 
                                          DD     __lcl.00000078 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0004F0            __lcl.00000078     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000076 
                                          DD     __lcl.00000077 
     00050C            __lcl.00000077     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000518            __lcl.00000076     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000524            __lcl.00000075     DB     0CH    
                                          DB     'Constant_Out' 
                                          DB     00H,00H,00H 
     000534            package1.constant_out__subp_body_subpdesc____1 DD __lcl.00000075 
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
     000598            __lcl.00000074     DB     01H    
                                          DB     'a'    
                                          DW     0000   
     00059C            __lcl.00000073     DD     00000001 
                                          DD     __lcl.00000074 
                                          DD     __lcl.00000031 
                                          DD     00000008 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0005B8            __lcl.00000072     DB     09H    
                                          DB     'Vec_Input' 
                                          DW     0000   
     0005C4            package1.vec_input__subp_body_subpdesc____1 DD __lcl.00000072 
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
     000628            __lcl.00000071     DD     00000001 
                                          DD     __lcl.00000068 
     000630            __lcl.00000070     DB     01H    
                                          DB     'V'    
                                          DW     0000   
     000634            __lcl.00000069     DD     00000001 
                                          DD     __lcl.00000070 
                                          DD     __lcl.00000042 
                                          DD     00000008 
                                          DD     00000102 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000650            __lcl.00000068     DB     8 DUP(00) 
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
     0006B4            __lcl.00000067     DD     00000001 
                                          DD     __lcl.00000057 
                                          DD     __lcl.00000066 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0006CC            __lcl.00000066     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000064 
                                          DD     __lcl.00000065 
     0006E8            __lcl.00000065     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     0006F4            __lcl.00000064     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000700            __lcl.00000063     DB     0AH    
                                          DB     'Matr_Input' 
                                          DB     00     
     00070C            package1.matr_input__subp_body_subpdesc____1 DD __lcl.00000063 
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
     000770            __lcl.00000062     DD     00000001 
                                          DD     __lcl.00000059 
     000778            __lcl.00000061     DB     01H    
                                          DB     'M'    
                                          DW     0000   
     00077C            __lcl.00000060     DD     00000001 
                                          DD     __lcl.00000061 
                                          DD     __lcl.00000044 
                                          DD     00000008 
                                          DD     00000102 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000798            __lcl.00000059     DB     8 DUP(00) 
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
     0007FC            __lcl.00000058     DD     00000001 
                                          DD     __lcl.00000054 
     000804            __lcl.00000057     DB     01H    
                                          DB     'i'    
                                          DW     0000   
     000808            __lcl.00000056     DD     00000001 
                                          DD     __lcl.00000057 
                                          DD     __lcl.00000048 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     000820            __lcl.00000055     DB     0FH    
                                          DB     '..\package1.adb' 
     000830            __lcl.00000054     DB     8 DUP(00) 
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
     000894            __lcl.00000053     DB     01H    
                                          DB     'j'    
                                          DW     0000   
     000898            __lcl.00000052     DD     00000001 
                                          DD     __lcl.00000053 
                                          DD     __lcl.00000051 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0008B0            __lcl.00000051     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000049 
                                          DD     __lcl.00000050 
     0008CC            __lcl.00000050     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     0008D8            __lcl.00000049     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0008E4            __lcl.00000048     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000046 
                                          DD     __lcl.00000047 
     000900            __lcl.00000047     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     00090C            __lcl.00000046     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000918            __lcl.00000045     DB     04H    
                                          DB     'Matr' 
                                          DB     00H,00H,00H 
     000920            __lcl.00000044     DD     __lcl.00000045 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000036 
                                          DD     __lcl.00000042 
                                          DD     __lcl.00000035 
     000938            __lcl.00000043     DB     03H    
                                          DB     'Vec'  
     00093C            __lcl.00000042     DD     __lcl.00000043 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000041 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000040 
     000954            __lcl.00000041     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     000960            __lcl.00000040     DD     00000001 
                                          DD     __lcl.00000039 
     000968            __lcl.00000039     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000037 
                                          DD     __lcl.00000038 
     000984            __lcl.00000038     DD     00000008 
                                          DD     00000007 
                                          DD     package1.vec__constrained_array____1 
     000990            __lcl.00000037     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00099C            __lcl.00000036     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__COMP_SU_SIZE 
     0009A8            __lcl.00000035     DD     00000001 
                                          DD     __lcl.00000034 
     0009B0            __lcl.00000034     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000032 
                                          DD     __lcl.00000033 
     0009CC            __lcl.00000033     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__constrained_array____1 
     0009D8            __lcl.00000032     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0009E4            __lcl.00000031     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000029 
                                          DD     __lcl.00000030 
     000A00            __lcl.00000030     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     000A0C            __lcl.00000029     DD     00000008 
                                          DD     00000003 
                                          DD     80000000 
     000A18            __lcl.00000028     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     000A24            __lcl.00000027     DD     00000000 
; ********* End of segment, Total Size = 2600


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000A28            __lcl.00000102     DB     21     
                                          DB     'D:\ABPRO2-4-OLIAaaaa\package1.adb' 
; ********* End of segment, Total Size = 2634

                       ;                                
                       CODE               ENDS          

