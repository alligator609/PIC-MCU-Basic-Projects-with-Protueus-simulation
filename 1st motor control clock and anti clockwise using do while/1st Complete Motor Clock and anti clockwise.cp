#line 1 "C:/Users/ASHIK/Desktop/DC Motor Driving PIC Microcontroller and L293D/1st Complete Motor Clock and anti clockwise.c"
void main()
{
trisd=0;
portd=0;
do
{
portd=0x05;
delay_ms(5000);
portd=0x0A;
delay_ms(5000);
}
while(1);
}
