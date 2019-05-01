
_main:

;maze001.c,20 :: 		void main()
;maze001.c,23 :: 		ansel =0;
	CLRF       ANSEL+0
;maze001.c,24 :: 		anselh=0;
	CLRF       ANSELH+0
;maze001.c,25 :: 		C1ON_bit = 0;                                  // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;maze001.c,26 :: 		C2ON_bit = 0;                                  // Disable comparators
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;maze001.c,27 :: 		trisb=1;
	MOVLW      1
	MOVWF      TRISB+0
;maze001.c,28 :: 		trisd=0;
	CLRF       TRISD+0
;maze001.c,29 :: 		option_reg.f7=0;
	BCF        OPTION_REG+0, 7
;maze001.c,30 :: 		while (1)
L_main0:
;maze001.c,32 :: 		if ( ll==1&&l==1 &&m==0 && r ==1 && rr ==1 )              // condition        1  1  0  1  1
	BTFSS      PORTB+0, 4
	GOTO       L_main4
	BTFSS      PORTB+0, 3
	GOTO       L_main4
	BTFSC      PORTB+0, 2
	GOTO       L_main4
	BTFSS      PORTB+0, 1
	GOTO       L_main4
	BTFSS      PORTB+0, 0
	GOTO       L_main4
L__main87:
;maze001.c,34 :: 		forward () ;
	CALL       _forward+0
;maze001.c,35 :: 		}
	GOTO       L_main5
L_main4:
;maze001.c,36 :: 		else if  ( ll == 1 && l== 1 &&m==0 && r ==0 && rr ==0 )                     //    r8 or state
	BTFSS      PORTB+0, 4
	GOTO       L_main8
	BTFSS      PORTB+0, 3
	GOTO       L_main8
	BTFSC      PORTB+0, 2
	GOTO       L_main8
	BTFSC      PORTB+0, 1
	GOTO       L_main8
	BTFSC      PORTB+0, 0
	GOTO       L_main8
L__main86:
;maze001.c,38 :: 		forward () ;
	CALL       _forward+0
;maze001.c,39 :: 		if ( ll==1&&l==1 &&m==0 && r ==1 && rr ==1 )                   // if straigt possible go straigt
	BTFSS      PORTB+0, 4
	GOTO       L_main11
	BTFSS      PORTB+0, 3
	GOTO       L_main11
	BTFSC      PORTB+0, 2
	GOTO       L_main11
	BTFSS      PORTB+0, 1
	GOTO       L_main11
	BTFSS      PORTB+0, 0
	GOTO       L_main11
L__main85:
;maze001.c,41 :: 		straight ();
	CALL       _straight+0
;maze001.c,42 :: 		}
	GOTO       L_main12
L_main11:
;maze001.c,44 :: 		right ();
	CALL       _right+0
;maze001.c,45 :: 		}
L_main12:
;maze001.c,46 :: 		}
	GOTO       L_main13
L_main8:
;maze001.c,47 :: 		else if   ( ll == 0 && l== 0 &&m==0 && r ==1 && rr ==1 )                    //    default  left or left turn   checking
	BTFSC      PORTB+0, 4
	GOTO       L_main16
	BTFSC      PORTB+0, 3
	GOTO       L_main16
	BTFSC      PORTB+0, 2
	GOTO       L_main16
	BTFSS      PORTB+0, 1
	GOTO       L_main16
	BTFSS      PORTB+0, 0
	GOTO       L_main16
L__main84:
;maze001.c,49 :: 		forward();
	CALL       _forward+0
;maze001.c,51 :: 		if(ll == 0 && l== 0 &&m==1 && r ==0 && rr ==0)                   // if straight possible then turn left
	BTFSC      PORTB+0, 4
	GOTO       L_main19
	BTFSC      PORTB+0, 3
	GOTO       L_main19
	BTFSS      PORTB+0, 2
	GOTO       L_main19
	BTFSC      PORTB+0, 1
	GOTO       L_main19
	BTFSC      PORTB+0, 0
	GOTO       L_main19
L__main83:
;maze001.c,53 :: 		left_turn () ;
	CALL       _left_turn+0
;maze001.c,54 :: 		}
	GOTO       L_main20
L_main19:
;maze001.c,57 :: 		left();
	CALL       _left+0
;maze001.c,58 :: 		}
L_main20:
;maze001.c,59 :: 		}
	GOTO       L_main21
L_main16:
;maze001.c,60 :: 		else if  (  ll == 0 && l== 0 &&m==0 && r ==0 && rr ==0 )            // T or cross or complete
	BTFSC      PORTB+0, 4
	GOTO       L_main24
	BTFSC      PORTB+0, 3
	GOTO       L_main24
	BTFSC      PORTB+0, 2
	GOTO       L_main24
	BTFSC      PORTB+0, 1
	GOTO       L_main24
	BTFSC      PORTB+0, 0
	GOTO       L_main24
L__main82:
;maze001.c,62 :: 		forward();
	CALL       _forward+0
;maze001.c,63 :: 		if(ll == 0 && l== 0 &&m==0 && r ==0 && rr ==0 )                 // all black
	BTFSC      PORTB+0, 4
	GOTO       L_main27
	BTFSC      PORTB+0, 3
	GOTO       L_main27
	BTFSC      PORTB+0, 2
	GOTO       L_main27
	BTFSC      PORTB+0, 1
	GOTO       L_main27
	BTFSC      PORTB+0, 0
	GOTO       L_main27
L__main81:
;maze001.c,65 :: 		stop();                                          // solve complete ready to go by shortest way
	CALL       _stop+0
;maze001.c,66 :: 		}
	GOTO       L_main28
L_main27:
;maze001.c,73 :: 		left_turn();
	CALL       _left_turn+0
;maze001.c,74 :: 		}
L_main28:
;maze001.c,75 :: 		}
	GOTO       L_main29
L_main24:
;maze001.c,76 :: 		else if (ll ==1 && l==1 && m==1 && r ==1 && rr ==1 )
	BTFSS      PORTB+0, 4
	GOTO       L_main32
	BTFSS      PORTB+0, 3
	GOTO       L_main32
	BTFSS      PORTB+0, 2
	GOTO       L_main32
	BTFSS      PORTB+0, 1
	GOTO       L_main32
	BTFSS      PORTB+0, 0
	GOTO       L_main32
L__main80:
;maze001.c,78 :: 		u_turn();
	CALL       _u_turn+0
;maze001.c,79 :: 		}
L_main32:
L_main29:
L_main21:
L_main13:
L_main5:
;maze001.c,80 :: 		}
	GOTO       L_main0
;maze001.c,81 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_forward:

;maze001.c,83 :: 		forward()
;maze001.c,85 :: 		portd=0b00000101 ;              // forward
	MOVLW      5
	MOVWF      PORTD+0
;maze001.c,86 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_forward33:
	DECFSZ     R13+0, 1
	GOTO       L_forward33
	DECFSZ     R12+0, 1
	GOTO       L_forward33
	NOP
;maze001.c,87 :: 		}
L_end_forward:
	RETURN
; end of _forward

_right:

;maze001.c,88 :: 		right ()
;maze001.c,90 :: 		do {
L_right34:
;maze001.c,91 :: 		portd = 0b00000100 ;             // right
	MOVLW      4
	MOVWF      PORTD+0
;maze001.c,92 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_right37:
	DECFSZ     R13+0, 1
	GOTO       L_right37
	DECFSZ     R12+0, 1
	GOTO       L_right37
	NOP
;maze001.c,93 :: 		}while(m==0);
	BTFSS      PORTB+0, 2
	GOTO       L_right34
;maze001.c,94 :: 		}
L_end_right:
	RETURN
; end of _right

_left:

;maze001.c,95 :: 		left ()
;maze001.c,97 :: 		do{
L_left38:
;maze001.c,98 :: 		portd=0b00000001 ;              // left
	MOVLW      1
	MOVWF      PORTD+0
;maze001.c,99 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_left41:
	DECFSZ     R13+0, 1
	GOTO       L_left41
	DECFSZ     R12+0, 1
	GOTO       L_left41
	NOP
;maze001.c,100 :: 		}while(m==0);
	BTFSS      PORTB+0, 2
	GOTO       L_left38
;maze001.c,101 :: 		}
L_end_left:
	RETURN
; end of _left

_left_turn:

;maze001.c,102 :: 		left_turn()
;maze001.c,104 :: 		do {portd=0b00000001 ;              // left
L_left_turn42:
	MOVLW      1
	MOVWF      PORTD+0
;maze001.c,105 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_left_turn45:
	DECFSZ     R13+0, 1
	GOTO       L_left_turn45
	DECFSZ     R12+0, 1
	GOTO       L_left_turn45
	NOP
;maze001.c,106 :: 		} while(m==0);
	BTFSS      PORTB+0, 2
	GOTO       L_left_turn42
;maze001.c,107 :: 		di[path]='L' ;                   // enter L
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      76
	MOVWF      INDF+0
;maze001.c,108 :: 		path++;
	INCF       _path+0, 1
	BTFSC      STATUS+0, 2
	INCF       _path+1, 1
;maze001.c,109 :: 		short_path();
	CALL       _short_path+0
;maze001.c,110 :: 		}
L_end_left_turn:
	RETURN
; end of _left_turn

_straight:

;maze001.c,111 :: 		straight()
;maze001.c,113 :: 		portd=0b00000101 ;              // forward
	MOVLW      5
	MOVWF      PORTD+0
;maze001.c,114 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_straight46:
	DECFSZ     R13+0, 1
	GOTO       L_straight46
	DECFSZ     R12+0, 1
	GOTO       L_straight46
	NOP
;maze001.c,115 :: 		di[path]='S' ;                    // enter S
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      83
	MOVWF      INDF+0
;maze001.c,116 :: 		path++;
	INCF       _path+0, 1
	BTFSC      STATUS+0, 2
	INCF       _path+1, 1
;maze001.c,117 :: 		short_path();
	CALL       _short_path+0
;maze001.c,118 :: 		}
L_end_straight:
	RETURN
; end of _straight

_stop:

;maze001.c,119 :: 		stop()                             // stop and ready to go on shortest way
;maze001.c,121 :: 		di[path]='D' ;                   // done
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      68
	MOVWF      INDF+0
;maze001.c,122 :: 		portd=0b00000000;
	CLRF       PORTD+0
;maze001.c,123 :: 		delay_ms(5000);                  //wait 5 sec to replace again in the start
	MOVLW      127
	MOVWF      R11+0
	MOVLW      212
	MOVWF      R12+0
	MOVLW      49
	MOVWF      R13+0
L_stop47:
	DECFSZ     R13+0, 1
	GOTO       L_stop47
	DECFSZ     R12+0, 1
	GOTO       L_stop47
	DECFSZ     R11+0, 1
	GOTO       L_stop47
	NOP
	NOP
;maze001.c,124 :: 		replay();
	CALL       _replay+0
;maze001.c,125 :: 		}
L_end_stop:
	RETURN
; end of _stop

_u_turn:

;maze001.c,126 :: 		u_turn()
;maze001.c,128 :: 		do {portd=0b00001001 ;              // left U turn
L_u_turn48:
	MOVLW      9
	MOVWF      PORTD+0
;maze001.c,129 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_u_turn51:
	DECFSZ     R13+0, 1
	GOTO       L_u_turn51
	DECFSZ     R12+0, 1
	GOTO       L_u_turn51
	NOP
;maze001.c,130 :: 		} while(m==0);
	BTFSS      PORTB+0, 2
	GOTO       L_u_turn48
;maze001.c,131 :: 		di[path]='U' ;               // enter U
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      85
	MOVWF      INDF+0
;maze001.c,132 :: 		path++;
	INCF       _path+0, 1
	BTFSC      STATUS+0, 2
	INCF       _path+1, 1
;maze001.c,133 :: 		short_path();
	CALL       _short_path+0
;maze001.c,134 :: 		}
L_end_u_turn:
	RETURN
; end of _u_turn

_done:

;maze001.c,135 :: 		done()
;maze001.c,137 :: 		portd=0;
	CLRF       PORTD+0
;maze001.c,138 :: 		}
L_end_done:
	RETURN
; end of _done

_short_path:

;maze001.c,140 :: 		short_path()
;maze001.c,142 :: 		int short_done=0;
	CLRF       short_path_short_done_L0+0
	CLRF       short_path_short_done_L0+1
;maze001.c,143 :: 		if(di[path]-3=='L' && di[path]-1=='R')         //LUR=U
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      3
	SUBWF      INDF+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path105
	MOVLW      76
	XORWF      R1+0, 0
L__short_path105:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path54
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      1
	SUBWF      INDF+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path106
	MOVLW      82
	XORWF      R1+0, 0
L__short_path106:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path54
L__short_path93:
;maze001.c,145 :: 		path-=3;
	MOVLW      3
	SUBWF      _path+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _path+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _path+0
	MOVF       R0+1, 0
	MOVWF      _path+1
;maze001.c,146 :: 		di[path]='U';
	MOVF       R0+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      85
	MOVWF      INDF+0
;maze001.c,147 :: 		short_done=1;
	MOVLW      1
	MOVWF      short_path_short_done_L0+0
	MOVLW      0
	MOVWF      short_path_short_done_L0+1
;maze001.c,148 :: 		}
L_short_path54:
;maze001.c,149 :: 		if(di[path]-3=='L' && di[path]-1=='S'&&short_done==0)   //   LUS=R
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      3
	SUBWF      INDF+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path107
	MOVLW      76
	XORWF      R1+0, 0
L__short_path107:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path57
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      1
	SUBWF      INDF+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path108
	MOVLW      83
	XORWF      R1+0, 0
L__short_path108:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path57
	MOVLW      0
	XORWF      short_path_short_done_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path109
	MOVLW      0
	XORWF      short_path_short_done_L0+0, 0
L__short_path109:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path57
L__short_path92:
;maze001.c,151 :: 		path-=3;
	MOVLW      3
	SUBWF      _path+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _path+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _path+0
	MOVF       R0+1, 0
	MOVWF      _path+1
;maze001.c,152 :: 		di[path]='R';
	MOVF       R0+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
;maze001.c,153 :: 		short_done=1;
	MOVLW      1
	MOVWF      short_path_short_done_L0+0
	MOVLW      0
	MOVWF      short_path_short_done_L0+1
;maze001.c,154 :: 		}
L_short_path57:
;maze001.c,155 :: 		if(di[path]-3=='R' && di[path]-1=='L'&&short_done==0)     //RUL=U
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      3
	SUBWF      INDF+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path110
	MOVLW      82
	XORWF      R1+0, 0
L__short_path110:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path60
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      1
	SUBWF      INDF+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path111
	MOVLW      76
	XORWF      R1+0, 0
L__short_path111:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path60
	MOVLW      0
	XORWF      short_path_short_done_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path112
	MOVLW      0
	XORWF      short_path_short_done_L0+0, 0
L__short_path112:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path60
L__short_path91:
;maze001.c,157 :: 		path-=3;
	MOVLW      3
	SUBWF      _path+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _path+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _path+0
	MOVF       R0+1, 0
	MOVWF      _path+1
;maze001.c,158 :: 		di[path]='U';
	MOVF       R0+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      85
	MOVWF      INDF+0
;maze001.c,159 :: 		short_done=1;
	MOVLW      1
	MOVWF      short_path_short_done_L0+0
	MOVLW      0
	MOVWF      short_path_short_done_L0+1
;maze001.c,160 :: 		}
L_short_path60:
;maze001.c,161 :: 		if(di[path]-3=='S' && di[path]-1=='L'&&short_done==0)         //SUL=R
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      3
	SUBWF      INDF+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path113
	MOVLW      83
	XORWF      R1+0, 0
L__short_path113:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path63
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      1
	SUBWF      INDF+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path114
	MOVLW      76
	XORWF      R1+0, 0
L__short_path114:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path63
	MOVLW      0
	XORWF      short_path_short_done_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path115
	MOVLW      0
	XORWF      short_path_short_done_L0+0, 0
L__short_path115:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path63
L__short_path90:
;maze001.c,163 :: 		path-=3;
	MOVLW      3
	SUBWF      _path+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _path+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _path+0
	MOVF       R0+1, 0
	MOVWF      _path+1
;maze001.c,164 :: 		di[path]='R';
	MOVF       R0+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      82
	MOVWF      INDF+0
;maze001.c,165 :: 		short_done=1;
	MOVLW      1
	MOVWF      short_path_short_done_L0+0
	MOVLW      0
	MOVWF      short_path_short_done_L0+1
;maze001.c,166 :: 		}
L_short_path63:
;maze001.c,167 :: 		if(di[path]-3=='S' && di[path]-1=='S'&&short_done==0)         //SUS=U
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      3
	SUBWF      INDF+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path116
	MOVLW      83
	XORWF      R1+0, 0
L__short_path116:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path66
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      1
	SUBWF      INDF+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path117
	MOVLW      83
	XORWF      R1+0, 0
L__short_path117:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path66
	MOVLW      0
	XORWF      short_path_short_done_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path118
	MOVLW      0
	XORWF      short_path_short_done_L0+0, 0
L__short_path118:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path66
L__short_path89:
;maze001.c,169 :: 		path-=3;
	MOVLW      3
	SUBWF      _path+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _path+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _path+0
	MOVF       R0+1, 0
	MOVWF      _path+1
;maze001.c,170 :: 		di[path]='U';
	MOVF       R0+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      85
	MOVWF      INDF+0
;maze001.c,171 :: 		short_done=1;
	MOVLW      1
	MOVWF      short_path_short_done_L0+0
	MOVLW      0
	MOVWF      short_path_short_done_L0+1
;maze001.c,172 :: 		}
L_short_path66:
;maze001.c,173 :: 		if(di[path]-3=='L' && di[path]-1=='L'&&short_done==0)           //LUL=S
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      3
	SUBWF      INDF+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path119
	MOVLW      76
	XORWF      R1+0, 0
L__short_path119:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path69
	MOVF       _path+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      1
	SUBWF      INDF+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path120
	MOVLW      76
	XORWF      R1+0, 0
L__short_path120:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path69
	MOVLW      0
	XORWF      short_path_short_done_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__short_path121
	MOVLW      0
	XORWF      short_path_short_done_L0+0, 0
L__short_path121:
	BTFSS      STATUS+0, 2
	GOTO       L_short_path69
L__short_path88:
;maze001.c,175 :: 		path-=3;
	MOVLW      3
	SUBWF      _path+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _path+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _path+0
	MOVF       R0+1, 0
	MOVWF      _path+1
;maze001.c,176 :: 		di[path]='S';
	MOVF       R0+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVLW      83
	MOVWF      INDF+0
;maze001.c,177 :: 		short_done=1;
	MOVLW      1
	MOVWF      short_path_short_done_L0+0
	MOVLW      0
	MOVWF      short_path_short_done_L0+1
;maze001.c,178 :: 		}
L_short_path69:
;maze001.c,180 :: 		}
L_end_short_path:
	RETURN
; end of _short_path

_replay:

;maze001.c,181 :: 		replay ()                          // check line and di array both and make a dicision
;maze001.c,184 :: 		while(di[path1=='D'])                      // loop until done
L_replay70:
	MOVLW      0
	XORWF      _path1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__replay123
	MOVLW      68
	XORWF      _path1+0, 0
L__replay123:
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_replay71
;maze001.c,186 :: 		if ( ll==1&&l==1 &&m==0 && r ==1 && rr ==1 )              // condition        1  1  0  1  1
	BTFSS      PORTB+0, 4
	GOTO       L_replay74
	BTFSS      PORTB+0, 3
	GOTO       L_replay74
	BTFSC      PORTB+0, 2
	GOTO       L_replay74
	BTFSS      PORTB+0, 1
	GOTO       L_replay74
	BTFSS      PORTB+0, 0
	GOTO       L_replay74
L__replay94:
;maze001.c,188 :: 		forward () ;
	CALL       _forward+0
;maze001.c,189 :: 		}
	GOTO       L_replay75
L_replay74:
;maze001.c,192 :: 		if(di[path1=='L'])
	MOVLW      0
	XORWF      _path1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__replay124
	MOVLW      76
	XORWF      _path1+0, 0
L__replay124:
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_replay76
;maze001.c,194 :: 		left ();
	CALL       _left+0
;maze001.c,195 :: 		path1++;
	INCF       _path1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _path1+1, 1
;maze001.c,196 :: 		}
L_replay76:
;maze001.c,197 :: 		if(di[path1=='R'])
	MOVLW      0
	XORWF      _path1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__replay125
	MOVLW      82
	XORWF      _path1+0, 0
L__replay125:
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_replay77
;maze001.c,199 :: 		right ();
	CALL       _right+0
;maze001.c,200 :: 		path1++;
	INCF       _path1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _path1+1, 1
;maze001.c,201 :: 		}
L_replay77:
;maze001.c,202 :: 		if(di[path1=='S'])
	MOVLW      0
	XORWF      _path1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__replay126
	MOVLW      83
	XORWF      _path1+0, 0
L__replay126:
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_replay78
;maze001.c,204 :: 		forward ();
	CALL       _forward+0
;maze001.c,205 :: 		path1++;
	INCF       _path1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _path1+1, 1
;maze001.c,206 :: 		}
L_replay78:
;maze001.c,207 :: 		if(di[path1=='D'])
	MOVLW      0
	XORWF      _path1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__replay127
	MOVLW      68
	XORWF      _path1+0, 0
L__replay127:
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      _di+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_replay79
;maze001.c,209 :: 		done();
	CALL       _done+0
;maze001.c,210 :: 		}
L_replay79:
;maze001.c,211 :: 		}
L_replay75:
;maze001.c,212 :: 		}
	GOTO       L_replay70
L_replay71:
;maze001.c,213 :: 		}
L_end_replay:
	RETURN
; end of _replay
