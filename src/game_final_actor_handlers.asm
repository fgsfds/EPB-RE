; Actor behavior and game-state handlers.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
loc_0004:
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x54
    mov dword [esp + 0x50], eax
    mov dword [esp + 0x4c], edx
    movsx ebp, ax
    lea eax, [ebp*4]
    add eax, ebp
    mov edi, 0x2c9cb4
    lea eax, [eax*8]
    add edi, eax
    mov dx, word [edi + 0x22]
    and dh, 0x3f
    sub edx, 9
    cmp dx, 0x16
    ja near loc_0ece
    and edx, 0xffff
    jmp dword cs:[edx*4 + 0x41420]
    movsx esi, word [eax + 0x2c9cd8]
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov dx, word [eax + 0x8b0c3]
    test dx, dx
    je short loc_007c
    cmp dx, 0x100
    jne short loc_008b
loc_007c:
    movsx edx, word [esp + 0x4c]
    movsx eax, word [esp + 0x50]
    call 0x505d0
loc_008b:
    imul esi, esi, 0x2c
    cmp word [esi + 0x2522de], 1
    jne short loc_00a6
    mov word [esi + 0x2522de], 3
    jmp near loc_0ece
loc_00a6:
    mov word [esi + 0x2522de], 1
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    movsx esi, word [eax + 0x2c9cd8]
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    cmp dword [eax + 0x8b0f7], 0
    jne short loc_00e4
    mov dword [eax + 0x8b0f7], 1
loc_00e4:
    movsx edx, word [esp + 0x4c]
    movsx eax, word [esp + 0x50]
    call 0x505d0
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    lea eax, [edi + 4]
    call 0x50fd0
    cwde
    cmp eax, -1
    jne near loc_0ece
    mov byte [0x17af68], 1
    mov byte [edi + 0x22], 0
    mov dl, byte [edi + 0x22]
    movsx ebx, word [esp + 0x4c]
    or dl, 0x16
    mov eax, ebp
    mov byte [edi + 0x22], dl
    mov edx, ebx
    call loc_0004
    mov byte [edi + 0x22], 0
    mov dh, byte [edi + 0x22]
    or dh, 9
    mov eax, ebp
    mov byte [edi + 0x22], dh
    mov edx, ebx
    call loc_0004
    mov byte [edi + 0x22], 0
    or byte [edi + 0x22], 0x1a
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    movsx eax, word [edi]
    xor ebx, ebx
    mov dword [esp + 0x24], eax
    mov dword [esp + 0x48], ebx
    mov dword [esp + 0x1c], ebx
    mov edx, dword [esp + 0x24]
    movsx eax, word [edi + 2]
    mov ebx, dword [esp + 0x24]
    add eax, edx
    movsx edi, word [edi + 0x26]
    dec eax
    sar edi, 4
    mov dword [esp + 0x10], eax
    jmp short loc_01a8
loc_0184:
    mov ecx, dword [esp + 0x48]
    mov esi, dword [esp + 0x1c]
    shl eax, 5
    inc ebx
    mov edx, dword [eax + 0x27e4b4]
    mov eax, dword [eax + 0x27e4b8]
    add ecx, edx
    add esi, eax
    mov dword [esp + 0x48], ecx
    mov dword [esp + 0x1c], esi
loc_01a8:
    mov esi, dword [esp + 0x10]
    movsx eax, bx
    cmp eax, esi
    jle short loc_0184
    mov ebp, dword [esp + 0x24]
    mov ebx, esi
    mov eax, dword [esp + 0x48]
    sub ebx, ebp
    mov edx, eax
    inc ebx
    sar edx, 0x1f
    idiv ebx
    mov dword [esp + 0x48], eax
    mov eax, dword [esp + 0x1c]
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov ecx, dword [esp + 0x48]
    mov ebx, dword [esp + 0x24]
    mov dword [esp + 0x1c], eax
    mov eax, 0xffffffff
    mov esi, dword [esp + 0x1c]
    mov dword [esp], eax
    mov dword [esp + 4], eax
    jmp short loc_021d
loc_01f4:
    shl eax, 5
    cmp ecx, dword [eax + 0x27e4b4]
    je short loc_0207
    cmp esi, dword [eax + 0x27e4b8]
    jne short loc_021c
loc_0207:
    cmp dword [esp], -1
    jne short loc_0215
    movsx eax, bx
    mov dword [esp], eax
    jmp short loc_021c
loc_0215:
    movsx eax, bx
    mov dword [esp + 4], eax
loc_021c:
    inc ebx
loc_021d:
    mov ebp, dword [esp + 0x10]
    movsx eax, bx
    cmp eax, ebp
    jle short loc_01f4
    xor esi, esi
    cmp esi, 2
    jl short loc_0238
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_0238:
    lea edx, [esi*4]
    mov eax, dword [esp + edx]
    shl eax, 5
    mov ecx, dword [esp + 0x48]
    cmp ecx, dword [eax + 0x27e4b4]
    jne near loc_0419
    mov ebp, dword [esp + 0x1c]
    cmp ebp, dword [eax + 0x27e4b8]
    jne near loc_0419
    mov bx, word [esp + edx]
    dec ebx
    mov ebp, dword [esp + 0x24]
    movsx eax, bx
    cmp eax, ebp
    jge short loc_0279
    mov ebx, dword [esp + 0x10]
loc_0279:
    lea eax, [esi*4]
    mov dword [esp + 0x44], eax
    mov eax, dword [esp + eax]
    movsx ebx, bx
    shl eax, 5
    shl ebx, 5
    movsx edx, word [eax + 0x27e4bc]
    mov dword [esp + 0x14], ebx
    shl edx, 5
    mov ebp, dword [ebx + 0x27e4b4]
    add ebp, dword [edx + 0x27e4b4]
    mov ecx, dword [eax + 0x27e4b4]
    sar ebp, 1
    sub ebp, ecx
    mov dword [esp + 0xc], ebp
    mov ebp, dword [esp + 0x14]
    mov ebx, dword [edx + 0x27e4b8]
    mov ebp, dword [ebp + 0x27e4b8]
    add ebp, ebx
    mov ecx, dword [eax + 0x27e4b8]
    sar ebp, 1
    mov ebx, 0x27e4b4
    sub ebp, ecx
    mov ecx, dword [esp + 0x14]
    add ebx, ecx
    mov dword [esp + 0x3c], ebx
    mov ebx, 0x27e4b4
    add ebx, eax
    mov dword [esp + 0x2c], ebx
    cmp dword [esp + 0xc], 0
    je near loc_038d
    movsx ebx, word [edx + 0x27e4bc]
    shl ebx, 5
    mov ecx, edi
    mov ebx, dword [ebx + 0x27e4b4]
    mov edx, dword [edx + 0x27e4b4]
    mov ebp, ebx
    mov dword [esp + 0xc], ebx
    sub ebp, edx
    mov ebx, dword [eax + 0x27e4b4]
    mov dword [esp + 0xc], ebp
    add ebx, ebp
    movsx ebp, word [esp + 0x50]
    mov edx, dword [esp + 0x2c]
    mov eax, ebp
    call 0x51000
    mov ebx, dword [esp + 0x14]
    mov edx, dword [esp + 0xc]
    mov ecx, edi
    mov ebx, dword [ebx + 0x27e4b4]
    mov eax, ebp
    add ebx, edx
    mov edx, dword [esp + 0x3c]
    call 0x51000
    mov edx, dword [esp + 0x44]
    mov edx, dword [esp + edx]
    shl edx, 5
    movsx edx, word [edx + 0x27e4bc]
    mov ecx, dword [esp + 0xc]
    shl edx, 5
    mov eax, ebp
    mov ebx, dword [edx + 0x27e4b4]
    add edx, 0x27e4b4
    add ebx, ecx
    mov ecx, edi
    call 0x51000
    movsx edx, word [esp + 0x4c]
    mov eax, ebp
    jmp near loc_0563
loc_038d:
    test ebp, ebp
    je near loc_0568
    movsx ebx, word [edx + 0x27e4bc]
    mov ecx, dword [edx + 0x27e4b8]
    mov edx, dword [esp + 0x2c]
    shl ebx, 5
    add edx, 4
    mov ebp, dword [ebx + 0x27e4b8]
    mov ebx, dword [eax + 0x27e4b8]
    sub ebp, ecx
    movsx eax, word [esp + 0x50]
    mov ecx, edi
    add ebx, ebp
    mov dword [esp + 8], eax
    call 0x51000
    mov ebx, dword [esp + 0x14]
    mov edx, dword [esp + 0x3c]
    mov eax, dword [esp + 8]
    mov ecx, edi
    mov ebx, dword [ebx + 0x27e4b8]
    add edx, 4
    add ebx, ebp
    call 0x51000
    mov eax, dword [esp + 0x44]
    mov eax, dword [esp + eax]
    shl eax, 5
    movsx eax, word [eax + 0x27e4bc]
    shl eax, 5
    mov ebx, dword [eax + 0x27e4b8]
    add eax, 0x27e4b4
    mov ecx, edi
    lea edx, [eax + 4]
    add ebx, ebp
    mov eax, dword [esp + 8]
    jmp near loc_0555
loc_0419:
    mov bx, word [esp + esi*4]
    dec ebx
    mov edx, dword [esp + 0x24]
    movsx eax, bx
    cmp eax, edx
    jge short loc_042d
    mov ebx, dword [esp + 0x10]
loc_042d:
    lea eax, [esi*4]
    mov dword [esp + 0x40], eax
    mov eax, dword [esp + eax]
    shl eax, 5
    movsx ebx, bx
    movsx ebp, word [eax + 0x27e4bc]
    shl ebx, 5
    shl ebp, 5
    mov edx, dword [ebx + 0x27e4b4]
    add edx, dword [ebp + 0x27e4b4]
    sar edx, 1
    mov ecx, dword [eax + 0x27e4b4]
    sub edx, ecx
    mov dword [esp + 0xc], edx
    mov ecx, dword [ebp + 0x27e4b8]
    mov edx, dword [ebx + 0x27e4b8]
    add edx, ecx
    mov ebp, dword [eax + 0x27e4b8]
    sar edx, 1
    sub edx, ebp
    mov ebp, edx
    mov edx, 0x27e4b4
    add edx, ebx
    mov dword [esp + 0x30], edx
    mov edx, dword [esp + 0xc]
    add eax, 0x27e4b4
    test edx, edx
    je short loc_04fa
    movsx ebp, word [esp + 0x50]
    mov ebx, dword [esp + 0x48]
    mov ecx, edi
    mov edx, eax
    mov eax, ebp
    call 0x51000
    mov eax, dword [esp + 0x48]
    add eax, dword [esp + 0xc]
    mov edx, dword [esp + 0x30]
    mov dword [esp + 8], eax
    mov ecx, edi
    mov ebx, eax
    mov eax, ebp
    call 0x51000
    mov eax, dword [esp + 0x40]
    mov eax, dword [esp + eax]
    shl eax, 5
    mov edx, 0x27e4b4
    movsx eax, word [eax + 0x27e4bc]
    mov ebx, dword [esp + 8]
    shl eax, 5
    mov ecx, edi
    add edx, eax
    mov eax, ebp
    call 0x51000
    movsx edx, word [esp + 0x4c]
    mov eax, ebp
    jmp short loc_0563
loc_04fa:
    test ebp, ebp
    je short loc_0568
    lea edx, [eax + 4]
    mov ebx, dword [esp + 0x1c]
    movsx eax, word [esp + 0x50]
    mov ecx, edi
    mov dword [esp + 8], eax
    call 0x51000
    mov ebx, dword [esp + 0x1c]
    mov edx, dword [esp + 0x30]
    mov eax, dword [esp + 8]
    mov ecx, edi
    add ebp, ebx
    add edx, 4
    mov ebx, ebp
    call 0x51000
    mov eax, dword [esp + 0x40]
    mov eax, dword [esp + eax]
    shl eax, 5
    mov edx, 0x27e4b4
    movsx eax, word [eax + 0x27e4bc]
    mov ecx, edi
    shl eax, 5
    mov ebx, ebp
    add edx, eax
    mov eax, dword [esp + 8]
    add edx, 4
loc_0555:
    call 0x51000
    movsx edx, word [esp + 0x4c]
    mov eax, dword [esp + 8]
loc_0563:
    call 0x505d0
loc_0568:
    inc esi
    cmp esi, 2
    jl near loc_0238
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    movsx eax, word [esp + 0x4c]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 0x214
    jne near loc_0ece
    db 0x66, 0x8b, 0x1c, 0x6d, 0xd4, 0x73, 0x2d, 0x00    ; mov bx, word [ebp*2 + 0x2d73d4]
loc_059a:
    test bx, bx
    jl short loc_05c6
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 1
    jne short loc_05b9
    cmp word [eax + 0x2522da], 0x11
    je short loc_05c6
loc_05b9:
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xb4, 0xdf, 0x24, 0x00    ; mov bx, word [eax*2 + 0x24dfb4]
    jmp short loc_059a
loc_05c6:
    movsx eax, word [esp + 0x4c]
    imul eax, eax, 0x2c
    mov ecx, dword [esp + 0x50]
    cmp cx, word [eax + 0x2522cc]
    jne short loc_062c
    movsx ebx, bx
    mov edx, 0xffffffff
    mov eax, ebx
    call 0x512b0
    test al, al
    je short loc_0603
    mov edx, 1
    mov eax, ebx
    call 0x512b0
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_0603:
    mov edx, 1
    mov eax, ebx
    call 0x512b0
    test al, al
    je near loc_0ece
    mov edx, 0xffffffff
    mov eax, ebx
    call 0x512b0
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_062c:
    movsx eax, bx
    imul ebx, eax, 0x2c
    mov edx, dword [edi + 8]
    cmp edx, dword [ebx + 0x2522bc]
    jle short loc_0650
    mov edx, 0xffffffff
    call 0x512b0
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_0650:
    mov edx, 1
    call 0x512b0
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    lea eax, [edi + 8]
    mov dword [esp + 0x20], eax
    call 0x50fd0
    cwde
    cmp eax, -1
    jne near loc_0ece
    movsx ebp, word [esp + 0x50]
    mov ecx, 1
    mov edx, dword [edi + 8]
    mov ebx, ecx
    mov eax, ebp
    call 0x68245
    cwde
    cmp eax, -1
    jne short loc_06bb
    mov ebx, 1
    mov ecx, eax
    mov edx, dword [edi + 8]
    mov eax, ebp
    call 0x68245
    movsx edx, ax
    cmp edx, -1
    je near loc_0ece
    lea eax, [edx*4]
    jmp short loc_06c4
loc_06bb:
    mov edx, eax
    lea eax, [eax*4]
loc_06c4:
    add eax, edx
    movsx ecx, word [edi + 0x26]
    mov edx, dword [esp + 0x20]
    mov ebx, dword [eax*8 + 0x2c9cbc]
    mov eax, ebp
    call 0x51000
    movsx edx, word [esp + 0x4c]
    movsx eax, word [esp + 0x50]
    call 0x505d0
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    lea eax, [edi + 8]
    call 0x50fd0
    cwde
    cmp eax, -1
    jne near loc_0ece
    movsx esi, word [esp + 0x50]
    mov ebx, 1
    mov ecx, eax
    mov edx, dword [edi + 8]
    mov eax, esi
    call 0x68245
    mov ebx, eax
    cwde
    cmp eax, -1
    jne short loc_0737
    mov ecx, 1
    mov eax, esi
    mov edx, dword [edi + 8]
    mov ebx, ecx
    call 0x68245
    mov ebx, eax
loc_0737:
    movsx eax, bx
    cmp eax, -1
    je near loc_0ece
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    mov ebp, dword [edi + 4]
    mov esi, dword [eax*8 + 0x2c9cbc]
    movsx eax, word [edi + 0x26]
    lea edx, [edi + 8]
    mov dword [esp + 0x28], eax
    mov eax, dword [edi + 8]
    mov ebx, esi
    sub ebp, eax
    movsx eax, word [esp + 0x50]
    mov ecx, dword [esp + 0x28]
    mov dword [esp + 8], eax
    call 0x51000
    mov ecx, dword [esp + 0x28]
    mov eax, dword [esp + 8]
    lea edx, [edi + 4]
    lea ebx, [esi + ebp]
    call 0x51000
    movsx edx, word [esp + 0x4c]
    mov eax, dword [esp + 8]
    call 0x505d0
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    movsx eax, word [edi + 0x22]
    test ah, 0x80
    je short loc_07d4
    mov ecx, 1
    mov eax, ebp
    mov edx, dword [edi + 4]
    mov ebx, ecx
    call 0x68245
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    mov esi, dword [eax*8 + 0x2c9cbc]
    jmp short loc_07f7
loc_07d4:
    mov ecx, 0xffffffff
    mov eax, ebp
    mov edx, dword [edi + 4]
    mov ebx, ecx
    call 0x68245
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    mov esi, dword [eax*8 + 0x2c9cb8]
loc_07f7:
    mov bx, word [0x2d6bd8]
loc_07fe:
    test bx, bx
    jl near loc_087a
    movsx edx, bx
    imul eax, edx, 0x2c
    cmp word [eax + 0x2522da], 0x16
    jne short loc_086d
    mov cx, word [eax + 0x2522dc]
    cmp cx, word [edi + 0x24]
    jne short loc_086d
    movsx ebp, word [eax + 0x2522cc]
    lea eax, [ebp*4]
    add eax, ebp
    mov cx, word [eax*8 + 0x2c9cda]
    neg ecx
    mov word [eax*8 + 0x2c9cda], cx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx ebp, word [esp + 0x50]
    mov dword [eax + 0x8b0e7], ebp
    mov dword [eax + 0x8b0eb], 1
loc_086d:
    movsx ebx, bx
    db 0x66, 0x8b, 0x1c, 0x5d, 0xb4, 0x0e, 0x24, 0x00    ; mov bx, word [ebx*2 + 0x240eb4]
    jmp short loc_07fe
loc_087a:
    xor byte [edi + 0x23], 0x80
    lea edx, [edi + 4]
    movsx ecx, word [edi + 0x26]
    movsx edi, word [esp + 0x50]
    mov ebx, esi
    mov eax, edi
    call 0x51000
    movsx edx, word [esp + 0x4c]
    mov eax, edi
    call 0x505d0
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_08a8:
    movsx ebx, bx
    db 0x66, 0x8b, 0x1c, 0x5d, 0xb4, 0xdf, 0x24, 0x00    ; mov bx, word [ebx*2 + 0x24dfb4]
    jmp short loc_08e9
loc_08b5:
    movsx eax, word [esp + 0x50]
    mov ecx, 0xffffffff
    mov edx, dword [edi + 4]
    mov ebx, ecx
    call 0x68245
    mov esi, eax
    test eax, eax
    jge short loc_091b
    or byte [edi + 0x23], 0x80
    movsx eax, word [edi + 0x22]
    test ah, 0x80
    je short loc_08b5
    movsx eax, word [esp + 0x50]
    db 0x66, 0x8b, 0x1c, 0x45, 0xd4, 0x73, 0x2d, 0x00    ; mov bx, word [eax*2 + 0x2d73d4]
loc_08e9:
    test bx, bx
    jl short loc_090e
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522ce], 3
    jne short loc_08a8
    cmp word [eax + 0x2522da], 9
    jne short loc_08a8
    mov esi, dword [eax + 0x2522bc]
loc_090e:
    movsx eax, bx
    cmp eax, -1
    jne short loc_092b
    mov esi, dword [edi + 8]
    jmp short loc_092b
loc_091b:
    lea eax, [eax*4]
    add eax, esi
    mov esi, dword [eax*8 + 0x2c9cb8]
loc_092b:
    mov al, byte [edi + 0x23]
    lea edx, [edi + 4]
    xor al, 0x80
    movsx ecx, word [edi + 0x26]
    mov byte [edi + 0x23], al
    movsx edi, word [esp + 0x50]
    mov ebx, esi
    mov eax, edi
    call 0x51000
    movsx edx, word [esp + 0x4c]
    mov eax, edi
    call 0x505d0
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    lea eax, [edi + 8]
    call 0x50fd0
    mov esi, eax
    test ax, ax
    jl short loc_09c8
    mov eax, dword [ebp*4 + 0x8a830]
    mov ecx, dword [edi + 4]
    cmp eax, ecx
    jne short loc_09b5
    mov edx, ecx
    mov ecx, 1
    mov eax, ebp
    mov ebx, ecx
    call 0x68245
    mov edx, eax
    lea eax, [eax*4]
    add edx, eax
    lea edx, [edx*8]
    movsx eax, si
    mov edx, dword [edx + 0x2c9cbc]
    mov dword [eax*4 + 0x8a830], edx
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_09b5:
    movsx edx, si
    mov dword [edx*4 + 0x8a830], ecx
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_09c8:
    mov eax, dword [edi + 4]
    cmp eax, dword [edi + 8]
    jne short loc_09f5
    mov ecx, 1
    mov eax, ebp
    mov edx, dword [edi + 4]
    mov ebx, ecx
    call 0x68245
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    mov esi, dword [eax*8 + 0x2c9cbc]
    jmp short loc_09f7
loc_09f5:
    mov esi, eax
loc_09f7:
    xor byte [edi + 0x23], 0x80
    lea edx, [edi + 8]
    movsx ecx, word [edi + 0x26]
    movsx edi, word [esp + 0x50]
    mov ebx, esi
    mov eax, edi
    call 0x51000
    test eax, eax
    jl near loc_0ece
    movsx edx, word [esp + 0x4c]
    mov eax, edi
    call 0x505d0
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    lea esi, [edi + 4]
    lea edx, [edi + 8]
    movsx eax, word [edi + 0x22]
    mov dword [esp + 0x18], edx
    test ah, 0x80
    je short loc_0a6b
    mov eax, dword [edi + 4]
    add eax, dword [edi + 8]
    movsx ecx, word [edi + 0x26]
    sar eax, 1
    mov edx, dword [esp + 0x18]
    mov dword [esp + 0x28], eax
    mov ebx, eax
    mov eax, ebp
    call 0x51000
    mov ebx, dword [esp + 0x28]
    mov edx, esi
    mov eax, ebp
    movsx ecx, word [edi + 0x26]
    jmp short loc_0ad4
loc_0a6b:
    mov ecx, 1
    mov eax, ebp
    mov edx, dword [edi + 8]
    mov ebx, ecx
    call 0x68245
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    movsx ecx, word [edi + 0x26]
    mov eax, dword [eax*8 + 0x2c9cbc]
    mov edx, dword [esp + 0x18]
    mov dword [esp + 0x28], eax
    mov ebx, eax
    mov eax, ebp
    call 0x51000
    mov ecx, 0xffffffff
    mov eax, ebp
    mov edx, dword [edi + 4]
    mov ebx, ecx
    call 0x68245
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    movsx ecx, word [edi + 0x26]
    mov eax, dword [eax*8 + 0x2c9cb8]
    mov edx, esi
    mov dword [esp + 0x28], eax
    mov ebx, eax
    mov eax, ebp
loc_0ad4:
    call 0x51000
    mov bh, byte [edi + 0x23]
    movsx edx, word [esp + 0x4c]
    xor bh, 0x80
    movsx eax, word [esp + 0x50]
    mov byte [edi + 0x23], bh
    call 0x505d0
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    mov esi, 0xffffffff
    xor ecx, ecx
    mov bx, word [0x2d6bd8]
    mov dword [esp + 0x28], ecx
    mov ecx, dword [esp + 0x50]
loc_0b10:
    test bx, bx
    jl short loc_0b5a
    movsx edi, bx
    imul eax, edi, 0x2c
    cmp word [eax + 0x2522da], 0xb
    jne short loc_0b4d
    cmp cx, word [eax + 0x2522cc]
    jne short loc_0b4d
    lea eax, [edi*8]
    add eax, edi
    lea eax, [eax*8]
    sub eax, edi
    cmp dword [eax + 0x8b0f7], 0
    jne short loc_0b4d
    mov esi, edi
    jmp short loc_0b5a
loc_0b4d:
    movsx ebx, bx
    db 0x66, 0x8b, 0x1c, 0x5d, 0xb4, 0x0e, 0x24, 0x00    ; mov bx, word [ebx*2 + 0x240eb4]
    jmp short loc_0b10
loc_0b5a:
    movsx eax, bx
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x2522cc]
    lea eax, [edx*4]
    add eax, edx
    movsx ebp, word [eax*8 + 0x2c9cd6]
    and ebp, 0x8000
    test esi, esi
    jl near loc_0ece
    mov bx, word [0x2d6bd8]
loc_0b8d:
    test bx, bx
    jl near loc_0ece
    movsx eax, bx
    mov dword [esp + 0x38], eax
    imul edi, eax, 0x2c
    movsx edx, word [edi + 0x2522cc]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    movsx eax, word [edx + 0x2c9cd6]
    mov dword [esp + 0x34], eax
    and eax, 0x8000
    cmp ebp, eax
    jne near loc_0c6e
    cmp word [edi + 0x2522da], 0xb
    jne near loc_0c6e
    imul eax, esi, 0x2c
    mov cx, word [edi + 0x2522dc]
    cmp cx, word [eax + 0x2522dc]
    jne near loc_0c6e
    mov edi, dword [esp + 0x38]
    lea eax, [edi*8]
    add eax, edi
    lea eax, [eax*8]
    sub eax, edi
    cmp dword [eax + 0x8b0f7], 0
    jne short loc_0c6e
    test byte [esp + 0x35], 0x80
    je short loc_0c23
    and byte [edx + 0x2c9cd7], 0x7f
    jmp short loc_0c2a
loc_0c23:
    or byte [edx + 0x2c9cd7], 0x80
loc_0c2a:
    movsx edx, bx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edi, dword [eax + 0x8b0f3]
    neg edi
    mov ecx, 1
    mov dword [eax + 0x8b0f3], edi
    mov edi, dword [esp + 0x28]
    mov dword [eax + 0x8b0f7], ecx
    test edi, edi
    jne short loc_0c6e
    movsx eax, word [esp + 0x50]
    call 0x505d0
    mov dword [esp + 0x28], ecx
loc_0c6e:
    movsx ebx, bx
    db 0x66, 0x8b, 0x1c, 0x5d, 0xb4, 0x0e, 0x24, 0x00    ; mov bx, word [ebx*2 + 0x240eb4]
    jmp near loc_0b8d
    mov ecx, dword [esp + 0x50]
    movsx esi, word [0x2d6bd8]
loc_0c89:
    test esi, esi
    jl short loc_0cad
    imul eax, esi, 0x2c
    cmp word [eax + 0x2522da], 0xf
    jne short loc_0ca3
    cmp cx, word [eax + 0x2522cc]
    je short loc_0cad
loc_0ca3:
    db 0x0f, 0xbf, 0x34, 0x75, 0xb4, 0x0e, 0x24, 0x00    ; movsx esi, word [esi*2 + 0x240eb4]
    jmp short loc_0c89
loc_0cad:
    test esi, esi
    jl near loc_0ece
    mov bx, word [0x2d6bd8]
loc_0cbc:
    test bx, bx
    jl near loc_0ece
    movsx edx, bx
    imul edi, edx, 0x2c
    imul eax, esi, 0x2c
    mov cx, word [edi + 0x2522dc]
    cmp cx, word [eax + 0x2522dc]
    jne near loc_0d97
    cmp word [edi + 0x2522da], 0xf
    jne near loc_0d97
    movsx ebp, word [edi + 0x2522cc]
    lea eax, [ebp*4]
    add eax, ebp
    xor byte [eax*8 + 0x2c9cd7], 0x80
    lea eax, [edx*8]
    add eax, edx
    mov ch, byte [edi + 0x2522d1]
    lea eax, [eax*8]
    add ch, 4
    sub eax, edx
    mov byte [edi + 0x2522d1], ch
    cmp dword [eax + 0x8b0f7], 0
    je short loc_0d3e
    movsx eax, word [edi + 0x2522cc]
    call 0x505d0
loc_0d3e:
    movsx edi, bx
    imul ebp, edi, 0x2c
    mov edx, edi
    movsx eax, word [ebp + 0x2522cc]
    call 0x505d0
    movsx edx, word [ebp + 0x2522cc]
    lea eax, [edx*4]
    add eax, edx
    movsx edx, word [eax*8 + 0x2c9cd6]
    lea eax, [edi*8]
    add eax, edi
    lea eax, [eax*8]
    sub eax, edi
    test dh, 0x80
    je short loc_0d8d
    mov dword [eax + 0x8b0f7], 1
    jmp short loc_0d97
loc_0d8d:
    mov dword [eax + 0x8b0f7], 2
loc_0d97:
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov bx, word [eax*2 + 0x240eb4]
    jmp near loc_0cbc
    movsx esi, word [0x2d6bd8]
loc_0dae:
    test esi, esi
    jl near loc_0ece
    imul eax, esi, 0x2c
    mov dx, word [eax + 0x2522da]
    xor dh, dh
    cmp dx, 0x14
    jne short loc_0e2e
    mov edx, dword [esp + 0x50]
    cmp dx, word [eax + 0x2522cc]
    jne short loc_0e2e
    movsx edx, dx
    lea eax, [edx*4]
    add eax, edx
    xor byte [eax*8 + 0x2c9cd7], 0x80
    movsx edx, word [eax*8 + 0x2c9cd6]
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    test dh, 0x80
    sete dl
    and edx, 0xff
    inc edx
    mov dword [eax + 0x8b0e7], edx
loc_0e16:
    movsx edx, word [esp + 0x4c]
    movsx eax, word [esp + 0x50]
    call 0x505d0
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_0e2e:
    db 0x0f, 0xbf, 0x34, 0x75, 0xb4, 0x0e, 0x24, 0x00    ; movsx esi, word [esi*2 + 0x240eb4]
    jmp near loc_0dae
    db 0x0f, 0xbf, 0x34, 0x6d, 0xd4, 0x73, 0x2d, 0x00    ; movsx esi, word [ebp*2 + 0x2d73d4]
loc_0e43:
    test esi, esi
    jl short loc_0e6d
    imul eax, esi, 0x2c
    cmp word [eax + 0x2522ce], 3
    jne short loc_0e63
    mov ax, word [eax + 0x2522da]
    xor ah, ah
    db 0x66, 0x3d, 0x15, 0x00    ; cmp ax, 0x15
    je short loc_0e6d
loc_0e63:
    db 0x0f, 0xbf, 0x34, 0x75, 0xb4, 0xdf, 0x24, 0x00    ; movsx esi, word [esi*2 + 0x24dfb4]
    jmp short loc_0e43
loc_0e6d:
    imul esi, esi, 0x2c
    movsx ebp, word [0x2d6bd8]
    movsx esi, word [esi + 0x2522dc]
loc_0e7e:
    test ebp, ebp
    jl short loc_0e16
    imul ebx, ebp, 0x2c
    mov ax, word [ebx + 0x2522da]
    xor ah, ah
    db 0x66, 0x3d, 0x15, 0x00    ; cmp ax, 0x15
    jne short loc_0ec4
    lea eax, [ebp*8]
    add eax, ebp
    lea eax, [eax*8]
    sub eax, ebp
    cmp dword [eax + 0x8b0e7], 0
    jne short loc_0ec4
    movsx edx, word [ebx + 0x2522dc]
    cmp edx, esi
    jne short loc_0ec4
    mov dword [eax + 0x8b0e7], 1
loc_0ec4:
    db 0x0f, 0xbf, 0x2c, 0x6d, 0xb4, 0x0e, 0x24, 0x00    ; movsx ebp, word [ebp*2 + 0x240eb4]
    jmp short loc_0e7e
loc_0ece:
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
loc_0ee4:
    push ebx
    push ecx
    push edx
    push esi
    mov esi, eax
    mov dx, word [0x2d6be8]
loc_0ef1:
    test dx, dx
    jl near 0x512a0
    movsx ebx, dx
    db 0x66, 0x8b, 0x0c, 0x5d, 0xb4, 0x0e, 0x24, 0x00    ; mov cx, word [ebx*2 + 0x240eb4]
    imul ebx, ebx, 0x2c
    cmp si, word [ebx + 0x2522da]
    jne short loc_0f61
    mov ax, word [ebx + 0x2522c2]
    db 0x66, 0x3d, 0x09, 0x00    ; cmp ax, 9
    jne short loc_0f61
    movsx eax, word [ebx + 0x2522dc]
    call 0x12d80
    test ax, ax
    je short loc_0f38
    cmp dword [0x1261ab], 0
    jne short loc_0f61
loc_0f38:
    movsx ebx, dx
    mov edx, 0x65e
    mov eax, ebx
    call 0x19680
    cwde
    imul eax, eax, 0x2c
    imul ebx, ebx, 0x2c
    sub dword [eax + 0x2522bc], 0x2000
    mov word [ebx + 0x2522de], 0x36
loc_0f61:
    mov edx, ecx
    jmp short loc_0ef1
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_0f74:
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 8
    mov edi, eax
    mov dword [esp + 4], edx
    mov cx, word [0x1256d0]
    jmp near loc_1021
loc_0f8e:
    movsx edx, cx
    lea eax, [edx*4]
    sub eax, edx
    mov esi, 0x10a700
    lea eax, [eax*4]
    add esi, eax
    cmp di, word [esi + 8]
    jne short loc_1021
    cmp word [esi + 0xa], 0
    sete al
    xor ah, ah
    movsx edx, word [esi]
    mov word [esi + 0xa], ax
    lea eax, [edx*4]
    add eax, edx
    mov dl, byte [esi + 6]
    mov byte [eax*8 + 0x2c9cc8], dl
    mov bl, dl
    movsx edx, word [esi]
    lea eax, [edx*4]
    add eax, edx
    mov byte [eax*8 + 0x2c9cd0], bl
    movsx edx, word [esi]
    lea ebx, [edx*4]
    add ebx, edx
    lea ebx, [ebx*8]
    movsx eax, word [ebx + 0x2c9cb4]
    shl eax, 5
    mov bx, word [ebx + 0x2c9cb6]
    add eax, 0x27e4b4
    jmp short loc_101c
loc_1012:
    add eax, 0x20
    mov dl, byte [esi + 6]
    dec ebx
    mov byte [eax - 0xc], dl
loc_101c:
    test bx, bx
    jg short loc_1012
loc_1021:
    dec ecx
    test cx, cx
    jge near loc_0f8e
    mov edx, 0xffffffff
    mov cx, word [0x2d6be2]
    mov dword [esp], edx
loc_103a:
    test cx, cx
    jl near loc_12ad
    movsx edx, cx
    imul eax, edx, 0x2c
    cmp di, word [eax + 0x2522da]
    jne near loc_129d
    cmp word [eax + 0x2522c2], 4
    jne near loc_112c
    movsx edx, word [eax + 0x2522cc]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov dl, byte [eax + 0x2c9cd7]
    test dl, 0x40
    je short loc_1093
    mov bl, dl
    and bl, 0xbf
    mov byte [eax + 0x2c9cd7], bl
    jmp short loc_109e
loc_1093:
    mov dh, dl
    or dh, 0x40
    mov byte [eax + 0x2c9cd7], dh
loc_109e:
    mov esi, dword [esp + 4]
    test si, si
    jl near loc_129d
    movsx eax, cx
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x2522cc]
    lea eax, [edx*4]
    add eax, edx
    test byte [eax*8 + 0x2c9cd7], 0x40
    je short loc_10f6
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    add edx, eax
    mov eax, 4
    call 0x15e50
    jmp near loc_129d
loc_10f6:
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    add edx, eax
    mov eax, 8
    call 0x15e50
    movsx ecx, cx
    db 0x66, 0x8b, 0x0c, 0x4d, 0xb4, 0x0e, 0x24, 0x00    ; mov cx, word [ecx*2 + 0x240eb4]
    jmp near loc_103a
loc_112c:
    mov bx, word [eax + 0x2522dc]
    cmp bx, 1
    jb short loc_11a1
    add edx, edx
    cmp bx, 1
    jbe short loc_1149
    cmp bx, 2
    je short loc_1175
    jmp short loc_11a1
loc_1149:
    movsx esi, word [eax + 0x2522cc]
    lea eax, [esi*4]
    add eax, esi
    mov ebx, dword [eax*8 + 0x2c9cbc]
    cmp ebx, dword [eax*8 + 0x2c9cb8]
    je short loc_11a1
    mov cx, word [edx + 0x240eb4]
    jmp near loc_103a
loc_1175:
    movsx esi, word [eax + 0x2522cc]
    lea eax, [esi*4]
    add eax, esi
    mov ebx, dword [eax*8 + 0x2c9cbc]
    cmp ebx, dword [eax*8 + 0x2c9cb8]
    jne short loc_11a1
    mov cx, word [edx + 0x240eb4]
    jmp near loc_103a
loc_11a1:
    movsx eax, cx
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x2522cc]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9cd6], 3
    jge near loc_1252
    db 0x66, 0x8b, 0x1c, 0x55, 0xd4, 0x73, 0x2d, 0x00    ; mov bx, word [edx*2 + 0x2d73d4]
loc_11ce:
    test bx, bx
    jl near loc_1252
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522ce], 3
    jne short loc_1242
    mov ax, word [eax + 0x2522da]
    db 0x66, 0x3d, 0x1f, 0x00    ; cmp ax, 0x1f
    jb short loc_1202
    db 0x66, 0x3d, 0x20, 0x00    ; cmp ax, 0x20
    jbe short loc_1208
    db 0x66, 0x3d, 0x24, 0x00    ; cmp ax, 0x24
    je short loc_1208
    jmp short loc_1242
loc_1202:
    db 0x66, 0x3d, 0x12, 0x00    ; cmp ax, 0x12
    jne short loc_1242
loc_1208:
    movsx edx, bx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov esi, 1
    mov ebp, dword [eax + 0x8b0e7]
    sub esi, ebp
    mov dword [eax + 0x8b0e7], esi
    movsx eax, cx
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x2522cc]
    call 0x505d0
loc_1242:
    movsx ebx, bx
    db 0x66, 0x8b, 0x1c, 0x5d, 0xb4, 0xdf, 0x24, 0x00    ; mov bx, word [ebx*2 + 0x24dfb4]
    jmp near loc_11ce
loc_1252:
    movsx eax, word [esp]
    cmp eax, -1
    jne short loc_128b
    movsx edx, cx
    imul ebx, edx, 0x2c
    movsx ebx, word [ebx + 0x2522cc]
    lea eax, [ebx*4]
    add eax, ebx
    mov ax, word [eax*8 + 0x2c9cd6]
    xor ah, ah
    db 0x66, 0x3d, 0x16, 0x00    ; cmp ax, 0x16
    jne short loc_128b
    mov eax, ebx
    call 0x505d0
    mov dword [esp], eax
loc_128b:
    movsx edx, cx
    imul eax, edx, 0x2c
    movsx eax, word [eax + 0x2522cc]
    call loc_0004
loc_129d:
    movsx ecx, cx
    db 0x66, 0x8b, 0x0c, 0x4d, 0xb4, 0x0e, 0x24, 0x00    ; mov cx, word [ecx*2 + 0x240eb4]
    jmp near loc_103a
loc_12ad:
    movsx eax, di
    call loc_0ee4
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
loc_12c4:
    push ebx
    push edx
    mov ebx, eax
    mov dx, word [0x2d6bde]
loc_12cf:
    test dx, dx
    jl short loc_130d
    movsx eax, dx
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 8
    jne short loc_1300
    cmp bx, word [eax + 0x2522da]
    jne short loc_1300
    cmp word [eax + 0x2522d6], 0
    jne short loc_1300
    mov word [eax + 0x2522d6], 1
loc_1300:
    movsx edx, dx
    db 0x66, 0x8b, 0x14, 0x55, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [edx*2 + 0x240eb4]
    jmp short loc_12cf
loc_130d:
    pop edx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
loc_1314:
    push ebx
    push ecx
    push esi
    push edi
    mov esi, eax
    mov edi, edx
    mov dx, word [0x1256d2]
    test dx, dx
    jge short loc_132d
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_132d:
    movsx ecx, dx
    lea eax, [ecx*4]
    sub eax, ecx
    db 0x66, 0x8b, 0x1c, 0x45, 0x00, 0xfb, 0x0f, 0x00    ; mov bx, word [eax*2 + 0xffb00]
    movsx eax, bx
    shl eax, 5
    cmp di, word [eax + 0x27e4ce]
    je short loc_135c
    movsx eax, di
    cmp eax, -1
    jne near loc_13e6
loc_135c:
    movsx eax, bx
    shl eax, 5
    mov ax, word [eax + 0x27e4c6]
    cmp ax, 0xe6
    jb near loc_13e6
    jbe short loc_1385
    cmp ax, 0x297
    jb near loc_13e6
    cmp ax, 0x299
    ja short loc_13e6
loc_1385:
    movsx ecx, dx
    lea eax, [ecx*4]
    sub eax, ecx
    xor ecx, ecx
    db 0x89, 0x0c, 0x45, 0x02, 0xfb, 0x0f, 0x00    ; mov dword [eax*2 + 0xffb02], ecx
    movsx eax, bx
    shl eax, 5
    cmp word [eax + 0x27e4c2], 0
    je short loc_13dd
    xor ebx, ebx
    mov word [eax + 0x27e4c2], bx
    test si, si
    jl short loc_13e6
    movsx ecx, si
    imul ecx, ecx, 0x2c
    cmp word [ecx + 0x2522c2], 1
    jne short loc_13e6
    cmp word [ecx + 0x2522da], 0x1e
    jne short loc_13e6
    xor ecx, ecx
    mov word [eax + 0x27e4ce], cx
    jmp short loc_13e6
loc_13dd:
    mov word [eax + 0x27e4c2], 0x55
loc_13e6:
    dec edx
    test dx, dx
    jge near loc_132d
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x1c
    mov dword [esp + 0x14], eax
    mov dword [esp + 4], edx
    mov byte [esp + 0x18], bl
    test edx, edx
    jl near loc_21be
    mov edi, 1
    xor esi, esi
    cmp bl, 1
    jne short loc_146b
    imul eax, edx, 0x2c
    mov dx, word [eax + 0x2522da]
    mov dword [esp + 0xc], edx
    test dx, dx
    je near loc_21be
    mov dx, word [eax + 0x2522dc]
    mov dword [esp + 0x10], edx
    mov edx, dword [eax + 0x2522b4]
    mov ebp, dword [eax + 0x2522b8]
    mov dword [esp], edx
    mov dx, word [eax + 0x2522c2]
    mov bl, byte [eax + 0x2522c5]
    jmp short loc_14ab
loc_146b:
    mov eax, edx
    shl eax, 5
    mov dx, word [eax + 0x27e4ce]
    mov dword [esp + 0xc], edx
    test dx, dx
    je near loc_21be
    mov dx, word [eax + 0x27e4d0]
    mov dword [esp + 0x10], edx
    mov edx, dword [eax + 0x27e4b4]
    mov ebp, dword [eax + 0x27e4b8]
    mov dword [esp], edx
    mov dx, word [eax + 0x27e4c4]
    mov bl, byte [eax + 0x27e4c9]
loc_14ab:
    mov dword [esp + 8], edx
    mov ecx, dword [esp + 8]
    cmp cx, 0xa8
    jb near loc_15ee
    cmp cx, 0xa9
    jbe near loc_172e
    cmp cx, 0x35c
    jb short loc_1523
    cmp cx, 0x361
    jbe near loc_172e
    cmp cx, 0x462
    jb short loc_1508
    cmp cx, 0x463
    jbe near loc_172e
    cmp cx, 0x476
    jb near loc_1544
    cmp cx, 0x477
    jbe near loc_1556
    jmp near loc_1544
loc_1508:
    cmp cx, 0x457
    jb near loc_1544
    cmp cx, 0x458
    jbe near loc_172e
    jmp near loc_1544
loc_1523:
    cmp cx, 0xaa
    jbe near loc_164f
    cmp cx, 0x2c8
    jb near loc_1544
    cmp cx, 0x2c9
    jbe near loc_172e
loc_1544:
    movsx eax, word [esp + 8]
    call 0x508f0
    test al, al
    je near loc_21c0
loc_1556:
    mov dx, word [0x2d6bd2]
loc_155d:
    test dx, dx
    jl near loc_19b6
    movsx eax, dx
    imul eax, eax, 0x2c
    mov ebx, dword [esp + 0xc]
    cmp bx, word [eax + 0x2522da]
    jne near loc_19a6
    mov ax, word [eax + 0x2522c2]
    cmp ax, 0xa7
    jb near loc_17fa
    jbe near loc_18fb
    cmp ax, 0x35f
    jb near loc_178f
    jbe near loc_1999
    cmp ax, 0x458
    jb near loc_1765
    jbe near loc_1999
    cmp ax, 0x463
    jb near loc_174b
    jbe near loc_1999
    cmp ax, 0x476
    jb near loc_19a6
    jbe near loc_18bb
    cmp ax, 0x477
    je near loc_18fb
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp near loc_155d
loc_15ee:
    cmp cx, 0x92
    jb short loc_1627
    cmp cx, 0x95
    jbe near loc_172e
    cmp cx, 0xa4
    jb short loc_1617
    cmp cx, 0xa5
    jbe near loc_172e
    jmp near loc_1556
loc_1617:
    cmp cx, 0xa2
    jb near loc_1544
    jmp near loc_1556
loc_1627:
    cmp cx, 0x82
    jb near loc_1544
    jbe short loc_164f
    cmp cx, 0x84
    jb near loc_1544
    cmp cx, 0x8d
    jbe near loc_172e
    jmp near loc_1544
loc_164f:
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xf1a4a], 0
    jne near loc_172e
    mov edx, 0xf1720
    add edx, eax
    test bl, bl
    jne short loc_169a
    test byte [eax + 0xf1a56], 1
    je short loc_1693
    mov word [eax + 0xf1a4a], 1
    jmp short loc_16dd
loc_1693:
    mov eax, 0x46
    jmp short loc_16d8
loc_169a:
    cmp bl, 0x15
    jne short loc_16ba
    test byte [eax + 0xf1a56], 2
    je short loc_16b3
    mov word [eax + 0xf1a4a], 1
    jmp short loc_16dd
loc_16b3:
    mov eax, 0x47
    jmp short loc_16d8
loc_16ba:
    cmp bl, 0x17
    jne short loc_16dd
    test byte [eax + 0xf1a56], 4
    je short loc_16d3
    mov word [eax + 0xf1a4a], 1
    jmp short loc_16dd
loc_16d3:
    mov eax, 0x48
loc_16d8:
    call 0x15e50
loc_16dd:
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xf1a4a], 1
    jne near loc_21be
    cmp byte [esp + 0x18], 0
    jne short loc_1719
    mov edx, dword [esp + 4]
    mov word [eax + 0xf1a50], dx
    jmp near loc_21be
loc_1719:
    mov edx, dword [esp + 4]
    mov word [eax + 0xf1a52], dx
    xor al, al
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_172e:
    movsx eax, word [esp + 0xc]
    call 0x507b0
    test ax, ax
    je near loc_1556
    xor al, al
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_174b:
    cmp ax, 0x462
    je near loc_197c
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp near loc_155d
loc_1765:
    cmp ax, 0x361
    jb near loc_197c
    jbe near loc_1999
    cmp ax, 0x457
    je near loc_197c
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp near loc_155d
loc_178f:
    cmp ax, 0x2c8
    jb short loc_17d0
    jbe near loc_197c
    cmp ax, 0x35c
    jb short loc_17b6
    jbe near loc_197c
    cmp ax, 0x35d
    jbe near loc_1999
    jmp near loc_197c
loc_17b6:
    cmp ax, 0x2c9
    je near loc_1999
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp near loc_155d
loc_17d0:
    cmp ax, 0xa9
    jb near loc_197c
    jbe near loc_1999
    cmp ax, 0xaa
    je near loc_197c
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp near loc_155d
loc_17fa:
    cmp ax, 0x8b
    jb short loc_1865
    jbe near loc_1999
    cmp ax, 0xa2
    jb short loc_1831
    jbe near loc_18bb
    cmp ax, 0xa4
    jb near loc_18fb
    jbe near loc_197c
    cmp ax, 0xa5
    jbe near loc_1999
    jmp near loc_18bb
loc_1831:
    cmp ax, 0x8d
    jb near loc_197c
    jbe near loc_1999
    cmp ax, 0x92
    jb near loc_19a6
    cmp ax, 0x95
    jbe near loc_193f
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp near loc_155d
loc_1865:
    cmp ax, 0x86
    jb short loc_1890
    jbe near loc_197c
    cmp ax, 0x88
    jb near loc_1999
    jbe near loc_197c
    cmp ax, 0x89
    jbe near loc_1999
    jmp near loc_197c
loc_1890:
    cmp ax, 0x84
    jb short loc_18a1
    jbe near loc_197c
    jmp near loc_1999
loc_18a1:
    cmp ax, 0x82
    je near loc_197c
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp near loc_155d
loc_18bb:
    cmp byte [esp + 0x18], 1
    jne short loc_18d9
    mov ebx, dword [esp + 4]
    movsx eax, dx
    cmp eax, ebx
    jne short loc_18d9
    imul eax, ebx, 0x2c
    inc word [eax + 0x2522c2]
    jmp short loc_18ea
loc_18d9:
    movsx eax, dx
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522dc], 0
    jne short loc_18ea
    inc edi
loc_18ea:
    inc esi
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp near loc_155d
loc_18fb:
    cmp byte [esp + 0x18], 1
    jne short loc_1919
    mov ecx, dword [esp + 4]
    movsx eax, dx
    cmp eax, ecx
    jne short loc_1919
    imul eax, ecx, 0x2c
    dec word [eax + 0x2522c2]
    jmp short loc_192e
loc_1919:
    movsx eax, dx
    imul eax, eax, 0x2c
    mov bx, word [eax + 0x2522dc]
    cmp bx, 1
    jne short loc_192e
    add edi, ebx
loc_192e:
    inc esi
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp near loc_155d
loc_193f:
    movsx eax, dx
    imul eax, eax, 0x2c
    movsx ecx, dx
    imul ecx, ecx, 0x2c
    inc word [eax + 0x2522c2]
    cmp word [ecx + 0x2522c2], 0x95
    jle short loc_19a6
    movsx eax, dx
    imul eax, eax, 0x2c
    mov word [eax + 0x2522c2], 0x92
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp near loc_155d
loc_197c:
    movsx eax, dx
    imul eax, eax, 0x2c
    inc word [eax + 0x2522c2]
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp near loc_155d
loc_1999:
    movsx eax, dx
    imul eax, eax, 0x2c
    dec word [eax + 0x2522c2]
loc_19a6:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp near loc_155d
loc_19b6:
    xor edx, edx
    jmp near loc_1c08
loc_19bd:
    movsx eax, dx
    mov ecx, dword [esp + 0xc]
    shl eax, 5
    mov ebx, edx
    cmp cx, word [eax + 0x27e4ce]
    jne near loc_1c07
    mov ax, word [eax + 0x27e4c4]
    cmp ax, 0xa8
    jb near loc_1aa9
    jbe near loc_1beb
    cmp ax, 0x35f
    jb short loc_1a5e
    jbe near loc_1bfa
    cmp ax, 0x458
    jb short loc_1a3f
    jbe near loc_1bfa
    cmp ax, 0x463
    jb short loc_1a30
    jbe near loc_1bfa
    cmp ax, 0x476
    jb near loc_1c07
    jbe near loc_1b4b
    cmp ax, 0x477
    je near loc_1b83
    jmp near loc_1c07
loc_1a30:
    cmp ax, 0x462
    je near loc_1beb
    jmp near loc_1c07
loc_1a3f:
    cmp ax, 0x361
    jb near loc_1beb
    jbe near loc_1bfa
    cmp ax, 0x457
    je near loc_1beb
    jmp near loc_1c07
loc_1a5e:
    cmp ax, 0x2c9
    jb short loc_1a8a
    jbe near loc_1bfa
    cmp ax, 0x35d
    jb short loc_1a7b
    jbe near loc_1bfa
    jmp near loc_1beb
loc_1a7b:
    cmp ax, 0x35c
    je near loc_1beb
    jmp near loc_1c07
loc_1a8a:
    cmp ax, 0xaa
    jb near loc_1bfa
    jbe near loc_1beb
    cmp ax, 0x2c8
    je near loc_1beb
    jmp near loc_1c07
loc_1aa9:
    cmp ax, 0x8a
    jb short loc_1b0a
    jbe near loc_1beb
    cmp ax, 0xa3
    jb short loc_1ae0
    jbe near loc_1b83
    cmp ax, 0xa5
    jb near loc_1beb
    jbe near loc_1bfa
    cmp ax, 0xa6
    jbe near loc_1b4b
    jmp near loc_1b83
loc_1ae0:
    cmp ax, 0x92
    jb short loc_1afb
    cmp ax, 0x95
    jbe near loc_1bbc
    cmp ax, 0xa2
    je short loc_1b4b
    jmp near loc_1c07
loc_1afb:
    cmp ax, 0x8b
    je near loc_1bfa
    jmp near loc_1c07
loc_1b0a:
    cmp ax, 0x86
    jb short loc_1b2b
    jbe near loc_1beb
    cmp ax, 0x88
    jb near loc_1bfa
    jbe near loc_1beb
    jmp near loc_1bfa
loc_1b2b:
    cmp ax, 0x84
    jb short loc_1b3c
    jbe near loc_1beb
    jmp near loc_1bfa
loc_1b3c:
    cmp ax, 0x82
    je near loc_1beb
    jmp near loc_1c07
loc_1b4b:
    cmp byte [esp + 0x18], 0
    jne short loc_1b6c
    mov ecx, dword [esp + 4]
    movsx eax, dx
    cmp eax, ecx
    jne short loc_1b6c
    movsx eax, bx
    shl eax, 5
    inc word [eax + 0x27e4c4]
    jmp short loc_1b7d
loc_1b6c:
    movsx eax, bx
    shl eax, 5
    cmp word [eax + 0x27e4d0], 0
    jne short loc_1b7d
    inc edi
loc_1b7d:
    inc esi
    jmp near loc_1c07
loc_1b83:
    cmp byte [esp + 0x18], 0
    jne short loc_1ba4
    mov ecx, dword [esp + 4]
    movsx eax, dx
    cmp eax, ecx
    jne short loc_1ba4
    movsx eax, bx
    shl eax, 5
    dec word [eax + 0x27e4c4]
    jmp short loc_1bb9
loc_1ba4:
    movsx eax, bx
    shl eax, 5
    mov bx, word [eax + 0x27e4d0]
    cmp bx, 1
    jne short loc_1bb9
    add edi, ebx
loc_1bb9:
    inc esi
    jmp short loc_1c07
loc_1bbc:
    movsx eax, dx
    movsx ecx, dx
    shl eax, 5
    shl ecx, 5
    inc word [eax + 0x27e4c4]
    cmp word [ecx + 0x27e4c4], 0x95
    jle short loc_1c07
    movsx eax, dx
    shl eax, 5
    mov word [eax + 0x27e4c4], 0x92
    jmp short loc_1c07
loc_1beb:
    movsx eax, bx
    shl eax, 5
    inc word [eax + 0x27e4c4]
    jmp short loc_1c07
loc_1bfa:
    movsx eax, bx
    shl eax, 5
    dec word [eax + 0x27e4c4]
loc_1c07:
    inc edx
loc_1c08:
    cmp dx, word [0x2d7c10]
    jl near loc_19bd
    cmp word [esp + 0xc], -1
    jne near loc_1cae
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x08    ; mov byte [eax*2 + 0xf1ac2], 8
    mov bx, word [0x125cf5]
    test bx, bx
    je short loc_1c64
    movsx eax, bx
    xor ecx, ecx
    mov dword [0x1261e7], eax
    mov dword [0x1261d7], eax
    mov word [0x125cf5], cx
    jmp short loc_1ca4
loc_1c64:
    mov edi, dword [0x1261e7]
    inc edi
    mov ebp, dword [0x1261eb]
    mov dword [0x1261e7], edi
    test ebp, ebp
    je short loc_1c80
    cmp edi, 0xa
    jg short loc_1c92
loc_1c80:
    cmp dword [0x1261eb], 0
    jne short loc_1c9a
    cmp dword [0x1261e7], 5
    jle short loc_1c9a
loc_1c92:
    xor ecx, ecx
    mov dword [0x1261e7], ecx
loc_1c9a:
    mov eax, dword [0x1261e7]
    mov dword [0x1261d7], eax
loc_1ca4:
    mov al, 1
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_1cae:
    mov edx, dword [esp + 8]
    cmp dx, 0xa6
    jb near loc_1d32
    cmp dx, 0xa7
    jbe near loc_1d88
    cmp dx, 0x35c
    jb short loc_1d19
    cmp dx, 0x361
    jbe near loc_1ed8
    cmp dx, 0x462
    jb short loc_1d07
    cmp dx, 0x463
    jbe near loc_1ed8
    cmp dx, 0x476
    jb near loc_1d76
    cmp dx, 0x477
    jbe near loc_1d88
    jmp near loc_1d76
loc_1d07:
    cmp dx, 0x457
    jb near loc_1d76
    cmp dx, 0x458
    jmp short loc_1d70
loc_1d19:
    cmp dx, 0xaa
    jbe near loc_1ed8
    cmp dx, 0x2c8
    jb short loc_1d76
    cmp dx, 0x2c9
    jmp short loc_1d70
loc_1d32:
    cmp dx, 0x92
    jb short loc_1d57
    cmp dx, 0x95
    jbe near loc_1ed8
    cmp dx, 0xa2
    jb short loc_1d76
    cmp dx, 0xa3
    jbe short loc_1d88
    jmp near loc_1ed8
loc_1d57:
    cmp dx, 0x82
    jb short loc_1d76
    jbe near loc_1ed8
    cmp dx, 0x84
    jb short loc_1d76
    cmp dx, 0x8d
loc_1d70:
    jbe near loc_1ed8
loc_1d76:
    movsx eax, word [esp + 8]
    call 0x508f0
    test al, al
    je near loc_21be
loc_1d88:
    mov ebx, dword [esp + 8]
    cmp bx, 0xa2
    je short loc_1dba
    cmp bx, 0xa3
    je short loc_1dba
    cmp bx, 0x476
    je short loc_1dba
    cmp bx, 0x477
    je short loc_1dba
    cmp bx, 0xa6
    je short loc_1dba
    cmp bx, 0xa7
    jne near loc_1ed8
loc_1dba:
    mov eax, dword [esp + 8]
    cmp ax, 0x476
    je short loc_1dca
    cmp ax, 0x477
    jne short loc_1e32
loc_1dca:
    cmp byte [esp + 0x18], 1
    jne short loc_1e00
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [esp]
    db 0x8b, 0x0c, 0x45, 0x3c, 0x19, 0x0f, 0x00    ; mov ecx, dword [eax*2 + 0xf193c]
    movsx edx, word [esp + 4]
    push ecx
    mov eax, 0x110
    jmp near loc_1e94
loc_1e00:
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ecx, ebp
    db 0x8b, 0x1c, 0x45, 0x3c, 0x19, 0x0f, 0x00    ; mov ebx, dword [eax*2 + 0xf193c]
    db 0x0f, 0xbf, 0x14, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf1a60]
    push ebx
    mov eax, 0x110
    mov ebx, dword [esp + 4]
    jmp short loc_1e96
loc_1e32:
    cmp byte [esp + 0x18], 1
    jne short loc_1e67
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [esp]
    mov ecx, ebp
    db 0x8b, 0x14, 0x45, 0x3c, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf193c]
    mov eax, 0x4c
    push edx
    movsx edx, word [esp + 8]
    jmp short loc_1e96
loc_1e67:
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [esp]
    db 0x8b, 0x0c, 0x45, 0x3c, 0x19, 0x0f, 0x00    ; mov ecx, dword [eax*2 + 0xf193c]
    db 0x0f, 0xbf, 0x14, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf1a60]
    push ecx
    mov eax, 0x4c
loc_1e94:
    mov ecx, ebp
loc_1e96:
    call 0x578d0
    cmp si, di
    jne near loc_21be
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [esp]
    db 0x8b, 0x34, 0x45, 0x3c, 0x19, 0x0f, 0x00    ; mov esi, dword [eax*2 + 0xf193c]
    mov ecx, ebp
    push esi
    db 0x0f, 0xbf, 0x14, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf1a60]
    mov eax, 0x53
    call 0x578d0
loc_1ed8:
    mov ebx, dword [esp + 8]
    cmp bx, 0x92
    je short loc_1ef8
    cmp bx, 0x93
    je short loc_1ef8
    cmp bx, 0x94
    je short loc_1ef8
    cmp bx, 0x95
    jne short loc_1f0c
loc_1ef8:
    mov eax, dword [esp + 8]
    mov edx, dword [esp + 0xc]
    db 0x81, 0xe8, 0x92, 0x00, 0x00, 0x00    ; sub eax, 0x92
    add edx, eax
    mov dword [esp + 0xc], edx
loc_1f0c:
    mov esi, dword [esp + 0xc]
    mov bx, word [0x2d6bd8]
loc_1f17:
    test bx, bx
    jl near loc_2066
    movsx ecx, bx
    imul edx, ecx, 0x2c
    cmp si, word [edx + 0x2522dc]
    jne near loc_2056
    mov ax, word [edx + 0x2522da]
    db 0x66, 0x3d, 0x15, 0x00    ; cmp ax, 0x15
    jb short loc_1f61
    jbe near loc_202c
    db 0x66, 0x3d, 0x18, 0x00    ; cmp ax, 0x18
    jb near loc_2056
    db 0x66, 0x3d, 0x19, 0x00    ; cmp ax, 0x19
    jbe short loc_1fba
    db 0x66, 0x3d, 0x22, 0x00    ; cmp ax, 0x22
    je short loc_1fba
    jmp near loc_2056
loc_1f61:
    db 0x66, 0x3d, 0x0c, 0x00    ; cmp ax, 0xc
    jne near loc_2056
    movsx edx, word [edx + 0x2522cc]
    lea eax, [edx*4]
    add eax, edx
    xor dh, dh
    mov byte [eax*8 + 0x2c9cd1], dh
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov edi, dword [eax + 0x8b0e7]
    inc edi
    mov dword [eax + 0x8b0e7], edi
    cmp edi, 2
    jne near loc_2056
    lea ecx, [edi + 1]
    mov dword [eax + 0x8b0e7], ecx
    jmp near loc_2056
loc_1fba:
    movsx edx, bx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp dword [eax + 0x8b0f7], 0
    sete al
    movsx edx, bx
    mov ecx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    and ecx, 0xff
    mov dword [eax + 0x8b0f7], ecx
    test ecx, ecx
    je short loc_2025
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    add edx, eax
    mov eax, 0xf
    jmp short loc_2051
loc_2025:
    movsx edx, word [esp + 0x14]
    jmp short loc_2033
loc_202c:
    movsx edx, word [0x1256c6]
loc_2033:
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    add edx, eax
    mov eax, 2
loc_2051:
    call 0x15e50
loc_2056:
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov bx, word [eax*2 + 0x240eb4]
    jmp near loc_1f17
loc_2066:
    movsx ebx, word [esp + 0x14]
    movsx ecx, word [esp + 0xc]
    mov edx, ebx
    mov eax, ecx
    call loc_0f74
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea ebx, [eax + eax]
    mov edx, ecx
    movsx eax, word [ebx + 0xf1a60]
    call loc_1314
    mov eax, ecx
    mov ecx, dword [esp + 8]
    call loc_12c4
    cmp cx, 0xa2
    je short loc_20cf
    cmp cx, 0xa3
    je short loc_20cf
    cmp cx, 0x476
    je short loc_20cf
    cmp cx, 0x477
    je short loc_20cf
    cmp cx, 0xa6
    je short loc_20cf
    cmp cx, 0xa7
    jne short loc_20d9
loc_20cf:
    mov al, 1
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_20d9:
    cmp word [esp + 0x10], 0
    jne short loc_2137
    movsx eax, cx
    call 0x508f0
    test al, al
    jne short loc_2137
    cmp byte [esp + 0x18], 1
    jne short loc_2114
    mov eax, 0x4c
    mov ecx, ebp
    mov edx, dword [ebx + 0xf193c]
    mov ebx, dword [esp]
    push edx
    movsx edx, word [esp + 8]
    call 0x578d0
    jmp near loc_21b4
loc_2114:
    mov ecx, ebp
    mov eax, dword [ebx + 0xf193c]
    movsx edx, word [ebx + 0xf1a60]
    push eax
    mov ebx, dword [esp + 4]
    mov eax, 0x4c
    call 0x578d0
    jmp near loc_21b4
loc_2137:
    mov edi, dword [esp + 0x10]
    test di, di
    je short loc_21b4
    cmp byte [esp + 0x18], 1
    jne short loc_218b
    movsx esi, di
    test byte [esi + 0x123c40], 4
    jne short loc_218b
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [esp]
    db 0x8b, 0x3c, 0x45, 0x3c, 0x19, 0x0f, 0x00    ; mov edi, dword [eax*2 + 0xf193c]
    mov ecx, ebp
    push edi
    movsx edx, word [esp + 8]
    mov eax, esi
    call 0x578d0
    mov al, 1
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_218b:
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf1a60]
    xor eax, eax
    mov ax, word [esp + 0x10]
    call 0x58160
loc_21b4:
    mov al, 1
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_21be:
    xor al, al
loc_21c0:
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push esi
    mov ecx, eax
    mov esi, edx
    cwde
    xor edx, edx
    db 0x66, 0x8b, 0x1c, 0x45, 0xd4, 0x73, 0x2d, 0x00    ; mov bx, word [eax*2 + 0x2d73d4]
loc_21e6:
    test bx, bx
    jl short loc_221e
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 2
    jne short loc_2211
    mov edx, 0xffffffff
    movsx eax, word [eax + 0x2522da]
    call loc_0f74
    mov edx, 1
loc_2211:
    movsx ebx, bx
    db 0x66, 0x8b, 0x1c, 0x5d, 0xb4, 0xdf, 0x24, 0x00    ; mov bx, word [ebx*2 + 0x24dfb4]
    jmp short loc_21e6
loc_221e:
    test dx, dx
    jne short loc_222e
    movsx edx, si
    movsx eax, cx
    call loc_0004
loc_222e:
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
loc_2234:
    push ecx
    push esi
    movsx esi, bx
    mov ecx, esi
    shl ecx, 5
    mov word [ecx + 0x27e4c4], ax
    movsx ecx, dx
    mov eax, 0x12
    mov edx, ecx
    call 0x58160
    mov eax, 0x14
    mov edx, ecx
    mov ebx, 0xa
    call 0x58160
    mov edx, esi
    mov eax, ecx
    call 0x26960
    pop esi
    pop ecx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_2274:
    push esi
    push edi
    push ebp
    sub esp, 0xc
    mov dword [esp + 8], eax
    mov dword [esp], edx
    mov edi, ebx
    mov ebp, ecx
    mov ecx, dword [esp + 0x20]
    movsx eax, word [esp]
    mov esi, 0x27e4b4
    shl eax, 5
    mov edx, 0xffffffff
    add esi, eax
    mov dword [esp + 4], edx
    cmp word [esi + 0x12], 0x230
    jne near loc_2318
    cmp cx, 0x4d6
    jb short loc_22d0
    jbe short loc_22e8
    cmp cx, 0x686
    jb short loc_22c7
    jbe short loc_22e8
    cmp cx, 0xa2d
    je short loc_22e8
    jmp short loc_2318
loc_22c7:
    cmp cx, 0x4df
    je short loc_22e8
    jmp short loc_2318
loc_22d0:
    cmp cx, 0x3d5
    jb short loc_22e2
    jbe short loc_22e8
    cmp cx, 0x437
    je short loc_22e8
    jmp short loc_2318
loc_22e2:
    cmp cx, 0x1a
    jne short loc_2318
loc_22e8:
    movsx edx, word [esp]
    movsx edi, word [esp + 8]
    mov ebx, 0x46
    mov eax, edi
    call 0x26960
    mov eax, 0x14
    mov bh, byte [esi + 0xe]
    mov word [esi + 0x12], 0x46
    and bh, 0xef
    mov edx, edi
    mov byte [esi + 0xe], bh
    jmp near loc_2680
loc_2318:
    test byte [esi + 0xe], 0x10
    jne short loc_232a
    cmp word [esi + 0x12], 0xe6
    jne near loc_2637
loc_232a:
    mov dx, word [esi + 0xc]
    test dx, dx
    jl near loc_2637
    movsx edx, dx
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov ebx, dword [esp + 0x1c]
    mov eax, dword [edx + 0x2c9cbc]
    cmp eax, ebx
    jle near loc_2637
    sub eax, dword [edx + 0x2c9cb8]
    je near loc_2637
    mov ax, word [esi + 0x12]
    cmp ax, 0x1f7
    jb short loc_239d
    jbe near loc_24fd
    cmp ax, 0x1fe
    jb near loc_2637
    jbe near loc_25c7
    cmp ax, 0x297
    jb near loc_2637
    cmp ax, 0x299
    jbe short loc_23b8
    jmp near loc_2637
loc_239d:
    cmp ax, 0xe6
    jb near loc_2637
    jbe short loc_23be
    cmp ax, 0x197
    je near loc_24a2
    jmp near loc_2637
loc_23b8:
    mov word [esi + 0x1e], 1
loc_23be:
    lea ebx, [esp + 4]
    mov edx, ebp
    mov eax, edi
    call 0x6be57
    mov ebx, dword [esp + 4]
    test bx, bx
    jl near loc_2685
    movsx eax, cx
    cmp eax, -1
    jne short loc_23f4
    push 5
    movsx eax, word [esp + 0xc]
    push eax
    push 0
    push 0
    push 0
    push 8
    push 8
    jmp short loc_2439
loc_23f4:
    cmp cx, 0x9e8
    jne short loc_2427
    push 5
    movsx eax, word [esp + 0xc]
    push eax
    imul eax, eax, 0x2c
    push 0
    push 0
    mov dl, byte [eax + 0x2522c9]
    push 0
    add dl, 0x10
    mov al, byte [eax + 0x2522c8]
    movsx edx, dl
    add al, 0x10
    push edx
    movsx eax, al
    push eax
    jmp short loc_2439
loc_2427:
    push 5
    movsx eax, word [esp + 0xc]
    push eax
    push 0
    push 0
    push 0
    push 0x20
    push 0x20
loc_2439:
    push -0x7f
    mov ecx, dword [esp + 0x3c]
    mov edx, edi
    push 0x687
    movsx eax, bx
    mov ebx, ebp
    call 0x192d0
    movsx edi, ax
    imul ebp, edi, 0x2c
    or byte [ebp + 0x2522c0], 0x92
    movsx edx, word [esi + 8]
    shl edx, 5
    mov eax, dword [esi + 4]
    sub eax, dword [edx + 0x27e4b8]
    mov ecx, dword [edx + 0x27e4b4]
    mov ebx, eax
    mov eax, dword [esi]
    mov edx, ebx
    sub eax, ecx
    call 0x62b58
    db 0x81, 0xe8, 0x00, 0x02, 0x00, 0x00    ; sub eax, 0x200
    mov edx, edi
    mov word [ebp + 0x2522d0], ax
    mov eax, 0x23
    call 0x58160
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    ret 8
loc_24a2:
    mov dl, byte [esi + 0xe]
    mov word [esi + 0x12], 0x19b
    and dl, 0xbe
    mov di, word [esi + 0xa]
    mov byte [esi + 0xe], dl
    test di, di
    jl short loc_24d7
    movsx eax, di
    shl eax, 5
    mov word [eax + 0x27e4c6], 0x19b
    movsx eax, word [esi + 0xa]
    shl eax, 5
    and byte [eax + 0x27e4c2], 0xbe
loc_24d7:
    movsx esi, word [esp + 8]
    mov eax, 0x12
    mov edx, esi
    call 0x58160
    mov eax, 0x13
    mov edx, esi
    call 0x58160
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    ret 8
loc_24fd:
    lea ebx, [esp + 4]
    mov edx, ebp
    mov eax, edi
    call 0x6be57
    cmp word [esp + 4], 0
    jl near loc_2685
    movsx edx, word [esp]
    movsx eax, word [esp + 8]
    mov ebx, 0xa
    mov word [esi + 0x12], 0x1f8
    call 0x26960
    mov dx, word [esi + 0xa]
    mov word [esi + 0xe], 0
    test dx, dx
    jl short loc_254d
    movsx eax, dx
    shl eax, 5
    xor ebx, ebx
    mov word [eax + 0x27e4c2], bx
loc_254d:
    push 3
    movsx eax, word [esp + 0xc]
    push eax
    push 0
    push 0
    movsx eax, word [0xf19b8]
    push eax
    push 0
    push 0
    mov ecx, dword [esp + 0x38]
    push 0
    mov ebx, ebp
    mov edx, edi
    push 1
    movsx eax, word [esp + 0x28]
    call 0x192d0
    movsx edx, ax
    imul eax, edx, 0x2c
    lea esi, [edx*8]
    add esi, edx
    mov ecx, 0x80
    lea esi, [esi*8]
    mov word [eax + 0x2522da], cx
    sub esi, edx
    movsx eax, word [esp]
    mov ecx, 5
    mov dword [esi + 0x8b0ef], eax
    mov eax, 0x13
    mov dword [esi + 0x8b0eb], ecx
    call 0x58160
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    ret 8
loc_25c7:
    lea ebx, [esp + 4]
    mov edx, ebp
    mov eax, edi
    call 0x6be57
    cmp word [esp + 4], 0
    jl near loc_2685
    movsx edx, word [esp]
    movsx eax, word [esp + 8]
    mov ebx, 0x50
    call 0x26dc0
    mov cx, word [esi + 0xa]
    mov word [esi + 0xe], 0
    test cx, cx
    jl short loc_2611
    movsx eax, cx
    shl eax, 5
    xor esi, esi
    mov word [eax + 0x27e4c2], si
loc_2611:
    movsx esi, word [esp + 8]
    mov eax, 0x12
    mov edx, esi
    call 0x58160
    mov eax, 0x13
    mov edx, esi
    call 0x58160
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    ret 8
loc_2637:
    mov ax, word [esi + 0x10]
    cmp ax, 0x509
    jae short loc_2685
    cmp ax, 0x131
    jb short loc_2685
    jbe short loc_2685
    cmp ax, 0x326
    jb short loc_2685
    jbe short loc_2685
    cmp ax, 0x4bc
    jb short loc_2685
    jbe short loc_265f
    cmp ax, 0x4bf
    jne short loc_2685
loc_265f:
    movsx ebx, word [esp]
    mov ax, word [esi + 0x10]
    movsx edi, word [esp + 8]
    db 0x05, 0x02, 0x00, 0x00, 0x00    ; add eax, 2
    mov edx, edi
    cwde
    call loc_2234
    mov eax, 0x12
    mov edx, edi
loc_2680:
    call 0x58160
loc_2685:
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    ret 8
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    mov ebx, eax
    movsx eax, dx
    and eax, 0xc000
    cmp eax, 0xc000
    jne short loc_2722
    and dh, 0xf
    movsx eax, dx
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x2522c2]
    cmp ax, 0x38f
    jne near loc_28db
    cmp word [ebx + 0x320], 8
    jge near loc_28db
    movsx eax, word [ebx + 0x340]
    imul eax, eax, 0x2c
    sub word [eax + 0x2522de], 5
    mov word [ebx + 0x320], 0x10
    mov dword [ebx + 0x274], 0x20
    mov byte [ebx + 0x3f0], 0x20
    mov byte [ebx + 0x3f1], 0
    mov eax, 0xd3
    movsx edx, word [ebx + 0x340]
    mov byte [ebx + 0x3f2], 0
    call 0x58160
    jmp near loc_28db
loc_2722:
    cmp eax, 0x8000
    jne near loc_28db
    mov cx, word [ebx + 0x320]
    and dh, 0x1f
    test cx, cx
    jle short loc_274c
    mov eax, ecx
    dec eax
    mov word [ebx + 0x320], ax
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_274c:
    movsx esi, dx
    mov edx, esi
    shl edx, 5
    test byte [edx + 0x27e4c2], 0x55
    je near loc_28db
    mov dx, word [edx + 0x27e4c6]
    cmp dx, 0xe6
    jb near loc_28db
    jbe near loc_2877
    cmp dx, 0x297
    jb near loc_28db
    cmp dx, 0x299
    ja near loc_28db
    movsx eax, word [ebx + 0x340]
    imul eax, eax, 0x2c
    sub word [eax + 0x2522de], 5
    mov word [ebx + 0x320], 0x10
    mov dword [ebx + 0x274], 0x20
    movsx eax, word [ebx + 0x298]
    mov byte [ebx + 0x3f0], 0x20
    add eax, 0x200
    mov byte [ebx + 0x3f1], 0
    and eax, 0x7ff
    mov byte [ebx + 0x3f2], 0
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    shl eax, 8
    mov dword [ebx + 0x24c], eax
    mov edx, eax
    mov ax, word [ebx + 0x298]
    and ah, 7
    neg edx
    cwde
    mov dword [ebx + 0x24c], edx
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    shl eax, 8
    movsx edx, word [ebx + 0x340]
    mov ecx, eax
    mov dword [ebx + 0x250], eax
    neg ecx
    mov eax, 0xd3
    mov dword [ebx + 0x250], ecx
    call 0x58160
    mov ax, word [ebx + 0x298]
    and ah, 7
    cwde
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov ecx, dword [ebx + 0x218]
    sar eax, 9
    add ecx, eax
    movsx eax, word [ebx + 0x298]
    add eax, 0x200
    and eax, 0x7ff
    push -1
    mov edi, dword [ebx + 0x21c]
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov edx, dword [ebx + 0x214]
    sar eax, 9
    push edi
    jmp short loc_28c9
loc_2877:
    mov ax, word [ebx + 0x298]
    and ah, 7
    cwde
    mov word [ebx + 0x320], 0x1a
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov ecx, dword [ebx + 0x218]
    sar eax, 9
    add ecx, eax
    movsx eax, word [ebx + 0x298]
    add eax, 0x200
    and eax, 0x7ff
    push -1
    mov ebp, dword [ebx + 0x21c]
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov edx, dword [ebx + 0x214]
    sar eax, 9
    push ebp
loc_28c9:
    add edx, eax
    movsx eax, word [ebx + 0x340]
    mov ebx, edx
    mov edx, esi
    call loc_2274
loc_28db:
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 4
    mov dword [esp], eax
    movsx edx, ax
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + 0x2c9cc4]
    db 0x66, 0x3d, 0x7c, 0x00    ; cmp ax, 0x7c
    jb short loc_2929
    jbe short loc_293f
    cmp ax, 0x2bf
    jb short loc_291e
    jbe short loc_293f
    cmp ax, 0x2c1
    je short loc_293f
    jmp near loc_2bb2
loc_291e:
    cmp ax, 0x2bd
    je short loc_293f
    jmp near loc_2bb2
loc_2929:
    db 0x66, 0x3d, 0x78, 0x00    ; cmp ax, 0x78
    jb near loc_2bb2
    jbe short loc_293f
    db 0x66, 0x3d, 0x7a, 0x00    ; cmp ax, 0x7a
    jne near loc_2bb2
loc_293f:
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    movsx ecx, word [esp]
    sub eax, edx
    mov ebx, 0xa
    mov edx, ecx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    call 0x26c90
    movsx edx, word [0x1256c6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf1a60]
    mov eax, 0x13
    call 0x58160
    lea eax, [ecx*4]
    add eax, ecx
    lea eax, [eax*8]
    cmp word [eax + 0x2c9cc4], 0x2bf
    jne short loc_29bb
    mov word [eax + 0x2c9cc4], 0x2c0
loc_29bb:
    movsx edx, word [esp]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    cmp word [eax + 0x2c9cc4], 0x2c1
    jne short loc_29e3
    mov word [eax + 0x2c9cc4], 0x2c2
loc_29e3:
    movsx edx, word [esp]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    cmp word [eax + 0x2c9cc4], 0x2bd
    jne short loc_2a0b
    mov word [eax + 0x2c9cc4], 0x2be
loc_2a0b:
    movsx edx, word [esp]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    cmp word [eax + 0x2c9cc4], 0x7c
    jne short loc_2a32
    mov word [eax + 0x2c9cc4], 0x7d
loc_2a32:
    movsx edx, word [esp]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    cmp word [eax + 0x2c9cc4], 0x78
    jne short loc_2a59
    mov word [eax + 0x2c9cc4], 0x79
loc_2a59:
    movsx edx, word [esp]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    cmp word [eax + 0x2c9cc4], 0x7a
    jne short loc_2a80
    mov word [eax + 0x2c9cc4], 0x7b
loc_2a80:
    movsx edx, word [esp]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9cd8], 0
    jne near loc_2b28
    db 0x66, 0x8b, 0x14, 0x55, 0xd4, 0x73, 0x2d, 0x00    ; mov dx, word [edx*2 + 0x2d73d4]
loc_2aa4:
    test dx, dx
    jl near loc_2b28
    movsx eax, dx
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 1
    jne short loc_2b18
    cmp word [eax + 0x2522da], 0xc
    jne short loc_2b18
    mov bx, word [0x2d6bd8]
loc_2ace:
    test bx, bx
    jl short loc_2b28
    movsx ecx, bx
    imul eax, ecx, 0x2c
    movsx esi, dx
    imul esi, esi, 0x2c
    mov ax, word [eax + 0x2522dc]
    cmp ax, word [esi + 0x2522dc]
    jne short loc_2b0b
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov dword [eax + 0x8b0f3], 1
loc_2b0b:
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov bx, word [eax*2 + 0x240eb4]
    jmp short loc_2ace
loc_2b18:
    movsx edx, dx
    db 0x66, 0x8b, 0x14, 0x55, 0xb4, 0xdf, 0x24, 0x00    ; mov dx, word [edx*2 + 0x24dfb4]
    jmp near loc_2aa4
loc_2b28:
    mov dx, word [0x2d6bd8]
    call 0x6dc5f
    mov ebx, eax
    xor bh, ah
    and bl, 1
loc_2b3b:
    test dx, dx
    jl short loc_2ba7
    movsx esi, dx
    imul edi, esi, 0x2c
    movsx ecx, word [esp]
    lea eax, [ecx*4]
    add ecx, eax
    lea ecx, [ecx*8]
    mov ax, word [edi + 0x2522dc]
    cmp ax, word [ecx + 0x2c9cd8]
    jne short loc_2b9a
    cmp word [edi + 0x2522da], 3
    jne short loc_2b9a
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    movsx edi, bx
    mov esi, 1
    mov dword [eax + 0x8b0ef], edi
    mov dword [eax + 0x8b0f7], esi
loc_2b9a:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp short loc_2b3b
loc_2ba7:
    mov al, 1
    add esp, 4
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2bb2:
    xor al, al
    add esp, 4
loc_2bb7:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 8
    mov word [esp + 4], ax
    mov esi, edx
    and byte [esp + 5], 0xf
    movsx ecx, word [esp + 4]
    imul edx, ecx, 0x2c
    mov ax, word [edx + 0x2522c2]
    cmp ax, 0x365
    jb near loc_2db1
    jbe near loc_3563
    cmp ax, 0x3f4
    jb near loc_2cd0
    cmp ax, 0x3f6
    jbe near loc_3563
    cmp ax, 0x54e
    jb short loc_2c77
    jbe near loc_3628
    cmp ax, 0x1003
    jb short loc_2c4d
    jbe near loc_3ab0
    cmp ax, 0x1171
    jb short loc_2c3e
    jbe near loc_3270
    cmp ax, 0x134f
    je near loc_3bb2
    jmp near loc_3e98
loc_2c3e:
    cmp ax, 0x115c
    je near loc_3dba
    jmp near loc_3e98
loc_2c4d:
    cmp ax, 0x58c
    jb short loc_2c68
    jbe near loc_3e8c
    cmp ax, 0xa1e
    je near loc_3723
    jmp near loc_3e98
loc_2c68:
    cmp ax, 0x54f
    je near loc_3657
    jmp near loc_3e98
loc_2c77:
    cmp ax, 0x485
    jb short loc_2cb1
    cmp ax, 0x48e
    jbe near loc_3563
    cmp ax, 0x549
    jb short loc_2ca2
    jbe near loc_3bd8
    cmp ax, 0x54b
    jbe near loc_3bb2
    jmp near loc_3e98
loc_2ca2:
    cmp ax, 0x548
    je near loc_3bb2
    jmp near loc_3e98
loc_2cb1:
    cmp ax, 0x401
    jb near loc_3e98
    jbe near loc_36b1
    cmp ax, 0x459
    je near loc_3a26
    jmp near loc_3e98
loc_2cd0:
    cmp ax, 0x3c9
    jb near loc_2d4e
    jbe near loc_36e3
    cmp ax, 0x3d5
    jb short loc_2d1a
    jbe near loc_38ff
    cmp ax, 0x3e2
    jb short loc_2d0b
    cmp ax, 0x3e4
    jbe near loc_3ae5
    cmp ax, 0x3eb
    je near loc_37ab
    jmp near loc_3e98
loc_2d0b:
    cmp ax, 0x3de
    je near loc_30a9
    jmp near loc_3e98
loc_2d1a:
    cmp ax, 0x3d2
    jb short loc_2d35
    jbe near loc_30a9
    cmp ax, 0x3d3
    je near loc_3270
    jmp near loc_3e98
loc_2d35:
    cmp ax, 0x3cb
    jb near loc_3e98
    cmp ax, 0x3cf
    jbe near loc_2f60
    jmp near loc_3e98
loc_2d4e:
    cmp ax, 0x38e
    jb short loc_2d8e
    jbe near loc_30a9
    cmp ax, 0x3b7
    jb short loc_2d7f
    jbe near loc_30a9
    cmp ax, 0x3ba
    jb near loc_3e98
    cmp ax, 0x3bd
    jbe near loc_3563
    jmp near loc_3e98
loc_2d7f:
    cmp ax, 0x38f
    je near loc_314a
    jmp near loc_3e98
loc_2d8e:
    cmp ax, 0x385
    jb near loc_3e98
    cmp ax, 0x386
    jbe near loc_2f82
    cmp ax, 0x38c
    je near loc_30a9
    jmp near loc_3e98
loc_2db1:
    cmp ax, 0x26a
    jb near loc_2e9e
    cmp ax, 0x26b
    jbe near loc_3ae5
    cmp ax, 0x2b9
    jb short loc_2e35
    jbe near loc_3dba
    cmp ax, 0x300
    jb short loc_2e0b
    cmp ax, 0x301
    jbe near loc_3563
    cmp ax, 0x30b
    jb short loc_2dfc
    jbe near loc_3563
    cmp ax, 0x318
    je near loc_3563
    jmp near loc_3e98
loc_2dfc:
    cmp ax, 0x306
    je near loc_3563
    jmp near loc_3e98
loc_2e0b:
    cmp ax, 0x2f1
    jb short loc_2e26
    jbe near loc_3563
    cmp ax, 0x2fd
    je near loc_3563
    jmp near loc_3e98
loc_2e26:
    cmp ax, 0x2cc
    je near loc_3563
    jmp near loc_3e98
loc_2e35:
    cmp ax, 0x2a8
    jb short loc_2e7f
    jbe near loc_3dba
    cmp ax, 0x2b1
    jb short loc_2e66
    jbe near loc_3dba
    cmp ax, 0x2b6
    jb near loc_3e98
    cmp ax, 0x2b7
    jbe near loc_3dba
    jmp near loc_3e98
loc_2e66:
    cmp ax, 0x2ad
    jb near loc_3e98
    cmp ax, 0x2ae
    jbe near loc_3dba
    jmp near loc_3e98
loc_2e7f:
    cmp ax, 0x29d
    jb near loc_3e98
    jbe near loc_3dba
    cmp ax, 0x2a6
    je near loc_3dba
    jmp near loc_3e98
loc_2e9e:
    cmp ax, 0x237
    jb short loc_2eff
    jbe near loc_3563
    cmp ax, 0x253
    jb short loc_2ee0
    jbe near loc_39e1
    cmp ax, 0x25f
    jb short loc_2ed1
    jbe near loc_3486
    cmp ax, 0x268
    je near loc_3ae5
    jmp near loc_3e98
loc_2ed1:
    cmp ax, 0x25a
    je near loc_3486
    jmp near loc_3e98
loc_2ee0:
    cmp ax, 0x239
    jb near loc_3e98
    jbe near loc_380f
    cmp ax, 0x23b
    je near loc_3887
    jmp near loc_3e98
loc_2eff:
    cmp ax, 0x204
    jb short loc_2f3d
    cmp ax, 0x205
    jbe near loc_3486
    cmp ax, 0x22c
    jb short loc_2f2e
    cmp ax, 0x22d
    jbe near loc_3d8f
    cmp ax, 0x233
    jb near loc_3e98
    jmp near loc_345a
loc_2f2e:
    cmp ax, 0x227
    je near loc_3563
    jmp near loc_3e98
loc_2f3d:
    cmp ax, 0x156
    jb near loc_3e98
    cmp ax, 0x157
    jbe near loc_3a6b
    cmp ax, 0x197
    je near loc_331a
    jmp near loc_3e98
loc_2f60:
    mov edx, 0x919
    movsx eax, word [esp + 4]
    call 0x19680
    movsx eax, word [esp + 4]
    call 0x67ff5
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2f82:
    movsx eax, si
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 0x386
    je short loc_2fa8
    movsx eax, si
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 0x385
    jne near loc_3043
loc_2fa8:
    movsx ecx, word [esp + 4]
    imul ebx, ecx, 0x2c
    movsx eax, word [ebx + 0x2522d4]
    mov edx, eax
    sar edx, 1
    sar eax, 2
    add eax, edx
    mov edx, eax
    movsx eax, si
    imul eax, eax, 0x2c
    mov word [eax + 0x2522d4], dx
    mov dx, word [ebx + 0x2522d0]
    add edx, edx
    mov si, word [eax + 0x2522d0]
    add dh, 4
    sub esi, edx
    mov word [eax + 0x2522d0], si
    mov edx, dword [ebx + 0x2522b8]
    mov esi, dword [eax + 0x2522b8]
    sub edx, esi
    mov esi, edx
    mov edx, dword [ebx + 0x2522b4]
    mov edi, dword [eax + 0x2522b4]
    mov eax, edx
    mov edx, esi
    sub eax, edi
    call 0x62b58
    db 0x81, 0xe8, 0x00, 0x02, 0x00, 0x00    ; sub eax, 0x200
    mov ebp, dword [0x124041]
    mov word [ebx + 0x2522d0], ax
    cmp ebp, 2
    jge near loc_4412
    mov eax, 8
    mov edx, ecx
    call 0x58160
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3043:
    call 0x6dc5f
    test al, 3
    je short loc_3082
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov word [eax + 0x2522d4], 0xa4
    movsx eax, si
    imul eax, eax, 0x2c
    movsx edx, word [esp + 4]
    imul edx, edx, 0x2c
    mov ax, word [eax + 0x2522d0]
    mov word [edx + 0x2522d0], ax
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3082:
    mov ebx, 3
    mov edx, 0xffffffff
    movsx eax, word [esp + 4]
    call 0x26960
    movsx eax, word [esp + 4]
    call 0x67ff5
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_30a9:
    movsx eax, si
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x2522c2]
    cmp ax, 0x659
    jb short loc_30d9
    jbe short loc_30ef
    cmp ax, 0x686
    jb near loc_4412
    jbe short loc_30ef
    cmp ax, 0xa2d
    je short loc_30ef
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_30d9:
    db 0x66, 0x3d, 0x1a, 0x00    ; cmp ax, 0x1a
    jb near loc_4412
    jbe short loc_30ef
    cmp ax, 0x3d5
    jne near loc_4412
loc_30ef:
    movsx ebx, word [esp + 4]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    cmp dword [eax + 0x8b0e7], 0
    jne near loc_4412
    imul edx, ebx, 0x2c
    mov ebp, 1
    mov cx, word [edx + 0x2522c0]
    mov dword [eax + 0x8b0e7], ebp
    and ecx, 0xfffffefe
    mov eax, ebx
    mov word [edx + 0x2522c0], cx
    mov edx, 0x8de
    call 0x19680
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_314a:
    movsx eax, si
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x2522c2]
    cmp ax, 0x659
    jb short loc_317a
    jbe short loc_3190
    cmp ax, 0x686
    jb near loc_4412
    jbe short loc_3190
    cmp ax, 0xa2d
    je short loc_3190
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_317a:
    db 0x66, 0x3d, 0x1a, 0x00    ; cmp ax, 0x1a
    jb near loc_4412
    jbe short loc_3190
    cmp ax, 0x3d5
    jne near loc_4412
loc_3190:
    xor esi, esi
    jmp near loc_3230
loc_3197:
    push 5
    movsx ebx, word [esp + 8]
    push ebx
    imul ebx, ebx, 0x2c
    movsx edx, word [ebx + 0x2522d8]
    call 0x6dc5f
    and eax, 0xfff
    sar edx, 2
    neg eax
    sub eax, edx
    push eax
    call 0x6dc5f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x6dc5f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x6dc5f
    xor ah, ah
    and al, 3
    add eax, 0x968
    cwde
    push eax
    call 0x6dc5f
    mov edx, eax
    mov ecx, 0x3000
    sar edx, 0x1f
    idiv ecx
    movsx edi, word [ebx + 0x2522cc]
    mov ecx, dword [ebx + 0x2522bc]
    mov eax, dword [ebx + 0x2522b8]
    sub ecx, edx
    mov edx, dword [ebx + 0x2522b4]
    mov ebx, eax
    mov eax, edi
    call 0x192d0
    mov dword [esp], eax
    cwde
    imul eax, eax, 0x2c
    mov dh, 8
    inc esi
    mov byte [eax + 0x2522c5], dh
loc_3230:
    cmp si, 0x40
    jl near loc_3197
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 0x38f
    jne short loc_3256
    mov word [eax + 0x2522c2], 0x3ab
loc_3256:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    and word [eax + 0x2522c0], 0xfefe
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3270:
    xor esi, esi
    jmp short loc_32ef
loc_3274:
    push 5
    movsx edx, word [esp + 8]
    push edx
    imul edx, edx, 0x2c
    movsx ebx, word [edx + 0x2522d8]
    call 0x6dc5f
    and eax, 0xfff
    sar ebx, 2
    neg eax
    sub eax, ebx
    push eax
    call 0x6dc5f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x6dc5f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x6dc5f
    xor ah, ah
    mov ecx, dword [edx + 0x2522bc]
    and al, 0xf
    mov ebx, dword [edx + 0x2522b8]
    add eax, 0x960
    mov edi, dword [edx + 0x2522b4]
    cwde
    sub ecx, 0x800
    push eax
    movsx eax, word [edx + 0x2522cc]
    mov edx, edi
    inc esi
    call 0x192d0
loc_32ef:
    cmp si, 6
    jl near loc_3274
    movsx ebx, word [esp + 4]
    mov eax, 0x14
    mov edx, ebx
    call 0x58160
    mov eax, ebx
    call 0x67ff5
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_331a:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov word [eax + 0x2522c2], 0x19b
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    and word [eax + 0x2522c0], 0xfefe
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x2522cc]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9ccc], 0x19c
    jne short loc_3382
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x2522cc]
    lea eax, [edx*4]
    add eax, edx
    mov word [eax*8 + 0x2c9ccc], 0x1a0
loc_3382:
    movsx ebx, word [esp + 4]
    mov edx, ebx
    imul ebx, ebx, 0x2c
    mov eax, 0x14
    mov esi, 0x2522b4
    xor edi, edi
    call 0x58160
    mov dword [esp], edi
    add esi, ebx
    cmp word [esp], 0x10
    jl short loc_33b2
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_33b2:
    push 5
    movsx eax, word [esp + 8]
    push eax
    mov edx, 0xfffffe00
    call 0x6dc5f
    and eax, 0x7ff
    sub edx, eax
    push edx
    call 0x6dc5f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x6dc5f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x6dc5f
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [esi + 8]
    push eax
    sub ecx, 0x800
    call 0x6dc5f
    and eax, 0x1fff
    sub ecx, eax
    call 0x6dc5f
    and eax, 0xff
    mov ebx, dword [esi + 4]
    add ebx, eax
    call 0x6dc5f
    and eax, 0xff
    mov edx, dword [esi]
    add edx, eax
    sub ebx, 0x80
    sub edx, 0x80
    movsx eax, word [esi + 0x18]
    call 0x192d0
    inc dword [esp]
    cmp word [esp], 0x10
    jl near loc_33b2
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_345a:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov esi, 0x237
    mov edx, 0x399
    mov word [eax + 0x2522c2], si
    movsx eax, word [esp + 4]
    call 0x19680
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3486:
    movsx eax, si
    imul eax, eax, 0x2c
    mov edx, dword [0xecc84]
    mov ebx, dword [edx]
    movsx eax, word [eax + 0x2522de]
    cmp eax, ebx
    je near loc_4412
    xor eax, eax
    mov dword [esp], eax
    jmp near loc_3537
loc_34ad:
    push 5
    movsx edx, word [esp + 8]
    push edx
    imul edx, edx, 0x2c
    call 0x6dc5f
    and eax, 0x1ff
    neg eax
    sub eax, 0x100
    push eax
    call 0x6dc5f
    xor ah, ah
    and al, 0x7f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x6dc5f
    and ah, 7
    cwde
    push eax
    push 0x40
    push 0x40
    push -8
    call 0x6dc5f
    xor ah, ah
    and al, 0xf
    add eax, 0x960
    cwde
    push eax
    movsx eax, word [edx + 0x2522cc]
    lea esi, [eax*4]
    add esi, eax
    movsx ecx, word [esp + 0x24]
    mov ebx, dword [esi*8 + 0x2c9cbc]
    shl ecx, 9
    sub ebx, 0xc00
    sub ebx, ecx
    mov ecx, ebx
    mov ebx, dword [edx + 0x2522b8]
    mov edx, dword [edx + 0x2522b4]
    call 0x192d0
    inc dword [esp]
loc_3537:
    cmp word [esp], 0xf
    jl near loc_34ad
    movsx ebx, word [esp + 4]
    mov edx, 0x762
    mov eax, ebx
    call 0x19680
    mov eax, ebx
    call 0x67ff5
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3563:
    movsx eax, word [esp + 4]
    imul edx, eax, 0x2c
    mov bx, word [edx + 0x2522c2]
    cmp bx, 0x485
    jne short loc_359a
    call 0x6dc5f
    xor ah, ah
    and al, 3
    db 0x05, 0x04, 0x00, 0x00, 0x00    ; add eax, 4
    mov ebx, 0x2522b4
    cwde
    add ebx, edx
    mov edx, eax
    mov eax, ebx
    call 0x28be0
    jmp short loc_35e2
loc_359a:
    cmp bx, 0x2f1
    je short loc_35a8
    cmp bx, 0x365
    jne short loc_35cc
loc_35a8:
    movsx ecx, word [esp + 4]
    mov ebx, 0x28
    mov edx, 0xffffffff
    mov eax, ecx
    call 0x26dc0
    mov eax, 0x14
    mov edx, ecx
    call 0x58160
    jmp short loc_35e2
loc_35cc:
    cmp bx, 0x2fd
    jne short loc_35e2
    mov ebx, 0x28
    mov edx, 0xffffffff
    call 0x26960
loc_35e2:
    movsx ecx, word [esp + 4]
    mov eax, 0x13
    mov edx, ecx
    call 0x58160
    call 0x6dc5f
    and ah, 7
    mov edx, eax
    imul eax, ecx, 0x2c
    mov ebx, 8
    mov word [eax + 0x2522d0], dx
    mov edx, 0xffffffff
    mov eax, ecx
    call 0x26960
    mov eax, ecx
    call 0x67ff5
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3628:
    mov word [edx + 0x2522c2], 0x54f
    mov eax, 0x13
    mov edx, ecx
    mov ebx, 0xa
    call 0x58160
    mov edx, 0xffffffff
    mov eax, ecx
    call 0x26960
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3657:
    xor edi, edi
    mov dword [esp], edi
    jmp short loc_368d
loc_365e:
    movsx ebx, word [esp + 4]
    mov eax, ebx
    imul ebx, ebx, 0x2c
    mov edx, 0x8f8
    call 0x45b50
    mov edi, dword [esp]
    mov si, word [ebx + 0x2522d0]
    inc edi
    add esi, 0x14d
    mov dword [esp], edi
    mov word [ebx + 0x2522d0], si
loc_368d:
    cmp word [esp], 0x30
    jl short loc_365e
    movsx ebx, word [esp + 4]
    mov eax, 0x14
    mov edx, ebx
    call 0x58160
    mov eax, 0x45
    mov edx, ebx
    call 0x58160
loc_36b1:
    movsx ecx, word [esp + 4]
    mov eax, 0x13
    mov edx, ecx
    mov ebx, 0xa
    call 0x58160
    mov edx, 0xffffffff
    mov eax, ecx
    call 0x26960
    mov eax, ecx
    call 0x67ff5
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_36e3:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov ebx, 0x3eb
    movsx edx, word [esp + 4]
    mov word [eax + 0x2522c2], bx
    mov eax, 0x13
    mov ebx, 0xa
    call 0x58160
    mov edx, 0xffffffff
    movsx eax, word [esp + 4]
    call 0x26960
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3723:
    xor bl, bl
    mov byte [edx + 0x2522c8], bl
    movsx edx, word [edx + 0x2522d2]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, 0x20
    mov ebx, dword [eax + 0x8b0eb]
    mov dword [eax + 0x8b0e7], edx
    test ebx, ebx
    sete al
    movsx ebx, word [esp + 4]
    mov ecx, eax
    imul eax, ebx, 0x2c
    movsx edx, word [eax + 0x2522d2]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    and ecx, 0xff
    mov dword [eax + 0x8b0eb], ecx
    mov ecx, dword [eax + 0x8b0ef]
    inc ecx
    mov edx, 0x762
    mov dword [eax + 0x8b0ef], ecx
    mov eax, ebx
    call 0x19680
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_37ab:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    test byte [eax + 0x2522c0], 1
    je near loc_4412
    movsx edx, word [esp + 4]
    mov eax, 0x13
    call 0x58160
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    movsx edx, word [esp + 4]
    imul edx, edx, 0x2c
    add dword [eax + 0x2522bc], 0x1000
    xor eax, eax
    mov ebx, 5
    mov word [edx + 0x2522c0], ax
    mov edx, 0xffffffff
    movsx eax, word [esp + 4]
    call 0x26960
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_380f:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov word [eax + 0x2522c2], 0x267
    movsx edx, word [esp + 4]
    imul edx, edx, 0x2c
    call 0x6dc5f
    xor ah, ah
    and al, 1
    shl eax, 2
    mov bx, word [edx + 0x2522c0]
    or ebx, eax
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov word [edx + 0x2522c0], bx
    mov cx, word [eax + 0x2522c0]
    and ecx, 0xfffffefe
    mov edx, 0x399
    mov word [eax + 0x2522c0], cx
    movsx eax, word [esp + 4]
    call 0x19680
    movsx edx, word [esp + 4]
    mov eax, 0x13
    call 0x58160
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3887:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    movsx edx, word [esp + 4]
    imul edx, edx, 0x2c
    mov word [eax + 0x2522c2], 0x23d
    call 0x6dc5f
    xor ah, ah
    and al, 1
    mov si, word [edx + 0x2522c0]
    shl eax, 2
    or esi, eax
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov word [edx + 0x2522c0], si
    mov di, word [eax + 0x2522c0]
    and edi, 0xfffffefe
    mov edx, 0x399
    mov word [eax + 0x2522c0], di
    movsx eax, word [esp + 4]
    call 0x19680
    movsx edx, word [esp + 4]
    mov eax, 0x14
    call 0x58160
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_38ff:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov word [eax + 0x2522c2], 0x3b6
    mov edx, 0x399
    movsx eax, word [esp + 4]
    xor esi, esi
    call 0x19680
    jmp near loc_39bf
loc_3926:
    push 5
    movsx ebx, word [esp + 8]
    push ebx
    imul ebx, ebx, 0x2c
    movsx edx, word [ebx + 0x2522d8]
    call 0x6dc5f
    and eax, 0xfff
    sar edx, 2
    neg eax
    sub eax, edx
    push eax
    call 0x6dc5f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x6dc5f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x6dc5f
    xor ah, ah
    and al, 3
    add eax, 0x968
    cwde
    push eax
    call 0x6dc5f
    mov edx, eax
    mov ecx, 0x3000
    sar edx, 0x1f
    idiv ecx
    movsx edi, word [ebx + 0x2522cc]
    mov ecx, dword [ebx + 0x2522bc]
    mov eax, dword [ebx + 0x2522b8]
    sub ecx, edx
    mov edx, dword [ebx + 0x2522b4]
    mov ebx, eax
    mov eax, edi
    call 0x192d0
    mov dword [esp], eax
    cwde
    imul eax, eax, 0x2c
    mov dl, 2
    inc esi
    mov byte [eax + 0x2522c5], dl
loc_39bf:
    cmp si, 5
    jl near loc_3926
    movsx edx, word [esp + 4]
    mov eax, 0x14
    call 0x58160
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_39e1:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov word [eax + 0x2522c2], 0x254
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov bx, word [eax + 0x2522c0]
    and ebx, 0xfefe
    movsx edx, word [esp + 4]
    mov word [eax + 0x2522c0], bx
    mov eax, 0x12
    call 0x58160
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3a26:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov word [eax + 0x2522c2], 0x45a
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov di, word [eax + 0x2522c0]
    and edi, 0xfefe
    movsx edx, word [esp + 4]
    mov word [eax + 0x2522c0], di
    mov eax, 0x12
    call 0x58160
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3a6b:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov word [eax + 0x2522c2], 0x155
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov bx, word [eax + 0x2522c0]
    and ebx, 0xfefe
    movsx edx, word [esp + 4]
    mov word [eax + 0x2522c0], bx
    mov eax, 0x12
    call 0x58160
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3ab0:
    mov si, word [edx + 0x2522c0]
    mov ebx, 0x1004
    and esi, 0xfefe
    mov word [edx + 0x2522c2], bx
    mov eax, 0x12
    mov word [edx + 0x2522c0], si
    mov edx, ecx
    call 0x58160
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3ae5:
    movsx edx, word [esp + 4]
    imul edx, edx, 0x2c
    mov ax, word [edx + 0x2522c2]
    cmp ax, 0x26b
    jb short loc_3b18
    jbe short loc_3b28
    cmp ax, 0x3e3
    jb short loc_3b10
    jbe near loc_3b5f
    cmp ax, 0x3e4
    je short loc_3b49
    jmp short loc_3b68
loc_3b10:
    cmp ax, 0x3e2
    je short loc_3b54
    jmp short loc_3b68
loc_3b18:
    cmp ax, 0x268
    jb short loc_3b68
    jbe short loc_3b33
    cmp ax, 0x26a
    je short loc_3b3e
    jmp short loc_3b68
loc_3b28:
    mov word [edx + 0x2522c2], 0x269
    jmp short loc_3b68
loc_3b33:
    mov word [edx + 0x2522c2], 0x279
    jmp short loc_3b68
loc_3b3e:
    mov word [edx + 0x2522c2], 0x2bc
    jmp short loc_3b68
loc_3b49:
    mov word [edx + 0x2522c2], 0x3e5
    jmp short loc_3b68
loc_3b54:
    mov word [edx + 0x2522c2], 0x3ed
    jmp short loc_3b68
loc_3b5f:
    mov word [edx + 0x2522c2], 0x4ec
loc_3b68:
    movsx ebx, word [esp + 4]
    mov eax, ebx
    imul ebx, ebx, 0x2c
    mov edx, 0x4e2
    call 0x19680
    mov edx, eax
    movsx edx, dx
    imul edx, edx, 0x2c
    movsx ebx, word [ebx + 0x2522cc]
    mov dword [esp], eax
    lea eax, [ebx*4]
    add eax, ebx
    mov eax, dword [eax*8 + 0x2c9cbc]
    sub eax, 0x2000
    mov dword [edx + 0x2522bc], eax
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3bb2:
    movsx ebx, word [esp + 4]
    imul ecx, ebx, 0x2c
    xor eax, eax
    mov edx, ebx
    mov ax, word [ecx + 0x2522da]
    call 0x58160
    mov eax, ebx
    movsx edx, word [ecx + 0x2522dc]
    call 0x19680
loc_3bd8:
    movsx eax, si
    imul eax, eax, 0x2c
    movsx edi, word [esp + 4]
    imul ebx, edi, 0x2c
    mov ax, word [eax + 0x2522de]
    mov dx, word [ebx + 0x2522de]
    sub edx, eax
    mov word [ebx + 0x2522de], dx
    test dx, dx
    jg near loc_4412
    call 0x6dc5f
    and ah, 7
    mov edx, 0x8f8
    mov word [ebx + 0x2522d0], ax
    mov eax, edi
    call 0x45b50
    call 0x6dc5f
    and ah, 7
    mov edx, 0x8fa
    mov word [ebx + 0x2522d0], ax
    mov eax, edi
    call 0x45b50
    call 0x6dc5f
    and ah, 7
    mov edx, 0x8f9
    mov word [ebx + 0x2522d0], ax
    mov eax, edi
    call 0x45b50
    call 0x6dc5f
    and ah, 7
    mov edx, 0x8fb
    mov word [ebx + 0x2522d0], ax
    mov eax, edi
    call 0x45b50
    call 0x6dc5f
    and ah, 7
    mov edx, 0x8f8
    mov word [ebx + 0x2522d0], ax
    mov eax, edi
    call 0x45b50
    call 0x6dc5f
    and ah, 7
    mov edx, 0x8fa
    mov word [ebx + 0x2522d0], ax
    mov eax, edi
    call 0x45b50
    call 0x6dc5f
    and ah, 7
    mov word [ebx + 0x2522d0], ax
    mov edx, 0x8f9
    mov eax, edi
    mov esi, 0x2522b4
    call 0x45b50
    call 0x6dc5f
    mov edx, 0x8fb
    and ah, 7
    add esi, ebx
    mov word [ebx + 0x2522d0], ax
    mov eax, edi
    mov ebx, 1
    call 0x45b50
    mov edx, 0x8c5
    movsx ecx, word [0x2f2926]
    mov eax, esi
    call 0x28d60
    mov ebx, 2
    mov edx, 0x8ca
    movsx ecx, word [0x2f2926]
    mov eax, esi
    call 0x28d60
    mov ebx, 3
    mov edx, 0x8cf
    movsx ecx, word [0x2f2926]
    mov eax, esi
    call 0x28d60
    mov ebx, 4
    mov edx, 0x8d4
    movsx ecx, word [0x2f2926]
    mov eax, esi
    call 0x28d60
    mov ebx, 1
    mov edx, 0x8d9
    movsx ecx, word [0x2f2926]
    mov eax, esi
    call 0x28d60
    mov ebx, 6
    mov edx, 0x8cf
    movsx ecx, word [0x2f2926]
    mov eax, esi
    call 0x28d60
    mov eax, 0x45
    call 0x57f40
    mov eax, edi
    call 0x67ff5
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3d8f:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov word [eax + 0x2522c2], 0x22f
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    xor edx, edx
    mov word [eax + 0x2522c0], dx
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3dba:
    movsx ebx, word [esp + 4]
    mov edx, ebx
    imul ebx, ebx, 0x2c
    mov eax, 0x14
    mov esi, 0x2522b4
    xor edi, edi
    call 0x58160
    mov dword [esp], edi
    add esi, ebx
    jmp near loc_3e6e
loc_3ddf:
    push 5
    movsx eax, word [esp + 8]
    push eax
    mov edx, 0xfffffe00
    call 0x6dc5f
    and eax, 0x7ff
    sub edx, eax
    push edx
    call 0x6dc5f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x6dc5f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x6dc5f
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [esi + 8]
    push eax
    sub ecx, 0x800
    call 0x6dc5f
    and eax, 0x1fff
    sub ecx, eax
    call 0x6dc5f
    and eax, 0xff
    mov ebx, dword [esi + 4]
    add ebx, eax
    call 0x6dc5f
    and eax, 0xff
    add eax, dword [esi]
    lea edx, [eax - 0x80]
    sub ebx, 0x80
    movsx eax, word [esi + 0x18]
    call 0x192d0
    inc dword [esp]
loc_3e6e:
    cmp word [esp], 0x10
    jl near loc_3ddf
    movsx eax, word [esp + 4]
    call 0x67ff5
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3e8c:
    mov ax, word [edx + 0x2522d2]
    mov word [esp + 4], ax
loc_3e98:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    test byte [eax + 0x2522c0], 0x10
    je short loc_3ecb
    cmp word [eax + 0x2522dc], 0
    jne short loc_3ecb
    cmp word [eax + 0x2522da], 0
    jne short loc_3ecb
    cmp word [eax + 0x2522ce], 0
    je near loc_4412
loc_3ecb:
    movsx eax, si
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 0x669
    je short loc_3eed
    mov ecx, dword [esp + 4]
    cmp cx, word [eax + 0x2522d2]
    je near loc_4412
loc_3eed:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522ce], 4
    je near loc_4412
    add eax, 0x2522b4
    call 0x12bc0
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jne near loc_420c
    movsx eax, si
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 0xa2d
    jne short loc_3f38
    mov bx, word [eax + 0x2522de]
    add ebx, ebx
    mov word [eax + 0x2522de], bx
loc_3f38:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov cx, word [eax + 0x2522c2]
    cmp cx, 0x758
    je near loc_4015
    cmp cx, 0x938
    je near loc_4015
    cmp cx, 0x780
    je near loc_4015
    cmp cx, 0x942
    jl short loc_3f7a
    cmp cx, 0x949
    jle near loc_4015
loc_3f7a:
    movsx eax, si
    imul ebx, eax, 0x2c
    cmp word [ebx + 0x2522c2], 0x669
    je near loc_4015
    movsx edx, word [esp + 4]
    imul edx, edx, 0x2c
    movsx edx, word [edx + 0x2522c2]
    cmp byte [edx + 0xd21f8], 0
    jne short loc_4015
    mov edx, 0x8ee
    call 0x19680
    mov dl, byte [ebx + 0x2522c5]
    mov dword [esp], eax
    cmp dl, 6
    jne short loc_3fc9
    cwde
    imul eax, eax, 0x2c
    mov byte [eax + 0x2522c5], dl
loc_3fc9:
    movsx edx, word [esp]
    imul edx, edx, 0x2c
    mov eax, 0x10
    mov bl, 0x18
    mov word [edx + 0x2522d4], ax
    mov byte [edx + 0x2522c9], bl
    mov ecx, dword [edx + 0x2522bc]
    mov byte [edx + 0x2522c8], bl
    add ecx, 0x400
    mov dword [edx + 0x2522bc], ecx
    call 0x6dc5f
    xor ah, ah
    mov ebx, 0x20
    and al, 0x3f
    sub ebx, eax
    mov eax, ebx
    add word [edx + 0x2522d0], ax
loc_4015:
    movsx eax, si
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x2522d2]
    mov dword [esp], eax
    test ax, ax
    jl near loc_40ac
    cwde
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 0x214
    jne short loc_40ac
    movsx ebx, word [esp + 4]
    imul edx, ebx, 0x2c
    mov cx, word [edx + 0x2522c2]
    cmp cx, 0x938
    je short loc_40ac
    cmp cx, 0x758
    je short loc_40ac
    movsx edx, word [eax + 0x2522d6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0x83, 0x3c, 0x45, 0x32, 0x1a, 0x0f, 0x00, 0x0a    ; cmp word [eax*2 + 0xf1a32], 0xa
    jne short loc_40ac
    mov edx, 0x8f9
    mov eax, ebx
    call 0x45b50
    mov edx, 0x8f8
    mov eax, ebx
    call 0x45b50
    mov edx, 0x8fa
    mov eax, ebx
    call 0x45b50
    mov edx, 0x8fb
    mov eax, ebx
    call 0x45b50
loc_40ac:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    mov bx, word [eax + 0x2522c2]
    cmp bx, 0x7b7
    je near loc_41a2
    cmp bx, 0xa46
    je near loc_41a2
    cmp bx, 0x1284
    je near loc_41a2
    cmp bx, 0xa96
    je near loc_41a2
    cmp bx, 0xac8
    je near loc_41a2
    cmp bx, 0x7a8
    je near loc_41a2
    cmp bx, 0x938
    je near loc_41a2
    test byte [eax + 0x2522c0], 0x30
    jne short loc_412b
    movsx edx, si
    imul edx, edx, 0x2c
    mov dx, word [edx + 0x2522d0]
    add dh, 4
    and dh, 7
    mov word [eax + 0x2522d0], dx
loc_412b:
    movsx eax, si
    imul eax, eax, 0x2c
    movsx ebp, word [esp + 4]
    imul edi, ebp, 0x2c
    mov ax, word [eax + 0x2522de]
    shl eax, 2
    neg eax
    mov word [edi + 0x2522d4], ax
    push 0x10001
    mov ax, word [edi + 0x2522cc]
    push 0x400
    mov dword [esp + 8], eax
    mov eax, 0x2522b4
    push 0x400
    add eax, edi
    push 0x80
    lea ebx, [eax + 8]
    lea ecx, [esp + 0x10]
    lea edx, [eax + 4]
    call 0x6baa4
    mov eax, dword [esp]
    cmp ax, word [edi + 0x2522cc]
    je short loc_41a2
    test ax, ax
    jl short loc_41a2
    cmp ax, 0x400
    jge short loc_41a2
    movsx edx, ax
    mov eax, ebp
    call 0x681b7
loc_41a2:
    movsx ebx, word [esp + 4]
    imul eax, ebx, 0x2c
    cmp word [eax + 0x2522ce], 2
    jne short loc_41db
    mov edx, 1
    mov eax, ebx
    call 0x681fe
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov word [eax + 0x8b0c9], 0x600
loc_41db:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x2522c8], 0x18
    jb short loc_41f7
    cmp word [eax + 0x2522c2], 0x60e
    jne short loc_420c
loc_41f7:
    movsx eax, si
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 0x66e
    je near loc_4412
loc_420c:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522ce], 2
    je near loc_42c7
    movsx edx, si
    imul edx, edx, 0x2c
    cmp word [edx + 0x2522c2], 0x669
    jne short loc_426b
    cmp word [eax + 0x2522c2], 0x214
    jne short loc_424b
    cmp byte [eax + 0x2522c5], 1
    je near loc_4412
loc_424b:
    cmp byte [0x8dbc], 0
    jne short loc_426b
    movsx eax, si
    imul eax, eax, 0x2c
    mov edi, dword [esp + 4]
    cmp di, word [eax + 0x2522d2]
    je near loc_4412
loc_426b:
    movsx edx, si
    imul edx, edx, 0x2c
    movsx ebx, word [esp + 4]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov bx, word [edx + 0x2522c2]
    mov cx, word [eax + 0x8b0bd]
    mov word [eax + 0x8b0b9], bx
    add cx, word [edx + 0x2522de]
    mov bx, word [edx + 0x2522d0]
    mov word [eax + 0x8b0bd], cx
    mov dx, word [edx + 0x2522d2]
    mov word [eax + 0x8b0bb], bx
    mov word [eax + 0x8b0bf], dx
loc_42c7:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522ce], 0xa
    jne near loc_4412
    mov ax, word [eax + 0x2522d6]
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xf1a3e], 0
    jl near loc_43a1
    mov ebx, 0xffffffff
    mov edx, dword [eax + 0xf1958]
    mov word [eax + 0xf1a3e], bx
    mov dword [eax + 0xf1934], edx
    mov edx, dword [eax + 0xf195c]
    mov dword [eax + 0xf1938], edx
    mov edx, dword [eax + 0xf1960]
    mov dword [eax + 0xf193c], edx
    mov ecx, 0xf1720
    mov dx, word [eax + 0xf19ba]
    add ecx, eax
    mov word [eax + 0xf19b8], dx
    lea ebx, [ecx + 0x29e]
    mov edx, dword [eax + 0xf1938]
    mov eax, dword [eax + 0xf1934]
    call 0x6be57
    mov eax, ecx
    call 0x45230
    mov ax, word [0x2d6bd4]
loc_4370:
    mov dword [esp], eax
    mov eax, dword [esp]
    test ax, ax
    jl short loc_43a1
    cwde
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 0x26d
    jne short loc_4393
    xor ebx, ebx
    mov word [eax + 0x2522d6], bx
loc_4393:
    movsx eax, word [esp]
    db 0x66, 0x8b, 0x04, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov ax, word [eax*2 + 0x240eb4]
    jmp short loc_4370
loc_43a1:
    movsx eax, word [esp + 4]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x2522c8], 0x18
    jae short loc_43c3
    movsx eax, si
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 0x66e
    je short loc_4412
loc_43c3:
    movsx edx, word [esp + 4]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx eax, word [eax + 0x8b0bf]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 0x214
    je short loc_4412
    cmp dword [0x1261e3], 3
    jl short loc_4412
    movsx edx, si
    imul edx, edx, 0x2c
    movsx eax, word [edx + 0x2522de]
    mov ebx, eax
    sar ebx, 1
    add eax, ebx
    mov word [edx + 0x2522de], ax
loc_4412:
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov si, word [0x2d6bd8]
loc_4430:
    test si, si
    jl near loc_2bb7
    movsx eax, si
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522da], 0x11
    jne near loc_44e6
    cmp byte [eax + 0x2522c4], 0x10
    jle near loc_44e6
    mov dx, word [0x2d6bd8]
loc_4461:
    test dx, dx
    jl near loc_44e6
    movsx ebx, dx
    imul ebx, ebx, 0x2c
    cmp word [ebx + 0x2522da], 0x11
    jne short loc_44d6
    cmp si, dx
    je short loc_44d6
    movsx eax, si
    imul eax, eax, 0x2c
    mov di, word [ebx + 0x2522dc]
    cmp di, word [eax + 0x2522dc]
    jne short loc_44d6
    movsx ecx, word [eax + 0x2522cc]
    lea eax, [ecx*4]
    movsx ebx, word [ebx + 0x2522cc]
    add ecx, eax
    lea eax, [ebx*4]
    lea ecx, [ecx*8]
    add eax, ebx
    mov ebx, dword [ecx + 0x2c9cbc]
    mov dword [eax*8 + 0x2c9cbc], ebx
    mov ebx, dword [ecx + 0x2c9cb8]
    mov dword [eax*8 + 0x2c9cb8], ebx
loc_44d6:
    movsx edx, dx
    db 0x66, 0x8b, 0x14, 0x55, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [edx*2 + 0x240eb4]
    jmp near loc_4461
loc_44e6:
    movsx esi, si
    db 0x66, 0x8b, 0x34, 0x75, 0xb4, 0x0e, 0x24, 0x00    ; mov si, word [esi*2 + 0x240eb4]
    jmp near loc_4430
    db 0x8b, 0xc0    ; mov eax, eax
%else
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
loc_0004:
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x54
    mov dword [esp + 0x50], eax
    mov dword [esp + 0x4c], edx
    movsx ebp, ax
    lea eax, [ebp*4]
    add eax, ebp
    mov edi, 0x2385a4
    lea eax, [eax*8]
    add edi, eax
    mov dx, word [edi + 0x22]
    and dh, 0x3f
    sub edx, 9
    cmp dx, 0x16
    ja near loc_0ece
    and edx, 0xffff
    jmp dword cs:[edx*4 + 0x44070]
    movsx esi, word [eax + 0x2385c8]
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov dx, word [eax + 0x4e9e3]
    test dx, dx
    je short loc_007c
    cmp dx, 0x100
    jne short loc_008b
loc_007c:
    movsx edx, word [esp + 0x4c]
    movsx eax, word [esp + 0x50]
    call 0x53220
loc_008b:
    imul esi, esi, 0x2c
    cmp word [esi + 0x1c0bce], 1
    jne short loc_00a6
    mov word [esi + 0x1c0bce], 3
    jmp near loc_0ece
loc_00a6:
    mov word [esi + 0x1c0bce], 1
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    movsx esi, word [eax + 0x2385c8]
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    cmp dword [eax + 0x4ea17], 0
    jne short loc_00e4
    mov dword [eax + 0x4ea17], 1
loc_00e4:
    movsx edx, word [esp + 0x4c]
    movsx eax, word [esp + 0x50]
    call 0x53220
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    lea eax, [edi + 4]
    call 0x53c20
    cwde
    cmp eax, -1
    jne near loc_0ece
    mov byte [0x10ddf8], 1
    mov byte [edi + 0x22], 0
    mov dl, byte [edi + 0x22]
    movsx ebx, word [esp + 0x4c]
    or dl, 0x16
    mov eax, ebp
    mov byte [edi + 0x22], dl
    mov edx, ebx
    call loc_0004
    mov byte [edi + 0x22], 0
    mov dh, byte [edi + 0x22]
    or dh, 9
    mov eax, ebp
    mov byte [edi + 0x22], dh
    mov edx, ebx
    call loc_0004
    mov byte [edi + 0x22], 0
    or byte [edi + 0x22], 0x1a
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    movsx eax, word [edi]
    xor ebx, ebx
    mov dword [esp + 0x24], eax
    mov dword [esp + 0x48], ebx
    mov dword [esp + 0x1c], ebx
    mov edx, dword [esp + 0x24]
    movsx eax, word [edi + 2]
    mov ebx, dword [esp + 0x24]
    add eax, edx
    movsx edi, word [edi + 0x26]
    dec eax
    sar edi, 4
    mov dword [esp + 0x10], eax
    jmp short loc_01a8
loc_0184:
    mov ecx, dword [esp + 0x48]
    mov esi, dword [esp + 0x1c]
    shl eax, 5
    inc ebx
    mov edx, dword [eax + 0x1ecda4]
    mov eax, dword [eax + 0x1ecda8]
    add ecx, edx
    add esi, eax
    mov dword [esp + 0x48], ecx
    mov dword [esp + 0x1c], esi
loc_01a8:
    mov esi, dword [esp + 0x10]
    movsx eax, bx
    cmp eax, esi
    jle short loc_0184
    mov ebp, dword [esp + 0x24]
    mov ebx, esi
    mov eax, dword [esp + 0x48]
    sub ebx, ebp
    mov edx, eax
    inc ebx
    sar edx, 0x1f
    idiv ebx
    mov dword [esp + 0x48], eax
    mov eax, dword [esp + 0x1c]
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov ecx, dword [esp + 0x48]
    mov ebx, dword [esp + 0x24]
    mov dword [esp + 0x1c], eax
    mov eax, 0xffffffff
    mov esi, dword [esp + 0x1c]
    mov dword [esp], eax
    mov dword [esp + 4], eax
    jmp short loc_021d
loc_01f4:
    shl eax, 5
    cmp ecx, dword [eax + 0x1ecda4]
    je short loc_0207
    cmp esi, dword [eax + 0x1ecda8]
    jne short loc_021c
loc_0207:
    cmp dword [esp], -1
    jne short loc_0215
    movsx eax, bx
    mov dword [esp], eax
    jmp short loc_021c
loc_0215:
    movsx eax, bx
    mov dword [esp + 4], eax
loc_021c:
    inc ebx
loc_021d:
    mov ebp, dword [esp + 0x10]
    movsx eax, bx
    cmp eax, ebp
    jle short loc_01f4
    xor esi, esi
    cmp esi, 2
    jl short loc_0238
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_0238:
    lea edx, [esi*4]
    mov eax, dword [esp + edx]
    shl eax, 5
    mov ecx, dword [esp + 0x48]
    cmp ecx, dword [eax + 0x1ecda4]
    jne near loc_0419
    mov ebp, dword [esp + 0x1c]
    cmp ebp, dword [eax + 0x1ecda8]
    jne near loc_0419
    mov bx, word [esp + edx]
    dec ebx
    mov ebp, dword [esp + 0x24]
    movsx eax, bx
    cmp eax, ebp
    jge short loc_0279
    mov ebx, dword [esp + 0x10]
loc_0279:
    lea eax, [esi*4]
    mov dword [esp + 0x44], eax
    mov eax, dword [esp + eax]
    movsx ebx, bx
    shl eax, 5
    shl ebx, 5
    movsx edx, word [eax + 0x1ecdac]
    mov dword [esp + 0x14], ebx
    shl edx, 5
    mov ebp, dword [ebx + 0x1ecda4]
    add ebp, dword [edx + 0x1ecda4]
    mov ecx, dword [eax + 0x1ecda4]
    sar ebp, 1
    sub ebp, ecx
    mov dword [esp + 0xc], ebp
    mov ebp, dword [esp + 0x14]
    mov ebx, dword [edx + 0x1ecda8]
    mov ebp, dword [ebp + 0x1ecda8]
    add ebp, ebx
    mov ecx, dword [eax + 0x1ecda8]
    sar ebp, 1
    mov ebx, 0x1ecda4
    sub ebp, ecx
    mov ecx, dword [esp + 0x14]
    add ebx, ecx
    mov dword [esp + 0x3c], ebx
    mov ebx, 0x1ecda4
    add ebx, eax
    mov dword [esp + 0x2c], ebx
    cmp dword [esp + 0xc], 0
    je near loc_038d
    movsx ebx, word [edx + 0x1ecdac]
    shl ebx, 5
    mov ecx, edi
    mov ebx, dword [ebx + 0x1ecda4]
    mov edx, dword [edx + 0x1ecda4]
    mov ebp, ebx
    mov dword [esp + 0xc], ebx
    sub ebp, edx
    mov ebx, dword [eax + 0x1ecda4]
    mov dword [esp + 0xc], ebp
    add ebx, ebp
    movsx ebp, word [esp + 0x50]
    mov edx, dword [esp + 0x2c]
    mov eax, ebp
    call 0x53c50
    mov ebx, dword [esp + 0x14]
    mov edx, dword [esp + 0xc]
    mov ecx, edi
    mov ebx, dword [ebx + 0x1ecda4]
    mov eax, ebp
    add ebx, edx
    mov edx, dword [esp + 0x3c]
    call 0x53c50
    mov edx, dword [esp + 0x44]
    mov edx, dword [esp + edx]
    shl edx, 5
    movsx edx, word [edx + 0x1ecdac]
    mov ecx, dword [esp + 0xc]
    shl edx, 5
    mov eax, ebp
    mov ebx, dword [edx + 0x1ecda4]
    add edx, 0x1ecda4
    add ebx, ecx
    mov ecx, edi
    call 0x53c50
    movsx edx, word [esp + 0x4c]
    mov eax, ebp
    jmp near loc_0563
loc_038d:
    test ebp, ebp
    je near loc_0568
    movsx ebx, word [edx + 0x1ecdac]
    mov ecx, dword [edx + 0x1ecda8]
    mov edx, dword [esp + 0x2c]
    shl ebx, 5
    add edx, 4
    mov ebp, dword [ebx + 0x1ecda8]
    mov ebx, dword [eax + 0x1ecda8]
    sub ebp, ecx
    movsx eax, word [esp + 0x50]
    mov ecx, edi
    add ebx, ebp
    mov dword [esp + 8], eax
    call 0x53c50
    mov ebx, dword [esp + 0x14]
    mov edx, dword [esp + 0x3c]
    mov eax, dword [esp + 8]
    mov ecx, edi
    mov ebx, dword [ebx + 0x1ecda8]
    add edx, 4
    add ebx, ebp
    call 0x53c50
    mov eax, dword [esp + 0x44]
    mov eax, dword [esp + eax]
    shl eax, 5
    movsx eax, word [eax + 0x1ecdac]
    shl eax, 5
    mov ebx, dword [eax + 0x1ecda8]
    add eax, 0x1ecda4
    mov ecx, edi
    lea edx, [eax + 4]
    add ebx, ebp
    mov eax, dword [esp + 8]
    jmp near loc_0555
loc_0419:
    mov bx, word [esp + esi*4]
    dec ebx
    mov edx, dword [esp + 0x24]
    movsx eax, bx
    cmp eax, edx
    jge short loc_042d
    mov ebx, dword [esp + 0x10]
loc_042d:
    lea eax, [esi*4]
    mov dword [esp + 0x40], eax
    mov eax, dword [esp + eax]
    shl eax, 5
    movsx ebx, bx
    movsx ebp, word [eax + 0x1ecdac]
    shl ebx, 5
    shl ebp, 5
    mov edx, dword [ebx + 0x1ecda4]
    add edx, dword [ebp + 0x1ecda4]
    sar edx, 1
    mov ecx, dword [eax + 0x1ecda4]
    sub edx, ecx
    mov dword [esp + 0xc], edx
    mov ecx, dword [ebp + 0x1ecda8]
    mov edx, dword [ebx + 0x1ecda8]
    add edx, ecx
    mov ebp, dword [eax + 0x1ecda8]
    sar edx, 1
    sub edx, ebp
    mov ebp, edx
    mov edx, 0x1ecda4
    add edx, ebx
    mov dword [esp + 0x30], edx
    mov edx, dword [esp + 0xc]
    add eax, 0x1ecda4
    test edx, edx
    je short loc_04fa
    movsx ebp, word [esp + 0x50]
    mov ebx, dword [esp + 0x48]
    mov ecx, edi
    mov edx, eax
    mov eax, ebp
    call 0x53c50
    mov eax, dword [esp + 0x48]
    add eax, dword [esp + 0xc]
    mov edx, dword [esp + 0x30]
    mov dword [esp + 8], eax
    mov ecx, edi
    mov ebx, eax
    mov eax, ebp
    call 0x53c50
    mov eax, dword [esp + 0x40]
    mov eax, dword [esp + eax]
    shl eax, 5
    mov edx, 0x1ecda4
    movsx eax, word [eax + 0x1ecdac]
    mov ebx, dword [esp + 8]
    shl eax, 5
    mov ecx, edi
    add edx, eax
    mov eax, ebp
    call 0x53c50
    movsx edx, word [esp + 0x4c]
    mov eax, ebp
    jmp short loc_0563
loc_04fa:
    test ebp, ebp
    je short loc_0568
    lea edx, [eax + 4]
    mov ebx, dword [esp + 0x1c]
    movsx eax, word [esp + 0x50]
    mov ecx, edi
    mov dword [esp + 8], eax
    call 0x53c50
    mov ebx, dword [esp + 0x1c]
    mov edx, dword [esp + 0x30]
    mov eax, dword [esp + 8]
    mov ecx, edi
    add ebp, ebx
    add edx, 4
    mov ebx, ebp
    call 0x53c50
    mov eax, dword [esp + 0x40]
    mov eax, dword [esp + eax]
    shl eax, 5
    mov edx, 0x1ecda4
    movsx eax, word [eax + 0x1ecdac]
    mov ecx, edi
    shl eax, 5
    mov ebx, ebp
    add edx, eax
    mov eax, dword [esp + 8]
    add edx, 4
loc_0555:
    call 0x53c50
    movsx edx, word [esp + 0x4c]
    mov eax, dword [esp + 8]
loc_0563:
    call 0x53220
loc_0568:
    inc esi
    cmp esi, 2
    jl near loc_0238
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    movsx eax, word [esp + 0x4c]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x214
    jne near loc_0ece
    db 0x66, 0x8b, 0x1c, 0x6d, 0xc4, 0x5c, 0x24, 0x00    ; mov bx, word [ebp*2 + 0x245cc4]
loc_059a:
    test bx, bx
    jl short loc_05c6
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 1
    jne short loc_05b9
    cmp word [eax + 0x1c0bca], 0x11
    je short loc_05c6
loc_05b9:
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xa4, 0xc8, 0x1b, 0x00    ; mov bx, word [eax*2 + 0x1bc8a4]
    jmp short loc_059a
loc_05c6:
    movsx eax, word [esp + 0x4c]
    imul eax, eax, 0x2c
    mov ecx, dword [esp + 0x50]
    cmp cx, word [eax + 0x1c0bbc]
    jne short loc_062c
    movsx ebx, bx
    mov edx, 0xffffffff
    mov eax, ebx
    call 0x53f00
    test al, al
    je short loc_0603
    mov edx, 1
    mov eax, ebx
    call 0x53f00
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_0603:
    mov edx, 1
    mov eax, ebx
    call 0x53f00
    test al, al
    je near loc_0ece
    mov edx, 0xffffffff
    mov eax, ebx
    call 0x53f00
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_062c:
    movsx eax, bx
    imul ebx, eax, 0x2c
    mov edx, dword [edi + 8]
    cmp edx, dword [ebx + 0x1c0bac]
    jle short loc_0650
    mov edx, 0xffffffff
    call 0x53f00
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_0650:
    mov edx, 1
    call 0x53f00
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    lea eax, [edi + 8]
    mov dword [esp + 0x20], eax
    call 0x53c20
    cwde
    cmp eax, -1
    jne near loc_0ece
    movsx ebp, word [esp + 0x50]
    mov ecx, 1
    mov edx, dword [edi + 8]
    mov ebx, ecx
    mov eax, ebp
    call 0x6ad85
    cwde
    cmp eax, -1
    jne short loc_06bb
    mov ebx, 1
    mov ecx, eax
    mov edx, dword [edi + 8]
    mov eax, ebp
    call 0x6ad85
    movsx edx, ax
    cmp edx, -1
    je near loc_0ece
    lea eax, [edx*4]
    jmp short loc_06c4
loc_06bb:
    mov edx, eax
    lea eax, [eax*4]
loc_06c4:
    add eax, edx
    movsx ecx, word [edi + 0x26]
    mov edx, dword [esp + 0x20]
    mov ebx, dword [eax*8 + 0x2385ac]
    mov eax, ebp
    call 0x53c50
    movsx edx, word [esp + 0x4c]
    movsx eax, word [esp + 0x50]
    call 0x53220
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    lea eax, [edi + 8]
    call 0x53c20
    cwde
    cmp eax, -1
    jne near loc_0ece
    movsx esi, word [esp + 0x50]
    mov ebx, 1
    mov ecx, eax
    mov edx, dword [edi + 8]
    mov eax, esi
    call 0x6ad85
    mov ebx, eax
    cwde
    cmp eax, -1
    jne short loc_0737
    mov ecx, 1
    mov eax, esi
    mov edx, dword [edi + 8]
    mov ebx, ecx
    call 0x6ad85
    mov ebx, eax
loc_0737:
    movsx eax, bx
    cmp eax, -1
    je near loc_0ece
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    mov ebp, dword [edi + 4]
    mov esi, dword [eax*8 + 0x2385ac]
    movsx eax, word [edi + 0x26]
    lea edx, [edi + 8]
    mov dword [esp + 0x28], eax
    mov eax, dword [edi + 8]
    mov ebx, esi
    sub ebp, eax
    movsx eax, word [esp + 0x50]
    mov ecx, dword [esp + 0x28]
    mov dword [esp + 8], eax
    call 0x53c50
    mov ecx, dword [esp + 0x28]
    mov eax, dword [esp + 8]
    lea edx, [edi + 4]
    lea ebx, [esi + ebp]
    call 0x53c50
    movsx edx, word [esp + 0x4c]
    mov eax, dword [esp + 8]
    call 0x53220
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    movsx eax, word [edi + 0x22]
    test ah, 0x80
    je short loc_07d4
    mov ecx, 1
    mov eax, ebp
    mov edx, dword [edi + 4]
    mov ebx, ecx
    call 0x6ad85
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    mov esi, dword [eax*8 + 0x2385ac]
    jmp short loc_07f7
loc_07d4:
    mov ecx, 0xffffffff
    mov eax, ebp
    mov edx, dword [edi + 4]
    mov ebx, ecx
    call 0x6ad85
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    mov esi, dword [eax*8 + 0x2385a8]
loc_07f7:
    mov bx, word [0x2454c8]
loc_07fe:
    test bx, bx
    jl near loc_087a
    movsx edx, bx
    imul eax, edx, 0x2c
    cmp word [eax + 0x1c0bca], 0x16
    jne short loc_086d
    mov cx, word [eax + 0x1c0bcc]
    cmp cx, word [edi + 0x24]
    jne short loc_086d
    movsx ebp, word [eax + 0x1c0bbc]
    lea eax, [ebp*4]
    add eax, ebp
    mov cx, word [eax*8 + 0x2385ca]
    neg ecx
    mov word [eax*8 + 0x2385ca], cx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx ebp, word [esp + 0x50]
    mov dword [eax + 0x4ea07], ebp
    mov dword [eax + 0x4ea0b], 1
loc_086d:
    movsx ebx, bx
    db 0x66, 0x8b, 0x1c, 0x5d, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [ebx*2 + 0x1af7a4]
    jmp short loc_07fe
loc_087a:
    xor byte [edi + 0x23], 0x80
    lea edx, [edi + 4]
    movsx ecx, word [edi + 0x26]
    movsx edi, word [esp + 0x50]
    mov ebx, esi
    mov eax, edi
    call 0x53c50
    movsx edx, word [esp + 0x4c]
    mov eax, edi
    call 0x53220
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_08a8:
    movsx ebx, bx
    db 0x66, 0x8b, 0x1c, 0x5d, 0xa4, 0xc8, 0x1b, 0x00    ; mov bx, word [ebx*2 + 0x1bc8a4]
    jmp short loc_08e9
loc_08b5:
    movsx eax, word [esp + 0x50]
    mov ecx, 0xffffffff
    mov edx, dword [edi + 4]
    mov ebx, ecx
    call 0x6ad85
    mov esi, eax
    test eax, eax
    jge short loc_091b
    or byte [edi + 0x23], 0x80
    movsx eax, word [edi + 0x22]
    test ah, 0x80
    je short loc_08b5
    movsx eax, word [esp + 0x50]
    db 0x66, 0x8b, 0x1c, 0x45, 0xc4, 0x5c, 0x24, 0x00    ; mov bx, word [eax*2 + 0x245cc4]
loc_08e9:
    test bx, bx
    jl short loc_090e
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bbe], 3
    jne short loc_08a8
    cmp word [eax + 0x1c0bca], 9
    jne short loc_08a8
    mov esi, dword [eax + 0x1c0bac]
loc_090e:
    movsx eax, bx
    cmp eax, -1
    jne short loc_092b
    mov esi, dword [edi + 8]
    jmp short loc_092b
loc_091b:
    lea eax, [eax*4]
    add eax, esi
    mov esi, dword [eax*8 + 0x2385a8]
loc_092b:
    mov al, byte [edi + 0x23]
    lea edx, [edi + 4]
    xor al, 0x80
    movsx ecx, word [edi + 0x26]
    mov byte [edi + 0x23], al
    movsx edi, word [esp + 0x50]
    mov ebx, esi
    mov eax, edi
    call 0x53c50
    movsx edx, word [esp + 0x4c]
    mov eax, edi
    call 0x53220
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    lea eax, [edi + 8]
    call 0x53c20
    mov esi, eax
    test ax, ax
    jl short loc_09c8
    mov eax, dword [ebp*4 + 0x4e8d8]
    mov ecx, dword [edi + 4]
    cmp eax, ecx
    jne short loc_09b5
    mov edx, ecx
    mov ecx, 1
    mov eax, ebp
    mov ebx, ecx
    call 0x6ad85
    mov edx, eax
    lea eax, [eax*4]
    add edx, eax
    lea edx, [edx*8]
    movsx eax, si
    mov edx, dword [edx + 0x2385ac]
    mov dword [eax*4 + 0x4e8d8], edx
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_09b5:
    movsx edx, si
    mov dword [edx*4 + 0x4e8d8], ecx
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_09c8:
    mov eax, dword [edi + 4]
    cmp eax, dword [edi + 8]
    jne short loc_09f5
    mov ecx, 1
    mov eax, ebp
    mov edx, dword [edi + 4]
    mov ebx, ecx
    call 0x6ad85
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    mov esi, dword [eax*8 + 0x2385ac]
    jmp short loc_09f7
loc_09f5:
    mov esi, eax
loc_09f7:
    xor byte [edi + 0x23], 0x80
    lea edx, [edi + 8]
    movsx ecx, word [edi + 0x26]
    movsx edi, word [esp + 0x50]
    mov ebx, esi
    mov eax, edi
    call 0x53c50
    test eax, eax
    jl near loc_0ece
    movsx edx, word [esp + 0x4c]
    mov eax, edi
    call 0x53220
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    lea esi, [edi + 4]
    lea edx, [edi + 8]
    movsx eax, word [edi + 0x22]
    mov dword [esp + 0x18], edx
    test ah, 0x80
    je short loc_0a6b
    mov eax, dword [edi + 4]
    add eax, dword [edi + 8]
    movsx ecx, word [edi + 0x26]
    sar eax, 1
    mov edx, dword [esp + 0x18]
    mov dword [esp + 0x28], eax
    mov ebx, eax
    mov eax, ebp
    call 0x53c50
    mov ebx, dword [esp + 0x28]
    mov edx, esi
    mov eax, ebp
    movsx ecx, word [edi + 0x26]
    jmp short loc_0ad4
loc_0a6b:
    mov ecx, 1
    mov eax, ebp
    mov edx, dword [edi + 8]
    mov ebx, ecx
    call 0x6ad85
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    movsx ecx, word [edi + 0x26]
    mov eax, dword [eax*8 + 0x2385ac]
    mov edx, dword [esp + 0x18]
    mov dword [esp + 0x28], eax
    mov ebx, eax
    mov eax, ebp
    call 0x53c50
    mov ecx, 0xffffffff
    mov eax, ebp
    mov edx, dword [edi + 4]
    mov ebx, ecx
    call 0x6ad85
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    movsx ecx, word [edi + 0x26]
    mov eax, dword [eax*8 + 0x2385a8]
    mov edx, esi
    mov dword [esp + 0x28], eax
    mov ebx, eax
    mov eax, ebp
loc_0ad4:
    call 0x53c50
    mov bh, byte [edi + 0x23]
    movsx edx, word [esp + 0x4c]
    xor bh, 0x80
    movsx eax, word [esp + 0x50]
    mov byte [edi + 0x23], bh
    call 0x53220
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    mov esi, 0xffffffff
    xor ecx, ecx
    mov bx, word [0x2454c8]
    mov dword [esp + 0x28], ecx
    mov ecx, dword [esp + 0x50]
loc_0b10:
    test bx, bx
    jl short loc_0b5a
    movsx edi, bx
    imul eax, edi, 0x2c
    cmp word [eax + 0x1c0bca], 0xb
    jne short loc_0b4d
    cmp cx, word [eax + 0x1c0bbc]
    jne short loc_0b4d
    lea eax, [edi*8]
    add eax, edi
    lea eax, [eax*8]
    sub eax, edi
    cmp dword [eax + 0x4ea17], 0
    jne short loc_0b4d
    mov esi, edi
    jmp short loc_0b5a
loc_0b4d:
    movsx ebx, bx
    db 0x66, 0x8b, 0x1c, 0x5d, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [ebx*2 + 0x1af7a4]
    jmp short loc_0b10
loc_0b5a:
    movsx eax, bx
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x1c0bbc]
    lea eax, [edx*4]
    add eax, edx
    movsx ebp, word [eax*8 + 0x2385c6]
    and ebp, 0x8000
    test esi, esi
    jl near loc_0ece
    mov bx, word [0x2454c8]
loc_0b8d:
    test bx, bx
    jl near loc_0ece
    movsx eax, bx
    mov dword [esp + 0x38], eax
    imul edi, eax, 0x2c
    movsx edx, word [edi + 0x1c0bbc]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    movsx eax, word [edx + 0x2385c6]
    mov dword [esp + 0x34], eax
    and eax, 0x8000
    cmp ebp, eax
    jne near loc_0c6e
    cmp word [edi + 0x1c0bca], 0xb
    jne near loc_0c6e
    imul eax, esi, 0x2c
    mov cx, word [edi + 0x1c0bcc]
    cmp cx, word [eax + 0x1c0bcc]
    jne near loc_0c6e
    mov edi, dword [esp + 0x38]
    lea eax, [edi*8]
    add eax, edi
    lea eax, [eax*8]
    sub eax, edi
    cmp dword [eax + 0x4ea17], 0
    jne short loc_0c6e
    test byte [esp + 0x35], 0x80
    je short loc_0c23
    and byte [edx + 0x2385c7], 0x7f
    jmp short loc_0c2a
loc_0c23:
    or byte [edx + 0x2385c7], 0x80
loc_0c2a:
    movsx edx, bx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edi, dword [eax + 0x4ea13]
    neg edi
    mov ecx, 1
    mov dword [eax + 0x4ea13], edi
    mov edi, dword [esp + 0x28]
    mov dword [eax + 0x4ea17], ecx
    test edi, edi
    jne short loc_0c6e
    movsx eax, word [esp + 0x50]
    call 0x53220
    mov dword [esp + 0x28], ecx
loc_0c6e:
    movsx ebx, bx
    db 0x66, 0x8b, 0x1c, 0x5d, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [ebx*2 + 0x1af7a4]
    jmp near loc_0b8d
    mov ecx, dword [esp + 0x50]
    movsx esi, word [0x2454c8]
loc_0c89:
    test esi, esi
    jl short loc_0cad
    imul eax, esi, 0x2c
    cmp word [eax + 0x1c0bca], 0xf
    jne short loc_0ca3
    cmp cx, word [eax + 0x1c0bbc]
    je short loc_0cad
loc_0ca3:
    db 0x0f, 0xbf, 0x34, 0x75, 0xa4, 0xf7, 0x1a, 0x00    ; movsx esi, word [esi*2 + 0x1af7a4]
    jmp short loc_0c89
loc_0cad:
    test esi, esi
    jl near loc_0ece
    mov bx, word [0x2454c8]
loc_0cbc:
    test bx, bx
    jl near loc_0ece
    movsx edx, bx
    imul edi, edx, 0x2c
    imul eax, esi, 0x2c
    mov cx, word [edi + 0x1c0bcc]
    cmp cx, word [eax + 0x1c0bcc]
    jne near loc_0d97
    cmp word [edi + 0x1c0bca], 0xf
    jne near loc_0d97
    movsx ebp, word [edi + 0x1c0bbc]
    lea eax, [ebp*4]
    add eax, ebp
    xor byte [eax*8 + 0x2385c7], 0x80
    lea eax, [edx*8]
    add eax, edx
    mov ch, byte [edi + 0x1c0bc1]
    lea eax, [eax*8]
    add ch, 4
    sub eax, edx
    mov byte [edi + 0x1c0bc1], ch
    cmp dword [eax + 0x4ea17], 0
    je short loc_0d3e
    movsx eax, word [edi + 0x1c0bbc]
    call 0x53220
loc_0d3e:
    movsx edi, bx
    imul ebp, edi, 0x2c
    mov edx, edi
    movsx eax, word [ebp + 0x1c0bbc]
    call 0x53220
    movsx edx, word [ebp + 0x1c0bbc]
    lea eax, [edx*4]
    add eax, edx
    movsx edx, word [eax*8 + 0x2385c6]
    lea eax, [edi*8]
    add eax, edi
    lea eax, [eax*8]
    sub eax, edi
    test dh, 0x80
    je short loc_0d8d
    mov dword [eax + 0x4ea17], 1
    jmp short loc_0d97
loc_0d8d:
    mov dword [eax + 0x4ea17], 2
loc_0d97:
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [eax*2 + 0x1af7a4]
    jmp near loc_0cbc
    movsx esi, word [0x2454c8]
loc_0dae:
    test esi, esi
    jl near loc_0ece
    imul eax, esi, 0x2c
    mov dx, word [eax + 0x1c0bca]
    xor dh, dh
    cmp dx, 0x14
    jne short loc_0e2e
    mov edx, dword [esp + 0x50]
    cmp dx, word [eax + 0x1c0bbc]
    jne short loc_0e2e
    movsx edx, dx
    lea eax, [edx*4]
    add eax, edx
    xor byte [eax*8 + 0x2385c7], 0x80
    movsx edx, word [eax*8 + 0x2385c6]
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    test dh, 0x80
    sete dl
    and edx, 0xff
    inc edx
    mov dword [eax + 0x4ea07], edx
loc_0e16:
    movsx edx, word [esp + 0x4c]
    movsx eax, word [esp + 0x50]
    call 0x53220
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_0e2e:
    db 0x0f, 0xbf, 0x34, 0x75, 0xa4, 0xf7, 0x1a, 0x00    ; movsx esi, word [esi*2 + 0x1af7a4]
    jmp near loc_0dae
    db 0x0f, 0xbf, 0x34, 0x6d, 0xc4, 0x5c, 0x24, 0x00    ; movsx esi, word [ebp*2 + 0x245cc4]
loc_0e43:
    test esi, esi
    jl short loc_0e6d
    imul eax, esi, 0x2c
    cmp word [eax + 0x1c0bbe], 3
    jne short loc_0e63
    mov ax, word [eax + 0x1c0bca]
    xor ah, ah
    db 0x66, 0x3d, 0x15, 0x00    ; cmp ax, 0x15
    je short loc_0e6d
loc_0e63:
    db 0x0f, 0xbf, 0x34, 0x75, 0xa4, 0xc8, 0x1b, 0x00    ; movsx esi, word [esi*2 + 0x1bc8a4]
    jmp short loc_0e43
loc_0e6d:
    imul esi, esi, 0x2c
    movsx ebp, word [0x2454c8]
    movsx esi, word [esi + 0x1c0bcc]
loc_0e7e:
    test ebp, ebp
    jl short loc_0e16
    imul ebx, ebp, 0x2c
    mov ax, word [ebx + 0x1c0bca]
    xor ah, ah
    db 0x66, 0x3d, 0x15, 0x00    ; cmp ax, 0x15
    jne short loc_0ec4
    lea eax, [ebp*8]
    add eax, ebp
    lea eax, [eax*8]
    sub eax, ebp
    cmp dword [eax + 0x4ea07], 0
    jne short loc_0ec4
    movsx edx, word [ebx + 0x1c0bcc]
    cmp edx, esi
    jne short loc_0ec4
    mov dword [eax + 0x4ea07], 1
loc_0ec4:
    db 0x0f, 0xbf, 0x2c, 0x6d, 0xa4, 0xf7, 0x1a, 0x00    ; movsx ebp, word [ebp*2 + 0x1af7a4]
    jmp short loc_0e7e
loc_0ece:
    add esp, 0x54
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
loc_0ee4:
    push ebx
    push ecx
    push edx
    push esi
    mov esi, eax
    mov dx, word [0x2454d8]
loc_0ef1:
    test dx, dx
    jl near 0x53ef0
    movsx ebx, dx
    db 0x66, 0x8b, 0x0c, 0x5d, 0xa4, 0xf7, 0x1a, 0x00    ; mov cx, word [ebx*2 + 0x1af7a4]
    imul ebx, ebx, 0x2c
    cmp si, word [ebx + 0x1c0bca]
    jne short loc_0f61
    mov ax, word [ebx + 0x1c0bb2]
    db 0x66, 0x3d, 0x09, 0x00    ; cmp ax, 9
    jne short loc_0f61
    movsx eax, word [ebx + 0x1c0bcc]
    call 0x12da0
    test ax, ax
    je short loc_0f38
    cmp dword [0xe97ab], 0
    jne short loc_0f61
loc_0f38:
    movsx ebx, dx
    mov edx, 0x65e
    mov eax, ebx
    call 0x19320
    cwde
    imul eax, eax, 0x2c
    imul ebx, ebx, 0x2c
    sub dword [eax + 0x1c0bac], 0x2000
    mov word [ebx + 0x1c0bce], 0x36
loc_0f61:
    mov edx, ecx
    jmp short loc_0ef1
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_0f74:
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 8
    mov edi, eax
    mov dword [esp + 4], edx
    mov cx, word [0xe8cd0]
    jmp near loc_1021
loc_0f8e:
    movsx edx, cx
    lea eax, [edx*4]
    sub eax, edx
    mov esi, 0xcdd00
    lea eax, [eax*4]
    add esi, eax
    cmp di, word [esi + 8]
    jne short loc_1021
    cmp word [esi + 0xa], 0
    sete al
    xor ah, ah
    movsx edx, word [esi]
    mov word [esi + 0xa], ax
    lea eax, [edx*4]
    add eax, edx
    mov dl, byte [esi + 6]
    mov byte [eax*8 + 0x2385b8], dl
    mov bl, dl
    movsx edx, word [esi]
    lea eax, [edx*4]
    add eax, edx
    mov byte [eax*8 + 0x2385c0], bl
    movsx edx, word [esi]
    lea ebx, [edx*4]
    add ebx, edx
    lea ebx, [ebx*8]
    movsx eax, word [ebx + 0x2385a4]
    shl eax, 5
    mov bx, word [ebx + 0x2385a6]
    add eax, 0x1ecda4
    jmp short loc_101c
loc_1012:
    add eax, 0x20
    mov dl, byte [esi + 6]
    dec ebx
    mov byte [eax - 0xc], dl
loc_101c:
    test bx, bx
    jg short loc_1012
loc_1021:
    dec ecx
    test cx, cx
    jge near loc_0f8e
    mov edx, 0xffffffff
    mov cx, word [0x2454d2]
    mov dword [esp], edx
loc_103a:
    test cx, cx
    jl near loc_12ad
    movsx edx, cx
    imul eax, edx, 0x2c
    cmp di, word [eax + 0x1c0bca]
    jne near loc_129d
    cmp word [eax + 0x1c0bb2], 4
    jne near loc_112c
    movsx edx, word [eax + 0x1c0bbc]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov dl, byte [eax + 0x2385c7]
    test dl, 0x40
    je short loc_1093
    mov bl, dl
    and bl, 0xbf
    mov byte [eax + 0x2385c7], bl
    jmp short loc_109e
loc_1093:
    mov dh, dl
    or dh, 0x40
    mov byte [eax + 0x2385c7], dh
loc_109e:
    mov esi, dword [esp + 4]
    test si, si
    jl near loc_129d
    movsx eax, cx
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x1c0bbc]
    lea eax, [edx*4]
    add eax, edx
    test byte [eax*8 + 0x2385c7], 0x40
    je short loc_10f6
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    add edx, eax
    mov eax, 4
    call 0x15e90
    jmp near loc_129d
loc_10f6:
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    add edx, eax
    mov eax, 8
    call 0x15e90
    movsx ecx, cx
    db 0x66, 0x8b, 0x0c, 0x4d, 0xa4, 0xf7, 0x1a, 0x00    ; mov cx, word [ecx*2 + 0x1af7a4]
    jmp near loc_103a
loc_112c:
    mov bx, word [eax + 0x1c0bcc]
    cmp bx, 1
    jb short loc_11a1
    add edx, edx
    cmp bx, 1
    jbe short loc_1149
    cmp bx, 2
    je short loc_1175
    jmp short loc_11a1
loc_1149:
    movsx esi, word [eax + 0x1c0bbc]
    lea eax, [esi*4]
    add eax, esi
    mov ebx, dword [eax*8 + 0x2385ac]
    cmp ebx, dword [eax*8 + 0x2385a8]
    je short loc_11a1
    mov cx, word [edx + 0x1af7a4]
    jmp near loc_103a
loc_1175:
    movsx esi, word [eax + 0x1c0bbc]
    lea eax, [esi*4]
    add eax, esi
    mov ebx, dword [eax*8 + 0x2385ac]
    cmp ebx, dword [eax*8 + 0x2385a8]
    jne short loc_11a1
    mov cx, word [edx + 0x1af7a4]
    jmp near loc_103a
loc_11a1:
    movsx eax, cx
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x1c0bbc]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385c6], 3
    jge near loc_1252
    db 0x66, 0x8b, 0x1c, 0x55, 0xc4, 0x5c, 0x24, 0x00    ; mov bx, word [edx*2 + 0x245cc4]
loc_11ce:
    test bx, bx
    jl near loc_1252
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bbe], 3
    jne short loc_1242
    mov ax, word [eax + 0x1c0bca]
    db 0x66, 0x3d, 0x1f, 0x00    ; cmp ax, 0x1f
    jb short loc_1202
    db 0x66, 0x3d, 0x20, 0x00    ; cmp ax, 0x20
    jbe short loc_1208
    db 0x66, 0x3d, 0x24, 0x00    ; cmp ax, 0x24
    je short loc_1208
    jmp short loc_1242
loc_1202:
    db 0x66, 0x3d, 0x12, 0x00    ; cmp ax, 0x12
    jne short loc_1242
loc_1208:
    movsx edx, bx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov esi, 1
    mov ebp, dword [eax + 0x4ea07]
    sub esi, ebp
    mov dword [eax + 0x4ea07], esi
    movsx eax, cx
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x1c0bbc]
    call 0x53220
loc_1242:
    movsx ebx, bx
    db 0x66, 0x8b, 0x1c, 0x5d, 0xa4, 0xc8, 0x1b, 0x00    ; mov bx, word [ebx*2 + 0x1bc8a4]
    jmp near loc_11ce
loc_1252:
    movsx eax, word [esp]
    cmp eax, -1
    jne short loc_128b
    movsx edx, cx
    imul ebx, edx, 0x2c
    movsx ebx, word [ebx + 0x1c0bbc]
    lea eax, [ebx*4]
    add eax, ebx
    mov ax, word [eax*8 + 0x2385c6]
    xor ah, ah
    db 0x66, 0x3d, 0x16, 0x00    ; cmp ax, 0x16
    jne short loc_128b
    mov eax, ebx
    call 0x53220
    mov dword [esp], eax
loc_128b:
    movsx edx, cx
    imul eax, edx, 0x2c
    movsx eax, word [eax + 0x1c0bbc]
    call loc_0004
loc_129d:
    movsx ecx, cx
    db 0x66, 0x8b, 0x0c, 0x4d, 0xa4, 0xf7, 0x1a, 0x00    ; mov cx, word [ecx*2 + 0x1af7a4]
    jmp near loc_103a
loc_12ad:
    movsx eax, di
    call loc_0ee4
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
loc_12c4:
    push ebx
    push edx
    mov ebx, eax
    mov dx, word [0x2454ce]
loc_12cf:
    test dx, dx
    jl short loc_130d
    movsx eax, dx
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 8
    jne short loc_1300
    cmp bx, word [eax + 0x1c0bca]
    jne short loc_1300
    cmp word [eax + 0x1c0bc6], 0
    jne short loc_1300
    mov word [eax + 0x1c0bc6], 1
loc_1300:
    movsx edx, dx
    db 0x66, 0x8b, 0x14, 0x55, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [edx*2 + 0x1af7a4]
    jmp short loc_12cf
loc_130d:
    pop edx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
loc_1314:
    push ebx
    push ecx
    push esi
    push edi
    mov esi, eax
    mov edi, edx
    mov dx, word [0xe8cd2]
    test dx, dx
    jge short loc_132d
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_132d:
    movsx ecx, dx
    lea eax, [ecx*4]
    sub eax, ecx
    db 0x66, 0x8b, 0x1c, 0x45, 0x00, 0x31, 0x0c, 0x00    ; mov bx, word [eax*2 + 0xc3100]
    movsx eax, bx
    shl eax, 5
    cmp di, word [eax + 0x1ecdbe]
    je short loc_135c
    movsx eax, di
    cmp eax, -1
    jne near loc_13e6
loc_135c:
    movsx eax, bx
    shl eax, 5
    mov ax, word [eax + 0x1ecdb6]
    cmp ax, 0xe6
    jb near loc_13e6
    jbe short loc_1385
    cmp ax, 0x297
    jb near loc_13e6
    cmp ax, 0x299
    ja short loc_13e6
loc_1385:
    movsx ecx, dx
    lea eax, [ecx*4]
    sub eax, ecx
    xor ecx, ecx
    db 0x89, 0x0c, 0x45, 0x02, 0x31, 0x0c, 0x00    ; mov dword [eax*2 + 0xc3102], ecx
    movsx eax, bx
    shl eax, 5
    cmp word [eax + 0x1ecdb2], 0
    je short loc_13dd
    xor ebx, ebx
    mov word [eax + 0x1ecdb2], bx
    test si, si
    jl short loc_13e6
    movsx ecx, si
    imul ecx, ecx, 0x2c
    cmp word [ecx + 0x1c0bb2], 1
    jne short loc_13e6
    cmp word [ecx + 0x1c0bca], 0x1e
    jne short loc_13e6
    xor ecx, ecx
    mov word [eax + 0x1ecdbe], cx
    jmp short loc_13e6
loc_13dd:
    mov word [eax + 0x1ecdb2], 0x55
loc_13e6:
    dec edx
    test dx, dx
    jge near loc_132d
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x1c
    mov dword [esp + 0x14], eax
    mov dword [esp + 4], edx
    mov byte [esp + 0x18], bl
    test edx, edx
    jl near loc_21be
    mov edi, 1
    xor esi, esi
    cmp bl, 1
    jne short loc_146b
    imul eax, edx, 0x2c
    mov dx, word [eax + 0x1c0bca]
    mov dword [esp + 0xc], edx
    test dx, dx
    je near loc_21be
    mov dx, word [eax + 0x1c0bcc]
    mov dword [esp + 0x10], edx
    mov edx, dword [eax + 0x1c0ba4]
    mov ebp, dword [eax + 0x1c0ba8]
    mov dword [esp], edx
    mov dx, word [eax + 0x1c0bb2]
    mov bl, byte [eax + 0x1c0bb5]
    jmp short loc_14ab
loc_146b:
    mov eax, edx
    shl eax, 5
    mov dx, word [eax + 0x1ecdbe]
    mov dword [esp + 0xc], edx
    test dx, dx
    je near loc_21be
    mov dx, word [eax + 0x1ecdc0]
    mov dword [esp + 0x10], edx
    mov edx, dword [eax + 0x1ecda4]
    mov ebp, dword [eax + 0x1ecda8]
    mov dword [esp], edx
    mov dx, word [eax + 0x1ecdb4]
    mov bl, byte [eax + 0x1ecdb9]
loc_14ab:
    mov dword [esp + 8], edx
    mov ecx, dword [esp + 8]
    cmp cx, 0xa8
    jb near loc_15ee
    cmp cx, 0xa9
    jbe near loc_172e
    cmp cx, 0x35c
    jb short loc_1523
    cmp cx, 0x361
    jbe near loc_172e
    cmp cx, 0x462
    jb short loc_1508
    cmp cx, 0x463
    jbe near loc_172e
    cmp cx, 0x476
    jb near loc_1544
    cmp cx, 0x477
    jbe near loc_1556
    jmp near loc_1544
loc_1508:
    cmp cx, 0x457
    jb near loc_1544
    cmp cx, 0x458
    jbe near loc_172e
    jmp near loc_1544
loc_1523:
    cmp cx, 0xaa
    jbe near loc_164f
    cmp cx, 0x2c8
    jb near loc_1544
    cmp cx, 0x2c9
    jbe near loc_172e
loc_1544:
    movsx eax, word [esp + 8]
    call 0x53540
    test al, al
    je near loc_21c0
loc_1556:
    mov dx, word [0x2454c2]
loc_155d:
    test dx, dx
    jl near loc_19b6
    movsx eax, dx
    imul eax, eax, 0x2c
    mov ebx, dword [esp + 0xc]
    cmp bx, word [eax + 0x1c0bca]
    jne near loc_19a6
    mov ax, word [eax + 0x1c0bb2]
    cmp ax, 0xa7
    jb near loc_17fa
    jbe near loc_18fb
    cmp ax, 0x35f
    jb near loc_178f
    jbe near loc_1999
    cmp ax, 0x458
    jb near loc_1765
    jbe near loc_1999
    cmp ax, 0x463
    jb near loc_174b
    jbe near loc_1999
    cmp ax, 0x476
    jb near loc_19a6
    jbe near loc_18bb
    cmp ax, 0x477
    je near loc_18fb
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp near loc_155d
loc_15ee:
    cmp cx, 0x92
    jb short loc_1627
    cmp cx, 0x95
    jbe near loc_172e
    cmp cx, 0xa4
    jb short loc_1617
    cmp cx, 0xa5
    jbe near loc_172e
    jmp near loc_1556
loc_1617:
    cmp cx, 0xa2
    jb near loc_1544
    jmp near loc_1556
loc_1627:
    cmp cx, 0x82
    jb near loc_1544
    jbe short loc_164f
    cmp cx, 0x84
    jb near loc_1544
    cmp cx, 0x8d
    jbe near loc_172e
    jmp near loc_1544
loc_164f:
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xb522a], 0
    jne near loc_172e
    mov edx, 0xb4f00
    add edx, eax
    test bl, bl
    jne short loc_169a
    test byte [eax + 0xb5236], 1
    je short loc_1693
    mov word [eax + 0xb522a], 1
    jmp short loc_16dd
loc_1693:
    mov eax, 0x46
    jmp short loc_16d8
loc_169a:
    cmp bl, 0x15
    jne short loc_16ba
    test byte [eax + 0xb5236], 2
    je short loc_16b3
    mov word [eax + 0xb522a], 1
    jmp short loc_16dd
loc_16b3:
    mov eax, 0x47
    jmp short loc_16d8
loc_16ba:
    cmp bl, 0x17
    jne short loc_16dd
    test byte [eax + 0xb5236], 4
    je short loc_16d3
    mov word [eax + 0xb522a], 1
    jmp short loc_16dd
loc_16d3:
    mov eax, 0x48
loc_16d8:
    call 0x15e90
loc_16dd:
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xb522a], 1
    jne near loc_21be
    cmp byte [esp + 0x18], 0
    jne short loc_1719
    mov edx, dword [esp + 4]
    mov word [eax + 0xb5230], dx
    jmp near loc_21be
loc_1719:
    mov edx, dword [esp + 4]
    mov word [eax + 0xb5232], dx
    xor al, al
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_172e:
    movsx eax, word [esp + 0xc]
    call 0x53400
    test ax, ax
    je near loc_1556
    xor al, al
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_174b:
    cmp ax, 0x462
    je near loc_197c
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp near loc_155d
loc_1765:
    cmp ax, 0x361
    jb near loc_197c
    jbe near loc_1999
    cmp ax, 0x457
    je near loc_197c
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp near loc_155d
loc_178f:
    cmp ax, 0x2c8
    jb short loc_17d0
    jbe near loc_197c
    cmp ax, 0x35c
    jb short loc_17b6
    jbe near loc_197c
    cmp ax, 0x35d
    jbe near loc_1999
    jmp near loc_197c
loc_17b6:
    cmp ax, 0x2c9
    je near loc_1999
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp near loc_155d
loc_17d0:
    cmp ax, 0xa9
    jb near loc_197c
    jbe near loc_1999
    cmp ax, 0xaa
    je near loc_197c
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp near loc_155d
loc_17fa:
    cmp ax, 0x8b
    jb short loc_1865
    jbe near loc_1999
    cmp ax, 0xa2
    jb short loc_1831
    jbe near loc_18bb
    cmp ax, 0xa4
    jb near loc_18fb
    jbe near loc_197c
    cmp ax, 0xa5
    jbe near loc_1999
    jmp near loc_18bb
loc_1831:
    cmp ax, 0x8d
    jb near loc_197c
    jbe near loc_1999
    cmp ax, 0x92
    jb near loc_19a6
    cmp ax, 0x95
    jbe near loc_193f
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp near loc_155d
loc_1865:
    cmp ax, 0x86
    jb short loc_1890
    jbe near loc_197c
    cmp ax, 0x88
    jb near loc_1999
    jbe near loc_197c
    cmp ax, 0x89
    jbe near loc_1999
    jmp near loc_197c
loc_1890:
    cmp ax, 0x84
    jb short loc_18a1
    jbe near loc_197c
    jmp near loc_1999
loc_18a1:
    cmp ax, 0x82
    je near loc_197c
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp near loc_155d
loc_18bb:
    cmp byte [esp + 0x18], 1
    jne short loc_18d9
    mov ebx, dword [esp + 4]
    movsx eax, dx
    cmp eax, ebx
    jne short loc_18d9
    imul eax, ebx, 0x2c
    inc word [eax + 0x1c0bb2]
    jmp short loc_18ea
loc_18d9:
    movsx eax, dx
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bcc], 0
    jne short loc_18ea
    inc edi
loc_18ea:
    inc esi
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp near loc_155d
loc_18fb:
    cmp byte [esp + 0x18], 1
    jne short loc_1919
    mov ecx, dword [esp + 4]
    movsx eax, dx
    cmp eax, ecx
    jne short loc_1919
    imul eax, ecx, 0x2c
    dec word [eax + 0x1c0bb2]
    jmp short loc_192e
loc_1919:
    movsx eax, dx
    imul eax, eax, 0x2c
    mov bx, word [eax + 0x1c0bcc]
    cmp bx, 1
    jne short loc_192e
    add edi, ebx
loc_192e:
    inc esi
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp near loc_155d
loc_193f:
    movsx eax, dx
    imul eax, eax, 0x2c
    movsx ecx, dx
    imul ecx, ecx, 0x2c
    inc word [eax + 0x1c0bb2]
    cmp word [ecx + 0x1c0bb2], 0x95
    jle short loc_19a6
    movsx eax, dx
    imul eax, eax, 0x2c
    mov word [eax + 0x1c0bb2], 0x92
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp near loc_155d
loc_197c:
    movsx eax, dx
    imul eax, eax, 0x2c
    inc word [eax + 0x1c0bb2]
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp near loc_155d
loc_1999:
    movsx eax, dx
    imul eax, eax, 0x2c
    dec word [eax + 0x1c0bb2]
loc_19a6:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp near loc_155d
loc_19b6:
    xor edx, edx
    jmp near loc_1c08
loc_19bd:
    movsx eax, dx
    mov ecx, dword [esp + 0xc]
    shl eax, 5
    mov ebx, edx
    cmp cx, word [eax + 0x1ecdbe]
    jne near loc_1c07
    mov ax, word [eax + 0x1ecdb4]
    cmp ax, 0xa8
    jb near loc_1aa9
    jbe near loc_1beb
    cmp ax, 0x35f
    jb short loc_1a5e
    jbe near loc_1bfa
    cmp ax, 0x458
    jb short loc_1a3f
    jbe near loc_1bfa
    cmp ax, 0x463
    jb short loc_1a30
    jbe near loc_1bfa
    cmp ax, 0x476
    jb near loc_1c07
    jbe near loc_1b4b
    cmp ax, 0x477
    je near loc_1b83
    jmp near loc_1c07
loc_1a30:
    cmp ax, 0x462
    je near loc_1beb
    jmp near loc_1c07
loc_1a3f:
    cmp ax, 0x361
    jb near loc_1beb
    jbe near loc_1bfa
    cmp ax, 0x457
    je near loc_1beb
    jmp near loc_1c07
loc_1a5e:
    cmp ax, 0x2c9
    jb short loc_1a8a
    jbe near loc_1bfa
    cmp ax, 0x35d
    jb short loc_1a7b
    jbe near loc_1bfa
    jmp near loc_1beb
loc_1a7b:
    cmp ax, 0x35c
    je near loc_1beb
    jmp near loc_1c07
loc_1a8a:
    cmp ax, 0xaa
    jb near loc_1bfa
    jbe near loc_1beb
    cmp ax, 0x2c8
    je near loc_1beb
    jmp near loc_1c07
loc_1aa9:
    cmp ax, 0x8a
    jb short loc_1b0a
    jbe near loc_1beb
    cmp ax, 0xa3
    jb short loc_1ae0
    jbe near loc_1b83
    cmp ax, 0xa5
    jb near loc_1beb
    jbe near loc_1bfa
    cmp ax, 0xa6
    jbe near loc_1b4b
    jmp near loc_1b83
loc_1ae0:
    cmp ax, 0x92
    jb short loc_1afb
    cmp ax, 0x95
    jbe near loc_1bbc
    cmp ax, 0xa2
    je short loc_1b4b
    jmp near loc_1c07
loc_1afb:
    cmp ax, 0x8b
    je near loc_1bfa
    jmp near loc_1c07
loc_1b0a:
    cmp ax, 0x86
    jb short loc_1b2b
    jbe near loc_1beb
    cmp ax, 0x88
    jb near loc_1bfa
    jbe near loc_1beb
    jmp near loc_1bfa
loc_1b2b:
    cmp ax, 0x84
    jb short loc_1b3c
    jbe near loc_1beb
    jmp near loc_1bfa
loc_1b3c:
    cmp ax, 0x82
    je near loc_1beb
    jmp near loc_1c07
loc_1b4b:
    cmp byte [esp + 0x18], 0
    jne short loc_1b6c
    mov ecx, dword [esp + 4]
    movsx eax, dx
    cmp eax, ecx
    jne short loc_1b6c
    movsx eax, bx
    shl eax, 5
    inc word [eax + 0x1ecdb4]
    jmp short loc_1b7d
loc_1b6c:
    movsx eax, bx
    shl eax, 5
    cmp word [eax + 0x1ecdc0], 0
    jne short loc_1b7d
    inc edi
loc_1b7d:
    inc esi
    jmp near loc_1c07
loc_1b83:
    cmp byte [esp + 0x18], 0
    jne short loc_1ba4
    mov ecx, dword [esp + 4]
    movsx eax, dx
    cmp eax, ecx
    jne short loc_1ba4
    movsx eax, bx
    shl eax, 5
    dec word [eax + 0x1ecdb4]
    jmp short loc_1bb9
loc_1ba4:
    movsx eax, bx
    shl eax, 5
    mov bx, word [eax + 0x1ecdc0]
    cmp bx, 1
    jne short loc_1bb9
    add edi, ebx
loc_1bb9:
    inc esi
    jmp short loc_1c07
loc_1bbc:
    movsx eax, dx
    movsx ecx, dx
    shl eax, 5
    shl ecx, 5
    inc word [eax + 0x1ecdb4]
    cmp word [ecx + 0x1ecdb4], 0x95
    jle short loc_1c07
    movsx eax, dx
    shl eax, 5
    mov word [eax + 0x1ecdb4], 0x92
    jmp short loc_1c07
loc_1beb:
    movsx eax, bx
    shl eax, 5
    inc word [eax + 0x1ecdb4]
    jmp short loc_1c07
loc_1bfa:
    movsx eax, bx
    shl eax, 5
    dec word [eax + 0x1ecdb4]
loc_1c07:
    inc edx
loc_1c08:
    cmp dx, word [0x246500]
    jl near loc_19bd
    cmp word [esp + 0xc], -1
    jne near loc_1cae
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xa2, 0x52, 0x0b, 0x00, 0x08    ; mov byte [eax*2 + 0xb52a2], 8
    mov bx, word [0xe92f5]
    test bx, bx
    je short loc_1c64
    movsx eax, bx
    xor ecx, ecx
    mov dword [0xe97e7], eax
    mov dword [0xe97d7], eax
    mov word [0xe92f5], cx
    jmp short loc_1ca4
loc_1c64:
    mov edi, dword [0xe97e7]
    inc edi
    mov ebp, dword [0xe97eb]
    mov dword [0xe97e7], edi
    test ebp, ebp
    je short loc_1c80
    cmp edi, 0xa
    jg short loc_1c92
loc_1c80:
    cmp dword [0xe97eb], 0
    jne short loc_1c9a
    cmp dword [0xe97e7], 5
    jle short loc_1c9a
loc_1c92:
    xor ecx, ecx
    mov dword [0xe97e7], ecx
loc_1c9a:
    mov eax, dword [0xe97e7]
    mov dword [0xe97d7], eax
loc_1ca4:
    mov al, 1
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_1cae:
    mov edx, dword [esp + 8]
    cmp dx, 0xa6
    jb near loc_1d32
    cmp dx, 0xa7
    jbe near loc_1d88
    cmp dx, 0x35c
    jb short loc_1d19
    cmp dx, 0x361
    jbe near loc_1ed8
    cmp dx, 0x462
    jb short loc_1d07
    cmp dx, 0x463
    jbe near loc_1ed8
    cmp dx, 0x476
    jb near loc_1d76
    cmp dx, 0x477
    jbe near loc_1d88
    jmp near loc_1d76
loc_1d07:
    cmp dx, 0x457
    jb near loc_1d76
    cmp dx, 0x458
    jmp short loc_1d70
loc_1d19:
    cmp dx, 0xaa
    jbe near loc_1ed8
    cmp dx, 0x2c8
    jb short loc_1d76
    cmp dx, 0x2c9
    jmp short loc_1d70
loc_1d32:
    cmp dx, 0x92
    jb short loc_1d57
    cmp dx, 0x95
    jbe near loc_1ed8
    cmp dx, 0xa2
    jb short loc_1d76
    cmp dx, 0xa3
    jbe short loc_1d88
    jmp near loc_1ed8
loc_1d57:
    cmp dx, 0x82
    jb short loc_1d76
    jbe near loc_1ed8
    cmp dx, 0x84
    jb short loc_1d76
    cmp dx, 0x8d
loc_1d70:
    jbe near loc_1ed8
loc_1d76:
    movsx eax, word [esp + 8]
    call 0x53540
    test al, al
    je near loc_21be
loc_1d88:
    mov ebx, dword [esp + 8]
    cmp bx, 0xa2
    je short loc_1dba
    cmp bx, 0xa3
    je short loc_1dba
    cmp bx, 0x476
    je short loc_1dba
    cmp bx, 0x477
    je short loc_1dba
    cmp bx, 0xa6
    je short loc_1dba
    cmp bx, 0xa7
    jne near loc_1ed8
loc_1dba:
    mov eax, dword [esp + 8]
    cmp ax, 0x476
    je short loc_1dca
    cmp ax, 0x477
    jne short loc_1e32
loc_1dca:
    cmp byte [esp + 0x18], 1
    jne short loc_1e00
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [esp]
    db 0x8b, 0x0c, 0x45, 0x1c, 0x51, 0x0b, 0x00    ; mov ecx, dword [eax*2 + 0xb511c]
    movsx edx, word [esp + 4]
    push ecx
    mov eax, 0x110
    jmp near loc_1e94
loc_1e00:
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ecx, ebp
    db 0x8b, 0x1c, 0x45, 0x1c, 0x51, 0x0b, 0x00    ; mov ebx, dword [eax*2 + 0xb511c]
    db 0x0f, 0xbf, 0x14, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5240]
    push ebx
    mov eax, 0x110
    mov ebx, dword [esp + 4]
    jmp short loc_1e96
loc_1e32:
    cmp byte [esp + 0x18], 1
    jne short loc_1e67
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [esp]
    mov ecx, ebp
    db 0x8b, 0x14, 0x45, 0x1c, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb511c]
    mov eax, 0x4c
    push edx
    movsx edx, word [esp + 8]
    jmp short loc_1e96
loc_1e67:
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [esp]
    db 0x8b, 0x0c, 0x45, 0x1c, 0x51, 0x0b, 0x00    ; mov ecx, dword [eax*2 + 0xb511c]
    db 0x0f, 0xbf, 0x14, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5240]
    push ecx
    mov eax, 0x4c
loc_1e94:
    mov ecx, ebp
loc_1e96:
    call 0x5a410
    cmp si, di
    jne near loc_21be
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [esp]
    db 0x8b, 0x34, 0x45, 0x1c, 0x51, 0x0b, 0x00    ; mov esi, dword [eax*2 + 0xb511c]
    mov ecx, ebp
    push esi
    db 0x0f, 0xbf, 0x14, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5240]
    mov eax, 0x53
    call 0x5a410
loc_1ed8:
    mov ebx, dword [esp + 8]
    cmp bx, 0x92
    je short loc_1ef8
    cmp bx, 0x93
    je short loc_1ef8
    cmp bx, 0x94
    je short loc_1ef8
    cmp bx, 0x95
    jne short loc_1f0c
loc_1ef8:
    mov eax, dword [esp + 8]
    mov edx, dword [esp + 0xc]
    db 0x81, 0xe8, 0x92, 0x00, 0x00, 0x00    ; sub eax, 0x92
    add edx, eax
    mov dword [esp + 0xc], edx
loc_1f0c:
    mov esi, dword [esp + 0xc]
    mov bx, word [0x2454c8]
loc_1f17:
    test bx, bx
    jl near loc_2066
    movsx ecx, bx
    imul edx, ecx, 0x2c
    cmp si, word [edx + 0x1c0bcc]
    jne near loc_2056
    mov ax, word [edx + 0x1c0bca]
    db 0x66, 0x3d, 0x15, 0x00    ; cmp ax, 0x15
    jb short loc_1f61
    jbe near loc_202c
    db 0x66, 0x3d, 0x18, 0x00    ; cmp ax, 0x18
    jb near loc_2056
    db 0x66, 0x3d, 0x19, 0x00    ; cmp ax, 0x19
    jbe short loc_1fba
    db 0x66, 0x3d, 0x22, 0x00    ; cmp ax, 0x22
    je short loc_1fba
    jmp near loc_2056
loc_1f61:
    db 0x66, 0x3d, 0x0c, 0x00    ; cmp ax, 0xc
    jne near loc_2056
    movsx edx, word [edx + 0x1c0bbc]
    lea eax, [edx*4]
    add eax, edx
    xor dh, dh
    mov byte [eax*8 + 0x2385c1], dh
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov edi, dword [eax + 0x4ea07]
    inc edi
    mov dword [eax + 0x4ea07], edi
    cmp edi, 2
    jne near loc_2056
    lea ecx, [edi + 1]
    mov dword [eax + 0x4ea07], ecx
    jmp near loc_2056
loc_1fba:
    movsx edx, bx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp dword [eax + 0x4ea17], 0
    sete al
    movsx edx, bx
    mov ecx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    and ecx, 0xff
    mov dword [eax + 0x4ea17], ecx
    test ecx, ecx
    je short loc_2025
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    add edx, eax
    mov eax, 0xf
    jmp short loc_2051
loc_2025:
    movsx edx, word [esp + 0x14]
    jmp short loc_2033
loc_202c:
    movsx edx, word [0xe8cc6]
loc_2033:
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    add edx, eax
    mov eax, 2
loc_2051:
    call 0x15e90
loc_2056:
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [eax*2 + 0x1af7a4]
    jmp near loc_1f17
loc_2066:
    movsx ebx, word [esp + 0x14]
    movsx ecx, word [esp + 0xc]
    mov edx, ebx
    mov eax, ecx
    call loc_0f74
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea ebx, [eax + eax]
    mov edx, ecx
    movsx eax, word [ebx + 0xb5240]
    call loc_1314
    mov eax, ecx
    mov ecx, dword [esp + 8]
    call loc_12c4
    cmp cx, 0xa2
    je short loc_20cf
    cmp cx, 0xa3
    je short loc_20cf
    cmp cx, 0x476
    je short loc_20cf
    cmp cx, 0x477
    je short loc_20cf
    cmp cx, 0xa6
    je short loc_20cf
    cmp cx, 0xa7
    jne short loc_20d9
loc_20cf:
    mov al, 1
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_20d9:
    cmp word [esp + 0x10], 0
    jne short loc_2137
    movsx eax, cx
    call 0x53540
    test al, al
    jne short loc_2137
    cmp byte [esp + 0x18], 1
    jne short loc_2114
    mov eax, 0x4c
    mov ecx, ebp
    mov edx, dword [ebx + 0xb511c]
    mov ebx, dword [esp]
    push edx
    movsx edx, word [esp + 8]
    call 0x5a410
    jmp near loc_21b4
loc_2114:
    mov ecx, ebp
    mov eax, dword [ebx + 0xb511c]
    movsx edx, word [ebx + 0xb5240]
    push eax
    mov ebx, dword [esp + 4]
    mov eax, 0x4c
    call 0x5a410
    jmp near loc_21b4
loc_2137:
    mov edi, dword [esp + 0x10]
    test di, di
    je short loc_21b4
    cmp byte [esp + 0x18], 1
    jne short loc_218b
    movsx esi, di
    test byte [esi + 0xe7240], 4
    jne short loc_218b
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [esp]
    db 0x8b, 0x3c, 0x45, 0x1c, 0x51, 0x0b, 0x00    ; mov edi, dword [eax*2 + 0xb511c]
    mov ecx, ebp
    push edi
    movsx edx, word [esp + 8]
    mov eax, esi
    call 0x5a410
    mov al, 1
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_218b:
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5240]
    xor eax, eax
    mov ax, word [esp + 0x10]
    call 0x5aca0
loc_21b4:
    mov al, 1
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_21be:
    xor al, al
loc_21c0:
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push esi
    mov ecx, eax
    mov esi, edx
    cwde
    xor edx, edx
    db 0x66, 0x8b, 0x1c, 0x45, 0xc4, 0x5c, 0x24, 0x00    ; mov bx, word [eax*2 + 0x245cc4]
loc_21e6:
    test bx, bx
    jl short loc_221e
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 2
    jne short loc_2211
    mov edx, 0xffffffff
    movsx eax, word [eax + 0x1c0bca]
    call loc_0f74
    mov edx, 1
loc_2211:
    movsx ebx, bx
    db 0x66, 0x8b, 0x1c, 0x5d, 0xa4, 0xc8, 0x1b, 0x00    ; mov bx, word [ebx*2 + 0x1bc8a4]
    jmp short loc_21e6
loc_221e:
    test dx, dx
    jne short loc_222e
    movsx edx, si
    movsx eax, cx
    call loc_0004
loc_222e:
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
loc_2234:
    push ecx
    push esi
    movsx esi, bx
    mov ecx, esi
    shl ecx, 5
    mov word [ecx + 0x1ecdb4], ax
    movsx ecx, dx
    mov eax, 0x12
    mov edx, ecx
    call 0x5aca0
    mov eax, 0x14
    mov edx, ecx
    mov ebx, 0xa
    call 0x5aca0
    mov edx, esi
    mov eax, ecx
    call 0x26620
    pop esi
    pop ecx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_2274:
    push esi
    push edi
    push ebp
    sub esp, 0xc
    mov dword [esp + 8], eax
    mov dword [esp], edx
    mov edi, ebx
    mov ebp, ecx
    mov ecx, dword [esp + 0x20]
    movsx eax, word [esp]
    mov esi, 0x1ecda4
    shl eax, 5
    mov edx, 0xffffffff
    add esi, eax
    mov dword [esp + 4], edx
    cmp word [esi + 0x12], 0x230
    jne near loc_2318
    cmp cx, 0x4d6
    jb short loc_22d0
    jbe short loc_22e8
    cmp cx, 0x686
    jb short loc_22c7
    jbe short loc_22e8
    cmp cx, 0xa2d
    je short loc_22e8
    jmp short loc_2318
loc_22c7:
    cmp cx, 0x4df
    je short loc_22e8
    jmp short loc_2318
loc_22d0:
    cmp cx, 0x3d5
    jb short loc_22e2
    jbe short loc_22e8
    cmp cx, 0x437
    je short loc_22e8
    jmp short loc_2318
loc_22e2:
    cmp cx, 0x1a
    jne short loc_2318
loc_22e8:
    movsx edx, word [esp]
    movsx edi, word [esp + 8]
    mov ebx, 0x46
    mov eax, edi
    call 0x26620
    mov eax, 0x14
    mov bh, byte [esi + 0xe]
    mov word [esi + 0x12], 0x46
    and bh, 0xef
    mov edx, edi
    mov byte [esi + 0xe], bh
    jmp near loc_2680
loc_2318:
    test byte [esi + 0xe], 0x10
    jne short loc_232a
    cmp word [esi + 0x12], 0xe6
    jne near loc_2637
loc_232a:
    mov dx, word [esi + 0xc]
    test dx, dx
    jl near loc_2637
    movsx edx, dx
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov ebx, dword [esp + 0x1c]
    mov eax, dword [edx + 0x2385ac]
    cmp eax, ebx
    jle near loc_2637
    sub eax, dword [edx + 0x2385a8]
    je near loc_2637
    mov ax, word [esi + 0x12]
    cmp ax, 0x1f7
    jb short loc_239d
    jbe near loc_24fd
    cmp ax, 0x1fe
    jb near loc_2637
    jbe near loc_25c7
    cmp ax, 0x297
    jb near loc_2637
    cmp ax, 0x299
    jbe short loc_23b8
    jmp near loc_2637
loc_239d:
    cmp ax, 0xe6
    jb near loc_2637
    jbe short loc_23be
    cmp ax, 0x197
    je near loc_24a2
    jmp near loc_2637
loc_23b8:
    mov word [esi + 0x1e], 1
loc_23be:
    lea ebx, [esp + 4]
    mov edx, ebp
    mov eax, edi
    call 0x6e997
    mov ebx, dword [esp + 4]
    test bx, bx
    jl near loc_2685
    movsx eax, cx
    cmp eax, -1
    jne short loc_23f4
    push 5
    movsx eax, word [esp + 0xc]
    push eax
    push 0
    push 0
    push 0
    push 8
    push 8
    jmp short loc_2439
loc_23f4:
    cmp cx, 0x9e8
    jne short loc_2427
    push 5
    movsx eax, word [esp + 0xc]
    push eax
    imul eax, eax, 0x2c
    push 0
    push 0
    mov dl, byte [eax + 0x1c0bb9]
    push 0
    add dl, 0x10
    mov al, byte [eax + 0x1c0bb8]
    movsx edx, dl
    add al, 0x10
    push edx
    movsx eax, al
    push eax
    jmp short loc_2439
loc_2427:
    push 5
    movsx eax, word [esp + 0xc]
    push eax
    push 0
    push 0
    push 0
    push 0x20
    push 0x20
loc_2439:
    push -0x7f
    mov ecx, dword [esp + 0x3c]
    mov edx, edi
    push 0x687
    movsx eax, bx
    mov ebx, ebp
    call 0x18f70
    movsx edi, ax
    imul ebp, edi, 0x2c
    or byte [ebp + 0x1c0bb0], 0x92
    movsx edx, word [esi + 8]
    shl edx, 5
    mov eax, dword [esi + 4]
    sub eax, dword [edx + 0x1ecda8]
    mov ecx, dword [edx + 0x1ecda4]
    mov ebx, eax
    mov eax, dword [esi]
    mov edx, ebx
    sub eax, ecx
    call 0x65698
    db 0x81, 0xe8, 0x00, 0x02, 0x00, 0x00    ; sub eax, 0x200
    mov edx, edi
    mov word [ebp + 0x1c0bc0], ax
    mov eax, 0x23
    call 0x5aca0
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    ret 8
loc_24a2:
    mov dl, byte [esi + 0xe]
    mov word [esi + 0x12], 0x19b
    and dl, 0xbe
    mov di, word [esi + 0xa]
    mov byte [esi + 0xe], dl
    test di, di
    jl short loc_24d7
    movsx eax, di
    shl eax, 5
    mov word [eax + 0x1ecdb6], 0x19b
    movsx eax, word [esi + 0xa]
    shl eax, 5
    and byte [eax + 0x1ecdb2], 0xbe
loc_24d7:
    movsx esi, word [esp + 8]
    mov eax, 0x12
    mov edx, esi
    call 0x5aca0
    mov eax, 0x13
    mov edx, esi
    call 0x5aca0
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    ret 8
loc_24fd:
    lea ebx, [esp + 4]
    mov edx, ebp
    mov eax, edi
    call 0x6e997
    cmp word [esp + 4], 0
    jl near loc_2685
    movsx edx, word [esp]
    movsx eax, word [esp + 8]
    mov ebx, 0xa
    mov word [esi + 0x12], 0x1f8
    call 0x26620
    mov dx, word [esi + 0xa]
    mov word [esi + 0xe], 0
    test dx, dx
    jl short loc_254d
    movsx eax, dx
    shl eax, 5
    xor ebx, ebx
    mov word [eax + 0x1ecdb2], bx
loc_254d:
    push 3
    movsx eax, word [esp + 0xc]
    push eax
    push 0
    push 0
    movsx eax, word [0xb5198]
    push eax
    push 0
    push 0
    mov ecx, dword [esp + 0x38]
    push 0
    mov ebx, ebp
    mov edx, edi
    push 1
    movsx eax, word [esp + 0x28]
    call 0x18f70
    movsx edx, ax
    imul eax, edx, 0x2c
    lea esi, [edx*8]
    add esi, edx
    mov ecx, 0x80
    lea esi, [esi*8]
    mov word [eax + 0x1c0bca], cx
    sub esi, edx
    movsx eax, word [esp]
    mov ecx, 5
    mov dword [esi + 0x4ea0f], eax
    mov eax, 0x13
    mov dword [esi + 0x4ea0b], ecx
    call 0x5aca0
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    ret 8
loc_25c7:
    lea ebx, [esp + 4]
    mov edx, ebp
    mov eax, edi
    call 0x6e997
    cmp word [esp + 4], 0
    jl near loc_2685
    movsx edx, word [esp]
    movsx eax, word [esp + 8]
    mov ebx, 0x50
    call 0x26a80
    mov cx, word [esi + 0xa]
    mov word [esi + 0xe], 0
    test cx, cx
    jl short loc_2611
    movsx eax, cx
    shl eax, 5
    xor esi, esi
    mov word [eax + 0x1ecdb2], si
loc_2611:
    movsx esi, word [esp + 8]
    mov eax, 0x12
    mov edx, esi
    call 0x5aca0
    mov eax, 0x13
    mov edx, esi
    call 0x5aca0
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    ret 8
loc_2637:
    mov ax, word [esi + 0x10]
    cmp ax, 0x509
    jae short loc_2685
    cmp ax, 0x131
    jb short loc_2685
    jbe short loc_2685
    cmp ax, 0x326
    jb short loc_2685
    jbe short loc_2685
    cmp ax, 0x4bc
    jb short loc_2685
    jbe short loc_265f
    cmp ax, 0x4bf
    jne short loc_2685
loc_265f:
    movsx ebx, word [esp]
    mov ax, word [esi + 0x10]
    movsx edi, word [esp + 8]
    db 0x05, 0x02, 0x00, 0x00, 0x00    ; add eax, 2
    mov edx, edi
    cwde
    call loc_2234
    mov eax, 0x12
    mov edx, edi
loc_2680:
    call 0x5aca0
loc_2685:
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    ret 8
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    mov ebx, eax
    movsx eax, dx
    and eax, 0xc000
    cmp eax, 0xc000
    jne short loc_2722
    and dh, 0xf
    movsx eax, dx
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x1c0bb2]
    cmp ax, 0x38f
    jne near loc_28db
    cmp word [ebx + 0x320], 8
    jge near loc_28db
    movsx eax, word [ebx + 0x340]
    imul eax, eax, 0x2c
    sub word [eax + 0x1c0bce], 5
    mov word [ebx + 0x320], 0x10
    mov dword [ebx + 0x274], 0x20
    mov byte [ebx + 0x3f0], 0x20
    mov byte [ebx + 0x3f1], 0
    mov eax, 0xd3
    movsx edx, word [ebx + 0x340]
    mov byte [ebx + 0x3f2], 0
    call 0x5aca0
    jmp near loc_28db
loc_2722:
    cmp eax, 0x8000
    jne near loc_28db
    mov cx, word [ebx + 0x320]
    and dh, 0x1f
    test cx, cx
    jle short loc_274c
    mov eax, ecx
    dec eax
    mov word [ebx + 0x320], ax
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_274c:
    movsx esi, dx
    mov edx, esi
    shl edx, 5
    test byte [edx + 0x1ecdb2], 0x55
    je near loc_28db
    mov dx, word [edx + 0x1ecdb6]
    cmp dx, 0xe6
    jb near loc_28db
    jbe near loc_2877
    cmp dx, 0x297
    jb near loc_28db
    cmp dx, 0x299
    ja near loc_28db
    movsx eax, word [ebx + 0x340]
    imul eax, eax, 0x2c
    sub word [eax + 0x1c0bce], 5
    mov word [ebx + 0x320], 0x10
    mov dword [ebx + 0x274], 0x20
    movsx eax, word [ebx + 0x298]
    mov byte [ebx + 0x3f0], 0x20
    add eax, 0x200
    mov byte [ebx + 0x3f1], 0
    and eax, 0x7ff
    mov byte [ebx + 0x3f2], 0
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    shl eax, 8
    mov dword [ebx + 0x24c], eax
    mov edx, eax
    mov ax, word [ebx + 0x298]
    and ah, 7
    neg edx
    cwde
    mov dword [ebx + 0x24c], edx
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    shl eax, 8
    movsx edx, word [ebx + 0x340]
    mov ecx, eax
    mov dword [ebx + 0x250], eax
    neg ecx
    mov eax, 0xd3
    mov dword [ebx + 0x250], ecx
    call 0x5aca0
    mov ax, word [ebx + 0x298]
    and ah, 7
    cwde
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov ecx, dword [ebx + 0x218]
    sar eax, 9
    add ecx, eax
    movsx eax, word [ebx + 0x298]
    add eax, 0x200
    and eax, 0x7ff
    push -1
    mov edi, dword [ebx + 0x21c]
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov edx, dword [ebx + 0x214]
    sar eax, 9
    push edi
    jmp short loc_28c9
loc_2877:
    mov ax, word [ebx + 0x298]
    and ah, 7
    cwde
    mov word [ebx + 0x320], 0x1a
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov ecx, dword [ebx + 0x218]
    sar eax, 9
    add ecx, eax
    movsx eax, word [ebx + 0x298]
    add eax, 0x200
    and eax, 0x7ff
    push -1
    mov ebp, dword [ebx + 0x21c]
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov edx, dword [ebx + 0x214]
    sar eax, 9
    push ebp
loc_28c9:
    add edx, eax
    movsx eax, word [ebx + 0x340]
    mov ebx, edx
    mov edx, esi
    call loc_2274
loc_28db:
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 4
    mov dword [esp], eax
    movsx edx, ax
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + 0x2385b4]
    db 0x66, 0x3d, 0x7c, 0x00    ; cmp ax, 0x7c
    jb short loc_2929
    jbe short loc_293f
    cmp ax, 0x2bf
    jb short loc_291e
    jbe short loc_293f
    cmp ax, 0x2c1
    je short loc_293f
    jmp near loc_2bb2
loc_291e:
    cmp ax, 0x2bd
    je short loc_293f
    jmp near loc_2bb2
loc_2929:
    db 0x66, 0x3d, 0x78, 0x00    ; cmp ax, 0x78
    jb near loc_2bb2
    jbe short loc_293f
    db 0x66, 0x3d, 0x7a, 0x00    ; cmp ax, 0x7a
    jne near loc_2bb2
loc_293f:
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    movsx ecx, word [esp]
    sub eax, edx
    mov ebx, 0xa
    mov edx, ecx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    call 0x26950
    movsx edx, word [0xe8cc6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5240]
    mov eax, 0x13
    call 0x5aca0
    lea eax, [ecx*4]
    add eax, ecx
    lea eax, [eax*8]
    cmp word [eax + 0x2385b4], 0x2bf
    jne short loc_29bb
    mov word [eax + 0x2385b4], 0x2c0
loc_29bb:
    movsx edx, word [esp]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    cmp word [eax + 0x2385b4], 0x2c1
    jne short loc_29e3
    mov word [eax + 0x2385b4], 0x2c2
loc_29e3:
    movsx edx, word [esp]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    cmp word [eax + 0x2385b4], 0x2bd
    jne short loc_2a0b
    mov word [eax + 0x2385b4], 0x2be
loc_2a0b:
    movsx edx, word [esp]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    cmp word [eax + 0x2385b4], 0x7c
    jne short loc_2a32
    mov word [eax + 0x2385b4], 0x7d
loc_2a32:
    movsx edx, word [esp]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    cmp word [eax + 0x2385b4], 0x78
    jne short loc_2a59
    mov word [eax + 0x2385b4], 0x79
loc_2a59:
    movsx edx, word [esp]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    cmp word [eax + 0x2385b4], 0x7a
    jne short loc_2a80
    mov word [eax + 0x2385b4], 0x7b
loc_2a80:
    movsx edx, word [esp]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385c8], 0
    jne near loc_2b28
    db 0x66, 0x8b, 0x14, 0x55, 0xc4, 0x5c, 0x24, 0x00    ; mov dx, word [edx*2 + 0x245cc4]
loc_2aa4:
    test dx, dx
    jl near loc_2b28
    movsx eax, dx
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 1
    jne short loc_2b18
    cmp word [eax + 0x1c0bca], 0xc
    jne short loc_2b18
    mov bx, word [0x2454c8]
loc_2ace:
    test bx, bx
    jl short loc_2b28
    movsx ecx, bx
    imul eax, ecx, 0x2c
    movsx esi, dx
    imul esi, esi, 0x2c
    mov ax, word [eax + 0x1c0bcc]
    cmp ax, word [esi + 0x1c0bcc]
    jne short loc_2b0b
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov dword [eax + 0x4ea13], 1
loc_2b0b:
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [eax*2 + 0x1af7a4]
    jmp short loc_2ace
loc_2b18:
    movsx edx, dx
    db 0x66, 0x8b, 0x14, 0x55, 0xa4, 0xc8, 0x1b, 0x00    ; mov dx, word [edx*2 + 0x1bc8a4]
    jmp near loc_2aa4
loc_2b28:
    mov dx, word [0x2454c8]
    call 0x7079f
    mov ebx, eax
    xor bh, ah
    and bl, 1
loc_2b3b:
    test dx, dx
    jl short loc_2ba7
    movsx esi, dx
    imul edi, esi, 0x2c
    movsx ecx, word [esp]
    lea eax, [ecx*4]
    add ecx, eax
    lea ecx, [ecx*8]
    mov ax, word [edi + 0x1c0bcc]
    cmp ax, word [ecx + 0x2385c8]
    jne short loc_2b9a
    cmp word [edi + 0x1c0bca], 3
    jne short loc_2b9a
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    movsx edi, bx
    mov esi, 1
    mov dword [eax + 0x4ea0f], edi
    mov dword [eax + 0x4ea17], esi
loc_2b9a:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp short loc_2b3b
loc_2ba7:
    mov al, 1
    add esp, 4
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2bb2:
    xor al, al
    add esp, 4
loc_2bb7:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 8
    mov word [esp], ax
    mov esi, edx
    and byte [esp + 1], 0xf
    movsx ecx, word [esp]
    imul edx, ecx, 0x2c
    mov ax, word [edx + 0x1c0bb2]
    cmp ax, 0x365
    jb near loc_2daf
    jbe near loc_3547
    cmp ax, 0x3f4
    jb near loc_2cce
    cmp ax, 0x3f6
    jbe near loc_3547
    cmp ax, 0x54e
    jb short loc_2c75
    jbe near loc_3609
    cmp ax, 0x1003
    jb short loc_2c4b
    jbe near loc_39c5
    cmp ax, 0x1171
    jb short loc_2c3c
    jbe near loc_3265
    cmp ax, 0x134f
    je near loc_3ac7
    jmp near loc_3da4
loc_2c3c:
    cmp ax, 0x115c
    je near loc_3ccb
    jmp near loc_3da4
loc_2c4b:
    cmp ax, 0x58c
    jb short loc_2c66
    jbe near loc_3d99
    cmp ax, 0xa1e
    je near loc_3702
    jmp near loc_3da4
loc_2c66:
    cmp ax, 0x54f
    je near loc_3638
    jmp near loc_3da4
loc_2c75:
    cmp ax, 0x485
    jb short loc_2caf
    cmp ax, 0x48e
    jbe near loc_3547
    cmp ax, 0x549
    jb short loc_2ca0
    jbe near loc_3aec
    cmp ax, 0x54b
    jbe near loc_3ac7
    jmp near loc_3da4
loc_2ca0:
    cmp ax, 0x548
    je near loc_3ac7
    jmp near loc_3da4
loc_2caf:
    cmp ax, 0x401
    jb near loc_3da4
    jbe near loc_3694
    cmp ax, 0x459
    je near loc_3941
    jmp near loc_3da4
loc_2cce:
    cmp ax, 0x3c9
    jb near loc_2d4c
    jbe near loc_36c5
    cmp ax, 0x3d5
    jb short loc_2d18
    jbe near loc_38ca
    cmp ax, 0x3e2
    jb short loc_2d09
    cmp ax, 0x3e4
    jbe near loc_39fa
    cmp ax, 0x3eb
    je near loc_3785
    jmp near loc_3da4
loc_2d09:
    cmp ax, 0x3de
    je near loc_30a0
    jmp near loc_3da4
loc_2d18:
    cmp ax, 0x3d2
    jb short loc_2d33
    jbe near loc_30a0
    cmp ax, 0x3d3
    je near loc_3265
    jmp near loc_3da4
loc_2d33:
    cmp ax, 0x3cb
    jb near loc_3da4
    cmp ax, 0x3cf
    jbe near loc_2f5e
    jmp near loc_3da4
loc_2d4c:
    cmp ax, 0x38e
    jb short loc_2d8c
    jbe near loc_30a0
    cmp ax, 0x3b7
    jb short loc_2d7d
    jbe near loc_30a0
    cmp ax, 0x3ba
    jb near loc_3da4
    cmp ax, 0x3bd
    jbe near loc_3547
    jmp near loc_3da4
loc_2d7d:
    cmp ax, 0x38f
    je near loc_3140
    jmp near loc_3da4
loc_2d8c:
    cmp ax, 0x385
    jb near loc_3da4
    cmp ax, 0x386
    jbe near loc_2f7e
    cmp ax, 0x38c
    je near loc_30a0
    jmp near loc_3da4
loc_2daf:
    cmp ax, 0x26a
    jb near loc_2e9c
    cmp ax, 0x26b
    jbe near loc_39fa
    cmp ax, 0x2b9
    jb short loc_2e33
    jbe near loc_3ccb
    cmp ax, 0x300
    jb short loc_2e09
    cmp ax, 0x301
    jbe near loc_3547
    cmp ax, 0x30b
    jb short loc_2dfa
    jbe near loc_3547
    cmp ax, 0x318
    je near loc_3547
    jmp near loc_3da4
loc_2dfa:
    cmp ax, 0x306
    je near loc_3547
    jmp near loc_3da4
loc_2e09:
    cmp ax, 0x2f1
    jb short loc_2e24
    jbe near loc_3547
    cmp ax, 0x2fd
    je near loc_3547
    jmp near loc_3da4
loc_2e24:
    cmp ax, 0x2cc
    je near loc_3547
    jmp near loc_3da4
loc_2e33:
    cmp ax, 0x2a8
    jb short loc_2e7d
    jbe near loc_3ccb
    cmp ax, 0x2b1
    jb short loc_2e64
    jbe near loc_3ccb
    cmp ax, 0x2b6
    jb near loc_3da4
    cmp ax, 0x2b7
    jbe near loc_3ccb
    jmp near loc_3da4
loc_2e64:
    cmp ax, 0x2ad
    jb near loc_3da4
    cmp ax, 0x2ae
    jbe near loc_3ccb
    jmp near loc_3da4
loc_2e7d:
    cmp ax, 0x29d
    jb near loc_3da4
    jbe near loc_3ccb
    cmp ax, 0x2a6
    je near loc_3ccb
    jmp near loc_3da4
loc_2e9c:
    cmp ax, 0x237
    jb short loc_2efd
    jbe near loc_3547
    cmp ax, 0x253
    jb short loc_2ede
    jbe near loc_38ff
    cmp ax, 0x25f
    jb short loc_2ecf
    jbe near loc_346b
    cmp ax, 0x268
    je near loc_39fa
    jmp near loc_3da4
loc_2ecf:
    cmp ax, 0x25a
    je near loc_346b
    jmp near loc_3da4
loc_2ede:
    cmp ax, 0x239
    jb near loc_3da4
    jbe near loc_37e4
    cmp ax, 0x23b
    je near loc_3857
    jmp near loc_3da4
loc_2efd:
    cmp ax, 0x204
    jb short loc_2f3b
    cmp ax, 0x205
    jbe near loc_346b
    cmp ax, 0x22c
    jb short loc_2f2c
    cmp ax, 0x22d
    jbe near loc_3ca2
    cmp ax, 0x233
    jb near loc_3da4
    jmp near loc_3441
loc_2f2c:
    cmp ax, 0x227
    je near loc_3547
    jmp near loc_3da4
loc_2f3b:
    cmp ax, 0x156
    jb near loc_3da4
    cmp ax, 0x157
    jbe near loc_3983
    cmp ax, 0x197
    je near loc_330e
    jmp near loc_3da4
loc_2f5e:
    mov edx, 0x919
    movsx eax, word [esp]
    call 0x19320
    movsx eax, word [esp]
    call 0x6ab35
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2f7e:
    movsx eax, si
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x386
    je short loc_2fa4
    movsx eax, si
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x385
    jne near loc_303e
loc_2fa4:
    movsx ecx, word [esp]
    imul ebx, ecx, 0x2c
    movsx eax, word [ebx + 0x1c0bc4]
    mov edx, eax
    sar edx, 1
    sar eax, 2
    add eax, edx
    mov edx, eax
    movsx eax, si
    imul eax, eax, 0x2c
    mov word [eax + 0x1c0bc4], dx
    mov dx, word [ebx + 0x1c0bc0]
    add edx, edx
    mov si, word [eax + 0x1c0bc0]
    add dh, 4
    sub esi, edx
    mov word [eax + 0x1c0bc0], si
    mov edx, dword [ebx + 0x1c0ba8]
    mov esi, dword [eax + 0x1c0ba8]
    sub edx, esi
    mov esi, edx
    mov edx, dword [ebx + 0x1c0ba4]
    mov edi, dword [eax + 0x1c0ba4]
    mov eax, edx
    mov edx, esi
    sub eax, edi
    call 0x65698
    db 0x81, 0xe8, 0x00, 0x02, 0x00, 0x00    ; sub eax, 0x200
    mov ebp, dword [0xe7641]
    mov word [ebx + 0x1c0bc0], ax
    cmp ebp, 2
    jge near loc_4315
    mov eax, 8
    mov edx, ecx
    call 0x5aca0
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_303e:
    call 0x7079f
    test al, 3
    je short loc_307b
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    movsx edx, si
    imul edx, edx, 0x2c
    mov word [eax + 0x1c0bc4], 0xa4
    movsx eax, word [esp]
    imul ebx, eax, 0x2c
    mov ax, word [edx + 0x1c0bc0]
    mov word [ebx + 0x1c0bc0], ax
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_307b:
    mov ebx, 3
    mov edx, 0xffffffff
    movsx eax, word [esp]
    call 0x26620
    movsx eax, word [esp]
    call 0x6ab35
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_30a0:
    movsx eax, si
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x1c0bb2]
    cmp ax, 0x659
    jb short loc_30d0
    jbe short loc_30e6
    cmp ax, 0x686
    jb near loc_4315
    jbe short loc_30e6
    cmp ax, 0xa2d
    je short loc_30e6
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_30d0:
    db 0x66, 0x3d, 0x1a, 0x00    ; cmp ax, 0x1a
    jb near loc_4315
    jbe short loc_30e6
    cmp ax, 0x3d5
    jne near loc_4315
loc_30e6:
    movsx ebx, word [esp]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    cmp dword [eax + 0x4ea07], 0
    jne near loc_4315
    imul edx, ebx, 0x2c
    mov ebp, 1
    mov cx, word [edx + 0x1c0bb0]
    mov dword [eax + 0x4ea07], ebp
    and ecx, 0xfffffefe
    mov eax, ebx
    mov word [edx + 0x1c0bb0], cx
    mov edx, 0x8de
    call 0x19320
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3140:
    movsx eax, si
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x1c0bb2]
    cmp ax, 0x659
    jb short loc_3170
    jbe short loc_3186
    cmp ax, 0x686
    jb near loc_4315
    jbe short loc_3186
    cmp ax, 0xa2d
    je short loc_3186
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3170:
    db 0x66, 0x3d, 0x1a, 0x00    ; cmp ax, 0x1a
    jb near loc_4315
    jbe short loc_3186
    cmp ax, 0x3d5
    jne near loc_4315
loc_3186:
    xor esi, esi
    jmp near loc_3227
loc_318d:
    push 5
    movsx ebx, word [esp + 4]
    push ebx
    imul ebx, ebx, 0x2c
    movsx edx, word [ebx + 0x1c0bc8]
    call 0x7079f
    and eax, 0xfff
    sar edx, 2
    neg eax
    sub eax, edx
    push eax
    call 0x7079f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x7079f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x7079f
    xor ah, ah
    and al, 3
    add eax, 0x968
    cwde
    push eax
    call 0x7079f
    mov edx, eax
    mov ecx, 0x3000
    sar edx, 0x1f
    idiv ecx
    movsx edi, word [ebx + 0x1c0bbc]
    mov ecx, dword [ebx + 0x1c0bac]
    mov eax, dword [ebx + 0x1c0ba8]
    sub ecx, edx
    mov edx, dword [ebx + 0x1c0ba4]
    mov ebx, eax
    mov eax, edi
    call 0x18f70
    mov dword [esp + 4], eax
    cwde
    imul eax, eax, 0x2c
    mov dl, 8
    inc esi
    mov byte [eax + 0x1c0bb5], dl
loc_3227:
    cmp si, 0x40
    jl near loc_318d
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x38f
    jne short loc_324c
    mov word [eax + 0x1c0bb2], 0x3ab
loc_324c:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    and word [eax + 0x1c0bb0], 0xfefe
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3265:
    xor esi, esi
    jmp short loc_32e4
loc_3269:
    push 5
    movsx edx, word [esp + 4]
    push edx
    imul edx, edx, 0x2c
    movsx ebx, word [edx + 0x1c0bc8]
    call 0x7079f
    and eax, 0xfff
    sar ebx, 2
    neg eax
    sub eax, ebx
    push eax
    call 0x7079f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x7079f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x7079f
    xor ah, ah
    mov ecx, dword [edx + 0x1c0bac]
    and al, 0xf
    mov ebx, dword [edx + 0x1c0ba8]
    add eax, 0x960
    mov edi, dword [edx + 0x1c0ba4]
    cwde
    sub ecx, 0x800
    push eax
    movsx eax, word [edx + 0x1c0bbc]
    mov edx, edi
    inc esi
    call 0x18f70
loc_32e4:
    cmp si, 6
    jl near loc_3269
    movsx ebx, word [esp]
    mov eax, 0x14
    mov edx, ebx
    call 0x5aca0
    mov eax, ebx
    call 0x6ab35
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_330e:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov word [eax + 0x1c0bb2], 0x19b
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    and word [eax + 0x1c0bb0], 0xfefe
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x1c0bbc]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385bc], 0x19c
    jne short loc_3372
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x1c0bbc]
    lea eax, [edx*4]
    add eax, edx
    mov word [eax*8 + 0x2385bc], 0x1a0
loc_3372:
    movsx ebx, word [esp]
    mov edx, ebx
    imul ebx, ebx, 0x2c
    mov eax, 0x14
    mov esi, 0x1c0ba4
    xor edi, edi
    call 0x5aca0
    mov dword [esp + 4], edi
    add esi, ebx
    jmp near loc_342c
loc_3397:
    push 5
    movsx eax, word [esp + 4]
    push eax
    mov edx, 0xfffffe00
    call 0x7079f
    and eax, 0x7ff
    sub edx, eax
    push edx
    call 0x7079f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x7079f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x7079f
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [esi + 8]
    push eax
    sub ecx, 0x800
    call 0x7079f
    and eax, 0x1fff
    sub ecx, eax
    call 0x7079f
    and eax, 0xff
    mov ebx, dword [esi + 4]
    add ebx, eax
    call 0x7079f
    and eax, 0xff
    mov edx, dword [esi]
    add edx, eax
    sub ebx, 0x80
    sub edx, 0x80
    movsx eax, word [esi + 0x18]
    call 0x18f70
    inc dword [esp + 4]
loc_342c:
    cmp word [esp + 4], 0x10
    jl near loc_3397
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3441:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov esi, 0x237
    mov edx, 0x399
    mov word [eax + 0x1c0bb2], si
    movsx eax, word [esp]
    call 0x19320
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_346b:
    movsx eax, si
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x1c0bce]
    mov eax, dword [0xada24]
    cmp edx, dword [eax]
    je near loc_4315
    xor eax, eax
    mov dword [esp + 4], eax
    jmp near loc_351b
loc_3490:
    push 5
    movsx edx, word [esp + 4]
    push edx
    imul edx, edx, 0x2c
    call 0x7079f
    and eax, 0x1ff
    neg eax
    sub eax, 0x100
    push eax
    call 0x7079f
    xor ah, ah
    and al, 0x7f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x7079f
    and ah, 7
    cwde
    push eax
    push 0x40
    push 0x40
    push -8
    call 0x7079f
    xor ah, ah
    and al, 0xf
    add eax, 0x960
    cwde
    push eax
    movsx eax, word [edx + 0x1c0bbc]
    lea esi, [eax*4]
    add esi, eax
    movsx ecx, word [esp + 0x28]
    mov ebx, dword [esi*8 + 0x2385ac]
    shl ecx, 9
    sub ebx, 0xc00
    sub ebx, ecx
    mov ecx, ebx
    mov ebx, dword [edx + 0x1c0ba8]
    mov edx, dword [edx + 0x1c0ba4]
    call 0x18f70
    inc dword [esp + 4]
loc_351b:
    cmp word [esp + 4], 0xf
    jl near loc_3490
    movsx ebx, word [esp]
    mov edx, 0x762
    mov eax, ebx
    call 0x19320
    mov eax, ebx
    call 0x6ab35
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3547:
    movsx eax, word [esp]
    imul edx, eax, 0x2c
    mov bx, word [edx + 0x1c0bb2]
    cmp bx, 0x485
    jne short loc_357d
    call 0x7079f
    xor ah, ah
    and al, 3
    db 0x05, 0x04, 0x00, 0x00, 0x00    ; add eax, 4
    mov ebx, 0x1c0ba4
    cwde
    add ebx, edx
    mov edx, eax
    mov eax, ebx
    call 0x28810
    jmp short loc_35c4
loc_357d:
    cmp bx, 0x2f1
    je short loc_358b
    cmp bx, 0x365
    jne short loc_35ae
loc_358b:
    movsx ecx, word [esp]
    mov ebx, 0x28
    mov edx, 0xffffffff
    mov eax, ecx
    call 0x26a80
    mov eax, 0x14
    mov edx, ecx
    call 0x5aca0
    jmp short loc_35c4
loc_35ae:
    cmp bx, 0x2fd
    jne short loc_35c4
    mov ebx, 0x28
    mov edx, 0xffffffff
    call 0x26620
loc_35c4:
    movsx ecx, word [esp]
    mov eax, 0x13
    mov edx, ecx
    call 0x5aca0
    call 0x7079f
    and ah, 7
    mov edx, eax
    imul eax, ecx, 0x2c
    mov ebx, 8
    mov word [eax + 0x1c0bc0], dx
    mov edx, 0xffffffff
    mov eax, ecx
    call 0x26620
    mov eax, ecx
    call 0x6ab35
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3609:
    mov word [edx + 0x1c0bb2], 0x54f
    mov eax, 0x13
    mov edx, ecx
    mov ebx, 0xa
    call 0x5aca0
    mov edx, 0xffffffff
    mov eax, ecx
    call 0x26620
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3638:
    xor edi, edi
    mov dword [esp + 4], edi
    jmp short loc_3670
loc_3640:
    movsx ebx, word [esp]
    mov eax, ebx
    imul ebx, ebx, 0x2c
    mov edx, 0x8f8
    call 0x48740
    mov edi, dword [esp + 4]
    mov si, word [ebx + 0x1c0bc0]
    inc edi
    add esi, 0x14d
    mov dword [esp + 4], edi
    mov word [ebx + 0x1c0bc0], si
loc_3670:
    cmp word [esp + 4], 0x30
    jl short loc_3640
    movsx ebx, word [esp]
    mov eax, 0x14
    mov edx, ebx
    call 0x5aca0
    mov eax, 0x45
    mov edx, ebx
    call 0x5aca0
loc_3694:
    movsx ecx, word [esp]
    mov eax, 0x13
    mov edx, ecx
    mov ebx, 0xa
    call 0x5aca0
    mov edx, 0xffffffff
    mov eax, ecx
    call 0x26620
    mov eax, ecx
    call 0x6ab35
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_36c5:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov ebx, 0x3eb
    movsx edx, word [esp]
    mov word [eax + 0x1c0bb2], bx
    mov eax, 0x13
    mov ebx, 0xa
    call 0x5aca0
    mov edx, 0xffffffff
    movsx eax, word [esp]
    call 0x26620
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3702:
    xor bl, bl
    mov byte [edx + 0x1c0bb8], bl
    movsx edx, word [edx + 0x1c0bc2]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, 0x20
    mov ebx, dword [eax + 0x4ea0b]
    mov dword [eax + 0x4ea07], edx
    test ebx, ebx
    sete al
    movsx ebx, word [esp]
    imul edx, ebx, 0x2c
    xor ecx, ecx
    movsx edx, word [edx + 0x1c0bc2]
    mov cl, al
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + 0x4ea0b], ecx
    mov ecx, dword [eax + 0x4ea0f]
    inc ecx
    mov edx, 0x762
    mov dword [eax + 0x4ea0f], ecx
    mov eax, ebx
    call 0x19320
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3785:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    test byte [eax + 0x1c0bb0], 1
    je near loc_4315
    movsx edx, word [esp]
    mov eax, 0x13
    call 0x5aca0
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    movsx edx, word [esp]
    imul edx, edx, 0x2c
    add dword [eax + 0x1c0bac], 0x1000
    xor eax, eax
    mov ebx, 5
    mov word [edx + 0x1c0bb0], ax
    mov edx, 0xffffffff
    movsx eax, word [esp]
    call 0x26620
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_37e4:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov word [eax + 0x1c0bb2], 0x267
    movsx edx, word [esp]
    imul edx, edx, 0x2c
    call 0x7079f
    xor ah, ah
    and al, 1
    shl eax, 2
    mov bx, word [edx + 0x1c0bb0]
    or ebx, eax
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov word [edx + 0x1c0bb0], bx
    mov cx, word [eax + 0x1c0bb0]
    and ecx, 0xfffffefe
    mov edx, 0x399
    mov word [eax + 0x1c0bb0], cx
    movsx eax, word [esp]
    call 0x19320
    movsx edx, word [esp]
    mov eax, 0x13
    call 0x5aca0
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3857:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    movsx edx, word [esp]
    imul edx, edx, 0x2c
    mov word [eax + 0x1c0bb2], 0x23d
    call 0x7079f
    xor ah, ah
    and al, 1
    mov si, word [edx + 0x1c0bb0]
    shl eax, 2
    or esi, eax
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov word [edx + 0x1c0bb0], si
    mov di, word [eax + 0x1c0bb0]
    and edi, 0xfffffefe
    mov edx, 0x399
    mov word [eax + 0x1c0bb0], di
    movsx eax, word [esp]
    call 0x19320
    movsx edx, word [esp]
    mov eax, 0x14
    call 0x5aca0
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_38ca:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov word [eax + 0x1c0bb2], 0x3b6
    mov edx, 0x399
    movsx eax, word [esp]
    call 0x19320
    movsx edx, word [esp]
    mov eax, 0x14
    call 0x5aca0
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_38ff:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov word [eax + 0x1c0bb2], 0x254
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov bx, word [eax + 0x1c0bb0]
    and ebx, 0xfefe
    movsx edx, word [esp]
    mov word [eax + 0x1c0bb0], bx
    mov eax, 0x12
    call 0x5aca0
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3941:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov word [eax + 0x1c0bb2], 0x45a
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov di, word [eax + 0x1c0bb0]
    and edi, 0xfefe
    movsx edx, word [esp]
    mov word [eax + 0x1c0bb0], di
    mov eax, 0x12
    call 0x5aca0
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3983:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov word [eax + 0x1c0bb2], 0x155
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov bx, word [eax + 0x1c0bb0]
    and ebx, 0xfefe
    movsx edx, word [esp]
    mov word [eax + 0x1c0bb0], bx
    mov eax, 0x12
    call 0x5aca0
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_39c5:
    mov si, word [edx + 0x1c0bb0]
    mov ebx, 0x1004
    and esi, 0xfefe
    mov word [edx + 0x1c0bb2], bx
    mov eax, 0x12
    mov word [edx + 0x1c0bb0], si
    mov edx, ecx
    call 0x5aca0
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_39fa:
    movsx edx, word [esp]
    imul edx, edx, 0x2c
    mov ax, word [edx + 0x1c0bb2]
    cmp ax, 0x26b
    jb short loc_3a2c
    jbe short loc_3a3c
    cmp ax, 0x3e3
    jb short loc_3a24
    jbe near loc_3a73
    cmp ax, 0x3e4
    je short loc_3a5d
    jmp short loc_3a7c
loc_3a24:
    cmp ax, 0x3e2
    je short loc_3a68
    jmp short loc_3a7c
loc_3a2c:
    cmp ax, 0x268
    jb short loc_3a7c
    jbe short loc_3a47
    cmp ax, 0x26a
    je short loc_3a52
    jmp short loc_3a7c
loc_3a3c:
    mov word [edx + 0x1c0bb2], 0x269
    jmp short loc_3a7c
loc_3a47:
    mov word [edx + 0x1c0bb2], 0x279
    jmp short loc_3a7c
loc_3a52:
    mov word [edx + 0x1c0bb2], 0x2bc
    jmp short loc_3a7c
loc_3a5d:
    mov word [edx + 0x1c0bb2], 0x3e5
    jmp short loc_3a7c
loc_3a68:
    mov word [edx + 0x1c0bb2], 0x3ed
    jmp short loc_3a7c
loc_3a73:
    mov word [edx + 0x1c0bb2], 0x4ec
loc_3a7c:
    movsx ebx, word [esp]
    mov eax, ebx
    imul ebx, ebx, 0x2c
    mov edx, 0x4e2
    call 0x19320
    mov edx, eax
    movsx ebx, word [ebx + 0x1c0bbc]
    mov dword [esp + 4], eax
    lea eax, [ebx*4]
    add eax, ebx
    mov ebx, dword [eax*8 + 0x2385ac]
    movsx eax, dx
    imul eax, eax, 0x2c
    sub ebx, 0x2000
    mov dword [eax + 0x1c0bac], ebx
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3ac7:
    movsx ebx, word [esp]
    imul ecx, ebx, 0x2c
    xor eax, eax
    mov edx, ebx
    mov ax, word [ecx + 0x1c0bca]
    call 0x5aca0
    mov eax, ebx
    movsx edx, word [ecx + 0x1c0bcc]
    call 0x19320
loc_3aec:
    movsx eax, si
    imul eax, eax, 0x2c
    movsx edi, word [esp]
    imul ebx, edi, 0x2c
    mov ax, word [eax + 0x1c0bce]
    mov dx, word [ebx + 0x1c0bce]
    sub edx, eax
    mov word [ebx + 0x1c0bce], dx
    test dx, dx
    jg near loc_4315
    call 0x7079f
    and ah, 7
    mov edx, 0x8f8
    mov word [ebx + 0x1c0bc0], ax
    mov eax, edi
    call 0x48740
    call 0x7079f
    and ah, 7
    mov edx, 0x8fa
    mov word [ebx + 0x1c0bc0], ax
    mov eax, edi
    call 0x48740
    call 0x7079f
    and ah, 7
    mov edx, 0x8f9
    mov word [ebx + 0x1c0bc0], ax
    mov eax, edi
    call 0x48740
    call 0x7079f
    and ah, 7
    mov edx, 0x8fb
    mov word [ebx + 0x1c0bc0], ax
    mov eax, edi
    call 0x48740
    call 0x7079f
    and ah, 7
    mov edx, 0x8f8
    mov word [ebx + 0x1c0bc0], ax
    mov eax, edi
    call 0x48740
    call 0x7079f
    and ah, 7
    mov edx, 0x8fa
    mov word [ebx + 0x1c0bc0], ax
    mov eax, edi
    call 0x48740
    call 0x7079f
    and ah, 7
    mov word [ebx + 0x1c0bc0], ax
    mov edx, 0x8f9
    mov eax, edi
    mov esi, 0x1c0ba4
    call 0x48740
    call 0x7079f
    mov edx, 0x8fb
    and ah, 7
    add esi, ebx
    mov word [ebx + 0x1c0bc0], ax
    mov eax, edi
    mov ebx, 1
    call 0x48740
    mov edx, 0x8c5
    movsx ecx, word [0x261216]
    mov eax, esi
    call 0x28990
    mov ebx, 2
    mov edx, 0x8ca
    movsx ecx, word [0x261216]
    mov eax, esi
    call 0x28990
    mov ebx, 3
    mov edx, 0x8cf
    movsx ecx, word [0x261216]
    mov eax, esi
    call 0x28990
    mov ebx, 4
    mov edx, 0x8d4
    movsx ecx, word [0x261216]
    mov eax, esi
    call 0x28990
    mov ebx, 1
    mov edx, 0x8d9
    movsx ecx, word [0x261216]
    mov eax, esi
    call 0x28990
    mov ebx, 6
    mov edx, 0x8cf
    movsx ecx, word [0x261216]
    mov eax, esi
    call 0x28990
    mov eax, 0x45
    call 0x5aa80
    mov eax, edi
    call 0x6ab35
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3ca2:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov word [eax + 0x1c0bb2], 0x22f
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    xor edx, edx
    mov word [eax + 0x1c0bb0], dx
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3ccb:
    movsx ebx, word [esp]
    mov edx, ebx
    imul ebx, ebx, 0x2c
    mov eax, 0x14
    mov esi, 0x1c0ba4
    xor edi, edi
    call 0x5aca0
    mov dword [esp + 4], edi
    add esi, ebx
    jmp near loc_3d7b
loc_3cf0:
    push 5
    movsx eax, word [esp + 4]
    push eax
    mov edx, 0xfffffe00
    call 0x7079f
    and eax, 0x7ff
    sub edx, eax
    push edx
    call 0x7079f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x7079f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x7079f
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [esi + 8]
    push eax
    sub ecx, 0x800
    call 0x7079f
    and eax, 0x1fff
    sub ecx, eax
    call 0x7079f
    and eax, 0xff
    add eax, dword [esi + 4]
    lea ebx, [eax - 0x80]
    call 0x7079f
    and eax, 0xff
    add eax, dword [esi]
    lea edx, [eax - 0x80]
    movsx eax, word [esi + 0x18]
    call 0x18f70
    inc dword [esp + 4]
loc_3d7b:
    cmp word [esp + 4], 0x10
    jl near loc_3cf0
    movsx eax, word [esp]
    call 0x6ab35
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3d99:
    mov ax, word [edx + 0x1c0bc2]
    mov word [esp], ax
loc_3da4:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    test byte [eax + 0x1c0bb0], 0x10
    je short loc_3dd6
    cmp word [eax + 0x1c0bcc], 0
    jne short loc_3dd6
    cmp word [eax + 0x1c0bca], 0
    jne short loc_3dd6
    cmp word [eax + 0x1c0bbe], 0
    je near loc_4315
loc_3dd6:
    movsx eax, si
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x669
    je short loc_3df7
    mov ecx, dword [esp]
    cmp cx, word [eax + 0x1c0bc2]
    je near loc_4315
loc_3df7:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bbe], 4
    je near loc_4315
    add eax, 0x1c0ba4
    call 0x12be0
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jne near loc_4112
    movsx eax, si
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0xa2d
    jne short loc_3e41
    mov bx, word [eax + 0x1c0bce]
    add ebx, ebx
    mov word [eax + 0x1c0bce], bx
loc_3e41:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov cx, word [eax + 0x1c0bb2]
    cmp cx, 0x758
    je near loc_3f1e
    cmp cx, 0x938
    je near loc_3f1e
    cmp cx, 0x780
    je near loc_3f1e
    cmp cx, 0x942
    jl short loc_3e82
    cmp cx, 0x949
    jle near loc_3f1e
loc_3e82:
    movsx eax, si
    imul ebx, eax, 0x2c
    cmp word [ebx + 0x1c0bb2], 0x669
    je near loc_3f1e
    movsx edx, word [esp]
    imul edx, edx, 0x2c
    movsx edx, word [edx + 0x1c0bb2]
    cmp byte [edx + 0x959d8], 0
    jne short loc_3f1e
    mov edx, 0x8ee
    call 0x19320
    mov dl, byte [ebx + 0x1c0bb5]
    mov dword [esp + 4], eax
    cmp dl, 6
    jne short loc_3ed1
    cwde
    imul eax, eax, 0x2c
    mov byte [eax + 0x1c0bb5], dl
loc_3ed1:
    movsx edx, word [esp + 4]
    imul edx, edx, 0x2c
    mov eax, 0x10
    mov bl, 0x18
    mov word [edx + 0x1c0bc4], ax
    mov byte [edx + 0x1c0bb9], bl
    mov ecx, dword [edx + 0x1c0bac]
    mov byte [edx + 0x1c0bb8], bl
    add ecx, 0x400
    mov dword [edx + 0x1c0bac], ecx
    call 0x7079f
    xor ah, ah
    mov ebx, 0x20
    and al, 0x3f
    sub ebx, eax
    mov eax, ebx
    add word [edx + 0x1c0bc0], ax
loc_3f1e:
    movsx eax, si
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x1c0bc2]
    mov dword [esp + 4], eax
    test ax, ax
    jl near loc_3fb5
    cwde
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x214
    jne short loc_3fb5
    movsx ebx, word [esp]
    imul edx, ebx, 0x2c
    mov cx, word [edx + 0x1c0bb2]
    cmp cx, 0x938
    je short loc_3fb5
    cmp cx, 0x758
    je short loc_3fb5
    movsx edx, word [eax + 0x1c0bc6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0x83, 0x3c, 0x45, 0x12, 0x52, 0x0b, 0x00, 0x07    ; cmp word [eax*2 + 0xb5212], 7
    jne short loc_3fb5
    mov edx, 0x8f9
    mov eax, ebx
    call 0x48740
    mov edx, 0x8f8
    mov eax, ebx
    call 0x48740
    mov edx, 0x8fa
    mov eax, ebx
    call 0x48740
    mov edx, 0x8fb
    mov eax, ebx
    call 0x48740
loc_3fb5:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    mov bx, word [eax + 0x1c0bb2]
    cmp bx, 0x7b7
    je near loc_40aa
    cmp bx, 0xa46
    je near loc_40aa
    cmp bx, 0x1284
    je near loc_40aa
    cmp bx, 0xa96
    je near loc_40aa
    cmp bx, 0xac8
    je near loc_40aa
    cmp bx, 0x7a8
    je near loc_40aa
    cmp bx, 0x938
    je near loc_40aa
    test byte [eax + 0x1c0bb0], 0x30
    jne short loc_4033
    movsx edx, si
    imul edx, edx, 0x2c
    mov dx, word [edx + 0x1c0bc0]
    add dh, 4
    and dh, 7
    mov word [eax + 0x1c0bc0], dx
loc_4033:
    movsx eax, si
    imul eax, eax, 0x2c
    movsx ebp, word [esp]
    imul edi, ebp, 0x2c
    mov ax, word [eax + 0x1c0bce]
    shl eax, 2
    neg eax
    mov word [edi + 0x1c0bc4], ax
    push 0x10001
    mov ax, word [edi + 0x1c0bbc]
    push 0x400
    mov dword [esp + 0xc], eax
    mov eax, 0x1c0ba4
    push 0x400
    add eax, edi
    push 0x80
    lea ebx, [eax + 8]
    lea ecx, [esp + 0x14]
    lea edx, [eax + 4]
    call 0x6e5e4
    mov eax, dword [esp + 4]
    cmp ax, word [edi + 0x1c0bbc]
    je short loc_40aa
    test ax, ax
    jl short loc_40aa
    cmp ax, 0x400
    jge short loc_40aa
    movsx edx, ax
    mov eax, ebp
    call 0x6acf7
loc_40aa:
    movsx ebx, word [esp]
    imul eax, ebx, 0x2c
    cmp word [eax + 0x1c0bbe], 2
    jne short loc_40e2
    mov edx, 1
    mov eax, ebx
    call 0x6ad3e
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov word [eax + 0x4e9e9], 0x600
loc_40e2:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x1c0bb8], 0x18
    jb short loc_40fd
    cmp word [eax + 0x1c0bb2], 0x60e
    jne short loc_4112
loc_40fd:
    movsx eax, si
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x66e
    je near loc_4315
loc_4112:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bbe], 2
    je near loc_41ca
    movsx edx, si
    imul edx, edx, 0x2c
    cmp word [edx + 0x1c0bb2], 0x669
    jne short loc_416f
    cmp word [eax + 0x1c0bb2], 0x214
    jne short loc_4150
    cmp byte [eax + 0x1c0bb5], 1
    je near loc_4315
loc_4150:
    cmp byte [0x8d60], 0
    jne short loc_416f
    movsx eax, si
    imul eax, eax, 0x2c
    mov edi, dword [esp]
    cmp di, word [eax + 0x1c0bc2]
    je near loc_4315
loc_416f:
    movsx edx, si
    imul edx, edx, 0x2c
    movsx ebx, word [esp]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov bx, word [edx + 0x1c0bb2]
    mov cx, word [eax + 0x4e9dd]
    mov word [eax + 0x4e9d9], bx
    add cx, word [edx + 0x1c0bce]
    mov bx, word [edx + 0x1c0bc0]
    mov word [eax + 0x4e9dd], cx
    mov dx, word [edx + 0x1c0bc2]
    mov word [eax + 0x4e9db], bx
    mov word [eax + 0x4e9df], dx
loc_41ca:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bbe], 0xa
    jne near loc_4315
    mov ax, word [eax + 0x1c0bc6]
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xb521e], 0
    jl near loc_42a6
    mov ebx, 0xffffffff
    mov edx, dword [eax + 0xb5138]
    mov word [eax + 0xb521e], bx
    mov dword [eax + 0xb5114], edx
    mov edx, dword [eax + 0xb513c]
    mov dword [eax + 0xb5118], edx
    mov edx, dword [eax + 0xb5140]
    mov dword [eax + 0xb511c], edx
    mov ecx, 0xb4f00
    mov dx, word [eax + 0xb519a]
    add ecx, eax
    mov word [eax + 0xb5198], dx
    lea ebx, [ecx + 0x29e]
    mov edx, dword [eax + 0xb5118]
    mov eax, dword [eax + 0xb5114]
    call 0x6e997
    mov eax, ecx
    call 0x47d00
    mov ax, word [0x2454c4]
loc_4272:
    mov dword [esp + 4], eax
    mov eax, dword [esp + 4]
    test ax, ax
    jl short loc_42a6
    cwde
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x26d
    jne short loc_4297
    xor ebx, ebx
    mov word [eax + 0x1c0bc6], bx
loc_4297:
    movsx eax, word [esp + 4]
    db 0x66, 0x8b, 0x04, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov ax, word [eax*2 + 0x1af7a4]
    jmp short loc_4272
loc_42a6:
    movsx eax, word [esp]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x1c0bb8], 0x18
    jae short loc_42c7
    movsx eax, si
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x66e
    je short loc_4315
loc_42c7:
    movsx edx, word [esp]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx eax, word [eax + 0x4e9df]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x214
    je short loc_4315
    cmp dword [0xe97e3], 3
    jl short loc_4315
    movsx edx, si
    imul edx, edx, 0x2c
    movsx eax, word [edx + 0x1c0bce]
    mov ebx, eax
    sar ebx, 1
    add eax, ebx
    mov word [edx + 0x1c0bce], ax
loc_4315:
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov si, word [0x2454c8]
loc_4330:
    test si, si
    jl near loc_2bb7
    movsx eax, si
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bca], 0x11
    jne near loc_43e6
    cmp byte [eax + 0x1c0bb4], 0x10
    jle near loc_43e6
    mov dx, word [0x2454c8]
loc_4361:
    test dx, dx
    jl near loc_43e6
    movsx ebx, dx
    imul ebx, ebx, 0x2c
    cmp word [ebx + 0x1c0bca], 0x11
    jne short loc_43d6
    cmp si, dx
    je short loc_43d6
    movsx eax, si
    imul eax, eax, 0x2c
    mov di, word [ebx + 0x1c0bcc]
    cmp di, word [eax + 0x1c0bcc]
    jne short loc_43d6
    movsx ecx, word [eax + 0x1c0bbc]
    lea eax, [ecx*4]
    movsx ebx, word [ebx + 0x1c0bbc]
    add ecx, eax
    lea eax, [ebx*4]
    lea ecx, [ecx*8]
    add eax, ebx
    mov ebx, dword [ecx + 0x2385ac]
    mov dword [eax*8 + 0x2385ac], ebx
    mov ebx, dword [ecx + 0x2385a8]
    mov dword [eax*8 + 0x2385a8], ebx
loc_43d6:
    movsx edx, dx
    db 0x66, 0x8b, 0x14, 0x55, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [edx*2 + 0x1af7a4]
    jmp near loc_4361
loc_43e6:
    movsx esi, si
    db 0x66, 0x8b, 0x34, 0x75, 0xa4, 0xf7, 0x1a, 0x00    ; mov si, word [esi*2 + 0x1af7a4]
    jmp near loc_4330
    db 0x8b, 0xc0    ; mov eax, eax
%endif
