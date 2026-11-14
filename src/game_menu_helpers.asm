; Menu and player-state helper routines.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    movsx edx, ax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [eax + LINK_ADDRESS_1]
    test edx, edx
    jne near loc_0179
    mov ebx, dword [WINDOWY2]
    push ebx
    mov ecx, dword [WINDOWX2]
    push ecx
    mov esi, dword [WINDOWY1]
    push esi
    mov edi, dword [WINDOWX1]
    push edi
    push 2
    push edx
    push edx
    mov eax, 0x180000
    mov ebx, 0x10000
    push 0x9b2
    xor ecx, ecx
    mov edx, 0x210000
    call LINK_ADDRESS_6
    mov ebp, dword [WINDOWY2]
    push ebp
    mov eax, dword [WINDOWX2]
    push eax
    mov edx, dword [WINDOWY1]
    push edx
    mov ebx, dword [WINDOWX1]
    push ebx
    push 2
    push 0
    push 0
    xor ecx, ecx
    mov eax, 0x1260000
    push 0x9b3
    mov edx, 0x220000
    mov ebx, 0x10000
    call LINK_ADDRESS_6
    mov ecx, dword [WINDOWY2]
    push ecx
    mov esi, dword [WINDOWX2]
    push esi
    mov edi, dword [WINDOWY1]
    push edi
    mov ebp, dword [WINDOWX1]
    push ebp
    push 6
    push 0
    push 0
    mov ebx, 0x10000
    mov edx, 0xa30000
    push 0x9b3
    mov eax, 0x160000
    mov ecx, 0x200
    call LINK_ADDRESS_6
    mov eax, dword [WINDOWY2]
    push eax
    mov edx, dword [WINDOWX2]
    push edx
    mov ebx, dword [WINDOWY1]
    push ebx
    mov ecx, dword [WINDOWX1]
    push ecx
    push 2
    push 0
    push 0
    mov eax, 0x12c0000
    mov edx, 0xa30000
    push 0x9b3
    mov ebx, 0x10000
    mov ecx, 0x200
    call LINK_ADDRESS_6
    mov esi, dword [TOTALCLOCK]
    test si, 0x10
    je near loc_01e7
    mov edi, dword [WINDOWY2]
    push edi
    mov ebp, dword [WINDOWX2]
    push ebp
    mov eax, dword [WINDOWY1]
    push eax
    mov edx, dword [WINDOWX1]
    push edx
    push 2
    push 0
    push 0
    mov ebx, 0x10000
    xor ecx, ecx
    push 0x9b4
    mov eax, 0x2e0000
    mov edx, 0x200000
    call LINK_ADDRESS_6
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0179:
    mov al, byte [TOTALCLOCK]
    add al, al
    and al, 0x30
    xor edi, edi
    mov byte [esp], al
    jmp short loc_01df
loc_0189:
    xor esi, esi
    jmp short loc_01d4
loc_018d:
    mov ebx, dword [WINDOWY2]
    push ebx
    mov ecx, dword [WINDOWX2]
    push ecx
    mov ebp, dword [WINDOWY1]
    push ebp
    mov eax, dword [WINDOWX1]
    push eax
    xor eax, eax
    mov al, byte [esp + 0x10]
    add eax, 2
    push eax
    mov edx, esi
    push 0
    shl edx, 0x10
    mov ebx, 0x10000
    push 0
    xor ecx, ecx
    mov eax, edi
    push 0x15f
    shl eax, 0x10
    add esi, 0x40
    call LINK_ADDRESS_6
loc_01d4:
    cmp esi, 0xc8
    jl short loc_018d
    add edi, 0x40
loc_01df:
    cmp edi, 0x18a
    jl short loc_0189
loc_01e7:
    add esp, 4
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
    push esi
    push edi
    push ebp
    sub esp, 0x10
    mov ebp, eax
    mov dword [esp], edx
    mov dword [esp + 0xc], ebx
    movsx eax, cx
    shl eax, 5
    mov ax, word [eax + LINK_ADDRESS_8]
    movsx edx, ax
    mov dword [esp + 8], eax
    cmp edx, -1
    je near loc_02e9
    lea esi, [edx*4]
    add esi, edx
    lea esi, [esi*8]
    mov edx, dword [esi + LINK_ADDRESS_9]
    mov ebx, dword [esi + LINK_ADDRESS_10]
    sub edx, ebx
    movsx ecx, word [esp + 0x20]
    mov eax, edx
    sar edx, 0x1f
    idiv ecx
    mov esi, ebx
    mov dword [esp + 4], eax
    jmp short loc_02ce
loc_025e:
    push 5
    push -1
    push 0
    call LINK_ADDRESS_11
    xor ah, ah
    and al, 0x1f
    db 0x05, 0x10, 0x00, 0x00, 0x00    ; add eax, 0x10
    cwde
    mov edx, dword [esp + 0x18]
    push eax
    add edx, 0x80
    call LINK_ADDRESS_11
    xor ah, ah
    sub edx, eax
    movsx eax, dx
    push eax
    push 0x24
    push 0x24
    push -0x20
    call LINK_ADDRESS_11
    mov edx, eax
    mov ecx, 3
    sar edx, 0x1f
    idiv ecx
    mov eax, esi
    and eax, edx
    add eax, 0x407
    cwde
    push eax
    mov ebx, dword [esp + 0x24]
    mov ecx, esi
    call LINK_ADDRESS_11
    and eax, 0x1fff
    mov edx, ebp
    sub ecx, eax
    mov eax, edi
    mov edi, dword [esp + 0x28]
    call LINK_ADDRESS_12
    add esi, edi
loc_02ce:
    movsx edi, word [esp + 8]
    lea eax, [edi*4]
    add eax, edi
    cmp esi, dword [eax*8 + LINK_ADDRESS_9]
    jl near loc_025e
loc_02e9:
    add esp, 0x10
    pop ebp
    pop edi
    pop esi
    ret 4
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8b, 0xc0    ; mov eax, eax
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x14
    mov dword [esp + 0x10], eax
    mov dword [esp + 0xc], 0xffffffff
    test dx, dx
    jge near loc_03c5
    movsx esi, bx
    dec esi
    test esi, esi
    jge short loc_0329
    jmp near loc_0556
loc_0329:
    movsx edi, word [esp + 0x10]
    imul ecx, edi, 0x2c
    mov dx, word [ecx + LINK_ADDRESS_13]
    call LINK_ADDRESS_11
    sub edx, 0x100
    and ah, 1
    push 5
    add eax, edx
    push edi
    add ah, 4
    mov ebx, 0x400
    mov edx, eax
    call LINK_ADDRESS_11
    and eax, 0x3ff
    sub ebx, eax
    push ebx
    call LINK_ADDRESS_11
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x20, 0x00, 0x00, 0x00    ; add eax, 0x20
    cwde
    push eax
    movsx eax, dx
    mov ebx, 3
    push eax
    mov edx, esi
    mov eax, esi
    sar edx, 0x1f
    idiv ebx
    push 0x24
    push 0x24
    movsx edi, word [ecx + LINK_ADDRESS_14]
    lea eax, [edx + 0x407]
    push -0x20
    cwde
    mov ebx, dword [ecx + LINK_ADDRESS_15]
    push eax
    mov eax, dword [ecx + LINK_ADDRESS_16]
    mov edx, dword [ecx + SPRITE]
    mov ecx, eax
    mov eax, edi
    dec esi
    call LINK_ADDRESS_12
    test esi, esi
    jge near loc_0329
    add esp, 0x14
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_03c5:
    movsx eax, dx
    shl eax, 5
    mov ebp, dword [eax + WALL]
    mov edi, dword [eax + LINK_ADDRESS_19]
    movsx eax, word [eax + LINK_ADDRESS_20]
    movsx ecx, bx
    shl eax, 5
    lea esi, [ecx + 1]
    mov edx, dword [eax + WALL]
    mov eax, dword [eax + LINK_ADDRESS_19]
    sub edx, ebp
    sub eax, edi
    mov dword [esp + 4], edx
    mov ebx, eax
    mov dword [esp + 8], eax
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    mov ebx, edx
    sub ebp, eax
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    add edi, eax
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    mov dword [esp + 4], eax
    mov eax, dword [esp + 8]
    mov edx, eax
    sar edx, 0x1f
    idiv esi
    mov dword [esp + 8], eax
    mov esi, ecx
    test esi, esi
    jg short loc_043f
    add esp, 0x14
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_043f:
    mov edx, dword [esp + 4]
    mov ebx, dword [esp + 8]
    add ebp, edx
    add edi, ebx
    lea ebx, [esp + 0xc]
    mov edx, edi
    mov eax, ebp
    call UPDATESECTOR
    mov eax, dword [esp + 0xc]
    test ax, ax
    jl near loc_054d
    movsx edx, ax
    call LINK_ADDRESS_11
    lea ecx, [edx*4]
    movsx ebx, word [esp + 0xc]
    add ecx, edx
    mov edx, eax
    lea eax, [ebx*4]
    add ebx, eax
    lea ebx, [ebx*8]
    mov eax, dword [ebx + LINK_ADDRESS_10]
    sub eax, dword [ebx + LINK_ADDRESS_9]
    lea ecx, [ecx*8]
    test eax, eax
    jns short loc_04a6
    neg eax
loc_04a6:
    mov ecx, dword [ecx + LINK_ADDRESS_9]
    and eax, edx
    sub ecx, eax
    cmp ecx, 0xffffe000
    jl short loc_04c0
    cmp ecx, 0x2000
    jle short loc_04e0
loc_04c0:
    movsx eax, word [esp + 0x10]
    imul eax, eax, 0x2c
    mov ecx, dword [eax + LINK_ADDRESS_16]
    call LINK_ADDRESS_11
    sub ecx, 0x2000
    and eax, 0x3fff
    add ecx, eax
loc_04e0:
    movsx eax, word [esp + 0x10]
    imul ebx, eax, 0x2c
    push 5
    push eax
    mov dx, word [ebx + LINK_ADDRESS_13]
    call LINK_ADDRESS_11
    and eax, 0x3ff
    neg eax
    push eax
    call LINK_ADDRESS_11
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x20, 0x00, 0x00, 0x00    ; add eax, 0x20
    cwde
    sub edx, 0x400
    push eax
    movsx eax, dx
    push eax
    mov edx, esi
    mov eax, 3
    sar edx, 0x1f
    mov dword [esp + 0x14], eax
    mov eax, esi
    idiv dword [esp + 0x14]
    push 0x24
    push 0x24
    add edx, 0x407
    push -0x20
    movsx eax, dx
    push eax
    mov edx, ebp
    movsx eax, word [ebx + LINK_ADDRESS_14]
    mov ebx, edi
    call LINK_ADDRESS_12
loc_054d:
    dec esi
    test esi, esi
    jg near loc_043f
loc_0556:
    add esp, 0x14
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 4
    mov dword [esp], eax
    movsx esi, dx
    test esi, esi
    jg short loc_0579
    add esp, 4
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_0579:
    movsx edx, word [esp]
    imul edi, edx, 0x2c
    call LINK_ADDRESS_11
    mov ebx, eax
    call LINK_ADDRESS_11
    mov ecx, eax
    and ecx, 0x10
    push 5
    shl ecx, 8
    mov eax, dword [edi + LINK_ADDRESS_16]
    push edx
    sub eax, ecx
    mov edx, 0xfffffe00
    mov ecx, eax
    call LINK_ADDRESS_11
    and eax, 0x7ff
    sub edx, eax
    push edx
    call LINK_ADDRESS_11
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x20, 0x00, 0x00, 0x00    ; add eax, 0x20
    cwde
    and ebx, 0x7ff
    push eax
    movsx eax, bx
    push eax
    push 0x24
    push 0x24
    mov edx, esi
    call LINK_ADDRESS_11
    and al, 0xf
    sar edx, 0x1f
    movsx eax, al
    mov ebx, 3
    push eax
    mov eax, esi
    idiv ebx
    lea eax, [edx + 0x407]
    mov ebx, dword [edi + LINK_ADDRESS_15]
    cwde
    mov edx, dword [edi + SPRITE]
    push eax
    movsx eax, word [edi + LINK_ADDRESS_14]
    call LINK_ADDRESS_12
    cwde
    imul edx, eax, 0x2c
    mov al, byte [edi + LINK_ADDRESS_22]
    dec esi
    mov byte [edx + LINK_ADDRESS_22], al
    test esi, esi
    jg near loc_0579
    add esp, 4
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x20
    mov dword [esp + 0x14], eax
    mov dword [esp + 0x18], edx
    mov dword [esp + 0xc], ebx
    movsx edx, dx
    lea eax, [edx*4]
    add eax, edx
    mov dx, word [eax*8 + SECTOR]
    mov ax, word [eax*8 + LINK_ADDRESS_24]
    add eax, edx
    mov dword [esp + 0x1c], edx
    mov dword [esp + 0x10], eax
    jmp near loc_0744
loc_066e:
    shl ebx, 5
    mov ebp, dword [ebx + WALL]
    mov edx, dword [ebx + LINK_ADDRESS_25]
    movsx esi, word [esp + 0xc]
    sub edx, ebp
    lea ecx, [esi + 1]
    mov eax, edx
    sar edx, 0x1f
    idiv ecx
    mov edi, dword [ebx + LINK_ADDRESS_19]
    mov edx, dword [ebx + LINK_ADDRESS_26]
    sub edx, edi
    mov dword [esp + 8], eax
    mov eax, edx
    sar edx, 0x1f
    idiv ecx
    mov dword [esp + 4], eax
    jmp near loc_0738
loc_06b0:
    call LINK_ADDRESS_11
    mov edx, dword [esp + 8]
    mov ebx, dword [esp + 4]
    and ah, 7
    add edi, ebx
    mov ebx, eax
    movsx eax, word [esp + 0x18]
    add ebp, edx
    mov dword [esp], eax
    mov edx, eax
    lea eax, [eax*4]
    add edx, eax
    call LINK_ADDRESS_11
    and eax, 0xf
    lea edx, [edx*8]
    shl eax, 8
    mov ecx, dword [edx + LINK_ADDRESS_10]
    push 5
    add ecx, eax
    movsx eax, word [esp + 0x18]
    push eax
    push 0
    call LINK_ADDRESS_11
    xor ah, ah
    and al, 0x1f
    mov edx, esi
    cwde
    sar edx, 0x1f
    push eax
    movsx eax, bx
    mov ebx, 3
    push eax
    mov eax, esi
    idiv ebx
    push 0x24
    push 0x24
    add edx, 0x407
    push -0x20
    movsx eax, dx
    mov ebx, edi
    push eax
    mov edx, ebp
    mov eax, dword [esp + 0x24]
    dec esi
    call LINK_ADDRESS_12
loc_0738:
    test esi, esi
    jg near loc_06b0
    inc dword [esp + 0x1c]
loc_0744:
    movsx eax, word [esp + 0x10]
    movsx ebx, word [esp + 0x1c]
    dec eax
    cmp ebx, eax
    jl near loc_066e
    add esp, 0x20
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    nop
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x14
    mov dword [esp + 0x10], eax
    mov eax, ebx
    mov dword [esp + 0xc], 0xffffffff
    test dx, dx
    jge near loc_083d
    movsx esi, ax
    dec esi
    test esi, esi
    jge short loc_078b
    jmp near loc_09b5
loc_078b:
    call LINK_ADDRESS_11
    push 5
    movsx ecx, word [esp + 0x14]
    and ah, 7
    push ecx
    mov ebx, 0x400
    mov edx, eax
    call LINK_ADDRESS_11
    and eax, 0x7ff
    sub ebx, eax
    push ebx
    call LINK_ADDRESS_11
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x20, 0x00, 0x00, 0x00    ; add eax, 0x20
    cwde
    push eax
    movsx eax, dx
    mov ebx, 3
    push eax
    mov edx, esi
    mov eax, esi
    sar edx, 0x1f
    idiv ebx
    imul ecx, ecx, 0x2c
    push 0x24
    push 0x24
    add edx, 0x407
    push -0x20
    movsx eax, dx
    push eax
    call LINK_ADDRESS_11
    and eax, 0x3f00
    mov edx, dword [ecx + LINK_ADDRESS_16]
    mov ebx, dword [ecx + LINK_ADDRESS_15]
    sub edx, eax
    movsx edi, word [ecx + LINK_ADDRESS_14]
    mov eax, edx
    mov edx, dword [ecx + SPRITE]
    mov ecx, eax
    mov eax, edi
    call LINK_ADDRESS_12
    mov edx, eax
    call LINK_ADDRESS_11
    mov bl, al
    movsx eax, dx
    imul eax, eax, 0x2c
    and bl, 0xf
    dec esi
    mov byte [eax + LINK_ADDRESS_22], bl
    test esi, esi
    jge near loc_078b
    add esp, 0x14
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_083d:
    movsx ebx, ax
    movsx eax, dx
    shl eax, 5
    movsx ecx, word [eax + LINK_ADDRESS_20]
    shl ecx, 5
    mov ebp, dword [eax + WALL]
    mov edx, dword [ecx + WALL]
    lea esi, [ebx + 1]
    sub edx, ebp
    mov edi, dword [eax + LINK_ADDRESS_19]
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    mov edx, dword [ecx + LINK_ADDRESS_19]
    sub edx, edi
    mov dword [esp], eax
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    mov dword [esp + 8], eax
    mov esi, ebx
    test esi, esi
    jg short loc_0892
    add esp, 0x14
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_0892:
    mov edx, dword [esp]
    mov ebx, dword [esp + 8]
    add ebp, edx
    add edi, ebx
    lea ebx, [esp + 0xc]
    mov edx, edi
    mov eax, ebp
    call UPDATESECTOR
    movsx edx, word [esp + 0xc]
    call LINK_ADDRESS_11
    lea ecx, [edx*4]
    movsx ebx, word [esp + 0xc]
    add ecx, edx
    mov edx, eax
    lea eax, [ebx*4]
    add ebx, eax
    lea ebx, [ebx*8]
    mov eax, dword [ebx + LINK_ADDRESS_10]
    sub eax, dword [ebx + LINK_ADDRESS_9]
    lea ecx, [ecx*8]
    test eax, eax
    jns short loc_08ed
    neg eax
loc_08ed:
    mov ecx, dword [ecx + LINK_ADDRESS_9]
    and eax, edx
    sub ecx, eax
    cmp ecx, 0xffffe000
    jl short loc_0907
    cmp ecx, 0x2000
    jle short loc_0927
loc_0907:
    movsx eax, word [esp + 0x10]
    imul eax, eax, 0x2c
    mov ecx, dword [eax + LINK_ADDRESS_16]
    call LINK_ADDRESS_11
    sub ecx, 0x2000
    and eax, 0x3fff
    add ecx, eax
loc_0927:
    movsx eax, word [esp + 0x10]
    imul ebx, eax, 0x2c
    push 5
    push eax
    mov dx, word [ebx + LINK_ADDRESS_13]
    call LINK_ADDRESS_11
    and eax, 0x7ff
    neg eax
    push eax
    call LINK_ADDRESS_11
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x20, 0x00, 0x00, 0x00    ; add eax, 0x20
    cwde
    sub edx, 0x400
    push eax
    movsx eax, dx
    push eax
    mov edx, esi
    mov eax, 3
    sar edx, 0x1f
    mov dword [esp + 0x18], eax
    mov eax, esi
    idiv dword [esp + 0x18]
    push 0x24
    push 0x24
    add edx, 0x407
    push -0x20
    movsx eax, dx
    push eax
    mov edx, ebp
    movsx eax, word [ebx + LINK_ADDRESS_14]
    mov ebx, edi
    call LINK_ADDRESS_12
    mov edx, eax
    call LINK_ADDRESS_11
    mov bl, al
    movsx eax, dx
    imul eax, eax, 0x2c
    and bl, 7
    dec esi
    mov byte [eax + LINK_ADDRESS_22], bl
    test esi, esi
    jg near loc_0892
loc_09b5:
    add esp, 0x14
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push edx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_27
    mov eax, 1
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 2
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 3
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 4
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 5
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 6
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 7
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 8
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 9
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0xa
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0xb
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0xc
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0xd
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0xe
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0xf
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x10
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x11
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x12
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x13
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x14
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x15
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x16
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x17
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x18
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x19
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x1a
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x1b
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x1c
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x1d
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x1e
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x1f
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x20
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x21
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x22
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x23
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x24
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x25
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x26
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x27
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x28
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x29
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x2a
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x2b
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x2c
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x2d
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x2e
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x2f
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x30
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x31
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x32
    xor edx, edx
    call LINK_ADDRESS_27
    mov eax, 0x33
    xor edx, edx
    call LINK_ADDRESS_27
    pop edx
    ret
    mov eax, dword [TOTALCLOCK]
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    push LINK_ADDRESS_28
    call PRINTF
    add esp, 4
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push LINK_ADDRESS_30
    call PRINTF
    add esp, 4
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push LINK_ADDRESS_31
    call PRINTF
    add esp, 4
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push LINK_ADDRESS_32
    call PRINTF
    add esp, 4
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push LINK_ADDRESS_33
    call PRINTF
    add esp, 4
    ret
    add byte [eax], al
