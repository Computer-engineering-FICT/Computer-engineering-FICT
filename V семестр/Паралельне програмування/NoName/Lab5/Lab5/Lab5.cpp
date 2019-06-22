// Lab5.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
#include <omp.h>
#include <iostream>
#include <ctime>

#include "Function1.h"
#include "Function2.h"
#include "Function3.h"


void main()
{
	Function1 function1(800);
	Function2 function2(450);
	Function3 function3(600);
	unsigned int start_time;

	#pragma omp parallel sections num_threads(4)
    {
		std::cout << omp_get_num_threads();

		#pragma omp section
		
			function1.StartFunction(start_time);
		

		#pragma omp section
		
			function2.StartFunction(start_time);
		

		#pragma omp section
		
			function3.StartFunction(start_time);
		
	}
	unsigned int end_time = clock();
	std::cout << (float)(end_time - start_time) / 1000;
	system("pause");
}

