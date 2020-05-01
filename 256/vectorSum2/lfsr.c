//********* "Pseudo random using LFSRs" *************
//	Implementation:	Marisa Sel Franco				*
//	HiPES - UFPR									*
//***************************************************

#include <stdio.h>
#include "lfsr.h"

uint lfsr32, lfsr31;

//*********************************************
//	1. Seed initialization function
//*********************************************
void init_lfsrs(void){
	lfsr32 = 0xABCDE;		//seed value
	lfsr31 = 0x23456789;	//seed value
}

//*********************************************
//	2. Shift LFSR function
//*********************************************
int shift_lfsr(uint *lfsr, uint polynomial_mask){
	int feedback;

	feedback = *lfsr & 1;
	*lfsr >>= 1;
	if (feedback == 1)
		*lfsr = *lfsr ^ polynomial_mask;
	return *lfsr;
}

//*********************************************
//	3. Pseudo random number generator function
//*********************************************

/* This pseudo random number generator shifts the 32-bit 
LFSR twice before XORing it with the 31-bit LFSR. The 
bottom 16 bits are used for the random number.

A value between 0 and 65535 (0xffff) is returned.*/

int get_random(void){
	shift_lfsr(&lfsr32, POLY_MASK_32);
	return((shift_lfsr(&lfsr32, POLY_MASK_32) ^ shift_lfsr(&lfsr31, POLY_MASK_31)) & 0xffff);
}