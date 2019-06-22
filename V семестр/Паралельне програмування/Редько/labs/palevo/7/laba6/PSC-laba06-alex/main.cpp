/* PSC: Laba №06
 * Author: Kushnirenko Alexander
 * from group "IO-81"
 * f1: MAX(A + B + C)
 * f2: MAX(MB)
 * f3: SORT(B * MD) * (MA - MB) */

#include <cstdlib>
#include <iostream>
#include <windows.h>


#include "Vector.h"
#include "Matrix.h"

using std::cout;
using std::cin;
using std::endl;

int n = 1000;

int getMax(const Vector & v) {
    int max = v.value[0];
    for (int i = 1; i < v.length; i++) {
        if (v.value[i] > max) {
            max = v.value[i];
        }
    }
    return max;
}

int getMax(const Matrix & m) {
    int max = getMax(m.value[0]);
    for (int i = 1; i < m.length; i++) {
        int a = getMax(m.value[i]);
        if (a > max) {
            max = a;
        }
    }
    return max;
}

// f1: MAX(A + B + C)
DWORD WINAPI f1(PVOID pParam) {
    cout << "f1-thread: start\n";
    int n = (int)*pParam;
    Vector vA; vA.init(n); vA.fill();
    Vector vB; vB.init(n); vB.fill();
    Vector vC; vC.init(n); vC.fill();
    Vector * a = vA + vB;
    *a += vC;
    cout << "f1: MAX(A + B + C) = " << getMax(*a) << endl;
    delete a; a = NULL;
    cout << "f1-thread: end\n";
    return (DWORD)0;
}

// f2: MAX(MB)
DWORD WINAPI f2(PVOID pParam) {
void f2() {
    cout << "f2-thread: start\n";
    int n = (int)*pParam;
    Matrix mB; mB.init(n); mB.fill();
    cout << "f2: MAX(MB) = " << getMax(mB) << endl;
    cout << "f2-thread: end\n";
    return (DWORD)0;
}

// f3: SORT(B * MD) * (MA - MB)
DWORD WINAPI f3(PVOID pParam) {
    cout << "f3-thread: start\n";
    int n = (int)*pParam;
    Vector vB; vB.init(n); vB.fill();
    Matrix mD; mD.init(n); mD.fill();
    Matrix mA; mA.init(n); mA.fill();
    Matrix mB; mB.init(n); mB.fill();
    Vector * d = vB * mD; d->sort();
    Matrix * b = mA - mB; *d *= *b;
    cout << "f3: SORT(B * MD) * (MA - MB) = ";
    d->println();
    delete b; b = NULL;
    delete d; d = NULL;
    cout << "f3-thread: end\n";
    return (DWORD)0;
}

int main(int argc, char** argv) {

    cout << "Main thread starts.\n";
    cout << "Enter n: ";
    cin >> n;

    /*  LpThreadAttributes - указатель на структуру LPSECURITY_ATTRIBUTES.
     *      Для значения по умолчанию передавать NULL
     *  DwStackSize -  размер стека, выделяемый для потока из общего адресного 
     *      пространства процесса. Для значения по умолчанию передавать "0".
     *  LpStartAddress - указатель на адрес входной функции потока.
     *  LpParameter - параметр, который будет передан внутрь функции потока.
     *  DwCreationFlags - 0 - исполнение начинается немедленно, или CREATE_SUSPENDED -
     *      исполнение приостанавливается до последующих указаний.
     *  LpThreadId - Адрес переменной в которую функция возвращает идентификатор,
     *      приписанный системой новому потоку. */
    DWORD id1, id2, id3;
    HANDLE t[] = {
        CreateThread(NULL, 0, f1, (PVOID)&n, CREATE_SUSPENDED, &id1),
        CreateThread(NULL, 0, f2, (PVOID)&n, CREATE_SUSPENDED, &id2),
        CreateThread(NULL, 0, f3, (PVOID)&n, CREATE_SUSPENDED, &id3)
    };

    SetThreadPriority(t[0], THREAD_PRIORITY_NORMAL);
    SetThreadPriority(t[1], THREAD_PRIORITY_HIGHEST);
    SetThreadPriority(t[2], THREAD_PRIORITY_BELOW_NORMAL);

    ResumeThread(t[0]); ResumeThread(t[1]); ResumeThread(t[2]);

    WaitForMultipleObjects(3, t, TRUE, INFINITE);

    CloseHandle(t[0]); CloseHandle(t[1]); CloseHandle(t[2]);

    cout << "Main thread ends.\nPress enter to exit ";
    cin;

    return 0;
}