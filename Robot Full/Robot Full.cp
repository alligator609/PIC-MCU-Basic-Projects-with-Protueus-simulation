#line 1 "D:/Personal Document/Coding/MICro Controller Project/Project all/Robot Full/Robot Full.c"
unsigned char rb;
void main()
{
ansel=0;
anselh=0;
 C1ON_bit = 0;
 C2ON_bit = 0;

trisd=0;
portd=0;
uart1_init(9600);
delay_ms(10);

while(1)
{
if (UART1_Data_Ready())
{
 rb = UART1_Read();
 UART1_Write(rb);
 }
if(rb=='F')
{
portd=0b00000101;
}
if(rb=='B')
{
portd=0b00001010;
}
if(rb=='R')
{
portd=0b00001001;
}
if(rb=='L')
{
portd=0b00000110;
}
if(rb=='S')
{
portd=0b00000000;
}
}
}
