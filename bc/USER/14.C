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
    int count;
    int x;
    clrscr();

    for (x=0, count=0; x<k; x++)
      if (a[x]>=2 && a[x]<=5) count++;

    printf("Массив: [");
    for (x=0; x<k; x++)
      printf("%4d ", a[x]);
    printf("]\n");

    printf("Количество элементов массива от 2 до 5 = %d", count);

    getch();
  }










