#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

int summa(int A, int B)
  {
    return A + B;
  }

main()
  {
    int x;
    clrscr();
    x = summa(3, 4);
    printf("%d\n", x);
    printf("%d\n", summa(12, 5));
    getch();
  }
