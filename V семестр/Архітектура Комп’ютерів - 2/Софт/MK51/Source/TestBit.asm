Sjmp Start

Org 0Bh
RetI

Org 1bh
RetI

Org 23h
Start:
Mov IE,#FFh
Mov IP,#Ch
Mov Th0,#E0h
Mov Tl0,#E0h

mov TMod,#33h  ; ������ 0 ��������� � ����� 3
mov TCon,#50h ; ������ ����� ������� ������� TCNT0

L2:
nop
jnb tf0,L2
L3:
Djnz R1,L3
;sjmp L3
Nop
nop
nop
nop
End
