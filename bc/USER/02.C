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
  textcolor(3);
  cputs("�ணࠬ�� ��� ���� ���頤� ��㣠\n\r");
  textcolor(4);
  textbackground(3);
  cprintf(" M_PI = %f \n\r", M_PI);
  cprintf(" PI   = %f \n\r", PI);
  textbackground(0);
  textcolor(9);
  cprintf("������ ࠤ���: ");
  textcolor(8);
  cscanf("%d", &R);
  S1 = M_PI * R * R;
  S2 = PI * R * R;
  textcolor(9);
  cprintf("���頤� ��㣠 (M-PI from <*.h>) �� ࠤ��� ");
  textcolor(5);
  cprintf("%d = %0.2f\n\r", R, S1);
  textcolor(8);
  cprintf("���頤� ��㣠 (PI = 3.14)       �� ࠤ��� ");
  textcolor(10);
  cprintf("%d = %0.2f\n\r", R, S2);
  textcolor(7);
  getchar();
}