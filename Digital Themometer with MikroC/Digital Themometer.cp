#line 1 "D:/Personal Document/MICro Controller Project/Project all/Digital Themometer with MikroC/Digital Themometer.c"


sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;


unsigned int temperature = 0;
float mV;
unsigned char txt[15];

void main() {

 TRISA.RA0 = 1;

 ADC_Init();

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1, 1, "  Digital ");
 Lcd_Out(2, 1, "Thermometer");
 Delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Out(1, 1, "Temperature :");
 Lcd_Chr(2,8,223);
 Lcd_Chr(2,9,'C');

 temperature = 0;
 do {
 temperature = ADC_Read(0);
 mV = temperature * 5000.0 /1024.0;
 mV = mV/10.0;
 FloatToStr(mV, txt);
 txt[4]=0;
 Lcd_Out(2, 3, txt);
 Delay_ms(500);

 } while(1);

}
