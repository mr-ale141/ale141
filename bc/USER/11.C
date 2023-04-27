#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

#define N 100

main()
  {
    int S, I;
    S = 0;
    clrscr();
    for (I=1; I<=N; I++)
      S+=I;

    printf("S = %d\n", S);

    getch();
  }
