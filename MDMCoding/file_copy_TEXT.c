#include <stdio.h>
#include <stdlib.h>

int main (int argc, char * argv[]) {
  int ch;
  FILE * fin;
  FILE * fout;
  char fnin[20];
  char fnout[20];
  unsigned long count = 0;
  printf("������ ��� 䠩�� ��� ����஢����: ");
  scanf("%s", fnin);
  getchar();
  printf("������ ��� 䠩�� ��� ᮧ�����: ");
  scanf("%s", fnout);
  getchar();

  if ((fin=fopen(fnin, "r"))==NULL) {
    printf("�� 㤠���� ������ %s\n", fnin);
    exit(EXIT_FAILURE);
  }
  if ((fout=fopen(fnout, "w"))==NULL) {
    printf("�� 㤠���� ������ %s\n", fnout);
    exit(EXIT_FAILURE);
  }

  while ((ch=getc(fin))!=EOF) {
    putc(ch, fout);
    count++;
  }
  if (fclose(fin)!=0) {
    printf("�訡�� �� �����⨨ 䠩�� %s\n", fnin);
  }
  if (fclose(fout)!=0) {
    printf("�訡�� �� �����⨨ 䠩�� %s\n", fnout);
  }
  printf("�����஢��� �� 䠩�� %s �ᥣ� %lu ᨬ�����\n", fnin, count);
  getchar();
  return 0;
}
