#include <stdio.h>
int main(void)
{
  int x;
  int y;
  int ans=0;
  do
  {
    printf("x > y\n");
    printf("Enter \"x y\":");
    scanf("%d %d", &x, &y);
  } while (x<=y);

  /* Solving the problem */

  while (x>=y)
  {
    x-=y;
    ans++;
  }
  printf("answer = %d\n", ans);
  printf("difference = %d\n", x);

  return 0;
}
