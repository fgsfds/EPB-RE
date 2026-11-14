; Player interaction and tile event handlers.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
loc_0008:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0xc
    cmp byte [0x126239], 0
    je short loc_0021
    mov al, 1
    jmp near loc_39d7
loc_0021:
    mov eax, dword [0x121ecc]
    mov edx, dword [eax]
    sub edx, 2
    cmp edx, 0x73
    ja near loc_39ce
    jmp dword cs:[edx*4 + 0x27f10]
    lea esi, [eax + 4]
    mov dword [0x121ecc], esi
    call 0x6dc5f
    mov edx, dword [0x121ecc]
    mov ebx, 0xff
    mov edi, dword [edx]
    mov edx, ebx
    sar eax, 8
    sub edx, edi
    cmp eax, edx
    setge al
    and eax, ebx
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp dword [0x6c50c], 0x400
    jle near loc_01dd
    mov eax, dword [0x6c508]
    call 0x12bc0
    test ax, ax
    je short loc_00ac
    mov eax, dword [0x6c508]
    cmp byte [eax + 0x14], 0x38
    jbe short loc_00ac
    mov ebx, 0xc0c
    mov esi, 0x30
    jmp short loc_00b6
loc_00ac:
    mov ebx, 0x300
    mov esi, 0x10
loc_00b6:
    lea edx, [esp + 4]
    movsx eax, word [0x6c6ec]
    call 0x454c0
    cmp eax, 0x40000000
    jne short loc_00e3
    mov eax, 1
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_00e3:
    movsx edx, bx
    cmp eax, edx
    jle near loc_01c8
    mov edi, dword [esp + 4]
    test di, di
    jl short loc_0117
    movsx eax, di
    imul eax, eax, 0x2c
    mov edx, dword [0x6c508]
    mov cx, word [edx + 0xe]
    cmp cx, word [eax + 0x2522c2]
    jne short loc_0117
    xor esi, esi
    jmp near loc_01e2
loc_0117:
    mov eax, dword [0x6c508]
    add word [eax + 0x1c], si
    lea edx, [esp + 4]
    movsx eax, word [0x6c6ec]
    call 0x454c0
    mov edx, dword [0x6c508]
    sub word [edx + 0x1c], si
    movsx edx, bx
    cmp eax, edx
    jle near loc_01c8
    mov edi, dword [esp + 4]
    test di, di
    jl short loc_017c
    movsx eax, di
    imul eax, eax, 0x2c
    mov edx, dword [0x6c508]
    mov bx, word [edx + 0xe]
    cmp bx, word [eax + 0x2522c2]
    jne short loc_017c
    xor esi, esi
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_017c:
    mov eax, dword [0x6c508]
    sub word [eax + 0x1c], si
    lea edx, [esp + 4]
    movsx eax, word [0x6c6ec]
    call 0x454c0
    mov edx, eax
    mov eax, dword [0x6c508]
    add word [eax + 0x1c], si
    cmp edx, 0x300
    jle short loc_01c8
    mov eax, dword [esp + 4]
    test ax, ax
    jl short loc_01dd
    cwde
    imul eax, eax, 0x2c
    mov edx, dword [0x6c508]
    mov bx, word [edx + 0xe]
    cmp bx, word [eax + 0x2522c2]
    jne short loc_01dd
loc_01c8:
    xor esi, esi
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_01dd:
    mov esi, 1
loc_01e2:
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x2522cc]
    movsx edx, word [0x6c6ee]
    push eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x8b, 0x2c, 0x45, 0x3c, 0x19, 0x0f, 0x00    ; mov ebp, dword [eax*2 + 0xf193c]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    push ebp
    db 0x8b, 0x14, 0x45, 0x38, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf1938]
    push edx
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x1c, 0x45, 0x34, 0x19, 0x0f, 0x00    ; mov ebx, dword [eax*2 + 0xf1934]
    mov ecx, dword [0x6c508]
    push ebx
    movsx ecx, word [ecx + 0x18]
    call 0x6dc5f
    and eax, 0x29
    mov ebx, dword [0x6c508]
    shl eax, 8
    mov ebx, dword [ebx + 8]
    mov edx, dword [0x6c508]
    sub ebx, eax
    mov eax, dword [0x6c508]
    mov edx, dword [edx + 4]
    mov eax, dword [eax]
    call 0x6830d
    mov esi, eax
    call 0x37ee0
    test esi, esi
    je near loc_39d5
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov word [eax + 0x8b0c9], 0x600
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx eax, word [eax + 0x8b0c5]
    cmp eax, -1
    sete al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    xor ecx, ecx
    xor ebp, ebp
    mov dword [0x8940], ecx
loc_0334:
    mov eax, dword [0x6c508]
    mov ax, word [eax + 0xe]
    cmp ax, 0xa3a
    jb short loc_03a1
    jbe near loc_03db
    cmp ax, 0xc3a
    jb short loc_037f
    jbe near loc_03db
    cmp ax, 0xd3a
    jb short loc_0370
    jbe near loc_03db
    cmp ax, 0xd3c
    je near loc_03cf
    jmp near loc_03f9
loc_0370:
    cmp ax, 0xc3c
    je near loc_03cf
    jmp near loc_03f9
loc_037f:
    cmp ax, 0xb3a
    jb short loc_0396
    jbe near loc_03db
    cmp ax, 0xb3c
    je short loc_03cf
    jmp near loc_03f9
loc_0396:
    cmp ax, 0xa3c
    je short loc_03cf
    jmp near loc_03f9
loc_03a1:
    cmp ax, 0x33a
    jb short loc_03c1
    jbe short loc_03db
    cmp ax, 0x93a
    jb short loc_03b9
    jbe short loc_03db
    cmp ax, 0x93c
    je short loc_03cf
    jmp short loc_03f9
loc_03b9:
    cmp ax, 0x33c
    je short loc_03cf
    jmp short loc_03f9
loc_03c1:
    cmp ax, 0x23a
    jb short loc_03f9
    jbe short loc_03db
    cmp ax, 0x23c
    jne short loc_03f9
loc_03cf:
    imul eax, ebp, 0x2c
    imul edi, dword [eax + 0x2e4f0], 0x2c
    jmp short loc_03e5
loc_03db:
    imul eax, ebp, 0x2c
    imul edi, dword [eax + 0x2e650], 0x2c
loc_03e5:
    movsx eax, word [0x6c6ec]
    add edi, 0x2522b4
    mov dword [eax*4 + 0x1acd8], edi
loc_03f9:
    movsx eax, word [edi + 0x18]
    push eax
    mov eax, dword [edi + 8]
    sub eax, 0x1800
    push eax
    mov ebx, dword [edi + 4]
    push ebx
    mov ecx, dword [edi]
    push ecx
    mov ecx, dword [0x6c508]
    movsx ecx, word [ecx + 0x18]
    call 0x6dc5f
    mov ebx, eax
    mov eax, dword [0x6c508]
    and ebx, 0x2f00
    mov edx, dword [eax + 8]
    sub edx, ebx
    mov ebx, edx
    mov edx, dword [eax + 4]
    mov eax, dword [eax]
    call 0x6830d
    mov esi, eax
    test eax, eax
    jne near loc_04ca
    movsx eax, word [0x6c6ec]
    imul eax, eax, 0x2c
    add eax, 0x2522b4
    call 0x16e70
    test eax, eax
    je short loc_04ca
    movsx ebx, word [0x6c6ee]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x0f, 0xbf, 0x14, 0x45, 0xbe, 0x19, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf19be]
    push edx
    db 0x8b, 0x14, 0x45, 0x3c, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf193c]
    sub edx, 0x1800
    push edx
    db 0x8b, 0x34, 0x45, 0x38, 0x19, 0x0f, 0x00    ; mov esi, dword [eax*2 + 0xf1938]
    push esi
    db 0x8b, 0x14, 0x45, 0x34, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf1934]
    mov ecx, dword [0x6c508]
    push edx
    movsx ecx, word [ecx + 0x18]
    call 0x6dc5f
    mov ebx, eax
    mov eax, dword [0x6c508]
    and ebx, 0x2f00
    mov edx, dword [eax + 8]
    sub edx, ebx
    mov ebx, edx
    mov edx, dword [eax + 4]
    mov eax, dword [eax]
    call 0x6830d
    mov esi, eax
loc_04ca:
    test esi, esi
    je short loc_04e9
    mov ebx, dword [0x8940]
    movsx eax, word [0x6c6ec]
    inc ebx
    mov dword [eax*4 + 0x1acd8], edi
    mov dword [0x8940], ebx
loc_04e9:
    inc ebp
    cmp ebp, 8
    jl near loc_0334
    mov ecx, dword [0x8940]
    test ecx, ecx
    jne short loc_050b
    movsx eax, word [0x6c6ec]
    mov dword [eax*4 + 0x1acd8], ecx
loc_050b:
    cmp dword [0x8940], 0
    je short loc_0519
    mov esi, 1
loc_0519:
    test esi, esi
    jne near loc_061c
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x6c508]
    mov eax, dword [eax + 0x8b0d3]
    sub eax, dword [edx]
    test eax, eax
    jns short loc_054e
    neg eax
loc_054e:
    movsx edx, word [0x6c6ec]
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x6c508]
    mov eax, dword [eax + 0x8b0d7]
    sub eax, dword [edx + 4]
    test eax, eax
    jns short loc_057e
    neg eax
loc_057e:
    movsx edx, word [0x6c6ec]
    lea ecx, [ebx + eax]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ebp, dword [edi]
    mov eax, dword [eax + 0x8b0d3]
    sub eax, ebp
    test eax, eax
    jns short loc_05aa
    neg eax
loc_05aa:
    movsx edx, word [0x6c6ec]
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + 0x8b0d7]
    sub eax, dword [edi + 4]
    test eax, eax
    jns short loc_05d4
    neg eax
loc_05d4:
    add eax, ebx
    cmp ecx, eax
    test esi, esi
    jne short loc_0646
    movsx esi, word [0x6c6ec]
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    add eax, 0x8b0b8
    lea ecx, [eax + 0x1f]
    lea ebx, [eax + 0x1b]
    mov edx, edi
    mov eax, esi
    call 0x37460
    movsx esi, ax
    cmp esi, -1
    jne short loc_0615
    xor esi, esi
    jmp short loc_0646
loc_0615:
    mov esi, 1
    jmp short loc_0646
loc_061c:
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [edi]
    mov dword [eax + 0x8b0d3], edx
    mov edx, dword [edi + 4]
    mov dword [eax + 0x8b0d7], edx
loc_0646:
    cmp esi, 1
    jne short loc_0682
    mov eax, dword [0x6c508]
    mov di, word [eax + 0x1a]
    cmp di, 1
    je short loc_0660
    cmp di, 6
    jne short loc_0682
loc_0660:
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov word [eax + 0x8b0c9], 0x600
loc_0682:
    cmp esi, 1
    sete al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx eax, word [0x6c6ec]
    call 0x295e0
    test ax, ax
    setge al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    movsx eax, word [0x6c6ec]
    call 0x27c70
    cmp eax, 1
    sete al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x6c508]
    mov esi, dword [0x6c508]
    mov cx, word [eax + 0xe]
    movsx esi, word [esi + 0x2a]
    cmp cx, 0x214
    jne short loc_0710
    dec esi
loc_0710:
    test esi, esi
    setl al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebx, [eax + 4]
    mov dword [0x121ecc], ebx
    mov edx, dword [0x6c504]
    mov eax, dword [ebx]
    mov dword [edx + 0x14], eax
    mov eax, dword [0x6c504]
    mov eax, dword [eax + 0x14]
    mov edx, dword [0x6c504]
    mov eax, dword [eax]
    mov dword [edx + 0x10], eax
    mov eax, dword [0x6c504]
    mov eax, dword [eax + 0x14]
    mov edx, dword [0x6c504]
    mov eax, dword [eax + 4]
    mov dword [edx + 4], eax
    mov eax, dword [0x6c504]
    mov eax, dword [eax + 0x14]
    mov edx, dword [0x6c508]
    mov ax, word [eax + 8]
    mov word [edx + 0x28], ax
    mov eax, dword [0x6c504]
    mov dword [eax + 0xc], 0
    mov edx, dword [eax + 0xc]
    mov eax, dword [0x6c504]
    mov dword [eax + 8], edx
    mov eax, edx
    mov edx, dword [0x6c504]
    mov dword [edx], eax
    mov eax, dword [0x6c508]
    test byte [eax + 0x28], 8
    je short loc_07ba
    call 0x6dc5f
    mov edx, dword [0x6c508]
    and ah, 7
    mov word [edx + 0x1c], ax
loc_07ba:
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [0x121ecc]
    add edx, 4
    mov eax, dword [0x6c504]
    mov dword [0x121ecc], edx
    mov dword [eax + 8], 0
    mov eax, dword [0x6c504]
    mov dword [eax + 0xc], 0
    mov eax, dword [0x121ecc]
    mov edx, dword [0x6c504]
    mov eax, dword [eax]
    mov dword [edx + 0x10], eax
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea esi, [eax + 4]
    mov dword [0x121ecc], esi
    mov edx, dword [0x6c50c]
    cmp edx, dword [esi]
    setl al
    and eax, 0xff
    call 0x37ee0
    cmp dword [0x6c50c], 0x4000
    jle near loc_39d5
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp word [eax + 0x8b0c9], 0
    jne near loc_39d5
    mov word [eax + 0x8b0c9], 0x600
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov edx, eax
    mov dword [0x121ecc], eax
    mov eax, dword [0x6c50c]
    cmp eax, dword [edx]
    setg al
    and eax, 0xff
    call 0x37ee0
    cmp dword [0x6c50c], 0x4000
    jle near loc_39d5
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp word [eax + 0x8b0c9], 0
    jne near loc_39d5
    mov word [eax + 0x8b0c9], 0x600
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [eax + 4]
    mov dword [0x121ecc], eax
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov dword [0x121ecc], eax
    mov edx, dword [0x6c508]
    mov ax, word [eax]
    add word [edx + 0x2a], ax
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea edi, [eax + 4]
    mov dword [0x121ecc], edi
    mov edx, dword [0x6c508]
    mov ax, word [edi]
    mov word [edx + 0x2a], ax
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov edi, dword [0x125d47]
    mov dword [0x121ecc], eax
    cmp edi, 1
    jl near loc_09fd
    cmp dword [0x1261df], 1
    jle near loc_09fd
    cmp dword [eax], 0
    jne near loc_0a10
    movsx ebx, word [0x6c6ee]
    xor esi, esi
    jmp short loc_09a4
loc_0988:
    db 0x8d, 0x14, 0x75, 0x00, 0x00, 0x00, 0x00    ; lea edx, [esi*2]
    add edx, eax
    mov eax, dword [0x6c508]
    mov dx, word [edx + 0xf1a7c]
    cmp dx, word [eax + 0xe]
    je short loc_09c1
    inc esi
loc_09a4:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    add eax, eax
    movsx edx, word [eax + 0xf1a9c]
    cmp esi, edx
    jl short loc_0988
loc_09c1:
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x9c, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a9c]
    cmp esi, eax
    jge short loc_09fd
    mov eax, dword [0x6c508]
    mov si, word [0x6c6ec]
    cmp si, word [eax + 0x1e]
    jne short loc_09fd
    mov eax, 1
    jmp short loc_09ff
loc_09fd:
    xor eax, eax
loc_09ff:
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0a10:
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0x83, 0x3c, 0x45, 0x9c, 0x1a, 0x0f, 0x00, 0x10    ; cmp word [eax*2 + 0xf1a9c], 0x10
    jge near loc_39d5
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ax, word [edx + 0xf1a9c]
    cwde
    movsx ebx, word [0x6c6ee]
    db 0x8d, 0x0c, 0x45, 0x00, 0x00, 0x00, 0x00    ; lea ecx, [eax*2]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    mov esi, dword [0x6c508]
    lea eax, [eax*4]
    mov di, word [edx + 0xf1a9c]
    sub eax, ebx
    inc edi
    add eax, eax
    mov word [edx + 0xf1a9c], di
    add ecx, eax
    mov ax, word [esi + 0xe]
    mov word [ecx + 0xf1a7c], ax
    mov dx, word [0x6c6ec]
    mov ax, word [esi + 0x1e]
    cmp ax, dx
    sete al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov edx, dword [0x6c508]
    mov dword [0x121ecc], eax
    cmp word [edx + 0xe], 0x214
    jne short loc_0af4
    movsx ebx, word [edx + 0x22]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x8a, 0x04, 0x45, 0x0c, 0x1b, 0x0f, 0x00    ; mov al, byte [eax*2 + 0xf1b0c]
    jmp short loc_0b13
loc_0af4:
    movsx ebx, word [0x6c6ec]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov al, byte [eax + 0x8b0c3]
loc_0b13:
    mov byte [edx + 0x11], al
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    xor edx, edx
    mov word [eax + 0x8b0c3], dx
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov edx, dword [0x6c508]
    mov dword [0x121ecc], eax
    movsx edx, word [edx + 0x22]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    add eax, 0xf1720
    call 0x48760
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov esi, dword [0x1261df]
    mov dword [0x121ecc], eax
    cmp esi, 1
    jle short loc_0bda
    mov eax, dword [0x6c508]
    cmp word [eax + 0xe], 0x214
    jne short loc_0bda
    movsx edx, word [0x57d28]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xf1a72], 0
    jne near loc_39d5
    mov word [eax + 0xf1a72], 0xe
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0bda:
    mov eax, dword [0x6c508]
    cmp word [eax + 0xe], 0x214
    je near loc_39d5
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xf1a72], 0
    jne near loc_39d5
    mov word [eax + 0xf1a72], 0xe
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ecx, dword [0x121ecc]
    add ecx, 4
    mov eax, dword [0x6c508]
    mov dword [0x121ecc], ecx
    mov al, byte [eax + 0x14]
    and eax, 0xff
    mov ebx, dword [ecx]
    sub ebx, eax
    add ebx, ebx
    mov edx, dword [0x6c508]
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    add byte [edx + 0x14], al
    mov esi, dword [0x121ecc]
    add esi, 4
    mov eax, dword [0x6c508]
    mov dword [0x121ecc], esi
    cmp word [eax + 0xe], 0x214
    jne short loc_0c7c
    cmp byte [eax + 0x15], 0x24
    jb short loc_0cd5
loc_0c7c:
    mov edx, dword [0x6c508]
    xor eax, eax
    mov ebx, dword [0x121ecc]
    mov al, byte [edx + 0x15]
    cmp eax, dword [ebx]
    jg short loc_0cd5
    movsx edx, word [edx + 0xe]
    db 0x0f, 0xbf, 0x14, 0x55, 0x34, 0xc3, 0x23, 0x00    ; movsx edx, word [edx*2 + 0x23c334]
    add edx, 8
    imul eax, edx
    movsx edx, word [0x6c6ec]
    lea ebx, [eax*4]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [eax + 0x8b0cb]
    sub eax, dword [edx + 0x8b0cf]
    cmp ebx, eax
    jge short loc_0d09
loc_0cd5:
    mov esi, dword [0x6c508]
    mov eax, dword [0x121ecc]
    movzx esi, byte [esi + 0x15]
    mov eax, dword [eax]
    sub eax, esi
    add eax, eax
    mov esi, eax
    test eax, eax
    jns short loc_0cf2
    neg eax
loc_0cf2:
    test eax, eax
    je short loc_0d09
    mov ebx, esi
    mov edx, dword [0x6c508]
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    add byte [edx + 0x15], al
loc_0d09:
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov dword [0x121ecc], eax
    mov edx, dword [0x6c508]
    mov al, byte [eax]
    mov byte [edx + 0x14], al
    mov ebx, dword [0x121ecc]
    add ebx, 4
    mov dword [0x121ecc], ebx
    mov eax, dword [0x6c508]
    mov dl, byte [ebx]
    mov byte [eax + 0x15], dl
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ecx, [eax + 4]
    mov dword [0x121ecc], ecx
    movsx eax, word [0x6c6ec]
    movsx edx, word [ecx]
    call 0x45b50
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ecx, [eax + 4]
    mov dword [0x121ecc], ecx
    lea esi, [ecx + 4]
    mov dword [0x121ecc], esi
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ecx, [eax + 4]
    mov dword [0x121ecc], ecx
    imul eax, dword [ecx], 0xd
    cmp dword [eax + 0x123fd9], 0
    jle short loc_0dc1
    movsx eax, word [ecx]
    call 0x581a0
loc_0dc1:
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea esi, [eax + 4]
    mov dword [0x121ecc], esi
    lea edi, [esi + 4]
    mov dword [0x121ecc], edi
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebp, [eax + 4]
    mov dword [0x121ecc], ebp
    lea eax, [ebp + 4]
    mov dword [0x121ecc], eax
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    mov ecx, dword [0x121ecc]
    lea eax, [eax*4]
    add ecx, 4
    sub eax, edx
    mov edi, 0x1a
    mov dword [0x121ecc], ecx
    db 0x66, 0x89, 0x3c, 0x45, 0x36, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a36], di
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [0x7c1c]
    add eax, 4
    add edx, 0x64
    mov dword [0x121ecc], eax
    mov dword [0x7c1c], edx
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ebx, dword [0x7c20]
    add eax, 4
    add ebx, 0x64
    mov dword [0x121ecc], eax
    mov dword [0x7c20], ebx
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ebx, dword [0x6c508]
    mov esi, dword [0x121ecc]
    movsx eax, word [0x6c6ec]
    add esi, 4
    mov edi, dword [eax*4 + 0x26fd8]
    mov dword [0x121ecc], esi
    cmp edi, 0x3e8
    jne short loc_0edb
    movsx eax, word [0x6c6ec]
    movsx edx, word [0x6c6ec]
    mov eax, dword [eax*4 + 0x16cd8]
    mov dword [edx*4 + 0x26fd8], eax
loc_0edb:
    movsx eax, word [0x6c6ec]
    cmp dword [eax*4 + 0x1efd8], 1
    jne near loc_0fbb
    mov eax, dword [0x6c508]
    mov ax, word [eax + 0xe]
    cmp ax, 0xa3a
    jb short loc_0f5d
    jbe near loc_0f8d
    cmp ax, 0xc3a
    jb short loc_0f3b
    jbe near loc_0f8d
    cmp ax, 0xd3a
    jb short loc_0f2c
    jbe near loc_0f8d
    cmp ax, 0xd3c
    je near loc_0f9d
    jmp near loc_0fab
loc_0f2c:
    cmp ax, 0xc3c
    je near loc_0f9d
    jmp near loc_0fab
loc_0f3b:
    cmp ax, 0xb3a
    jb short loc_0f52
    jbe short loc_0f8d
    cmp ax, 0xb3c
    je near loc_0f9d
    jmp near loc_0fab
loc_0f52:
    cmp ax, 0xa3c
    je short loc_0f9d
    jmp near loc_0fab
loc_0f5d:
    cmp ax, 0x33a
    jb short loc_0f7d
    jbe short loc_0f8d
    cmp ax, 0x93a
    jb short loc_0f75
    jbe short loc_0f8d
    cmp ax, 0x93c
    je short loc_0f9d
    jmp short loc_0fab
loc_0f75:
    cmp ax, 0x33c
    je short loc_0f9d
    jmp short loc_0fab
loc_0f7d:
    cmp ax, 0x23a
    jb short loc_0fab
    jbe short loc_0f8d
    cmp ax, 0x23c
    je short loc_0f9d
    jmp short loc_0fab
loc_0f8d:
    movsx eax, word [0x6c6ec]
    inc dword [eax*4 + 0x26fd8]
    jmp short loc_0fab
loc_0f9d:
    movsx eax, word [0x6c6ec]
    dec dword [eax*4 + 0x26fd8]
loc_0fab:
    movsx eax, word [0x6c6ec]
    xor esi, esi
    mov dword [eax*4 + 0x1efd8], esi
loc_0fbb:
    movsx eax, word [0x6c6ec]
    cmp dword [eax*4 + 0x26fd8], -1
    jne near loc_1067
    mov ecx, 0x7fffffff
    xor esi, esi
loc_0fd7:
    cmp esi, 0x12c
    jg near loc_104e
    inc esi
    mov edx, 0xffffffff
    movsx eax, si
    call 0x19210
    mov word [ebx + 0x1e], ax
    cwde
    cmp eax, -1
    jne short loc_101e
    cmp esi, 0x64
    jge short loc_1007
    mov esi, 0x64
    jmp short loc_101e
loc_1007:
    cmp esi, 0xc8
    jge short loc_1016
    mov esi, 0xc8
    jmp short loc_101e
loc_1016:
    cmp esi, 0x12c
    jg short loc_104e
loc_101e:
    movsx edx, word [ebx + 0x1e]
    imul edx, edx, 0x2c
    movsx eax, word [0x6c6ec]
    imul eax, eax, 0x2c
    add edx, 0x2522b4
    add eax, 0x2522b4
    call 0x50a50
    cmp ecx, eax
    jle short loc_0fd7
    movsx edx, word [ebx + 0x1e]
    mov ecx, eax
    mov dword [esp], edx
    jmp short loc_0fd7
loc_104e:
    imul edx, dword [esp], 0x2c
    movsx eax, word [0x6c6ec]
    movsx edx, word [edx + 0x2522da]
    mov dword [eax*4 + 0x26fd8], edx
loc_1067:
    movsx eax, word [0x6c6ec]
    mov edx, 0xffffffff
    movsx eax, word [eax*4 + 0x26fd8]
    call 0x19210
    mov word [ebx + 0x1e], ax
    cwde
    cmp eax, -1
    je near loc_39d5
    imul eax, eax, 0x2c
    mov edx, 0x2522b4
    add edx, eax
    mov eax, ebx
    call 0x50a50
    cmp dword [0x2e9ac], 0x2554
    jne short loc_10b4
    cmp eax, 0xfa
    jge short loc_10cd
    jmp short loc_10bb
loc_10b4:
    cmp eax, 0xfa
    jge short loc_10cd
loc_10bb:
    movsx eax, word [0x6c6ec]
    mov dword [eax*4 + 0x1efd8], 1
loc_10cd:
    movsx eax, word [ebx + 0x1e]
    mov dword [esp], eax
    mov eax, dword [esp]
    mov word [ebx + 0x1e], ax
    imul ecx, dword [esp], 0x2c
    mov edx, dword [ebx + 4]
    mov eax, dword [ecx + 0x2522b8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [ecx + 0x2522b4]
    sub eax, dword [ebx]
    call 0x62b58
    mov word [ebx + 0x1c], ax
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [0x121ecc]
    add edx, 4
    mov al, 1
    mov dword [0x121ecc], edx
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    mov ebp, dword [0x121ecc]
    lea eax, [eax*4]
    add ebp, 4
    sub eax, edx
    mov dword [0x121ecc], ebp
    lea edx, [eax + eax]
    mov eax, dword [ebp]
    movsx edx, word [edx + eax*2 + 0xf19c6]
    cmp edx, dword [eax*4 + 0x123a00]
    jl short loc_1174
    mov byte [0x126239], 2
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1174:
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    movsx ebx, word [ebp + 4]
    add edx, eax
    movsx eax, word [ebp]
    call 0x27980
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0x83, 0x3c, 0x45, 0x32, 0x1a, 0x0f, 0x00, 0x00    ; cmp word [eax*2 + 0xf1a32], 0
    jne short loc_121d
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0x121ecc]
    add eax, eax
    add eax, dword [edx]
    cmp byte [eax + 0xf1af3], 0
    je short loc_121d
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov ebx, dword [0x121ecc]
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    movsx ebx, word [ebx]
    add eax, edx
    mov edx, ebx
    call 0x279d0
loc_121d:
    add dword [0x121ecc], 8
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea edi, [eax + 4]
    mov dword [0x121ecc], edi
    mov eax, dword [0x6c508]
    movsx edx, word [edi]
    call 0x28be0
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov dword [0x121ecc], eax
    mov edx, dword [eax]
    mov eax, dword [0x6c508]
    call 0x28c60
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    movsx edx, word [0x6c6ec]
    mov dword [0x121ecc], eax
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    add ebx, 4
    mov edx, eax
    mov ax, word [ebx - 4]
    mov dword [0x121ecc], ebx
    mov word [edx + 0x8b0c9], ax
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov dword [0x121ecc], eax
    mov edx, dword [eax]
    mov eax, dword [0x6c508]
    call 0x28ce0
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0x121ecc]
    add edx, 4
    mov dword [0x121ecc], edx
    mov dl, byte [edx]
    db 0x00, 0x14, 0x45, 0x14, 0x1b, 0x0f, 0x00    ; add byte [eax*2 + 0xf1b14], dl
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    mov ebx, dword [0x121ecc]
    lea eax, [eax*8]
    add ebx, 4
    sub eax, edx
    mov esi, 0xffffffff
    mov dword [0x121ecc], ebx
    mov word [eax + 0x8b0c5], si
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebx, [eax + 4]
    mov dword [0x121ecc], ebx
    movsx eax, word [0x6c6ec]
    movsx edx, word [ebx]
    call 0x26bc0
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ch, 1
    lea edx, [eax + 4]
    mov byte [0x126239], ch
    mov dword [0x121ecc], edx
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    mov esi, dword [0x121ecc]
    sub eax, edx
    add esi, 4
    lea eax, [eax*4]
    mov dword [0x121ecc], esi
    sub eax, edx
    mov edi, dword [esi]
    lea edx, [eax + eax]
    add edx, edi
    cmp byte [edx + 0xf1af3], 0
    jne short loc_1405
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    movsx ebx, word [esi]
    add eax, edx
    mov edx, ebx
    call 0x279d0
    jmp short loc_1445
loc_1405:
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [edi + edi]
    mov ebp, dword [edi*4 + 0x123a00]
    movsx edx, word [edx + eax*2 + 0xf19c6]
    cmp edx, ebp
    jl short loc_1445
    mov byte [0x126239], 2
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1445:
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov ecx, dword [0x121ecc]
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    movsx ebx, word [ecx + 4]
    add edx, eax
    movsx eax, word [ecx]
    call 0x27980
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xf1a32], 0
    jne short loc_14b9
    mov edx, dword [0x121ecc]
    mov ebx, dword [edx]
    cmp byte [ebx + eax + 0xf1af3], 0
    je short loc_14b9
    add eax, 0xf1720
    movsx edx, word [edx]
    call 0x279d0
loc_14b9:
    add dword [0x121ecc], 8
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebx, [eax + 4]
    mov dword [0x121ecc], ebx
    mov ecx, dword [ebx]
    push ecx
    mov eax, 0x2560
    push eax
    call 0x9fc44
    mov esi, dword [0x121ecc]
    add esi, 4
    add esp, 8
    mov dword [0x121ecc], esi
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    movsx edx, word [0x6c6ee]
    mov dword [0x121ecc], eax
    mov ebx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ax, word [ebx]
    mov word [edx + 0xf1a78], ax
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    mov esi, 0xffffffff
    lea eax, [eax*4]
    mov ch, 1
    sub eax, edx
    mov edx, ebx
    mov byte [0x12577f], ch
    add edx, 4
    db 0x66, 0x89, 0x34, 0x45, 0x7a, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a7a], si
    mov dword [0x121ecc], edx
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0x121ecc]
    add edx, 4
    db 0x66, 0x8b, 0x34, 0x45, 0x3e, 0x1a, 0x0f, 0x00    ; mov si, word [eax*2 + 0xf1a3e]
    mov dword [0x121ecc], edx
    test si, si
    jl near loc_1781
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ee]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    mov edi, 0xffffffff
    sub ebx, edx
    movsx edx, word [0x6c6ee]
    db 0x66, 0x89, 0x3c, 0x45, 0x3e, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a3e], di
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    add ebx, ebx
    sub eax, edx
    mov edx, dword [ebx + 0xf1958]
    db 0x89, 0x14, 0x45, 0x34, 0x19, 0x0f, 0x00    ; mov dword [eax*2 + 0xf1934], edx
    movsx edx, word [0x6c6ee]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add ebx, ebx
    lea edx, [eax + eax]
    mov eax, dword [ebx + 0xf195c]
    mov dword [edx + 0xf1938], eax
    movsx edx, word [0x6c6ee]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add ebx, ebx
    lea edx, [eax + eax]
    mov eax, dword [ebx + 0xf1960]
    mov dword [edx + 0xf193c], eax
    movsx edx, word [0x6c6ee]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    add ebx, ebx
    sub eax, edx
    mov dx, word [ebx + 0xf19ba]
    db 0x66, 0x89, 0x14, 0x45, 0xb8, 0x19, 0x0f, 0x00    ; mov word [eax*2 + 0xf19b8], dx
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    add eax, edx
    movsx edx, word [0x6c6ee]
    lea ebx, [eax + 0x29e]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x8b, 0x0c, 0x45, 0x38, 0x19, 0x0f, 0x00    ; mov ecx, dword [eax*2 + 0xf1938]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, ecx
    db 0x8b, 0x04, 0x45, 0x34, 0x19, 0x0f, 0x00    ; mov eax, dword [eax*2 + 0xf1934]
    call 0x6be57
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    add eax, edx
    call 0x45230
    movsx esi, word [0x2d6bd4]
loc_175c:
    test esi, esi
    jl short loc_1781
    imul eax, esi, 0x2c
    cmp word [eax + 0x2522c2], 0x26d
    jne short loc_1777
    xor ebx, ebx
    mov word [eax + 0x2522d6], bx
loc_1777:
    db 0x0f, 0xbf, 0x34, 0x75, 0xb4, 0x0e, 0x24, 0x00    ; movsx esi, word [esi*2 + 0x240eb4]
    jmp short loc_175c
loc_1781:
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    movsx esi, word [eax + 0x2522de]
    mov eax, dword [0x6c508]
    cmp word [eax + 0xe], 0x64
    je short loc_17ff
    cmp esi, dword [0x123a44]
    jle short loc_17dc
    mov eax, dword [0x121ecc]
    cmp dword [eax], 0
    jle short loc_17dc
    add eax, 4
    mov dword [0x121ecc], eax
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_17dc:
    test esi, esi
    jle short loc_17e7
    mov eax, dword [0x121ecc]
    add esi, dword [eax]
loc_17e7:
    mov ecx, dword [0x123a44]
    cmp esi, ecx
    jle short loc_1817
    mov eax, dword [0x121ecc]
    cmp dword [eax], 0
    jle short loc_1817
    mov esi, ecx
    jmp short loc_1817
loc_17ff:
    test esi, esi
    jle short loc_180a
    mov eax, dword [0x121ecc]
    add esi, dword [eax]
loc_180a:
    mov eax, dword [0x123a44]
    add eax, eax
    cmp esi, eax
    jle short loc_1817
    mov esi, eax
loc_1817:
    test esi, esi
    jge short loc_181d
    xor esi, esi
loc_181d:
    cmp byte [0x12577c], 0
    jne short loc_1878
    mov eax, dword [0x121ecc]
    cmp dword [eax], 0
    jle short loc_184f
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0x89, 0x34, 0x45, 0xc2, 0x19, 0x0f, 0x00    ; mov word [eax*2 + 0xf19c2], si
loc_184f:
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    mov word [eax + 0x2522de], si
loc_1878:
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea edx, [eax + 8]
    mov eax, dword [eax + 4]
    mov dword [0x121ecc], eax
loc_1896:
    call loc_0008
    test al, al
    je short loc_1896
    mov dword [0x121ecc], edx
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebx, [eax + 4]
    mov dword [0x121ecc], ebx
loc_18ba:
    call loc_0008
    test al, al
    jne near loc_39d5
    jmp short loc_18ba
    mov eax, dword [0x6c504]
    mov dword [eax], 0
    mov ecx, dword [0x121ecc]
    add ecx, 4
    mov dword [0x121ecc], ecx
    mov edx, dword [0x6c504]
    mov eax, dword [ecx]
    mov dword [edx + 4], eax
    mov esi, dword [0x121ecc]
    add esi, 4
    mov dword [0x121ecc], esi
    mov edx, dword [0x6c508]
    mov ax, word [esi]
    mov word [edx + 0x28], ax
    mov edi, dword [0x121ecc]
    add edi, 4
    mov eax, dword [0x6c508]
    mov dword [0x121ecc], edi
    test byte [eax + 0x28], 8
    je near loc_39d5
    call 0x6dc5f
    mov edx, dword [0x6c508]
    and ah, 7
    mov word [edx + 0x1c], ax
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ebp, dword [0x121ecc]
    add ebp, 4
    mov eax, dword [0x6c508]
    mov dword [0x121ecc], ebp
    mov di, word [eax + 0x18]
    test di, di
    jl short loc_197a
    cmp di, 0x400
    jge short loc_197a
    movsx eax, word [0x6c6ec]
    movsx edx, word [ebp]
    call 0x19680
loc_197a:
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    mov ebp, dword [0x121ecc]
    add eax, edx
    add ebp, 4
    lea eax, [eax*8]
    mov dword [0x121ecc], ebp
    sub eax, edx
    mov ebx, dword [ebp]
    movsx eax, word [eax + 0x8b0b9]
    cmp eax, ebx
    sete al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ebx, dword [0x121ecc]
    add ebx, 4
    mov eax, dword [0x6c504]
    mov dword [0x121ecc], ebx
    mov eax, dword [eax + 0x14]
    cmp eax, dword [ebx]
    sete al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov esi, dword [0x121ecc]
    add esi, 4
    mov eax, dword [0x6c504]
    mov dword [0x121ecc], esi
    mov eax, dword [eax + 0x10]
    cmp eax, dword [esi]
    sete al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebx, [eax + 4]
    mov edx, dword [0x6c504]
    mov dword [0x121ecc], ebx
    mov edx, dword [edx + 8]
    cmp edx, dword [ebx]
    setge al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [0x121ecc]
    add edx, 4
    mov eax, dword [0x6c504]
    mov dword [0x121ecc], edx
    mov dword [eax + 8], 0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea edi, [eax + 4]
    mov dword [0x121ecc], edi
    mov edx, dword [0x6c504]
    movsx eax, word [edi]
    mov dword [edx], eax
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov dword [0x121ecc], eax
    mov edx, dword [0x6c508]
    mov ax, word [eax]
    or word [edx + 0xc], ax
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov dword [0x121ecc], eax
    mov edx, dword [0x6c508]
    mov al, byte [eax]
    mov byte [edx + 0x12], al
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ecx, [eax + 4]
    mov dword [0x121ecc], ecx
    mov edx, dword [0x6c508]
    mov ax, word [ecx]
    mov word [edx + 0xc], ax
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [0x121ecc]
    add edx, 4
    mov eax, dword [0x6c504]
    mov dword [0x121ecc], edx
    mov eax, dword [eax + 4]
    cmp eax, dword [edx]
    sete al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebp, [eax + 4]
    mov eax, dword [0x1261df]
    mov dword [0x121ecc], ebp
    cmp eax, 2
    jge short loc_1be6
    cmp word [0x9058], 0
    jl short loc_1bbb
    cmp dword [0x1261a7], 2
    je short loc_1bbb
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x01    ; mov byte [eax*2 + 0xf1ac2], 1
    xor dh, dh
    mov byte [0x353ac9], dh
    mov eax, 0x3a98
    call 0x3c5f0
    jmp short loc_1bda
loc_1bbb:
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x20    ; mov byte [eax*2 + 0xf1ac2], 0x20
loc_1bda:
    mov byte [0x126239], 2
    jmp near loc_2298
loc_1be6:
    movsx eax, word [0x6c6ee]
    call 0x4deb0
    movsx edx, word [0x6c6ee]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    add ebx, ebx
    sub eax, edx
    mov edx, dword [ebx + 0xf1934]
    mov ebx, edx
    db 0x89, 0x14, 0x45, 0x58, 0x19, 0x0f, 0x00    ; mov dword [eax*2 + 0xf1958], edx
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ec]
    db 0x89, 0x1c, 0x45, 0x50, 0x19, 0x0f, 0x00    ; mov dword [eax*2 + 0xf1950], ebx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x6c508]
    mov dword [eax + 0x8b0db], ebx
    mov eax, ebx
    mov dword [edx], eax
    movsx edx, word [0x6c6ee]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    add ebx, ebx
    sub eax, edx
    mov edx, dword [ebx + 0xf1938]
    movsx ebx, word [0x6c6ee]
    db 0x89, 0x14, 0x45, 0x5c, 0x19, 0x0f, 0x00    ; mov dword [eax*2 + 0xf195c], edx
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov ebx, edx
    db 0x89, 0x14, 0x45, 0x54, 0x19, 0x0f, 0x00    ; mov dword [eax*2 + 0xf1954], edx
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x6c508]
    mov dword [eax + 0x8b0df], ebx
    mov eax, ebx
    mov dword [edx + 4], eax
    movsx edx, word [0x6c6ee]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    add ebx, ebx
    sub eax, edx
    mov edx, dword [ebx + 0xf193c]
    mov ebx, edx
    db 0x89, 0x14, 0x45, 0x60, 0x19, 0x0f, 0x00    ; mov dword [eax*2 + 0xf1960], edx
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x6c508]
    mov dword [eax + 0x8b0df], ebx
    mov eax, ebx
    mov dword [edx + 8], eax
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, 0xf1720
    add eax, eax
    movsx edx, word [0x6c6ee]
    add ebx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x8b, 0x0c, 0x45, 0x38, 0x19, 0x0f, 0x00    ; mov ecx, dword [eax*2 + 0xf1938]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add ebx, 0x29e
    mov edx, ecx
    db 0x8b, 0x04, 0x45, 0x34, 0x19, 0x0f, 0x00    ; mov eax, dword [eax*2 + 0xf1934]
    call 0x6be57
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x8b, 0x0c, 0x45, 0x3c, 0x19, 0x0f, 0x00    ; mov ecx, dword [eax*2 + 0xf193c]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x8b, 0x1c, 0x45, 0x38, 0x19, 0x0f, 0x00    ; mov ebx, dword [eax*2 + 0xf1938]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x8b, 0x34, 0x45, 0x34, 0x19, 0x0f, 0x00    ; mov esi, dword [eax*2 + 0xf1934]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add ecx, 0x2600
    mov edx, esi
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    call 0x67ce6
    mov eax, dword [0x6c508]
    mov word [eax + 0xc], 0x101
    mov eax, dword [0x6c508]
    mov byte [eax + 0x10], 0xf4
    mov eax, dword [0x6c508]
    mov byte [eax + 0x12], 0x40
    mov eax, dword [0x6c508]
    mov byte [eax + 0x14], 0x2a
    mov eax, dword [0x6c508]
    mov byte [eax + 0x15], 0x24
    mov edx, dword [0x6c508]
    mov ax, word [0x6c6ec]
    mov word [edx + 0x1e], ax
    mov eax, dword [0x6c508]
    mov byte [eax + 0x16], 0
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0x6c508]
    db 0x8a, 0x04, 0x45, 0x0c, 0x1b, 0x0f, 0x00    ; mov al, byte [eax*2 + 0xf1b0c]
    mov byte [edx + 0x11], al
    mov eax, dword [0x6c508]
    mov dx, word [0x123a44]
    mov word [eax + 0x2a], dx
    mov ebx, edx
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x66, 0x89, 0x1c, 0x45, 0xc2, 0x19, 0x0f, 0x00    ; mov word [eax*2 + 0xf19c2], bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov edi, 0xffffffff
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x66, 0x89, 0x3c, 0x45, 0x3a, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a3a], di
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc7, 0x04, 0x45, 0x40, 0x19, 0x0f, 0x00, 0x64, 0x00, 0x00, 0x00    ; mov dword [eax*2 + 0xf1940], 0x64
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x66, 0x89, 0x3c, 0x45, 0x5e, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a5e], di
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dx, word [0x6c6ee]
    db 0x66, 0x89, 0x14, 0x45, 0xb4, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1ab4], dx
    movsx edx, dx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    xor ebx, ebx
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x66, 0x89, 0x1c, 0x45, 0x38, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a38], bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    xor ebx, ebx
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x89, 0x1c, 0x45, 0x68, 0x19, 0x0f, 0x00    ; mov dword [eax*2 + 0xf1968], ebx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x66, 0x89, 0x3c, 0x45, 0xe8, 0x19, 0x0f, 0x00    ; mov word [eax*2 + 0xf19e8], di
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dx, word [0x1239f8]
    db 0x66, 0x89, 0x14, 0x45, 0xac, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1aac], dx
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    xor esi, esi
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x66, 0x89, 0x34, 0x45, 0xa2, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1aa2], si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x89, 0x1c, 0x45, 0x94, 0x19, 0x0f, 0x00    ; mov dword [eax*2 + 0xf1994], ebx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor bl, bl
    db 0x88, 0x1c, 0x45, 0xc4, 0x1a, 0x0f, 0x00    ; mov byte [eax*2 + 0xf1ac4], bl
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x66, 0x89, 0x34, 0x45, 0x9c, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a9c], si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x66, 0x89, 0x34, 0x45, 0x4c, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a4c], si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    xor bh, bh
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x66, 0x89, 0x1c, 0x45, 0x4e, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a4e], bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    xor esi, esi
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x89, 0x34, 0x45, 0x70, 0x19, 0x0f, 0x00    ; mov dword [eax*2 + 0xf1970], esi
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x89, 0x34, 0x45, 0x6c, 0x19, 0x0f, 0x00    ; mov dword [eax*2 + 0xf196c], esi
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    xor ecx, ecx
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x66, 0x89, 0x0c, 0x45, 0xa0, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1aa0], cx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x6c6ec]
    db 0x88, 0x3c, 0x45, 0xf2, 0x1a, 0x0f, 0x00    ; mov byte [eax*2 + 0xf1af2], bh
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    mov esi, 0xffffffff
    sub eax, edx
    movsx edx, word [0x6c6ec]
    mov word [eax + 0x8b0bd], si
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dx, word [0x6c6ec]
    mov word [eax + 0x8b0bf], dx
    movsx edx, dx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    xor cl, cl
    sub eax, edx
    movsx edx, word [0x6c6ec]
    mov byte [eax + 0x8b0b8], cl
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    xor edi, edi
    sub eax, edx
    movsx edx, word [0x6c6ec]
    mov word [eax + 0x8b0c1], di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    xor edx, edx
    mov word [eax + 0x8b0c3], dx
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx edx, word [0x6c6ec]
    mov word [eax + 0x8b0c5], si
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx edx, word [0x6c6ee]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    xor ch, ch
    sub ebx, edx
    movsx edx, word [0x6c6ec]
    mov word [eax + 0x8b0c7], cx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    add ebx, ebx
    sub eax, edx
    mov dx, word [ebx + 0xf1a60]
    mov word [eax + 0x8b0bf], dx
    movsx eax, word [0x6c6ee]
    call 0x4e640
    movsx eax, word [0x6c6ee]
    xor edi, edi
    call 0x4e490
    mov dword [0x7e74], edi
    mov eax, dword [0x2d6bbc]
    mov dword [0x7e78], eax
loc_2298:
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    add eax, 0xf1720
    call 0x45230
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [0x6c508]
    movsx edx, word [edx + 0x18]
    lea eax, [edx*4]
    add edx, eax
    mov eax, dword [0x6c508]
    lea edx, [edx*8]
    mov eax, dword [eax + 8]
    sub eax, dword [edx + 0x2c9cbc]
    test eax, eax
    jns short loc_22f5
    neg eax
loc_22f5:
    cmp eax, 0x2000
    jge short loc_2320
    mov eax, dword [0x6c508]
    movsx edx, word [eax + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9cd6], 1
    jne short loc_2320
    mov eax, 1
    jmp short loc_2322
loc_2320:
    xor eax, eax
loc_2322:
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x6c508]
    movsx edx, word [eax + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9cd6], 2
    sete al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebx, [eax + 4]
    mov edx, dword [0x6c504]
    mov dword [0x121ecc], ebx
    mov edx, dword [edx]
    cmp edx, dword [ebx]
    setge al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ecx, dword [0x121ecc]
    add ecx, 4
    mov eax, dword [0x6c508]
    mov dword [0x121ecc], ecx
    movsx edx, word [eax + 0xe]
    cmp edx, dword [ecx]
    sete al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [0x121ecc]
    add edx, 4
    mov eax, dword [0x6c504]
    mov dword [0x121ecc], edx
    mov dword [eax], 0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea esi, [eax + 8]
    mov dword [0x121ecc], esi
    mov eax, dword [esi - 4]
    cmp eax, 0xa
    ja near loc_27a6
    jmp dword cs:[eax*4 + 0x280e0]
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ax, word [esi]
    mov word [edx + 0xf1aaa], ax
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xe9, 0x1a, 0x0f, 0x00, 0x02    ; mov byte [eax*2 + 0xf1ae9], 2
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dx, word [esi]
    db 0x66, 0x8b, 0x0c, 0x45, 0xac, 0x1a, 0x0f, 0x00    ; mov cx, word [eax*2 + 0xf1aac]
    add ecx, edx
    movsx edx, word [0x6c6ee]
    db 0x66, 0x89, 0x0c, 0x45, 0xac, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1aac], cx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edi, dword [0x123a44]
    db 0x0f, 0xbf, 0x04, 0x45, 0xac, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1aac]
    cmp eax, edi
    jle near loc_27a6
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ax, word [0x123a44]
    mov word [edx + 0xf1aac], ax
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ax, word [esi]
    mov word [edx + 0xf1aa6], ax
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xe9, 0x1a, 0x0f, 0x00, 0x06    ; mov byte [eax*2 + 0xf1ae9], 6
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ax, word [esi]
    mov word [edx + 0xf1a3c], ax
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xe9, 0x1a, 0x0f, 0x00, 0x03    ; mov byte [eax*2 + 0xf1ae9], 3
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dx, word [esi]
    db 0x66, 0x89, 0x14, 0x45, 0xa8, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1aa8], dx
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xe9, 0x1a, 0x0f, 0x00, 0x04    ; mov byte [eax*2 + 0xf1ae9], 4
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x6c508]
    mov al, byte [eax + 0x11]
    cmp al, 0x15
    jb short loc_261b
    jbe short loc_2655
    cmp al, 0x17
    je near loc_2687
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_261b:
    test al, al
    jne near loc_27a6
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x80, 0x0c, 0x45, 0x56, 0x1a, 0x0f, 0x00, 0x01    ; or byte [eax*2 + 0xf1a56], 1
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2655:
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x80, 0x0c, 0x45, 0x56, 0x1a, 0x0f, 0x00, 0x02    ; or byte [eax*2 + 0xf1a56], 2
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2687:
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x80, 0x0c, 0x45, 0x56, 0x1a, 0x0f, 0x00, 0x04    ; or byte [eax*2 + 0xf1a56], 4
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dx, word [esi]
    db 0x66, 0x89, 0x14, 0x45, 0x74, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a74], dx
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xe9, 0x1a, 0x0f, 0x00, 0x05    ; mov byte [eax*2 + 0xf1ae9], 5
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov cl, 1
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x88, 0x0c, 0x45, 0xe9, 0x1a, 0x0f, 0x00    ; mov byte [eax*2 + 0xf1ae9], cl
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dx, word [esi]
    db 0x66, 0x89, 0x14, 0x45, 0x5a, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a5a], dx
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov bh, 7
    sub eax, edx
    movsx edx, word [0x6c6ee]
    db 0x88, 0x3c, 0x45, 0xe9, 0x1a, 0x0f, 0x00    ; mov byte [eax*2 + 0xf1ae9], bh
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ax, word [esi]
    mov word [edx + 0xf1abc], ax
loc_27a6:
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [eax + 0x14]
    push edx
    mov ebx, dword [eax + 0x10]
    mov ecx, dword [eax + 0xc]
    push ebx
    mov edx, dword [eax + 4]
    mov ebx, dword [eax + 8]
    movsx eax, word [0x6c6ec]
    call 0x27d90
    add dword [0x121ecc], 0x18
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov edx, dword [0x6c508]
    mov dword [0x121ecc], eax
    xor esi, esi
    mov ecx, dword [eax]
    movsx edx, word [edx + 0x20]
    test cl, 8
    je short loc_2849
    movsx ebx, word [0x6c6ee]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x80, 0x3c, 0x45, 0xc8, 0x1a, 0x0f, 0x00, 0x00    ; cmp byte [eax*2 + 0xf1ac8], 0
    je short loc_2849
    movsx ebx, word [0x6c6ee]
    lea eax, [ebx*4]
    add eax, ebx
    db 0xf6, 0x04, 0x45, 0x66, 0xcc, 0x11, 0x00, 0x02    ; test byte [eax*2 + 0x11cc66], 2
    je short loc_2849
    mov esi, 1
    jmp near loc_2d59
loc_2849:
    test cl, 0x10
    je short loc_289e
    movsx ebx, word [0x6c6ee]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    add eax, eax
    cmp word [eax + 0xf1a44], 0
    jne short loc_289e
    cmp byte [eax + 0xf1ac8], 0
    jne short loc_289e
    cmp dword [eax + 0xf1974], 0x800
    jle short loc_289e
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_289e:
    test cl, 0x20
    je short loc_28de
    movsx ebx, word [0x6c6ee]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x66, 0x81, 0x3c, 0x45, 0x44, 0x1a, 0x0f, 0x00, 0x5c, 0x01    ; cmp word [eax*2 + 0xf1a44], 0x15c
    jle short loc_28de
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_28de:
    test cl, 1
    je short loc_2904
    test edx, edx
    jl short loc_2904
    cmp edx, 8
    jge short loc_2904
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2904:
    test cl, 2
    je short loc_2940
    cmp edx, 8
    jl short loc_2940
    movsx ebx, word [0x6c6ee]
    lea eax, [ebx*4]
    add eax, ebx
    db 0xf6, 0x04, 0x45, 0x66, 0xcc, 0x11, 0x00, 0x20    ; test byte [eax*2 + 0x11cc66], 0x20
    jne short loc_2940
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2940:
    test cl, 4
    je short loc_297c
    cmp edx, 8
    jl short loc_297c
    movsx ebx, word [0x6c6ee]
    lea eax, [ebx*4]
    add eax, ebx
    db 0xf6, 0x04, 0x45, 0x66, 0xcc, 0x11, 0x00, 0x20    ; test byte [eax*2 + 0x11cc66], 0x20
    je short loc_297c
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_297c:
    test cl, 0x40
    je short loc_29ca
    movsx ebx, word [0x6c6ee]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea ebx, [eax + eax]
    mov eax, dword [0x6c508]
    mov eax, dword [eax + 8]
    mov edi, dword [ebx + 0xf193c]
    sub eax, 0x3000
    cmp eax, edi
    jle short loc_29ca
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_29ca:
    test cl, 0x80
    je short loc_2a06
    cmp edx, -8
    jg short loc_2a06
    movsx ebx, word [0x6c6ee]
    lea eax, [ebx*4]
    add eax, ebx
    db 0xf6, 0x04, 0x45, 0x66, 0xcc, 0x11, 0x00, 0x20    ; test byte [eax*2 + 0x11cc66], 0x20
    jne short loc_2a06
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2a06:
    test ch, 1
    je short loc_2a42
    cmp edx, -8
    jg short loc_2a42
    movsx edx, word [0x6c6ee]
    lea eax, [edx*4]
    add eax, edx
    db 0xf6, 0x04, 0x45, 0x66, 0xcc, 0x11, 0x00, 0x20    ; test byte [eax*2 + 0x11cc66], 0x20
    je short loc_2a42
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2a42:
    test ch, 2
    je short loc_2a96
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xf1a72], 0
    jg short loc_2a7e
    cmp word [eax + 0xf1a32], 0
    jne short loc_2a96
    cmp word [eax + 0xf1a54], 0
    jle short loc_2a96
loc_2a7e:
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2a96:
    test ch, 4
    je short loc_2ade
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x2522c8], 0x20
    jae short loc_2ade
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2ade:
    test ch, 8
    je short loc_2b1c
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x80, 0x3c, 0x45, 0xeb, 0x1a, 0x0f, 0x00, 0x00    ; cmp byte [eax*2 + 0xf1aeb], 0
    je short loc_2b1c
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2b1c:
    test ch, 0x10
    je short loc_2b65
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov dx, word [eax + 0xf1aaa]
    test dx, dx
    jle short loc_2b65
    cmp dx, 0x190
    jge short loc_2b65
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2b65:
    test ch, 0x20
    je short loc_2ba3
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x80, 0x3c, 0x45, 0xc8, 0x1a, 0x0f, 0x00, 0x00    ; cmp byte [eax*2 + 0xf1ac8], 0
    je short loc_2ba3
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2ba3:
    test ch, 0x40
    je short loc_2c01
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    movsx eax, word [edx + 0xf1a60]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x2522c8], 0x20
    jbe short loc_2c01
    cmp word [eax + 0x2522de], 0
    jle short loc_2c01
    cmp word [edx + 0xf1a78], 0
    jne short loc_2c01
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2c01:
    test ch, 0x80
    je short loc_2c4a
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522de], 0
    jg short loc_2c4a
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2c4a:
    test ecx, 0x10000
    je near loc_2d59
    mov eax, dword [0x6c508]
    cmp word [eax + 0xe], 0x214
    jne short loc_2ccb
    cmp dword [0x1261df], 1
    jle short loc_2ccb
    movsx edx, word [0x6c6ee]
    mov ecx, edx
    shl ecx, 7
    sub ecx, edx
    lea ecx, [ecx*4]
    sub ecx, edx
    movsx edx, word [0x57d28]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add ecx, ecx
    lea edx, [eax + eax]
    mov ebx, dword [ecx + 0xf1938]
    mov edi, dword [edx + 0xf1938]
    mov eax, dword [ecx + 0xf1934]
    mov ebp, dword [edx + 0xf1934]
    sub ebx, edi
    sub eax, ebp
    mov edx, ebx
    call 0x62b58
    movsx edx, word [0x57d28]
    jmp short loc_2d0d
loc_2ccb:
    movsx edx, word [0x6c6ee]
    mov ecx, edx
    shl ecx, 7
    sub ecx, edx
    lea ecx, [ecx*4]
    sub ecx, edx
    mov edx, dword [0x6c508]
    add ecx, ecx
    mov eax, dword [edx + 4]
    sub eax, dword [ecx + 0xf1938]
    mov esi, dword [ecx + 0xf1934]
    mov ebx, eax
    mov eax, dword [edx]
    mov edx, ebx
    sub eax, esi
    call 0x62b58
    movsx edx, word [0x6c6ee]
loc_2d0d:
    movsx ebx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, ebx
    db 0x0f, 0xbf, 0x04, 0x45, 0xb8, 0x19, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf19b8]
    call 0x34a20
    movsx esi, ax
    cmp esi, -0x80
    jle short loc_2d57
    cmp esi, 0x80
    jge short loc_2d57
    mov esi, 1
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2d57:
    xor esi, esi
loc_2d59:
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ebp, dword [0x121ecc]
    add ebp, 4
    mov eax, dword [0x6c508]
    mov dword [0x121ecc], ebp
    movsx edx, word [eax + 0x2a]
    cmp edx, dword [ebp]
    setle al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea esi, [eax + 8]
    movsx ecx, word [0x6c6ee]
    mov dword [0x121ecc], esi
    mov eax, dword [0x6c508]
    movsx ebx, word [esi]
    movsx edx, word [esi - 4]
    call 0x28d60
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x121ecc]
    add edx, 4
    mov dword [0x121ecc], edx
    movsx eax, word [eax + 0x8b0b9]
    cmp eax, dword [edx]
    sete al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov ebp, dword [0x121ecc]
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    add ebp, 4
    add eax, edx
    mov dword [0x121ecc], ebp
    call 0x45240
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ec]
    lea ebx, [edx*8]
    add ebx, edx
    lea ebx, [ebx*8]
    sub ebx, edx
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ecx, dword [0x121ecc]
    mov edx, eax
    add ecx, 4
    mov eax, dword [ebx + 0x8b0cb]
    mov esi, dword [edx + 0x8b0cf]
    mov edx, eax
    mov dword [0x121ecc], ecx
    sub edx, esi
    mov edi, dword [ecx]
    sar edx, 8
    cmp edx, edi
    setl al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    lea eax, [edx*4]
    add eax, edx
    db 0x8b, 0x04, 0x45, 0x66, 0xcc, 0x11, 0x00    ; mov eax, dword [eax*2 + 0x11cc66]
    and eax, 0x20000000
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x6c508]
    movsx edx, word [eax + 0x18]
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + 0x2c9cc0]
    xor ah, ah
    and al, 1
    cwde
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp dword [0x1261df], 1
    setg al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edi, dword [0x121ecc]
    add edi, 4
    mov eax, dword [0x6c508]
    mov dword [0x121ecc], edi
    movsx edx, word [eax + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9cd6], 0
    jne near loc_39d5
    push 1
    push 0x300
    mov eax, 0x1213fc
    push eax
    mov eax, 0x1256c0
    mov ecx, dword [0x6c508]
    push eax
    mov eax, 0x1256c4
    mov ebx, dword [0x6c508]
    push eax
    mov eax, 0x1256be
    mov edx, dword [0x6c508]
    push eax
    mov eax, dword [0x6c508]
    movsx ecx, word [ecx + 0x18]
    movsx eax, word [eax + 0x1c]
    mov ebx, dword [ebx + 8]
    push eax
    mov eax, dword [0x6c508]
    mov edx, dword [edx + 4]
    sub ebx, 0x2000
    mov eax, dword [eax]
    call 0x696fc
    mov ax, word [0x1256be]
    test ax, ax
    jl near loc_39d5
    movsx edx, ax
    lea eax, [edx*4]
    add eax, edx
    movsx eax, word [eax*8 + 0x2c9cd6]
    call 0x509c0
    test al, al
    je near loc_39d5
    movsx edx, word [0x1256be]
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + 0x2c9cd6]
    xor ah, ah
    db 0x66, 0x3d, 0x17, 0x00    ; cmp ax, 0x17
    je short loc_305f
    movsx edx, word [0x1256be]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, word [0x1256be]
    lea eax, [edx*4]
    lea ebx, [ebx*8]
    add eax, edx
    mov edx, dword [ebx + 0x2c9cbc]
    cmp edx, dword [eax*8 + 0x2c9cb8]
    jne near loc_39d5
loc_305f:
    movsx ebx, word [0x1256be]
    lea eax, [ebx*4]
    add eax, ebx
    lea eax, [eax*8]
    test byte [eax + 0x2c9cd7], 0x40
    jne near loc_39d5
    movsx eax, word [eax + 0x2c9cd6]
    test ah, 0x80
    jne near loc_39d5
    db 0x0f, 0xbf, 0x34, 0x5d, 0xd4, 0x73, 0x2d, 0x00    ; movsx esi, word [ebx*2 + 0x2d73d4]
loc_309b:
    test esi, esi
    jl short loc_30b6
    imul eax, esi, 0x2c
    cmp word [eax + 0x2522c2], 2
    je short loc_30b6
    db 0x0f, 0xbf, 0x34, 0x75, 0xb4, 0xdf, 0x24, 0x00    ; movsx esi, word [esi*2 + 0x24dfb4]
    jmp short loc_309b
loc_30b6:
    cmp esi, -1
    jne near loc_39d5
    movsx edx, word [0x6c6ec]
    movsx eax, word [0x1256be]
    call 0x51480
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x6c508]
    movsx eax, word [eax + 0x18]
    call 0x278e0
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [0x121ecc]
    add edx, 4
    mov eax, dword [0x6c508]
    mov dword [0x121ecc], edx
    cmp word [eax + 0xe], 0x214
    je short loc_313e
    xor ebx, ebx
    movsx edx, word [0x6c6ec]
    mov bl, byte [eax + 0x11]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov word [eax + 0x8b0c3], bx
loc_313e:
    mov eax, dword [0x121ecc]
    mov edx, dword [0x6c508]
    mov al, byte [eax]
    mov byte [edx + 0x11], al
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ecx, [eax + 4]
    mov dword [0x121ecc], ecx
    mov edx, dword [0x6c508]
    mov ax, word [ecx]
    mov word [edx + 0xe], ax
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x6c508]
    call 0x371b0
    cmp al, 1
    sete al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x6c508]
    call 0x12bc0
    test ax, ax
    je short loc_31d4
    mov eax, dword [0x12619b]
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_31d4:
    mov eax, dword [0x6c508]
    call 0x12b80
    test ax, ax
    je short loc_31f9
    mov eax, dword [0x1261a3]
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_31f9:
    mov eax, dword [0x12619f]
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    mov edi, dword [0x121ecc]
    lea eax, [eax*8]
    add edi, 4
    sub eax, edx
    mov edx, dword [0x6c508]
    mov dword [0x121ecc], edi
    mov eax, dword [eax + 0x8b0cb]
    mov ebp, dword [edx + 8]
    mov edx, eax
    mov eax, dword [edi]
    sub edx, ebp
    shl eax, 8
    cmp edx, eax
    setle al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    mov ecx, dword [0x121ecc]
    sub eax, edx
    add ecx, 4
    mov edx, eax
    mov eax, dword [0x6c508]
    mov dword [0x121ecc], ecx
    mov eax, dword [eax + 8]
    mov esi, dword [edx + 0x8b0cf]
    mov edx, eax
    mov eax, dword [ecx]
    sub edx, esi
    shl eax, 8
    cmp edx, eax
    setle al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea edx, [eax + 4]
    mov dword [0x121ecc], edx
    mov ebx, edx
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add ebx, 4
    lea edx, [eax + eax]
    xor esi, esi
    mov eax, dword [ebx - 4]
    mov dword [0x121ecc], ebx
    mov dword [edx + 0xf1994], eax
    movsx ebx, word [0x6c6ee]
    jmp short loc_3332
loc_3308:
    mov eax, ebx
    shl eax, 7
    mov edi, dword [0x121ecc]
    sub eax, ebx
    add edi, 4
    lea eax, [eax*4]
    inc esi
    sub eax, ebx
    mov dl, byte [edi - 4]
    mov dword [0x121ecc], edi
    mov byte [esi + eax*2 + 0xf1b0f], dl
loc_3332:
    cmp esi, 3
    jl short loc_3308
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x2522de]
    mov eax, dword [0x121ecc]
    add eax, 4
    mov dword [0x121ecc], eax
    cmp edx, dword [eax]
    setl al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea edi, [eax + 4]
    mov dword [0x121ecc], edi
    lea ebp, [edi + 4]
    mov dword [0x121ecc], ebp
    mov eax, dword [edi]
    xor esi, esi
    cmp eax, 0xa
    ja near loc_35c1
    jmp dword cs:[eax*4 + 0x2810c]
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebp, dword [ebp]
    db 0x0f, 0xbf, 0x04, 0x45, 0xaa, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1aaa]
    cmp eax, ebp
    je near loc_35c1
    jmp near loc_35bc
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edi, dword [0x123a44]
    db 0x0f, 0xbf, 0x04, 0x45, 0xac, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1aac]
    cmp eax, edi
    je near loc_35c1
    jmp near loc_35bc
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ecx, dword [ebp]
    db 0x0f, 0xbf, 0x14, 0x45, 0xa6, 0x1a, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf1aa6]
    cmp edx, ecx
    je near loc_35c1
    jmp near loc_35bc
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [ebp]
    db 0x0f, 0xbf, 0x14, 0x45, 0x3c, 0x1a, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf1a3c]
    cmp edx, ebx
    je near loc_35c1
    jmp near loc_35bc
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebp, dword [ebp]
    db 0x0f, 0xbf, 0x14, 0x45, 0xa8, 0x1a, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf1aa8]
    cmp edx, ebp
    je near loc_35c1
    jmp near loc_35bc
    mov eax, dword [0x6c508]
    mov al, byte [eax + 0x11]
    cmp al, 0x15
    jb short loc_34c0
    jbe short loc_34f2
    cmp al, 0x17
    je short loc_351c
    jmp near loc_35c1
loc_34c0:
    test al, al
    jne near loc_35c1
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xf6, 0x04, 0x45, 0x56, 0x1a, 0x0f, 0x00, 0x01    ; test byte [eax*2 + 0xf1a56], 1
    je near loc_35c1
    jmp near loc_35bc
loc_34f2:
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xf6, 0x04, 0x45, 0x56, 0x1a, 0x0f, 0x00, 0x02    ; test byte [eax*2 + 0xf1a56], 2
    je near loc_35c1
    jmp near loc_35bc
loc_351c:
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xf6, 0x04, 0x45, 0x56, 0x1a, 0x0f, 0x00, 0x04    ; test byte [eax*2 + 0xf1a56], 4
    je near loc_35c1
    jmp near loc_35bc
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edi, dword [ebp]
    db 0x0f, 0xbf, 0x14, 0x45, 0x74, 0x1a, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf1a74]
    cmp edx, edi
    je short loc_35c1
    jmp short loc_35bc
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ecx, dword [ebp]
    db 0x0f, 0xbf, 0x14, 0x45, 0x5a, 0x1a, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf1a5a]
    cmp edx, ecx
    je short loc_35c1
    jmp short loc_35bc
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [ebp]
    db 0x0f, 0xbf, 0x14, 0x45, 0xbc, 0x1a, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf1abc]
    cmp edx, ebx
    je short loc_35c1
loc_35bc:
    mov esi, 1
loc_35c1:
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, 0xffffffff
    mov ebx, dword [0x6c508]
    mov edi, dword [0x121ecc]
    movsx eax, word [0x6c6ec]
    add edi, 4
    mov eax, dword [eax*4 + 0x26fd8]
    mov dword [0x121ecc], edi
    call 0x19250
    mov word [ebx + 0x1e], ax
    cwde
    cmp eax, -1
    je near loc_39d5
    movsx eax, word [0x6c6ec]
    lea edx, [eax*4]
    movsx eax, word [0x6c6ec]
    mov edx, dword [edx + 0x26fd8]
    mov dword [eax*4 + 0x16cd8], edx
    movsx eax, word [0x6c6ec]
    mov dword [eax*4 + 0x26fd8], 0x3e8
    movsx eax, word [0x6c6ec]
    xor edx, edx
    mov dword [eax*4 + 0x1efd8], edx
    movsx eax, word [ebx + 0x1e]
    mov dword [esp], eax
    imul edx, eax, 0x2c
    imul eax, eax, 0x2c
    mov esi, dword [ebx + 4]
    mov ebp, dword [ebx]
    mov edx, dword [edx + 0x2522b8]
    mov eax, dword [eax + 0x2522b4]
    sub edx, esi
    sub eax, ebp
    call 0x62b58
    mov word [ebx + 0x1c], ax
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x6c508]
    mov ax, word [eax + 0x18]
    mov dword [esp + 8], eax
    mov eax, dword [0x6c508]
    lea ebx, [esp + 8]
    mov edx, dword [eax + 4]
    mov eax, dword [eax]
    add edx, 0x6c
    add eax, 0x6c
    call 0x6be57
    mov edx, dword [0x6c508]
    mov eax, dword [esp + 8]
    mov cx, word [edx + 0x18]
    xor esi, esi
    cmp ax, cx
    jne near loc_3746
    mov eax, dword [0x6c508]
    lea ebx, [esp + 8]
    mov edx, dword [edx + 4]
    mov eax, dword [eax]
    sub edx, 0x6c
    sub eax, 0x6c
    call 0x6be57
    mov edx, dword [0x6c508]
    mov eax, dword [esp + 8]
    cmp ax, word [edx + 0x18]
    jne short loc_3746
    mov eax, dword [0x6c508]
    lea ebx, [esp + 8]
    mov edx, dword [edx + 4]
    mov eax, dword [eax]
    sub edx, 0x6c
    add eax, 0x6c
    call 0x6be57
    mov edx, dword [0x6c508]
    mov eax, dword [esp + 8]
    cmp ax, word [edx + 0x18]
    jne short loc_3746
    mov eax, edx
    lea ebx, [esp + 8]
    mov edx, dword [edx + 4]
    mov eax, dword [eax]
    add edx, 0x6c
    sub eax, 0x6c
    call 0x6be57
    mov edx, dword [0x6c508]
    mov eax, dword [esp + 8]
    cmp ax, word [edx + 0x18]
    jne short loc_3746
    mov esi, 1
loc_3746:
    mov eax, esi
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    mov edi, dword [0x121ecc]
    lea eax, [eax*4]
    add edi, 4
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    mov dword [0x121ecc], edi
    add edx, eax
    movsx eax, word [edi]
    call 0x15e50
    add dword [0x121ecc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x6c508]
    movsx eax, word [eax + 0x18]
    call 0x27930
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx eax, word [eax + 0x8b0c1]
    and eax, 0xc000
    cmp eax, 0x4000
    setg al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov esi, dword [0x121ecc]
    add esi, 4
    mov eax, dword [0x6c508]
    mov dword [0x121ecc], esi
    mov ax, word [eax + 0xe]
    cmp ax, 0x52b
    jb short loc_3872
    jbe near loc_38a0
    cmp ax, 0x538
    jb short loc_385b
    jbe near loc_38a0
    cmp ax, 0xd7a
    jb short loc_3850
    jbe near loc_38a0
    cmp ax, 0x1300
    je near loc_38a0
    jmp near loc_38c6
loc_3850:
    cmp ax, 0x573
    je short loc_38a0
    jmp near loc_38c6
loc_385b:
    cmp ax, 0x52d
    jb near loc_38c6
    jbe short loc_38a0
    cmp ax, 0x536
    je short loc_38a0
    jmp near loc_38c6
loc_3872:
    cmp ax, 0x50e
    jb short loc_3892
    jbe short loc_38a0
    cmp ax, 0x525
    jb short loc_388a
    jbe short loc_38a0
    cmp ax, 0x529
    je short loc_38a0
    jmp short loc_38c6
loc_388a:
    cmp ax, 0x520
    je short loc_38a0
    jmp short loc_38c6
loc_3892:
    cmp ax, 0x25b
    jb short loc_38c6
    jbe short loc_38a0
    cmp ax, 0x2f1
    jne short loc_38c6
loc_38a0:
    mov eax, dword [0x6c508]
    mov dx, word [eax + 0x22]
    test dx, dx
    je near loc_39d5
    movsx eax, dx
    call 0x52360
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_38c6:
    mov eax, dword [0x6c508]
    mov bx, word [eax + 0x28]
    test bx, bx
    jl near loc_39d5
    movsx eax, bx
    call 0x52360
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [0x121ecc]
    add edx, 4
    mov eax, dword [0x6c508]
    mov dword [0x121ecc], edx
    xor edx, edx
    mov dl, byte [eax + 0x11]
    mov eax, dword [0x121ecc]
    cmp edx, dword [eax]
    sete al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    movsx edx, word [0x6c6ee]
    mov dword [0x121ecc], eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    mov ebx, dword [0x6c508]
    lea eax, [eax*4]
    movsx ebx, word [ebx + 0x1c]
    sub eax, edx
    mov edx, ebx
    db 0x0f, 0xbf, 0x04, 0x45, 0xb8, 0x19, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf19b8]
    call 0x34a20
    cwde
    test eax, eax
    jns short loc_3964
    neg eax
loc_3964:
    mov edx, dword [0x121ecc]
    cmp eax, dword [edx]
    setle al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov esi, 1
    mov bx, word [0x6c6ec]
    jmp short loc_39a7
loc_3993:
    lea eax, [esi*4]
    sub eax, esi
    cmp bx, word [eax*8 + 0xe79c8]
    je short loc_39af
    inc esi
loc_39a7:
    cmp esi, 0x1c2
    jl short loc_3993
loc_39af:
    cmp esi, 0x1c2
    sete al
    and eax, 0xff
    call 0x37ee0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_39ce:
    mov byte [0x126239], 1
loc_39d5:
    xor al, al
loc_39d7:
    add esp, 0xc
    pop ebp
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
    push edx
    push esi
    sub esp, 4
    mov edx, dword [0x6c508]
    mov ax, word [edx + 0x18]
    mov dword [esp], eax
    mov ebx, esp
    mov eax, dword [edx + 4]
    mov esi, dword [edx]
    add eax, 0x6c
    add esi, 0x6c
    mov edx, eax
    mov eax, esi
    call 0x6be57
    mov edx, dword [0x6c508]
    mov eax, dword [esp]
    mov bx, word [edx + 0x18]
    xor ecx, ecx
    cmp ax, bx
    jne short loc_3a96
    mov ebx, esp
    mov esi, dword [edx + 4]
    mov eax, dword [edx]
    sub esi, 0x6c
    sub eax, 0x6c
    mov edx, esi
    call 0x6be57
    mov edx, dword [0x6c508]
    mov eax, dword [esp]
    cmp ax, word [edx + 0x18]
    jne short loc_3a96
    mov ebx, esp
    mov eax, dword [edx + 4]
    mov esi, dword [edx]
    sub eax, 0x6c
    add esi, 0x6c
    mov edx, eax
    mov eax, esi
    call 0x6be57
    mov edx, dword [0x6c508]
    mov eax, dword [esp]
    cmp ax, word [edx + 0x18]
    jne short loc_3a96
    mov ebx, esp
    mov esi, dword [edx + 4]
    mov eax, dword [edx]
    add esi, 0x6c
    sub eax, 0x6c
    mov edx, esi
    call 0x6be57
    mov edx, dword [0x6c508]
    mov eax, dword [esp]
    cmp ax, word [edx + 0x18]
    jne short loc_3a96
    mov ecx, 1
loc_3a96:
    mov eax, ecx
    add esp, 4
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 4
    mov edi, eax
    movsx esi, ax
    imul esi, esi, 0x2c
    mov ecx, 0xfffb
    xor ebx, ebx
    add esi, 0x2522b4
    jmp near loc_3b3f
loc_3ac9:
    mov eax, esi
    call 0x16ec0
    test eax, eax
    je short loc_3b02
    movsx edx, bx
    imul edx, edx, 0x2c
    add edx, 0x2522b4
    mov eax, edx
    call 0x16e70
    test eax, eax
    je short loc_3b02
    movsx eax, di
    imul eax, eax, 0x2c
    add eax, 0x2522b4
    call 0x50a50
    cwde
    cmp ecx, eax
    jle short loc_3b3e
    jmp short loc_3b39
loc_3b02:
    mov eax, esi
    call 0x16e70
    test eax, eax
    je short loc_3b3e
    movsx edx, bx
    imul edx, edx, 0x2c
    add edx, 0x2522b4
    mov eax, edx
    call 0x16ec0
    test eax, eax
    je short loc_3b3e
    movsx eax, di
    imul eax, eax, 0x2c
    add eax, 0x2522b4
    call 0x50a50
    cwde
    cmp ecx, eax
    jle short loc_3b3e
loc_3b39:
    mov dword [esp], ebx
    mov ecx, eax
loc_3b3e:
    inc ebx
loc_3b3f:
    cmp bx, 0x1000
    jl short loc_3ac9
    cmp ecx, 0xfffb
    jne short loc_3b55
    mov eax, 0xffffffff
    jmp short loc_3b58
loc_3b55:
    mov eax, dword [esp]
loc_3b58:
    add esp, 4
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
%else
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
loc_0008:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0xc
    cmp byte [0xe9839], 0
    je short loc_0021
    mov al, 1
    jmp near loc_3a9c
loc_0021:
    mov eax, dword [0xe54cc]
    mov edx, dword [eax]
    sub edx, 2
    cmp edx, 0x73
    ja near loc_3a93
    jmp dword cs:[edx*4 + 0x2aca0]
    lea ebx, [eax + 4]
    mov dword [0xe54cc], ebx
    call 0x7079f
    mov edx, dword [0xe54cc]
    mov ebx, 0xff
    mov ecx, dword [edx]
    mov edx, ebx
    sar eax, 8
    sub edx, ecx
    cmp eax, edx
    setge al
    and eax, ebx
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp dword [0x3bcec], 0x400
    jle near loc_01dc
    mov eax, dword [0x3bce8]
    call 0x12be0
    test ax, ax
    je short loc_00ac
    mov eax, dword [0x3bce8]
    cmp byte [eax + 0x14], 0x38
    jbe short loc_00ac
    mov ebx, 0xc0c
    mov esi, 0x30
    jmp short loc_00b6
loc_00ac:
    mov ebx, 0x300
    mov esi, 0x10
loc_00b6:
    lea edx, [esp + 8]
    movsx eax, word [0x3becc]
    call 0x48170
    cmp eax, 0x40000000
    jne short loc_00e3
    mov eax, 1
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_00e3:
    movsx edx, bx
    cmp eax, edx
    jle near loc_01c7
    mov edi, dword [esp + 8]
    test di, di
    jl short loc_0117
    movsx eax, di
    imul eax, eax, 0x2c
    mov edx, dword [0x3bce8]
    mov cx, word [edx + 0xe]
    cmp cx, word [eax + 0x1c0bb2]
    jne short loc_0117
    xor esi, esi
    jmp near loc_01e1
loc_0117:
    mov eax, dword [0x3bce8]
    add word [eax + 0x1c], si
    lea edx, [esp + 8]
    movsx eax, word [0x3becc]
    call 0x48170
    mov edx, eax
    mov eax, dword [0x3bce8]
    sub word [eax + 0x1c], si
    movsx eax, bx
    cmp edx, eax
    jle near loc_01c7
    mov edi, dword [esp + 8]
    test di, di
    jl short loc_017d
    movsx eax, di
    imul eax, eax, 0x2c
    mov edx, dword [0x3bce8]
    mov bx, word [edx + 0xe]
    cmp bx, word [eax + 0x1c0bb2]
    jne short loc_017d
    xor esi, esi
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_017d:
    mov eax, dword [0x3bce8]
    sub word [eax + 0x1c], si
    lea edx, [esp + 8]
    movsx eax, word [0x3becc]
    call 0x48170
    mov edx, dword [0x3bce8]
    add word [edx + 0x1c], si
    cmp eax, 0x300
    jle short loc_01c7
    mov eax, dword [esp + 8]
    test ax, ax
    jl short loc_01dc
    cwde
    imul eax, eax, 0x2c
    mov edx, dword [0x3bce8]
    mov bx, word [edx + 0xe]
    cmp bx, word [eax + 0x1c0bb2]
    jne short loc_01dc
loc_01c7:
    xor esi, esi
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_01dc:
    mov esi, 1
loc_01e1:
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x1c0bbc]
    movsx edx, word [0x3bece]
    push eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x14, 0x45, 0x1c, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb511c]
    push edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x8b, 0x1c, 0x45, 0x18, 0x51, 0x0b, 0x00    ; mov ebx, dword [eax*2 + 0xb5118]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    push ebx
    db 0x8b, 0x0c, 0x45, 0x14, 0x51, 0x0b, 0x00    ; mov ecx, dword [eax*2 + 0xb5114]
    push ecx
    mov ecx, dword [0x3bce8]
    movsx ecx, word [ecx + 0x18]
    call 0x7079f
    mov ebx, eax
    and ebx, 0x29
    mov eax, dword [0x3bce8]
    shl ebx, 8
    mov eax, dword [eax + 8]
    sub eax, ebx
    mov edx, dword [0x3bce8]
    mov ebx, eax
    mov eax, dword [0x3bce8]
    mov edx, dword [edx + 4]
    mov eax, dword [eax]
    call 0x6ae4d
    mov esi, eax
    call 0x3ac70
    test esi, esi
    je near loc_3a9a
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov word [eax + 0x4e9e9], 0x600
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx eax, word [eax + 0x4e9e5]
    cmp eax, -1
    sete al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0x83, 0x3c, 0x45, 0x8e, 0x52, 0x0b, 0x00, 0x00    ; cmp word [eax*2 + 0xb528e], 0
    jl near loc_03ec
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x8e, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb528e]
    imul eax, eax, 0x2c
    mov edi, 0x1c0ba4
    add edi, eax
    movsx eax, word [edi + 0x18]
    push eax
    mov ecx, dword [edi + 8]
    push ecx
    mov esi, dword [edi + 4]
    push esi
    mov ebp, dword [edi]
    mov ecx, dword [0x3bce8]
    push ebp
    movsx ecx, word [ecx + 0x18]
    call 0x7079f
    mov ebx, dword [0x3bce8]
    and eax, 0x1fff
    mov ebx, dword [ebx + 8]
    mov edx, dword [0x3bce8]
    sub ebx, eax
    mov eax, dword [0x3bce8]
    mov edx, dword [edx + 4]
    mov eax, dword [eax]
    call 0x6ae4d
    test eax, eax
    jne short loc_0415
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x3c, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx edi, word [eax*2 + 0xb5240]
    imul edi, edi, 0x2c
    mov eax, 0x1c0ba4
    jmp short loc_0413
loc_03ec:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    mov edi, 0x1c0ba4
loc_0413:
    add edi, eax
loc_0415:
    movsx eax, word [edi + 0x18]
    push eax
    mov eax, dword [edi + 8]
    sub eax, 0x1800
    push eax
    mov eax, dword [edi + 4]
    push eax
    mov edx, dword [edi]
    mov ecx, dword [0x3bce8]
    push edx
    movsx ecx, word [ecx + 0x18]
    call 0x7079f
    mov ebx, eax
    mov eax, dword [0x3bce8]
    and ebx, 0x2f00
    mov edx, dword [eax + 8]
    sub edx, ebx
    mov ebx, edx
    mov edx, dword [eax + 4]
    mov eax, dword [eax]
    call 0x6ae4d
    mov esi, eax
    test eax, eax
    jne near loc_055e
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x3bce8]
    mov eax, dword [eax + 0x4e9f3]
    sub eax, dword [edx]
    test eax, eax
    jns short loc_048e
    neg eax
loc_048e:
    movsx edx, word [0x3becc]
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x3bce8]
    mov eax, dword [eax + 0x4e9f7]
    sub eax, dword [edx + 4]
    test eax, eax
    jns short loc_04be
    neg eax
loc_04be:
    movsx edx, word [0x3becc]
    lea ecx, [ebx + eax]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ebp, dword [edi]
    mov eax, dword [eax + 0x4e9f3]
    sub eax, ebp
    test eax, eax
    jns short loc_04ea
    neg eax
loc_04ea:
    movsx edx, word [0x3becc]
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + 0x4e9f7]
    sub eax, dword [edi + 4]
    test eax, eax
    jns short loc_0514
    neg eax
loc_0514:
    add eax, ebx
    cmp ecx, eax
    test esi, esi
    jne short loc_0588
    movsx esi, word [0x3becc]
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    mov ebx, 0x4e9d8
    sub eax, esi
    add ebx, eax
    mov edx, edi
    lea ecx, [ebx + 0x1f]
    mov eax, esi
    add ebx, 0x1b
    call 0x39e90
    movsx esi, ax
    cmp esi, -1
    jne short loc_0557
    xor esi, esi
    jmp short loc_0588
loc_0557:
    mov esi, 1
    jmp short loc_0588
loc_055e:
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [edi]
    mov dword [eax + 0x4e9f3], edx
    mov edx, dword [edi + 4]
    mov dword [eax + 0x4e9f7], edx
loc_0588:
    cmp esi, 1
    jne short loc_05c4
    mov eax, dword [0x3bce8]
    mov di, word [eax + 0x1a]
    cmp di, 1
    je short loc_05a2
    cmp di, 6
    jne short loc_05c4
loc_05a2:
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov word [eax + 0x4e9e9], 0x600
loc_05c4:
    cmp esi, 1
    sete al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx eax, word [0x3becc]
    call 0x29210
    test ax, ax
    setge al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    movsx eax, word [0x3becc]
    call 0x278c0
    cmp eax, 1
    sete al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x3bce8]
    mov esi, dword [0x3bce8]
    mov di, word [eax + 0xe]
    movsx esi, word [esi + 0x2a]
    cmp di, 0x214
    jne short loc_0652
    dec esi
loc_0652:
    test esi, esi
    setl al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebx, [eax + 4]
    mov dword [0xe54cc], ebx
    mov edx, dword [0x3bce4]
    mov eax, dword [ebx]
    mov dword [edx + 0x14], eax
    mov eax, dword [0x3bce4]
    mov eax, dword [eax + 0x14]
    mov edx, dword [0x3bce4]
    mov eax, dword [eax]
    mov dword [edx + 0x10], eax
    mov eax, dword [0x3bce4]
    mov eax, dword [eax + 0x14]
    mov edx, dword [0x3bce4]
    mov eax, dword [eax + 4]
    mov dword [edx + 4], eax
    mov eax, dword [0x3bce4]
    mov eax, dword [eax + 0x14]
    mov edx, dword [0x3bce8]
    mov ax, word [eax + 8]
    mov word [edx + 0x28], ax
    mov eax, dword [0x3bce4]
    mov dword [eax + 0xc], 0
    mov edx, dword [eax + 0xc]
    mov eax, dword [0x3bce4]
    mov dword [eax + 8], edx
    mov eax, dword [0x3bce4]
    mov dword [eax], edx
    mov eax, dword [0x3bce8]
    test byte [eax + 0x28], 8
    je short loc_06f9
    call 0x7079f
    mov edx, dword [0x3bce8]
    and ah, 7
    mov word [edx + 0x1c], ax
loc_06f9:
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [0xe54cc]
    add edx, 4
    mov eax, dword [0x3bce4]
    mov dword [0xe54cc], edx
    mov dword [eax + 8], 0
    mov eax, dword [0x3bce4]
    mov dword [eax + 0xc], 0
    mov eax, dword [0xe54cc]
    mov edx, dword [0x3bce4]
    mov eax, dword [eax]
    mov dword [edx + 0x10], eax
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea esi, [eax + 4]
    mov dword [0xe54cc], esi
    mov eax, dword [0x3bcec]
    cmp eax, dword [esi]
    setl al
    and eax, 0xff
    call 0x3ac70
    cmp dword [0x3bcec], 0x4000
    jle near loc_3a9a
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp word [eax + 0x4e9e9], 0
    jne near loc_3a9a
    mov word [eax + 0x4e9e9], 0x600
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebp, [eax + 4]
    mov dword [0xe54cc], ebp
    mov eax, dword [0x3bcec]
    cmp eax, dword [ebp]
    setg al
    and eax, 0xff
    call 0x3ac70
    cmp dword [0x3bcec], 0x4000
    jle near loc_3a9a
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp word [eax + 0x4e9e9], 0
    jne near loc_3a9a
    mov word [eax + 0x4e9e9], 0x600
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [eax + 4]
    mov dword [0xe54cc], eax
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov dword [0xe54cc], eax
    mov edx, dword [0x3bce8]
    mov ax, word [eax]
    add word [edx + 0x2a], ax
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea esi, [eax + 4]
    mov dword [0xe54cc], esi
    mov edx, dword [0x3bce8]
    mov ax, word [esi]
    mov word [edx + 0x2a], ax
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov ebp, dword [0xe9347]
    mov dword [0xe54cc], eax
    cmp ebp, 1
    jl near loc_0941
    cmp dword [0xe97df], 1
    jle near loc_0941
    mov eax, dword [0xe54cc]
    cmp dword [eax], 0
    jne near loc_0954
    xor esi, esi
    jmp short loc_08e1
loc_08c4:
    db 0x8d, 0x14, 0x75, 0x00, 0x00, 0x00, 0x00    ; lea edx, [esi*2]
    add eax, edx
    mov edx, dword [0x3bce8]
    mov ax, word [eax + 0xb525c]
    cmp ax, word [edx + 0xe]
    je short loc_0905
    inc esi
loc_08e1:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    movsx edx, word [eax + 0xb527c]
    cmp esi, edx
    jl short loc_08c4
loc_0905:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x7c, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb527c]
    cmp esi, eax
    jge short loc_0941
    mov eax, dword [0x3bce8]
    mov cx, word [0x3becc]
    cmp cx, word [eax + 0x1e]
    jne short loc_0941
    mov eax, 1
    jmp short loc_0943
loc_0941:
    xor eax, eax
loc_0943:
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0954:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0x83, 0x3c, 0x45, 0x7c, 0x52, 0x0b, 0x00, 0x10    ; cmp word [eax*2 + 0xb527c], 0x10
    jge near loc_3a9a
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ax, word [edx + 0xb527c]
    movsx ebx, word [0x3bece]
    movsx ecx, ax
    mov eax, ebx
    shl eax, 7
    mov esi, dword [0x3bce8]
    sub eax, ebx
    mov di, word [edx + 0xb527c]
    lea eax, [eax*4]
    inc edi
    sub eax, ebx
    add ecx, ecx
    add eax, eax
    mov word [edx + 0xb527c], di
    add ecx, eax
    mov ax, word [esi + 0xe]
    mov word [ecx + 0xb525c], ax
    mov dx, word [0x3becc]
    mov ax, word [esi + 0x1e]
    cmp ax, dx
    sete al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov edx, dword [0x3bce8]
    mov dword [0xe54cc], eax
    cmp word [edx + 0xe], 0x214
    jne short loc_0a35
    movsx ebx, word [edx + 0x22]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x8a, 0x04, 0x45, 0xec, 0x52, 0x0b, 0x00    ; mov al, byte [eax*2 + 0xb52ec]
    jmp short loc_0a54
loc_0a35:
    movsx ebx, word [0x3becc]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov al, byte [eax + 0x4e9e3]
loc_0a54:
    mov byte [edx + 0x11], al
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    xor edx, edx
    mov word [eax + 0x4e9e3], dx
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov edx, dword [0x3bce8]
    mov dword [0xe54cc], eax
    movsx edx, word [edx + 0x22]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    add eax, 0xb4f00
    call 0x4b190
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov ebx, dword [0x3bce8]
    mov dword [0xe54cc], eax
    movsx eax, word [ebx + 0x22]
    imul eax, eax, 0xd
    cmp dword [eax + 0xe75d9], 0
    jne near loc_3a9a
    xor eax, eax
    movsx edx, word [0x3becc]
    mov ax, word [ebx + 0x22]
    call 0x5aca0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov edi, dword [0xe97df]
    mov dword [0xe54cc], eax
    cmp edi, 1
    jle short loc_0b5b
    mov eax, dword [0x3bce8]
    cmp word [eax + 0xe], 0x214
    jne short loc_0b5b
    movsx edx, word [0x336e8]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xb5252], 0
    jne near loc_3a9a
    mov word [eax + 0xb5252], 0xe
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0b5b:
    mov eax, dword [0x3bce8]
    cmp word [eax + 0xe], 0x214
    je near loc_3a9a
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xb5252], 0
    jne near loc_3a9a
    mov word [eax + 0xb5252], 0xe
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ecx, dword [0xe54cc]
    add ecx, 4
    mov eax, dword [0x3bce8]
    mov dword [0xe54cc], ecx
    mov al, byte [eax + 0x14]
    and eax, 0xff
    mov ebx, dword [ecx]
    sub ebx, eax
    add ebx, ebx
    mov edx, dword [0x3bce8]
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    add byte [edx + 0x14], al
    mov esi, dword [0xe54cc]
    add esi, 4
    mov eax, dword [0x3bce8]
    mov dword [0xe54cc], esi
    cmp word [eax + 0xe], 0x214
    jne short loc_0bfd
    cmp byte [eax + 0x15], 0x24
    jb short loc_0c55
loc_0bfd:
    mov eax, dword [0x3bce8]
    xor edx, edx
    mov ebx, dword [0xe54cc]
    mov dl, byte [eax + 0x15]
    cmp edx, dword [ebx]
    jg short loc_0c55
    movsx eax, word [eax + 0xe]
    db 0x0f, 0xbf, 0x04, 0x45, 0x24, 0xac, 0x1a, 0x00    ; movsx eax, word [eax*2 + 0x1aac24]
    add eax, 8
    imul eax, edx
    movsx edx, word [0x3becc]
    lea ebx, [eax*4]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [eax + 0x4e9eb]
    sub eax, dword [edx + 0x4e9ef]
    cmp ebx, eax
    jge short loc_0c88
loc_0c55:
    mov eax, dword [0x3bce8]
    movzx esi, byte [eax + 0x15]
    mov eax, dword [0xe54cc]
    mov eax, dword [eax]
    sub eax, esi
    add eax, eax
    mov esi, eax
    test eax, eax
    jns short loc_0c71
    neg eax
loc_0c71:
    test eax, eax
    je short loc_0c88
    mov ebx, esi
    mov edx, dword [0x3bce8]
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    add byte [edx + 0x15], al
loc_0c88:
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov dword [0xe54cc], eax
    mov edx, dword [0x3bce8]
    mov al, byte [eax]
    mov byte [edx + 0x14], al
    mov ebx, dword [0xe54cc]
    add ebx, 4
    mov dword [0xe54cc], ebx
    mov edx, dword [0x3bce8]
    mov al, byte [ebx]
    mov byte [edx + 0x15], al
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebx, [eax + 4]
    mov dword [0xe54cc], ebx
    movsx eax, word [0x3becc]
    movsx edx, word [ebx]
    call 0x48740
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ecx, [eax + 4]
    mov dword [0xe54cc], ecx
    imul eax, dword [ecx], 0xd
    cmp dword [eax + 0xe75d9], 0
    jne short loc_0d2f
    movsx edx, word [0x3becc]
    mov ax, word [ecx]
    and eax, 0xffff
    call 0x5aca0
loc_0d2f:
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea esi, [eax + 4]
    mov dword [0xe54cc], esi
    imul eax, dword [esi], 0xd
    cmp dword [eax + 0xe75d9], 0
    jle short loc_0d5f
    movsx eax, word [esi]
    call 0x5ace0
loc_0d5f:
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea esi, [eax + 4]
    mov bx, word [0xe8cc6]
    mov ax, word [0x3bece]
    mov dword [0xe54cc], esi
    cmp ax, bx
    je short loc_0d96
    cmp dword [0xe9347], 1
    jne short loc_0dc7
loc_0d96:
    movsx edx, word [0xe8cc6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5240]
    mov eax, dword [0xe54cc]
    mov ax, word [eax]
    and eax, 0xffff
    call 0x5aca0
loc_0dc7:
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea edi, [eax + 4]
    mov dword [0xe54cc], edi
    movsx edx, word [0x3becc]
    mov ax, word [edi]
    and eax, 0xffff
    call 0x5aca0
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    mov esi, dword [0xe54cc]
    lea eax, [eax*4]
    add esi, 4
    sub eax, edx
    mov ebx, 0x1a
    mov dword [0xe54cc], esi
    db 0x66, 0x89, 0x1c, 0x45, 0x16, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb5216], bx
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [0x7bf8]
    add eax, 4
    add edx, 0x64
    mov dword [0xe54cc], eax
    mov dword [0x7bf8], edx
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ebx, dword [0x7bfc]
    add eax, 4
    add ebx, 0x64
    mov dword [0xe54cc], eax
    mov dword [0x7bfc], ebx
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea esi, [eax + 4]
    mov dword [0xe54cc], esi
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [0xe54cc]
    add edx, 4
    mov al, 1
    mov dword [0xe54cc], edx
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    mov esi, dword [0xe54cc]
    lea eax, [eax*4]
    add esi, 4
    sub eax, edx
    mov dword [0xe54cc], esi
    lea edx, [eax + eax]
    mov eax, dword [esi]
    movsx edx, word [edx + eax*2 + 0xb51a6]
    cmp edx, dword [eax*4 + 0xe6ff8]
    jl short loc_0f0e
    mov byte [0xe9839], 2
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0f0e:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    movsx ebx, word [esi + 4]
    add edx, eax
    movsx eax, word [esi]
    call 0x275d0
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0x83, 0x3c, 0x45, 0x12, 0x52, 0x0b, 0x00, 0x00    ; cmp word [eax*2 + 0xb5212], 0
    jne short loc_0fb7
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [0xe54cc]
    mov eax, dword [eax]
    cmp byte [edx + eax + 0xb52d3], 0
    je short loc_0fb7
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov ebx, dword [0xe54cc]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    movsx ebx, word [ebx]
    add eax, edx
    mov edx, ebx
    call 0x27620
loc_0fb7:
    add dword [0xe54cc], 8
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov dword [0xe54cc], eax
    movsx edx, word [eax]
    mov eax, dword [0x3bce8]
    call 0x28810
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov dword [0xe54cc], eax
    mov edx, dword [eax]
    mov eax, dword [0x3bce8]
    call 0x28890
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    movsx edx, word [0x3becc]
    mov dword [0xe54cc], eax
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    add ebx, 4
    mov edx, eax
    mov ax, word [ebx - 4]
    mov dword [0xe54cc], ebx
    mov word [edx + 0x4e9e9], ax
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov dword [0xe54cc], eax
    mov edx, dword [eax]
    mov eax, dword [0x3bce8]
    call 0x28910
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0xe54cc]
    add edx, 4
    mov dword [0xe54cc], edx
    mov dl, byte [edx]
    db 0x00, 0x14, 0x45, 0xf4, 0x52, 0x0b, 0x00    ; add byte [eax*2 + 0xb52f4], dl
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    mov ebx, dword [0xe54cc]
    lea eax, [eax*8]
    add ebx, 4
    sub eax, edx
    mov edx, 0xffffffff
    mov dword [0xe54cc], ebx
    mov word [eax + 0x4e9e5], dx
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebx, [eax + 4]
    mov dword [0xe54cc], ebx
    movsx eax, word [0x3becc]
    movsx edx, word [ebx]
    call 0x26880
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ch, 1
    lea edx, [eax + 4]
    mov byte [0xe9839], ch
    mov dword [0xe54cc], edx
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    mov esi, dword [0xe54cc]
    sub eax, edx
    add esi, 4
    lea eax, [eax*4]
    mov dword [0xe54cc], esi
    sub eax, edx
    mov edi, dword [esi]
    lea edx, [eax + eax]
    add edx, edi
    cmp byte [edx + 0xb52d3], 0
    jne short loc_119f
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, 0xb4f00
    movsx ebx, word [esi]
    add eax, edx
    mov edx, ebx
    call 0x27620
    jmp short loc_11e1
loc_119f:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, edi
    mov ebp, dword [edi*4 + 0xe6ff8]
    movsx edx, word [edx + eax*2 + 0xb51a6]
    cmp edx, ebp
    jl short loc_11e1
    mov byte [0xe9839], 2
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_11e1:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov ebx, dword [0xe54cc]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    movsx ecx, word [ebx + 4]
    add edx, eax
    movsx eax, word [ebx]
    mov ebx, ecx
    call 0x275d0
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xb5212], 0
    jne short loc_1257
    mov edx, dword [0xe54cc]
    mov ebx, dword [edx]
    cmp byte [ebx + eax + 0xb52d3], 0
    je short loc_1257
    add eax, 0xb4f00
    movsx edx, word [edx]
    call 0x27620
loc_1257:
    add dword [0xe54cc], 8
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebx, [eax + 4]
    mov dword [0xe54cc], ebx
    mov ecx, dword [ebx]
    push ecx
    mov eax, 0x2544
    push eax
    call 0xa2784
    mov esi, dword [0xe54cc]
    add esi, 4
    add esp, 8
    mov dword [0xe54cc], esi
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    movsx edx, word [0x3bece]
    mov dword [0xe54cc], eax
    mov ebx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ax, word [ebx]
    mov word [edx + 0xb5258], ax
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0xc7, 0x04, 0x45, 0x5a, 0x52, 0x0b, 0x00, 0xff, 0xff    ; mov word [eax*2 + 0xb525a], 0xffff
    mov edx, ebx
    mov ch, 1
    add edx, 4
    mov byte [0xe8d7f], ch
    mov dword [0xe54cc], edx
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add dword [0xe54cc], 4
    db 0x66, 0x83, 0x3c, 0x45, 0x1e, 0x52, 0x0b, 0x00, 0x00    ; cmp word [eax*2 + 0xb521e], 0
    jl near loc_1512
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov ebx, 0xffffffff
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x66, 0x89, 0x1c, 0x45, 0x1e, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb521e], bx
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add ebx, ebx
    lea edx, [eax + eax]
    mov eax, dword [ebx + 0xb5138]
    mov dword [edx + 0xb5114], eax
    movsx edx, word [0x3bece]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    add ebx, ebx
    sub eax, edx
    mov edx, dword [ebx + 0xb513c]
    db 0x89, 0x14, 0x45, 0x18, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb5118], edx
    movsx edx, word [0x3bece]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add ebx, ebx
    lea edx, [eax + eax]
    mov eax, dword [ebx + 0xb5140]
    mov dword [edx + 0xb511c], eax
    movsx edx, word [0x3bece]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    add ebx, ebx
    sub eax, edx
    mov dx, word [ebx + 0xb519a]
    db 0x66, 0x89, 0x14, 0x45, 0x98, 0x51, 0x0b, 0x00    ; mov word [eax*2 + 0xb5198], dx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    add eax, edx
    movsx edx, word [0x3bece]
    lea ebx, [eax + 0x29e]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x8b, 0x0c, 0x45, 0x18, 0x51, 0x0b, 0x00    ; mov ecx, dword [eax*2 + 0xb5118]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, ecx
    db 0x8b, 0x04, 0x45, 0x14, 0x51, 0x0b, 0x00    ; mov eax, dword [eax*2 + 0xb5114]
    call 0x6e997
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    add eax, edx
    call 0x47d00
    movsx esi, word [0x2454c4]
loc_14ed:
    test esi, esi
    jl short loc_1512
    imul eax, esi, 0x2c
    cmp word [eax + 0x1c0bb2], 0x26d
    jne short loc_1508
    xor edx, edx
    mov word [eax + 0x1c0bc6], dx
loc_1508:
    db 0x0f, 0xbf, 0x34, 0x75, 0xa4, 0xf7, 0x1a, 0x00    ; movsx esi, word [esi*2 + 0x1af7a4]
    jmp short loc_14ed
loc_1512:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    movsx esi, word [eax + 0x1c0bce]
    mov eax, dword [0x3bce8]
    cmp word [eax + 0xe], 0x64
    je short loc_1590
    cmp esi, dword [0xe7220]
    jle short loc_156d
    mov eax, dword [0xe54cc]
    cmp dword [eax], 0
    jle short loc_156d
    add eax, 4
    mov dword [0xe54cc], eax
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_156d:
    test esi, esi
    jle short loc_1578
    mov eax, dword [0xe54cc]
    add esi, dword [eax]
loc_1578:
    mov ecx, dword [0xe7220]
    cmp esi, ecx
    jle short loc_15a8
    mov eax, dword [0xe54cc]
    cmp dword [eax], 0
    jle short loc_15a8
    mov esi, ecx
    jmp short loc_15a8
loc_1590:
    test esi, esi
    jle short loc_159b
    mov eax, dword [0xe54cc]
    add esi, dword [eax]
loc_159b:
    mov eax, dword [0xe7220]
    add eax, eax
    cmp esi, eax
    jle short loc_15a8
    mov esi, eax
loc_15a8:
    test esi, esi
    jge short loc_15ae
    xor esi, esi
loc_15ae:
    cmp byte [0xe8d7c], 0
    jne near loc_164b
    mov eax, dword [0xe54cc]
    mov ebp, dword [eax]
    test ebp, ebp
    jle short loc_1622
    mov eax, dword [0xe7220]
    mov edx, esi
    sar eax, 2
    sub edx, ebp
    cmp edx, eax
    jge short loc_1603
    cmp esi, eax
    jl short loc_1603
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5240]
    mov eax, 0xe5
    call 0x5aca0
loc_1603:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0x89, 0x34, 0x45, 0xa2, 0x51, 0x0b, 0x00    ; mov word [eax*2 + 0xb51a2], si
loc_1622:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    mov word [eax + 0x1c0bce], si
loc_164b:
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea edx, [eax + 8]
    mov eax, dword [eax + 4]
    mov dword [0xe54cc], eax
loc_1669:
    call loc_0008
    test al, al
    je short loc_1669
    mov dword [0xe54cc], edx
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebx, [eax + 4]
    mov dword [0xe54cc], ebx
loc_168d:
    call loc_0008
    test al, al
    jne near loc_3a9a
    jmp short loc_168d
    mov eax, dword [0x3bce4]
    mov dword [eax], 0
    mov ecx, dword [0xe54cc]
    add ecx, 4
    mov dword [0xe54cc], ecx
    mov eax, dword [0x3bce4]
    mov edx, dword [ecx]
    mov dword [eax + 4], edx
    mov esi, dword [0xe54cc]
    add esi, 4
    mov dword [0xe54cc], esi
    mov edx, dword [0x3bce8]
    mov ax, word [esi]
    mov word [edx + 0x28], ax
    mov edi, dword [0xe54cc]
    add edi, 4
    mov eax, dword [0x3bce8]
    mov dword [0xe54cc], edi
    test byte [eax + 0x28], 8
    je near loc_3a9a
    call 0x7079f
    mov edx, dword [0x3bce8]
    and ah, 7
    mov word [edx + 0x1c], ax
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ebp, dword [0xe54cc]
    add ebp, 4
    mov eax, dword [0x3bce8]
    mov dword [0xe54cc], ebp
    mov bx, word [eax + 0x18]
    test bx, bx
    jl short loc_174c
    cmp bx, 0x400
    jge short loc_174c
    movsx eax, word [0x3becc]
    movsx edx, word [ebp]
    call 0x19320
loc_174c:
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    mov ebp, dword [0xe54cc]
    add eax, edx
    add ebp, 4
    lea eax, [eax*8]
    mov dword [0xe54cc], ebp
    sub eax, edx
    mov ebx, dword [ebp]
    movsx eax, word [eax + 0x4e9d9]
    cmp eax, ebx
    sete al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebx, [eax + 4]
    mov edx, dword [0x3bce4]
    mov dword [0xe54cc], ebx
    mov edx, dword [edx + 0x14]
    cmp edx, dword [ebx]
    sete al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea esi, [eax + 4]
    mov edx, dword [0x3bce4]
    mov dword [0xe54cc], esi
    mov edx, dword [edx + 0x10]
    cmp edx, dword [esi]
    sete al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ebx, dword [0xe54cc]
    add ebx, 4
    mov eax, dword [0x3bce4]
    mov dword [0xe54cc], ebx
    mov eax, dword [eax + 8]
    cmp eax, dword [ebx]
    setge al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [0xe54cc]
    add edx, 4
    mov eax, dword [0x3bce4]
    mov dword [0xe54cc], edx
    mov dword [eax + 8], 0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea edi, [eax + 4]
    mov dword [0xe54cc], edi
    mov ebp, dword [0xe54cc]
    mov eax, dword [0x3bce8]
    add ebp, 4
    mov di, word [edi]
    mov dword [0xe54cc], ebp
    mov si, word [eax + 0x18]
    test si, si
    jl near loc_19e0
    cmp si, 0x400
    jge near loc_19e0
    mov esi, dword [ebp]
    dec esi
    jmp near loc_19d8
loc_18a0:
    mov eax, dword [0x3bce8]
    cmp word [eax + 0xe], 0xd48
    jne short loc_18b8
    cmp di, 0x960
    jne short loc_18b8
    xor ebx, ebx
    jmp short loc_18cb
loc_18b8:
    call 0x7079f
    mov edx, eax
    mov ebx, 3
    sar edx, 0x1f
    idiv ebx
    mov ebx, edx
loc_18cb:
    push 5
    movsx eax, word [0x3becc]
    push eax
    call 0x7079f
    and eax, 0x7ff
    neg eax
    push eax
    call 0x7079f
    xor ah, ah
    and al, 0x7f
    db 0x05, 0x20, 0x00, 0x00, 0x00    ; add eax, 0x20
    cwde
    push eax
    call 0x7079f
    and ah, 7
    cwde
    push eax
    call 0x7079f
    and al, 0xf
    add al, 0x20
    movsx eax, al
    push eax
    call 0x7079f
    and al, 0xf
    add al, 0x20
    movsx eax, al
    push eax
    mov eax, dword [0x3bce8]
    movsx edx, byte [eax + 0x10]
    add ebx, edi
    push edx
    movsx edx, bx
    mov ecx, dword [eax + 8]
    push edx
    sub ecx, 0x800
    call 0x7079f
    and eax, 0x1fff
    sub ecx, eax
    call 0x7079f
    mov ebx, eax
    mov eax, dword [0x3bce8]
    and ebx, 0xff
    mov edx, dword [eax + 4]
    call 0x7079f
    add ebx, edx
    mov edx, eax
    mov eax, dword [0x3bce8]
    and edx, 0xff
    mov ebp, dword [eax]
    sub ebx, 0x80
    add edx, ebp
    movsx eax, word [eax + 0x18]
    sub edx, 0x80
    call 0x18f70
    cwde
    mov dword [esp], eax
    mov eax, dword [0x3bce8]
    cmp word [eax + 0xe], 0xd48
    jne short loc_19b8
    cmp di, 0x960
    jne short loc_19b8
    mov ebx, 0xe
    mov edx, esi
    mov eax, esi
    sar edx, 0x1f
    idiv ebx
    imul eax, dword [esp], 0x2c
    db 0x66, 0x8b, 0x14, 0x55, 0x3c, 0x8d, 0x00, 0x00    ; mov dx, word [edx*2 + 0x8d3c]
    mov word [eax + 0x1c0bc6], dx
    jmp short loc_19c5
loc_19b8:
    imul eax, dword [esp], 0x2c
    mov word [eax + 0x1c0bc6], 0xffff
loc_19c5:
    imul edx, dword [esp], 0x2c
    mov eax, dword [0x3bce8]
    mov al, byte [eax + 0x11]
    dec esi
    mov byte [edx + 0x1c0bb5], al
loc_19d8:
    test esi, esi
    jge near loc_18a0
loc_19e0:
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea edi, [eax + 4]
    mov dword [0xe54cc], edi
    mov edx, dword [0x3bce4]
    movsx eax, word [edi]
    mov dword [edx], eax
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov dword [0xe54cc], eax
    mov edx, dword [0x3bce8]
    mov ax, word [eax]
    or word [edx + 0xc], ax
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov edx, eax
    mov dword [0xe54cc], eax
    mov eax, dword [0x3bce8]
    mov dl, byte [edx]
    mov byte [eax + 0x12], dl
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov edx, eax
    mov dword [0xe54cc], eax
    mov eax, dword [0x3bce8]
    mov dx, word [edx]
    mov word [eax + 0xc], dx
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edi, dword [0xe54cc]
    add edi, 4
    mov eax, dword [0x3bce4]
    mov dword [0xe54cc], edi
    mov eax, dword [eax + 4]
    cmp eax, dword [edi]
    sete al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ecx, [eax + 4]
    mov esi, dword [0xe97df]
    mov dword [0xe54cc], ecx
    cmp esi, 2
    jge short loc_1b4a
    cmp word [0x8ff0], 0
    jl short loc_1b1f
    cmp dword [0xe97a7], 2
    je short loc_1b1f
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov bh, 1
    xor cl, cl
    db 0x88, 0x3c, 0x45, 0xa2, 0x52, 0x0b, 0x00    ; mov byte [eax*2 + 0xb52a2], bh
    mov byte [0x2c23b9], cl
    mov eax, 0x3a98
    call 0x3f2c0
    jmp short loc_1b3e
loc_1b1f:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xa2, 0x52, 0x0b, 0x00, 0x20    ; mov byte [eax*2 + 0xb52a2], 0x20
loc_1b3e:
    mov byte [0xe9839], 2
    jmp near loc_2202
loc_1b4a:
    movsx eax, word [0x3bece]
    call 0x50b50
    movsx edx, word [0x3bece]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    add ebx, ebx
    sub eax, edx
    mov edx, dword [ebx + 0xb5114]
    mov ebx, edx
    db 0x89, 0x14, 0x45, 0x38, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb5138], edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x3becc]
    db 0x89, 0x1c, 0x45, 0x30, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb5130], ebx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x3bce8]
    mov dword [eax + 0x4e9fb], ebx
    mov eax, ebx
    mov dword [edx], eax
    movsx edx, word [0x3bece]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    add ebx, ebx
    sub eax, edx
    mov edx, dword [ebx + 0xb5118]
    movsx ebx, word [0x3bece]
    db 0x89, 0x14, 0x45, 0x3c, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb513c], edx
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov ebx, edx
    db 0x89, 0x14, 0x45, 0x34, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb5134], edx
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x3bce8]
    mov dword [eax + 0x4e9ff], ebx
    mov eax, ebx
    mov dword [edx + 4], eax
    movsx edx, word [0x3bece]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    add ebx, ebx
    sub eax, edx
    mov edx, dword [ebx + 0xb511c]
    mov ebx, edx
    db 0x89, 0x14, 0x45, 0x40, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb5140], edx
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x3bce8]
    mov dword [eax + 0x4e9ff], ebx
    mov eax, ebx
    mov dword [edx + 8], eax
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, 0xb4f00
    add eax, eax
    movsx edx, word [0x3bece]
    add ebx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x8b, 0x0c, 0x45, 0x18, 0x51, 0x0b, 0x00    ; mov ecx, dword [eax*2 + 0xb5118]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add ebx, 0x29e
    mov edx, ecx
    db 0x8b, 0x04, 0x45, 0x14, 0x51, 0x0b, 0x00    ; mov eax, dword [eax*2 + 0xb5114]
    call 0x6e997
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x8b, 0x0c, 0x45, 0x1c, 0x51, 0x0b, 0x00    ; mov ecx, dword [eax*2 + 0xb511c]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x8b, 0x1c, 0x45, 0x18, 0x51, 0x0b, 0x00    ; mov ebx, dword [eax*2 + 0xb5118]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x8b, 0x34, 0x45, 0x14, 0x51, 0x0b, 0x00    ; mov esi, dword [eax*2 + 0xb5114]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add ecx, 0x2600
    mov edx, esi
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    call 0x6a826
    mov eax, dword [0x3bce8]
    mov word [eax + 0xc], 0x101
    mov eax, dword [0x3bce8]
    mov byte [eax + 0x10], 0xf4
    mov eax, dword [0x3bce8]
    mov byte [eax + 0x12], 0x40
    mov eax, dword [0x3bce8]
    mov byte [eax + 0x14], 0x2a
    mov eax, dword [0x3bce8]
    mov byte [eax + 0x15], 0x24
    mov edx, dword [0x3bce8]
    mov ax, word [0x3becc]
    mov word [edx + 0x1e], ax
    mov eax, dword [0x3bce8]
    mov byte [eax + 0x16], 0
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0x3bce8]
    db 0x8a, 0x04, 0x45, 0xec, 0x52, 0x0b, 0x00    ; mov al, byte [eax*2 + 0xb52ec]
    mov byte [edx + 0x11], al
    mov eax, dword [0x3bce8]
    mov dx, word [0xe7220]
    mov word [eax + 0x2a], dx
    mov ebx, edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x66, 0x89, 0x1c, 0x45, 0xa2, 0x51, 0x0b, 0x00    ; mov word [eax*2 + 0xb51a2], bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov edi, 0xffffffff
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x66, 0x89, 0x3c, 0x45, 0x1a, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb521a], di
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov edi, 0x64
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x89, 0x3c, 0x45, 0x20, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb5120], edi
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0xc7, 0x04, 0x45, 0x3e, 0x52, 0x0b, 0x00, 0xff, 0xff    ; mov word [eax*2 + 0xb523e], 0xffff
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dx, word [0x3bece]
    db 0x66, 0x89, 0x14, 0x45, 0x94, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb5294], dx
    movsx edx, dx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    xor ebx, ebx
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x66, 0x89, 0x1c, 0x45, 0x18, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb5218], bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    xor ebp, ebp
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x89, 0x2c, 0x45, 0x48, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb5148], ebp
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov ecx, 0xffffffff
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x66, 0x89, 0x0c, 0x45, 0xc8, 0x51, 0x0b, 0x00    ; mov word [eax*2 + 0xb51c8], cx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dx, word [0xe704c]
    db 0x66, 0x89, 0x14, 0x45, 0x8c, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb528c], dx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x66, 0x89, 0x1c, 0x45, 0x82, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb5282], bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor edx, edx
    db 0x89, 0x14, 0x45, 0x74, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb5174], edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ch, ch
    db 0x88, 0x2c, 0x45, 0xa4, 0x52, 0x0b, 0x00    ; mov byte [eax*2 + 0xb52a4], ch
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x66, 0x89, 0x1c, 0x45, 0x7c, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb527c], bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x66, 0x89, 0x1c, 0x45, 0x2c, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb522c], bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x66, 0x89, 0x1c, 0x45, 0x2e, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb522e], bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    xor ebx, ebx
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x89, 0x1c, 0x45, 0x50, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb5150], ebx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x89, 0x1c, 0x45, 0x4c, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb514c], ebx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    xor cl, cl
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x66, 0x89, 0x0c, 0x45, 0x80, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb5280], cx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor dl, dl
    db 0x88, 0x14, 0x45, 0xd2, 0x52, 0x0b, 0x00    ; mov byte [eax*2 + 0xb52d2], dl
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    mov esi, 0xffffffff
    sub eax, edx
    movsx edx, word [0x3becc]
    mov word [eax + 0x4e9dd], si
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dx, word [0x3becc]
    mov word [eax + 0x4e9df], dx
    movsx edx, dx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    xor dh, dh
    mov byte [eax + 0x4e9d8], dh
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    xor edi, edi
    sub eax, edx
    movsx edx, word [0x3becc]
    mov word [eax + 0x4e9e1], di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    xor edx, edx
    mov word [eax + 0x4e9e3], dx
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx edx, word [0x3becc]
    mov word [eax + 0x4e9e5], si
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx edx, word [0x3bece]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [0x3becc]
    mov word [eax + 0x4e9e7], cx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    add ebx, ebx
    sub eax, edx
    mov dx, word [ebx + 0xb5240]
    mov word [eax + 0x4e9df], dx
    movsx eax, word [0x3bece]
    call 0x51290
    movsx eax, word [0x3bece]
    xor ecx, ecx
    call 0x51190
    mov dword [0x7e4c], ecx
    mov eax, dword [0x2454ac]
    mov dword [0x7e50], eax
loc_2202:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    add eax, 0xb4f00
    call 0x47d00
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [0x3bce8]
    movsx edx, word [edx + 0x18]
    lea eax, [edx*4]
    add edx, eax
    mov eax, dword [0x3bce8]
    lea edx, [edx*8]
    mov eax, dword [eax + 8]
    sub eax, dword [edx + 0x2385ac]
    test eax, eax
    jns short loc_225f
    neg eax
loc_225f:
    cmp eax, 0x2000
    jge short loc_228a
    mov eax, dword [0x3bce8]
    movsx edx, word [eax + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385c6], 1
    jne short loc_228a
    mov eax, 1
    jmp short loc_228c
loc_228a:
    xor eax, eax
loc_228c:
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x3bce8]
    movsx edx, word [eax + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385c6], 2
    sete al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edi, dword [0xe54cc]
    add edi, 4
    mov eax, dword [0x3bce4]
    mov dword [0xe54cc], edi
    mov eax, dword [eax]
    cmp eax, dword [edi]
    setge al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ecx, dword [0xe54cc]
    add ecx, 4
    mov eax, dword [0x3bce8]
    mov dword [0xe54cc], ecx
    movsx edx, word [eax + 0xe]
    cmp edx, dword [ecx]
    sete al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov esi, dword [0xe54cc]
    add esi, 4
    mov eax, dword [0x3bce4]
    mov dword [0xe54cc], esi
    mov dword [eax], 0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea edx, [eax + 8]
    mov dword [0xe54cc], edx
    mov eax, dword [edx - 4]
    cmp eax, 0xa
    ja near loc_272e
    jmp dword cs:[eax*4 + 0x2ae70]
    mov ebx, edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ax, word [ebx]
    mov word [edx + 0xb528a], ax
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc9, 0x52, 0x0b, 0x00, 0x02    ; mov byte [eax*2 + 0xb52c9], 2
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0xe54cc]
    db 0x66, 0x8b, 0x0c, 0x45, 0x8c, 0x52, 0x0b, 0x00    ; mov cx, word [eax*2 + 0xb528c]
    add cx, word [edx]
    movsx edx, word [0x3bece]
    db 0x66, 0x89, 0x0c, 0x45, 0x8c, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb528c], cx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [0xe7220]
    db 0x0f, 0xbf, 0x04, 0x45, 0x8c, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb528c]
    cmp eax, ebx
    jle near loc_272e
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dx, word [0xe7220]
    db 0x66, 0x89, 0x14, 0x45, 0x8c, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb528c], dx
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ebx, edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ax, word [ebx]
    mov word [edx + 0xb5286], ax
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc9, 0x52, 0x0b, 0x00, 0x06    ; mov byte [eax*2 + 0xb52c9], 6
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ebx, edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dx, word [ebx]
    db 0x66, 0x89, 0x14, 0x45, 0x1c, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb521c], dx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc9, 0x52, 0x0b, 0x00, 0x03    ; mov byte [eax*2 + 0xb52c9], 3
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ebx, edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ax, word [ebx]
    mov word [edx + 0xb5288], ax
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc9, 0x52, 0x0b, 0x00, 0x04    ; mov byte [eax*2 + 0xb52c9], 4
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x3bce8]
    mov al, byte [eax + 0x11]
    cmp al, 0x15
    jb short loc_2595
    jbe short loc_25cf
    cmp al, 0x17
    je near loc_2601
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2595:
    test al, al
    jne near loc_272e
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x80, 0x0c, 0x45, 0x36, 0x52, 0x0b, 0x00, 0x01    ; or byte [eax*2 + 0xb5236], 1
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_25cf:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x80, 0x0c, 0x45, 0x36, 0x52, 0x0b, 0x00, 0x02    ; or byte [eax*2 + 0xb5236], 2
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2601:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x80, 0x0c, 0x45, 0x36, 0x52, 0x0b, 0x00, 0x04    ; or byte [eax*2 + 0xb5236], 4
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ebx, edx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dx, word [ebx]
    db 0x66, 0x89, 0x14, 0x45, 0x54, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb5254], dx
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc9, 0x52, 0x0b, 0x00, 0x05    ; mov byte [eax*2 + 0xb52c9], 5
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc9, 0x52, 0x0b, 0x00, 0x01    ; mov byte [eax*2 + 0xb52c9], 1
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [0xe54cc]
    lea edx, [eax + eax]
    mov ax, word [ebx]
    mov word [edx + 0xb523a], ax
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc9, 0x52, 0x0b, 0x00, 0x07    ; mov byte [eax*2 + 0xb52c9], 7
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [0xe54cc]
    lea edx, [eax + eax]
    mov ax, word [ebx]
    mov word [edx + 0xb529c], ax
loc_272e:
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edi, dword [eax + 0x14]
    mov ebp, dword [eax + 0x10]
    mov ecx, dword [eax + 0xc]
    push edi
    mov ebx, dword [eax + 8]
    mov edx, dword [eax + 4]
    push ebp
    movsx eax, word [0x3becc]
    call 0x279e0
    add dword [0xe54cc], 0x18
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    mov dword [0xe54cc], eax
    mov eax, dword [eax]
    mov ebx, dword [0x3bce8]
    mov dword [esp], eax
    xor esi, esi
    mov dh, byte [esp]
    movsx ebx, word [ebx + 0x20]
    test dh, 8
    je short loc_27d7
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x80, 0x3c, 0x45, 0xa8, 0x52, 0x0b, 0x00, 0x00    ; cmp byte [eax*2 + 0xb52a8], 0
    je short loc_27d7
    movsx edx, word [0x3bece]
    lea eax, [edx*4]
    add eax, edx
    db 0xf6, 0x04, 0x45, 0x66, 0x02, 0x0e, 0x00, 0x02    ; test byte [eax*2 + 0xe0266], 2
    je short loc_27d7
    mov esi, 1
    jmp near loc_2cfd
loc_27d7:
    test byte [esp], 0x10
    je short loc_282d
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xb5224], 0
    jne short loc_282d
    cmp byte [eax + 0xb52a8], 0
    jne short loc_282d
    cmp dword [eax + 0xb5154], 0x800
    jle short loc_282d
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_282d:
    test byte [esp], 0x20
    je short loc_286e
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0x81, 0x3c, 0x45, 0x24, 0x52, 0x0b, 0x00, 0x5c, 0x01    ; cmp word [eax*2 + 0xb5224], 0x15c
    jle short loc_286e
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_286e:
    test byte [esp], 1
    je short loc_2895
    test ebx, ebx
    jl short loc_2895
    cmp ebx, 8
    jge short loc_2895
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2895:
    test byte [esp], 2
    je short loc_28d2
    cmp ebx, 8
    jl short loc_28d2
    movsx edx, word [0x3bece]
    lea eax, [edx*4]
    add eax, edx
    db 0xf6, 0x04, 0x45, 0x66, 0x02, 0x0e, 0x00, 0x20    ; test byte [eax*2 + 0xe0266], 0x20
    jne short loc_28d2
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_28d2:
    test byte [esp], 4
    je short loc_290f
    cmp ebx, 8
    jl short loc_290f
    movsx edx, word [0x3bece]
    lea eax, [edx*4]
    add eax, edx
    db 0xf6, 0x04, 0x45, 0x66, 0x02, 0x0e, 0x00, 0x20    ; test byte [eax*2 + 0xe0266], 0x20
    je short loc_290f
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_290f:
    test byte [esp], 0x40
    je short loc_295e
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [0x3bce8]
    mov eax, dword [eax + 8]
    mov ecx, dword [edx + 0xb511c]
    sub eax, 0x3000
    cmp eax, ecx
    jle short loc_295e
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_295e:
    test byte [esp], 0x80
    je short loc_299b
    cmp ebx, -8
    jg short loc_299b
    movsx edx, word [0x3bece]
    lea eax, [edx*4]
    add eax, edx
    db 0xf6, 0x04, 0x45, 0x66, 0x02, 0x0e, 0x00, 0x20    ; test byte [eax*2 + 0xe0266], 0x20
    jne short loc_299b
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_299b:
    test byte [esp + 1], 1
    je short loc_29d9
    cmp ebx, -8
    jg short loc_29d9
    movsx edx, word [0x3bece]
    lea eax, [edx*4]
    add eax, edx
    db 0xf6, 0x04, 0x45, 0x66, 0x02, 0x0e, 0x00, 0x20    ; test byte [eax*2 + 0xe0266], 0x20
    je short loc_29d9
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_29d9:
    test byte [esp + 1], 2
    je short loc_2a2f
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xb5252], 0
    jg short loc_2a17
    cmp word [eax + 0xb5212], 0
    jne short loc_2a2f
    cmp word [eax + 0xb5234], 0
    jle short loc_2a2f
loc_2a17:
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2a2f:
    test byte [esp + 1], 4
    je short loc_2a79
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x1c0bb8], 0x20
    jae short loc_2a79
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2a79:
    test byte [esp + 1], 8
    je short loc_2ab9
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x80, 0x3c, 0x45, 0xcb, 0x52, 0x0b, 0x00, 0x00    ; cmp byte [eax*2 + 0xb52cb], 0
    je short loc_2ab9
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2ab9:
    test byte [esp + 1], 0x10
    je short loc_2b04
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov dx, word [eax + 0xb528a]
    test dx, dx
    jle short loc_2b04
    cmp dx, 0x190
    jge short loc_2b04
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2b04:
    test byte [esp + 1], 0x20
    je short loc_2b44
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x80, 0x3c, 0x45, 0xa8, 0x52, 0x0b, 0x00, 0x00    ; cmp byte [eax*2 + 0xb52a8], 0
    je short loc_2b44
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2b44:
    test byte [esp + 1], 0x40
    je short loc_2ba3
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    movsx edx, word [eax + 0xb5240]
    imul edx, edx, 0x2c
    cmp byte [edx + 0x1c0bb8], 0x20
    jbe short loc_2ba3
    cmp word [edx + 0x1c0bce], 0
    jle short loc_2ba3
    cmp word [eax + 0xb5258], 0
    jne short loc_2ba3
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2ba3:
    test byte [esp + 1], 0x80
    je short loc_2bee
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bce], 0
    jg short loc_2bee
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2bee:
    test byte [esp + 2], 1
    je near loc_2cfd
    mov eax, dword [0x3bce8]
    cmp word [eax + 0xe], 0x214
    jne short loc_2c6e
    cmp dword [0xe97df], 1
    jle short loc_2c6e
    movsx edx, word [0x3bece]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [0x336e8]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add ebx, ebx
    lea edx, [eax + eax]
    mov eax, dword [ebx + 0xb5118]
    sub eax, dword [edx + 0xb5118]
    mov esi, dword [edx + 0xb5114]
    mov ecx, eax
    mov eax, dword [ebx + 0xb5114]
    mov edx, ecx
    sub eax, esi
    call 0x65698
    movsx edx, word [0x336e8]
    jmp short loc_2cb1
loc_2c6e:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ecx, dword [0x3bce8]
    lea edx, [eax + eax]
    mov ebx, dword [ecx + 4]
    mov edi, dword [edx + 0xb5118]
    mov eax, dword [ecx]
    mov ebp, dword [edx + 0xb5114]
    sub ebx, edi
    sub eax, ebp
    mov edx, ebx
    call 0x65698
    movsx edx, word [0x3bece]
loc_2cb1:
    movsx ebx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, ebx
    db 0x0f, 0xbf, 0x04, 0x45, 0x98, 0x51, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5198]
    call 0x374b0
    movsx esi, ax
    cmp esi, -0x80
    jle short loc_2cfb
    cmp esi, 0x80
    jge short loc_2cfb
    mov esi, 1
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2cfb:
    xor esi, esi
loc_2cfd:
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ebp, dword [0xe54cc]
    add ebp, 4
    mov eax, dword [0x3bce8]
    mov dword [0xe54cc], ebp
    movsx edx, word [eax + 0x2a]
    cmp edx, dword [ebp]
    setle al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea esi, [eax + 8]
    movsx ecx, word [0x3bece]
    mov dword [0xe54cc], esi
    mov eax, dword [0x3bce8]
    movsx ebx, word [esi]
    movsx edx, word [esi - 4]
    call 0x28990
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx edx, word [eax + 0x4e9d9]
    mov eax, dword [0xe54cc]
    add eax, 4
    mov dword [0xe54cc], eax
    cmp edx, dword [eax]
    sete al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov ebp, dword [0xe54cc]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    add ebp, 4
    add eax, edx
    mov dword [0xe54cc], ebp
    call 0x47ef0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3becc]
    lea ebx, [edx*8]
    add ebx, edx
    lea ebx, [ebx*8]
    sub ebx, edx
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ecx, dword [0xe54cc]
    mov edx, eax
    add ecx, 4
    mov eax, dword [ebx + 0x4e9eb]
    mov esi, dword [edx + 0x4e9ef]
    mov edx, eax
    mov dword [0xe54cc], ecx
    sub edx, esi
    mov edi, dword [ecx]
    sar edx, 8
    cmp edx, edi
    setl al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    lea eax, [edx*4]
    add eax, edx
    db 0x8b, 0x04, 0x45, 0x66, 0x02, 0x0e, 0x00    ; mov eax, dword [eax*2 + 0xe0266]
    and eax, 0x20000000
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x3bce8]
    movsx edx, word [eax + 0x18]
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + 0x2385b0]
    xor ah, ah
    and al, 1
    cwde
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp dword [0xe97df], 1
    setg al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edi, dword [0xe54cc]
    add edi, 4
    mov eax, dword [0x3bce8]
    mov dword [0xe54cc], edi
    movsx edx, word [eax + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385c6], 0
    jne near loc_3a9a
    push 1
    push 0x300
    mov eax, 0xe4450
    push eax
    mov eax, 0xe8cbe
    mov ecx, dword [0x3bce8]
    push eax
    mov eax, 0xe8cc2
    mov ebx, dword [0x3bce8]
    push eax
    mov eax, 0xe8cc4
    mov edx, dword [0x3bce8]
    push eax
    mov eax, dword [0x3bce8]
    movsx ecx, word [ecx + 0x18]
    movsx eax, word [eax + 0x1c]
    mov ebx, dword [ebx + 8]
    push eax
    mov eax, dword [0x3bce8]
    mov edx, dword [edx + 4]
    sub ebx, 0x2000
    mov eax, dword [eax]
    call 0x6c23c
    mov cx, word [0xe8cc4]
    test cx, cx
    jl near loc_3a9a
    movsx edx, cx
    lea eax, [edx*4]
    add eax, edx
    movsx eax, word [eax*8 + 0x2385c6]
    call 0x53610
    test al, al
    je near loc_3a9a
    movsx edx, word [0xe8cc4]
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + 0x2385c6]
    xor ah, ah
    db 0x66, 0x3d, 0x17, 0x00    ; cmp ax, 0x17
    je short loc_3008
    movsx edx, word [0xe8cc4]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, word [0xe8cc4]
    lea eax, [edx*4]
    add edx, eax
    lea ebx, [ebx*8]
    lea edx, [edx*8]
    mov eax, dword [ebx + 0x2385ac]
    cmp eax, dword [edx + 0x2385a8]
    jne near loc_3a9a
loc_3008:
    movsx ebx, word [0xe8cc4]
    lea eax, [ebx*4]
    add eax, ebx
    lea eax, [eax*8]
    test byte [eax + 0x2385c7], 0x40
    jne near loc_3a9a
    movsx eax, word [eax + 0x2385c6]
    test ah, 0x80
    jne near loc_3a9a
    db 0x0f, 0xbf, 0x34, 0x5d, 0xc4, 0x5c, 0x24, 0x00    ; movsx esi, word [ebx*2 + 0x245cc4]
loc_3044:
    test esi, esi
    jl short loc_305f
    imul eax, esi, 0x2c
    cmp word [eax + 0x1c0bb2], 2
    je short loc_305f
    db 0x0f, 0xbf, 0x34, 0x75, 0xa4, 0xc8, 0x1b, 0x00    ; movsx esi, word [esi*2 + 0x1bc8a4]
    jmp short loc_3044
loc_305f:
    cmp esi, -1
    jne near loc_3a9a
    movsx edx, word [0x3becc]
    movsx eax, word [0xe8cc4]
    call 0x540d0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x3bce8]
    movsx eax, word [eax + 0x18]
    call 0x27530
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [0xe54cc]
    add edx, 4
    mov eax, dword [0x3bce8]
    mov dword [0xe54cc], edx
    cmp word [eax + 0xe], 0x214
    je short loc_30e7
    xor ebx, ebx
    movsx edx, word [0x3becc]
    mov bl, byte [eax + 0x11]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov word [eax + 0x4e9e3], bx
loc_30e7:
    mov edx, dword [0xe54cc]
    mov eax, dword [0x3bce8]
    mov dl, byte [edx]
    mov byte [eax + 0x11], dl
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea esi, [eax + 4]
    mov dword [0xe54cc], esi
    mov edx, dword [0x3bce8]
    mov ax, word [esi]
    mov word [edx + 0xe], ax
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x3bce8]
    call 0x39c40
    cmp al, 1
    sete al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x3bce8]
    call 0x12be0
    test ax, ax
    je short loc_317d
    mov eax, dword [0xe979b]
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_317d:
    mov eax, dword [0x3bce8]
    call 0x12b80
    test ax, ax
    je short loc_31a2
    mov eax, dword [0xe97a3]
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_31a2:
    mov eax, dword [0xe979f]
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    mov edi, dword [0xe54cc]
    lea eax, [eax*8]
    add edi, 4
    sub eax, edx
    mov edx, dword [0x3bce8]
    mov dword [0xe54cc], edi
    mov eax, dword [eax + 0x4e9eb]
    mov ebp, dword [edx + 8]
    mov edx, eax
    mov eax, dword [edi]
    sub edx, ebp
    shl eax, 8
    cmp edx, eax
    setle al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    mov ecx, dword [0xe54cc]
    sub eax, edx
    add ecx, 4
    mov edx, eax
    mov eax, dword [0x3bce8]
    mov dword [0xe54cc], ecx
    mov eax, dword [eax + 8]
    mov esi, dword [edx + 0x4e9ef]
    mov edx, eax
    mov eax, dword [ecx]
    sub edx, esi
    shl eax, 8
    cmp edx, eax
    setle al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    movsx edx, word [0x3bece]
    mov dword [0xe54cc], eax
    mov ebx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [ebx]
    mov dword [edx + 0xb5174], eax
    mov edx, ebx
    add edx, 4
    xor esi, esi
    mov dword [0xe54cc], edx
    jmp short loc_32df
loc_32aa:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [0xe54cc]
    add eax, eax
    add ebx, 4
    lea edx, [eax + esi]
    inc esi
    mov al, byte [ebx - 4]
    mov dword [0xe54cc], ebx
    mov byte [edx + 0xb52f0], al
loc_32df:
    cmp esi, 3
    jl short loc_32aa
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    mov ebx, dword [0xe54cc]
    add ebx, 4
    mov dword [0xe54cc], ebx
    mov ecx, dword [ebx]
    movsx edx, word [eax + 0x1c0bce]
    cmp edx, ecx
    setl al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebp, [eax + 4]
    mov dword [0xe54cc], ebp
    lea edx, [ebp + 4]
    mov dword [0xe54cc], edx
    mov eax, dword [ebp]
    xor esi, esi
    cmp eax, 0xa
    ja near loc_3582
    jmp dword cs:[eax*4 + 0x2ae9c]
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x8a, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb528a]
    mov eax, dword [0xe54cc]
    cmp edx, dword [eax]
    je near loc_3582
    jmp near loc_357d
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edi, dword [0xe7220]
    db 0x0f, 0xbf, 0x04, 0x45, 0x8c, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb528c]
    cmp eax, edi
    je near loc_3582
    jmp near loc_357d
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x86, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5286]
    mov eax, dword [0xe54cc]
    cmp edx, dword [eax]
    je near loc_3582
    jmp near loc_357d
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x1c, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb521c]
    mov eax, dword [0xe54cc]
    cmp edx, dword [eax]
    je near loc_3582
    jmp near loc_357d
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x88, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5288]
    mov eax, dword [0xe54cc]
    cmp edx, dword [eax]
    je near loc_3582
    jmp near loc_357d
    mov eax, dword [0x3bce8]
    mov al, byte [eax + 0x11]
    cmp al, 0x15
    jb short loc_347a
    jbe short loc_34ac
    cmp al, 0x17
    je short loc_34d6
    jmp near loc_3582
loc_347a:
    test al, al
    jne near loc_3582
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xf6, 0x04, 0x45, 0x36, 0x52, 0x0b, 0x00, 0x01    ; test byte [eax*2 + 0xb5236], 1
    je near loc_3582
    jmp near loc_357d
loc_34ac:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xf6, 0x04, 0x45, 0x36, 0x52, 0x0b, 0x00, 0x02    ; test byte [eax*2 + 0xb5236], 2
    je near loc_3582
    jmp near loc_357d
loc_34d6:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xf6, 0x04, 0x45, 0x36, 0x52, 0x0b, 0x00, 0x04    ; test byte [eax*2 + 0xb5236], 4
    je near loc_3582
    jmp near loc_357d
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x54, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5254]
    mov eax, dword [0xe54cc]
    cmp edx, dword [eax]
    je short loc_3582
    jmp short loc_357d
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x3a, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb523a]
    mov eax, dword [0xe54cc]
    cmp edx, dword [eax]
    je short loc_3582
    jmp short loc_357d
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0xe54cc]
    db 0x0f, 0xbf, 0x04, 0x45, 0x9c, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb529c]
    cmp eax, dword [edx]
    je short loc_3582
loc_357d:
    mov esi, 1
loc_3582:
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov ebx, dword [0xe54cc]
    sub eax, edx
    add ebx, 4
    db 0x66, 0x8b, 0x3c, 0x45, 0x28, 0x52, 0x0b, 0x00    ; mov di, word [eax*2 + 0xb5228]
    mov dword [0xe54cc], ebx
    test di, di
    jne near loc_3a9a
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x1c0bb8], 0x28
    jb near loc_3a9a
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x1c0bbc]
    movsx edx, word [0x3bece]
    push eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x04, 0x45, 0x1c, 0x51, 0x0b, 0x00    ; mov eax, dword [eax*2 + 0xb511c]
    add eax, 0x1000
    movsx edx, word [0x3bece]
    push eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov ebx, dword [0x3bce8]
    sub eax, edx
    movsx edx, word [0x3bece]
    db 0x8b, 0x0c, 0x45, 0x18, 0x51, 0x0b, 0x00    ; mov ecx, dword [eax*2 + 0xb5118]
    mov eax, edx
    mov ebx, dword [ebx + 8]
    shl eax, 7
    push ecx
    sub eax, edx
    mov ecx, dword [0x3bce8]
    lea eax, [eax*4]
    sub ebx, 0x400
    sub eax, edx
    movsx ecx, word [ecx + 0x18]
    mov edx, dword [0x3bce8]
    db 0x8b, 0x34, 0x45, 0x14, 0x51, 0x0b, 0x00    ; mov esi, dword [eax*2 + 0xb5114]
    mov eax, dword [0x3bce8]
    push esi
    mov edx, dword [edx + 4]
    mov eax, dword [eax]
    call 0x6ae4d
    test eax, eax
    je near loc_3a9a
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0xc7, 0x04, 0x45, 0x28, 0x52, 0x0b, 0x00, 0x01, 0x00    ; mov word [eax*2 + 0xb5228], 1
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0x83, 0x3c, 0x45, 0x92, 0x52, 0x0b, 0x00, 0x00    ; cmp word [eax*2 + 0xb5292], 0
    jne short loc_3721
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0xc7, 0x04, 0x45, 0x92, 0x52, 0x0b, 0x00, 0xff, 0xff    ; mov word [eax*2 + 0xb5292], 0xffff
loc_3721:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ax, word [0x3becc]
    mov word [edx + 0xb5256], ax
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x3bce8]
    mov ax, word [eax + 0x18]
    mov dword [esp + 4], eax
    mov eax, dword [0x3bce8]
    lea ebx, [esp + 4]
    mov edx, dword [eax + 4]
    mov eax, dword [eax]
    add edx, 0x6c
    add eax, 0x6c
    call 0x6e997
    mov edx, dword [0x3bce8]
    mov eax, dword [esp + 4]
    mov di, word [edx + 0x18]
    xor esi, esi
    cmp ax, di
    jne near loc_3810
    mov eax, dword [0x3bce8]
    lea ebx, [esp + 4]
    mov edx, dword [edx + 4]
    mov eax, dword [eax]
    sub edx, 0x6c
    sub eax, 0x6c
    call 0x6e997
    mov edx, dword [0x3bce8]
    mov eax, dword [esp + 4]
    cmp ax, word [edx + 0x18]
    jne short loc_3810
    mov eax, dword [0x3bce8]
    lea ebx, [esp + 4]
    mov edx, dword [edx + 4]
    mov eax, dword [eax]
    sub edx, 0x6c
    add eax, 0x6c
    call 0x6e997
    mov edx, dword [0x3bce8]
    mov eax, dword [esp + 4]
    cmp ax, word [edx + 0x18]
    jne short loc_3810
    mov eax, edx
    lea ebx, [esp + 4]
    mov edx, dword [edx + 4]
    mov eax, dword [eax]
    add edx, 0x6c
    sub eax, 0x6c
    call 0x6e997
    mov edx, dword [0x3bce8]
    mov eax, dword [esp + 4]
    cmp ax, word [edx + 0x18]
    jne short loc_3810
    mov esi, 1
loc_3810:
    mov eax, esi
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    mov ebp, dword [0xe54cc]
    lea eax, [eax*4]
    add ebp, 4
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    mov dword [0xe54cc], ebp
    add edx, eax
    movsx eax, word [ebp]
    call 0x15e90
    add dword [0xe54cc], 4
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x3bce8]
    movsx eax, word [eax + 0x18]
    call 0x27580
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx eax, word [eax + 0x4e9e1]
    and eax, 0xc000
    cmp eax, 0x4000
    setg al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edi, dword [0xe54cc]
    add edi, 4
    mov eax, dword [0x3bce8]
    mov dword [0xe54cc], edi
    mov ax, word [eax + 0xe]
    cmp ax, 0x52b
    jb short loc_393d
    jbe near loc_396b
    cmp ax, 0x538
    jb short loc_3926
    jbe near loc_396b
    cmp ax, 0xd7a
    jb short loc_391b
    jbe near loc_396b
    cmp ax, 0x1300
    je near loc_396b
    jmp near loc_3991
loc_391b:
    cmp ax, 0x573
    je short loc_396b
    jmp near loc_3991
loc_3926:
    cmp ax, 0x52d
    jb near loc_3991
    jbe short loc_396b
    cmp ax, 0x536
    je short loc_396b
    jmp near loc_3991
loc_393d:
    cmp ax, 0x50e
    jb short loc_395d
    jbe short loc_396b
    cmp ax, 0x525
    jb short loc_3955
    jbe short loc_396b
    cmp ax, 0x529
    je short loc_396b
    jmp short loc_3991
loc_3955:
    cmp ax, 0x520
    je short loc_396b
    jmp short loc_3991
loc_395d:
    cmp ax, 0x25b
    jb short loc_3991
    jbe short loc_396b
    cmp ax, 0x2f1
    jne short loc_3991
loc_396b:
    mov eax, dword [0x3bce8]
    mov cx, word [eax + 0x22]
    test cx, cx
    je near loc_3a9a
    movsx eax, cx
    call 0x54fb0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_3991:
    mov eax, dword [0x3bce8]
    mov si, word [eax + 0x28]
    test si, si
    jl near loc_3a9a
    movsx eax, si
    call 0x54fb0
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea ebx, [eax + 4]
    mov edx, dword [0x3bce8]
    mov dword [0xe54cc], ebx
    mov dl, byte [edx + 0x11]
    and edx, 0xff
    cmp edx, dword [ebx]
    sete al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add eax, 4
    movsx edx, word [0x3bece]
    mov dword [0xe54cc], eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    mov ebx, dword [0x3bce8]
    lea eax, [eax*4]
    movsx ebx, word [ebx + 0x1c]
    sub eax, edx
    mov edx, ebx
    db 0x0f, 0xbf, 0x04, 0x45, 0x98, 0x51, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5198]
    call 0x374b0
    cwde
    test eax, eax
    jns short loc_3a29
    neg eax
loc_3a29:
    mov edx, dword [0xe54cc]
    cmp eax, dword [edx]
    setle al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov esi, 1
    mov di, word [0x3becc]
    jmp short loc_3a6c
loc_3a58:
    lea eax, [esi*4]
    sub eax, esi
    cmp di, word [eax*8 + 0xb23d0]
    je short loc_3a74
    inc esi
loc_3a6c:
    cmp esi, 0x1c2
    jl short loc_3a58
loc_3a74:
    cmp esi, 0x1c2
    sete al
    and eax, 0xff
    call 0x3ac70
    xor al, al
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_3a93:
    mov byte [0xe9839], 1
loc_3a9a:
    xor al, al
loc_3a9c:
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
%endif
