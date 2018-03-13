#include <stdio.h>
#include <stdlib.h>

extern char trans(char); // linked to trans.s

int main()
{
	/* open input.txt and output.txt */
	FILE *fin, *fout; 
	fin=fopen("input.txt","r");
	fout=fopen("output.txt","w+");

	char c[200]={'\0'}; //use to store input data by line
	while(fgets(c,200,fin))
	{
		char *ptr=c; //set a pointer to the top of string
		while(*ptr!='\n')
		{
			*ptr=trans(*ptr); //check if it is lower and translate
			ptr++; //point to next char
		}
		fprintf(fout,"%s",c); // write in the output.txt by line
	}

	/* close input.txt and output.txt */
	fclose(fin);
	fclose(fout);
	return 0;
}
