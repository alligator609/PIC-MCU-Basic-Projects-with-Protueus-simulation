void main()
{
int x;
ansel=0;
anselh=0;
option_reg.f7=0;
trisb=0x0F ;                   // 4 sensor
portb.f4=0;
portb.f5=0;
portb.f6=0;
portb.f7=0;
trisd=0x00 ;
portd=0;
while(1)
{
if(portb==0b00000011)            // Forward       0011
{
portd=0b01010101;
delay_ms(10);
}
else if(portb==0b00000110)            // Backward     0110
{
portd=0b10101010;
delay_ms(10);
}
else if(portb==0b00000111)                     // Right   0111
{
   portd=0b01100110;
   delay_ms(10);
}
else if(portb==0b00001011)                              //Left  1011
{
 portd=0b10011001;
 delay_ms(10);
}
else if(portb==0b00001111)                              //alll positive
{
 portd=0b11111111;
 delay_ms(10);
}

else if(portb==0b00000000)                              //Stepper up   0000
{
 for ( x=0;x<50;x++)
  if(portb==0x03)
  {
    PORTD = 0b00010000;
    Delay_ms(250);
    PORTD = 0b01000000;
    Delay_ms(250);
    PORTD = 0b00100000;
    Delay_ms(250);
    PORTD = 0b10000000;
    Delay_ms(250);
   }
   else
   {
   break;
   }
}

 else if(portb==0x01)                              //Stepper down  0001
{
 for ( x=1;x<50;x++)
 if(portb==0x0C)
  {
      PORTD = 0b10000000;
      Delay_ms(250);
      PORTD = 0b00100000;
      Delay_ms(250);
      PORTD = 0b01000000;
      Delay_ms(250);
      PORTD = 0b00010000;
      Delay_ms(250);
   }
   else
   {
   break;
   }
}

else                            //Stop
{
portd=0b00000000;
delay_ms(10);
}
}
}