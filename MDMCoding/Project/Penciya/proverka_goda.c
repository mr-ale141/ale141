#include <stdio.h>
int main(void) {
  int year1;
  int year2;
  printf("Vvedite goda: ");
  scanf("%d %d", &year1, &year2);

  for (int year = year1; year <= year2; year++) {
    if (year % 400 == 0) {
      printf("%d - visikosnyi\n", year);
    } else if (year % 100 == 0) {
      printf("%d - NEvisikosnyi\n", year);
    } else if (year % 4 == 0) {
      printf("%d - visikosnyi\n", year);
    } else {
      printf("%d - NEvisikosnyi\n", year);
    }
  }
  return 0;
}
