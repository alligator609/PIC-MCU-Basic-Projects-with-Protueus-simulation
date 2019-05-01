
_main:

;kuet11.c,2 :: 		void main()
;kuet11.c,4 :: 		ansel=0;
	CLRF       ANSEL+0
;kuet11.c,5 :: 		anselh=0;
	CLRF       ANSELH+0
;kuet11.c,6 :: 		trisb=0x1F ;                   // 5 sensor
	MOVLW      31
	MOVWF      TRISB+0
;kuet11.c,7 :: 		portB.F5=0;
	BCF        PORTB+0, 5
;kuet11.c,8 :: 		portB.F6=0;
	BCF        PORTB+0, 6
;kuet11.c,9 :: 		portB.F7=0;
	BCF        PORTB+0, 7
;kuet11.c,10 :: 		trisd=0x00 ;
	CLRF       TRISD+0
;kuet11.c,11 :: 		portd=0;
	CLRF       PORTD+0
;kuet11.c,12 :: 		pwm1_init(8000)  ;      //right motor pwm
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      156
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;kuet11.c,13 :: 		pwm2_init(8000) ;       //left motor pwm
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      156
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;kuet11.c,14 :: 		pwm1_start() ;
	CALL       _PWM1_Start+0
;kuet11.c,15 :: 		pwm2_start() ;
	CALL       _PWM2_Start+0
;kuet11.c,16 :: 		pwm1_set_duty(100);
	MOVLW      100
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;kuet11.c,17 :: 		pwm2_set_duty(100);
	MOVLW      100
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;kuet11.c,18 :: 		while(1)
L_main0:
;kuet11.c,20 :: 		if(portb==0x03)     //hard left
	MOVF       PORTB+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;kuet11.c,22 :: 		pwm1_set_duty(202);
	MOVLW      202
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;kuet11.c,23 :: 		pwm2_set_duty(202);
	MOVLW      202
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;kuet11.c,24 :: 		portd=0b00001001 ;
	MOVLW      9
	MOVWF      PORTD+0
;kuet11.c,25 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
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
;kuet11.c,26 :: 		}
L_main2:
;kuet11.c,27 :: 		if(portb==0x13)      //  soft   left
	MOVF       PORTB+0, 0
	XORLW      19
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;kuet11.c,29 :: 		pwm1_set_duty(202);
	MOVLW      202
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;kuet11.c,30 :: 		pwm2_set_duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;kuet11.c,31 :: 		portd=0b00000001 ;
	MOVLW      1
	MOVWF      PORTD+0
;kuet11.c,32 :: 		delay_ms(20);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;kuet11.c,33 :: 		}
L_main4:
;kuet11.c,34 :: 		if(portb==0x19)  // soft_right();
	MOVF       PORTB+0, 0
	XORLW      25
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;kuet11.c,36 :: 		pwm1_set_duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;kuet11.c,37 :: 		pwm2_set_duty(202);
	MOVLW      202
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;kuet11.c,38 :: 		portd=0b00000100 ;
	MOVLW      4
	MOVWF      PORTD+0
;kuet11.c,39 :: 		delay_ms(20);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;kuet11.c,40 :: 		}
L_main6:
;kuet11.c,41 :: 		if(portb==0x18)   // hard_right();
	MOVF       PORTB+0, 0
	XORLW      24
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;kuet11.c,43 :: 		pwm1_set_duty(202);
	MOVLW      202
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;kuet11.c,44 :: 		pwm2_set_duty(202);
	MOVLW      202
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;kuet11.c,45 :: 		portd=0b00000110;
	MOVLW      6
	MOVWF      PORTD+0
;kuet11.c,46 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
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
;kuet11.c,47 :: 		}
L_main8:
;kuet11.c,54 :: 		if(portb==0x04)   //stop() ;
	MOVF       PORTB+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;kuet11.c,56 :: 		pwm1_set_duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;kuet11.c,57 :: 		pwm1_set_duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;kuet11.c,58 :: 		portd=0b00001111;
	MOVLW      15
	MOVWF      PORTD+0
;kuet11.c,60 :: 		}
L_main10:
;kuet11.c,61 :: 		if(portb==0x0B)      // left  Corner
	MOVF       PORTB+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;kuet11.c,63 :: 		pwm1_set_duty(202);
	MOVLW      202
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;kuet11.c,64 :: 		pwm2_set_duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;kuet11.c,65 :: 		portd=0b00000001 ;
	MOVLW      1
	MOVWF      PORTD+0
;kuet11.c,66 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
;kuet11.c,67 :: 		}
L_main11:
;kuet11.c,68 :: 		if(portb==0x1A)      // Right  Corner
	MOVF       PORTB+0, 0
	XORLW      26
	BTFSS      STATUS+0, 2
	GOTO       L_main13
;kuet11.c,70 :: 		pwm1_set_duty(202);
	MOVLW      202
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;kuet11.c,71 :: 		pwm2_set_duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;kuet11.c,72 :: 		portd=0b00000100 ;
	MOVLW      4
	MOVWF      PORTD+0
;kuet11.c,73 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
;kuet11.c,74 :: 		}
L_main13:
;kuet11.c,75 :: 		if(portb==0x00)      // Loop Forward black line
	MOVF       PORTB+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main15
;kuet11.c,77 :: 		pwm1_set_duty(202);
	MOVLW      202
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;kuet11.c,78 :: 		pwm2_set_duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;kuet11.c,79 :: 		portd=0b00000100 ;
	MOVLW      4
	MOVWF      PORTD+0
;kuet11.c,80 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
	NOP
;kuet11.c,81 :: 		}
L_main15:
;kuet11.c,82 :: 		}
	GOTO       L_main0
;kuet11.c,83 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
