  // пример 3:  Вычисление площади круга

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
     puts(" Вычисление площади круга ");
     for (j=1; j<=26; j++) printf("=");

 Start:
     printf("\n");
     printf("Введите радиус ");  scanf("%d", &R);
     if (R<=0)
       {
	 puts("   Нужно положительное!");
	 goto Start;
       }
     S = Plos_Kruga (R);
     printf("Площадь равна %6.2f \n", S);

   while (1)
     {
       puts(" Y-повтор N-выход");
       A = getch();
       if (A=='Y' || A=='y') goto Start;
       if (A=='N' || A=='n') break;
       puts("  Не ту клавишу нажали!  ");
     }

   puts("Конец работы");
   do
     printf("нажми Esc ");
   while ( getch() != 27 );
   exit(0);
  }