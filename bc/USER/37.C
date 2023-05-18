#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>
#include <time.h>

#define k 4

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

int fact(int n)
  {
    return (n > 1) ? n * fact(n - 1) : 1;
  }

int kwa(int a)
  {
    return a*a;
  }

int kub(int a)
  {
    return a*a*a;
  }

main()
  {
    const c0=0, f0=2, c1=14, f1=4;
    char *t[k+1];
    int y[k+1], x[k+1];
    int j;
    int tek;
    char a, b;

    t[1] = " open ";
    t[2] = " save ";
    t[3] = " run  ";
    t[4] = " quit ";

    y[1] = 10;
    y[2] = 12;
    y[3] = 14;
    y[4] = 16;

    x[1] = 20;
    x[2] = 20;
    x[3] = 20;
    x[4] = 20;

    tek = 1;

    clrscr();
met1:
    for(j=1; j<=k; j++)
      {
	textcolor(c0); textbackground(f0);
	if (j==tek) {textcolor(c1); textbackground(f1);}
	gotoxy(x[j], y[j]);
	cprintf("%s", t[j]);
      }
    a=getch(); if (a==0) b=getch();
    if (a==27) exit(0);                 //esc
    if (a==13) goto met2;               //enter
    if (a==0 && b==80) tek++;           //down
    if (a==0 && b==72) tek--;           //up
    if (tek>k) tek = 1;                 //
    if (tek<1) tek = k;
    goto met1;
met2:
    textcolor(7); textbackground(0);
    gotoxy(50, 20);
    if (tek==1) puts("open");
    if (tek==2) puts("save");
    if (tek==3) puts("run");
    if (tek==4) puts("exit");
    getch();
    gotoxy(50, 20);
    printf("             ");
    goto met1;
  }
