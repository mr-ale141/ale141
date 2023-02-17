#include <stdio.h>
int main(void)
{
  printf("Vvedide kolichestvo elementov: ");
  int zapros = 0;
  scanf("%d", &zapros);
  while (zapros > 0)
  {
    double sum1 = 0.0;
    double sum2 = 0.0;
    for (int i = 1; i <= zapros; i++)
      sum1 += 1.0/(double) i;
    _Bool minus = 0;
    for (int j = 1; j <= zapros; j++)
      {
        if (minus == 0) {
          sum2 += 1.0/(double) j;
          minus = 1;
        } else {
          sum2 -= 1.0/(double) j;
          minus = 0;
        }
      }
    printf("%15lf\n", sum1);
    printf("%15lf\n", sum2);
    printf("Vvedide kolichestvo elementov: ");
    scanf("%d", &zapros);
  }
  return 0;
}
