/*
 * allocator.cpp
 *
 *  Created on: 22 февр. 2014
 *      Author: Кукса Вячеслав Викторович, ИВ-12, ФИОТ, НТУУ "КПИ"
 */

#include <malloc.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

struct mem_header {
	size_t prev_size: 31;
	size_t size : 31;
	bool free: 1;
};

const size_t HEADER_SIZE = sizeof(mem_header);
size_t pool_size;
uint8_t* pool = NULL;
uint8_t* head = pool;

uint8_t* ceil_address(uint8_t* ptr)
{
	unsigned long addr = (unsigned long) ptr;
	unsigned long addr_mod = addr % 4;
	return (uint8_t*) (addr + (addr_mod ? (4 - addr_mod) : 0));
}

size_t ceil_size(size_t size)
{
	size_t size_mod = size % 4;
	return (size + (size_mod ? (4 - size_mod) : 0));
}

uint8_t* floor_address(uint8_t* ptr)
{
	unsigned long addr = (unsigned long) ptr;
	return (uint8_t*) (addr - addr % 4);
}

bool is_valid_pointer(uint8_t* ptr)
{
	return ((ptr >= pool) && (ptr < (pool + pool_size)));
}

uint8_t* next_block(uint8_t* ptr)
{
	mem_header* header = (mem_header*) ptr;
	return ptr + HEADER_SIZE + header->size;
}

uint8_t* prev_block(uint8_t* ptr)
{
	mem_header* header = (mem_header*) ptr;
	return ptr - header->prev_size - HEADER_SIZE;
}

mem_header* block_header(void* ptr)
{
	return (mem_header*) ((uint8_t*) ptr - HEADER_SIZE);
}

bool is_bound_block(uint8_t* ptr)
{
	mem_header* header = (mem_header*) ptr;
	return (header->size == 0);
}

void merge_blocks(mem_header* higher, mem_header* lower)
{
	lower->size = lower->size + HEADER_SIZE + higher->size;
	higher = (mem_header*) next_block((uint8_t*) higher);
	higher->prev_size = lower->size;
}

void shrink_block(mem_header* header, size_t size)
{
	mem_header* neighbor_header = (mem_header*) next_block((uint8_t*) header);
	size_t current_size = header->size;
	header->size = size;
	header = (mem_header*) next_block((uint8_t*) header);
	header->prev_size = size;
	header->size = current_size - size - HEADER_SIZE;
	header->free = true;
	if (neighbor_header->free)
	{
		merge_blocks(neighbor_header, header);
	}
}

void mem_init(size_t pool_sz)
{
	if (!pool)
	{
		pool_size = (size_t) floor_address((uint8_t*) pool_sz);
		pool = (uint8_t*) malloc(pool_size + 4);
		uint8_t* aligned_pool = ceil_address(pool);
		pool_size -= (aligned_pool - pool);
		pool = aligned_pool;
		memset(pool, 0, pool_size);

		const size_t available_pool_size = pool_size - 3 * HEADER_SIZE;
		mem_header *header;
		// Ініціалізація нижнього граничного блоку
		header = (mem_header*) pool;
		header->free = false;
		header->prev_size = 0;
		header->size = 0;
		// Ініціалізація головного вільного блоку
		header = (mem_header*) (pool + HEADER_SIZE);
		header->free = true;
		header->prev_size = 0;
		header->size = available_pool_size;
		head = (uint8_t*) header;
		// Ініціалізація верхнього граничного блоку
		header = (mem_header*) (pool + pool_size - HEADER_SIZE);
		header->free = false;
		header->prev_size = available_pool_size;
		header->size = 0;
	}
}

void mem_close(void)
{
	if (pool)
	{
		free(pool);
		pool = NULL;
	}
}

void* mem_alloc(size_t size)
{
	size_t aligned_size = ceil_size(size);
	uint8_t* addr = head;
	mem_header* header = (mem_header*) addr;
	while (is_valid_pointer(addr) && !is_bound_block(addr))
	{
		if (header->free)
		{
			if ((header->size > aligned_size)
					&& (header->size - aligned_size) <= HEADER_SIZE)
			{
				header->free = false;
				return (header + 1);
			} else
			{
				if (header->size > (aligned_size + HEADER_SIZE))
				{
					uint8_t* block_tail_ptr = ((uint8_t*) header) + HEADER_SIZE + aligned_size;
					size_t tail_size = header->size - aligned_size - HEADER_SIZE;
					mem_header* tail_header = (mem_header*) block_tail_ptr;
					header->free = false;
					header->size = aligned_size;
					tail_header->free = true;
					tail_header->size = tail_size;
					tail_header->prev_size = header->size;
					tail_header = (mem_header*) next_block((uint8_t*) tail_header);
					tail_header->prev_size = tail_size;
					return (header + 1);
				}
			}
		}
		addr = next_block(addr);
		header = (mem_header*) addr;
	}
	return NULL;
}

void mem_free(void* ptr)
{
	mem_header* header = block_header(ptr);
	header->free = true;
	// Перевірка вільності верхнього сусіднього блоку
	mem_header* neighbor_header = (mem_header*) next_block((uint8_t*) header);
	if (neighbor_header->free)
	{
		// Об’єднання поточного і верхнього сусіднього блоку, якщо він вільний
		merge_blocks(neighbor_header, header);
	}
	// Перевірка вільності нижнього сусіднього блоку
	neighbor_header = (mem_header*) prev_block((uint8_t*) header);
	if (neighbor_header->free)
	{
		// Об’єднання поточного і нижнього сусіднього блоку, якщо він вільний
		merge_blocks(header, neighbor_header);
	}
}

void* mem_realloc(void* ptr, size_t size)
{
	mem_header* header = block_header(ptr);
	mem_header* upper_header = (mem_header*) next_block((uint8_t*) header);
	mem_header* lower_header = (mem_header*) prev_block((uint8_t*) header);
	size_t aligned_size = ceil_size(size);
	size_t current_size = header->size;
	long delta_size = aligned_size - current_size;

	if ((delta_size < 0) && (abs(delta_size) <= HEADER_SIZE))
	{
		return ptr;
	} else
	{
		if (delta_size < 0)
		{
			shrink_block(header, aligned_size);
			return ptr;
		} else
		{
			// Перевірка можливості розширення блоку за рахунок нижнього сусіднього блоку
			delta_size =
					aligned_size - (current_size + lower_header->size + HEADER_SIZE);
			if ((lower_header->free)
					&& (delta_size < 0) && (abs(delta_size) >= HEADER_SIZE))
			{
				// Нижній сусідній блок вільний і сумарний розмір є достатнім
				merge_blocks(header, lower_header);
				lower_header->free = false;
				shrink_block(lower_header, aligned_size);
				memcpy(lower_header + 1, ptr, current_size);
				return (lower_header + 1);
			}
			// Перевірка можливості розширення блоку за рахунок верхнього сусіднього блоку
			delta_size =
					aligned_size - (current_size + upper_header->size + HEADER_SIZE);
			if ((upper_header->free)
					&& (delta_size < 0) && (abs(delta_size) >= HEADER_SIZE))
			{
				// Верхній сусідній блок вільний і сумарний розмір є достатнім
				merge_blocks(upper_header, header);
				header->free = false;
				shrink_block(header, aligned_size);
				return ptr;
			}
			// Перевірка можливості розширення блоку за рахунок одразу двох сусідніх блоків
			delta_size =
					aligned_size - (current_size + lower_header->size + upper_header->size + 2 * HEADER_SIZE);
			if ((upper_header->free) && (lower_header->free)
					&& (delta_size < 0) && (delta_size >= HEADER_SIZE))
			{
				// Сусідні блоки вільні і сумарний розмір є достатнім
				merge_blocks(header, lower_header);
				merge_blocks(upper_header, lower_header);
				lower_header->free = false;
				shrink_block(lower_header, aligned_size);
				memcpy(lower_header + 1, ptr, current_size);
				return (lower_header + 1);
			}
			// Розширити блок на місці не вдалося
			void* resized_ptr = mem_alloc(size);
			if (resized_ptr)
			{
				size_t trans_size = block_header(ptr)->size;
				if (trans_size > size)
				{
					trans_size = size;
				}
				memcpy(resized_ptr, ptr, trans_size);
				mem_free(ptr);
			}
			return resized_ptr;
		}
	}

}

void mem_dump(FILE* stream)
{
	uint8_t* addr = head;
	mem_header* header = (mem_header*) addr;
	fprintf(stream, "Memory status:\n");
	while (is_valid_pointer(addr) && !is_bound_block(addr))
	{
		fprintf(stream, "%lx; %lu; %lu; %s\n",
				header,
				header->size,
				header->prev_size,
				header->free ? "free" : "busy");
		addr = next_block(addr);
		header = (mem_header*) addr;
	}
}
