#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#define FILE_NAME "data.txt"
#define FILE_NAME_PIX "pixel.txt"
#define ROW 20
#define COL 30
int main (void) {
  FILE * fp;
  FILE * fpix;
  int data[ROW][COL];
  int data1[ROW][COL];
  char pixel[ROW][COL+1];
  char pixel1[ROW][COL+1];
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
    }
  }

  for (int i=0; i<ROW; i++) {
    for (int j=0; j<COL; j++) {
      printf("%d", data[i][j]);
    }
    printf("\n");
  }

  for (int i=0; i<ROW; i++) {
    for (int j=0; j<COL; j++) {
      float sum=0;
      int count=0;
      int flag=0;
      if (j!=0) {
        if (data[i][j-1]!=0) {
          sum+=data[i][j-1];
          count++;
          if (abs(data[i][j]-data[i][j-1])>1) {
            flag=1;
          }
        }
      }

      if (j!=COL-1) {
        if (data[i][j+1]!=0) {
          sum+=data[i][j+1];
          count++;
          if (abs(data[i][j]-data[i][j+1])>1) {
            flag=1;
          }
        }
      }

      if (i!=0) {
        if (data[i-1][j]!=0) {
          sum+=data[i-1][j];
          count++;
          if (abs(data[i][j]-data[i-1][j])>1) {
            flag=1;
          }
        }
      }

      if (i!=ROW-1) {
        if (data[i+1][j]!=0) {
          sum+=data[i+1][j];
          count++;
          if (abs(data[i][j]-data[i+1][j])>1) {
            flag=1;
          }
        }
      }



      if (count!=0 && flag>0)
        data1[i][j]=round(sum/count);
      else
        data1[i][j]=data[i][j];

    }
  }
  printf("\n------------------------------\n\n");
  for (int i=0; i<ROW; i++) {
    for (int j=0; j<COL; j++) {
      printf("%d", data1[i][j]);
    }
    printf("\n");
  }
  printf("\n------------------------------\n\n");
  for (int i=0; i<ROW; i++) {
    for (int j=0; j<COL; j++) {
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

  printf("\n------------------------------\n\n");

  for (int i=0; i<ROW; i++) {
    for (int j=0; j<COL; j++) {
      switch (data1[i][j]) {
        case 0: pixel1[i][j] = ' '; break;
        case 1: pixel1[i][j] = '.'; break;
        case 2: pixel1[i][j] = '\''; break;
        case 3: pixel1[i][j] = ':'; break;
        case 4: pixel1[i][j] = '~'; break;
        case 5: pixel1[i][j] = '*'; break;
        case 6: pixel1[i][j] = '='; break;
        case 7: pixel1[i][j] = '$'; break;
        case 8: pixel1[i][j] = '%'; break;
        case 9: pixel1[i][j] = '#'; break;
      }
    }
    pixel1[i][30] = '\0';
  }

  for (int i=0; i<ROW; i++) {
    printf("%s\n", pixel1[i]);
  }

  return 0;
}
