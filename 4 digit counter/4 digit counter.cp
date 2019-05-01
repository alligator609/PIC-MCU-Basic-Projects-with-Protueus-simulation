#line 1 "D:/Personal Document/Coding/MICro Controller Project/Project all/4 digit counter/4 digit counter.c"




void show();
void progress();
char seg_code[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0x88,0x83,0xc6,0xa1,0x86,0x8e};
 int cnt, num, temp,i;
 int oldstate1;
 int oldstate2;
 int oldstate3;
#line 23 "D:/Personal Document/Coding/MICro Controller Project/Project all/4 digit counter/4 digit counter.c"
int main() {
 cnt = 0;


 TRISB.F0=1;
 TRISB.F1=1;
 TRISB.F2=1;
 PORTB.F0=0x07;
 TRISC = 0x00;
 TRISD = 0x00;
 ansel=0;
 anselh=0;
 option_reg.f7=0;

 while (1)
 {
#line 43 "D:/Personal Document/Coding/MICro Controller Project/Project all/4 digit counter/4 digit counter.c"
 show();


}
}

void show(){


 while(1)
 {
 num = cnt;
 temp = num / 1000;
 num = num % 1000;
 PORTD =  0x01 ;
 PORTC = seg_code[temp];
 delay_ms(1);

 temp = num / 100;
 num = num % 100;
 PORTD =  0x02 ;
 PORTC = seg_code[temp];
 delay_ms(1);

 temp = num / 10;
 PORTD =  0x04 ;
 PORTC = seg_code[temp];
 delay_ms(1);

 temp = num % 10;
 PORTD =  0x08  ;
 PORTC = seg_code[temp];
 delay_ms(1);
 progress() ;
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
 if (cnt<=0){cnt=0; }
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
 else if (cnt>=10000){cnt=0x00; }


}
