#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define sqr(a) ((a)*(a))
double f(double y, double a, double b) {
return (fabs(y) > a) ? (5.0 - y) : (3.0 * b * y);
}
double g(double z, double a, int i) {
return ((1 - (i & 1)) * 2 - 1) * sqr(sqrt(sqr(z) + sqr(a)) - z);
}
int main(int argc, char **argv) {
double a, b;int n;
double r;
printf("a = ");
scanf("%lf", &a);
printf("b = ");
scanf("%lf", &b);
printf("n = ");
scanf("%d", &n);
double y[n], z[n];
for (int i = 0; i < n; ++i) {
// Обчислити y[i]
y[i] = ((double) rand()) * 200.0 / ((double) RAND_MAX) - 100;
// Обчислити z[i]
z[i] = f(y[i], a, b);
// Додати елемент до суми
r += g(z[i], a, i);
printf("Y[%d] = %.03lf\tZ[%d] = %.03lf\n", i, y[i], i, z[i]);
}
printf("R = %.03lf\n", r);
return 0;
}
