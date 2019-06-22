#include <stdio.h>
#include <math.h>

int main() {
	int array[10][10] = {
		{-2,-6,26,16,77,1,-4,5,5},
		{3,6,5,7,17,1,-4,-88,2},
		{7,22,-3,-77,64,-7,4,3,2},
		{6,6,2,99,3,-17,18,9,9},
		{-10,7,17,58,9,8,-4,17,18},
		{-45,2,22,27,-6,8,-87,13,6},
		{-78,1,15,6,5,5,-77,6,3},
		{-6,2,28,99,2,-44,-90,13,18},
		{-6,17,8,5,-9,6,13,-8,19},
	};
	int i,j,D,replacement;
	printf("Матриця до сортування:\n");
	for (i=0;i<9;++i) {
		for (j=0;j<9;++j) {
			printf("%i\t",array[i][j]);
		}
		printf("%s","\n");
	}
	for (D=10/2;D!=0;D=floor(D/2)) {
		for (i=0;i<9-D;++i) {
			if (array[i][i] > array[i+D][i+D]) {
				replacement = array[i][i];
				array[i][i] = array[i+D][i+D];
				array[i+D][i+D] = replacement;
			}
		}
	}

	printf("Матриця після сортування\n");
	for (i=0;i<9;++i) {
		for (j=0;j<9;++j) {
			printf("%i\t",array[i][j]);
		}
		printf("%s","\n");
	}				
}
