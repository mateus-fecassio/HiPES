#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include <unistd.h>
#include <stdbool.h>
#include <immintrin.h>
#include <x86intrin.h>
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
  double start, end, elapsed;
  vector_t *base_vec1, *base_vec2, *V;
  vector_s vector_size, i, iterations;


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
  
  vector_size = atoll(str1);
  iterations = atoll(str2);

//ALOCAGEM DOS VETORES
  base_vec1 = allocate_vector(vector_size);
  base_vec2 = allocate_vector(vector_size);
  V = allocate_vector(vector_size);
  if (!base_vec1 || !base_vec2 || !V)
  {
    fprintf(stderr, "Erro ao alocar os vetores utilizados no algoritmo!\n");
    exit(EXIT_FAILURE);
  }


//INICIALIZAÇÃO DOS VETORES COM OS VALORES (ALEATÓRIOS)
  init_vector(base_vec1, vector_size);
  init_vector(base_vec2, vector_size);


#ifndef NTLOAD
  printf("NÃO ESTÁ DEFINIDO");
#else
  printf("ESTÁ DEFINIDO");
#endif



//--------------------------------------------------------------
  fprintf(stdout, "Soma vetorial (SEM load atemporal):\n");
  for (i = 0; i < iterations; ++i)
  {
    //preencher o vetor com zeros
    memset(V, 0, vector_size * sizeof(vector_t));

    start = timestamp();
    
    //SOMA VETORIAL, sem load atemporal
    vectorSum(base_vec1, base_vec2, V, vector_size);

    end = timestamp();

    elapsed = end - start;


    fprintf(stdout, "repetition %llu = %.5g(ms)\n", i+1, elapsed);
}
//--------------------------------------------------------------

  fprintf(stdout, "\n\n\n");

//--------------------------------------------------------------
  fprintf(stdout, "Soma vetorial (COM load atemporal):\n");
  for (i = 0; i < iterations; ++i)
  {
    //preencher o vetor com zeros
    memset(V, 0, vector_size * sizeof(vector_t));


    start = timestamp();
    
    //SOMA VETORIAL, com load atemporal
    vectorSum_nontLoad(base_vec1, base_vec2, V, vector_size);

    end = timestamp();

    elapsed = end - start;


    fprintf(stdout, "repetition %llu = %.5g(ms)\n", i+1, elapsed);
}
//--------------------------------------------------------------


//DESALOCAGEM DOS VETORES
  free(base_vec1);
  free(base_vec2);
  free(V);


  exit(EXIT_SUCCESS);
}