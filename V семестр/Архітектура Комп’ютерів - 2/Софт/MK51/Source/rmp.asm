
jmp LFG


WAIT: 
mov R0, #2h
W0: mov R1, #0FFh
W1: mov R2, #0FFh
W2: djnz R2, W2
djnz R1, W1
djnz R0, W0
ret

LFG:


mov A, #11h
mov dptr,#0A000h
movx @dptr,a

mov A, #11h
mov dptr,#0B000h
movx @dptr,a

mov A, #10111011b
mov dptr,#0A006h
movx @dptr,a


call WAIT


mov A, #88h
mov dptr,#0A000h
movx @dptr,a

mov A, #88h
mov dptr,#0A001h
movx @dptr,a

mov A, #00100011b
mov dptr,#0A006h
movx @dptr,a

call WAIT


jmp LFG

ZZ:
END

