#include <stdio.h>
#include <locale.h>

int main()
{
    float x;
    setlocale(LC_ALL, "ukr");
    printf("���i��� 22. ���� �������� ����� ������� ������������ �������� ��i��� x i �������� �� ����� �i����i��� �������� y(x).\n���� ����� ����i�� ��i��� x i ������i�� 'Enter':\nx=");
    scanf("%f", &x);

    if(0<x)
    {
        if(x<=5) printf("y=%.2f", x*x*x-5*x*x);
        if(5<x) if(x<=10) printf("��� �������� �������� x �����i� y(x) �� i���.");
        if(x>10) printf("y=%.2f", x*x-3);
    }
    if(x<=0)
    {
        if(-32<=x) if(x<-20) printf("y=%.2f", x*x-3);
                   else  printf("��� �������� �������� x �����i� y(x) �� i���.");
        if(x<-32) printf("��� �������� �������� x �����i� y(x) �� i���.");
    }
    printf("\n�������� ���i��� ���������.");
}
