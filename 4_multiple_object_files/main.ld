/*
 * Copyright © 2024 inpyjama.com. All Rights Reserved.
 * Author: Piyush Itankar <piyush@inpyjama.com>
 */

MEMORY {
    junaid : org = 0xA000 , len = 0x1000
}

SECTIONS {
    .text : {
        *(.text)
    } > junaid

    .data : {
        *(.data)
    } > junaid

    .bss : {
        *(.bss)
    } > junaid


    /DISCARD/ : {
        *(*) /* discard everything */
    }

}