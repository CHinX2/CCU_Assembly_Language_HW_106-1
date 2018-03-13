=================
  Homework #4
=================
[About Program]

-Target : Matrix computation
	  A[2][3] ; B[3][2] ; C[2][2] ; D[2][2]
	  C = D + A * B

-Steps : (1)in DATA section, set the variables A, B, C, D as data objects
	    that each elements in them is a word-sized integer, 
	    and assign the values of A, B,and D by myself
         (2)in TEXT section, put the address of A, B, C, and D in .matrix 
         (3)load matrix A in r0 and load elements in r5-r10
	 (4)load matrix B in r0 and load each elements in r11 for 6-times execution
	    before execute the next round, multiply it with matrix A's elements and store in r1-r4
	
	    r1: c1-1 = a1-1 * b1-1 + a1-2 * b2-1 + a1-3 * b3-1
	    r2: c1-2 = a1-1 * b1-2 + a1-2 * b2-2 + a1-3 * b3-2
	    r3: c2-1 = a2-1 * b1-2 + a2-2 * b2-2 + a2-3 * b3-2
	    r4: c2-2 = a2-1 * b1-2 + a2-2 * b2-2 + a2-3 * b3-2

         (4)load matrix D in r0 and load each elements in r5 for 4-times execution
	    before execute the next round, add it with matrix C's elements ant store in r1-r4

	    r1: c1-1 = c1-1 + d1-1
	    r2: c1-2 = c1-2 + d1-2
	    r3: c2-1 = c2-1 + d2-1
	    r4: c2-2 = c2-2 + d2-2

	 (5)loat matrix C in r0 and store r1-r4 in matrix C, function end.

-Environment : Ubuntu-16.04.3 on Oracle VM VirtualBox

-How to compile/execute : 
	Makefile �]�w:
		(1)main label : �ޤJ hw4.s �ð��� %arm-elf-gcc -g -O0 hw4.s -o hw4.exe
		(2)open label : ���� %arm-elf-insight �}�� insight GDB����
		(3)all label : ���� main �M open
	
	Command line�ϥΫ��O:
		(1)%make : �sĶ�X hw4.exe ��,�ö}�� insight GDB����
		(2)%make main : �sĶ hw4.exe
		(3)%make open : �����}��insight
	
	insight GDB ARM simulator:
		(1)�q"File-Open"�}���ɮ� hw4.exe
                (2)��"Run"�}�l����A�N Target �]�� Simulator
                (3)��"Step"�@������{��
