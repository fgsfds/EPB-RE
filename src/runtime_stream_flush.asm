; Watcom runtime code.
bits 32
org START_ADDRESS

    push ebx
    push edx
    mov edx, eax
    mov eax, dword [eax + 0x10]
    call TELL
    mov ebx, eax
    cmp eax, -1
    je short loc_003d
    test byte [edx + 0xc], 0x80
    je short loc_0026
    test byte [edx + 0xd], 0x10
    je short loc_0026
    mov eax, edx
    call LINK_ADDRESS_2
loc_0026:
    cmp dword [edx + 4], 0
    je short loc_003d
    test byte [edx + 0xd], 0x10
    je short loc_003a
    add ebx, dword [edx + 4]
    mov eax, ebx
    pop edx
    pop ebx
    ret
loc_003a:
    sub ebx, dword [edx + 4]
loc_003d:
    mov eax, ebx
    pop edx
    pop ebx
    ret
