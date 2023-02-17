#include <stdio.h>
#define NEDELYA 7
int main(void)
{
  int total_deys = 0;
  printf("Vvedite kolichestvo dney: ");
  scanf("%d", &total_deys);
  printf("\n");
  while(total_deys > 0)
  {
    int nedel = 0;
    int deys = 0;
    nedel = total_deys / NEDELYA;
    deys = total_deys % NEDELYA;
    printf("%d dney sostavlyaet %d nedel %d deys\n", total_deys, nedel, deys);
    printf("\n");
    printf("Vvedite kolichestvo dney: ");
    scanf("%d", &total_deys);
    printf("\n");
  }
  printf("Gotovo!\n");
  return 0;
}
