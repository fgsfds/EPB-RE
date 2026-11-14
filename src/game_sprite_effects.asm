; Process sprite effects by tile and status.
bits 32
org START_ADDRESS

loc_0000:
    push esi
    push edi
    push ebp
    sub esp, 0x10
    mov dword [esp + 4], edx
    mov dword [esp + 8], ebx
    mov dword [esp + 0xc], ecx
    xor edx, edx
    mov dword [esp], edx
    imul edx, eax, 0x2c
    mov bx, word [edx + LINK_ADDRESS_1]
    xor esi, esi
    cmp bx, 0x200
    jne near loc_0360
    mov cl, byte [LINK_ADDRESS_2]
    mov ebx, 0xd
    test cl, 0x20
    je near loc_0360
    mov cl, bl
    mov bl, 1
    and cl, 7
    shl bl, cl
    not bl
    mov bh, byte [LINK_ADDRESS_2]
    mov edi, eax
    and bh, bl
    mov cx, word [edx + LINK_ADDRESS_3]
    mov byte [LINK_ADDRESS_2], bh
    cmp cx, 0x2a
    jne short loc_006f
    mov esi, 0x28
loc_006f:
    imul edx, eax, 0x2c
    cmp word [edx + LINK_ADDRESS_3], 0x2b
    jne short loc_0081
    mov esi, 0x29
loc_0081:
    imul edx, eax, 0x2c
    cmp word [edx + LINK_ADDRESS_3], 0x2c
    jne short loc_0093
    mov esi, 0x28
loc_0093:
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_3], 0x2d
    jne short loc_00a5
    mov esi, 0x29
loc_00a5:
    xor ebx, ebx
loc_00a7:
    imul eax, ebx, 0x2c
    cmp word [eax + LINK_ADDRESS_4], 1
    jne short loc_00d6
    movsx edx, word [eax + LINK_ADDRESS_3]
    cmp edx, esi
    jne short loc_00d6
    imul ecx, edi, 0x2c
    mov ax, word [eax + LINK_ADDRESS_5]
    cmp ax, word [ecx + LINK_ADDRESS_5]
    jne short loc_00d6
    mov edi, ebx
    jmp short loc_00df
loc_00d6:
    inc ebx
    cmp ebx, 0x1000
    jl short loc_00a7
loc_00df:
    cmp esi, 0x28
    sete al
    movzx esi, al
    xor ebx, ebx
    add esi, 0x28
loc_00ed:
    imul eax, ebx, 0x2c
    cmp word [eax + LINK_ADDRESS_4], 1
    jne short loc_011d
    movsx edx, word [eax + LINK_ADDRESS_3]
    cmp edx, esi
    jne short loc_011d
    imul edx, edi, 0x2c
    mov ax, word [eax + LINK_ADDRESS_5]
    cmp ax, word [edx + LINK_ADDRESS_5]
    jne short loc_011d
    mov dword [esp], ebx
    jmp short loc_0126
loc_011d:
    inc ebx
    cmp ebx, 0x1000
    jl short loc_00ed
loc_0126:
    xor ebx, ebx
loc_0128:
    imul eax, ebx, 0x2c
    cmp word [eax + LINK_ADDRESS_4], 1
    jne near loc_0232
    lea edx, [esi + 2]
    movsx ecx, word [eax + LINK_ADDRESS_3]
    cmp ecx, edx
    jne near loc_0232
    imul ecx, edi, 0x2c
    mov dx, word [eax + LINK_ADDRESS_5]
    cmp dx, word [ecx + LINK_ADDRESS_5]
    jne near loc_0232
    cmp esi, 0x28
    jne short loc_01c7
    movsx ebp, word [eax + LINK_ADDRESS_6]
    lea ecx, [ebp*4]
    add ecx, ebp
    lea ecx, [ecx*8]
    mov edx, dword [esp + 0xc]
    mov eax, dword [ecx + LINK_ADDRESS_7]
    sub edx, eax
    mov dword [ebp*4 + LINK_ADDRESS_8], eax
    mov eax, edx
    sar edx, 0x1f
    shl edx, 0xf
    db 0x1b, 0xc2    ; sbb eax, edx
    sar eax, 0xf
    inc eax
    mov edx, dword [ecx + LINK_ADDRESS_7]
    shl eax, 0xf
    add edx, eax
    movsx eax, word [ecx + LINK_ADDRESS_9]
    mov dword [ecx + LINK_ADDRESS_7], edx
    mov dword [ebp*4 + LINK_ADDRESS_10], eax
    mov word [ecx + LINK_ADDRESS_9], 0xd
loc_01c7:
    cmp esi, 0x29
    jne short loc_0232
    imul ebp, ebx, 0x2c
    movsx ebp, word [ebp + LINK_ADDRESS_6]
    lea ecx, [ebp*4]
    add ecx, ebp
    lea ecx, [ecx*8]
    mov edx, dword [esp + 0xc]
    mov eax, dword [ecx + LINK_ADDRESS_11]
    sub edx, eax
    mov dword [ebp*4 + LINK_ADDRESS_8], eax
    mov eax, edx
    sar edx, 0x1f
    shl edx, 0xf
    db 0x1b, 0xc2    ; sbb eax, edx
    sar eax, 0xf
    dec eax
    mov edx, dword [ecx + LINK_ADDRESS_11]
    shl eax, 0xf
    add edx, eax
    movsx eax, word [ecx + LINK_ADDRESS_12]
    mov dword [ecx + LINK_ADDRESS_11], edx
    mov edx, 0xd
    mov dword [ebp*4 + LINK_ADDRESS_10], eax
    mov word [ecx + LINK_ADDRESS_12], dx
loc_0232:
    inc ebx
    cmp ebx, 0x1000
    jl near loc_0128
    imul eax, edi, 0x2c
    mov edx, dword [esp]
    mov ebx, dword [eax + SPRITE]
    mov ebp, dword [eax + LINK_ADDRESS_14]
    imul eax, edx, 0x2c
    mov ecx, dword [esp + 4]
    sub ecx, ebx
    mov ebx, dword [esp + 8]
    movsx edx, word [eax + LINK_ADDRESS_6]
    sub ebx, ebp
    push edx
    movsx edx, word [esp + 0x28]
    movsx ebp, word [esp + 0x24]
    push edx
    mov edx, dword [eax + LINK_ADDRESS_14]
    mov eax, dword [eax + SPRITE]
    add edx, ebx
    mov ebx, dword [esp + 0x14]
    add eax, ecx
    mov ecx, ebp
    call LINK_ADDRESS_15
    mov ecx, dword [esp + 0x28]
    mov edx, dword [esp + 8]
    mov eax, dword [esp + 4]
    mov ebx, ebp
    call LINK_ADDRESS_16
    call LINK_ADDRESS_17
    xor ebx, ebx
loc_02a8:
    imul eax, ebx, 0x2c
    cmp word [eax + LINK_ADDRESS_4], 1
    jne near loc_0353
    lea edx, [esi + 2]
    movsx ecx, word [eax + LINK_ADDRESS_3]
    cmp ecx, edx
    jne near loc_0353
    imul edx, edi, 0x2c
    mov cx, word [eax + LINK_ADDRESS_5]
    cmp cx, word [edx + LINK_ADDRESS_5]
    jne short loc_0353
    cmp esi, 0x28
    jne short loc_0316
    movsx edx, word [eax + LINK_ADDRESS_6]
    lea ecx, [edx*4]
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [ecx + LINK_ADDRESS_8]
    mov dword [eax*8 + LINK_ADDRESS_7], edx
    mov dx, word [ecx + LINK_ADDRESS_10]
    mov word [eax*8 + LINK_ADDRESS_9], dx
loc_0316:
    cmp esi, 0x29
    jne short loc_0353
    imul eax, ebx, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_6]
    lea edx, [eax*4]
    mov ecx, eax
    lea eax, [eax*4]
    add eax, ecx
    mov ecx, dword [edx + LINK_ADDRESS_8]
    mov dx, word [edx + LINK_ADDRESS_10]
    mov dword [eax*8 + LINK_ADDRESS_11], ecx
    mov word [eax*8 + LINK_ADDRESS_12], dx
loc_0353:
    inc ebx
    cmp ebx, 0x1000
    jl near loc_02a8
loc_0360:
    add esp, 0x10
    pop ebp
    pop edi
    pop esi
    ret 0xc
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push esi
    push edi
    push ebp
    sub esp, 8
    mov dword [esp], eax
    mov ebp, edx
    mov edi, ebx
    mov dword [esp + 4], ecx
    movsx esi, word [LINK_ADDRESS_18]
loc_0388:
    test esi, esi
    jl short loc_03f4
    imul ebx, esi, 0x2c
    mov ax, word [ebx + LINK_ADDRESS_3]
    db 0x66, 0x3d, 0x2a, 0x00    ; cmp ax, 0x2a
    jb short loc_03ea
    db 0x66, 0x3d, 0x2d, 0x00    ; cmp ax, 0x2d
    ja short loc_03ea
    movsx edx, word [LINK_ADDRESS_19]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ax, word [nosplit eax*2 + LINK_ADDRESS_20]
    cmp ax, word [ebx + LINK_ADDRESS_6]
    jne short loc_03ea
    mov edx, dword [esp + 0x1c]
    push edx
    movsx eax, word [esp + 0x1c]
    mov ecx, edi
    push eax
    movsx eax, word [esp + 0xc]
    mov ebx, ebp
    push eax
    mov edx, dword [esp + 0xc]
    mov eax, esi
    call loc_0000
loc_03ea:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESTAT]
    jmp short loc_0388
loc_03f4:
    add esp, 8
    pop ebp
    pop edi
    pop esi
    ret 8
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
