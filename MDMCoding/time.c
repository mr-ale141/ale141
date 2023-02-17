#include <stdio.h>
#include <time.h>
int main (void) {
  time_t ttime;
  ttime=time(NULL);
  while (1) {
    if (time(NULL)-ttime>=1) {
      printf("%s\n", ctime(&ttime));
      ttime=time(NULL);
    }
  }
  return 0;
}
