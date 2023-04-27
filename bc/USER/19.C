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
    int x, y, temp, count=0;
    int sort;
    clrscr();

    printf("До   :");
    for (x=0; x<k; x++) printf("%2d", A[x]);
    printf("\n");

    do
      {
	sort = 0;
	for (x=0; x<k-1; x++)
	  {
	    if (A[x] > A[x+1])
	      {
		temp = A[x];
		A[x] = A[x+1];
		A[x+1] = temp;
		sort = 1;
		y=x;
		printf("Шаг %d:", count);
		for (x=0; x<k; x++) printf("%2d", A[x]);
		printf("\n");
		count++;
		x=y;
	      }
	  }

      }
    while (sort);

    printf("После:");
    for (x=0; x<k; x++) printf("%2d", A[x]);
    printf("\n");

    getch();
  }










