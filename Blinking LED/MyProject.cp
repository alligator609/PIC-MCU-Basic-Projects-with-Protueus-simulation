#line 1 "D:/Personal/MICro Controller Project/Project all/Blinking LED/MyProject.c"
void main()
{
TRISD=0;
do
{
portd=0b00000001;
delay_ms(500);
portd=0b00000010;
delay_ms(500);
portd=0b00000100;
delay_ms(500);
portd=0b00001000;
delay_ms(500);
portd=0b00010000;
delay_ms(500);
portd=0b00100000;
delay_ms(500);
portd=0b01000000;
delay_ms(500);
portd=0b10000000;
delay_ms(500);
}
while(1);
}
