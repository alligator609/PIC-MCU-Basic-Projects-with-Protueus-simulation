#define rr portb.f0
#define r portb.f1
#define m portb.f2
#define l portb.f3
#define ll portb.f4
int path ;       // path variable
int path1=0;     // path variable 2
char di[50];    // direction array
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
C1ON_bit = 0;                                  // Disable comparators
C2ON_bit = 0;                                  // Disable comparators
trisb=1;
trisd=0;
option_reg.f7=0;
while (1)
{
if ( ll==1&&l==1 &&m==0 && r ==1 && rr ==1 )              // condition        1  1  0  1  1
   {
   forward () ;
   }
else if  ( ll == 1 && l== 1 &&m==0 && r ==0 && rr ==0 )                     //    r8 or state
      {
        forward () ;
        if ( ll==1&&l==1 &&m==0 && r ==1 && rr ==1 )                   // if straigt possible go straigt
           {
            straight ();
            }
         else {                                                   // if straight not possible turn right
                right ();
              }
       }
else if   ( ll == 0 && l== 0 &&m==0 && r ==1 && rr ==1 )                    //    default  left or left turn   checking
         {
          forward();

          if(ll == 0 && l== 0 &&m==1 && r ==0 && rr ==0)                   // if straight possible then turn left
              {
                left_turn () ;
               }
           else
           {
            left();
           }
         }
else if  (  ll == 0 && l== 0 &&m==0 && r ==0 && rr ==0 )            // T or cross or complete
         {
         forward();
         if(ll == 0 && l== 0 &&m==0 && r ==0 && rr ==0 )                 // all black
           {
           stop();                                          // solve complete ready to go by shortest way
           }
        /*  else if (ll == 0 && l== 0 &&m==1 && r ==0 && rr ==0 )
          {
          left_turn();
          } */
          else
          {
          left_turn();
          }
          }
 else if (ll ==1 && l==1 && m==1 && r ==1 && rr ==1 )
        {
         u_turn();
        }
}
}

forward()
{
portd=0b00000101 ;              // forward
delay_ms(10);
}
right ()
{
do {
portd = 0b00000100 ;             // right
delay_ms(10);
}while(m==0);
}
left ()
{
do{
portd=0b00000001 ;              // left
delay_ms(10);
}while(m==0);
}
left_turn()
{
do {portd=0b00000001 ;              // left
    delay_ms(10);
    } while(m==0);
    di[path]='L' ;                   // enter L
    path++;
    short_path();
}
straight()
{
portd=0b00000101 ;              // forward
delay_ms(10);
di[path]='S' ;                    // enter S
path++;
short_path();
}
stop()                             // stop and ready to go on shortest way
{
di[path]='D' ;                   // done
portd=0b00000000;
delay_ms(5000);                  //wait 5 sec to replace again in the start
replay();
}
u_turn()
{
do {portd=0b00001001 ;              // left U turn
    delay_ms(10);
    } while(m==0);
    di[path]='U' ;               // enter U
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
  if(di[path]-3=='L' && di[path]-1=='R')         //LUR=U
   {
    path-=3;
    di[path]='U';
    short_done=1;
   }
   if(di[path]-3=='L' && di[path]-1=='S'&&short_done==0)   //   LUS=R
   {
    path-=3;
    di[path]='R';
    short_done=1;
   }
   if(di[path]-3=='R' && di[path]-1=='L'&&short_done==0)     //RUL=U
   {
    path-=3;
    di[path]='U';
    short_done=1;
   }
   if(di[path]-3=='S' && di[path]-1=='L'&&short_done==0)         //SUL=R
   {
    path-=3;
    di[path]='R';
    short_done=1;
   }
   if(di[path]-3=='S' && di[path]-1=='S'&&short_done==0)         //SUS=U
   {
    path-=3;
    di[path]='U';
    short_done=1;
   }
   if(di[path]-3=='L' && di[path]-1=='L'&&short_done==0)           //LUL=S
   {
    path-=3;
    di[path]='S';
    short_done=1;
   }
   
}
replay ()                          // check line and di array both and make a dicision
{
while(di[path1=='D'])                      // loop until done
   {
   if ( ll==1&&l==1 &&m==0 && r ==1 && rr ==1 )              // condition        1  1  0  1  1
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