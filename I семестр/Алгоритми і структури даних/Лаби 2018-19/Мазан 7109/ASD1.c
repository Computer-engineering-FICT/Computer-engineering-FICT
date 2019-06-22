#include <stdio.h>
/* –9x3  + 5x2, x ∈ (2,12] U (22,32) */
/*   – x2  – 12, x ∈ (– ∞, 0] */

int main()
{	
	float x, y;
	printf("Введіть x: ");
	scanf("%f", &x);
	if (x <= 0) {
		y = -1*x*x-12;
		printf ("%6f\n", y);
	}
	if (x>0) {
		if (x>22) {
			if (x<32) {
				y = -9*x*x*x+5*x*x;
				printf ("%6f\n", y);
				}
			else {
				printf ("\nЗначення, які ви ввели, не дозволяють провести обрахунок\n");
			}
				}
		if (x>2) {
			if (x<=12) {
				y = -9*x*x*x+5*x*x;
				printf ("%6f\n", y);
				}
		else {
			printf ("\nЗначення, які ви ввели, не дозволяють провести обрахунок\n");
				}
			}
	}
}
