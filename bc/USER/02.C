#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>

#define PI 3.14

main()
{
  int R;
  float S1, S2;
  clrscr();
  textcolor(15);
  cputs("�ணࠬ�� ��� ���� ���頤� ��㣠");
  cprintf("M_PI = %f\n", M_PI);
  cprintf("PI   = %f\n", PI);
  textcolor(2);
  cprintf("������ ࠤ���: ");
  textcolor(12);
  cscanf("%d", &R);
  S1 = M_PI * R * R;
  S2 = PI * R * R;
  textcolor(2);
  cprintf("���頤� ��㣠 (M-PI from <*.h>) �� ࠤ��� %d = %0.2f\n", R, S1);
  textcolor(10);
  cprintf("���頤� ��㣠 (PI=3.14)         �� ࠤ��� %d = %0.2f\n", R, S2);
  textcolor(7);
  getch();
}