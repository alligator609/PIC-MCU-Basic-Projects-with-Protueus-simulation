#line 1 "C:/Users/Alligator/Desktop/counter_fffff/counter_fffff.c"




void show();
void progress();
char seg_code[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
 int cnt, num, temp,i;
 int oldstate1;
 int oldstate2;
 int oldstate3;
#line 23 "C:/Users/Alligator/Desktop/counter_fffff/counter_fffff.c"
int main() {
 cnt = 0;


 TRISA.F0=1;
 TRISA.F1=1;
 TRISA.F2=1;
 TRISB=0x00;
 TRISC = 0x00;
 TRISD = 0x00;
 ansel=0;
 anselh=0;
 option_reg.f7=0;

 while (1)
 {
#line 43 "C:/Users/Alligator/Desktop/counter_fffff/counter_fffff.c"
 show();


}
}

void show(){


 while(1)
 {
 num = cnt;
#line 62 "C:/Users/Alligator/Desktop/counter_fffff/counter_fffff.c"
 temp = num / 100;
 num = num % 100;

 PORTD = seg_code[temp];
 delay_ms(1);

 temp = num / 10;

 PORTC = seg_code[temp];
 delay_ms(1);

 temp = num % 10;

 PORTB = seg_code[temp];
 delay_ms(1);
 progress() ;
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
 if (cnt<=0){cnt=0; }
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
 if (cnt>=1000){cnt=0; }


}
