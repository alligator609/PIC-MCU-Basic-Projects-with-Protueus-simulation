
_main:

;Lumos Final.c,1 :: 		void main()
;Lumos Final.c,6 :: 		ansel=0;
	CLRF       ANSEL+0
;Lumos Final.c,7 :: 		anselh=0;
	CLRF       ANSELH+0
;Lumos Final.c,8 :: 		option_reg.f7=0;
	BCF        OPTION_REG+0, 7
;Lumos Final.c,9 :: 		trisb.f0=1;
	BSF        TRISB+0, 0
;Lumos Final.c,10 :: 		trisb.f1 = 1;
	BSF        TRISB+0, 1
;Lumos Final.c,11 :: 		trisd=0;
	CLRF       TRISD+0
;Lumos Final.c,12 :: 		portd=0;
	CLRF       PORTD+0
;Lumos Final.c,13 :: 		while(1)
L_main0:
;Lumos Final.c,15 :: 		if ((button(&portb,0,10,0)))
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;Lumos Final.c,17 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Lumos Final.c,18 :: 		old=1;
	MOVLW      1
	MOVWF      main_old_L0+0
	MOVLW      0
	MOVWF      main_old_L0+1
;Lumos Final.c,19 :: 		}
L_main2:
;Lumos Final.c,20 :: 		if (button(&portb,0,10,0)&&old==1)
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVLW      0
	XORWF      main_old_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVLW      1
	XORWF      main_old_L0+0, 0
L__main25:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
L__main23:
;Lumos Final.c,22 :: 		old=0;
	CLRF       main_old_L0+0
	CLRF       main_old_L0+1
;Lumos Final.c,24 :: 		while(1)
L_main7:
;Lumos Final.c,26 :: 		portd.f0=1;
	BSF        PORTD+0, 0
;Lumos Final.c,27 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;Lumos Final.c,28 :: 		portd.f0=0;
	BCF        PORTD+0, 0
;Lumos Final.c,29 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
;Lumos Final.c,30 :: 		if(button(&portb,0,10,0))
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
;Lumos Final.c,31 :: 		break;
	GOTO       L_main8
L_main11:
;Lumos Final.c,32 :: 		}
	GOTO       L_main7
L_main8:
;Lumos Final.c,33 :: 		}
L_main6:
;Lumos Final.c,34 :: 		if ((button(&portb,1,10,0)))
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
;Lumos Final.c,36 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
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
;Lumos Final.c,37 :: 		old1=1;
	MOVLW      1
	MOVWF      main_old1_L0+0
	MOVLW      0
	MOVWF      main_old1_L0+1
;Lumos Final.c,38 :: 		}
L_main12:
;Lumos Final.c,39 :: 		if (button(&portb,1,10,0)&&old1==1)
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVLW      0
	XORWF      main_old1_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVLW      1
	XORWF      main_old1_L0+0, 0
L__main26:
	BTFSS      STATUS+0, 2
	GOTO       L_main16
L__main22:
;Lumos Final.c,41 :: 		old1=0;
	CLRF       main_old1_L0+0
	CLRF       main_old1_L0+1
;Lumos Final.c,43 :: 		while(1)
L_main17:
;Lumos Final.c,45 :: 		portd.f1=1;
	BSF        PORTD+0, 1
;Lumos Final.c,46 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	NOP
;Lumos Final.c,47 :: 		portd.f1=0;
	BCF        PORTD+0, 1
;Lumos Final.c,48 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	NOP
;Lumos Final.c,49 :: 		if(button(&portb,1,10,0))
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main21
;Lumos Final.c,50 :: 		break;
	GOTO       L_main18
L_main21:
;Lumos Final.c,51 :: 		}
	GOTO       L_main17
L_main18:
;Lumos Final.c,52 :: 		}
L_main16:
;Lumos Final.c,53 :: 		}
	GOTO       L_main0
;Lumos Final.c,54 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
