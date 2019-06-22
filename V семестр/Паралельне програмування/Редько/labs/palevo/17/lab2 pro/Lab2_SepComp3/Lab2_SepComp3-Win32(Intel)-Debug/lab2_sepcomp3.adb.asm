
                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT Vector_F1 
                       ;                                
                       Listing of Generated Code        
                       ;                                
                       EXCEP              RECORD FLAG:1, SPSAV:1, IPCOUNT:6 
                       ;                                
                       CODE               SEGMENT PUBLIC BYTE 'CODE' USE32 ;  Vector_F1
                                          ASSUME CS:CODE 


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000001     DD     00000000 
; ********* End of segment, Total Size = 4

                       ;                                
                       CODE               ENDS          

                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT Vector_F1.Matrix_F2 
                       ;                                
                       Listing of Generated Code        
                       ;                                
                       EXCEP              RECORD FLAG:1, SPSAV:1, IPCOUNT:6 
                       ;                                
                       CODE               SEGMENT PUBLIC BYTE 'CODE' USE32 ;  Vector_F1.Matrix_F2
                                          ASSUME CS:CODE 


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000004            __lcl.00000002     DD     00000000 
; ********* End of segment, Total Size = 8

                       ;                                
                       CODE               ENDS          

                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT Vector_F1.Matrix_F2.FIO 
                       ;                                
                       Listing of Generated Code        
                       ;                                
                       EXCEP              RECORD FLAG:1, SPSAV:1, IPCOUNT:6 
                       ;                                
                       CODE               SEGMENT PUBLIC BYTE 'CODE' USE32 ;  Vector_F1.Matrix_F2.FIO
                                          ASSUME CS:CODE 


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000008            __lcl.00000003     DD     00000000 
; ********* End of segment, Total Size = 12

                       ;                                
                       CODE               ENDS          

                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT Vector_F1.Matrix_F2.F3 
                       ;                                
                       Listing of Generated Code        
                       ;                                
                       EXCEP              RECORD FLAG:1, SPSAV:1, IPCOUNT:6 
                       ;                                
                       CODE               SEGMENT PUBLIC BYTE 'CODE' USE32 ;  Vector_F1.Matrix_F2.F3
                                          ASSUME CS:CODE 


; ************* .av_dbgi segment :
                                          ALIGN 4       
     00000C            __lcl.00000004     DD     00000000 
; ********* End of segment, Total Size = 16

                       ;                                
                       CODE               ENDS          

                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT Lab2_SepComp3 
                       ;                                
                       Listing of Generated Code        
                       ;                                
                       EXCEP              RECORD FLAG:1, SPSAV:1, IPCOUNT:6 
                       ;                                
                       CODE               SEGMENT PUBLIC BYTE 'CODE' USE32 ;  Lab2_SepComp3
                                          ASSUME CS:CODE 
                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu.vectmult   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu.vectmult 
                       lab2_sepcomp3.modu.vectmult PROC NEAR 
;  Source Line # 17  (Inline # 17 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC0C                      SUB    ESP, 12 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078E500                    CMP    BYTE PTR [EAX-27], 0 ;  VectMult__elab_bool
   17|                 L44:                             
   17| 000017 7441                        JE     SHORT L45 
;  Source Line # 17  (Inline # 20 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000019 C745F800000000              MOV    DWORD PTR [EBP-8], 0 ;  sum
;  Source Line # 17  (Inline # 21 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000020 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 22 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000027 8B4508                      MOV    EAX, [EBP+8] ;  a
   17| 00002A 8B5DFC                      MOV    EBX, [EBP-4] 
   17| 00002D 8B4D0C                      MOV    ECX, [EBP+12] ;  b
   17| 000030 8B55FC                      MOV    EDX, [EBP-4] 
   17| 000033 8B7498FC                    MOV    ESI, [EAX+4*EBX-4] 
   17| 000037 0FAF7491FC                  IMUL   ESI, [ECX+4*EDX-4] 
   17| 00003C CE                          INTO          
   17| 00003D 0375F8                      ADD    ESI, [EBP-8] ;  sum
   17| 000040 CE                          INTO          
   17| 000041 8975F8                      MOV    [EBP-8], ESI ;  sum
;  Source Line # 17  (Inline # 23 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000044 8B7DFC                      MOV    EDI, [EBP-4] 
   17| 000047 47                          INC    EDI    
   17| 000048 897DFC                      MOV    [EBP-4], EDI 
   17| 00004B 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 00004F 7ED6                        JLE    SHORT L43 
;  Source Line # 17  (Inline # 24 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000051 8B45F8                      MOV    EAX, [EBP-8] ;  sum
   17| 000054 8BE5                        MOV    ESP, EBP 
   17| 000056 5D                          POP    EBP    
   17| 000057 C20800                      RET    8      
   17|                 L45:                             
   17| 00005A F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu.vectmult ENDP  


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000419     DD     00000703 
                                          DD     00000011 
                                          DD     00000000 
                                          DD     __lcl.00000420 
                                          DD     00000014 
                                          DD     00000019 
                                          DD     __lcl.00000420 
                                          DD     00000015 
                                          DD     00000020 
                                          DD     __lcl.00000420 
                                          DD     00000016 
                                          DD     00000027 
                                          DD     __lcl.00000420 
                                          DD     00000017 
                                          DD     00000044 
                                          DD     __lcl.00000420 
                                          DD     00000018 
                                          DD     00000051 
                                          DD     __lcl.00000420 
                                          DD     00000018 
                                          DD     0000005B 
                                          DD     __lcl.00000420 
; ********* End of segment, Total Size = 88

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu.vectsum   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu.vectsum 
                       lab2_sepcomp3.modu.vectsum PROC NEAR 
;  Source Line # 17  (Inline # 28 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC14                      SUB    ESP, 20 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078E600                    CMP    BYTE PTR [EAX-26], 0 ;  VectSum__elab_bool
   17|                 L44:                             
   17| 000017 7446                        JE     SHORT L45 
;  Source Line # 17  (Inline # 31 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000019 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 32 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000020 8B450C                      MOV    EAX, [EBP+12] ;  a
   17| 000023 8B5DFC                      MOV    EBX, [EBP-4] 
   17| 000026 8B4D10                      MOV    ECX, [EBP+16] ;  b
   17| 000029 8B55FC                      MOV    EDX, [EBP-4] 
   17| 00002C 8B7498FC                    MOV    ESI, [EAX+4*EBX-4] 
   17| 000030 037491FC                    ADD    ESI, [ECX+4*EDX-4] 
   17| 000034 CE                          INTO          
   17| 000035 8B7DFC                      MOV    EDI, [EBP-4] 
   17| 000038 8974BDEC                    MOV    [EBP+4*EDI-20], ESI ;  c
;  Source Line # 17  (Inline # 33 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 00003C 8B45FC                      MOV    EAX, [EBP-4] 
   17| 00003F 40                          INC    EAX    
   17| 000040 8945FC                      MOV    [EBP-4], EAX 
   17| 000043 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 000047 7ED7                        JLE    SHORT L43 
;  Source Line # 17  (Inline # 34 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000049 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   17| 00004C 8D75F0                      LEA    ESI, [EBP-16] ;  c
   17| 00004F 8D38                        LEA    EDI, [EAX+0] 
   17| 000051 A5                          MOVSD         
   17| 000052 A5                          MOVSD         
   17| 000053 A5                          MOVSD         
   17| 000054 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   17| 000057 8BC3                        MOV    EAX, EBX 
   17| 000059 8BE5                        MOV    ESP, EBP 
   17| 00005B 5D                          POP    EBP    
   17| 00005C C20C00                      RET    12     
   17|                 L45:                             
   17| 00005F F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu.vectsum ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000418     DD     00000603 
                                          DD     0000001C 
                                          DD     00000000 
                                          DD     __lcl.00000420 
                                          DD     0000001F 
                                          DD     00000019 
                                          DD     __lcl.00000420 
                                          DD     00000020 
                                          DD     00000020 
                                          DD     __lcl.00000420 
                                          DD     00000021 
                                          DD     0000003C 
                                          DD     __lcl.00000420 
                                          DD     00000022 
                                          DD     00000049 
                                          DD     __lcl.00000420 
                                          DD     00000022 
                                          DD     00000060 
                                          DD     __lcl.00000420 
; ********* End of segment, Total Size = 76

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu.vectsort   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu.vectsort 
                       lab2_sepcomp3.modu.vectsort PROC NEAR 
;  Source Line # 17  (Inline # 38 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC0C                      SUB    ESP, 12 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078E700                    CMP    BYTE PTR [EAX-25], 0 ;  VectSort__elab_bool
   17|                 L48:                             
   17| 000017 7476                        JE     SHORT L49 
;  Source Line # 17  (Inline # 39 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000019 C645FC01                    MOV    BYTE PTR [EBP-4], 1 ;  flag
;  Source Line # 17  (Inline # 42 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 00001D 807DFC00                    CMP    BYTE PTR [EBP-4], 0 ;  flag
   17| 000021 7466                        JE     SHORT L40 
   17|                 L41:                             
;  Source Line # 17  (Inline # 43 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000023 C645FC00                    MOV    BYTE PTR [EBP-4], 0 ;  flag
;  Source Line # 17  (Inline # 44 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000027 C745F802000000              MOV    DWORD PTR [EBP-8], 2 
   17|                 L45:                             
;  Source Line # 17  (Inline # 45 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 00002E 8B4508                      MOV    EAX, [EBP+8] ;  a
   17| 000031 8B5DF8                      MOV    EBX, [EBP-8] 
   17| 000034 8B4D08                      MOV    ECX, [EBP+8] ;  a
   17| 000037 8B55F8                      MOV    EDX, [EBP-8] 
   17| 00003A 8B7491FC                    MOV    ESI, [ECX+4*EDX-4] 
   17| 00003E 397498F8                    CMP    [EAX+4*EBX-8], ESI 
   17| 000042 7D32                        JGE    SHORT L46 
;  Source Line # 17  (Inline # 46 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000044 8B4508                      MOV    EAX, [EBP+8] ;  a
   17| 000047 8B5DF8                      MOV    EBX, [EBP-8] 
   17| 00004A 8B4C98F8                    MOV    ECX, [EAX+4*EBX-8] 
   17| 00004E 894DF4                      MOV    [EBP-12], ECX ;  help
;  Source Line # 17  (Inline # 47 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000051 8B5508                      MOV    EDX, [EBP+8] ;  a
   17| 000054 8B75F8                      MOV    ESI, [EBP-8] 
   17| 000057 8B7D08                      MOV    EDI, [EBP+8] ;  a
   17| 00005A 8B45F8                      MOV    EAX, [EBP-8] 
   17| 00005D 8B5CB2FC                    MOV    EBX, [EDX+4*ESI-4] 
   17| 000061 895C87F8                    MOV    [EDI+4*EAX-8], EBX 
;  Source Line # 17  (Inline # 48 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000065 8B4D08                      MOV    ECX, [EBP+8] ;  a
   17| 000068 8B55F8                      MOV    EDX, [EBP-8] 
   17| 00006B 8B75F4                      MOV    ESI, [EBP-12] ;  help
   17| 00006E 897491FC                    MOV    [ECX+4*EDX-4], ESI 
;  Source Line # 17  (Inline # 49 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000072 C645FC01                    MOV    BYTE PTR [EBP-4], 1 ;  flag
;  Source Line # 17  (Inline # 50 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17|                 L46:                             
;  Source Line # 17  (Inline # 51 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000076 8B45F8                      MOV    EAX, [EBP-8] 
   17| 000079 40                          INC    EAX    
   17| 00007A 8945F8                      MOV    [EBP-8], EAX 
   17| 00007D 837DF803                    CMP    DWORD PTR [EBP-8], 3 
   17| 000081 7EAB                        JLE    SHORT L45 
;  Source Line # 17  (Inline # 52 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000083 807DFC00                    CMP    BYTE PTR [EBP-4], 0 ;  flag
   17| 000087 759A                        JNE    SHORT L41 
   17|                 L40:                             
   17| 000089 8BE5                        MOV    ESP, EBP 
   17| 00008B 5D                          POP    EBP    
   17| 00008C C20400                      RET    4      
   17|                 L49:                             
   17| 00008F F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu.vectsort ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000417     DD     00000E03 
                                          DD     00000026 
                                          DD     00000000 
                                          DD     __lcl.00000420 
                                          DD     00000027 
                                          DD     00000019 
                                          DD     __lcl.00000420 
                                          DD     0000002A 
                                          DD     0000001D 
                                          DD     __lcl.00000420 
                                          DD     0000002B 
                                          DD     00000023 
                                          DD     __lcl.00000420 
                                          DD     0000002C 
                                          DD     00000027 
                                          DD     __lcl.00000420 
                                          DD     0000002D 
                                          DD     0000002E 
                                          DD     __lcl.00000420 
                                          DD     0000002E 
                                          DD     00000044 
                                          DD     __lcl.00000420 
                                          DD     0000002F 
                                          DD     00000051 
                                          DD     __lcl.00000420 
                                          DD     00000030 
                                          DD     00000065 
                                          DD     __lcl.00000420 
                                          DD     00000031 
                                          DD     00000072 
                                          DD     __lcl.00000420 
                                          DD     00000032 
                                          DD     00000076 
                                          DD     __lcl.00000420 
                                          DD     00000033 
                                          DD     00000076 
                                          DD     __lcl.00000420 
                                          DD     00000034 
                                          DD     00000083 
                                          DD     __lcl.00000420 
                                          DD     00000034 
                                          DD     00000090 
                                          DD     __lcl.00000420 
; ********* End of segment, Total Size = 172

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu.plusvect   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu.plusvect 
                       lab2_sepcomp3.modu.plusvect PROC NEAR 
;  Source Line # 17  (Inline # 55 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC14                      SUB    ESP, 20 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078E800                    CMP    BYTE PTR [EAX-24], 0 ;  PlusVect__elab_bool
   17|                 L44:                             
   17| 000017 7446                        JE     SHORT L45 
;  Source Line # 17  (Inline # 58 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000019 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 59 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000020 8B450C                      MOV    EAX, [EBP+12] ;  A
   17| 000023 8B5DFC                      MOV    EBX, [EBP-4] 
   17| 000026 8B4D10                      MOV    ECX, [EBP+16] ;  B
   17| 000029 8B55FC                      MOV    EDX, [EBP-4] 
   17| 00002C 8B7498FC                    MOV    ESI, [EAX+4*EBX-4] 
   17| 000030 037491FC                    ADD    ESI, [ECX+4*EDX-4] 
   17| 000034 CE                          INTO          
   17| 000035 8B7DFC                      MOV    EDI, [EBP-4] 
   17| 000038 8974BDEC                    MOV    [EBP+4*EDI-20], ESI ;  Rez
;  Source Line # 17  (Inline # 60 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 00003C 8B45FC                      MOV    EAX, [EBP-4] 
   17| 00003F 40                          INC    EAX    
   17| 000040 8945FC                      MOV    [EBP-4], EAX 
   17| 000043 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 000047 7ED7                        JLE    SHORT L43 
;  Source Line # 17  (Inline # 61 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000049 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   17| 00004C 8D75F0                      LEA    ESI, [EBP-16] ;  Rez
   17| 00004F 8D38                        LEA    EDI, [EAX+0] 
   17| 000051 A5                          MOVSD         
   17| 000052 A5                          MOVSD         
   17| 000053 A5                          MOVSD         
   17| 000054 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   17| 000057 8BC3                        MOV    EAX, EBX 
   17| 000059 8BE5                        MOV    ESP, EBP 
   17| 00005B 5D                          POP    EBP    
   17| 00005C C20C00                      RET    12     
   17|                 L45:                             
   17| 00005F F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu.plusvect ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000416     DD     00000603 
                                          DD     00000037 
                                          DD     00000000 
                                          DD     __lcl.00000420 
                                          DD     0000003A 
                                          DD     00000019 
                                          DD     __lcl.00000420 
                                          DD     0000003B 
                                          DD     00000020 
                                          DD     __lcl.00000420 
                                          DD     0000003C 
                                          DD     0000003C 
                                          DD     __lcl.00000420 
                                          DD     0000003D 
                                          DD     00000049 
                                          DD     __lcl.00000420 
                                          DD     0000003D 
                                          DD     00000060 
                                          DD     __lcl.00000420 
; ********* End of segment, Total Size = 76

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu.minusvect   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu.minusvect 
                       lab2_sepcomp3.modu.minusvect PROC NEAR 
;  Source Line # 17  (Inline # 64 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC14                      SUB    ESP, 20 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078E900                    CMP    BYTE PTR [EAX-23], 0 ;  MinusVect__elab_bool
   17|                 L44:                             
   17| 000017 7446                        JE     SHORT L45 
;  Source Line # 17  (Inline # 67 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000019 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 68 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000020 8B450C                      MOV    EAX, [EBP+12] ;  A
   17| 000023 8B5DFC                      MOV    EBX, [EBP-4] 
   17| 000026 8B4D10                      MOV    ECX, [EBP+16] ;  B
   17| 000029 8B55FC                      MOV    EDX, [EBP-4] 
   17| 00002C 8B7498FC                    MOV    ESI, [EAX+4*EBX-4] 
   17| 000030 2B7491FC                    SUB    ESI, [ECX+4*EDX-4] 
   17| 000034 CE                          INTO          
   17| 000035 8B7DFC                      MOV    EDI, [EBP-4] 
   17| 000038 8974BDEC                    MOV    [EBP+4*EDI-20], ESI ;  Rez
;  Source Line # 17  (Inline # 69 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 00003C 8B45FC                      MOV    EAX, [EBP-4] 
   17| 00003F 40                          INC    EAX    
   17| 000040 8945FC                      MOV    [EBP-4], EAX 
   17| 000043 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 000047 7ED7                        JLE    SHORT L43 
;  Source Line # 17  (Inline # 70 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000049 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   17| 00004C 8D75F0                      LEA    ESI, [EBP-16] ;  Rez
   17| 00004F 8D38                        LEA    EDI, [EAX+0] 
   17| 000051 A5                          MOVSD         
   17| 000052 A5                          MOVSD         
   17| 000053 A5                          MOVSD         
   17| 000054 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   17| 000057 8BC3                        MOV    EAX, EBX 
   17| 000059 8BE5                        MOV    ESP, EBP 
   17| 00005B 5D                          POP    EBP    
   17| 00005C C20C00                      RET    12     
   17|                 L45:                             
   17| 00005F F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu.minusvect ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000415     DD     00000603 
                                          DD     00000040 
                                          DD     00000000 
                                          DD     __lcl.00000420 
                                          DD     00000043 
                                          DD     00000019 
                                          DD     __lcl.00000420 
                                          DD     00000044 
                                          DD     00000020 
                                          DD     __lcl.00000420 
                                          DD     00000045 
                                          DD     0000003C 
                                          DD     __lcl.00000420 
                                          DD     00000046 
                                          DD     00000049 
                                          DD     __lcl.00000420 
                                          DD     00000046 
                                          DD     00000060 
                                          DD     __lcl.00000420 
; ********* End of segment, Total Size = 76

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu.multivectnum   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu.multivectnum 
                       lab2_sepcomp3.modu.multivectnum PROC NEAR 
;  Source Line # 17  (Inline # 73 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC14                      SUB    ESP, 20 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078EA00                    CMP    BYTE PTR [EAX-22], 0 ;  multiVectNum__elab_bool
   17|                 L44:                             
   17| 000017 7440                        JE     SHORT L45 
;  Source Line # 17  (Inline # 76 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000019 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 77 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000020 8B450C                      MOV    EAX, [EBP+12] ;  A
   17| 000023 8B5DFC                      MOV    EBX, [EBP-4] 
   17| 000026 8B4C98FC                    MOV    ECX, [EAX+4*EBX-4] 
   17| 00002A 0FAF4D10                    IMUL   ECX, [EBP+16] ;  e
   17| 00002E CE                          INTO          
   17| 00002F 8B55FC                      MOV    EDX, [EBP-4] 
   17| 000032 894C95EC                    MOV    [EBP+4*EDX-20], ECX ;  Rez
;  Source Line # 17  (Inline # 78 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000036 8B75FC                      MOV    ESI, [EBP-4] 
   17| 000039 46                          INC    ESI    
   17| 00003A 8975FC                      MOV    [EBP-4], ESI 
   17| 00003D 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 000041 7EDD                        JLE    SHORT L43 
;  Source Line # 17  (Inline # 79 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000043 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   17| 000046 8D75F0                      LEA    ESI, [EBP-16] ;  Rez
   17| 000049 8D38                        LEA    EDI, [EAX+0] 
   17| 00004B A5                          MOVSD         
   17| 00004C A5                          MOVSD         
   17| 00004D A5                          MOVSD         
   17| 00004E 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   17| 000051 8BC3                        MOV    EAX, EBX 
   17| 000053 8BE5                        MOV    ESP, EBP 
   17| 000055 5D                          POP    EBP    
   17| 000056 C20C00                      RET    12     
   17|                 L45:                             
   17| 000059 F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu.multivectnum ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000414     DD     00000603 
                                          DD     00000049 
                                          DD     00000000 
                                          DD     __lcl.00000420 
                                          DD     0000004C 
                                          DD     00000019 
                                          DD     __lcl.00000420 
                                          DD     0000004D 
                                          DD     00000020 
                                          DD     __lcl.00000420 
                                          DD     0000004E 
                                          DD     00000036 
                                          DD     __lcl.00000420 
                                          DD     0000004F 
                                          DD     00000043 
                                          DD     __lcl.00000420 
                                          DD     0000004F 
                                          DD     0000005A 
                                          DD     __lcl.00000420 
; ********* End of segment, Total Size = 76

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu.func1   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu.func1 
                       lab2_sepcomp3.modu.func1 PROC NEAR 
;  Source Line # 17  (Inline # 86 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC38                      SUB    ESP, 56 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078E400                    CMP    BYTE PTR [EAX-28], 0 ;  Func1__elab_bool
   17|                 L42:                             
   17| 000017 7470                        JE     SHORT L43 
   17| 000019 8B02                        MOV    EAX, [EDX+0] 
   17| 00001B 8945D0                      MOV    [EBP-48], EAX 
;  Source Line # 17  (Inline # 88 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 00001E FF7518                      PUSH   DWORD PTR [EBP+24] ;  e
   17| 000021 8B5D14                      MOV    EBX, [EBP+20] ;  d
   17| 000024 53                          PUSH   EBX    
   17| 000025 8D4DEC                      LEA    ECX, [EBP-20] 
   17| 000028 51                          PUSH   ECX    
   17| 000029 E800000000                  CALL   lab2_sepcomp3.modu.multivectnum 
   17| 00002E 50                          PUSH   EAX    
   17| 00002F 8B7510                      MOV    ESI, [EBP+16] ;  c
   17| 000032 56                          PUSH   ESI    
   17| 000033 8B7D0C                      MOV    EDI, [EBP+12] ;  b
   17| 000036 57                          PUSH   EDI    
   17| 000037 8D55E0                      LEA    EDX, [EBP-32] 
   17| 00003A 52                          PUSH   EDX    
   17| 00003B E800000000                  CALL   lab2_sepcomp3.modu.plusvect 
   17| 000040 50                          PUSH   EAX    
   17| 000041 8D5DD4                      LEA    EBX, [EBP-44] 
   17| 000044 53                          PUSH   EBX    
   17| 000045 E800000000                  CALL   lab2_sepcomp3.modu.minusvect 
   17| 00004A 8B4D08                      MOV    ECX, [EBP+8] ;  a
   17| 00004D 8D30                        LEA    ESI, [EAX+0] 
   17| 00004F 8D39                        LEA    EDI, [ECX+0] 
   17| 000051 A5                          MOVSD         
   17| 000052 A5                          MOVSD         
   17| 000053 A5                          MOVSD         
;  Source Line # 17  (Inline # 89 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17|                 L41:                             
   17|                 L10:                             
   17|                 L40:                             
   17| 000054 8BE5                        MOV    ESP, EBP 
   17| 000056 5D                          POP    EBP    
   17| 000057 C21400                      RET    20     
;  Source Line # 17  (Inline # 89 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
;  Source Line # 17  (Inline # 90 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 00005A 8945F8                      MOV    [EBP-8], EAX 
;  Source Line # 17  (Inline # 91 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 00005D 6A00                        PUSH   0      
   17| 00005F 8D5DD0                      LEA    EBX, [EBP-48] 
   17| 000062 53                          PUSH   EBX    
   17| 000063 8B4DF8                      MOV    ECX, [EBP-8] 
   17| 000066 51                          PUSH   ECX    
   17| 000067 E800000000                  CALL   rts_ss_copy_exception_and_rlse 
   17| 00006C 8945FC                      MOV    [EBP-4], EAX 
   17| 00006F 6800000000                  PUSH   __lcl.00000103 
   17| 000074 6800000000                  PUSH   __lcl.00000102 
   17| 000079 E800000000                  CALL   ada.text_io.put__4 
   17| 00007E 8D55D0                      LEA    EDX, [EBP-48] 
   17| 000081 52                          PUSH   EDX    
   17| 000082 E800000000                  CALL   rts_ss_release 
   17| 000087 EBCB                        JMP    SHORT L40 
   17|                 L43:                             
   17| 000089 F6F4                        DIV    AH     
; Exception scope table. (Code offsets in bytes relative to start of Ubod)
                       Scope_1:                         
                                          DD     00000019H ; Code start
                                          DD     00000054H ; Code end
                                          DD     0      ; Handler table entry H_0

; Exception handler table (Offsets in bytes relative to start of Ubod)
                       H_0:                             
                                          DD     constraint_error ; Exception address
                                          DD     0000005AH ; Code offset for handler
                       H_1:                             
                                          DD     1      ; End of search
                                          DD     0      
                       ;                                
                       lab2_sepcomp3.modu.func1 ENDP    

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000413     DD     00000703 
                                          DD     00000056 
                                          DD     00000000 
                                          DD     __lcl.00000420 
                                          DD     00000058 
                                          DD     0000001E 
                                          DD     __lcl.00000420 
                                          DD     00000059 
                                          DD     00000054 
                                          DD     __lcl.00000420 
                                          DD     00000059 
                                          DD     0000005A 
                                          DD     __lcl.00000420 
                                          DD     0000005A 
                                          DD     0000005A 
                                          DD     __lcl.00000420 
                                          DD     0000005B 
                                          DD     0000005D 
                                          DD     __lcl.00000420 
                                          DD     0000005B 
                                          DD     0000008A 
                                          DD     __lcl.00000420 
; ********* End of segment, Total Size = 88

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu.multiplystep   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu.multiplystep 
                       lab2_sepcomp3.modu.multiplystep PROC NEAR 
;  Source Line # 17  (Inline # 94 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC0C                      SUB    ESP, 12 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078EB00                    CMP    BYTE PTR [EAX-21], 0 ;  MultiplyStep__elab_bool
   17|                 L44:                             
   17| 000017 7441                        JE     SHORT L45 
;  Source Line # 17  (Inline # 95 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000019 C745F800000000              MOV    DWORD PTR [EBP-8], 0 ;  Rez
;  Source Line # 17  (Inline # 97 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000020 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 98 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000027 8B4508                      MOV    EAX, [EBP+8] ;  A
   17| 00002A 8B5DFC                      MOV    EBX, [EBP-4] 
   17| 00002D 8B4D0C                      MOV    ECX, [EBP+12] ;  B
   17| 000030 8B55FC                      MOV    EDX, [EBP-4] 
   17| 000033 8B7498FC                    MOV    ESI, [EAX+4*EBX-4] 
   17| 000037 0FAF7491FC                  IMUL   ESI, [ECX+4*EDX-4] 
   17| 00003C CE                          INTO          
   17| 00003D 0375F8                      ADD    ESI, [EBP-8] ;  Rez
   17| 000040 CE                          INTO          
   17| 000041 8975F8                      MOV    [EBP-8], ESI ;  Rez
;  Source Line # 17  (Inline # 99 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000044 8B7DFC                      MOV    EDI, [EBP-4] 
   17| 000047 47                          INC    EDI    
   17| 000048 897DFC                      MOV    [EBP-4], EDI 
   17| 00004B 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 00004F 7ED6                        JLE    SHORT L43 
;  Source Line # 17  (Inline # 100 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   17| 000051 8B45F8                      MOV    EAX, [EBP-8] ;  Rez
   17| 000054 8BE5                        MOV    ESP, EBP 
   17| 000056 5D                          POP    EBP    
   17| 000057 C20800                      RET    8      
   17|                 L45:                             
   17| 00005A F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu.multiplystep ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000412     DD     00000703 
                                          DD     0000005E 
                                          DD     00000000 
                                          DD     __lcl.00000420 
                                          DD     0000005F 
                                          DD     00000019 
                                          DD     __lcl.00000420 
                                          DD     00000061 
                                          DD     00000020 
                                          DD     __lcl.00000420 
                                          DD     00000062 
                                          DD     00000027 
                                          DD     __lcl.00000420 
                                          DD     00000063 
                                          DD     00000044 
                                          DD     __lcl.00000420 
                                          DD     00000064 
                                          DD     00000051 
                                          DD     __lcl.00000420 
                                          DD     00000064 
                                          DD     0000005B 
                                          DD     __lcl.00000420 
; ********* End of segment, Total Size = 88

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu_f2.func2   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu_f2.func2 
                       lab2_sepcomp3.modu_f2.func2 PROC NEAR 
;  Source Line # 17  (Inline # 5 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 81EC80000000                SUB    ESP, 128 
   17| 000013 8B4230                      MOV    EAX, [EDX+48] 
   17| 000016 8078EC00                    CMP    BYTE PTR [EAX-20], 0 ;  Func2__elab_bool
   17|                 L42:                             
   17| 00001A 747B                        JE     SHORT L43 
   17| 00001C 8B02                        MOV    EAX, [EDX+0] 
   17| 00001E 894588                      MOV    [EBP-120], EAX 
;  Source Line # 17  (Inline # 7 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000021 8B5D14                      MOV    EBX, [EBP+20] ;  MM
   17| 000024 53                          PUSH   EBX    
   17| 000025 8B4D10                      MOV    ECX, [EBP+16] ;  MC
   17| 000028 51                          PUSH   ECX    
   17| 000029 8D75D4                      LEA    ESI, [EBP-44] 
   17| 00002C 56                          PUSH   ESI    
   17| 00002D E800000000                  CALL   lab2_sepcomp3.modu_f2.matrixmult 
   17| 000032 50                          PUSH   EAX    
   17| 000033 8B7D0C                      MOV    EDI, [EBP+12] ;  MB
   17| 000036 57                          PUSH   EDI    
   17| 000037 8B5508                      MOV    EDX, [EBP+8] ;  MA
   17| 00003A 52                          PUSH   EDX    
   17| 00003B 8D5DB0                      LEA    EBX, [EBP-80] 
   17| 00003E 53                          PUSH   EBX    
   17| 00003F E800000000                  CALL   lab2_sepcomp3.modu_f2.matrixsum 
   17| 000044 50                          PUSH   EAX    
   17| 000045 8D4D8C                      LEA    ECX, [EBP-116] 
   17| 000048 51                          PUSH   ECX    
   17| 000049 E800000000                  CALL   lab2_sepcomp3.modu_f2.matrixrizn 
   17| 00004E 8B7518                      MOV    ESI, [EBP+24] ;  MD
   17| 000051 897584                      MOV    [EBP-124], ESI ; Spill
   17| 000054 8D30                        LEA    ESI, [EAX+0] 
   17| 000056 8B5584                      MOV    EDX, [EBP-124] ; Spill
   17| 000059 8D3A                        LEA    EDI, [EDX+0] 
   17| 00005B B909000000                  MOV    ECX, 9 
   17| 000060 F3A5                        REP:MOVSD     
;  Source Line # 17  (Inline # 8 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17|                 L41:                             
   17|                 L14:                             
   17|                 L40:                             
   17| 000062 8BE5                        MOV    ESP, EBP 
   17| 000064 5D                          POP    EBP    
   17| 000065 C21400                      RET    20     
;  Source Line # 17  (Inline # 8 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
;  Source Line # 17  (Inline # 9 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000068 8945F8                      MOV    [EBP-8], EAX 
;  Source Line # 17  (Inline # 10 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00006B 6A00                        PUSH   0      
   17| 00006D 8D5D88                      LEA    EBX, [EBP-120] 
   17| 000070 53                          PUSH   EBX    
   17| 000071 8B4DF8                      MOV    ECX, [EBP-8] 
   17| 000074 51                          PUSH   ECX    
   17| 000075 E800000000                  CALL   rts_ss_copy_exception_and_rlse 
   17| 00007A 8945FC                      MOV    [EBP-4], EAX 
   17| 00007D 6800000000                  PUSH   __lcl.00000126 
   17| 000082 6800000000                  PUSH   __lcl.00000125 
   17| 000087 E800000000                  CALL   ada.text_io.put__4 
   17| 00008C 8D5588                      LEA    EDX, [EBP-120] 
   17| 00008F 52                          PUSH   EDX    
   17| 000090 E800000000                  CALL   rts_ss_release 
   17| 000095 EBCB                        JMP    SHORT L40 
   17|                 L43:                             
   17| 000097 F6F4                        DIV    AH     
; Exception scope table. (Code offsets in bytes relative to start of Ubod)
                       Scope_1:                         
                                          DD     0000001CH ; Code start
                                          DD     00000062H ; Code end
                                          DD     0      ; Handler table entry H_0

; Exception handler table (Offsets in bytes relative to start of Ubod)
                       H_0:                             
                                          DD     constraint_error ; Exception address
                                          DD     00000068H ; Code offset for handler
                       H_1:                             
                                          DD     1      ; End of search
                                          DD     0      
                       ;                                
                       lab2_sepcomp3.modu_f2.func2 ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000411     DD     00000703 
                                          DD     00000005 
                                          DD     00000000 
                                          DD     __lcl.00000421 
                                          DD     00000007 
                                          DD     00000021 
                                          DD     __lcl.00000421 
                                          DD     00000008 
                                          DD     00000062 
                                          DD     __lcl.00000421 
                                          DD     00000008 
                                          DD     00000068 
                                          DD     __lcl.00000421 
                                          DD     00000009 
                                          DD     00000068 
                                          DD     __lcl.00000421 
                                          DD     0000000A 
                                          DD     0000006B 
                                          DD     __lcl.00000421 
                                          DD     0000000A 
                                          DD     00000098 
                                          DD     __lcl.00000421 
; ********* End of segment, Total Size = 88

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu_f2.matrixmult   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu_f2.matrixmult 
                       lab2_sepcomp3.modu_f2.matrixmult PROC NEAR 
;  Source Line # 17  (Inline # 15 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC40                      SUB    ESP, 64 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078ED00                    CMP    BYTE PTR [EAX-19], 0 ;  MatrixMult__elab_bool
   17|                 L50:                             
   17| 000017 0F84B7000000                JE     L51    
;  Source Line # 17  (Inline # 19 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00001D C745F401000000              MOV    DWORD PTR [EBP-12], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 20 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000024 C745F801000000              MOV    DWORD PTR [EBP-8], 1 
   17|                 L46:                             
;  Source Line # 17  (Inline # 21 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00002B 8B4510                      MOV    EAX, [EBP+16] ;  B
   17| 00002E 8B5DF8                      MOV    EBX, [EBP-8] 
   17| 000031 8D5BFF                      LEA    EBX, [EBX-1] 
   17| 000034 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   17| 000037 C1E302                      SHL    EBX, 2 
   17| 00003A 8B4DF4                      MOV    ECX, [EBP-12] 
   17| 00003D 8D0C8DFCFFFFFF              LEA    ECX, [4*ECX-4] 
   17| 000044 03D9                        ADD    EBX, ECX 
   17| 000046 8B55F8                      MOV    EDX, [EBP-8] 
   17| 000049 8B3418                      MOV    ESI, [EAX+EBX+0] 
   17| 00004C 897495E4                    MOV    [EBP+4*EDX-28], ESI ;  v
;  Source Line # 17  (Inline # 22 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000050 8B7DF8                      MOV    EDI, [EBP-8] 
   17| 000053 47                          INC    EDI    
   17| 000054 897DF8                      MOV    [EBP-8], EDI 
   17| 000057 837DF803                    CMP    DWORD PTR [EBP-8], 3 
   17| 00005B 7ECE                        JLE    SHORT L46 
;  Source Line # 17  (Inline # 23 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00005D C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L49:                             
;  Source Line # 17  (Inline # 24 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000064 8D45E8                      LEA    EAX, [EBP-24] ;  v
   17| 000067 50                          PUSH   EAX    
   17| 000068 8B5D0C                      MOV    EBX, [EBP+12] ;  A
   17| 00006B 8B4DFC                      MOV    ECX, [EBP-4] 
   17| 00006E 8D49FF                      LEA    ECX, [ECX-1] 
   17| 000071 8D0C49                      LEA    ECX, [ECX+2*ECX+0] 
   17| 000074 C1E102                      SHL    ECX, 2 
   17| 000077 8D1C0B                      LEA    EBX, [EBX+ECX+0] 
   17| 00007A 53                          PUSH   EBX    
   17| 00007B E800000000                  CALL   lab2_sepcomp3.modu.multiplystep 
   17| 000080 8B55FC                      MOV    EDX, [EBP-4] 
   17| 000083 8D52FF                      LEA    EDX, [EDX-1] 
   17| 000086 8D1452                      LEA    EDX, [EDX+2*EDX+0] 
   17| 000089 C1E202                      SHL    EDX, 2 
   17| 00008C 8B75F4                      MOV    ESI, [EBP-12] 
   17| 00008F 8D34B5FCFFFFFF              LEA    ESI, [4*ESI-4] 
   17| 000096 03D6                        ADD    EDX, ESI 
   17| 000098 894415C4                    MOV    [EBP+EDX-60], EAX ;  RezMatr
;  Source Line # 17  (Inline # 25 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00009C 8B7DFC                      MOV    EDI, [EBP-4] 
   17| 00009F 47                          INC    EDI    
   17| 0000A0 897DFC                      MOV    [EBP-4], EDI 
   17| 0000A3 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 0000A7 7EBB                        JLE    SHORT L49 
;  Source Line # 17  (Inline # 26 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 0000A9 8B45F4                      MOV    EAX, [EBP-12] 
   17| 0000AC 40                          INC    EAX    
   17| 0000AD 8945F4                      MOV    [EBP-12], EAX 
   17| 0000B0 837DF403                    CMP    DWORD PTR [EBP-12], 3 
   17| 0000B4 0F8E6AFFFFFF                JLE    L43    
;  Source Line # 17  (Inline # 27 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 0000BA 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   17| 0000BD 8D75C4                      LEA    ESI, [EBP-60] ;  RezMatr
   17| 0000C0 8D38                        LEA    EDI, [EAX+0] 
   17| 0000C2 B909000000                  MOV    ECX, 9 
   17| 0000C7 F3A5                        REP:MOVSD     
   17| 0000C9 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   17| 0000CC 8BC3                        MOV    EAX, EBX 
   17| 0000CE 8BE5                        MOV    ESP, EBP 
   17| 0000D0 5D                          POP    EBP    
   17| 0000D1 C20C00                      RET    12     
   17|                 L51:                             
   17| 0000D4 F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu_f2.matrixmult ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000410     DD     00000B03 
                                          DD     0000000F 
                                          DD     00000000 
                                          DD     __lcl.00000421 
                                          DD     00000013 
                                          DD     0000001D 
                                          DD     __lcl.00000421 
                                          DD     00000014 
                                          DD     00000024 
                                          DD     __lcl.00000421 
                                          DD     00000015 
                                          DD     0000002B 
                                          DD     __lcl.00000421 
                                          DD     00000016 
                                          DD     00000050 
                                          DD     __lcl.00000421 
                                          DD     00000017 
                                          DD     0000005D 
                                          DD     __lcl.00000421 
                                          DD     00000018 
                                          DD     00000064 
                                          DD     __lcl.00000421 
                                          DD     00000019 
                                          DD     0000009C 
                                          DD     __lcl.00000421 
                                          DD     0000001A 
                                          DD     000000A9 
                                          DD     __lcl.00000421 
                                          DD     0000001B 
                                          DD     000000BA 
                                          DD     __lcl.00000421 
                                          DD     0000001B 
                                          DD     000000D5 
                                          DD     __lcl.00000421 
; ********* End of segment, Total Size = 136

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu_f2.matrixsum   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu_f2.matrixsum 
                       lab2_sepcomp3.modu_f2.matrixsum PROC NEAR 
;  Source Line # 17  (Inline # 33 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC30                      SUB    ESP, 48 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078EE00                    CMP    BYTE PTR [EAX-18], 0 ;  MatrixSum__elab_bool
   17|                 L47:                             
   17| 000017 0F849B000000                JE     L48    
;  Source Line # 17  (Inline # 36 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00001D C745F801000000              MOV    DWORD PTR [EBP-8], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 37 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000024 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L46:                             
;  Source Line # 17  (Inline # 38 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00002B 8B450C                      MOV    EAX, [EBP+12] ;  a
   17| 00002E 8B5DF8                      MOV    EBX, [EBP-8] 
   17| 000031 8D5BFF                      LEA    EBX, [EBX-1] 
   17| 000034 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   17| 000037 C1E302                      SHL    EBX, 2 
   17| 00003A 8B4DFC                      MOV    ECX, [EBP-4] 
   17| 00003D 8D0C8DFCFFFFFF              LEA    ECX, [4*ECX-4] 
   17| 000044 03D9                        ADD    EBX, ECX 
   17| 000046 8B5510                      MOV    EDX, [EBP+16] ;  b
   17| 000049 8B75F8                      MOV    ESI, [EBP-8] 
   17| 00004C 8D76FF                      LEA    ESI, [ESI-1] 
   17| 00004F 8D3476                      LEA    ESI, [ESI+2*ESI+0] 
   17| 000052 C1E602                      SHL    ESI, 2 
   17| 000055 8B7DFC                      MOV    EDI, [EBP-4] 
   17| 000058 8D3CBDFCFFFFFF              LEA    EDI, [4*EDI-4] 
   17| 00005F 03F7                        ADD    ESI, EDI 
   17| 000061 8B0418                      MOV    EAX, [EAX+EBX+0] 
   17| 000064 030432                      ADD    EAX, [EDX+ESI+0] 
   17| 000067 CE                          INTO          
   17| 000068 8B4DF8                      MOV    ECX, [EBP-8] 
   17| 00006B 8D49FF                      LEA    ECX, [ECX-1] 
   17| 00006E 8D0C49                      LEA    ECX, [ECX+2*ECX+0] 
   17| 000071 C1E102                      SHL    ECX, 2 
   17| 000074 8B5DFC                      MOV    EBX, [EBP-4] 
   17| 000077 8D1C9DFCFFFFFF              LEA    EBX, [4*EBX-4] 
   17| 00007E 03CB                        ADD    ECX, EBX 
   17| 000080 89440DD4                    MOV    [EBP+ECX-44], EAX ;  c
;  Source Line # 17  (Inline # 39 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000084 8B55FC                      MOV    EDX, [EBP-4] 
   17| 000087 42                          INC    EDX    
   17| 000088 8955FC                      MOV    [EBP-4], EDX 
   17| 00008B 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 00008F 7E9A                        JLE    SHORT L46 
;  Source Line # 17  (Inline # 40 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000091 8B45F8                      MOV    EAX, [EBP-8] 
   17| 000094 40                          INC    EAX    
   17| 000095 8945F8                      MOV    [EBP-8], EAX 
   17| 000098 837DF803                    CMP    DWORD PTR [EBP-8], 3 
   17| 00009C 7E86                        JLE    SHORT L43 
;  Source Line # 17  (Inline # 41 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00009E 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   17| 0000A1 8D75D4                      LEA    ESI, [EBP-44] ;  c
   17| 0000A4 8D38                        LEA    EDI, [EAX+0] 
   17| 0000A6 B909000000                  MOV    ECX, 9 
   17| 0000AB F3A5                        REP:MOVSD     
   17| 0000AD 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   17| 0000B0 8BC3                        MOV    EAX, EBX 
   17| 0000B2 8BE5                        MOV    ESP, EBP 
   17| 0000B4 5D                          POP    EBP    
   17| 0000B5 C20C00                      RET    12     
   17|                 L48:                             
   17| 0000B8 F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu_f2.matrixsum ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000409     DD     00000803 
                                          DD     00000021 
                                          DD     00000000 
                                          DD     __lcl.00000421 
                                          DD     00000024 
                                          DD     0000001D 
                                          DD     __lcl.00000421 
                                          DD     00000025 
                                          DD     00000024 
                                          DD     __lcl.00000421 
                                          DD     00000026 
                                          DD     0000002B 
                                          DD     __lcl.00000421 
                                          DD     00000027 
                                          DD     00000084 
                                          DD     __lcl.00000421 
                                          DD     00000028 
                                          DD     00000091 
                                          DD     __lcl.00000421 
                                          DD     00000029 
                                          DD     0000009E 
                                          DD     __lcl.00000421 
                                          DD     00000029 
                                          DD     000000B9 
                                          DD     __lcl.00000421 
; ********* End of segment, Total Size = 100

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu_f2.matrixrizn   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu_f2.matrixrizn 
                       lab2_sepcomp3.modu_f2.matrixrizn PROC NEAR 
;  Source Line # 17  (Inline # 45 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC30                      SUB    ESP, 48 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078EF00                    CMP    BYTE PTR [EAX-17], 0 ;  MatrixRizn__elab_bool
   17|                 L47:                             
   17| 000017 0F849B000000                JE     L48    
;  Source Line # 17  (Inline # 48 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00001D C745F801000000              MOV    DWORD PTR [EBP-8], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 49 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000024 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L46:                             
;  Source Line # 17  (Inline # 50 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00002B 8B450C                      MOV    EAX, [EBP+12] ;  a
   17| 00002E 8B5DF8                      MOV    EBX, [EBP-8] 
   17| 000031 8D5BFF                      LEA    EBX, [EBX-1] 
   17| 000034 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   17| 000037 C1E302                      SHL    EBX, 2 
   17| 00003A 8B4DFC                      MOV    ECX, [EBP-4] 
   17| 00003D 8D0C8DFCFFFFFF              LEA    ECX, [4*ECX-4] 
   17| 000044 03D9                        ADD    EBX, ECX 
   17| 000046 8B5510                      MOV    EDX, [EBP+16] ;  b
   17| 000049 8B75F8                      MOV    ESI, [EBP-8] 
   17| 00004C 8D76FF                      LEA    ESI, [ESI-1] 
   17| 00004F 8D3476                      LEA    ESI, [ESI+2*ESI+0] 
   17| 000052 C1E602                      SHL    ESI, 2 
   17| 000055 8B7DFC                      MOV    EDI, [EBP-4] 
   17| 000058 8D3CBDFCFFFFFF              LEA    EDI, [4*EDI-4] 
   17| 00005F 03F7                        ADD    ESI, EDI 
   17| 000061 8B0418                      MOV    EAX, [EAX+EBX+0] 
   17| 000064 2B0432                      SUB    EAX, [EDX+ESI+0] 
   17| 000067 CE                          INTO          
   17| 000068 8B4DF8                      MOV    ECX, [EBP-8] 
   17| 00006B 8D49FF                      LEA    ECX, [ECX-1] 
   17| 00006E 8D0C49                      LEA    ECX, [ECX+2*ECX+0] 
   17| 000071 C1E102                      SHL    ECX, 2 
   17| 000074 8B5DFC                      MOV    EBX, [EBP-4] 
   17| 000077 8D1C9DFCFFFFFF              LEA    EBX, [4*EBX-4] 
   17| 00007E 03CB                        ADD    ECX, EBX 
   17| 000080 89440DD4                    MOV    [EBP+ECX-44], EAX ;  c
;  Source Line # 17  (Inline # 51 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000084 8B55FC                      MOV    EDX, [EBP-4] 
   17| 000087 42                          INC    EDX    
   17| 000088 8955FC                      MOV    [EBP-4], EDX 
   17| 00008B 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 00008F 7E9A                        JLE    SHORT L46 
;  Source Line # 17  (Inline # 52 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000091 8B45F8                      MOV    EAX, [EBP-8] 
   17| 000094 40                          INC    EAX    
   17| 000095 8945F8                      MOV    [EBP-8], EAX 
   17| 000098 837DF803                    CMP    DWORD PTR [EBP-8], 3 
   17| 00009C 7E86                        JLE    SHORT L43 
;  Source Line # 17  (Inline # 53 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00009E 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   17| 0000A1 8D75D4                      LEA    ESI, [EBP-44] ;  c
   17| 0000A4 8D38                        LEA    EDI, [EAX+0] 
   17| 0000A6 B909000000                  MOV    ECX, 9 
   17| 0000AB F3A5                        REP:MOVSD     
   17| 0000AD 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   17| 0000B0 8BC3                        MOV    EAX, EBX 
   17| 0000B2 8BE5                        MOV    ESP, EBP 
   17| 0000B4 5D                          POP    EBP    
   17| 0000B5 C20C00                      RET    12     
   17|                 L48:                             
   17| 0000B8 F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu_f2.matrixrizn ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000408     DD     00000803 
                                          DD     0000002D 
                                          DD     00000000 
                                          DD     __lcl.00000421 
                                          DD     00000030 
                                          DD     0000001D 
                                          DD     __lcl.00000421 
                                          DD     00000031 
                                          DD     00000024 
                                          DD     __lcl.00000421 
                                          DD     00000032 
                                          DD     0000002B 
                                          DD     __lcl.00000421 
                                          DD     00000033 
                                          DD     00000084 
                                          DD     __lcl.00000421 
                                          DD     00000034 
                                          DD     00000091 
                                          DD     __lcl.00000421 
                                          DD     00000035 
                                          DD     0000009E 
                                          DD     __lcl.00000421 
                                          DD     00000035 
                                          DD     000000B9 
                                          DD     __lcl.00000421 
; ********* End of segment, Total Size = 100

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu_f2.multimatrnum   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu_f2.multimatrnum 
                       lab2_sepcomp3.modu_f2.multimatrnum PROC NEAR 
;  Source Line # 17  (Inline # 56 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC30                      SUB    ESP, 48 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078F000                    CMP    BYTE PTR [EAX-16], 0 ;  MultiMatrNum__elab_bool
   17|                 L47:                             
   17| 000017 0F848E000000                JE     L48    
;  Source Line # 17  (Inline # 59 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00001D 8B450C                      MOV    EAX, [EBP+12] ;  A
   17| 000020 8D30                        LEA    ESI, [EAX+0] 
   17| 000022 8D7DD4                      LEA    EDI, [EBP-44] ;  buf
   17| 000025 B909000000                  MOV    ECX, 9 
   17| 00002A F3A5                        REP:MOVSD     
;  Source Line # 17  (Inline # 60 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00002C C745F801000000              MOV    DWORD PTR [EBP-8], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 61 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000033 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L46:                             
;  Source Line # 17  (Inline # 62 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00003A 8B45F8                      MOV    EAX, [EBP-8] 
   17| 00003D 8D40FF                      LEA    EAX, [EAX-1] 
   17| 000040 8D0440                      LEA    EAX, [EAX+2*EAX+0] 
   17| 000043 C1E002                      SHL    EAX, 2 
   17| 000046 8B5DFC                      MOV    EBX, [EBP-4] 
   17| 000049 8D1C9DFCFFFFFF              LEA    EBX, [4*EBX-4] 
   17| 000050 03C3                        ADD    EAX, EBX 
   17| 000052 8B4C05D4                    MOV    ECX, [EBP+EAX-44] ;  buf
   17| 000056 0FAF4D10                    IMUL   ECX, [EBP+16] ;  e
   17| 00005A CE                          INTO          
   17| 00005B 8B55F8                      MOV    EDX, [EBP-8] 
   17| 00005E 8D52FF                      LEA    EDX, [EDX-1] 
   17| 000061 8D1452                      LEA    EDX, [EDX+2*EDX+0] 
   17| 000064 C1E202                      SHL    EDX, 2 
   17| 000067 8B75FC                      MOV    ESI, [EBP-4] 
   17| 00006A 8D34B5FCFFFFFF              LEA    ESI, [4*ESI-4] 
   17| 000071 03D6                        ADD    EDX, ESI 
   17| 000073 894C15D4                    MOV    [EBP+EDX-44], ECX ;  buf
;  Source Line # 17  (Inline # 63 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000077 8B7DFC                      MOV    EDI, [EBP-4] 
   17| 00007A 47                          INC    EDI    
   17| 00007B 897DFC                      MOV    [EBP-4], EDI 
   17| 00007E 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 000082 7EB6                        JLE    SHORT L46 
;  Source Line # 17  (Inline # 64 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000084 8B45F8                      MOV    EAX, [EBP-8] 
   17| 000087 40                          INC    EAX    
   17| 000088 8945F8                      MOV    [EBP-8], EAX 
   17| 00008B 837DF803                    CMP    DWORD PTR [EBP-8], 3 
   17| 00008F 7EA2                        JLE    SHORT L43 
;  Source Line # 17  (Inline # 65 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000091 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   17| 000094 8D75D4                      LEA    ESI, [EBP-44] ;  buf
   17| 000097 8D38                        LEA    EDI, [EAX+0] 
   17| 000099 B909000000                  MOV    ECX, 9 
   17| 00009E F3A5                        REP:MOVSD     
   17| 0000A0 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   17| 0000A3 8BC3                        MOV    EAX, EBX 
   17| 0000A5 8BE5                        MOV    ESP, EBP 
   17| 0000A7 5D                          POP    EBP    
   17| 0000A8 C20C00                      RET    12     
   17|                 L48:                             
   17| 0000AB F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu_f2.multimatrnum ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000407     DD     00000903 
                                          DD     00000038 
                                          DD     00000000 
                                          DD     __lcl.00000421 
                                          DD     0000003B 
                                          DD     0000001D 
                                          DD     __lcl.00000421 
                                          DD     0000003C 
                                          DD     0000002C 
                                          DD     __lcl.00000421 
                                          DD     0000003D 
                                          DD     00000033 
                                          DD     __lcl.00000421 
                                          DD     0000003E 
                                          DD     0000003A 
                                          DD     __lcl.00000421 
                                          DD     0000003F 
                                          DD     00000077 
                                          DD     __lcl.00000421 
                                          DD     00000040 
                                          DD     00000084 
                                          DD     __lcl.00000421 
                                          DD     00000041 
                                          DD     00000091 
                                          DD     __lcl.00000421 
                                          DD     00000041 
                                          DD     000000AC 
                                          DD     __lcl.00000421 
; ********* End of segment, Total Size = 112

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu_f2.matrixsort   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu_f2.matrixsort 
                       lab2_sepcomp3.modu_f2.matrixsort PROC NEAR 
;  Source Line # 17  (Inline # 69 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC04                      SUB    ESP, 4 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078F100                    CMP    BYTE PTR [EAX-15], 0 ;  MatrixSort__elab_bool
   17|                 L44:                             
   17| 000017 7432                        JE     SHORT L45 
;  Source Line # 17  (Inline # 71 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000019 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 72 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000020 8B4508                      MOV    EAX, [EBP+8] ;  m
   17| 000023 8B5DFC                      MOV    EBX, [EBP-4] 
   17| 000026 8D5BFF                      LEA    EBX, [EBX-1] 
   17| 000029 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   17| 00002C C1E302                      SHL    EBX, 2 
   17| 00002F 8D0418                      LEA    EAX, [EAX+EBX+0] 
   17| 000032 50                          PUSH   EAX    
   17| 000033 E800000000                  CALL   lab2_sepcomp3.modu.vectsort 
;  Source Line # 17  (Inline # 73 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000038 8B4DFC                      MOV    ECX, [EBP-4] 
   17| 00003B 41                          INC    ECX    
   17| 00003C 894DFC                      MOV    [EBP-4], ECX 
   17| 00003F 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 000043 7EDB                        JLE    SHORT L43 
   17| 000045 8BE5                        MOV    ESP, EBP 
   17| 000047 5D                          POP    EBP    
   17| 000048 C20400                      RET    4      
   17|                 L45:                             
   17| 00004B F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu_f2.matrixsort ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000406     DD     00000503 
                                          DD     00000045 
                                          DD     00000000 
                                          DD     __lcl.00000421 
                                          DD     00000047 
                                          DD     00000019 
                                          DD     __lcl.00000421 
                                          DD     00000048 
                                          DD     00000020 
                                          DD     __lcl.00000421 
                                          DD     00000049 
                                          DD     00000038 
                                          DD     __lcl.00000421 
                                          DD     00000049 
                                          DD     0000004C 
                                          DD     __lcl.00000421 
; ********* End of segment, Total Size = 64

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu_f2.matrixmax   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu_f2.matrixmax 
                       lab2_sepcomp3.modu_f2.matrixmax PROC NEAR 
;  Source Line # 17  (Inline # 77 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC10                      SUB    ESP, 16 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078F200                    CMP    BYTE PTR [EAX-14], 0 ;  MatrixMax__elab_bool
   17|                 L49:                             
   17| 000017 0F847D000000                JE     L50    
;  Source Line # 17  (Inline # 80 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00001D 8B4508                      MOV    EAX, [EBP+8] ;  m
   17| 000020 8B18                        MOV    EBX, [EAX+0] 
   17| 000022 895DF4                      MOV    [EBP-12], EBX ;  max
;  Source Line # 17  (Inline # 81 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000025 C745F801000000              MOV    DWORD PTR [EBP-8], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 82 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00002C C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L46:                             
;  Source Line # 17  (Inline # 83 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000033 8B4508                      MOV    EAX, [EBP+8] ;  m
   17| 000036 8B5DF8                      MOV    EBX, [EBP-8] 
   17| 000039 8D5BFF                      LEA    EBX, [EBX-1] 
   17| 00003C 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   17| 00003F C1E302                      SHL    EBX, 2 
   17| 000042 8B4DFC                      MOV    ECX, [EBP-4] 
   17| 000045 8D0C8DFCFFFFFF              LEA    ECX, [4*ECX-4] 
   17| 00004C 03D9                        ADD    EBX, ECX 
   17| 00004E 8B1418                      MOV    EDX, [EAX+EBX+0] 
   17| 000051 3955F4                      CMP    [EBP-12], EDX ;  max
   17| 000054 7D21                        JGE    SHORT L47 
;  Source Line # 17  (Inline # 84 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000056 8B4508                      MOV    EAX, [EBP+8] ;  m
   17| 000059 8B5DF8                      MOV    EBX, [EBP-8] 
   17| 00005C 8D5BFF                      LEA    EBX, [EBX-1] 
   17| 00005F 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   17| 000062 C1E302                      SHL    EBX, 2 
   17| 000065 8B4DFC                      MOV    ECX, [EBP-4] 
   17| 000068 8D0C8DFCFFFFFF              LEA    ECX, [4*ECX-4] 
   17| 00006F 03D9                        ADD    EBX, ECX 
   17| 000071 8B1418                      MOV    EDX, [EAX+EBX+0] 
   17| 000074 8955F4                      MOV    [EBP-12], EDX ;  max
;  Source Line # 17  (Inline # 85 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17|                 L47:                             
;  Source Line # 17  (Inline # 86 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000077 8B45FC                      MOV    EAX, [EBP-4] 
   17| 00007A 40                          INC    EAX    
   17| 00007B 8945FC                      MOV    [EBP-4], EAX 
   17| 00007E 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 000082 7EAF                        JLE    SHORT L46 
;  Source Line # 17  (Inline # 87 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000084 8B45F8                      MOV    EAX, [EBP-8] 
   17| 000087 40                          INC    EAX    
   17| 000088 8945F8                      MOV    [EBP-8], EAX 
   17| 00008B 837DF803                    CMP    DWORD PTR [EBP-8], 3 
   17| 00008F 7E9B                        JLE    SHORT L43 
;  Source Line # 17  (Inline # 88 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000091 8B45F4                      MOV    EAX, [EBP-12] ;  max
   17| 000094 8BE5                        MOV    ESP, EBP 
   17| 000096 5D                          POP    EBP    
   17| 000097 C20400                      RET    4      
   17|                 L50:                             
   17| 00009A F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu_f2.matrixmax ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000405     DD     00000B03 
                                          DD     0000004D 
                                          DD     00000000 
                                          DD     __lcl.00000421 
                                          DD     00000050 
                                          DD     0000001D 
                                          DD     __lcl.00000421 
                                          DD     00000051 
                                          DD     00000025 
                                          DD     __lcl.00000421 
                                          DD     00000052 
                                          DD     0000002C 
                                          DD     __lcl.00000421 
                                          DD     00000053 
                                          DD     00000033 
                                          DD     __lcl.00000421 
                                          DD     00000054 
                                          DD     00000056 
                                          DD     __lcl.00000421 
                                          DD     00000055 
                                          DD     00000077 
                                          DD     __lcl.00000421 
                                          DD     00000056 
                                          DD     00000077 
                                          DD     __lcl.00000421 
                                          DD     00000057 
                                          DD     00000084 
                                          DD     __lcl.00000421 
                                          DD     00000058 
                                          DD     00000091 
                                          DD     __lcl.00000421 
                                          DD     00000058 
                                          DD     0000009B 
                                          DD     __lcl.00000421 
; ********* End of segment, Total Size = 136

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu_f2.matrixmin   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu_f2.matrixmin 
                       lab2_sepcomp3.modu_f2.matrixmin PROC NEAR 
;  Source Line # 17  (Inline # 92 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC10                      SUB    ESP, 16 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078F300                    CMP    BYTE PTR [EAX-13], 0 ;  MatrixMin__elab_bool
   17|                 L49:                             
   17| 000017 0F847D000000                JE     L50    
;  Source Line # 17  (Inline # 95 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00001D 8B4508                      MOV    EAX, [EBP+8] ;  m
   17| 000020 8B18                        MOV    EBX, [EAX+0] 
   17| 000022 895DF4                      MOV    [EBP-12], EBX ;  max
;  Source Line # 17  (Inline # 96 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000025 C745F801000000              MOV    DWORD PTR [EBP-8], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 97 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 00002C C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L46:                             
;  Source Line # 17  (Inline # 98 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000033 8B4508                      MOV    EAX, [EBP+8] ;  m
   17| 000036 8B5DF8                      MOV    EBX, [EBP-8] 
   17| 000039 8D5BFF                      LEA    EBX, [EBX-1] 
   17| 00003C 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   17| 00003F C1E302                      SHL    EBX, 2 
   17| 000042 8B4DFC                      MOV    ECX, [EBP-4] 
   17| 000045 8D0C8DFCFFFFFF              LEA    ECX, [4*ECX-4] 
   17| 00004C 03D9                        ADD    EBX, ECX 
   17| 00004E 8B1418                      MOV    EDX, [EAX+EBX+0] 
   17| 000051 3955F4                      CMP    [EBP-12], EDX ;  max
   17| 000054 7E21                        JLE    SHORT L47 
;  Source Line # 17  (Inline # 99 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000056 8B4508                      MOV    EAX, [EBP+8] ;  m
   17| 000059 8B5DF8                      MOV    EBX, [EBP-8] 
   17| 00005C 8D5BFF                      LEA    EBX, [EBX-1] 
   17| 00005F 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   17| 000062 C1E302                      SHL    EBX, 2 
   17| 000065 8B4DFC                      MOV    ECX, [EBP-4] 
   17| 000068 8D0C8DFCFFFFFF              LEA    ECX, [4*ECX-4] 
   17| 00006F 03D9                        ADD    EBX, ECX 
   17| 000071 8B1418                      MOV    EDX, [EAX+EBX+0] 
   17| 000074 8955F4                      MOV    [EBP-12], EDX ;  max
;  Source Line # 17  (Inline # 100 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17|                 L47:                             
;  Source Line # 17  (Inline # 101 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000077 8B45FC                      MOV    EAX, [EBP-4] 
   17| 00007A 40                          INC    EAX    
   17| 00007B 8945FC                      MOV    [EBP-4], EAX 
   17| 00007E 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 000082 7EAF                        JLE    SHORT L46 
;  Source Line # 17  (Inline # 102 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000084 8B45F8                      MOV    EAX, [EBP-8] 
   17| 000087 40                          INC    EAX    
   17| 000088 8945F8                      MOV    [EBP-8], EAX 
   17| 00008B 837DF803                    CMP    DWORD PTR [EBP-8], 3 
   17| 00008F 7E9B                        JLE    SHORT L43 
;  Source Line # 17  (Inline # 103 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   17| 000091 8B45F4                      MOV    EAX, [EBP-12] ;  max
   17| 000094 8BE5                        MOV    ESP, EBP 
   17| 000096 5D                          POP    EBP    
   17| 000097 C20400                      RET    4      
   17|                 L50:                             
   17| 00009A F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu_f2.matrixmin ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000404     DD     00000B03 
                                          DD     0000005C 
                                          DD     00000000 
                                          DD     __lcl.00000421 
                                          DD     0000005F 
                                          DD     0000001D 
                                          DD     __lcl.00000421 
                                          DD     00000060 
                                          DD     00000025 
                                          DD     __lcl.00000421 
                                          DD     00000061 
                                          DD     0000002C 
                                          DD     __lcl.00000421 
                                          DD     00000062 
                                          DD     00000033 
                                          DD     __lcl.00000421 
                                          DD     00000063 
                                          DD     00000056 
                                          DD     __lcl.00000421 
                                          DD     00000064 
                                          DD     00000077 
                                          DD     __lcl.00000421 
                                          DD     00000065 
                                          DD     00000077 
                                          DD     __lcl.00000421 
                                          DD     00000066 
                                          DD     00000084 
                                          DD     __lcl.00000421 
                                          DD     00000067 
                                          DD     00000091 
                                          DD     __lcl.00000421 
                                          DD     00000067 
                                          DD     0000009B 
                                          DD     __lcl.00000421 
; ********* End of segment, Total Size = 136

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu_f3.func3   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu_f3.func3 
                       lab2_sepcomp3.modu_f3.func3 PROC NEAR 
;  Source Line # 17  (Inline # 5 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC64                      SUB    ESP, 100 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078F400                    CMP    BYTE PTR [EAX-12], 0 ;  Func3__elab_bool
   17|                 L42:                             
   17| 000017 0F8484000000                JE     L43    
;  Source Line # 17  (Inline # 6 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
   17| 00001D 8B02                        MOV    EAX, [EDX+0] 
   17| 00001F 8945AC                      MOV    [EBP-84], EAX 
;  Source Line # 17  (Inline # 8 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
   17| 000022 FF7510                      PUSH   DWORD PTR [EBP+16] ;  E
   17| 000025 8B5D0C                      MOV    EBX, [EBP+12] ;  MB
   17| 000028 53                          PUSH   EBX    
   17| 000029 8D4DD4                      LEA    ECX, [EBP-44] 
   17| 00002C 51                          PUSH   ECX    
   17| 00002D E800000000                  CALL   lab2_sepcomp3.modu_f2.multimatrnum 
   17| 000032 50                          PUSH   EAX    
   17| 000033 8B7508                      MOV    ESI, [EBP+8] ;  MA
   17| 000036 56                          PUSH   ESI    
   17| 000037 8D7DB0                      LEA    EDI, [EBP-80] 
   17| 00003A 57                          PUSH   EDI    
   17| 00003B E800000000                  CALL   lab2_sepcomp3.modu_f2.matrixmult 
   17| 000040 50                          PUSH   EAX    
   17| 000041 E800000000                  CALL   lab2_sepcomp3.modu_f2.matrixmin 
   17| 000046 8945A8                      MOV    [EBP-88], EAX ;  k
;  Source Line # 17  (Inline # 10 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
   17|                 L41:                             
   17|                 L31:                             
   17| 000049 6800000000                  PUSH   program_error 
   17| 00004E E800000000                  CALL   rts_raise 
   17| 000053 6800000000                  PUSH   program_error 
   17| 000058 E800000000                  CALL   rts_raise 
   17|                 L40:                             
   17| 00005D 8B459C                      MOV    EAX, [EBP-100] ; Spill
   17| 000060 8BE5                        MOV    ESP, EBP 
   17| 000062 5D                          POP    EBP    
   17| 000063 C20C00                      RET    12     
;  Source Line # 17  (Inline # 10 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
;  Source Line # 17  (Inline # 11 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
   17| 000066 8945F8                      MOV    [EBP-8], EAX 
;  Source Line # 17  (Inline # 12 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
   17| 000069 6A00                        PUSH   0      
   17| 00006B 8D5DAC                      LEA    EBX, [EBP-84] 
   17| 00006E 53                          PUSH   EBX    
   17| 00006F 8B4DF8                      MOV    ECX, [EBP-8] 
   17| 000072 51                          PUSH   ECX    
   17| 000073 E800000000                  CALL   rts_ss_copy_exception_and_rlse 
   17| 000078 8945FC                      MOV    [EBP-4], EAX 
   17| 00007B 6800000000                  PUSH   __lcl.00000289 
   17| 000080 6800000000                  PUSH   __lcl.00000288 
   17| 000085 E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 17  (Inline # 13 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
   17| 00008A 8B55A8                      MOV    EDX, [EBP-88] ;  k
   17| 00008D 8955A4                      MOV    [EBP-92], EDX 
   17| 000090 8D75AC                      LEA    ESI, [EBP-84] 
   17| 000093 56                          PUSH   ESI    
   17| 000094 E800000000                  CALL   rts_ss_release 
   17| 000099 8B45A4                      MOV    EAX, [EBP-92] 
   17| 00009C 89459C                      MOV    [EBP-100], EAX ; Spill
   17| 00009F EBBC                        JMP    SHORT L40 
   17|                 L43:                             
   17| 0000A1 F6F4                        DIV    AH     
; Exception scope table. (Code offsets in bytes relative to start of Ubod)
                       Scope_1:                         
                                          DD     0000001DH ; Code start
                                          DD     00000049H ; Code end
                                          DD     0      ; Handler table entry H_0

; Exception handler table (Offsets in bytes relative to start of Ubod)
                       H_0:                             
                                          DD     constraint_error ; Exception address
                                          DD     00000066H ; Code offset for handler
                       H_1:                             
                                          DD     1      ; End of search
                                          DD     0      
                       ;                                
                       lab2_sepcomp3.modu_f3.func3 ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000403     DD     00000903 
                                          DD     00000005 
                                          DD     00000000 
                                          DD     __lcl.00000422 
                                          DD     00000006 
                                          DD     0000001D 
                                          DD     __lcl.00000422 
                                          DD     00000008 
                                          DD     00000022 
                                          DD     __lcl.00000422 
                                          DD     0000000A 
                                          DD     00000049 
                                          DD     __lcl.00000422 
                                          DD     0000000A 
                                          DD     00000066 
                                          DD     __lcl.00000422 
                                          DD     0000000B 
                                          DD     00000066 
                                          DD     __lcl.00000422 
                                          DD     0000000C 
                                          DD     00000069 
                                          DD     __lcl.00000422 
                                          DD     0000000D 
                                          DD     0000008A 
                                          DD     __lcl.00000422 
                                          DD     0000000D 
                                          DD     000000A2 
                                          DD     __lcl.00000422 
; ********* End of segment, Total Size = 112

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu_io.vectoutput   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu_io.vectoutput 
                       lab2_sepcomp3.modu_io.vectoutput PROC NEAR 
;  Source Line # 17  (Inline # 8 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC04                      SUB    ESP, 4 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078F500                    CMP    BYTE PTR [EAX-11], 0 ;  VectOutput__elab_bool
   17|                 L44:                             
   17| 000017 7458                        JE     SHORT L45 
;  Source Line # 17  (Inline # 10 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000019 6800000000                  PUSH   __lcl.00000296 
   17| 00001E 6800000000                  PUSH   __lcl.00000295 
   17| 000023 E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 17  (Inline # 11 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000028 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 12 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00002F 0FB60500000000              MOVZX  EAX, BYTE PTR ada.integer_text_io.default_base 
   17| 000036 50                          PUSH   EAX    
   17| 000037 6A02                        PUSH   2      
   17| 000039 8B5D08                      MOV    EBX, [EBP+8] ;  A
   17| 00003C 8B4DFC                      MOV    ECX, [EBP-4] 
   17| 00003F FF748BFC                    PUSH   DWORD PTR [EBX+4*ECX-4] 
   17| 000043 E800000000                  CALL   ada.integer_text_io.put__2 
;  Source Line # 17  (Inline # 13 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000048 8B55FC                      MOV    EDX, [EBP-4] 
   17| 00004B 42                          INC    EDX    
   17| 00004C 8955FC                      MOV    [EBP-4], EDX 
   17| 00004F 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 000053 7EDA                        JLE    SHORT L43 
;  Source Line # 17  (Inline # 14 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000055 6800000000                  PUSH   __lcl.00000296 
   17| 00005A 6800000000                  PUSH   __lcl.00000306 
   17| 00005F E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 17  (Inline # 15 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000064 6A01                        PUSH   1      
   17| 000066 E800000000                  CALL   ada.text_io.new_line__2 
   17| 00006B 8BE5                        MOV    ESP, EBP 
   17| 00006D 5D                          POP    EBP    
   17| 00006E C20400                      RET    4      
   17|                 L45:                             
   17| 000071 F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu_io.vectoutput ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000402     DD     00000803 
                                          DD     00000008 
                                          DD     00000000 
                                          DD     __lcl.00000423 
                                          DD     0000000A 
                                          DD     00000019 
                                          DD     __lcl.00000423 
                                          DD     0000000B 
                                          DD     00000028 
                                          DD     __lcl.00000423 
                                          DD     0000000C 
                                          DD     0000002F 
                                          DD     __lcl.00000423 
                                          DD     0000000D 
                                          DD     00000048 
                                          DD     __lcl.00000423 
                                          DD     0000000E 
                                          DD     00000055 
                                          DD     __lcl.00000423 
                                          DD     0000000F 
                                          DD     00000064 
                                          DD     __lcl.00000423 
                                          DD     0000000F 
                                          DD     00000072 
                                          DD     __lcl.00000423 
; ********* End of segment, Total Size = 100

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu_io.matrixoutput   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu_io.matrixoutput 
                       lab2_sepcomp3.modu_io.matrixoutput PROC NEAR 
;  Source Line # 17  (Inline # 19 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC04                      SUB    ESP, 4 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078F600                    CMP    BYTE PTR [EAX-10], 0 ;  MatrixOutput__elab_bool
   17|                 L44:                             
   17| 000017 7439                        JE     SHORT L45 
;  Source Line # 17  (Inline # 27 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000019 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 28 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000020 8B4508                      MOV    EAX, [EBP+8] ;  a
   17| 000023 8B5DFC                      MOV    EBX, [EBP-4] 
   17| 000026 8D5BFF                      LEA    EBX, [EBX-1] 
   17| 000029 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   17| 00002C C1E302                      SHL    EBX, 2 
   17| 00002F 8D0418                      LEA    EAX, [EAX+EBX+0] 
   17| 000032 50                          PUSH   EAX    
   17| 000033 E800000000                  CALL   lab2_sepcomp3.modu_io.vectoutput 
;  Source Line # 17  (Inline # 29 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000038 6A01                        PUSH   1      
   17| 00003A E800000000                  CALL   ada.text_io.new_line__2 
;  Source Line # 17  (Inline # 30 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00003F 8B4DFC                      MOV    ECX, [EBP-4] 
   17| 000042 41                          INC    ECX    
   17| 000043 894DFC                      MOV    [EBP-4], ECX 
   17| 000046 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 00004A 7ED4                        JLE    SHORT L43 
   17| 00004C 8BE5                        MOV    ESP, EBP 
   17| 00004E 5D                          POP    EBP    
   17| 00004F C20400                      RET    4      
   17|                 L45:                             
   17| 000052 F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu_io.matrixoutput ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000401     DD     00000603 
                                          DD     00000013 
                                          DD     00000000 
                                          DD     __lcl.00000423 
                                          DD     0000001B 
                                          DD     00000019 
                                          DD     __lcl.00000423 
                                          DD     0000001C 
                                          DD     00000020 
                                          DD     __lcl.00000423 
                                          DD     0000001D 
                                          DD     00000038 
                                          DD     __lcl.00000423 
                                          DD     0000001E 
                                          DD     0000003F 
                                          DD     __lcl.00000423 
                                          DD     0000001E 
                                          DD     00000053 
                                          DD     __lcl.00000423 
; ********* End of segment, Total Size = 76

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu_io.vectinput   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu_io.vectinput 
                       lab2_sepcomp3.modu_io.vectinput PROC NEAR 
;  Source Line # 17  (Inline # 34 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC1C                      SUB    ESP, 28 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078F700                    CMP    BYTE PTR [EAX-9], 0 ;  VectInput__elab_bool
   17|                 L46:                             
   17| 000017 0F84A6000000                JE     L47    
;  Source Line # 17  (Inline # 36 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00001D 6800000000                  PUSH   __lcl.00000322 
   17| 000022 6800000000                  PUSH   __lcl.00000321 
   17| 000027 8955E4                      MOV    [EBP-28], EDX ; Spill
   17| 00002A E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 17  (Inline # 37 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00002F 0FB60500000000              MOVZX  EAX, BYTE PTR ada.integer_text_io.default_base 
   17| 000036 50                          PUSH   EAX    
   17| 000037 6A03                        PUSH   3      
   17| 000039 6A03                        PUSH   3      
   17| 00003B E800000000                  CALL   ada.integer_text_io.put__2 
;  Source Line # 17  (Inline # 38 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000040 6800000000                  PUSH   __lcl.00000324 
   17| 000045 6800000000                  PUSH   __lcl.00000323 
   17| 00004A E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 17  (Inline # 39 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00004F C745EC01000000              MOV    DWORD PTR [EBP-20], 1 
;  Source Line # 17  (Inline # 40 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17|                 L44:                             
;  Source Line # 17  (Inline # 41 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000056 8B55E4                      MOV    EDX, [EBP-28] ; Spill
   17| 000059 8B02                        MOV    EAX, [EDX+0] 
   17| 00005B 8945F0                      MOV    [EBP-16], EAX 
;  Source Line # 17  (Inline # 42 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00005E 6A00                        PUSH   0      
   17| 000060 8D5DF4                      LEA    EBX, [EBP-12] 
   17| 000063 53                          PUSH   EBX    
   17| 000064 E800000000                  CALL   ada.integer_text_io.get__2 
   17| 000069 8B4D08                      MOV    ECX, [EBP+8] ;  a
   17| 00006C 8B75EC                      MOV    ESI, [EBP-20] 
   17| 00006F 8B7DF4                      MOV    EDI, [EBP-12] 
   17| 000072 897CB1FC                    MOV    [ECX+4*ESI-4], EDI 
   17| 000076 EB02                        JMP    SHORT L35 
   17|                 L45:                             
;  Source Line # 17  (Inline # 47 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17|                 L38:                             
;  Source Line # 17  (Inline # 48 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
;  Source Line # 17  (Inline # 49 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000078 EBDC                        JMP    SHORT L44 
   17|                 L35:                             
;  Source Line # 17  (Inline # 50 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00007A 8B45EC                      MOV    EAX, [EBP-20] 
   17| 00007D 40                          INC    EAX    
   17| 00007E 8945EC                      MOV    [EBP-20], EAX 
   17| 000081 837DEC03                    CMP    DWORD PTR [EBP-20], 3 
   17| 000085 7ECF                        JLE    SHORT L44 
   17| 000087 8BE5                        MOV    ESP, EBP 
   17| 000089 5D                          POP    EBP    
   17| 00008A C20400                      RET    4      
;  Source Line # 17  (Inline # 44 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
;  Source Line # 17  (Inline # 45 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00008D 8945F8                      MOV    [EBP-8], EAX 
;  Source Line # 17  (Inline # 46 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000090 6A00                        PUSH   0      
   17| 000092 8D5DF0                      LEA    EBX, [EBP-16] 
   17| 000095 53                          PUSH   EBX    
   17| 000096 8B4DF8                      MOV    ECX, [EBP-8] 
   17| 000099 51                          PUSH   ECX    
   17| 00009A E800000000                  CALL   rts_ss_copy_exception_and_rlse 
   17| 00009F 8945FC                      MOV    [EBP-4], EAX 
   17| 0000A2 6800000000                  PUSH   __lcl.00000332 
   17| 0000A7 6800000000                  PUSH   __lcl.00000331 
   17| 0000AC E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 17  (Inline # 47 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 0000B1 6A01                        PUSH   1      
   17| 0000B3 E800000000                  CALL   ada.text_io.skip_line__2 
   17| 0000B8 8D55F0                      LEA    EDX, [EBP-16] 
   17| 0000BB 52                          PUSH   EDX    
   17| 0000BC E800000000                  CALL   rts_ss_release 
   17| 0000C1 EBB5                        JMP    SHORT L38 
   17|                 L47:                             
   17| 0000C3 F6F4                        DIV    AH     
; Exception scope table. (Code offsets in bytes relative to start of Ubod)
                       Scope_1:                         
                                          DD     00000056H ; Code start
                                          DD     00000078H ; Code end
                                          DD     0      ; Handler table entry H_0

; Exception handler table (Offsets in bytes relative to start of Ubod)
                       H_0:                             
                                          DD     ada.io_exceptions.data_error ; Exception address
                                          DD     0000008DH ; Code offset for handler
                       H_1:                             
                                          DD     1      ; End of search
                                          DD     0      
                       ;                                
                       lab2_sepcomp3.modu_io.vectinput ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000400     DD     00001103 
                                          DD     00000022 
                                          DD     00000000 
                                          DD     __lcl.00000423 
                                          DD     00000024 
                                          DD     0000001D 
                                          DD     __lcl.00000423 
                                          DD     00000025 
                                          DD     0000002F 
                                          DD     __lcl.00000423 
                                          DD     00000026 
                                          DD     00000040 
                                          DD     __lcl.00000423 
                                          DD     00000027 
                                          DD     0000004F 
                                          DD     __lcl.00000423 
                                          DD     00000028 
                                          DD     00000056 
                                          DD     __lcl.00000423 
                                          DD     00000029 
                                          DD     00000056 
                                          DD     __lcl.00000423 
                                          DD     0000002A 
                                          DD     0000005E 
                                          DD     __lcl.00000423 
                                          DD     0000002F 
                                          DD     00000078 
                                          DD     __lcl.00000423 
                                          DD     00000030 
                                          DD     00000078 
                                          DD     __lcl.00000423 
                                          DD     00000031 
                                          DD     00000078 
                                          DD     __lcl.00000423 
                                          DD     00000032 
                                          DD     0000007A 
                                          DD     __lcl.00000423 
                                          DD     0000002C 
                                          DD     0000008D 
                                          DD     __lcl.00000423 
                                          DD     0000002D 
                                          DD     0000008D 
                                          DD     __lcl.00000423 
                                          DD     0000002E 
                                          DD     00000090 
                                          DD     __lcl.00000423 
                                          DD     0000002F 
                                          DD     000000B1 
                                          DD     __lcl.00000423 
                                          DD     0000002F 
                                          DD     000000C4 
                                          DD     __lcl.00000423 
; ********* End of segment, Total Size = 208

                       ;                                
                       ;  Start of procedure lab2_sepcomp3.modu_io.matrixinput   
                       ;                                
                                          PUBLIC lab2_sepcomp3.modu_io.matrixinput 
                       lab2_sepcomp3.modu_io.matrixinput PROC NEAR 
;  Source Line # 17  (Inline # 56 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   17| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   17| 00000A 55                          PUSH   EBP    
   17| 00000B 8BEC                        MOV    EBP, ESP 
   17| 00000D 83EC04                      SUB    ESP, 4 
   17| 000010 8B4230                      MOV    EAX, [EDX+48] 
   17| 000013 8078F800                    CMP    BYTE PTR [EAX-8], 0 ;  MatrixInput__elab_bool
   17|                 L44:                             
   17| 000017 0F8490000000                JE     L45    
;  Source Line # 17  (Inline # 58 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00001D 6800000000                  PUSH   __lcl.00000342 
   17| 000022 6800000000                  PUSH   __lcl.00000341 
   17| 000027 E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 17  (Inline # 59 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00002C 0FB60500000000              MOVZX  EAX, BYTE PTR ada.integer_text_io.default_base 
   17| 000033 50                          PUSH   EAX    
   17| 000034 6A03                        PUSH   3      
   17| 000036 6A03                        PUSH   3      
   17| 000038 E800000000                  CALL   ada.integer_text_io.put__2 
;  Source Line # 17  (Inline # 60 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00003D 6800000000                  PUSH   __lcl.00000344 
   17| 000042 6800000000                  PUSH   __lcl.00000343 
   17| 000047 E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 17  (Inline # 61 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00004C 0FB61D00000000              MOVZX  EBX, BYTE PTR ada.integer_text_io.default_base 
   17| 000053 53                          PUSH   EBX    
   17| 000054 6A03                        PUSH   3      
   17| 000056 6A03                        PUSH   3      
   17| 000058 E800000000                  CALL   ada.integer_text_io.put__2 
;  Source Line # 17  (Inline # 62 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00005D 6800000000                  PUSH   __lcl.00000346 
   17| 000062 6800000000                  PUSH   __lcl.00000345 
   17| 000067 E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 17  (Inline # 63 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00006C 6800000000                  PUSH   __lcl.00000348 
   17| 000071 6800000000                  PUSH   __lcl.00000347 
   17| 000076 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 17  (Inline # 64 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00007B C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   17|                 L43:                             
;  Source Line # 17  (Inline # 65 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 000082 8B4508                      MOV    EAX, [EBP+8] ;  m
   17| 000085 8B5DFC                      MOV    EBX, [EBP-4] 
   17| 000088 8D5BFF                      LEA    EBX, [EBX-1] 
   17| 00008B 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   17| 00008E C1E302                      SHL    EBX, 2 
   17| 000091 8D0418                      LEA    EAX, [EAX+EBX+0] 
   17| 000094 50                          PUSH   EAX    
   17| 000095 E800000000                  CALL   lab2_sepcomp3.modu_io.vectinput 
;  Source Line # 17  (Inline # 66 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   17| 00009A 8B4DFC                      MOV    ECX, [EBP-4] 
   17| 00009D 41                          INC    ECX    
   17| 00009E 894DFC                      MOV    [EBP-4], ECX 
   17| 0000A1 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   17| 0000A5 7EDB                        JLE    SHORT L43 
   17| 0000A7 8BE5                        MOV    ESP, EBP 
   17| 0000A9 5D                          POP    EBP    
   17| 0000AA C20400                      RET    4      
   17|                 L45:                             
   17| 0000AD F6F4                        DIV    AH     
                       ;                                
                       lab2_sepcomp3.modu_io.matrixinput ENDP  

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000399     DD     00000B03 
                                          DD     00000038 
                                          DD     00000000 
                                          DD     __lcl.00000423 
                                          DD     0000003A 
                                          DD     0000001D 
                                          DD     __lcl.00000423 
                                          DD     0000003B 
                                          DD     0000002C 
                                          DD     __lcl.00000423 
                                          DD     0000003C 
                                          DD     0000003D 
                                          DD     __lcl.00000423 
                                          DD     0000003D 
                                          DD     0000004C 
                                          DD     __lcl.00000423 
                                          DD     0000003E 
                                          DD     0000005D 
                                          DD     __lcl.00000423 
                                          DD     0000003F 
                                          DD     0000006C 
                                          DD     __lcl.00000423 
                                          DD     00000040 
                                          DD     0000007B 
                                          DD     __lcl.00000423 
                                          DD     00000041 
                                          DD     00000082 
                                          DD     __lcl.00000423 
                                          DD     00000042 
                                          DD     0000009A 
                                          DD     __lcl.00000423 
                                          DD     00000042 
                                          DD     000000AE 
                                          DD     __lcl.00000423 
; ********* End of segment, Total Size = 136

                       ;                                
                       ;  Start of procedure lab2_sepcomp3   
                       ;                                
                                          PUBLIC lab2_sepcomp3 
                       lab2_sepcomp3      PROC   NEAR   
;  Source Line # 113
  113| 000000 648B1504000000              MOV    EDX, FS:[+4] 
  113| 000007 8B52FC                      MOV    EDX, [EDX-4] 
  113| 00000A 55                          PUSH   EBP    
  113| 00000B 8BEC                        MOV    EBP, ESP 
  113| 00000D 8A8424ECFEFFFF              MOV    AL, [ESP-276] 
  113| 000014 81EC14010000                SUB    ESP, 276 
  113| 00001A 8B4230                      MOV    EAX, [EDX+48] 
  113| 00001D 8945FC                      MOV    [EBP-4], EAX 
  113| 000020 896A30                      MOV    [EDX+48], EBP 
;  Source Line # 114
  114| 000023 8995ECFEFFFF                MOV    [EBP-276], EDX ; Spill
  114| 000029 803D0000000000              CMP    BYTE PTR vector_f1__elab_bool, 0 
  114| 000030 750A                        JNE    SHORT L41 
  114| 000032 6800000000                  PUSH   program_error 
  114| 000037 E800000000                  CALL   rts_raise 
  114|                 L41:                             
;  Source Line # 29
   29| 00003C C645E400                    MOV    BYTE PTR [EBP-28], 0 ;  Func1__elab_bool
   29| 000040 C645E500                    MOV    BYTE PTR [EBP-27], 0 ;  VectMult__elab_bool
   29| 000044 C645E600                    MOV    BYTE PTR [EBP-26], 0 ;  VectSum__elab_bool
   29| 000048 C645E700                    MOV    BYTE PTR [EBP-25], 0 ;  VectSort__elab_bool
   29| 00004C C645E800                    MOV    BYTE PTR [EBP-24], 0 ;  PlusVect__elab_bool
   29| 000050 C645E900                    MOV    BYTE PTR [EBP-23], 0 ;  MinusVect__elab_bool
   29| 000054 C645EA00                    MOV    BYTE PTR [EBP-22], 0 ;  multiVectNum__elab_bool
   29| 000058 C645EB00                    MOV    BYTE PTR [EBP-21], 0 ;  MultiplyStep__elab_bool
;  Source Line # 29  (Inline # 17 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   29| 00005C C645E501                    MOV    BYTE PTR [EBP-27], 1 ;  VectMult__elab_bool
;  Source Line # 29  (Inline # 28 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   29| 000060 C645E601                    MOV    BYTE PTR [EBP-26], 1 ;  VectSum__elab_bool
;  Source Line # 29  (Inline # 38 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   29| 000064 C645E701                    MOV    BYTE PTR [EBP-25], 1 ;  VectSort__elab_bool
;  Source Line # 29  (Inline # 55 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   29| 000068 C645E801                    MOV    BYTE PTR [EBP-24], 1 ;  PlusVect__elab_bool
;  Source Line # 29  (Inline # 64 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   29| 00006C C645E901                    MOV    BYTE PTR [EBP-23], 1 ;  MinusVect__elab_bool
;  Source Line # 29  (Inline # 73 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   29| 000070 C645EA01                    MOV    BYTE PTR [EBP-22], 1 ;  multiVectNum__elab_bool
;  Source Line # 29  (Inline # 86 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   29| 000074 C645E401                    MOV    BYTE PTR [EBP-28], 1 ;  Func1__elab_bool
;  Source Line # 29  (Inline # 94 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   29| 000078 C645EB01                    MOV    BYTE PTR [EBP-21], 1 ;  MultiplyStep__elab_bool
;  Source Line # 117
  117| 00007C 803D0000000000              CMP    BYTE PTR vector_f1.matrix_f2__elab_bool, 0 
  117| 000083 750A                        JNE    SHORT L43 
  117| 000085 6800000000                  PUSH   program_error 
  117| 00008A E800000000                  CALL   rts_raise 
  117|                 L43:                             
;  Source Line # 51
   51| 00008F C645EC00                    MOV    BYTE PTR [EBP-20], 0 ;  Func2__elab_bool
   51| 000093 C645ED00                    MOV    BYTE PTR [EBP-19], 0 ;  MatrixMult__elab_bool
   51| 000097 C645EE00                    MOV    BYTE PTR [EBP-18], 0 ;  MatrixSum__elab_bool
   51| 00009B C645EF00                    MOV    BYTE PTR [EBP-17], 0 ;  MatrixRizn__elab_bool
   51| 00009F C645F000                    MOV    BYTE PTR [EBP-16], 0 ;  MultiMatrNum__elab_bool
   51| 0000A3 C645F100                    MOV    BYTE PTR [EBP-15], 0 ;  MatrixSort__elab_bool
   51| 0000A7 C645F200                    MOV    BYTE PTR [EBP-14], 0 ;  MatrixMax__elab_bool
   51| 0000AB C645F300                    MOV    BYTE PTR [EBP-13], 0 ;  MatrixMin__elab_bool
;  Source Line # 51  (Inline # 5 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   51| 0000AF C645EC01                    MOV    BYTE PTR [EBP-20], 1 ;  Func2__elab_bool
;  Source Line # 51  (Inline # 15 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   51| 0000B3 C645ED01                    MOV    BYTE PTR [EBP-19], 1 ;  MatrixMult__elab_bool
;  Source Line # 51  (Inline # 33 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   51| 0000B7 C645EE01                    MOV    BYTE PTR [EBP-18], 1 ;  MatrixSum__elab_bool
;  Source Line # 51  (Inline # 45 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   51| 0000BB C645EF01                    MOV    BYTE PTR [EBP-17], 1 ;  MatrixRizn__elab_bool
;  Source Line # 51  (Inline # 56 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   51| 0000BF C645F001                    MOV    BYTE PTR [EBP-16], 1 ;  MultiMatrNum__elab_bool
;  Source Line # 51  (Inline # 69 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   51| 0000C3 C645F101                    MOV    BYTE PTR [EBP-15], 1 ;  MatrixSort__elab_bool
;  Source Line # 51  (Inline # 77 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   51| 0000C7 C645F201                    MOV    BYTE PTR [EBP-14], 1 ;  MatrixMax__elab_bool
;  Source Line # 51  (Inline # 92 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   51| 0000CB C645F301                    MOV    BYTE PTR [EBP-13], 1 ;  MatrixMin__elab_bool
;  Source Line # 120
  120| 0000CF 803D0000000000              CMP    BYTE PTR vector_f1.matrix_f2.f3__elab_bool, 0 
  120| 0000D6 750A                        JNE    SHORT L45 
  120| 0000D8 6800000000                  PUSH   program_error 
  120| 0000DD E800000000                  CALL   rts_raise 
  120|                 L45:                             
  120| 0000E2 C645F400                    MOV    BYTE PTR [EBP-12], 0 ;  Func3__elab_bool
;  Source Line # 120  (Inline # 5 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
  120| 0000E6 C645F401                    MOV    BYTE PTR [EBP-12], 1 ;  Func3__elab_bool
;  Source Line # 123
  123| 0000EA 803D0000000000              CMP    BYTE PTR vector_f1.matrix_f2.fio__elab_bool, 0 
  123| 0000F1 750A                        JNE    SHORT L47 
  123| 0000F3 6800000000                  PUSH   program_error 
  123| 0000F8 E800000000                  CALL   rts_raise 
  123|                 L47:                             
  123| 0000FD C645F500                    MOV    BYTE PTR [EBP-11], 0 ;  VectOutput__elab_bool
  123| 000101 C645F600                    MOV    BYTE PTR [EBP-10], 0 ;  MatrixOutput__elab_bool
  123| 000105 C645F700                    MOV    BYTE PTR [EBP-9], 0 ;  VectInput__elab_bool
  123| 000109 C645F800                    MOV    BYTE PTR [EBP-8], 0 ;  MatrixInput__elab_bool
;  Source Line # 123  (Inline # 8 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
  123| 00010D C645F501                    MOV    BYTE PTR [EBP-11], 1 ;  VectOutput__elab_bool
;  Source Line # 123  (Inline # 19 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
  123| 000111 C645F601                    MOV    BYTE PTR [EBP-10], 1 ;  MatrixOutput__elab_bool
;  Source Line # 123  (Inline # 34 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
  123| 000115 C645F701                    MOV    BYTE PTR [EBP-9], 1 ;  VectInput__elab_bool
;  Source Line # 123  (Inline # 56 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
  123| 000119 C645F801                    MOV    BYTE PTR [EBP-8], 1 ;  MatrixInput__elab_bool
;  Source Line # 132
  132| 00011D 6800000000                  PUSH   __lcl.00000373 
  132| 000122 6800000000                  PUSH   __lcl.00000372 
  132| 000127 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 133
  133| 00012C 6800000000                  PUSH   __lcl.00000375 
  133| 000131 6800000000                  PUSH   __lcl.00000374 
  133| 000136 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 134
  134| 00013B 8D8504FFFFFF                LEA    EAX, [EBP-252] ;  B
  134| 000141 50                          PUSH   EAX    
  134| 000142 E800000000                  CALL   lab2_sepcomp3.modu_io.vectinput 
;  Source Line # 135
  135| 000147 6800000000                  PUSH   __lcl.00000375 
  135| 00014C 6800000000                  PUSH   __lcl.00000376 
  135| 000151 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 136
  136| 000156 8D9D10FFFFFF                LEA    EBX, [EBP-240] ;  C
  136| 00015C 53                          PUSH   EBX    
  136| 00015D E800000000                  CALL   lab2_sepcomp3.modu_io.vectinput 
;  Source Line # 137
  137| 000162 6800000000                  PUSH   __lcl.00000375 
  137| 000167 6800000000                  PUSH   __lcl.00000377 
  137| 00016C E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 138
  138| 000171 8D8D1CFFFFFF                LEA    ECX, [EBP-228] ;  D
  138| 000177 51                          PUSH   ECX    
  138| 000178 E800000000                  CALL   lab2_sepcomp3.modu_io.vectinput 
;  Source Line # 139
  139| 00017D 6800000000                  PUSH   __lcl.00000379 
  139| 000182 6800000000                  PUSH   __lcl.00000378 
  139| 000187 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 140
  140| 00018C 6A00                        PUSH   0      
  140| 00018E 8D55DC                      LEA    EDX, [EBP-36] ;  e
  140| 000191 52                          PUSH   EDX    
  140| 000192 E800000000                  CALL   ada.integer_text_io.get__2 
;  Source Line # 141
  141| 000197 FF75DC                      PUSH   DWORD PTR [EBP-36] ;  e
  141| 00019A 8DB51CFFFFFF                LEA    ESI, [EBP-228] ;  D
  141| 0001A0 56                          PUSH   ESI    
  141| 0001A1 8DBD10FFFFFF                LEA    EDI, [EBP-240] ;  C
  141| 0001A7 57                          PUSH   EDI    
  141| 0001A8 8D8504FFFFFF                LEA    EAX, [EBP-252] ;  B
  141| 0001AE 50                          PUSH   EAX    
  141| 0001AF 8D9DF8FEFFFF                LEA    EBX, [EBP-264] ;  A
  141| 0001B5 53                          PUSH   EBX    
  141| 0001B6 E800000000                  CALL   lab2_sepcomp3.modu.func1 
;  Source Line # 142
  142| 0001BB 6800000000                  PUSH   __lcl.00000381 
  142| 0001C0 6800000000                  PUSH   __lcl.00000380 
  142| 0001C5 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 143
  143| 0001CA 8D8DF8FEFFFF                LEA    ECX, [EBP-264] ;  A
  143| 0001D0 51                          PUSH   ECX    
  143| 0001D1 E800000000                  CALL   lab2_sepcomp3.modu_io.vectoutput 
;  Source Line # 144
  144| 0001D6 6A01                        PUSH   1      
  144| 0001D8 E800000000                  CALL   ada.text_io.new_line__2 
;  Source Line # 147
  147| 0001DD 6800000000                  PUSH   __lcl.00000373 
  147| 0001E2 6800000000                  PUSH   __lcl.00000382 
  147| 0001E7 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 148
  148| 0001EC 6800000000                  PUSH   __lcl.00000384 
  148| 0001F1 6800000000                  PUSH   __lcl.00000383 
  148| 0001F6 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 149
  149| 0001FB 8D9528FFFFFF                LEA    EDX, [EBP-216] ;  MA
  149| 000201 52                          PUSH   EDX    
  149| 000202 E800000000                  CALL   lab2_sepcomp3.modu_io.matrixinput 
;  Source Line # 150
  150| 000207 6800000000                  PUSH   __lcl.00000384 
  150| 00020C 6800000000                  PUSH   __lcl.00000385 
  150| 000211 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 151
  151| 000216 8DB54CFFFFFF                LEA    ESI, [EBP-180] ;  MB
  151| 00021C 56                          PUSH   ESI    
  151| 00021D E800000000                  CALL   lab2_sepcomp3.modu_io.matrixinput 
;  Source Line # 152
  152| 000222 6800000000                  PUSH   __lcl.00000384 
  152| 000227 6800000000                  PUSH   __lcl.00000386 
  152| 00022C E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 153
  153| 000231 8DBD70FFFFFF                LEA    EDI, [EBP-144] ;  MC
  153| 000237 57                          PUSH   EDI    
  153| 000238 E800000000                  CALL   lab2_sepcomp3.modu_io.matrixinput 
;  Source Line # 154
  154| 00023D 6800000000                  PUSH   __lcl.00000384 
  154| 000242 6800000000                  PUSH   __lcl.00000387 
  154| 000247 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 155
  155| 00024C 8D45B8                      LEA    EAX, [EBP-72] ;  MM
  155| 00024F 50                          PUSH   EAX    
  155| 000250 E800000000                  CALL   lab2_sepcomp3.modu_io.matrixinput 
;  Source Line # 156
  156| 000255 8D5DB8                      LEA    EBX, [EBP-72] ;  MM
  156| 000258 53                          PUSH   EBX    
  156| 000259 8D4D94                      LEA    ECX, [EBP-108] ;  MD
  156| 00025C 51                          PUSH   ECX    
  156| 00025D 8D9570FFFFFF                LEA    EDX, [EBP-144] ;  MC
  156| 000263 52                          PUSH   EDX    
  156| 000264 8DB54CFFFFFF                LEA    ESI, [EBP-180] ;  MB
  156| 00026A 56                          PUSH   ESI    
  156| 00026B 8DBD28FFFFFF                LEA    EDI, [EBP-216] ;  MA
  156| 000271 57                          PUSH   EDI    
  156| 000272 E800000000                  CALL   lab2_sepcomp3.modu_f2.func2 
;  Source Line # 157
  157| 000277 6800000000                  PUSH   __lcl.00000381 
  157| 00027C 6800000000                  PUSH   __lcl.00000388 
  157| 000281 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 158
  158| 000286 8D45B8                      LEA    EAX, [EBP-72] ;  MM
  158| 000289 50                          PUSH   EAX    
  158| 00028A E800000000                  CALL   lab2_sepcomp3.modu_io.matrixoutput 
;  Source Line # 161
  161| 00028F 6800000000                  PUSH   __lcl.00000373 
  161| 000294 6800000000                  PUSH   __lcl.00000389 
  161| 000299 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 162
  162| 00029E 6800000000                  PUSH   __lcl.00000384 
  162| 0002A3 6800000000                  PUSH   __lcl.00000383 
  162| 0002A8 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 163
  163| 0002AD 8D9D28FFFFFF                LEA    EBX, [EBP-216] ;  MA
  163| 0002B3 53                          PUSH   EBX    
  163| 0002B4 E800000000                  CALL   lab2_sepcomp3.modu_io.matrixinput 
;  Source Line # 164
  164| 0002B9 6800000000                  PUSH   __lcl.00000384 
  164| 0002BE 6800000000                  PUSH   __lcl.00000385 
  164| 0002C3 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 165
  165| 0002C8 8D8D4CFFFFFF                LEA    ECX, [EBP-180] ;  MB
  165| 0002CE 51                          PUSH   ECX    
  165| 0002CF E800000000                  CALL   lab2_sepcomp3.modu_io.matrixinput 
;  Source Line # 166
  166| 0002D4 6800000000                  PUSH   __lcl.00000379 
  166| 0002D9 6800000000                  PUSH   __lcl.00000378 
  166| 0002DE E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 167
  167| 0002E3 6A00                        PUSH   0      
  167| 0002E5 8D55DC                      LEA    EDX, [EBP-36] ;  e
  167| 0002E8 52                          PUSH   EDX    
  167| 0002E9 E800000000                  CALL   ada.integer_text_io.get__2 
;  Source Line # 168
  168| 0002EE FF75DC                      PUSH   DWORD PTR [EBP-36] ;  e
  168| 0002F1 8DB54CFFFFFF                LEA    ESI, [EBP-180] ;  MB
  168| 0002F7 56                          PUSH   ESI    
  168| 0002F8 8DBD28FFFFFF                LEA    EDI, [EBP-216] ;  MA
  168| 0002FE 57                          PUSH   EDI    
  168| 0002FF E800000000                  CALL   lab2_sepcomp3.modu_f3.func3 
  168| 000304 8945E0                      MOV    [EBP-32], EAX ;  p
;  Source Line # 169
  169| 000307 6800000000                  PUSH   __lcl.00000381 
  169| 00030C 6800000000                  PUSH   __lcl.00000390 
  169| 000311 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 170
  170| 000316 0FB61D00000000              MOVZX  EBX, BYTE PTR ada.integer_text_io.default_base 
  170| 00031D 53                          PUSH   EBX    
  170| 00031E FF3500000000                PUSH   DWORD PTR ada.integer_text_io.default_width 
  170| 000324 FF75E0                      PUSH   DWORD PTR [EBP-32] ;  p
  170| 000327 E800000000                  CALL   ada.integer_text_io.put__2 
;  Source Line # 171
  171| 00032C 8B95ECFEFFFF                MOV    EDX, [EBP-276] ; Spill
  171| 000332 8B4DFC                      MOV    ECX, [EBP-4] 
  171| 000335 894A30                      MOV    [EDX+48], ECX 
  171| 000338 8BE5                        MOV    ESP, EBP 
  171| 00033A 5D                          POP    EBP    
  171| 00033B C3                          RET           
                       ;                                
                       lab2_sepcomp3      ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000398     DD     00004103 
                                          DD     00000071 
                                          DD     00000000 
                                          DD     __lcl.00000424 
                                          DD     00000072 
                                          DD     00000023 
                                          DD     __lcl.00000424 
                                          DD     0000001D 
                                          DD     0000003C 
                                          DD     __lcl.00000424 
                                          DD     00000011 
                                          DD     0000005C 
                                          DD     __lcl.00000420 
                                          DD     0000001C 
                                          DD     00000060 
                                          DD     __lcl.00000420 
                                          DD     00000026 
                                          DD     00000064 
                                          DD     __lcl.00000420 
                                          DD     00000037 
                                          DD     00000068 
                                          DD     __lcl.00000420 
                                          DD     00000040 
                                          DD     0000006C 
                                          DD     __lcl.00000420 
                                          DD     00000049 
                                          DD     00000070 
                                          DD     __lcl.00000420 
                                          DD     00000056 
                                          DD     00000074 
                                          DD     __lcl.00000420 
                                          DD     0000005E 
                                          DD     00000078 
                                          DD     __lcl.00000420 
                                          DD     00000075 
                                          DD     0000007C 
                                          DD     __lcl.00000424 
                                          DD     00000033 
                                          DD     0000008F 
                                          DD     __lcl.00000424 
                                          DD     00000005 
                                          DD     000000AF 
                                          DD     __lcl.00000421 
                                          DD     0000000F 
                                          DD     000000B3 
                                          DD     __lcl.00000421 
                                          DD     00000021 
                                          DD     000000B7 
                                          DD     __lcl.00000421 
                                          DD     0000002D 
                                          DD     000000BB 
                                          DD     __lcl.00000421 
                                          DD     00000038 
                                          DD     000000BF 
                                          DD     __lcl.00000421 
                                          DD     00000045 
                                          DD     000000C3 
                                          DD     __lcl.00000421 
                                          DD     0000004D 
                                          DD     000000C7 
                                          DD     __lcl.00000421 
                                          DD     0000005C 
                                          DD     000000CB 
                                          DD     __lcl.00000421 
                                          DD     00000078 
                                          DD     000000CF 
                                          DD     __lcl.00000424 
                                          DD     00000005 
                                          DD     000000E6 
                                          DD     __lcl.00000422 
                                          DD     0000007B 
                                          DD     000000EA 
                                          DD     __lcl.00000424 
                                          DD     00000008 
                                          DD     0000010D 
                                          DD     __lcl.00000423 
                                          DD     00000013 
                                          DD     00000111 
                                          DD     __lcl.00000423 
                                          DD     00000022 
                                          DD     00000115 
                                          DD     __lcl.00000423 
                                          DD     00000038 
                                          DD     00000119 
                                          DD     __lcl.00000423 
                                          DD     00000084 
                                          DD     0000011D 
                                          DD     __lcl.00000424 
                                          DD     00000085 
                                          DD     0000012C 
                                          DD     __lcl.00000424 
                                          DD     00000086 
                                          DD     0000013B 
                                          DD     __lcl.00000424 
                                          DD     00000087 
                                          DD     00000147 
                                          DD     __lcl.00000424 
                                          DD     00000088 
                                          DD     00000156 
                                          DD     __lcl.00000424 
                                          DD     00000089 
                                          DD     00000162 
                                          DD     __lcl.00000424 
                                          DD     0000008A 
                                          DD     00000171 
                                          DD     __lcl.00000424 
                                          DD     0000008B 
                                          DD     0000017D 
                                          DD     __lcl.00000424 
                                          DD     0000008C 
                                          DD     0000018C 
                                          DD     __lcl.00000424 
                                          DD     0000008D 
                                          DD     00000197 
                                          DD     __lcl.00000424 
                                          DD     0000008E 
                                          DD     000001BB 
                                          DD     __lcl.00000424 
                                          DD     0000008F 
                                          DD     000001CA 
                                          DD     __lcl.00000424 
                                          DD     00000090 
                                          DD     000001D6 
                                          DD     __lcl.00000424 
                                          DD     00000093 
                                          DD     000001DD 
                                          DD     __lcl.00000424 
                                          DD     00000094 
                                          DD     000001EC 
                                          DD     __lcl.00000424 
                                          DD     00000095 
                                          DD     000001FB 
                                          DD     __lcl.00000424 
                                          DD     00000096 
                                          DD     00000207 
                                          DD     __lcl.00000424 
                                          DD     00000097 
                                          DD     00000216 
                                          DD     __lcl.00000424 
                                          DD     00000098 
                                          DD     00000222 
                                          DD     __lcl.00000424 
                                          DD     00000099 
                                          DD     00000231 
                                          DD     __lcl.00000424 
                                          DD     0000009A 
                                          DD     0000023D 
                                          DD     __lcl.00000424 
                                          DD     0000009B 
                                          DD     0000024C 
                                          DD     __lcl.00000424 
                                          DD     0000009C 
                                          DD     00000255 
                                          DD     __lcl.00000424 
                                          DD     0000009D 
                                          DD     00000277 
                                          DD     __lcl.00000424 
                                          DD     0000009E 
                                          DD     00000286 
                                          DD     __lcl.00000424 
                                          DD     000000A1 
                                          DD     0000028F 
                                          DD     __lcl.00000424 
                                          DD     000000A2 
                                          DD     0000029E 
                                          DD     __lcl.00000424 
                                          DD     000000A3 
                                          DD     000002AD 
                                          DD     __lcl.00000424 
                                          DD     000000A4 
                                          DD     000002B9 
                                          DD     __lcl.00000424 
                                          DD     000000A5 
                                          DD     000002C8 
                                          DD     __lcl.00000424 
                                          DD     000000A6 
                                          DD     000002D4 
                                          DD     __lcl.00000424 
                                          DD     000000A7 
                                          DD     000002E3 
                                          DD     __lcl.00000424 
                                          DD     000000A8 
                                          DD     000002EE 
                                          DD     __lcl.00000424 
                                          DD     000000A9 
                                          DD     00000307 
                                          DD     __lcl.00000424 
                                          DD     000000AA 
                                          DD     00000316 
                                          DD     __lcl.00000424 
                                          DD     000000AB 
                                          DD     0000032C 
                                          DD     __lcl.00000424 
                                          DD     000000AB 
                                          DD     0000033B 
                                          DD     __lcl.00000424 
; ********* End of segment, Total Size = 784


; ************* Constant segment :
                                          ALIGN 4       
     000000            __lcl.00000390     DB     'Func3 result' 
     00000C            __lcl.00000389     DB     'Func3' 
     000011            __lcl.00000388     DB     'Func2 result' 
     00001D            __lcl.00000387     DB     'Input matrix MM' 
     00002C            __lcl.00000386     DB     'Input matrix MC' 
     00003B            __lcl.00000385     DB     'Input matrix MB' 
                                          DW     0000   
     00004C            __lcl.00000384     DD     00000001 
                                          DD     0000000F 
     000054            __lcl.00000383     DB     'Input matrix MA' 
     000063            __lcl.00000382     DB     'Func2' 
     000068            __lcl.00000381     DD     00000001 
                                          DD     0000000C 
     000070            __lcl.00000380     DB     'Func1 result' 
     00007C            __lcl.00000379     DD     00000001 
                                          DD     00000007 
     000084            __lcl.00000378     DB     'Input E' 
     00008B            __lcl.00000377     DB     'Input vector D' 
     000099            __lcl.00000376     DB     'Input vector C' 
                                          DB     00     
     0000A8            __lcl.00000375     DD     00000001 
                                          DD     0000000E 
     0000B0            __lcl.00000374     DB     'Input vector B' 
                                          DW     0000   
     0000C0            __lcl.00000373     DD     00000001 
                                          DD     00000005 
     0000C8            __lcl.00000372     DB     'Func1' 
                                          DB     00H,00H,00H 
     0000D0            __lcl.00000348     DD     00000001 
                                          DD     0000000C 
     0000D8            __lcl.00000347     DB     'Input matrix' 
     0000E4            __lcl.00000346     DD     00000001 
                                          DD     00000003 
     0000EC            __lcl.00000345     DB     ' : '  
                                          DB     00     
     0000F0            __lcl.00000344     DD     00000001 
                                          DD     00000001 
     0000F8            __lcl.00000343     DB     'x'    
                                          DB     00H,00H,00H 
     0000FC            __lcl.00000342     DD     00000001 
                                          DD     0000000D 
     000104            __lcl.00000341     DB     'Enter matrix ' 
                                          DB     00H,00H,00H 
     000114            __lcl.00000332     DD     00000001 
                                          DD     0000001F 
     00011C            __lcl.00000331     DB     'Input error. Please, try again:' 
                                          DB     00     
     00013C            __lcl.00000324     DD     00000001 
                                          DD     0000000A 
     000144            __lcl.00000323     DB     ' numbers: ' 
                                          DW     0000   
     000150            __lcl.00000322     DD     00000001 
                                          DD     0000000F 
     000158            __lcl.00000321     DB     'Enter vector - ' 
     000167            __lcl.00000306     DB     ')'    
     000168            __lcl.00000296     DD     00000001 
                                          DD     00000001 
     000170            __lcl.00000295     DB     '('    
                                          DB     00H,00H,00H 
     000174            __lcl.00000289     DD     00000001 
                                          DD     00000019 
     00017C            __lcl.00000288     DB     'Constraint error in Func3' 
                                          DB     00H,00H,00H 
     000198            __lcl.00000126     DD     00000001 
                                          DD     00000019 
     0001A0            __lcl.00000125     DB     'Constraint error in Func2' 
                                          DB     00H,00H,00H 
     0001BC            __lcl.00000103     DD     00000001 
                                          DD     0000001A 
     0001C4            __lcl.00000102     DB     'Constraint error in Func1.' 
                                          DW     0000   
     0001E0            lab2_sepcomp3.modu.n DD   00000003 
; ********* End of segment, Total Size = 484


; ************* .av_evt$R segment :
                                          ALIGN 4       
     000000            lab2_sepcomp3__rootpart____1 DD lab2_sepcomp3__subp_body_subpdesc____1 
; ********* End of segment, Total Size = 4


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000010            __lcl.00000397     DB     14H    
                                          DB     '..\lab2_sepcomp3.adb' 
                                          DB     00H    
                                          DW     0000   
     000028            __lcl.00000396     DB     0DH    
                                          DB     'Lab2_SepComp3' 
                                          DB     00H    
                                          DB     00     
     000038            lab2_sepcomp3__subp_body_subpdesc____1 DD __lcl.00000396 
                                          DD     lab2_sepcomp3 
                                          DD     __lcl.00000397 
                                          DD     00000071 
                                          DD     00000082 
                                          DD     000000AB 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000391 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000392 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000398 
                                          DD     00000114 
                                          DD     __lcl.00000005 
     00009C            __lcl.00000395     DB     01H    
                                          DB     'C'    
                                          DB     00H    
                                          DB     00     
     0000A0            __lcl.00000394     DB     01H    
                                          DB     'D'    
                                          DB     00H    
                                          DB     00     
     0000A4            __lcl.00000393     DB     01H    
                                          DB     'p'    
                                          DB     00H    
                                          DB     00     
     0000A8            __lcl.00000392     DD     0000000B 
                                          DD     __lcl.00000393 
                                          DD     __lcl.00000009 
                                          DD     FFFFFFE0 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000098 
                                          DD     __lcl.00000009 
                                          DD     FFFFFFDC 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000129 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     FFFFFFB8 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000128 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     FFFFFF94 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000130 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     FFFFFF70 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000131 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     FFFFFF4C 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000132 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     FFFFFF28 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000394 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     FFFFFF1C 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000395 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     FFFFFF10 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000071 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     FFFFFF04 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000072 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     FFFFFEF8 
                                          DD     00000003 
                                          DD     00000000 
     000188            __lcl.00000391     DD     00000004 
                                          DD     lab2_sepcomp3.modu__pkg_subpdesc____1 
                                          DD     lab2_sepcomp3.modu_f2__pkg_subpdesc____1 
                                          DD     lab2_sepcomp3.modu_f3__pkg_subpdesc____1 
                                          DD     lab2_sepcomp3.modu_io__pkg_subpdesc____1 
     00019C            __lcl.00000371     DB     07H    
                                          DB     'Modu_IO' 
                                          DB     00H    
                                          DB     00H,00H,00H 
     0001A8            lab2_sepcomp3.modu_io__pkg_subpdesc____1 DD __lcl.00000371 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000305 
                                          DD     00000005 
                                          DD     00000045 
                                          DD     00000045 
                                          DD     00000001 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000370 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     00020C            __lcl.00000370     DD     00000004 
                                          DD     lab2_sepcomp3.modu_io.vectoutput__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu_io.matrixoutput__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu_io.vectinput__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu_io.matrixinput__subp_body_subpdesc____1 
     000220            __lcl.00000369     DB     07H    
                                          DB     'Modu_F3' 
                                          DB     00H    
                                          DB     00H,00H,00H 
     00022C            lab2_sepcomp3.modu_f3__pkg_subpdesc____1 DD __lcl.00000369 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000294 
                                          DD     00000002 
                                          DD     00000010 
                                          DD     00000010 
                                          DD     00000001 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000368 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     000290            __lcl.00000368     DD     00000001 
                                          DD     lab2_sepcomp3.modu_f3.func3__subp_body_subpdesc____1 
     000298            __lcl.00000367     DB     07H    
                                          DB     'Modu_F2' 
                                          DB     00H    
                                          DB     00H,00H,00H 
     0002A4            lab2_sepcomp3.modu_f2__pkg_subpdesc____1 DD __lcl.00000367 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000134 
                                          DD     00000002 
                                          DD     0000006A 
                                          DD     0000006A 
                                          DD     00000001 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000365 
                                          DD     __lcl.00000366 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     000308            __lcl.00000366     DD     00000008 
                                          DD     lab2_sepcomp3.modu_f2.func2__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu_f2.matrixmult__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu_f2.matrixsum__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu_f2.matrixrizn__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu_f2.multimatrnum__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu_f2.matrixsort__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu_f2.matrixmax__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu_f2.matrixmin__subp_body_subpdesc____1 
     00032C            __lcl.00000365     DD     00000001 
                                          DD     __lcl.00000124 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
     000338            __lcl.00000364     DB     04H    
                                          DB     'Modu' 
                                          DB     00H    
                                          DW     0000   
     000340            lab2_sepcomp3.modu__pkg_subpdesc____1 DD __lcl.00000364 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000026 
                                          DD     0000000D 
                                          DD     00000067 
                                          DD     00000067 
                                          DD     00000001 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000360 
                                          DD     __lcl.00000362 
                                          DD     __lcl.00000363 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     0003A4            __lcl.00000363     DD     00000008 
                                          DD     lab2_sepcomp3.modu.vectmult__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu.vectsum__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu.vectsort__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu.plusvect__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu.minusvect__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu.multivectnum__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu.func1__subp_body_subpdesc____1 
                                          DD     lab2_sepcomp3.modu.multiplystep__subp_body_subpdesc____1 
     0003C8            __lcl.00000362     DD     00000001 
                                          DD     __lcl.00000016 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
     0003D4            __lcl.00000361     DB     01H    
                                          DB     'N'    
                                          DB     00H    
                                          DB     00     
     0003D8            __lcl.00000360     DD     00000001 
                                          DD     __lcl.00000361 
                                          DD     00000000 
                                          DD     __lcl.00000010 
     0003E8            __lcl.00000359     DB     0BH    
                                          DB     'MatrixInput' 
                                          DB     00H    
                                          DB     00H,00H,00H 
     0003F8            lab2_sepcomp3.modu_io.matrixinput__subp_body_subpdesc____1 DD __lcl.00000359 
                                          DD     lab2_sepcomp3.modu_io.matrixinput 
                                          DD     __lcl.00000305 
                                          DD     00000038 
                                          DD     00000038 
                                          DD     00000043 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000357 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000358 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000399 
                                          DD     00000004 
                                          DD     __lcl.00000005 
     00045C            __lcl.00000358     DD     00000001 
                                          DD     __lcl.00000356 
     000464            __lcl.00000357     DD     00000001 
                                          DD     __lcl.00000242 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     00000008 
                                          DD     00000102 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000480            __lcl.00000356     DB     8 DUP(00) 
                                          DD     __lcl.00000305 
                                          DD     00000040 
                                          DD     00000040 
                                          DD     00000042 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000355 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     0004E4            __lcl.00000355     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000354 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0004FC            __lcl.00000354     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000351 
                                          DD     __lcl.00000352 
                                          DD     __lcl.00000353 
     000518            __lcl.00000353     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000524            __lcl.00000352     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000530            __lcl.00000351     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000349 
                                          DD     __lcl.00000350 
     00054C            __lcl.00000350     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000558            __lcl.00000349     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000564            __lcl.00000340     DB     09H    
                                          DB     'VectInput' 
                                          DB     00H    
                                          DB     00     
     000570            lab2_sepcomp3.modu_io.vectinput__subp_body_subpdesc____1 DD __lcl.00000340 
                                          DD     lab2_sepcomp3.modu_io.vectinput 
                                          DD     __lcl.00000305 
                                          DD     00000022 
                                          DD     00000022 
                                          DD     00000034 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000338 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000339 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000400 
                                          DD     0000001C 
                                          DD     __lcl.00000005 
     0005D4            __lcl.00000339     DD     00000001 
                                          DD     __lcl.00000337 
     0005DC            __lcl.00000338     DD     00000001 
                                          DD     __lcl.00000029 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     00000008 
                                          DD     00000102 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0005F8            __lcl.00000337     DB     8 DUP(00) 
                                          DD     __lcl.00000305 
                                          DD     00000027 
                                          DD     00000027 
                                          DD     00000032 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000335 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000336 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     00065C            __lcl.00000336     DD     00000001 
                                          DD     __lcl.00000333 
     000664            __lcl.00000335     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000330 
                                          DD     FFFFFFEC 
                                          DD     00000003 
                                          DD     00000001 
     00067C            __lcl.00000334     DB     08H    
                                          DB     'Begin#41' 
                                          DB     00H    
                                          DW     0000   
     000688            __lcl.00000333     DD     __lcl.00000334 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000305 
                                          DD     00000029 
                                          DD     00000029 
                                          DD     00000030 
                                          DD     00000003 
                                          DD     00000005 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     0006EC            __lcl.00000330     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000327 
                                          DD     __lcl.00000328 
                                          DD     __lcl.00000329 
     000708            __lcl.00000329     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000714            __lcl.00000328     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000720            __lcl.00000327     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000325 
                                          DD     __lcl.00000326 
     00073C            __lcl.00000326     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000748            __lcl.00000325     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000754            __lcl.00000320     DB     0CH    
                                          DB     'MatrixOutput' 
                                          DB     00H    
                                          DW     0000   
     000764            lab2_sepcomp3.modu_io.matrixoutput__subp_body_subpdesc____1 DD __lcl.00000320 
                                          DD     lab2_sepcomp3.modu_io.matrixoutput 
                                          DD     __lcl.00000305 
                                          DD     00000013 
                                          DD     00000013 
                                          DD     0000001F 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000318 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000319 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000401 
                                          DD     00000004 
                                          DD     __lcl.00000005 
     0007C8            __lcl.00000319     DD     00000001 
                                          DD     __lcl.00000317 
     0007D0            __lcl.00000318     DD     00000001 
                                          DD     __lcl.00000029 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0007EC            __lcl.00000317     DB     8 DUP(00) 
                                          DD     __lcl.00000305 
                                          DD     0000001B 
                                          DD     0000001B 
                                          DD     0000001E 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000316 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     000850            __lcl.00000316     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000315 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000868            __lcl.00000315     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000312 
                                          DD     __lcl.00000313 
                                          DD     __lcl.00000314 
     000884            __lcl.00000314     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000890            __lcl.00000313     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00089C            __lcl.00000312     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000310 
                                          DD     __lcl.00000311 
     0008B8            __lcl.00000311     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0008C4            __lcl.00000310     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0008D0            __lcl.00000309     DB     0AH    
                                          DB     'VectOutput' 
                                          DB     00H    
     0008DC            lab2_sepcomp3.modu_io.vectoutput__subp_body_subpdesc____1 DD __lcl.00000309 
                                          DD     lab2_sepcomp3.modu_io.vectoutput 
                                          DD     __lcl.00000305 
                                          DD     00000008 
                                          DD     00000008 
                                          DD     00000010 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000307 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000308 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000402 
                                          DD     00000004 
                                          DD     __lcl.00000005 
     000940            __lcl.00000308     DD     00000001 
                                          DD     __lcl.00000304 
     000948            __lcl.00000307     DD     00000001 
                                          DD     __lcl.00000072 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000964            __lcl.00000305     DB     1EH    
                                          DB     '..\vector_f1-matrix_f2-fio.adb' 
                                          DB     00H    
     000984            __lcl.00000304     DB     8 DUP(00) 
                                          DD     __lcl.00000305 
                                          DD     0000000B 
                                          DD     0000000B 
                                          DD     0000000D 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000303 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     0009E8            __lcl.00000303     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000302 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000A00            __lcl.00000302     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000299 
                                          DD     __lcl.00000300 
                                          DD     __lcl.00000301 
     000A1C            __lcl.00000301     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000A28            __lcl.00000300     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000A34            __lcl.00000299     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000297 
                                          DD     __lcl.00000298 
     000A50            __lcl.00000298     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000A5C            __lcl.00000297     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000A68            __lcl.00000294     DB     1DH    
                                          DB     '..\vector_f1-matrix_f2-f3.adb' 
                                          DB     00H    
                                          DB     00     
     000A88            __lcl.00000293     DB     05H    
                                          DB     'Func3' 
                                          DB     00H    
                                          DB     00     
     000A90            lab2_sepcomp3.modu_f3.func3__subp_body_subpdesc____1 DD __lcl.00000293 
                                          DD     lab2_sepcomp3.modu_f3.func3 
                                          DD     __lcl.00000294 
                                          DD     00000005 
                                          DD     00000005 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000009 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000290 
                                          DD     __lcl.00000292 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000403 
                                          DD     00000064 
                                          DD     __lcl.00000005 
     000AF4            __lcl.00000292     DD     00000001 
                                          DD     __lcl.00000157 
                                          DD     __lcl.00000009 
                                          DD     FFFFFFA8 
                                          DD     00000003 
                                          DD     00000000 
     000B0C            __lcl.00000291     DB     01H    
                                          DB     'E'    
                                          DB     00H    
                                          DB     00     
     000B10            __lcl.00000290     DD     00000003 
                                          DD     __lcl.00000291 
                                          DD     __lcl.00000009 
                                          DD     00000010 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000131 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000132 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000B5C            __lcl.00000287     DB     09H    
                                          DB     'MatrixMin' 
                                          DB     00H    
                                          DB     00     
     000B68            lab2_sepcomp3.modu_f2.matrixmin__subp_body_subpdesc____1 DD __lcl.00000287 
                                          DD     lab2_sepcomp3.modu_f2.matrixmin 
                                          DD     __lcl.00000134 
                                          DD     0000005C 
                                          DD     0000005C 
                                          DD     00000068 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000009 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000284 
                                          DD     __lcl.00000285 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000286 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000404 
                                          DD     00000010 
                                          DD     __lcl.00000005 
     000BCC            __lcl.00000286     DD     00000001 
                                          DD     __lcl.00000283 
     000BD4            __lcl.00000285     DD     00000001 
                                          DD     __lcl.00000264 
                                          DD     __lcl.00000009 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000000 
     000BEC            __lcl.00000284     DD     00000001 
                                          DD     __lcl.00000242 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000C08            __lcl.00000283     DB     8 DUP(00) 
                                          DD     __lcl.00000134 
                                          DD     00000060 
                                          DD     00000060 
                                          DD     00000066 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000281 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000282 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     000C6C            __lcl.00000282     DD     00000001 
                                          DD     __lcl.00000280 
     000C74            __lcl.00000281     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000272 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000001 
     000C8C            __lcl.00000280     DB     8 DUP(00) 
                                          DD     __lcl.00000134 
                                          DD     00000061 
                                          DD     00000061 
                                          DD     00000065 
                                          DD     00000003 
                                          DD     00000004 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000279 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     000CF0            __lcl.00000279     DD     00000001 
                                          DD     __lcl.00000148 
                                          DD     __lcl.00000278 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000D08            __lcl.00000278     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000275 
                                          DD     __lcl.00000276 
                                          DD     __lcl.00000277 
     000D24            __lcl.00000277     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000D30            __lcl.00000276     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000D3C            __lcl.00000275     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000273 
                                          DD     __lcl.00000274 
     000D58            __lcl.00000274     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000D64            __lcl.00000273     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000D70            __lcl.00000272     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000269 
                                          DD     __lcl.00000270 
                                          DD     __lcl.00000271 
     000D8C            __lcl.00000271     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000D98            __lcl.00000270     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000DA4            __lcl.00000269     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000267 
                                          DD     __lcl.00000268 
     000DC0            __lcl.00000268     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000DCC            __lcl.00000267     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000DD8            __lcl.00000266     DB     09H    
                                          DB     'MatrixMax' 
                                          DB     00H    
                                          DB     00     
     000DE4            lab2_sepcomp3.modu_f2.matrixmax__subp_body_subpdesc____1 DD __lcl.00000266 
                                          DD     lab2_sepcomp3.modu_f2.matrixmax 
                                          DD     __lcl.00000134 
                                          DD     0000004D 
                                          DD     0000004D 
                                          DD     00000059 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000009 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000262 
                                          DD     __lcl.00000263 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000265 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000405 
                                          DD     00000010 
                                          DD     __lcl.00000005 
     000E48            __lcl.00000265     DD     00000001 
                                          DD     __lcl.00000261 
     000E50            __lcl.00000264     DB     03H    
                                          DB     'max'  
                                          DB     00H    
                                          DB     00H,00H,00H 
     000E58            __lcl.00000263     DD     00000001 
                                          DD     __lcl.00000264 
                                          DD     __lcl.00000009 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000000 
     000E70            __lcl.00000262     DD     00000001 
                                          DD     __lcl.00000242 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000E8C            __lcl.00000261     DB     8 DUP(00) 
                                          DD     __lcl.00000134 
                                          DD     00000051 
                                          DD     00000051 
                                          DD     00000057 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000259 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000260 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     000EF0            __lcl.00000260     DD     00000001 
                                          DD     __lcl.00000258 
     000EF8            __lcl.00000259     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000250 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000001 
     000F10            __lcl.00000258     DB     8 DUP(00) 
                                          DD     __lcl.00000134 
                                          DD     00000052 
                                          DD     00000052 
                                          DD     00000056 
                                          DD     00000003 
                                          DD     00000004 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000257 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     000F74            __lcl.00000257     DD     00000001 
                                          DD     __lcl.00000148 
                                          DD     __lcl.00000256 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000F8C            __lcl.00000256     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000253 
                                          DD     __lcl.00000254 
                                          DD     __lcl.00000255 
     000FA8            __lcl.00000255     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000FB4            __lcl.00000254     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000FC0            __lcl.00000253     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000251 
                                          DD     __lcl.00000252 
     000FDC            __lcl.00000252     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000FE8            __lcl.00000251     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000FF4            __lcl.00000250     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000247 
                                          DD     __lcl.00000248 
                                          DD     __lcl.00000249 
     001010            __lcl.00000249     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     00101C            __lcl.00000248     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001028            __lcl.00000247     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000245 
                                          DD     __lcl.00000246 
     001044            __lcl.00000246     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001050            __lcl.00000245     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00105C            __lcl.00000244     DB     0AH    
                                          DB     'MatrixSort' 
                                          DB     00H    
     001068            lab2_sepcomp3.modu_f2.matrixsort__subp_body_subpdesc____1 DD __lcl.00000244 
                                          DD     lab2_sepcomp3.modu_f2.matrixsort 
                                          DD     __lcl.00000134 
                                          DD     00000045 
                                          DD     00000045 
                                          DD     0000004A 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000241 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000243 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000406 
                                          DD     00000004 
                                          DD     __lcl.00000005 
     0010CC            __lcl.00000243     DD     00000001 
                                          DD     __lcl.00000240 
     0010D4            __lcl.00000242     DB     01H    
                                          DB     'm'    
                                          DB     00H    
                                          DB     00     
     0010D8            __lcl.00000241     DD     00000001 
                                          DD     __lcl.00000242 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     00000008 
                                          DD     00000102 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0010F4            __lcl.00000240     DB     8 DUP(00) 
                                          DD     __lcl.00000134 
                                          DD     00000047 
                                          DD     00000047 
                                          DD     00000049 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000239 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     001158            __lcl.00000239     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000238 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     001170            __lcl.00000238     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000235 
                                          DD     __lcl.00000236 
                                          DD     __lcl.00000237 
     00118C            __lcl.00000237     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001198            __lcl.00000236     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0011A4            __lcl.00000235     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000233 
                                          DD     __lcl.00000234 
     0011C0            __lcl.00000234     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0011CC            __lcl.00000233     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0011D8            __lcl.00000232     DB     0CH    
                                          DB     'MultiMatrNum' 
                                          DB     00H    
                                          DW     0000   
     0011E8            lab2_sepcomp3.modu_f2.multimatrnum__subp_body_subpdesc____1 DD __lcl.00000232 
                                          DD     lab2_sepcomp3.modu_f2.multimatrnum 
                                          DD     __lcl.00000134 
                                          DD     00000038 
                                          DD     00000038 
                                          DD     00000042 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000228 
                                          DD     __lcl.00000229 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000231 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000407 
                                          DD     00000030 
                                          DD     __lcl.00000005 
     00124C            __lcl.00000231     DD     00000001 
                                          DD     __lcl.00000227 
     001254            __lcl.00000230     DB     03H    
                                          DB     'buf'  
                                          DB     00H    
                                          DB     00H,00H,00H 
     00125C            __lcl.00000229     DD     00000001 
                                          DD     __lcl.00000230 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     FFFFFFD4 
                                          DD     00000003 
                                          DD     00000000 
     001274            __lcl.00000228     DD     00000002 
                                          DD     __lcl.00000098 
                                          DD     __lcl.00000009 
                                          DD     00000010 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000072 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0012A8            __lcl.00000227     DB     8 DUP(00) 
                                          DD     __lcl.00000134 
                                          DD     0000003C 
                                          DD     0000003C 
                                          DD     00000040 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000225 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000226 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     00130C            __lcl.00000226     DD     00000001 
                                          DD     __lcl.00000224 
     001314            __lcl.00000225     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000215 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000001 
     00132C            __lcl.00000224     DB     8 DUP(00) 
                                          DD     __lcl.00000134 
                                          DD     0000003D 
                                          DD     0000003D 
                                          DD     0000003F 
                                          DD     00000003 
                                          DD     00000004 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000222 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     001390            __lcl.00000223     DB     01H    
                                          DB     'J'    
                                          DB     00H    
                                          DB     00     
     001394            __lcl.00000222     DD     00000001 
                                          DD     __lcl.00000223 
                                          DD     __lcl.00000221 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0013AC            __lcl.00000221     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000218 
                                          DD     __lcl.00000219 
                                          DD     __lcl.00000220 
     0013C8            __lcl.00000220     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0013D4            __lcl.00000219     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0013E0            __lcl.00000218     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000216 
                                          DD     __lcl.00000217 
     0013FC            __lcl.00000217     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001408            __lcl.00000216     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001414            __lcl.00000215     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000213 
                                          DD     __lcl.00000214 
     001430            __lcl.00000214     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     00143C            __lcl.00000213     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001448            __lcl.00000212     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000210 
                                          DD     __lcl.00000211 
     001464            __lcl.00000211     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001470            __lcl.00000210     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00147C            __lcl.00000209     DB     0AH    
                                          DB     'MatrixRizn' 
                                          DB     00H    
     001488            lab2_sepcomp3.modu_f2.matrixrizn__subp_body_subpdesc____1 DD __lcl.00000209 
                                          DD     lab2_sepcomp3.modu_f2.matrixrizn 
                                          DD     __lcl.00000134 
                                          DD     0000002D 
                                          DD     0000002D 
                                          DD     00000036 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000206 
                                          DD     __lcl.00000207 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000208 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000408 
                                          DD     00000030 
                                          DD     __lcl.00000005 
     0014EC            __lcl.00000208     DD     00000001 
                                          DD     __lcl.00000205 
     0014F4            __lcl.00000207     DD     00000001 
                                          DD     __lcl.00000044 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     FFFFFFD4 
                                          DD     00000003 
                                          DD     00000000 
     00150C            __lcl.00000206     DD     00000002 
                                          DD     __lcl.00000028 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000029 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     001540            __lcl.00000205     DB     8 DUP(00) 
                                          DD     __lcl.00000134 
                                          DD     00000030 
                                          DD     00000030 
                                          DD     00000034 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000203 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000204 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     0015A4            __lcl.00000204     DD     00000001 
                                          DD     __lcl.00000202 
     0015AC            __lcl.00000203     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000194 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000001 
     0015C4            __lcl.00000202     DB     8 DUP(00) 
                                          DD     __lcl.00000134 
                                          DD     00000031 
                                          DD     00000031 
                                          DD     00000033 
                                          DD     00000003 
                                          DD     00000004 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000201 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     001628            __lcl.00000201     DD     00000001 
                                          DD     __lcl.00000148 
                                          DD     __lcl.00000200 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     001640            __lcl.00000200     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000197 
                                          DD     __lcl.00000198 
                                          DD     __lcl.00000199 
     00165C            __lcl.00000199     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001668            __lcl.00000198     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001674            __lcl.00000197     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000195 
                                          DD     __lcl.00000196 
     001690            __lcl.00000196     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     00169C            __lcl.00000195     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0016A8            __lcl.00000194     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000191 
                                          DD     __lcl.00000192 
                                          DD     __lcl.00000193 
     0016C4            __lcl.00000193     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0016D0            __lcl.00000192     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0016DC            __lcl.00000191     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000189 
                                          DD     __lcl.00000190 
     0016F8            __lcl.00000190     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001704            __lcl.00000189     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001710            __lcl.00000188     DB     09H    
                                          DB     'MatrixSum' 
                                          DB     00H    
                                          DB     00     
     00171C            lab2_sepcomp3.modu_f2.matrixsum__subp_body_subpdesc____1 DD __lcl.00000188 
                                          DD     lab2_sepcomp3.modu_f2.matrixsum 
                                          DD     __lcl.00000134 
                                          DD     00000021 
                                          DD     00000021 
                                          DD     0000002A 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000185 
                                          DD     __lcl.00000186 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000187 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000409 
                                          DD     00000030 
                                          DD     __lcl.00000005 
     001780            __lcl.00000187     DD     00000001 
                                          DD     __lcl.00000184 
     001788            __lcl.00000186     DD     00000001 
                                          DD     __lcl.00000044 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     FFFFFFD4 
                                          DD     00000003 
                                          DD     00000000 
     0017A0            __lcl.00000185     DD     00000002 
                                          DD     __lcl.00000028 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000029 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0017D4            __lcl.00000184     DB     8 DUP(00) 
                                          DD     __lcl.00000134 
                                          DD     00000024 
                                          DD     00000024 
                                          DD     00000028 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000182 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000183 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     001838            __lcl.00000183     DD     00000001 
                                          DD     __lcl.00000181 
     001840            __lcl.00000182     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000173 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000001 
     001858            __lcl.00000181     DB     8 DUP(00) 
                                          DD     __lcl.00000134 
                                          DD     00000025 
                                          DD     00000025 
                                          DD     00000027 
                                          DD     00000003 
                                          DD     00000004 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000180 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     0018BC            __lcl.00000180     DD     00000001 
                                          DD     __lcl.00000148 
                                          DD     __lcl.00000179 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0018D4            __lcl.00000179     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000176 
                                          DD     __lcl.00000177 
                                          DD     __lcl.00000178 
     0018F0            __lcl.00000178     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0018FC            __lcl.00000177     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001908            __lcl.00000176     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000174 
                                          DD     __lcl.00000175 
     001924            __lcl.00000175     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001930            __lcl.00000174     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00193C            __lcl.00000173     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000170 
                                          DD     __lcl.00000171 
                                          DD     __lcl.00000172 
     001958            __lcl.00000172     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001964            __lcl.00000171     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001970            __lcl.00000170     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000168 
                                          DD     __lcl.00000169 
     00198C            __lcl.00000169     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001998            __lcl.00000168     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0019A4            __lcl.00000167     DB     0AH    
                                          DB     'MatrixMult' 
                                          DB     00H    
     0019B0            lab2_sepcomp3.modu_f2.matrixmult__subp_body_subpdesc____1 DD __lcl.00000167 
                                          DD     lab2_sepcomp3.modu_f2.matrixmult 
                                          DD     __lcl.00000134 
                                          DD     0000000F 
                                          DD     0000000F 
                                          DD     0000001C 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000162 
                                          DD     __lcl.00000163 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000166 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000410 
                                          DD     00000040 
                                          DD     __lcl.00000005 
     001A14            __lcl.00000166     DD     00000001 
                                          DD     __lcl.00000161 
     001A1C            __lcl.00000165     DB     07H    
                                          DB     'RezMatr' 
                                          DB     00H    
                                          DB     00H,00H,00H 
     001A28            __lcl.00000164     DB     01H    
                                          DB     'v'    
                                          DB     00H    
                                          DB     00     
     001A2C            __lcl.00000163     DD     00000002 
                                          DD     __lcl.00000164 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     FFFFFFE8 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000165 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     FFFFFFC4 
                                          DD     00000003 
                                          DD     00000000 
     001A58            __lcl.00000162     DD     00000002 
                                          DD     __lcl.00000071 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000072 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     001A8C            __lcl.00000161     DB     8 DUP(00) 
                                          DD     __lcl.00000134 
                                          DD     00000013 
                                          DD     00000013 
                                          DD     0000001A 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000159 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000160 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     001AF0            __lcl.00000160     DD     00000002 
                                          DD     __lcl.00000149 
                                          DD     __lcl.00000158 
     001AFC            __lcl.00000159     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000140 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     001B14            __lcl.00000158     DB     8 DUP(00) 
                                          DD     __lcl.00000134 
                                          DD     00000017 
                                          DD     00000017 
                                          DD     00000019 
                                          DD     00000003 
                                          DD     00000004 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000156 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     001B78            __lcl.00000157     DB     01H    
                                          DB     'k'    
                                          DB     00H    
                                          DB     00     
     001B7C            __lcl.00000156     DD     00000001 
                                          DD     __lcl.00000157 
                                          DD     __lcl.00000155 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     001B94            __lcl.00000155     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000152 
                                          DD     __lcl.00000153 
                                          DD     __lcl.00000154 
     001BB0            __lcl.00000154     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001BBC            __lcl.00000153     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001BC8            __lcl.00000152     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000150 
                                          DD     __lcl.00000151 
     001BE4            __lcl.00000151     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001BF0            __lcl.00000150     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001BFC            __lcl.00000149     DB     8 DUP(00) 
                                          DD     __lcl.00000134 
                                          DD     00000014 
                                          DD     00000014 
                                          DD     00000016 
                                          DD     00000003 
                                          DD     00000004 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000147 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     001C60            __lcl.00000148     DB     01H    
                                          DB     'j'    
                                          DB     00H    
                                          DB     00     
     001C64            __lcl.00000147     DD     00000001 
                                          DD     __lcl.00000148 
                                          DD     __lcl.00000146 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000001 
     001C7C            __lcl.00000146     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000143 
                                          DD     __lcl.00000144 
                                          DD     __lcl.00000145 
     001C98            __lcl.00000145     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001CA4            __lcl.00000144     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001CB0            __lcl.00000143     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000141 
                                          DD     __lcl.00000142 
     001CCC            __lcl.00000142     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001CD8            __lcl.00000141     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001CE4            __lcl.00000140     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000137 
                                          DD     __lcl.00000138 
                                          DD     __lcl.00000139 
     001D00            __lcl.00000139     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001D0C            __lcl.00000138     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001D18            __lcl.00000137     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000135 
                                          DD     __lcl.00000136 
     001D34            __lcl.00000136     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001D40            __lcl.00000135     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001D4C            __lcl.00000134     DB     1AH    
                                          DB     '..\vector_f1-matrix_f2.adb' 
                                          DB     00H    
     001D68            __lcl.00000133     DB     05H    
                                          DB     'Func2' 
                                          DB     00H    
                                          DB     00     
     001D70            lab2_sepcomp3.modu_f2.func2__subp_body_subpdesc____1 DD __lcl.00000133 
                                          DD     lab2_sepcomp3.modu_f2.func2 
                                          DD     __lcl.00000134 
                                          DD     00000005 
                                          DD     00000005 
                                          DD     0000000B 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000127 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000411 
                                          DD     00000080 
                                          DD     __lcl.00000005 
     001DD4            __lcl.00000132     DB     02H    
                                          DB     'MA'   
                                          DB     00H    
     001DD8            __lcl.00000131     DB     02H    
                                          DB     'MB'   
                                          DB     00H    
     001DDC            __lcl.00000130     DB     02H    
                                          DB     'MC'   
                                          DB     00H    
     001DE0            __lcl.00000129     DB     02H    
                                          DB     'MM'   
                                          DB     00H    
     001DE4            __lcl.00000128     DB     02H    
                                          DB     'MD'   
                                          DB     00H    
     001DE8            __lcl.00000127     DD     00000005 
                                          DD     __lcl.00000128 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     00000018 
                                          DD     00000101 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000129 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     00000014 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000130 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000131 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000132 
                                          DD     lab2_sepcomp3.modu_f2.matrix__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     001E64            __lcl.00000124     DB     06H    
                                          DB     'Matrix' 
                                          DB     00H    
     001E6C            lab2_sepcomp3.modu_f2.matrix__typeform DD __lcl.00000124 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000123 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     __lcl.00000122 
     001E84            __lcl.00000123     DD     00000008 
                                          DD     00000003 
                                          DD     0000000C 
     001E90            __lcl.00000122     DD     00000001 
                                          DD     __lcl.00000121 
     001E98            __lcl.00000121     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000009 
                                          DD     __lcl.00000119 
                                          DD     __lcl.00000120 
     001EB4            __lcl.00000120     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001EC0            __lcl.00000119     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001ECC            __lcl.00000118     DB     0CH    
                                          DB     'MultiplyStep' 
                                          DB     00H    
                                          DW     0000   
     001EDC            lab2_sepcomp3.modu.multiplystep__subp_body_subpdesc____1 DD __lcl.00000118 
                                          DD     lab2_sepcomp3.modu.multiplystep 
                                          DD     __lcl.00000026 
                                          DD     0000005E 
                                          DD     0000005E 
                                          DD     00000065 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000009 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000115 
                                          DD     __lcl.00000116 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000117 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000412 
                                          DD     0000000C 
                                          DD     __lcl.00000005 
     001F40            __lcl.00000117     DD     00000001 
                                          DD     __lcl.00000114 
     001F48            __lcl.00000116     DD     00000001 
                                          DD     __lcl.00000074 
                                          DD     __lcl.00000009 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000000 
     001F60            __lcl.00000115     DD     00000002 
                                          DD     __lcl.00000071 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000072 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     001F94            __lcl.00000114     DB     8 DUP(00) 
                                          DD     __lcl.00000026 
                                          DD     00000061 
                                          DD     00000061 
                                          DD     00000063 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000113 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     001FF8            __lcl.00000113     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000112 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     002010            __lcl.00000112     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000109 
                                          DD     __lcl.00000110 
                                          DD     __lcl.00000111 
     00202C            __lcl.00000111     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002038            __lcl.00000110     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002044            __lcl.00000109     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000107 
                                          DD     __lcl.00000108 
     002060            __lcl.00000108     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     00206C            __lcl.00000107     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002078            __lcl.00000106     DB     05H    
                                          DB     'Func1' 
                                          DB     00H    
                                          DB     00     
     002080            lab2_sepcomp3.modu.func1__subp_body_subpdesc____1 DD __lcl.00000106 
                                          DD     lab2_sepcomp3.modu.func1 
                                          DD     __lcl.00000026 
                                          DD     00000056 
                                          DD     00000056 
                                          DD     0000005C 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000104 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000413 
                                          DD     00000038 
                                          DD     __lcl.00000005 
     0020E4            __lcl.00000105     DB     01H    
                                          DB     'd'    
                                          DB     00H    
                                          DB     00     
     0020E8            __lcl.00000104     DD     00000005 
                                          DD     __lcl.00000098 
                                          DD     __lcl.00000009 
                                          DD     00000018 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000105 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     00000014 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000044 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000028 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000029 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     00000008 
                                          DD     00000101 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     002164            __lcl.00000101     DB     0CH    
                                          DB     'multiVectNum' 
                                          DB     00H    
                                          DW     0000   
     002174            lab2_sepcomp3.modu.multivectnum__subp_body_subpdesc____1 DD __lcl.00000101 
                                          DD     lab2_sepcomp3.modu.multivectnum 
                                          DD     __lcl.00000026 
                                          DD     00000049 
                                          DD     00000049 
                                          DD     00000050 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000097 
                                          DD     __lcl.00000099 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000100 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000414 
                                          DD     00000014 
                                          DD     __lcl.00000005 
     0021D8            __lcl.00000100     DD     00000001 
                                          DD     __lcl.00000096 
     0021E0            __lcl.00000099     DD     00000001 
                                          DD     __lcl.00000074 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     FFFFFFF0 
                                          DD     00000003 
                                          DD     00000000 
     0021F8            __lcl.00000098     DB     01H    
                                          DB     'e'    
                                          DB     00H    
                                          DB     00     
     0021FC            __lcl.00000097     DD     00000002 
                                          DD     __lcl.00000098 
                                          DD     __lcl.00000009 
                                          DD     00000010 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000072 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     002230            __lcl.00000096     DB     8 DUP(00) 
                                          DD     __lcl.00000026 
                                          DD     0000004C 
                                          DD     0000004C 
                                          DD     0000004E 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000095 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     002294            __lcl.00000095     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000094 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0022AC            __lcl.00000094     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000091 
                                          DD     __lcl.00000092 
                                          DD     __lcl.00000093 
     0022C8            __lcl.00000093     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0022D4            __lcl.00000092     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0022E0            __lcl.00000091     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000089 
                                          DD     __lcl.00000090 
     0022FC            __lcl.00000090     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002308            __lcl.00000089     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002314            __lcl.00000088     DB     09H    
                                          DB     'MinusVect' 
                                          DB     00H    
                                          DB     00     
     002320            lab2_sepcomp3.modu.minusvect__subp_body_subpdesc____1 DD __lcl.00000088 
                                          DD     lab2_sepcomp3.modu.minusvect 
                                          DD     __lcl.00000026 
                                          DD     00000040 
                                          DD     00000040 
                                          DD     00000047 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000085 
                                          DD     __lcl.00000086 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000087 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000415 
                                          DD     00000014 
                                          DD     __lcl.00000005 
     002384            __lcl.00000087     DD     00000001 
                                          DD     __lcl.00000084 
     00238C            __lcl.00000086     DD     00000001 
                                          DD     __lcl.00000074 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     FFFFFFF0 
                                          DD     00000003 
                                          DD     00000000 
     0023A4            __lcl.00000085     DD     00000002 
                                          DD     __lcl.00000071 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000072 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0023D8            __lcl.00000084     DB     8 DUP(00) 
                                          DD     __lcl.00000026 
                                          DD     00000043 
                                          DD     00000043 
                                          DD     00000045 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000083 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     00243C            __lcl.00000083     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000082 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     002454            __lcl.00000082     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000079 
                                          DD     __lcl.00000080 
                                          DD     __lcl.00000081 
     002470            __lcl.00000081     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     00247C            __lcl.00000080     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002488            __lcl.00000079     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000077 
                                          DD     __lcl.00000078 
     0024A4            __lcl.00000078     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0024B0            __lcl.00000077     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0024BC            __lcl.00000076     DB     08H    
                                          DB     'PlusVect' 
                                          DB     00H    
                                          DW     0000   
     0024C8            lab2_sepcomp3.modu.plusvect__subp_body_subpdesc____1 DD __lcl.00000076 
                                          DD     lab2_sepcomp3.modu.plusvect 
                                          DD     __lcl.00000026 
                                          DD     00000037 
                                          DD     00000037 
                                          DD     0000003E 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000070 
                                          DD     __lcl.00000073 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000075 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000416 
                                          DD     00000014 
                                          DD     __lcl.00000005 
     00252C            __lcl.00000075     DD     00000001 
                                          DD     __lcl.00000069 
     002534            __lcl.00000074     DB     03H    
                                          DB     'Rez'  
                                          DB     00H    
                                          DB     00H,00H,00H 
     00253C            __lcl.00000073     DD     00000001 
                                          DD     __lcl.00000074 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     FFFFFFF0 
                                          DD     00000003 
                                          DD     00000000 
     002554            __lcl.00000072     DB     01H    
                                          DB     'A'    
                                          DB     00H    
                                          DB     00     
     002558            __lcl.00000071     DB     01H    
                                          DB     'B'    
                                          DB     00H    
                                          DB     00     
     00255C            __lcl.00000070     DD     00000002 
                                          DD     __lcl.00000071 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000072 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     002590            __lcl.00000069     DB     8 DUP(00) 
                                          DD     __lcl.00000026 
                                          DD     0000003A 
                                          DD     0000003A 
                                          DD     0000003C 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000068 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     0025F4            __lcl.00000068     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000067 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     00260C            __lcl.00000067     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000064 
                                          DD     __lcl.00000065 
                                          DD     __lcl.00000066 
     002628            __lcl.00000066     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002634            __lcl.00000065     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002640            __lcl.00000064     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000062 
                                          DD     __lcl.00000063 
     00265C            __lcl.00000063     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002668            __lcl.00000062     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002674            __lcl.00000061     DB     08H    
                                          DB     'VectSort' 
                                          DB     00H    
                                          DW     0000   
     002680            lab2_sepcomp3.modu.vectsort__subp_body_subpdesc____1 DD __lcl.00000061 
                                          DD     lab2_sepcomp3.modu.vectsort 
                                          DD     __lcl.00000026 
                                          DD     00000026 
                                          DD     00000026 
                                          DD     00000035 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000056 
                                          DD     __lcl.00000057 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000060 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000417 
                                          DD     0000000C 
                                          DD     __lcl.00000005 
     0026E4            __lcl.00000060     DD     00000001 
                                          DD     __lcl.00000055 
     0026EC            __lcl.00000059     DB     04H    
                                          DB     'flag' 
                                          DB     00H    
                                          DW     0000   
     0026F4            __lcl.00000058     DB     04H    
                                          DB     'help' 
                                          DB     00H    
                                          DW     0000   
     0026FC            __lcl.00000057     DD     00000002 
                                          DD     __lcl.00000058 
                                          DD     __lcl.00000009 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000059 
                                          DD     __lcl.00000047 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000000 
     002728            __lcl.00000056     DD     00000001 
                                          DD     __lcl.00000029 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     00000008 
                                          DD     00000102 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     002744            __lcl.00000055     DB     8 DUP(00) 
                                          DD     __lcl.00000026 
                                          DD     0000002C 
                                          DD     0000002C 
                                          DD     00000033 
                                          DD     00000003 
                                          DD     00000004 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000054 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     0027A8            __lcl.00000054     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000053 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000001 
     0027C0            __lcl.00000053     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000050 
                                          DD     __lcl.00000051 
                                          DD     __lcl.00000052 
     0027DC            __lcl.00000052     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0027E8            __lcl.00000051     DD     00000008 
                                          DD     00000003 
                                          DD     00000002 
     0027F4            __lcl.00000050     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000048 
                                          DD     __lcl.00000049 
     002810            __lcl.00000049     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     00281C            __lcl.00000048     DD     00000008 
                                          DD     00000003 
                                          DD     00000002 
     002828            __lcl.00000047     DB     4 DUP(00) 
                                          DD     00000001 
                                          DD     00000002 
     002834            __lcl.00000046     DB     07H    
                                          DB     'VectSum' 
                                          DB     00H    
                                          DB     00H,00H,00H 
     002840            lab2_sepcomp3.modu.vectsum__subp_body_subpdesc____1 DD __lcl.00000046 
                                          DD     lab2_sepcomp3.modu.vectsum 
                                          DD     __lcl.00000026 
                                          DD     0000001C 
                                          DD     0000001C 
                                          DD     00000023 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000042 
                                          DD     __lcl.00000043 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000045 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000418 
                                          DD     00000014 
                                          DD     __lcl.00000005 
     0028A4            __lcl.00000045     DD     00000001 
                                          DD     __lcl.00000041 
     0028AC            __lcl.00000044     DB     01H    
                                          DB     'c'    
                                          DB     00H    
                                          DB     00     
     0028B0            __lcl.00000043     DD     00000001 
                                          DD     __lcl.00000044 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     FFFFFFF0 
                                          DD     00000003 
                                          DD     00000000 
     0028C8            __lcl.00000042     DD     00000002 
                                          DD     __lcl.00000028 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000029 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0028FC            __lcl.00000041     DB     8 DUP(00) 
                                          DD     __lcl.00000026 
                                          DD     0000001F 
                                          DD     0000001F 
                                          DD     00000021 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000040 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     002960            __lcl.00000040     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000039 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     002978            __lcl.00000039     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000036 
                                          DD     __lcl.00000037 
                                          DD     __lcl.00000038 
     002994            __lcl.00000038     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0029A0            __lcl.00000037     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0029AC            __lcl.00000036     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000034 
                                          DD     __lcl.00000035 
     0029C8            __lcl.00000035     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0029D4            __lcl.00000034     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0029E0            __lcl.00000033     DB     08H    
                                          DB     'VectMult' 
                                          DB     00H    
                                          DW     0000   
     0029EC            lab2_sepcomp3.modu.vectmult__subp_body_subpdesc____1 DD __lcl.00000033 
                                          DD     lab2_sepcomp3.modu.vectmult 
                                          DD     __lcl.00000026 
                                          DD     00000011 
                                          DD     00000011 
                                          DD     00000019 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000009 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000030 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000032 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000419 
                                          DD     0000000C 
                                          DD     __lcl.00000005 
     002A50            __lcl.00000032     DD     00000001 
                                          DD     __lcl.00000025 
     002A58            __lcl.00000031     DB     03H    
                                          DB     'sum'  
                                          DB     00H    
                                          DB     00H,00H,00H 
     002A60            __lcl.00000030     DD     00000001 
                                          DD     __lcl.00000031 
                                          DD     __lcl.00000009 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000000 
     002A78            __lcl.00000029     DB     01H    
                                          DB     'a'    
                                          DB     00H    
                                          DB     00     
     002A7C            __lcl.00000028     DB     01H    
                                          DB     'b'    
                                          DB     00H    
                                          DB     00     
     002A80            __lcl.00000027     DD     00000002 
                                          DD     __lcl.00000028 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000029 
                                          DD     lab2_sepcomp3.modu.vector__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     002AB4            __lcl.00000026     DB     10H    
                                          DB     '..\vector_f1.adb' 
                                          DB     00H    
                                          DW     0000   
     002AC8            __lcl.00000025     DB     8 DUP(00) 
                                          DD     __lcl.00000026 
                                          DD     00000015 
                                          DD     00000015 
                                          DD     00000017 
                                          DD     00000003 
                                          DD     00000003 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000023 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000005 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000005 
     002B2C            __lcl.00000024     DB     01H    
                                          DB     'i'    
                                          DB     00H    
                                          DB     00     
     002B30            __lcl.00000023     DD     00000001 
                                          DD     __lcl.00000024 
                                          DD     __lcl.00000022 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     002B48            __lcl.00000022     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000019 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000021 
     002B64            __lcl.00000021     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002B70            __lcl.00000020     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002B7C            __lcl.00000019     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000017 
                                          DD     __lcl.00000018 
     002B98            __lcl.00000018     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002BA4            __lcl.00000017     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002BB0            __lcl.00000016     DB     06H    
                                          DB     'Vector' 
                                          DB     00H    
     002BB8            lab2_sepcomp3.modu.vector__typeform DD __lcl.00000016 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000015 
                                          DD     __lcl.00000009 
                                          DD     __lcl.00000014 
     002BD0            __lcl.00000015     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     002BDC            __lcl.00000014     DD     00000001 
                                          DD     __lcl.00000013 
     002BE4            __lcl.00000013     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000009 
                                          DD     __lcl.00000011 
                                          DD     __lcl.00000012 
     002C00            __lcl.00000012     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002C0C            __lcl.00000011     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002C18            __lcl.00000010     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002C24            __lcl.00000009     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000006 
                                          DD     __lcl.00000007 
                                          DD     __lcl.00000008 
     002C40            __lcl.00000008     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     002C4C            __lcl.00000007     DD     00000008 
                                          DD     00000003 
                                          DD     80000000 
     002C58            __lcl.00000006     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     002C64            __lcl.00000005     DD     00000000 
; ********* End of segment, Total Size = 11368


; ************* .av_dbgi segment :
                                          ALIGN 4       
     002C68            __lcl.00000424     DB     3E     
                                          DB     'D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\lab2_sepcomp3.ad' 
                                          DB     'b'    
                                          DB     00H    
     002CA8            __lcl.00000423     DB     48     
                                          DB     'D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix' 
                                          DB     '_f2-fio.adb' 
                                          DB     00H    
     002CF2            __lcl.00000422     DB     47     
                                          DB     'D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix' 
                                          DB     '_f2-f3.adb' 
                                          DB     00H    
     002D3B            __lcl.00000421     DB     44     
                                          DB     'D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix' 
                                          DB     '_f2.adb' 
                                          DB     00H    
     002D81            __lcl.00000420     DB     3A     
                                          DB     'D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb' 
                                          DB     00H    
; ********* End of segment, Total Size = 11709

                       ;                                
                       CODE               ENDS          

