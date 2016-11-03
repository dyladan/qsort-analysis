#include <stddef.h>
#include "bm.h"

typedef long WORD;
#define W sizeof(WORD) /* must be a power of 2 */
#define SWAPINIT(a, es) swaptype = (a-(void*)0 | es) % W ? 2 : es > W ? 1 : 0
#define exch(a, b, t) (t = a, a = b, b = t)
#define swap(a, b) swaptype != 0 ? swapfunc(a, b, es, swaptype) : (void)exch(*(WORD*)(a), *(WORD*)(b), t)
#define vecswap(a, b, n) if (n > 0) swapfunc(a, b, n, swaptype)
#define PVINIT(pv, pm) if (swaptype != 0) pv = a, swap(pv, pm); else pv = (char*)&v, v = *(WORD*)pm
#define MIN(a, b)   ((a) < (b) ? a : b)

static char *med3(char *a, char *b, char *c, int (*cmp)())
{
    return cmp(a, b)<0?
        (cmp(b, c)<0?b: cmp(a, c) < 0 ? c : a)
        : (cmp(b, c)>0?b: cmp(a, c) > 0 ? c : a);
}

static void swapfunc(char *a, char *b, size_t n, int swaptype)
{
    if (swaptype <= 1) {
        WORD t;
        for( ; n > 0; a += W, b += W, n -= W)
            exch(*(WORD*)a, *(WORD*)b, t);
    } else {
        char t;
        for( ; n > 0; a += 1, b += 1, n -= 1)
            exch(*a, *b, t);
    }
}

void bm(void *a, size_t n, size_t es, int (*cmp)(const void *, const void *), int m)
{
    void *pa, *pb, *pc, *pd, *pl, *pm, *pn, *pv;
    int r, swaptype;
    WORD t, v;
    size_t s;
    SWAPINIT(a, es);
    if (n < m) { /* Insertion sort on smallest arrays */
        for (pm = a + es; pm < a + n*es; pm += es)
            for (pl = pm; pl > a && cmp(pl-es, pl) > 0; pl -= es)
                swap(pl, pl-es);
        return;
    }
    pm = a + (n/2)*es; /* Small arrays, middle element */
    if (n > m) {
        pl = a;
        pn = a + (n-1)*es;
        if (n > 40) { /* Big arrays, pseudomedian of 9 */
            s = (n/8)*es;
            pl = med3(pl, pl+s, pl+2*s, cmp);
            pm = med3(pm-s, pm, pm+s, cmp);
            pn = med3(pn-2*s, pn-s, pn, cmp);
        }
        pm = med3(pl, pm, pn, cmp); /* Mid-size, med of 3 */
    }
    PVINIT(pv, pm); /* pv points to partition value */
    pa = pb = a;
    pc = pd = a + (n-1)*es;
    for (;;) {
        while (pb <= pc && (r = cmp(pb, pv)) <= 0) {
            if (r == 0) { swap(pa, pb); pa += es; }
            pb += es;
        }
        while (pc >= pb && (r = cmp(pc, pv)) >= 0) {
            if (r == 0) { swap(pc, pd); pd -= es; }
            pc -= es;
        }
        if (pb > pc) break;
        swap(pb, pc);
        pb += es;
        pc -= es;
    }
    pn = a + n*es;
    s = MIN(pa-a, pb-pa ); vecswap(a, pb-s, s);
    s = MIN(pd-pc, pn-pd-es); vecswap(pb, pn-s, s);
    if ((s = pb-pa) > es) bm(a, s/es, es, cmp, m);
    if ((s = pd-pc) > es) bm(pn-s, s/es, es, cmp, m);
}
