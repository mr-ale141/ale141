#include <stdio.h>
#define BASENALOG 0.15
#define UPNALOG 0.28
#define ALONE 17850.0
#define I_FAMILY 23900.0
#define FAMILY_GROUP 29750.0
#define FAMILY_WITHOUT_GROUP 14875.0
int ChoiceCat(void) {
  int otvet = 0;
  printf("Insert category:\n");
  printf("1) Odinokiy\n");
  printf("2) Glava simeystva\n");
  printf("3) Sostoit v brake, sovmestnoe vedenie hozyaistva\n");
  printf("4) Sostoit v brake, razdelnoe vedenie hozyaistva\n");
  printf("5) Exit\n");
  printf("Otvet:");
  scanf("%d", &otvet);
  return otvet;
}
float Nalog(float base, float dohod) {
  float nalog = 0.0;
  if (dohod <= base) {
    nalog = dohod * BASENALOG;
  } else {
    nalog = base * BASENALOG + UPNALOG * (dohod - base);
  }
  return nalog;
}
int main(void) {
  int category = 0;
  float dohod = 0.0;
  float nalog = 0.0;
  do {
    category = ChoiceCat();
  } while (category < 1 || category > 5);
  if (category == 5) {
    printf("\nGotovo\n");
    return 0;
  }
  printf("\n");
  printf("Vvedite dohod:");
  scanf("%f", &dohod);
  while (category != 5){
    switch (category) {
      case 1:
        nalog = Nalog(ALONE, dohod);
        break;
      case 2:
        nalog = Nalog(I_FAMILY, dohod);
        break;
      case 3:
        nalog = Nalog(FAMILY_GROUP, dohod);
        break;
      case 4:
        nalog = Nalog(FAMILY_WITHOUT_GROUP, dohod);
    }
    if (nalog <= 0) {
      printf("\n");
      printf("Vvedite dannye\n");
    } else {
      printf("\n");
      printf("Nalog = $%.2f\n", nalog);
    }
    nalog = 0;
    do {
      printf("\n");
      category = ChoiceCat();
    } while (category < 1 || category > 5);
    if (category == 5)
      break;
    printf("\n");
    printf("Vvedite dohod:");
    scanf("%f", &dohod);
  }
  printf("\n");
  printf("Gotovo\n");
  return 0;
}
