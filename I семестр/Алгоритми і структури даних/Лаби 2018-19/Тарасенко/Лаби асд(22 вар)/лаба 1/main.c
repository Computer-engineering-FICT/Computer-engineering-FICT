#include <stdio.h>
#include <conio.h>
#include <locale.h>

int main()
{
    float x, y;
    setlocale(LC_ALL, "ukr");
    printf("���i��� 22. ���� �������� ����� ������� ������������ �������� ��i��� x i �������� �� ����� �i����i��� �������� y(x).\n������i�� ����-��� ����i�� ��� �������.");
    getch();
    do
    {
        system("cls");
        printf("���� ����� ����i�� ��i��� x i ������i�� 'Enter':\nx=");
        if(!(scanf("%f", &x)))                          /*��������, �� � ������� �������� ������*/
        {
            printf("�� ����� ������. ���� ����� ������i�� ����-��� ����i�� � ��������� �����.");
            getch();
            x=0;
            fflush(stdin);
        }
    }
    while(!x);

    if((0<x)&&(x<=5))
    {
        y=x*x*x-5*x*x;
        printf("y=%.2f", y);
    }
    if(((-32<=x)&&(x<-20))||(x>10))
    {
        y=x*x-3;
        printf("y=%.2f", y);
    }
    if((!((0<x)&&(x<=5)))&&(!(((-32<=x)&&(x<-20))||(x>10)))) printf("��� �������� �������� x �����i� y(x) �� i���.");
    getch();
    printf("\n�������� ���i��� ���������.");
}

