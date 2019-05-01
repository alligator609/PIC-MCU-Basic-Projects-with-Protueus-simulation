unsigned countary;
char seg_code[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0x88,0x83,0xc6,0xa1,0x86,0x8e};
    int x;
    int y;
    int z;
    int oldstate1;
    int oldstate2;
    int oldstate3;
void main()

{
 x=0;
 y=0;
 z=0;
 int oldstate1 =0;
  int countary[10]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};  // 0-9 7segment hex code
 ansel =0;
 anselh=0;
  trisa.f0=1;
 trisa.f1=1;
  trisa.f2=1;
 trisb=0;
 trisc=0;
 portd=0;
 option_reg.f7=0;
 oldstate= 0;
 while(1)
 {
 progress();


 }
 }

 void show(){

       portc=countary[x];
       portd=countary[y];
       portd=countary[z];
 }

 void progress(){
   if (porta.f0==0)
    {
      oldstate1 = 1;
    }
    else if (oldstate1==1 && porta.f0==1 )
    {

      x++;
      oldstate1 = 0;
      if(x<=9)
       {
        x=0;
        y++;
        if (y<=9)
        {
        y=0;
        z++;
           if(z<=9)
           {
           z==0;
           show();}
           else { show();}
        }
        else { show();}

       }
       else { show();}
    }
      else if (porta.f1==0)
    {
      oldstate2 = 1;
    }
    else if (oldstate2==1 && porta.f1==1 )
    {

      cnt--;
      oldstate2 = 0;
      if (cnt<=0){cnt=0;  }
    }
      else if (porta.f2==0)
    {
      oldstate3 = 1;
    }
    else if (oldstate3==1 && porta.f2==1 )
    {

      cnt=0;
      oldstate3 = 0;
    }
    else if (cnt==9999){cnt=0x00;  }


}