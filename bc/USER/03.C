#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

#define PI 3.14

main()
  {
    int R;
    float S;
    clrscr();
    puts("�ணࠬ�� ��� ���᫥��� ���頤� ��㣠");

Metka:
    printf("\n������ ࠤ���: ");
    if (scanf("%d", &R) < 1) exit(0);
    if (R == 0) exit(0);
    if (R < 0)
      {
	puts("������ �� ����� ���� ����� ���!");
	goto Metka;
      }
    S = PI * R * R;
    printf("���頤� ��㣠 � ࠤ��ᮬ %d ࠢ�� %.2f\n", R, S);
    goto Metka;
  }
