; Session and game-state handlers.
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
    sub esp, 8
    mov dword [esp + 4], eax
    movsx ecx, ax
    lea edx, [ecx*4]
    add edx, ecx
    db 0x8b, 0x04, 0x55, 0x66, 0xcc, 0x11, 0x00    ; mov eax, dword [edx*2 + 0x11cc66]
    mov edx, ecx
    shl edx, 7
    sub edx, ecx
    lea edx, [edx*4]
    sub edx, ecx
    mov esi, 0xf1720
    add edx, edx
    add esi, edx
    mov dx, word [esi + 0x34c]
    mov dword [esp], eax
    cmp dx, 1
    je near loc_0bee
    shr eax, 0x17
    and eax, 1
    mov bx, word [esi + 0x280]
    mov dword [esi + 0x280], eax
    movsx eax, bx
    cmp eax, dword [esi + 0x280]
    jle short loc_007e
    mov byte [esi + 0x3f5], 9
loc_007e:
    test byte [esp + 2], 0x40
    je short loc_00b8
    cmp word [esi + 0x352], 0
    jne short loc_00b8
    cmp word [esi + 0x312], 0
    jne short loc_00a3
    cmp word [esi + 0x334], 0
    jne short loc_00b8
loc_00a3:
    mov eax, 0x50
    mov edx, esi
    mov word [esi + 0x352], 0xe
    call 0x15e50
loc_00b8:
    test dword [esp], 0xfb799f00
    jne short loc_00cf
    mov word [esi + 0x37e], 0
    jmp near loc_0bee
loc_00cf:
    cmp word [esi + 0x37e], 0
    jne near loc_0bee
    mov dl, byte [esp + 2]
    test dl, 2
    jne near loc_0bee
    mov word [esi + 0x37e], 1
    test dl, 0x20
    je short loc_015f
    xor bl, bl
    mov byte [0x353ae9], bl
    cmp word [0x125cf3], 0
    sete al
    xor ah, ah
    mov word [0x125cf3], ax
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jne short loc_0128
    test byte [esp], 0x20
    je short loc_0128
    mov word [0x125cf3], 2
loc_0128:
    cmp word [0x125cf3], 0
    je short loc_0143
    call 0x89478
    call 0x91f54
    call loc_2d2c
    jmp short loc_015f
loc_0143:
    cmp dword [0x1b8ab4], 0
    je short loc_0151
    call 0x89473
loc_0151:
    mov cl, 1
    mov byte [0x12622d], cl
    mov byte [0x12622f], cl
loc_015f:
    cmp word [0x125cf3], 0
    jne near loc_0bee
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522de], 0
    jle near loc_0bee
    test byte [esp + 3], 0x40
    je short loc_01d2
    movsx eax, word [esi + 0x31e]
    cmp eax, -1
    jne short loc_01d2
    mov al, byte [esi + 0x3c9]
    dec al
    cmp al, 4
    ja short loc_01d2
    and eax, 0xff
    jmp dword cs:[eax*4 + 0x45974]
    or byte [esp + 3], 2
    jmp short loc_01d2
    or byte [esp + 3], 1
    jmp short loc_01d2
    or byte [esp + 1], 0x80
    jmp short loc_01d2
    or byte [esp + 2], 1
    jmp short loc_01d2
    or byte [esp + 1], 0x10
loc_01d2:
    test byte [esp + 1], 0x80
    je short loc_022d
    cmp word [esi + 0x354], 0
    jle short loc_022d
    mov ch, byte [esi + 0x3d0]
    test ch, ch
    sete al
    mov byte [esi + 0x3d0], al
    mov eax, esi
    call 0x45230
    mov eax, 0xd5
    movsx edx, word [esi + 0x340]
    mov byte [esi + 0x3c9], 5
    call loc_274c
    mov ah, byte [esi + 0x3d0]
    mov edx, esi
    test ah, ah
    sete al
    xor ah, ah
    db 0x05, 0x6a, 0x00, 0x00, 0x00    ; add eax, 0x6a
    cwde
    call 0x15e50
loc_022d:
    test byte [esp + 1], 0x10
    je short loc_027e
    mov cx, word [esi + 0x38a]
    cmp cx, 0x190
    jne near loc_0bee
    mov edi, ecx
    mov eax, 0xd9
    dec edi
    movsx edx, word [esi + 0x340]
    mov word [esi + 0x38a], di
    call loc_274c
    mov eax, 0xc
    mov edx, esi
    mov byte [esi + 0x3c9], 2
    call 0x15e50
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_027e:
    movsx eax, word [esi + 0x31e]
    cmp eax, -1
    jne near loc_0424
    test byte [esp + 2], 0x10
    jne short loc_02a9
    test byte [esp + 3], 8
    jne short loc_02a9
    cmp byte [esi + 0x3e4], 0
    je near loc_0424
loc_02a9:
    mov cl, byte [esp + 3]
    mov dword [esi + 0x22c], 0x34
    test cl, 8
    setne al
    mov ch, byte [esi + 0x3e4]
    xor ah, ah
    test ch, ch
    je short loc_02cf
    mov byte [esi + 0x3e4], ah
loc_02cf:
    mov dl, byte [esi + 0x3c9]
    xor ebx, ebx
loc_02d7:
    cmp bx, 9
    jge near loc_03d1
    inc ebx
    cmp dl, 7
    ja near loc_03d3
    xor ecx, ecx
    mov cl, dl
    jmp dword cs:[ecx*4 + 0x45988]
    cmp word [esi + 0x388], 0
    jle short loc_030b
    cmp bx, 1
    jg near loc_03d3
loc_030b:
    test ax, ax
    je short loc_0314
loc_0310:
    mov dl, 5
    jmp short loc_02d7
loc_0314:
    mov dl, 3
    jmp short loc_02d7
    cmp word [esi + 0x386], 0
    jle short loc_032c
    cmp bx, 1
    jg near loc_03d3
loc_032c:
    test ax, ax
    je short loc_0310
loc_0331:
    mov dl, 7
    jmp short loc_02d7
    cmp word [esi + 0x38a], 0
    jle short loc_0349
    cmp bx, 1
    jg near loc_03d3
loc_0349:
    test ax, ax
    je short loc_0352
    mov dl, 3
    jmp short loc_02d7
loc_0352:
    mov dl, 1
    jmp short loc_02d7
    cmp word [esi + 0x31c], 0
    jle short loc_036a
    cmp bx, 1
    jg near loc_03d3
loc_036a:
    test ax, ax
    je short loc_0376
loc_036f:
    mov dl, 4
    jmp near loc_02d7
loc_0376:
    mov dl, 2
    jmp near loc_02d7
    cmp word [esi + 0x33a], 0
    jle short loc_038d
    cmp bx, 1
    jg short loc_03d3
loc_038d:
    test ax, ax
    je short loc_0331
    mov dl, 2
    jmp near loc_02d7
    cmp word [esi + 0x354], 0
    jle short loc_03a9
    cmp bx, 1
    jg short loc_03d3
loc_03a9:
    test ax, ax
    je short loc_036f
loc_03ae:
    mov dl, 6
    jmp near loc_02d7
    cmp word [esi + 0x39c], 0
    jle short loc_03c5
    cmp bx, 1
    jg short loc_03d3
loc_03c5:
    test ax, ax
    je short loc_03ae
    mov dl, 1
    jmp near loc_02d7
loc_03d1:
    xor dl, dl
loc_03d3:
    mov al, dl
    dec al
    mov byte [esi + 0x3c9], dl
    cmp al, 6
    ja short loc_0424
    and eax, 0xff
    jmp dword cs:[eax*4 + 0x459a8]
    mov eax, 3
    jmp short loc_041d
    mov eax, 0x5a
    jmp short loc_041d
    mov eax, 0x5b
    jmp short loc_041d
    mov eax, 0x58
    jmp short loc_041d
    mov eax, 0x65
    jmp short loc_041d
    mov eax, 0x59
    jmp short loc_041d
    mov eax, 6
loc_041d:
    mov edx, esi
    call 0x15e50
loc_0424:
    mov eax, dword [esp]
    and eax, 0xf00
    shr eax, 8
    lea ecx, [eax - 1]
    test ecx, ecx
    jbe short loc_0447
    cmp word [esi + 0x334], 0
    jle short loc_0447
    mov word [esi + 0x31a], cx
loc_0447:
    cmp dword [esi + 0x258], 0x1624
    jg near loc_0976
    cmp word [esi + 0x384], 0
    jne near loc_0976
    cmp word [esi + 0x334], 0
    jne near loc_0976
    cmp word [esi + 0x352], 0
    jne near loc_0976
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x2522c8], 0x20
    jbe near loc_0976
    cmp word [esi + 0x32a], 0
    jne near loc_0976
    cmp word [esi + 0x328], 0
    jne near loc_0976
    cmp word [esi + 0x392], 0
    je short loc_04db
    cmp byte [esi + 0x3d1], 0
    je near loc_0904
    movsx eax, word [esi + 0x392]
    cmp eax, -9
    jne near loc_0904
loc_04db:
    cmp ecx, 0xa
    je short loc_04e9
    cmp ecx, 0xb
    jne near loc_0619
loc_04e9:
    mov ax, word [esi + 0x312]
    cmp ecx, 0xa
    jne short loc_04fc
    mov ecx, 0xffffffff
    jmp short loc_0501
loc_04fc:
    mov ecx, 1
loc_0501:
    xor ebx, ebx
loc_0503:
    test ax, ax
    jl short loc_050e
    db 0x66, 0x3d, 0x0a, 0x00    ; cmp ax, 0xa
    jl short loc_052b
loc_050e:
    db 0x66, 0x3d, 0x13, 0x00    ; cmp ax, 0x13
    jne near loc_0619
    movsx edx, word [esi + 0x2a4]
    test edx, 0x80000
    je near loc_0619
loc_052b:
    db 0x66, 0x3d, 0x13, 0x00    ; cmp ax, 0x13
    jne short loc_0544
    cmp ecx, -1
    jne short loc_053d
    mov eax, 5
    jmp short loc_0560
loc_053d:
    mov eax, 7
    jmp short loc_0560
loc_0544:
    add eax, ecx
    db 0x66, 0x3d, 0x06, 0x00    ; cmp ax, 6
    jne short loc_0560
    movsx edx, word [esi + 0x2a4]
    test edx, 0x80000
    je short loc_0560
    mov eax, 0x13
loc_0560:
    movsx edx, ax
    cmp edx, -1
    jne short loc_056f
    mov eax, 9
    jmp short loc_0577
loc_056f:
    db 0x66, 0x3d, 0x0a, 0x00    ; cmp ax, 0xa
    jne short loc_0577
    xor eax, eax
loc_0577:
    movsx edx, ax
    cmp byte [edx + esi + 0x3d3], 0
    je short loc_05b1
    cmp word [esi + edx*2 + 0x2a6], 0
    jle short loc_05b1
    db 0x66, 0x3d, 0x0e, 0x00    ; cmp ax, 0xe
    jne short loc_05a9
    movsx edx, word [esi + 0x2a4]
    test edx, 0x80000
    je short loc_05a9
    mov eax, 0x13
loc_05a9:
    movsx ecx, ax
    jmp near loc_0619
loc_05b1:
    db 0x66, 0x3d, 0x13, 0x00    ; cmp ax, 0x13
    jne short loc_05db
    cmp word [esi + 0x2cc], 0
    jne short loc_05db
    cmp byte [esi + 0x3e1], 0
    je short loc_05db
    cmp word [esi + 0x2c2], 0
    jle short loc_05db
    mov ecx, 0xe
    jmp short loc_0619
loc_05db:
    db 0x66, 0x3d, 0x0e, 0x00    ; cmp ax, 0xe
    jne short loc_0605
    cmp word [esi + 0x2c2], 0
    jne short loc_0605
    cmp byte [esi + 0x3e1], 0
    je short loc_0605
    cmp word [esi + 0x2cc], 0
    jle short loc_0605
    mov ecx, 0x13
    jmp short loc_0619
loc_0605:
    inc ebx
    cmp bx, 0xa
    jne near loc_0503
    mov eax, esi
    xor edx, edx
    call 0x279d0
loc_0619:
    mov eax, 0xffffffff
    cmp ecx, 0xd
    jne short loc_0673
    cmp word [esi + 0x2c0], 0
    jne short loc_0673
    mov ax, word [0x2d6bd4]
loc_0633:
    test ax, ax
    jl short loc_0673
    movsx edx, ax
    imul edx, edx, 0x2c
    cmp word [edx + 0x2522c2], 0x1a
    jne short loc_0666
    mov dx, word [edx + 0x2522d2]
    cmp dx, word [esi + 0x340]
    jne short loc_0666
    mov ecx, 0x12
    mov byte [esi + 0x3e0], 1
    jmp short loc_0673
loc_0666:
    movsx edx, ax
    db 0x66, 0x8b, 0x04, 0x55, 0xb4, 0x0e, 0x24, 0x00    ; mov ax, word [edx*2 + 0x240eb4]
    jmp short loc_0633
loc_0673:
    cmp ecx, 0xe
    jne near loc_06e1
    mov ebx, dword [esp + 4]
    cmp bx, word [0x1256c6]
    jne short loc_0690
    mov byte [0x12622f], 1
loc_0690:
    mov di, word [esi + 0x312]
    cmp di, 0x13
    je short loc_06d2
    cmp di, 0xe
    je short loc_06d2
    cmp word [esi + 0x2cc], 0
    jle short loc_06c8
    movsx edx, word [esi + 0x2a4]
    test edx, 0x80000
    jne short loc_06dc
    cmp word [esi + 0x2c2], 0
    jne short loc_06e1
    jmp short loc_06dc
loc_06c8:
    cmp word [esi + 0x2c2], 0
    jmp short loc_06e1
loc_06d2:
    cmp word [esi + 0x312], 0xe
    jne short loc_06e1
loc_06dc:
    mov ecx, 0x13
loc_06e1:
    cmp byte [esi + 0x3d1], 0
    je short loc_0703
    mov bh, byte [esp + 2]
    or bh, 8
    mov word [esi + 0x392], 0xfff7
    mov byte [esp + 2], bh
    jmp near loc_0904
loc_0703:
    cmp byte [ecx + esi + 0x3d3], 0
    je near loc_0904
    movsx edx, word [esi + 0x312]
    cmp edx, ecx
    je near loc_0904
    cmp ecx, 0x13
    ja near loc_0904
    jmp dword cs:[ecx*4 + 0x459c4]
    mov eax, esi
    xor edx, edx
    jmp near loc_08ff
    cmp word [esi + 0x2b8], 0
    jne short loc_0765
    cmp word [esi + 0x384], 0
    jne short loc_0765
    mov ax, word [esi + 0x312]
    mov word [esi + 0x384], 0x20
    mov word [esi + 0x398], ax
loc_0765:
    mov edx, 9
    jmp near loc_08fd
    cmp word [esi + 0x2ba], 0
    jne short loc_079a
    cmp word [esi + 0x384], 0
    jne short loc_079a
    mov ax, word [esi + 0x312]
    mov word [esi + 0x384], 0x20
    mov word [esi + 0x398], ax
loc_079a:
    mov edx, 0xa
    jmp near loc_08fd
    cmp word [esi + 0x2bc], 0
    jne short loc_07cf
    cmp word [esi + 0x384], 0
    jne short loc_07cf
    mov ax, word [esi + 0x312]
    mov word [esi + 0x384], 0x20
    mov word [esi + 0x398], ax
loc_07cf:
    mov edx, 0xb
    jmp near loc_08fd
    cmp word [esi + 0x2be], 0
    jne short loc_0804
    cmp word [esi + 0x384], 0
    jne short loc_0804
    mov ax, word [esi + 0x312]
    mov word [esi + 0x384], 0x20
    mov word [esi + 0x398], ax
loc_0804:
    mov edx, 0xc
    jmp near loc_08fd
    cmp word [esi + 0x2c4], 0
    jne short loc_0839
    cmp word [esi + 0x384], 0
    jne short loc_0839
    mov ax, word [esi + 0x312]
    mov word [esi + 0x384], 0x20
    mov word [esi + 0x398], ax
loc_0839:
    mov edx, 0xf
    jmp near loc_08fd
    cmp word [esi + 0x2c8], 0
    jne short loc_086e
    cmp word [esi + 0x384], 0
    jne short loc_086e
    mov ax, word [esi + 0x312]
    mov word [esi + 0x384], 0x20
    mov word [esi + 0x398], ax
loc_086e:
    mov edx, 0x11
    jmp near loc_08fd
    cmp word [esi + ecx*2 + 0x2a6], 0
    jne short loc_08a4
    cmp word [esi + 0x384], 0
    jne short loc_08a4
    mov word [esi + 0x384], 0x20
    mov ax, word [esi + 0x312]
    mov word [esi + 0x398], ax
loc_08a4:
    movsx edx, cx
    jmp short loc_08fd
    test ax, ax
    jl short loc_0904
    mov word [esi + 0x312], 0x12
    mov word [esi + 0x314], 0xffff
    mov word [esi + 0x392], 0xa
    jmp short loc_0904
    cmp word [esi + 0x2c0], 0
    jle short loc_0904
    cmp byte [esi + 0x3e0], 0
    je short loc_0904
    mov edx, 0xd
    jmp short loc_08fd
    cmp word [esi + 0x2c6], 0
    jle short loc_0904
    cmp byte [esi + 0x3e3], 0
    je short loc_0904
    mov edx, 0x10
loc_08fd:
    mov eax, esi
loc_08ff:
    call 0x279d0
loc_0904:
    test byte [esp + 2], 8
    je near loc_0976
    cmp word [esi + 0x312], 0
    jle short loc_0976
    cmp byte [esi + 0x3d1], 0
    jne short loc_0945
    cmp word [esi + 0x392], 0
    jne short loc_0945
    mov eax, 0x49
    mov byte [esi + 0x3d1], 1
    mov edx, esi
    mov word [esi + 0x392], 0xffff
    jmp short loc_0971
loc_0945:
    cmp byte [esi + 0x3d1], 1
    jne short loc_0976
    movsx eax, word [esi + 0x392]
    cmp eax, -9
    jne short loc_0976
    mov eax, 0x4a
    mov byte [esi + 0x3d1], 0
    mov edx, esi
    mov word [esi + 0x392], 0xa
loc_0971:
    call 0x15e50
loc_0976:
    test byte [esp + 3], 1
    je near loc_0a77
    movsx eax, word [esi + 0x31e]
    cmp eax, -1
    jne near loc_0a77
    movsx edx, word [esi + 0x38e]
    cmp edx, eax
    jne near loc_0a58
    cmp word [esi + 0x31c], 0
    jle near loc_0a39
    push 0xa
    push eax
    push 0
    push 0
    movsx eax, word [esi + 0x298]
    push eax
    push 0
    push 0
    mov ecx, dword [esi + 0x21c]
    mov ebx, dword [esi + 0x218]
    push -0x40
    mov edx, dword [esi + 0x214]
    add ecx, 0x1e00
    push 0x214
    movsx eax, word [esi + 0x29e]
    mov byte [esi + 0x3c9], 3
    call 0x192d0
    mov word [esi + 0x38e], ax
    cwde
    lea edx, [eax*8]
    add edx, eax
    lea edx, [edx*8]
    sub edx, eax
    xor ebp, ebp
    mov dword [edx + 0x8b0f7], ebp
    mov dword [edx + 0x8b0f3], ebp
    imul edx, eax, 0x2c
    xor ecx, ecx
    mov eax, dword [esp + 4]
    mov word [edx + 0x2522de], cx
    mov word [edx + 0x2522d6], ax
    mov eax, 0x2f
    jmp short loc_0a3e
loc_0a39:
    mov eax, 0x31
loc_0a3e:
    mov edx, esi
    call 0x15e50
    mov eax, 0x46
    movsx edx, word [esi + 0x38e]
    call loc_274c
    jmp short loc_0a77
loc_0a58:
    mov eax, 0x46
    call loc_274c
    mov eax, 0x30
    mov edx, esi
    mov word [esi + 0x38e], 0xffff
    call 0x15e50
loc_0a77:
    test byte [esp + 2], 1
    je near loc_0b08
    mov di, word [esi + 0x33a]
    test di, di
    jle near loc_0b08
    movsx edx, word [esi + 0x340]
    imul edx, edx, 0x2c
    mov eax, dword [0x123a44]
    movsx ecx, word [edx + 0x2522de]
    cmp ecx, eax
    jge short loc_0b08
    sub eax, ecx
    mov ecx, eax
    movsx eax, di
    cmp eax, ecx
    jbe short loc_0ae0
    movsx eax, word [esi + 0x340]
    imul edx, eax, 0x2c
    sub edi, ecx
    mov word [esi + 0x33a], di
    mov ax, word [0x123a44]
    mov word [edx + 0x2522de], ax
    mov byte [esi + 0x3c9], 1
    jmp short loc_0af7
loc_0ae0:
    add word [edx + 0x2522de], di
    mov eax, esi
    mov word [esi + 0x33a], 0
    call 0x27ab0
loc_0af7:
    mov eax, 0xd8
    movsx edx, word [esi + 0x340]
    call loc_274c
loc_0b08:
    test byte [esp + 3], 2
    je near loc_0bd4
    movsx eax, word [esi + 0x31e]
    cmp eax, -1
    jne near loc_0bd4
    cmp word [esi + 0x388], 0
    jle near loc_0bc8
    mov bl, byte [esi + 0x3cb]
    test bl, bl
    sete al
    mov byte [esi + 0x3cb], al
    test al, al
    je short loc_0b8a
    mov edx, dword [esi + 0x39e]
    mov byte [esi + 0x3c9], 4
    test edx, edx
    jle short loc_0b72
    mov eax, edx
    call 0x91f38
    mov eax, 0xf5
    call loc_2bac
    mov dword [esi + 0x39e], 0
loc_0b72:
    mov eax, 0x31
    movsx edx, word [esi + 0x340]
    call loc_274c
    mov eax, 0x34
    jmp short loc_0bcd
loc_0b8a:
    movsx edx, word [esi + 0x340]
    mov byte [esi + 0x3ed], al
    mov eax, 0x33
    mov dword [esi + 0x254], 0
    call loc_274c
    mov eax, 0x32
    call loc_278c
    mov eax, 0x31
    mov edx, esi
    call loc_278c
    mov eax, 0x35
    jmp short loc_0bcf
loc_0bc8:
    mov eax, 0x32
loc_0bcd:
    mov edx, esi
loc_0bcf:
    call 0x15e50
loc_0bd4:
    test byte [esp + 3], 0x10
    je short loc_0bee
    cmp word [esi + 0x34a], 0
    jne short loc_0bee
    mov word [esi + 0x34a], 0xfc00
loc_0bee:
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 8
    mov edi, eax
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov esi, 0xf1720
    add eax, eax
    add esi, eax
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov ax, word [edx + 0x2c9cd6]
    db 0x66, 0x3d, 0xfe, 0xff    ; cmp ax, 0xfffe
    jb short loc_0c57
    jbe near loc_0d30
    db 0x66, 0x3d, 0xff, 0xff    ; cmp ax, 0xffff
    je short loc_0c81
    jmp near loc_0d6a
loc_0c57:
    cmp ax, 0x7fff
    jne near loc_0d6a
    xor eax, eax
    mov word [edx + 0x2c9cd6], ax
    mov eax, 9
    mov edx, esi
    call 0x15e50
    inc byte [esi + 0x3ef]
    jmp near loc_1a1a
loc_0c81:
    mov bh, 8
    movsx ecx, word [0x2f2920]
    jmp short loc_0cab
loc_0c8c:
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    db 0x0f, 0xbf, 0x0c, 0x4d, 0x18, 0x28, 0x2f, 0x00    ; movsx ecx, word [ecx*2 + 0x2f2818]
    db 0x88, 0x3c, 0x45, 0xc2, 0x1a, 0x0f, 0x00    ; mov byte [eax*2 + 0xf1ac2], bh
loc_0cab:
    test ecx, ecx
    jge short loc_0c8c
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    xor edx, edx
    mov bx, word [0x125cf5]
    mov word [eax*8 + 0x2c9cd6], dx
    test bx, bx
    je short loc_0cf2
    movsx eax, bx
    mov word [0x125cf5], dx
    mov dword [0x1261e7], eax
    mov dword [0x1261d7], eax
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0cf2:
    mov eax, dword [0x1261e7]
    inc eax
    mov edx, dword [0x1261eb]
    mov dword [0x1261e7], eax
    test edx, edx
    je short loc_0d0c
    cmp eax, 0xa
    jg short loc_0d15
loc_0d0c:
    cmp dword [0x1261e7], 5
    jle short loc_0d1d
loc_0d15:
    xor esi, esi
    mov dword [0x1261e7], esi
loc_0d1d:
    mov eax, dword [0x1261e7]
    mov dword [0x1261d7], eax
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0d30:
    xor ebx, ebx
    mov word [edx + 0x2c9cd6], bx
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    mov word [esi + 0x358], 0xd0
    mov ax, word [eax*8 + 0x2c9cd8]
    mov word [esi + 0x35a], ax
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0d6a:
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov cx, word [eax + 0x2c9cd6]
    cmp cx, 0x2710
    jl short loc_0df3
    cmp cx, 0x3fff
    jge short loc_0df3
    cmp di, word [0x1256c6]
    je short loc_0da8
    cmp dword [0x125d47], 1
    jne short loc_0dd9
loc_0da8:
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + 0x2c9cd6]
    movsx ebx, word [esi + 0x340]
    db 0x81, 0xe8, 0x10, 0x27, 0x00, 0x00    ; sub eax, 0x2710
    and eax, 0xffff
    mov edx, ebx
    call loc_274c
loc_0dd9:
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    xor ecx, ecx
    mov word [eax*8 + 0x2c9cd6], cx
loc_0df3:
    test byte [esi + 0x3a2], 0x10
    jne near loc_1a1a
    movsx edx, word [esi + 0x340]
    imul edx, edx, 0x2c
    cmp word [edx + 0x2522de], 0
    jle near loc_1a1a
    cmp byte [0x12577e], 0
    je short loc_0e48
    movsx ebx, di
    lea eax, [ebx*4]
    add eax, ebx
    db 0xf6, 0x04, 0x45, 0x69, 0xcc, 0x11, 0x00, 0x20    ; test byte [eax*2 + 0x11cc69], 0x20
    je short loc_0e48
    mov eax, 0x2522b4
    add eax, edx
    mov edx, 2
    call 0x28be0
loc_0e48:
    cmp word [esi + 0x31e], 0
    jl short loc_0e94
    movsx edx, di
    lea eax, [edx*4]
    add edx, eax
    add edx, edx
    mov ax, word [edx + 0x11cc64]
    cwde
    test eax, eax
    jns short loc_0e6e
    neg eax
loc_0e6e:
    cmp eax, 0x300
    jg short loc_0e8a
    mov ax, word [edx + 0x11cc62]
    cwde
    test eax, eax
    jns short loc_0e83
    neg eax
loc_0e83:
    cmp eax, 0x300
    jle short loc_0e94
loc_0e8a:
    mov ecx, 0xffffffff
    jmp near loc_1678
loc_0e94:
    movsx edx, di
    lea eax, [edx*4]
    add eax, edx
    add eax, eax
    mov cl, byte [eax + 0x11cc69]
    test cl, 0x20
    jne short loc_0ec2
    test cl, 0x80
    jne short loc_0ec2
    mov byte [esi + 0x3e9], 0
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0ec2:
    cmp byte [esi + 0x3e9], 0
    jne near loc_1a1a
    movsx edx, di
    lea eax, [edx*4]
    add eax, edx
    db 0xf6, 0x04, 0x45, 0x69, 0xcc, 0x11, 0x00, 0x80    ; test byte [eax*2 + 0x11cc69], 0x80
    je short loc_0efd
    cmp word [esi + 0x31e], 0
    jl near loc_1a1a
    mov ecx, 0xffffffff
    jmp near loc_1678
loc_0efd:
    mov ebx, 0xffffffff
    mov word [0x1256c0], bx
    lea edx, [esp + 4]
    mov byte [esi + 0x3e9], 1
    mov eax, esi
    mov dword [esp + 4], ebx
    call 0x455d0
    cmp eax, 0x500
    jge short loc_0f83
    mov eax, dword [esp + 4]
    test ax, ax
    jl short loc_0f83
    cwde
    shl eax, 5
    cmp word [eax + 0x27e4c6], 0x230
    jne short loc_0f83
    mov bx, word [eax + 0x27e4ce]
    test bx, bx
    jle short loc_0f83
    movsx edx, bx
    imul edx, edx, 0xd
    cmp dword [edx + 0x123fd9], 0
    jne short loc_0f83
    cmp di, word [0x1256c6]
    jne short loc_0f83
    movsx edx, word [esi + 0x340]
    mov ax, word [eax + 0x27e4ce]
    and eax, 0xffff
    call loc_274c
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0f83:
    mov eax, dword [esp + 4]
    test ax, ax
    jl short loc_0fa7
    cwde
    shl eax, 5
    test byte [eax + 0x27e4c2], 0x10
    je short loc_0fa7
    cmp word [eax + 0x27e4ce], 0
    jne near loc_1a1a
loc_0fa7:
    cmp word [esi + 0x31e], 0
    jl short loc_1001
    movsx ecx, word [esi + 0x340]
    imul ecx, ecx, 0x2c
    push 1
    push 0x500
    push 0x1213fc
    push 0x1256c0
    push 0x1256c4
    movsx eax, word [esi + 0x29a]
    push 0x1256be
    mov ebx, dword [esi + 0x240]
    mov edx, dword [esi + 0x23c]
    push eax
    movsx ecx, word [ecx + 0x2522cc]
    mov eax, dword [esi + 0x238]
    call 0x696fc
    jmp near loc_126d
loc_1001:
    push 1
    push 0x500
    push 0x1213fc
    push 0x1256c0
    push 0x1256c4
    push 0x1256be
    movsx eax, word [esi + 0x29a]
    push eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov ebx, dword [esi + 0x21c]
    mov edx, dword [esi + 0x218]
    movsx ecx, word [eax + 0x2522cc]
    mov eax, dword [esi + 0x214]
    call 0x696fc
    movsx eax, word [0x1256c0]
    cmp eax, -1
    jne short loc_10c1
    movsx eax, word [0x1256c4]
    cmp eax, -1
    jne short loc_10c1
    movsx eax, word [0x1256be]
    cmp eax, -1
    jne short loc_10c1
    push 1
    push 0x500
    push 0x1213fc
    push 0x1256c0
    push 0x1256c4
    push 0x1256be
    movsx eax, word [esi + 0x29a]
    push eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov ebx, dword [esi + 0x21c]
    mov edx, dword [esi + 0x218]
    add ebx, 0x800
    movsx ecx, word [eax + 0x2522cc]
    mov eax, dword [esi + 0x214]
    call 0x696fc
loc_10c1:
    movsx eax, word [0x1256c0]
    cmp eax, -1
    jne short loc_1136
    movsx eax, word [0x1256c4]
    cmp eax, -1
    jne short loc_1136
    movsx eax, word [0x1256be]
    cmp eax, -1
    jne short loc_1136
    push 1
    push 0x500
    push 0x1213fc
    push 0x1256c0
    push 0x1256c4
    push 0x1256be
    movsx eax, word [esi + 0x29a]
    push eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov ebx, dword [esi + 0x21c]
    mov edx, dword [esi + 0x218]
    add ebx, 0x1000
    movsx ecx, word [eax + 0x2522cc]
    mov eax, dword [esi + 0x214]
    call 0x696fc
loc_1136:
    movsx eax, word [0x1256c0]
    cmp eax, -1
    jne near loc_126d
    movsx eax, word [0x1256c4]
    cmp eax, -1
    jne near loc_126d
    movsx eax, word [0x1256be]
    cmp eax, -1
    jne near loc_126d
    movsx ecx, word [esi + 0x340]
    imul ecx, ecx, 0x2c
    push 3
    push 0x500
    push 0x1213fc
    push 0x1256c0
    push 0x1256c4
    movsx eax, word [esi + 0x29a]
    mov ebx, dword [esi + 0x21c]
    push 0x1256be
    mov edx, dword [esi + 0x218]
    add ebx, 0x1000
    push eax
    movsx ecx, word [ecx + 0x2522cc]
    mov eax, dword [esi + 0x214]
    call 0x696fc
    mov cx, word [0x1256c0]
    test cx, cx
    jl near loc_1256
    movsx eax, cx
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x2522c2]
    cmp ax, 0x52b
    jb short loc_121c
    jbe near loc_1a1a
    cmp ax, 0x573
    jb short loc_1204
    jbe near loc_1a1a
    cmp ax, 0x1300
    jb short loc_11fe
    jbe near loc_1a1a
    cmp ax, 0x1302
    jmp short loc_1250
loc_11fe:
    cmp ax, 0xd7a
    jmp short loc_1250
loc_1204:
    cmp ax, 0x536
    jb short loc_1216
    jbe near loc_1a1a
    cmp ax, 0x538
    jmp short loc_1250
loc_1216:
    cmp ax, 0x52d
    jmp short loc_1250
loc_121c:
    cmp ax, 0x50e
    jb short loc_1240
    jbe near loc_1a1a
    cmp ax, 0x525
    jb short loc_123a
    jbe near loc_1a1a
    cmp ax, 0x529
    jmp short loc_1250
loc_123a:
    cmp ax, 0x520
    jmp short loc_1250
loc_1240:
    cmp ax, 0x25b
    jb short loc_1256
    jbe near loc_1a1a
    cmp ax, 0x2f1
loc_1250:
    je near loc_1a1a
loc_1256:
    mov eax, 0xffffffff
    mov word [0x1256c0], ax
    mov word [0x1256c4], ax
    mov word [0x1256be], ax
loc_126d:
    movsx eax, word [esi + 0x31e]
    cmp eax, -1
    jne short loc_12df
    movsx eax, word [0x1256c0]
    cmp eax, -1
    jne short loc_12df
    movsx eax, word [0x1256be]
    cmp eax, -1
    jne short loc_12df
    movsx eax, word [0x1256c4]
    cmp eax, -1
    jne short loc_12df
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x2522cc]
    lea eax, [edx*4]
    add eax, edx
    movsx eax, word [eax*8 + 0x2c9cd6]
    call 0x509a0
    test al, al
    je short loc_12df
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x2522cc]
    mov word [0x1256be], ax
loc_12df:
    mov cx, word [0x1256be]
    test cx, cx
    jl short loc_1305
    movsx edx, cx
    lea eax, [edx*4]
    add eax, edx
    test byte [eax*8 + 0x2c9cd7], 0x40
    jne near loc_1a1a
loc_1305:
    movsx eax, word [0x1256c0]
    cmp eax, -1
    jne short loc_1359
    movsx eax, word [0x1256c4]
    cmp eax, -1
    jne short loc_1359
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9cd6], 2
    jne short loc_1359
    mov edx, 0x1256c0
    movsx eax, word [esi + 0x340]
    call 0x454c0
    cmp eax, 0x500
    jle short loc_1359
    mov word [0x1256c0], 0xffff
loc_1359:
    mov cx, word [0x1256c0]
    test cx, cx
    jl near loc_164b
    mov ebx, 1
    movsx edx, cx
    movsx eax, di
    call 0x52880
    test al, al
    jne near loc_1a1a
    movsx edx, word [0x1256c0]
    imul ecx, edx, 0x2c
    mov ax, word [ecx + 0x2522c2]
    cmp ax, 0x233
    jb short loc_13c0
    jbe near loc_158b
    cmp ax, 0x23b
    jb short loc_13b5
    jbe short loc_13ea
    cmp ax, 0x42d
    je near loc_15fc
    jmp near loc_164b
loc_13b5:
    cmp ax, 0x239
    je short loc_13ea
    jmp near loc_164b
loc_13c0:
    cmp ax, 0x1f3
    jb short loc_13db
    jbe near loc_1709
    cmp ax, 0x1f6
    je near loc_1709
    jmp near loc_164b
loc_13db:
    cmp ax, 0x8e
    je near loc_14df
    jmp near loc_164b
loc_13ea:
    cmp dword [esi + 0x258], 0
    jne near loc_14b8
    cmp dword [0x125d4f], 0
    jne short loc_1411
    mov eax, 0x1c
    movsx edx, word [esi + 0x340]
    call loc_274c
loc_1411:
    mov dword [esi + 0x258], 0x1658
    mov bh, byte [esi + 0x3d1]
    mov word [esi + 0x396], 0x3a
    test bh, bh
    jne short loc_143e
    mov byte [esi + 0x3d1], 1
    mov word [esi + 0x392], 0xffff
loc_143e:
    mov eax, dword [0x123a44]
    mov edx, eax
    mov edi, 0xa
    sar edx, 0x1f
    idiv edi
    movsx ebx, word [esi + 0x340]
    imul ebx, ebx, 0x2c
    mov edx, dword [0x123a44]
    movsx ecx, word [ebx + 0x2522de]
    sub edx, eax
    cmp ecx, edx
    jg short loc_1496
    add eax, ecx
    mov word [ebx + 0x2522de], ax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x2522de]
    mov word [esi + 0x2a2], ax
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1496:
    cmp ecx, dword [0x123a44]
    jge near loc_1a1a
    mov ax, word [0x123a44]
    mov word [ebx + 0x2522de], ax
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_14b8:
    cmp dword [0x1243dc], 0
    jne near loc_1a1a
    mov eax, 0x4f
    movsx edx, word [esi + 0x340]
    call loc_274c
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_14df:
    mov edx, esp
    mov eax, esi
    call 0x455d0
    mov ebx, dword [esp]
    test bx, bx
    jl near loc_1a1a
    movsx eax, bx
    shl eax, 5
    cmp word [eax + 0x27e4c6], 0
    jne near loc_1a1a
    movsx ebx, word [0x1256c0]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    cmp dword [eax + 0x8b0e7], 0
    jne near loc_1a1a
    mov dword [eax + 0x8b0e7], 1
    imul eax, ebx, 0x2c
    mov dx, word [esi + 0x340]
    mov word [eax + 0x2522d2], dx
    mov al, byte [eax + 0x2522c5]
    mov byte [esi + 0x3ca], al
    test al, al
    je short loc_1579
    movsx eax, word [0x1256c0]
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x2522da]
    mov word [0x125cfd], ax
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1579:
    xor esi, esi
    mov word [0x125cfd], si
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_158b:
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp dword [eax + 0x8b0e7], 1
    je near loc_1a1a
    mov dword [eax + 0x8b0e7], 1
    mov ax, word [esi + 0x340]
    mov word [ecx + 0x2522d2], ax
    cwde
    imul eax, eax, 0x2c
    mov ecx, dword [0x123a44]
    movsx edx, word [eax + 0x2522de]
    cmp edx, ecx
    jge near loc_1a1a
    inc word [eax + 0x2522de]
    mov eax, 0x24
    movsx edx, word [esi + 0x340]
    call loc_274c
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_15fc:
    mov eax, 0x15
    movsx edx, word [esi + 0x340]
    call loc_274c
    movsx edx, word [esi + 0x340]
    imul edx, edx, 0x2c
    call 0x6dc5f
    xor ah, ah
    and al, 3
    db 0x05, 0x02, 0x00, 0x00, 0x00    ; add eax, 2
    sub word [edx + 0x2522de], ax
    mov byte [esi + 0x3f0], 0x30
    mov byte [esi + 0x3f1], 0x30
    mov byte [esi + 0x3f2], 0x40
    mov dword [esi + 0x274], 0x20
loc_164b:
    movsx edx, di
    lea eax, [edx*4]
    add eax, edx
    db 0xf6, 0x04, 0x45, 0x69, 0xcc, 0x11, 0x00, 0x20    ; test byte [eax*2 + 0x11cc69], 0x20
    je near loc_1a1a
    cmp word [esi + 0x31e], 0
    jl near loc_17f9
    mov ecx, 0xffffffff
loc_1678:
    test ecx, ecx
    jge near loc_17c8
    mov eax, dword [esi + 0x238]
    mov dword [esi + 0x214], eax
    mov eax, dword [esi + 0x23c]
    mov dword [esi + 0x218], eax
    mov eax, dword [esi + 0x240]
    mov dword [esi + 0x21c], eax
    mov ax, word [esi + 0x29a]
    mov word [esi + 0x298], ax
    lea ebx, [esi + 0x29e]
    mov edx, dword [esi + 0x218]
    mov eax, dword [esi + 0x214]
    mov word [esi + 0x31e], 0xffff
    call 0x6be57
    mov eax, esi
    call 0x45230
    movsx ecx, word [0x2d6bd4]
loc_16e0:
    test ecx, ecx
    jl near loc_17db
    imul eax, ecx, 0x2c
    cmp word [eax + 0x2522c2], 0x26d
    jne short loc_16ff
    xor edi, edi
    mov word [eax + 0x2522d6], di
loc_16ff:
    db 0x0f, 0xbf, 0x0c, 0x4d, 0xb4, 0x0e, 0x24, 0x00    ; movsx ecx, word [ecx*2 + 0x240eb4]
    jmp short loc_16e0
loc_1709:
    movsx ecx, word [0x2d6bd4]
    movsx edx, word [0x1256c0]
loc_1717:
    test ecx, ecx
    jl near loc_1678
    imul ebx, ecx, 0x2c
    cmp word [ebx + 0x2522c2], 0x26d
    jne near loc_17bb
    cmp word [ebx + 0x2522d6], 0
    jne near loc_17bb
    imul eax, edx, 0x2c
    mov di, word [ebx + 0x2522da]
    cmp di, word [eax + 0x2522dc]
    jne short loc_17bb
    mov word [ebx + 0x2522d6], 1
    mov eax, 0xd4
    call loc_274c
    movsx eax, word [0x1256c0]
    imul eax, eax, 0x2c
    mov edx, 1
    mov word [eax + 0x2522d2], cx
    mov word [eax + 0x2522d6], dx
    mov ax, word [esi + 0x29e]
    mov dword [esp], eax
    mov ax, word [ebx + 0x2522cc]
    mov word [esi + 0x29e], ax
    mov eax, esi
    call 0x45230
    mov eax, dword [esp]
    mov word [esi + 0x29e], ax
    mov word [esi + 0x31e], cx
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_17bb:
    db 0x0f, 0xbf, 0x0c, 0x4d, 0xb4, 0x0e, 0x24, 0x00    ; movsx ecx, word [ecx*2 + 0x240eb4]
    jmp near loc_1717
loc_17c8:
    cmp word [esi + 0x31e], 0
    jl short loc_17db
    mov word [esi + 0x31e], 0xffff
loc_17db:
    cmp byte [0x353a91], 0
    je near loc_1a1a
    xor ch, ch
    mov byte [0x353a91], ch
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_17f9:
    movsx eax, word [0x1256c4]
    cmp eax, -1
    jne near loc_187d
    movsx eax, word [0x1256be]
    cmp eax, -1
    jne short loc_187d
    movsx eax, word [0x1256c0]
    cmp eax, -1
    jne short loc_187d
    movsx eax, word [esi + 0x340]
    call 0x453f0
    test eax, eax
    jns short loc_1833
    neg eax
loc_1833:
    cmp eax, 0x200
    jge short loc_187d
    call 0x6dc5f
    and eax, 0xff
    cmp eax, 0x10
    jge short loc_1863
    mov eax, 0xcf
    movsx edx, word [esi + 0x340]
    call loc_274c
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1863:
    mov eax, 0xd1
    movsx edx, word [esi + 0x340]
    call loc_274c
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_187d:
    mov dx, word [0x1256c4]
    test dx, dx
    jl short loc_18dd
    movsx eax, dx
    shl eax, 5
    cmp word [eax + 0x27e4ce], 0
    jle short loc_18c9
    movsx eax, word [eax + 0x27e4c4]
    call 0x508f0
    test al, al
    je short loc_18c9
    mov eax, dword [esp + 4]
    cmp ax, word [0x1256c4]
    je near loc_1a09
    cwde
    cmp eax, -1
    jne near loc_1a1a
    jmp near loc_1a09
loc_18c9:
    cmp word [esi + 0x31e], 0
    jl short loc_18dd
    mov ecx, 0xffffffff
    jmp near loc_1678
loc_18dd:
    mov ax, word [0x1256be]
    test ax, ax
    jl near loc_196f
    movsx edx, ax
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    test byte [eax + 0x2c9cd7], 0x40
    jne short loc_196f
    movsx eax, word [eax + 0x2c9cd6]
    call 0x509c0
    test al, al
    je short loc_196f
    movsx eax, word [0x1256be]
    db 0x0f, 0xbf, 0x0c, 0x45, 0xd4, 0x73, 0x2d, 0x00    ; movsx ecx, word [eax*2 + 0x2d73d4]
loc_1927:
    test ecx, ecx
    jl short loc_1953
    imul eax, ecx, 0x2c
    mov dx, word [eax + 0x2522c2]
    cmp dx, 2
    je near loc_1a1a
    cmp dx, 8
    je near loc_1a1a
    db 0x0f, 0xbf, 0x0c, 0x4d, 0xb4, 0xdf, 0x24, 0x00    ; movsx ecx, word [ecx*2 + 0x24dfb4]
    jmp short loc_1927
loc_1953:
    movsx eax, word [0x1256be]
    movsx edx, word [esi + 0x340]
    call 0x51480
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_196f:
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x2522cc]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    test byte [eax + 0x2c9cd7], 0x40
    jne near loc_1a1a
    movsx eax, word [eax + 0x2c9cd6]
    call 0x509a0
    test al, al
    je short loc_1a09
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    movsx ecx, word [eax + 0x2522cc]
    db 0x0f, 0xbf, 0x0c, 0x4d, 0xd4, 0x73, 0x2d, 0x00    ; movsx ecx, word [ecx*2 + 0x2d73d4]
loc_19c6:
    test ecx, ecx
    jl short loc_19ea
    imul eax, ecx, 0x2c
    mov bx, word [eax + 0x2522c2]
    cmp bx, 2
    je short loc_1a1a
    cmp bx, 8
    je short loc_1a1a
    db 0x0f, 0xbf, 0x0c, 0x4d, 0xb4, 0xdf, 0x24, 0x00    ; movsx ecx, word [ecx*2 + 0x24dfb4]
    jmp short loc_19c6
loc_19ea:
    movsx edx, word [esi + 0x340]
    imul eax, edx, 0x2c
    movsx eax, word [eax + 0x2522cc]
    call 0x51480
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1a09:
    movsx edx, word [0x1256c4]
    movsx eax, di
    xor ebx, ebx
    call 0x52880
loc_1a1a:
    add esp, 8
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
    add byte [ecx], dl
    add byte [esi], ah
    add al, cl
    add byte [esi], al
    add byte [ebp], al
    add dword [eax], eax
    add al, byte [eax]
    add eax, dword [eax]
    db 0x6d    ; insd dword es:[edi], dx
    add byte [eax + eax + 0xd0009], bl
    push cs
    add ch, dl
    add byte [edi], al
    add bl, bl
    add byte [edx - 0x77], dl
    ret 0x58e8
    add dword [eax], eax
    add al, ch
    mov dword [0xe8fffb8d], eax
    cmc
    db 0xa4    ; movsb byte es:[edi], byte [esi]
    add byte [eax], al
    call 0x9e500
    call 0x59d80
    call 0x9c508
    call 0x77ca0
    mov eax, 0x326c
    call 0x9fe0c
    mov eax, edx
    call 0x9ffa7
    mov eax, 0xffffffff
    call 0x9fe2e
    pop edx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 0xc
    mov edx, dword [0x1b8ce8]
    cmp edx, 0xd
    je near loc_1ba3
    test edx, edx
    je short loc_1abf
    cmp edx, 6
    jne short loc_1aeb
loc_1abf:
    lea eax, [ebp - 0xc]
    push eax
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 8]
    push eax
    mov ecx, 7
    sub esp, 0x1c
    mov edx, ss
    mov edi, esp
    mov es, edx
    mov esi, 0x1b8cbc
    push ds
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    pop es
    call 0x91910
    mov ecx, eax
    jmp short loc_1aed
loc_1aeb:
    xor ecx, ecx
loc_1aed:
    test ecx, ecx
    jne near loc_1b7d
    cmp byte [0x7e7c], 0
    je short loc_1b2d
    cmp word [0x2f2924], 1
    jle short loc_1b2d
    push 0x1f40
    mov ecx, 8
    mov edi, dword [0x1b8ce0]
    mov ebx, 1
    cmp edi, 4
    jge short loc_1b26
    mov edx, edi
    jmp short loc_1b46
loc_1b26:
    mov edx, 4
    jmp short loc_1b46
loc_1b2d:
    mov esi, dword [0x1b8c98]
    mov ecx, dword [0x1b8cb0]
    mov ebx, dword [0x1b8cac]
    push esi
    mov edx, dword [0x1b8ce0]
loc_1b46:
    mov eax, dword [0x1b8ce8]
    call 0x919e0
    mov ecx, eax
    test ecx, ecx
    jne short loc_1b7d
    mov eax, dword [0x1b8cd8]
    call 0x91bd8
    cmp dword [0x1b8cb4], 1
    jne short loc_1b7d
    call 0x91c9c
    test eax, eax
    sete al
    and eax, 0xff
    call 0x91c94
loc_1b7d:
    test ecx, ecx
    je short loc_1b8b
    mov eax, 0x3278
    call 0x57460
loc_1b8b:
    mov eax, 0x485c0
    call 0x91b70
    test eax, eax
    je short loc_1ba3
    mov eax, 0x3278
    call 0x57460
loc_1ba3:
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
loc_1bab:
    ret
    cmp dword [0x1b8ce8], 0xd
    je short loc_1bab
    call 0x91ad8
    test eax, eax
    je short loc_1bab
    mov eax, 0x3278
    call 0x9ffa7
    mov eax, 0x3294
    jmp near 0x15ff0
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 0xc
    cmp dword [0x1b8ce4], 0xd
    je near loc_1c72
    cmp byte [0x7e7c], 0
    je short loc_1c07
    cmp word [0x2f2924], 1
    jg short loc_1c72
loc_1c07:
    mov eax, dword [0x1b8ca4]
    mov ebx, dword [0x1b8ce8]
    mov dword [0x1b8cd0], eax
    test ebx, ebx
    je short loc_1c20
    cmp ebx, 6
    jne short loc_1c48
loc_1c20:
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 0xc]
    push eax
    lea eax, [ebp - 8]
    push eax
    mov ecx, 7
    sub esp, 0x1c
    mov eax, ss
    mov edi, esp
    mov es, eax
    mov esi, 0x1b8cbc
    push ds
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    pop es
    call 0x91910
loc_1c48:
    mov edx, dword [0x1b8ca4]
    mov eax, dword [0x1b8ce4]
    call 0x892b8
    test eax, eax
    jne short loc_1c68
    mov eax, dword [0x1b8cdc]
    call 0x8942f
    jmp short loc_1c72
loc_1c68:
    mov eax, 0x3298
    call 0x57460
loc_1c72:
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    nop
    cmp dword [0x1b8ce4], 0xd
    je short loc_1cb4
    cmp byte [0x7e7c], 0
    je short loc_1c98
    cmp word [0x2f2924], 1
    jg short loc_1cb4
loc_1c98:
    call 0x893ae
    test eax, eax
    je short loc_1cb4
    mov eax, dword [0x1119c]
    call 0x89216
    push eax
    call 0x98f6c
    add esp, 4
loc_1cb4:
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ebx
    mov ebx, eax
    mov eax, edx
    call 0xa0dc1
    mov dword [ebx], eax
    test eax, eax
    setne al
    and eax, 0xff
    dec eax
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    call 0xa0ea4
    xor eax, eax
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 0x20
    mov ecx, 8
    mov eax, ss
    lea edi, [ebp - 0x20]
    mov es, eax
    mov esi, 0x47440
    push ds
    xor edx, edx
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    pop es
    mov al, byte [0x9c84]
    mov dl, al
    inc al
    mov byte [0x9c84], al
    movsx eax, word [ebp + edx*2 - 0x20]
    xor edx, edx
    call loc_252c
    mov dl, byte [0x9c84]
    mov ebx, 0x11
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov byte [0x9c84], dl
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    cmp dword [0x1b8ab4], 0
    je short loc_1dc0
    cmp dword [0x1b8ce4], 0xd
    je short loc_1dc0
    cmp byte [0x7e7c], 0
    je short loc_1d74
    cmp word [0x2f2924], 1
    jg short loc_1dc0
loc_1d74:
    xor edx, edx
    call 0x77cee
    movsx ecx, ax
    cmp ecx, -1
    je short loc_1dc0
    mov eax, ecx
    call 0x77fa4
    cmp eax, 0x11940
    jl short loc_1d9c
    mov eax, ecx
    call 0x77fe5
    pop edx
    pop ecx
    pop ebx
    ret
loc_1d9c:
    mov edx, 0x10b320
    mov ebx, eax
    mov eax, ecx
    call 0x77e20
    mov eax, ecx
    mov edx, 1
    call 0x77fe5
    mov eax, 0x10b320
    call 0x894ac
loc_1dc0:
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
loc_1dcc:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    cmp ax, 0x1c2
    jae short loc_1de0
    cmp dword [0x1b8ab8], 0
    jne short loc_1de7
loc_1de0:
    xor al, al
    jmp near loc_1eac
loc_1de7:
    cmp dword [0x1b8ce8], 0xd
    jne short loc_1df8
    xor al, al
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1df8:
    xor ebx, ebx
    mov bx, ax
    lea eax, [ebx*8]
    sub eax, ebx
    mov esi, 0x122114
    add eax, eax
    xor edx, edx
    add esi, eax
    mov dl, byte [0x126233]
    mov eax, esi
    call 0x77cee
    mov ecx, eax
    cmp eax, -1
    jne short loc_1e6b
    push ebx
    push esi
    push 0x32bc
    push 0xf72c0
    call 0x9fc79
    movsx ebx, word [0x2f2926]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov edx, 0xf1720
    add eax, eax
    add esp, 0x10
    add edx, eax
    mov eax, 0x71
    call 0x15e50
    xor al, al
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1e6b:
    imul edi, ebx, 0xd
    call 0x77fa4
    mov esi, eax
    mov dword [ebx*4 + 0x8a930], eax
    mov byte [edi + 0x123fd4], 0xc8
    mov eax, 0x123fd0
    add eax, edi
    mov edx, esi
    lea ebx, [eax + 4]
    call 0x77508
    mov ebx, esi
    mov eax, ecx
    mov edx, dword [edi + 0x123fd0]
    call 0x77e20
    mov eax, ecx
    call 0x77fe5
    mov al, 1
loc_1eac:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
loc_1ebc:
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 0x34
    mov esi, eax
    mov dword [ebp - 8], edx
    mov dword [ebp - 0x20], ebx
    mov dword [ebp - 0x24], ecx
    cmp ax, 0x1c2
    jge near loc_1f79
    cmp dword [0x1b8ce8], 0xd
    je near loc_1f79
    cwde
    test byte [eax + 0x123c40], 8
    je short loc_1efd
    cmp dword [0x125d4f], 0
    jne near loc_1f79
loc_1efd:
    cmp dword [0x1b8ab8], 0
    je near loc_1f79
    movsx eax, si
    imul edx, eax, 0xd
    cmp dword [edx + 0x123fd9], 3
    jg short loc_1f79
    mov al, byte [eax + 0x123e02]
    and eax, 0xff
    call 0x91ccc
    test eax, eax
    je short loc_1f79
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov dx, word [eax + 0xf1a78]
    test dx, dx
    jle short loc_1f58
    cmp dx, 0x4e
    jle short loc_1f79
loc_1f58:
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xf6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x01    ; test byte [eax*2 + 0xf1ac2], 1
    je short loc_1f83
loc_1f79:
    mov eax, 0xffffffff
    jmp near loc_2515
loc_1f83:
    movsx eax, si
    mov bl, byte [eax + 0x123c40]
    test bl, 0x80
    je short loc_1fa0
    call loc_252c
    xor eax, eax
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    ret 4
loc_1fa0:
    test bl, 4
    je near loc_202c
    cmp dword [0x1b8abc], 0
    je short loc_1fe6
    cmp dword [0x1261df], 1
    jle short loc_1ff3
    movsx eax, word [ebp - 8]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 0x214
    jne short loc_1ff3
    mov di, word [0x1256c6]
    cmp di, word [eax + 0x2522d6]
    je short loc_1ff3
    cmp dword [0x125d47], 1
    je short loc_1ff3
loc_1fe6:
    mov eax, 0xffffffff
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    ret 4
loc_1ff3:
    xor ebx, ebx
    jmp short loc_2024
loc_1ff7:
    xor eax, eax
    imul edx, ebx, 0xd
    jmp short loc_2019
loc_1ffe:
    test ecx, ecx
    jle short loc_2018
    test byte [ebx + 0x123c40], 4
    je short loc_2018
    mov eax, 0xffffffff
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    ret 4
loc_2018:
    inc eax
loc_2019:
    mov ecx, dword [edx + 0x123fd9]
    cmp eax, ecx
    jl short loc_1ffe
    inc ebx
loc_2024:
    cmp ebx, 0x1c2
    jl short loc_1ff7
loc_202c:
    movsx edx, word [0x1256c6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x14, 0x45, 0x58, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf1958]
    mov dword [ebp - 0x18], edx
    db 0x8b, 0x14, 0x45, 0x5c, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf195c]
    mov dword [ebp - 0x1c], edx
    db 0x8b, 0x14, 0x45, 0x60, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf1960]
    mov ecx, dword [ebp - 0x24]
    mov dword [ebp - 0x28], edx
    db 0x66, 0x8b, 0x14, 0x45, 0xbe, 0x19, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf19be]
    mov edi, dword [ebp - 0x20]
    mov dword [ebp - 4], edx
    db 0x0f, 0xbf, 0x14, 0x45, 0xb8, 0x19, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf19b8]
    db 0x0f, 0xbf, 0x04, 0x45, 0xc0, 0x19, 0x0f, 0x00    ; movsx eax, word [eax*2 + 0xf19c0]
    mov ebx, dword [ebp - 0x28]
    add edx, eax
    mov eax, dword [ebp + 0x10]
    mov dword [ebp - 0x30], edx
    mov edx, dword [ebp - 0x1c]
    sub ebx, eax
    mov eax, dword [ebp - 0x18]
    sar ebx, 4
    sub edx, ecx
    sub eax, edi
    call 0x9ba1c
    mov ecx, eax
    mov edi, eax
    cmp word [ebp - 8], 0
    jl short loc_2110
    movsx eax, si
    test byte [eax + 0x123c40], 0x10
    jne short loc_2110
    movsx edx, word [ebp - 8]
    imul edx, edx, 0x2c
    cmp word [edx + 0x2522c2], 5
    jne short loc_2110
    cmp word [edx + 0x2522da], 0x3e7
    jge short loc_2110
    movsx eax, word [edx + 0x2522cc]
    mov dword [ebp - 0x34], eax
    mov ebx, dword [ebp - 0x34]
    lea eax, [eax*4]
    add eax, ebx
    mov ax, word [eax*8 + 0x2c9cd6]
    xor ah, ah
    db 0x66, 0x3d, 0x09, 0x00    ; cmp ax, 9
    jge short loc_2110
    movsx ebx, word [edx + 0x2522dc]
    mov eax, ecx
    inc ebx
    mov edx, eax
    sar edx, 0x12
    shl eax, 0xe
    idiv ebx
    mov edi, eax
loc_2110:
    movsx eax, si
    db 0x66, 0x8b, 0x14, 0x45, 0x94, 0x17, 0x12, 0x00    ; mov dx, word [eax*2 + 0x121794]
    db 0x66, 0x8b, 0x04, 0x45, 0x10, 0x14, 0x12, 0x00    ; mov ax, word [eax*2 + 0x121410]
    mov dword [ebp - 0x10], eax
    cwde
    movsx ecx, dx
    mov dword [ebp - 0x2c], eax
    sub eax, ecx
    test eax, eax
    jns short loc_2135
    neg eax
loc_2135:
    mov ebx, eax
    mov dword [ebp - 0x18], eax
    test eax, eax
    je short loc_216a
    cmp dx, word [ebp - 0x10]
    jge short loc_2154
    call 0x9ff40
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    add ecx, edx
    jmp short loc_216a
loc_2154:
    call 0x9ff40
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov eax, dword [ebp - 0x2c]
    add eax, edx
    mov dword [ebp - 0x14], eax
    jmp short loc_216d
loc_216a:
    mov dword [ebp - 0x14], ecx
loc_216d:
    movsx eax, si
    db 0x0f, 0xbf, 0x04, 0x45, 0x20, 0x1b, 0x12, 0x00    ; movsx eax, word [eax*2 + 0x121b20]
    add edi, eax
    test edi, edi
    jge short loc_2180
    xor edi, edi
loc_2180:
    test edi, edi
    je short loc_21db
    movsx eax, word [ebp - 8]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 5
    je short loc_21db
    movsx edx, word [eax + 0x2522cc]
    push edx
    mov edx, dword [eax + 0x2522bc]
    sub edx, 0x1800
    mov ebx, dword [ebp - 0x28]
    push edx
    mov ecx, dword [eax + 0x2522b8]
    sub ebx, 0x1800
    push ecx
    mov edx, dword [eax + 0x2522b4]
    movsx ecx, word [ebp - 4]
    push edx
    mov eax, dword [ebp - 0x18]
    mov edx, dword [ebp - 0x1c]
    call 0x6830d
    test eax, eax
    jne short loc_21db
    mov eax, edi
    sar eax, 5
    add edi, eax
loc_21db:
    cmp si, 0xe
    jb short loc_21eb
    jbe short loc_21f1
    cmp si, 0x11
    je short loc_21f1
    jmp short loc_223e
loc_21eb:
    cmp si, 9
    jne short loc_223e
loc_21f1:
    cmp edi, 0x1800
    jle short loc_21fe
    mov edi, 0x1800
loc_21fe:
    movsx edx, word [0x1256c6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0xbe, 0x19, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf19be]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9cd6], 2
    jne near loc_22aa
    sub dword [ebp - 0x14], 0x400
    jmp short loc_22aa
loc_223e:
    movsx edx, word [0x1256c6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0xbe, 0x19, 0x0f, 0x00    ; movsx edx, word [eax*2 + 0xf19be]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9cd6], 2
    jne short loc_2284
    movsx eax, si
    test byte [eax + 0x123c40], 4
    jne short loc_2284
    mov dword [ebp - 0x14], 0xfffffd00
loc_2284:
    cmp edi, 0x7ad4
    jle short loc_22aa
    movsx eax, word [ebp - 8]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 5
    je short loc_22aa
    mov eax, 0xffffffff
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    ret 4
loc_22aa:
    movsx edx, si
    imul ecx, edx, 0xd
    cmp dword [ecx + 0x123fd9], 0
    jle short loc_230c
    movsx ebx, word [ebp - 8]
    imul ebx, ebx, 0x2c
    cmp word [ebx + 0x2522c2], 5
    je short loc_230c
    lea eax, [edx*4]
    sub eax, edx
    mov ax, word [eax*8 + 0xe79c8]
    cmp ax, word [ebp - 8]
    je short loc_2305
    cmp dword [ecx + 0x123fd9], 1
    jg short loc_2305
    mov eax, 0x2522b4
    add eax, ebx
    call 0x12bc0
    test ax, ax
    je short loc_230c
    cmp word [ebx + 0x2522de], 0
    jg short loc_230c
loc_2305:
    mov eax, edx
    call loc_278c
loc_230c:
    movsx eax, word [ebp - 8]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 0x214
    jne short loc_2334
    mov bx, word [0x1256c6]
    cmp bx, word [eax + 0x2522d6]
    jne short loc_2334
    xor ebx, ebx
    xor edi, edi
    jmp short loc_235a
loc_2334:
    mov edx, dword [ebp - 0x1c]
    mov ebx, dword [ebp - 0x24]
    mov eax, dword [ebp - 0x18]
    mov ecx, dword [ebp - 0x20]
    sub edx, ebx
    mov ebx, dword [ebp - 0x30]
    sub eax, ecx
    add ebx, 0x800
    call 0x62b58
    sub ebx, eax
    and ebx, 0x7ff
loc_235a:
    movsx eax, si
    imul eax, eax, 0xd
    cmp dword [eax + 0x123fd0], 0
    jne short loc_2381
    xor eax, eax
    mov ax, si
    call loc_1dcc
    test al, al
    jne short loc_239f
    xor eax, eax
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    ret 4
loc_2381:
    cmp byte [eax + 0x123fd4], 0xc8
    jae short loc_2393
    mov byte [eax + 0x123fd4], 0xc8
    jmp short loc_239f
loc_2393:
    mov dl, byte [eax + 0x123fd4]
    inc byte [eax + 0x123fd4]
loc_239f:
    movsx eax, si
    test byte [eax + 0x123c40], 0x10
    je short loc_23ad
    xor edi, edi
loc_23ad:
    cmp edi, 0x1a40
    jge short loc_23ba
    mov edi, 0x1a40
loc_23ba:
    movsx edx, si
    mov eax, edi
    imul edi, edx, 0xd
    mov cl, byte [edx + 0x123c40]
    sar eax, 6
    test cl, 1
    je near loc_2466
    cmp dword [edi + 0x123fd9], 0
    jle short loc_23ea
    mov eax, 0xffffffff
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    ret 4
loc_23ea:
    mov edi, dword [edi + 0x123fd0]
    mov bx, word [edi + 0x14]
    mov cl, byte [edi]
    mov dword [ebp - 0xc], ebx
    lea ebx, [edx*4]
    cmp cl, 0x43
    jne short loc_2437
    movsx ecx, si
    mov dl, byte [edx + 0x123e02]
    push ecx
    and edx, 0xff
    push edx
    push 0
    mov ecx, dword [ebp - 0x14]
    xor edx, edx
    push eax
    mov ebx, dword [ebx + 0x8a930]
    mov dx, word [ebp - 0xc]
    push eax
    add ebx, edx
    mov eax, edi
    call 0x91d68
    jmp near loc_24b2
loc_2437:
    movsx ecx, si
    mov dl, byte [edx + 0x123e02]
    push ecx
    and edx, 0xff
    push edx
    push 0
    mov ecx, dword [ebp - 0x14]
    xor edx, edx
    push eax
    mov ebx, dword [ebx + 0x8a930]
    mov dx, word [ebp - 0xc]
    push eax
    add ebx, edx
    mov eax, edi
    call 0x91ddc
    jmp short loc_24b2
loc_2466:
    mov edi, dword [edi + 0x123fd0]
    mov ch, byte [edi]
    sar ebx, 6
    cmp ch, 0x43
    jne short loc_2495
    movsx ecx, si
    mov dl, byte [edx + 0x123e02]
    push ecx
    and edx, 0xff
    mov ecx, eax
    push edx
    mov eax, edi
    mov edx, dword [ebp - 0x14]
    call 0x91e1c
    jmp short loc_24b2
loc_2495:
    movsx ecx, si
    mov dl, byte [edx + 0x123e02]
    push ecx
    and edx, 0xff
    mov ecx, eax
    push edx
    mov eax, edi
    mov edx, dword [ebp - 0x14]
    call 0x91e4c
loc_24b2:
    mov edx, eax
    test edx, edx
    jle short loc_2501
    movsx edi, si
    imul ebx, edi, 0xd
    mov ecx, dword [ebx + 0x123fd9]
    lea eax, [ecx*4]
    sub eax, ecx
    lea ecx, [eax + eax]
    lea eax, [edi*4]
    sub eax, edi
    lea eax, [eax*8]
    mov esi, dword [ebx + 0x123fd9]
    add eax, ecx
    inc esi
    mov ecx, dword [ebp - 8]
    mov dword [eax + 0xe79ca], edx
    mov dword [ebx + 0x123fd9], esi
    mov word [eax + 0xe79c8], cx
    jmp short loc_2513
loc_2501:
    movsx eax, si
    imul eax, eax, 0xd
    mov bl, byte [eax + 0x123fd4]
    dec byte [eax + 0x123fd4]
loc_2513:
    mov eax, edx
loc_2515:
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    ret 4
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_252c:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 8
    mov esi, eax
    cmp dword [0x1b8ce8], 0xd
    je near loc_273f
    cmp dword [0x1b8ab8], 0
    je near loc_273f
    cmp dword [0x1b8abc], 0
    jne short loc_256a
    cwde
    test byte [eax + 0x123c40], 4
    jne near loc_273f
loc_256a:
    movsx eax, si
    test byte [eax + 0x123c40], 8
    je short loc_2583
    cmp dword [0x125d4f], 0
    jne near loc_273f
loc_2583:
    movsx edx, si
    xor eax, eax
    mov al, byte [edx + 0x123e02]
    call 0x91ccc
    test eax, eax
    je near loc_273f
    db 0x8d, 0x04, 0x55, 0x00, 0x00, 0x00, 0x00    ; lea eax, [edx*2]
    mov dx, word [eax + 0x121794]
    mov ax, word [eax + 0x121410]
    movsx ebx, dx
    movsx edi, ax
    mov dword [ebp - 4], eax
    mov eax, edi
    sub eax, ebx
    test eax, eax
    jns short loc_25c3
    neg eax
loc_25c3:
    mov ecx, eax
    test ax, ax
    je short loc_25f4
    cmp dx, word [ebp - 4]
    jge short loc_25e3
    call 0x9ff40
    mov edx, eax
    movsx ecx, cx
    sar edx, 0x1f
    idiv ecx
    add edx, ebx
    jmp short loc_25f4
loc_25e3:
    call 0x9ff40
    mov edx, eax
    movsx ebx, cx
    sar edx, 0x1f
    idiv ebx
    add edx, edi
loc_25f4:
    mov ecx, edx
    movsx eax, si
    imul eax, eax, 0xd
    cmp dword [eax + 0x123fd0], 0
    jne short loc_2619
    xor eax, eax
    mov ax, si
    call loc_1dcc
    test al, al
    je near loc_273f
    jmp short loc_2637
loc_2619:
    cmp byte [eax + 0x123fd4], 0xc8
    jae short loc_262b
    mov byte [eax + 0x123fd4], 0xc8
    jmp short loc_2637
loc_262b:
    mov dl, byte [eax + 0x123fd4]
    inc byte [eax + 0x123fd4]
loc_2637:
    movsx edx, si
    imul eax, edx, 0xd
    test byte [edx + 0x123c40], 1
    je near loc_26dc
    lea ebx, [edx*4]
    mov eax, dword [eax + 0x123fd0]
    mov dword [ebp - 8], ebx
    cmp byte [eax], 0x43
    jne short loc_269f
    movsx ebx, si
    mov dl, byte [edx + 0x123e02]
    xor edi, edi
    push ebx
    mov di, word [eax + 0x14]
    and edx, 0xff
    push edx
    push 0x96
    mov ebx, dword [ebp - 8]
    push 0x96
    movsx ecx, cx
    mov ebx, dword [ebx + 0x8a930]
    push 0x96
    mov edx, edi
    add ebx, edi
    call 0x91d68
    jmp near loc_2729
loc_269f:
    movsx ebx, si
    mov dl, byte [edx + 0x123e02]
    xor edi, edi
    push ebx
    mov di, word [eax + 0x14]
    and edx, 0xff
    push edx
    push 0x96
    mov ebx, dword [ebp - 8]
    push 0x96
    movsx ecx, cx
    mov ebx, dword [ebx + 0x8a930]
    push 0x96
    mov edx, edi
    add ebx, edi
    call 0x91ddc
    jmp short loc_2729
loc_26dc:
    mov eax, dword [eax + 0x123fd0]
    cmp byte [eax], 0x43
    jne short loc_2709
    movsx ebx, si
    mov dl, byte [edx + 0x123e02]
    push ebx
    and edx, 0xff
    xor ebx, ebx
    push edx
    movsx edx, cx
    mov ecx, 0x69
    call 0x91e1c
    jmp short loc_2729
loc_2709:
    movsx ebx, si
    mov dl, byte [edx + 0x123e02]
    push ebx
    and edx, 0xff
    xor ebx, ebx
    push edx
    movsx edx, cx
    mov ecx, 0x69
    call 0x91e4c
loc_2729:
    test eax, eax
    jg short loc_273f
    movsx eax, si
    imul eax, eax, 0xd
    mov dl, byte [eax + 0x123fd4]
    dec byte [eax + 0x123fd4]
loc_273f:
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
loc_274c:
    push ebx
    push ecx
    push esi
    mov ebx, eax
    cmp ax, 0x1c2
    jb short loc_2760
    mov eax, 0xffffffff
    pop esi
    pop ecx
    pop ebx
    ret
loc_2760:
    movsx edx, dx
    imul eax, edx, 0x2c
    mov ecx, dword [eax + 0x2522bc]
    push ecx
    mov ecx, dword [eax + 0x2522b8]
    mov eax, dword [eax + 0x2522b4]
    movsx esi, bx
    mov ebx, eax
    mov eax, esi
    call loc_1ebc
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_278c:
    push ebx
    push ecx
    push edx
    movsx edx, ax
    imul eax, edx, 0xd
    mov ebx, dword [eax + 0x123fd9]
    test ebx, ebx
    jle short loc_27c7
    dec ebx
    lea ecx, [ebx*4]
    lea eax, [edx*4]
    sub ecx, ebx
    sub eax, edx
    add ecx, ecx
    mov eax, dword [ecx + eax*8 + 0xe79ca]
    call 0x91f38
    mov eax, edx
    call loc_2bac
loc_27c7:
    pop edx
    pop ecx
    pop ebx
    ret
    nop
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 4
    mov esi, eax
    mov edi, edx
    cwde
    imul eax, eax, 0xd
    cmp dword [eax + 0x123fd9], 0
    jle short loc_2835
    mov ax, word [eax + 0x123fd9]
    xor edx, edx
    mov dword [ebp - 4], eax
    jmp short loc_282f
loc_27f5:
    movsx ebx, si
    lea ecx, [ebx*4]
    sub ecx, ebx
    movsx ebx, dx
    lea eax, [ebx*4]
    sub eax, ebx
    lea ecx, [ecx*8]
    add eax, eax
    add eax, ecx
    cmp di, word [eax + 0xe79c8]
    jne short loc_282e
    mov eax, dword [eax + 0xe79ca]
    call 0x91f38
    jmp short loc_2835
loc_282e:
    inc edx
loc_282f:
    cmp dx, word [ebp - 4]
    jl short loc_27f5
loc_2835:
    mov esp, ebp
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
    mov ebp, esp
    sub esp, 0x30
    xor edx, edx
    movsx eax, word [0x125cf7]
    mov dword [0x18f744], edx
    cmp eax, -1
    jne short loc_28c2
    movsx edx, word [0x1256c6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x14, 0x45, 0x58, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf1958]
    mov dword [ebp - 0x28], edx
    db 0x8b, 0x14, 0x45, 0x5c, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf195c]
    mov dword [ebp - 0x24], edx
    db 0x8b, 0x14, 0x45, 0x60, 0x19, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf1960]
    mov dword [ebp - 0x2c], edx
    db 0x66, 0x8b, 0x14, 0x45, 0xbe, 0x19, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf19be]
    db 0x66, 0x8b, 0x1c, 0x45, 0xc0, 0x19, 0x0f, 0x00    ; mov bx, word [eax*2 + 0xf19c0]
    mov dword [ebp - 0xc], edx
    db 0x66, 0x8b, 0x14, 0x45, 0xb8, 0x19, 0x0f, 0x00    ; mov dx, word [eax*2 + 0xf19b8]
    add edx, ebx
    mov dword [ebp - 0x10], edx
    jmp short loc_28f4
loc_28c2:
    imul eax, eax, 0x2c
    mov edx, dword [eax + 0x2522b4]
    mov dword [ebp - 0x28], edx
    mov edx, dword [eax + 0x2522b8]
    mov dword [ebp - 0x24], edx
    mov edx, dword [eax + 0x2522bc]
    mov dword [ebp - 0x2c], edx
    mov dx, word [eax + 0x2522cc]
    mov ax, word [eax + 0x2522d0]
    mov dword [ebp - 0xc], edx
    mov dword [ebp - 0x10], eax
loc_28f4:
    xor edi, edi
    cmp di, 0x1c2
    jl short loc_2906
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2906:
    xor ecx, ecx
    mov dword [ebp - 4], ecx
    jmp near loc_2b72
loc_2910:
    lea eax, [ebx*4]
    sub eax, ebx
    lea ebx, [eax*8]
    lea eax, [edx*4]
    sub eax, edx
    mov ax, word [ebx + eax*2 + 0xe79c8]
    mov dword [ebp - 0x14], eax
    cwde
    imul eax, eax, 0x2c
    mov edx, dword [eax + 0x2522b4]
    mov dword [ebp - 0x18], edx
    mov edx, dword [eax + 0x2522b8]
    mov dword [ebp - 0x20], edx
    mov edx, dword [eax + 0x2522bc]
    mov si, word [eax + 0x2522c2]
    mov dword [ebp - 0x1c], edx
    cmp si, 0x214
    jne short loc_297e
    mov dx, word [0x1256c6]
    cmp dx, word [eax + 0x2522d6]
    jne short loc_297e
    xor edx, edx
    xor esi, esi
    mov word [ebp - 8], dx
    jmp near loc_2a2e
loc_297e:
    mov ebx, dword [ebp - 0x10]
    mov esi, dword [ebp - 0x24]
    mov eax, dword [ebp - 0x20]
    mov ecx, dword [ebp - 0x28]
    mov edx, dword [ebp - 0x18]
    sub esi, eax
    sub ecx, edx
    mov edx, esi
    mov eax, ecx
    add bh, 8
    call 0x62b58
    sub ebx, eax
    mov word [ebp - 8], bx
    mov ah, byte [ebp - 7]
    and ah, 7
    mov ebx, dword [ebp - 0x2c]
    mov byte [ebp - 7], ah
    sub ebx, dword [ebp - 0x1c]
    mov edx, esi
    sar ebx, 4
    mov eax, ecx
    call 0x9ba1c
    mov ebx, dword [ebp - 0x14]
    mov edx, eax
    mov esi, eax
    test bx, bx
    jl short loc_2a2e
    movsx eax, di
    test byte [eax + 0x123c40], 0x10
    jne short loc_2a2e
    movsx ecx, word [ebp - 0x14]
    imul ecx, ecx, 0x2c
    cmp word [ecx + 0x2522c2], 5
    jne short loc_2a2e
    cmp word [ecx + 0x2522da], 0x3e7
    jge short loc_2a2e
    movsx eax, word [ecx + 0x2522cc]
    mov dword [ebp - 0x30], eax
    mov ebx, dword [ebp - 0x30]
    lea eax, [eax*4]
    add eax, ebx
    mov ax, word [eax*8 + 0x2c9cd6]
    xor ah, ah
    db 0x66, 0x3d, 0x09, 0x00    ; cmp ax, 9
    jge short loc_2a2e
    movsx ebx, word [ecx + 0x2522dc]
    mov eax, edx
    inc ebx
    mov edx, eax
    sar edx, 0x12
    shl eax, 0xe
    idiv ebx
    mov esi, eax
loc_2a2e:
    movsx eax, di
    db 0x0f, 0xbf, 0x04, 0x45, 0x20, 0x1b, 0x12, 0x00    ; movsx eax, word [eax*2 + 0x121b20]
    add esi, eax
    test esi, esi
    jge short loc_2a41
    xor esi, esi
loc_2a41:
    test esi, esi
    je short loc_2a92
    movsx eax, word [ebp - 0x14]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 5
    je short loc_2a92
    movsx eax, word [eax + 0x2522cc]
    push eax
    mov eax, dword [ebp - 0x1c]
    sub eax, 0x1800
    mov ecx, dword [ebp - 0x20]
    push eax
    mov ebx, dword [ebp - 0x2c]
    mov edx, dword [ebp - 0x24]
    push ecx
    mov eax, dword [ebp - 0x18]
    sub ebx, 0x1800
    push eax
    movsx ecx, word [ebp - 0xc]
    mov eax, dword [ebp - 0x28]
    call 0x6830d
    test eax, eax
    jne short loc_2a92
    mov eax, esi
    sar eax, 5
    add esi, eax
loc_2a92:
    movsx eax, word [ebp - 0x14]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 5
    jne short loc_2ab4
    cmp word [eax + 0x2522da], 0x3e7
    jge short loc_2ab4
    inc dword [0x18f744]
loc_2ab4:
    cmp di, 0xe
    jb short loc_2ac4
    jbe short loc_2aca
    cmp di, 0x11
    je short loc_2aca
    jmp short loc_2ad9
loc_2ac4:
    cmp di, 9
    jne short loc_2ad9
loc_2aca:
    cmp esi, 0x1800
    jle short loc_2aff
    mov esi, 0x1800
    jmp short loc_2aff
loc_2ad9:
    cmp esi, 0x7ad4
    jle short loc_2aff
    movsx eax, word [ebp - 0x14]
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 5
    je short loc_2aff
    movsx eax, di
    call loc_278c
    jmp near loc_2b6f
loc_2aff:
    movsx eax, di
    imul eax, eax, 0xd
    cmp dword [eax + 0x123fd0], 0
    jne short loc_2b1c
    xor eax, eax
    mov ax, di
    call loc_1dcc
    test al, al
    je short loc_2b6f
loc_2b1c:
    movsx eax, di
    test byte [eax + 0x123c40], 0x10
    je short loc_2b2a
    xor esi, esi
loc_2b2a:
    cmp esi, 0x1a40
    jge short loc_2b37
    mov esi, 0x1a40
loc_2b37:
    movsx ecx, di
    lea eax, [ecx*4]
    sub eax, ecx
    lea ecx, [eax*8]
    movsx edx, word [ebp - 8]
    movsx eax, word [ebp - 4]
    mov ebx, esi
    lea esi, [eax*4]
    sar ebx, 6
    sub esi, eax
    sar edx, 6
    mov eax, dword [ecx + esi*2 + 0xe79ca]
    call 0x91f08
loc_2b6f:
    inc dword [ebp - 4]
loc_2b72:
    movsx ebx, di
    imul eax, ebx, 0xd
    movsx edx, word [ebp - 4]
    cmp edx, dword [eax + 0x123fd9]
    jl near loc_2910
    inc edi
    cmp di, 0x1c2
    jl near loc_2906
    mov esp, ebp
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
loc_2bac:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 0x10
    mov dword [ebp - 0x10], eax
    test eax, eax
    jge short loc_2bdc
    mov eax, 0x1a42d4
    sub eax, dword [ebp - 0x10]
    mov dh, byte [eax]
    cmp dh, 0xc8
    jb near loc_2d1f
    mov bl, dh
    dec bl
    mov byte [eax], bl
    jmp near loc_2d1f
loc_2bdc:
    imul eax, eax, 0xd
    mov ax, word [eax + 0x123fd9]
    mov dword [ebp - 4], eax
    test ax, ax
    jle near loc_2d0f
    mov eax, dword [ebp - 0x10]
    test byte [eax + 0x123c40], 0x10
    jne near loc_2cd8
    xor edx, edx
    jmp near loc_2cce
loc_2c09:
    mov ebx, dword [ebp - 0x10]
    lea eax, [ebx*4]
    sub eax, ebx
    lea eax, [eax*8]
    mov dword [ebp - 8], eax
    movsx eax, dx
    mov dword [ebp - 0xc], eax
    mov ebx, eax
    lea eax, [eax*4]
    sub eax, ebx
    mov esi, dword [ebp - 8]
    add eax, eax
    add esi, eax
    mov ax, word [esi + 0xe79c8]
    movsx edi, ax
    imul ebx, edi, 0x2c
    cmp word [ebx + 0x2522c2], 5
    jne near loc_2ccd
    movsx ecx, word [ebx + 0x2522cc]
    lea eax, [ecx*4]
    add eax, ecx
    cmp word [eax*8 + 0x2c9cd6], 3
    jge short loc_2ccd
    cmp word [ebx + 0x2522da], 0x3e7
    jge short loc_2ccd
    lea eax, [edi*8]
    add eax, edi
    lea eax, [eax*8]
    mov ebx, dword [ebp - 0xc]
    sub eax, edi
    xor edi, edi
    inc ebx
    mov dword [eax + 0x8b0e7], edi
    movsx eax, word [ebp - 4]
    cmp ebx, eax
    jge short loc_2cd8
    lea ebx, [eax - 1]
    lea eax, [ebx*4]
    sub eax, ebx
    mov edx, dword [ebp - 8]
    add eax, eax
    add eax, edx
    mov ebx, dword [eax + 0xe79ca]
    mov dword [esi + 0xe79ca], ebx
    mov ax, word [eax + 0xe79c8]
    mov word [esi + 0xe79c8], ax
    jmp short loc_2cd8
loc_2ccd:
    inc edx
loc_2cce:
    cmp dx, word [ebp - 4]
    jl near loc_2c09
loc_2cd8:
    imul eax, dword [ebp - 0x10], 0xd
    mov ecx, dword [eax + 0x123fd9]
    movsx ebx, word [ebp - 4]
    dec ecx
    dec ebx
    mov dword [eax + 0x123fd9], ecx
    lea ecx, [ebx*4]
    sub ecx, ebx
    mov ebx, dword [ebp - 0x10]
    lea eax, [ebx*4]
    add ecx, ecx
    sub eax, ebx
    mov word [ecx + eax*8 + 0xe79c8], 0xffff
loc_2d0f:
    imul eax, dword [ebp - 0x10], 0xd
    mov dl, byte [eax + 0x123fd4]
    dec byte [eax + 0x123fd4]
loc_2d1f:
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
loc_2d2c:
    push ebx
    push ecx
    push edx
    mov bh, 0xc7
    xor eax, eax
    cmp eax, 0x1c2
    jl short loc_2d40
    mov ch, 0xc7
    xor eax, eax
    jmp short loc_2d77
loc_2d40:
    imul edx, eax, 0xd
    cmp byte [edx + 0x123fd4], 0xc8
    jb short loc_2d52
    mov byte [edx + 0x123fd4], bh
loc_2d52:
    inc eax
    cmp eax, 0x1c2
    jl short loc_2d40
    mov ch, 0xc7
    xor eax, eax
    cmp eax, 0xb
    jl short loc_2d67
    pop edx
    pop ecx
    pop ebx
    ret
loc_2d67:
    cmp byte [eax + 0x1a42d4], 0xc8
    jb short loc_2d76
    mov byte [eax + 0x1a42d4], ch
loc_2d76:
    inc eax
loc_2d77:
    cmp eax, 0xb
    jl short loc_2d67
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
loc_2d8c:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 0x10
    mov ecx, eax
    xor edx, edx
    call 0x9c630
    push ecx
    mov ebx, 0xc
    mov edi, dword [0x1a40f8]
    push 0x3360
    mov esi, eax
    mov dword [ebp - 4], eax
    call 0x9fc44
    add esp, 8
    lea edx, [ebp - 0x10]
    mov eax, esi
    call 0x9c728
    mov ebx, 4
    mov edx, 0x3370
    lea eax, [ebp - 0x10]
    call 0xa0f26
    test eax, eax
    je short loc_2dec
    push ecx
    push 0x3378
    call 0x98f6c
    add esp, 8
loc_2dec:
    mov eax, dword [ebp - 0xc]
    call 0x99180
    mov dword [ebp - 0xc], eax
    mov eax, dword [ebp - 8]
    call 0x99180
    mov ecx, dword [ebp - 0xc]
    shl ecx, 4
    lea edx, [ecx + 3]
    mov dword [ebp - 8], eax
    and dl, 0xfc
    call 0xa0f4f
    cmp edx, eax
    jae short loc_2e1f
    mov eax, edx
    sub esp, eax
    mov eax, esp
    jmp short loc_2e21
loc_2e1f:
    xor eax, eax
loc_2e21:
    mov esi, eax
    test eax, eax
    jne short loc_2e34
    push 0x339c
    call 0x98f6c
    add esp, 4
loc_2e34:
    mov edx, dword [ebp - 8]
    mov eax, dword [ebp - 4]
    xor ebx, ebx
    call 0xa0f58
    mov eax, dword [ebp - 4]
    mov ebx, ecx
    mov edx, esi
    call 0x9c728
    mov eax, dword [ebp - 0xc]
    mov edx, dword [0x1a40f8]
    add edx, eax
    mov dword [0x1a40f8], edx
    lea eax, [edx*4]
    add edx, eax
    mov eax, 0x1a40f4
    lea edx, [edx*4]
    call 0x992e0
    lea eax, [edi*4]
    add eax, edi
    mov ecx, dword [0x1a40f4]
    lea eax, [eax*4]
    add ecx, eax
    jmp short loc_2ec3
loc_2e92:
    mov eax, dword [ebp - 4]
    mov dword [ecx + 8], eax
    mov eax, dword [esi]
    mov ebx, 8
    call 0x99180
    mov dword [ecx + 0xc], eax
    lea edx, [esi + 8]
    mov eax, dword [esi + 4]
    inc edi
    call 0x99180
    mov dword [ecx + 0x10], eax
    mov eax, ecx
    add esi, 0x10
    call 0xa0f9b
    add ecx, 0x14
loc_2ec3:
    cmp edi, dword [0x1a40f8]
    jb short loc_2e92
    mov esp, ebp
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
    mov edx, eax
    xor ebx, ebx
    mov eax, 5
    mov dword [0x1a40f8], ebx
    call 0x992b4
    push 0x33d0
    mov dword [0x1a40f4], eax
    call 0x9fc44
    add esp, 4
    mov eax, edx
    call 0x9c70c
    test eax, eax
    je short loc_2f18
    mov eax, edx
    call loc_2d8c
loc_2f18:
    mov ecx, dword [0x1a40f8]
    test ecx, ecx
    je short loc_2f47
    lea ebx, [ecx*4]
    mov esi, 1
    mov eax, ebx
    xor edx, edx
    call 0x992b4
    mov dword [0x1a40f0], eax
    call 0xa0fc0
    mov dword [0x9eec], esi
loc_2f47:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x1a40f8]
    dec eax
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
loc_2f5c:
    push ebx
    push edx
    mov edx, eax
    mov ebx, dword [0x1a40f8]
    lea edx, [eax + 1]
    cmp edx, ebx
    jl short loc_2f7b
    push edx
    push 0x33e8
    call 0x98f6c
    add esp, 8
loc_2f7b:
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [0x1a40f4]
    mov eax, dword [edx + eax*4 + 0x10]
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
    push ebx
    push edx
    mov edx, eax
    mov ebx, dword [0x1a40f8]
    lea edx, [eax + 1]
    cmp edx, ebx
    jl short loc_2fbb
    push edx
    push 0x3408
    call 0x98f6c
    add esp, 8
loc_2fbb:
    lea eax, [edx*4]
    add edx, eax
    mov eax, dword [0x1a40f4]
    lea edx, [edx*4]
    add eax, edx
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
loc_2fdc:
    push ebx
    push ecx
    push esi
    mov ebx, eax
    mov esi, edx
    cmp eax, dword [0x1a40f8]
    jl short loc_2ff9
    push eax
    push 0x342c
    call 0x98f6c
    add esp, 8
loc_2ff9:
    test ebx, ebx
    jge short loc_300b
    push ebx
    push 0x344c
    call 0x98f6c
    add esp, 8
loc_300b:
    lea eax, [ebx*4]
    add eax, ebx
    mov ecx, dword [0x1a40f4]
    lea eax, [eax*4]
    add ecx, eax
    xor ebx, ebx
    mov edx, dword [ecx + 0xc]
    mov eax, dword [ecx + 8]
    call 0xa0f58
    mov edx, esi
    mov ebx, dword [ecx + 0x10]
    mov eax, dword [ecx + 8]
    call 0x9c728
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov ecx, eax
    mov edx, dword [0x1a40f8]
    lea ecx, [eax + 1]
    cmp ecx, edx
    jb short loc_306f
    push edx
    push ecx
    push 0x3464
    call 0x98f6c
    add esp, 0xc
loc_306f:
    mov eax, dword [0x1a40f0]
    lea esi, [ecx*4]
    cmp dword [esi + eax], 0
    jne short loc_30b9
    mov byte [ecx + 0x1a42d4], 0xc8
    mov ebx, 0x1a42d4
    add ebx, ecx
    lea eax, [ecx - 1]
    call loc_2f5c
    mov edi, dword [0x1a40f0]
    add edi, esi
    mov edx, eax
    mov eax, edi
    call 0x77508
    mov eax, dword [0x1a40f0]
    mov edx, dword [esi + eax]
    mov eax, ecx
    call loc_2fdc
    jmp short loc_30e3
loc_30b9:
    mov ah, byte [ecx + 0x1a42d4]
    cmp ah, 0xc8
    jae short loc_30d9
    mov byte [ecx + 0x1a42d4], 0xc8
    mov eax, dword [0x1a40f0]
    mov eax, dword [eax + ecx*4]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_30d9:
    mov dl, ah
    inc dl
    mov byte [ecx + 0x1a42d4], dl
loc_30e3:
    mov eax, dword [0x1a40f0]
    mov eax, dword [eax + ecx*4]
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
    add byte [ebx + 0x6f], al
    db 0x6d    ; insd dword es:[edi], dx
    db 0x6d    ; insd dword es:[edi], dx
    bound esp, qword [ecx + 0x74]
    dec ebp
    popad
    arpl word [edx + 0x6f], si
    and esp, dword [eax]
    add byte [eax + 0x56525153], dl
    push edi
    sub esp, 0x17c
    mov edx, 0x3780
    mov eax, 0xa224
    call 0x9fc25
    mov eax, 0xa224
    call 0x9fcb0
    add eax, 0xa224
loc_3135:
    dec eax
    cmp byte [eax], 0x2e
    jne short loc_3135
    mov edx, eax
    lea eax, [esp + 0x171]
    mov ebx, esp
    call 0x9fc25
    mov dh, 0x2a
    lea eax, [esp + 0x170]
    mov byte [esp + 0x170], dh
    xor edx, edx
    xor ecx, ecx
    call 0xa0d22
    test eax, eax
    jne short loc_3193
loc_3168:
    mov eax, 0x80
    inc ecx
    lea edx, [esp + 0x1e]
    call 0x992b4
    mov dword [esp + ecx*4 + 0x11c], eax
    call 0x9fc25
    cmp ecx, 0x14
    je short loc_3193
    mov eax, esp
    call 0xa0d3f
    test eax, eax
    je short loc_3168
loc_3193:
    mov eax, 0x378c
    xor ebx, ebx
    call 0x98fd0
    mov bl, al
    test ebx, ebx
    je short loc_31ba
    mov eax, dword [0x14100]
    mov edx, dword [eax + ebx*4 + 4]
    mov eax, 0xa224
    xor ecx, ecx
    call 0x9fc25
loc_31ba:
    cmp ecx, 1
    jle near loc_32fc
    push 0x3798
    call 0x9fc44
    add esp, 4
    push 0x37c4
    call 0x9fc44
    add esp, 4
    push 0x37f0
    call 0x9fc44
    add esp, 4
    push 0x383c
    xor ebx, ebx
    call 0x9fc44
    add esp, 4
    jmp short loc_324a
loc_31fb:
    lea esi, [ebx*4]
    mov edx, 0x3780
    mov eax, dword [esp + esi + 0x120]
    call 0xa0fd8
    test eax, eax
    je short loc_322e
    xor eax, eax
    mov edi, dword [esp + esi + 0x120]
    mov al, bl
    push edi
    add eax, 0x61
    push eax
    push 0x3854
    jmp short loc_3241
loc_322e:
    mov edx, dword [esp + esi + 0x120]
    mov al, bl
    push edx
    add eax, 0x61
    push eax
    push 0x385c
loc_3241:
    call 0x9fc44
    add esp, 0xc
    inc ebx
loc_324a:
    cmp ebx, ecx
    jl short loc_31fb
    push 0x3870
    call 0x9fc44
    add esp, 4
    push 0x3780
    push 0x3874
    call 0x9fc44
    add esp, 8
    mov esi, 9
    call 0x9c43c
    call 0x9c450
    call 0xa1020
    mov edx, eax
    call 0xa1020
    lea edi, [eax + 0x3e8]
loc_328e:
    call 0xa1020
    cmp eax, edi
    jae short loc_32ef
    call 0xa1020
    cmp eax, edx
    jbe short loc_32c1
    push esi
    push 0x38b4
    call 0x9fc44
    add esp, 8
    mov eax, 0x1412a
    dec esi
    call 0xa1025
    call 0xa1020
    lea edx, [eax + 0x64]
loc_32c1:
    call 0x9c39c
    test eax, eax
    je short loc_328e
    xor ebx, ebx
    call 0x9c3b0
    mov bl, al
    sub ebx, 0x61
    test ebx, ebx
    jl short loc_328e
    cmp ebx, ecx
    jge short loc_328e
    mov eax, 0xa224
    mov edx, dword [esp + ebx*4 + 0x120]
    call 0x9fc25
loc_32ef:
    push 0x38c8
    call 0x9fc44
    add esp, 4
loc_32fc:
    cmp ecx, 1
    jne short loc_3312
    mov edx, dword [esp + 0x120]
    mov eax, 0xa224
    call 0x9fc25
loc_3312:
    push 0xa224
    push 0x38cc
    call 0x9fc44
    add esp, 8
    call 0xa1020
    lea ebx, [eax + 0x4b]
loc_332c:
    call 0xa1020
    cmp eax, ebx
    jb short loc_332c
    xor ebx, ebx
    cmp ebx, ecx
    jl short loc_3347
    add esp, 0x17c
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_3347:
    mov eax, dword [esp + ebx*4 + 0x120]
    call 0x99304
    inc ebx
    cmp ebx, ecx
    jl short loc_3347
    add esp, 0x17c
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
loc_336c:
    push ebx
    push ecx
    push edx
    mov ecx, eax
    xor ebx, ebx
    cmp ebx, 0x34
    jl short loc_3381
    mov eax, 0xffffffff
    pop edx
    pop ecx
    pop ebx
    ret
loc_3381:
    mov eax, ecx
    mov edx, dword [ebx*4 + 0xa154]
    call 0xa0fd8
    test eax, eax
    jne short loc_3399
    mov eax, ebx
    pop edx
    pop ecx
    pop ebx
    ret
loc_3399:
    inc ebx
    cmp ebx, 0x34
    jl short loc_3381
    mov eax, 0xffffffff
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    cmp eax, 0x34
    jge short loc_33b9
    mov eax, dword [eax*4 + 0xa154]
    ret
loc_33b9:
    xor eax, eax
    ret
loc_33bc:
    push ebx
    push edx
    mov ebx, eax
    mov edx, 0x38e4
    call 0xa0fd8
    test eax, eax
    je short loc_341b
    mov edx, 0x38f4
    mov eax, ebx
    call 0xa0fd8
    test eax, eax
    jne short loc_33e6
    mov eax, 1
    pop edx
    pop ebx
    ret
loc_33e6:
    mov edx, 0x3904
    mov eax, ebx
    call 0xa0fd8
    test eax, eax
    jne short loc_33fe
    mov eax, 5
    pop edx
    pop ebx
    ret
loc_33fe:
    mov edx, 0x3914
    mov eax, ebx
    call 0xa0fd8
    test eax, eax
    jne short loc_3416
    mov eax, 2
    pop edx
    pop ebx
    ret
loc_3416:
    mov eax, 0xffffffff
loc_341b:
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push edx
    push edi
    push ebp
    mov edx, 1
    mov edi, 0xc0
    mov ebp, 0x80
    mov ebx, 8
    xor eax, eax
    mov dword [0x1b8ab8], edx
    mov dword [0x1b8ab4], edx
    mov ecx, edx
    mov dword [0x1b8abc], edx
    mov dword [0x1b8ac0], edx
    mov dword [0x1b8cd8], edi
    mov dword [0x1b8cdc], ebp
    mov dword [0x1b8cb4], eax
    mov dword [0xf19a0], eax
    mov dword [0x125d4b], ebx
    mov dword [0x125d4f], eax
    mov dword [0x125d27], ecx
    mov dword [0x125d2b], ecx
    mov edi, ecx
    mov dword [0x1261ef], ecx
    mov dword [0x1261cb], ecx
    xor edx, edx
    xor ah, ah
    mov dword [0x1261c7], edi
    mov byte [0x125bf0], ah
    mov dword [0x125d53], edx
    pop ebp
    pop edi
    pop edx
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
    sub esp, 0xa4
    mov edx, 0x392c
    mov eax, dword [0x1b8ab0]
    call 0x9ab28
    xor esi, esi
    mov dword [esp + 0xa0], eax
    jmp near loc_3588
loc_34e5:
    mov edx, 0x392c
    mov eax, dword [0x1b8ab0]
    mov ebx, esi
    call 0x9ab74
    call loc_336c
    mov ebp, eax
    cmp eax, -1
    je near loc_3587
    mov ebx, 0x50
    lea eax, [esp + 0x50]
    xor edx, edx
    call 0xa0fc0
    mov ebx, 0x50
    mov eax, esp
    xor edx, edx
    call 0xa0fc0
    mov eax, esp
    mov edx, 0x392c
    mov ebx, esi
    push eax
    mov eax, dword [0x1b8ab0]
    lea ecx, [esp + 0x54]
    call 0x9ab74
    mov edx, 0x392c
    mov edi, dword [0x1b8ab0]
    mov ebx, eax
    mov eax, edi
    call 0x9ace8
    xor dl, dl
    mov ah, byte [esp + 0x50]
    xor dh, dh
    test ah, ah
    je short loc_3567
    lea eax, [esp + 0x50]
    call 0x9c484
    mov dl, al
loc_3567:
    cmp byte [esp], 0
    je short loc_3576
    mov eax, esp
    call 0x9c484
    mov dh, al
loc_3576:
    xor ebx, ebx
    mov bl, dh
    and edx, 0xff
    mov eax, ebp
    call 0x9d6ac
loc_3587:
    inc esi
loc_3588:
    cmp esi, dword [esp + 0xa0]
    jl near loc_34e5
    add esp, 0xa4
    pop ebp
    pop edi
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
    sub esp, 0xa8
    mov edi, eax
    xor esi, esi
    cmp esi, 3
    jl short loc_35c7
    xor esi, esi
    jmp near loc_37ba
loc_35c7:
    push esi
    push 0x393c
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0x9fc79
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa0fc0
    mov ebx, esp
    mov edx, 0x394c
    mov eax, edi
    call 0x9ac50
    lea eax, [esp + 0x50]
    call loc_336c
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_361a
    mov edx, esi
    xor ebx, ebx
    call 0x9d790
loc_361a:
    push esi
    push 0x3958
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0x9fc79
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa0fc0
    mov ebx, esp
    mov edx, 0x394c
    mov eax, edi
    call 0x9ac50
    lea eax, [esp + 0x50]
    call loc_336c
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3670
    mov ebx, 1
    mov edx, esi
    call 0x9d790
loc_3670:
    inc esi
    cmp esi, 3
    jl near loc_35c7
    xor esi, esi
    jmp near loc_37ba
loc_3681:
    push esi
    push 0x3970
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0x9fc79
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa0fc0
    mov ebx, esp
    mov edx, 0x394c
    mov eax, edi
    call 0x9ac50
    lea eax, [esp + 0x50]
    call loc_33bc
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_36d4
    mov edx, eax
    mov eax, esi
    call 0x9d7d4
loc_36d4:
    push esi
    push 0x3984
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0x9fc79
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa0fc0
    mov ebx, esp
    mov edx, 0x394c
    mov eax, edi
    call 0x9ac50
    lea eax, [esp + 0x50]
    call loc_336c
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3729
    mov edx, eax
    xor ebx, ebx
    mov eax, esi
    call 0x9d83c
loc_3729:
    push esi
    push 0x399c
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0x9fc79
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa0fc0
    mov ebx, esp
    mov edx, 0x394c
    mov eax, edi
    call 0x9ac50
    lea eax, [esp + 0x50]
    call loc_336c
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3781
    mov ebx, 1
    mov edx, eax
    mov eax, esi
    call 0x9d83c
loc_3781:
    push esi
    push 0x39b4
    lea eax, [esp + 8]
    push eax
    lea ecx, [esp + 0xb0]
    lea ebx, [esp + 0xc]
    call 0x9fc79
    add esp, 0xc
    mov edx, 0x394c
    mov eax, edi
    call 0x9ae08
    mov edx, dword [esp + 0xa4]
    mov eax, esi
    call 0x9d814
    inc esi
loc_37ba:
    cmp esi, 2
    jl near loc_3681
    lea ecx, [esp + 0xa0]
    mov ebx, 0x39c8
    mov edx, 0x394c
    mov eax, edi
    call 0x9ae08
    mov eax, dword [esp + 0xa0]
    call 0x9ccec
    add esp, 0xa8
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
    sub esp, 0xa4
    mov edi, eax
    xor esi, esi
    cmp esi, 8
    jl short loc_3817
    xor esi, esi
    jmp near loc_397f
loc_3817:
    push esi
    push 0x39dc
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0x9fc79
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa0fc0
    mov ebx, esp
    mov edx, 0x394c
    mov eax, edi
    call 0x9ac50
    lea eax, [esp + 0x50]
    call loc_336c
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_386a
    mov edx, esi
    xor ebx, ebx
    call 0x9d790
loc_386a:
    push esi
    push 0x39f0
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0x9fc79
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa0fc0
    mov ebx, esp
    mov edx, 0x394c
    mov eax, edi
    call 0x9ac50
    lea eax, [esp + 0x50]
    call loc_336c
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_38c0
    mov ebx, 1
    mov edx, esi
    call 0x9d790
loc_38c0:
    inc esi
    cmp esi, 8
    jl near loc_3817
    xor esi, esi
    jmp near loc_397f
loc_38d1:
    push esi
    push 0x3a0c
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0x9fc79
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa0fc0
    mov ebx, esp
    mov edx, 0x394c
    mov eax, edi
    call 0x9ac50
    lea eax, [esp + 0x50]
    call loc_336c
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3926
    mov edx, eax
    xor ebx, ebx
    mov eax, esi
    call 0x9d83c
loc_3926:
    push esi
    push 0x3a24
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0x9fc79
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa0fc0
    mov ebx, esp
    mov edx, 0x394c
    mov eax, edi
    call 0x9ac50
    lea eax, [esp + 0x50]
    call loc_336c
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_397e
    mov ebx, 1
    mov edx, eax
    mov eax, esi
    call 0x9d83c
loc_397e:
    inc esi
loc_397f:
    cmp esi, 2
    jl near loc_38d1
    lea ecx, [esp + 0xa0]
    mov ebx, 0x3a3c
    mov edx, 0x394c
    mov eax, edi
    call 0x9ae08
    mov al, byte [esp + 0xa0]
    mov byte [0x14078], al
    add esp, 0xa4
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xa8
    mov edi, eax
    xor esi, esi
    cmp esi, 8
    jl short loc_39d7
    xor esi, esi
    jmp near loc_3bb6
loc_39d7:
    push esi
    push 0x39dc
    lea eax, [esp + 0x58]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0x9fc79
    add esp, 0xc
    mov eax, esp
    mov ecx, esp
    call 0xa0fc0
    lea ebx, [esp + 0x50]
    mov edx, 0x394c
    mov eax, edi
    call 0x9ac50
    mov eax, esp
    call loc_336c
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3a26
    mov edx, esi
    xor ebx, ebx
    call 0x9d790
loc_3a26:
    push esi
    push 0x39f0
    lea eax, [esp + 0x58]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0x9fc79
    add esp, 0xc
    mov eax, esp
    mov ecx, esp
    call 0xa0fc0
    lea ebx, [esp + 0x50]
    mov edx, 0x394c
    mov eax, edi
    call 0x9ac50
    mov eax, esp
    call loc_336c
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3a78
    mov ebx, 1
    mov edx, esi
    call 0x9d790
loc_3a78:
    inc esi
    cmp esi, 8
    jl near loc_39d7
    xor esi, esi
    jmp near loc_3bb6
loc_3a89:
    push esi
    push 0x3a4c
    lea eax, [esp + 0x58]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0x9fc79
    add esp, 0xc
    mov eax, esp
    mov ecx, esp
    call 0xa0fc0
    lea ebx, [esp + 0x50]
    mov edx, 0x394c
    mov eax, edi
    call 0x9ac50
    mov eax, esp
    call loc_33bc
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3ad8
    mov edx, eax
    mov eax, esi
    call 0x9d7d4
loc_3ad8:
    push esi
    push 0x3a64
    lea eax, [esp + 0x58]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0x9fc79
    add esp, 0xc
    mov eax, esp
    mov ecx, esp
    call 0xa0fc0
    lea ebx, [esp + 0x50]
    mov edx, 0x394c
    mov eax, edi
    call 0x9ac50
    mov eax, esp
    call loc_336c
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3b29
    mov edx, eax
    xor ebx, ebx
    mov eax, esi
    call 0x9d83c
loc_3b29:
    push esi
    push 0x3a80
    lea eax, [esp + 0x58]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0x9fc79
    add esp, 0xc
    mov eax, esp
    mov ecx, esp
    call 0xa0fc0
    lea ebx, [esp + 0x50]
    mov edx, 0x394c
    mov eax, edi
    call 0x9ac50
    mov eax, esp
    call loc_336c
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3b7d
    mov ebx, 1
    mov edx, eax
    mov eax, esi
    call 0x9d83c
loc_3b7d:
    push esi
    push 0x3a9c
    lea eax, [esp + 0x58]
    push eax
    lea ecx, [esp + 0xb0]
    lea ebx, [esp + 0x5c]
    call 0x9fc79
    add esp, 0xc
    mov edx, 0x394c
    mov eax, edi
    call 0x9ae08
    mov edx, dword [esp + 0xa4]
    mov eax, esi
    call 0x9d814
    inc esi
loc_3bb6:
    cmp esi, 4
    jl near loc_3a89
    lea ecx, [esp + 0xa0]
    mov ebx, 0x3a3c
    mov edx, 0x394c
    mov eax, edi
    call 0x9ae08
    mov al, byte [esp + 0xa0]
    mov ecx, 0x14068
    mov ebx, 0x3ab4
    mov edx, 0x394c
    mov byte [0x14078], al
    mov eax, edi
    call 0x9ae08
    add esp, 0xa8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 8
    xor edx, edx
    mov edi, 0x3ac4
    mov word [esp + 4], dx
    jmp short loc_3c93
loc_3c22:
    mov al, byte [esp + 4]
    add al, 0x30
    mov edx, 0x3ad0
    mov byte [edi + 4], al
    mov eax, edi
    call 0xa0223
    mov esi, eax
    test eax, eax
    je short loc_3c8e
    mov ebx, 1
    mov edx, 4
    mov ecx, eax
    mov eax, esp
    call 0x7822d
    cmp dword [esp], 0x75
    jne short loc_3c9b
    mov ebx, 1
    mov edx, 4
    mov eax, esp
    mov ecx, esi
    call 0x7822d
    movsx eax, word [esp + 4]
    imul eax, eax, 0x16
    mov ebx, 1
    mov edx, 0x13
    mov ecx, esi
    add eax, 0x125b14
    call 0x7822d
    mov eax, esi
    call 0x9fcc9
loc_3c8e:
    inc word [esp + 4]
loc_3c93:
    cmp word [esp + 4], 0xa
    jl short loc_3c22
loc_3c9b:
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
%else
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 8
    mov dword [esp + 4], eax
    movsx ecx, ax
    lea edx, [ecx*4]
    add edx, ecx
    db 0x8b, 0x04, 0x55, 0x66, 0x02, 0x0e, 0x00    ; mov eax, dword [edx*2 + 0xe0266]
    mov edx, ecx
    shl edx, 7
    sub edx, ecx
    lea edx, [edx*4]
    sub edx, ecx
    mov esi, 0xb4f00
    add edx, edx
    add esi, edx
    mov dx, word [esi + 0x34c]
    mov dword [esp], eax
    cmp dx, 1
    je near loc_0bea
    shr eax, 0x17
    and eax, 1
    mov bx, word [esi + 0x280]
    mov dword [esi + 0x280], eax
    movsx eax, bx
    cmp eax, dword [esi + 0x280]
    jle short loc_007a
    mov byte [esi + 0x3f5], 9
loc_007a:
    test byte [esp + 2], 0x40
    je short loc_00b4
    cmp word [esi + 0x352], 0
    jne short loc_00b4
    cmp word [esi + 0x312], 0
    jne short loc_009f
    cmp word [esi + 0x334], 0
    jne short loc_00b4
loc_009f:
    mov eax, 0x50
    mov edx, esi
    mov word [esi + 0x352], 0xe
    call 0x15e90
loc_00b4:
    test dword [esp], 0xfb799f00
    jne short loc_00cb
    mov word [esi + 0x37e], 0
    jmp near loc_0bea
loc_00cb:
    cmp word [esi + 0x37e], 0
    jne near loc_0bea
    mov dl, byte [esp + 2]
    test dl, 2
    jne near loc_0bea
    mov word [esi + 0x37e], 1
    test dl, 0x20
    je short loc_015b
    xor bl, bl
    mov byte [0x2c23d9], bl
    cmp word [0xe92f3], 0
    sete al
    xor ah, ah
    mov word [0xe92f3], ax
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jne short loc_0124
    test byte [esp], 0x20
    je short loc_0124
    mov word [0xe92f3], 2
loc_0124:
    cmp word [0xe92f3], 0
    je short loc_013f
    call 0x8bfb8
    call 0x94a94
    call loc_2d28
    jmp short loc_015b
loc_013f:
    cmp dword [0x1273a4], 0
    je short loc_014d
    call 0x8bfb3
loc_014d:
    mov cl, 1
    mov byte [0xe982d], cl
    mov byte [0xe982f], cl
loc_015b:
    cmp word [0xe92f3], 0
    jne near loc_0bea
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bce], 0
    jle near loc_0bea
    test byte [esp + 3], 0x40
    je short loc_01ce
    movsx eax, word [esi + 0x31e]
    cmp eax, -1
    jne short loc_01ce
    mov al, byte [esi + 0x3c9]
    dec al
    cmp al, 4
    ja short loc_01ce
    and eax, 0xff
    jmp dword cs:[eax*4 + 0x484c4]
    or byte [esp + 3], 2
    jmp short loc_01ce
    or byte [esp + 3], 1
    jmp short loc_01ce
    or byte [esp + 1], 0x80
    jmp short loc_01ce
    or byte [esp + 2], 1
    jmp short loc_01ce
    or byte [esp + 1], 0x10
loc_01ce:
    test byte [esp + 1], 0x80
    je short loc_0229
    cmp word [esi + 0x354], 0
    jle short loc_0229
    mov ch, byte [esi + 0x3d0]
    test ch, ch
    sete al
    mov byte [esi + 0x3d0], al
    mov eax, esi
    call 0x47d00
    mov eax, 0xd5
    movsx edx, word [esi + 0x340]
    mov byte [esi + 0x3c9], 5
    call loc_2748
    mov ah, byte [esi + 0x3d0]
    mov edx, esi
    test ah, ah
    sete al
    xor ah, ah
    db 0x05, 0x6a, 0x00, 0x00, 0x00    ; add eax, 0x6a
    cwde
    call 0x15e90
loc_0229:
    test byte [esp + 1], 0x10
    je short loc_027a
    mov cx, word [esi + 0x38a]
    cmp cx, 0x190
    jne near loc_0bea
    mov edi, ecx
    mov eax, 0xd9
    dec edi
    movsx edx, word [esi + 0x340]
    mov word [esi + 0x38a], di
    call loc_2748
    mov eax, 0xc
    mov edx, esi
    mov byte [esi + 0x3c9], 2
    call 0x15e90
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_027a:
    movsx eax, word [esi + 0x31e]
    cmp eax, -1
    jne near loc_0420
    test byte [esp + 2], 0x10
    jne short loc_02a5
    test byte [esp + 3], 8
    jne short loc_02a5
    cmp byte [esi + 0x3e4], 0
    je near loc_0420
loc_02a5:
    mov cl, byte [esp + 3]
    mov dword [esi + 0x22c], 0x34
    test cl, 8
    setne al
    mov ch, byte [esi + 0x3e4]
    xor ah, ah
    test ch, ch
    je short loc_02cb
    mov byte [esi + 0x3e4], ah
loc_02cb:
    mov dl, byte [esi + 0x3c9]
    xor ebx, ebx
loc_02d3:
    cmp bx, 9
    jge near loc_03cd
    inc ebx
    cmp dl, 7
    ja near loc_03cf
    xor ecx, ecx
    mov cl, dl
    jmp dword cs:[ecx*4 + 0x484d8]
    cmp word [esi + 0x388], 0
    jle short loc_0307
    cmp bx, 1
    jg near loc_03cf
loc_0307:
    test ax, ax
    je short loc_0310
loc_030c:
    mov dl, 5
    jmp short loc_02d3
loc_0310:
    mov dl, 3
    jmp short loc_02d3
    cmp word [esi + 0x386], 0
    jle short loc_0328
    cmp bx, 1
    jg near loc_03cf
loc_0328:
    test ax, ax
    je short loc_030c
loc_032d:
    mov dl, 7
    jmp short loc_02d3
    cmp word [esi + 0x38a], 0
    jle short loc_0345
    cmp bx, 1
    jg near loc_03cf
loc_0345:
    test ax, ax
    je short loc_034e
    mov dl, 3
    jmp short loc_02d3
loc_034e:
    mov dl, 1
    jmp short loc_02d3
    cmp word [esi + 0x31c], 0
    jle short loc_0366
    cmp bx, 1
    jg near loc_03cf
loc_0366:
    test ax, ax
    je short loc_0372
loc_036b:
    mov dl, 4
    jmp near loc_02d3
loc_0372:
    mov dl, 2
    jmp near loc_02d3
    cmp word [esi + 0x33a], 0
    jle short loc_0389
    cmp bx, 1
    jg short loc_03cf
loc_0389:
    test ax, ax
    je short loc_032d
    mov dl, 2
    jmp near loc_02d3
    cmp word [esi + 0x354], 0
    jle short loc_03a5
    cmp bx, 1
    jg short loc_03cf
loc_03a5:
    test ax, ax
    je short loc_036b
loc_03aa:
    mov dl, 6
    jmp near loc_02d3
    cmp word [esi + 0x39c], 0
    jle short loc_03c1
    cmp bx, 1
    jg short loc_03cf
loc_03c1:
    test ax, ax
    je short loc_03aa
    mov dl, 1
    jmp near loc_02d3
loc_03cd:
    xor dl, dl
loc_03cf:
    mov al, dl
    dec al
    mov byte [esi + 0x3c9], dl
    cmp al, 6
    ja short loc_0420
    and eax, 0xff
    jmp dword cs:[eax*4 + 0x484f8]
    mov eax, 3
    jmp short loc_0419
    mov eax, 0x5a
    jmp short loc_0419
    mov eax, 0x5b
    jmp short loc_0419
    mov eax, 0x58
    jmp short loc_0419
    mov eax, 0x65
    jmp short loc_0419
    mov eax, 0x59
    jmp short loc_0419
    mov eax, 6
loc_0419:
    mov edx, esi
    call 0x15e90
loc_0420:
    mov eax, dword [esp]
    and eax, 0xf00
    shr eax, 8
    lea ecx, [eax - 1]
    test ecx, ecx
    jbe short loc_0443
    cmp word [esi + 0x334], 0
    jle short loc_0443
    mov word [esi + 0x31a], cx
loc_0443:
    cmp dword [esi + 0x258], 0x1624
    jg near loc_0972
    cmp word [esi + 0x384], 0
    jne near loc_0972
    cmp word [esi + 0x334], 0
    jne near loc_0972
    cmp word [esi + 0x352], 0
    jne near loc_0972
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    cmp byte [eax + 0x1c0bb8], 0x20
    jbe near loc_0972
    cmp word [esi + 0x32a], 0
    jne near loc_0972
    cmp word [esi + 0x328], 0
    jne near loc_0972
    cmp word [esi + 0x392], 0
    je short loc_04d7
    cmp byte [esi + 0x3d1], 0
    je near loc_0900
    movsx eax, word [esi + 0x392]
    cmp eax, -9
    jne near loc_0900
loc_04d7:
    cmp ecx, 0xa
    je short loc_04e5
    cmp ecx, 0xb
    jne near loc_0615
loc_04e5:
    mov ax, word [esi + 0x312]
    cmp ecx, 0xa
    jne short loc_04f8
    mov ecx, 0xffffffff
    jmp short loc_04fd
loc_04f8:
    mov ecx, 1
loc_04fd:
    xor ebx, ebx
loc_04ff:
    test ax, ax
    jl short loc_050a
    db 0x66, 0x3d, 0x0a, 0x00    ; cmp ax, 0xa
    jl short loc_0527
loc_050a:
    db 0x66, 0x3d, 0x10, 0x00    ; cmp ax, 0x10
    jne near loc_0615
    movsx edx, word [esi + 0x2a4]
    test edx, 0x10000
    je near loc_0615
loc_0527:
    db 0x66, 0x3d, 0x10, 0x00    ; cmp ax, 0x10
    jne short loc_0540
    cmp ecx, -1
    jne short loc_0539
    mov eax, 5
    jmp short loc_055c
loc_0539:
    mov eax, 7
    jmp short loc_055c
loc_0540:
    add eax, ecx
    db 0x66, 0x3d, 0x06, 0x00    ; cmp ax, 6
    jne short loc_055c
    movsx edx, word [esi + 0x2a4]
    test edx, 0x10000
    je short loc_055c
    mov eax, 0x10
loc_055c:
    movsx edx, ax
    cmp edx, -1
    jne short loc_056b
    mov eax, 9
    jmp short loc_0573
loc_056b:
    db 0x66, 0x3d, 0x0a, 0x00    ; cmp ax, 0xa
    jne short loc_0573
    xor eax, eax
loc_0573:
    movsx edx, ax
    cmp byte [edx + esi + 0x3d3], 0
    je short loc_05ad
    cmp word [esi + edx*2 + 0x2a6], 0
    jle short loc_05ad
    db 0x66, 0x3d, 0x0b, 0x00    ; cmp ax, 0xb
    jne short loc_05a5
    movsx edx, word [esi + 0x2a4]
    test edx, 0x10000
    je short loc_05a5
    mov eax, 0x10
loc_05a5:
    movsx ecx, ax
    jmp near loc_0615
loc_05ad:
    db 0x66, 0x3d, 0x10, 0x00    ; cmp ax, 0x10
    jne short loc_05d7
    cmp word [esi + 0x2c6], 0
    jne short loc_05d7
    cmp byte [esi + 0x3de], 0
    je short loc_05d7
    cmp word [esi + 0x2bc], 0
    jle short loc_05d7
    mov ecx, 0xb
    jmp short loc_0615
loc_05d7:
    db 0x66, 0x3d, 0x0b, 0x00    ; cmp ax, 0xb
    jne short loc_0601
    cmp word [esi + 0x2bc], 0
    jne short loc_0601
    cmp byte [esi + 0x3de], 0
    je short loc_0601
    cmp word [esi + 0x2c6], 0
    jle short loc_0601
    mov ecx, 0x10
    jmp short loc_0615
loc_0601:
    inc ebx
    cmp bx, 0xa
    jne near loc_04ff
    mov eax, esi
    xor edx, edx
    call 0x27620
loc_0615:
    mov eax, 0xffffffff
    cmp ecx, 0xa
    jne short loc_066f
    cmp word [esi + 0x2ba], 0
    jne short loc_066f
    mov ax, word [0x2454c4]
loc_062f:
    test ax, ax
    jl short loc_066f
    movsx edx, ax
    imul edx, edx, 0x2c
    cmp word [edx + 0x1c0bb2], 0x1a
    jne short loc_0662
    mov dx, word [edx + 0x1c0bc2]
    cmp dx, word [esi + 0x340]
    jne short loc_0662
    mov ecx, 0xf
    mov byte [esi + 0x3dd], 1
    jmp short loc_066f
loc_0662:
    movsx edx, ax
    db 0x66, 0x8b, 0x04, 0x55, 0xa4, 0xf7, 0x1a, 0x00    ; mov ax, word [edx*2 + 0x1af7a4]
    jmp short loc_062f
loc_066f:
    cmp ecx, 0xb
    jne near loc_06dd
    mov ebx, dword [esp + 4]
    cmp bx, word [0xe8cc6]
    jne short loc_068c
    mov byte [0xe982f], 1
loc_068c:
    mov di, word [esi + 0x312]
    cmp di, 0x10
    je short loc_06ce
    cmp di, 0xb
    je short loc_06ce
    cmp word [esi + 0x2c6], 0
    jle short loc_06c4
    movsx edx, word [esi + 0x2a4]
    test edx, 0x10000
    jne short loc_06d8
    cmp word [esi + 0x2bc], 0
    jne short loc_06dd
    jmp short loc_06d8
loc_06c4:
    cmp word [esi + 0x2bc], 0
    jmp short loc_06dd
loc_06ce:
    cmp word [esi + 0x312], 0xb
    jne short loc_06dd
loc_06d8:
    mov ecx, 0x10
loc_06dd:
    cmp byte [esi + 0x3d1], 0
    je short loc_06ff
    mov bh, byte [esp + 2]
    or bh, 8
    mov word [esi + 0x392], 0xfff7
    mov byte [esp + 2], bh
    jmp near loc_0900
loc_06ff:
    cmp byte [ecx + esi + 0x3d3], 0
    je near loc_0900
    movsx edx, word [esi + 0x312]
    cmp edx, ecx
    je near loc_0900
    cmp ecx, 0x10
    ja near loc_0900
    jmp dword cs:[ecx*4 + 0x48514]
    mov eax, esi
    xor edx, edx
    jmp near loc_08fb
    cmp word [esi + 0x2b2], 0
    jne short loc_0761
    cmp word [esi + 0x384], 0
    jne short loc_0761
    mov ax, word [esi + 0x312]
    mov word [esi + 0x384], 0x20
    mov word [esi + 0x398], ax
loc_0761:
    mov edx, 6
    jmp near loc_08f9
    cmp word [esi + 0x2b4], 0
    jne short loc_0796
    cmp word [esi + 0x384], 0
    jne short loc_0796
    mov ax, word [esi + 0x312]
    mov word [esi + 0x384], 0x20
    mov word [esi + 0x398], ax
loc_0796:
    mov edx, 7
    jmp near loc_08f9
    cmp word [esi + 0x2b6], 0
    jne short loc_07cb
    cmp word [esi + 0x384], 0
    jne short loc_07cb
    mov ax, word [esi + 0x312]
    mov word [esi + 0x384], 0x20
    mov word [esi + 0x398], ax
loc_07cb:
    mov edx, 8
    jmp near loc_08f9
    cmp word [esi + 0x2b8], 0
    jne short loc_0800
    cmp word [esi + 0x384], 0
    jne short loc_0800
    mov ax, word [esi + 0x312]
    mov word [esi + 0x384], 0x20
    mov word [esi + 0x398], ax
loc_0800:
    mov edx, 9
    jmp near loc_08f9
    cmp word [esi + 0x2be], 0
    jne short loc_0835
    cmp word [esi + 0x384], 0
    jne short loc_0835
    mov ax, word [esi + 0x312]
    mov word [esi + 0x384], 0x20
    mov word [esi + 0x398], ax
loc_0835:
    mov edx, 0xc
    jmp near loc_08f9
    cmp word [esi + 0x2c2], 0
    jne short loc_086a
    cmp word [esi + 0x384], 0
    jne short loc_086a
    mov ax, word [esi + 0x312]
    mov word [esi + 0x384], 0x20
    mov word [esi + 0x398], ax
loc_086a:
    mov edx, 0xe
    jmp near loc_08f9
    cmp word [esi + ecx*2 + 0x2a6], 0
    jne short loc_08a0
    cmp word [esi + 0x384], 0
    jne short loc_08a0
    mov word [esi + 0x384], 0x20
    mov ax, word [esi + 0x312]
    mov word [esi + 0x398], ax
loc_08a0:
    movsx edx, cx
    jmp short loc_08f9
    test ax, ax
    jl short loc_0900
    mov word [esi + 0x312], 0xf
    mov word [esi + 0x314], 0xffff
    mov word [esi + 0x392], 0xa
    jmp short loc_0900
    cmp word [esi + 0x2ba], 0
    jle short loc_0900
    cmp byte [esi + 0x3dd], 0
    je short loc_0900
    mov edx, 0xa
    jmp short loc_08f9
    cmp word [esi + 0x2c0], 0
    jle short loc_0900
    cmp byte [esi + 0x3e0], 0
    je short loc_0900
    mov edx, 0xd
loc_08f9:
    mov eax, esi
loc_08fb:
    call 0x27620
loc_0900:
    test byte [esp + 2], 8
    je near loc_0972
    cmp word [esi + 0x312], 0
    jle short loc_0972
    cmp byte [esi + 0x3d1], 0
    jne short loc_0941
    cmp word [esi + 0x392], 0
    jne short loc_0941
    mov eax, 0x49
    mov byte [esi + 0x3d1], 1
    mov edx, esi
    mov word [esi + 0x392], 0xffff
    jmp short loc_096d
loc_0941:
    cmp byte [esi + 0x3d1], 1
    jne short loc_0972
    movsx eax, word [esi + 0x392]
    cmp eax, -9
    jne short loc_0972
    mov eax, 0x4a
    mov byte [esi + 0x3d1], 0
    mov edx, esi
    mov word [esi + 0x392], 0xa
loc_096d:
    call 0x15e90
loc_0972:
    test byte [esp + 3], 1
    je near loc_0a73
    movsx eax, word [esi + 0x31e]
    cmp eax, -1
    jne near loc_0a73
    movsx edx, word [esi + 0x38e]
    cmp edx, eax
    jne near loc_0a54
    cmp word [esi + 0x31c], 0
    jle near loc_0a35
    push 0xa
    push eax
    push 0
    push 0
    movsx eax, word [esi + 0x298]
    push eax
    push 0
    push 0
    mov ecx, dword [esi + 0x21c]
    mov ebx, dword [esi + 0x218]
    push -0x40
    mov edx, dword [esi + 0x214]
    add ecx, 0x1e00
    push 0x214
    movsx eax, word [esi + 0x29e]
    mov byte [esi + 0x3c9], 3
    call 0x18f70
    mov word [esi + 0x38e], ax
    cwde
    lea edx, [eax*8]
    add edx, eax
    lea edx, [edx*8]
    sub edx, eax
    xor ebp, ebp
    mov dword [edx + 0x4ea17], ebp
    mov dword [edx + 0x4ea13], ebp
    imul edx, eax, 0x2c
    xor ecx, ecx
    mov eax, dword [esp + 4]
    mov word [edx + 0x1c0bce], cx
    mov word [edx + 0x1c0bc6], ax
    mov eax, 0x2f
    jmp short loc_0a3a
loc_0a35:
    mov eax, 0x31
loc_0a3a:
    mov edx, esi
    call 0x15e90
    mov eax, 0x46
    movsx edx, word [esi + 0x38e]
    call loc_2748
    jmp short loc_0a73
loc_0a54:
    mov eax, 0x46
    call loc_2748
    mov eax, 0x30
    mov edx, esi
    mov word [esi + 0x38e], 0xffff
    call 0x15e90
loc_0a73:
    test byte [esp + 2], 1
    je near loc_0b04
    mov di, word [esi + 0x33a]
    test di, di
    jle near loc_0b04
    movsx edx, word [esi + 0x340]
    imul edx, edx, 0x2c
    mov eax, dword [0xe7220]
    movsx ecx, word [edx + 0x1c0bce]
    cmp ecx, eax
    jge short loc_0b04
    sub eax, ecx
    mov ecx, eax
    movsx eax, di
    cmp eax, ecx
    jbe short loc_0adc
    movsx eax, word [esi + 0x340]
    imul edx, eax, 0x2c
    sub edi, ecx
    mov word [esi + 0x33a], di
    mov ax, word [0xe7220]
    mov word [edx + 0x1c0bce], ax
    mov byte [esi + 0x3c9], 1
    jmp short loc_0af3
loc_0adc:
    add word [edx + 0x1c0bce], di
    mov eax, esi
    mov word [esi + 0x33a], 0
    call 0x27700
loc_0af3:
    mov eax, 0xd8
    movsx edx, word [esi + 0x340]
    call loc_2748
loc_0b04:
    test byte [esp + 3], 2
    je near loc_0bd0
    movsx eax, word [esi + 0x31e]
    cmp eax, -1
    jne near loc_0bd0
    cmp word [esi + 0x388], 0
    jle near loc_0bc4
    mov bl, byte [esi + 0x3cb]
    test bl, bl
    sete al
    mov byte [esi + 0x3cb], al
    test al, al
    je short loc_0b86
    mov edx, dword [esi + 0x39e]
    mov byte [esi + 0x3c9], 4
    test edx, edx
    jle short loc_0b6e
    mov eax, edx
    call 0x94a78
    mov eax, 0xf5
    call loc_2ba8
    mov dword [esi + 0x39e], 0
loc_0b6e:
    mov eax, 0x31
    movsx edx, word [esi + 0x340]
    call loc_2748
    mov eax, 0x34
    jmp short loc_0bc9
loc_0b86:
    movsx edx, word [esi + 0x340]
    mov byte [esi + 0x3ed], al
    mov eax, 0x33
    mov dword [esi + 0x254], 0
    call loc_2748
    mov eax, 0x32
    call loc_2788
    mov eax, 0x31
    mov edx, esi
    call loc_2788
    mov eax, 0x35
    jmp short loc_0bcb
loc_0bc4:
    mov eax, 0x32
loc_0bc9:
    mov edx, esi
loc_0bcb:
    call 0x15e90
loc_0bd0:
    test byte [esp + 3], 0x10
    je short loc_0bea
    cmp word [esi + 0x34a], 0
    jne short loc_0bea
    mov word [esi + 0x34a], 0xfc00
loc_0bea:
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 8
    mov edi, eax
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov esi, 0xb4f00
    add eax, eax
    add esi, eax
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov ax, word [edx + 0x2385c6]
    db 0x66, 0x3d, 0xfe, 0xff    ; cmp ax, 0xfffe
    jb short loc_0c53
    jbe near loc_0d2c
    db 0x66, 0x3d, 0xff, 0xff    ; cmp ax, 0xffff
    je short loc_0c7d
    jmp near loc_0d66
loc_0c53:
    cmp ax, 0x7fff
    jne near loc_0d66
    xor eax, eax
    mov word [edx + 0x2385c6], ax
    mov eax, 9
    mov edx, esi
    call 0x15e90
    inc byte [esi + 0x3ef]
    jmp near loc_1a16
loc_0c7d:
    mov bh, 8
    movsx ecx, word [0x261210]
    jmp short loc_0ca7
loc_0c88:
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    db 0x0f, 0xbf, 0x0c, 0x4d, 0x08, 0x11, 0x26, 0x00    ; movsx ecx, word [ecx*2 + 0x261108]
    db 0x88, 0x3c, 0x45, 0xa2, 0x52, 0x0b, 0x00    ; mov byte [eax*2 + 0xb52a2], bh
loc_0ca7:
    test ecx, ecx
    jge short loc_0c88
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    xor edx, edx
    mov bx, word [0xe92f5]
    mov word [eax*8 + 0x2385c6], dx
    test bx, bx
    je short loc_0cee
    movsx eax, bx
    mov word [0xe92f5], dx
    mov dword [0xe97e7], eax
    mov dword [0xe97d7], eax
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0cee:
    mov eax, dword [0xe97e7]
    inc eax
    mov edx, dword [0xe97eb]
    mov dword [0xe97e7], eax
    test edx, edx
    je short loc_0d08
    cmp eax, 0xa
    jg short loc_0d11
loc_0d08:
    cmp dword [0xe97e7], 5
    jle short loc_0d19
loc_0d11:
    xor esi, esi
    mov dword [0xe97e7], esi
loc_0d19:
    mov eax, dword [0xe97e7]
    mov dword [0xe97d7], eax
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0d2c:
    xor ebx, ebx
    mov word [edx + 0x2385c6], bx
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    mov word [esi + 0x358], 0xd0
    mov ax, word [eax*8 + 0x2385c8]
    mov word [esi + 0x35a], ax
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0d66:
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov cx, word [eax + 0x2385c6]
    cmp cx, 0x2710
    jl short loc_0def
    cmp cx, 0x3fff
    jge short loc_0def
    cmp di, word [0xe8cc6]
    je short loc_0da4
    cmp dword [0xe9347], 1
    jne short loc_0dd5
loc_0da4:
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + 0x2385c6]
    movsx ebx, word [esi + 0x340]
    db 0x81, 0xe8, 0x10, 0x27, 0x00, 0x00    ; sub eax, 0x2710
    and eax, 0xffff
    mov edx, ebx
    call loc_2748
loc_0dd5:
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    xor ecx, ecx
    mov word [eax*8 + 0x2385c6], cx
loc_0def:
    test byte [esi + 0x3a2], 0x10
    jne near loc_1a16
    movsx edx, word [esi + 0x340]
    imul edx, edx, 0x2c
    cmp word [edx + 0x1c0bce], 0
    jle near loc_1a16
    cmp byte [0xe8d7e], 0
    je short loc_0e44
    movsx ebx, di
    lea eax, [ebx*4]
    add eax, ebx
    db 0xf6, 0x04, 0x45, 0x69, 0x02, 0x0e, 0x00, 0x20    ; test byte [eax*2 + 0xe0269], 0x20
    je short loc_0e44
    mov eax, 0x1c0ba4
    add eax, edx
    mov edx, 2
    call 0x28810
loc_0e44:
    cmp word [esi + 0x31e], 0
    jl short loc_0e90
    movsx edx, di
    lea eax, [edx*4]
    add edx, eax
    add edx, edx
    mov ax, word [edx + 0xe0264]
    cwde
    test eax, eax
    jns short loc_0e6a
    neg eax
loc_0e6a:
    cmp eax, 0x300
    jg short loc_0e86
    mov ax, word [edx + 0xe0262]
    cwde
    test eax, eax
    jns short loc_0e7f
    neg eax
loc_0e7f:
    cmp eax, 0x300
    jle short loc_0e90
loc_0e86:
    mov ecx, 0xffffffff
    jmp near loc_1674
loc_0e90:
    movsx edx, di
    lea eax, [edx*4]
    add eax, edx
    add eax, eax
    mov cl, byte [eax + 0xe0269]
    test cl, 0x20
    jne short loc_0ebe
    test cl, 0x80
    jne short loc_0ebe
    mov byte [esi + 0x3e9], 0
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0ebe:
    cmp byte [esi + 0x3e9], 0
    jne near loc_1a16
    movsx edx, di
    lea eax, [edx*4]
    add eax, edx
    db 0xf6, 0x04, 0x45, 0x69, 0x02, 0x0e, 0x00, 0x80    ; test byte [eax*2 + 0xe0269], 0x80
    je short loc_0ef9
    cmp word [esi + 0x31e], 0
    jl near loc_1a16
    mov ecx, 0xffffffff
    jmp near loc_1674
loc_0ef9:
    mov ebx, 0xffffffff
    mov word [0xe8cbe], bx
    lea edx, [esp + 4]
    mov byte [esi + 0x3e9], 1
    mov eax, esi
    mov dword [esp + 4], ebx
    call 0x48280
    cmp eax, 0x500
    jge short loc_0f7f
    mov eax, dword [esp + 4]
    test ax, ax
    jl short loc_0f7f
    cwde
    shl eax, 5
    cmp word [eax + 0x1ecdb6], 0x230
    jne short loc_0f7f
    mov bx, word [eax + 0x1ecdbe]
    test bx, bx
    jle short loc_0f7f
    movsx edx, bx
    imul edx, edx, 0xd
    cmp dword [edx + 0xe75d9], 0
    jne short loc_0f7f
    cmp di, word [0xe8cc6]
    jne short loc_0f7f
    movsx edx, word [esi + 0x340]
    mov ax, word [eax + 0x1ecdbe]
    and eax, 0xffff
    call loc_2748
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0f7f:
    mov eax, dword [esp + 4]
    test ax, ax
    jl short loc_0fa3
    cwde
    shl eax, 5
    test byte [eax + 0x1ecdb2], 0x10
    je short loc_0fa3
    cmp word [eax + 0x1ecdbe], 0
    jne near loc_1a16
loc_0fa3:
    cmp word [esi + 0x31e], 0
    jl short loc_0ffd
    movsx ecx, word [esi + 0x340]
    imul ecx, ecx, 0x2c
    push 1
    push 0x500
    push 0xe4450
    push 0xe8cbe
    push 0xe8cc2
    movsx eax, word [esi + 0x29a]
    push 0xe8cc4
    mov ebx, dword [esi + 0x240]
    mov edx, dword [esi + 0x23c]
    push eax
    movsx ecx, word [ecx + 0x1c0bbc]
    mov eax, dword [esi + 0x238]
    call 0x6c23c
    jmp near loc_1269
loc_0ffd:
    push 1
    push 0x500
    push 0xe4450
    push 0xe8cbe
    push 0xe8cc2
    push 0xe8cc4
    movsx eax, word [esi + 0x29a]
    push eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov ebx, dword [esi + 0x21c]
    mov edx, dword [esi + 0x218]
    movsx ecx, word [eax + 0x1c0bbc]
    mov eax, dword [esi + 0x214]
    call 0x6c23c
    movsx eax, word [0xe8cbe]
    cmp eax, -1
    jne short loc_10bd
    movsx eax, word [0xe8cc2]
    cmp eax, -1
    jne short loc_10bd
    movsx eax, word [0xe8cc4]
    cmp eax, -1
    jne short loc_10bd
    push 1
    push 0x500
    push 0xe4450
    push 0xe8cbe
    push 0xe8cc2
    push 0xe8cc4
    movsx eax, word [esi + 0x29a]
    push eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov ebx, dword [esi + 0x21c]
    mov edx, dword [esi + 0x218]
    add ebx, 0x800
    movsx ecx, word [eax + 0x1c0bbc]
    mov eax, dword [esi + 0x214]
    call 0x6c23c
loc_10bd:
    movsx eax, word [0xe8cbe]
    cmp eax, -1
    jne short loc_1132
    movsx eax, word [0xe8cc2]
    cmp eax, -1
    jne short loc_1132
    movsx eax, word [0xe8cc4]
    cmp eax, -1
    jne short loc_1132
    push 1
    push 0x500
    push 0xe4450
    push 0xe8cbe
    push 0xe8cc2
    push 0xe8cc4
    movsx eax, word [esi + 0x29a]
    push eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov ebx, dword [esi + 0x21c]
    mov edx, dword [esi + 0x218]
    add ebx, 0x1000
    movsx ecx, word [eax + 0x1c0bbc]
    mov eax, dword [esi + 0x214]
    call 0x6c23c
loc_1132:
    movsx eax, word [0xe8cbe]
    cmp eax, -1
    jne near loc_1269
    movsx eax, word [0xe8cc2]
    cmp eax, -1
    jne near loc_1269
    movsx eax, word [0xe8cc4]
    cmp eax, -1
    jne near loc_1269
    movsx ecx, word [esi + 0x340]
    imul ecx, ecx, 0x2c
    push 3
    push 0x500
    push 0xe4450
    push 0xe8cbe
    push 0xe8cc2
    movsx eax, word [esi + 0x29a]
    mov ebx, dword [esi + 0x21c]
    push 0xe8cc4
    mov edx, dword [esi + 0x218]
    add ebx, 0x1000
    push eax
    movsx ecx, word [ecx + 0x1c0bbc]
    mov eax, dword [esi + 0x214]
    call 0x6c23c
    mov cx, word [0xe8cbe]
    test cx, cx
    jl near loc_1252
    movsx eax, cx
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x1c0bb2]
    cmp ax, 0x52b
    jb short loc_1218
    jbe near loc_1a16
    cmp ax, 0x573
    jb short loc_1200
    jbe near loc_1a16
    cmp ax, 0x1300
    jb short loc_11fa
    jbe near loc_1a16
    cmp ax, 0x1302
    jmp short loc_124c
loc_11fa:
    cmp ax, 0xd7a
    jmp short loc_124c
loc_1200:
    cmp ax, 0x536
    jb short loc_1212
    jbe near loc_1a16
    cmp ax, 0x538
    jmp short loc_124c
loc_1212:
    cmp ax, 0x52d
    jmp short loc_124c
loc_1218:
    cmp ax, 0x50e
    jb short loc_123c
    jbe near loc_1a16
    cmp ax, 0x525
    jb short loc_1236
    jbe near loc_1a16
    cmp ax, 0x529
    jmp short loc_124c
loc_1236:
    cmp ax, 0x520
    jmp short loc_124c
loc_123c:
    cmp ax, 0x25b
    jb short loc_1252
    jbe near loc_1a16
    cmp ax, 0x2f1
loc_124c:
    je near loc_1a16
loc_1252:
    mov eax, 0xffffffff
    mov word [0xe8cbe], ax
    mov word [0xe8cc2], ax
    mov word [0xe8cc4], ax
loc_1269:
    movsx eax, word [esi + 0x31e]
    cmp eax, -1
    jne short loc_12db
    movsx eax, word [0xe8cbe]
    cmp eax, -1
    jne short loc_12db
    movsx eax, word [0xe8cc4]
    cmp eax, -1
    jne short loc_12db
    movsx eax, word [0xe8cc2]
    cmp eax, -1
    jne short loc_12db
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x1c0bbc]
    lea eax, [edx*4]
    add eax, edx
    movsx eax, word [eax*8 + 0x2385c6]
    call 0x535f0
    test al, al
    je short loc_12db
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x1c0bbc]
    mov word [0xe8cc4], ax
loc_12db:
    mov cx, word [0xe8cc4]
    test cx, cx
    jl short loc_1301
    movsx edx, cx
    lea eax, [edx*4]
    add eax, edx
    test byte [eax*8 + 0x2385c7], 0x40
    jne near loc_1a16
loc_1301:
    movsx eax, word [0xe8cbe]
    cmp eax, -1
    jne short loc_1355
    movsx eax, word [0xe8cc2]
    cmp eax, -1
    jne short loc_1355
    movsx edx, word [esi + 0x29e]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385c6], 2
    jne short loc_1355
    mov edx, 0xe8cbe
    movsx eax, word [esi + 0x340]
    call 0x48170
    cmp eax, 0x500
    jle short loc_1355
    mov word [0xe8cbe], 0xffff
loc_1355:
    mov cx, word [0xe8cbe]
    test cx, cx
    jl near loc_1647
    mov ebx, 1
    movsx edx, cx
    movsx eax, di
    call 0x554d0
    test al, al
    jne near loc_1a16
    movsx edx, word [0xe8cbe]
    imul ecx, edx, 0x2c
    mov ax, word [ecx + 0x1c0bb2]
    cmp ax, 0x233
    jb short loc_13bc
    jbe near loc_1587
    cmp ax, 0x23b
    jb short loc_13b1
    jbe short loc_13e6
    cmp ax, 0x42d
    je near loc_15f8
    jmp near loc_1647
loc_13b1:
    cmp ax, 0x239
    je short loc_13e6
    jmp near loc_1647
loc_13bc:
    cmp ax, 0x1f3
    jb short loc_13d7
    jbe near loc_1705
    cmp ax, 0x1f6
    je near loc_1705
    jmp near loc_1647
loc_13d7:
    cmp ax, 0x8e
    je near loc_14db
    jmp near loc_1647
loc_13e6:
    cmp dword [esi + 0x258], 0
    jne near loc_14b4
    cmp dword [0xe934f], 0
    jne short loc_140d
    mov eax, 0x1c
    movsx edx, word [esi + 0x340]
    call loc_2748
loc_140d:
    mov dword [esi + 0x258], 0x1658
    mov bh, byte [esi + 0x3d1]
    mov word [esi + 0x396], 0x3a
    test bh, bh
    jne short loc_143a
    mov byte [esi + 0x3d1], 1
    mov word [esi + 0x392], 0xffff
loc_143a:
    mov eax, dword [0xe7220]
    mov edx, eax
    mov edi, 0xa
    sar edx, 0x1f
    idiv edi
    movsx ebx, word [esi + 0x340]
    imul ebx, ebx, 0x2c
    mov edx, dword [0xe7220]
    movsx ecx, word [ebx + 0x1c0bce]
    sub edx, eax
    cmp ecx, edx
    jg short loc_1492
    add eax, ecx
    mov word [ebx + 0x1c0bce], ax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x1c0bce]
    mov word [esi + 0x2a2], ax
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1492:
    cmp ecx, dword [0xe7220]
    jge near loc_1a16
    mov ax, word [0xe7220]
    mov word [ebx + 0x1c0bce], ax
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_14b4:
    cmp dword [0xe79dc], 0
    jne near loc_1a16
    mov eax, 0x4f
    movsx edx, word [esi + 0x340]
    call loc_2748
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_14db:
    mov edx, esp
    mov eax, esi
    call 0x48280
    mov ebx, dword [esp]
    test bx, bx
    jl near loc_1a16
    movsx eax, bx
    shl eax, 5
    cmp word [eax + 0x1ecdb6], 0
    jne near loc_1a16
    movsx ebx, word [0xe8cbe]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    cmp dword [eax + 0x4ea07], 0
    jne near loc_1a16
    mov dword [eax + 0x4ea07], 1
    imul eax, ebx, 0x2c
    mov dx, word [esi + 0x340]
    mov word [eax + 0x1c0bc2], dx
    mov al, byte [eax + 0x1c0bb5]
    mov byte [esi + 0x3ca], al
    test al, al
    je short loc_1575
    movsx eax, word [0xe8cbe]
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x1c0bca]
    mov word [0xe92fd], ax
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1575:
    xor esi, esi
    mov word [0xe92fd], si
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1587:
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp dword [eax + 0x4ea07], 1
    je near loc_1a16
    mov dword [eax + 0x4ea07], 1
    mov ax, word [esi + 0x340]
    mov word [ecx + 0x1c0bc2], ax
    cwde
    imul eax, eax, 0x2c
    mov ecx, dword [0xe7220]
    movsx edx, word [eax + 0x1c0bce]
    cmp edx, ecx
    jge near loc_1a16
    inc word [eax + 0x1c0bce]
    mov eax, 0x24
    movsx edx, word [esi + 0x340]
    call loc_2748
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_15f8:
    mov eax, 0x15
    movsx edx, word [esi + 0x340]
    call loc_2748
    movsx edx, word [esi + 0x340]
    imul edx, edx, 0x2c
    call 0x7079f
    xor ah, ah
    and al, 3
    db 0x05, 0x02, 0x00, 0x00, 0x00    ; add eax, 2
    sub word [edx + 0x1c0bce], ax
    mov byte [esi + 0x3f0], 0x30
    mov byte [esi + 0x3f1], 0x30
    mov byte [esi + 0x3f2], 0x40
    mov dword [esi + 0x274], 0x20
loc_1647:
    movsx edx, di
    lea eax, [edx*4]
    add eax, edx
    db 0xf6, 0x04, 0x45, 0x69, 0x02, 0x0e, 0x00, 0x20    ; test byte [eax*2 + 0xe0269], 0x20
    je near loc_1a16
    cmp word [esi + 0x31e], 0
    jl near loc_17f5
    mov ecx, 0xffffffff
loc_1674:
    test ecx, ecx
    jge near loc_17c4
    mov eax, dword [esi + 0x238]
    mov dword [esi + 0x214], eax
    mov eax, dword [esi + 0x23c]
    mov dword [esi + 0x218], eax
    mov eax, dword [esi + 0x240]
    mov dword [esi + 0x21c], eax
    mov ax, word [esi + 0x29a]
    mov word [esi + 0x298], ax
    lea ebx, [esi + 0x29e]
    mov edx, dword [esi + 0x218]
    mov eax, dword [esi + 0x214]
    mov word [esi + 0x31e], 0xffff
    call 0x6e997
    mov eax, esi
    call 0x47d00
    movsx ecx, word [0x2454c4]
loc_16dc:
    test ecx, ecx
    jl near loc_17d7
    imul eax, ecx, 0x2c
    cmp word [eax + 0x1c0bb2], 0x26d
    jne short loc_16fb
    xor edi, edi
    mov word [eax + 0x1c0bc6], di
loc_16fb:
    db 0x0f, 0xbf, 0x0c, 0x4d, 0xa4, 0xf7, 0x1a, 0x00    ; movsx ecx, word [ecx*2 + 0x1af7a4]
    jmp short loc_16dc
loc_1705:
    movsx ecx, word [0x2454c4]
    movsx edx, word [0xe8cbe]
loc_1713:
    test ecx, ecx
    jl near loc_1674
    imul ebx, ecx, 0x2c
    cmp word [ebx + 0x1c0bb2], 0x26d
    jne near loc_17b7
    cmp word [ebx + 0x1c0bc6], 0
    jne near loc_17b7
    imul eax, edx, 0x2c
    mov di, word [ebx + 0x1c0bca]
    cmp di, word [eax + 0x1c0bcc]
    jne short loc_17b7
    mov word [ebx + 0x1c0bc6], 1
    mov eax, 0xd4
    call loc_2748
    movsx eax, word [0xe8cbe]
    imul eax, eax, 0x2c
    mov edx, 1
    mov word [eax + 0x1c0bc2], cx
    mov word [eax + 0x1c0bc6], dx
    mov ax, word [esi + 0x29e]
    mov dword [esp], eax
    mov ax, word [ebx + 0x1c0bbc]
    mov word [esi + 0x29e], ax
    mov eax, esi
    call 0x47d00
    mov eax, dword [esp]
    mov word [esi + 0x29e], ax
    mov word [esi + 0x31e], cx
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_17b7:
    db 0x0f, 0xbf, 0x0c, 0x4d, 0xa4, 0xf7, 0x1a, 0x00    ; movsx ecx, word [ecx*2 + 0x1af7a4]
    jmp near loc_1713
loc_17c4:
    cmp word [esi + 0x31e], 0
    jl short loc_17d7
    mov word [esi + 0x31e], 0xffff
loc_17d7:
    cmp byte [0x2c2381], 0
    je near loc_1a16
    xor ch, ch
    mov byte [0x2c2381], ch
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_17f5:
    movsx eax, word [0xe8cc2]
    cmp eax, -1
    jne near loc_1879
    movsx eax, word [0xe8cc4]
    cmp eax, -1
    jne short loc_1879
    movsx eax, word [0xe8cbe]
    cmp eax, -1
    jne short loc_1879
    movsx eax, word [esi + 0x340]
    call 0x480a0
    test eax, eax
    jns short loc_182f
    neg eax
loc_182f:
    cmp eax, 0x200
    jge short loc_1879
    call 0x7079f
    and eax, 0xff
    cmp eax, 0x10
    jge short loc_185f
    mov eax, 0xcf
    movsx edx, word [esi + 0x340]
    call loc_2748
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_185f:
    mov eax, 0xd1
    movsx edx, word [esi + 0x340]
    call loc_2748
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1879:
    mov dx, word [0xe8cc2]
    test dx, dx
    jl short loc_18d9
    movsx eax, dx
    shl eax, 5
    cmp word [eax + 0x1ecdbe], 0
    jle short loc_18c5
    movsx eax, word [eax + 0x1ecdb4]
    call 0x53540
    test al, al
    je short loc_18c5
    mov eax, dword [esp + 4]
    cmp ax, word [0xe8cc2]
    je near loc_1a05
    cwde
    cmp eax, -1
    jne near loc_1a16
    jmp near loc_1a05
loc_18c5:
    cmp word [esi + 0x31e], 0
    jl short loc_18d9
    mov ecx, 0xffffffff
    jmp near loc_1674
loc_18d9:
    mov ax, word [0xe8cc4]
    test ax, ax
    jl near loc_196b
    movsx edx, ax
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    test byte [eax + 0x2385c7], 0x40
    jne short loc_196b
    movsx eax, word [eax + 0x2385c6]
    call 0x53610
    test al, al
    je short loc_196b
    movsx eax, word [0xe8cc4]
    db 0x0f, 0xbf, 0x0c, 0x45, 0xc4, 0x5c, 0x24, 0x00    ; movsx ecx, word [eax*2 + 0x245cc4]
loc_1923:
    test ecx, ecx
    jl short loc_194f
    imul eax, ecx, 0x2c
    mov dx, word [eax + 0x1c0bb2]
    cmp dx, 2
    je near loc_1a16
    cmp dx, 8
    je near loc_1a16
    db 0x0f, 0xbf, 0x0c, 0x4d, 0xa4, 0xc8, 0x1b, 0x00    ; movsx ecx, word [ecx*2 + 0x1bc8a4]
    jmp short loc_1923
loc_194f:
    movsx eax, word [0xe8cc4]
    movsx edx, word [esi + 0x340]
    call 0x540d0
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_196b:
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    movsx edx, word [eax + 0x1c0bbc]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    test byte [eax + 0x2385c7], 0x40
    jne near loc_1a16
    movsx eax, word [eax + 0x2385c6]
    call 0x535f0
    test al, al
    je short loc_1a05
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    movsx ecx, word [eax + 0x1c0bbc]
    db 0x0f, 0xbf, 0x0c, 0x4d, 0xc4, 0x5c, 0x24, 0x00    ; movsx ecx, word [ecx*2 + 0x245cc4]
loc_19c2:
    test ecx, ecx
    jl short loc_19e6
    imul eax, ecx, 0x2c
    mov bx, word [eax + 0x1c0bb2]
    cmp bx, 2
    je short loc_1a16
    cmp bx, 8
    je short loc_1a16
    db 0x0f, 0xbf, 0x0c, 0x4d, 0xa4, 0xc8, 0x1b, 0x00    ; movsx ecx, word [ecx*2 + 0x1bc8a4]
    jmp short loc_19c2
loc_19e6:
    movsx edx, word [esi + 0x340]
    imul eax, edx, 0x2c
    movsx eax, word [eax + 0x1c0bbc]
    call 0x540d0
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1a05:
    movsx edx, word [0xe8cc2]
    movsx eax, di
    xor ebx, ebx
    call 0x554d0
loc_1a16:
    add esp, 8
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
    add byte [ecx], dl
    add byte [esi], ah
    add al, cl
    add byte [esi], al
    add byte [ebp], al
    add dword [eax], eax
    add al, byte [eax]
    add eax, dword [eax]
    db 0x6d    ; insd dword es:[edi], dx
    add byte [eax + eax + 0xd0009], bl
    push cs
    add ch, dl
    add byte [edi], al
    add bl, bl
    add byte [edx - 0x77], dl
    ret 0x58e8
    add dword [eax], eax
    add al, ch
    arpl word [edx - 5], sp
    db 0xff
    call 0x644a7
    call 0xa1040
    call 0x5c8c0
    call 0x9f048
    call 0x7a7e0
    mov eax, 0x3248
    call 0xa294c
    mov eax, edx
    call 0xa2a43
    mov eax, 0xffffffff
    call 0xa296e
    pop edx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 0xc
    mov edx, dword [0x1275d8]
    cmp edx, 0xd
    je near loc_1b9f
    test edx, edx
    je short loc_1abb
    cmp edx, 6
    jne short loc_1ae7
loc_1abb:
    lea eax, [ebp - 0xc]
    push eax
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 8]
    push eax
    mov ecx, 7
    sub esp, 0x1c
    mov edx, ss
    mov edi, esp
    mov es, edx
    mov esi, 0x1275ac
    push ds
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    pop es
    call 0x94450
    mov ecx, eax
    jmp short loc_1ae9
loc_1ae7:
    xor ecx, ecx
loc_1ae9:
    test ecx, ecx
    jne near loc_1b79
    cmp byte [0x7e54], 0
    je short loc_1b29
    cmp word [0x261214], 1
    jle short loc_1b29
    push 0x1f40
    mov ecx, 8
    mov edi, dword [0x1275d0]
    mov ebx, 1
    cmp edi, 4
    jge short loc_1b22
    mov edx, edi
    jmp short loc_1b42
loc_1b22:
    mov edx, 4
    jmp short loc_1b42
loc_1b29:
    mov esi, dword [0x127588]
    mov ecx, dword [0x1275a0]
    mov ebx, dword [0x12759c]
    push esi
    mov edx, dword [0x1275d0]
loc_1b42:
    mov eax, dword [0x1275d8]
    call 0x94520
    mov ecx, eax
    test ecx, ecx
    jne short loc_1b79
    mov eax, dword [0x1275c8]
    call 0x94718
    cmp dword [0x1275a4], 1
    jne short loc_1b79
    call 0x947dc
    test eax, eax
    sete al
    and eax, 0xff
    call 0x947d4
loc_1b79:
    test ecx, ecx
    je short loc_1b87
    mov eax, 0x3254
    call 0x59fa0
loc_1b87:
    mov eax, 0x4b100
    call 0x946b0
    test eax, eax
    je short loc_1b9f
    mov eax, 0x3254
    call 0x59fa0
loc_1b9f:
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
loc_1ba7:
    ret
    cmp dword [0x1275d8], 0xd
    je short loc_1ba7
    call 0x94618
    test eax, eax
    je short loc_1ba7
    mov eax, 0x3254
    call 0xa2a43
    mov eax, 0x3270
    jmp near 0x16030
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 0xc
    cmp dword [0x1275d4], 0xd
    je near loc_1c6e
    cmp byte [0x7e54], 0
    je short loc_1c03
    cmp word [0x261214], 1
    jg short loc_1c6e
loc_1c03:
    mov eax, dword [0x127594]
    mov ebx, dword [0x1275d8]
    mov dword [0x1275c0], eax
    test ebx, ebx
    je short loc_1c1c
    cmp ebx, 6
    jne short loc_1c44
loc_1c1c:
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 0xc]
    push eax
    lea eax, [ebp - 8]
    push eax
    mov ecx, 7
    sub esp, 0x1c
    mov eax, ss
    mov edi, esp
    mov es, eax
    mov esi, 0x1275ac
    push ds
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    pop es
    call 0x94450
loc_1c44:
    mov edx, dword [0x127594]
    mov eax, dword [0x1275d4]
    call 0x8bdf8
    test eax, eax
    jne short loc_1c64
    mov eax, dword [0x1275cc]
    call 0x8bf6f
    jmp short loc_1c6e
loc_1c64:
    mov eax, 0x3274
    call 0x59fa0
loc_1c6e:
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    nop
    cmp dword [0x1275d4], 0xd
    je short loc_1cb0
    cmp byte [0x7e54], 0
    je short loc_1c94
    cmp word [0x261214], 1
    jg short loc_1cb0
loc_1c94:
    call 0x8beee
    test eax, eax
    je short loc_1cb0
    mov eax, dword [0x110fc]
    call 0x8bd56
    push eax
    call 0x9baac
    add esp, 4
loc_1cb0:
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ebx
    mov ebx, eax
    mov eax, edx
    call 0xa38f4
    mov dword [ebx], eax
    test eax, eax
    setne al
    and eax, 0xff
    dec eax
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    call 0xa39d7
    xor eax, eax
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 0x20
    mov ecx, 8
    mov eax, ss
    lea edi, [ebp - 0x20]
    mov es, eax
    mov esi, 0x49f80
    push ds
    xor edx, edx
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    pop es
    mov al, byte [0x9bfc]
    mov dl, al
    inc al
    mov byte [0x9bfc], al
    movsx eax, word [ebp + edx*2 - 0x20]
    xor edx, edx
    call loc_2528
    mov dl, byte [0x9bfc]
    mov ebx, 0x11
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov byte [0x9bfc], dl
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    cmp dword [0x1273a4], 0
    je short loc_1dbc
    cmp dword [0x1275d4], 0xd
    je short loc_1dbc
    cmp byte [0x7e54], 0
    je short loc_1d70
    cmp word [0x261214], 1
    jg short loc_1dbc
loc_1d70:
    xor edx, edx
    call 0x7a82e
    movsx ecx, ax
    cmp ecx, -1
    je short loc_1dbc
    mov eax, ecx
    call 0x7aae4
    cmp eax, 0x11940
    jl short loc_1d98
    mov eax, ecx
    call 0x7ab25
    pop edx
    pop ecx
    pop ebx
    ret
loc_1d98:
    mov edx, 0xce920
    mov ebx, eax
    mov eax, ecx
    call 0x7a960
    mov eax, ecx
    mov edx, 1
    call 0x7ab25
    mov eax, 0xce920
    call 0x8bfec
loc_1dbc:
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
loc_1dc8:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    cmp ax, 0x1c2
    jae short loc_1ddc
    cmp dword [0x1273a8], 0
    jne short loc_1de3
loc_1ddc:
    xor al, al
    jmp near loc_1ea8
loc_1de3:
    cmp dword [0x1275d8], 0xd
    jne short loc_1df4
    xor al, al
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1df4:
    xor ebx, ebx
    mov bx, ax
    lea eax, [ebx*8]
    sub eax, ebx
    mov esi, 0xe5714
    add eax, eax
    xor edx, edx
    add esi, eax
    mov dl, byte [0xe9833]
    mov eax, esi
    call 0x7a82e
    mov ecx, eax
    cmp eax, -1
    jne short loc_1e67
    push ebx
    push esi
    push 0x3298
    push 0xbaaa0
    call 0xa27b9
    movsx ebx, word [0x261216]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov edx, 0xb4f00
    add eax, eax
    add esp, 0x10
    add edx, eax
    mov eax, 0x71
    call 0x15e90
    xor al, al
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_1e67:
    imul edi, ebx, 0xd
    call 0x7aae4
    mov esi, eax
    mov dword [ebx*4 + 0x4de60], eax
    mov byte [edi + 0xe75d4], 0xc8
    mov eax, 0xe75d0
    add eax, edi
    mov edx, esi
    lea ebx, [eax + 4]
    call 0x7a048
    mov ebx, esi
    mov eax, ecx
    mov edx, dword [edi + 0xe75d0]
    call 0x7a960
    mov eax, ecx
    call 0x7ab25
    mov al, 1
loc_1ea8:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
loc_1eb8:
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 0x34
    mov esi, eax
    mov dword [ebp - 8], edx
    mov dword [ebp - 0x20], ebx
    mov dword [ebp - 0x24], ecx
    cmp ax, 0x1c2
    jge near loc_1f75
    cmp dword [0x1275d8], 0xd
    je near loc_1f75
    cwde
    test byte [eax + 0xe7240], 8
    je short loc_1ef9
    cmp dword [0xe934f], 0
    jne near loc_1f75
loc_1ef9:
    cmp dword [0x1273a8], 0
    je near loc_1f75
    movsx eax, si
    imul edx, eax, 0xd
    cmp dword [edx + 0xe75d9], 3
    jg short loc_1f75
    mov al, byte [eax + 0xe7402]
    and eax, 0xff
    call 0x9480c
    test eax, eax
    je short loc_1f75
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov dx, word [eax + 0xb5258]
    test dx, dx
    jle short loc_1f54
    cmp dx, 0x4e
    jle short loc_1f75
loc_1f54:
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xf6, 0x04, 0x45, 0xa2, 0x52, 0x0b, 0x00, 0x01    ; test byte [eax*2 + 0xb52a2], 1
    je short loc_1f7f
loc_1f75:
    mov eax, 0xffffffff
    jmp near loc_2511
loc_1f7f:
    movsx eax, si
    mov bl, byte [eax + 0xe7240]
    test bl, 0x80
    je short loc_1f9c
    call loc_2528
    xor eax, eax
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    ret 4
loc_1f9c:
    test bl, 4
    je near loc_2028
    cmp dword [0x1273ac], 0
    je short loc_1fe2
    cmp dword [0xe97df], 1
    jle short loc_1fef
    movsx eax, word [ebp - 8]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x214
    jne short loc_1fef
    mov di, word [0xe8cc6]
    cmp di, word [eax + 0x1c0bc6]
    je short loc_1fef
    cmp dword [0xe9347], 1
    je short loc_1fef
loc_1fe2:
    mov eax, 0xffffffff
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    ret 4
loc_1fef:
    xor ebx, ebx
    jmp short loc_2020
loc_1ff3:
    xor eax, eax
    imul edx, ebx, 0xd
    jmp short loc_2015
loc_1ffa:
    test ecx, ecx
    jle short loc_2014
    test byte [ebx + 0xe7240], 4
    je short loc_2014
    mov eax, 0xffffffff
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    ret 4
loc_2014:
    inc eax
loc_2015:
    mov ecx, dword [edx + 0xe75d9]
    cmp eax, ecx
    jl short loc_1ffa
    inc ebx
loc_2020:
    cmp ebx, 0x1c2
    jl short loc_1ff3
loc_2028:
    movsx edx, word [0xe8cc6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x14, 0x45, 0x38, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb5138]
    mov dword [ebp - 0x18], edx
    db 0x8b, 0x14, 0x45, 0x3c, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb513c]
    mov dword [ebp - 0x1c], edx
    db 0x8b, 0x14, 0x45, 0x40, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb5140]
    mov ecx, dword [ebp - 0x24]
    mov dword [ebp - 0x28], edx
    db 0x66, 0x8b, 0x14, 0x45, 0x9e, 0x51, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb519e]
    mov edi, dword [ebp - 0x20]
    mov dword [ebp - 4], edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x98, 0x51, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5198]
    db 0x0f, 0xbf, 0x04, 0x45, 0xa0, 0x51, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb51a0]
    mov ebx, dword [ebp - 0x28]
    add edx, eax
    mov eax, dword [ebp + 0x10]
    mov dword [ebp - 0x30], edx
    mov edx, dword [ebp - 0x1c]
    sub ebx, eax
    mov eax, dword [ebp - 0x18]
    sar ebx, 4
    sub edx, ecx
    sub eax, edi
    call 0x9e55c
    mov ecx, eax
    mov edi, eax
    cmp word [ebp - 8], 0
    jl short loc_210c
    movsx eax, si
    test byte [eax + 0xe7240], 0x10
    jne short loc_210c
    movsx edx, word [ebp - 8]
    imul edx, edx, 0x2c
    cmp word [edx + 0x1c0bb2], 5
    jne short loc_210c
    cmp word [edx + 0x1c0bca], 0x3e7
    jge short loc_210c
    movsx eax, word [edx + 0x1c0bbc]
    mov dword [ebp - 0x34], eax
    mov ebx, dword [ebp - 0x34]
    lea eax, [eax*4]
    add eax, ebx
    mov ax, word [eax*8 + 0x2385c6]
    xor ah, ah
    db 0x66, 0x3d, 0x09, 0x00    ; cmp ax, 9
    jge short loc_210c
    movsx ebx, word [edx + 0x1c0bcc]
    mov eax, ecx
    inc ebx
    mov edx, eax
    sar edx, 0x12
    shl eax, 0xe
    idiv ebx
    mov edi, eax
loc_210c:
    movsx eax, si
    db 0x66, 0x8b, 0x14, 0x45, 0xe8, 0x47, 0x0e, 0x00    ; mov dx, word [eax*2 + 0xe47e8]
    db 0x66, 0x8b, 0x04, 0x45, 0x64, 0x44, 0x0e, 0x00    ; mov ax, word [eax*2 + 0xe4464]
    mov dword [ebp - 0x10], eax
    cwde
    movsx ecx, dx
    mov dword [ebp - 0x2c], eax
    sub eax, ecx
    test eax, eax
    jns short loc_2131
    neg eax
loc_2131:
    mov ebx, eax
    mov dword [ebp - 0x18], eax
    test eax, eax
    je short loc_2166
    cmp dx, word [ebp - 0x10]
    jge short loc_2150
    call 0xa29dc
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    add ecx, edx
    jmp short loc_2166
loc_2150:
    call 0xa29dc
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov eax, dword [ebp - 0x2c]
    add eax, edx
    mov dword [ebp - 0x14], eax
    jmp short loc_2169
loc_2166:
    mov dword [ebp - 0x14], ecx
loc_2169:
    movsx eax, si
    db 0x0f, 0xbf, 0x04, 0x45, 0x20, 0x51, 0x0e, 0x00    ; movsx eax, word [eax*2 + 0xe5120]
    add edi, eax
    test edi, edi
    jge short loc_217c
    xor edi, edi
loc_217c:
    test edi, edi
    je short loc_21d7
    movsx eax, word [ebp - 8]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 5
    je short loc_21d7
    movsx edx, word [eax + 0x1c0bbc]
    push edx
    mov edx, dword [eax + 0x1c0bac]
    sub edx, 0x1800
    mov ebx, dword [ebp - 0x28]
    push edx
    mov ecx, dword [eax + 0x1c0ba8]
    sub ebx, 0x1800
    push ecx
    mov edx, dword [eax + 0x1c0ba4]
    movsx ecx, word [ebp - 4]
    push edx
    mov eax, dword [ebp - 0x18]
    mov edx, dword [ebp - 0x1c]
    call 0x6ae4d
    test eax, eax
    jne short loc_21d7
    mov eax, edi
    sar eax, 5
    add edi, eax
loc_21d7:
    cmp si, 0xe
    jb short loc_21e7
    jbe short loc_21ed
    cmp si, 0x11
    je short loc_21ed
    jmp short loc_223a
loc_21e7:
    cmp si, 9
    jne short loc_223a
loc_21ed:
    cmp edi, 0x1800
    jle short loc_21fa
    mov edi, 0x1800
loc_21fa:
    movsx edx, word [0xe8cc6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x9e, 0x51, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb519e]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385c6], 2
    jne near loc_22a6
    sub dword [ebp - 0x14], 0x400
    jmp short loc_22a6
loc_223a:
    movsx edx, word [0xe8cc6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x9e, 0x51, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb519e]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385c6], 2
    jne short loc_2280
    movsx eax, si
    test byte [eax + 0xe7240], 4
    jne short loc_2280
    mov dword [ebp - 0x14], 0xfffffd00
loc_2280:
    cmp edi, 0x7ad4
    jle short loc_22a6
    movsx eax, word [ebp - 8]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 5
    je short loc_22a6
    mov eax, 0xffffffff
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    ret 4
loc_22a6:
    movsx edx, si
    imul ecx, edx, 0xd
    cmp dword [ecx + 0xe75d9], 0
    jle short loc_2308
    movsx ebx, word [ebp - 8]
    imul ebx, ebx, 0x2c
    cmp word [ebx + 0x1c0bb2], 5
    je short loc_2308
    lea eax, [edx*4]
    sub eax, edx
    mov ax, word [eax*8 + 0xb23d0]
    cmp ax, word [ebp - 8]
    je short loc_2301
    cmp dword [ecx + 0xe75d9], 1
    jg short loc_2301
    mov eax, 0x1c0ba4
    add eax, ebx
    call 0x12be0
    test ax, ax
    je short loc_2308
    cmp word [ebx + 0x1c0bce], 0
    jg short loc_2308
loc_2301:
    mov eax, edx
    call loc_2788
loc_2308:
    movsx eax, word [ebp - 8]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x214
    jne short loc_2330
    mov bx, word [0xe8cc6]
    cmp bx, word [eax + 0x1c0bc6]
    jne short loc_2330
    xor ebx, ebx
    xor edi, edi
    jmp short loc_2356
loc_2330:
    mov edx, dword [ebp - 0x1c]
    mov ebx, dword [ebp - 0x24]
    mov eax, dword [ebp - 0x18]
    mov ecx, dword [ebp - 0x20]
    sub edx, ebx
    mov ebx, dword [ebp - 0x30]
    sub eax, ecx
    add ebx, 0x800
    call 0x65698
    sub ebx, eax
    and ebx, 0x7ff
loc_2356:
    movsx eax, si
    imul eax, eax, 0xd
    cmp dword [eax + 0xe75d0], 0
    jne short loc_237d
    xor eax, eax
    mov ax, si
    call loc_1dc8
    test al, al
    jne short loc_239b
    xor eax, eax
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    ret 4
loc_237d:
    cmp byte [eax + 0xe75d4], 0xc8
    jae short loc_238f
    mov byte [eax + 0xe75d4], 0xc8
    jmp short loc_239b
loc_238f:
    mov dl, byte [eax + 0xe75d4]
    inc byte [eax + 0xe75d4]
loc_239b:
    movsx eax, si
    test byte [eax + 0xe7240], 0x10
    je short loc_23a9
    xor edi, edi
loc_23a9:
    cmp edi, 0x1a40
    jge short loc_23b6
    mov edi, 0x1a40
loc_23b6:
    movsx edx, si
    mov eax, edi
    imul edi, edx, 0xd
    mov cl, byte [edx + 0xe7240]
    sar eax, 6
    test cl, 1
    je near loc_2462
    cmp dword [edi + 0xe75d9], 0
    jle short loc_23e6
    mov eax, 0xffffffff
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    ret 4
loc_23e6:
    mov edi, dword [edi + 0xe75d0]
    mov bx, word [edi + 0x14]
    mov cl, byte [edi]
    mov dword [ebp - 0xc], ebx
    lea ebx, [edx*4]
    cmp cl, 0x43
    jne short loc_2433
    movsx ecx, si
    mov dl, byte [edx + 0xe7402]
    push ecx
    and edx, 0xff
    push edx
    push 0
    mov ecx, dword [ebp - 0x14]
    xor edx, edx
    push eax
    mov ebx, dword [ebx + 0x4de60]
    mov dx, word [ebp - 0xc]
    push eax
    add ebx, edx
    mov eax, edi
    call 0x948a8
    jmp near loc_24ae
loc_2433:
    movsx ecx, si
    mov dl, byte [edx + 0xe7402]
    push ecx
    and edx, 0xff
    push edx
    push 0
    mov ecx, dword [ebp - 0x14]
    xor edx, edx
    push eax
    mov ebx, dword [ebx + 0x4de60]
    mov dx, word [ebp - 0xc]
    push eax
    add ebx, edx
    mov eax, edi
    call 0x9491c
    jmp short loc_24ae
loc_2462:
    mov edi, dword [edi + 0xe75d0]
    mov ch, byte [edi]
    sar ebx, 6
    cmp ch, 0x43
    jne short loc_2491
    movsx ecx, si
    mov dl, byte [edx + 0xe7402]
    push ecx
    and edx, 0xff
    mov ecx, eax
    push edx
    mov eax, edi
    mov edx, dword [ebp - 0x14]
    call 0x9495c
    jmp short loc_24ae
loc_2491:
    movsx ecx, si
    mov dl, byte [edx + 0xe7402]
    push ecx
    and edx, 0xff
    mov ecx, eax
    push edx
    mov eax, edi
    mov edx, dword [ebp - 0x14]
    call 0x9498c
loc_24ae:
    mov edx, eax
    test edx, edx
    jle short loc_24fd
    movsx edi, si
    imul ebx, edi, 0xd
    mov ecx, dword [ebx + 0xe75d9]
    lea eax, [ecx*4]
    sub eax, ecx
    lea ecx, [eax + eax]
    lea eax, [edi*4]
    sub eax, edi
    lea eax, [eax*8]
    mov esi, dword [ebx + 0xe75d9]
    add eax, ecx
    inc esi
    mov ecx, dword [ebp - 8]
    mov dword [eax + 0xb23d2], edx
    mov dword [ebx + 0xe75d9], esi
    mov word [eax + 0xb23d0], cx
    jmp short loc_250f
loc_24fd:
    movsx eax, si
    imul eax, eax, 0xd
    mov bl, byte [eax + 0xe75d4]
    dec byte [eax + 0xe75d4]
loc_250f:
    mov eax, edx
loc_2511:
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    ret 4
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_2528:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 8
    mov esi, eax
    cmp dword [0x1275d8], 0xd
    je near loc_273b
    cmp dword [0x1273a8], 0
    je near loc_273b
    cmp dword [0x1273ac], 0
    jne short loc_2566
    cwde
    test byte [eax + 0xe7240], 4
    jne near loc_273b
loc_2566:
    movsx eax, si
    test byte [eax + 0xe7240], 8
    je short loc_257f
    cmp dword [0xe934f], 0
    jne near loc_273b
loc_257f:
    movsx edx, si
    xor eax, eax
    mov al, byte [edx + 0xe7402]
    call 0x9480c
    test eax, eax
    je near loc_273b
    db 0x8d, 0x04, 0x55, 0x00, 0x00, 0x00, 0x00    ; lea eax, [edx*2]
    mov dx, word [eax + 0xe47e8]
    mov ax, word [eax + 0xe4464]
    movsx ebx, dx
    movsx edi, ax
    mov dword [ebp - 4], eax
    mov eax, edi
    sub eax, ebx
    test eax, eax
    jns short loc_25bf
    neg eax
loc_25bf:
    mov ecx, eax
    test ax, ax
    je short loc_25f0
    cmp dx, word [ebp - 4]
    jge short loc_25df
    call 0xa29dc
    mov edx, eax
    movsx ecx, cx
    sar edx, 0x1f
    idiv ecx
    add edx, ebx
    jmp short loc_25f0
loc_25df:
    call 0xa29dc
    mov edx, eax
    movsx ebx, cx
    sar edx, 0x1f
    idiv ebx
    add edx, edi
loc_25f0:
    mov ecx, edx
    movsx eax, si
    imul eax, eax, 0xd
    cmp dword [eax + 0xe75d0], 0
    jne short loc_2615
    xor eax, eax
    mov ax, si
    call loc_1dc8
    test al, al
    je near loc_273b
    jmp short loc_2633
loc_2615:
    cmp byte [eax + 0xe75d4], 0xc8
    jae short loc_2627
    mov byte [eax + 0xe75d4], 0xc8
    jmp short loc_2633
loc_2627:
    mov dl, byte [eax + 0xe75d4]
    inc byte [eax + 0xe75d4]
loc_2633:
    movsx edx, si
    imul eax, edx, 0xd
    test byte [edx + 0xe7240], 1
    je near loc_26d8
    lea ebx, [edx*4]
    mov eax, dword [eax + 0xe75d0]
    mov dword [ebp - 8], ebx
    cmp byte [eax], 0x43
    jne short loc_269b
    movsx ebx, si
    mov dl, byte [edx + 0xe7402]
    xor edi, edi
    push ebx
    mov di, word [eax + 0x14]
    and edx, 0xff
    push edx
    push 0x96
    mov ebx, dword [ebp - 8]
    push 0x96
    movsx ecx, cx
    mov ebx, dword [ebx + 0x4de60]
    push 0x96
    mov edx, edi
    add ebx, edi
    call 0x948a8
    jmp near loc_2725
loc_269b:
    movsx ebx, si
    mov dl, byte [edx + 0xe7402]
    xor edi, edi
    push ebx
    mov di, word [eax + 0x14]
    and edx, 0xff
    push edx
    push 0x96
    mov ebx, dword [ebp - 8]
    push 0x96
    movsx ecx, cx
    mov ebx, dword [ebx + 0x4de60]
    push 0x96
    mov edx, edi
    add ebx, edi
    call 0x9491c
    jmp short loc_2725
loc_26d8:
    mov eax, dword [eax + 0xe75d0]
    cmp byte [eax], 0x43
    jne short loc_2705
    movsx ebx, si
    mov dl, byte [edx + 0xe7402]
    push ebx
    and edx, 0xff
    xor ebx, ebx
    push edx
    movsx edx, cx
    mov ecx, 0x69
    call 0x9495c
    jmp short loc_2725
loc_2705:
    movsx ebx, si
    mov dl, byte [edx + 0xe7402]
    push ebx
    and edx, 0xff
    xor ebx, ebx
    push edx
    movsx edx, cx
    mov ecx, 0x69
    call 0x9498c
loc_2725:
    test eax, eax
    jg short loc_273b
    movsx eax, si
    imul eax, eax, 0xd
    mov dl, byte [eax + 0xe75d4]
    dec byte [eax + 0xe75d4]
loc_273b:
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
loc_2748:
    push ebx
    push ecx
    push esi
    mov ebx, eax
    cmp ax, 0x1c2
    jb short loc_275c
    mov eax, 0xffffffff
    pop esi
    pop ecx
    pop ebx
    ret
loc_275c:
    movsx edx, dx
    imul eax, edx, 0x2c
    mov ecx, dword [eax + 0x1c0bac]
    push ecx
    mov ecx, dword [eax + 0x1c0ba8]
    mov eax, dword [eax + 0x1c0ba4]
    movsx esi, bx
    mov ebx, eax
    mov eax, esi
    call loc_1eb8
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_2788:
    push ebx
    push ecx
    push edx
    movsx edx, ax
    imul eax, edx, 0xd
    mov ebx, dword [eax + 0xe75d9]
    test ebx, ebx
    jle short loc_27c3
    dec ebx
    lea ecx, [ebx*4]
    lea eax, [edx*4]
    sub ecx, ebx
    sub eax, edx
    add ecx, ecx
    mov eax, dword [ecx + eax*8 + 0xb23d2]
    call 0x94a78
    mov eax, edx
    call loc_2ba8
loc_27c3:
    pop edx
    pop ecx
    pop ebx
    ret
    nop
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 4
    mov esi, eax
    mov edi, edx
    cwde
    imul eax, eax, 0xd
    cmp dword [eax + 0xe75d9], 0
    jle short loc_2831
    mov ax, word [eax + 0xe75d9]
    xor edx, edx
    mov dword [ebp - 4], eax
    jmp short loc_282b
loc_27f1:
    movsx ebx, si
    lea ecx, [ebx*4]
    sub ecx, ebx
    movsx ebx, dx
    lea eax, [ebx*4]
    sub eax, ebx
    lea ecx, [ecx*8]
    add eax, eax
    add eax, ecx
    cmp di, word [eax + 0xb23d0]
    jne short loc_282a
    mov eax, dword [eax + 0xb23d2]
    call 0x94a78
    jmp short loc_2831
loc_282a:
    inc edx
loc_282b:
    cmp dx, word [ebp - 4]
    jl short loc_27f1
loc_2831:
    mov esp, ebp
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
    mov ebp, esp
    sub esp, 0x30
    xor edx, edx
    movsx eax, word [0xe92f7]
    mov dword [0x1163f4], edx
    cmp eax, -1
    jne short loc_28be
    movsx edx, word [0xe8cc6]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x14, 0x45, 0x38, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb5138]
    mov dword [ebp - 0x28], edx
    db 0x8b, 0x14, 0x45, 0x3c, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb513c]
    mov dword [ebp - 0x24], edx
    db 0x8b, 0x14, 0x45, 0x40, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb5140]
    mov dword [ebp - 0x2c], edx
    db 0x66, 0x8b, 0x14, 0x45, 0x9e, 0x51, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb519e]
    db 0x66, 0x8b, 0x1c, 0x45, 0xa0, 0x51, 0x0b, 0x00    ; mov bx, word [eax*2 + 0xb51a0]
    mov dword [ebp - 0xc], edx
    db 0x66, 0x8b, 0x14, 0x45, 0x98, 0x51, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb5198]
    add edx, ebx
    mov dword [ebp - 0x10], edx
    jmp short loc_28f0
loc_28be:
    imul eax, eax, 0x2c
    mov edx, dword [eax + 0x1c0ba4]
    mov dword [ebp - 0x28], edx
    mov edx, dword [eax + 0x1c0ba8]
    mov dword [ebp - 0x24], edx
    mov edx, dword [eax + 0x1c0bac]
    mov dword [ebp - 0x2c], edx
    mov dx, word [eax + 0x1c0bbc]
    mov ax, word [eax + 0x1c0bc0]
    mov dword [ebp - 0xc], edx
    mov dword [ebp - 0x10], eax
loc_28f0:
    xor edi, edi
    cmp di, 0x1c2
    jl short loc_2902
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2902:
    xor ecx, ecx
    mov dword [ebp - 4], ecx
    jmp near loc_2b6e
loc_290c:
    lea eax, [ebx*4]
    sub eax, ebx
    lea ebx, [eax*8]
    lea eax, [edx*4]
    sub eax, edx
    mov ax, word [ebx + eax*2 + 0xb23d0]
    mov dword [ebp - 0x14], eax
    cwde
    imul eax, eax, 0x2c
    mov edx, dword [eax + 0x1c0ba4]
    mov dword [ebp - 0x18], edx
    mov edx, dword [eax + 0x1c0ba8]
    mov dword [ebp - 0x20], edx
    mov edx, dword [eax + 0x1c0bac]
    mov si, word [eax + 0x1c0bb2]
    mov dword [ebp - 0x1c], edx
    cmp si, 0x214
    jne short loc_297a
    mov dx, word [0xe8cc6]
    cmp dx, word [eax + 0x1c0bc6]
    jne short loc_297a
    xor edx, edx
    xor esi, esi
    mov word [ebp - 8], dx
    jmp near loc_2a2a
loc_297a:
    mov ebx, dword [ebp - 0x10]
    mov esi, dword [ebp - 0x24]
    mov eax, dword [ebp - 0x20]
    mov ecx, dword [ebp - 0x28]
    mov edx, dword [ebp - 0x18]
    sub esi, eax
    sub ecx, edx
    mov edx, esi
    mov eax, ecx
    add bh, 8
    call 0x65698
    sub ebx, eax
    mov word [ebp - 8], bx
    mov ah, byte [ebp - 7]
    and ah, 7
    mov ebx, dword [ebp - 0x2c]
    mov byte [ebp - 7], ah
    sub ebx, dword [ebp - 0x1c]
    mov edx, esi
    sar ebx, 4
    mov eax, ecx
    call 0x9e55c
    mov ebx, dword [ebp - 0x14]
    mov edx, eax
    mov esi, eax
    test bx, bx
    jl short loc_2a2a
    movsx eax, di
    test byte [eax + 0xe7240], 0x10
    jne short loc_2a2a
    movsx ecx, word [ebp - 0x14]
    imul ecx, ecx, 0x2c
    cmp word [ecx + 0x1c0bb2], 5
    jne short loc_2a2a
    cmp word [ecx + 0x1c0bca], 0x3e7
    jge short loc_2a2a
    movsx eax, word [ecx + 0x1c0bbc]
    mov dword [ebp - 0x30], eax
    mov ebx, dword [ebp - 0x30]
    lea eax, [eax*4]
    add eax, ebx
    mov ax, word [eax*8 + 0x2385c6]
    xor ah, ah
    db 0x66, 0x3d, 0x09, 0x00    ; cmp ax, 9
    jge short loc_2a2a
    movsx ebx, word [ecx + 0x1c0bcc]
    mov eax, edx
    inc ebx
    mov edx, eax
    sar edx, 0x12
    shl eax, 0xe
    idiv ebx
    mov esi, eax
loc_2a2a:
    movsx eax, di
    db 0x0f, 0xbf, 0x04, 0x45, 0x20, 0x51, 0x0e, 0x00    ; movsx eax, word [eax*2 + 0xe5120]
    add esi, eax
    test esi, esi
    jge short loc_2a3d
    xor esi, esi
loc_2a3d:
    test esi, esi
    je short loc_2a8e
    movsx eax, word [ebp - 0x14]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 5
    je short loc_2a8e
    movsx eax, word [eax + 0x1c0bbc]
    push eax
    mov eax, dword [ebp - 0x1c]
    sub eax, 0x1800
    mov ecx, dword [ebp - 0x20]
    push eax
    mov ebx, dword [ebp - 0x2c]
    mov edx, dword [ebp - 0x24]
    push ecx
    mov eax, dword [ebp - 0x18]
    sub ebx, 0x1800
    push eax
    movsx ecx, word [ebp - 0xc]
    mov eax, dword [ebp - 0x28]
    call 0x6ae4d
    test eax, eax
    jne short loc_2a8e
    mov eax, esi
    sar eax, 5
    add esi, eax
loc_2a8e:
    movsx eax, word [ebp - 0x14]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 5
    jne short loc_2ab0
    cmp word [eax + 0x1c0bca], 0x3e7
    jge short loc_2ab0
    inc dword [0x1163f4]
loc_2ab0:
    cmp di, 0xe
    jb short loc_2ac0
    jbe short loc_2ac6
    cmp di, 0x11
    je short loc_2ac6
    jmp short loc_2ad5
loc_2ac0:
    cmp di, 9
    jne short loc_2ad5
loc_2ac6:
    cmp esi, 0x1800
    jle short loc_2afb
    mov esi, 0x1800
    jmp short loc_2afb
loc_2ad5:
    cmp esi, 0x7ad4
    jle short loc_2afb
    movsx eax, word [ebp - 0x14]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 5
    je short loc_2afb
    movsx eax, di
    call loc_2788
    jmp near loc_2b6b
loc_2afb:
    movsx eax, di
    imul eax, eax, 0xd
    cmp dword [eax + 0xe75d0], 0
    jne short loc_2b18
    xor eax, eax
    mov ax, di
    call loc_1dc8
    test al, al
    je short loc_2b6b
loc_2b18:
    movsx eax, di
    test byte [eax + 0xe7240], 0x10
    je short loc_2b26
    xor esi, esi
loc_2b26:
    cmp esi, 0x1a40
    jge short loc_2b33
    mov esi, 0x1a40
loc_2b33:
    movsx ecx, di
    lea eax, [ecx*4]
    sub eax, ecx
    lea ecx, [eax*8]
    movsx edx, word [ebp - 8]
    movsx eax, word [ebp - 4]
    mov ebx, esi
    lea esi, [eax*4]
    sar ebx, 6
    sub esi, eax
    sar edx, 6
    mov eax, dword [ecx + esi*2 + 0xb23d2]
    call 0x94a48
loc_2b6b:
    inc dword [ebp - 4]
loc_2b6e:
    movsx ebx, di
    imul eax, ebx, 0xd
    movsx edx, word [ebp - 4]
    cmp edx, dword [eax + 0xe75d9]
    jl near loc_290c
    inc edi
    cmp di, 0x1c2
    jl near loc_2902
    mov esp, ebp
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
loc_2ba8:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 0x10
    mov dword [ebp - 0x10], eax
    test eax, eax
    jge short loc_2bd8
    mov eax, 0x11eda4
    sub eax, dword [ebp - 0x10]
    mov dh, byte [eax]
    cmp dh, 0xc8
    jb near loc_2d1b
    mov bl, dh
    dec bl
    mov byte [eax], bl
    jmp near loc_2d1b
loc_2bd8:
    imul eax, eax, 0xd
    mov ax, word [eax + 0xe75d9]
    mov dword [ebp - 4], eax
    test ax, ax
    jle near loc_2d0b
    mov eax, dword [ebp - 0x10]
    test byte [eax + 0xe7240], 0x10
    jne near loc_2cd4
    xor edx, edx
    jmp near loc_2cca
loc_2c05:
    mov ebx, dword [ebp - 0x10]
    lea eax, [ebx*4]
    sub eax, ebx
    lea eax, [eax*8]
    mov dword [ebp - 8], eax
    movsx eax, dx
    mov dword [ebp - 0xc], eax
    mov ebx, eax
    lea eax, [eax*4]
    sub eax, ebx
    mov esi, dword [ebp - 8]
    add eax, eax
    add esi, eax
    mov ax, word [esi + 0xb23d0]
    movsx edi, ax
    imul ebx, edi, 0x2c
    cmp word [ebx + 0x1c0bb2], 5
    jne near loc_2cc9
    movsx ecx, word [ebx + 0x1c0bbc]
    lea eax, [ecx*4]
    add eax, ecx
    cmp word [eax*8 + 0x2385c6], 3
    jge short loc_2cc9
    cmp word [ebx + 0x1c0bca], 0x3e7
    jge short loc_2cc9
    lea eax, [edi*8]
    add eax, edi
    lea eax, [eax*8]
    mov ebx, dword [ebp - 0xc]
    sub eax, edi
    xor edi, edi
    inc ebx
    mov dword [eax + 0x4ea07], edi
    movsx eax, word [ebp - 4]
    cmp ebx, eax
    jge short loc_2cd4
    lea ebx, [eax - 1]
    lea eax, [ebx*4]
    sub eax, ebx
    mov edx, dword [ebp - 8]
    add eax, eax
    add eax, edx
    mov ebx, dword [eax + 0xb23d2]
    mov dword [esi + 0xb23d2], ebx
    mov ax, word [eax + 0xb23d0]
    mov word [esi + 0xb23d0], ax
    jmp short loc_2cd4
loc_2cc9:
    inc edx
loc_2cca:
    cmp dx, word [ebp - 4]
    jl near loc_2c05
loc_2cd4:
    imul eax, dword [ebp - 0x10], 0xd
    mov ecx, dword [eax + 0xe75d9]
    movsx ebx, word [ebp - 4]
    dec ecx
    dec ebx
    mov dword [eax + 0xe75d9], ecx
    lea ecx, [ebx*4]
    sub ecx, ebx
    mov ebx, dword [ebp - 0x10]
    lea eax, [ebx*4]
    add ecx, ecx
    sub eax, ebx
    mov word [ecx + eax*8 + 0xb23d0], 0xffff
loc_2d0b:
    imul eax, dword [ebp - 0x10], 0xd
    mov dl, byte [eax + 0xe75d4]
    dec byte [eax + 0xe75d4]
loc_2d1b:
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
loc_2d28:
    push ebx
    push ecx
    push edx
    mov bh, 0xc7
    xor eax, eax
    cmp eax, 0x1c2
    jl short loc_2d3c
    mov ch, 0xc7
    xor eax, eax
    jmp short loc_2d73
loc_2d3c:
    imul edx, eax, 0xd
    cmp byte [edx + 0xe75d4], 0xc8
    jb short loc_2d4e
    mov byte [edx + 0xe75d4], bh
loc_2d4e:
    inc eax
    cmp eax, 0x1c2
    jl short loc_2d3c
    mov ch, 0xc7
    xor eax, eax
    cmp eax, 0xb
    jl short loc_2d63
    pop edx
    pop ecx
    pop ebx
    ret
loc_2d63:
    cmp byte [eax + 0x11eda4], 0xc8
    jb short loc_2d72
    mov byte [eax + 0x11eda4], ch
loc_2d72:
    inc eax
loc_2d73:
    cmp eax, 0xb
    jl short loc_2d63
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
loc_2d88:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 0x10
    mov ecx, eax
    xor edx, edx
    call 0x9f170
    push ecx
    mov ebx, 0xc
    mov edi, dword [0x11ebc8]
    push 0x333c
    mov esi, eax
    mov dword [ebp - 4], eax
    call 0xa2784
    add esp, 8
    lea edx, [ebp - 0x10]
    mov eax, esi
    call 0x9f268
    mov ebx, 4
    mov edx, 0x334c
    lea eax, [ebp - 0x10]
    call 0xa3a59
    test eax, eax
    je short loc_2de8
    push ecx
    push 0x3354
    call 0x9baac
    add esp, 8
loc_2de8:
    mov eax, dword [ebp - 0xc]
    call 0x9bcc0
    mov dword [ebp - 0xc], eax
    mov eax, dword [ebp - 8]
    call 0x9bcc0
    mov ecx, dword [ebp - 0xc]
    shl ecx, 4
    lea edx, [ecx + 3]
    mov dword [ebp - 8], eax
    and dl, 0xfc
    call 0xa3a82
    cmp edx, eax
    jae short loc_2e1b
    mov eax, edx
    sub esp, eax
    mov eax, esp
    jmp short loc_2e1d
loc_2e1b:
    xor eax, eax
loc_2e1d:
    mov esi, eax
    test eax, eax
    jne short loc_2e30
    push 0x3378
    call 0x9baac
    add esp, 4
loc_2e30:
    mov edx, dword [ebp - 8]
    mov eax, dword [ebp - 4]
    xor ebx, ebx
    call 0xa3a8b
    mov eax, dword [ebp - 4]
    mov ebx, ecx
    mov edx, esi
    call 0x9f268
    mov eax, dword [ebp - 0xc]
    mov edx, dword [0x11ebc8]
    add edx, eax
    mov dword [0x11ebc8], edx
    lea eax, [edx*4]
    add edx, eax
    mov eax, 0x11ebc4
    lea edx, [edx*4]
    call 0x9be20
    lea eax, [edi*4]
    add eax, edi
    mov ecx, dword [0x11ebc4]
    lea eax, [eax*4]
    add ecx, eax
    jmp short loc_2ebf
loc_2e8e:
    mov eax, dword [ebp - 4]
    mov dword [ecx + 8], eax
    mov eax, dword [esi]
    mov ebx, 8
    call 0x9bcc0
    mov dword [ecx + 0xc], eax
    lea edx, [esi + 8]
    mov eax, dword [esi + 4]
    inc edi
    call 0x9bcc0
    mov dword [ecx + 0x10], eax
    mov eax, ecx
    add esi, 0x10
    call 0xa3ace
    add ecx, 0x14
loc_2ebf:
    cmp edi, dword [0x11ebc8]
    jb short loc_2e8e
    mov esp, ebp
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
    mov edx, eax
    xor ebx, ebx
    mov eax, 5
    mov dword [0x11ebc8], ebx
    call 0x9bdf4
    push 0x33ac
    mov dword [0x11ebc4], eax
    call 0xa2784
    add esp, 4
    mov eax, edx
    call 0x9f24c
    test eax, eax
    je short loc_2f14
    mov eax, edx
    call loc_2d88
loc_2f14:
    mov ecx, dword [0x11ebc8]
    test ecx, ecx
    je short loc_2f43
    lea ebx, [ecx*4]
    mov esi, 1
    mov eax, ebx
    xor edx, edx
    call 0x9bdf4
    mov dword [0x11ebc0], eax
    call 0xa3b00
    mov dword [0x9e5c], esi
loc_2f43:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [0x11ebc8]
    dec eax
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
loc_2f58:
    push ebx
    push edx
    mov edx, eax
    mov ebx, dword [0x11ebc8]
    lea edx, [eax + 1]
    cmp edx, ebx
    jl short loc_2f77
    push edx
    push 0x33c4
    call 0x9baac
    add esp, 8
loc_2f77:
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [0x11ebc4]
    mov eax, dword [edx + eax*4 + 0x10]
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
    push ebx
    push edx
    mov edx, eax
    mov ebx, dword [0x11ebc8]
    lea edx, [eax + 1]
    cmp edx, ebx
    jl short loc_2fb7
    push edx
    push 0x33e4
    call 0x9baac
    add esp, 8
loc_2fb7:
    lea eax, [edx*4]
    add edx, eax
    mov eax, dword [0x11ebc4]
    lea edx, [edx*4]
    add eax, edx
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
loc_2fd8:
    push ebx
    push ecx
    push esi
    mov ebx, eax
    mov esi, edx
    cmp eax, dword [0x11ebc8]
    jl short loc_2ff5
    push eax
    push 0x3408
    call 0x9baac
    add esp, 8
loc_2ff5:
    test ebx, ebx
    jge short loc_3007
    push ebx
    push 0x3428
    call 0x9baac
    add esp, 8
loc_3007:
    lea eax, [ebx*4]
    add eax, ebx
    mov ecx, dword [0x11ebc4]
    lea eax, [eax*4]
    add ecx, eax
    xor ebx, ebx
    mov edx, dword [ecx + 0xc]
    mov eax, dword [ecx + 8]
    call 0xa3a8b
    mov edx, esi
    mov ebx, dword [ecx + 0x10]
    mov eax, dword [ecx + 8]
    call 0x9f268
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov ecx, eax
    mov edx, dword [0x11ebc8]
    lea ecx, [eax + 1]
    cmp ecx, edx
    jb short loc_306b
    push edx
    push ecx
    push 0x3440
    call 0x9baac
    add esp, 0xc
loc_306b:
    mov eax, dword [0x11ebc0]
    lea esi, [ecx*4]
    cmp dword [esi + eax], 0
    jne short loc_30b5
    mov byte [ecx + 0x11eda4], 0xc8
    mov ebx, 0x11eda4
    add ebx, ecx
    lea eax, [ecx - 1]
    call loc_2f58
    mov edi, dword [0x11ebc0]
    add edi, esi
    mov edx, eax
    mov eax, edi
    call 0x7a048
    mov eax, dword [0x11ebc0]
    mov edx, dword [esi + eax]
    mov eax, ecx
    call loc_2fd8
    jmp short loc_30df
loc_30b5:
    mov ah, byte [ecx + 0x11eda4]
    cmp ah, 0xc8
    jae short loc_30d5
    mov byte [ecx + 0x11eda4], 0xc8
    mov eax, dword [0x11ebc0]
    mov eax, dword [eax + ecx*4]
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_30d5:
    mov dl, ah
    inc dl
    mov byte [ecx + 0x11eda4], dl
loc_30df:
    mov eax, dword [0x11ebc0]
    mov eax, dword [eax + ecx*4]
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
    add byte [ebx + 0x6f], al
    db 0x6d    ; insd dword es:[edi], dx
    db 0x6d    ; insd dword es:[edi], dx
    bound esp, qword [ecx + 0x74]
    dec ebp
    popad
    arpl word [edx + 0x6f], si
    and esp, dword [eax]
    add byte [eax + 0x56525153], dl
    push edi
    sub esp, 0x17c
    mov edx, 0x375c
    mov eax, 0xa18c
    call 0xa2765
    mov eax, 0xa18c
    call 0xa27f0
    add eax, 0xa18c
loc_3131:
    dec eax
    cmp byte [eax], 0x2e
    jne short loc_3131
    mov edx, eax
    lea eax, [esp + 0x171]
    mov ebx, esp
    call 0xa2765
    mov dh, 0x2a
    lea eax, [esp + 0x170]
    mov byte [esp + 0x170], dh
    xor edx, edx
    xor ecx, ecx
    call 0xa3872
    test eax, eax
    jne short loc_318f
loc_3164:
    mov eax, 0x80
    inc ecx
    lea edx, [esp + 0x1e]
    call 0x9bdf4
    mov dword [esp + ecx*4 + 0x11c], eax
    call 0xa2765
    cmp ecx, 0x14
    je short loc_318f
    mov eax, esp
    call 0xa388f
    test eax, eax
    je short loc_3164
loc_318f:
    mov eax, 0x3768
    xor ebx, ebx
    call 0x9bb10
    mov bl, al
    test ebx, ebx
    je short loc_31b6
    mov eax, dword [0x14060]
    mov edx, dword [eax + ebx*4 + 4]
    mov eax, 0xa18c
    xor ecx, ecx
    call 0xa2765
loc_31b6:
    cmp ecx, 1
    jle near loc_32f8
    push 0x3774
    call 0xa2784
    add esp, 4
    push 0x37a0
    call 0xa2784
    add esp, 4
    push 0x37cc
    call 0xa2784
    add esp, 4
    push 0x3818
    xor ebx, ebx
    call 0xa2784
    add esp, 4
    jmp short loc_3246
loc_31f7:
    lea esi, [ebx*4]
    mov edx, 0x375c
    mov eax, dword [esp + esi + 0x120]
    call 0xa3b18
    test eax, eax
    je short loc_322a
    xor eax, eax
    mov edi, dword [esp + esi + 0x120]
    mov al, bl
    push edi
    add eax, 0x61
    push eax
    push 0x3830
    jmp short loc_323d
loc_322a:
    mov edx, dword [esp + esi + 0x120]
    mov al, bl
    push edx
    add eax, 0x61
    push eax
    push 0x3838
loc_323d:
    call 0xa2784
    add esp, 0xc
    inc ebx
loc_3246:
    cmp ebx, ecx
    jl short loc_31f7
    push 0x384c
    call 0xa2784
    add esp, 4
    push 0x375c
    push 0x3850
    call 0xa2784
    add esp, 8
    mov esi, 9
    call 0x9ef7c
    call 0x9ef90
    call 0xa3b60
    mov edx, eax
    call 0xa3b60
    lea edi, [eax + 0x3e8]
loc_328a:
    call 0xa3b60
    cmp eax, edi
    jae short loc_32eb
    call 0xa3b60
    cmp eax, edx
    jbe short loc_32bd
    push esi
    push 0x3890
    call 0xa2784
    add esp, 8
    mov eax, 0x1408a
    dec esi
    call 0xa3b65
    call 0xa3b60
    lea edx, [eax + 0x64]
loc_32bd:
    call 0x9eedc
    test eax, eax
    je short loc_328a
    xor ebx, ebx
    call 0x9eef0
    mov bl, al
    sub ebx, 0x61
    test ebx, ebx
    jl short loc_328a
    cmp ebx, ecx
    jge short loc_328a
    mov eax, 0xa18c
    mov edx, dword [esp + ebx*4 + 0x120]
    call 0xa2765
loc_32eb:
    push 0x38a4
    call 0xa2784
    add esp, 4
loc_32f8:
    cmp ecx, 1
    jne short loc_330e
    mov edx, dword [esp + 0x120]
    mov eax, 0xa18c
    call 0xa2765
loc_330e:
    push 0xa18c
    push 0x38a8
    call 0xa2784
    add esp, 8
    call 0xa3b60
    lea ebx, [eax + 0x4b]
loc_3328:
    call 0xa3b60
    cmp eax, ebx
    jb short loc_3328
    xor ebx, ebx
    cmp ebx, ecx
    jl short loc_3343
    add esp, 0x17c
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_3343:
    mov eax, dword [esp + ebx*4 + 0x120]
    call 0x9be44
    inc ebx
    cmp ebx, ecx
    jl short loc_3343
    add esp, 0x17c
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
loc_3368:
    push ebx
    push ecx
    push edx
    mov ecx, eax
    xor ebx, ebx
    cmp ebx, 0x34
    jl short loc_337d
    mov eax, 0xffffffff
    pop edx
    pop ecx
    pop ebx
    ret
loc_337d:
    mov eax, ecx
    mov edx, dword [ebx*4 + 0xa0bc]
    call 0xa3b18
    test eax, eax
    jne short loc_3395
    mov eax, ebx
    pop edx
    pop ecx
    pop ebx
    ret
loc_3395:
    inc ebx
    cmp ebx, 0x34
    jl short loc_337d
    mov eax, 0xffffffff
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    cmp eax, 0x34
    jge short loc_33b5
    mov eax, dword [eax*4 + 0xa0bc]
    ret
loc_33b5:
    xor eax, eax
    ret
loc_33b8:
    push ebx
    push edx
    mov ebx, eax
    mov edx, 0x38c0
    call 0xa3b18
    test eax, eax
    je short loc_3417
    mov edx, 0x38d0
    mov eax, ebx
    call 0xa3b18
    test eax, eax
    jne short loc_33e2
    mov eax, 1
    pop edx
    pop ebx
    ret
loc_33e2:
    mov edx, 0x38e0
    mov eax, ebx
    call 0xa3b18
    test eax, eax
    jne short loc_33fa
    mov eax, 5
    pop edx
    pop ebx
    ret
loc_33fa:
    mov edx, 0x38f0
    mov eax, ebx
    call 0xa3b18
    test eax, eax
    jne short loc_3412
    mov eax, 2
    pop edx
    pop ebx
    ret
loc_3412:
    mov eax, 0xffffffff
loc_3417:
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push edx
    push edi
    push ebp
    mov edx, 1
    mov edi, 0xc0
    mov ebp, 0x80
    mov ebx, 8
    xor eax, eax
    mov dword [0x1273a8], edx
    mov dword [0x1273a4], edx
    mov ecx, edx
    mov dword [0x1273ac], edx
    mov dword [0x1273b0], edx
    mov dword [0x1275c8], edi
    mov dword [0x1275cc], ebp
    mov dword [0x1275a4], eax
    mov dword [0xb5180], eax
    mov dword [0xe934b], ebx
    mov dword [0xe934f], eax
    mov dword [0xe9327], ecx
    mov dword [0xe932b], ecx
    mov edi, ecx
    mov dword [0xe97ef], ecx
    mov dword [0xe97cb], ecx
    xor edx, edx
    xor ah, ah
    mov dword [0xe97c7], edi
    mov byte [0xe91f0], ah
    mov dword [0xe9353], edx
    pop ebp
    pop edi
    pop edx
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
    sub esp, 0xa4
    mov edx, 0x3908
    mov eax, dword [0x1273a0]
    call 0x9d668
    xor esi, esi
    mov dword [esp + 0xa0], eax
    jmp near loc_3584
loc_34e1:
    mov edx, 0x3908
    mov eax, dword [0x1273a0]
    mov ebx, esi
    call 0x9d6b4
    call loc_3368
    mov ebp, eax
    cmp eax, -1
    je near loc_3583
    mov ebx, 0x50
    lea eax, [esp + 0x50]
    xor edx, edx
    call 0xa3b00
    mov ebx, 0x50
    mov eax, esp
    xor edx, edx
    call 0xa3b00
    mov eax, esp
    mov edx, 0x3908
    mov ebx, esi
    push eax
    mov eax, dword [0x1273a0]
    lea ecx, [esp + 0x54]
    call 0x9d6b4
    mov edx, 0x3908
    mov edi, dword [0x1273a0]
    mov ebx, eax
    mov eax, edi
    call 0x9d828
    xor dl, dl
    mov ah, byte [esp + 0x50]
    xor dh, dh
    test ah, ah
    je short loc_3563
    lea eax, [esp + 0x50]
    call 0x9efc4
    mov dl, al
loc_3563:
    cmp byte [esp], 0
    je short loc_3572
    mov eax, esp
    call 0x9efc4
    mov dh, al
loc_3572:
    xor ebx, ebx
    mov bl, dh
    and edx, 0xff
    mov eax, ebp
    call 0xa01ec
loc_3583:
    inc esi
loc_3584:
    cmp esi, dword [esp + 0xa0]
    jl near loc_34e1
    add esp, 0xa4
    pop ebp
    pop edi
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
    sub esp, 0xa8
    mov edi, eax
    xor esi, esi
    cmp esi, 3
    jl short loc_35c3
    xor esi, esi
    jmp near loc_37b6
loc_35c3:
    push esi
    push 0x3918
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0xa27b9
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa3b00
    mov ebx, esp
    mov edx, 0x3928
    mov eax, edi
    call 0x9d790
    lea eax, [esp + 0x50]
    call loc_3368
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3616
    mov edx, esi
    xor ebx, ebx
    call 0xa02d0
loc_3616:
    push esi
    push 0x3934
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0xa27b9
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa3b00
    mov ebx, esp
    mov edx, 0x3928
    mov eax, edi
    call 0x9d790
    lea eax, [esp + 0x50]
    call loc_3368
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_366c
    mov ebx, 1
    mov edx, esi
    call 0xa02d0
loc_366c:
    inc esi
    cmp esi, 3
    jl near loc_35c3
    xor esi, esi
    jmp near loc_37b6
loc_367d:
    push esi
    push 0x394c
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0xa27b9
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa3b00
    mov ebx, esp
    mov edx, 0x3928
    mov eax, edi
    call 0x9d790
    lea eax, [esp + 0x50]
    call loc_33b8
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_36d0
    mov edx, eax
    mov eax, esi
    call 0xa0314
loc_36d0:
    push esi
    push 0x3960
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0xa27b9
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa3b00
    mov ebx, esp
    mov edx, 0x3928
    mov eax, edi
    call 0x9d790
    lea eax, [esp + 0x50]
    call loc_3368
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3725
    mov edx, eax
    xor ebx, ebx
    mov eax, esi
    call 0xa037c
loc_3725:
    push esi
    push 0x3978
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0xa27b9
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa3b00
    mov ebx, esp
    mov edx, 0x3928
    mov eax, edi
    call 0x9d790
    lea eax, [esp + 0x50]
    call loc_3368
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_377d
    mov ebx, 1
    mov edx, eax
    mov eax, esi
    call 0xa037c
loc_377d:
    push esi
    push 0x3990
    lea eax, [esp + 8]
    push eax
    lea ecx, [esp + 0xb0]
    lea ebx, [esp + 0xc]
    call 0xa27b9
    add esp, 0xc
    mov edx, 0x3928
    mov eax, edi
    call 0x9d948
    mov edx, dword [esp + 0xa4]
    mov eax, esi
    call 0xa0354
    inc esi
loc_37b6:
    cmp esi, 2
    jl near loc_367d
    lea ecx, [esp + 0xa0]
    mov ebx, 0x39a4
    mov edx, 0x3928
    mov eax, edi
    call 0x9d948
    mov eax, dword [esp + 0xa0]
    call 0x9f82c
    add esp, 0xa8
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
    sub esp, 0xa4
    mov edi, eax
    xor esi, esi
    cmp esi, 8
    jl short loc_3813
    xor esi, esi
    jmp near loc_397b
loc_3813:
    push esi
    push 0x39b8
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0xa27b9
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa3b00
    mov ebx, esp
    mov edx, 0x3928
    mov eax, edi
    call 0x9d790
    lea eax, [esp + 0x50]
    call loc_3368
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3866
    mov edx, esi
    xor ebx, ebx
    call 0xa02d0
loc_3866:
    push esi
    push 0x39cc
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0xa27b9
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa3b00
    mov ebx, esp
    mov edx, 0x3928
    mov eax, edi
    call 0x9d790
    lea eax, [esp + 0x50]
    call loc_3368
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_38bc
    mov ebx, 1
    mov edx, esi
    call 0xa02d0
loc_38bc:
    inc esi
    cmp esi, 8
    jl near loc_3813
    xor esi, esi
    jmp near loc_397b
loc_38cd:
    push esi
    push 0x39e8
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0xa27b9
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa3b00
    mov ebx, esp
    mov edx, 0x3928
    mov eax, edi
    call 0x9d790
    lea eax, [esp + 0x50]
    call loc_3368
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3922
    mov edx, eax
    xor ebx, ebx
    mov eax, esi
    call 0xa037c
loc_3922:
    push esi
    push 0x3a00
    lea eax, [esp + 8]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0xa27b9
    add esp, 0xc
    lea eax, [esp + 0x50]
    lea ecx, [esp + 0x50]
    call 0xa3b00
    mov ebx, esp
    mov edx, 0x3928
    mov eax, edi
    call 0x9d790
    lea eax, [esp + 0x50]
    call loc_3368
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_397a
    mov ebx, 1
    mov edx, eax
    mov eax, esi
    call 0xa037c
loc_397a:
    inc esi
loc_397b:
    cmp esi, 2
    jl near loc_38cd
    lea ecx, [esp + 0xa0]
    mov ebx, 0x3a18
    mov edx, 0x3928
    mov eax, edi
    call 0x9d948
    mov al, byte [esp + 0xa0]
    mov byte [0x13fd8], al
    add esp, 0xa4
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0xa8
    mov edi, eax
    xor esi, esi
    cmp esi, 8
    jl short loc_39d3
    xor esi, esi
    jmp near loc_3bb2
loc_39d3:
    push esi
    push 0x39b8
    lea eax, [esp + 0x58]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0xa27b9
    add esp, 0xc
    mov eax, esp
    mov ecx, esp
    call 0xa3b00
    lea ebx, [esp + 0x50]
    mov edx, 0x3928
    mov eax, edi
    call 0x9d790
    mov eax, esp
    call loc_3368
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3a22
    mov edx, esi
    xor ebx, ebx
    call 0xa02d0
loc_3a22:
    push esi
    push 0x39cc
    lea eax, [esp + 0x58]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0xa27b9
    add esp, 0xc
    mov eax, esp
    mov ecx, esp
    call 0xa3b00
    lea ebx, [esp + 0x50]
    mov edx, 0x3928
    mov eax, edi
    call 0x9d790
    mov eax, esp
    call loc_3368
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3a74
    mov ebx, 1
    mov edx, esi
    call 0xa02d0
loc_3a74:
    inc esi
    cmp esi, 8
    jl near loc_39d3
    xor esi, esi
    jmp near loc_3bb2
loc_3a85:
    push esi
    push 0x3a28
    lea eax, [esp + 0x58]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0xa27b9
    add esp, 0xc
    mov eax, esp
    mov ecx, esp
    call 0xa3b00
    lea ebx, [esp + 0x50]
    mov edx, 0x3928
    mov eax, edi
    call 0x9d790
    mov eax, esp
    call loc_33b8
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3ad4
    mov edx, eax
    mov eax, esi
    call 0xa0314
loc_3ad4:
    push esi
    push 0x3a40
    lea eax, [esp + 0x58]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0xa27b9
    add esp, 0xc
    mov eax, esp
    mov ecx, esp
    call 0xa3b00
    lea ebx, [esp + 0x50]
    mov edx, 0x3928
    mov eax, edi
    call 0x9d790
    mov eax, esp
    call loc_3368
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3b25
    mov edx, eax
    xor ebx, ebx
    mov eax, esi
    call 0xa037c
loc_3b25:
    push esi
    push 0x3a5c
    lea eax, [esp + 0x58]
    push eax
    mov ebx, 0x50
    xor edx, edx
    call 0xa27b9
    add esp, 0xc
    mov eax, esp
    mov ecx, esp
    call 0xa3b00
    lea ebx, [esp + 0x50]
    mov edx, 0x3928
    mov eax, edi
    call 0x9d790
    mov eax, esp
    call loc_3368
    mov dword [esp + 0xa0], eax
    cmp eax, -1
    je short loc_3b79
    mov ebx, 1
    mov edx, eax
    mov eax, esi
    call 0xa037c
loc_3b79:
    push esi
    push 0x3a78
    lea eax, [esp + 0x58]
    push eax
    lea ecx, [esp + 0xb0]
    lea ebx, [esp + 0x5c]
    call 0xa27b9
    add esp, 0xc
    mov edx, 0x3928
    mov eax, edi
    call 0x9d948
    mov edx, dword [esp + 0xa4]
    mov eax, esi
    call 0xa0354
    inc esi
loc_3bb2:
    cmp esi, 4
    jl near loc_3a85
    lea ecx, [esp + 0xa0]
    mov ebx, 0x3a18
    mov edx, 0x3928
    mov eax, edi
    call 0x9d948
    mov al, byte [esp + 0xa0]
    mov ecx, 0x13fc8
    mov ebx, 0x3a90
    mov edx, 0x3928
    mov byte [0x13fd8], al
    mov eax, edi
    call 0x9d948
    add esp, 0xa8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 8
    xor edx, edx
    mov edi, 0x3aa0
    mov word [esp + 4], dx
    jmp short loc_3c8f
loc_3c1e:
    mov al, byte [esp + 4]
    add al, 0x30
    mov edx, 0x3aac
    mov byte [edi + 4], al
    mov eax, edi
    call 0xa2d71
    mov esi, eax
    test eax, eax
    je short loc_3c8a
    mov ebx, 1
    mov edx, 4
    mov ecx, eax
    mov eax, esp
    call 0x7ad6d
    cmp dword [esp], 0x75
    jne short loc_3c97
    mov ebx, 1
    mov edx, 4
    mov eax, esp
    mov ecx, esi
    call 0x7ad6d
    movsx eax, word [esp + 4]
    imul eax, eax, 0x16
    mov ebx, 1
    mov edx, 0x13
    mov ecx, esi
    add eax, 0xe9114
    call 0x7ad6d
    mov eax, esi
    call 0xa2809
loc_3c8a:
    inc word [esp + 4]
loc_3c8f:
    cmp word [esp + 4], 0xa
    jl short loc_3c1e
loc_3c97:
    add esp, 8
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
%endif
