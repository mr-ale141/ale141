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
    for (x = 0; x<k; x++) {
      printf("%c\n", t[x]);
    }

    getch();
  }










