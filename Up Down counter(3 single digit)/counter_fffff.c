#define SegOne   0x01
#define SegTwo   0x02
#define SegThree 0x04
#define SegFour  0x08
void show();
void progress();
char seg_code[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
    int cnt, num, temp,i;
    int oldstate1;
    int oldstate2;
    int oldstate3;
/*void DELAY_ms(unsigned int ms_Count)
{
    unsigned int i,j;
    for(i=0;i<ms_Count;i++)
    {
        for(j=0;j<1000;j++);
    }
}   */



int main() {
    cnt = 0;

    /* Configure the ports as output */
    TRISA.F0=1;
    TRISA.F1=1;
    TRISA.F2=1;
    TRISB=0x00;
    TRISC = 0x00; // Data lines
    TRISD = 0x00; // Control signal PORTD0-PORTD3
    ansel=0;
    anselh=0;
    option_reg.f7=0;

    while (1)
    {
       /* for (cnt = 0x00; cnt <= 9999; cnt++) // loop to display 0-9999
        {
        show();
        }  */
        show();


}
}

void show(){

//for (i = 0; i < 100; i++)
           while(1)
            {
                num = cnt;
               // temp=0;
                /*temp = num / 1000;
                num = num % 1000;
                PORTD = SegOne;
                PORTC = seg_code[temp];
                delay_ms(1);        */

                temp = num / 100;
                num = num % 100;
               // PORTD = SegOne;
                PORTD = seg_code[temp];
                delay_ms(1);

                temp = num / 10;
                //PORTD = SegTwo;
                PORTC = seg_code[temp];
                delay_ms(1);

                temp = num % 10;
               // PORTD = SegThree;
                PORTB = seg_code[temp];
                delay_ms(1);
                progress()   ;
            }
}

void progress(){
   if (porta.f0==0)
    {
      oldstate1 = 1;
    }
     if (oldstate1==1 && porta.f0==1 )
    {

      cnt++;
      oldstate1 = 0;
    }
      else if (porta.f1==0)
    {
      oldstate2 = 1;
    }
     if (oldstate2==1 && porta.f1==1 )
    {

      cnt--;
      oldstate2 = 0;
      if (cnt<=0){cnt=0;  }
    }
       if (porta.f2==0)
    {
      oldstate3 = 1;
    }
     if (oldstate3==1 && porta.f2==1 )
    {

      cnt=0;
      oldstate3 = 0;
    }
    if (cnt>=1000){cnt=0;  }


}