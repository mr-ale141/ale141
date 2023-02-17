#include <stdio.h>

int main(void) {
  unsigned long long num_ot = 0ULL;
  unsigned long long num_do = 0ULL;
  printf("Vvedite diappazon:");
  scanf("%llu", &num_ot);
  scanf("%llu", &num_do);
  while (num_ot != 0) {
    unsigned long long count = 0;
    for (unsigned long long i = num_ot; i <= num_do; i++) {
      int flag = 0;
      for (unsigned long long j = 2; (j * j) <= i; j++) {
        if (i % j == 0) {
          flag = 1;
          break;
        }
      }
      if (flag == 0) {
        count++;
        printf("%10llu %10llu\n", count, i);
      }
    }
    printf("Vvedite diappazon:");
    scanf("%llu", &num_ot);
    scanf("%llu", &num_do);
  }
  return 0;
}
