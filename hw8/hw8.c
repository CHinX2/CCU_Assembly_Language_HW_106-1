#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define MAXC 202
#define MAXR 200

typedef struct timespec timespec;

timespec diff(timespec start,timespec end)
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
	float a[MAXR][MAXC];
	float bc[MAXR][MAXC];
	timespec t1,t2;

	int i,j;
	float tmp;
	fin=fopen("data.txt","r");
	fout=fopen("output.txt","w");

	/* read in a,b,c's elements from data.txt */
	for(i=0;i<MAXR;i++)
		for(j=0;j<MAXC;j++)
			fscanf(fin,"%f",&a[i][j]);

	for(i=0;i<MAXR;i++)
		for(j=0;j<MAXC;j++)
			fscanf(fin,"%f",&bc[i][j]);

	for(i=0;i<MAXR;i++) //matric b+c
	{
		for(j=0;j<MAXC;j++)
		{
			fscanf(fin,"%f",&tmp);
			bc[i][j]+=tmp;
		}
	}
	int k=0;
	clock_gettime(CLOCK_MONOTONIC,&t1);
	for(i=0;i<MAXR;i++)
	{
		tmp=0;
		for(j=0;j<MAXC;j++)
		{
			k=a[i][j]*bc[i][j]; //k=a*(b+c)
			tmp+=k;
		}
		fprintf(fout,"%f\n",tmp); //store in output
	}
	clock_gettime(CLOCK_MONOTONIC,&t2);
	printf("time using: %d sec %d nsec\n",diff(t1,t2).tv_sec,diff(t1,t2).tv_nsec);
	fclose(fin);
	fclose(fout);
	return 0;
}

