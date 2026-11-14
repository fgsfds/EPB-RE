; Score overlay setup and drawing.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov bx, word [CONNECTHEAD]
    xor esi, esi
    jmp short loc_0026
loc_0014:
    cmp bx, si
    jle short loc_001b
    mov esi, ebx
loc_001b:
    movsx ebx, bx
    mov bx, word [nosplit ebx*2 + CONNECTPOINT2]
loc_0026:
    test bx, bx
    jge short loc_0014
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xda
    push 0
    push 0
    mov ebx, 0x10040
    xor ecx, ecx
    push 0x9a1
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_5
    cmp si, 4
    jl short loc_0097
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xda
    push 0
    push 0
    mov ebx, 0x10040
    mov edx, 0x80000
    push 0x9a1
    xor ecx, ecx
    mov eax, 0x13f
    call LINK_ADDRESS_5
loc_0097:
    cmp si, 8
    jl short loc_00d3
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xda
    push 0
    push 0
    mov ebx, 0x10040
    mov edx, 0x100000
    push 0x9a1
    xor ecx, ecx
    mov eax, 0x13f
    call LINK_ADDRESS_5
loc_00d3:
    cmp si, 0xc
    jl short loc_010f
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xda
    push 0
    push 0
    mov ebx, 0x10040
    mov edx, 0x180000
    push 0x9a1
    xor ecx, ecx
    mov eax, 0x13f
    call LINK_ADDRESS_5
loc_010f:
    mov bx, word [CONNECTHEAD]
    test bx, bx
    jge short loc_0125
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0125:
    movsx ebp, bx
    mov edi, ebp
    shl edi, 7
    sub edi, ebp
    lea edi, [edi*4]
    sub edi, ebp
    add edi, edi
    movsx eax, word [edi + LINK_ADDRESS_6]
    imul eax, eax, 0x2c
    xor ecx, ecx
    mov cl, byte [eax + LINK_ADDRESS_7]
    mov eax, ebp
    mov edx, LINK_ADDRESS_8
    shl eax, 5
    add edx, eax
    mov eax, ebx
    xor ah, bh
    xor bh, bh
    mov dword [esp], edx
    and bl, 3
    and al, 0x1c
    movsx edx, bx
    movsx esi, ax
    lea eax, [edx*8]
    push 0x9a
    add eax, edx
    add esi, esi
    lea eax, [eax*8]
    mov ebx, dword [esp + 4]
    add eax, edx
    add esi, 2
    mov dword [esp + 4], eax
    mov edx, esi
    add eax, 0x15
    call 0x105c0
    movsx edx, word [edi + LINK_ADDRESS_9]
    movsx eax, word [edi + LINK_ADDRESS_10]
    sub edx, eax
    push edx
    push LINK_ADDRESS_11
    push LINK_ADDRESS_12
    call SPRINTF
    movsx ecx, word [edi + LINK_ADDRESS_6]
    imul ecx, ecx, 0x2c
    add esp, 0xc
    push 0x9a
    mov cl, byte [ecx + LINK_ADDRESS_7]
    mov eax, dword [esp + 4]
    mov ebx, LINK_ADDRESS_12
    and ecx, 0xff
    mov edx, esi
    add eax, 0x43
    call 0x105c0
    mov bx, word [nosplit ebp*2 + CONNECTPOINT2]
    test bx, bx
    jge near loc_0125
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
