# Makefile for hw5
all: main open
main: hw5.s
	arm-elf-gcc -g -O0 hw5.s -o hw5.exe
	@ls
open:
	arm-elf-insight
clean:
	rm -f hw5.exe
	@ls
