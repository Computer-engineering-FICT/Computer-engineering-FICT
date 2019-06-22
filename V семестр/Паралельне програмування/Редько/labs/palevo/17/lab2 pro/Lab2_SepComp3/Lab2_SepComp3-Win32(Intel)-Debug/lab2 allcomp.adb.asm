
                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT Lab2_ALLComp 
                       ;                                
                       Listing of Generated Code        
                       ;                                
                       EXCEP              RECORD FLAG:1, SPSAV:1, IPCOUNT:6 
                       ;                                
                       CODE               SEGMENT PUBLIC BYTE 'CODE' USE32 ;  Lab2_ALLComp
                                          ASSUME CS:CODE 
                       ;                                
                       ;  Start of procedure lab2_allcomp.modu.vectmult   
                       ;                                
                                          PUBLIC lab2_allcomp.modu.vectmult 
                       lab2_allcomp.modu.vectmult PROC NEAR 
;  Source Line # 22  (Inline # 17 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC0C                      SUB    ESP, 12 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078E500                    CMP    BYTE PTR [EAX-27], 0 ;  VectMult__elab_bool
   22|                 L44:                             
   22| 000017 7441                        JE     SHORT L45 
;  Source Line # 22  (Inline # 20 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000019 C745F800000000              MOV    DWORD PTR [EBP-8], 0 ;  sum
;  Source Line # 22  (Inline # 21 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000020 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 22 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000027 8B4508                      MOV    EAX, [EBP+8] ;  a
   22| 00002A 8B5DFC                      MOV    EBX, [EBP-4] 
   22| 00002D 8B4D0C                      MOV    ECX, [EBP+12] ;  b
   22| 000030 8B55FC                      MOV    EDX, [EBP-4] 
   22| 000033 8B7498FC                    MOV    ESI, [EAX+4*EBX-4] 
   22| 000037 0FAF7491FC                  IMUL   ESI, [ECX+4*EDX-4] 
   22| 00003C CE                          INTO          
   22| 00003D 0375F8                      ADD    ESI, [EBP-8] ;  sum
   22| 000040 CE                          INTO          
   22| 000041 8975F8                      MOV    [EBP-8], ESI ;  sum
;  Source Line # 22  (Inline # 23 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000044 8B7DFC                      MOV    EDI, [EBP-4] 
   22| 000047 47                          INC    EDI    
   22| 000048 897DFC                      MOV    [EBP-4], EDI 
   22| 00004B 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 00004F 7ED6                        JLE    SHORT L43 
;  Source Line # 22  (Inline # 24 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000051 8B45F8                      MOV    EAX, [EBP-8] ;  sum
   22| 000054 8BE5                        MOV    ESP, EBP 
   22| 000056 5D                          POP    EBP    
   22| 000057 C20800                      RET    8      
   22|                 L45:                             
   22| 00005A F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu.vectmult ENDP  


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
                       ;  Start of procedure lab2_allcomp.modu.vectsum   
                       ;                                
                                          PUBLIC lab2_allcomp.modu.vectsum 
                       lab2_allcomp.modu.vectsum PROC NEAR 
;  Source Line # 22  (Inline # 28 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC14                      SUB    ESP, 20 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078E600                    CMP    BYTE PTR [EAX-26], 0 ;  VectSum__elab_bool
   22|                 L44:                             
   22| 000017 7446                        JE     SHORT L45 
;  Source Line # 22  (Inline # 31 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000019 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 32 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000020 8B450C                      MOV    EAX, [EBP+12] ;  a
   22| 000023 8B5DFC                      MOV    EBX, [EBP-4] 
   22| 000026 8B4D10                      MOV    ECX, [EBP+16] ;  b
   22| 000029 8B55FC                      MOV    EDX, [EBP-4] 
   22| 00002C 8B7498FC                    MOV    ESI, [EAX+4*EBX-4] 
   22| 000030 037491FC                    ADD    ESI, [ECX+4*EDX-4] 
   22| 000034 CE                          INTO          
   22| 000035 8B7DFC                      MOV    EDI, [EBP-4] 
   22| 000038 8974BDEC                    MOV    [EBP+4*EDI-20], ESI ;  c
;  Source Line # 22  (Inline # 33 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 00003C 8B45FC                      MOV    EAX, [EBP-4] 
   22| 00003F 40                          INC    EAX    
   22| 000040 8945FC                      MOV    [EBP-4], EAX 
   22| 000043 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 000047 7ED7                        JLE    SHORT L43 
;  Source Line # 22  (Inline # 34 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000049 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   22| 00004C 8D75F0                      LEA    ESI, [EBP-16] ;  c
   22| 00004F 8D38                        LEA    EDI, [EAX+0] 
   22| 000051 A5                          MOVSD         
   22| 000052 A5                          MOVSD         
   22| 000053 A5                          MOVSD         
   22| 000054 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   22| 000057 8BC3                        MOV    EAX, EBX 
   22| 000059 8BE5                        MOV    ESP, EBP 
   22| 00005B 5D                          POP    EBP    
   22| 00005C C20C00                      RET    12     
   22|                 L45:                             
   22| 00005F F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu.vectsum ENDP   

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
                       ;  Start of procedure lab2_allcomp.modu.vectsort   
                       ;                                
                                          PUBLIC lab2_allcomp.modu.vectsort 
                       lab2_allcomp.modu.vectsort PROC NEAR 
;  Source Line # 22  (Inline # 38 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC0C                      SUB    ESP, 12 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078E700                    CMP    BYTE PTR [EAX-25], 0 ;  VectSort__elab_bool
   22|                 L48:                             
   22| 000017 7476                        JE     SHORT L49 
;  Source Line # 22  (Inline # 39 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000019 C645FC01                    MOV    BYTE PTR [EBP-4], 1 ;  flag
;  Source Line # 22  (Inline # 42 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 00001D 807DFC00                    CMP    BYTE PTR [EBP-4], 0 ;  flag
   22| 000021 7466                        JE     SHORT L40 
   22|                 L41:                             
;  Source Line # 22  (Inline # 43 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000023 C645FC00                    MOV    BYTE PTR [EBP-4], 0 ;  flag
;  Source Line # 22  (Inline # 44 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000027 C745F802000000              MOV    DWORD PTR [EBP-8], 2 
   22|                 L45:                             
;  Source Line # 22  (Inline # 45 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 00002E 8B4508                      MOV    EAX, [EBP+8] ;  a
   22| 000031 8B5DF8                      MOV    EBX, [EBP-8] 
   22| 000034 8B4D08                      MOV    ECX, [EBP+8] ;  a
   22| 000037 8B55F8                      MOV    EDX, [EBP-8] 
   22| 00003A 8B7491FC                    MOV    ESI, [ECX+4*EDX-4] 
   22| 00003E 397498F8                    CMP    [EAX+4*EBX-8], ESI 
   22| 000042 7D32                        JGE    SHORT L46 
;  Source Line # 22  (Inline # 46 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000044 8B4508                      MOV    EAX, [EBP+8] ;  a
   22| 000047 8B5DF8                      MOV    EBX, [EBP-8] 
   22| 00004A 8B4C98F8                    MOV    ECX, [EAX+4*EBX-8] 
   22| 00004E 894DF4                      MOV    [EBP-12], ECX ;  help
;  Source Line # 22  (Inline # 47 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000051 8B5508                      MOV    EDX, [EBP+8] ;  a
   22| 000054 8B75F8                      MOV    ESI, [EBP-8] 
   22| 000057 8B7D08                      MOV    EDI, [EBP+8] ;  a
   22| 00005A 8B45F8                      MOV    EAX, [EBP-8] 
   22| 00005D 8B5CB2FC                    MOV    EBX, [EDX+4*ESI-4] 
   22| 000061 895C87F8                    MOV    [EDI+4*EAX-8], EBX 
;  Source Line # 22  (Inline # 48 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000065 8B4D08                      MOV    ECX, [EBP+8] ;  a
   22| 000068 8B55F8                      MOV    EDX, [EBP-8] 
   22| 00006B 8B75F4                      MOV    ESI, [EBP-12] ;  help
   22| 00006E 897491FC                    MOV    [ECX+4*EDX-4], ESI 
;  Source Line # 22  (Inline # 49 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000072 C645FC01                    MOV    BYTE PTR [EBP-4], 1 ;  flag
;  Source Line # 22  (Inline # 50 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22|                 L46:                             
;  Source Line # 22  (Inline # 51 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000076 8B45F8                      MOV    EAX, [EBP-8] 
   22| 000079 40                          INC    EAX    
   22| 00007A 8945F8                      MOV    [EBP-8], EAX 
   22| 00007D 837DF803                    CMP    DWORD PTR [EBP-8], 3 
   22| 000081 7EAB                        JLE    SHORT L45 
;  Source Line # 22  (Inline # 52 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000083 807DFC00                    CMP    BYTE PTR [EBP-4], 0 ;  flag
   22| 000087 759A                        JNE    SHORT L41 
   22|                 L40:                             
   22| 000089 8BE5                        MOV    ESP, EBP 
   22| 00008B 5D                          POP    EBP    
   22| 00008C C20400                      RET    4      
   22|                 L49:                             
   22| 00008F F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu.vectsort ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu.plusvect   
                       ;                                
                                          PUBLIC lab2_allcomp.modu.plusvect 
                       lab2_allcomp.modu.plusvect PROC NEAR 
;  Source Line # 22  (Inline # 55 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC14                      SUB    ESP, 20 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078E800                    CMP    BYTE PTR [EAX-24], 0 ;  PlusVect__elab_bool
   22|                 L44:                             
   22| 000017 7446                        JE     SHORT L45 
;  Source Line # 22  (Inline # 58 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000019 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 59 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000020 8B450C                      MOV    EAX, [EBP+12] ;  A
   22| 000023 8B5DFC                      MOV    EBX, [EBP-4] 
   22| 000026 8B4D10                      MOV    ECX, [EBP+16] ;  B
   22| 000029 8B55FC                      MOV    EDX, [EBP-4] 
   22| 00002C 8B7498FC                    MOV    ESI, [EAX+4*EBX-4] 
   22| 000030 037491FC                    ADD    ESI, [ECX+4*EDX-4] 
   22| 000034 CE                          INTO          
   22| 000035 8B7DFC                      MOV    EDI, [EBP-4] 
   22| 000038 8974BDEC                    MOV    [EBP+4*EDI-20], ESI ;  Rez
;  Source Line # 22  (Inline # 60 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 00003C 8B45FC                      MOV    EAX, [EBP-4] 
   22| 00003F 40                          INC    EAX    
   22| 000040 8945FC                      MOV    [EBP-4], EAX 
   22| 000043 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 000047 7ED7                        JLE    SHORT L43 
;  Source Line # 22  (Inline # 61 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000049 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   22| 00004C 8D75F0                      LEA    ESI, [EBP-16] ;  Rez
   22| 00004F 8D38                        LEA    EDI, [EAX+0] 
   22| 000051 A5                          MOVSD         
   22| 000052 A5                          MOVSD         
   22| 000053 A5                          MOVSD         
   22| 000054 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   22| 000057 8BC3                        MOV    EAX, EBX 
   22| 000059 8BE5                        MOV    ESP, EBP 
   22| 00005B 5D                          POP    EBP    
   22| 00005C C20C00                      RET    12     
   22|                 L45:                             
   22| 00005F F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu.plusvect ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu.minusvect   
                       ;                                
                                          PUBLIC lab2_allcomp.modu.minusvect 
                       lab2_allcomp.modu.minusvect PROC NEAR 
;  Source Line # 22  (Inline # 64 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC14                      SUB    ESP, 20 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078E900                    CMP    BYTE PTR [EAX-23], 0 ;  MinusVect__elab_bool
   22|                 L44:                             
   22| 000017 7446                        JE     SHORT L45 
;  Source Line # 22  (Inline # 67 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000019 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 68 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000020 8B450C                      MOV    EAX, [EBP+12] ;  A
   22| 000023 8B5DFC                      MOV    EBX, [EBP-4] 
   22| 000026 8B4D10                      MOV    ECX, [EBP+16] ;  B
   22| 000029 8B55FC                      MOV    EDX, [EBP-4] 
   22| 00002C 8B7498FC                    MOV    ESI, [EAX+4*EBX-4] 
   22| 000030 2B7491FC                    SUB    ESI, [ECX+4*EDX-4] 
   22| 000034 CE                          INTO          
   22| 000035 8B7DFC                      MOV    EDI, [EBP-4] 
   22| 000038 8974BDEC                    MOV    [EBP+4*EDI-20], ESI ;  Rez
;  Source Line # 22  (Inline # 69 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 00003C 8B45FC                      MOV    EAX, [EBP-4] 
   22| 00003F 40                          INC    EAX    
   22| 000040 8945FC                      MOV    [EBP-4], EAX 
   22| 000043 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 000047 7ED7                        JLE    SHORT L43 
;  Source Line # 22  (Inline # 70 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000049 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   22| 00004C 8D75F0                      LEA    ESI, [EBP-16] ;  Rez
   22| 00004F 8D38                        LEA    EDI, [EAX+0] 
   22| 000051 A5                          MOVSD         
   22| 000052 A5                          MOVSD         
   22| 000053 A5                          MOVSD         
   22| 000054 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   22| 000057 8BC3                        MOV    EAX, EBX 
   22| 000059 8BE5                        MOV    ESP, EBP 
   22| 00005B 5D                          POP    EBP    
   22| 00005C C20C00                      RET    12     
   22|                 L45:                             
   22| 00005F F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu.minusvect ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu.multivectnum   
                       ;                                
                                          PUBLIC lab2_allcomp.modu.multivectnum 
                       lab2_allcomp.modu.multivectnum PROC NEAR 
;  Source Line # 22  (Inline # 73 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC14                      SUB    ESP, 20 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078EA00                    CMP    BYTE PTR [EAX-22], 0 ;  multiVectNum__elab_bool
   22|                 L44:                             
   22| 000017 7440                        JE     SHORT L45 
;  Source Line # 22  (Inline # 76 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000019 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 77 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000020 8B450C                      MOV    EAX, [EBP+12] ;  A
   22| 000023 8B5DFC                      MOV    EBX, [EBP-4] 
   22| 000026 8B4C98FC                    MOV    ECX, [EAX+4*EBX-4] 
   22| 00002A 0FAF4D10                    IMUL   ECX, [EBP+16] ;  e
   22| 00002E CE                          INTO          
   22| 00002F 8B55FC                      MOV    EDX, [EBP-4] 
   22| 000032 894C95EC                    MOV    [EBP+4*EDX-20], ECX ;  Rez
;  Source Line # 22  (Inline # 78 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000036 8B75FC                      MOV    ESI, [EBP-4] 
   22| 000039 46                          INC    ESI    
   22| 00003A 8975FC                      MOV    [EBP-4], ESI 
   22| 00003D 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 000041 7EDD                        JLE    SHORT L43 
;  Source Line # 22  (Inline # 79 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000043 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   22| 000046 8D75F0                      LEA    ESI, [EBP-16] ;  Rez
   22| 000049 8D38                        LEA    EDI, [EAX+0] 
   22| 00004B A5                          MOVSD         
   22| 00004C A5                          MOVSD         
   22| 00004D A5                          MOVSD         
   22| 00004E 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   22| 000051 8BC3                        MOV    EAX, EBX 
   22| 000053 8BE5                        MOV    ESP, EBP 
   22| 000055 5D                          POP    EBP    
   22| 000056 C20C00                      RET    12     
   22|                 L45:                             
   22| 000059 F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu.multivectnum ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu.func1   
                       ;                                
                                          PUBLIC lab2_allcomp.modu.func1 
                       lab2_allcomp.modu.func1 PROC NEAR 
;  Source Line # 22  (Inline # 86 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC38                      SUB    ESP, 56 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078E400                    CMP    BYTE PTR [EAX-28], 0 ;  Func1__elab_bool
   22|                 L42:                             
   22| 000017 7470                        JE     SHORT L43 
   22| 000019 8B02                        MOV    EAX, [EDX+0] 
   22| 00001B 8945D0                      MOV    [EBP-48], EAX 
;  Source Line # 22  (Inline # 88 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 00001E FF7518                      PUSH   DWORD PTR [EBP+24] ;  e
   22| 000021 8B5D14                      MOV    EBX, [EBP+20] ;  d
   22| 000024 53                          PUSH   EBX    
   22| 000025 8D4DEC                      LEA    ECX, [EBP-20] 
   22| 000028 51                          PUSH   ECX    
   22| 000029 E800000000                  CALL   lab2_allcomp.modu.multivectnum 
   22| 00002E 50                          PUSH   EAX    
   22| 00002F 8B7510                      MOV    ESI, [EBP+16] ;  c
   22| 000032 56                          PUSH   ESI    
   22| 000033 8B7D0C                      MOV    EDI, [EBP+12] ;  b
   22| 000036 57                          PUSH   EDI    
   22| 000037 8D55E0                      LEA    EDX, [EBP-32] 
   22| 00003A 52                          PUSH   EDX    
   22| 00003B E800000000                  CALL   lab2_allcomp.modu.plusvect 
   22| 000040 50                          PUSH   EAX    
   22| 000041 8D5DD4                      LEA    EBX, [EBP-44] 
   22| 000044 53                          PUSH   EBX    
   22| 000045 E800000000                  CALL   lab2_allcomp.modu.minusvect 
   22| 00004A 8B4D08                      MOV    ECX, [EBP+8] ;  a
   22| 00004D 8D30                        LEA    ESI, [EAX+0] 
   22| 00004F 8D39                        LEA    EDI, [ECX+0] 
   22| 000051 A5                          MOVSD         
   22| 000052 A5                          MOVSD         
   22| 000053 A5                          MOVSD         
;  Source Line # 22  (Inline # 89 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22|                 L41:                             
   22|                 L10:                             
   22|                 L40:                             
   22| 000054 8BE5                        MOV    ESP, EBP 
   22| 000056 5D                          POP    EBP    
   22| 000057 C21400                      RET    20     
;  Source Line # 22  (Inline # 89 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
;  Source Line # 22  (Inline # 90 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 00005A 8945F8                      MOV    [EBP-8], EAX 
;  Source Line # 22  (Inline # 91 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 00005D 6A00                        PUSH   0      
   22| 00005F 8D5DD0                      LEA    EBX, [EBP-48] 
   22| 000062 53                          PUSH   EBX    
   22| 000063 8B4DF8                      MOV    ECX, [EBP-8] 
   22| 000066 51                          PUSH   ECX    
   22| 000067 E800000000                  CALL   rts_ss_copy_exception_and_rlse 
   22| 00006C 8945FC                      MOV    [EBP-4], EAX 
   22| 00006F 6800000000                  PUSH   __lcl.00000099 
   22| 000074 6800000000                  PUSH   __lcl.00000098 
   22| 000079 E800000000                  CALL   ada.text_io.put__4 
   22| 00007E 8D55D0                      LEA    EDX, [EBP-48] 
   22| 000081 52                          PUSH   EDX    
   22| 000082 E800000000                  CALL   rts_ss_release 
   22| 000087 EBCB                        JMP    SHORT L40 
   22|                 L43:                             
   22| 000089 F6F4                        DIV    AH     
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
                       lab2_allcomp.modu.func1 ENDP     

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
                       ;  Start of procedure lab2_allcomp.modu.multiplystep   
                       ;                                
                                          PUBLIC lab2_allcomp.modu.multiplystep 
                       lab2_allcomp.modu.multiplystep PROC NEAR 
;  Source Line # 22  (Inline # 94 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC0C                      SUB    ESP, 12 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078EB00                    CMP    BYTE PTR [EAX-21], 0 ;  MultiplyStep__elab_bool
   22|                 L44:                             
   22| 000017 7441                        JE     SHORT L45 
;  Source Line # 22  (Inline # 95 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000019 C745F800000000              MOV    DWORD PTR [EBP-8], 0 ;  Rez
;  Source Line # 22  (Inline # 97 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000020 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 98 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000027 8B4508                      MOV    EAX, [EBP+8] ;  A
   22| 00002A 8B5DFC                      MOV    EBX, [EBP-4] 
   22| 00002D 8B4D0C                      MOV    ECX, [EBP+12] ;  B
   22| 000030 8B55FC                      MOV    EDX, [EBP-4] 
   22| 000033 8B7498FC                    MOV    ESI, [EAX+4*EBX-4] 
   22| 000037 0FAF7491FC                  IMUL   ESI, [ECX+4*EDX-4] 
   22| 00003C CE                          INTO          
   22| 00003D 0375F8                      ADD    ESI, [EBP-8] ;  Rez
   22| 000040 CE                          INTO          
   22| 000041 8975F8                      MOV    [EBP-8], ESI ;  Rez
;  Source Line # 22  (Inline # 99 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000044 8B7DFC                      MOV    EDI, [EBP-4] 
   22| 000047 47                          INC    EDI    
   22| 000048 897DFC                      MOV    [EBP-4], EDI 
   22| 00004B 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 00004F 7ED6                        JLE    SHORT L43 
;  Source Line # 22  (Inline # 100 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   22| 000051 8B45F8                      MOV    EAX, [EBP-8] ;  Rez
   22| 000054 8BE5                        MOV    ESP, EBP 
   22| 000056 5D                          POP    EBP    
   22| 000057 C20800                      RET    8      
   22|                 L45:                             
   22| 00005A F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu.multiplystep ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu_f2.func2   
                       ;                                
                                          PUBLIC lab2_allcomp.modu_f2.func2 
                       lab2_allcomp.modu_f2.func2 PROC NEAR 
;  Source Line # 22  (Inline # 5 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 81EC80000000                SUB    ESP, 128 
   22| 000013 8B4230                      MOV    EAX, [EDX+48] 
   22| 000016 8078EC00                    CMP    BYTE PTR [EAX-20], 0 ;  Func2__elab_bool
   22|                 L42:                             
   22| 00001A 747B                        JE     SHORT L43 
   22| 00001C 8B02                        MOV    EAX, [EDX+0] 
   22| 00001E 894588                      MOV    [EBP-120], EAX 
;  Source Line # 22  (Inline # 7 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000021 8B5D14                      MOV    EBX, [EBP+20] ;  MM
   22| 000024 53                          PUSH   EBX    
   22| 000025 8B4D10                      MOV    ECX, [EBP+16] ;  MC
   22| 000028 51                          PUSH   ECX    
   22| 000029 8D75D4                      LEA    ESI, [EBP-44] 
   22| 00002C 56                          PUSH   ESI    
   22| 00002D E800000000                  CALL   lab2_allcomp.modu_f2.matrixmult 
   22| 000032 50                          PUSH   EAX    
   22| 000033 8B7D0C                      MOV    EDI, [EBP+12] ;  MB
   22| 000036 57                          PUSH   EDI    
   22| 000037 8B5508                      MOV    EDX, [EBP+8] ;  MA
   22| 00003A 52                          PUSH   EDX    
   22| 00003B 8D5DB0                      LEA    EBX, [EBP-80] 
   22| 00003E 53                          PUSH   EBX    
   22| 00003F E800000000                  CALL   lab2_allcomp.modu_f2.matrixsum 
   22| 000044 50                          PUSH   EAX    
   22| 000045 8D4D8C                      LEA    ECX, [EBP-116] 
   22| 000048 51                          PUSH   ECX    
   22| 000049 E800000000                  CALL   lab2_allcomp.modu_f2.matrixrizn 
   22| 00004E 8B7518                      MOV    ESI, [EBP+24] ;  MD
   22| 000051 897584                      MOV    [EBP-124], ESI ; Spill
   22| 000054 8D30                        LEA    ESI, [EAX+0] 
   22| 000056 8B5584                      MOV    EDX, [EBP-124] ; Spill
   22| 000059 8D3A                        LEA    EDI, [EDX+0] 
   22| 00005B B909000000                  MOV    ECX, 9 
   22| 000060 F3A5                        REP:MOVSD     
;  Source Line # 22  (Inline # 8 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22|                 L41:                             
   22|                 L14:                             
   22|                 L40:                             
   22| 000062 8BE5                        MOV    ESP, EBP 
   22| 000064 5D                          POP    EBP    
   22| 000065 C21400                      RET    20     
;  Source Line # 22  (Inline # 8 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
;  Source Line # 22  (Inline # 9 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000068 8945F8                      MOV    [EBP-8], EAX 
;  Source Line # 22  (Inline # 10 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00006B 6A00                        PUSH   0      
   22| 00006D 8D5D88                      LEA    EBX, [EBP-120] 
   22| 000070 53                          PUSH   EBX    
   22| 000071 8B4DF8                      MOV    ECX, [EBP-8] 
   22| 000074 51                          PUSH   ECX    
   22| 000075 E800000000                  CALL   rts_ss_copy_exception_and_rlse 
   22| 00007A 8945FC                      MOV    [EBP-4], EAX 
   22| 00007D 6800000000                  PUSH   __lcl.00000122 
   22| 000082 6800000000                  PUSH   __lcl.00000121 
   22| 000087 E800000000                  CALL   ada.text_io.put__4 
   22| 00008C 8D5588                      LEA    EDX, [EBP-120] 
   22| 00008F 52                          PUSH   EDX    
   22| 000090 E800000000                  CALL   rts_ss_release 
   22| 000095 EBCB                        JMP    SHORT L40 
   22|                 L43:                             
   22| 000097 F6F4                        DIV    AH     
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
                       lab2_allcomp.modu_f2.func2 ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu_f2.matrixmult   
                       ;                                
                                          PUBLIC lab2_allcomp.modu_f2.matrixmult 
                       lab2_allcomp.modu_f2.matrixmult PROC NEAR 
;  Source Line # 22  (Inline # 15 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC40                      SUB    ESP, 64 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078ED00                    CMP    BYTE PTR [EAX-19], 0 ;  MatrixMult__elab_bool
   22|                 L50:                             
   22| 000017 0F84B7000000                JE     L51    
;  Source Line # 22  (Inline # 19 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00001D C745F401000000              MOV    DWORD PTR [EBP-12], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 20 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000024 C745F801000000              MOV    DWORD PTR [EBP-8], 1 
   22|                 L46:                             
;  Source Line # 22  (Inline # 21 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00002B 8B4510                      MOV    EAX, [EBP+16] ;  B
   22| 00002E 8B5DF8                      MOV    EBX, [EBP-8] 
   22| 000031 8D5BFF                      LEA    EBX, [EBX-1] 
   22| 000034 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   22| 000037 C1E302                      SHL    EBX, 2 
   22| 00003A 8B4DF4                      MOV    ECX, [EBP-12] 
   22| 00003D 8D0C8DFCFFFFFF              LEA    ECX, [4*ECX-4] 
   22| 000044 03D9                        ADD    EBX, ECX 
   22| 000046 8B55F8                      MOV    EDX, [EBP-8] 
   22| 000049 8B3418                      MOV    ESI, [EAX+EBX+0] 
   22| 00004C 897495E4                    MOV    [EBP+4*EDX-28], ESI ;  v
;  Source Line # 22  (Inline # 22 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000050 8B7DF8                      MOV    EDI, [EBP-8] 
   22| 000053 47                          INC    EDI    
   22| 000054 897DF8                      MOV    [EBP-8], EDI 
   22| 000057 837DF803                    CMP    DWORD PTR [EBP-8], 3 
   22| 00005B 7ECE                        JLE    SHORT L46 
;  Source Line # 22  (Inline # 23 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00005D C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L49:                             
;  Source Line # 22  (Inline # 24 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000064 8D45E8                      LEA    EAX, [EBP-24] ;  v
   22| 000067 50                          PUSH   EAX    
   22| 000068 8B5D0C                      MOV    EBX, [EBP+12] ;  A
   22| 00006B 8B4DFC                      MOV    ECX, [EBP-4] 
   22| 00006E 8D49FF                      LEA    ECX, [ECX-1] 
   22| 000071 8D0C49                      LEA    ECX, [ECX+2*ECX+0] 
   22| 000074 C1E102                      SHL    ECX, 2 
   22| 000077 8D1C0B                      LEA    EBX, [EBX+ECX+0] 
   22| 00007A 53                          PUSH   EBX    
   22| 00007B E800000000                  CALL   lab2_allcomp.modu.multiplystep 
   22| 000080 8B55FC                      MOV    EDX, [EBP-4] 
   22| 000083 8D52FF                      LEA    EDX, [EDX-1] 
   22| 000086 8D1452                      LEA    EDX, [EDX+2*EDX+0] 
   22| 000089 C1E202                      SHL    EDX, 2 
   22| 00008C 8B75F4                      MOV    ESI, [EBP-12] 
   22| 00008F 8D34B5FCFFFFFF              LEA    ESI, [4*ESI-4] 
   22| 000096 03D6                        ADD    EDX, ESI 
   22| 000098 894415C4                    MOV    [EBP+EDX-60], EAX ;  RezMatr
;  Source Line # 22  (Inline # 25 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00009C 8B7DFC                      MOV    EDI, [EBP-4] 
   22| 00009F 47                          INC    EDI    
   22| 0000A0 897DFC                      MOV    [EBP-4], EDI 
   22| 0000A3 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 0000A7 7EBB                        JLE    SHORT L49 
;  Source Line # 22  (Inline # 26 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 0000A9 8B45F4                      MOV    EAX, [EBP-12] 
   22| 0000AC 40                          INC    EAX    
   22| 0000AD 8945F4                      MOV    [EBP-12], EAX 
   22| 0000B0 837DF403                    CMP    DWORD PTR [EBP-12], 3 
   22| 0000B4 0F8E6AFFFFFF                JLE    L43    
;  Source Line # 22  (Inline # 27 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 0000BA 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   22| 0000BD 8D75C4                      LEA    ESI, [EBP-60] ;  RezMatr
   22| 0000C0 8D38                        LEA    EDI, [EAX+0] 
   22| 0000C2 B909000000                  MOV    ECX, 9 
   22| 0000C7 F3A5                        REP:MOVSD     
   22| 0000C9 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   22| 0000CC 8BC3                        MOV    EAX, EBX 
   22| 0000CE 8BE5                        MOV    ESP, EBP 
   22| 0000D0 5D                          POP    EBP    
   22| 0000D1 C20C00                      RET    12     
   22|                 L51:                             
   22| 0000D4 F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu_f2.matrixmult ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu_f2.matrixsum   
                       ;                                
                                          PUBLIC lab2_allcomp.modu_f2.matrixsum 
                       lab2_allcomp.modu_f2.matrixsum PROC NEAR 
;  Source Line # 22  (Inline # 33 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC30                      SUB    ESP, 48 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078EE00                    CMP    BYTE PTR [EAX-18], 0 ;  MatrixSum__elab_bool
   22|                 L47:                             
   22| 000017 0F849B000000                JE     L48    
;  Source Line # 22  (Inline # 36 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00001D C745F801000000              MOV    DWORD PTR [EBP-8], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 37 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000024 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L46:                             
;  Source Line # 22  (Inline # 38 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00002B 8B450C                      MOV    EAX, [EBP+12] ;  a
   22| 00002E 8B5DF8                      MOV    EBX, [EBP-8] 
   22| 000031 8D5BFF                      LEA    EBX, [EBX-1] 
   22| 000034 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   22| 000037 C1E302                      SHL    EBX, 2 
   22| 00003A 8B4DFC                      MOV    ECX, [EBP-4] 
   22| 00003D 8D0C8DFCFFFFFF              LEA    ECX, [4*ECX-4] 
   22| 000044 03D9                        ADD    EBX, ECX 
   22| 000046 8B5510                      MOV    EDX, [EBP+16] ;  b
   22| 000049 8B75F8                      MOV    ESI, [EBP-8] 
   22| 00004C 8D76FF                      LEA    ESI, [ESI-1] 
   22| 00004F 8D3476                      LEA    ESI, [ESI+2*ESI+0] 
   22| 000052 C1E602                      SHL    ESI, 2 
   22| 000055 8B7DFC                      MOV    EDI, [EBP-4] 
   22| 000058 8D3CBDFCFFFFFF              LEA    EDI, [4*EDI-4] 
   22| 00005F 03F7                        ADD    ESI, EDI 
   22| 000061 8B0418                      MOV    EAX, [EAX+EBX+0] 
   22| 000064 030432                      ADD    EAX, [EDX+ESI+0] 
   22| 000067 CE                          INTO          
   22| 000068 8B4DF8                      MOV    ECX, [EBP-8] 
   22| 00006B 8D49FF                      LEA    ECX, [ECX-1] 
   22| 00006E 8D0C49                      LEA    ECX, [ECX+2*ECX+0] 
   22| 000071 C1E102                      SHL    ECX, 2 
   22| 000074 8B5DFC                      MOV    EBX, [EBP-4] 
   22| 000077 8D1C9DFCFFFFFF              LEA    EBX, [4*EBX-4] 
   22| 00007E 03CB                        ADD    ECX, EBX 
   22| 000080 89440DD4                    MOV    [EBP+ECX-44], EAX ;  c
;  Source Line # 22  (Inline # 39 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000084 8B55FC                      MOV    EDX, [EBP-4] 
   22| 000087 42                          INC    EDX    
   22| 000088 8955FC                      MOV    [EBP-4], EDX 
   22| 00008B 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 00008F 7E9A                        JLE    SHORT L46 
;  Source Line # 22  (Inline # 40 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000091 8B45F8                      MOV    EAX, [EBP-8] 
   22| 000094 40                          INC    EAX    
   22| 000095 8945F8                      MOV    [EBP-8], EAX 
   22| 000098 837DF803                    CMP    DWORD PTR [EBP-8], 3 
   22| 00009C 7E86                        JLE    SHORT L43 
;  Source Line # 22  (Inline # 41 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00009E 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   22| 0000A1 8D75D4                      LEA    ESI, [EBP-44] ;  c
   22| 0000A4 8D38                        LEA    EDI, [EAX+0] 
   22| 0000A6 B909000000                  MOV    ECX, 9 
   22| 0000AB F3A5                        REP:MOVSD     
   22| 0000AD 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   22| 0000B0 8BC3                        MOV    EAX, EBX 
   22| 0000B2 8BE5                        MOV    ESP, EBP 
   22| 0000B4 5D                          POP    EBP    
   22| 0000B5 C20C00                      RET    12     
   22|                 L48:                             
   22| 0000B8 F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu_f2.matrixsum ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu_f2.matrixrizn   
                       ;                                
                                          PUBLIC lab2_allcomp.modu_f2.matrixrizn 
                       lab2_allcomp.modu_f2.matrixrizn PROC NEAR 
;  Source Line # 22  (Inline # 45 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC30                      SUB    ESP, 48 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078EF00                    CMP    BYTE PTR [EAX-17], 0 ;  MatrixRizn__elab_bool
   22|                 L47:                             
   22| 000017 0F849B000000                JE     L48    
;  Source Line # 22  (Inline # 48 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00001D C745F801000000              MOV    DWORD PTR [EBP-8], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 49 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000024 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L46:                             
;  Source Line # 22  (Inline # 50 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00002B 8B450C                      MOV    EAX, [EBP+12] ;  a
   22| 00002E 8B5DF8                      MOV    EBX, [EBP-8] 
   22| 000031 8D5BFF                      LEA    EBX, [EBX-1] 
   22| 000034 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   22| 000037 C1E302                      SHL    EBX, 2 
   22| 00003A 8B4DFC                      MOV    ECX, [EBP-4] 
   22| 00003D 8D0C8DFCFFFFFF              LEA    ECX, [4*ECX-4] 
   22| 000044 03D9                        ADD    EBX, ECX 
   22| 000046 8B5510                      MOV    EDX, [EBP+16] ;  b
   22| 000049 8B75F8                      MOV    ESI, [EBP-8] 
   22| 00004C 8D76FF                      LEA    ESI, [ESI-1] 
   22| 00004F 8D3476                      LEA    ESI, [ESI+2*ESI+0] 
   22| 000052 C1E602                      SHL    ESI, 2 
   22| 000055 8B7DFC                      MOV    EDI, [EBP-4] 
   22| 000058 8D3CBDFCFFFFFF              LEA    EDI, [4*EDI-4] 
   22| 00005F 03F7                        ADD    ESI, EDI 
   22| 000061 8B0418                      MOV    EAX, [EAX+EBX+0] 
   22| 000064 2B0432                      SUB    EAX, [EDX+ESI+0] 
   22| 000067 CE                          INTO          
   22| 000068 8B4DF8                      MOV    ECX, [EBP-8] 
   22| 00006B 8D49FF                      LEA    ECX, [ECX-1] 
   22| 00006E 8D0C49                      LEA    ECX, [ECX+2*ECX+0] 
   22| 000071 C1E102                      SHL    ECX, 2 
   22| 000074 8B5DFC                      MOV    EBX, [EBP-4] 
   22| 000077 8D1C9DFCFFFFFF              LEA    EBX, [4*EBX-4] 
   22| 00007E 03CB                        ADD    ECX, EBX 
   22| 000080 89440DD4                    MOV    [EBP+ECX-44], EAX ;  c
;  Source Line # 22  (Inline # 51 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000084 8B55FC                      MOV    EDX, [EBP-4] 
   22| 000087 42                          INC    EDX    
   22| 000088 8955FC                      MOV    [EBP-4], EDX 
   22| 00008B 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 00008F 7E9A                        JLE    SHORT L46 
;  Source Line # 22  (Inline # 52 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000091 8B45F8                      MOV    EAX, [EBP-8] 
   22| 000094 40                          INC    EAX    
   22| 000095 8945F8                      MOV    [EBP-8], EAX 
   22| 000098 837DF803                    CMP    DWORD PTR [EBP-8], 3 
   22| 00009C 7E86                        JLE    SHORT L43 
;  Source Line # 22  (Inline # 53 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00009E 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   22| 0000A1 8D75D4                      LEA    ESI, [EBP-44] ;  c
   22| 0000A4 8D38                        LEA    EDI, [EAX+0] 
   22| 0000A6 B909000000                  MOV    ECX, 9 
   22| 0000AB F3A5                        REP:MOVSD     
   22| 0000AD 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   22| 0000B0 8BC3                        MOV    EAX, EBX 
   22| 0000B2 8BE5                        MOV    ESP, EBP 
   22| 0000B4 5D                          POP    EBP    
   22| 0000B5 C20C00                      RET    12     
   22|                 L48:                             
   22| 0000B8 F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu_f2.matrixrizn ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu_f2.multimatrnum   
                       ;                                
                                          PUBLIC lab2_allcomp.modu_f2.multimatrnum 
                       lab2_allcomp.modu_f2.multimatrnum PROC NEAR 
;  Source Line # 22  (Inline # 56 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC30                      SUB    ESP, 48 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078F000                    CMP    BYTE PTR [EAX-16], 0 ;  MultiMatrNum__elab_bool
   22|                 L47:                             
   22| 000017 0F848E000000                JE     L48    
;  Source Line # 22  (Inline # 59 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00001D 8B450C                      MOV    EAX, [EBP+12] ;  A
   22| 000020 8D30                        LEA    ESI, [EAX+0] 
   22| 000022 8D7DD4                      LEA    EDI, [EBP-44] ;  buf
   22| 000025 B909000000                  MOV    ECX, 9 
   22| 00002A F3A5                        REP:MOVSD     
;  Source Line # 22  (Inline # 60 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00002C C745F801000000              MOV    DWORD PTR [EBP-8], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 61 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000033 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L46:                             
;  Source Line # 22  (Inline # 62 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00003A 8B45F8                      MOV    EAX, [EBP-8] 
   22| 00003D 8D40FF                      LEA    EAX, [EAX-1] 
   22| 000040 8D0440                      LEA    EAX, [EAX+2*EAX+0] 
   22| 000043 C1E002                      SHL    EAX, 2 
   22| 000046 8B5DFC                      MOV    EBX, [EBP-4] 
   22| 000049 8D1C9DFCFFFFFF              LEA    EBX, [4*EBX-4] 
   22| 000050 03C3                        ADD    EAX, EBX 
   22| 000052 8B4C05D4                    MOV    ECX, [EBP+EAX-44] ;  buf
   22| 000056 0FAF4D10                    IMUL   ECX, [EBP+16] ;  e
   22| 00005A CE                          INTO          
   22| 00005B 8B55F8                      MOV    EDX, [EBP-8] 
   22| 00005E 8D52FF                      LEA    EDX, [EDX-1] 
   22| 000061 8D1452                      LEA    EDX, [EDX+2*EDX+0] 
   22| 000064 C1E202                      SHL    EDX, 2 
   22| 000067 8B75FC                      MOV    ESI, [EBP-4] 
   22| 00006A 8D34B5FCFFFFFF              LEA    ESI, [4*ESI-4] 
   22| 000071 03D6                        ADD    EDX, ESI 
   22| 000073 894C15D4                    MOV    [EBP+EDX-44], ECX ;  buf
;  Source Line # 22  (Inline # 63 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000077 8B7DFC                      MOV    EDI, [EBP-4] 
   22| 00007A 47                          INC    EDI    
   22| 00007B 897DFC                      MOV    [EBP-4], EDI 
   22| 00007E 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 000082 7EB6                        JLE    SHORT L46 
;  Source Line # 22  (Inline # 64 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000084 8B45F8                      MOV    EAX, [EBP-8] 
   22| 000087 40                          INC    EAX    
   22| 000088 8945F8                      MOV    [EBP-8], EAX 
   22| 00008B 837DF803                    CMP    DWORD PTR [EBP-8], 3 
   22| 00008F 7EA2                        JLE    SHORT L43 
;  Source Line # 22  (Inline # 65 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000091 8B4508                      MOV    EAX, [EBP+8] ;  implicit_param_for_result
   22| 000094 8D75D4                      LEA    ESI, [EBP-44] ;  buf
   22| 000097 8D38                        LEA    EDI, [EAX+0] 
   22| 000099 B909000000                  MOV    ECX, 9 
   22| 00009E F3A5                        REP:MOVSD     
   22| 0000A0 8B5D08                      MOV    EBX, [EBP+8] ;  implicit_param_for_result
   22| 0000A3 8BC3                        MOV    EAX, EBX 
   22| 0000A5 8BE5                        MOV    ESP, EBP 
   22| 0000A7 5D                          POP    EBP    
   22| 0000A8 C20C00                      RET    12     
   22|                 L48:                             
   22| 0000AB F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu_f2.multimatrnum ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu_f2.matrixsort   
                       ;                                
                                          PUBLIC lab2_allcomp.modu_f2.matrixsort 
                       lab2_allcomp.modu_f2.matrixsort PROC NEAR 
;  Source Line # 22  (Inline # 69 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC04                      SUB    ESP, 4 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078F100                    CMP    BYTE PTR [EAX-15], 0 ;  MatrixSort__elab_bool
   22|                 L44:                             
   22| 000017 7432                        JE     SHORT L45 
;  Source Line # 22  (Inline # 71 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000019 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 72 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000020 8B4508                      MOV    EAX, [EBP+8] ;  m
   22| 000023 8B5DFC                      MOV    EBX, [EBP-4] 
   22| 000026 8D5BFF                      LEA    EBX, [EBX-1] 
   22| 000029 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   22| 00002C C1E302                      SHL    EBX, 2 
   22| 00002F 8D0418                      LEA    EAX, [EAX+EBX+0] 
   22| 000032 50                          PUSH   EAX    
   22| 000033 E800000000                  CALL   lab2_allcomp.modu.vectsort 
;  Source Line # 22  (Inline # 73 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000038 8B4DFC                      MOV    ECX, [EBP-4] 
   22| 00003B 41                          INC    ECX    
   22| 00003C 894DFC                      MOV    [EBP-4], ECX 
   22| 00003F 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 000043 7EDB                        JLE    SHORT L43 
   22| 000045 8BE5                        MOV    ESP, EBP 
   22| 000047 5D                          POP    EBP    
   22| 000048 C20400                      RET    4      
   22|                 L45:                             
   22| 00004B F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu_f2.matrixsort ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu_f2.matrixmax   
                       ;                                
                                          PUBLIC lab2_allcomp.modu_f2.matrixmax 
                       lab2_allcomp.modu_f2.matrixmax PROC NEAR 
;  Source Line # 22  (Inline # 77 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC10                      SUB    ESP, 16 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078F200                    CMP    BYTE PTR [EAX-14], 0 ;  MatrixMax__elab_bool
   22|                 L49:                             
   22| 000017 0F847D000000                JE     L50    
;  Source Line # 22  (Inline # 80 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00001D 8B4508                      MOV    EAX, [EBP+8] ;  m
   22| 000020 8B18                        MOV    EBX, [EAX+0] 
   22| 000022 895DF4                      MOV    [EBP-12], EBX ;  max
;  Source Line # 22  (Inline # 81 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000025 C745F801000000              MOV    DWORD PTR [EBP-8], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 82 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00002C C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L46:                             
;  Source Line # 22  (Inline # 83 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000033 8B4508                      MOV    EAX, [EBP+8] ;  m
   22| 000036 8B5DF8                      MOV    EBX, [EBP-8] 
   22| 000039 8D5BFF                      LEA    EBX, [EBX-1] 
   22| 00003C 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   22| 00003F C1E302                      SHL    EBX, 2 
   22| 000042 8B4DFC                      MOV    ECX, [EBP-4] 
   22| 000045 8D0C8DFCFFFFFF              LEA    ECX, [4*ECX-4] 
   22| 00004C 03D9                        ADD    EBX, ECX 
   22| 00004E 8B1418                      MOV    EDX, [EAX+EBX+0] 
   22| 000051 3955F4                      CMP    [EBP-12], EDX ;  max
   22| 000054 7D21                        JGE    SHORT L47 
;  Source Line # 22  (Inline # 84 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000056 8B4508                      MOV    EAX, [EBP+8] ;  m
   22| 000059 8B5DF8                      MOV    EBX, [EBP-8] 
   22| 00005C 8D5BFF                      LEA    EBX, [EBX-1] 
   22| 00005F 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   22| 000062 C1E302                      SHL    EBX, 2 
   22| 000065 8B4DFC                      MOV    ECX, [EBP-4] 
   22| 000068 8D0C8DFCFFFFFF              LEA    ECX, [4*ECX-4] 
   22| 00006F 03D9                        ADD    EBX, ECX 
   22| 000071 8B1418                      MOV    EDX, [EAX+EBX+0] 
   22| 000074 8955F4                      MOV    [EBP-12], EDX ;  max
;  Source Line # 22  (Inline # 85 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22|                 L47:                             
;  Source Line # 22  (Inline # 86 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000077 8B45FC                      MOV    EAX, [EBP-4] 
   22| 00007A 40                          INC    EAX    
   22| 00007B 8945FC                      MOV    [EBP-4], EAX 
   22| 00007E 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 000082 7EAF                        JLE    SHORT L46 
;  Source Line # 22  (Inline # 87 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000084 8B45F8                      MOV    EAX, [EBP-8] 
   22| 000087 40                          INC    EAX    
   22| 000088 8945F8                      MOV    [EBP-8], EAX 
   22| 00008B 837DF803                    CMP    DWORD PTR [EBP-8], 3 
   22| 00008F 7E9B                        JLE    SHORT L43 
;  Source Line # 22  (Inline # 88 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000091 8B45F4                      MOV    EAX, [EBP-12] ;  max
   22| 000094 8BE5                        MOV    ESP, EBP 
   22| 000096 5D                          POP    EBP    
   22| 000097 C20400                      RET    4      
   22|                 L50:                             
   22| 00009A F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu_f2.matrixmax ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu_f2.matrixmin   
                       ;                                
                                          PUBLIC lab2_allcomp.modu_f2.matrixmin 
                       lab2_allcomp.modu_f2.matrixmin PROC NEAR 
;  Source Line # 22  (Inline # 92 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC10                      SUB    ESP, 16 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078F300                    CMP    BYTE PTR [EAX-13], 0 ;  MatrixMin__elab_bool
   22|                 L49:                             
   22| 000017 0F847D000000                JE     L50    
;  Source Line # 22  (Inline # 95 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00001D 8B4508                      MOV    EAX, [EBP+8] ;  m
   22| 000020 8B18                        MOV    EBX, [EAX+0] 
   22| 000022 895DF4                      MOV    [EBP-12], EBX ;  max
;  Source Line # 22  (Inline # 96 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000025 C745F801000000              MOV    DWORD PTR [EBP-8], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 97 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 00002C C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L46:                             
;  Source Line # 22  (Inline # 98 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000033 8B4508                      MOV    EAX, [EBP+8] ;  m
   22| 000036 8B5DF8                      MOV    EBX, [EBP-8] 
   22| 000039 8D5BFF                      LEA    EBX, [EBX-1] 
   22| 00003C 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   22| 00003F C1E302                      SHL    EBX, 2 
   22| 000042 8B4DFC                      MOV    ECX, [EBP-4] 
   22| 000045 8D0C8DFCFFFFFF              LEA    ECX, [4*ECX-4] 
   22| 00004C 03D9                        ADD    EBX, ECX 
   22| 00004E 8B1418                      MOV    EDX, [EAX+EBX+0] 
   22| 000051 3955F4                      CMP    [EBP-12], EDX ;  max
   22| 000054 7E21                        JLE    SHORT L47 
;  Source Line # 22  (Inline # 99 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000056 8B4508                      MOV    EAX, [EBP+8] ;  m
   22| 000059 8B5DF8                      MOV    EBX, [EBP-8] 
   22| 00005C 8D5BFF                      LEA    EBX, [EBX-1] 
   22| 00005F 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   22| 000062 C1E302                      SHL    EBX, 2 
   22| 000065 8B4DFC                      MOV    ECX, [EBP-4] 
   22| 000068 8D0C8DFCFFFFFF              LEA    ECX, [4*ECX-4] 
   22| 00006F 03D9                        ADD    EBX, ECX 
   22| 000071 8B1418                      MOV    EDX, [EAX+EBX+0] 
   22| 000074 8955F4                      MOV    [EBP-12], EDX ;  max
;  Source Line # 22  (Inline # 100 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22|                 L47:                             
;  Source Line # 22  (Inline # 101 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000077 8B45FC                      MOV    EAX, [EBP-4] 
   22| 00007A 40                          INC    EAX    
   22| 00007B 8945FC                      MOV    [EBP-4], EAX 
   22| 00007E 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 000082 7EAF                        JLE    SHORT L46 
;  Source Line # 22  (Inline # 102 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000084 8B45F8                      MOV    EAX, [EBP-8] 
   22| 000087 40                          INC    EAX    
   22| 000088 8945F8                      MOV    [EBP-8], EAX 
   22| 00008B 837DF803                    CMP    DWORD PTR [EBP-8], 3 
   22| 00008F 7E9B                        JLE    SHORT L43 
;  Source Line # 22  (Inline # 103 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   22| 000091 8B45F4                      MOV    EAX, [EBP-12] ;  max
   22| 000094 8BE5                        MOV    ESP, EBP 
   22| 000096 5D                          POP    EBP    
   22| 000097 C20400                      RET    4      
   22|                 L50:                             
   22| 00009A F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu_f2.matrixmin ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu_f3.func3   
                       ;                                
                                          PUBLIC lab2_allcomp.modu_f3.func3 
                       lab2_allcomp.modu_f3.func3 PROC NEAR 
;  Source Line # 22  (Inline # 5 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC64                      SUB    ESP, 100 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078F400                    CMP    BYTE PTR [EAX-12], 0 ;  Func3__elab_bool
   22|                 L42:                             
   22| 000017 0F8484000000                JE     L43    
;  Source Line # 22  (Inline # 6 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
   22| 00001D 8B02                        MOV    EAX, [EDX+0] 
   22| 00001F 8945AC                      MOV    [EBP-84], EAX 
;  Source Line # 22  (Inline # 8 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
   22| 000022 FF7510                      PUSH   DWORD PTR [EBP+16] ;  E
   22| 000025 8B5D0C                      MOV    EBX, [EBP+12] ;  MB
   22| 000028 53                          PUSH   EBX    
   22| 000029 8D4DD4                      LEA    ECX, [EBP-44] 
   22| 00002C 51                          PUSH   ECX    
   22| 00002D E800000000                  CALL   lab2_allcomp.modu_f2.multimatrnum 
   22| 000032 50                          PUSH   EAX    
   22| 000033 8B7508                      MOV    ESI, [EBP+8] ;  MA
   22| 000036 56                          PUSH   ESI    
   22| 000037 8D7DB0                      LEA    EDI, [EBP-80] 
   22| 00003A 57                          PUSH   EDI    
   22| 00003B E800000000                  CALL   lab2_allcomp.modu_f2.matrixmult 
   22| 000040 50                          PUSH   EAX    
   22| 000041 E800000000                  CALL   lab2_allcomp.modu_f2.matrixmin 
   22| 000046 8945A8                      MOV    [EBP-88], EAX ;  k
;  Source Line # 22  (Inline # 10 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
   22|                 L41:                             
   22|                 L31:                             
   22| 000049 6800000000                  PUSH   program_error 
   22| 00004E E800000000                  CALL   rts_raise 
   22| 000053 6800000000                  PUSH   program_error 
   22| 000058 E800000000                  CALL   rts_raise 
   22|                 L40:                             
   22| 00005D 8B459C                      MOV    EAX, [EBP-100] ; Spill
   22| 000060 8BE5                        MOV    ESP, EBP 
   22| 000062 5D                          POP    EBP    
   22| 000063 C20C00                      RET    12     
;  Source Line # 22  (Inline # 10 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
;  Source Line # 22  (Inline # 11 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
   22| 000066 8945F8                      MOV    [EBP-8], EAX 
;  Source Line # 22  (Inline # 12 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
   22| 000069 6A00                        PUSH   0      
   22| 00006B 8D5DAC                      LEA    EBX, [EBP-84] 
   22| 00006E 53                          PUSH   EBX    
   22| 00006F 8B4DF8                      MOV    ECX, [EBP-8] 
   22| 000072 51                          PUSH   ECX    
   22| 000073 E800000000                  CALL   rts_ss_copy_exception_and_rlse 
   22| 000078 8945FC                      MOV    [EBP-4], EAX 
   22| 00007B 6800000000                  PUSH   __lcl.00000285 
   22| 000080 6800000000                  PUSH   __lcl.00000284 
   22| 000085 E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 22  (Inline # 13 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
   22| 00008A 8B55A8                      MOV    EDX, [EBP-88] ;  k
   22| 00008D 8955A4                      MOV    [EBP-92], EDX 
   22| 000090 8D75AC                      LEA    ESI, [EBP-84] 
   22| 000093 56                          PUSH   ESI    
   22| 000094 E800000000                  CALL   rts_ss_release 
   22| 000099 8B45A4                      MOV    EAX, [EBP-92] 
   22| 00009C 89459C                      MOV    [EBP-100], EAX ; Spill
   22| 00009F EBBC                        JMP    SHORT L40 
   22|                 L43:                             
   22| 0000A1 F6F4                        DIV    AH     
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
                       lab2_allcomp.modu_f3.func3 ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu_io.vectoutput   
                       ;                                
                                          PUBLIC lab2_allcomp.modu_io.vectoutput 
                       lab2_allcomp.modu_io.vectoutput PROC NEAR 
;  Source Line # 22  (Inline # 8 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC04                      SUB    ESP, 4 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078F500                    CMP    BYTE PTR [EAX-11], 0 ;  VectOutput__elab_bool
   22|                 L44:                             
   22| 000017 7458                        JE     SHORT L45 
;  Source Line # 22  (Inline # 10 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000019 6800000000                  PUSH   __lcl.00000292 
   22| 00001E 6800000000                  PUSH   __lcl.00000291 
   22| 000023 E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 22  (Inline # 11 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000028 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 12 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00002F 0FB60500000000              MOVZX  EAX, BYTE PTR ada.integer_text_io.default_base 
   22| 000036 50                          PUSH   EAX    
   22| 000037 6A02                        PUSH   2      
   22| 000039 8B5D08                      MOV    EBX, [EBP+8] ;  A
   22| 00003C 8B4DFC                      MOV    ECX, [EBP-4] 
   22| 00003F FF748BFC                    PUSH   DWORD PTR [EBX+4*ECX-4] 
   22| 000043 E800000000                  CALL   ada.integer_text_io.put__2 
;  Source Line # 22  (Inline # 13 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000048 8B55FC                      MOV    EDX, [EBP-4] 
   22| 00004B 42                          INC    EDX    
   22| 00004C 8955FC                      MOV    [EBP-4], EDX 
   22| 00004F 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 000053 7EDA                        JLE    SHORT L43 
;  Source Line # 22  (Inline # 14 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000055 6800000000                  PUSH   __lcl.00000292 
   22| 00005A 6800000000                  PUSH   __lcl.00000302 
   22| 00005F E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 22  (Inline # 15 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000064 6A01                        PUSH   1      
   22| 000066 E800000000                  CALL   ada.text_io.new_line__2 
   22| 00006B 8BE5                        MOV    ESP, EBP 
   22| 00006D 5D                          POP    EBP    
   22| 00006E C20400                      RET    4      
   22|                 L45:                             
   22| 000071 F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu_io.vectoutput ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu_io.matrixoutput   
                       ;                                
                                          PUBLIC lab2_allcomp.modu_io.matrixoutput 
                       lab2_allcomp.modu_io.matrixoutput PROC NEAR 
;  Source Line # 22  (Inline # 19 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC04                      SUB    ESP, 4 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078F600                    CMP    BYTE PTR [EAX-10], 0 ;  MatrixOutput__elab_bool
   22|                 L44:                             
   22| 000017 7439                        JE     SHORT L45 
;  Source Line # 22  (Inline # 27 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000019 C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 28 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000020 8B4508                      MOV    EAX, [EBP+8] ;  a
   22| 000023 8B5DFC                      MOV    EBX, [EBP-4] 
   22| 000026 8D5BFF                      LEA    EBX, [EBX-1] 
   22| 000029 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   22| 00002C C1E302                      SHL    EBX, 2 
   22| 00002F 8D0418                      LEA    EAX, [EAX+EBX+0] 
   22| 000032 50                          PUSH   EAX    
   22| 000033 E800000000                  CALL   lab2_allcomp.modu_io.vectoutput 
;  Source Line # 22  (Inline # 29 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000038 6A01                        PUSH   1      
   22| 00003A E800000000                  CALL   ada.text_io.new_line__2 
;  Source Line # 22  (Inline # 30 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00003F 8B4DFC                      MOV    ECX, [EBP-4] 
   22| 000042 41                          INC    ECX    
   22| 000043 894DFC                      MOV    [EBP-4], ECX 
   22| 000046 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 00004A 7ED4                        JLE    SHORT L43 
   22| 00004C 8BE5                        MOV    ESP, EBP 
   22| 00004E 5D                          POP    EBP    
   22| 00004F C20400                      RET    4      
   22|                 L45:                             
   22| 000052 F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu_io.matrixoutput ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu_io.vectinput   
                       ;                                
                                          PUBLIC lab2_allcomp.modu_io.vectinput 
                       lab2_allcomp.modu_io.vectinput PROC NEAR 
;  Source Line # 22  (Inline # 34 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC1C                      SUB    ESP, 28 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078F700                    CMP    BYTE PTR [EAX-9], 0 ;  VectInput__elab_bool
   22|                 L46:                             
   22| 000017 0F84A6000000                JE     L47    
;  Source Line # 22  (Inline # 36 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00001D 6800000000                  PUSH   __lcl.00000318 
   22| 000022 6800000000                  PUSH   __lcl.00000317 
   22| 000027 8955E4                      MOV    [EBP-28], EDX ; Spill
   22| 00002A E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 22  (Inline # 37 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00002F 0FB60500000000              MOVZX  EAX, BYTE PTR ada.integer_text_io.default_base 
   22| 000036 50                          PUSH   EAX    
   22| 000037 6A03                        PUSH   3      
   22| 000039 6A03                        PUSH   3      
   22| 00003B E800000000                  CALL   ada.integer_text_io.put__2 
;  Source Line # 22  (Inline # 38 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000040 6800000000                  PUSH   __lcl.00000320 
   22| 000045 6800000000                  PUSH   __lcl.00000319 
   22| 00004A E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 22  (Inline # 39 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00004F C745EC01000000              MOV    DWORD PTR [EBP-20], 1 
;  Source Line # 22  (Inline # 40 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22|                 L44:                             
;  Source Line # 22  (Inline # 41 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000056 8B55E4                      MOV    EDX, [EBP-28] ; Spill
   22| 000059 8B02                        MOV    EAX, [EDX+0] 
   22| 00005B 8945F0                      MOV    [EBP-16], EAX 
;  Source Line # 22  (Inline # 42 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00005E 6A00                        PUSH   0      
   22| 000060 8D5DF4                      LEA    EBX, [EBP-12] 
   22| 000063 53                          PUSH   EBX    
   22| 000064 E800000000                  CALL   ada.integer_text_io.get__2 
   22| 000069 8B4D08                      MOV    ECX, [EBP+8] ;  a
   22| 00006C 8B75EC                      MOV    ESI, [EBP-20] 
   22| 00006F 8B7DF4                      MOV    EDI, [EBP-12] 
   22| 000072 897CB1FC                    MOV    [ECX+4*ESI-4], EDI 
   22| 000076 EB02                        JMP    SHORT L35 
   22|                 L45:                             
;  Source Line # 22  (Inline # 47 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22|                 L38:                             
;  Source Line # 22  (Inline # 48 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
;  Source Line # 22  (Inline # 49 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000078 EBDC                        JMP    SHORT L44 
   22|                 L35:                             
;  Source Line # 22  (Inline # 50 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00007A 8B45EC                      MOV    EAX, [EBP-20] 
   22| 00007D 40                          INC    EAX    
   22| 00007E 8945EC                      MOV    [EBP-20], EAX 
   22| 000081 837DEC03                    CMP    DWORD PTR [EBP-20], 3 
   22| 000085 7ECF                        JLE    SHORT L44 
   22| 000087 8BE5                        MOV    ESP, EBP 
   22| 000089 5D                          POP    EBP    
   22| 00008A C20400                      RET    4      
;  Source Line # 22  (Inline # 44 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
;  Source Line # 22  (Inline # 45 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00008D 8945F8                      MOV    [EBP-8], EAX 
;  Source Line # 22  (Inline # 46 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000090 6A00                        PUSH   0      
   22| 000092 8D5DF0                      LEA    EBX, [EBP-16] 
   22| 000095 53                          PUSH   EBX    
   22| 000096 8B4DF8                      MOV    ECX, [EBP-8] 
   22| 000099 51                          PUSH   ECX    
   22| 00009A E800000000                  CALL   rts_ss_copy_exception_and_rlse 
   22| 00009F 8945FC                      MOV    [EBP-4], EAX 
   22| 0000A2 6800000000                  PUSH   __lcl.00000328 
   22| 0000A7 6800000000                  PUSH   __lcl.00000327 
   22| 0000AC E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 22  (Inline # 47 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 0000B1 6A01                        PUSH   1      
   22| 0000B3 E800000000                  CALL   ada.text_io.skip_line__2 
   22| 0000B8 8D55F0                      LEA    EDX, [EBP-16] 
   22| 0000BB 52                          PUSH   EDX    
   22| 0000BC E800000000                  CALL   rts_ss_release 
   22| 0000C1 EBB5                        JMP    SHORT L38 
   22|                 L47:                             
   22| 0000C3 F6F4                        DIV    AH     
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
                       lab2_allcomp.modu_io.vectinput ENDP  

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
                       ;  Start of procedure lab2_allcomp.modu_io.matrixinput   
                       ;                                
                                          PUBLIC lab2_allcomp.modu_io.matrixinput 
                       lab2_allcomp.modu_io.matrixinput PROC NEAR 
;  Source Line # 22  (Inline # 56 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 83EC04                      SUB    ESP, 4 
   22| 000010 8B4230                      MOV    EAX, [EDX+48] 
   22| 000013 8078F800                    CMP    BYTE PTR [EAX-8], 0 ;  MatrixInput__elab_bool
   22|                 L44:                             
   22| 000017 0F8490000000                JE     L45    
;  Source Line # 22  (Inline # 58 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00001D 6800000000                  PUSH   __lcl.00000338 
   22| 000022 6800000000                  PUSH   __lcl.00000337 
   22| 000027 E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 22  (Inline # 59 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00002C 0FB60500000000              MOVZX  EAX, BYTE PTR ada.integer_text_io.default_base 
   22| 000033 50                          PUSH   EAX    
   22| 000034 6A03                        PUSH   3      
   22| 000036 6A03                        PUSH   3      
   22| 000038 E800000000                  CALL   ada.integer_text_io.put__2 
;  Source Line # 22  (Inline # 60 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00003D 6800000000                  PUSH   __lcl.00000340 
   22| 000042 6800000000                  PUSH   __lcl.00000339 
   22| 000047 E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 22  (Inline # 61 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00004C 0FB61D00000000              MOVZX  EBX, BYTE PTR ada.integer_text_io.default_base 
   22| 000053 53                          PUSH   EBX    
   22| 000054 6A03                        PUSH   3      
   22| 000056 6A03                        PUSH   3      
   22| 000058 E800000000                  CALL   ada.integer_text_io.put__2 
;  Source Line # 22  (Inline # 62 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00005D 6800000000                  PUSH   __lcl.00000342 
   22| 000062 6800000000                  PUSH   __lcl.00000341 
   22| 000067 E800000000                  CALL   ada.text_io.put__4 
;  Source Line # 22  (Inline # 63 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00006C 6800000000                  PUSH   __lcl.00000344 
   22| 000071 6800000000                  PUSH   __lcl.00000343 
   22| 000076 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 22  (Inline # 64 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00007B C745FC01000000              MOV    DWORD PTR [EBP-4], 1 
   22|                 L43:                             
;  Source Line # 22  (Inline # 65 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 000082 8B4508                      MOV    EAX, [EBP+8] ;  m
   22| 000085 8B5DFC                      MOV    EBX, [EBP-4] 
   22| 000088 8D5BFF                      LEA    EBX, [EBX-1] 
   22| 00008B 8D1C5B                      LEA    EBX, [EBX+2*EBX+0] 
   22| 00008E C1E302                      SHL    EBX, 2 
   22| 000091 8D0418                      LEA    EAX, [EAX+EBX+0] 
   22| 000094 50                          PUSH   EAX    
   22| 000095 E800000000                  CALL   lab2_allcomp.modu_io.vectinput 
;  Source Line # 22  (Inline # 66 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   22| 00009A 8B4DFC                      MOV    ECX, [EBP-4] 
   22| 00009D 41                          INC    ECX    
   22| 00009E 894DFC                      MOV    [EBP-4], ECX 
   22| 0000A1 837DFC03                    CMP    DWORD PTR [EBP-4], 3 
   22| 0000A5 7EDB                        JLE    SHORT L43 
   22| 0000A7 8BE5                        MOV    ESP, EBP 
   22| 0000A9 5D                          POP    EBP    
   22| 0000AA C20400                      RET    4      
   22|                 L45:                             
   22| 0000AD F6F4                        DIV    AH     
                       ;                                
                       lab2_allcomp.modu_io.matrixinput ENDP  

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
                       ;  Start of procedure lab2_allcomp   
                       ;                                
                                          PUBLIC lab2_allcomp 
                       lab2_allcomp       PROC   NEAR   
;  Source Line # 22
   22| 000000 648B1504000000              MOV    EDX, FS:[+4] 
   22| 000007 8B52FC                      MOV    EDX, [EDX-4] 
   22| 00000A 55                          PUSH   EBP    
   22| 00000B 8BEC                        MOV    EBP, ESP 
   22| 00000D 8A8424ECFEFFFF              MOV    AL, [ESP-276] 
   22| 000014 81EC14010000                SUB    ESP, 276 
   22| 00001A 8B4230                      MOV    EAX, [EDX+48] 
   22| 00001D 8945FC                      MOV    [EBP-4], EAX 
   22| 000020 896A30                      MOV    [EDX+48], EBP 
;  Source Line # 23
   23| 000023 8995ECFEFFFF                MOV    [EBP-276], EDX ; Spill
   23| 000029 803D0000000000              CMP    BYTE PTR vector_f1__elab_bool, 0 
   23| 000030 750A                        JNE    SHORT L41 
   23| 000032 6800000000                  PUSH   program_error 
   23| 000037 E800000000                  CALL   rts_raise 
   23|                 L41:                             
;  Source Line # 23  (Inline # 26 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.ads)
   23| 00003C C645E400                    MOV    BYTE PTR [EBP-28], 0 ;  Func1__elab_bool
   23| 000040 C645E500                    MOV    BYTE PTR [EBP-27], 0 ;  VectMult__elab_bool
   23| 000044 C645E600                    MOV    BYTE PTR [EBP-26], 0 ;  VectSum__elab_bool
   23| 000048 C645E700                    MOV    BYTE PTR [EBP-25], 0 ;  VectSort__elab_bool
   23| 00004C C645E800                    MOV    BYTE PTR [EBP-24], 0 ;  PlusVect__elab_bool
   23| 000050 C645E900                    MOV    BYTE PTR [EBP-23], 0 ;  MinusVect__elab_bool
   23| 000054 C645EA00                    MOV    BYTE PTR [EBP-22], 0 ;  multiVectNum__elab_bool
   23| 000058 C645EB00                    MOV    BYTE PTR [EBP-21], 0 ;  MultiplyStep__elab_bool
;  Source Line # 23  (Inline # 17 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   23| 00005C C645E501                    MOV    BYTE PTR [EBP-27], 1 ;  VectMult__elab_bool
;  Source Line # 23  (Inline # 28 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   23| 000060 C645E601                    MOV    BYTE PTR [EBP-26], 1 ;  VectSum__elab_bool
;  Source Line # 23  (Inline # 38 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   23| 000064 C645E701                    MOV    BYTE PTR [EBP-25], 1 ;  VectSort__elab_bool
;  Source Line # 23  (Inline # 55 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   23| 000068 C645E801                    MOV    BYTE PTR [EBP-24], 1 ;  PlusVect__elab_bool
;  Source Line # 23  (Inline # 64 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   23| 00006C C645E901                    MOV    BYTE PTR [EBP-23], 1 ;  MinusVect__elab_bool
;  Source Line # 23  (Inline # 73 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   23| 000070 C645EA01                    MOV    BYTE PTR [EBP-22], 1 ;  multiVectNum__elab_bool
;  Source Line # 23  (Inline # 86 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   23| 000074 C645E401                    MOV    BYTE PTR [EBP-28], 1 ;  Func1__elab_bool
;  Source Line # 23  (Inline # 94 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb)
   23| 000078 C645EB01                    MOV    BYTE PTR [EBP-21], 1 ;  MultiplyStep__elab_bool
;  Source Line # 26
   26| 00007C 803D0000000000              CMP    BYTE PTR vector_f1.matrix_f2__elab_bool, 0 
   26| 000083 750A                        JNE    SHORT L43 
   26| 000085 6800000000                  PUSH   program_error 
   26| 00008A E800000000                  CALL   rts_raise 
   26|                 L43:                             
;  Source Line # 26  (Inline # 15 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.ads)
   26| 00008F C645EC00                    MOV    BYTE PTR [EBP-20], 0 ;  Func2__elab_bool
   26| 000093 C645ED00                    MOV    BYTE PTR [EBP-19], 0 ;  MatrixMult__elab_bool
   26| 000097 C645EE00                    MOV    BYTE PTR [EBP-18], 0 ;  MatrixSum__elab_bool
   26| 00009B C645EF00                    MOV    BYTE PTR [EBP-17], 0 ;  MatrixRizn__elab_bool
   26| 00009F C645F000                    MOV    BYTE PTR [EBP-16], 0 ;  MultiMatrNum__elab_bool
   26| 0000A3 C645F100                    MOV    BYTE PTR [EBP-15], 0 ;  MatrixSort__elab_bool
   26| 0000A7 C645F200                    MOV    BYTE PTR [EBP-14], 0 ;  MatrixMax__elab_bool
   26| 0000AB C645F300                    MOV    BYTE PTR [EBP-13], 0 ;  MatrixMin__elab_bool
;  Source Line # 26  (Inline # 5 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   26| 0000AF C645EC01                    MOV    BYTE PTR [EBP-20], 1 ;  Func2__elab_bool
;  Source Line # 26  (Inline # 15 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   26| 0000B3 C645ED01                    MOV    BYTE PTR [EBP-19], 1 ;  MatrixMult__elab_bool
;  Source Line # 26  (Inline # 33 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   26| 0000B7 C645EE01                    MOV    BYTE PTR [EBP-18], 1 ;  MatrixSum__elab_bool
;  Source Line # 26  (Inline # 45 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   26| 0000BB C645EF01                    MOV    BYTE PTR [EBP-17], 1 ;  MatrixRizn__elab_bool
;  Source Line # 26  (Inline # 56 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   26| 0000BF C645F001                    MOV    BYTE PTR [EBP-16], 1 ;  MultiMatrNum__elab_bool
;  Source Line # 26  (Inline # 69 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   26| 0000C3 C645F101                    MOV    BYTE PTR [EBP-15], 1 ;  MatrixSort__elab_bool
;  Source Line # 26  (Inline # 77 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   26| 0000C7 C645F201                    MOV    BYTE PTR [EBP-14], 1 ;  MatrixMax__elab_bool
;  Source Line # 26  (Inline # 92 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2.adb)
   26| 0000CB C645F301                    MOV    BYTE PTR [EBP-13], 1 ;  MatrixMin__elab_bool
;  Source Line # 29
   29| 0000CF 803D0000000000              CMP    BYTE PTR vector_f1.matrix_f2.f3__elab_bool, 0 
   29| 0000D6 750A                        JNE    SHORT L45 
   29| 0000D8 6800000000                  PUSH   program_error 
   29| 0000DD E800000000                  CALL   rts_raise 
   29|                 L45:                             
;  Source Line # 29  (Inline # 29 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.ads)
   29| 0000E2 C645F400                    MOV    BYTE PTR [EBP-12], 0 ;  Func3__elab_bool
;  Source Line # 29  (Inline # 5 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-f3.adb)
   29| 0000E6 C645F401                    MOV    BYTE PTR [EBP-12], 1 ;  Func3__elab_bool
;  Source Line # 32
   32| 0000EA 803D0000000000              CMP    BYTE PTR vector_f1.matrix_f2.fio__elab_bool, 0 
   32| 0000F1 750A                        JNE    SHORT L47 
   32| 0000F3 6800000000                  PUSH   program_error 
   32| 0000F8 E800000000                  CALL   rts_raise 
   32|                 L47:                             
;  Source Line # 32  (Inline # 32 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.ads)
   32| 0000FD C645F500                    MOV    BYTE PTR [EBP-11], 0 ;  VectOutput__elab_bool
   32| 000101 C645F600                    MOV    BYTE PTR [EBP-10], 0 ;  MatrixOutput__elab_bool
   32| 000105 C645F700                    MOV    BYTE PTR [EBP-9], 0 ;  VectInput__elab_bool
   32| 000109 C645F800                    MOV    BYTE PTR [EBP-8], 0 ;  MatrixInput__elab_bool
;  Source Line # 32  (Inline # 8 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   32| 00010D C645F501                    MOV    BYTE PTR [EBP-11], 1 ;  VectOutput__elab_bool
;  Source Line # 32  (Inline # 19 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   32| 000111 C645F601                    MOV    BYTE PTR [EBP-10], 1 ;  MatrixOutput__elab_bool
;  Source Line # 32  (Inline # 34 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   32| 000115 C645F701                    MOV    BYTE PTR [EBP-9], 1 ;  VectInput__elab_bool
;  Source Line # 32  (Inline # 56 in D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix_f2-fio.adb)
   32| 000119 C645F801                    MOV    BYTE PTR [EBP-8], 1 ;  MatrixInput__elab_bool
;  Source Line # 41
   41| 00011D 6800000000                  PUSH   __lcl.00000369 
   41| 000122 6800000000                  PUSH   __lcl.00000368 
   41| 000127 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 42
   42| 00012C 6800000000                  PUSH   __lcl.00000371 
   42| 000131 6800000000                  PUSH   __lcl.00000370 
   42| 000136 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 43
   43| 00013B 8D8504FFFFFF                LEA    EAX, [EBP-252] ;  B
   43| 000141 50                          PUSH   EAX    
   43| 000142 E800000000                  CALL   lab2_allcomp.modu_io.vectinput 
;  Source Line # 44
   44| 000147 6800000000                  PUSH   __lcl.00000371 
   44| 00014C 6800000000                  PUSH   __lcl.00000372 
   44| 000151 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 45
   45| 000156 8D9D10FFFFFF                LEA    EBX, [EBP-240] ;  C
   45| 00015C 53                          PUSH   EBX    
   45| 00015D E800000000                  CALL   lab2_allcomp.modu_io.vectinput 
;  Source Line # 46
   46| 000162 6800000000                  PUSH   __lcl.00000371 
   46| 000167 6800000000                  PUSH   __lcl.00000373 
   46| 00016C E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 47
   47| 000171 8D8D1CFFFFFF                LEA    ECX, [EBP-228] ;  D
   47| 000177 51                          PUSH   ECX    
   47| 000178 E800000000                  CALL   lab2_allcomp.modu_io.vectinput 
;  Source Line # 48
   48| 00017D 6800000000                  PUSH   __lcl.00000375 
   48| 000182 6800000000                  PUSH   __lcl.00000374 
   48| 000187 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 49
   49| 00018C 6A00                        PUSH   0      
   49| 00018E 8D55DC                      LEA    EDX, [EBP-36] ;  e
   49| 000191 52                          PUSH   EDX    
   49| 000192 E800000000                  CALL   ada.integer_text_io.get__2 
;  Source Line # 50
   50| 000197 FF75DC                      PUSH   DWORD PTR [EBP-36] ;  e
   50| 00019A 8DB51CFFFFFF                LEA    ESI, [EBP-228] ;  D
   50| 0001A0 56                          PUSH   ESI    
   50| 0001A1 8DBD10FFFFFF                LEA    EDI, [EBP-240] ;  C
   50| 0001A7 57                          PUSH   EDI    
   50| 0001A8 8D8504FFFFFF                LEA    EAX, [EBP-252] ;  B
   50| 0001AE 50                          PUSH   EAX    
   50| 0001AF 8D9DF8FEFFFF                LEA    EBX, [EBP-264] ;  A
   50| 0001B5 53                          PUSH   EBX    
   50| 0001B6 E800000000                  CALL   lab2_allcomp.modu.func1 
;  Source Line # 51
   51| 0001BB 6800000000                  PUSH   __lcl.00000377 
   51| 0001C0 6800000000                  PUSH   __lcl.00000376 
   51| 0001C5 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 52
   52| 0001CA 8D8DF8FEFFFF                LEA    ECX, [EBP-264] ;  A
   52| 0001D0 51                          PUSH   ECX    
   52| 0001D1 E800000000                  CALL   lab2_allcomp.modu_io.vectoutput 
;  Source Line # 53
   53| 0001D6 6A01                        PUSH   1      
   53| 0001D8 E800000000                  CALL   ada.text_io.new_line__2 
;  Source Line # 56
   56| 0001DD 6800000000                  PUSH   __lcl.00000369 
   56| 0001E2 6800000000                  PUSH   __lcl.00000378 
   56| 0001E7 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 57
   57| 0001EC 6800000000                  PUSH   __lcl.00000380 
   57| 0001F1 6800000000                  PUSH   __lcl.00000379 
   57| 0001F6 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 58
   58| 0001FB 8D9528FFFFFF                LEA    EDX, [EBP-216] ;  MA
   58| 000201 52                          PUSH   EDX    
   58| 000202 E800000000                  CALL   lab2_allcomp.modu_io.matrixinput 
;  Source Line # 59
   59| 000207 6800000000                  PUSH   __lcl.00000380 
   59| 00020C 6800000000                  PUSH   __lcl.00000381 
   59| 000211 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 60
   60| 000216 8DB54CFFFFFF                LEA    ESI, [EBP-180] ;  MB
   60| 00021C 56                          PUSH   ESI    
   60| 00021D E800000000                  CALL   lab2_allcomp.modu_io.matrixinput 
;  Source Line # 61
   61| 000222 6800000000                  PUSH   __lcl.00000380 
   61| 000227 6800000000                  PUSH   __lcl.00000382 
   61| 00022C E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 62
   62| 000231 8DBD70FFFFFF                LEA    EDI, [EBP-144] ;  MC
   62| 000237 57                          PUSH   EDI    
   62| 000238 E800000000                  CALL   lab2_allcomp.modu_io.matrixinput 
;  Source Line # 63
   63| 00023D 6800000000                  PUSH   __lcl.00000380 
   63| 000242 6800000000                  PUSH   __lcl.00000383 
   63| 000247 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 64
   64| 00024C 8D45B8                      LEA    EAX, [EBP-72] ;  MM
   64| 00024F 50                          PUSH   EAX    
   64| 000250 E800000000                  CALL   lab2_allcomp.modu_io.matrixinput 
;  Source Line # 65
   65| 000255 8D5DB8                      LEA    EBX, [EBP-72] ;  MM
   65| 000258 53                          PUSH   EBX    
   65| 000259 8D4D94                      LEA    ECX, [EBP-108] ;  MD
   65| 00025C 51                          PUSH   ECX    
   65| 00025D 8D9570FFFFFF                LEA    EDX, [EBP-144] ;  MC
   65| 000263 52                          PUSH   EDX    
   65| 000264 8DB54CFFFFFF                LEA    ESI, [EBP-180] ;  MB
   65| 00026A 56                          PUSH   ESI    
   65| 00026B 8DBD28FFFFFF                LEA    EDI, [EBP-216] ;  MA
   65| 000271 57                          PUSH   EDI    
   65| 000272 E800000000                  CALL   lab2_allcomp.modu_f2.func2 
;  Source Line # 66
   66| 000277 6800000000                  PUSH   __lcl.00000377 
   66| 00027C 6800000000                  PUSH   __lcl.00000384 
   66| 000281 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 67
   67| 000286 8D45B8                      LEA    EAX, [EBP-72] ;  MM
   67| 000289 50                          PUSH   EAX    
   67| 00028A E800000000                  CALL   lab2_allcomp.modu_io.matrixoutput 
;  Source Line # 70
   70| 00028F 6800000000                  PUSH   __lcl.00000369 
   70| 000294 6800000000                  PUSH   __lcl.00000385 
   70| 000299 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 71
   71| 00029E 6800000000                  PUSH   __lcl.00000380 
   71| 0002A3 6800000000                  PUSH   __lcl.00000379 
   71| 0002A8 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 72
   72| 0002AD 8D9D28FFFFFF                LEA    EBX, [EBP-216] ;  MA
   72| 0002B3 53                          PUSH   EBX    
   72| 0002B4 E800000000                  CALL   lab2_allcomp.modu_io.matrixinput 
;  Source Line # 73
   73| 0002B9 6800000000                  PUSH   __lcl.00000380 
   73| 0002BE 6800000000                  PUSH   __lcl.00000381 
   73| 0002C3 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 74
   74| 0002C8 8D8D4CFFFFFF                LEA    ECX, [EBP-180] ;  MB
   74| 0002CE 51                          PUSH   ECX    
   74| 0002CF E800000000                  CALL   lab2_allcomp.modu_io.matrixinput 
;  Source Line # 75
   75| 0002D4 6800000000                  PUSH   __lcl.00000375 
   75| 0002D9 6800000000                  PUSH   __lcl.00000374 
   75| 0002DE E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 76
   76| 0002E3 6A00                        PUSH   0      
   76| 0002E5 8D55DC                      LEA    EDX, [EBP-36] ;  e
   76| 0002E8 52                          PUSH   EDX    
   76| 0002E9 E800000000                  CALL   ada.integer_text_io.get__2 
;  Source Line # 77
   77| 0002EE FF75DC                      PUSH   DWORD PTR [EBP-36] ;  e
   77| 0002F1 8DB54CFFFFFF                LEA    ESI, [EBP-180] ;  MB
   77| 0002F7 56                          PUSH   ESI    
   77| 0002F8 8DBD28FFFFFF                LEA    EDI, [EBP-216] ;  MA
   77| 0002FE 57                          PUSH   EDI    
   77| 0002FF E800000000                  CALL   lab2_allcomp.modu_f3.func3 
   77| 000304 8945E0                      MOV    [EBP-32], EAX ;  p
;  Source Line # 78
   78| 000307 6800000000                  PUSH   __lcl.00000377 
   78| 00030C 6800000000                  PUSH   __lcl.00000386 
   78| 000311 E800000000                  CALL   ada.text_io.put_line__2 
;  Source Line # 79
   79| 000316 0FB61D00000000              MOVZX  EBX, BYTE PTR ada.integer_text_io.default_base 
   79| 00031D 53                          PUSH   EBX    
   79| 00031E FF3500000000                PUSH   DWORD PTR ada.integer_text_io.default_width 
   79| 000324 FF75E0                      PUSH   DWORD PTR [EBP-32] ;  p
   79| 000327 E800000000                  CALL   ada.integer_text_io.put__2 
;  Source Line # 80
   80| 00032C 8B95ECFEFFFF                MOV    EDX, [EBP-276] ; Spill
   80| 000332 8B4DFC                      MOV    ECX, [EBP-4] 
   80| 000335 894A30                      MOV    [EDX+48], ECX 
   80| 000338 8BE5                        MOV    ESP, EBP 
   80| 00033A 5D                          POP    EBP    
   80| 00033B C3                          RET           
                       ;                                
                       lab2_allcomp       ENDP          

; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000398     DD     00004303 
                                          DD     00000016 
                                          DD     00000000 
                                          DD     __lcl.00000424 
                                          DD     00000017 
                                          DD     00000023 
                                          DD     __lcl.00000424 
                                          DD     0000001A 
                                          DD     0000003C 
                                          DD     __lcl.00000425 
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
                                          DD     0000001A 
                                          DD     0000007C 
                                          DD     __lcl.00000424 
                                          DD     0000000F 
                                          DD     0000008F 
                                          DD     __lcl.00000426 
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
                                          DD     0000001D 
                                          DD     000000CF 
                                          DD     __lcl.00000424 
                                          DD     0000001D 
                                          DD     000000E2 
                                          DD     __lcl.00000427 
                                          DD     00000005 
                                          DD     000000E6 
                                          DD     __lcl.00000422 
                                          DD     00000020 
                                          DD     000000EA 
                                          DD     __lcl.00000424 
                                          DD     00000020 
                                          DD     000000FD 
                                          DD     __lcl.00000428 
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
                                          DD     00000029 
                                          DD     0000011D 
                                          DD     __lcl.00000424 
                                          DD     0000002A 
                                          DD     0000012C 
                                          DD     __lcl.00000424 
                                          DD     0000002B 
                                          DD     0000013B 
                                          DD     __lcl.00000424 
                                          DD     0000002C 
                                          DD     00000147 
                                          DD     __lcl.00000424 
                                          DD     0000002D 
                                          DD     00000156 
                                          DD     __lcl.00000424 
                                          DD     0000002E 
                                          DD     00000162 
                                          DD     __lcl.00000424 
                                          DD     0000002F 
                                          DD     00000171 
                                          DD     __lcl.00000424 
                                          DD     00000030 
                                          DD     0000017D 
                                          DD     __lcl.00000424 
                                          DD     00000031 
                                          DD     0000018C 
                                          DD     __lcl.00000424 
                                          DD     00000032 
                                          DD     00000197 
                                          DD     __lcl.00000424 
                                          DD     00000033 
                                          DD     000001BB 
                                          DD     __lcl.00000424 
                                          DD     00000034 
                                          DD     000001CA 
                                          DD     __lcl.00000424 
                                          DD     00000035 
                                          DD     000001D6 
                                          DD     __lcl.00000424 
                                          DD     00000038 
                                          DD     000001DD 
                                          DD     __lcl.00000424 
                                          DD     00000039 
                                          DD     000001EC 
                                          DD     __lcl.00000424 
                                          DD     0000003A 
                                          DD     000001FB 
                                          DD     __lcl.00000424 
                                          DD     0000003B 
                                          DD     00000207 
                                          DD     __lcl.00000424 
                                          DD     0000003C 
                                          DD     00000216 
                                          DD     __lcl.00000424 
                                          DD     0000003D 
                                          DD     00000222 
                                          DD     __lcl.00000424 
                                          DD     0000003E 
                                          DD     00000231 
                                          DD     __lcl.00000424 
                                          DD     0000003F 
                                          DD     0000023D 
                                          DD     __lcl.00000424 
                                          DD     00000040 
                                          DD     0000024C 
                                          DD     __lcl.00000424 
                                          DD     00000041 
                                          DD     00000255 
                                          DD     __lcl.00000424 
                                          DD     00000042 
                                          DD     00000277 
                                          DD     __lcl.00000424 
                                          DD     00000043 
                                          DD     00000286 
                                          DD     __lcl.00000424 
                                          DD     00000046 
                                          DD     0000028F 
                                          DD     __lcl.00000424 
                                          DD     00000047 
                                          DD     0000029E 
                                          DD     __lcl.00000424 
                                          DD     00000048 
                                          DD     000002AD 
                                          DD     __lcl.00000424 
                                          DD     00000049 
                                          DD     000002B9 
                                          DD     __lcl.00000424 
                                          DD     0000004A 
                                          DD     000002C8 
                                          DD     __lcl.00000424 
                                          DD     0000004B 
                                          DD     000002D4 
                                          DD     __lcl.00000424 
                                          DD     0000004C 
                                          DD     000002E3 
                                          DD     __lcl.00000424 
                                          DD     0000004D 
                                          DD     000002EE 
                                          DD     __lcl.00000424 
                                          DD     0000004E 
                                          DD     00000307 
                                          DD     __lcl.00000424 
                                          DD     0000004F 
                                          DD     00000316 
                                          DD     __lcl.00000424 
                                          DD     00000050 
                                          DD     0000032C 
                                          DD     __lcl.00000424 
                                          DD     00000050 
                                          DD     0000033B 
                                          DD     __lcl.00000424 
; ********* End of segment, Total Size = 808


; ************* Constant segment :
                                          ALIGN 4       
     000000            __lcl.00000386     DB     'Func3 result' 
     00000C            __lcl.00000385     DB     'Func3' 
     000011            __lcl.00000384     DB     'Func2 result' 
     00001D            __lcl.00000383     DB     'Input matrix MM' 
     00002C            __lcl.00000382     DB     'Input matrix MC' 
     00003B            __lcl.00000381     DB     'Input matrix MB' 
                                          DW     0000   
     00004C            __lcl.00000380     DD     00000001 
                                          DD     0000000F 
     000054            __lcl.00000379     DB     'Input matrix MA' 
     000063            __lcl.00000378     DB     'Func2' 
     000068            __lcl.00000377     DD     00000001 
                                          DD     0000000C 
     000070            __lcl.00000376     DB     'Func1 result' 
     00007C            __lcl.00000375     DD     00000001 
                                          DD     00000007 
     000084            __lcl.00000374     DB     'Input E' 
     00008B            __lcl.00000373     DB     'Input vector D' 
     000099            __lcl.00000372     DB     'Input vector C' 
                                          DB     00     
     0000A8            __lcl.00000371     DD     00000001 
                                          DD     0000000E 
     0000B0            __lcl.00000370     DB     'Input vector B' 
                                          DW     0000   
     0000C0            __lcl.00000369     DD     00000001 
                                          DD     00000005 
     0000C8            __lcl.00000368     DB     'Func1' 
                                          DB     00H,00H,00H 
     0000D0            __lcl.00000344     DD     00000001 
                                          DD     0000000C 
     0000D8            __lcl.00000343     DB     'Input matrix' 
     0000E4            __lcl.00000342     DD     00000001 
                                          DD     00000003 
     0000EC            __lcl.00000341     DB     ' : '  
                                          DB     00     
     0000F0            __lcl.00000340     DD     00000001 
                                          DD     00000001 
     0000F8            __lcl.00000339     DB     'x'    
                                          DB     00H,00H,00H 
     0000FC            __lcl.00000338     DD     00000001 
                                          DD     0000000D 
     000104            __lcl.00000337     DB     'Enter matrix ' 
                                          DB     00H,00H,00H 
     000114            __lcl.00000328     DD     00000001 
                                          DD     0000001F 
     00011C            __lcl.00000327     DB     'Input error. Please, try again:' 
                                          DB     00     
     00013C            __lcl.00000320     DD     00000001 
                                          DD     0000000A 
     000144            __lcl.00000319     DB     ' numbers: ' 
                                          DW     0000   
     000150            __lcl.00000318     DD     00000001 
                                          DD     0000000F 
     000158            __lcl.00000317     DB     'Enter vector - ' 
     000167            __lcl.00000302     DB     ')'    
     000168            __lcl.00000292     DD     00000001 
                                          DD     00000001 
     000170            __lcl.00000291     DB     '('    
                                          DB     00H,00H,00H 
     000174            __lcl.00000285     DD     00000001 
                                          DD     00000019 
     00017C            __lcl.00000284     DB     'Constraint error in Func3' 
                                          DB     00H,00H,00H 
     000198            __lcl.00000122     DD     00000001 
                                          DD     00000019 
     0001A0            __lcl.00000121     DB     'Constraint error in Func2' 
                                          DB     00H,00H,00H 
     0001BC            __lcl.00000099     DD     00000001 
                                          DD     0000001A 
     0001C4            __lcl.00000098     DB     'Constraint error in Func1.' 
                                          DW     0000   
     0001E0            lab2_allcomp.modu.n DD    00000003 
; ********* End of segment, Total Size = 484


; ************* .av_evt$R segment :
                                          ALIGN 4       
     000000            lab2_allcomp__rootpart____1 DD lab2_allcomp__subp_body_subpdesc____1 
; ********* End of segment, Total Size = 4


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000397     DB     1D     
                                          DB     2E     
                                          DB     2E     
                                          DB     5C     
                                          DB     76     
                                          DB     65     
                                          DB     63     
                                          DB     74     
                                          DB     6F     
                                          DB     72     
                                          DB     5F     
                                          DB     66     
                                          DB     31     
                                          DB     2D     
                                          DB     6D     
                                          DB     61     
                                          DB     74     
                                          DB     72     
                                          DB     69     
                                          DB     78     
                                          DB     5F     
                                          DB     66     
                                          DB     32     
                                          DB     2D     
                                          DB     66     
                                          DB     33     
                                          DB     2E     
                                          DB     61     
                                          DB     64     
                                          DB     73     
                                          DB     00     
                                          DB     00     
     000020            __lcl.00000396     DB     10     
                                          DB     2E     
                                          DB     2E     
                                          DB     5C     
                                          DB     76     
                                          DB     65     
                                          DB     63     
                                          DB     74     
                                          DB     6F     
                                          DB     72     
                                          DB     5F     
                                          DB     66     
                                          DB     31     
                                          DB     2E     
                                          DB     61     
                                          DB     64     
                                          DB     73     
                                          DB     00     
                                          DW     0000   
     000034            __lcl.00000395     DB     1A     
                                          DB     2E     
                                          DB     2E     
                                          DB     5C     
                                          DB     76     
                                          DB     65     
                                          DB     63     
                                          DB     74     
                                          DB     6F     
                                          DB     72     
                                          DB     5F     
                                          DB     66     
                                          DB     31     
                                          DB     2D     
                                          DB     6D     
                                          DB     61     
                                          DB     74     
                                          DB     72     
                                          DB     69     
                                          DB     78     
                                          DB     5F     
                                          DB     66     
                                          DB     32     
                                          DB     2E     
                                          DB     61     
                                          DB     64     
                                          DB     73     
                                          DB     00     
     000050            __lcl.00000394     DB     1E     
                                          DB     2E     
                                          DB     2E     
                                          DB     5C     
                                          DB     76     
                                          DB     65     
                                          DB     63     
                                          DB     74     
                                          DB     6F     
                                          DB     72     
                                          DB     5F     
                                          DB     66     
                                          DB     31     
                                          DB     2D     
                                          DB     6D     
                                          DB     61     
                                          DB     74     
                                          DB     72     
                                          DB     69     
                                          DB     78     
                                          DB     5F     
                                          DB     66     
                                          DB     32     
                                          DB     2D     
                                          DB     66     
                                          DB     69     
                                          DB     6F     
                                          DB     2E     
                                          DB     61     
                                          DB     64     
                                          DB     73     
                                          DB     00     
     000070            __lcl.00000393     DB     13H    
                                          DB     '..\lab2 allcomp.adb' 
                                          DB     00H    
                                          DB     00H,00H,00H 
     000088            __lcl.00000392     DB     0CH    
                                          DB     'Lab2_ALLComp' 
                                          DB     00H    
                                          DW     0000   
     000098            lab2_allcomp__subp_body_subpdesc____1 DD __lcl.00000392 
                                          DD     lab2_allcomp 
                                          DD     __lcl.00000393 
                                          DD     00000016 
                                          DD     00000027 
                                          DD     00000050 
                                          DD     00000000 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000387 
                                          DD     00000000 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000388 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000398 
                                          DD     00000114 
                                          DD     __lcl.00000001 
     0000FC            __lcl.00000391     DB     01H    
                                          DB     'C'    
                                          DB     00H    
                                          DB     00     
     000100            __lcl.00000390     DB     01H    
                                          DB     'D'    
                                          DB     00H    
                                          DB     00     
     000104            __lcl.00000389     DB     01H    
                                          DB     'p'    
                                          DB     00H    
                                          DB     00     
     000108            __lcl.00000388     DD     0000000B 
                                          DD     __lcl.00000389 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFE0 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000094 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFDC 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000125 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     FFFFFFB8 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000124 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     FFFFFF94 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000126 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     FFFFFF70 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000127 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     FFFFFF4C 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000128 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     FFFFFF28 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000390 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     FFFFFF1C 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000391 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     FFFFFF10 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000067 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     FFFFFF04 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000068 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     FFFFFEF8 
                                          DD     00000003 
                                          DD     00000000 
     0001E8            __lcl.00000387     DD     00000004 
                                          DD     lab2_allcomp.modu__pkg_subpdesc____1 
                                          DD     lab2_allcomp.modu_f2__pkg_subpdesc____1 
                                          DD     lab2_allcomp.modu_f3__pkg_subpdesc____1 
                                          DD     lab2_allcomp.modu_io__pkg_subpdesc____1 
     0001FC            __lcl.00000367     DB     07H    
                                          DB     'Modu_IO' 
                                          DB     00H    
                                          DB     00H,00H,00H 
     000208            lab2_allcomp.modu_io__pkg_subpdesc____1 DD __lcl.00000367 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000301 
                                          DD     00000005 
                                          DD     00000045 
                                          DD     00000045 
                                          DD     00000001 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000366 
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
     00026C            __lcl.00000366     DD     00000004 
                                          DD     lab2_allcomp.modu_io.vectoutput__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu_io.matrixoutput__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu_io.vectinput__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu_io.matrixinput__subp_body_subpdesc____1 
     000280            __lcl.00000365     DB     07H    
                                          DB     'Modu_F3' 
                                          DB     00H    
                                          DB     00H,00H,00H 
     00028C            lab2_allcomp.modu_f3__pkg_subpdesc____1 DD __lcl.00000365 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000290 
                                          DD     00000002 
                                          DD     00000010 
                                          DD     00000010 
                                          DD     00000001 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000364 
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
     0002F0            __lcl.00000364     DD     00000001 
                                          DD     lab2_allcomp.modu_f3.func3__subp_body_subpdesc____1 
     0002F8            __lcl.00000363     DB     07H    
                                          DB     'Modu_F2' 
                                          DB     00H    
                                          DB     00H,00H,00H 
     000304            lab2_allcomp.modu_f2__pkg_subpdesc____1 DD __lcl.00000363 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000130 
                                          DD     00000002 
                                          DD     0000006A 
                                          DD     0000006A 
                                          DD     00000001 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000361 
                                          DD     __lcl.00000362 
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
     000368            __lcl.00000362     DD     00000008 
                                          DD     lab2_allcomp.modu_f2.func2__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu_f2.matrixmult__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu_f2.matrixsum__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu_f2.matrixrizn__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu_f2.multimatrnum__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu_f2.matrixsort__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu_f2.matrixmax__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu_f2.matrixmin__subp_body_subpdesc____1 
     00038C            __lcl.00000361     DD     00000001 
                                          DD     __lcl.00000120 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
     000398            __lcl.00000360     DB     04H    
                                          DB     'Modu' 
                                          DB     00H    
                                          DW     0000   
     0003A0            lab2_allcomp.modu__pkg_subpdesc____1 DD __lcl.00000360 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000022 
                                          DD     0000000D 
                                          DD     00000067 
                                          DD     00000067 
                                          DD     00000001 
                                          DD     00000001 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000356 
                                          DD     __lcl.00000358 
                                          DD     __lcl.00000359 
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
     000404            __lcl.00000359     DD     00000008 
                                          DD     lab2_allcomp.modu.vectmult__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu.vectsum__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu.vectsort__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu.plusvect__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu.minusvect__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu.multivectnum__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu.func1__subp_body_subpdesc____1 
                                          DD     lab2_allcomp.modu.multiplystep__subp_body_subpdesc____1 
     000428            __lcl.00000358     DD     00000001 
                                          DD     __lcl.00000012 
                                          DD     lab2_allcomp.modu.vector__typeform 
     000434            __lcl.00000357     DB     01H    
                                          DB     'N'    
                                          DB     00H    
                                          DB     00     
     000438            __lcl.00000356     DD     00000001 
                                          DD     __lcl.00000357 
                                          DD     00000000 
                                          DD     __lcl.00000006 
     000448            __lcl.00000355     DB     0BH    
                                          DB     'MatrixInput' 
                                          DB     00H    
                                          DB     00H,00H,00H 
     000458            lab2_allcomp.modu_io.matrixinput__subp_body_subpdesc____1 DD __lcl.00000355 
                                          DD     lab2_allcomp.modu_io.matrixinput 
                                          DD     __lcl.00000301 
                                          DD     00000038 
                                          DD     00000038 
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
                                          DD     __lcl.00000353 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000354 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000399 
                                          DD     00000004 
                                          DD     __lcl.00000001 
     0004BC            __lcl.00000354     DD     00000001 
                                          DD     __lcl.00000352 
     0004C4            __lcl.00000353     DD     00000001 
                                          DD     __lcl.00000238 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     00000008 
                                          DD     00000102 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0004E0            __lcl.00000352     DB     8 DUP(00) 
                                          DD     __lcl.00000301 
                                          DD     00000040 
                                          DD     00000040 
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
                                          DD     __lcl.00000351 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000544            __lcl.00000351     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000350 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     00055C            __lcl.00000350     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000347 
                                          DD     __lcl.00000348 
                                          DD     __lcl.00000349 
     000578            __lcl.00000349     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000584            __lcl.00000348     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000590            __lcl.00000347     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000345 
                                          DD     __lcl.00000346 
     0005AC            __lcl.00000346     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0005B8            __lcl.00000345     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0005C4            __lcl.00000336     DB     09H    
                                          DB     'VectInput' 
                                          DB     00H    
                                          DB     00     
     0005D0            lab2_allcomp.modu_io.vectinput__subp_body_subpdesc____1 DD __lcl.00000336 
                                          DD     lab2_allcomp.modu_io.vectinput 
                                          DD     __lcl.00000301 
                                          DD     00000022 
                                          DD     00000022 
                                          DD     00000034 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000334 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000335 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000400 
                                          DD     0000001C 
                                          DD     __lcl.00000001 
     000634            __lcl.00000335     DD     00000001 
                                          DD     __lcl.00000333 
     00063C            __lcl.00000334     DD     00000001 
                                          DD     __lcl.00000025 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     00000008 
                                          DD     00000102 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000658            __lcl.00000333     DB     8 DUP(00) 
                                          DD     __lcl.00000301 
                                          DD     00000027 
                                          DD     00000027 
                                          DD     00000032 
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
                                          DD     __lcl.00000331 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000332 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0006BC            __lcl.00000332     DD     00000001 
                                          DD     __lcl.00000329 
     0006C4            __lcl.00000331     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000326 
                                          DD     FFFFFFEC 
                                          DD     00000003 
                                          DD     00000001 
     0006DC            __lcl.00000330     DB     08H    
                                          DB     'Begin#41' 
                                          DB     00H    
                                          DW     0000   
     0006E8            __lcl.00000329     DD     __lcl.00000330 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000301 
                                          DD     00000029 
                                          DD     00000029 
                                          DD     00000030 
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
     00074C            __lcl.00000326     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000323 
                                          DD     __lcl.00000324 
                                          DD     __lcl.00000325 
     000768            __lcl.00000325     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000774            __lcl.00000324     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000780            __lcl.00000323     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000321 
                                          DD     __lcl.00000322 
     00079C            __lcl.00000322     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0007A8            __lcl.00000321     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0007B4            __lcl.00000316     DB     0CH    
                                          DB     'MatrixOutput' 
                                          DB     00H    
                                          DW     0000   
     0007C4            lab2_allcomp.modu_io.matrixoutput__subp_body_subpdesc____1 DD __lcl.00000316 
                                          DD     lab2_allcomp.modu_io.matrixoutput 
                                          DD     __lcl.00000301 
                                          DD     00000013 
                                          DD     00000013 
                                          DD     0000001F 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000314 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000315 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000401 
                                          DD     00000004 
                                          DD     __lcl.00000001 
     000828            __lcl.00000315     DD     00000001 
                                          DD     __lcl.00000313 
     000830            __lcl.00000314     DD     00000001 
                                          DD     __lcl.00000025 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     00084C            __lcl.00000313     DB     8 DUP(00) 
                                          DD     __lcl.00000301 
                                          DD     0000001B 
                                          DD     0000001B 
                                          DD     0000001E 
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
                                          DD     __lcl.00000312 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0008B0            __lcl.00000312     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000311 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0008C8            __lcl.00000311     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000308 
                                          DD     __lcl.00000309 
                                          DD     __lcl.00000310 
     0008E4            __lcl.00000310     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0008F0            __lcl.00000309     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0008FC            __lcl.00000308     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000306 
                                          DD     __lcl.00000307 
     000918            __lcl.00000307     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000924            __lcl.00000306     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000930            __lcl.00000305     DB     0AH    
                                          DB     'VectOutput' 
                                          DB     00H    
     00093C            lab2_allcomp.modu_io.vectoutput__subp_body_subpdesc____1 DD __lcl.00000305 
                                          DD     lab2_allcomp.modu_io.vectoutput 
                                          DD     __lcl.00000301 
                                          DD     00000008 
                                          DD     00000008 
                                          DD     00000010 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000303 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000304 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000402 
                                          DD     00000004 
                                          DD     __lcl.00000001 
     0009A0            __lcl.00000304     DD     00000001 
                                          DD     __lcl.00000300 
     0009A8            __lcl.00000303     DD     00000001 
                                          DD     __lcl.00000068 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0009C4            __lcl.00000301     DB     1EH    
                                          DB     '..\vector_f1-matrix_f2-fio.adb' 
                                          DB     00H    
     0009E4            __lcl.00000300     DB     8 DUP(00) 
                                          DD     __lcl.00000301 
                                          DD     0000000B 
                                          DD     0000000B 
                                          DD     0000000D 
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
                                          DD     __lcl.00000299 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000A48            __lcl.00000299     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000298 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000A60            __lcl.00000298     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000295 
                                          DD     __lcl.00000296 
                                          DD     __lcl.00000297 
     000A7C            __lcl.00000297     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000A88            __lcl.00000296     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000A94            __lcl.00000295     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000293 
                                          DD     __lcl.00000294 
     000AB0            __lcl.00000294     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000ABC            __lcl.00000293     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000AC8            __lcl.00000290     DB     1DH    
                                          DB     '..\vector_f1-matrix_f2-f3.adb' 
                                          DB     00H    
                                          DB     00     
     000AE8            __lcl.00000289     DB     05H    
                                          DB     'Func3' 
                                          DB     00H    
                                          DB     00     
     000AF0            lab2_allcomp.modu_f3.func3__subp_body_subpdesc____1 DD __lcl.00000289 
                                          DD     lab2_allcomp.modu_f3.func3 
                                          DD     __lcl.00000290 
                                          DD     00000005 
                                          DD     00000005 
                                          DD     0000000E 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000286 
                                          DD     __lcl.00000288 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000403 
                                          DD     00000064 
                                          DD     __lcl.00000001 
     000B54            __lcl.00000288     DD     00000001 
                                          DD     __lcl.00000153 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFA8 
                                          DD     00000003 
                                          DD     00000000 
     000B6C            __lcl.00000287     DB     01H    
                                          DB     'E'    
                                          DB     00H    
                                          DB     00     
     000B70            __lcl.00000286     DD     00000003 
                                          DD     __lcl.00000287 
                                          DD     __lcl.00000005 
                                          DD     00000010 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000127 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000128 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000BBC            __lcl.00000283     DB     09H    
                                          DB     'MatrixMin' 
                                          DB     00H    
                                          DB     00     
     000BC8            lab2_allcomp.modu_f2.matrixmin__subp_body_subpdesc____1 DD __lcl.00000283 
                                          DD     lab2_allcomp.modu_f2.matrixmin 
                                          DD     __lcl.00000130 
                                          DD     0000005C 
                                          DD     0000005C 
                                          DD     00000068 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000280 
                                          DD     __lcl.00000281 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000282 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000404 
                                          DD     00000010 
                                          DD     __lcl.00000001 
     000C2C            __lcl.00000282     DD     00000001 
                                          DD     __lcl.00000279 
     000C34            __lcl.00000281     DD     00000001 
                                          DD     __lcl.00000260 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000000 
     000C4C            __lcl.00000280     DD     00000001 
                                          DD     __lcl.00000238 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000C68            __lcl.00000279     DB     8 DUP(00) 
                                          DD     __lcl.00000130 
                                          DD     00000060 
                                          DD     00000060 
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
                                          DD     __lcl.00000277 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000278 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000CCC            __lcl.00000278     DD     00000001 
                                          DD     __lcl.00000276 
     000CD4            __lcl.00000277     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000268 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000001 
     000CEC            __lcl.00000276     DB     8 DUP(00) 
                                          DD     __lcl.00000130 
                                          DD     00000061 
                                          DD     00000061 
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
                                          DD     __lcl.00000275 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000D50            __lcl.00000275     DD     00000001 
                                          DD     __lcl.00000144 
                                          DD     __lcl.00000274 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000D68            __lcl.00000274     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000271 
                                          DD     __lcl.00000272 
                                          DD     __lcl.00000273 
     000D84            __lcl.00000273     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000D90            __lcl.00000272     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000D9C            __lcl.00000271     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000269 
                                          DD     __lcl.00000270 
     000DB8            __lcl.00000270     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000DC4            __lcl.00000269     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000DD0            __lcl.00000268     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000265 
                                          DD     __lcl.00000266 
                                          DD     __lcl.00000267 
     000DEC            __lcl.00000267     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000DF8            __lcl.00000266     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000E04            __lcl.00000265     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000263 
                                          DD     __lcl.00000264 
     000E20            __lcl.00000264     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     000E2C            __lcl.00000263     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     000E38            __lcl.00000262     DB     09H    
                                          DB     'MatrixMax' 
                                          DB     00H    
                                          DB     00     
     000E44            lab2_allcomp.modu_f2.matrixmax__subp_body_subpdesc____1 DD __lcl.00000262 
                                          DD     lab2_allcomp.modu_f2.matrixmax 
                                          DD     __lcl.00000130 
                                          DD     0000004D 
                                          DD     0000004D 
                                          DD     00000059 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000258 
                                          DD     __lcl.00000259 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000261 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000405 
                                          DD     00000010 
                                          DD     __lcl.00000001 
     000EA8            __lcl.00000261     DD     00000001 
                                          DD     __lcl.00000257 
     000EB0            __lcl.00000260     DB     03H    
                                          DB     'max'  
                                          DB     00H    
                                          DB     00H,00H,00H 
     000EB8            __lcl.00000259     DD     00000001 
                                          DD     __lcl.00000260 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000000 
     000ED0            __lcl.00000258     DD     00000001 
                                          DD     __lcl.00000238 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     000EEC            __lcl.00000257     DB     8 DUP(00) 
                                          DD     __lcl.00000130 
                                          DD     00000051 
                                          DD     00000051 
                                          DD     00000057 
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
                                          DD     __lcl.00000255 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000256 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000F50            __lcl.00000256     DD     00000001 
                                          DD     __lcl.00000254 
     000F58            __lcl.00000255     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000246 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000001 
     000F70            __lcl.00000254     DB     8 DUP(00) 
                                          DD     __lcl.00000130 
                                          DD     00000052 
                                          DD     00000052 
                                          DD     00000056 
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
                                          DD     __lcl.00000253 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     000FD4            __lcl.00000253     DD     00000001 
                                          DD     __lcl.00000144 
                                          DD     __lcl.00000252 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     000FEC            __lcl.00000252     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000249 
                                          DD     __lcl.00000250 
                                          DD     __lcl.00000251 
     001008            __lcl.00000251     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001014            __lcl.00000250     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001020            __lcl.00000249     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000247 
                                          DD     __lcl.00000248 
     00103C            __lcl.00000248     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001048            __lcl.00000247     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001054            __lcl.00000246     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000243 
                                          DD     __lcl.00000244 
                                          DD     __lcl.00000245 
     001070            __lcl.00000245     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     00107C            __lcl.00000244     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001088            __lcl.00000243     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000241 
                                          DD     __lcl.00000242 
     0010A4            __lcl.00000242     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0010B0            __lcl.00000241     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0010BC            __lcl.00000240     DB     0AH    
                                          DB     'MatrixSort' 
                                          DB     00H    
     0010C8            lab2_allcomp.modu_f2.matrixsort__subp_body_subpdesc____1 DD __lcl.00000240 
                                          DD     lab2_allcomp.modu_f2.matrixsort 
                                          DD     __lcl.00000130 
                                          DD     00000045 
                                          DD     00000045 
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
                                          DD     __lcl.00000237 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000239 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000406 
                                          DD     00000004 
                                          DD     __lcl.00000001 
     00112C            __lcl.00000239     DD     00000001 
                                          DD     __lcl.00000236 
     001134            __lcl.00000238     DB     01H    
                                          DB     'm'    
                                          DB     00H    
                                          DB     00     
     001138            __lcl.00000237     DD     00000001 
                                          DD     __lcl.00000238 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     00000008 
                                          DD     00000102 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     001154            __lcl.00000236     DB     8 DUP(00) 
                                          DD     __lcl.00000130 
                                          DD     00000047 
                                          DD     00000047 
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
                                          DD     __lcl.00000235 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0011B8            __lcl.00000235     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000234 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0011D0            __lcl.00000234     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000231 
                                          DD     __lcl.00000232 
                                          DD     __lcl.00000233 
     0011EC            __lcl.00000233     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0011F8            __lcl.00000232     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001204            __lcl.00000231     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000229 
                                          DD     __lcl.00000230 
     001220            __lcl.00000230     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     00122C            __lcl.00000229     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001238            __lcl.00000228     DB     0CH    
                                          DB     'MultiMatrNum' 
                                          DB     00H    
                                          DW     0000   
     001248            lab2_allcomp.modu_f2.multimatrnum__subp_body_subpdesc____1 DD __lcl.00000228 
                                          DD     lab2_allcomp.modu_f2.multimatrnum 
                                          DD     __lcl.00000130 
                                          DD     00000038 
                                          DD     00000038 
                                          DD     00000042 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000224 
                                          DD     __lcl.00000225 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000227 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000407 
                                          DD     00000030 
                                          DD     __lcl.00000001 
     0012AC            __lcl.00000227     DD     00000001 
                                          DD     __lcl.00000223 
     0012B4            __lcl.00000226     DB     03H    
                                          DB     'buf'  
                                          DB     00H    
                                          DB     00H,00H,00H 
     0012BC            __lcl.00000225     DD     00000001 
                                          DD     __lcl.00000226 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     FFFFFFD4 
                                          DD     00000003 
                                          DD     00000000 
     0012D4            __lcl.00000224     DD     00000002 
                                          DD     __lcl.00000094 
                                          DD     __lcl.00000005 
                                          DD     00000010 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000068 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     001308            __lcl.00000223     DB     8 DUP(00) 
                                          DD     __lcl.00000130 
                                          DD     0000003C 
                                          DD     0000003C 
                                          DD     00000040 
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
                                          DD     __lcl.00000221 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000222 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00136C            __lcl.00000222     DD     00000001 
                                          DD     __lcl.00000220 
     001374            __lcl.00000221     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000211 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000001 
     00138C            __lcl.00000220     DB     8 DUP(00) 
                                          DD     __lcl.00000130 
                                          DD     0000003D 
                                          DD     0000003D 
                                          DD     0000003F 
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
                                          DD     __lcl.00000218 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0013F0            __lcl.00000219     DB     01H    
                                          DB     'J'    
                                          DB     00H    
                                          DB     00     
     0013F4            __lcl.00000218     DD     00000001 
                                          DD     __lcl.00000219 
                                          DD     __lcl.00000217 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     00140C            __lcl.00000217     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000214 
                                          DD     __lcl.00000215 
                                          DD     __lcl.00000216 
     001428            __lcl.00000216     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001434            __lcl.00000215     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001440            __lcl.00000214     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000212 
                                          DD     __lcl.00000213 
     00145C            __lcl.00000213     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001468            __lcl.00000212     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001474            __lcl.00000211     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000208 
                                          DD     __lcl.00000209 
                                          DD     __lcl.00000210 
     001490            __lcl.00000210     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     00149C            __lcl.00000209     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0014A8            __lcl.00000208     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000206 
                                          DD     __lcl.00000207 
     0014C4            __lcl.00000207     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0014D0            __lcl.00000206     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0014DC            __lcl.00000205     DB     0AH    
                                          DB     'MatrixRizn' 
                                          DB     00H    
     0014E8            lab2_allcomp.modu_f2.matrixrizn__subp_body_subpdesc____1 DD __lcl.00000205 
                                          DD     lab2_allcomp.modu_f2.matrixrizn 
                                          DD     __lcl.00000130 
                                          DD     0000002D 
                                          DD     0000002D 
                                          DD     00000036 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000202 
                                          DD     __lcl.00000203 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000204 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000408 
                                          DD     00000030 
                                          DD     __lcl.00000001 
     00154C            __lcl.00000204     DD     00000001 
                                          DD     __lcl.00000201 
     001554            __lcl.00000203     DD     00000001 
                                          DD     __lcl.00000040 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     FFFFFFD4 
                                          DD     00000003 
                                          DD     00000000 
     00156C            __lcl.00000202     DD     00000002 
                                          DD     __lcl.00000024 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000025 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0015A0            __lcl.00000201     DB     8 DUP(00) 
                                          DD     __lcl.00000130 
                                          DD     00000030 
                                          DD     00000030 
                                          DD     00000034 
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
                                          DD     __lcl.00000199 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000200 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001604            __lcl.00000200     DD     00000001 
                                          DD     __lcl.00000198 
     00160C            __lcl.00000199     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000190 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000001 
     001624            __lcl.00000198     DB     8 DUP(00) 
                                          DD     __lcl.00000130 
                                          DD     00000031 
                                          DD     00000031 
                                          DD     00000033 
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
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001688            __lcl.00000197     DD     00000001 
                                          DD     __lcl.00000144 
                                          DD     __lcl.00000196 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0016A0            __lcl.00000196     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000193 
                                          DD     __lcl.00000194 
                                          DD     __lcl.00000195 
     0016BC            __lcl.00000195     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0016C8            __lcl.00000194     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0016D4            __lcl.00000193     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000191 
                                          DD     __lcl.00000192 
     0016F0            __lcl.00000192     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0016FC            __lcl.00000191     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001708            __lcl.00000190     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000187 
                                          DD     __lcl.00000188 
                                          DD     __lcl.00000189 
     001724            __lcl.00000189     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001730            __lcl.00000188     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00173C            __lcl.00000187     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000185 
                                          DD     __lcl.00000186 
     001758            __lcl.00000186     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001764            __lcl.00000185     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001770            __lcl.00000184     DB     09H    
                                          DB     'MatrixSum' 
                                          DB     00H    
                                          DB     00     
     00177C            lab2_allcomp.modu_f2.matrixsum__subp_body_subpdesc____1 DD __lcl.00000184 
                                          DD     lab2_allcomp.modu_f2.matrixsum 
                                          DD     __lcl.00000130 
                                          DD     00000021 
                                          DD     00000021 
                                          DD     0000002A 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000181 
                                          DD     __lcl.00000182 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000183 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000409 
                                          DD     00000030 
                                          DD     __lcl.00000001 
     0017E0            __lcl.00000183     DD     00000001 
                                          DD     __lcl.00000180 
     0017E8            __lcl.00000182     DD     00000001 
                                          DD     __lcl.00000040 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     FFFFFFD4 
                                          DD     00000003 
                                          DD     00000000 
     001800            __lcl.00000181     DD     00000002 
                                          DD     __lcl.00000024 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000025 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     001834            __lcl.00000180     DB     8 DUP(00) 
                                          DD     __lcl.00000130 
                                          DD     00000024 
                                          DD     00000024 
                                          DD     00000028 
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
                                          DD     __lcl.00000178 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000179 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001898            __lcl.00000179     DD     00000001 
                                          DD     __lcl.00000177 
     0018A0            __lcl.00000178     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000169 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000001 
     0018B8            __lcl.00000177     DB     8 DUP(00) 
                                          DD     __lcl.00000130 
                                          DD     00000025 
                                          DD     00000025 
                                          DD     00000027 
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
                                          DD     __lcl.00000176 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00191C            __lcl.00000176     DD     00000001 
                                          DD     __lcl.00000144 
                                          DD     __lcl.00000175 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     001934            __lcl.00000175     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000172 
                                          DD     __lcl.00000173 
                                          DD     __lcl.00000174 
     001950            __lcl.00000174     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     00195C            __lcl.00000173     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001968            __lcl.00000172     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000170 
                                          DD     __lcl.00000171 
     001984            __lcl.00000171     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001990            __lcl.00000170     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00199C            __lcl.00000169     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000166 
                                          DD     __lcl.00000167 
                                          DD     __lcl.00000168 
     0019B8            __lcl.00000168     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0019C4            __lcl.00000167     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0019D0            __lcl.00000166     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000164 
                                          DD     __lcl.00000165 
     0019EC            __lcl.00000165     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0019F8            __lcl.00000164     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001A04            __lcl.00000163     DB     0AH    
                                          DB     'MatrixMult' 
                                          DB     00H    
     001A10            lab2_allcomp.modu_f2.matrixmult__subp_body_subpdesc____1 DD __lcl.00000163 
                                          DD     lab2_allcomp.modu_f2.matrixmult 
                                          DD     __lcl.00000130 
                                          DD     0000000F 
                                          DD     0000000F 
                                          DD     0000001C 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000158 
                                          DD     __lcl.00000159 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000162 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000410 
                                          DD     00000040 
                                          DD     __lcl.00000001 
     001A74            __lcl.00000162     DD     00000001 
                                          DD     __lcl.00000157 
     001A7C            __lcl.00000161     DB     07H    
                                          DB     'RezMatr' 
                                          DB     00H    
                                          DB     00H,00H,00H 
     001A88            __lcl.00000160     DB     01H    
                                          DB     'v'    
                                          DB     00H    
                                          DB     00     
     001A8C            __lcl.00000159     DD     00000002 
                                          DD     __lcl.00000160 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     FFFFFFE8 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000161 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     FFFFFFC4 
                                          DD     00000003 
                                          DD     00000000 
     001AB8            __lcl.00000158     DD     00000002 
                                          DD     __lcl.00000067 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000068 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     001AEC            __lcl.00000157     DB     8 DUP(00) 
                                          DD     __lcl.00000130 
                                          DD     00000013 
                                          DD     00000013 
                                          DD     0000001A 
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
     001B50            __lcl.00000156     DD     00000002 
                                          DD     __lcl.00000145 
                                          DD     __lcl.00000154 
     001B5C            __lcl.00000155     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000136 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000001 
     001B74            __lcl.00000154     DB     8 DUP(00) 
                                          DD     __lcl.00000130 
                                          DD     00000017 
                                          DD     00000017 
                                          DD     00000019 
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
                                          DD     __lcl.00000152 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001BD8            __lcl.00000153     DB     01H    
                                          DB     'k'    
                                          DB     00H    
                                          DB     00     
     001BDC            __lcl.00000152     DD     00000001 
                                          DD     __lcl.00000153 
                                          DD     __lcl.00000151 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     001BF4            __lcl.00000151     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000148 
                                          DD     __lcl.00000149 
                                          DD     __lcl.00000150 
     001C10            __lcl.00000150     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001C1C            __lcl.00000149     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001C28            __lcl.00000148     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000146 
                                          DD     __lcl.00000147 
     001C44            __lcl.00000147     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001C50            __lcl.00000146     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001C5C            __lcl.00000145     DB     8 DUP(00) 
                                          DD     __lcl.00000130 
                                          DD     00000014 
                                          DD     00000014 
                                          DD     00000016 
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
                                          DD     __lcl.00000143 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     001CC0            __lcl.00000144     DB     01H    
                                          DB     'j'    
                                          DB     00H    
                                          DB     00     
     001CC4            __lcl.00000143     DD     00000001 
                                          DD     __lcl.00000144 
                                          DD     __lcl.00000142 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000001 
     001CDC            __lcl.00000142     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000139 
                                          DD     __lcl.00000140 
                                          DD     __lcl.00000141 
     001CF8            __lcl.00000141     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001D04            __lcl.00000140     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001D10            __lcl.00000139     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000137 
                                          DD     __lcl.00000138 
     001D2C            __lcl.00000138     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001D38            __lcl.00000137     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001D44            __lcl.00000136     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000133 
                                          DD     __lcl.00000134 
                                          DD     __lcl.00000135 
     001D60            __lcl.00000135     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001D6C            __lcl.00000134     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001D78            __lcl.00000133     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000131 
                                          DD     __lcl.00000132 
     001D94            __lcl.00000132     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001DA0            __lcl.00000131     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001DAC            __lcl.00000130     DB     1AH    
                                          DB     '..\vector_f1-matrix_f2.adb' 
                                          DB     00H    
     001DC8            __lcl.00000129     DB     05H    
                                          DB     'Func2' 
                                          DB     00H    
                                          DB     00     
     001DD0            lab2_allcomp.modu_f2.func2__subp_body_subpdesc____1 DD __lcl.00000129 
                                          DD     lab2_allcomp.modu_f2.func2 
                                          DD     __lcl.00000130 
                                          DD     00000005 
                                          DD     00000005 
                                          DD     0000000B 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000123 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000411 
                                          DD     00000080 
                                          DD     __lcl.00000001 
     001E34            __lcl.00000128     DB     02H    
                                          DB     'MA'   
                                          DB     00H    
     001E38            __lcl.00000127     DB     02H    
                                          DB     'MB'   
                                          DB     00H    
     001E3C            __lcl.00000126     DB     02H    
                                          DB     'MC'   
                                          DB     00H    
     001E40            __lcl.00000125     DB     02H    
                                          DB     'MM'   
                                          DB     00H    
     001E44            __lcl.00000124     DB     02H    
                                          DB     'MD'   
                                          DB     00H    
     001E48            __lcl.00000123     DD     00000005 
                                          DD     __lcl.00000124 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     00000018 
                                          DD     00000101 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000125 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     00000014 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000126 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000127 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000128 
                                          DD     lab2_allcomp.modu_f2.matrix__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     001EC4            __lcl.00000120     DB     06H    
                                          DB     'Matrix' 
                                          DB     00H    
     001ECC            lab2_allcomp.modu_f2.matrix__typeform DD __lcl.00000120 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000119 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     __lcl.00000118 
     001EE4            __lcl.00000119     DD     00000008 
                                          DD     00000003 
                                          DD     0000000C 
     001EF0            __lcl.00000118     DD     00000001 
                                          DD     __lcl.00000117 
     001EF8            __lcl.00000117     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000115 
                                          DD     __lcl.00000116 
     001F14            __lcl.00000116     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     001F20            __lcl.00000115     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     001F2C            __lcl.00000114     DB     0CH    
                                          DB     'MultiplyStep' 
                                          DB     00H    
                                          DW     0000   
     001F3C            lab2_allcomp.modu.multiplystep__subp_body_subpdesc____1 DD __lcl.00000114 
                                          DD     lab2_allcomp.modu.multiplystep 
                                          DD     __lcl.00000022 
                                          DD     0000005E 
                                          DD     0000005E 
                                          DD     00000065 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000111 
                                          DD     __lcl.00000112 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000113 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000412 
                                          DD     0000000C 
                                          DD     __lcl.00000001 
     001FA0            __lcl.00000113     DD     00000001 
                                          DD     __lcl.00000110 
     001FA8            __lcl.00000112     DD     00000001 
                                          DD     __lcl.00000070 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000000 
     001FC0            __lcl.00000111     DD     00000002 
                                          DD     __lcl.00000067 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000068 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     001FF4            __lcl.00000110     DB     8 DUP(00) 
                                          DD     __lcl.00000022 
                                          DD     00000061 
                                          DD     00000061 
                                          DD     00000063 
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
                                          DD     __lcl.00000109 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002058            __lcl.00000109     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000108 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     002070            __lcl.00000108     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000105 
                                          DD     __lcl.00000106 
                                          DD     __lcl.00000107 
     00208C            __lcl.00000107     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002098            __lcl.00000106     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0020A4            __lcl.00000105     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000103 
                                          DD     __lcl.00000104 
     0020C0            __lcl.00000104     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0020CC            __lcl.00000103     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0020D8            __lcl.00000102     DB     05H    
                                          DB     'Func1' 
                                          DB     00H    
                                          DB     00     
     0020E0            lab2_allcomp.modu.func1__subp_body_subpdesc____1 DD __lcl.00000102 
                                          DD     lab2_allcomp.modu.func1 
                                          DD     __lcl.00000022 
                                          DD     00000056 
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
                                          DD     __lcl.00000100 
                                          DD     __lcl.00000001 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000413 
                                          DD     00000038 
                                          DD     __lcl.00000001 
     002144            __lcl.00000101     DB     01H    
                                          DB     'd'    
                                          DB     00H    
                                          DB     00     
     002148            __lcl.00000100     DD     00000005 
                                          DD     __lcl.00000094 
                                          DD     __lcl.00000005 
                                          DD     00000018 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000101 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     00000014 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000040 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000024 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000025 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     00000008 
                                          DD     00000101 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0021C4            __lcl.00000097     DB     0CH    
                                          DB     'multiVectNum' 
                                          DB     00H    
                                          DW     0000   
     0021D4            lab2_allcomp.modu.multivectnum__subp_body_subpdesc____1 DD __lcl.00000097 
                                          DD     lab2_allcomp.modu.multivectnum 
                                          DD     __lcl.00000022 
                                          DD     00000049 
                                          DD     00000049 
                                          DD     00000050 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000093 
                                          DD     __lcl.00000095 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000096 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000414 
                                          DD     00000014 
                                          DD     __lcl.00000001 
     002238            __lcl.00000096     DD     00000001 
                                          DD     __lcl.00000092 
     002240            __lcl.00000095     DD     00000001 
                                          DD     __lcl.00000070 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     FFFFFFF0 
                                          DD     00000003 
                                          DD     00000000 
     002258            __lcl.00000094     DB     01H    
                                          DB     'e'    
                                          DB     00H    
                                          DB     00     
     00225C            __lcl.00000093     DD     00000002 
                                          DD     __lcl.00000094 
                                          DD     __lcl.00000005 
                                          DD     00000010 
                                          DD     00000000 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000068 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     002290            __lcl.00000092     DB     8 DUP(00) 
                                          DD     __lcl.00000022 
                                          DD     0000004C 
                                          DD     0000004C 
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
                                          DD     __lcl.00000091 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0022F4            __lcl.00000091     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000090 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     00230C            __lcl.00000090     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000087 
                                          DD     __lcl.00000088 
                                          DD     __lcl.00000089 
     002328            __lcl.00000089     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002334            __lcl.00000088     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002340            __lcl.00000087     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000085 
                                          DD     __lcl.00000086 
     00235C            __lcl.00000086     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002368            __lcl.00000085     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002374            __lcl.00000084     DB     09H    
                                          DB     'MinusVect' 
                                          DB     00H    
                                          DB     00     
     002380            lab2_allcomp.modu.minusvect__subp_body_subpdesc____1 DD __lcl.00000084 
                                          DD     lab2_allcomp.modu.minusvect 
                                          DD     __lcl.00000022 
                                          DD     00000040 
                                          DD     00000040 
                                          DD     00000047 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000081 
                                          DD     __lcl.00000082 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000083 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000415 
                                          DD     00000014 
                                          DD     __lcl.00000001 
     0023E4            __lcl.00000083     DD     00000001 
                                          DD     __lcl.00000080 
     0023EC            __lcl.00000082     DD     00000001 
                                          DD     __lcl.00000070 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     FFFFFFF0 
                                          DD     00000003 
                                          DD     00000000 
     002404            __lcl.00000081     DD     00000002 
                                          DD     __lcl.00000067 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000068 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     002438            __lcl.00000080     DB     8 DUP(00) 
                                          DD     __lcl.00000022 
                                          DD     00000043 
                                          DD     00000043 
                                          DD     00000045 
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
                                          DD     __lcl.00000079 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     00249C            __lcl.00000079     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000078 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0024B4            __lcl.00000078     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000075 
                                          DD     __lcl.00000076 
                                          DD     __lcl.00000077 
     0024D0            __lcl.00000077     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0024DC            __lcl.00000076     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0024E8            __lcl.00000075     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000073 
                                          DD     __lcl.00000074 
     002504            __lcl.00000074     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002510            __lcl.00000073     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     00251C            __lcl.00000072     DB     08H    
                                          DB     'PlusVect' 
                                          DB     00H    
                                          DW     0000   
     002528            lab2_allcomp.modu.plusvect__subp_body_subpdesc____1 DD __lcl.00000072 
                                          DD     lab2_allcomp.modu.plusvect 
                                          DD     __lcl.00000022 
                                          DD     00000037 
                                          DD     00000037 
                                          DD     0000003E 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000066 
                                          DD     __lcl.00000069 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000071 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000416 
                                          DD     00000014 
                                          DD     __lcl.00000001 
     00258C            __lcl.00000071     DD     00000001 
                                          DD     __lcl.00000065 
     002594            __lcl.00000070     DB     03H    
                                          DB     'Rez'  
                                          DB     00H    
                                          DB     00H,00H,00H 
     00259C            __lcl.00000069     DD     00000001 
                                          DD     __lcl.00000070 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     FFFFFFF0 
                                          DD     00000003 
                                          DD     00000000 
     0025B4            __lcl.00000068     DB     01H    
                                          DB     'A'    
                                          DB     00H    
                                          DB     00     
     0025B8            __lcl.00000067     DB     01H    
                                          DB     'B'    
                                          DB     00H    
                                          DB     00     
     0025BC            __lcl.00000066     DD     00000002 
                                          DD     __lcl.00000067 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000068 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0025F0            __lcl.00000065     DB     8 DUP(00) 
                                          DD     __lcl.00000022 
                                          DD     0000003A 
                                          DD     0000003A 
                                          DD     0000003C 
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
                                          DD     __lcl.00000064 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002654            __lcl.00000064     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000063 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     00266C            __lcl.00000063     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000060 
                                          DD     __lcl.00000061 
                                          DD     __lcl.00000062 
     002688            __lcl.00000062     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002694            __lcl.00000061     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0026A0            __lcl.00000060     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000058 
                                          DD     __lcl.00000059 
     0026BC            __lcl.00000059     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     0026C8            __lcl.00000058     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     0026D4            __lcl.00000057     DB     08H    
                                          DB     'VectSort' 
                                          DB     00H    
                                          DW     0000   
     0026E0            lab2_allcomp.modu.vectsort__subp_body_subpdesc____1 DD __lcl.00000057 
                                          DD     lab2_allcomp.modu.vectsort 
                                          DD     __lcl.00000022 
                                          DD     00000026 
                                          DD     00000026 
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
                                          DD     __lcl.00000052 
                                          DD     __lcl.00000053 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000056 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000417 
                                          DD     0000000C 
                                          DD     __lcl.00000001 
     002744            __lcl.00000056     DD     00000001 
                                          DD     __lcl.00000051 
     00274C            __lcl.00000055     DB     04H    
                                          DB     'flag' 
                                          DB     00H    
                                          DW     0000   
     002754            __lcl.00000054     DB     04H    
                                          DB     'help' 
                                          DB     00H    
                                          DW     0000   
     00275C            __lcl.00000053     DD     00000002 
                                          DD     __lcl.00000054 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFF4 
                                          DD     00000003 
                                          DD     00000000 
                                          DD     __lcl.00000055 
                                          DD     __lcl.00000043 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000000 
     002788            __lcl.00000052     DD     00000001 
                                          DD     __lcl.00000025 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     00000008 
                                          DD     00000102 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     0027A4            __lcl.00000051     DB     8 DUP(00) 
                                          DD     __lcl.00000022 
                                          DD     0000002C 
                                          DD     0000002C 
                                          DD     00000033 
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
                                          DD     __lcl.00000050 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002808            __lcl.00000050     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000049 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000001 
     002820            __lcl.00000049     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000046 
                                          DD     __lcl.00000047 
                                          DD     __lcl.00000048 
     00283C            __lcl.00000048     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002848            __lcl.00000047     DD     00000008 
                                          DD     00000003 
                                          DD     00000002 
     002854            __lcl.00000046     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000044 
                                          DD     __lcl.00000045 
     002870            __lcl.00000045     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     00287C            __lcl.00000044     DD     00000008 
                                          DD     00000003 
                                          DD     00000002 
     002888            __lcl.00000043     DB     4 DUP(00) 
                                          DD     00000001 
                                          DD     00000002 
     002894            __lcl.00000042     DB     07H    
                                          DB     'VectSum' 
                                          DB     00H    
                                          DB     00H,00H,00H 
     0028A0            lab2_allcomp.modu.vectsum__subp_body_subpdesc____1 DD __lcl.00000042 
                                          DD     lab2_allcomp.modu.vectsum 
                                          DD     __lcl.00000022 
                                          DD     0000001C 
                                          DD     0000001C 
                                          DD     00000023 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000038 
                                          DD     __lcl.00000039 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000041 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000418 
                                          DD     00000014 
                                          DD     __lcl.00000001 
     002904            __lcl.00000041     DD     00000001 
                                          DD     __lcl.00000037 
     00290C            __lcl.00000040     DB     01H    
                                          DB     'c'    
                                          DB     00H    
                                          DB     00     
     002910            __lcl.00000039     DD     00000001 
                                          DD     __lcl.00000040 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     FFFFFFF0 
                                          DD     00000003 
                                          DD     00000000 
     002928            __lcl.00000038     DD     00000002 
                                          DD     __lcl.00000024 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     00000010 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000025 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     00295C            __lcl.00000037     DB     8 DUP(00) 
                                          DD     __lcl.00000022 
                                          DD     0000001F 
                                          DD     0000001F 
                                          DD     00000021 
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
                                          DD     __lcl.00000036 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     0029C0            __lcl.00000036     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000035 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     0029D8            __lcl.00000035     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000032 
                                          DD     __lcl.00000033 
                                          DD     __lcl.00000034 
     0029F4            __lcl.00000034     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002A00            __lcl.00000033     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002A0C            __lcl.00000032     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000030 
                                          DD     __lcl.00000031 
     002A28            __lcl.00000031     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002A34            __lcl.00000030     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002A40            __lcl.00000029     DB     08H    
                                          DB     'VectMult' 
                                          DB     00H    
                                          DW     0000   
     002A4C            lab2_allcomp.modu.vectmult__subp_body_subpdesc____1 DD __lcl.00000029 
                                          DD     lab2_allcomp.modu.vectmult 
                                          DD     __lcl.00000022 
                                          DD     00000011 
                                          DD     00000011 
                                          DD     00000019 
                                          DD     00000000 
                                          DD     00000002 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000005 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     __lcl.00000023 
                                          DD     __lcl.00000026 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000028 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000419 
                                          DD     0000000C 
                                          DD     __lcl.00000001 
     002AB0            __lcl.00000028     DD     00000001 
                                          DD     __lcl.00000021 
     002AB8            __lcl.00000027     DB     03H    
                                          DB     'sum'  
                                          DB     00H    
                                          DB     00H,00H,00H 
     002AC0            __lcl.00000026     DD     00000001 
                                          DD     __lcl.00000027 
                                          DD     __lcl.00000005 
                                          DD     FFFFFFF8 
                                          DD     00000003 
                                          DD     00000000 
     002AD8            __lcl.00000025     DB     01H    
                                          DB     'a'    
                                          DB     00H    
                                          DB     00     
     002ADC            __lcl.00000024     DB     01H    
                                          DB     'b'    
                                          DB     00H    
                                          DB     00     
     002AE0            __lcl.00000023     DD     00000002 
                                          DD     __lcl.00000024 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     0000000C 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
                                          DD     __lcl.00000025 
                                          DD     lab2_allcomp.modu.vector__typeform 
                                          DD     00000008 
                                          DD     00000100 
                                          DB     4 DUP(00) 
                                          DD     00000000 
     002B14            __lcl.00000022     DB     10H    
                                          DB     '..\vector_f1.adb' 
                                          DB     00H    
                                          DW     0000   
     002B28            __lcl.00000021     DB     8 DUP(00) 
                                          DD     __lcl.00000022 
                                          DD     00000015 
                                          DD     00000015 
                                          DD     00000017 
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
                                          DD     __lcl.00000019 
                                          DB     4 DUP(00) 
                                          DD     __lcl.00000001 
                                          DD     __lcl.00000001 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     00000000 
                                          DD     __lcl.00000001 
     002B8C            __lcl.00000020     DB     01H    
                                          DB     'i'    
                                          DB     00H    
                                          DB     00     
     002B90            __lcl.00000019     DD     00000001 
                                          DD     __lcl.00000020 
                                          DD     __lcl.00000018 
                                          DD     FFFFFFFC 
                                          DD     00000003 
                                          DD     00000001 
     002BA8            __lcl.00000018     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000015 
                                          DD     __lcl.00000016 
                                          DD     __lcl.00000017 
     002BC4            __lcl.00000017     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002BD0            __lcl.00000016     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002BDC            __lcl.00000015     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000013 
                                          DD     __lcl.00000014 
     002BF8            __lcl.00000014     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002C04            __lcl.00000013     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002C10            __lcl.00000012     DB     06H    
                                          DB     'Vector' 
                                          DB     00H    
     002C18            lab2_allcomp.modu.vector__typeform DD __lcl.00000012 
                                          DD     00000011 
                                          DD     0001000E 
                                          DD     __lcl.00000011 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000010 
     002C30            __lcl.00000011     DD     00000008 
                                          DD     00000003 
                                          DD     00000004 
     002C3C            __lcl.00000010     DD     00000001 
                                          DD     __lcl.00000009 
     002C44            __lcl.00000009     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000003 
                                          DD     00000001 
                                          DD     __lcl.00000005 
                                          DD     __lcl.00000007 
                                          DD     __lcl.00000008 
     002C60            __lcl.00000008     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002C6C            __lcl.00000007     DD     00000008 
                                          DD     00000003 
                                          DD     00000001 
     002C78            __lcl.00000006     DD     00000008 
                                          DD     00000003 
                                          DD     00000003 
     002C84            __lcl.00000005     DB     4 DUP(00) 
                                          DD     00000012 
                                          DD     00000008 
                                          DD     00000001 
                                          DD     __lcl.00000002 
                                          DD     __lcl.00000003 
                                          DD     __lcl.00000004 
     002CA0            __lcl.00000004     DD     00000008 
                                          DD     00000003 
                                          DD     7FFFFFFF 
     002CAC            __lcl.00000003     DD     00000008 
                                          DD     00000003 
                                          DD     80000000 
     002CB8            __lcl.00000002     DB     4 DUP(00) 
                                          DD     00000002 
                                          DD     00000008 
     002CC4            __lcl.00000001     DD     00000000 
; ********* End of segment, Total Size = 11464


; ************* .av_dbgi segment :
                                          ALIGN 4       
     002CC8            __lcl.00000428     DB     48     
                                          DB     'D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix' 
                                          DB     '_f2-fio.ads' 
                                          DB     00H    
     002D12            __lcl.00000427     DB     47     
                                          DB     'D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix' 
                                          DB     '_f2-f3.ads' 
                                          DB     00H    
     002D5B            __lcl.00000426     DB     44     
                                          DB     'D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix' 
                                          DB     '_f2.ads' 
                                          DB     00H    
     002DA1            __lcl.00000425     DB     3A     
                                          DB     'D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.ads' 
                                          DB     00H    
     002DDD            __lcl.00000424     DB     3D     
                                          DB     'D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\lab2 allcomp.adb' 
                                          DB     00H    
     002E1C            __lcl.00000423     DB     48     
                                          DB     'D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix' 
                                          DB     '_f2-fio.adb' 
                                          DB     00H    
     002E66            __lcl.00000422     DB     47     
                                          DB     'D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix' 
                                          DB     '_f2-f3.adb' 
                                          DB     00H    
     002EAF            __lcl.00000421     DB     44     
                                          DB     'D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1-matrix' 
                                          DB     '_f2.adb' 
                                          DB     00H    
     002EF5            __lcl.00000420     DB     3A     
                                          DB     'D:\Dist\ObjectAda 8.4\PROJECTS\Lab2_SepComp3\vector_f1.adb' 
                                          DB     00H    
; ********* End of segment, Total Size = 12081

                       ;                                
                       CODE               ENDS          

