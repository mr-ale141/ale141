#include <stdio.h>
#include <stdlib.h>
int main (void) {
  printf("Введите имя файла для создания: ");
  FILE * fp;
  char fname [10];
  scanf("%s", fname);
  getchar();
  fp = fopen(fname, "w");
  char data [100];
  printf("Введите что записать в файл:\n");
  fgets(data, 99, stdin);
  fputs(data, fp);
  return 0;
}
