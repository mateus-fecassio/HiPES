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
  fprintf(stderr, "Forma de uso: %s -d <vector_size>\n", progname);
  exit(-1);
};


int main(int argc, char *argv[])
{
  int opt, repeat, i;
  char *str1, *str2;
  double t1, t2;
  vector_t *base_vec, *V;
  vector_s vector_size;




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
  vector_size = atoi(str1);
  repeat = atoi(str2);

//ALOCAGEM DO VETOR;
  base_vec = allocate_vector(vector_size);
  if (!base_vec)
  {
    fprintf(stderr, "Erro ao alocar o vetor a ser ordenado!\n");
    exit(-1);
  }

//INICIALIZAÇÃO DO VETOR COM OS VALORES (ALEATÓRIOS)
  init_vector(base_vec, vector_size);

for (i = 0; i < repeat; ++i)
{
  //cópia do vetor base
  memcpy(V, base_vec, (vector_size * sizeof(vector_t)));


  t1 = timestamp();
  //ORDENAÇÃO
  bubbleSort(V, vector_size);
  t2 = timestamp();
  fprintf(stdout, "rep %d = %.5g", i, t2-t1);
}

//FAZER A IMPRESSÃO DO VETOR PARA SABER SE ESTÁ CERTO O ALGORITMO





//-------------------------
//implementar o bubble sort com predicação
//medir tempo aqui
//bubble sort com pred
//terminar medição de tempo aqui



    return 0;
}