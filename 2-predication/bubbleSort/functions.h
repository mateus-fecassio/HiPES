#ifndef __FUNCTIONS__
#define __FUNCTIONS__

//---------------defines and typedefs---------------//
typedef int vector_t;
typedef long long int vector_s;
//--------------------------------------------------//

vector_t* allocate_vector(vector_s size);
double timestamp(void);
void init_vector(vector_t *V, vector_s size);
void bubbleSort(vector_t *V, vector_s size);
void bubbleSort_pred(vector_t *V, vector_s size);
void print_vector(vector_t *V, vector_s size);

#endif