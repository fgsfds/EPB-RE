; Setup helpers and game state routines.
bits 32
org START_ADDRESS

    sub esp, 0x310
    mov byte [esp + 0x308], al
    mov byte [esp + 0x30c], dl
    mov byte [esp + 0x304], bl
    mov dword [esp + 0x300], ecx
    xor edx, edx
loc_0024:
    movsx ebx, word [MYCONNECTINDEX]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov eax, dword [nosplit eax*2 + LINK_ADDRESS_2]
    mov al, byte [edx + eax]
    mov ecx, dword [esp + 0x300]
    xor ebx, ebx
    and eax, 0xff
    mov bl, byte [esp + 0x308]
    and ecx, 0x7f
    sub ebx, eax
    imul ebx, ecx
    sar ebx, 6
    add eax, ebx
    mov byte [esp + edx], al
    movsx ebx, word [MYCONNECTINDEX]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov eax, dword [nosplit eax*2 + LINK_ADDRESS_2]
    mov al, byte [edx + eax + 1]
    xor ebx, ebx
    and eax, 0xff
    mov bl, byte [esp + 0x30c]
    sub ebx, eax
    imul ebx, ecx
    sar ebx, 6
    add eax, ebx
    mov byte [esp + edx + 1], al
    movsx ebx, word [MYCONNECTINDEX]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov eax, dword [nosplit eax*2 + LINK_ADDRESS_2]
    mov al, byte [edx + eax + 2]
    xor ebx, ebx
    and eax, 0xff
    mov bl, byte [esp + 0x304]
    sub ebx, eax
    imul ebx, ecx
    sar ebx, 6
    add edx, 3
    add eax, ebx
    mov byte [esp + edx - 1], al
    cmp edx, 0x300
    jl near loc_0024
    test byte [esp + 0x300], 0x80
    jne short loc_0120
    mov dl, byte [VIDOPTION]
    cmp dl, 1
    jne short loc_0112
    cmp dl, byte [VGACOMPATIBLE]
    jne short loc_0120
loc_0112:
    mov dx, 0x3da
loc_0116:
    in al, dx
    test al, 8
    jne short loc_0116
loc_011b:
    in al, dx
    test al, 8
    je short loc_011b
loc_0120:
    mov eax, dword [LINK_ADDRESS_5]
    mov edx, esp
    sar eax, 2
    call SETBRIGHTNESS
    add esp, 0x310
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    push esi
    push edi
    push ebp
    sub esp, 0xa4
    mov dword [esp + 0x70], eax
    mov dword [esp + 0x68], edx
    mov dword [esp + 0x18], ebx
    mov dword [esp + 0x9c], ecx
    movsx eax, cx
    mov edx, eax
    neg edx
    and edx, 0x7ff
    movsx edx, word [nosplit edx*2 + SINTABLE]
    imul ebx, edx
    mov edx, 0x600
    sub edx, eax
    mov eax, edx
    and eax, 0x7ff
    mov edx, dword [esp + 0x18]
    movsx eax, word [nosplit eax*2 + SINTABLE]
    imul edx, eax
    mov dword [esp + 0x78], edx
    mov eax, ebx
    mov edx, dword [YXASPECT]
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [YXASPECT]
    mov dword [esp + 0x6c], eax
    mov eax, dword [esp + 0x78]
    mov dword [esp + 0x74], ebx
    imul edx
    shrd eax, edx, 0x10
    xor edx, edx
    mov dword [esp + 0x64], eax
    mov dword [esp + 0x24], edx
    jmp near loc_0471
loc_01ca:
    mov eax, ebx
    mov ecx, ebx
    xor edx, edx
    sar eax, 3
    and ecx, 7
    mov dl, byte [eax + SHOW2DSECTOR]
    mov eax, 1
    shl eax, cl
    test edx, eax
    je near loc_046d
    lea eax, [ebx*4]
    add eax, ebx
    movsx edx, word [eax*8 + SECTOR]
    movsx ebx, word [eax*8 + LINK_ADDRESS_11]
    lea ecx, [edx + ebx]
    mov dword [esp + 0x84], edx
    mov ebx, dword [eax*8 + LINK_ADDRESS_12]
    mov eax, dword [eax*8 + LINK_ADDRESS_13]
    shl edx, 5
    mov dword [esp + 0x1c], eax
    mov eax, WALL
    mov dword [esp + 0x3c], ecx
    add eax, edx
    mov dword [esp + 0x20], ebx
    jmp near loc_0455
loc_0237:
    mov eax, dword [esp + 0x90]
    movsx eax, word [eax + 0xa]
    mov dword [esp + 0x94], eax
    test eax, eax
    jl near loc_043c
    mov edx, dword [esp + 0x90]
    movsx edx, word [edx + 0xc]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov ebp, dword [esp + 0x20]
    cmp ebp, dword [eax + LINK_ADDRESS_12]
    jne short loc_02aa
    mov edx, dword [esp + 0x1c]
    cmp edx, dword [eax + LINK_ADDRESS_13]
    jne short loc_02aa
    mov eax, dword [esp + 0x94]
    shl eax, 5
    movsx edx, word [eax + LINK_ADDRESS_15]
    mov eax, dword [esp + 0x90]
    movsx eax, word [eax + 0xe]
    or eax, edx
    test al, 0x30
    je near loc_043c
loc_02aa:
    mov eax, dword [esp + 0x90]
    movsx eax, word [eax + 0xa]
    mov edx, dword [esp + 0x90]
    shl eax, 5
    movsx edx, word [edx + 0xe]
    movsx eax, word [eax + LINK_ADDRESS_15]
    or eax, edx
    test al, 1
    mov eax, dword [esp + 0x90]
    movsx eax, word [eax + 0xc]
    sar eax, 3
    xor edx, edx
    mov dl, byte [eax + SHOW2DSECTOR]
    mov eax, dword [esp + 0x90]
    mov ax, word [eax + 0xc]
    xor ah, ah
    and al, 7
    movsx ecx, ax
    mov eax, 1
    shl eax, cl
    test edx, eax
    jne near loc_043c
    mov ebp, dword [esp + 0x90]
    mov ebx, dword [esp + 0x70]
    mov eax, dword [esp + 0x90]
    mov ecx, dword [esp + 0x68]
    mov edi, dword [esp + 0x78]
    mov edx, dword [esp + 0x74]
    mov eax, dword [eax + 4]
    mov ebp, dword [ebp]
    sub eax, ecx
    sub ebp, ebx
    mov esi, eax
    mov dword [esp + 0x98], eax
    neg esi
    mov eax, ebp
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [XDIM]
    mov edi, dword [esp + 0x64]
    shl edx, 0xb
    mov esi, ebp
    add eax, edx
    mov edx, dword [esp + 0x6c]
    mov dword [esp + 0x8c], eax
    mov eax, dword [esp + 0x98]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [YDIM]
    shl edx, 0xb
    add eax, edx
    mov dword [esp + 0x88], eax
    mov eax, dword [esp + 0x90]
    movsx eax, word [eax + 8]
    shl eax, 5
    add eax, WALL
    mov esi, dword [esp + 0x70]
    mov edi, dword [esp + 0x78]
    mov ebp, dword [eax]
    mov eax, dword [eax + 4]
    mov edx, dword [esp + 0x74]
    sub eax, ecx
    sub ebp, esi
    mov esi, eax
    mov dword [esp + 0x98], eax
    neg esi
    mov eax, ebp
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [XDIM]
    mov edi, dword [esp + 0x64]
    shl edx, 0xb
    mov esi, ebp
    add eax, edx
    mov edx, dword [esp + 0x6c]
    mov dword [esp + 0x7c], eax
    mov eax, dword [esp + 0x98]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [YDIM]
    push 0x18
    shl edx, 0xb
    mov ebx, dword [esp + 0x80]
    add eax, edx
    mov edx, dword [esp + 0x8c]
    mov dword [esp + 0x84], eax
    mov ecx, eax
    mov eax, dword [esp + 0x90]
    call LINK_ADDRESS_18
loc_043c:
    mov ebp, dword [esp + 0x84]
    mov eax, dword [esp + 0x90]
    inc ebp
    add eax, 0x20
    mov dword [esp + 0x84], ebp
loc_0455:
    mov dword [esp + 0x90], eax
    mov eax, dword [esp + 0x84]
    cmp eax, dword [esp + 0x3c]
    jl near loc_0237
loc_046d:
    inc dword [esp + 0x24]
loc_0471:
    mov ebx, dword [esp + 0x24]
    movsx eax, word [NUMSECTORS]
    cmp eax, ebx
    jg near loc_01ca
    movsx edx, word [LINK_ADDRESS_20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ecx, ecx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_21]
    mov dword [esp + 0x24], ecx
    mov dword [esp + 0x94], eax
    jmp near loc_0bd3
loc_04b5:
    mov eax, ebx
    mov ecx, ebx
    xor edx, edx
    sar eax, 3
    and ecx, 7
    mov dl, byte [eax + SHOW2DSECTOR]
    mov eax, 1
    shl eax, cl
    test edx, eax
    je near loc_0bcf
    movsx eax, word [nosplit ebx*2 + HEADSPRITESECT]
    jmp near loc_0bb9
loc_04e3:
    imul eax, esi, 0x2c
    mov ebp, dword [esp + 0x94]
    add eax, SPRITE
    cmp esi, ebp
    je near loc_0baa
    movsx edx, word [eax + 0xc]
    test dh, 0x80
    jne near loc_0baa
    cmp word [eax + 0xc], 0x101
    je near loc_0baa
    cmp byte [eax + 0x14], 0
    je near loc_0baa
    mov dh, 0x47
    mov bl, byte [eax + 0xc]
    mov byte [esp + 0xa0], dh
    test bl, 1
    je short loc_0536
    mov byte [esp + 0xa0], 0xea
loc_0536:
    mov edx, dword [eax]
    mov dword [esp + 0x44], edx
    mov edx, dword [eax + 4]
    mov bx, word [eax + 0xc]
    mov dword [esp + 0x40], edx
    test bx, 0x101
    je near loc_0baa
    mov edx, ebx
    xor dh, bh
    and dl, 0x30
    cmp dx, 0x10
    jb near loc_0baa
    jbe short loc_0574
    cmp dx, 0x20
    je near loc_0777
    jmp near loc_0baa
loc_0574:
    mov cx, word [eax + 0xe]
    cmp cx, 0xa07
    jne near loc_0baa
    mov edx, dword [esp + 0x44]
    mov dword [esp + 0x8c], edx
    mov edx, dword [esp + 0x40]
    movsx esi, cx
    mov dword [esp + 0x88], edx
    mov edx, dword [esi*4 + PICANM]
    sar edx, 8
    and edx, 0xff
    movsx ebx, dl
    movsx edx, byte [eax + 0x16]
    add edx, ebx
    mov bx, word [eax + 0xc]
    xor bh, bh
    and bl, 4
    test bx, bx
    jle short loc_05c5
    neg edx
loc_05c5:
    movsx ebx, word [eax + 0x1c]
    movzx ebp, byte [eax + 0x14]
    mov eax, ebx
    and eax, 0x7ff
    movsx ecx, word [nosplit eax*2 + SINTABLE]
    imul ecx, ebp
    mov dword [esp + 0x94], ebx
    lea eax, [ebx + 0x600]
    and eax, 0x7ff
    movsx ebx, word [nosplit eax*2 + SINTABLE]
    imul ebx, ebp
    movsx ebp, word [nosplit esi*2 + TILESIZX]
    mov eax, ebp
    sar eax, 1
    add eax, edx
    mov dword [esp + 0x94], eax
    mov edx, eax
    mov eax, ecx
    imul edx
    shrd eax, edx, 0x10
    sub dword [esp + 0x8c], eax
    mov eax, ecx
    mov edx, ebp
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [esp + 0x8c]
    mov edi, dword [esp + 0x68]
    add edx, eax
    mov esi, dword [esp + 0x70]
    mov dword [esp + 0x7c], edx
    mov eax, ebx
    mov edx, dword [esp + 0x94]
    mov ecx, dword [esp + 0x88]
    imul edx
    shrd eax, edx, 0x10
    mov edx, ebp
    sub ecx, eax
    mov ebp, dword [esp + 0x8c]
    mov eax, ebx
    mov dword [esp + 0x88], ecx
    imul edx
    shrd eax, edx, 0x10
    lea edx, [ecx + eax]
    sub ebp, esi
    mov dword [esp + 0x80], edx
    mov eax, ecx
    mov edx, dword [esp + 0x74]
    sub eax, edi
    mov edi, dword [esp + 0x78]
    mov esi, eax
    mov dword [esp + 0x98], eax
    neg esi
    mov eax, ebp
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edi, dword [esp + 0x64]
    mov edx, dword [esp + 0x6c]
    mov dword [esp + 0x34], eax
    mov esi, ebp
    mov eax, dword [esp + 0x98]
    mov ebp, dword [esp + 0x7c]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov dword [esp + 0x28], eax
    mov eax, dword [esp + 0x70]
    mov edx, dword [esp + 0x68]
    sub ebp, eax
    mov eax, dword [esp + 0x80]
    mov edi, dword [esp + 0x78]
    sub eax, edx
    mov edx, dword [esp + 0x74]
    mov esi, eax
    mov dword [esp + 0x98], eax
    neg esi
    mov eax, ebp
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov ecx, eax
    mov dword [esp + 0x7c], eax
    mov edi, dword [esp + 0x64]
    mov edx, dword [esp + 0x6c]
    mov eax, dword [esp + 0x98]
    mov esi, ebp
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    xor edx, edx
    mov dl, byte [esp + 0xa0]
    push edx
    mov edx, dword [YDIM]
    shl edx, 0xb
    mov dword [esp + 0x84], eax
    lea ebx, [eax + edx]
    mov eax, dword [XDIM]
    shl eax, 0xb
    lea esi, [ecx + eax]
    mov edi, dword [esp + 0x38]
    mov ecx, dword [esp + 0x2c]
    add eax, edi
    add edx, ecx
    mov ecx, ebx
    mov ebx, esi
    jmp near loc_0ba5
loc_0777:
    movsx esi, word [eax + 0xe]
    mov edx, dword [esi*4 + PICANM]
    mov ebx, dword [esi*4 + PICANM]
    sar edx, 8
    sar ebx, 0x10
    and edx, 0xff
    and ebx, 0xff
    movsx ecx, dl
    movsx edx, byte [eax + 0x16]
    movsx ebx, bl
    add edx, ecx
    movsx ecx, byte [eax + 0x17]
    add ebx, ecx
    mov cx, word [eax + 0xc]
    xor ch, ch
    and cl, 4
    test cx, cx
    jle short loc_07bd
    neg edx
loc_07bd:
    mov cx, word [eax + 0xc]
    xor ch, ch
    and cl, 8
    test cx, cx
    jle short loc_07cd
    neg ebx
loc_07cd:
    movsx ecx, word [eax + 0x1c]
    movsx edi, word [nosplit esi*2 + TILESIZX]
    mov dword [esp + 0x94], ecx
    add ecx, 0x200
    movsx esi, word [nosplit esi*2 + TILESIZY]
    and ecx, 0x7ff
    mov dword [esp + 0xc], edi
    mov dword [esp + 8], esi
    movsx ecx, word [nosplit ecx*2 + SINTABLE]
    movzx edi, byte [eax + 0x14]
    mov dword [esp + 0x10], ecx
    mov ecx, dword [esp + 0x94]
    mov dword [esp + 4], edi
    mov al, byte [eax + 0x15]
    movsx ecx, word [nosplit ecx*2 + SINTABLE]
    and eax, 0xff
    mov dword [esp], eax
    mov eax, dword [esp + 0xc]
    sar eax, 1
    add eax, edx
    mov edx, edi
    imul edx, eax
    mov eax, esi
    sar eax, 1
    mov ebp, dword [esp]
    add eax, ebx
    imul ebp, eax
    mov esi, dword [esp + 0x10]
    mov edi, ebp
    mov eax, ecx
    mov dword [esp + 0x14], edx
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [esp + 0x44]
    mov esi, dword [esp + 0x10]
    mov edi, dword [esp + 0x14]
    add edx, eax
    neg esi
    mov dword [esp + 0x8c], edx
    mov eax, ecx
    mov edx, ebp
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [esp + 0x40]
    mov ebp, dword [esp + 0xc]
    add edx, eax
    imul ebp, dword [esp + 4]
    mov dword [esp + 0x88], edx
    mov edx, ebp
    mov eax, ecx
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [esp + 0x8c]
    sub edx, eax
    mov eax, dword [esp + 0x10]
    mov dword [esp + 0x7c], edx
    mov edx, ebp
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [esp + 0x88]
    add edx, eax
    mov ebp, dword [esp + 8]
    mov dword [esp + 0x80], edx
    imul ebp, dword [esp]
    mov eax, dword [esp + 0x10]
    mov edx, ebp
    imul edx
    shrd eax, edx, 0x10
    mov dword [esp + 0x94], eax
    mov ebx, eax
    mov eax, dword [esp + 0x7c]
    neg ebx
    add eax, ebx
    mov dword [esp + 0x38], eax
    mov eax, dword [esp + 0x8c]
    mov edx, ebp
    add eax, ebx
    mov dword [esp + 0x94], ebx
    mov dword [esp + 0x30], eax
    mov eax, ecx
    mov ebx, dword [esp + 0x70]
    imul edx
    shrd eax, edx, 0x10
    mov ecx, dword [esp + 0x80]
    mov ebp, eax
    mov dword [esp + 0x94], eax
    neg ebp
    mov eax, dword [esp + 0x88]
    mov dword [esp + 0x94], ebp
    add ecx, ebp
    add eax, ebp
    mov ebp, dword [esp + 0x8c]
    mov dword [esp + 0x2c], eax
    sub ebp, ebx
    mov eax, dword [esp + 0x88]
    mov esi, dword [esp + 0x68]
    mov edi, dword [esp + 0x78]
    sub eax, esi
    mov edx, dword [esp + 0x74]
    mov esi, eax
    mov dword [esp + 0x98], eax
    neg esi
    mov eax, ebp
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edi, dword [esp + 0x64]
    mov edx, dword [esp + 0x6c]
    mov dword [esp + 0x48], eax
    mov esi, ebp
    mov eax, dword [esp + 0x98]
    mov ebp, dword [esp + 0x7c]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edi, dword [esp + 0x70]
    mov edx, dword [esp + 0x68]
    mov dword [esp + 0x54], eax
    mov eax, dword [esp + 0x80]
    sub ebp, edi
    mov edi, dword [esp + 0x78]
    sub eax, edx
    mov edx, dword [esp + 0x74]
    mov esi, eax
    mov dword [esp + 0x98], eax
    neg esi
    mov eax, ebp
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edi, dword [esp + 0x64]
    mov edx, dword [esp + 0x6c]
    mov dword [esp + 0x5c], eax
    mov dword [esp + 0x7c], eax
    mov esi, ebp
    mov eax, dword [esp + 0x98]
    mov ebp, dword [esp + 0x38]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov ebx, dword [esp + 0x70]
    mov esi, dword [esp + 0x68]
    mov edi, dword [esp + 0x78]
    mov edx, dword [esp + 0x74]
    mov dword [esp + 0x60], eax
    mov dword [esp + 0x80], eax
    sub ecx, esi
    sub ebp, ebx
    mov esi, ecx
    mov eax, ebp
    neg esi
    mov dword [esp + 0x98], ecx
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edi, dword [esp + 0x64]
    mov edx, dword [esp + 0x6c]
    mov dword [esp + 0x4c], eax
    mov esi, ebp
    mov eax, ecx
    mov ebp, dword [esp + 0x30]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edi, dword [esp + 0x70]
    mov edx, dword [esp + 0x68]
    mov dword [esp + 0x58], eax
    mov eax, dword [esp + 0x2c]
    sub ebp, edi
    mov edi, dword [esp + 0x78]
    sub eax, edx
    mov edx, dword [esp + 0x74]
    mov esi, eax
    mov dword [esp + 0x98], eax
    neg esi
    mov eax, ebp
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov dword [esp + 0x50], eax
    mov edi, dword [esp + 0x64]
    mov edx, dword [esp + 0x6c]
    mov eax, dword [esp + 0x98]
    mov esi, ebp
    mov ecx, dword [esp + 0x60]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    movzx esi, byte [esp + 0xa0]
    mov ebx, dword [esp + 0x5c]
    mov edi, dword [esp + 0x54]
    mov edx, dword [XDIM]
    mov ebp, eax
    mov eax, dword [YDIM]
    push esi
    shl eax, 0xb
    shl edx, 0xb
    add ecx, eax
    add eax, edi
    mov edi, dword [esp + 0x4c]
    add ebx, edx
    add edi, edx
    mov edx, eax
    mov eax, edi
    call LINK_ADDRESS_18
    mov ecx, dword [esp + 0x58]
    mov ebx, dword [esp + 0x4c]
    mov edi, dword [esp + 0x60]
    mov eax, dword [YDIM]
    mov edx, dword [XDIM]
    push esi
    shl eax, 0xb
    shl edx, 0xb
    add ecx, eax
    add edi, eax
    mov eax, dword [esp + 0x60]
    add ebx, edx
    add eax, edx
    mov edx, edi
    call LINK_ADDRESS_18
    mov ebx, dword [esp + 0x50]
    mov edi, dword [esp + 0x58]
    mov edx, dword [YDIM]
    mov eax, dword [XDIM]
    push esi
    shl edx, 0xb
    shl eax, 0xb
    lea ecx, [edx + ebp]
    add edx, edi
    mov edi, dword [esp + 0x50]
    add ebx, eax
    add eax, edi
    call LINK_ADDRESS_18
    mov ecx, dword [esp + 0x54]
    mov ebx, dword [esp + 0x48]
    mov edx, dword [YDIM]
    mov eax, dword [XDIM]
    push esi
    shl edx, 0xb
    shl eax, 0xb
    add ecx, edx
    add edx, ebp
    mov ebp, dword [esp + 0x54]
    add ebx, eax
    add eax, ebp
loc_0ba5:
    call LINK_ADDRESS_18
loc_0baa:
    mov eax, dword [esp + 0x84]
    movsx eax, word [nosplit eax*2 + NEXTSPRITESECT]
loc_0bb9:
    mov dword [esp + 0x84], eax
    mov esi, dword [esp + 0x84]
    test esi, esi
    jge near loc_04e3
loc_0bcf:
    inc dword [esp + 0x24]
loc_0bd3:
    mov ebx, dword [esp + 0x24]
    movsx eax, word [NUMSECTORS]
    cmp eax, ebx
    jg near loc_04b5
    xor ecx, ecx
    mov dword [esp + 0x24], ecx
    jmp near loc_0e39
loc_0bf1:
    mov eax, edx
    sar eax, 3
    mov al, byte [eax + SHOW2DSECTOR]
    mov ecx, edx
    mov edx, 1
    and ecx, 7
    and eax, 0xff
    shl edx, cl
    test eax, edx
    je near loc_0e35
    mov edx, dword [esp + 0x24]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    movsx eax, word [edx + SECTOR]
    movsx edx, word [edx + LINK_ADDRESS_11]
    lea ebx, [eax + edx]
    mov edx, WALL
    mov dword [esp + 0x3c], ebx
    mov dword [esp + 0x84], eax
    shl eax, 5
    mov ebx, 0xffffffff
    add edx, eax
    mov dword [esp + 0x94], ebx
    mov dword [esp + 0x90], edx
    jmp near loc_0e24
loc_0c67:
    mov eax, dword [esp + 0x90]
    cmp word [eax + 0xa], 0
    jge near loc_0e04
    movsx eax, word [eax + 0x10]
    add eax, eax
    cmp word [eax + TILESIZX], 0
    je near loc_0e04
    cmp word [eax + TILESIZY], 0
    je near loc_0e04
    mov eax, dword [esp + 0x84]
    cmp eax, dword [esp + 0x94]
    jne short loc_0cc2
    mov eax, dword [esp + 0x7c]
    mov dword [esp + 0x8c], eax
    mov eax, dword [esp + 0x80]
    jmp near loc_0d49
loc_0cc2:
    mov ebp, dword [esp + 0x90]
    mov ebx, dword [esp + 0x70]
    mov eax, dword [esp + 0x90]
    mov ecx, dword [esp + 0x68]
    mov edi, dword [esp + 0x78]
    mov edx, dword [esp + 0x74]
    mov eax, dword [eax + 4]
    mov ebp, dword [ebp]
    sub eax, ecx
    sub ebp, ebx
    mov esi, eax
    mov dword [esp + 0x98], eax
    neg esi
    mov eax, ebp
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [XDIM]
    mov edi, dword [esp + 0x64]
    shl edx, 0xb
    mov esi, ebp
    add eax, edx
    mov edx, dword [esp + 0x6c]
    mov dword [esp + 0x8c], eax
    mov eax, dword [esp + 0x98]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [YDIM]
    shl edx, 0xb
    add eax, edx
loc_0d49:
    mov dword [esp + 0x88], eax
    mov eax, dword [esp + 0x90]
    movsx eax, word [eax + 8]
    mov dword [esp + 0x94], eax
    shl eax, 5
    mov esi, dword [esp + 0x70]
    add eax, WALL
    mov edi, dword [esp + 0x68]
    mov edx, dword [esp + 0x74]
    mov ebp, dword [eax]
    mov eax, dword [eax + 4]
    sub ebp, esi
    sub eax, edi
    mov edi, dword [esp + 0x78]
    mov esi, eax
    mov dword [esp + 0x98], eax
    neg esi
    mov eax, ebp
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [XDIM]
    mov edi, dword [esp + 0x64]
    shl edx, 0xb
    mov esi, ebp
    add eax, edx
    mov edx, dword [esp + 0x6c]
    mov dword [esp + 0x7c], eax
    mov eax, dword [esp + 0x98]
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 0x10
    mov edx, dword [YDIM]
    push 0x18
    shl edx, 0xb
    mov ebx, dword [esp + 0x80]
    add eax, edx
    mov edx, dword [esp + 0x8c]
    mov dword [esp + 0x84], eax
    mov ecx, eax
    mov eax, dword [esp + 0x90]
    call LINK_ADDRESS_18
loc_0e04:
    mov ebp, dword [esp + 0x84]
    mov eax, dword [esp + 0x90]
    inc ebp
    add eax, 0x20
    mov dword [esp + 0x84], ebp
    mov dword [esp + 0x90], eax
loc_0e24:
    mov eax, dword [esp + 0x84]
    cmp eax, dword [esp + 0x3c]
    jl near loc_0c67
loc_0e35:
    inc dword [esp + 0x24]
loc_0e39:
    mov edx, dword [esp + 0x24]
    movsx eax, word [NUMSECTORS]
    cmp eax, edx
    jg near loc_0bf1
    mov si, word [CONNECTHEAD]
    test si, si
    jge short loc_0e62
    add esp, 0xa4
    pop ebp
    pop edi
    pop esi
    ret
loc_0e62:
    cmp byte [LINK_ADDRESS_29], 0
    je short loc_0e78
    cmp si, word [LINK_ADDRESS_20]
    je near loc_10c6
loc_0e78:
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_21]
    imul eax, eax, 0x2c
    mov ecx, dword [esp + 0x70]
    mov edi, dword [esp + 0x68]
    mov ebp, dword [eax + SPRITE]
    mov edx, dword [eax + LINK_ADDRESS_30]
    movsx ebx, word [eax + LINK_ADDRESS_31]
    movsx eax, word [esp + 0x9c]
    sub edx, edi
    sub ebp, ecx
    mov dword [esp + 0x98], edx
    sub ebx, eax
    mov ax, word [LINK_ADDRESS_20]
    and ebx, 0x7ff
    cmp si, ax
    jne short loc_0ee2
    xor ebp, ebp
    xor ebx, ebx
    mov dword [esp + 0x98], ebp
loc_0ee2:
    mov ecx, 0x10
    mov edx, dword [esp + 0x74]
    mov eax, ebp
    imul edx
    shrd eax, edx, cl
    mov edx, dword [esp + 0x78]
    mov edi, eax
    mov eax, dword [esp + 0x98]
    imul edx
    shrd eax, edx, cl
    mov edx, dword [esp + 0x6c]
    sub edi, eax
    mov eax, dword [esp + 0x98]
    mov dword [esp + 0x8c], edi
    imul edx
    shrd eax, edx, cl
    mov edx, dword [esp + 0x64]
    mov edi, eax
    mov eax, ebp
    imul edx
    shrd eax, edx, cl
    add edi, eax
    mov dx, word [LINK_ADDRESS_20]
    mov dword [esp + 0x88], edi
    cmp si, dx
    je short loc_0f4c
    cmp dword [LINK_ADDRESS_32], 1
    jne near loc_10c6
loc_0f4c:
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    movsx edx, word [eax + LINK_ADDRESS_21]
    imul edx, edx, 0x2c
    cmp word [edx + LINK_ADDRESS_33], 0x10
    jle short loc_0f94
    cmp byte [eax + LINK_ADDRESS_34], 0
    je short loc_0f94
    mov eax, dword [TOTALCLOCK]
    sar eax, 4
    and eax, 3
    add eax, 0x578
    mov dword [esp + 0x24], eax
    jmp short loc_0f9c
loc_0f94:
    mov dword [esp + 0x24], 0x578
loc_0f9c:
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [edx + LINK_ADDRESS_36]
    sub eax, dword [edx + LINK_ADDRESS_37]
    test eax, eax
    jns short loc_0fc4
    neg eax
loc_0fc4:
    movsx edx, word [edx + LINK_ADDRESS_21]
    imul edx, edx, 0x2c
    sar eax, 8
    mov dword [esp + 0x84], eax
    mov ebp, dword [esp + 0x84]
    movzx edi, byte [edx + LINK_ADDRESS_38]
    mov edx, dword [esp + 0x18]
    add edi, ebp
    imul edi, edx
    mov eax, dword [YXASPECT]
    mov ecx, 0x10
    mov edx, eax
    mov eax, edi
    imul edx
    shrd eax, edx, cl
    mov dword [esp + 0x84], eax
    cmp eax, 0x55f0
    jge short loc_101d
    mov dword [esp + 0x84], 0x55f0
    jmp short loc_102f
loc_101d:
    cmp eax, 0x20000
    jle short loc_102f
    mov dword [esp + 0x84], 0x20000
loc_102f:
    mov ebp, dword [WINDOWY2]
    push ebp
    mov eax, dword [WINDOWX2]
    push eax
    mov edx, dword [WINDOWY1]
    push edx
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_21]
    imul eax, eax, 0x2c
    mov dx, word [eax + LINK_ADDRESS_42]
    xor dh, dh
    and dl, 2
    mov ecx, dword [WINDOWX1]
    movsx edx, dx
    push ecx
    sar edx, 1
    push edx
    xor edx, edx
    mov dl, byte [eax + LINK_ADDRESS_44]
    mov edi, dword [esp + 0x38]
    push edx
    movsx eax, byte [eax + LINK_ADDRESS_45]
    mov edx, dword [esp + 0xa0]
    push eax
    mov eax, dword [YDIM]
    shl edx, 4
    shl eax, 0xf
    mov ecx, dword [esp + 0xa8]
    add edx, eax
    mov eax, dword [XDIM]
    shl ecx, 4
    shl eax, 0xf
    push edi
    add eax, ecx
    mov ecx, ebx
    mov ebx, dword [esp + 0xa4]
    call LINK_ADDRESS_46
loc_10c6:
    movsx eax, si
    mov si, word [nosplit eax*2 + CONNECTPOINT2]
    test si, si
    jge near loc_0e62
    add esp, 0xa4
    pop ebp
    pop edi
    pop esi
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
loc_10f0:
    push edx
    mov edx, dword [LINK_ADDRESS_48]
    cmp edx, 1
    jb near loc_1246
    jbe short loc_110d
    cmp edx, 2
    je near loc_11c8
    pop edx
    ret
loc_110d:
    cmp eax, 0x3e
    jb short loc_1144
    jbe near loc_118e
    cmp eax, 0x51
    jb short loc_113d
    jbe near loc_11a4
    cmp eax, 0x73
    jb near loc_1246
    jbe near loc_11b0
    cmp eax, 0x7c
    je near loc_11bc
    pop edx
    ret
loc_113d:
    cmp eax, 0x4b
    je short loc_1198
    pop edx
    ret
loc_1144:
    cmp eax, 0x1a
    jb short loc_115d
    jbe short loc_1170
    cmp eax, 0x24
    jb near loc_1246
    jbe short loc_117a
    cmp eax, 0x36
    je short loc_1184
    pop edx
    ret
loc_115d:
    cmp eax, 1
    jne near loc_1246
    mov eax, 0x5b
    jmp near loc_1241
loc_1170:
    mov eax, 0x127
    jmp near loc_1241
loc_117a:
    mov eax, 0x128
    jmp near loc_1241
loc_1184:
    mov eax, 0x9e
    jmp near loc_1241
loc_118e:
    mov eax, 0x129
    jmp near loc_1241
loc_1198:
    mov eax, 0x12a
    call LINK_ADDRESS_49
    pop edx
    ret
loc_11a4:
    mov eax, 0x12b
    call LINK_ADDRESS_49
    pop edx
    ret
loc_11b0:
    mov eax, 0x12c
    call LINK_ADDRESS_49
    pop edx
    ret
loc_11bc:
    mov eax, 0x12d
    call LINK_ADDRESS_49
    pop edx
    ret
loc_11c8:
    cmp eax, 0x66
    jb short loc_11e8
    jbe short loc_120e
    cmp eax, 0x86
    jb short loc_11e1
    jbe short loc_1230
    cmp eax, 0x9e
    je short loc_123c
    pop edx
    ret
loc_11e1:
    cmp eax, 0x7c
    je short loc_1224
    pop edx
    ret
loc_11e8:
    cmp eax, 1
    jb short loc_1246
    jbe short loc_11f6
    cmp eax, 0x62
    je short loc_1202
    pop edx
    ret
loc_11f6:
    mov eax, 0x134
    call LINK_ADDRESS_49
    pop edx
    ret
loc_1202:
    mov eax, 0x26
    call LINK_ADDRESS_49
    pop edx
    ret
loc_120e:
    mov eax, 0x9e
    call LINK_ADDRESS_49
    mov eax, 0x45
    call LINK_ADDRESS_49
    pop edx
    ret
loc_1224:
    mov eax, 0x1e
    call LINK_ADDRESS_49
    pop edx
    ret
loc_1230:
    mov eax, 0x1d
    call LINK_ADDRESS_49
    pop edx
    ret
loc_123c:
    mov eax, 0xe
loc_1241:
    call LINK_ADDRESS_49
loc_1246:
    pop edx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
loc_1250:
    cmp eax, 1
    jb short loc_125c
    jbe short loc_125d
    cmp eax, 0x13
    je short loc_1267
loc_125c:
    ret
loc_125d:
    mov eax, 0xf4
    jmp near LINK_ADDRESS_49
loc_1267:
    mov eax, 0xe
    jmp near LINK_ADDRESS_49
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_1280:
    cmp eax, 0xc
    jb short loc_1294
    jbe short loc_12a3
    cmp eax, 0x12
    jb short loc_1293
    jbe short loc_12ad
    cmp eax, 0x22
    je short loc_12a3
loc_1293:
    ret
loc_1294:
    cmp eax, 1
    jne short loc_1293
    mov eax, 0x188
    jmp near LINK_ADDRESS_49
loc_12a3:
    mov eax, 0x15
    jmp near LINK_ADDRESS_49
loc_12ad:
    mov eax, 0x16f
    jmp near LINK_ADDRESS_49
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
loc_12c0:
    cmp eax, 7
    jb short loc_12d4
    jbe short loc_12ed
    cmp eax, 0xc
    jb short loc_12d3
    jbe short loc_12e3
    cmp eax, 0x1a
    je short loc_12f7
loc_12d3:
    ret
loc_12d4:
    cmp eax, 1
    jne short loc_12d3
    mov eax, 0x16b
    jmp near LINK_ADDRESS_49
loc_12e3:
    mov eax, 0x16c
    jmp near LINK_ADDRESS_49
loc_12ed:
    mov eax, 0x16d
    jmp near LINK_ADDRESS_49
loc_12f7:
    mov eax, 0x16e
    jmp near LINK_ADDRESS_49
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_1310:
    cmp eax, 0xa
    jne short loc_12d3
    mov eax, 0x170
    jmp near LINK_ADDRESS_49
    nop
loc_1320:
    cmp eax, 3
    jb short loc_132c
    jbe short loc_132d
    cmp eax, 0x23
    je short loc_1337
loc_132c:
    ret
loc_132d:
    mov eax, 0x30
    jmp near LINK_ADDRESS_49
loc_1337:
    mov eax, 0x180
    jmp near LINK_ADDRESS_49
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_1350:
    cmp eax, 0x14
    jb short loc_1368
    jbe short loc_1377
    cmp eax, 0x27
    jb short loc_1367
    jbe short loc_1381
    cmp eax, 0x32
    je near LINK_ADDRESS_50
loc_1367:
    ret
loc_1368:
    cmp eax, 0xb
    jne short loc_1367
    mov eax, 0x30
    jmp near LINK_ADDRESS_49
loc_1377:
    mov eax, 0x180
    jmp near LINK_ADDRESS_49
loc_1381:
    mov eax, 0x181
    jmp near LINK_ADDRESS_49
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
loc_1390:
    cmp eax, 0x28
    jb short loc_139d
    jbe short loc_13ac
    cmp eax, 0x32
    je short loc_13c0
loc_139c:
    ret
loc_139d:
    cmp eax, 1
    jne short loc_139c
    mov eax, 0x172
    jmp near LINK_ADDRESS_49
loc_13ac:
    mov eax, 0x180
    call LINK_ADDRESS_49
    mov eax, 0x30
    jmp near LINK_ADDRESS_49
loc_13c0:
    mov eax, 0x189
    jmp near LINK_ADDRESS_49
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov ebx, eax
    mov byte [esp], dl
    cmp dl, 7
    je short loc_13f6
    cmp dl, 9
    je short loc_13f6
    cmp dl, 0xa
    je short loc_13f6
    cmp dl, 0xb
    je short loc_13f6
    call LINK_ADDRESS_51
loc_13f6:
    call LINK_ADDRESS_52
    test eax, eax
    je short loc_1409
    call LINK_ADDRESS_50
    jmp near loc_16a6
loc_1409:
    mov eax, ebx
    xor edx, edx
    call KOPEN4LOAD
    mov ecx, eax
    cmp eax, -1
    je near loc_16c0
    call KFILELENGTH
    mov edi, eax
    xor eax, eax
    mov ebx, 0x17fd
    mov al, byte [esp]
    mov dl, byte [esp]
    sub ebx, eax
    add dl, 0xdb
    mov byte [ebx + WALOCK], dl
    mov edx, dword [LINK_ADDRESS_56]
    mov eax, ebx
    test edx, edx
    je short loc_1450
    cmp eax, dword [LINK_ADDRESS_57]
    je short loc_1474
loc_1450:
    xor ebx, ebx
    mov eax, 0x17fd
    mov bl, byte [esp]
    sub eax, ebx
    lea edx, [edi + 0x20992]
    mov ebx, eax
    mov eax, LINK_ADDRESS_56
    add ebx, WALOCK
    call ALLOCACHE
loc_1474:
    mov edx, 0x17fd
    xor eax, eax
    mov ebx, 0x140
    mov al, byte [esp]
    mov esi, dword [LINK_ADDRESS_56]
    sub edx, eax
    add esi, 0x20992
    mov eax, edx
    mov dword [LINK_ADDRESS_57], edx
    mov edx, 0xc8
    mov word [nosplit eax*2 + TILESIZY], bx
    mov ebx, edi
    mov word [nosplit eax*2 + TILESIZX], dx
    mov edx, esi
    mov eax, ecx
    call KREAD
    mov eax, ecx
    call KCLOSE
    mov eax, esi
    call LINK_ADDRESS_61
    call LINK_ADDRESS_62
    mov edi, eax
    call LINK_ADDRESS_63
    xor esi, esi
    mov ecx, eax
    jmp short loc_151d
loc_14d9:
    lea eax, [esi*4]
    mov edx, eax
    sub edx, esi
    xor ebx, ebx
    mov bl, byte [ecx + edx + 2]
    sar ebx, 2
    mov byte [eax + LINK_ADDRESS_64], bl
    xor ebx, ebx
    mov bl, byte [ecx + edx + 1]
    sar ebx, 2
    mov byte [eax + LINK_ADDRESS_65], bl
    mov dl, byte [ecx + edx]
    and edx, 0xff
    sar edx, 2
    mov byte [eax + LINK_ADDRESS_66], dl
    xor dl, dl
    inc esi
    mov byte [eax + LINK_ADDRESS_67], dl
loc_151d:
    cmp esi, 0x100
    jl short loc_14d9
    mov ebx, LINK_ADDRESS_64
    mov edx, 0x100
    xor eax, eax
    call VBE_SETPALETTE
    mov eax, dword [TOTALCLOCK]
    add eax, 0xa
    mov esi, 1
    mov dword [LINK_ADDRESS_69], eax
    jmp near loc_169e
loc_154d:
    mov eax, dword [TOTALCLOCK]
    mov ecx, dword [LINK_ADDRESS_69]
    cmp eax, ecx
    jge short loc_1570
    call LINK_ADDRESS_52
    test eax, eax
    jne near loc_16a6
    call 0x10800
    jmp short loc_154d
loc_1570:
    mov bl, byte [esp]
    lea edx, [ecx + 0xe]
    cmp bl, 0xa
    jne short loc_1586
    mov dword [LINK_ADDRESS_69], edx
    jmp near loc_15de
loc_1586:
    lea eax, [ecx + 0xa]
    cmp bl, 9
    je short loc_15d9
    lea ebx, [ecx + 0x12]
    mov cl, byte [esp]
    cmp cl, 7
    jne short loc_15a1
    mov dword [LINK_ADDRESS_69], ebx
    jmp short loc_15de
loc_15a1:
    cmp cl, 6
    jne short loc_15ae
    mov dword [LINK_ADDRESS_69], edx
    jmp short loc_15de
loc_15ae:
    cmp cl, 5
    jne short loc_15bc
    add dword [LINK_ADDRESS_69], 9
    jmp short loc_15de
loc_15bc:
    mov ebp, dword [LINK_ADDRESS_48]
    cmp ebp, 3
    je short loc_15d9
    cmp ebp, 2
    je short loc_15d9
    cmp ebp, 1
    jne short loc_15d9
    mov dword [LINK_ADDRESS_69], ebx
    jmp short loc_15de
loc_15d9:
    mov dword [LINK_ADDRESS_69], eax
loc_15de:
    xor edx, edx
    mov ebx, 0x17fd
    mov dl, byte [esp]
    mov eax, esi
    sub ebx, edx
    call LINK_ADDRESS_70
    mov dword [ebx*4 + WALOFF], eax
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x5e
    push 0
    push 0
    mov ecx, 0x200
    xor edx, edx
    push ebx
    xor eax, eax
    mov ebx, 0x10000
    call LINK_ADDRESS_46
    mov dh, byte [esp]
    call LINK_ADDRESS_72
    cmp dh, 8
    jne short loc_163d
    mov eax, esi
    call loc_1320
    jmp near loc_169d
loc_163d:
    cmp dh, 0xa
    jne short loc_164b
    mov eax, esi
    call loc_1350
    jmp short loc_169d
loc_164b:
    cmp dh, 0xb
    jne short loc_1659
    mov eax, esi
    call loc_1390
    jmp short loc_169d
loc_1659:
    cmp dh, 9
    jne short loc_1667
    mov eax, esi
    call loc_1310
    jmp short loc_169d
loc_1667:
    cmp dh, 7
    jne short loc_1675
    mov eax, esi
    call loc_1280
    jmp short loc_169d
loc_1675:
    cmp dh, 6
    jne short loc_1683
    mov eax, esi
    call loc_12c0
    jmp short loc_169d
loc_1683:
    cmp dh, 5
    jne short loc_1691
    mov eax, esi
    call loc_1250
    jmp short loc_169d
loc_1691:
    cmp dh, 4
    jae short loc_169d
    mov eax, esi
    call loc_10f0
loc_169d:
    inc esi
loc_169e:
    cmp esi, edi
    jl near loc_154d
loc_16a6:
    call LINK_ADDRESS_73
    xor eax, eax
    mov edx, 0x17fd
    mov al, byte [esp]
    sub edx, eax
    mov eax, edx
    mov byte [eax + WALOCK], 1
loc_16c0:
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    add byte [eax], al
    add byte [eax], al
    add byte [eax], al
    add byte [edx], cl
    add byte [0x2000100], cl
    add byte [eax], al
    add al, bh
    db 0xff, 0xf0    ; push eax
    jmp eax
    db 0xff, 0xc0    ; inc eax
    db 0xff, 0xac, 0xff, 0x94, 0xff, 0x94, 0xff    ; jmp ptr [edi + edi*8 - 0x6b006c]
    xchg esp, eax
    db 0xff
    mov eax, 0xf8ffe0ff
    inc dword [eax]
    add byte [ecx], al
    add byte [edx], al
    add byte [edx], al
    add byte [ebx], al
    add byte [ebx], al
    add byte [ebx], al
    add byte [edx], al
    add byte [edx], al
    add byte [ecx], al
    add byte [eax], al
    add byte [eax], al
    add al, bh
    db 0xff, 0xf0    ; push eax
    jmp eax
    db 0xff, 0xc0    ; inc eax
    db 0xff, 0xac, 0xff, 0x94, 0xff, 0x94, 0xff    ; jmp ptr [edi + edi*8 - 0x6b006c]
    xchg esp, eax
    call dword [edi + edi*8 - 0x6b006c]
    xchg esp, eax
    call dword [edi + edi*8 - 0x6b006c]
    mov al, byte [0xc0ffb8ff]
    jmp eax
    db 0xff, 0xf0    ; push eax
    inc dword [eax]
    add al, bh
    db 0xff, 0xf0    ; push eax
    jmp eax
    db 0xff, 0xc0    ; inc eax
    db 0xff, 0xac, 0xff, 0x94, 0xff, 0x94, 0xff    ; jmp ptr [edi + edi*8 - 0x6b006c]
    xchg esp, eax
    call dword [edi + edi*8 - 0x6b006c]
    xchg esp, eax
    call dword [edi + edi*8 - 0x6b006c]
    mov al, byte [0xc0ffb8ff]
    jmp eax
    db 0xff, 0xf0    ; push eax
    dec dword [ebp + 0x80]
    add byte [ebx + 0x51], dl
    mov ebx, dword [LINK_ADDRESS_74]
    add eax, 0x14
    add edx, 0xa
    test ebx, ebx
    je short loc_177f
    push -2
    push 0
    mov ebx, 0x28b
    xor ecx, ecx
    jmp short loc_1789
loc_177f:
    push -2
    push ebx
    xor ecx, ecx
    mov ebx, 0x28c
loc_1789:
    call LINK_ADDRESS_75
    mov eax, dword [LINK_ADDRESS_76]
    mov ecx, dword [LINK_ADDRESS_77]
    xor edx, edx
    div ecx
    test edx, edx
    jne short loc_17bc
    cmp dword [LINK_ADDRESS_74], 0
    je short loc_17b2
    mov dword [LINK_ADDRESS_74], edx
    jmp short loc_17bc
loc_17b2:
    mov dword [LINK_ADDRESS_74], 1
loc_17bc:
    mov eax, dword [LINK_ADDRESS_76]
    inc eax
    mov dword [LINK_ADDRESS_76], eax
    cmp eax, 0x7d00
    jb short loc_17d6
    xor ebx, ebx
    mov dword [LINK_ADDRESS_76], ebx
loc_17d6:
    pop ecx
    pop ebx
