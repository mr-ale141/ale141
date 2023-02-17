#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main (int argc, char * argv[]) {
  FILE * fp;
  char str[200];
  char * ch;
  if (argc<3) {
    printf("Использование: %s строка имя_файла\n", argv[0]);
    exit(EXIT_FAILURE);
  }
  if ((fp=fopen(argv[2], "r"))==NULL) {
    printf("Не удается открыть %s\n", argv[2]);
    exit(EXIT_FAILURE);
  }
  ch = fgets(str, 200, fp);
  while (ch) {
    if (strstr(str, argv[1]))
      puts(str);
    ch = fgets(str, 200, fp);
  }
  return 0;
}
