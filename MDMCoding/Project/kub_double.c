#include <stdio.h>
void kub_chisla(double x);
int main(void)
{
  double num = 0.0;
  printf("Vvedite chislo: ");
  scanf("%lf", &num);
  kub_chisla(num);
  return 0;
}
void kub_chisla(double x)
{
  printf("Kub %f raven %f\n", x, x * x * x);
}
