#define ITERATIONS 100

#define TESTTYPE int

#define NMIN 100
#define NMAX 10000
#define NSTEP 100

#define PIVOTMIN 10
#define PIVOTMAX 1000
#define PIVOTSTEP 10

#define DDD

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include "bm.h"

clock_t timeit (void (*func)(void *, size_t, size_t, int (*)(const void *, const void *), int),\
        void *a, size_t n, size_t es, int(*cmp)(const void *, const void *), int m)
{
    clock_t s, e;
    int i;
    unsigned long int total = 0;

    for (i = 0; i < ITERATIONS; i++)
    {
        s = clock();
        func(a, n, es, cmp, m);
        e = clock();
        total = total + (e - s);
    }

    return total / ITERATIONS;
}

int compare (const void * a, const void * b)
{
    return ( *(int*)a - *(int*)b );
}

void printarr(int a[], int n)
{
    int i;
    for (i = 0; i < n; i++)
    {
        printf("%d ", a[i]);
    }
    printf("\n");
}

void qshim (void *a, size_t n, size_t es, int(*cmp)(const void *, const void *), int m)
{
    qsort(a, n, es, cmp);
}

int main()
{
    int l = NMAX;
    int i, j;
    TESTTYPE a[NMAX], b[NMAX], c[NMAX], d[NMAX], e[NMAX], f[NMAX];
    clock_t time_a, time_b, time_c, time_d, time_e, time_f;

    srand(0);

#ifdef DDD
    for (l = NMIN; l <= NMAX; l = l + NSTEP)
    {
#endif
        for (j = PIVOTMIN; j <= PIVOTMAX; j = j + PIVOTSTEP)
        {
            for (i = 0; i < l; i++)
            {
                a[i] = l - i; // descending
                b[i] = i; // ascending
                c[i] = rand() % NMAX; // random
                d[i] = i % 5; // sawtooth
                e[i] = i + (i % 5); // dithered
                if (i < l/2) // organ pipe
                {
                    f[i] = i;
                }
                else
                {
                    f[i] = l - i;
                }
            }
            time_a = timeit(bm, a, l, sizeof(TESTTYPE), compare, j);
            time_b = timeit(bm, b, l, sizeof(TESTTYPE), compare, j);
            time_c = timeit(bm, c, l, sizeof(TESTTYPE), compare, j);
            time_d = timeit(bm, d, l, sizeof(TESTTYPE), compare, j);
            time_e = timeit(bm, e, l, sizeof(TESTTYPE), compare, j);
            time_f = timeit(bm, f, l, sizeof(TESTTYPE), compare, j);
#ifdef DDD
            printf("%d %d %lu %lu %lu %lu %lu %lu\n", j, l, time_a, time_b, time_c, time_d, time_e, time_f);
        }
#else
            printf("%d %lu %lu %lu %lu %lu %lu\n", j, time_a, time_b, time_c, time_d, time_e, time_f);
#endif
    }
    return(0);
}

