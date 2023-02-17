#include <stdio.h>

int main(void) {
  char string[255];
  char ch;
  int count = 0;
  printf("Vvedite striku:\n");
  scanf("%c", &ch);
  for (int i = 0; ch != '\n'; i++) {
    string[i] = ch;
    count = i;
    scanf("%c", &ch);
  }
  for (int i = count; i >= 0; i--) {
    printf("%c", string[i]);
  }
  return 0;
}
