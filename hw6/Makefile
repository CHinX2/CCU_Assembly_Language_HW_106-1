# Makefile for hw6
all: main open
main: hw6.s
	arm-elf-gcc -g -O0 hw6.s -o hw6.exe
	@ls
open:
	arm-elf-insight
clean:
	rm -f hw6.exe
	@ls
