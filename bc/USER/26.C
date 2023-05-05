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
    char *Str = "привет, вася";
    int LenStr, LenPas, x, y;
    char *Pas = "ABCD";
    clrscr();
    LenStr = strlen(Str);
    LenPas = strlen(Pas);
    puts(Str);
    for (x = 0, y = 0; x < LenStr; x++, y++)
     {

       Str[x] = Str[x] ^ Pas[y];
       if (y > LenPas) y = 0;
     }
    puts(Str);
    for (x = 0, y = 0; x < LenStr; x++, y++)
     {

       Str[x] = Str[x] ^ Pas[y];
       if (y > LenPas) y = 0;
     }
    puts(Str);
    getch();
  }










