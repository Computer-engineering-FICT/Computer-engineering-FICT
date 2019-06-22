#ifndef PAGESIM_H
#define PAGESIM_H

// List for page tables and victim lists
LIST_HEAD(Page_Ref_List, Page_Ref) page_refs;
// List for page tables and victim lists
LIST_HEAD(Frame_List, Frame);

// stuct to hold Frame info
typedef struct Page_Ref
{
        LIST_ENTRY(Page_Ref) pages;
        int page_num;
} Page_Ref;

typedef struct Frame
{
        LIST_ENTRY(Frame) frames;
        int index; 
        int page; // page frame points to, -1 is empty
        int r_bit; // R bit
} Frame;

typedef struct {
        int hits; // number of times page was found in page table
        int misses; // number of times page wasn't found in page table
        struct Frame_List page_table; // List to hold frames in page table
        struct Frame_List victim_list; // List to hold frames that were replaced in page table
        Frame *last_victim; // Holds last frame used as a victim to make inserting to victim list faster
} Clock_Data;

void gen_page_refs();
Page_Ref* gen_ref();
Clock_Data *create_algo_data_store(); // returns empty algorithm data
Frame *create_empty_frame(int index);
int cleanup(); 
int event_loop(); 
int page(int page_ref); // page with page ref
int get_ref(); // get next page ref however you like
int add_victim(struct Frame_List *victim_list, struct Frame *frame); // add victim frame to a victim list

int print_list(struct Frame *head, const char* index_label, const char* value_label); 
int print_stats(); 
int print_summary(); 

int CLOCK(Clock_Data *data);

#endif
