#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void) {
  time_t tstart = time(NULL);
  int tsec = 0;
  srand(time(NULL));
  int answer = 200;
  int count = 0;
  int err = 0;
  char str[] = "                                             ";
  while (count < answer) {
    time_t tfinish = time(NULL);
    printf("%02dm %02ds ", ((unsigned long)tfinish - (unsigned long)tstart)/60,
          ((unsigned long)tfinish - (unsigned long)tstart)%60);
    printf("ERRORS: %2d ! %3d/%3d OK!   ", err, count, answer);
    int n=0, m=0;
    int A=1, B=10;
    n=A+rand()%(B-A+1);
    m=A+rand()%(B-A+1);
    printf("%2d X %-2d = ", n, m);
    int x=0;
    while (scanf("%d", &x) != 1) {
      printf("%sANSWER IS NOT CORRECT!\n", str);
      printf("                                   %2d X %-2d = ", n, m);
      while (getchar()!='\n') {
        continue;
      }
    }
    while (x!=n*m) {
      err++;
      printf("                         NOT OK!   %2d X %-2d = ", n, m);
      while (scanf("%d", &x) != 1) {
        printf("%sANSWER IS NOT CORRECT!\n", str);
        printf("                                   %2d X %-2d = ", n, m);
        while (getchar()!='\n') {
          continue;
        }
      }
    }

    count++;
  }
  while (getchar()!='\n') {
    continue;
  }
  long int tfinish = time(NULL);
  printf("%02dm %02ds ", ((unsigned long)tfinish - (unsigned long)tstart)/60,
        ((unsigned long)tfinish - (unsigned long)tstart)%60);
  printf("ERRORS: %2d ! %3d/%3d OK!\n", err, count, answer);
  printf("Press \"ENTER\" to exit\n");
  getchar();
  return 0;
}
