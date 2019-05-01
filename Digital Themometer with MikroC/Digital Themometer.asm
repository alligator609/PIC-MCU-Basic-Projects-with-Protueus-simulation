
_main:

;Digital Themometer.c,22 :: 		void main() {
;Digital Themometer.c,24 :: 		TRISA.RA0 = 1;                    // Configure RA0 pin as input
	BSF        TRISA+0, 0
;Digital Themometer.c,26 :: 		ADC_Init();                        // Initialize ADC
	CALL       _ADC_Init+0
;Digital Themometer.c,28 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;Digital Themometer.c,29 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Digital Themometer.c,30 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Digital Themometer.c,32 :: 		Lcd_Out(1, 1, "  Digital ");  // Display "StudentCompanion"
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Digital_32Themometer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digital Themometer.c,33 :: 		Lcd_Out(2, 1, "Thermometer");        // Display "Thermometer"
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Digital_32Themometer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digital Themometer.c,34 :: 		Delay_ms(1000);                      // 1 Second delay
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;Digital Themometer.c,35 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Digital Themometer.c,37 :: 		Lcd_Out(1, 1, "Temperature :");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Digital_32Themometer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digital Themometer.c,38 :: 		Lcd_Chr(2,8,223);                  // char code for degree
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      223
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Digital Themometer.c,39 :: 		Lcd_Chr(2,9,'C');                  // Display "C" for Celsius
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      67
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Digital Themometer.c,41 :: 		temperature = 0;
	CLRF       _temperature+0
	CLRF       _temperature+1
;Digital Themometer.c,42 :: 		do {
L_main1:
;Digital Themometer.c,43 :: 		temperature = ADC_Read(0);          // Get 10-bit results of AD conversion
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temperature+0
	MOVF       R0+1, 0
	MOVWF      _temperature+1
;Digital Themometer.c,44 :: 		mV = temperature * 5000.0 /1024.0;  // Convert to miV temperature in Celsuis
	CALL       _Word2Double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      64
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      139
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      137
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _mV+0
	MOVF       R0+1, 0
	MOVWF      _mV+1
	MOVF       R0+2, 0
	MOVWF      _mV+2
	MOVF       R0+3, 0
	MOVWF      _mV+3
;Digital Themometer.c,45 :: 		mV = mV/10.0;                        // Convert mV to temperature in Celsuis
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _mV+0
	MOVF       R0+1, 0
	MOVWF      _mV+1
	MOVF       R0+2, 0
	MOVWF      _mV+2
	MOVF       R0+3, 0
	MOVWF      _mV+3
;Digital Themometer.c,46 :: 		FloatToStr(mV, txt);               // Convert temperature to string
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _txt+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;Digital Themometer.c,47 :: 		txt[4]=0;
	CLRF       _txt+4
;Digital Themometer.c,48 :: 		Lcd_Out(2, 3, txt);                // Display Temperature
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digital Themometer.c,49 :: 		Delay_ms(500);                     // 1 Second delay
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;Digital Themometer.c,51 :: 		} while(1);
	GOTO       L_main1
;Digital Themometer.c,53 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
