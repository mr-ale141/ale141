#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

#define PI 3.14

main()
  {
    int R; float S; char A;
    clrscr();
    puts("�ணࠬ�� ��� ���᫥��� ���頤� ��㣠");
Metka:
    printf("\n������ ࠤ���: ");
    if (!scanf("%d", &R)) exit(0);
    if (R < 0)
      {
	puts("������ �� ����� ���� ����� ���!");
	goto Metka;
      }
    S = PI * R * R;
    printf("���頤� ��㣠 � ࠤ��ᮬ %d ࠢ�� %.2f\n", R, S);
Klav:
    printf("\n������ ��� �த������� ENTER ��� ��室� ESC.");
    A = getch();
    switch(A)
      {
       case 13: goto Metka;
       case 27: exit(0);
       default: puts("�� � ������!"); goto Klav;
      }
  }