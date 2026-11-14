; Game state updates and tile event handlers.
bits 32
org START_ADDRESS

    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    push ebx
    push ecx
    mov ebx, eax
    and bh, 7
    and dh, 7
    movsx eax, bx
    movsx ecx, dx
    sub eax, ecx
    test eax, eax
    jns short loc_0022
    neg eax
loc_0022:
    cmp eax, 0x400
    jl short loc_004f
    cmp dx, 0x400
    jle short loc_0036
    sub edx, 0x800
loc_0036:
    cmp bx, 0x400
    jle short loc_0043
    sub ebx, 0x800
loc_0043:
    sub edx, 0x800
    sub ebx, 0x800
loc_004f:
    sub edx, ebx
    mov eax, edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
loc_005a:
    push edx
    cmp al, 0xa
    jne short loc_0072
    mov dx, word [LINK_ADDRESS_1]
    inc edx
    mov al, 1
    mov word [LINK_ADDRESS_1], dx
    pop edx
    ret
loc_0072:
    cmp al, 0x20
    je short loc_007a
    cmp al, 0xd
    jne short loc_007e
loc_007a:
    mov al, 1
    pop edx
    ret
loc_007e:
    xor al, al
    pop edx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
loc_008a:
    push edx
    mov ah, al
    xor edx, edx
    inc ah
    mov dl, ah
    test byte [edx + ISTABLE], 0xe0
    jne short loc_00b8
    cmp al, 0x7b
    je short loc_00b8
    cmp al, 0x7d
    je short loc_00b8
    cmp al, 0x2f
    je short loc_00b8
    cmp al, 0x2a
    je short loc_00b8
    cmp al, 0x2d
    je short loc_00b8
    cmp al, 0x5f
    je short loc_00b8
    cmp al, 0x2e
    jne short loc_00bc
loc_00b8:
    mov al, 1
    pop edx
    ret
loc_00bc:
    xor al, al
    pop edx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0xc
    mov edi, eax
    movsx edx, ax
    imul esi, edx, 0x2c
    add esi, SPRITE
    mov bx, word [esi + 0x1a]
    cmp bx, 0xa
    je short loc_0107
    cmp bx, 6
    je short loc_0107
    cmp bx, 2
    je short loc_0107
    cmp bx, 1
    je short loc_0107
    cmp bx, 4
    jne near loc_0273
loc_0107:
    cmp word [esi + 0x1a], 4
    jne short loc_0115
    mov eax, 4
    jmp short loc_011a
loc_0115:
    mov eax, 0x7f
loc_011a:
    push 0x10001
    push eax
    lea eax, [esp + 8]
    movsx ebp, di
    push eax
    lea eax, [ebp*8]
    add eax, ebp
    lea eax, [eax*8]
    sub eax, ebp
    mov dword [esp + 0x14], eax
    mov eax, LINK_ADDRESS_4
    add eax, dword [esp + 0x14]
    lea edx, [eax + 0x13]
    movsx ecx, word [esi + 0x18]
    push edx
    lea edx, [esp + 0x14]
    mov ebx, dword [esi + 8]
    push edx
    add eax, 0x17
    sub ebx, 0x100
    push eax
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    call LINK_ADDRESS_5
    mov eax, dword [esp]
    and eax, 0xc000
    cmp eax, 0xc000
    jne near loc_02bf
    mov edx, dword [esp]
    and edx, 0xfff
    imul eax, edx, 0x2c
    test byte [eax + LINK_ADDRESS_6], 0x30
    jne near loc_02bf
    add eax, SPRITE
    mov dword [esp], edx
    call LINK_ADDRESS_7
    test ax, ax
    je short loc_01e5
    imul eax, dword [esp], 0x2c
    cmp byte [eax + LINK_ADDRESS_8], 1
    je short loc_01e5
    cmp word [esi + 0x1a], 4
    je near loc_02bf
    mov eax, dword [esp + 8]
    mov word [eax + LINK_ADDRESS_9], 0xfffc
    mov edx, 0x10001
    mov eax, ebp
    mov word [esi + 0x20], 0xff00
    call LINK_ADDRESS_10
    jmp near loc_02bf
loc_01e5:
    imul eax, dword [esp], 0x2c
    cmp word [eax + LINK_ADDRESS_11], 0x214
    jne short loc_023d
    mov eax, esi
    call LINK_ADDRESS_7
    test ax, ax
    je short loc_023d
    movsx ebp, di
    lea eax, [ebp*8]
    add eax, ebp
    lea eax, [eax*8]
    sub eax, ebp
    mov edi, 0xfffffffc
    mov edx, 0x10001
    mov word [eax + LINK_ADDRESS_9], di
    mov eax, ebp
    mov word [esi + 0x20], 0xff00
    call LINK_ADDRESS_10
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_023d:
    cmp word [esi + 0x1a], 4
    jne near loc_02bf
    mov ebp, dword [esp]
    imul eax, ebp, 0x2c
    cmp word [eax + LINK_ADDRESS_11], 0x214
    jne short loc_02bf
    movsx eax, word [esi + 0x1e]
    cmp eax, ebp
    jne short loc_02bf
    movsx edx, word [esi + 0x18]
    lea ecx, [edx*4]
    add ecx, edx
    movsx edx, di
    jmp short loc_0280
loc_0273:
    movsx ebx, word [esi + 0x18]
    lea ecx, [ebx*4]
    add ecx, ebx
loc_0280:
    lea ebx, [edx*8]
    add ebx, edx
    lea ebx, [ebx*8]
    lea ecx, [ecx*8]
    sub ebx, edx
    mov eax, dword [ecx + LINK_ADDRESS_12]
    mov dword [ebx + LINK_ADDRESS_13], eax
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + LINK_ADDRESS_14]
    mov dword [ebx + LINK_ADDRESS_15], eax
loc_02bf:
    add esp, 0xc
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
    sub esp, 0xc
    mov edi, eax
    cwde
    imul eax, eax, 0x2c
    mov esi, SPRITE
    add esi, eax
    movsx eax, word [esi + 0x18]
    call LINK_ADDRESS_16
    test eax, eax
    je short loc_02f4
    xor edx, edx
    mov dword [esp + 8], edx
    jmp short loc_0335
loc_02f4:
    movsx eax, word [esi + 0x18]
    call LINK_ADDRESS_17
    test eax, eax
    jne short loc_0319
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_18], 2
    jne short loc_032c
loc_0319:
    mov eax, dword [LINK_ADDRESS_19]
    mov edx, eax
    mov ebx, 6
    sar edx, 0x1f
    idiv ebx
    jmp short loc_0331
loc_032c:
    mov eax, dword [LINK_ADDRESS_19]
loc_0331:
    mov dword [esp + 8], eax
loc_0335:
    mov bx, word [esi + 0x1a]
    cmp bx, 1
    je short loc_0351
    cmp bx, 0xa
    je short loc_0351
    cmp bx, 2
    je short loc_0351
    cmp bx, 6
    jne short loc_039d
loc_0351:
    push 0x10001
    lea eax, [esp + 4]
    push 0x7f
    movsx edx, di
    push eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    add eax, LINK_ADDRESS_4
    lea edx, [eax + 0x13]
    movsx ecx, word [esi + 0x18]
    push edx
    lea edx, [esp + 0x14]
    mov ebx, dword [esi + 8]
    push edx
    add eax, 0x17
    sub ebx, 0x100
    push eax
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    call LINK_ADDRESS_5
    jmp short loc_03ec
loc_039d:
    movsx edx, word [esi + 0x18]
    lea ecx, [edx*4]
    add ecx, edx
    movsx edx, di
    lea ebx, [edx*8]
    add ebx, edx
    lea ebx, [ebx*8]
    lea ecx, [ecx*8]
    sub ebx, edx
    mov eax, dword [ecx + LINK_ADDRESS_12]
    mov dword [ebx + LINK_ADDRESS_13], eax
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + LINK_ADDRESS_14]
    mov dword [ebx + LINK_ADDRESS_15], eax
loc_03ec:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + LINK_ADDRESS_15]
    mov ebx, dword [esi + 8]
    sub eax, 0x100
    cmp eax, ebx
    jle short loc_0458
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_18], 2
    jne short loc_0439
    cmp word [esi + 0x24], 0xc32
    jle short loc_0439
    mov word [esi + 0x24], 0xc48
loc_0439:
    cmp word [esi + 0x24], 0x1800
    jge short loc_044b
    mov eax, dword [esp + 8]
    add word [esi + 0x24], ax
    jmp short loc_0451
loc_044b:
    mov word [esi + 0x24], 0x1800
loc_0451:
    movsx eax, word [esi + 0x24]
    add dword [esi + 8], eax
loc_0458:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + LINK_ADDRESS_15]
    mov edi, dword [esi + 8]
    sub eax, 0x100
    cmp eax, edi
    jg short loc_0488
    mov word [esi + 0x24], 0
    mov dword [esi + 8], eax
loc_0488:
    add esp, 0xc
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
loc_049e:
    mov edx, dword [LINK_ADDRESS_20]
    mov al, byte [edx]
    inc al
    and eax, 0xff
    test byte [eax + ISTABLE], 0xe0
    jne short loc_04d6
    cmp byte [edx], 0xa
    jne short loc_04c2
    inc word [LINK_ADDRESS_1]
loc_04c2:
    mov edx, dword [LINK_ADDRESS_20]
    inc edx
    mov dword [LINK_ADDRESS_20], edx
    cmp byte [edx], 0
    je short loc_0521
    jmp short loc_049e
loc_04d6:
    xor edx, edx
loc_04d8:
    mov eax, dword [LINK_ADDRESS_20]
    mov al, byte [eax]
    and eax, 0xff
    call loc_005a
    mov ebx, dword [LINK_ADDRESS_21]
    shl ebx, 6
    test al, al
    jne short loc_0516
    mov eax, dword [LINK_ADDRESS_20]
    mov ecx, edx
    lea esi, [eax + 1]
    add ecx, ebx
    mov dword [LINK_ADDRESS_20], esi
    mov ebx, dword [LINK_ADDRESS_22]
    mov al, byte [eax]
    inc edx
    mov byte [ecx + ebx], al
    jmp short loc_04d8
loc_0516:
    mov eax, dword [LINK_ADDRESS_22]
    add edx, ebx
    mov byte [edx + eax], 0
loc_0521:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push ebx
    push edx
    mov edx, dword [LINK_ADDRESS_20]
loc_0532:
    xor eax, eax
    mov al, byte [edx]
    call loc_008a
    test al, al
    jne short loc_054c
    mov ah, byte [edx + 1]
    inc edx
    test ah, ah
    jne short loc_0532
    xor eax, eax
    pop edx
    pop ebx
    ret
loc_054c:
    xor ebx, ebx
loc_054e:
    xor eax, eax
    mov al, byte [edx]
    call loc_008a
    test al, al
    je short loc_0567
    inc ebx
    mov al, byte [edx]
    inc edx
    mov byte [ebx + LINK_ADDRESS_23], al
    jmp short loc_054e
loc_0567:
    mov byte [ebx + LINK_ADDRESS_24], al
    xor ebx, ebx
    cmp ebx, 0x76
    jl short loc_057c
    mov eax, 0xffffffff
    pop edx
    pop ebx
    ret
loc_057c:
    mov eax, LINK_ADDRESS_24
    mov edx, dword [ebx*4 + LINK_ADDRESS_25]
    call STRCMP
    test eax, eax
    jne short loc_0596
    mov eax, ebx
    pop edx
    pop ebx
    ret
loc_0596:
    inc ebx
    cmp ebx, 0x76
    jl short loc_057c
    mov eax, 0xffffffff
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
loc_05af:
    mov eax, dword [LINK_ADDRESS_20]
    mov al, byte [eax]
    and eax, 0xff
    call loc_008a
    test al, al
    jne short loc_05f1
    mov eax, dword [LINK_ADDRESS_20]
    cmp byte [eax], 0xa
    jne short loc_05d5
    inc word [LINK_ADDRESS_1]
loc_05d5:
    mov eax, dword [LINK_ADDRESS_20]
    cmp byte [eax], 0
    jne short loc_05e9
    mov eax, 0xffffffff
    jmp near loc_07a3
loc_05e9:
    inc eax
    mov dword [LINK_ADDRESS_20], eax
    jmp short loc_05af
loc_05f1:
    xor ebx, ebx
loc_05f3:
    mov eax, dword [LINK_ADDRESS_20]
    mov al, byte [ebx + eax]
    and eax, 0xff
    call loc_008a
    test al, al
    je short loc_061b
    mov eax, dword [LINK_ADDRESS_20]
    inc ebx
    mov al, byte [ebx + eax - 1]
    mov byte [ebx + LINK_ADDRESS_23], al
    jmp short loc_05f3
loc_061b:
    xor ecx, ecx
    mov byte [ebx + LINK_ADDRESS_24], al
    jmp short loc_067e
loc_0625:
    mov eax, LINK_ADDRESS_24
    mov edx, dword [ecx*4 + LINK_ADDRESS_25]
    call STRCMP
    test eax, eax
    jne short loc_0666
    mov eax, dword [LINK_ADDRESS_27]
    mov dword [eax], ecx
    mov esi, dword [LINK_ADDRESS_20]
    mov edi, dword [LINK_ADDRESS_27]
    mov eax, ecx
    add esi, ebx
    add edi, 4
    mov dword [LINK_ADDRESS_20], esi
    mov dword [LINK_ADDRESS_27], edi
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0666:
    mov eax, LINK_ADDRESS_24
    cmp eax, LINK_ADDRESS_28
    jne short loc_067d
    mov eax, 0x75
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_067d:
    inc ecx
loc_067e:
    cmp ecx, 0x76
    jl short loc_0625
    mov edx, dword [LINK_ADDRESS_20]
    add edx, ebx
    mov ch, byte [LINK_ADDRESS_24]
    mov dword [LINK_ADDRESS_20], edx
    cmp ch, 0x7b
    jne short loc_06bc
    cmp byte [LINK_ADDRESS_29], 0
    je short loc_06bc
    push LINK_ADDRESS_29
    movsx eax, word [LINK_ADDRESS_1]
    push eax
    push LINK_ADDRESS_30
    jmp near loc_0788
loc_06bc:
    cmp byte [LINK_ADDRESS_24], 0x7d
    jne short loc_06e5
    cmp byte [LINK_ADDRESS_29], 0
    je short loc_06e5
    push LINK_ADDRESS_29
    movsx eax, word [LINK_ADDRESS_1]
    push eax
    push LINK_ADDRESS_31
    jmp near loc_0788
loc_06e5:
    mov dh, byte [LINK_ADDRESS_24]
    cmp dh, 0x2f
    jne short loc_0718
    cmp dh, byte [LINK_ADDRESS_29]
    jne short loc_0718
    cmp byte [LINK_ADDRESS_32], 0
    je short loc_0718
    push LINK_ADDRESS_32
    movsx eax, word [LINK_ADDRESS_1]
    push eax
    push LINK_ADDRESS_33
    jmp near loc_0788
loc_0718:
    cmp byte [LINK_ADDRESS_24], 0x2f
    jne short loc_0747
    cmp byte [LINK_ADDRESS_29], 0x2a
    jne short loc_0747
    cmp byte [LINK_ADDRESS_32], 0
    je short loc_0747
    push LINK_ADDRESS_32
    movsx eax, word [LINK_ADDRESS_1]
    push eax
    push LINK_ADDRESS_34
    jmp short loc_0788
loc_0747:
    cmp byte [LINK_ADDRESS_24], 0x2a
    jne short loc_0776
    cmp byte [LINK_ADDRESS_29], 0x2f
    jne short loc_0776
    cmp byte [LINK_ADDRESS_32], 0
    je short loc_0776
    push LINK_ADDRESS_32
    movsx eax, word [LINK_ADDRESS_1]
    push eax
    push LINK_ADDRESS_35
    jmp short loc_0788
loc_0776:
    push LINK_ADDRESS_24
    movsx eax, word [LINK_ADDRESS_1]
    push eax
    push LINK_ADDRESS_36
loc_0788:
    call PRINTF
    add esp, 0xc
    mov bl, byte [LINK_ADDRESS_38]
    inc bl
    mov eax, 0xffffffff
    mov byte [LINK_ADDRESS_38], bl
loc_07a3:
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
    push ebp
loc_07af:
    mov eax, dword [LINK_ADDRESS_20]
    mov al, byte [eax]
    and eax, 0xff
    call loc_008a
    test al, al
    jne short loc_07ed
    mov eax, dword [LINK_ADDRESS_20]
    cmp byte [eax], 0xa
    jne short loc_07d5
    inc word [LINK_ADDRESS_1]
loc_07d5:
    mov edx, dword [LINK_ADDRESS_20]
    inc edx
    mov dword [LINK_ADDRESS_20], edx
    cmp byte [edx], 0
    je near loc_0962
    jmp short loc_07af
loc_07ed:
    xor ecx, ecx
loc_07ef:
    mov eax, dword [LINK_ADDRESS_20]
    mov al, byte [ecx + eax]
    and eax, 0xff
    call loc_008a
    test al, al
    je short loc_0817
    mov eax, dword [LINK_ADDRESS_20]
    inc ecx
    mov al, byte [ecx + eax - 1]
    mov byte [ecx + LINK_ADDRESS_23], al
    jmp short loc_07ef
loc_0817:
    xor ebx, ebx
    mov byte [ecx + LINK_ADDRESS_24], al
    cmp ebx, 0x76
    jl short loc_082b
    xor ebx, ebx
    jmp near loc_08dc
loc_082b:
    mov esi, dword [LINK_ADDRESS_21]
    mov eax, dword [LINK_ADDRESS_22]
    shl esi, 6
    mov edx, dword [ebx*4 + LINK_ADDRESS_25]
    add eax, esi
    call STRCMP
    test eax, eax
    jne short loc_0885
    mov eax, dword [LINK_ADDRESS_21]
    mov edx, dword [LINK_ADDRESS_22]
    shl eax, 6
    add eax, edx
    push eax
    movsx eax, word [LINK_ADDRESS_1]
    push eax
    push LINK_ADDRESS_39
    inc byte [LINK_ADDRESS_38]
    call PRINTF
    mov esi, dword [LINK_ADDRESS_20]
    add esi, ecx
    add esp, 0xc
    mov dword [LINK_ADDRESS_20], esi
loc_0885:
    inc ebx
    cmp ebx, 0x76
    jl short loc_082b
    xor ebx, ebx
    jmp short loc_08dc
loc_088f:
    mov edx, ebx
    mov eax, dword [LINK_ADDRESS_22]
    shl edx, 6
    add edx, eax
    mov eax, LINK_ADDRESS_24
    call STRCMP
    test eax, eax
    jne short loc_08db
    mov eax, dword [LINK_ADDRESS_40]
    mov edx, dword [LINK_ADDRESS_27]
    mov eax, dword [eax + ebx*4]
    mov dword [edx], eax
    mov ebx, dword [LINK_ADDRESS_27]
    mov esi, dword [LINK_ADDRESS_20]
    add ebx, 4
    add esi, ecx
    mov dword [LINK_ADDRESS_27], ebx
    mov dword [LINK_ADDRESS_20], esi
    jmp near loc_0962
loc_08db:
    inc ebx
loc_08dc:
    cmp ebx, dword [LINK_ADDRESS_21]
    jl short loc_088f
    mov eax, dword [LINK_ADDRESS_20]
    mov dl, byte [eax]
    inc dl
    and edx, 0xff
    test byte [edx + ISTABLE], 0x20
    jne short loc_0935
    cmp byte [eax], 0x2d
    je short loc_0935
    push LINK_ADDRESS_24
    movsx eax, word [LINK_ADDRESS_1]
    push eax
    push LINK_ADDRESS_41
    call PRINTF
    inc byte [LINK_ADDRESS_38]
    mov edx, dword [LINK_ADDRESS_20]
    add edx, ecx
    add esp, 0xc
    mov dword [LINK_ADDRESS_20], edx
    pop ebp
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0935:
    mov eax, dword [LINK_ADDRESS_20]
    call ATOL
    mov edx, dword [LINK_ADDRESS_27]
    mov dword [edx], eax
    mov ebp, dword [LINK_ADDRESS_27]
    mov eax, dword [LINK_ADDRESS_20]
    add ebp, 4
    add eax, ecx
    mov dword [LINK_ADDRESS_27], ebp
    mov dword [LINK_ADDRESS_20], eax
loc_0962:
    pop ebp
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
