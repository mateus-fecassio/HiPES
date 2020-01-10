/*
 * Copyright (C) 2014  Marco Antonio Zanata Alves (mazalves at inf.ufrgs.br)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
/// Linear Feedback Shift Register using 32 bits and XNOR. Details at:
/// http://www.xilinx.com/support/documentation/application_notes/xapp052.pdf
/// http://www.ece.cmu.edu/~koopman/lfsr/index.html

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>

// =============================================================================
uint64_t string_to_uint64(char *string) {
    uint64_t result = 0;
    char c;

    for (  ; (c = *string ^ '0') <= 9 && c >= 0; ++string) {
        result = result * 10 + c;
    }
    return result;
};

// =============================================================================
int main (int argc, char *argv[]) {
    uint64_t repetitions;
    if(argc == 2) {
        repetitions = string_to_uint64(argv[1]);
    }
    else {
        printf("Please provide the number of repetitions.\n");
        exit(EXIT_FAILURE);
    }

    uint64_t i = 0;
    uint64_t jump = 1;

    uint64_t lfsr = 0x80000000;
    uint64_t bit;

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    for (i = 0; i < repetitions; i++) {
        /// Linear Feedback Shift Register
        bit  = ~((lfsr >> 0) ^ (lfsr >> 10) ^ (lfsr >> 11) ^ (lfsr >> 30) ) & 1;
        lfsr =  (lfsr >> 1) | (bit << 31);
        jump = lfsr & 1;
        if (jump)   asm volatile("mov %0, %0" : "=r" (bit) : "r" (bit) : );
        else        asm volatile("mov %0, %0" : "=r" (lfsr) : "r" (lfsr) : );

        /// Linear Feedback Shift Register
        bit  = ~((lfsr >> 0) ^ (lfsr >> 10) ^ (lfsr >> 11) ^ (lfsr >> 30) ) & 1;
        lfsr =  (lfsr >> 1) | (bit << 31);
        jump = lfsr & 1;
        if (jump)   asm volatile("mov %0, %0" : "=r" (bit) : "r" (bit) : );
        else        asm volatile("mov %0, %0" : "=r" (lfsr) : "r" (lfsr) : );

        /// Linear Feedback Shift Register
        bit  = ~((lfsr >> 0) ^ (lfsr >> 10) ^ (lfsr >> 11) ^ (lfsr >> 30) ) & 1;
        lfsr =  (lfsr >> 1) | (bit << 31);
        jump = lfsr & 1;
        if (jump)   asm volatile("mov %0, %0" : "=r" (bit) : "r" (bit) : );
        else        asm volatile("mov %0, %0" : "=r" (lfsr) : "r" (lfsr) : );

        /// Linear Feedback Shift Register
        bit  = ~((lfsr >> 0) ^ (lfsr >> 10) ^ (lfsr >> 11) ^ (lfsr >> 30) ) & 1;
        lfsr =  (lfsr >> 1) | (bit << 31);
        jump = lfsr & 1;
        if (jump)   asm volatile("mov %0, %0" : "=r" (bit) : "r" (bit) : );
        else        asm volatile("mov %0, %0" : "=r" (lfsr) : "r" (lfsr) : );

    }

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    exit(EXIT_SUCCESS);
}
