#line 1 "D:/Personal/MICro Controller Project/Project all/Motor run with button/Button motor .c"
void main()
{
 trisb.f0=1;
 trisb.f1=1;
 trisb.f2=1;
 trisd=0;
 ansel=0;
 portd=0x00;
 anselh=0;
 option_reg.f7=0;
while(1)
 {
 if(portb.f0==0)
 {
 portd=0x01;
 }
 if(portb.f1==0)
 {
 portd=0x02;
 }
 if(portb.f2==0)
 {
 portd=0x00;
 }
 }
}
