#include <stdio.h>
int main(void)
{
  int dney = 0;
  printf("Vvedite kolichestvo dney: ");
  scanf("%d", &dney);
  int count = 0;
  int sum = 0;
  while(++count <= dney)
  {
    sum = sum + count * count;
    printf("V %d den summa dohoda $%d\n", count, sum);
  }
  return 0;
}
