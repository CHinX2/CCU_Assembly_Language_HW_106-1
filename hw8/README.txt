=================
  Homework #8
=================
[About Program]

-Target : calculate sum(A[i][j]*B[i][j]+A[i][j]*C[i][j]) for i=k in 200 with 0<=j<202
          A,B,C are 200*202 matrices

-Steps : (1)in hw8.c :
		1.open data.txt and output.txt as FILE pointer
		2.store matrix A, store matrices B + C in one matrix
		  -> A*B+A*C = A*(B+C)
		3.using for loop to calculate sum(A[i][j]*B[i][j]+A[i][j]*C[i][j])
		  then store each result of line in output file
		4.print the execute time

	 (2)in hw8simd.c :
		1.including libraries mmintrin.h and xmmintrin.h
		1.open data.txt and output.txt as FILE pointer
		2.store matrix A, store matrices B + C in one matrix
		  -> A*B+A*C = A*(B+C)
		3.because the number of column must be 4*n (202->204),
		  set the last 2 element of each row be 0s.
		4.SIMD : use _mm_mul_ps to multiply matrix A and BC ( datatype : __m128)
		         set an 4-byte array to store the sum of A*(B+C) by function _mm_add_ps
			 then sum the array's 4 values and store it in output fule
		5.print the execute time

         (3)timespec :
		1.including library time.h, define a type timespec
		2.function diff use to calculate the time in a small range

-Environment : CCU CSIE Computing Server
	       csie0.cs.ccu.edu.tw
	       FreeBSD 10.3 based on amd64
	       GCC version 4.9.4 (FreeBSD Ports Collection)

-How to compile/execute : 
	Makefile 設定:
		(1)main label : use hw8.c and hw8simd.c 
				run %gcc hw8.c -o hw8.exe create output.txt
				run %gcc -msse4 hw8simd.c -o hw8simd.exe create output_simd.txt
		(2)check label : execute %vimdiff output.txt output_simd.txt
				 print the compair result of output.txt and output_simd.txt
		(3)all label : run main, check
		(4)clean label : run %rm -f hw8.exe hw8simd.exe to delete it
	
	Command line 使用指令:
		(1)build data.txt
		(2)%make : compile hw8.c and hw8simd.c and create hw8.exe and hw8simd.exe,
 			   and print the compair result of output.txt and output_simd.txt
		(3)%make main : compile hw8.c and hw8simd.c and create hw8.exe and hw8simd.exe
		(4)%make check : print the compair result of output.txt and output_simd.txt
		(5)%make clean : delete hw8.exe 和 hw8simd.exe

-Execute time (without data input):
	(1)hw8.c without SIME instruction : 0 sec 304894 nsec

	(2)hw8simd.c with SIME instruction : 0 sec 200484 nsec