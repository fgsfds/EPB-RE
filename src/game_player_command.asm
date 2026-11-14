; Player state and command processing.
bits 32
org START_ADDRESS

    push ebx
    push edx
    mov edx, eax
    call LINK_ADDRESS_1
    mov ebx, 0x80
    xor ah, ah
    sub ebx, eax
    mov byte [edx + 0x3f5], 9
    mov eax, ebx
    mov ebx, dword [edx + 0x220]
    cwde
    add ebx, 0x40
    sar eax, 1
    mov dword [edx + 0x220], ebx
    mov word [edx + 0x2a0], ax
    mov word [edx + 0x380], ax
    pop edx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push esi
    push edi
    push ebp
    sub esp, 0x18
    mov edi, eax
    mov esi, edx
    mov ebp, ebx
    mov ebx, dword [esp + 0x28]
    mov edx, 0xffffffff
    mov eax, dword [esp + 0x30]
    mov dword [esp + 0x14], edx
    mov edx, ecx
    inc eax
    sub edx, edi
    mov dword [esp + 4], eax
    mov eax, edx
    sar edx, 0x1f
    idiv dword [esp + 4]
    mov edx, ebx
    sub edx, esi
    mov dword [esp + 8], eax
    mov eax, edx
    sar edx, 0x1f
    idiv dword [esp + 4]
    mov edx, dword [esp + 0x2c]
    sub edx, ebp
    mov dword [esp + 0xc], eax
    mov eax, edx
    sar edx, 0x1f
    idiv dword [esp + 4]
    mov dword [esp], eax
    mov eax, edi
    sub eax, ecx
    test eax, eax
    jns short loc_00a0
    neg eax
loc_00a0:
    mov edx, eax
    mov eax, esi
    sub eax, ebx
    test eax, eax
    jns short loc_00ac
    neg eax
loc_00ac:
    add eax, edx
    cmp eax, 0xc0c
    jl near loc_0198
    mov eax, dword [esp + 0x30]
    mov dword [esp + 4], eax
    cmp dword [esp + 4], 0
    jg short loc_00d1
    add esp, 0x18
    pop ebp
    pop edi
    pop esi
    ret 0xc
loc_00d1:
    mov ebx, dword [esp + 8]
    mov ecx, dword [esp + 0xc]
    mov eax, dword [esp]
    add edi, ebx
    add esi, ecx
    add ebp, eax
    lea ebx, [esp + 0x14]
    mov edx, esi
    mov eax, edi
    call UPDATESECTOR
    mov ebx, dword [esp + 0x14]
    test bx, bx
    jl near loc_0189
    movsx eax, bx
    mov dword [esp + 0x10], eax
    mov ebx, eax
    lea eax, [eax*4]
    add eax, ebx
    cmp word [eax*8 + LINK_ADDRESS_3], 2
    jne short loc_015f
    push 5
    movsx eax, word [LINK_ADDRESS_4]
    push eax
    push 0
    push 0
    call LINK_ADDRESS_1
    and ah, 7
    cwde
    push eax
    call LINK_ADDRESS_1
    and al, 3
    add al, 4
    movsx eax, al
    push eax
    call LINK_ADDRESS_1
    and al, 3
    add al, 4
    movsx eax, al
    push eax
    mov ecx, ebp
    push -0x20
    mov ebx, esi
    mov edx, edi
    push 0x295
    movsx eax, word [esp + 0x38]
    jmp short loc_0184
loc_015f:
    push 5
    movsx eax, word [LINK_ADDRESS_4]
    push eax
    push 0
    push 0
    push 0
    push 0xe
    push 0xe
    push -0x20
    mov ecx, ebp
    mov ebx, esi
    push 0x919
    mov edx, edi
    mov eax, dword [esp + 0x34]
loc_0184:
    call LINK_ADDRESS_5
loc_0189:
    dec dword [esp + 4]
    cmp dword [esp + 4], 0
    jg near loc_00d1
loc_0198:
    add esp, 0x18
    pop ebp
    pop edi
    pop esi
    ret 0xc
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    sub esp, 0x18
    movsx edx, ax
    imul edx, edx, 0x2c
    cmp word [edx + LINK_ADDRESS_6], 0x214
    jne short loc_01cf
    mov ebx, 0x2800
    jmp short loc_01d1
loc_01cf:
    xor ebx, ebx
loc_01d1:
    movsx esi, ax
    imul esi, esi, 0x2c
    push 0x1000040
    lea edx, [esp + 4]
    push edx
    lea edx, [esp + 0xc]
    push edx
    lea edx, [esp + 0x14]
    push edx
    lea edx, [esp + 0x1c]
    push edx
    lea edx, [esp + 0x24]
    mov ax, word [esi + LINK_ADDRESS_7]
    push edx
    lea edx, [esp + 0x2c]
    and ah, 7
    push edx
    cwde
    push 0
    movsx eax, word [nosplit eax*2 + SINTABLE]
    push eax
    movsx eax, word [esi + LINK_ADDRESS_7]
    add eax, 0x200
    and eax, 0x7ff
    movsx eax, word [nosplit eax*2 + SINTABLE]
    push eax
    mov eax, dword [esi + LINK_ADDRESS_9]
    movsx ecx, word [esi + LINK_ADDRESS_10]
    sub eax, ebx
    mov edx, dword [esi + LINK_ADDRESS_11]
    mov ebx, eax
    mov eax, dword [esi + SPRITE]
    call LINK_ADDRESS_13
    mov edx, dword [esp + 4]
    mov eax, dword [esp + 8]
    mov ebx, dword [esi + LINK_ADDRESS_11]
    mov ecx, dword [esi + SPRITE]
    sub edx, ebx
    sub eax, ecx
    call LINK_ADDRESS_14
    add esp, 0x18
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 0x14
    mov edi, eax
    movsx ebx, ax
    imul ebx, ebx, 0x2c
    mov eax, SPRITE
    add eax, ebx
    call LINK_ADDRESS_15
    test ax, ax
    je short loc_02a7
    mov eax, 0x2a00
    jmp short loc_02bb
loc_02a7:
    cmp word [ebx + LINK_ADDRESS_6], 0x214
    jne short loc_02b9
    mov eax, 0x2700
    jmp short loc_02bb
loc_02b9:
    xor eax, eax
loc_02bb:
    movsx esi, di
    imul esi, esi, 0x2c
    push 0x1000040
    lea ebx, [esp + 4]
    push ebx
    lea ebx, [esp + 0xc]
    push ebx
    lea ebx, [esp + 0x14]
    push ebx
    push edx
    lea edx, [esp + 0x20]
    push edx
    lea edx, [esp + 0x28]
    push edx
    mov dx, word [esi + LINK_ADDRESS_7]
    and dh, 7
    movsx edx, dx
    push 0
    movsx edx, word [nosplit edx*2 + SINTABLE]
    push edx
    movsx edx, word [esi + LINK_ADDRESS_7]
    add edx, 0x200
    and edx, 0x7ff
    movsx ecx, word [esi + LINK_ADDRESS_10]
    mov ebx, dword [esi + LINK_ADDRESS_9]
    movsx edx, word [nosplit edx*2 + SINTABLE]
    sub ebx, eax
    push edx
    mov eax, dword [esi + SPRITE]
    mov edx, dword [esi + LINK_ADDRESS_11]
    call LINK_ADDRESS_13
    mov eax, dword [esp + 0xc]
    test ax, ax
    jl short loc_0362
    cwde
    shl eax, 5
    test byte [eax + LINK_ADDRESS_16], 0x10
    je short loc_0362
    mov eax, SPRITE
    add eax, esi
    call LINK_ADDRESS_15
    test ax, ax
    je short loc_0362
    mov eax, 0x40000000
    jmp short loc_0385
loc_0362:
    movsx eax, di
    imul eax, eax, 0x2c
    mov edx, dword [esp + 4]
    sub edx, dword [eax + LINK_ADDRESS_11]
    mov ebx, dword [esp + 8]
    mov ecx, dword [eax + SPRITE]
    mov eax, ebx
    sub eax, ecx
    call LINK_ADDRESS_14
loc_0385:
    add esp, 0x14
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push esi
    sub esp, 0x14
    mov esi, eax
    push 0x10001
    lea eax, [esp + 4]
    push eax
    lea eax, [esp + 0xc]
    push eax
    lea eax, [esp + 0x14]
    push eax
    lea eax, [esp + 0x20]
    push eax
    push edx
    lea eax, [esp + 0x24]
    push eax
    mov ax, word [esi + 0x298]
    and ah, 7
    cwde
    push 0
    movsx eax, word [nosplit eax*2 + SINTABLE]
    push eax
    movsx eax, word [esi + 0x298]
    add eax, 0x200
    and eax, 0x7ff
    movsx ecx, word [esi + 0x29e]
    movsx eax, word [nosplit eax*2 + SINTABLE]
    mov ebx, dword [esi + 0x21c]
    push eax
    mov edx, dword [esi + 0x218]
    mov eax, dword [esi + 0x214]
    call LINK_ADDRESS_13
    mov edx, dword [esp + 4]
    mov eax, dword [esp + 8]
    mov ebx, dword [esi + 0x218]
    mov ecx, dword [esi + 0x214]
    sub edx, ebx
    sub eax, ecx
    call LINK_ADDRESS_14
    add esp, 0x14
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
loc_0430:
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x3c
    mov ebp, eax
    mov ebx, edx
    mov edi, esp
    mov esi, LINK_ADDRESS_17
    mov edx, 0xffffffff
    db 0xa5    ; movsd dword es:[edi], dword [esi]
    db 0xa5    ; movsd dword es:[edi], dword [esi]
    mov dword [esp + 0x30], edx
    mov ax, word [eax + 0x1c]
    mov cx, word [ebp + 0xe]
    mov dword [esp + 0x2c], eax
    cmp cx, 0x214
    jne short loc_0484
    movsx edx, word [ebp + 0x22]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    cmp word [nosplit eax*2 + LINK_ADDRESS_18], LINK_ADDRESS_19
    jne short loc_0484
    mov al, 1
    jmp short loc_0486
loc_0484:
    xor al, al
loc_0486:
    mov di, word [ebp + 0xe]
    mov byte [esp + 0x34], al
    cmp di, 0x214
    jne short loc_04b8
    movsx edx, word [ebp + 0x22]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    cmp word [nosplit eax*2 + LINK_ADDRESS_18], LINK_ADDRESS_20
    jne short loc_04b8
    mov al, 1
    jmp short loc_04ba
loc_04b8:
    xor al, al
loc_04ba:
    mov edx, 0x7fffffff
    mov byte [esp + 0x38], al
    movsx eax, word [esp + 0x2c]
    mov dword [esp + 0xc], edx
    movsx edx, bx
    lea ebx, [eax + 0x200]
    mov ecx, ebx
    sub ecx, edx
    and ecx, 0x7ff
    movsx ecx, word [nosplit ecx*2 + SINTABLE]
    mov dword [esp + 0x14], ecx
    mov ecx, eax
    add eax, edx
    sub ecx, edx
    lea edx, [eax + 0x200]
    and eax, 0x7ff
    and ebx, 0x7ff
    and ecx, 0x7ff
    movsx eax, word [nosplit eax*2 + SINTABLE]
    and edx, 0x7ff
    mov dword [esp + 0x18], eax
    movsx eax, word [nosplit ebx*2 + SINTABLE]
    movsx ecx, word [nosplit ecx*2 + SINTABLE]
    mov dword [esp + 0x24], eax
    mov eax, dword [esp + 0x2c]
    mov dword [esp + 8], ecx
    and ah, 7
    movsx edx, word [nosplit edx*2 + SINTABLE]
    cwde
    mov dword [esp + 0x20], edx
    xor ebx, ebx
    movsx eax, word [nosplit eax*2 + SINTABLE]
    mov dword [esp + 0x28], ebx
    mov dword [esp + 0x1c], eax
    jmp near loc_082e
loc_055d:
    cmp word [esp + 0x30], 0
    jge near loc_083c
    movsx eax, cx
    movsx eax, word [esp + eax*2]
    mov si, word [nosplit eax*2 + HEADSPRITESTAT]
    jmp near loc_0821
loc_057d:
    movsx eax, si
    imul eax, eax, 0x2c
    cmp byte [eax + LINK_ADDRESS_22], 0
    jbe near loc_0816
    cmp word [eax + LINK_ADDRESS_23], 0
    jl near loc_0816
    movsx edx, word [eax + LINK_ADDRESS_24]
    and edx, 0x8101
    cmp edx, 0x101
    jne near loc_0816
    add eax, SPRITE
    call LINK_ADDRESS_15
    test ax, ax
    jne short loc_05d2
    cmp word [esp + 0x28], 2
    jge near loc_0816
loc_05d2:
    movsx edx, si
    imul edx, edx, 0x2c
    mov eax, SPRITE
    add eax, edx
    call LINK_ADDRESS_15
    test ax, ax
    jne short loc_0602
    mov cx, word [edx + LINK_ADDRESS_6]
    cmp cx, 0x214
    je short loc_0602
    cmp cx, 0x60e
    jne near loc_068d
loc_0602:
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + LINK_ADDRESS_6]
    cmp dx, 0x214
    jne short loc_0632
    cmp dword [LINK_ADDRESS_25], 1
    jne short loc_0632
    cmp dx, word [ebp + 0xe]
    jne short loc_0632
    add eax, SPRITE
    cmp ebp, eax
    jne near loc_0816
loc_0632:
    cmp byte [esp + 0x34], 0
    je short loc_0673
    movsx eax, si
    imul eax, eax, 0x2c
    cmp byte [eax + LINK_ADDRESS_22], 0x1e
    jae short loc_0673
    mov ax, word [eax + LINK_ADDRESS_6]
    cmp ax, 0x60e
    jb near loc_0816
    jbe near loc_0816
    cmp ax, 0x942
    jb near loc_0816
    cmp ax, 0x949
    ja near loc_0816
loc_0673:
    cmp byte [esp + 0x38], 0
    je short loc_068d
    movsx eax, si
    imul eax, eax, 0x2c
    cmp byte [eax + LINK_ADDRESS_26], 1
    je near loc_0816
loc_068d:
    movsx ebx, si
    imul ebx, ebx, 0x2c
    mov ecx, dword [ebp]
    mov eax, dword [ebp + 4]
    mov edx, dword [ebx + SPRITE]
    mov edi, dword [ebx + LINK_ADDRESS_11]
    sub edx, ecx
    sub edi, eax
    mov eax, dword [esp + 8]
    imul eax, edx
    mov ecx, dword [esp + 0x14]
    imul ecx, edi
    cmp eax, ecx
    jg near loc_0816
    mov eax, dword [esp + 0x18]
    imul eax, edx
    mov ecx, dword [esp + 0x20]
    imul ecx, edi
    cmp eax, ecx
    jl near loc_0816
    mov ecx, 0xe
    mov eax, dword [esp + 0x24]
    imul edx
    shrd eax, edx, cl
    mov dword [esp + 0x10], eax
    mov edx, edi
    mov eax, dword [esp + 0x1c]
    mov edi, dword [esp + 0x10]
    imul edx
    shrd eax, edx, cl
    add edi, eax
    cmp edi, 0x200
    jle near loc_0816
    cmp edi, dword [esp + 0xc]
    jge near loc_0816
    cmp word [ebp + 0xe], 0x214
    jne short loc_0772
    movsx edx, word [ebp + 0x22]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [nosplit eax*2 + LINK_ADDRESS_27]
    mov eax, dword [nosplit eax*2 + LINK_ADDRESS_28]
    add eax, edx
    mov dword [esp + 0x10], eax
    mov edx, dword [ebp + 8]
    mov eax, dword [ebx + LINK_ADDRESS_9]
    mov ecx, edi
    sub eax, edx
    mov edx, 0xa
    imul edx
    idiv ecx
    mov edx, dword [esp + 0x10]
    sub edx, 0x64
    sub eax, edx
    test eax, eax
    jns short loc_0764
    neg eax
loc_0764:
    cmp eax, 0x64
    setl al
    xor ah, ah
    mov dword [esp + 0x2c], eax
    jmp short loc_077a
loc_0772:
    mov dword [esp + 0x2c], 1
loc_077a:
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + LINK_ADDRESS_6]
    cmp dx, 0x974
    je short loc_0795
    cmp dx, 0x938
    jne short loc_07c6
loc_0795:
    movsx eax, word [ebp + 0x18]
    push eax
    mov eax, dword [ebp + 8]
    sub eax, 0x2000
    push eax
    mov eax, dword [ebp + 4]
    push eax
    movsx eax, si
    imul eax, eax, 0x2c
    mov edx, dword [ebp]
    push edx
    movsx ecx, word [eax + LINK_ADDRESS_10]
    mov ebx, dword [eax + LINK_ADDRESS_9]
    mov edx, dword [eax + LINK_ADDRESS_11]
    jmp short loc_07f6
loc_07c6:
    movsx edx, word [ebp + 0x18]
    push edx
    mov edx, dword [ebp + 8]
    sub edx, 0x2000
    push edx
    mov ebx, dword [ebp + 4]
    mov ecx, dword [ebp]
    push ebx
    mov edx, dword [eax + LINK_ADDRESS_11]
    mov ebx, dword [eax + LINK_ADDRESS_9]
    push ecx
    sub ebx, 0x2000
    movsx ecx, word [eax + LINK_ADDRESS_10]
loc_07f6:
    mov eax, dword [eax + SPRITE]
    call LINK_ADDRESS_29
    cmp word [esp + 0x2c], 0
    je short loc_0816
    test ax, ax
    je short loc_0816
    mov dword [esp + 0xc], edi
    mov dword [esp + 0x30], esi
loc_0816:
    movsx eax, si
    mov si, word [nosplit eax*2 + NEXTSPRITESTAT]
loc_0821:
    test si, si
    jge near loc_057d
    inc dword [esp + 0x28]
loc_082e:
    mov ecx, dword [esp + 0x28]
    cmp cx, 4
    jl near loc_055d
loc_083c:
    mov eax, dword [esp + 0x30]
    add esp, 0x3c
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
%if GAME_UPDATE
loc_0850:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov esi, eax
    mov ecx, 0xfffb
    xor ebx, ebx
    jmp short loc_0891
loc_0860:
    movsx edx, bx
    imul edx, edx, 0x2c
    add edx, 0x2522b4
    mov eax, edx
    call 0x16ec0
    test eax, eax
    je short loc_0890
    movsx eax, si
    imul eax, eax, 0x2c
    add eax, 0x2522b4
    call 0x50a50
    cwde
    cmp ecx, eax
    jle short loc_0890
    mov edi, ebx
    mov ecx, eax
loc_0890:
    inc ebx
loc_0891:
    cmp bx, 0x1000
    jl short loc_0860
    cmp ecx, 0xfffb
    jne short loc_08a7
    mov eax, 0xffffffff
    jmp short loc_08a9
loc_08a7:
    mov eax, edi
loc_08a9:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    nop
loc_08b0:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov esi, eax
    mov ecx, 0xfffb
    xor ebx, ebx
    jmp short loc_08f1
loc_08c0:
    movsx edx, bx
    imul edx, edx, 0x2c
    add edx, 0x2522b4
    mov eax, edx
    call 0x16e70
    test eax, eax
    je short loc_08f0
    movsx eax, si
    imul eax, eax, 0x2c
    add eax, 0x2522b4
    call 0x50a50
    cwde
    cmp ecx, eax
    jle short loc_08f0
    mov edi, ebx
    mov ecx, eax
loc_08f0:
    inc ebx
loc_08f1:
    cmp bx, 0x1000
    jl short loc_08c0
    cmp ecx, 0xfffb
    jne short loc_0907
    mov eax, 0xffffffff
    jmp short loc_0909
loc_0907:
    mov eax, edi
loc_0909:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    nop
%else
%endif
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, LINK_ADDRESS_31
    mov dword [esp + 0x18], eax
    mov dword [esp + LINK_ADDRESS_32], edx
    movsx edx, ax
    imul edx, edx, 0x2c
%if GAME_UPDATE
    mov esi, 0x2522b4
    add esi, edx
    mov ax, word [esi + 0x18]
    mov cx, word [esi + 0xe]
    mov dword [esp + 0x14], eax
    cmp cx, 0x214
    jne near loc_09f5
    mov ax, word [esi + 0x22]
    movsx edx, ax
    mov ecx, edx
    shl ecx, 7
    sub ecx, edx
    lea ecx, [ecx*4]
    sub ecx, edx
    add ecx, ecx
    mov dword [esp + 0xc], eax
    mov eax, dword [ecx + 0xf1958]
    mov edi, dword [ecx + 0xf1990]
    mov dword [esp + 8], eax
    lea eax, [edi + 0xff]
    imul eax, eax, 0x65
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [eax*2 + 0x2496b4]
    mov dword [esp], 0x7d0
    mov eax, edx
    sar edx, 0x1f
    idiv dword [esp]
    mov edx, eax
    mov eax, dword [ecx + 0xf193c]
    add eax, dword [ecx + 0xf1964]
    add eax, 0x400
    add eax, edx
    mov dword [esp + 4], eax
    db 0x8d, 0x04, 0x7d, 0x00, 0x00, 0x00, 0x00    ; lea eax, [edi*2]
    add eax, 0x400
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [eax*2 + 0x2496b4]
    mov edi, 0x190
    mov eax, edx
    sar edx, 0x1f
    idiv edi
    movsx edx, word [ecx + 0xf19b8]
    mov ebp, dword [ecx + 0xf195c]
    add eax, edx
    mov edx, 0x309
    mov edi, eax
    mov dword [ecx + 0xf199c], edx
    jmp near loc_0a93
loc_09f5:
    mov eax, dword [esi]
    mov dword [esp + 8], eax
    movsx eax, cx
    xor ecx, ecx
    db 0x0f, 0xbf, 0x04, 0x45, 0x34, 0xc3, 0x23, 0x00    ; movsx eax, word [eax*2 + 0x23c334]
    mov cl, byte [esi + 0x15]
    imul eax, ecx
    mov ecx, dword [esi + 8]
    add eax, eax
    mov edi, 0xffffffff
    sub ecx, eax
    mov ebp, dword [esi + 4]
    lea eax, [ecx + 0x400]
    mov dword [esp + 0xc], edi
    mov dword [esp + 4], eax
    mov ax, word [esi + 0xe]
    mov di, word [esi + 0x1c]
    cmp ax, 0x938
    je short loc_0a93
    sub dword [esp + 4], 0x700
    mov eax, esi
    call 0x12bc0
    test ax, ax
    je short loc_0a93
    cmp word [edx + 0x2522c2], 0x780
    je short loc_0a93
    movsx eax, di
    lea edx, [eax + 0x460]
    and edx, 0x7ff
    mov ecx, dword [esp + 8]
    add eax, 0x260
    db 0x0f, 0xbf, 0x14, 0x55, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [edx*2 + 0x2496b4]
    and eax, 0x7ff
    sar edx, 7
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    add ecx, edx
    sar eax, 7
    mov dword [esp + 8], ecx
    add ebp, eax
loc_0a93:
    mov eax, dword [esp + 0xc]
    test ax, ax
    jl near loc_0b3f
    movsx edx, ax
%else
    mov ebx, 0x1c0ba4
    add ebx, edx
    mov ax, word [ebx + 0x18]
    mov dword [esp + 0x24], eax
    mov eax, dword [0x2c2a54]
    shr eax, 7
    mov ecx, dword [0xe9337]
    and eax, 1
    mov si, word [ebx + 0xe]
    or ecx, eax
    cmp si, 0x214
    jne near loc_0985
    mov si, word [ebx + 0x22]
    movsx edx, si
%endif
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
%if GAME_UPDATE
    add eax, eax
    mov ecx, edi
    mov dx, word [eax + 0xf1a32]
    add ecx, 0x1e
    cmp dx, 1
    jne short loc_0ad3
    mov edx, 3
    mov edi, ecx
    jmp near loc_0b44
loc_0ad3:
    cmp dx, 2
    jne short loc_0ae5
    mov edx, 3
    mov edi, ecx
    jmp near loc_0b44
loc_0ae5:
    cmp dx, 4
    jne short loc_0af2
    mov edx, 2
    jmp short loc_0b44
loc_0af2:
    mov ecx, edi
    add ecx, 0x28
    cmp dx, 7
    jne short loc_0b06
    mov edx, 2
    mov edi, ecx
    jmp short loc_0b44
loc_0b06:
    cmp dx, 8
    jne short loc_0b12
    mov edi, ecx
    xor edx, edx
    jmp short loc_0b44
loc_0b12:
    mov ecx, edi
    add ecx, 0x2d
    cmp dx, 5
    jne short loc_0b26
    mov edx, 2
    mov edi, ecx
    jmp short loc_0b44
loc_0b26:
    cmp dx, 6
    jne short loc_0b35
    mov edx, 1
    mov edi, ecx
    jmp short loc_0b44
loc_0b35:
    mov edx, 3
    add edi, 0xf
    jmp short loc_0b44
loc_0b3f:
    mov edx, 3
loc_0b44:
    call 0x6dc5f
    and eax, edx
    mov dword [esp + 0x1c], eax
    mov ecx, dword [esp + 0x1c]
    call 0x6dc5f
    test cx, cx
    jge short loc_0b64
    imul eax, ecx, 6
    mov dword [esp + 0x1c], eax
loc_0b64:
    mov ecx, dword [esp + 0x10]
    cmp cx, 0x11
    jb near loc_0ef2
    jbe short loc_0b8a
    cmp cx, 0x27e
    jb near loc_0ef2
    cmp cx, 0x27f
    ja near loc_0ef2
loc_0b8a:
    movsx edx, word [esp + 0x18]
    mov eax, 0x18c
    call 0x58160
    cmp word [esi + 0x2a], 0
    jl short loc_0ba4
    mov byte [esi + 0x10], 0xa0
loc_0ba4:
    mov edx, dword [esp + 0xc]
    test dx, dx
    jl near loc_0c2d
    movsx edx, dx
%else
    db 0x8b, 0x14, 0x45, 0x38, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb5138]
    db 0x8b, 0x2c, 0x45, 0x3c, 0x51, 0x0b, 0x00    ; mov ebp, dword [eax*2 + 0xb513c]
    db 0x8b, 0x04, 0x45, 0x70, 0x51, 0x0b, 0x00    ; mov eax, dword [eax*2 + 0xb5170]
    mov dword [esp + 0xc], edx
    add eax, 0xff
    lea edx, [ecx + 0x64]
    imul eax, edx
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [eax*2 + 0x1b7fa4]
    test ecx, ecx
    je short loc_08ea
    mov edi, 0x7d0
    jmp short loc_08ef
loc_08ea:
    mov edi, 0x898
loc_08ef:
    mov eax, edx
    sar edx, 0x1f
    idiv edi
    movsx edx, si
    mov edi, eax
%endif
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
%if GAME_UPDATE
%else
    lea edx, [eax + eax]
    mov eax, dword [edx + 0xb511c]
    add eax, dword [edx + 0xb5144]
    add eax, 0x400
    add edi, eax
    lea eax, [ecx + 1]
    imul eax, dword [edx + 0xb5170]
    lea edx, [eax + 0x400]
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    test ecx, ecx
    je short loc_094a
    mov ecx, 0x190
    jmp short loc_094f
loc_094a:
    mov ecx, 0x258
loc_094f:
    mov eax, edx
    sar edx, 0x1f
    idiv ecx
    movsx edx, si
    mov ecx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x98, 0x51, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5198]
    add ecx, edx
    db 0xc7, 0x04, 0x45, 0x7c, 0x51, 0x0b, 0x00, 0x09, 0x03, 0x00, 0x00    ; mov dword [eax*2 + 0xb517c], 0x309
    jmp near loc_0a1f
loc_0985:
    mov eax, dword [ebx]
    mov dword [esp + 0xc], eax
    movsx eax, word [ebx + 0xe]
    movzx edi, byte [ebx + 0x15]
    db 0x0f, 0xbf, 0x04, 0x45, 0x24, 0xac, 0x1a, 0x00    ; movsx eax, word [eax*2 + 0x1aac24]
    imul eax, edi
    mov esi, 0xffffffff
    mov cx, word [ebx + 0x1c]
    mov edi, dword [ebx + 8]
%endif
    add eax, eax
%if GAME_UPDATE
    mov bx, word [eax + 0xf1a32]
    cmp bx, 5
    jne short loc_0bda
    mov ebx, 0x504
    jmp short loc_0c2d
loc_0bda:
    cmp bx, 6
    jne short loc_0be7
    mov ebx, 0x568
    jmp short loc_0c2d
loc_0be7:
    cmp bx, 4
    jne short loc_0bf4
    mov ebx, 0x4a0
    jmp short loc_0c2d
loc_0bf4:
    cmp bx, 1
    jne short loc_0c01
    mov ebx, 0x3d8
    jmp short loc_0c2d
loc_0c01:
    cmp bx, 2
    jne short loc_0c0e
    mov ebx, 0x3d8
    jmp short loc_0c2d
loc_0c0e:
    cmp bx, 3
    jne short loc_0c1b
    mov ebx, 0x43c
    jmp short loc_0c2d
loc_0c1b:
    cmp bx, 7
    jne short loc_0c28
    mov ebx, 0x5cc
    jmp short loc_0c2d
loc_0c28:
    mov ebx, 0x630
loc_0c2d:
    mov ecx, dword [esp + 0xc]
    test cx, cx
    jl near loc_0cbf
%else
    mov ebp, dword [ebx + 4]
    sub edi, eax
    mov ax, word [ebx + 0xe]
    add edi, 0x400
    cmp ax, 0x938
    je short loc_0a1f
    mov eax, ebx
    sub edi, 0x700
    call 0x12be0
    test ax, ax
    je short loc_0a1f
    cmp word [edx + 0x1c0bb2], 0x780
    je short loc_0a1f
    movsx eax, cx
    mov dword [esp + 4], eax
    add eax, 0x460
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov edx, dword [esp + 0xc]
    sar eax, 7
    add edx, eax
    mov eax, dword [esp + 4]
    add eax, 0x260
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    sar eax, 7
    mov dword [esp + 0xc], edx
    add ebp, eax
loc_0a1f:
    movsx eax, si
    mov dword [esp + 8], eax
    mov edx, dword [esp + 8]
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov dx, word [eax + 0xb5212]
    cmp dx, 1
    jne short loc_0a51
    mov edx, 0x8c
    add ecx, 0x1e
    jmp short loc_0a83
loc_0a51:
    cmp dx, 3
    jne short loc_0a5e
    mov edx, 0x64
    jmp short loc_0a83
loc_0a5e:
    cmp dx, 5
    jne short loc_0a6b
    add ecx, 0x28
    xor edx, edx
    jmp short loc_0a83
loc_0a6b:
    cmp dx, 4
    jne short loc_0a7b
    mov edx, 0x46
    add ecx, 0x2d
    jmp short loc_0a83
loc_0a7b:
    mov edx, 0x64
    add ecx, 0xf
loc_0a83:
    call 0x7079f
    mov dword [esp + 4], eax
    mov eax, dword [esp + 4]
    and eax, edx
    mov dword [esp + 0x14], eax
    call 0x7079f
    mov eax, dword [esp + 0x20]
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jb near loc_0db3
    jbe short loc_0abf
    cmp ax, 0x27e
    jb near loc_0db3
    cmp ax, 0x27f
    ja near loc_0db3
loc_0abf:
    movsx edx, word [esp + 0x18]
    mov eax, 0x18c
    call 0x5aca0
    cmp word [ebx + 0x2a], 0
    jl short loc_0ad9
    mov byte [ebx + 0x10], 0xa0
loc_0ad9:
    movsx eax, si
    mov dword [esp + 8], eax
    mov edx, dword [esp + 8]
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov dx, word [eax + 0xb5212]
    cmp dx, 4
    jne short loc_0b0b
    mov dword [esp + 0x10], 0x504
    jmp short loc_0b43
loc_0b0b:
    cmp dx, 3
    jne short loc_0b1b
    mov dword [esp + 0x10], 0x4a0
    jmp short loc_0b43
loc_0b1b:
    cmp dx, 1
    jne short loc_0b2b
    mov dword [esp + 0x10], 0x3d8
    jmp short loc_0b43
loc_0b2b:
    cmp dx, 2
    jne short loc_0b3b
    mov dword [esp + 0x10], 0x43c
    jmp short loc_0b43
loc_0b3b:
    mov dword [esp + 0x10], 0x5cc
loc_0b43:
    test si, si
    jl short loc_0b97
%endif
    mov edx, 0x30
%if GAME_UPDATE
    mov eax, esi
%else
    mov eax, ebx
%endif
    call loc_0430
    test ax, ax
%if GAME_UPDATE
    jl short loc_0c7f
    movsx eax, cx
    mov esi, eax
    shl esi, 7
    sub esi, eax
    lea esi, [esi*4]
    sub esi, eax
    mov eax, 0x64
    db 0x2b, 0x04, 0x75, 0x40, 0x19, 0x0f, 0x00    ; sub eax, dword [esi*2 + 0xf1940]
    db 0x0f, 0xbf, 0x14, 0x75, 0x38, 0x1a, 0x0f, 0x00    ; movsx edx, word [esi*2 + 0xf1a38]
    sub eax, edx
    mov edx, eax
    lea eax, [eax*4]
    jmp short loc_0cb1
loc_0c7f:
    movsx edx, cx
%else
    movsx edx, si
%endif
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0x64
%if GAME_UPDATE
    mov ecx, dword [nosplit eax*2 + 0xf1940]
%else
    mov ebx, dword [nosplit eax*2 + 0xb5120]
%endif
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_27]
%if GAME_UPDATE
    sub edx, ecx
%else
    sub edx, ebx
%endif
    sub edx, eax
    lea eax, [edx*4]
%if GAME_UPDATE
loc_0cb1:
%else
%endif
    add eax, edx
    shl eax, 4
%if GAME_UPDATE
    add eax, edx
    add eax, eax
    jmp near loc_0de4
loc_0cbf:
    mov eax, esi
    mov di, word [esi + 0x1c]
    call 0x16e70
    test eax, eax
    je near loc_0d4e
    movsx edx, word [0x2f2926]
%else
    add edx, eax
    add edx, edx
    jmp near loc_0c73
loc_0b97:
    mov edx, esp
    mov eax, ebx
    call 0x53700
    movsx edx, ax
    mov dword [esp + 0x1c], eax
%endif
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
%if GAME_UPDATE
    db 0x0f, 0xbf, 0x14, 0x45, 0xbe, 0x19, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf19be]
%else
    mov ecx, dword [esp + 0xc]
    db 0x8b, 0x14, 0x45, 0x3c, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb513c]
    db 0x8b, 0x04, 0x45, 0x38, 0x51, 0x0b, 0x00    ; mov eax, dword [eax*2 + 0xb5138]
    sub eax, ecx
    sub edx, ebp
    call 0x65698
    mov ecx, eax
    movsx eax, word [esp + 0x18]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0xac8
    jne short loc_0bed
    sub edi, 0x2000
loc_0bed:
    movsx eax, word [esp + 0x1c]
    mov dword [esp + 8], eax
    mov edx, dword [esp + 8]
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov dword [esp + 4], eax
    movsx eax, word [eax + 0xb5240]
    imul eax, eax, 0x2c
    mov edx, ebx
    add eax, 0x1c0ba4
    call 0x536a0
    mov dword [esp + 8], eax
    mov eax, dword [esp + 4]
    mov eax, dword [eax + 0xb5140]
    sub eax, edi
    mov edx, eax
    imul edx, dword [esp + 0x10]
    movsx eax, word [esp + 8]
    mov dword [esp + 8], eax
    mov eax, edx
    sar edx, 0x1f
    idiv dword [esp + 8]
    mov edx, eax
    mov eax, ebx
    call 0x12be0
    test ax, ax
    je short loc_0c73
    test byte [ebx + 0x28], 0x40
    je short loc_0c73
    call 0x7079f
    xor ah, ah
    mov cx, word [ebx + 0x1c]
    and al, 0x1f
    add ecx, eax
    sub ecx, 0x10
loc_0c73:
    push 4
    movsx eax, word [esp + 0x1c]
    push eax
    add edx, 0x64
%endif
    push edx
%if GAME_UPDATE
    db 0x8b, 0x1c, 0x45, 0x3c, 0x19, 0x0f, 0x00    ; mov ebx, dword [eax*2 + 0xf193c]
    push ebx
    db 0x8b, 0x0c, 0x45, 0x38, 0x19, 0x0f, 0x00    ; mov ecx, dword [eax*2 + 0xf1938]
    db 0x8b, 0x14, 0x45, 0x34, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf1934]
    push ecx
    mov ebx, dword [esi + 8]
    mov eax, dword [esi]
    push edx
    movsx ecx, word [esi + 0x18]
    mov edx, dword [esi + 4]
    call 0x6830d
    test eax, eax
    je short loc_0d4e
    movsx edx, word [0x2f2926]
%else
    movsx eax, word [esp + 0x1c]
    push eax
    movsx eax, cx
    push eax
    push 0xe
    push 0xe
    mov ebx, ebp
    mov edx, dword [esp + 0x28]
    push 0
    movsx eax, word [esp + 0x40]
    lea ecx, [edi - 0x100]
    push eax
    movsx eax, word [esp + 0x48]
    call 0x18f70
    movsx ebx, ax
    imul ebx, ebx, 0x2c
    mov dword [esp + 0x1c], eax
    call 0x7079f
    xor ah, ah
    and al, 7
    mov di, word [ebx + 0x1c0bce]
    movsx edx, word [0x261216]
    add edi, eax
%endif
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
%if GAME_UPDATE
    mov edi, dword [esp + 8]
    db 0x8b, 0x14, 0x45, 0x38, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf1938]
    db 0x8b, 0x04, 0x45, 0x34, 0x19, 0x0f, 0x00    ; mov eax, dword [eax*2 + 0xf1934]
    sub edx, ebp
    sub eax, edi
    jmp short loc_0d8b
loc_0d4e:
    mov eax, esi
    call 0x16e70
    test eax, eax
    je short loc_0d96
    movsx eax, word [esp + 0x18]
    call loc_0850
    test ax, ax
    jl near loc_0ef2
    movsx edx, ax
    imul edx, edx, 0x2c
    mov ebx, dword [esi + 4]
    mov eax, dword [edx + 0x2522b8]
    sub eax, ebx
    mov ecx, dword [esi]
    mov ebx, eax
    mov eax, dword [edx + 0x2522b4]
    mov edx, ebx
    sub eax, ecx
loc_0d8b:
    call 0x62b58
    mov edi, eax
    mov word [esi + 0x1c], ax
loc_0d96:
    mov eax, esi
    call 0x16ec0
    test eax, eax
    je short loc_0dda
    movsx eax, word [esp + 0x18]
    call loc_08b0
    test ax, ax
    jl near loc_0ef2
    movsx ebx, ax
    imul ebx, ebx, 0x2c
    mov edx, dword [esi + 4]
    mov eax, dword [ebx + 0x2522b8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [ebx + 0x2522b4]
    sub eax, dword [esi]
    call 0x62b58
    mov edi, eax
    mov word [esi + 0x1c], ax
loc_0dda:
    mov eax, 0xfffff6a0
    mov ebx, 0x2bc
loc_0de4:
    push 4
    movsx edx, word [esp + 0x1c]
    push edx
    add eax, 0x64
    push eax
    movsx eax, bx
    push eax
    movsx eax, di
    push eax
    push 0xe
    mov ecx, dword [esp + 0x1c]
    push 0xe
    sub ecx, 0x100
    mov edx, dword [esp + 0x24]
    push 0
    movsx eax, word [esp + 0x30]
    mov ebx, ebp
    push eax
    movsx eax, word [esp + 0x38]
    call 0x192d0
    movsx ebx, ax
    imul ecx, ebx, 0x2c
    mov edx, eax
    call 0x6dc5f
    xor ah, ah
    and al, 7
    mov si, word [ecx + 0x2522de]
    add esi, eax
    lea ebx, [ebx*4]
    mov word [ecx + 0x2522de], si
    xor ecx, ecx
    mov dword [ebx + 0x22fd8], ecx
    movsx ecx, word [0x2f2926]
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
%else
%endif
    add eax, eax
%if GAME_UPDATE
    mov di, word [eax + 0xf1a32]
    cmp di, 1
    je short loc_0e7a
    cmp di, 2
    jne short loc_0e8b
loc_0e7a:
    movsx ebx, dx
    movsx eax, word [esp + 0x1c]
    mov dword [ebx*4 + 0x22fd8], eax
    jmp short loc_0ea8
loc_0e8b:
    cmp di, 3
    je short loc_0e9d
    cmp di, 4
    je short loc_0e9d
    cmp di, 5
    jne short loc_0ea8
loc_0e9d:
    movsx eax, word [esp + 0x1c]
    mov dword [ebx + 0x22fd8], eax
loc_0ea8:
    movsx eax, word [esp + 0xc]
%else
    mov dx, word [eax + 0xb5212]
    mov word [ebx + 0x1c0bce], di
    cmp dx, 1
    jne short loc_0d1d
    mov eax, dword [esp + 0x14]
    mov cx, word [ebx + 0x1c0bc6]
    shl eax, 3
    mov di, word [ebx + 0x1c0bc4]
    add ecx, eax
    add edi, eax
    mov word [ebx + 0x1c0bc6], cx
    mov word [ebx + 0x1c0bc4], di
    jmp short loc_0d75
loc_0d1d:
    cmp dx, 2
    jne short loc_0d4b
    mov eax, dword [esp + 0x14]
    mov di, word [ebx + 0x1c0bc6]
    add eax, eax
    mov dx, word [ebx + 0x1c0bc4]
    add edi, eax
    add edx, eax
    mov word [ebx + 0x1c0bc6], di
    mov word [ebx + 0x1c0bc4], dx
    jmp short loc_0d75
loc_0d4b:
    cmp dx, 3
    jne short loc_0d75
    mov eax, dword [esp + 0x14]
    mov dx, word [ebx + 0x1c0bc6]
    mov cx, word [ebx + 0x1c0bc4]
    add edx, eax
    add ecx, eax
    mov word [ebx + 0x1c0bc6], dx
    mov word [ebx + 0x1c0bc4], cx
loc_0d75:
    movsx eax, si
%endif
    cmp eax, -1
%if GAME_UPDATE
    jne short loc_0ed8
%else
    jne short loc_0d9b
%endif
%if GAME_UPDATE
    movsx eax, dx
%else
    movsx eax, word [esp + 0x1c]
%endif
    imul eax, eax, 0x2c
%if GAME_UPDATE
    mov bl, 0x14
    mov byte [eax + 0x2522c8], bl
    mov si, word [eax + 0x2522de]
    mov byte [eax + 0x2522c9], bl
    sar si, 2
    mov word [eax + 0x2522de], si
loc_0ed8:
    movsx eax, dx
%else
    mov dl, 0x14
    mov byte [eax + 0x1c0bb8], dl
    mov byte [eax + 0x1c0bb9], dl
    sar word [eax + 0x1c0bce], 2
loc_0d9b:
    movsx eax, word [esp + 0x1c]
%endif
    imul eax, eax, 0x2c
%if GAME_UPDATE
    mov edi, 0x80
    mov cl, 4
    mov word [eax + 0x2522c0], di
    mov byte [eax + 0x2522c6], cl
loc_0ef2:
    add esp, 0x20
%else
    mov word [eax + 0x1c0bb0], 0x80
    mov byte [eax + 0x1c0bb6], 4
loc_0db3:
    add esp, 0x28
%endif
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
%if GAME_UPDATE
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
%else
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
%endif
