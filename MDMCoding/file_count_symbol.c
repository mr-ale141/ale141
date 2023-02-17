#include <stdio.h>
#include <stdlib.h>
int main (int argc, char * argv[]) {
  char ch;
  char buf_name[10][20];
  char * fname[10];
  FILE * fp;
  int cfname=0;
  if (argc==2) {
    ch = *argv[1];
    printf("Введите имя файла для поиска (\"0\" для завершения): ");
    scanf("%s", buf_name[cfname]);
    while (buf_name[cfname][0]!='0') {
      fname[cfname]=buf_name[cfname];
      cfname++;
      if (cfname==10)
        break;
      printf("Можно ввести еще %d файлов (\"0\" для завершения): ", 10-cfname);
      scanf("%s", buf_name[cfname]);
    }
  } else if (argc>2) {
    ch = *argv[1];
    for (int i=2; i<argc; i++) {
      fname[i-2]=argv[i];
      cfname++;
    }
  } else if (argc==1) {
    printf("Введите символ для подсчета: ");
    scanf("%c", &ch);
    getchar();
    printf("Введите имя файла для поиска (\"0\" для завершения): ");
    scanf("%s", buf_name[cfname]);
    while (buf_name[cfname][0]!='0') {
      fname[cfname]=buf_name[cfname];
      cfname++;
      if (cfname==10)
        break;
      printf("Можно ввести еще %d файлов (\"0\" для завершения): ", 10-cfname);
      scanf("%s", buf_name[cfname]);
    }
  }
  if (buf_name[0][0]=='0')
    return 0;

  printf("ch = '%c'; cfname = %d\n", ch, cfname);

  for (int i=0; i<cfname; i++) {
    printf("[%d] = %s\n", i, fname[i]);
  }


  for (int i=0; i<cfname; i++) {
    char fch;
    unsigned long int count=0;
    int countCH=0;
    if ((fp=fopen(fname[i], "r"))==NULL) {
      printf("Не удается открыть %s\n", fname[i]);
      continue;
    }
    while ((fch=fgetc(fp))!=EOF) {
      count++;
      if (fch == ch)
        countCH++;
    }
    if (ferror(fp))
      printf("Произошла ошибка чтения.\n");
    if (fclose(fp)!=0) {
      printf("Ошибка при закрытии файла %s\n", fname[i]);
    }
    printf("Из файла %s прочитано - %lu символов.\n", fname[i], count);
    printf("Он содержит символ '%c' - %d раз(а).\n", ch, countCH);
  }

  return 0;
}
