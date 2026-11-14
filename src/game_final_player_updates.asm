; Player update routines.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
loc_0004:
    push ebx
    push edx
    movsx ebx, ax
    mov edx, ebx
    shl edx, 7
    sub edx, ebx
    lea edx, [edx*4]
    sub edx, ebx
    add edx, edx
    mov eax, 9
    add edx, 0xf1720
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jl short loc_0033
    mov eax, 9
    jmp short loc_005a
loc_0033:
    movsx ebx, ax
    inc eax
    mov byte [edx + ebx + 0x3d3], 0
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jl short loc_0033
    mov eax, 9
    jmp short loc_005a
loc_004c:
    movsx ebx, ax
    inc eax
    mov word [edx + ebx*2 + 0x2a6], 0
loc_005a:
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jl short loc_004c
    mov word [edx + 0x392], 6
    mov word [edx + 0x334], 5
    mov word [edx + 0x312], 1
    mov byte [edx + 0x3d7], 1
    mov byte [edx + 0x3d4], 1
    mov byte [edx + 0x3d8], 1
    mov byte [edx + 0x3da], 1
    mov byte [edx + 0x3d5], 1
    mov byte [edx + 0x3d9], 1
    mov byte [edx + 0x3db], 1
    mov byte [edx + 0x3d6], 1
    mov word [edx + 0x2ae], 0x140
    mov word [edx + 0x2a8], 0xc8
    mov word [edx + 0x2aa], 0xc8
    mov word [edx + 0x2b0], 0x190
    mov word [edx + 0x2b2], 0x190
    mov word [edx + 0x2b4], 0x190
    mov word [edx + 0x2b6], 0x190
    mov word [edx + 0x2ac], 0x190
    mov byte [edx + 0x3d3], 0
    mov byte [edx + 0x3e5], 0
    mov word [edx + 0x314], 0xffff
    mov word [edx + 0x384], 0
    mov dword [edx + 0x258], 0
    mov byte [edx + 0x3d1], 0
    xor eax, eax
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jl short loc_0137
    pop edx
    pop ebx
    ret
loc_0137:
    mov ebx, eax
    dec ebx
    cmp bx, 7
    ja short loc_0197
    and ebx, 0xffff
    jmp dword cs:[ebx*4 + 0x3e46c]
    movsx ebx, ax
    mov word [edx + ebx*2 + 0x2ce], 0xc
    jmp short loc_0197
    movsx ebx, ax
    mov word [edx + ebx*2 + 0x2ce], 0x14
    jmp short loc_0197
    movsx ebx, ax
    mov word [edx + ebx*2 + 0x2ce], 0x28
    jmp short loc_0197
    movsx ebx, ax
    mov word [edx + ebx*2 + 0x2ce], 0x4b
    jmp short loc_0197
    movsx ebx, ax
    mov word [edx + ebx*2 + 0x2ce], 0x64
loc_0197:
    movsx ebx, ax
    inc eax
    mov word [edx + ebx*2 + 0x2f0], 0
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jl short loc_0137
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
loc_01b4:
    push edx
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    add eax, 0xf1720
    mov byte [eax + 0x3c9], 0
    mov word [eax + 0x39c], 0
    mov byte [eax + 0x3ce], 0
    mov word [eax + 0x386], 0
    mov word [eax + 0x354], 0
    mov byte [eax + 0x3d0], 0
    mov byte [eax + 0x3cb], 0
    mov word [eax + 0x388], 0
    mov dx, word [0x1239f8]
    mov word [eax + 0x38e], 0xffff
    mov word [eax + 0x31c], 0
    mov word [eax + 0x33a], 0
    mov word [eax + 0x38a], 0
    mov byte [eax + 0x3c9], 0
    mov word [eax + 0x38c], dx
    pop edx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
loc_0254:
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov ecx, eax
    mov byte [esp], dl
    movsx ebx, ax
    mov edx, ebx
    shl edx, 7
    sub edx, ebx
    lea edx, [edx*4]
    mov edi, 0xffffffff
    sub edx, ebx
    mov ebx, 0xf1720
    add edx, edx
    mov si, word [0x8d8c]
    add ebx, edx
    xor edx, edx
    xor eax, eax
    mov word [0x1256ce], dx
    jmp short loc_02a2
loc_0296:
    movsx edx, ax
    inc eax
    db 0x66, 0x89, 0x3c, 0x55, 0xf8, 0x03, 0x0f, 0x00    ; mov word [edx*2 + 0xf03f8], di
loc_02a2:
    cmp ax, si
    jl short loc_0296
    mov byte [ebx + 0x3a5], 0
    mov word [ebx + 0x34c], 0
    mov dword [ebx + 0x274], 0
    mov byte [ebx + 0x3e9], 0
    mov byte [ebx + 0x3ef], 0
    mov byte [ebx + 0x3ee], 0
    mov byte [ebx + 0x3f4], 0
    mov byte [ebx + 0x3f3], 0
    mov byte [ebx + 0x3cd], 0
    mov word [ebx + 0x392], 6
    mov word [ebx + 0x334], 5
    mov word [ebx + 0x314], 0xffff
    mov word [ebx + 0x37c], 0
    mov word [ebx + 0x384], 0
    mov byte [ebx + 0x3d1], 0
    mov dword [ebx + 0x258], 0
    mov word [ebx + 0x342], 0xffff
    mov esi, 0x11
    mov edx, dword [0x125cff]
    xor edi, edi
    mov dword [ebx + 0x268], edx
    xor ebp, ebp
    mov ax, word [0x2f2926]
    mov word [0x1256d2], di
    mov word [0x1256d0], di
    mov dword [0x2d58d4], esi
    mov word [0x125cf3], di
    mov dword [0x8dd4], ebp
    xor edx, edx
    mov esi, 0xffffffff
    mov word [0x1256c6], ax
    mov dword [0x121ec4], edx
    xor edi, edi
    mov word [0x125cf7], si
    mov dword [0x2e7dc], edi
    mov word [0x1256c8], si
    xor ah, ah
    xor dl, dl
    mov byte [0x2d7c9e], ah
    xor eax, eax
    mov byte [0x12577f], dl
    mov dword [0x8dd8], eax
    mov al, byte [esp]
    mov byte [0x126232], dl
    test al, 8
    jne short loc_03c5
    cmp word [0x2f2924], 2
    jl short loc_03d8
loc_03c5:
    cmp dword [0x125d47], 1
    je short loc_03eb
    cmp word [0x2f2924], 1
    jle short loc_03eb
loc_03d8:
    movsx edx, cx
    mov eax, edx
    call loc_0004
    mov eax, edx
    call loc_01b4
    jmp short loc_040d
loc_03eb:
    cmp word [ebx + 0x312], 0x12
    jne short loc_040d
    mov si, word [ebx + 0x2c0]
    mov word [ebx + 0x312], 0xd
    inc esi
    mov word [ebx + 0x2c0], si
loc_040d:
    mov word [ebx + 0x358], 0
    mov word [ebx + 0x35a], 0
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
loc_0434:
    push ebx
    push ecx
    push edx
    mov ebx, eax
    xor eax, eax
    jmp short loc_044b
loc_043d:
    movsx edx, ax
    xor ecx, ecx
    inc eax
    db 0x66, 0x89, 0x0c, 0x55, 0xb4, 0x90, 0x24, 0x00    ; mov word [edx*2 + 0x2490b4], cx
loc_044b:
    cmp ax, 0x100
    jl short loc_043d
    cmp dword [0x2d58c8], 0x10000
    je short loc_0467
    mov dword [0x2d58c8], 0x8000
loc_0467:
    cmp bx, 0x54
    jb short loc_0477
    jbe short loc_047d
    cmp bx, 0x58
    je short loc_047d
    jmp short loc_0487
loc_0477:
    cmp bx, 0x50
    jne short loc_0487
loc_047d:
    mov dword [0x2d58c8], 0x10000
loc_0487:
    mov word [0x2d7c0c], 3
    pop edx
    pop ecx
    pop ebx
    ret
loc_0494:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x84
    mov dl, al
    mov ecx, 0x80
    mov edi, 0x232eb4
    xor eax, eax
    cmp ecx, 4
    jae short loc_04c0
    test cl, 1
    je short loc_04b9
    db 0xaa    ; stosb byte es:[edi], al
loc_04b9:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_04eb
loc_04c0:
    test edi, 1
    je short loc_04ca
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_04ca:
    test edi, 2
    je short loc_04d7
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_04d7:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_04e5
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_04e5:
    test bl, 1
    je short loc_04eb
    db 0xaa    ; stosb byte es:[edi], al
loc_04eb:
    mov ecx, 0x400
    mov edi, 0x238f34
    xor eax, eax
    cmp ecx, 4
    jae short loc_0509
    test cl, 1
    je short loc_0502
    db 0xaa    ; stosb byte es:[edi], al
loc_0502:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_0534
loc_0509:
    test edi, 1
    je short loc_0513
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_0513:
    test edi, 2
    je short loc_0520
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_0520:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_052e
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_052e:
    test bl, 1
    je short loc_0534
    db 0xaa    ; stosb byte es:[edi], al
loc_0534:
    mov ecx, 0x200
    mov edi, 0x248eb4
    xor eax, eax
    cmp ecx, 4
    jae short loc_0552
    test cl, 1
    je short loc_054b
    db 0xaa    ; stosb byte es:[edi], al
loc_054b:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_057d
loc_0552:
    test edi, 1
    je short loc_055c
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_055c:
    test edi, 2
    je short loc_0569
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_0569:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_0577
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_0577:
    test bl, 1
    je short loc_057d
    db 0xaa    ; stosb byte es:[edi], al
loc_057d:
    and edx, 0xff
    xor eax, eax
    call loc_0254
    xor edx, edx
    xor ebx, ebx
    mov word [0x1256ac], dx
    jmp near loc_0725
loc_059a:
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    mov word [eax*8 + 0x2c9cda], 0x100
    mov ax, word [eax*8 + 0x2c9cd6]
    db 0x66, 0x3d, 0x14, 0x00    ; cmp ax, 0x14
    jb short loc_05f7
    jbe short loc_05c6
    db 0x66, 0x3d, 0x16, 0x00    ; cmp ax, 0x16
    jne short loc_05f7
loc_05c6:
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov edx, dword [eax + 0x2c9cbc]
    cmp edx, dword [eax + 0x2c9cb8]
    jle near loc_0724
    or byte [eax + 0x2c9cd7], 0x80
    jmp near loc_0724
loc_05f7:
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    test byte [eax + 0x2c9cc0], 1
    je near loc_06d2
    movsx edx, word [eax + 0x2c9cc4]
    cmp dword [edx*4 + 0x242eb4], 0
    jne short loc_0675
    cmp word [eax + 0x2c9cc4], 0x58
    jne short loc_0675
    xor edx, edx
    jmp short loc_066f
loc_0636:
    movsx ecx, bx
    lea eax, [ecx*4]
    add eax, ecx
    lea eax, [eax*8]
    movsx ecx, dx
    movsx esi, word [eax + 0x2c9cc4]
    add ecx, esi
    cmp dword [ecx*4 + 0x242eb4], 0
    jne short loc_066e
    mov ax, word [eax + 0x2c9cc4]
    add eax, edx
    cwde
    call 0x4d1b0
loc_066e:
    inc edx
loc_066f:
    cmp dx, 5
    jl short loc_0636
loc_0675:
    movsx edx, bx
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    movsx eax, word [edx + 0x2c9cc4]
    call loc_0434
    cmp word [edx + 0x2c9cc4], 0x4f
    jne short loc_06bf
    mov dx, word [0x1256ac]
    cmp dx, 0x7f
    jge short loc_06bf
    mov eax, edx
    inc eax
    movsx edx, dx
    mov word [0x1256ac], ax
    db 0x66, 0x89, 0x1c, 0x55, 0x00, 0xa7, 0x07, 0x00    ; mov word [edx*2 + 0x7a700], bx
loc_06bf:
    movsx eax, word [0xf1a62]
    cmp eax, -1
    jne short loc_06d2
    mov word [0xf1a62], bx
loc_06d2:
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov cx, word [eax + 0x2c9cd6]
    cmp cx, 0x7fff
    jne short loc_06fb
    inc byte [0xf1b0e]
    jmp short loc_0724
loc_06fb:
    movsx edx, cx
    cmp edx, -1
    jne short loc_0724
    movsx eax, word [eax + 0x2c9cb4]
    shl eax, 5
    mov edx, dword [eax + 0x27e4b4]
    mov eax, dword [eax + 0x27e4b8]
    mov dword [0xf1724], edx
    mov dword [0xf1728], eax
loc_0724:
    inc ebx
loc_0725:
    cmp bx, word [0x2d7c12]
    jl near loc_059a
    mov bx, word [0x2d6bd2]
loc_0739:
    test bx, bx
    jl near loc_089c
    movsx eax, bx
    db 0x66, 0x8b, 0x3c, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov di, word [eax*2 + 0x240eb4]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x2522da]
    cmp edx, -1
    jne short loc_0781
    test byte [eax + 0x2522c0], 0x10
    je short loc_0781
    mov edx, dword [eax + 0x2522b4]
    mov eax, dword [eax + 0x2522b8]
    mov dword [0xf1724], edx
    mov dword [0xf1728], eax
    jmp near loc_0895
loc_0781:
    movsx esi, bx
    imul ecx, esi, 0x2c
    mov ax, word [ecx + 0x2522c2]
    db 0x66, 0x3d, 0x07, 0x00    ; cmp ax, 7
    jb near loc_0895
    jbe short loc_07d0
    db 0x66, 0x3d, 0x0a, 0x00    ; cmp ax, 0xa
    jne near loc_0895
    movsx edx, word [ecx + 0x2522cc]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov ax, word [ecx + 0x2522da]
    mov word [edx + 0x2c9cda], ax
    mov eax, esi
    jmp near loc_0890
loc_07d0:
    cmp word [0x1256d0], 0x100
    jl short loc_07e5
    mov eax, 0x303c
    call 0x15ff0
loc_07e5:
    movsx ecx, bx
    imul ecx, ecx, 0x2c
    movsx edx, word [0x1256d0]
    lea esi, [edx*4]
    sub esi, edx
    lea esi, [esi*4]
    mov ax, word [ecx + 0x2522cc]
    mov word [esi + 0x10a700], ax
    mov ax, word [ecx + 0x2522da]
    mov word [esi + 0x10a702], ax
    movsx ax, byte [ecx + 0x2522c4]
    movsx edx, word [ecx + 0x2522cc]
    mov word [esi + 0x10a704], ax
    lea eax, [edx*4]
    add eax, edx
    movsx ax, byte [eax*8 + 0x2c9cd0]
    mov word [esi + 0x10a706], ax
    mov ax, word [ecx + 0x2522dc]
    mov dx, word [ecx + 0x2522d0]
    mov word [esi + 0x10a708], ax
    cmp dx, 0x600
    sete al
    xor ah, ah
    movsx edx, word [0x1256d0]
    mov ecx, eax
    lea eax, [edx*4]
    sub eax, edx
    mov word [eax*4 + 0x10a70a], cx
    movsx eax, bx
    inc word [0x1256d0]
loc_0890:
    call 0x67ff5
loc_0895:
    mov ebx, edi
    jmp near loc_0739
loc_089c:
    xor ebx, ebx
    cmp bx, 0x1000
    jl short loc_08ac
    xor ebx, ebx
    jmp near loc_091a
loc_08ac:
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522ce], 0x400
    jge short loc_08de
    cmp word [eax + 0x2522c2], 1
    jne short loc_08d1
    cmp word [eax + 0x2522da], 0xe
    je short loc_08de
loc_08d1:
    mov eax, 0xffffffff
    movsx edx, bx
    call 0x19680
loc_08de:
    inc ebx
    cmp bx, 0x1000
    jl short loc_08ac
    xor ebx, ebx
    jmp short loc_091a
loc_08ea:
    movsx edx, bx
    imul eax, edx, 0x2c
    cmp word [eax + 0x2522ce], 0x400
    jge short loc_0919
    cmp word [eax + 0x2522c2], 1
    jne short loc_0919
    cmp word [eax + 0x2522da], 0xe
    jne short loc_0919
    mov eax, 0xffffffff
    call 0x19680
loc_0919:
    inc ebx
loc_091a:
    cmp bx, 0x1000
    jl short loc_08ea
    mov ebp, 1
    mov bx, word [0x2d6bd2]
    xor edi, edi
loc_092f:
    test bx, bx
    jl near loc_0b12
    movsx eax, bx
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x2522c2]
    cmp ax, 0xa4
    jb near loc_09f6
    jbe near loc_0b02
    cmp ax, 0x35f
    jb short loc_09b0
    jbe near loc_0a56
    cmp ax, 0x457
    jb short loc_0997
    jbe near loc_0b02
    cmp ax, 0x462
    jb short loc_0988
    jbe near loc_0b02
    cmp ax, 0x463
    je near loc_0a56
    jmp near loc_0b02
loc_0988:
    cmp ax, 0x458
    je near loc_0a56
    jmp near loc_0b02
loc_0997:
    cmp ax, 0x360
    jbe near loc_0b02
    cmp ax, 0x361
    je near loc_0a56
    jmp near loc_0b02
loc_09b0:
    cmp ax, 0x2c9
    jb short loc_09dc
    jbe near loc_0a56
    cmp ax, 0x35d
    jb near loc_0b02
    jbe near loc_0a56
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov bx, word [eax*2 + 0x240eb4]
    jmp near loc_092f
loc_09dc:
    cmp ax, 0xa5
    jbe near loc_0a56
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov bx, word [eax*2 + 0x240eb4]
    jmp near loc_092f
loc_09f6:
    cmp ax, 0x89
    jb short loc_0a3a
    jbe short loc_0a56
    cmp ax, 0x8c
    jb short loc_0a2e
    jbe near loc_0b02
    cmp ax, 0xa2
    jb short loc_0a18
    jbe near loc_0b02
    jmp short loc_0a56
loc_0a18:
    cmp ax, 0x8d
    je short loc_0a56
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov bx, word [eax*2 + 0x240eb4]
    jmp near loc_092f
loc_0a2e:
    cmp ax, 0x8a
    jbe near loc_0b02
    jmp short loc_0a56
loc_0a3a:
    cmp ax, 0x85
    jb near loc_0b02
    jbe short loc_0a56
    cmp ax, 0x87
    jb near loc_0b02
    ja near loc_0b02
loc_0a56:
    xor edx, edx
    jmp short loc_0a71
loc_0a5a:
    movsx ecx, bx
    imul ecx, ecx, 0x2c
    movsx eax, dx
    mov si, word [esp + eax*2]
    cmp si, word [ecx + 0x2522da]
    je short loc_0a76
    inc edx
loc_0a71:
    cmp dx, di
    jl short loc_0a5a
loc_0a76:
    cmp dx, di
    jne near loc_0b02
    movsx eax, bx
    imul edx, eax, 0x2c
    movsx eax, di
    db 0x8d, 0x0c, 0x45, 0x00, 0x00, 0x00, 0x00    ; lea ecx, [eax*2]
    mov ax, word [edx + 0x2522da]
    inc edi
    mov word [esp + ecx], ax
    cmp di, 0x40
    jle short loc_0aab
    mov eax, 0x3058
    call 0x15ff0
loc_0aab:
    mov dx, word [0x2d6bd8]
loc_0ab2:
    test dx, dx
    jl short loc_0b02
    movsx ecx, dx
    imul eax, ecx, 0x2c
    cmp word [eax + 0x2522da], 0xc
    jne short loc_0af5
    movsx esi, bx
    imul esi, esi, 0x2c
    mov ax, word [eax + 0x2522dc]
    cmp ax, word [esi + 0x2522da]
    jne short loc_0af5
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov dword [eax + 0x8b0e7], ebp
loc_0af5:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov dx, word [eax*2 + 0x240eb4]
    jmp short loc_0ab2
loc_0b02:
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov bx, word [eax*2 + 0x240eb4]
    jmp near loc_092f
loc_0b12:
    xor esi, esi
    xor ebx, ebx
    mov word [0x1256c2], si
    jmp near loc_0dda
loc_0b22:
    movsx ecx, bx
    shl ecx, 5
    add ecx, 0x27e4b4
    cmp word [ecx + 0x12], 0x230
    jne near loc_0bc0
    test byte [ecx + 0xe], 0x20
    je near loc_0bc0
    mov si, word [0x1256c2]
    mov dx, word [ecx + 0xc]
    cmp si, 0x3f
    jle short loc_0b5f
    mov eax, 0x3078
    call 0x15ff0
loc_0b5f:
    test dx, dx
    jl short loc_0bc0
    movsx esi, dx
    lea eax, [esi*4]
    add eax, esi
    lea eax, [eax*8]
    cmp word [eax + 0x2c9cc4], 0x230
    je short loc_0bc0
    mov ecx, 0x230
    mov di, word [0x1256c2]
    mov word [eax + 0x2c9cc4], cx
    inc edi
    mov word [eax + 0x2c9ccc], cx
    movsx eax, word [0x1256c2]
    mov word [0x1256c2], di
    db 0x66, 0x89, 0x1c, 0x45, 0x38, 0xb0, 0x08, 0x00    ; mov word [eax*2 + 0x8b038], bx
    db 0x66, 0x89, 0x14, 0x45, 0xb0, 0xa6, 0x08, 0x00    ; mov word [eax*2 + 0x8a6b0], dx
    jmp near loc_0dd9
loc_0bc0:
    cmp word [0x1256d2], 0x200
    jl short loc_0bd5
    mov eax, 0x3094
    call 0x15ff0
loc_0bd5:
    movsx edx, word [0x1256d2]
    lea eax, [edx*4]
    sub eax, edx
    xor edx, edx
    db 0x89, 0x14, 0x45, 0x02, 0xfb, 0x0f, 0x00    ; mov dword [eax*2 + 0xffb02], edx
    xor edx, edx
    db 0x66, 0x89, 0x14, 0x45, 0x00, 0xfb, 0x0f, 0x00    ; mov word [eax*2 + 0xffb00], dx
    mov dx, word [ecx + 0x12]
    cmp dx, 0x19c
    jb short loc_0c22
    jbe short loc_0c3e
    cmp dx, 0x297
    jb near loc_0cfb
    jbe short loc_0c79
    cmp dx, 0x299
    jbe near loc_0c9a
    jmp near loc_0cfb
loc_0c22:
    cmp dx, 0xe6
    jb near loc_0cfb
    jbe near loc_0ccf
    cmp dx, 0x197
    jne near loc_0cfb
loc_0c3e:
    mov ah, byte [0x27e4c2]
    movsx edx, word [0x1256d2]
    or ah, 0x41
    mov si, word [0x1256d2]
    mov byte [0x27e4c2], ah
    lea eax, [edx*4]
    inc esi
    sub eax, edx
    mov word [0x1256d2], si
    db 0x66, 0x89, 0x1c, 0x45, 0x00, 0xfb, 0x0f, 0x00    ; mov word [eax*2 + 0xffb00], bx
    jmp near loc_0cfb
loc_0c79:
    cmp dword [0x243910], 0
    jne short loc_0c9a
    xor edx, edx
    jmp short loc_0c94
loc_0c86:
    mov eax, edx
    add eax, 0x297
    cwde
    inc edx
    call 0x4d1b0
loc_0c94:
    cmp dx, 3
    jl short loc_0c86
loc_0c9a:
    cmp byte [ecx + 0x14], 0x1f
    jle short loc_0ca8
    mov word [ecx + 0xe], 0
    jmp short loc_0cae
loc_0ca8:
    or word [ecx + 0xe], 0x155
loc_0cae:
    cmp word [ecx + 0x1a], 0
    je short loc_0ccf
    mov si, word [ecx + 0xa]
    test si, si
    jl short loc_0ccf
    movsx edx, si
    shl edx, 5
    mov ax, word [ecx + 0x1a]
    mov word [edx + 0x27e4ce], ax
loc_0ccf:
    movsx edx, word [0x1256d2]
    mov di, word [0x1256d2]
    lea eax, [edx*4]
    inc edi
    sub eax, edx
    mov word [0x1256d2], di
    db 0x66, 0x89, 0x1c, 0x45, 0x00, 0xfb, 0x0f, 0x00    ; mov word [eax*2 + 0xffb00], bx
    jmp near loc_0dd9
loc_0cfb:
    mov ax, word [ecx + 0x10]
    mov word [ecx + 0x1e], 0xffff
    cmp ax, 0x131
    jb near loc_0dd9
    jbe near loc_0dd9
    cmp ax, 0x512
    jb short loc_0d22
    jbe short loc_0d6b
    jmp near loc_0dd9
loc_0d22:
    cmp ax, 0x500
    jb short loc_0d35
    jbe short loc_0d6b
    cmp ax, 0x509
    je short loc_0d6b
    jmp near loc_0dd9
loc_0d35:
    cmp ax, 0x150
    jne near loc_0dd9
    xor edx, edx
    jmp short loc_0d63
loc_0d43:
    movsx esi, dx
    movsx eax, word [ecx + 0x10]
    add eax, esi
    cmp dword [eax*4 + 0x242eb4], 0
    jne short loc_0d62
    mov ax, word [ecx + 0x10]
    add eax, edx
    cwde
    call 0x4d1b0
loc_0d62:
    inc edx
loc_0d63:
    cmp dx, 3
    jl short loc_0d43
    jmp short loc_0dd9
loc_0d6b:
    mov ax, word [ecx + 0x10]
    mov word [ecx + 0x1e], ax
    movsx edx, word [0x1256d2]
    lea eax, [edx*4]
    sub eax, edx
    mov edi, 0xffffffff
    mov ebp, dword [0x125d4f]
    db 0x89, 0x3c, 0x45, 0x02, 0xfb, 0x0f, 0x00    ; mov dword [eax*2 + 0xffb02], edi
    test ebp, ebp
    je short loc_0daf
    cmp word [ecx + 0x10], 0x500
    jne short loc_0da9
    mov word [ecx + 0x10], 0x50d
    jmp short loc_0daf
loc_0da9:
    mov word [ecx + 0x10], 0x10c
loc_0daf:
    movsx edx, word [0x1256d2]
    lea eax, [edx*4]
    sub eax, edx
    db 0x66, 0x89, 0x1c, 0x45, 0x00, 0xfb, 0x0f, 0x00    ; mov word [eax*2 + 0xffb00], bx
    movsx edx, word [ecx + 0x10]
    db 0x89, 0x14, 0x45, 0x02, 0xfb, 0x0f, 0x00    ; mov dword [eax*2 + 0xffb02], edx
    inc word [0x1256d2]
loc_0dd9:
    inc ebx
loc_0dda:
    cmp bx, word [0x2d7c10]
    jl near loc_0b22
    mov esi, 0x230
    xor ebx, ebx
    jmp short loc_0e33
loc_0df0:
    movsx eax, bx
    db 0x0f, 0xbf, 0x14, 0x45, 0xb0, 0xa6, 0x08, 0x00    ; movsx edx, word [eax*2 + 0x8a6b0]
    lea eax, [edx*4]
    add eax, edx
    mov dx, word [eax*8 + 0x2c9cb4]
    mov cx, word [eax*8 + 0x2c9cb6]
    add ecx, edx
    jmp short loc_0e2d
loc_0e18:
    movsx eax, dx
    shl eax, 5
    mov word [eax + 0x27e4c4], si
    inc edx
    mov word [eax + 0x27e4c6], si
loc_0e2d:
    cmp dx, cx
    jl short loc_0e18
    inc ebx
loc_0e33:
    cmp bx, word [0x1256c2]
    jl short loc_0df0
    add esp, 0x84
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
    push ecx
    push esi
    push edi
    sub esp, 0xc
    mov byte [esp], al
    mov byte [esp + 4], dl
    mov byte [esp + 8], bl
    mov dx, word [0x9044]
    mov esi, 0xf1720
    test dx, dx
    jl short loc_0e89
loc_0e76:
    movsx eax, word [0x9044]
    imul eax, eax, 0xd
    cmp byte [eax + 0x123fd4], 0xc8
    jae short loc_0e76
loc_0e89:
    mov ebx, 0xffffffff
    xor dh, dh
    mov word [0x9044], bx
    call loc_1824
    mov byte [0x12623a], dh
    cmp dword [0x1261bf], 2
    je short loc_0ed1
    cmp word [0x125cfb], 0
    jl short loc_0ed1
    cmp dword [0x1261df], 1
    jle short loc_0ed1
    cmp dword [0x125d47], 1
    je short loc_0ed1
    mov eax, 1
    call 0x24ef0
loc_0ed1:
    cmp byte [esp + 4], 0
    jne near loc_0f78
    cmp byte [esp], 3
    jne near loc_0f78
    cmp dword [0x1261df], 2
    jge near loc_0f78
    cmp dword [0x125d4f], 0
    jne short loc_0f78
    mov eax, 0x1239c1
    call 0x57760
    call 0x6eb4d
    xor edx, edx
    mov ecx, dword [0x2d6bc4]
    mov ebx, dword [0x2d6bc8]
    xor eax, eax
    dec ecx
    dec ebx
    call 0x6e783
    xor eax, eax
    mov edx, 6
    call 0x73c55
    call 0x61a10
    mov eax, 0x30b8
    call 0x44e20
    xor eax, eax
    mov edx, 7
    call 0x73c55
    call 0x61a10
    mov eax, 0x30c4
    call 0x44e20
    mov edx, 9
    mov eax, 0x30d0
    call 0x44e20
    xor eax, eax
    call 0x73c55
    call 0x61a10
    call 0x91f54
loc_0f78:
    mov eax, 0x374
    xor edi, edi
    xor edx, edx
    mov dword [0x120da0], eax
    xor eax, eax
    mov word [0x125cfd], di
    mov al, byte [esp + 4]
    mov word [0x125cf5], di
    mov dword [0x1261e7], eax
    xor eax, eax
    mov dword [0x2d58c8], edx
    mov al, byte [esp]
    mov edx, 0xffffffff
    mov dword [0x1261eb], eax
    xor eax, eax
    mov word [0x125cfb], dx
    mov al, byte [esp + 8]
    mov word [0x9058], dx
    mov dword [0x1261e3], eax
    mov dword [esi], 0x300
    mov byte [esi + 0x3a2], 0
    cmp dword [0x125d43], 1
    je short loc_1011
    mov word [esi + 0x312], 0xc
    mov byte [esi + 0x3df], 1
    mov byte [esi + 0x3d3], 0
    mov word [esi + 0x2be], 0x7d00
    mov byte [esi + 0x3e5], 0
    mov word [esi + 0x314], dx
loc_1011:
    xor cl, cl
    mov byte [0x126235], cl
    cmp dword [0x1261df], 1
    jle short loc_105b
    cmp word [0x2f2924], 2
    jge short loc_1070
    xor eax, eax
    mov word [0x2f2920], ax
    jmp short loc_1044
loc_1036:
    mov edx, eax
    cwde
    inc edx
    db 0x66, 0x89, 0x14, 0x45, 0x18, 0x28, 0x2f, 0x00    ; mov word [eax*2 + 0x2f2818], dx
    mov eax, edx
loc_1044:
    db 0x66, 0x3d, 0x10, 0x00    ; cmp ax, 0x10
    jl short loc_1036
    mov eax, dword [0x1261df]
    db 0x66, 0xc7, 0x04, 0x45, 0x16, 0x28, 0x2f, 0x00, 0xff, 0xff    ; mov word [eax*2 + 0x2f2816], 0xffff
    jmp short loc_1070
loc_105b:
    xor ecx, ecx
    mov esi, 0xffffffff
    mov word [0x2f2920], cx
    mov word [0x2f2818], si
loc_1070:
    add esp, 0xc
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
loc_1084:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x75c
    mov byte [esp + 0x758], al
    push 0xa
    push 0
    push 0
    push 0
    movsx eax, word [0xf19b8]
    push eax
    push 0
    push 0
    mov ecx, dword [0xf193c]
    push 0
    mov ebx, dword [0xf1938]
    mov edx, dword [0xf1934]
    push 0x214
    movsx eax, word [0xf19be]
    call 0x192d0
    cmp dword [0x1261a7], 2
    je near loc_1229
    xor esi, esi
    jmp near loc_121f
loc_10e4:
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8a, 0x04, 0x45, 0xa0, 0x19, 0x0f, 0x00    ; mov al, byte [eax*2 + 0xf19a0]
    mov byte [esp + edx + 0x740], al
    cmp dword [0x1261df], 1
    jle near loc_121e
    cmp dword [0x125d47], 1
    jne near loc_121e
    cmp word [0x125cfb], 0
    jl near loc_121e
    xor edx, edx
    jmp short loc_1182
loc_1131:
    movsx ecx, si
    mov edi, ecx
    shl edi, 7
    sub edi, ecx
    lea edi, [edi*4]
    sub edi, ecx
    imul ecx, ecx, 0x74
    movsx eax, dx
    db 0x8d, 0x1c, 0x45, 0x00, 0x00, 0x00, 0x00    ; lea ebx, [eax*2]
    add edi, edi
    lea ebp, [edi + ebx]
    mov dword [esp + 0x750], ebp
    lea ebp, [ecx + ebx]
    mov ebx, dword [esp + 0x750]
    inc edx
    add edi, eax
    mov bx, word [ebx + 0xf19c6]
    add eax, ecx
    mov word [esp + ebp + 0x28], bx
    mov bl, byte [edi + 0xf1af3]
    mov byte [esp + eax + 0x4c], bl
loc_1182:
    cmp dx, 0x11
    jl short loc_1131
    movsx ecx, si
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    imul ebx, ecx, 0x74
    db 0x66, 0x8b, 0x14, 0x45, 0xac, 0x1a, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf1aac]
    mov word [esp + ebx + 0x24], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x32, 0x1a, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf1a32]
    mov word [esp + ebx + 0x26], dx
    db 0x8a, 0x14, 0x45, 0xe9, 0x1a, 0x0f, 0x00    ; mov dl, byte [eax*2 + 0xf1ae9]
    mov byte [esp + ebx + 0x5d], dl
    db 0x66, 0x8b, 0x14, 0x45, 0x5a, 0x1a, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf1a5a]
    mov word [esp + ebx + 0x60], dx
    db 0x66, 0x8b, 0x14, 0x45, 0xaa, 0x1a, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf1aaa]
    mov word [esp + ebx + 0x62], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x3c, 0x1a, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf1a3c]
    mov word [esp + ebx + 0x64], dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa8, 0x1a, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf1aa8]
    mov word [esp + ebx + 0x66], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x74, 0x1a, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf1a74]
    mov word [esp + ebx + 0x68], dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa6, 0x1a, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf1aa6]
    db 0x66, 0x8b, 0x04, 0x45, 0xbc, 0x1a, 0x0f, 0x00    ; mov ax, word [eax*2 + 0xf1abc]
    mov word [esp + ebx + 0x6a], dx
    mov word [esp + ebx + 0x6c], ax
loc_121e:
    inc esi
loc_121f:
    cmp si, 0x10
    jl near loc_10e4
loc_1229:
    xor eax, eax
    mov esi, 1
    call 0x4e140
    jmp short loc_1261
loc_1237:
    movsx ebx, si
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov edx, 0xf1720
    add eax, eax
    mov ebx, 0x3f6
    add eax, 0xf1720
    inc esi
    call 0x9ff74
loc_1261:
    cmp si, 0x10
    jl short loc_1237
    cmp dword [0x1261a7], 2
    je near loc_13c2
    xor esi, esi
    jmp near loc_13b8
loc_127b:
    movsx ebx, si
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    xor edx, edx
    sub eax, ebx
    mov dl, byte [esp + ebx + 0x740]
    mov edi, dword [0x1261df]
    db 0x89, 0x14, 0x45, 0xa0, 0x19, 0x0f, 0x00    ; mov dword [eax*2 + 0xf19a0], edx
    cmp edi, 1
    jle near loc_13b7
    cmp dword [0x125d47], 1
    jne near loc_13b7
    cmp word [0x125cfb], 0
    jl near loc_13b7
    xor edx, edx
    jmp short loc_131b
loc_12cc:
    movsx ecx, si
    imul edi, ecx, 0x74
    movsx ebx, dx
    db 0x8d, 0x2c, 0x5d, 0x00, 0x00, 0x00, 0x00    ; lea ebp, [ebx*2]
    lea eax, [edi + ebp]
    mov dword [esp + 0x750], eax
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    mov ecx, dword [esp + 0x750]
    add eax, eax
    mov cx, word [esp + ecx + 0x28]
    add edi, ebx
    mov word [eax + ebp + 0xf19c6], cx
    add eax, ebx
    mov bl, byte [esp + edi + 0x4c]
    inc edx
    mov byte [eax + 0xf1af3], bl
loc_131b:
    cmp dx, 0x11
    jl short loc_12cc
    movsx ecx, si
    imul ebx, ecx, 0x74
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    mov dx, word [esp + ebx + 0x24]
    db 0x66, 0x89, 0x14, 0x45, 0xac, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1aac], dx
    mov dx, word [esp + ebx + 0x26]
    db 0x66, 0x89, 0x14, 0x45, 0x32, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a32], dx
    mov dl, byte [esp + ebx + 0x5d]
    db 0x88, 0x14, 0x45, 0xe9, 0x1a, 0x0f, 0x00    ; mov byte [eax*2 + 0xf1ae9], dl
    mov dx, word [esp + ebx + 0x60]
    db 0x66, 0x89, 0x14, 0x45, 0x5a, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a5a], dx
    mov dx, word [esp + ebx + 0x62]
    db 0x66, 0x89, 0x14, 0x45, 0xaa, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1aaa], dx
    mov dx, word [esp + ebx + 0x64]
    db 0x66, 0x89, 0x14, 0x45, 0x3c, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a3c], dx
    mov dx, word [esp + ebx + 0x66]
    db 0x66, 0x89, 0x14, 0x45, 0xa8, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1aa8], dx
    mov dx, word [esp + ebx + 0x68]
    db 0x66, 0x89, 0x14, 0x45, 0x74, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a74], dx
    mov dx, word [esp + ebx + 0x6a]
    db 0x66, 0x89, 0x14, 0x45, 0xa6, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1aa6], dx
    mov dx, word [esp + ebx + 0x6c]
    db 0x66, 0x89, 0x14, 0x45, 0xbc, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1abc], dx
loc_13b7:
    inc esi
loc_13b8:
    cmp si, 0x10
    jl near loc_127b
loc_13c2:
    mov ecx, 9
    mov dx, word [0x2f2920]
    xor ah, ah
    mov si, word [0x2d6be6]
    mov byte [0x12623b], ah
    mov word [0x97b8], cx
loc_13e4:
    test si, si
    jl near loc_1623
    movsx eax, si
    db 0x66, 0x8b, 0x1c, 0x45, 0xb4, 0x0e, 0x24, 0x00    ; mov bx, word [eax*2 + 0x240eb4]
    imul eax, eax, 0x2c
    mov dword [esp + 0x754], ebx
    mov ebx, 0x2522b4
    mov cl, byte [0x12623b]
    add ebx, eax
    cmp cl, 0x10
    jne short loc_141e
    mov eax, 0x30dc
    call 0x15ff0
loc_141e:
    xor eax, eax
    mov al, byte [0x12623b]
    shl eax, 4
    mov ecx, dword [ebx]
    mov dword [eax + 0xf1620], ecx
    mov ecx, dword [ebx + 4]
    mov dword [eax + 0xf1624], ecx
    mov ecx, dword [ebx + 8]
    mov dword [eax + 0xf1628], ecx
    mov cx, word [ebx + 0x1c]
    mov word [eax + 0xf162c], cx
    mov cx, word [ebx + 0x18]
    mov word [eax + 0xf162e], cx
    inc byte [0x12623b]
    test dx, dx
    jl near loc_160f
    mov byte [ebx + 0x10], 0
    mov byte [ebx + 0x14], 0x2a
    mov byte [ebx + 0x15], 0x24
    mov word [ebx + 0xc], 0x101
    mov byte [ebx + 0x16], 0
    mov byte [ebx + 0x12], 0x40
    mov al, byte [esp + 0x758]
    mov word [ebx + 0x1e], si
    test al, 8
    je short loc_14b1
    movsx ecx, dx
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    add eax, eax
    mov di, word [eax + 0xf19c2]
    test di, di
    jne short loc_14da
loc_14b1:
    movsx ecx, dx
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    lea ecx, [eax + eax]
    mov ax, word [0x123a44]
    mov word [ecx + 0xf19c2], ax
    mov word [ebx + 0x2a], ax
    jmp short loc_14de
loc_14da:
    mov word [ebx + 0x2a], di
loc_14de:
    mov ah, byte [ebx + 0x11]
    mov word [ebx + 0x22], dx
    test ah, ah
    jne short loc_152a
    movsx ecx, dx
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    mov cl, byte [0x97b8]
    db 0x88, 0x0c, 0x45, 0x0c, 0x1b, 0x0f, 0x00    ; mov byte [eax*2 + 0xf1b0c], cl
    mov byte [ebx + 0x11], cl
    mov ax, word [0x97b8]
    inc eax
    mov word [0x97b8], ax
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jl short loc_1549
    mov word [0x97b8], 9
    jmp short loc_1549
loc_152a:
    movsx ecx, dx
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    lea ecx, [eax + eax]
    mov al, byte [ebx + 0x11]
    mov byte [ecx + 0xf1b0c], al
loc_1549:
    movsx ebp, dx
    mov eax, ebp
    shl eax, 7
    movsx edi, si
    sub eax, ebp
    lea ecx, [edi*8]
    lea eax, [eax*4]
    add ecx, edi
    sub eax, ebp
    lea ecx, [ecx*8]
    add eax, eax
    sub ecx, edi
    mov word [eax + 0xf1a60], si
    mov word [ecx + 0x8b0bf], si
    mov word [eax + 0xf1ab4], dx
    mov edx, dword [ebx]
    mov dword [eax + 0xf1934], edx
    mov dword [eax + 0xf1958], edx
    mov dword [eax + 0xf1950], edx
    mov dword [ecx + 0x8b0db], edx
    mov edx, dword [ebx + 4]
    mov dword [eax + 0xf1938], edx
    mov dword [eax + 0xf195c], edx
    mov dword [eax + 0xf1954], edx
    mov dword [ecx + 0x8b0df], edx
    mov edx, dword [ebx + 8]
    mov dword [eax + 0xf193c], edx
    mov dword [eax + 0xf1960], edx
    mov dword [ecx + 0x8b0e3], edx
    mov dx, word [ebx + 0x1c]
    mov word [eax + 0xf19b8], dx
    mov word [eax + 0xf19ba], dx
    add eax, 0xf1720
    lea ecx, [eax + 0x29e]
    mov edx, dword [ebx + 4]
    mov eax, dword [ebx]
    mov ebx, ecx
    call 0x6be57
    db 0x66, 0x8b, 0x14, 0x6d, 0x18, 0x28, 0x2f, 0x00    ; mov dx, word [ebp*2 + 0x2f2818]
    mov esi, dword [esp + 0x754]
    jmp near loc_13e4
loc_160f:
    movsx eax, si
    call 0x67ff5
    mov esi, dword [esp + 0x754]
    jmp near loc_13e4
loc_1623:
    add esp, 0x75c
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
loc_1634:
    push ebx
    push ecx
    push edx
    push edi
    xor edx, edx
    jmp short loc_1662
loc_163c:
    movsx ebx, dx
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    xor ebx, ebx
    db 0x66, 0x89, 0x1c, 0x45, 0xec, 0x19, 0x0f, 0x00    ; mov word [eax*2 + 0xf19ec], bx
    inc edx
    db 0x66, 0x89, 0x1c, 0x45, 0xea, 0x19, 0x0f, 0x00    ; mov word [eax*2 + 0xf19ea], bx
loc_1662:
    cmp dx, 0x10
    jl short loc_163c
    mov ecx, 0x200
    mov edi, 0x88c80
    xor eax, eax
    cmp ecx, 4
    jae short loc_1686
    test cl, 1
    je short loc_167f
    db 0xaa    ; stosb byte es:[edi], al
loc_167f:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_16b1
loc_1686:
    test edi, 1
    je short loc_1690
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_1690:
    test edi, 2
    je short loc_169d
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_169d:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_16ab
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_16ab:
    test bl, 1
    je short loc_16b1
    db 0xaa    ; stosb byte es:[edi], al
loc_16b1:
    pop edi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8b, 0xc0    ; mov eax, eax
loc_16c4:
    push edx
    xor edx, edx
    mov dword [0x12140c], edx
    mov dword [0x121b18], edx
    mov dword [0x121404], edx
    mov dword [0x121408], edx
    mov dword [0x2d6bbc], edx
    mov ah, 1
    mov dword [0x8dcc], edx
    mov dword [0x121eac], edx
    mov dword [0x121ec8], edx
    mov byte [0x12623a], ah
    pop edx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 8
    mov eax, 0x3100
    xor edx, edx
    call 0x77cee
    mov esi, eax
    cmp eax, -1
    je short loc_172f
    mov ebx, 1
    lea edx, [esp + 4]
    call 0x77e20
    jmp short loc_1739
loc_172f:
    mov eax, 0x310c
    call 0x15ff0
loc_1739:
    xor edi, edi
    jmp short loc_1774
loc_173d:
    mov ebx, 1
    mov edx, esp
    mov eax, esi
    call 0x77e20
    mov ebx, 0x100
    mov edx, 0xf88c0
    mov eax, esi
    xor ecx, ecx
    call 0x77e20
    push 1
    movsx eax, byte [esp + 4]
    mov edx, 0xf88c0
    push 0
    xor ebx, ebx
    inc edi
    call 0x70d6c
loc_1774:
    xor eax, eax
    mov al, byte [esp + 4]
    cmp edi, eax
    jl short loc_173d
    mov ebx, 0x300
    mov edx, 0x2cad8
    mov eax, esi
    call 0x77e20
    mov ebx, 0x300
    mov edx, 0x2d9d8
    mov eax, esi
    call 0x77e20
    mov ebx, 0x300
    mov edx, 0x2bed8
    mov eax, esi
    call 0x77e20
    mov ebx, 0x300
    mov edx, 0x2cdd8
    mov eax, esi
    call 0x77e20
    mov ebx, 0x300
    mov edx, 0x2d0d8
    mov eax, esi
    call 0x77e20
    xor ah, ah
    mov byte [0x2522b3], ah
    mov byte [0x2522b2], ah
    mov byte [0x2522b1], ah
    mov byte [0x2dcd7], ah
    mov byte [0x2dcd6], ah
    mov byte [0x2dcd5], ah
    mov byte [0x2cdd7], ah
    mov byte [0x2cdd6], ah
    mov byte [0x2cdd5], ah
    mov eax, esi
    call 0x77fe5
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
loc_1824:
    push ebx
    push ecx
    push edx
    cmp word [0x2f2924], 2
    jl near loc_18b8
    mov ah, 0xfa
    movsx ecx, word [0x2f2920]
    mov byte [0xf8680], ah
    jmp short loc_186a
loc_1846:
    movsx eax, word [0x2f2926]
    cmp ecx, eax
    je short loc_1862
    mov ebx, 1
    mov edx, 0xf8680
    mov eax, ecx
    call 0x78cae
loc_1862:
    db 0x0f, 0xbf, 0x0c, 0x4d, 0x18, 0x28, 0x2f, 0x00    ; movsx ecx, word [ecx*2 + 0x2f2818]
loc_186a:
    test ecx, ecx
    jge short loc_1846
    movsx eax, word [0x2f2926]
    inc byte [eax + 0xe79b8]
loc_187b:
    call 0x10800
    movsx ecx, word [0x2f2920]
    movsx eax, word [0x2f2926]
    test ecx, ecx
    jge short loc_189a
    test ecx, ecx
    jge short loc_187b
    pop edx
    pop ecx
    pop ebx
    ret
loc_189a:
    mov dl, byte [ecx + 0xe79b8]
    cmp dl, byte [eax + 0xe79b8]
    jb short loc_18b4
    db 0x0f, 0xbf, 0x0c, 0x4d, 0x18, 0x28, 0x2f, 0x00    ; movsx ecx, word [ecx*2 + 0x2f2818]
    test ecx, ecx
    jge short loc_189a
loc_18b4:
    test ecx, ecx
    jge short loc_187b
loc_18b8:
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
loc_18c4:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov edi, dword [0x2d6bbc]
    movsx esi, word [0x2f2926]
    mov ecx, esi
    shl ecx, 7
    sub ecx, esi
    lea ecx, [ecx*4]
    mov edx, 0x251fb4
    sub ecx, esi
    add edi, 0x190
    xor esi, esi
    db 0x89, 0x14, 0x4d, 0x05, 0x1b, 0x0f, 0x00    ; mov dword [ecx*2 + 0xf1b05], edx
    jmp short loc_190d
loc_18fd:
    mov ecx, esi
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call 0x43a50
    add esi, 7
loc_190d:
    cmp esi, 0x3f
    jl short loc_18fd
    xor ebx, ebx
    mov ebp, dword [0x125d4b]
    mov dword [0x125d4b], ebx
    call 0x4dd90
    xor eax, eax
    call 0x73c55
loc_192c:
    cmp edi, dword [0x2d6bbc]
    jle short loc_199c
    call 0x4dd90
    xor eax, eax
    call 0x73c55
    mov ecx, dword [0x2d6bc4]
    dec ecx
    push ecx
    mov ecx, dword [0x2d6bc8]
    dec ecx
    push ecx
    push 0
    push 0
    push 0xa
    push 0
    mov ecx, dword [0x2d6bbc]
    mov ebx, 0x10000
    push 0
    mov edx, 0x640000
    mov eax, 0xa00000
    push 0xee5
    shl ecx, 4
    call 0x6eb5e
    push 0x3134
    mov edx, 0xb9
    mov eax, 0x118
    xor ecx, ecx
    xor ebx, ebx
    inc edi
    call 0x3eca0
    call 0x61a10
    jmp short loc_192c
loc_199c:
    call 0x4dd90
    xor eax, eax
    mov esi, 0x3f
    call 0x73c55
    call 0x61a10
    jmp short loc_19c4
loc_19b4:
    mov ecx, esi
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call 0x43a50
    sub esi, 7
loc_19c4:
    test esi, esi
    jg short loc_19b4
    call 0x9c43c
    mov dword [0x125d4b], ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
loc_19e4:
    push ebx
    push ecx
    push edx
    push edi
    mov ecx, 1
    mov edi, 0x84a00
    xor edx, edx
    xor ah, ah
    mov dword [0x120d10], edx
    mov dword [0x120d24], edx
    mov byte [0x126227], ah
    mov dword [0x8dc8], ecx
    mov dword [0x120da4], edx
    mov dword [0x123c2c], edx
    mov dword [0x121b1c], edx
    mov dword [0x121ea4], edx
    mov dword [0x121ebc], edx
    mov dword [0x121eb8], edx
    mov dword [0x121eb0], edx
    mov dword [0x121eb4], edx
    mov dword [0x120d00], edx
    mov ecx, 0x40
    xor eax, eax
    mov dword [0x120d04], edx
    cmp ecx, 4
    jae short loc_1a63
    test cl, 1
    je short loc_1a5c
    db 0xaa    ; stosb byte es:[edi], al
loc_1a5c:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_1a8e
loc_1a63:
    test edi, 1
    je short loc_1a6d
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_1a6d:
    test edi, 2
    je short loc_1a7a
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_1a7a:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_1a88
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_1a88:
    test bl, 1
    je short loc_1a8e
    db 0xaa    ; stosb byte es:[edi], al
loc_1a8e:
    mov ecx, 0xa
    mov edi, 0x123fc4
    xor eax, eax
    cmp ecx, 4
    jae short loc_1aac
    test cl, 1
    je short loc_1aa5
    db 0xaa    ; stosb byte es:[edi], al
loc_1aa5:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_1ad7
loc_1aac:
    test edi, 1
    je short loc_1ab6
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_1ab6:
    test edi, 2
    je short loc_1ac3
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_1ac3:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_1ad1
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_1ad1:
    test bl, 1
    je short loc_1ad7
    db 0xaa    ; stosb byte es:[edi], al
loc_1ad7:
    mov ecx, 0xa0
    mov edi, 0x11cc60
    xor eax, eax
    cmp ecx, 4
    jae short loc_1af5
    test cl, 1
    je short loc_1aee
    db 0xaa    ; stosb byte es:[edi], al
loc_1aee:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_1b20
loc_1af5:
    test edi, 1
    je short loc_1aff
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_1aff:
    test edi, 2
    je short loc_1b0c
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_1b0c:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_1b1a
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_1b1a:
    test bl, 1
    je short loc_1b20
    db 0xaa    ; stosb byte es:[edi], al
loc_1b20:
    mov ecx, 0xa000
    mov edi, 0x100700
    xor eax, eax
    cmp ecx, 4
    jae short loc_1b3e
    test cl, 1
    je short loc_1b37
    db 0xaa    ; stosb byte es:[edi], al
loc_1b37:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_1b69
loc_1b3e:
    test edi, 1
    je short loc_1b48
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_1b48:
    test edi, 2
    je short loc_1b55
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_1b55:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_1b63
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_1b63:
    test bl, 1
    je short loc_1b69
    db 0xaa    ; stosb byte es:[edi], al
loc_1b69:
    mov ecx, 0x10
    mov edi, 0xd21b8
    xor eax, eax
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    mov ecx, 0x10
    mov edi, 0x87a40
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    mov ecx, 0x10
    mov edi, 0x84a00
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    pop edi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1b94:
    push edx
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x14, 0x45, 0x34, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf1934]
    mov dword [0x120dc4], edx
    mov dword [0x120dbc], edx
    db 0x8b, 0x14, 0x45, 0x38, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf1938]
    mov dword [0x120dc8], edx
    mov dword [0x120db8], edx
    db 0x8b, 0x14, 0x45, 0x3c, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf193c]
    mov dword [0x120dc0], edx
    mov dword [0x120db4], edx
    xor edx, edx
    mov dword [0x120da8], edx
    mov dword [0x120dac], edx
    mov dword [0x120db0], edx
    db 0x66, 0x8b, 0x14, 0x45, 0xb8, 0x19, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf19b8]
    mov word [0x1256b2], dx
    mov word [0x1256ba], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x40, 0x19, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf1940]
    mov word [0x1256b6], dx
    mov word [0x1256b4], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x38, 0x1a, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf1a38]
    mov word [0x1256bc], dx
    mov word [0x1256b8], dx
    db 0x66, 0x8b, 0x14, 0x45, 0xbe, 0x19, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf19be]
    mov word [0x1256ae], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x44, 0x1a, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf1a44]
    mov word [0x1256b0], dx
    db 0x8a, 0x14, 0x45, 0xc6, 0x1a, 0x0f, 0x00    ; mov dl, byte [eax*2 + 0xf1ac6]
    mov byte [0x126230], dl
    db 0x8a, 0x14, 0x45, 0xc8, 0x1a, 0x0f, 0x00    ; mov dl, byte [eax*2 + 0xf1ac8]
    mov byte [0x126231], dl
    db 0x8a, 0x14, 0x45, 0x0d, 0x1b, 0x0f, 0x00    ; mov dl, byte [eax*2 + 0xf1b0d]
    db 0x8a, 0x04, 0x45, 0x15, 0x1b, 0x0f, 0x00    ; mov al, byte [eax*2 + 0xf1b15]
    mov byte [0x12622e], dl
    mov byte [0x12622c], al
    pop edx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x104
    mov byte [esp + 0x100], al
    test al, 2
    jne short loc_1cb4
    mov eax, dword [0x1261bf]
    mov dword [0x1261a7], eax
loc_1cb4:
    mov eax, dword [0x1261b7]
    mov dword [0x12619b], eax
    mov eax, dword [0x1261b3]
    mov dword [0x12619f], eax
    mov eax, dword [0x1261bb]
    mov dword [0x1261a3], eax
    mov eax, dword [0x1261c3]
    mov dword [0x1261ab], eax
    mov eax, dword [0x125d43]
    mov dword [0x125d47], eax
    mov eax, dword [0x1261ef]
    mov dword [0x1261f3], eax
    mov eax, dword [0x1261cb]
    mov dl, byte [esp + 0x100]
    mov dword [0x1261cf], eax
    test dl, 2
    jne short loc_1d17
    cmp dword [0x1261a7], 2
    jne short loc_1d17
    xor ebx, ebx
    mov dword [0x1261a7], ebx
loc_1d17:
    call 0x91f54
    call 0x58740
    xor eax, eax
    call 0x91ca4
    xor esi, esi
    mov cx, word [0x125d4b]
    mov dword [0x125d4b], esi
    call loc_18c4
    call 0x4dd90
    movsx eax, cx
    mov edi, dword [0x1261eb]
    mov dword [0x125d4b], eax
    imul eax, edi, 0xb
    add eax, dword [0x1261e7]
    shl eax, 7
    add eax, 0x88f80
    call 0x9fcb0
    mov ebx, dword [0x1261eb]
    mov edx, eax
    imul eax, ebx, 0xb
    mov ecx, dword [0x1261e7]
    mov esi, 0x88f80
    add eax, ecx
    mov edi, esp
    shl eax, 7
    mov ecx, edx
    add esi, eax
    cmp ecx, 4
    jae short loc_1d98
    test cl, 1
    je short loc_1d91
    db 0xa4    ; movsb byte es:[edi], byte [esi]
loc_1d91:
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw word es:[edi], word [esi]
    jmp short loc_1dc3
loc_1d98:
    test edi, 1
    je short loc_1da2
    db 0xa4    ; movsb byte es:[edi], byte [esi]
    dec ecx
loc_1da2:
    test edi, 2
    je short loc_1daf
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
    sub ecx, 2
loc_1daf:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    test bl, 2
    je short loc_1dbd
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
loc_1dbd:
    test bl, 1
    je short loc_1dc3
    db 0xa4    ; movsb byte es:[edi], byte [esi]
loc_1dc3:
    mov bl, 0xff
    push 0xf19be
    mov ecx, 0xf193c
    mov byte [esp + edx + 4], bl
    xor bh, bh
    push 0xf19b8
    mov byte [esp + edx + 9], bh
    mov ebx, 0xf1938
    mov edx, 0xf1934
    mov eax, dword [0x2e9ac]
    call 0x60771
    cmp eax, -1
    jne short loc_1e2e
    imul eax, dword [0x1261eb], 0xb
    add eax, dword [0x1261e7]
    shl eax, 7
    add eax, 0x88f80
    push eax
    push 0x313c
    push 0xf88c0
    call 0x9fc79
    add esp, 0xc
    call 0xa0da4
    mov eax, 0xf88c0
    call 0x15ff0
loc_1e2e:
    mov ecx, 0x300
    mov edi, 0x240bb4
    xor edx, edx
    xor eax, eax
    mov dl, byte [esp + 0x100]
    cmp ecx, 4
    jae short loc_1e55
    test cl, 1
    je short loc_1e4e
    db 0xaa    ; stosb byte es:[edi], al
loc_1e4e:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_1e80
loc_1e55:
    test edi, 1
    je short loc_1e5f
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_1e5f:
    test edi, 2
    je short loc_1e6c
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_1e6c:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_1e7a
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_1e7a:
    test bl, 1
    je short loc_1e80
    db 0xaa    ; stosb byte es:[edi], al
loc_1e80:
    mov eax, edx
    call loc_0494
    call 0x558a0
    mov eax, edx
    xor cl, cl
    call loc_1084
    mov byte [0xa46f], cl
    mov byte [0x2d7c9d], cl
    call 0x4daf0
    mov eax, 0x3150
    call 0x57760
    test dl, 4
    jne short loc_1ee9
    test dl, 8
    jne short loc_1ee9
    test dl, 0x20
    je short loc_1f08
    cmp dword [0x1261a7], 2
    jne short loc_1ee9
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x02    ; mov byte [eax*2 + 0xf1ac2], 2
    jmp short loc_1f08
loc_1ee9:
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x04    ; mov byte [eax*2 + 0xf1ac2], 4
loc_1f08:
    cmp dword [0x1261a7], 1
    jne short loc_1f20
    test byte [esp + 0x100], 0x20
    jne short loc_1f20
    call 0x22a50
loc_1f20:
    mov cx, word [0x2f2920]
    jmp near loc_1fc7
loc_1f2c:
    movsx edx, cx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf1a60]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x2522cc]
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + 0x2c9ccc]
    cmp ax, 0x35b
    jb short loc_1f72
    jbe short loc_1f78
    cmp ax, 0x43a
    je short loc_1f78
    jmp short loc_1fbc
loc_1f72:
    cmp ax, 0xc8
    jne short loc_1fbc
loc_1f78:
    movsx edx, cx
    mov eax, edx
    call loc_0004
    mov eax, edx
    call loc_01b4
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ebx, ebx
    db 0x66, 0x89, 0x1c, 0x45, 0xd8, 0x19, 0x0f, 0x00    ; mov word [eax*2 + 0xf19d8], bx
    db 0x66, 0x89, 0x1c, 0x45, 0x32, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a32], bx
    xor dl, dl
    db 0x66, 0x89, 0x1c, 0x45, 0x54, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a54], bx
    db 0x88, 0x14, 0x45, 0xfc, 0x1a, 0x0f, 0x00    ; mov byte [eax*2 + 0xf1afc], dl
loc_1fbc:
    movsx eax, cx
    db 0x66, 0x8b, 0x0c, 0x45, 0x18, 0x28, 0x2f, 0x00    ; mov cx, word [eax*2 + 0x2f2818]
loc_1fc7:
    test cx, cx
    jge near loc_1f2c
    call loc_1b94
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    xor ecx, ecx
    sub eax, edx
    mov edx, 0x251fb4
    xor ebx, ebx
    db 0x89, 0x14, 0x45, 0x05, 0x1b, 0x0f, 0x00    ; mov dword [eax*2 + 0xf1b05], edx
    xor edx, edx
    xor eax, eax
    call 0x43a50
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    xor ch, ch
    add eax, 0xf1720
    xor edx, edx
    call 0x45230
    call 0x6eb4d
    mov ax, word [0x1261e7]
    mov byte [0x126229], ch
    inc eax
    mov word [0x1256ca], dx
    mov word [0x125cfb], ax
    call loc_19e4
    mov cx, word [0x8dd4]
    dec ecx
    jmp short loc_206e
loc_205a:
    movsx eax, cx
    mov edx, dword [eax*4 + 0x84a40]
    mov edx, dword [edx]
    dec ecx
    mov dword [eax*4 + 0x74700], edx
loc_206e:
    test cx, cx
    jge short loc_205a
    mov dh, 1
    xor ecx, ecx
    xor ebx, ebx
    mov byte [0x2e9c7], dh
    call 0x792ec
    call loc_1824
    xor edx, edx
    xor eax, eax
    mov edi, 0xd39f8
    call 0x43a50
    call 0x4dd90
    xor eax, eax
    mov edx, 0x10000
    call 0x73c55
    call 0x18220
    movsx eax, word [0x2f2926]
    mov ecx, 0x10
    call 0x18710
    mov eax, 0x1010101
    cmp ecx, 4
    jae short loc_20d5
    test cl, 1
    je short loc_20ce
    db 0xaa    ; stosb byte es:[edi], al
loc_20ce:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_2100
loc_20d5:
    test edi, 1
    je short loc_20df
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_20df:
    test edi, 2
    je short loc_20ec
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_20ec:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_20fa
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_20fa:
    test bl, 1
    je short loc_2100
    db 0xaa    ; stosb byte es:[edi], al
loc_2100:
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor edx, edx
    db 0x66, 0x89, 0x14, 0x45, 0x64, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a64], dx
    call loc_1634
    call loc_16c4
    add esp, 0x104
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add byte [eax], al
    add byte [eax], al
    add byte [eax], al
    add byte [eax], al
    add byte [eax], al
    add byte [eax], al
    add byte [ebx + 0x51], dl
    push esi
    push edi
    cmp byte [0x17af68], 0
    je short loc_2163
    xor bh, bh
    mov eax, 0xffffffff
    mov byte [0x17af68], bh
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2163:
    cwde
    db 0x66, 0x8b, 0x1c, 0x45, 0xd4, 0x73, 0x2d, 0x00    ; mov bx, word [eax*2 + 0x2d73d4]
loc_216c:
    test bx, bx
    jl near loc_230c
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 5
    jne near loc_22fc
    cmp word [eax + 0x2522da], 0x3e8
    jge near loc_22fc
    movsx eax, dx
    cmp eax, -1
    jne short loc_21a2
    mov edx, ebx
loc_21a2:
    movsx esi, bx
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    imul ecx, esi, 0x2c
    cmp dword [eax + 0x8b0e7], 0
    jne near loc_2270
    movsx eax, word [ecx + 0x2522da]
    test byte [eax + 0x123c40], 0x10
    jne near loc_22ea
    mov si, word [ecx + 0x2522da]
    test si, si
    je short loc_2218
    xor eax, eax
    movsx edx, dx
    mov ax, si
    call 0x58160
    mov di, word [ecx + 0x2522dc]
    test di, di
    je short loc_2218
    cmp di, word [ecx + 0x2522da]
    je short loc_2218
    cmp di, 0x1c2
    jge short loc_2218
    movsx eax, di
    call 0x581a0
loc_2218:
    movsx ecx, bx
    imul eax, ecx, 0x2c
    movsx edx, word [eax + 0x2522cc]
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + 0x2c9cd6]
    xor ah, ah
    db 0x66, 0x3d, 0x16, 0x00    ; cmp ax, 0x16
    je near loc_22ea
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov dword [eax + 0x8b0e7], 1
    movsx eax, bx
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x2522da]
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2270:
    mov di, word [ecx + 0x2522dc]
    cmp di, 0x1c2
    jge short loc_22ea
    test di, di
    je short loc_2290
    xor eax, eax
    movsx edx, dx
    mov ax, di
    call 0x58160
loc_2290:
    movsx eax, bx
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x2522da]
    test byte [edx + 0x123c40], 1
    jne short loc_22bb
    mov dx, word [eax + 0x2522dc]
    test dx, dx
    je short loc_22cd
    cmp dx, word [eax + 0x2522da]
    je short loc_22cd
loc_22bb:
    movsx eax, bx
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x2522da]
    call 0x581a0
loc_22cd:
    movsx ecx, bx
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    xor edi, edi
    mov dword [eax + 0x8b0e7], edi
loc_22ea:
    movsx eax, bx
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x2522da]
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_22fc:
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xb4, 0xdf, 0x24, 0x00    ; mov bx, word [eax*2 + 0x24dfb4]
    jmp near loc_216c
loc_230c:
    mov eax, 0xffffffff
    pop edi
    pop esi
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
    mov edi, eax
    mov si, word [0x2d6be2]
loc_2332:
    test si, si
    jl near loc_244b
    movsx ecx, si
    imul ecx, ecx, 0x2c
    cmp di, word [ecx + 0x2522da]
    jne near loc_243b
    mov ax, word [0x121ec4]
    add ecx, 0x2522b4
loc_235a:
    dec eax
    test ax, ax
    jge short loc_23b0
    mov ax, word [0x2d6bd8]
loc_2366:
    test ax, ax
    jl near loc_243b
    movsx edx, ax
    imul edx, edx, 0x2c
    mov bx, word [ecx + 0x18]
    cmp bx, word [edx + 0x2522cc]
    jne near loc_242b
    mov dx, word [edx + 0x2522da]
    cmp dx, 0x14
    jb short loc_23cb
    jbe near loc_2400
    cmp dx, 0x1e
    jb near loc_242b
    jbe short loc_23db
    cmp dx, 0x20
    jbe short loc_2400
    jmp near loc_242b
loc_23b0:
    movsx edx, ax
    mov bx, word [ecx + 0x18]
    db 0x66, 0x3b, 0x1c, 0x55, 0x30, 0xa6, 0x08, 0x00    ; cmp bx, word [edx*2 + 0x8a630]
    jne short loc_235a
    mov edx, 1
    jmp near loc_244d
loc_23cb:
    cmp dx, 0xb
    jb short loc_242b
    jbe short loc_23db
    cmp dx, 0x12
    je short loc_2400
    jmp short loc_242b
loc_23db:
    movsx ebx, ax
    lea edx, [ebx*8]
    add edx, ebx
    lea edx, [edx*8]
    sub edx, ebx
    cmp dword [edx + 0x8b0f7], 0
    je short loc_242b
    mov edx, 1
    jmp short loc_244d
loc_2400:
    movsx ebx, ax
    lea edx, [ebx*8]
    add edx, ebx
    lea edx, [edx*8]
    sub edx, ebx
    cmp dword [edx + 0x8b0e7], 0
    je short loc_242b
    mov edx, 1
    mov eax, edx
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_242b:
    movsx edx, ax
    db 0x66, 0x8b, 0x04, 0x55, 0xb4, 0x0e, 0x24, 0x00    ; mov ax, word [edx*2 + 0x240eb4]
    jmp near loc_2366
loc_243b:
    movsx esi, si
    db 0x66, 0x8b, 0x34, 0x75, 0xb4, 0x0e, 0x24, 0x00    ; mov si, word [esi*2 + 0x240eb4]
    jmp near loc_2332
loc_244b:
    xor edx, edx
loc_244d:
    mov eax, edx
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    cmp ax, 0x30d
    jb short loc_24a6
    jbe near loc_24cf
    cmp ax, 0x491
    jb short loc_2495
    jbe near loc_24cf
    cmp ax, 0x49a
    jb near loc_24d2
    cmp ax, 0x49b
    jbe short loc_24cf
    cmp ax, 0x1127
    je short loc_24cf
    xor al, al
    ret
loc_2495:
    cmp ax, 0x44e
    jb short loc_24d2
    jbe short loc_24cf
    cmp ax, 0x478
    je short loc_24cf
    xor al, al
    ret
loc_24a6:
    cmp ax, 0x18b
    jb short loc_24c3
    jbe short loc_24cf
    cmp ax, 0x1bf
    jb short loc_24d2
    cmp ax, 0x1c1
    jbe short loc_24cf
    cmp ax, 0x2cd
    je short loc_24cf
    xor al, al
    ret
loc_24c3:
    cmp ax, 0x96
    jb short loc_24d2
    cmp ax, 0x9f
    ja short loc_24d2
loc_24cf:
    mov al, 1
    ret
loc_24d2:
    xor al, al
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
%else
loc_0000:
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
    call 0x50c10
    add edx, edx
    xor ah, ah
    add edx, 0xb4f00
    mov byte [0xe8d81], ah
    mov byte [0xe8d80], ah
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
    cmp dword [0xe97df], 1
    jle short loc_01d2
    cmp dword [0xe9347], 1
    je short loc_01d2
    mov word [edx + 0x336], 7
    jmp short loc_01db
loc_01d2:
    mov word [edx + 0x336], 0
loc_01db:
    mov bh, 1
    mov word [edx + 0x346], 0
    mov byte [0xe982f], bh
    mov byte [edx + 0x3a3], 0
    mov byte [edx + 0x3cc], 0
    mov bx, word [edx + 0x38a]
    mov dword [edx + 0x3e5], 0x1c08a4
    cmp bx, 0x190
    jge short loc_0222
    mov word [edx + 0x38a], 0
    mov byte [edx + 0x3c9], 0
loc_0222:
    mov byte [edx + 0x3d0], 0
    mov byte [edx + 0x3cb], 0
    mov word [edx + 0x38e], 0xffff
    mov ax, word [0xe97e7]
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
    mov dword [0xe7234], esi
    mov dword [0xe7230], esi
    mov word [edx + 0x33c], 0xffff
    mov word [edx + 0x34a], 0
    mov word [edx + 0x34c], 0
    mov cx, word [edx + 0x312]
    mov word [edx + 0x33e], 0xffff
    cmp cx, 6
    jne short loc_02de
    mov word [edx + 0x334], 5
    jmp short loc_02e7
loc_02de:
    mov word [edx + 0x334], 0
loc_02e7:
    mov word [edx + 0x392], 6
    mov byte [edx + 0x3eb], 0
    mov word [edx + 0x338], 0
    mov byte [edx + 0x3ea], 0
    mov word [edx + 0x348], 0
    mov word [edx + 0x328], 0
    mov eax, edx
    mov byte [edx + 0x3cb], 0
    call 0x47d00
    xor eax, eax
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jl short loc_0334
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0334:
    mov ebx, eax
    dec ebx
    cmp bx, 4
    ja short loc_0385
    and ebx, 0xffff
    jmp dword cs:[ebx*4 + 0x40ddc]
    movsx ebx, ax
    mov word [edx + ebx*2 + 0x2ce], 0xc
    jmp short loc_0385
    movsx ebx, ax
    mov word [edx + ebx*2 + 0x2ce], 0x28
    jmp short loc_0385
    movsx ebx, ax
    mov word [edx + ebx*2 + 0x2ce], 0x4b
    jmp short loc_0385
    movsx ebx, ax
    mov word [edx + ebx*2 + 0x2ce], 0x64
loc_0385:
    movsx ebx, ax
    inc eax
    mov word [edx + ebx*2 + 0x2f0], 0
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jl short loc_0334
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
loc_03a0:
    push ebx
    push edx
    movsx ebx, ax
    mov edx, ebx
    shl edx, 7
    sub edx, ebx
    lea edx, [edx*4]
    sub edx, ebx
    add edx, edx
    mov eax, 6
    add edx, 0xb4f00
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jl short loc_03cf
    mov eax, 6
    jmp short loc_03f6
loc_03cf:
    movsx ebx, ax
    inc eax
    mov byte [edx + ebx + 0x3d3], 0
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jl short loc_03cf
    mov eax, 6
    jmp short loc_03f6
loc_03e8:
    movsx ebx, ax
    inc eax
    mov word [edx + ebx*2 + 0x2a6], 0
loc_03f6:
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jl short loc_03e8
    mov word [edx + 0x392], 6
    mov word [edx + 0x334], 5
    mov word [edx + 0x312], 1
    mov byte [edx + 0x3d6], 1
    mov byte [edx + 0x3d4], 1
    mov byte [edx + 0x3d7], 1
    mov byte [edx + 0x3d8], 1
    mov byte [edx + 0x3d5], 1
    mov word [edx + 0x2ac], 0x140
    mov word [edx + 0x2a8], 0xc8
    mov word [edx + 0x2ae], 0x190
    mov word [edx + 0x2b0], 0x190
    mov word [edx + 0x2aa], 0x190
    mov byte [edx + 0x3d3], 0
    mov byte [edx + 0x3e2], 0
    mov word [edx + 0x314], 0xffff
    mov word [edx + 0x384], 0
    mov dword [edx + 0x258], 0
    mov byte [edx + 0x3d1], 0
    pop edx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
loc_04a0:
    push edx
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    add eax, 0xb4f00
    mov byte [eax + 0x3c9], 0
    mov word [eax + 0x39c], 0
    mov byte [eax + 0x3ce], 0
    mov word [eax + 0x386], 0
    mov word [eax + 0x354], 0
    mov byte [eax + 0x3d0], 0
    mov byte [eax + 0x3cb], 0
    mov word [eax + 0x388], 0
    mov dx, word [0xe704c]
    mov word [eax + 0x38e], 0xffff
    mov word [eax + 0x31c], 0
    mov word [eax + 0x33a], 0
    mov word [eax + 0x38a], 0
    mov byte [eax + 0x3c9], 0
    mov word [eax + 0x38c], dx
    pop edx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
loc_0540:
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov ecx, eax
    mov byte [esp], dl
    movsx ebx, ax
    mov edx, ebx
    shl edx, 7
    sub edx, ebx
    lea edx, [edx*4]
    mov edi, 0xffffffff
    sub edx, ebx
    mov ebx, 0xb4f00
    add edx, edx
    mov si, word [0x8d30]
    add ebx, edx
    xor edx, edx
    xor eax, eax
    mov word [0xe8cce], dx
    jmp short loc_058e
loc_0582:
    movsx edx, ax
    inc eax
    db 0x66, 0x89, 0x3c, 0x55, 0x98, 0x11, 0x0b, 0x00    ; mov word [edx*2 + 0xb1198], di
loc_058e:
    cmp ax, si
    jl short loc_0582
    mov byte [ebx + 0x3a5], 0
    mov word [ebx + 0x34c], 0
    mov dword [ebx + 0x274], 0
    mov byte [ebx + 0x3e9], 0
    mov byte [ebx + 0x3ef], 0
    mov byte [ebx + 0x3ee], 0
    mov byte [ebx + 0x3f4], 0
    mov byte [ebx + 0x3f3], 0
    mov byte [ebx + 0x3cd], 0
    mov word [ebx + 0x392], 6
    mov word [ebx + 0x334], 5
    mov word [ebx + 0x314], 0xffff
    mov word [ebx + 0x37c], 0
    mov word [ebx + 0x384], 0
    mov byte [ebx + 0x3d1], 0
    mov dword [ebx + 0x258], 0
    mov word [ebx + 0x342], 0xffff
    mov esi, 0x11
    mov edx, dword [0xe92ff]
    xor edi, edi
    mov dword [ebx + 0x268], edx
    xor ebp, ebp
    mov ax, word [0x261216]
    mov word [0xe8cd2], di
    mov word [0xe8cd0], di
    mov dword [0x2441c4], esi
    mov word [0xe92f3], di
    mov dword [0x8d78], ebp
    xor edx, edx
    mov esi, 0xffffffff
    mov word [0xe8cc6], ax
    mov dword [0xe54c4], edx
    xor edi, edi
    mov word [0xe92f7], si
    mov dword [0x2255c], edi
    mov word [0xe8cc8], si
    xor ah, ah
    xor dl, dl
    mov byte [0x24658e], ah
    xor eax, eax
    mov byte [0xe8d7f], dl
    mov dword [0x8d7c], eax
    mov al, byte [esp]
    mov byte [0xe9832], dl
    test al, 8
    jne short loc_06b1
    cmp word [0x261214], 2
    jl short loc_06c4
loc_06b1:
    cmp dword [0xe9347], 1
    je short loc_06d7
    cmp word [0x261214], 1
    jle short loc_06d7
loc_06c4:
    movsx edx, cx
    mov eax, edx
    call loc_03a0
    mov eax, edx
    call loc_04a0
    jmp short loc_06f9
loc_06d7:
    cmp word [ebx + 0x312], 0xf
    jne short loc_06f9
    mov si, word [ebx + 0x2ba]
    mov word [ebx + 0x312], 0xa
    inc esi
    mov word [ebx + 0x2ba], si
loc_06f9:
    mov word [ebx + 0x358], 0
    mov word [ebx + 0x35a], 0
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
loc_0720:
    push ebx
    push ecx
    push edx
    mov ebx, eax
    xor eax, eax
    jmp short loc_0737
loc_0729:
    movsx edx, ax
    xor ecx, ecx
    inc eax
    db 0x66, 0x89, 0x0c, 0x55, 0xa4, 0x79, 0x1b, 0x00    ; mov word [edx*2 + 0x1b79a4], cx
loc_0737:
    cmp ax, 0x100
    jl short loc_0729
    cmp dword [0x2441b8], 0x10000
    je short loc_0753
    mov dword [0x2441b8], 0x8000
loc_0753:
    cmp bx, 0x54
    jb short loc_0763
    jbe short loc_0769
    cmp bx, 0x58
    je short loc_0769
    jmp short loc_0773
loc_0763:
    cmp bx, 0x50
    jne short loc_0773
loc_0769:
    mov dword [0x2441b8], 0x10000
loc_0773:
    mov word [0x2464fc], 3
    pop edx
    pop ecx
    pop ebx
    ret
loc_0780:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x84
    mov dl, al
    mov ecx, 0x80
    mov edi, 0x1a17a4
    xor eax, eax
    cmp ecx, 4
    jae short loc_07ac
    test cl, 1
    je short loc_07a5
    db 0xaa    ; stosb byte es:[edi], al
loc_07a5:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_07d7
loc_07ac:
    test edi, 1
    je short loc_07b6
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_07b6:
    test edi, 2
    je short loc_07c3
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_07c3:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_07d1
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_07d1:
    test bl, 1
    je short loc_07d7
    db 0xaa    ; stosb byte es:[edi], al
loc_07d7:
    mov ecx, 0x400
    mov edi, 0x1a7824
    xor eax, eax
    cmp ecx, 4
    jae short loc_07f5
    test cl, 1
    je short loc_07ee
    db 0xaa    ; stosb byte es:[edi], al
loc_07ee:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_0820
loc_07f5:
    test edi, 1
    je short loc_07ff
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_07ff:
    test edi, 2
    je short loc_080c
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_080c:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_081a
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_081a:
    test bl, 1
    je short loc_0820
    db 0xaa    ; stosb byte es:[edi], al
loc_0820:
    mov ecx, 0x200
    mov edi, 0x1b77a4
    xor eax, eax
    cmp ecx, 4
    jae short loc_083e
    test cl, 1
    je short loc_0837
    db 0xaa    ; stosb byte es:[edi], al
loc_0837:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_0869
loc_083e:
    test edi, 1
    je short loc_0848
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_0848:
    test edi, 2
    je short loc_0855
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_0855:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_0863
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_0863:
    test bl, 1
    je short loc_0869
    db 0xaa    ; stosb byte es:[edi], al
loc_0869:
    and edx, 0xff
    xor eax, eax
    call loc_0540
    xor edx, edx
    xor ebx, ebx
    mov word [0xe8cac], dx
    jmp near loc_0a11
loc_0886:
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    mov word [eax*8 + 0x2385ca], 0x100
    mov ax, word [eax*8 + 0x2385c6]
    db 0x66, 0x3d, 0x14, 0x00    ; cmp ax, 0x14
    jb short loc_08e3
    jbe short loc_08b2
    db 0x66, 0x3d, 0x16, 0x00    ; cmp ax, 0x16
    jne short loc_08e3
loc_08b2:
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov edx, dword [eax + 0x2385ac]
    cmp edx, dword [eax + 0x2385a8]
    jle near loc_0a10
    or byte [eax + 0x2385c7], 0x80
    jmp near loc_0a10
loc_08e3:
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    test byte [eax + 0x2385b0], 1
    je near loc_09be
    movsx edx, word [eax + 0x2385b4]
    cmp dword [edx*4 + 0x1b17a4], 0
    jne short loc_0961
    cmp word [eax + 0x2385b4], 0x58
    jne short loc_0961
    xor edx, edx
    jmp short loc_095b
loc_0922:
    movsx ecx, bx
    lea eax, [ecx*4]
    add eax, ecx
    lea eax, [eax*8]
    movsx ecx, dx
    movsx esi, word [eax + 0x2385b4]
    add ecx, esi
    cmp dword [ecx*4 + 0x1b17a4], 0
    jne short loc_095a
    mov ax, word [eax + 0x2385b4]
    add eax, edx
    cwde
    call 0x4fe50
loc_095a:
    inc edx
loc_095b:
    cmp dx, 5
    jl short loc_0922
loc_0961:
    movsx edx, bx
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    movsx eax, word [edx + 0x2385b4]
    call loc_0720
    cmp word [edx + 0x2385b4], 0x4f
    jne short loc_09ab
    mov dx, word [0xe8cac]
    cmp dx, 0x7f
    jge short loc_09ab
    mov eax, edx
    inc eax
    movsx edx, dx
    mov word [0xe8cac], ax
    db 0x66, 0x89, 0x1c, 0x55, 0xe0, 0x1e, 0x04, 0x00    ; mov word [edx*2 + 0x41ee0], bx
loc_09ab:
    movsx eax, word [0xb5242]
    cmp eax, -1
    jne short loc_09be
    mov word [0xb5242], bx
loc_09be:
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov cx, word [eax + 0x2385c6]
    cmp cx, 0x7fff
    jne short loc_09e7
    inc byte [0xb52ee]
    jmp short loc_0a10
loc_09e7:
    movsx edx, cx
    cmp edx, -1
    jne short loc_0a10
    movsx eax, word [eax + 0x2385a4]
    shl eax, 5
    mov edx, dword [eax + 0x1ecda4]
    mov eax, dword [eax + 0x1ecda8]
    mov dword [0xb4f04], edx
    mov dword [0xb4f08], eax
loc_0a10:
    inc ebx
loc_0a11:
    cmp bx, word [0x246502]
    jl near loc_0886
    mov bx, word [0x2454c2]
loc_0a25:
    test bx, bx
    jl near loc_0b88
    movsx eax, bx
    db 0x66, 0x8b, 0x3c, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov di, word [eax*2 + 0x1af7a4]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x1c0bca]
    cmp edx, -1
    jne short loc_0a6d
    test byte [eax + 0x1c0bb0], 0x10
    je short loc_0a6d
    mov edx, dword [eax + 0x1c0ba4]
    mov eax, dword [eax + 0x1c0ba8]
    mov dword [0xb4f04], edx
    mov dword [0xb4f08], eax
    jmp near loc_0b81
loc_0a6d:
    movsx esi, bx
    imul ecx, esi, 0x2c
    mov ax, word [ecx + 0x1c0bb2]
    db 0x66, 0x3d, 0x07, 0x00    ; cmp ax, 7
    jb near loc_0b81
    jbe short loc_0abc
    db 0x66, 0x3d, 0x0a, 0x00    ; cmp ax, 0xa
    jne near loc_0b81
    movsx edx, word [ecx + 0x1c0bbc]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov ax, word [ecx + 0x1c0bca]
    mov word [edx + 0x2385ca], ax
    mov eax, esi
    jmp near loc_0b7c
loc_0abc:
    cmp word [0xe8cd0], 0x100
    jl short loc_0ad1
    mov eax, 0x3014
    call 0x16030
loc_0ad1:
    movsx ecx, bx
    imul ecx, ecx, 0x2c
    movsx edx, word [0xe8cd0]
    lea esi, [edx*4]
    sub esi, edx
    lea esi, [esi*4]
    mov ax, word [ecx + 0x1c0bbc]
    mov word [esi + 0xcdd00], ax
    mov ax, word [ecx + 0x1c0bca]
    mov word [esi + 0xcdd02], ax
    movsx ax, byte [ecx + 0x1c0bb4]
    movsx edx, word [ecx + 0x1c0bbc]
    mov word [esi + 0xcdd04], ax
    lea eax, [edx*4]
    add eax, edx
    movsx ax, byte [eax*8 + 0x2385c0]
    mov word [esi + 0xcdd06], ax
    mov ax, word [ecx + 0x1c0bcc]
    mov dx, word [ecx + 0x1c0bc0]
    mov word [esi + 0xcdd08], ax
    cmp dx, 0x600
    sete al
    xor ah, ah
    movsx edx, word [0xe8cd0]
    mov ecx, eax
    lea eax, [edx*4]
    sub eax, edx
    mov word [eax*4 + 0xcdd0a], cx
    movsx eax, bx
    inc word [0xe8cd0]
loc_0b7c:
    call 0x6ab35
loc_0b81:
    mov ebx, edi
    jmp near loc_0a25
loc_0b88:
    xor ebx, ebx
    cmp bx, 0x1000
    jl short loc_0b98
    xor ebx, ebx
    jmp near loc_0c06
loc_0b98:
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bbe], 0x400
    jge short loc_0bca
    cmp word [eax + 0x1c0bb2], 1
    jne short loc_0bbd
    cmp word [eax + 0x1c0bca], 0xe
    je short loc_0bca
loc_0bbd:
    mov eax, 0xffffffff
    movsx edx, bx
    call 0x19320
loc_0bca:
    inc ebx
    cmp bx, 0x1000
    jl short loc_0b98
    xor ebx, ebx
    jmp short loc_0c06
loc_0bd6:
    movsx edx, bx
    imul eax, edx, 0x2c
    cmp word [eax + 0x1c0bbe], 0x400
    jge short loc_0c05
    cmp word [eax + 0x1c0bb2], 1
    jne short loc_0c05
    cmp word [eax + 0x1c0bca], 0xe
    jne short loc_0c05
    mov eax, 0xffffffff
    call 0x19320
loc_0c05:
    inc ebx
loc_0c06:
    cmp bx, 0x1000
    jl short loc_0bd6
    mov ebp, 1
    mov bx, word [0x2454c2]
    xor edi, edi
loc_0c1b:
    test bx, bx
    jl near loc_0dfe
    movsx eax, bx
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x1c0bb2]
    cmp ax, 0xa4
    jb near loc_0ce2
    jbe near loc_0dee
    cmp ax, 0x35f
    jb short loc_0c9c
    jbe near loc_0d42
    cmp ax, 0x457
    jb short loc_0c83
    jbe near loc_0dee
    cmp ax, 0x462
    jb short loc_0c74
    jbe near loc_0dee
    cmp ax, 0x463
    je near loc_0d42
    jmp near loc_0dee
loc_0c74:
    cmp ax, 0x458
    je near loc_0d42
    jmp near loc_0dee
loc_0c83:
    cmp ax, 0x360
    jbe near loc_0dee
    cmp ax, 0x361
    je near loc_0d42
    jmp near loc_0dee
loc_0c9c:
    cmp ax, 0x2c9
    jb short loc_0cc8
    jbe near loc_0d42
    cmp ax, 0x35d
    jb near loc_0dee
    jbe near loc_0d42
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [eax*2 + 0x1af7a4]
    jmp near loc_0c1b
loc_0cc8:
    cmp ax, 0xa5
    jbe near loc_0d42
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [eax*2 + 0x1af7a4]
    jmp near loc_0c1b
loc_0ce2:
    cmp ax, 0x89
    jb short loc_0d26
    jbe short loc_0d42
    cmp ax, 0x8c
    jb short loc_0d1a
    jbe near loc_0dee
    cmp ax, 0xa2
    jb short loc_0d04
    jbe near loc_0dee
    jmp short loc_0d42
loc_0d04:
    cmp ax, 0x8d
    je short loc_0d42
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [eax*2 + 0x1af7a4]
    jmp near loc_0c1b
loc_0d1a:
    cmp ax, 0x8a
    jbe near loc_0dee
    jmp short loc_0d42
loc_0d26:
    cmp ax, 0x85
    jb near loc_0dee
    jbe short loc_0d42
    cmp ax, 0x87
    jb near loc_0dee
    ja near loc_0dee
loc_0d42:
    xor edx, edx
    jmp short loc_0d5d
loc_0d46:
    movsx ecx, bx
    imul ecx, ecx, 0x2c
    movsx eax, dx
    mov si, word [esp + eax*2]
    cmp si, word [ecx + 0x1c0bca]
    je short loc_0d62
    inc edx
loc_0d5d:
    cmp dx, di
    jl short loc_0d46
loc_0d62:
    cmp dx, di
    jne near loc_0dee
    movsx eax, bx
    imul edx, eax, 0x2c
    movsx eax, di
    db 0x8d, 0x0c, 0x45, 0x00, 0x00, 0x00, 0x00    ; lea ecx, [eax*2]
    mov ax, word [edx + 0x1c0bca]
    inc edi
    mov word [esp + ecx], ax
    cmp di, 0x40
    jle short loc_0d97
    mov eax, 0x3030
    call 0x16030
loc_0d97:
    mov dx, word [0x2454c8]
loc_0d9e:
    test dx, dx
    jl short loc_0dee
    movsx ecx, dx
    imul eax, ecx, 0x2c
    cmp word [eax + 0x1c0bca], 0xc
    jne short loc_0de1
    movsx esi, bx
    imul esi, esi, 0x2c
    mov ax, word [eax + 0x1c0bcc]
    cmp ax, word [esi + 0x1c0bca]
    jne short loc_0de1
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov dword [eax + 0x4ea07], ebp
loc_0de1:
    movsx eax, dx
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    jmp short loc_0d9e
loc_0dee:
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [eax*2 + 0x1af7a4]
    jmp near loc_0c1b
loc_0dfe:
    xor esi, esi
    xor ebx, ebx
    mov word [0xe8cc0], si
    jmp near loc_10c6
loc_0e0e:
    movsx ecx, bx
    shl ecx, 5
    add ecx, 0x1ecda4
    cmp word [ecx + 0x12], 0x230
    jne near loc_0eac
    test byte [ecx + 0xe], 0x20
    je near loc_0eac
    mov si, word [0xe8cc0]
    mov dx, word [ecx + 0xc]
    cmp si, 0x3f
    jle short loc_0e4b
    mov eax, 0x3050
    call 0x16030
loc_0e4b:
    test dx, dx
    jl short loc_0eac
    movsx esi, dx
    lea eax, [esi*4]
    add eax, esi
    lea eax, [eax*8]
    cmp word [eax + 0x2385b4], 0x230
    je short loc_0eac
    mov ecx, 0x230
    mov di, word [0xe8cc0]
    mov word [eax + 0x2385b4], cx
    inc edi
    mov word [eax + 0x2385bc], cx
    movsx eax, word [0xe8cc0]
    mov word [0xe8cc0], di
    db 0x66, 0x89, 0x1c, 0x45, 0x68, 0xe5, 0x04, 0x00    ; mov word [eax*2 + 0x4e568], bx
    db 0x66, 0x89, 0x14, 0x45, 0xe0, 0xdd, 0x04, 0x00    ; mov word [eax*2 + 0x4dde0], dx
    jmp near loc_10c5
loc_0eac:
    cmp word [0xe8cd2], 0x200
    jl short loc_0ec1
    mov eax, 0x306c
    call 0x16030
loc_0ec1:
    movsx edx, word [0xe8cd2]
    lea eax, [edx*4]
    sub eax, edx
    xor edx, edx
    db 0x89, 0x14, 0x45, 0x02, 0x31, 0x0c, 0x00    ; mov dword [eax*2 + 0xc3102], edx
    xor edx, edx
    db 0x66, 0x89, 0x14, 0x45, 0x00, 0x31, 0x0c, 0x00    ; mov word [eax*2 + 0xc3100], dx
    mov dx, word [ecx + 0x12]
    cmp dx, 0x19c
    jb short loc_0f0e
    jbe short loc_0f2a
    cmp dx, 0x297
    jb near loc_0fe7
    jbe short loc_0f65
    cmp dx, 0x299
    jbe near loc_0f86
    jmp near loc_0fe7
loc_0f0e:
    cmp dx, 0xe6
    jb near loc_0fe7
    jbe near loc_0fbb
    cmp dx, 0x197
    jne near loc_0fe7
loc_0f2a:
    mov ah, byte [0x1ecdb2]
    movsx edx, word [0xe8cd2]
    or ah, 0x41
    mov si, word [0xe8cd2]
    mov byte [0x1ecdb2], ah
    lea eax, [edx*4]
    inc esi
    sub eax, edx
    mov word [0xe8cd2], si
    db 0x66, 0x89, 0x1c, 0x45, 0x00, 0x31, 0x0c, 0x00    ; mov word [eax*2 + 0xc3100], bx
    jmp near loc_0fe7
loc_0f65:
    cmp dword [0x1b2200], 0
    jne short loc_0f86
    xor edx, edx
    jmp short loc_0f80
loc_0f72:
    mov eax, edx
    add eax, 0x297
    cwde
    inc edx
    call 0x4fe50
loc_0f80:
    cmp dx, 3
    jl short loc_0f72
loc_0f86:
    cmp byte [ecx + 0x14], 0x1f
    jle short loc_0f94
    mov word [ecx + 0xe], 0
    jmp short loc_0f9a
loc_0f94:
    or word [ecx + 0xe], 0x155
loc_0f9a:
    cmp word [ecx + 0x1a], 0
    je short loc_0fbb
    mov si, word [ecx + 0xa]
    test si, si
    jl short loc_0fbb
    movsx edx, si
    shl edx, 5
    mov ax, word [ecx + 0x1a]
    mov word [edx + 0x1ecdbe], ax
loc_0fbb:
    movsx edx, word [0xe8cd2]
    mov di, word [0xe8cd2]
    lea eax, [edx*4]
    inc edi
    sub eax, edx
    mov word [0xe8cd2], di
    db 0x66, 0x89, 0x1c, 0x45, 0x00, 0x31, 0x0c, 0x00    ; mov word [eax*2 + 0xc3100], bx
    jmp near loc_10c5
loc_0fe7:
    mov ax, word [ecx + 0x10]
    mov word [ecx + 0x1e], 0xffff
    cmp ax, 0x131
    jb near loc_10c5
    jbe near loc_10c5
    cmp ax, 0x512
    jb short loc_100e
    jbe short loc_1057
    jmp near loc_10c5
loc_100e:
    cmp ax, 0x500
    jb short loc_1021
    jbe short loc_1057
    cmp ax, 0x509
    je short loc_1057
    jmp near loc_10c5
loc_1021:
    cmp ax, 0x150
    jne near loc_10c5
    xor edx, edx
    jmp short loc_104f
loc_102f:
    movsx esi, dx
    movsx eax, word [ecx + 0x10]
    add eax, esi
    cmp dword [eax*4 + 0x1b17a4], 0
    jne short loc_104e
    mov ax, word [ecx + 0x10]
    add eax, edx
    cwde
    call 0x4fe50
loc_104e:
    inc edx
loc_104f:
    cmp dx, 3
    jl short loc_102f
    jmp short loc_10c5
loc_1057:
    mov ax, word [ecx + 0x10]
    mov word [ecx + 0x1e], ax
    movsx edx, word [0xe8cd2]
    lea eax, [edx*4]
    sub eax, edx
    mov edi, 0xffffffff
    mov ebp, dword [0xe934f]
    db 0x89, 0x3c, 0x45, 0x02, 0x31, 0x0c, 0x00    ; mov dword [eax*2 + 0xc3102], edi
    test ebp, ebp
    je short loc_109b
    cmp word [ecx + 0x10], 0x500
    jne short loc_1095
    mov word [ecx + 0x10], 0x50d
    jmp short loc_109b
loc_1095:
    mov word [ecx + 0x10], 0x10c
loc_109b:
    movsx edx, word [0xe8cd2]
    lea eax, [edx*4]
    sub eax, edx
    db 0x66, 0x89, 0x1c, 0x45, 0x00, 0x31, 0x0c, 0x00    ; mov word [eax*2 + 0xc3100], bx
    movsx edx, word [ecx + 0x10]
    db 0x89, 0x14, 0x45, 0x02, 0x31, 0x0c, 0x00    ; mov dword [eax*2 + 0xc3102], edx
    inc word [0xe8cd2]
loc_10c5:
    inc ebx
loc_10c6:
    cmp bx, word [0x246500]
    jl near loc_0e0e
    mov esi, 0x230
    xor ebx, ebx
    jmp short loc_111f
loc_10dc:
    movsx eax, bx
    db 0x0f, 0xbf, 0x14, 0x45, 0xe0, 0xdd, 0x04, 0x00    ; movsx edx, word [eax*2 + 0x4dde0]
    lea eax, [edx*4]
    add eax, edx
    mov dx, word [eax*8 + 0x2385a4]
    mov cx, word [eax*8 + 0x2385a6]
    add ecx, edx
    jmp short loc_1119
loc_1104:
    movsx eax, dx
    shl eax, 5
    mov word [eax + 0x1ecdb4], si
    inc edx
    mov word [eax + 0x1ecdb6], si
loc_1119:
    cmp dx, cx
    jl short loc_1104
    inc ebx
loc_111f:
    cmp bx, word [0xe8cc0]
    jl short loc_10dc
    add esp, 0x84
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
    push ecx
    push esi
    push edi
    sub esp, 0xc
    mov byte [esp], al
    mov byte [esp + 4], dl
    mov byte [esp + 8], bl
    mov dx, word [0x8fe0]
    mov esi, 0xb4f00
    test dx, dx
    jl short loc_1175
loc_1162:
    movsx eax, word [0x8fe0]
    imul eax, eax, 0xd
    cmp byte [eax + 0xe75d4], 0xc8
    jae short loc_1162
loc_1175:
    mov ebx, 0xffffffff
    xor dh, dh
    mov word [0x8fe0], bx
    call loc_1b10
    mov byte [0xe983a], dh
    cmp dword [0xe97bf], 2
    je short loc_11bd
    cmp word [0xe92fb], 0
    jl short loc_11bd
    cmp dword [0xe97df], 1
    jle short loc_11bd
    cmp dword [0xe9347], 1
    je short loc_11bd
    mov eax, 1
    call 0x24bb0
loc_11bd:
    cmp byte [esp + 4], 0
    jne near loc_1264
    cmp byte [esp], 3
    jne near loc_1264
    cmp dword [0xe97df], 2
    jge near loc_1264
    cmp dword [0xe934f], 0
    jne short loc_1264
    mov eax, 0xe6fc1
    call 0x5a2a0
    call 0x7168d
    xor edx, edx
    mov ecx, dword [0x2454b4]
    mov ebx, dword [0x2454b8]
    xor eax, eax
    dec ecx
    dec ebx
    call 0x712c3
    xor eax, eax
    mov edx, 6
    call 0x76795
    call 0x64550
    mov eax, 0x3090
    call 0x478f0
    xor eax, eax
    mov edx, 7
    call 0x76795
    call 0x64550
    mov eax, 0x309c
    call 0x478f0
    mov edx, 9
    mov eax, 0x30a8
    call 0x478f0
    xor eax, eax
    call 0x76795
    call 0x64550
    call 0x94a94
loc_1264:
    mov eax, 0x374
    xor edi, edi
    xor edx, edx
    mov dword [0xe43a0], eax
    xor eax, eax
    mov word [0xe92fd], di
    mov al, byte [esp + 4]
    mov word [0xe92f5], di
    mov dword [0xe97e7], eax
    xor eax, eax
    mov dword [0x2441b8], edx
    mov al, byte [esp]
    mov edx, 0xffffffff
    mov dword [0xe97eb], eax
    xor eax, eax
    mov word [0xe92fb], dx
    mov al, byte [esp + 8]
    mov word [0x8ff0], dx
    mov dword [0xe97e3], eax
    mov dword [esi], 0x300
    mov byte [esi + 0x3a2], 0
    cmp dword [0xe9343], 1
    je short loc_12fd
    mov word [esi + 0x312], 9
    mov byte [esi + 0x3dc], 1
    mov byte [esi + 0x3d3], 0
    mov word [esi + 0x2b8], 0x7d00
    mov byte [esi + 0x3e2], 0
    mov word [esi + 0x314], dx
loc_12fd:
    xor cl, cl
    mov byte [0xe9835], cl
    cmp dword [0xe97df], 1
    jle short loc_1347
    cmp word [0x261214], 2
    jge short loc_135c
    xor eax, eax
    mov word [0x261210], ax
    jmp short loc_1330
loc_1322:
    mov edx, eax
    cwde
    inc edx
    db 0x66, 0x89, 0x14, 0x45, 0x08, 0x11, 0x26, 0x00    ; mov word [eax*2 + 0x261108], dx
    mov eax, edx
loc_1330:
    db 0x66, 0x3d, 0x10, 0x00    ; cmp ax, 0x10
    jl short loc_1322
    mov eax, dword [0xe97df]
    db 0x66, 0xc7, 0x04, 0x45, 0x06, 0x11, 0x26, 0x00, 0xff, 0xff    ; mov word [eax*2 + 0x261106], 0xffff
    jmp short loc_135c
loc_1347:
    xor ecx, ecx
    mov esi, 0xffffffff
    mov word [0x261210], cx
    mov word [0x261108], si
loc_135c:
    add esp, 0xc
    pop edi
    pop esi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
loc_1370:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x75c
    mov byte [esp + 0x758], al
    push 0xa
    push 0
    push 0
    push 0
    movsx eax, word [0xb5198]
    push eax
    push 0
    push 0
    mov ecx, dword [0xb511c]
    push 0
    mov ebx, dword [0xb5118]
    mov edx, dword [0xb5114]
    push 0x214
    movsx eax, word [0xb519e]
    call 0x18f70
    cmp dword [0xe97a7], 2
    je near loc_1515
    xor esi, esi
    jmp near loc_150b
loc_13d0:
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8a, 0x04, 0x45, 0x80, 0x51, 0x0b, 0x00    ; mov al, byte [eax*2 + 0xb5180]
    mov byte [esp + edx + 0x740], al
    cmp dword [0xe97df], 1
    jle near loc_150a
    cmp dword [0xe9347], 1
    jne near loc_150a
    cmp word [0xe92fb], 0
    jl near loc_150a
    xor edx, edx
    jmp short loc_146e
loc_141d:
    movsx ecx, si
    mov edi, ecx
    shl edi, 7
    sub edi, ecx
    lea edi, [edi*4]
    sub edi, ecx
    imul ecx, ecx, 0x74
    movsx eax, dx
    db 0x8d, 0x1c, 0x45, 0x00, 0x00, 0x00, 0x00    ; lea ebx, [eax*2]
    add edi, edi
    lea ebp, [edi + ebx]
    mov dword [esp + 0x750], ebp
    lea ebp, [ecx + ebx]
    mov ebx, dword [esp + 0x750]
    inc edx
    add edi, eax
    mov bx, word [ebx + 0xb51a6]
    add eax, ecx
    mov word [esp + ebp + 0x28], bx
    mov bl, byte [edi + 0xb52d3]
    mov byte [esp + eax + 0x4c], bl
loc_146e:
    cmp dx, 0x11
    jl short loc_141d
    movsx ecx, si
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    imul ebx, ecx, 0x74
    db 0x66, 0x8b, 0x14, 0x45, 0x8c, 0x52, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb528c]
    mov word [esp + ebx + 0x24], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x12, 0x52, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb5212]
    mov word [esp + ebx + 0x26], dx
    db 0x8a, 0x14, 0x45, 0xc9, 0x52, 0x0b, 0x00    ; mov dl, byte [eax*2 + 0xb52c9]
    mov byte [esp + ebx + 0x5d], dl
    db 0x66, 0x8b, 0x14, 0x45, 0x3a, 0x52, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb523a]
    mov word [esp + ebx + 0x60], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x8a, 0x52, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb528a]
    mov word [esp + ebx + 0x62], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x1c, 0x52, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb521c]
    mov word [esp + ebx + 0x64], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x88, 0x52, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb5288]
    mov word [esp + ebx + 0x66], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x54, 0x52, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb5254]
    mov word [esp + ebx + 0x68], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x86, 0x52, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb5286]
    db 0x66, 0x8b, 0x04, 0x45, 0x9c, 0x52, 0x0b, 0x00    ; mov ax, word [eax*2 + 0xb529c]
    mov word [esp + ebx + 0x6a], dx
    mov word [esp + ebx + 0x6c], ax
loc_150a:
    inc esi
loc_150b:
    cmp si, 0x10
    jl near loc_13d0
loc_1515:
    xor eax, eax
    mov esi, 1
    call loc_0000
    jmp short loc_154d
loc_1523:
    movsx ebx, si
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov edx, 0xb4f00
    add eax, eax
    mov ebx, 0x3f6
    add eax, 0xb4f00
    inc esi
    call 0xa2a10
loc_154d:
    cmp si, 0x10
    jl short loc_1523
    cmp dword [0xe97a7], 2
    je near loc_16ae
    xor esi, esi
    jmp near loc_16a4
loc_1567:
    movsx ebx, si
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    xor edx, edx
    sub eax, ebx
    mov dl, byte [esp + ebx + 0x740]
    mov edi, dword [0xe97df]
    db 0x89, 0x14, 0x45, 0x80, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb5180], edx
    cmp edi, 1
    jle near loc_16a3
    cmp dword [0xe9347], 1
    jne near loc_16a3
    cmp word [0xe92fb], 0
    jl near loc_16a3
    xor edx, edx
    jmp short loc_1607
loc_15b8:
    movsx ecx, si
    imul edi, ecx, 0x74
    movsx ebx, dx
    db 0x8d, 0x2c, 0x5d, 0x00, 0x00, 0x00, 0x00    ; lea ebp, [ebx*2]
    lea eax, [edi + ebp]
    mov dword [esp + 0x750], eax
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    mov ecx, dword [esp + 0x750]
    add eax, eax
    mov cx, word [esp + ecx + 0x28]
    add edi, ebx
    mov word [eax + ebp + 0xb51a6], cx
    add eax, ebx
    mov bl, byte [esp + edi + 0x4c]
    inc edx
    mov byte [eax + 0xb52d3], bl
loc_1607:
    cmp dx, 0x11
    jl short loc_15b8
    movsx ecx, si
    imul ebx, ecx, 0x74
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    mov dx, word [esp + ebx + 0x24]
    db 0x66, 0x89, 0x14, 0x45, 0x8c, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb528c], dx
    mov dx, word [esp + ebx + 0x26]
    db 0x66, 0x89, 0x14, 0x45, 0x12, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb5212], dx
    mov dl, byte [esp + ebx + 0x5d]
    db 0x88, 0x14, 0x45, 0xc9, 0x52, 0x0b, 0x00    ; mov byte [eax*2 + 0xb52c9], dl
    mov dx, word [esp + ebx + 0x60]
    db 0x66, 0x89, 0x14, 0x45, 0x3a, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb523a], dx
    mov dx, word [esp + ebx + 0x62]
    db 0x66, 0x89, 0x14, 0x45, 0x8a, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb528a], dx
    mov dx, word [esp + ebx + 0x64]
    db 0x66, 0x89, 0x14, 0x45, 0x1c, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb521c], dx
    mov dx, word [esp + ebx + 0x66]
    db 0x66, 0x89, 0x14, 0x45, 0x88, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb5288], dx
    mov dx, word [esp + ebx + 0x68]
    db 0x66, 0x89, 0x14, 0x45, 0x54, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb5254], dx
    mov dx, word [esp + ebx + 0x6a]
    db 0x66, 0x89, 0x14, 0x45, 0x86, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb5286], dx
    mov dx, word [esp + ebx + 0x6c]
    db 0x66, 0x89, 0x14, 0x45, 0x9c, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb529c], dx
loc_16a3:
    inc esi
loc_16a4:
    cmp si, 0x10
    jl near loc_1567
loc_16ae:
    mov ecx, 9
    mov dx, word [0x261210]
    xor ah, ah
    mov si, word [0x2454d6]
    mov byte [0xe983b], ah
    mov word [0x9740], cx
loc_16d0:
    test si, si
    jl near loc_190f
    movsx eax, si
    db 0x66, 0x8b, 0x1c, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [eax*2 + 0x1af7a4]
    imul eax, eax, 0x2c
    mov dword [esp + 0x754], ebx
    mov ebx, 0x1c0ba4
    mov cl, byte [0xe983b]
    add ebx, eax
    cmp cl, 0x10
    jne short loc_170a
    mov eax, 0x30b4
    call 0x16030
loc_170a:
    xor eax, eax
    mov al, byte [0xe983b]
    shl eax, 4
    mov ecx, dword [ebx]
    mov dword [eax + 0xb4e00], ecx
    mov ecx, dword [ebx + 4]
    mov dword [eax + 0xb4e04], ecx
    mov ecx, dword [ebx + 8]
    mov dword [eax + 0xb4e08], ecx
    mov cx, word [ebx + 0x1c]
    mov word [eax + 0xb4e0c], cx
    mov cx, word [ebx + 0x18]
    mov word [eax + 0xb4e0e], cx
    inc byte [0xe983b]
    test dx, dx
    jl near loc_18fb
    mov byte [ebx + 0x10], 0
    mov byte [ebx + 0x14], 0x2a
    mov byte [ebx + 0x15], 0x24
    mov word [ebx + 0xc], 0x101
    mov byte [ebx + 0x16], 0
    mov byte [ebx + 0x12], 0x40
    mov al, byte [esp + 0x758]
    mov word [ebx + 0x1e], si
    test al, 8
    je short loc_179d
    movsx ecx, dx
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    add eax, eax
    mov di, word [eax + 0xb51a2]
    test di, di
    jne short loc_17c6
loc_179d:
    movsx ecx, dx
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    lea ecx, [eax + eax]
    mov ax, word [0xe7220]
    mov word [ecx + 0xb51a2], ax
    mov word [ebx + 0x2a], ax
    jmp short loc_17ca
loc_17c6:
    mov word [ebx + 0x2a], di
loc_17ca:
    mov ah, byte [ebx + 0x11]
    mov word [ebx + 0x22], dx
    test ah, ah
    jne short loc_1816
    movsx ecx, dx
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    mov cl, byte [0x9740]
    db 0x88, 0x0c, 0x45, 0xec, 0x52, 0x0b, 0x00    ; mov byte [eax*2 + 0xb52ec], cl
    mov byte [ebx + 0x11], cl
    mov ax, word [0x9740]
    inc eax
    mov word [0x9740], ax
    db 0x66, 0x3d, 0x11, 0x00    ; cmp ax, 0x11
    jl short loc_1835
    mov word [0x9740], 9
    jmp short loc_1835
loc_1816:
    movsx ecx, dx
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    lea ecx, [eax + eax]
    mov al, byte [ebx + 0x11]
    mov byte [ecx + 0xb52ec], al
loc_1835:
    movsx ebp, dx
    mov eax, ebp
    shl eax, 7
    movsx edi, si
    sub eax, ebp
    lea ecx, [edi*8]
    lea eax, [eax*4]
    add ecx, edi
    sub eax, ebp
    lea ecx, [ecx*8]
    add eax, eax
    sub ecx, edi
    mov word [eax + 0xb5240], si
    mov word [ecx + 0x4e9df], si
    mov word [eax + 0xb5294], dx
    mov edx, dword [ebx]
    mov dword [eax + 0xb5114], edx
    mov dword [eax + 0xb5138], edx
    mov dword [eax + 0xb5130], edx
    mov dword [ecx + 0x4e9fb], edx
    mov edx, dword [ebx + 4]
    mov dword [eax + 0xb5118], edx
    mov dword [eax + 0xb513c], edx
    mov dword [eax + 0xb5134], edx
    mov dword [ecx + 0x4e9ff], edx
    mov edx, dword [ebx + 8]
    mov dword [eax + 0xb511c], edx
    mov dword [eax + 0xb5140], edx
    mov dword [ecx + 0x4ea03], edx
    mov dx, word [ebx + 0x1c]
    mov word [eax + 0xb5198], dx
    mov word [eax + 0xb519a], dx
    add eax, 0xb4f00
    lea ecx, [eax + 0x29e]
    mov edx, dword [ebx + 4]
    mov eax, dword [ebx]
    mov ebx, ecx
    call 0x6e997
    db 0x66, 0x8b, 0x14, 0x6d, 0x08, 0x11, 0x26, 0x00    ; mov dx, word [ebp*2 + 0x261108]
    mov esi, dword [esp + 0x754]
    jmp near loc_16d0
loc_18fb:
    movsx eax, si
    call 0x6ab35
    mov esi, dword [esp + 0x754]
    jmp near loc_16d0
loc_190f:
    add esp, 0x75c
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
loc_1920:
    push ebx
    push ecx
    push edx
    push edi
    xor edx, edx
    jmp short loc_194e
loc_1928:
    movsx ebx, dx
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    xor ebx, ebx
    db 0x66, 0x89, 0x1c, 0x45, 0xcc, 0x51, 0x0b, 0x00    ; mov word [eax*2 + 0xb51cc], bx
    inc edx
    db 0x66, 0x89, 0x1c, 0x45, 0xca, 0x51, 0x0b, 0x00    ; mov word [eax*2 + 0xb51ca], bx
loc_194e:
    cmp dx, 0x10
    jl short loc_1928
    mov ecx, 0x200
    mov edi, 0x4c460
    xor eax, eax
    cmp ecx, 4
    jae short loc_1972
    test cl, 1
    je short loc_196b
    db 0xaa    ; stosb byte es:[edi], al
loc_196b:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_199d
loc_1972:
    test edi, 1
    je short loc_197c
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_197c:
    test edi, 2
    je short loc_1989
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_1989:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_1997
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_1997:
    test bl, 1
    je short loc_199d
    db 0xaa    ; stosb byte es:[edi], al
loc_199d:
    pop edi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8b, 0xc0    ; mov eax, eax
loc_19b0:
    push edx
    xor edx, edx
    mov dword [0xe4460], edx
    mov dword [0xe4b6c], edx
    mov dword [0xe4458], edx
    mov dword [0xe445c], edx
    mov dword [0x2454ac], edx
    mov ah, 1
    mov dword [0x8d70], edx
    mov dword [0xe54ac], edx
    mov dword [0xe54c8], edx
    mov byte [0xe983a], ah
    pop edx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 8
    mov eax, 0x30d8
    xor edx, edx
    call 0x7a82e
    mov esi, eax
    cmp eax, -1
    je short loc_1a1b
    mov ebx, 1
    lea edx, [esp + 4]
    call 0x7a960
    jmp short loc_1a25
loc_1a1b:
    mov eax, 0x30e4
    call 0x16030
loc_1a25:
    xor edi, edi
    jmp short loc_1a60
loc_1a29:
    mov ebx, 1
    mov edx, esp
    mov eax, esi
    call 0x7a960
    mov ebx, 0x100
    mov edx, 0xbc0a0
    mov eax, esi
    xor ecx, ecx
    call 0x7a960
    push 1
    movsx eax, byte [esp + 4]
    mov edx, 0xbc0a0
    push 0
    xor ebx, ebx
    inc edi
    call 0x738ac
loc_1a60:
    xor eax, eax
    mov al, byte [esp + 4]
    cmp edi, eax
    jl short loc_1a29
    mov ebx, 0x300
    mov edx, 0x20738
    mov eax, esi
    call 0x7a960
    mov ebx, 0x300
    mov edx, 0x21938
    mov eax, esi
    call 0x7a960
    mov ebx, 0x300
    mov edx, 0x1f838
    mov eax, esi
    call 0x7a960
    mov ebx, 0x300
    mov edx, 0x20a38
    mov eax, esi
    call 0x7a960
    mov ebx, 0x300
    mov edx, 0x20d38
    mov eax, esi
    call 0x7a960
    xor ah, ah
    mov byte [0x1c0ba3], ah
    mov byte [0x1c0ba2], ah
    mov byte [0x1c0ba1], ah
    mov byte [0x21c37], ah
    mov byte [0x21c36], ah
    mov byte [0x21c35], ah
    mov byte [0x20a37], ah
    mov byte [0x20a36], ah
    mov byte [0x20a35], ah
    mov eax, esi
    call 0x7ab25
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
loc_1b10:
    push ebx
    push ecx
    push edx
    cmp word [0x261214], 2
    jl near loc_1ba4
    mov ah, 0xfa
    movsx ecx, word [0x261210]
    mov byte [0xbbe60], ah
    jmp short loc_1b56
loc_1b32:
    movsx eax, word [0x261216]
    cmp ecx, eax
    je short loc_1b4e
    mov ebx, 1
    mov edx, 0xbbe60
    mov eax, ecx
    call 0x7b7ee
loc_1b4e:
    db 0x0f, 0xbf, 0x0c, 0x4d, 0x08, 0x11, 0x26, 0x00    ; movsx ecx, word [ecx*2 + 0x261108]
loc_1b56:
    test ecx, ecx
    jge short loc_1b32
    movsx eax, word [0x261216]
    inc byte [eax + 0xb23c0]
loc_1b67:
    call 0x10800
    movsx ecx, word [0x261210]
    movsx eax, word [0x261216]
    test ecx, ecx
    jge short loc_1b86
    test ecx, ecx
    jge short loc_1b67
    pop edx
    pop ecx
    pop ebx
    ret
loc_1b86:
    mov dl, byte [ecx + 0xb23c0]
    cmp dl, byte [eax + 0xb23c0]
    jb short loc_1ba0
    db 0x0f, 0xbf, 0x0c, 0x4d, 0x08, 0x11, 0x26, 0x00    ; movsx ecx, word [ecx*2 + 0x261108]
    test ecx, ecx
    jge short loc_1b86
loc_1ba0:
    test ecx, ecx
    jge short loc_1b67
loc_1ba4:
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
loc_1bb0:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    cmp dword [0xe97a7], 2
    je near loc_1c48
    movsx eax, word [0x261216]
    mov esi, eax
    shl esi, 7
    sub esi, eax
    lea esi, [esi*4]
    sub esi, eax
    db 0xc7, 0x04, 0x75, 0xe5, 0x52, 0x0b, 0x00, 0xa4, 0x08, 0x1c, 0x00    ; mov dword [esi*2 + 0xb52e5], 0x1c08a4
    xor esi, esi
    jmp short loc_1bf8
loc_1be8:
    mov ecx, esi
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call 0x46520
    add esi, 7
loc_1bf8:
    cmp esi, 0x3f
    jl short loc_1be8
    xor esi, esi
    mov edi, dword [0xe934b]
    mov dword [0xe934b], esi
    call 0x50a30
    xor eax, eax
    mov esi, 0x3f
    call 0x76795
    call 0x64550
    jmp short loc_1c33
loc_1c23:
    mov ecx, esi
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call 0x46520
    sub esi, 7
loc_1c33:
    test esi, esi
    jg short loc_1c23
    call 0x9ef7c
    mov dword [0xe934b], edi
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1c48:
    xor eax, eax
    call 0x76795
    movsx eax, word [0x261216]
    mov esi, eax
    shl esi, 7
    sub esi, eax
    mov ebx, 0x1c08a4
    lea esi, [esi*4]
    xor ecx, ecx
    sub esi, eax
    xor edx, edx
    xor eax, eax
    db 0x89, 0x1c, 0x75, 0xe5, 0x52, 0x0b, 0x00    ; mov dword [esi*2 + 0xb52e5], ebx
    xor ebx, ebx
    call 0x46520
    mov eax, dword [0x2454b4]
    dec eax
    push eax
    mov eax, dword [0x2454b8]
    dec eax
    push eax
    push 0
    push 0
    push 0x4a
    push 0
    push 0
    mov ebx, 0x10000
    mov edx, 0x640000
    push 0xcd1
    xor ecx, ecx
    mov eax, 0xa00000
    call 0x7169e
    push 0x310c
    mov edx, 0x69
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call 0x41610
    call 0x64550
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
loc_1ce0:
    push ebx
    push ecx
    push edx
    push edi
    mov ecx, 1
    mov edi, 0x4b1e0
    xor edx, edx
    xor ah, ah
    mov dword [0xe4308], edx
    mov dword [0xe4324], edx
    mov byte [0xe9826], ah
    mov dword [0x8d6c], ecx
    mov dword [0xe43a4], edx
    mov dword [0xe722c], edx
    mov dword [0xe4b70], edx
    mov dword [0xe54a4], edx
    mov dword [0xe54bc], edx
    mov dword [0xe54b8], edx
    mov dword [0xe54b0], edx
    mov dword [0xe54b4], edx
    mov dword [0xe430c], edx
    mov ecx, 0x40
    xor eax, eax
    mov dword [0xe4314], edx
    cmp ecx, 4
    jae short loc_1d5f
    test cl, 1
    je short loc_1d58
    db 0xaa    ; stosb byte es:[edi], al
loc_1d58:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_1d8a
loc_1d5f:
    test edi, 1
    je short loc_1d69
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_1d69:
    test edi, 2
    je short loc_1d76
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_1d76:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_1d84
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_1d84:
    test bl, 1
    je short loc_1d8a
    db 0xaa    ; stosb byte es:[edi], al
loc_1d8a:
    mov ecx, 0xa
    mov edi, 0xe75c4
    xor eax, eax
    cmp ecx, 4
    jae short loc_1da8
    test cl, 1
    je short loc_1da1
    db 0xaa    ; stosb byte es:[edi], al
loc_1da1:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_1dd3
loc_1da8:
    test edi, 1
    je short loc_1db2
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_1db2:
    test edi, 2
    je short loc_1dbf
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_1dbf:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_1dcd
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_1dcd:
    test bl, 1
    je short loc_1dd3
    db 0xaa    ; stosb byte es:[edi], al
loc_1dd3:
    mov ecx, 0xa0
    mov edi, 0xe0260
    xor eax, eax
    cmp ecx, 4
    jae short loc_1df1
    test cl, 1
    je short loc_1dea
    db 0xaa    ; stosb byte es:[edi], al
loc_1dea:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_1e1c
loc_1df1:
    test edi, 1
    je short loc_1dfb
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_1dfb:
    test edi, 2
    je short loc_1e08
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_1e08:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_1e16
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_1e16:
    test bl, 1
    je short loc_1e1c
    db 0xaa    ; stosb byte es:[edi], al
loc_1e1c:
    mov ecx, 0xa000
    mov edi, 0xc3d00
    xor eax, eax
    cmp ecx, 4
    jae short loc_1e3a
    test cl, 1
    je short loc_1e33
    db 0xaa    ; stosb byte es:[edi], al
loc_1e33:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_1e65
loc_1e3a:
    test edi, 1
    je short loc_1e44
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_1e44:
    test edi, 2
    je short loc_1e51
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_1e51:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_1e5f
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_1e5f:
    test bl, 1
    je short loc_1e65
    db 0xaa    ; stosb byte es:[edi], al
loc_1e65:
    mov ecx, 0x10
    mov edi, 0x4e798
    xor eax, eax
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    mov ecx, 0x10
    mov edi, 0x4b220
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    mov ecx, 0x10
    mov edi, 0x4b1e0
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    pop edi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1e90:
    push edx
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x14, 0x45, 0x14, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb5114]
    mov dword [0xe43c4], edx
    mov dword [0xe43bc], edx
    db 0x8b, 0x14, 0x45, 0x18, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb5118]
    mov dword [0xe43c8], edx
    mov dword [0xe43b8], edx
    db 0x8b, 0x14, 0x45, 0x1c, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb511c]
    mov dword [0xe43c0], edx
    mov dword [0xe43b4], edx
    xor edx, edx
    mov dword [0xe43a8], edx
    mov dword [0xe43ac], edx
    mov dword [0xe43b0], edx
    db 0x66, 0x8b, 0x14, 0x45, 0x98, 0x51, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb5198]
    mov word [0xe8cba], dx
    mov word [0xe8cb8], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x20, 0x51, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb5120]
    mov word [0xe8cb0], dx
    mov word [0xe8cae], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x18, 0x52, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb5218]
    mov word [0xe8cbc], dx
    mov word [0xe8cb2], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x9e, 0x51, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb519e]
    mov word [0xe8cb4], dx
    db 0x66, 0x8b, 0x14, 0x45, 0x24, 0x52, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb5224]
    mov word [0xe8cb6], dx
    db 0x8a, 0x14, 0x45, 0xa6, 0x52, 0x0b, 0x00    ; mov dl, byte [eax*2 + 0xb52a6]
    mov byte [0xe9830], dl
    db 0x8a, 0x14, 0x45, 0xa8, 0x52, 0x0b, 0x00    ; mov dl, byte [eax*2 + 0xb52a8]
    mov byte [0xe9831], dl
    db 0x8a, 0x14, 0x45, 0xed, 0x52, 0x0b, 0x00    ; mov dl, byte [eax*2 + 0xb52ed]
    db 0x8a, 0x04, 0x45, 0xf5, 0x52, 0x0b, 0x00    ; mov al, byte [eax*2 + 0xb52f5]
    mov byte [0xe982e], dl
    mov byte [0xe982a], al
    pop edx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x104
    mov byte [esp + 0x100], al
    test al, 2
    jne short loc_1fb0
    mov eax, dword [0xe97bf]
    mov dword [0xe97a7], eax
loc_1fb0:
    mov eax, dword [0xe97b7]
    mov dword [0xe979b], eax
    mov eax, dword [0xe97b3]
    mov dword [0xe979f], eax
    mov eax, dword [0xe97bb]
    mov dword [0xe97a3], eax
    mov eax, dword [0xe97c3]
    mov dword [0xe97ab], eax
    mov eax, dword [0xe9343]
    mov dword [0xe9347], eax
    mov eax, dword [0xe97ef]
    mov dword [0xe97f3], eax
    mov eax, dword [0xe97cb]
    mov dl, byte [esp + 0x100]
    mov dword [0xe97cf], eax
    test dl, 2
    jne short loc_2013
    cmp dword [0xe97a7], 2
    jne short loc_2013
    xor ebx, ebx
    mov dword [0xe97a7], ebx
loc_2013:
    call 0x94a94
    call 0x5b280
    xor eax, eax
    call 0x947e4
    xor esi, esi
    mov cx, word [0xe934b]
    mov dword [0xe934b], esi
    call loc_1bb0
    call 0x50a30
    movsx eax, cx
    mov edi, dword [0xe97eb]
    mov dword [0xe934b], eax
    imul eax, edi, 0xb
    add eax, dword [0xe97e7]
    shl eax, 7
    add eax, 0x4c6b0
    call 0xa27f0
    mov ebx, dword [0xe97eb]
    mov edx, eax
    imul eax, ebx, 0xb
    mov ecx, dword [0xe97e7]
    mov esi, 0x4c6b0
    add eax, ecx
    mov edi, esp
    shl eax, 7
    mov ecx, edx
    add esi, eax
    cmp ecx, 4
    jae short loc_2094
    test cl, 1
    je short loc_208d
    db 0xa4    ; movsb byte es:[edi], byte [esi]
loc_208d:
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw word es:[edi], word [esi]
    jmp short loc_20bf
loc_2094:
    test edi, 1
    je short loc_209e
    db 0xa4    ; movsb byte es:[edi], byte [esi]
    dec ecx
loc_209e:
    test edi, 2
    je short loc_20ab
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
    sub ecx, 2
loc_20ab:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    test bl, 2
    je short loc_20b9
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
loc_20b9:
    test bl, 1
    je short loc_20bf
    db 0xa4    ; movsb byte es:[edi], byte [esi]
loc_20bf:
    mov bl, 0xff
    push 0xb519e
    mov ecx, 0xb511c
    mov byte [esp + edx + 4], bl
    xor bh, bh
    push 0xb5198
    mov byte [esp + edx + 9], bh
    mov ebx, 0xb5118
    mov edx, 0xb5114
    mov eax, dword [0x2272c]
    call 0x632b1
    cmp eax, -1
    jne short loc_2125
    imul eax, dword [0xe97eb], 0xb
    add eax, dword [0xe97e7]
    shl eax, 7
    add eax, 0x4c6b0
    push eax
    push 0x3118
    push 0xbc0a0
    call 0xa27b9
    add esp, 0xc
    mov eax, 0xbc0a0
    call 0x16030
loc_2125:
    mov ecx, 0x300
    mov edi, 0x1af4a4
    xor edx, edx
    xor eax, eax
    mov dl, byte [esp + 0x100]
    cmp ecx, 4
    jae short loc_214c
    test cl, 1
    je short loc_2145
    db 0xaa    ; stosb byte es:[edi], al
loc_2145:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_2177
loc_214c:
    test edi, 1
    je short loc_2156
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_2156:
    test edi, 2
    je short loc_2163
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_2163:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_2171
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_2171:
    test bl, 1
    je short loc_2177
    db 0xaa    ; stosb byte es:[edi], al
loc_2177:
    mov eax, edx
    call loc_0780
    call 0x583f0
    mov eax, edx
    xor cl, cl
    call loc_1370
    mov byte [0xa3d7], cl
    mov byte [0x24658d], cl
    call 0x50790
    mov eax, 0x312c
    call 0x5a2a0
    test dl, 4
    jne short loc_21e0
    test dl, 8
    jne short loc_21e0
    test dl, 0x20
    je short loc_21ff
    cmp dword [0xe97a7], 2
    jne short loc_21e0
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xa2, 0x52, 0x0b, 0x00, 0x02    ; mov byte [eax*2 + 0xb52a2], 2
    jmp short loc_21ff
loc_21e0:
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xa2, 0x52, 0x0b, 0x00, 0x04    ; mov byte [eax*2 + 0xb52a2], 4
loc_21ff:
    cmp dword [0xe97a7], 1
    jne short loc_2217
    test byte [esp + 0x100], 0x20
    jne short loc_2217
    call 0x22710
loc_2217:
    mov cx, word [0x261210]
    jmp near loc_22be
loc_2223:
    movsx edx, cx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5240]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x1c0bbc]
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + 0x2385bc]
    cmp ax, 0x35b
    jb short loc_2269
    jbe short loc_226f
    cmp ax, 0x43a
    je short loc_226f
    jmp short loc_22b3
loc_2269:
    cmp ax, 0xc8
    jne short loc_22b3
loc_226f:
    movsx edx, cx
    mov eax, edx
    call loc_03a0
    mov eax, edx
    call loc_04a0
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ebx, ebx
    db 0x66, 0x89, 0x1c, 0x45, 0xb2, 0x51, 0x0b, 0x00    ; mov word [eax*2 + 0xb51b2], bx
    db 0x66, 0x89, 0x1c, 0x45, 0x12, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb5212], bx
    xor dl, dl
    db 0x66, 0x89, 0x1c, 0x45, 0x34, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb5234], bx
    db 0x88, 0x14, 0x45, 0xd9, 0x52, 0x0b, 0x00    ; mov byte [eax*2 + 0xb52d9], dl
loc_22b3:
    movsx eax, cx
    db 0x66, 0x8b, 0x0c, 0x45, 0x08, 0x11, 0x26, 0x00    ; mov cx, word [eax*2 + 0x261108]
loc_22be:
    test cx, cx
    jge near loc_2223
    call loc_1e90
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    xor ecx, ecx
    sub eax, edx
    mov edx, 0x1c08a4
    xor ebx, ebx
    db 0x89, 0x14, 0x45, 0xe5, 0x52, 0x0b, 0x00    ; mov dword [eax*2 + 0xb52e5], edx
    xor edx, edx
    xor eax, eax
    call 0x46520
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    xor ch, ch
    add eax, 0xb4f00
    xor edx, edx
    call 0x47d00
    call 0x7168d
    mov ax, word [0xe97e7]
    mov byte [0xe9827], ch
    inc eax
    mov word [0xe8cca], dx
    mov word [0xe92fb], ax
    call loc_1ce0
    mov cx, word [0x8d78]
    dec ecx
    jmp short loc_2365
loc_2351:
    movsx eax, cx
    mov edx, dword [eax*4 + 0x481e0]
    mov edx, dword [edx]
    dec ecx
    mov dword [eax*4 + 0x3bee0], edx
loc_2365:
    test cx, cx
    jge short loc_2351
    mov dh, 1
    xor ecx, ecx
    xor ebx, ebx
    mov byte [0x22747], dh
    call 0x7be2c
    call loc_1b10
    xor edx, edx
    xor eax, eax
    mov edi, 0x971d8
    call 0x46520
    call 0x50a30
    xor eax, eax
    mov edx, 0x10000
    call 0x76795
    call 0x17f30
    movsx eax, word [0x261216]
    mov ecx, 0x10
    call 0x18420
    mov eax, 0x1010101
    cmp ecx, 4
    jae short loc_23cc
    test cl, 1
    je short loc_23c5
    db 0xaa    ; stosb byte es:[edi], al
loc_23c5:
    shr ecx, 1
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    jmp short loc_23f7
loc_23cc:
    test edi, 1
    je short loc_23d6
    db 0xaa    ; stosb byte es:[edi], al
    dec ecx
loc_23d6:
    test edi, 2
    je short loc_23e3
    db 0x66, 0xab    ; stosw word es:[edi], ax
    sub ecx, 2
loc_23e3:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xab    ; rep stosd dword es:[edi], eax
    test bl, 2
    je short loc_23f1
    db 0x66, 0xab    ; stosw word es:[edi], ax
loc_23f1:
    test bl, 1
    je short loc_23f7
    db 0xaa    ; stosb byte es:[edi], al
loc_23f7:
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor edx, edx
    db 0x66, 0x89, 0x14, 0x45, 0x44, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb5244], dx
    call loc_1920
    call loc_19b0
    add esp, 0x104
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    add byte [eax], al
    push ebx
    push ecx
    push esi
    push edi
    cmp byte [0x10ddf8], 0
    je short loc_244f
    xor bh, bh
    mov eax, 0xffffffff
    mov byte [0x10ddf8], bh
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_244f:
    cwde
    db 0x66, 0x8b, 0x1c, 0x45, 0xc4, 0x5c, 0x24, 0x00    ; mov bx, word [eax*2 + 0x245cc4]
loc_2458:
    test bx, bx
    jl near loc_25f8
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 5
    jne near loc_25e8
    cmp word [eax + 0x1c0bca], 0x3e8
    jge near loc_25e8
    movsx eax, dx
    cmp eax, -1
    jne short loc_248e
    mov edx, ebx
loc_248e:
    movsx esi, bx
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    imul ecx, esi, 0x2c
    cmp dword [eax + 0x4ea07], 0
    jne near loc_255c
    movsx eax, word [ecx + 0x1c0bca]
    test byte [eax + 0xe7240], 0x10
    jne near loc_25d6
    mov si, word [ecx + 0x1c0bca]
    test si, si
    je short loc_2504
    xor eax, eax
    movsx edx, dx
    mov ax, si
    call 0x5aca0
    mov di, word [ecx + 0x1c0bcc]
    test di, di
    je short loc_2504
    cmp di, word [ecx + 0x1c0bca]
    je short loc_2504
    cmp di, 0x1c2
    jge short loc_2504
    movsx eax, di
    call 0x5ace0
loc_2504:
    movsx ecx, bx
    imul eax, ecx, 0x2c
    movsx edx, word [eax + 0x1c0bbc]
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + 0x2385c6]
    xor ah, ah
    db 0x66, 0x3d, 0x16, 0x00    ; cmp ax, 0x16
    je near loc_25d6
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov dword [eax + 0x4ea07], 1
    movsx eax, bx
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x1c0bca]
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_255c:
    mov di, word [ecx + 0x1c0bcc]
    cmp di, 0x1c2
    jge short loc_25d6
    test di, di
    je short loc_257c
    xor eax, eax
    movsx edx, dx
    mov ax, di
    call 0x5aca0
loc_257c:
    movsx eax, bx
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x1c0bca]
    test byte [edx + 0xe7240], 1
    jne short loc_25a7
    mov dx, word [eax + 0x1c0bcc]
    test dx, dx
    je short loc_25b9
    cmp dx, word [eax + 0x1c0bca]
    je short loc_25b9
loc_25a7:
    movsx eax, bx
    imul eax, eax, 0x2c
    movsx eax, word [eax + 0x1c0bca]
    call 0x5ace0
loc_25b9:
    movsx ecx, bx
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    xor edi, edi
    mov dword [eax + 0x4ea07], edi
loc_25d6:
    movsx eax, bx
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x1c0bca]
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_25e8:
    movsx eax, bx
    db 0x66, 0x8b, 0x1c, 0x45, 0xa4, 0xc8, 0x1b, 0x00    ; mov bx, word [eax*2 + 0x1bc8a4]
    jmp near loc_2458
loc_25f8:
    mov eax, 0xffffffff
    pop edi
    pop esi
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
    mov edi, eax
    mov si, word [0x2454d2]
loc_261e:
    test si, si
    jl near loc_2737
    movsx ecx, si
    imul ecx, ecx, 0x2c
    cmp di, word [ecx + 0x1c0bca]
    jne near loc_2727
    mov ax, word [0xe54c4]
    add ecx, 0x1c0ba4
loc_2646:
    dec eax
    test ax, ax
    jge short loc_269c
    mov ax, word [0x2454c8]
loc_2652:
    test ax, ax
    jl near loc_2727
    movsx edx, ax
    imul edx, edx, 0x2c
    mov bx, word [ecx + 0x18]
    cmp bx, word [edx + 0x1c0bbc]
    jne near loc_2717
    mov dx, word [edx + 0x1c0bca]
    cmp dx, 0x14
    jb short loc_26b7
    jbe near loc_26ec
    cmp dx, 0x1e
    jb near loc_2717
    jbe short loc_26c7
    cmp dx, 0x20
    jbe short loc_26ec
    jmp near loc_2717
loc_269c:
    movsx edx, ax
    mov bx, word [ecx + 0x18]
    db 0x66, 0x3b, 0x1c, 0x55, 0xb0, 0xdc, 0x04, 0x00    ; cmp bx, word [edx*2 + 0x4dcb0]
    jne short loc_2646
    mov edx, 1
    jmp near loc_2739
loc_26b7:
    cmp dx, 0xb
    jb short loc_2717
    jbe short loc_26c7
    cmp dx, 0x12
    je short loc_26ec
    jmp short loc_2717
loc_26c7:
    movsx ebx, ax
    lea edx, [ebx*8]
    add edx, ebx
    lea edx, [edx*8]
    sub edx, ebx
    cmp dword [edx + 0x4ea17], 0
    je short loc_2717
    mov edx, 1
    jmp short loc_2739
loc_26ec:
    movsx ebx, ax
    lea edx, [ebx*8]
    add edx, ebx
    lea edx, [edx*8]
    sub edx, ebx
    cmp dword [edx + 0x4ea07], 0
    je short loc_2717
    mov edx, 1
    mov eax, edx
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2717:
    movsx edx, ax
    db 0x66, 0x8b, 0x04, 0x55, 0xa4, 0xf7, 0x1a, 0x00    ; mov ax, word [edx*2 + 0x1af7a4]
    jmp near loc_2652
loc_2727:
    movsx esi, si
    db 0x66, 0x8b, 0x34, 0x75, 0xa4, 0xf7, 0x1a, 0x00    ; mov si, word [esi*2 + 0x1af7a4]
    jmp near loc_261e
loc_2737:
    xor edx, edx
loc_2739:
    mov eax, edx
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    cmp ax, 0x30d
    jb short loc_2792
    jbe near loc_27bb
    cmp ax, 0x491
    jb short loc_2781
    jbe near loc_27bb
    cmp ax, 0x49a
    jb near loc_27be
    cmp ax, 0x49b
    jbe short loc_27bb
    cmp ax, 0x1127
    je short loc_27bb
    xor al, al
    ret
loc_2781:
    cmp ax, 0x44e
    jb short loc_27be
    jbe short loc_27bb
    cmp ax, 0x478
    je short loc_27bb
    xor al, al
    ret
loc_2792:
    cmp ax, 0x18b
    jb short loc_27af
    jbe short loc_27bb
    cmp ax, 0x1bf
    jb short loc_27be
    cmp ax, 0x1c1
    jbe short loc_27bb
    cmp ax, 0x2cd
    je short loc_27bb
    xor al, al
    ret
loc_27af:
    cmp ax, 0x96
    jb short loc_27be
    cmp ax, 0x9f
    ja short loc_27be
loc_27bb:
    mov al, 1
    ret
loc_27be:
    xor al, al
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
%endif
