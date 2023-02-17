//#include <stdlib.h>
#include <stdio.h>
#include <string.h>
//#include <conio.h>

int main()
{
  int y = 0;
  int x = 255;
  int z = 15;
  char *str= "Hello World\n";
  int len = strlen(str);
  int ret = 0;

  asm
  (
    "mov eax, 10; \n"
    "mov %0, eax; \n"
    : "=m"(y)
  );
  printf("%d\n", y);
  
  asm
  (
    "mov eax, 5;" \
    "add ecx, eax;" \
    "mov %0, ecx;" \
    : "=m" (z)
    :"c" (x)
    :"memory"
  );
  printf("%d\n", z);

  return 0;
} 