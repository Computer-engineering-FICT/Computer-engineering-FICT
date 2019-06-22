#include <iostream>
#include "debug.h"
#include "alloc.h"

using alloc::Chunk;

void print_chunk(const Chunk &chunk) {
  std::cout << "{ "
            << chunk.next_chunk
            << ", " << chunk.prev_chunk
            << ", " << chunk.free
            << " }\n";
}

void print_chunk(void *ptr) {
  print_chunk(*(Chunk *) (ptr - sizeof(Chunk)));
}

void print_chunks(void *pool) {
  auto *chunk = (Chunk *) pool;
  print_chunk(*(Chunk *) (pool - sizeof(Chunk)));
  while (chunk->next_chunk) {
    print_chunk(*chunk);
    chunk = (Chunk *) (((void *) chunk) + chunk->next_chunk + sizeof(Chunk));
  }
  print_chunk(*chunk);

  std::cout << std::endl;
}

