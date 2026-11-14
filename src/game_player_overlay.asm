; Render the player overlay using the current player state.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x38
    mov edi, eax
    mov dword [esp + 0x20], edx
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebp, LINK_ADDRESS_1
    add eax, eax
    add ebp, eax
    cmp byte [LINK_ADDRESS_2], 0
    jbe short loc_0049
    cmp dword [LINK_ADDRESS_3], 8
    jle short loc_0041
    call LINK_ADDRESS_4
loc_0041:
    xor dl, dl
    mov byte [LINK_ADDRESS_2], dl
loc_0049:
    cmp byte [LINK_ADDRESS_5], 2
    je near loc_0af6
    cmp byte [LINK_ADDRESS_6], 0
    jne near loc_0af6
    movsx eax, word [ebp + 0x29e]
    cmp eax, -1
    je near loc_0af6
    mov ebx, dword [esp + 0x20]
    test ebx, ebx
    jle short loc_007f
    mov eax, ebx
    jmp short loc_0081
loc_007f:
    xor eax, eax
loc_0081:
    cmp eax, 0x10000
    jge short loc_0098
    mov ecx, dword [esp + 0x20]
    test ecx, ecx
    jle short loc_0094
    mov eax, ecx
    jmp short loc_009d
loc_0094:
    xor eax, eax
    jmp short loc_009d
loc_0098:
    mov eax, 0x10000
loc_009d:
    mov dword [esp + 0x20], eax
    mov eax, dword [ebp + 0x268]
    mov dx, word [LINK_ADDRESS_7]
    mov dword [VISIBILITY], eax
    test dx, dx
    jne short loc_00d8
    movsx edx, di
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_9]
    cmp eax, -1
    jle short loc_00e0
loc_00d8:
    mov dword [esp + 0x20], 0x10000
loc_00e0:
    mov ax, word [ebp + 0x29e]
    mov dword [esp + 0x2c], eax
    test ax, ax
    jl near loc_0af6
    cmp ax, 0x400
    jge near loc_0af6
    mov eax, dword [esp + 0x20]
    call LINK_ADDRESS_10
    call LINK_ADDRESS_11
    mov si, word [LINK_ADDRESS_12]
    test si, si
    jl near loc_01e8
    movsx eax, si
    imul eax, eax, 0x2c
    mov esi, SPRITE
    add esi, eax
    mov cx, word [esi + 0x22]
    test cx, cx
    jge short loc_013a
    mov word [esi + 0x22], 0xff9c
    jmp short loc_0147
loc_013a:
    cmp cx, 0xc7
    jle short loc_0147
    mov word [esi + 0x22], 0x12c
loc_0147:
    movsx edx, word [LINK_ADDRESS_12]
    lea ebx, [edx*8]
    add ebx, edx
    lea ebx, [ebx*8]
    movsx eax, word [esi + 0x1c]
    sub ebx, edx
    add eax, 0x400
    movsx edx, word [ebx + LINK_ADDRESS_14]
    sub eax, edx
    and eax, 0x7ff
    mov edx, dword [esp + 0x20]
    sub eax, 0x400
    mov edi, dword [esp + 0x20]
    imul edx
    shrd eax, edx, 0x10
    mov dx, word [ebx + LINK_ADDRESS_14]
    push edi
    add edx, eax
    mov ebx, dword [esi + 8]
    mov dword [esp + 0x2c], edx
    movsx eax, word [esi + 0x22]
    movsx edi, dx
    push eax
    mov ecx, edi
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    call LINK_ADDRESS_15
    mov ecx, edi
    movsx eax, word [esi + 0x18]
    mov ebx, dword [esi + 8]
    push eax
    movsx eax, word [esi + 0x22]
    mov edx, dword [esi + 4]
    push eax
    sub ebx, 0x400
    mov eax, dword [esi]
    call LINK_ADDRESS_16
    mov ecx, dword [esp + 0x20]
    mov ebx, edi
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    call LINK_ADDRESS_17
    call LINK_ADDRESS_18
    jmp near loc_0aa5
loc_01e8:
    movsx eax, word [ebp + 0x340]
    imul eax, eax, 0x2c
    xor ebx, ebx
    mov bl, byte [eax + LINK_ADDRESS_19]
    mov eax, 1
    add ebx, 0x1c
    mov edx, eax
    sar edx, 0xa
    shl eax, 0x16
    idiv ebx
    cmp eax, dword [LINK_ADDRESS_20]
    je short loc_0224
    mov edx, dword [YXASPECT]
    mov dword [LINK_ADDRESS_20], eax
    call SETASPECT
loc_0224:
    cmp byte [LINK_ADDRESS_23], 0
    je short loc_026c
    mov ch, 0xc7
    mov esi, dword [LINK_ADDRESS_24]
    mov byte [LINK_ADDRESS_25], ch
    test esi, esi
    jne short loc_0253
    mov ebx, LINK_ADDRESS_25
    mov edx, 0x3e80
    mov eax, LINK_ADDRESS_24
    call ALLOCACHE
loc_0253:
    mov ebx, 0xa0
    mov edx, 0x64
    mov eax, 0x17ff
    call LINK_ADDRESS_27
    jmp near loc_03ae
loc_026c:
    cmp dword [LINK_ADDRESS_28], 0
    je short loc_027f
    cmp word [ebp + 0x380], 0
    jne short loc_028c
loc_027f:
    cmp dword [LINK_ADDRESS_29], 0
    jne near loc_03ae
loc_028c:
    cmp dword [LINK_ADDRESS_28], 0
    je short loc_02a2
    mov ax, word [ebp + 0x380]
    mov dword [esp + 0x34], eax
    jmp short loc_02a8
loc_02a2:
    xor edx, edx
    mov dword [esp + 0x34], edx
loc_02a8:
    mov cl, 0xff
    mov eax, dword [LINK_ADDRESS_30]
    mov byte [LINK_ADDRESS_31], cl
    test eax, eax
    jne short loc_02cd
    mov ebx, LINK_ADDRESS_31
    mov edx, 0x19000
    mov eax, LINK_ADDRESS_30
    call ALLOCACHE
loc_02cd:
    mov edx, 1
    sub edx, dword [LINK_ADDRESS_29]
    mov eax, 0x140
    mov cl, dl
    mov ebx, dword [esp + 0x34]
    sar eax, cl
    test bx, 0x3ff
    jne short loc_02fc
    mov edx, 0xc8
    mov ebx, eax
    mov eax, 0x17fe
    sar edx, cl
    jmp short loc_0305
loc_02fc:
    mov ebx, eax
    mov edx, eax
    mov eax, 0x17fe
loc_0305:
    call LINK_ADDRESS_27
    mov eax, dword [esp + 0x34]
    and ah, 3
    cmp ax, 0x200
    jne short loc_0364
    mov eax, 1
    sub eax, dword [LINK_ADDRESS_29]
    mov edx, 0x3c
    mov cl, al
    mov esi, 0x104
    sar edx, cl
    sar esi, cl
    dec edx
    jmp short loc_0360
loc_0335:
    mov eax, 1
    lea ecx, [edx + esi]
    mov word [nosplit edx*2 + STARTUMOST], ax
    mov word [nosplit ecx*2 + STARTUMOST], ax
    xor eax, eax
    mov word [nosplit edx*2 + STARTDMOST], ax
    dec edx
    mov word [nosplit ecx*2 + STARTDMOST], ax
loc_0360:
    test edx, edx
    jge short loc_0335
loc_0364:
    mov eax, dword [esp + 0x34]
    and ah, 1
    movsx edx, ax
    cmp edx, 0x100
    jle short loc_037f
    mov eax, 0x200
    sub eax, edx
    mov edx, eax
loc_037f:
    movsx eax, word [nosplit edx*2 + LINK_ADDRESS_34]
    lea ebx, [eax*8]
    movsx edx, word [nosplit edx*2 + SINTABLE]
    lea eax, [edx*4]
    add eax, edx
    add eax, ebx
    mov edx, dword [YXASPECT]
    sar eax, 1
    call SETASPECT
loc_03ae:
    cmp di, word [MYCONNECTINDEX]
    jne near loc_04bd
    cmp word [NUMPLAYERS], 1
    jle near loc_04bd
    mov eax, dword [LINK_ADDRESS_38]
    mov ebx, dword [LINK_ADDRESS_39]
    mov edx, dword [esp + 0x20]
    sub eax, ebx
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [LINK_ADDRESS_39]
    mov ecx, dword [LINK_ADDRESS_40]
    add edx, eax
    mov eax, dword [LINK_ADDRESS_41]
    mov dword [esp + 0x1c], edx
    mov edx, dword [esp + 0x20]
    sub eax, ecx
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [LINK_ADDRESS_40]
    mov esi, dword [LINK_ADDRESS_42]
    add edx, eax
    mov eax, dword [LINK_ADDRESS_43]
    mov dword [esp + 0x18], edx
    mov edx, dword [esp + 0x20]
    sub eax, esi
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [LINK_ADDRESS_42]
    add edx, eax
    movsx eax, word [LINK_ADDRESS_44]
    mov dword [esp + 0x14], edx
    movsx edx, word [LINK_ADDRESS_45]
    add eax, 0x400
    sub eax, edx
    and eax, 0x7ff
    mov edx, dword [esp + 0x20]
    sub eax, 0x400
    imul edx
    shrd eax, edx, 0x10
    mov dx, word [LINK_ADDRESS_45]
    add edx, eax
    mov bx, word [LINK_ADDRESS_46]
    mov dword [esp + 0x28], edx
    mov dx, word [LINK_ADDRESS_47]
    movsx eax, word [LINK_ADDRESS_48]
    add ebx, edx
    movsx edx, word [LINK_ADDRESS_49]
    add eax, edx
    movsx edx, word [LINK_ADDRESS_46]
    sub eax, edx
    mov edx, eax
    movsx eax, word [LINK_ADDRESS_47]
    sub edx, eax
    mov eax, edx
    mov edx, dword [esp + 0x20]
    imul edx
    shrd eax, edx, 0x10
    add ebx, eax
    mov ax, word [LINK_ADDRESS_50]
    mov dword [esp + 0x30], ebx
    mov dword [esp + 0x2c], eax
    jmp near loc_059f
loc_04bd:
    mov eax, dword [ebp + 0x214]
    sub eax, dword [ebp + 0x238]
    mov edx, dword [esp + 0x20]
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [ebp + 0x238]
    add edx, eax
    mov dword [esp + 0x1c], edx
    mov eax, dword [ebp + 0x218]
    mov ebx, dword [ebp + 0x23c]
    mov edx, dword [esp + 0x20]
    sub eax, ebx
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [ebp + 0x23c]
    add edx, eax
    mov dword [esp + 0x18], edx
    mov eax, dword [ebp + 0x21c]
    mov ecx, dword [ebp + 0x240]
    mov edx, dword [esp + 0x20]
    sub eax, ecx
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [ebp + 0x240]
    add edx, eax
    mov dword [esp + 0x14], edx
    movsx edx, word [ebp + 0x298]
    movsx eax, word [ebp + 0x29a]
    add edx, 0x400
    sub edx, eax
    mov eax, edx
    and eax, 0x7ff
    mov edx, dword [esp + 0x20]
    sub eax, 0x400
    imul edx
    shrd eax, edx, 0x10
    mov dx, word [ebp + 0x29a]
    mov bx, word [ebp + 0x224]
    mov di, word [ebp + 0x228]
    mov esi, dword [ebp + 0x220]
    add edx, eax
    add ebx, edi
    mov dword [esp + 0x28], edx
    movsx eax, word [ebp + 0x318]
    mov edi, dword [ebp + 0x224]
    add eax, esi
    mov edx, dword [ebp + 0x228]
    sub eax, edi
    sub eax, edx
    mov edx, dword [esp + 0x20]
    imul edx
    shrd eax, edx, 0x10
    add ebx, eax
    mov dword [esp + 0x30], ebx
loc_059f:
    mov ebx, dword [esp + 0x28]
    add bx, word [ebp + 0x2a0]
    mov cx, word [ebp + 0x31e]
    mov dword [esp + 0x28], ebx
    test cx, cx
    jl short loc_061e
    mov ax, word [ebp + 0x298]
    add ax, word [ebp + 0x2a0]
    mov dx, word [ebp + 0x318]
    mov dword [esp + 0x28], eax
    mov ax, word [ebp + 0x220]
    add eax, edx
    mov dword [esp + 0x30], eax
    mov eax, dword [ebp + 0x214]
    mov dword [esp + 0x1c], eax
    mov eax, dword [ebp + 0x218]
    mov dword [esp + 0x18], eax
    mov eax, dword [ebp + 0x21c]
    mov dword [esp + 0x14], eax
    movsx eax, word [ebp + 0x31e]
    imul eax, eax, 0x2c
    mov ecx, 0x10000
    mov ax, word [eax + LINK_ADDRESS_51]
    mov dword [esp + 0x20], ecx
    mov dword [esp + 0x2c], eax
    jmp short loc_0676
loc_061e:
    cmp word [ebp + 0x344], 0
    jne short loc_0654
    mov eax, dword [ebp + 0x244]
    mov edi, dword [ebp + 0x248]
    mov edx, dword [esp + 0x20]
    sub eax, edi
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [ebp + 0x248]
    mov ebx, dword [esp + 0x14]
    add eax, edx
    add ebx, eax
    mov dword [esp + 0x14], ebx
    jmp short loc_0676
loc_0654:
    movsx eax, word [esp + 0x30]
    push eax
    movsx eax, bx
    lea ecx, [esp + 0x18]
    push eax
    lea eax, [esp + 0x34]
    lea edx, [esp + 0x24]
    push eax
    lea ebx, [esp + 0x24]
    mov eax, ebp
    call LINK_ADDRESS_52
loc_0676:
    movsx edx, word [ebp + 0x340]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + LINK_ADDRESS_53]
    mov dword [esp + 0xc], eax
    movsx edx, word [ebp + 0x340]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + LINK_ADDRESS_54]
    mov dword [esp + 0x10], eax
    mov al, byte [LINK_ADDRESS_55]
    test al, al
    jbe short loc_070a
    mov ah, byte [ebp + 0x3a8]
    cmp ah, 1
    jne short loc_070a
    and al, ah
    and eax, 0xff
    mov edx, 0x100
    shl eax, 9
    mov esi, dword [esp + 0x14]
    sub edx, eax
    add esi, edx
    mov al, byte [LINK_ADDRESS_55]
    mov dword [esp + 0x14], esi
    and al, 2
    mov edx, 2
    xor ah, ah
    sub edx, eax
    mov eax, edx
    mov ebx, dword [esp + 0x28]
    shl eax, 2
    add ebx, eax
    mov dword [esp + 0x28], ebx
loc_070a:
    movsx eax, word [ebp + 0x340]
    imul eax, eax, 0x2c
    cmp byte [eax + LINK_ADDRESS_56], 1
    jne short loc_0725
    sub dword [esp + 0x14], 0x1200
loc_0725:
    mov cx, word [ebp + 0x31e]
    test cx, cx
    jl short loc_074a
    movsx eax, cx
    imul eax, eax, 0x2c
    movsx ax, byte [eax + LINK_ADDRESS_57]
    db 0x05, 0x64, 0x00, 0x00, 0x00    ; add eax, 0x64
    mov dword [esp + 0x30], eax
    jmp short loc_078d
loc_074a:
    cmp byte [ebp + 0x3cc], 0
    jne short loc_078d
    mov eax, dword [ebp + 0x260]
    mov edx, dword [esp + 0x14]
    add eax, 0x400
    cmp eax, edx
    jle short loc_0771
    mov eax, dword [esp + 0xc]
    add eax, 0x400
    jmp short loc_0789
loc_0771:
    mov eax, dword [ebp + 0x25c]
    sub eax, 0x400
    cmp eax, edx
    jge short loc_078d
    mov eax, dword [esp + 0x10]
    sub eax, 0x400
loc_0789:
    mov dword [esp + 0x14], eax
loc_078d:
    mov esi, dword [esp + 0x2c]
    test si, si
    jl short loc_07d9
    lea eax, [esp + 0x10]
    lea ecx, [esp + 0xc]
    mov ebx, dword [esp + 0x18]
    mov edx, dword [esp + 0x1c]
    push eax
    movsx eax, si
    call GETZSOFSLOPE
    mov eax, dword [esp + 0xc]
    mov ecx, dword [esp + 0x14]
    add eax, 0x400
    cmp eax, ecx
    jle short loc_07c4
    mov dword [esp + 0x14], eax
loc_07c4:
    mov eax, dword [esp + 0x10]
    mov esi, dword [esp + 0x14]
    sub eax, 0x400
    cmp eax, esi
    jge short loc_07d9
    mov dword [esp + 0x14], eax
loc_07d9:
    mov edi, dword [esp + 0x30]
    cmp di, 0x12b
    jle short loc_07ee
    mov dword [esp + 0x30], 0x12b
    jmp short loc_07fe
loc_07ee:
    movsx eax, di
    cmp eax, -0x63
    jge short loc_07fe
    mov dword [esp + 0x30], 0xffffff9d
loc_07fe:
    mov edi, dword [esp + 0x20]
    movsx eax, word [esp + 0x30]
    push edi
    movsx ecx, word [esp + 0x2c]
    mov ebx, dword [esp + 0x18]
    push eax
    mov edx, dword [esp + 0x20]
    mov eax, dword [esp + 0x24]
    call LINK_ADDRESS_15
    mov al, byte [LINK_ADDRESS_59]
    and al, 1
    test al, al
    jbe near loc_0967
    mov eax, 0x7fffffff
    xor edx, edx
    xor ebx, ebx
    mov dword [esp + 0x24], eax
    jmp short loc_0889
loc_083d:
    movsx ecx, bx
    movsx eax, word [nosplit ecx*2 + LINK_ADDRESS_60]
    shl eax, 5
    mov esi, dword [esp + 0x1c]
    mov eax, dword [eax + WALL]
    sub eax, esi
    test eax, eax
    jns short loc_085d
    neg eax
loc_085d:
    movsx edi, word [nosplit ecx*2 + LINK_ADDRESS_60]
    shl edi, 5
    mov esi, eax
    mov eax, dword [edi + LINK_ADDRESS_62]
    sub eax, dword [esp + 0x18]
    test eax, eax
    jns short loc_087a
    neg eax
loc_087a:
    add esi, eax
    cmp esi, dword [esp + 0x24]
    jge short loc_0888
    mov dword [esp + 0x24], esi
    mov edx, ecx
loc_0888:
    inc ebx
loc_0889:
    cmp bx, word [LINK_ADDRESS_63]
    jl short loc_083d
    db 0x8d, 0x3c, 0x55, 0x00, 0x00, 0x00, 0x00    ; lea edi, [edx*2]
    movsx eax, word [edi + LINK_ADDRESS_60]
    mov edx, eax
    shl edx, 5
    cmp word [edx + LINK_ADDRESS_64], 0x230
    jne near loc_0960
    lea edx, [esp + 0x34]
    push edx
    lea edx, [esp + 4]
    push edx
    lea edx, [esp + 0xc]
    push edx
    movsx edx, word [edi + LINK_ADDRESS_65]
    push edx
    movsx ecx, word [esp + 0x38]
    mov ebx, dword [esp + 0x24]
    push eax
    movsx eax, word [esp + 0x44]
    mov edx, dword [esp + 0x2c]
    push eax
    mov dword [esp + 0x20], eax
    mov eax, dword [esp + 0x34]
    call LINK_ADDRESS_66
    mov esi, dword [VISIBILITY]
    mov edx, esi
    mov eax, esi
    sar edx, 1
    sar eax, 2
    add edx, eax
    movsx eax, word [edi + LINK_ADDRESS_65]
    mov ebx, dword [esp + 8]
    add eax, 0x400
    movsx ecx, word [esp + 0x34]
    push eax
    mov dword [VISIBILITY], edx
    mov edx, dword [esp + 4]
    push ebx
    mov eax, dword [esp + 0xc]
    mov ebx, dword [esp + 0x1c]
    call LINK_ADDRESS_16
    mov bl, 1
    mov ecx, dword [esp + 0x20]
    mov edx, dword [esp]
    mov eax, dword [esp + 4]
    mov byte [LINK_ADDRESS_67], bl
    movsx ebx, word [esp + 0x34]
    call LINK_ADDRESS_17
    xor bh, bh
    mov byte [LINK_ADDRESS_67], bh
    call LINK_ADDRESS_18
    call LINK_ADDRESS_68
    mov dword [VISIBILITY], esi
loc_0960:
    and byte [LINK_ADDRESS_59], 0xfe
loc_0967:
    movsx eax, word [esp + 0x2c]
    movsx esi, word [esp + 0x28]
    mov ebx, dword [esp + 0x14]
    push eax
    movsx eax, word [esp + 0x34]
    mov edx, dword [esp + 0x1c]
    push eax
    mov ecx, esi
    mov eax, dword [esp + 0x24]
    call LINK_ADDRESS_16
    mov ecx, dword [esp + 0x20]
    mov edx, dword [esp + 0x18]
    mov eax, dword [esp + 0x1c]
    mov ebx, esi
    call LINK_ADDRESS_17
    call LINK_ADDRESS_18
    cmp byte [LINK_ADDRESS_23], 1
    jne short loc_09be
    call LINK_ADDRESS_69
    xor ah, ah
    mov byte [LINK_ADDRESS_23], ah
    jmp near loc_0aa5
loc_09be:
    cmp dword [LINK_ADDRESS_28], 0
    je short loc_09d1
    cmp word [ebp + 0x380], 0
    jne short loc_09de
loc_09d1:
    cmp dword [LINK_ADDRESS_29], 0
    jne near loc_0aa5
loc_09de:
    cmp dword [LINK_ADDRESS_28], 0
    je short loc_09f0
    mov ax, word [ebp + 0x380]
    jmp short loc_09f2
loc_09f0:
    xor eax, eax
loc_09f2:
    mov dword [esp + 0x34], eax
    call LINK_ADDRESS_69
    mov eax, dword [esp + 0x34]
    mov esi, dword [LINK_ADDRESS_70]
    and ah, 1
    and esi, 0xff0000ff
    movsx edx, ax
    mov dword [LINK_ADDRESS_70], esi
    cmp edx, 0x100
    jle short loc_0a28
    mov eax, 0x200
    sub eax, edx
    mov edx, eax
loc_0a28:
    movsx eax, word [nosplit edx*2 + LINK_ADDRESS_34]
    lea ebx, [eax*8]
    movsx edx, word [nosplit edx*2 + SINTABLE]
    lea eax, [edx*4]
    add eax, edx
    mov edi, dword [LINK_ADDRESS_29]
    lea edx, [ebx + eax]
    mov eax, 1
    sub eax, edi
    jne short loc_0a5c
    sar edx, 1
loc_0a5c:
    mov eax, dword [WINDOWY2]
    push eax
    mov ebx, dword [WINDOWX2]
    push ebx
    mov ecx, dword [WINDOWY1]
    push ecx
    mov esi, dword [WINDOWX1]
    push esi
    push 0x46
    push 0
    mov eax, 0xa00000
    mov ebx, edx
    push 0
    movsx ecx, word [esp + 0x50]
    push 0x17fe
    mov edx, 0x640000
    add ecx, 0x200
    call LINK_ADDRESS_75
    mov byte [LINK_ADDRESS_31], 0xc7
loc_0aa5:
    call LINK_ADDRESS_76
    mov eax, dword [TOTALCLOCK]
    cmp eax, dword [LINK_ADDRESS_78]
    jge short loc_0aeb
    mov edx, dword [LINK_ADDRESS_79]
    mov eax, dword [ebp + 0x268]
    sub eax, edx
    test eax, eax
    jns short loc_0acb
    neg eax
loc_0acb:
    cmp eax, 8
    jle short loc_0af6
    mov eax, dword [LINK_ADDRESS_79]
    mov ebx, dword [ebp + 0x268]
    sub eax, ebx
    sar eax, 2
    lea ecx, [ebx + eax]
    mov dword [ebp + 0x268], ecx
    jmp short loc_0af6
loc_0aeb:
    mov eax, dword [LINK_ADDRESS_79]
    mov dword [ebp + 0x268], eax
loc_0af6:
    add esp, 0x38
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    nop
