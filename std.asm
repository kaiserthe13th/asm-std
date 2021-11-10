%define line 0xa
%define stdout 1

%macro write 3
    mov rax, 1
    mov rdi, %1 ; where to write
    mov rsi, %2 ; what to write
    mov rdx, %3 ; the length of what we'll write
    syscall
%endm

%macro print 1
    mov rdi, %1
    call _strlen
    mov rdx, rax
    mov rdi, stdout
    mov rax, 1
    mov rsi, %1
    syscall
%endm

%macro exit 1
    mov rax, 60
    mov rdi, %1
    syscall
%endm

_strlen:
    ; save register we will use
    push rbx
    push rcx

    mov rbx, rdi

    xor al, al ; is the byte null

    mov rcx, 0xffffffff

    repne scasb ; while [rdi] != al, keep going
    sub rdi, rdx ; rbx -= dist
    sub rdi, rbx ; len = rdi - rbx
    sub rdi, 1

    mov rax, rdi ; mov len to rax

    ; restore used registers
    pop rbx
    pop rcx
    
    ret ; end function

