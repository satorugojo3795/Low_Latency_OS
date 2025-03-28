[org 0x7c00]           ; BIOS loads bootloader here

mov ah, 0x0E           ; BIOS teletype output function

start:
    mov si, message

print_char:
    lodsb              ; Load byte at SI into AL, increment SI
    or al, al          ; Check for null terminator
    jz hang
    int 0x10           ; BIOS interrupt to print character
    jmp print_char

hang:
    cli                ; Clear interrupts
    hlt                ; Halt CPU
    jmp hang           ; Infinite loop

message db "Hello from Bootloader!", 0

times 510-($-$$) db 0  ; Fill rest with zeros
dw 0xAA55              ; Bootable magic number
