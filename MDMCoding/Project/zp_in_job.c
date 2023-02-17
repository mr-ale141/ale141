#include <stdio.h>
#define TARIF1 8.75
#define TARIF2 9.33
#define TARIF3 10.00
#define TARIF4 11.20
#define UP40H 1.5
#define FIRST300 0.15
#define NEXT150 0.20
#define NEXT 0.25
#define BASE 300.0
#define UPBASE 150.0
int zapros(void) {
  int otvet = 0;
  for (int i = 1; i < 100; i++)
    printf("*");
  printf("\n");
  printf("Vveddite chislo ot 1 do 5\n");
  printf("1) $8.75/h                    2) $9.33/h\n");
  printf("3) $10.00/h                   4) $11.20/h\n");
  printf("5) Exit\n");
  for (int i = 1; i < 100; i++)
    printf("*");
  printf("\n");
  printf("Otvet:");
  scanf("%d", &otvet);
  return otvet;
}

void job(const float TARIF) {
  float job_hour = 0.0;
  float nalog = 0.0;
  float nach = 0.0;
  float zp = 0.0;
  printf("\n");
  printf("Skol`ko otrabotal za nedelyu:");
  scanf("%f", &job_hour);
  if (job_hour <= 40) {
    nach = TARIF * job_hour;
  } else {
    nach = 40 * TARIF + (job_hour - 40) * TARIF * UP40H;
  }
  printf("\n");
  printf("Nachisleno $%.2f\n", nach);
  if (nach <= BASE) {
    nalog = nach * FIRST300;
  } else if (nach > BASE && nach <= (BASE + UPBASE)) {
    nalog = BASE * FIRST300 + NEXT150 * (nach - BASE);
  } else {
    nalog = BASE * FIRST300 + NEXT150 * UPBASE + NEXT * (nach - BASE - UPBASE);
  }
  printf("Nalogov $%.2f\n", nalog);
  zp = nach - nalog;
  printf("Zarplata $%.2f\n", zp);
}

int main(void) {
  int otvet = 0;
  otvet = zapros();
  while (otvet != 5) {
    switch (otvet) {
      case 1 :
        job(TARIF1);
        break;
      case 2 :
        job(TARIF2);
        break;
      case 3 :
        job(TARIF3);
        break;
      case 4 :
        job(TARIF4);
    }
    printf("\n");
    otvet = zapros();
  }
  printf("\n");
  printf("Gotovo\n");
  return 0;
}
