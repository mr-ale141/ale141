#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main (int argc, char * argv[]) {
  FILE * f1;
  FILE * f2;
  char str1[50];
  char str2[50];
  char * ch1;
  char * ch2;
  if (argc==1) {
    printf("Использование: %s имя1, имя2\n", argv[0]);
    exit(EXIT_FAILURE);
  }
  if ((f1=fopen(argv[1], "r"))==NULL) {
    printf("Не удается открыть %s\n", argv[1]);
    exit(EXIT_FAILURE);
  }
  if ((f2=fopen(argv[2], "r"))==NULL) {
    printf("Не удается открыть %s\n", argv[2]);
    exit(EXIT_FAILURE);
  }

  ch1 = fgets(str1, 50, f1);
  ch2 = fgets(str2, 50, f2);
  while (ch1 || ch2) {
    if (ch1) {
      *(strstr(str1, "\n")) = '\0';
      printf("%50s", str1);
    } else {
      printf("%50s", "");
    }
    printf(" |*| ");
    if (ch2) {
      *(strstr(str2, "\n")) = '\0';
      printf("%-50s", str2);
    }
    printf("\n");
    ch1 = fgets(str1, 50, f1);
    ch2 = fgets(str2, 50, f2);
  }

  if (fclose(f1)!=0) {
    printf("Ошибка при закрытии файла %s\n", argv[1]);
  }
  if (fclose(f2)!=0) {
    printf("Ошибка при закрытии файла %s\n", argv[2]);
  }
  return 0;
}
