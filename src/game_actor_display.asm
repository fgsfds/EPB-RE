; Actor and sprite positioning helpers.
bits 32
org START_ADDRESS

loc_0000:
    push esi
    push edi
    push ebp
    sub esp, 0x18
    mov ebp, eax
    mov edi, edx
    mov dword [esp + 0x14], ebx
    mov dword [esp + 8], ecx
    mov eax, esp
    mov ebx, edx
    push eax
    mov edx, ebp
    movsx eax, word [ecx]
    lea ecx, [esp + 8]
    call GETZSOFSLOPE
    mov eax, dword [esp + 0x14]
    cmp eax, dword [esp + 4]
    jl short loc_004c
    cmp eax, dword [esp]
    jg short loc_004c
    mov ebx, dword [esp + 8]
    mov edx, edi
    mov eax, ebp
    movsx ebx, word [ebx]
    call INSIDE
    test eax, eax
    jne near loc_010c
loc_004c:
    mov eax, dword [esp + 8]
    mov dx, word [eax]
    test dx, dx
    jl near loc_00f7
    cmp dx, word [NUMSECTORS]
    jge near loc_00f7
    movsx ebx, dx
    lea eax, [ebx*4]
    add eax, ebx
    movsx ebx, word [eax*8 + SECTOR]
    mov ecx, WALL
    shl ebx, 5
    movsx eax, word [eax*8 + LINK_ADDRESS_6]
    add ecx, ebx
    mov dword [esp + 0x10], eax
    mov dword [esp + 0xc], ecx
loc_0097:
    mov esi, dword [esp + 0xc]
    movsx esi, word [esi + 0xc]
    test esi, esi
    jl short loc_00e1
    mov eax, esp
    lea ecx, [esp + 4]
    mov ebx, edi
    push eax
    mov edx, ebp
    mov eax, esi
    call GETZSOFSLOPE
    mov eax, dword [esp + 0x14]
    cmp eax, dword [esp + 4]
    jl short loc_00e1
    cmp eax, dword [esp]
    jg short loc_00e1
    movsx ebx, si
    mov edx, edi
    mov eax, ebp
    call INSIDE
    cmp eax, 1
    jne short loc_00e1
    mov eax, dword [esp + 8]
    mov word [eax], si
    jmp near loc_010c
loc_00e1:
    mov ebx, dword [esp + 0xc]
    add ebx, 0x20
    mov ecx, dword [esp + 0x10]
    mov dword [esp + 0xc], ebx
    dec ecx
    mov dword [esp + 0x10], ecx
    jne short loc_0097
loc_00f7:
    movsx esi, word [NUMSECTORS]
loc_00fe:
    dec esi
    test esi, esi
    jge short loc_0113
    mov eax, dword [esp + 8]
    mov word [eax], 0xffff
loc_010c:
    add esp, 0x18
    pop ebp
    pop edi
    pop esi
    ret
loc_0113:
    mov eax, esp
    lea ecx, [esp + 4]
    mov ebx, edi
    push eax
    mov edx, ebp
    mov eax, esi
    call GETZSOFSLOPE
    mov eax, dword [esp + 0x14]
    cmp eax, dword [esp + 4]
    jl short loc_00fe
    cmp eax, dword [esp]
    jg short loc_00fe
    movsx ebx, si
    mov edx, edi
    mov eax, ebp
    call INSIDE
    cmp eax, 1
    jne short loc_00fe
    mov eax, dword [esp + 8]
    mov word [eax], si
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
    sub esp, 0x34
    mov dword [esp + 0x20], edx
    mov dword [esp + 0x1c], ebx
    mov dword [esp + 0x18], ecx
    movsx eax, word [eax + 0x340]
    imul eax, eax, 0x2c
    movsx edx, word [esp + 0x48]
    lea ebx, [edx + 0x600]
    add edx, 0x400
    and edx, 0x7ff
    movsx esi, word [nosplit edx*2 + SINTABLE]
    movsx edx, word [esp + 0x4c]
    shl edx, 7
    sub edx, 0x3200
    mov dword [esp + 0x14], edx
    mov edx, SPRITE
    add edx, eax
    and ebx, 0x7ff
    mov ax, word [edx + 0xc]
    movsx edi, word [nosplit ebx*2 + SINTABLE]
    mov dword [esp + 0x2c], eax
    and eax, 0xfffffefe
    mov dword [esp + 0x10], edx
    mov word [edx + 0xc], ax
    mov edx, dword [esp + 0x1c]
    mov eax, dword [esp + 0x20]
    mov ebx, dword [ecx]
    mov ecx, dword [esp + 0x44]
    mov edx, dword [edx]
    mov eax, dword [eax]
    call loc_0000
    push 0x1000040
    lea eax, [esp + 4]
    push eax
    lea eax, [esp + 0xc]
    push eax
    lea eax, [esp + 0x14]
    push eax
    lea eax, [esp + 0x38]
    sar edi, 4
    push eax
    lea eax, [esp + 0x38]
    sar esi, 4
    push eax
    lea eax, [esp + 0x48]
    mov edx, dword [esp + 0x2c]
    push eax
    mov ecx, dword [esp + 0x60]
    mov ebx, dword [esp + 0x34]
    push edx
    movsx ecx, word [ecx]
    mov ebx, dword [ebx]
    push esi
    mov eax, dword [esp + 0x44]
    mov edx, dword [esp + 0x40]
    push edi
    mov eax, dword [eax]
    mov edx, dword [edx]
    call LINK_ADDRESS_9
    mov eax, dword [esp + 0x44]
    cmp word [eax], 0
    jl near loc_0440
    mov eax, dword [esp + 0x20]
    mov ebx, dword [eax]
    mov eax, dword [esp + 0x1c]
    mov ecx, dword [esp + 8]
    mov edx, dword [eax]
    mov eax, edi
    mov ebp, dword [esp + 4]
    test eax, eax
    jns short loc_0266
    neg eax
loc_0266:
    sub ebp, edx
    mov edx, eax
    mov eax, esi
    sub ecx, ebx
    test eax, eax
    jns short loc_0274
    neg eax
loc_0274:
    add edx, eax
    mov eax, ecx
    mov dword [esp + 0xc], edx
    test eax, eax
    jns short loc_0282
    neg eax
loc_0282:
    mov edx, eax
    mov eax, ebp
    mov ebx, dword [esp + 0xc]
    test eax, eax
    jns short loc_0290
    neg eax
loc_0290:
    add eax, edx
    cmp eax, ebx
    jge near loc_03a4
    mov edx, dword [esp + 0x44]
    mov eax, dword [esp + 0x30]
    mov word [edx], ax
    mov ebx, dword [esp + 0x24]
    test bx, bx
    jl near loc_033c
    movsx eax, bx
    shl eax, 5
    movsx ebx, word [eax + LINK_ADDRESS_10]
    shl ebx, 5
    mov edx, dword [ebx + LINK_ADDRESS_11]
    sub edx, dword [eax + LINK_ADDRESS_11]
    mov dword [esp + 0xc], edx
    mov edx, dword [ebx + WALL]
    mov ebx, dword [eax + WALL]
    mov eax, edx
    mov edx, dword [esp + 0xc]
    sub eax, ebx
    call GETANGLE
    cwde
    lea edx, [eax + 0x600]
    movsx eax, word [nosplit eax*2 + SINTABLE]
    imul eax, edi
    and edx, 0x7ff
    movsx edx, word [nosplit edx*2 + SINTABLE]
    imul edx, esi
    add edx, eax
    mov eax, edi
    test eax, eax
    jns short loc_0318
    neg eax
loc_0318:
    mov ebx, eax
    mov eax, esi
    test eax, eax
    jns short loc_0322
    neg eax
loc_0322:
    cmp ebx, eax
    jle short loc_0332
    mov eax, edi
    imul edx
    shrd eax, edx, 0x1c
    sub ecx, eax
    jmp short loc_036a
loc_0332:
    mov eax, esi
    imul edx
    shrd eax, edx, 0x1c
    jmp short loc_0368
loc_033c:
    cmp word [esp + 0x28], 0
    jge short loc_036a
    mov eax, edi
    test eax, eax
    jns short loc_034c
    neg eax
loc_034c:
    mov edx, eax
    mov eax, esi
    test eax, eax
    jns short loc_0356
    neg eax
loc_0356:
    cmp edx, eax
    jle short loc_0363
    mov eax, edi
    sar eax, 5
    sub ecx, eax
    jmp short loc_036a
loc_0363:
    mov eax, esi
    sar eax, 5
loc_0368:
    sub ebp, eax
loc_036a:
    mov eax, edi
    test eax, eax
    jns short loc_0372
    neg eax
loc_0372:
    mov edx, eax
    mov eax, esi
    test eax, eax
    jns short loc_037c
    neg eax
loc_037c:
    cmp edx, eax
    jle short loc_0386
    mov ebx, edi
    mov eax, ecx
    jmp short loc_038a
loc_0386:
    mov ebx, esi
    mov eax, ebp
loc_038a:
    mov edx, eax
    sar edx, 0x10
    shl eax, 0x10
    idiv ebx
    mov edx, eax
    cmp edx, dword [LINK_ADDRESS_13]
    jge short loc_03a4
    mov dword [LINK_ADDRESS_13], edx
loc_03a4:
    mov edx, dword [LINK_ADDRESS_13]
    mov eax, edi
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [esp + 0x20]
    add dword [edx], eax
    mov eax, esi
    mov edx, dword [LINK_ADDRESS_13]
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [esp + 0x1c]
    add dword [edx], eax
    mov eax, dword [esp + 0x14]
    mov edx, dword [LINK_ADDRESS_13]
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [esp + 0x18]
    add dword [edx], eax
    mov edx, dword [TOTALCLOCK]
    mov ecx, dword [LINK_ADDRESS_15]
    sub edx, ecx
    mov esi, dword [LINK_ADDRESS_13]
    shl edx, 0xa
    add edx, esi
    cmp edx, 0x10000
    jge short loc_0411
    mov eax, dword [TOTALCLOCK]
    sub eax, ecx
    shl eax, 0xa
    add eax, esi
    jmp short loc_0416
loc_0411:
    mov eax, 0x10000
loc_0416:
    mov dword [LINK_ADDRESS_13], eax
    mov eax, dword [TOTALCLOCK]
    mov ebx, dword [esp + 0x18]
    mov edx, dword [esp + 0x1c]
    mov ecx, dword [esp + 0x44]
    mov dword [LINK_ADDRESS_15], eax
    mov eax, dword [esp + 0x20]
    mov ebx, dword [ebx]
    mov edx, dword [edx]
    mov eax, dword [eax]
    call loc_0000
loc_0440:
    mov edx, dword [esp + 0x10]
    mov eax, dword [esp + 0x2c]
    mov word [edx + 0xc], ax
    add esp, 0x34
    pop ebp
    pop edi
    pop esi
    ret 0xc
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
    push ebx
    push ecx
    push edx
    push ebp
    cmp byte [LINK_ADDRESS_16], 0
    jne short loc_0476
    cmp dword [LINK_ADDRESS_17], 2
    jne short loc_04d3
loc_0476:
    cmp dword [LINK_ADDRESS_18], 1
    je short loc_04b7
    cmp dword [LINK_ADDRESS_19], 1
    jle short loc_049b
    mov ecx, 0xc8
    mov edx, 8
    mov eax, dword [YDIM]
    imul edx
    idiv ecx
loc_049b:
    cmp dword [LINK_ADDRESS_19], 4
    jle short loc_04b7
    mov ecx, 0xc8
    mov edx, 8
    mov eax, dword [YDIM]
    imul edx
    idiv ecx
loc_04b7:
    cmp dword [LINK_ADDRESS_21], 8
    jl short loc_04d3
    mov ecx, 0xc8
    mov edx, 0xa6
    mov eax, dword [YDIM]
    imul edx
    idiv ecx
loc_04d3:
    mov ebp, dword [LINK_ADDRESS_22]
    test ebp, ebp
    jne short loc_0509
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    lea ebx, [ebp + 1]
    sub eax, edx
    mov edx, LINK_ADDRESS_24
    mov dword [LINK_ADDRESS_22], ebx
    mov dword [nosplit eax*2 + LINK_ADDRESS_25], edx
loc_0509:
    call LINK_ADDRESS_26
    mov ecx, 0x30
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_27
    cmp dword [LINK_ADDRESS_28], 0
    jne short loc_0549
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dword [nosplit eax*2 + LINK_ADDRESS_25], LINK_ADDRESS_24
loc_0549:
    pop ebp
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
