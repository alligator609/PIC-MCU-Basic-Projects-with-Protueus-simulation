
_main:

;Speed Control Of Motor.c,3 :: 		void main()
;Speed Control Of Motor.c,5 :: 		ansel =0;
	CLRF       ANSEL+0
;Speed Control Of Motor.c,6 :: 		anselh=0;
	CLRF       ANSELH+0
;Speed Control Of Motor.c,7 :: 		C1ON_bit = 0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Speed Control Of Motor.c,8 :: 		C2ON_bit = 0;        // Disable comparators
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Speed Control Of Motor.c,10 :: 		trisb=1;
	MOVLW      1
	MOVWF      TRISB+0
;Speed Control Of Motor.c,11 :: 		trisd=0;
	CLRF       TRISD+0
;Speed Control Of Motor.c,12 :: 		option_reg.f7=0;
	BCF        OPTION_REG+0, 7
;Speed Control Of Motor.c,14 :: 		pwm1_init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Speed Control Of Motor.c,15 :: 		pwm2_init(5000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Speed Control Of Motor.c,18 :: 		duty1 = 50;
	MOVLW      50
	MOVWF      _duty1+0
;Speed Control Of Motor.c,19 :: 		duty2 =50 ;
	MOVLW      50
	MOVWF      _duty2+0
;Speed Control Of Motor.c,20 :: 		PWM1_SET_DUTY(duty1);
	MOVLW      50
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Speed Control Of Motor.c,21 :: 		PWM2_SET_DUTY(duty1);
	MOVF       _duty1+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Speed Control Of Motor.c,23 :: 		while(1)
L_main0:
;Speed Control Of Motor.c,26 :: 		if(portb.f0==0)
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;Speed Control Of Motor.c,28 :: 		Delay_ms(40);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
;Speed Control Of Motor.c,29 :: 		}
L_main2:
;Speed Control Of Motor.c,30 :: 		if(portb.f0==0)
	BTFSC      PORTB+0, 0
	GOTO       L_main4
;Speed Control Of Motor.c,32 :: 		portd=0b00000001;
	MOVLW      1
	MOVWF      PORTD+0
;Speed Control Of Motor.c,33 :: 		duty1++;
	INCF       _duty1+0, 1
;Speed Control Of Motor.c,34 :: 		PWM1_SET_DUTY(duty1);
	MOVF       _duty1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Speed Control Of Motor.c,36 :: 		}
L_main4:
;Speed Control Of Motor.c,38 :: 		if(portb.f1==0)
	BTFSC      PORTB+0, 1
	GOTO       L_main5
;Speed Control Of Motor.c,40 :: 		delay_ms(40);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
;Speed Control Of Motor.c,41 :: 		}
L_main5:
;Speed Control Of Motor.c,42 :: 		if(portb.f1==0)
	BTFSC      PORTB+0, 1
	GOTO       L_main7
;Speed Control Of Motor.c,44 :: 		portd=0b00000100;
	MOVLW      4
	MOVWF      PORTD+0
;Speed Control Of Motor.c,45 :: 		duty2++;
	INCF       _duty2+0, 1
;Speed Control Of Motor.c,46 :: 		PWM2_SET_DUTY(duty1);
	MOVF       _duty1+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Speed Control Of Motor.c,47 :: 		}
L_main7:
;Speed Control Of Motor.c,48 :: 		delay_ms(40);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
;Speed Control Of Motor.c,51 :: 		}
	GOTO       L_main0
;Speed Control Of Motor.c,52 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
