#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

#define N 2
#define K 3

main()
  {
    int S, I;
    S = 1;
    clrscr();

    for (I=1; I<=K; I++)
      S*=N;

    printf("%d^%d = %d\n", N, K, S);

    for (I=2; I<=K; I+=2)
      S >> 1;
    if (K % 2 != 0) S*=N;

    printf("%d^%d = %d\n", N, K, S);



    getch();
  }
