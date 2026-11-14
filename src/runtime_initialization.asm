bits 32
org START_ADDRESS

    xor eax, eax
    ret
    push ebx
    push ecx
    cmp dword [LINK_ADDRESS_1], LINK_ADDRESS_2
    je short local_02c
    mov ebx, LINK_ADDRESS_3
    mov ecx, LINK_ADDRESS_2
    mov dword [LINK_ADDRESS_4], ebx
    call LINK_ADDRESS_5
    mov dword [LINK_ADDRESS_1], ecx
local_02c:
    call LINK_ADDRESS_6
    pop ecx
    pop ebx
    ret
