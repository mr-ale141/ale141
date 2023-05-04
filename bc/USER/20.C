#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>
#include <alloc.h>

#define N 10

main()
  {
    int A[N+1];
    int x, temp;
    clrscr();
    randomize();
    for (x=0; x<=N; x++) A[x]=0;
    for (temp=0; temp<N; temp++)
      {
	do
	  x=random(N)+1;
	while (A[x] == 1);
	printf("%d", x);
	A[x]=1;
      }


    getch();
  }










