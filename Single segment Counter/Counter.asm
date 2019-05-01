
_main:

;Counter.c,3 :: 		void main()
;Counter.c,5 :: 		int countary[10]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};  // 0-9 7segment hex code
	MOVLW      63
	MOVWF      main_countary_L0+0
	MOVLW      0
	MOVWF      main_countary_L0+1
	MOVLW      6
	MOVWF      main_countary_L0+2
	MOVLW      0
	MOVWF      main_countary_L0+3
	MOVLW      91
	MOVWF      main_countary_L0+4
	MOVLW      0
	MOVWF      main_countary_L0+5
	MOVLW      79
	MOVWF      main_countary_L0+6
	MOVLW      0
	MOVWF      main_countary_L0+7
	MOVLW      102
	MOVWF      main_countary_L0+8
	MOVLW      0
	MOVWF      main_countary_L0+9
	MOVLW      109
	MOVWF      main_countary_L0+10
	MOVLW      0
	MOVWF      main_countary_L0+11
	MOVLW      125
	MOVWF      main_countary_L0+12
	MOVLW      0
	MOVWF      main_countary_L0+13
	MOVLW      7
	MOVWF      main_countary_L0+14
	MOVLW      0
	MOVWF      main_countary_L0+15
	MOVLW      127
	MOVWF      main_countary_L0+16
	MOVLW      0
	MOVWF      main_countary_L0+17
	MOVLW      103
	MOVWF      main_countary_L0+18
	MOVLW      0
	MOVWF      main_countary_L0+19
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;Counter.c,7 :: 		ansel=0;
	CLRF       ANSEL+0
;Counter.c,8 :: 		anselh=0;
	CLRF       ANSELH+0
;Counter.c,9 :: 		portb=1;
	MOVLW      1
	MOVWF      PORTB+0
;Counter.c,10 :: 		trisb.f0=1;
	BSF        TRISB+0, 0
;Counter.c,11 :: 		trisd=0;
	CLRF       TRISD+0
;Counter.c,12 :: 		portd=0;
	CLRF       PORTD+0
;Counter.c,13 :: 		option_reg.f7=0;
	BCF        OPTION_REG+0, 7
;Counter.c,14 :: 		while(1)
L_main0:
;Counter.c,17 :: 		if(i==10)
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      10
	XORWF      main_i_L0+0, 0
L__main10:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;Counter.c,19 :: 		i=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;Counter.c,20 :: 		}
	GOTO       L_main3
L_main2:
;Counter.c,25 :: 		if(button(&portb,0,1,0))
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
;Counter.c,27 :: 		oldstate = 1;
	MOVLW      1
	MOVWF      _oldstate+0
	MOVLW      0
	MOVWF      _oldstate+1
;Counter.c,28 :: 		}
L_main4:
;Counter.c,29 :: 		if(button(&portb,0,1,1)&&oldstate)
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
	GOTO       L_main7
	MOVF       _oldstate+0, 0
	IORWF      _oldstate+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
L__main8:
;Counter.c,32 :: 		portd=countary[i];
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_countary_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Counter.c,33 :: 		i++;
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;Counter.c,34 :: 		oldstate = 0;
	CLRF       _oldstate+0
	CLRF       _oldstate+1
;Counter.c,35 :: 		}
L_main7:
;Counter.c,37 :: 		}
L_main3:
;Counter.c,42 :: 		}
	GOTO       L_main0
;Counter.c,43 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
