
_main:

;Leftrightshift.c,4 :: 		void main()
;Leftrightshift.c,6 :: 		ansel=0;
	CLRF       ANSEL+0
;Leftrightshift.c,7 :: 		anselh=0;
	CLRF       ANSELH+0
;Leftrightshift.c,8 :: 		trisb=1;
	MOVLW      1
	MOVWF      TRISB+0
;Leftrightshift.c,9 :: 		trisd=0;
	CLRF       TRISD+0
;Leftrightshift.c,10 :: 		portd=0b00001111;
	MOVLW      15
	MOVWF      PORTD+0
;Leftrightshift.c,12 :: 		oldstate = 0;
	BCF        _oldstate+0, BitPos(_oldstate+0)
;Leftrightshift.c,13 :: 		while(1)
L_main0:
;Leftrightshift.c,15 :: 		if(button(&portb,0,1,1))
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
;Leftrightshift.c,17 :: 		oldstate = 1;
	BSF        _oldstate+0, BitPos(_oldstate+0)
;Leftrightshift.c,18 :: 		}
L_main2:
;Leftrightshift.c,19 :: 		if(oldstate&&button(&portb,0,1,0))
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
L__main11:
;Leftrightshift.c,21 :: 		rightshift=portd.f0;
	BTFSC      PORTD+0, 0
	GOTO       L__main13
	BCF        _rightshift+0, BitPos(_rightshift+0)
	GOTO       L__main14
L__main13:
	BSF        _rightshift+0, BitPos(_rightshift+0)
L__main14:
;Leftrightshift.c,22 :: 		portd>>=1;
	MOVF       PORTD+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;Leftrightshift.c,23 :: 		portd.f7 =rightshift ;
	BTFSC      _rightshift+0, BitPos(_rightshift+0)
	GOTO       L__main15
	BCF        PORTD+0, 7
	GOTO       L__main16
L__main15:
	BSF        PORTD+0, 7
L__main16:
;Leftrightshift.c,24 :: 		oldstate = 0;
	BCF        _oldstate+0, BitPos(_oldstate+0)
;Leftrightshift.c,25 :: 		}
L_main5:
;Leftrightshift.c,26 :: 		if(button(&portb,1,1,1))
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
;Leftrightshift.c,28 :: 		oldstate = 1;
	BSF        _oldstate+0, BitPos(_oldstate+0)
;Leftrightshift.c,29 :: 		}
L_main6:
;Leftrightshift.c,30 :: 		if(oldstate&&button(&portb,1,1,0))
	BTFSS      _oldstate+0, BitPos(_oldstate+0)
	GOTO       L_main9
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main9
L__main10:
;Leftrightshift.c,32 :: 		leftshift=portd.f7;
	BTFSC      PORTD+0, 7
	GOTO       L__main17
	BCF        _leftshift+0, BitPos(_leftshift+0)
	GOTO       L__main18
L__main17:
	BSF        _leftshift+0, BitPos(_leftshift+0)
L__main18:
;Leftrightshift.c,33 :: 		portd<<=1;
	MOVF       PORTD+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;Leftrightshift.c,34 :: 		portd.f0=leftshift;
	BTFSC      _leftshift+0, BitPos(_leftshift+0)
	GOTO       L__main19
	BCF        PORTD+0, 0
	GOTO       L__main20
L__main19:
	BSF        PORTD+0, 0
L__main20:
;Leftrightshift.c,35 :: 		oldstate=0;
	BCF        _oldstate+0, BitPos(_oldstate+0)
;Leftrightshift.c,36 :: 		}
L_main9:
;Leftrightshift.c,37 :: 		}
	GOTO       L_main0
;Leftrightshift.c,38 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
