#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
    int n,count_1,count_2;
    double p,sum;
    count_1=count_2=0;
    sum=0;
    p=1;
    printf("Enter n: ");
    scanf("%d",&n);
    while (n<1){
        printf("Enter another n: ");
        scanf("%d",&n);
    }
    //First program
    for (int i=1;i<=n;i++){
        for (int j=1;j<=i;j++){
            sum+=(4.0*j/3-1);
            count_1+=4;
        }
        p*=sum/(i+sqrt(i));
        sum=0;
        count_1+=4;
    }
    printf("\nAnswer 1: %.7f",p);
    printf("\nCounter 1: %d",count_1);
    //Second Program;
    p=1;
    sum=0;
    for (int i=1;i<=n;i++){
        sum+=(4.0*i/3-1);
        count_2+=4;
        p*=sum/(i+sqrt(i));
        count_2+=4;
    }
    printf("\nAnswer 2: %.7f",p);
    printf("\nCounter 2: %d",count_2);
    return 0;
}
