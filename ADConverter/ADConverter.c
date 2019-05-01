unsigned adc_rd;
void main() 
{
ansel.f0=1;  //use analog port 0 as analog
trisa0_bit=1; //anlog port 0 as input
trisd=0;      //portd as output
trisc=0;     //portc as output
do
{
adc_rd = ADC_READ(0);   // get 10 bit result of  conversetion
portc=adc_rd;     // send lower 8 bit to port c
portd=adc_rd>>8; //send 2 most significant bit in pin0,1
delay_ms(1);     //delay  1ms
}
while(1);
}