; Update actor state and sector interactions.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 8
    mov di, word [LINK_ADDRESS_1]
loc_0010:
    test di, di
    jl short LINK_ADDRESS_2
    movsx ebp, di
    imul esi, ebp, 0x2c
    add esi, SPRITE
    mov ax, word [nosplit ebp*2 + NEXTSPRITESTAT]
    movsx ebx, word [esi + 0x22]
    mov dword [esp + 4], eax
    mov ecx, ebx
    shl ecx, 7
    lea eax, [ebp*8]
    sub ecx, ebx
    mov dx, word [esi + 0x1e]
    lea ecx, [ecx*4]
    add eax, ebp
    sub ecx, ebx
    lea eax, [eax*8]
    add ecx, ecx
    sub eax, ebp
    add ecx, LINK_ADDRESS_5
    test dx, dx
    jl near loc_0268
    cmp word [ecx + 0x31e], 0
    jl short loc_00b2
    mov edx, dword [ecx + 0x238]
    mov dword [esi], edx
    mov edx, dword [ecx + 0x23c]
    mov dword [esi + 4], edx
    mov edx, dword [ecx + 0x240]
    add edx, 0x2600
    mov dword [esi + 8], edx
    mov dword [eax + LINK_ADDRESS_6], edx
    mov ax, word [ecx + 0x29a]
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    mov ecx, dword [esi + 8]
    mov word [esi + 0x1c], ax
    mov eax, ebp
    jmp near loc_0363
loc_00b2:
    cmp dword [LINK_ADDRESS_7], 1
    jle short loc_00cc
    mov edx, esp
    mov eax, ebx
    call LINK_ADDRESS_8
    mov word [LINK_ADDRESS_9], ax
    jmp short loc_00db
loc_00cc:
    mov ax, word [esi + 0x22]
    mov word [LINK_ADDRESS_9], ax
    xor eax, eax
    mov dword [esp], eax
loc_00db:
    mov ebx, dword [esp]
    movsx eax, di
    movsx edx, word [esi + 0x22]
    call LINK_ADDRESS_10
    cmp dword [LINK_ADDRESS_7], 1
    jle near loc_017d
    movsx edx, word [LINK_ADDRESS_9]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_11]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_12], 0
    jle short loc_017d
    cmp byte [esi + 0x15], 0x20
    jbe short loc_017d
    cmp byte [eax + LINK_ADDRESS_13], 0x20
    jae short loc_017d
    cmp dword [esp], 0x578
    jge short loc_017d
    cmp word [ecx + 0x328], 0
    jne short loc_017d
    mov word [ecx + 0x328], 1
    mov word [ecx + 0x392], 0xffff
    movsx edx, word [LINK_ADDRESS_9]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ax, word [nosplit eax*2 + LINK_ADDRESS_11]
    mov word [ecx + 0x356], ax
loc_017d:
    cmp byte [LINK_ADDRESS_14], 0
    je short loc_019f
    mov ax, word [LINK_ADDRESS_15]
    mov word [esi + 0xc], 0x101
    mov word [esi + 0x2a], ax
    mov word [ecx + 0x388], 0x63f
loc_019f:
    cmp word [esi + 0x2a], 0
    jle short loc_01c7
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov word [eax + LINK_ADDRESS_16], di
    jmp near loc_0258
loc_01c7:
    mov eax, dword [esi]
    mov dword [ecx + 0x214], eax
    mov eax, dword [esi + 4]
    mov dword [ecx + 0x218], eax
    mov eax, dword [esi + 8]
    mov word [ecx + 0x31e], 0xffff
    sub eax, 0x1400
    mov bx, word [ecx + 0x2c8]
    mov dword [ecx + 0x21c], eax
    test bx, bx
    jl short loc_0258
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_17], 0x400
    jge short loc_0258
    mov edx, dword [eax + LINK_ADDRESS_18]
    mov edi, dword [ecx + 0x218]
    mov ebp, dword [ecx + 0x214]
    mov eax, dword [eax + SPRITE]
    sub edx, edi
    sub eax, ebp
    call GETANGLE
    movsx edx, ax
    movsx eax, word [ecx + 0x298]
    call LINK_ADDRESS_20
    cwde
    mov edx, eax
    sar edx, 1
    movsx eax, word [ecx + 0x298]
    add eax, edx
    mov word [ecx + 0x298], ax
    and byte [ecx + 0x299], 7
loc_0258:
    mov ax, word [ecx + 0x298]
    mov word [esi + 0x1c], ax
    jmp near loc_0368
loc_0268:
    movsx edx, word [ecx + 0x38e]
    cmp edx, -1
    jne short loc_0280
    mov eax, ebp
    call LINK_ADDRESS_21
    jmp near loc_03a2
loc_0280:
    mov edx, dword [esi]
    mov dword [eax + LINK_ADDRESS_22], edx
    mov edx, dword [esi + 4]
    mov dword [eax + LINK_ADDRESS_23], edx
    mov edx, dword [esi + 8]
    mov dword [eax + LINK_ADDRESS_6], edx
    mov ah, byte [esi + 0x14]
    mov word [esi + 0xc], 0
    cmp ah, 0x2a
    jae short loc_02b6
    mov dl, ah
    add dl, 4
    mov byte [esi + 0x14], dl
    or byte [esi + 0xc], 2
    jmp short loc_02ba
loc_02b6:
    mov byte [esi + 0x14], 0x2a
loc_02ba:
    mov bl, byte [esi + 0x15]
    cmp bl, 0x24
    jae short loc_02cc
    mov bh, bl
    add bh, 4
    mov byte [esi + 0x15], bh
    jmp short loc_0316
loc_02cc:
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    mov byte [esi + 0x15], 0x24
    cmp word [eax*8 + LINK_ADDRESS_24], 2
    je short loc_02f0
    movsx eax, di
    call LINK_ADDRESS_25
loc_02f0:
    cmp word [esi + 0x24], 0
    jne short loc_0316
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_24], 1
    jne short loc_0316
    add dword [esi + 8], 0x2000
loc_0316:
    cmp word [esi + 0x2a], 8
    jge short loc_0346
    mov word [esi + 0x20], 0x80
    mov edx, 0x10001
    mov ax, word [ecx + 0x298]
    mov cx, word [esi + 0x2a]
    mov word [esi + 0x1c], ax
    inc ecx
    movsx eax, di
    mov word [esi + 0x2a], cx
    call LINK_ADDRESS_26
    jmp short loc_0368
loc_0346:
    mov edx, 0x7ff
    mov ax, word [ecx + 0x298]
    mov ebx, dword [esi + 4]
    sub edx, eax
    mov ecx, dword [esi + 8]
    mov word [esi + 0x1c], dx
    movsx eax, di
    mov edx, dword [esi]
loc_0363:
    call LINK_ADDRESS_27
loc_0368:
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    test byte [eax + LINK_ADDRESS_28], 1
    je short loc_038e
    movsx edx, byte [eax + LINK_ADDRESS_29]
    jmp short loc_0395
loc_038e:
    movsx edx, byte [eax + LINK_ADDRESS_30]
loc_0395:
    movsx eax, byte [esi + 0x10]
    sub edx, eax
    sar edx, 1
    add eax, edx
    mov byte [esi + 0x10], al
loc_03a2:
    mov edi, dword [esp + 4]
    jmp near loc_0010
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0xc
    mov di, word [LINK_ADDRESS_31]
loc_03c0:
    test di, di
    jl near loc_0867
    movsx ecx, di
    imul eax, ecx, 0x2c
    mov esi, SPRITE
    mov dx, word [nosplit ecx*2 + NEXTSPRITESTAT]
    add esi, eax
    mov dword [esp + 8], edx
    mov dx, word [esi + 0xe]
    cmp dx, 5
    jb near loc_085e
    jbe short loc_043c
    cmp dx, 9
    jne near loc_085e
    mov dx, word [eax + LINK_ADDRESS_12]
    cmp dx, 0x42
    jne short loc_0423
    movsx edx, word [eax + LINK_ADDRESS_32]
    mov eax, ecx
    call LINK_ADDRESS_33
    mov eax, ecx
    call LINK_ADDRESS_21
    jmp near loc_085e
loc_0423:
    cmp dx, 0x35
    jle near loc_085e
    mov ecx, edx
    inc ecx
    mov word [eax + LINK_ADDRESS_12], cx
    jmp near loc_085e
loc_043c:
    movsx eax, word [esi + 0x28]
    mov dword [esp], eax
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov ebx, dword [LINK_ADDRESS_34]
    cmp ebx, dword [eax + LINK_ADDRESS_35]
    je short loc_0471
    xor ecx, ecx
    mov dword [eax + LINK_ADDRESS_35], ebx
    mov dword [eax + LINK_ADDRESS_36], ecx
loc_0471:
    mov ax, word [esi + 0x26]
    cmp ax, 0x3e8
    jl near loc_054d
    cmp ax, 0x7d0
    jge near loc_054d
    movsx edx, word [LINK_ADDRESS_37]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_11]
    imul eax, eax, 0x2c
    mov edx, esi
    add eax, SPRITE
    mov ecx, dword [esp]
    call LINK_ADDRESS_38
    mov dword [esp + 4], eax
    cmp eax, ecx
    jge short loc_04fb
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ebp, dword [eax + LINK_ADDRESS_36]
    mov edx, eax
    test ebp, ebp
    jne short loc_04fb
    movsx eax, word [esi + 0x26]
    sub eax, 0x3e8
    call LINK_ADDRESS_39
    mov dword [edx + LINK_ADDRESS_36], 1
loc_04fb:
    mov eax, dword [esp + 4]
    cmp eax, dword [esp]
    jl near loc_085e
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ebx, dword [eax + LINK_ADDRESS_36]
    mov edx, eax
    cmp ebx, 1
    jne near loc_085e
    xor eax, eax
    call LINK_ADDRESS_39
    xor eax, eax
    xor ecx, ecx
    call LINK_ADDRESS_40
    mov dword [edx + LINK_ADDRESS_36], ecx
    mov edi, dword [esp + 8]
    jmp near loc_03c0
loc_054d:
    cmp word [esi + 0x26], 0x3e7
    jge near loc_085e
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    movsx eax, word [eax*8 + LINK_ADDRESS_24]
    cmp eax, 9
    jae near loc_085e
    cmp dword [LINK_ADDRESS_41], 0
    je near loc_085e
    movsx ecx, di
    imul eax, ecx, 0x2c
    movsx edx, word [eax + LINK_ADDRESS_42]
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [eax*8 + LINK_ADDRESS_43]
    cmp edx, dword [eax*8 + LINK_ADDRESS_44]
    je near loc_085e
    movsx eax, word [esi + 0x26]
    test byte [eax + LINK_ADDRESS_45], 2
    je near loc_0772
    movsx edx, word [LINK_ADDRESS_37]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_11]
    imul eax, eax, 0x2c
    mov edx, esi
    add eax, SPRITE
    mov ebp, dword [esp]
    call LINK_ADDRESS_46
    mov dword [esp + 4], eax
    cmp eax, ebp
    jge near loc_0738
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    cmp dword [eax + LINK_ADDRESS_36], 0
    jne near loc_0738
    movsx eax, word [esi + 0x26]
    mov al, byte [eax + LINK_ADDRESS_47]
    and eax, 0xff
    dec eax
    call LINK_ADDRESS_48
    test eax, eax
    je near loc_0738
    xor eax, eax
    mov ebx, dword [LINK_ADDRESS_49]
    mov al, byte [LINK_ADDRESS_50]
    cmp eax, ebx
    jne near loc_070c
    mov bx, word [LINK_ADDRESS_31]
loc_0654:
    test bx, bx
    jl near loc_0700
    movsx eax, di
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_51], 5
    jne near loc_06f0
    cmp bx, di
    je near loc_06f0
    movsx ecx, bx
    imul ebp, ecx, 0x2c
    cmp word [ebp + LINK_ADDRESS_52], 0x3e7
    jge short loc_06f0
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    cmp dword [eax + LINK_ADDRESS_36], 1
    jne short loc_06f0
    movsx edx, word [LINK_ADDRESS_37]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_11]
    imul edx, eax, 0x2c
    mov eax, SPRITE
    add edx, SPRITE
    add eax, ebp
    call LINK_ADDRESS_46
    cmp eax, dword [esp + 4]
    jle short loc_06f0
    mov edx, ecx
    movsx eax, word [ebp + LINK_ADDRESS_52]
    call LINK_ADDRESS_53
    jmp short loc_0700
loc_06f0:
    movsx eax, bx
    mov bx, word [nosplit eax*2 + NEXTSPRITESTAT]
    jmp near loc_0654
loc_0700:
    movsx eax, bx
    cmp eax, -1
    je near loc_085e
loc_070c:
    movsx ecx, di
    xor eax, eax
    mov edx, ecx
    mov ax, word [esi + 0x26]
    call LINK_ADDRESS_54
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov dword [eax + LINK_ADDRESS_36], 1
loc_0738:
    mov eax, dword [esp + 4]
    cmp eax, dword [esp]
    jl short loc_0772
    movsx ecx, di
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    cmp dword [eax + LINK_ADDRESS_36], 1
    jne short loc_0772
    xor edx, edx
    mov dword [eax + LINK_ADDRESS_36], edx
    mov edx, ecx
    movsx eax, word [esi + 0x26]
    call LINK_ADDRESS_53
loc_0772:
    movsx eax, word [esi + 0x26]
    test byte [eax + LINK_ADDRESS_45], 0x10
    je near loc_085e
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ebx, dword [eax + LINK_ADDRESS_55]
    test ebx, ebx
    jle short loc_07b4
    lea ecx, [ebx - 1]
    mov dword [eax + LINK_ADDRESS_55], ecx
    mov edi, dword [esp + 8]
    jmp near loc_03c0
loc_07b4:
    mov cx, word [CONNECTHEAD]
    test cx, cx
    jge short loc_07c9
    mov edi, dword [esp + 8]
    jmp near loc_03c0
loc_07c9:
    mov dx, word [MYCONNECTINDEX]
    cmp cx, dx
    jne short loc_084a
    movsx edx, dx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov bx, word [esi + 0x18]
    cmp bx, word [nosplit eax*2 + LINK_ADDRESS_58]
    jne short loc_084a
    movsx eax, word [LINK_ADDRESS_59]
    movsx ebp, word [esi + 0x28]
    xor edx, edx
    inc ebp
    div ebp
    movsx eax, word [esi + 0x26]
    add edx, eax
    movsx eax, dx
    call LINK_ADDRESS_60
    movsx edx, word [LINK_ADDRESS_59]
    mov ebp, 0x410
    mov eax, edx
    sar edx, 0x1f
    idiv ebp
    mov ebp, edx
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    add ebp, 0x410
    mov dword [eax + LINK_ADDRESS_55], ebp
loc_084a:
    movsx eax, cx
    mov cx, word [nosplit eax*2 + CONNECTPOINT2]
    test cx, cx
    jge near loc_07c9
loc_085e:
    mov edi, dword [esp + 8]
    jmp near loc_03c0
loc_0867:
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
