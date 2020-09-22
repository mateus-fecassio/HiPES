#ifndef __FUNCTIONS__
#define __FUNCTIONS__


//---------------defines and typedefs---------------//
#define AVX512
#define ALIGNMENT 64
#define PAGE_SIZE (sysconf(_SC_PAGESIZE))
#define PAGE_MASK (~(PAGE_SIZE - 1))


typedef int vector_t;
typedef long long int vector_s;
//--------------------------------------------------//

vector_t* allocate_vector(vector_s size);
void die(char *msg);
void *get_uncached_mem(char *dev, int size);
double timestamp(void);
void init_vector(vector_t *V, vector_s size, long long int lenght);
void init_vector_cmp(vector_t *V, vector_s size, int value);
vector_s sum_selection_normal(vector_t *base_vec, vector_s size, int value);
vector_s predicate(vector_t *base_vec, vector_t *vec_cmp, vector_t *V, vector_s size, long long int value, int stride);
vector_s predicate_nt(vector_t *base_vec, vector_t *vec_cmp, vector_t *res, vector_s size, long long int value, int stride);
void print_vector(vector_t *V, vector_s size);

#endif