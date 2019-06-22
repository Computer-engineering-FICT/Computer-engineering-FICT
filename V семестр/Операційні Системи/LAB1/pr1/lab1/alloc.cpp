#include <cstring>
#include <algorithm>
#include "alloc.h"
#include "debug.h"

using alloc::Chunk;

size_t align4(size_t size) {
  return size % 4 ? size + (4 - size % 4) : size;
}

void *assign_chunk(void *ptr, const Chunk &chunk) {
  memcpy(ptr, &chunk, sizeof(Chunk));
  return ptr;
}

Chunk *move_chunk(Chunk *chunk, size_t amount = sizeof(Chunk)) {
  return (Chunk *) ((void *) chunk + amount);
}

Chunk *get_next_chunk(Chunk *chunk) {
  return move_chunk(chunk, chunk->next_chunk + sizeof(Chunk));
}

Chunk *get_prev_chunk(Chunk *chunk) {
  return move_chunk(chunk, -chunk->prev_chunk - sizeof(Chunk));
}

void merge_right(Chunk *left, Chunk *right) {
  left->next_chunk += right->next_chunk + sizeof(Chunk);
  get_next_chunk(right)->prev_chunk = left->next_chunk;

  if (!right->free) {
    memmove(move_chunk(left), move_chunk(right), right->next_chunk);
    left->free = false;
  }
}

void check_split_chunk(Chunk* chunk, size_t size) {
  if (chunk->next_chunk <= size + sizeof(Chunk)) {
    return;
  }

  auto *next_chunk = get_next_chunk(chunk);

  size_t splitted_chunk_size = chunk->next_chunk - size - sizeof(Chunk);
  chunk->next_chunk = size;

  auto *splitted_chunk = get_next_chunk(chunk);
  assign_chunk(splitted_chunk, {splitted_chunk_size, size, true});

  next_chunk->prev_chunk = splitted_chunk_size;
  if (next_chunk->free) merge_right(splitted_chunk, next_chunk);
}

alloc::Allocator::Allocator(size_t size) {
  size = align4(size);

  void* mem = new char[size];

  size_t main_chunk = size - 3 * sizeof(Chunk);

  // init left and right bounds
  assign_chunk(mem, {0, 0, false});
  assign_chunk(mem + size - sizeof(Chunk), {0, main_chunk, false});

  // init first chunk
  assign_chunk(mem + sizeof(Chunk), {main_chunk, 0, true});

  pool = mem + sizeof(Chunk);
}

alloc::Allocator::~Allocator() {
  delete[] (pool - sizeof(Chunk));
}

void *alloc::Allocator::mem_alloc(size_t size) {
  size = align4(size);

  auto *chunk = (Chunk *) pool;
  while (chunk->next_chunk > 0) {
    if (chunk->free && chunk->next_chunk >= size) {
      check_split_chunk(chunk, size);
      chunk->free = false;
      return move_chunk(chunk);
    }
    chunk = get_next_chunk(chunk);
  }
  return nullptr;
}

void alloc::Allocator::mem_free(void *ptr) {
  auto *chunk = (Chunk *) (ptr - sizeof(Chunk));
  chunk->free = true;

  auto *prev_chunk = get_prev_chunk(chunk);
  auto *next_chunk = get_next_chunk(chunk);
  if (next_chunk->free) merge_right(chunk, next_chunk);
  if (prev_chunk->free) merge_right(prev_chunk, chunk);
}

void *alloc::Allocator::mem_realloc(void *ptr, size_t size) {
  size = align4(size);

  auto check_merge = [size](Chunk *adjacent, Chunk *main) {
    return adjacent->free
        && adjacent->next_chunk + main->next_chunk >= size + sizeof(Chunk);
  };

  if (!ptr) return mem_alloc(size);

  auto *chunk = (Chunk *) (ptr - sizeof(Chunk));
  auto *prev_chunk = get_prev_chunk(chunk);
  auto *next_chunk = get_next_chunk(chunk);

  if (chunk->next_chunk > size + sizeof(Chunk)) {
    check_split_chunk(chunk, size);
    return ptr;
  } else if (check_merge(prev_chunk, chunk)) {
    merge_right(prev_chunk, chunk);
    check_split_chunk(prev_chunk, size);
    return move_chunk(prev_chunk);
  } else if (check_merge(next_chunk, chunk)) {
    merge_right(chunk, next_chunk);
    check_split_chunk(chunk, size);
    return move_chunk(chunk);
  } else {
    auto *new_ptr = mem_alloc(size);
    if (new_ptr) {
      memcpy(new_ptr, ptr, std::min(chunk->next_chunk, size));
      mem_free(ptr);
      return new_ptr;
    }
  }
  return nullptr;
}

void alloc::Allocator::mem_dump() {
  print_chunks(pool);
}
