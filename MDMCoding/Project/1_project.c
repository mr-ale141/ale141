#include <stdio.h>
double SrGarm1(double x, double y) {
  return ((x+y)/2);
  }
double SrGarm2(double x, double y) {
  return (2/(1/x+1/y));
}
int main(void) {
  printf("%.12f\n", SrGarm1(12.0, 26.0));
  printf("%.12f\n", SrGarm2(12.0, 26.0));
  return 0;
}
