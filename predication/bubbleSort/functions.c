#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <sys/time.h>
#include <time.h>
#include <limits.h>
#include "lfsr.h"
#include "functions.h"



double timestamp(void)
{
    struct timeval tp;
    gettimeofday(&tp, NULL);
    return((double)(tp.tv_sec*1000.0 + tp.tv_usec/1000.0));
}; //FINALIZADO


vector_t* allocate_vector(vector_s size)
{
    vector_t *V = (vector_t *)malloc(size * sizeof(vector_t));
    return V;
}; //FINALIZADO


void init_vector(vector_t *V, vector_s size)
{
    vector_s i;
    int random_value;

    init_lfsrs();
    for (i = 0; i < size; ++i)
    {
        random_value = get_random(); // a value between 0 and 65535 (0xffff) is returned
        V[i] = random_value;
    }
}; //FINALIZADO


void bubbleSort(vector_t *V, vector_s size)
{  
    vector_s i, j;
    vector_t temp;

    for (i = 0; i < size-1; ++i)
        for (j = 0; j < size-i-1; ++j)
            if (V[j] > V[j+1])
            {
                temp = V[j];
                V[j] = V[j+1];
                V[j+1] = temp;
            }
}; //FINALIZADO


void bubbleSort_pred(vector_t *V, vector_s size)
{  
    vector_s i, j;
    vector_t temp;

    for (i = 0; i < size-1; ++i)
        for (j = 0; j < size-i-1; ++j)
            if (V[j] > V[j+1])
            {
                temp = V[j];
                V[j] = V[j+1];
                V[j+1] = temp;
            }
}; //FAZER


void print_vector(vector_t *V, vector_s size)
{
    vector_s i;

    for (i = 0; i < size; ++i)
    {
        printf("%d, ", V[i]);
    }
    printf("\n");
}; //FINALIZADO