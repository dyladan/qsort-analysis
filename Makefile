test: main.o bm.o
	cc -o test -Ofast -g main.o bm.o

main.o:
	cc -c main.c

bm.o:
	cc -c bm.c

.PHONY: clean
clean:
	rm *.o test

run: test
	./test

.PHONY: charts
charts:
	cd plots && gnuplot -e "set term svg" 2d.p 3d.p

.PHONY: debug
debug: run clean
