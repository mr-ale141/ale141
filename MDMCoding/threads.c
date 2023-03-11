#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define NUMBER_OF_THREADS 10

void *print_hello_world(void *tid)
{
  printf("Hello World. Threads № %d\n", tid);
  pthread_exit(NULL);
}

int main (void)
{
  pthread_t threads[NUMBER_OF_THREADS];
  int status, i;

  for(i=0; i < NUMBER_OF_THREADS; i++)
  {
    printf("Main program. Create threads № %d\n", i);
    status = pthread_create(&threads[i], NULL, print_hello_world, (void *)i);
    printf("pthread_create № %d status: %d\n", i, status);
    if (status != 0)
    {
      printf("pthread_create with error №: %d\n", status);
      exit(-1);
    }
  }
  exit(NULL);
}
