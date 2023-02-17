#include <stdio.h>
#include <stdbool.h>
char GetCode(char Ch);
char GetAlpha(char Ch);
void GetCodeStr(unsigned int x, char * str);
void GetTextStr(unsigned int x, char * str);
unsigned int ExpMod(unsigned int x, unsigned int e, unsigned int n);
int main (void) {
  char str[100];
  char CodeStr[4];
  char TextStr[3];
  bool text;
  int i=0;
  int simbol;
  printf("Введите текст или нажмите \"ENTER\", если дешифруем:\n");
  str[0] = getchar();
  if (str[0]=='\n') {
    text = false;
    str[0]='\0';
    printf("Введите шифр (длинна кратна 3):\n");
    while ((str[i] = getchar())!='\n') {
      i++;
    }
    str[i] = '\0';
  } else {
    text = true;
    i=1;
    while ((str[i] = getchar())!='\n') {
      i++;
    }
    str[i] = '\0';
  }
  if (text==true) {
    unsigned int n=0;
    unsigned int e=0;
    unsigned int x=0;
    printf("Введите открытый ключ \"n e\":\n");
    scanf("%u %u", &n, &e);
    while (getchar()!='\n') {
      continue;
    }
    printf("Шифр:\n");
    for (simbol=0; simbol<i; simbol++) {
      if ((simbol+1)%2!=0) {
        x = x + 37 * (unsigned int) GetCode(str[simbol]);
        if (str[simbol+1]=='\0') {
          str[simbol+1]=' ';
          str[simbol+2]='\0';
          i++;
        }
      } else {
        x = x + (unsigned int) GetCode(str[simbol]);
        x = ExpMod(x, e, n);
        GetCodeStr(x, CodeStr);
        printf("%s", CodeStr);
        x=0;
      }
    }
  } else {
    unsigned int n=0;
    unsigned int d=0;
    unsigned int x=0;
    printf("Введите закрытый ключ \"n d\":\n");
    scanf("%u %u", &n, &d);
    while (getchar()!='\n') {
      continue;
    }
    printf("Текст:\n");
    for (simbol=0; simbol<i; simbol++) {
      if ((simbol+1)%3==1) {
        x = x + 37 * 37 * (unsigned int) GetCode(str[simbol]);
        if (str[simbol+1]=='\0') {
          printf("\nОшибка: Шифр не кратен 3!\n");
          return 0;
        }
      } else if ((simbol+1)%3==2) {
        x = x + 37 * (unsigned int) GetCode(str[simbol]);
        if (str[simbol+1]=='\0') {
          printf("\nОшибка: Шифр не кратен 3!\n");
          return 0;
        }
      } else {
        x = x + (unsigned int) GetCode(str[simbol]);
        x = ExpMod(x, d, n);
        GetTextStr(x, TextStr);
        printf("%s", TextStr);
        x=0;
      }
    }
  }
  return 0;
}
void GetCodeStr(unsigned int x, char * str) {
  str[2] = GetAlpha(x%37);
  str[1] = GetAlpha(((x-(unsigned int)GetCode(str[2]))/37)%37);
  str[0] = GetAlpha(((x-(unsigned int)GetCode(str[2])-
            37*(unsigned int)GetCode(str[1]))/(37*37))%37);
  str[3] = '\0';
}
void GetTextStr(unsigned int x, char * str) {
  str[1] = GetAlpha (x%37);
  str[0] = GetAlpha(((x-(unsigned int)GetCode(str[2]))/37)%37);
  str[2]='\0';
}
unsigned int ExpMod(unsigned int x, unsigned int e, unsigned int n) {
    unsigned int result = 1;
    while (e > 0)
    {
        while ((e & 1) == 0)
        {
            e = e / 2;
            x = (x * x)%n;
        }
        e--;
        result = (result * x)%n;
    }
    return result;
}
char GetAlpha(char Ch) {
  if (Ch>=0 && Ch<=5) {
    return Ch+128;
  } else if (Ch == 6) {
    return 'Ё';
  } else if (Ch>=7 && Ch<=32) {
    return Ch+127;
  }  else if (Ch==33) {
    return ' ';
  }  else if (Ch==34) {
    return '.';
  }  else if (Ch==35) {
    return ',';
  }  else if (Ch==36) {
    return '!';
  }  else {
    return Ch;
  }
}
char GetCode(char Ch) {
  if (Ch>='А' && Ch<='Е') {
    return Ch-128;
  } else if (Ch == 'Ё') {
    return 6;
  } else if (Ch>='Ж' && Ch<='Я') {
    return Ch-127;
  }  else if (Ch==' ') {
    return 33;
  }  else if (Ch=='.') {
    return 34;
  }  else if (Ch==',') {
    return 35;
  }  else if (Ch=='!') {
    return 36;
  }  else {
    return Ch;
  }
}
