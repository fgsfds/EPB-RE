; Game dispatch handlers.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    xor ah, ah
    sub eax, 0xf
    db 0x66, 0x3d, 0x0b, 0x00    ; cmp ax, 0xb
    ja short loc_0027
    and eax, 0xffff
    jmp dword cs:[eax*4 + 0x40964]
    mov al, 1
    ret
loc_0027:
    xor al, al
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    xor ah, ah
    db 0x66, 0x3d, 0x0f, 0x00    ; cmp ax, 0xf
    jb short loc_004f
    db 0x66, 0x3d, 0x17, 0x00    ; cmp ax, 0x17
    jbe short loc_0055
    db 0x66, 0x3d, 0x19, 0x00    ; cmp ax, 0x19
    jb short loc_0058
    db 0x66, 0x3d, 0x1a, 0x00    ; cmp ax, 0x1a
    jbe short loc_0055
    db 0x66, 0x3d, 0x1d, 0x00    ; cmp ax, 0x1d
    je short loc_0055
    xor al, al
    ret
loc_004f:
    db 0x66, 0x3d, 0x09, 0x00    ; cmp ax, 9
    jne short loc_0058
loc_0055:
    mov al, 1
    ret
loc_0058:
    xor al, al
    ret
    nop
    push ebx
    push ecx
    push esi
    mov esi, eax
    mov bx, word [0x2f2920]
    test bx, bx
    jge short loc_0076
    mov eax, 0xffffffff
    pop esi
    pop ecx
    pop ebx
    ret
loc_0076:
    movsx ecx, bx
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    cmp si, word [eax + 0x2522cc]
    jne short loc_00a3
    mov eax, ebx
    pop esi
    pop ecx
    pop ebx
    ret
loc_00a3:
    db 0x66, 0x8b, 0x1c, 0x4d, 0x18, 0x28, 0x2f, 0x00    ; mov bx, word [ecx*2 + 0x2f2818]
    test bx, bx
    jge short loc_0076
    mov eax, 0xffffffff
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push esi
    mov ebx, eax
    mov eax, dword [eax]
    mov ecx, dword [edx]
    sub eax, ecx
    mov ecx, eax
    mov eax, dword [ebx + 4]
    mov esi, dword [edx + 4]
    mov edx, eax
    mov eax, ecx
    sub edx, esi
    call 0x9b9c0
    inc eax
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
loc_00ec:
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    mov esi, dword [eax]
    mov ecx, dword [edx]
    mov edi, dword [edx + 4]
    mov ebx, dword [eax + 8]
    mov ebp, dword [edx + 8]
    sub esi, ecx
    sub ebx, ebp
    mov ecx, dword [eax + 4]
    sar ebx, 4
    sub ecx, edi
    mov eax, esi
    mov edx, ecx
    call 0x9ba1c
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov ecx, eax
    mov ebp, edx
    cmp dword [0x1261df], 2
    jge near loc_01cf
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [ecx]
    db 0x8b, 0x04, 0x45, 0x58, 0x19, 0x0f, 0x00    ; mov eax, dword [eax*2 + 0xf1958]
    sub eax, ebx
    test eax, eax
    jns short loc_015d
    neg eax
loc_015d:
    movsx edx, word [0x2f2926]
    mov ebx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov esi, dword [ecx + 4]
    db 0x8b, 0x04, 0x45, 0x5c, 0x19, 0x0f, 0x00    ; mov eax, dword [eax*2 + 0xf195c]
    sub eax, esi
    test eax, eax
    jns short loc_0188
    neg eax
loc_0188:
    movsx edx, word [0x2f2926]
    add ebx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edi, dword [ecx + 8]
    db 0x8b, 0x04, 0x45, 0x60, 0x19, 0x0f, 0x00    ; mov eax, dword [eax*2 + 0xf1960]
    sub eax, edi
    add eax, 0x1c00
    test eax, eax
    jns short loc_01b8
    neg eax
loc_01b8:
    sar eax, 4
    add ebx, eax
    mov dword [ebp], ebx
    mov ax, word [0x2f2926]
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_01cf:
    xor edx, edx
    mov edi, 0x7fffffff
    mov dword [esp], edx
    mov dx, word [0x2f2920]
    jmp near loc_025f
loc_01e5:
    movsx ebx, dx
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea ebx, [eax + eax]
    mov esi, dword [ecx]
    mov eax, dword [ebx + 0xf1958]
    sub eax, esi
    test eax, eax
    jns short loc_020b
    neg eax
loc_020b:
    mov esi, eax
    mov eax, dword [ebx + 0xf195c]
    sub eax, dword [ecx + 4]
    test eax, eax
    jns short loc_021c
    neg eax
loc_021c:
    add esi, eax
    mov eax, dword [ebx + 0xf1960]
    sub eax, dword [ecx + 8]
    add eax, 0x1c00
    test eax, eax
    jns short loc_0232
    neg eax
loc_0232:
    sar eax, 4
    add eax, esi
    cmp eax, edi
    jge short loc_0254
    movsx ebx, word [ebx + 0xf1a60]
    imul ebx, ebx, 0x2c
    cmp word [ebx + 0x2522de], 0
    jle short loc_0254
    mov dword [esp], edx
    mov edi, eax
loc_0254:
    movsx edx, dx
    db 0x66, 0x8b, 0x14, 0x55, 0x18, 0x28, 0x2f, 0x00    ; mov dx, word [edx*2 + 0x2f2818]
loc_025f:
    test dx, dx
    jge short loc_01e5
    mov eax, dword [esp]
    mov dword [ebp], edi
    add esp, 4
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
    sub esp, 8
    mov edi, eax
    mov ebp, edx
    mov edx, 0x7fffffff
    mov dword [esp + 4], eax
    mov dword [esp], edx
    mov dx, word [0x2f2920]
    jmp near loc_0341
loc_02a0:
    cmp di, dx
    je near loc_0336
    movsx ebx, dx
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea ebx, [eax + eax]
    movsx eax, word [ebx + 0xf1a60]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522de], 0
    jle short loc_0336
    movsx ecx, di
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    lea ecx, [eax + eax]
    mov eax, dword [ebx + 0xf1958]
    sub eax, dword [ecx + 0xf1934]
    test eax, eax
    jns short loc_02fb
    neg eax
loc_02fb:
    mov esi, eax
    mov eax, dword [ebx + 0xf195c]
    sub eax, dword [ecx + 0xf1938]
    test eax, eax
    jns short loc_030f
    neg eax
loc_030f:
    add esi, eax
    mov eax, dword [ebx + 0xf1960]
    sub eax, dword [ecx + 0xf193c]
    test eax, eax
    jns short loc_0323
    neg eax
loc_0323:
    sar eax, 4
    mov ecx, dword [esp]
    add eax, esi
    cmp eax, ecx
    jge short loc_0336
    mov dword [esp + 4], edx
    mov dword [esp], eax
loc_0336:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0x18, 0x28, 0x2f, 0x00    ; mov dx, word [eax*2 + 0x2f2818]
loc_0341:
    test dx, dx
    jge near loc_02a0
    mov eax, dword [esp]
    mov dword [ebp], eax
    mov eax, dword [esp + 4]
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov ebp, dword [0x121ec4]
    dec ebp
    test ebp, ebp
    jge short loc_038a
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_038a:
    lea ebx, [ebp*4]
    mov eax, dword [ebx + 0xd20b8]
    mov edx, dword [eax]
    mov ecx, dword [ebx + 0x8a730]
    mov dword [esp], edx
    db 0x8d, 0x14, 0x6d, 0x00, 0x00, 0x00, 0x00    ; lea edx, [ebp*2]
    lea ecx, [ecx*4]
    mov esi, dword [esp]
    movsx edi, word [edx + 0x8a630]
    cmp esi, dword [ebx + 0x8a830]
    jne near loc_04a9
    call 0x277d0
    mov ecx, dword [0x121ec4]
    dec ecx
    mov dword [0x121ec4], ecx
    mov eax, ecx
    mov ecx, dword [ecx*4 + 0xd20b8]
    mov dword [ebx + 0xd20b8], ecx
    mov ecx, dword [eax*4 + 0x8a830]
    mov eax, dword [eax*4 + 0x8a730]
    mov dword [ebx + 0x8a730], eax
    mov eax, dword [0x121ec4]
    db 0x66, 0x8b, 0x04, 0x45, 0x30, 0xa6, 0x08, 0x00    ; mov ax, word [eax*2 + 0x8a630]
    mov word [edx + 0x8a630], ax
    movsx edx, ax
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov dx, word [eax + 0x2c9cd6]
    mov dword [ebx + 0x8a830], ecx
    cmp dx, 0x12
    je short loc_043b
    cmp dx, 0x13
    jne short loc_046c
loc_043b:
    db 0x0f, 0xbf, 0x14, 0x6d, 0x30, 0xa6, 0x08, 0x00    ; movsx edx, word [ebp*2 + 0x8a630]
    lea eax, [edx*4]
    add eax, edx
    mov edx, 0x2c9cb4
    lea eax, [eax*8]
    add edx, eax
    mov esi, dword [ebp*4 + 0xd20b8]
    add edx, 4
    cmp edx, esi
    je near loc_0621
loc_046c:
    lea eax, [edi*4]
    add eax, edi
    mov ax, word [eax*8 + 0x2c9cd6]
    xor ah, ah
    db 0x66, 0x3d, 0x16, 0x00    ; cmp ax, 0x16
    je near loc_0621
    mov edx, 0xffffffff
    movsx eax, di
    call 0x505d0
    dec ebp
    test ebp, ebp
    jge near loc_038a
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_04a9:
    lea eax, [esi + ecx]
    test ecx, ecx
    jle short loc_04be
    mov esi, dword [ebx + 0x8a830]
    cmp eax, esi
    jl short loc_04ca
    mov eax, esi
    jmp short loc_04ca
loc_04be:
    mov edx, dword [ebx + 0x8a830]
    cmp eax, edx
    jg short loc_04ca
    mov eax, edx
loc_04ca:
    mov dword [esp], eax
    db 0x0f, 0xbf, 0x14, 0x6d, 0x30, 0xa6, 0x08, 0x00    ; movsx edx, word [ebp*2 + 0x8a630]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    add eax, 0x2c9cb4
    mov edx, dword [ebp*4 + 0xd20b8]
    add eax, 8
    cmp eax, edx
    jne near loc_0615
    movsx ebx, word [0x2f2920]
    jmp near loc_05ac
loc_0508:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    add eax, eax
    movsx edx, word [eax + 0xf19be]
    cmp edx, edi
    jne near loc_05a4
    lea edx, [edi*4]
    add edx, edi
    mov esi, dword [eax + 0xf193c]
    mov edx, dword [edx*8 + 0x2c9cbc]
    sub edx, esi
    cmp edx, 0x4000
    jge short loc_05a4
    movsx edx, word [eax + 0xf1a60]
    imul edx, edx, 0x2c
    cmp word [edx + 0x2522d2], 0
    jl short loc_05a4
    mov edx, dword [eax + 0xf193c]
    add edx, ecx
    xor esi, esi
    mov dword [eax + 0xf193c], edx
    movsx edx, word [0x2f2926]
    mov dword [eax + 0xf1974], esi
    cmp ebx, edx
    jne short loc_05a4
    add dword [0x120db4], ecx
    mov edx, dword [0x121b1c]
    dec edx
    and edx, 0xff
    mov eax, dword [eax + 0xf193c]
    mov dword [0x120da8], esi
    mov dword [edx*4 + 0x87a80], eax
loc_05a4:
    db 0x0f, 0xbf, 0x1c, 0x5d, 0x18, 0x28, 0x2f, 0x00    ; movsx ebx, word [ebx*2 + 0x2f2818]
loc_05ac:
    test ebx, ebx
    jge near loc_0508
    db 0x0f, 0xbf, 0x14, 0x7d, 0xd4, 0x73, 0x2d, 0x00    ; movsx edx, word [edi*2 + 0x2d73d4]
    jmp short loc_0611
loc_05be:
    imul ebx, edx, 0x2c
    cmp word [ebx + 0x2522ce], 3
    je short loc_0609
    lea esi, [edx*8]
    add esi, edx
    lea esi, [esi*8]
    sub esi, edx
    mov eax, dword [ebx + 0x2522bc]
    mov dword [esi + 0x8b0e3], eax
    add eax, ecx
    mov dword [ebx + 0x2522bc], eax
    lea eax, [edi*4]
    add eax, edi
    mov eax, dword [eax*8 + 0x2c9cbc]
    add eax, ecx
    mov dword [esi + 0x8b0cb], eax
loc_0609:
    db 0x0f, 0xbf, 0x14, 0x55, 0xb4, 0xdf, 0x24, 0x00    ; movsx edx, word [edx*2 + 0x24dfb4]
loc_0611:
    test edx, edx
    jge short loc_05be
loc_0615:
    mov eax, dword [ebp*4 + 0xd20b8]
    mov edx, dword [esp]
    mov dword [eax], edx
loc_0621:
    dec ebp
    test ebp, ebp
    jge near loc_038a
    add esp, 4
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
    mov ebx, eax
    mov eax, dword [0x121ec4]
    mov ecx, 0xffffffff
loc_064a:
    dec eax
    test eax, eax
    jge short loc_0654
    mov eax, ecx
    pop ecx
    pop ebx
    ret
loc_0654:
    cmp ebx, dword [eax*4 + 0xd20b8]
    jne short loc_064a
    mov ecx, eax
    mov eax, ecx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov dword [esp], eax
    mov esi, edx
    mov edi, ebx
    mov edx, dword [0x121ec4]
    cmp edx, 0x3f
    jl short loc_068b
    mov eax, 0xffffffff
    jmp short loc_06ee
loc_068b:
    mov ebp, dword [0x121ec4]
    mov ebx, edx
    xor eax, eax
    jmp short loc_06a5
loc_0697:
    cmp esi, dword [eax*4 + 0xd20b8]
    jne short loc_06a4
    mov ebx, eax
    jmp short loc_06a9
loc_06a4:
    inc eax
loc_06a5:
    cmp eax, ebp
    jl short loc_0697
loc_06a9:
    mov edx, dword [esp]
    lea eax, [ebx*4]
    db 0x66, 0x89, 0x14, 0x5d, 0x30, 0xa6, 0x08, 0x00    ; mov word [ebx*2 + 0x8a630], dx
    mov dword [eax + 0xd20b8], esi
    mov dword [eax + 0x8a830], edi
    cmp edi, dword [esi]
    jge short loc_06cd
    neg ecx
loc_06cd:
    mov dword [eax + 0x8a730], ecx
    mov eax, dword [0x121ec4]
    cmp ebx, eax
    jne short loc_06e5
    lea edx, [eax + 1]
    mov dword [0x121ec4], edx
loc_06e5:
    mov eax, esi
    call 0x27780
    mov eax, ebx
loc_06ee:
    add esp, 4
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
    mov dx, word [0x1256c8]
    test dx, dx
    jle near loc_07bd
    movsx edx, dx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ebx, dword [eax + 0x8b0e7]
    cmp ebx, 0xb
    jl near loc_07b4
    xor esi, esi
    movsx ebx, word [0x1256c6]
    mov dword [eax + 0x8b0e7], esi
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    imul ebx, edx, 0x2c
    add eax, eax
    mov cx, word [eax + 0xf1a3e]
    test cx, cx
    jl short loc_0770
    mov word [ebx + 0x2522d2], cx
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0770:
    cmp word [ebx + 0x2522d2], 0
    jl short loc_07bd
    movsx eax, word [eax + 0xf1a60]
    imul eax, eax, 0x2c
    mov edx, 0x2522b4
    add edx, ebx
    add eax, 0x2522b4
    call loc_00ec
    cmp eax, 0x800
    jge short loc_07bd
    movsx edx, word [ebx + 0x2522c2]
    movsx eax, word [ebx + 0x2522d2]
    call 0x4dce0
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_07b4:
    lea ecx, [ebx + 1]
    mov dword [eax + 0x8b0e7], ecx
loc_07bd:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    xor edx, edx
    jmp near loc_08f8
loc_07dc:
    lea eax, [edx*4]
    sub eax, edx
    lea ebx, [eax + eax]
    movsx edi, word [ebx + 0xffb00]
    mov eax, edi
    shl eax, 5
    test byte [eax + 0x27e4c2], 0x10
    je near loc_08f7
    mov cx, word [eax + 0x27e4c6]
    cmp cx, 0x297
    jb near loc_08f7
    cmp cx, 0x299
    ja near loc_08f7
    mov ch, byte [eax + 0x27e4c2]
    mov ebp, dword [ebx + 0xffb02]
    test ch, 0xfe
    je near loc_08f7
    xor ecx, ecx
    mov esi, ebp
    mov cl, byte [eax + 0x27e4cc]
    sar esi, 0xa
    mov dword [esp], ecx
    sub ecx, esi
    mov dword [esp], ecx
    mov cl, byte [esp]
    mov byte [eax + 0x27e4cc], cl
    xor ecx, ecx
    mov cl, byte [eax + 0x27e4cd]
    mov dword [esp], ecx
    sub ecx, esi
    mov dword [esp], ecx
    mov cl, byte [esp]
    mov byte [eax + 0x27e4cd], cl
    cmp word [eax + 0x27e4d2], 1
    jne short loc_0887
    xor esi, esi
    mov word [eax + 0x27e4d2], si
    xor esi, esi
    mov dword [ebx + 0xffb02], esi
    jmp short loc_0893
loc_0887:
    add ebp, 0x80
    mov dword [ebx + 0xffb02], ebp
loc_0893:
    lea eax, [edx*4]
    sub eax, edx
    lea ebx, [eax + eax]
    mov ecx, edi
    mov edi, dword [ebx + 0xffb02]
    shl ecx, 5
    cmp edi, 0x800
    jge short loc_08c6
    test byte [ebx + 0xffb02], 0x80
    je short loc_08ee
    mov word [ecx + 0x27e4c6], 0x297
    jmp short loc_08f7
loc_08c6:
    call 0x6dc5f
    and eax, 0xff
    cmp eax, 0x20
    jge short loc_08ee
    call 0x6dc5f
    mov ecx, eax
    mov eax, 0x80
    and ecx, 3
    shl eax, cl
    mov dword [ebx + 0xffb02], eax
    jmp short loc_08f7
loc_08ee:
    mov word [ecx + 0x27e4c6], 0x298
loc_08f7:
    inc edx
loc_08f8:
    movsx eax, word [0x1256d2]
    cmp edx, eax
    jl near loc_07dc
    add esp, 4
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
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 8
    mov edi, eax
    mov dword [esp + 4], edx
    cwde
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x2522cc]
    mov dx, word [0x2d6bd8]
    mov dword [esp], eax
loc_093f:
    test dx, dx
    jl near loc_09f1
    movsx ebx, dx
    imul ebx, ebx, 0x2c
    cmp word [ebx + 0x2522da], 0x11
    jne near loc_09e1
    movsx ecx, di
    imul esi, ecx, 0x2c
    mov ax, word [ebx + 0x2522dc]
    cmp ax, word [esi + 0x2522dc]
    jne short loc_09e1
    movsx esi, word [esp]
    lea eax, [esi*4]
    add esi, eax
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    lea esi, [esi*8]
    mov ecx, eax
    mov eax, dword [esi + 0x2c9cbc]
    sub eax, dword [ecx + 0x8b0ef]
    movsx ebp, word [ebx + 0x2522d6]
    test eax, eax
    jns short loc_09b3
    neg eax
loc_09b3:
    cmp eax, ebp
    jg short loc_09f1
    movsx ebx, word [ebx + 0x2522cc]
    lea eax, [ebx*4]
    add eax, ebx
    movsx ecx, word [esi + 0x2c9cd8]
    movsx ebx, word [eax*8 + 0x2c9cd8]
    movsx eax, word [esp + 4]
    sub ecx, eax
    cmp ebx, ecx
    je short loc_09f1
loc_09e1:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp near loc_093f
loc_09f1:
    movsx eax, dx
    cmp eax, -1
    jne short loc_0a00
    mov al, 1
    jmp near loc_0a80
loc_0a00:
    cmp word [esp + 4], 0
    jne short loc_0a0f
    mov eax, 0x49
    jmp short loc_0a14
loc_0a0f:
    mov eax, 0x47
loc_0a14:
    movsx edx, di
    call 0x58160
    mov dx, word [0x2d6bd8]
loc_0a23:
    test dx, dx
    jl short loc_0a7e
    movsx ebx, dx
    imul eax, ebx, 0x2c
    cmp word [eax + 0x2522da], 0x11
    jne short loc_0a71
    movsx ecx, di
    imul ecx, ecx, 0x2c
    mov ax, word [eax + 0x2522dc]
    cmp ax, word [ecx + 0x2522dc]
    jne short loc_0a71
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    movsx ecx, word [esp + 4]
    mov dword [eax + 0x8b0e7], ecx
    mov dword [eax + 0x8b0eb], ecx
loc_0a71:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp short loc_0a23
loc_0a7e:
    xor al, al
loc_0a80:
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
%else
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    xor ah, ah
    sub eax, 0xf
    db 0x66, 0x3d, 0x0b, 0x00    ; cmp ax, 0xb
    ja short loc_0027
    and eax, 0xffff
    jmp dword cs:[eax*4 + 0x435b4]
    mov al, 1
    ret
loc_0027:
    xor al, al
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    xor ah, ah
    db 0x66, 0x3d, 0x0f, 0x00    ; cmp ax, 0xf
    jb short loc_004f
    db 0x66, 0x3d, 0x17, 0x00    ; cmp ax, 0x17
    jbe short loc_0055
    db 0x66, 0x3d, 0x19, 0x00    ; cmp ax, 0x19
    jb short loc_0058
    db 0x66, 0x3d, 0x1a, 0x00    ; cmp ax, 0x1a
    jbe short loc_0055
    db 0x66, 0x3d, 0x1d, 0x00    ; cmp ax, 0x1d
    je short loc_0055
    xor al, al
    ret
loc_004f:
    db 0x66, 0x3d, 0x09, 0x00    ; cmp ax, 9
    jne short loc_0058
loc_0055:
    mov al, 1
    ret
loc_0058:
    xor al, al
    ret
    nop
    push ebx
    push ecx
    push esi
    mov esi, eax
    mov bx, word [0x261210]
    test bx, bx
    jge short loc_0076
    mov eax, 0xffffffff
    pop esi
    pop ecx
    pop ebx
    ret
loc_0076:
    movsx ecx, bx
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    cmp si, word [eax + 0x1c0bbc]
    jne short loc_00a3
    mov eax, ebx
    pop esi
    pop ecx
    pop ebx
    ret
loc_00a3:
    db 0x66, 0x8b, 0x1c, 0x4d, 0x08, 0x11, 0x26, 0x00    ; mov bx, word [ecx*2 + 0x261108]
    test bx, bx
    jge short loc_0076
    mov eax, 0xffffffff
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push esi
    mov ebx, eax
    mov eax, dword [eax]
    mov ecx, dword [edx]
    sub eax, ecx
    mov ecx, eax
    mov eax, dword [ebx + 4]
    mov esi, dword [edx + 4]
    mov edx, eax
    mov eax, ecx
    sub edx, esi
    call 0x9e500
    inc eax
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
loc_00ec:
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    mov esi, dword [eax]
    mov ecx, dword [edx]
    mov edi, dword [edx + 4]
    mov ebx, dword [eax + 8]
    mov ebp, dword [edx + 8]
    sub esi, ecx
    sub ebx, ebp
    mov ecx, dword [eax + 4]
    sar ebx, 4
    sub ecx, edi
    mov eax, esi
    mov edx, ecx
    call 0x9e55c
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov ecx, eax
    mov ebp, edx
    cmp dword [0xe97df], 2
    jge near loc_01cf
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [ecx]
    db 0x8b, 0x04, 0x45, 0x38, 0x51, 0x0b, 0x00    ; mov eax, dword [eax*2 + 0xb5138]
    sub eax, ebx
    test eax, eax
    jns short loc_015d
    neg eax
loc_015d:
    movsx edx, word [0x261216]
    mov ebx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov esi, dword [ecx + 4]
    db 0x8b, 0x04, 0x45, 0x3c, 0x51, 0x0b, 0x00    ; mov eax, dword [eax*2 + 0xb513c]
    sub eax, esi
    test eax, eax
    jns short loc_0188
    neg eax
loc_0188:
    movsx edx, word [0x261216]
    add ebx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edi, dword [ecx + 8]
    db 0x8b, 0x04, 0x45, 0x40, 0x51, 0x0b, 0x00    ; mov eax, dword [eax*2 + 0xb5140]
    sub eax, edi
    add eax, 0x1c00
    test eax, eax
    jns short loc_01b8
    neg eax
loc_01b8:
    sar eax, 4
    add ebx, eax
    mov dword [ebp], ebx
    mov ax, word [0x261216]
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_01cf:
    xor edx, edx
    mov edi, 0x7fffffff
    mov dword [esp], edx
    mov dx, word [0x261210]
    jmp near loc_025f
loc_01e5:
    movsx ebx, dx
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea ebx, [eax + eax]
    mov esi, dword [ecx]
    mov eax, dword [ebx + 0xb5138]
    sub eax, esi
    test eax, eax
    jns short loc_020b
    neg eax
loc_020b:
    mov esi, eax
    mov eax, dword [ebx + 0xb513c]
    sub eax, dword [ecx + 4]
    test eax, eax
    jns short loc_021c
    neg eax
loc_021c:
    add esi, eax
    mov eax, dword [ebx + 0xb5140]
    sub eax, dword [ecx + 8]
    add eax, 0x1c00
    test eax, eax
    jns short loc_0232
    neg eax
loc_0232:
    sar eax, 4
    add eax, esi
    cmp eax, edi
    jge short loc_0254
    movsx ebx, word [ebx + 0xb5240]
    imul ebx, ebx, 0x2c
    cmp word [ebx + 0x1c0bce], 0
    jle short loc_0254
    mov dword [esp], edx
    mov edi, eax
loc_0254:
    movsx edx, dx
    db 0x66, 0x8b, 0x14, 0x55, 0x08, 0x11, 0x26, 0x00    ; mov dx, word [edx*2 + 0x261108]
loc_025f:
    test dx, dx
    jge short loc_01e5
    mov eax, dword [esp]
    mov dword [ebp], edi
    add esp, 4
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
    sub esp, 8
    mov edi, eax
    mov ebp, edx
    mov edx, 0x7fffffff
    mov dword [esp + 4], eax
    mov dword [esp], edx
    mov dx, word [0x261210]
    jmp near loc_0341
loc_02a0:
    cmp di, dx
    je near loc_0336
    movsx ebx, dx
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea ebx, [eax + eax]
    movsx eax, word [ebx + 0xb5240]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bce], 0
    jle short loc_0336
    movsx ecx, di
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    lea ecx, [eax + eax]
    mov eax, dword [ebx + 0xb5138]
    sub eax, dword [ecx + 0xb5114]
    test eax, eax
    jns short loc_02fb
    neg eax
loc_02fb:
    mov esi, eax
    mov eax, dword [ebx + 0xb513c]
    sub eax, dword [ecx + 0xb5118]
    test eax, eax
    jns short loc_030f
    neg eax
loc_030f:
    add esi, eax
    mov eax, dword [ebx + 0xb5140]
    sub eax, dword [ecx + 0xb511c]
    test eax, eax
    jns short loc_0323
    neg eax
loc_0323:
    sar eax, 4
    mov ecx, dword [esp]
    add eax, esi
    cmp eax, ecx
    jge short loc_0336
    mov dword [esp + 4], edx
    mov dword [esp], eax
loc_0336:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0x08, 0x11, 0x26, 0x00    ; mov dx, word [eax*2 + 0x261108]
loc_0341:
    test dx, dx
    jge near loc_02a0
    mov eax, dword [esp]
    mov dword [ebp], eax
    mov eax, dword [esp + 4]
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov ebp, dword [0xe54c4]
    dec ebp
    test ebp, ebp
    jge short loc_038a
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_038a:
    lea ebx, [ebp*4]
    mov eax, dword [ebx + 0x4e698]
    mov edx, dword [eax]
    mov ecx, dword [ebx + 0x4e7d8]
    mov dword [esp], edx
    db 0x8d, 0x14, 0x6d, 0x00, 0x00, 0x00, 0x00    ; lea edx, [ebp*2]
    lea ecx, [ecx*4]
    mov esi, dword [esp]
    movsx edi, word [edx + 0x4dcb0]
    cmp esi, dword [ebx + 0x4e8d8]
    jne near loc_04a9
    call 0x27420
    mov ecx, dword [0xe54c4]
    dec ecx
    mov dword [0xe54c4], ecx
    mov eax, ecx
    mov ecx, dword [ecx*4 + 0x4e698]
    mov dword [ebx + 0x4e698], ecx
    mov ecx, dword [eax*4 + 0x4e8d8]
    mov eax, dword [eax*4 + 0x4e7d8]
    mov dword [ebx + 0x4e7d8], eax
    mov eax, dword [0xe54c4]
    db 0x66, 0x8b, 0x04, 0x45, 0xb0, 0xdc, 0x04, 0x00    ; mov ax, word [eax*2 + 0x4dcb0]
    mov word [edx + 0x4dcb0], ax
    movsx edx, ax
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov dx, word [eax + 0x2385c6]
    mov dword [ebx + 0x4e8d8], ecx
    cmp dx, 0x12
    je short loc_043b
    cmp dx, 0x13
    jne short loc_046c
loc_043b:
    db 0x0f, 0xbf, 0x14, 0x6d, 0xb0, 0xdc, 0x04, 0x00    ; movsx edx, word [ebp*2 + 0x4dcb0]
    lea eax, [edx*4]
    add eax, edx
    mov edx, 0x2385a4
    lea eax, [eax*8]
    add edx, eax
    mov esi, dword [ebp*4 + 0x4e698]
    add edx, 4
    cmp edx, esi
    je near loc_0621
loc_046c:
    lea eax, [edi*4]
    add eax, edi
    mov ax, word [eax*8 + 0x2385c6]
    xor ah, ah
    db 0x66, 0x3d, 0x16, 0x00    ; cmp ax, 0x16
    je near loc_0621
    mov edx, 0xffffffff
    movsx eax, di
    call 0x53220
    dec ebp
    test ebp, ebp
    jge near loc_038a
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_04a9:
    lea eax, [esi + ecx]
    test ecx, ecx
    jle short loc_04be
    mov esi, dword [ebx + 0x4e8d8]
    cmp eax, esi
    jl short loc_04ca
    mov eax, esi
    jmp short loc_04ca
loc_04be:
    mov edx, dword [ebx + 0x4e8d8]
    cmp eax, edx
    jg short loc_04ca
    mov eax, edx
loc_04ca:
    mov dword [esp], eax
    db 0x0f, 0xbf, 0x14, 0x6d, 0xb0, 0xdc, 0x04, 0x00    ; movsx edx, word [ebp*2 + 0x4dcb0]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    add eax, 0x2385a4
    mov edx, dword [ebp*4 + 0x4e698]
    add eax, 8
    cmp eax, edx
    jne near loc_0615
    movsx ebx, word [0x261210]
    jmp near loc_05ac
loc_0508:
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    add eax, eax
    movsx edx, word [eax + 0xb519e]
    cmp edx, edi
    jne near loc_05a4
    lea edx, [edi*4]
    add edx, edi
    mov esi, dword [eax + 0xb511c]
    mov edx, dword [edx*8 + 0x2385ac]
    sub edx, esi
    cmp edx, 0x4000
    jge short loc_05a4
    movsx edx, word [eax + 0xb5240]
    imul edx, edx, 0x2c
    cmp word [edx + 0x1c0bc2], 0
    jl short loc_05a4
    mov edx, dword [eax + 0xb511c]
    add edx, ecx
    xor esi, esi
    mov dword [eax + 0xb511c], edx
    movsx edx, word [0x261216]
    mov dword [eax + 0xb5154], esi
    cmp ebx, edx
    jne short loc_05a4
    add dword [0xe43b4], ecx
    mov edx, dword [0xe4b70]
    dec edx
    and edx, 0xff
    mov eax, dword [eax + 0xb511c]
    mov dword [0xe43a8], esi
    mov dword [edx*4 + 0x4b260], eax
loc_05a4:
    db 0x0f, 0xbf, 0x1c, 0x5d, 0x08, 0x11, 0x26, 0x00    ; movsx ebx, word [ebx*2 + 0x261108]
loc_05ac:
    test ebx, ebx
    jge near loc_0508
    db 0x0f, 0xbf, 0x14, 0x7d, 0xc4, 0x5c, 0x24, 0x00    ; movsx edx, word [edi*2 + 0x245cc4]
    jmp short loc_0611
loc_05be:
    imul ebx, edx, 0x2c
    cmp word [ebx + 0x1c0bbe], 3
    je short loc_0609
    lea esi, [edx*8]
    add esi, edx
    lea esi, [esi*8]
    sub esi, edx
    mov eax, dword [ebx + 0x1c0bac]
    mov dword [esi + 0x4ea03], eax
    add eax, ecx
    mov dword [ebx + 0x1c0bac], eax
    lea eax, [edi*4]
    add eax, edi
    mov eax, dword [eax*8 + 0x2385ac]
    add eax, ecx
    mov dword [esi + 0x4e9eb], eax
loc_0609:
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0xc8, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1bc8a4]
loc_0611:
    test edx, edx
    jge short loc_05be
loc_0615:
    mov eax, dword [ebp*4 + 0x4e698]
    mov edx, dword [esp]
    mov dword [eax], edx
loc_0621:
    dec ebp
    test ebp, ebp
    jge near loc_038a
    add esp, 4
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
    mov ebx, eax
    mov eax, dword [0xe54c4]
    mov ecx, 0xffffffff
loc_064a:
    dec eax
    test eax, eax
    jge short loc_0654
    mov eax, ecx
    pop ecx
    pop ebx
    ret
loc_0654:
    cmp ebx, dword [eax*4 + 0x4e698]
    jne short loc_064a
    mov ecx, eax
    mov eax, ecx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov dword [esp], eax
    mov esi, edx
    mov edi, ebx
    mov edx, dword [0xe54c4]
    cmp edx, 0x3f
    jl short loc_068b
    mov eax, 0xffffffff
    jmp short loc_06ee
loc_068b:
    mov ebp, dword [0xe54c4]
    mov ebx, edx
    xor eax, eax
    jmp short loc_06a5
loc_0697:
    cmp esi, dword [eax*4 + 0x4e698]
    jne short loc_06a4
    mov ebx, eax
    jmp short loc_06a9
loc_06a4:
    inc eax
loc_06a5:
    cmp eax, ebp
    jl short loc_0697
loc_06a9:
    mov edx, dword [esp]
    lea eax, [ebx*4]
    db 0x66, 0x89, 0x14, 0x5d, 0xb0, 0xdc, 0x04, 0x00    ; mov word [ebx*2 + 0x4dcb0], dx
    mov dword [eax + 0x4e698], esi
    mov dword [eax + 0x4e8d8], edi
    cmp edi, dword [esi]
    jge short loc_06cd
    neg ecx
loc_06cd:
    mov dword [eax + 0x4e7d8], ecx
    mov eax, dword [0xe54c4]
    cmp ebx, eax
    jne short loc_06e5
    lea edx, [eax + 1]
    mov dword [0xe54c4], edx
loc_06e5:
    mov eax, esi
    call 0x273d0
    mov eax, ebx
loc_06ee:
    add esp, 4
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
    mov dx, word [0xe8cc8]
    test dx, dx
    jle near loc_07bd
    movsx edx, dx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ebx, dword [eax + 0x4ea07]
    cmp ebx, 0xb
    jl near loc_07b4
    xor esi, esi
    movsx ebx, word [0xe8cc6]
    mov dword [eax + 0x4ea07], esi
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    imul ebx, edx, 0x2c
    add eax, eax
    mov cx, word [eax + 0xb521e]
    test cx, cx
    jl short loc_0770
    mov word [ebx + 0x1c0bc2], cx
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0770:
    cmp word [ebx + 0x1c0bc2], 0
    jl short loc_07bd
    movsx eax, word [eax + 0xb5240]
    imul eax, eax, 0x2c
    mov edx, 0x1c0ba4
    add edx, ebx
    add eax, 0x1c0ba4
    call loc_00ec
    cmp eax, 0x800
    jge short loc_07bd
    movsx edx, word [ebx + 0x1c0bb2]
    movsx eax, word [ebx + 0x1c0bc2]
    call 0x50980
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_07b4:
    lea ecx, [ebx + 1]
    mov dword [eax + 0x4ea07], ecx
loc_07bd:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    xor edx, edx
    jmp near loc_08f8
loc_07dc:
    lea eax, [edx*4]
    sub eax, edx
    lea ebx, [eax + eax]
    movsx edi, word [ebx + 0xc3100]
    mov eax, edi
    shl eax, 5
    test byte [eax + 0x1ecdb2], 0x10
    je near loc_08f7
    mov cx, word [eax + 0x1ecdb6]
    cmp cx, 0x297
    jb near loc_08f7
    cmp cx, 0x299
    ja near loc_08f7
    mov ch, byte [eax + 0x1ecdb2]
    mov ebp, dword [ebx + 0xc3102]
    test ch, 0xfe
    je near loc_08f7
    xor ecx, ecx
    mov esi, ebp
    mov cl, byte [eax + 0x1ecdbc]
    sar esi, 0xa
    mov dword [esp], ecx
    sub ecx, esi
    mov dword [esp], ecx
    mov cl, byte [esp]
    mov byte [eax + 0x1ecdbc], cl
    xor ecx, ecx
    mov cl, byte [eax + 0x1ecdbd]
    mov dword [esp], ecx
    sub ecx, esi
    mov dword [esp], ecx
    mov cl, byte [esp]
    mov byte [eax + 0x1ecdbd], cl
    cmp word [eax + 0x1ecdc2], 1
    jne short loc_0887
    xor esi, esi
    mov word [eax + 0x1ecdc2], si
    xor esi, esi
    mov dword [ebx + 0xc3102], esi
    jmp short loc_0893
loc_0887:
    add ebp, 0x80
    mov dword [ebx + 0xc3102], ebp
loc_0893:
    lea eax, [edx*4]
    sub eax, edx
    lea ebx, [eax + eax]
    mov ecx, edi
    mov edi, dword [ebx + 0xc3102]
    shl ecx, 5
    cmp edi, 0x800
    jge short loc_08c6
    test byte [ebx + 0xc3102], 0x80
    je short loc_08ee
    mov word [ecx + 0x1ecdb6], 0x297
    jmp short loc_08f7
loc_08c6:
    call 0x7079f
    and eax, 0xff
    cmp eax, 0x20
    jge short loc_08ee
    call 0x7079f
    mov ecx, eax
    mov eax, 0x80
    and ecx, 3
    shl eax, cl
    mov dword [ebx + 0xc3102], eax
    jmp short loc_08f7
loc_08ee:
    mov word [ecx + 0x1ecdb6], 0x298
loc_08f7:
    inc edx
loc_08f8:
    movsx eax, word [0xe8cd2]
    cmp edx, eax
    jl near loc_07dc
    add esp, 4
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
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 8
    mov edi, eax
    mov dword [esp + 4], edx
    cwde
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x1c0bbc]
    mov dx, word [0x2454c8]
    mov dword [esp], eax
loc_093f:
    test dx, dx
    jl near loc_09f1
    movsx ebx, dx
    imul ebx, ebx, 0x2c
    cmp word [ebx + 0x1c0bca], 0x11
    jne near loc_09e1
    movsx ecx, di
    imul esi, ecx, 0x2c
    mov ax, word [ebx + 0x1c0bcc]
    cmp ax, word [esi + 0x1c0bcc]
    jne short loc_09e1
    movsx esi, word [esp]
    lea eax, [esi*4]
    add esi, eax
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    lea esi, [esi*8]
    mov ecx, eax
    mov eax, dword [esi + 0x2385ac]
    sub eax, dword [ecx + 0x4ea0f]
    movsx ebp, word [ebx + 0x1c0bc6]
    test eax, eax
    jns short loc_09b3
    neg eax
loc_09b3:
    cmp eax, ebp
    jg short loc_09f1
    movsx ebx, word [ebx + 0x1c0bbc]
    lea eax, [ebx*4]
    add eax, ebx
    movsx ecx, word [esi + 0x2385c8]
    movsx ebx, word [eax*8 + 0x2385c8]
    movsx eax, word [esp + 4]
    sub ecx, eax
    cmp ebx, ecx
    je short loc_09f1
loc_09e1:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp near loc_093f
loc_09f1:
    movsx eax, dx
    cmp eax, -1
    jne short loc_0a00
    mov al, 1
    jmp near loc_0a80
loc_0a00:
    cmp word [esp + 4], 0
    jne short loc_0a0f
    mov eax, 0x49
    jmp short loc_0a14
loc_0a0f:
    mov eax, 0x47
loc_0a14:
    movsx edx, di
    call 0x5aca0
    mov dx, word [0x2454c8]
loc_0a23:
    test dx, dx
    jl short loc_0a7e
    movsx ebx, dx
    imul eax, ebx, 0x2c
    cmp word [eax + 0x1c0bca], 0x11
    jne short loc_0a71
    movsx ecx, di
    imul ecx, ecx, 0x2c
    mov ax, word [eax + 0x1c0bcc]
    cmp ax, word [ecx + 0x1c0bcc]
    jne short loc_0a71
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    movsx ecx, word [esp + 4]
    mov dword [eax + 0x4ea07], ecx
    mov dword [eax + 0x4ea0b], ecx
loc_0a71:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp short loc_0a23
loc_0a7e:
    xor al, al
loc_0a80:
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
%endif
