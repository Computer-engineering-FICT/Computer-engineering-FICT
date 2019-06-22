#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <unistd.h>
#include <locale.h>

void gotoxy(int x, int y)
{
    COORD coord;
    coord.X = x;
    coord.Y = y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
}

int main()
{
    char a;
    short x1,y1,x2,y2,flag;
    x1=0;
    x2=80;
    y1=11;
    y2=12;
    flag=0;
    setlocale(LC_ALL, "rus");
    printf("Введите символ: ");
    scanf("%c",&a);
    system("cls");
    while (flag==0){
        if (x1==0)
            for (int i=0;i<81;i++){
                gotoxy(x1,y1);
                usleep(50000);
                x1+=1;
                printf("%c",a);
                gotoxy(x2,y2);
                x2-=1;
                printf("%c",a);
            }
        else{
            for (int i=0;i<81;i++){
                usleep(50000);
                x1-=1;
                gotoxy(x1,y1);
                printf("%c",a);
                x2+=1;
                gotoxy(x2,y2);
                printf("%c",a);
            }
        }
        if (y1!=0){
            y1-=1;
            y2+=1;
        }
        else
            flag=1;
    }
    return 0;
}
