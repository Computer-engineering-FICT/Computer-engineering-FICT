#include <omp.h>
#include "F1.h"
#include "F2.h"
#include "F3.h"

const int N = 200;

int main() {
	cout << "Lab 5 start" << endl << endl;
	F1 f1 = F1(N);
	F2 f2 = F2(N);
	F3 f3 = F3(N);
	int tid;
	#pragma omp parallel num_threads(3)
	{
		tid = omp_get_thread_num();
		switch (tid) {
		case 0:
			f1.run();
			break;
		case 1:
			f2.run();
			break;
		case 2:
			f3.run();
			break;
		}
	}

	cout << endl << "Lab 5 end" << endl << endl;
	cout << "Press Enter...";
	string t;
	getline(cin, t);

}