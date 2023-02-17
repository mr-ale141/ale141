#include <stdio.h>
void up_and_down(int n) {
  printf("Uroven %d: yachejki n %p\n", n, &n );
  if (n<4) {
    up_and_down(n+1);
  }
  printf("UROVEN %d: yachejki n %p\n", n, &n );
}
int main(void) {
  up_and_down(1);
  return 0;
}
