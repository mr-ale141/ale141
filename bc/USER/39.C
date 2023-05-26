#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

#define Name "mas.txt"
#define k 5

main()
  {
    int A[k]={1, 12, 123, 1234, 12345};
    int x;
    FILE *p;
    char a;

    p = fopen(Name, "w");

    for (x=0; x<k; x++)
      fprintf(p, "%d\n", A[x]);

    fclose(p);

    getch();
  }
