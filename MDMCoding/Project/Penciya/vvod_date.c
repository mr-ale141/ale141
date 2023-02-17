#include <stdio.h>

int main(void) {
  char ch;
  int dd1 = 0;
  int mm1 = 0;
  int yy1 = 0;
  int dd2 = 0;
  int mm2 = 0;
  int yy2 = 0;
  while (dd1<1 || dd1>31 || mm1<1 || mm1>12 || yy1>9999 || yy1<1) {
    printf("Vvedite datu nachala (primer \"01 01 2001\"): ");
    while (scanf("%d %d %d", &dd1, &mm1, &yy1) != 3) {
      while (getchar() != '\n') {
        continue;
      }
      printf("Vvedeny necorrectnye dannye\n");
      printf("Vvedite datu nachala (primer \"01 01 2001\"): ");
    }
    if (dd1<1 || dd1>31 || mm1<1 || mm1>12 || yy1>9999 || yy1<1) {
      printf("Vvedena ne data\n");
    }
  }
  while (dd2<1 || dd2>31 || mm2<1 || mm2>12 || yy2>9999 || yy2<1) {
    printf("Vvedite datu okonchaniya (primer \"01 01 2001\"): ");
    while (scanf("%d %d %d", &dd2, &mm2, &yy2) != 3) {
      while (getchar() != '\n') {
        continue;
      }
      printf("Vvedeny necorrectnye dannye\n");
      printf("Vvedite datu okonchaniya (primer \"01 01 2001\"): ");
    }
    if (dd2<1 || dd2>31 || mm2<1 || mm2>12 || yy2>9999 || yy2<1) {
      printf("Vvedena ne data\n");
    }
  }
  printf("Vvedeno:\n");
  printf("%02d | %02d | %04d\n", dd1, mm1, yy1);
  printf("%02d | %02d | %04d\n", dd2, mm2, yy2);

  

  return 0;
}
