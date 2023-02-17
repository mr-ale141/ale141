#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
void InsertDate(int *dd, int *mm, int *yy) {
  while (*dd<1 || *dd>31 || *mm<1 || *mm>12 || *yy>9999 || *yy<1) {
    printf("Vvedite datu (primer \"01 01 2001\"): ");
    while (scanf("%d %d %d", &*dd, &*mm, &*yy) != 3) {
      while (getchar() != '\n') {
        continue;
      }
      printf("Oshibka!!!Vvedeny necorrectnye dannye!!!\n");
      printf("Vvedite datu (primer \"01 01 2001\"): ");
    }
    if (*dd<1 || *dd>31 || *mm<1 || *mm>12 || *yy>9999 || *yy<1) {
      printf("Oshibka!!!Vvedena ne data!!!\n");
    }
  }
}
bool IsVisGod(int year) {
  bool is_vis_god = false;
  if (year % 400 == 0) {
    is_vis_god = true;
  } else if (year % 100 == 0) {
    is_vis_god = false;
  } else if (year % 4 == 0) {
    is_vis_god = true;
  } else {
    is_vis_god = false;
  }
  return is_vis_god;
}
int AfterDay(int dd, int mm, int yy) {
  int diff = 0;
  if (IsVisGod(yy)) {
    switch (mm) {
      case 1: diff=dd; break;
      case 2: diff=31+dd; break;
      case 3: diff=31+29+dd; break;
      case 4: diff=31+29+31+dd; break;
      case 5: diff=31+29+31+30+dd; break;
      case 6: diff=31+29+31+30+31+dd; break;
      case 7: diff=31+29+31+30+31+30+dd; break;
      case 8: diff=31+29+31+30+31+30+31+dd; break;
      case 9: diff=31+29+31+30+31+30+31+31+dd; break;
      case 10: diff=31+29+31+30+31+30+31+31+30+dd; break;
      case 11: diff=31+29+31+30+31+30+31+31+30+31+dd; break;
      case 12: diff=31+29+31+30+31+30+31+31+30+31+30+dd; break;
    }
  } else {
    switch (mm) {
      case 1: diff=dd; break;
      case 2: diff=31+dd; break;
      case 3: diff=31+28+dd; break;
      case 4: diff=31+28+31+dd; break;
      case 5: diff=31+28+31+30+dd; break;
      case 6: diff=31+28+31+30+31+dd; break;
      case 7: diff=31+28+31+30+31+30+dd; break;
      case 8: diff=31+28+31+30+31+30+31+dd; break;
      case 9: diff=31+28+31+30+31+30+31+31+dd; break;
      case 10: diff=31+28+31+30+31+30+31+31+30+dd; break;
      case 11: diff=31+28+31+30+31+30+31+31+30+31+dd; break;
      case 12: diff=31+28+31+30+31+30+31+31+30+31+30+dd; break;
    }
  }
  return diff;
}
bool IsNoCorrectDate(int dd1, int mm1, int yy1, int dd2, int mm2, int yy2) {
  if (yy1 < yy2) {
    return false;
  } else if (yy1 > yy2) {
    return true;
  } else {
    if (mm1 < mm2) {
      return false;
    } else if (mm1 > mm2) {
      return true;
    } else {
      if (dd1 < dd2) {
        return false;
      } else if (dd1 > dd2) {
        return true;
      } else {
        return true;
      }
    }
  }
}
int BetweenDates(int *dd1, int *mm1, int *yy1, int *dd2, int *mm2, int *yy2) {
  int diff = 0;
  printf("Nachalnaya data:\n");
  InsertDate(&*dd1, &*mm1, &*yy1);
  printf("Konechnaya data:\n");
  InsertDate(&*dd2, &*mm2, &*yy2);
  while (IsNoCorrectDate(*dd1, *mm1, *yy1, *dd2, *mm2, *yy2)) {
    printf("Oshibka!!!Konechnaya data menishe ili ravna nachalnoi!!!\n");
    *dd1=0; *mm1=0; *yy1=0; *dd2=0; *mm2=0; *yy2=0;
    printf("Nachalnaya data:\n");
    InsertDate(&*dd1, &*mm1, &*yy1);
    printf("Konechnaya data:\n");
    InsertDate(&*dd2, &*mm2, &*yy2);
  }
  if (*yy1 != *yy2) {
    if (IsVisGod(*yy1)) {
      diff += 1 + (366 - AfterDay(*dd1, *mm1, *yy1)); //+ день самой даты
    } else {
      diff += 1 + (365 - AfterDay(*dd1, *mm1, *yy1)); //+ день самой даты
    }
    for (int i = (*yy1+1); i <= (*yy2-1); i++) {
      if (IsVisGod(i)) {
        diff += 366;
      } else {
        diff += 365;
      }
    }
    diff += AfterDay(*dd2, *mm2, *yy2);
  } else {
    diff += AfterDay(*dd2, *mm2, *yy2) - AfterDay(*dd1, *mm1, *yy1) + 1;
  }
  return diff;
}
int main(void) {
  printf("***********Programma dlya rascheta voennoi pensii***********\n");
  float periods[20][10];
  for (int i=0; i<=19; i++) {
    for (int j=0; j<=9; j++) {
      periods[i][j]=0.0;
    }
  }
  //**************************************************************************
  printf("Dobavit' period sluzhby? ('Y' - esli da, 'N' - dlya vyhoda): ");
  char ch;
  while (ch = getchar()) {
    if (ch == 'Y' || ch == 'y') {
      int zero_str=0;
      float last_period=0.0;
      for (int i=0; i<=19; i++) {
        if (periods[i][0] == 0.0) {
          if (i==0) {
            last_period = 0.0;
            zero_str = 0;
            break;
          } else {
            last_period = periods[i-1][0];
            zero_str = i;
            break;
          }
        }
      }
      int dd1=0; int mm1=0; int yy1=0; int dd2=0; int mm2=0; int yy2=0;
      int dnei=0;
      dnei = BetweenDates(&dd1, &mm1, &yy1, &dd2, &mm2, &yy2);
      float koeff=0.0;
      printf("Vvedite lgotnyi koefficient perioda\n"
        "(esli god za god - \"1\", esli god za poltora - \"1.5\", i t.d.): ");
      scanf("%f", &koeff);
      float lgot_dnei = dnei * koeff;
      periods[zero_str][0] = ++last_period;
      periods[zero_str][1] = dd1;
      periods[zero_str][2] = mm1;
      periods[zero_str][3] = yy1;
      periods[zero_str][4] = dd2;
      periods[zero_str][5] = mm2;
      periods[zero_str][6] = yy2;
      periods[zero_str][7] = dnei;
      periods[zero_str][8] = koeff;
      periods[zero_str][9] = lgot_dnei;

      system("cls");
      printf("***********Programma dlya rascheta voennoi pensii***********\n");
      printf("Periody sluzhby voennosluzhaschego:\n");
      printf("Period |   Nachalo  |   Konetc   | Dnei | Koeff | Lgot Dnei\n");
      for (int i=0; i<=19; i++) {
        if (periods[i][0] != 0) {
          printf("%6.f | %02.f.%02.f.%04.f | %02.f.%02.f.%04.f"
                " | %4.f | %5.1f | %9.f\n",
                periods[i][0], periods[i][1], periods[i][2], periods[i][3],
                periods[i][4], periods[i][5], periods[i][6], periods[i][7],
                periods[i][8], periods[i][9]);
        } else {
          printf("---------------------------------------------------------\n");
          break;
        }
      }
      while (getchar() != '\n') {
        continue;
      }
    } else if (ch == 'N' || ch == 'n') {
      break;
    } else {
      while (getchar() != '\n') {
        continue;
      }
      printf("\nOtvet dolzhen byt` 'Y' ili 'N'\n");
    }
    printf("\nDobavit' period sluzhby? ('Y' - esli da, 'N' - esli net): ");
  }
// ************************************************************************

  if (periods[0][0] == 0) {
    return 0;
  }

  float down_koeff = 0.0;
  while (down_koeff<74 || down_koeff>100) {
    printf("\nV poiskovoi stroke Yandex vvedite: \"Ponizhayuschiy "
          "koefficient\ndlya naznacheniya voennyh pensiy na "
          "tekuschiy god\".\nOtvet ukazhite nizhe.\n");
    printf("\nVvedite ponizhayuschiy koefficient\n"
          "na tekuschiy god (Primer: na 2022 god vvesti \"74\"): ");
    while (scanf("%f", &down_koeff) !=1) {
      while (getchar() != '\n') {
        continue;
      }
      printf("\nV poiskovoi stroke Yandex vvedite: \"Ponizhayuschiy "
            "koefficient\ndlya naznacheniya voennyh pensiy na "
            "tekuschiy god\".\nOtvet ukazhite nizhe.\n");
      printf("\nVvedite ponizhayuschiy koefficient\n"
            "na tekuschiy god (Primer \"74\"): ");
    }
    if (down_koeff<74 || down_koeff>100) {
      printf("\nOshibka!!!Vveden nekorrektniy koefficient\n");
    }
    while (getchar() != '\n') {
      continue;
    }
  }

  float oklad_dolzhn = 0.0;
  while (oklad_dolzhn<1 || oklad_dolzhn>1000000) {
    printf("\nVvedite oklad po dolzhnosti\n"
          "(Primer \"10000.00\"): ");
    while (scanf("%f", &oklad_dolzhn) !=1) {
      while (getchar() != '\n') {
        continue;
      }
      printf("\nVvedite oklad po dolzhnosti\n"
            "(Primer \"10000.00\"): ");
    }
    if (oklad_dolzhn<1 || oklad_dolzhn>1000000) {
      printf("\nOshibka!!!Vveden nekorrektniy oklad\n");
    }
    while (getchar() != '\n') {
      continue;
    }
  }

  float oklad_zvan = 0.0;
  while (oklad_zvan<1 || oklad_zvan>1000000) {
    printf("\nVvedite oklad po zvaniyu\n"
          "(Primer \"10000.00\"): ");
    while (scanf("%f", &oklad_zvan) !=1) {
      while (getchar() != '\n') {
        continue;
      }
      printf("\nVvedite oklad po zvaniyu\n"
            "(Primer \"10000.00\"): ");
    }
    if (oklad_zvan<1 || oklad_zvan>1000000) {
      printf("\nOshibka!!!Vveden nekorrektniy oklad\n");
    }
    while (getchar() != '\n') {
      continue;
    }
  }

  float nadb_za_vyslugu = 0.0;
  while (nadb_za_vyslugu<1 || nadb_za_vyslugu>1000000) {
    printf("\nVvedite nadbavku za vyslugu let iz zarplatnoy kvitancii\n"
          "(Primer \"10000.00\"): ");
    while (scanf("%f", &nadb_za_vyslugu) !=1) {
      while (getchar() != '\n') {
        continue;
      }
      printf("\nVvedite nadbavku za vyslugu let iz zarplatnoy kvitancii\n"
            "(Primer \"10000.00\"): ");
    }
    if (nadb_za_vyslugu<1 || nadb_za_vyslugu>1000000) {
      printf("\nOshibka!!!Vvedeny nekorrektnye dannye\n");
    }
    while (getchar() != '\n') {
      continue;
    }
  }

  float rayonn_koeff = 0.0;
  while (rayonn_koeff<1 || rayonn_koeff>2) {
    printf("\nVvedite rajonnyj koefficient\n"
          "(Primer \"1.0\", \"1.5\", \"2.0\"): ");
    while (scanf("%f", &rayonn_koeff) !=1) {
      while (getchar() != '\n') {
        continue;
      }
      printf("\nVvedite rajonnyj koefficient\n"
            "(Primer \"1.0\", \"1.5\", \"2.0\"): ");
    }
    if (rayonn_koeff<1 || rayonn_koeff>2) {
      printf("\nOshibka!!!Rajonnyj koefficient ne v predelah ot 1.0 do 2.0\n");
    }
    while (getchar() != '\n') {
      continue;
    }
  }

float oklad_denezh_soderzh = oklad_dolzhn + oklad_zvan + nadb_za_vyslugu;

system("cls");
printf("***********Programma dlya rascheta voennoi pensii***********\n");
printf("Periody sluzhby voennosluzhaschego:\n");
printf("Period |   Nachalo  |   Konetc   | Dnei | Koeff | Lgot Dnei\n");
for (int i=0; i<=19; i++) {
  if (periods[i][0] != 0) {
    printf("%6.f | %02.f.%02.f.%04.f | %02.f.%02.f.%04.f"
          " | %4.f | %5.1f | %9.f\n",
          periods[i][0], periods[i][1], periods[i][2], periods[i][3],
          periods[i][4], periods[i][5], periods[i][6], periods[i][7],
          periods[i][8], periods[i][9]);
  } else {
    printf("-----------------------------------------------------------\n");
    break;
  }
}
printf("\nPonizhayuschiy koefficient    = %.2f%%\n", down_koeff);
printf("Oklad po dolzhnosti           = %.2f p\n", oklad_dolzhn);
printf("Oklad po zvaniyu              = %.2f p\n", oklad_zvan);
printf("Nadbavka za vyslugu let       = %.2f p\n", nadb_za_vyslugu);
printf("Oklad denezhnogo soderzhaniya = %.2f p\n", oklad_denezh_soderzh);
printf("Rajonnyj koefficient          = %.2f\n", rayonn_koeff);
printf("-----------------------------------------------------------\n");

float total_day = 0.0;
float total_lgot_day = 0.0;
for (int i=0; i<=19; i++) {
  total_day += periods[i][7];
  total_lgot_day += periods[i][9];
}
int year=0;
int month=0;
int day=0;
int lgot_year=0;
int lgot_month=0;
int lgot_day=0;
total_day += 1;
total_lgot_day += 1;

year = total_day / 365.25;
month = (total_day - year * 365.25) / 30.4375;
day = total_day - year * 365.25 - month * 30.4375;

lgot_year = total_lgot_day / 365.25;
lgot_month = (total_lgot_day - lgot_year * 365.25) / 30.4375;
lgot_day = total_lgot_day - lgot_year * 365.25 - lgot_month * 30.4375;
printf("Vysluga      | Let | Mesyacev | Dney\n");
printf("Kalendarnaya | %3d | %8d | %4d\n",
      year, month, day);
printf("Lgotnaya     | %3d | %8d | %4d\n",
      lgot_year, lgot_month, lgot_day);

float pens_koeff;
if (lgot_year < 20) {
  pens_koeff = 0.0;
} else {
  pens_koeff = 50.0 + (3*(lgot_year-20));
  if (pens_koeff>85) {
    pens_koeff = 85.0;
  }
}
printf("-----------------------------------------------------------\n");
printf("Pensionniy koefficient za vyslugu let = %.f%%\n", pens_koeff);
printf("-----------------------------------------------------------\n");
float pensiya;
pensiya = oklad_denezh_soderzh * (pens_koeff/100) * (down_koeff/100)
          * rayonn_koeff;
printf("Pensiya = %.2f p\n", pensiya);
printf("-----------------------------------------------------------\n");
if (pens_koeff == 0.0) {
  printf("\n!!!Malo prosluzhili, sluzhite dal`she!!!\n");
} else {
  printf("\n!!!Pensiya bez ucheta veterana boevyh deistviy!!!\n");
}
printf("\nNazhmite 'ENTER' dlya vyhoda\n");
ch = getchar();
return 0;
}
