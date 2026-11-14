; Per-frame game state and actor processing.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 8
    mov ebp, eax
    movsx edx, word [LINK_ADDRESS_1]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edi, LINK_ADDRESS_2
    add eax, eax
    add edi, eax
    mov edx, dword [edi + 0x274]
    test edx, edx
    jle short loc_0068
    mov ebx, dword [edi + 0x210]
    test ebx, ebx
    jne short loc_0068
    mov ecx, edx
    mov bl, byte [edi + 0x3f2]
    xor eax, eax
    or cl, 0x80
    xor edx, edx
    mov al, byte [edi + 0x3f0]
    mov dl, byte [edi + 0x3f1]
    call LINK_ADDRESS_3
    mov byte [LINK_ADDRESS_4], 1
    jmp short loc_00ae
loc_0068:
    cmp byte [LINK_ADDRESS_4], 0
    je short loc_008e
    mov eax, dword [LINK_ADDRESS_5]
    mov edx, dword [edi + 0x3e5]
    sar eax, 2
    call SETBRIGHTNESS
    xor dl, dl
    mov byte [LINK_ADDRESS_4], dl
    jmp short loc_00ae
loc_008e:
    mov ecx, dword [edi + 0x210]
    test ecx, ecx
    jle short loc_00ae
    mov edx, 0x40
    sar ecx, 1
    xor ebx, ebx
    xor eax, eax
    add ecx, 0x80
    call LINK_ADDRESS_3
loc_00ae:
    mov bl, byte [LINK_ADDRESS_7]
    test bl, bl
    je near loc_016c
    mov al, bl
    cmp bl, 1
    jb short loc_0113
    mov ebx, dword [XDIM]
    mov edx, dword [YDIM]
    dec ebx
    dec edx
    cmp al, 1
    jbe short loc_00db
    cmp al, 2
    je short loc_00f2
    jmp short loc_0113
loc_00db:
    push edx
    push ebx
    push 0
    push 0
    push 0x5a
    push 0
    push 0
    xor ecx, ecx
    xor eax, eax
    push 0xcd0
    jmp short loc_0107
loc_00f2:
    push edx
    push ebx
    push 0
    push 0
    push 0x5a
    push 0
    push 0
    xor ecx, ecx
    xor eax, eax
    push 0x98d
loc_0107:
    xor edx, edx
    mov ebx, 0x10000
    call LINK_ADDRESS_10
loc_0113:
    cmp byte [LINK_ADDRESS_11], 0
    je near loc_07fb
    mov eax, LINK_ADDRESS_12
    xor ch, ch
    call LINK_ADDRESS_13
    mov byte [LINK_ADDRESS_11], ch
    mov esi, dword [LINK_ADDRESS_14]
    mov byte [LINK_ADDRESS_7], ch
    cmp esi, 2
    jge short loc_015d
    cmp dword [LINK_ADDRESS_15], 2
    je short loc_015d
    mov byte [LINK_ADDRESS_16], 1
    mov eax, dword [LINK_ADDRESS_17]
    mov dword [TOTALCLOCK], eax
loc_015d:
    call LINK_ADDRESS_19
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_016c:
    movsx edx, word [edi + 0x29e]
    mov bl, 1
    mov cl, dl
    mov eax, edx
    and cl, 7
    sar eax, 3
    shl bl, cl
    or byte [eax + SHOW2DSECTOR], bl
    lea eax, [edx*4]
    add eax, edx
    movsx edx, word [eax*8 + SECTOR]
    mov ebx, WALL
    shl edx, 5
    movsx esi, word [eax*8 + LINK_ADDRESS_23]
    add ebx, edx
    jmp short loc_020b
loc_01ac:
    movsx edx, word [ebx + 0xc]
    test edx, edx
    jl short loc_0207
    test byte [ebx + 0xe], 0x71
    jne short loc_0207
    movsx eax, word [ebx + 0xa]
    shl eax, 5
    test byte [eax + LINK_ADDRESS_24], 0x71
    jne short loc_0207
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    cmp word [eax + LINK_ADDRESS_25], 0x7fff
    je short loc_0207
    mov ecx, dword [eax + LINK_ADDRESS_26]
    cmp ecx, dword [eax + LINK_ADDRESS_27]
    jge short loc_0207
    mov eax, edx
    mov cl, dl
    mov dl, 1
    and cl, 7
    sar eax, 3
    shl dl, cl
    or byte [eax + SHOW2DSECTOR], dl
loc_0207:
    dec esi
    add ebx, 0x20
loc_020b:
    test esi, esi
    jg short loc_01ac
    movsx eax, word [LINK_ADDRESS_28]
    cmp eax, -1
    jne near loc_050b
    cmp byte [LINK_ADDRESS_29], 2
    je short loc_0279
    mov dx, word [edi + 0x31e]
    test dx, dx
    jl short loc_023e
    movsx eax, dx
    call LINK_ADDRESS_30
    jmp short loc_0274
loc_023e:
    movsx eax, word [LINK_ADDRESS_1]
    mov edx, 0x96
    call LINK_ADDRESS_31
    call LINK_ADDRESS_32
    mov eax, 0x10e
    call LINK_ADDRESS_33
    cmp word [edi + 0x344], 0
    jne short loc_0274
    movsx eax, word [LINK_ADDRESS_1]
    call LINK_ADDRESS_34
loc_0274:
    call LINK_ADDRESS_35
loc_0279:
    cmp byte [LINK_ADDRESS_29], 0
    jbe near loc_050b
    test ebp, ebp
    jle short loc_028e
    mov eax, ebp
    jmp short loc_0290
loc_028e:
    xor eax, eax
loc_0290:
    cmp eax, 0x10000
    jge short loc_02a3
    test ebp, ebp
    jle short loc_029f
    mov ebx, ebp
    jmp short loc_02a8
loc_029f:
    xor ebx, ebx
    jmp short loc_02a8
loc_02a3:
    mov ebx, 0x10000
loc_02a8:
    mov eax, ebx
    call LINK_ADDRESS_36
    mov cl, byte [LINK_ADDRESS_37]
    mov ebp, ebx
    test cl, cl
    jne near loc_03ef
    movsx eax, word [edi + 0x31e]
    cmp eax, -1
    jne near loc_03d3
    mov ax, word [LINK_ADDRESS_1]
    cmp ax, word [MYCONNECTINDEX]
    jne near loc_0362
    cmp word [NUMPLAYERS], 1
    jle short loc_0362
    mov eax, dword [LINK_ADDRESS_40]
    mov esi, dword [LINK_ADDRESS_41]
    mov edx, ebx
    sub eax, esi
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [LINK_ADDRESS_41]
    mov ebp, dword [LINK_ADDRESS_42]
    add edx, eax
    mov eax, dword [LINK_ADDRESS_43]
    mov dword [esp], edx
    mov edx, ebx
    sub eax, ebp
    imul edx
    shrd eax, edx, 0x10
    mov esi, dword [LINK_ADDRESS_42]
    add esi, eax
    movsx eax, word [LINK_ADDRESS_44]
    movsx edx, word [LINK_ADDRESS_45]
    add eax, 0x400
    sub eax, edx
    and eax, 0x7ff
    mov edx, ebx
    sub eax, 0x400
    imul edx
    shrd eax, edx, 0x10
    movsx edx, word [LINK_ADDRESS_45]
    add edx, eax
    mov dword [esp + 4], edx
    jmp near loc_0464
loc_0362:
    mov eax, dword [edi + 0x214]
    mov ebx, dword [edi + 0x238]
    mov edx, ebp
    sub eax, ebx
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [edi + 0x238]
    add edx, eax
    mov ecx, dword [edi + 0x23c]
    mov dword [esp], edx
    mov eax, dword [edi + 0x218]
    mov edx, ebp
    sub eax, ecx
    imul edx
    shrd eax, edx, 0x10
    mov esi, dword [edi + 0x23c]
    add esi, eax
    movsx eax, word [edi + 0x298]
    movsx ebx, word [edi + 0x29a]
    add eax, 0x400
    sub eax, ebx
    and eax, 0x7ff
    mov edx, ebp
    sub eax, 0x400
    imul edx
    shrd eax, edx, 0x10
    add ebx, eax
    mov dword [esp + 4], ebx
    jmp near loc_0464
loc_03d3:
    mov eax, dword [edi + 0x238]
    mov dword [esp], eax
    movsx eax, word [edi + 0x29a]
    mov esi, dword [edi + 0x23c]
    mov dword [esp + 4], eax
    jmp short loc_0464
loc_03ef:
    mov eax, dword [LINK_ADDRESS_46]
    mov ebp, dword [LINK_ADDRESS_47]
    sar eax, 3
    add ebp, eax
    mov eax, 0xa00
    sub eax, ebp
    and eax, 0x7ff
    mov ebx, dword [LINK_ADDRESS_48]
    movsx eax, word [nosplit eax*2 + SINTABLE]
    imul eax, ebx
    mov ecx, dword [LINK_ADDRESS_50]
    sar eax, 0xe
    add ecx, eax
    mov eax, 0x400
    sub eax, ebp
    and eax, 0x7ff
    movsx eax, word [nosplit eax*2 + SINTABLE]
    imul eax, ebx
    mov edx, dword [LINK_ADDRESS_51]
    mov dword [LINK_ADDRESS_47], ebp
    mov dword [esp + 4], ebp
    sar eax, 0xe
    mov dword [LINK_ADDRESS_50], ecx
    add edx, eax
    mov dword [esp], ecx
    mov dword [LINK_ADDRESS_51], edx
    mov esi, edx
loc_0464:
    cmp byte [LINK_ADDRESS_29], 2
    jne short loc_0484
    xor eax, eax
    mov ecx, dword [esp + 4]
    call LINK_ADDRESS_52
    mov edx, esi
    mov eax, dword [esp]
    mov ebx, dword [edi]
    call LINK_ADDRESS_53
loc_0484:
    movsx ecx, word [esp + 4]
    mov eax, dword [esp]
    mov edx, esi
    mov ebx, dword [edi]
    call LINK_ADDRESS_54
    call LINK_ADDRESS_55
    cmp byte [LINK_ADDRESS_29], 2
    jne short loc_050b
    cmp dword [LINK_ADDRESS_56], 0
    jle short loc_04b3
    mov esi, 0x93
    jmp short loc_04b8
loc_04b3:
    mov esi, 0xb6
loc_04b8:
    mov edx, dword [LINK_ADDRESS_57]
    push 0x1a
    mov eax, edx
    mov ebx, LINK_ADDRESS_58
    shl eax, 5
    xor ecx, ecx
    add eax, edx
    lea edx, [esi + 6]
    add ebx, eax
    mov eax, 1
    call 0x105c0
    imul eax, dword [LINK_ADDRESS_57], 0xb
    mov edx, dword [LINK_ADDRESS_59]
    add edx, eax
    push 0x1a
    mov eax, edx
    mov ebx, LINK_ADDRESS_60
    shl eax, 5
    xor ecx, ecx
    add eax, edx
    lea edx, [esi + 0xc]
    add ebx, eax
    mov eax, 1
    call 0x105c0
loc_050b:
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0
    push 0
    push 0
    mov ebx, 0x10000
    mov edx, 0xb30000
    push 0xe
    xor ecx, ecx
    mov eax, 0x2f0000
    call LINK_ADDRESS_10
    call LINK_ADDRESS_61
    cmp byte [LINK_ADDRESS_11], 0
    je near loc_06d8
    cmp byte [LINK_ADDRESS_29], 0
    jne near loc_06d8
    cmp byte [LINK_ADDRESS_7], 0
    jne near loc_06d8
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    movsx edx, word [eax + LINK_ADDRESS_62]
    cmp edx, -1
    jne near loc_06d8
    mov dl, byte [eax + LINK_ADDRESS_63]
    and dl, 1
    cmp dl, 1
    jne short loc_0607
    cmp dword [LINK_ADDRESS_64], 0x33
    jge short loc_0607
    xor dh, dh
    mov byte [LINK_ADDRESS_11], dh
    mov bl, byte [eax + LINK_ADDRESS_63]
    and bl, 0xfe
    mov edi, dword [LINK_ADDRESS_14]
    mov byte [eax + LINK_ADDRESS_63], bl
    cmp edi, 2
    jge short loc_05f6
    cmp dword [LINK_ADDRESS_15], 2
    je short loc_05f6
    mov eax, dword [LINK_ADDRESS_17]
    mov byte [LINK_ADDRESS_16], dl
    mov dword [TOTALCLOCK], eax
    mov eax, dword [TOTALCLOCK]
    mov dword [LINK_ADDRESS_65], eax
    mov dword [LINK_ADDRESS_66], 0x10000
loc_05f6:
    mov byte [LINK_ADDRESS_67], 0xc7
    call LINK_ADDRESS_19
    jmp near loc_06d8
loc_0607:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov dl, byte [eax + LINK_ADDRESS_63]
    and dl, 1
    cmp dl, 1
    je near loc_06d8
    movsx edx, word [eax + LINK_ADDRESS_62]
    cmp edx, -1
    jne near loc_06d8
    test byte [eax + LINK_ADDRESS_63], 0x10
    jne near loc_06d8
    xor bh, bh
    mov byte [LINK_ADDRESS_11], bh
    call LINK_ADDRESS_68
    call LINK_ADDRESS_69
    call LINK_ADDRESS_70
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    or byte [nosplit eax*2 + LINK_ADDRESS_63], 1
    cmp dword [LINK_ADDRESS_14], 2
    jge short loc_069d
    cmp dword [LINK_ADDRESS_15], 2
    je short loc_069d
    mov byte [LINK_ADDRESS_16], bh
loc_069d:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    test byte [nosplit eax*2 + LINK_ADDRESS_63], 4
    je short loc_06c5
    mov eax, 0x1f4
    jmp short loc_06c7
loc_06c5:
    xor eax, eax
loc_06c7:
    call LINK_ADDRESS_71
    mov ax, word [MYCONNECTINDEX]
    mov word [LINK_ADDRESS_1], ax
loc_06d8:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    movsx edx, word [eax + LINK_ADDRESS_62]
    cmp edx, -1
    jne short loc_0768
    cmp byte [LINK_ADDRESS_29], 0
    jne short loc_0768
    cmp dword [LINK_ADDRESS_72], 0
    je short loc_0768
    movsx edx, word [LINK_ADDRESS_28]
    cmp edx, -1
    jne short loc_0768
    mov ebx, dword [WINDOWY2]
    push ebx
    mov ecx, dword [WINDOWX2]
    mov edx, 0xa0
    push ecx
    mov esi, dword [WINDOWY1]
    mov edi, dword [WINDOWX1]
    push esi
    movsx eax, word [eax + LINK_ADDRESS_77]
    push edi
    sar eax, 1
    push 3
    sub edx, eax
    push 0
    mov ebx, 0x10000
    mov eax, edx
    push 0
    xor ecx, ecx
    mov edx, 0x640000
    push 0x9db
    shl eax, 0x10
    call LINK_ADDRESS_10
loc_0768:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    test byte [nosplit eax*2 + LINK_ADDRESS_63], 0x10
    je short loc_0790
    call LINK_ADDRESS_78
    jmp short loc_0795
loc_0790:
    call LINK_ADDRESS_79
loc_0795:
    cmp word [LINK_ADDRESS_80], 1
    jne short loc_07d8
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    test byte [nosplit eax*2 + LINK_ADDRESS_63], 1
    jne short loc_07d8
    push LINK_ADDRESS_81
    mov edx, 0x64
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_82
loc_07d8:
    cmp dword [LINK_ADDRESS_83], 0
    je short loc_07ed
    movsx eax, word [LINK_ADDRESS_1]
    call LINK_ADDRESS_84
loc_07ed:
    cmp dword [LINK_ADDRESS_85], 0
    je short loc_07fb
    call LINK_ADDRESS_86
loc_07fb:
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
