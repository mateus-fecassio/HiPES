#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include <unistd.h>
#include <stdbool.h>
#include "lfsr.h"

int main(int argc, char *argv[])
{
    int random;
init_lfsrs();
    for (int j = 0; j < 500; ++j)
        printf("random = %d\n", get_random());
}
