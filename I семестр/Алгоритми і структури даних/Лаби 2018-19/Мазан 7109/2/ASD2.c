#include <stdio.h>
#include <math.h>

int main() {
	int i,j,n;
	double S,cyclej;
	printf("Input n: ");
	scanf("%i", &n);
	S = 0;
	for (i=1; i<=n; ++i) {
		cyclej=1;
		for (j=1; j<=i; ++j) {
			cyclej *= j+1;
			}
		S += pow((pow(2,i)+1),2)/cyclej;
	}
	printf("%.7f\n",S);
}
