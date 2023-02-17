#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

double plus(double x, double y) {
  return x+y;
}

double minus(double x, double y) {
  return x-y;
}

double umnozh(double x, double y) {
  return x*y;
}

double razdeli(double x, double y) {
  return x/y;
}

int main (void) {
  double (*func[4])(double, double)={plus, minus, umnozh, razdeli};

  printf("%.2f\n", func[1](10.0, 2.5));

  printf("%.2f\n", (*func[1])(10.0, 2.5));


  typedef double (*pf)(double, double);
  pf p[4]={plus, minus, umnozh, razdeli};

  printf("%.2f\n", p[1](10.0, 2.5));

  printf("%.2f\n", (*p[1])(10.0, 2.5));



  return 0;
}
