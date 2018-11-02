#include "hw1given.h"
#include <stdio.h>

//Phuong Pham
//CS 201
//Homework 1

int main()
{
	int row, column; //Store number of columns and rows of Plinko boards.
	char c; //To read in the file
	int i = 0, j = 0, k = 0; //Variables for for loop.
	float x = 0; //Variable for math. 
	int random_column; //Store random number generated.
	int curr_row = 0, curr_col = 0; //Keep track of where the current position is at on the Plinko board.
	//int store;
	int num_runs = 0;
	
	char * ptr; 
	
	char buffer[20]; //Buffer to store lines read in from the external file.
	char ** array; //Array for the Plinko boards.
	
	FILE * fp;
	char f_name[100];
	
	/*printf("Please enter the full path to the file: ");
	scanf("%s", &f_name);*/
	
	printf("Please enter the number of runs: ");
	scanf("%d", &num_runs);
	
	int results[num_runs]; //Array to store the results.
	
	//Read in array from external file.
	
	fp = fopen("plinko2.txt", "r");
	
	if (fp == 0)
	{
		printf("Failed to open file.\n");
		exit(1);
	}
	
	fgets(buffer, 100, fp);
	row = strtol(buffer, &ptr, 10);
	printf("Number of rows: %d\n", row);
		
	++ptr;
		
	column = strtol(ptr, NULL, 10);
	++column;
	printf("Number of columns: %d\n", column);
		
		
		
	//Set up the array for the Plinko board, according to the number of 
	//rows and columns obtained from file.
		
	array = (char**)malloc(sizeof(char*)*row);
	
	for (i = 0; i < row; ++i)
	{
		array[i] = (char*)malloc(sizeof(char)*column);
	}
	
	
	i = 0;
	if(!feof(fp))
	{
		do 
		{
			j = 0;
			while (j < column)
			{
				c = fgetc(fp);
				array[i][j] = c;
				printf("array[%d][%d] = %c \n", i, j, array[i][j]);
				j++;
			}
			
			i++;
		} while (i < row);
	}
	
	fclose(fp); //Close file.
	
	
	//Start moving down the Plinko board.
	
	
	i = 0;
	while (i < num_runs)
	{
		do
		{
			curr_row = 0;
			random_column = GetRandom(1, column - 2);
			curr_col = random_column;
			
			if (array[curr_row][random_column] == 'O')
			{
				curr_row++; //Move down
			}
			else if (array[curr_row][random_column - 1] == 'O')
			{
				//Move left
				curr_col--;
				curr_row++;
			}
			else
			{
				//Move right
				curr_col++;
				curr_row++;
			}
		} while (curr_row < row); //Keep looping until at bottom of board.
	
		results[curr_row] = curr_col; //Store the results (where the Plinko is at the bottom of the board)
												//into the array.
		i++;
	}
	
	i = 0;

	while (i < num_runs);
	{
		x = (results[i]/num_runs);
		printf("Probability land in Column %d: %f", i, x);
		i++;
	}
	
	
	
	//Free Array
	for(i = 0; i < row; i++)
	{
		free(array[i]);
	}
	
	free(array);
	
	return 0;
}
