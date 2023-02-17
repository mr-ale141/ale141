#include <stdio.h>
#include <stdlib.h>

int main (int argc, char * argv[]) {
  int ch;
  FILE * fin;
  FILE * fout;
  char fnin[20];
  char fnout[20];
  unsigned long count = 0;
  printf("Введите имя файла для копирования: ");
  scanf("%s", fnin);
  getchar();
  printf("Введите имя файла для создания: ");
  scanf("%s", fnout);
  getchar();

  if ((fin=fopen(fnin, "r"))==NULL) {
    printf("Не удается открыть %s\n", fnin);
    exit(EXIT_FAILURE);
  }
  if ((fout=fopen(fnout, "w"))==NULL) {
    printf("Не удается открыть %s\n", fnout);
    exit(EXIT_FAILURE);
  }

  while ((ch=getc(fin))!=EOF) {
    putc(ch, fout);
    count++;
  }
  if (fclose(fin)!=0) {
    printf("Ошибка при закрытии файла %s\n", fnin);
  }
  if (fclose(fout)!=0) {
    printf("Ошибка при закрытии файла %s\n", fnout);
  }
  printf("Скопировано из файла %s всего %lu символов\n", fnin, count);
  getchar();
  return 0;
}
