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
    fprintf(stdout, "�� 㤠���� ������ 䠩� \"wordy\".\n");
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

  puts("������ ᫮�� ��� ���������� � 䠩�; ��� �����襭��");
  puts("������ ᨬ��� # � ��砫� ��ப�:");
  while((fscanf(stdin, "%40s", words)==1) && (words[0]!='#'))
    fprintf(fp,"%d %s\n", num+=1, words);
  puts("����ন��� 䠩��:");
  rewind(fp);                // ������ � ��砫� 䠩��
  flag=0;
  while (fscanf(fp, "%s", words)==1) {
    printf("%s", words);
    flag++;
    if (flag%2==0)
      printf("\n");
    else
      printf(" ");
  }

  puts("��⮢�!");
  if (fclose(fp) !=0)
    fprintf(stderr, "�訡�� �� �����⨨ 䠩��\n");
  return 0;
}
