/*
 * Copyright © 2024 inpyjama.com. All Rights Reserved.
 * Author: Piyush Itankar <piyush@inpyjama.com>
 */

MEMORY {
    ROM : org = 0xA000 , len = 4k
    RAM : org = 0xC000 , len = 8k

}
/*_this_ia_a.varable_ = 10;
"this is a symbol" = 100;*/

a = 0x10;
SECTIONS {
    b = 20;
    .text : {
        *(.startup_code)
        *(.text)

        /*c = a + b;
        d = a - b;
        e = a * b;
        f = a / b;*/
    } > ROM AT > ROM

    .rodata : {
        *(.rodata)
        . = . + a + 16;


        
        _src_start_data_ = .;
    } > ROM AT > ROM

    .data : {
        _dst_start_data_ = .;
        *(.data)
        _dst_end_data_ = .;
    } > RAM AT > ROM

    .bss : {
        _bss_start_ = .;
        *(.bss)
        _bss_end_ = .;
    } > RAM AT > RAM

    /DISCARD/ : {
        *(*) /* discard everything */
    }

}