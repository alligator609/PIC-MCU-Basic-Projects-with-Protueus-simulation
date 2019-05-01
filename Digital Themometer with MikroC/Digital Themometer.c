
// LCD module connections
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
// End LCD module connections

unsigned int temperature = 0;
float mV;
unsigned char txt[15];

void main() {
               // Configure PORTB pins as digital
  TRISA.RA0 = 1;                    // Configure RA0 pin as input

  ADC_Init();                        // Initialize ADC

  Lcd_Init();                        // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off

  Lcd_Out(1, 1, "  Digital ");  // Display "StudentCompanion"
  Lcd_Out(2, 1, "Thermometer");        // Display "Thermometer"
  Delay_ms(1000);                      // 1 Second delay
  Lcd_Cmd(_LCD_CLEAR);               // Clear display

  Lcd_Out(1, 1, "Temperature :");
  Lcd_Chr(2,8,223);                  // char code for degree
  Lcd_Chr(2,9,'C');                  // Display "C" for Celsius

  temperature = 0;
   do {
    temperature = ADC_Read(0);          // Get 10-bit results of AD conversion
    mV = temperature * 5000.0 /1024.0;  // Convert to miV temperature in Celsuis
    mV = mV/10.0;                        // Convert mV to temperature in Celsuis
    FloatToStr(mV, txt);               // Convert temperature to string
    txt[4]=0;
    Lcd_Out(2, 3, txt);                // Display Temperature
    Delay_ms(500);                     // 1 Second delay

  } while(1);

}