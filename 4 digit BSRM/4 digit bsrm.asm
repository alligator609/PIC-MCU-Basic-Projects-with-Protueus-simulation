
_main:

;4 digit bsrm.c,15 :: 		int main() {
;4 digit bsrm.c,16 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;4 digit bsrm.c,17 :: 		oldstate1=0;
	BCF        _oldstate1+0, BitPos(_oldstate1+0)
;4 digit bsrm.c,18 :: 		oldstate2=0;
	BCF        _oldstate2+0, BitPos(_oldstate2+0)
;4 digit bsrm.c,19 :: 		oldstate3=0;
	BCF        _oldstate3+0, BitPos(_oldstate3+0)
;4 digit bsrm.c,24 :: 		trisb.f0=1;
	BSF        TRISB+0, 0
;4 digit bsrm.c,25 :: 		trisb.f1=1;
	BSF        TRISB+0, 1
;4 digit bsrm.c,26 :: 		trisb.f2=1;
	BSF        TRISB+0, 2
;4 digit bsrm.c,28 :: 		trisc = 0x00; // Data lines
	CLRF       TRISC+0
;4 digit bsrm.c,29 :: 		trisa = 0x00; // Control signal PORTD0-PORTD3
	CLRF       TRISA+0
;4 digit bsrm.c,30 :: 		trisd = 0;
	CLRF       TRISD+0
;4 digit bsrm.c,31 :: 		portd=0;
	CLRF       PORTD+0
;4 digit bsrm.c,32 :: 		ansel = 0;                                    // Configure AN pins as digital I/O
	CLRF       ANSEL+0
;4 digit bsrm.c,33 :: 		anselh = 0;
	CLRF       ANSELH+0
;4 digit bsrm.c,34 :: 		option_reg.f7=0;
	BCF        OPTION_REG+0, 7
;4 digit bsrm.c,36 :: 		while (1)
L_main0:
;4 digit bsrm.c,38 :: 		num = cnt;
	MOVF       _cnt+0, 0
	MOVWF      _num+0
	MOVF       _cnt+1, 0
	MOVWF      _num+1
;4 digit bsrm.c,39 :: 		temp=0;
	CLRF       _temp+0
	CLRF       _temp+1
;4 digit bsrm.c,40 :: 		temp = num / 1000;
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
;4 digit bsrm.c,41 :: 		num = num % 1000;
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
;4 digit bsrm.c,42 :: 		porta = 0b00000001;
	MOVLW      1
	MOVWF      PORTA+0
;4 digit bsrm.c,44 :: 		portd = 0b00010001;
	MOVLW      17
	MOVWF      PORTD+0
;4 digit bsrm.c,45 :: 		portc = seg_code[temp];
	MOVF       _temp+0, 0
	ADDLW      _seg_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;4 digit bsrm.c,46 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
;4 digit bsrm.c,48 :: 		temp = num / 100;
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
;4 digit bsrm.c,49 :: 		num = num % 100;
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
;4 digit bsrm.c,50 :: 		porta = 0b00000010;
	MOVLW      2
	MOVWF      PORTA+0
;4 digit bsrm.c,52 :: 		portd = 0b00100010;
	MOVLW      34
	MOVWF      PORTD+0
;4 digit bsrm.c,53 :: 		portc = seg_code[temp];
	MOVF       _temp+0, 0
	ADDLW      _seg_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;4 digit bsrm.c,54 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
;4 digit bsrm.c,56 :: 		temp = num / 10;
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
;4 digit bsrm.c,57 :: 		porta = 0b00000100;
	MOVLW      4
	MOVWF      PORTA+0
;4 digit bsrm.c,59 :: 		portd = 0b01000100;
	MOVLW      68
	MOVWF      PORTD+0
;4 digit bsrm.c,60 :: 		portc = seg_code[temp];
	MOVF       R0+0, 0
	ADDLW      _seg_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;4 digit bsrm.c,61 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
;4 digit bsrm.c,63 :: 		temp = num % 10;
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
;4 digit bsrm.c,64 :: 		porta =0b00001000 ;
	MOVLW      8
	MOVWF      PORTA+0
;4 digit bsrm.c,66 :: 		portd = 0b10001000;
	MOVLW      136
	MOVWF      PORTD+0
;4 digit bsrm.c,67 :: 		portc = seg_code[temp];
	MOVF       R0+0, 0
	ADDLW      _seg_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;4 digit bsrm.c,68 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
;4 digit bsrm.c,69 :: 		progress()   ;
	CALL       _progress+0
;4 digit bsrm.c,70 :: 		}
	GOTO       L_main0
;4 digit bsrm.c,71 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_progress:

;4 digit bsrm.c,73 :: 		void progress(){
;4 digit bsrm.c,74 :: 		if (Button(&PORTB, 0, 10, 1)) {
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_progress6
;4 digit bsrm.c,76 :: 		oldstate1 = 1;
	BSF        _oldstate1+0, BitPos(_oldstate1+0)
;4 digit bsrm.c,77 :: 		}
L_progress6:
;4 digit bsrm.c,78 :: 		if (oldstate1 && Button(&PORTB, 0, 10, 0)) {
	BTFSS      _oldstate1+0, BitPos(_oldstate1+0)
	GOTO       L_progress9
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_progress9
L__progress22:
;4 digit bsrm.c,79 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;4 digit bsrm.c,80 :: 		oldstate1 = 0;
	BCF        _oldstate1+0, BitPos(_oldstate1+0)
;4 digit bsrm.c,81 :: 		}
L_progress9:
;4 digit bsrm.c,83 :: 		if (Button(&PORTB, 1, 10, 1)) {
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_progress10
;4 digit bsrm.c,85 :: 		oldstate2 = 1;
	BSF        _oldstate2+0, BitPos(_oldstate2+0)
;4 digit bsrm.c,86 :: 		}
L_progress10:
;4 digit bsrm.c,87 :: 		if (oldstate2 && Button(&PORTB, 1, 10, 0)) {
	BTFSS      _oldstate2+0, BitPos(_oldstate2+0)
	GOTO       L_progress13
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_progress13
L__progress21:
;4 digit bsrm.c,88 :: 		cnt--;
	MOVLW      1
	SUBWF      _cnt+0, 1
	BTFSS      STATUS+0, 0
	DECF       _cnt+1, 1
;4 digit bsrm.c,89 :: 		oldstate2 = 0;
	BCF        _oldstate2+0, BitPos(_oldstate2+0)
;4 digit bsrm.c,90 :: 		if (cnt<=0){cnt=0; }
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _cnt+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__progress25
	MOVF       _cnt+0, 0
	SUBLW      0
L__progress25:
	BTFSS      STATUS+0, 0
	GOTO       L_progress14
	CLRF       _cnt+0
	CLRF       _cnt+1
L_progress14:
;4 digit bsrm.c,91 :: 		}
L_progress13:
;4 digit bsrm.c,93 :: 		if (Button(&PORTB, 2, 10, 1))
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_progress15
;4 digit bsrm.c,95 :: 		oldstate3 = 1;
	BSF        _oldstate3+0, BitPos(_oldstate3+0)
;4 digit bsrm.c,96 :: 		}
L_progress15:
;4 digit bsrm.c,97 :: 		if (oldstate3 && Button(&PORTB, 2, 10, 0))
	BTFSS      _oldstate3+0, BitPos(_oldstate3+0)
	GOTO       L_progress18
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      10
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_progress18
L__progress20:
;4 digit bsrm.c,100 :: 		cnt=0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;4 digit bsrm.c,101 :: 		oldstate3 = 0;
	BCF        _oldstate3+0, BitPos(_oldstate3+0)
;4 digit bsrm.c,102 :: 		}
L_progress18:
;4 digit bsrm.c,103 :: 		if (cnt>=10000){ cnt=0x00;  }
	MOVLW      128
	XORWF      _cnt+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      39
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__progress26
	MOVLW      16
	SUBWF      _cnt+0, 0
L__progress26:
	BTFSS      STATUS+0, 0
	GOTO       L_progress19
	CLRF       _cnt+0
	CLRF       _cnt+1
L_progress19:
;4 digit bsrm.c,105 :: 		}
L_end_progress:
	RETURN
; end of _progress
