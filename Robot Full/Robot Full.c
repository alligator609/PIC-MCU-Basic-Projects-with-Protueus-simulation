unsigned char rb;
void main()
{
ansel=0;
anselh=0;
  C1ON_bit = 0;                       // Disable comparators
  C2ON_bit = 0;

trisd=0;
portd=0;
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
portd=0b00000101;
}
if(rb=='B')            // Backward
{
portd=0b00001010;
}
if(rb=='R')                       // Right
{
   portd=0b00000110;
}
if(rb=='L')                               //Left
{
 portd=0b00001001;
}
if(rb=='S')                               //Stop
{
portd=0b00000000;
}
}
}