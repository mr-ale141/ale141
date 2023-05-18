#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

#define k 3
typedef struct
  {
    char *Fam;
    int Zar;
  } tip1;

main()
  {
    tip1 m[k]; int x;
    clrscr();
    m[0].Fam = "Иванов";     m[0].Zar = 200;
    m[1].Fam = "Ивановский"; m[1].Zar = 15;
    m[2].Fam = "Кац";        m[2].Zar = 1000;
    for (x = 0; x<k; x++)
      printf("%d %-10s %4d\n", x+1, m[x].Fam, m[x].Zar);

    getch();
  }
