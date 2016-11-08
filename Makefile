test: main.o bm.o
	cc -o test -Ofast -g main.o bm.o

.PHONY: data
data: 2dchar 3dchar 2ddouble 3ddouble 2dint 3dint 2dull 3dull
	./2dchar >   plots/data/2d/char.dat
#	./2ddouble > plots/data/2d/double.dat
#	./2dint >    plots/data/2d/int.dat
#	./2dull >    plots/data/2d/ull.dat
	./3dchar >   plots/data/3d/char.dat
	./3ddouble > plots/data/3d/double.dat
	./3dint >    plots/data/3d/int.dat
	./3dull >    plots/data/3d/ull.dat


2dchar: 2dchar.o bm.o
	cc -o 2dchar -Ofast -g 2dchar.o bm.o

3dchar: 3dchar.o bm.o
	cc -o 3dchar -Ofast -g 3dchar.o bm.o

2ddouble: 2ddouble.o bm.o
	cc -o 2ddouble -Ofast -g 2ddouble.o bm.o

3ddouble: 3ddouble.o bm.o
	cc -o 3ddouble -Ofast -g 3ddouble.o bm.o

2dint: 2dint.o bm.o
	cc -o 2dint -Ofast -g 2dint.o bm.o

3dint: 3dint.o bm.o
	cc -o 3dint -Ofast -g 3dint.o bm.o

2dull: 2dull.o bm.o
	cc -o 2dull -Ofast -g 2dull.o bm.o

3dull: 3dull.o bm.o
	cc -o 3dull -Ofast -g 3dull.o bm.o

main.o:
	cc -c main.c

bm.o:
	cc -c bm.c

.PHONY: clean
clean:
	rm *.o test 2dchar 3dchar 2ddouble 3ddouble 2dint 3dint 2dull 3dull


run: test
	./test

.PHONY: charts
charts:
	cd plots && gnuplot -e "set term svg" 2d.p #3d.p

.PHONY: debug
debug: run clean

2dchar.o:
	cc -c 2dchar.c

3dchar.o:
	cc -c 3dchar.c

2ddouble.o:
	cc -c 2ddouble.c

3ddouble.o:
	cc -c 3ddouble.c

2dint.o:
	cc -c 2dint.c

3dint.o:
	cc -c 3dint.c

2dull.o:
	cc -c 2dull.c

3dull.o:
	cc -c 3dull.c

