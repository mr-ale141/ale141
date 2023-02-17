#include <stdio.h>
int main (int argc, char * argv[]) {
  int count;
  printf("Количество аргументов: %d\n", argc);
  for (count=0; count<argc; count++)
    printf("%d: %s\n", count, argv[count]);
  printf("\n");
  return 0;
}
