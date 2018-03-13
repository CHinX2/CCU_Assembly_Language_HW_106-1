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
	Makefile 設定:
		(1)main label : 引入 hw5.s 並執行 %arm-elf-gcc -g -O0 hw5.s -o hw5.exe
		(2)open label : 執行 %arm-elf-insight 開啟 insight GDB視窗
		(3)all label : 執行 main 和 open
	
	Command line使用指令:
		(1)%make : 編譯出 hw5.exe 檔,並開啟 insight GDB視窗
		(2)%make main : 編譯 hw4.exe
		(3)%make open : 直接開啟insight
	
	insight GDB ARM simulator:
		(1)從"File-Open"開啟檔案 hw5.exe
                (2)按"Run"開始執行，將 Target 設為 Simulator
                (3)按"Step"一行行執行程式
