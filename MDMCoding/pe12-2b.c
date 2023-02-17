#include <stdio.h>
_Bool set_mode(const int x, _Bool mode) {
  if (x > 1) {
    printf("Указан недопустимый режим. Используется режим %d ", mode);
    (mode == 0)?printf("(метрический).\n"):printf("(американский).\n");
  }
  mode = (x==0)? 0: 1;
  return mode;
}
void get_info(float * data, _Bool mode) {
  if (mode == 0) {
    printf("Введите пройденное расстояние в километрах: ");
    scanf("%f", &data[0]);
    printf("Введите объем израсходованного топлива в литрах: ");
    scanf("%f", &data[1]);
  }
  if (mode == 1) {
    printf("Введите пройденное расстояние в милях: ");
    scanf("%f", &data[0]);
    printf("Введите объем израсходованного топлива в галлонах: ");
    scanf("%f", &data[1]);
  }
}
void show_info(float * data, _Bool mode) {
  if (mode == 0) {
    printf("Расход топлива составляет %.2f литров на 100 км.\n",
            data[1]*100/data[0]);
  }
  if (mode == 1) {
    printf("Расход топлива составляет %.1f мили на галлон.\n",
            data[0]/data[1]);
  }
}
int main (void) {
  int mode_menu;
  float data[2];
  _Bool mode = 0;
  printf("Введите 0 для метр. реж. или 1 для амер. режима: ");
  scanf("%d", &mode_menu);
  while (mode_menu >= 0) {
    mode = set_mode(mode_menu, mode);
    get_info(data, mode);
    show_info(data, mode);
    printf("Введите 0 для метр. реж. или 1 для амер. режима\n");
    printf("(-1 для завершения): ");
    scanf("%d", &mode_menu);
  }
  printf("Программа завершена.");
  while (getchar()!='\n') {
    continue;
  }
  getchar();
  return 0;
}
