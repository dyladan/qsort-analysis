#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "bm.c"

void fswap(int i, int j, int *a)
{
    int t;
    t = a[i];
    a[i] = a[j];
    a[j] = t;
}

void printarr(int a[], int n) {
    int i;
    for (i = 0; i < n; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");
}

void iisort(int *a, int n)
{
    int i, j, t;
    for (i = 1; i < n; i++)
    {
        for (j = i; j > 0 && a[j-1] > a[j]; j--)
        {
            t = a[j-1]; a[j-1] = a[j]; a[j] = t;
            // swap(j, j-1, a);
        }
    }
}

void iqsort(int *a, int n)
{
    int i, j, t;
    if (n <= 1) return;
    for(i=1,j=0;i<n;i++)
        if (a[i] < a[0])
        {
            // swap(++j, i, a);
            j++;
            t = a[j]; a[j] = a[i]; a[i] = t;
        }
    // swap(j, 0, a);
    t = a[j]; a[j] = a[0]; a[0] = t;
    iqsort(a, j);
    iqsort(a+j+1, n-j-1);
}

int compare (const void * a, const void * b)
{
    return ( *(int*)a - *(int*)b );
}

long int qstest(int l)
{
    srand(time(NULL));
    int i;
    clock_t s, e;
    int a[l];
    for (i = 0; i < l; i++) {
        // a[i] = rand() % 50000;
        a[i] = i;
    }
    // printarr(a, l);
    s = clock();
    qsort(a, l, sizeof(int), compare);
    e = clock();
    // printarr(a, l);
    // return((float)(e - s) / CLOCKS_PER_SEC);
    return(e-s);
}

long int iqtest(int l)
{
    srand(time(NULL));
    int i;
    clock_t s, e;
    int a[l];
    for (i = 0; i < l; i++) {
        // a[i] = rand() % 50000;
        a[i] = i;
    }
    // printarr(a, l);
    s = clock();
    iqsort(a, l);
    e = clock();
    // printarr(a, l);
    // return((float)(e - s) / CLOCKS_PER_SEC);
    return(e-s);
}

long int iitest(int l) {
    int i;
    clock_t s, e;
    int a[l];

    for (i = 0; i < l; i++) {
        // a[i] = rand() % 10;
        a[i] = i;
    }
    // printarr(a, l);
    s = clock();
    iisort(a, l);
    e = clock();
    // printarr(a, l);
    // return((float)(e - s) / CLOCKS_PER_SEC);
    return(e-s);
}

/*
int main() {
    printf("Ticks per second %d\n", CLOCKS_PER_SEC);
    printf("   n: t(i) - t(q)\n", CLOCKS_PER_SEC);
    int i,j;
    int x,y;
    int a = 100;//100000;
    long int d = 0;
    srand(time(NULL));

    // iqtest(10);
    for (i = 1000; i <= 100000; i += 1000)
    {
        for (j = 0; j < a; j++)
        {
            x = iqtest(i);
            y = qstest(i);
            d += x - y;
        }
        printf("%4d: %###.2f\n", i, (float) d/j);
    }
}
*/

int main()
{
    int l = 10;
    int a[l], b[l], i;

    printf("testing bm sort\n");

    for (i = 0; i < l; i++)
    {
        a[i] = l - i;
        b[i] = l - i;
    }
    printf("a: ");
    printarr(a, l);
    printf("b: ");
    printarr(b, l);
    qsort(b, l, sizeof(int), compare);
    bm(a, 10, sizeof(int), compare, 7);
    printf("a: ");
    printarr(a, l);
    printf("b: ");
    printarr(b, l);
    return(0);
}
