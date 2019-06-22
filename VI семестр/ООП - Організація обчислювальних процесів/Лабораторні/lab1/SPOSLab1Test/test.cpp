/*
 * test.cpp
 *
 *  Created on: 22 февр. 2014
 *      Author: Кукса Вячеслав Викторович, ИВ-12, ФИОТ, НТУУ "КПИ"
 */

#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MAIN
#define BOOST_TEST_MODULE MemoryAllocatorTest

#include <boost/test/unit_test.hpp>

#include <stdlib.h>
#include <stdio.h>
#include <limits.h>

#include "allocator.hpp"
#include "checksum.hpp"

#define MEM_POOL_SIZE 4096
#define BLOCKS_COUNT 64
#define MAX_BLOCK_SIZE 32
#define USAGE_CYCLES 128

void create_reference_data(unsigned char* data, size_t size)
{
	// Формування еталонного блоку даних
	for (unsigned int i = 0; i < size; i++)
	{
		data[i] = rand() % UCHAR_MAX;
	}
}

bool check_allocate_block(void* &ptr, size_t &size, size_t max_size, void* data)
{
	size = rand() % max_size + 1;
	ptr = mem_alloc(size);
	// Перевірка успішності виділення пам’яті
	if (!ptr)
	{
		return false;
	}
	// Копіювання фрагмента еталонного блоку даних у виділену пам’ять
	memcpy(ptr, data, size);
	return true;
}

bool check_read_block(void* ptr, size_t size, void* reference)
{
	// Перевірка цілісності даних у блоці пам’яті за контрольною сумою
	uint_least32_t ref_checksum = checksum((unsigned char*) reference, size);
	uint_least32_t blk_checksum = checksum((unsigned char*) ptr, size);
	return ref_checksum == blk_checksum;
}

bool check_reallocate_block(void* &ptr,
		size_t &new_size, size_t size, size_t max_size)
{
	void* old_ptr = ptr;
	// Зміна розмірів блоку пам’яті
	new_size = rand() % max_size + 1;
	ptr = mem_realloc(ptr, new_size);
	// Перевірка успішності зміни розміру блоку пам’яті
	if (!ptr)
	{
		ptr = old_ptr;
		new_size = size;
		return false;
	}
	return true;
}

bool check_reallocated_block_data(void* ptr, size_t new_size, size_t size, void* reference)
{
	if (new_size < size)
	{
		size = new_size;
	}
	if (check_read_block(ptr, size, reference))
	{
		return true;
	}
	return false;
}

BOOST_AUTO_TEST_SUITE ( AllocatorTestSuite )

BOOST_AUTO_TEST_CASE ( testMemAlloc )
{
	const int blocks_n = BLOCKS_COUNT;
	const size_t max_block_size = MAX_BLOCK_SIZE;
	void* blocks_ptr[blocks_n];
	size_t blocks_size[blocks_n];
	unsigned char block_data[max_block_size];

	srand(time(NULL));

	create_reference_data(block_data, max_block_size);

	// Ініціалізація аллокатора пам’яті
	mem_init(MEM_POOL_SIZE);
	for (unsigned int i = 0; i < blocks_n; i++)
	{
		BOOST_REQUIRE (check_allocate_block(blocks_ptr[i], blocks_size[i], max_block_size, block_data));
	}
	for (unsigned int i = 0; i < blocks_n; i++)
	{
		BOOST_REQUIRE (check_read_block(blocks_ptr[i], blocks_size[i], block_data));
	}
	mem_dump(stdout);
	for (int i = 0; i < blocks_n; i++)
	{
		// Звільнення виділеного блоку пам’яті
		mem_free(blocks_ptr[i]);
	}
	mem_dump(stdout);
	// Завершення роботи аллокатора пам’яті
	mem_close();
}

BOOST_AUTO_TEST_CASE ( testMemRealloc )
{
	const int blocks_n = BLOCKS_COUNT;
	const size_t max_block_size = MAX_BLOCK_SIZE;
	void* blocks_ptr[blocks_n];
	size_t blocks_size[blocks_n];
	size_t rel_block_size;
	unsigned char block_data[max_block_size];

	srand(time(NULL));
	create_reference_data(block_data, max_block_size);

	// Ініціалізація алокатора пам’яті
	mem_init(MEM_POOL_SIZE);
	for (unsigned int i = 0; i < blocks_n; i++)
	{
		BOOST_REQUIRE (check_allocate_block(blocks_ptr[i], blocks_size[i], max_block_size, block_data));
		BOOST_CHECK (check_reallocate_block(blocks_ptr[i], rel_block_size, blocks_size[i], max_block_size));
		BOOST_REQUIRE (check_reallocated_block_data(blocks_ptr[i], rel_block_size, blocks_size[i], block_data));
		blocks_size[i] = rel_block_size;
		// Заповнення виділеної пам’яті фрагментом еталонного блоку даних
		memcpy(blocks_ptr[i], block_data, blocks_size[i]);

	}
	for (unsigned int i = 0; i < blocks_n; i++)
	{
		BOOST_REQUIRE (check_read_block(blocks_ptr[i], blocks_size[i], block_data));
	}
	for (int i = 0; i < blocks_n; i++)
	{
		// Звільнення виділеного блоку пам’яті
		mem_free(blocks_ptr[i]);
	}
	// Завершення роботи аллокатора пам’яті
	mem_close();
}

BOOST_AUTO_TEST_CASE ( testMemUsage )
{
	const int iterations = USAGE_CYCLES;
	const int blocks_n = BLOCKS_COUNT;
	const size_t max_block_size = MAX_BLOCK_SIZE;
	void* blocks_ptr[blocks_n];
	size_t blocks_size[blocks_n];
	size_t rel_block_size;
	unsigned char block_data[max_block_size];

	srand(time(NULL));
	create_reference_data(block_data, max_block_size);

	// Ініціалізація алокатора пам’яті
	mem_init(MEM_POOL_SIZE);
	for (unsigned int i = 0; i < blocks_n; i++)
	{
		blocks_ptr[i] = 0;
		blocks_size[i] = 0;
	}
	for (int step = 0; step < iterations; step++)
	{
		// Вибір блоку пам’яті, що використовується на поточному кроці тесту
		int i = rand() % blocks_n;
		if (!blocks_ptr[i])
		{
			// Вказівник не ініціалізовано
			// Виділення блоку пам’яті і ініціалізація вказівника його адресою
			BOOST_REQUIRE(check_allocate_block(blocks_ptr[i], blocks_size[i], max_block_size, block_data));
		} else
		{
			// Вказівник ініціалізовано адресою блоку пам’яті
			// Вибір операції, що необхідно виконати над блоком
			int action = rand() % 3;
			switch (action)
			{
				case 0:
				{
					// Читання блоку пам’яті
					BOOST_REQUIRE(check_read_block(blocks_ptr[i], blocks_size[i], block_data));
					break;
				}
				case 1:
				{
					// Звільнення блоку пам’яті
					mem_free(blocks_ptr[i]);
					blocks_ptr[i] = 0;
					blocks_size[i] = 0;
					break;
				}
				case 2:
				{
					// Зміна розміру блоку пам’яті
					BOOST_REQUIRE (check_allocate_block(blocks_ptr[i], blocks_size[i], max_block_size, block_data));
					BOOST_CHECK (check_reallocate_block(blocks_ptr[i], rel_block_size, blocks_size[i], max_block_size));
					BOOST_REQUIRE (check_reallocated_block_data(blocks_ptr[i], rel_block_size, blocks_size[i], block_data));
					blocks_size[i] = rel_block_size;
					// Заповнення виділеної пам’яті фрагментом еталонного блоку даних
					memcpy(blocks_ptr[i], block_data, blocks_size[i]);
					break;
				}
			}
		}
	}
	for (unsigned int i = 0; i < blocks_n; i++)
	{
		if (blocks_ptr[i])
		{
			BOOST_REQUIRE (check_read_block(blocks_ptr[i], blocks_size[i], block_data));
		}
	}
	for (int i = 0; i < blocks_n; i++)
	{
		// Звільнення виділеного блоку пам’яті
		if (blocks_ptr[i])
		{
			mem_free(blocks_ptr[i]);
		}
	}
	// Завершення роботи аллокатора пам’яті
	mem_close();
}

BOOST_AUTO_TEST_SUITE_END ()
