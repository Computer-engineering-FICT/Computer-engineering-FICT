#include <stdio.h>
#include <math.h>

int main() {
	int n,i;
	double S,production;
	S=0;
	production=1;
	printf("\nInput n: ");
        scanf("%i", &n);
	for (i=1;i<=n;++i) {
		production *= i+1;
		S += pow(pow(2,i)+1,2)/production;
		}
	printf("%.7f\n",S);
}
