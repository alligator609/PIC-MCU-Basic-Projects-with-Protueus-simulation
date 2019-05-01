 bit oldstate;
 void main()
{
trisd=0;
trisb=1;
ansel=0;
anselh=0;
option_reg.f7=0;
oldstate=0;
portd=0b01010101;
while(1)
{
if(button(&portb,0,1,1))
{
oldstate=1;
}
if(oldstate&&button(&portb,0,1,0))
{
portd=~portd;
oldstate=0;

}
}
}