
_main:

;Button motor .c,1 :: 		void main()
;Button motor .c,3 :: 		trisb.f0=1; //use portb 0 pin as input
	BSF        TRISB+0, 0
;Button motor .c,4 :: 		trisb.f1=1; //use portb 1 pina as input
	BSF        TRISB+0, 1
;Button motor .c,5 :: 		trisb.f2=1; //use portb 2 pin as input
	BSF        TRISB+0, 2
;Button motor .c,6 :: 		trisd=0;    // port d as output
	CLRF       TRISD+0
;Button motor .c,7 :: 		ansel=0;    // disable adc pin (0-7)
	CLRF       ANSEL+0
;Button motor .c,8 :: 		portd=0x00; // set all pin in port d as logic zero
	CLRF       PORTD+0
;Button motor .c,9 :: 		anselh=0;   // disable high adc pin(8-13)
	CLRF       ANSELH+0
;Button motor .c,10 :: 		option_reg.f7=0; // anable internal pull up resistor
	BCF        OPTION_REG+0, 7
;Button motor .c,11 :: 		while(1)          // infinite loop
L_main0:
;Button motor .c,13 :: 		if(portb.f0==0)  // if button prressed
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;Button motor .c,15 :: 		portd=0x01;     // clockwise motorrun
	MOVLW      1
	MOVWF      PORTD+0
;Button motor .c,16 :: 		}
L_main2:
;Button motor .c,17 :: 		if(portb.f1==0)  // if button prressed
	BTFSC      PORTB+0, 1
	GOTO       L_main3
;Button motor .c,19 :: 		portd=0x02;    // anticlockwise motor run
	MOVLW      2
	MOVWF      PORTD+0
;Button motor .c,20 :: 		}
L_main3:
;Button motor .c,21 :: 		if(portb.f2==0)  // if button prressed
	BTFSC      PORTB+0, 2
	GOTO       L_main4
;Button motor .c,23 :: 		portd=0x00;    // motor stop
	CLRF       PORTD+0
;Button motor .c,24 :: 		}
L_main4:
;Button motor .c,25 :: 		}
	GOTO       L_main0
;Button motor .c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
