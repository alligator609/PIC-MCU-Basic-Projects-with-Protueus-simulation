 char rb;
void main()
{
ansel=0;
anselh=0;

trisd=0;
trisb=0;
portd=0;
portb=0;
uart1_init(9600);
delay_ms(10);

while(1)
{ 
if (UART1_Data_Ready())
{
      rb = UART1_Read();     // read the received data,
      UART1_Write(rb);
 }
if(rb=='F')             // Forward
{
portd=0b01010000;
 portb.f7=1;
}
else if(rb=='B')            // Backward
{
portd=0b10100000;
 portb.f7=1;
}
else if(rb=='R')                       // Right
{
portd=0b10010000;
portb.f7=1;
}
else if(rb=='L')                               //Left
{
 portd=0b01100000;
 portb.f7=1;
}
else if(rb=='S')                               //Stop
{
portd=0b00000000;
}
else if(rb=='X'&& portb.f7==0)
{
 portb.f7=1;
}
else if(rb=='x')
{
 portb.f7=0;
}

}
}