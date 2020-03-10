#ifndef __FUNCTIONS__
#define __FUNCTIONS__

typedef double vector_t;
typedef unsigned long size_t;

vector_t* allocate_vector(size_t size);
double timestamp(void);
void init_vector(vector_t *V1, vector_t *V2, size_t size);
void bubbleSort(vector_t *V, size_t size);

#endif