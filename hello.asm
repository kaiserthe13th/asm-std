global _start

%include "std.asm"

section .text

_start:
    print(msg)
    exit(0)
    hlt

section .data
    msg db "Hello, World!", line
