// unsigned short Button(unsigned short *port, unsigned short pin, unsigned short time, unsigned short active_state);

bit oldstate;                                    // Old state flag
 bit oldstate1;
 bit   leftshift  ;
 void long_press();
void main() {

  ANSEL  = 0;                                    // Configure AN pins as digital I/O
  ANSELH = 0;
  C1ON_bit = 0;                                  // Disable comparators
  C2ON_bit = 0;
  option_reg.f7=0;
  TRISB0_bit = 1;                                // set RB0 pin as input

  TRISC = 0x00;                                  // Configure PORTC as output
  PORTC = 0b11110000;                                  // Initial PORTC value
  oldstate = 0;

  while(1) {                                // Endless loop

    if (Button(&PORTB, 0, 1, 1)) {        //short press       // Detect logical one //

      oldstate = 1;                              // Update flag
    }
    if (oldstate && Button(&PORTB, 0, 100, 0)) {   // Detect one-to-zero transition
      PORTC = ~PORTC;                            // Invert PORTC
      oldstate = 0;                              // Update flag
    }
       if (Button(&PORTB, 0, 1, 1)) {          //long press


      oldstate1 = 1;
    }
    if (oldstate && Button(&PORTB, 0, 1000, 0)) {
       long_press();
      oldstate1 = 0;
    }
  }
}

void long_press()
{
int i =0;
for (;i<=10;i++)
{
leftshift=portc.f7;
portc<<=1;
portc.f0=leftshift;
delay_ms(500);
}
}