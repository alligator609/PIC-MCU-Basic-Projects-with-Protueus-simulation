void main()
{
int old ;
int  old1 ;
ansel=0;
anselh=0;
option_reg.f7=0;
trisb.f0=1;
trisb.f1 = 1;
trisd=0;
portd=0;
while(1)
{
     if ((button(&portb,0,10,0)))
     {
     delay_ms(100);
     old=1;
     }
     if (button(&portb,0,10,0)&&old==1)
     {
      old=0;

     while(1)
     {
     portd.f0=1;
     delay_ms(100);
     portd.f0=0;
     delay_ms(100);
     if(button(&portb,0,10,0))
     break;
     }
     }
          if ((button(&portb,1,10,0)))
     {
     delay_ms(100);
     old1=1;
     }
     if (button(&portb,1,10,0)&&old1==1)
     {
      old1=0;

     while(1)
     {
     portd.f1=1;
     delay_ms(100);
     portd.f1=0;
     delay_ms(100);
     if(button(&portb,1,10,0))
     break;
     }
     }
}
}