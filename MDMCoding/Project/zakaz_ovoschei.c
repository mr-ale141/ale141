#include <stdio.h>
#include <stdlib.h>
#define CENA_ARTISHOK 2.05
#define CENA_SVEKLA 1.15
#define CENA_MORKOV 1.09
#define SUMSKIDKI 100.0
#define SKIDKA 0.05           // do dostavki skidka 5% na zakaz >= $100
#define MINMASS 5
#define MINCENADOST 6.50      // <= 5 kg zatraty na dostavku = $6.50
#define MAXMASS 20
#define MIDCENADOST 14.00     //               ot 5 do 20 kg = $14.00
#define UP20DOST MIDCENADOST + 0.50// > 20 kg = $14.00 + $0.50 za kazhdyi kg
char Zapros(void) {
  char ch;
  system("cls");
  printf("*************************************************************\n");
  printf("Vyberite poziciyu dlya zakaza:\n");
  printf("a) Artishok  $%.2f za kg\n", CENA_ARTISHOK);
  printf("b) Svekla    $%.2f za kg\n", CENA_SVEKLA);
  printf("c) Morkov    $%.2f za kg\n", CENA_MORKOV);
  printf("q) Vyvesti rezultat\n");
  printf("*************************************************************\n");
  printf("Otvet:");
  scanf(" %c", &ch);
  return ch;
}
float Zakaz(char ch) {
  float mass = 0.0;
  switch (ch) {
    case 'a':
      printf("Vvedite kolichestvo artishok v kg:");
      scanf("%f", &mass);
      return mass;
    case 'b':
      printf("Vvedite kolichestvo svekly v kg:");
      scanf("%f", &mass);
      return mass;
    case 'c':
      printf("Vvedite kolichestvo morkovi v kg:");
      scanf("%f", &mass);
      return mass;
  }
  printf("Vvedite kolichestvo v kg:");
  scanf("%f", &mass);
  return mass;
}
int main(void) {
  char ch;
  float mas_artishok = 0.0;
  float mas_svekla = 0.0;
  float mas_morkov = 0.0;
  while ((ch = Zapros()) != 'q') {
    switch (ch) {
      case 'a':
        mas_artishok += Zakaz(ch);
        break;
      case 'b':
        mas_svekla += Zakaz(ch);
        break;
      case 'c':
        mas_morkov += Zakaz(ch);
    }
    printf("\n");
  }
  system("cls");
  float total_mass = mas_artishok + mas_svekla + mas_morkov;
  float price_artishok = CENA_ARTISHOK * mas_artishok;
  float price_svekla = CENA_SVEKLA * mas_svekla;
  float price_morkov = CENA_MORKOV * mas_morkov;
  float base_price = price_artishok + price_svekla + price_morkov;
  float total_price = 0.0;
  float skidka = 0.0;
  if (base_price >= SUMSKIDKI) {
    skidka = base_price * SKIDKA;
  }
  float dostavka = 0.0;
  if (total_mass > 0 && total_mass <= MINMASS) {
    dostavka = MINCENADOST;
  } else if (total_mass > MINMASS && total_mass <= MAXMASS) {
    dostavka = MIDCENADOST;
  } else if (total_mass > MAXMASS) {
    dostavka = UP20DOST * (total_mass - MAXMASS);
  }
  total_price = base_price - skidka + dostavka;
  printf("-------------------------------------------------------------\n");
  printf("Vy zakazali:\n");
  if (mas_artishok > 0) {
    printf("%6.2f kg artishok po $%.2f za kg na summu $%6.2f\n",
            mas_artishok, CENA_ARTISHOK, price_artishok);
  }
  if (mas_svekla > 0) {
    printf("%6.2f kg svekly   po $%.2f za kg na summu $%6.2f\n",
            mas_svekla, CENA_SVEKLA, price_svekla);
  }
  if (mas_morkov > 0) {
    printf("%6.2f kg morkovi  po $%.2f za kg na summu $%6.2f\n",
            mas_morkov, CENA_MORKOV, price_morkov);
  }
  printf("Obschaya massa zakaza:   %6.2f kg\n", total_mass);
  printf("Stoimost zakaza:        $%6.2f\n", base_price);
  if (skidka > 0) {
    printf("Skidka:                 $%6.2f\n", skidka);
  }
  printf("Dostavka:               $%6.2f\n", dostavka);
  printf("Itogovaya summa zakaza: $%6.2f\n", total_price);
  printf("Otpravte \"PROBEL\" dlya vyhoda:");
  while ((ch = getchar()) != ' ')
    ;
  return 0;
}
