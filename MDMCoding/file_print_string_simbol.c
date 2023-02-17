#include <stdio.h>
#include <stdlib.h>
int main (int argc, char * argv[]) {
  FILE * f1;
  FILE * f2;
  char string1[50];
  char string2[50];
  char ch1;
  char ch2;
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

  ch1 = fgetc(f1);
  ch2 = fgetc(f2);
  while(ch1!=EOF || ch2!=EOF) {
    while (ch1!='\n' && ch1!=EOF) {
        printf("%c", ch1);
        ch1 = fgetc(f1);
    }
    printf(" |*| ");
    while (ch2!='\n' && ch2!=EOF) {
        printf("%c", ch2);
        ch2 = fgetc(f2);
    }
    printf("\n");
    ch1 = fgetc(f1);
    ch2 = fgetc(f2);
  }

  if (fclose(f1)!=0) {
    printf("Ошибка при закрытии файла %s\n", argv[1]);
  }
  if (fclose(f2)!=0) {
    printf("Ошибка при закрытии файла %s\n", argv[2]);
  }
  return 0;
}
