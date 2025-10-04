#ifdef _WIN32
#include <stdlib.h>
#include <time.h>

double drand48(void) {
    return (double)rand() / (RAND_MAX + 1.0);
}

void srand48(long seed) {
    srand((unsigned int)seed);
}

long lrand48(void) {
    return rand();
}
#endif
