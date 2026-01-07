/*
 * Copyright © 2024 inpyjama.com. All Rights Reserved.
 * Author: Piyush Itankar <piyush@inpyjama.com>
 */

int uninit_global;
int init_global = 18;

int foo(int local) {
   return local + uninit_global + init_global;
}

// symbol declarations for linker defined symbols
extern char _src_start_data_;
extern char _dst_start_data_;
extern char _dst_end_data_;

// symbols for .bss section (start and end)
extern _bss_start_;
extern _bss_end_;

// function to copy .data section from ROM to RAM
void __attribute__((section(".startup_code"))) copy_data_ROM_2_RAM() {
    // pointers for .data section
    char* src = &_src_start_data_;
    char* dst = &_dst_start_data_;
    char* dst_end = &_dst_end_data_;
    // pointers for .bss section
    char* bss_start_ptr = &_bss_start_;
    char* bss_end_ptr = &_bss_end_;

    // Copy .data section from ROM to RAM
    while (dst != dst_end) {
        *dst = *src;
         dst++;
         src++;
    }
    // Initialize .bss section to zero
    while (bss_start_ptr != bss_end_ptr) {
        *bss_start_ptr = 0;
         bss_start_ptr++;
    }
}