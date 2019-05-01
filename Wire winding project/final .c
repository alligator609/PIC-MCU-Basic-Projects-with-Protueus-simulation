sbit LCD_RS at RA4_bit;
sbit LCD_EN at RA5_bit;
sbit LCD_D4 at RA0_bit;
sbit LCD_D5 at RA1_bit;
sbit LCD_D6 at RA2_bit;
sbit LCD_D7 at RA3_bit;

sbit LCD_RS_Direction at TRISA4_bit;
sbit LCD_EN_Direction at TRISA5_bit;
sbit LCD_D4_Direction at TRISA0_bit;
sbit LCD_D5_Direction at TRISA1_bit;
sbit LCD_D6_Direction at TRISA2_bit;
sbit LCD_D7_Direction at TRISA3_bit;

char  keypadPort at PORTD;        //KEYPAD AT PORTD

void get_turn();  //turn function
void turn_count();   //turn decay
void forward();
void backward();
unsigned char password[5];
int i;
//unsigned int result ;

void main()
{
    ANSEL=0;
    ANSELH=0;
    trisb.f0=1;
    portb.f0=1;
    
   // trisb.f1=1;
  //  trisb.f2=1;
   // trisb.f3=1;
    trisb.f4=0;            //  Output
    trisb.f5=0; 
    trisb.f6=0;
    trisb.f7=0;             // Output
      portb.f4=0;
      portb.f5=0;
      portb.f6=0;
      portb.f7=0;

    Lcd_Init();
    
    while(1)
    {
         memset(password, 0, 5);
         Lcd_Cmd(_LCD_CLEAR);
         Lcd_Cmd(_LCD_CURSOR_OFF);
         Lcd_Out(0,1 , "WELLCOME");
         delay_ms(1000);
         get_turn();
         Lcd_Cmd(_LCD_CLEAR);
     }

}


void get_turn()
{
   loop:
   i=0;
   Lcd_Cmd(_LCD_CLEAR);
   Lcd_Out(1, 1, "Enter Turn Num :");

     for(i=0;i<5;i++)
     {
          while (password[i] == 0)
           {
            password[i] = Keypad_Key_Click();
           }

          if(password[i]==1)     password[i]  = '1';
          if(password[i]==2)     password[i]  = '4'; //2
          if(password[i]==3)     password[i]  = '7'; //3
          if(password[i]==13)     {     portb.f4=1;   // clockwise
                                       portb.f5=0;
                                       portb.f6=1;
                                       portb.f7=0; turn_count(); backward();break; }                                // F
          if(password[i]==5)     password[i]  = '2'; //4
          if(password[i]==6)     password[i]  = '5';
          if(password[i]==7)     password[i]  = '8'; //6
          if(password[i]==14)     {     portb.f4=0;   // anti  clockwise
                                       portb.f5=1;
                                       portb.f6=0;
                                       portb.f7=1; turn_count(); forward(); break; }

          if(password[i]==9)     password[i]  = '3'; //7
          if(password[i]==10)    password[i]  = '6';  //8
          if(password[i]==11)    password[i]  = '9';
          if(password[i]==8)    password[i]  = '0';      //14 0
          if(password[i]==15)    return ;
          Lcd_Chr(2, i+1, password[i]);         //Prints character on Lcd at specified position
        //  result = atol("4000");           // string to  int
      }
      memset(password, 0, 5);
      goto loop ;
      //return;
}

void turn_count()
{  
 unsigned int result = atol(password);
   char txt[7];
   int oldstate = 0;
 unsigned  int count = result;
   int x;
   Lcd_Cmd(_LCD_CLEAR);
   Lcd_Out(1, 1, " Motor Running");

for (x=1;x<=count;)
    {
     IntToStr(count, txt);
       Lcd_Out(2,2 , txt);
    if (portb.f0==0)
    {                                            // Detect logical one
      oldstate = 1;                              // Update flag
    }
    else if (oldstate==1 && portb.f0==1 )
    {

      count =count-1;                            // Invert PORTC
      oldstate = 0;                             // Update flag
    }
    }
      portb.f4=0;
      portb.f5=0;
      portb.f6=0;
      portb.f7=0;
    return;
}

void forward()
{
                                       portb.f4=1;   // clockwise
                                       portb.f5=0;
                                       portb.f6=1;
                                       portb.f7=0;
                                       delay_ms(500);
                                       portb.f4=0;   // all off
                                       portb.f5=0;
                                       portb.f6=0;
                                       portb.f7=0;
                                       
}
void backward()
{
                                       portb.f4=0;   // anti  clockwise
                                       portb.f5=1;
                                       portb.f6=0;
                                       portb.f7=1;
                                       delay_ms(500);
                                       portb.f4=0;   //all off
                                       portb.f5=0;
                                       portb.f6=0;
                                       portb.f7=0;

}