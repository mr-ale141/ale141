#include <stdio.h>
unsigned long long count=0;
void towers(int n, int i, int j)
{
  int k;
  if (n==1)
  {
    count++;
    printf("%llu Mov disk from the %d to %d\n", count, i, j);
  }
  else
  {
    k=6-i-j;
    towers(n-1, i, k);
    towers(1, i, j);
    towers(n-1, k, j);
  }
}

int main (void) {
  int n=0;
  printf("Insert n:");
  scanf("%d", &n);
  towers(n, 1, 3);
  return 0;
}
