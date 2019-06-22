#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int main() {
	int n,i;
	float a,b, *Y, *Z, R;
	printf("Введіть кількість елементів масивів: ");
	scanf("%i", &n);
	printf("Введіть a: ");
	scanf("%f", &a);
	printf("Введіть b: ");
	scanf("%f", &a);
	Y = (float*)malloc(n*sizeof(float));
	Z = (float*)malloc(n*sizeof(float));
	R=0;
	printf("Згенерований масив Y: ");
	for (i=0;i<n;++i) {
		Y[i] = (rand() % 2001 - 1000)/(float)(rand()%20+1);
		printf("%.3f ", Y[i]);
	}
	printf("\nМасив Z: ");
	for (i=0;i<n;++i) {
		if (Y[i]>-50 && Y[i]<0) {
			Z[i] = 10*a-Y[i];
			printf("%.3f ", Z[i]);
			R += pow(-1,i)*sqrt(10*b+a*Z[i]*Z[i]);
		}
		else if (Y[i]<=-50 || Y[i]>=0) {
			Z[i] = 1 + Y[i]*Y[i];
			R += pow(-1,i)*sqrt(10*b+a*Z[i]*Z[i]);
		}
	}
	printf("%.3f",R);
}
