#include <stdio.h>
int main(void)
{
  int modul = 0;
  printf("Vvedite modul: ");
  scanf("%d", &modul);
  printf("\n");
  int num = 0;
  printf("Vvedite chislo: ");
  scanf("%d", &num);
  while(num > 0)
  {
    printf("%d %% %d raven %d\n", num, modul, num % modul);
    printf("\n");
    printf("Vvedite chislo: ");
    scanf("%d", &num);
  }
  printf("\n");
  printf("Gotovo!\n");
  return 0;
}
