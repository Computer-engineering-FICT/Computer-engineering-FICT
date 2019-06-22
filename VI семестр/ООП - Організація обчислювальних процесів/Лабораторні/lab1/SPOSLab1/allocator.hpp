/*
 * allocator.hpp
 *
 *  Created on: 22 февр. 2014
 *      Author: Кукса Вячеслав Викторович, ИВ-12, ФИОТ, НТУУ "КПИ"
 */

#ifndef ALLOCATOR_HPP_
#define ALLOCATOR_HPP_

void mem_init(size_t pool_size);

void mem_close(void);

void* mem_alloc(size_t);

void* mem_realloc(void*, size_t);

void mem_free(void*);

void mem_dump(FILE*);

#endif /* ALLOCATOR_HPP_ */
