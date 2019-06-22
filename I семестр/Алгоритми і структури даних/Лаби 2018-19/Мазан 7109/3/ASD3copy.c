#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
int main() {
	int n,i;
	float a,b, R;
	srand(time(NULL));
	printf("Введіть кількість елементів масивів: ");
	scanf("%i", &n);
	printf("Введіть a: ");
	scanf("%f", &a);
	printf("Введіть b: ");
	scanf("%f", &b);
	double Y[n], Z[n];
	R=0;
	printf("Згенерований масив Y: ");
	for (i=0;i<n;++i) {
		Y[i] = (rand() % 2001 - 1000)/(float)(rand()%20+1);
		printf("\nY[%d] = %.3f", i, Y[i]);
	}
	printf("\nМасив Z: ");
	for (i=0;i<n;++i) {
		Z[i] = (Y[i]>-50 && Y[i]<0) ? 10*a-Y[i] : 1 + pow(Y[i],2);
		printf("\nZ[%d] = %.3f", i, Z[i]);
		R += pow(-1,i)*sqrt(10*b+a*Z[i]);
	}
	printf("\nR: %.3f\n",R);
}
