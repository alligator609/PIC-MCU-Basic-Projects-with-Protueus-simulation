#define SegOne   0x01
#define SegTwo   0x02
#define SegThree 0x04
#define SegFour  0x08
bit oldstate1;
bit oldstate2;
bit oldstate3;
void show();
void progress();
char seg_code[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};   // Common cathod
int cnt, num, temp,i;



int main() {
    cnt = 0;
     oldstate1=0;
     oldstate2=0;
     oldstate3=0;

  //C1ON_bit = 0;                                  // Disable comparators
  //C2ON_bit = 0;
    /* Configure the ports as output */
    trisb.f0=1;
    trisb.f1=1;
    trisb.f2=1;
    
    trisc = 0x00; // Data lines
    trisa = 0x00; // Control signal PORTD0-PORTD3
    trisd = 0;
    portd=0;
    ansel = 0;                                    // Configure AN pins as digital I/O
    anselh = 0;
    option_reg.f7=0;

    while (1)
    {
                num = cnt;
               temp=0;
                temp = num / 1000;
                num = num % 1000;
                porta = 0b00000001;
                //portd=SegOne;
                 portd = 0b00010001;
                portc = seg_code[temp];
                delay_ms(1);

                temp = num / 100;
                num = num % 100;
               porta = 0b00000010;
               //portd= SegTwo;
               portd = 0b00100010;
                portc = seg_code[temp];
                delay_ms(1);

                temp = num / 10;
                porta = 0b00000100; 
               // portd=SegThree;
               portd = 0b01000100;
                portc = seg_code[temp];
                delay_ms(1);

                temp = num % 10;
                 porta =0b00001000 ;
                 //portd=SegFour;
                 portd = 0b10001000;
                 portc = seg_code[temp];
                delay_ms(1);
                progress()   ;
 }
}

void progress(){
   if (Button(&PORTB, 0, 10, 1)) {

       oldstate1 = 1;
    }
    if (oldstate1 && Button(&PORTB, 0, 10, 0)) {
       cnt++;
      oldstate1 = 0;
    }

         if (Button(&PORTB, 1, 10, 1)) {

       oldstate2 = 1;
    }
    if (oldstate2 && Button(&PORTB, 1, 10, 0)) {
       cnt--;
      oldstate2 = 0;
      if (cnt<=0){cnt=0; }
    }

       if (Button(&PORTB, 2, 10, 1))
    {
      oldstate3 = 1;
    }
     if (oldstate3 && Button(&PORTB, 2, 10, 0))
    {

      cnt=0;
      oldstate3 = 0;
    }
     if (cnt>=10000){ cnt=0x00;  }

}