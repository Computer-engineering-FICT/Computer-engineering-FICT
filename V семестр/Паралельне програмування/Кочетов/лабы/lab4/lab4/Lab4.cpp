#include "F1.h"
#include "F2.h"
#include "F3.h"

const int N = 500;

int main() {
	cout << "Lab 4 start" << endl << endl;
	DWORD tid[3];
	HANDLE threads[3];
	F1* f1 = new F1(N);
	F2* f2 = new F2(N);
	F3* f3 = new F3(N);
	threads[0] = CreateThread(NULL, 0, F1::startThread, f1, 0, &tid[0]);
	threads[1] = CreateThread(NULL, 0, F2::startThread, f2, 0, &tid[1]);
	threads[2] = CreateThread(NULL, 0, F3::startThread, f3, 0, &tid[1]);
	SetThreadPriority(threads[0], THREAD_PRIORITY_LOWEST);
	SetThreadPriority(threads[1], THREAD_PRIORITY_NORMAL);
	SetThreadPriority(threads[2], THREAD_PRIORITY_HIGHEST);
	WaitForMultipleObjects(3, threads, true, INFINITE);
	cout << endl << "Lab 4 end" << endl << endl << "Press Enter...";
	string t;
	getline(cin, t);
	delete f1;
	delete f2;
	delete f3;
}