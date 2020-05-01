#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <sys/time.h>
#include <time.h>
#include <limits.h>
#include <immintrin.h>
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


void vectorSum(vector_t *V1, vector_t *V2, vector_t *res, vector_s size)
{  
    vector_s i;

    for (i = 0; i < size; ++i)
    {
        res[i] = V1[i] + V2[i]; 
    }      
}; //FINALIZADO


void vectorSum_vec(vector_t *V1, vector_t *V2, vector_t *res, vector_s size)
{  
    vector_s i;
    #ifdef SSE128
        __m128i va, vb, sum;

        sum = _mm_setzero_si128();
        for (i = 0; i < size; i += STRIDE)
        {
            va = _mm_loadu_si128(&V1[i]);
            vb = _mm_loadu_si128(&V2[i]);
                
            sum = _mm_add_epi32(va, vb);

            _mm_store_si128(&res[i], sum);
        }
    #endif

    #ifdef AVX256
        __m256i va, vb, sum;
            
        sum = _mm256_setzero_si256();
        for (i = 0; i < size; i += STRIDE)
        {
            va = _mm256_loadu_si256(&V1[i]);
            vb = _mm256_loadu_si256(&V2[i]);
                
            sum = _mm256_add_epi32(va, vb);

            _mm256_store_si256(&res[i], sum);
        } 
    #endif

    #ifdef AVX512
        __m512i va, vb, sum;

            
        sum = _mm512_setzero_epi32();
        for (i = 0; i < size; i += STRIDE)
        {
            va = _mm512_loadu_si512(&V1[i]);
            vb = _mm512_loadu_si512(&V2[i]);
                
            sum = _mm512_add_epi32(va, vb);

            _mm512_store_si512(&res[i], sum);
        }  
    #endif

}; //TESTAR


void vectorSum_non(vector_t *V1, vector_t *V2, vector_t *res, vector_s size)
{  
    vector_s i;
    #ifdef SSE128
        __m128i va, vb, sum;
        
    
        sum = _mm_setzero_si128();
        for (i = 0; i < size; i += STRIDE)
        {
            va = _mm_stream_load_si128(&V1[i]);
            vb = _mm_stream_load_si128(&V2[i]);
            
            sum = _mm_add_epi32(va, vb);

            _mm_store_si128(&res[i], sum);
        }
    #endif

    #ifdef AVX256
        __m256i va, vb, sum;
        
    
        sum = _mm256_setzero_si256();
        for (i = 0; i < size; i += STRIDE)
        {
            va = _mm256_stream_load_si256(&V1[i]);
            vb = _mm256_stream_load_si256(&V2[i]);
            
            sum = _mm256_add_epi32(va, vb);

            _mm256_store_si256(&res[i], sum);
        }
    #endif

    #ifdef AVX512
        __m512i va, vb, sum;
        
    
        sum = _mm512_setzero_epi32();
        for (i = 0; i < size; i += STRIDE)
        {
            va = _mm512_stream_load_si512(&V1[i]);
            vb = _mm512_stream_load_si512(&V2[i]);
            
            sum = _mm512_add_epi32(va, vb);

            _mm512_store_si512(&res[i], sum);
        }
    #endif

}; //TESTAR


void print_vector(vector_t *V, vector_s size)
{
    vector_s i;

    for (i = 0; i < size; ++i)
    {
        printf("%d, ", V[i]);
    }
    printf("\n");
}; //FINALIZADO