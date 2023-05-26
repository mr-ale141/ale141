#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

#define Name "mas.txt"
#define k 5

main()
  {
    int A[k];
    int x;
    FILE *p;
    char a;
    p = fopen(Name, "r");
    for (x=0; x<k; x++)
      fscanf(p, "%d", &A[x]);
    fclose(p);
    clrscr();
    for (x=0; x<k; x++)
      printf("%6d\n", A[x]);
    getch();
  }
