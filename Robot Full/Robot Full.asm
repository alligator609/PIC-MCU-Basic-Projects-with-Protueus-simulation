
_main:

;Robot Full.c,2 :: 		void main()
;Robot Full.c,4 :: 		ansel=0;
	CLRF       ANSEL+0
;Robot Full.c,5 :: 		anselh=0;
	CLRF       ANSELH+0
;Robot Full.c,6 :: 		C1ON_bit = 0;                       // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Robot Full.c,7 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Robot Full.c,9 :: 		trisd=0;
	CLRF       TRISD+0
;Robot Full.c,10 :: 		portd=0;
	CLRF       PORTD+0
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
;Robot Full.c,23 :: 		portd=0b00000101;
	MOVLW      5
	MOVWF      PORTD+0
;Robot Full.c,24 :: 		}
L_main4:
;Robot Full.c,25 :: 		if(rb=='B')            // Backward
	MOVF       _rb+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;Robot Full.c,27 :: 		portd=0b00001010;
	MOVLW      10
	MOVWF      PORTD+0
;Robot Full.c,28 :: 		}
L_main5:
;Robot Full.c,29 :: 		if(rb=='R')                       // Right
	MOVF       _rb+0, 0
	XORLW      82
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;Robot Full.c,31 :: 		portd=0b00001001;
	MOVLW      9
	MOVWF      PORTD+0
;Robot Full.c,32 :: 		}
L_main6:
;Robot Full.c,33 :: 		if(rb=='L')                               //Left
	MOVF       _rb+0, 0
	XORLW      76
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;Robot Full.c,35 :: 		portd=0b00000110;
	MOVLW      6
	MOVWF      PORTD+0
;Robot Full.c,36 :: 		}
L_main7:
;Robot Full.c,37 :: 		if(rb=='S')                               //Stop
	MOVF       _rb+0, 0
	XORLW      83
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;Robot Full.c,39 :: 		portd=0b00000000;
	CLRF       PORTD+0
;Robot Full.c,40 :: 		}
L_main8:
;Robot Full.c,41 :: 		}
	GOTO       L_main1
;Robot Full.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
