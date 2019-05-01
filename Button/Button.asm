
_main:

;Button.c,7 :: 		void main() {
;Button.c,9 :: 		ANSEL  = 0;                                    // Configure AN pins as digital I/O
	CLRF       ANSEL+0
;Button.c,10 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Button.c,11 :: 		C1ON_bit = 0;                                  // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Button.c,12 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Button.c,13 :: 		option_reg.f7=0;
	BCF        OPTION_REG+0, 7
;Button.c,14 :: 		TRISB0_bit = 1;                                // set RB0 pin as input
	BSF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;Button.c,16 :: 		TRISC = 0x00;                                  // Configure PORTC as output
	CLRF       TRISC+0
;Button.c,17 :: 		PORTC = 0b11110000;                                  // Initial PORTC value
	MOVLW      240
	MOVWF      PORTC+0
;Button.c,18 :: 		oldstate = 0;
	BCF        _oldstate+0, BitPos(_oldstate+0)
;Button.c,20 :: 		while(1) {                                // Endless loop
L_main0:
;Button.c,22 :: 		if (Button(&PORTB, 0, 1, 1)) {        //short press       // Detect logical one //
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;Button.c,24 :: 		oldstate = 1;                              // Update flag
	BSF        _oldstate+0, BitPos(_oldstate+0)
;Button.c,25 :: 		}
L_main2:
;Button.c,26 :: 		if (oldstate && Button(&PORTB, 0, 100, 0)) {   // Detect one-to-zero transition
	BTFSS      _oldstate+0, BitPos(_oldstate+0)
	GOTO       L_main5
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      100
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
L__main15:
;Button.c,27 :: 		PORTC = ~PORTC;                            // Invert PORTC
	COMF       PORTC+0, 1
;Button.c,28 :: 		oldstate = 0;                              // Update flag
	BCF        _oldstate+0, BitPos(_oldstate+0)
;Button.c,29 :: 		}
L_main5:
;Button.c,30 :: 		if (Button(&PORTB, 0, 1, 1)) {          //long press
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
;Button.c,33 :: 		oldstate1 = 1;
	BSF        _oldstate1+0, BitPos(_oldstate1+0)
;Button.c,34 :: 		}
L_main6:
;Button.c,35 :: 		if (oldstate && Button(&PORTB, 0, 1000, 0)) {
	BTFSS      _oldstate+0, BitPos(_oldstate+0)
	GOTO       L_main9
	MOVLW      PORTB+0
	MOVWF      FARG_Button_port+0
	CLRF       FARG_Button_pin+0
	MOVLW      232
	MOVWF      FARG_Button_time_ms+0
	CLRF       FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main9
L__main14:
;Button.c,36 :: 		long_press();
	CALL       _long_press+0
;Button.c,37 :: 		oldstate1 = 0;
	BCF        _oldstate1+0, BitPos(_oldstate1+0)
;Button.c,38 :: 		}
L_main9:
;Button.c,39 :: 		}
	GOTO       L_main0
;Button.c,40 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_long_press:

;Button.c,42 :: 		void long_press()
;Button.c,44 :: 		int i =0;
	CLRF       long_press_i_L0+0
	CLRF       long_press_i_L0+1
;Button.c,45 :: 		for (;i<=10;i++)
L_long_press10:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      long_press_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__long_press18
	MOVF       long_press_i_L0+0, 0
	SUBLW      10
L__long_press18:
	BTFSS      STATUS+0, 0
	GOTO       L_long_press11
;Button.c,47 :: 		leftshift=portc.f7;
	BTFSC      PORTC+0, 7
	GOTO       L__long_press19
	BCF        _leftshift+0, BitPos(_leftshift+0)
	GOTO       L__long_press20
L__long_press19:
	BSF        _leftshift+0, BitPos(_leftshift+0)
L__long_press20:
;Button.c,48 :: 		portc<<=1;
	MOVF       PORTC+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;Button.c,49 :: 		portc.f0=leftshift;
	BTFSC      _leftshift+0, BitPos(_leftshift+0)
	GOTO       L__long_press21
	BCF        PORTC+0, 0
	GOTO       L__long_press22
L__long_press21:
	BSF        PORTC+0, 0
L__long_press22:
;Button.c,50 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_long_press13:
	DECFSZ     R13+0, 1
	GOTO       L_long_press13
	DECFSZ     R12+0, 1
	GOTO       L_long_press13
	DECFSZ     R11+0, 1
	GOTO       L_long_press13
	NOP
;Button.c,45 :: 		for (;i<=10;i++)
	INCF       long_press_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       long_press_i_L0+1, 1
;Button.c,51 :: 		}
	GOTO       L_long_press10
L_long_press11:
;Button.c,52 :: 		}
L_end_long_press:
	RETURN
; end of _long_press
