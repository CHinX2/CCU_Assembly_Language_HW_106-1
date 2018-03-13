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
	Makefile 設定:
		(1)main label : 引入 hw6.s 並執行 %arm-elf-gcc -g -O0 hw6.s -o hw6.exe
		(2)open label : 執行 %arm-elf-insight 開啟 insight GDB視窗
		(3)all label : 執行 main 和 open
	
	Command line使用指令:
		(1)建立input.txt和output.txt
		(2)%make : 編譯出 hw6.exe 檔,並開啟 insight GDB視窗
		(3)%make main : 編譯 hw6.exe
		(4)%make open : 直接開啟insight
	
	insight GDB ARM simulator:
		(1)從"File-Open"開啟檔案 hw6.exe
                (2)按"Run"開始執行，將 Target 設為 Simulator
                (3)按"Step"一行行執行程式
