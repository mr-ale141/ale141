#include <stdio.h>
int main(void) {
  double elements[8];
  double sum[8];
  printf("Vvedite elementy massiva:");
  for (int i = 0; i < 8; i++) {
    scanf("%lf", &elements[i]);
    if (i == 0) {
      sum[i] = elements[i];
    } else {
      sum[i] = elements[i] + sum[i - 1];
    }
  }
  for (int i = 0; i < 8; i++) {
    printf("[%10f]", elements[i]);
  }
  printf("\n");
  for (int i = 0; i < 8; i++) {
    printf("[%10f]", sum[i]);
  }
  return 0;
}
