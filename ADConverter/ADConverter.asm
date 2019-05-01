
_main:

;ADConverter.c,2 :: 		void main()
;ADConverter.c,4 :: 		ansel.f0=1;  //use analog port 0 as analog
	BSF        ANSEL+0, 0
;ADConverter.c,5 :: 		trisa0_bit=1; //anlog port 0 as input
	BSF        TRISA0_bit+0, BitPos(TRISA0_bit+0)
;ADConverter.c,6 :: 		trisd=0;      //portd as output
	CLRF       TRISD+0
;ADConverter.c,7 :: 		trisc=0;     //portc as output
	CLRF       TRISC+0
;ADConverter.c,8 :: 		do
L_main0:
;ADConverter.c,10 :: 		adc_rd = ADC_READ(0);   // get 10 bit result of  conversetion
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc_rd+0
	MOVF       R0+1, 0
	MOVWF      _adc_rd+1
;ADConverter.c,11 :: 		portc=adc_rd;     // send lower 8 bit to port c
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;ADConverter.c,12 :: 		portd=adc_rd>>8; //send 2 most significant bit in pin0,1
	MOVF       R0+1, 0
	MOVWF      R2+0
	CLRF       R2+1
	MOVF       R2+0, 0
	MOVWF      PORTD+0
;ADConverter.c,13 :: 		delay_ms(1);     //delay  1ms
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;ADConverter.c,15 :: 		while(1);
	GOTO       L_main0
;ADConverter.c,16 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
