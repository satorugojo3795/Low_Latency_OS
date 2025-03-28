section .multiboot2_header
align 8
multiboot2_header_start:
    dd 0xe85250d6
    dd 0
    dd multiboot2_header_end - multiboot2_header_start
    dd -(0xe85250d6 + 0 + (multiboot2_header_end - multiboot2_header_start))

    dw 0
    dw 0
    dd 8
multiboot2_header_end:

section .text
global _start
extern kernel_main

_start:
    call kernel_main
    hlt
