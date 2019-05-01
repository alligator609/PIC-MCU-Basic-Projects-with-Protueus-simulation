
_main:

;final .c,25 :: 		void main()
;final .c,27 :: 		ANSEL=0;
	CLRF       ANSEL+0
;final .c,28 :: 		ANSELH=0;
	CLRF       ANSELH+0
;final .c,29 :: 		trisb.f0=1;
	BSF        TRISB+0, 0
;final .c,30 :: 		portb.f0=1;
	BSF        PORTB+0, 0
;final .c,35 :: 		trisb.f4=0;            //  Output
	BCF        TRISB+0, 4
;final .c,36 :: 		trisb.f5=0;
	BCF        TRISB+0, 5
;final .c,37 :: 		trisb.f6=0;
	BCF        TRISB+0, 6
;final .c,38 :: 		trisb.f7=0;             // Output
	BCF        TRISB+0, 7
;final .c,39 :: 		portb.f4=0;
	BCF        PORTB+0, 4
;final .c,40 :: 		portb.f5=0;
	BCF        PORTB+0, 5
;final .c,41 :: 		portb.f6=0;
	BCF        PORTB+0, 6
;final .c,42 :: 		portb.f7=0;
	BCF        PORTB+0, 7
;final .c,44 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;final .c,46 :: 		while(1)
L_main0:
;final .c,48 :: 		memset(password, 0, 5);
	MOVLW      _password+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      5
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;final .c,49 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;final .c,50 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;final .c,51 :: 		Lcd_Out(0,1 , "WELLCOME");
	CLRF       FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_final_32+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;final .c,52 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;final .c,53 :: 		get_turn();
	CALL       _get_turn+0
;final .c,54 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;final .c,55 :: 		}
	GOTO       L_main0
;final .c,57 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_get_turn:

;final .c,60 :: 		void get_turn()
;final .c,62 :: 		loop:
___get_turn_loop:
;final .c,63 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;final .c,64 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;final .c,65 :: 		Lcd_Out(1, 1, "Enter Turn Num :");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_final_32+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;final .c,67 :: 		for(i=0;i<5;i++)
	CLRF       _i+0
	CLRF       _i+1
L_get_turn3:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__get_turn34
	MOVLW      5
	SUBWF      _i+0, 0
L__get_turn34:
	BTFSC      STATUS+0, 0
	GOTO       L_get_turn4
;final .c,69 :: 		while (password[i] == 0)
L_get_turn6:
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_get_turn7
;final .c,71 :: 		password[i] = Keypad_Key_Click();
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FLOC__get_turn+0
	CALL       _Keypad_Key_Click+0
	MOVF       FLOC__get_turn+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;final .c,72 :: 		}
	GOTO       L_get_turn6
L_get_turn7:
;final .c,74 :: 		if(password[i]==1)     password[i]  = '1';
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_get_turn8
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      49
	MOVWF      INDF+0
L_get_turn8:
;final .c,75 :: 		if(password[i]==2)     password[i]  = '4'; //2
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_get_turn9
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      52
	MOVWF      INDF+0
L_get_turn9:
;final .c,76 :: 		if(password[i]==3)     password[i]  = '7'; //3
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_get_turn10
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      55
	MOVWF      INDF+0
L_get_turn10:
;final .c,77 :: 		if(password[i]==13)     {     portb.f4=1;   // clockwise
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_get_turn11
	BSF        PORTB+0, 4
;final .c,78 :: 		portb.f5=0;
	BCF        PORTB+0, 5
;final .c,79 :: 		portb.f6=1;
	BSF        PORTB+0, 6
;final .c,80 :: 		portb.f7=0; turn_count(); backward();break; }                                // F
	BCF        PORTB+0, 7
	CALL       _turn_count+0
	CALL       _backward+0
	GOTO       L_get_turn4
L_get_turn11:
;final .c,81 :: 		if(password[i]==5)     password[i]  = '2'; //4
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_get_turn12
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      50
	MOVWF      INDF+0
L_get_turn12:
;final .c,82 :: 		if(password[i]==6)     password[i]  = '5';
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_get_turn13
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      53
	MOVWF      INDF+0
L_get_turn13:
;final .c,83 :: 		if(password[i]==7)     password[i]  = '8'; //6
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_get_turn14
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      56
	MOVWF      INDF+0
L_get_turn14:
;final .c,84 :: 		if(password[i]==14)     {     portb.f4=0;   // anti  clockwise
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_get_turn15
	BCF        PORTB+0, 4
;final .c,85 :: 		portb.f5=1;
	BSF        PORTB+0, 5
;final .c,86 :: 		portb.f6=0;
	BCF        PORTB+0, 6
;final .c,87 :: 		portb.f7=1; turn_count(); forward(); break; }
	BSF        PORTB+0, 7
	CALL       _turn_count+0
	CALL       _forward+0
	GOTO       L_get_turn4
L_get_turn15:
;final .c,89 :: 		if(password[i]==9)     password[i]  = '3'; //7
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_get_turn16
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      51
	MOVWF      INDF+0
L_get_turn16:
;final .c,90 :: 		if(password[i]==10)    password[i]  = '6';  //8
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_get_turn17
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      54
	MOVWF      INDF+0
L_get_turn17:
;final .c,91 :: 		if(password[i]==11)    password[i]  = '9';
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_get_turn18
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      57
	MOVWF      INDF+0
L_get_turn18:
;final .c,92 :: 		if(password[i]==8)    password[i]  = '0';      //14 0
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_get_turn19
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
L_get_turn19:
;final .c,93 :: 		if(password[i]==15)    return ;
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L_get_turn20
	GOTO       L_end_get_turn
L_get_turn20:
;final .c,94 :: 		Lcd_Chr(2, i+1, password[i]);         //Prints character on Lcd at specified position
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       _i+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _i+0, 0
	ADDLW      _password+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;final .c,67 :: 		for(i=0;i<5;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;final .c,96 :: 		}
	GOTO       L_get_turn3
L_get_turn4:
;final .c,97 :: 		memset(password, 0, 5);
	MOVLW      _password+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      5
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;final .c,98 :: 		goto loop ;
	GOTO       ___get_turn_loop
;final .c,100 :: 		}
L_end_get_turn:
	RETURN
; end of _get_turn

_turn_count:

;final .c,102 :: 		void turn_count()
;final .c,104 :: 		unsigned int result = atol(password);
	MOVLW      _password+0
	MOVWF      FARG_atol_s+0
	CALL       _atol+0
	MOVF       R0+0, 0
	MOVWF      turn_count_result_L0+0
	MOVF       R0+1, 0
	MOVWF      turn_count_result_L0+1
;final .c,106 :: 		int oldstate = 0;
	CLRF       turn_count_oldstate_L0+0
	CLRF       turn_count_oldstate_L0+1
;final .c,107 :: 		unsigned  int count = result;
	MOVF       turn_count_result_L0+0, 0
	MOVWF      turn_count_count_L0+0
	MOVF       turn_count_result_L0+1, 0
	MOVWF      turn_count_count_L0+1
;final .c,109 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;final .c,110 :: 		Lcd_Out(1, 1, " Motor Running");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_final_32+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;final .c,112 :: 		for (x=1;x<=count;)
	MOVLW      1
	MOVWF      turn_count_x_L0+0
	MOVLW      0
	MOVWF      turn_count_x_L0+1
L_turn_count21:
	MOVF       turn_count_x_L0+1, 0
	SUBWF      turn_count_count_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__turn_count36
	MOVF       turn_count_x_L0+0, 0
	SUBWF      turn_count_count_L0+0, 0
L__turn_count36:
	BTFSS      STATUS+0, 0
	GOTO       L_turn_count22
;final .c,114 :: 		IntToStr(count, txt);
	MOVF       turn_count_count_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       turn_count_count_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      turn_count_txt_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;final .c,115 :: 		Lcd_Out(2,2 , txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      turn_count_txt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;final .c,116 :: 		if (portb.f0==0)
	BTFSC      PORTB+0, 0
	GOTO       L_turn_count24
;final .c,118 :: 		oldstate = 1;                              // Update flag
	MOVLW      1
	MOVWF      turn_count_oldstate_L0+0
	MOVLW      0
	MOVWF      turn_count_oldstate_L0+1
;final .c,119 :: 		}
	GOTO       L_turn_count25
L_turn_count24:
;final .c,120 :: 		else if (oldstate==1 && portb.f0==1 )
	MOVLW      0
	XORWF      turn_count_oldstate_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__turn_count37
	MOVLW      1
	XORWF      turn_count_oldstate_L0+0, 0
L__turn_count37:
	BTFSS      STATUS+0, 2
	GOTO       L_turn_count28
	BTFSS      PORTB+0, 0
	GOTO       L_turn_count28
L__turn_count31:
;final .c,123 :: 		count =count-1;                            // Invert PORTC
	MOVLW      1
	SUBWF      turn_count_count_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       turn_count_count_L0+1, 1
;final .c,124 :: 		oldstate = 0;                             // Update flag
	CLRF       turn_count_oldstate_L0+0
	CLRF       turn_count_oldstate_L0+1
;final .c,125 :: 		}
L_turn_count28:
L_turn_count25:
;final .c,126 :: 		}
	GOTO       L_turn_count21
L_turn_count22:
;final .c,127 :: 		portb.f4=0;
	BCF        PORTB+0, 4
;final .c,128 :: 		portb.f5=0;
	BCF        PORTB+0, 5
;final .c,129 :: 		portb.f6=0;
	BCF        PORTB+0, 6
;final .c,130 :: 		portb.f7=0;
	BCF        PORTB+0, 7
;final .c,131 :: 		return;
;final .c,132 :: 		}
L_end_turn_count:
	RETURN
; end of _turn_count

_forward:

;final .c,134 :: 		void forward()
;final .c,136 :: 		portb.f4=1;   // clockwise
	BSF        PORTB+0, 4
;final .c,137 :: 		portb.f5=0;
	BCF        PORTB+0, 5
;final .c,138 :: 		portb.f6=1;
	BSF        PORTB+0, 6
;final .c,139 :: 		portb.f7=0;
	BCF        PORTB+0, 7
;final .c,140 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_forward29:
	DECFSZ     R13+0, 1
	GOTO       L_forward29
	DECFSZ     R12+0, 1
	GOTO       L_forward29
	DECFSZ     R11+0, 1
	GOTO       L_forward29
	NOP
	NOP
;final .c,141 :: 		portb.f4=0;   // all off
	BCF        PORTB+0, 4
;final .c,142 :: 		portb.f5=0;
	BCF        PORTB+0, 5
;final .c,143 :: 		portb.f6=0;
	BCF        PORTB+0, 6
;final .c,144 :: 		portb.f7=0;
	BCF        PORTB+0, 7
;final .c,146 :: 		}
L_end_forward:
	RETURN
; end of _forward

_backward:

;final .c,147 :: 		void backward()
;final .c,149 :: 		portb.f4=0;   // anti  clockwise
	BCF        PORTB+0, 4
;final .c,150 :: 		portb.f5=1;
	BSF        PORTB+0, 5
;final .c,151 :: 		portb.f6=0;
	BCF        PORTB+0, 6
;final .c,152 :: 		portb.f7=1;
	BSF        PORTB+0, 7
;final .c,153 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_backward30:
	DECFSZ     R13+0, 1
	GOTO       L_backward30
	DECFSZ     R12+0, 1
	GOTO       L_backward30
	DECFSZ     R11+0, 1
	GOTO       L_backward30
	NOP
	NOP
;final .c,154 :: 		portb.f4=0;   //all off
	BCF        PORTB+0, 4
;final .c,155 :: 		portb.f5=0;
	BCF        PORTB+0, 5
;final .c,156 :: 		portb.f6=0;
	BCF        PORTB+0, 6
;final .c,157 :: 		portb.f7=0;
	BCF        PORTB+0, 7
;final .c,159 :: 		}
L_end_backward:
	RETURN
; end of _backward
