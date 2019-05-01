#line 1 "C:/Users/Zia/Desktop/Kuet11/kuet11.c"

void main()
{
ansel=0;
anselh=0;
trisb=0x1F ;
portB.F5=0;
portB.F6=0;
portB.F7=0;
trisd=0x00 ;
portd=0;
pwm1_init(8000) ;
pwm2_init(8000) ;
pwm1_start() ;
pwm2_start() ;
pwm1_set_duty(100);
pwm2_set_duty(100);
while(1)
{
if(portb==0x03)
{
 pwm1_set_duty(202);
 pwm2_set_duty(202);
 portd=0b00001001 ;
 delay_ms(50);
}
if(portb==0x13)
{
pwm1_set_duty(202);
pwm2_set_duty(0);
portd=0b00000001 ;
delay_ms(20);
}
if(portb==0x19)
{
 pwm1_set_duty(0);
pwm2_set_duty(202);
portd=0b00000100 ;
delay_ms(20);
}
if(portb==0x18)
{
 pwm1_set_duty(202);
pwm2_set_duty(202);
portd=0b00000110;
delay_ms(50);
}
#line 54 "C:/Users/Zia/Desktop/Kuet11/kuet11.c"
if(portb==0x04)
{
pwm1_set_duty(0);
pwm1_set_duty(0);
portd=0b00001111;

}
if(portb==0x0B)
{
pwm1_set_duty(202);
pwm2_set_duty(0);
portd=0b00000001 ;
delay_ms(500);
}
if(portb==0x1A)
{
pwm1_set_duty(202);
pwm2_set_duty(0);
portd=0b00000100 ;
delay_ms(500);
}
if(portb==0x00)
{
pwm1_set_duty(202);
pwm2_set_duty(0);
portd=0b00000100 ;
delay_ms(50);
}
}
}
