#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

void Pr1(int A)
  {
     printf("%4d\n", A);
  }

void Pr2(int A, char *B)
  {
    textcolor(A);
    cprintf("%s", B);
  }

void color(int a, int b)
  {
    textcolor(a);
    textbackground(b);
  }

int max2(int a, int b)
  {
    return (a > b) ? a : b;
  }

void obmen(int *a, int *b)
  {
    int t;
    t  = *a;
    *a = *b;
    *b = t;
  }

int vvod()
  {
    int t;
    printf("Vvedi: ");
    do
     {
       scanf("%d", &t);
       if (t < 0) puts("error");
     }
    while(t < 0);
    return t;
  }

main()
  {
    int a, b, c;
    clrscr();
    a = vvod();
    b = vvod();
    c = vvod();
    printf("Storony: %2d, %2d, %2d.\n", a, b, c);
    getch();
  }
