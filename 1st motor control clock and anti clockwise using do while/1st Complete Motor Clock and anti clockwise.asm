
_main:

;1st Complete Motor Clock and anti clockwise.c,1 :: 		void main()
;1st Complete Motor Clock and anti clockwise.c,3 :: 		trisd=0;
	CLRF       TRISD+0
;1st Complete Motor Clock and anti clockwise.c,4 :: 		portd=0;
	CLRF       PORTD+0
;1st Complete Motor Clock and anti clockwise.c,5 :: 		do
L_main0:
;1st Complete Motor Clock and anti clockwise.c,7 :: 		portd=0x05;   // clockwise
	MOVLW      5
	MOVWF      PORTD+0
;1st Complete Motor Clock and anti clockwise.c,8 :: 		delay_ms(5000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
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
;1st Complete Motor Clock and anti clockwise.c,9 :: 		portd=0x0A;   //anti clockwise
	MOVLW      10
	MOVWF      PORTD+0
;1st Complete Motor Clock and anti clockwise.c,10 :: 		delay_ms(5000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;1st Complete Motor Clock and anti clockwise.c,12 :: 		while(1);
	GOTO       L_main0
;1st Complete Motor Clock and anti clockwise.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
