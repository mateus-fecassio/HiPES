#ifndef __FUNCTIONS__
#define __FUNCTIONS__

typedef int vector_t;
typedef unsigned long vector_s;

vector_t* allocate_vector(vector_s size);
double timestamp(void);
void init_vector(vector_t *V, vector_s size);
void bubbleSort(vector_t *V, vector_s size);

#endif