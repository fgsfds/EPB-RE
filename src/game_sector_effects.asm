; Sector state and effects.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    mov esi, eax
    mov edi, edx
    call 0x9c70c
    test eax, eax
    jne short loc_0060
    cmp byte [0x126233], 0
    jne short loc_0060
    mov eax, 0x2328
    call 0x9ffa7
    mov eax, 0x2348
    call 0x9ffa7
    call 0x9c43c
loc_0034:
    call 0x9c39c
    test eax, eax
    jne short loc_0034
    call 0x9c3b0
    and eax, 0xff
    cmp eax, 0x79
    je short loc_0051
    cmp eax, 0x59
    jne short loc_0060
loc_0051:
    mov eax, 0x2374
    call 0x9ffa7
    call 0x36de0
loc_0060:
    xor edx, edx
    mov eax, esi
    mov dl, byte [0x126233]
    call 0x77cee
    mov ecx, eax
    test eax, eax
    jne short loc_0094
    cmp byte [0x126233], 1
    jne short loc_0088
    mov eax, 0x237c
    call 0x15ff0
loc_0088:
    mov byte [0x126233], 1
    jmp near loc_030c
loc_0094:
    push esi
    push 0x2394
    call 0x9fc44
    add esp, 8
    mov eax, ecx
    mov edx, edi
    call 0x77fa4
    mov ebp, eax
    mov dword [0x1239f4], edi
    mov dword [0x6c510], eax
    mov ebx, eax
    mov eax, ecx
    mov dword [0x6c500], edi
    call 0x77e20
    mov eax, ecx
    call 0x77fe5
    mov eax, dword [0x1239f4]
    mov edi, 0xea3f8
    mov ecx, 0x1000
    mov byte [eax + ebp - 2], 0
    xor eax, eax
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    mov ecx, 0x1000
    mov edi, 0xd21f8
    xor edx, edx
    cmp ecx, 4
    jae short loc_0104
    test cl, 1
    je short loc_00fd
    db 0xaa    ; stosb byte es:[edi], al
loc_00fd:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_012f
loc_0104:
    test edi, 1
    je short loc_010e
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_010e:
    test edi, 2
    je short loc_011b
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_011b:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_0129
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_0129:
    test bl, 1
    je short loc_012f
    db 0xaa    ; stosb byte es:[edi], al
loc_012f:
    mov ebx, 0xd3a0c
    mov dword [0x1239b0], edx
    xor ecx, ecx
    xor dl, dl
    mov dword [0x1239f0], ebx
    mov byte [0x126236], dl
    mov byte [0x126237], dl
    xor ebx, ebx
    mov edx, 1
    mov word [0x6c6f0], bx
    mov word [0x6c6f4], dx
    call 0x36db0
    mov eax, dword [0x1239f0]
    mov cl, byte [0x126236]
    mov dword [0xd3a08], eax
    xor eax, eax
    mov edx, ecx
    mov al, byte [0x126237]
    or edx, eax
    je short loc_0196
    push eax
    push ecx
    push 0x23b4
    call 0x9fc44
    add esp, 0xc
loc_0196:
    cmp byte [0x126237], 0
    jne near loc_021d
    cmp byte [0x126236], 0
    je near loc_021d
    cmp dword [0x121ec0], -1
    je short loc_021d
    cmp byte [0x126233], 0
    jne short loc_021d
    push esi
    push 0x23dc
    call 0x9fc44
    add esp, 8
    mov eax, 0x2428
    call 0x9ffa7
    mov eax, 0x2464
    call 0x9ffa7
    call 0x9c43c
loc_01e9:
    call 0x9c39c
    test eax, eax
    jne short loc_01e9
    call 0x9c3b0
    and eax, 0xff
    cmp eax, 0x79
    je short loc_0206
    cmp eax, 0x59
    jne short loc_021d
loc_0206:
    mov byte [0x126233], 1
    mov eax, 0x2374
    call 0x9ffa7
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_021d:
    cmp byte [0x126237], 0
    je near loc_02ca
    mov dh, byte [0x126233]
    test dh, dh
    je short loc_0249
    push esi
    push 0x2480
    push 0xf15d0
    call 0x9fc79
    jmp near loc_0309
loc_0249:
    cmp dword [0x121ec0], -1
    je near loc_030c
    test dh, dh
    jne near loc_030c
    push esi
    push 0x2490
    call 0x9fc44
    add esp, 8
    mov eax, 0x24d4
    call 0x9ffa7
    mov eax, 0x2510
    call 0x9ffa7
    call 0x9c43c
loc_0285:
    call 0x9c39c
    test eax, eax
    je short loc_0285
    call 0x9c3b0
    and eax, 0xff
    cmp eax, 0x79
    je short loc_02a2
    cmp eax, 0x59
    jne short loc_02ba
loc_02a2:
    mov eax, 0x2374
    mov bh, 1
    call 0x9ffa7
    mov byte [0x126233], bh
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_02ba:
    mov eax, 0x252c
    call 0x15ff0
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_02ca:
    mov ax, word [0x6c6f4]
    mov cx, word [0x6c6f0]
    add ecx, eax
    mov eax, dword [0x1239f0]
    sub eax, 0xd3a08
    sar eax, 2
    mov esi, dword [0x1239b0]
    lea eax, [eax*4]
    push esi
    sub eax, 4
    push eax
    push 0x2530
    mov word [0x6c6f0], cx
    call 0x9fc44
loc_0309:
    add esp, 0xc
loc_030c:
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x18
    mov dword [esp + 0x14], eax
    mov eax, dword [eax]
    mov dword [esp + 0x10], eax
    mov eax, dword [esp + 0x14]
    mov eax, dword [eax + 4]
    mov dword [esp], eax
    mov eax, dword [esp + 0x14]
    movsx eax, word [eax + 0x1c]
    add eax, 0x200
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov dword [esp + 0xc], eax
    mov eax, dword [esp + 0x14]
    mov ax, word [eax + 0x1c]
    and ah, 7
    cwde
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov dx, word [0x2d6bda]
    mov dword [esp + 8], eax
    jmp near loc_04a3
loc_037f:
    movsx ebx, dx
    imul ebx, ebx, 0x2c
    cmp dx, word [ebx + 0x2522d2]
    je near loc_0498
    mov ecx, dword [esp + 0x14]
    mov ax, word [ebx + 0x2522cc]
    cmp ax, word [ecx + 0x18]
    jne near loc_0498
    movsx eax, word [0x6c6ec]
    call 0x16f50
    test eax, eax
    je short loc_03c6
    cmp word [ebx + 0x2522c2], 0x27f
    je near loc_0498
loc_03c6:
    movsx eax, word [0x6c6ec]
    call 0x16f10
    test eax, eax
    je short loc_03eb
    movsx eax, dx
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 0x27e
    je near loc_0498
loc_03eb:
    movsx eax, dx
    imul eax, eax, 0x2c
    mov ebx, dword [esp + 0x10]
    mov ecx, dword [eax + 0x2522b4]
    mov edi, dword [esp + 0xc]
    sub ecx, ebx
    imul edi, ecx
    mov esi, dword [esp]
    mov ebx, dword [eax + 0x2522b8]
    sub ebx, esi
    mov dword [esp + 4], edi
    mov edi, dword [esp + 8]
    imul edi, ebx
    movsx esi, word [eax + 0x2522d0]
    mov ax, word [eax + 0x2522d0]
    add esi, 0x200
    and ah, 7
    and esi, 0x7ff
    cwde
    mov ebp, dword [esp + 4]
    db 0x0f, 0xbf, 0x34, 0x75, 0xb4, 0x96, 0x24, 0x00    ; movsx esi, word [esi*2 + 0x2496b4]
    add edi, ebp
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    test edi, edi
    jl short loc_0498
    mov edi, esi
    imul edi, ecx
    mov ebp, eax
    imul ebp, ebx
    add edi, ebp
    test edi, edi
    jge short loc_0498
    imul ebx, esi
    imul eax, ecx
    sub ebx, eax
    mov eax, ebx
    test eax, eax
    jns short loc_0472
    neg eax
loc_0472:
    cmp eax, 0x400000
    jge short loc_0498
    call 0x6dc5f
    xor al, al
    mov ebx, dword [esp + 0x14]
    and ah, 4
    mov cx, word [ebx + 0x1c]
    add ah, 2
    sub ecx, eax
    mov al, 1
    mov word [ebx + 0x1c], cx
    jmp short loc_04ae
loc_0498:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
loc_04a3:
    test dx, dx
    jge near loc_037f
    xor al, al
loc_04ae:
    add esp, 0x18
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
%else
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    mov esi, eax
    mov edi, edx
    call 0x9f24c
    test eax, eax
    jne short loc_0060
    cmp byte [0xe9833], 0
    jne short loc_0060
    mov eax, 0x2318
    call 0xa2a43
    mov eax, 0x2338
    call 0xa2a43
    call 0x9ef7c
loc_0034:
    call 0x9eedc
    test eax, eax
    jne short loc_0034
    call 0x9eef0
    and eax, 0xff
    cmp eax, 0x79
    je short loc_0051
    cmp eax, 0x59
    jne short loc_0060
loc_0051:
    mov eax, 0x2364
    call 0xa2a43
    call 0x39870
loc_0060:
    xor edx, edx
    mov eax, esi
    mov dl, byte [0xe9833]
    call 0x7a82e
    mov ecx, eax
    test eax, eax
    jne short loc_0094
    cmp byte [0xe9833], 1
    jne short loc_0088
    mov eax, 0x236c
    call 0x16030
loc_0088:
    mov byte [0xe9833], 1
    jmp near loc_031a
loc_0094:
    push esi
    push 0x2384
    call 0xa2784
    add esp, 8
    mov eax, ecx
    mov edx, edi
    call 0x7aae4
    mov ebp, eax
    mov dword [0xe6ff4], edi
    mov dword [0x3bcf0], eax
    mov ebx, eax
    mov eax, ecx
    mov dword [0x3bce0], edi
    call 0x7a960
    mov eax, ecx
    call 0x7ab25
    mov eax, dword [0xe6ff4]
    mov edi, 0xab198
    mov ecx, 0x1000
    mov byte [eax + ebp - 2], 0
    xor eax, eax
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    mov ecx, 0x1000
    mov edi, 0x959d8
    xor edx, edx
    cmp ecx, 4
    jae short loc_0104
    test cl, 1
    je short loc_00fd
    db 0xaa    ; stosb byte es:[edi], al
loc_00fd:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_012f
loc_0104:
    test edi, 1
    je short loc_010e
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_010e:
    test edi, 2
    je short loc_011b
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_011b:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_0129
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_0129:
    test bl, 1
    je short loc_012f
    db 0xaa    ; stosb byte es:[edi], al
loc_012f:
    mov ebx, 0x971ec
    mov dword [0xe6fb0], edx
    xor ecx, ecx
    xor dl, dl
    mov dword [0xe6ff0], ebx
    mov byte [0xe9836], dl
    mov byte [0xe9837], dl
    xor ebx, ebx
    mov edx, 1
    mov word [0x3bed2], bx
    mov word [0x3bed4], dx
    call 0x39840
    mov eax, dword [0xe6ff0]
    mov cl, byte [0xe9836]
    mov dword [0x971e8], eax
    xor eax, eax
    mov edx, ecx
    mov al, byte [0xe9837]
    or edx, eax
    je short loc_0196
    push eax
    push ecx
    push 0x23a4
    call 0xa2784
    add esp, 0xc
loc_0196:
    cmp byte [0xe9837], 0
    jne near loc_021d
    cmp byte [0xe9836], 0
    je near loc_021d
    cmp dword [0xe54c0], -1
    je short loc_021d
    cmp byte [0xe9833], 0
    jne short loc_021d
    push esi
    push 0x23cc
    call 0xa2784
    add esp, 8
    mov eax, 0x2418
    call 0xa2a43
    mov eax, 0x2454
    call 0xa2a43
    call 0x9ef7c
loc_01e9:
    call 0x9eedc
    test eax, eax
    jne short loc_01e9
    call 0x9eef0
    and eax, 0xff
    cmp eax, 0x79
    je short loc_0206
    cmp eax, 0x59
    jne short loc_021d
loc_0206:
    mov byte [0xe9833], 1
    mov eax, 0x2364
    call 0xa2a43
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_021d:
    cmp byte [0xe9837], 0
    je near loc_02d8
    mov dh, byte [0xe9833]
    test dh, dh
    je short loc_0257
    push esi
    push 0x2470
    push 0xb2370
    call 0xa27b9
    add esp, 0xc
    mov eax, 0xb2370
    call 0x16030
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_0257:
    cmp dword [0xe54c0], -1
    je near loc_031a
    test dh, dh
    jne near loc_031a
    push esi
    push 0x2480
    call 0xa2784
    add esp, 8
    mov eax, 0x24c4
    call 0xa2a43
    mov eax, 0x2500
    call 0xa2a43
    call 0x9ef7c
loc_0293:
    call 0x9eedc
    test eax, eax
    je short loc_0293
    call 0x9eef0
    and eax, 0xff
    cmp eax, 0x79
    je short loc_02b0
    cmp eax, 0x59
    jne short loc_02c8
loc_02b0:
    mov eax, 0x2364
    mov bh, 1
    call 0xa2a43
    mov byte [0xe9833], bh
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_02c8:
    mov eax, 0x251c
    call 0x16030
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_02d8:
    mov ax, word [0x3bed4]
    mov cx, word [0x3bed2]
    add ecx, eax
    mov eax, dword [0xe6ff0]
    sub eax, 0x971e8
    sar eax, 2
    mov esi, dword [0xe6fb0]
    lea eax, [eax*4]
    push esi
    sub eax, 4
    push eax
    push 0x2520
    mov word [0x3bed2], cx
    call 0xa2784
    add esp, 0xc
loc_031a:
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x14
    mov ebp, eax
    mov eax, dword [eax]
    mov dword [esp + 4], eax
    mov eax, ebp
    mov eax, dword [eax + 4]
    mov dword [esp + 0x10], eax
    mov eax, ebp
    movsx eax, word [eax + 0x1c]
    add eax, 0x200
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov dword [esp + 8], eax
    mov eax, ebp
    mov ax, word [eax + 0x1c]
    and ah, 7
    cwde
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov dx, word [0x2454ca]
    mov dword [esp + 0xc], eax
    jmp near loc_044b
loc_0378:
    movsx eax, dx
    imul eax, eax, 0x2c
    cmp dx, word [eax + 0x1c0bc2]
    je near loc_0440
    mov bx, word [eax + 0x1c0bbc]
    cmp bx, word [ebp + 0x18]
    jne near loc_0440
    mov ebx, dword [esp + 4]
    mov ecx, dword [eax + 0x1c0ba4]
    mov edi, dword [esp + 8]
    sub ecx, ebx
    imul edi, ecx
    mov esi, dword [esp + 0x10]
    mov ebx, dword [eax + 0x1c0ba8]
    sub ebx, esi
    mov dword [esp], edi
    mov edi, dword [esp + 0xc]
    imul edi, ebx
    movsx esi, word [eax + 0x1c0bc0]
    mov ax, word [eax + 0x1c0bc0]
    add esi, 0x200
    and ah, 7
    and esi, 0x7ff
    cwde
    db 0x0f, 0xbf, 0x34, 0x75, 0xa4, 0x7f, 0x1b, 0x00    ; movsx esi, word [esi*2 + 0x1b7fa4]
    add edi, dword [esp]
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    test edi, edi
    jl short loc_0440
    mov edi, esi
    imul edi, ecx
    mov dword [esp], edi
    mov edi, eax
    imul edi, ebx
    add edi, dword [esp]
    test edi, edi
    jge short loc_0440
    imul ebx, esi
    imul eax, ecx
    sub ebx, eax
    mov eax, ebx
    test eax, eax
    jns short loc_041e
    neg eax
loc_041e:
    cmp eax, 0x400000
    jge short loc_0440
    call 0x7079f
    xor al, al
    and ah, 4
    mov di, word [ebp + 0x1c]
    add ah, 2
    sub edi, eax
    mov al, 1
    mov word [ebp + 0x1c], di
    jmp short loc_0456
loc_0440:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
loc_044b:
    test dx, dx
    jge near loc_0378
    xor al, al
loc_0456:
    add esp, 0x14
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
%endif
