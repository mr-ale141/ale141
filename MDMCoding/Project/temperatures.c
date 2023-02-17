#include <stdio.h>
void Temperatures(double far);
int main(void)
{
  double far = 0.0;
  _Bool flag = 0;
  printf("Vvedite temperaturu (F): ");
  flag = scanf("%lf", &far);
  while(flag == 1)
  {
    Temperatures(far);
    printf("\n");
    printf("Vvedite temperaturu (F): ");
    flag = scanf("%lf", &far);
  }
  printf("\n");
  printf("Gotovo!\n");
  return 0;
}
void Temperatures(double far)
{
  double cels = 5.0/9.0 * (far - 32.0);
  double kelv = cels + 273.16;
  printf("%.2fF = %.2fC = %.2fK\n", far, cels, kelv);
}
