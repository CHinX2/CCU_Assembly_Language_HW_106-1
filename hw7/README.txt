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
	Makefile 設定:
		(1)main label : 引入 hw7.c 和 trans.s 
				並執行 %arm-elf-gcc -g -O0 hw7.c trans.s -o hw7.exe
		(2)open label : 執行 %arm-elf-insight 開啟 insight GDB視窗
		(3)check label : 執行 %cat output.txt 印出 output.txt 的內容
		(4)all label : 執行 main, open, check
		(5)clean label : 執行 %rm -f hw7.exe 刪除執行檔
	
	Command line 使用指令:
		(1)建立 input.txt 和 output.txt
		(2)%make : 編譯出 hw7.exe 檔,並開啟 insight GDB視窗,關閉 insight 後印出 output.txt
		(3)%make main : 編譯 hw7.exe
		(4)%make open : 直接開啟 insight
		(5)%make check : 印出 output.txt
		(6)%make clean : 刪除 hw7.exe
	
	insight GDB ARM simulator:
		(1)從"File-Open"開啟檔案 hw7.exe
                (2)按"Run"開始執行，將 Target 設為 Simulator
                (3)按"Step"一行行執行程式, 或按"continue"執行完整個程式