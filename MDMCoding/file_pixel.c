#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define FILE_NAME "data.txt"
#define FILE_NAME_PIX "pixel.txt"
#define ROW 20
#define COL 30
int main (void) {
  FILE * fp;
  FILE * fpix;
  int data[ROW][COL];
  char pixel[ROW][COL+1];
  if ((fp=fopen(FILE_NAME, "r"))==NULL) {
    printf("Не удается открыть %s\n", FILE_NAME);
    exit(EXIT_FAILURE);
  }
  if ((fpix=fopen(FILE_NAME_PIX, "w+"))==NULL) {
    printf("Не удается открыть %s\n", FILE_NAME_PIX);
    exit(EXIT_FAILURE);
  }
  for (int i=0; i<ROW; i++) {
    for (int j=0; j<COL; j++) {
      fscanf(fp, "%d", &data[i][j]);
      printf("%d", data[i][j]);
    }
    printf("\n");
  }

  for (int i=0; i<ROW; i++) {
    for (int j=0; j<COL; j++) {
      switch (data[i][j]) {
        case 0: fprintf(fpix, " "); break;
        case 1: fprintf(fpix, "."); break;
        case 2: fprintf(fpix, "'"); break;
        case 3: fprintf(fpix, ":"); break;
        case 4: fprintf(fpix, "~"); break;
        case 5: fprintf(fpix, "*"); break;
        case 6: fprintf(fpix, "="); break;
        case 7: fprintf(fpix, "$"); break;
        case 8: fprintf(fpix, "%%"); break;
        case 9: fprintf(fpix, "#"); break;
      }
    }
    fprintf(fpix, "\n");
  }

  printf("\n------------------------------\n\n");

  for (int i=0; i<ROW; i++) {
    for (int j=0; j<COL; j++) {
      switch (data[i][j]) {
        case 0: pixel[i][j] = ' '; break;
        case 1: pixel[i][j] = '.'; break;
        case 2: pixel[i][j] = '\''; break;
        case 3: pixel[i][j] = ':'; break;
        case 4: pixel[i][j] = '~'; break;
        case 5: pixel[i][j] = '*'; break;
        case 6: pixel[i][j] = '='; break;
        case 7: pixel[i][j] = '$'; break;
        case 8: pixel[i][j] = '%'; break;
        case 9: pixel[i][j] = '#'; break;
      }
    }
    pixel[i][30] = '\0';
  }

  for (int i=0; i<ROW; i++) {
    printf("%s\n", pixel[i]);
  }


  return 0;
}
