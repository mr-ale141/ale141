#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

#define k 6

main()
  {
    int a[k]={5,9,3,9,4,2};
    int max;
    int i_max;
    int x;
    clrscr();

    printf("Массив    до: [");
    for (x=0; x<k; x++)
      printf("%4d ", a[x]);
    printf("]\n");


    max=a[0];
    for (x=1; x<k; x++)
	if (a[x]>max) max=a[x];

    for (x=0; x<k; x++)
	if (a[x]==max) a[x]=0;


    printf("Массив после: [");
    for (x=0; x<k; x++)
      printf("%4d ", a[x]);
    printf("]\n");

    getch();
  }










