
                                          PAGE   60,132 
                                          TITLE  COMPILATION UNIT Vector_F1.Matrix_F2 
                       ;                                
                       Listing of Generated Code        
                       ;                                
                       EXCEP              RECORD FLAG:1, SPSAV:1, IPCOUNT:6 
                       ;                                
                       CODE               SEGMENT PUBLIC BYTE 'CODE' USE32 ;  Vector_F1.Matrix_F2
                                          ASSUME CS:CODE 
                       ;                                
                       ;  Start of procedure vector_f1.matrix_f2__elab_subp   
                       ;                                
                                          PUBLIC vector_f1.matrix_f2__elab_subp 
                       vector_f1.matrix_f2__elab_subp PROC NEAR 
;  Source Line # 49
   49| 000000 55                          PUSH   EBP    
   49| 000001 8BEC                        MOV    EBP, ESP 
   49| 000003 C6050000000001              MOV    BYTE PTR vector_f1.matrix_f2__elab_bool, 1 
   49| 00000A 8BE5                        MOV    ESP, EBP 
   49| 00000C 5D                          POP    EBP    
   49| 00000D C3                          RET           
                       ;                                
                       vector_f1.matrix_f2__elab_subp ENDP  


; ************* Initialized part of the global segment :
                                          ALIGN 4       
     000000            vector_f1.matrix_f2__elab_bool DB 00 
; ********* End of segment, Total Size = 1


; ************* .av_dbgi segment :
                                          ALIGN 4       
     000000            __lcl.00000001     DD     00000000 
; ********* End of segment, Total Size = 4

                       ;                                
                       CODE               ENDS          

