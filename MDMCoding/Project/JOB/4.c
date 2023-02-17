#include <stdio.h>

unsigned long long factorial(int n);

int main(void)
{
  int n;
  unsigned long long ans=1;
  printf("Enter n: ");
  scanf("%d", &n);

  /* Solving the problem */

  for (int i=1; i<=n; i++)
  {
    ans*=factorial(i);
  }

  printf("F(n) = %llu\n", ans);

  return 0;
}

unsigned long long factorial(int n)
{
  return (n==1 || n==0) ? 1 : n*factorial(n-1);
}
