/*https://electrosome.com/hc-sr04-ultrasonic-sensor-pic/

Thus we can initialize timer as : T1CON = 0x10
To TURN ON the Timer : T1CON.F0 = 1 or TMR1ON = 1
To TURN OFF the Timer : T1CON.F0 = 0 or TMR1ON = 0
Fosc is the oscillator frequency, here we are using 8MHz crystal hence Fosc = 8MHz.

Time = (TMR1H:TMR1L)*(1/Internal Clock)*Prescaler

Internal Clock = Fosc/4 = 8MHz/4 = 2MHz

Therefore, Time = (TMR1H:TMR1L)*2/(2000000) = (TMR1H:TMR1L)/1000000
Distance = Speed * Time
Let d be the distance between Ultrasonic Sensor and Target
Total distance traveled by the ultrasonic burst : 2d (forward and backward)
Speed of Sound in Air : 340 m/s = 34000 cm/s
Thus, d = (34000*Time)/2, where Time = (TMR1H:TMR1L)/(1000000)
Therefore, d = (TMR1H:TMR1L)/58.82 cm
TMR1H:TMR1L = TMR1L | (TMR1H<<8)
*/


// LCD module connections
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
// End LCD module connections

void main() 
{
  int a;
  char txt[7];
  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  
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