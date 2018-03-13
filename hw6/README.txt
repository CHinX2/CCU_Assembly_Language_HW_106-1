=================
  Homework #6
=================
[About Program]

-Target : turn 

-Steps : (1)in DATA section, set the variables of input_addr, output_addr and size of buffer
         (2)in TEXT section, set the struct of parameters of file open/close/read/write/length 
         (3)open the input and output file
	 (4)get the length of input and read it by char
	 (5)check if the char in buffer now is lower alphabet, then turn it to upper by sub #32
         (6)write the char into output
	 (7)loop the step 4-6 til the input file end
	 (8)close the input and output file

-Environment : Ubuntu-16.04.3 on Oracle VM VirtualBox

-How to compile/execute : 
	Makefile �]�w:
		(1)main label : �ޤJ hw6.s �ð��� %arm-elf-gcc -g -O0 hw6.s -o hw6.exe
		(2)open label : ���� %arm-elf-insight �}�� insight GDB����
		(3)all label : ���� main �M open
	
	Command line�ϥΫ��O:
		(1)�إ�input.txt�Moutput.txt
		(2)%make : �sĶ�X hw6.exe ��,�ö}�� insight GDB����
		(3)%make main : �sĶ hw6.exe
		(4)%make open : �����}��insight
	
	insight GDB ARM simulator:
		(1)�q"File-Open"�}���ɮ� hw6.exe
                (2)��"Run"�}�l����A�N Target �]�� Simulator
                (3)��"Step"�@������{��
