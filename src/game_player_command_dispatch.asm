; Player command dispatch.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0xc
    mov dword [esp + 8], eax
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov edx, dword [eax + LINK_ADDRESS_1]
    test edx, edx
    je near loc_0128
    lea eax, [edx*4]
    xor esi, esi
    mov dword [esp + 4], eax
    jmp near loc_0104
loc_0042:
    mov eax, dword [edx + LINK_ADDRESS_1]
    add eax, esi
    shl eax, 5
    and eax, 0x7ff
    mov ax, word [nosplit eax*2 + SINTABLE]
    cwde
    test eax, eax
    jns short loc_0061
    neg eax
loc_0061:
    mov edi, eax
    mov eax, dword [edx + LINK_ADDRESS_1]
    add eax, esi
    mov ecx, eax
    shl ecx, 9
    shl eax, 6
    add ecx, 0x1000
    and eax, 0x7ff
    mov dword [esp], ecx
    movsx ecx, word [nosplit eax*2 + SINTABLE]
    lea eax, [ebx*4]
    add eax, ebx
    movsx ebp, byte [nosplit eax*2 + LINK_ADDRESS_3]
    mov eax, dword [YDIM]
    dec eax
    sar edi, 5
    push eax
    mov eax, dword [XDIM]
    sar ecx, 0xa
    dec eax
    mov ebx, esi
    push eax
    shl ebx, 8
    push 0
    sub ecx, ebp
    mov eax, dword [esp + 0xc]
    push 0
    mov ebp, ecx
    sub eax, ebx
    push 2
    mov ecx, 0x100
    mov ebx, eax
    push 0
    lea eax, [esi*4]
    sub ecx, edi
    add eax, edx
    push 0
    mov edi, dword [esp + 0x20]
    mov edx, dword [eax + LINK_ADDRESS_6]
    push 0x665
    add edx, 0xc8
    mov eax, dword [eax + LINK_ADDRESS_7]
    sub edx, edi
    add eax, ebp
    shl edx, 0x10
    shl eax, 0x10
    inc esi
    call LINK_ADDRESS_8
loc_0104:
    movsx ebx, word [esp + 8]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea edx, [eax + eax]
    cmp esi, dword [edx + LINK_ADDRESS_9]
    jl near loc_0042
loc_0128:
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
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov edi, eax
    mov esi, edx
    movsx edx, dx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov cx, word [nosplit eax*2 + LINK_ADDRESS_10]
    cmp cx, 0x20
    jle short loc_0172
    mov ecx, 0x20
loc_0172:
    test cx, cx
    jg short loc_017e
    xor al, al
    jmp near loc_02b2
loc_017e:
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ax, word [nosplit eax*2 + LINK_ADDRESS_11]
    cwde
    test eax, eax
    jns short loc_01a0
    neg eax
loc_01a0:
    mov edx, eax
    mov ebx, 9
    sar edx, 0x1f
    idiv ebx
    mov dword [esp], eax
    movsx eax, cx
    shl eax, 6
    add eax, 0x200
    and eax, 0x7ff
    movsx eax, word [nosplit eax*2 + SINTABLE]
    mov ebx, 0x10000
    lea eax, [eax*4]
    sub ebx, eax
    cmp ebx, 0x161f4
    jle short loc_01e2
    mov ebx, 0x161f4
loc_01e2:
    cmp ebx, 0x9fd8
    jge short loc_01ef
    mov ebx, 0x9d62
loc_01ef:
    movsx eax, cx
    shl eax, 7
    add eax, 0x300
    and eax, 0x7ff
    movsx eax, word [nosplit eax*2 + SINTABLE]
    sar eax, 9
    movsx edx, si
    lea ebp, [eax + 0xc2]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    movsx edx, word [eax + LINK_ADDRESS_12]
    imul edx, edx, 0x2c
    cmp byte [edx + LINK_ADDRESS_13], 1
    jne short loc_023f
    mov eax, 1
    jmp short loc_0258
loc_023f:
    movsx edx, word [eax + LINK_ADDRESS_14]
    lea eax, [edx*4]
    add eax, edx
    mov al, byte [eax*8 + LINK_ADDRESS_15]
    xor ah, ah
loc_0258:
    mov edx, dword [YDIM]
    dec edx
    push edx
    mov edx, dword [XDIM]
    dec edx
    push edx
    push 0
    cwde
    push 0
    movsx esi, si
    push 2
    movsx edx, word [esp + 0x14]
    push eax
    movsx eax, di
    add edx, ebp
    push eax
    lea eax, [esi*4]
    shl edx, 0x10
    add esi, eax
    movsx eax, cx
    movsx esi, byte [nosplit esi*2 + LINK_ADDRESS_3]
    neg eax
    sar esi, 4
    add eax, 0xde
    push 0x668
    add eax, esi
    xor ecx, ecx
    shl eax, 0x10
    call LINK_ADDRESS_8
    mov al, 1
loc_02b2:
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
    push ebx
    push ecx
    push esi
    push edi
    sub esp, 0x20
    mov word [esp + 0x18], ax
    mov dword [esp + 0x1c], edx
    movsx edx, dx
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    mov ecx, 6
    add ebx, ebx
    mov edi, esp
    mov esi, LINK_ADDRESS_16
    mov dx, word [ebx + LINK_ADDRESS_17]
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    cmp dx, 0xb
    jg short loc_0319
    test dx, dx
    je short loc_0319
    movsx eax, word [ebx + LINK_ADDRESS_12]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_18], 0
    jg short loc_0320
loc_0319:
    xor al, al
    jmp near loc_0416
loc_0320:
    movsx eax, dx
    movsx esi, word [esp + eax*2]
    mov ax, word [ebx + LINK_ADDRESS_11]
    cwde
    test eax, eax
    jns short loc_0335
    neg eax
loc_0335:
    mov edx, eax
    mov edi, 9
    sar edx, 0x1f
    idiv edi
    add eax, esi
    mov ecx, eax
    xor eax, eax
    mov al, byte [ebx + LINK_ADDRESS_19]
    shl eax, 3
    sub ecx, eax
    movsx eax, word [ebx + LINK_ADDRESS_12]
    imul eax, eax, 0x2c
    cmp byte [eax + LINK_ADDRESS_13], 1
    jne short loc_036c
    mov eax, 1
    jmp short loc_0390
loc_036c:
    movsx edx, word [ebx + LINK_ADDRESS_14]
    lea eax, [edx*4]
    add eax, edx
    mov al, byte [eax*8 + LINK_ADDRESS_15]
    xor ah, ah
    test ax, ax
    jne short loc_0390
    mov al, byte [ebx + LINK_ADDRESS_20]
loc_0390:
    and eax, 0xff
    movsx ebx, word [esp + 0x1c]
    push eax
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea edx, [eax + eax]
    movsx eax, word [edx + LINK_ADDRESS_21]
    mov esi, dword [edx + LINK_ADDRESS_22]
    sub esi, eax
    movsx eax, cx
    sar esi, 4
    add eax, 0x118
    sub eax, esi
    mov esi, eax
    lea eax, [ebx*4]
    movsx edi, byte [esp + 0x1c]
    add eax, ebx
    push 4
    mov ecx, edi
    movsx eax, byte [nosplit eax*2 + LINK_ADDRESS_3]
    movsx ebx, word [edx + LINK_ADDRESS_11]
    sar eax, 4
    movsx edx, word [edx + LINK_ADDRESS_17]
    sar ebx, 1
    movsx edx, word [esp + edx*2 + 8]
    add eax, 0x69
    sar edx, 2
    sub eax, ebx
    mov ebx, 0x9d9
    add eax, edx
    mov edx, esi
    call LINK_ADDRESS_23
    mov al, 1
loc_0416:
    add esp, 0x20
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x20
    mov word [esp + 0x18], ax
    mov dword [esp + 0x1c], edx
    movsx edx, dx
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    mov ecx, 5
    lea ebx, [ebx*4]
    mov edi, esp
    sub ebx, edx
    mov esi, LINK_ADDRESS_24
    add ebx, ebx
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
    xor ah, ah
    mov byte [ebx + LINK_ADDRESS_25], ah
    je short loc_0474
    movsx eax, word [ebx + LINK_ADDRESS_12]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_18], 0
    jg short loc_047b
loc_0474:
    xor al, al
    jmp near loc_0564
loc_047b:
    mov ax, word [ebx + LINK_ADDRESS_11]
    cwde
    test eax, eax
    jns short loc_0489
    neg eax
loc_0489:
    mov edx, eax
    mov ecx, 9
    sar edx, 0x1f
    idiv ecx
    mov ecx, eax
    xor eax, eax
    mov al, byte [ebx + LINK_ADDRESS_19]
    shl eax, 3
    sub ecx, eax
    movsx eax, word [ebx + LINK_ADDRESS_12]
    imul eax, eax, 0x2c
    cmp byte [eax + LINK_ADDRESS_13], 1
    jne short loc_04be
    mov eax, 1
    jmp short loc_04d7
loc_04be:
    movsx edx, word [ebx + LINK_ADDRESS_14]
    lea eax, [edx*4]
    add eax, edx
    mov al, byte [eax*8 + LINK_ADDRESS_15]
    xor ah, ah
loc_04d7:
    and eax, 0xff
    movsx ebp, word [esp + 0x1c]
    push eax
    mov eax, ebp
    shl eax, 7
    sub eax, ebp
    lea eax, [eax*4]
    sub eax, ebp
    lea edx, [eax + eax]
    xor eax, eax
    mov al, byte [edx + LINK_ADDRESS_25]
    sar eax, 1
    mov ax, word [esp + eax*2 + 4]
    add eax, 0x914
    mov esi, dword [edx + LINK_ADDRESS_22]
    movsx ebx, ax
    movsx eax, word [edx + LINK_ADDRESS_21]
    sub esi, eax
    movsx eax, cx
    sar esi, 4
    add eax, 0xb4
    sub eax, esi
    mov esi, eax
    lea eax, [ebp*4]
    lea ecx, [eax + ebp]
    movsx edi, byte [esp + 0x1c]
    movsx ecx, byte [nosplit ecx*2 + LINK_ADDRESS_3]
    movsx eax, word [edx + LINK_ADDRESS_11]
    sar ecx, 4
    sar eax, 1
    add ecx, 0xa0
    push 4
    sub ecx, eax
    mov edx, esi
    mov eax, ecx
    mov ecx, edi
    call LINK_ADDRESS_23
    mov al, 1
loc_0564:
    add esp, 0x20
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov edx, eax
    movsx ebx, ax
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    add eax, eax
    movsx ebx, word [eax + LINK_ADDRESS_12]
    imul ebx, ebx, 0x2c
    cmp byte [ebx + LINK_ADDRESS_13], 1
    jne short loc_05a7
    mov ebx, 1
    jmp short loc_05c0
loc_05a7:
    movsx ebx, word [eax + LINK_ADDRESS_14]
    lea eax, [ebx*4]
    add eax, ebx
    xor ebx, ebx
    mov bl, byte [eax*8 + LINK_ADDRESS_15]
loc_05c0:
    movsx edx, dx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    cmp byte [nosplit eax*2 + LINK_ADDRESS_26], 0
    je near loc_06f5
    cmp dword [LINK_ADDRESS_27], 4
    jle short loc_0660
    mov esi, dword [WINDOWY2]
    push esi
    mov edi, dword [WINDOWX2]
    push edi
    mov ebp, dword [WINDOWY1]
    push ebp
    mov eax, dword [WINDOWX1]
    push eax
    mov edx, 0xc0
    xor ecx, ecx
    push 0x12
    movsx esi, bx
    mov ebx, 0x10000
    push esi
    movsx eax, word [LINK_ADDRESS_32]
    push 0
    sub edx, eax
    mov eax, 0x2b0000
    push 0xa15
    shl edx, 0x10
    call LINK_ADDRESS_8
    mov edx, dword [WINDOWY2]
    push edx
    mov ebx, dword [WINDOWX2]
    push ebx
    mov ecx, dword [WINDOWY1]
    push ecx
    mov edi, dword [WINDOWX1]
    push edi
    push 0x16
    movsx eax, word [LINK_ADDRESS_32]
    mov edx, 0xc0
    jmp short loc_06d4
loc_0660:
    mov ecx, dword [WINDOWY2]
    push ecx
    mov esi, dword [WINDOWX2]
    push esi
    mov edi, dword [WINDOWY1]
    push edi
    mov ebp, dword [WINDOWX1]
    mov edx, 0xc8
    push ebp
    movsx esi, bx
    push 0x12
    movsx eax, word [LINK_ADDRESS_32]
    push esi
    sub edx, eax
    mov eax, 0x2b0000
    push 0
    shl edx, 0x10
    push 0xa15
    xor ecx, ecx
    mov ebx, 0x10000
    call LINK_ADDRESS_8
    mov eax, dword [WINDOWY2]
    push eax
    mov edx, dword [WINDOWX2]
    push edx
    mov ebx, dword [WINDOWY1]
    push ebx
    mov ecx, dword [WINDOWX1]
    push ecx
    push 0x16
    movsx eax, word [LINK_ADDRESS_32]
    mov edx, 0xc8
loc_06d4:
    push esi
    mov ebx, 0x10000
    sub edx, eax
    push 0
    mov ecx, 0x400
    mov eax, 0x1150000
    push 0xa15
    shl edx, 0x10
    call LINK_ADDRESS_8
loc_06f5:
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x34
    mov word [esp + 0x2c], ax
    mov dword [esp + 0x30], edx
    movsx edx, dx
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    mov ecx, 0xa
    add ebx, ebx
    mov edi, esp
    mov esi, LINK_ADDRESS_33
    mov dx, word [ebx + LINK_ADDRESS_34]
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
    test dx, dx
    jne short loc_0749
    xor al, al
    jmp near loc_083e
loc_0749:
    mov ax, word [ebx + LINK_ADDRESS_11]
    cwde
    test eax, eax
    jns short loc_0757
    neg eax
loc_0757:
    mov edx, eax
    mov esi, 9
    sar edx, 0x1f
    idiv esi
    mov ecx, eax
    xor eax, eax
    mov al, byte [ebx + LINK_ADDRESS_19]
    shl eax, 3
    sub ecx, eax
    movsx eax, word [ebx + LINK_ADDRESS_12]
    imul eax, eax, 0x2c
    cmp byte [eax + LINK_ADDRESS_13], 1
    jne short loc_078c
    mov eax, 1
    jmp short loc_07a5
loc_078c:
    movsx edx, word [ebx + LINK_ADDRESS_14]
    lea eax, [edx*4]
    add eax, edx
    mov al, byte [eax*8 + LINK_ADDRESS_15]
    xor ah, ah
loc_07a5:
    and eax, 0xff
    movsx esi, word [esp + 0x30]
    push eax
    mov eax, esi
    shl eax, 7
    sub eax, esi
    lea eax, [eax*4]
    sub eax, esi
    lea edx, [eax + eax]
    mov ebx, 0x1a
    movsx eax, word [edx + LINK_ADDRESS_34]
    sub ebx, eax
    movsx eax, word [esp + eax*2 + 4]
    movsx ebp, cx
    sar eax, 1
    mov ecx, dword [edx + LINK_ADDRESS_22]
    add ebp, eax
    movsx eax, word [edx + LINK_ADDRESS_21]
    sub ecx, eax
    mov eax, ecx
    add ebp, 0xf0
    sar eax, 4
    movsx edi, byte [esp + 0x30]
    sub ebp, eax
    lea eax, [esi*4]
    sar ebx, 4
    add esi, eax
    push 0
    add ebx, 0xa10
    movsx esi, byte [nosplit esi*2 + LINK_ADDRESS_3]
    movsx eax, word [edx + LINK_ADDRESS_11]
    sar esi, 4
    sar eax, 1
    lea edx, [esi + 0xaa]
    movsx ebx, bx
    sub edx, eax
    mov ecx, edi
    mov eax, edx
    mov edx, ebp
    call LINK_ADDRESS_23
    mov al, 1
loc_083e:
    add esp, 0x34
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x40
    mov word [esp + 0x34], ax
    mov dword [esp + 0x38], edx
    movsx edx, dx
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    mov ecx, 0xa
    add ebx, ebx
    mov edi, esp
    mov esi, LINK_ADDRESS_35
    mov dx, word [ebx + LINK_ADDRESS_36]
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
    test dx, dx
    je short loc_08a6
    movsx eax, word [ebx + LINK_ADDRESS_12]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_18], 0
    jg short loc_08ad
loc_08a6:
    xor al, al
    jmp near loc_0a53
loc_08ad:
    movsx eax, dx
    movsx edi, word [esp + eax*2]
    mov ax, word [ebx + LINK_ADDRESS_11]
    cwde
    test eax, eax
    jns short loc_08c2
    neg eax
loc_08c2:
    mov edx, eax
    mov esi, 9
    sar edx, 0x1f
    idiv esi
    add eax, edi
    mov ecx, eax
    xor eax, eax
    mov al, byte [ebx + LINK_ADDRESS_19]
    shl eax, 3
    mov si, word [ebx + LINK_ADDRESS_37]
    sub ecx, eax
    test si, si
    jl short loc_08fd
    movsx eax, si
    imul eax, eax, 0x2c
    mov al, byte [eax + LINK_ADDRESS_13]
    mov byte [esp + 0x3c], al
    jmp short loc_0903
loc_08fd:
    xor ah, ah
    mov byte [esp + 0x3c], ah
loc_0903:
    movsx eax, word [esp + 0x38]
    mov dword [esp + 0x30], eax
    mov edx, eax
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    movsx ebx, word [edx + LINK_ADDRESS_36]
    lea eax, [ebx - 3]
    test eax, eax
    jle near loc_09c8
    sar eax, 3
    test eax, eax
    je near loc_09c8
    xor eax, eax
    mov al, byte [esp + 0x3c]
    push eax
    mov eax, ebx
    sar eax, 3
    add eax, 0xa03
    mov ebp, dword [edx + LINK_ADDRESS_22]
    movsx edi, ax
    movsx eax, word [edx + LINK_ADDRESS_21]
    sub ebp, eax
    mov eax, ebp
    movsx ebp, cx
    sar eax, 4
    add ebp, 0x10a
    sub ebp, eax
    mov eax, dword [esp + 0x34]
    mov dword [esp + 0x30], eax
    mov ecx, dword [esp + 0x30]
    lea eax, [eax*4]
    add eax, ecx
    movsx eax, byte [nosplit eax*2 + LINK_ADDRESS_3]
    movsx edx, word [edx + LINK_ADDRESS_11]
    sar eax, 4
    sar edx, 1
    add eax, 0xaa
    movsx esi, byte [esp + 0x38]
    sub eax, edx
    push 0
    mov edx, eax
    movsx eax, word [esp + ebx*2 + 8]
    mov ecx, esi
    sar eax, 2
    mov ebx, edi
    add eax, edx
    mov edx, ebp
    call LINK_ADDRESS_23
    mov al, 1
    add esp, 0x40
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_09c8:
    xor eax, eax
    mov al, byte [esp + 0x3c]
    movsx ebx, word [esp + 0x38]
    push eax
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea edx, [eax + eax]
    movsx eax, word [edx + LINK_ADDRESS_21]
    mov esi, dword [edx + LINK_ADDRESS_22]
    sub esi, eax
    movsx eax, cx
    sar esi, 4
    add eax, 0x10a
    sub eax, esi
    mov esi, eax
    lea eax, [ebx*4]
    add eax, ebx
    movsx eax, byte [nosplit eax*2 + LINK_ADDRESS_3]
    movsx ebx, word [edx + LINK_ADDRESS_11]
    sar eax, 4
    sar ebx, 1
    add eax, 0xaa
    sub eax, ebx
    movsx edi, byte [esp + 0x38]
    mov ebx, eax
    movsx eax, word [edx + LINK_ADDRESS_36]
    push 4
    movsx eax, word [esp + eax*2 + 8]
    mov ecx, edi
    sar eax, 2
    mov edx, esi
    add eax, ebx
    mov ebx, 0xa08
    call LINK_ADDRESS_23
    mov al, 1
loc_0a53:
    add esp, 0x40
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
