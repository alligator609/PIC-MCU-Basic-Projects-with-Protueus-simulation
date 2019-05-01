
void main()
{
ansel=0;
anselh=0;
trisb=0x1F ;                   // 5 sensor
portB.F5=0;
portB.F6=0;
portB.F7=0;
trisd=0x00 ;
portd=0;
pwm1_init(8000)  ;      //right motor pwm
pwm2_init(8000) ;       //left motor pwm
pwm1_start() ;
pwm2_start() ;
pwm1_set_duty(100);
pwm2_set_duty(100);
while(1)
{
if(portb==0x03)     //hard left
{
 pwm1_set_duty(202);
 pwm2_set_duty(202);
 portd=0b00001001 ;
 delay_ms(50);
}
if(portb==0x13)      //  soft   left
{
pwm1_set_duty(202);
pwm2_set_duty(0);
portd=0b00000001 ;
delay_ms(20);
}
if(portb==0x19)  // soft_right();
{
  pwm1_set_duty(0);
pwm2_set_duty(202);
portd=0b00000100 ;
delay_ms(20);
}
if(portb==0x18)   // hard_right();
{
  pwm1_set_duty(202);
pwm2_set_duty(202);
portd=0b00000110;
delay_ms(50);
}
if(portb==0x1B)   // straight() ;
{
 pwm1_set_duty(253);
pwm2_set_duty(253);
portd=0b00000101;
}
if(portb==0x04)   //stop() ;
{
pwm1_set_duty(0);
pwm1_set_duty(0);
portd=0b00001111;

}
if(portb==0x0B)      // left  Corner
{
pwm1_set_duty(202);
pwm2_set_duty(0);
portd=0b00000001 ;
delay_ms(500);
}
if(portb==0x1A)      // Right  Corner
{
pwm1_set_duty(202);
pwm2_set_duty(0);
portd=0b00000100 ;
delay_ms(500);
}
if(portb==0x00)      // Loop Forward black line
{
pwm1_set_duty(202);
pwm2_set_duty(0);
portd=0b00000100 ;
delay_ms(50);
}
}
}