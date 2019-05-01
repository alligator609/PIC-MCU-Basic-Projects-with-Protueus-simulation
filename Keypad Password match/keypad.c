// #include "E:\Hamdy Library\LCD.h"
// result = atoi("32000");  // result = 32000

// LCD module connections
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;
// End LCD module connections

char  keypadPort at PORTD;
 int result ;//= atoi("32000");
int i;
char password[4];
char txt[4];

char get_password()
{
   Loop:
   Lcd_Cmd(_LCD_CLEAR);
   Lcd_Out(1, 1, "Enter Password :");

     for(i=0;i<3;i++)
     {
           while (password[i] == 0)
           {
            password[i] = Keypad_Key_Click();
           }

          if(password[i]==1)     password[i]  = '7';
          if(password[i]==2)     password[i]  = '8';
          if(password[i]==3)     password[i]  = '9';
          if(password[i]==5)     password[i]  = '4';
          if(password[i]==6)     password[i]  = '5';
          if(password[i]==7)     password[i]  = '6';
          if(password[i]==9)     password[i]  = '1';
          if(password[i]==10)    password[i]  = '2';
          if(password[i]==11)    password[i]  = '3';
          Lcd_Chr(2, i+1, password[i]);
      }
    if(strcmp(password,"123") == 0) {return 1;}
    else   {    goto Loop;    }
}

void main()
{
    ANSEL=0;
    ANSELH=0;
    trisc.b0=0;    portc.b0=0;
    Lcd_Init();    keypad_Init();
    Lcd_Cmd(_LCD_CURSOR_OFF);

    get_password();
     result = atoi(password);         // string to intiger
     ByteToStr(result, txt);            // intiger to string
    while(1)
    {
         Lcd_Cmd(_LCD_CLEAR);
         Lcd_Out(1,2 , txt);
         portc.b0 = ~ portc.b0;
          delay_ms(1000);
     }
 }