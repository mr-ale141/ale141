#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

main()
  {
    int x;
    clrscr();
    printf("Число Квадрат\n");
    for (x=1; x<=12; x++)
	printf("%5d %7d\n", x, x*x);

    getch();
  }
