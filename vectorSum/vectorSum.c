#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include <unistd.h>
#include <stdbool.h>
#include <limits.h>
#include <immintrin.h>
#include "functions.h"
#include "lfsr.h"


static void usage(char *progname)
{
  fprintf(stderr, "Forma de uso: %s -d <vector_size> -r number_of_repetitions\n", progname);
  exit(EXIT_FAILURE);
};


int main(int argc, char *argv[])
{
  int opt;
  char *str1, *str2;
  double start, end, elapsed, smaller;
  vector_t *base_vec1, *base_vec2, *V;
  vector_s vector_size, vector_bytes, i, iterations;


/* ====================== TRATAMENTO DE LINHA DE COMANDO ====================== */
  if (argc < 5)
    usage(argv[0]);
  
  while ( (opt = getopt (argc, argv, "d:r:")) != -1 )
  {
    switch (opt)
    {
      case 'd':
        str1 = optarg;
        break;

        case 'r':
        str2 = optarg;
        break;

      case ':':
        printf("Essa opção precisa de um valor!\n");
        break;

      case '?':
        printf("Opção desconhecida: %c\n", optopt);
        break;

      default:
        usage(argv[0]);
    }
  }
/* ====================== FIM DO TRATAMENTO DE LINHA DE COMANDO ====================== */
  
  vector_bytes = atoll(str1) * 1024 * 1024;
  vector_size = vector_bytes / sizeof(vector_t);
  iterations = atoll(str2);

//ALOCAGEM DOS VETORES
  base_vec1 = allocate_vector(vector_bytes);
  base_vec2 = allocate_vector(vector_bytes);
  V = allocate_vector(vector_bytes);
  if (!base_vec1 || !base_vec2 || !V)
  {
    fprintf(stderr, "Erro ao alocar os vetores utilizados no algoritmo!\n");
    exit(EXIT_FAILURE);
  }


//INICIALIZAÇÃO DOS VETORES COM OS VALORES (ALEATÓRIOS)
  init_vector(base_vec1, vector_size);
  init_vector(base_vec2, vector_size);


//--------------------------------------------------------------
  /*
  #ifndef NTLOAD
    fprintf(stdout, "Soma vetorial (SEM vetorização):\n");
  #else
    fprintf(stdout, "Soma vetorial (SEM vetorização e load atemporal):\n");
  #endif
  */



  fprintf(stdout, "%llu  ", atoll(str1));


  smaller = __DBL_MAX__;
  for (i = 0; i < iterations; ++i)
  {
    //preencher o vetor com zeros
    memset(V, 0, vector_size * sizeof(vector_t));

    start = timestamp();
    
    //SOMA VETORIAL, sem vetorização
    vectorSum(base_vec1, base_vec2, V, vector_size);

    end = timestamp();

    elapsed = end - start;

    if (elapsed < smaller)
      smaller = elapsed;


    //fprintf(stdout, "repetition %llu = %.5g(ms)\n", i+1, elapsed);
}
fprintf(stdout, "%.8g  ", smaller);

//--------------------------------------------------------------

  //fprintf(stdout, "\n\n\n");

//--------------------------------------------------------------
  /*
  #ifndef NTLOAD
    fprintf(stdout, "Soma vetorial (COM vetorização):\n");
  #else
    fprintf(stdout, "Soma vetorial (COM vetorização e load atemporal):\n");
  #endif
  */
  smaller = __DBL_MAX__;
  for (i = 0; i < iterations; ++i)
  {
    //preencher o vetor com zeros
    memset(V, 0, vector_size * sizeof(vector_t));


    start = timestamp();
    
    //SOMA VETORIAL, com vetorização
    vectorSum_vec(base_vec1, base_vec2, V, vector_size);

    end = timestamp();

    elapsed = end - start;

    if (elapsed < smaller)
      smaller = elapsed;


    //fprintf(stdout, "repetition %llu = %.5g(ms)\n", i+1, elapsed);
}
fprintf(stdout, "%.8g  ", smaller);
//--------------------------------------------------------------


smaller = __DBL_MAX__;
  for (i = 0; i < iterations; ++i)
  {
    //preencher o vetor com zeros
    memset(V, 0, vector_size * sizeof(vector_t));


    start = timestamp();
    
    //SOMA VETORIAL, com vetorização e load atemporal
    vectorSum_non(base_vec1, base_vec2, V, vector_size);

    end = timestamp();

    elapsed = end - start;

    if (elapsed < smaller)
      smaller = elapsed;


    //fprintf(stdout, "repetition %llu = %.5g(ms)\n", i+1, elapsed);
}
fprintf(stdout, "%.8g  \n", smaller);


//DESALOCAGEM DOS VETORES
  free(base_vec1);
  free(base_vec2);
  free(V);


  exit(EXIT_SUCCESS);
}