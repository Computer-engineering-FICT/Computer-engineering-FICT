#include <stdio.h>

int main()
{

#ifdef __GCC_EMULATION_MODE
  printf("nothing to do beaucse in GCC emulation mode\n");
  exit(0);
#else

  float t1, t2, t3, t4, t5;

  t1 = 2.0 * 3.6;    // should be  7.2
  t2 = t1 + 12.8;    // should be 20.0
  t3 = t2 / 4.0;     // should be  5.0
  t4 = t3 - 1.0;     // should be  4.0
  t5 = sqrt(t4);     // should be  2.0

  printf("computed result = %f\n", t5);

  printf("expected result = %f\n", 2.0);

  return 0;

#endif

}
