#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

#define k 6

main()
  {
    int A[k]={5,9,4,7,6,3};
    int x, y, temp;
    clrscr();

    printf("До   :");
    for (x=0; x<k; x++) printf("%2d", A[x]);
    printf("\n");

    for (x=0, y=k-1; x<y; x++, y--)
      {
	temp = A[x];
	A[x] = A[y];
	A[y] = temp;
      }

    printf("После:");
    for (x=0; x<k; x++) printf("%2d", A[x]);
    printf("\n");

    getch();
  }










