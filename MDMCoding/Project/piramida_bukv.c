#include <stdio.h>
int main(void)
{
  printf("Vvedite propisnoy simvol: ");
  char ch;
  scanf("%c", &ch);
  int num = ch - 'A';
  for (int i = 0; i <= num; i++)
    {
      for (int probel = num - i; probel >= 0; probel--)
        printf(" ");
      for (int vozr = 0; vozr < i; vozr++)
        printf("%c", 'A' + vozr);
      for (int ubyv = i; ubyv >= 0; ubyv--)
        printf("%c", 'A' + ubyv);
      printf("\n");
    }
  return 0;
}
