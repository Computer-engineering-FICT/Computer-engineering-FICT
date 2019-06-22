#include <stdio.h>
#include <locale.h>

int main()
{
    float x;
    setlocale(LC_ALL, "ukr");
    printf("Варiант 22. Дана програма зчитує введене користувачем значення змiнної x i виводить на екран вiдповiдне значення y(x).\nБудь ласка введiть змiнну x i натиснiть 'Enter':\nx=");
    scanf("%f", &x);

    if(0<x)
    {
        if(x<=5) printf("y=%.2f", x*x*x-5*x*x);
        if(5<x) if(x<=10) printf("Для заданого значення x функцiя y(x) не iснує.");
        if(x>10) printf("y=%.2f", x*x-3);
    }
    if(x<=0)
    {
        if(-32<=x) if(x<-20) printf("y=%.2f", x*x-3);
                   else  printf("Для заданого значення x функцiя y(x) не iснує.");
        if(x<-32) printf("Для заданого значення x функцiя y(x) не iснує.");
    }
    printf("\nПрограма успiшно завершена.");
}
