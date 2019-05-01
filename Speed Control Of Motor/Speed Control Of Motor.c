short duty1 ;
short  duty2 ;
void main() 
{
ansel =0;
anselh=0;
C1ON_bit = 0;
C2ON_bit = 0;        // Disable comparators

trisb=1;
trisd=0;
option_reg.f7=0;

pwm1_init(5000);
pwm2_init(5000);
pwm1_start;
pwm2_start;
duty1 = 50;
duty2 =50 ;
PWM1_SET_DUTY(duty1);
PWM2_SET_DUTY(duty1);

while(1)
 {

 if(portb.f0==0)
   {
   Delay_ms(40);
   }
   if(portb.f0==0)
   {
   portd=0b00000001;
    duty1++;
    PWM1_SET_DUTY(duty1);

   }

   if(portb.f1==0)
   { 
    delay_ms(40);
    }
    if(portb.f1==0)
    {
   portd=0b00000100;
   duty2++;
    PWM2_SET_DUTY(duty1);
   }
    delay_ms(40);


  }
}