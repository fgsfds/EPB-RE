; HUD numeric and status indicators.
bits 32
org START_ADDRESS

    push esi
    push edi
    push ebp
    sub esp, 0x1c
    mov ebp, eax
    mov dword [esp + 0xc], edx
    mov byte [esp + 0x18], cl
    mov eax, ebx
    mov ebx, 0xa
    mov edx, esp
    call LINK_ADDRESS_1
    mov eax, esp
    xor edi, edi
    call STRLEN
    mov dword [esp + 0x14], eax
    xor esi, esi
    mov edx, dword [esp + 0x14]
    jmp short loc_004d
loc_0033:
    movsx eax, si
    mov al, byte [esp + eax]
    xor ah, ah
    add eax, 0x978
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    inc eax
    inc esi
    add edi, eax
loc_004d:
    cmp si, dx
    jl short loc_0033
    movsx eax, di
    sar eax, 1
    sub ebp, eax
    xor esi, esi
    mov eax, ebp
    xor edi, edi
    mov dword [esp + 0x10], eax
    cmp si, word [esp + 0x14]
    jl short loc_0073
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    ret 4
loc_0073:
    movsx eax, si
    mov al, byte [esp + eax]
    xor ah, ah
    mov edx, eax
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    movsx ebx, di
    xor ecx, ecx
    push 0
    add edx, 0x978
    xor eax, eax
    push 0
    mov al, byte [esp + 0x3c]
    movsx ebp, dx
    push eax
    mov edx, dword [esp + 0x20]
    xor eax, eax
    push 0
    mov al, byte [esp + 0x30]
    shl edx, 0x10
    push eax
    movsx eax, word [esp + 0x2c]
    push ebp
    add eax, ebx
    mov ebx, 0x10000
    shl eax, 0x10
    call LINK_ADDRESS_6
    mov ax, word [nosplit ebp*2 + TILESIZX]
    inc eax
    inc esi
    add edi, eax
    cmp si, word [esp + 0x14]
    jl short loc_0073
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    ret 4
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 8
    mov ebp, eax
    xor edx, edx
    mov bx, word [eax + 0x388]
    mov dword [esp + 4], edx
    test bx, bx
    setg al
    xor ah, ah
    shl eax, 3
    mov word [esp], ax
    test byte [esp], 8
    je short loc_0126
    mov ecx, 1
    mov dword [esp + 4], ecx
loc_0126:
    cmp word [ebp + 0x386], 0
    setg al
    xor ah, ah
    mov edi, dword [esp]
    shl eax, 5
    or edi, eax
    mov word [esp], di
    test byte [esp], 0x20
    je short loc_0149
    inc dword [esp + 4]
loc_0149:
    cmp word [ebp + 0x38a], 0
    setg al
    xor ah, ah
    mov ebx, dword [esp]
    add eax, eax
    or ebx, eax
    mov word [esp], bx
    test byte [esp], 2
    je short loc_016b
    inc dword [esp + 4]
loc_016b:
    cmp word [ebp + 0x31c], 0
    setg al
    xor ah, ah
    mov edi, dword [esp]
    shl eax, 2
    or edi, eax
    mov word [esp], di
    test byte [esp], 4
    je short loc_018e
    inc dword [esp + 4]
loc_018e:
    cmp word [ebp + 0x33a], 0
    setg al
    xor edx, edx
    mov dl, al
    movsx eax, word [esp]
    or eax, edx
    mov word [esp], ax
    test byte [esp], 1
    je short loc_01b1
    inc dword [esp + 4]
loc_01b1:
    cmp word [ebp + 0x354], 0
    setg al
    xor ah, ah
    mov esi, dword [esp]
    shl eax, 4
    or esi, eax
    mov word [esp], si
    test byte [esp], 0x10
    je short loc_01d4
    inc dword [esp + 4]
loc_01d4:
    cmp word [ebp + 0x39c], 0
    setg al
    xor ah, ah
    mov ebx, dword [esp]
    shl eax, 6
    or ebx, eax
    mov word [esp], bx
    test byte [esp], 0x40
    je short loc_01f7
    inc dword [esp + 4]
loc_01f7:
    imul esi, dword [esp + 4], 0xb
    mov eax, 0xa0
    sub eax, esi
    mov esi, eax
    xor eax, eax
    mov edx, dword [LINK_ADDRESS_7]
    mov dword [esp + 4], eax
    cmp edx, 4
    jle short loc_021d
    mov edi, 0x9a
    jmp short loc_0222
loc_021d:
    mov edi, 0xac
loc_0222:
    cmp dword [LINK_ADDRESS_7], 4
    jne short loc_023c
    cmp dword [LINK_ADDRESS_8], 1
    jle short loc_0239
    add esi, 0x38
    jmp short loc_023c
loc_0239:
    add esi, 0x41
loc_023c:
    mov edx, dword [esp + 4]
    cmp dx, 9
    jg near loc_04ad
    mov eax, 1
    movsx ecx, dx
    movsx edx, word [esp]
    shl eax, cl
    test edx, eax
    je near loc_04a4
    and eax, edx
    cmp eax, 8
    jb short loc_0294
    jbe near loc_0367
    cmp eax, 0x20
    jb short loc_0286
    jbe near loc_03d6
    cmp eax, 0x40
    je near loc_040c
    jmp near loc_044b
loc_0286:
    cmp eax, 0x10
    je near loc_03a0
    jmp near loc_044b
loc_0294:
    cmp eax, 2
    jb short loc_02a9
    jbe short loc_02eb
    cmp eax, 4
    je near loc_0328
    jmp near loc_044b
loc_02a9:
    cmp eax, 1
    jne near loc_044b
    mov eax, dword [WINDOWY2]
    push eax
    mov edx, dword [WINDOWX2]
    push edx
    mov ebx, dword [WINDOWY1]
    push ebx
    mov ecx, dword [WINDOWX1]
    push ecx
    push 0x12
    movsx eax, si
    push 0
    movsx edx, di
    push 0
    shl eax, 0x10
    mov ebx, 0x10000
    push 0x99c
    jmp near loc_0441
loc_02eb:
    mov eax, dword [WINDOWY2]
    push eax
    mov edx, dword [WINDOWX2]
    push edx
    mov ebx, dword [WINDOWY1]
    push ebx
    mov ecx, dword [WINDOWX1]
    push ecx
    movsx eax, si
    push 0x12
    movsx edx, di
    push 0
    inc eax
    mov ebx, 0x10000
    push 0
    shl edx, 0x10
    push 0x9a5
    shl eax, 0x10
    jmp near loc_0444
loc_0328:
    mov eax, dword [WINDOWY2]
    push eax
    mov edx, dword [WINDOWX2]
    push edx
    mov ebx, dword [WINDOWY1]
    push ebx
    mov ecx, dword [WINDOWX1]
    push ecx
    movsx eax, si
    push 0x12
    movsx edx, di
    push 0
    add eax, 2
    mov ebx, 0x10000
    push 0
    shl edx, 0x10
    push 0x9a6
    shl eax, 0x10
    jmp near loc_0444
loc_0367:
    mov eax, dword [WINDOWY2]
    push eax
    mov edx, dword [WINDOWX2]
    push edx
    mov ebx, dword [WINDOWY1]
    push ebx
    mov ecx, dword [WINDOWX1]
    push ecx
    push 0x12
    movsx eax, si
    push 0
    movsx edx, di
    push 0
    shl eax, 0x10
    mov ebx, 0x10000
    push 0x9a3
    jmp near loc_0441
loc_03a0:
    mov eax, dword [WINDOWY2]
    push eax
    mov edx, dword [WINDOWX2]
    push edx
    mov ebx, dword [WINDOWY1]
    push ebx
    mov ecx, dword [WINDOWX1]
    push ecx
    push 0x12
    movsx eax, si
    push 0
    movsx edx, di
    push 0
    shl eax, 0x10
    mov ebx, 0x10000
    push 0x99d
    jmp short loc_0441
loc_03d6:
    mov eax, dword [WINDOWY2]
    push eax
    mov edx, dword [WINDOWX2]
    push edx
    mov ebx, dword [WINDOWY1]
    push ebx
    mov ecx, dword [WINDOWX1]
    push ecx
    push 0x12
    movsx eax, si
    push 0
    movsx edx, di
    push 0
    shl eax, 0x10
    mov ebx, 0x10000
    push 0x9a4
    jmp short loc_0441
loc_040c:
    mov eax, dword [WINDOWY2]
    push eax
    mov edx, dword [WINDOWX2]
    push edx
    mov ebx, dword [WINDOWY1]
    push ebx
    mov ecx, dword [WINDOWX1]
    push ecx
    movsx eax, si
    push 0x12
    movsx edx, di
    push 0
    shl eax, 0x10
    push 0
    mov ebx, 0x10000
    dec edx
    push 0x99f
loc_0441:
    shl edx, 0x10
loc_0444:
    xor ecx, ecx
    call LINK_ADDRESS_6
loc_044b:
    movsx edx, word [esp + 4]
    xor eax, eax
    inc edx
    mov al, byte [ebp + 0x3c9]
    add esi, 0x16
    cmp eax, edx
    jne short loc_04a4
    mov eax, dword [WINDOWY2]
    push eax
    mov edx, dword [WINDOWX2]
    push edx
    mov ebx, dword [WINDOWY1]
    push ebx
    mov ecx, dword [WINDOWX1]
    push ecx
    movsx eax, si
    push 0x12
    movsx edx, di
    sub eax, 2
    push 0
    mov ebx, 0x10000
    add edx, 0x13
    push -0x20
    shl eax, 0x10
    mov ecx, 0x400
    push 0x14
    shl edx, 0x10
    call LINK_ADDRESS_6
loc_04a4:
    inc dword [esp + 4]
    jmp near loc_023c
loc_04ad:
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
