=================
  Homework #5
=================
[About Program]

-Target : compute GCD of (a,b)

-Steps : (1)in TEXT section, set the value of a, b at r0, r1
         (2)jump to LOOP label.
	 (3)compare a and b, if a>b then a=a-b,else if b>a then b=b-a
	    when a=b,break the loop function.
	 (5)r0 is the GCD of (a,b) now, function end.

-Environment : Ubuntu-16.04.3 on Oracle VM VirtualBox

-How to compile/execute : 
	Makefile �]�w:
		(1)main label : �ޤJ hw5.s �ð��� %arm-elf-gcc -g -O0 hw5.s -o hw5.exe
		(2)open label : ���� %arm-elf-insight �}�� insight GDB����
		(3)all label : ���� main �M open
	
	Command line�ϥΫ��O:
		(1)%make : �sĶ�X hw5.exe ��,�ö}�� insight GDB����
		(2)%make main : �sĶ hw4.exe
		(3)%make open : �����}��insight
	
	insight GDB ARM simulator:
		(1)�q"File-Open"�}���ɮ� hw5.exe
                (2)��"Run"�}�l����A�N Target �]�� Simulator
                (3)��"Step"�@������{��
