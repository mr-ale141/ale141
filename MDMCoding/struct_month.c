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
  {"������", "ﭢ", 31, 1},
  {"���ࠫ�", "䥢", 28, 2},
  {"����", "���", 31, 3},
  {"��५�", "���", 30, 4},
  {"���", "���", 31, 5},
  {"���", "��", 30, 6},
  {"���", "��", 31, 7},
  {"������", "���", 31, 8},
  {"�������", "ᥭ", 30, 9},
  {"������", "���", 31, 10},
  {"�����", "���", 30, 11},
  {"�������", "���", 31, 12}
};

int before_deys(int num_month)
{
  int total=0;
  for (int i=0; i<num_month; i++)
    total += months[i].days;
  return total;
}

char toUp(char ch) {
  char low[34]="������񦧨���������������������";
  char up[34]="�������������������������������";
  for (int i=0; i<34; i++) {
    if (ch==low[i]) {
      return up[i];
      break;
    }
  }
}

int main (void) {
  char month[10];
  puts("������ �����: ");
  scanf("%s", month);
  getchar();
  month[0]=toUp(month[0]);
  for (int i=0; i<12; i++) {
    if (strstr(months[i].name, month))
      printf("������⢮ ����: %d\n", before_deys(months[i].number));
  }

  return 0;
}
