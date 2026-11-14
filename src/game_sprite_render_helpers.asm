; Game state and sprite rendering helpers.
bits 32
org START_ADDRESS

loc_0000:
    mov ebx, dword [eax*4 + LINK_ADDRESS_1]
    dec eax
    mov ebx, dword [ebx]
    mov dword [eax*4 + LINK_ADDRESS_2], ebx
    test eax, eax
    jge short loc_0000
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push edx
    mov ebx, eax
    mov edx, dword [LINK_ADDRESS_3]
    cmp edx, 0x800
    jge short loc_0066
    lea eax, [edx - 1]
    jmp short loc_0044
loc_003a:
    cmp ebx, dword [eax*4 + LINK_ADDRESS_1]
    je short loc_0066
    dec eax
loc_0044:
    test eax, eax
    jge short loc_003a
    mov eax, dword [LINK_ADDRESS_3]
    mov dword [eax*4 + LINK_ADDRESS_1], ebx
    mov edx, dword [ebx]
    lea ebx, [eax + 1]
    mov dword [eax*4 + LINK_ADDRESS_4], edx
    mov dword [LINK_ADDRESS_3], ebx
loc_0066:
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov esi, eax
    mov edx, dword [LINK_ADDRESS_3]
    dec edx
    cmp edx, dword [LINK_ADDRESS_5]
    jge short loc_008f
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_008f:
    lea eax, [edx*4]
    cmp esi, dword [eax + LINK_ADDRESS_1]
    jne short loc_00d2
    mov edi, dword [LINK_ADDRESS_3]
    dec edi
    mov ecx, dword [edi*4 + LINK_ADDRESS_4]
    mov ebx, dword [edi*4 + LINK_ADDRESS_1]
    mov dword [LINK_ADDRESS_3], edi
    mov dword [eax + LINK_ADDRESS_4], ecx
    mov ecx, dword [edi*4 + LINK_ADDRESS_6]
    mov dword [eax + LINK_ADDRESS_1], ebx
    mov dword [eax + LINK_ADDRESS_6], ecx
loc_00d2:
    dec edx
    cmp edx, dword [LINK_ADDRESS_5]
    jge short loc_008f
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov esi, eax
    mov ebx, dword [LINK_ADDRESS_3]
    xor ecx, ecx
    xor edi, edi
    dec ebx
    test ebx, ebx
    jge short loc_0101
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0101:
    mov edx, dword [ebx*4 + LINK_ADDRESS_1]
    mov ebp, dword [edx]
    mov dword [ebx*4 + LINK_ADDRESS_6], ebp
    mov ebp, ecx
    mov ecx, dword [edx]
    sub ecx, dword [ebx*4 + LINK_ADDRESS_4]
    cmp ebp, ecx
    je short loc_012c
    mov edx, esi
    mov eax, ecx
    imul edx
    shrd eax, edx, 0x10
    mov edi, eax
loc_012c:
    mov edx, dword [ebx*4 + LINK_ADDRESS_4]
    mov eax, dword [ebx*4 + LINK_ADDRESS_1]
    add edx, edi
    dec ebx
    mov dword [eax], edx
    test ebx, ebx
    jge short loc_0101
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push ebx
    push edx
    mov eax, dword [LINK_ADDRESS_3]
    dec eax
    test eax, eax
    jge short loc_0162
    pop edx
    pop ebx
    ret
loc_0162:
    mov ebx, dword [eax*4 + LINK_ADDRESS_1]
    mov edx, dword [eax*4 + LINK_ADDRESS_6]
    dec eax
    mov dword [ebx], edx
    test eax, eax
    jge short loc_0162
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push edx
    movsx edx, ax
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    test byte [eax + LINK_ADDRESS_7], 1
    je short loc_01c5
    cmp byte [eax + LINK_ADDRESS_8], 0
    jne short loc_01c5
    mov ax, word [eax + LINK_ADDRESS_9]
    db 0x66, 0x3d, 0x50, 0x00    ; cmp ax, 0x50
    jb short loc_01c5
    jbe short loc_01be
    db 0x66, 0x3d, 0x54, 0x00    ; cmp ax, 0x54
    jne short loc_01c5
loc_01be:
    mov eax, 1
    pop edx
    ret
loc_01c5:
    xor eax, eax
    pop edx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    push edx
    movsx edx, ax
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    test byte [eax + LINK_ADDRESS_10], 1
    je short loc_0215
    cmp byte [eax + LINK_ADDRESS_8], 0
    jne short loc_0215
    mov ax, word [eax + LINK_ADDRESS_11]
    db 0x66, 0x3d, 0x50, 0x00    ; cmp ax, 0x50
    jb short loc_0215
    jbe short loc_020e
    db 0x66, 0x3d, 0x54, 0x00    ; cmp ax, 0x54
    jne short loc_0215
loc_020e:
    mov eax, 1
    pop edx
    ret
loc_0215:
    xor eax, eax
    pop edx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    push ecx
    mov ecx, ebx
    movsx ebx, ax
    db 0x8d, 0x04, 0x5d, 0x00, 0x00, 0x00, 0x00    ; lea eax, [ebx*2]
    add eax, edx
    mov dx, word [eax + 0x2a6]
    add edx, ecx
    lea ebx, [ebx*4]
    mov word [eax + 0x2a6], dx
    movsx edx, dx
    cmp edx, dword [ebx + LINK_ADDRESS_12]
    jle short loc_0262
    mov dx, word [ebx + LINK_ADDRESS_12]
    mov word [eax + 0x2a6], dx
loc_0262:
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_0273:
    push ebx
    push ecx
    movsx ebx, dx
    add ebx, eax
    cmp byte [ebx + 0x3d3], 0
    jne short loc_0297
    mov byte [ebx + 0x3d3], 1
    cmp dx, LINK_ADDRESS_13
    jne short loc_0297
    mov byte [eax + LINK_ADDRESS_14], 1
loc_0297:
    mov ch, byte [eax + 0x3d1]
    mov word [eax + 0x346], 0
    test ch, ch
    jne short loc_02c3
    mov word [eax + 0x392], 0xffff
    mov bx, word [eax + 0x312]
    mov word [eax + 0x314], bx
    jmp short loc_02dc
loc_02c3:
    mov word [eax + 0x392], 0xa
    mov byte [eax + 0x3d1], 0
    mov word [eax + 0x314], 0xffff
loc_02dc:
    mov word [eax + 0x334], 0
    mov word [eax + 0x312], dx
%if GAME_UPDATE
    cmp dx, 0xa
%else
    cmp dx, 7
%endif
    jb short loc_030c
    jbe short loc_0319
    cmp dx, LINK_ADDRESS_15
    jb short loc_0304
    jbe short loc_0346
    cmp dx, LINK_ADDRESS_16
    je short loc_0346
    jmp short loc_0335
loc_0304:
    cmp dx, LINK_ADDRESS_17
    je short loc_0346
    jmp short loc_0335
loc_030c:
    test dx, dx
    jbe short loc_0346
%if GAME_UPDATE
    cmp dx, 9
%else
    cmp dx, 6
%endif
    je short loc_0327
    jmp short loc_0335
loc_0319:
    movsx edx, word [eax + 0x340]
    mov eax, 0xa9
    jmp short loc_0341
loc_0327:
    movsx edx, word [eax + 0x340]
    mov eax, 5
    jmp short loc_0341
loc_0335:
    movsx edx, word [eax + 0x340]
    mov eax, 0xdb
loc_0341:
    call LINK_ADDRESS_18
loc_0346:
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    cmp word [eax + 0x33a], 0
    jle short loc_0365
    mov byte [eax + 0x3c9], 1
    ret
loc_0365:
    cmp word [eax + 0x38a], 0
    jle short loc_0377
    mov byte [eax + 0x3c9], 2
    ret
loc_0377:
    cmp word [eax + 0x31c], 0
    jle short loc_0389
    mov byte [eax + 0x3c9], 3
    ret
loc_0389:
    cmp word [eax + 0x388], 0
    jle short loc_039b
    mov byte [eax + 0x3c9], 4
    ret
loc_039b:
    cmp word [eax + 0x354], 0
    jle short loc_03ad
    mov byte [eax + 0x3c9], 5
    ret
loc_03ad:
    cmp word [eax + 0x386], 0
    jle short loc_03bf
    mov byte [eax + 0x3c9], 6
    ret
loc_03bf:
    cmp word [eax + 0x39c], 0
    jle short loc_03d1
    mov byte [eax + 0x3c9], 7
    ret
loc_03d1:
    mov byte [eax + 0x3c9], 0
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    mov ebx, eax
    mov dx, word [eax + 0x31a]
    test dx, dx
    jl short loc_0436
    movsx eax, dx
    movsx edx, word [ebx + 0x312]
    mov word [ebx + 0x31a], 0xffff
    cmp eax, edx
    je near loc_050c
    cmp byte [ebx + eax + 0x3d3], 0
    je short loc_0436
    movsx edx, word [ebx + eax*2 + 0x2a6]
    cmp edx, -0x14
    jl short loc_0436
    movsx edx, ax
    mov eax, ebx
    call loc_0273
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0436:
    movsx eax, word [ebx + 0x312]
    cmp byte [ebx + eax + 0x3d3], 0
    je short loc_0456
    cmp word [ebx + eax*2 + 0x2a6], 0
    jg near loc_050c
loc_0456:
    movsx esi, word [ebx + 0x340]
    imul esi, esi, 0x2c
    xor edx, edx
    mov si, word [esi + LINK_ADDRESS_19]
    jmp short loc_04ae
loc_046b:
    movsx ecx, si
    mov eax, ecx
    shl eax, 4
    add ecx, eax
    lea ecx, [ecx*4]
    movsx eax, dx
    mov eax, dword [ecx + eax*4 + LINK_ADDRESS_20]
    test eax, eax
    jne short loc_0491
    mov eax, 9
    jmp short loc_0492
loc_0491:
    dec eax
loc_0492:
    test eax, eax
    je short loc_04b4
    cmp byte [ebx + eax + 0x3d3], 0
    je short loc_04ad
    movsx ecx, word [ebx + eax*2 + 0x2a6]
    cmp ecx, -0x14
    jge short loc_04b4
loc_04ad:
    inc edx
loc_04ae:
    cmp dx, 0xa
    jl short loc_046b
loc_04b4:
    cmp dx, 0xa
    jne short loc_04bc
    xor eax, eax
loc_04bc:
    mov word [ebx + 0x346], 0
    mov dx, word [ebx + 0x312]
    mov word [ebx + 0x334], 0
    mov word [ebx + 0x314], dx
    mov ch, byte [ebx + 0x3d1]
    mov word [ebx + 0x312], ax
    cmp ch, 1
    jne short loc_0503
    mov byte [ebx + 0x3d1], 0
    mov word [ebx + 0x392], 0xa
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0503:
    mov word [ebx + 0x392], 0xffff
loc_050c:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push esi
    push edi
    mov ebx, eax
    mov ecx, edx
    cwde
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_21], 0x214
    jne short loc_0537
    cmp byte [LINK_ADDRESS_22], 0
    jne near loc_062a
loc_0537:
    movsx esi, bx
    imul esi, esi, 0x2c
    movsx edx, word [esi + LINK_ADDRESS_23]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    add eax, SECTOR
    mov edx, dword [eax + 8]
    sub edx, dword [eax + 4]
    mov di, word [eax + 0x22]
    cmp di, 0x17
    je short loc_0595
    cmp byte [esi + LINK_ADDRESS_25], 1
    jne short loc_058a
    cmp edx, 0x2000
    jge short loc_0586
    movsx eax, di
    test ah, 0x80
    jne short loc_0586
    mov al, 1
    jmp short loc_0597
loc_0586:
    xor al, al
    jmp short loc_0597
loc_058a:
    cmp edx, 0xc00
    setl al
    jmp short loc_0597
loc_0595:
    xor al, al
loc_0597:
    test al, al
    je near loc_062a
    movsx edx, cx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_26
    add eax, eax
    add edx, eax
    mov eax, 0xa
    call LINK_ADDRESS_27
    movsx edx, bx
    imul edx, edx, 0x2c
    mov eax, SPRITE
    add eax, edx
    call LINK_ADDRESS_29
    test ax, ax
    je short loc_05e5
    xor eax, eax
    mov word [edx + LINK_ADDRESS_30], ax
loc_05e5:
    movsx edx, bx
    imul eax, edx, 0x2c
    cmp byte [eax + LINK_ADDRESS_25], 1
    jne short loc_0620
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ebx, 1
    mov edx, 0xa23
    mov word [eax + LINK_ADDRESS_31], bx
    mov word [eax + LINK_ADDRESS_32], dx
    jmp short loc_062a
loc_0620:
    mov eax, 1
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_062a:
    xor eax, eax
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push esi
    push edi
    push ebp
    sub esp, 0x40
    mov dword [esp + 0x2c], eax
    mov dword [esp + 0xc], edx
    mov dword [esp + 0x1c], ebx
    mov dword [esp + 0x24], ecx
    mov edi, esp
    mov esi, LINK_ADDRESS_33
    db 0xa5    ; movsd dword es:[edi], dword [esi]
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
    db 0xa4    ; movsb byte es:[edi], byte [esi]
    movsx edi, ax
    imul edi, edi, 0x2c
    add edi, SPRITE
    mov dx, word [edi + 0xe]
    mov ebp, LINK_ADDRESS_34
    cmp dx, 0x27e
    je near loc_0909
    cmp dx, 0x27f
    jne short loc_0685
    cmp byte [edi + 0x14], 0xb
    jb near loc_0909
loc_0685:
    cmp word [edi + 0xe], 0x66e
    je near loc_0909
    mov ebx, 1
    xor edx, edx
    mov ax, word [edi + 0x18]
    mov dword [esp + 0x10], edx
    mov dword [esp + 0x20], ebx
    mov word [ebp], ax
loc_06a8:
    mov esi, dword [esp + 0x10]
    lea ecx, [esi + 1]
    movsx esi, word [ebp + esi*2]
    lea eax, [esi*4]
    lea edx, [esi + eax]
    lea edx, [edx*8]
    mov ebx, dword [edi + 8]
    mov eax, dword [edx + LINK_ADDRESS_35]
    mov dword [esp + 0x10], ecx
    sub eax, ebx
    mov ecx, dword [esp + 0xc]
    sar eax, 8
    cmp eax, ecx
    jge near loc_079d
    movsx eax, word [edx + SECTOR]
    shl eax, 5
    mov ebx, dword [edi]
    mov eax, dword [eax + WALL]
    sub eax, ebx
    test eax, eax
    jns short loc_06fd
    neg eax
loc_06fd:
    mov ebx, eax
    movsx eax, word [edx + SECTOR]
    shl eax, 5
    mov ecx, dword [edi + 4]
    mov eax, dword [eax + LINK_ADDRESS_37]
    sub eax, ecx
    test eax, eax
    jns short loc_071a
    neg eax
loc_071a:
    add ebx, eax
    mov dword [esp + 8], ebx
    mov eax, ebx
    cmp eax, dword [esp + 0xc]
    jl short loc_0795
    movsx eax, word [edx + SECTOR]
    shl eax, 5
    movsx eax, word [eax + LINK_ADDRESS_38]
    shl eax, 5
    movsx eax, word [eax + LINK_ADDRESS_38]
    shl eax, 5
    mov ecx, dword [edi]
    mov eax, dword [eax + WALL]
    sub eax, ecx
    test eax, eax
    jns short loc_0756
    neg eax
loc_0756:
    mov ebx, eax
    movsx eax, word [edx + SECTOR]
    shl eax, 5
    movsx eax, word [eax + LINK_ADDRESS_38]
    shl eax, 5
    movsx eax, word [eax + LINK_ADDRESS_38]
    shl eax, 5
    mov edx, dword [edi + 4]
    mov eax, dword [eax + LINK_ADDRESS_37]
    sub eax, edx
    test eax, eax
    jns short loc_0787
    neg eax
loc_0787:
    add ebx, eax
    mov dword [esp + 8], ebx
    mov eax, ebx
    cmp eax, dword [esp + 0xc]
    jge short loc_079d
loc_0795:
    movsx eax, si
    call LINK_ADDRESS_39
loc_079d:
    lea edx, [esi*4]
    add edx, esi
    lea edx, [edx*8]
    movsx eax, word [edx + SECTOR]
    movsx edx, word [edx + LINK_ADDRESS_40]
    lea ebx, [eax + edx]
    mov edx, WALL
    mov dword [esp + 0x34], eax
    shl eax, 5
    add edx, eax
    mov dword [esp + 0x14], ebx
    mov dword [esp + 0x28], edx
    jmp near loc_08ec
loc_07d9:
    mov eax, dword [esp + 0x28]
    mov edx, dword [edi]
    mov eax, dword [eax]
    sub eax, edx
    test eax, eax
    jns short loc_07e9
    neg eax
loc_07e9:
    mov edx, eax
    mov eax, dword [esp + 0x28]
    mov ebx, dword [edi + 4]
    mov eax, dword [eax + 4]
    sub eax, ebx
    mov ecx, dword [esp + 0xc]
    test eax, eax
    jns short loc_0801
    neg eax
loc_0801:
    add eax, edx
    cmp eax, ecx
    jge near loc_08d8
    mov edx, dword [esp + 0x28]
    movsx edx, word [edx + 0xc]
    test edx, edx
    jl short loc_083f
    mov esi, dword [esp + 0x20]
    jmp short loc_0826
loc_081d:
    movsx eax, word [ebp + esi*2]
    cmp eax, edx
    je short loc_082b
loc_0826:
    dec esi
    test esi, esi
    jge short loc_081d
loc_082b:
    test esi, esi
    jge short loc_083f
    mov eax, dword [esp + 0x20]
    lea esi, [eax + 1]
    mov word [ebp + eax*2], dx
    mov dword [esp + 0x20], esi
loc_083f:
    mov edx, dword [esp + 0x28]
    movsx edx, word [edx + 8]
    mov eax, dword [esp + 0x28]
    shl edx, 5
    mov eax, dword [eax]
    add eax, dword [edx + WALL]
    mov esi, dword [edi]
    sar eax, 1
    add esi, eax
    mov eax, dword [esp + 0x28]
    mov ecx, dword [edx + LINK_ADDRESS_37]
    mov eax, dword [eax + 4]
    add eax, ecx
    mov edx, dword [edi + 4]
    sar eax, 1
    add eax, edx
    lea ebx, [esp + 0x38]
    sar eax, 1
    sar esi, 1
    mov dword [esp + 0x18], eax
    mov edx, eax
    mov eax, esi
    call UPDATESECTOR
    cmp word [esp + 0x38], 0
    jl short loc_08d8
    movsx eax, word [edi + 0x18]
    push eax
    mov ebx, dword [edi + 8]
    push ebx
    mov ecx, dword [edi + 4]
    push ecx
    mov eax, dword [edi]
    mov edx, dword [esp + 0x24]
    push eax
    movsx ecx, word [esp + 0x48]
    mov eax, esi
    call LINK_ADDRESS_42
    test eax, eax
    je short loc_08d8
    mov ecx, dword [esp + 0x28]
    mov ebx, dword [esp + 0x28]
    movsx eax, word [edi + 0xe]
    mov edx, dword [edi + 8]
    push eax
    mov ecx, dword [ecx + 4]
    mov ebx, dword [ebx]
    movsx eax, word [esp + 0x30]
    push edx
    movsx edx, word [esp + 0x3c]
    call LINK_ADDRESS_43
loc_08d8:
    mov edx, dword [esp + 0x34]
    mov ebx, dword [esp + 0x28]
    inc edx
    add ebx, 0x20
    mov dword [esp + 0x34], edx
    mov dword [esp + 0x28], ebx
loc_08ec:
    movsx eax, word [esp + 0x34]
    cmp eax, dword [esp + 0x14]
    jl near loc_07d9
    mov eax, dword [esp + 0x10]
    cmp eax, dword [esp + 0x20]
    jl near loc_06a8
loc_0909:
    call LINK_ADDRESS_44
    and eax, 0x1fff
    xor ebx, ebx
    lea ebp, [eax - 0x1000]
    mov dword [esp + 0x34], ebx
    jmp near loc_0e57
loc_0924:
    movsx eax, cx
    mov al, byte [esp + eax]
    and eax, 0xff
    mov ax, word [nosplit eax*2 + HEADSPRITESTAT]
loc_0937:
    mov dword [esp + 0x3c], eax
    mov esi, dword [esp + 0x3c]
    test si, si
    jl near loc_0e53
    movsx esi, si
    mov ax, word [nosplit esi*2 + NEXTSPRITESTAT]
    imul esi, esi, 0x2c
    mov edx, dword [esp + 0x34]
    mov dword [esp + 0x30], eax
    add esi, SPRITE
    test dx, dx
    je short loc_099a
    cmp dx, 5
    jge short loc_099a
    mov cx, word [esi + 0xe]
    cmp cx, 0x3b7
    je short loc_099a
    cmp cx, 0x38c
    je short loc_099a
    cmp cx, 0x38e
    je short loc_099a
    cmp cx, 0x3de
    je short loc_099a
    cmp cx, 0x3d2
    jne near loc_0a14
loc_099a:
    cmp word [edi + 0xe], 0x66e
    jne short loc_09ae
    test word [esi + 0xc], 0x101
    je near loc_0e4a
loc_09ae:
    mov edx, esi
    mov eax, edi
    mov ecx, dword [esp + 0xc]
    call LINK_ADDRESS_47
    cmp eax, ecx
    jge near loc_0e4a
    mov eax, esi
    call LINK_ADDRESS_29
    test ax, ax
    je short loc_09fc
    movsx eax, word [edi + 0x18]
    push eax
    mov eax, dword [edi + 8]
    add eax, ebp
    mov edx, dword [edi]
    push eax
    mov eax, dword [edi + 4]
    mov ebx, dword [esi + 8]
    push eax
    movsx ecx, word [esi + 0x18]
    add ebx, ebp
    push edx
    mov eax, dword [esi]
    mov edx, dword [esi + 4]
    call LINK_ADDRESS_42
    test eax, eax
    je near loc_0e4a
loc_09fc:
    movsx edx, word [esp + 0x2c]
    movsx eax, word [esp + 0x3c]
    call LINK_ADDRESS_48
    mov eax, dword [esp + 0x30]
    jmp near loc_0937
loc_0a14:
    cmp word [esi + 0x2a], 0
    jl near loc_0e4a
    cmp esi, edi
    je near loc_0e4a
    cmp cx, 0xa06
    je short loc_0a5f
    mov eax, esi
    call LINK_ADDRESS_29
    test ax, ax
    jne short loc_0a5f
    mov bx, word [esi + 0xe]
    cmp bx, 0x386
    je short loc_0a5f
    cmp bx, 0x385
    je short loc_0a5f
    test word [esi + 0xc], 0x101
    jne short loc_0a5f
    cmp bx, 0x5ee
    jne near loc_0e4a
loc_0a5f:
    cmp word [edi + 0xe], 0x66e
    jne short loc_0a88
    cmp word [esi + 0xe], 0x60e
    je short loc_0a88
    mov eax, dword [esp + 0x3c]
    cmp ax, word [edi + 0x1e]
    je short loc_0a7f
    cmp byte [esi + 0x14], 0x18
    jae short loc_0a88
loc_0a7f:
    mov eax, dword [esp + 0x30]
    jmp near loc_0937
loc_0a88:
    cmp word [edi + 0xe], 0x672
    jne short loc_0aa3
    mov eax, dword [esp + 0x3c]
    cmp ax, word [edi + 0x1e]
    jne short loc_0aa3
    mov eax, dword [esp + 0x30]
    jmp near loc_0937
loc_0aa3:
    cmp word [esi + 0xe], 0x214
    jne short loc_0ab2
    sub dword [esi + 8], 0x2600
loc_0ab2:
    mov edx, esi
    mov eax, edi
    call LINK_ADDRESS_47
    mov dx, word [esi + 0xe]
    mov dword [esp + 8], eax
    cmp dx, 0x214
    jne short loc_0ad1
    add dword [esi + 8], 0x2600
loc_0ad1:
    mov eax, dword [esp + 8]
    cmp eax, dword [esp + 0xc]
    jge near loc_0e4a
    movsx eax, word [edi + 0x18]
    push eax
    mov eax, dword [edi + 8]
    sub eax, 0xc00
    mov ebx, dword [edi + 4]
    push eax
    mov ecx, dword [edi]
    mov edx, dword [esi + 4]
    push ebx
    mov eax, dword [esi]
    mov ebx, dword [esi + 8]
    push ecx
    sub ebx, 0x800
    movsx ecx, word [esi + 0x18]
    call LINK_ADDRESS_42
    test eax, eax
    je near loc_0e4a
    mov eax, dword [esi + 4]
    sub eax, dword [edi + 4]
    mov ebx, dword [edi]
    mov edx, eax
    mov eax, dword [esi]
    sub eax, ebx
    call GETANGLE
    movsx edx, word [esp + 0x3c]
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov word [eax + LINK_ADDRESS_50], bx
    mov bx, word [edi + 0xe]
    cmp bx, 0x27e
    jne short loc_0b61
    cmp word [esi + 0x2a], 0
    jle short loc_0b61
    mov word [eax + LINK_ADDRESS_32], bx
    jmp short loc_0bab
loc_0b61:
    cmp word [edi + 0xe], 0x66e
    jne short loc_0b8b
    movsx edx, word [esp + 0x3c]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov word [eax + LINK_ADDRESS_32], 0x66e
    jmp short loc_0bab
loc_0b8b:
    movsx edx, word [esp + 0x3c]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov word [eax + LINK_ADDRESS_32], 0x686
loc_0bab:
    cmp word [edi + 0xe], 0x66e
    je near loc_0d75
    mov eax, dword [esp + 0xc]
    mov edx, eax
    mov ebx, 3
    sar edx, 0x1f
    idiv ebx
    mov ecx, dword [esp + 8]
    cmp eax, ecx
    jle short loc_0bf9
    mov eax, dword [esp + 0x54]
    cmp eax, dword [esp + 0x50]
    jne short loc_0bdd
    inc dword [esp + 0x54]
loc_0bdd:
    mov ebx, dword [esp + 0x54]
    mov edx, dword [esp + 0x50]
    call LINK_ADDRESS_44
    sub ebx, edx
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    add edx, dword [esp + 0x50]
    jmp short loc_0c62
loc_0bf9:
    mov edx, dword [esp + 0xc]
    add edx, edx
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    cmp eax, ecx
    jle short loc_0c34
    mov eax, dword [esp + 0x50]
    cmp eax, dword [esp + 0x24]
    jne short loc_0c18
    inc dword [esp + 0x50]
loc_0c18:
    mov ebx, dword [esp + 0x50]
    mov edx, dword [esp + 0x24]
    call LINK_ADDRESS_44
    sub ebx, edx
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    add edx, dword [esp + 0x24]
    jmp short loc_0c62
loc_0c34:
    cmp ecx, dword [esp + 0xc]
    jge short loc_0c82
    mov eax, dword [esp + 0x24]
    cmp eax, dword [esp + 0x1c]
    jne short loc_0c48
    inc dword [esp + 0x24]
loc_0c48:
    mov ebx, dword [esp + 0x24]
    mov edx, dword [esp + 0x1c]
    call LINK_ADDRESS_44
    sub ebx, edx
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    add edx, dword [esp + 0x1c]
loc_0c62:
    mov ebx, edx
    movsx edx, word [esp + 0x3c]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov word [eax + LINK_ADDRESS_31], bx
loc_0c82:
    movsx eax, word [esp + 0x3c]
    imul eax, eax, 0x2c
    mov cx, word [eax + LINK_ADDRESS_21]
    cmp cx, 0x7b7
    je short loc_0ce0
    cmp cx, 0x938
    je short loc_0ce0
    cmp cx, 0x7a8
    je short loc_0ce0
    cmp cx, 0xa46
    je short loc_0ce0
    cmp cx, 0xa96
    je short loc_0ce0
    cmp cx, 0xac8
    je short loc_0ce0
    cmp cx, 0x1284
    je short loc_0ce0
    cmp word [esi + 0x20], 0
    jge short loc_0ccf
    mov word [esi + 0x20], 0
loc_0ccf:
    mov ax, word [edi + 0x2a]
    mov dx, word [esi + 0x20]
    shl eax, 2
    add edx, eax
    mov word [esi + 0x20], dx
loc_0ce0:
    mov bx, word [esi + 0xe]
    cmp bx, 0x50e
    je near loc_0d64
    cmp bx, 0x520
    je near loc_0d64
    cmp bx, 0x525
    je near loc_0d64
    cmp bx, 0x529
    je near loc_0d64
    cmp bx, 0x52d
    je short loc_0d64
    cmp bx, 0x52b
    je short loc_0d64
    cmp bx, 0x536
    je short loc_0d64
    cmp bx, 0x573
    je short loc_0d64
    cmp bx, 0x538
    je short loc_0d64
    cmp bx, 0xd7a
    je short loc_0d64
    cmp bx, 0x1300
    je short loc_0d64
    cmp bx, 0x2f1
    je short loc_0d64
    cmp bx, 0x365
    je short loc_0d64
    cmp bx, 0x549
    je short loc_0d64
    cmp bx, 0x386
    je short loc_0d64
    cmp bx, 0x385
    jne short loc_0d9c
loc_0d64:
    movsx edx, word [esp + 0x2c]
    movsx eax, word [esp + 0x3c]
    call LINK_ADDRESS_48
    jmp short loc_0d9c
loc_0d75:
    cmp word [edi + 0x2a], 0
    jne short loc_0d9c
    movsx edx, word [esp + 0x3c]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    xor ebx, ebx
    mov word [eax + LINK_ADDRESS_31], bx
loc_0d9c:
    mov bx, word [esi + 0xe]
    cmp bx, 0x686
    je near loc_0e4a
    mov cx, word [edi + 0x1e]
    test cx, cx
    jl near loc_0e4a
    movsx eax, cx
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_51], 0x400
    jge near loc_0e4a
    cmp bx, 0x214
    jne short loc_0e26
    mov ax, word [esi + 0x22]
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    cmp word [nosplit eax*2 + LINK_ADDRESS_52], 0
    jl short loc_0e26
    mov ax, word [LINK_ADDRESS_53]
loc_0dfc:
    test ax, ax
    jl short loc_0e26
    movsx esi, ax
    imul esi, esi, 0x2c
    cmp word [esi + LINK_ADDRESS_21], 0x26d
    jne short loc_0e1b
    xor ecx, ecx
    mov word [esi + LINK_ADDRESS_19], cx
loc_0e1b:
    cwde
    mov ax, word [nosplit eax*2 + NEXTSPRITESTAT]
    jmp short loc_0dfc
loc_0e26:
    movsx edx, word [esp + 0x3c]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov ax, word [edi + 0x1e]
    mov word [edx + LINK_ADDRESS_54], ax
loc_0e4a:
    mov eax, dword [esp + 0x30]
    jmp near loc_0937
loc_0e53:
    inc dword [esp + 0x34]
loc_0e57:
    mov ecx, dword [esp + 0x34]
    cmp cx, 7
    jl near loc_0924
    add esp, 0x40
    pop ebp
    pop edi
    pop esi
    ret 8
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
    push esi
    push edi
    push ebp
    sub esp, 0x24
    mov esi, eax
    mov ebp, edx
%if GAME_UPDATE
    mov dword [esp + 0x18], ecx
    cwde
    imul eax, eax, 0x2c
    mov edx, 0x2522b4
    add edx, eax
    mov eax, edx
    call 0x16e70
    test eax, eax
    jne short loc_0ea2
    mov eax, edx
    call 0x16ec0
    test eax, eax
    je short loc_0ea6
loc_0ea2:
    mov al, 1
    jmp short loc_0ea8
loc_0ea6:
    xor al, al
loc_0ea8:
    movsx edx, si
%else
    mov dword [esp + 8], ecx
    movsx edx, ax
%endif
    imul edx, edx, 0x2c
%if GAME_UPDATE
    mov cx, word [edx + 0x2522ce]
%else
    mov eax, 0x1c0ba4
    add eax, edx
    call 0x12be0
    mov cx, word [edx + 0x1c0bbe]
%endif
    mov byte [esp + 0x20], al
    cmp cx, 5
%if GAME_UPDATE
    je short loc_0ecc
%else
    je short loc_0eb1
%endif
    test al, al
%if GAME_UPDATE
    je short loc_0f38
%else
    je short loc_0f1d
%endif
    cmp byte [edx + LINK_ADDRESS_55], 4
%if GAME_UPDATE
    jae short loc_0f38
%else
    jae short loc_0f1d
%endif
%if GAME_UPDATE
loc_0ecc:
%else
loc_0eb1:
%endif
    movsx edi, si
    imul eax, edi, 0x2c
    lea ebp, [ebp*4]
    sar ebp, 2
    add dword [eax + SPRITE], ebp
    lea edx, [ebx*4]
    sar edx, 2
    mov ebx, dword [eax + LINK_ADDRESS_56]
    add ebx, edx
%if GAME_UPDATE
    mov edx, dword [esp + 0x18]
%else
    mov edx, dword [esp + 8]
%endif
    lea edx, [edx*4]
    mov ecx, dword [eax + LINK_ADDRESS_57]
    sar edx, 2
    mov dword [eax + LINK_ADDRESS_56], ebx
    add ecx, edx
    mov bl, byte [esp + 0x20]
    mov dword [eax + LINK_ADDRESS_57], ecx
    test bl, bl
%if GAME_UPDATE
    je short loc_0f31
%else
    je short loc_0f16
%endif
    mov ebx, dword [eax + LINK_ADDRESS_56]
    mov edx, dword [eax + SPRITE]
    mov eax, edi
    call LINK_ADDRESS_58
%if GAME_UPDATE
loc_0f31:
%else
loc_0f16:
%endif
    xor eax, eax
%if GAME_UPDATE
    jmp near loc_13a0
%else
    jmp near loc_1385
%endif
%if GAME_UPDATE
loc_0f38:
%else
loc_0f1d:
%endif
    movsx edx, si
    imul edx, edx, 0x2c
    mov ax, word [edx + LINK_ADDRESS_23]
    mov dword [esp + 0x1c], eax
%if GAME_UPDATE
    mov eax, dword [edx + 0x2522bc]
%else
    mov eax, dword [edx + 0x1c0bac]
    xor ecx, ecx
%endif
    mov dword [esp], eax
%if GAME_UPDATE
    movsx eax, word [edx + 0x2522c2]
    mov dword [esp + 0x10], eax
    db 0x0f, 0xbf, 0x0c, 0x45, 0x34, 0xc3, 0x23, 0x00    ; movsx ecx, word [eax*2 + 0x23c334]
    xor eax, eax
    mov al, byte [edx + 0x2522c9]
%else
    movsx eax, word [edx + 0x1c0bb2]
    mov cl, byte [edx + 0x1c0bb9]
    mov dword [esp + 4], eax
    db 0x0f, 0xbf, 0x04, 0x45, 0x24, 0xac, 0x1a, 0x00    ; movsx eax, word [eax*2 + 0x1aac24]
%endif
    imul eax, ecx
    mov ecx, dword [esp]
    add eax, eax
    sub ecx, eax
    mov eax, ebp
    shl eax, 0xd
%if GAME_UPDATE
    mov dword [esp + 8], eax
%else
    mov dword [esp + 0x18], eax
%endif
    mov eax, ebx
    shl eax, 0xd
%if GAME_UPDATE
    mov dword [esp + 4], eax
%else
    mov dword [esp + 0x14], eax
%endif
    mov eax, SPRITE
    mov dword [esp], ecx
    add eax, edx
    mov cl, byte [esp + 0x20]
    lea edi, [eax + 4]
    test cl, cl
%if GAME_UPDATE
    je near loc_124c
    mov ecx, dword [edx + 0x2522b4]
%else
    je near loc_1231
    mov ecx, dword [edx + 0x1c0ba4]
    mov dword [esp + 0x10], ecx
    mov ecx, dword [edx + 0x1c0ba8]
%endif
    mov dword [esp + 0xc], ecx
%if GAME_UPDATE
    mov ecx, dword [edx + 0x2522b8]
    mov dword [esp + 0x14], ecx
    cmp byte [edx + 0x2522c8], 0x3c
    jbe short loc_0fe9
%else
    cmp byte [edx + 0x1c0bb8], 0x3c
    jbe short loc_0fce
%endif
    mov ebp, dword [esp + 0x34]
    push ebp
    push 0x400
    push 0x400
    push 0x400
    mov edx, dword [esp + LINK_ADDRESS_59]
    push edx
    mov ebx, dword [esp + LINK_ADDRESS_60]
    lea ecx, [esp + 0x30]
    push ebx
    mov edx, edi
    lea ebx, [esp + 0x18]
%if GAME_UPDATE
    jmp short loc_1049
%else
    jmp short loc_102e
%endif
%if GAME_UPDATE
loc_0fe9:
%else
loc_0fce:
%endif
    cmp word [edx + LINK_ADDRESS_21], 0x848
%if GAME_UPDATE
    jne short loc_0ffb
%else
    jne short loc_0fe0
%endif
    mov eax, 0x124
%if GAME_UPDATE
    jmp short loc_101a
%else
    jmp short loc_0fff
%endif
%if GAME_UPDATE
loc_0ffb:
%else
loc_0fe0:
%endif
%if GAME_UPDATE
    mov eax, dword [esp + 0x10]
%else
    mov eax, dword [esp + 4]
%endif
    test byte [eax + LINK_ADDRESS_61], 3
%if GAME_UPDATE
    je short loc_1015
%else
    je short loc_0ffa
%endif
    xor eax, eax
    mov al, byte [edx + LINK_ADDRESS_62]
    shl eax, 2
%if GAME_UPDATE
    jmp short loc_101a
%else
    jmp short loc_0fff
%endif
%if GAME_UPDATE
loc_1015:
%else
loc_0ffa:
%endif
    mov eax, 0xc0
%if GAME_UPDATE
loc_101a:
%else
loc_0fff:
%endif
    mov ecx, dword [esp + 0x34]
    push ecx
    push 0x400
    push 0x400
    cwde
    push eax
    movsx eax, si
    imul eax, eax, 0x2c
    shl ebx, 0xd
    push ebx
    shl ebp, 0xd
    lea ecx, [esp + 0x30]
    push ebp
    add eax, SPRITE
    lea ebx, [esp + 0x18]
    lea edx, [eax + 4]
%if GAME_UPDATE
loc_1049:
%else
loc_102e:
%endif
    call LINK_ADDRESS_63
    mov ebx, eax
    mov edi, dword [esp + 0x1c]
    test di, di
%if GAME_UPDATE
    jl near loc_1142
%else
    jl near loc_1127
%endif
%if GAME_UPDATE
    jl near loc_120b
%else
    jl near loc_11f0
%endif
    movsx edx, si
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dx, word [eax + LINK_ADDRESS_64]
    test dx, dx
%if GAME_UPDATE
    jl short loc_108d
%else
    jl short loc_1072
%endif
    cmp dx, di
%if GAME_UPDATE
    jne near loc_1142
%else
    jne near loc_1127
%endif
%if GAME_UPDATE
loc_108d:
%else
loc_1072:
%endif
    movsx eax, si
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_21], 0xa96
%if GAME_UPDATE
    jne short loc_10c4
%else
    jne short loc_10a9
%endif
    cmp byte [eax + LINK_ADDRESS_25], 0
%if GAME_UPDATE
    jne short loc_10c4
%else
    jne short loc_10a9
%endif
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_65], 3
%if GAME_UPDATE
    jne near loc_1142
%else
    jne near loc_1127
%endif
%if GAME_UPDATE
loc_10c4:
%else
loc_10a9:
%endif
    movsx eax, si
    imul eax, eax, 0x2c
    mov cx, word [eax + LINK_ADDRESS_21]
    cmp cx, 0xa46
%if GAME_UPDATE
    je short loc_10df
%else
    je short loc_10c4
%endif
    cmp cx, 0xa96
%if GAME_UPDATE
    jne short loc_10f8
%else
    jne short loc_10dd
%endif
%if GAME_UPDATE
loc_10df:
%else
loc_10c4:
%endif
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_65], 1
%if GAME_UPDATE
    je short loc_1142
%else
    je short loc_1127
%endif
%if GAME_UPDATE
loc_10f8:
%else
loc_10dd:
%endif
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_65], 1
%if GAME_UPDATE
    jne near loc_120b
%else
    jne near loc_11f0
%endif
    movsx eax, si
    imul eax, eax, 0x2c
    mov di, word [eax + LINK_ADDRESS_21]
    cmp di, 0x848
%if GAME_UPDATE
    je short loc_1142
%else
    je short loc_1127
%endif
    cmp di, 0x690
%if GAME_UPDATE
    jne near loc_120b
%else
    jne near loc_11f0
%endif
    cmp word [eax + LINK_ADDRESS_66], 0
%if GAME_UPDATE
    jne near loc_120b
%else
    jne near loc_11f0
%endif
%if GAME_UPDATE
loc_1142:
%else
loc_1127:
%endif
    movsx edx, si
    imul edx, edx, 0x2c
%if GAME_UPDATE
%else
    mov eax, dword [esp + 0x10]
    mov dword [edx + 0x1c0ba4], eax
%endif
    mov eax, dword [esp + 0xc]
%if GAME_UPDATE
    mov dword [edx + 0x2522b4], eax
    mov eax, dword [esp + 0x14]
%else
%endif
    movsx ebx, word [esp + 0x1c]
    mov dword [edx + LINK_ADDRESS_56], eax
    lea eax, [ebx*4]
    add eax, ebx
    cmp word [eax*8 + LINK_ADDRESS_65], 1
%if GAME_UPDATE
    jne short loc_1191
%else
    jne short loc_1176
%endif
    cmp word [edx + LINK_ADDRESS_21], 0x848
%if GAME_UPDATE
    jne short loc_1191
%else
    jne short loc_1176
%endif
    call LINK_ADDRESS_44
    and ah, 7
    mov word [edx + LINK_ADDRESS_67], ax
%if GAME_UPDATE
    jmp short loc_11d1
%else
    jmp short loc_11b6
%endif
%if GAME_UPDATE
loc_1191:
%else
loc_1176:
%endif
    movsx ebx, si
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov eax, dword [eax + LINK_ADDRESS_68]
    and eax, 3
    cmp eax, 1
%if GAME_UPDATE
    jne short loc_11d1
%else
    jne short loc_11b6
%endif
    imul ebx, ebx, 0x2c
    cmp word [ebx + LINK_ADDRESS_21], 0x780
%if GAME_UPDATE
    je short loc_11d1
%else
    je short loc_11b6
%endif
    call LINK_ADDRESS_44
    and ah, 7
    mov word [ebx + LINK_ADDRESS_67], ax
%if GAME_UPDATE
loc_11d1:
%else
loc_11b6:
%endif
    movsx eax, si
    imul ecx, eax, 0x2c
    mov ebx, dword [esp + LINK_ADDRESS_69]
    mov edx, dword [esp + LINK_ADDRESS_70]
    mov ecx, dword [ecx + LINK_ADDRESS_57]
    call LINK_ADDRESS_58
    cmp word [esp + 0x1c], 0
%if GAME_UPDATE
    jge short loc_11f8
%else
    jge short loc_11dd
%endif
    xor edx, edx
    mov dword [esp + 0x1c], edx
%if GAME_UPDATE
loc_11f8:
%else
loc_11dd:
%endif
    movsx eax, word [esp + 0x1c]
    add eax, 0x4000
    add esp, 0x24
    pop ebp
    pop edi
    pop esi
    ret 4
%if GAME_UPDATE
loc_120b:
%else
loc_11f0:
%endif
    movsx eax, bx
    and eax, 0xc000
    cmp eax, 0x8000
%if GAME_UPDATE
    jl near loc_12bb
%else
    jl near loc_12a0
%endif
    movsx ecx, si
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    cmp byte [eax + LINK_ADDRESS_71], 0
%if GAME_UPDATE
    jne near loc_12bb
%else
    jne near loc_12a0
%endif
%if GAME_UPDATE
    imul eax, ecx, 0x2c
%else
    imul ecx, ecx, 0x2c
%endif
%if GAME_UPDATE
    add byte [eax + 0x2522d1], 3
%else
    add byte [ecx + 0x1c0bc1], 3
%endif
%if GAME_UPDATE
    jmp short loc_12bb
%else
    jmp short loc_12a0
%endif
%if GAME_UPDATE
loc_124c:
%else
loc_1231:
%endif
    cmp word [edx + LINK_ADDRESS_51], 4
%if GAME_UPDATE
    jne short loc_127d
%else
    jne short loc_1262
%endif
    mov ecx, dword [esp + 0x34]
    push ecx
    push 0x400
    push 0x400
    push 8
    mov ebp, dword [esp + LINK_ADDRESS_59]
    push ebp
    mov edx, dword [esp + LINK_ADDRESS_60]
    lea ebx, [esp + 0x14]
    push edx
    lea ecx, [esp + 0x34]
    mov edx, edi
%if GAME_UPDATE
    jmp short loc_12b4
%else
    jmp short loc_1299
%endif
%if GAME_UPDATE
loc_127d:
%else
loc_1262:
%endif
    mov ebp, dword [esp + 0x34]
    push ebp
    push 0x400
    mov dl, byte [edx + LINK_ADDRESS_62]
    push 0x400
    and edx, 0xff
    lea edx, [edx*4]
    push edx
    mov edx, dword [esp + LINK_ADDRESS_59]
    push edx
    mov ebx, dword [esp + LINK_ADDRESS_60]
    lea ecx, [esp + 0x30]
    push ebx
    mov edx, edi
    lea ebx, [esp + 0x18]
%if GAME_UPDATE
loc_12b4:
%else
loc_1299:
%endif
    call LINK_ADDRESS_63
    mov ebx, eax
%if GAME_UPDATE
loc_12bb:
%else
loc_12a0:
%endif
    cmp word [esp + 0x1c], 0
%if GAME_UPDATE
    jl short loc_12e0
%else
    jl short loc_12c5
%endif
    movsx edi, si
    imul edx, edi, 0x2c
    mov eax, dword [esp + 0x1c]
    cmp ax, word [edx + LINK_ADDRESS_23]
%if GAME_UPDATE
    je short loc_12e0
%else
    je short loc_12c5
%endif
    movsx edx, ax
    mov eax, edi
    call CHANGESPRITESECT
%if GAME_UPDATE
loc_12e0:
%else
loc_12c5:
%endif
    movsx edx, si
    imul ecx, edx, 0x2c
%if GAME_UPDATE
    mov eax, dword [esp + 0x18]
%else
    mov eax, dword [esp + 8]
%endif
    lea eax, [eax*4]
    sar eax, 3
    mov edi, dword [ecx + LINK_ADDRESS_57]
    add edi, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov dword [esp], edi
    mov eax, edi
    cmp eax, dword [edx + LINK_ADDRESS_73]
%if GAME_UPDATE
    jle short loc_1330
%else
    jle short loc_1315
%endif
    cmp eax, dword [edx + LINK_ADDRESS_74]
%if GAME_UPDATE
    jg short loc_1330
%else
    jg short loc_1315
%endif
    mov dword [ecx + LINK_ADDRESS_57], eax
%if GAME_UPDATE
    jmp near loc_139d
%else
    jmp near loc_1382
%endif
%if GAME_UPDATE
loc_1330:
%else
loc_1315:
%endif
    movsx ecx, si
    lea edx, [ecx*8]
    add edx, ecx
    lea edx, [edx*8]
    sub edx, ecx
    mov eax, dword [esp]
    cmp eax, dword [edx + LINK_ADDRESS_74]
%if GAME_UPDATE
    jle short loc_1385
%else
    jle short loc_136a
%endif
    imul eax, ecx, 0x2c
    mov di, word [eax + LINK_ADDRESS_21]
    cmp di, 0x27f
%if GAME_UPDATE
    je short loc_1376
%else
    je short loc_135b
%endif
    cmp di, 0x27b
%if GAME_UPDATE
    je short loc_1376
%else
    je short loc_135b
%endif
    cmp di, 0x27e
%if GAME_UPDATE
    je short loc_1376
%else
    je short loc_135b
%endif
    cmp di, 0x27d
%if GAME_UPDATE
    jne short loc_1385
%else
    jne short loc_136a
%endif
%if GAME_UPDATE
loc_1376:
%else
loc_135b:
%endif
    movsx eax, si
    imul eax, eax, 0x2c
    mov word [eax + LINK_ADDRESS_75], 0x20
%if GAME_UPDATE
loc_1385:
%else
loc_136a:
%endif
    test bx, bx
%if GAME_UPDATE
    jne short loc_139d
%else
    jne short loc_1382
%endif
    movsx eax, word [esp + 0x1c]
    add eax, 0x4000
    add esp, 0x24
    pop ebp
    pop edi
    pop esi
    ret 4
%if GAME_UPDATE
loc_139d:
%else
loc_1382:
%endif
    movsx eax, bx
%if GAME_UPDATE
loc_13a0:
%else
loc_1385:
%endif
    add esp, 0x24
    pop ebp
    pop edi
    pop esi
    ret 4
%if GAME_UPDATE
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
%else
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
%endif
%if GAME_UPDATE
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
%else
    db 0x8b, 0xc9    ; mov ecx, ecx
%endif
