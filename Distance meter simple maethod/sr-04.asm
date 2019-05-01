
_main:

;sr-04.c,17 :: 		void main()
;sr-04.c,21 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;sr-04.c,22 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sr-04.c,23 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sr-04.c,25 :: 		TRISB = 0b00010000;
	MOVLW      16
	MOVWF      TRISB+0
;sr-04.c,27 :: 		Lcd_Out(1,1,"Developed By");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_sr_4504+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;sr-04.c,28 :: 		Lcd_Out(2,1,"electroSome");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_sr_4504+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;sr-04.c,30 :: 		Delay_ms(3000);
	MOVLW      77
	MOVWF      R11+0
	MOVLW      25
	MOVWF      R12+0
	MOVLW      79
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
;sr-04.c,31 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sr-04.c,33 :: 		T1CON = 0x10;
	MOVLW      16
	MOVWF      T1CON+0
;sr-04.c,35 :: 		while(1)
L_main1:
;sr-04.c,37 :: 		ANSEL=0;
	CLRF       ANSEL+0
;sr-04.c,38 :: 		ANSELH=0;
	CLRF       ANSELH+0
;sr-04.c,39 :: 		TMR1H = 0;
	CLRF       TMR1H+0
;sr-04.c,40 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;sr-04.c,42 :: 		PORTB.F0 = 1;
	BSF        PORTB+0, 0
;sr-04.c,43 :: 		Delay_us(10);
	MOVLW      16
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	NOP
;sr-04.c,44 :: 		PORTB.F0 = 0;
	BCF        PORTB+0, 0
;sr-04.c,46 :: 		while(!PORTB.F4);
L_main4:
	BTFSC      PORTB+0, 4
	GOTO       L_main5
	GOTO       L_main4
L_main5:
;sr-04.c,47 :: 		T1CON.F0 = 1;
	BSF        T1CON+0, 0
;sr-04.c,48 :: 		while(PORTB.F4);
L_main6:
	BTFSS      PORTB+0, 4
	GOTO       L_main7
	GOTO       L_main6
L_main7:
;sr-04.c,49 :: 		T1CON.F0 = 0;
	BCF        T1CON+0, 0
;sr-04.c,51 :: 		a = (TMR1L | (TMR1H<<8))/58.82 + 1;
	MOVF       TMR1H+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       TMR1L+0, 0
	IORWF      R0+0, 1
	MOVLW      0
	IORWF      R0+1, 1
	CALL       _word2double+0
	MOVLW      174
	MOVWF      R4+0
	MOVLW      71
	MOVWF      R4+1
	MOVLW      107
	MOVWF      R4+2
	MOVLW      132
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      127
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      main_a_L0+0
	MOVF       R0+1, 0
	MOVWF      main_a_L0+1
;sr-04.c,53 :: 		if(a>=2 && a<=400)
	MOVLW      128
	XORWF      R0+1, 0
	MOVWF      R2+0
	MOVLW      128
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      2
	SUBWF      R0+0, 0
L__main15:
	BTFSS      STATUS+0, 0
	GOTO       L_main10
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_a_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVF       main_a_L0+0, 0
	SUBLW      144
L__main16:
	BTFSS      STATUS+0, 0
	GOTO       L_main10
L__main13:
;sr-04.c,55 :: 		IntToStr(a,txt);
	MOVF       main_a_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       main_a_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      main_txt_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;sr-04.c,56 :: 		Ltrim(txt);
	MOVLW      main_txt_L0+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
;sr-04.c,57 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sr-04.c,58 :: 		Lcd_Out(1,1,"Distance = ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_sr_4504+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;sr-04.c,59 :: 		Lcd_Out(1,12,txt);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_txt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;sr-04.c,60 :: 		Lcd_Out(1,15,"cm");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_sr_4504+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;sr-04.c,61 :: 		}
	GOTO       L_main11
L_main10:
;sr-04.c,64 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;sr-04.c,65 :: 		Lcd_Out(1,1,"Out of Range");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_sr_4504+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;sr-04.c,66 :: 		}
L_main11:
;sr-04.c,67 :: 		Delay_ms(400);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;sr-04.c,68 :: 		}
	GOTO       L_main1
;sr-04.c,69 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
