unsigned countary;
unsigned oldstate ;
unsigned i;
unsigned t;

void main() 
{
  int countary[10]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};  // 0-9 7segment hex code
 ansel =0;
 anselh=0;
 trisb.f1;
 trisd=0;
 trisc=0;
 portd=0;
 portc=0;
 option_reg.f7=0;
 oldstate= 0;
 while(1)
 {
     if(i==9&&t==9)
     {
     i=0;
     t=0;
     }
     else{
         for(i=0;i<=9;i++)
         {
                      


                for(t=0;t<=9;t++)
                        {

                           portc=countary[t];
                           delay_ms(500) ;
                          portd=countary[i];
                          delay_ms(500)   ;
                            }


                   }  
                    }
      }
 }