/*
 * Copyright © 2024 inpyjama.com. All Rights Reserved.
 * Author: Piyush Itankar <piyush@inpyjama.com>
 */

MEMORY {
    ROM : org = 0xA000 , len = 0x1000
    RAM : org = 0xC000 , len = 0x1000

}

SECTIONS {
    .text : {
        *(.startup_code)
        *(.text)
    } > ROM AT > ROM

    .rodata : {
        *(.rodata)
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