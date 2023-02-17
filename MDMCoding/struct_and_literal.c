#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int main (void) {
typedef struct lens {
  float foclen;
  float fstop;
  char brand[30];
} LENS;

LENS Lens[10] = { [2]={500, 2, "Remarkatar"} } /*or*/ /*= {
  {},
  {},
  {500.0,2.0,"Remarkatar"}
}*/;


/*
Lens[2] = (LENS) {
  .brand="Remarkatar",
  .fstop=2.0,
  .foclen=500.0
};
*/



/*
Lens[2].foclen = 500.0;
Lens[2].fstop = 2.0;
strcpy(Lens[2].brand, "Remarkatar");
*/

printf("%.1f\n", Lens[2].foclen);
printf("%.1f\n", Lens[2].fstop);
printf("%s\n", Lens[2].brand);


  return 0;
}
