#pragma once

class Allocator
{

public:

	Allocator(size_t memorySize);
	~Allocator();

	void mem_dump();
	void *mem_alloc(size_t size);
	void mem_free(void *ptr);
	void *mem_realloc(void *ptr, size_t size);

private:

	size_t memorySize;
	void *memory;

};
