=================
  Homework #3
=================
[About Program]

-Target : 對一數字取絕對值

-Steps : (1)指定一隨機數字(-128~127)存到r0
         (2)判斷該數字是否小於0
         (3)若小於0則將r1存入r0的值，將r1減去2倍的r0並存回r0
         (4)將r0的值存到r2,程式結束

-Environment : Ubuntu-16.04.3 on Oracle VM VirtualBox

-How to compile : 使用指令 %arm-elf-gcc -g -O0 hw3.s -o hw3.exe

-How to execute : (1)使用指令 %arm-elf-insight 開啟insight GUI視窗
                  (2)從"File-Open"開啟檔案 hw3.exe
                  (3)按"Run"開始執行，將 Target 設為 Simulator
                  (4)按"Step"一行行執行程式