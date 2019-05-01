
_main:

;4 digit counter.c,23 :: 		int main() {
;4 digit counter.c,24 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;4 digit counter.c,27 :: 		TRISB.F0=1;
	BSF        TRISB+0, 0
;4 digit counter.c,28 :: 		TRISB.F1=1;
	BSF        TRISB+0, 1
;4 digit counter.c,29 :: 		TRISB.F2=1;
	BSF        TRISB+0, 2
;4 digit counter.c,30 :: 		PORTB.F0=0x07;
	BSF        PORTB+0, 0
;4 digit counter.c,31 :: 		TRISC = 0x00; // Data lines
	CLRF       TRISC+0
;4 digit counter.c,32 :: 		TRISD = 0x00; // Control signal PORTD0-PORTD3
	CLRF       TRISD+0
;4 digit counter.c,33 :: 		ansel=0;
	CLRF       ANSEL+0
;4 digit counter.c,34 :: 		anselh=0;
	CLRF       ANSELH+0
;4 digit counter.c,35 :: 		option_reg.f7=0;
	BCF        OPTION_REG+0, 7
;4 digit counter.c,37 :: 		while (1)
L_main0:
;4 digit counter.c,43 :: 		show();
	CALL       _show+0
;4 digit counter.c,46 :: 		}
	GOTO       L_main0
;4 digit counter.c,47 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_show:

;4 digit counter.c,49 :: 		void show(){
;4 digit counter.c,52 :: 		while(1)
L_show2:
;4 digit counter.c,54 :: 		num = cnt;
	MOVF       _cnt+0, 0
	MOVWF      _num+0
	MOVF       _cnt+1, 0
	MOVWF      _num+1
;4 digit counter.c,55 :: 		temp = num / 1000;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _cnt+0, 0
	MOVWF      R0+0
	MOVF       _cnt+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
;4 digit counter.c,56 :: 		num = num % 1000;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _num+0, 0
	MOVWF      R0+0
	MOVF       _num+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _num+0
	MOVF       R0+1, 0
	MOVWF      _num+1
;4 digit counter.c,57 :: 		PORTD = SegOne;
	MOVLW      1
	MOVWF      PORTD+0
;4 digit counter.c,58 :: 		PORTC = seg_code[temp];
	MOVF       _temp+0, 0
	ADDLW      _seg_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;4 digit counter.c,59 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_show4:
	DECFSZ     R13+0, 1
	GOTO       L_show4
	DECFSZ     R12+0, 1
	GOTO       L_show4
;4 digit counter.c,61 :: 		temp = num / 100;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _num+0, 0
	MOVWF      R0+0
	MOVF       _num+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
;4 digit counter.c,62 :: 		num = num % 100;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _num+0, 0
	MOVWF      R0+0
	MOVF       _num+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _num+0
	MOVF       R0+1, 0
	MOVWF      _num+1
;4 digit counter.c,63 :: 		PORTD = SegTwo;
	MOVLW      2
	MOVWF      PORTD+0
;4 digit counter.c,64 :: 		PORTC = seg_code[temp];
	MOVF       _temp+0, 0
	ADDLW      _seg_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;4 digit counter.c,65 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_show5:
	DECFSZ     R13+0, 1
	GOTO       L_show5
	DECFSZ     R12+0, 1
	GOTO       L_show5
;4 digit counter.c,67 :: 		temp = num / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _num+0, 0
	MOVWF      R0+0
	MOVF       _num+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
;4 digit counter.c,68 :: 		PORTD = SegThree;
	MOVLW      4
	MOVWF      PORTD+0
;4 digit counter.c,69 :: 		PORTC = seg_code[temp];
	MOVF       R0+0, 0
	ADDLW      _seg_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;4 digit counter.c,70 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_show6:
	DECFSZ     R13+0, 1
	GOTO       L_show6
	DECFSZ     R12+0, 1
	GOTO       L_show6
;4 digit counter.c,72 :: 		temp = num % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _num+0, 0
	MOVWF      R0+0
	MOVF       _num+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
;4 digit counter.c,73 :: 		PORTD = SegFour  ;
	MOVLW      8
	MOVWF      PORTD+0
;4 digit counter.c,74 :: 		PORTC = seg_code[temp];
	MOVF       R0+0, 0
	ADDLW      _seg_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;4 digit counter.c,75 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_show7:
	DECFSZ     R13+0, 1
	GOTO       L_show7
	DECFSZ     R12+0, 1
	GOTO       L_show7
;4 digit counter.c,76 :: 		progress()   ;
	CALL       _progress+0
;4 digit counter.c,77 :: 		}
	GOTO       L_show2
;4 digit counter.c,78 :: 		}
L_end_show:
	RETURN
; end of _show

_progress:

;4 digit counter.c,80 :: 		void progress(){
;4 digit counter.c,81 :: 		if (portb.f0==0)
	BTFSC      PORTB+0, 0
	GOTO       L_progress8
;4 digit counter.c,83 :: 		oldstate1 = 1;
	MOVLW      1
	MOVWF      _oldstate1+0
	MOVLW      0
	MOVWF      _oldstate1+1
;4 digit counter.c,84 :: 		}
	GOTO       L_progress9
L_progress8:
;4 digit counter.c,85 :: 		else if (oldstate1==1 && portb.f0==1 )
	MOVLW      0
	XORWF      _oldstate1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__progress34
	MOVLW      1
	XORWF      _oldstate1+0, 0
L__progress34:
	BTFSS      STATUS+0, 2
	GOTO       L_progress12
	BTFSS      PORTB+0, 0
	GOTO       L_progress12
L__progress30:
;4 digit counter.c,88 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;4 digit counter.c,89 :: 		oldstate1 = 0;
	CLRF       _oldstate1+0
	CLRF       _oldstate1+1
;4 digit counter.c,90 :: 		}
	GOTO       L_progress13
L_progress12:
;4 digit counter.c,91 :: 		else if (portb.f1==0)
	BTFSC      PORTB+0, 1
	GOTO       L_progress14
;4 digit counter.c,93 :: 		oldstate2 = 1;
	MOVLW      1
	MOVWF      _oldstate2+0
	MOVLW      0
	MOVWF      _oldstate2+1
;4 digit counter.c,94 :: 		}
	GOTO       L_progress15
L_progress14:
;4 digit counter.c,95 :: 		else if (oldstate2==1 && portb.f1==1 )
	MOVLW      0
	XORWF      _oldstate2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__progress35
	MOVLW      1
	XORWF      _oldstate2+0, 0
L__progress35:
	BTFSS      STATUS+0, 2
	GOTO       L_progress18
	BTFSS      PORTB+0, 1
	GOTO       L_progress18
L__progress29:
;4 digit counter.c,98 :: 		cnt--;
	MOVLW      1
	SUBWF      _cnt+0, 1
	BTFSS      STATUS+0, 0
	DECF       _cnt+1, 1
;4 digit counter.c,99 :: 		oldstate2 = 0;
	CLRF       _oldstate2+0
	CLRF       _oldstate2+1
;4 digit counter.c,100 :: 		if (cnt<=0){cnt=0;  }
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cnt+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__progress36
	MOVF       _cnt+0, 0
	SUBLW      0
L__progress36:
	BTFSS      STATUS+0, 0
	GOTO       L_progress19
	CLRF       _cnt+0
	CLRF       _cnt+1
L_progress19:
;4 digit counter.c,101 :: 		}
	GOTO       L_progress20
L_progress18:
;4 digit counter.c,102 :: 		else if (portb.f2==0)
	BTFSC      PORTB+0, 2
	GOTO       L_progress21
;4 digit counter.c,104 :: 		oldstate3 = 1;
	MOVLW      1
	MOVWF      _oldstate3+0
	MOVLW      0
	MOVWF      _oldstate3+1
;4 digit counter.c,105 :: 		}
	GOTO       L_progress22
L_progress21:
;4 digit counter.c,106 :: 		else if (oldstate3==1 && portb.f2==1 )
	MOVLW      0
	XORWF      _oldstate3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__progress37
	MOVLW      1
	XORWF      _oldstate3+0, 0
L__progress37:
	BTFSS      STATUS+0, 2
	GOTO       L_progress25
	BTFSS      PORTB+0, 2
	GOTO       L_progress25
L__progress28:
;4 digit counter.c,109 :: 		cnt=0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;4 digit counter.c,110 :: 		oldstate3 = 0;
	CLRF       _oldstate3+0
	CLRF       _oldstate3+1
;4 digit counter.c,111 :: 		}
	GOTO       L_progress26
L_progress25:
;4 digit counter.c,112 :: 		else if (cnt>=10000){cnt=0x00;  }
	MOVLW      128
	XORWF      _cnt+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      39
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__progress38
	MOVLW      16
	SUBWF      _cnt+0, 0
L__progress38:
	BTFSS      STATUS+0, 0
	GOTO       L_progress27
	CLRF       _cnt+0
	CLRF       _cnt+1
L_progress27:
L_progress26:
L_progress22:
L_progress20:
L_progress15:
L_progress13:
L_progress9:
;4 digit counter.c,115 :: 		}
L_end_progress:
	RETURN
; end of _progress
