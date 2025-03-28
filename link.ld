ENTRY(_start)

SECTIONS
{
  . = 0x100000;

  .text : {
    *(.text*)           /* put _start here first */
  }

  .multiboot2_header : {
    KEEP(*(.multiboot2_header))  /* move header AFTER .text */
  }

  .rodata : {
    *(.rodata*)
  }

  .data : {
    *(.data*)
  }

  .bss : {
    *(.bss*)
  }
}
