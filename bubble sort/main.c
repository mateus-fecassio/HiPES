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
    int opt;
    char *size;
    vector_t *base_vec, *V;
    size_t vector_size;




/* ====================== TRATAMENTO DE LINHA DE COMANDO ====================== */
  if (argc < 3)
    usage(argv[0]);
  
  while ( (opt = getopt (argc, argv, "d:")) != -1 )
  {
    switch (opt)
    {
      case 'd':
        size = optarg;
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
  vector_size = atoi(size);

//ALOCAGEM DO VETOR;
    base_vec = allocate_vector(vector_size);
    if (!base_vec)
    {
        fprintf(stderr, "Erro ao alocar o vetor a ser ordenado!\n");
        exit(-1);
    }

//INICIALIZAÇÃO DO VETOR COM OS VALORES (ALEATÓRIOS)
    init_vector(base_vec, vector_size);



//medir tempo aqui
//ORDENAÇÃO
    bubbleSort(base_vec, vector_size);

//terminar medição de tempo aqui






//-------------------------
//implementar o bubble sort com predicação
//medir tempo aqui
//bubble sort com pred
//terminar medição de tempo aqui



    return 0;
}