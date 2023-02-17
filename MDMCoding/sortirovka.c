#include <stdio.h>
#include <stdlib.h>
int main (void) {
  int r_data[100];
  int x;
  for (int i=0; i<100; i++) {
    r_data[i] = 1+rand()%10;
  }
  for (int i=0; i<100; i++) {
    printf("%2d|", r_data[i]);
    if ((i+1)%5==0) {
      printf("\n");
    }
  }
  printf("\n***********************************************\n");
  for (int i=0; i<100; i++) {
    for (int j=0; j<100; j++) {
      if (r_data[i]<r_data[j]) {
        x = r_data[j];
        r_data[j] = r_data[i];
        r_data[i] = x;
        for (int i=0; i<100; i++) {
          printf("%2d|", r_data[i]);
          if ((i+1)%5==0) {
            printf("\n");
          }
        }
        printf("\n***********************************************\n");
      }
    }
  }
}
