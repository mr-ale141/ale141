#include <stdio.h>
#include <stdlib.h>
int main (void) {
  printf("������ ��� 䠩�� ��� ᮧ�����: ");
  FILE * fp;
  char fname [10];
  scanf("%s", fname);
  getchar();
  fp = fopen(fname, "w");
  char data [100];
  printf("������ �� ������� � 䠩�:\n");
  fgets(data, 99, stdin);
  fputs(data, fp);
  return 0;
}
