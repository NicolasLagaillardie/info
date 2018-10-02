#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	
	FILE *fp;
	char * line = NULL;
    	size_t len = 0;
    	ssize_t read;
	int sum = 0;

	if(argc < 2)
	{
		printf("This script reads and sums readable numbers in a file");
		return 0;
	} else
	{
		for(int i = 1 ; i < argc ; i++)
		{
			fp = fopen(argv[i], "r");

			if (fp == NULL)
				printf("%s is not readable\n",argv[i]);
			else
			{
				while ((read = getline(&line, &len, fp)) != -1) {
					sum += atoi(line);
				}

				fclose(fp);
				printf("Somme des nombres pour %s : %d\n",argv[i], sum);
				sum = 0;
			}
		}
		if (line)
			free(line);

		exit(EXIT_SUCCESS);
	}
}
