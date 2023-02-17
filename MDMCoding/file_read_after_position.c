#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main (void) {
  char fname[10];
  char ch;
  long pos;
  FILE * fp;
  printf("������ ��� ⥪�⮢��� 䠩��: ");
  scanf("%s", fname);
  getchar();
  if ((fp=fopen(fname, "r"))==NULL) {
    printf("�� 㤠���� ������ %s\n", fname);
    exit(EXIT_FAILURE);
  }
  printf("������ ������: ");
  while(scanf("%ld", &pos)>0 && pos>0) {
    if (fseek(fp, pos, SEEK_SET)!=0)
      printf("�訡�� ����樨!\n");
    while ((ch=fgetc(fp))!='\n')
      fputc(ch, stdout);
    printf("\n������ ������: ");
  }
  return 0;
}
