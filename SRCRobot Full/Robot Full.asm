
_main:

;Robot Full.c,2 :: 		void main()
;Robot Full.c,4 :: 		ansel=0;
	CLRF       ANSEL+0
;Robot Full.c,5 :: 		anselh=0;
	CLRF       ANSELH+0
;Robot Full.c,7 :: 		trisd=0;
	CLRF       TRISD+0
;Robot Full.c,8 :: 		trisb=0;
	CLRF       TRISB+0
;Robot Full.c,9 :: 		portd=0;
	CLRF       PORTD+0
;Robot Full.c,10 :: 		portb=0;
	CLRF       PORTB+0
;Robot Full.c,11 :: 		uart1_init(9600);
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Robot Full.c,12 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
;Robot Full.c,14 :: 		while(1)
L_main1:
;Robot Full.c,16 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;Robot Full.c,18 :: 		rb = UART1_Read();     // read the received data,
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _rb+0
;Robot Full.c,19 :: 		UART1_Write(rb);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Robot Full.c,20 :: 		}
L_main3:
;Robot Full.c,21 :: 		if(rb=='F')             // Forward
	MOVF       _rb+0, 0
	XORLW      70
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;Robot Full.c,23 :: 		portd=0b01010000;
	MOVLW      80
	MOVWF      PORTD+0
;Robot Full.c,24 :: 		portb.f7=1;
	BSF        PORTB+0, 7
;Robot Full.c,25 :: 		}
	GOTO       L_main5
L_main4:
;Robot Full.c,26 :: 		else if(rb=='B')            // Backward
	MOVF       _rb+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;Robot Full.c,28 :: 		portd=0b10100000;
	MOVLW      160
	MOVWF      PORTD+0
;Robot Full.c,29 :: 		portb.f7=1;
	BSF        PORTB+0, 7
;Robot Full.c,30 :: 		}
	GOTO       L_main7
L_main6:
;Robot Full.c,31 :: 		else if(rb=='R')                       // Right
	MOVF       _rb+0, 0
	XORLW      82
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;Robot Full.c,33 :: 		portd=0b10010000;
	MOVLW      144
	MOVWF      PORTD+0
;Robot Full.c,34 :: 		portb.f7=1;
	BSF        PORTB+0, 7
;Robot Full.c,35 :: 		}
	GOTO       L_main9
L_main8:
;Robot Full.c,36 :: 		else if(rb=='L')                               //Left
	MOVF       _rb+0, 0
	XORLW      76
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;Robot Full.c,38 :: 		portd=0b01100000;
	MOVLW      96
	MOVWF      PORTD+0
;Robot Full.c,39 :: 		portb.f7=1;
	BSF        PORTB+0, 7
;Robot Full.c,40 :: 		}
	GOTO       L_main11
L_main10:
;Robot Full.c,41 :: 		else if(rb=='S')                               //Stop
	MOVF       _rb+0, 0
	XORLW      83
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;Robot Full.c,43 :: 		portd=0b00000000;
	CLRF       PORTD+0
;Robot Full.c,44 :: 		portb.f7=0;
	BCF        PORTB+0, 7
;Robot Full.c,45 :: 		}
	GOTO       L_main13
L_main12:
;Robot Full.c,46 :: 		else if(rb=='X'&& portb.f7==0)
	MOVF       _rb+0, 0
	XORLW      88
	BTFSS      STATUS+0, 2
	GOTO       L_main16
	BTFSC      PORTB+0, 7
	GOTO       L_main16
L__main19:
;Robot Full.c,48 :: 		portb.f7=1;
	BSF        PORTB+0, 7
;Robot Full.c,49 :: 		}
	GOTO       L_main17
L_main16:
;Robot Full.c,50 :: 		else if(rb=='x')
	MOVF       _rb+0, 0
	XORLW      120
	BTFSS      STATUS+0, 2
	GOTO       L_main18
;Robot Full.c,52 :: 		portb.f7=0;
	BCF        PORTB+0, 7
;Robot Full.c,53 :: 		}
L_main18:
L_main17:
L_main13:
L_main11:
L_main9:
L_main7:
L_main5:
;Robot Full.c,55 :: 		}
	GOTO       L_main1
;Robot Full.c,56 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
