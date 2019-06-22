encrypte macro arrg1, arrg2
		xor arrg1, arrg2 ;;arrg1 - inputed char, arrg2 - key
	endm
	enter_show macro arrg1, arrg2
		invoke MessageBoxA, 0, arrg1, arrg2, 0 ;;arrg1 - massage, arrg2 - title
	endm
	compare_me macro arrg1, arrg2, arrg3
	local index
		index equ arrg3 ;;index equivalent arrg3
			cmp arrg1, arrg2 [index] ;;compare
	endm   