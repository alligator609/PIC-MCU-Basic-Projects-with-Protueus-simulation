
_main:

;Street light Digital.c,1 :: 		void main()
;Street light Digital.c,3 :: 		ansel=0;
	CLRF       ANSEL+0
;Street light Digital.c,4 :: 		anselh=0;
	CLRF       ANSELH+0
;Street light Digital.c,5 :: 		trisb.f0=1;
	BSF        TRISB+0, 0
;Street light Digital.c,6 :: 		trisb.f1=1;
	BSF        TRISB+0, 1
;Street light Digital.c,7 :: 		trisd.f0=0;
	BCF        TRISD+0, 0
;Street light Digital.c,8 :: 		trisd.f1=0;
	BCF        TRISD+0, 1
;Street light Digital.c,9 :: 		while(1)
L_main0:
;Street light Digital.c,11 :: 		if(portb.f0==1)
	BTFSS      PORTB+0, 0
	GOTO       L_main2
;Street light Digital.c,13 :: 		portd.f0=1;
	BSF        PORTD+0, 0
;Street light Digital.c,14 :: 		}
	GOTO       L_main3
L_main2:
;Street light Digital.c,17 :: 		portd.f0=0;
	BCF        PORTD+0, 0
;Street light Digital.c,18 :: 		}
L_main3:
;Street light Digital.c,19 :: 		if(portb.f1==1)
	BTFSS      PORTB+0, 1
	GOTO       L_main4
;Street light Digital.c,21 :: 		portd.f1=1;
	BSF        PORTD+0, 1
;Street light Digital.c,22 :: 		}
	GOTO       L_main5
L_main4:
;Street light Digital.c,25 :: 		portd.f1=0;
	BCF        PORTD+0, 1
;Street light Digital.c,26 :: 		}
L_main5:
;Street light Digital.c,27 :: 		}
	GOTO       L_main0
;Street light Digital.c,28 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
