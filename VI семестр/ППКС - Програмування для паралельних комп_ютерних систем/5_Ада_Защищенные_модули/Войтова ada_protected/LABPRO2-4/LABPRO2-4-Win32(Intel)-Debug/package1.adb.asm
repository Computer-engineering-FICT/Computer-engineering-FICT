
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
;  Source Line # 17
   17| 000048 8BE5                        MOV    ESP, EBP 
   17| 00004A 5D                          POP    EBP    
   17| 00004B C3                          RET           
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
                                          DD     00000011 
                                          DD     package1__elab_spec+00000048H 
                                          DD     __lcl.00000026 
                                          DD     00000011 
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
     000000            package1.matr_print__elab_bool DB 00 
     000001            package1.vec_print__elab_bool DB 00 
     000002            package1.constant_out__elab_bool DB 00 
                                          DB     00     
     000004            package1.p         DD     00000002 
     000008            package1.n         DD     00000032 
; ********* End of segment, Total Size = 12


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
                                          DD     00000011 
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
     0001EC            __lcl.00000026     DB     19     
                                          DB     'D:\LABPRO2-1\package1.adb' 
; ********* End of segment, Total Size = 518

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
                       ;  Start of procedure package1.constant_out   
                       ;                                
                                          PUBLIC package1.constant_out 
                       package1.constant_out PROC NEAR  
;  Source Line # 22
   22| 000000 55                          PUSH   EBP    
   22| 000001 8BEC                        MOV    EBP, ESP 
;  Source Line # 24
   24| 000003 0FB605                      MOVZX  EAX, BYTE PTR ada.integer_text_io.default_base
   24| 000006 00000000                                  
   24| 00000A 50                          PUSH   EAX    
   24| 00000B 6A                          PUSH   4      
   24| 00000C 04                                        
   24| 00000D FF75                        PUSH   DWORD PTR [EBP+8] ;  a
   24| 00000F 08                                        
   24| 000010 E8                          CALL   ada.integer_text_io.put__2 
   24| 000011 00000000                                  
;  Source Line # 25
   25| 000015 6A                          PUSH   1      
   25| 000016 01                                        
   25| 000017 E8                          CALL   ada.text_io.new_line__2 
   25| 000018 00000000                                  
;  Source Line # 26
   26| 00001C 8BE5                        MOV    ESP, EBP 
   26| 00001E 5D                          POP    EBP    
   26| 00001F C2                          RET    4      
   26| 000020 0400                                      
                       ;                                
                       package1.constant_out ENDP       


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000074     DD     00000501 
                                          DD     00000016 
                                          DD     package1.constant_out 
                                          DD     __lcl.00000075 
                                          DD     00000018 
                                          DD     package1.constant_out+00000003H 
                                          DD     __lcl.00000075 
                                          DD     00000019 
                                          DD     package1.constant_out+00000015H 
                                          DD     __lcl.00000075 
                                          DD     0000001A 
                                          DD     package1.constant_out+0000001CH 
                                          DD     __lcl.00000075 
                                          DD     0000001A 
                                          DD     package1.constant_out+0000001EH 
                                          DD     __lcl.00000075 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure package1.vec_print   
                       ;                                
                                          PUBLIC package1.vec_print 
                       package1.vec_print PROC   NEAR   
;  Source Line # 28
   28| 000000 55                          PUSH   EBP    
   28| 000001 8BEC                        MOV    EBP, ESP 
   28| 000003 83EC                        SUB    ESP, 8 
   28| 000005 08                                        
;  Source Line # 29
   29| 000006 8B05                        MOV    EAX, package1.n 
   29| 000008 00000000                                  
   29| 00000C 8945                        MOV    [EBP-8], EAX 
   29| 00000E F8                                        
;  Source Line # 30
   30| 00000F 837D                        CMP    DWORD PTR [EBP-8], 0 
   30| 000011 F8                                        
   30| 000012 00                                        
   30| 000013 7E                          JLE    SHORT L3 
   30| 000014 31                                        
   30| 000015 C745                        MOV    DWORD PTR [EBP-4], 1 
   30| 000017 FC                                        
   30| 000018 01000000                                  
   30|                 L6:                              
;  Source Line # 31
   31| 00001C 0FB605                      MOVZX  EAX, BYTE PTR ada.integer_text_io.default_base
   31| 00001F 00000000                                  
   31| 000023 50                          PUSH   EAX    
   31| 000024 6A                          PUSH   4      
   31| 000025 04                                        
   31| 000026 8B5D                        MOV    EBX, [EBP+8] ;  v
   31| 000028 08                                        
   31| 000029 8B4D                        MOV    ECX, [EBP-4] 
   31| 00002B FC                                        
   31| 00002C FF748B                      PUSH   DWORD PTR [EBX+4*ECX-4] 
   31| 00002F FC                                        
   31| 000030 E8                          CALL   ada.integer_text_io.put__2 
   31| 000031 00000000                                  
;  Source Line # 32
   32| 000035 8B55                        MOV    EDX, [EBP-8] 
   32| 000037 F8                                        
   32| 000038 3955                        CMP    [EBP-4], EDX 
   32| 00003A FC                                        
   32| 00003B 74                          JE     SHORT L3 
   32| 00003C 09                                        
   32| 00003D 8B45                        MOV    EAX, [EBP-4] 
   32| 00003F FC                                        
   32| 000040 40                          INC    EAX    
   32| 000041 8945                        MOV    [EBP-4], EAX 
   32| 000043 FC                                        
   32| 000044 EB                          JMP    SHORT L6 
   32| 000045 D6                                        
   32|                 L3:                              
;  Source Line # 33
   33| 000046 8BE5                        MOV    ESP, EBP 
   33| 000048 5D                          POP    EBP    
   33| 000049 C2                          RET    4      
   33| 00004A 0400                                      
                       ;                                
                       package1.vec_print ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000073     DD     00000701 
                                          DD     0000001C 
                                          DD     package1.vec_print 
                                          DD     __lcl.00000075 
                                          DD     0000001D 
                                          DD     package1.vec_print+00000006H 
                                          DD     __lcl.00000075 
                                          DD     0000001E 
                                          DD     package1.vec_print+0000000FH 
                                          DD     __lcl.00000075 
                                          DD     0000001F 
                                          DD     package1.vec_print+0000001CH 
                                          DD     __lcl.00000075 
                                          DD     00000020 
                                          DD     package1.vec_print+00000035H 
                                          DD     __lcl.00000075 
                                          DD     00000021 
                                          DD     package1.vec_print+00000046H 
                                          DD     __lcl.00000075 
                                          DD     00000021 
                                          DD     package1.vec_print+00000048H 
                                          DD     __lcl.00000075 
; ********* End of segment, Total Size = 88

                       ;                                
                       ;  Start of procedure package1.matr_print   
                       ;                                
                                          PUBLIC package1.matr_print 
                       package1.matr_print PROC  NEAR   
;  Source Line # 35
   35| 000000 55                          PUSH   EBP    
   35| 000001 8BEC                        MOV    EBP, ESP 
   35| 000003 83EC                        SUB    ESP, 8 
   35| 000005 08                                        
;  Source Line # 36
   36| 000006 8B05                        MOV    EAX, package1.n 
   36| 000008 00000000                                  
   36| 00000C 8945                        MOV    [EBP-8], EAX 
   36| 00000E F8                                        
;  Source Line # 37
   37| 00000F 837D                        CMP    DWORD PTR [EBP-8], 0 
   37| 000011 F8                                        
   37| 000012 00                                        
   37| 000013 7E                          JLE    SHORT L3 
   37| 000014 38                                        
   37| 000015 C745                        MOV    DWORD PTR [EBP-4], 1 
   37| 000017 FC                                        
   37| 000018 01000000                                  
   37|                 L6:                              
;  Source Line # 38
   38| 00001C 8B45                        MOV    EAX, [EBP+8] ;  m
   38| 00001E 08                                        
   38| 00001F 8B5D                        MOV    EBX, [EBP-4] 
   38| 000021 FC                                        
   38| 000022 8D5B                        LEA    EBX, [EBX-1] 
   38| 000024 FF                                        
   38| 000025 0FAF1D                      IMUL   EBX, package1.matr__COMP_SU_SIZE 
   38| 000028 00000000                                  
   38| 00002C 8D0418                      LEA    EAX, [EAX+EBX+0] 
   38| 00002F 50                          PUSH   EAX    
   38| 000030 E8                          CALL   package1.vec_print 
   38| 000031 00000000                                  
;  Source Line # 39
   39| 000035 6A                          PUSH   1      
   39| 000036 01                                        
   39| 000037 E8                          CALL   ada.text_io.new_line__2 
   39| 000038 00000000                                  
;  Source Line # 40
   40| 00003C 8B4D                        MOV    ECX, [EBP-8] 
   40| 00003E F8                                        
   40| 00003F 394D                        CMP    [EBP-4], ECX 
   40| 000041 FC                                        
   40| 000042 74                          JE     SHORT L3 
   40| 000043 09                                        
   40| 000044 8B45                        MOV    EAX, [EBP-4] 
   40| 000046 FC                                        
   40| 000047 40                          INC    EAX    
   40| 000048 8945                        MOV    [EBP-4], EAX 
   40| 00004A FC                                        
   40| 00004B EB                          JMP    SHORT L6 
   40| 00004C CF                                        
   40|                 L3:                              
;  Source Line # 41
   41| 00004D 8BE5                        MOV    ESP, EBP 
   41| 00004F 5D                          POP    EBP    
   41| 000050 C2                          RET    4      
   41| 000051 0400                                      
                       ;                                
                       package1.matr_print ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000072     DD     00000801 
                                          DD     00000023 
                                          DD     package1.matr_print 
                                          DD     __lcl.00000075 
                                          DD     00000024 
                                          DD     package1.matr_print+00000006H 
                                          DD     __lcl.00000075 
                                          DD     00000025 
                                          DD     package1.matr_print+0000000FH 
                                          DD     __lcl.00000075 
                                          DD     00000026 
                                          DD     package1.matr_print+0000001CH 
                                          DD     __lcl.00000075 
                                          DD     00000027 
                                          DD     package1.matr_print+00000035H 
                                          DD     __lcl.00000075 
                                          DD     00000028 
                                          DD     package1.matr_print+0000003CH 
                                          DD     __lcl.00000075 
                                          DD     00000029 
                                          DD     package1.matr_print+0000004DH 
                                          DD     __lcl.00000075 
                                          DD     00000029 
                                          DD     package1.matr_print+0000004FH 
                                          DD     __lcl.00000075 
; ********* End of segment, Total Size = 100

                       ;                                
                       ;  Start of procedure package1__elab_body   
                       ;                                
                                          PUBLIC package1__elab_body 
                       package1__elab_body PROC  NEAR   
;  Source Line # 43
   43| 000000 C3                          RET           
                       ;                                
                       package1__elab_body ENDP         

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000071     DD     00000201 
                                          DD     0000002B 
                                          DD     package1__elab_body 
                                          DD     __lcl.00000075 
                                          DD     0000002B 
                                          DD     package1__elab_body+FFFFFFFDH 
                                          DD     __lcl.00000075 
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
     000208            __lcl.00000070     DB     08H    
                                          DB     'Package1' 
                                          DB     00H,00H,00H 
     000214            __lcl.00000069     DD     00000003 
                                          DD     package1.constant_out__subp_body_subpdesc____1
                                          DD     package1.vec_print__subp_body_subpdesc____1 
                                          DD     package1.matr_print__subp_body_subpdesc____1 
     000224            package1__pkg_body_subpdesc____1 DD __lcl.00000070 
                                          DD     00000004 
                                          DD     __lcl.00000035 
                                          DD     00000014 
                                          DD     0000002B 
                                          DD     0000002B 
                                          DD     00000001 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000069 
                                          DD     00000000 
                                          DD     __lcl.00000027 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     package1__pkg_subpdesc____1 
                                          DD     00000000 
                                          DD     __lcl.00000071 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     000284            __lcl.00000068     DB     0AH    
                                          DB     'Matr_print' 
                                          DB     00     
     000290            package1.matr_print__subp_body_subpdesc____1 DD __lcl.00000068 
                                          DD     00000003 
                                          DD     __lcl.00000035 
                                          DD     00000023 
                                          DD     00000024 
                                          DD     00000029 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000065 
                                          DD     __lcl.00000027 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000067 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000072 
                                          DD     00000008 
                                          DD     __lcl.00000027 
     0002F4            __lcl.00000067     DD     00000001 
                                          DD     __lcl.00000064 
     0002FC            __lcl.00000066     DB     01H    
                                          DB     'm'    
                                          DW     0000   
     000300            __lcl.00000065     DD     00000001 
                                          DD     __lcl.00000066 
                                          DD     __lcl.00000058 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     00031C            __lcl.00000064     DB     8 DUP(00) 
                                          DD     __lcl.00000035 
                                          DD     00000025 
                                          DD     00000025 
                                          DD     00000028 
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
                                          DD     __lcl.00000063 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     000380            __lcl.00000063     DD     00000001 
                                          DD     __lcl.00000047 
                                          DD     __lcl.00000062 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000398            __lcl.00000062     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000108 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000060 
                                          DD     __lcl.00000061 
     0003B4            __lcl.00000061     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     0003C0            __lcl.00000060     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0003CC            __lcl.00000059     DB     04H    
                                          DB     'Matr' 
                                          DB     00H,00H,00H 
     0003D4            __lcl.00000058     DD     __lcl.00000059 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000057 
                                          DD     __lcl.00000041 
                                          DD     __lcl.00000056 
     0003EC            __lcl.00000057     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__COMP_SU_SIZE 
     0003F8            __lcl.00000056     DD     00000001 
                                          DD     __lcl.00000055 
     000400            __lcl.00000055     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000053 
                                          DD     __lcl.00000054 
     00041C            __lcl.00000054     DD     00000008 
                                          DD     00000007 
                                          DD     package1.matr__constrained_array____1 
     000428            __lcl.00000053     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000434            __lcl.00000052     DB     09H    
                                          DB     'Vec_print' 
                                          DW     0000   
     000440            package1.vec_print__subp_body_subpdesc____1 DD __lcl.00000052 
                                          DD     00000002 
                                          DD     __lcl.00000035 
                                          DD     0000001C 
                                          DD     0000001D 
                                          DD     00000021 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000049 
                                          DD     __lcl.00000027 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000051 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000073 
                                          DD     00000008 
                                          DD     __lcl.00000027 
     0004A4            __lcl.00000051     DD     00000001 
                                          DD     __lcl.00000048 
     0004AC            __lcl.00000050     DB     01H    
                                          DB     'v'    
                                          DW     0000   
     0004B0            __lcl.00000049     DD     00000001 
                                          DD     __lcl.00000050 
                                          DD     __lcl.00000041 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0004CC            __lcl.00000048     DB     8 DUP(00) 
                                          DD     __lcl.00000035 
                                          DD     0000001E 
                                          DD     0000001E 
                                          DD     00000020 
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
                                          DD     __lcl.00000046 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     000530            __lcl.00000047     DB     01H    
                                          DB     'i'    
                                          DW     0000   
     000534            __lcl.00000046     DD     00000001 
                                          DD     __lcl.00000047 
                                          DD     __lcl.00000045 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     00054C            __lcl.00000045     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000043 
                                          DD     __lcl.00000044 
     000568            __lcl.00000044     DD     00000008 
                                          DD     00000006 
                                          DD     FFFFFFF8 
     000574            __lcl.00000043     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000580            __lcl.00000042     DB     03H    
                                          DB     'Vec'  
     000584            __lcl.00000041     DD     __lcl.00000042 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000040 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000039 
     00059C            __lcl.00000040     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     0005A8            __lcl.00000039     DD     00000001 
                                          DD     __lcl.00000038 
     0005B0            __lcl.00000038     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000036 
                                          DD     __lcl.00000037 
     0005CC            __lcl.00000037     DD     00000008 
                                          DD     00000007 
                                          DD     package1.vec__constrained_array____1 
     0005D8            __lcl.00000036     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0005E4            __lcl.00000035     DB     0FH    
                                          DB     '..\package1.adb' 
     0005F4            __lcl.00000034     DB     0CH    
                                          DB     'Constant_Out' 
                                          DB     00H,00H,00H 
     000604            package1.constant_out__subp_body_subpdesc____1 DD __lcl.00000034 
                                          DD     00000001 
                                          DD     __lcl.00000035 
                                          DD     00000016 
                                          DD     00000017 
                                          DD     0000001A 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     __lcl.00000032 
                                          DD     __lcl.00000027 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000027 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000074 
                                          DD     00000000 
                                          DD     __lcl.00000027 
     000668            __lcl.00000033     DB     01H    
                                          DB     'a'    
                                          DW     0000   
     00066C            __lcl.00000032     DD     00000001 
                                          DD     __lcl.00000033 
                                          DD     __lcl.00000031 
                                          DD     00000008 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000688            __lcl.00000031     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000028 
                                          DD     __lcl.00000029 
                                          DD     __lcl.00000030 
     0006A4            __lcl.00000030     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     0006B0            __lcl.00000029     DD     00000008 
                                          DD     00000003 
                                          DD     80000000 
     0006BC            __lcl.00000028     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     0006C8            __lcl.00000027     DD     00000000 
; ********* End of segment, Total Size = 1740


; ************* .av_dbgi segment :
                                          ALIGN 4       
     0006CC            __lcl.00000075     DB     19     
                                          DB     'D:\LABPRO2-1\package1.adb' 
; ********* End of segment, Total Size = 1766

                       ;                                
                       CODE               ENDS          

