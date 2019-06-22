#define POOL_SIZE 1024
#define MIN_BLOCK_SIZE 4

/**
* ���������� ������� ��� ���� ���������� �������� ����.
*/
typedef char el_t;

/**
* ���������� ���������������� ���� ��������� ������ ����� ��� �������� ���'��.
* FIRST_FOUND_ALGORITHM - ����� ������� ���������� ����� (�� �������������).
* MIN_SIZE_ALGORITHM - ����� ���������� ����� � ��������� �������.
*/
typedef enum {
    FIRST_FOUND_ALGORITHM,
    MIN_SIZE_ALGORITHM
} SearchAlgorithm;

/**
* ����������� ���� ���'��.
*/
void poolInitialize();

/**
* ��������� ���� ���'��.
*/
void poolFree();

/**
* ������������ ��������� ������ ����� ��� �������� ���'��.
*/
void setSearchAlgorithm(SearchAlgorithm algorithm);

/**
* �������� ���'�� �������� ������.
* size - ����� ���'��, �� ���� ���������.
* returns �������� �� ������� ������� ���'�� ��� NULL, ���� �������� �� �������.
*/
void *mem_alloc(size_t size);

/**
* ������������ ���'��.
* addr - �������� �� ������� ���'��, �� ���� �������������.
* size - ����� ����� ������.
* returns �������� �� ����������� ������� ���'�� ��� NULL, ���� ������������ �� �������.
*/
void *mem_realloc(void *addr, size_t size);

/**
* ��������� ���'��.
* addr - �������� �� ������� ���'��, �� ���� ������������.
*/
void mem_free(void *addr);

/**
* ��������� ����� ����� ���'��.
*/
void mem_dump();

/**
* ������� ��������� ���� ����� ��� �����.
*/
void updateCheckSums();
