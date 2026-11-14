; Player state and per-tick actions.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x48
    mov dword [esp + 0x40], eax
    movsx ebx, ax
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov esi, 0xf1720
    add eax, eax
    add esi, eax
    mov ax, word [esi + 0x340]
    mov dword [esp + 0x34], eax
    cwde
    imul eax, eax, 0x2c
    mov edx, 0x2522b4
    add edx, eax
    mov dword [esp + 0x1c], edx
    mov dx, word [esi + 0x34c]
    lea ebp, [esi + 0x334]
    test dx, dx
    jg short loc_0077
    lea eax, [ebx*4]
    add eax, ebx
    db 0x8b, 0x04, 0x45, 0x66, 0xcc, 0x11, 0x00    ; mov eax, dword [eax*2 + 0x11cc66]
    mov dword [esp + 0x20], eax
    jmp short loc_007d
loc_0077:
    xor edx, edx
    mov dword [esp + 0x20], edx
loc_007d:
    mov ax, word [esi + 0x29e]
    mov dword [esp + 0x3c], eax
    cwde
    cmp eax, -1
    jne short loc_00aa
    mov eax, dword [esp + 0x1c]
    cmp word [eax + 0x2a], 0
    jle short loc_00a4
    cmp byte [0x125783], 0
    jne short loc_00a4
    mov eax, esi
loc_00a4:
    xor ecx, ecx
    mov dword [esp + 0x3c], ecx
loc_00aa:
    movsx edx, word [esp + 0x3c]
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + 0x2c9cd6]
    mov dword [esp + 0x30], eax
    mov eax, dword [esp + 0x1c]
    mov byte [esi + 0x3cc], 0
    mov dl, byte [eax + 0x15]
    push 0x10001
    cmp dl, 0x20
    setb al
    push 0xa3
    mov byte [esp + 0x4c], al
    lea eax, [esp + 8]
    push eax
    lea eax, [esp + 0x18]
    push eax
    lea eax, [esp + 0x14]
    push eax
    lea eax, [esp + 0x1c]
    push eax
    movsx eax, word [esp + 0x54]
    mov ebx, dword [esi + 0x21c]
    mov dword [esp + 0x28], eax
    mov edx, dword [esi + 0x218]
    mov ecx, dword [esp + 0x28]
    mov eax, dword [esi + 0x214]
    call 0x6dc73
    mov eax, dword [esp + 0x10]
    mov ebx, dword [esi + 0x218]
    mov edx, dword [esi + 0x214]
    call 0x7485f
    mov ecx, eax
    mov edi, eax
    mov ebx, dword [esi + 0x218]
    mov edx, dword [esi + 0x214]
    mov dword [esi + 0x25c], eax
    mov eax, dword [esp + 0x10]
    call 0x74781
    mov dword [esi + 0x260], eax
    mov eax, dword [esi + 0x21c]
    sub eax, ecx
    test eax, eax
    jns short loc_0166
    neg eax
loc_0166:
    mov edx, dword [esp]
    and edx, 0xc000
    mov dword [esp + 0x18], eax
    cmp edx, 0x4000
    jne short loc_0190
    cmp word [esp + 0x30], 1
    jne short loc_0190
    cmp eax, 0x3600
    jle short loc_0190
    xor ebx, ebx
    mov dword [esp + 0x30], ebx
loc_0190:
    movsx edx, word [esp + 0x34]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [esp + 0xc]
    mov dword [edx + 0x8b0cb], eax
    mov eax, dword [esp + 8]
    mov dword [edx + 0x8b0cf], eax
    mov eax, dword [esi + 0x220]
    mov dword [esi + 0x224], eax
    movsx eax, word [esi + 0x318]
    mov ebx, dword [esi + 0x280]
    mov dword [esi + 0x228], eax
    test ebx, ebx
    jne near loc_02d7
    cmp byte [esi + 0x3a8], 0
    je near loc_02d7
    cmp word [esp + 0x30], 2
    je near loc_02d7
    movsx eax, word [esp + 0x3c]
    mov dword [esp + 0x24], eax
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    test byte [eax*8 + 0x2c9cc2], 2
    je near loc_02d7
    movsx eax, word [esi + 0x298]
    add eax, 0x200
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov edx, dword [esi + 0x214]
    sar eax, 5
    add edx, eax
    mov ax, word [esi + 0x298]
    and ah, 7
    cwde
    lea ebx, [esp + 0x38]
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov ecx, dword [esi + 0x218]
    sar eax, 5
    mov dword [esp + 0x14], edx
    add ecx, eax
    mov eax, dword [esp + 0x3c]
    mov edx, ecx
    mov dword [esp + 0x38], eax
    mov eax, dword [esp + 0x14]
    call 0x6be57
    cmp word [esp + 0x38], 0
    jl short loc_02d7
    mov edx, dword [esp + 0x14]
    mov eax, dword [esp + 0x24]
    mov ebx, ecx
    call 0x7485f
    mov edx, dword [esp + 0x38]
    mov dword [esp + 0x28], eax
    sub edi, eax
    cmp dx, word [esp + 0x3c]
    je short loc_02c3
    movsx eax, dx
    mov ebx, ecx
    mov edx, dword [esp + 0x14]
    call 0x7485f
    sub eax, dword [esp + 0x28]
    test eax, eax
    jns short loc_02bc
    neg eax
loc_02bc:
    cmp eax, 0x400
    jg short loc_02d7
loc_02c3:
    mov edx, 0xa0
    mov eax, edi
    imul edx
    shrd eax, edx, 0x10
    add word [esi + 0x318], ax
loc_02d7:
    mov di, word [esi + 0x318]
    test di, di
    jle short loc_02f0
    movsx eax, di
    mov edx, eax
    sar edx, 3
    inc edx
    sub eax, edx
    jmp short loc_02ff
loc_02f0:
    jge short loc_0306
    movsx eax, di
    mov edx, eax
    neg edx
    sar edx, 3
    inc edx
    add eax, edx
loc_02ff:
    mov word [esi + 0x318], ax
loc_0306:
    mov ebx, dword [esp + 4]
    test ebx, ebx
    jl short loc_034f
    mov eax, ebx
    and eax, 0xc000
    cmp eax, 0xc000
    jne short loc_034f
    mov ecx, ebx
    and ecx, 0xfff
    mov dword [esp + 4], ecx
    imul eax, ecx, 0x2c
    cmp word [eax + 0x2522ce], 1
    jne short loc_034f
    cmp word [eax + 0x2522de], 0
    jl short loc_034f
    xor eax, eax
    mov dword [esp + 4], eax
    mov eax, dword [esi + 0x260]
    mov dword [esp + 8], eax
loc_034f:
    mov edx, dword [esp]
    test edx, edx
    jl near loc_0442
    mov eax, edx
    and eax, 0xc000
    cmp eax, 0xc000
    jne near loc_0442
    mov edi, edx
    and edi, 0xfff
    imul edi, edi, 0x2c
    mov ax, word [edi + 0x2522c0]
    xor ah, ah
    and al, 0x21
    db 0x66, 0x3d, 0x21, 0x00    ; cmp ax, 0x21
    jne short loc_03a0
    mov byte [esi + 0x3cc], 1
    xor ecx, ecx
    mov byte [esi + 0x3a4], ah
    mov dword [esp + 0x30], ecx
    jmp near loc_0442
loc_03a0:
    mov eax, 0x2522b4
    add eax, edi
    call 0x12bc0
    test ax, ax
    je near loc_0442
    cmp byte [edi + 0x2522c8], 0x18
    jbe near loc_0442
    mov eax, dword [esp + 0x1c]
    mov ebx, dword [edi + 0x2522bc]
    mov eax, dword [eax + 8]
    sub eax, ebx
    test eax, eax
    jns short loc_03d7
    neg eax
loc_03d7:
    cmp eax, 0x5400
    jge short loc_0442
    mov edx, dword [edi + 0x2522b8]
    mov ecx, dword [esi + 0x218]
    mov eax, dword [edi + 0x2522b4]
    mov edi, dword [esi + 0x214]
    sub edx, ecx
    sub eax, edi
    call 0x62b58
    lea edx, [eax + 0x200]
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [edx*2 + 0x2496b4]
    mov ebx, dword [esi + 0x24c]
    shl edx, 4
    sub ebx, edx
    and eax, 0x7ff
    mov dword [esi + 0x24c], ebx
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov ecx, dword [esi + 0x250]
    shl eax, 4
    sub ecx, eax
    mov dword [esi + 0x250], ecx
loc_0442:
    mov eax, dword [esp + 0x1c]
    cmp word [eax + 0x2a], 0
    jle short loc_0451
    mov eax, esi
    jmp short loc_0460
loc_0451:
    mov word [eax + 0x2a], 0
    mov word [esi + 0x38c], 0
loc_0460:
    mov eax, dword [esp + 0x1c]
    mov ax, word [eax + 0x2a]
    mov edi, dword [esi + 0x210]
    mov word [esi + 0x2a2], ax
    test edi, edi
    jle short loc_0484
    lea eax, [edi - 1]
    mov dword [esi + 0x210], eax
    jmp short loc_048e
loc_0484:
    mov dword [esi + 0x210], 0
loc_048e:
    mov ax, word [esi + 0x348]
    test ax, ax
    je near loc_0596
    mov edx, eax
    inc edx
    mov word [esi + 0x348], dx
    cmp dx, 0x2a
    jle near loc_0596
    cmp byte [esi + 0x3ca], 0
    je short loc_04f3
    cmp word [0x125cf5], 0
    jne short loc_04f3
    mov ax, word [0x1261e7]
    inc eax
    mov bx, word [0x125cfd]
    mov word [0x125cf5], ax
    test bx, bx
    jle near loc_054b
    cmp bx, 0xc
    jge short loc_054b
    movsx eax, bx
    dec eax
    mov dword [0x1261e7], eax
    jmp short loc_054b
loc_04f3:
    mov di, word [0x125cf5]
    test di, di
    je short loc_0517
    movsx eax, di
    xor edx, edx
    mov dword [0x1261e7], eax
    mov dword [0x1261d7], eax
    mov word [0x125cf5], dx
    jmp short loc_0555
loc_0517:
    movsx eax, word [0x125cfd]
    cmp eax, dword [0x1261e7]
    jne short loc_0535
    test di, di
    jle short loc_0535
    movsx eax, di
    mov dword [0x1261e7], eax
    jmp short loc_053b
loc_0535:
    inc dword [0x1261e7]
loc_053b:
    cmp dword [0x1261e7], 0xa
    jle short loc_054b
    xor eax, eax
    mov dword [0x1261e7], eax
loc_054b:
    mov eax, dword [0x1261e7]
    mov dword [0x1261d7], eax
loc_0555:
    mov dl, 8
    movsx ecx, word [0x2f2920]
    jmp short loc_057f
loc_0560:
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    db 0x0f, 0xbf, 0x0c, 0x4d, 0x18, 0x28, 0x2f, 0x00    ; movsx ecx, word [ecx*2 + 0x2f2818]
    db 0x88, 0x14, 0x45, 0xc2, 0x1a, 0x0f, 0x00    ; mov byte [eax*2 + 0xf1ac2], dl
loc_057f:
    test ecx, ecx
    jge short loc_0560
    mov word [esi + 0x348], 0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0596:
    mov cx, word [esi + 0x358]
    cmp cx, 1
    jle near loc_0679
    cmp word [esi + 0x2a2], 0
    jle near loc_0679
    mov eax, ecx
    dec eax
    mov word [esi + 0x358], ax
    cmp ax, 0x82
    jne short loc_05f8
    call 0x91f54
    call 0x58740
    mov cx, word [esi + 0x35a]
    test cx, cx
    jl near loc_0679
    movsx eax, cx
    call 0x57f40
    mov edx, esi
    mov eax, 0x66
    call 0x15e50
    jmp near loc_0679
loc_05f8:
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jne near loc_0679
    mov dl, 8
    movsx ecx, word [0x2f2920]
    jmp short loc_062c
loc_060d:
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    db 0x0f, 0xbf, 0x0c, 0x4d, 0x18, 0x28, 0x2f, 0x00    ; movsx ecx, word [ecx*2 + 0x2f2818]
    db 0x88, 0x14, 0x45, 0xc2, 0x1a, 0x0f, 0x00    ; mov byte [eax*2 + 0xf1ac2], dl
loc_062c:
    test ecx, ecx
    jge short loc_060d
    mov si, word [0x125cf5]
    test si, si
    je short loc_065c
    movsx eax, si
    xor edi, edi
    mov dword [0x1261e7], eax
    mov dword [0x1261d7], eax
    mov word [0x125cf5], di
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_065c:
    mov edx, dword [0x1261e7]
    inc edx
    mov dword [0x1261e7], edx
    mov dword [0x1261d7], edx
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0679:
    mov di, word [esi + 0x32c]
    test di, di
    jle short loc_06a7
    mov eax, edi
    dec ax
    mov word [esi + 0x32c], ax
    jne short loc_06a7
    mov cl, 1
    mov byte [0x12622d], cl
    mov byte [0x12622f], cl
    mov word [esi + 0x32e], ax
loc_06a7:
    mov eax, dword [esp + 0x1c]
    cmp word [eax + 0x2a], 0
    jg near loc_080d
    cmp word [esp + 0x30], 2
    jne near loc_0737
    cmp byte [esi + 0x3a3], 0
    jne short loc_06f0
    mov ebp, dword [esp + 0xc]
    mov eax, dword [esi + 0x21c]
    sub eax, ebp
    test eax, eax
    jns short loc_06dd
    neg eax
loc_06dd:
    cmp eax, 0x1300
    jle short loc_0702
    add dword [esi + 0x21c], 0x15c
    jmp short loc_0702
loc_06f0:
    mov edi, dword [eax + 8]
    mov word [eax + 0x24], 0xfea4
    sub edi, 0x200
    mov dword [eax + 8], edi
loc_0702:
    push 0x10001
    push 0x400
    push 0x400
    lea ecx, [esi + 0x29e]
    push 0xa4
    lea ebx, [esi + 0x21c]
    push 0
    lea edx, [esi + 0x218]
    push 0
    lea eax, [esi + 0x214]
    call 0x6a035
loc_0737:
    mov eax, dword [esi + 0x218]
    mov dword [esi + 0x220], 0x64
    mov dword [esi + 0x23c], eax
    mov eax, dword [esi + 0x21c]
    mov dword [esi + 0x240], eax
    mov ax, word [esi + 0x298]
    mov word [esi + 0x29a], ax
    lea ecx, [esi + 0x29e]
    mov eax, dword [esi + 0x244]
    mov edx, dword [esi + 0x218]
    mov dword [esi + 0x248], eax
    mov ebx, ecx
    mov eax, dword [esi + 0x214]
    mov word [esi + 0x318], 0
    call 0x6be57
    push 0x10001
    push 0x1400
    lea ebx, [esi + 0x21c]
    push 0x400
    lea edx, [esi + 0x218]
    push 0x80
    lea eax, [esi + 0x214]
    call 0x6baa4
    mov eax, dword [esp + 8]
    mov edx, dword [esp + 0xc]
    add eax, 0x1000
    cmp eax, edx
    jge short loc_07fc
    mov eax, dword [esp + 0x1c]
    cmp byte [eax + 0x11], 1
    je short loc_07fc
    mov ebx, dword [esi + 0x21c]
    lea eax, [edx + ebx]
    sar eax, 7
    movsx edx, word [esi + 0x382]
    add eax, edx
    and eax, 0x7ff
    mov word [esi + 0x380], ax
loc_07fc:
    mov byte [esi + 0x3a3], 0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_080d:
    mov cx, word [esi + 0x396]
    test cx, cx
    jle short loc_0838
    mov edi, ecx
    dec di
    mov word [esi + 0x396], di
    jne short loc_0838
    cmp byte [esi + 0x3a3], 0
    je short loc_0838
    mov word [esi + 0x396], 2
loc_0838:
    mov dx, word [esi + 0x396]
    test dx, dx
    jge short loc_084e
    mov ebx, edx
    inc ebx
    mov word [esi + 0x396], bx
loc_084e:
    cmp word [esi + 0x31e], 0
    jge near loc_285b
    mov edx, 4
    mov di, word [esi + 0x380]
    mov dword [esp + 0x2c], edx
    test di, di
    jle short loc_087d
    movsx eax, di
    mov edx, eax
    sar edx, 1
    inc edx
    sub eax, edx
    jmp short loc_088b
loc_087d:
    jge short loc_0892
    movsx eax, di
    mov edx, eax
    neg edx
    sar edx, 1
    inc edx
    add eax, edx
loc_088b:
    mov word [esi + 0x380], ax
loc_0892:
    movsx eax, word [esi + 0x2a0]
    mov edx, eax
    sar edx, 2
    sub eax, edx
    mov word [esi + 0x2a0], ax
    test byte [esp + 0x20], 0x40
    je short loc_08d3
    mov dx, word [esi + 0x2a0]
    mov bx, word [esi + 0x380]
    sub edx, 0x98
    add ebx, 0x18
    mov word [esi + 0x2a0], dx
    mov word [esi + 0x380], bx
loc_08d3:
    test byte [esp + 0x20], 0x80
    je short loc_08ff
    mov cx, word [esi + 0x2a0]
    mov di, word [esi + 0x380]
    add ecx, 0x98
    sub edi, 0x18
    mov word [esi + 0x2a0], cx
    mov word [esi + 0x380], di
loc_08ff:
    cmp word [esi + 0x33e], 0
    jge near loc_1a0d
    movsx edx, word [esp + 0x40]
    lea eax, [edx*4]
    add eax, edx
    db 0x8a, 0x04, 0x45, 0x60, 0xcc, 0x11, 0x00    ; mov al, byte [eax*2 + 0x11cc60]
    movsx ebx, al
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    mov edi, eax
    mov eax, dword [esp + 0x1c]
    cmp word [eax + 0x20], 0x20
    jl short loc_0951
    cmp byte [esi + 0x3a8], 0
    je short loc_0951
    mov ebx, dword [esi + 0x26c]
    cmp ebx, 0x400
    jne short loc_0988
loc_0951:
    mov eax, dword [esi + 0x270]
    and eax, 0x7ff
    cmp eax, 0x460
    jle short loc_096c
    sub dword [esi + 0x270], 0x60
    jmp short loc_098e
loc_096c:
    cmp eax, 0x3a0
    jge short loc_097c
    add dword [esi + 0x270], 0x60
    jmp short loc_098e
loc_097c:
    mov dword [esi + 0x270], 0x400
    jmp short loc_098e
loc_0988:
    mov dword [esi + 0x270], ebx
loc_098e:
    mov eax, dword [esi + 0x214]
    mov edx, dword [esi + 0x230]
    sub eax, edx
    mov edx, eax
    imul edx, eax
    mov ebx, dword [esi + 0x234]
    mov eax, dword [esi + 0x218]
    sub eax, ebx
    imul eax, eax
    add eax, edx
    mov edx, dword [esp + 0x1c]
    call 0x62c3d
    mov word [edx + 0x20], ax
    cmp byte [esi + 0x3a8], 0
    je short loc_09eb
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x2522d4]
    mov ecx, dword [esi + 0x26c]
    sar eax, 1
    add ecx, eax
    mov dword [esi + 0x26c], ecx
loc_09eb:
    cmp byte [0x125783], 0
    jne short loc_0a3d
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9ccc], 0x230
    je short loc_0a23
    mov cx, word [esi + 0x29e]
    test cx, cx
    jl short loc_0a23
    cmp cx, 0x400
    jl short loc_0a3d
loc_0a23:
    mov eax, dword [esi + 0x238]
    mov dword [esi + 0x214], eax
    mov eax, dword [esi + 0x23c]
    mov dword [esi + 0x218], eax
    jmp short loc_0a55
loc_0a3d:
    mov eax, dword [esi + 0x214]
    mov dword [esi + 0x238], eax
    mov eax, dword [esi + 0x218]
    mov dword [esi + 0x23c], eax
loc_0a55:
    mov eax, dword [esi + 0x214]
    mov dword [esi + 0x230], eax
    mov eax, dword [esi + 0x218]
    mov dword [esi + 0x234], eax
    mov eax, dword [esi + 0x21c]
    mov dword [esi + 0x240], eax
    mov eax, dword [esi + 0x244]
    mov dword [esi + 0x248], eax
    mov ax, word [esi + 0x298]
    mov dx, word [esi + 0x34a]
    mov word [esi + 0x29a], ax
    test dx, dx
    jge short loc_0ac2
    mov ebx, edx
    mov cx, word [esi + 0x298]
    add ebx, 0x80
    add ecx, 0x80
    mov word [esi + 0x34a], bx
    mov word [esi + 0x298], cx
loc_0ac2:
    mov eax, dword [esp + 0x30]
    mov ecx, 0x28
    db 0x66, 0x3d, 0x02, 0x00    ; cmp ax, 2
    jne near loc_0d00
    add word [esi + 0x390], 0x20
    and byte [esi + 0x391], 7
    movsx eax, word [esi + 0x390]
    mov word [esi + 0x324], 0
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    sar eax, 7
    mov dword [esi + 0x244], eax
    mov edi, dword [0x124249]
    test edi, edi
    jne near loc_0bd8
    mov cl, byte [esp + 0x20]
    test cl, 1
    je short loc_0b5a
    cmp dword [esi + 0x254], 0
    jle short loc_0b2f
    mov dword [esi + 0x254], 0
loc_0b2f:
    mov eax, dword [esi + 0x254]
    sub eax, 0x15c
    mov dword [esi + 0x254], eax
    cmp eax, 0xfffffa00
    jge near loc_0bd8
    mov dword [esi + 0x254], 0xfffffa00
    jmp near loc_0bd8
loc_0b5a:
    test cl, 2
    je short loc_0b94
    cmp dword [esi + 0x254], 0
    jge short loc_0b6e
    mov dword [esi + 0x254], edi
loc_0b6e:
    mov ebx, dword [esi + 0x254]
    add ebx, 0x15c
    mov dword [esi + 0x254], ebx
    cmp ebx, 0x600
    jle short loc_0bd8
    mov dword [esi + 0x254], 0x600
    jmp short loc_0bd8
loc_0b94:
    mov eax, dword [esi + 0x254]
    test eax, eax
    jge short loc_0bb4
    lea edx, [eax + 0x100]
    mov dword [esi + 0x254], edx
    test edx, edx
    jle short loc_0bb4
    mov dword [esi + 0x254], edi
loc_0bb4:
    mov ecx, dword [esi + 0x254]
    test ecx, ecx
    jle short loc_0bd8
    lea edi, [ecx - 0x100]
    mov dword [esi + 0x254], edi
    test edi, edi
    jge short loc_0bd8
    mov dword [esi + 0x254], 0
loc_0bd8:
    mov ebx, dword [esi + 0x254]
    cmp ebx, 0x800
    jle short loc_0bf0
    mov ecx, ebx
    sar ecx, 1
    mov dword [esi + 0x254], ecx
loc_0bf0:
    mov eax, dword [esi + 0x254]
    mov edi, dword [esi + 0x21c]
    add edi, eax
    mov dword [esi + 0x21c], edi
    mov eax, dword [esp + 0xc]
    sub eax, 0xf00
    cmp eax, edi
    jge short loc_0c1e
    sub eax, edi
    sar eax, 1
    lea ecx, [edi + eax]
    mov dword [esi + 0x21c], ecx
loc_0c1e:
    mov eax, dword [esp + 8]
    mov edi, dword [esi + 0x21c]
    add eax, 0x400
    cmp eax, edi
    jle short loc_0c41
    mov dword [esi + 0x254], 0
    mov dword [esi + 0x21c], eax
loc_0c41:
    cmp byte [esi + 0x3ce], 0
    je near loc_14be
    call 0x6dc5f
    and eax, 0xff
    cmp eax, 8
    jge near loc_14be
    movsx eax, word [esp + 0x34]
    mov edx, 0x295
    call 0x19680
    movsx edi, ax
    imul edi, edi, 0x2c
    mov ax, word [0x1256ca]
    xor ah, ah
    movsx edx, word [esi + 0x298]
    and al, 0x80
    add edx, 0x240
    cwde
    sub edx, eax
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [edx*2 + 0x2496b4]
    mov ebx, dword [edi + 0x2522b4]
    sar edx, 6
    add ebx, edx
    mov dword [edi + 0x2522b4], ebx
    movsx edx, word [esi + 0x298]
    add edx, 0x40
    sub edx, eax
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x55, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [edx*2 + 0x2496b4]
    mov ecx, dword [edi + 0x2522b8]
    sar eax, 6
    mov dl, 2
    add ecx, eax
    mov byte [edi + 0x2522c9], dl
    mov ah, 3
    mov dword [edi + 0x2522b8], ecx
    mov byte [edi + 0x2522c8], ah
    mov eax, dword [esi + 0x21c]
    add eax, 0x800
    mov dword [edi + 0x2522bc], eax
    jmp near loc_14be
loc_0d00:
    cmp byte [esi + 0x3cb], 0
    je near loc_0e7e
    mov byte [esi + 0x3a8], 0
    mov bx, word [esi + 0x390]
    mov word [esi + 0x324], 0
    add ebx, 0x20
    mov word [esi + 0x390], bx
    mov dh, byte [esi + 0x391]
    mov byte [esi + 0x3ed], 0
    and dh, 7
    mov byte [esi + 0x391], dh
    movsx eax, word [esi + 0x390]
    mov byte [esi + 0x3d2], 0
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    sar eax, 7
    mov bl, byte [esi + 0x3cb]
    mov dword [esi + 0x244], eax
    cmp bl, 0xb
    jae short loc_0d8f
    mov ch, bl
    xor eax, eax
    inc ch
    mov al, ch
    mov edx, dword [esi + 0x21c]
    shl eax, 7
    mov byte [esi + 0x3cb], ch
    sub edx, eax
    mov dword [esi + 0x21c], edx
    jmp short loc_0dad
loc_0d8f:
    jne short loc_0dad
    cmp dword [0x124263], 1
    jge short loc_0dad
    cmp byte [esp + 0x44], 0
    je short loc_0da8
    mov edi, 0x200
    jmp short loc_0dad
loc_0da8:
    mov edi, 0x800
loc_0dad:
    test byte [esp + 0x20], 1
    je short loc_0dcc
    mov ebx, dword [esi + 0x21c]
    mov dword [esi + 0x27c], 0x309
    sub ebx, edi
    mov dword [esi + 0x21c], ebx
loc_0dcc:
    test byte [esp + 0x20], 2
    je short loc_0deb
    mov ecx, dword [esi + 0x21c]
    mov dword [esi + 0x27c], 0x309
    add ecx, edi
    mov dword [esi + 0x21c], ecx
loc_0deb:
    cmp byte [esp + 0x44], 0
    jne short loc_0e08
    mov ecx, dword [esp + 0x30]
    test cx, cx
    je short loc_0e01
    cmp cx, 2
    jne short loc_0e08
loc_0e01:
    mov edx, 0x20
    jmp short loc_0e0d
loc_0e08:
    mov edx, 0x10
loc_0e0d:
    cmp word [esp + 0x30], 2
    je short loc_0e25
    cmp byte [esi + 0x3ce], 1
    jne short loc_0e25
    mov byte [esi + 0x3ce], 0
loc_0e25:
    mov eax, edx
    mov edx, dword [esp + 0xc]
    shl eax, 8
    sub edx, eax
    mov edi, dword [esi + 0x21c]
    mov eax, edx
    cmp edx, edi
    jge short loc_0e49
    sub eax, edi
    sar eax, 1
    lea ebx, [edi + eax]
    mov dword [esi + 0x21c], ebx
loc_0e49:
    movsx edx, word [esp + 0x34]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + 0x8b0cf]
    mov ecx, dword [esi + 0x21c]
    add eax, 0x1200
    cmp eax, ecx
    jle near loc_14be
    jmp near loc_14b8
loc_0e7e:
    cmp word [esp + 0x30], 2
    je near loc_14be
    cmp word [esi + 0x326], 0x186
    je short loc_0e9e
    mov word [esi + 0x326], 0x186
loc_0e9e:
    cmp byte [esi + 0x3ce], 1
    jne short loc_0eae
    mov byte [esi + 0x3ce], 0
loc_0eae:
    cmp word [esp + 0x30], 1
    jne near loc_0f8a
    cmp byte [esi + 0x3cc], 0
    jne near loc_0f8a
    cmp byte [esp + 0x44], 0
    jne short loc_0efc
    add word [esi + 0x390], 0x20
    and byte [esi + 0x391], 7
    movsx eax, word [esi + 0x390]
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    sar eax, 6
    mov ecx, 0x22
    mov dword [esi + 0x244], eax
    jmp short loc_0f01
loc_0efc:
    mov ecx, 0xc
loc_0f01:
    cmp byte [esp + 0x44], 0
    jne near loc_10c0
    cmp dword [esp + 0x18], 0x2600
    jg near loc_10c0
    cmp byte [esi + 0x3a8], 1
    jne near loc_10c0
    movsx eax, word [esi + 0x34e]
    cmp eax, -1
    jne short loc_0f49
    movsx eax, word [esp + 0x34]
    mov edx, 0x58c
    call 0x19680
    mov word [esi + 0x34e], ax
loc_0f49:
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    mov byte [esi + 0x3a4], 6
    cmp word [eax*8 + 0x2c9ccc], 0xc8
    jne short loc_0f75
    mov byte [esi + 0x3cf], 8
    jmp short loc_0f7c
loc_0f75:
    mov byte [esi + 0x3cf], 0
loc_0f7c:
    mov word [esi + 0x39a], 0
    jmp near loc_10c0
loc_0f8a:
    cmp byte [esi + 0x3a4], 0
    jbe near loc_10c0
    cmp byte [esi + 0x3a8], 0
    je near loc_10c0
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    test byte [eax*8 + 0x2c9cc2], 2
    jne near loc_10c0
    movsx eax, word [esp + 0x3c]
    db 0x0f, 0xbf, 0x3c, 0x45, 0xd4, 0x73, 0x2d, 0x00    ; movsx edi, word [eax*2 + 0x2d73d4]
    jmp short loc_1036
loc_0fd1:
    imul eax, edi, 0x2c
    mov dx, word [eax + 0x2522c2]
    cmp dx, 0x226
    je short loc_0ff7
    cmp dx, 0x2a0
    je short loc_0ff7
    cmp dx, 0x2a1
    je short loc_0ff7
    cmp dx, 0x2a2
    jne short loc_102e
loc_0ff7:
    imul edx, edi, 0x2c
    mov ebx, dword [esi + 0x214]
    mov eax, dword [edx + 0x2522b4]
    sub eax, ebx
    test eax, eax
    jns short loc_100e
    neg eax
loc_100e:
    cmp eax, 0x180
    jge short loc_102e
    mov eax, dword [edx + 0x2522b8]
    sub eax, dword [esi + 0x218]
    test eax, eax
    jns short loc_1027
    neg eax
loc_1027:
    cmp eax, 0x180
    jl short loc_103a
loc_102e:
    db 0x0f, 0xbf, 0x3c, 0x7d, 0xb4, 0xdf, 0x24, 0x00    ; movsx edi, word [edi*2 + 0x24dfb4]
loc_1036:
    test edi, edi
    jge short loc_0fd1
loc_103a:
    test edi, edi
    jge near loc_10c0
    dec byte [esi + 0x3a4]
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    cmp word [eax + 0x2c9cd6], 0
    jne short loc_10c0
    cmp word [eax + 0x2c9cd8], 0
    jne short loc_10c0
    call 0x6dc5f
    and eax, 3
    cmp eax, 1
    jb short loc_1089
    jbe short loc_1099
    cmp eax, 2
    je short loc_10a5
    jmp short loc_10b1
loc_1089:
    test eax, eax
    jne short loc_10b1
    movsx eax, word [esp + 0x34]
    mov edx, 0x226
    jmp short loc_10bb
loc_1099:
    movsx eax, word [esp + 0x34]
    mov edx, 0x2a0
    jmp short loc_10bb
loc_10a5:
    movsx eax, word [esp + 0x34]
    mov edx, 0x2a1
    jmp short loc_10bb
loc_10b1:
    movsx eax, word [esp + 0x34]
    mov edx, 0x2a2
loc_10bb:
    call 0x19680
loc_10c0:
    mov edx, ecx
    mov eax, dword [esp + 0xc]
    shl edx, 8
    sub eax, edx
    mov ebx, dword [esi + 0x21c]
    mov edx, eax
    cmp eax, ebx
    jle near loc_11e0
    test byte [esp + 0x20], 3
    jne short loc_111c
    cmp byte [esi + 0x3a8], 0
    je short loc_111c
    movsx ebx, word [esp + 0x3c]
    lea eax, [ebx*4]
    add eax, ebx
    test byte [eax*8 + 0x2c9cc2], 2
    je short loc_111c
    lea eax, [edx - 0x1000]
    cmp eax, dword [esi + 0x21c]
    jg short loc_111c
    mov dword [esi + 0x21c], edx
    jmp near loc_137c
loc_111c:
    mov byte [esi + 0x3a8], 0
    mov eax, dword [0x1239fc]
    mov edi, dword [esi + 0x254]
    add eax, 0x50
    add edi, eax
    mov dword [esi + 0x254], edi
    cmp edi, 0x1800
    jl short loc_114b
    mov dword [esi + 0x254], 0x1800
loc_114b:
    cmp dword [esi + 0x254], 0x960
    jle short loc_116c
    mov bh, byte [esi + 0x3d2]
    cmp bh, 0xff
    jae short loc_116c
    mov al, bh
    inc al
    mov byte [esi + 0x3d2], al
loc_116c:
    mov eax, dword [esp + 0xc]
    mov edx, dword [esi + 0x21c]
    mov ebx, dword [esi + 0x254]
    shl ecx, 8
    add edx, ebx
    sub eax, ecx
    cmp edx, eax
    jl near loc_137c
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9cd6], 1
    je near loc_137c
    mov ah, byte [esi + 0x3d2]
    cmp ah, 0x3e
    jbe short loc_11bc
    mov eax, esi
    jmp near loc_137c
loc_11bc:
    cmp ah, 9
    jbe near loc_137c
    movzx edi, ah
    call 0x6dc5f
    xor ah, ah
    and al, 3
    sub edi, eax
    mov eax, dword [esp + 0x1c]
    sub word [eax + 0x2a], di
    jmp near loc_137c
loc_11e0:
    mov edi, dword [esi + 0x39e]
    mov byte [esi + 0x3d2], 0
    test edi, edi
    jle short loc_1202
    mov eax, edi
    call 0x91f38
    mov dword [esi + 0x39e], 0
loc_1202:
    mov ebx, dword [esp + 0x30]
    cmp bx, 1
    je short loc_1231
    cmp bx, 2
    je short loc_1231
    cmp byte [esi + 0x3a8], 0
    jne short loc_1231
    mov eax, dword [esi + 0x254]
    cmp eax, 0xc00
    jle short loc_1231
    sar eax, 0xa
    mov byte [esi + 0x3ed], al
loc_1231:
    mov byte [esi + 0x3a8], 1
    cmp ecx, 0x28
    jne short loc_1291
    mov eax, dword [esp + 0xc]
    shl ecx, 8
    mov edx, dword [esi + 0x21c]
    sub eax, ecx
    sub eax, edx
    sar eax, 1
    mov edx, eax
    test eax, eax
    jns short loc_1258
    neg eax
loc_1258:
    cmp eax, 0x100
    jge short loc_1261
    xor edx, edx
loc_1261:
    mov ebx, dword [esi + 0x21c]
    mov ecx, dword [esi + 0x254]
    add ebx, edx
    sub ecx, 0x300
    mov dword [esi + 0x21c], ebx
    mov dword [esi + 0x254], ecx
    test ecx, ecx
    jge short loc_12e7
    mov dword [esi + 0x254], 0
    jmp short loc_12e7
loc_1291:
    cmp word [esi + 0x324], 0
    jne short loc_12e7
    mov eax, dword [esp + 0xc]
    shl ecx, 7
    mov edx, dword [esi + 0x21c]
    sub eax, ecx
    sub eax, edx
    sar eax, 1
    lea ebx, [edx + eax]
    mov dword [esi + 0x21c], ebx
    cmp byte [esi + 0x3a3], 0
    jne short loc_12e7
    mov eax, dword [esp + 0xc]
    mov ecx, dword [esi + 0x21c]
    sub eax, 0x1000
    cmp eax, ecx
    jge short loc_12e7
    mov edi, dword [esi + 0x254]
    mov dword [esi + 0x21c], eax
    sar edi, 1
    mov dword [esi + 0x254], edi
loc_12e7:
    mov cl, byte [esp + 0x20]
    mov byte [esi + 0x3a3], 0
    test cl, 2
    je short loc_1312
    mov eax, dword [esi + 0x21c]
    mov dword [esi + 0x27c], 0x309
    add eax, 0xb00
    mov dword [esi + 0x21c], eax
loc_1312:
    test byte [esp + 0x20], 1
    jne short loc_132b
    cmp byte [esi + 0x3a6], 1
    jne short loc_132b
    mov byte [esi + 0x3a6], 0
    jmp short loc_1364
loc_132b:
    test byte [esp + 0x20], 1
    je short loc_1364
    cmp byte [esi + 0x3a6], 0
    jne short loc_1364
    cmp word [esi + 0x324], 0
    jne short loc_1364
    mov eax, dword [esp + 0xc]
    sub eax, dword [esp + 8]
    cmp eax, 0x3800
    jle short loc_1364
    mov word [esi + 0x324], 1
    mov byte [esi + 0x3a6], 1
loc_1364:
    cmp word [esi + 0x324], 0
    je short loc_137c
    test byte [esp + 0x20], 1
    jne short loc_137c
    mov byte [esi + 0x3a6], 0
loc_137c:
    cmp word [esi + 0x324], 0
    je near loc_1454
    test byte [esp + 0x20], 1
    jne short loc_13a1
    cmp byte [esi + 0x3a6], 1
    jne short loc_13a1
    mov byte [esi + 0x3a6], 0
loc_13a1:
    mov cx, word [esi + 0x324]
    cmp cx, 0x500
    jge near loc_1441
    cmp word [esp + 0x30], 1
    jne short loc_13da
    cmp cx, 0x200
    jle short loc_13da
    mov word [esi + 0x324], 0
    mov dword [esi + 0x254], 0xfffffe00
    jmp near loc_1454
loc_13da:
    movsx eax, word [esi + 0x324]
    add eax, 0x780
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov ecx, dword [esi + 0x254]
    sar eax, 4
    sub ecx, eax
    mov dword [esi + 0x254], ecx
    mov edi, dword [0x92cc]
    cmp edi, 0x14
    jle short loc_141a
    add word [esi + 0x324], 0x19a
    jmp short loc_1438
loc_141a:
    cmp edi, 0xa
    jle short loc_142f
    add byte [esi + 0x325], 2
    mov byte [esi + 0x3a8], 0
    jmp short loc_1454
loc_142f:
    add word [esi + 0x324], 0x338
loc_1438:
    mov byte [esi + 0x3a8], 0
    jmp short loc_1454
loc_1441:
    mov word [esi + 0x324], 0
    mov dword [esi + 0x254], 0
loc_1454:
    mov eax, dword [esi + 0x254]
    mov edx, dword [esi + 0x21c]
    lea eax, [eax*4]
    add edx, eax
    mov dword [esi + 0x21c], edx
    mov eax, dword [esp + 8]
    add eax, 0x400
    cmp eax, edx
    jle short loc_14be
    mov ecx, dword [esi + 0x254]
    mov word [esi + 0x324], 0
    test ecx, ecx
    jge short loc_14a5
    mov dword [esi + 0x250], 0
    mov eax, dword [esi + 0x250]
    mov dword [esi + 0x24c], eax
loc_14a5:
    mov dword [esi + 0x254], 0x80
    mov eax, dword [esp + 8]
    add eax, 0x400
loc_14b8:
    mov dword [esi + 0x21c], eax
loc_14be:
    cmp word [esi + 0x348], 0
    jne short loc_1509
    cmp word [esi + 0x396], 2
    jg short loc_1509
    cmp byte [esi + 0x3ed], 0
    jne short loc_1509
    cmp word [esi + 0x32a], 0
    jg short loc_1509
    cmp word [esi + 0x328], 0
    jg short loc_1509
    cmp word [esi + 0x312], 0x10
    jne short loc_1520
    mov cx, word [ebp]
    cmp cx, 1
    jle short loc_1520
    cmp cx, 4
    jge short loc_1520
loc_1509:
    xor edi, edi
    mov dword [esi + 0x24c], edi
    mov dword [esp + 0x2c], edi
    mov dword [esi + 0x250], edi
    jmp near loc_15a6
loc_1520:
    movsx edx, word [esp + 0x40]
    lea eax, [edx*4]
    add eax, edx
    add eax, eax
    mov ch, byte [eax + 0x11cc60]
    test ch, ch
    je short loc_15a6
    movsx edx, ch
    mov eax, dword [esp + 0x30]
    add edx, edx
    db 0x66, 0x3d, 0x02, 0x00    ; cmp ax, 2
    jne short loc_1569
    mov eax, edx
    sar eax, 3
    mov ebx, dword [esp + 0x2c]
    sub edx, eax
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul eax, edx
    mov word [esi + 0x29c], ax
    jmp short loc_1580
loc_1569:
    mov ebx, dword [esp + 0x2c]
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul edx, eax
    mov word [esi + 0x29c], dx
loc_1580:
    mov ax, word [esi + 0x29c]
    add word [esi + 0x298], ax
    mov al, byte [esi + 0x299]
    mov dword [esi + 0x27c], 0x309
    and al, 7
    mov byte [esi + 0x299], al
loc_15a6:
    cmp byte [esi + 0x3cc], 0
    jne near loc_1705
    mov edx, dword [esp + 0x1c]
    movsx edx, word [edx + 0x18]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    movsx edi, word [eax + 0x2c9ccc]
    cmp edi, 0x1090
    je short loc_15e5
    cmp word [eax + 0x2c9cc4], 0x1090
    jne short loc_1615
loc_15e5:
    mov cx, word [esi + 0x39c]
    test cx, cx
    jle short loc_1615
    mov eax, ecx
    dec eax
    mov word [esi + 0x39c], ax
    mov dx, word [esi + 0x39c]
    mov byte [esi + 0x3c9], 7
    test dx, dx
    jg short loc_1615
    mov eax, esi
    call 0x27ab0
loc_1615:
    mov bl, byte [esi + 0x3a8]
    xor edx, edx
    test bl, bl
    je near loc_16d8
    cmp dword [esp + 0x18], 0x3600
    jg near loc_16d8
    cmp edi, 0x43a
    jb short loc_1642
    jbe short loc_16a0
    jmp near loc_16d8
loc_1642:
    cmp edi, 0xc8
    jb near loc_16d8
    jbe short loc_1680
    cmp edi, 0x35b
    jne near loc_16d8
    call 0x6dc5f
    sar eax, 8
    cmp eax, 0xdf
    jl near loc_16d8
    cmp word [esi + 0x39c], 0
    jle short loc_16d8
    mov edx, 1
    jmp short loc_16d8
loc_1680:
    call 0x6dc5f
    sar eax, 8
    cmp eax, 0xef
    jl short loc_16d8
    cmp word [esi + 0x39c], 0
    jle short loc_16d8
    mov edx, 1
    jmp short loc_16d8
loc_16a0:
    call 0x6dc5f
    sar eax, 8
    cmp eax, 0xdf
    jl short loc_16d8
    cmp word [esi + 0x39c], 0
    jle short loc_16c0
    mov edx, 1
    jmp short loc_16d8
loc_16c0:
    call 0x6dc5f
    xor ah, ah
    mov ebx, dword [esp + 0x1c]
    and al, 3
    mov cx, word [ebx + 0x2a]
    inc eax
    sub ecx, eax
    mov word [ebx + 0x2a], cx
loc_16d8:
    test edx, edx
    je short loc_1705
    mov eax, 0x4b
    mov edx, esi
    call 0x15e50
    mov dx, word [esi + 0x39c]
    sub edx, 2
    mov word [esi + 0x39c], dx
    test dx, dx
    jg short loc_1705
    mov eax, esi
    call 0x27ab0
loc_1705:
    cmp dword [esi + 0x24c], 0
    jne short loc_173f
    cmp dword [esi + 0x250], 0
    jne short loc_173f
    movsx edx, word [esp + 0x40]
    lea eax, [edx*4]
    add eax, edx
    add eax, eax
    cmp word [eax + 0x11cc62], 0
    jne short loc_173f
    cmp word [eax + 0x11cc64], 0
    je near loc_1a0d
loc_173f:
    mov eax, dword [esi + 0x26c]
    and eax, 0x7ff
    mov dword [esi + 0x27c], 0x309
    db 0x0f, 0xbf, 0x14, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [eax*2 + 0x2496b4]
    mov ecx, dword [esp + 0x18]
    sar edx, 0xc
    cmp ecx, 0x2e00
    jge near loc_182e
    cmp edx, 1
    je short loc_177d
    cmp edx, 3
    jne near loc_181a
loc_177d:
    cmp byte [esi + 0x3cc], 0
    jne near loc_182e
    cmp byte [esi + 0x3eb], 0
    jne near loc_182e
    cmp byte [esi + 0x3a8], 0
    je near loc_182e
    mov eax, dword [esp + 0x30]
    test ax, ax
    jbe short loc_17b8
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    je short loc_1808
    jmp near loc_182e
loc_17b8:
    mov edi, dword [esp]
    test edi, edi
    jl short loc_17d9
    mov eax, edi
    and eax, 0xfff
    cmp eax, 0xc000
    jne short loc_17d9
    imul eax, eax, 0x2c
    movsx edi, word [eax + 0x2522c2]
    jmp short loc_17ef
loc_17d9:
    movsx edx, word [esp + 0x3c]
    lea eax, [edx*4]
    add eax, edx
    movsx edi, word [eax*8 + 0x2c9ccc]
loc_17ef:
    cmp edi, 0x156
    jb short loc_182e
    cmp edi, 0x157
    ja short loc_182e
    mov byte [esi + 0x3eb], 1
    jmp short loc_182e
loc_1808:
    call 0x6dc5f
    test al, 1
    jne short loc_182e
    mov byte [esi + 0x3eb], 1
    jmp short loc_182e
loc_181a:
    mov bh, byte [esi + 0x3eb]
    test bh, bh
    jbe short loc_182e
    mov cl, bh
    dec cl
    mov byte [esi + 0x3eb], cl
loc_182e:
    cmp byte [esi + 0x3cb], 0
    jne short loc_1854
    mov bx, word [esi + 0x38a]
    test bx, bx
    jle short loc_1854
    cmp bx, 0x190
    jge short loc_1854
    mov eax, dword [esp + 0x2c]
    add eax, eax
    mov dword [esp + 0x2c], eax
loc_1854:
    movsx edx, word [esp + 0x40]
    lea eax, [edx*4]
    add eax, edx
    mov ebx, dword [esp + 0x2c]
    db 0x0f, 0xbf, 0x14, 0x45, 0x62, 0xcc, 0x11, 0x00    ; movsx edx, word [eax*2 + 0x11cc62]
    imul edx, ebx
    mov ecx, dword [esi + 0x24c]
    shl edx, 6
    add ecx, edx
    mov dword [esi + 0x24c], ecx
    db 0x0f, 0xbf, 0x04, 0x45, 0x64, 0xcc, 0x11, 0x00    ; movsx eax, word [eax*2 + 0x11cc64]
    imul eax, ebx
    mov edx, dword [esi + 0x250]
    shl eax, 6
    add edx, eax
    mov di, word [esi + 0x312]
    mov dword [esi + 0x250], edx
    test di, di
    jne short loc_18ba
    cmp word [ebp], 0xa
    jle short loc_18ba
    cmp byte [esi + 0x3a8], 0
    jne short loc_18ca
loc_18ba:
    cmp byte [esi + 0x3a8], 0
    je short loc_1900
    test byte [esp + 0x20], 2
    je short loc_1900
loc_18ca:
    mov ecx, 0x10
    mov edx, dword [0x8db8]
    mov eax, dword [esi + 0x24c]
    sub edx, 0x2000
    imul edx
    shrd eax, edx, cl
    mov dword [esi + 0x24c], eax
    mov edx, dword [0x8db8]
    mov eax, dword [esi + 0x250]
    sub edx, 0x2000
    jmp short loc_1966
loc_1900:
    cmp word [esp + 0x30], 2
    jne short loc_193e
    mov ecx, 0x10
    mov edx, dword [0x8db8]
    mov eax, dword [esi + 0x24c]
    sub edx, 0x1400
    imul edx
    shrd eax, edx, cl
    mov dword [esi + 0x24c], eax
    mov edx, dword [0x8db8]
    mov eax, dword [esi + 0x250]
    sub edx, 0x1400
    jmp short loc_1966
loc_193e:
    mov ecx, 0x10
    mov edx, dword [0x8db8]
    mov eax, dword [esi + 0x24c]
    imul edx
    shrd eax, edx, cl
    mov dword [esi + 0x24c], eax
    mov edx, dword [0x8db8]
    mov eax, dword [esi + 0x250]
loc_1966:
    imul edx
    shrd eax, edx, cl
    mov dword [esi + 0x250], eax
    mov eax, dword [esi + 0x24c]
    call 0x9fca9
    cmp eax, 0x800
    jge short loc_19ab
    mov eax, dword [esi + 0x250]
    call 0x9fca9
    cmp eax, 0x800
    jge short loc_19ab
    mov dword [esi + 0x250], 0
    mov eax, dword [esi + 0x250]
    mov dword [esi + 0x24c], eax
loc_19ab:
    cmp byte [esp + 0x44], 0
    je short loc_1a0d
    mov edx, dword [0x8db8]
    mov eax, dword [0x8db8]
    sar edx, 1
    sub eax, edx
    mov edx, eax
    mov eax, dword [0x8db8]
    sar eax, 2
    add edx, eax
    mov eax, dword [esi + 0x24c]
    imul edx
    shrd eax, edx, 0x10
    mov dword [esi + 0x24c], eax
    mov eax, dword [0x8db8]
    mov edx, dword [0x8db8]
    sar eax, 1
    sub edx, eax
    mov eax, edx
    mov edx, dword [0x8db8]
    sar edx, 2
    add edx, eax
    mov eax, dword [esi + 0x250]
    imul edx
    shrd eax, edx, 0x10
    mov dword [esi + 0x250], eax
loc_1a0d:
    cmp word [esp + 0x30], 1
    je short loc_1a1e
    cmp byte [esi + 0x3cc], 1
    jne short loc_1a25
loc_1a1e:
    mov ecx, 0x400
    jmp short loc_1a2a
loc_1a25:
    mov ecx, 0x1400
loc_1a2a:
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    lea ebx, [esi + 0x29e]
    mov di, word [eax*8 + 0x2c9cd6]
    mov al, byte [0x125783]
    cmp di, 2
    test al, al
    je short loc_1aa5
    mov eax, dword [esi + 0x24c]
    mov edx, dword [esi + 0x214]
    sar eax, 0xe
    add edx, eax
    mov eax, dword [esi + 0x250]
    mov ecx, dword [esi + 0x218]
    sar eax, 0xe
    add ecx, eax
    mov dword [esi + 0x214], edx
    mov edx, ecx
    mov eax, dword [esi + 0x214]
    mov dword [esi + 0x218], ecx
    call 0x6be57
    movsx eax, word [esp + 0x34]
    movsx edx, word [esi + 0x29e]
    xor edi, edi
    call 0x681b7
    jmp short loc_1ae2
loc_1aa5:
    push 0x10001
    push ecx
    push 0x400
    push 0xa4
    mov ecx, dword [esi + 0x250]
    lea eax, [esi + 0x21c]
    push ecx
    mov edi, dword [esi + 0x24c]
    lea edx, [esi + 0x218]
    push edi
    mov ecx, ebx
    lea edi, [esi + 0x214]
    mov ebx, eax
    mov eax, edi
    call 0x6a035
    mov edi, eax
loc_1ae2:
    cmp byte [esi + 0x3cb], 0
    jne short loc_1b0c
    mov eax, dword [esp + 0x30]
    db 0x66, 0x3d, 0x02, 0x00    ; cmp ax, 2
    je short loc_1b0c
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    je short loc_1b0c
    cmp byte [esp + 0x44], 0
    je short loc_1b0c
    add dword [esi + 0x21c], 0x2000
loc_1b0c:
    test edi, edi
    je short loc_1b1a
    movsx edx, di
    mov eax, esi
    call 0x53b10
loc_1b1a:
    cmp byte [esi + 0x3cb], 0
    jne near loc_1bac
    mov eax, dword [esp + 0x1c]
    cmp word [eax + 0x20], 0x10
    jle short loc_1b92
    mov eax, dword [esp + 0x30]
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    je near loc_1bac
    db 0x66, 0x3d, 0x02, 0x00    ; cmp ax, 2
    je short loc_1bac
    cmp byte [esi + 0x3a8], 0
    je short loc_1bac
    add word [esi + 0x390], 0x34
    and byte [esi + 0x391], 7
    mov edx, dword [esp + 0x1c]
    movsx eax, word [esi + 0x390]
    movsx edx, word [edx + 0x20]
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    imul eax, edx
    test eax, eax
    jns short loc_1b7e
    neg eax
loc_1b7e:
    mov edx, eax
    mov ebx, 0x63c
    sar edx, 0x1f
    idiv ebx
    mov dword [esi + 0x244], eax
    jmp short loc_1bac
loc_1b92:
    mov ecx, dword [esp + 0x30]
    cmp cx, 2
    je short loc_1bac
    cmp cx, 1
    je short loc_1bac
    mov dword [esi + 0x244], 0
loc_1bac:
    movsx eax, word [esp + 0x34]
    mov ecx, dword [esi + 0x21c]
    mov ebx, dword [esi + 0x218]
    mov edx, dword [esi + 0x214]
    add ecx, 0x2600
    call 0x67ce6
    cmp word [esp + 0x30], 3
    jge near loc_1c48
    mov eax, dword [esp + 0x1c]
    mov ax, word [eax + 0x18]
    mov cl, byte [0x125783]
    mov dword [esp + 0x3c], eax
    test cl, cl
    jne short loc_1c48
    movsx edx, ax
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    cmp word [eax + 0x2c9cd6], 0x1f
    jne short loc_1c48
    movsx edx, word [eax + 0x2c9cd8]
    imul eax, edx, 0x2c
    cmp word [eax + 0x2522d4], 0
    je short loc_1c48
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp dword [eax + 0x8b0e7], 0
    jne short loc_1c48
    mov eax, esi
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1c48:
    mov edx, dword [esp + 0x1c]
    mov ax, word [esi + 0x29e]
    cmp ax, word [edx + 0x18]
    je short loc_1c66
    movsx edx, ax
    movsx eax, word [esp + 0x34]
    call 0x681b7
loc_1c66:
    cmp byte [0x125783], 0
    jne short loc_1cc4
    push 0x10001
    lea ecx, [esi + 0x29e]
    push 0x400
    lea ebx, [esi + 0x21c]
    push 0x400
    lea edx, [esi + 0x218]
    push 0xa4
    lea eax, [esi + 0x214]
    call 0x6baa4
    test eax, eax
    jge short loc_1cc0
    movsx eax, word [esp + 0x34]
    mov edx, 8
    call 0x37350
    cmp ax, 0x200
    jge short loc_1cc0
    mov edi, 1
    jmp short loc_1cc6
loc_1cc0:
    xor edi, edi
    jmp short loc_1cc6
loc_1cc4:
    xor edi, edi
loc_1cc6:
    cmp byte [0x125783], 0
    jne near loc_1db1
    movsx ebx, word [esp + 0x34]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov edx, eax
    mov eax, dword [eax + 0x8b0cb]
    sub eax, dword [edx + 0x8b0cf]
    test eax, eax
    jns short loc_1cfe
    neg eax
loc_1cfe:
    cmp eax, 0x3000
    jl short loc_1d09
    test edi, edi
    je short loc_1d74
loc_1d09:
    mov edx, dword [esp + 0x1c]
    movsx edx, word [edx + 0x18]
    lea eax, [edx*4]
    add eax, edx
    movsx eax, word [eax*8 + 0x2c9cd6]
    test ah, 0x80
    jne short loc_1d64
    call 0x509a0
    test al, al
    jne short loc_1d52
    mov edx, dword [esp + 0x1c]
    movsx edx, word [edx + 0x18]
    lea eax, [edx*4]
    add eax, edx
    movsx eax, word [eax*8 + 0x2c9cd6]
    call 0x509c0
    test al, al
    je short loc_1d64
loc_1d52:
    mov eax, dword [esp + 0x1c]
    movsx edx, word [esp + 0x34]
    movsx eax, word [eax + 0x18]
    call 0x53650
loc_1d64:
    test edi, edi
    je short loc_1db1
    mov eax, esi
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1d74:
    mov eax, dword [esp + 0xc]
    sub eax, dword [esp + 8]
    test eax, eax
    jns short loc_1d82
    neg eax
loc_1d82:
    cmp eax, 0x2000
    jge short loc_1db1
    movsx ecx, word [esp + 0x3c]
    lea eax, [ecx*4]
    add eax, ecx
    movsx eax, word [eax*8 + 0x2c9cd6]
    call 0x509a0
    test al, al
    je short loc_1db1
    mov edx, ebx
    mov eax, ecx
    call 0x53650
loc_1db1:
    test byte [esp + 0x22], 4
    jne short loc_1dc1
    cmp byte [esi + 0x3ed], 0
    je short loc_1dc8
loc_1dc1:
    mov byte [esi + 0x3f5], 9
loc_1dc8:
    mov dh, byte [esp + 0x21]
    test dh, 0x20
    je short loc_1df1
    mov dl, byte [esp + 0x20]
    mov byte [esi + 0x3f5], 9
    test dl, 0x20
    je short loc_1de8
    add dword [esi + 0x220], 0xc
loc_1de8:
    add dword [esi + 0x220], 0xc
    jmp short loc_1e4c
loc_1df1:
    test dh, 0x40
    je short loc_1e16
    mov ah, byte [esp + 0x20]
    mov byte [esi + 0x3f5], 9
    test ah, 0x20
    je short loc_1e0d
    sub dword [esi + 0x220], 0xc
loc_1e0d:
    sub dword [esi + 0x220], 0xc
    jmp short loc_1e4c
loc_1e16:
    mov bh, byte [esp + 0x20]
    test bh, 8
    je short loc_1e34
    test bh, 0x20
    je short loc_1e2b
    add dword [esi + 0x220], 6
loc_1e2b:
    add dword [esi + 0x220], 6
    jmp short loc_1e4c
loc_1e34:
    test bh, 0x10
    je short loc_1e4c
    test bh, 0x20
    je short loc_1e45
    sub dword [esi + 0x220], 6
loc_1e45:
    sub dword [esi + 0x220], 6
loc_1e4c:
    mov dh, byte [esi + 0x3f5]
    test dh, dh
    jbe short loc_1e95
    mov bl, byte [esp + 0x21]
    test bl, 0x20
    jne short loc_1e95
    test bl, 0x40
    jne short loc_1e95
    mov eax, dword [esi + 0x220]
    mov cl, dh
    mov edx, eax
    mov ebx, 3
    sar edx, 0x1f
    idiv ebx
    dec cl
    mov byte [esi + 0x3f5], cl
    mov edx, 0x21
    mov ecx, dword [esi + 0x220]
    sub edx, eax
    add ecx, edx
    mov dword [esi + 0x220], ecx
loc_1e95:
    mov ch, byte [esi + 0x3ed]
    test ch, ch
    jbe short loc_1ec2
    mov al, ch
    dec al
    mov byte [esi + 0x3ed], al
    xor eax, eax
    mov al, byte [esi + 0x3ed]
    mov edi, dword [esi + 0x220]
    shl eax, 4
    sub edi, eax
    mov dword [esi + 0x220], edi
loc_1ec2:
    cmp dword [esi + 0x280], 0
    je short loc_1ef3
    movsx edx, word [esp + 0x40]
    lea eax, [edx*4]
    add eax, edx
    db 0x0f, 0xbe, 0x04, 0x45, 0x61, 0xcc, 0x11, 0x00    ; movsx eax, byte [eax*2 + 0x11cc61]
    mov ecx, dword [esi + 0x220]
    sar eax, 1
    add ecx, eax
    mov dword [esi + 0x220], ecx
    jmp short loc_1f2c
loc_1ef3:
    mov edx, dword [esi + 0x220]
    cmp edx, 0x5f
    jle short loc_1f0d
    cmp edx, 0x69
    jge short loc_1f0d
    mov dword [esi + 0x220], 0x64
loc_1f0d:
    movsx eax, word [esi + 0x318]
    cmp eax, -5
    jle short loc_1f2c
    cmp word [esi + 0x318], 5
    jge short loc_1f2c
    mov word [esi + 0x318], 0
loc_1f2c:
    mov edi, dword [esi + 0x220]
    cmp edi, 0x12b
    jle short loc_1f46
    mov dword [esi + 0x220], 0x12b
    jmp short loc_1f55
loc_1f46:
    cmp edi, -0x63
    jge short loc_1f55
    mov dword [esi + 0x220], 0xffffff9d
loc_1f55:
    mov ax, word [esi + 0x384]
    test ax, ax
    jle short loc_1f86
    mov edx, eax
    dec dx
    mov word [esi + 0x384], dx
    jne short loc_1f86
    mov eax, esi
    movsx edx, word [esi + 0x398]
    call 0x279d0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1f86:
    mov cx, word [esi + 0x328]
    test cx, cx
    jle near loc_21d3
    mov edi, ecx
    mov byte [esi + 0x3f5], 9
    inc edi
    mov edx, dword [esi + 0x220]
    mov word [esi + 0x328], di
    sub edx, 0x30
    mov ax, word [esi + 0x328]
    mov dword [esi + 0x220], edx
    db 0x66, 0x3d, 0x0f, 0x00    ; cmp ax, 0xf
    jle near loc_2177
    mov word [esi + 0x328], 0
    mov bx, word [esi + 0x392]
    mov byte [esi + 0x3d1], 0
    test bx, bx
    jge short loc_1fee
    mov ecx, ebx
    neg ecx
    mov word [esi + 0x392], cx
loc_1fee:
    mov di, word [esi + 0x356]
    test di, di
    jl near loc_216c
    movsx edx, di
    imul edx, edx, 0x2c
    movsx eax, word [esp + 0x34]
    imul eax, eax, 0x2c
    add edx, 0x2522b4
    add eax, 0x2522b4
    call 0x50a80
    cmp eax, 0x578
    jge near loc_216c
    movsx eax, word [esi + 0x356]
    imul eax, eax, 0x2c
    mov ebx, 7
    mov edx, 0x8ee
    movsx ecx, word [0x2f2926]
    add eax, 0x2522b4
    call 0x28d60
    mov edx, 0x4ca
    movsx eax, word [esi + 0x356]
    call 0x19680
    movsx eax, word [esi + 0x356]
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x2522c2]
    cmp ax, 0x52b
    jb short loc_20c0
    jbe near loc_20ee
    cmp ax, 0x538
    jb short loc_20ac
    jbe near loc_20ee
    cmp ax, 0xd7a
    jb short loc_20a1
    jbe near loc_20ee
    cmp ax, 0x1300
    je near loc_20ee
    jmp near loc_210c
loc_20a1:
    cmp ax, 0x573
    je short loc_20ee
    jmp near loc_210c
loc_20ac:
    cmp ax, 0x52d
    jb near loc_210c
    jbe short loc_20ee
    cmp ax, 0x536
    je short loc_20ee
    jmp short loc_210c
loc_20c0:
    cmp ax, 0x50e
    jb short loc_20e0
    jbe short loc_20ee
    cmp ax, 0x525
    jb short loc_20d8
    jbe short loc_20ee
    cmp ax, 0x529
    je short loc_20ee
    jmp short loc_210c
loc_20d8:
    cmp ax, 0x520
    je short loc_20ee
    jmp short loc_210c
loc_20e0:
    cmp ax, 0x25b
    jb short loc_210c
    jbe short loc_20ee
    cmp ax, 0x2f1
    jne short loc_210c
loc_20ee:
    movsx eax, word [esi + 0x356]
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522d6]
    test dx, dx
    je short loc_210c
    movsx eax, dx
    call 0x52360
loc_210c:
    movsx eax, word [esi + 0x356]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 0x214
    jne short loc_216c
    movsx edx, word [eax + 0x2522d6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    add eax, 0xf1720
    movsx eax, word [esi + 0x356]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x2522d6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [esp + 0x40]
    db 0x66, 0x89, 0x14, 0x45, 0xb4, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1ab4], dx
loc_216c:
    mov word [esi + 0x356], 0xffff
    jmp short loc_21d3
loc_2177:
    mov dx, word [esi + 0x356]
    test dx, dx
    jl short loc_21d3
    movsx edx, dx
    imul edx, edx, 0x2c
    mov ebx, dword [esi + 0x218]
    mov eax, dword [edx + 0x2522b8]
    sub eax, ebx
    mov ecx, dword [esi + 0x214]
    mov ebx, eax
    mov eax, dword [edx + 0x2522b4]
    mov edx, ebx
    sub eax, ecx
    call 0x62b58
    movsx edx, ax
    movsx eax, word [esi + 0x298]
    call 0x34a20
    cwde
    mov edx, eax
    sar edx, 2
    movsx eax, word [esi + 0x298]
    add eax, edx
    mov word [esi + 0x298], ax
loc_21d3:
    mov eax, esi
    call 0x483e0
    test al, al
    jne near loc_285b
    mov cx, word [esi + 0x392]
    test cx, cx
    je short loc_2232
    movsx eax, cx
    cmp eax, -9
    jne short loc_2228
    cmp word [esi + 0x314], 0
    jl short loc_2214
    mov word [esi + 0x392], 0xa
    mov word [esi + 0x314], 0xffff
    jmp short loc_2232
loc_2214:
    cmp byte [esi + 0x3d1], 0
    jne short loc_2232
    mov word [esi + 0x392], 0xa
    jmp short loc_2232
loc_2228:
    mov edi, ecx
    dec edi
    mov word [esi + 0x392], di
loc_2232:
    mov dx, word [esi + 0x312]
    cmp dx, 0xe
    je short loc_2245
    cmp dx, 0x13
    jne short loc_224d
loc_2245:
    add word [esi + 0x346], 0x40
loc_224d:
    cmp byte [esi + 0x3a7], 1
    jne short loc_2268
    test byte [esp + 0x20], 4
    jne near loc_285b
    mov byte [esi + 0x3a7], 0
loc_2268:
    mov bl, byte [esp + 0x44]
    test bl, bl
    jne near loc_285b
    cmp word [esi + 0x316], 0
    jne near loc_285b
    cmp word [esi + 0x32a], 0
    jne near loc_285b
    test bl, bl
    jne near loc_23ed
    test byte [esp + 0x20], 4
    je near loc_23ed
    cmp word [ebp], 0
    jne near loc_23ed
    cmp word [esi + 0x348], 0
    jne near loc_23ed
    movsx eax, word [esi + 0x314]
    cmp eax, -1
    jne near loc_23ed
    cmp word [esi + 0x392], 0
    je short loc_22e3
    cmp byte [esi + 0x3d1], 1
    jne near loc_23ed
loc_22e3:
    mov al, byte [esi + 0x3d1]
    mov dword [esi + 0x27c], 0x309
    cmp al, 1
    jne short loc_233d
    cmp dword [esi + 0x258], 0x1624
    jg near loc_285b
    movsx eax, word [esi + 0x392]
    cmp eax, -9
    jne near loc_285b
    mov eax, 0x4a
    mov byte [esi + 0x3d1], 0
    mov edx, esi
    mov word [esi + 0x392], 0xa
    call 0x15e50
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_233d:
    mov ax, word [esi + 0x312]
    dec eax
    db 0x66, 0x3d, 0x07, 0x00    ; cmp ax, 7
    ja near loc_285b
    and eax, 0xffff
    jmp dword cs:[eax*4 + 0x387c4]
    cmp dword [0x2e450], -0x15
    jl near loc_285b
    mov word [ebp], 1
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp dword [0x2e450], -0x15
    jl near loc_285b
    mov word [ebp], 1
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp dword [0x2e450], -0x15
    jl near loc_285b
    mov word [ebp], 1
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp dword [0x2e450], -0x15
    jl near loc_285b
    mov word [ebp], 1
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp dword [0x2e450], -0x15
    jl near loc_285b
    mov word [ebp], 1
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_23ed:
    mov di, word [ebp]
    test di, di
    je near loc_285b
    mov ax, word [esi + 0x312]
    dec eax
    db 0x66, 0x3d, 0x07, 0x00    ; cmp ax, 7
    ja near loc_285b
    and eax, 0xffff
    jmp dword cs:[eax*4 + 0x387e4]
    mov ecx, edi
    inc ecx
    mov word [ebp], cx
    cmp cx, 3
    jne short loc_248a
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl short loc_2447
    movsx eax, word [esi + 0x312]
    dec word [esi + eax*2 + 0x2ce]
loc_2447:
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl near loc_285b
    mov eax, dword [0x2d6bbc]
    add eax, 0x20
    mov edx, 0x27e
    mov dword [0x151a20], eax
    movsx eax, word [esp + 0x34]
    call 0x45b50
    mov eax, esi
    call 0x27b40
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_248a:
    cmp cx, 0xf
    jl near loc_285b
    mov word [ebp], 0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    inc edi
    mov word [ebp], di
    cmp di, 3
    jne short loc_2513
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl short loc_24d0
    movsx eax, word [esi + 0x312]
    dec word [esi + eax*2 + 0x2ce]
loc_24d0:
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl near loc_285b
    mov eax, dword [0x2d6bbc]
    add eax, 0x20
    mov edx, 0x27e
    mov dword [0x151a20], eax
    movsx eax, word [esp + 0x34]
    call 0x45b50
    mov eax, esi
    call 0x27b40
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2513:
    cmp di, 0x14
    jl near loc_285b
    mov word [ebp], 0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ebx, edi
    inc ebx
    mov word [ebp], bx
    cmp bx, 3
    jne short loc_259e
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl short loc_255b
    movsx eax, word [esi + 0x312]
    dec word [esi + eax*2 + 0x2ce]
loc_255b:
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl near loc_285b
    mov eax, dword [0x2d6bbc]
    add eax, 0x20
    mov edx, 0x27e
    mov dword [0x151a20], eax
    movsx eax, word [esp + 0x34]
    call 0x45b50
    mov eax, esi
    call 0x27b40
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_259e:
    cmp bx, 0x14
    jl near loc_285b
    mov word [ebp], 0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, edi
    inc eax
    mov word [ebp], ax
    db 0x66, 0x3d, 0x03, 0x00    ; cmp ax, 3
    jne short loc_2629
    movsx eax, word [esi + 0x312]
    add eax, eax
    add eax, esi
    mov cx, word [eax + 0x2ce]
    test cx, cx
    jl short loc_25e6
    mov edi, ecx
    dec edi
    mov word [eax + 0x2ce], di
loc_25e6:
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl near loc_285b
    mov eax, dword [0x2d6bbc]
    add eax, 0x20
    mov edx, 0x27e
    mov dword [0x151a20], eax
    movsx eax, word [esp + 0x34]
    call 0x45b50
    mov eax, esi
    call 0x27b40
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2629:
    db 0x66, 0x3d, 0x04, 0x00    ; cmp ax, 4
    jl near loc_285b
    mov word [ebp], 0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ebx, edi
    inc ebx
    mov word [ebp], bx
    cmp bx, 3
    jne short loc_26b4
    movsx eax, word [esi + 0x312]
    add eax, eax
    add eax, esi
    mov di, word [eax + 0x2ce]
    test di, di
    jl short loc_2671
    mov edx, edi
    dec edx
    mov word [eax + 0x2ce], dx
loc_2671:
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl near loc_285b
    mov eax, dword [0x2d6bbc]
    add eax, 0x20
    mov edx, 0x27e
    mov dword [0x151a20], eax
    movsx eax, word [esp + 0x34]
    call 0x45b50
    mov eax, esi
    call 0x27b40
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_26b4:
    cmp bx, 0xa
    jl near loc_285b
    mov word [ebp], 0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov ecx, edi
    inc ecx
    mov word [ebp], cx
    cmp cx, 3
    jne short loc_273f
    movsx eax, word [esi + 0x312]
    add eax, eax
    add eax, esi
    mov dx, word [eax + 0x2ce]
    test dx, dx
    jl short loc_26fc
    mov ebx, edx
    dec ebx
    mov word [eax + 0x2ce], bx
loc_26fc:
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl near loc_285b
    mov eax, dword [0x2d6bbc]
    add eax, 0x20
    mov edx, 0x27e
    mov dword [0x151a20], eax
    movsx eax, word [esp + 0x34]
    call 0x45b50
    mov eax, esi
    call 0x27b40
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_273f:
    cmp cx, 5
    jl near loc_285b
    mov word [ebp], 0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    inc edi
    mov word [ebp], di
    cmp di, 3
    jne short loc_27c8
    movsx eax, word [esi + 0x312]
    add eax, eax
    add eax, esi
    mov bx, word [eax + 0x2ce]
    test bx, bx
    jl short loc_2785
    mov ecx, ebx
    dec ecx
    mov word [eax + 0x2ce], cx
loc_2785:
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl near loc_285b
    mov eax, dword [0x2d6bbc]
    add eax, 0x20
    mov edx, 0x27e
    mov dword [0x151a20], eax
    movsx eax, word [esp + 0x34]
    call 0x45b50
    mov eax, esi
    call 0x27b40
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_27c8:
    cmp di, 0xa
    jl near loc_285b
    mov word [ebp], 0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, edi
    inc eax
    mov word [ebp], ax
    db 0x66, 0x3d, 0x03, 0x00    ; cmp ax, 3
    jne short loc_284f
    movsx eax, word [esi + 0x312]
    add eax, eax
    add eax, esi
    mov cx, word [eax + 0x2ce]
    test cx, cx
    jl short loc_2810
    mov edi, ecx
    dec edi
    mov word [eax + 0x2ce], di
loc_2810:
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl short loc_285b
    mov eax, dword [0x2d6bbc]
    add eax, 0x20
    mov edx, 0x27e
    mov dword [0x151a20], eax
    movsx eax, word [esp + 0x34]
    call 0x45b50
    mov eax, esi
    call 0x27b40
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_284f:
    db 0x66, 0x3d, 0x0a, 0x00    ; cmp ax, 0xa
    jl short loc_285b
    mov word [ebp], 0
loc_285b:
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
loc_286c:
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    mov ebx, eax
    mov eax, edx
    cmp edx, 0x2e
    jb near loc_292b
    jbe near loc_2abf
    cmp edx, 0x37
    jb short loc_28f2
    jbe near loc_2c0e
    mov edx, ebx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    add ebx, ebx
    cmp eax, 0x3c
    jb short loc_28d5
    jbe near loc_2c83
    cmp eax, 0x64
    jb short loc_28c7
    jbe near loc_2ca4
    cmp eax, 0x544
    je near loc_2cca
    jmp near loc_2ce0
loc_28c7:
    cmp eax, 0x3d
    je near loc_2c8e
    jmp near loc_2ce0
loc_28d5:
    cmp eax, 0x39
    jb near loc_2c39
    jbe near loc_2c53
    cmp eax, 0x3b
    je near loc_2c6d
    jmp near loc_2ce0
loc_28f2:
    cmp edx, 0x33
    jb short loc_2911
    jbe near loc_2b52
    cmp edx, 0x35
    jb near loc_2b86
    jbe near loc_2bba
    jmp near loc_2be4
loc_2911:
    cmp edx, 0x2f
    jbe near loc_2af0
    cmp edx, 0x31
    je near loc_2b21
    xor eax, eax
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_292b:
    cmp edx, 0x1b
    jb short loc_2975
    jbe near loc_2cbf
    cmp edx, 0x28
    jb short loc_2961
    jbe near loc_29fb
    cmp edx, 0x2a
    jb near loc_2a2c
    jbe near loc_2a5d
    cmp edx, 0x2c
    je near loc_2a8e
    xor eax, eax
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2961:
    cmp edx, 0x1d
    jb short loc_29c0
    jbe short loc_29c0
    cmp edx, 0x25
    je short loc_29ca
    xor eax, eax
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2975:
    cmp edx, 0x17
    jb short loc_2989
    jbe short loc_29a2
    cmp edx, 0x19
    jb near loc_2b47
    jbe short loc_29ac
    jmp short loc_29b6
loc_2989:
    cmp edx, 0x15
    jb near loc_2ce0
    ja near loc_2cbf
    mov eax, 5
    jmp near loc_2ce2
loc_29a2:
    mov eax, 0xc8
    jmp near loc_2ce2
loc_29ac:
    mov eax, 0x50
    jmp near loc_2ce2
loc_29b6:
    mov eax, 0x3c
    jmp near loc_2ce2
loc_29c0:
    mov eax, 0x78
    jmp near loc_2ce2
loc_29ca:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov ecx, dword [0x123a44]
    db 0x0f, 0xbf, 0x04, 0x45, 0xe8, 0x19, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf19e8]
    cmp eax, ecx
    jge near loc_2ce0
    mov eax, 0xa
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_29fb:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov ebx, dword [0x123a28]
    db 0x0f, 0xbf, 0x04, 0x45, 0xda, 0x19, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf19da]
    cmp eax, ebx
    jge near loc_2ce0
    mov eax, 0xa
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2a2c:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov edx, dword [0x123a2c]
    db 0x0f, 0xbf, 0x04, 0x45, 0xdc, 0x19, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf19dc]
    cmp eax, edx
    jge near loc_2ce0
    mov eax, 0x14
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2a5d:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov ebp, dword [0x123a3c]
    db 0x0f, 0xbf, 0x04, 0x45, 0xe4, 0x19, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf19e4]
    cmp eax, ebp
    jge near loc_2ce0
    mov eax, 0x19
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2a8e:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov edi, dword [0x123a30]
    db 0x0f, 0xbf, 0x04, 0x45, 0xde, 0x19, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf19de]
    cmp eax, edi
    jge near loc_2ce0
    mov eax, 0x32
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2abf:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov esi, dword [0x123a38]
    db 0x0f, 0xbf, 0x04, 0x45, 0xe2, 0x19, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf19e2]
    cmp eax, esi
    jge near loc_2ce0
    mov eax, 0xa
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2af0:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov ecx, dword [0x123a34]
    db 0x0f, 0xbf, 0x04, 0x45, 0xe0, 0x19, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf19e0]
    cmp eax, ecx
    jge near loc_2ce0
    mov eax, 0x1e
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2b21:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov ebx, dword [0x123a28]
    db 0x0f, 0xbf, 0x04, 0x45, 0xda, 0x19, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf19da]
    cmp eax, ebx
    jge near loc_2ce0
loc_2b47:
    mov eax, 0x19
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2b52:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522de], 0x64
    jge near loc_2ce0
    mov eax, 0xa
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2b86:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522de], 0x64
    jge near loc_2ce0
    mov eax, 0x1e
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2bba:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x66, 0x83, 0x3c, 0x45, 0x5a, 0x1a, 0x0f, 0x00, 0x64    ; cmp word [eax*2 + 0xf1a5a], 0x64
    jge near loc_2ce0
    mov eax, 0x64
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2be4:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x66, 0x83, 0x3c, 0x45, 0xac, 0x1a, 0x0f, 0x00, 0x64    ; cmp word [eax*2 + 0xf1aac], 0x64
    jge near loc_2ce0
    mov eax, 0x32
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2c0e:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x66, 0x81, 0x3c, 0x45, 0xaa, 0x1a, 0x0f, 0x00, 0x90, 0x01    ; cmp word [eax*2 + 0xf1aaa], 0x190
    jge near loc_2ce0
    mov eax, 0x1e
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2c39:
    cmp word [ebx + 0xf1aa6], 0x1900
    jge near loc_2ce0
    mov eax, 0x1e
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2c53:
    cmp word [ebx + 0xf1aa8], 0x640
    jge near loc_2ce0
    mov eax, 0x64
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2c6d:
    cmp word [ebx + 0xf1a74], 0x4b0
    jge short loc_2ce0
    mov eax, 0xa
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2c83:
    mov eax, 1
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2c8e:
    cmp word [ebx + 0xf1abc], 0xc8
    jge short loc_2ce0
    mov eax, 0x32
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2ca4:
    movsx eax, word [ebx + 0xf1a60]
    imul eax, eax, 0x2c
    mov edx, dword [0x123a44]
    movsx eax, word [eax + 0x2522de]
    cmp eax, edx
    jge short loc_2ce0
loc_2cbf:
    mov eax, 0x32
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2cca:
    cmp word [ebx + 0xf1a3c], 0x960
    jge short loc_2ce0
    mov eax, 0x1e
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2ce0:
    xor eax, eax
loc_2ce2:
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x7c
    mov dword [esp + 0x50], eax
    mov dword [esp + 0x54], edx
    mov edx, eax
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xf1720
    add eax, eax
    add edx, eax
    mov eax, dword [esp + 0x54]
    mov word [eax + 2], 0
    mov word [eax + 4], 0
    mov byte [eax], 0
    mov byte [eax + 1], 0
    mov dword [eax + 6], 0
    movsx eax, word [edx + 0x340]
    imul eax, eax, 0x2c
    mov dword [esp + 0x24], edx
    mov edx, dword [eax + 0x2522b4]
    mov dword [esp + 0x5c], edx
    mov edx, dword [eax + 0x2522b8]
    mov dword [esp + 0x60], edx
    mov edx, dword [eax + 0x2522bc]
    mov dword [esp + 0x44], edx
    movsx edx, word [eax + 0x2522d0]
    mov dword [esp + 0x20], edx
    movsx eax, word [eax + 0x2522cc]
    mov dx, word [0x2f2924]
    mov dword [esp + 0x3c], eax
    cmp dx, 2
    jl short loc_2dc7
    mov edx, dword [esp + 0x50]
    movsx eax, word [0x2f2926]
    cmp eax, edx
    jne short loc_2dc7
    mov eax, dword [0x120dbc]
    mov dword [esp + 0x5c], eax
    mov eax, dword [0x120db8]
    mov dword [esp + 0x60], eax
    mov eax, dword [0x120db4]
    add eax, 0x2600
    mov dword [esp + 0x44], eax
    movsx eax, word [0x1256ba]
    mov dword [esp + 0x20], eax
    movsx eax, word [0x1256ae]
    mov dword [esp + 0x3c], eax
loc_2dc7:
    test byte [0x2d58c0], 7
    jne short loc_2e41
    mov esi, dword [esp + 0x50]
    lea esi, [esi*4]
    mov edx, dword [esi + 0x13c090]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x2522cc]
    push eax
    mov eax, dword [esp + 0x30]
    sub eax, 0x3000
    mov ebx, dword [esp + 0x38]
    push eax
    mov ecx, dword [esp + 0x38]
    mov edx, dword [esp + 0x68]
    push ebx
    mov eax, dword [esp + 0x68]
    mov ebx, dword [esp + 0x50]
    push ecx
    mov ecx, dword [esp + 0x4c]
    sub ebx, 0x3000
    call 0x6830d
    test eax, eax
    jne short loc_2e41
    mov eax, dword [esp + 0x50]
    mov dword [esi + 0x13c090], eax
loc_2e41:
    mov edx, dword [esp + 0x50]
    lea edx, [edx*4]
    mov esi, dword [esp + 0x50]
    mov eax, dword [edx + 0x13c090]
    cmp eax, esi
    je short loc_2e79
    mov edx, eax
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0x83, 0x3c, 0x45, 0xa2, 0x1a, 0x0f, 0x00, 0x00    ; cmp word [eax*2 + 0xf1aa2], 0
    je near loc_2f69
loc_2e79:
    mov dword [esp + 0x6c], 0x7fffffff
    movsx edi, word [0x2f2920]
    jmp near loc_2f61
loc_2e8d:
    cmp edi, dword [esp + 0x50]
    je near loc_2f59
    mov eax, edi
    shl eax, 7
    sub eax, edi
    lea eax, [eax*4]
    sub eax, edi
    lea edx, [eax + eax]
    movsx eax, word [edx + 0xf1a60]
    imul eax, eax, 0x2c
    mov ecx, dword [esp + 0x60]
    mov ebx, dword [eax + 0x2522b8]
    sub ebx, ecx
    imul ebx, ebx
    mov esi, dword [esp + 0x5c]
    mov eax, dword [eax + 0x2522b4]
    sub eax, esi
    imul eax, eax
    add eax, ebx
    call 0x62c3d
    mov esi, eax
    mov ebp, eax
    movsx eax, word [edx + 0xf1a60]
    imul eax, eax, 0x2c
    mov edx, dword [eax + 0x2522b4]
    mov dword [esp + 0x30], edx
    mov edx, dword [eax + 0x2522b8]
    mov dword [esp + 0x34], edx
    mov edx, dword [eax + 0x2522bc]
    movsx eax, word [eax + 0x2522cc]
    mov dword [esp + 0x2c], edx
    push eax
    lea eax, [edx - 0x3000]
    mov ecx, dword [esp + 0x40]
    push eax
    mov eax, dword [esp + 0x3c]
    mov ebx, dword [esp + 0x4c]
    push eax
    mov edx, dword [esp + 0x3c]
    sub ebx, 0x3000
    push edx
    mov eax, dword [esp + 0x6c]
    mov edx, dword [esp + 0x70]
    call 0x6830d
    test eax, eax
    jne short loc_2f44
    db 0x8d, 0x2c, 0x75, 0x00, 0x00, 0x00, 0x00    ; lea ebp, [esi*2]
loc_2f44:
    cmp ebp, dword [esp + 0x6c]
    jge short loc_2f59
    mov eax, dword [esp + 0x50]
    mov dword [esp + 0x6c], ebp
    mov dword [eax*4 + 0x13c090], edi
loc_2f59:
    db 0x0f, 0xbf, 0x3c, 0x7d, 0x18, 0x28, 0x2f, 0x00    ; movsx edi, word [edi*2 + 0x2f2818]
loc_2f61:
    test edi, edi
    jge near loc_2e8d
loc_2f69:
    mov edx, dword [esp + 0x50]
    mov edx, dword [edx*4 + 0x13c090]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    mov edx, dword [eax + 0x2522b4]
    mov dword [esp + 0x30], edx
    mov edx, dword [eax + 0x2522b8]
    mov eax, dword [eax + 0x2522bc]
    mov dword [esp + 0x2c], eax
    mov eax, dword [esp + 0x24]
    mov cx, word [eax + 0x382]
    mov dword [esp + 0x34], edx
    test cx, cx
    je short loc_2fc5
    mov eax, dword [esp + 0x54]
    or byte [eax + 9], 0x20
loc_2fc5:
    mov eax, dword [esp + 0x24]
    cmp word [eax + 0x33a], 0
    jle short loc_2fe5
    cmp word [eax + 0x2a2], 0x64
    jge short loc_2fe5
    mov eax, dword [esp + 0x54]
    or byte [eax + 8], 1
loc_2fe5:
    movsx eax, word [0x2d6bda]
    jmp near loc_32c4
loc_2ff1:
    imul eax, ecx, 0x2c
    mov ax, word [eax + 0x2522c2]
    db 0x66, 0x3d, 0x06, 0x00    ; cmp ax, 6
    jb short loc_3039
    jbe near loc_3058
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jb short loc_302b
    jbe near loc_3058
    cmp ax, 0x66e
    jb short loc_3023
    jbe short loc_3058
    cmp ax, 0x66f
    je short loc_3051
    jmp short loc_305f
loc_3023:
    cmp ax, 0x669
    je short loc_3051
    jmp short loc_305f
loc_302b:
    db 0x66, 0x3d, 0x07, 0x00    ; cmp ax, 7
    jbe short loc_3058
    db 0x66, 0x3d, 0x08, 0x00    ; cmp ax, 8
    je short loc_3058
    jmp short loc_305f
loc_3039:
    db 0x66, 0x3d, 0x03, 0x00    ; cmp ax, 3
    jb short loc_3047
    jbe short loc_3058
    db 0x66, 0x3d, 0x04, 0x00    ; cmp ax, 4
    jmp short loc_3058
loc_3047:
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jb short loc_305f
    jbe short loc_3058
    jmp short loc_3058
loc_3051:
    mov ebp, 4
    jmp short loc_3061
loc_3058:
    mov ebp, 0x10
    jmp short loc_3061
loc_305f:
    xor ebp, ebp
loc_3061:
    test ebp, ebp
    je near loc_32b8
    imul edx, dword [esp + 0x6c], 0x2c
    mov eax, dword [edx + 0x2522b4]
    mov dword [esp + 8], eax
    mov eax, dword [edx + 0x2522b8]
    mov dword [esp + 4], eax
    mov eax, dword [edx + 0x2522bc]
    xor edx, edx
    mov dword [esp], eax
    mov dword [esp + 0x68], edx
    jmp near loc_32ad
loc_3096:
    mov esi, dword [esp]
    mov ecx, dword [esp + 0x44]
    mov ebx, dword [esp + 4]
    mov edi, dword [esp + 0x60]
    mov eax, dword [esp + 8]
    mov edx, dword [esp + 0x5c]
    sub esi, ecx
    sub ebx, edi
    sub eax, edx
    sar esi, 4
    mov ecx, ebx
    mov edx, eax
    mov edi, esi
    imul edx
    xchg ebx, eax
    db 0x87, 0xca    ; xchg edx, ecx
    imul edx
    add ebx, eax
    adc ecx, edx
    mov eax, esi
    imul edi
    add eax, ebx
    adc edx, ecx
    shrd eax, edx, 0xb
    cmp eax, 0xc00
    jge near loc_3164
    imul eax, dword [esp + 0x6c], 0x2c
    movsx edx, word [eax + 0x2522d0]
    add edx, 0x200
    mov ax, word [eax + 0x2522d0]
    and edx, 0x7ff
    and ah, 7
    mov edi, dword [esp + 8]
    cwde
    db 0x0f, 0xbf, 0x0c, 0x55, 0xb4, 0x96, 0x24, 0x00    ; movsx ecx, word [edx*2 + 0x2496b4]
    mov edx, dword [esp + 0x5c]
    db 0x0f, 0xbf, 0x34, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx esi, word [eax*2 + 0x2496b4]
    sub edx, edi
    imul edx, esi
    mov ebx, dword [esp + 4]
    mov eax, dword [esp + 0x60]
    sub eax, ebx
    imul eax, ecx
    cmp edx, eax
    jle short loc_3135
    mov edi, ebp
    neg edi
    jmp short loc_3137
loc_3135:
    mov edi, ebp
loc_3137:
    shl edi, 9
    mov edx, edi
    mov eax, esi
    imul edx
    shrd eax, edx, 0x11
    mov edx, dword [esp + 0x54]
    mov si, word [edx + 2]
    sub esi, eax
    mov eax, ecx
    mov word [edx + 2], si
    mov edx, edi
    imul edx
    shrd eax, edx, 0x11
    mov edx, dword [esp + 0x54]
    add word [edx + 4], ax
loc_3164:
    imul ecx, dword [esp + 0x6c], 0x2c
    cmp dword [esp + 0x68], 7
    jge near loc_3201
    movsx eax, word [ecx + 0x2522d0]
    add eax, 0x200
    and eax, 0x7ff
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x96, 0x24, 0x00    ; mov dx, word [eax*2 + 0x2496b4]
    mov ax, word [ecx + 0x2522d4]
    movsx edx, dx
    cwde
    imul edx
    shrd eax, edx, 0xe
    mov edx, dword [esp + 8]
    lea eax, [eax*4]
    add edx, eax
    mov ax, word [ecx + 0x2522d0]
    and ah, 7
    cwde
    mov bx, word [ecx + 0x2522d4]
    db 0x66, 0x8b, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; mov ax, word [eax*2 + 0x2496b4]
    mov dword [esp + 8], edx
    movsx edx, ax
    movsx eax, bx
    imul edx
    shrd eax, edx, 0xe
    mov ebx, dword [esp + 4]
    lea eax, [eax*4]
    add ebx, eax
    movsx eax, word [ecx + 0x2522d8]
    mov ecx, dword [esp]
    lea eax, [eax*4]
    add ecx, eax
    mov dword [esp + 4], ebx
    mov dword [esp], ecx
    jmp near loc_32a9
loc_3201:
    push 0x1000040
    lea eax, [esp + 4]
    push eax
    lea eax, [esp + 0xc]
    push eax
    lea eax, [esp + 0x14]
    push eax
    lea eax, [esp + 0x88]
    push eax
    lea eax, [esp + 0x88]
    push eax
    lea eax, [esp + 0x88]
    push eax
    movsx eax, word [ecx + 0x2522d8]
    push eax
    mov ax, word [ecx + 0x2522d0]
    and ah, 7
    cwde
    db 0x66, 0x8b, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; mov ax, word [eax*2 + 0x2496b4]
    mov bx, word [ecx + 0x2522d4]
    movsx edx, ax
    movsx eax, bx
    imul edx
    shrd eax, edx, 0xe
    push eax
    movsx eax, word [ecx + 0x2522d0]
    add eax, 0x200
    and eax, 0x7ff
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x96, 0x24, 0x00    ; mov dx, word [eax*2 + 0x2496b4]
    mov ax, word [ecx + 0x2522d4]
    movsx edx, dx
    cwde
    imul edx
    shrd eax, edx, 0xe
    push eax
    mov ebx, dword [ecx + 0x2522bc]
    mov edx, dword [ecx + 0x2522b8]
    movsx eax, word [ecx + 0x2522cc]
    mov esi, dword [ecx + 0x2522b4]
    mov ecx, eax
    mov eax, esi
    call 0x68581
loc_32a9:
    inc dword [esp + 0x68]
loc_32ad:
    cmp dword [esp + 0x68], 8
    jle near loc_3096
loc_32b8:
    mov eax, dword [esp + 0x6c]
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x240eb4]
loc_32c4:
    mov dword [esp + 0x6c], eax
    mov ecx, dword [esp + 0x6c]
    test ecx, ecx
    jge near loc_2ff1
    mov esi, dword [esp + 0x50]
    lea esi, [esi*4]
    mov edx, dword [esi + 0x13c090]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xf1aa2], 0
    jne near loc_398d
    movsx eax, word [eax + 0xf1a60]
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x2522cc]
    push eax
    mov edi, dword [esp + 0x30]
    push edi
    mov ebp, dword [esp + 0x3c]
    mov ecx, dword [esp + 0x44]
    push ebp
    mov eax, dword [esp + 0x3c]
    mov ebx, dword [esp + 0x50]
    push eax
    mov edx, dword [esp + 0x70]
    mov eax, dword [esp + 0x6c]
    call 0x6830d
    test eax, eax
    jne near loc_33f1
    mov edx, dword [esi + 0x13c090]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x2522cc]
    push eax
    lea eax, [edi - 0x1800]
    push eax
    mov ebx, dword [esp + 0x38]
    push ebp
    mov ecx, dword [esp + 0x48]
    mov edx, dword [esp + 0x6c]
    push ebx
    mov ebx, dword [esp + 0x54]
    mov eax, dword [esp + 0x6c]
    sub ebx, 0x1800
    call 0x6830d
    test eax, eax
    jne short loc_33f1
    mov edx, dword [esi + 0x13c090]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x2522cc]
    push eax
    lea eax, [edi - 0x3000]
    push eax
    mov ebx, dword [esp + 0x4c]
    mov ecx, dword [esp + 0x44]
    push ebp
    mov esi, dword [esp + 0x3c]
    sub ebx, 0x3000
    push esi
    mov edx, dword [esp + 0x70]
    mov eax, dword [esp + 0x6c]
    call 0x6830d
    test eax, eax
    je near loc_398d
loc_33f1:
    mov eax, dword [esp + 0x54]
    or byte [eax + 6], 4
    mov eax, dword [esp + 0x24]
    cmp word [eax + 0x312], 0xd
    jne short loc_3418
    call 0x9ff40
    test al, 7
    jne short loc_3418
    mov eax, dword [esp + 0x54]
    and byte [eax + 6], 0xfb
loc_3418:
    mov eax, dword [esp + 0x24]
    cmp word [eax + 0x312], 0x10
    jne short loc_3441
    call 0x9ff40
    mov edx, eax
    mov ebx, 0x11
    sar edx, 0x1f
    idiv ebx
    mov eax, dword [esp + 0x54]
    shl edx, 8
    or dword [eax + 6], edx
loc_3441:
    mov eax, dword [esp + 0x24]
    mov di, word [eax + 0x312]
    cmp di, 4
    je short loc_3480
    cmp di, 1
    je short loc_3480
    cmp di, 5
    je short loc_3480
    cmp di, 3
    je short loc_3480
    cmp di, 7
    je short loc_3480
    cmp di, 2
    je short loc_3480
    cmp di, 6
    je short loc_3480
    cmp di, 8
    jne near loc_3540
loc_3480:
    push 0x1000040
    lea eax, [esp + 4]
    push eax
    lea eax, [esp + 0xc]
    push eax
    lea eax, [esp + 0x14]
    push eax
    lea eax, [esp + 0x88]
    push eax
    lea eax, [esp + 0x88]
    mov edx, dword [esp + 0x38]
    push eax
    lea eax, [esp + 0x88]
    mov edi, dword [edx + 0x220]
    push eax
    mov eax, 0x64
    movsx edx, word [edx + 0x318]
    sub eax, edi
    sub eax, edx
    shl eax, 5
    push eax
    mov eax, dword [esp + 0x40]
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    push eax
    mov eax, dword [esp + 0x44]
    add eax, 0x200
    mov ebx, dword [esp + 0x68]
    and eax, 0x7ff
    mov ecx, dword [esp + 0x60]
    sub ebx, 0x2600
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov edx, dword [esp + 0x84]
    push eax
    mov eax, dword [esp + 0x84]
    mov ebp, dword [esp + 0x84]
    call 0x68581
    mov edx, dword [esp + 8]
    sub edx, ebp
    imul edx, edx
    mov eax, dword [esp + 4]
    sub eax, dword [esp + 0x60]
    imul eax, eax
    add eax, edx
    cmp eax, 0x640000
    jge short loc_3540
    mov eax, dword [esp + 0x54]
    and byte [eax + 6], 0xfb
loc_3540:
    mov edx, dword [esp + 0x50]
    mov edx, dword [edx*4 + 0x13c090]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x32, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a32]
    mov edx, dword [esp + 0x24]
    lea ebx, [eax*4]
    movsx edx, word [edx + 0x312]
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 4
    mov ebx, dword [ebx + eax + 0x9314]
    cmp ebx, 0x80
    jge short loc_3595
    mov ebx, 0x80
loc_3595:
    mov edx, dword [esp + 0x30]
    sub edx, dword [esp + 0x5c]
    imul edx, edx
    mov eax, dword [esp + 0x34]
    sub eax, dword [esp + 0x60]
    imul eax, eax
    add eax, edx
    call 0x62c3d
    mov ebp, eax
    test eax, eax
    jne short loc_35bd
    mov ebp, 1
loc_35bd:
    mov edx, dword [esp + 0x50]
    mov edx, dword [edx*4 + 0x13c090]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov edi, dword [esp + 0x34]
    sub eax, edx
    mov ecx, dword [esp + 0x60]
    mov esi, dword [esp + 0x30]
    db 0x8b, 0x14, 0x45, 0x70, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf1970]
    db 0x8b, 0x04, 0x45, 0x6c, 0x19, 0x0f, 0x00    ; mov eax, dword [eax*2 + 0xf196c]
    sar edx, 0xe
    sar eax, 0xe
    add edx, edi
    mov edi, dword [esp + 0x5c]
    add eax, esi
    sub edx, ecx
    sub eax, edi
    mov ecx, dword [esp + 0x2c]
    call 0x62b58
    mov dword [esp + 0x38], eax
    sub ecx, dword [esp + 0x44]
    lea edx, [ecx*8]
    mov eax, edx
    sar edx, 0x1f
    idiv ebp
    mov edx, 0x64
    sub edx, eax
    mov eax, ecx
    test eax, eax
    jns short loc_3632
    neg eax
loc_3632:
    sar eax, 4
    mov dword [esp + 0x1c], edx
    cmp ebx, eax
    jg short loc_364a
    mov eax, ecx
    test eax, eax
    jns short loc_3645
    neg eax
loc_3645:
    mov ebx, eax
    sar ebx, 4
loc_364a:
    mov edx, dword [esp + 0x50]
    mov edx, dword [edx*4 + 0x13c090]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x2522c9], 0x20
    jae short loc_3688
    mov eax, dword [esp + 0x54]
    mov dh, byte [eax + 6]
    and dh, 0xfb
    xor ebx, ebx
    mov byte [eax + 6], dh
loc_3688:
    mov edx, dword [esp + 0x50]
    mov edx, dword [edx*4 + 0x13c090]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x2522c5], 1
    jne short loc_36c6
    mov eax, dword [esp + 0x54]
    mov ch, byte [eax + 6]
    and ch, 0xfb
    xor ebx, ebx
    mov byte [eax + 6], ch
loc_36c6:
    cmp ebp, 0x100
    jge short loc_36d6
    mov eax, dword [esp + 0x54]
    or byte [eax + 8], 0x40
loc_36d6:
    mov eax, dword [esp + 0x5c]
    mov edx, dword [esp + 0x30]
    sub eax, edx
    mov dword [esp + 0x18], eax
    imul eax, ebx
    mov edx, eax
    sar edx, 0x1f
    idiv ebp
    mov edx, dword [esp + 0x30]
    mov ecx, dword [esp + 0x34]
    add edx, eax
    mov eax, dword [esp + 0x60]
    sub eax, ecx
    mov dword [esp + 0x14], eax
    imul eax, ebx
    mov dword [esp + 8], edx
    mov edx, eax
    sar edx, 0x1f
    idiv ebp
    lea edx, [ecx + eax]
    mov esi, dword [esp + 0x5c]
    mov dword [esp + 4], edx
    mov edx, dword [esp + 8]
    sub edx, esi
    mov eax, edx
    shl eax, 0xb
    sub eax, edx
    mov edx, eax
    sar edx, 0x1f
    idiv ebp
    mov edx, eax
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 2]
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 2], ax
    mov edi, dword [esp + 0x60]
    mov edx, dword [esp + 4]
    sub edx, edi
    mov eax, edx
    shl eax, 0xb
    sub eax, edx
    mov edx, eax
    sar edx, 0x1f
    idiv ebp
    mov edx, eax
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 4]
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 4], ax
    test ebx, ebx
    je near loc_38d6
    mov edx, dword [esp + 0x50]
    mov eax, edx
    shl eax, 4
    sub eax, edx
    shl eax, 5
    add eax, edx
    lea eax, [eax*4]
    mov edx, eax
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x2d6bbc]
    add edx, eax
    mov eax, edx
    shl eax, 6
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x3c, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx edi, word [eax*2 + 0x2496b4]
    mov eax, edx
    shl eax, 5
    add eax, 0x212a0
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    add edi, eax
    mov eax, edx
    shl eax, 4
    add eax, 0x1a590
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov dword [esp + 0x6c], edx
    add edi, eax
    lea eax, [edx*8]
    add eax, 0x1ea28
    and eax, 0x7ff
    mov edx, dword [esp + 0x50]
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov edx, dword [edx*4 + 0x13c090]
    add edi, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x2522d0]
    mov ax, word [eax + 0x2522d0]
    and ah, 7
    cwde
    mov ebp, dword [esp + 0x18]
    db 0x0f, 0xbf, 0x34, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx esi, word [eax*2 + 0x2496b4]
    imul esi, ebp
    add edx, 0x200
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x0c, 0x55, 0xb4, 0x96, 0x24, 0x00    ; movsx ecx, word [edx*2 + 0x2496b4]
    imul ecx, dword [esp + 0x14]
    cmp esi, ecx
    jle short loc_3870
    add edi, 0x2000
    jmp short loc_3876
loc_3870:
    sub edi, 0x2000
loc_3876:
    mov edx, dword [esp + 0x38]
    add edx, 0x400
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [edx*2 + 0x2496b4]
    imul edx, edi
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 2]
    sar edx, 0x11
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 2], ax
    mov edx, dword [esp + 0x38]
    add edx, 0x200
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [edx*2 + 0x2496b4]
    imul edx, edi
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 4]
    sar edx, 0x11
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 4], ax
loc_38d6:
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x20]
    add eax, 0x400
    sub eax, edx
    and eax, 0x7ff
    sub eax, 0x400
    sar eax, 1
    cmp eax, -0x7f
    jg short loc_38fb
    mov eax, 0xffffff81
loc_38fb:
    cmp eax, 0x7f
    jge short loc_3927
    mov eax, dword [esp + 0x38]
    mov ebx, dword [esp + 0x20]
    add eax, 0x400
    sub eax, ebx
    and eax, 0x7ff
    sub eax, 0x400
    sar eax, 1
    cmp eax, -0x7f
    jg short loc_392c
    mov eax, 0xffffff81
    jmp short loc_392c
loc_3927:
    mov eax, 0x7f
loc_392c:
    mov edx, dword [esp + 0x54]
    mov byte [edx], al
    mov edx, dword [esp + 0x24]
    mov eax, dword [esp + 0x1c]
    sub eax, dword [edx + 0x220]
    sar eax, 1
    cmp eax, -0x7f
    jg short loc_394c
    mov eax, 0xffffff81
loc_394c:
    cmp eax, 0x7f
    jge short loc_396d
    mov edx, dword [esp + 0x24]
    mov eax, dword [esp + 0x1c]
    sub eax, dword [edx + 0x220]
    sar eax, 1
    cmp eax, -0x7f
    jg short loc_3972
    mov eax, 0xffffff81
    jmp short loc_3972
loc_396d:
    mov eax, 0x7f
loc_3972:
    mov edx, dword [esp + 0x54]
    mov byte [edx + 1], al
    mov eax, edx
    mov dh, byte [edx + 8]
    or dh, 0x80
    mov byte [eax + 8], dh
    add esp, 0x7c
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_398d:
    mov eax, dword [esp + 0x50]
    lea eax, [eax*4]
    mov edi, 0xffffffff
    mov dword [eax + 0x13c050], edi
    test edi, edi
    jge near loc_4222
    mov edx, dword [esp + 0x24]
    mov dword [eax + 0x13d210], edi
    movsx edx, word [edx + 0x340]
    imul edx, edx, 0x2c
    movsx edx, word [edx + 0x2522cc]
    mov dword [esp + 0x28], edx
    mov edx, dword [eax + 0x13c090]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    mov ecx, 0x80
    movsx eax, word [eax + 0x2522cc]
    mov edi, 0x13bfd0
    mov dword [esp + 0x40], eax
    xor eax, eax
    mov dl, 1
    cmp ecx, 4
    jae short loc_3a16
    test cl, 1
    je short loc_3a0f
    db 0xaa    ; stosb byte es:[edi], al
loc_3a0f:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_3a41
loc_3a16:
    test edi, 1
    je short loc_3a20
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_3a20:
    test edi, 2
    je short loc_3a2d
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_3a2d:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_3a3b
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_3a3b:
    test bl, 1
    je short loc_3a41
    db 0xaa    ; stosb byte es:[edi], al
loc_3a41:
    mov eax, dword [esp + 0x28]
    mov ebx, 0xffffffff
    mov cl, byte [esp + 0x28]
    mov word [0x13ca10], ax
    mov word [0x13c0d0], bx
    mov eax, dword [esp + 0x28]
    and cl, 7
    sar eax, 3
    shl dl, cl
    mov bl, byte [eax + 0x13bfd0]
    or bl, dl
    mov ecx, 1
    mov byte [eax + 0x13bfd0], bl
    xor ebx, ebx
    mov dword [esp + 0x64], ecx
    mov dword [esp + 0x4c], ebx
    jmp near loc_4214
loc_3a89:
    db 0x0f, 0xbf, 0x14, 0x45, 0x10, 0xca, 0x13, 0x00    ; movsx edx, word [eax*2 + 0x13ca10]
    lea eax, [edx*4]
    add eax, edx
    movsx ecx, word [eax*8 + 0x2c9cb4]
    movsx eax, word [eax*8 + 0x2c9cb6]
    lea edx, [ecx + eax]
    mov ebp, 0x27e4b4
    mov edi, ecx
    shl ecx, 5
    mov dword [esp + 0x58], edx
    add ebp, ecx
    jmp near loc_3f21
loc_3ac2:
    movsx eax, word [ebp + 0xc]
    mov dword [esp + 0x6c], eax
    test eax, eax
    jl near loc_3f1d
    movsx edx, word [ebp + 8]
    mov ebx, dword [ebp]
    shl edx, 5
    mov esi, dword [ebp + 4]
    mov ecx, dword [edx + 0x27e4b4]
    mov eax, dword [edx + 0x27e4b8]
    add ecx, ebx
    add esi, eax
    mov eax, dword [esp + 0x6c]
    sar esi, 1
    sar ecx, 1
    mov ebx, esi
    mov edx, ecx
    call 0x7485f
    mov dword [esp + 0xc], eax
    mov ebx, esi
    mov edx, ecx
    mov eax, dword [esp + 0x6c]
    call 0x74781
    mov edx, dword [esp + 0xc]
    sub edx, 0x1c00
    cmp eax, edx
    jle short loc_3b4e
    mov edx, dword [esp + 0x6c]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov dx, word [eax + 0x2c9cd6]
    cmp dx, 0xf
    jl near loc_3f1d
    cmp dx, 0x16
    jg near loc_3f1d
loc_3b4e:
    mov eax, dword [esp + 0x4c]
    mov ebx, esi
    mov edx, ecx
    db 0x0f, 0xbf, 0x04, 0x45, 0x10, 0xca, 0x13, 0x00    ; movsx eax, word [eax*2 + 0x13ca10]
    call 0x7485f
    mov dword [esp + 0xc], eax
    mov ebx, esi
    mov edx, ecx
    mov eax, dword [esp + 0x6c]
    call 0x7485f
    mov edx, dword [esp + 0xc]
    sub edx, 0x4800
    cmp eax, edx
    jl near loc_3f1d
    mov eax, dword [esp + 0x6c]
    mov ecx, dword [esp + 0x6c]
    mov edx, 1
    xor ebx, ebx
    sar eax, 3
    and ecx, 7
    mov bl, byte [eax + 0x13bfd0]
    shl edx, cl
    test ebx, edx
    jne near loc_3f1d
    mov cl, byte [esp + 0x6c]
    mov dl, 1
    and cl, 7
    shl dl, cl
    or bl, dl
    mov byte [eax + 0x13bfd0], bl
    mov eax, dword [esp + 0x64]
    mov edx, dword [esp + 0x6c]
    db 0x66, 0x89, 0x14, 0x45, 0x10, 0xca, 0x13, 0x00    ; mov word [eax*2 + 0x13ca10], dx
    inc eax
    mov edx, dword [esp + 0x4c]
    mov dword [esp + 0x64], eax
    db 0x66, 0x89, 0x14, 0x45, 0xce, 0xc0, 0x13, 0x00    ; mov word [eax*2 + 0x13c0ce], dx
    mov eax, dword [esp + 0x6c]
    mov edx, dword [esp + 0x40]
    cmp eax, edx
    jne near loc_3f1d
    mov ecx, 0x80
    mov edi, 0x13bfd0
    xor eax, edx
    mov ebp, dword [esp + 0x64]
    cmp ecx, 4
    jae short loc_3c11
    test cl, 1
    je short loc_3c0a
    db 0xaa    ; stosb byte es:[edi], al
loc_3c0a:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_3c3c
loc_3c11:
    test edi, 1
    je short loc_3c1b
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_3c1b:
    test edi, 2
    je short loc_3c28
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_3c28:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_3c36
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_3c36:
    test bl, 1
    je short loc_3c3c
    db 0xaa    ; stosb byte es:[edi], al
loc_3c3c:
    dec ebp
    test ebp, ebp
    jge short loc_3c48
    mov ebp, dword [esp + 0x64]
    dec ebp
    jmp short loc_3c98
loc_3c48:
    mov dl, 1
    db 0x0f, 0xbf, 0x04, 0x6d, 0x10, 0xca, 0x13, 0x00    ; movsx eax, word [ebp*2 + 0x13ca10]
    db 0x8a, 0x0c, 0x6d, 0x10, 0xca, 0x13, 0x00    ; mov cl, byte [ebp*2 + 0x13ca10]
    sar eax, 3
    and cl, 7
    mov bh, byte [eax + 0x13bfd0]
    shl dl, cl
    or bh, dl
    db 0x0f, 0xbf, 0x2c, 0x6d, 0xd0, 0xc0, 0x13, 0x00    ; movsx ebp, word [ebp*2 + 0x13c0d0]
    mov byte [eax + 0x13bfd0], bh
    test ebp, ebp
    jge short loc_3c48
    mov ebp, dword [esp + 0x64]
    dec ebp
    jmp short loc_3c98
loc_3c82:
    db 0x8d, 0x04, 0x6d, 0x00, 0x00, 0x00, 0x00    ; lea eax, [ebp*2]
    mov cx, word [eax + 0x13c0d0]
    test cx, cx
    je short loc_3c9c
    movsx ebp, cx
loc_3c98:
    test ebp, ebp
    jge short loc_3c82
loc_3c9c:
    mov eax, dword [esp + 0x50]
    db 0x0f, 0xbf, 0x14, 0x6d, 0x10, 0xca, 0x13, 0x00    ; movsx edx, word [ebp*2 + 0x13ca10]
    mov dword [eax*4 + 0x13c050], edx
    lea eax, [edx*4]
    add eax, edx
    xor ebx, ebx
    movsx ecx, word [eax*8 + 0x2c9cb4]
    movsx eax, word [eax*8 + 0x2c9cb6]
    mov dword [esp + 4], ebx
    lea edx, [ecx + eax]
    mov dword [esp + 8], ebx
    mov dword [esp + 0x58], edx
    mov edi, ecx
    mov ebp, dword [esp + 0x58]
    jmp short loc_3d07
loc_3ce1:
    mov edx, edi
    shl edx, 5
    mov ebx, dword [esp + 8]
    mov eax, dword [edx + 0x27e4b4]
    mov esi, dword [esp + 4]
    add ebx, eax
    mov eax, dword [edx + 0x27e4b8]
    inc edi
    add esi, eax
    mov dword [esp + 8], ebx
    mov dword [esp + 4], esi
loc_3d07:
    cmp edi, ebp
    jl short loc_3ce1
    mov eax, dword [esp + 8]
    mov ebx, ebp
    mov edx, eax
    sub ebx, ecx
    sar edx, 0x1f
    idiv ebx
    mov dword [esp + 8], eax
    mov eax, dword [esp + 4]
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov edx, dword [esp + 0x28]
    mov dword [esp + 4], eax
    lea eax, [edx*4]
    add eax, edx
    movsx ecx, word [eax*8 + 0x2c9cb4]
    movsx eax, word [eax*8 + 0x2c9cb6]
    lea edx, [ecx + eax]
    mov dword [esp + 0x58], edx
    mov ebp, ecx
    xor eax, eax
    mov edi, ecx
    mov dword [esp + 0x68], eax
    jmp near loc_3e3f
loc_3d60:
    mov eax, edi
    mov edx, dword [esp + 0x50]
    shl eax, 5
    mov ecx, dword [edx*4 + 0x13c050]
    movsx ebx, word [eax + 0x27e4c0]
    cmp ebx, ecx
    jne near loc_3e3e
    movsx edx, word [eax + 0x27e4bc]
    shl edx, 5
    mov esi, dword [eax + 0x27e4b4]
    mov ecx, dword [edx + 0x27e4b4]
    mov ebx, dword [eax + 0x27e4b8]
    sub ecx, esi
    mov esi, dword [edx + 0x27e4b8]
    sub esi, ebx
    sub ebx, dword [esp + 0x60]
    mov dword [esp + 0xc], ebx
    mov ebx, dword [esp + 8]
    sub ebx, dword [esp + 0x5c]
    mov dword [esp + 0x48], ebx
    imul ebx, dword [esp + 0xc]
    mov eax, dword [eax + 0x27e4b4]
    mov dword [esp + 0xc], ebx
    sub eax, dword [esp + 0x5c]
    mov ebx, dword [esp + 0x60]
    mov dword [esp + 0x10], eax
    mov eax, dword [esp + 4]
    sub eax, ebx
    mov ebx, dword [esp + 0x10]
    imul ebx, eax
    mov dword [esp + 0x10], ebx
    mov ebx, dword [esp + 0xc]
    cmp ebx, dword [esp + 0x10]
    jg short loc_3e21
    mov ebx, dword [edx + 0x27e4b8]
    sub ebx, dword [esp + 0x60]
    mov dword [esp + 0x10], ebx
    mov ebx, dword [esp + 0x48]
    imul ebx, dword [esp + 0x10]
    mov edx, dword [edx + 0x27e4b4]
    mov dword [esp + 0x10], ebx
    sub edx, dword [esp + 0x5c]
    imul eax, edx
    cmp eax, dword [esp + 0x10]
    jg short loc_3e21
    mov ebp, edi
    jmp short loc_3e49
loc_3e21:
    imul esi, esi
    mov eax, ecx
    imul eax, ecx
    add eax, esi
    mov ebx, dword [esp + 0x68]
    call 0x62c3d
    cmp eax, ebx
    jle short loc_3e3e
    mov dword [esp + 0x68], eax
    mov ebp, edi
loc_3e3e:
    inc edi
loc_3e3f:
    cmp edi, dword [esp + 0x58]
    jl near loc_3d60
loc_3e49:
    mov ebx, dword [esp + 0x50]
    mov dword [ebx*4 + 0x13d210], ebp
    shl ebp, 5
    movsx ecx, word [ebp + 0x27e4bc]
    mov esi, dword [ebp + 0x27e4b8]
    shl ecx, 5
    mov edi, dword [ebp + 0x27e4b4]
    mov edx, dword [ecx + 0x27e4b8]
    mov eax, dword [ecx + 0x27e4b4]
    sub edx, esi
    sub eax, edi
    call 0x62b58
    add eax, 0x600
    movsx edx, word [ebp + 0x27e4bc]
    and eax, 0x7ff
    shl edx, 5
    mov dword [esp + 0x38], eax
    mov ecx, dword [edx + 0x27e4b4]
    add ecx, dword [ebp + 0x27e4b4]
    mov eax, dword [esp + 0x38]
    add eax, 0x200
    and eax, 0x7ff
    mov esi, dword [edx + 0x27e4b8]
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    sar ecx, 1
    sar eax, 8
    mov edx, dword [esp + 0x38]
    add eax, ecx
    and edx, 0x7ff
    mov dword [ebx*4 + 0x13c950], eax
    mov eax, dword [ebp + 0x27e4b8]
    db 0x0f, 0xbf, 0x14, 0x55, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [edx*2 + 0x2496b4]
    add eax, esi
    sar edx, 8
    sar eax, 1
    add eax, edx
    mov edx, dword [ebx*4 + 0x13c050]
    mov dword [ebx*4 + 0x13c910], eax
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + 0x2c9cbc]
    sub eax, 0x2000
    mov dword [ebx*4 + 0x13c990], eax
    jmp short loc_3f2b
loc_3f1d:
    inc edi
    add ebp, 0x20
loc_3f21:
    cmp edi, dword [esp + 0x58]
    jl near loc_3ac2
loc_3f2b:
    mov eax, dword [esp + 0x4c]
    db 0x0f, 0xbf, 0x04, 0x45, 0x10, 0xca, 0x13, 0x00    ; movsx eax, word [eax*2 + 0x13ca10]
    db 0x0f, 0xbf, 0x3c, 0x45, 0xd4, 0x73, 0x2d, 0x00    ; movsx edi, word [eax*2 + 0x2d73d4]
    jmp near loc_41fa
loc_3f44:
    imul eax, edi, 0x2c
    cmp word [eax + 0x2522da], 7
    jne near loc_41f2
    movsx eax, word [eax + 0x2522d2]
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x2522cc]
    mov ebx, 1
    mov dword [esp + 0x6c], eax
    xor edx, edx
    mov ecx, dword [esp + 0x6c]
    sar eax, 3
    and ecx, 7
    mov dl, byte [eax + 0x13bfd0]
    shl ebx, cl
    test edx, ebx
    jne near loc_41f2
    mov cl, byte [esp + 0x6c]
    mov dl, 1
    and cl, 7
    shl dl, cl
    or byte [eax + 0x13bfd0], dl
    mov eax, dword [esp + 0x64]
    mov edx, dword [esp + 0x6c]
    db 0x66, 0x89, 0x14, 0x45, 0x10, 0xca, 0x13, 0x00    ; mov word [eax*2 + 0x13ca10], dx
    mov edx, dword [esp + 0x4c]
    lea ebp, [eax + 1]
    db 0x66, 0x89, 0x14, 0x45, 0xd0, 0xc0, 0x13, 0x00    ; mov word [eax*2 + 0x13c0d0], dx
    mov eax, dword [esp + 0x6c]
    mov edx, dword [esp + 0x40]
    mov dword [esp + 0x64], ebp
    cmp eax, edx
    jne near loc_41f2
    mov ecx, 0x80
    mov edi, 0x13bfd0
    xor eax, edx
    cmp ecx, 4
    jae short loc_3fed
    test cl, 1
    je short loc_3fe6
    db 0xaa    ; stosb byte es:[edi], al
loc_3fe6:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_4018
loc_3fed:
    test edi, 1
    je short loc_3ff7
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_3ff7:
    test edi, 2
    je short loc_4004
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_4004:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_4012
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_4012:
    test bl, 1
    je short loc_4018
    db 0xaa    ; stosb byte es:[edi], al
loc_4018:
    dec ebp
    test ebp, ebp
    jge short loc_4024
    mov ebp, dword [esp + 0x64]
    dec ebp
    jmp short loc_4074
loc_4024:
    mov dl, 1
    db 0x8a, 0x0c, 0x6d, 0x10, 0xca, 0x13, 0x00    ; mov cl, byte [ebp*2 + 0x13ca10]
    db 0x0f, 0xbf, 0x04, 0x6d, 0x10, 0xca, 0x13, 0x00    ; movsx eax, word [ebp*2 + 0x13ca10]
    and cl, 7
    sar eax, 3
    shl dl, cl
    mov ch, byte [eax + 0x13bfd0]
    or ch, dl
    db 0x0f, 0xbf, 0x2c, 0x6d, 0xd0, 0xc0, 0x13, 0x00    ; movsx ebp, word [ebp*2 + 0x13c0d0]
    mov byte [eax + 0x13bfd0], ch
    test ebp, ebp
    jge short loc_4024
    mov ebp, dword [esp + 0x64]
    dec ebp
    jmp short loc_4074
loc_405e:
    db 0x8d, 0x04, 0x6d, 0x00, 0x00, 0x00, 0x00    ; lea eax, [ebp*2]
    mov di, word [eax + 0x13c0d0]
    test di, di
    je short loc_4078
    movsx ebp, di
loc_4074:
    test ebp, ebp
    jge short loc_405e
loc_4078:
    mov eax, dword [esp + 0x50]
    db 0x0f, 0xbf, 0x14, 0x6d, 0x10, 0xca, 0x13, 0x00    ; movsx edx, word [ebp*2 + 0x13ca10]
    mov dword [eax*4 + 0x13c050], edx
    mov edx, dword [esp + 0x28]
    lea eax, [edx*4]
    add eax, edx
    movsx ecx, word [eax*8 + 0x2c9cb4]
    movsx eax, word [eax*8 + 0x2c9cb6]
    xor ebx, ebx
    lea edx, [ecx + eax]
    mov dword [esp + 0x68], ebx
    mov dword [esp + 0x58], edx
    mov ebp, ecx
    mov edi, ecx
    jmp short loc_410e
loc_40bb:
    mov edx, edi
    shl edx, 5
    movsx esi, word [edx + 0x27e4bc]
    shl esi, 5
    mov eax, dword [edx + 0x27e4b4]
    mov ecx, dword [esi + 0x27e4b4]
    sub ecx, eax
    imul ecx, ecx
    mov esi, dword [esi + 0x27e4b8]
    sub esi, dword [edx + 0x27e4b8]
    imul esi, esi
    lea eax, [ecx + esi]
    call 0x62c3d
    movsx edx, word [edx + 0x27e4c0]
    cmp edx, dword [ebx + 0x13c050]
    jne short loc_410d
    cmp eax, dword [esp + 0x68]
    jle short loc_410d
    mov dword [esp + 0x68], eax
    mov ebp, edi
loc_410d:
    inc edi
loc_410e:
    mov ebx, dword [esp + 0x50]
    mov ecx, dword [esp + 0x58]
    lea ebx, [ebx*4]
    cmp edi, ecx
    jl short loc_40bb
    mov dword [ebx + 0x13d210], ebp
    shl ebp, 5
    movsx edx, word [ebp + 0x27e4bc]
    mov esi, dword [ebp + 0x27e4b8]
    shl edx, 5
    mov edi, dword [ebp + 0x27e4b4]
    mov ecx, dword [edx + 0x27e4b8]
    mov eax, dword [edx + 0x27e4b4]
    sub ecx, esi
    sub eax, edi
    mov edx, ecx
    call 0x62b58
    add eax, 0x600
    movsx edx, word [ebp + 0x27e4bc]
    and eax, 0x7ff
    shl edx, 5
    mov dword [esp + 0x38], eax
    mov ecx, dword [edx + 0x27e4b4]
    mov eax, dword [ebp + 0x27e4b4]
    add eax, ecx
    mov ecx, dword [esp + 0x38]
    add ecx, 0x200
    and ecx, 0x7ff
    db 0x0f, 0xbf, 0x0c, 0x4d, 0xb4, 0x96, 0x24, 0x00    ; movsx ecx, word [ecx*2 + 0x2496b4]
    sar eax, 1
    sar ecx, 8
    add eax, ecx
    mov esi, dword [edx + 0x27e4b8]
    mov dword [ebx + 0x13c950], eax
    mov eax, dword [ebp + 0x27e4b8]
    lea edx, [eax + esi]
    mov eax, dword [esp + 0x38]
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    sar edx, 1
    sar eax, 8
    add eax, edx
    mov edx, dword [ebx + 0x13c050]
    mov dword [ebx + 0x13c910], eax
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + 0x2c9cbc]
    sub eax, 0x2000
    mov dword [ebx + 0x13c990], eax
    jmp short loc_4202
loc_41f2:
    db 0x0f, 0xbf, 0x3c, 0x7d, 0xb4, 0xdf, 0x24, 0x00    ; movsx edi, word [edi*2 + 0x24dfb4]
loc_41fa:
    test edi, edi
    jge near loc_3f44
loc_4202:
    mov eax, dword [esp + 0x50]
    cmp dword [eax*4 + 0x13d210], 0
    jge short loc_4222
    inc dword [esp + 0x4c]
loc_4214:
    mov eax, dword [esp + 0x4c]
    cmp eax, dword [esp + 0x64]
    jl near loc_3a89
loc_4222:
    mov eax, dword [esp + 0x50]
    lea eax, [eax*4]
    cmp dword [eax + 0x13c050], 0
    jl short loc_4243
    cmp dword [eax + 0x13d210], 0
    jge near loc_443e
loc_4243:
    mov eax, dword [esp + 0x50]
    cmp dword [eax*4 + 0x13c8d0], 0
    jge near loc_4347
    xor ebp, ebp
    jmp near loc_433e
loc_425c:
    call 0x9ff40
    mov edx, eax
    movsx ebx, word [0x2d7c12]
    sar edx, 0x1f
    idiv ebx
    db 0x0f, 0xbf, 0x04, 0x55, 0xd4, 0x73, 0x2d, 0x00    ; movsx eax, word [edx*2 + 0x2d73d4]
    mov edi, edx
    jmp near loc_432d
loc_427e:
    imul esi, eax, 0x2c
    cmp byte [esi + 0x2522c8], 0
    jbe near loc_4321
    cmp byte [esi + 0x2522c9], 0
    jbe near loc_4321
    mov eax, dword [esp + 0x50]
    movsx edx, word [esi + 0x2522c2]
    call loc_286c
    test eax, eax
    jle short loc_4321
    mov eax, dword [esi + 0x2522bc]
    push edi
    sub eax, 0x400
    mov edx, dword [esp + 0x64]
    push eax
    mov ebx, dword [esi + 0x2522b8]
    mov ecx, dword [esi + 0x2522b4]
    push ebx
    mov eax, dword [esp + 0x68]
    mov ebx, dword [esp + 0x50]
    push ecx
    mov ecx, dword [esp + 0x4c]
    sub ebx, 0x2000
    call 0x6830d
    test eax, eax
    je short loc_4321
    mov eax, dword [esp + 0x50]
    mov edx, dword [esi + 0x2522b4]
    mov dword [eax*4 + 0x13c950], edx
    mov edx, dword [esi + 0x2522b8]
    mov dword [eax*4 + 0x13c910], edx
    mov edx, dword [esi + 0x2522bc]
    mov dword [eax*4 + 0x13c990], edx
    mov edx, dword [esp + 0x6c]
    mov dword [eax*4 + 0x13c8d0], edx
    jmp short loc_433d
loc_4321:
    mov eax, dword [esp + 0x6c]
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0xdf, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x24dfb4]
loc_432d:
    mov dword [esp + 0x6c], eax
    mov eax, dword [esp + 0x6c]
    test eax, eax
    jge near loc_427e
loc_433d:
    inc ebp
loc_433e:
    cmp ebp, 4
    jl near loc_425c
loc_4347:
    mov eax, dword [esp + 0x50]
    mov edx, dword [eax*4 + 0x13c950]
    mov esi, dword [esp + 0x5c]
    mov ebx, edx
    mov eax, dword [eax*4 + 0x13c910]
    sub ebx, esi
    mov dword [esp + 0x34], eax
    mov eax, ebx
    imul eax, ebx
    mov edi, dword [esp + 0x60]
    mov ecx, dword [esp + 0x34]
    sub ecx, edi
    mov dword [esp + 0x30], edx
    mov edx, ecx
    imul edx, ecx
    add eax, edx
    call 0x62c3d
    mov esi, eax
    test eax, eax
    je near loc_49a1
    mov edx, ecx
    mov eax, ebx
    call 0x62b58
    mov edx, ebx
    shl edx, 0xb
    mov edi, eax
    sub edx, ebx
    mov dword [esp + 0x38], eax
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    mov edx, eax
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 2]
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 2], ax
    mov edx, ecx
    shl edx, 0xb
    sub edx, ecx
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    mov edx, eax
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 4]
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov ebp, dword [esp + 0x20]
    mov word [edx + 4], ax
    lea eax, [edi + 0x400]
    sub eax, ebp
    and eax, 0x7ff
    sub eax, 0x400
    sar eax, 3
    cmp eax, -0x7f
    jg short loc_4404
    mov eax, 0xffffff81
loc_4404:
    cmp eax, 0x7f
    jge short loc_4431
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x20]
    add eax, 0x400
    sub eax, edx
    and eax, 0x7ff
    sub eax, 0x400
    sar eax, 3
    cmp eax, -0x7f
    jg short loc_4436
    mov eax, 0xffffff81
    jmp short loc_4436
loc_4431:
    mov eax, 0x7f
loc_4436:
    mov edx, dword [esp + 0x54]
    mov byte [edx], al
    jmp short loc_4448
loc_443e:
    mov dword [eax + 0x13c8d0], 0xffffffff
loc_4448:
    mov eax, dword [esp + 0x24]
    mov eax, dword [eax + 0x214]
    mov dword [esp + 8], eax
    mov eax, dword [esp + 0x24]
    mov eax, dword [eax + 0x218]
    mov dword [esp + 4], eax
    mov eax, dword [esp + 0x24]
    mov eax, dword [eax + 0x21c]
    push 0x10001
    mov dword [esp + 4], eax
    mov eax, dword [esp + 0x28]
    push 0x400
    mov ax, word [eax + 0x29e]
    push 0x400
    mov dword [esp + 0x7c], eax
    mov eax, dword [esp + 0x30]
    push 0xa4
    mov ebx, dword [eax + 0x250]
    lea edx, [esp + 0x14]
    push ebx
    mov ecx, dword [eax + 0x24c]
    lea eax, [esp + 0x1c]
    push ecx
    lea ebx, [esp + 0x18]
    lea ecx, [esp + 0x88]
    call 0x6a035
    mov edi, eax
    test eax, eax
    jne near loc_4547
    mov eax, dword [esp + 0x24]
    mov eax, dword [eax + 0x214]
    mov dword [esp + 8], eax
    mov eax, dword [esp + 0x24]
    mov eax, dword [eax + 0x218]
    mov dword [esp + 4], eax
    mov eax, dword [esp + 0x24]
    mov eax, dword [eax + 0x21c]
    add eax, 0x1800
    push 0x10001
    mov dword [esp + 4], eax
    mov eax, dword [esp + 0x28]
    push 0x400
    mov ax, word [eax + 0x29e]
    push 0x400
    mov dword [esp + 0x7c], eax
    mov eax, dword [esp + 0x30]
    push 0xa4
    mov esi, dword [eax + 0x250]
    lea ecx, [esp + 0x80]
    push esi
    mov edi, dword [eax + 0x24c]
    lea ebx, [esp + 0x14]
    push edi
    lea edx, [esp + 0x1c]
    lea eax, [esp + 0x20]
    call 0x6a035
    mov edi, eax
loc_4547:
    mov eax, dword [esp + 0x50]
    lea eax, [eax*4]
    test edi, edi
    je near loc_4820
    xor edx, edx
    mov ebx, dword [eax + 0x13c9d0]
    mov dword [esp + 0x6c], edx
    mov edx, edi
    inc ebx
    and edx, 0xc000
    mov dword [eax + 0x13c9d0], ebx
    cmp edx, 0x8000
    jne near loc_4618
    mov eax, edi
    and eax, 0x1fff
    shl eax, 5
    cmp word [eax + 0x27e4c0], 0
    jl near loc_4618
    mov ecx, dword [esp + 0x24]
    mov ebx, dword [esp + 0x24]
    mov edx, dword [esp + 0x24]
    movsx eax, word [eax + 0x27e4c0]
    mov ecx, dword [ecx + 0x21c]
    mov ebx, dword [ebx + 0x218]
    mov edx, dword [edx + 0x214]
    add ecx, 0x1800
    call 0x7485f
    cmp eax, ecx
    jg short loc_45d5
    mov dword [esp + 0x6c], 1
loc_45d5:
    mov ecx, dword [esp + 0x24]
    mov ebx, dword [esp + 0x24]
    mov eax, edi
    mov edx, dword [esp + 0x24]
    and eax, 0x1fff
    mov ecx, dword [ecx + 0x21c]
    mov ebx, dword [ebx + 0x218]
    shl eax, 5
    mov edx, dword [edx + 0x214]
    movsx eax, word [eax + 0x27e4c0]
    sub ecx, 0x1800
    call 0x74781
    cmp eax, ecx
    jl short loc_4618
    or byte [esp + 0x6c], 2
loc_4618:
    mov eax, edi
    and eax, 0xc000
    cmp eax, 0xc000
    jne short loc_462e
    mov dword [esp + 0x6c], 1
loc_462e:
    test byte [esp + 0x6c], 1
    je short loc_464b
    mov eax, dword [esp + 0x50]
    cmp dword [eax*4 + 0x13c9d0], 4
    jne short loc_464b
    mov eax, dword [esp + 0x54]
    or byte [eax + 6], 1
loc_464b:
    test byte [esp + 0x6c], 2
    je short loc_465a
    mov eax, dword [esp + 0x54]
    or byte [eax + 6], 2
loc_465a:
    mov edx, dword [esp + 0x34]
    mov eax, dword [esp + 0x60]
    mov ebx, dword [esp + 0x5c]
    sub edx, eax
    mov eax, dword [esp + 0x30]
    sub eax, ebx
    call 0x62b58
    mov dword [esp + 0x38], eax
    mov eax, edi
    and eax, 0xc000
    cmp eax, 0x8000
    jne short loc_46c4
    mov eax, edi
    and eax, 0x1fff
    shl eax, 5
    movsx ebx, word [eax + 0x27e4bc]
    shl ebx, 5
    mov ecx, dword [eax + 0x27e4b8]
    mov edx, dword [ebx + 0x27e4b8]
    sub edx, ecx
    mov ecx, edx
    mov edx, dword [ebx + 0x27e4b4]
    mov esi, dword [eax + 0x27e4b4]
    mov eax, edx
    mov edx, ecx
    sub eax, esi
    call 0x62b58
    mov dword [esp + 0x38], eax
loc_46c4:
    mov edx, dword [esp + 0x50]
    mov eax, edx
    shl eax, 4
    sub eax, edx
    shl eax, 5
    add eax, edx
    lea eax, [eax*4]
    mov edx, eax
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x2d6bbc]
    add edx, eax
    mov eax, edx
    mov edi, edx
    shl eax, 5
    shl edi, 6
    add eax, 0x212a0
    and edi, 0x7ff
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x3c, 0x7d, 0xb4, 0x96, 0x24, 0x00    ; movsx edi, word [edi*2 + 0x2496b4]
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    add edi, eax
    mov eax, edx
    shl eax, 4
    add eax, 0x1a590
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    mov dword [esp + 0x6c], edx
    add edi, eax
    lea eax, [edx*8]
    mov edx, dword [esp + 0x38]
    add eax, 0x1ea28
    add edx, 0x400
    and eax, 0x7ff
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    db 0x0f, 0xbf, 0x14, 0x55, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [edx*2 + 0x2496b4]
    add edi, eax
    imul edx, edi
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 2]
    sar edx, 0x11
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 2], ax
    mov eax, dword [esp + 0x38]
    add eax, 0x200
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [eax*2 + 0x2496b4]
    imul edx, edi
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 4]
    sar edx, 0x11
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 4], ax
    mov eax, dword [esp + 0x50]
    mov eax, dword [eax*4 + 0x13c9d0]
    and eax, 0x1f
    cmp eax, 2
    jne short loc_47c7
    or byte [edx + 9], 0x20
loc_47c7:
    mov eax, dword [esp + 0x50]
    mov eax, dword [eax*4 + 0x13c9d0]
    and eax, 0x1f
    cmp eax, 0x11
    jne short loc_47e2
    mov eax, dword [esp + 0x54]
    or byte [eax + 8], 0x40
loc_47e2:
    mov eax, dword [esp + 0x50]
    lea eax, [eax*4]
    cmp dword [eax + 0x13c9d0], 0x20
    jle short loc_480f
    mov ebp, 0xffffffff
    xor ebx, ebx
    mov dword [eax + 0x13c050], ebp
    mov dword [eax + 0x13d210], ebp
    mov dword [eax + 0x13c9d0], ebx
loc_480f:
    mov eax, dword [esp + 0x50]
    mov dword [eax*4 + 0x13c8d0], 0xffffffff
    jmp short loc_4826
loc_4820:
    mov dword [eax + 0x13c9d0], edi
loc_4826:
    mov ebx, dword [esp + 0x50]
    lea ebx, [ebx*4]
    cmp dword [ebx + 0x13c050], 0
    jl near loc_49a1
    cmp dword [ebx + 0x13d210], 0
    jl near loc_49a1
    mov eax, dword [ebx + 0x13c950]
    mov dword [esp + 0x30], eax
    mov ebp, dword [esp + 0x5c]
    mov esi, dword [esp + 0x30]
    sub esi, ebp
    mov ecx, esi
    imul ecx, esi
    mov eax, dword [ebx + 0x13c910]
    mov dword [esp + 0x34], eax
    mov edx, eax
    mov eax, dword [esp + 0x60]
    sub edx, eax
    mov eax, edx
    imul eax, edx
    add eax, ecx
    call 0x62c3d
    mov ecx, eax
    mov ebp, eax
    test eax, eax
    je near loc_49a1
    mov eax, esi
    call 0x62b58
    mov edx, dword [ebx + 0x13d210]
    mov dword [esp + 0x38], eax
    test edx, edx
    jl short loc_48eb
    cmp ecx, 0x1000
    jge short loc_48eb
    shl edx, 5
    movsx ecx, word [edx + 0x27e4bc]
    shl ecx, 5
    mov ebx, dword [edx + 0x27e4b8]
    mov eax, dword [ecx + 0x27e4b8]
    sub eax, ebx
    mov ebx, eax
    mov eax, dword [ecx + 0x27e4b4]
    mov ecx, dword [edx + 0x27e4b4]
    mov edx, ebx
    sub eax, ecx
    call 0x62b58
    add eax, 0x600
    and eax, 0x7ff
    mov dword [esp + 0x38], eax
loc_48eb:
    mov edx, dword [esp + 0x30]
    mov esi, dword [esp + 0x5c]
    sub edx, esi
    mov eax, edx
    shl eax, 0xb
    sub eax, edx
    mov edx, eax
    sar edx, 0x1f
    idiv ebp
    mov edx, eax
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 2]
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov edi, dword [esp + 0x60]
    mov word [edx + 2], ax
    mov edx, dword [esp + 0x34]
    sub edx, edi
    mov eax, edx
    shl eax, 0xb
    sub eax, edx
    mov edx, eax
    sar edx, 0x1f
    idiv ebp
    mov edx, eax
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 4]
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 4], ax
    mov eax, dword [esp + 0x38]
    mov ebp, dword [esp + 0x20]
    add eax, 0x400
    sub eax, ebp
    and eax, 0x7ff
    sub eax, 0x400
    sar eax, 3
    cmp eax, -0x7f
    jg short loc_4969
    mov eax, 0xffffff81
loc_4969:
    cmp eax, 0x7f
    jge short loc_4996
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x20]
    add eax, 0x400
    sub eax, edx
    and eax, 0x7ff
    sub eax, 0x400
    sar eax, 3
    cmp eax, -0x7f
    jg short loc_499b
    mov eax, 0xffffff81
    jmp short loc_499b
loc_4996:
    mov eax, 0x7f
loc_499b:
    mov edx, dword [esp + 0x54]
    mov byte [edx], al
loc_49a1:
    add esp, 0x7c
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    add byte [eax], al
loc_49ac:
    push ecx
    push edx
    movsx edx, ax
    mov cl, al
    mov al, 1
    and cl, 7
    sar edx, 3
    shl al, cl
    or byte [edx + 0x240bb4], al
    pop edx
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
loc_49cc:
    push ebx
    push ecx
    push edx
    push esi
    mov esi, eax
    cmp dword [0x1261ab], 0
    je short loc_49f2
    cwde
    imul eax, eax, 0x2c
    add eax, 0x2522b4
    call 0x12bc0
    test ax, ax
    jne near loc_4f9c
loc_49f2:
    movsx edx, si
    imul edx, edx, 0x2c
    mov dx, word [edx + 0x2522c2]
    mov cl, 1
    cmp dx, 0x6b3
    jb near loc_4b76
    jbe near loc_4dc7
    cmp dx, 0x7fd
    jb near loc_4ac0
    jbe near loc_4ea2
    cmp dx, 0x875
    jb short loc_4a79
    jbe near loc_4eb6
    cmp dx, 0xa96
    jb short loc_4a69
    jbe near loc_4e66
    cmp dx, 0xac8
    jb near loc_4f63
    jbe near loc_4e66
    cmp dx, 0x1202
    jb near loc_4f63
    cmp dx, 0x1203
    jbe near loc_4e52
    jmp near loc_4f63
loc_4a69:
    cmp dx, 0xa46
    je near loc_4e66
    jmp near loc_4f63
loc_4a79:
    cmp dx, 0x866
    jb short loc_4aa3
    jbe near loc_4eb6
    cmp dx, 0x870
    je near loc_4eb6
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4aa3:
    cmp dx, 0x848
    je near loc_4eb6
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4ac0:
    cmp dx, 0x71c
    jb short loc_4b2f
    cmp dx, 0x71d
    jbe near loc_4e7a
    cmp dx, 0x780
    jb short loc_4b12
    cmp dx, 0x781
    jbe near loc_4e7a
    cmp dx, 0x7a8
    jb near loc_4f63
    jbe near loc_4e8e
    cmp dx, 0x7d0
    je near loc_4ea2
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4b12:
    cmp dx, 0x758
    je near loc_4f3f
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4b2f:
    cmp dx, 0x6cd
    jb short loc_4b59
    jbe near loc_4dc7
    cmp dx, 0x6d0
    je near loc_4dc7
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4b59:
    cmp dx, 0x6bd
    je near loc_4dc7
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4b76:
    cmp dx, 0x3d5
    jb near loc_4c3e
    jbe near loc_4cd4
    cmp dx, 0x4d6
    jb short loc_4bf7
    jbe near loc_4f50
    cmp dx, 0x500
    jb short loc_4bda
    jbe near loc_4db3
    cmp dx, 0x60e
    jb near loc_4f63
    jbe near loc_4e66
    cmp dx, 0x690
    jb near loc_4f63
    cmp dx, 0x691
    jbe near loc_4dc7
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4bda:
    cmp dx, 0x4df
    je near loc_4f50
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4bf7:
    cmp dx, 0x437
    jb short loc_4c21
    jbe near loc_4f50
    cmp dx, 0x4cb
    je near loc_4f61
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4c21:
    cmp dx, 0x426
    je near loc_4d8b
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4c3e:
    cmp dx, 0x23b
    jb short loc_4c92
    jbe near loc_4d4e
    cmp dx, 0x388
    jb short loc_4c75
    jbe near loc_4e1d
    cmp dx, 0x399
    je near loc_4d9f
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4c75:
    cmp dx, 0x26d
    je near loc_4f61
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4c92:
    cmp dx, 0x214
    jb short loc_4cb8
    jbe near loc_4eeb
    cmp dx, 0x239
    je short loc_4d11
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4cb8:
    cmp dx, 0x64
    je near loc_4f2e
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4cd4:
    mov eax, 0x3b6
    mov edx, 0x399
    call loc_49ac
    jmp short loc_4cf8
loc_4ce5:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_4cf7
    call loc_49ac
loc_4cf7:
    inc edx
loc_4cf8:
    cmp dx, 0x39d
    jl short loc_4ce5
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4d11:
    mov eax, 0x267
    mov edx, 0x399
    call loc_49ac
    jmp short loc_4d35
loc_4d22:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_4d34
    call loc_49ac
loc_4d34:
    inc edx
loc_4d35:
    cmp dx, 0x39d
    jl short loc_4d22
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4d4e:
    mov eax, 0x23d
    mov edx, 0x399
    call loc_49ac
    jmp short loc_4d72
loc_4d5f:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_4d71
    call loc_49ac
loc_4d71:
    inc edx
loc_4d72:
    cmp dx, 0x39d
    jl short loc_4d5f
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4d8b:
    mov cl, 2
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4d9f:
    mov cl, 4
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4db3:
    mov cl, 0x2c
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4dc7:
    mov edx, 0x690
    jmp short loc_4de1
loc_4dce:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_4de0
    call loc_49ac
loc_4de0:
    inc edx
loc_4de1:
    cmp dx, 0x6d8
    jl short loc_4dce
    mov edx, 0x6e8
    jmp short loc_4e02
loc_4def:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_4e01
    call loc_49ac
loc_4e01:
    inc edx
loc_4e02:
    cmp dx, 0x6f3
    jl short loc_4def
    xor cl, cl
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4e1d:
    mov cl, 5
    mov edx, 0x402
    jmp short loc_4e39
loc_4e26:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_4e38
    call loc_49ac
loc_4e38:
    inc edx
loc_4e39:
    cmp dx, 0x406
    jl short loc_4e26
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4e52:
    mov cl, 0x5a
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4e66:
    mov cl, 0x1e
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4e7a:
    mov cl, 0x26
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4e8e:
    mov cl, 0xd
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4ea2:
    mov cl, 0x3d
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4eb6:
    mov edx, 0x899
    jmp short loc_4ed0
loc_4ebd:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_4ecf
    call loc_49ac
loc_4ecf:
    inc edx
loc_4ed0:
    cmp dx, 0x8a4
    jl short loc_4ebd
    mov cl, 0x50
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp near loc_4f82
loc_4eeb:
    mov ebx, dword [0x1261df]
    xor cl, cl
    cmp ebx, 1
    jle near loc_4f63
    mov cl, 5
    mov edx, 0x20b
    jmp short loc_4f18
loc_4f05:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_4f17
    call loc_49ac
loc_4f17:
    inc edx
loc_4f18:
    cmp dx, 0x275
    jl short loc_4f05
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp short loc_4f82
loc_4f2e:
    mov cl, 0xe
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp short loc_4f82
loc_4f3f:
    mov cl, 0xa
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp short loc_4f82
loc_4f50:
    mov cl, 3
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp short loc_4f82
loc_4f61:
    mov cl, 5
loc_4f63:
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x2522c2]
    jmp short loc_4f82
loc_4f72:
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_4f81
    call loc_49ac
loc_4f81:
    inc edx
loc_4f82:
    movsx eax, si
    imul eax, eax, 0x2c
    movsx ebx, word [eax + 0x2522c2]
    xor eax, eax
    mov al, cl
    add ebx, eax
    movsx eax, dx
    cmp eax, ebx
    jl short loc_4f72
loc_4f9c:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
loc_4fac:
    push edx
    cmp dword [0x125d4b], 8
    jl short loc_5006
    cmp dword [0x24552c], 0
    jne short loc_4fc9
    mov eax, 0x99e
    call loc_49ac
loc_4fc9:
    cmp dword [0x1261df], 1
    jle short loc_5006
    cmp dword [0x245538], 0
    jne short loc_4fe5
    mov eax, 0x9a1
    call loc_49ac
loc_4fe5:
    mov edx, 0xc00
    jmp short loc_4fff
loc_4fec:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_4ffe
    call loc_49ac
loc_4ffe:
    inc edx
loc_4fff:
    cmp dx, 0xc3f
    jl short loc_4fec
loc_5006:
    mov eax, 0x1f6
    mov edx, 0x401
    call loc_49ac
    jmp short loc_502a
loc_5017:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_5029
    call loc_49ac
loc_5029:
    inc edx
loc_502a:
    cmp dx, 0x45f
    jl short loc_5017
    mov edx, 0x226
    jmp short loc_504b
loc_5038:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_504a
    call loc_49ac
loc_504a:
    inc edx
loc_504b:
    cmp dx, 0x229
    jl short loc_5038
    mov edx, 0xb7c
    jmp short loc_506c
loc_5059:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_506b
    call loc_49ac
loc_506b:
    inc edx
loc_506c:
    cmp dx, 0xbce
    jl short loc_5059
    mov edx, 0x8de
    jmp short loc_508d
loc_507a:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_508c
    call loc_49ac
loc_508c:
    inc edx
loc_508d:
    cmp dx, 0x8ec
    jl short loc_507a
    mov edx, 0x906
    jmp short loc_50ae
loc_509b:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_50ad
    call loc_49ac
loc_50ad:
    inc edx
loc_50ae:
    cmp dx, 0x914
    jl short loc_509b
    mov edx, 0x914
    jmp short loc_50cf
loc_50bc:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_50ce
    call loc_49ac
loc_50ce:
    inc edx
loc_50cf:
    cmp dx, 0x918
    jl short loc_50bc
    mov edx, 0x9dc
    jmp short loc_50f0
loc_50dd:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_50ef
    call loc_49ac
loc_50ef:
    inc edx
loc_50f0:
    cmp dx, 0x9df
    jl short loc_50dd
    mov edx, 0x762
    jmp short loc_5111
loc_50fe:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_5110
    call loc_49ac
loc_5110:
    inc edx
loc_5111:
    cmp dx, 0x777
    jl short loc_50fe
    mov eax, 0x3b8
    mov edx, 0x9e0
    call loc_49ac
    jmp short loc_513c
loc_5129:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_513b
    call loc_49ac
loc_513b:
    inc edx
loc_513c:
    cmp dx, 0x9e8
    jl short loc_5129
    mov eax, 0x226
    mov edx, 0x8c5
    call loc_49ac
    jmp short loc_5167
loc_5154:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_5166
    call loc_49ac
loc_5166:
    inc edx
loc_5167:
    cmp dx, 0x8de
    jl short loc_5154
    mov edx, 0x960
    jmp short loc_5188
loc_5175:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_5187
    call loc_49ac
loc_5187:
    inc edx
loc_5188:
    cmp dx, 0x973
    jl short loc_5175
    mov edx, 0x919
    cmp dx, 0x91d
    jl short loc_519d
    pop edx
    ret
loc_519d:
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_51af
    call loc_49ac
loc_51af:
    inc edx
    cmp dx, 0x91d
    jl short loc_519d
    pop edx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_51bc:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov ebx, eax
    cmp ax, 0x1c2
    jae short loc_51d2
    cmp dword [0x1b8ab8], 0
    jne short loc_51d9
loc_51d2:
    xor al, al
    jmp near loc_52a6
loc_51d9:
    cmp dword [0x1b8ce8], 0xd
    jne short loc_51ea
    xor al, al
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_51ea:
    xor esi, esi
    mov si, ax
    lea eax, [esi*8]
    sub eax, esi
    xor edx, edx
    add eax, eax
    mov dl, byte [0x126233]
    add eax, 0x122114
    call 0x77cee
    mov edi, eax
    cwde
    cmp eax, -1
    jne short loc_521c
    xor al, al
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_521c:
    call 0x77fa4
    mov dword [esi*4 + 0x8a930], eax
    mov esi, dword [0x1261e7]
    mov ecx, eax
    test esi, esi
    jne short loc_525e
    cmp dword [0x1261eb], 0
    jne short loc_525e
    cmp bx, 0xbd
    je short loc_5266
    cmp bx, 0xe8
    je short loc_5266
    cmp bx, 0x63
    je short loc_5266
    cmp bx, 0xe9
    je short loc_5266
    cmp bx, 0x11
    je short loc_5266
loc_525e:
    cmp ecx, 0x3000
    jge short loc_529c
loc_5266:
    xor esi, esi
    mov si, bx
    imul esi, esi, 0xd
    mov byte [esi + 0x123fd4], 0xc7
    mov eax, 0x123fd0
    add eax, esi
    mov edx, ecx
    lea ebx, [eax + 4]
    call 0x77508
    mov eax, dword [esi + 0x123fd0]
    test eax, eax
    je short loc_529c
    mov edx, eax
    mov ebx, ecx
    movsx eax, di
    call 0x77e20
loc_529c:
    movsx eax, di
    call 0x77fe5
    mov al, 1
loc_52a6:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_52ac:
    push ebx
    push edx
    cmp dword [0x1b8ce8], 0xd
    je short loc_52e9
    xor ebx, ebx
    xor edx, edx
    jmp short loc_52e2
loc_52bd:
    movsx eax, dx
    imul eax, eax, 0xd
    cmp dword [eax + 0x123fd0], 0
    jne short loc_52e1
    inc ebx
    test bl, 7
    jne short loc_52d7
    call 0x10800
loc_52d7:
    xor eax, eax
    mov ax, dx
    call loc_51bc
loc_52e1:
    inc edx
loc_52e2:
    cmp dx, 0x1c2
    jl short loc_52bd
loc_52e9:
    pop edx
    pop ebx
    ret
    push ebx
    push ecx
    push edx
    push esi
    push edi
    call loc_52ac
    call loc_4fac
    xor esi, esi
    cmp si, word [0x2d7c10]
    jl short loc_530d
    xor esi, esi
    jmp near loc_5432
loc_530d:
    movsx eax, si
    shl eax, 5
    movsx eax, word [eax + 0x27e4c4]
    lea ebx, [eax*4]
    mov edx, dword [ebx + 0x242eb4]
    test edx, edx
    jne short loc_5356
    jne short loc_5332
    call loc_49ac
loc_5332:
    movsx eax, si
    shl eax, 5
    mov bx, word [eax + 0x27e4c6]
    test bx, bx
    jl short loc_5356
    movsx eax, bx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_5356
    call loc_49ac
loc_5356:
    inc esi
    cmp si, word [0x2d7c10]
    jl short loc_530d
    xor esi, esi
    jmp near loc_5432
loc_5367:
    movsx ebx, si
    lea eax, [ebx*4]
    add eax, ebx
    movsx eax, word [eax*8 + 0x2c9ccc]
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_538a
    call loc_49ac
loc_538a:
    movsx ebx, si
    lea eax, [ebx*4]
    add ebx, eax
    lea ebx, [ebx*8]
    movsx eax, word [ebx + 0x2c9cc4]
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_53d8
    call loc_49ac
    movsx eax, word [ebx + 0x2c9cc4]
    cmp dword [eax*4 + 0x242eb4], 0x58
    jne short loc_53d8
    mov eax, 0x59
    call loc_49ac
    mov eax, 0x5a
    call loc_49ac
loc_53d8:
    movsx eax, si
    db 0x66, 0x8b, 0x14, 0x45, 0xd4, 0x73, 0x2d, 0x00    ; mov dx, word [eax*2 + 0x2d73d4]
loc_53e3:
    test dx, dx
    jl short loc_5431
    movsx ebx, dx
    imul eax, ebx, 0x2c
    cmp byte [eax + 0x2522c8], 0
    je short loc_5424
    cmp byte [eax + 0x2522c9], 0
    je short loc_5424
    movsx ecx, word [eax + 0x2522c0]
    test ch, 0x80
    jne short loc_5424
    movsx eax, word [eax + 0x2522c2]
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_5424
    mov eax, ebx
    call loc_49cc
loc_5424:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0xdf, 0x24, 0x00    ; mov dx, word [eax*2 + 0x24dfb4]
    jmp short loc_53e3
loc_5431:
    inc esi
loc_5432:
    cmp si, word [0x2d7c12]
    jl near loc_5367
    xor edx, edx
    xor esi, esi
    jmp short loc_5484
loc_5445:
    movsx eax, si
    mov ebx, eax
    sar ebx, 3
    movzx edi, byte [ebx + 0x240bb4]
    mov ebx, esi
    xor bh, bh
    and bl, 7
    movsx ecx, bx
    mov ebx, 1
    shl ebx, cl
    test edi, ebx
    je short loc_5483
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_5483
    inc edx
    call 0x61d1d
    test dl, 7
    jne short loc_5483
    call 0x10800
loc_5483:
    inc esi
loc_5484:
    cmp si, 0x1800
    jl short loc_5445
    mov ecx, 0x300
    mov edi, 0x240bb4
    xor eax, eax
    cmp ecx, 4
    jae short loc_54a9
    test cl, 1
    je short loc_54a2
    db 0xaa    ; stosb byte es:[edi], al
loc_54a2:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_54d4
loc_54a9:
    test edi, 1
    je short loc_54b3
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_54b3:
    test edi, 2
    je short loc_54c0
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_54c0:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_54ce
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_54ce:
    test bl, 1
    je short loc_54d4
    db 0xaa    ; stosb byte es:[edi], al
loc_54d4:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push esi
    push edi
    mov ecx, eax
    movsx eax, dx
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_54f4
    call 0x61d1d
loc_54f4:
    movsx esi, cx
    imul esi, esi, 0x2c
    movsx edi, dx
    mov eax, edi
    db 0x0f, 0xbf, 0x1c, 0x7d, 0x34, 0x93, 0x23, 0x00    ; movsx ebx, word [edi*2 + 0x239334]
    db 0x0f, 0xbf, 0x14, 0x7d, 0x34, 0xc3, 0x23, 0x00    ; movsx edx, word [edi*2 + 0x23c334]
    call 0x73ef9
    movsx eax, word [esi + 0x2522cc]
    push eax
    movsx eax, byte [esi + 0x2522c4]
    movsx ecx, word [esi + 0x2522d0]
    add eax, 0x64
    mov ebx, dword [esi + 0x2522bc]
    push eax
    mov edx, dword [esi + 0x2522b8]
    mov eax, dword [esi + 0x2522b4]
    call 0x5b74d
    mov ah, 1
    mov ecx, 0x10000
    movsx ebx, word [esi + 0x2522d0]
    mov edx, dword [esi + 0x2522b8]
    mov byte [0x126235], ah
    mov eax, dword [esi + 0x2522b4]
    call 0x1da90
    xor dl, dl
    mov byte [0x126235], dl
    call 0x62ea1
    call 0x740a5
    mov eax, edi
    call 0x7421c
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov edx, dword [0x125d4b]
    test edx, edx
    jge short loc_55a9
    xor esi, esi
    mov dword [0x125d4b], esi
    jmp short loc_55b8
loc_55a9:
    cmp edx, 0x3f
    jle short loc_55b8
    mov dword [0x125d4b], 0x40
loc_55b8:
    cmp dword [0x125d4b], 0
    jne short loc_55c6
    call 0x6eb4d
loc_55c6:
    mov ebx, dword [0x125d4b]
    sub ebx, 8
    test ebx, ebx
    jg short loc_55d5
    xor ebx, ebx
loc_55d5:
    mov ecx, 0xa0
    mov esi, 0xc8
    mov edx, dword [0x2d6bc8]
    mov eax, ebx
    mov edi, ebx
    imul edx
    idiv ecx
    mov edx, dword [0x2d6bc8]
    mov ebp, eax
    sub edx, eax
    mov eax, dword [0x125d4b]
    mov dword [esp], edx
    test eax, eax
    jle short loc_5652
    cmp dword [0x125d47], 1
    je short loc_5652
    cmp dword [0x1261df], 1
    jle short loc_5652
    movsx eax, word [0x2f2920]
    xor edx, edx
    jmp short loc_562e
loc_5620:
    cmp eax, edx
    jle short loc_5626
    mov edx, eax
loc_5626:
    db 0x0f, 0xbf, 0x04, 0x45, 0x18, 0x28, 0x2f, 0x00    ; movsx eax, word [eax*2 + 0x2f2818]
loc_562e:
    test eax, eax
    jge short loc_5620
    cmp edx, 1
    jl short loc_563a
    add ebx, 8
loc_563a:
    cmp edx, 4
    jl short loc_5642
    add ebx, 8
loc_5642:
    cmp edx, 8
    jl short loc_564a
    add ebx, 8
loc_564a:
    cmp edx, 0xc
    jl short loc_5652
    add ebx, 8
loc_5652:
    cmp dword [0x125d4b], 8
    jl short loc_5660
    lea eax, [edi + 0x22]
    sub esi, eax
loc_5660:
    mov ecx, 0xc8
    mov edx, dword [0x2d6bc4]
    mov eax, ebx
    imul edx
    idiv ecx
    mov edx, dword [0x2d6bc4]
    mov edi, eax
    mov eax, esi
    mov ebx, dword [esp]
    imul edx
    idiv ecx
    dec ebx
    lea ecx, [eax - 1]
    mov edx, edi
    mov eax, ebp
    call 0x6e783
    mov ah, 1
    mov byte [0x12622d], ah
    mov byte [0x12622f], ah
    add esp, 4
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
    movsx edx, ax
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    add ebx, ebx
    mov edx, dword [0x1261df]
    add ebx, 0xf1720
    cmp edx, 1
    jle short loc_56f4
    cmp dword [0x125d47], 1
    je short loc_56f4
    call 0x6dc5f
    xor ecx, ecx
    mov edx, eax
    mov cl, byte [0x12623b]
    sar edx, 0x1f
    idiv ecx
    jmp short loc_56f6
loc_56f4:
    mov edx, eax
loc_56f6:
    movsx edx, dx
    shl edx, 4
    mov eax, dword [edx + 0xf1620]
    mov dword [ebx + 0x214], eax
    mov dword [ebx + 0x238], eax
    mov dword [ebx + 0x230], eax
    mov eax, dword [edx + 0xf1624]
    mov dword [ebx + 0x218], eax
    mov dword [ebx + 0x23c], eax
    mov dword [ebx + 0x234], eax
    mov eax, dword [edx + 0xf1628]
    mov dword [ebx + 0x21c], eax
    mov dword [ebx + 0x240], eax
    mov ax, word [edx + 0xf162c]
    mov word [ebx + 0x298], ax
    mov ax, word [edx + 0xf162e]
    mov word [ebx + 0x29e], ax
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8b, 0xc0    ; mov eax, eax
loc_576c:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    movsx ebx, ax
    mov edx, ebx
    shl edx, 7
    sub edx, ebx
    lea edx, [edx*4]
    sub edx, ebx
    mov ebp, 0xf1720
    add edx, edx
    add ebp, edx
    mov dword [ebp + 0x28c], 0xf0bf8
    mov edx, dword [ebp + 0x28c]
    mov dword [edx], 0x2328
    mov edx, dword [ebp + 0x28c]
    mov dword [edx + 4], 0
    xor ecx, ecx
    mov dword [ebp + 0x284], 0
    cmp cx, 8
    jl short loc_57ca
    xor ecx, ecx
    jmp near loc_58fe
loc_57ca:
    xor eax, eax
    jmp short loc_57f1
loc_57ce:
    movsx edx, cx
    mov edi, dword [edx*4 + 0x7c78]
    imul edx, edx, 0x2e
    mov esi, dword [ebp + 0x28c]
    movsx ebx, ax
    add esi, edx
    mov dl, byte [edi + ebx]
    inc eax
    mov byte [esi + ebx + 0x88], dl
loc_57f1:
    db 0x66, 0x3d, 0x0a, 0x00    ; cmp ax, 0xa
    jl short loc_57ce
    movsx ebx, cx
    lea edx, [ebx*4]
    imul ebx, ebx, 0x2e
    mov esi, dword [ebp + 0x28c]
    mov edi, dword [edx + 0x7cc0]
    mov dword [esi + ebx + 0x9e], edi
    mov esi, dword [ebp + 0x28c]
    lea edi, [esi + ebx]
    mov esi, dword [edx + 0x7d08]
    mov dword [edi + 0xaa], esi
    mov esi, dword [ebp + 0x28c]
    lea edi, [esi + ebx]
    mov esi, dword [edx + 0x7d50]
    mov dword [edi + 0xa2], esi
    mov edi, dword [ebp + 0x28c]
    mov esi, dword [edx + 0x7de0]
    mov dword [edi + ebx + 0xb2], esi
    mov esi, dword [ebp + 0x28c]
    mov edx, dword [edx + 0x7d98]
    inc ecx
    mov dword [esi + ebx + 0xae], edx
    cmp cx, 8
    jl near loc_57ca
    xor ecx, ecx
    cmp cx, 0xa
    jl short loc_5881
    xor ecx, ecx
    jmp near loc_5929
loc_5881:
    xor eax, eax
    jmp short loc_58a2
loc_5885:
    movsx edx, cx
    mov esi, dword [edx*4 + 0x7c98]
    imul edx, edx, 0x2e
    movsx ebx, ax
    add esi, ebx
    add ebx, edx
    mov dl, byte [esi]
    inc eax
    mov byte [ebx + 0x2e7e0], dl
loc_58a2:
    db 0x66, 0x3d, 0x0a, 0x00    ; cmp ax, 0xa
    jl short loc_5885
    movsx edx, cx
    lea ebx, [edx*4]
    imul edx, edx, 0x2e
    mov esi, dword [ebx + 0x7ce0]
    mov dword [edx + 0x2e7f6], esi
    mov esi, dword [ebx + 0x7d28]
    mov dword [edx + 0x2e802], esi
    mov esi, dword [ebx + 0x7d70]
    mov dword [edx + 0x2e7fa], esi
    mov esi, dword [ebx + 0x7e00]
    mov dword [edx + 0x2e80a], esi
    mov esi, dword [ebx + 0x7db8]
    mov ebx, dword [ebx + 0x7e48]
    mov dword [edx + 0x2e806], esi
    inc ecx
    mov dword [edx + 0x2e7fe], ebx
loc_58fe:
    cmp cx, 0xa
    jl near loc_5881
    xor ecx, ecx
    cmp cx, 2
    jl short loc_5917
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_5917:
    mov ebx, dword [ebp + 0x28c]
    movsx edx, cx
    inc ecx
    mov dword [ebx + edx*4 + 8], 0
loc_5929:
    cmp cx, 2
    jl short loc_5917
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    cwde
    mov edx, eax
    shl edx, 7
    sub edx, eax
    lea edx, [edx*4]
    sub edx, eax
    call loc_576c
    add edx, edx
    xor ah, ah
    add edx, 0xf1720
    mov byte [0x125781], ah
    mov byte [0x125780], ah
    mov dword [edx + 0x288], 0x64
    mov word [edx + 0x382], 0
    mov word [edx + 0x2c8], 0xffff
    mov word [edx + 0x352], 0
    mov word [edx + 0x2a4], 0
    mov word [edx + 0x398], 0
    mov word [edx + 0x32e], 0
    mov word [edx + 0x32c], 0
    mov word [edx + 0x316], 0
    mov word [edx + 0x356], 0xffff
    mov dword [edx + 0x22c], 0
    mov dword [edx + 0x258], 0
    mov word [edx + 0x390], 0
    mov dword [edx + 0x244], 0
    mov dword [edx + 0x248], 0
    mov dword [edx + 0x210], 0
    mov word [edx + 0x29c], 0
    mov dword [edx + 0x270], 0
    mov word [edx + 0x350], 0
    mov word [edx + 0x384], 0
    mov word [edx + 0x34e], 0xffff
    mov dword [edx + 0x27c], 0x309
    mov word [edx + 0x322], 0
    mov word [edx + 0x396], 0
    mov word [edx + 0x31a], 0xffff
    mov word [edx + 0x320], 0
    mov word [edx + 0x39a], 0
    mov dword [edx + 0x220], 0x8c
    mov word [edx + 0x318], 0
    mov dword [edx + 0x26c], 0
    mov dword [edx + 0x264], 0
    mov byte [edx + 0x3f5], 9
    mov word [edx + 0x326], 0x186
    mov word [edx + 0x332], 0xffff
    mov byte [edx + 0x3d2], ah
    mov byte [edx + 0x3ca], ah
    mov byte [edx + 0x3e4], ah
    mov byte [edx + 0x3d1], ah
    mov byte [edx + 0x3a4], ah
    mov byte [edx + 0x3cf], ah
    xor bl, bl
    mov byte [edx + 0x3a6], ah
    mov byte [edx + 0x3a8], bl
    mov byte [edx + 0x3a7], bl
    mov byte [edx + 0x3e9], bl
    mov eax, dword [edx + 0x220]
    mov dword [edx + 0x224], eax
    cmp dword [0x1261df], 1
    jle short loc_5b0e
    cmp dword [0x125d47], 1
    je short loc_5b0e
    mov word [edx + 0x336], 7
    jmp short loc_5b17
loc_5b0e:
    mov word [edx + 0x336], 0
loc_5b17:
    mov bh, 1
    mov word [edx + 0x346], 0
    mov byte [0x12622f], bh
    mov byte [edx + 0x3a3], 0
    mov byte [edx + 0x3cc], 0
    mov bx, word [edx + 0x38a]
    mov dword [edx + 0x3e5], 0x251fb4
    cmp bx, 0x190
    jge short loc_5b5e
    mov word [edx + 0x38a], 0
    mov byte [edx + 0x3c9], 0
loc_5b5e:
    mov byte [edx + 0x3d0], 0
    mov byte [edx + 0x3cb], 0
    mov word [edx + 0x38e], 0xffff
    mov ax, word [0x1261e7]
    mov word [edx + 0x380], 0
    mov word [edx + 0x31e], 0xffff
    mov word [edx + 0x324], 0
    mov ebx, 0x200
    mov byte [edx + 0x3ed], 0
    xor ah, ah
    mov dword [edx + 0x24c], 0
    and al, 1
    mov dword [edx + 0x250], 0
    shl eax, 0xa
    mov dword [edx + 0x254], 0
    sub ebx, eax
    xor esi, esi
    mov word [edx + 0x2a0], bx
    mov dword [0x123c34], esi
    mov dword [0x123c30], esi
    mov word [edx + 0x33c], 0xffff
    mov word [edx + 0x34a], 0
    mov word [edx + 0x34c], 0
    mov cx, word [edx + 0x312]
    mov word [edx + 0x33e], 0xffff
    cmp cx, 9
    jne short loc_5c1a
    mov word [edx + 0x334], 5
    jmp short loc_5c23
loc_5c1a:
    mov word [edx + 0x334], 0
loc_5c23:
    mov word [edx + 0x392], 6
    mov byte [edx + 0x3eb], 0
    mov word [edx + 0x338], 0
    mov byte [edx + 0x3ea], 0
    mov word [edx + 0x348], 0
    mov word [edx + 0x328], 0
    mov eax, edx
    mov byte [edx + 0x3cb], 0
    call 0x45230
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
%else
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x48
    mov dword [esp + 0x34], eax
    movsx ebx, ax
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov esi, 0xb4f00
    add eax, eax
    add esi, eax
    mov ax, word [esi + 0x340]
    mov dword [esp + 0x3c], eax
    cwde
    imul eax, eax, 0x2c
    mov ebp, 0x1c0ba4
    add ebp, eax
    lea eax, [esi + 0x334]
    mov dx, word [esi + 0x34c]
    mov dword [esp + 0x2c], eax
    test dx, dx
    jg short loc_0077
    lea eax, [ebx*4]
    add eax, ebx
    db 0x8b, 0x04, 0x45, 0x66, 0x02, 0x0e, 0x00    ; mov eax, dword [eax*2 + 0xe0266]
    mov dword [esp + 0x18], eax
    jmp short loc_007d
loc_0077:
    xor edx, edx
    mov dword [esp + 0x18], edx
loc_007d:
    mov ax, word [esi + 0x29e]
    mov dword [esp + 0x40], eax
    cwde
    cmp eax, -1
    jne short loc_00ab
    cmp word [ebp + 0x2a], 0
    jle short loc_00a5
    cmp byte [0xe8d83], 0
    jne short loc_00a5
    mov eax, esi
    call 0x47e70
loc_00a5:
    xor ecx, ecx
    mov dword [esp + 0x40], ecx
loc_00ab:
    movsx edx, word [esp + 0x40]
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + 0x2385c6]
    mov byte [esi + 0x3cc], 0
    push 0x10001
    mov dl, byte [ebp + 0x15]
    mov dword [esp + 0x34], eax
    cmp dl, 0x20
    setb al
    push 0xa3
    mov byte [esp + 0x4c], al
    lea eax, [esp + 8]
    push eax
    lea eax, [esp + 0x18]
    push eax
    lea eax, [esp + 0x14]
    push eax
    lea eax, [esp + 0x1c]
    push eax
    movsx eax, word [esp + 0x58]
    mov ebx, dword [esi + 0x21c]
    mov dword [esp + 0x28], eax
    mov edx, dword [esi + 0x218]
    mov ecx, dword [esp + 0x28]
    mov eax, dword [esi + 0x214]
    call 0x707b3
    mov eax, dword [esp + 0x10]
    mov ebx, dword [esi + 0x218]
    mov edx, dword [esi + 0x214]
    call 0x7739f
    mov ecx, eax
    mov edi, eax
    mov ebx, dword [esi + 0x218]
    mov edx, dword [esi + 0x214]
    mov dword [esi + 0x25c], eax
    mov eax, dword [esp + 0x10]
    call 0x772c1
    mov dword [esi + 0x260], eax
    mov eax, dword [esi + 0x21c]
    sub eax, ecx
    test eax, eax
    jns short loc_0163
    neg eax
loc_0163:
    mov edx, dword [esp]
    and edx, 0xc000
    mov dword [esp + 0x20], eax
    cmp edx, 0x4000
    jne short loc_018d
    cmp word [esp + 0x30], 1
    jne short loc_018d
    cmp eax, 0x3600
    jle short loc_018d
    xor ebx, ebx
    mov dword [esp + 0x30], ebx
loc_018d:
    movsx edx, word [esp + 0x3c]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [esp + 0xc]
    mov dword [edx + 0x4e9eb], eax
    mov eax, dword [esp + 8]
    mov dword [edx + 0x4e9ef], eax
    mov eax, dword [esi + 0x220]
    mov dword [esi + 0x224], eax
    movsx eax, word [esi + 0x318]
    mov ebx, dword [esi + 0x280]
    mov dword [esi + 0x228], eax
    test ebx, ebx
    jne near loc_02d4
    cmp byte [esi + 0x3a8], 0
    je near loc_02d4
    cmp word [esp + 0x30], 2
    je near loc_02d4
    movsx eax, word [esp + 0x40]
    mov dword [esp + 0x14], eax
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    test byte [eax*8 + 0x2385b2], 2
    je near loc_02d4
    movsx eax, word [esi + 0x298]
    add eax, 0x200
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov edx, dword [esi + 0x214]
    sar eax, 5
    add edx, eax
    mov ax, word [esi + 0x298]
    and ah, 7
    cwde
    lea ebx, [esp + 0x38]
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov ecx, dword [esi + 0x218]
    sar eax, 5
    mov dword [esp + 0x24], edx
    add ecx, eax
    mov eax, dword [esp + 0x40]
    mov edx, ecx
    mov dword [esp + 0x38], eax
    mov eax, dword [esp + 0x24]
    call 0x6e997
    cmp word [esp + 0x38], 0
    jl short loc_02d4
    mov edx, dword [esp + 0x24]
    mov eax, dword [esp + 0x14]
    mov ebx, ecx
    call 0x7739f
    mov edx, dword [esp + 0x38]
    mov dword [esp + 0x1c], eax
    sub edi, eax
    cmp dx, word [esp + 0x40]
    je short loc_02c0
    movsx eax, dx
    mov ebx, ecx
    mov edx, dword [esp + 0x24]
    call 0x7739f
    sub eax, dword [esp + 0x1c]
    test eax, eax
    jns short loc_02b9
    neg eax
loc_02b9:
    cmp eax, 0x400
    jg short loc_02d4
loc_02c0:
    mov edx, 0xa0
    mov eax, edi
    imul edx
    shrd eax, edx, 0x10
    add word [esi + 0x318], ax
loc_02d4:
    mov di, word [esi + 0x318]
    test di, di
    jle short loc_02ed
    movsx eax, di
    mov edx, eax
    sar edx, 3
    inc edx
    sub eax, edx
    jmp short loc_02fc
loc_02ed:
    jge short loc_0303
    movsx eax, di
    mov edx, eax
    neg edx
    sar edx, 3
    inc edx
    add eax, edx
loc_02fc:
    mov word [esi + 0x318], ax
loc_0303:
    mov ebx, dword [esp + 4]
    test ebx, ebx
    jl short loc_034c
    mov eax, ebx
    and eax, 0xc000
    cmp eax, 0xc000
    jne short loc_034c
    mov ecx, ebx
    and ecx, 0xfff
    mov dword [esp + 4], ecx
    imul eax, ecx, 0x2c
    cmp word [eax + 0x1c0bbe], 1
    jne short loc_034c
    cmp word [eax + 0x1c0bce], 0
    jl short loc_034c
    xor eax, eax
    mov dword [esp + 4], eax
    mov eax, dword [esi + 0x260]
    mov dword [esp + 8], eax
loc_034c:
    mov edx, dword [esp]
    test edx, edx
    jl near loc_0439
    mov eax, edx
    and eax, 0xc000
    cmp eax, 0xc000
    jne near loc_0439
    mov edi, edx
    and edi, 0xfff
    imul edi, edi, 0x2c
    mov ax, word [edi + 0x1c0bb0]
    xor ah, ah
    and al, 0x21
    db 0x66, 0x3d, 0x21, 0x00    ; cmp ax, 0x21
    jne short loc_039d
    mov byte [esi + 0x3cc], 1
    xor ecx, ecx
    mov byte [esi + 0x3a4], ah
    mov dword [esp + 0x30], ecx
    jmp near loc_0439
loc_039d:
    mov eax, 0x1c0ba4
    add eax, edi
    call 0x12be0
    test ax, ax
    je near loc_0439
    cmp byte [edi + 0x1c0bb8], 0x18
    jbe near loc_0439
    mov eax, dword [ebp + 8]
    sub eax, dword [edi + 0x1c0bac]
    test eax, eax
    jns short loc_03ce
    neg eax
loc_03ce:
    cmp eax, 0x5400
    jge short loc_0439
    mov edx, dword [edi + 0x1c0ba8]
    mov ecx, dword [esi + 0x218]
    mov eax, dword [edi + 0x1c0ba4]
    mov edi, dword [esi + 0x214]
    sub edx, ecx
    sub eax, edi
    call 0x65698
    lea edx, [eax + 0x200]
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    mov ebx, dword [esi + 0x24c]
    shl edx, 4
    sub ebx, edx
    and eax, 0x7ff
    mov dword [esi + 0x24c], ebx
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov ecx, dword [esi + 0x250]
    shl eax, 4
    sub ecx, eax
    mov dword [esi + 0x250], ecx
loc_0439:
    cmp word [ebp + 0x2a], 0
    jle short loc_0449
    mov eax, esi
    call 0x47da0
    jmp short loc_0458
loc_0449:
    mov word [ebp + 0x2a], 0
    mov word [esi + 0x38c], 0
loc_0458:
    mov ax, word [ebp + 0x2a]
    mov edi, dword [esi + 0x210]
    mov word [esi + 0x2a2], ax
    test edi, edi
    jle short loc_0478
    lea eax, [edi - 1]
    mov dword [esi + 0x210], eax
    jmp short loc_0482
loc_0478:
    mov dword [esi + 0x210], 0
loc_0482:
    mov ax, word [esi + 0x348]
    test ax, ax
    je near loc_05c9
    mov edx, eax
    inc edx
    mov word [esi + 0x348], dx
    cmp dx, 0x1c
    jne short loc_04d9
    cmp dword [0xe97a7], 1
    jne short loc_04b0
    call 0x22a30
loc_04b0:
    mov eax, 0xe
    call 0x5aa80
    mov byte [esi + 0x3f0], 0x40
    mov byte [esi + 0x3f1], 0x40
    mov byte [esi + 0x3f2], 0x40
    mov dword [esi + 0x274], 0x30
loc_04d9:
    cmp word [esi + 0x348], 0x2a
    jle near loc_05c9
    cmp byte [esi + 0x3ca], 0
    je short loc_0525
    cmp word [0xe92f5], 0
    jne short loc_0525
    mov ax, word [0xe97e7]
    inc eax
    mov word [0xe92f5], ax
    mov ax, word [0xe92fd]
    test ax, ax
    jle near loc_057e
    db 0x66, 0x3d, 0x0c, 0x00    ; cmp ax, 0xc
    jge short loc_057e
    cwde
    dec eax
    mov dword [0xe97e7], eax
    jmp short loc_057e
loc_0525:
    mov bx, word [0xe92f5]
    test bx, bx
    je short loc_0549
    movsx eax, bx
    xor edi, edi
    mov dword [0xe97e7], eax
    mov dword [0xe97d7], eax
    mov word [0xe92f5], di
    jmp short loc_0588
loc_0549:
    movsx eax, word [0xe92fd]
    cmp eax, dword [0xe97e7]
    jne short loc_0567
    test bx, bx
    jle short loc_0567
    movsx eax, bx
    mov dword [0xe97e7], eax
    jmp short loc_056d
loc_0567:
    inc dword [0xe97e7]
loc_056d:
    cmp dword [0xe97e7], 0xa
    jle short loc_057e
    xor ebx, ebx
    mov dword [0xe97e7], ebx
loc_057e:
    mov eax, dword [0xe97e7]
    mov dword [0xe97d7], eax
loc_0588:
    mov dl, 8
    movsx ecx, word [0x261210]
    jmp short loc_05b2
loc_0593:
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    db 0x0f, 0xbf, 0x0c, 0x4d, 0x08, 0x11, 0x26, 0x00    ; movsx ecx, word [ecx*2 + 0x261108]
    db 0x88, 0x14, 0x45, 0xa2, 0x52, 0x0b, 0x00    ; mov byte [eax*2 + 0xb52a2], dl
loc_05b2:
    test ecx, ecx
    jge short loc_0593
    mov word [esi + 0x348], 0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_05c9:
    mov di, word [esi + 0x358]
    cmp di, 1
    jle near loc_06ad
    cmp word [esi + 0x2a2], 0
    jle near loc_06ad
    mov edx, edi
    dec edx
    mov word [esi + 0x358], dx
    cmp dx, 0x82
    jne short loc_062c
    call 0x94a94
    call 0x5b280
    mov di, word [esi + 0x35a]
    test di, di
    jl near loc_06ad
    movsx eax, di
    call 0x5aa80
    mov edx, esi
    mov eax, 0x66
    call 0x15e90
    jmp near loc_06ad
loc_062c:
    cmp dx, 1
    jne near loc_06ad
    mov dh, 8
    movsx ecx, word [0x261210]
    jmp short loc_0660
loc_0641:
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    db 0x0f, 0xbf, 0x0c, 0x4d, 0x08, 0x11, 0x26, 0x00    ; movsx ecx, word [ecx*2 + 0x261108]
    db 0x88, 0x34, 0x45, 0xa2, 0x52, 0x0b, 0x00    ; mov byte [eax*2 + 0xb52a2], dh
loc_0660:
    test ecx, ecx
    jge short loc_0641
    mov bx, word [0xe92f5]
    test bx, bx
    je short loc_0690
    movsx eax, bx
    xor ecx, ecx
    mov dword [0xe97e7], eax
    mov dword [0xe97d7], eax
    mov word [0xe92f5], cx
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0690:
    mov ecx, dword [0xe97e7]
    inc ecx
    mov dword [0xe97e7], ecx
    mov dword [0xe97d7], ecx
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_06ad:
    mov ebx, dword [esi + 0x274]
    test ebx, ebx
    jle short loc_06c0
    lea ecx, [ebx - 1]
    mov dword [esi + 0x274], ecx
loc_06c0:
    mov ax, word [esi + 0x32c]
    test ax, ax
    jle short loc_06ee
    mov edx, eax
    dec dx
    mov word [esi + 0x32c], dx
    jne short loc_06ee
    mov cl, 1
    mov byte [0xe982d], cl
    mov byte [0xe982f], cl
    mov word [esi + 0x32e], dx
loc_06ee:
    cmp word [ebp + 0x2a], 0
    jg near loc_0b0d
    cmp word [esi + 0x382], 0
    jne near loc_09bb
    cmp byte [ebp + 0x11], 1
    je short loc_0745
    mov byte [esi + 0x3f0], 0x3f
    mov byte [esi + 0x3f1], 0
    mov byte [esi + 0x3f2], 0
    mov edi, dword [esi + 0x21c]
    mov dword [esi + 0x274], 0x3f
    sub edi, 0x1000
    mov dword [esi + 0x21c], edi
    sub dword [ebp + 8], 0x1000
loc_0745:
    cmp dword [0xe97a7], 1
    jne short loc_075c
    cmp dword [0xe97df], 2
    jge short loc_075c
    call 0x22a30
loc_075c:
    cmp byte [ebp + 0x11], 1
    je short loc_078e
    call 0x7079f
    xor ah, ah
    and al, 1
    mov edx, 0x200
    shl eax, 0xa
    sub edx, eax
    call 0x7079f
    xor ah, ah
    add eax, edx
    db 0x81, 0xe8, 0x00, 0x02, 0x00, 0x00    ; sub eax, 0x200
    and ah, 7
    mov word [esi + 0x382], ax
loc_078e:
    mov byte [esi + 0x3cb], 0
    mov eax, 0x32
    mov word [esi + 0x38e], 0xffff
    call 0x5ace0
    mov ecx, dword [esi + 0x39e]
    test ecx, ecx
    jle short loc_07cd
    mov eax, ecx
    call 0x94a78
    mov eax, 0xf5
    call 0x5b100
    mov dword [esi + 0x39e], 0
loc_07cd:
    cmp byte [ebp + 0x11], 1
    je short loc_07e2
    movsx eax, word [ebp + 0xc]
    test ah, 0x80
    jne short loc_07e2
    mov word [ebp + 0xc], 0
loc_07e2:
    cmp dword [0xe97df], 1
    jle near loc_09bb
    cmp byte [ebp + 0x11], 1
    jne short loc_0802
    movsx eax, word [ebp + 0xc]
    test ah, 0x80
    je near loc_09bb
loc_0802:
    mov edi, dword [esp + 0x34]
    mov ax, word [esi + 0x394]
    cmp ax, di
    je near loc_0966
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0xff, 0x04, 0x45, 0xca, 0x51, 0x0b, 0x00    ; inc word [eax*2 + 0xb51ca]
    movsx ebx, word [esi + 0x394]
    movsx edx, di
    shl ebx, 5
    inc word [ebx + edx*2 + 0x4c460]
    movsx ebx, word [esi + 0x394]
    mov eax, ebx
    shl eax, 5
    cmp byte [eax + 0xe8d84], 0
    je near loc_08f9
    cmp di, word [0xe8cc6]
    jne short loc_0891
    add eax, 0xe8d84
    push eax
    push 0x2f24
    push 0xbab20
    call 0xa27b9
    add esp, 0xc
    mov edx, esi
    mov eax, 0x73
    call 0x15e90
    jmp near loc_096d
loc_0891:
    mov eax, edx
    shl eax, 5
    add eax, 0xe8d84
    push eax
    push 0x2f34
    push 0xbab60
    call 0xa27b9
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    add esp, 0xc
    add eax, 0xb4f00
    call 0x47e70
    movsx edx, word [esi + 0x394]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    add edx, eax
    mov eax, 0x74
    call 0x15e90
    jmp near loc_096d
loc_08f9:
    mov eax, edi
    cmp ax, word [0xe8cc6]
    jne short loc_0926
    inc ebx
    push ebx
    push 0x2f40
    push 0xbab20
    call 0xa27b9
    add esp, 0xc
    mov edx, esi
    mov eax, 0x73
    call 0x15e90
    jmp short loc_096d
loc_0926:
    inc edx
    push edx
    push 0x2f58
    push 0xbab60
    call 0xa27b9
    movsx edx, word [esi + 0x394]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    add esp, 0xc
    add edx, eax
    mov eax, 0x74
    call 0x15e90
    jmp short loc_096d
loc_0966:
    inc word [esi + 0x2cc]
loc_096d:
    mov ax, word [0x261216]
    cmp ax, word [0x261210]
    jne short loc_09a8
    movsx eax, word [esp + 0x34]
    inc eax
    push eax
    movsx eax, word [esi + 0x394]
    inc eax
    push eax
    push 0x2f6c
    push 0xbc0a0
    call 0xa27b9
    add esp, 0x10
    mov eax, 0xbc0a0
    call 0x219b0
loc_09a8:
    mov eax, dword [esp + 0x34]
    mov ch, 1
    mov word [esi + 0x394], ax
    mov byte [0xe982f], ch
loc_09bb:
    cmp word [esp + 0x30], 2
    jne near loc_0a3b
    cmp byte [esi + 0x3a3], 0
    jne short loc_09f5
    mov edx, dword [esp + 0xc]
    mov eax, dword [esi + 0x21c]
    sub eax, edx
    test eax, eax
    jns short loc_09e2
    neg eax
loc_09e2:
    cmp eax, 0x1300
    jle short loc_0a06
    add dword [esi + 0x21c], 0x15c
    jmp short loc_0a06
loc_09f5:
    mov eax, dword [ebp + 8]
    mov word [ebp + 0x24], 0xfea4
    sub eax, 0x200
    mov dword [ebp + 8], eax
loc_0a06:
    push 0x10001
    push 0x400
    push 0x400
    lea ecx, [esi + 0x29e]
    push 0xa4
    lea ebx, [esi + 0x21c]
    push 0
    lea edx, [esi + 0x218]
    push 0
    lea eax, [esi + 0x214]
    call 0x6cb75
loc_0a3b:
    mov eax, dword [esi + 0x218]
    mov dword [esi + 0x220], 0x64
    mov dword [esi + 0x23c], eax
    mov eax, dword [esi + 0x21c]
    mov dword [esi + 0x240], eax
    mov ax, word [esi + 0x298]
    mov word [esi + 0x29a], ax
    lea ecx, [esi + 0x29e]
    mov eax, dword [esi + 0x244]
    mov edx, dword [esi + 0x218]
    mov dword [esi + 0x248], eax
    mov ebx, ecx
    mov eax, dword [esi + 0x214]
    mov word [esi + 0x318], 0
    call 0x6e997
    push 0x10001
    push 0x1400
    lea ebx, [esi + 0x21c]
    push 0x400
    lea edx, [esi + 0x218]
    push 0x80
    lea eax, [esi + 0x214]
    call 0x6e5e4
    mov eax, dword [esp + 8]
    mov ecx, dword [esp + 0xc]
    add eax, 0x1000
    cmp eax, ecx
    jge short loc_0afc
    cmp byte [ebp + 0x11], 1
    je short loc_0afc
    mov edi, dword [esi + 0x21c]
    lea edx, [ecx + edi]
    movsx eax, word [esi + 0x382]
    sar edx, 7
    add eax, edx
    and eax, 0x7ff
    mov word [esi + 0x380], ax
loc_0afc:
    mov byte [esi + 0x3a3], 0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0b0d:
    mov di, word [esi + 0x396]
    test di, di
    jle short loc_0b38
    mov eax, edi
    dec ax
    mov word [esi + 0x396], ax
    jne short loc_0b38
    cmp byte [esi + 0x3a3], 0
    je short loc_0b38
    mov word [esi + 0x396], 2
loc_0b38:
    mov bx, word [esi + 0x396]
    test bx, bx
    jge short loc_0b4e
    mov ecx, ebx
    inc ecx
    mov word [esi + 0x396], cx
loc_0b4e:
    cmp word [esi + 0x31e], 0
    jge near loc_2b0b
    mov edi, 4
    mov ax, word [esi + 0x380]
    mov dword [esp + 0x28], edi
    test ax, ax
    jle short loc_0b7b
    cwde
    mov edx, eax
    sar edx, 1
    inc edx
    sub eax, edx
    jmp short loc_0b87
loc_0b7b:
    jge short loc_0b8e
    cwde
    mov edx, eax
    neg edx
    sar edx, 1
    inc edx
    add eax, edx
loc_0b87:
    mov word [esi + 0x380], ax
loc_0b8e:
    movsx eax, word [esi + 0x2a0]
    mov edx, eax
    sar edx, 2
    sub eax, edx
    mov word [esi + 0x2a0], ax
    test byte [esp + 0x18], 0x40
    je short loc_0bcf
    mov bx, word [esi + 0x2a0]
    mov cx, word [esi + 0x380]
    sub ebx, 0x98
    add ecx, 0x18
    mov word [esi + 0x2a0], bx
    mov word [esi + 0x380], cx
loc_0bcf:
    test byte [esp + 0x18], 0x80
    je short loc_0bfb
    mov di, word [esi + 0x2a0]
    mov ax, word [esi + 0x380]
    add edi, 0x98
    sub eax, 0x18
    mov word [esi + 0x2a0], di
    mov word [esi + 0x380], ax
loc_0bfb:
    cmp word [esi + 0x33e], 0
    jge near loc_1e4b
    movsx edx, word [esp + 0x34]
    lea eax, [edx*4]
    add eax, edx
    db 0x8a, 0x04, 0x45, 0x60, 0x02, 0x0e, 0x00    ; mov al, byte [eax*2 + 0xe0260]
    movsx ebx, al
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    mov bx, word [ebp + 0x20]
    mov edi, eax
    cmp bx, 0x20
    jl short loc_0c4b
    cmp byte [esi + 0x3a8], 0
    je short loc_0c4b
    mov eax, dword [esi + 0x26c]
    cmp eax, 0x400
    jne short loc_0c82
loc_0c4b:
    mov eax, dword [esi + 0x270]
    and eax, 0x7ff
    cmp eax, 0x460
    jle short loc_0c66
    sub dword [esi + 0x270], 0x60
    jmp short loc_0c88
loc_0c66:
    cmp eax, 0x3a0
    jge short loc_0c76
    add dword [esi + 0x270], 0x60
    jmp short loc_0c88
loc_0c76:
    mov dword [esi + 0x270], 0x400
    jmp short loc_0c88
loc_0c82:
    mov dword [esi + 0x270], eax
loc_0c88:
    mov edx, dword [esi + 0x214]
    sub edx, dword [esi + 0x230]
    imul edx, edx
    mov eax, dword [esi + 0x218]
    sub eax, dword [esi + 0x234]
    imul eax, eax
    add eax, edx
    call 0x6577d
    mov word [ebp + 0x20], ax
    cmp byte [esi + 0x3a8], 0
    je short loc_0cdb
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x1c0bc4]
    mov ecx, dword [esi + 0x26c]
    sar eax, 1
    add ecx, eax
    mov dword [esi + 0x26c], ecx
loc_0cdb:
    cmp byte [0xe8d83], 0
    jne short loc_0d2c
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385bc], 0x230
    je short loc_0d12
    mov ax, word [esi + 0x29e]
    test ax, ax
    jl short loc_0d12
    cmp ax, 0x400
    jl short loc_0d2c
loc_0d12:
    mov eax, dword [esi + 0x238]
    mov dword [esi + 0x214], eax
    mov eax, dword [esi + 0x23c]
    mov dword [esi + 0x218], eax
    jmp short loc_0d44
loc_0d2c:
    mov eax, dword [esi + 0x214]
    mov dword [esi + 0x238], eax
    mov eax, dword [esi + 0x218]
    mov dword [esi + 0x23c], eax
loc_0d44:
    mov eax, dword [esi + 0x214]
    mov dword [esi + 0x230], eax
    mov eax, dword [esi + 0x218]
    mov dword [esi + 0x234], eax
    mov eax, dword [esi + 0x21c]
    mov dword [esi + 0x240], eax
    mov eax, dword [esi + 0x244]
    mov dword [esi + 0x248], eax
    mov ax, word [esi + 0x298]
    mov bx, word [esi + 0x34a]
    mov word [esi + 0x29a], ax
    test bx, bx
    jge short loc_0db0
    mov ecx, ebx
    mov ax, word [esi + 0x298]
    add ecx, 0x80
    add eax, 0x80
    mov word [esi + 0x34a], cx
    mov word [esi + 0x298], ax
loc_0db0:
    mov edx, dword [esp + 0x30]
    mov ecx, 0x28
    cmp dx, 2
    jne near loc_0fee
    add word [esi + 0x390], 0x20
    and byte [esi + 0x391], 7
    movsx eax, word [esi + 0x390]
    mov word [esi + 0x324], 0
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    sar eax, 7
    mov dword [esi + 0x244], eax
    mov edi, dword [0xe7849]
    test edi, edi
    jne near loc_0ec6
    mov bh, byte [esp + 0x18]
    test bh, 1
    je short loc_0e48
    cmp dword [esi + 0x254], 0
    jle short loc_0e1d
    mov dword [esi + 0x254], 0
loc_0e1d:
    mov eax, dword [esi + 0x254]
    sub eax, 0x15c
    mov dword [esi + 0x254], eax
    cmp eax, 0xfffffa00
    jge near loc_0ec6
    mov dword [esi + 0x254], 0xfffffa00
    jmp near loc_0ec6
loc_0e48:
    test bh, 2
    je short loc_0e82
    cmp dword [esi + 0x254], 0
    jge short loc_0e5c
    mov dword [esi + 0x254], edi
loc_0e5c:
    mov ebx, dword [esi + 0x254]
    add ebx, 0x15c
    mov dword [esi + 0x254], ebx
    cmp ebx, 0x600
    jle short loc_0ec6
    mov dword [esi + 0x254], 0x600
    jmp short loc_0ec6
loc_0e82:
    mov eax, dword [esi + 0x254]
    test eax, eax
    jge short loc_0ea2
    lea edx, [eax + 0x100]
    mov dword [esi + 0x254], edx
    test edx, edx
    jle short loc_0ea2
    mov dword [esi + 0x254], edi
loc_0ea2:
    mov ecx, dword [esi + 0x254]
    test ecx, ecx
    jle short loc_0ec6
    lea edi, [ecx - 0x100]
    mov dword [esi + 0x254], edi
    test edi, edi
    jge short loc_0ec6
    mov dword [esi + 0x254], 0
loc_0ec6:
    mov ebx, dword [esi + 0x254]
    cmp ebx, 0x800
    jle short loc_0ede
    mov ecx, ebx
    sar ecx, 1
    mov dword [esi + 0x254], ecx
loc_0ede:
    mov eax, dword [esi + 0x254]
    mov edi, dword [esi + 0x21c]
    add edi, eax
    mov dword [esi + 0x21c], edi
    mov eax, dword [esp + 0xc]
    sub eax, 0xf00
    cmp eax, edi
    jge short loc_0f0c
    sub eax, edi
    sar eax, 1
    lea ecx, [edi + eax]
    mov dword [esi + 0x21c], ecx
loc_0f0c:
    mov eax, dword [esp + 8]
    mov edi, dword [esi + 0x21c]
    add eax, 0x400
    cmp eax, edi
    jle short loc_0f2f
    mov dword [esi + 0x254], 0
    mov dword [esi + 0x21c], eax
loc_0f2f:
    cmp byte [esi + 0x3ce], 0
    je near loc_181f
    call 0x7079f
    and eax, 0xff
    cmp eax, 8
    jge near loc_181f
    movsx eax, word [esp + 0x3c]
    mov edx, 0x295
    call 0x19320
    movsx edi, ax
    imul edi, edi, 0x2c
    mov ax, word [0xe8cca]
    xor ah, ah
    movsx edx, word [esi + 0x298]
    and al, 0x80
    add edx, 0x240
    cwde
    sub edx, eax
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    mov ebx, dword [edi + 0x1c0ba4]
    sar edx, 6
    add ebx, edx
    mov dword [edi + 0x1c0ba4], ebx
    movsx edx, word [esi + 0x298]
    add edx, 0x40
    sub edx, eax
    mov eax, edx
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov ecx, dword [edi + 0x1c0ba8]
    sar eax, 6
    add ecx, eax
    mov al, 3
    mov dword [edi + 0x1c0ba8], ecx
    mov byte [edi + 0x1c0bb8], al
    mov byte [edi + 0x1c0bb9], 2
    mov eax, dword [esi + 0x21c]
    add eax, 0x800
    mov dword [edi + 0x1c0bac], eax
    jmp near loc_181f
loc_0fee:
    cmp byte [esi + 0x3cb], 0
    je near loc_116c
    mov byte [esi + 0x3a8], 0
    mov cx, word [esi + 0x390]
    mov word [esi + 0x324], 0
    add ecx, 0x20
    mov word [esi + 0x390], cx
    mov dh, byte [esi + 0x391]
    mov byte [esi + 0x3ed], 0
    and dh, 7
    mov byte [esi + 0x391], dh
    movsx eax, word [esi + 0x390]
    mov byte [esi + 0x3d2], 0
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    sar eax, 7
    mov bl, byte [esi + 0x3cb]
    mov dword [esi + 0x244], eax
    cmp bl, 0xb
    jae short loc_107d
    mov ch, bl
    xor eax, eax
    inc ch
    mov al, ch
    mov edx, dword [esi + 0x21c]
    shl eax, 7
    mov byte [esi + 0x3cb], ch
    sub edx, eax
    mov dword [esi + 0x21c], edx
    jmp short loc_109b
loc_107d:
    jne short loc_109b
    cmp dword [0xe7863], 1
    jge short loc_109b
    cmp byte [esp + 0x44], 0
    je short loc_1096
    mov edi, 0x200
    jmp short loc_109b
loc_1096:
    mov edi, 0x800
loc_109b:
    test byte [esp + 0x18], 1
    je short loc_10ba
    mov ebx, dword [esi + 0x21c]
    mov dword [esi + 0x27c], 0x309
    sub ebx, edi
    mov dword [esi + 0x21c], ebx
loc_10ba:
    test byte [esp + 0x18], 2
    je short loc_10d9
    mov ecx, dword [esi + 0x21c]
    mov dword [esi + 0x27c], 0x309
    add ecx, edi
    mov dword [esi + 0x21c], ecx
loc_10d9:
    cmp byte [esp + 0x44], 0
    jne short loc_10f6
    mov edi, dword [esp + 0x30]
    test di, di
    je short loc_10ef
    cmp di, 2
    jne short loc_10f6
loc_10ef:
    mov ecx, 0x20
    jmp short loc_10fb
loc_10f6:
    mov ecx, 0x10
loc_10fb:
    cmp word [esp + 0x30], 2
    je short loc_1113
    cmp byte [esi + 0x3ce], 1
    jne short loc_1113
    mov byte [esi + 0x3ce], 0
loc_1113:
    mov eax, ecx
    mov edx, dword [esp + 0xc]
    shl eax, 8
    sub edx, eax
    mov edi, dword [esi + 0x21c]
    mov eax, edx
    cmp edx, edi
    jge short loc_1137
    sub eax, edi
    sar eax, 1
    lea ebx, [edi + eax]
    mov dword [esi + 0x21c], ebx
loc_1137:
    movsx edx, word [esp + 0x3c]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + 0x4e9ef]
    mov ecx, dword [esi + 0x21c]
    add eax, 0x1200
    cmp eax, ecx
    jle near loc_181f
    jmp near loc_1819
loc_116c:
    cmp dx, 2
    je near loc_181f
    cmp word [esi + 0x326], 0x186
    je short loc_118a
    mov word [esi + 0x326], 0x186
loc_118a:
    cmp byte [esi + 0x3ce], 1
    jne short loc_119a
    mov byte [esi + 0x3ce], 0
loc_119a:
    cmp word [esp + 0x30], 1
    jne near loc_1276
    cmp byte [esi + 0x3cc], 0
    jne near loc_1276
    cmp byte [esp + 0x44], 0
    jne short loc_11e8
    add word [esi + 0x390], 0x20
    and byte [esi + 0x391], 7
    movsx eax, word [esi + 0x390]
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    sar eax, 6
    mov ecx, 0x22
    mov dword [esi + 0x244], eax
    jmp short loc_11ed
loc_11e8:
    mov ecx, 0xc
loc_11ed:
    cmp byte [esp + 0x44], 0
    jne near loc_13da
    cmp dword [esp + 0x20], 0x2600
    jg near loc_13da
    cmp byte [esi + 0x3a8], 1
    jne near loc_13da
    movsx eax, word [esi + 0x34e]
    cmp eax, -1
    jne short loc_1235
    movsx eax, word [esp + 0x3c]
    mov edx, 0x58c
    call 0x19320
    mov word [esi + 0x34e], ax
loc_1235:
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    mov byte [esi + 0x3a4], 6
    cmp word [eax*8 + 0x2385bc], 0xc8
    jne short loc_1261
    mov byte [esi + 0x3cf], 8
    jmp short loc_1268
loc_1261:
    mov byte [esi + 0x3cf], 0
loc_1268:
    mov word [esi + 0x39a], 0
    jmp near loc_13da
loc_1276:
    cmp byte [esi + 0x3a4], 0
    jbe near loc_13da
    cmp byte [esi + 0x3a8], 0
    je near loc_13da
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    test byte [eax*8 + 0x2385b2], 2
    jne near loc_13da
    movsx eax, word [esp + 0x40]
    db 0x0f, 0xbf, 0x3c, 0x45, 0xc4, 0x5c, 0x24, 0x00    ; movsx edi, word [eax*2 + 0x245cc4]
    jmp short loc_1322
loc_12bd:
    imul eax, edi, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    cmp dx, 0x226
    je short loc_12e3
    cmp dx, 0x2a0
    je short loc_12e3
    cmp dx, 0x2a1
    je short loc_12e3
    cmp dx, 0x2a2
    jne short loc_131a
loc_12e3:
    imul edx, edi, 0x2c
    mov ebx, dword [esi + 0x214]
    mov eax, dword [edx + 0x1c0ba4]
    sub eax, ebx
    test eax, eax
    jns short loc_12fa
    neg eax
loc_12fa:
    cmp eax, 0x180
    jge short loc_131a
    mov eax, dword [edx + 0x1c0ba8]
    sub eax, dword [esi + 0x218]
    test eax, eax
    jns short loc_1313
    neg eax
loc_1313:
    cmp eax, 0x180
    jl short loc_1326
loc_131a:
    db 0x0f, 0xbf, 0x3c, 0x7d, 0xa4, 0xc8, 0x1b, 0x00    ; movsx edi, word [edi*2 + 0x1bc8a4]
loc_1322:
    test edi, edi
    jge short loc_12bd
loc_1326:
    test edi, edi
    jge near loc_13da
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    mov bl, byte [esi + 0x3a4]
    add eax, edx
    dec bl
    lea eax, [eax*8]
    mov byte [esi + 0x3a4], bl
    cmp word [eax + 0x2385c6], 0
    jne near loc_13da
    cmp word [eax + 0x2385c8], 0
    jne near loc_13da
    call 0x7079f
    and eax, 3
    cmp eax, 1
    jb short loc_1385
    jbe short loc_1395
    cmp eax, 2
    je short loc_13a1
    jmp short loc_13ad
loc_1385:
    test eax, eax
    jne short loc_13ad
    movsx eax, word [esp + 0x3c]
    mov edx, 0x226
    jmp short loc_13b7
loc_1395:
    movsx eax, word [esp + 0x3c]
    mov edx, 0x2a0
    jmp short loc_13b7
loc_13a1:
    movsx eax, word [esp + 0x3c]
    mov edx, 0x2a1
    jmp short loc_13b7
loc_13ad:
    movsx eax, word [esp + 0x3c]
    mov edx, 0x2a2
loc_13b7:
    call 0x19320
    movsx edi, ax
    imul edi, edi, 0x2c
    mov al, byte [esi + 0x3cf]
    mov byte [edi + 0x1c0bb5], al
    mov al, byte [esi + 0x39a]
    mov byte [edi + 0x1c0bb4], al
loc_13da:
    mov edi, ecx
    mov eax, dword [esp + 0xc]
    shl edi, 8
    sub eax, edi
    mov ebx, dword [esi + 0x21c]
    mov edi, eax
    cmp eax, ebx
    jle near loc_1544
    test byte [esp + 0x18], 3
    jne short loc_1436
    cmp byte [esi + 0x3a8], 0
    je short loc_1436
    movsx edx, word [esp + 0x40]
    lea eax, [edx*4]
    add eax, edx
    test byte [eax*8 + 0x2385b2], 2
    je short loc_1436
    lea eax, [edi - 0x1000]
    cmp eax, dword [esi + 0x21c]
    jg short loc_1436
    mov dword [esi + 0x21c], edi
    jmp near loc_16dd
loc_1436:
    mov byte [esi + 0x3a8], 0
    mov eax, dword [0xe7050]
    mov edi, dword [esi + 0x254]
    add eax, 0x50
    add edi, eax
    mov dword [esi + 0x254], edi
    cmp edi, 0x1800
    jl short loc_1465
    mov dword [esi + 0x254], 0x1800
loc_1465:
    cmp dword [esi + 0x254], 0x960
    jle short loc_1486
    mov dh, byte [esi + 0x3d2]
    cmp dh, 0xff
    jae short loc_1486
    mov bl, dh
    inc bl
    mov byte [esi + 0x3d2], bl
loc_1486:
    mov eax, dword [esp + 0xc]
    mov edx, dword [esi + 0x21c]
    mov ebx, dword [esi + 0x254]
    shl ecx, 8
    add edx, ebx
    sub eax, ecx
    cmp edx, eax
    jl near loc_16dd
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385c6], 1
    je near loc_16dd
    mov bh, byte [esi + 0x3d2]
    cmp bh, 0x3e
    jbe short loc_14db
    mov eax, esi
    call 0x47e70
    jmp near loc_16dd
loc_14db:
    cmp bh, 9
    jbe near loc_16dd
    call 0x7079f
    xor ah, ah
    movzx edi, bh
    and al, 3
    sub edi, eax
    mov ax, word [ebp + 0x2a]
    sub eax, edi
    mov word [ebp + 0x2a], ax
    test ax, ax
    jg short loc_1520
    mov byte [esi + 0x3f0], 0x3f
    mov byte [esi + 0x3f1], 0
    mov byte [esi + 0x3f2], 0
    mov dword [esi + 0x274], 0x3f
loc_1520:
    mov byte [esi + 0x3f0], 0x10
    mov byte [esi + 0x3f1], 0
    mov byte [esi + 0x3f2], 0
    mov dword [esi + 0x274], 0x20
    jmp near loc_16dd
loc_1544:
    mov edi, dword [esi + 0x39e]
    mov byte [esi + 0x3d2], 0
    test edi, edi
    jle short loc_1566
    mov eax, edi
    call 0x94a78
    mov dword [esi + 0x39e], 0
loc_1566:
    mov ebx, dword [esp + 0x30]
    cmp bx, 1
    je short loc_1595
    cmp bx, 2
    je short loc_1595
    cmp byte [esi + 0x3a8], 0
    jne short loc_1595
    mov eax, dword [esi + 0x254]
    cmp eax, 0xc00
    jle short loc_1595
    sar eax, 0xa
    mov byte [esi + 0x3ed], al
loc_1595:
    mov byte [esi + 0x3a8], 1
    cmp ecx, 0x28
    jne short loc_15f7
    mov eax, dword [esp + 0xc]
    shl ecx, 8
    sub eax, ecx
    mov edx, dword [esi + 0x21c]
    mov ecx, eax
    sub ecx, edx
    sar ecx, 1
    mov eax, ecx
    test eax, eax
    jns short loc_15be
    neg eax
loc_15be:
    cmp eax, 0x100
    jge short loc_15c7
    xor ecx, ecx
loc_15c7:
    mov ebx, dword [esi + 0x21c]
    add ebx, ecx
    mov ecx, dword [esi + 0x254]
    mov dword [esi + 0x21c], ebx
    sub ecx, 0x300
    mov dword [esi + 0x254], ecx
    test ecx, ecx
    jge short loc_1648
    mov dword [esi + 0x254], 0
    jmp short loc_1648
loc_15f7:
    cmp word [esi + 0x324], 0
    jne short loc_1648
    mov eax, dword [esp + 0xc]
    shl ecx, 7
    mov edx, dword [esi + 0x21c]
    sub eax, ecx
    sub eax, edx
    sar eax, 1
    lea ebx, [edx + eax]
    mov cl, byte [esi + 0x3a3]
    mov dword [esi + 0x21c], ebx
    test cl, cl
    jne short loc_1648
    mov eax, dword [esp + 0xc]
    sub eax, 0x1000
    cmp eax, ebx
    jge short loc_1648
    mov edi, dword [esi + 0x254]
    mov dword [esi + 0x21c], eax
    sar edi, 1
    mov dword [esi + 0x254], edi
loc_1648:
    mov ch, byte [esp + 0x18]
    mov byte [esi + 0x3a3], 0
    test ch, 2
    je short loc_1673
    mov eax, dword [esi + 0x21c]
    mov dword [esi + 0x27c], 0x309
    add eax, 0xb00
    mov dword [esi + 0x21c], eax
loc_1673:
    test byte [esp + 0x18], 1
    jne short loc_168c
    cmp byte [esi + 0x3a6], 1
    jne short loc_168c
    mov byte [esi + 0x3a6], 0
    jmp short loc_16c5
loc_168c:
    test byte [esp + 0x18], 1
    je short loc_16c5
    cmp byte [esi + 0x3a6], 0
    jne short loc_16c5
    cmp word [esi + 0x324], 0
    jne short loc_16c5
    mov eax, dword [esp + 0xc]
    sub eax, dword [esp + 8]
    cmp eax, 0x3800
    jle short loc_16c5
    mov word [esi + 0x324], 1
    mov byte [esi + 0x3a6], 1
loc_16c5:
    cmp word [esi + 0x324], 0
    je short loc_16dd
    test byte [esp + 0x18], 1
    jne short loc_16dd
    mov byte [esi + 0x3a6], 0
loc_16dd:
    cmp word [esi + 0x324], 0
    je near loc_17b5
    test byte [esp + 0x18], 1
    jne short loc_1702
    cmp byte [esi + 0x3a6], 1
    jne short loc_1702
    mov byte [esi + 0x3a6], 0
loc_1702:
    mov cx, word [esi + 0x324]
    cmp cx, 0x500
    jge near loc_17a2
    cmp word [esp + 0x30], 1
    jne short loc_173b
    cmp cx, 0x200
    jle short loc_173b
    mov word [esi + 0x324], 0
    mov dword [esi + 0x254], 0xfffffe00
    jmp near loc_17b5
loc_173b:
    movsx eax, word [esi + 0x324]
    add eax, 0x780
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov ecx, dword [esi + 0x254]
    sar eax, 4
    sub ecx, eax
    mov dword [esi + 0x254], ecx
    mov edi, dword [0x925c]
    cmp edi, 0x14
    jle short loc_177b
    add word [esi + 0x324], 0x19a
    jmp short loc_1799
loc_177b:
    cmp edi, 0xa
    jle short loc_1790
    add byte [esi + 0x325], 2
    mov byte [esi + 0x3a8], 0
    jmp short loc_17b5
loc_1790:
    add word [esi + 0x324], 0x338
loc_1799:
    mov byte [esi + 0x3a8], 0
    jmp short loc_17b5
loc_17a2:
    mov word [esi + 0x324], 0
    mov dword [esi + 0x254], 0
loc_17b5:
    mov eax, dword [esi + 0x254]
    mov edx, dword [esi + 0x21c]
    lea eax, [eax*4]
    add edx, eax
    mov dword [esi + 0x21c], edx
    mov eax, dword [esp + 8]
    add eax, 0x400
    cmp eax, edx
    jle short loc_181f
    mov ecx, dword [esi + 0x254]
    mov word [esi + 0x324], 0
    test ecx, ecx
    jge short loc_1806
    mov dword [esi + 0x250], 0
    mov eax, dword [esi + 0x250]
    mov dword [esi + 0x24c], eax
loc_1806:
    mov dword [esi + 0x254], 0x80
    mov eax, dword [esp + 8]
    add eax, 0x400
loc_1819:
    mov dword [esi + 0x21c], eax
loc_181f:
    cmp word [esi + 0x348], 0
    jne short loc_186d
    cmp word [esi + 0x396], 2
    jg short loc_186d
    cmp byte [esi + 0x3ed], 0
    jne short loc_186d
    cmp word [esi + 0x32a], 0
    jg short loc_186d
    cmp word [esi + 0x328], 0
    jg short loc_186d
    cmp word [esi + 0x312], 0xd
    jne short loc_1884
    mov eax, dword [esp + 0x2c]
    mov cx, word [eax]
    cmp cx, 1
    jle short loc_1884
    cmp cx, 4
    jge short loc_1884
loc_186d:
    xor edi, edi
    mov dword [esi + 0x24c], edi
    mov dword [esp + 0x28], edi
    mov dword [esi + 0x250], edi
    jmp near loc_190b
loc_1884:
    movsx edx, word [esp + 0x34]
    lea eax, [edx*4]
    add eax, edx
    add eax, eax
    mov dh, byte [eax + 0xe0260]
    test dh, dh
    je short loc_190b
    movsx edx, dh
    mov eax, dword [esp + 0x30]
    add edx, edx
    db 0x66, 0x3d, 0x02, 0x00    ; cmp ax, 2
    jne short loc_18cd
    mov eax, edx
    sar eax, 3
    mov ebx, dword [esp + 0x28]
    sub edx, eax
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul eax, edx
    mov word [esi + 0x29c], ax
    jmp short loc_18e4
loc_18cd:
    mov ebx, dword [esp + 0x28]
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul edx, eax
    mov word [esi + 0x29c], dx
loc_18e4:
    mov ax, word [esi + 0x29c]
    add word [esi + 0x298], ax
    mov bl, byte [esi + 0x299]
    mov dword [esi + 0x27c], 0x309
    and bl, 7
    mov byte [esi + 0x299], bl
loc_190b:
    cmp byte [esi + 0x3cc], 0
    jne near loc_1b46
    movsx edx, word [ebp + 0x18]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    movsx edi, word [eax + 0x2385bc]
    cmp edi, 0x1090
    je short loc_1946
    cmp word [eax + 0x2385b4], 0x1090
    jne short loc_199b
loc_1946:
    mov cx, word [esi + 0x39c]
    test cx, cx
    jle short loc_1978
    mov edx, ecx
    dec edx
    mov word [esi + 0x39c], dx
    mov bx, word [esi + 0x39c]
    mov byte [esi + 0x3c9], 7
    test bx, bx
    jg short loc_199b
    mov eax, esi
    call 0x27700
    jmp short loc_199b
loc_1978:
    mov byte [esi + 0x3f0], 0
    mov byte [esi + 0x3f1], 8
    mov byte [esi + 0x3f2], 0
    mov dword [esi + 0x274], 0x20
    dec word [ebp + 0x2a]
loc_199b:
    mov al, byte [esi + 0x3a8]
    xor ecx, ecx
    test al, al
    je near loc_1b19
    cmp dword [esp + 0x20], 0x3600
    jg near loc_1b19
    cmp edi, 0x43a
    jb short loc_19ea
    jbe near loc_1ac6
    cmp edi, 0xea0
    jb near loc_1b19
    jbe near loc_1a83
    cmp edi, 0xea3
    je near loc_1a83
    jmp near loc_1b19
loc_19ea:
    cmp edi, 0xc8
    jb near loc_1b19
    jbe near loc_1a92
    cmp edi, 0x35b
    jne near loc_1b19
    call 0x7079f
    sar eax, 8
    cmp eax, 0xdf
    jl near loc_1b19
    cmp word [esi + 0x39c], 0
    jle short loc_1a2f
    mov ecx, 1
    jmp near loc_1b19
loc_1a2f:
    mov byte [esi + 0x3f0], 0x40
    mov byte [esi + 0x3f1], 0x40
    mov byte [esi + 0x3f2], 0x40
    mov dword [esi + 0x274], 0x20
    call 0x7079f
    xor ah, ah
    and al, 3
    mov di, word [ebp + 0x2a]
    inc eax
    sub edi, eax
    mov word [ebp + 0x2a], di
    cmp dword [0xe76ea], 1
    jge near loc_1b19
    movsx edx, word [esp + 0x3c]
    mov eax, 0x15
    call 0x5aca0
    jmp near loc_1b19
loc_1a83:
    mov eax, 0x2f80
    call 0x16030
    jmp near loc_1b19
loc_1a92:
    call 0x7079f
    sar eax, 8
    cmp eax, 0xef
    jl near loc_1b19
    cmp word [esi + 0x39c], 0
    jle short loc_1ab6
    mov ecx, 1
    jmp short loc_1b19
loc_1ab6:
    mov byte [esi + 0x3f0], 0
    mov byte [esi + 0x3f1], 8
    jmp short loc_1af4
loc_1ac6:
    call 0x7079f
    sar eax, 8
    cmp eax, 0xdf
    jl short loc_1b19
    cmp word [esi + 0x39c], 0
    jle short loc_1ae6
    mov ecx, 1
    jmp short loc_1b19
loc_1ae6:
    mov byte [esi + 0x3f0], 8
    mov byte [esi + 0x3f1], 0
loc_1af4:
    mov byte [esi + 0x3f2], 0
    mov dword [esi + 0x274], 0x20
    call 0x7079f
    xor ah, ah
    and al, 3
    mov dx, word [ebp + 0x2a]
    inc eax
    sub edx, eax
    mov word [ebp + 0x2a], dx
loc_1b19:
    test ecx, ecx
    je short loc_1b46
    mov eax, 0x4b
    mov edx, esi
    call 0x15e90
    mov bx, word [esi + 0x39c]
    sub ebx, 2
    mov word [esi + 0x39c], bx
    test bx, bx
    jg short loc_1b46
    mov eax, esi
    call 0x27700
loc_1b46:
    cmp dword [esi + 0x24c], 0
    jne short loc_1b80
    cmp dword [esi + 0x250], 0
    jne short loc_1b80
    movsx edx, word [esp + 0x34]
    lea eax, [edx*4]
    add eax, edx
    add eax, eax
    cmp word [eax + 0xe0262], 0
    jne short loc_1b80
    cmp word [eax + 0xe0264], 0
    je near loc_1e4b
loc_1b80:
    mov eax, dword [esi + 0x26c]
    and eax, 0x7ff
    mov dword [esi + 0x27c], 0x309
    db 0x0f, 0xbf, 0x0c, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx ecx, word [eax*2 + 0x1b7fa4]
    mov edi, dword [esp + 0x20]
    sar ecx, 0xc
    cmp edi, 0x2e00
    jge near loc_1c6d
    cmp ecx, 1
    je short loc_1bbe
    cmp ecx, 3
    jne near loc_1c59
loc_1bbe:
    cmp byte [esi + 0x3cc], 0
    jne near loc_1c6d
    cmp byte [esi + 0x3eb], 0
    jne near loc_1c6d
    cmp byte [esi + 0x3a8], 0
    je near loc_1c6d
    mov ebx, dword [esp + 0x30]
    test bx, bx
    jbe short loc_1bf9
    cmp bx, 1
    je short loc_1c47
    jmp near loc_1c6d
loc_1bf9:
    mov eax, dword [esp]
    test eax, eax
    jl short loc_1c18
    and eax, 0xfff
    cmp eax, 0xc000
    jne short loc_1c18
    imul eax, eax, 0x2c
    movsx edi, word [eax + 0x1c0bb2]
    jmp short loc_1c2e
loc_1c18:
    movsx edx, word [esp + 0x40]
    lea eax, [edx*4]
    add eax, edx
    movsx edi, word [eax*8 + 0x2385bc]
loc_1c2e:
    cmp edi, 0x156
    jb short loc_1c6d
    cmp edi, 0x157
    ja short loc_1c6d
    mov byte [esi + 0x3eb], 1
    jmp short loc_1c6d
loc_1c47:
    call 0x7079f
    test al, 1
    jne short loc_1c6d
    mov byte [esi + 0x3eb], 1
    jmp short loc_1c6d
loc_1c59:
    mov ah, byte [esi + 0x3eb]
    test ah, ah
    jbe short loc_1c6d
    mov dl, ah
    dec dl
    mov byte [esi + 0x3eb], dl
loc_1c6d:
    cmp byte [esi + 0x3cb], 0
    jne short loc_1c93
    mov di, word [esi + 0x38a]
    test di, di
    jle short loc_1c93
    cmp di, 0x190
    jge short loc_1c93
    mov edx, dword [esp + 0x28]
    add edx, edx
    mov dword [esp + 0x28], edx
loc_1c93:
    movsx edx, word [esp + 0x34]
    lea eax, [edx*4]
    add eax, edx
    mov ebx, dword [esp + 0x28]
    db 0x0f, 0xbf, 0x14, 0x45, 0x62, 0x02, 0x0e, 0x00    ; movsx edx, word [eax*2 + 0xe0262]
    imul edx, ebx
    mov ecx, dword [esi + 0x24c]
    shl edx, 6
    add ecx, edx
    mov dword [esi + 0x24c], ecx
    db 0x0f, 0xbf, 0x04, 0x45, 0x64, 0x02, 0x0e, 0x00    ; movsx eax, word [eax*2 + 0xe0264]
    imul eax, ebx
    mov edx, dword [esi + 0x250]
    shl eax, 6
    add edx, eax
    mov dword [esi + 0x250], edx
    cmp word [esi + 0x312], 0
    jne short loc_1cfa
    mov eax, dword [esp + 0x2c]
    cmp word [eax], 0xa
    jle short loc_1cfa
    cmp byte [esi + 0x3a8], 0
    jne short loc_1d0a
loc_1cfa:
    cmp byte [esi + 0x3a8], 0
    je short loc_1d40
    test byte [esp + 0x18], 2
    je short loc_1d40
loc_1d0a:
    mov ecx, 0x10
    mov edx, dword [0x8d5c]
    mov eax, dword [esi + 0x24c]
    sub edx, 0x2000
    imul edx
    shrd eax, edx, cl
    mov dword [esi + 0x24c], eax
    mov edx, dword [0x8d5c]
    mov eax, dword [esi + 0x250]
    sub edx, 0x2000
    jmp short loc_1da6
loc_1d40:
    cmp word [esp + 0x30], 2
    jne short loc_1d7e
    mov ecx, 0x10
    mov edx, dword [0x8d5c]
    mov eax, dword [esi + 0x24c]
    sub edx, 0x1400
    imul edx
    shrd eax, edx, cl
    mov dword [esi + 0x24c], eax
    mov edx, dword [0x8d5c]
    mov eax, dword [esi + 0x250]
    sub edx, 0x1400
    jmp short loc_1da6
loc_1d7e:
    mov ecx, 0x10
    mov edx, dword [0x8d5c]
    mov eax, dword [esi + 0x24c]
    imul edx
    shrd eax, edx, cl
    mov dword [esi + 0x24c], eax
    mov edx, dword [0x8d5c]
    mov eax, dword [esi + 0x250]
loc_1da6:
    imul edx
    shrd eax, edx, cl
    mov dword [esi + 0x250], eax
    mov eax, dword [esi + 0x24c]
    call 0xa27e9
    cmp eax, 0x800
    jge short loc_1deb
    mov eax, dword [esi + 0x250]
    call 0xa27e9
    cmp eax, 0x800
    jge short loc_1deb
    mov dword [esi + 0x250], 0
    mov eax, dword [esi + 0x250]
    mov dword [esi + 0x24c], eax
loc_1deb:
    cmp byte [esp + 0x44], 0
    je short loc_1e4b
    mov eax, dword [0x8d5c]
    mov edx, dword [0x8d5c]
    sar eax, 1
    sub edx, eax
    mov eax, dword [0x8d5c]
    sar eax, 2
    add edx, eax
    mov eax, dword [esi + 0x24c]
    imul edx
    shrd eax, edx, 0x10
    mov dword [esi + 0x24c], eax
    mov eax, dword [0x8d5c]
    mov edx, dword [0x8d5c]
    sar eax, 1
    sub edx, eax
    mov eax, edx
    mov edx, dword [0x8d5c]
    sar edx, 2
    add edx, eax
    mov eax, dword [esi + 0x250]
    imul edx
    shrd eax, edx, 0x10
    mov dword [esi + 0x250], eax
loc_1e4b:
    cmp word [esp + 0x30], 1
    je short loc_1e5c
    cmp byte [esi + 0x3cc], 1
    jne short loc_1e63
loc_1e5c:
    mov ecx, 0x400
    jmp short loc_1e68
loc_1e63:
    mov ecx, 0x1400
loc_1e68:
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    lea ebx, [esi + 0x29e]
    mov dx, word [eax*8 + 0x2385c6]
    mov al, byte [0xe8d83]
    cmp dx, 2
    test al, al
    je short loc_1ee3
    mov eax, dword [esi + 0x24c]
    mov edx, dword [esi + 0x214]
    sar eax, 0xe
    add edx, eax
    mov eax, dword [esi + 0x250]
    mov ecx, dword [esi + 0x218]
    sar eax, 0xe
    add ecx, eax
    mov dword [esi + 0x214], edx
    mov edx, ecx
    mov eax, dword [esi + 0x214]
    mov dword [esi + 0x218], ecx
    call 0x6e997
    movsx eax, word [esp + 0x3c]
    movsx edx, word [esi + 0x29e]
    xor edi, edi
    call 0x6acf7
    jmp short loc_1f20
loc_1ee3:
    push 0x10001
    push ecx
    push 0x400
    push 0xa4
    mov ecx, dword [esi + 0x250]
    lea eax, [esi + 0x21c]
    push ecx
    mov edi, dword [esi + 0x24c]
    lea edx, [esi + 0x218]
    push edi
    mov ecx, ebx
    lea edi, [esi + 0x214]
    mov ebx, eax
    mov eax, edi
    call 0x6cb75
    mov edi, eax
loc_1f20:
    cmp byte [esi + 0x3cb], 0
    jne short loc_1f4a
    mov ebx, dword [esp + 0x30]
    cmp bx, 2
    je short loc_1f4a
    cmp bx, 1
    je short loc_1f4a
    cmp byte [esp + 0x44], 0
    je short loc_1f4a
    add dword [esi + 0x21c], 0x2000
loc_1f4a:
    test edi, edi
    je short loc_1f58
    movsx edx, di
    mov eax, esi
    call 0x56760
loc_1f58:
    cmp byte [esi + 0x3cb], 0
    jne near loc_1fde
    cmp word [ebp + 0x20], 0x10
    jle short loc_1fc4
    mov ebx, dword [esp + 0x30]
    cmp bx, 1
    je short loc_1fde
    cmp bx, 2
    je short loc_1fde
    cmp byte [esi + 0x3a8], 0
    je short loc_1fde
    add word [esi + 0x390], 0x34
    and byte [esi + 0x391], 7
    movsx eax, word [esi + 0x390]
    db 0x0f, 0xbf, 0x14, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [eax*2 + 0x1b7fa4]
    movsx eax, word [ebp + 0x20]
    imul eax, edx
    test eax, eax
    jns short loc_1fb0
    neg eax
loc_1fb0:
    mov edx, eax
    mov ebx, 0x63c
    sar edx, 0x1f
    idiv ebx
    mov dword [esi + 0x244], eax
    jmp short loc_1fde
loc_1fc4:
    mov eax, dword [esp + 0x30]
    db 0x66, 0x3d, 0x02, 0x00    ; cmp ax, 2
    je short loc_1fde
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    je short loc_1fde
    mov dword [esi + 0x244], 0
loc_1fde:
    movsx eax, word [esp + 0x3c]
    mov ecx, dword [esi + 0x21c]
    mov ebx, dword [esi + 0x218]
    mov edx, dword [esi + 0x214]
    add ecx, 0x2600
    call 0x6a826
    cmp word [esp + 0x30], 3
    jge near loc_207b
    mov ax, word [ebp + 0x18]
    mov cl, byte [0xe8d83]
    mov dword [esp + 0x40], eax
    test cl, cl
    jne short loc_207b
    movsx edx, ax
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    cmp word [eax + 0x2385c6], 0x1f
    jne short loc_207b
    movsx edx, word [eax + 0x2385c8]
    imul eax, edx, 0x2c
    cmp word [eax + 0x1c0bc4], 0
    je short loc_207b
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp dword [eax + 0x4ea07], 0
    jne short loc_207b
    mov eax, esi
    call 0x47e70
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_207b:
    mov ax, word [esi + 0x29e]
    cmp ax, word [ebp + 0x18]
    je short loc_2095
    movsx edx, ax
    movsx eax, word [esp + 0x3c]
    call 0x6acf7
loc_2095:
    cmp byte [0xe8d83], 0
    jne short loc_20f3
    push 0x10001
    lea ecx, [esi + 0x29e]
    push 0x400
    lea ebx, [esi + 0x21c]
    push 0x400
    lea edx, [esi + 0x218]
    push 0xa4
    lea eax, [esi + 0x214]
    call 0x6e5e4
    test eax, eax
    jge short loc_20ef
    movsx eax, word [esp + 0x3c]
    mov edx, 8
    call 0x39d80
    cmp ax, 0x200
    jge short loc_20ef
    mov edi, 1
    jmp short loc_20f5
loc_20ef:
    xor edi, edi
    jmp short loc_20f5
loc_20f3:
    xor edi, edi
loc_20f5:
    cmp byte [0xe8d83], 0
    jne near loc_21d7
    movsx edx, word [esp + 0x3c]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ebx, eax
    mov eax, dword [eax + 0x4e9eb]
    sub eax, dword [ebx + 0x4e9ef]
    test eax, eax
    jns short loc_212d
    neg eax
loc_212d:
    cmp eax, 0x3000
    jl short loc_2138
    test edi, edi
    je short loc_219c
loc_2138:
    movsx edx, word [ebp + 0x18]
    lea eax, [edx*4]
    add eax, edx
    movsx eax, word [eax*8 + 0x2385c6]
    test ah, 0x80
    jne short loc_2187
    call 0x535f0
    test al, al
    jne short loc_2179
    movsx edx, word [ebp + 0x18]
    lea eax, [edx*4]
    add eax, edx
    movsx eax, word [eax*8 + 0x2385c6]
    call 0x53610
    test al, al
    je short loc_2187
loc_2179:
    movsx edx, word [esp + 0x3c]
    movsx eax, word [ebp + 0x18]
    call 0x562a0
loc_2187:
    test edi, edi
    je short loc_21d7
    mov eax, esi
    call 0x47e70
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_219c:
    mov eax, dword [esp + 0xc]
    sub eax, dword [esp + 8]
    test eax, eax
    jns short loc_21aa
    neg eax
loc_21aa:
    cmp eax, 0x2000
    jge short loc_21d7
    movsx ebx, word [esp + 0x40]
    lea eax, [ebx*4]
    add eax, ebx
    movsx eax, word [eax*8 + 0x2385c6]
    call 0x535f0
    test al, al
    je short loc_21d7
    mov eax, ebx
    call 0x562a0
loc_21d7:
    test byte [esp + 0x1a], 4
    jne short loc_21e7
    cmp byte [esi + 0x3ed], 0
    je short loc_21ee
loc_21e7:
    mov byte [esi + 0x3f5], 9
loc_21ee:
    mov dh, byte [esp + 0x19]
    test dh, 0x20
    je short loc_2217
    mov dl, byte [esp + 0x18]
    mov byte [esi + 0x3f5], 9
    test dl, 0x20
    je short loc_220e
    add dword [esi + 0x220], 0xc
loc_220e:
    add dword [esi + 0x220], 0xc
    jmp short loc_2272
loc_2217:
    test dh, 0x40
    je short loc_223c
    mov ah, byte [esp + 0x18]
    mov byte [esi + 0x3f5], 9
    test ah, 0x20
    je short loc_2233
    sub dword [esi + 0x220], 0xc
loc_2233:
    sub dword [esi + 0x220], 0xc
    jmp short loc_2272
loc_223c:
    mov bh, byte [esp + 0x18]
    test bh, 8
    je short loc_225a
    test bh, 0x20
    je short loc_2251
    add dword [esi + 0x220], 6
loc_2251:
    add dword [esi + 0x220], 6
    jmp short loc_2272
loc_225a:
    test bh, 0x10
    je short loc_2272
    test bh, 0x20
    je short loc_226b
    sub dword [esi + 0x220], 6
loc_226b:
    sub dword [esi + 0x220], 6
loc_2272:
    mov dh, byte [esi + 0x3f5]
    test dh, dh
    jbe short loc_22bd
    mov bl, byte [esp + 0x19]
    test bl, 0x20
    jne short loc_22bd
    test bl, 0x40
    jne short loc_22bd
    mov eax, dword [esi + 0x220]
    mov cl, dh
    mov edx, eax
    mov ebx, 3
    sar edx, 0x1f
    idiv ebx
    mov edx, 0x21
    sub edx, eax
    dec cl
    mov eax, edx
    mov edx, dword [esi + 0x220]
    mov byte [esi + 0x3f5], cl
    add edx, eax
    mov dword [esi + 0x220], edx
loc_22bd:
    mov ch, byte [esi + 0x3ed]
    test ch, ch
    jbe short loc_22ea
    mov al, ch
    dec al
    mov byte [esi + 0x3ed], al
    xor eax, eax
    mov al, byte [esi + 0x3ed]
    mov ebx, dword [esi + 0x220]
    shl eax, 4
    sub ebx, eax
    mov dword [esi + 0x220], ebx
loc_22ea:
    cmp dword [esi + 0x280], 0
    je short loc_231b
    movsx edx, word [esp + 0x34]
    lea eax, [edx*4]
    add eax, edx
    db 0x0f, 0xbe, 0x04, 0x45, 0x61, 0x02, 0x0e, 0x00    ; movsx eax, byte [eax*2 + 0xe0261]
    mov edx, dword [esi + 0x220]
    sar eax, 1
    add edx, eax
    mov dword [esi + 0x220], edx
    jmp short loc_2354
loc_231b:
    mov edi, dword [esi + 0x220]
    cmp edi, 0x5f
    jle short loc_2335
    cmp edi, 0x69
    jge short loc_2335
    mov dword [esi + 0x220], 0x64
loc_2335:
    movsx eax, word [esi + 0x318]
    cmp eax, -5
    jle short loc_2354
    cmp word [esi + 0x318], 5
    jge short loc_2354
    mov word [esi + 0x318], 0
loc_2354:
    mov ebx, dword [esi + 0x220]
    cmp ebx, 0x12b
    jle short loc_236e
    mov dword [esi + 0x220], 0x12b
    jmp short loc_237d
loc_236e:
    cmp ebx, -0x63
    jge short loc_237d
    mov dword [esi + 0x220], 0xffffff9d
loc_237d:
    mov ax, word [esi + 0x384]
    test ax, ax
    jle short loc_23ae
    mov edx, eax
    dec dx
    mov word [esi + 0x384], dx
    jne short loc_23ae
    mov eax, esi
    movsx edx, word [esi + 0x398]
    call 0x27620
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_23ae:
    mov cx, word [esi + 0x328]
    test cx, cx
    jle near loc_25fe
    mov edi, ecx
    inc edi
    mov word [esi + 0x328], di
    mov edi, dword [esi + 0x220]
    mov byte [esi + 0x3f5], 9
    sub edi, 0x30
    mov ax, word [esi + 0x328]
    mov dword [esi + 0x220], edi
    db 0x66, 0x3d, 0x0f, 0x00    ; cmp ax, 0xf
    jle near loc_25a4
    mov word [esi + 0x328], 0
    mov bx, word [esi + 0x392]
    mov byte [esi + 0x3d1], 0
    test bx, bx
    jge short loc_2416
    mov ecx, ebx
    neg ecx
    mov word [esi + 0x392], cx
loc_2416:
    mov di, word [esi + 0x356]
    test di, di
    jl near loc_2599
    movsx edx, di
    imul edx, edx, 0x2c
    movsx eax, word [esp + 0x3c]
    imul eax, eax, 0x2c
    add edx, 0x1c0ba4
    add eax, 0x1c0ba4
    call 0x536d0
    cmp eax, 0x578
    jge near loc_2599
    movsx eax, word [esi + 0x356]
    imul eax, eax, 0x2c
    mov ebx, 7
    mov edx, 0x8ee
    movsx ecx, word [0x261216]
    add eax, 0x1c0ba4
    call 0x28990
    mov edx, 0x4ca
    movsx eax, word [esi + 0x356]
    call 0x19320
    movsx eax, word [esi + 0x356]
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x1c0bb2]
    cmp ax, 0x52b
    jb short loc_24e8
    jbe near loc_2516
    cmp ax, 0x538
    jb short loc_24d4
    jbe near loc_2516
    cmp ax, 0xd7a
    jb short loc_24c9
    jbe near loc_2516
    cmp ax, 0x1300
    je near loc_2516
    jmp near loc_2534
loc_24c9:
    cmp ax, 0x573
    je short loc_2516
    jmp near loc_2534
loc_24d4:
    cmp ax, 0x52d
    jb near loc_2534
    jbe short loc_2516
    cmp ax, 0x536
    je short loc_2516
    jmp short loc_2534
loc_24e8:
    cmp ax, 0x50e
    jb short loc_2508
    jbe short loc_2516
    cmp ax, 0x525
    jb short loc_2500
    jbe short loc_2516
    cmp ax, 0x529
    je short loc_2516
    jmp short loc_2534
loc_2500:
    cmp ax, 0x520
    je short loc_2516
    jmp short loc_2534
loc_2508:
    cmp ax, 0x25b
    jb short loc_2534
    jbe short loc_2516
    cmp ax, 0x2f1
    jne short loc_2534
loc_2516:
    movsx eax, word [esi + 0x356]
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bc6]
    test dx, dx
    je short loc_2534
    movsx eax, dx
    call 0x54fb0
loc_2534:
    movsx eax, word [esi + 0x356]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x214
    jne short loc_2599
    movsx edx, word [eax + 0x1c0bc6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    add eax, 0xb4f00
    call 0x47e70
    movsx eax, word [esi + 0x356]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x1c0bc6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [esp + 0x34]
    db 0x66, 0x89, 0x14, 0x45, 0x94, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb5294], dx
loc_2599:
    mov word [esi + 0x356], 0xffff
    jmp short loc_25fe
loc_25a4:
    mov dx, word [esi + 0x356]
    test dx, dx
    jl short loc_25fe
    movsx edx, dx
    imul edx, edx, 0x2c
    mov ebp, dword [esi + 0x218]
    mov ebx, dword [edx + 0x1c0ba8]
    mov eax, dword [edx + 0x1c0ba4]
    mov edx, dword [esi + 0x214]
    sub ebx, ebp
    sub eax, edx
    mov edx, ebx
    call 0x65698
    movsx edx, ax
    movsx eax, word [esi + 0x298]
    call 0x374b0
    cwde
    mov edx, eax
    sar edx, 2
    movsx eax, word [esi + 0x298]
    add eax, edx
    mov word [esi + 0x298], ax
loc_25fe:
    mov eax, esi
    call 0x4ae20
    test al, al
    jne near loc_2b0b
    mov cx, word [esi + 0x392]
    test cx, cx
    je short loc_265d
    movsx eax, cx
    cmp eax, -9
    jne short loc_2653
    cmp word [esi + 0x314], 0
    jl short loc_263f
    mov word [esi + 0x392], 0xa
    mov word [esi + 0x314], 0xffff
    jmp short loc_265d
loc_263f:
    cmp byte [esi + 0x3d1], 0
    jne short loc_265d
    mov word [esi + 0x392], 0xa
    jmp short loc_265d
loc_2653:
    mov edi, ecx
    dec edi
    mov word [esi + 0x392], di
loc_265d:
    mov dx, word [esi + 0x312]
    cmp dx, 0xb
    je short loc_2670
    cmp dx, 0x10
    jne short loc_2678
loc_2670:
    add word [esi + 0x346], 0x40
loc_2678:
    cmp byte [esi + 0x3a7], 1
    jne short loc_2693
    test byte [esp + 0x18], 4
    jne near loc_2b0b
    mov byte [esi + 0x3a7], 0
loc_2693:
    mov bl, byte [esp + 0x44]
    test bl, bl
    jne near loc_2b0b
    cmp word [esi + 0x316], 0
    jne near loc_2b0b
    cmp word [esi + 0x32a], 0
    jne near loc_2b0b
    test bl, bl
    jne near loc_282a
    test byte [esp + 0x18], 4
    je near loc_282a
    mov eax, dword [esp + 0x2c]
    cmp word [eax], 0
    jne near loc_282a
    cmp word [esi + 0x348], 0
    jne near loc_282a
    movsx eax, word [esi + 0x314]
    cmp eax, -1
    jne near loc_282a
    cmp word [esi + 0x392], 0
    je short loc_2711
    cmp byte [esi + 0x3d1], 1
    jne near loc_282a
loc_2711:
    mov al, byte [esi + 0x3d1]
    mov dword [esi + 0x27c], 0x309
    cmp al, 1
    jne short loc_276b
    cmp dword [esi + 0x258], 0x1624
    jg near loc_2b0b
    movsx eax, word [esi + 0x392]
    cmp eax, -9
    jne near loc_2b0b
    mov eax, 0x4a
    mov byte [esi + 0x3d1], 0
    mov edx, esi
    mov word [esi + 0x392], 0xa
    call 0x15e90
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_276b:
    mov ax, word [esi + 0x312]
    dec eax
    db 0x66, 0x3d, 0x04, 0x00    ; cmp ax, 4
    ja near loc_2b0b
    and eax, 0xffff
    jmp dword cs:[eax*4 + 0x3b1ec]
    cmp dword [0x223b0], -0x15
    jl near loc_2b0b
    mov eax, dword [esp + 0x2c]
    mov word [eax], 1
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp dword [0x223b0], -0x15
    jl near loc_2b0b
    mov eax, dword [esp + 0x2c]
    mov word [eax], 1
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp dword [0x223b0], -0x15
    jl near loc_2b0b
    mov eax, dword [esp + 0x2c]
    mov word [eax], 1
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp dword [0x223b0], -0x15
    jl near loc_2b0b
    mov eax, dword [esp + 0x2c]
    mov word [eax], 1
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp dword [0x223b0], -0x15
    jl near loc_2b0b
    mov eax, dword [esp + 0x2c]
    mov word [eax], 1
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_282a:
    mov eax, dword [esp + 0x2c]
    cmp word [eax], 0
    je near loc_2b0b
    mov ax, word [esi + 0x312]
    dec eax
    db 0x66, 0x3d, 0x04, 0x00    ; cmp ax, 4
    ja near loc_2b0b
    and eax, 0xffff
    jmp dword cs:[eax*4 + 0x3b200]
    mov eax, dword [esp + 0x2c]
    mov dx, word [eax]
    inc edx
    mov word [eax], dx
    cmp dx, 3
    jne short loc_28cc
    movsx eax, word [esi + 0x312]
    add eax, eax
    add eax, esi
    mov di, word [eax + 0x2ce]
    test di, di
    jl short loc_2889
    mov edx, edi
    dec edx
    mov word [eax + 0x2ce], dx
loc_2889:
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl near loc_2b0b
    mov eax, dword [0x2454ac]
    add eax, 0x20
    mov edx, 0x27e
    mov dword [0xfcc70], eax
    movsx eax, word [esp + 0x3c]
    call 0x48740
    mov eax, esi
    call 0x27790
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_28cc:
    cmp dx, 0x14
    jl near loc_2b0b
    mov word [eax], 0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [esp + 0x2c]
    mov cx, word [eax]
    inc ecx
    mov word [eax], cx
    cmp cx, 3
    jne short loc_295a
    movsx eax, word [esi + 0x312]
    add eax, eax
    add eax, esi
    mov bx, word [eax + 0x2ce]
    test bx, bx
    jl short loc_2917
    mov ecx, ebx
    dec ecx
    mov word [eax + 0x2ce], cx
loc_2917:
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl near loc_2b0b
    mov eax, dword [0x2454ac]
    add eax, 0x20
    mov edx, 0x27e
    mov dword [0xfcc70], eax
    movsx eax, word [esp + 0x3c]
    call 0x48740
    mov eax, esi
    call 0x27790
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_295a:
    cmp cx, 0x14
    jl near loc_2b0b
    mov word [eax], 0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [esp + 0x2c]
    mov dx, word [eax]
    inc edx
    mov word [eax], dx
    cmp dx, 3
    jne short loc_29e8
    movsx eax, word [esi + 0x312]
    add eax, eax
    add eax, esi
    mov di, word [eax + 0x2ce]
    test di, di
    jl short loc_29a5
    mov edx, edi
    dec edx
    mov word [eax + 0x2ce], dx
loc_29a5:
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl near loc_2b0b
    mov eax, dword [0x2454ac]
    add eax, 0x20
    mov edx, 0x27e
    mov dword [0xfcc70], eax
    movsx eax, word [esp + 0x3c]
    call 0x48740
    mov eax, esi
    call 0x27790
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_29e8:
    cmp dx, 0xa
    jl near loc_2b0b
    mov word [eax], 0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [esp + 0x2c]
    mov cx, word [eax]
    inc ecx
    mov word [eax], cx
    cmp cx, 3
    jne short loc_2a76
    movsx eax, word [esi + 0x312]
    add eax, eax
    add eax, esi
    mov bx, word [eax + 0x2ce]
    test bx, bx
    jl short loc_2a33
    mov ecx, ebx
    dec ecx
    mov word [eax + 0x2ce], cx
loc_2a33:
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl near loc_2b0b
    mov eax, dword [0x2454ac]
    add eax, 0x20
    mov edx, 0x27e
    mov dword [0xfcc70], eax
    movsx eax, word [esp + 0x3c]
    call 0x48740
    mov eax, esi
    call 0x27790
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2a76:
    cmp cx, 0xa
    jl near loc_2b0b
    mov word [eax], 0
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [esp + 0x2c]
    mov dx, word [eax]
    inc edx
    mov word [eax], dx
    cmp dx, 3
    jne short loc_2b00
    movsx eax, word [esi + 0x312]
    add eax, eax
    add eax, esi
    mov di, word [eax + 0x2ce]
    test di, di
    jl short loc_2ac1
    mov edx, edi
    dec edx
    mov word [eax + 0x2ce], dx
loc_2ac1:
    movsx eax, word [esi + 0x312]
    cmp word [esi + eax*2 + 0x2ce], 0
    jl short loc_2b0b
    mov eax, dword [0x2454ac]
    add eax, 0x20
    mov edx, 0x27e
    mov dword [0xfcc70], eax
    movsx eax, word [esp + 0x3c]
    call 0x48740
    mov eax, esi
    call 0x27790
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2b00:
    cmp dx, 0xa
    jl short loc_2b0b
    mov word [eax], 0
loc_2b0b:
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
loc_2b1c:
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    mov ebx, eax
    mov eax, edx
    cmp edx, 0x2e
    jb near loc_2bdb
    jbe near loc_2d6f
    cmp edx, 0x37
    jb short loc_2ba2
    jbe near loc_2ebe
    mov edx, ebx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    add ebx, ebx
    cmp eax, 0x3c
    jb short loc_2b85
    jbe near loc_2f33
    cmp eax, 0x64
    jb short loc_2b77
    jbe near loc_2f54
    cmp eax, 0x544
    je near loc_2f7a
    jmp near loc_2f90
loc_2b77:
    cmp eax, 0x3d
    je near loc_2f3e
    jmp near loc_2f90
loc_2b85:
    cmp eax, 0x39
    jb near loc_2ee9
    jbe near loc_2f03
    cmp eax, 0x3b
    je near loc_2f1d
    jmp near loc_2f90
loc_2ba2:
    cmp edx, 0x33
    jb short loc_2bc1
    jbe near loc_2e02
    cmp edx, 0x35
    jb near loc_2e36
    jbe near loc_2e6a
    jmp near loc_2e94
loc_2bc1:
    cmp edx, 0x2f
    jbe near loc_2da0
    cmp edx, 0x31
    je near loc_2dd1
    xor eax, eax
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2bdb:
    cmp edx, 0x1b
    jb short loc_2c25
    jbe near loc_2f6f
    cmp edx, 0x28
    jb short loc_2c11
    jbe near loc_2cab
    cmp edx, 0x2a
    jb near loc_2cdc
    jbe near loc_2d0d
    cmp edx, 0x2c
    je near loc_2d3e
    xor eax, eax
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2c11:
    cmp edx, 0x1d
    jb short loc_2c70
    jbe short loc_2c70
    cmp edx, 0x25
    je short loc_2c7a
    xor eax, eax
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2c25:
    cmp edx, 0x17
    jb short loc_2c39
    jbe short loc_2c52
    cmp edx, 0x19
    jb near loc_2df7
    jbe short loc_2c5c
    jmp short loc_2c66
loc_2c39:
    cmp edx, 0x15
    jb near loc_2f90
    ja near loc_2f6f
    mov eax, 5
    jmp near loc_2f92
loc_2c52:
    mov eax, 0xc8
    jmp near loc_2f92
loc_2c5c:
    mov eax, 0x50
    jmp near loc_2f92
loc_2c66:
    mov eax, 0x3c
    jmp near loc_2f92
loc_2c70:
    mov eax, 0x78
    jmp near loc_2f92
loc_2c7a:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov ecx, dword [0xe7030]
    db 0x0f, 0xbf, 0x04, 0x45, 0xc2, 0x51, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb51c2]
    cmp eax, ecx
    jge near loc_2f90
    mov eax, 0xa
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2cab:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov ebx, dword [0xe7014]
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x51, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb51b4]
    cmp eax, ebx
    jge near loc_2f90
    mov eax, 0xa
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2cdc:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov edx, dword [0xe7018]
    db 0x0f, 0xbf, 0x04, 0x45, 0xb6, 0x51, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb51b6]
    cmp eax, edx
    jge near loc_2f90
    mov eax, 0x14
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2d0d:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov ebp, dword [0xe7028]
    db 0x0f, 0xbf, 0x04, 0x45, 0xbe, 0x51, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb51be]
    cmp eax, ebp
    jge near loc_2f90
    mov eax, 0x19
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2d3e:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov edi, dword [0xe701c]
    db 0x0f, 0xbf, 0x04, 0x45, 0xb8, 0x51, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb51b8]
    cmp eax, edi
    jge near loc_2f90
    mov eax, 0x32
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2d6f:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov esi, dword [0xe7024]
    db 0x0f, 0xbf, 0x04, 0x45, 0xbc, 0x51, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb51bc]
    cmp eax, esi
    jge near loc_2f90
    mov eax, 0xa
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2da0:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov ecx, dword [0xe7020]
    db 0x0f, 0xbf, 0x04, 0x45, 0xba, 0x51, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb51ba]
    cmp eax, ecx
    jge near loc_2f90
    mov eax, 0x1e
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2dd1:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov ebx, dword [0xe7014]
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x51, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb51b4]
    cmp eax, ebx
    jge near loc_2f90
loc_2df7:
    mov eax, 0x19
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2e02:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bce], 0x64
    jge near loc_2f90
    mov eax, 0xa
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2e36:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bce], 0x64
    jge near loc_2f90
    mov eax, 0x1e
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2e6a:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x66, 0x83, 0x3c, 0x45, 0x3a, 0x52, 0x0b, 0x00, 0x64    ; cmp word [eax*2 + 0xb523a], 0x64
    jge near loc_2f90
    mov eax, 0x64
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2e94:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x66, 0x83, 0x3c, 0x45, 0x8c, 0x52, 0x0b, 0x00, 0x64    ; cmp word [eax*2 + 0xb528c], 0x64
    jge near loc_2f90
    mov eax, 0x32
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2ebe:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x66, 0x81, 0x3c, 0x45, 0x8a, 0x52, 0x0b, 0x00, 0x90, 0x01    ; cmp word [eax*2 + 0xb528a], 0x190
    jge near loc_2f90
    mov eax, 0x1e
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2ee9:
    cmp word [ebx + 0xb5286], 0x1900
    jge near loc_2f90
    mov eax, 0x1e
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2f03:
    cmp word [ebx + 0xb5288], 0x640
    jge near loc_2f90
    mov eax, 0x64
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2f1d:
    cmp word [ebx + 0xb5254], 0x4b0
    jge short loc_2f90
    mov eax, 0xa
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2f33:
    mov eax, 1
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2f3e:
    cmp word [ebx + 0xb529c], 0xc8
    jge short loc_2f90
    mov eax, 0x32
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2f54:
    movsx eax, word [ebx + 0xb5240]
    imul eax, eax, 0x2c
    mov edx, dword [0xe7220]
    movsx eax, word [eax + 0x1c0bce]
    cmp eax, edx
    jge short loc_2f90
loc_2f6f:
    mov eax, 0x32
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2f7a:
    cmp word [ebx + 0xb521c], 0x960
    jge short loc_2f90
    mov eax, 0x1e
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2f90:
    xor eax, eax
loc_2f92:
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x7c
    mov dword [esp + 0x50], eax
    mov dword [esp + 0x54], edx
    mov edx, eax
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xb4f00
    add eax, eax
    add edx, eax
    mov eax, dword [esp + 0x54]
    mov word [eax + 2], 0
    mov word [eax + 4], 0
    mov byte [eax], 0
    mov byte [eax + 1], 0
    mov dword [eax + 6], 0
    movsx eax, word [edx + 0x340]
    imul eax, eax, 0x2c
    mov dword [esp + 0x24], edx
    mov edx, dword [eax + 0x1c0ba4]
    mov dword [esp + 0x5c], edx
    mov edx, dword [eax + 0x1c0ba8]
    mov dword [esp + 0x60], edx
    mov edx, dword [eax + 0x1c0bac]
    mov dword [esp + 0x44], edx
    movsx edx, word [eax + 0x1c0bc0]
    mov dword [esp + 0x20], edx
    movsx eax, word [eax + 0x1c0bbc]
    mov dx, word [0x261214]
    mov dword [esp + 0x3c], eax
    cmp dx, 2
    jl short loc_3077
    mov edx, dword [esp + 0x50]
    movsx eax, word [0x261216]
    cmp eax, edx
    jne short loc_3077
    mov eax, dword [0xe43bc]
    mov dword [esp + 0x5c], eax
    mov eax, dword [0xe43b8]
    mov dword [esp + 0x60], eax
    mov eax, dword [0xe43b4]
    add eax, 0x2600
    mov dword [esp + 0x44], eax
    movsx eax, word [0xe8cb8]
    mov dword [esp + 0x20], eax
    movsx eax, word [0xe8cb4]
    mov dword [esp + 0x3c], eax
loc_3077:
    test byte [0x2441b0], 7
    jne short loc_30f1
    mov esi, dword [esp + 0x50]
    lea esi, [esi*4]
    mov edx, dword [esi + 0xf34c0]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x1c0bbc]
    push eax
    mov eax, dword [esp + 0x30]
    sub eax, 0x3000
    mov ebx, dword [esp + 0x38]
    push eax
    mov ecx, dword [esp + 0x38]
    mov edx, dword [esp + 0x68]
    push ebx
    mov eax, dword [esp + 0x68]
    mov ebx, dword [esp + 0x50]
    push ecx
    mov ecx, dword [esp + 0x4c]
    sub ebx, 0x3000
    call 0x6ae4d
    test eax, eax
    jne short loc_30f1
    mov eax, dword [esp + 0x50]
    mov dword [esi + 0xf34c0], eax
loc_30f1:
    mov edx, dword [esp + 0x50]
    lea edx, [edx*4]
    mov esi, dword [esp + 0x50]
    mov eax, dword [edx + 0xf34c0]
    cmp eax, esi
    je short loc_3129
    mov edx, eax
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0x83, 0x3c, 0x45, 0x82, 0x52, 0x0b, 0x00, 0x00    ; cmp word [eax*2 + 0xb5282], 0
    je near loc_3219
loc_3129:
    mov dword [esp + 0x6c], 0x7fffffff
    movsx edi, word [0x261210]
    jmp near loc_3211
loc_313d:
    cmp edi, dword [esp + 0x50]
    je near loc_3209
    mov eax, edi
    shl eax, 7
    sub eax, edi
    lea eax, [eax*4]
    sub eax, edi
    lea edx, [eax + eax]
    movsx eax, word [edx + 0xb5240]
    imul eax, eax, 0x2c
    mov ecx, dword [esp + 0x60]
    mov ebx, dword [eax + 0x1c0ba8]
    sub ebx, ecx
    imul ebx, ebx
    mov esi, dword [esp + 0x5c]
    mov eax, dword [eax + 0x1c0ba4]
    sub eax, esi
    imul eax, eax
    add eax, ebx
    call 0x6577d
    mov esi, eax
    mov ebp, eax
    movsx eax, word [edx + 0xb5240]
    imul eax, eax, 0x2c
    mov edx, dword [eax + 0x1c0ba4]
    mov dword [esp + 0x30], edx
    mov edx, dword [eax + 0x1c0ba8]
    mov dword [esp + 0x34], edx
    mov edx, dword [eax + 0x1c0bac]
    movsx eax, word [eax + 0x1c0bbc]
    mov dword [esp + 0x2c], edx
    push eax
    lea eax, [edx - 0x3000]
    mov ecx, dword [esp + 0x40]
    push eax
    mov eax, dword [esp + 0x3c]
    mov ebx, dword [esp + 0x4c]
    push eax
    mov edx, dword [esp + 0x3c]
    sub ebx, 0x3000
    push edx
    mov eax, dword [esp + 0x6c]
    mov edx, dword [esp + 0x70]
    call 0x6ae4d
    test eax, eax
    jne short loc_31f4
    db 0x8d, 0x2c, 0x75, 0x00, 0x00, 0x00, 0x00    ; lea ebp, [esi*2]
loc_31f4:
    cmp ebp, dword [esp + 0x6c]
    jge short loc_3209
    mov eax, dword [esp + 0x50]
    mov dword [esp + 0x6c], ebp
    mov dword [eax*4 + 0xf34c0], edi
loc_3209:
    db 0x0f, 0xbf, 0x3c, 0x7d, 0x08, 0x11, 0x26, 0x00    ; movsx edi, word [edi*2 + 0x261108]
loc_3211:
    test edi, edi
    jge near loc_313d
loc_3219:
    mov edx, dword [esp + 0x50]
    mov edx, dword [edx*4 + 0xf34c0]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    mov edx, dword [eax + 0x1c0ba4]
    mov dword [esp + 0x30], edx
    mov edx, dword [eax + 0x1c0ba8]
    mov eax, dword [eax + 0x1c0bac]
    mov dword [esp + 0x2c], eax
    mov eax, dword [esp + 0x24]
    mov cx, word [eax + 0x382]
    mov dword [esp + 0x34], edx
    test cx, cx
    je short loc_3275
    mov eax, dword [esp + 0x54]
    or byte [eax + 9], 0x20
loc_3275:
    mov eax, dword [esp + 0x24]
    cmp word [eax + 0x33a], 0
    jle short loc_3295
    cmp word [eax + 0x2a2], 0x64
    jge short loc_3295
    mov eax, dword [esp + 0x54]
    or byte [eax + 8], 1
loc_3295:
    movsx eax, word [0x2454ca]
    jmp near loc_355c
loc_32a1:
    imul eax, ecx, 0x2c
    mov ax, word [eax + 0x1c0bb2]
    db 0x66, 0x3d, 0x05, 0x00    ; cmp ax, 5
    jb short loc_32d3
    jbe short loc_32f0
    cmp ax, 0x669
    jb short loc_32cb
    jbe short loc_32e9
    cmp ax, 0x66e
    jb short loc_32f7
    jbe short loc_32f0
    cmp ax, 0x66f
    je short loc_32e9
    jmp short loc_32f7
loc_32cb:
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    je short loc_32f0
    jmp short loc_32f7
loc_32d3:
    db 0x66, 0x3d, 0x02, 0x00    ; cmp ax, 2
    jb short loc_32e1
    jbe short loc_32f0
    db 0x66, 0x3d, 0x03, 0x00    ; cmp ax, 3
    jmp short loc_32f0
loc_32e1:
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    je short loc_32f0
    jmp short loc_32f7
loc_32e9:
    mov ebp, 4
    jmp short loc_32f9
loc_32f0:
    mov ebp, 0x10
    jmp short loc_32f9
loc_32f7:
    xor ebp, ebp
loc_32f9:
    test ebp, ebp
    je near loc_3550
    imul edx, dword [esp + 0x6c], 0x2c
    mov eax, dword [edx + 0x1c0ba4]
    mov dword [esp + 8], eax
    mov eax, dword [edx + 0x1c0ba8]
    mov dword [esp + 4], eax
    mov eax, dword [edx + 0x1c0bac]
    xor edx, edx
    mov dword [esp], eax
    mov dword [esp + 0x68], edx
    jmp near loc_3545
loc_332e:
    mov esi, dword [esp]
    mov ecx, dword [esp + 0x44]
    mov ebx, dword [esp + 4]
    mov edi, dword [esp + 0x60]
    mov eax, dword [esp + 8]
    mov edx, dword [esp + 0x5c]
    sub esi, ecx
    sub ebx, edi
    sub eax, edx
    sar esi, 4
    mov ecx, ebx
    mov edx, eax
    mov edi, esi
    imul edx
    xchg ebx, eax
    db 0x87, 0xca    ; xchg edx, ecx
    imul edx
    add ebx, eax
    adc ecx, edx
    mov eax, esi
    imul edi
    add eax, ebx
    adc edx, ecx
    shrd eax, edx, 0xb
    cmp eax, 0xc00
    jge near loc_33fc
    imul eax, dword [esp + 0x6c], 0x2c
    movsx edx, word [eax + 0x1c0bc0]
    add edx, 0x200
    mov ax, word [eax + 0x1c0bc0]
    and edx, 0x7ff
    and ah, 7
    mov edi, dword [esp + 8]
    cwde
    db 0x0f, 0xbf, 0x0c, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx ecx, word [edx*2 + 0x1b7fa4]
    mov edx, dword [esp + 0x5c]
    db 0x0f, 0xbf, 0x34, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx esi, word [eax*2 + 0x1b7fa4]
    sub edx, edi
    imul edx, esi
    mov ebx, dword [esp + 4]
    mov eax, dword [esp + 0x60]
    sub eax, ebx
    imul eax, ecx
    cmp edx, eax
    jle short loc_33cd
    mov edi, ebp
    neg edi
    jmp short loc_33cf
loc_33cd:
    mov edi, ebp
loc_33cf:
    shl edi, 9
    mov edx, edi
    mov eax, esi
    imul edx
    shrd eax, edx, 0x11
    mov edx, dword [esp + 0x54]
    mov bx, word [edx + 2]
    sub ebx, eax
    mov eax, ecx
    mov word [edx + 2], bx
    mov edx, edi
    imul edx
    shrd eax, edx, 0x11
    mov edx, dword [esp + 0x54]
    add word [edx + 4], ax
loc_33fc:
    imul ecx, dword [esp + 0x6c], 0x2c
    cmp dword [esp + 0x68], 7
    jge near loc_3499
    movsx eax, word [ecx + 0x1c0bc0]
    add eax, 0x200
    and eax, 0x7ff
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; mov dx, word [eax*2 + 0x1b7fa4]
    mov ax, word [ecx + 0x1c0bc4]
    movsx edx, dx
    cwde
    imul edx
    shrd eax, edx, 0xe
    mov edx, dword [esp + 8]
    lea eax, [eax*4]
    add edx, eax
    mov ax, word [ecx + 0x1c0bc0]
    and ah, 7
    cwde
    mov bx, word [ecx + 0x1c0bc4]
    db 0x66, 0x8b, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; mov ax, word [eax*2 + 0x1b7fa4]
    mov dword [esp + 8], edx
    movsx edx, ax
    movsx eax, bx
    imul edx
    shrd eax, edx, 0xe
    mov ebx, dword [esp + 4]
    lea eax, [eax*4]
    add ebx, eax
    movsx eax, word [ecx + 0x1c0bc8]
    mov ecx, dword [esp]
    lea eax, [eax*4]
    add ecx, eax
    mov dword [esp + 4], ebx
    mov dword [esp], ecx
    jmp near loc_3541
loc_3499:
    push 0x1000040
    lea eax, [esp + 4]
    push eax
    lea eax, [esp + 0xc]
    push eax
    lea eax, [esp + 0x14]
    push eax
    lea eax, [esp + 0x84]
    push eax
    lea eax, [esp + 0x84]
    push eax
    lea eax, [esp + 0x90]
    push eax
    movsx eax, word [ecx + 0x1c0bc8]
    push eax
    mov ax, word [ecx + 0x1c0bc0]
    and ah, 7
    cwde
    db 0x66, 0x8b, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; mov ax, word [eax*2 + 0x1b7fa4]
    mov bx, word [ecx + 0x1c0bc4]
    movsx edx, ax
    movsx eax, bx
    imul edx
    shrd eax, edx, 0xe
    push eax
    movsx eax, word [ecx + 0x1c0bc0]
    add eax, 0x200
    and eax, 0x7ff
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; mov dx, word [eax*2 + 0x1b7fa4]
    mov ax, word [ecx + 0x1c0bc4]
    movsx edx, dx
    cwde
    imul edx
    shrd eax, edx, 0xe
    push eax
    mov ebx, dword [ecx + 0x1c0bac]
    mov edx, dword [ecx + 0x1c0ba8]
    movsx eax, word [ecx + 0x1c0bbc]
    mov esi, dword [ecx + 0x1c0ba4]
    mov ecx, eax
    mov eax, esi
    call 0x6b0c1
loc_3541:
    inc dword [esp + 0x68]
loc_3545:
    cmp dword [esp + 0x68], 8
    jle near loc_332e
loc_3550:
    mov eax, dword [esp + 0x6c]
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; movsx eax, word [eax*2 + 0x1af7a4]
loc_355c:
    mov dword [esp + 0x6c], eax
    mov ecx, dword [esp + 0x6c]
    test ecx, ecx
    jge near loc_32a1
    mov esi, dword [esp + 0x50]
    lea esi, [esi*4]
    mov edx, dword [esi + 0xf34c0]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xb5282], 0
    jne near loc_3c13
    movsx eax, word [eax + 0xb5240]
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x1c0bbc]
    push eax
    mov edi, dword [esp + 0x30]
    push edi
    mov ebp, dword [esp + 0x3c]
    mov ecx, dword [esp + 0x44]
    push ebp
    mov eax, dword [esp + 0x3c]
    mov ebx, dword [esp + 0x50]
    push eax
    mov edx, dword [esp + 0x70]
    mov eax, dword [esp + 0x6c]
    call 0x6ae4d
    test eax, eax
    jne near loc_3689
    mov edx, dword [esi + 0xf34c0]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x1c0bbc]
    push eax
    lea eax, [edi - 0x1800]
    push eax
    mov ebx, dword [esp + 0x38]
    push ebp
    mov ecx, dword [esp + 0x48]
    mov edx, dword [esp + 0x6c]
    push ebx
    mov ebx, dword [esp + 0x54]
    mov eax, dword [esp + 0x6c]
    sub ebx, 0x1800
    call 0x6ae4d
    test eax, eax
    jne short loc_3689
    mov edx, dword [esi + 0xf34c0]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x1c0bbc]
    push eax
    lea eax, [edi - 0x3000]
    push eax
    mov ebx, dword [esp + 0x4c]
    mov ecx, dword [esp + 0x44]
    push ebp
    mov esi, dword [esp + 0x3c]
    sub ebx, 0x3000
    push esi
    mov edx, dword [esp + 0x70]
    mov eax, dword [esp + 0x6c]
    call 0x6ae4d
    test eax, eax
    je near loc_3c13
loc_3689:
    mov eax, dword [esp + 0x54]
    or byte [eax + 6], 4
    mov eax, dword [esp + 0x24]
    cmp word [eax + 0x312], 0xa
    jne short loc_36b0
    call 0xa29dc
    test al, 7
    jne short loc_36b0
    mov eax, dword [esp + 0x54]
    and byte [eax + 6], 0xfb
loc_36b0:
    mov eax, dword [esp + 0x24]
    cmp word [eax + 0x312], 0xd
    jne short loc_36d9
    call 0xa29dc
    mov edx, eax
    mov ebx, 0x11
    sar edx, 0x1f
    idiv ebx
    mov eax, dword [esp + 0x54]
    shl edx, 8
    or dword [eax + 6], edx
loc_36d9:
    mov eax, dword [esp + 0x24]
    mov di, word [eax + 0x312]
    cmp di, 3
    je short loc_3706
    cmp di, 1
    je short loc_3706
    cmp di, 4
    je short loc_3706
    cmp di, 2
    je short loc_3706
    cmp di, 5
    jne near loc_37c6
loc_3706:
    push 0x1000040
    lea eax, [esp + 4]
    push eax
    lea eax, [esp + 0xc]
    push eax
    lea eax, [esp + 0x14]
    push eax
    lea eax, [esp + 0x84]
    push eax
    lea eax, [esp + 0x84]
    mov edx, dword [esp + 0x38]
    push eax
    lea eax, [esp + 0x90]
    mov edi, dword [edx + 0x220]
    push eax
    mov eax, 0x64
    movsx edx, word [edx + 0x318]
    sub eax, edi
    sub eax, edx
    shl eax, 5
    push eax
    mov eax, dword [esp + 0x40]
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    push eax
    mov eax, dword [esp + 0x44]
    add eax, 0x200
    mov ebx, dword [esp + 0x68]
    and eax, 0x7ff
    mov ecx, dword [esp + 0x60]
    sub ebx, 0x2600
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov edx, dword [esp + 0x84]
    push eax
    mov eax, dword [esp + 0x84]
    mov ebp, dword [esp + 0x84]
    call 0x6b0c1
    mov edx, dword [esp + 8]
    sub edx, ebp
    imul edx, edx
    mov eax, dword [esp + 4]
    sub eax, dword [esp + 0x60]
    imul eax, eax
    add eax, edx
    cmp eax, 0x640000
    jge short loc_37c6
    mov eax, dword [esp + 0x54]
    and byte [eax + 6], 0xfb
loc_37c6:
    mov edx, dword [esp + 0x50]
    mov edx, dword [edx*4 + 0xf34c0]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x12, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5212]
    mov edx, dword [esp + 0x24]
    lea ebx, [eax*4]
    movsx edx, word [edx + 0x312]
    lea eax, [edx*4]
    sub eax, edx
    shl eax, 4
    mov ebx, dword [ebx + eax + 0x92a4]
    cmp ebx, 0x80
    jge short loc_381b
    mov ebx, 0x80
loc_381b:
    mov edx, dword [esp + 0x30]
    sub edx, dword [esp + 0x5c]
    imul edx, edx
    mov eax, dword [esp + 0x34]
    sub eax, dword [esp + 0x60]
    imul eax, eax
    add eax, edx
    call 0x6577d
    mov ebp, eax
    test eax, eax
    jne short loc_3843
    mov ebp, 1
loc_3843:
    mov edx, dword [esp + 0x50]
    mov edx, dword [edx*4 + 0xf34c0]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov edi, dword [esp + 0x34]
    sub eax, edx
    mov ecx, dword [esp + 0x60]
    mov esi, dword [esp + 0x30]
    db 0x8b, 0x14, 0x45, 0x50, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb5150]
    db 0x8b, 0x04, 0x45, 0x4c, 0x51, 0x0b, 0x00    ; mov eax, dword [eax*2 + 0xb514c]
    sar edx, 0xe
    sar eax, 0xe
    add edx, edi
    mov edi, dword [esp + 0x5c]
    add eax, esi
    sub edx, ecx
    sub eax, edi
    mov ecx, dword [esp + 0x2c]
    call 0x65698
    mov dword [esp + 0x38], eax
    sub ecx, dword [esp + 0x44]
    lea edx, [ecx*8]
    mov eax, edx
    sar edx, 0x1f
    idiv ebp
    mov edx, 0x64
    sub edx, eax
    mov eax, ecx
    test eax, eax
    jns short loc_38b8
    neg eax
loc_38b8:
    sar eax, 4
    mov dword [esp + 0x1c], edx
    cmp ebx, eax
    jg short loc_38d0
    mov eax, ecx
    test eax, eax
    jns short loc_38cb
    neg eax
loc_38cb:
    mov ebx, eax
    sar ebx, 4
loc_38d0:
    mov edx, dword [esp + 0x50]
    mov edx, dword [edx*4 + 0xf34c0]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x1c0bb9], 0x20
    jae short loc_390e
    mov eax, dword [esp + 0x54]
    mov dh, byte [eax + 6]
    and dh, 0xfb
    xor ebx, ebx
    mov byte [eax + 6], dh
loc_390e:
    mov edx, dword [esp + 0x50]
    mov edx, dword [edx*4 + 0xf34c0]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x1c0bb5], 1
    jne short loc_394c
    mov eax, dword [esp + 0x54]
    mov ch, byte [eax + 6]
    and ch, 0xfb
    xor ebx, ebx
    mov byte [eax + 6], ch
loc_394c:
    cmp ebp, 0x100
    jge short loc_395c
    mov eax, dword [esp + 0x54]
    or byte [eax + 8], 0x40
loc_395c:
    mov eax, dword [esp + 0x5c]
    mov edx, dword [esp + 0x30]
    sub eax, edx
    mov dword [esp + 0x18], eax
    imul eax, ebx
    mov edx, eax
    sar edx, 0x1f
    idiv ebp
    mov edx, dword [esp + 0x30]
    mov ecx, dword [esp + 0x34]
    add edx, eax
    mov eax, dword [esp + 0x60]
    sub eax, ecx
    mov dword [esp + 0x14], eax
    imul eax, ebx
    mov dword [esp + 8], edx
    mov edx, eax
    sar edx, 0x1f
    idiv ebp
    lea edx, [ecx + eax]
    mov esi, dword [esp + 0x5c]
    mov dword [esp + 4], edx
    mov edx, dword [esp + 8]
    sub edx, esi
    mov eax, edx
    shl eax, 0xb
    sub eax, edx
    mov edx, eax
    sar edx, 0x1f
    idiv ebp
    mov edx, eax
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 2]
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 2], ax
    mov edi, dword [esp + 0x60]
    mov edx, dword [esp + 4]
    sub edx, edi
    mov eax, edx
    shl eax, 0xb
    sub eax, edx
    mov edx, eax
    sar edx, 0x1f
    idiv ebp
    mov edx, eax
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 4]
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 4], ax
    test ebx, ebx
    je near loc_3b5c
    mov edx, dword [esp + 0x50]
    mov eax, edx
    shl eax, 4
    sub eax, edx
    shl eax, 5
    add eax, edx
    lea eax, [eax*4]
    mov edx, eax
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x2454ac]
    add edx, eax
    mov eax, edx
    shl eax, 6
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x3c, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edi, word [eax*2 + 0x1b7fa4]
    mov eax, edx
    shl eax, 5
    add eax, 0x212a0
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    add edi, eax
    mov eax, edx
    shl eax, 4
    add eax, 0x1a590
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov dword [esp + 0x6c], edx
    add edi, eax
    lea eax, [edx*8]
    add eax, 0x1ea28
    and eax, 0x7ff
    mov edx, dword [esp + 0x50]
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov edx, dword [edx*4 + 0xf34c0]
    add edi, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x1c0bc0]
    mov ax, word [eax + 0x1c0bc0]
    and ah, 7
    cwde
    mov ebp, dword [esp + 0x18]
    db 0x0f, 0xbf, 0x34, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx esi, word [eax*2 + 0x1b7fa4]
    imul esi, ebp
    add edx, 0x200
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x0c, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx ecx, word [edx*2 + 0x1b7fa4]
    imul ecx, dword [esp + 0x14]
    cmp esi, ecx
    jle short loc_3af6
    add edi, 0x2000
    jmp short loc_3afc
loc_3af6:
    sub edi, 0x2000
loc_3afc:
    mov edx, dword [esp + 0x38]
    add edx, 0x400
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    imul edx, edi
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 2]
    sar edx, 0x11
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 2], ax
    mov edx, dword [esp + 0x38]
    add edx, 0x200
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    imul edx, edi
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 4]
    sar edx, 0x11
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 4], ax
loc_3b5c:
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x20]
    add eax, 0x400
    sub eax, edx
    and eax, 0x7ff
    sub eax, 0x400
    sar eax, 1
    cmp eax, -0x7f
    jg short loc_3b81
    mov eax, 0xffffff81
loc_3b81:
    cmp eax, 0x7f
    jge short loc_3bad
    mov eax, dword [esp + 0x38]
    mov ebx, dword [esp + 0x20]
    add eax, 0x400
    sub eax, ebx
    and eax, 0x7ff
    sub eax, 0x400
    sar eax, 1
    cmp eax, -0x7f
    jg short loc_3bb2
    mov eax, 0xffffff81
    jmp short loc_3bb2
loc_3bad:
    mov eax, 0x7f
loc_3bb2:
    mov edx, dword [esp + 0x54]
    mov byte [edx], al
    mov edx, dword [esp + 0x24]
    mov eax, dword [esp + 0x1c]
    sub eax, dword [edx + 0x220]
    sar eax, 1
    cmp eax, -0x7f
    jg short loc_3bd2
    mov eax, 0xffffff81
loc_3bd2:
    cmp eax, 0x7f
    jge short loc_3bf3
    mov edx, dword [esp + 0x24]
    mov eax, dword [esp + 0x1c]
    sub eax, dword [edx + 0x220]
    sar eax, 1
    cmp eax, -0x7f
    jg short loc_3bf8
    mov eax, 0xffffff81
    jmp short loc_3bf8
loc_3bf3:
    mov eax, 0x7f
loc_3bf8:
    mov edx, dword [esp + 0x54]
    mov byte [edx + 1], al
    mov eax, edx
    mov dh, byte [edx + 8]
    or dh, 0x80
    mov byte [eax + 8], dh
    add esp, 0x7c
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_3c13:
    mov eax, dword [esp + 0x50]
    lea eax, [eax*4]
    mov edi, 0xffffffff
    mov dword [eax + 0xf3480], edi
    test edi, edi
    jge near loc_44a8
    mov edx, dword [esp + 0x24]
    mov dword [eax + 0xf4640], edi
    movsx edx, word [edx + 0x340]
    imul edx, edx, 0x2c
    movsx edx, word [edx + 0x1c0bbc]
    mov dword [esp + 0x28], edx
    mov edx, dword [eax + 0xf34c0]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    mov ecx, 0x80
    movsx eax, word [eax + 0x1c0bbc]
    mov edi, 0xf3400
    mov dword [esp + 0x40], eax
    xor eax, eax
    mov dl, 1
    cmp ecx, 4
    jae short loc_3c9c
    test cl, 1
    je short loc_3c95
    db 0xaa    ; stosb byte es:[edi], al
loc_3c95:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_3cc7
loc_3c9c:
    test edi, 1
    je short loc_3ca6
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_3ca6:
    test edi, 2
    je short loc_3cb3
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_3cb3:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_3cc1
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_3cc1:
    test bl, 1
    je short loc_3cc7
    db 0xaa    ; stosb byte es:[edi], al
loc_3cc7:
    mov eax, dword [esp + 0x28]
    mov ebx, 0xffffffff
    mov cl, byte [esp + 0x28]
    mov word [0xf3e40], ax
    mov word [0xf3500], bx
    mov eax, dword [esp + 0x28]
    and cl, 7
    sar eax, 3
    shl dl, cl
    mov bl, byte [eax + 0xf3400]
    or bl, dl
    mov ecx, 1
    mov byte [eax + 0xf3400], bl
    xor ebx, ebx
    mov dword [esp + 0x64], ecx
    mov dword [esp + 0x4c], ebx
    jmp near loc_449a
loc_3d0f:
    db 0x0f, 0xbf, 0x14, 0x45, 0x40, 0x3e, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf3e40]
    lea eax, [edx*4]
    add eax, edx
    movsx ecx, word [eax*8 + 0x2385a4]
    movsx eax, word [eax*8 + 0x2385a6]
    lea edx, [ecx + eax]
    mov ebp, 0x1ecda4
    mov edi, ecx
    shl ecx, 5
    mov dword [esp + 0x58], edx
    add ebp, ecx
    jmp near loc_41a7
loc_3d48:
    movsx eax, word [ebp + 0xc]
    mov dword [esp + 0x6c], eax
    test eax, eax
    jl near loc_41a3
    movsx edx, word [ebp + 8]
    mov ebx, dword [ebp]
    shl edx, 5
    mov esi, dword [ebp + 4]
    mov ecx, dword [edx + 0x1ecda4]
    mov eax, dword [edx + 0x1ecda8]
    add ecx, ebx
    add esi, eax
    mov eax, dword [esp + 0x6c]
    sar esi, 1
    sar ecx, 1
    mov ebx, esi
    mov edx, ecx
    call 0x7739f
    mov dword [esp + 0xc], eax
    mov ebx, esi
    mov edx, ecx
    mov eax, dword [esp + 0x6c]
    call 0x772c1
    mov edx, dword [esp + 0xc]
    sub edx, 0x1c00
    cmp eax, edx
    jle short loc_3dd4
    mov edx, dword [esp + 0x6c]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov dx, word [eax + 0x2385c6]
    cmp dx, 0xf
    jl near loc_41a3
    cmp dx, 0x16
    jg near loc_41a3
loc_3dd4:
    mov eax, dword [esp + 0x4c]
    mov ebx, esi
    mov edx, ecx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x3e, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf3e40]
    call 0x7739f
    mov dword [esp + 0xc], eax
    mov ebx, esi
    mov edx, ecx
    mov eax, dword [esp + 0x6c]
    call 0x7739f
    mov edx, dword [esp + 0xc]
    sub edx, 0x4800
    cmp eax, edx
    jl near loc_41a3
    mov eax, dword [esp + 0x6c]
    mov ecx, dword [esp + 0x6c]
    mov edx, 1
    xor ebx, ebx
    sar eax, 3
    and ecx, 7
    mov bl, byte [eax + 0xf3400]
    shl edx, cl
    test ebx, edx
    jne near loc_41a3
    mov cl, byte [esp + 0x6c]
    mov dl, 1
    and cl, 7
    shl dl, cl
    or bl, dl
    mov byte [eax + 0xf3400], bl
    mov eax, dword [esp + 0x64]
    mov edx, dword [esp + 0x6c]
    db 0x66, 0x89, 0x14, 0x45, 0x40, 0x3e, 0x0f, 0x00    ; mov word [eax*2 + 0xf3e40], dx
    inc eax
    mov edx, dword [esp + 0x4c]
    mov dword [esp + 0x64], eax
    db 0x66, 0x89, 0x14, 0x45, 0xfe, 0x34, 0x0f, 0x00    ; mov word [eax*2 + 0xf34fe], dx
    mov eax, dword [esp + 0x6c]
    mov edx, dword [esp + 0x40]
    cmp eax, edx
    jne near loc_41a3
    mov ecx, 0x80
    mov edi, 0xf3400
    xor eax, edx
    mov ebp, dword [esp + 0x64]
    cmp ecx, 4
    jae short loc_3e97
    test cl, 1
    je short loc_3e90
    db 0xaa    ; stosb byte es:[edi], al
loc_3e90:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_3ec2
loc_3e97:
    test edi, 1
    je short loc_3ea1
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_3ea1:
    test edi, 2
    je short loc_3eae
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_3eae:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_3ebc
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_3ebc:
    test bl, 1
    je short loc_3ec2
    db 0xaa    ; stosb byte es:[edi], al
loc_3ec2:
    dec ebp
    test ebp, ebp
    jge short loc_3ece
    mov ebp, dword [esp + 0x64]
    dec ebp
    jmp short loc_3f1e
loc_3ece:
    mov dl, 1
    db 0x0f, 0xbf, 0x04, 0x6d, 0x40, 0x3e, 0x0f, 0x00    ; movsx eax, word [ebp*2 + 0xf3e40]
    db 0x8a, 0x0c, 0x6d, 0x40, 0x3e, 0x0f, 0x00    ; mov cl, byte [ebp*2 + 0xf3e40]
    sar eax, 3
    and cl, 7
    mov bh, byte [eax + 0xf3400]
    shl dl, cl
    or bh, dl
    db 0x0f, 0xbf, 0x2c, 0x6d, 0x00, 0x35, 0x0f, 0x00    ; movsx ebp, word [ebp*2 + 0xf3500]
    mov byte [eax + 0xf3400], bh
    test ebp, ebp
    jge short loc_3ece
    mov ebp, dword [esp + 0x64]
    dec ebp
    jmp short loc_3f1e
loc_3f08:
    db 0x8d, 0x04, 0x6d, 0x00, 0x00, 0x00, 0x00    ; lea eax, [ebp*2]
    mov cx, word [eax + 0xf3500]
    test cx, cx
    je short loc_3f22
    movsx ebp, cx
loc_3f1e:
    test ebp, ebp
    jge short loc_3f08
loc_3f22:
    mov eax, dword [esp + 0x50]
    db 0x0f, 0xbf, 0x14, 0x6d, 0x40, 0x3e, 0x0f, 0x00    ; movsx edx, word [ebp*2 + 0xf3e40]
    mov dword [eax*4 + 0xf3480], edx
    lea eax, [edx*4]
    add eax, edx
    xor ebx, ebx
    movsx ecx, word [eax*8 + 0x2385a4]
    movsx eax, word [eax*8 + 0x2385a6]
    mov dword [esp + 4], ebx
    lea edx, [ecx + eax]
    mov dword [esp + 8], ebx
    mov dword [esp + 0x58], edx
    mov edi, ecx
    mov ebp, dword [esp + 0x58]
    jmp short loc_3f8d
loc_3f67:
    mov edx, edi
    shl edx, 5
    mov ebx, dword [esp + 8]
    mov eax, dword [edx + 0x1ecda4]
    mov esi, dword [esp + 4]
    add ebx, eax
    mov eax, dword [edx + 0x1ecda8]
    inc edi
    add esi, eax
    mov dword [esp + 8], ebx
    mov dword [esp + 4], esi
loc_3f8d:
    cmp edi, ebp
    jl short loc_3f67
    mov eax, dword [esp + 8]
    mov ebx, ebp
    mov edx, eax
    sub ebx, ecx
    sar edx, 0x1f
    idiv ebx
    mov dword [esp + 8], eax
    mov eax, dword [esp + 4]
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov edx, dword [esp + 0x28]
    mov dword [esp + 4], eax
    lea eax, [edx*4]
    add eax, edx
    movsx ecx, word [eax*8 + 0x2385a4]
    movsx eax, word [eax*8 + 0x2385a6]
    lea edx, [ecx + eax]
    mov dword [esp + 0x58], edx
    mov ebp, ecx
    xor eax, eax
    mov edi, ecx
    mov dword [esp + 0x68], eax
    jmp near loc_40c5
loc_3fe6:
    mov eax, edi
    mov edx, dword [esp + 0x50]
    shl eax, 5
    mov ecx, dword [edx*4 + 0xf3480]
    movsx ebx, word [eax + 0x1ecdb0]
    cmp ebx, ecx
    jne near loc_40c4
    movsx edx, word [eax + 0x1ecdac]
    shl edx, 5
    mov esi, dword [eax + 0x1ecda4]
    mov ecx, dword [edx + 0x1ecda4]
    mov ebx, dword [eax + 0x1ecda8]
    sub ecx, esi
    mov esi, dword [edx + 0x1ecda8]
    sub esi, ebx
    sub ebx, dword [esp + 0x60]
    mov dword [esp + 0xc], ebx
    mov ebx, dword [esp + 8]
    sub ebx, dword [esp + 0x5c]
    mov dword [esp + 0x48], ebx
    imul ebx, dword [esp + 0xc]
    mov eax, dword [eax + 0x1ecda4]
    mov dword [esp + 0xc], ebx
    sub eax, dword [esp + 0x5c]
    mov ebx, dword [esp + 0x60]
    mov dword [esp + 0x10], eax
    mov eax, dword [esp + 4]
    sub eax, ebx
    mov ebx, dword [esp + 0x10]
    imul ebx, eax
    mov dword [esp + 0x10], ebx
    mov ebx, dword [esp + 0xc]
    cmp ebx, dword [esp + 0x10]
    jg short loc_40a7
    mov ebx, dword [edx + 0x1ecda8]
    sub ebx, dword [esp + 0x60]
    mov dword [esp + 0x10], ebx
    mov ebx, dword [esp + 0x48]
    imul ebx, dword [esp + 0x10]
    mov edx, dword [edx + 0x1ecda4]
    mov dword [esp + 0x10], ebx
    sub edx, dword [esp + 0x5c]
    imul eax, edx
    cmp eax, dword [esp + 0x10]
    jg short loc_40a7
    mov ebp, edi
    jmp short loc_40cf
loc_40a7:
    imul esi, esi
    mov eax, ecx
    imul eax, ecx
    add eax, esi
    mov ebx, dword [esp + 0x68]
    call 0x6577d
    cmp eax, ebx
    jle short loc_40c4
    mov dword [esp + 0x68], eax
    mov ebp, edi
loc_40c4:
    inc edi
loc_40c5:
    cmp edi, dword [esp + 0x58]
    jl near loc_3fe6
loc_40cf:
    mov ebx, dword [esp + 0x50]
    mov dword [ebx*4 + 0xf4640], ebp
    shl ebp, 5
    movsx ecx, word [ebp + 0x1ecdac]
    mov esi, dword [ebp + 0x1ecda8]
    shl ecx, 5
    mov edi, dword [ebp + 0x1ecda4]
    mov edx, dword [ecx + 0x1ecda8]
    mov eax, dword [ecx + 0x1ecda4]
    sub edx, esi
    sub eax, edi
    call 0x65698
    add eax, 0x600
    movsx edx, word [ebp + 0x1ecdac]
    and eax, 0x7ff
    shl edx, 5
    mov dword [esp + 0x38], eax
    mov ecx, dword [edx + 0x1ecda4]
    add ecx, dword [ebp + 0x1ecda4]
    mov eax, dword [esp + 0x38]
    add eax, 0x200
    and eax, 0x7ff
    mov esi, dword [edx + 0x1ecda8]
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    sar ecx, 1
    sar eax, 8
    mov edx, dword [esp + 0x38]
    add eax, ecx
    and edx, 0x7ff
    mov dword [ebx*4 + 0xf3d80], eax
    mov eax, dword [ebp + 0x1ecda8]
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    add eax, esi
    sar edx, 8
    sar eax, 1
    add eax, edx
    mov edx, dword [ebx*4 + 0xf3480]
    mov dword [ebx*4 + 0xf3d40], eax
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + 0x2385ac]
    sub eax, 0x2000
    mov dword [ebx*4 + 0xf3dc0], eax
    jmp short loc_41b1
loc_41a3:
    inc edi
    add ebp, 0x20
loc_41a7:
    cmp edi, dword [esp + 0x58]
    jl near loc_3d48
loc_41b1:
    mov eax, dword [esp + 0x4c]
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x3e, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf3e40]
    db 0x0f, 0xbf, 0x3c, 0x45, 0xc4, 0x5c, 0x24, 0x00    ; movsx edi, word [eax*2 + 0x245cc4]
    jmp near loc_4480
loc_41ca:
    imul eax, edi, 0x2c
    cmp word [eax + 0x1c0bca], 7
    jne near loc_4478
    movsx eax, word [eax + 0x1c0bc2]
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x1c0bbc]
    mov ebx, 1
    mov dword [esp + 0x6c], eax
    xor edx, edx
    mov ecx, dword [esp + 0x6c]
    sar eax, 3
    and ecx, 7
    mov dl, byte [eax + 0xf3400]
    shl ebx, cl
    test edx, ebx
    jne near loc_4478
    mov cl, byte [esp + 0x6c]
    mov dl, 1
    and cl, 7
    shl dl, cl
    or byte [eax + 0xf3400], dl
    mov eax, dword [esp + 0x64]
    mov edx, dword [esp + 0x6c]
    db 0x66, 0x89, 0x14, 0x45, 0x40, 0x3e, 0x0f, 0x00    ; mov word [eax*2 + 0xf3e40], dx
    mov edx, dword [esp + 0x4c]
    lea ebp, [eax + 1]
    db 0x66, 0x89, 0x14, 0x45, 0x00, 0x35, 0x0f, 0x00    ; mov word [eax*2 + 0xf3500], dx
    mov eax, dword [esp + 0x6c]
    mov edx, dword [esp + 0x40]
    mov dword [esp + 0x64], ebp
    cmp eax, edx
    jne near loc_4478
    mov ecx, 0x80
    mov edi, 0xf3400
    xor eax, edx
    cmp ecx, 4
    jae short loc_4273
    test cl, 1
    je short loc_426c
    db 0xaa    ; stosb byte es:[edi], al
loc_426c:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_429e
loc_4273:
    test edi, 1
    je short loc_427d
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_427d:
    test edi, 2
    je short loc_428a
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_428a:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_4298
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_4298:
    test bl, 1
    je short loc_429e
    db 0xaa    ; stosb byte es:[edi], al
loc_429e:
    dec ebp
    test ebp, ebp
    jge short loc_42aa
    mov ebp, dword [esp + 0x64]
    dec ebp
    jmp short loc_42fa
loc_42aa:
    mov dl, 1
    db 0x8a, 0x0c, 0x6d, 0x40, 0x3e, 0x0f, 0x00    ; mov cl, byte [ebp*2 + 0xf3e40]
    db 0x0f, 0xbf, 0x04, 0x6d, 0x40, 0x3e, 0x0f, 0x00    ; movsx eax, word [ebp*2 + 0xf3e40]
    and cl, 7
    sar eax, 3
    shl dl, cl
    mov ch, byte [eax + 0xf3400]
    or ch, dl
    db 0x0f, 0xbf, 0x2c, 0x6d, 0x00, 0x35, 0x0f, 0x00    ; movsx ebp, word [ebp*2 + 0xf3500]
    mov byte [eax + 0xf3400], ch
    test ebp, ebp
    jge short loc_42aa
    mov ebp, dword [esp + 0x64]
    dec ebp
    jmp short loc_42fa
loc_42e4:
    db 0x8d, 0x04, 0x6d, 0x00, 0x00, 0x00, 0x00    ; lea eax, [ebp*2]
    mov di, word [eax + 0xf3500]
    test di, di
    je short loc_42fe
    movsx ebp, di
loc_42fa:
    test ebp, ebp
    jge short loc_42e4
loc_42fe:
    mov eax, dword [esp + 0x50]
    db 0x0f, 0xbf, 0x14, 0x6d, 0x40, 0x3e, 0x0f, 0x00    ; movsx edx, word [ebp*2 + 0xf3e40]
    mov dword [eax*4 + 0xf3480], edx
    mov edx, dword [esp + 0x28]
    lea eax, [edx*4]
    add eax, edx
    movsx ecx, word [eax*8 + 0x2385a4]
    movsx eax, word [eax*8 + 0x2385a6]
    xor ebx, ebx
    lea edx, [ecx + eax]
    mov dword [esp + 0x68], ebx
    mov dword [esp + 0x58], edx
    mov ebp, ecx
    mov edi, ecx
    jmp short loc_4394
loc_4341:
    mov edx, edi
    shl edx, 5
    movsx esi, word [edx + 0x1ecdac]
    shl esi, 5
    mov eax, dword [edx + 0x1ecda4]
    mov ecx, dword [esi + 0x1ecda4]
    sub ecx, eax
    imul ecx, ecx
    mov esi, dword [esi + 0x1ecda8]
    sub esi, dword [edx + 0x1ecda8]
    imul esi, esi
    lea eax, [ecx + esi]
    call 0x6577d
    movsx edx, word [edx + 0x1ecdb0]
    cmp edx, dword [ebx + 0xf3480]
    jne short loc_4393
    cmp eax, dword [esp + 0x68]
    jle short loc_4393
    mov dword [esp + 0x68], eax
    mov ebp, edi
loc_4393:
    inc edi
loc_4394:
    mov ebx, dword [esp + 0x50]
    mov ecx, dword [esp + 0x58]
    lea ebx, [ebx*4]
    cmp edi, ecx
    jl short loc_4341
    mov dword [ebx + 0xf4640], ebp
    shl ebp, 5
    movsx edx, word [ebp + 0x1ecdac]
    mov esi, dword [ebp + 0x1ecda8]
    shl edx, 5
    mov edi, dword [ebp + 0x1ecda4]
    mov ecx, dword [edx + 0x1ecda8]
    mov eax, dword [edx + 0x1ecda4]
    sub ecx, esi
    sub eax, edi
    mov edx, ecx
    call 0x65698
    add eax, 0x600
    movsx edx, word [ebp + 0x1ecdac]
    and eax, 0x7ff
    shl edx, 5
    mov dword [esp + 0x38], eax
    mov ecx, dword [edx + 0x1ecda4]
    mov eax, dword [ebp + 0x1ecda4]
    add eax, ecx
    mov ecx, dword [esp + 0x38]
    add ecx, 0x200
    and ecx, 0x7ff
    db 0x0f, 0xbf, 0x0c, 0x4d, 0xa4, 0x7f, 0x1b, 0x00    ; movsx ecx, word [ecx*2 + 0x1b7fa4]
    sar eax, 1
    sar ecx, 8
    add eax, ecx
    mov esi, dword [edx + 0x1ecda8]
    mov dword [ebx + 0xf3d80], eax
    mov eax, dword [ebp + 0x1ecda8]
    lea edx, [eax + esi]
    mov eax, dword [esp + 0x38]
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    sar edx, 1
    sar eax, 8
    add eax, edx
    mov edx, dword [ebx + 0xf3480]
    mov dword [ebx + 0xf3d40], eax
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + 0x2385ac]
    sub eax, 0x2000
    mov dword [ebx + 0xf3dc0], eax
    jmp short loc_4488
loc_4478:
    db 0x0f, 0xbf, 0x3c, 0x7d, 0xa4, 0xc8, 0x1b, 0x00    ; movsx edi, word [edi*2 + 0x1bc8a4]
loc_4480:
    test edi, edi
    jge near loc_41ca
loc_4488:
    mov eax, dword [esp + 0x50]
    cmp dword [eax*4 + 0xf4640], 0
    jge short loc_44a8
    inc dword [esp + 0x4c]
loc_449a:
    mov eax, dword [esp + 0x4c]
    cmp eax, dword [esp + 0x64]
    jl near loc_3d0f
loc_44a8:
    mov eax, dword [esp + 0x50]
    lea eax, [eax*4]
    cmp dword [eax + 0xf3480], 0
    jl short loc_44c9
    cmp dword [eax + 0xf4640], 0
    jge near loc_46c4
loc_44c9:
    mov eax, dword [esp + 0x50]
    cmp dword [eax*4 + 0xf3d00], 0
    jge near loc_45cd
    xor ebp, ebp
    jmp near loc_45c4
loc_44e2:
    call 0xa29dc
    mov edx, eax
    movsx ebx, word [0x246502]
    sar edx, 0x1f
    idiv ebx
    db 0x0f, 0xbf, 0x04, 0x55, 0xc4, 0x5c, 0x24, 0x00    ; movsx eax, word [edx*2 + 0x245cc4]
    mov edi, edx
    jmp near loc_45b3
loc_4504:
    imul esi, eax, 0x2c
    cmp byte [esi + 0x1c0bb8], 0
    jbe near loc_45a7
    cmp byte [esi + 0x1c0bb9], 0
    jbe near loc_45a7
    mov eax, dword [esp + 0x50]
    movsx edx, word [esi + 0x1c0bb2]
    call loc_2b1c
    test eax, eax
    jle short loc_45a7
    mov eax, dword [esi + 0x1c0bac]
    push edi
    sub eax, 0x400
    mov edx, dword [esp + 0x64]
    push eax
    mov ebx, dword [esi + 0x1c0ba8]
    mov ecx, dword [esi + 0x1c0ba4]
    push ebx
    mov eax, dword [esp + 0x68]
    mov ebx, dword [esp + 0x50]
    push ecx
    mov ecx, dword [esp + 0x4c]
    sub ebx, 0x2000
    call 0x6ae4d
    test eax, eax
    je short loc_45a7
    mov eax, dword [esp + 0x50]
    mov edx, dword [esi + 0x1c0ba4]
    mov dword [eax*4 + 0xf3d80], edx
    mov edx, dword [esi + 0x1c0ba8]
    mov dword [eax*4 + 0xf3d40], edx
    mov edx, dword [esi + 0x1c0bac]
    mov dword [eax*4 + 0xf3dc0], edx
    mov edx, dword [esp + 0x6c]
    mov dword [eax*4 + 0xf3d00], edx
    jmp short loc_45c3
loc_45a7:
    mov eax, dword [esp + 0x6c]
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0xc8, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1bc8a4]
loc_45b3:
    mov dword [esp + 0x6c], eax
    mov eax, dword [esp + 0x6c]
    test eax, eax
    jge near loc_4504
loc_45c3:
    inc ebp
loc_45c4:
    cmp ebp, 4
    jl near loc_44e2
loc_45cd:
    mov eax, dword [esp + 0x50]
    mov edx, dword [eax*4 + 0xf3d80]
    mov esi, dword [esp + 0x5c]
    mov ebx, edx
    mov eax, dword [eax*4 + 0xf3d40]
    sub ebx, esi
    mov dword [esp + 0x34], eax
    mov eax, ebx
    imul eax, ebx
    mov edi, dword [esp + 0x60]
    mov ecx, dword [esp + 0x34]
    sub ecx, edi
    mov dword [esp + 0x30], edx
    mov edx, ecx
    imul edx, ecx
    add eax, edx
    call 0x6577d
    mov esi, eax
    test eax, eax
    je near loc_4c2d
    mov edx, ecx
    mov eax, ebx
    call 0x65698
    mov edx, ebx
    shl edx, 0xb
    mov edi, eax
    sub edx, ebx
    mov dword [esp + 0x38], eax
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    mov edx, eax
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 2]
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 2], ax
    mov edx, ecx
    shl edx, 0xb
    sub edx, ecx
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    mov edx, eax
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 4]
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov ebp, dword [esp + 0x20]
    mov word [edx + 4], ax
    lea eax, [edi + 0x400]
    sub eax, ebp
    and eax, 0x7ff
    sub eax, 0x400
    sar eax, 3
    cmp eax, -0x7f
    jg short loc_468a
    mov eax, 0xffffff81
loc_468a:
    cmp eax, 0x7f
    jge short loc_46b7
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x20]
    add eax, 0x400
    sub eax, edx
    and eax, 0x7ff
    sub eax, 0x400
    sar eax, 3
    cmp eax, -0x7f
    jg short loc_46bc
    mov eax, 0xffffff81
    jmp short loc_46bc
loc_46b7:
    mov eax, 0x7f
loc_46bc:
    mov edx, dword [esp + 0x54]
    mov byte [edx], al
    jmp short loc_46ce
loc_46c4:
    mov dword [eax + 0xf3d00], 0xffffffff
loc_46ce:
    mov eax, dword [esp + 0x24]
    mov eax, dword [eax + 0x214]
    mov dword [esp + 8], eax
    mov eax, dword [esp + 0x24]
    mov eax, dword [eax + 0x218]
    mov dword [esp + 4], eax
    mov eax, dword [esp + 0x24]
    mov eax, dword [eax + 0x21c]
    push 0x10001
    mov dword [esp + 4], eax
    mov eax, dword [esp + 0x28]
    push 0x400
    mov ax, word [eax + 0x29e]
    push 0x400
    mov dword [esp + 0x84], eax
    mov eax, dword [esp + 0x30]
    push 0xa4
    mov ebx, dword [eax + 0x250]
    lea edx, [esp + 0x14]
    push ebx
    mov ecx, dword [eax + 0x24c]
    lea eax, [esp + 0x1c]
    push ecx
    lea ebx, [esp + 0x18]
    lea ecx, [esp + 0x90]
    call 0x6cb75
    mov edi, eax
    test eax, eax
    jne near loc_47d3
    mov eax, dword [esp + 0x24]
    mov eax, dword [eax + 0x214]
    mov dword [esp + 8], eax
    mov eax, dword [esp + 0x24]
    mov eax, dword [eax + 0x218]
    mov dword [esp + 4], eax
    mov eax, dword [esp + 0x24]
    mov eax, dword [eax + 0x21c]
    add eax, 0x1800
    push 0x10001
    mov dword [esp + 4], eax
    mov eax, dword [esp + 0x28]
    push 0x400
    mov ax, word [eax + 0x29e]
    push 0x400
    mov dword [esp + 0x84], eax
    mov eax, dword [esp + 0x30]
    push 0xa4
    mov esi, dword [eax + 0x250]
    lea ecx, [esp + 0x88]
    push esi
    mov edi, dword [eax + 0x24c]
    lea ebx, [esp + 0x14]
    push edi
    lea edx, [esp + 0x1c]
    lea eax, [esp + 0x20]
    call 0x6cb75
    mov edi, eax
loc_47d3:
    mov eax, dword [esp + 0x50]
    lea eax, [eax*4]
    test edi, edi
    je near loc_4aac
    xor edx, edx
    mov ebx, dword [eax + 0xf3e00]
    mov dword [esp + 0x6c], edx
    mov edx, edi
    inc ebx
    and edx, 0xc000
    mov dword [eax + 0xf3e00], ebx
    cmp edx, 0x8000
    jne near loc_48a4
    mov eax, edi
    and eax, 0x1fff
    shl eax, 5
    cmp word [eax + 0x1ecdb0], 0
    jl near loc_48a4
    mov ecx, dword [esp + 0x24]
    mov ebx, dword [esp + 0x24]
    mov edx, dword [esp + 0x24]
    movsx eax, word [eax + 0x1ecdb0]
    mov ecx, dword [ecx + 0x21c]
    mov ebx, dword [ebx + 0x218]
    mov edx, dword [edx + 0x214]
    add ecx, 0x1800
    call 0x7739f
    cmp eax, ecx
    jg short loc_4861
    mov dword [esp + 0x6c], 1
loc_4861:
    mov ecx, dword [esp + 0x24]
    mov ebx, dword [esp + 0x24]
    mov eax, edi
    mov edx, dword [esp + 0x24]
    and eax, 0x1fff
    mov ecx, dword [ecx + 0x21c]
    mov ebx, dword [ebx + 0x218]
    shl eax, 5
    mov edx, dword [edx + 0x214]
    movsx eax, word [eax + 0x1ecdb0]
    sub ecx, 0x1800
    call 0x772c1
    cmp eax, ecx
    jl short loc_48a4
    or byte [esp + 0x6c], 2
loc_48a4:
    mov eax, edi
    and eax, 0xc000
    cmp eax, 0xc000
    jne short loc_48ba
    mov dword [esp + 0x6c], 1
loc_48ba:
    test byte [esp + 0x6c], 1
    je short loc_48d7
    mov eax, dword [esp + 0x50]
    cmp dword [eax*4 + 0xf3e00], 4
    jne short loc_48d7
    mov eax, dword [esp + 0x54]
    or byte [eax + 6], 1
loc_48d7:
    test byte [esp + 0x6c], 2
    je short loc_48e6
    mov eax, dword [esp + 0x54]
    or byte [eax + 6], 2
loc_48e6:
    mov edx, dword [esp + 0x34]
    mov eax, dword [esp + 0x60]
    mov ebx, dword [esp + 0x5c]
    sub edx, eax
    mov eax, dword [esp + 0x30]
    sub eax, ebx
    call 0x65698
    mov dword [esp + 0x38], eax
    mov eax, edi
    and eax, 0xc000
    cmp eax, 0x8000
    jne short loc_4950
    mov eax, edi
    and eax, 0x1fff
    shl eax, 5
    movsx ebx, word [eax + 0x1ecdac]
    shl ebx, 5
    mov ecx, dword [eax + 0x1ecda8]
    mov edx, dword [ebx + 0x1ecda8]
    sub edx, ecx
    mov ecx, edx
    mov edx, dword [ebx + 0x1ecda4]
    mov esi, dword [eax + 0x1ecda4]
    mov eax, edx
    mov edx, ecx
    sub eax, esi
    call 0x65698
    mov dword [esp + 0x38], eax
loc_4950:
    mov edx, dword [esp + 0x50]
    mov eax, edx
    shl eax, 4
    sub eax, edx
    shl eax, 5
    add eax, edx
    lea eax, [eax*4]
    mov edx, eax
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x2454ac]
    add edx, eax
    mov eax, edx
    mov edi, edx
    shl eax, 5
    shl edi, 6
    add eax, 0x212a0
    and edi, 0x7ff
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x3c, 0x7d, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edi, word [edi*2 + 0x1b7fa4]
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    add edi, eax
    mov eax, edx
    shl eax, 4
    add eax, 0x1a590
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov dword [esp + 0x6c], edx
    add edi, eax
    lea eax, [edx*8]
    mov edx, dword [esp + 0x38]
    add eax, 0x1ea28
    add edx, 0x400
    and eax, 0x7ff
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    add edi, eax
    imul edx, edi
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 2]
    sar edx, 0x11
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 2], ax
    mov eax, dword [esp + 0x38]
    add eax, 0x200
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [eax*2 + 0x1b7fa4]
    imul edx, edi
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 4]
    sar edx, 0x11
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 4], ax
    mov eax, dword [esp + 0x50]
    mov eax, dword [eax*4 + 0xf3e00]
    and eax, 0x1f
    cmp eax, 2
    jne short loc_4a53
    or byte [edx + 9], 0x20
loc_4a53:
    mov eax, dword [esp + 0x50]
    mov eax, dword [eax*4 + 0xf3e00]
    and eax, 0x1f
    cmp eax, 0x11
    jne short loc_4a6e
    mov eax, dword [esp + 0x54]
    or byte [eax + 8], 0x40
loc_4a6e:
    mov eax, dword [esp + 0x50]
    lea eax, [eax*4]
    cmp dword [eax + 0xf3e00], 0x20
    jle short loc_4a9b
    mov ebp, 0xffffffff
    xor ebx, ebx
    mov dword [eax + 0xf3480], ebp
    mov dword [eax + 0xf4640], ebp
    mov dword [eax + 0xf3e00], ebx
loc_4a9b:
    mov eax, dword [esp + 0x50]
    mov dword [eax*4 + 0xf3d00], 0xffffffff
    jmp short loc_4ab2
loc_4aac:
    mov dword [eax + 0xf3e00], edi
loc_4ab2:
    mov ebx, dword [esp + 0x50]
    lea ebx, [ebx*4]
    cmp dword [ebx + 0xf3480], 0
    jl near loc_4c2d
    cmp dword [ebx + 0xf4640], 0
    jl near loc_4c2d
    mov eax, dword [ebx + 0xf3d80]
    mov dword [esp + 0x30], eax
    mov ebp, dword [esp + 0x5c]
    mov esi, dword [esp + 0x30]
    sub esi, ebp
    mov ecx, esi
    imul ecx, esi
    mov eax, dword [ebx + 0xf3d40]
    mov dword [esp + 0x34], eax
    mov edx, eax
    mov eax, dword [esp + 0x60]
    sub edx, eax
    mov eax, edx
    imul eax, edx
    add eax, ecx
    call 0x6577d
    mov ecx, eax
    mov ebp, eax
    test eax, eax
    je near loc_4c2d
    mov eax, esi
    call 0x65698
    mov edx, dword [ebx + 0xf4640]
    mov dword [esp + 0x38], eax
    test edx, edx
    jl short loc_4b77
    cmp ecx, 0x1000
    jge short loc_4b77
    shl edx, 5
    movsx ecx, word [edx + 0x1ecdac]
    shl ecx, 5
    mov ebx, dword [edx + 0x1ecda8]
    mov eax, dword [ecx + 0x1ecda8]
    sub eax, ebx
    mov ebx, eax
    mov eax, dword [ecx + 0x1ecda4]
    mov ecx, dword [edx + 0x1ecda4]
    mov edx, ebx
    sub eax, ecx
    call 0x65698
    add eax, 0x600
    and eax, 0x7ff
    mov dword [esp + 0x38], eax
loc_4b77:
    mov edx, dword [esp + 0x30]
    mov esi, dword [esp + 0x5c]
    sub edx, esi
    mov eax, edx
    shl eax, 0xb
    sub eax, edx
    mov edx, eax
    sar edx, 0x1f
    idiv ebp
    mov edx, eax
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 2]
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov edi, dword [esp + 0x60]
    mov word [edx + 2], ax
    mov edx, dword [esp + 0x34]
    sub edx, edi
    mov eax, edx
    shl eax, 0xb
    sub eax, edx
    mov edx, eax
    sar edx, 0x1f
    idiv ebp
    mov edx, eax
    mov eax, dword [esp + 0x54]
    movsx eax, word [eax + 4]
    add eax, edx
    mov edx, dword [esp + 0x54]
    mov word [edx + 4], ax
    mov eax, dword [esp + 0x38]
    mov ebp, dword [esp + 0x20]
    add eax, 0x400
    sub eax, ebp
    and eax, 0x7ff
    sub eax, 0x400
    sar eax, 3
    cmp eax, -0x7f
    jg short loc_4bf5
    mov eax, 0xffffff81
loc_4bf5:
    cmp eax, 0x7f
    jge short loc_4c22
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x20]
    add eax, 0x400
    sub eax, edx
    and eax, 0x7ff
    sub eax, 0x400
    sar eax, 3
    cmp eax, -0x7f
    jg short loc_4c27
    mov eax, 0xffffff81
    jmp short loc_4c27
loc_4c22:
    mov eax, 0x7f
loc_4c27:
    mov edx, dword [esp + 0x54]
    mov byte [edx], al
loc_4c2d:
    add esp, 0x7c
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    add byte [eax], al
    add byte [eax], al
    add byte [eax], al
loc_4c3c:
    push ecx
    push edx
    movsx edx, ax
    mov cl, al
    mov al, 1
    and cl, 7
    sar edx, 3
    shl al, cl
    or byte [edx + 0x1af4a4], al
    pop edx
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
loc_4c5c:
    push ebx
    push ecx
    push edx
    push esi
    mov esi, eax
    cmp dword [0xe97ab], 0
    je short loc_4c82
    cwde
    imul eax, eax, 0x2c
    add eax, 0x1c0ba4
    call 0x12be0
    test ax, ax
    jne near loc_522c
loc_4c82:
    movsx edx, si
    imul edx, edx, 0x2c
    mov dx, word [edx + 0x1c0bb2]
    mov cl, 1
    cmp dx, 0x6b3
    jb near loc_4e06
    jbe near loc_5057
    cmp dx, 0x7fd
    jb near loc_4d50
    jbe near loc_5132
    cmp dx, 0x875
    jb short loc_4d09
    jbe near loc_5146
    cmp dx, 0xa96
    jb short loc_4cf9
    jbe near loc_50f6
    cmp dx, 0xac8
    jb near loc_51f3
    jbe near loc_50f6
    cmp dx, 0x1202
    jb near loc_51f3
    cmp dx, 0x1203
    jbe near loc_50e2
    jmp near loc_51f3
loc_4cf9:
    cmp dx, 0xa46
    je near loc_50f6
    jmp near loc_51f3
loc_4d09:
    cmp dx, 0x866
    jb short loc_4d33
    jbe near loc_5146
    cmp dx, 0x870
    je near loc_5146
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4d33:
    cmp dx, 0x848
    je near loc_5146
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4d50:
    cmp dx, 0x71c
    jb short loc_4dbf
    cmp dx, 0x71d
    jbe near loc_510a
    cmp dx, 0x780
    jb short loc_4da2
    cmp dx, 0x781
    jbe near loc_510a
    cmp dx, 0x7a8
    jb near loc_51f3
    jbe near loc_511e
    cmp dx, 0x7d0
    je near loc_5132
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4da2:
    cmp dx, 0x758
    je near loc_51cf
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4dbf:
    cmp dx, 0x6cd
    jb short loc_4de9
    jbe near loc_5057
    cmp dx, 0x6d0
    je near loc_5057
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4de9:
    cmp dx, 0x6bd
    je near loc_5057
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4e06:
    cmp dx, 0x3d5
    jb near loc_4ece
    jbe near loc_4f64
    cmp dx, 0x4d6
    jb short loc_4e87
    jbe near loc_51e0
    cmp dx, 0x500
    jb short loc_4e6a
    jbe near loc_5043
    cmp dx, 0x60e
    jb near loc_51f3
    jbe near loc_50f6
    cmp dx, 0x690
    jb near loc_51f3
    cmp dx, 0x691
    jbe near loc_5057
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4e6a:
    cmp dx, 0x4df
    je near loc_51e0
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4e87:
    cmp dx, 0x437
    jb short loc_4eb1
    jbe near loc_51e0
    cmp dx, 0x4cb
    je near loc_51f1
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4eb1:
    cmp dx, 0x426
    je near loc_501b
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4ece:
    cmp dx, 0x23b
    jb short loc_4f22
    jbe near loc_4fde
    cmp dx, 0x388
    jb short loc_4f05
    jbe near loc_50ad
    cmp dx, 0x399
    je near loc_502f
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4f05:
    cmp dx, 0x26d
    je near loc_51f1
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4f22:
    cmp dx, 0x214
    jb short loc_4f48
    jbe near loc_517b
    cmp dx, 0x239
    je short loc_4fa1
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4f48:
    cmp dx, 0x64
    je near loc_51be
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4f64:
    mov eax, 0x3b6
    mov edx, 0x399
    call loc_4c3c
    jmp short loc_4f88
loc_4f75:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_4f87
    call loc_4c3c
loc_4f87:
    inc edx
loc_4f88:
    cmp dx, 0x39d
    jl short loc_4f75
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4fa1:
    mov eax, 0x267
    mov edx, 0x399
    call loc_4c3c
    jmp short loc_4fc5
loc_4fb2:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_4fc4
    call loc_4c3c
loc_4fc4:
    inc edx
loc_4fc5:
    cmp dx, 0x39d
    jl short loc_4fb2
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_4fde:
    mov eax, 0x23d
    mov edx, 0x399
    call loc_4c3c
    jmp short loc_5002
loc_4fef:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_5001
    call loc_4c3c
loc_5001:
    inc edx
loc_5002:
    cmp dx, 0x39d
    jl short loc_4fef
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_501b:
    mov cl, 2
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_502f:
    mov cl, 4
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_5043:
    mov cl, 0x2c
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_5057:
    mov edx, 0x690
    jmp short loc_5071
loc_505e:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_5070
    call loc_4c3c
loc_5070:
    inc edx
loc_5071:
    cmp dx, 0x6d8
    jl short loc_505e
    mov edx, 0x6e8
    jmp short loc_5092
loc_507f:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_5091
    call loc_4c3c
loc_5091:
    inc edx
loc_5092:
    cmp dx, 0x6f3
    jl short loc_507f
    xor cl, cl
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_50ad:
    mov cl, 5
    mov edx, 0x402
    jmp short loc_50c9
loc_50b6:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_50c8
    call loc_4c3c
loc_50c8:
    inc edx
loc_50c9:
    cmp dx, 0x406
    jl short loc_50b6
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_50e2:
    mov cl, 0x5a
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_50f6:
    mov cl, 0x1e
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_510a:
    mov cl, 0x26
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_511e:
    mov cl, 0xd
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_5132:
    mov cl, 0x3d
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_5146:
    mov edx, 0x899
    jmp short loc_5160
loc_514d:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_515f
    call loc_4c3c
loc_515f:
    inc edx
loc_5160:
    cmp dx, 0x8a4
    jl short loc_514d
    mov cl, 0x50
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp near loc_5212
loc_517b:
    mov ebx, dword [0xe97df]
    xor cl, cl
    cmp ebx, 1
    jle near loc_51f3
    mov cl, 5
    mov edx, 0x20b
    jmp short loc_51a8
loc_5195:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_51a7
    call loc_4c3c
loc_51a7:
    inc edx
loc_51a8:
    cmp dx, 0x275
    jl short loc_5195
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp short loc_5212
loc_51be:
    mov cl, 0xe
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp short loc_5212
loc_51cf:
    mov cl, 0xa
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp short loc_5212
loc_51e0:
    mov cl, 3
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp short loc_5212
loc_51f1:
    mov cl, 5
loc_51f3:
    movsx eax, si
    imul eax, eax, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    jmp short loc_5212
loc_5202:
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_5211
    call loc_4c3c
loc_5211:
    inc edx
loc_5212:
    movsx eax, si
    imul eax, eax, 0x2c
    movsx ebx, word [eax + 0x1c0bb2]
    xor eax, eax
    mov al, cl
    add ebx, eax
    movsx eax, dx
    cmp eax, ebx
    jl short loc_5202
loc_522c:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
loc_523c:
    push edx
    cmp dword [0xe934b], 8
    jl short loc_5296
    cmp dword [0x1b3e1c], 0
    jne short loc_5259
    mov eax, 0x99e
    call loc_4c3c
loc_5259:
    cmp dword [0xe97df], 1
    jle short loc_5296
    cmp dword [0x1b3e28], 0
    jne short loc_5275
    mov eax, 0x9a1
    call loc_4c3c
loc_5275:
    mov edx, 0xc00
    jmp short loc_528f
loc_527c:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_528e
    call loc_4c3c
loc_528e:
    inc edx
loc_528f:
    cmp dx, 0xc3f
    jl short loc_527c
loc_5296:
    mov eax, 0x1f6
    mov edx, 0x401
    call loc_4c3c
    jmp short loc_52ba
loc_52a7:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_52b9
    call loc_4c3c
loc_52b9:
    inc edx
loc_52ba:
    cmp dx, 0x45f
    jl short loc_52a7
    mov edx, 0x226
    jmp short loc_52db
loc_52c8:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_52da
    call loc_4c3c
loc_52da:
    inc edx
loc_52db:
    cmp dx, 0x229
    jl short loc_52c8
    mov edx, 0xb7c
    jmp short loc_52fc
loc_52e9:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_52fb
    call loc_4c3c
loc_52fb:
    inc edx
loc_52fc:
    cmp dx, 0xbce
    jl short loc_52e9
    mov edx, 0x8de
    jmp short loc_531d
loc_530a:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_531c
    call loc_4c3c
loc_531c:
    inc edx
loc_531d:
    cmp dx, 0x8ec
    jl short loc_530a
    mov edx, 0x906
    jmp short loc_533e
loc_532b:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_533d
    call loc_4c3c
loc_533d:
    inc edx
loc_533e:
    cmp dx, 0x914
    jl short loc_532b
    mov edx, 0x914
    jmp short loc_535f
loc_534c:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_535e
    call loc_4c3c
loc_535e:
    inc edx
loc_535f:
    cmp dx, 0x918
    jl short loc_534c
    mov edx, 0x9dc
    jmp short loc_5380
loc_536d:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_537f
    call loc_4c3c
loc_537f:
    inc edx
loc_5380:
    cmp dx, 0x9df
    jl short loc_536d
    mov edx, 0x762
    jmp short loc_53a1
loc_538e:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_53a0
    call loc_4c3c
loc_53a0:
    inc edx
loc_53a1:
    cmp dx, 0x777
    jl short loc_538e
    mov eax, 0x3b8
    mov edx, 0x9e0
    call loc_4c3c
    jmp short loc_53cc
loc_53b9:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_53cb
    call loc_4c3c
loc_53cb:
    inc edx
loc_53cc:
    cmp dx, 0x9e8
    jl short loc_53b9
    mov eax, 0x226
    mov edx, 0x8c5
    call loc_4c3c
    jmp short loc_53f7
loc_53e4:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_53f6
    call loc_4c3c
loc_53f6:
    inc edx
loc_53f7:
    cmp dx, 0x8de
    jl short loc_53e4
    mov edx, 0x960
    jmp short loc_5418
loc_5405:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_5417
    call loc_4c3c
loc_5417:
    inc edx
loc_5418:
    cmp dx, 0x973
    jl short loc_5405
    mov edx, 0x919
    cmp dx, 0x91d
    jl short loc_542d
    pop edx
    ret
loc_542d:
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_543f
    call loc_4c3c
loc_543f:
    inc edx
    cmp dx, 0x91d
    jl short loc_542d
    pop edx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_544c:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov ebx, eax
    cmp ax, 0x1c2
    jae short loc_5462
    cmp dword [0x1273a8], 0
    jne short loc_5469
loc_5462:
    xor al, al
    jmp near loc_5536
loc_5469:
    cmp dword [0x1275d8], 0xd
    jne short loc_547a
    xor al, al
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_547a:
    xor esi, esi
    mov si, ax
    lea eax, [esi*8]
    sub eax, esi
    xor edx, edx
    add eax, eax
    mov dl, byte [0xe9833]
    add eax, 0xe5714
    call 0x7a82e
    mov edi, eax
    cwde
    cmp eax, -1
    jne short loc_54ac
    xor al, al
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_54ac:
    call 0x7aae4
    mov dword [esi*4 + 0x4de60], eax
    mov esi, dword [0xe97e7]
    mov ecx, eax
    test esi, esi
    jne short loc_54ee
    cmp dword [0xe97eb], 0
    jne short loc_54ee
    cmp bx, 0xbd
    je short loc_54f6
    cmp bx, 0xe8
    je short loc_54f6
    cmp bx, 0x63
    je short loc_54f6
    cmp bx, 0xe9
    je short loc_54f6
    cmp bx, 0x11
    je short loc_54f6
loc_54ee:
    cmp ecx, 0x3000
    jge short loc_552c
loc_54f6:
    xor esi, esi
    mov si, bx
    imul esi, esi, 0xd
    mov byte [esi + 0xe75d4], 0xc7
    mov eax, 0xe75d0
    add eax, esi
    mov edx, ecx
    lea ebx, [eax + 4]
    call 0x7a048
    mov eax, dword [esi + 0xe75d0]
    test eax, eax
    je short loc_552c
    mov edx, eax
    mov ebx, ecx
    movsx eax, di
    call 0x7a960
loc_552c:
    movsx eax, di
    call 0x7ab25
    mov al, 1
loc_5536:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_553c:
    push ebx
    push edx
    cmp dword [0x1275d8], 0xd
    je short loc_5579
    xor ebx, ebx
    xor edx, edx
    jmp short loc_5572
loc_554d:
    movsx eax, dx
    imul eax, eax, 0xd
    cmp dword [eax + 0xe75d0], 0
    jne short loc_5571
    inc ebx
    test bl, 7
    jne short loc_5567
    call 0x10800
loc_5567:
    xor eax, eax
    mov ax, dx
    call loc_544c
loc_5571:
    inc edx
loc_5572:
    cmp dx, 0x1c2
    jl short loc_554d
loc_5579:
    pop edx
    pop ebx
    ret
    push ebx
    push ecx
    push edx
    push esi
    push edi
    call loc_553c
    call loc_523c
    xor esi, esi
    cmp si, word [0x246500]
    jl short loc_559d
    xor esi, esi
    jmp near loc_56c2
loc_559d:
    movsx eax, si
    shl eax, 5
    movsx eax, word [eax + 0x1ecdb4]
    lea ebx, [eax*4]
    mov edx, dword [ebx + 0x1b17a4]
    test edx, edx
    jne short loc_55e6
    jne short loc_55c2
    call loc_4c3c
loc_55c2:
    movsx eax, si
    shl eax, 5
    mov bx, word [eax + 0x1ecdb6]
    test bx, bx
    jl short loc_55e6
    movsx eax, bx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_55e6
    call loc_4c3c
loc_55e6:
    inc esi
    cmp si, word [0x246500]
    jl short loc_559d
    xor esi, esi
    jmp near loc_56c2
loc_55f7:
    movsx ebx, si
    lea eax, [ebx*4]
    add eax, ebx
    movsx eax, word [eax*8 + 0x2385bc]
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_561a
    call loc_4c3c
loc_561a:
    movsx ebx, si
    lea eax, [ebx*4]
    add ebx, eax
    lea ebx, [ebx*8]
    movsx eax, word [ebx + 0x2385b4]
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_5668
    call loc_4c3c
    movsx eax, word [ebx + 0x2385b4]
    cmp dword [eax*4 + 0x1b17a4], 0x58
    jne short loc_5668
    mov eax, 0x59
    call loc_4c3c
    mov eax, 0x5a
    call loc_4c3c
loc_5668:
    movsx eax, si
    db 0x66, 0x8b, 0x14, 0x45, 0xc4, 0x5c, 0x24, 0x00    ; mov dx, word [eax*2 + 0x245cc4]
loc_5673:
    test dx, dx
    jl short loc_56c1
    movsx ebx, dx
    imul eax, ebx, 0x2c
    cmp byte [eax + 0x1c0bb8], 0
    je short loc_56b4
    cmp byte [eax + 0x1c0bb9], 0
    je short loc_56b4
    movsx ecx, word [eax + 0x1c0bb0]
    test ch, 0x80
    jne short loc_56b4
    movsx eax, word [eax + 0x1c0bb2]
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_56b4
    mov eax, ebx
    call loc_4c5c
loc_56b4:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xc8, 0x1b, 0x00    ; mov dx, word [eax*2 + 0x1bc8a4]
    jmp short loc_5673
loc_56c1:
    inc esi
loc_56c2:
    cmp si, word [0x246502]
    jl near loc_55f7
    xor edx, edx
    xor esi, esi
    jmp short loc_5714
loc_56d5:
    movsx eax, si
    mov ebx, eax
    sar ebx, 3
    movzx edi, byte [ebx + 0x1af4a4]
    mov ebx, esi
    xor bh, bh
    and bl, 7
    movsx ecx, bx
    mov ebx, 1
    shl ebx, cl
    test edi, ebx
    je short loc_5713
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_5713
    inc edx
    call 0x6485d
    test dl, 7
    jne short loc_5713
    call 0x10800
loc_5713:
    inc esi
loc_5714:
    cmp si, 0x1800
    jl short loc_56d5
    mov ecx, 0x300
    mov edi, 0x1af4a4
    xor eax, eax
    cmp ecx, 4
    jae short loc_5739
    test cl, 1
    je short loc_5732
    db 0xaa    ; stosb byte es:[edi], al
loc_5732:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_5764
loc_5739:
    test edi, 1
    je short loc_5743
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_5743:
    test edi, 2
    je short loc_5750
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_5750:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_575e
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_575e:
    test bl, 1
    je short loc_5764
    db 0xaa    ; stosb byte es:[edi], al
loc_5764:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push esi
    push edi
    mov ecx, eax
    movsx eax, dx
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_5784
    call 0x6485d
loc_5784:
    movsx esi, cx
    imul esi, esi, 0x2c
    movsx edi, dx
    mov eax, edi
    db 0x0f, 0xbf, 0x1c, 0x7d, 0x24, 0x7c, 0x1a, 0x00    ; movsx ebx, word [edi*2 + 0x1a7c24]
    db 0x0f, 0xbf, 0x14, 0x7d, 0x24, 0xac, 0x1a, 0x00    ; movsx edx, word [edi*2 + 0x1aac24]
    call 0x76a39
    movsx eax, word [esi + 0x1c0bbc]
    push eax
    movsx eax, byte [esi + 0x1c0bb4]
    movsx ecx, word [esi + 0x1c0bc0]
    add eax, 0x64
    mov ebx, dword [esi + 0x1c0bac]
    push eax
    mov edx, dword [esi + 0x1c0ba8]
    mov eax, dword [esi + 0x1c0ba4]
    call 0x5e28d
    mov ah, 1
    mov ecx, 0x10000
    movsx ebx, word [esi + 0x1c0bc0]
    mov edx, dword [esi + 0x1c0ba8]
    mov byte [0xe9835], ah
    mov eax, dword [esi + 0x1c0ba4]
    call 0x1d720
    xor dl, dl
    mov byte [0xe9835], dl
    call 0x659e1
    call 0x76be5
    mov eax, edi
    call 0x76d5c
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov edx, dword [0xe934b]
    test edx, edx
    jge short loc_5839
    xor esi, esi
    mov dword [0xe934b], esi
    jmp short loc_5848
loc_5839:
    cmp edx, 0x3f
    jle short loc_5848
    mov dword [0xe934b], 0x40
loc_5848:
    cmp dword [0xe934b], 0
    jne short loc_5856
    call 0x7168d
loc_5856:
    mov ebx, dword [0xe934b]
    sub ebx, 8
    test ebx, ebx
    jg short loc_5865
    xor ebx, ebx
loc_5865:
    mov ecx, 0xa0
    mov esi, 0xc8
    mov edx, dword [0x2454b8]
    mov eax, ebx
    mov edi, ebx
    imul edx
    idiv ecx
    mov edx, dword [0x2454b8]
    mov ebp, eax
    sub edx, eax
    mov eax, dword [0xe934b]
    mov dword [esp], edx
    test eax, eax
    jle short loc_58e2
    cmp dword [0xe9347], 1
    je short loc_58e2
    cmp dword [0xe97df], 1
    jle short loc_58e2
    movsx eax, word [0x261210]
    xor edx, edx
    jmp short loc_58be
loc_58b0:
    cmp eax, edx
    jle short loc_58b6
    mov edx, eax
loc_58b6:
    db 0x0f, 0xbf, 0x04, 0x45, 0x08, 0x11, 0x26, 0x00    ; movsx eax, word [eax*2 + 0x261108]
loc_58be:
    test eax, eax
    jge short loc_58b0
    cmp edx, 1
    jl short loc_58ca
    add ebx, 8
loc_58ca:
    cmp edx, 4
    jl short loc_58d2
    add ebx, 8
loc_58d2:
    cmp edx, 8
    jl short loc_58da
    add ebx, 8
loc_58da:
    cmp edx, 0xc
    jl short loc_58e2
    add ebx, 8
loc_58e2:
    cmp dword [0xe934b], 8
    jl short loc_58f0
    lea eax, [edi + 0x22]
    sub esi, eax
loc_58f0:
    mov ecx, 0xc8
    mov edx, dword [0x2454b4]
    mov eax, ebx
    imul edx
    idiv ecx
    mov edx, dword [0x2454b4]
    mov edi, eax
    mov eax, esi
    mov ebx, dword [esp]
    imul edx
    idiv ecx
    dec ebx
    lea ecx, [eax - 1]
    mov edx, edi
    mov eax, ebp
    call 0x712c3
    mov ah, 1
    mov byte [0xe982d], ah
    mov byte [0xe982f], ah
    add esp, 4
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
    movsx edx, ax
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    add ebx, ebx
    mov edx, dword [0xe97df]
    add ebx, 0xb4f00
    cmp edx, 1
    jle short loc_5984
    cmp dword [0xe9347], 1
    je short loc_5984
    call 0x7079f
    xor ecx, ecx
    mov edx, eax
    mov cl, byte [0xe983b]
    sar edx, 0x1f
    idiv ecx
    jmp short loc_5986
loc_5984:
    mov edx, eax
loc_5986:
    movsx edx, dx
    shl edx, 4
    mov eax, dword [edx + 0xb4e00]
    mov dword [ebx + 0x214], eax
    mov dword [ebx + 0x238], eax
    mov dword [ebx + 0x230], eax
    mov eax, dword [edx + 0xb4e04]
    mov dword [ebx + 0x218], eax
    mov dword [ebx + 0x23c], eax
    mov dword [ebx + 0x234], eax
    mov eax, dword [edx + 0xb4e08]
    mov dword [ebx + 0x21c], eax
    mov dword [ebx + 0x240], eax
    mov ax, word [edx + 0xb4e0c]
    mov word [ebx + 0x298], ax
    mov ax, word [edx + 0xb4e0e]
    mov word [ebx + 0x29e], ax
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    movsx ebx, ax
    mov edx, ebx
    shl edx, 7
    sub edx, ebx
    lea edx, [edx*4]
    sub edx, ebx
    mov ebp, 0xb4f00
    add edx, edx
    add ebp, edx
    mov dword [ebp + 0x28c], 0xb1998
    mov edx, dword [ebp + 0x28c]
    mov dword [edx], 0x2328
    mov edx, dword [ebp + 0x28c]
    mov dword [edx + 4], 0
    xor ecx, ecx
    mov dword [ebp + 0x284], 0
    cmp cx, 8
    jl short loc_5a5a
    xor ecx, ecx
    jmp near loc_5b8e
loc_5a5a:
    xor eax, eax
    jmp short loc_5a81
loc_5a5e:
    movsx edx, cx
    mov edi, dword [edx*4 + 0x7c54]
    imul edx, edx, 0x2e
    mov esi, dword [ebp + 0x28c]
    movsx ebx, ax
    add esi, edx
    mov dl, byte [edi + ebx]
    inc eax
    mov byte [esi + ebx + 0x88], dl
loc_5a81:
    db 0x66, 0x3d, 0x0a, 0x00    ; cmp ax, 0xa
    jl short loc_5a5e
    movsx ebx, cx
    lea edx, [ebx*4]
    imul ebx, ebx, 0x2e
    mov esi, dword [ebp + 0x28c]
    mov edi, dword [edx + 0x7c9c]
    mov dword [esi + ebx + 0x9e], edi
    mov esi, dword [ebp + 0x28c]
    lea edi, [esi + ebx]
    mov esi, dword [edx + 0x7ce4]
    mov dword [edi + 0xaa], esi
    mov esi, dword [ebp + 0x28c]
    lea edi, [esi + ebx]
    mov esi, dword [edx + 0x7d2c]
    mov dword [edi + 0xa2], esi
    mov edi, dword [ebp + 0x28c]
    mov esi, dword [edx + 0x7dbc]
    mov dword [edi + ebx + 0xb2], esi
    mov esi, dword [ebp + 0x28c]
    mov edx, dword [edx + 0x7d74]
    inc ecx
    mov dword [esi + ebx + 0xae], edx
    cmp cx, 8
    jl near loc_5a5a
    xor ecx, ecx
    cmp cx, 0xa
    jl short loc_5b11
    xor ecx, ecx
    jmp near loc_5bb9
loc_5b11:
    xor eax, eax
    jmp short loc_5b32
loc_5b15:
    movsx edx, cx
    mov esi, dword [edx*4 + 0x7c74]
    imul edx, edx, 0x2e
    movsx ebx, ax
    add esi, ebx
    add ebx, edx
    mov dl, byte [esi]
    inc eax
    mov byte [ebx + 0x22560], dl
loc_5b32:
    db 0x66, 0x3d, 0x0a, 0x00    ; cmp ax, 0xa
    jl short loc_5b15
    movsx edx, cx
    lea ebx, [edx*4]
    imul edx, edx, 0x2e
    mov esi, dword [ebx + 0x7cbc]
    mov dword [edx + 0x22576], esi
    mov esi, dword [ebx + 0x7d04]
    mov dword [edx + 0x22582], esi
    mov esi, dword [ebx + 0x7d4c]
    mov dword [edx + 0x2257a], esi
    mov esi, dword [ebx + 0x7ddc]
    mov dword [edx + 0x2258a], esi
    mov esi, dword [ebx + 0x7d94]
    mov ebx, dword [ebx + 0x7e24]
    mov dword [edx + 0x22586], esi
    inc ecx
    mov dword [edx + 0x2257e], ebx
loc_5b8e:
    cmp cx, 0xa
    jl near loc_5b11
    xor ecx, ecx
    cmp cx, 2
    jl short loc_5ba7
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_5ba7:
    mov ebx, dword [ebp + 0x28c]
    movsx edx, cx
    inc ecx
    mov dword [ebx + edx*4 + 8], 0
loc_5bb9:
    cmp cx, 2
    jl short loc_5ba7
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
%endif
