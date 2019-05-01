#define SegOne   0x01
#define SegTwo   0x02
#define SegThree 0x04
#define SegFour  0x08
void show();
void progress();
char seg_code[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0x88,0x83,0xc6,0xa1,0x86,0x8e};   // common anode
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
    TRISB.F0=1;
    TRISB.F1=1;
    TRISB.F2=1;
    PORTB.F0=0x07;
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
                temp = num / 1000;
                num = num % 1000;
                PORTD = SegOne;
                PORTC = seg_code[temp];
                delay_ms(1);

                temp = num / 100;
                num = num % 100;
                PORTD = SegTwo;
                PORTC = seg_code[temp];
                delay_ms(1);

                temp = num / 10;
                PORTD = SegThree;
                PORTC = seg_code[temp];
                delay_ms(1);

                temp = num % 10;
                PORTD = SegFour  ;
                PORTC = seg_code[temp];
                delay_ms(1);
                progress()   ;
            }
}

void progress(){
   if (portb.f0==0)
    {
      oldstate1 = 1;
    }
    else if (oldstate1==1 && portb.f0==1 )
    {

      cnt++;
      oldstate1 = 0;
    }
      else if (portb.f1==0)
    {
      oldstate2 = 1;
    }
    else if (oldstate2==1 && portb.f1==1 )
    {

      cnt--;
      oldstate2 = 0; 
      if (cnt<=0){cnt=0;  }
    }
      else if (portb.f2==0)
    {
      oldstate3 = 1;
    }
    else if (oldstate3==1 && portb.f2==1 )
    {

      cnt=0;
      oldstate3 = 0;
    }
    else if (cnt>=10000){cnt=0x00;  }
    

}