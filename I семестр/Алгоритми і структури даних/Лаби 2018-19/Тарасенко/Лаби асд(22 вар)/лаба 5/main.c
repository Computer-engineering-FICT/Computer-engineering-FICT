#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <locale.h>

int main()
{
    setlocale(LC_ALL, "rus");
    short n,m,half,x1,y1;
    bool flag,flag1;
    float a[7][7];
    n=m=7;
    for(int i=0;i<n;i++){
        for (int j=0; j<m;j++){
            scanf("%f",&a[i][j]);
        }
    }
    printf("\n");
    for (int k=0;k<n;k++){
        for (int j=0;j<m;j++){
            printf("%.1f ", a[k][j]);
        }
        printf("\n");
    }
    printf("\n");
    flag=true;
    half=3;
    x1=-1;
    y1=-1;
    flag1=false;
    while (flag){
        if ((half>=m) || (half<0)){
            break;
            x1=-1;
        }
        if (flag1){
            if (a[0][half] > 5)
                flag=false;
            else
                if ((a[0][half] < 5) && (a[0][half] > 0)){
                    x1=1;
                    y1=half+1;
                    half--;
                }
        }
        else{
            if (a[0][half] < 0){
                half--;
            }
            else
                if (a[0][half] > 5){
                    half++;
                }
                else{
                    x1=1;
                    y1=half+1;
                    half--;
                    flag1=true;
                }
        }
    }
    if (x1>=0)
        printf("coord 1 = (%d;%d);\n", x1, y1);
    else
        printf("Такого числа не существует\n");
    flag=true;
    for(int i=0;i<n;i++){
        if (a[i][m-1]<=5 && a[i][m-1]>=0){
            printf("coord 2 = (%d;%d);", i+1,m);
            flag=false;
            break;
        }
    }
    if (flag)
        printf("Такого числа не существует");
    return 0;
}
