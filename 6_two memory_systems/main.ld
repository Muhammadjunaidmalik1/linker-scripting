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
        *(.text)
    } > ROM AT > ROM

    .rodata : {
        *(.rodata)
    } > ROM AT > ROM

    .data : {
        *(.data)
    } > RAM AT > ROM

    .bss : {
        *(.bss)
    } > RAM AT > RAM

    /DISCARD/ : {
        *(*) /* discard everything */
    }

}