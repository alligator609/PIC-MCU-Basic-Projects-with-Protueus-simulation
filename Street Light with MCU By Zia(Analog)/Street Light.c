
int ldr1 ;
int ldr2 ;
int dark1 ;
int dark2 ;
float parcentg_dark ;
void main() 
{
parcentg_dark =.50;               // 50% darkness
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
 dark1  = 1023*parcentg_dark ;
 dark2 = 1023*parcentg_dark ;
 if(ldr1>=dark1)            //when v across resistor is greater than 50% of refrence voltage led1 on
 {
 portd.f0=1;
 }
 else
 {
 portd.f0=0;
 }
 if(ldr2>=dark2)            //when v across resistor is greater than 50% of refrence voltage led2 on
 {
 portd.f1=1;
 }
 else
 {
 portd.f1=0;
 }
}
}