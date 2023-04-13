#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

main()
  {
    int A, B, C;
    float P, S;
    clrscr();
    puts("Введите три стороны треугольника");
    scanf("%d", &A);
    scanf("%d", &B);
    scanf("%d", &C);
    P = (A + B + C) / 2;
    S = sqrt(P * (P - A) * (P - B) * (P - C));
    printf("Площадь треугольника равна: %.2f", S);
    getch();
    return 0;
  }