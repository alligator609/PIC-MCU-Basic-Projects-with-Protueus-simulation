void main()
{
trisd=0;
portd=0;
do
{
portd=0x05;   // clockwise
delay_ms(5000);
portd=0x0A;   //anti clockwise
delay_ms(5000);
}
while(1);
}