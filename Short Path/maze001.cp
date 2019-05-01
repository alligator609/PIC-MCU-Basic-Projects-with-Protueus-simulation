#line 1 "C:/Users/Xbot/Desktop/Short Path/maze001.c"





int path ;
int path1=0;
char di[50];
forward();
left () ;
right () ;
u_turn () ;
left_turn();
right_turn();
straight () ;
replay ();
stop();
short_path();
done();
void main()
{

ansel =0;
anselh=0;
C1ON_bit = 0;
C2ON_bit = 0;
trisb=1;
trisd=0;
option_reg.f7=0;
while (1)
{
if (  portb.f4 ==1&& portb.f3 ==1 && portb.f2 ==0 &&  portb.f1  ==1 &&  portb.f0  ==1 )
 {
 forward () ;
 }
else if (  portb.f4  == 1 &&  portb.f3 == 1 && portb.f2 ==0 &&  portb.f1  ==0 &&  portb.f0  ==0 )
 {
 forward () ;
 if (  portb.f4 ==1&& portb.f3 ==1 && portb.f2 ==0 &&  portb.f1  ==1 &&  portb.f0  ==1 )
 {
 straight ();
 }
 else {
 right ();
 }
 }
else if (  portb.f4  == 0 &&  portb.f3 == 0 && portb.f2 ==0 &&  portb.f1  ==1 &&  portb.f0  ==1 )
 {
 forward();

 if( portb.f4  == 0 &&  portb.f3 == 0 && portb.f2 ==1 &&  portb.f1  ==0 &&  portb.f0  ==0)
 {
 left_turn () ;
 }
 else
 {
 left();
 }
 }
else if (  portb.f4  == 0 &&  portb.f3 == 0 && portb.f2 ==0 &&  portb.f1  ==0 &&  portb.f0  ==0 )
 {
 forward();
 if( portb.f4  == 0 &&  portb.f3 == 0 && portb.f2 ==0 &&  portb.f1  ==0 &&  portb.f0  ==0 )
 {
 stop();
 }
#line 71 "C:/Users/Xbot/Desktop/Short Path/maze001.c"
 else
 {
 left_turn();
 }
 }
 else if ( portb.f4  ==1 &&  portb.f3 ==1 &&  portb.f2 ==1 &&  portb.f1  ==1 &&  portb.f0  ==1 )
 {
 u_turn();
 }
}
}

forward()
{
portd=0b00000101 ;
delay_ms(10);
}
right ()
{
do {
portd = 0b00000100 ;
delay_ms(10);
}while( portb.f2 ==0);
}
left ()
{
do{
portd=0b00000001 ;
delay_ms(10);
}while( portb.f2 ==0);
}
left_turn()
{
do {portd=0b00000001 ;
 delay_ms(10);
 } while( portb.f2 ==0);
 di[path]='L' ;
 path++;
 short_path();
}
straight()
{
portd=0b00000101 ;
delay_ms(10);
di[path]='S' ;
path++;
short_path();
}
stop()
{
di[path]='D' ;
portd=0b00000000;
delay_ms(5000);
replay();
}
u_turn()
{
do {portd=0b00001001 ;
 delay_ms(10);
 } while( portb.f2 ==0);
 di[path]='U' ;
 path++;
 short_path();
}
done()
{
 portd=0;
}

short_path()
{
 int short_done=0;
 if(di[path]-3=='L' && di[path]-1=='R')
 {
 path-=3;
 di[path]='U';
 short_done=1;
 }
 if(di[path]-3=='L' && di[path]-1=='S'&&short_done==0)
 {
 path-=3;
 di[path]='R';
 short_done=1;
 }
 if(di[path]-3=='R' && di[path]-1=='L'&&short_done==0)
 {
 path-=3;
 di[path]='U';
 short_done=1;
 }
 if(di[path]-3=='S' && di[path]-1=='L'&&short_done==0)
 {
 path-=3;
 di[path]='R';
 short_done=1;
 }
 if(di[path]-3=='S' && di[path]-1=='S'&&short_done==0)
 {
 path-=3;
 di[path]='U';
 short_done=1;
 }
 if(di[path]-3=='L' && di[path]-1=='L'&&short_done==0)
 {
 path-=3;
 di[path]='S';
 short_done=1;
 }

}
replay ()
{

while(di[path1=='D'])
 {
 if (  portb.f4 ==1&& portb.f3 ==1 && portb.f2 ==0 &&  portb.f1  ==1 &&  portb.f0  ==1 )
 {
 forward () ;
 }
 else
 {
 if(di[path1=='L'])
 {
 left ();
 path1++;
 }
 if(di[path1=='R'])
 {
 right ();
 path1++;
 }
 if(di[path1=='S'])
 {
 forward ();
 path1++;
 }
 if(di[path1=='D'])
 {
 done();
 }
 }
 }
}
