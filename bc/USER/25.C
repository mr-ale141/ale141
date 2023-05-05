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
    char *t = "ABCDEFGH";
    int k, x;
    char y = 181;
    clrscr();
    k = strlen(t);
    puts(t);
    for (x = 0; x < k; x++)
     {
       t[x] = t[x] ^ y;
     }
    puts(t);
    for (x = 0; x < k; x++)
     {
       t[x] = t[x] ^ y;
     }
    puts(t);
    getch();
  }










