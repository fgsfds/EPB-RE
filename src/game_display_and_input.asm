; Early game code for timing, text rendering, and input.
bits 32
org START_ADDRESS

    lea eax, [dword eax + 0]
    db 0x8b, 0xd2    ; mov edx, edx
advance_clock_counter:
    mov eax, dword [TOTAL_CLOCK]
    inc dword [TOTAL_CLOCK]
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    mov ebx, 1
    mov edx, 0x78
    mov eax, 0x1d0
    xor ecx, ecx
    call TS_SCHEDULE_TASK
    mov dword [TIMER_TASK], eax
    call TS_DISPATCH
    pop edx
    pop ecx
    pop ebx
    ret
    lea eax, [dword eax + 0]
    lea edx, [byte edx + 0]
    push ebx
    push edx
    mov edx, dword [TIMER_TASK]
    test edx, edx
    je short loc_10223
    mov eax, edx
    call TS_TERMINATE
loc_10223:
    xor ebx, ebx
    mov dword [TIMER_TASK], ebx
    call TS_SHUTDOWN
    pop edx
    pop ebx
    ret
    lea eax, [dword eax + 0]
    lea edx, [dword edx + 0]
    nop
draw_game_text:
    push esi
    push edi
    push ebp
    sub esp, 8
    mov ebp, eax
    mov dword [esp], edx
    mov esi, ebx
    mov byte [esp + 4], cl
    cmp eax, 0xa0
    sete al
    mov ecx, esi
    xor ebx, ebx
    test al, al
    je near loc_102c7
loc_10265:
    mov ah, byte [esi]
    test ah, ah
    je short loc_102b9
    cmp ah, 0x20
    jne short loc_10276
    add ebx, 5
    inc esi
    jmp short loc_10265
loc_10276:
    movzx di, ah
    add edi, 0x3c0
    cmp di, 0x401
    jl short loc_102b9
    cmp di, 0x45e
    jg short loc_102b9
    cmp ah, 0x30
    jb short loc_1029d
    cmp ah, 0x39
    ja short loc_1029d
    add ebx, 8
    jmp short loc_102b6
loc_1029d:
    movsx edx, di
    movsx edx, word [nosplit edx*2 + TILE_WIDTHS]
    mov eax, edx
    sar edx, 0x1f
    db 0x2b, 0xc2    ; sub eax, edx
    sar eax, 1
    movsx ebx, bx
    add ebx, eax
loc_102b6:
    inc esi
    jmp short loc_10265
loc_102b9:
    movsx eax, bx
    mov ebp, 0xa0
    sar eax, 1
    mov esi, ecx
    sub ebp, eax
loc_102c7:
    mov ah, byte [esi]
    test ah, ah
    je near loc_10362
    cmp ah, 0x20
    jne short loc_102dc
    add ebp, 5
    inc esi
    jmp short loc_102c7
loc_102dc:
    movzx di, ah
    add edi, 0x3c0
    cmp di, 0x401
    jl near loc_10362
    cmp di, 0x45e
    jg short loc_10362
    mov eax, dword [SCREEN_HEIGHT]
    dec eax
    push eax
    mov eax, dword [SCREEN_WIDTH]
    dec eax
    push eax
    push 0
    push 0
    movsx eax, word [esp + 0x28]
    push eax
    mov edx, dword [esp + 0x14]
    xor eax, eax
    push 0
    mov al, byte [esp + 0x1c]
    mov ebx, 0x8000
    push eax
    movsx eax, di
    xor ecx, ecx
    push eax
    mov eax, ebp
    shl edx, 0x10
    shl eax, 0x10
    call ROTATE_SPRITE
    mov dh, byte [esi]
    cmp dh, 0x30
    jb short loc_10346
    cmp dh, 0x39
    ja short loc_10346
    add ebp, 8
    jmp short loc_1035c
loc_10346:
    movsx eax, di
    movsx edx, word [nosplit eax*2 + TILE_WIDTHS]
    mov eax, edx
    sar edx, 0x1f
    db 0x2b, 0xc2    ; sub eax, edx
    sar eax, 1
    add ebp, eax
loc_1035c:
    inc esi
    jmp near loc_102c7
loc_10362:
    mov eax, ebp
    add esp, 8
    pop ebp
    pop edi
    pop esi
    ret 4
    lea eax, [byte eax + 0]
    push esi
    push edi
    push ebp
    sub esp, 8
    mov ebp, eax
    mov dword [esp], edx
    mov esi, ebx
    mov byte [esp + 4], cl
    cmp eax, 0xa0
    sete dl
    xor eax, eax
    test dl, dl
    je short loc_103e5
loc_1038f:
    mov dl, byte [esi]
    test dl, dl
    je short loc_103d9
    cmp dl, 0x20
    jne short loc_103a2
    db 0x05, 0x05, 0x00, 0x00, 0x00    ; add eax, 5
    inc esi
    jmp short loc_1038f
loc_103a2:
    movzx di, dl
    add edi, 0x3c0
    cmp di, 0x401
    jl short loc_103d9
    cmp di, 0x45e
    jg short loc_103d9
    cmp dl, 0x30
    jb short loc_103cb
    cmp dl, 0x39
    ja short loc_103cb
    db 0x05, 0x08, 0x00, 0x00, 0x00    ; add eax, 8
    jmp short loc_103d6
loc_103cb:
    movsx edx, di
    add ax, word [nosplit edx*2 + TILE_WIDTHS]
loc_103d6:
    inc esi
    jmp short loc_1038f
loc_103d9:
    cwde
    mov ebp, 0xa0
    sar eax, 1
    mov esi, ebx
    sub ebp, eax
loc_103e5:
    mov al, byte [esi]
    test al, al
    je near loc_10362
    cmp al, 0x20
    jne short loc_103f9
    add ebp, 5
    inc esi
    jmp short loc_103e5
loc_103f9:
    movzx di, al
    add edi, 0x3c0
    cmp di, 0x401
    jl near loc_10362
    cmp di, 0x45e
    jg near loc_10362
    mov eax, dword [SCREEN_HEIGHT]
    dec eax
    push eax
    mov eax, dword [SCREEN_WIDTH]
    dec eax
    push eax
    push 0
    push 0
    xor eax, eax
    push 0x1a
    mov al, byte [esp + 0x2c]
    push eax
    xor eax, eax
    mov edx, dword [esp + 0x18]
    mov al, byte [esp + 0x1c]
    mov ebx, 0x10000
    push eax
    movsx eax, di
    xor ecx, ecx
    push eax
    mov eax, ebp
    shl edx, 0x10
    shl eax, 0x10
    call ROTATE_SPRITE
    mov dl, byte [esi]
    cmp dl, 0x30
    jb short loc_10468
    cmp dl, 0x39
    ja short loc_10468
    add ebp, 8
    jmp short loc_10475
loc_10468:
    movsx eax, di
    movsx eax, word [nosplit eax*2 + TILE_WIDTHS]
    add ebp, eax
loc_10475:
    inc esi
    jmp near loc_103e5
    lea eax, [byte eax + 0]
    db 0x8b, 0xc9    ; mov ecx, ecx
    push esi
    push edi
    push ebp
    sub esp, 0x10
    mov edi, eax
    mov dword [esp], edx
    mov byte [esp + 0xc], cl
    mov eax, ebx
    cmp edi, 0xa0
    sete cl
    xor edx, edx
    xor esi, esi
    test cl, cl
    je short loc_104f4
loc_104a2:
    cmp byte [eax], 0
    je short loc_104e4
    cmp si, word [esp + 0x20]
    je short loc_104e4
    mov ch, byte [eax]
    lea edi, [eax + 1]
    cmp ch, 0x20
    jne short loc_104bf
    add edx, 5
    mov eax, edi
    jmp short loc_104a2
loc_104bf:
    mov al, ch
    xor ah, ah
    add eax, 0x3c0
    cmp ax, 0x401
    jl short loc_104e4
    cmp ax, 0x45e
    jg short loc_104e4
    cwde
    inc esi
    mov cx, word [nosplit eax*2 + TILE_WIDTHS]
    mov eax, edi
    add edx, ecx
    jmp short loc_104a2
loc_104e4:
    movsx edi, dx
    mov edx, 0xa0
    sar edi, 1
    sub edx, edi
    mov eax, ebx
    mov edi, edx
loc_104f4:
    xor esi, esi
loc_104f6:
    cmp byte [eax], 0
    je near loc_105b3
    lea edx, [eax + 1]
    mov dword [esp + 8], edx
    mov dh, byte [eax]
    cmp dh, 0x20
    jne short loc_10516
    mov eax, dword [esp + 8]
    add edi, 5
    jmp short loc_104f6
loc_10516:
    mov al, dh
    xor ah, ah
    add eax, 0x3c0
    cmp ax, 0x401
    jl near loc_105b3
    cmp ax, 0x45e
    jg near loc_105b3
    mov edx, dword [esp]
    mov ecx, dword [SCREEN_WIDTH]
    mov ebx, dword [SCREEN_HEIGHT]
    mov ebp, edi
    dec ecx
    dec ebx
    shl ebp, 0x10
    shl edx, 0x10
    cmp si, word [esp + 0x20]
    jne short loc_10576
    push ebx
    push ecx
    push 0
    push 0
    push 0x1a
    xor ebx, ebx
    push 1
    mov bl, byte [esp + 0x24]
    push ebx
    cwde
    xor ecx, ecx
    push eax
    mov ebx, 0x10000
    mov eax, ebp
    call ROTATE_SPRITE
    jmp short loc_105b3
loc_10576:
    push ebx
    push ecx
    push 0
    push 0
    push 0x1a
    xor ebx, ebx
    push 0
    mov bl, byte [esp + 0x24]
    cwde
    push ebx
    mov dword [esp + 0x20], eax
    xor ecx, ecx
    push eax
    mov ebx, 0x10000
    mov eax, ebp
    call ROTATE_SPRITE
    mov eax, dword [esp + 4]
    movsx eax, word [nosplit eax*2 + TILE_WIDTHS]
    inc esi
    add edi, eax
    mov eax, dword [esp + 8]
    jmp near loc_104f6
loc_105b3:
    mov eax, edi
    add esp, 0x10
    pop ebp
    pop edi
    pop esi
    ret 4
    db 0x8b, 0xc0    ; mov eax, eax
    push esi
    push edi
    push ebp
    sub esp, 4
    mov esi, eax
    mov ebp, edx
    mov byte [esp], cl
loc_105cd:
    cmp byte [ebx], 0
    je short loc_1063a
    xor eax, eax
    mov al, byte [ebx]
    lea edi, [ebx + 1]
    call TO_UPPER
    mov byte [ebx], al
    cmp al, 0x20
    jne short loc_105eb
    add esi, 5
    mov ebx, edi
    jmp short loc_105cd
loc_105eb:
    xor eax, eax
    mov al, byte [ebx]
    mov edx, eax
    mov eax, dword [SCREEN_HEIGHT]
    dec eax
    push eax
    mov eax, dword [SCREEN_WIDTH]
    dec eax
    push eax
    push 0
    xor eax, eax
    push 0
    mov al, byte [esp + 0x24]
    push eax
    xor eax, eax
    mov al, byte [esp + 0x14]
    push eax
    xor ecx, ecx
    add edx, 0x3e0
    push 0
    movsx eax, dx
    mov ebx, 0x10000
    push eax
    mov edx, ebp
    mov eax, esi
    shl edx, 0x10
    shl eax, 0x10
    call ROTATE_SPRITE
    add esi, 4
    mov ebx, edi
    jmp short loc_105cd
loc_1063a:
    mov eax, esi
    add esp, 4
    pop ebp
    pop edi
    pop esi
    ret 4
    lea eax, [dword eax + 0]
    lea edx, [byte edx + 0]
    db 0x8b, 0xdb    ; mov ebx, ebx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov esi, eax
    mov ebp, edx
    mov byte [esp], cl
loc_1065d:
    cmp byte [ebx], 0
    je short loc_106cc
    xor eax, eax
    mov al, byte [ebx]
    lea edi, [ebx + 1]
    call TO_UPPER
    mov byte [ebx], al
    cmp al, 0x20
    jne short loc_1067b
    add esi, 5
    mov ebx, edi
    jmp short loc_1065d
loc_1067b:
    mov edx, dword [SCREEN_HEIGHT]
    dec edx
    push edx
    mov edx, dword [SCREEN_WIDTH]
    dec edx
    push edx
    push 0
    xor edx, edx
    push 0
    mov dl, byte [esp + 0x28]
    push edx
    xor edx, edx
    xor eax, eax
    mov dl, byte [esp + 0x28]
    xor ecx, ecx
    push edx
    xor edx, edx
    mov al, byte [ebx]
    mov dl, byte [esp + 0x18]
    add eax, 0xbdf
    push edx
    cwde
    mov ebx, 0x10000
    push eax
    mov edx, ebp
    mov eax, esi
    shl edx, 0x10
    shl eax, 0x10
    call ROTATE_SPRITE
    add esi, 4
    mov ebx, edi
    jmp short loc_1065d
loc_106cc:
    mov eax, esi
    add esp, 4
    pop ebp
    pop edi
    pop esi
    ret 8
    lea eax, [dword eax + 0]
    lea edx, [byte edx + 0]
    push esi
    push edi
    sub esp, 0xc
    mov esi, eax
    mov edi, edx
    mov eax, ebx
    mov ebx, 0xa
    mov edx, esp
    call LINK_ADDRESS_12
    push 0x1a
    lea ebx, [esp + 4]
    and ecx, 0xff
    mov edx, edi
    mov eax, esi
    call draw_game_text
    add esp, 0xc
    pop edi
    pop esi
    ret
    lea eax, [dword eax + 0]
    lea edx, [dword edx + 0]
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push edx
    push esi
    xor ah, ah
    xor esi, esi
    mov byte [LINK_ADDRESS_13], ah
    cmp esi, 8
    jl short loc_10738
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_10738:
    mov ecx, dword [TOTAL_CLOCK]
loc_1073e:
    lea eax, [ecx + 4]
    cmp eax, dword [TOTAL_CLOCK]
    jle short loc_10750
    call 0x10800
    jmp short loc_1073e
loc_10750:
    cmp byte [LINK_ADDRESS_14], 0
    jne short loc_10798
    mov dh, 0x7f
    movsx ecx, word [LINK_ADDRESS_15]
    mov byte [LINK_ADDRESS_16], dh
    jmp short loc_1078e
loc_1076a:
    movsx eax, word [LINK_ADDRESS_17]
    cmp ecx, eax
    je short loc_10786
    mov ebx, 1
    mov edx, LINK_ADDRESS_16
    mov eax, ecx
    call LINK_ADDRESS_18
loc_10786:
    movsx ecx, word [nosplit ecx*2 + LINK_ADDRESS_19]
loc_1078e:
    test ecx, ecx
    jge short loc_1076a
    inc esi
    cmp esi, 8
    jl short loc_10738
loc_10798:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea eax, [byte eax + 0]
    push ebx
    push ecx
    push edx
    mov ecx, eax
    mov ebx, 3
    jmp short loc_107d5
loc_107ac:
    mov eax, ebx
    shl eax, 7
    lea edx, [eax - 0x80]
    add edx, LINK_ADDRESS_20
    add eax, LINK_ADDRESS_20
    dec ebx
    call LINK_ADDRESS_21
    mov dx, word [nosplit ebx*2 + LINK_ADDRESS_22]
    mov word [nosplit ebx*2 + LINK_ADDRESS_23], dx
loc_107d5:
    test ebx, ebx
    jg short loc_107ac
    mov eax, LINK_ADDRESS_20
    mov edx, ecx
    call LINK_ADDRESS_21
    mov edx, 0xb4
    mov ah, 1
    mov word [LINK_ADDRESS_22], dx
    mov byte [LINK_ADDRESS_24], ah
    pop edx
    pop ecx
    pop ebx
    ret
    lea eax, [byte eax + 0]
