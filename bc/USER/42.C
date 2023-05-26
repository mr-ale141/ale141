#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

#define Name "mas.dat"
#define k 5

main()
  {
    int a[k];
    int x;
    FILE *p;
    p = fopen(Name, "r+");
    for (x=0; x<k; x++)
      fread(&a[x], sizeof(int), 1, p);
    fclose(p);
    clrscr();
    for (x=0; x<k; x++)
      printf("%6d\n", a[x]);
    getch();
  }
