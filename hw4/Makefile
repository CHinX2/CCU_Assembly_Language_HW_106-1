# Makefile for hw4
all: main open
main: hw4.s
	arm-elf-gcc -g -O0 hw4.s -o hw4.exe
	@ls
open:
	arm-elf-insight
clean:
	rm -f hw4.exe
	@ls
