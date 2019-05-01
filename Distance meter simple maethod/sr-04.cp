#line 1 "C:/Users/Xbot/Downloads/MikroC Pro/1. Simple Method/sr-04.c"

sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;


void main()
{
 int a;
 char txt[7];
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 TRISB = 0b00010000;

 Lcd_Out(1,1,"Developed By");
 Lcd_Out(2,1,"electroSome");

 Delay_ms(3000);
 Lcd_Cmd(_LCD_CLEAR);

 T1CON = 0x10;

 while(1)
 {
 ANSEL=0;
 ANSELH=0;
 TMR1H = 0;
 TMR1L = 0;

 PORTB.F0 = 1;
 Delay_us(10);
 PORTB.F0 = 0;

 while(!PORTB.F4);
 T1CON.F0 = 1;
 while(PORTB.F4);
 T1CON.F0 = 0;

 a = (TMR1L | (TMR1H<<8))/58.82 + 1;

 if(a>=2 && a<=400)
 {
 IntToStr(a,txt);
 Ltrim(txt);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"Distance = ");
 Lcd_Out(1,12,txt);
 Lcd_Out(1,15,"cm");
 }
 else
 {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"Out of Range");
 }
 Delay_ms(400);
 }
}
