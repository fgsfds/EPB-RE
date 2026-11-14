; Interaction feedback and screen drawing.
bits 32
org START_ADDRESS

    push esi
    push edi
    push ebp
    mov word [LINK_ADDRESS_1], dx
    movsx edx, ax
    mov word [LINK_ADDRESS_2], ax
    imul eax, edx, 0x2c
    mov dword [LINK_ADDRESS_3], ebx
    mov ebx, SPRITE
    add ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    add eax, LINK_ADDRESS_5
    add eax, 0x2f
    mov dword [LINK_ADDRESS_6], ebx
    mov dword [LINK_ADDRESS_7], eax
    movsx edx, word [ebx + 0xe]
    lea edx, [edx*4]
    mov eax, ebx
    mov ebx, dword [edx + LINK_ADDRESS_8]
    test ebx, ebx
    je near loc_02e4
    lea edx, [ebx + 0x10]
    mov dword [LINK_ADDRESS_9], edx
    xor dl, dl
    mov byte [LINK_ADDRESS_10], dl
    mov dx, word [eax + 0x18]
    test dx, dx
    jl short loc_0084
    cmp dx, 0x400
    jl short loc_00c1
loc_0084:
    mov eax, dword [LINK_ADDRESS_6]
    call LINK_ADDRESS_11
    test ax, ax
    je short loc_00b1
    movsx edx, word [LINK_ADDRESS_1]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    inc byte [nosplit eax*2 + LINK_ADDRESS_12]
loc_00b1:
    movsx eax, word [LINK_ADDRESS_2]
    call LINK_ADDRESS_13
    pop ebp
    pop edi
    pop esi
    ret
loc_00c1:
    mov edx, dword [LINK_ADDRESS_7]
    cmp dword [edx + 0x10], 0
    je short loc_0140
    add word [eax + 0x26], 4
    mov eax, dword [LINK_ADDRESS_7]
    mov edx, dword [LINK_ADDRESS_6]
    mov ebx, dword [eax + 0x10]
    movsx edx, word [edx + 0x26]
    cmp edx, dword [ebx + 0x10]
    jle short loc_010a
    inc dword [eax + 8]
    mov eax, dword [LINK_ADDRESS_6]
    mov word [eax + 0x26], 0
    mov eax, dword [LINK_ADDRESS_7]
    mov edx, dword [eax + 0x10]
    mov ebp, dword [eax + 0xc]
    mov edx, dword [edx + 0xc]
    add ebp, edx
    mov dword [eax + 0xc], ebp
loc_010a:
    mov eax, dword [LINK_ADDRESS_7]
    mov eax, dword [eax + 0xc]
    test eax, eax
    jns short loc_0118
    neg eax
loc_0118:
    mov ebx, dword [LINK_ADDRESS_7]
    mov ebx, dword [ebx + 0x10]
    mov edx, eax
    mov eax, dword [ebx + 4]
    imul eax, dword [ebx + 0xc]
    test eax, eax
    jns short loc_0130
    neg eax
loc_0130:
    cmp edx, eax
    jl short loc_0140
    mov eax, dword [LINK_ADDRESS_7]
    mov dword [eax + 0xc], 0
loc_0140:
    call LINK_ADDRESS_14
    test al, al
    je short loc_0140
    cmp byte [LINK_ADDRESS_10], 1
    jne short loc_0194
    movsx edx, word [LINK_ADDRESS_1]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov di, word [LINK_ADDRESS_2]
    cmp di, word [eax + LINK_ADDRESS_15]
    jne short loc_0184
    mov word [eax + LINK_ADDRESS_15], 0xffff
loc_0184:
    movsx eax, word [LINK_ADDRESS_2]
    call LINK_ADDRESS_13
    pop ebp
    pop edi
    pop esi
    ret
loc_0194:
    call LINK_ADDRESS_16
    mov eax, dword [LINK_ADDRESS_6]
    mov si, word [eax + 0x1a]
    cmp si, 1
    jne near loc_0240
    call LINK_ADDRESS_11
    test ax, ax
    je short loc_01db
    mov eax, dword [LINK_ADDRESS_6]
    cmp byte [eax + 0x14], 0x3c
    ja near loc_02e4
    cmp dword [LINK_ADDRESS_17], 1
    jne short loc_01f6
    cmp word [eax + 0x2a], 0
    jle near loc_02e4
    jmp short loc_01f6
loc_01db:
    cmp dword [LINK_ADDRESS_18], 1
    jne short loc_01f6
    mov eax, dword [LINK_ADDRESS_6]
    movsx eax, word [eax + 0xc]
    test ah, 0x80
    jne near loc_02e4
loc_01f6:
    movsx ebx, word [LINK_ADDRESS_2]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov dx, word [eax + LINK_ADDRESS_19]
    cmp dx, 1
    jle short loc_022a
    mov esi, edx
    dec esi
    mov word [eax + LINK_ADDRESS_19], si
    pop ebp
    pop edi
    pop esi
    ret
loc_022a:
    jne near loc_02e4
    mov edx, 2
    mov eax, ebx
    call LINK_ADDRESS_20
    pop ebp
    pop edi
    pop esi
    ret
loc_0240:
    cmp si, 6
    jne near loc_02e4
    mov ax, word [eax + 0xe]
    cmp ax, 0x4cb
    jb short loc_0282
    cmp ax, 0x4cd
    jbe short loc_02a2
    cmp ax, 0x4d6
    jb short loc_0278
    jbe short loc_02a2
    cmp ax, 0x4d8
    jb near loc_02e4
    jbe short loc_02a2
    cmp ax, 0xa06
    je short loc_02a2
    pop ebp
    pop edi
    pop esi
    ret
loc_0278:
    cmp ax, 0x4d0
    je short loc_02a2
    pop ebp
    pop edi
    pop esi
    ret
loc_0282:
    cmp ax, 0x388
    jb short loc_029c
    jbe short loc_02a2
    cmp ax, 0x402
    jb short loc_02e4
    jbe short loc_02a2
    cmp ax, 0x426
    je short loc_02a2
    pop ebp
    pop edi
    pop esi
    ret
loc_029c:
    cmp ax, 0x2a3
    jne short loc_02e4
loc_02a2:
    movsx ebx, word [LINK_ADDRESS_2]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov dx, word [eax + LINK_ADDRESS_19]
    cmp dx, 1
    jle short loc_02d6
    mov esi, edx
    dec esi
    mov word [eax + LINK_ADDRESS_19], si
    pop ebp
    pop edi
    pop esi
    ret
loc_02d6:
    jne short loc_02e4
    mov edx, 2
    mov eax, ebx
    call LINK_ADDRESS_20
loc_02e4:
    pop ebp
    pop edi
    pop esi
    ret
    add byte [eax], al
    add byte [eax], al
    add byte [eax], al
    add byte [eax], al
    xor eax, eax
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8b, 0xc0    ; mov eax, eax
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 8
    mov dword [esp], eax
    mov dword [esp + 4], edx
    mov ebp, edx
    xor edx, edx
loc_0322:
    imul eax, edx, 0x2e
    mov ecx, dword [esp]
    mov esi, ecx
    shl esi, 6
    sub esi, ecx
    lea esi, [esi*8]
    add esi, eax
    mov eax, edx
    shl eax, 5
    sub eax, edx
    mov ecx, 0xb
    lea esi, [esi + LINK_ADDRESS_21]
    lea edi, [nosplit eax*2 + LINK_ADDRESS_22]
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
    mov dword [nosplit eax*2 + LINK_ADDRESS_23], ebp
    inc edx
    mov dword [nosplit eax*2 + LINK_ADDRESS_24], ebx
    add ebp, 0x12c
    lea ecx, [ebx + 0xa]
    mov dword [nosplit eax*2 + LINK_ADDRESS_25], ebp
    add ebx, 0xf
    mov dword [nosplit eax*2 + LINK_ADDRESS_26], ecx
    mov ebp, dword [esp + 4]
    cmp edx, 8
    jl short loc_0322
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    nop
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov edi, edx
    xor edx, edx
    mov esi, ebx
    mov dword [esp], edx
loc_03a0:
    mov ebp, dword [esp]
    mov eax, ebp
    shl eax, 5
    sub eax, ebp
    lea ebp, [eax + eax]
    mov eax, LINK_ADDRESS_23
    add eax, ebp
    mov edx, esi
    add eax, 0x10
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, edi
    call LINK_ADDRESS_27
    lea eax, [edi + 0x37]
    mov edx, esi
    mov ebx, dword [ebp + LINK_ADDRESS_28]
    xor ecx, ecx
    call LINK_ADDRESS_29
    lea eax, [edi + 0x5f]
    mov edx, esi
    mov ebx, dword [ebp + LINK_ADDRESS_30]
    xor ecx, ecx
    call LINK_ADDRESS_29
    lea eax, [edi + 0x96]
    mov edx, esi
    mov ebx, dword [ebp + LINK_ADDRESS_31]
    xor ecx, ecx
    call LINK_ADDRESS_29
    lea eax, [edi + 0xd0]
    mov edx, esi
    mov ebx, dword [ebp + LINK_ADDRESS_32]
    xor ecx, ecx
    call LINK_ADDRESS_29
    mov ebx, dword [esp]
    inc ebx
    add esi, 8
    mov dword [esp], ebx
    cmp ebx, 4
    jl near loc_03a0
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
