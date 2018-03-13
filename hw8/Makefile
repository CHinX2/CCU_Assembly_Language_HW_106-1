#Makefile for hw8
all: main check
main: hw8.c hw8simd.c
	gcc hw8.c -o hw8.exe
	gcc -msse4 hw8simd.c -o hw8simd.exe
	@ls
check:
	vimdiff output.txt output_simd.txt
clean:
	rm -f hw8.exe hw8simd.exe
	@ls
