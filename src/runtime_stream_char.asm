; Watcom runtime code.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
loc_0003:
    mov dl, byte [eax]
    inc dl
    and edx, 0xff
    mov dl, byte [edx + ISTABLE]
    and dl, 2
    and edx, 0xff
    je short loc_0021
    inc eax
    jmp short loc_0003
loc_0021:
    mov cl, byte [eax]
    mov dl, cl
    cmp edx, 0x2b
    je short loc_002f
    cmp edx, 0x2d
    jne short loc_0030
loc_002f:
    inc eax
loc_0030:
    xor ebx, ebx
loc_0032:
    mov dl, byte [eax]
    inc dl
    and edx, 0xff
    mov dl, byte [edx + ISTABLE]
    and dl, 0x20
    and edx, 0xff
    je short loc_005c
    imul ebx, ebx, 0xa
    xor edx, edx
    mov dl, byte [eax]
    add ebx, edx
    inc eax
    sub ebx, 0x30
    jmp short loc_0032
loc_005c:
    xor eax, eax
    mov al, cl
    cmp eax, 0x2d
    jne short loc_0067
    neg ebx
loc_0067:
    mov eax, ebx
    pop edx
    pop ecx
    pop ebx
    ret
