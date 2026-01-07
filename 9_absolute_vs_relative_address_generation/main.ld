/*
 * Copyright © 2024 inpyjama.com. All Rights Reserved.
 * Author: Piyush Itankar <piyush@inpyjama.com>
 */

MEMORY {
    ROM : org = 0xA000 , len = 0x1000
    RAM : org = 0xC000 , len = 0x1000

}

rule_1 = 0xABCDEF;

SECTIONS {

    rule_2 = 0xC0FFEE;

    .text : {
        *(.startup_code)
        *(.text)
    } > ROM AT > ROM

    .rodata : {
        *(.rodata)
        _src_start_data_ = .;
    } > ROM AT > ROM

    another_rule2_ = 0xC0FFEE2;

    .data : {
        rule_3 = 4;
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