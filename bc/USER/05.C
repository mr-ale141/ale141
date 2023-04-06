#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

main()
  {
    int x, a = 3, b = 4;
    clrscr();
    printf("%4d %4d\n", a, b);
    x = a;
    a = b;
    b = x;
    printf("%4d %4d\n", a, b);
    getch();
  }
