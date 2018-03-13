=================
  Homework #7
=================
[About Program]

-Target : translate lower alphabet to upper alphabet

-Steps : (1)in hw7.c :
		1.open input.txt and output.txt as FILE pointer
		2.read in input by line, then set a ptr point to the read-in line
		3.trans(*ptr) : goto file "trans.s"
	 (2)in trans.s :
		1.follow the APCS rules
		2.in TEXT section,check if the char in r0 now is lower alphabet, 
		  then turn it to upper by sub #32
		3.go back to hw7.c, return the translated char
         (6)point to next char and trans it until it point to '\n'
	 (7)write the translated line in output.txt, then read in next line of input til the file end
	 (8)close the input and output file

-Environment : Ubuntu-16.04.3 on Oracle VM VirtualBox

-How to compile/execute : 
	Makefile �]�w:
		(1)main label : �ޤJ hw7.c �M trans.s 
				�ð��� %arm-elf-gcc -g -O0 hw7.c trans.s -o hw7.exe
		(2)open label : ���� %arm-elf-insight �}�� insight GDB����
		(3)check label : ���� %cat output.txt �L�X output.txt �����e
		(4)all label : ���� main, open, check
		(5)clean label : ���� %rm -f hw7.exe �R��������
	
	Command line �ϥΫ��O:
		(1)�إ� input.txt �M output.txt
		(2)%make : �sĶ�X hw7.exe ��,�ö}�� insight GDB����,���� insight ��L�X output.txt
		(3)%make main : �sĶ hw7.exe
		(4)%make open : �����}�� insight
		(5)%make check : �L�X output.txt
		(6)%make clean : �R�� hw7.exe
	
	insight GDB ARM simulator:
		(1)�q"File-Open"�}���ɮ� hw7.exe
                (2)��"Run"�}�l����A�N Target �]�� Simulator
                (3)��"Step"�@������{��, �Ϋ�"continue"���槹��ӵ{��