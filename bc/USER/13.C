#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

main()
  {
    int k;
    int a[100];        //использовать макрос
    int sum;           //использовать long
    int x;
    clrscr();
		       //название программы
    printf("Введите количество элементов: ");
    scanf("%d", &k);   //добавить проверку на допустимость ввода

    for (x=0; x<k; x++)
      {
	printf("Введите %2d элемент: ", x+1);
	scanf("%d", &a[x]);
      }

    sum=0;
    for (x=0; x<k; x++)
      sum+=a[x];

    printf("Введен массив: [");
    for (x=0; x<k; x++)
      printf("%4d ", a[x]);
    printf("]\n");

    printf("Сумма элементов массива = %d", sum);

    getch();
  }










