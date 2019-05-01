void main()
{
 trisb.f0=1; //use portb 0 pin as input
 trisb.f1=1; //use portb 1 pin as input
 trisb.f2=1; //use portb 2 pin as input
 trisd=0;    // port d as output
 ansel=0;    // disable adc pin (0-7)
 portd=0x00; // set all pin in port d as logic zero
 anselh=0;   // disable high adc pin(8-13)
 option_reg.f7=0; // anable internal pull up resistor
while(1)          // infinite loop
 {
 if(portb.f0==0)  // if button prressed
 {
 portd=0x01;     // clockwise motorrun
 }
 if(portb.f1==0)  // if button prressed
 {
 portd=0x02;    // anticlockwise motor run
 }
 if(portb.f2==0)  // if button prressed
 {
 portd=0x00;    // motor stop
 }
 }
}