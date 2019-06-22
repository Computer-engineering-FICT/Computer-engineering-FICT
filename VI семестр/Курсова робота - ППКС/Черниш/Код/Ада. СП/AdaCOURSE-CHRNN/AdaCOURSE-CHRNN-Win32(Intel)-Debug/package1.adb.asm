
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
;  Source Line # 20
   20| 00004B 8BE5                        MOV    ESP, EBP 
   20| 00004D 5D                          POP    EBP    
   20| 00004E C3                          RET           
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
                                          DD     00000014 
                                          DD     package1__elab_spec+0000004BH 
                                          DD     __lcl.00000026 
                                          DD     00000014 
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
     000000            package1.sort__elab_bool DB 00   
     000001            package1.matr_input__elab_bool DB 00 
     000002            package1.vec_input__elab_bool DB 00 
     000003            package1.matr_print__elab_bool DB 00 
     000004            package1.vec_print__elab_bool DB 00 
     000005            package1.constant_out__elab_bool DB 00 
                                          DW     0000   
     000008            package1.p         DD     00000004 
     00000C            package1.n         DD     00000FA0 
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
                                          DD     00000014 
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
     0001EC            __lcl.00000026     DB     1F     
                                          DB     'D:\AdaCOURSE-CHRNN\package1.adb' 
; ********* End of segment, Total Size = 524

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
;  Source Line # 25
   25| 000000 55                          PUSH   EBP    
   25| 000001 8BEC                        MOV    EBP, ESP 
   25| 000003 83EC                        SUB    ESP, 16 
   25| 000005 10                                        
   25| 000006 803D                        CMP    BYTE PTR package1.matr_input__elab_bool, 0 
   25| 000008 00000000                                  
   25| 00000C 00                                        
   25|                 L19:                             
   25| 00000D 0F84                        JE     L20    
   25| 00000F 8B000000                                  
;  Source Line # 25
   25| 000013 8B05                        MOV    EAX, package1.n 
   25| 000015 00000000                                  
   25| 000019 8945                        MOV    [EBP-16], EAX 
   25| 00001B F0                                        
;  Source Line # 27
   27| 00001C 837D                        CMP    DWORD PTR [EBP-16], 0 
   27| 00001E F0                                        
   27| 00001F 00                                        
   27| 000020 0F8E                        JLE    L8     
   27| 000022 72000000                                  
   27| 000026 C745                        MOV    DWORD PTR [EBP-12], 1 
   27| 000028 F4                                        
   27| 000029 01000000                                  
   27|                 L11:                             
   27| 00002D 8B05                        MOV    EAX, package1.n 
   27| 00002F 00000000                                  
   27| 000033 8945                        MOV    [EBP-8], EAX 
   27| 000035 F8                                        
;  Source Line # 28
   28| 000036 837D                        CMP    DWORD PTR [EBP-8], 0 
   28| 000038 F8                                        
   28| 000039 00                                        
   28| 00003A 7E                          JLE    SHORT L12 
   28| 00003B 4B                                        
   28| 00003C C745                        MOV    DWORD PTR [EBP-4], 1 
   28| 00003E FC                                        
   28| 00003F 01000000                                  
   28|                 L14:                             
;  Source Line # 29
   29| 000043 8B45                        MOV    EAX, [EBP+8] ;  M
   29| 000045 08                                        
   29| 000046 8B5D                        MOV    EBX, [EBP-12] 
   29| 000048 F4                                        
   29| 000049 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
   29| 00004B 00000000                                  
   29|                 L21:                             
   29| 00004F 7F                          JG     SHORT L22 
   29| 000050 4F                                        
   29| 000051 8D5B                        LEA    EBX, [EBX-1] 
   29| 000053 FF                                        
   29| 000054 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   29| 000057 00000000                                  
   29| 00005B 8B4D                        MOV    ECX, [EBP-4] 
   29| 00005D FC                                        
   29| 00005E 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
   29| 000060 00000000                                  
   29|                 L23:                             
   29| 000064 7F                          JG     SHORT L24 
   29| 000065 46                                        
   29| 000066 8D0C8D                      LEA    ECX, [4*ECX-4] 
   29| 000069 FCFFFFFF                                  
   29| 00006D 03D9                        ADD    EBX, ECX 
   29| 00006F C70418                      MOV    DWORD PTR [EAX+EBX+0], 1 
   29| 000072 01000000                                  
;  Source Line # 30
   30| 000076 8B55                        MOV    EDX, [EBP-8] 
   30| 000078 F8                                        
   30| 000079 3955                        CMP    [EBP-4], EDX 
   30| 00007B FC                                        
   30| 00007C 74                          JE     SHORT L12 
   30| 00007D 09                                        
   30| 00007E 8B45                        MOV    EAX, [EBP-4] 
   30| 000080 FC                                        
   30| 000081 40                          INC    EAX    
   30| 000082 8945                        MOV    [EBP-4], EAX 
   30| 000084 FC                                        
   30| 000085 EB                          JMP    SHORT L14 
   30| 000086 BC                                        
   30|                 L12:                             
;  Source Line # 31
   31| 000087 8B45                        MOV    EAX, [EBP-16] 
   31| 000089 F0                                        
   31| 00008A 3945                        CMP    [EBP-12], EAX 
   31| 00008C F4                                        
   31| 00008D 74                          JE     SHORT L8 
   31| 00008E 09                                        
   31| 00008F 8B45                        MOV    EAX, [EBP-12] 
   31| 000091 F4                                        
   31| 000092 40                          INC    EAX    
   31| 000093 8945                        MOV    [EBP-12], EAX 
   31| 000095 F4                                        
   31| 000096 EB                          JMP    SHORT L11 
   31| 000097 95                                        
   31|                 L8:                              
;  Source Line # 32
   32| 000098 8BE5                        MOV    ESP, EBP 
   32| 00009A 5D                          POP    EBP    
   32| 00009B C2                          RET    4      
   32| 00009C 0400                                      
   32|                 L20:                             
   32| 00009E F6                          DB     246    
   32| 00009F F4                          DB     244    
   32|                 L22:                             
   32| 0000A0 8D05                        LEA    EAX, L21+5 
   32| 0000A2 54000000                                  
   32| 0000A6 50                          PUSH   EAX    
   32| 0000A7 E9                          JMP    rts_raise_constraint_error 
   32| 0000A8 00000000                                  
   32|                 L24:                             
   32| 0000AC 8D05                        LEA    EAX, L23+5 
   32| 0000AE 69000000                                  
   32| 0000B2 50                          PUSH   EAX    
   32| 0000B3 E9                          JMP    rts_raise_constraint_error 
   32| 0000B4 00000000                                  
                       ;                                
                       package1.matr_input ENDP         


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000123     DD     00000901 
                                          DD     00000019 
                                          DD     package1.matr_input 
                                          DD     __lcl.00000124 
                                          DD     00000019 
                                          DD     package1.matr_input+00000013H 
                                          DD     __lcl.00000124 
                                          DD     0000001B 
                                          DD     package1.matr_input+0000001CH 
                                          DD     __lcl.00000124 
                                          DD     0000001C 
                                          DD     package1.matr_input+00000036H 
                                          DD     __lcl.00000124 
                                          DD     0000001D 
                                          DD     package1.matr_input+00000043H 
                                          DD     __lcl.00000124 
                                          DD     0000001E 
                                          DD     package1.matr_input+00000076H 
                                          DD     __lcl.00000124 
                                          DD     0000001F 
                                          DD     package1.matr_input+00000087H 
                                          DD     __lcl.00000124 
                                          DD     00000020 
                                          DD     package1.matr_input+00000098H 
                                          DD     __lcl.00000124 
                                          DD     00000020 
                                          DD     package1.matr_input+000000B4H 
                                          DD     __lcl.00000124 
; ********* End of segment, Total Size = 112

                       ;                                
                       ;  Start of procedure package1.vec_input   
                       ;                                
                                          PUBLIC package1.vec_input 
                       package1.vec_input PROC   NEAR   
;  Source Line # 34
   34| 000000 55                          PUSH   EBP    
   34| 000001 8BEC                        MOV    EBP, ESP 
   34| 000003 83EC                        SUB    ESP, 8 
   34| 000005 08                                        
   34| 000006 803D                        CMP    BYTE PTR package1.vec_input__elab_bool, 0 
   34| 000008 00000000                                  
   34| 00000C 00                                        
   34|                 L14:                             
   34| 00000D 74                          JE     SHORT L15 
   34| 00000E 43                                        
;  Source Line # 34
   34| 00000F 8B05                        MOV    EAX, package1.n 
   34| 000011 00000000                                  
   34| 000015 8945                        MOV    [EBP-8], EAX 
   34| 000017 F8                                        
;  Source Line # 36
   36| 000018 837D                        CMP    DWORD PTR [EBP-8], 0 
   36| 00001A F8                                        
   36| 00001B 00                                        
   36| 00001C 7E                          JLE    SHORT L8 
   36| 00001D 2E                                        
   36| 00001E C745                        MOV    DWORD PTR [EBP-4], 1 
   36| 000020 FC                                        
   36| 000021 01000000                                  
   36|                 L11:                             
;  Source Line # 37
   37| 000025 8B45                        MOV    EAX, [EBP+8] ;  V
   37| 000027 08                                        
   37| 000028 8B5D                        MOV    EBX, [EBP-4] 
   37| 00002A FC                                        
   37| 00002B 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
   37| 00002D 00000000                                  
   37|                 L16:                             
   37| 000031 7F                          JG     SHORT L17 
   37| 000032 21                                        
   37| 000033 C74498                      MOV    DWORD PTR [EAX+4*EBX-4], 1 
   37| 000036 FC                                        
   37| 000037 01000000                                  
;  Source Line # 38
   38| 00003B 8B4D                        MOV    ECX, [EBP-8] 
   38| 00003D F8                                        
   38| 00003E 394D                        CMP    [EBP-4], ECX 
   38| 000040 FC                                        
   38| 000041 74                          JE     SHORT L8 
   38| 000042 09                                        
   38| 000043 8B45                        MOV    EAX, [EBP-4] 
   38| 000045 FC                                        
   38| 000046 40                          INC    EAX    
   38| 000047 8945                        MOV    [EBP-4], EAX 
   38| 000049 FC                                        
   38| 00004A EB                          JMP    SHORT L11 
   38| 00004B D9                                        
   38|                 L8:                              
;  Source Line # 39
   39| 00004C 8BE5                        MOV    ESP, EBP 
   39| 00004E 5D                          POP    EBP    
   39| 00004F C2                          RET    4      
   39| 000050 0400                                      
   39|                 L15:                             
   39| 000052 F6                          DB     246    
   39| 000053 F4                          DB     244    
   39|                 L17:                             
   39| 000054 8D05                        LEA    EAX, L16+5 
   39| 000056 36000000                                  
   39| 00005A 50                          PUSH   EAX    
   39| 00005B E9                          JMP    rts_raise_constraint_error 
   39| 00005C 00000000                                  
                       ;                                
                       package1.vec_input ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000122     DD     00000701 
                                          DD     00000022 
                                          DD     package1.vec_input 
                                          DD     __lcl.00000124 
                                          DD     00000022 
                                          DD     package1.vec_input+0000000FH 
                                          DD     __lcl.00000124 
                                          DD     00000024 
                                          DD     package1.vec_input+00000018H 
                                          DD     __lcl.00000124 
                                          DD     00000025 
                                          DD     package1.vec_input+00000025H 
                                          DD     __lcl.00000124 
                                          DD     00000026 
                                          DD     package1.vec_input+0000003BH 
                                          DD     __lcl.00000124 
                                          DD     00000027 
                                          DD     package1.vec_input+0000004CH 
                                          DD     __lcl.00000124 
                                          DD     00000027 
                                          DD     package1.vec_input+0000005CH 
                                          DD     __lcl.00000124 
; ********* End of segment, Total Size = 88

                       ;                                
                       ;  Start of procedure package1.constant_out   
                       ;                                
                                          PUBLIC package1.constant_out 
                       package1.constant_out PROC NEAR  
;  Source Line # 41
   41| 000000 55                          PUSH   EBP    
   41| 000001 8BEC                        MOV    EBP, ESP 
   41| 000003 803D                        CMP    BYTE PTR package1.constant_out__elab_bool, 0 
   41| 000005 00000000                                  
   41| 000009 00                                        
   41|                 L9:                              
   41| 00000A 74                          JE     SHORT L10 
   41| 00000B 1F                                        
;  Source Line # 43
   43| 00000C 0FB605                      MOVZX  EAX, BYTE PTR ada.integer_text_io.default_base
   43| 00000F 00000000                                  
   43| 000013 50                          PUSH   EAX    
   43| 000014 6A                          PUSH   4      
   43| 000015 04                                        
   43| 000016 FF75                        PUSH   DWORD PTR [EBP+8] ;  a
   43| 000018 08                                        
   43| 000019 E8                          CALL   ada.integer_text_io.put__2 
   43| 00001A 00000000                                  
;  Source Line # 44
   44| 00001E 6A                          PUSH   1      
   44| 00001F 01                                        
   44| 000020 E8                          CALL   ada.text_io.new_line__2 
   44| 000021 00000000                                  
;  Source Line # 45
   45| 000025 8BE5                        MOV    ESP, EBP 
   45| 000027 5D                          POP    EBP    
   45| 000028 C2                          RET    4      
   45| 000029 0400                                      
   45|                 L10:                             
   45| 00002B F6                          DB     246    
   45| 00002C F4                          DB     244    
                       ;                                
                       package1.constant_out ENDP       

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000121     DD     00000501 
                                          DD     00000029 
                                          DD     package1.constant_out 
                                          DD     __lcl.00000124 
                                          DD     0000002B 
                                          DD     package1.constant_out+0000000CH 
                                          DD     __lcl.00000124 
                                          DD     0000002C 
                                          DD     package1.constant_out+0000001EH 
                                          DD     __lcl.00000124 
                                          DD     0000002D 
                                          DD     package1.constant_out+00000025H 
                                          DD     __lcl.00000124 
                                          DD     0000002D 
                                          DD     package1.constant_out+00000029H 
                                          DD     __lcl.00000124 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure package1.vec_print   
                       ;                                
                                          PUBLIC package1.vec_print 
                       package1.vec_print PROC   NEAR   
;  Source Line # 47
   47| 000000 55                          PUSH   EBP    
   47| 000001 8BEC                        MOV    EBP, ESP 
   47| 000003 83EC                        SUB    ESP, 8 
   47| 000005 08                                        
   47| 000006 803D                        CMP    BYTE PTR package1.vec_print__elab_bool, 0 
   47| 000008 00000000                                  
   47| 00000C 00                                        
   47|                 L14:                             
   47| 00000D 74                          JE     SHORT L15 
   47| 00000E 4E                                        
;  Source Line # 47
   47| 00000F 8B05                        MOV    EAX, package1.n 
   47| 000011 00000000                                  
   47| 000015 8945                        MOV    [EBP-8], EAX 
   47| 000017 F8                                        
;  Source Line # 49
   49| 000018 837D                        CMP    DWORD PTR [EBP-8], 0 
   49| 00001A F8                                        
   49| 00001B 00                                        
   49| 00001C 7E                          JLE    SHORT L8 
   49| 00001D 39                                        
   49| 00001E C745                        MOV    DWORD PTR [EBP-4], 1 
   49| 000020 FC                                        
   49| 000021 01000000                                  
   49|                 L11:                             
;  Source Line # 50
   50| 000025 0FB605                      MOVZX  EAX, BYTE PTR ada.integer_text_io.default_base
   50| 000028 00000000                                  
   50| 00002C 50                          PUSH   EAX    
   50| 00002D 6A                          PUSH   4      
   50| 00002E 04                                        
   50| 00002F 8B5D                        MOV    EBX, [EBP+8] ;  v
   50| 000031 08                                        
   50| 000032 8B4D                        MOV    ECX, [EBP-4] 
   50| 000034 FC                                        
   50| 000035 3B0D                        CMP    ECX, package1.vec__constrained_array____1 
   50| 000037 00000000                                  
   50|                 L16:                             
   50| 00003B 7F                          JG     SHORT L17 
   50| 00003C 22                                        
   50| 00003D FF748B                      PUSH   DWORD PTR [EBX+4*ECX-4] 
   50| 000040 FC                                        
   50| 000041 E8                          CALL   ada.integer_text_io.put__2 
   50| 000042 00000000                                  
;  Source Line # 51
   51| 000046 8B55                        MOV    EDX, [EBP-8] 
   51| 000048 F8                                        
   51| 000049 3955                        CMP    [EBP-4], EDX 
   51| 00004B FC                                        
   51| 00004C 74                          JE     SHORT L8 
   51| 00004D 09                                        
   51| 00004E 8B45                        MOV    EAX, [EBP-4] 
   51| 000050 FC                                        
   51| 000051 40                          INC    EAX    
   51| 000052 8945                        MOV    [EBP-4], EAX 
   51| 000054 FC                                        
   51| 000055 EB                          JMP    SHORT L11 
   51| 000056 CE                                        
   51|                 L8:                              
;  Source Line # 52
   52| 000057 8BE5                        MOV    ESP, EBP 
   52| 000059 5D                          POP    EBP    
   52| 00005A C2                          RET    4      
   52| 00005B 0400                                      
   52|                 L15:                             
   52| 00005D F6                          DB     246    
   52| 00005E F4                          DB     244    
   52|                 L17:                             
   52| 00005F 8D05                        LEA    EAX, L16+5 
   52| 000061 40000000                                  
   52| 000065 50                          PUSH   EAX    
   52| 000066 E9                          JMP    rts_raise_constraint_error 
   52| 000067 00000000                                  
                       ;                                
                       package1.vec_print ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000120     DD     00000701 
                                          DD     0000002F 
                                          DD     package1.vec_print 
                                          DD     __lcl.00000124 
                                          DD     0000002F 
                                          DD     package1.vec_print+0000000FH 
                                          DD     __lcl.00000124 
                                          DD     00000031 
                                          DD     package1.vec_print+00000018H 
                                          DD     __lcl.00000124 
                                          DD     00000032 
                                          DD     package1.vec_print+00000025H 
                                          DD     __lcl.00000124 
                                          DD     00000033 
                                          DD     package1.vec_print+00000046H 
                                          DD     __lcl.00000124 
                                          DD     00000034 
                                          DD     package1.vec_print+00000057H 
                                          DD     __lcl.00000124 
                                          DD     00000034 
                                          DD     package1.vec_print+00000067H 
                                          DD     __lcl.00000124 
; ********* End of segment, Total Size = 88

                       ;                                
                       ;  Start of procedure package1.matr_print   
                       ;                                
                                          PUBLIC package1.matr_print 
                       package1.matr_print PROC  NEAR   
;  Source Line # 54
   54| 000000 55                          PUSH   EBP    
   54| 000001 8BEC                        MOV    EBP, ESP 
   54| 000003 83EC                        SUB    ESP, 8 
   54| 000005 08                                        
   54| 000006 803D                        CMP    BYTE PTR package1.matr_print__elab_bool, 0 
   54| 000008 00000000                                  
   54| 00000C 00                                        
   54|                 L14:                             
   54| 00000D 74                          JE     SHORT L15 
   54| 00000E 55                                        
;  Source Line # 54
   54| 00000F 8B05                        MOV    EAX, package1.n 
   54| 000011 00000000                                  
   54| 000015 8945                        MOV    [EBP-8], EAX 
   54| 000017 F8                                        
;  Source Line # 56
   56| 000018 837D                        CMP    DWORD PTR [EBP-8], 0 
   56| 00001A F8                                        
   56| 00001B 00                                        
   56| 00001C 7E                          JLE    SHORT L8 
   56| 00001D 40                                        
   56| 00001E C745                        MOV    DWORD PTR [EBP-4], 1 
   56| 000020 FC                                        
   56| 000021 01000000                                  
   56|                 L11:                             
;  Source Line # 57
   57| 000025 8B45                        MOV    EAX, [EBP+8] ;  m
   57| 000027 08                                        
   57| 000028 8B5D                        MOV    EBX, [EBP-4] 
   57| 00002A FC                                        
   57| 00002B 3B1D                        CMP    EBX, package1.matr__constrained_array____1 
   57| 00002D 00000000                                  
   57|                 L16:                             
   57| 000031 7F                          JG     SHORT L17 
   57| 000032 33                                        
   57| 000033 8D5B                        LEA    EBX, [EBX-1] 
   57| 000035 FF                                        
   57| 000036 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   57| 000039 00000000                                  
   57| 00003D 8D0418                      LEA    EAX, [EAX+EBX+0] 
   57| 000040 50                          PUSH   EAX    
   57| 000041 E8                          CALL   package1.vec_print 
   57| 000042 00000000                                  
;  Source Line # 58
   58| 000046 6A                          PUSH   1      
   58| 000047 01                                        
   58| 000048 E8                          CALL   ada.text_io.new_line__2 
   58| 000049 00000000                                  
;  Source Line # 59
   59| 00004D 8B4D                        MOV    ECX, [EBP-8] 
   59| 00004F F8                                        
   59| 000050 394D                        CMP    [EBP-4], ECX 
   59| 000052 FC                                        
   59| 000053 74                          JE     SHORT L8 
   59| 000054 09                                        
   59| 000055 8B45                        MOV    EAX, [EBP-4] 
   59| 000057 FC                                        
   59| 000058 40                          INC    EAX    
   59| 000059 8945                        MOV    [EBP-4], EAX 
   59| 00005B FC                                        
   59| 00005C EB                          JMP    SHORT L11 
   59| 00005D C7                                        
   59|                 L8:                              
;  Source Line # 60
   60| 00005E 8BE5                        MOV    ESP, EBP 
   60| 000060 5D                          POP    EBP    
   60| 000061 C2                          RET    4      
   60| 000062 0400                                      
   60|                 L15:                             
   60| 000064 F6                          DB     246    
   60| 000065 F4                          DB     244    
   60|                 L17:                             
   60| 000066 8D05                        LEA    EAX, L16+5 
   60| 000068 36000000                                  
   60| 00006C 50                          PUSH   EAX    
   60| 00006D E9                          JMP    rts_raise_constraint_error 
   60| 00006E 00000000                                  
                       ;                                
                       package1.matr_print ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000119     DD     00000801 
                                          DD     00000036 
                                          DD     package1.matr_print 
                                          DD     __lcl.00000124 
                                          DD     00000036 
                                          DD     package1.matr_print+0000000FH 
                                          DD     __lcl.00000124 
                                          DD     00000038 
                                          DD     package1.matr_print+00000018H 
                                          DD     __lcl.00000124 
                                          DD     00000039 
                                          DD     package1.matr_print+00000025H 
                                          DD     __lcl.00000124 
                                          DD     0000003A 
                                          DD     package1.matr_print+00000046H 
                                          DD     __lcl.00000124 
                                          DD     0000003B 
                                          DD     package1.matr_print+0000004DH 
                                          DD     __lcl.00000124 
                                          DD     0000003C 
                                          DD     package1.matr_print+0000005EH 
                                          DD     __lcl.00000124 
                                          DD     0000003C 
                                          DD     package1.matr_print+0000006EH 
                                          DD     __lcl.00000124 
; ********* End of segment, Total Size = 100

                       ;                                
                       ;  Start of procedure package1.sort   
                       ;                                
                                          PUBLIC package1.sort 
                       package1.sort      PROC   NEAR   
;  Source Line # 62
   62| 000000 55                          PUSH   EBP    
   62| 000001 8BEC                        MOV    EBP, ESP 
   62| 000003 83EC                        SUB    ESP, 12 
   62| 000005 0C                                        
   62| 000006 803D                        CMP    BYTE PTR package1.sort__elab_bool, 0 
   62| 000008 00000000                                  
   62| 00000C 00                                        
   62|                 L21:                             
   62| 00000D 0F84                        JE     L22    
   62| 00000F 03010000                                  
;  Source Line # 65
   65| 000013 8B45                        MOV    EAX, [EBP+8] ;  V
   65| 000015 08                                        
   65| 000016 BB                          MOV    EBX, 1 
   65| 000017 01000000                                  
   65| 00001B 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
   65| 00001D 00000000                                  
   65|                 L23:                             
   65| 000021 0F8F                        JG     L24    
   65| 000023 F1000000                                  
   65| 000027 8B4C98                      MOV    ECX, [EAX+4*EBX-4] 
   65| 00002A FC                                        
   65| 00002B 894D                        MOV    [EBP-12], ECX ;  Temp
   65| 00002D F4                                        
;  Source Line # 67
   67| 00002E 833D                        CMP    DWORD PTR package1.vec__constrained_array____1,
0                                                       
   67| 000030 00000000                                  
   67| 000034 00                                        
   67| 000035 0F8E                        JLE    L8     
   67| 000037 D5000000                                  
   67| 00003B C745                        MOV    DWORD PTR [EBP-8], 1 
   67| 00003D F8                                        
   67| 00003E 01000000                                  
   67|                 L11:                             
;  Source Line # 68
   68| 000042 833D                        CMP    DWORD PTR package1.vec__constrained_array____1,
0                                                       
   68| 000044 00000000                                  
   68| 000048 00                                        
   68| 000049 0F8E                        JLE    L12    
   68| 00004B AA000000                                  
   68| 00004F C745                        MOV    DWORD PTR [EBP-4], 1 
   68| 000051 FC                                        
   68| 000052 01000000                                  
   68|                 L14:                             
;  Source Line # 69
   69| 000056 8B45                        MOV    EAX, [EBP+8] ;  V
   69| 000058 08                                        
   69| 000059 8B5D                        MOV    EBX, [EBP-8] 
   69| 00005B F8                                        
   69| 00005C 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
   69| 00005E 00000000                                  
   69|                 L25:                             
   69| 000062 0F8F                        JG     L26    
   69| 000064 BC000000                                  
   69| 000068 8B4D                        MOV    ECX, [EBP+8] ;  V
   69| 00006A 08                                        
   69| 00006B 8B55                        MOV    EDX, [EBP-4] 
   69| 00006D FC                                        
   69| 00006E 3B15                        CMP    EDX, package1.vec__constrained_array____1 
   69| 000070 00000000                                  
   69|                 L27:                             
   69| 000074 0F8F                        JG     L28    
   69| 000076 B6000000                                  
   69| 00007A 8B7491                      MOV    ESI, [ECX+4*EDX-4] 
   69| 00007D FC                                        
   69| 00007E 397498                      CMP    [EAX+4*EBX-4], ESI 
   69| 000081 FC                                        
   69| 000082 7E                          JLE    SHORT L15 
   69| 000083 5E                                        
;  Source Line # 71
   71| 000084 8B45                        MOV    EAX, [EBP+8] ;  V
   71| 000086 08                                        
   71| 000087 8B5D                        MOV    EBX, [EBP-8] 
   71| 000089 F8                                        
   71| 00008A 3B1D                        CMP    EBX, package1.vec__constrained_array____1 
   71| 00008C 00000000                                  
   71|                 L29:                             
   71| 000090 0F8F                        JG     L30    
   71| 000092 A6000000                                  
   71| 000096 8B4C98                      MOV    ECX, [EAX+4*EBX-4] 
   71| 000099 FC                                        
   71| 00009A 894D                        MOV    [EBP-12], ECX ;  Temp
   71| 00009C F4                                        
;  Source Line # 72
   72| 00009D 8B55                        MOV    EDX, [EBP+8] ;  V
   72| 00009F 08                                        
   72| 0000A0 8B75                        MOV    ESI, [EBP-4] 
   72| 0000A2 FC                                        
   72| 0000A3 3B35                        CMP    ESI, package1.vec__constrained_array____1 
   72| 0000A5 00000000                                  
   72|                 L31:                             
   72| 0000A9 0F8F                        JG     L32    
   72| 0000AB 99000000                                  
   72| 0000AF 8B7D                        MOV    EDI, [EBP+8] ;  V
   72| 0000B1 08                                        
   72| 0000B2 8B45                        MOV    EAX, [EBP-8] 
   72| 0000B4 F8                                        
   72| 0000B5 3B05                        CMP    EAX, package1.vec__constrained_array____1 
   72| 0000B7 00000000                                  
   72|                 L33:                             
   72| 0000BB 0F8F                        JG     L34    
   72| 0000BD 93000000                                  
   72| 0000C1 8B5CB2                      MOV    EBX, [EDX+4*ESI-4] 
   72| 0000C4 FC                                        
   72| 0000C5 895C87                      MOV    [EDI+4*EAX-4], EBX 
   72| 0000C8 FC                                        
;  Source Line # 73
   73| 0000C9 8B4D                        MOV    ECX, [EBP+8] ;  V
   73| 0000CB 08                                        
   73| 0000CC 8B55                        MOV    EDX, [EBP-4] 
   73| 0000CE FC                                        
   73| 0000CF 3B15                        CMP    EDX, package1.vec__constrained_array____1 
   73| 0000D1 00000000                                  
   73|                 L35:                             
   73| 0000D5 0F8F                        JG     L36    
   73| 0000D7 85000000                                  
   73| 0000DB 8B75                        MOV    ESI, [EBP-12] ;  Temp
   73| 0000DD F4                                        
   73| 0000DE 897491                      MOV    [ECX+4*EDX-4], ESI 
   73| 0000E1 FC                                        
;  Source Line # 74
;  Source Line # 75
   75|                 L15:                             
;  Source Line # 76
   76| 0000E2 8B05                        MOV    EAX, package1.vec__constrained_array____1 
   76| 0000E4 00000000                                  
   76| 0000E8 3945                        CMP    [EBP-4], EAX 
   76| 0000EA FC                                        
   76| 0000EB 74                          JE     SHORT L12 
   76| 0000EC 0C                                        
   76| 0000ED 8B45                        MOV    EAX, [EBP-4] 
   76| 0000EF FC                                        
   76| 0000F0 40                          INC    EAX    
   76| 0000F1 8945                        MOV    [EBP-4], EAX 
   76| 0000F3 FC                                        
   76| 0000F4 E9                          JMP    L14    
   76| 0000F5 5DFFFFFF                                  
   76|                 L12:                             
;  Source Line # 77
   77| 0000F9 8B05                        MOV    EAX, package1.vec__constrained_array____1 
   77| 0000FB 00000000                                  
   77| 0000FF 3945                        CMP    [EBP-8], EAX 
   77| 000101 F8                                        
   77| 000102 74                          JE     SHORT L8 
   77| 000103 0C                                        
   77| 000104 8B45                        MOV    EAX, [EBP-8] 
   77| 000106 F8                                        
   77| 000107 40                          INC    EAX    
   77| 000108 8945                        MOV    [EBP-8], EAX 
   77| 00010A F8                                        
   77| 00010B E9                          JMP    L11    
   77| 00010C 32FFFFFF                                  
   77|                 L8:                              
;  Source Line # 78
   78| 000110 8BE5                        MOV    ESP, EBP 
   78| 000112 5D                          POP    EBP    
   78| 000113 C2                          RET    4      
   78| 000114 0400                                      
   78|                 L22:                             
   78| 000116 F6                          DB     246    
   78| 000117 F4                          DB     244    
   78|                 L24:                             
   78| 000118 8D05                        LEA    EAX, L23+5 
   78| 00011A 26000000                                  
   78| 00011E 50                          PUSH   EAX    
   78| 00011F E9                          JMP    rts_raise_constraint_error 
   78| 000120 00000000                                  
   78|                 L26:                             
   78| 000124 8D05                        LEA    EAX, L25+5 
   78| 000126 67000000                                  
   78| 00012A 50                          PUSH   EAX    
   78| 00012B E9                          JMP    rts_raise_constraint_error 
   78| 00012C 00000000                                  
   78|                 L28:                             
   78| 000130 8D05                        LEA    EAX, L27+5 
   78| 000132 79000000                                  
   78| 000136 50                          PUSH   EAX    
   78| 000137 E9                          JMP    rts_raise_constraint_error 
   78| 000138 00000000                                  
   78|                 L30:                             
   78| 00013C 8D05                        LEA    EAX, L29+5 
   78| 00013E 95000000                                  
   78| 000142 50                          PUSH   EAX    
   78| 000143 E9                          JMP    rts_raise_constraint_error 
   78| 000144 00000000                                  
   78|                 L32:                             
   78| 000148 8D05                        LEA    EAX, L31+5 
   78| 00014A AE000000                                  
   78| 00014E 50                          PUSH   EAX    
   78| 00014F E9                          JMP    rts_raise_constraint_error 
   78| 000150 00000000                                  
   78|                 L34:                             
   78| 000154 8D05                        LEA    EAX, L33+5 
   78| 000156 C0000000                                  
   78| 00015A 50                          PUSH   EAX    
   78| 00015B E9                          JMP    rts_raise_constraint_error 
   78| 00015C 00000000                                  
   78|                 L36:                             
   78| 000160 8D05                        LEA    EAX, L35+5 
   78| 000162 DA000000                                  
   78| 000166 50                          PUSH   EAX    
   78| 000167 E9                          JMP    rts_raise_constraint_error 
   78| 000168 00000000                                  
                       ;                                
                       package1.sort      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000118     DD     00000E01 
                                          DD     0000003E 
                                          DD     package1.sort 
                                          DD     __lcl.00000124 
                                          DD     00000041 
                                          DD     package1.sort+00000013H 
                                          DD     __lcl.00000124 
                                          DD     00000043 
                                          DD     package1.sort+0000002EH 
                                          DD     __lcl.00000124 
                                          DD     00000044 
                                          DD     package1.sort+00000042H 
                                          DD     __lcl.00000124 
                                          DD     00000045 
                                          DD     package1.sort+00000056H 
                                          DD     __lcl.00000124 
                                          DD     00000047 
                                          DD     package1.sort+00000084H 
                                          DD     __lcl.00000124 
                                          DD     00000048 
                                          DD     package1.sort+0000009DH 
                                          DD     __lcl.00000124 
                                          DD     00000049 
                                          DD     package1.sort+000000C9H 
                                          DD     __lcl.00000124 
                                          DD     0000004A 
                                          DD     package1.sort+000000E2H 
                                          DD     __lcl.00000124 
                                          DD     0000004B 
                                          DD     package1.sort+000000E2H 
                                          DD     __lcl.00000124 
                                          DD     0000004C 
                                          DD     package1.sort+000000E2H 
                                          DD     __lcl.00000124 
                                          DD     0000004D 
                                          DD     package1.sort+000000F9H 
                                          DD     __lcl.00000124 
                                          DD     0000004E 
                                          DD     package1.sort+00000110H 
                                          DD     __lcl.00000124 
                                          DD     0000004E 
                                          DD     package1.sort+00000168H 
                                          DD     __lcl.00000124 
; ********* End of segment, Total Size = 172

                       ;                                
                       ;  Start of procedure package1__elab_body   
                       ;                                
                                          PUBLIC package1__elab_body 
                       package1__elab_body PROC  NEAR   
;  Source Line # 23
   23| 000000 55                          PUSH   EBP    
   23| 000001 8BEC                        MOV    EBP, ESP 
;  Source Line # 25
   25| 000003 C605                        MOV    BYTE PTR package1.matr_input__elab_bool, 1 
   25| 000005 00000000                                  
   25| 000009 01                                        
;  Source Line # 34
   34| 00000A C605                        MOV    BYTE PTR package1.vec_input__elab_bool, 1 
   34| 00000C 00000000                                  
   34| 000010 01                                        
;  Source Line # 41
   41| 000011 C605                        MOV    BYTE PTR package1.constant_out__elab_bool, 1 
   41| 000013 00000000                                  
   41| 000017 01                                        
;  Source Line # 47
   47| 000018 C605                        MOV    BYTE PTR package1.vec_print__elab_bool, 1 
   47| 00001A 00000000                                  
   47| 00001E 01                                        
;  Source Line # 54
   54| 00001F C605                        MOV    BYTE PTR package1.matr_print__elab_bool, 1 
   54| 000021 00000000                                  
   54| 000025 01                                        
;  Source Line # 62
   62| 000026 C605                        MOV    BYTE PTR package1.sort__elab_bool, 1 
   62| 000028 00000000                                  
   62| 00002C 01                                        
;  Source Line # 81
   81| 00002D 8BE5                        MOV    ESP, EBP 
   81| 00002F 5D                          POP    EBP    
   81| 000030 C3                          RET           
                       ;                                
                       package1__elab_body ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000117     DD     00000901 
                                          DD     00000017 
                                          DD     package1__elab_body 
                                          DD     __lcl.00000124 
                                          DD     00000019 
                                          DD     package1__elab_body+00000003H 
                                          DD     __lcl.00000124 
                                          DD     00000022 
                                          DD     package1__elab_body+0000000AH 
                                          DD     __lcl.00000124 
                                          DD     00000029 
                                          DD     package1__elab_body+00000011H 
                                          DD     __lcl.00000124 
                                          DD     0000002F 
                                          DD     package1__elab_body+00000018H 
                                          DD     __lcl.00000124 
                                          DD     00000036 
                                          DD     package1__elab_body+0000001FH 
                                          DD     __lcl.00000124 
                                          DD     0000003E 
                                          DD     package1__elab_body+00000026H 
                                          DD     __lcl.00000124 
                                          DD     00000051 
                                          DD     package1__elab_body+0000002DH 
                                          DD     __lcl.00000124 
                                          DD     00000051 
                                          DD     package1__elab_body+0000002DH 
                                          DD     __lcl.00000124 
; ********* End of segment, Total Size = 112


; ************* .av_dbgr segment :
                                          ALIGN 4       
                                          DD     00000000 
                                          DD     00000000 
     000018            package1__body_rootpart____1 DD package1__pkg_body_subpdesc____1 
; ********* End of segment, Total Size = 32


; ************* .av_dbgi segment :
                                          ALIGN 4       
     00020C            __lcl.00000116     DB     08H    
                                          DB     'Package1' 
                                          DB     00H,00H,00H 
     000218            __lcl.00000115     DD     00000006 
                                          DD     package1.matr_input__subp_body_subpdesc____1 
                                          DD     package1.vec_input__subp_body_subpdesc____1 
                                          DD     package1.constant_out__subp_body_subpdesc____1
                                          DD     package1.vec_print__subp_body_subpdesc____1 
                                          DD     package1.matr_print__subp_body_subpdesc____1 
                                          DD     package1.sort__subp_body_subpdesc____1 
     000234            package1__pkg_body_subpdesc____1 DD __lcl.00000116 
                                          DD     00000007 
                                          DD     __lcl.00000055 
                                          DD     00000017 
                                          DD     00000051 
                                          DD     00000051 
                                          DD     00000001 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000115 
                                          DD     00000000 
                                          DD     __lcl.00000027 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     package1__pkg_subpdesc____1 
                                          DD     00000000 
                                          DD     __lcl.00000117 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     000294            __lcl.00000114     DB     04H    
                                          DB     'Sort' 
                                          DB     00H,00H,00H 
     00029C            package1.sort__subp_body_subpdesc____1 DD __lcl.00000114 
                                          DD     00000006 
                                          DD     __lcl.00000055 
                                          DD     0000003E 
                                          DD     00000040 
                                          DD     0000004E 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000110 
                                          DD     __lcl.00000111 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000113 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000118 
                                          DD     0000000C 
                                          DD     __lcl.00000027 
     000300            __lcl.00000113     DD     00000001 
                                          DD     __lcl.00000109 
     000308            __lcl.00000112     DB     04H    
                                          DB     'Temp' 
                                          DB     00H,00H,00H 
     000310            __lcl.00000111     DD     00000001 
                                          DD     __lcl.00000112 
                                          DD     __lcl.00000031 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000000 
     000328            __lcl.00000110     DD     00000001 
                                          DD     __lcl.00000070 
                                          DD     __lcl.00000042 
                                          DD     00000008 
                                          DD     00000102 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000344            __lcl.00000109     DB     8 DUP(00) 
                                          DD     __lcl.00000055 
                                          DD     00000043 
                                          DD     00000043 
                                          DD     0000004D 
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
                                          DD     __lcl.00000106 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000108 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     0003A8            __lcl.00000108     DD     00000001 
                                          DD     __lcl.00000105 
     0003B0            __lcl.00000107     DB     06H    
                                          DB     'Count1' 
                                          DB     00     
     0003B8            __lcl.00000106     DD     00000001 
                                          DD     __lcl.00000107 
                                          DD     __lcl.00000096 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000001 
     0003D0            __lcl.00000105     DB     8 DUP(00) 
                                          DD     __lcl.00000055 
                                          DD     00000044 
                                          DD     00000044 
                                          DD     0000004C 
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
                                          DD     __lcl.00000102 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000104 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     000434            __lcl.00000104     DD     00000001 
                                          DD     __lcl.00000100 
     00043C            __lcl.00000103     DB     06H    
                                          DB     'Count2' 
                                          DB     00     
     000444            __lcl.00000102     DD     00000001 
                                          DD     __lcl.00000103 
                                          DD     __lcl.00000099 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     00045C            __lcl.00000101     DB     08H    
                                          DB     'Begin#70' 
                                          DB     00H,00H,00H 
     000468            __lcl.00000100     DD     __lcl.00000101 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000055 
                                          DD     00000046 
                                          DD     00000046 
                                          DD     0000004A 
                                          DD     00000003 
                                          DD     00000004 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     0004CC            __lcl.00000099     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000097 
                                          DD     __lcl.00000098 
     0004E8            __lcl.00000098     DD     00000008 
                                          DD     00000007 
                                          DD     package1.vec__constrained_array____1 
     0004F4            __lcl.00000097     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000500            __lcl.00000096     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000094 
                                          DD     __lcl.00000095 
     00051C            __lcl.00000095     DD     00000008 
                                          DD     00000007 
                                          DD     package1.vec__constrained_array____1 
     000528            __lcl.00000094     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000534            __lcl.00000093     DB     0AH    
                                          DB     'Matr_print' 
                                          DB     00     
     000540            package1.matr_print__subp_body_subpdesc____1 DD __lcl.00000093 
                                          DD     00000005 
                                          DD     __lcl.00000055 
                                          DD     00000036 
                                          DD     00000037 
                                          DD     0000003C 
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
                                          DD     __lcl.00000119 
                                          DD     00000008 
                                          DD     __lcl.00000027 
     0005A4            __lcl.00000092     DD     00000001 
                                          DD     __lcl.00000089 
     0005AC            __lcl.00000091     DB     01H    
                                          DB     'm'    
                                          DW     0000   
     0005B0            __lcl.00000090     DD     00000001 
                                          DD     __lcl.00000091 
                                          DD     __lcl.00000044 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0005CC            __lcl.00000089     DB     8 DUP(00) 
                                          DD     __lcl.00000055 
                                          DD     00000038 
                                          DD     00000038 
                                          DD     0000003B 
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
     000630            __lcl.00000088     DD     00000001 
                                          DD     __lcl.00000057 
                                          DD     __lcl.00000087 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000648            __lcl.00000087     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000085 
                                          DD     __lcl.00000086 
     000664            __lcl.00000086     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000670            __lcl.00000085     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00067C            __lcl.00000084     DB     09H    
                                          DB     'Vec_print' 
                                          DW     0000   
     000688            package1.vec_print__subp_body_subpdesc____1 DD __lcl.00000084 
                                          DD     00000004 
                                          DD     __lcl.00000055 
                                          DD     0000002F 
                                          DD     00000030 
                                          DD     00000034 
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
                                          DD     __lcl.00000120 
                                          DD     00000008 
                                          DD     __lcl.00000027 
     0006EC            __lcl.00000083     DD     00000001 
                                          DD     __lcl.00000080 
     0006F4            __lcl.00000082     DB     01H    
                                          DB     'v'    
                                          DW     0000   
     0006F8            __lcl.00000081     DD     00000001 
                                          DD     __lcl.00000082 
                                          DD     __lcl.00000042 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000714            __lcl.00000080     DB     8 DUP(00) 
                                          DD     __lcl.00000055 
                                          DD     00000031 
                                          DD     00000031 
                                          DD     00000033 
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
     000778            __lcl.00000079     DD     00000001 
                                          DD     __lcl.00000057 
                                          DD     __lcl.00000078 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000790            __lcl.00000078     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000076 
                                          DD     __lcl.00000077 
     0007AC            __lcl.00000077     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     0007B8            __lcl.00000076     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0007C4            __lcl.00000075     DB     0CH    
                                          DB     'Constant_Out' 
                                          DB     00H,00H,00H 
     0007D4            package1.constant_out__subp_body_subpdesc____1 DD __lcl.00000075 
                                          DD     00000003 
                                          DD     __lcl.00000055 
                                          DD     00000029 
                                          DD     0000002A 
                                          DD     0000002D 
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
                                          DD     __lcl.00000121 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     000838            __lcl.00000074     DB     01H    
                                          DB     'a'    
                                          DW     0000   
     00083C            __lcl.00000073     DD     00000001 
                                          DD     __lcl.00000074 
                                          DD     __lcl.00000031 
                                          DD     00000008 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000858            __lcl.00000072     DB     09H    
                                          DB     'Vec_Input' 
                                          DW     0000   
     000864            package1.vec_input__subp_body_subpdesc____1 DD __lcl.00000072 
                                          DD     00000002 
                                          DD     __lcl.00000055 
                                          DD     00000022 
                                          DD     00000023 
                                          DD     00000027 
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
                                          DD     __lcl.00000122 
                                          DD     00000008 
                                          DD     __lcl.00000027 
     0008C8            __lcl.00000071     DD     00000001 
                                          DD     __lcl.00000068 
     0008D0            __lcl.00000070     DB     01H    
                                          DB     'V'    
                                          DW     0000   
     0008D4            __lcl.00000069     DD     00000001 
                                          DD     __lcl.00000070 
                                          DD     __lcl.00000042 
                                          DD     00000008 
                                          DD     00000102 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0008F0            __lcl.00000068     DB     8 DUP(00) 
                                          DD     __lcl.00000055 
                                          DD     00000024 
                                          DD     00000024 
                                          DD     00000026 
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
     000954            __lcl.00000067     DD     00000001 
                                          DD     __lcl.00000057 
                                          DD     __lcl.00000066 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     00096C            __lcl.00000066     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000064 
                                          DD     __lcl.00000065 
     000988            __lcl.00000065     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000994            __lcl.00000064     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0009A0            __lcl.00000063     DB     0AH    
                                          DB     'Matr_Input' 
                                          DB     00     
     0009AC            package1.matr_input__subp_body_subpdesc____1 DD __lcl.00000063 
                                          DD     00000001 
                                          DD     __lcl.00000055 
                                          DD     00000019 
                                          DD     0000001A 
                                          DD     00000020 
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
                                          DD     __lcl.00000123 
                                          DD     00000010 
                                          DD     __lcl.00000027 
     000A10            __lcl.00000062     DD     00000001 
                                          DD     __lcl.00000059 
     000A18            __lcl.00000061     DB     01H    
                                          DB     'M'    
                                          DW     0000   
     000A1C            __lcl.00000060     DD     00000001 
                                          DD     __lcl.00000061 
                                          DD     __lcl.00000044 
                                          DD     00000008 
                                          DD     00000102 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000A38            __lcl.00000059     DB     8 DUP(00) 
                                          DD     __lcl.00000055 
                                          DD     0000001B 
                                          DD     0000001B 
                                          DD     0000001F 
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
     000A9C            __lcl.00000058     DD     00000001 
                                          DD     __lcl.00000054 
     000AA4            __lcl.00000057     DB     01H    
                                          DB     'i'    
                                          DW     0000   
     000AA8            __lcl.00000056     DD     00000001 
                                          DD     __lcl.00000057 
                                          DD     __lcl.00000048 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     000AC0            __lcl.00000055     DB     0FH    
                                          DB     '..\package1.adb' 
     000AD0            __lcl.00000054     DB     8 DUP(00) 
                                          DD     __lcl.00000055 
                                          DD     0000001C 
                                          DD     0000001C 
                                          DD     0000001E 
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
     000B34            __lcl.00000053     DB     01H    
                                          DB     'j'    
                                          DW     0000   
     000B38            __lcl.00000052     DD     00000001 
                                          DD     __lcl.00000053 
                                          DD     __lcl.00000051 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000B50            __lcl.00000051     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000049 
                                          DD     __lcl.00000050 
     000B6C            __lcl.00000050     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000B78            __lcl.00000049     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000B84            __lcl.00000048     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000046 
                                          DD     __lcl.00000047 
     000BA0            __lcl.00000047     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF0 
     000BAC            __lcl.00000046     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000BB8            __lcl.00000045     DB     04H    
                                          DB     'Matr' 
                                          DB     00H,00H,00H 
     000BC0            __lcl.00000044     DD     __lcl.00000045 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000036 
                                          DD     __lcl.00000042 
                                          DD     __lcl.00000035 
     000BD8            __lcl.00000043     DB     03H    
                                          DB     'Vec'  
     000BDC            __lcl.00000042     DD     __lcl.00000043 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000041 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000040 
     000BF4            __lcl.00000041     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     000C00            __lcl.00000040     DD     00000001 
                                          DD     __lcl.00000039 
     000C08            __lcl.00000039     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000037 
                                          DD     __lcl.00000038 
     000C24            __lcl.00000038     DD     00000008 
                                          DD     00000007 
                                          DD     package1.vec__constrained_array____1 
     000C30            __lcl.00000037     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000C3C            __lcl.00000036     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__COMP_SU_SIZE 
     000C48            __lcl.00000035     DD     00000001 
                                          DD     __lcl.00000034 
     000C50            __lcl.00000034     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000032 
                                          DD     __lcl.00000033 
     000C6C            __lcl.00000033     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__constrained_array____1 
     000C78            __lcl.00000032     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000C84            __lcl.00000031     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000029 
                                          DD     __lcl.00000030 
     000CA0            __lcl.00000030     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     000CAC            __lcl.00000029     DD     00000008 
                                          DD     00000003 
                                          DD     80000000 
     000CB8            __lcl.00000028     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     000CC4            __lcl.00000027     DD     00000000 
; ********* End of segment, Total Size = 3272


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000CC8            __lcl.00000124     DB     1F     
                                          DB     'D:\AdaCOURSE-CHRNN\package1.adb' 
; ********* End of segment, Total Size = 3304

                       ;                                
                       CODE               ENDS          

