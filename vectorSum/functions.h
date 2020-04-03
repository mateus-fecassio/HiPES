#ifndef __FUNCTIONS__
#define __FUNCTIONS__


//---------------defines and typedefs---------------//
//#define NTLOAD


#ifndef NTLOAD
    #define ALIGNMENT 32
#else
    #define ALIGNMENT 64
#endif

typedef int vector_t;
typedef long long int vector_s;
//--------------------------------------------------//

vector_t* allocate_vector(vector_s size);
double timestamp(void);
void init_vector(vector_t *V, vector_s size);
void vectorSum(vector_t *V1, vector_t *V2, vector_t *res, vector_s size);
void vectorSum_opt(vector_t *V1, vector_t *V2, vector_t *res, vector_s size);
void print_vector(vector_t *V, vector_s size);

#endif