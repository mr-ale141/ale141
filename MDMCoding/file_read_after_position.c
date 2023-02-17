#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main (void) {
  char fname[10];
  char ch;
  long pos;
  FILE * fp;
  printf("Введите имя текстового файла: ");
  scanf("%s", fname);
  getchar();
  if ((fp=fopen(fname, "r"))==NULL) {
    printf("Не удается открыть %s\n", fname);
    exit(EXIT_FAILURE);
  }
  printf("Введите позицию: ");
  while(scanf("%ld", &pos)>0 && pos>0) {
    if (fseek(fp, pos, SEEK_SET)!=0)
      printf("Ошибка позиции!\n");
    while ((ch=fgetc(fp))!='\n')
      fputc(ch, stdout);
    printf("\nВведите позицию: ");
  }
  return 0;
}
