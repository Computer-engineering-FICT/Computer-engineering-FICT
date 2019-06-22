/*
 * PSC: Laba №08
 * Author: Kushnirenko Alexander
 * from group "IO-81"
 * f1: MAX(A + B + C)
 * f2: MAX(MB * MB)
 * f3: SORT(B * MD) * (MA * MB)
 */

#include <cstdlib>
#include <iostream>
#include "omp.h"

#include "Vector.h"
#include "Matrix.h"

using std::cout;
using std::cin;
using std::endl;

int n = 1000;

// f1: MAX(A + B + C)
void f1() {
    cout << "f1-thread: start\n";
    Vector vA; vA.init(n); vA.fill();
    Vector vB; vB.init(n); vB.fill();
    Vector vC; vC.init(n); vC.fill();
    Vector * a = vA + vB;
    *a += vC;
    cout << "f1: MAX(A + B + C) = " << a->getMax() << endl;
    delete a; a = NULL;
    cout << "f1-thread: end\n";
}

// f2: MAX(MB * MB)
void f2() {
    cout << "f2-thread: start\n";
    Matrix mB; mB.init(n); mB.fill();
    Matrix * a = mB * mB;
    cout << "f2: MAX(MB * MB) = " << a->getMax() << endl;
    delete a; a = NULL;
    cout << "f2-thread: end\n";
}

// f3: SORT(B * MD) * (MA * MB)
void f3() {
    cout << "f3-thread: start\n";
    Vector vB; vB.init(n); vB.fill();
    Matrix mD; mD.init(n); mD.fill();
    Matrix mA; mA.init(n); mA.fill();
    Matrix mB; mB.init(n); mB.fill();
    Vector * d = vB * mD; d->sort();
    Matrix * b = mA * mB; *d *= *b;
    cout << "f3: SORT(B * MD) * (MA * MB) = ";
    d->println();
    delete b; b = NULL;
    delete d; d = NULL;
    cout << "f3-thread: end\n";
}

int main(int argc, char *argv[]) {
	cout << "Main thread starts.\n";
	omp_set_num_threads(3);
	#pragma omp shelude(static,3)
	#pragma omp parallel {
  		#pragma omp sections nowait {
	   		#pragma omp section	{
				cout << "Process #" << omp_get_thread_num() << " started\n";
		   		f1();
				cout << "Process #" << omp_get_thread_num() << " stopped\n"
			}
	   		#pragma omp section {
				cout << "Process #" << omp_get_thread_num() << " started\n";
		   		f2();
				cout << "Process #" << omp_get_thread_num() << " stopped\n";
			}
			#pragma omp section {
				cout << "Process #" << omp_get_thread_num() << " started\n";
		   		f3();
				cout << "Process #" << omp_get_thread_num() << " stopped\n";
			}
		}
	}
	cout << "Main thread ends.\nPress enter to exit\n";
	return 0;
}
