
_main:

;Counter 0-99.c,6 :: 		void main()
;Counter 0-99.c,8 :: 		int countary[10]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};  // 0-9 7segment hex code
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
;Counter 0-99.c,9 :: 		ansel =0;
	CLRF       ANSEL+0
;Counter 0-99.c,10 :: 		anselh=0;
	CLRF       ANSELH+0
;Counter 0-99.c,12 :: 		trisd=0;
	CLRF       TRISD+0
;Counter 0-99.c,13 :: 		trisc=0;
	CLRF       TRISC+0
;Counter 0-99.c,14 :: 		portd=0;
	CLRF       PORTD+0
;Counter 0-99.c,15 :: 		portc=0;
	CLRF       PORTC+0
;Counter 0-99.c,16 :: 		option_reg.f7=0;
	BCF        OPTION_REG+0, 7
;Counter 0-99.c,17 :: 		oldstate= 0;
	CLRF       _oldstate+0
	CLRF       _oldstate+1
;Counter 0-99.c,18 :: 		while(1)
L_main0:
;Counter 0-99.c,20 :: 		if(i==9&&t==9)
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      9
	XORWF      _i+0, 0
L__main16:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
	MOVLW      0
	XORWF      _t+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVLW      9
	XORWF      _t+0, 0
L__main17:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
L__main14:
;Counter 0-99.c,22 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;Counter 0-99.c,23 :: 		t=0;
	CLRF       _t+0
	CLRF       _t+1
;Counter 0-99.c,24 :: 		}
	GOTO       L_main5
L_main4:
;Counter 0-99.c,26 :: 		for(i=0;i<=9;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main6:
	MOVF       _i+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVF       _i+0, 0
	SUBLW      9
L__main18:
	BTFSS      STATUS+0, 0
	GOTO       L_main7
;Counter 0-99.c,31 :: 		for(t=0;t<=9;t++)
	CLRF       _t+0
	CLRF       _t+1
L_main9:
	MOVF       _t+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVF       _t+0, 0
	SUBLW      9
L__main19:
	BTFSS      STATUS+0, 0
	GOTO       L_main10
;Counter 0-99.c,34 :: 		portc=countary[t];
	MOVF       _t+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_countary_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Counter 0-99.c,35 :: 		delay_ms(500) ;
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;Counter 0-99.c,36 :: 		portd=countary[i];
	MOVF       _i+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_countary_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Counter 0-99.c,37 :: 		delay_ms(500)   ;
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;Counter 0-99.c,31 :: 		for(t=0;t<=9;t++)
	INCF       _t+0, 1
	BTFSC      STATUS+0, 2
	INCF       _t+1, 1
;Counter 0-99.c,38 :: 		}
	GOTO       L_main9
L_main10:
;Counter 0-99.c,26 :: 		for(i=0;i<=9;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Counter 0-99.c,41 :: 		}
	GOTO       L_main6
L_main7:
;Counter 0-99.c,42 :: 		}
L_main5:
;Counter 0-99.c,43 :: 		}
	GOTO       L_main0
;Counter 0-99.c,44 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
