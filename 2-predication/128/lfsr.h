//********* "Pseudo random using LFSRs" *************
//	Implementation:	Marisa Sel Franco				*
//	HiPES - UFPR									*
//***************************************************

#ifndef __LFSR__
#define __LFSR__

#define POLY_MASK_32 0xB4BCD35C			// 32-bits polynominal mask
#define POLY_MASK_31 0x7A5BC2E3			// 31-bits polynominal mask

typedef unsigned int uint;

int shift_lfsr(uint *lfsr, uint polynomial_mask);
void init_lfsrs(void);
int get_random(long long int range);

#endif