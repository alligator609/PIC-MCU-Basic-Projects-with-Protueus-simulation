
_main:

;Rf robot.c,1 :: 		void main()
;Rf robot.c,4 :: 		ansel=0;
	CLRF       ANSEL+0
;Rf robot.c,5 :: 		anselh=0;
	CLRF       ANSELH+0
;Rf robot.c,6 :: 		option_reg.f7=0;
	BCF        OPTION_REG+0, 7
;Rf robot.c,7 :: 		trisb=0x0F ;                   // 4 sensor
	MOVLW      15
	MOVWF      TRISB+0
;Rf robot.c,8 :: 		portb.f4=0;
	BCF        PORTB+0, 4
;Rf robot.c,9 :: 		portb.f5=0;
	BCF        PORTB+0, 5
;Rf robot.c,10 :: 		portb.f6=0;
	BCF        PORTB+0, 6
;Rf robot.c,11 :: 		portb.f7=0;
	BCF        PORTB+0, 7
;Rf robot.c,12 :: 		trisd=0x00 ;
	CLRF       TRISD+0
;Rf robot.c,13 :: 		trise.f0=0;
	BCF        TRISE+0, 0
;Rf robot.c,14 :: 		porte.f0=0;
	BCF        PORTE+0, 0
;Rf robot.c,15 :: 		portd=0;
	CLRF       PORTD+0
;Rf robot.c,16 :: 		while(1)
L_main0:
;Rf robot.c,18 :: 		if(portb==0b00001010)            // Forward       0011
	MOVF       PORTB+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;Rf robot.c,20 :: 		portd=0b01010101;
	MOVLW      85
	MOVWF      PORTD+0
;Rf robot.c,21 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
;Rf robot.c,22 :: 		}
	GOTO       L_main4
L_main2:
;Rf robot.c,23 :: 		else if(portb==0b00001001)            // Backward     0110
	MOVF       PORTB+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;Rf robot.c,25 :: 		portd=0b10101010;
	MOVLW      170
	MOVWF      PORTD+0
;Rf robot.c,26 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
;Rf robot.c,27 :: 		}
	GOTO       L_main7
L_main5:
;Rf robot.c,28 :: 		else if(portb==0b00001110)                     // Right   0111
	MOVF       PORTB+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;Rf robot.c,30 :: 		portd=0b01100110;
	MOVLW      102
	MOVWF      PORTD+0
;Rf robot.c,31 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
;Rf robot.c,32 :: 		}
	GOTO       L_main10
L_main8:
;Rf robot.c,33 :: 		else if(portb==0b00001101)                              //Left  1011
	MOVF       PORTB+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;Rf robot.c,35 :: 		portd=0b10011001;
	MOVLW      153
	MOVWF      PORTD+0
;Rf robot.c,36 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
;Rf robot.c,37 :: 		}
	GOTO       L_main13
L_main11:
;Rf robot.c,38 :: 		else if(portb==0b00001111)                              //alll positive
	MOVF       PORTB+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_main14
;Rf robot.c,40 :: 		portd=0b11111111;
	MOVLW      255
	MOVWF      PORTD+0
;Rf robot.c,41 :: 		porte.f0=0;
	BCF        PORTE+0, 0
;Rf robot.c,42 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	NOP
;Rf robot.c,43 :: 		}
	GOTO       L_main16
L_main14:
;Rf robot.c,45 :: 		else if(portb==0b00001100)                              //weapon forward
	MOVF       PORTB+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;Rf robot.c,47 :: 		portd=0b01010101;
	MOVLW      85
	MOVWF      PORTD+0
;Rf robot.c,48 :: 		porte.f0=1;
	BSF        PORTE+0, 0
;Rf robot.c,49 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	NOP
;Rf robot.c,50 :: 		}
	GOTO       L_main19
L_main17:
;Rf robot.c,52 :: 		else if(portb==0b00000110)            //  weapone Backward
	MOVF       PORTB+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_main20
;Rf robot.c,54 :: 		portd=0b10101010;
	MOVLW      170
	MOVWF      PORTD+0
;Rf robot.c,55 :: 		porte.f0=1;
	BSF        PORTE+0, 0
;Rf robot.c,56 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	NOP
;Rf robot.c,57 :: 		}
	GOTO       L_main22
L_main20:
;Rf robot.c,59 :: 		else if(portb==0b00000111)                     // weapone Right
	MOVF       PORTB+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_main23
;Rf robot.c,61 :: 		portd=0b01100110;
	MOVLW      102
	MOVWF      PORTD+0
;Rf robot.c,62 :: 		porte.f0=1;
	BSF        PORTE+0, 0
;Rf robot.c,63 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	NOP
;Rf robot.c,64 :: 		}
	GOTO       L_main25
L_main23:
;Rf robot.c,65 :: 		else if(portb==0b00001000)                              //weapone Left
	MOVF       PORTB+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_main26
;Rf robot.c,67 :: 		portd=0b10011001;
	MOVLW      153
	MOVWF      PORTD+0
;Rf robot.c,68 :: 		porte.f0=1;
	BSF        PORTE+0, 0
;Rf robot.c,69 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	NOP
;Rf robot.c,70 :: 		}
	GOTO       L_main28
L_main26:
;Rf robot.c,74 :: 		portd=0b00000000;
	CLRF       PORTD+0
;Rf robot.c,75 :: 		porte.f0=0;
	BCF        PORTE+0, 0
;Rf robot.c,76 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	NOP
;Rf robot.c,77 :: 		}
L_main28:
L_main25:
L_main22:
L_main19:
L_main16:
L_main13:
L_main10:
L_main7:
L_main4:
;Rf robot.c,78 :: 		}
	GOTO       L_main0
;Rf robot.c,79 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
