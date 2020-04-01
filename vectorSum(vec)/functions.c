#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <sys/time.h>
#include <time.h>
#include <limits.h>
#include <immintrin.h>
#include <x86intrin.h>
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
    vector_t *V = (vector_t *)aligned_alloc(ALIGNMENT, size * sizeof(vector_t));
    return V;
}; //TESTAR, nova função aligned_alloc em vez de malloc


void init_vector(vector_t *V, vector_s size)
{
    vector_s i;
    int random_value;

    init_lfsrs();
    for (i = 0; i < size; ++i)
    {
        random_value = get_random(); // a value between 0 and 65535 (0xffff) is returned
        V[i] = 1;
    }
}; //FINALIZADO


void vectorSum(vector_t *V1, vector_t *V2, vector_t *res, vector_s size)
{  
    vector_s i;

    for (i = 0; i < size; ++i)
    {
        res[i] = V1[i] + V2[i]; 
    }      
}; //FINALIZADO

/*
void vectorSum_vec(vector_t *V1, vector_t *V2, vector_t *res, vector_s size)
{  
    vector_s i;
    __m512i va, vb, sum;


    if (size > 16)
    {
        
        sum = _mm512_set4_epi32(0,0,0,0);

        for (i = 0; i < size; i += 16)
        {
            va = _mm512_load_epi32(&V1[i]);
            vb = _mm512_load_epi32(&V2[i]);
            sum = _mm512_add_epi32(va, vb);

            _mm512_store_epi32(&res[i], sum);
        }
    }
}; //ESTÁ DANDO ERRO!
*/


void vectorSum_vec(vector_t *V1, vector_t *V2, vector_t *res, vector_s size)
{  
    vector_s i;
    __m512i va, vb, sum;

    if (size >= 16)
    {
        
        sum = _mm512_setzero_epi32();

        for (i = 0; i < size; i += 16)
        {
            va = _mm512_load_si512(&V1[i]);
            vb = _mm512_load_si512(&V2[i]);
            sum = _mm512_add_epi32(va, vb);

            _mm512_store_si512(&res[i], sum);
        }
    }
    else
    {
        vectorSum(V1, V2, red, size);
    }
    
}; //ESTÁ DANDO ERRO!


void print_vector(vector_t *V, vector_s size)
{
    vector_s i;

    for (i = 0; i < size; ++i)
    {
        printf("%d, ", V[i]);
    }
    printf("\n");
}; //FINALIZADO