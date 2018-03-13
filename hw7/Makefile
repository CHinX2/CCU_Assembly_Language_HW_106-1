# Makefile for hw7
all: main open check
main: hw7.c trans.s
	arm-elf-gcc -g -O0 hw7.c trans.s -o hw7.exe
	@ls
open:
	arm-elf-insight
check:
	cat output.txt
clean:
	rm -f hw7.exe
	@ls
