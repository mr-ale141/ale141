#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

void shapka()
  {
    clrscr();
    puts("подсказка");
  }

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

main()
  {
    int x=3, y=4;
    clrscr();
    printf("%2d %2d\n", x, y);


    obmen(&x, &y);
    printf("%2d %2d\n", x, y);
    getch();
  }
