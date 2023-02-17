#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

struct month {
  char name[10];
  char mini_name[4];
  int days;
  int number;
};

struct month months[12] =
{
  {"Январь", "янв", 31, 1},
  {"Февраль", "фев", 28, 2},
  {"Март", "мар", 31, 3},
  {"Апрель", "апр", 30, 4},
  {"Май", "май", 31, 5},
  {"Июнь", "июн", 30, 6},
  {"Июль", "июл", 31, 7},
  {"Август", "авг", 31, 8},
  {"Сентябрь", "сен", 30, 9},
  {"Октябрь", "окт", 31, 10},
  {"Ноябрь", "ноя", 30, 11},
  {"Декабрь", "дек", 31, 12}
};

int before_deys(int num_month)
{
  int total=0;
  for (int i=0; i<num_month; i++)
    total += months[i].days;
  return total;
}

char toUp(char ch) {
  char low[34]="абвгдеёжзийклмнопрстуфхцчъыьэюя";
  char up[34]="АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧЪЫЬЭЮЯ";
  for (int i=0; i<34; i++) {
    if (ch==low[i]) {
      return up[i];
      break;
    }
  }
}

int main (void) {
  char month[10];
  puts("Введите месяц: ");
  scanf("%s", month);
  getchar();
  month[0]=toUp(month[0]);
  for (int i=0; i<12; i++) {
    if (strstr(months[i].name, month))
      printf("Количество дней: %d\n", before_deys(months[i].number));
  }

  return 0;
}
