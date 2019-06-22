
mov dptr,#0b000h
mov a,#80h
movx @dptr,a
mov dptr,#0a000h
mov a,r1
movx @dptr,a
