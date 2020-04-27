#ifndef __FUNCTIONS__
#define __FUNCTIONS__


//---------------defines and typedefs---------------//
#define ALIGNMENT 64


typedef int vector_t;
typedef long long int vector_s;
//--------------------------------------------------//

vector_t* allocate_vector(vector_s size);
double timestamp(void);
void init_vector(vector_t *V, vector_s size);
void vectorSum(vector_t *V1, vector_t *V2, vector_t *res, vector_s size);
void vectorSum_vec(vector_t *V1, vector_t *V2, vector_t *res, vector_s size);
void vectorSum_non(vector_t *V1, vector_t *V2, vector_t *res, vector_s size);
void print_vector(vector_t *V, vector_s size);

#endif