
_main:

;rightshift.c,3 :: 		void main()
;rightshift.c,5 :: 		ansel=0;
	CLRF       ANSEL+0
;rightshift.c,6 :: 		anselh=0;
	CLRF       ANSELH+0
;rightshift.c,7 :: 		trisb=1;
	MOVLW      1
	MOVWF      TRISB+0
;rightshift.c,8 :: 		trisd=0;
	CLRF       TRISD+0
;rightshift.c,9 :: 		portd=0b10101010;
	MOVLW      170
	MOVWF      PORTD+0
;rightshift.c,10 :: 		option_reg.f7=0;
	BCF        OPTION_REG+0, 7
;rightshift.c,11 :: 		oldstate = 0;
	BCF        _oldstate+0, BitPos(_oldstate+0)
;rightshift.c,12 :: 		while(1)
L_main0:
;rightshift.c,14 :: 		if(button(&portb,0,1,1))
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
;rightshift.c,16 :: 		oldstate = 1;
	BSF        _oldstate+0, BitPos(_oldstate+0)
;rightshift.c,17 :: 		}
L_main2:
;rightshift.c,18 :: 		if(oldstate&&button(&portb,0,1,0))
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
;rightshift.c,20 :: 		rightshift=portd.f0;
	BTFSC      PORTD+0, 0
	GOTO       L__main8
	BCF        _rightshift+0, BitPos(_rightshift+0)
	GOTO       L__main9
L__main8:
	BSF        _rightshift+0, BitPos(_rightshift+0)
L__main9:
;rightshift.c,21 :: 		portd>>=1;
	MOVF       PORTD+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;rightshift.c,22 :: 		portd.f7 =rightshift ;
	BTFSC      _rightshift+0, BitPos(_rightshift+0)
	GOTO       L__main10
	BCF        PORTD+0, 7
	GOTO       L__main11
L__main10:
	BSF        PORTD+0, 7
L__main11:
;rightshift.c,23 :: 		oldstate = 0;
	BCF        _oldstate+0, BitPos(_oldstate+0)
;rightshift.c,24 :: 		}
L_main5:
;rightshift.c,25 :: 		}
	GOTO       L_main0
;rightshift.c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
