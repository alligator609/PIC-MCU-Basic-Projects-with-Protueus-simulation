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
trise.f0=0;
porte.f0=0;
portd=0;
while(1)
{
if(portb==0b00001010)            // Forward       0011
{
portd=0b01010101;
delay_ms(10);
}
else if(portb==0b00001001)            // Backward     0110
{
portd=0b10101010;
delay_ms(10);
}
else if(portb==0b00001110)                     // Right   0111
{
   portd=0b01100110;
   delay_ms(10);
}
else if(portb==0b00001101)                              //Left  1011
{
 portd=0b10011001;
 delay_ms(10);
}
else if(portb==0b00001111)                              //alll positive
{
 portd=0b11111111;
 porte.f0=0;
 delay_ms(10);
}

else if(portb==0b00001100)                              //weapon forward
{
portd=0b01010101;
porte.f0=1;
delay_ms(10);
}

else if(portb==0b00000110)            //  weapone Backward
{
portd=0b10101010;
porte.f0=1;
delay_ms(10);
}

else if(portb==0b00000111)                     // weapone Right
{
   portd=0b01100110;
   porte.f0=1;
   delay_ms(10);
}
else if(portb==0b00001000)                              //weapone Left
{
 portd=0b10011001;
 porte.f0=1;
 delay_ms(10);
}

else                            //Stop
{
portd=0b00000000;
porte.f0=0;
delay_ms(10);
}
}
}