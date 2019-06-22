#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "mem_alloc.h"

#define ARRAY_SIZE 10
#define TEST_BLOCK_SIZE 70
#define BLOCK_SIZE 50

/**
* Виводить повідомлення, стан блоків пам'яті та виконує затримку.
*/
void infoAndWait(char message[]) {
    printf("%s\n", message);
    mem_dump();
    getchar();
}

/**
* Тестування функцій poolInitialize, poolFree, mem_alloc, mem_realloc, mem_free.
*/
void simpleMemoryTest() {
    printf("------------ Simple Memory Test ------------\n");

    char *blocksArray[ARRAY_SIZE];

    poolInitialize();
    infoAndWait("Initial pool:");

    for ( int i = 0; i < ARRAY_SIZE; i++ ) {
        blocksArray[i] = (char*)mem_alloc(50);
    }
    infoAndWait("After memory allocation:");

    mem_free(blocksArray[8]);
    infoAndWait("After blocksArray[8] memory free:");

    blocksArray[4] = (char*)mem_realloc(blocksArray[4], 20);
    infoAndWait("After blocksArray[4] memory reallocation to size 20:");

    mem_free(blocksArray[5]);
    infoAndWait("After blocksArray[5] memory free:");

    blocksArray[6] = (char*)mem_realloc(blocksArray[6], 200);
    infoAndWait("After blocksArray[6] memory reallocation to size 200:");

    blocksArray[4] = (char*)mem_realloc(blocksArray[4], 100);
    infoAndWait("After blocksArray[4] memory reallocation to 100:");

    blocksArray[5] = (char*)mem_alloc(70);
    infoAndWait("After blocksArray[5] memory allocation to 70:");

    for ( int i = 0; i <= 7; i++ ) {
        mem_free(blocksArray[i]);
    }
    mem_free(blocksArray[9]);
    infoAndWait("After all memory free:");

    poolFree();
    printf("Free pool\n");
    getchar();
}

/**
* Тестування з допомогою перевірки контрольної суми.
*/
void checkSumTest() {
    printf("------------ Check Sum Test ------------\n");

    el_t *testBlock;
    el_t *blocksArray[ARRAY_SIZE];
    el_t checkSum = 0;

    srand((unsigned int)time(NULL));
    
    poolInitialize();
    infoAndWait("Initial pool:");

    testBlock = (el_t*)mem_alloc(TEST_BLOCK_SIZE * sizeof(char));
    infoAndWait("After testBlock allocation:");

    for ( int i = 0; i < TEST_BLOCK_SIZE; i++ ) {
        testBlock[i] = rand() % 256;
        checkSum ^= testBlock[i];
    }
    updateCheckSums();
    infoAndWait("After check sums of testBlock updating:");

    for ( int i = 0; i < ARRAY_SIZE; i++ ) {
        blocksArray[i] = (char*)mem_alloc(BLOCK_SIZE);
        for ( int j = 0; j < BLOCK_SIZE; j++ ) {
            blocksArray[i][j] = rand() % 256;
        }
    }
    updateCheckSums();
    infoAndWait("After memory allocation:");

    while ( 1 ) {
        size_t size = rand() % (2 * BLOCK_SIZE) + BLOCK_SIZE / 2;
        int index = rand() % ARRAY_SIZE;

        blocksArray[index] = (char*)mem_realloc(blocksArray[index], size);
        if ( blocksArray[index] == NULL ) {
            break;
        }
        for ( size_t j = 0; j < size; j++ ) {
            blocksArray[index][j] = rand() % 256;
        }
    }
    updateCheckSums();
    infoAndWait("After memory realocating many times:\n");

    printf("Previous check sum = %u\n\n", (unsigned char) checkSum); 

    poolFree();
    printf("Free pool\n");
    getchar();
}

int main() {
    simpleMemoryTest();
    checkSumTest();

    return 0;
}
