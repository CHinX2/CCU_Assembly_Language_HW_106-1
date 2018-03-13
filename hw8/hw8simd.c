#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <mmintrin.h>
#include <xmmintrin.h>
#define MAXC 204 // 202+2
#define MAXR 200

typedef struct timespec timespec;

timespec diff(timespec start,timespec end) // calculate time using
{
	timespec tmp;
	if((end.tv_nsec-start.tv_nsec)<0)
	{
		tmp.tv_sec=end.tv_sec-start.tv_sec-1;
		tmp.tv_nsec=1000000000+end.tv_nsec-start.tv_nsec;
	}
	else{
		tmp.tv_sec=end.tv_sec-start.tv_sec;
		tmp.tv_nsec=end.tv_nsec-start.tv_nsec;
	}
	return tmp;
}

int main()
{
	FILE *fin,*fout;
	float a[MAXR][MAXC]__attribute__((aligned(16)));	// matrix A
	float bc[MAXR][MAXC]__attribute__((aligned(16)));	// matrix B+C
	float tempr[MAXC]__attribute__((aligned(16)));		// A*(B+C)
	__m128 *pa,*pbc,*tmp; // point to a,bc,tempr
	timespec t1,t2;

	int i,j;
	float res,k;

	fin=fopen("data.txt","r");
	fout=fopen("output_simd.txt","w");

	/* read in a,b,c's elements from data.txt */
	for(i=0;i<MAXR;i++)
		for(j=0;j<MAXC-2;j++)
			fscanf(fin,"%f",&a[i][j]);

	for(i=0;i<MAXR;i++)
		for(j=0;j<MAXC-2;j++)
			fscanf(fin,"%f",&bc[i][j]);

	for(i=0;i<MAXR;i++)
	{
		for(j=0;j<MAXC-2;j++)
		{
			fscanf(fin,"%f",&k);
			bc[i][j]+=k;
		}
	}
	/* set the last 2 elements of each row be 0 */
	for(i=0;i<MAXR;i++)
	{
		a[i][202]=a[i][203]=0;
		bc[i][202]=bc[i][203]=0;
	}
	
	clock_gettime(CLOCK_MONOTONIC,&t1);
	for(i=0;i<MAXR;i++)
	{
		float summ[4]__attribute__((aligned(16)))={0}; //store the sum of a*(b+c)
		__m128 *s=(__m128*)summ;
		pa=(__m128*)a[i];
		pbc=(__m128*)bc[i];
		tmp = (__m128*)tempr;
		res=0;

		for(j=0;j<MAXC/4;j++)
		{
			tmp[j]=_mm_mul_ps(pa[j],pbc[j]); // tmp=a*(b+c) in SIMD
			*s=_mm_add_ps(*s,tmp[j]);		 // s=s+tmp (4 bytes) in SIMD
		}
		res=summ[0]+summ[1]+summ[2]+summ[3]; // result
		fprintf(fout,"%f\n",res);			 // store in output fule
	}
	clock_gettime(CLOCK_MONOTONIC,&t2);
	printf("time using: %d sec %d nsec\n",diff(t1,t2).tv_sec,diff(t1,t2).tv_nsec);

	fclose(fin);
	fclose(fout);
	return 0;
}

