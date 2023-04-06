#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

#define PI 3.14

main()
  {
    int R; float S; char A;
    clrscr();
    puts("Программа для вычисления площади круга");
Metka:
    printf("\nВведите радиус: ");
    if (!scanf("%d", &R)) exit(0);
    if (R < 0)
      {
	puts("Радиус не может быть меньше нуля!");
	goto Metka;
      }
    S = PI * R * R;
    printf("Площадь круга с радиусом %d равен %.2f\n", R, S);
Klav:
    printf("\nНажмите для продолжения ENTER для выхода ESC.");
    A = getch();
    switch(A)
      {
       case 13: goto Metka;
       case 27: exit(0);
       default: puts("Не та клавиша!"); goto Klav;
      }
  }