  //�ਬ�� 1
                        //������祭�� ������⥪:
#include <stdlib.h>          //�⠭���⭠� ������⥪� 
#include <stdio.h>           //�⠭����� ����-�뢮�
#include <conio.h>           //���᮫�� ����-�뢮�
#include <math.h>            //��⥬���᪨� �㭪樨

main()
 {
   int X = 49;           //��६����� "X" (��� 楫�� �ᥫ)
			 //  ����砥� ��砫쭮� ���祭�� "49"
   float Y;              //��६����� "Y" (��� ��砫쭮�� ���祭��)

   clrscr();             //���⪠ ��࠭�

   Y = sqrt(X);          //� ��६����� "Y" ����頥��� ������� ��७� �� "X"
   printf ( "��७� �� %2d ࠢ�� %7.2f", X,Y );
                         //�����:   1) ⥪�� "��७� �� ", 
                         //          2) �᫮ �� "�" (楫��, ���� 2 ����樨),
		         //          3) ⥪�� " ࠢ�� ", 
                         //          4) �᫮ �� "Y" (����⢥����, 2 �஡��)

  getch();               //�������� ��� ������ (��㧠)
}

