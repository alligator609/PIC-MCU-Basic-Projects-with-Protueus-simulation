#line 1 "E:/Project c/Project Uc/Leftshift.c"
bit oldstate;
bit leftshift;
void main()
{

 ansel=0;
anselh=0;
trisb =1;
portd = 0b01010101;
trisd = 0;
oldstate=0;
option_reg.f7=0;
while(1)
{
if(button(&portb,0,1,1))
{
oldstate=1;
}
if(oldstate&&button(&portb,0,1,0))
{
leftshift=portd.f7;
portd<<=1;
portd.f0=leftshift;
oldstate=0;
}
}
}
