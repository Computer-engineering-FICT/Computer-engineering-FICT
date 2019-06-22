#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

int main()
{
    float a,b;
    double r;
    int n;

    printf("Enter a: ");
    scanf("%f", &a);
    printf("Enter b: ");
    scanf("%f", &b);
    printf("Enter n: ");
    scanf("%d", &n);

    srand(time(NULL));

    int y[n];
    double z[n];

    for(int i=0;i<n;i++){
        y[i]=rand()%11-5;
        printf("%d ",y[i]);
    }

    printf("\n");

    for(int i=0;i<n;i++){
        if (abs(y[i])<=2)
            z[i]=a*y[i]*y[i];
        else
            z[i]=0.5*b*y[i];
        printf("%.3f ",z[i]);
    }

    printf("\n");

    r=1;
    for(int i=0;i<n;i++){
        if (i%2==0)
            r*=((a+z[i]*z[i])/(2+b*b));
        else
            r*=(-1)*((a+z[i]*z[i])/(2+b*b));
    }

    printf("Result = %.3f",r);

    return 0;
}
