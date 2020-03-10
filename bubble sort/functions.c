#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <sys/time.h>
#include <time.h>
#include <limits.h>
#include "functions.h"

#define RAND_MAX INT_MAX;

double timestamp(void)
{
    struct timeval tp;
    gettimeofday(&tp, NULL);
    return((double)(tp.tv_sec*1000.0 + tp.tv_usec/1000.0));
}; //FINALIZADO


vector_t* allocate_vector(size_t size)
{
    vector_t *V = (vector_t *) malloc (size * sizeof(vector_t));
    return V;
}; //FINALIZADO


void init_vector(vector_t *V1, vector_t *V2, size_t size)
{
    size_t i;
    vector_t x;

    srand(time(NULL));

    for (i = 0; i < size; ++i)
    {
        x = ((vector_t) rand() * 1000) / ( vector_t ) RAND_MAX;
        V1[i] = x;
        V2[i] = x;

        printf("n = %.5g\n", x);
        //printf("n = %d\n", x);
    }
}

 
  

void bubbleSort(vector_t *V, size_t size)
{  
    size_t i, j;
    vector_t temp;

    for (i = 0; i < size-1; ++i)
        for (j = 0; j < size-i-1; ++j)
            if (V[j] > V[j+1])
            {
                temp = V[j];
                V[j] = V[j+1];
                V[j+1] = temp;
            }
}; //TESTAR