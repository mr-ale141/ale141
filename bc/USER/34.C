#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>
#include <time.h>

#define k1 5
#define k2 3

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

int vvedi(char *y)
  {
    int t;
    printf("Vvedi %s storonu: ", y);
    do
     {
       scanf("%d", &t);
       if (t < 0) puts("error");
     }
    while(t < 0);
    return t;
  }

void input(char *y, int *t)
  {
    printf("Vvedi %s storonu: ", y);
    do
     {
       scanf("%d", t);
       if (*t < 0) puts("error");
     }
    while(*t < 0);
    return;
  }

void rndmas(int *m, int n)
  {
    int x;
    for(x = 0; x < n; x++)
      m[x] = random(10);
    return;
  }

void prmas(int *m, int n)
  {
    int x;
    printf("Массив содержит: ");
    for(x = 0; x < n; x++)
      printf("%4d", m[x]);
    printf("\n");
    return;
  }

int summas(int *m, int n)
  {
    int x, t = 0;
    for(x = 0; x < n; x++)
      t += m[x];
    return t;
  }

main()
  {
    int a[k1], b[k2], z;
    clrscr();
    randomize();

    rndmas(a, k1);
    prmas(a, k1);
    printf("Сумма массива = %4d\n", summas(a, k1));

    rndmas(b, k2);
    prmas(b, k2);
    printf("Сумма массива = %4d\n", summas(b, k2));

    getch();
  }
