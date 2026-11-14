; Game event and playback handlers.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x1c
    mov dword [esp + 0xc], eax
    cwde
    mov ebx, eax
    shl ebx, 7
    sub ebx, eax
    lea ebx, [ebx*4]
    sub ebx, eax
    mov esi, 0xf1720
    add ebx, ebx
    xor ah, ah
    add esi, ebx
    mov byte [esp + 0x10], ah
    mov ax, word [esi + 0x2a0]
    cwde
    test eax, eax
    jns short loc_003f
    neg eax
loc_003f:
    mov edx, eax
    mov ecx, 9
    sar edx, 0x1f
    idiv ecx
    mov dword [esp + 8], eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov byte [esp + 0x14], 0xa
    mov dx, word [esi + 0x31e]
    lea ebx, [esi + 0x334]
    test dx, dx
    jge near loc_0bd9
    cmp word [0x125cf7], 0
    jge near loc_0bd9
    cmp word [esi + 0x344], 0
    jg near loc_0bd9
    cmp byte [eax + 0x2522c5], 1
    je short loc_00a7
    cmp word [eax + 0x2522de], 0
    jle near loc_0bd9
loc_00a7:
    movsx edi, word [esp + 0xc]
    movsx ebp, byte [esp + 0x14]
    mov edx, edi
    mov eax, ebp
    call 0x46280
    test al, al
    jne near loc_0bd9
    mov edx, edi
    mov eax, ebp
    call 0x46840
    test al, al
    jne near loc_0bd9
    mov edx, edi
    mov eax, ebp
    call 0x46990
    test al, al
    jne near loc_0bd9
    movsx eax, word [esi + 0x392]
    imul eax, eax
    mov ecx, dword [esi + 0x270]
    mov edi, 0x50
    sar ecx, 1
    sub edi, eax
    lea eax, [ecx + 0x200]
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [eax*2 + 0x2496b4]
    mov ebp, 0x600
    mov eax, edx
    sar edx, 0x1f
    idiv ebp
    mov ebp, 0x46
    sub ebp, eax
    movsx eax, word [esi + 0x338]
    add eax, 0x3a
    sub ebp, eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x2522c8], 0x20
    jae short loc_0161
    mov eax, dword [esi + 0x270]
    lea eax, [eax*4]
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    sar eax, 9
    jmp short loc_0172
loc_0161:
    and ecx, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x4d, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [ecx*2 + 0x2496b4]
    sar eax, 0xa
loc_0172:
    test eax, eax
    jns short loc_0178
    neg eax
loc_0178:
    sub edi, eax
    xor eax, eax
    mov al, byte [esi + 0x3ed]
    lea eax, [eax*8]
    mov cx, word [esi + 0x314]
    sub edi, eax
    test cx, cx
    jl short loc_019c
    movsx eax, cx
    jmp short loc_01a3
loc_019c:
    movsx eax, word [esi + 0x312]
loc_01a3:
    mov dword [esp + 4], eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x2522c8], 0x28
    jae near loc_02bd
    cmp byte [esi + 0x3cb], 0
    jne short loc_01f0
    movsx edx, word [eax + 0x2522d4]
    mov eax, 0x20
    sar edx, 1
    mov edi, dword [esp + 8]
    sub eax, edx
    add edi, eax
    movsx eax, word [0x151c04]
    add eax, edx
    mov dword [esp + 8], edi
    mov word [0x151c04], ax
loc_01f0:
    mov ax, word [0x151c04]
    and ah, 7
    cwde
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov edx, eax
    sar edx, 0xa
    mov dword [esp + 4], ebp
    add ebp, edx
    xor edx, edx
    mov dl, byte [esp + 0x10]
    movsx edi, byte [esp + 0x14]
    push edx
    mov edx, dword [esp + 0xc]
    sar eax, 8
    add edx, 0x102
    test eax, eax
    jns short loc_022c
    neg eax
loc_022c:
    sub edx, eax
    movsx eax, word [esi + 0x2a0]
    add ebp, 0xfa
    sar eax, 1
    mov ebx, 0x668
    sub ebp, eax
    mov ecx, edi
    mov eax, ebp
    call 0x12f30
    mov ax, word [0x151c04]
    and ah, 7
    cwde
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov ebp, eax
    mov edx, dword [esp + 4]
    sar ebp, 0xa
    sub edx, ebp
    mov ebp, edx
    mov dl, byte [esp + 0x10]
    or dl, 4
    and edx, 0xff
    push edx
    sar eax, 8
    test eax, eax
    jns short loc_0283
    neg eax
loc_0283:
    mov edx, dword [esp + 0xc]
    movsx ebx, word [esi + 0x2a0]
    add edx, 0xc8
    sar ebx, 1
    add edx, eax
    lea eax, [ebp + 0x28]
    mov ecx, edi
    sub eax, ebx
    mov ebx, 0x668
    call 0x12f30
    movsx eax, word [esp + 0xc]
    call 0x46140
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_02bd:
    mov edx, dword [esp + 4]
    dec edx
    cmp edx, 7
    ja near loc_0bcf
    jmp dword cs:[edx*4 + 0x36b9c]
    movsx eax, word [esi + 0x312]
    movsx eax, word [esi + eax*2 + 0x2f0]
    lea eax, [eax*4]
    add eax, 0x2d
    sub edi, eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov dl, byte [eax + 0x2522c5]
    cmp dl, 1
    jne short loc_0309
    mov byte [esp + 0x18], dl
    jmp short loc_0324
loc_0309:
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    mov al, byte [eax*8 + 0x2c9cd1]
    mov byte [esp + 0x18], al
loc_0324:
    mov eax, dword [esp + 4]
    add ebp, 0x28
    cmp eax, 5
    jne short loc_034b
    movsx eax, word [esi + 0x312]
    movsx eax, word [esi + eax*2 + 0x2f0]
    lea eax, [eax*4]
    add eax, 0x37
    sub edi, eax
loc_034b:
    mov ax, word [ebx]
    test ax, ax
    jle short loc_0390
    db 0x66, 0x3d, 0x08, 0x00    ; cmp ax, 8
    jge short loc_0390
    xor eax, eax
    mov al, byte [esp + 0x18]
    push eax
    xor eax, eax
    movsx ecx, byte [esp + 0x18]
    mov al, byte [esp + 0x14]
    mov edx, dword [esp + 0xc]
    push eax
    movsx eax, word [ebx]
    add edx, edx
    sar eax, 1
    add edx, 0xb0
    add eax, 0x10
    sub edx, edi
    movsx ebx, ax
    lea eax, [ebp + 0xa4]
    call 0x12fe0
loc_0390:
    movsx ecx, byte [esp + 0x14]
    mov edx, dword [esp + 8]
    xor eax, eax
    mov ebx, 0x279
    mov al, byte [esp + 0x18]
    add edx, edx
    push eax
    xor eax, eax
    add edx, 0xb0
    mov al, byte [esp + 0x14]
    sub edx, edi
    push eax
    mov dword [esp + 8], eax
    lea eax, [ebp + 0xa4]
    call 0x12fe0
    push -2
    mov ebx, dword [esp + 4]
    mov ecx, 0xa
    mov edx, 0x96
    push ebx
    mov eax, 0x32
    mov ebx, 0x283
    call 0x13050
    mov edx, 0xaa
    movsx eax, word [esi + 0x312]
    xor ecx, ecx
    movsx ebx, word [esi + eax*2 + 0x2ce]
    mov eax, 0x23
    call 0x3e190
    mov edx, 0xaa
    mov eax, 0x55
    mov ebx, dword [0x2e450]
    xor ecx, ecx
    call 0x3e190
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jg near loc_0bcf
    mov eax, 0x18f
    call 0x57f40
    movsx eax, word [0x2f2926]
    mov ebx, eax
    shl ebx, 7
    sub ebx, eax
    lea ebx, [ebx*4]
    sub ebx, eax
    movsx eax, word [esi + 0x312]
    add ebx, ebx
    inc word [ebx + eax*2 + 0xf1a10]
    movsx eax, word [esi + 0x312]
    add eax, eax
    add ebx, eax
    mov ecx, dword [0x92c8]
    movsx eax, word [ebx + 0xf1a10]
    cmp eax, ecx
    jl near loc_0bcf
    xor edi, edi
    mov word [ebx + 0xf1a10], di
    movsx eax, word [esi + 0x312]
    mov word [esi + eax*2 + 0x2ce], 0x4b
    sub dword [0x2e450], 0x4b
    movsx eax, word [esp + 0xc]
    call 0x46140
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx eax, word [esi + 0x312]
    movsx eax, word [esi + eax*2 + 0x2f0]
    lea eax, [eax*4]
    add eax, 0x32
    sub edi, eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov cl, byte [eax + 0x2522c5]
    cmp cl, 1
    jne short loc_04ef
    mov byte [esp + 0x18], cl
    jmp short loc_050a
loc_04ef:
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    mov al, byte [eax*8 + 0x2c9cd1]
    mov byte [esp + 0x18], al
loc_050a:
    mov edx, dword [esp + 4]
    add ebp, 0x28
    cmp edx, 7
    jne short loc_0531
    movsx eax, word [esi + 0x312]
    movsx eax, word [esi + eax*2 + 0x2f0]
    lea eax, [eax*4]
    add eax, 0x3c
    sub edi, eax
loc_0531:
    mov ax, word [ebx]
    test ax, ax
    jle short loc_0576
    db 0x66, 0x3d, 0x08, 0x00    ; cmp ax, 8
    jge short loc_0576
    xor eax, eax
    mov al, byte [esp + 0x18]
    push eax
    xor eax, eax
    mov al, byte [esp + 0x14]
    movsx ecx, byte [esp + 0x18]
    push eax
    movsx eax, word [ebx]
    mov edx, dword [esp + 0x10]
    sar eax, 1
    add edx, edx
    add eax, 0x10
    add edx, 0xb0
    movsx ebx, ax
    lea eax, [ebp + 0xa4]
    sub edx, edi
    call 0x12fe0
loc_0576:
    movsx ecx, byte [esp + 0x14]
    mov edx, dword [esp + 8]
    xor eax, eax
    mov ebx, 0x27a
    mov al, byte [esp + 0x18]
    add edx, edx
    push eax
    xor eax, eax
    add edx, 0xb0
    mov al, byte [esp + 0x14]
    sub edx, edi
    push eax
    mov dword [esp + 8], eax
    lea eax, [ebp + 0xa4]
    call 0x12fe0
    push -2
    mov ecx, dword [esp + 4]
    mov ebx, 0x284
    mov edx, 0x96
    push ecx
    mov eax, 0x32
    xor ecx, ecx
    call 0x13050
    mov edx, 0xaa
    movsx eax, word [esi + 0x312]
    xor ecx, ecx
    movsx ebx, word [esi + eax*2 + 0x2ce]
    mov eax, 0x23
    call 0x3e190
    mov edx, 0xaa
    mov eax, 0x55
    mov ebx, dword [0x2e450]
    xor ecx, ecx
    call 0x3e190
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jg near loc_0bcf
    mov eax, 0x18f
    call 0x57f40
    movsx eax, word [0x2f2926]
    mov ebx, eax
    shl ebx, 7
    sub ebx, eax
    lea ebx, [ebx*4]
    sub ebx, eax
    movsx eax, word [esi + 0x312]
    add ebx, ebx
    inc word [ebx + eax*2 + 0xf1a10]
    movsx eax, word [esi + 0x312]
    add eax, eax
    add ebx, eax
    mov edi, dword [0x92c8]
    movsx eax, word [ebx + 0xf1a10]
    cmp eax, edi
    jl near loc_0bcf
    xor edi, edi
    mov word [ebx + 0xf1a10], di
    movsx eax, word [esi + 0x312]
    mov word [esi + eax*2 + 0x2ce], 0x64
    sub dword [0x2e450], 0x64
    movsx eax, word [esp + 0xc]
    call 0x46140
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx eax, word [esi + 0x312]
    movsx eax, word [esi + eax*2 + 0x2f0]
    add eax, eax
    add eax, 0x41
    sub edi, eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov cl, byte [eax + 0x2522c5]
    cmp cl, 1
    jne short loc_06cd
    mov byte [esp + 0x18], cl
    jmp short loc_06e8
loc_06cd:
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    mov al, byte [eax*8 + 0x2c9cd1]
    mov byte [esp + 0x18], al
loc_06e8:
    cmp dword [esp + 4], 1
    jne short loc_0705
    movsx eax, word [esi + 0x312]
    movsx eax, word [esi + eax*2 + 0x2f0]
    add eax, eax
    add eax, 0x4b
    sub edi, eax
loc_0705:
    mov ax, word [ebx]
    test ax, ax
    jle short loc_074a
    db 0x66, 0x3d, 0x08, 0x00    ; cmp ax, 8
    jge short loc_074a
    xor eax, eax
    mov al, byte [esp + 0x18]
    push eax
    xor eax, eax
    movsx ecx, byte [esp + 0x18]
    mov al, byte [esp + 0x14]
    mov edx, dword [esp + 0xc]
    push eax
    movsx eax, word [ebx]
    add edx, edx
    sar eax, 1
    add edx, 0xb0
    add eax, 0x10
    sub edx, edi
    movsx ebx, ax
    lea eax, [ebp + 0xa4]
    call 0x12fe0
loc_074a:
    xor eax, eax
    mov al, byte [esp + 0x18]
    mov edx, dword [esp + 8]
    push eax
    xor eax, eax
    mov ebx, 0x276
    mov al, byte [esp + 0x14]
    add edx, edx
    mov dword [esp + 4], eax
    push eax
    mov al, byte [esp + 0x1c]
    add edx, 0xb0
    add al, 7
    sub edx, edi
    movsx ecx, al
    lea eax, [ebp + 0xa4]
    call 0x12fe0
    push -2
    mov ebx, dword [esp + 4]
    mov ecx, 0xa
    mov edx, 0x96
    push ebx
    mov eax, 0x32
    mov ebx, 0x280
    call 0x13050
    mov edx, 0xaa
    movsx eax, word [esi + 0x312]
    xor ecx, ecx
    movsx ebx, word [esi + eax*2 + 0x2ce]
    mov eax, 0x23
    call 0x3e190
    mov edx, 0xaa
    mov eax, 0x55
    mov ebx, dword [0x2e450]
    xor ecx, ecx
    call 0x3e190
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jg near loc_0bcf
    mov eax, 0x18f
    call 0x57f40
    movsx eax, word [0x2f2926]
    mov ebx, eax
    shl ebx, 7
    sub ebx, eax
    lea ebx, [ebx*4]
    sub ebx, eax
    movsx eax, word [esi + 0x312]
    add ebx, ebx
    inc word [ebx + eax*2 + 0xf1a10]
    movsx eax, word [esi + 0x312]
    add eax, eax
    add ebx, eax
    mov ecx, dword [0x92c8]
    movsx eax, word [ebx + 0xf1a10]
    cmp eax, ecx
    jl near loc_0bcf
    xor edi, edi
    mov word [ebx + 0xf1a10], di
    movsx eax, word [esi + 0x312]
    mov word [esi + eax*2 + 0x2ce], 0xc
    sub dword [0x2e450], 0xc
    movsx eax, word [esp + 0xc]
    call 0x46140
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov cl, byte [eax + 0x2522c5]
    cmp cl, 1
    jne short loc_0888
    mov byte [esp + 0x18], cl
    jmp short loc_08a3
loc_0888:
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    mov al, byte [eax*8 + 0x2c9cd1]
    mov byte [esp + 0x18], al
loc_08a3:
    movsx eax, word [esi + 0x312]
    movsx eax, word [esi + eax*2 + 0x2f0]
    lea eax, [eax*4]
    add eax, 0x2d
    sub edi, eax
    mov ax, word [ebx]
    add ebp, 0x23
    test ax, ax
    jle short loc_0906
    db 0x66, 0x3d, 0x08, 0x00    ; cmp ax, 8
    jge short loc_0906
    xor eax, eax
    mov al, byte [esp + 0x18]
    push eax
    xor eax, eax
    movsx ecx, byte [esp + 0x18]
    mov al, byte [esp + 0x14]
    mov edx, dword [esp + 0xc]
    push eax
    movsx eax, word [ebx]
    add edx, edx
    sar eax, 1
    add edx, 0xb0
    add eax, 0x10
    sub edx, edi
    movsx ebx, ax
    lea eax, [ebp + 0xa4]
    call 0x12fe0
loc_0906:
    movsx ecx, byte [esp + 0x14]
    mov edx, dword [esp + 8]
    xor eax, eax
    mov ebx, 0x278
    mov al, byte [esp + 0x18]
    add edx, edx
    push eax
    xor eax, eax
    add edx, 0xb0
    mov al, byte [esp + 0x14]
    sub edx, edi
    push eax
    mov dword [esp + 8], eax
    lea eax, [ebp + 0xa4]
    call 0x12fe0
    push -2
    mov edx, dword [esp + 4]
    mov ecx, 0xa
    mov ebx, 0x282
    push edx
    mov eax, 0x32
    mov edx, 0x96
    call 0x13050
    mov edx, 0xaa
    movsx eax, word [esi + 0x312]
    xor ecx, ecx
    movsx ebx, word [esi + eax*2 + 0x2ce]
    mov eax, 0x23
    call 0x3e190
    mov edx, 0xaa
    mov eax, 0x55
    mov ebx, dword [0x2e450]
    xor ecx, ecx
    call 0x3e190
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jg near loc_0bcf
    mov eax, 0x18f
    call 0x57f40
    movsx eax, word [0x2f2926]
    mov ebx, eax
    shl ebx, 7
    sub ebx, eax
    lea ebx, [ebx*4]
    sub ebx, eax
    movsx eax, word [esi + 0x312]
    add ebx, ebx
    inc word [ebx + eax*2 + 0xf1a10]
    movsx eax, word [esi + 0x312]
    add eax, eax
    add ebx, eax
    mov ecx, dword [0x92c8]
    movsx eax, word [ebx + 0xf1a10]
    cmp eax, ecx
    jl near loc_0bcf
    xor edi, edi
    mov word [ebx + 0xf1a10], di
    movsx eax, word [esi + 0x312]
    mov word [esi + eax*2 + 0x2ce], 0x4b
    sub dword [0x2e450], 0x4b
    movsx eax, word [esp + 0xc]
    call 0x46140
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov dl, byte [eax + 0x2522c5]
    cmp dl, 1
    jne short loc_0a40
    mov byte [esp + 0x18], dl
    jmp short loc_0a5b
loc_0a40:
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    mov al, byte [eax*8 + 0x2c9cd1]
    mov byte [esp + 0x18], al
loc_0a5b:
    movsx eax, word [esi + 0x312]
    movsx eax, word [esi + eax*2 + 0x2f0]
    lea eax, [eax*4]
    add eax, 0x2d
    sub edi, eax
    mov ax, word [ebx]
    add ebp, 0x23
    test ax, ax
    jle short loc_0abe
    db 0x66, 0x3d, 0x08, 0x00    ; cmp ax, 8
    jge short loc_0abe
    xor eax, eax
    mov al, byte [esp + 0x18]
    push eax
    xor eax, eax
    movsx ecx, byte [esp + 0x18]
    mov al, byte [esp + 0x14]
    mov edx, dword [esp + 0xc]
    push eax
    movsx eax, word [ebx]
    add edx, edx
    sar eax, 1
    add edx, 0xb0
    add eax, 0x10
    sub edx, edi
    movsx ebx, ax
    lea eax, [ebp + 0xa4]
    call 0x12fe0
loc_0abe:
    xor eax, eax
    mov al, byte [esp + 0x18]
    mov edx, dword [esp + 8]
    push eax
    xor eax, eax
    mov ebx, 0x277
    mov al, byte [esp + 0x14]
    add edx, edx
    mov dword [esp + 4], eax
    push eax
    mov al, byte [esp + 0x1c]
    add edx, 0xb0
    add al, 7
    sub edx, edi
    movsx ecx, al
    lea eax, [ebp + 0xa4]
    call 0x12fe0
    push -2
    mov edx, dword [esp + 4]
    mov ecx, 0xa
    mov ebx, 0x281
    push edx
    mov eax, 0x32
    mov edx, 0x96
    call 0x13050
    mov edx, 0xaa
    movsx eax, word [esi + 0x312]
    xor ecx, ecx
    movsx ebx, word [esi + eax*2 + 0x2ce]
    mov eax, 0x23
    call 0x3e190
    mov edx, 0xaa
    mov eax, 0x55
    mov ebx, dword [0x2e450]
    xor ecx, ecx
    call 0x3e190
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jg short loc_0bcf
    mov eax, 0x18f
    call 0x57f40
    movsx eax, word [0x2f2926]
    mov ebx, eax
    shl ebx, 7
    sub ebx, eax
    lea ebx, [ebx*4]
    sub ebx, eax
    movsx eax, word [esi + 0x312]
    add ebx, ebx
    inc word [ebx + eax*2 + 0xf1a10]
    movsx eax, word [esi + 0x312]
    add eax, eax
    add ebx, eax
    mov ecx, dword [0x92c8]
    movsx eax, word [ebx + 0xf1a10]
    cmp eax, ecx
    jl short loc_0bcf
    xor edi, edi
    mov word [ebx + 0xf1a10], di
    movsx eax, word [esi + 0x312]
    mov word [esi + eax*2 + 0x2ce], 0x28
    sub dword [0x2e450], 0x28
loc_0bcf:
    movsx eax, word [esp + 0xc]
    call 0x46140
loc_0bd9:
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    nop
loc_0be4:
    push ebx
    mov ebx, dword [eax]
    mov dword [ecx], ebx
    mov ebx, dword [edx]
    mov dword [eax], ebx
    mov eax, dword [ecx]
    mov dword [edx], eax
    pop ebx
    ret
    nop
    push ecx
    push esi
    push edi
    mov ecx, 0xb
    mov edi, ebx
    mov esi, eax
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    mov ecx, 0xb
    mov edi, eax
    mov esi, edx
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    mov ecx, 0xb
    mov edi, edx
    mov esi, ebx
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
loc_0c24:
    push ecx
    push edi
    push ebp
    sub esp, 4
    mov dword [esp], eax
    mov ecx, ebx
    imul eax, eax, 0x2c
    cmp dword [eax + 0x2e64c], 0
    je near loc_0dd4
    test ebx, ebx
    je short loc_0c4b
    xor edi, edi
    mov dword [0x92e8], edi
loc_0c4b:
    mov ebp, dword [0x92e8]
    test ebp, ebp
    jne near loc_0dc0
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, 0xf1720
    add eax, eax
    add ebx, eax
    imul eax, dword [ebx + 0x290], 0x2c
    mov dword [eax + 0x2e670], ebp
    imul eax, dword [esp], 0x2c
    mov dword [eax + 0x2e670], 1
    lea edx, [ebx + 0x214]
    mov eax, dword [eax + 0x2e648]
    call loc_0be4
    imul eax, dword [esp], 0x2c
    mov eax, dword [eax + 0x2e648]
    lea edx, [ebx + 0x218]
    add eax, 4
    call loc_0be4
    movsx eax, word [ebx + 0x340]
    imul eax, eax, 0x2c
    add eax, 0x2522b4
    mov edi, dword [esp]
    lea edx, [eax + 8]
    imul eax, edi, 0x2c
    mov eax, dword [eax + 0x2e648]
    add eax, 8
    call loc_0be4
    imul eax, dword [esp], 0x2c
    mov eax, dword [eax + 0x2e648]
    lea edx, [ebx + 0x298]
    add eax, 0x1c
    call loc_0be4
    imul edx, dword [ebx + 0x290], 0x2c
    imul eax, dword [esp], 0x2c
    add edx, 0x2e648
    add eax, 0x2e648
    add edx, 0x10
    add eax, 0x10
    call loc_0be4
    imul eax, dword [ebx + 0x290], 0x2c
    add eax, 0x2e648
    mov ebp, dword [esp]
    lea edx, [eax + 8]
    imul eax, ebp, 0x2c
    add eax, 0x2e648
    add eax, 8
    call loc_0be4
    movsx eax, word [0x2f2926]
    call 0x4e490
    imul eax, dword [esp], 0x2c
    mov ax, word [eax + 0x2e654]
    mov word [ebx + 0x312], ax
    imul eax, dword [esp], 0x2c
    mov eax, dword [eax + 0x2e650]
    mov edi, 0xffffffff
    lea edx, [ebx + 0x290]
    mov dword [eax*4 + 0x26fd8], edi
    mov eax, esp
    call loc_0be4
    test ecx, ecx
    je short loc_0da4
    imul eax, dword [ebx + 0x290], 0x2c
    imul ecx, dword [esp], 0x2c
    mov dword [eax + 0x2e64c], 1
    xor edi, edi
    mov eax, dword [ecx + 0x2e650]
    mov dword [ecx + 0x2e64c], edi
    call 0x67ff5
loc_0da4:
    mov ebp, 3
    mov dword [ebx + 0x21c], 0x2710
    mov dword [0x92e8], ebp
    add esp, 4
    pop ebp
    pop edi
    pop ecx
    ret
loc_0dc0:
    lea eax, [ebp - 1]
    mov dword [0x92e8], eax
    test eax, eax
    jg short loc_0dd4
    xor ebx, ebx
    mov dword [0x92e8], ebx
loc_0dd4:
    add esp, 4
    pop ebp
    pop edi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x1c
    mov esi, eax
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ecx, 0xf1720
    add eax, eax
    add ecx, eax
    mov eax, esp
    call 0x9e0d4
    mov ah, byte [ecx + 0x3a2]
    test ah, 1
    jne short loc_0e3d
    test ah, 0x10
    jne short loc_0e3d
    cmp word [0x125cf3], 0
    je short loc_0e96
    cmp byte [0x353ae9], 0
    sete al
    and eax, 0xff
    je short loc_0e96
loc_0e3d:
    xor eax, eax
    xor edi, edi
    xor edx, edx
    xor ebx, ebx
    mov dword [0x121408], eax
    mov word [0x123fc6], di
    mov dword [0x121404], eax
    mov dword [0x121b18], ebx
    xor eax, eax
    mov dword [0x12140c], edx
    mov word [0x123fc8], ax
    xor ah, ah
    mov dword [esp + 0xc], ebx
    mov byte [0x123fc4], ah
    xor eax, eax
    mov dword [esp + 8], ebx
    mov al, byte [0x8dbf]
    xor dl, dl
    shl eax, 0x1a
    mov byte [0x123fc5], dl
    mov dword [0x123fca], eax
    jmp near 0x483d5
loc_0e96:
    mov eax, dword [0x2d6bbc]
    mov edx, dword [0x151a24]
    sub eax, edx
    mov dword [esp + 0x18], eax
    mov eax, dword [0x2d6bbc]
    mov dword [0x151a24], eax
    mov eax, dword [0x354168]
    shr eax, 0xe
    mov ebx, dword [0x1b8c9c]
    and eax, 1
    test ebx, ebx
    je short loc_0ecd
    mov dword [0x92d8], eax
    jmp short loc_0efc
loc_0ecd:
    mov edx, dword [0x92dc]
    mov dword [0x92e0], edx
    mov dword [0x92dc], eax
    cmp eax, edx
    jle short loc_0efc
    xor byte [0x92d8], 1
    mov ax, word [0x92d8]
    db 0x05, 0x2c, 0x00, 0x00, 0x00    ; add eax, 0x2c
    mov edx, ecx
    cwde
    call 0x15e50
loc_0efc:
    cmp byte [0x126226], 1
    jne short loc_0f4a
    movsx eax, byte [0x12622a]
    mov edi, 0x20000
    shl eax, 0x12
    mov dword [0x123fca], edi
    or eax, edi
    mov dword [0x123fca], eax
    movsx eax, byte [0x12622b]
    mov ebp, dword [0x123fca]
    shl eax, 0x13
    or ebp, eax
    xor al, al
    mov dword [0x123fca], ebp
    mov byte [0x126226], al
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0f4a:
    mov eax, dword [0x354164]
    shr eax, 9
    and eax, 1
    mov dword [0x123fca], eax
    mov eax, dword [0x354164]
    shr eax, 0xa
    and eax, 1
    mov ebp, dword [0x123fca]
    add eax, eax
    or ebp, eax
    mov eax, dword [0x354164]
    shr eax, 5
    and eax, 1
    mov edx, ebp
    lea eax, [eax*4]
    or edx, eax
    mov eax, dword [0x354164]
    shr eax, 0x11
    and eax, 1
    mov ebx, edx
    lea eax, [eax*8]
    or ebx, eax
    mov eax, dword [0x354164]
    shr eax, 0x12
    and eax, 1
    mov edi, ebx
    shl eax, 4
    or edi, eax
    mov eax, dword [0x354164]
    shr eax, 7
    mov dword [0x123fca], ebp
    and eax, 1
    mov ebp, edi
    shl eax, 5
    or ebp, eax
    mov eax, dword [0x354164]
    shr eax, 0xd
    mov dword [0x123fca], edx
    and eax, 1
    mov edx, ebp
    shl eax, 6
    mov dword [0x123fca], ebx
    or edx, eax
    mov eax, dword [0x354164]
    mov dword [0x123fca], edi
    shr eax, 0xe
    xor edi, edi
    and eax, 1
    mov ebx, edx
    shl eax, 7
    mov dword [0x123fca], ebp
    or ebx, eax
    mov eax, dword [0x354164]
    mov dword [0x123fca], edx
    shr eax, 0x13
    mov dword [0x123fca], ebx
    test al, 1
    je short loc_104d
    cmp dword [0x2dfd8], 0
    je short loc_103b
    cmp dword [ecx + 0x290], 0
    je short loc_103b
    movsx edx, si
    xor ebx, ebx
    xor eax, eax
    call loc_0c24
    jmp short loc_104d
loc_103b:
    cmp dword [0x2dfd8], 0
    jne short loc_104d
    mov word [ecx + 0x312], 1
loc_104d:
    mov eax, dword [0x354164]
    shr eax, 0x14
    test al, 1
    je short loc_108e
    cmp dword [0x2dfd8], 0
    je short loc_107c
    cmp dword [ecx + 0x290], 1
    je short loc_107c
    mov eax, 1
    movsx edx, si
    xor ebx, ebx
    call loc_0c24
    jmp short loc_108e
loc_107c:
    cmp dword [0x2dfd8], 0
    jne short loc_108e
    mov word [ecx + 0x312], 2
loc_108e:
    mov eax, dword [0x354164]
    shr eax, 0x15
    test al, 1
    je short loc_10cf
    cmp dword [0x2dfd8], 0
    je short loc_10bd
    cmp dword [ecx + 0x290], 2
    je short loc_10bd
    mov eax, 2
    movsx edx, si
    xor ebx, ebx
    call loc_0c24
    jmp short loc_10cf
loc_10bd:
    cmp dword [0x2dfd8], 0
    jne short loc_10cf
    mov word [ecx + 0x312], 3
loc_10cf:
    mov eax, dword [0x354164]
    shr eax, 0x16
    test al, 1
    je short loc_1110
    cmp dword [0x2dfd8], 0
    je short loc_10fe
    cmp dword [ecx + 0x290], 3
    je short loc_10fe
    mov eax, 3
    movsx edx, si
    xor ebx, ebx
    call loc_0c24
    jmp short loc_1110
loc_10fe:
    cmp dword [0x2dfd8], 0
    jne short loc_1110
    mov word [ecx + 0x312], 4
loc_1110:
    mov eax, dword [0x354164]
    shr eax, 0x17
    test al, 1
    je short loc_1151
    cmp dword [0x2dfd8], 0
    je short loc_113f
    cmp dword [ecx + 0x290], 4
    je short loc_113f
    mov eax, 4
    movsx edx, si
    xor ebx, ebx
    call loc_0c24
    jmp short loc_1151
loc_113f:
    cmp dword [0x2dfd8], 0
    jne short loc_1151
    mov word [ecx + 0x312], 5
loc_1151:
    mov eax, dword [0x354164]
    shr eax, 0x18
    test al, 1
    je short loc_1192
    cmp dword [0x2dfd8], 0
    je short loc_1180
    cmp dword [ecx + 0x290], 5
    je short loc_1180
    mov eax, 5
    movsx edx, si
    xor ebx, ebx
    call loc_0c24
    jmp short loc_1192
loc_1180:
    cmp dword [0x2dfd8], 0
    jne short loc_1192
    mov word [ecx + 0x312], 6
loc_1192:
    mov eax, dword [0x354164]
    shr eax, 0x19
    test al, 1
    je short loc_11d3
    cmp dword [0x2dfd8], 0
    je short loc_11c1
    cmp dword [ecx + 0x290], 6
    je short loc_11c1
    mov eax, 6
    movsx edx, si
    xor ebx, ebx
    call loc_0c24
    jmp short loc_11d3
loc_11c1:
    cmp dword [0x2dfd8], 0
    jne short loc_11d3
    mov word [ecx + 0x312], 7
loc_11d3:
    mov eax, dword [0x354164]
    shr eax, 0x1a
    test al, 1
    je short loc_11f1
    cmp dword [0x2dfd8], 0
    jne short loc_11f1
    mov word [ecx + 0x312], 8
loc_11f1:
    movsx eax, di
    mov edx, dword [0x123fca]
    shl eax, 8
    or edx, eax
    mov eax, dword [0x354168]
    shr eax, 0x10
    and eax, 1
    mov ebx, edx
    shl eax, 0xc
    or ebx, eax
    mov eax, dword [0x354164]
    shr eax, 0xb
    and eax, 1
    mov esi, ebx
    shl eax, 0xd
    or esi, eax
    mov eax, dword [0x354164]
    shr eax, 0xc
    and eax, 1
    mov edi, esi
    shl eax, 0xe
    or edi, eax
    mov eax, dword [0x354168]
    shr eax, 2
    and eax, 1
    mov ebp, edi
    shl eax, 0xf
    or ebp, eax
    mov eax, dword [0x354168]
    shr eax, 3
    mov dword [0x123fca], edx
    and eax, 1
    mov edx, ebp
    shl eax, 0x10
    or edx, eax
    mov eax, dword [0x354168]
    shr eax, 9
    mov dword [0x123fca], ebx
    and eax, 1
    mov ebx, edx
    shl eax, 0x12
    or ebx, eax
    mov eax, dword [0x354168]
    mov dword [0x123fca], esi
    shr eax, 0xa
    mov dword [0x123fca], edi
    and eax, 1
    mov esi, ebx
    shl eax, 0x13
    mov dword [0x123fca], ebp
    or esi, eax
    mov eax, dword [0x354164]
    mov dword [0x123fca], edx
    shr eax, 0x1e
    mov dword [0x123fca], ebx
    and eax, 1
    mov edi, esi
    shl eax, 0x14
    mov dword [0x123fca], esi
    or edi, eax
    mov dword [0x123fca], edi
    cmp byte [0x353ae9], 0
    setne al
    and eax, 0xff
    mov ebp, edi
    shl eax, 0x15
    or ebp, eax
    mov eax, dword [0x354168]
    shr eax, 0x11
    and eax, 1
    mov edx, ebp
    shl eax, 0x16
    or edx, eax
    mov eax, dword [0x92d8]
    mov ebx, edx
    shl eax, 0x17
    or ebx, eax
    mov eax, dword [0x354168]
    and eax, 1
    mov esi, ebx
    shl eax, 0x18
    or esi, eax
    mov eax, dword [0x354168]
    shr eax, 1
    and eax, 1
    mov edi, esi
    shl eax, 0x19
    or edi, eax
    xor eax, eax
    mov dword [0x123fca], ebp
    mov al, byte [0x8dbf]
    mov ebp, edi
    shl eax, 0x1a
    or ebp, eax
    mov eax, dword [0x354164]
    shr eax, 0x1f
    mov dword [0x123fca], edx
    and eax, 1
    mov edx, ebp
    shl eax, 0x1b
    or edx, eax
    mov eax, dword [0x354168]
    shr eax, 4
    mov dword [0x123fca], ebx
    and eax, 1
    mov ebx, edx
    shl eax, 0x1c
    or ebx, eax
    mov eax, dword [0x354164]
    mov dword [0x123fca], esi
    shr eax, 6
    mov dword [0x123fca], edi
    and eax, 1
    mov esi, ebx
    shl eax, 0x1d
    mov dword [0x123fca], ebp
    or esi, eax
    mov eax, dword [0x354164]
    mov dword [0x123fca], edx
    shr eax, 0x1d
    mov dword [0x123fca], ebx
    and eax, 1
    mov edi, esi
    shl eax, 0x1e
    mov dword [0x123fca], esi
    or edi, eax
    mov dword [0x123fca], edi
    cmp byte [0x353a91], 0
    setne al
    and eax, 0xff
    shl eax, 0x1f
    mov ebp, edi
    or ebp, eax
    mov eax, dword [0x354164]
    shr eax, 7
    mov esi, dword [0x125d37]
    and eax, 1
    mov dword [0x123fca], ebp
    or esi, eax
    xor eax, eax
    mov ebp, dword [0x14074]
    mov dword [0x12140c], eax
    mov dword [0x121b18], eax
    mov dword [0x121408], eax
    mov dword [0x121404], eax
    test ebp, ebp
    je short loc_1408
    test esi, esi
    je short loc_1408
    mov eax, dword [esp + 8]
    add eax, eax
    mov dword [esp + 8], eax
loc_1408:
    mov eax, dword [0x354164]
    shr eax, 4
    test al, 1
    je short loc_142e
    mov edx, dword [esp + 0xc]
    neg edx
    mov eax, edx
    sar edx, 0x1f
    shl edx, 3
    db 0x1b, 0xc2    ; sbb eax, edx
    sar eax, 3
    mov dword [0x121404], eax
    jmp short loc_1444
loc_142e:
    mov eax, dword [esp + 0xc]
    mov edx, eax
    sar edx, 0x1f
    shl edx, 6
    db 0x1b, 0xc2    ; sbb eax, edx
    sar eax, 6
    mov dword [0x121b18], eax
loc_1444:
    cmp dword [0x92d8], 0
    je short loc_147a
    mov eax, dword [esp + 8]
    mov edx, eax
    mov ebx, 0xba
    sar edx, 0x1f
    idiv ebx
    cmp dword [0x1261f7], 0
    je short loc_146e
    sub dword [0x12140c], eax
    jmp short loc_1474
loc_146e:
    add dword [0x12140c], eax
loc_1474:
    xor eax, eax
    mov dword [esp + 8], eax
loc_147a:
    mov eax, dword [esp]
    mov edx, dword [0x121404]
    sub edx, eax
    mov eax, dword [esp + 8]
    neg eax
    sar eax, 6
    mov dword [0x121404], edx
    mov dword [0x121408], eax
    test esi, esi
    je short loc_14b1
    mov ebx, dword [0x92e4]
    mov edi, 0x14
    lea ebx, [ebx*4]
    jmp short loc_150b
loc_14b1:
    mov ebp, 0x50
    mov eax, dword [0x92d0]
    xor edx, edx
    div ebp
    mov ebx, dword [0x92e4]
    mov edi, 0xa
    add ebx, ebx
    test edx, edx
    jne short loc_150b
    mov ebp, dword [ecx + 0x288]
    cmp ebp, 0x64
    jge short loc_150b
    lea eax, [ebp + 1]
    mov dword [ecx + 0x288], eax
    mov edx, dword [0x92e4]
    cmp edx, 0x28
    jge short loc_14f8
    lea ebp, [edx + 2]
    mov dword [0x92e4], ebp
loc_14f8:
    mov eax, dword [0x92cc]
    cmp eax, 0x14
    jge short loc_150b
    lea edx, [eax + 1]
    mov dword [0x92cc], edx
loc_150b:
    mov eax, dword [0x354164]
    mov edx, dword [0x354164]
    shr eax, 4
    shr edx, 2
    test al, 1
    je short loc_1543
    test dl, 1
    je short loc_152b
    add dword [0x121404], ebx
loc_152b:
    mov eax, dword [0x354164]
    shr eax, 3
    test al, 1
    je near loc_159e
    sub dword [0x121404], ebx
    jmp short loc_159e
loc_1543:
    mov ebp, dword [esp + 0x18]
    mov eax, dword [0x151a28]
    add eax, ebp
    test dl, 1
    je short loc_156e
    mov dword [0x151a28], eax
    cmp eax, 0xf
    jl short loc_1565
    sub dword [0x121b18], edi
    jmp short loc_159e
loc_1565:
    sub dword [0x121b18], 5
    jmp short loc_159e
loc_156e:
    mov edx, dword [0x354164]
    shr edx, 3
    test dl, 1
    je short loc_1597
    mov dword [0x151a28], eax
    cmp eax, 0xf
    jl short loc_158e
    add dword [0x121b18], edi
    jmp short loc_159e
loc_158e:
    add dword [0x121b18], 5
    jmp short loc_159e
loc_1597:
    xor eax, eax
    mov dword [0x151a28], eax
loc_159e:
    mov eax, dword [0x354164]
    shr eax, 0xf
    test al, 1
    je short loc_15b0
    add dword [0x121404], ebx
loc_15b0:
    mov eax, dword [0x354164]
    shr eax, 0x10
    test al, 1
    je short loc_15c2
    sub dword [0x121404], ebx
loc_15c2:
    test byte [0x354164], 1
    je short loc_15d1
    add dword [0x121408], ebx
loc_15d1:
    mov eax, dword [0x354164]
    shr eax, 1
    test al, 1
    je near 0x4820b
    sub dword [0x121408], ebx
    test esi, esi
    je short 0x4820b
    mov ebx, 0x14
    mov eax, dword [0x92d0]
    xor edx, edx
    div ebx
    test edx, edx
    jne short 0x4820b
    mov eax, dword [ecx + 0x288]
    test eax, eax
    jl short 0x4820b
    lea edx, [eax - 1]
    mov dword [ecx + 0x288], edx
    cmp dword [0x92cc], 4
    jle short 0x481dd
%else
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x20
    mov dword [esp + 0x14], eax
    cwde
    mov ebx, eax
    shl ebx, 7
    sub ebx, eax
    lea ebx, [ebx*4]
    sub ebx, eax
    mov esi, 0xb4f00
    add ebx, ebx
    xor ah, ah
    add esi, ebx
    mov byte [esp + 0x1c], ah
    mov ax, word [esi + 0x2a0]
    cwde
    test eax, eax
    jns short loc_003b
    neg eax
loc_003b:
    mov edx, eax
    mov ecx, 9
    sar edx, 0x1f
    idiv ecx
    mov dword [esp + 0x10], eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov cl, byte [eax + 0x1c0bb4]
    lea ebx, [esi + 0x334]
    cmp cl, 0x18
    jle short loc_0068
    mov cl, 0x18
loc_0068:
    cmp word [esi + 0x31e], 0
    jge near loc_0b41
    cmp word [0xe92f7], 0
    jge near loc_0b41
    cmp word [esi + 0x344], 0
    jg near loc_0b41
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x1c0bb5], 1
    je short loc_00b3
    cmp word [eax + 0x1c0bce], 0
    jle near loc_0b41
loc_00b3:
    movsx edi, word [esp + 0x14]
    movsx ebp, cl
    mov edx, edi
    mov eax, ebp
    call 0x48df0
    test al, al
    jne near loc_0b41
    mov edx, edi
    mov eax, ebp
    call 0x493b0
    test al, al
    jne near loc_0b41
    mov edx, edi
    mov eax, ebp
    call 0x49500
    test al, al
    jne near loc_0b41
    movsx eax, word [esi + 0x392]
    imul eax, eax
    mov ebp, 0x50
    sub ebp, eax
    mov eax, dword [esi + 0x270]
    sar eax, 1
    mov dword [esp + 8], eax
    add eax, 0x200
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [eax*2 + 0x1b7fa4]
    mov edi, 0x600
    mov eax, edx
    sar edx, 0x1f
    idiv edi
    mov edi, 0x46
    sub edi, eax
    movsx eax, word [esi + 0x338]
    add eax, 0x3a
    sub edi, eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x1c0bb8], 0x20
    jae short loc_016e
    mov eax, dword [esi + 0x270]
    lea eax, [eax*4]
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    sar eax, 9
    jmp short loc_0182
loc_016e:
    mov eax, dword [esp + 8]
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    sar eax, 0xa
loc_0182:
    test eax, eax
    jns short loc_0188
    neg eax
loc_0188:
    sub ebp, eax
    xor eax, eax
    mov al, byte [esi + 0x3ed]
    lea eax, [eax*8]
    sub ebp, eax
    mov ax, word [esi + 0x314]
    test ax, ax
    jl short loc_01aa
    cwde
    jmp short loc_01b1
loc_01aa:
    movsx eax, word [esi + 0x312]
loc_01b1:
    mov dword [esp + 0xc], eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov ch, byte [eax + 0x1c0bb8]
    mov dword [esp + 4], eax
    cmp ch, 0x28
    jae near loc_02d1
    cmp byte [esi + 0x3cb], 0
    jne short loc_0204
    movsx edx, word [eax + 0x1c0bc4]
    mov eax, 0x20
    sar edx, 1
    mov ebx, dword [esp + 0x10]
    sub eax, edx
    add ebx, eax
    movsx eax, word [0xfce54]
    add eax, edx
    mov dword [esp + 0x10], ebx
    mov word [0xfce54], ax
loc_0204:
    mov ax, word [0xfce54]
    and ah, 7
    cwde
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov edx, eax
    sar edx, 0xa
    mov dword [esp + 0xc], edi
    add edi, edx
    xor edx, edx
    mov dl, byte [esp + 0x1c]
    mov ebx, 0x668
    push edx
    mov edx, dword [esp + 0x14]
    sar eax, 8
    add edx, 0x102
    test eax, eax
    jns short loc_0240
    neg eax
loc_0240:
    sub edx, eax
    movsx eax, word [esi + 0x2a0]
    add edi, 0xfa
    sar eax, 1
    movsx ebp, cl
    sub edi, eax
    mov ecx, ebp
    mov eax, edi
    call 0x12f50
    mov ax, word [0xfce54]
    and ah, 7
    cwde
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov edi, eax
    mov edx, dword [esp + 0xc]
    sar edi, 0xa
    sub edx, edi
    mov edi, edx
    mov dl, byte [esp + 0x1c]
    or dl, 4
    and edx, 0xff
    push edx
    mov edx, dword [esp + 0x14]
    sar eax, 8
    add edx, 0xc8
    test eax, eax
    jns short loc_029f
    neg eax
loc_029f:
    add edx, eax
    movsx eax, word [esi + 0x2a0]
    add edi, 0x28
    sar eax, 1
    mov ebx, 0x668
    sub edi, eax
    mov ecx, ebp
    mov eax, edi
    call 0x12f50
    movsx eax, word [esp + 0x14]
    call 0x48cb0
    add esp, 0x20
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_02d1:
    mov eax, dword [esp + 0xc]
    dec eax
    cmp eax, 4
    ja near loc_0b37
    jmp dword cs:[eax*4 + 0x3970c]
    mov eax, dword [esp + 4]
    mov ch, byte [eax + 0x1c0bb5]
    cmp ch, 1
    jne short loc_02fc
    mov byte [esp + 0x18], ch
    jmp short loc_031d
loc_02fc:
    movsx eax, word [esi + 0x29e]
    mov dword [esp], eax
    mov edx, dword [esp]
    lea eax, [eax*4]
    add eax, edx
    mov al, byte [eax*8 + 0x2385c1]
    mov byte [esp + 0x18], al
loc_031d:
    movsx eax, word [esi + 0x312]
    movsx eax, word [esi + eax*2 + 0x2f0]
    lea eax, [eax*4]
    add eax, 0x2d
    sub ebp, eax
    mov ax, word [ebx]
    add edi, 0x28
    test ax, ax
    jle short loc_037e
    db 0x66, 0x3d, 0x08, 0x00    ; cmp ax, 8
    jge short loc_037e
    xor eax, eax
    mov al, byte [esp + 0x18]
    push eax
    xor eax, eax
    mov edx, dword [esp + 0x14]
    mov al, byte [esp + 0x20]
    movsx ecx, cl
    push eax
    movsx eax, word [ebx]
    add edx, edx
    sar eax, 1
    add edx, 0xb0
    add eax, 0x10
    sub edx, ebp
    movsx ebx, ax
    lea eax, [edi + 0xa4]
    call 0x13000
loc_037e:
    mov edx, dword [esp + 0x10]
    mov ebx, 0x279
    xor eax, eax
    xor ecx, ecx
    mov al, byte [esp + 0x18]
    add edx, edx
    push eax
    xor eax, eax
    add edx, 0xb0
    mov al, byte [esp + 0x20]
    sub edx, ebp
    push eax
    mov dword [esp + 8], eax
    lea eax, [edi + 0xa4]
    call 0x13000
    push -2
    mov ecx, dword [esp + 4]
    mov ebx, 0x283
    mov edx, 0x96
    push ecx
    mov eax, 0x32
    xor ecx, ecx
    call 0x13070
    mov edx, 0xaa
    movsx eax, word [esi + 0x312]
    xor ecx, ecx
    movsx ebx, word [esi + eax*2 + 0x2ce]
    mov eax, 0x23
    call 0x40e60
    mov edx, 0xaa
    mov eax, 0x4b
    mov ebx, dword [0x223b0]
    xor ecx, ecx
    call 0x40e60
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jg near loc_0b37
    mov eax, 0x18f
    call 0x5aa80
    movsx eax, word [0x261216]
    mov ebx, eax
    shl ebx, 7
    sub ebx, eax
    lea ebx, [ebx*4]
    sub ebx, eax
    movsx eax, word [esi + 0x312]
    add ebx, ebx
    inc word [ebx + eax*2 + 0xb51f0]
    movsx eax, word [esi + 0x312]
    add eax, eax
    add ebx, eax
    mov edi, dword [0x9258]
    movsx eax, word [ebx + 0xb51f0]
    cmp eax, edi
    jl near loc_0b37
    xor edi, edi
    mov word [ebx + 0xb51f0], di
    movsx eax, word [esi + 0x312]
    mov word [esi + eax*2 + 0x2ce], 0x4b
    sub dword [0x223b0], 0x4b
    movsx eax, word [esp + 0x14]
    call 0x48cb0
    add esp, 0x20
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [esp + 4]
    mov dl, byte [eax + 0x1c0bb5]
    cmp dl, 1
    jne short loc_04b6
    mov byte [esp + 0x18], dl
    jmp short loc_04d7
loc_04b6:
    movsx eax, word [esi + 0x29e]
    mov dword [esp], eax
    mov edx, dword [esp]
    lea eax, [eax*4]
    add eax, edx
    mov al, byte [eax*8 + 0x2385c1]
    mov byte [esp + 0x18], al
loc_04d7:
    movsx eax, word [esi + 0x312]
    movsx eax, word [esi + eax*2 + 0x2f0]
    lea eax, [eax*4]
    add edi, 0x28
    add eax, 0x28
    mov dx, word [ebx]
    sub ebp, eax
    test dx, dx
    jle short loc_0538
    cmp dx, 8
    jge short loc_0538
    xor eax, eax
    mov al, byte [esp + 0x18]
    push eax
    xor eax, eax
    mov al, byte [esp + 0x20]
    push eax
    movsx eax, dx
    movsx ecx, cl
    sar eax, 1
    mov edx, dword [esp + 0x18]
    add eax, 0x10
    add edx, edx
    movsx ebx, ax
    add edx, 0xb0
    lea eax, [edi + 0xa4]
    sub edx, ebp
    call 0x13000
loc_0538:
    mov edx, dword [esp + 0x10]
    mov ebx, 0x27a
    xor eax, eax
    xor ecx, ecx
    mov al, byte [esp + 0x18]
    add edx, edx
    push eax
    xor eax, eax
    add edx, 0xb0
    mov al, byte [esp + 0x20]
    sub edx, ebp
    push eax
    mov dword [esp + 8], eax
    lea eax, [edi + 0xa4]
    call 0x13000
    push -2
    mov ecx, dword [esp + 4]
    mov ebx, 0x284
    mov edx, 0x96
    push ecx
    mov eax, 0x32
    xor ecx, ecx
    call 0x13070
    mov edx, 0xaa
    movsx eax, word [esi + 0x312]
    xor ecx, ecx
    movsx ebx, word [esi + eax*2 + 0x2ce]
    mov eax, 0x23
    call 0x40e60
    mov edx, 0xaa
    mov eax, 0x4b
    mov ebx, dword [0x223b0]
    xor ecx, ecx
    call 0x40e60
    movsx edx, word [esi + 0x312]
    add edx, edx
    cmp word [edx + esi + 0x2ce], 0
    jg near loc_0b37
    movsx eax, word [0x261216]
    mov ebx, eax
    shl ebx, 7
    sub ebx, eax
    lea ebx, [ebx*4]
    sub ebx, eax
    add ebx, ebx
    inc word [edx + ebx + 0xb51f0]
    movsx eax, word [esi + 0x312]
    add eax, eax
    add ebx, eax
    mov edi, dword [0x9258]
    movsx eax, word [ebx + 0xb51f0]
    cmp eax, edi
    jl near loc_0b37
    xor edi, edi
    mov word [ebx + 0xb51f0], di
    movsx eax, word [esi + 0x312]
    mov word [esi + eax*2 + 0x2ce], 0x64
    sub dword [0x223b0], 0x64
    movsx eax, word [esp + 0x14]
    call 0x48cb0
    add esp, 0x20
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [esp + 4]
    mov dl, byte [eax + 0x1c0bb5]
    cmp dl, 1
    jne short loc_0661
    mov byte [esp + 0x18], dl
    jmp short loc_0682
loc_0661:
    movsx eax, word [esi + 0x29e]
    mov dword [esp], eax
    mov edx, dword [esp]
    lea eax, [eax*4]
    add eax, edx
    mov al, byte [eax*8 + 0x2385c1]
    mov byte [esp + 0x18], al
loc_0682:
    movsx eax, word [esi + 0x312]
    movsx eax, word [esi + eax*2 + 0x2f0]
    lea eax, [eax*4]
    add eax, 0x41
    sub ebp, eax
    mov ax, word [ebx]
    test ax, ax
    jle short loc_06e0
    db 0x66, 0x3d, 0x08, 0x00    ; cmp ax, 8
    jge short loc_06e0
    xor eax, eax
    mov al, byte [esp + 0x18]
    push eax
    xor eax, eax
    mov edx, dword [esp + 0x14]
    mov al, byte [esp + 0x20]
    movsx ecx, cl
    push eax
    movsx eax, word [ebx]
    add edx, edx
    sar eax, 1
    add edx, 0xb0
    add eax, 0x10
    sub edx, ebp
    movsx ebx, ax
    lea eax, [edi + 0xa4]
    call 0x13000
loc_06e0:
    mov edx, dword [esp + 0x10]
    mov ecx, 0xa
    xor eax, eax
    mov ebx, 0x276
    mov al, byte [esp + 0x18]
    add edx, edx
    push eax
    xor eax, eax
    add edx, 0xb0
    mov al, byte [esp + 0x20]
    sub edx, ebp
    push eax
    mov dword [esp + 8], eax
    lea eax, [edi + 0xa4]
    call 0x13000
    push -2
    mov ecx, dword [esp + 4]
    mov ebx, 0x280
    mov edx, 0x96
    push ecx
    mov eax, 0x32
    xor ecx, ecx
    call 0x13070
    mov edx, 0xaa
    movsx eax, word [esi + 0x312]
    xor ecx, ecx
    movsx ebx, word [esi + eax*2 + 0x2ce]
    mov eax, 0x23
    call 0x40e60
    mov edx, 0xaa
    mov eax, 0x4b
    mov ebx, dword [0x223b0]
    xor ecx, ecx
    call 0x40e60
    movsx edx, word [esi + 0x312]
    add edx, edx
    cmp word [edx + esi + 0x2ce], 0
    jg near loc_0b37
    movsx eax, word [0x261216]
    mov ebx, eax
    shl ebx, 7
    sub ebx, eax
    lea ebx, [ebx*4]
    sub ebx, eax
    add ebx, ebx
    inc word [edx + ebx + 0xb51f0]
    movsx eax, word [esi + 0x312]
    add eax, eax
    add ebx, eax
    mov edi, dword [0x9258]
    movsx eax, word [ebx + 0xb51f0]
    cmp eax, edi
    jl near loc_0b37
    xor edi, edi
    mov word [ebx + 0xb51f0], di
    movsx eax, word [esi + 0x312]
    mov word [esi + eax*2 + 0x2ce], 0xc
    sub dword [0x223b0], 0xc
    movsx eax, word [esp + 0x14]
    call 0x48cb0
    add esp, 0x20
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [esp + 4]
    mov dl, byte [eax + 0x1c0bb5]
    cmp dl, 1
    jne short loc_080c
    mov byte [esp + 0x18], dl
    jmp short loc_082d
loc_080c:
    movsx eax, word [esi + 0x29e]
    mov dword [esp], eax
    mov edx, dword [esp]
    lea eax, [eax*4]
    add eax, edx
    mov al, byte [eax*8 + 0x2385c1]
    mov byte [esp + 0x18], al
loc_082d:
    movsx eax, word [esi + 0x312]
    movsx eax, word [esi + eax*2 + 0x2f0]
    lea eax, [eax*4]
    add eax, 0x2d
    sub ebp, eax
    mov ax, word [ebx]
    add edi, 0x23
    test ax, ax
    jle short loc_088e
    db 0x66, 0x3d, 0x08, 0x00    ; cmp ax, 8
    jge short loc_088e
    xor eax, eax
    mov al, byte [esp + 0x18]
    push eax
    xor eax, eax
    mov al, byte [esp + 0x20]
    mov edx, dword [esp + 0x14]
    push eax
    movsx eax, word [ebx]
    movsx ecx, cl
    sar eax, 1
    add edx, edx
    add eax, 0x10
    add edx, 0xb0
    movsx ebx, ax
    lea eax, [edi + 0xa4]
    sub edx, ebp
    call 0x13000
loc_088e:
    mov edx, dword [esp + 0x10]
    mov ecx, 0xa
    xor eax, eax
    mov ebx, 0x278
    mov al, byte [esp + 0x18]
    add edx, edx
    push eax
    xor eax, eax
    add edx, 0xb0
    mov al, byte [esp + 0x20]
    sub edx, ebp
    push eax
    mov dword [esp + 8], eax
    lea eax, [edi + 0xa4]
    call 0x13000
    push -2
    mov ecx, dword [esp + 4]
    mov ebx, 0x282
    mov edx, 0x96
    push ecx
    mov eax, 0x32
    xor ecx, ecx
    call 0x13070
    mov edx, 0xaa
    movsx eax, word [esi + 0x312]
    xor ecx, ecx
    movsx ebx, word [esi + eax*2 + 0x2ce]
    mov eax, 0x23
    call 0x40e60
    mov edx, 0xaa
    mov eax, 0x4b
    mov ebx, dword [0x223b0]
    xor ecx, ecx
    call 0x40e60
    movsx edx, word [esi + 0x312]
    add edx, edx
    cmp word [edx + esi + 0x2ce], 0
    jg near loc_0b37
    movsx eax, word [0x261216]
    mov ebx, eax
    shl ebx, 7
    sub ebx, eax
    lea ebx, [ebx*4]
    sub ebx, eax
    add ebx, ebx
    inc word [edx + ebx + 0xb51f0]
    movsx eax, word [esi + 0x312]
    add eax, eax
    add eax, ebx
    mov edi, dword [0x9258]
    movsx edx, word [eax + 0xb51f0]
    cmp edx, edi
    jl near loc_0b37
    xor edi, edi
    mov word [eax + 0xb51f0], di
    movsx eax, word [esi + 0x312]
    mov word [esi + eax*2 + 0x2ce], 0x4b
    sub dword [0x223b0], 0x4b
    movsx eax, word [esp + 0x14]
    call 0x48cb0
    add esp, 0x20
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [esp + 4]
    mov ch, byte [eax + 0x1c0bb5]
    cmp ch, 1
    jne short loc_09ba
    mov byte [esp + 0x18], ch
    jmp short loc_09db
loc_09ba:
    movsx eax, word [esi + 0x29e]
    mov dword [esp], eax
    mov edx, dword [esp]
    lea eax, [eax*4]
    add eax, edx
    mov al, byte [eax*8 + 0x2385c1]
    mov byte [esp + 0x18], al
loc_09db:
    movsx eax, word [esi + 0x312]
    movsx eax, word [esi + eax*2 + 0x2f0]
    lea eax, [eax*4]
    add eax, 0x2d
    sub ebp, eax
    mov ax, word [ebx]
    add edi, 0x23
    test ax, ax
    jle short loc_0a3c
    db 0x66, 0x3d, 0x08, 0x00    ; cmp ax, 8
    jge short loc_0a3c
    xor eax, eax
    mov al, byte [esp + 0x18]
    push eax
    xor eax, eax
    mov edx, dword [esp + 0x14]
    mov al, byte [esp + 0x20]
    movsx ecx, cl
    push eax
    movsx eax, word [ebx]
    add edx, edx
    sar eax, 1
    add edx, 0xb0
    add eax, 0x10
    sub edx, ebp
    movsx ebx, ax
    lea eax, [edi + 0xa4]
    call 0x13000
loc_0a3c:
    mov edx, dword [esp + 0x10]
    mov ecx, 0xa
    xor eax, eax
    mov ebx, 0x277
    mov al, byte [esp + 0x18]
    add edx, edx
    push eax
    xor eax, eax
    add edx, 0xb0
    mov al, byte [esp + 0x20]
    sub edx, ebp
    push eax
    mov dword [esp + 8], eax
    lea eax, [edi + 0xa4]
    call 0x13000
    push -2
    mov ecx, dword [esp + 4]
    mov ebx, 0x281
    mov edx, 0x96
    push ecx
    mov eax, 0x32
    xor ecx, ecx
    call 0x13070
    mov edx, 0xaa
    movsx eax, word [esi + 0x312]
    xor ecx, ecx
    movsx ebx, word [esi + eax*2 + 0x2ce]
    mov eax, 0x23
    call 0x40e60
    mov edx, 0xaa
    mov eax, 0x4b
    mov ebx, dword [0x223b0]
    xor ecx, ecx
    call 0x40e60
    movsx edx, word [esi + 0x312]
    add edx, edx
    cmp word [edx + esi + 0x2ce], 0
    jg short loc_0b37
    movsx eax, word [0x261216]
    mov ebx, eax
    shl ebx, 7
    sub ebx, eax
    lea ebx, [ebx*4]
    sub ebx, eax
    add ebx, ebx
    inc word [edx + ebx + 0xb51f0]
    movsx eax, word [esi + 0x312]
    add eax, eax
    add ebx, eax
    mov edi, dword [0x9258]
    movsx eax, word [ebx + 0xb51f0]
    cmp eax, edi
    jl short loc_0b37
    xor edi, edi
    mov word [ebx + 0xb51f0], di
    movsx eax, word [esi + 0x312]
    mov word [esi + eax*2 + 0x2ce], 0x28
    sub dword [0x223b0], 0x28
loc_0b37:
    movsx eax, word [esp + 0x14]
    call 0x48cb0
loc_0b41:
    add esp, 0x20
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
loc_0b50:
    push ebx
    mov ebx, dword [eax]
    mov dword [ecx], ebx
    mov ebx, dword [edx]
    mov dword [eax], ebx
    mov eax, dword [ecx]
    mov dword [edx], eax
    pop ebx
    ret
    nop
loc_0b60:
    push ecx
    push esi
    push edi
    sub esp, 4
    mov dword [esp], eax
    mov ecx, ebx
    test ebx, ebx
    je short loc_0b77
    xor ebx, ebx
    mov dword [0x9278], ebx
loc_0b77:
    mov esi, dword [0x9278]
    test esi, esi
    jne near loc_0cb2
    mov esi, dword [esp]
    shl esi, 4
    cmp dword [esi + 0x224ac], 0
    je near loc_0cc6
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, 0xb4f00
    add eax, eax
    add ebx, eax
    lea edx, [ebx + 0x214]
    mov eax, dword [esi + 0x224a8]
    call loc_0b50
    mov eax, dword [esp]
    shl eax, 4
    mov eax, dword [eax + 0x224a8]
    lea edx, [ebx + 0x218]
    add eax, 4
    call loc_0b50
    mov eax, dword [esp]
    shl eax, 4
    mov eax, dword [eax + 0x224a8]
    lea edx, [ebx + 0x21c]
    add eax, 8
    call loc_0b50
    mov eax, dword [esp]
    shl eax, 4
    mov eax, dword [eax + 0x224a8]
    lea edx, [ebx + 0x298]
    add eax, 0x1c
    call loc_0b50
    mov edx, dword [ebx + 0x290]
    mov eax, dword [esp]
    shl edx, 4
    shl eax, 4
    mov edx, dword [edx + 0x224a8]
    mov eax, dword [eax + 0x224a8]
    add edx, 0xe
    add eax, 0xe
    call loc_0b50
    mov eax, dword [esp]
    shl eax, 4
    mov ax, word [eax + 0x224b4]
    mov word [ebx + 0x312], ax
    mov edx, dword [ebx + 0x290]
    mov eax, dword [esp]
    shl edx, 4
    shl eax, 4
    add edx, 0x224a8
    add eax, 0x224a8
    add edx, 8
    add eax, 8
    call loc_0b50
    mov eax, esp
    lea edx, [ebx + 0x290]
    call loc_0b50
    test ecx, ecx
    je short loc_0ca1
    mov eax, dword [ebx + 0x290]
    shl eax, 4
    mov dword [eax + 0x224ac], 1
    mov eax, dword [esp]
    shl eax, 4
    xor esi, esi
    mov dword [eax + 0x224ac], esi
loc_0ca1:
    mov dword [0x9278], 5
    add esp, 4
    pop edi
    pop esi
    pop ecx
    ret
loc_0cb2:
    lea edi, [esi - 1]
    mov dword [0x9278], edi
    test edi, edi
    jg short loc_0cc6
    xor eax, eax
    mov dword [0x9278], eax
loc_0cc6:
    add esp, 4
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x1c
    mov esi, eax
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ecx, 0xb4f00
    add eax, eax
    add ecx, eax
    mov eax, esp
    call 0xa0c14
    mov ah, byte [ecx + 0x3a2]
    test ah, 1
    jne short loc_0d29
    test ah, 0x10
    jne short loc_0d29
    cmp word [0xe92f3], 0
    je short loc_0d82
    cmp byte [0x2c23d9], 0
    sete al
    and eax, 0xff
    je short loc_0d82
loc_0d29:
    xor eax, eax
    xor edi, edi
    xor edx, edx
    xor ebx, ebx
    mov dword [0xe445c], eax
    mov word [0xe75c6], di
    mov dword [0xe4458], eax
    mov dword [0xe4b6c], ebx
    xor eax, eax
    mov dword [0xe4460], edx
    mov word [0xe75c8], ax
    xor ah, ah
    mov dword [esp + 0xc], ebx
    mov byte [0xe75c4], ah
    xor eax, eax
    mov dword [esp + 8], ebx
    mov al, byte [0x8d63]
    xor dl, dl
    shl eax, 0x1a
    mov byte [0xe75c5], dl
    mov dword [0xe75ca], eax
    jmp near 0x4ae15
loc_0d82:
    mov eax, dword [0x2454ac]
    mov edx, dword [0xfcc74]
    sub eax, edx
    mov dword [esp + 0x18], eax
    mov eax, dword [0x2454ac]
    mov dword [0xfcc74], eax
    mov eax, dword [0x2c2a58]
    shr eax, 0xe
    mov ebx, dword [0x12758c]
    and eax, 1
    test ebx, ebx
    je short loc_0db9
    mov dword [0x9268], eax
    jmp short loc_0de8
loc_0db9:
    mov edx, dword [0x926c]
    mov dword [0x9270], edx
    mov dword [0x926c], eax
    cmp eax, edx
    jle short loc_0de8
    xor byte [0x9268], 1
    mov ax, word [0x9268]
    db 0x05, 0x2c, 0x00, 0x00, 0x00    ; add eax, 0x2c
    mov edx, ecx
    cwde
    call 0x15e90
loc_0de8:
    cmp byte [0xe9825], 1
    jne short loc_0e36
    movsx eax, byte [0xe9828]
    mov edi, 0x20000
    shl eax, 0x12
    mov dword [0xe75ca], edi
    or eax, edi
    mov dword [0xe75ca], eax
    movsx eax, byte [0xe9829]
    mov ebp, dword [0xe75ca]
    shl eax, 0x13
    or ebp, eax
    xor al, al
    mov dword [0xe75ca], ebp
    mov byte [0xe9825], al
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0e36:
    mov eax, dword [0x2c2a54]
    shr eax, 9
    and eax, 1
    mov dword [0xe75ca], eax
    mov eax, dword [0x2c2a54]
    shr eax, 0xa
    and eax, 1
    mov ebp, dword [0xe75ca]
    add eax, eax
    or ebp, eax
    mov eax, dword [0x2c2a54]
    shr eax, 5
    and eax, 1
    mov edx, ebp
    lea eax, [eax*4]
    or edx, eax
    mov eax, dword [0x2c2a54]
    shr eax, 0x11
    and eax, 1
    mov ebx, edx
    lea eax, [eax*8]
    or ebx, eax
    mov eax, dword [0x2c2a54]
    shr eax, 0x12
    and eax, 1
    mov edi, ebx
    shl eax, 4
    or edi, eax
    mov eax, dword [0x2c2a54]
    shr eax, 7
    mov dword [0xe75ca], ebp
    and eax, 1
    mov ebp, edi
    shl eax, 5
    or ebp, eax
    mov eax, dword [0x2c2a54]
    shr eax, 0xd
    mov dword [0xe75ca], edx
    and eax, 1
    mov edx, ebp
    shl eax, 6
    mov dword [0xe75ca], ebx
    or edx, eax
    mov eax, dword [0x2c2a54]
    mov dword [0xe75ca], edi
    shr eax, 0xe
    xor edi, edi
    and eax, 1
    mov ebx, edx
    shl eax, 7
    mov dword [0xe75ca], ebp
    or ebx, eax
    mov eax, dword [0x2c2a54]
    mov dword [0xe75ca], edx
    shr eax, 0x13
    mov dword [0xe75ca], ebx
    test al, 1
    je short loc_0f39
    cmp dword [0x21f38], 0
    je short loc_0f27
    cmp dword [ecx + 0x290], 0
    je short loc_0f27
    movsx edx, si
    xor ebx, ebx
    xor eax, eax
    call loc_0b60
    jmp short loc_0f39
loc_0f27:
    cmp dword [0x21f38], 0
    jne short loc_0f39
    mov word [ecx + 0x312], 1
loc_0f39:
    mov eax, dword [0x2c2a54]
    shr eax, 0x14
    test al, 1
    je short loc_0f7a
    cmp dword [0x21f38], 0
    je short loc_0f68
    cmp dword [ecx + 0x290], 1
    je short loc_0f68
    mov eax, 1
    movsx edx, si
    xor ebx, ebx
    call loc_0b60
    jmp short loc_0f7a
loc_0f68:
    cmp dword [0x21f38], 0
    jne short loc_0f7a
    mov word [ecx + 0x312], 2
loc_0f7a:
    mov eax, dword [0x2c2a54]
    shr eax, 0x15
    test al, 1
    je short loc_0fbb
    cmp dword [0x21f38], 0
    je short loc_0fa9
    cmp dword [ecx + 0x290], 2
    je short loc_0fa9
    mov eax, 2
    movsx edx, si
    xor ebx, ebx
    call loc_0b60
    jmp short loc_0fbb
loc_0fa9:
    cmp dword [0x21f38], 0
    jne short loc_0fbb
    mov word [ecx + 0x312], 3
loc_0fbb:
    mov eax, dword [0x2c2a54]
    shr eax, 0x16
    test al, 1
    je short loc_0ffc
    cmp dword [0x21f38], 0
    je short loc_0fea
    cmp dword [ecx + 0x290], 3
    je short loc_0fea
    mov eax, 3
    movsx edx, si
    xor ebx, ebx
    call loc_0b60
    jmp short loc_0ffc
loc_0fea:
    cmp dword [0x21f38], 0
    jne short loc_0ffc
    mov word [ecx + 0x312], 4
loc_0ffc:
    mov eax, dword [0x2c2a54]
    shr eax, 0x17
    test al, 1
    je short loc_103d
    cmp dword [0x21f38], 0
    je short loc_102b
    cmp dword [ecx + 0x290], 4
    je short loc_102b
    mov eax, 4
    movsx edx, si
    xor ebx, ebx
    call loc_0b60
    jmp short loc_103d
loc_102b:
    cmp dword [0x21f38], 0
    jne short loc_103d
    mov word [ecx + 0x312], 5
loc_103d:
    mov eax, dword [0x2c2a54]
    shr eax, 0x18
    test al, 1
    je short loc_106a
    cmp dword [0x21f38], 0
    je short loc_106a
    cmp dword [ecx + 0x290], 5
    je short loc_106a
    mov eax, 5
    movsx edx, si
    xor ebx, ebx
    call loc_0b60
loc_106a:
    mov eax, dword [0x2c2a54]
    shr eax, 0x19
    test al, 1
    je short loc_1097
    cmp dword [0x21f38], 0
    je short loc_1097
    cmp dword [ecx + 0x290], 6
    je short loc_1097
    mov eax, 6
    movsx edx, si
    xor ebx, ebx
    call loc_0b60
loc_1097:
    mov eax, dword [0x2c2a54]
    shr eax, 0x1a
    test al, 1
    je short loc_10c4
    cmp dword [0x21f38], 0
    je short loc_10c4
    cmp dword [ecx + 0x290], 7
    je short loc_10c4
    mov eax, 7
    movsx edx, si
    xor ebx, ebx
    call loc_0b60
loc_10c4:
    movsx eax, di
    mov edx, dword [0xe75ca]
    shl eax, 8
    or edx, eax
    mov eax, dword [0x2c2a58]
    shr eax, 0x10
    and eax, 1
    mov ebx, edx
    shl eax, 0xc
    or ebx, eax
    mov eax, dword [0x2c2a54]
    shr eax, 0xb
    and eax, 1
    mov esi, ebx
    shl eax, 0xd
    or esi, eax
    mov eax, dword [0x2c2a54]
    shr eax, 0xc
    and eax, 1
    mov edi, esi
    shl eax, 0xe
    or edi, eax
    mov eax, dword [0x2c2a58]
    shr eax, 2
    and eax, 1
    mov ebp, edi
    shl eax, 0xf
    or ebp, eax
    mov eax, dword [0x2c2a58]
    shr eax, 3
    mov dword [0xe75ca], edx
    and eax, 1
    mov edx, ebp
    shl eax, 0x10
    or edx, eax
    mov eax, dword [0x2c2a58]
    shr eax, 9
    mov dword [0xe75ca], ebx
    and eax, 1
    mov ebx, edx
    shl eax, 0x12
    or ebx, eax
    mov eax, dword [0x2c2a58]
    mov dword [0xe75ca], esi
    shr eax, 0xa
    mov dword [0xe75ca], edi
    and eax, 1
    mov esi, ebx
    shl eax, 0x13
    mov dword [0xe75ca], ebp
    or esi, eax
    mov eax, dword [0x2c2a54]
    mov dword [0xe75ca], edx
    shr eax, 0x1e
    mov dword [0xe75ca], ebx
    and eax, 1
    mov edi, esi
    shl eax, 0x14
    mov dword [0xe75ca], esi
    or edi, eax
    mov dword [0xe75ca], edi
    cmp byte [0x2c23d9], 0
    setne al
    and eax, 0xff
    mov ebp, edi
    shl eax, 0x15
    or ebp, eax
    mov eax, dword [0x2c2a58]
    shr eax, 0x11
    and eax, 1
    mov edx, ebp
    shl eax, 0x16
    or edx, eax
    mov eax, dword [0x9268]
    mov ebx, edx
    shl eax, 0x17
    or ebx, eax
    mov eax, dword [0x2c2a58]
    and eax, 1
    mov esi, ebx
    shl eax, 0x18
    or esi, eax
    mov eax, dword [0x2c2a58]
    shr eax, 1
    and eax, 1
    mov edi, esi
    shl eax, 0x19
    or edi, eax
    xor eax, eax
    mov dword [0xe75ca], ebp
    mov al, byte [0x8d63]
    mov ebp, edi
    shl eax, 0x1a
    or ebp, eax
    mov eax, dword [0x2c2a54]
    shr eax, 0x1f
    mov dword [0xe75ca], edx
    and eax, 1
    mov edx, ebp
    shl eax, 0x1b
    or edx, eax
    mov eax, dword [0x2c2a58]
    shr eax, 4
    mov dword [0xe75ca], ebx
    and eax, 1
    mov ebx, edx
    shl eax, 0x1c
    or ebx, eax
    mov eax, dword [0x2c2a54]
    mov dword [0xe75ca], esi
    shr eax, 6
    mov dword [0xe75ca], edi
    and eax, 1
    mov esi, ebx
    shl eax, 0x1d
    mov dword [0xe75ca], ebp
    or esi, eax
    mov eax, dword [0x2c2a54]
    mov dword [0xe75ca], edx
    shr eax, 0x1d
    mov dword [0xe75ca], ebx
    and eax, 1
    mov edi, esi
    shl eax, 0x1e
    mov dword [0xe75ca], esi
    or edi, eax
    mov dword [0xe75ca], edi
    cmp byte [0x2c2381], 0
    setne al
    and eax, 0xff
    shl eax, 0x1f
    mov ebp, edi
    xor edx, edx
    mov edi, dword [0x2c2a54]
    mov dword [0xe4460], edx
    mov dword [0xe4b6c], edx
    mov dword [0xe445c], edx
    or ebp, eax
    shr edi, 7
    mov eax, dword [0xe9337]
    and edi, 1
    mov dword [0xe4458], edx
    or edi, eax
    mov eax, dword [0x13fd4]
    mov dword [0xe75ca], ebp
    test eax, eax
    je short loc_12de
    test edi, edi
    je short loc_12de
    mov edx, dword [esp + 8]
    add edx, edx
    mov dword [esp + 8], edx
loc_12de:
    mov eax, dword [0x2c2a54]
    shr eax, 4
    test al, 1
    je short loc_1304
    mov edx, dword [esp + 0xc]
    neg edx
    mov eax, edx
    sar edx, 0x1f
    shl edx, 3
    db 0x1b, 0xc2    ; sbb eax, edx
    sar eax, 3
    mov dword [0xe4458], eax
    jmp short loc_131a
loc_1304:
    mov eax, dword [esp + 0xc]
    mov edx, eax
    sar edx, 0x1f
    shl edx, 6
    db 0x1b, 0xc2    ; sbb eax, edx
    sar eax, 6
    mov dword [0xe4b6c], eax
loc_131a:
    cmp dword [0x9268], 0
    je short loc_1350
    mov eax, dword [esp + 8]
    mov edx, eax
    mov ebx, 0xba
    sar edx, 0x1f
    idiv ebx
    cmp dword [0xe97f7], 0
    je short loc_1344
    sub dword [0xe4460], eax
    jmp short loc_134a
loc_1344:
    add dword [0xe4460], eax
loc_134a:
    xor ebx, ebx
    mov dword [esp + 8], ebx
loc_1350:
    mov eax, dword [esp]
    mov esi, dword [0xe4458]
    sub esi, eax
    mov eax, dword [esp + 8]
    neg eax
    sar eax, 6
    mov dword [0xe4458], esi
    mov dword [0xe445c], eax
    test edi, edi
    je short loc_1387
    mov ebx, dword [0x9274]
    mov esi, 0x14
    lea ebx, [ebx*4]
    jmp short loc_13e1
loc_1387:
    mov ebp, 0x1e
    mov eax, dword [0x9260]
    xor edx, edx
    div ebp
    mov ebx, dword [0x9274]
    mov esi, 0xa
    add ebx, ebx
    test edx, edx
    jne short loc_13e1
    mov ebp, dword [ecx + 0x288]
    cmp ebp, 0x64
    jge short loc_13e1
    lea eax, [ebp + 1]
    mov dword [ecx + 0x288], eax
    mov edx, dword [0x9274]
    cmp edx, 0x28
    jge short loc_13ce
    lea ebp, [edx + 2]
    mov dword [0x9274], ebp
loc_13ce:
    mov eax, dword [0x925c]
    cmp eax, 0x28
    jge short loc_13e1
    lea edx, [eax + 2]
    mov dword [0x925c], edx
loc_13e1:
    mov eax, dword [0x2c2a54]
    mov edx, dword [0x2c2a54]
    shr eax, 4
    shr edx, 2
    test al, 1
    je short loc_1419
    test dl, 1
    je short loc_1401
    add dword [0xe4458], ebx
loc_1401:
    mov eax, dword [0x2c2a54]
    shr eax, 3
    test al, 1
    je near loc_1474
    sub dword [0xe4458], ebx
    jmp short loc_1474
loc_1419:
    mov ebp, dword [esp + 0x18]
    mov eax, dword [0xfcc78]
    add eax, ebp
    test dl, 1
    je short loc_1444
    mov dword [0xfcc78], eax
    cmp eax, 0xf
    jl short loc_143b
    sub dword [0xe4b6c], esi
    jmp short loc_1474
loc_143b:
    sub dword [0xe4b6c], 5
    jmp short loc_1474
loc_1444:
    mov edx, dword [0x2c2a54]
    shr edx, 3
    test dl, 1
    je short loc_146d
    mov dword [0xfcc78], eax
    cmp eax, 0xf
    jl short loc_1464
    add dword [0xe4b6c], esi
    jmp short loc_1474
loc_1464:
    add dword [0xe4b6c], 5
    jmp short loc_1474
loc_146d:
    xor eax, eax
    mov dword [0xfcc78], eax
loc_1474:
    mov eax, dword [0x2c2a54]
    shr eax, 0xf
    test al, 1
    je short loc_1486
    add dword [0xe4458], ebx
loc_1486:
    mov eax, dword [0x2c2a54]
    shr eax, 0x10
    test al, 1
    je short loc_1498
    sub dword [0xe4458], ebx
loc_1498:
    test byte [0x2c2a54], 1
    je short loc_14a7
    add dword [0xe445c], ebx
loc_14a7:
    mov eax, dword [0x2c2a54]
    shr eax, 1
    test al, 1
    je near 0x4ac44
    sub dword [0xe445c], ebx
    test edi, edi
    je short 0x4ac44
    mov ebx, 0x64
    mov eax, dword [0x9260]
    xor edx, edx
    div ebx
    test edx, edx
    jne short 0x4ac44
    mov eax, dword [ecx + 0x288]
    test eax, eax
    jl short 0x4ac44
    lea edx, [eax - 1]
    mov dword [ecx + 0x288], edx
    cmp dword [0x925c], 4
    jle short 0x4ac16
%endif
