#line 1 "H:/ADConverter/ADConverter.c"
unsigned adc_rd;
void main()
{
ansel.f0=1;
trisa0_bit=1;
trisd=0;
trisc=0;
do
{
adc_rd = ADC_READ(0);
portc=adc_rd;
portd=adc_rd>>8;
delay_ms(1);
}
while(1);
}
