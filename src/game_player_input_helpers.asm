; Player input and game display helpers.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov edi, eax
    mov esi, edx
    mov dword [esp], edx
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x04, 0x45, 0xac, 0x19, 0x0f, 0x00    ; mov eax, dword [eax*2 + 0xf19ac]
    cmp dword [eax + 4], 0
    jne short loc_0052
    push 0x2678
    mov edx, esi
    mov eax, edi
    xor ecx, ecx
    xor ebx, ebx
    call 0x3eca0
    mov edx, 0x82
    lea ebx, [esi + 0x14]
    jmp near loc_00d4
loc_0052:
    xor ebp, ebp
    jmp short loc_00a9
loc_0056:
    lea eax, [ebp*4]
    sub eax, ebp
    mov eax, dword [ebx + eax*4 + 0x10]
    cmp eax, 3
    ja short loc_009a
    jmp dword cs:[eax*4 + 0x2c0d0]
    push 0x268c
    jmp short loc_008a
    push 0x269c
    jmp short loc_008a
    push 0x26ac
    jmp short loc_008a
    push 0x26bc
loc_008a:
    mov edx, esi
    mov eax, edi
    xor ecx, ecx
    xor ebx, ebx
    call 0x3eca0
    add esi, 8
loc_009a:
    cmp esi, 0xb4
    jl short loc_00a8
    mov esi, dword [esp]
    add edi, 0x5a
loc_00a8:
    inc ebp
loc_00a9:
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x1c, 0x45, 0xac, 0x19, 0x0f, 0x00    ; mov ebx, dword [eax*2 + 0xf19ac]
    cmp ebp, dword [ebx + 4]
    jl short loc_0056
    mov edx, 0x82
    lea ebx, [esi + 0xa]
loc_00d4:
    xor eax, eax
    call loc_0270
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0xc
    mov edi, eax
    mov esi, edx
    mov dword [esp + 4], ebx
    xor edx, edx
    mov dword [esp + 8], edx
loc_0105:
    imul ebp, dword [esp + 8], 0x2e
    mov ebx, dword [esp + 4]
    mov eax, ebx
    shl eax, 6
    sub eax, ebx
    lea eax, [eax*8]
    mov dword [esp], eax
    mov eax, 0xf0bf8
    add eax, dword [esp]
    add eax, 0x88
    mov edx, esi
    add eax, ebp
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, edi
    call 0x3eca0
    mov eax, dword [esp]
    mov edx, esi
    add ebp, eax
    xor ecx, ecx
    lea eax, [edi + 0x37]
    mov ebx, dword [ebp + 0xf0c96]
    call loc_20b0
    lea eax, [edi + 0x5f]
    mov edx, esi
    mov ebx, dword [ebp + 0xf0c9a]
    xor ecx, ecx
    call loc_20b0
    lea eax, [edi + 0x96]
    mov edx, esi
    mov ebx, dword [ebp + 0xf0caa]
    xor ecx, ecx
    call loc_20b0
    lea eax, [edi + 0xd0]
    mov edx, esi
    mov ebx, dword [ebp + 0xf0ca6]
    xor ecx, ecx
    call loc_20b0
    mov edx, dword [esp + 8]
    inc edx
    add esi, 8
    mov dword [esp + 8], edx
    cmp edx, 8
    jl near loc_0105
    mov eax, 1
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov edi, eax
    mov esi, edx
    xor edx, edx
    mov dword [esp], edx
loc_01d1:
    imul ebp, dword [esp], 0x2e
    mov eax, 0x2e7e0
    mov edx, esi
    add eax, ebp
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, edi
    call 0x3eca0
    lea eax, [edi + 0x37]
    mov edx, esi
    mov ebx, dword [ebp + 0x2e7f6]
    xor ecx, ecx
    call loc_20b0
    lea eax, [edi + 0x5f]
    mov edx, esi
    mov ebx, dword [ebp + 0x2e7fa]
    xor ecx, ecx
    call loc_20b0
    lea eax, [edi + 0x96]
    mov edx, esi
    mov ebx, dword [ebp + 0x2e80a]
    xor ecx, ecx
    call loc_20b0
    lea eax, [edi + 0xd0]
    mov edx, esi
    mov ebx, dword [ebp + 0x2e806]
    xor ecx, ecx
    call loc_20b0
    lea eax, [edi + 0xff]
    mov edx, esi
    mov ebx, dword [ebp + 0x2e7fe]
    xor ecx, ecx
    call loc_20b0
    mov ecx, dword [esp]
    inc ecx
    add esi, 8
    mov dword [esp], ecx
    cmp ecx, 4
    jl near loc_01d1
    mov eax, 1
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
loc_0270:
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov ebp, eax
    mov esi, edx
    mov edi, ebx
    push 0x26cc
    mov edx, edi
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call 0x3eca0
    mov ebx, ebp
    mov eax, ebx
    shl eax, 6
    mov edx, edi
    sub eax, ebx
    xor ecx, ecx
    lea eax, [eax*8]
    lea ebp, [esi + 0x32]
    mov dword [esp], eax
    mov ebx, dword [eax + 0xf0c00]
    mov eax, ebp
    add edi, 8
    call loc_20b0
    push 0x26dc
    mov edx, edi
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call 0x3eca0
    mov ebx, dword [esp]
    mov edx, edi
    mov eax, ebp
    xor ecx, ecx
    mov ebx, dword [ebx + 0xf0c04]
    call loc_20b0
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    mov ecx, eax
    mov ebx, edx
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x04, 0x45, 0xac, 0x19, 0x0f, 0x00    ; mov eax, dword [eax*2 + 0xf19ac]
    mov edx, dword [eax]
    sub edx, ebx
    test edx, edx
    jge short loc_0324
    mov eax, 0xffffffff
    pop ecx
    pop ebx
    ret
loc_0324:
    cmp dword [eax + 4], 9
    jl short loc_0332
    mov eax, 0xfffffffe
    pop ecx
    pop ebx
    ret
loc_0332:
    mov dword [eax], edx
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x14, 0x45, 0xac, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf19ac]
    mov ebx, dword [edx + 4]
    lea eax, [ebx*4]
    sub eax, ebx
    mov dword [edx + eax*4 + 0x10], ecx
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x14, 0x45, 0xac, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf19ac]
    mov eax, 1
    add dword [edx + 4], eax
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
    push ebx
    push ecx
    push edx
    push esi
    mov ecx, eax
    mov esi, 0x64
    xor edx, edx
loc_039d:
    mov eax, ecx
    shl eax, 6
    sub eax, ecx
    lea ebx, [eax*8]
    imul eax, edx, 0x2e
    inc edx
    mov dword [ebx + eax + 0xf0c9a], esi
    cmp edx, 8
    jl short loc_039d
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    push ebx
    push ecx
    push edx
    push esi
    mov ecx, eax
    mov esi, 0x64
    xor edx, edx
loc_03cd:
    mov eax, ecx
    shl eax, 6
    sub eax, ecx
    lea ebx, [eax*8]
    imul eax, edx, 0x2e
    inc edx
    mov dword [ebx + eax + 0xf0c96], esi
    cmp edx, 8
    jl short loc_03cd
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    push ecx
    push esi
    push edi
    push ebp
    mov edi, eax
    mov esi, edx
    mov ebp, ebx
    xor edx, edx
loc_03fc:
    imul ebx, edx, 0x2e
    mov eax, edi
    shl eax, 6
    sub eax, edi
    mov ecx, 0xf0bf8
    lea eax, [eax*8]
    add ecx, eax
    add ecx, 0x88
    add ecx, ebx
    cmp ecx, esi
    jne short loc_0449
    add eax, ebx
    mov edx, dword [eax + 0xf0c9a]
    add edx, ebp
    mov dword [eax + 0xf0c9a], edx
    cmp edx, 0x64
    jle short loc_043f
    mov dword [eax + 0xf0c9a], 0x64
loc_043f:
    mov eax, 1
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_0449:
    inc edx
    cmp edx, 8
    jl short loc_03fc
    mov eax, 0xffffffff
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ecx
    push esi
    push edi
    push ebp
    mov edi, eax
    mov esi, edx
    mov ebp, ebx
    xor edx, edx
loc_046c:
    imul ebx, edx, 0x2e
    mov eax, edi
    shl eax, 6
    sub eax, edi
    mov ecx, 0xf0bf8
    lea eax, [eax*8]
    add ecx, eax
    add ecx, 0x88
    add ecx, ebx
    cmp ecx, esi
    jne short loc_04b9
    add eax, ebx
    mov edx, dword [eax + 0xf0c96]
    add edx, ebp
    mov dword [eax + 0xf0c96], edx
    cmp edx, 0x64
    jle short loc_04af
    mov dword [eax + 0xf0c96], 0x64
loc_04af:
    mov eax, 1
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_04b9:
    inc edx
    cmp edx, 8
    jl short loc_046c
    mov eax, 0xffffffff
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ecx
    push esi
    mov esi, eax
    mov ecx, edx
    xor edx, edx
loc_04d8:
    imul ebx, edx, 0x2e
    mov eax, esi
    shl eax, 6
    sub eax, esi
    lea eax, [eax*8]
    add eax, 0xf0bf8
    add eax, 0x88
    add ebx, eax
    cmp ebx, ecx
    jne short loc_0501
    mov eax, 1
    pop esi
    pop ecx
    ret
loc_0501:
    inc edx
    cmp edx, 8
    jl short loc_04d8
    mov eax, 0xffffffff
    pop esi
    pop ecx
    ret
    nop
    push edx
    mov edx, 0xffffffff
    cwde
    mov word [0x9042], dx
    mov edx, 0x26ec
    mov dword [0x121ea8], eax
    mov dword [0x13bddc], edx
    pop edx
    ret
    push ecx
    push esi
    push edi
    push ebp
    mov ebp, edx
    mov edi, ebx
    mov edx, 0x26f0
    call 0xa0223
    mov esi, eax
    test eax, eax
    je short loc_055f
    mov ebx, 1
    mov ecx, eax
    mov edx, edi
    mov eax, ebp
    call 0xa06a1
    mov eax, esi
    call 0x9fcc9
loc_055f:
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov dword [esp], eax
    mov si, word [0x2f2920]
    test si, si
    jge short loc_0592
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0592:
    mov edx, dword [esp]
    cmp si, dx
    je near loc_068b
    movsx eax, dx
    movsx edx, si
    mov ecx, edx
    mov ebx, eax
    shl ecx, 7
    shl ebx, 7
    sub ecx, edx
    sub ebx, eax
    lea ecx, [ecx*4]
    lea ebx, [ebx*4]
    sub ecx, edx
    sub ebx, eax
    add ecx, ecx
    db 0x8b, 0x3c, 0x5d, 0x38, 0x19, 0x0f, 0x00    ; mov edi, dword [ebx*2 + 0xf1938]
    db 0x8b, 0x2c, 0x5d, 0x34, 0x19, 0x0f, 0x00    ; mov ebp, dword [ebx*2 + 0xf1934]
    mov edx, dword [ecx + 0xf1938]
    mov eax, dword [ecx + 0xf1934]
    sub edx, edi
    sub eax, ebp
    call 0x62b58
    db 0x66, 0x8b, 0x14, 0x5d, 0xb8, 0x19, 0x0f, 0x00    ; mov dx, word [ebx*2 + 0xf19b8]
    add edx, eax
    mov eax, dword [0x2d6bc4]
    dec eax
    push eax
    mov eax, dword [0x2d6bc8]
    dec eax
    push eax
    push 0
    xor eax, eax
    push 0
    sub edx, 0x400
    mov al, byte [ecx + 0xf1b0c]
    push 0
    movsx ebx, dx
    push eax
    mov eax, ebx
    and dh, 7
    sar eax, 1
    movsx edx, dx
    add eax, 0x300
    push 0
    and eax, 0x7ff
    mov ecx, 0xa00000
    push 0x214
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    add ebx, 0x200
    lea eax, [eax*4]
    and ebx, 0x7ff
    test eax, eax
    jns short loc_065a
    neg eax
loc_065a:
    db 0x0f, 0xbf, 0x14, 0x55, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [edx*2 + 0x2496b4]
    db 0x0f, 0xbf, 0x1c, 0x5d, 0xb4, 0x96, 0x24, 0x00    ; movsx ebx, word [ebx*2 + 0x2496b4]
    sar edx, 8
    sar ebx, 7
    shl edx, 0xf
    shl ebx, 0xf
    sub ecx, edx
    lea edi, [ebx + 0xa00000]
    mov edx, ecx
    mov ebx, eax
    mov eax, edi
    xor ecx, ecx
    call 0x6eb5e
loc_068b:
    movsx eax, si
    db 0x66, 0x8b, 0x34, 0x45, 0x18, 0x28, 0x2f, 0x00    ; mov si, word [eax*2 + 0x2f2818]
    test si, si
    jge near loc_0592
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push esi
    push edi
    push ebp
    sub esp, 0xc
    mov dword [esp + 4], edx
    mov dword [esp + 8], ebx
    mov ebp, ecx
    add al, 0x30
    xor edx, edx
    mov byte [0x26f8], al
    mov eax, 0x26f4
    call 0x77cee
    mov esi, eax
    mov edi, eax
    cmp eax, -1
    je near loc_07f8
    mov ah, 0xff
    mov ebx, 1
    mov edx, 4
    mov ecx, esi
    mov byte [0x240bb1], ah
    mov eax, esp
    call 0x78010
    cmp dword [esp], 0x75
    je short loc_073c
    movsx edi, word [0x2f2926]
    mov eax, edi
    shl eax, 7
    sub eax, edi
    lea eax, [eax*4]
    sub eax, edi
    mov edx, 0xf1720
    add eax, eax
    add edx, eax
    mov eax, 0x72
    call 0x15e50
    mov eax, esi
    call 0x77fe5
    mov eax, 1
    jmp near loc_07f8
loc_073c:
    mov ebx, 1
    mov edx, 4
    mov eax, dword [esp + 0x1c]
    mov ecx, esi
    call 0x78010
    mov ebx, 1
    mov edx, 0x13
    mov eax, 0xf88c0
    mov ecx, esi
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, dword [esp + 4]
    mov ecx, esi
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, dword [esp + 8]
    mov ecx, esi
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov ecx, esi
    mov eax, ebp
    call 0x78010
    cmp dword [0x248ea8], 0
    jne short loc_07c1
    mov ebx, 0x240bb1
    mov edx, 0x3e80
    mov eax, 0x248ea8
    call 0x77508
loc_07c1:
    mov edx, 0x64
    mov ebx, 0xa0
    mov eax, dword [0x248ea8]
    mov ecx, edi
    mov word [0x23c32e], dx
    mov word [0x23f32e], bx
    mov ebx, 0x64
    mov edx, 0xa0
    call 0x78010
    mov eax, edi
    call 0x77fe5
    xor eax, eax
loc_07f8:
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    ret 4
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x4ff8
    mov byte [esp + 0x4ff4], al
    mov dl, byte [esp + 0x4ff4]
    mov eax, 0x26f4
    test dl, dl
    jge short loc_085d
    mov dl, 1
    mov al, byte [esp + 0x4ff4]
    mov byte [0x126226], dl
    neg al
    xor dh, dh
    sub al, dl
    mov byte [0x12622a], dh
    mov byte [0x12622b], al
    mov eax, 0xffffffff
    jmp near loc_163a
loc_085d:
    cmp byte [0x126226], 2
    jne short loc_08d4
    movsx dx, byte [0x126224]
    cmp dx, word [0x2f2926]
    je short loc_08d4
    mov al, byte [esp + 0x4ff4]
    mov ecx, 0x2700
    add al, 0x41
    mov edx, dword [0x1261df]
    mov byte [0x2704], al
    cmp edx, 9
    jle short loc_08c6
    movsx ebx, byte [0x126224]
    mov esi, 0xa
    mov edx, ebx
    mov eax, ebx
    sar edx, 0x1f
    idiv esi
    add eax, 0x30
    mov edx, ebx
    mov byte [0x2706], al
    sar edx, 0x1f
    mov eax, ebx
    idiv esi
    add edx, 0x30
    mov byte [0x2707], dl
    jmp short loc_08e3
loc_08c6:
    mov al, byte [0x126224]
    add al, 0x30
    mov byte [0x2707], al
    jmp short loc_08e3
loc_08d4:
    mov dl, byte [esp + 0x4ff4]
    add dl, 0x30
    mov ecx, eax
    mov byte [eax + 4], dl
loc_08e3:
    mov eax, ecx
    xor edx, edx
    call 0x77cee
    mov esi, eax
    mov edi, eax
    cmp eax, -1
    je near loc_163a
    mov edx, 4
    mov ecx, eax
    xor bl, bl
    lea eax, [esp + 0x4ff0]
    mov byte [0x12623a], bl
    mov ebx, 1
    call 0x78010
    cmp dword [esp + 0x4ff0], 0x75
    je short loc_0977
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    add edx, eax
    mov eax, 0x72
    call 0x15e50
    mov eax, esi
    call 0x77fe5
    mov eax, dword [0x2d6bbc]
    mov dword [0x121eac], eax
    mov byte [0x12623a], 1
    mov eax, 1
    add esp, 0x4ff8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0977:
    mov ebx, 1
    mov edx, 4
    lea eax, [esp + 0x4fec]
    mov ecx, esi
    call 0x78010
    mov ecx, dword [esp + 0x4fec]
    movsx eax, word [0x2f2924]
    cmp eax, ecx
    je short loc_09f5
    mov eax, esi
    call 0x77fe5
    mov eax, dword [0x2d6bbc]
    mov dword [0x121eac], eax
    mov al, 1
    movsx edx, word [0x2f2926]
    mov byte [0x12623a], al
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    add edx, eax
    mov eax, 0x7c
    call 0x15e50
    mov eax, 1
    add esp, 0x4ff8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_09f5:
    cmp word [0x2f2924], 1
    jle short loc_0a34
    mov bh, 1
    mov edx, 0x64
    xor ecx, ecx
    mov byte [0x12622d], bh
    mov byte [0x12622f], bh
    call 0x4dd90
    call 0x18220
    push 0x2710
    mov eax, 0xa0
    xor ebx, ebx
    call 0x3e980
    call 0x61a10
loc_0a34:
    call 0x4fcb0
    call 0x91f54
    call 0x58740
    call 0x8947d
    cmp word [0x2f2924], 1
    jle short loc_0a65
    mov ebx, 1
    mov edx, 0x13
    mov eax, 0xf15d0
    mov ecx, edi
    jmp short loc_0a81
loc_0a65:
    movsx eax, byte [esp + 0x4ff4]
    imul eax, eax, 0x16
    mov ebx, 1
    mov edx, 0x13
    mov ecx, edi
    add eax, 0x125b14
loc_0a81:
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, 0x1261eb
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, 0x1261e7
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, 0x1261e3
    mov ecx, edi
    call 0x78010
    mov eax, dword [0x1261e7]
    mov ch, 1
    mov dword [0x1261d7], eax
    mov eax, dword [0x1261eb]
    mov esi, dword [0x248ea8]
    mov dword [0x1261db], eax
    mov eax, dword [0x1261e3]
    mov byte [0x240bb1], ch
    mov dword [0x1261d3], eax
    test esi, esi
    jne short loc_0b0c
    mov ebx, 0x240bb1
    mov edx, 0x3e80
    mov eax, 0x248ea8
    call 0x77508
loc_0b0c:
    mov eax, 0x64
    mov edx, 0xa0
    mov ebx, 0x64
    mov ecx, edi
    mov word [0x23c32e], ax
    mov word [0x23f32e], dx
    mov edx, 0xa0
    mov eax, dword [0x248ea8]
    call 0x78010
    mov ebx, 1
    mov edx, 2
    mov eax, 0x2d7c10
    mov ecx, edi
    call 0x78010
    mov ebx, 0x2000
    mov edx, 0x20
    mov eax, 0x27e4b4
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 2
    mov eax, 0x2d7c12
    mov ecx, edi
    call 0x78010
    mov ebx, 0x400
    mov edx, 0x28
    mov eax, 0x2c9cb4
    mov ecx, edi
    call 0x78010
    mov ebx, 0x1000
    mov edx, 0x2c
    mov eax, 0x2522b4
    mov ecx, edi
    call 0x78010
    mov ebx, 0x401
    mov edx, 2
    mov eax, 0x2d73d4
    mov ecx, edi
    call 0x78010
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x24b334
    mov ecx, edi
    call 0x78010
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x24dfb4
    mov ecx, edi
    call 0x78010
    mov ebx, 0x401
    mov edx, 2
    mov eax, 0x2d6bd2
    mov ecx, edi
    call 0x78010
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x24ffb4
    mov ecx, edi
    call 0x78010
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x240eb4
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 2
    mov eax, 0x1256d0
    mov ecx, edi
    call 0x78010
    mov ebx, 0x100
    mov edx, 0xc
    mov eax, 0x10a700
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 0x3f60
    mov eax, 0xf1720
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0xf1620
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 2
    mov eax, 0x1256d2
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 0xc00
    mov eax, 0xffb00
    mov ecx, edi
    call 0x78010
    mov ebx, 0x800
    mov edx, 4
    mov eax, 0x11ed00
    mov ecx, edi
    call 0x78010
    mov ebx, 0x800
    mov edx, 4
    mov eax, 0x11cd00
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 2
    mov eax, 0x1256ce
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 2
    mov eax, 0x8d8c
    mov ecx, edi
    call 0x78010
    mov edx, 2
    mov eax, 0xf03f8
    movsx ebx, word [0x8d8c]
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 2
    mov eax, 0x1256c2
    mov ecx, edi
    call 0x78010
    mov ebx, 0x40
    mov edx, 2
    mov eax, 0x8b038
    mov ecx, edi
    call 0x78010
    mov ebx, 0x40
    mov edx, 2
    mov eax, 0x8a6b0
    mov ecx, edi
    call 0x78010
    mov ebx, 0x80
    mov edx, 1
    mov eax, 0x232eb4
    mov ecx, edi
    call 0x78010
    mov ebx, 0x1800
    mov edx, 1
    mov eax, 0xd21f8
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 0x80
    mov eax, 0x7f08
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 2
    mov eax, 0x1256ac
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0x7a700
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0x7a900
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0x7a800
    mov ecx, edi
    call 0x78010
    mov ebx, 0x4fec
    mov edx, 1
    mov eax, esp
    mov ecx, edi
    call 0x78010
    mov ebx, 0x4fec
    mov edx, 4
    mov eax, 0xd3a08
    mov ecx, edi
    call 0x78010
    xor edx, edx
    jmp short loc_0e43
loc_0e28:
    cmp byte [esp + edx], 0
    je short loc_0e42
    mov ebx, dword [edx*4 + 0xd3a08]
    add ebx, 0xd3a08
    mov dword [edx*4 + 0xd3a08], ebx
loc_0e42:
    inc edx
loc_0e43:
    cmp edx, 0x4fec
    jl short loc_0e28
    mov ebx, 0x1800
    mov edx, 4
    mov eax, 0xea3f8
    mov ecx, edi
    call 0x78010
    xor edx, edx
    jmp short loc_0e85
loc_0e65:
    lea eax, [edx*4]
    mov ebp, dword [eax + 0xea3f8]
    test ebp, ebp
    je short loc_0e84
    mov ebx, ebp
    add ebx, 0xd3a08
    mov dword [eax + 0xea3f8], ebx
loc_0e84:
    inc edx
loc_0e85:
    cmp edx, 0x1800
    jl short loc_0e65
    mov ebx, 0x1000
    mov edx, 1
    mov eax, esp
    mov ecx, edi
    call 0x78010
    mov ebx, 0x1000
    mov edx, 0x47
    mov eax, 0x8b0b8
    mov ecx, edi
    call 0x78010
    mov ebx, 0xd3a08
    xor edx, edx
    jmp short loc_0f1a
loc_0ebf:
    test byte [esp + edx], 1
    je short loc_0edd
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    add dword [eax + 0x8b0eb], ebx
loc_0edd:
    test byte [esp + edx], 2
    je short loc_0efb
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    add dword [eax + 0x8b0f7], ebx
loc_0efb:
    test byte [esp + edx], 4
    je short loc_0f19
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    add dword [eax + 0x8b0fb], ebx
loc_0f19:
    inc edx
loc_0f1a:
    cmp edx, 0x1000
    jl short loc_0ebf
    mov ebx, 1
    mov edx, 4
    mov eax, 0x121ec8
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 2
    mov eax, 0x2d7c0c
    mov ecx, edi
    call 0x78010
    mov ebx, 0x100
    mov edx, 2
    mov eax, 0x2490b4
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, 0x121ec4
    mov ecx, edi
    call 0x78010
    mov ebx, 0x40
    mov edx, 2
    mov eax, 0x8a630
    mov ecx, edi
    call 0x78010
    mov ebx, 0x40
    mov edx, 4
    mov eax, 0xd20b8
    mov ecx, edi
    call 0x78010
    mov edx, dword [0x121ec4]
    dec edx
    jmp short loc_0fc4
loc_0faf:
    mov ebx, dword [edx*4 + 0xd20b8]
    dec edx
    add ebx, 0x2c9cb4
    mov dword [edx*4 + 0xd20bc], ebx
loc_0fc4:
    test edx, edx
    jge short loc_0faf
    mov ebx, 0x40
    mov edx, 4
    mov eax, 0x8a830
    mov ecx, edi
    call 0x78010
    mov ebx, 0x40
    mov edx, 4
    mov eax, 0x8a730
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov eax, 0x126232
    mov ecx, edi
    mov edx, ebx
    call 0x78010
    mov ebx, 1
    mov edx, 2
    mov eax, 0x125cf5
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 2
    mov eax, 0x125cfd
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, 0x12619b
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, dword [0x12619b]
    mov ecx, edi
    mov dword [0x1261b7], eax
    mov eax, 0x12619f
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, dword [0x12619f]
    mov ecx, edi
    mov dword [0x1261b3], eax
    mov eax, 0x1261a3
    call 0x78010
    mov ebx, 1
    mov eax, dword [0x1261a3]
    mov ecx, edi
    mov dword [0x1261bb], eax
    mov edx, ebx
    mov eax, 0x12577c
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, 0x125d37
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, 0x125d53
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, 0x1261ab
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 2
    mov eax, dword [0x1261ab]
    mov ecx, edi
    mov dword [0x1261c3], eax
    mov eax, 0x125cfb
    call 0x78010
    mov ebx, 1
    mov eax, 0x12577f
    mov ecx, edi
    mov edx, ebx
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, 0x125d47
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, dword [0x125d47]
    mov ecx, edi
    mov dword [0x125d43], eax
    mov eax, 0x1261f3
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, dword [0x1261f3]
    mov ecx, edi
    mov dword [0x1261ef], eax
    mov eax, 0x1261cf
    call 0x78010
    mov ebx, 1
    mov edx, 2
    mov eax, dword [0x1261cf]
    mov ecx, edi
    mov dword [0x1261cb], eax
    mov eax, 0x1256c8
    call 0x78010
    mov ebx, 1
    mov edx, 2
    mov eax, 0x2f2920
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 0x20
    mov eax, 0x2f2818
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov eax, 0x12623b
    mov ecx, edi
    mov edx, ebx
    call 0x78010
    mov ebx, 1
    mov edx, 0x200
    mov eax, 0x88c80
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, 0x2d58d4
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 2
    mov eax, 0x1256ca
    mov ecx, edi
    call 0x78010
    mov ebx, 1
    mov edx, 4
    mov eax, 0x2d58c8
    mov ecx, edi
    call 0x78010
    mov eax, edi
    call 0x77fe5
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xf1a64], 0
    je short loc_126c
    xor edx, edx
    mov ecx, 1
    mov dword [0x7e74], edx
    mov dword [0x7e78], edx
    mov word [eax + 0xf1a64], cx
loc_126c:
    mov ecx, 0x300
    mov ax, word [0x2f2926]
    mov edi, 0x240bb4
    mov word [0x1256c6], ax
    xor eax, eax
    cmp ecx, 4
    jae short loc_1296
    test cl, 1
    je short loc_128f
    db 0xaa    ; stosb byte es:[edi], al
loc_128f:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_12c1
loc_1296:
    test edi, 1
    je short loc_12a0
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_12a0:
    test edi, 2
    je short loc_12ad
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_12ad:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_12bb
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_12bb:
    test bl, 1
    je short loc_12c1
    db 0xaa    ; stosb byte es:[edi], al
loc_12c1:
    call 0x58740
    call 0x4daf0
    mov al, byte [0x1261eb]
    mov ah, 0xb
    mul ah
    mov ah, byte [0x1261e7]
    add al, ah
    mov byte [0x126238], al
    xor eax, eax
    mov al, byte [0x126238]
    imul eax, eax, 0xd
    add eax, 0x121ed4
    call 0x57760
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov byte [eax + 0xf1ac2], 4
    xor ecx, ecx
    mov dh, byte [eax + 0xf1aeb]
    mov dword [0x1261a7], ecx
    test dh, dh
    je short loc_1338
    movsx edx, word [eax + 0xf1a60]
    mov eax, 0x32
    call 0x58160
loc_1338:
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov bl, 1
    add eax, 0xf1720
    mov byte [0x2e9c7], bl
    call 0x45230
    call 0x4dd90
    xor eax, eax
    call 0x91ca4
    cmp dword [0x125d4f], 0
    jne short loc_13b4
    xor edx, edx
    jmp short loc_13a4
loc_137c:
    lea eax, [edx*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x00, 0xfb, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xffb00]
    shl eax, 5
    mov bx, word [eax + 0x27e4d2]
    test bx, bx
    jl short loc_13a3
    mov word [eax + 0x27e4c4], bx
loc_13a3:
    inc edx
loc_13a4:
    movsx eax, word [0x1256d2]
    cmp edx, eax
    jl short loc_137c
    jmp near loc_1423
loc_13b4:
    mov edi, 0x50d
    mov esi, 0x10c
    xor edx, edx
    jmp short loc_1418
loc_13c2:
    lea eax, [edx*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x1c, 0x45, 0x00, 0xfb, 0x0f, 0x00    ; movsx ebx, word [eax*2 + 0xffb00]
    shl ebx, 5
    mov ax, word [ebx + 0x27e4c4]
    cmp ax, 0x509
    jb short loc_13ed
    jbe short loc_13fc
    cmp ax, 0x512
    je short loc_13fc
    jmp short loc_1417
loc_13ed:
    cmp ax, 0x500
    jne short loc_1417
    mov word [ebx + 0x27e4c4], di
    jmp short loc_1417
loc_13fc:
    lea eax, [edx*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x00, 0xfb, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xffb00]
    shl eax, 5
    mov word [eax + 0x27e4c4], si
loc_1417:
    inc edx
loc_1418:
    movsx eax, word [0x1256d2]
    cmp edx, eax
    jl short loc_13c2
loc_1423:
    xor edi, edi
    mov bx, word [0x2d6bd8]
    mov dword [0x8dd4], edi
    mov dword [0x8dd8], edi
loc_1438:
    test bx, bx
    jl near loc_157b
    movsx edx, bx
    imul edx, edx, 0x2c
    mov ax, word [edx + 0x2522da]
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jb short loc_149a
    jbe near loc_150b
    db 0x66, 0x3d, 0x1e, 0x00    ; cmp ax, 0x1e
    jb short loc_147b
    jbe near loc_1563
    db 0x66, 0x3d, 0x1f, 0x00    ; cmp ax, 0x1f
    jbe short loc_14d7
    db 0x66, 0x3d, 0x20, 0x00    ; cmp ax, 0x20
    je near loc_152f
    jmp near loc_156b
loc_147b:
    db 0x66, 0x3d, 0x19, 0x00    ; cmp ax, 0x19
    jb near loc_156b
    jbe near loc_150b
    db 0x66, 0x3d, 0x1a, 0x00    ; cmp ax, 0x1a
    je near loc_1563
    jmp near loc_156b
loc_149a:
    db 0x66, 0x3d, 0x05, 0x00    ; cmp ax, 5
    jb short loc_14c9
    db 0x66, 0x3d, 0x06, 0x00    ; cmp ax, 6
    jbe near loc_1563
    db 0x66, 0x3d, 0x0b, 0x00    ; cmp ax, 0xb
    jb near loc_156b
    jbe near loc_1563
    db 0x66, 0x3d, 0x0e, 0x00    ; cmp ax, 0xe
    jb near loc_156b
    jmp near loc_1563
loc_14c9:
    test ax, ax
    je near loc_1563
    jmp near loc_156b
loc_14d7:
    movsx edx, word [edx + 0x2522cc]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    add eax, 0x2c9cb4
    add eax, 8
    call 0x27780
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov bx, word [eax*2 + 0x240eb4]
    jmp near loc_1438
loc_150b:
    movsx ecx, word [edx + 0x2522cc]
    lea eax, [ecx*4]
    add eax, ecx
    lea eax, [eax*8]
    add eax, 0x2c9cb4
    add eax, 8
    call 0x27780
loc_152f:
    movsx edx, word [edx + 0x2522cc]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    add eax, 0x2c9cb4
    add eax, 4
    call 0x27780
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov bx, word [eax*2 + 0x240eb4]
    jmp near loc_1438
loc_1563:
    movsx eax, bx
    call 0x28ff0
loc_156b:
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov bx, word [eax*2 + 0x240eb4]
    jmp near loc_1438
loc_157b:
    mov edx, dword [0x8dd4]
    dec edx
    test edx, edx
    jge short loc_158e
    mov edx, dword [0x121ec4]
    jmp short loc_15b7
loc_158e:
    mov ebx, dword [edx*4 + 0x84a40]
    dec edx
    mov ebx, dword [ebx]
    mov dword [edx*4 + 0x74704], ebx
    test edx, edx
    jge short loc_158e
    mov edx, dword [0x121ec4]
    jmp short loc_15b7
loc_15ab:
    mov eax, dword [edx*4 + 0xd20b8]
    call 0x27780
loc_15b7:
    dec edx
    test edx, edx
    jge short loc_15ab
    mov ecx, 0x10
    mov edi, 0xd39f8
    xor eax, eax
    xor bh, bh
    mov dword [0x120da0], eax
    mov eax, 0x1010101
    mov byte [0x126229], bh
    cmp ecx, 4
    jae short loc_15ec
    test cl, 1
    je short loc_15e5
    db 0xaa    ; stosb byte es:[edi], al
loc_15e5:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_1617
loc_15ec:
    test edi, 1
    je short loc_15f6
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_15f6:
    test edi, 2
    je short loc_1603
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_1603:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_1611
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_1611:
    test bl, 1
    je short loc_1617
    db 0xaa    ; stosb byte es:[edi], al
loc_1617:
    mov cl, 1
    call 0x50020
    mov byte [0x12623a], cl
    call 0x792ec
    call 0x4fe70
    call 0x4fcb0
    call 0x4fb50
    xor eax, eax
loc_163a:
    add esp, 0x4ff8
    pop ebp
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
    push edi
    push ebp
    sub esp, 0x4ff4
    mov byte [esp + 0x4ff0], al
    mov ebx, 0x75
    mov edx, 0x26f4
    mov dword [esp + 0x4fec], ebx
    test al, al
    jge short loc_1699
    mov cl, 1
    neg al
    mov byte [0x126226], cl
    sub al, cl
    mov byte [0x12622a], cl
    mov byte [0x12622b], al
    mov eax, 0xffffffff
    jmp near loc_2096
loc_1699:
    call 0x4fcb0
    cmp byte [0x126226], 2
    jne short loc_170a
    movsx ax, byte [0x126224]
    cmp ax, word [0x2f2926]
    je short loc_170a
    mov ebx, 0x2700
    mov al, byte [esp + 0x4ff0]
    mov cl, byte [0x126224]
    mov esi, dword [0x1261df]
    add al, 0x41
    add cl, 0x30
    mov byte [0x2704], al
    cmp esi, 9
    jle short loc_1702
    movsx edx, byte [0x126224]
    mov esi, 0xa
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    add eax, 0x30
    mov byte [0x2707], cl
    mov byte [0x2706], al
    jmp short loc_1718
loc_1702:
    mov byte [0x2707], cl
    jmp short loc_1718
loc_170a:
    mov al, byte [esp + 0x4ff0]
    add al, 0x30
    mov ebx, edx
    mov byte [edx + 4], al
loc_1718:
    mov edx, 0x26f0
    mov eax, ebx
    call 0xa0223
    mov esi, eax
    mov edi, eax
    test eax, eax
    jne short loc_173e
    mov eax, 0xffffffff
    add esp, 0x4ff4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_173e:
    mov edx, 4
    mov ecx, eax
    xor bh, bh
    lea eax, [esp + 0x4fec]
    mov byte [0x12623a], bh
    mov ebx, 1
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x1261df
    mov ecx, esi
    call 0x7843a
    movsx eax, byte [esp + 0x4ff0]
    imul eax, eax, 0x16
    mov ebx, 1
    mov edx, 0x13
    mov ecx, esi
    add eax, 0x125b14
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x1261eb
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x1261e7
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x1261e3
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x64
    mov edx, 0xa0
    mov eax, dword [0x248eb0]
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x2d7c10
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x2000
    mov edx, 0x20
    mov eax, 0x27e4b4
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x2d7c12
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x400
    mov edx, 0x28
    mov eax, 0x2c9cb4
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x1000
    mov edx, 0x2c
    mov eax, 0x2522b4
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x401
    mov edx, 2
    mov eax, 0x2d73d4
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x24b334
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x24dfb4
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x401
    mov edx, 2
    mov eax, 0x2d6bd2
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x24ffb4
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x240eb4
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x1256d0
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x100
    mov edx, 0xc
    mov eax, 0x10a700
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 0x3f60
    mov eax, 0xf1720
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0xf1620
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x1256d2
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 0xc00
    mov eax, 0xffb00
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x800
    mov edx, 4
    mov eax, 0x11ed00
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x800
    mov edx, 4
    mov eax, 0x11cd00
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x1256ce
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x8d8c
    mov ecx, esi
    call 0x7843a
    mov edx, 2
    mov eax, 0xf03f8
    movsx ebx, word [0x8d8c]
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x1256c2
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x40
    mov edx, 2
    mov eax, 0x8b038
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x40
    mov edx, 2
    mov eax, 0x8a6b0
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x80
    mov edx, 1
    mov eax, 0x232eb4
    mov ecx, esi
    call 0x7843a
    mov ebx, 0x1800
    mov edx, 1
    mov eax, 0xd21f8
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 0x80
    mov eax, 0x7f08
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x1256ac
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0x7a700
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0x7a900
    mov ecx, esi
    call 0x7843a
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0x7a800
    mov ecx, esi
    call 0x7843a
    xor eax, eax
    jmp short loc_1aea
loc_1ab3:
    lea ebx, [eax*4]
    mov ebp, dword [ebx + 0xd3a08]
    cmp ebp, 0xd3a08
    jl short loc_1ae4
    cmp ebp, 0xe79b8
    jge short loc_1ae4
    mov byte [esp + eax], 1
    mov edx, ebp
    sub edx, 0xd3a08
    mov dword [ebx + 0xd3a08], edx
    jmp short loc_1ae9
loc_1ae4:
    xor dl, dl
    mov byte [esp + eax], dl
loc_1ae9:
    inc eax
loc_1aea:
    cmp eax, 0x4fec
    jl short loc_1ab3
    mov ebx, 0x4fec
    mov edx, 1
    mov eax, esp
    mov ecx, edi
    call 0x7843a
    mov ebx, 0x4fec
    mov edx, 4
    mov eax, 0xd3a08
    mov ecx, edi
    call 0x7843a
    xor eax, eax
    cmp eax, 0x4fec
    jl short loc_1b27
    xor eax, eax
    jmp short loc_1b6d
loc_1b27:
    cmp byte [esp + eax], 0
    je short loc_1b41
    mov edx, dword [eax*4 + 0xd3a08]
    add edx, 0xd3a08
    mov dword [eax*4 + 0xd3a08], edx
loc_1b41:
    inc eax
    cmp eax, 0x4fec
    jl short loc_1b27
    xor eax, eax
    jmp short loc_1b6d
loc_1b4d:
    lea ebx, [eax*4]
    mov ecx, dword [ebx + 0xea3f8]
    test ecx, ecx
    je short loc_1b6c
    mov edx, ecx
    sub edx, 0xd3a08
    mov dword [ebx + 0xea3f8], edx
loc_1b6c:
    inc eax
loc_1b6d:
    cmp eax, 0x1800
    jl short loc_1b4d
    mov ebx, 0x1800
    mov edx, 4
    mov eax, 0xea3f8
    mov ecx, edi
    call 0x7843a
    xor eax, eax
    cmp eax, 0x1800
    jl short loc_1b9a
    xor eax, eax
    jmp near loc_1c9d
loc_1b9a:
    lea ebx, [eax*4]
    mov esi, dword [ebx + 0xea3f8]
    test esi, esi
    je short loc_1bb9
    mov edx, esi
    add edx, 0xd3a08
    mov dword [ebx + 0xea3f8], edx
loc_1bb9:
    inc eax
    cmp eax, 0x1800
    jl short loc_1b9a
    xor eax, eax
    jmp near loc_1c9d
loc_1bc8:
    imul edx, eax, 0x2c
    movsx edx, word [edx + 0x2522c2]
    xor bh, bh
    mov ebp, dword [edx*4 + 0xea3f8]
    mov byte [esp + eax], bh
    test ebp, ebp
    je near loc_1c9c
    lea ebx, [eax*8]
    add ebx, eax
    lea ebx, [ebx*8]
    sub ebx, eax
    mov edx, 0xd3a08
    mov ecx, dword [ebx + 0x8b0eb]
    cmp ecx, edx
    jl short loc_1c26
    cmp ecx, 0xe79b8
    jge short loc_1c26
    mov cl, byte [esp + eax]
    mov ebp, dword [ebx + 0x8b0eb]
    or cl, 1
    sub ebp, edx
    mov byte [esp + eax], cl
    mov dword [ebx + 0x8b0eb], ebp
loc_1c26:
    lea ebx, [eax*8]
    add ebx, eax
    lea ebx, [ebx*8]
    sub ebx, eax
    mov ecx, dword [ebx + 0x8b0f7]
    cmp edx, ecx
    jg short loc_1c61
    cmp ecx, 0xe79b8
    jge short loc_1c61
    mov ch, byte [esp + eax]
    mov ebp, dword [ebx + 0x8b0f7]
    or ch, 2
    sub ebp, edx
    mov byte [esp + eax], ch
    mov dword [ebx + 0x8b0f7], ebp
loc_1c61:
    lea ebx, [eax*8]
    add ebx, eax
    lea ebx, [ebx*8]
    sub ebx, eax
    mov ecx, dword [ebx + 0x8b0fb]
    cmp edx, ecx
    jg short loc_1c9c
    cmp ecx, 0xe79b8
    jge short loc_1c9c
    mov cl, byte [esp + eax]
    mov ebp, dword [ebx + 0x8b0fb]
    or cl, 4
    sub ebp, edx
    mov byte [esp + eax], cl
    mov dword [ebx + 0x8b0fb], ebp
loc_1c9c:
    inc eax
loc_1c9d:
    cmp eax, 0x1000
    jl near loc_1bc8
    mov ebx, 0x1000
    mov edx, 1
    mov eax, esp
    mov ecx, edi
    call 0x7843a
    mov ebx, 0x1000
    mov edx, 0x47
    mov eax, 0x8b0b8
    mov ecx, edi
    call 0x7843a
    xor eax, eax
    jmp near loc_1d4e
loc_1cd8:
    imul edx, eax, 0x2c
    movsx edx, word [edx + 0x2522c2]
    cmp dword [edx*4 + 0xea3f8], 0
    je short loc_1d4d
    mov ch, byte [esp + eax]
    mov edx, 0xd3a08
    test ch, 1
    je short loc_1d11
    lea ebx, [eax*8]
    add ebx, eax
    lea ebx, [ebx*8]
    sub ebx, eax
    add dword [ebx + 0x8b0eb], edx
loc_1d11:
    test byte [esp + eax], 2
    je short loc_1d2f
    lea ebx, [eax*8]
    add ebx, eax
    lea ebx, [ebx*8]
    sub ebx, eax
    add dword [ebx + 0x8b0f7], edx
loc_1d2f:
    test byte [esp + eax], 4
    je short loc_1d4d
    lea ebx, [eax*8]
    add ebx, eax
    lea ebx, [ebx*8]
    sub ebx, eax
    add dword [ebx + 0x8b0fb], edx
loc_1d4d:
    inc eax
loc_1d4e:
    cmp eax, 0x1000
    jl short loc_1cd8
    mov ebx, 1
    mov edx, 4
    mov eax, 0x121ec8
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x2d7c0c
    mov ecx, edi
    call 0x7843a
    mov ebx, 0x100
    mov edx, 2
    mov eax, 0x2490b4
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x121ec4
    mov ecx, edi
    call 0x7843a
    mov ebx, 0x40
    mov edx, 2
    mov eax, 0x8a630
    mov ecx, edi
    call 0x7843a
    mov eax, dword [0x121ec4]
    dec eax
    jmp short loc_1de0
loc_1dcb:
    mov ebx, dword [eax*4 + 0xd20b8]
    dec eax
    sub ebx, 0x2c9cb4
    mov dword [eax*4 + 0xd20bc], ebx
loc_1de0:
    test eax, eax
    jge short loc_1dcb
    mov ebx, 0x40
    mov edx, 4
    mov eax, 0xd20b8
    mov ecx, edi
    call 0x7843a
    mov eax, dword [0x121ec4]
    dec eax
    jmp short loc_1e17
loc_1e02:
    mov ebx, dword [eax*4 + 0xd20b8]
    dec eax
    add ebx, 0x2c9cb4
    mov dword [eax*4 + 0xd20bc], ebx
loc_1e17:
    test eax, eax
    jge short loc_1e02
    mov ebx, 0x40
    mov edx, 4
    mov eax, 0x8a830
    mov ecx, edi
    call 0x7843a
    mov ebx, 0x40
    mov edx, 4
    mov eax, 0x8a730
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov eax, 0x126232
    mov ecx, edi
    mov edx, ebx
    call 0x7843a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x125cf5
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x125cfd
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x12619b
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x12619f
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x1261a3
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov eax, 0x12577c
    mov ecx, edi
    mov edx, ebx
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x125d37
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x125d53
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x1261ab
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x125cfb
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov eax, 0x12577f
    mov ecx, edi
    mov edx, ebx
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x125d47
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x1261f3
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x1261cf
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x1256c8
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x2f2920
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 0x20
    mov eax, 0x2f2818
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov eax, 0x12623b
    mov ecx, edi
    mov edx, ebx
    call 0x7843a
    mov ebx, 1
    mov edx, 0x200
    mov eax, 0x88c80
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x2d58d4
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x1256ca
    mov ecx, edi
    call 0x7843a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x2d58c8
    mov ecx, edi
    call 0x7843a
    mov eax, edi
    call 0x9fcc9
    cmp dword [0x1261df], 2
    jge short loc_207e
    mov edx, 0x271c
    mov eax, 0xf7500
    call 0x9fc25
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    add edx, eax
    mov eax, 0x7a
    call 0x15e50
loc_207e:
    mov byte [0x12623a], 1
    call 0x4fcb0
    mov eax, dword [0x2d6bbc]
    mov dword [0x121eac], eax
    xor eax, eax
loc_2096:
    add esp, 0x4ff4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
loc_20b0:
    push esi
    push edi
    push ebp
    sub esp, 0x14
    mov edi, eax
    mov dword [esp + 4], edx
    mov esi, ebx
    mov eax, dword [0x2d6bc8]
    mov dword [esp], ebx
    xor edx, edx
    mov ebx, dword [0x2d6bc4]
    mov dword [esp + 8], edx
    mov dword [esp + 0xc], edx
    mov dword [esp + 0x10], edx
    mov edx, dword [esp + 4]
    dec eax
    sub edx, 0xc
    dec ebx
    mov dword [esp + 4], edx
    shl edx, 0x10
    test esi, esi
    jne short loc_2116
    push ebx
    push eax
    push esi
    push esi
    push 0x1a
    push esi
    xor ecx, ecx
    push esi
    mov ebx, 0x10000
    mov eax, edi
    push 0x51a
    shl eax, 0x10
    call 0x6eb5e
    mov eax, 1
    jmp near loc_2209
loc_2116:
    jge short loc_213b
    push ebx
    push eax
    push 0
    push 0
    push 0x1a
    push 0
    xor ecx, ecx
    push 0
    mov ebx, 0x10000
    lea eax, [edi - 0x32]
    push 0x537
    shl eax, 0x10
    call 0x6eb5e
loc_213b:
    mov ebp, 0xa
loc_2140:
    cmp esi, 1
    jge short loc_214a
    cmp esi, -1
    jg short loc_2180
loc_214a:
    mov edx, esi
    mov eax, esi
    sar edx, 0x1f
    idiv ebp
    mov eax, edx
    call 0x9fca9
    add eax, 0x51a
    cwde
    db 0x66, 0x8b, 0x04, 0x45, 0x34, 0x93, 0x23, 0x00    ; mov ax, word [eax*2 + 0x239334]
    mov edx, dword [esp + 0x10]
    dec eax
    add edx, eax
    mov dword [esp + 0x10], edx
    mov edx, esi
    mov eax, esi
    sar edx, 0x1f
    idiv ebp
    mov esi, eax
    jmp short loc_2140
loc_2180:
    movsx eax, word [esp + 0x10]
    sar eax, 1
    mov esi, dword [esp]
loc_218a:
    sub edi, eax
    cmp esi, 1
    jge short loc_2196
    cmp esi, -1
    jg short loc_2207
loc_2196:
    mov ebp, 0xa
    mov edx, esi
    mov eax, esi
    sar edx, 0x1f
    idiv ebp
    mov eax, edx
    call 0x9fca9
    mov ebx, eax
    mov edx, esi
    mov eax, esi
    sar edx, 0x1f
    idiv ebp
    mov esi, eax
    mov eax, dword [0x2d6bc4]
    dec eax
    push eax
    mov eax, dword [0x2d6bc8]
    dec eax
    push eax
    xor ecx, ecx
    push 0
    add ebx, 0x51a
    mov edx, dword [esp + 0x10]
    push 0
    movsx eax, word [esp + 0x1c]
    push 0x1a
    movsx ebp, bx
    push eax
    movsx eax, word [esp + 0x20]
    mov ebx, 0x10000
    push eax
    shl edx, 0x10
    mov eax, edi
    push ebp
    shl eax, 0x10
    call 0x6eb5e
    db 0x0f, 0xbf, 0x04, 0x6d, 0x34, 0x93, 0x23, 0x00    ; movsx eax, word [ebp*2 + 0x239334]
    add eax, 2
    jmp short loc_218a
loc_2207:
    mov eax, edi
loc_2209:
    add esp, 0x14
    pop ebp
    pop edi
    pop esi
    ret
%else
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov edi, eax
    mov esi, edx
    mov dword [esp], edx
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x04, 0x45, 0x8c, 0x51, 0x0b, 0x00    ; mov eax, dword [eax*2 + 0xb518c]
    cmp dword [eax + 4], 0
    jne short loc_0052
    push 0x265c
    mov edx, esi
    mov eax, edi
    xor ecx, ecx
    xor ebx, ebx
    call 0x41930
    mov edx, 0x82
    lea ebx, [esi + 0x14]
    jmp near loc_00d4
loc_0052:
    xor ebp, ebp
    jmp short loc_00a9
loc_0056:
    lea eax, [ebp*4]
    sub eax, ebp
    mov eax, dword [ebx + eax*4 + 0x10]
    cmp eax, 3
    ja short loc_009a
    jmp dword cs:[eax*4 + 0x2eda0]
    push 0x2670
    jmp short loc_008a
    push 0x2680
    jmp short loc_008a
    push 0x2690
    jmp short loc_008a
    push 0x26a0
loc_008a:
    mov edx, esi
    mov eax, edi
    xor ecx, ecx
    xor ebx, ebx
    call 0x41930
    add esi, 8
loc_009a:
    cmp esi, 0xb4
    jl short loc_00a8
    mov esi, dword [esp]
    add edi, 0x5a
loc_00a8:
    inc ebp
loc_00a9:
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x1c, 0x45, 0x8c, 0x51, 0x0b, 0x00    ; mov ebx, dword [eax*2 + 0xb518c]
    cmp ebp, dword [ebx + 4]
    jl short loc_0056
    mov edx, 0x82
    lea ebx, [esi + 0xa]
loc_00d4:
    xor eax, eax
    call loc_0270
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0xc
    mov edi, eax
    mov esi, edx
    mov dword [esp + 4], ebx
    xor edx, edx
    mov dword [esp + 8], edx
loc_0105:
    imul ebp, dword [esp + 8], 0x2e
    mov ebx, dword [esp + 4]
    mov eax, ebx
    shl eax, 6
    sub eax, ebx
    lea eax, [eax*8]
    mov dword [esp], eax
    mov eax, 0xb1998
    add eax, dword [esp]
    add eax, 0x88
    mov edx, esi
    add eax, ebp
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, edi
    call 0x41930
    mov eax, dword [esp]
    mov edx, esi
    add ebp, eax
    xor ecx, ecx
    lea eax, [edi + 0x37]
    mov ebx, dword [ebp + 0xb1a36]
    call loc_20b0
    lea eax, [edi + 0x5f]
    mov edx, esi
    mov ebx, dword [ebp + 0xb1a3a]
    xor ecx, ecx
    call loc_20b0
    lea eax, [edi + 0x96]
    mov edx, esi
    mov ebx, dword [ebp + 0xb1a4a]
    xor ecx, ecx
    call loc_20b0
    lea eax, [edi + 0xd0]
    mov edx, esi
    mov ebx, dword [ebp + 0xb1a46]
    xor ecx, ecx
    call loc_20b0
    mov edx, dword [esp + 8]
    inc edx
    add esi, 8
    mov dword [esp + 8], edx
    cmp edx, 8
    jl near loc_0105
    mov eax, 1
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov edi, eax
    mov esi, edx
    xor edx, edx
    mov dword [esp], edx
loc_01d1:
    imul ebp, dword [esp], 0x2e
    mov eax, 0x22560
    mov edx, esi
    add eax, ebp
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, edi
    call 0x41930
    lea eax, [edi + 0x37]
    mov edx, esi
    mov ebx, dword [ebp + 0x22576]
    xor ecx, ecx
    call loc_20b0
    lea eax, [edi + 0x5f]
    mov edx, esi
    mov ebx, dword [ebp + 0x2257a]
    xor ecx, ecx
    call loc_20b0
    lea eax, [edi + 0x96]
    mov edx, esi
    mov ebx, dword [ebp + 0x2258a]
    xor ecx, ecx
    call loc_20b0
    lea eax, [edi + 0xd0]
    mov edx, esi
    mov ebx, dword [ebp + 0x22586]
    xor ecx, ecx
    call loc_20b0
    lea eax, [edi + 0xff]
    mov edx, esi
    mov ebx, dword [ebp + 0x2257e]
    xor ecx, ecx
    call loc_20b0
    mov ecx, dword [esp]
    inc ecx
    add esi, 8
    mov dword [esp], ecx
    cmp ecx, 4
    jl near loc_01d1
    mov eax, 1
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
loc_0270:
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov ebp, eax
    mov esi, edx
    mov edi, ebx
    push 0x26b0
    mov edx, edi
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call 0x41930
    mov ebx, ebp
    mov eax, ebx
    shl eax, 6
    mov edx, edi
    sub eax, ebx
    xor ecx, ecx
    lea eax, [eax*8]
    lea ebp, [esi + 0x32]
    mov dword [esp], eax
    mov ebx, dword [eax + 0xb19a0]
    mov eax, ebp
    add edi, 8
    call loc_20b0
    push 0x26c0
    mov edx, edi
    mov eax, esi
    xor ecx, ecx
    xor ebx, ebx
    call 0x41930
    mov ebx, dword [esp]
    mov edx, edi
    mov eax, ebp
    xor ecx, ecx
    mov ebx, dword [ebx + 0xb19a4]
    call loc_20b0
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    mov ecx, eax
    mov ebx, edx
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x04, 0x45, 0x8c, 0x51, 0x0b, 0x00    ; mov eax, dword [eax*2 + 0xb518c]
    mov edx, dword [eax]
    sub edx, ebx
    test edx, edx
    jge short loc_0324
    mov eax, 0xffffffff
    pop ecx
    pop ebx
    ret
loc_0324:
    cmp dword [eax + 4], 9
    jl short loc_0332
    mov eax, 0xfffffffe
    pop ecx
    pop ebx
    ret
loc_0332:
    mov dword [eax], edx
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x14, 0x45, 0x8c, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb518c]
    mov ebx, dword [edx + 4]
    lea eax, [ebx*4]
    sub eax, ebx
    mov dword [edx + eax*4 + 0x10], ecx
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x14, 0x45, 0x8c, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb518c]
    mov eax, 1
    add dword [edx + 4], eax
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
    push ebx
    push ecx
    push edx
    push esi
    mov ecx, eax
    mov esi, 0x64
    xor edx, edx
loc_039d:
    mov eax, ecx
    shl eax, 6
    sub eax, ecx
    lea ebx, [eax*8]
    imul eax, edx, 0x2e
    inc edx
    mov dword [ebx + eax + 0xb1a3a], esi
    cmp edx, 8
    jl short loc_039d
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    push ebx
    push ecx
    push edx
    push esi
    mov ecx, eax
    mov esi, 0x64
    xor edx, edx
loc_03cd:
    mov eax, ecx
    shl eax, 6
    sub eax, ecx
    lea ebx, [eax*8]
    imul eax, edx, 0x2e
    inc edx
    mov dword [ebx + eax + 0xb1a36], esi
    cmp edx, 8
    jl short loc_03cd
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    push ecx
    push esi
    push edi
    push ebp
    mov edi, eax
    mov esi, edx
    mov ebp, ebx
    xor edx, edx
loc_03fc:
    imul ebx, edx, 0x2e
    mov eax, edi
    shl eax, 6
    sub eax, edi
    mov ecx, 0xb1998
    lea eax, [eax*8]
    add ecx, eax
    add ecx, 0x88
    add ecx, ebx
    cmp ecx, esi
    jne short loc_0449
    add eax, ebx
    mov edx, dword [eax + 0xb1a3a]
    add edx, ebp
    mov dword [eax + 0xb1a3a], edx
    cmp edx, 0x64
    jle short loc_043f
    mov dword [eax + 0xb1a3a], 0x64
loc_043f:
    mov eax, 1
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_0449:
    inc edx
    cmp edx, 8
    jl short loc_03fc
    mov eax, 0xffffffff
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ecx
    push esi
    push edi
    push ebp
    mov edi, eax
    mov esi, edx
    mov ebp, ebx
    xor edx, edx
loc_046c:
    imul ebx, edx, 0x2e
    mov eax, edi
    shl eax, 6
    sub eax, edi
    mov ecx, 0xb1998
    lea eax, [eax*8]
    add ecx, eax
    add ecx, 0x88
    add ecx, ebx
    cmp ecx, esi
    jne short loc_04b9
    add eax, ebx
    mov edx, dword [eax + 0xb1a36]
    add edx, ebp
    mov dword [eax + 0xb1a36], edx
    cmp edx, 0x64
    jle short loc_04af
    mov dword [eax + 0xb1a36], 0x64
loc_04af:
    mov eax, 1
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
loc_04b9:
    inc edx
    cmp edx, 8
    jl short loc_046c
    mov eax, 0xffffffff
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ecx
    push esi
    mov esi, eax
    mov ecx, edx
    xor edx, edx
loc_04d8:
    imul ebx, edx, 0x2e
    mov eax, esi
    shl eax, 6
    sub eax, esi
    lea eax, [eax*8]
    add eax, 0xb1998
    add eax, 0x88
    add ebx, eax
    cmp ebx, ecx
    jne short loc_0501
    mov eax, 1
    pop esi
    pop ecx
    ret
loc_0501:
    inc edx
    cmp edx, 8
    jl short loc_04d8
    mov eax, 0xffffffff
    pop esi
    pop ecx
    ret
    nop
    push edx
    mov edx, 0xffffffff
    cwde
    mov word [0x8fde], dx
    mov edx, 0x26d0
    mov dword [0xe54a8], eax
    mov dword [0xf3204], edx
    pop edx
    ret
    push ecx
    push esi
    push edi
    push ebp
    mov ebp, edx
    mov edi, ebx
    mov edx, 0x26d4
    call 0xa2d71
    mov esi, eax
    test eax, eax
    je short loc_055f
    mov ebx, 1
    mov ecx, eax
    mov edx, edi
    mov eax, ebp
    call 0xa31ef
    mov eax, esi
    call 0xa2809
loc_055f:
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov dword [esp], eax
    mov si, word [0x261210]
    test si, si
    jge short loc_0592
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0592:
    mov edx, dword [esp]
    cmp si, dx
    je near loc_068b
    movsx eax, dx
    movsx edx, si
    mov ecx, edx
    mov ebx, eax
    shl ecx, 7
    shl ebx, 7
    sub ecx, edx
    sub ebx, eax
    lea ecx, [ecx*4]
    lea ebx, [ebx*4]
    sub ecx, edx
    sub ebx, eax
    add ecx, ecx
    db 0x8b, 0x3c, 0x5d, 0x18, 0x51, 0x0b, 0x00    ; mov edi, dword [ebx*2 + 0xb5118]
    db 0x8b, 0x2c, 0x5d, 0x14, 0x51, 0x0b, 0x00    ; mov ebp, dword [ebx*2 + 0xb5114]
    mov edx, dword [ecx + 0xb5118]
    mov eax, dword [ecx + 0xb5114]
    sub edx, edi
    sub eax, ebp
    call 0x65698
    db 0x66, 0x8b, 0x14, 0x5d, 0x98, 0x51, 0x0b, 0x00    ; mov dx, word [ebx*2 + 0xb5198]
    add edx, eax
    mov eax, dword [0x2454b4]
    dec eax
    push eax
    mov eax, dword [0x2454b8]
    dec eax
    push eax
    push 0
    xor eax, eax
    push 0
    sub edx, 0x400
    mov al, byte [ecx + 0xb52ec]
    push 0
    movsx ebx, dx
    push eax
    mov eax, ebx
    and dh, 7
    sar eax, 1
    movsx edx, dx
    add eax, 0x300
    push 0
    and eax, 0x7ff
    mov ecx, 0xa00000
    push 0x214
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    add ebx, 0x200
    lea eax, [eax*4]
    and ebx, 0x7ff
    test eax, eax
    jns short loc_065a
    neg eax
loc_065a:
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    db 0x0f, 0xbf, 0x1c, 0x5d, 0xa4, 0x7f, 0x1b, 0x00    ; movsx ebx, word [ebx*2 + 0x1b7fa4]
    sar edx, 8
    sar ebx, 7
    shl edx, 0xf
    shl ebx, 0xf
    sub ecx, edx
    lea edi, [ebx + 0xa00000]
    mov edx, ecx
    mov ebx, eax
    mov eax, edi
    xor ecx, ecx
    call 0x7169e
loc_068b:
    movsx eax, si
    db 0x66, 0x8b, 0x34, 0x45, 0x08, 0x11, 0x26, 0x00    ; mov si, word [eax*2 + 0x261108]
    test si, si
    jge near loc_0592
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push esi
    push edi
    push ebp
    sub esp, 0xc
    mov dword [esp + 4], edx
    mov dword [esp + 8], ebx
    mov ebp, ecx
    add al, 0x30
    xor edx, edx
    mov byte [0x26dc], al
    mov eax, 0x26d8
    call 0x7a82e
    mov esi, eax
    mov edi, eax
    cmp eax, -1
    je near loc_07f8
    mov ah, 0xff
    mov ebx, 1
    mov edx, 4
    mov ecx, esi
    mov byte [0x1af4a1], ah
    mov eax, esp
    call 0x7ab50
    cmp dword [esp], 0x75
    je short loc_073c
    movsx edi, word [0x261216]
    mov eax, edi
    shl eax, 7
    sub eax, edi
    lea eax, [eax*4]
    sub eax, edi
    mov edx, 0xb4f00
    add eax, eax
    add edx, eax
    mov eax, 0x72
    call 0x15e90
    mov eax, esi
    call 0x7ab25
    mov eax, 1
    jmp near loc_07f8
loc_073c:
    mov ebx, 1
    mov edx, 4
    mov eax, dword [esp + 0x1c]
    mov ecx, esi
    call 0x7ab50
    mov ebx, 1
    mov edx, 0x13
    mov eax, 0xbc0a0
    mov ecx, esi
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, dword [esp + 4]
    mov ecx, esi
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, dword [esp + 8]
    mov ecx, esi
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov ecx, esi
    mov eax, ebp
    call 0x7ab50
    cmp dword [0x1b7798], 0
    jne short loc_07c1
    mov ebx, 0x1af4a1
    mov edx, 0x3e80
    mov eax, 0x1b7798
    call 0x7a048
loc_07c1:
    mov edx, 0x64
    mov ebx, 0xa0
    mov eax, dword [0x1b7798]
    mov ecx, edi
    mov word [0x1aac1e], dx
    mov word [0x1adc1e], bx
    mov ebx, 0x64
    mov edx, 0xa0
    call 0x7ab50
    mov eax, edi
    call 0x7ab25
    xor eax, eax
loc_07f8:
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    ret 4
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x4ff8
    mov byte [esp + 0x4ff4], al
    mov dl, byte [esp + 0x4ff4]
    mov eax, 0x26d8
    test dl, dl
    jge short loc_085d
    mov dl, 1
    mov al, byte [esp + 0x4ff4]
    mov byte [0xe9825], dl
    neg al
    xor dh, dh
    sub al, dl
    mov byte [0xe9828], dh
    mov byte [0xe9829], al
    mov eax, 0xffffffff
    jmp near loc_163a
loc_085d:
    cmp byte [0xe9825], 2
    jne short loc_08d4
    movsx dx, byte [0xe9824]
    cmp dx, word [0x261216]
    je short loc_08d4
    mov al, byte [esp + 0x4ff4]
    mov ecx, 0x26e4
    add al, 0x41
    mov edx, dword [0xe97df]
    mov byte [0x26e8], al
    cmp edx, 9
    jle short loc_08c6
    movsx ebx, byte [0xe9824]
    mov esi, 0xa
    mov edx, ebx
    mov eax, ebx
    sar edx, 0x1f
    idiv esi
    add eax, 0x30
    mov edx, ebx
    mov byte [0x26ea], al
    sar edx, 0x1f
    mov eax, ebx
    idiv esi
    add edx, 0x30
    mov byte [0x26eb], dl
    jmp short loc_08e3
loc_08c6:
    mov al, byte [0xe9824]
    add al, 0x30
    mov byte [0x26eb], al
    jmp short loc_08e3
loc_08d4:
    mov dl, byte [esp + 0x4ff4]
    add dl, 0x30
    mov ecx, eax
    mov byte [eax + 4], dl
loc_08e3:
    mov eax, ecx
    xor edx, edx
    call 0x7a82e
    mov esi, eax
    mov edi, eax
    cmp eax, -1
    je near loc_163a
    mov edx, 4
    mov ecx, eax
    xor bl, bl
    lea eax, [esp + 0x4ff0]
    mov byte [0xe983a], bl
    mov ebx, 1
    call 0x7ab50
    cmp dword [esp + 0x4ff0], 0x75
    je short loc_0977
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    add edx, eax
    mov eax, 0x72
    call 0x15e90
    mov eax, esi
    call 0x7ab25
    mov eax, dword [0x2454ac]
    mov dword [0xe54ac], eax
    mov byte [0xe983a], 1
    mov eax, 1
    add esp, 0x4ff8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0977:
    mov ebx, 1
    mov edx, 4
    lea eax, [esp + 0x4fec]
    mov ecx, esi
    call 0x7ab50
    mov ecx, dword [esp + 0x4fec]
    movsx eax, word [0x261214]
    cmp eax, ecx
    je short loc_09f5
    mov eax, esi
    call 0x7ab25
    mov eax, dword [0x2454ac]
    mov dword [0xe54ac], eax
    mov al, 1
    movsx edx, word [0x261216]
    mov byte [0xe983a], al
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    add edx, eax
    mov eax, 0x7c
    call 0x15e90
    mov eax, 1
    add esp, 0x4ff8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_09f5:
    cmp word [0x261214], 1
    jle short loc_0a34
    mov bh, 1
    mov edx, 0x64
    xor ecx, ecx
    mov byte [0xe982d], bh
    mov byte [0xe982f], bh
    call 0x50a30
    call 0x17f30
    push 0x26f4
    mov eax, 0xa0
    xor ebx, ebx
    call 0x41610
    call 0x64550
loc_0a34:
    call 0x52900
    call 0x94a94
    call 0x5b280
    call 0x8bfbd
    cmp word [0x261214], 1
    jle short loc_0a65
    mov ebx, 1
    mov edx, 0x13
    mov eax, 0xb2370
    mov ecx, edi
    jmp short loc_0a81
loc_0a65:
    movsx eax, byte [esp + 0x4ff4]
    imul eax, eax, 0x16
    mov ebx, 1
    mov edx, 0x13
    mov ecx, edi
    add eax, 0xe9114
loc_0a81:
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe97eb
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe97e7
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe97e3
    mov ecx, edi
    call 0x7ab50
    mov eax, dword [0xe97e7]
    mov ch, 1
    mov dword [0xe97d7], eax
    mov eax, dword [0xe97eb]
    mov esi, dword [0x1b7798]
    mov dword [0xe97db], eax
    mov eax, dword [0xe97e3]
    mov byte [0x1af4a1], ch
    mov dword [0xe97d3], eax
    test esi, esi
    jne short loc_0b0c
    mov ebx, 0x1af4a1
    mov edx, 0x3e80
    mov eax, 0x1b7798
    call 0x7a048
loc_0b0c:
    mov eax, 0x64
    mov edx, 0xa0
    mov ebx, 0x64
    mov ecx, edi
    mov word [0x1aac1e], ax
    mov word [0x1adc1e], dx
    mov edx, 0xa0
    mov eax, dword [0x1b7798]
    call 0x7ab50
    mov ebx, 1
    mov edx, 2
    mov eax, 0x246500
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x2000
    mov edx, 0x20
    mov eax, 0x1ecda4
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 2
    mov eax, 0x246502
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x400
    mov edx, 0x28
    mov eax, 0x2385a4
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x1000
    mov edx, 0x2c
    mov eax, 0x1c0ba4
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x401
    mov edx, 2
    mov eax, 0x245cc4
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x1b9c24
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x1bc8a4
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x401
    mov edx, 2
    mov eax, 0x2454c2
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x1be8a4
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x1af7a4
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe8cd0
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x100
    mov edx, 0xc
    mov eax, 0xcdd00
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 0x3f60
    mov eax, 0xb4f00
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0xb4e00
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe8cd2
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 0xc00
    mov eax, 0xc3100
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x800
    mov edx, 4
    mov eax, 0xe2300
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x800
    mov edx, 4
    mov eax, 0xe0300
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe8cce
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 2
    mov eax, 0x8d30
    mov ecx, edi
    call 0x7ab50
    mov edx, 2
    mov eax, 0xb1198
    movsx ebx, word [0x8d30]
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe8cc0
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x40
    mov edx, 2
    mov eax, 0x4e568
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x40
    mov edx, 2
    mov eax, 0x4dde0
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x80
    mov edx, 1
    mov eax, 0x1a17a4
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x1800
    mov edx, 1
    mov eax, 0x959d8
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 0x80
    mov eax, 0x7ee0
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe8cac
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0x41ee0
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0x420e0
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0x41fe0
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x4fec
    mov edx, 1
    mov eax, esp
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x4fec
    mov edx, 4
    mov eax, 0x971e8
    mov ecx, edi
    call 0x7ab50
    xor edx, edx
    jmp short loc_0e43
loc_0e28:
    cmp byte [esp + edx], 0
    je short loc_0e42
    mov ebx, dword [edx*4 + 0x971e8]
    add ebx, 0x971e8
    mov dword [edx*4 + 0x971e8], ebx
loc_0e42:
    inc edx
loc_0e43:
    cmp edx, 0x4fec
    jl short loc_0e28
    mov ebx, 0x1800
    mov edx, 4
    mov eax, 0xab198
    mov ecx, edi
    call 0x7ab50
    xor edx, edx
    jmp short loc_0e85
loc_0e65:
    lea eax, [edx*4]
    mov ebp, dword [eax + 0xab198]
    test ebp, ebp
    je short loc_0e84
    mov ebx, ebp
    add ebx, 0x971e8
    mov dword [eax + 0xab198], ebx
loc_0e84:
    inc edx
loc_0e85:
    cmp edx, 0x1800
    jl short loc_0e65
    mov ebx, 0x1000
    mov edx, 1
    mov eax, esp
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x1000
    mov edx, 0x47
    mov eax, 0x4e9d8
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x971e8
    xor edx, edx
    jmp short loc_0f1a
loc_0ebf:
    test byte [esp + edx], 1
    je short loc_0edd
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    add dword [eax + 0x4ea0b], ebx
loc_0edd:
    test byte [esp + edx], 2
    je short loc_0efb
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    add dword [eax + 0x4ea17], ebx
loc_0efb:
    test byte [esp + edx], 4
    je short loc_0f19
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    add dword [eax + 0x4ea1b], ebx
loc_0f19:
    inc edx
loc_0f1a:
    cmp edx, 0x1000
    jl short loc_0ebf
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe54c8
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 2
    mov eax, 0x2464fc
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x100
    mov edx, 2
    mov eax, 0x1b79a4
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe54c4
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x40
    mov edx, 2
    mov eax, 0x4dcb0
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x40
    mov edx, 4
    mov eax, 0x4e698
    mov ecx, edi
    call 0x7ab50
    mov edx, dword [0xe54c4]
    dec edx
    jmp short loc_0fc4
loc_0faf:
    mov ebx, dword [edx*4 + 0x4e698]
    dec edx
    add ebx, 0x2385a4
    mov dword [edx*4 + 0x4e69c], ebx
loc_0fc4:
    test edx, edx
    jge short loc_0faf
    mov ebx, 0x40
    mov edx, 4
    mov eax, 0x4e8d8
    mov ecx, edi
    call 0x7ab50
    mov ebx, 0x40
    mov edx, 4
    mov eax, 0x4e7d8
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov eax, 0xe9832
    mov ecx, edi
    mov edx, ebx
    call 0x7ab50
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe92f5
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe92fd
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe979b
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, dword [0xe979b]
    mov ecx, edi
    mov dword [0xe97b7], eax
    mov eax, 0xe979f
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, dword [0xe979f]
    mov ecx, edi
    mov dword [0xe97b3], eax
    mov eax, 0xe97a3
    call 0x7ab50
    mov ebx, 1
    mov eax, dword [0xe97a3]
    mov ecx, edi
    mov dword [0xe97bb], eax
    mov edx, ebx
    mov eax, 0xe8d7c
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe9337
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe9353
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe97ab
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 2
    mov eax, dword [0xe97ab]
    mov ecx, edi
    mov dword [0xe97c3], eax
    mov eax, 0xe92fb
    call 0x7ab50
    mov ebx, 1
    mov eax, 0xe8d7f
    mov ecx, edi
    mov edx, ebx
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe9347
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, dword [0xe9347]
    mov ecx, edi
    mov dword [0xe9343], eax
    mov eax, 0xe97f3
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, dword [0xe97f3]
    mov ecx, edi
    mov dword [0xe97ef], eax
    mov eax, 0xe97cf
    call 0x7ab50
    mov ebx, 1
    mov edx, 2
    mov eax, dword [0xe97cf]
    mov ecx, edi
    mov dword [0xe97cb], eax
    mov eax, 0xe8cc8
    call 0x7ab50
    mov ebx, 1
    mov edx, 2
    mov eax, 0x261210
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 0x20
    mov eax, 0x261108
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov eax, 0xe983b
    mov ecx, edi
    mov edx, ebx
    call 0x7ab50
    mov ebx, 1
    mov edx, 0x200
    mov eax, 0x4c460
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, 0x2441c4
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe8cca
    mov ecx, edi
    call 0x7ab50
    mov ebx, 1
    mov edx, 4
    mov eax, 0x2441b8
    mov ecx, edi
    call 0x7ab50
    mov eax, edi
    call 0x7ab25
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xb5244], 0
    je short loc_126c
    xor edx, edx
    mov ecx, 1
    mov dword [0x7e4c], edx
    mov dword [0x7e50], edx
    mov word [eax + 0xb5244], cx
loc_126c:
    mov ecx, 0x300
    mov ax, word [0x261216]
    mov edi, 0x1af4a4
    mov word [0xe8cc6], ax
    xor eax, eax
    cmp ecx, 4
    jae short loc_1296
    test cl, 1
    je short loc_128f
    db 0xaa    ; stosb byte es:[edi], al
loc_128f:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_12c1
loc_1296:
    test edi, 1
    je short loc_12a0
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_12a0:
    test edi, 2
    je short loc_12ad
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_12ad:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_12bb
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_12bb:
    test bl, 1
    je short loc_12c1
    db 0xaa    ; stosb byte es:[edi], al
loc_12c1:
    call 0x5b280
    call 0x50790
    mov al, byte [0xe97eb]
    mov ah, 0xb
    mul ah
    mov ah, byte [0xe97e7]
    add al, ah
    mov byte [0xe9838], al
    xor eax, eax
    mov al, byte [0xe9838]
    imul eax, eax, 0xd
    add eax, 0xe54d4
    call 0x5a2a0
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov byte [eax + 0xb52a2], 4
    xor ecx, ecx
    mov dh, byte [eax + 0xb52cb]
    mov dword [0xe97a7], ecx
    test dh, dh
    je short loc_1338
    movsx edx, word [eax + 0xb5240]
    mov eax, 0x32
    call 0x5aca0
loc_1338:
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov bl, 1
    add eax, 0xb4f00
    mov byte [0x22747], bl
    call 0x47d00
    call 0x50a30
    xor eax, eax
    call 0x947e4
    cmp dword [0xe934f], 0
    jne short loc_13b4
    xor edx, edx
    jmp short loc_13a4
loc_137c:
    lea eax, [edx*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x00, 0x31, 0x0c, 0x00    ; movsx eax, word [eax*2 + 0xc3100]
    shl eax, 5
    mov bx, word [eax + 0x1ecdc2]
    test bx, bx
    jl short loc_13a3
    mov word [eax + 0x1ecdb4], bx
loc_13a3:
    inc edx
loc_13a4:
    movsx eax, word [0xe8cd2]
    cmp edx, eax
    jl short loc_137c
    jmp near loc_1423
loc_13b4:
    mov edi, 0x50d
    mov esi, 0x10c
    xor edx, edx
    jmp short loc_1418
loc_13c2:
    lea eax, [edx*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x1c, 0x45, 0x00, 0x31, 0x0c, 0x00    ; movsx ebx, word [eax*2 + 0xc3100]
    shl ebx, 5
    mov ax, word [ebx + 0x1ecdb4]
    cmp ax, 0x509
    jb short loc_13ed
    jbe short loc_13fc
    cmp ax, 0x512
    je short loc_13fc
    jmp short loc_1417
loc_13ed:
    cmp ax, 0x500
    jne short loc_1417
    mov word [ebx + 0x1ecdb4], di
    jmp short loc_1417
loc_13fc:
    lea eax, [edx*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x00, 0x31, 0x0c, 0x00    ; movsx eax, word [eax*2 + 0xc3100]
    shl eax, 5
    mov word [eax + 0x1ecdb4], si
loc_1417:
    inc edx
loc_1418:
    movsx eax, word [0xe8cd2]
    cmp edx, eax
    jl short loc_13c2
loc_1423:
    xor edi, edi
    mov bx, word [0x2454c8]
    mov dword [0x8d78], edi
    mov dword [0x8d7c], edi
loc_1438:
    test bx, bx
    jl near loc_157b
    movsx edx, bx
    imul edx, edx, 0x2c
    mov ax, word [edx + 0x1c0bca]
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jb short loc_149a
    jbe near loc_150b
    db 0x66, 0x3d, 0x1e, 0x00    ; cmp ax, 0x1e
    jb short loc_147b
    jbe near loc_1563
    db 0x66, 0x3d, 0x1f, 0x00    ; cmp ax, 0x1f
    jbe short loc_14d7
    db 0x66, 0x3d, 0x20, 0x00    ; cmp ax, 0x20
    je near loc_152f
    jmp near loc_156b
loc_147b:
    db 0x66, 0x3d, 0x19, 0x00    ; cmp ax, 0x19
    jb near loc_156b
    jbe near loc_150b
    db 0x66, 0x3d, 0x1a, 0x00    ; cmp ax, 0x1a
    je near loc_1563
    jmp near loc_156b
loc_149a:
    db 0x66, 0x3d, 0x05, 0x00    ; cmp ax, 5
    jb short loc_14c9
    db 0x66, 0x3d, 0x06, 0x00    ; cmp ax, 6
    jbe near loc_1563
    db 0x66, 0x3d, 0x0b, 0x00    ; cmp ax, 0xb
    jb near loc_156b
    jbe near loc_1563
    db 0x66, 0x3d, 0x0e, 0x00    ; cmp ax, 0xe
    jb near loc_156b
    jmp near loc_1563
loc_14c9:
    test ax, ax
    je near loc_1563
    jmp near loc_156b
loc_14d7:
    movsx edx, word [edx + 0x1c0bbc]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    add eax, 0x2385a4
    add eax, 8
    call 0x273d0
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [eax*2 + 0x1af7a4]
    jmp near loc_1438
loc_150b:
    movsx ecx, word [edx + 0x1c0bbc]
    lea eax, [ecx*4]
    add eax, ecx
    lea eax, [eax*8]
    add eax, 0x2385a4
    add eax, 8
    call 0x273d0
loc_152f:
    movsx edx, word [edx + 0x1c0bbc]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    add eax, 0x2385a4
    add eax, 4
    call 0x273d0
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [eax*2 + 0x1af7a4]
    jmp near loc_1438
loc_1563:
    movsx eax, bx
    call 0x28c20
loc_156b:
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [eax*2 + 0x1af7a4]
    jmp near loc_1438
loc_157b:
    mov edx, dword [0x8d78]
    dec edx
    test edx, edx
    jge short loc_158e
    mov edx, dword [0xe54c4]
    jmp short loc_15b7
loc_158e:
    mov ebx, dword [edx*4 + 0x481e0]
    dec edx
    mov ebx, dword [ebx]
    mov dword [edx*4 + 0x3bee4], ebx
    test edx, edx
    jge short loc_158e
    mov edx, dword [0xe54c4]
    jmp short loc_15b7
loc_15ab:
    mov eax, dword [edx*4 + 0x4e698]
    call 0x273d0
loc_15b7:
    dec edx
    test edx, edx
    jge short loc_15ab
    mov ecx, 0x10
    mov edi, 0x971d8
    xor eax, eax
    xor bh, bh
    mov dword [0xe43a0], eax
    mov eax, 0x1010101
    mov byte [0xe9827], bh
    cmp ecx, 4
    jae short loc_15ec
    test cl, 1
    je short loc_15e5
    db 0xaa    ; stosb byte es:[edi], al
loc_15e5:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_1617
loc_15ec:
    test edi, 1
    je short loc_15f6
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_15f6:
    test edi, 2
    je short loc_1603
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_1603:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_1611
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_1611:
    test bl, 1
    je short loc_1617
    db 0xaa    ; stosb byte es:[edi], al
loc_1617:
    mov cl, 1
    call 0x52c80
    mov byte [0xe983a], cl
    call 0x7be2c
    call 0x52ad0
    call 0x52900
    call 0x527a0
    xor eax, eax
loc_163a:
    add esp, 0x4ff8
    pop ebp
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
    push edi
    push ebp
    sub esp, 0x4ff4
    mov byte [esp + 0x4ff0], al
    mov ebx, 0x75
    mov edx, 0x26d8
    mov dword [esp + 0x4fec], ebx
    test al, al
    jge short loc_1699
    mov cl, 1
    neg al
    mov byte [0xe9825], cl
    sub al, cl
    mov byte [0xe9828], cl
    mov byte [0xe9829], al
    mov eax, 0xffffffff
    jmp near loc_2096
loc_1699:
    call 0x52900
    cmp byte [0xe9825], 2
    jne short loc_170a
    movsx ax, byte [0xe9824]
    cmp ax, word [0x261216]
    je short loc_170a
    mov ebx, 0x26e4
    mov al, byte [esp + 0x4ff0]
    mov cl, byte [0xe9824]
    mov esi, dword [0xe97df]
    add al, 0x41
    add cl, 0x30
    mov byte [0x26e8], al
    cmp esi, 9
    jle short loc_1702
    movsx edx, byte [0xe9824]
    mov esi, 0xa
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    add eax, 0x30
    mov byte [0x26eb], cl
    mov byte [0x26ea], al
    jmp short loc_1718
loc_1702:
    mov byte [0x26eb], cl
    jmp short loc_1718
loc_170a:
    mov al, byte [esp + 0x4ff0]
    add al, 0x30
    mov ebx, edx
    mov byte [edx + 4], al
loc_1718:
    mov edx, 0x26d4
    mov eax, ebx
    call 0xa2d71
    mov esi, eax
    mov edi, eax
    test eax, eax
    jne short loc_173e
    mov eax, 0xffffffff
    add esp, 0x4ff4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_173e:
    mov edx, 4
    mov ecx, eax
    xor bh, bh
    lea eax, [esp + 0x4fec]
    mov byte [0xe983a], bh
    mov ebx, 1
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe97df
    mov ecx, esi
    call 0x7af7a
    movsx eax, byte [esp + 0x4ff0]
    imul eax, eax, 0x16
    mov ebx, 1
    mov edx, 0x13
    mov ecx, esi
    add eax, 0xe9114
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe97eb
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe97e7
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe97e3
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x64
    mov edx, 0xa0
    mov eax, dword [0x1b77a0]
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x246500
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x2000
    mov edx, 0x20
    mov eax, 0x1ecda4
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x246502
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x400
    mov edx, 0x28
    mov eax, 0x2385a4
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x1000
    mov edx, 0x2c
    mov eax, 0x1c0ba4
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x401
    mov edx, 2
    mov eax, 0x245cc4
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x1b9c24
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x1bc8a4
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x401
    mov edx, 2
    mov eax, 0x2454c2
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x1be8a4
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x1000
    mov edx, 2
    mov eax, 0x1af7a4
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe8cd0
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x100
    mov edx, 0xc
    mov eax, 0xcdd00
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 0x3f60
    mov eax, 0xb4f00
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0xb4e00
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe8cd2
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 0xc00
    mov eax, 0xc3100
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x800
    mov edx, 4
    mov eax, 0xe2300
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x800
    mov edx, 4
    mov eax, 0xe0300
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe8cce
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x8d30
    mov ecx, esi
    call 0x7af7a
    mov edx, 2
    mov eax, 0xb1198
    movsx ebx, word [0x8d30]
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe8cc0
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x40
    mov edx, 2
    mov eax, 0x4e568
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x40
    mov edx, 2
    mov eax, 0x4dde0
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x80
    mov edx, 1
    mov eax, 0x1a17a4
    mov ecx, esi
    call 0x7af7a
    mov ebx, 0x1800
    mov edx, 1
    mov eax, 0x959d8
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 0x80
    mov eax, 0x7ee0
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe8cac
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0x41ee0
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0x420e0
    mov ecx, esi
    call 0x7af7a
    mov ebx, 1
    mov edx, 0x100
    mov eax, 0x41fe0
    mov ecx, esi
    call 0x7af7a
    xor eax, eax
    jmp short loc_1aea
loc_1ab3:
    lea ebx, [eax*4]
    mov ebp, dword [ebx + 0x971e8]
    cmp ebp, 0x971e8
    jl short loc_1ae4
    cmp ebp, 0xab198
    jge short loc_1ae4
    mov byte [esp + eax], 1
    mov edx, ebp
    sub edx, 0x971e8
    mov dword [ebx + 0x971e8], edx
    jmp short loc_1ae9
loc_1ae4:
    xor dl, dl
    mov byte [esp + eax], dl
loc_1ae9:
    inc eax
loc_1aea:
    cmp eax, 0x4fec
    jl short loc_1ab3
    mov ebx, 0x4fec
    mov edx, 1
    mov eax, esp
    mov ecx, edi
    call 0x7af7a
    mov ebx, 0x4fec
    mov edx, 4
    mov eax, 0x971e8
    mov ecx, edi
    call 0x7af7a
    xor eax, eax
    cmp eax, 0x4fec
    jl short loc_1b27
    xor eax, eax
    jmp short loc_1b6d
loc_1b27:
    cmp byte [esp + eax], 0
    je short loc_1b41
    mov edx, dword [eax*4 + 0x971e8]
    add edx, 0x971e8
    mov dword [eax*4 + 0x971e8], edx
loc_1b41:
    inc eax
    cmp eax, 0x4fec
    jl short loc_1b27
    xor eax, eax
    jmp short loc_1b6d
loc_1b4d:
    lea ebx, [eax*4]
    mov ecx, dword [ebx + 0xab198]
    test ecx, ecx
    je short loc_1b6c
    mov edx, ecx
    sub edx, 0x971e8
    mov dword [ebx + 0xab198], edx
loc_1b6c:
    inc eax
loc_1b6d:
    cmp eax, 0x1800
    jl short loc_1b4d
    mov ebx, 0x1800
    mov edx, 4
    mov eax, 0xab198
    mov ecx, edi
    call 0x7af7a
    xor eax, eax
    cmp eax, 0x1800
    jl short loc_1b9a
    xor eax, eax
    jmp near loc_1c9d
loc_1b9a:
    lea ebx, [eax*4]
    mov esi, dword [ebx + 0xab198]
    test esi, esi
    je short loc_1bb9
    mov edx, esi
    add edx, 0x971e8
    mov dword [ebx + 0xab198], edx
loc_1bb9:
    inc eax
    cmp eax, 0x1800
    jl short loc_1b9a
    xor eax, eax
    jmp near loc_1c9d
loc_1bc8:
    imul edx, eax, 0x2c
    movsx edx, word [edx + 0x1c0bb2]
    xor bh, bh
    mov ebp, dword [edx*4 + 0xab198]
    mov byte [esp + eax], bh
    test ebp, ebp
    je near loc_1c9c
    lea ebx, [eax*8]
    add ebx, eax
    lea ebx, [ebx*8]
    sub ebx, eax
    mov edx, 0x971e8
    mov ecx, dword [ebx + 0x4ea0b]
    cmp ecx, edx
    jl short loc_1c26
    cmp ecx, 0xab198
    jge short loc_1c26
    mov cl, byte [esp + eax]
    mov ebp, dword [ebx + 0x4ea0b]
    or cl, 1
    sub ebp, edx
    mov byte [esp + eax], cl
    mov dword [ebx + 0x4ea0b], ebp
loc_1c26:
    lea ebx, [eax*8]
    add ebx, eax
    lea ebx, [ebx*8]
    sub ebx, eax
    mov ecx, dword [ebx + 0x4ea17]
    cmp edx, ecx
    jg short loc_1c61
    cmp ecx, 0xab198
    jge short loc_1c61
    mov ch, byte [esp + eax]
    mov ebp, dword [ebx + 0x4ea17]
    or ch, 2
    sub ebp, edx
    mov byte [esp + eax], ch
    mov dword [ebx + 0x4ea17], ebp
loc_1c61:
    lea ebx, [eax*8]
    add ebx, eax
    lea ebx, [ebx*8]
    sub ebx, eax
    mov ecx, dword [ebx + 0x4ea1b]
    cmp edx, ecx
    jg short loc_1c9c
    cmp ecx, 0xab198
    jge short loc_1c9c
    mov cl, byte [esp + eax]
    mov ebp, dword [ebx + 0x4ea1b]
    or cl, 4
    sub ebp, edx
    mov byte [esp + eax], cl
    mov dword [ebx + 0x4ea1b], ebp
loc_1c9c:
    inc eax
loc_1c9d:
    cmp eax, 0x1000
    jl near loc_1bc8
    mov ebx, 0x1000
    mov edx, 1
    mov eax, esp
    mov ecx, edi
    call 0x7af7a
    mov ebx, 0x1000
    mov edx, 0x47
    mov eax, 0x4e9d8
    mov ecx, edi
    call 0x7af7a
    xor eax, eax
    jmp near loc_1d4e
loc_1cd8:
    imul edx, eax, 0x2c
    movsx edx, word [edx + 0x1c0bb2]
    cmp dword [edx*4 + 0xab198], 0
    je short loc_1d4d
    mov ch, byte [esp + eax]
    mov edx, 0x971e8
    test ch, 1
    je short loc_1d11
    lea ebx, [eax*8]
    add ebx, eax
    lea ebx, [ebx*8]
    sub ebx, eax
    add dword [ebx + 0x4ea0b], edx
loc_1d11:
    test byte [esp + eax], 2
    je short loc_1d2f
    lea ebx, [eax*8]
    add ebx, eax
    lea ebx, [ebx*8]
    sub ebx, eax
    add dword [ebx + 0x4ea17], edx
loc_1d2f:
    test byte [esp + eax], 4
    je short loc_1d4d
    lea ebx, [eax*8]
    add ebx, eax
    lea ebx, [ebx*8]
    sub ebx, eax
    add dword [ebx + 0x4ea1b], edx
loc_1d4d:
    inc eax
loc_1d4e:
    cmp eax, 0x1000
    jl short loc_1cd8
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe54c8
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x2464fc
    mov ecx, edi
    call 0x7af7a
    mov ebx, 0x100
    mov edx, 2
    mov eax, 0x1b79a4
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe54c4
    mov ecx, edi
    call 0x7af7a
    mov ebx, 0x40
    mov edx, 2
    mov eax, 0x4dcb0
    mov ecx, edi
    call 0x7af7a
    mov eax, dword [0xe54c4]
    dec eax
    jmp short loc_1de0
loc_1dcb:
    mov ebx, dword [eax*4 + 0x4e698]
    dec eax
    sub ebx, 0x2385a4
    mov dword [eax*4 + 0x4e69c], ebx
loc_1de0:
    test eax, eax
    jge short loc_1dcb
    mov ebx, 0x40
    mov edx, 4
    mov eax, 0x4e698
    mov ecx, edi
    call 0x7af7a
    mov eax, dword [0xe54c4]
    dec eax
    jmp short loc_1e17
loc_1e02:
    mov ebx, dword [eax*4 + 0x4e698]
    dec eax
    add ebx, 0x2385a4
    mov dword [eax*4 + 0x4e69c], ebx
loc_1e17:
    test eax, eax
    jge short loc_1e02
    mov ebx, 0x40
    mov edx, 4
    mov eax, 0x4e8d8
    mov ecx, edi
    call 0x7af7a
    mov ebx, 0x40
    mov edx, 4
    mov eax, 0x4e7d8
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov eax, 0xe9832
    mov ecx, edi
    mov edx, ebx
    call 0x7af7a
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe92f5
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe92fd
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe979b
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe979f
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe97a3
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov eax, 0xe8d7c
    mov ecx, edi
    mov edx, ebx
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe9337
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe9353
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe97ab
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe92fb
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov eax, 0xe8d7f
    mov ecx, edi
    mov edx, ebx
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe9347
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe97f3
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0xe97cf
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe8cc8
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 2
    mov eax, 0x261210
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 0x20
    mov eax, 0x261108
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov eax, 0xe983b
    mov ecx, edi
    mov edx, ebx
    call 0x7af7a
    mov ebx, 1
    mov edx, 0x200
    mov eax, 0x4c460
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x2441c4
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 2
    mov eax, 0xe8cca
    mov ecx, edi
    call 0x7af7a
    mov ebx, 1
    mov edx, 4
    mov eax, 0x2441b8
    mov ecx, edi
    call 0x7af7a
    mov eax, edi
    call 0xa2809
    cmp dword [0xe97df], 2
    jge short loc_207e
    mov edx, 0x2700
    mov eax, 0xbace0
    call 0xa2765
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    add edx, eax
    mov eax, 0x7a
    call 0x15e90
loc_207e:
    mov byte [0xe983a], 1
    call 0x52900
    mov eax, dword [0x2454ac]
    mov dword [0xe54ac], eax
    xor eax, eax
loc_2096:
    add esp, 0x4ff4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
loc_20b0:
    push esi
    push edi
    push ebp
    sub esp, 0xc
    mov edi, eax
    mov dword [esp], edx
    mov esi, ebx
    xor edx, edx
    mov dword [esp + 8], edx
    mov dword [esp + 4], edx
    mov edx, dword [esp]
    mov ecx, esi
    sub edx, 0xc
    xor ebx, ebx
    mov dword [esp], edx
    test esi, esi
    jg short loc_2113
    mov eax, dword [0x2454b4]
    dec eax
    push eax
    mov eax, dword [0x2454b8]
    dec eax
    push eax
    push 0
    push 0
    push 0x1a
    mov ebx, 0x10000
    push 0
    shl edx, 0x10
    push 0
    xor ecx, ecx
    mov eax, edi
    push 0x51a
    shl eax, 0x10
    call 0x7169e
    mov eax, 1
    jmp near loc_21c1
loc_2113:
    mov ebp, 0xa
loc_2118:
    cmp esi, 1
    jl short loc_2147
    mov edx, esi
    mov eax, esi
    sar edx, 0x1f
    idiv ebp
    add edx, 0x51a
    movsx eax, dx
    db 0x66, 0x8b, 0x04, 0x45, 0x24, 0x7c, 0x1a, 0x00    ; mov ax, word [eax*2 + 0x1a7c24]
    mov edx, esi
    dec eax
    sar edx, 0x1f
    add ebx, eax
    mov eax, esi
    idiv ebp
    mov esi, eax
    jmp short loc_2118
loc_2147:
    movsx eax, bx
    sar eax, 1
    mov esi, ecx
loc_214e:
    sub edi, eax
    cmp esi, 1
    jl short loc_21bf
    mov ebp, 0xa
    mov edx, esi
    mov eax, esi
    sar edx, 0x1f
    idiv ebp
    mov ebx, edx
    mov edx, esi
    mov eax, esi
    sar edx, 0x1f
    idiv ebp
    mov esi, eax
    mov eax, dword [0x2454b4]
    dec eax
    push eax
    mov eax, dword [0x2454b8]
    dec eax
    push eax
    xor ecx, ecx
    push 0
    add ebx, 0x51a
    mov edx, dword [esp + 0xc]
    push 0
    movsx eax, word [esp + 0x14]
    push 0x1a
    movsx ebp, bx
    push eax
    movsx eax, word [esp + 0x20]
    mov ebx, 0x10000
    push eax
    shl edx, 0x10
    mov eax, edi
    push ebp
    shl eax, 0x10
    call 0x7169e
    db 0x0f, 0xbf, 0x04, 0x6d, 0x24, 0x7c, 0x1a, 0x00    ; movsx eax, word [ebp*2 + 0x1a7c24]
    add eax, 2
    jmp short loc_214e
loc_21bf:
    mov eax, edi
loc_21c1:
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
%endif
