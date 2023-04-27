#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

main()
  {
    int x, y;
    clrscr();

// цикл если
    x = 1;
Metka:
    printf("%d", x);
    x++;
    if (x <= 7) goto Metka;
    printf("\n");

// цикл пока
    x = 1;
    while (x <= 7)
      {
	printf("%d", x);
	x++;
      }
    printf("\n");

// цикл с постуловием
    x =1;
    do
      {
	printf("%d", x);
	x++;
      }
    while (x <= 7);
    printf("\n");

// цикл со счетчиком
    for (x = 1; x <= 7; x++)
	printf("%d", x);
    printf("\n");

//
    for (x=1, y=9; x<y; x++, y--)
	printf("%d %d\n", x, y);

    getch();
  }