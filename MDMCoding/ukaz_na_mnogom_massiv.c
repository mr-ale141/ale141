#include <stdio.h>
void PrintMassive(int n, int m, int (*pz)[m]){
  for (int i=0; i<n; i++) {
    for (int j=0; j<m; j++) {
      printf("%d ", pz[i][j]);
    }
    printf("\n");
  }
}

int main(void) {
  int zippo[4][2] = {{2,4},{6,8},{1,3},{5,7}};
  int n=4, m=2;
  PrintMassive(n, m, zippo);
  return 0;
}
