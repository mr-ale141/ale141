  // �ਬ�� 3:  ���᫥��� ���頤� ��㣠

#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

#define Pi 3.14

float Plos_Kruga (int Temp)
  {
    return Pi*Temp*Temp;
  }

main()
  {
     int   R;
     float S;
     int   j;
     char  A;

     clrscr();
     puts(" ���᫥��� ���頤� ��㣠 ");
     for (j=1; j<=26; j++) printf("=");

 Start:
     printf("\n");
     printf("������ ࠤ��� ");  scanf("%d", &R);
     if (R<=0)
       {
	 puts("   �㦭� ������⥫쭮�!");
	 goto Start;
       }
     S = Plos_Kruga (R);
     printf("���頤� ࠢ�� %6.2f \n", S);

   while (1)
     {
       puts(" Y-����� N-��室");
       A = getch();
       if (A=='Y' || A=='y') goto Start;
       if (A=='N' || A=='n') break;
       puts("  �� �� ������� ������!  ");
     }

   puts("����� ࠡ���");
   do
     printf("����� Esc ");
   while ( getch() != 27 );
   exit(0);
  }