#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include <unistd.h>
#include <stdbool.h>
#include "functions.h"


static void usage(char *progname)
{
  fprintf(stderr, "Forma de uso: %s -d <vector_size>\n", progname);
  exit(-1);
};


int main(int argc, char *argv[])
{
    int opt;
    char *size;
    vector_t *V1, *V2;
    size_t vector_size;




/* ====================== TRATAMENTO DE LINHA DE COMANDO ====================== */
  if ( argc < 3 )
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
    V1 = allocate_vector(vector_size);
    V2 = allocate_vector(vector_size);
    if (!V1 || !V2)
    {
        fprintf(stderr, "Erro ao alocar o vetor a ser ordenado!\n");
        exit(-1);
    }



//INICIALIZAÇÃO DO VETOR COM OS VALORES (ALEATÓRIOS)
    init_vector(V1, V2, vector_size);



//medir tempo aqui
//ORDENAÇÃO
    bubbleSort(V1, vector_size);

//terminar medição de tempo aqui






//-------------------------
//implementar o bubble sort com predicação
//medir tempo aqui
//bubble sort com pred
//terminar medição de tempo aqui




}