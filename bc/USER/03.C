#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

#define PI 3.14

main()
  {
    int R;
    float S;
    clrscr();
    puts("Программа для вычисления площади круга");

Metka:
    printf("\nВведите радиус: ");
    if (scanf("%d", &R) < 1) exit(0);
    if (R == 0) exit(0);
    if (R < 0)
      {
	puts("Радиус не может быть меньше нуля!");
	goto Metka;
      }
    S = PI * R * R;
    printf("Площадь круга с радиусом %d равен %.2f\n", R, S);
    goto Metka;
  }
