; Sound sample dispatch and bookkeeping.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    mov edx, 1
    mov eax, LINK_ADDRESS_1
    call KOPEN4LOAD
    mov ecx, eax
    cmp eax, -1
    je short loc_002f
    mov ebx, 0xfa0
    mov edx, 0xb8000
    call KREAD
    mov eax, ecx
    call KCLOSE
loc_002f:
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
    push ebx
    push edx
    cmp byte [eax], 0
    je short loc_0069
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dword [nosplit eax*2 + LINK_ADDRESS_6], PALETTE
loc_0069:
    cmp word [NUMPLAYERS], 1
    jle short loc_007d
    call 0x10720
    call LINK_ADDRESS_9
loc_007d:
    mov ebx, dword [LINK_ADDRESS_10]
    cmp ebx, 1
    jne short loc_008f
    call LINK_ADDRESS_11
    jmp short loc_009e
loc_008f:
    cmp ebx, 2
    jne short loc_009e
    mov eax, dword [LINK_ADDRESS_12]
    call FCLOSE
loc_009e:
    call LINK_ADDRESS_14
    mov eax, 3
    int 0x10
    call LINK_ADDRESS_15
    mov eax, LINK_ADDRESS_16
    call LINK_ADDRESS_17
    xor eax, eax
    call EXIT
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
loc_00d0:
    push esi
    push edi
    sub esp, 0x2c
    mov esi, eax
    mov edi, edx
loc_00d9:
    call LINK_ADDRESS_19
    test eax, eax
    je near loc_01ba
    xor edx, edx
    call LINK_ADDRESS_20
    mov dl, al
    test dx, dx
    jne short loc_010b
    call LINK_ADDRESS_20
    xor ah, ah
    db 0x66, 0x3d, 0x68, 0x00    ; cmp ax, 0x68
    jne short loc_00d9
    mov eax, 1
    jmp near loc_029c
loc_010b:
    cmp dx, 8
    jne short loc_012f
    mov ax, word [LINK_ADDRESS_21]
    test ax, ax
    jle short loc_00d9
    mov edx, eax
    dec edx
    movsx eax, dx
    mov word [LINK_ADDRESS_21], dx
    mov byte [ebx + eax], 0
    jmp short loc_00d9
loc_012f:
    cmp dx, 0xd
    jne short loc_0152
    xor dl, al
    mov byte [LINK_ADDRESS_22], dl
    xor dh, dh
    mov byte [LINK_ADDRESS_23], dh
    mov eax, 1
    add esp, 0x2c
    pop edi
    pop esi
    ret 4
loc_0152:
    cmp dx, 0x1b
    jne short loc_016d
    xor ah, ah
    mov byte [LINK_ADDRESS_24], ah
    mov eax, 0xffffffff
    add esp, 0x2c
    pop edi
    pop esi
    ret 4
loc_016d:
    cmp dx, 0x20
    jl near loc_00d9
    cmp cx, word [LINK_ADDRESS_21]
    jle near loc_00d9
    cmp dx, 0x7f
    jge near loc_00d9
    movsx eax, dx
    call TOUPPER
    mov edx, eax
    movsx eax, word [LINK_ADDRESS_21]
    mov byte [ebx + eax], dl
    movsx eax, word [LINK_ADDRESS_21]
    mov byte [ebx + eax + 1], 0
    inc word [LINK_ADDRESS_21]
    jmp near loc_00d9
loc_01ba:
    mov edx, dword [esp + 0x38]
    cmp dx, 0x3e7
    je near loc_029a
    cmp dx, 0x3e6
    jne short loc_020d
    xor dl, dl
    jmp short loc_01df
loc_01d4:
    xor eax, eax
    mov al, dl
    mov bh, 0x2a
    inc dl
    mov byte [esp + eax], bh
loc_01df:
    xor eax, eax
    mov bx, word [LINK_ADDRESS_21]
    mov al, dl
    cmp ax, bx
    jl short loc_01d4
    push 0x1a
    xor eax, eax
    xor ecx, ecx
    xor bl, bl
    mov cl, byte [esp + 0x3c]
    mov al, dl
    movsx edx, di
    mov byte [esp + eax + 4], bl
    lea ebx, [esp + 4]
    movsx eax, si
    jmp short loc_021b
loc_020d:
    push 0x1a
    movsx edx, di
    xor ecx, ecx
    movsx eax, si
    mov cl, byte [esp + 0x3c]
loc_021b:
    call 0x10240
    mov esi, eax
    mov eax, dword [TOTALCLOCK]
    shl eax, 4
    and eax, 0x7ff
    movsx eax, word [nosplit eax*2 + SINTABLE]
    mov edx, 4
    sar eax, 0xb
    sub edx, eax
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    mov word [esp + 0x44], dx
    push 0
    movsx eax, dx
    push 0xa
    mov edx, dword [TOTALCLOCK]
    mov ebx, 7
    push 0
    sar edx, 3
    push eax
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    xor ecx, ecx
    mov ebx, 0x8000
    add edx, 0xafd
    movsx eax, si
    push edx
    movsx edx, di
    add eax, 8
    add edx, 4
    shl eax, 0x10
    shl edx, 0x10
    call LINK_ADDRESS_30
loc_029a:
    xor eax, eax
loc_029c:
    add esp, 0x2c
    pop edi
    pop esi
    ret 4
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    test byte [nosplit eax*2 + LINK_ADDRESS_31], 0x40
    je near loc_066b
    mov ebx, dword [LINK_ADDRESS_32]
    cmp ebx, -1
    jne short loc_02ff
    cmp dword [LINK_ADDRESS_33], 3
    jl short loc_02ff
    cmp byte [LINK_ADDRESS_34], 4
    jne near loc_043b
loc_02ff:
    mov byte [LINK_ADDRESS_35], 4
    xor ah, ah
    mov edi, dword [LINK_ADDRESS_33]
    mov byte [LINK_ADDRESS_36], ah
    mov byte [LINK_ADDRESS_37], ah
    cmp edi, 3
    jge short loc_0329
    mov dword [LINK_ADDRESS_32], 2
loc_0329:
    movsx edx, word [MYCONNECTINDEX]
    shl edx, 5
    mov eax, LINK_ADDRESS_37
    add edx, LINK_ADDRESS_38
    call STRCAT
    mov edx, LINK_ADDRESS_40
    mov eax, LINK_ADDRESS_37
    call STRCAT
    mov edx, LINK_ADDRESS_41
    mov eax, LINK_ADDRESS_37
    call STRCAT
    mov eax, LINK_ADDRESS_37
    call STRLEN
    xor dh, dh
    mov ecx, eax
    movsx ebx, ax
    mov eax, LINK_ADDRESS_36
    mov byte [ebx + LINK_ADDRESS_37], dh
    mov edx, LINK_ADDRESS_37
    call STRCAT
    mov eax, dword [LINK_ADDRESS_32]
    cmp eax, dword [LINK_ADDRESS_33]
    jge short loc_039d
    cmp byte [LINK_ADDRESS_34], 4
    jne short loc_03f1
loc_039d:
    mov si, word [CONNECTHEAD]
    jmp short loc_03cb
loc_03a6:
    cmp si, word [MYCONNECTINDEX]
    je short loc_03c0
    mov edx, LINK_ADDRESS_35
    movsx ebx, cx
    movsx eax, si
    inc ebx
    call SENDPACKET
loc_03c0:
    movsx esi, si
    mov si, word [nosplit esi*2 + CONNECTPOINT2]
loc_03cb:
    test si, si
    jge short loc_03a6
    mov eax, LINK_ADDRESS_37
    call 0x107a0
    mov ebp, dword [LINK_ADDRESS_46]
    add ebp, 8
    mov dword [LINK_ADDRESS_46], ebp
    mov dword [LINK_ADDRESS_47], ebp
    jmp short loc_0408
loc_03f1:
    mov ecx, dword [LINK_ADDRESS_32]
    test ecx, ecx
    jl short loc_0408
    mov edx, LINK_ADDRESS_35
    inc ebx
    mov eax, ecx
    call SENDPACKET
loc_0408:
    mov eax, 0xffffffff
    movsx edx, word [MYCONNECTINDEX]
    mov dword [LINK_ADDRESS_32], eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    and byte [nosplit eax*2 + LINK_ADDRESS_31], 0xaf
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_043b:
    cmp ebx, ebx
    jne near loc_0706
    push 0x1a
    mov ebx, LINK_ADDRESS_48
    mov edx, 0x32
    mov eax, 0xa0
    xor ecx, ecx
    call 0x10240
    mov ecx, 0x3a
    mov si, word [CONNECTHEAD]
    jmp near loc_0505
loc_046c:
    cmp si, word [MYCONNECTINDEX]
    jne short loc_04a1
    push 0x1a
    mov ebx, LINK_ADDRESS_49
    mov eax, 0x79
    movsx edi, cx
    push 0
    mov ecx, 0x1a
    lea edx, [edi + 1]
    call 0x10650
    push 0x1a
    mov ebx, LINK_ADDRESS_49
    mov eax, 0x78
    jmp short loc_04ee
loc_04a1:
    movsx eax, si
    mov edx, eax
    shl edx, 5
    add edx, LINK_ADDRESS_38
    push edx
    inc eax
    push eax
    push LINK_ADDRESS_50
    push LINK_ADDRESS_51
    call SPRINTF
    add esp, 0x10
    mov ebx, LINK_ADDRESS_51
    push 0x1a
    movsx edi, cx
    mov ecx, 0x1a
    push 0
    lea edx, [edi + 1]
    mov eax, 0x73
    call 0x10650
    push 0x1a
    mov ebx, LINK_ADDRESS_51
    mov eax, 0x72
loc_04ee:
    mov edx, edi
    xor ecx, ecx
    call 0x105c0
    mov ecx, dword [esp]
    movsx esi, si
    mov si, word [nosplit esi*2 + CONNECTPOINT2]
loc_0505:
    mov eax, ecx
    db 0x05, 0x07, 0x00, 0x00, 0x00    ; add eax, 7
    mov dword [esp], eax
    test si, si
    jge near loc_046c
    push 0x1a
    mov ebx, LINK_ADDRESS_53
    mov eax, 0x75
    movsx esi, cx
    push 0
    mov ecx, 0x1a
    lea edx, [esi + 1]
    call 0x10650
    push 0x1a
    mov ebx, LINK_ADDRESS_53
    mov eax, 0x74
    mov edx, esi
    xor ecx, ecx
    call 0x105c0
    cmp dword [LINK_ADDRESS_54], 0
    jle short loc_055b
    mov ecx, 0x9b
    jmp short loc_0560
loc_055b:
    mov ecx, 0xc0
loc_0560:
    push 0x1a
    mov ebx, LINK_ADDRESS_41
    mov eax, 0xa0
    movsx edx, cx
    xor ecx, ecx
    call 0x10240
    call LINK_ADDRESS_19
    test eax, eax
    je near loc_0706
    call LINK_ADDRESS_20
    mov esi, eax
    db 0x66, 0x3d, 0x41, 0x00    ; cmp ax, 0x41
    je short loc_059c
    db 0x66, 0x3d, 0x61, 0x00    ; cmp ax, 0x61
    je short loc_059c
    db 0x66, 0x3d, 0x0d, 0x00    ; cmp ax, 0xd
    jne short loc_05ab
loc_059c:
    mov eax, dword [LINK_ADDRESS_33]
    mov dword [LINK_ADDRESS_32], eax
    jmp near loc_061d
loc_05ab:
    db 0x66, 0x3d, 0x31, 0x00    ; cmp ax, 0x31
    jge short loc_05c1
    mov edx, dword [LINK_ADDRESS_33]
    movsx ebx, ax
    add edx, 0x31
    cmp ebx, edx
    jg short loc_05ce
loc_05c1:
    movsx eax, si
    sub eax, 0x31
    mov dword [LINK_ADDRESS_32], eax
    jmp short loc_061d
loc_05ce:
    mov edx, dword [LINK_ADDRESS_33]
    mov dword [LINK_ADDRESS_32], edx
    db 0x66, 0x3d, 0x1b, 0x00    ; cmp ax, 0x1b
    jne short loc_0615
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dl, byte [nosplit eax*2 + LINK_ADDRESS_31]
    mov edi, 0xffffffff
    and dl, 0xaf
    mov dword [LINK_ADDRESS_32], edi
    mov byte [nosplit eax*2 + LINK_ADDRESS_31], dl
    jmp short loc_061d
loc_0615:
    xor ah, ah
    mov byte [LINK_ADDRESS_41], ah
loc_061d:
    xor dh, dh
    mov byte [LINK_ADDRESS_55], dh
    mov byte [LINK_ADDRESS_56], dh
    mov byte [LINK_ADDRESS_57], dh
    mov byte [LINK_ADDRESS_58], dh
    mov byte [LINK_ADDRESS_59], dh
    mov byte [LINK_ADDRESS_60], dh
    mov byte [LINK_ADDRESS_61], dh
    mov byte [LINK_ADDRESS_62], dh
    mov byte [LINK_ADDRESS_63], dh
    mov byte [LINK_ADDRESS_24], dh
    mov byte [LINK_ADDRESS_22], dh
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_066b:
    cmp dword [LINK_ADDRESS_54], 0
    jle short loc_067b
    mov ecx, 0x9b
    jmp short loc_0680
loc_067b:
    mov ecx, 0xc0
loc_0680:
    push 1
    mov ebx, LINK_ADDRESS_41
    mov eax, 0xa0
    movsx edx, cx
    mov ecx, 0x1e
    call loc_00d0
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jne short loc_06d0
    xor bh, bh
    mov byte [LINK_ADDRESS_22], bh
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    or byte [nosplit eax*2 + LINK_ADDRESS_31], 0x40
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_06d0:
    cwde
    cmp eax, -1
    jne short loc_06ff
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    and byte [nosplit eax*2 + LINK_ADDRESS_31], 0xaf
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_06ff:
    mov byte [LINK_ADDRESS_64], 1
loc_0706:
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    push ebx
    push ecx
    push edx
    push esi
    sub esp, 4
    mov eax, dword [TOTALCLOCK]
    mov edx, dword [LINK_ADDRESS_65]
    cmp eax, edx
    jg short loc_0735
    lea eax, [edx - 7]
    cmp eax, dword [TOTALCLOCK]
    jle near loc_0807
loc_0735:
    mov eax, dword [TOTALCLOCK]
    add eax, 6
    xor ebx, ebx
    mov dword [LINK_ADDRESS_65], eax
    jmp near loc_07fa
loc_0749:
    movsx ecx, word [LINK_ADDRESS_66]
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    lea ecx, [eax + eax]
    movsx esi, word [ecx + LINK_ADDRESS_67]
    add esi, 0x200
    and esi, 0x7ff
    movsx edx, bx
    movsx esi, word [nosplit esi*2 + SINTABLE]
    movsx eax, word [nosplit edx*2 + LINK_ADDRESS_68]
    sar esi, 9
    add eax, esi
    mov word [nosplit edx*2 + LINK_ADDRESS_68], ax
    mov ax, word [ecx + LINK_ADDRESS_67]
    and ah, 7
    cwde
    movsx ecx, word [nosplit eax*2 + SINTABLE]
    sar ecx, 9
    movsx eax, word [nosplit edx*2 + LINK_ADDRESS_69]
    add eax, ecx
    mov word [nosplit edx*2 + LINK_ADDRESS_69], ax
    movsx eax, word [nosplit edx*2 + LINK_ADDRESS_68]
    sar eax, 6
    movsx ecx, word [nosplit edx*2 + LINK_ADDRESS_70]
    mov byte [esp], al
    lea eax, [ecx*4]
    movsx edx, word [nosplit edx*2 + LINK_ADDRESS_69]
    add eax, ecx
    sar edx, 6
    mov cl, byte [esp]
    mov byte [eax*8 + LINK_ADDRESS_71], dl
    inc ebx
    mov byte [eax*8 + LINK_ADDRESS_72], cl
loc_07fa:
    cmp bx, word [LINK_ADDRESS_73]
    jl near loc_0749
loc_0807:
    add esp, 4
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    nop
