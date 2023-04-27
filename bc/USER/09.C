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
    printf("Число  ");
    for (x=1; x<=12; x++)
	printf("%4d", x);
    printf("\nКвадрат");
    for (x=1; x<=12; x++)
	printf("%4d", x*x);
    printf("\n");
    getch();
  }
