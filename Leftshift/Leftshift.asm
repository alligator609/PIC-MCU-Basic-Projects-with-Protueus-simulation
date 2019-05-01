
_main:

;Leftshift.c,3 :: 		void main()
;Leftshift.c,6 :: 		ansel=0;         //0 to 7 port will be on disital input
	CLRF       ANSEL+0
;Leftshift.c,7 :: 		anselh=0;        //8 to 13 port will be on disital input
	CLRF       ANSELH+0
;Leftshift.c,8 :: 		trisb =1;
	MOVLW      1
	MOVWF      TRISB+0
;Leftshift.c,9 :: 		portd = 0b01010101;
	MOVLW      85
	MOVWF      PORTD+0
;Leftshift.c,10 :: 		trisd = 0;
	CLRF       TRISD+0
;Leftshift.c,11 :: 		oldstate=0;
	BCF        _oldstate+0, BitPos(_oldstate+0)
;Leftshift.c,12 :: 		option_reg.f7=0;    // pull-up register anable
	BCF        OPTION_REG+0, 7
;Leftshift.c,13 :: 		while(1)
L_main0:
;Leftshift.c,15 :: 		if(button(&portb,0,1,1))
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;Leftshift.c,17 :: 		oldstate=1;
	BSF        _oldstate+0, BitPos(_oldstate+0)
;Leftshift.c,18 :: 		}
L_main2:
;Leftshift.c,19 :: 		if(oldstate&&button(&portb,0,1,0))
	BTFSS      _oldstate+0, BitPos(_oldstate+0)
	GOTO       L_main5
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
L__main6:
;Leftshift.c,21 :: 		leftshift=portd.f7;
	BTFSC      PORTD+0, 7
	GOTO       L__main8
	BCF        _leftshift+0, BitPos(_leftshift+0)
	GOTO       L__main9
L__main8:
	BSF        _leftshift+0, BitPos(_leftshift+0)
L__main9:
;Leftshift.c,22 :: 		portd<<=1;
	MOVF       PORTD+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;Leftshift.c,23 :: 		portd.f0=leftshift;
	BTFSC      _leftshift+0, BitPos(_leftshift+0)
	GOTO       L__main10
	BCF        PORTD+0, 0
	GOTO       L__main11
L__main10:
	BSF        PORTD+0, 0
L__main11:
;Leftshift.c,24 :: 		oldstate=0;
	BCF        _oldstate+0, BitPos(_oldstate+0)
;Leftshift.c,25 :: 		}
L_main5:
;Leftshift.c,26 :: 		}
	GOTO       L_main0
;Leftshift.c,27 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
