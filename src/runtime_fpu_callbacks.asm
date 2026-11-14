; Watcom runtime code.
bits 32
org START_ADDRESS

    push ebx
    push edx
    mov edx, LINK_ADDRESS_1
    mov ebx, LINK_ADDRESS_2
    mov dword [LINK_ADDRESS_3], edx
    mov dword [EFG_SCANF], ebx
    pop edx
    pop ebx
    ret
