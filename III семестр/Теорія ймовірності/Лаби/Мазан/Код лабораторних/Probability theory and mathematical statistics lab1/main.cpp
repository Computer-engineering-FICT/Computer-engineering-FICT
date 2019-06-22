/* 
 * File:   main.cpp
 * Author: yan
 *
 * Created on September 4, 2018, 11:32 PM
 */

#include <cstdlib>
#include <cmath>
#include <iostream>
#include <vector>

//#include <rand>

using namespace std;

long factorial (unsigned int n) {
    if (n == 0 || n == 1)
        return 1;
    int memory = 1;
    for (int i = 1; i <= n; i++) {
        memory*= i;
    }
    return memory;
}

const auto& permutation_no_repeat = factorial;

long permutation_repeat(unsigned int n, vector<int> array) {
    int result = permutation_no_repeat(n);
    for (int i = 0; i < n; i++)
        result/=factorial(array[i]);
    return result;
}
long arrangement_no_repeat (unsigned int n, unsigned  int k) {
    return factorial(n)/factorial(n-k);
}

long arrangement_repeat (unsigned int n, unsigned  int k) {
    return pow(n, k);
}

long combination_no_repeat (unsigned int n, unsigned int k) {
    return arrangement_no_repeat(n, k)/factorial(k);
}

long combination_repeat (unsigned int n, unsigned int k) {
    return combination_no_repeat(n+k-1, k);
}

double test() {
        int tests_number = 100000;
        //Random tester = new Random();
        
        int required_numbers_counter = 0;
        for(int i = 0; i < tests_number; i++) {
            srand(time(NULL));
            int test_num[6] = {(int)(8 * rand()/RAND_MAX)+1, (int)(9 * rand()/RAND_MAX), (int)(9 * rand()/RAND_MAX),
                               (int)(9 * rand()/RAND_MAX), (int)(9 * rand()/RAND_MAX), (int)(9 * rand()/RAND_MAX)};
            int eight_count = 0;
            int two_count = 0;
            for (int j = 0; j < 6; j++) {
                if (test_num[j] == 2) {
                    two_count++;
                }
                if (test_num[j] == 8) {
                    eight_count++;
                }
            }
            if (eight_count == 1 && two_count == 2) {
                required_numbers_counter++;
            }
        }
        //cout << endl << required_numbers_counter;
        return (double)required_numbers_counter/(double)tests_number;
    }

int main(int argc, char** argv) {
    long digits_num = 6;
    long eight_repetion = 1;
    long two_repetion = 2;
    srand(time(NULL));
    //cout << "Введіть розрядність числа: ";
    //cin >> digits_num;
    //cout << "Введіть, скільки разів повторюється цифра 8: ";
    //cin >> eight_repetion;
    //cout << "Введіть, скільки разів повторюється цифра 2: ";
    //cin >> two_repetion;
    //int arr[3] = {eight_repetion, two_repetion, digits_num-eight_repetion-two_repetion};
    //vector<int> array(arr, arr + sizeof(arr) / sizeof(int));
    //vector<int> array_2 = array;
    //array_2[2]-=1;
    //int required_numbers = permutation_repeat(digits_num, array)*arrangement_repeat(8,digits_num-eight_repetion-two_repetion)-
    //                        permutation_repeat(digits_num-1, array_2)*arrangement_repeat(8,digits_num-eight_repetion-two_repetion-1);
    long required_numbers = combination_no_repeat(digits_num, two_repetion)*combination_no_repeat(digits_num-two_repetion, eight_repetion)*
                arrangement_repeat(8,digits_num-eight_repetion-two_repetion) - combination_no_repeat(digits_num-1, two_repetion)*combination_no_repeat(digits_num-1-two_repetion, eight_repetion)*
                arrangement_repeat(8,digits_num-1-eight_repetion-two_repetion);
    cout << "Існує " << digits_num << "-цифрових чисел з " << eight_repetion << " цифрою 8 та " << two_repetion << " цифрами 2: " << required_numbers << endl;
    int all_numbers = 9*arrangement_repeat(10,digits_num-1);
    cout << "Всього " << digits_num << "-цифрових чисел: " << all_numbers << endl;
    
    cout << "Імовірність знаходження потрібного нам числа: " << required_numbers << "/" << all_numbers << " = ";
    double result = 1.0*required_numbers/all_numbers;
    cout /*<< 0.0068 << endl*/ << result;
    double test_result = 1.0*test();
    int te = 8*((double)rand()/RAND_MAX)+1;
    cout << endl << te;
    cout << endl << "Результати тестування: ";
    printf("%f", test_result);
    return 0;
}

