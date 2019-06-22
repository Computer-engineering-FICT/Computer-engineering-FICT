#include <cstddef>
#include <climits>
#include <random>
#include <iostream>

#include "auto_test.h"
#include "debug.h"
#include "alloc.h"

using namespace autotest;

struct Test {
  void *ptr = nullptr;
  int size = 0;
  long hash = 0;
};

long autotest::hash(void *curr, size_t size) {
  void *end = curr + size;
  long hash = 0;
  while (curr + sizeof(long) < end) {
    hash ^= *((long *) curr);
    curr += sizeof(long);
  }
  if (curr + sizeof(long) != end) {
    long last = 0;
    while (curr < end) {
      last <<= sizeof(char);
      last |= *((char *) curr);
      curr++;
    }
    hash ^= last;
  }
  return hash;
}

void autotest::fill_random(void *ptr, size_t size) {
  std::independent_bits_engine<std::default_random_engine, CHAR_BIT, unsigned char> engine{};
  auto *data = (unsigned char *) ptr;
  for (size_t s = 0; s < size; s++) {
    *data++ = engine();
  }
}

void update_test(Test &test, int size, void *ptr) {
  test.ptr = ptr;
  test.size = size;
  fill_random(test.ptr, test.size);
  test.hash = hash(test.ptr, test.size);
}

void autotest::test(int elements, int rounds, int pool_size) {
  std::vector<Test> test_data{elements, Test()};

  alloc::Allocator allocator{pool_size};

  std::random_device rd;
  std::mt19937 gen(rd());
  std::uniform_int_distribution<> coin_dis(0, 1);
  std::uniform_int_distribution<> test_dis(0, elements - 1);
  std::uniform_int_distribution<> size_dis(2, pool_size / 10);

  for (int i = 0; i < rounds; i++) {
    Test &test = test_data[test_dis(gen)];
    if (!test.ptr) {
      int size = size_dis(gen);
      void* ptr = allocator.mem_alloc(size);
      if (ptr) update_test(test, size, ptr);
      
    } else {
      if (hash(test.ptr, test.size) != test.hash) {
        std::cout << "Hash mismatch for:" << std::endl;
        print_chunk(test.ptr);
        std::cout << std::endl;

        std::cout << std::endl << "All chunks:" << std::endl;
        allocator.mem_dump();
        return;
      }
      if (coin_dis(gen)) {
        int size = size_dis(gen);
        
        void *ptr = allocator.mem_realloc(test.ptr, size);
        if (ptr) {
          if (size > test.size && hash(ptr, test.size) != test.hash) {
            std::cout << "Realloc integrity failed" << std::endl;
            std::cout << "Realloc (" << size << "):";
            print_chunk(ptr);
            std::cout << std::endl;
            return;
          }
          update_test(test, size, ptr);
        }
      } else if (test.ptr) {
          
        allocator.mem_free(test.ptr);
        test.ptr = nullptr;
      }
    }
  }

  std::cout << std::endl << "All chunks at the end of test:" << std::endl;
  allocator.mem_dump();

  for (int i = 0; i < elements; ++i) {
    Test &test = test_data[i];
    if (test.ptr) allocator.mem_free(test.ptr);
  }

  std::cout << std::endl << "All chunks after cleanup:" << std::endl;
  allocator.mem_dump();
}

