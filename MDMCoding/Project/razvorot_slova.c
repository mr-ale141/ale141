#include <stdio.h>
#include <string.h>
int main(void)
{
  printf("Vvedite slovo: ");
  char slovo[30];
  scanf("%s", slovo);
  int len = strlen(slovo);
  for (int i = len-1; i >= 0; i--)
    printf("%c", slovo[i]);
  return 0;
}
