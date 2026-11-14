; Player state and sprite classification.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    movsx eax, word [CONNECTHEAD]
    mov ebx, dword [LINK_ADDRESS_2]
    jmp short loc_0024
loc_0013:
    cmp ebx, dword [eax*4 + LINK_ADDRESS_3]
    je short loc_0028
    movsx eax, word [nosplit eax*2 + CONNECTPOINT2]
loc_0024:
    test eax, eax
    jge short loc_0013
loc_0028:
    test eax, eax
    jge near loc_00ae
    xor ah, ah
    mov byte [LINK_ADDRESS_5], ah
loc_0038:
    movsx eax, word [CONNECTHEAD]
    jmp short loc_0074
loc_0041:
    movsx ecx, word [CONNECTHEAD]
    mov edx, dword [LINK_ADDRESS_2]
    mov ebx, eax
    shl ecx, 8
    and edx, 0xff
    shl ebx, 8
    add ecx, edx
    mov dl, byte [edx + ebx + LINK_ADDRESS_6]
    cmp dl, byte [ecx + LINK_ADDRESS_6]
    je short loc_0074
    mov byte [LINK_ADDRESS_5], 1
loc_0074:
    movsx eax, word [nosplit eax*2 + CONNECTPOINT2]
    test eax, eax
    jge short loc_0041
    inc dword [LINK_ADDRESS_2]
    movsx eax, word [CONNECTHEAD]
    mov esi, dword [LINK_ADDRESS_2]
    jmp short loc_00a6
loc_0095:
    cmp esi, dword [eax*4 + LINK_ADDRESS_3]
    je short loc_00aa
    movsx eax, word [nosplit eax*2 + CONNECTPOINT2]
loc_00a6:
    test eax, eax
    jge short loc_0095
loc_00aa:
    test eax, eax
    jl short loc_0038
loc_00ae:
    movsx eax, word [CONNECTHEAD]
    cmp word [nosplit eax*2 + CONNECTPOINT2], 0
    jge short loc_00c8
    xor bh, bh
    mov byte [LINK_ADDRESS_5], bh
loc_00c8:
    cmp byte [LINK_ADDRESS_5], 0
    je short loc_010b
    push 0
    mov ebx, 0x1f
    mov edx, 0x82
    push 0x12c
    mov eax, 4
    xor ecx, ecx
    call LINK_ADDRESS_7
    push 0
    mov ebx, 0x1f
    mov edx, 0x8a
    push 0x150
    mov eax, 4
    xor ecx, ecx
    call LINK_ADDRESS_7
loc_010b:
    cmp byte [LINK_ADDRESS_8], 0
    je short loc_014e
    push 0
    mov ebx, 0x1f
    mov edx, 0xa0
    push 0x174
    mov eax, 4
    xor ecx, ecx
    call LINK_ADDRESS_7
    push 0
    mov ebx, 0x1f
    mov edx, 0x8a
    push 0x18c
    mov eax, 4
    xor ecx, ecx
    call LINK_ADDRESS_7
loc_014e:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea eax, [dword eax + 0]
    lea edx, [dword edx + 0]
    nop
    push edx
    movsx edx, ax
    imul edx, edx, 0x2c
    cmp word [edx + LINK_ADDRESS_9], 0
    jle near loc_0222
    mov ax, word [edx + LINK_ADDRESS_10]
    cmp ax, 0x7fd
    jb near loc_0222
    jbe near loc_0222
    cmp ax, 0x942
    jb near loc_0222
    jbe near loc_0222
    cmp ax, 0xa96
    jb short loc_01c2
    jbe short loc_01d7
    cmp ax, 0xac8
    jb near loc_0222
    jbe short loc_01ee
    cmp ax, 0x1284
    jb near loc_0222
    cmp ax, 0x1285
    jbe short loc_0205
    pop edx
    ret
loc_01c2:
    cmp ax, 0x974
    jb short loc_0222
    jbe short loc_0222
    cmp ax, 0xa46
    jne short loc_0222
    mov eax, 0x61
    jmp short loc_021d
loc_01d7:
    cmp byte [edx + LINK_ADDRESS_11], 1
    jne short loc_01e7
    mov eax, 0x66
    jmp short loc_021d
loc_01e7:
    mov eax, 0x126
    jmp short loc_021d
loc_01ee:
    cmp byte [edx + LINK_ADDRESS_11], 1
    jne short loc_01fe
    mov eax, 0x97
    jmp short loc_021d
loc_01fe:
    mov eax, 0x11c
    jmp short loc_021d
loc_0205:
    cmp byte [edx + LINK_ADDRESS_11], 1
    jne short loc_0218
    mov eax, 0x156
    call LINK_ADDRESS_12
loc_0218:
    mov eax, 0x173
loc_021d:
    call LINK_ADDRESS_12
loc_0222:
    pop edx
    ret
    lea eax, [dword eax + 0]
    lea edx, [dword edx + 0]
