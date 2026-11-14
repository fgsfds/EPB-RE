; Watcom exit handler registration and dispatch.
bits 32
org START_ADDRESS

run_exit_handlers:
    push ebx
    push edx
    sub esp, 4
    mov ebx, dword [LINK_ADDRESS_1]
    cmp ebx, 0x21
    je short local_035
    mov dword [LINK_ADDRESS_1], 0x21
    mov edx, ebx
    shl edx, 2
local_01f:
    test edx, edx
    je short local_035
    mov eax, dword [edx + LINK_ADDRESS_2]
    sub edx, 4
    mov dword [esp], eax
    dec ebx
    call dword [esp]
    jmp short local_01f
local_035:
    add esp, 4
    pop edx
    pop ebx
    ret
atexit:
    push ebx
    push ecx
    push edx
    mov ebx, eax
    mov edx, LINK_ADDRESS_3
    mov ecx, dword [LINK_ADDRESS_1]
    mov dword [LINK_ADDRESS_4], edx
    cmp ecx, 0x20
    jge short local_06e
    mov eax, ecx
    xor eax, ecx
    lea edx, [ecx + 1]
    mov dword [ecx*4 + LINK_ADDRESS_5], ebx
    mov dword [LINK_ADDRESS_1], edx
    pop edx
    pop ecx
    pop ebx
    ret
local_06e:
    mov eax, 0xffffffff
    pop edx
    pop ecx
    pop ebx
    ret
