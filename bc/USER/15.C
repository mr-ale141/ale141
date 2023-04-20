#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

#define k 6

main()
  {
    int a[k]={5,9,3,6,4,2};
    int max, min;
    int x;
    clrscr();

    min=max=a[0];
    for (x=1; x<k; x++)
      {
	if (a[x]>max) max=a[x];
	if (a[x]<min) min=a[x];
      }
    printf("Массив: [");
    for (x=0; x<k; x++)
      printf("%4d ", a[x]);
    printf("]\n");

    printf("Максимальный элемент массива = %d\n", max);
    printf("Минимальный элемент массива = %d\n", min);
    getch();
  }










