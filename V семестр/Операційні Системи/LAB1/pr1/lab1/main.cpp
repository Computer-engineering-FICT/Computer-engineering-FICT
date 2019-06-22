#include <iostream>
#include <tuple>
#include <vector>
#include <random>
#include <climits>
#include <algorithm>
#include <functional>

#include "alloc.h"
#include "debug.h"
#include "auto_test.h"

int main() {
//  alloc::Allocator allocator(300);
//  allocator.mem_dump();
//  void *mem1 = allocator.mem_alloc(25);
//  allocator.mem_dump();
//  void *mem2 = allocator.mem_alloc(25);
//  allocator.mem_dump();
//  allocator.mem_free(mem2);
//  allocator.mem_dump();
//  void *mem3 = allocator.mem_alloc(50);
//  allocator.mem_dump();
//  void *mem1_realloc = allocator.mem_realloc(mem1, 50);
//  allocator.mem_dump();

  autotest::test(100, 200, 10000);

  // service info
  std::cout << "Info chunk size (per each allocation): " << sizeof(alloc::Chunk) << std::endl;
  std::cout << "Permanent service data (2 chunks): " << 2 * sizeof(alloc::Chunk) << std::endl;

  return 0;
}
