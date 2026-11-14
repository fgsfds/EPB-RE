; Game event state and counters.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    sub dword [0x92e4], 3
    jmp short loc_0010
    sub dword [0x92e4], 5
loc_0010:
    cmp dword [0x92e4], 0
    jg short loc_0023
    mov dword [0x92e4], 1
loc_0023:
    mov edx, dword [0x92cc]
    cmp edx, 3
    jle short loc_0037
    lea ebx, [edx - 2]
    mov dword [0x92cc], ebx
loc_0037:
    cmp dword [0x121408], 0xfffff5f6
    jge short loc_004d
    mov dword [0x121408], 0xfffff5f6
loc_004d:
    cmp dword [0x121408], 0xa0a
    jle short loc_0063
    mov dword [0x121408], 0xa0a
loc_0063:
    cmp dword [0x121404], 0xfffff5f6
    jge short loc_0079
    mov dword [0x121404], 0xfffff5f6
loc_0079:
    cmp dword [0x121404], 0xa0a
    jle short loc_008f
    mov dword [0x121404], 0xa0a
loc_008f:
    cmp dword [0x121b18], -0x7f
    jge short loc_00a2
    mov dword [0x121b18], 0xffffff81
loc_00a2:
    cmp dword [0x121b18], 0x7f
    jle short loc_00b5
    mov dword [0x121b18], 0x7f
loc_00b5:
    cmp dword [0x12140c], -0x7f
    jge short loc_00c8
    mov dword [0x12140c], 0xffffff81
loc_00c8:
    cmp dword [0x12140c], 0x7f
    jle short loc_00db
    mov dword [0x12140c], 0x7f
loc_00db:
    cmp byte [0x125782], 0
    je short loc_0129
    cmp byte [0x125cf0], 0
    je short loc_0129
    mov eax, dword [0x121408]
    xor ecx, ecx
    mov dword [0x125d0b], eax
    mov word [0x123fc6], cx
    mov word [0x123fc8], cx
    mov eax, dword [0x121b18]
    xor cl, cl
    mov dword [0x125d0f], eax
    mov byte [0x123fc4], cl
    mov byte [0x123fc5], cl
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0129:
    cmp word [0x2f2924], 1
    jle short loc_013b
    mov ax, word [0x1256ba]
    jmp short loc_0142
loc_013b:
    mov ax, word [ecx + 0x298]
loc_0142:
    movsx ebp, ax
    lea eax, [ebp + 0xa00]
    and eax, 0x7ff
    lea ecx, [ebp + 0x800]
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x96, 0x24, 0x00    ; mov dx, word [eax*2 + 0x2496b4]
    mov eax, dword [0x121408]
    movsx edx, dx
    and ecx, 0x7ff
    imul edx
    shrd eax, edx, 9
    mov edi, eax
    db 0x66, 0x8b, 0x04, 0x4d, 0xb4, 0x96, 0x24, 0x00    ; mov ax, word [ecx*2 + 0x2496b4]
    mov ebx, dword [0x121408]
    movsx edx, ax
    mov eax, ebx
    imul edx
    shrd eax, edx, 9
    mov esi, eax
    db 0x66, 0x8b, 0x04, 0x4d, 0xb4, 0x96, 0x24, 0x00    ; mov ax, word [ecx*2 + 0x2496b4]
    mov ebx, dword [0x121404]
    movsx edx, ax
    mov eax, ebx
    imul edx
    shrd eax, edx, 9
    lea ecx, [edi + eax]
    lea eax, [ebp + 0x600]
    and eax, 0x7ff
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x96, 0x24, 0x00    ; mov dx, word [eax*2 + 0x2496b4]
    mov eax, dword [0x121404]
    movsx edx, dx
    imul edx
    shrd eax, edx, 9
    lea ebx, [esi + eax]
    mov edx, dword [0x123c34]
    mov esi, dword [0x123c30]
    add ecx, edx
    mov al, byte [0x121b18]
    mov word [0x123fc6], cx
    mov byte [0x123fc4], al
    add ebx, esi
    mov al, byte [0x12140c]
    mov word [0x123fc8], bx
    mov byte [0x123fc5], al
    add esp, 0x1c
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
    push ebp
    mov ecx, eax
    movsx eax, word [eax + 0x340]
    imul eax, eax, 0x2c
    mov edx, dword [ecx + 0x264]
    mov esi, dword [ecx + 0x22c]
    inc edx
    movsx ebx, word [eax + 0x2522d6]
    mov dword [ecx + 0x264], edx
    test esi, esi
    jle short loc_0245
    lea edi, [esi - 1]
    mov dword [ecx + 0x22c], edi
loc_0245:
    mov dx, word [ecx + 0x316]
    test dx, dx
    jle short loc_025b
    mov esi, edx
    dec esi
    mov word [ecx + 0x316], si
loc_025b:
    mov ebp, dword [ecx + 0x258]
    test ebp, ebp
    jle short loc_0285
    lea eax, [ebp - 1]
    mov dword [ecx + 0x258], eax
    cmp eax, 0x1624
    jne short loc_0285
    mov byte [ecx + 0x3d1], 0
    mov word [ecx + 0x392], 0xa
loc_0285:
    mov di, word [ecx + 0x38a]
    test di, di
    jle short loc_02ac
    cmp di, 0x190
    jge short loc_02ac
    mov edx, edi
    dec dx
    mov word [ecx + 0x38a], dx
    jne short loc_02ac
    mov eax, ecx
    call 0x27ab0
loc_02ac:
    cmp byte [ecx + 0x3d0], 0
    je short loc_02de
    mov di, word [ecx + 0x354]
    test di, di
    jle short loc_02de
    mov eax, edi
    dec ax
    mov word [ecx + 0x354], ax
    jne short loc_02de
    mov eax, ecx
    mov byte [ecx + 0x3d0], 0
    call 0x27ab0
    mov eax, ecx
loc_02de:
    cmp word [ecx + 0x38e], 0
    jl short loc_030c
    mov di, word [ecx + 0x31c]
    dec edi
    mov word [ecx + 0x31c], di
    test di, di
    jg short loc_030c
    mov eax, ecx
    mov word [ecx + 0x38e], 0xffff
    call 0x27ab0
loc_030c:
    cmp byte [ecx + 0x3cb], 0
    je short loc_0352
    mov dx, word [ecx + 0x388]
    test dx, dx
    jle short loc_0352
    mov esi, edx
    dec esi
    mov word [ecx + 0x388], si
    test si, si
    jg short loc_0352
    mov eax, ecx
    mov byte [ecx + 0x3cb], 0
    call 0x27ab0
    mov eax, 0x32
    call 0x581a0
    mov eax, 0x31
    call 0x581a0
loc_0352:
    cmp word [ecx + 0x352], 0
    jle short loc_0395
    movsx eax, word [ecx + 0x340]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x2522c5], 1
    je short loc_0395
    mov dx, word [ecx + 0x352]
    dec edx
    mov word [ecx + 0x352], dx
    cmp dx, 8
    jne short loc_0395
    mov edx, 0x9d9
    movsx eax, word [ecx + 0x340]
    call 0x45b50
loc_0395:
    mov di, word [ecx + 0x32a]
    test di, di
    je near loc_04c0
    movsx eax, word [ecx + 0x340]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x2522c5], 1
    je near loc_04c0
    mov eax, edi
    inc eax
    mov word [ecx + 0x32a], ax
    movsx eax, word [ecx + 0x340]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522de], 0
    jg short loc_03e3
    mov word [ecx + 0x32a], 0xc
loc_03e3:
    cmp word [ecx + 0x32a], 0xc
    jne near loc_049b
    mov di, word [ecx + 0x332]
    test di, di
    jl short loc_0451
    movsx edx, di
    movsx eax, bx
    mov ebx, 1
    call 0x52880
    movsx eax, word [ecx + 0x332]
    imul eax, eax, 0x2c
    mov al, byte [eax + 0x2522c5]
    cmp al, 0x15
    jb short loc_0429
    jbe short loc_0436
    cmp al, 0x17
    je short loc_043f
    jmp short loc_0446
loc_0429:
    test al, al
    jne short loc_0446
    and byte [ecx + 0x336], 0xfe
    jmp short loc_0446
loc_0436:
    and byte [ecx + 0x336], 0xfd
    jmp short loc_0446
loc_043f:
    and byte [ecx + 0x336], 0xfb
loc_0446:
    mov word [ecx + 0x332], 0xffff
    jmp short loc_049b
loc_0451:
    movsx eax, bx
    movsx edx, word [ecx + 0x330]
    xor ebx, ebx
    call 0x52880
    movsx eax, word [ecx + 0x330]
    shl eax, 5
    mov al, byte [eax + 0x27e4c9]
    cmp al, 0x15
    jb short loc_047e
    jbe short loc_048b
    cmp al, 0x17
    je short loc_0494
    jmp short loc_049b
loc_047e:
    test al, al
    jne short loc_049b
    and byte [ecx + 0x336], 0xfe
    jmp short loc_049b
loc_048b:
    and byte [ecx + 0x336], 0xfd
    jmp short loc_049b
loc_0494:
    and byte [ecx + 0x336], 0xfb
loc_049b:
    cmp word [ecx + 0x32a], 0x14
    jle short loc_04c0
    mov word [ecx + 0x32a], 0
    mov word [ecx + 0x392], 0xa
    mov word [ecx + 0x334], 0
loc_04c0:
    cmp byte [ecx + 0x3ce], 0
    jne short loc_052c
    movsx edx, word [ecx + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9cd6], 2
    jne short loc_052c
    cmp word [ecx + 0x386], 0
    jle short loc_050a
    mov eax, 0x4c
    mov byte [ecx + 0x3ce], 1
    mov edx, ecx
    mov byte [ecx + 0x3c9], 6
    call 0x15e50
    jmp short loc_055f
loc_050a:
    mov dx, word [ecx + 0x326]
    test dx, dx
    jle short loc_0522
    mov esi, edx
    dec esi
    mov word [ecx + 0x326], si
    jmp short loc_055f
loc_0522:
    add word [ecx + 0x350], 0x20
    jmp short loc_055f
loc_052c:
    cmp word [ecx + 0x386], 0
    jle short loc_055f
    cmp byte [ecx + 0x3ce], 0
    je short loc_055f
    mov si, word [ecx + 0x386]
    dec si
    mov word [ecx + 0x386], si
    jne short loc_055f
    mov eax, ecx
    mov byte [ecx + 0x3ce], 0
    call 0x27ab0
loc_055f:
    xor al, al
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
%else
    dec dword [0x9274]
    jmp short loc_000f
    sub dword [0x9274], 4
loc_000f:
    cmp dword [0x9274], 0
    jg short loc_0022
    mov dword [0x9274], 1
loc_0022:
    mov edx, dword [0x925c]
    cmp edx, 3
    jle short loc_0036
    lea ebx, [edx - 2]
    mov dword [0x925c], ebx
loc_0036:
    cmp dword [0xe445c], 0xfffff5f6
    jge short loc_004c
    mov dword [0xe445c], 0xfffff5f6
loc_004c:
    cmp dword [0xe445c], 0xa0a
    jle short loc_0062
    mov dword [0xe445c], 0xa0a
loc_0062:
    cmp dword [0xe4458], 0xfffff5f6
    jge short loc_0078
    mov dword [0xe4458], 0xfffff5f6
loc_0078:
    cmp dword [0xe4458], 0xa0a
    jle short loc_008e
    mov dword [0xe4458], 0xa0a
loc_008e:
    cmp dword [0xe4b6c], -0x7f
    jge short loc_00a1
    mov dword [0xe4b6c], 0xffffff81
loc_00a1:
    cmp dword [0xe4b6c], 0x7f
    jle short loc_00b4
    mov dword [0xe4b6c], 0x7f
loc_00b4:
    cmp dword [0xe4460], -0x7f
    jge short loc_00c7
    mov dword [0xe4460], 0xffffff81
loc_00c7:
    cmp dword [0xe4460], 0x7f
    jle short loc_00da
    mov dword [0xe4460], 0x7f
loc_00da:
    cmp byte [0xe8d82], 0
    je short loc_0128
    cmp byte [0xe92f0], 0
    je short loc_0128
    mov eax, dword [0xe445c]
    xor ecx, ecx
    mov dword [0xe930b], eax
    mov word [0xe75c6], cx
    mov word [0xe75c8], cx
    mov eax, dword [0xe4b6c]
    xor cl, cl
    mov dword [0xe930f], eax
    mov byte [0xe75c4], cl
    mov byte [0xe75c5], cl
    add esp, 0x1c
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0128:
    cmp word [0x261214], 1
    jle short loc_013a
    mov ax, word [0xe8cb8]
    jmp short loc_0141
loc_013a:
    mov ax, word [ecx + 0x298]
loc_0141:
    movsx edi, ax
    lea eax, [edi + 0xa00]
    and eax, 0x7ff
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; mov dx, word [eax*2 + 0x1b7fa4]
    mov eax, dword [0xe445c]
    movsx edx, dx
    imul edx
    shrd eax, edx, 9
    mov ebp, eax
    lea eax, [edi + 0x800]
    and eax, 0x7ff
    db 0x8d, 0x1c, 0x45, 0x00, 0x00, 0x00, 0x00    ; lea ebx, [eax*2]
    mov ax, word [ebx + 0x1b7fa4]
    mov ecx, dword [0xe445c]
    movsx edx, ax
    mov eax, ecx
    imul edx
    shrd eax, edx, 9
    mov esi, eax
    mov ax, word [ebx + 0x1b7fa4]
    mov ebx, dword [0xe4458]
    movsx edx, ax
    mov eax, ebx
    imul edx
    shrd eax, edx, 9
    lea ebx, [eax + ebp]
    lea eax, [edi + 0x600]
    and eax, 0x7ff
    db 0x66, 0x8b, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; mov ax, word [eax*2 + 0x1b7fa4]
    mov ecx, dword [0xe4458]
    movsx edx, ax
    mov eax, ecx
    imul edx
    shrd eax, edx, 9
    lea ecx, [esi + eax]
    mov edx, dword [0xe7234]
    mov esi, dword [0xe7230]
    add ebx, edx
    mov al, byte [0xe4b6c]
    mov word [0xe75c6], bx
    mov byte [0xe75c4], al
    add ecx, esi
    mov al, byte [0xe4460]
    mov word [0xe75c8], cx
    mov byte [0xe75c5], al
    add esp, 0x1c
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
    push ebp
    mov ecx, eax
    movsx eax, word [eax + 0x340]
    imul eax, eax, 0x2c
    mov edx, dword [ecx + 0x264]
    mov esi, dword [ecx + 0x22c]
    inc edx
    movsx ebx, word [eax + 0x1c0bc6]
    mov dword [ecx + 0x264], edx
    test esi, esi
    jle short loc_024b
    lea edi, [esi - 1]
    mov dword [ecx + 0x22c], edi
loc_024b:
    mov dx, word [ecx + 0x316]
    test dx, dx
    jle short loc_0261
    mov esi, edx
    dec esi
    mov word [ecx + 0x316], si
loc_0261:
    mov ebp, dword [ecx + 0x258]
    test ebp, ebp
    jle short loc_028b
    lea eax, [ebp - 1]
    mov dword [ecx + 0x258], eax
    cmp eax, 0x1624
    jne short loc_028b
    mov byte [ecx + 0x3d1], 0
    mov word [ecx + 0x392], 0xa
loc_028b:
    mov di, word [ecx + 0x38a]
    test di, di
    jle short loc_02b2
    cmp di, 0x190
    jge short loc_02b2
    mov edx, edi
    dec dx
    mov word [ecx + 0x38a], dx
    jne short loc_02b2
    mov eax, ecx
    call 0x27700
loc_02b2:
    cmp byte [ecx + 0x3d0], 0
    je short loc_02e9
    mov di, word [ecx + 0x354]
    test di, di
    jle short loc_02e9
    mov eax, edi
    dec ax
    mov word [ecx + 0x354], ax
    jne short loc_02e9
    mov eax, ecx
    mov byte [ecx + 0x3d0], 0
    call 0x27700
    mov eax, ecx
    call 0x47d00
loc_02e9:
    cmp word [ecx + 0x38e], 0
    jl short loc_0317
    mov di, word [ecx + 0x31c]
    dec edi
    mov word [ecx + 0x31c], di
    test di, di
    jg short loc_0317
    mov eax, ecx
    mov word [ecx + 0x38e], 0xffff
    call 0x27700
loc_0317:
    cmp byte [ecx + 0x3cb], 0
    je short loc_035d
    mov dx, word [ecx + 0x388]
    test dx, dx
    jle short loc_035d
    mov esi, edx
    dec esi
    mov word [ecx + 0x388], si
    test si, si
    jg short loc_035d
    mov eax, ecx
    mov byte [ecx + 0x3cb], 0
    call 0x27700
    mov eax, 0x32
    call 0x5ace0
    mov eax, 0x31
    call 0x5ace0
loc_035d:
    cmp word [ecx + 0x352], 0
    jle short loc_03a0
    movsx eax, word [ecx + 0x340]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x1c0bb5], 1
    je short loc_03a0
    mov dx, word [ecx + 0x352]
    dec edx
    mov word [ecx + 0x352], dx
    cmp dx, 8
    jne short loc_03a0
    mov edx, 0x9d9
    movsx eax, word [ecx + 0x340]
    call 0x48740
loc_03a0:
    mov di, word [ecx + 0x32a]
    test di, di
    je near loc_04cb
    movsx eax, word [ecx + 0x340]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x1c0bb5], 1
    je near loc_04cb
    mov eax, edi
    inc eax
    mov word [ecx + 0x32a], ax
    movsx eax, word [ecx + 0x340]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bce], 0
    jg short loc_03ee
    mov word [ecx + 0x32a], 0xc
loc_03ee:
    cmp word [ecx + 0x32a], 0xc
    jne near loc_04a6
    mov di, word [ecx + 0x332]
    test di, di
    jl short loc_045c
    movsx edx, di
    movsx eax, bx
    mov ebx, 1
    call 0x554d0
    movsx eax, word [ecx + 0x332]
    imul eax, eax, 0x2c
    mov al, byte [eax + 0x1c0bb5]
    cmp al, 0x15
    jb short loc_0434
    jbe short loc_0441
    cmp al, 0x17
    je short loc_044a
    jmp short loc_0451
loc_0434:
    test al, al
    jne short loc_0451
    and byte [ecx + 0x336], 0xfe
    jmp short loc_0451
loc_0441:
    and byte [ecx + 0x336], 0xfd
    jmp short loc_0451
loc_044a:
    and byte [ecx + 0x336], 0xfb
loc_0451:
    mov word [ecx + 0x332], 0xffff
    jmp short loc_04a6
loc_045c:
    movsx eax, bx
    movsx edx, word [ecx + 0x330]
    xor ebx, ebx
    call 0x554d0
    movsx eax, word [ecx + 0x330]
    shl eax, 5
    mov al, byte [eax + 0x1ecdb9]
    cmp al, 0x15
    jb short loc_0489
    jbe short loc_0496
    cmp al, 0x17
    je short loc_049f
    jmp short loc_04a6
loc_0489:
    test al, al
    jne short loc_04a6
    and byte [ecx + 0x336], 0xfe
    jmp short loc_04a6
loc_0496:
    and byte [ecx + 0x336], 0xfd
    jmp short loc_04a6
loc_049f:
    and byte [ecx + 0x336], 0xfb
loc_04a6:
    cmp word [ecx + 0x32a], 0x14
    jle short loc_04cb
    mov word [ecx + 0x32a], 0
    mov word [ecx + 0x392], 0xa
    mov word [ecx + 0x334], 0
loc_04cb:
    cmp byte [ecx + 0x3ce], 0
    jne short loc_0537
    movsx edx, word [ecx + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385c6], 2
    jne short loc_0537
    cmp word [ecx + 0x386], 0
    jle short loc_0515
    mov eax, 0x4c
    mov byte [ecx + 0x3ce], 1
    mov edx, ecx
    mov byte [ecx + 0x3c9], 6
    call 0x15e90
    jmp short loc_056a
loc_0515:
    mov dx, word [ecx + 0x326]
    test dx, dx
    jle short loc_052d
    mov esi, edx
    dec esi
    mov word [ecx + 0x326], si
    jmp short loc_056a
loc_052d:
    add word [ecx + 0x350], 0x20
    jmp short loc_056a
loc_0537:
    cmp word [ecx + 0x386], 0
    jle short loc_056a
    cmp byte [ecx + 0x3ce], 0
    je short loc_056a
    mov si, word [ecx + 0x386]
    dec si
    mov word [ecx + 0x386], si
    jne short loc_056a
    mov eax, ecx
    mov byte [ecx + 0x3ce], 0
    call 0x27700
loc_056a:
    xor al, al
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
    push ebx
    push edx
    mov ebx, eax
    mov dx, word [eax + 0x312]
    cmp dx, 1
    jl short loc_05d8
    cmp dx, 0x11
    jge short loc_05d8
    test dx, dx
    je short loc_05d8
    call 0x7079f
    test al, 1
    je short loc_05bb
    movsx edx, dx
    movsx eax, word [ebx + 0x340]
    db 0x0f, 0xbf, 0x14, 0x55, 0x80, 0x92, 0x00, 0x00    ; movsx edx, word [edx*2 + 0x9280]
    jmp short loc_05d3
loc_05bb:
    cmp dx, 1
    jb short loc_05d8
    cmp dx, 5
    ja short loc_05d8
    mov edx, 0x27d
    movsx eax, word [ebx + 0x340]
loc_05d3:
    call 0x19320
loc_05d8:
    pop edx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
%endif
