/*---Rudzik Dima
---IO-81
---Lab 2
---e = (A*B) - (C*D)
---MC = SORT(TRANS(MA)*MB)
-- C = SORT(A)*MB*/
#include <stdio.h>
#include <windows.h>
#include <process.h>     // needed for _beginthread()
#include <string>
#include <iostream>
using namespace std;
void  silly( void * );   // function prototype
static int n;

string convertInt(int number)
{
    if (number == 0)
        return "0";
    string temp="";
    string returnvalue="";
    while (number>0)
    {
        temp+=number%10+48;
        number/=10;
    }
    for (int i=0;i<temp.length();i++)
        returnvalue+=temp[temp.length()-i-1];
    return returnvalue;
}

 static void printMatrix(int** matr) {
		string temp = "";
        for (int i = 0; i < n; i++) {
            temp +="\n";
            for (int j = 0; j < n; j++) {
                temp +="\t" + convertInt(matr[i][j]);
            }
        }
        cout<<temp <<"\n";
    }

 static void printVector(int* matr) {
        string temp = "\n";
        for (int j = 0; j < n; j++) {
            temp +="\t " + convertInt(matr[j]);
        }
        cout<<temp<<"\n";
    }

static void inputVector(int* vec) {
            int temp;
            temp = 1; //----------------------------------------
            for (int j = 0; j < n; j++) {
                vec[j] = temp;
            }
        }

static void inputMatrix(int** matr) {
			int temp;
            temp = 1; //----------------------------------------
            for (int i = 0; i <n; i++) {
                for (int j = 0; j <n; j++) {
                    matr[i][j] = temp;
                }
            }
        }

		void sortVector(int* vec)
        {
            for (int j = 0; j < n; j++)
            {
                for (int o = 0; o < (j + 1); o++)
                {
                    if (vec[j] < vec[o])
                    {
                        vec[j] = vec[j] ^ vec[o];
                        vec[o] = vec[j] ^ vec[o];
                        vec[j] = vec[j] ^ vec[o];
                    }
                }
            }
        }


		void sortVector1(int* vec)
        {
            for (int j = 0; j < n; j++)
            {
                for (int o = 0; o < (j + 1); o++)
                {
                    if (vec[j] > vec[o])
                    {
                        vec[j] = vec[j] ^ vec[o];
                        vec[o] = vec[j] ^ vec[o];
                        vec[j] = vec[j] ^ vec[o];
                    }
                }
            }
        }



        static void func1(void *par)
        {	
			
			cout<<("Func1 thread START")<<endl;
			int* a = NULL;   // Pointer to int, initialize to nothing.
			int* b = NULL;
			int* c = NULL;
			int* d = NULL;
			a = new int[n];  // Allocate n ints and save ptr in 
			b = new int[n];
			c = new int[n];
			d = new int[n];
			inputVector(a);
            inputVector(b);
			inputVector(c);
			inputVector(d);

            int result;
            int z = 0;
            int x = 0;

            for (int i = 0; i < n; i++) {
                z += a[i] * b[i];
                x += c[i] * d[i];
            }
            result = z - x;
            cout<<"func1      (A*B) - (C*D) = " <<(z-x)<<endl;
            cout<<("Func1 thread STOP")<<endl;

        }
//-----------------------------------func 2
        static void func2(void * par) 
		{
			cout<<("Func2 thread START ")<<endl;
            int** ma = NULL;
            int** mb = NULL;
            int** result;
            int** ma1 = NULL;
			ma = new int*[n];
			mb = new int*[n];
			result = new int*[n];
			ma1 = new int*[n];
			
			for (int i =0; i < n; i++){
				ma[i] = new int[n];
				mb[i] = new int[n];
				result[i] = new int[n];
				ma1[i] = new int[n];
			}
			inputMatrix(ma);
			inputMatrix(mb);
			inputMatrix(result);

            for (int o = 0; o < n; o++) {
                for (int i = 0; i < n; i++) {
					ma1[o][i] = 0;
                    for (int j = 0; j < n; j++) {
                        ma1[o][i] += ma[o][i] * mb[j][i];
                    }
                }
            }
            for (int i = 0; i < n; i++) {
                sortVector1(ma1[i]);
            }
            result = ma1;
            cout<<("func 2    SORT(TRANS(MA)*MB) = ")<<endl;
            printMatrix(result);
            cout<<("Func2 thread STOP. ")<<endl;
        }

//--------------------------------func3
        static void func3(void *) 
		{	            
			cout<<("Func3 thread START ")<<endl;
			int* a = NULL;
			int** mb = NULL;
			int* result = NULL;
			int* z = NULL;
			a = new int[n];
			mb = new int*[n];
			result = new int[n];
			z = new int[n];
			for(int i = 0; i < n; i++){
				mb[i] = new int[n];
			}
			inputVector(a);
			inputMatrix(mb);

            sortVector(a);

            for (int j = 0; j < n; j++) {
                   z[j] = 0;
                }

            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    z[i] += mb[i][j]*a[j];
                }
            }
            result = z;
            cout<<("Func 3   SORT(A)*MB  =     ")<<endl;
            printVector(result);
			delete [] a;
			delete [] mb;
			delete [] z;
            cout<<("Func3 thread STOP.")<<endl;
        }

int main()
{
	cin>>n; 
    printf( "Now in the main() function.\n" );


    _beginthread( func1, 0, (void*)12 );
	_beginthread( func2, 0, (void*)12 );
	_beginthread( func3, 0, (void*)12 );
    // From here on there are two separate threads executing
    // our one program.

    // This main thread can call the silly() function if it wants to.

    Sleep( 100000 );
}