#include <stdio.h>
#define DUYM_IN_FUT 12
#define CM_IN_DUYM 2.54
int main(void)
{
  float total_cm = 0;
  printf("Vvedite kolichestvo cm: ");
  scanf("%f", &total_cm);
  printf("\n");
  while(total_cm > 0)
  {
    int fut = 0;
    float duym = 0;
    float total_duym = 0;
    total_duym = total_cm / CM_IN_DUYM;
    fut = (int) total_duym / DUYM_IN_FUT;
    duym = total_duym - (fut * DUYM_IN_FUT);
    printf("%.1f cm sostavlyaet %d futov %.1f duymov\n",
          total_cm, fut, duym);
    printf("\n");
    printf("Vvedite kolichestvo cm: ");
    scanf("%f", &total_cm);
    printf("\n");
  }
  printf("Gotovo!\n");
  return 0;
}
