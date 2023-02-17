#include <stdio.h>
int main(void)
{
  int a;
  int b;
  printf("Enter \"a b\":");
  scanf("%d %d", &a, &b);
  printf("a = %d\n", a);
  printf("b = %d\n", b);

  /* Solving the problem */
  printf("Wzhuh!\n");

  a=a+b;
  b=a-b;
  a=a-b;


  printf("a = %d\n", a);
  printf("b = %d\n", b);

  return 0;
}
