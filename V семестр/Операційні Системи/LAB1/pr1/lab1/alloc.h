#ifndef LAB1_ALLOCATOR_ALLOC_H
#define LAB1_ALLOCATOR_ALLOC_H

#include <cstddef>

namespace alloc {

struct Chunk {
  size_t next_chunk;
  size_t prev_chunk;
  bool free;

  Chunk(size_t next_chunk, size_t prev_chunk, bool free)
      : next_chunk(next_chunk), prev_chunk(prev_chunk), free(free) {}
};

class Allocator {
  void* pool;
 public:
  Allocator(size_t size);
  ~Allocator();

  // if available - allocates size bytes of memory from pool 
  // and returns a pointer to the first byte or returns
  // nullptr otherwise
  void *mem_alloc(size_t size);

  // Frees the memory pointed by ptr and also defragments
  // memory chunks
  void mem_free(void *ptr);

  // Extends or shrinks memory chunk pointed by ptr if available
  // or allocates new chunk of size and copies the previously pointed
  // data there while calling mem_free on the current ptr address
  void *mem_realloc(void *ptr, size_t size);

  void mem_dump();
};
}

#endif //LAB1_ALLOCATOR_ALLOC_H
