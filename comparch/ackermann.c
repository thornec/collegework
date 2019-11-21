//Conor Thorne 17337490 Ackermann.c
#include<stdio.h>
#include <time.h>

/* Declare and Initalize Global Variables */
int overflow = 0;
int underflow = 0;
int depth = 0;
int maximum_depth = 0;
int used_windows = 2;
int number_windows = 0;
int procedure_calls = 0;

void overflow_check(){
	/* Check if usedwindows exceeds number of windows */
	if(used_windows == number_windows) overflow++;
	else{used_windows++;} // New window being used
	
}

void underflow_check(){
	/* Check for Underflow */
	if(used_windows == 2) underflow = underflow + 1;
	else { used_windows = used_windows - 1;}
}



int ackermann(int x, int y){
	procedure_calls++;
	int return_value;
	depth = depth + 1; // Depth Increases

	overflow_check();
	
	/* Check and update depth */
	if(depth > maximum_depth){ maximum_depth = depth; }

	/* Ackermann Code */
	if(x == 0){
		return_value = y + 1;
	}
	else if(y == 0){
		return_value = ackermann(x-1, 1);
	}
	else{
		return_value = ackermann(x-1, ackermann(x,y-1));
	}

	depth = depth -1; 	//Exited from function reduce depth

	underflow_check();

	return return_value;
}



int main()

{

	int result = 0;
   /* Initiate Timer Variables */
   clock_t start_timer;
   clock_t finished_timer;
   double timepassed;


	/* 6 Register Set Ackermann */
	number_windows = 6;
	used_windows = 2;
	depth = 0;
	maximum_depth = 0;
	overflow = 0;
	underflow = 0;
	//Start timer
	start_timer = clock();
	result = ackermann(3,6);
	//End timer
	finished_timer = clock();
	//Calculate time taken
	timepassed = (double)(finished_timer - start_timer)/CLOCKS_PER_SEC;

	printf("		Ackermann with 6 Register Sets\n");
	printf("Number of Windows Used = %d\n", number_windows);
	printf("Maximum Depth = %d\n", maximum_depth);
	printf("Overflows = %d\n", overflow);
	printf("Underflows = %d\n", underflow);
	printf("Return Value = %d\n ", result);
	printf("Procedure calls = %d\n", procedure_calls);
	printf("Time Taken = %f Seconds\n", timepassed);

	/* 8 Register Set Ackermann */
	number_windows = 8;
	used_windows = 2;
	depth = 0;
	maximum_depth = 0;
	overflow = 0;
	underflow = 0;
	procedure_calls = 0;
	//Start timer
	start_timer = clock();
	result = ackermann(3,6);
	//End timer
	finished_timer = clock();
	//Calculate time taken
	timepassed = (double)(finished_timer - start_timer)/CLOCKS_PER_SEC;
	printf("		Ackermann with 8 Register Sets\n");
	printf("Number of Windows Used = %d\n", number_windows);
	printf("Maximum Depth = %d\n", maximum_depth);
	printf("Overflows = %d\n", overflow);
	printf("Underflows = %d\n", underflow);
	printf("Return Value = %d\n ", result);
	printf("Procedure calls = %d\n", procedure_calls);
	printf("Time Taken = %f Seconds\n", timepassed);


	/* 16 Register Set Ackermann */
	number_windows = 16;
	used_windows = 2;
	depth = 0;
	maximum_depth = 0;
	overflow = 0;
	underflow = 0;
	procedure_calls = 0;
	//Start timer
	start_timer = clock();
	result = ackermann(3,6);
	//End timer
	finished_timer = clock();
	//Calculate time taken
	timepassed = (double)(finished_timer - start_timer)/CLOCKS_PER_SEC;
	printf("		Ackermann with 16 Register Sets\n");
	printf("Number of Windows Used = %d\n", number_windows);
	printf("Maximum Depth = %d\n", maximum_depth);
	printf("Overflows = %d\n", overflow);
	printf("Underflows = %d\n", underflow);
	printf("Return Value = %d\n ", result);
	printf("Procedure calls = %d\n", procedure_calls);
	printf("Time Taken = %f Seconds\n", timepassed);

	return 0;
}