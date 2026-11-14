; Update world sprites by tile and status.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x14
    mov di, word [0x2d6bda]
loc_0010:
    test di, di
    jl near loc_07ec
    movsx ebp, di
    imul esi, ebp, 0x2c
    add esi, 0x2522b4
    db 0x66, 0x8b, 0x04, 0x6d, 0xb4, 0x0e, 0x24, 0x00    ; mov ax, word [ebp*2 + 0x240eb4]
    mov dx, word [esi + 0x18]
    mov dword [esp + 0x10], eax
    test dx, dx
    jge short loc_0041
    mov eax, ebp
    jmp near loc_07de
loc_0041:
    lea eax, [ebp*8]
    add eax, ebp
    lea eax, [eax*8]
    sub eax, ebp
    mov edx, dword [esi]
    mov dword [eax + 0x8b0db], edx
    mov edx, dword [esi + 4]
    mov dword [eax + 0x8b0df], edx
    mov edx, dword [esi + 8]
    mov dword [eax + 0x8b0e3], edx
    mov ax, word [esi + 0xe]
    cmp ax, 0x27d
    jb short loc_0088
    jbe near loc_078a
    cmp ax, 0x27f
    jbe short loc_0097
    jmp near loc_07e3
loc_0088:
    cmp ax, 0x27b
    je near loc_078a
    jmp near loc_07e3
loc_0097:
    add word [esi + 0x24], 0xfa
    mov cx, word [esi + 0x1c]
    add cx, word [ebp*4 + 0x22fd8]
    movsx eax, word [esi + 0x24]
    mov dword [esp], eax
    mov eax, dword [esi]
    mov dword [esp + 4], eax
    mov eax, dword [esi + 4]
    mov dword [esp + 8], eax
    mov eax, dword [esi + 8]
    mov dx, word [esi + 0x20]
    mov dword [esp + 0xc], eax
    mov eax, ebp
    mov word [esi + 0x1c], cx
    call 0x34ae0
    mov ax, word [esi + 0x1c]
    and ah, 7
    cwde
    db 0x0f, 0xbf, 0x1c, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx ebx, word [eax*2 + 0x2496b4]
    movsx eax, dx
    imul ebx, eax
    movsx edx, word [esi + 0x1c]
    add edx, 0x200
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [edx*2 + 0x2496b4]
    imul edx, eax
    mov ecx, dword [esp]
    push 0x1000040
    sar ebx, 0xe
    sar edx, 0xe
    mov eax, ebp
    call 0x285d0
    mov ebx, eax
    mov ax, word [esi + 0xe]
    cmp ax, 0x27e
    je short loc_012b
    cmp ax, 0x27f
    jne short loc_0164
loc_012b:
    mov cx, word [esi + 0x22]
    test cx, cx
    jl short loc_0164
    movsx edx, cx
    imul edx, edx, 0x2c
    mov eax, dword [esi + 4]
    sub eax, dword [edx + 0x2522b8]
    mov ebp, dword [edx + 0x2522b4]
    mov ecx, eax
    mov eax, dword [esi]
    mov edx, ecx
    sub eax, ebp
    call 0x9b9c0
    cmp eax, 0x100
    jge short loc_0164
    mov bx, word [esi + 0x22]
    or bh, 0xc0
loc_0164:
    cmp word [esi + 0x18], 0
    jl near loc_07db
    movsx eax, bx
    and eax, 0xc000
    cmp eax, 0xc000
    je near loc_0208
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [esi + 8]
    cmp edx, dword [eax + 0x8b0cf]
    jl short loc_0201
    cmp edx, dword [eax + 0x8b0cb]
    jle short loc_01c2
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9cd6], 1
    jne short loc_0201
loc_01c2:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + 0x8b0cb]
    mov edx, dword [esi + 8]
    add eax, 0x1000
    cmp eax, edx
    jge short loc_0208
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9cd6], 1
    jne short loc_0208
loc_0201:
    mov bx, word [esi + 0x18]
    or bh, 0x40
loc_0208:
    test bx, bx
    je near loc_0731
    movsx eax, bx
    and eax, 0xc000
    cmp eax, 0xc000
    jne near loc_05b7
    and bh, 0xf
    movsx ebp, bx
    movsx edx, di
    mov eax, ebp
    call 0x54040
    imul eax, ebp, 0x2c
    mov ax, word [eax + 0x2522c2]
    cmp ax, 0xa3a
    jb short loc_02aa
    jbe near loc_04fb
    cmp ax, 0xc3a
    jb short loc_0280
    jbe near loc_04fb
    cmp ax, 0xd3a
    jb short loc_0271
    jbe near loc_04fb
    cmp ax, 0xd3c
    je near loc_0483
    jmp near loc_06e2
loc_0271:
    cmp ax, 0xc3c
    je near loc_0483
    jmp near loc_06e2
loc_0280:
    cmp ax, 0xb3a
    jb short loc_029b
    jbe near loc_04fb
    cmp ax, 0xb3c
    je near loc_0483
    jmp near loc_06e2
loc_029b:
    cmp ax, 0xa3c
    je near loc_0483
    jmp near loc_06e2
loc_02aa:
    cmp ax, 0x33a
    jb short loc_02e0
    jbe near loc_04fb
    cmp ax, 0x93a
    jb short loc_02d1
    jbe near loc_04fb
    cmp ax, 0x93c
    je near loc_0483
    jmp near loc_06e2
loc_02d1:
    cmp ax, 0x33c
    je near loc_0483
    jmp near loc_06e2
loc_02e0:
    cmp ax, 0x23a
    jb short loc_02fb
    jbe near loc_04fb
    cmp ax, 0x23c
    je near loc_0483
    jmp near loc_06e2
loc_02fb:
    cmp ax, 0x214
    jne near loc_06e2
    call 0x167c0
    mov ebp, eax
    movsx edx, bx
    mov eax, 0x194
    call 0x58160
    cmp word [esi + 0xe], 0x27f
    jne near loc_07db
    add dword [0x7c20], 0x64
    test ebp, ebp
    jl near loc_0449
    cmp dword [0x7c14], 8
    jge near loc_0449
    mov edx, 0x10000
    movsx eax, word [0x2f2926]
    call 0x18710
    push 8
    mov ecx, 1
    mov ebx, 0x27b
    push 0
    mov edx, 0x64
    mov eax, 0xa0
    call 0x13050
    mov eax, 0x146c
    mov edx, 0x14
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0x96
    call 0x3eca0
    mov eax, 0x1484
    mov edx, 0x1e
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0x96
    call 0x3eca0
    mov ecx, 1
    mov edx, 0x1e
    mov eax, 0xd7
    lea ebx, [ecx + ebp]
    call 0x3e190
    mov eax, 0x1498
    mov edx, 0x28
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0x96
    call 0x3eca0
    call 0x61a10
    call 0x9c43c
    xor eax, eax
loc_03dd:
    inc eax
    cmp eax, 0x1f4
    jl short loc_03dd
    call 0x9c3b0
    imul eax, ebp, 0x2c
    mov dword [eax + 0x2e64c], 1
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x6b, 0x04, 0x45, 0xb0, 0x19, 0x0f, 0x00, 0x2c    ; imul eax, dword [eax*2 + 0xf19b0], 0x2c
    mov ecx, 1
    mov esi, dword [0x7c14]
    add esi, ecx
    mov ebx, ecx
    mov dword [eax + 0x2e64c], ecx
    mov eax, ebp
    mov dword [0x7c14], esi
    call 0x477e0
    movsx eax, di
    call 0x67ff5
    mov edi, dword [esp + 0x10]
    jmp near loc_0010
loc_0449:
    mov eax, 0x1f2
    call 0x3c5f0
    movsx esi, word [0x2f2926]
    mov eax, esi
    shl eax, 7
    sub eax, esi
    lea eax, [eax*4]
    sub eax, esi
    db 0xc6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x01    ; mov byte [eax*2 + 0xf1ac2], 1
    movsx eax, di
    call 0x67ff5
    mov edi, dword [esp + 0x10]
    jmp near loc_0010
loc_0483:
    movsx ebp, bx
    mov eax, 0x194
    mov edx, ebp
    call 0x58160
    cmp word [esi + 0xe], 0x27f
    jne near loc_06e2
    mov eax, ebp
    call 0x16f10
    test eax, eax
    jl near loc_07db
    mov eax, ebp
    call 0x16f10
    imul eax, eax, 0x2c
    cmp dword [eax + 0x2e64c], 0
    je near loc_07db
    add dword [0x7c20], 0x64
    mov eax, ebp
    call 0x16f10
    imul eax, eax, 0x2c
    mov ebx, dword [0x7c14]
    inc ebx
    xor edx, edx
    mov dword [0x7c14], ebx
    mov dword [eax + 0x2e64c], edx
    movsx eax, di
    call 0x67ff5
    mov edi, dword [esp + 0x10]
    jmp near loc_0010
loc_04fb:
    movsx ebp, bx
    mov eax, 0x194
    mov edx, ebp
    call 0x58160
    mov eax, 2
    mov edx, ebp
    call 0x58160
    cmp word [esi + 0xe], 0x27e
    jne near loc_07db
    mov eax, ebp
    call 0x16f50
    imul eax, eax, 0x2c
    cmp dword [eax + 0x2e4ec], 0
    je near loc_07db
    mov eax, dword [0x7c18]
    mov esi, dword [0x7c1c]
    add eax, 0x4b
    add esi, 0x64
    mov dword [0x7c18], eax
    mov eax, ebp
    mov dword [0x7c1c], esi
    call 0x16f50
    imul eax, eax, 0x2c
    mov ebx, dword [0x7c10]
    inc ebx
    xor edx, edx
    mov dword [0x7c10], ebx
    mov dword [eax + 0x2e4ec], edx
    cmp ebx, 8
    jl near loc_07db
    mov eax, 0x1f3
    call 0x3c5f0
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x01    ; mov byte [eax*2 + 0xf1ac2], 1
    movsx eax, di
    call 0x67ff5
    mov edi, dword [esp + 0x10]
    jmp near loc_0010
loc_05b7:
    cmp eax, 0x8000
    jne near loc_0675
    mov cx, word [esi + 0xe]
    and bh, 0x1f
    cmp cx, 0x27e
    je near loc_0653
    cmp cx, 0x669
    je near loc_0653
    cmp cx, 0x664
    je short loc_0653
    movsx eax, bx
    shl eax, 5
    cmp word [eax + 0x27e4c6], 0x230
    je short loc_0602
    cmp word [eax + 0x27e4c4], 0x230
    jne short loc_0653
loc_0602:
    movsx ebp, bx
    shl ebp, 5
    movsx edx, word [ebp + 0x27e4bc]
    shl edx, 5
    mov ebx, dword [ebp + 0x27e4b8]
    mov eax, dword [edx + 0x27e4b8]
    sub eax, ebx
    mov ecx, dword [ebp + 0x27e4b4]
    mov ebx, eax
    mov eax, dword [edx + 0x27e4b4]
    mov edx, ebx
    sub eax, ecx
    call 0x62b58
    mov bx, word [esi + 0x1c]
    add eax, eax
    sub eax, ebx
    mov word [esi + 0x1e], di
    and ah, 7
    mov word [esi + 0x1c], ax
    mov edi, dword [esp + 0x10]
    jmp near loc_0010
loc_0653:
    movsx edx, bx
    movsx eax, word [esi + 0xe]
    movsx ebp, di
    push eax
    mov ecx, dword [esi + 8]
    mov eax, dword [esi]
    push ecx
    mov ebx, eax
    mov ecx, dword [esi + 4]
    mov eax, ebp
    call 0x536f0
    jmp near loc_06e2
loc_0675:
    cmp eax, 0x4000
    jne short loc_06e2
    mov ecx, dword [esp + 0xc]
    mov ebx, dword [esp + 8]
    movsx ebp, di
    mov edx, dword [esp + 4]
    mov eax, ebp
    call 0x67ce6
    cmp word [esi + 0x24], 0
    jge short loc_06e2
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    test byte [eax + 0x2c9cc0], 1
    je short loc_06cf
    cmp byte [eax + 0x2c9cc9], 0
    jne short loc_06cf
    mov eax, ebp
    call 0x67ff5
    mov edi, dword [esp + 0x10]
    jmp near loc_0010
loc_06cf:
    movsx eax, word [esi + 0x18]
    call 0x53d60
    test al, al
    je short loc_06e2
    mov word [esi + 0xc], 0x20
loc_06e2:
    mov eax, 0x190
    movsx edx, di
    call 0x58160
    movsx eax, word [esi + 0x18]
    call 0x53d60
    test al, al
    je short loc_0702
    mov word [esi + 0xc], 0x20
loc_0702:
    cmp word [esi + 0xe], 0x27e
    jne short loc_0712
    mov word [esi + 0xe], 0x27d
    jmp short loc_0718
loc_0712:
    mov word [esi + 0xe], 0x27b
loc_0718:
    mov bh, byte [esi + 0x14]
    mov cl, byte [esi + 0x15]
    add bh, bh
    add cl, cl
    mov byte [esi + 0x14], bh
    mov byte [esi + 0x15], cl
    mov edi, dword [esp + 0x10]
    jmp near loc_0010
loc_0731:
    cmp word [esi + 0xe], 0x27e
    jne near loc_07e3
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9cd6], 2
    jne near loc_07e3
    cmp byte [esi + 0x14], 0xa
    jb near loc_07e3
    call 0x6dc5f
    sar eax, 8
    cmp eax, 0x73
    jl near loc_07e3
    mov edx, 0x295
    movsx eax, di
    call 0x19680
    mov edi, dword [esp + 0x10]
    jmp near loc_0010
loc_078a:
    call 0x6dc5f
    test al, 1
    je short loc_07e3
    call 0x6dc5f
    test al, 1
    je short loc_07e3
    call 0x6dc5f
    test al, 1
    je short loc_07e3
    call 0x6dc5f
    test al, 1
    je short loc_07e3
    call 0x6dc5f
    test al, 1
    je short loc_07e3
    call 0x6dc5f
    test al, 1
    je short loc_07e3
    call 0x6dc5f
    test al, 1
    je short loc_07e3
    call 0x6dc5f
    test al, 1
    je short loc_07e3
    call 0x6dc5f
    test al, 1
    je short loc_07e3
loc_07db:
    movsx eax, di
loc_07de:
    call 0x67ff5
loc_07e3:
    mov edi, dword [esp + 0x10]
    jmp near loc_0010
loc_07ec:
    add esp, 0x14
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
%else
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x10
    mov di, word [0x2454ca]
loc_0010:
    test di, di
    jl near 0x28e41
    movsx ebp, di
    imul esi, ebp, 0x2c
    add esi, 0x1c0ba4
    db 0x66, 0x8b, 0x04, 0x6d, 0xa4, 0xf7, 0x1a, 0x00    ; mov ax, word [ebp*2 + 0x1af7a4]
    mov dx, word [esi + 0x18]
    mov dword [esp + 0xc], eax
    test dx, dx
    jge short loc_0041
    mov eax, ebp
    jmp near loc_065a
loc_0041:
    lea eax, [ebp*8]
    add eax, ebp
    lea eax, [eax*8]
    sub eax, ebp
    mov edx, dword [esi]
    mov dword [eax + 0x4e9fb], edx
    mov edx, dword [esi + 4]
    mov dword [eax + 0x4e9ff], edx
    mov edx, dword [esi + 8]
    mov dword [eax + 0x4ea03], edx
    mov ax, word [esi + 0xe]
    cmp ax, 0x27d
    jb short loc_0088
    jbe near loc_0606
    cmp ax, 0x27f
    jbe short loc_0097
    jmp near loc_065f
loc_0088:
    cmp ax, 0x27b
    je near loc_0606
    jmp near loc_065f
loc_0097:
    mov eax, dword [esi]
    mov bx, word [esi + 0x24]
    mov dword [esp + 8], eax
    mov eax, dword [esi + 4]
    mov dx, word [esi + 0x20]
    mov dword [esp], eax
    mov eax, dword [esi + 8]
    add ebx, 0xfa
    mov dword [esp + 4], eax
    mov eax, ebp
    mov word [esi + 0x24], bx
    call 0x37570
    mov ax, word [esi + 0x1c]
    and ah, 7
    movsx edx, dx
    cwde
    movsx ecx, bx
    mov ebx, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    imul ebx, eax
    movsx eax, word [esi + 0x1c]
    add eax, 0x200
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    imul edx, eax
    push 0x1000040
    sar ebx, 0xe
    sar edx, 0xe
    mov eax, ebp
    call 0x28220
    mov cx, word [esi + 0xe]
    mov ebx, eax
    cmp cx, 0x27e
    je short loc_011d
    cmp cx, 0x27f
    jne short loc_0156
loc_011d:
    mov dx, word [esi + 0x22]
    test dx, dx
    jl short loc_0156
    movsx edx, dx
    imul edx, edx, 0x2c
    mov eax, dword [esi + 4]
    sub eax, dword [edx + 0x1c0ba8]
    mov ebp, dword [edx + 0x1c0ba4]
    mov ecx, eax
    mov eax, dword [esi]
    mov edx, ecx
    sub eax, ebp
    call 0x9e500
    cmp eax, 0x100
    jge short loc_0156
    mov bx, word [esi + 0x22]
    or bh, 0xc0
loc_0156:
    cmp word [esi + 0x18], 0
    jl near loc_0657
    movsx eax, bx
    and eax, 0xc000
    cmp eax, 0xc000
    je near loc_01fa
    movsx ebp, di
    lea eax, [ebp*8]
    add eax, ebp
    lea eax, [eax*8]
    sub eax, ebp
    mov edx, dword [esi + 8]
    cmp edx, dword [eax + 0x4e9ef]
    jl short loc_01f3
    cmp edx, dword [eax + 0x4e9eb]
    jle short loc_01b4
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385c6], 1
    jne short loc_01f3
loc_01b4:
    movsx ebp, di
    lea eax, [ebp*8]
    add eax, ebp
    lea eax, [eax*8]
    sub eax, ebp
    mov eax, dword [eax + 0x4e9eb]
    mov edx, dword [esi + 8]
    add eax, 0x1000
    cmp eax, edx
    jge short loc_01fa
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385c6], 1
    jne short loc_01fa
loc_01f3:
    mov bx, word [esi + 0x18]
    or bh, 0x40
loc_01fa:
    test bx, bx
    je near loc_05ad
    movsx eax, bx
    and eax, 0xc000
    cmp eax, 0xc000
    jne near loc_0434
    and bh, 0xf
    movsx ebp, bx
    imul ecx, ebp, 0x2c
    mov eax, 0x1c0ba4
    add eax, ecx
    movsx edx, di
    call 0x12be0
    mov eax, ebp
    call 0x56c90
    mov ax, word [ecx + 0x1c0bb2]
    cmp ax, 0xa3a
    jb short loc_02a0
    jbe near loc_03a3
    cmp ax, 0xc3a
    jb short loc_027e
    jbe near loc_03a3
    cmp ax, 0xd3a
    jb short loc_026f
    jbe near loc_03a3
    cmp ax, 0xd3c
    je near loc_02ef
    jmp near loc_055e
loc_026f:
    cmp ax, 0xc3c
    je near loc_02ef
    jmp near loc_055e
loc_027e:
    cmp ax, 0xb3a
    jb short loc_0295
    jbe near loc_03a3
    cmp ax, 0xb3c
    je short loc_02ef
    jmp near loc_055e
loc_0295:
    cmp ax, 0xa3c
    je short loc_02ef
    jmp near loc_055e
loc_02a0:
    cmp ax, 0x33a
    jb short loc_02ce
    jbe near loc_03a3
    cmp ax, 0x93a
    jb short loc_02c3
    jbe near loc_03a3
    cmp ax, 0x93c
    je short loc_02ef
    jmp near loc_055e
loc_02c3:
    cmp ax, 0x33c
    je short loc_02ef
    jmp near loc_055e
loc_02ce:
    cmp ax, 0x23a
    jb short loc_02e5
    jbe near loc_03a3
    cmp ax, 0x23c
    je short loc_02ef
    jmp near loc_055e
loc_02e5:
    cmp ax, 0x214
    jne near loc_055e
loc_02ef:
    cmp word [esi + 0xe], 0x27f
    jne near loc_0657
    movsx esi, bx
    mov eax, esi
    call 0x16d60
    shl eax, 4
    cmp dword [eax + 0x224ac], 0
    je near loc_0657
    add dword [0x7bfc], 0x64
    mov eax, esi
    imul esi, esi, 0x2c
    call 0x16d60
    shl eax, 4
    xor edx, edx
    mov dword [eax + 0x224ac], edx
    cmp word [esi + 0x1c0bb2], 0x214
    jne near loc_0657
    call 0x16800
    mov esi, eax
    test eax, eax
    jl short loc_0388
    push 4
    mov ecx, 1
    mov ebx, 0x27b
    push 0
    mov edx, 0x64
    mov eax, 0x96
    call 0x13070
    xor eax, eax
loc_036a:
    inc eax
    cmp eax, 0x64
    jl short loc_036a
    mov ebx, 1
    movsx edx, word [0x261216]
    mov eax, esi
    call 0x4a280
    jmp near loc_0657
loc_0388:
    mov eax, 0x1480
    call 0x16030
    movsx eax, di
    call 0x6ab35
    mov edi, dword [esp + 0xc]
    jmp near loc_0010
loc_03a3:
    movsx ebp, bx
    mov eax, 2
    mov edx, ebp
    call 0x5aca0
    cmp word [esi + 0xe], 0x27e
    jne near loc_0657
    mov eax, ebp
    call 0x16da0
    shl eax, 4
    cmp dword [eax + 0x2242c], 0
    je near loc_0657
    mov eax, dword [0x7bf8]
    mov edx, dword [0x7bf4]
    xor ebx, ebx
    add eax, 0x64
    add edx, 0x4b
    mov dword [0x7bf8], eax
    mov eax, ebp
    mov dword [0x7bf4], edx
    call 0x16da0
    mov ecx, dword [0x7bf0]
    shl eax, 4
    inc ecx
    mov dword [eax + 0x2242c], ebx
    mov dword [0x7bf0], ecx
    cmp ecx, 8
    jl near loc_0657
    mov eax, 0x148c
    call 0x16030
    movsx eax, di
    call 0x6ab35
    mov edi, dword [esp + 0xc]
    jmp near loc_0010
loc_0434:
    cmp eax, 0x8000
    jne near loc_04f2
    mov cx, word [esi + 0xe]
    and bh, 0x1f
    cmp cx, 0x27e
    je near loc_04d0
    cmp cx, 0x669
    je near loc_04d0
    cmp cx, 0x664
    je short loc_04d0
    movsx eax, bx
    shl eax, 5
    cmp word [eax + 0x1ecdb6], 0x230
    je short loc_047f
    cmp word [eax + 0x1ecdb4], 0x230
    jne short loc_04d0
loc_047f:
    movsx edx, bx
    shl edx, 5
    movsx ebp, word [edx + 0x1ecdac]
    shl ebp, 5
    mov ebx, dword [edx + 0x1ecda8]
    mov eax, dword [ebp + 0x1ecda8]
    sub eax, ebx
    mov ecx, dword [edx + 0x1ecda4]
    mov ebx, eax
    mov eax, dword [ebp + 0x1ecda4]
    mov edx, ebx
    sub eax, ecx
    call 0x65698
    mov bx, word [esi + 0x1c]
    add eax, eax
    sub eax, ebx
    mov word [esi + 0x1e], di
    and ah, 7
    mov word [esi + 0x1c], ax
    mov edi, dword [esp + 0xc]
    jmp near loc_0010
loc_04d0:
    movsx edx, bx
    movsx eax, word [esi + 0xe]
    movsx ebp, di
    push eax
    mov ecx, dword [esi + 8]
    mov eax, dword [esi]
    push ecx
    mov ebx, eax
    mov ecx, dword [esi + 4]
    mov eax, ebp
    call 0x56340
    jmp near loc_055e
loc_04f2:
    cmp eax, 0x4000
    jne short loc_055e
    mov ecx, dword [esp + 4]
    mov ebx, dword [esp]
    movsx ebp, di
    mov edx, dword [esp + 8]
    mov eax, ebp
    call 0x6a826
    cmp word [esi + 0x24], 0
    jge short loc_055e
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    test byte [eax + 0x2385b0], 1
    je short loc_054b
    cmp byte [eax + 0x2385b9], 0
    jne short loc_054b
    mov eax, ebp
    call 0x6ab35
    mov edi, dword [esp + 0xc]
    jmp near loc_0010
loc_054b:
    movsx eax, word [esi + 0x18]
    call 0x569b0
    test al, al
    je short loc_055e
    mov word [esi + 0xc], 0x20
loc_055e:
    mov eax, 0x190
    movsx edx, di
    call 0x5aca0
    movsx eax, word [esi + 0x18]
    call 0x569b0
    test al, al
    je short loc_057e
    mov word [esi + 0xc], 0x20
loc_057e:
    cmp word [esi + 0xe], 0x27e
    jne short loc_058e
    mov word [esi + 0xe], 0x27d
    jmp short loc_0594
loc_058e:
    mov word [esi + 0xe], 0x27b
loc_0594:
    mov bl, byte [esi + 0x14]
    add bl, bl
    mov byte [esi + 0x14], bl
    mov bh, byte [esi + 0x15]
    add bh, bh
    mov byte [esi + 0x15], bh
    mov edi, dword [esp + 0xc]
    jmp near loc_0010
loc_05ad:
    cmp word [esi + 0xe], 0x27e
    jne near loc_065f
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385c6], 2
    jne near loc_065f
    cmp byte [esi + 0x14], 0xa
    jb near loc_065f
    call 0x7079f
    sar eax, 8
    cmp eax, 0x73
    jl near loc_065f
    mov edx, 0x295
    movsx eax, di
    call 0x19320
    mov edi, dword [esp + 0xc]
    jmp near loc_0010
loc_0606:
    call 0x7079f
    test al, 1
    je short loc_065f
    call 0x7079f
    test al, 1
    je short loc_065f
    call 0x7079f
    test al, 1
    je short loc_065f
    call 0x7079f
    test al, 1
    je short loc_065f
    call 0x7079f
    test al, 1
    je short loc_065f
    call 0x7079f
    test al, 1
    je short loc_065f
    call 0x7079f
    test al, 1
    je short loc_065f
    call 0x7079f
    test al, 1
    je short loc_065f
    call 0x7079f
    test al, 1
    je short loc_065f
loc_0657:
    movsx eax, di
loc_065a:
    call 0x6ab35
loc_065f:
    mov edi, dword [esp + 0xc]
    jmp near loc_0010
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
%endif
