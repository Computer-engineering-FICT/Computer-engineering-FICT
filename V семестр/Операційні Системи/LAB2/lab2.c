#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <time.h>
#include <sys/queue.h>
#include "lab2.h"

int num_frames = 10; // Number of avaliable pages in page tables
int page_ref_upper_bound = 12; // Largest page reference
int max_page_calls = 1000; // Max number of page refs to test
int last_page_ref = -1; // Last ref
Clock_Data *clock_data;

int main()
{
        clock_data = create_algo_data_store();
        gen_page_refs();
        event_loop();
        cleanup();
        return 0;
}


void gen_page_refs()
{
        int num_refs = 0;
        LIST_INIT(&page_refs);
        Page_Ref *page = gen_ref();
        LIST_INSERT_HEAD(&page_refs, page, pages);
        while(num_refs < max_page_calls)
        { // generate a page ref up too max_page_calls and add to list
                LIST_INSERT_AFTER(page, gen_ref(), pages);
                page = page->pages.le_next;
                num_refs++;
        }
        return;
}

Page_Ref* gen_ref()
{
        Page_Ref *page = malloc(sizeof(Page_Ref));
        page->page_num = rand() % page_ref_upper_bound;
        return page;
}

Clock_Data *create_algo_data_store()
{
        Clock_Data *data = malloc(sizeof(Clock_Data));
        data->hits = 0;
        data->misses = 0;
        data->last_victim = NULL;
        /* Initialize Lists */
        LIST_INIT(&(data->page_table));
        LIST_INIT(&(data->victim_list));
        /* Insert at the page_table. */
        Frame *framep = create_empty_frame(0);
        LIST_INSERT_HEAD(&(data->page_table), framep, frames);
        /* Build the rest of the list. */
        size_t i = 0;
        for (i = 1; i < num_frames; ++i)
        {
                LIST_INSERT_AFTER(framep, create_empty_frame(i), frames);
                framep = framep->frames.le_next;
        }
        return data;
}

Frame* create_empty_frame(int index)
{
        Frame *framep = malloc(sizeof(Frame));
        framep->index = index;
        framep->page = -1;
        framep->r_bit = 0;
        return framep;
}

int event_loop()
{
        int counter = 0;
        while(counter < max_page_calls)
        {
                page(get_ref());
                ++counter;
        }
        print_summary();
        return 0;
}

int get_ref()
{
        if (page_refs.lh_first != NULL)
        { // pop Page_Ref off page_refs
                int page_num = page_refs.lh_first->page_num;
                LIST_REMOVE(page_refs.lh_first, pages);
                return page_num;
        }
        else
        {
                return rand() % page_ref_upper_bound;
        }
}

int page(int page_ref)
{
        last_page_ref = page_ref;
        CLOCK(clock_data);
        print_stats();

        return 0;
}

int add_victim(struct Frame_List *victim_list, struct Frame *frame)
{
        printf("Victim index: %d, Page: %d\n", frame->index, frame->page);
        struct Frame *victim = malloc(sizeof(Frame));
        *victim = *frame;
        victim->index = 1;
        LIST_INSERT_HEAD(victim_list, victim, frames);
        return 0;
}

int CLOCK(Clock_Data *data)
{
        static Frame *clock_hand = NULL;
        Frame *framep = data->page_table.lh_first;
        int fault = 0;
        /* Find target (hit), empty page slot (miss), or victim to evict (miss) */
        while(framep != NULL && framep->page > -1 && framep->page != last_page_ref)
                framep = framep->frames.le_next;

        if(framep != NULL)
        {
                if(framep->page == -1)
                {
                        framep->page = last_page_ref;
                        framep->r_bit = 0;
                        fault = 1;
                }
                else
                { // Found the page, update its R bit to 0
                        framep->r_bit = 0;
                }
        }
        else 
        {
                while(clock_hand == NULL || clock_hand->r_bit == 0)
                {
                        if(clock_hand == NULL)
                        {
                                clock_hand = data->page_table.lh_first;
                        }
                        else
                        {
                                clock_hand->r_bit = 1;
                                clock_hand = clock_hand->frames.le_next;
                        }
                }
                add_victim(&data->victim_list, clock_hand);
                clock_hand->page = last_page_ref;
                clock_hand->r_bit = 0;
                fault = 1;
        }
        if(fault == 1) data->misses++; else data->hits++;
        return fault;
}

int print_stats()
{
        print_summary();
        print_list(clock_data->page_table.lh_first, "Frame #", "Page Ref");
        return 0;
}

int print_summary()
{
        printf("Frames in Mem: %d, ", num_frames);
        printf("Hits: %d, ", clock_data->hits);
        printf("Misses: %d, ", clock_data->misses);
        printf("Hit Ratio: %f\n", (double)clock_data->hits/(double)(clock_data->hits+clock_data->misses));
        return 0;
}

int print_list(struct Frame *head, const char* index_label, const char* value_label)
{
        int colsize = 9, labelsize;
        struct Frame *framep;
        // Determine lanbel col size from text
        if (strlen(value_label) > strlen(index_label))
                labelsize = strlen(value_label) + 1;
        else
                labelsize = strlen(index_label) + 1;
        /* Forward traversal. */
        printf("%-*s: ", labelsize, index_label);
        for (framep = head; framep != NULL; framep = framep->frames.le_next)
        {
                printf("%*d", colsize, framep->index);
        }
        printf("\n%-*s: ", labelsize, value_label);
        for (framep = head; framep != NULL; framep = framep->frames.le_next)
        {
                if(framep->page == -1)
                        printf("%*s", colsize, "_");
                else
                        printf("%*d", colsize, framep->page);
        }
        printf("\n%-*s: ", labelsize, "R bit");
        for (framep = head; framep != NULL; framep = framep->frames.le_next)
        {
                printf("%*d", colsize, framep->r_bit);
        }
        printf("\n\n");
        return 0;
}

int cleanup()
{
    while (clock_data->page_table.lh_first != NULL)
    {
            LIST_REMOVE(clock_data->page_table.lh_first, frames);
    }
    while (clock_data->victim_list.lh_first != NULL)
    {
            LIST_REMOVE(clock_data->victim_list.lh_first, frames);
    }
    return 0;
}
