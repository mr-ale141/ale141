#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

#define Name "mas.dat"

main()
  {
    int temp;
    int n = 2;
    FILE *p;
    p = fopen(Name, "r+");
    fseek(p, n*sizeof(int), 0);
    fread(&temp, sizeof(int), 1, p);
    temp = temp * 10;
    fseek(p, n*sizeof(int), 0);
    fwrite(&temp, sizeof(int), 1, p);
    fclose(p);
  }
