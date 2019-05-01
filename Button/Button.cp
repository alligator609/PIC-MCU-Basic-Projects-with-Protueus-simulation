#line 1 "D:/Personal Document/Coding/MICro Controller Project/Button/Button.c"


bit oldstate;
 bit oldstate1;
 bit leftshift ;
 void long_press();
void main() {

 ANSEL = 0;
 ANSELH = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;
 option_reg.f7=0;
 TRISB0_bit = 1;

 TRISC = 0x00;
 PORTC = 0b11110000;
 oldstate = 0;

 while(1) {

 if (Button(&PORTB, 0, 1, 1)) {

 oldstate = 1;
 }
 if (oldstate && Button(&PORTB, 0, 100, 0)) {
 PORTC = ~PORTC;
 oldstate = 0;
 }
 if (Button(&PORTB, 0, 1, 1)) {


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
