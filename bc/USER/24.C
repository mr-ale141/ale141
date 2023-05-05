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
    char *t = "ABCDEF";
    int x, y, k;
    char temp;
    char *str;
    randomize();
    clrscr();

    k = strlen(t);
    str = malloc(k+1);
    for (x = 0; x < k/2; x++)
     {
       y = randome(k);

       temp = t[y];
       t[y] = t[k-y-1];
       t[k-y-1] = temp;
     }
    puts(t);
    getch();
  }










