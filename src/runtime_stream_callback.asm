; Watcom runtime code.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    mov ebx, edx
    mov edx, dword [eax]
    lea ecx, [edx + 1]
    mov dword [eax], ecx
    mov byte [edx], bl
    inc dword [eax + 0x10]
    pop ecx
    pop ebx
    ret
    push ecx
    push esi
    mov esi, eax
    mov ecx, LINK_ADDRESS_1
    call PRTF
    mov byte [esi + eax], 0
    pop esi
    pop ecx
    ret
    jmp near LINK_ADDRESS_3
    jmp near LINK_ADDRESS_4
