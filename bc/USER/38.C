#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

main()
  {
    FILE *p;
    char a;
    clrscr();
    p = fopen("1.txt", "r");

    while ((a = fgetc(p)) != EOF)
      {
	 putchar(a);
      }
    fclose(p);

    getch();
  }
