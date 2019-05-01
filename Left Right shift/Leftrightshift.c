bit oldstate;
bit leftshift;
bit rightshift;
void main() 
{
ansel=0;
anselh=0;
trisb=1;
trisd=0;
portd=0b00001111;
//option_reg.f7=0;
oldstate = 0;
while(1)
{
if(button(&portb,0,1,1))
{
oldstate = 1;
}
if(oldstate&&button(&portb,0,1,0))
{
rightshift=portd.f0;
portd>>=1;
 portd.f7 =rightshift ;
oldstate = 0;
}
if(button(&portb,1,1,1))
{
oldstate = 1;
}
if(oldstate&&button(&portb,1,1,0))
{
leftshift=portd.f7;
portd<<=1;
portd.f0=leftshift;
oldstate=0;
}
}
}