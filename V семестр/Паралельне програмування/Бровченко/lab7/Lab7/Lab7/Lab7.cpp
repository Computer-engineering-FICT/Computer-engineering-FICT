#include <cilk/cilk.h>
#include <iostream>
#include <string>
#include "F1.h"
#include "F2.h"
#include "F3.h"

const int N = 300;

int main(int argc, char* argv[]) {
	

	F1 f1 = F1(N);
	F2 f2 = F2(N);
	F3 f3 = F3(N);

	cilk_spawn f1.run();
	cilk_spawn f2.run();
	f3.run();

	cilk_sync;
	
	cout << "Press Enter...";
	string t;
	getline(cin, t);
	
}