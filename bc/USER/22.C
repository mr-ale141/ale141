#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

#define N 10

main()
  {
    char *t;
    int x, k;

    clrscr();

    printf("Vvedi: ");
    scanf("%s", t);
    k = strlen(t);
    for (x = k-1; x>=0; x--) {
      printf("%c", t[x]);
    }

    getch();
  }










