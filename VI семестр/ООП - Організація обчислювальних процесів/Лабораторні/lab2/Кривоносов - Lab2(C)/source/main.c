#include <stdio.h>
#include "mem_alloc/mem_types.h"
#include "mem_alloc/mem_alloc.h"

#include <time.h>
#include <stdint.h>

void test1(void)
{
    mem_dump();
    void* mem_area1 = mem_alloc(256);
    printf("Block Address:\t%p \n \n",mem_area1);
    mem_dump();
    void* mem_area2 = mem_alloc(3000);
    printf("Block Address:\t%p \n \n",mem_area2);

    mem_dump();

    mem_free(mem_area2);
    mem_dump();



}


size_t i;




int main(int argc, char *argv[])
{
    test1();
    return 0;
}
