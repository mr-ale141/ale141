		       //шаблон
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

main(int k, char *p[])
  {
    int x, y, z;
    clrscr();
    x = atoi(p[1]);
    y = atoi(p[2]);
    z = x + y;
    printf("%d + %d = %d\n", x, y, z);
    getch();
  }
