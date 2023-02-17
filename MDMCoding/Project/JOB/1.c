#include <stdio.h>
#include <stdlib.h>
int main(void)
{
  int n;
  int sum=0;
  printf("Enter the size of the array NxN.\n");
  printf("N = ");
  scanf("%d", &n);
  int arr[n][n];
  for (int i=0; i<n; i++)
  {
    for (int j=0; j<n; j++)
    {
      arr[i][j]=rand()%10;
    }
  }
  for (int i=0; i<n; i++)
  {
    for (int j=0; j<n; j++)
    {
      printf("| %d |", arr[i][j]);
    }
    printf("\n");
  }

  /* Solving the problem */

  for (int i=0; i<n; i++)
  {
    sum+=arr[i][i];
  }

  printf("sum = %d\n", sum);

  return 0;
}
