
_main:

;Street Light.c,7 :: 		void main()
;Street Light.c,9 :: 		parcentg_dark =.50;               // 50% darkness
	MOVLW      0
	MOVWF      _parcentg_dark+0
	MOVLW      0
	MOVWF      _parcentg_dark+1
	MOVLW      0
	MOVWF      _parcentg_dark+2
	MOVLW      126
	MOVWF      _parcentg_dark+3
;Street Light.c,10 :: 		ansel=0;
	CLRF       ANSEL+0
;Street Light.c,11 :: 		anselh=0x14;
	MOVLW      20
	MOVWF      ANSELH+0
;Street Light.c,12 :: 		trisb.f0=1;
	BSF        TRISB+0, 0
;Street Light.c,13 :: 		trisb.f1=1;
	BSF        TRISB+0, 1
;Street Light.c,14 :: 		trisd.f0=0;
	BCF        TRISD+0, 0
;Street Light.c,15 :: 		trisd.f1=0;
	BCF        TRISD+0, 1
;Street Light.c,16 :: 		while(1)
L_main0:
;Street Light.c,19 :: 		ldr1 = adc_read(12) ;
	MOVLW      12
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _ldr1+0
	MOVF       R0+1, 0
	MOVWF      _ldr1+1
;Street Light.c,20 :: 		ldr2 = adc_read(10) ;
	MOVLW      10
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _ldr2+0
	MOVF       R0+1, 0
	MOVWF      _ldr2+1
;Street Light.c,21 :: 		dark1  = 1023*parcentg_dark ;
	MOVLW      0
	MOVWF      R0+0
	MOVLW      192
	MOVWF      R0+1
	MOVLW      127
	MOVWF      R0+2
	MOVLW      136
	MOVWF      R0+3
	MOVF       _parcentg_dark+0, 0
	MOVWF      R4+0
	MOVF       _parcentg_dark+1, 0
	MOVWF      R4+1
	MOVF       _parcentg_dark+2, 0
	MOVWF      R4+2
	MOVF       _parcentg_dark+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _dark1+0
	MOVF       R0+1, 0
	MOVWF      _dark1+1
;Street Light.c,22 :: 		dark2 = 1023*parcentg_dark ;
	MOVF       R0+0, 0
	MOVWF      _dark2+0
	MOVF       R0+1, 0
	MOVWF      _dark2+1
;Street Light.c,23 :: 		if(ldr1>=dark1)            //when v across resistor is greater than 50% of refrence voltage led1 on
	MOVLW      128
	XORWF      _ldr1+1, 0
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVF       R0+0, 0
	SUBWF      _ldr1+0, 0
L__main7:
	BTFSS      STATUS+0, 0
	GOTO       L_main2
;Street Light.c,25 :: 		portd.f0=1;
	BSF        PORTD+0, 0
;Street Light.c,26 :: 		}
	GOTO       L_main3
L_main2:
;Street Light.c,29 :: 		portd.f0=0;
	BCF        PORTD+0, 0
;Street Light.c,30 :: 		}
L_main3:
;Street Light.c,31 :: 		if(ldr2>=dark2)            //when v across resistor is greater than 50% of refrence voltage led2 on
	MOVLW      128
	XORWF      _ldr2+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _dark2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVF       _dark2+0, 0
	SUBWF      _ldr2+0, 0
L__main8:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;Street Light.c,33 :: 		portd.f1=1;
	BSF        PORTD+0, 1
;Street Light.c,34 :: 		}
	GOTO       L_main5
L_main4:
;Street Light.c,37 :: 		portd.f1=0;
	BCF        PORTD+0, 1
;Street Light.c,38 :: 		}
L_main5:
;Street Light.c,39 :: 		}
	GOTO       L_main0
;Street Light.c,40 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
