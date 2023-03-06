#include <stdio.h>
int main (int argc, char * argv[], char * envp[]) {
  int count;
  printf("Количество аргументов: %d\n", argc);
  for (count=0; count<argc; count++)
    printf("%d: %s\n", count, argv[count]);
  printf("Первые десять элементов переменных окружения:\n");
  for (count = 0; count < 10; count++)
    printf("%d: %s\n", count, envp[count]);
  return 0;
}
