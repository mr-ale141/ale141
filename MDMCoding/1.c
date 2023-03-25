#include <stdio.h>


int main (void)
{
  int i = 2;
  int a = 3;
  a += i++;
  printf("%d", a);
  i = 2;
  a = 3;
  a += ++i;
  printf("%d", a);
}
