; Player overlay and display selection.
bits 32
org START_ADDRESS

    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 0x18
    mov ebx, eax
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov esi, LINK_ADDRESS_1
    add eax, eax
    add esi, eax
    cmp dword [esi + 0x22c], 0
    jle short loc_0041
    mov eax, esi
    call LINK_ADDRESS_2
loc_0041:
    movsx edx, bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    test byte [nosplit eax*2 + LINK_ADDRESS_3], 1
    je short loc_0078
    mov ebx, dword [LINK_ADDRESS_4]
    cmp ebx, 0x190
    jl short loc_0078
    cmp ebx, 0x195
    jle near loc_1027
loc_0078:
    mov ebx, dword [LINK_ADDRESS_5]
    cmp ebx, 4
    jl near loc_1027
    cmp dword [LINK_ADDRESS_6], 1
    jle near loc_014c
    cmp dword [LINK_ADDRESS_7], 1
    je near loc_014c
    cmp byte [LINK_ADDRESS_8], 0
    je short loc_00b1
    call LINK_ADDRESS_9
    jmp short loc_0101
loc_00b1:
    movsx eax, word [CONNECTHEAD]
    jmp short loc_00f7
loc_00ba:
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [ebp - 8]
    add eax, eax
    mov dx, word [edx + LINK_ADDRESS_11]
    cmp dx, word [eax + LINK_ADDRESS_12]
    je short loc_00f0
    call LINK_ADDRESS_9
    movsx eax, word [CONNECTHEAD]
    jmp short loc_0142
loc_00f0:
    movsx eax, word [eax + CONNECTPOINT2]
loc_00f7:
    mov dword [ebp - 8], eax
    mov edx, dword [ebp - 8]
    test edx, edx
    jge short loc_00ba
loc_0101:
    movsx eax, word [CONNECTHEAD]
    jmp short loc_0142
loc_010a:
    movsx eax, word [MYCONNECTINDEX]
    cmp eax, ecx
    je short loc_0137
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    lea edx, [eax + eax]
    mov dx, word [edx + LINK_ADDRESS_11]
    mov word [nosplit ecx*2 + LINK_ADDRESS_12], dx
loc_0137:
    mov eax, dword [ebp - 8]
    movsx eax, word [nosplit eax*2 + CONNECTPOINT2]
loc_0142:
    mov dword [ebp - 8], eax
    mov ecx, dword [ebp - 8]
    test ecx, ecx
    jge short loc_010a
loc_014c:
    cmp ebx, 4
    jne near loc_04cb
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x1a
    push 0x15
    push 0
    mov ebx, 0x10000
    mov edx, 0xac0000
    push 0x1e
    xor ecx, ecx
    mov eax, 0x50000
    call LINK_ADDRESS_17
    cmp byte [esi + 0x3c9], 0
    je short loc_01be
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x1a
    push 0x15
    push 0
    mov ebx, 0x10000
    mov edx, 0xaa0000
    push 0x21
    xor ecx, ecx
    mov eax, 0x450000
    call LINK_ADDRESS_17
loc_01be:
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    cmp byte [eax + LINK_ADDRESS_18], 1
    jne short loc_01f3
    cmp word [esi + 0x2a2], 2
    jge short loc_01f3
    push 0x1a
    mov ecx, 0xf0
    mov ebx, 1
    mov edx, 0xb7
    mov eax, 0x14
    jmp short loc_020b
loc_01f3:
    push 0x1a
    mov ecx, 0xf0
    mov edx, 0xb7
    mov eax, 0x14
    movsx ebx, word [esi + 0x2a2]
loc_020b:
    call LINK_ADDRESS_19
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x1a
    push 0x15
    push 0
    mov ebx, 0x10000
    mov edx, 0xac0000
    push 0x1f
    xor ecx, ecx
    mov eax, 0x250000
    call LINK_ADDRESS_17
    mov dx, word [esi + 0x312]
    cmp dx, LINK_ADDRESS_20
    jne short loc_0256
    mov dword [ebp - 8], LINK_ADDRESS_21
    jmp short loc_025c
loc_0256:
    movsx eax, dx
    mov dword [ebp - 8], eax
loc_025c:
    push 0x1a
    mov eax, dword [ebp - 8]
    mov ecx, 0xf0
    mov edx, 0xb7
    movsx ebx, word [esi + eax*2 + 0x2a6]
    mov eax, 0x35
    call LINK_ADDRESS_19
    xor bl, bl
    mov byte [ebp - 4], bl
    mov bh, byte [esi + 0x3c9]
    mov edi, 0x9e
    test bh, bh
    je near loc_1027
    mov al, bh
    dec al
    cmp al, 6
    ja short loc_02e9
    and eax, 0xff
    jmp dword cs:[eax*4 + LINK_ADDRESS_22]
    mov dword [ebp - 8], 0x99c
    jmp short loc_02f0
    mov dword [ebp - 8], 0x9a5
    jmp short loc_02f0
    mov dword [ebp - 8], 0x9a6
    jmp short loc_02f0
    mov dword [ebp - 8], 0x9a3
    jmp short loc_02f0
    mov dword [ebp - 8], 0x99d
    jmp short loc_02f0
    mov dword [ebp - 8], 0x9a4
    jmp short loc_02f0
    mov dword [ebp - 8], 0x99f
    jmp short loc_02f0
loc_02e9:
    mov dword [ebp - 8], 0xffffffff
loc_02f0:
    cmp dword [ebp - 8], 0
    jl short loc_0334
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    xor eax, eax
    push 0
    mov al, byte [ebp - 4]
    push 0
    add eax, 0x1a
    push eax
    mov edx, dword [ebp - 8]
    push 0
    mov ebx, 0x10000
    mov eax, 0xe7
    push 0
    xor ecx, ecx
    sub eax, edi
    push edx
    shl eax, 0x10
    mov edx, 0xb30000
    call LINK_ADDRESS_17
loc_0334:
    mov al, byte [ebp - 4]
    add al, 0x1a
    mov ecx, 6
    and eax, 0xff
    mov ebx, LINK_ADDRESS_23
    push eax
    mov eax, 0x106
    mov edx, 0xbe
    sub eax, edi
    call 0x105c0
    mov al, byte [esi + 0x3c9]
    mov ebx, 0x80000000
    dec al
    mov dword [ebp - 0x10], ebx
    cmp al, 6
    ja near loc_041d
    and eax, 0xff
    jmp dword cs:[eax*4 + LINK_ADDRESS_24]
    movsx eax, word [esi + 0x33a]
    jmp near loc_041a
    movsx eax, word [esi + 0x38a]
    add eax, 3
    sar eax, 2
    jmp near loc_041a
    movsx edx, word [esi + 0x31c]
    add edx, 0xf
    mov ebx, 0x18
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov dword [ebp - 8], eax
    movsx eax, word [esi + 0x38e]
    mov dword [ebp - 0x10], eax
    jmp short loc_041d
    movsx eax, word [esi + 0x388]
    add eax, 0xf
    sar eax, 4
    mov dword [ebp - 8], eax
    xor eax, eax
    mov al, byte [esi + 0x3cb]
    mov dword [ebp - 0x10], eax
    jmp short loc_041d
    movsx edx, word [esi + 0x354]
    mov ebx, 0xc
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov dword [ebp - 8], eax
    xor eax, eax
    mov al, byte [esi + 0x3d0]
    mov dword [ebp - 0x10], eax
    jmp short loc_041d
    movsx eax, word [esi + 0x386]
    add eax, 0x3f
    sar eax, 6
    jmp short loc_041a
    movsx eax, word [esi + 0x39c]
    sar eax, 1
loc_041a:
    mov dword [ebp - 8], eax
loc_041d:
    mov al, byte [ebp - 4]
    add al, 0xa
    mov edx, 0xc2
    and eax, 0xff
    xor ebx, ebx
    push eax
    mov eax, 0xfe
    xor ecx, ecx
    sub eax, edi
    mov bl, byte [ebp - 8]
    mov dword [ebp - 0x14], eax
    call LINK_ADDRESS_25
    mov al, byte [ebp - 4]
    mov ecx, dword [ebp - 0x10]
    add al, 0x1a
    test ecx, ecx
    jle short loc_046a
    mov ebx, LINK_ADDRESS_26
    and eax, 0xff
    mov edx, 0xb4
    push eax
    mov eax, 0x102
    xor ecx, ecx
    sub eax, edi
    jmp short loc_048a
loc_046a:
    cmp ecx, 0x80000000
    je short loc_048f
    mov ecx, 2
    and eax, 0xff
    mov ebx, LINK_ADDRESS_27
    push eax
    mov edx, 0xb4
    mov eax, dword [ebp - 0x14]
loc_048a:
    call 0x105c0
loc_048f:
    cmp byte [esi + 0x3c9], 6
    jb near loc_1027
    mov al, byte [ebp - 4]
    add al, 0x1a
    mov ecx, 2
    and eax, 0xff
    mov ebx, LINK_ADDRESS_28
    push eax
    mov eax, 0xf9
    mov edx, 0xb4
    sub eax, edi
    call 0x105c0
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_04cb:
    cmp byte [LINK_ADDRESS_8], 0
    je short loc_04e6
    xor bh, bh
    mov edx, 0xffffffff
    mov byte [LINK_ADDRESS_8], bh
    mov dword [ebp - 0xc], edx
    jmp short loc_04eb
loc_04e6:
    xor eax, eax
    mov dword [ebp - 0xc], eax
loc_04eb:
    movsx eax, word [MYCONNECTINDEX]
    add eax, eax
    mov di, word [esi + 0x2ca]
    cmp di, word [eax + LINK_ADDRESS_12]
    je short loc_0514
    mov cl, byte [ebp - 0xb]
    or cl, 0x80
    mov word [eax + LINK_ADDRESS_12], di
    mov byte [ebp - 0xb], cl
loc_0514:
    mov ax, word [LINK_ADDRESS_29]
    mov dx, word [esi + 0x336]
    cmp ax, dx
    je short loc_0536
    mov ch, byte [ebp - 0xb]
    or ch, 0x40
    mov word [LINK_ADDRESS_29], dx
    mov byte [ebp - 0xb], ch
loc_0536:
    mov ax, word [LINK_ADDRESS_30]
    mov bx, word [esi + 0x2a2]
    cmp ax, bx
    je short loc_0557
    mov al, byte [ebp - 0xc]
    or al, 1
    mov word [LINK_ADDRESS_30], bx
    mov byte [ebp - 0xc], al
loc_0557:
    mov ax, word [LINK_ADDRESS_31]
    mov cx, word [esi + 0x38c]
    cmp ax, cx
    je short loc_0579
    mov ah, byte [ebp - 0xc]
    or ah, 2
    mov word [LINK_ADDRESS_31], cx
    mov byte [ebp - 0xc], ah
loc_0579:
    mov ax, word [LINK_ADDRESS_32]
    mov di, word [esi + 0x312]
    cmp ax, di
    je short loc_059e
    mov ebx, dword [ebp - 0xc]
    or ebx, 0x107fc
    mov word [LINK_ADDRESS_32], di
    mov dword [ebp - 0xc], ebx
loc_059e:
    mov dword [ebp - 8], 1
    jmp near loc_0639
loc_05aa:
    lea eax, [ebx + ebx]
    lea edx, [esi + eax]
    mov bx, word [eax + LINK_ADDRESS_33]
    mov cx, word [edx + 0x2a6]
    cmp bx, cx
    je short loc_05f0
    mov word [eax + LINK_ADDRESS_33], cx
    cmp dword [ebp - 8], 9
    jge short loc_05e9
    mov cl, byte [ebp - 8]
    mov eax, 2
    shl eax, cl
    mov edx, dword [ebp - 0xc]
    add eax, 0x400
    or edx, eax
    mov dword [ebp - 0xc], edx
    jmp short loc_05f0
loc_05e9:
    or dword [ebp - 0xc], 0x10400
loc_05f0:
    mov eax, dword [ebp - 8]
    mov edx, dword [ebp - 8]
    add eax, esi
    mov dl, byte [edx + LINK_ADDRESS_34]
    mov cl, byte [eax + 0x3d3]
    cmp dl, cl
    je short loc_0636
    mov edx, dword [ebp - 8]
    mov byte [edx + LINK_ADDRESS_34], cl
    cmp edx, 9
    jge short loc_062f
    mov cl, byte [ebp - 8]
    mov eax, 2
    shl eax, cl
    mov edi, dword [ebp - 0xc]
    add eax, 0x400
    or edi, eax
    mov dword [ebp - 0xc], edi
    jmp short loc_0636
loc_062f:
    or dword [ebp - 0xc], 0x10400
loc_0636:
    inc dword [ebp - 8]
loc_0639:
    mov ebx, dword [ebp - 8]
    cmp ebx, 0xa
    jl near loc_05aa
    mov al, byte [LINK_ADDRESS_35]
    mov ch, byte [esi + 0x3c9]
    cmp al, ch
    je short loc_0662
    mov al, byte [ebp - 0xb]
    or al, 0x38
    mov byte [LINK_ADDRESS_35], ch
    mov byte [ebp - 0xb], al
loc_0662:
    mov ax, word [LINK_ADDRESS_36]
    mov bx, word [esi + 0x38e]
    cmp ax, bx
    je short loc_0684
    mov ah, byte [ebp - 0xb]
    or ah, 0x30
    mov word [LINK_ADDRESS_36], bx
    mov byte [ebp - 0xb], ah
loc_0684:
    mov al, byte [LINK_ADDRESS_37]
    mov dl, byte [esi + 0x3cb]
    cmp al, dl
    je short loc_069d
    mov byte [LINK_ADDRESS_37], dl
    or byte [ebp - 0xb], 0x30
loc_069d:
    mov al, byte [LINK_ADDRESS_38]
    mov bl, byte [esi + 0x3d0]
    cmp al, bl
    je short loc_06b6
    mov byte [LINK_ADDRESS_38], bl
    or byte [ebp - 0xb], 0x30
loc_06b6:
    mov ax, word [LINK_ADDRESS_39]
    mov cx, word [esi + 0x33a]
    cmp ax, cx
    je short loc_06d3
    mov word [LINK_ADDRESS_39], cx
    or byte [ebp - 0xb], 0x20
loc_06d3:
    mov ax, word [LINK_ADDRESS_40]
    mov di, word [esi + 0x38a]
    cmp ax, di
    je short loc_06f5
    mov ch, byte [ebp - 0xb]
    or ch, 0x20
    mov word [LINK_ADDRESS_40], di
    mov byte [ebp - 0xb], ch
loc_06f5:
    mov ax, word [LINK_ADDRESS_41]
    mov dx, word [esi + 0x31c]
    cmp ax, dx
    je short loc_0716
    mov al, byte [ebp - 0xb]
    or al, 0x20
    mov word [LINK_ADDRESS_41], dx
    mov byte [ebp - 0xb], al
loc_0716:
    mov ax, word [LINK_ADDRESS_42]
    mov bx, word [esi + 0x388]
    cmp ax, bx
    je short loc_0738
    mov ah, byte [ebp - 0xb]
    or ah, 0x20
    mov word [LINK_ADDRESS_42], bx
    mov byte [ebp - 0xb], ah
loc_0738:
    mov ax, word [LINK_ADDRESS_43]
    mov cx, word [esi + 0x354]
    cmp ax, cx
    je short loc_075a
    mov dl, byte [ebp - 0xb]
    or dl, 0x20
    mov word [LINK_ADDRESS_43], cx
    mov byte [ebp - 0xb], dl
loc_075a:
    mov ax, word [LINK_ADDRESS_44]
    mov di, word [esi + 0x386]
    cmp ax, di
    je short loc_077c
    mov dh, byte [ebp - 0xb]
    or dh, 0x20
    mov word [LINK_ADDRESS_44], di
    mov byte [ebp - 0xb], dh
loc_077c:
    mov ax, word [LINK_ADDRESS_45]
    mov dx, word [esi + 0x39c]
    cmp ax, dx
    je short loc_079e
    mov bl, byte [ebp - 0xb]
    or bl, 0x20
    mov word [LINK_ADDRESS_45], dx
    mov byte [ebp - 0xb], bl
loc_079e:
    mov ecx, dword [ebp - 0xc]
    test ecx, ecx
    je near loc_1027
    cmp ecx, -1
    jne near loc_0865
    mov ecx, 0xc8
    mov edx, dword [YDIM]
    mov eax, ecx
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    mov eax, ecx
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [YDIM]
    xor eax, eax
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    xor eax, eax
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call LINK_ADDRESS_17
    cmp dword [LINK_ADDRESS_6], 1
    jle short loc_0865
    cmp dword [LINK_ADDRESS_7], 1
    je short loc_0865
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x9a
    push 0
    push 0
    mov ebx, 0x10000
    mov edx, 0xad0000
    push 0x99a
    xor ecx, ecx
    mov eax, 0x1150000
    call LINK_ADDRESS_17
loc_0865:
    cmp dword [LINK_ADDRESS_6], 1
    jle near loc_093a
    cmp dword [LINK_ADDRESS_7], 1
    je near loc_093a
    test byte [ebp - 0xb], 0x80
    je near loc_0a7e
    cmp dword [ebp - 0xc], -1
    je short loc_0906
    mov ecx, 0xc8
    mov eax, 0xc1
    mov edx, dword [YDIM]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    mov eax, 0x12b
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [YDIM]
    mov eax, 0xb7
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    mov eax, 0x114
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call LINK_ADDRESS_17
loc_0906:
    movsx ebx, word [esi + 0x2ca]
    movsx eax, word [esi + 0x2cc]
    push 0x9a
    sub ebx, eax
    mov ecx, 0xf0
    test ebx, ebx
    jg short loc_0926
    xor ebx, ebx
loc_0926:
    mov edx, 0xb7
    mov eax, 0x11f
    call LINK_ADDRESS_19
    jmp near loc_0a7e
loc_093a:
    test byte [ebp - 0xb], 0x40
    je near loc_0a7e
    cmp dword [ebp - 0xc], -1
    je short loc_09c1
    mov ecx, 0xc8
    mov eax, 0xc2
    mov edx, dword [YDIM]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    mov eax, 0x12b
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [YDIM]
    mov eax, 0xb6
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    mov eax, 0x113
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call LINK_ADDRESS_17
loc_09c1:
    test byte [esi + 0x336], 4
    je short loc_0a00
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x9a
    push 0x17
    push 0
    mov ebx, 0x10000
    mov edx, 0xb60000
    push 0x9a7
    xor ecx, ecx
    mov eax, 0x1130000
    call LINK_ADDRESS_17
loc_0a00:
    test byte [esi + 0x336], 2
    je short loc_0a3f
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x9a
    push 0x15
    push 0
    mov ebx, 0x10000
    mov edx, 0xb60000
    push 0x9a7
    xor ecx, ecx
    mov eax, 0x1200000
    call LINK_ADDRESS_17
loc_0a3f:
    test byte [esi + 0x336], 1
    je short loc_0a7e
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x9a
    push 0
    push 0
    mov ebx, 0x10000
    mov edx, 0xbd0000
    push 0x9a7
    xor ecx, ecx
    mov eax, 0x1190000
    call LINK_ADDRESS_17
loc_0a7e:
    mov edx, dword [ebp - 0xc]
    test edx, 0x103fc
    je short loc_0a9c
    mov ebx, 0xb6
    mov ecx, edx
    mov eax, esi
    mov edx, 0x60
    call LINK_ADDRESS_46
loc_0a9c:
    test byte [ebp - 0xc], 1
    je near loc_0b7b
    cmp dword [ebp - 0xc], -1
    je short loc_0b23
    mov ecx, 0xc8
    mov eax, 0xc1
    mov edx, dword [YDIM]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    mov eax, 0x2b
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [YDIM]
    mov eax, 0xb7
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    mov eax, 0x14
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call LINK_ADDRESS_17
loc_0b23:
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    cmp byte [eax + LINK_ADDRESS_18], 1
    jne short loc_0b5b
    cmp word [esi + 0x2a2], 2
    jge short loc_0b5b
    push 0x9a
    mov ecx, 0xf0
    mov ebx, 1
    mov edx, 0xb7
    mov eax, 0x20
    jmp short loc_0b76
loc_0b5b:
    push 0x9a
    mov ecx, 0xf0
    mov edx, 0xb7
    mov eax, 0x20
    movsx ebx, word [esi + 0x2a2]
loc_0b76:
    call LINK_ADDRESS_19
loc_0b7b:
    test byte [ebp - 0xc], 2
    je near loc_0c22
    cmp dword [ebp - 0xc], -1
    je short loc_0c02
    mov ecx, 0xc8
    mov eax, 0xc1
    mov edx, dword [YDIM]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    mov eax, 0x4b
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [YDIM]
    mov eax, 0xb7
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    mov eax, 0x34
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call LINK_ADDRESS_17
loc_0c02:
    push 0x9a
    mov ecx, 0xf0
    mov edx, 0xb7
    mov eax, 0x40
    movsx ebx, word [esi + 0x38c]
    call LINK_ADDRESS_19
loc_0c22:
    test byte [ebp - 0xb], 4
    je near loc_0cee
    cmp dword [ebp - 0xc], -1
    je short loc_0ca9
    mov ecx, 0xc8
    mov eax, 0xc1
    mov edx, dword [YDIM]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    mov eax, 0xdb
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [YDIM]
    mov eax, 0xb7
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    mov eax, 0xc4
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call LINK_ADDRESS_17
loc_0ca9:
    mov cx, word [esi + 0x312]
    test cx, cx
    je short loc_0cee
    cmp cx, LINK_ADDRESS_20
    jne short loc_0cc4
    mov dword [ebp - 8], LINK_ADDRESS_21
    jmp short loc_0cca
loc_0cc4:
    movsx eax, cx
    mov dword [ebp - 8], eax
loc_0cca:
    push 0x9a
    mov ebx, dword [ebp - 8]
    mov ecx, 0xf0
    mov edx, 0xb7
    mov eax, 0xd0
    movsx ebx, word [esi + ebx*2 + 0x2a6]
    call LINK_ADDRESS_19
loc_0cee:
    mov cl, byte [ebp - 0xb]
    test cl, 0x38
    je near loc_1027
    cmp dword [ebp - 0xc], -1
    je near loc_0dd3
    test cl, 0x18
    je short loc_0d5c
    mov ecx, 0xc8
    mov eax, 0xc5
    mov edx, dword [YDIM]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    mov eax, 0x109
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [YDIM]
    mov eax, 0xb3
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    mov eax, 0xe7
    jmp short loc_0dad
loc_0d5c:
    mov ecx, 0xc8
    mov eax, 0xc3
    mov edx, dword [YDIM]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    mov eax, 0x105
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [YDIM]
    mov eax, 0xbe
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [XDIM]
    mov eax, 0xfa
loc_0dad:
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call LINK_ADDRESS_17
loc_0dd3:
    mov al, byte [esi + 0x3c9]
    test al, al
    je near loc_1027
    mov ah, 0x80
    mov dl, byte [ebp - 0xb]
    xor edi, edi
    mov byte [ebp - 4], ah
    test dl, 0x18
    je near loc_0ed3
    dec al
    cmp al, 6
    ja short loc_0e44
    and eax, 0xff
    jmp dword cs:[eax*4 + LINK_ADDRESS_47]
    mov dword [ebp - 8], 0x99c
    jmp short loc_0e44
    mov dword [ebp - 8], 0x9a5
    jmp short loc_0e44
    mov dword [ebp - 8], 0x9a6
    jmp short loc_0e44
    mov dword [ebp - 8], 0x9a3
    jmp short loc_0e44
    mov dword [ebp - 8], 0x99d
    jmp short loc_0e44
    mov dword [ebp - 8], 0x9a4
    jmp short loc_0e44
    mov dword [ebp - 8], 0x99f
loc_0e44:
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    xor eax, eax
    push 0
    mov al, byte [ebp - 4]
    push 0
    add eax, 0x1a
    push eax
    mov edx, dword [ebp - 8]
    push 0
    mov ebx, 0x10000
    mov eax, 0xe7
    push 0
    xor ecx, ecx
    sub eax, edi
    push edx
    shl eax, 0x10
    mov edx, 0xb30000
    call LINK_ADDRESS_17
    mov al, byte [ebp - 4]
    add al, 0x1a
    mov ecx, 6
    and eax, 0xff
    mov ebx, LINK_ADDRESS_23
    mov dword [ebp - 0x18], eax
    push eax
    mov eax, 0x106
    mov edx, 0xbe
    sub eax, edi
    call 0x105c0
    cmp byte [esi + 0x3c9], 6
    jb short loc_0ed3
    mov ecx, dword [ebp - 0x18]
    mov eax, 0xf9
    mov ebx, LINK_ADDRESS_28
    mov edx, 0xb4
    push ecx
    sub eax, edi
    mov ecx, 2
    call 0x105c0
loc_0ed3:
    test byte [ebp - 0xb], 0x18
    je near loc_0f6e
    mov al, byte [esi + 0x3c9]
    cmp al, 4
    jb short loc_0eef
    jbe short loc_0eff
    cmp al, 5
    je short loc_0f0c
    jmp short loc_0f19
loc_0eef:
    cmp al, 3
    jne short loc_0f19
    movsx eax, word [esi + 0x38e]
    mov dword [ebp - 0x10], eax
    jmp short loc_0f20
loc_0eff:
    xor eax, eax
    mov al, byte [esi + 0x3cb]
    mov dword [ebp - 0x10], eax
    jmp short loc_0f20
loc_0f0c:
    xor eax, eax
    mov al, byte [esi + 0x3d0]
    mov dword [ebp - 0x10], eax
    jmp short loc_0f20
loc_0f19:
    mov dword [ebp - 0x10], 0x80000000
loc_0f20:
    mov al, byte [ebp - 4]
    mov edx, dword [ebp - 0x10]
    add al, 0x1a
    test edx, edx
    jle short loc_0f45
    mov ebx, LINK_ADDRESS_26
    and eax, 0xff
    mov edx, 0xb4
    push eax
    mov eax, 0x102
    xor ecx, ecx
    jmp short loc_0f67
loc_0f45:
    cmp edx, 0x80000000
    je short loc_0f6e
    mov ecx, 2
    and eax, 0xff
    mov ebx, LINK_ADDRESS_27
    push eax
    mov eax, 0xfe
    mov edx, 0xb4
loc_0f67:
    sub eax, edi
    call 0x105c0
loc_0f6e:
    test byte [ebp - 0xb], 0x20
    je near loc_1027
    mov al, byte [esi + 0x3c9]
    dec al
    cmp al, 6
    ja near loc_1004
    and eax, 0xff
    jmp dword cs:[eax*4 + LINK_ADDRESS_48]
    movsx eax, word [esi + 0x33a]
    jmp short loc_1001
    movsx eax, word [esi + 0x38a]
    add eax, 3
    sar eax, 2
    jmp short loc_1001
    movsx edx, word [esi + 0x31c]
    add edx, 0xf
    mov ebx, 0x18
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    jmp short loc_1001
    movsx eax, word [esi + 0x388]
    add eax, 0xf
    sar eax, 4
    jmp short loc_1001
    movsx edx, word [esi + 0x354]
    mov ebx, 0xc
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    jmp short loc_1001
    movsx eax, word [esi + 0x386]
    add eax, 0x3f
    sar eax, 6
    jmp short loc_1001
    movsx eax, word [esi + 0x39c]
    sar eax, 1
loc_1001:
    mov dword [ebp - 8], eax
loc_1004:
    mov al, byte [ebp - 4]
    add al, 0xa
    mov edx, 0xc2
    and eax, 0xff
    xor ebx, ebx
    xor ecx, ecx
    push eax
    mov eax, 0xfe
    mov bl, byte [ebp - 8]
    sub eax, edi
    call LINK_ADDRESS_25
loc_1027:
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
