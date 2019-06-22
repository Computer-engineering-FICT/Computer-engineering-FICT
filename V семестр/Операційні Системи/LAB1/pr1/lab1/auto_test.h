#ifndef LAB1_ALLOCATOR_AUTO_TEST_H
#define LAB1_ALLOCATOR_AUTO_TEST_H

namespace autotest {

void test(int elements, int rounds, int pool_size);

long hash(void *curr, size_t size);

void fill_random(void *ptr, size_t size);

}

#endif //LAB1_ALLOCATOR_AUTO_TEST_H
