#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX 41
int main (void) {
  FILE * fp;
  char words[MAX];
  int num=0;
  int flag=0;
  if ((fp = fopen("wordy", "a+"))==NULL) {
    fprintf(stdout, "Не удается открыть файл \"wordy\".\n");
    exit(EXIT_FAILURE);
  }

  if (fscanf(fp, "%d", &flag)!=EOF) {
    fscanf(fp, "%s", words);
    while (fscanf(fp, "%d", &num)!=EOF) {
      fscanf(fp, "%s", words);
      flag=num;
    }
    num=flag;
  }
  printf("%d\n", num);

  puts("Введите слово для добавления в файл; для завершения");
  puts("введите символ # в начале строки:");
  while((fscanf(stdin, "%40s", words)==1) && (words[0]!='#'))
    fprintf(fp,"%d %s\n", num+=1, words);
  puts("Содержимое файла:");
  rewind(fp);                // возврат к началу файла
  flag=0;
  while (fscanf(fp, "%s", words)==1) {
    printf("%s", words);
    flag++;
    if (flag%2==0)
      printf("\n");
    else
      printf(" ");
  }

  puts("Готово!");
  if (fclose(fp) !=0)
    fprintf(stderr, "Ошибка при закрытии файла\n");
  return 0;
}
