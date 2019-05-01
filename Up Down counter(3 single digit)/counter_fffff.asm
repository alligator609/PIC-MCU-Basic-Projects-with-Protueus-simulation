
_main:

;counter_fffff.c,23 :: 		int main() {
;counter_fffff.c,24 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;counter_fffff.c,27 :: 		TRISA.F0=1;
	BSF        TRISA+0, 0
;counter_fffff.c,28 :: 		TRISA.F1=1;
	BSF        TRISA+0, 1
;counter_fffff.c,29 :: 		TRISA.F2=1;
	BSF        TRISA+0, 2
;counter_fffff.c,30 :: 		TRISB=0x00;
	CLRF       TRISB+0
;counter_fffff.c,31 :: 		TRISC = 0x00; // Data lines
	CLRF       TRISC+0
;counter_fffff.c,32 :: 		TRISD = 0x00; // Control signal PORTD0-PORTD3
	CLRF       TRISD+0
;counter_fffff.c,33 :: 		ansel=0;
	CLRF       ANSEL+0
;counter_fffff.c,34 :: 		anselh=0;
	CLRF       ANSELH+0
;counter_fffff.c,35 :: 		option_reg.f7=0;
	BCF        OPTION_REG+0, 7
;counter_fffff.c,37 :: 		while (1)
L_main0:
;counter_fffff.c,43 :: 		show();
	CALL       _show+0
;counter_fffff.c,46 :: 		}
	GOTO       L_main0
;counter_fffff.c,47 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_show:

;counter_fffff.c,49 :: 		void show(){
;counter_fffff.c,52 :: 		while(1)
L_show2:
;counter_fffff.c,54 :: 		num = cnt;
	MOVF       _cnt+0, 0
	MOVWF      _num+0
	MOVF       _cnt+1, 0
	MOVWF      _num+1
;counter_fffff.c,62 :: 		temp = num / 100;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _cnt+0, 0
	MOVWF      R0+0
	MOVF       _cnt+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__show+0
	MOVF       R0+1, 0
	MOVWF      FLOC__show+1
	MOVF       FLOC__show+0, 0
	MOVWF      _temp+0
	MOVF       FLOC__show+1, 0
	MOVWF      _temp+1
;counter_fffff.c,63 :: 		num = num % 100;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _cnt+0, 0
	MOVWF      R0+0
	MOVF       _cnt+1, 0
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
;counter_fffff.c,65 :: 		PORTD = seg_code[temp];
	MOVF       FLOC__show+0, 0
	ADDLW      _seg_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;counter_fffff.c,66 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_show4:
	DECFSZ     R13+0, 1
	GOTO       L_show4
	DECFSZ     R12+0, 1
	GOTO       L_show4
;counter_fffff.c,68 :: 		temp = num / 10;
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
;counter_fffff.c,70 :: 		PORTC = seg_code[temp];
	MOVF       R0+0, 0
	ADDLW      _seg_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;counter_fffff.c,71 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_show5:
	DECFSZ     R13+0, 1
	GOTO       L_show5
	DECFSZ     R12+0, 1
	GOTO       L_show5
;counter_fffff.c,73 :: 		temp = num % 10;
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
;counter_fffff.c,75 :: 		PORTB = seg_code[temp];
	MOVF       R0+0, 0
	ADDLW      _seg_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;counter_fffff.c,76 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_show6:
	DECFSZ     R13+0, 1
	GOTO       L_show6
	DECFSZ     R12+0, 1
	GOTO       L_show6
;counter_fffff.c,77 :: 		progress()   ;
	CALL       _progress+0
;counter_fffff.c,78 :: 		}
	GOTO       L_show2
;counter_fffff.c,79 :: 		}
L_end_show:
	RETURN
; end of _show

_progress:

;counter_fffff.c,81 :: 		void progress(){
;counter_fffff.c,82 :: 		if (porta.f0==0)
	BTFSC      PORTA+0, 0
	GOTO       L_progress7
;counter_fffff.c,84 :: 		oldstate1 = 1;
	MOVLW      1
	MOVWF      _oldstate1+0
	MOVLW      0
	MOVWF      _oldstate1+1
;counter_fffff.c,85 :: 		}
L_progress7:
;counter_fffff.c,86 :: 		if (oldstate1==1 && porta.f0==1 )
	MOVLW      0
	XORWF      _oldstate1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__progress28
	MOVLW      1
	XORWF      _oldstate1+0, 0
L__progress28:
	BTFSS      STATUS+0, 2
	GOTO       L_progress10
	BTFSS      PORTA+0, 0
	GOTO       L_progress10
L__progress24:
;counter_fffff.c,89 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;counter_fffff.c,90 :: 		oldstate1 = 0;
	CLRF       _oldstate1+0
	CLRF       _oldstate1+1
;counter_fffff.c,91 :: 		}
	GOTO       L_progress11
L_progress10:
;counter_fffff.c,92 :: 		else if (porta.f1==0)
	BTFSC      PORTA+0, 1
	GOTO       L_progress12
;counter_fffff.c,94 :: 		oldstate2 = 1;
	MOVLW      1
	MOVWF      _oldstate2+0
	MOVLW      0
	MOVWF      _oldstate2+1
;counter_fffff.c,95 :: 		}
L_progress12:
L_progress11:
;counter_fffff.c,96 :: 		if (oldstate2==1 && porta.f1==1 )
	MOVLW      0
	XORWF      _oldstate2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__progress29
	MOVLW      1
	XORWF      _oldstate2+0, 0
L__progress29:
	BTFSS      STATUS+0, 2
	GOTO       L_progress15
	BTFSS      PORTA+0, 1
	GOTO       L_progress15
L__progress23:
;counter_fffff.c,99 :: 		cnt--;
	MOVLW      1
	SUBWF      _cnt+0, 1
	BTFSS      STATUS+0, 0
	DECF       _cnt+1, 1
;counter_fffff.c,100 :: 		oldstate2 = 0;
	CLRF       _oldstate2+0
	CLRF       _oldstate2+1
;counter_fffff.c,101 :: 		if (cnt<=0){cnt=0;  }
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cnt+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__progress30
	MOVF       _cnt+0, 0
	SUBLW      0
L__progress30:
	BTFSS      STATUS+0, 0
	GOTO       L_progress16
	CLRF       _cnt+0
	CLRF       _cnt+1
L_progress16:
;counter_fffff.c,102 :: 		}
L_progress15:
;counter_fffff.c,103 :: 		if (porta.f2==0)
	BTFSC      PORTA+0, 2
	GOTO       L_progress17
;counter_fffff.c,105 :: 		oldstate3 = 1;
	MOVLW      1
	MOVWF      _oldstate3+0
	MOVLW      0
	MOVWF      _oldstate3+1
;counter_fffff.c,106 :: 		}
L_progress17:
;counter_fffff.c,107 :: 		if (oldstate3==1 && porta.f2==1 )
	MOVLW      0
	XORWF      _oldstate3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__progress31
	MOVLW      1
	XORWF      _oldstate3+0, 0
L__progress31:
	BTFSS      STATUS+0, 2
	GOTO       L_progress20
	BTFSS      PORTA+0, 2
	GOTO       L_progress20
L__progress22:
;counter_fffff.c,110 :: 		cnt=0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;counter_fffff.c,111 :: 		oldstate3 = 0;
	CLRF       _oldstate3+0
	CLRF       _oldstate3+1
;counter_fffff.c,112 :: 		}
L_progress20:
;counter_fffff.c,113 :: 		if (cnt>=1000){cnt=0;  }
	MOVLW      128
	XORWF      _cnt+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__progress32
	MOVLW      232
	SUBWF      _cnt+0, 0
L__progress32:
	BTFSS      STATUS+0, 0
	GOTO       L_progress21
	CLRF       _cnt+0
	CLRF       _cnt+1
L_progress21:
;counter_fffff.c,116 :: 		}
L_end_progress:
	RETURN
; end of _progress
