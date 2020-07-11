#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <string.h>
#include <getopt.h>
#include <unistd.h>
#include <stdbool.h>
#include <sys/time.h>
#include <time.h>
#include <assert.h>
#include <unistd.h>
#include <limits.h>
#include <immintrin.h>
#include "functions.h"
#include "lfsr.h"



static void usage(char *progname)
{
  fprintf(stderr, "Forma de uso: %s -m <[WB, WC, UN]> -d <device> -o <[normal, vectorizing, nt_load]> -s <vector_size> -r <number_of_repetitions>\n", progname);
  exit(EXIT_FAILURE);
};


int main(int argc, char *argv[])
{
  int opt;
  char *str1, *str2, *operation, *mode, *dev;
  double start, end, elapsed;
  vector_t *base_vec1, *base_vec2, *V;
  vector_s vector_size, vector_bytes, i, iterations;


/* ====================== TRATAMENTO DE LINHA DE COMANDO ====================== */
  if (argc < 11)
    usage(argv[0]);
  
  while ( (opt = getopt (argc, argv, "m:d:o:s:r:")) != -1 )
  {
    switch (opt)
    {
      case 's':
        str1 = optarg;
        break;

        case 'r':
        str2 = optarg;
        break;

        case 'm':
        mode = optarg;
        break;

        case 'o':
        operation = optarg;
        break;

        case 'd':
        dev = optarg;
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
  if (!strcmp(mode, "WB"))
  {
    base_vec1 = allocate_vector(vector_bytes);
    base_vec2 = allocate_vector(vector_bytes);
    V = allocate_vector(vector_bytes);
  }
  else
  {
    void *map1, *map2, *map3;
		map1 = get_uncached_mem(dev, vector_bytes);
		map2 = get_uncached_mem(dev, vector_bytes);
		map3 = get_uncached_mem(dev, vector_bytes);

    base_vec1 = ((vector_t*)map1);
    base_vec2 = ((vector_t*)map2);
    V = ((vector_t*)map3);
  }
  

  if (!base_vec1 || !base_vec2 || !V)
  {
    fprintf(stderr, "Erro ao alocar os vetores utilizados no algoritmo!\n");
    exit(EXIT_FAILURE);
  }


//INICIALIZAÇÃO DOS VETORES COM OS VALORES (ALEATÓRIOS)
  init_vector(base_vec1, vector_size);
  init_vector(base_vec2, vector_size);



//impressão do tamanho [em MBtyes] a ser testado
  //fprintf(stdout, "%llu  ", atoll(str1));

//-------------------------------------------------------------- [TESTE]
  if (!strcmp(operation, "normal"))
  {
    start = timestamp();
    for (i = 0; i < iterations; ++i)
    {
      //preencher o vetor com zeros
      //memset(V, 0, vector_size * sizeof(vector_t));

      //SOMA VETORIAL, sem vetorização
      vectorSum(base_vec1, base_vec2, V, vector_size);
    }
    end = timestamp();
    elapsed = end - start;
    fprintf(stdout, "%.8g\n", elapsed);
  }
  else if (!strcmp(operation, "vectorizing"))
  {
    start = timestamp();
    for (i = 0; i < iterations; ++i)
    {
      
      //memset(V, 0, vector_size * sizeof(vector_t));

      //SOMA VETORIAL, com vetorização
      vectorSum_vec(base_vec1, base_vec2, V, vector_size);
    }
    end = timestamp();
    elapsed = end - start;
    fprintf(stdout, "%.8g\n", elapsed);
  }
  else if (!strcmp(operation, "nt_load"))
  {
    start = timestamp();
    for (i = 0; i < iterations; ++i)
    {
      
      //memset(V, 0, vector_size * sizeof(vector_t));

      //SOMA VETORIAL, com vetorização e load atemporal
      vectorSum_non(base_vec1, base_vec2, V, vector_size);
    }
    end = timestamp();
    elapsed = end - start;
    fprintf(stdout, "%.8g\n", elapsed);
  }
  else
  {
    usage(argv[0]);
  }
  
//fprintf(stdout, "SOMA DE base_vec1[1] (%d) + base_vec2[1] (%d) = %d\n", base_vec1[1], base_vec2[1], V[1]);


//DESALOCAGEM DOS VETORES
if (!strcmp(mode, "WB"))
{
  free(base_vec1);
  free(base_vec2);
  free(V);
}


  exit(EXIT_SUCCESS);
}