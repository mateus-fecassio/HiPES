#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include <unistd.h>
#include <stdbool.h>
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
  vector_t *base_vec, *V;
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

//ALOCAGEM DOS VETORES;
  base_vec = allocate_vector(vector_size);
  V = allocate_vector(vector_size); 
  if (!base_vec || !V)
  {
    fprintf(stderr, "Erro ao alocar o vetor a ser ordenado!\n");
    exit(EXIT_FAILURE);
  }


//INICIALIZAÇÃO DO VETOR COM OS VALORES (ALEATÓRIOS)
  init_vector(base_vec, vector_size);






//--------------------------------------------------------------
fprintf(stdout, "Bubble Sort (SEM predicação):\n");
for (i = 0; i < iterations; ++i)
{
  //preencher o vetor com zeros
  memset(V, 0, vector_size * sizeof(vector_t));

  //cópia do vector_base para V
  memcpy(V, base_vec, (vector_size * sizeof(vector_t)));


  start = timestamp();
  
  //ORDENAÇÃO, sem predicação
  bubbleSort(V, vector_size);

  end = timestamp();

  elapsed = end - start;


  fprintf(stdout, "repetition %llu = %.5g(ms)\n", i+1, elapsed);
}
//--------------------------------------------------------------

fprintf(stdout, "\n\n\n");

//--------------------------------------------------------------
fprintf(stdout, "Bubble Sort (COM predicação):\n");
for (i = 0; i < iterations; ++i)
{
  //preencher o vetor com zeros
  memset(V, 0, vector_size * sizeof(vector_t));

  //cópia do vector_base para V
  memcpy(V, base_vec, (vector_size * sizeof(vector_t)));


  start = timestamp();
  
  //ORDENAÇÃO, com predicação
  //bubbleSort_pred(V, vector_size);

  end = timestamp();

  elapsed = end - start;


  fprintf(stdout, "repetition %llu = %.5g(ms)\n", i+1, elapsed);
}
//--------------------------------------------------------------

  //desalocagem!!!
  
  return 0;
}