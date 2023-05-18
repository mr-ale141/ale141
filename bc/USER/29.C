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

main()
  {
    int x=12, y=4, z;
    char *t = "привет";
    shapka();
    Pr1(x);
    Pr1(y * 10);
    Pr1(2 + 3);
    Pr2(x, t);
    Pr2(10, "вася");
    color(14, 4);
    cputs("text");
    z = max2(x, y);
    Pr1(z);
    printf("%d", max2(y, 6));


    getch();
  }
