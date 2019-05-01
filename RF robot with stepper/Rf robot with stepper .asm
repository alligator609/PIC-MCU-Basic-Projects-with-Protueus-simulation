
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
;Rf robot.c,13 :: 		portd=0;
	CLRF       PORTD+0
;Rf robot.c,14 :: 		while(1)
L_main0:
;Rf robot.c,16 :: 		if(portb==0b00000011)            // Forward       0011
	MOVF       PORTB+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;Rf robot.c,18 :: 		portd=0b01010101;
	MOVLW      85
	MOVWF      PORTD+0
;Rf robot.c,19 :: 		delay_ms(10);
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
;Rf robot.c,20 :: 		}
	GOTO       L_main4
L_main2:
;Rf robot.c,21 :: 		else if(portb==0b00000110)            // Backward     0110
	MOVF       PORTB+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;Rf robot.c,23 :: 		portd=0b10101010;
	MOVLW      170
	MOVWF      PORTD+0
;Rf robot.c,24 :: 		delay_ms(10);
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
;Rf robot.c,25 :: 		}
	GOTO       L_main7
L_main5:
;Rf robot.c,26 :: 		else if(portb==0b00000111)                     // Right   0111
	MOVF       PORTB+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;Rf robot.c,28 :: 		portd=0b01100110;
	MOVLW      102
	MOVWF      PORTD+0
;Rf robot.c,29 :: 		delay_ms(10);
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
;Rf robot.c,30 :: 		}
	GOTO       L_main10
L_main8:
;Rf robot.c,31 :: 		else if(portb==0b00001011)                              //Left  1011
	MOVF       PORTB+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;Rf robot.c,33 :: 		portd=0b10011001;
	MOVLW      153
	MOVWF      PORTD+0
;Rf robot.c,34 :: 		delay_ms(10);
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
;Rf robot.c,35 :: 		}
	GOTO       L_main13
L_main11:
;Rf robot.c,36 :: 		else if(portb==0b00001111)                              //alll positive
	MOVF       PORTB+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_main14
;Rf robot.c,38 :: 		portd=0b11111111;
	MOVLW      255
	MOVWF      PORTD+0
;Rf robot.c,39 :: 		delay_ms(10);
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
;Rf robot.c,40 :: 		}
	GOTO       L_main16
L_main14:
;Rf robot.c,42 :: 		else if(portb==0b00000000)                              //Stepper up   0000
	MOVF       PORTB+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;Rf robot.c,44 :: 		for ( x=0;x<50;x++)
	CLRF       R1+0
	CLRF       R1+1
L_main18:
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main41
	MOVLW      50
	SUBWF      R1+0, 0
L__main41:
	BTFSC      STATUS+0, 0
	GOTO       L_main19
;Rf robot.c,45 :: 		if(portb==0x03)
	MOVF       PORTB+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;Rf robot.c,47 :: 		PORTD = 0b00010000;
	MOVLW      16
	MOVWF      PORTD+0
;Rf robot.c,48 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
	NOP
;Rf robot.c,49 :: 		PORTD = 0b01000000;
	MOVLW      64
	MOVWF      PORTD+0
;Rf robot.c,50 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	DECFSZ     R11+0, 1
	GOTO       L_main23
	NOP
	NOP
;Rf robot.c,51 :: 		PORTD = 0b00100000;
	MOVLW      32
	MOVWF      PORTD+0
;Rf robot.c,52 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
	NOP
	NOP
;Rf robot.c,53 :: 		PORTD = 0b10000000;
	MOVLW      128
	MOVWF      PORTD+0
;Rf robot.c,54 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
	NOP
	NOP
;Rf robot.c,55 :: 		}
	GOTO       L_main26
L_main21:
;Rf robot.c,58 :: 		break;
	GOTO       L_main19
;Rf robot.c,59 :: 		}
L_main26:
;Rf robot.c,44 :: 		for ( x=0;x<50;x++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;Rf robot.c,59 :: 		}
	GOTO       L_main18
L_main19:
;Rf robot.c,60 :: 		}
	GOTO       L_main27
L_main17:
;Rf robot.c,62 :: 		else if(portb==0x01)                              //Stepper down  0001
	MOVF       PORTB+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main28
;Rf robot.c,64 :: 		for ( x=1;x<50;x++)
	MOVLW      1
	MOVWF      R1+0
	MOVLW      0
	MOVWF      R1+1
L_main29:
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main42
	MOVLW      50
	SUBWF      R1+0, 0
L__main42:
	BTFSC      STATUS+0, 0
	GOTO       L_main30
;Rf robot.c,65 :: 		if(portb==0x0C)
	MOVF       PORTB+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_main32
;Rf robot.c,67 :: 		PORTD = 0b10000000;
	MOVLW      128
	MOVWF      PORTD+0
;Rf robot.c,68 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main33:
	DECFSZ     R13+0, 1
	GOTO       L_main33
	DECFSZ     R12+0, 1
	GOTO       L_main33
	DECFSZ     R11+0, 1
	GOTO       L_main33
	NOP
	NOP
;Rf robot.c,69 :: 		PORTD = 0b00100000;
	MOVLW      32
	MOVWF      PORTD+0
;Rf robot.c,70 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	DECFSZ     R11+0, 1
	GOTO       L_main34
	NOP
	NOP
;Rf robot.c,71 :: 		PORTD = 0b01000000;
	MOVLW      64
	MOVWF      PORTD+0
;Rf robot.c,72 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	DECFSZ     R11+0, 1
	GOTO       L_main35
	NOP
	NOP
;Rf robot.c,73 :: 		PORTD = 0b00010000;
	MOVLW      16
	MOVWF      PORTD+0
;Rf robot.c,74 :: 		Delay_ms(250);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
	DECFSZ     R11+0, 1
	GOTO       L_main36
	NOP
	NOP
;Rf robot.c,75 :: 		}
	GOTO       L_main37
L_main32:
;Rf robot.c,78 :: 		break;
	GOTO       L_main30
;Rf robot.c,79 :: 		}
L_main37:
;Rf robot.c,64 :: 		for ( x=1;x<50;x++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;Rf robot.c,79 :: 		}
	GOTO       L_main29
L_main30:
;Rf robot.c,80 :: 		}
	GOTO       L_main38
L_main28:
;Rf robot.c,84 :: 		portd=0b00000000;
	CLRF       PORTD+0
;Rf robot.c,85 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main39:
	DECFSZ     R13+0, 1
	GOTO       L_main39
	DECFSZ     R12+0, 1
	GOTO       L_main39
	NOP
;Rf robot.c,86 :: 		}
L_main38:
L_main27:
L_main16:
L_main13:
L_main10:
L_main7:
L_main4:
;Rf robot.c,87 :: 		}
	GOTO       L_main0
;Rf robot.c,88 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
