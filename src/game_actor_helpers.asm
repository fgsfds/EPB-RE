; Actor state helper routines.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push esi
    movsx esi, ax
    imul eax, esi, 0x2c
    add eax, SPRITE
    push edx
    mov dx, word [eax + 0x1c]
    and dh, 7
    movsx edx, dx
    movsx ebx, word [nosplit edx*2 + SINTABLE]
    movsx edx, word [eax + 0x20]
    imul ebx, edx
    movsx ecx, word [eax + 0x24]
    movsx eax, word [eax + 0x1c]
    add eax, 0x200
    and eax, 0x7ff
    movsx eax, word [nosplit eax*2 + SINTABLE]
    imul edx, eax
    sar ebx, 0xe
    sar edx, 0xe
    mov eax, esi
    call LINK_ADDRESS_3
    test eax, eax
    sete al
    xor ah, ah
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push edx
    cmp word [LINK_ADDRESS_4], 0
    jle short loc_00b7
    movsx edx, word [LINK_ADDRESS_5]
    add edx, edx
    mov bx, word [edx + LINK_ADDRESS_6]
    test bx, bx
    jl short loc_008f
    movsx edx, bx
    imul edx, edx, 0x2c
    xor bl, bl
    mov byte [edx + LINK_ADDRESS_7], bl
loc_008f:
    movsx edx, word [LINK_ADDRESS_5]
    inc edx
    movsx ebx, word [LINK_ADDRESS_4]
    mov word [nosplit edx*2 + LINK_ADDRESS_8], ax
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov word [LINK_ADDRESS_5], dx
    pop edx
    pop ebx
    ret
loc_00b7:
    movsx edx, ax
    imul edx, edx, 0x2c
    xor ah, ah
    mov byte [edx + LINK_ADDRESS_9], ah
    mov byte [edx + LINK_ADDRESS_7], ah
    pop edx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push esi
    push edi
    mov esi, eax
    mov edi, edx
    test di, di
    jg short loc_00e2
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_00e2:
    push 5
    push 0
    push 0
    push 0
    call LINK_ADDRESS_10
    and ah, 7
    cwde
    push eax
    push 8
    push 8
    push -0x20
    push 0x4d1
    call LINK_ADDRESS_10
    mov edx, eax
    mov ebx, 0x2f00
    sar edx, 0x1f
    idiv ebx
    mov ecx, dword [esi + 8]
    mov ebx, dword [esi + 4]
    movsx eax, word [esi + 0x18]
    sub ecx, edx
    mov edx, dword [esi]
    call LINK_ADDRESS_11
    mov edx, eax
    call LINK_ADDRESS_10
    mov ebx, eax
    xor bh, ah
    movsx eax, dx
    imul eax, eax, 0x2c
    and bl, 0xc
    dec edi
    mov word [eax + LINK_ADDRESS_12], bx
    test di, di
    jg short loc_00e2
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ebx
    push ecx
    push esi
    push edi
    mov esi, eax
    mov edi, edx
    test di, di
    jg short loc_0162
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_0162:
    push 5
    push 0
    push 0
    push 0
    call LINK_ADDRESS_10
    and ah, 7
    cwde
    push eax
    push 8
    push 8
    push -0x20
    push 0x113a
    call LINK_ADDRESS_10
    mov edx, eax
    mov ebx, 0x2f00
    sar edx, 0x1f
    idiv ebx
    mov ecx, dword [esi + 8]
    mov ebx, dword [esi + 4]
    movsx eax, word [esi + 0x18]
    sub ecx, edx
    mov edx, dword [esi]
    call LINK_ADDRESS_11
    mov edx, eax
    call LINK_ADDRESS_10
    mov ebx, eax
    xor bh, ah
    movsx eax, dx
    imul eax, eax, 0x2c
    and bl, 0xc
    dec edi
    mov word [eax + LINK_ADDRESS_12], bx
    test di, di
    jg short loc_0162
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ebx
    push ecx
    push esi
    push edi
    mov esi, eax
    mov edi, edx
    test di, di
    jg short loc_01e2
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_01e2:
    push 5
    push 0
    push 0
    push 0
    call LINK_ADDRESS_10
    and ah, 7
    cwde
    push eax
    push 8
    push 8
    push -0x20
    push 0x116c
    call LINK_ADDRESS_10
    mov edx, eax
    mov ebx, 0x2f00
    sar edx, 0x1f
    idiv ebx
    mov ecx, dword [esi + 8]
    mov ebx, dword [esi + 4]
    movsx eax, word [esi + 0x18]
    sub ecx, edx
    mov edx, dword [esi]
    call LINK_ADDRESS_11
    mov edx, eax
    call LINK_ADDRESS_10
    mov ebx, eax
    xor bh, ah
    movsx eax, dx
    imul eax, eax, 0x2c
    and bl, 0xc
    dec edi
    mov word [eax + LINK_ADDRESS_12], bx
    test di, di
    jg short loc_01e2
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push esi
    push edi
    push ebp
    sub esp, 0x18
    mov esi, eax
    mov dword [esp + 8], edx
    mov dword [esp + 4], ebx
    mov dword [esp], ecx
    call LINK_ADDRESS_13
    test ax, ax
    je short loc_027f
    cmp byte [esi + 0x14], 0x10
    jae short loc_027f
    mov bl, 8
    mov byte [esp + 0xc], bl
    mov byte [esp + 0x10], bl
    jmp short loc_0289
loc_027f:
    mov dl, 0x20
    mov byte [esp + 0xc], dl
    mov byte [esp + 0x10], dl
loc_0289:
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    movsx eax, word [esi + 0x18]
    mov ebp, dword [esi + 8]
    call GETFLORZOFSLOPE
    sub ebp, 0x800
    sub eax, 0x800
    cmp ebp, eax
    jle short loc_02ab
    mov ebp, eax
loc_02ab:
    cmp word [esi + 0xe], 0x780
    jne short loc_02b9
    sub ebp, 0x1800
loc_02b9:
    mov eax, esi
    call LINK_ADDRESS_13
    test ax, ax
    je short loc_02d3
    mov cl, byte [esi + 0x11]
    cmp cl, 6
    jne short loc_02d3
    mov byte [esp + 0x14], cl
    jmp short loc_02d9
loc_02d3:
    xor ch, ch
    mov byte [esp + 0x14], ch
loc_02d9:
    xor edi, edi
    cmp di, word [esp + 4]
    jl short loc_02e9
    add esp, 0x18
    pop ebp
    pop edi
    pop esi
    ret
loc_02e9:
    call LINK_ADDRESS_10
    and ah, 7
    movsx edx, word [esp]
    mov ebx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    push 5
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_15]
    push eax
    mov edx, 0xfffffe00
    call LINK_ADDRESS_10
    and eax, 0x7ff
    sub edx, eax
    push edx
    call LINK_ADDRESS_10
    xor ah, ah
    and al, 0x1f
    db 0x05, 0x30, 0x00, 0x00, 0x00    ; add eax, 0x30
    cwde
    push eax
    movsx eax, bx
    push eax
    movsx eax, byte [esp + 0x20]
    push eax
    movsx eax, byte [esp + 0x28]
    push eax
    push -0x20
    movsx eax, word [esp + 0x28]
    push eax
    mov ecx, ebp
    call LINK_ADDRESS_10
    and eax, 0x1fff
    sub ecx, eax
    call LINK_ADDRESS_10
    and eax, 0xff
    mov ebx, dword [esi + 4]
    add ebx, eax
    call LINK_ADDRESS_10
    and eax, 0xff
    mov edx, dword [esi]
    add edx, eax
    sub ebx, 0x80
    sub edx, 0x80
    movsx eax, word [esi + 0x18]
    call LINK_ADDRESS_11
    mov edx, eax
    cwde
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_16], 0x8ca
    jne short loc_03ab
    shr byte [eax + LINK_ADDRESS_7], 2
    shr byte [eax + LINK_ADDRESS_9], 2
loc_03ab:
    mov cl, byte [esp + 0x14]
    cmp cl, 6
    jne short loc_03c0
    movsx eax, dx
    imul eax, eax, 0x2c
    mov byte [eax + LINK_ADDRESS_17], cl
loc_03c0:
    inc edi
    cmp di, word [esp + 4]
    jl near loc_02e9
    add esp, 0x18
    pop ebp
    pop edi
    pop esi
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
    push esi
    push edi
    push ebp
    sub esp, 0x14
    mov esi, eax
    mov dword [esp], edx
    mov dword [esp + 8], ebx
    mov dword [esp + 4], ecx
    call LINK_ADDRESS_13
    test ax, ax
    je short loc_040f
    cmp byte [esi + 0x14], 0x10
    jae short loc_040f
    mov bl, 8
    mov byte [esp + 0x10], bl
    mov byte [esp + 0xc], bl
    jmp short loc_0419
loc_040f:
    mov dl, 0x20
    mov byte [esp + 0x10], dl
    mov byte [esp + 0xc], dl
loc_0419:
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    movsx eax, word [esi + 0x18]
    mov ebp, dword [esi + 8]
    call GETFLORZOFSLOPE
    sub ebp, 0x800
    sub eax, 0x800
    cmp ebp, eax
    jle short loc_043b
    mov ebp, eax
loc_043b:
    cmp word [esi + 0xe], 0x780
    jne short loc_0449
    sub ebp, 0x1800
loc_0449:
    xor edi, edi
    cmp di, word [esp + 8]
    jl short loc_0459
    add esp, 0x14
    pop ebp
    pop edi
    pop esi
    ret
loc_0459:
    call LINK_ADDRESS_10
    and ah, 7
    movsx edx, word [esp + 4]
    mov ebx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    push 5
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_15]
    push eax
    mov edx, 0xfffffe00
    call LINK_ADDRESS_10
    and eax, 0x7ff
    sub edx, eax
    push edx
    call LINK_ADDRESS_10
    xor ah, ah
    and al, 0x7f
    inc ah
    cwde
    push eax
    movsx eax, bx
    push eax
    movsx eax, byte [esp + 0x24]
    push eax
    movsx eax, byte [esp + 0x24]
    push eax
    mov ecx, ebp
    mov edx, dword [esi]
    push -0x20
    movsx eax, word [esp + 0x20]
    mov ebx, dword [esi + 4]
    push eax
    movsx eax, word [esi + 0x18]
    inc edi
    call LINK_ADDRESS_11
    cmp di, word [esp + 8]
    jl short loc_0459
    add esp, 0x14
    pop ebp
    pop edi
    pop esi
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ebx
    push ecx
    push edx
    push esi
    cwde
    imul eax, eax, 0x2c
    movsx edx, word [eax + LINK_ADDRESS_18]
    lea eax, [edx*4]
    add eax, edx
    movsx edx, word [eax*8 + SECTOR]
    movsx esi, word [eax*8 + LINK_ADDRESS_20]
    add esi, edx
    cmp edx, esi
    jl short loc_0513
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0513:
    mov ecx, edx
    mov ebx, WALL
    shl ecx, 5
    add ebx, ecx
    mov eax, ebx
    call LINK_ADDRESS_22
    lea eax, [ebx + 4]
    call LINK_ADDRESS_22
    movsx eax, word [ecx + LINK_ADDRESS_23]
    test eax, eax
    jl short loc_0574
    mov ecx, eax
    mov ebx, WALL
    shl ecx, 5
    add ebx, ecx
    mov eax, ebx
    call LINK_ADDRESS_22
    lea eax, [ebx + 4]
    call LINK_ADDRESS_22
    movsx eax, word [ecx + LINK_ADDRESS_24]
    mov ebx, WALL
    shl eax, 5
    add ebx, eax
    mov eax, ebx
    call LINK_ADDRESS_22
    lea eax, [ebx + 4]
    call LINK_ADDRESS_22
loc_0574:
    inc edx
    cmp edx, esi
    jl short loc_0513
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push edx
    push esi
    movsx edx, ax
    imul edx, edx, 0x2c
    movsx edx, word [edx + LINK_ADDRESS_18]
    lea eax, [edx*4]
    add eax, edx
    mov bx, word [eax*8 + SECTOR]
    mov si, word [eax*8 + LINK_ADDRESS_20]
    add esi, ebx
    cmp bx, si
    jl short loc_05b6
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_05b6:
    movsx edx, bx
    mov ecx, WALL
    shl edx, 5
    add ecx, edx
    mov eax, ecx
    call LINK_ADDRESS_25
    lea eax, [ecx + 4]
    call LINK_ADDRESS_25
    mov cx, word [edx + LINK_ADDRESS_23]
    test cx, cx
    jl short loc_0605
    movsx eax, cx
    shl eax, 5
    add eax, WALL
    call LINK_ADDRESS_25
    movsx eax, word [edx + LINK_ADDRESS_23]
    shl eax, 5
    add eax, WALL
    add eax, 4
    call LINK_ADDRESS_25
loc_0605:
    inc ebx
    cmp bx, si
    jl short loc_05b6
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x10
    movsx edx, ax
    imul ebp, edx, 0x2c
    add ebp, SPRITE
    movsx eax, word [ebp + 0x1c]
    add eax, 0x200
    and eax, 0x7ff
    movsx ebx, word [ebp + 0x20]
    movsx eax, word [nosplit eax*2 + SINTABLE]
    imul eax, ebx
    sar eax, 0xe
    mov ebx, dword [ebp]
    add ebx, eax
    mov ax, word [ebp + 0x1c]
    and ah, 7
    mov dword [ebp], ebx
    cwde
    movsx ebx, word [ebp + 0x20]
    movsx eax, word [nosplit eax*2 + SINTABLE]
    imul eax, ebx
    mov ecx, dword [ebp + 4]
    sar eax, 0xe
    add ecx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [ebp + 4], ecx
    mov edi, dword [eax + LINK_ADDRESS_26]
    mov eax, dword [eax + LINK_ADDRESS_27]
    movsx edx, word [ebp + 0x18]
    mov dword [esp + 8], eax
    lea eax, [edx*4]
    add eax, edx
    mov si, word [eax*8 + SECTOR]
    mov ax, word [eax*8 + LINK_ADDRESS_20]
    add eax, esi
    mov dword [esp + 0xc], eax
    jmp short loc_06fa
loc_06b6:
    mov eax, esp
    push eax
    lea eax, [esp + 8]
    push eax
    mov eax, dword [esp + 0x10]
    mov ecx, dword [edi*4 + LINK_ADDRESS_28]
    and eax, 0x7ff
    mov ebx, dword [edi*4 + LINK_ADDRESS_29]
    push eax
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_30
    mov eax, dword [esp]
    mov ecx, dword [esp + 4]
    mov ebx, dword [ebp + 4]
    mov edx, dword [ebp]
    add ebx, eax
    add edx, ecx
    movsx eax, si
    inc edi
    call LINK_ADDRESS_31
    inc esi
loc_06fa:
    cmp si, word [esp + 0xc]
    jl short loc_06b6
    add esp, 0x10
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x1c
    mov di, word [LINK_ADDRESS_32]
loc_0720:
    test di, di
    jl near loc_0a79
    movsx ebp, di
    imul esi, ebp, 0x2c
    mov edx, esp
    mov ax, word [nosplit ebp*2 + NEXTSPRITESTAT]
    add esi, SPRITE
    mov dword [esp + 0x14], eax
    mov eax, esi
    call LINK_ADDRESS_34
    mov edx, eax
    movsx edx, dx
    mov ecx, edx
    shl ecx, 7
    sub ecx, edx
    lea ecx, [ecx*4]
    sub ecx, edx
    mov ax, word [esi + 0x18]
    add ecx, ecx
    mov dword [esp + 0x10], eax
    mov dword [esp + 0x18], eax
    movsx eax, word [ecx + LINK_ADDRESS_15]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_35], 0
    jle near loc_0a70
    mov edx, dword [esp]
    cmp edx, 0x7530
    jge near loc_0a36
    lea eax, [ebp*8]
    add eax, ebp
    lea eax, [eax*8]
    sub eax, ebp
    mov bx, word [eax + LINK_ADDRESS_36]
    inc ebx
    sar edx, 8
    mov word [eax + LINK_ADDRESS_36], bx
    movsx eax, bx
    cmp eax, edx
    jl near loc_0a36
    mov eax, esi
    call LINK_ADDRESS_13
    test ax, ax
    je near loc_08b4
    lea ebx, [esp + 0x10]
    mov edx, dword [ecx + LINK_ADDRESS_37]
    call LINK_ADDRESS_10
    add edx, 0x40
    mov ebp, dword [ecx + LINK_ADDRESS_38]
    and eax, 0x7f
    add ebp, 0x40
    sub edx, eax
    call LINK_ADDRESS_10
    and eax, 0x7f
    mov dword [esp + 0xc], edx
    sub ebp, eax
    mov eax, dword [esp + 0xc]
    mov edx, ebp
    call UPDATESECTOR
    movsx eax, word [esp + 0x10]
    cmp eax, -1
    jne short loc_081f
    mov edi, dword [esp + 0x14]
    jmp near loc_0720
loc_081f:
    call LINK_ADDRESS_10
    mov edx, dword [esi]
    and eax, 0x7f
    add edx, 0x40
    sub edx, eax
    mov dword [esp + 4], edx
    mov edx, dword [esi + 4]
    call LINK_ADDRESS_10
    add edx, 0x40
    and eax, 0x7f
    lea ebx, [esp + 0x18]
    sub edx, eax
    mov eax, dword [esp + 0xc]
    mov dword [esp + 8], edx
    mov edx, ebp
    call UPDATESECTOR
    movsx eax, word [esp + 0x18]
    cmp eax, -1
    jne short loc_0868
    mov edi, dword [esp + 0x14]
    jmp near loc_0720
loc_0868:
    movsx eax, word [ecx + LINK_ADDRESS_40]
    push eax
    call LINK_ADDRESS_10
    mov edx, eax
    mov ebx, 0x2000
    sar edx, 0x1f
    idiv ebx
    mov eax, dword [ecx + LINK_ADDRESS_41]
    sub eax, edx
    push eax
    push ebp
    mov eax, dword [esp + 0x18]
    push eax
    movsx ecx, word [esi + 0x18]
    call LINK_ADDRESS_10
    mov edx, eax
    mov ebx, 0x3400
    sar edx, 0x1f
    idiv ebx
    mov ebx, dword [esi + 8]
    mov eax, dword [esp + 0x14]
    sub ebx, edx
    mov edx, dword [esp + 0x18]
    jmp short loc_08fb
loc_08b4:
    movsx eax, word [ecx + LINK_ADDRESS_40]
    push eax
    call LINK_ADDRESS_10
    and eax, 0x1f
    mov edx, dword [ecx + LINK_ADDRESS_41]
    shl eax, 8
    sub edx, eax
    push edx
    mov ebx, dword [ecx + LINK_ADDRESS_38]
    push ebx
    mov ebp, dword [ecx + LINK_ADDRESS_37]
    push ebp
    movsx ecx, word [esi + 0x18]
    call LINK_ADDRESS_10
    mov ebx, eax
    and ebx, 0x1f
    mov eax, dword [esi + 8]
    shl ebx, 8
    sub eax, ebx
    mov edx, dword [esi + 4]
    mov ebx, eax
    mov eax, dword [esi]
loc_08fb:
    call LINK_ADDRESS_42
    test ax, ax
    je near loc_0a18
    mov ax, word [esi + 0xe]
    cmp ax, 0x4d0
    jb short loc_095d
    jbe near loc_0989
    cmp ax, 0x56e
    jb short loc_0946
    jbe near loc_0989
    cmp ax, 0xa06
    jb near loc_09e5
    jbe short loc_0989
    cmp ax, 0x11e4
    jb near loc_09e5
    cmp ax, 0x11e6
    jbe short loc_0989
    jmp near loc_09e5
loc_0946:
    cmp ax, 0x4d6
    jb near loc_09e5
    jbe short loc_0989
    cmp ax, 0x4d8
    je short loc_0989
    jmp near loc_09e5
loc_095d:
    cmp ax, 0x402
    jb short loc_0983
    jbe short loc_0989
    cmp ax, 0x426
    jb near loc_09e5
    jbe short loc_0989
    cmp ax, 0x4cb
    jb near loc_09e5
    cmp ax, 0x4cd
    jbe short loc_0989
    jmp short loc_09e5
loc_0983:
    cmp ax, 0x388
    jne short loc_09e5
loc_0989:
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    test byte [eax + LINK_ADDRESS_43], 1
    je short loc_09ae
    mov al, byte [eax + LINK_ADDRESS_44]
    jmp short loc_09b4
loc_09ae:
    mov al, byte [eax + LINK_ADDRESS_45]
loc_09b4:
    mov byte [esi + 0x10], al
    movsx ecx, di
    mov edx, ecx
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    xor edx, ecx
    mov word [eax + LINK_ADDRESS_36], dx
    mov edx, 6
    mov eax, ecx
    call LINK_ADDRESS_46
    jmp short loc_0a36
loc_09e5:
    movsx ecx, di
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    xor edi, edi
    mov word [eax + LINK_ADDRESS_36], di
    mov eax, ecx
    mov edx, 1
    call 0x12ab0
    mov eax, ecx
    call LINK_ADDRESS_46
    jmp short loc_0a36
loc_0a18:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    xor ecx, ecx
    mov word [eax + LINK_ADDRESS_36], cx
loc_0a36:
    mov eax, esi
    call LINK_ADDRESS_13
    test ax, ax
    je short loc_0a70
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    test byte [eax + LINK_ADDRESS_43], 1
    je short loc_0a67
    mov al, byte [eax + LINK_ADDRESS_44]
    jmp short loc_0a6d
loc_0a67:
    mov al, byte [eax + LINK_ADDRESS_45]
loc_0a6d:
    mov byte [esi + 0x10], al
loc_0a70:
    mov edi, dword [esp + 0x14]
    jmp near loc_0720
loc_0a79:
    add esp, 0x1c
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
    push ebx
    push edx
    mov ebx, eax
    mov ax, word [LINK_ADDRESS_47]
loc_0a9a:
    test ax, ax
    jl short loc_0ac6
    movsx edx, ax
    imul edx, edx, 0x2c
    cmp word [edx + LINK_ADDRESS_16], 0x762
    jne short loc_0ab9
    cmp bx, word [edx + LINK_ADDRESS_18]
    je short loc_0acb
loc_0ab9:
    movsx edx, ax
    mov ax, word [nosplit edx*2 + NEXTSPRITESTAT]
    jmp short loc_0a9a
loc_0ac6:
    mov eax, 0xffffffff
loc_0acb:
    pop edx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov edx, eax
    movsx esi, ax
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov cx, word [eax + LINK_ADDRESS_48]
    mov ebx, eax
    test cx, cx
    jl near loc_0e8e
    imul eax, esi, 0x2c
    cmp word [eax + LINK_ADDRESS_35], 0
    jl near loc_0e8e
    add eax, SPRITE
    cmp word [eax + 0xe], 0x214
    jne near loc_0de5
    cmp byte [LINK_ADDRESS_49], 0
    je short loc_0b3f
    cmp word [ebx + LINK_ADDRESS_50], 0x66e
    je short loc_0b3f
    mov eax, 0xffffffff
    jmp near loc_0eb1
loc_0b3f:
    movsx esi, dx
    lea ebx, [esi*8]
    add ebx, esi
    lea ebx, [ebx*8]
    sub ebx, esi
    mov si, word [ebx + LINK_ADDRESS_51]
    mov cx, word [eax + 0x22]
    test si, si
    jl short loc_0b93
    movsx ebx, si
    imul ebx, ebx, 0x2c
    cmp word [ebx + LINK_ADDRESS_16], 0x214
    jne short loc_0b93
    cmp dword [LINK_ADDRESS_52], 1
    jne short loc_0b93
    cmp dword [LINK_ADDRESS_53], 0
    jne short loc_0b93
    mov eax, 0xffffffff
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0b93:
    movsx edi, dx
    lea ebx, [edi*8]
    add ebx, edi
    lea ebx, [ebx*8]
    sub ebx, edi
    mov di, word [ebx + LINK_ADDRESS_48]
    sub word [eax + 0x2a], di
    test si, si
    jl near loc_0c66
    cmp word [eax + 0x2a], 0
    jg near loc_0c66
    cmp word [ebx + LINK_ADDRESS_50], 0x669
    je near loc_0c66
    movsx edi, cx
    mov word [eax + 0x2a], 0
    mov eax, edi
    shl eax, 7
    sub eax, edi
    lea eax, [eax*4]
    sub eax, edi
    lea edi, [eax + eax]
    movsx eax, word [ebx + LINK_ADDRESS_51]
    imul eax, eax, 0x2c
    mov bx, word [eax + LINK_ADDRESS_16]
    mov word [edi + LINK_ADDRESS_54], si
    cmp bx, 0x214
    jne short loc_0c2e
    cmp cx, word [eax + LINK_ADDRESS_55]
    je short loc_0c2e
    movsx eax, si
    imul eax, eax, 0x2c
    mov ax, word [eax + LINK_ADDRESS_55]
    mov word [edi + LINK_ADDRESS_56], ax
loc_0c2e:
    movsx ebx, cx
    mov esi, ebx
    shl esi, 7
    sub esi, ebx
    lea esi, [esi*4]
    sub esi, ebx
    movsx ebx, dx
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    add esi, esi
    sub eax, ebx
    mov bx, word [esi + LINK_ADDRESS_15]
    mov word [eax + LINK_ADDRESS_51], bx
loc_0c66:
    movsx ebx, dx
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov ax, word [eax + LINK_ADDRESS_50]
    cmp ax, 0x4d6
    jb short loc_0ca8
    jbe short loc_0cc5
    cmp ax, 0x686
    jb short loc_0c9d
    jbe short loc_0cc5
    cmp ax, 0xa2d
    je short loc_0cc5
    jmp near loc_0d5a
loc_0c9d:
    cmp ax, 0x4df
    je short loc_0cc5
    jmp near loc_0d5a
loc_0ca8:
    cmp ax, 0x3d5
    jb short loc_0cbb
    jbe short loc_0cc5
    cmp ax, 0x437
    je short loc_0cc5
    jmp near loc_0d5a
loc_0cbb:
    db 0x66, 0x3d, 0x1a, 0x00    ; cmp ax, 0x1a
    jne near loc_0d5a
loc_0cc5:
    movsx ebx, cx
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    movsx esi, dx
    lea ebx, [eax + eax]
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    movsx esi, word [eax + LINK_ADDRESS_57]
    add esi, 0x200
    and esi, 0x7ff
    movsx edi, word [nosplit esi*2 + SINTABLE]
    movsx esi, word [eax + LINK_ADDRESS_48]
    imul edi, esi
    mov ax, word [eax + LINK_ADDRESS_57]
    and ah, 7
    cwde
    movsx eax, word [nosplit eax*2 + SINTABLE]
    imul eax, esi
    mov ecx, dword [ebx + LINK_ADDRESS_58]
    lea edi, [edi*4]
    add ecx, edi
    lea eax, [eax*4]
    mov esi, dword [ebx + LINK_ADDRESS_59]
    mov dword [ebx + LINK_ADDRESS_58], ecx
    add esi, eax
    mov dword [ebx + LINK_ADDRESS_59], esi
    jmp near loc_0e62
loc_0d5a:
    movsx ebx, cx
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    movsx esi, dx
    lea ebx, [eax + eax]
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    movsx esi, word [eax + LINK_ADDRESS_57]
    add esi, 0x200
    and esi, 0x7ff
    movsx edi, word [nosplit esi*2 + SINTABLE]
    movsx esi, word [eax + LINK_ADDRESS_48]
    imul edi, esi
    mov ax, word [eax + LINK_ADDRESS_57]
    and ah, 7
    cwde
    movsx eax, word [nosplit eax*2 + SINTABLE]
    imul esi, eax
    mov ebp, dword [ebx + LINK_ADDRESS_58]
    add edi, edi
    add ebp, edi
    mov eax, dword [ebx + LINK_ADDRESS_59]
    add esi, esi
    mov dword [ebx + LINK_ADDRESS_58], ebp
    add eax, esi
    mov dword [ebx + LINK_ADDRESS_59], eax
    jmp near loc_0e62
loc_0de5:
    cmp word [ebx + LINK_ADDRESS_48], 0
    jne short loc_0e0c
    cmp word [ebx + LINK_ADDRESS_50], 0x66e
    jne short loc_0e0c
    cmp byte [eax + 0x14], 0x18
    jae short loc_0e0c
    mov eax, 0xffffffff
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0e0c:
    movsx esi, dx
    lea ebx, [esi*8]
    add ebx, esi
    lea ebx, [ebx*8]
    sub ebx, esi
    mov cx, word [ebx + LINK_ADDRESS_48]
    mov si, word [eax + 0x2a]
    sub esi, ecx
    mov di, word [eax + 0xe]
    mov word [eax + 0x2a], si
    cmp di, 0x7a8
    je short loc_0e62
    mov cx, word [eax + 0x1e]
    test cx, cx
    jl short loc_0e62
    movsx esi, cx
    imul esi, esi, 0x2c
    cmp word [esi + LINK_ADDRESS_60], 0x400
    jge short loc_0e62
    mov bx, word [ebx + LINK_ADDRESS_51]
    mov word [eax + 0x1e], bx
loc_0e62:
    movsx ebx, dx
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov word [eax + LINK_ADDRESS_48], 0xffff
    mov ax, word [eax + LINK_ADDRESS_50]
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0e8e:
    movsx ebx, dx
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov edi, 0xffffffff
    mov word [eax + LINK_ADDRESS_48], di
    mov eax, edi
loc_0eb1:
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 4
    mov si, word [LINK_ADDRESS_61]
    dec esi
    test si, si
    jge short loc_0ede
    add esp, 4
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0ede:
    movsx edx, si
    lea eax, [edx*4]
    sub eax, edx
    mov ecx, LINK_ADDRESS_62
    lea eax, [eax*4]
    add ecx, eax
    mov dx, word [ecx + 2]
    and dh, 7
    movsx edx, dx
    mov ax, word [ecx + 6]
    movsx edx, word [nosplit edx*2 + SINTABLE]
    movsx ebx, ax
    sar edx, 0xa
    add edx, ebx
    mov ebx, edx
    mov dl, byte [ecx + 4]
    mov byte [esp], dl
    xor edx, edx
    mov dl, byte [esp]
    mov di, word [ecx]
    cmp bx, dx
    jge short loc_0f2f
    mov ebx, edx
    jmp short loc_0f36
loc_0f2f:
    cmp bx, ax
    jle short loc_0f36
    mov ebx, eax
loc_0f36:
    movsx edx, di
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov ax, word [edx + LINK_ADDRESS_63]
    add word [ecx + 2], ax
    cmp word [ecx + 0xa], 0
    je short loc_0fbd
    movsx eax, word [edx + SECTOR]
    shl eax, 5
    mov dx, word [edx + LINK_ADDRESS_20]
    add eax, WALL
    jmp short loc_0f9e
loc_0f73:
    cmp word [eax + 0x1c], 1
    je short loc_0f9a
    mov cl, byte [eax + 0xe]
    mov byte [eax + 0x14], bl
    test cl, 2
    je short loc_0f9a
    mov cx, word [eax + 0xa]
    test cx, cx
    jl short loc_0f9a
    movsx ecx, cx
    shl ecx, 5
    mov byte [ecx + LINK_ADDRESS_64], bl
loc_0f9a:
    dec edx
    add eax, 0x20
loc_0f9e:
    test dx, dx
    jg short loc_0f73
    movsx edx, di
    lea eax, [edx*4]
    add eax, edx
    mov byte [eax*8 + LINK_ADDRESS_44], bl
    mov byte [eax*8 + LINK_ADDRESS_45], bl
loc_0fbd:
    dec esi
    test si, si
    jge near loc_0ede
    add esp, 4
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
    push edi
    push ebp
    sub esp, 8
    mov dx, word [LINK_ADDRESS_65]
loc_0fe0:
    test dx, dx
    jl near loc_11db
    movsx esi, dx
    imul ecx, esi, 0x2c
    mov ax, word [nosplit esi*2 + NEXTSPRITESTAT]
    mov dword [esp + 4], eax
    movsx eax, word [ecx + LINK_ADDRESS_66]
    imul eax, eax, 0x2c
    mov di, word [eax + LINK_ADDRESS_55]
    movsx ebx, di
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea ebx, [eax + eax]
    cmp word [ebx + LINK_ADDRESS_67], 0
    jge short loc_1067
    movsx eax, word [ebx + LINK_ADDRESS_40]
    mov dword [esp], eax
    mov ebp, dword [esp]
    lea eax, [eax*4]
    add eax, ebp
    lea eax, [eax*8]
    cmp word [eax + LINK_ADDRESS_68], 1
    jne short loc_1067
    movsx ebp, word [ebx + LINK_ADDRESS_15]
    imul ebp, ebp, 0x2c
    cmp word [ebp + LINK_ADDRESS_35], 0
    jg short loc_1091
loc_1067:
    movsx ebx, di
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov word [nosplit eax*2 + LINK_ADDRESS_69], 0xffff
    movsx eax, dx
    call LINK_ADDRESS_70
    jmp near loc_11d2
loc_1091:
    cmp byte [ebx + LINK_ADDRESS_71], 0
    je near loc_1126
    cmp byte [ebx + LINK_ADDRESS_72], 1
    jne near loc_1126
    cmp word [eax + LINK_ADDRESS_68], 1
    jne short loc_1126
    mov word [ecx + LINK_ADDRESS_12], 0x101
    movsx eax, word [ecx + LINK_ADDRESS_18]
    mov dword [esp], eax
    mov ebp, dword [esp]
    lea eax, [eax*4]
    add eax, ebp
    mov eax, dword [eax*8 + LINK_ADDRESS_73]
    add eax, 0x1b00
    mov dword [ecx + LINK_ADDRESS_74], eax
    mov ax, word [ebx + LINK_ADDRESS_75]
    mov word [ecx + LINK_ADDRESS_76], ax
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov ebx, dword [eax + LINK_ADDRESS_77]
    cmp ebx, 8
    jne short loc_111b
    xor esi, esi
    mov dword [eax + LINK_ADDRESS_77], esi
    jmp short loc_1168
loc_111b:
    lea ecx, [ebx + 1]
    mov dword [eax + LINK_ADDRESS_77], ecx
    jmp short loc_1168
loc_1126:
    movsx ecx, dx
    imul ecx, ecx, 0x2c
    movsx ebx, word [ecx + LINK_ADDRESS_18]
    lea eax, [ebx*4]
    add eax, ebx
    lea eax, [eax*8]
    cmp word [eax + LINK_ADDRESS_68], 2
    je short loc_1159
    mov eax, dword [eax + LINK_ADDRESS_78]
    mov dword [ecx + LINK_ADDRESS_74], eax
loc_1159:
    movsx eax, dx
    imul eax, eax, 0x2c
    mov word [eax + LINK_ADDRESS_12], 0x8000
loc_1168:
    movsx esi, dx
    imul edx, esi, 0x2c
    movsx ebx, di
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov ebx, dword [nosplit eax*2 + LINK_ADDRESS_79]
    mov edi, dword [nosplit eax*2 + LINK_ADDRESS_37]
    mov ecx, dword [nosplit eax*2 + LINK_ADDRESS_38]
    mov ebp, dword [edx + SPRITE]
    sub ebx, edi
    mov edi, dword [edx + LINK_ADDRESS_80]
    add ebp, ebx
    mov ebx, dword [nosplit eax*2 + LINK_ADDRESS_81]
    mov dword [edx + SPRITE], ebp
    sub ebx, ecx
    mov eax, esi
    add edi, ebx
    mov ecx, dword [edx + LINK_ADDRESS_74]
    mov dword [edx + LINK_ADDRESS_80], edi
    mov ebx, edi
    mov edx, dword [edx + SPRITE]
    call LINK_ADDRESS_82
loc_11d2:
    mov edx, dword [esp + 4]
    jmp near loc_0fe0
loc_11db:
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
