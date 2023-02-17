#include <stdio.h>
#include <stdlib.h>
int main (int argc, char * argv[]) {
  long size;
  int ch_write;
  int ch_read;
  FILE * fin;
  FILE * fout;
  char fnin[20];
  char fnout[20];
  char buffer;
  unsigned long count = 0;
  printf("Введите имя файла для копирования: ");
  scanf("%s", fnin);
  getchar();
  printf("Введите имя файла для создания: ");
  scanf("%s", fnout);
  getchar();

  if ((fin=fopen(fnin, "rb"))==NULL) {
    printf("Не удается открыть %s\n", fnin);
    exit(EXIT_FAILURE);
  }
  fseek(fin, 0L, SEEK_END);
  size = ftell(fin);
  fseek(fin, 0L, SEEK_SET);
  fprintf(stdout, "*%ld*", size);
  if ((fout=fopen(fnout, "wb"))==NULL) {
    printf("Не удается открыть %s\n", fnout);
    exit(EXIT_FAILURE);
  }

  while (fread(&buffer, sizeof(char), sizeof buffer, fin)>0) {
    ch_write = fwrite(&buffer, sizeof(char), sizeof buffer, fout);
    count++;
  }

  if (fclose(fin)!=0) {
    printf("Ошибка при закрытии файла %s\n", fnin);
  }
  if (fclose(fout)!=0) {
    printf("Ошибка при закрытии файла %s\n", fnout);
  }
  printf("Скопировано из файла %s всего %lu символов\n", fnin, count);
  return 0;
}
