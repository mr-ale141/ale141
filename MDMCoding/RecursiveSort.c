#include<stdio.h>
#include<string.h>

void Merge(char *str_out, char *str1, char *str2)
{
  int i1 = 0;
  int i2 = 0;
  int iout = 0;
  char ch_hold;
  while (str1[i1 + 1] != '\0' || str2[i2 + 1] != '\0')
  {
    while (str1[i1 + 1] != '\0' && str2[i2 + 1] != '\0')
    {
      if (str1[i1] < str2[i2])
      {
        str_out[iout] = str1[i1];
        iout++;
        i1++;
      }
      else
      {
        str_out[iout] = str2[i2];
        iout++;
        i2++;
      }
    }
    if (str1[i1 + 1] != '\0' && str2[i2 + 1] == '\0')
    {
      if (str1[i1] <= str2[i2])
      {
        str_out[iout] = str1[i1];
        iout++;
        i1++;
      }
      else
      {
        ch_hold = str1[i1];
        str1[i1] = str2[i2];
        str2[i2] = ch_hold;
      }
    }
    if (str2[i2 + 1] != '\0' && str1[i1 + 1] == '\0')
    {
      if (str2[i2] <= str1[i1])
      {
        str_out[iout] = str2[i2];
        iout++;
        i2++;
      }
      else
      {
        ch_hold = str1[i1];
        str1[i1] = str2[i2];
        str2[i2] = ch_hold;
      }
    }
  }
  if (str1[i1] < str2[i2])
  {
    str_out[iout] = str1[i1];
    iout++;
    str_out[iout] = str2[i2];
  } else
  {
    str_out[iout] = str2[i2];
    iout++;
    str_out[iout] = str1[i1];
  }
}

void Split(const char *str_in, char *str1, char *str2)
{
  int i;
  int len_str_in = strlen(str_in);
  for (i = 0; i < len_str_in; i++)
  {
    if (i % 2 == 0)
    {
      str1[i / 2] = str_in[i];
    } 
    else
    {
      str2[i / 2] = str_in[i];
    }
  }
  if (len_str_in % 2 == 0)
  {
    str1[len_str_in / 2] = '\0';
    str2[len_str_in / 2] = '\0';
  } 
  else
  {
    str1[len_str_in / 2 + 1] = '\0';
    str2[len_str_in / 2] = '\0';
  }
}

void RecurciveSort(char *str_in)
{
  char str1[100];
  char str2[100];
  if (str_in[1] != '\0' && str_in[0] != '\0')
  {
    Split(str_in, str1, str2);
    RecurciveSort(str1);
    RecurciveSort(str2);
    Merge(str_in, str1, str2);
  }
}

int main(void)
{
  char str[100];
  int i = 0;
  printf("Insert string for sort: ");
  while ((str[i] = getchar()) != '\n')
  {
    i++;
  }
  str[i] = '\0';
  RecurciveSort(str);
  printf("%s\n", str);
}