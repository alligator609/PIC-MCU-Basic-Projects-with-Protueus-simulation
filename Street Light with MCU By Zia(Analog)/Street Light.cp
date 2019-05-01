#line 1 "C:/Users/Xbot/Desktop/Street Light MCU/Street Light.c"

int ldr1 ;
int ldr2 ;
int dark1 ;
int dark2 ;
float parcentg_dark ;
void main()
{
parcentg_dark =.50;
ansel=0;
anselh=0x14;
trisb.f0=1;
trisb.f1=1;
trisd.f0=0;
trisd.f1=0;
while(1)
{

 ldr1 = adc_read(12) ;
 ldr2 = adc_read(10) ;
 dark1 = 1023*parcentg_dark ;
 dark2 = 1023*parcentg_dark ;
 if(ldr1>=dark1)
 {
 portd.f0=1;
 }
 else
 {
 portd.f0=0;
 }
 if(ldr2>=dark2)
 {
 portd.f1=1;
 }
 else
 {
 portd.f1=0;
 }
}
}
