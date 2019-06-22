#ifndef LAB1_ALLOCATOR_DEBUG_H
#define LAB1_ALLOCATOR_DEBUG_H

#include "alloc.h"

void print_chunk(const alloc::Chunk &chunk);

void print_chunk(void *ptr);

void print_chunks(void *pool);

#endif //LAB1_ALLOCATOR_DEBUG_H
