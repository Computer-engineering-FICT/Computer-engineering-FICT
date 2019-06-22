        MOV     A,#00000001b           ;адрес столбца
        MOV     R7,#11111110b          ;адрес строки (инверсия)

GO:
        ACALL    OUT
        RL      A
        CJNE    A,#00100000b,GO
        MOV     A,R7
        RL      A
        CJNE    A,#01111111b,NOT_OWF
        MOV     A,#11111110b          ;адрес строки (инверсия)
NOT_OWF:
        MOV     R7,A
        MOV     A,#00000001b           ;адрес столбца
        LJMP     GO
OUT:

        MOV     DPTR,#8000h
        MOVX    @DPTR,A

        MOV     DPTR,#8002h
        MOV     R0,A           		 ;промеж. сохранение
        MOV     A,R7
        MOVX    @DPTR,A
        MOV     A,R0

        MOV     R0,#01h
MM:     MOV     R1,#0FFh
M:      MOV     R2,#5Fh
ll3:    DJNZ    R2,ll3
        DJNZ    R1,M
        DJNZ    R0,MM
        RET

        END
