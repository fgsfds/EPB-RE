; Dispatch game world and actor updates.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0xc
    mov ax, word [LINK_ADDRESS_1]
loc_000f:
    mov dword [esp + 8], eax
    mov edx, dword [esp + 8]
    test dx, dx
    jl short LINK_ADDRESS_2
    movsx ebx, dx
    imul edi, ebx, 0x2c
    mov ax, word [nosplit ebx*2 + NEXTSPRITESTAT]
    mov dword [esp + 4], eax
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    add edi, SPRITE
    sub eax, ebx
    mov cx, word [edi + 0x18]
    mov esi, dword [eax + LINK_ADDRESS_5]
    mov edx, eax
    test esi, esi
    jne near loc_0196
    sub dword [edi + 8], 0x1000
    movsx eax, word [edi + 0x1c]
    mov dword [edx + LINK_ADDRESS_6], eax
    movsx eax, word [edi + 0x2a]
    mov dword [esp], eax
    mov eax, ebx
    call LINK_ADDRESS_7
    test ax, ax
    jl near loc_015f
    cmp ax, 0x394
    je short loc_00a4
    cmp ax, 0xa2d
    je short loc_00a4
    cmp ax, 0x686
    je short loc_00a4
    cmp ax, 0x4df
    je short loc_00a4
    cmp ax, 0x437
    jne near loc_014f
loc_00a4:
    cmp word [edi + 0x2a], 0
    jg near loc_015f
    movsx edx, word [esp + 8]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, 1
    mov si, word [LINK_ADDRESS_1]
    mov dword [eax + LINK_ADDRESS_5], edx
loc_00d8:
    test si, si
    jl near loc_015f
    movsx ebx, si
    imul edx, ebx, 0x2c
    movsx eax, word [esp + 8]
    imul ecx, eax, 0x2c
    mov ax, word [edx + LINK_ADDRESS_8]
    cmp ax, word [ecx + LINK_ADDRESS_8]
    jne short loc_0142
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov dword [eax + LINK_ADDRESS_5], 1
    and byte [edx + LINK_ADDRESS_9], 0xbf
    mov ax, word [edx + LINK_ADDRESS_10]
    cmp ax, 0x4e7
    je short loc_0135
    cmp ax, 0x4e2
    jne short loc_0142
loc_0135:
    movsx eax, si
    imul eax, eax, 0x2c
    or byte [eax + LINK_ADDRESS_11], 0x80
loc_0142:
    movsx eax, si
    mov si, word [nosplit eax*2 + NEXTSPRITESTAT]
    jmp short loc_00d8
loc_014f:
    xor ecx, ecx
    mov eax, dword [esp]
    mov word [edx + LINK_ADDRESS_12], cx
    mov word [edi + 0x2a], ax
loc_015f:
    movsx edx, word [esp + 8]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ecx, dword [edi + 8]
    mov ax, word [eax + LINK_ADDRESS_6]
    add ecx, 0x1000
    mov word [edi + 0x1c], ax
    mov dword [edi + 8], ecx
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0196:
    cmp esi, 1
    jne near loc_0362
    mov si, word [edi + 0x26]
    test si, si
    jle short loc_01ec
    mov eax, esi
    sub eax, 3
    mov word [edi + 0x26], ax
    test ax, ax
    jg near loc_0362
    call LINK_ADDRESS_13
    db 0x05, 0x20, 0x00, 0x00, 0x00    ; add eax, 0x20
    xor ah, ah
    and al, 0x3f
    mov word [edi + 0x20], ax
    call LINK_ADDRESS_13
    and ah, 3
    add ah, 4
    mov ebx, eax
    mov word [edi + 0x24], ax
    neg ebx
    mov word [edi + 0x24], bx
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_01ec:
    mov ax, word [edi + 0x20]
    test ax, ax
    jle short loc_020a
    mov edx, eax
    sub edx, 8
    mov eax, ebx
    mov word [edi + 0x20], dx
    mov edx, 0x10001
    call LINK_ADDRESS_14
loc_020a:
    movsx eax, word [edi + 0x18]
    call LINK_ADDRESS_15
    test eax, eax
    je short loc_021b
    xor eax, eax
    jmp short loc_0240
loc_021b:
    movsx eax, word [edi + 0x18]
    call LINK_ADDRESS_16
    test eax, eax
    je short loc_023b
    mov eax, dword [LINK_ADDRESS_17]
    mov edx, eax
    mov ebx, 6
    sar edx, 0x1f
    idiv ebx
    jmp short loc_0240
loc_023b:
    mov eax, dword [LINK_ADDRESS_17]
loc_0240:
    mov dword [esp], eax
    movsx edx, cx
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + LINK_ADDRESS_18]
    mov edx, dword [edi + 8]
    sub eax, 0x100
    cmp eax, edx
    jle short loc_0283
    mov eax, dword [esp]
    mov bx, word [edi + 0x24]
    add ebx, eax
    mov word [edi + 0x24], bx
    cmp bx, 0x1800
    jle short loc_027c
    mov word [edi + 0x24], 0x1800
loc_027c:
    movsx eax, word [edi + 0x24]
    add dword [edi + 8], eax
loc_0283:
    movsx edx, cx
    lea eax, [edx*4]
    add eax, edx
    mov ecx, dword [edi + 8]
    mov eax, dword [eax*8 + LINK_ADDRESS_18]
    sub eax, ecx
    cmp eax, 0x1000
    jge near loc_0362
    call LINK_ADDRESS_13
    mov esi, eax
    xor ebp, ebp
    and esi, 7
    mov dword [esp], ebp
    inc esi
    jmp near loc_034a
loc_02bb:
    push 5
    movsx eax, word [esp + 0xc]
    push eax
    mov edx, 0xfffffe00
    call LINK_ADDRESS_13
    and eax, 0x7ff
    sub edx, eax
    push edx
    call LINK_ADDRESS_13
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call LINK_ADDRESS_13
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call LINK_ADDRESS_13
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [edi + 8]
    push eax
    sub ecx, 0x800
    call LINK_ADDRESS_13
    and eax, 0x1fff
    sub ecx, eax
    call LINK_ADDRESS_13
    and eax, 0xff
    mov ebx, dword [edi + 4]
    add ebx, eax
    call LINK_ADDRESS_13
    and eax, 0xff
    add eax, dword [edi]
    lea edx, [eax - 0x80]
    sub ebx, 0x80
    movsx eax, word [edi + 0x18]
    call LINK_ADDRESS_19
    inc dword [esp]
loc_034a:
    mov ebx, dword [esp]
    movsx eax, si
    cmp eax, ebx
    jg near loc_02bb
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_20
loc_0362:
    mov eax, dword [esp + 4]
    jmp near loc_000f
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x24
    mov ax, word [LINK_ADDRESS_21]
loc_037f:
    mov dword [esp + 0x20], eax
    mov edx, dword [esp + 0x20]
    test dx, dx
    jl near loc_2255
    movsx edx, dx
    mov ax, word [nosplit edx*2 + NEXTSPRITESTAT]
    mov dword [esp + 0x18], eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    imul ecx, edx, 0x2c
    mov esi, SPRITE
    mov edi, LINK_ADDRESS_22
    add esi, ecx
    add edi, eax
    mov bx, word [esi + 0x18]
    add edi, 0x2f
    test bx, bx
    jge short loc_03da
    mov eax, edx
    call LINK_ADDRESS_20
    jmp near loc_224c
loc_03da:
    mov ebp, dword [esi]
    mov dword [eax + LINK_ADDRESS_23], ebp
    mov ebp, dword [esi + 4]
    mov dword [eax + LINK_ADDRESS_24], ebp
    mov ebp, dword [esi + 8]
    mov dword [eax + LINK_ADDRESS_25], ebp
    mov ax, word [ecx + LINK_ADDRESS_10]
    cmp ax, 0x4c6
    jl near loc_0943
    cmp ax, 0x4c9
    jg near loc_0943
    cmp word [esi + 0x20], 0
    je short loc_041d
    mov eax, edx
    call LINK_ADDRESS_26
loc_041d:
    mov ecx, dword [edi]
    test ecx, ecx
    jne near loc_04d3
    mov eax, dword [edi + 4]
    mov ax, word [nosplit eax*2 + HEADSPRITESECT]
    mov word [esp + 0x10], ax
loc_0437:
    mov eax, dword [esp + 0x10]
    test ax, ax
    jl near loc_0825
    cwde
    mov dx, word [nosplit eax*2 + NEXTSPRITESECT]
    imul eax, eax, 0x2c
    mov ax, word [eax + LINK_ADDRESS_29]
    db 0x66, 0x3d, 0x06, 0x00    ; cmp ax, 6
    jb short loc_0467
    jbe short loc_0473
    db 0x66, 0x3d, 0x0a, 0x00    ; cmp ax, 0xa
    je short loc_0473
    jmp short loc_04c9
loc_0467:
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jb short loc_04c9
    db 0x66, 0x3d, 0x02, 0x00    ; cmp ax, 2
    ja short loc_04c9
loc_0473:
    mov edx, dword [edi + 0x10]
    mov ebx, dword [esi + 4]
    mov eax, dword [edx*4 + LINK_ADDRESS_30]
    sub eax, ebx
    mov ecx, dword [esi]
    mov ebx, eax
    mov eax, dword [edx*4 + LINK_ADDRESS_31]
    mov edx, ebx
    sub eax, ecx
    call GETANGLE
    mov word [esi + 0x1c], ax
    movsx eax, word [esp + 0x10]
    imul ecx, eax, 0x2c
    mov edx, dword [edi + 0x10]
    mov ebx, dword [edx*4 + LINK_ADDRESS_30]
    mov edx, dword [edx*4 + LINK_ADDRESS_31]
    mov ecx, dword [ecx + LINK_ADDRESS_33]
    call LINK_ADDRESS_34
    inc dword [edi]
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_04c9:
    mov word [esp + 0x10], dx
    jmp near loc_0437
loc_04d3:
    cmp ecx, 1
    jne short loc_0513
    cmp word [esi + 0x20], 0xb8
    jge short loc_04f1
    mov cx, word [esi + 0x20]
    mov word [esi + 0xe], 0x4c7
    add ecx, 8
    mov word [esi + 0x20], cx
loc_04f1:
    movsx eax, word [esp + 0x20]
    mov edx, 0x10001
    call LINK_ADDRESS_14
    movsx eax, bx
    cmp eax, dword [edi + 4]
    jne near loc_0825
    inc dword [edi]
    jmp near loc_0825
loc_0513:
    cmp ecx, 2
    je short loc_0521
    cmp ecx, 7
    jne near loc_0637
loc_0521:
    mov ecx, dword [esi + 8]
    add ecx, 0x600
    mov dword [esi + 8], ecx
    cmp dword [edi], 2
    jne short loc_0581
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + LINK_ADDRESS_18]
    sub eax, ecx
    cmp eax, 0x4000
    jge short loc_0560
    mov cx, word [esi + 0xe]
    cmp cx, 0x4c6
    jle short loc_0560
    mov eax, ecx
    dec eax
    mov word [esi + 0xe], ax
loc_0560:
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    mov ecx, dword [esi + 8]
    mov eax, dword [eax*8 + LINK_ADDRESS_18]
    sub eax, ecx
    cmp eax, 0x1400
    jge short loc_0581
    inc dword [edi]
loc_0581:
    cmp dword [edi], 7
    jne near loc_0825
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + LINK_ADDRESS_18]
    sub eax, dword [esi + 8]
    cmp eax, 0x4000
    jge near loc_0825
    mov dx, word [esi + 0xe]
    cmp dx, 0x4c6
    jle short loc_05c2
    mov eax, edx
    dec eax
    mov word [esi + 0xe], ax
    jmp near loc_0825
loc_05c2:
    movsx eax, word [esi + 0x1e]
    cmp eax, -2
    jne short loc_062a
    movsx edx, word [esp + 0x14]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [nosplit eax*2 + LINK_ADDRESS_35]
    mov eax, 0x26
    call LINK_ADDRESS_36
    mov edx, esp
    mov eax, esi
    call LINK_ADDRESS_37
    movsx edx, ax
    mov dword [esp + 0x14], eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov ebx, dword [esp + 0x20]
    cmp bx, word [eax + LINK_ADDRESS_38]
    jne short loc_062a
    mov word [eax + LINK_ADDRESS_38], 0xffff
loc_062a:
    inc dword [edi]
    mov word [esi + 0x1e], 0xffff
    jmp near loc_0825
loc_0637:
    cmp ecx, 3
    jne near loc_0716
    mov dx, word [esi + 0xe]
    inc edx
    mov word [esi + 0xe], dx
    cmp dx, 0x4c8
    jne near loc_0825
    movsx eax, word [edi + 4]
    call LINK_ADDRESS_39
    mov dword [esp + 0x14], eax
    test ax, ax
    jl short loc_06b6
    movsx edx, ax
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    add ebx, ebx
    cmp byte [ebx + LINK_ADDRESS_40], 0
    je short loc_06b6
    mov word [esi + 0x1e], 0xfffe
    mov eax, dword [esp + 0x20]
    movsx edx, word [ebx + LINK_ADDRESS_35]
    mov word [ebx + LINK_ADDRESS_38], ax
    mov eax, 0x26
    call LINK_ADDRESS_36
    mov ax, word [esi + 0x1c]
    add ah, 4
    mov word [ebx + LINK_ADDRESS_41], ax
    jmp short loc_0701
loc_06b6:
    mov eax, dword [edi + 4]
    mov ax, word [nosplit eax*2 + HEADSPRITESECT]
loc_06c1:
    mov word [esp + 0x10], ax
    mov ecx, dword [esp + 0x10]
    test cx, cx
    jl short loc_0701
    movsx eax, cx
    imul eax, eax, 0x2c
    mov ax, word [eax + LINK_ADDRESS_29]
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jb short loc_06f2
    jbe short loc_06ea
    db 0x66, 0x3d, 0x06, 0x00    ; cmp ax, 6
    jne short loc_06f2
loc_06ea:
    mov eax, dword [esp + 0x10]
    mov word [esi + 0x1e], ax
loc_06f2:
    movsx eax, word [esp + 0x10]
    mov ax, word [nosplit eax*2 + NEXTSPRITESECT]
    jmp short loc_06c1
loc_0701:
    mov ebp, dword [edi]
    mov dword [edi + 8], 0
    inc ebp
    mov dword [edi], ebp
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_0716:
    cmp ecx, 4
    jne short loc_0732
    mov eax, dword [edi + 8]
    inc eax
    mov dword [edi + 8], eax
    cmp eax, 0xa
    jle near loc_0825
    inc dword [edi]
    jmp near loc_0825
loc_0732:
    cmp ecx, 5
    je short loc_073c
    cmp ecx, 8
    jne short loc_079a
loc_073c:
    cmp dword [edi], 8
    jne short loc_0770
    mov cx, word [esi + 0xe]
    cmp cx, 0x4c8
    jge short loc_0770
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + LINK_ADDRESS_18]
    sub eax, dword [esi + 8]
    cmp eax, 0x2000
    jle short loc_0770
    mov eax, ecx
    inc eax
    mov word [esi + 0xe], ax
loc_0770:
    mov eax, dword [edi + 0x10]
    mov edx, dword [esi + 8]
    cmp edx, dword [eax*4 + LINK_ADDRESS_42]
    jge short loc_078c
    inc dword [edi]
    mov word [esi + 0x20], 0
    jmp near loc_0825
loc_078c:
    lea ecx, [edx - 0x600]
    mov dword [esi + 8], ecx
    jmp near loc_0825
loc_079a:
    cmp ecx, 6
    jne near loc_081a
    mov dx, word [esi + 0x20]
    cmp dx, 0xc0
    jge short loc_07b7
    mov ebx, edx
    add ebx, 8
    mov word [esi + 0x20], bx
loc_07b7:
    mov edx, dword [edi + 0x10]
    mov ebp, dword [esi + 4]
    mov ebx, dword [edx*4 + LINK_ADDRESS_43]
    mov eax, dword [edx*4 + LINK_ADDRESS_44]
    mov edx, dword [esi]
    sub ebx, ebp
    sub eax, edx
    mov edx, ebx
    call GETANGLE
    mov edx, 0x10001
    mov word [esi + 0x1c], ax
    movsx eax, word [esp + 0x20]
    call LINK_ADDRESS_14
    mov edx, dword [edi + 0x10]
    mov eax, dword [esi + 4]
    mov ebx, dword [edx*4 + LINK_ADDRESS_43]
    sub eax, ebx
    mov ebx, eax
    imul ebx, eax
    mov ecx, dword [edx*4 + LINK_ADDRESS_44]
    mov eax, dword [esi]
    sub eax, ecx
    imul eax, eax
    add eax, ebx
    cmp eax, 0x4000
    jge short loc_0825
    inc dword [edi]
    jmp short loc_0825
loc_081a:
    cmp ecx, 9
    jne short loc_0825
    mov dword [edi], 0
loc_0825:
    mov ecx, dword [esi + 8]
    mov ebx, dword [esi + 4]
    mov eax, dword [edi + 0x10]
    mov edx, dword [esi]
    sub ecx, 0x2200
    mov eax, dword [eax*4 + LINK_ADDRESS_45]
    call LINK_ADDRESS_34
    movsx eax, word [esi + 0x1e]
    cmp eax, -1
    je near loc_224c
    mov edx, esp
    mov eax, esi
    call LINK_ADDRESS_37
    mov edx, eax
    mov dword [esp + 0x14], eax
    movsx eax, word [esp + 0x20]
    call LINK_ADDRESS_7
    test ax, ax
    jl short loc_08b6
    movsx eax, word [esi + 0x1e]
    cmp eax, -2
    jne short loc_08a1
    movsx edx, dx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov ebx, dword [esp + 0x20]
    cmp bx, word [eax + LINK_ADDRESS_38]
    jne short loc_08a1
    mov word [eax + LINK_ADDRESS_38], 0xffff
loc_08a1:
    mov word [esi + 0x1e], 0xffff
    mov word [esi + 0xe], 0x4c6
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_08b6:
    cmp word [esi + 0x1e], 0
    jl near loc_224c
    mov ecx, dword [esi + 8]
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    movsx eax, word [esi + 0x1e]
    call LINK_ADDRESS_34
    movsx edx, word [esi + 0x1e]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [esi]
    mov dword [edx + LINK_ADDRESS_23], eax
    movsx edx, word [esi + 0x1e]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [esi + 4]
    mov dword [edx + LINK_ADDRESS_24], eax
    movsx edx, word [esi + 0x1e]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [esi + 8]
    mov dword [edx + LINK_ADDRESS_25], eax
    mov word [esi + 0x24], 0
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_0943:
    movsx eax, word [esp + 0x20]
    imul eax, eax, 0x2c
    mov dx, word [eax + LINK_ADDRESS_10]
    cmp dx, 0x233
    jl near loc_09d7
    cmp dx, 0x236
    jg short loc_09d7
    mov ebp, dword [edi]
    test ebp, ebp
    jle near loc_224c
    cmp ebp, 0x14
    jge short loc_099b
    lea ebx, [ebp + 1]
    mov dword [edi], ebx
    mov bx, word [esi + 0xe]
    inc ebx
    mov word [esi + 0xe], bx
    cmp bx, 0x236
    jne near loc_224c
    mov word [esi + 0xe], 0x234
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_099b:
    mov edx, esp
    mov eax, esi
    call LINK_ADDRESS_37
    mov edx, dword [esp]
    mov dword [esp + 0x14], eax
    cmp edx, 0x200
    jle short loc_09c8
    mov dword [edi], 0
    mov word [esi + 0xe], 0x233
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_09c8:
    mov dword [edi], 1
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_09d7:
    mov ax, word [esi + 0xe]
    cmp ax, 0x3b7
    je short loc_09fd
    cmp ax, 0x38c
    je short loc_09fd
    cmp ax, 0x38e
    je short loc_09fd
    cmp ax, 0x3de
    je short loc_09fd
    cmp ax, 0x3d2
    jne near loc_0b47
loc_09fd:
    movsx ebx, word [esp + 0x20]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov edx, dword [eax + LINK_ADDRESS_5]
    cmp edx, 1
    jne near loc_0af2
    mov ecx, dword [eax + LINK_ADDRESS_6]
    add ecx, edx
    mov edx, ecx
    and edx, 3
    mov dword [eax + LINK_ADDRESS_6], ecx
    test edx, edx
    jg near loc_224c
    cmp word [esi + 0xe], 0x3de
    jne short loc_0a6e
    cmp dword [eax + LINK_ADDRESS_6], 0x20
    jne short loc_0a6e
    mov edx, 0x4ca
    mov eax, ebx
    mov word [esi + 0xc], 0
    call LINK_ADDRESS_46
    cwde
    imul eax, eax, 0x2c
    mov byte [eax + LINK_ADDRESS_47], 0x7f
    jmp short loc_0a8f
loc_0a6e:
    mov al, byte [esi + 0x10]
    cmp al, 0x40
    jl short loc_0a88
    movsx eax, word [esp + 0x20]
    call LINK_ADDRESS_20
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_0a88:
    mov ah, al
    inc ah
    mov byte [esi + 0x10], ah
loc_0a8f:
    xor edx, edx
    mov dl, byte [esi + 0x14]
    call LINK_ADDRESS_13
    xor ah, ah
    and al, 7
    sub edx, eax
    mov word [esp + 0x10], dx
    cmp dx, 0xa
    jge short loc_0abd
    movsx eax, word [esp + 0x20]
    call LINK_ADDRESS_20
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_0abd:
    xor edx, edx
    mov dl, byte [esi + 0x15]
    call LINK_ADDRESS_13
    xor ah, ah
    and al, 7
    sub edx, eax
    mov word [esp + 0x10], dx
    cmp dx, 4
    jge short loc_0aeb
loc_0ad8:
    movsx eax, word [esp + 0x20]
    call LINK_ADDRESS_20
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_0aeb:
    mov al, byte [esp + 0x10]
    mov byte [esi + 0x15], al
loc_0af2:
    cmp word [esi + 0xe], 0x3b7
    jne near loc_224c
    movsx edx, word [esp + 0x20]
    mov eax, edx
    call LINK_ADDRESS_48
    movsx ebx, word [esi + 0x18]
    lea eax, [ebx*4]
    add ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    lea ebx, [ebx*8]
    mov edx, eax
    mov eax, dword [ebx + LINK_ADDRESS_49]
    mov dword [edx + LINK_ADDRESS_50], eax
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_0b47:
    cmp ax, 0xa06
    jne near loc_1077
    movsx ebx, word [esp + 0x20]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov ecx, dword [eax + LINK_ADDRESS_51]
    mov edx, eax
    test ecx, ecx
    jle near loc_0ce9
    lea edi, [ecx - 1]
    mov dword [eax + LINK_ADDRESS_51], edi
    cmp edi, 8
    jne near loc_224c
    mov eax, 0x11
    mov edx, ebx
    call LINK_ADDRESS_36
    xor edx, edx
    mov word [esp + 0x10], dx
    jmp near loc_0c2e
loc_0ba2:
    push 5
    movsx eax, word [esp + 0x24]
    push eax
    mov edx, 0xfffffe00
    call LINK_ADDRESS_13
    and eax, 0x7ff
    sub edx, eax
    push edx
    call LINK_ADDRESS_13
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call LINK_ADDRESS_13
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call LINK_ADDRESS_13
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [esi + 8]
    push eax
    sub ecx, 0x800
    call LINK_ADDRESS_13
    and eax, 0x1fff
    sub ecx, eax
    call LINK_ADDRESS_13
    and eax, 0xff
    add eax, dword [esi + 4]
    lea ebx, [eax - 0x80]
    call LINK_ADDRESS_13
    and eax, 0xff
    add eax, dword [esi]
    lea edx, [eax - 0x80]
    movsx eax, word [esi + 0x18]
    call LINK_ADDRESS_19
    inc word [esp + 0x10]
loc_0c2e:
    cmp word [esp + 0x10], 5
    jl near loc_0ba2
    movsx eax, word [esi + 0x2a]
    movsx edi, word [esp + 0x20]
    mov dword [esp], eax
    mov ebx, eax
    mov ecx, eax
    sar ebx, 2
    push eax
    sub eax, ebx
    mov edx, dword [LINK_ADDRESS_52]
    push eax
    sar ecx, 1
    mov eax, edi
    call LINK_ADDRESS_53
    mov edx, 0x762
    mov eax, edi
    call LINK_ADDRESS_46
    mov word [esp + 0x10], ax
    cwde
    imul edx, eax, 0x2c
    mov bx, word [esi + 0x1c]
    mov word [edx + LINK_ADDRESS_54], bx
    mov word [edx + LINK_ADDRESS_55], 0x15c
    mov edx, 0x10001
    call LINK_ADDRESS_14
    mov ax, word [LINK_ADDRESS_56]
loc_0c99:
    mov word [esp + 0x10], ax
    mov edi, dword [esp + 0x10]
    test di, di
    jl near loc_0ad8
    movsx eax, di
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_10], 0xa07
    jne short loc_0cda
    mov dx, word [esi + 0x28]
    mov bx, word [eax + LINK_ADDRESS_8]
    cmp dx, bx
    jne short loc_0cda
    xor dh, bh
    mov byte [eax + LINK_ADDRESS_57], dh
    mov byte [eax + LINK_ADDRESS_58], dh
loc_0cda:
    movsx eax, word [esp + 0x10]
    mov ax, word [nosplit eax*2 + NEXTSPRITESTAT]
    jmp short loc_0c99
loc_0ce9:
    movsx eax, word [esi + 0x2a]
    mov dword [esp], eax
    movsx eax, word [esi + 0x1c]
    mov dword [esp + 8], eax
    mov eax, ebx
    mov word [esi + 0x2a], 1
    call LINK_ADDRESS_7
    test ax, ax
    jl short loc_0d14
    mov dword [edx + LINK_ADDRESS_51], 0x10
loc_0d14:
    movsx edx, word [esp + 0x20]
    lea ebx, [edx*8]
    mov eax, dword [esp]
    add ebx, edx
    mov word [esi + 0x2a], ax
    lea ebx, [ebx*8]
    mov eax, dword [esp + 8]
    sub ebx, edx
    mov word [esi + 0x1c], ax
    cmp dword [ebx + LINK_ADDRESS_5], 0x20
    jge short loc_0d75
    mov edx, esp
    mov eax, esi
    call LINK_ADDRESS_37
    mov dword [esp + 0x14], eax
    cmp dword [esp], 0x300
    jle short loc_0d61
    inc dword [ebx + LINK_ADDRESS_5]
    jmp short loc_0d75
loc_0d61:
    mov edx, dword [ebx + LINK_ADDRESS_5]
    cmp edx, 0x10
    jle short loc_0d75
    lea ecx, [edx + 1]
    mov dword [ebx + LINK_ADDRESS_5], ecx
loc_0d75:
    movsx ebp, word [esp + 0x20]
    lea edi, [ebp*8]
    add edi, ebp
    lea edi, [edi*8]
    sub edi, ebp
    cmp dword [edi + LINK_ADDRESS_5], 0x20
    jne near loc_0f7d
    movsx eax, word [esi + 0x1c]
    mov dword [esp + 8], eax
    mov ax, word [edi + LINK_ADDRESS_59]
    mov word [esi + 0x1c], ax
    mov eax, dword [esi]
    mov dword [edi + LINK_ADDRESS_60], eax
    mov eax, dword [esi + 4]
    mov dword [edi + LINK_ADDRESS_61], eax
    mov eax, dword [edi + LINK_ADDRESS_59]
    add eax, 0x200
    and eax, 0x7ff
    movsx eax, word [nosplit eax*2 + SINTABLE]
    mov edx, dword [esi]
    sar eax, 9
    add edx, eax
    mov dword [esi], edx
    mov eax, dword [edi + LINK_ADDRESS_59]
    and eax, 0x7ff
    mov ebx, dword [esi + 4]
    movsx eax, word [nosplit eax*2 + SINTABLE]
    mov ecx, dword [esi + 8]
    sar eax, 9
    sub ecx, 0x300
    add ebx, eax
    mov edx, dword [esi]
    mov dword [esi + 4], ebx
    mov eax, ebp
    mov ebx, dword [esi + 4]
    mov dword [esi + 8], ecx
    call LINK_ADDRESS_34
    lea edx, [esp + 0xc]
    mov eax, ebp
    call LINK_ADDRESS_63
    mov dword [esp], eax
    mov dword [edi + LINK_ADDRESS_64], eax
    mov eax, dword [esp + 8]
    mov word [esi + 0x1c], ax
loc_0e30:
    cmp dword [esp], 0
    jle near loc_0f05
    movsx eax, word [esp + 0x20]
    mov edx, 0xa07
    mov dword [esp + 4], eax
    call LINK_ADDRESS_46
    movsx ebp, ax
    imul edi, ebp, 0x2c
    mov eax, ebp
    mov ecx, dword [edi + LINK_ADDRESS_33]
    mov ebx, dword [edi + LINK_ADDRESS_65]
    mov edx, dword [edi + SPRITE]
    call LINK_ADDRESS_34
    lea edx, [ebp*8]
    add edx, ebp
    mov ax, word [esi + 0x28]
    lea edx, [edx*8]
    mov word [edi + LINK_ADDRESS_8], ax
    sub edx, ebp
    mov eax, dword [edi + LINK_ADDRESS_33]
    mov dword [edx + LINK_ADDRESS_6], eax
    mov edx, dword [esp + 4]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [eax + LINK_ADDRESS_59]
    add edx, 0x200
    and edx, 0x7ff
    movsx edx, word [nosplit edx*2 + SINTABLE]
    mov ecx, dword [esi]
    sar edx, 4
    add ecx, edx
    mov dword [esi], ecx
    mov eax, dword [eax + LINK_ADDRESS_59]
    and eax, 0x7ff
    movsx eax, word [nosplit eax*2 + SINTABLE]
    mov edi, dword [esi + 4]
    sar eax, 4
    add edi, eax
    mov dword [esi + 4], edi
    mov ebp, dword [esp]
    cmp ebp, 0x400
    jl short loc_0f05
    lea eax, [ebp - 0x400]
    mov dword [esp], eax
    jmp near loc_0e30
loc_0f05:
    movsx ebp, word [esp + 0x20]
    lea edi, [ebp*8]
    add edi, ebp
    lea edi, [edi*8]
    sub edi, ebp
    inc dword [edi + LINK_ADDRESS_5]
    mov eax, dword [edi + LINK_ADDRESS_60]
    mov ebx, dword [esi + 8]
    mov dword [esi], eax
    add ebx, 0x300
    mov eax, dword [edi + LINK_ADDRESS_61]
    mov edx, dword [esi]
    mov dword [esi + 4], eax
    mov ecx, ebx
    mov dword [esi + 8], ebx
    mov eax, ebp
    mov ebx, dword [esi + 4]
    call LINK_ADDRESS_34
    xor ecx, ecx
    mov eax, dword [esp + 0xc]
    mov dword [edi + LINK_ADDRESS_60], ecx
    test ax, ax
    jl short loc_0f77
    mov eax, 0xd
    mov edx, ebp
    mov dword [edi + LINK_ADDRESS_51], eax
    mov eax, 0x10
    call LINK_ADDRESS_36
    jmp short loc_0f7d
loc_0f77:
    mov dword [edi + LINK_ADDRESS_51], ecx
loc_0f7d:
    movsx ebp, word [esp + 0x20]
    lea edi, [ebp*8]
    add edi, ebp
    lea edi, [edi*8]
    sub edi, ebp
    cmp dword [edi + LINK_ADDRESS_5], 0x21
    jne near loc_224c
    inc dword [edi + LINK_ADDRESS_6]
    mov eax, dword [esi]
    mov dword [edi + LINK_ADDRESS_60], eax
    mov eax, dword [esi + 4]
    mov dword [edi + LINK_ADDRESS_61], eax
    mov eax, dword [edi + LINK_ADDRESS_59]
    add eax, 0x200
    and eax, 0x7ff
    movsx eax, word [nosplit eax*2 + SINTABLE]
    mov ecx, dword [esi]
    sar eax, 9
    add ecx, eax
    mov dword [esi], ecx
    mov eax, dword [edi + LINK_ADDRESS_59]
    and eax, 0x7ff
    mov edx, dword [esi + 4]
    mov ebx, dword [esi + 8]
    movsx eax, word [nosplit eax*2 + SINTABLE]
    sub ebx, 0x300
    sar eax, 9
    mov dword [esi + 8], ebx
    add edx, eax
    mov ecx, ebx
    mov dword [esi + 4], edx
    mov eax, ebp
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    call LINK_ADDRESS_34
    lea edx, [esp + 0xc]
    mov eax, ebp
    call LINK_ADDRESS_63
    mov dword [esp], eax
    mov eax, dword [edi + LINK_ADDRESS_60]
    mov ecx, dword [esi + 8]
    mov dword [esi], eax
    add ecx, 0x300
    mov eax, dword [edi + LINK_ADDRESS_61]
    mov edx, dword [esi]
    mov dword [esi + 4], eax
    mov eax, ebp
    mov ebx, dword [esi + 4]
    mov dword [esi + 8], ecx
    call LINK_ADDRESS_34
    mov esi, dword [esp]
    cmp esi, dword [edi + LINK_ADDRESS_64]
    je near loc_224c
    mov eax, 0xd
    mov edx, ebp
    mov dword [edi + LINK_ADDRESS_51], eax
    mov eax, 0x10
    call LINK_ADDRESS_36
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1077:
    cmp ax, 0x222
    jl near loc_1153
    cmp ax, 0x225
    jg near loc_1153
    cmp word [esi + 0x28], 0
    jle near loc_224c
    movsx eax, word [esi + 0xc]
    mov dword [edi], eax
    movsx eax, word [esi + 0x1c]
    mov dword [edi + 4], eax
    movsx eax, word [esp + 0x20]
    call LINK_ADDRESS_7
    cmp ax, 0x394
    je short loc_10cb
    cmp ax, 0xa2d
    je short loc_10cb
    cmp ax, 0x686
    je short loc_10cb
    cmp ax, 0x4df
    je short loc_10cb
    cmp ax, 0x437
    jne short loc_1135
loc_10cb:
    mov ax, word [LINK_ADDRESS_21]
loc_10d1:
    mov word [esp + 0x10], ax
    mov ebx, dword [esp + 0x10]
    test bx, bx
    jl near loc_130b
    movsx eax, bx
    imul eax, eax, 0x2c
    mov dx, word [esi + 0x28]
    cmp dx, word [eax + LINK_ADDRESS_8]
    jne short loc_1126
    mov dx, word [eax + LINK_ADDRESS_10]
    cmp dx, 0x437
    je short loc_110b
    cmp dx, 0x4df
    jne short loc_1126
loc_110b:
    movsx eax, word [esp + 0x10]
    imul eax, eax, 0x2c
    movsx edx, byte [eax + LINK_ADDRESS_47]
    cmp edx, -0x20
    je short loc_1126
    mov byte [eax + LINK_ADDRESS_47], 0xe0
loc_1126:
    movsx eax, word [esp + 0x10]
    mov ax, word [nosplit eax*2 + NEXTSPRITESTAT]
    jmp short loc_10d1
loc_1135:
    mov ax, word [edi]
    mov word [esi + 0xc], ax
    mov ax, word [edi + 4]
    mov word [esi + 0x2a], 0
    mov word [esi + 0x1c], ax
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1153:
    mov cx, word [esi + 0xe]
    cmp cx, 0x394
    jne near loc_13b5
    movsx eax, word [esp + 0x20]
    call LINK_ADDRESS_7
    mov word [esp + 0x10], ax
    cwde
    cmp eax, -1
    je near loc_224c
    xor ecx, ecx
    mov dword [esp + 0x1c], ecx
    jmp near loc_121c
loc_1186:
    push 5
    movsx ebx, word [esp + 0x24]
    push ebx
    imul ebx, ebx, 0x2c
    movsx edx, word [ebx + LINK_ADDRESS_66]
    call LINK_ADDRESS_13
    and eax, 0xfff
    sar edx, 2
    neg eax
    sub eax, edx
    push eax
    call LINK_ADDRESS_13
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call LINK_ADDRESS_13
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call LINK_ADDRESS_13
    xor ah, ah
    and al, 3
    add eax, 0x968
    cwde
    push eax
    call LINK_ADDRESS_13
    mov edx, eax
    mov ecx, 0x3000
    sar edx, 0x1f
    idiv ecx
    mov ebp, dword [ebx + LINK_ADDRESS_65]
    mov ecx, dword [ebx + LINK_ADDRESS_33]
    movsx eax, word [ebx + LINK_ADDRESS_67]
    sub ecx, edx
    mov edx, dword [ebx + SPRITE]
    mov ebx, ebp
    call LINK_ADDRESS_19
    cwde
    imul eax, eax, 0x2c
    mov byte [eax + LINK_ADDRESS_68], 2
    inc dword [esp + 0x1c]
loc_121c:
    cmp word [esp + 0x1c], 0x10
    jl near loc_1186
    movsx ebp, word [esp + 0x20]
    mov edx, 0x762
    mov eax, ebp
    call LINK_ADDRESS_46
    mov eax, 0xe
    mov edx, ebp
    call LINK_ADDRESS_36
    mov eax, 0x14
    mov edx, ebp
    call LINK_ADDRESS_36
    cmp word [esi + 0x28], 0
    jle near loc_138a
    mov ax, word [LINK_ADDRESS_21]
loc_1262:
    mov word [esp + 0x10], ax
    mov ecx, dword [esp + 0x10]
    test cx, cx
    jl short loc_12c2
    movsx eax, cx
    imul eax, eax, 0x2c
    mov dx, word [esi + 0x28]
    cmp dx, word [eax + LINK_ADDRESS_8]
    jne short loc_12b3
    mov cx, word [eax + LINK_ADDRESS_10]
    cmp cx, 0x437
    je short loc_1298
    cmp cx, 0x4df
    jne short loc_12b3
loc_1298:
    movsx eax, word [esp + 0x10]
    imul eax, eax, 0x2c
    movsx edx, byte [eax + LINK_ADDRESS_47]
    cmp edx, -0x20
    je short loc_12b3
    mov byte [eax + LINK_ADDRESS_47], 0xe0
loc_12b3:
    movsx eax, word [esp + 0x10]
    mov ax, word [nosplit eax*2 + NEXTSPRITESTAT]
    jmp short loc_1262
loc_12c2:
    movsx ebp, word [esp + 0x20]
    movsx eax, word [esi + 0x2a]
    mov edx, 0x762
    mov dword [esp], eax
    mov eax, ebp
    call LINK_ADDRESS_46
    mov ecx, dword [esp]
    mov ebx, ecx
    mov eax, ecx
    sar ebx, 2
    push ecx
    sub eax, ebx
    sar ecx, 1
    push eax
    mov eax, dword [esp + 8]
    sub eax, ecx
    mov edx, dword [LINK_ADDRESS_69]
    mov ecx, eax
    mov eax, ebp
    call LINK_ADDRESS_53
    mov eax, 0xe
    mov edx, ebp
    call LINK_ADDRESS_36
loc_130b:
    mov byte [LINK_ADDRESS_70], 0x10
    mov ax, word [LINK_ADDRESS_71]
loc_1318:
    mov word [esp + 0x10], ax
    mov ecx, dword [esp + 0x10]
    test cx, cx
    jl near loc_15be
    movsx ebx, cx
    imul edx, ebx, 0x2c
    mov ax, word [esi + 0x28]
    cmp ax, word [edx + LINK_ADDRESS_8]
    jne near loc_15ac
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov bx, word [edx + LINK_ADDRESS_72]
    cmp bx, 0xd
    jne near loc_1569
    cmp dword [eax + LINK_ADDRESS_51], 0
    jne near loc_15ac
    mov dword [eax + LINK_ADDRESS_51], 1
    movsx eax, word [esp + 0x10]
    mov ax, word [nosplit eax*2 + NEXTSPRITESTAT]
    jmp short loc_1318
loc_138a:
    push 0x19
    mov ecx, 0xf
    mov ebx, 0xa
    push 0x14
    mov edx, dword [LINK_ADDRESS_73]
    mov eax, ebp
    call LINK_ADDRESS_53
    mov eax, ebp
    call LINK_ADDRESS_20
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_13b5:
    cmp cx, 0x437
    je short loc_13d5
    cmp cx, 0x4df
    je short loc_13d5
    cmp cx, 0x4e0
    je short loc_13d5
    cmp cx, 0x4e1
    jne near loc_16e8
loc_13d5:
    movsx eax, byte [esi + 0x10]
    cmp eax, -0x20
    je near loc_1492
    cmp eax, -0x21
    je near loc_1492
    cmp byte [esi + 0x14], 0
    je short loc_1405
    movsx eax, word [esp + 0x20]
    call LINK_ADDRESS_7
    test ax, ax
    setge al
    xor ah, ah
    jmp short loc_1407
loc_1405:
    xor eax, eax
loc_1407:
    mov word [esp + 0x10], ax
    cmp word [esp + 0x10], 0
    jne short loc_1421
    movsx eax, byte [esi + 0x10]
    cmp eax, -0x1f
    jne near loc_224c
loc_1421:
    cmp word [esp + 0x10], 0
    je short loc_142f
    mov word [esi + 0x26], 0
loc_142f:
    mov dword [edi + 0xc], 1
    mov ax, word [LINK_ADDRESS_21]
loc_143c:
    mov word [esp + 0x10], ax
    mov eax, dword [esp + 0x10]
    test ax, ax
    jl near loc_224c
    cwde
    imul eax, eax, 0x2c
    mov dx, word [esi + 0x28]
    cmp dx, word [eax + LINK_ADDRESS_8]
    jne short loc_1483
    mov cx, word [eax + LINK_ADDRESS_10]
    cmp cx, 0x4df
    je short loc_1474
    cmp cx, 0x437
    jne short loc_1483
loc_1474:
    movsx eax, word [esp + 0x10]
    imul eax, eax, 0x2c
    mov byte [eax + LINK_ADDRESS_47], 0xe0
loc_1483:
    movsx eax, word [esp + 0x10]
    mov ax, word [nosplit eax*2 + NEXTSPRITESTAT]
    jmp short loc_143c
loc_1492:
    movsx eax, byte [esi + 0x10]
    cmp eax, -0x20
    jne short loc_14d2
    mov bx, word [esi + 0x26]
    test bx, bx
    jle short loc_14c5
    mov ecx, ebx
    sub ecx, 3
    mov word [esi + 0x26], cx
    test cx, cx
    jg near loc_224c
    mov word [esi + 0x26], 0xff9d
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_14c5:
    mov byte [esi + 0x10], 0xdf
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_14d2:
    cmp byte [esi + 0x14], 0
    jbe near loc_130b
    movsx edx, word [esp + 0x20]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ecx, dword [eax + LINK_ADDRESS_51]
    inc ecx
    mov dword [eax + LINK_ADDRESS_51], ecx
    cmp ecx, 3
    jne near loc_224c
    mov bx, word [esi + 0xe]
    cmp bx, 0x437
    jne short loc_1521
    xor ebx, ebx
    mov dword [eax + LINK_ADDRESS_51], ebx
    jmp near loc_130b
loc_1521:
    cmp bx, 0x4e1
    je near loc_130b
    xor edx, edx
    mov dword [eax + LINK_ADDRESS_51], edx
    mov di, word [esi + 0xe]
    cmp di, 0x4e0
    jne short loc_154f
    mov edx, edi
    inc edx
    mov word [esi + 0xe], dx
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_154f:
    cmp di, 0x4df
    jne near loc_224c
    mov word [esi + 0xe], 0x4e0
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1569:
    cmp bx, 8
    jne short loc_158b
    mov dword [eax + LINK_ADDRESS_61], 1
    movsx eax, word [esp + 0x10]
    mov ax, word [nosplit eax*2 + NEXTSPRITESTAT]
    jmp near loc_1318
loc_158b:
    cmp bx, 0x12
    jne short loc_159c
    cmp dword [eax + LINK_ADDRESS_5], 0
    jne short loc_15ac
    jmp short loc_15a2
loc_159c:
    cmp bx, 0x15
    jne short loc_15ac
loc_15a2:
    mov dword [eax + LINK_ADDRESS_5], 1
loc_15ac:
    movsx eax, word [esp + 0x10]
    mov ax, word [nosplit eax*2 + NEXTSPRITESTAT]
    jmp near loc_1318
loc_15be:
    sub dword [esi + 8], 0x2000
    cmp dword [edi + 0xc], 1
    jne short loc_15d1
    cmp byte [esi + 0x14], 0
    jne short loc_15da
loc_15d1:
    movsx eax, word [esi + 0x26]
    cmp eax, -0x63
    jne short loc_1623
loc_15da:
    movsx edi, word [esp + 0x20]
    movsx eax, word [esi + 0x2a]
    mov edx, 0x762
    mov dword [esp], eax
    mov eax, edi
    call LINK_ADDRESS_46
    mov edx, dword [esp]
    push edx
    mov ebx, edx
    mov eax, edx
    sar ebx, 2
    mov ecx, edx
    sub eax, ebx
    sar ecx, 1
    push eax
    mov eax, edx
    sub eax, ecx
    mov edx, dword [LINK_ADDRESS_73]
    mov ecx, eax
    mov eax, edi
    call LINK_ADDRESS_53
    mov eax, 0xe
    mov edx, edi
    call LINK_ADDRESS_36
loc_1623:
    cmp byte [esi + 0x14], 0
    je near loc_16d5
    xor ebx, ebx
    mov dword [esp], ebx
    jmp near loc_16cb
loc_1637:
    push 5
    movsx eax, word [esp + 0x24]
    push eax
    mov edx, 0xfffffe00
    call LINK_ADDRESS_13
    and eax, 0x7ff
    sub edx, eax
    push edx
    call LINK_ADDRESS_13
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call LINK_ADDRESS_13
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call LINK_ADDRESS_13
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [esi + 8]
    push eax
    sub ecx, 0x800
    call LINK_ADDRESS_13
    and eax, 0x1fff
    sub ecx, eax
    call LINK_ADDRESS_13
    and eax, 0xff
    mov ebx, dword [esi + 4]
    add ebx, eax
    call LINK_ADDRESS_13
    and eax, 0xff
    mov edx, dword [esi]
    add edx, eax
    sub ebx, 0x80
    sub edx, 0x80
    movsx eax, word [esi + 0x18]
    call LINK_ADDRESS_19
    inc dword [esp]
loc_16cb:
    cmp dword [esp], 8
    jl near loc_1637
loc_16d5:
    movsx eax, word [esp + 0x20]
    call LINK_ADDRESS_20
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_16e8:
    cmp cx, 8
    jne near loc_182e
    mov di, word [esi + 0x22]
    cmp di, 1
    jne near loc_224c
    mov ax, word [esi + 0x28]
    sub eax, edi
    mov word [esi + 0x28], ax
    test ax, ax
    jg near loc_224c
    movsx edx, word [esp + 0x20]
    movsx eax, bx
    call LINK_ADDRESS_74
    movsx eax, bx
    mov ax, word [nosplit eax*2 + HEADSPRITESECT]
    mov ebx, 1
loc_1730:
    mov word [esp + 0x10], ax
    mov ecx, dword [esp + 0x10]
    test cx, cx
    jl short loc_16d5
    movsx edx, cx
    imul eax, edx, 0x2c
    mov si, word [eax + LINK_ADDRESS_29]
    cmp si, 3
    jne near loc_17f2
    mov ax, word [eax + LINK_ADDRESS_72]
    db 0x66, 0x3d, 0x15, 0x00    ; cmp ax, 0x15
    jb short loc_177f
    jbe short loc_1795
    db 0x66, 0x3d, 0x1f, 0x00    ; cmp ax, 0x1f
    jb near loc_181c
    db 0x66, 0x3d, 0x20, 0x00    ; cmp ax, 0x20
    jbe short loc_1795
    db 0x66, 0x3d, 0x24, 0x00    ; cmp ax, 0x24
    je short loc_1795
    jmp near loc_181c
loc_177f:
    db 0x66, 0x3d, 0x02, 0x00    ; cmp ax, 2
    jb near loc_181c
    jbe short loc_1795
    cmp ax, si
    je short loc_17c4
    jmp near loc_181c
loc_1795:
    movsx edx, word [esp + 0x10]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + LINK_ADDRESS_5], ebx
    movsx eax, word [esp + 0x10]
    mov ax, word [nosplit eax*2 + NEXTSPRITESECT]
    jmp near loc_1730
loc_17c4:
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + LINK_ADDRESS_61], 1
    movsx eax, word [esp + 0x10]
    mov ax, word [nosplit eax*2 + NEXTSPRITESECT]
    jmp near loc_1730
loc_17f2:
    cmp si, 6
    jne short loc_181c
    mov ax, word [eax + LINK_ADDRESS_10]
    cmp ax, 0x437
    jb short loc_181c
    jbe short loc_180d
    cmp ax, 0x4df
    jne short loc_181c
loc_180d:
    movsx eax, word [esp + 0x10]
    imul eax, eax, 0x2c
    mov byte [eax + LINK_ADDRESS_47], 0xe1
loc_181c:
    movsx eax, word [esp + 0x10]
    mov ax, word [nosplit eax*2 + NEXTSPRITESECT]
    jmp near loc_1730
loc_182e:
    mov eax, ecx
    cmp cx, 0x426
    jb near loc_1911
    jbe near loc_222f
    cmp cx, 0x4e7
    jb short loc_18b5
    jbe near loc_222f
    cmp cx, 0x91d
    jb short loc_1890
    jbe near loc_222f
    cmp cx, 0x11ad
    jb near loc_224c
    cmp cx, 0x11b0
    jbe near loc_1ae4
    cmp cx, 0x11e4
    jb near loc_224c
    cmp cx, 0x11e6
    jbe near loc_213c
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1890:
    cmp cx, 0x4f8
    jb near loc_224c
    jbe near loc_1a6b
    cmp cx, 0x56e
    je near loc_222f
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_18b5:
    cmp cx, 0x4d6
    jb short loc_18e7
    jbe near loc_222f
    cmp cx, 0x4d8
    jb near loc_224c
    jbe near loc_222f
    cmp cx, 0x4e2
    je near loc_222f
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_18e7:
    cmp cx, 0x4cb
    jb near loc_224c
    cmp cx, 0x4cd
    jbe near loc_222f
    cmp cx, 0x4d0
    je near loc_213c
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1911:
    cmp cx, 0x27a
    jb short loc_197a
    cmp cx, 0x27d
    jbe near loc_1bc0
    cmp cx, 0x388
    jb short loc_1955
    jbe near loc_222f
    cmp cx, 0x399
    jb near loc_224c
    jbe near loc_222f
    cmp cx, 0x402
    je near loc_222f
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1955:
    cmp cx, 0x294
    jb near loc_224c
    jbe near loc_1d33
    cmp cx, 0x296
    je near loc_222f
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_197a:
    cmp cx, 0xa0
    jb short loc_19a4
    jbe near loc_1e12
    cmp cx, 0x1f3
    jb near loc_224c
    jbe short loc_19b7
    cmp cx, 0x1f6
    je short loc_19b7
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_19a4:
    cmp cx, 3
    je near loc_1e69
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_19b7:
    cmp byte [esi + 0x14], 0
    jne short loc_19d0
    movsx eax, word [esp + 0x20]
    call LINK_ADDRESS_20
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_19d0:
    mov edx, esp
    mov eax, esi
    call LINK_ADDRESS_37
    mov ebx, dword [esp]
    mov dword [esp + 0x14], eax
    cmp ebx, 0x800
    jge short loc_1a11
    movsx eax, word [esp + 0x20]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_75], 1
    jne near loc_224c
    mov eax, dword [esp + 0x20]
    mov word [LINK_ADDRESS_76], ax
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1a11:
    movsx eax, word [LINK_ADDRESS_76]
    cmp eax, -1
    je near loc_224c
    movsx edx, word [esp + 0x20]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp dword [eax + LINK_ADDRESS_5], 1
    jne near loc_224c
    mov ebx, 0xffffffff
    xor edi, edi
    mov word [LINK_ADDRESS_76], bx
    mov dword [eax + LINK_ADDRESS_5], edi
    movsx eax, word [esi + 0xe]
    call LOADTILE
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1a6b:
    cmp word [esi + 0x20], 0
    jne short loc_1a78
    mov word [esi + 0x20], 1
loc_1a78:
    movsx ebx, word [esp + 0x20]
    mov edx, 0x10001
    mov eax, ebx
    call LINK_ADDRESS_14
    test ax, ax
    je short loc_1ad4
    mov eax, ebx
    call LINK_ADDRESS_48
    call LINK_ADDRESS_13
    test al, 1
    je short loc_1aa4
    sub word [esi + 0x24], 0x100
loc_1aa4:
    mov ax, word [esi + 0x20]
    cwde
    test eax, eax
    jns short loc_1aaf
    neg eax
loc_1aaf:
    cmp eax, 0x30
    jge near loc_224c
    call LINK_ADDRESS_13
    xor ah, ah
    mov di, word [esi + 0x20]
    and al, 3
    add edi, eax
    mov word [esi + 0x20], di
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1ad4:
    mov eax, ebx
    call LINK_ADDRESS_20
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1ae4:
    mov edx, esp
    mov eax, esi
    call LINK_ADDRESS_37
    mov edx, dword [esp]
    mov dword [esp + 0x14], eax
    cmp edx, 0x5000
    jg near loc_224c
loc_1b00:
    mov eax, dword [edi + 8]
    test eax, eax
    je short loc_1b16
    lea edx, [eax - 1]
    mov dword [edi + 8], edx
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1b16:
    xor edx, edx
    mov al, byte [esi + 0x15]
    mov dl, byte [esi + 0x14]
    or eax, edx
    jne short loc_1b2d
    mov al, byte [edi]
    mov byte [esi + 0x14], al
    mov al, byte [edi + 4]
    mov byte [esi + 0x15], al
loc_1b2d:
    call LINK_ADDRESS_13
    test al, 8
    jne short loc_1b5f
    xor eax, eax
    mov al, byte [esi + 0x14]
    mov dword [edi], eax
    xor eax, eax
    mov al, byte [esi + 0x15]
    mov dword [edi + 4], eax
    mov ax, word [LINK_ADDRESS_78]
    xor ah, ah
    and al, 4
    cwde
    mov dword [edi + 8], eax
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
    jmp short loc_1b00
loc_1b5f:
    mov di, word [esi + 0xe]
    inc edi
    mov cl, byte [esp + 8]
    mov word [esi + 0xe], di
    test cl, 1
    je short loc_1b75
    xor byte [esi + 0xc], 2
loc_1b75:
    call LINK_ADDRESS_13
    test al, 1
    je short loc_1ba5
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_79], 0x35b
    jne short loc_1ba5
    movsx edx, word [esp + 0x20]
    mov eax, 0x15
    call LINK_ADDRESS_36
loc_1ba5:
    cmp word [esi + 0xe], 0x11b1
    jne near loc_224c
    mov word [esi + 0xe], 0x11ad
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1bc0:
    mov edx, esp
    mov eax, esi
    call LINK_ADDRESS_37
    mov dword [esp + 0x14], eax
    cmp dword [esp], 0x5000
    jg near loc_224c
    cmp dword [edi + 0xc], 0
    jne short loc_1bf7
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    movsx eax, byte [eax*8 + LINK_ADDRESS_80]
    mov dword [edi + 0xc], eax
loc_1bf7:
    mov ecx, dword [edi + 8]
    test ecx, ecx
    je short loc_1c29
    movsx edx, bx
    lea eax, [edx*4]
    lea esi, [ecx - 1]
    add eax, edx
    mov ch, 0x14
    mov dword [edi + 8], esi
    mov byte [eax*8 + LINK_ADDRESS_80], ch
    mov byte [eax*8 + LINK_ADDRESS_81], ch
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1c29:
    xor edx, edx
    xor eax, eax
    mov dl, byte [esi + 0x14]
    mov al, byte [esi + 0x15]
    or eax, edx
    jne short loc_1c44
    mov al, byte [edi]
    mov byte [esi + 0x14], al
    mov al, byte [edi + 4]
    mov byte [esi + 0x15], al
    jmp short loc_1c76
loc_1c44:
    call LINK_ADDRESS_13
    test al, 8
    jne short loc_1c76
    xor eax, eax
    mov al, byte [esi + 0x14]
    mov dword [edi], eax
    xor eax, eax
    mov al, byte [esi + 0x15]
    mov dword [edi + 4], eax
    mov ax, word [LINK_ADDRESS_78]
    xor ah, ah
    and al, 4
    cwde
    mov dword [edi + 8], eax
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
    jmp short loc_1bf7
loc_1c76:
    inc word [esi + 0xe]
    mov ax, word [LINK_ADDRESS_78]
    xor ah, ah
    and al, 7
    cwde
    mov dword [esp + 8], eax
    mov al, byte [esp + 8]
    add al, 8
    mov byte [esi + 0x14], al
    test byte [esp + 8], 1
    je short loc_1c9d
    xor byte [esi + 0xc], 2
loc_1c9d:
    cmp word [esi + 0xe], 0x27b
    jne short loc_1cd5
    call LINK_ADDRESS_13
    test al, 7
    jne short loc_1cd5
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_79], 0x35b
    jne short loc_1cd5
    movsx edx, word [esp + 0x20]
    mov eax, 0x15
    call LINK_ADDRESS_36
loc_1cd5:
    cmp word [esi + 0xe], 0x27e
    jne short loc_1ce3
    mov word [esi + 0xe], 0x27a
loc_1ce3:
    test byte [esi + 0xe], 1
    je short loc_1d0e
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    xor bh, bh
    mov byte [eax*8 + LINK_ADDRESS_80], bh
    mov byte [eax*8 + LINK_ADDRESS_81], bh
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1d0e:
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    mov dh, 0x14
    mov byte [eax*8 + LINK_ADDRESS_80], dh
    mov byte [eax*8 + LINK_ADDRESS_81], dh
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1d33:
    mov ebx, dword [edi + 4]
    test ebx, ebx
    je short loc_1d55
    lea ecx, [ebx - 1]
    mov dword [edi + 4], ecx
    test ecx, ecx
    jne near loc_224c
    and byte [esi + 0xd], 0x7f
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1d55:
    movsx eax, word [esp + 0x20]
    mov edx, 0x10001
    call LINK_ADDRESS_48
    movsx eax, word [esp + 0x20]
    call LINK_ADDRESS_14
    mov dx, word [esi + 0x20]
    test dx, dx
    jle short loc_1d80
    mov ebx, edx
    sub ebx, 2
    mov word [esi + 0x20], bx
loc_1d80:
    cmp word [esi + 0x24], 0
    jne near loc_224c
    mov ah, byte [esi + 0xd]
    or ah, 0x80
    mov dl, byte [esi + 0x11]
    mov byte [esi + 0xd], ah
    cmp dl, 2
    je short loc_1db2
    cmp word [esi + 0x28], 0
    jne short loc_1db2
    movsx edx, word [esp + 0x20]
    mov eax, 0x5c
    call LINK_ADDRESS_36
loc_1db2:
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_10], 0x294
    je short loc_1dd7
    movsx eax, word [esp + 0x20]
    call LINK_ADDRESS_20
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1dd7:
    mov eax, dword [edi]
    movsx edx, word [esp + 0x20]
    mov ebx, eax
    mov dword [esi + 8], eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + LINK_ADDRESS_25], ebx
    call LINK_ADDRESS_13
    and eax, 0x1f
    add eax, 0x30
    mov dword [edi + 4], eax
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1e12:
    movsx edx, bx
    lea ecx, [edx*4]
    add ecx, edx
    movsx edx, bx
    lea eax, [edx*4]
    add edx, eax
    lea ecx, [ecx*8]
    lea edx, [edx*8]
    mov eax, dword [ecx + LINK_ADDRESS_49]
    sub eax, dword [edx + LINK_ADDRESS_18]
    movsx edx, bx
    test eax, eax
    jns short loc_1e4d
    neg eax
loc_1e4d:
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + LINK_ADDRESS_18]
    mov dword [esi + 8], eax
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1e69:
    cmp dword [edi + 4], 1
    jne near loc_2014
    cmp word [esi + 0x28], 0
    jl near loc_2014
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + LINK_ADDRESS_18]
    mov dword [esp], eax
    cmp dword [edi + 0xc], 1
    jne near loc_1f55
    mov eax, dword [esp]
    cmp eax, dword [edi + 8]
    jl short loc_1ed2
    movsx edx, bx
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov eax, dword [esp]
    mov dword [edx + LINK_ADDRESS_18], eax
    mov dword [edi + 4], 0
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1ed2:
    movsx edx, bx
    lea ecx, [edx*4]
    add ecx, edx
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    lea ecx, [ecx*8]
    movsx eax, word [eax*8 + LINK_ADDRESS_82]
    mov edx, dword [ecx + LINK_ADDRESS_18]
    add edx, eax
    movsx eax, bx
    mov dword [ecx + LINK_ADDRESS_18], edx
    call LINK_ADDRESS_39
    mov dword [esp + 0x14], eax
    test ax, ax
    jl near loc_224c
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx ebx, bx
    lea edx, [eax + eax]
    lea eax, [ebx*4]
    add eax, ebx
    movsx eax, word [eax*8 + LINK_ADDRESS_82]
    add dword [edx + LINK_ADDRESS_83], eax
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1f55:
    mov eax, dword [esp]
    cmp eax, dword [esi + 8]
    jg short loc_1f89
    movsx edx, bx
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov eax, dword [esi + 8]
    mov dword [edx + LINK_ADDRESS_18], eax
    mov dword [edi + 4], 0
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_1f89:
    movsx edx, bx
    lea eax, [edx*4]
    movsx ecx, bx
    add edx, eax
    lea eax, [ecx*4]
    add eax, ecx
    lea edx, [edx*8]
    movsx eax, word [eax*8 + LINK_ADDRESS_82]
    mov ecx, dword [edx + LINK_ADDRESS_18]
    sub ecx, eax
    movsx eax, bx
    mov dword [edx + LINK_ADDRESS_18], ecx
    call LINK_ADDRESS_39
    mov dword [esp + 0x14], eax
    test ax, ax
    jl near loc_224c
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx ebx, bx
    lea edx, [eax + eax]
    lea eax, [ebx*4]
    add eax, ebx
    mov esi, dword [edx + LINK_ADDRESS_83]
    movsx eax, word [eax*8 + LINK_ADDRESS_82]
    sub esi, eax
    mov dword [edx + LINK_ADDRESS_83], esi
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_2014:
    cmp dword [edi + 0x14], 1
    je near loc_224c
    movsx eax, bx
    call LINK_ADDRESS_39
    mov dword [esp + 0x14], eax
    test ax, ax
    jl near loc_20bb
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    cmp byte [nosplit eax*2 + LINK_ADDRESS_40], 0
    jne short loc_2058
    cmp word [esi + 0x1c], 0x200
    jne short loc_20bb
loc_2058:
    cmp dword [edi], 0
    jne short loc_20c1
    movsx eax, word [esi + 0x26]
    call LINK_ADDRESS_84
    test ax, ax
    jne short loc_20c1
    mov dword [edi], 1
    mov ecx, dword [edi + 0xc]
    mov dword [edi + 4], 1
    test ecx, ecx
    sete al
    and eax, 0xff
    mov dword [edi + 0xc], eax
    movsx eax, word [esi + 0x26]
    movsx edx, word [esp + 0x14]
    call LINK_ADDRESS_85
    movsx eax, word [esi + 0x26]
    call LINK_ADDRESS_86
    mov bx, word [esi + 0x28]
    test bx, bx
    jle short loc_20c1
    mov ecx, ebx
    dec cx
    mov word [esi + 0x28], cx
    jne short loc_20c1
    mov dword [edi + 0x14], 1
    jmp short loc_20c1
loc_20bb:
    mov dword [edi], 0
loc_20c1:
    cmp dword [edi + 4], 1
    jne near loc_224c
    mov ax, word [LINK_ADDRESS_21]
    mov ebp, 1
loc_20d6:
    mov word [esp + 0x10], ax
    mov edx, dword [esp + 0x10]
    test dx, dx
    jl near loc_224c
    cmp dx, word [esp + 0x20]
    je short loc_212d
    movsx edx, dx
    imul eax, edx, 0x2c
    cmp word [eax + LINK_ADDRESS_10], 3
    jne short loc_212d
    mov ax, word [eax + LINK_ADDRESS_72]
    cmp ax, word [esi + 0x26]
    jne short loc_212d
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + LINK_ADDRESS_6], ebp
    mov edx, dword [edi + 0xc]
    mov dword [eax + LINK_ADDRESS_60], edx
loc_212d:
    movsx eax, word [esp + 0x10]
    mov ax, word [nosplit eax*2 + NEXTSPRITESTAT]
    jmp short loc_20d6
loc_213c:
    movsx edx, word [esp + 0x20]
    mov eax, edx
    call LINK_ADDRESS_48
    mov eax, edx
    call LINK_ADDRESS_7
    test ax, ax
    jl near loc_224c
    xor eax, eax
    mov word [esp + 0x10], ax
    jmp near loc_21fa
loc_2164:
    push 5
    movsx eax, word [esp + 0x24]
    push eax
    mov edx, 0xfffffe00
    call LINK_ADDRESS_13
    and eax, 0x7ff
    sub edx, eax
    push edx
    call LINK_ADDRESS_13
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call LINK_ADDRESS_13
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call LINK_ADDRESS_13
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [esi + 8]
    push eax
    sub ecx, 0x800
    call LINK_ADDRESS_13
    and eax, 0x1fff
    sub ecx, eax
    call LINK_ADDRESS_13
    and eax, 0xff
    mov ebx, dword [esi + 4]
    add ebx, eax
    call LINK_ADDRESS_13
    and eax, 0xff
    mov edx, dword [esi]
    add edx, eax
    sub ebx, 0x80
    sub edx, 0x80
    movsx eax, word [esi + 0x18]
    call LINK_ADDRESS_19
    inc word [esp + 0x10]
loc_21fa:
    cmp word [esp + 0x10], 0xa
    jl near loc_2164
    mov di, word [esi + 0x26]
    test di, di
    je short loc_221c
    movsx eax, word [esp + 0x20]
    movsx edx, di
    call LINK_ADDRESS_46
loc_221c:
    movsx eax, word [esp + 0x20]
    call LINK_ADDRESS_20
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_222f:
    mov edx, esp
    mov eax, esi
    call LINK_ADDRESS_37
    mov ebx, dword [esp]
    mov dword [esp + 0x14], eax
    movsx edx, ax
    movsx eax, word [esp + 0x20]
    call LINK_ADDRESS_87
loc_224c:
    mov eax, dword [esp + 0x18]
    jmp near loc_037f
loc_2255:
    add esp, 0x24
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    nop
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0xc
    movsx ebx, ax
    imul ebp, ebx, 0x2c
    add ebp, SPRITE
    movsx eax, word [ebp + 0x1c]
    add eax, 0x200
    and eax, 0x7ff
    mov dx, word [nosplit eax*2 + SINTABLE]
    mov ax, word [ebp + 0x20]
    movsx edx, dx
    cwde
    imul edx
    shrd eax, edx, 0xa
    mov dword [esp], eax
    mov ax, word [ebp + 0x1c]
    and ah, 7
    cwde
    mov ax, word [nosplit eax*2 + SINTABLE]
    mov cx, word [ebp + 0x20]
    movsx edx, ax
    movsx eax, cx
    imul edx
    shrd eax, edx, 0xa
    mov dword [esp + 8], eax
    movsx eax, word [ebp + 0x24]
    mov dword [esp + 4], eax
    mov ax, word [ebp + 0x18]
    cwde
    lea esi, [eax*4]
    add esi, eax
    lea esi, [esi*8]
    movsx ecx, word [esi + SECTOR]
    shl ecx, 5
    movsx edi, word [ecx + LINK_ADDRESS_89]
    shl edi, 5
    mov eax, dword [ecx + LINK_ADDRESS_90]
    mov edx, dword [edi + LINK_ADDRESS_90]
    sub edx, eax
    mov eax, edx
    mov edx, dword [edi + WALL]
    mov edi, dword [ecx + WALL]
    mov ecx, edx
    sub ecx, edi
    mov edx, eax
    mov eax, ecx
    lea ecx, [ebx*8]
    add ecx, ebx
    lea ecx, [ecx*8]
    sub ecx, ebx
    call GETANGLE
    mov edi, eax
    mov edx, dword [ecx + LINK_ADDRESS_92]
    add edx, dword [ecx + LINK_ADDRESS_50]
    mov ebx, dword [ebp + 8]
    sar edx, 1
    cmp edx, ebx
    jle short loc_234c
    movsx ecx, word [esi + LINK_ADDRESS_93]
    jmp short loc_2353
loc_234c:
    movsx ecx, word [esi + LINK_ADDRESS_94]
loc_2353:
    mov eax, edi
    and eax, 0x7ff
    mov ax, word [nosplit eax*2 + SINTABLE]
    add edi, 0x600
    movsx edx, ax
    mov eax, ecx
    and edi, 0x7ff
    imul edx
    shrd eax, edx, 0xe
    mov esi, eax
    mov ax, word [nosplit edi*2 + SINTABLE]
    movsx edx, ax
    mov eax, ecx
    imul edx
    shrd eax, edx, 0xe
    mov edx, dword [esp + 8]
    mov edi, eax
    imul edx, edi
    mov eax, dword [esp]
    imul eax, esi
    add eax, edx
    mov edx, dword [esp + 4]
    shl edx, 0xc
    lea ecx, [eax + edx]
    mov edx, esi
    imul edx, esi
    mov eax, edi
    imul eax, edi
    add edx, eax
    mov eax, ecx
    add edx, 0x1000000
    test eax, eax
    jns short loc_23c3
    neg eax
loc_23c3:
    sar eax, 0xe
    cmp eax, edx
    jge short loc_2417
    mov ebx, edx
    mov eax, ecx
    mov edx, eax
    sar edx, 0xf
    shl eax, 0x11
    idiv ebx
    mov ecx, eax
    mov edx, eax
    mov eax, esi
    imul edx
    shrd eax, edx, 0x10
    mov esi, dword [esp]
    mov edx, ecx
    sub esi, eax
    mov eax, edi
    imul edx
    shrd eax, edx, 0x10
    mov edi, dword [esp + 8]
    mov edx, ecx
    sub edi, eax
    mov eax, 0x1000
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [esp + 4]
    mov dword [esp], esi
    sub edx, eax
    mov dword [esp + 8], edi
    mov dword [esp + 4], edx
loc_2417:
    mov eax, dword [esp + 4]
    mov edi, dword [esp + 8]
    mov edx, dword [esp]
    mov esi, edi
    mov word [ebp + 0x24], ax
    mov eax, edx
    imul edx
    mov ebx, eax
    mov eax, esi
    mov esi, edx
    imul edi
    add eax, ebx
    adc edx, esi
    shrd eax, edx, 8
    call LINK_ADDRESS_95
    mov edx, edi
    mov word [ebp + 0x20], ax
    mov eax, dword [esp]
    call GETANGLE
    mov word [ebp + 0x1c], ax
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
