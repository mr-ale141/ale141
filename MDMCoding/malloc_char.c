#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main (void) {
  printf("Сколько слов вы хотите ввести? ");
  int c_words;
  scanf("%d", &c_words);
  char ** pch = NULL;
  pch = (char**) malloc(c_words*sizeof(char*));
  printf("Теперь введите %d слов:\n", c_words);
  for (int i=0; i<c_words; i++) {
    char word[20];
    scanf("%s", word);
    pch[i]=(char*) malloc(strlen(word)*sizeof(char));
    strcpy(pch[i], word);
    printf("|%s|", word);
    printf("*%s*", pch[i]);
    printf("%d\n", strlen(word));
  }
  printf("Вот ваши %d слов:\n", c_words);
  for (int j=0; j<c_words; j++) {
    printf("%p: ", pch[j]);
    printf("%s\n", pch[j]);

  }
  for (int x=0; x<c_words; x++) {
    free(pch[x]);
  }
  free(pch);
  getchar();
  getchar();
  return 0;
}
