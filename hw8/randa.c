#include <stdio.h>
#include <stdlib.h>

int main()
{
	FILE *fp;
	fp=fopen("data.txt","w");
	srand(time(NULL));
	float a;
	int i,j;

	for(i=0;i<600;i++)
	{
		for(j=0;j<201;j++)
		{
			a=(rand()%77)+1;
			fprintf(fp,"%f ",a);
		}
		a=(rand()%77)+1;
		fprintf(fp,"%f\n",a);
	}
	fclose(fp);
	return 0;
}
