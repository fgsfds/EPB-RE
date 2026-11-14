; Watcom common initialization and runtime callback registration.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    xor eax, eax
    mov edx, 0x8000
    mov al, byte [LINK_ADDRESS_1]
    mov dword [LINK_ADDRESS_2], edx
    cmp eax, 2
    jl short local_021
    cmp eax, 8
    jle short local_028
local_021:
    mov eax, 1
    jmp short local_02a
local_028:
    xor eax, eax
local_02a:
    test eax, eax
    je short local_063
    call LINK_ADDRESS_3
    cmp eax, 1
    jne short local_063
    mov edx, LINK_ADDRESS_4
    mov eax, LINK_ADDRESS_5
    sub edx, LINK_ADDRESS_5
    mov di, dx
    shr edx, 0x10
    mov si, dx
    mov bx, ax
    shr eax, 0x10
    mov cx, ax
    mov ax, 0x600
    int 0x31
    sbb ax, ax
local_063:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    push edx
    mov edx, eax
    mov eax, dword [LINK_ADDRESS_6]
    mov dword [LINK_ADDRESS_6], edx
    pop edx
    ret
