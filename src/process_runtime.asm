bits 32
org START_ADDRESS

    push ebx
    push edx
    sub esp, 4
    lea eax, [esp + 0x18]
    mov ebx, esp
    mov edx, dword [esp + 0x14]
    mov dword [esp], eax
    mov eax, dword [esp + 0x10]
    call LINK_ADDRESS_1
    add esp, 4
    pop edx
    pop ebx
    ret
