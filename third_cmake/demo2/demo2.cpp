#include <stdio.h>
#include <stdlib.h>
#include "config.h"

#ifdef USE_MYMATH
  #include <mysqrt.h>
#else
  #include <math.h>
#endif

int main (int argc, char *argv[]) {
  if (argc < 2){
    fprintf(stdout,"Usage: %s number\n",argv[0]);
    return 1;
  }

  double inputValue = atof(argv[1]);

#ifdef USE_MYMATH
  printf("use my vsqrt\n");
  double outputValue = mysqrt(inputValue);
#else
  printf("use math sqrt\n");
  double outputValue = sqrt(inputValue);
#endif
  fprintf(stdout,"The square root of %g is %g\n",
            inputValue, outputValue);
  return 0;
}