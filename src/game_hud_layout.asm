; HUD layout differences between retail and the update.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    push esi
    push edi
    push ebp
    sub esp, 8
    mov esi, eax
    mov edi, edx
    mov ebp, ebx
    mov dword [esp], ecx
    movsx eax, word [eax + 0x312]
    mov dword [esp + 4], eax
    cmp eax, 7
    sete al
    mov ah, 0x14
    mul ah
    mov ah, 0xc
    sub ah, al
    mov al, ah
    and eax, 0xff
    mov ebx, dword [0x123a1c]
    push eax
    movsx ecx, word [esi + 0x2b4]
    push ebx
    mov eax, 7
    mov ebx, ebp
    call 0x135e0
    cmp dword [esp + 4], 8
    sete al
    mov ah, 0x14
    mul ah
    mov ah, 0xc
    sub ah, al
    mov al, ah
    and eax, 0xff
    mov ebx, ebp
    push eax
    mov eax, dword [0x123a20]
    mov edx, edi
    push eax
    movsx ecx, word [esi + 0x2b6]
    mov eax, 8
    call 0x135e0
    cmp dword [esp + 4], 2
    sete al
    mov ah, 0x14
    mul ah
    mov ah, 0xc
    sub ah, al
    mov al, ah
    mov ebx, dword [0x123a08]
    and eax, 0xff
    mov edx, edi
    push eax
    movsx ecx, word [esi + 0x2aa]
    push ebx
    mov eax, 2
    mov ebx, ebp
    call 0x135e0
    cmp dword [esp + 4], 6
    sete al
    mov ah, 0x14
    mul ah
    mov ah, 0xc
    sub ah, al
    mov al, ah
    and eax, 0xff
    mov ebx, ebp
    push eax
    mov eax, dword [0x123a18]
    mov edx, edi
    push eax
    movsx ecx, word [esi + 0x2b2]
    mov eax, 6
    call 0x135e0
    cmp dword [esp], -1
    je short loc_0161
    mov ecx, 0xc8
    mov eax, 0xbe
    mov edx, dword [0x2d6bc4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0x6c
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2d6bc4]
    mov eax, 0xb8
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0x60
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x6eb5e
loc_0161:
    cmp byte [esi + 0x3d8], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp + 4]
    add dl, 0xc
    cmp ebx, 5
    sete al
    mov ah, 0x12
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0x123a14]
    and eax, 0xff
    lea ebx, [ebp + 6]
    push eax
    mov edx, edi
    mov eax, 5
    push ecx
    movsx ecx, word [esi + 0x2b0]
    call 0x135e0
    cmp dword [esp], -1
    je short loc_0226
    mov ecx, 0xc8
    mov eax, 0xc4
    mov edx, dword [0x2d6bc4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0x6c
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2d6bc4]
    mov eax, 0xbe
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0x60
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x6eb5e
loc_0226:
    cmp byte [esi + 0x3d4], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp + 4]
    add dl, 0xc
    cmp ebx, 1
    sete al
    mov ah, 0x12
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0x123a04]
    and eax, 0xff
    lea ebx, [ebp + 0xc]
    push eax
    mov edx, edi
    mov eax, 1
    push ecx
    movsx ecx, word [esi + 0x2a8]
    call 0x135e0
    cmp dword [esp], -1
    je short loc_02eb
    mov ecx, 0xc8
    mov eax, 0xb8
    mov edx, dword [0x2d6bc4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0x8f
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2d6bc4]
    mov eax, 0xb2
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0x87
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x6eb5e
loc_02eb:
    cmp byte [esi + 0x3d7], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp + 4]
    add dl, 0xc
    cmp ebx, 4
    sete al
    mov ah, 0x13
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0x123a10]
    and eax, 0xff
    lea edx, [edi + 0x27]
    push eax
    mov ebx, ebp
    mov eax, 4
    push ecx
    movsx ecx, word [esi + 0x2ae]
    call 0x13330
    cmp dword [esp], -1
    je short loc_03b0
    mov ecx, 0xc8
    mov eax, 0xbe
    mov edx, dword [0x2d6bc4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0x8f
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2d6bc4]
    mov eax, 0xb8
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0x87
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x6eb5e
loc_03b0:
    mov dx, word [esi + 0x2ac]
    mov bl, byte [esi + 0x3d6]
    test dx, dx
    sete ah
    test bl, bl
    sete al
    or al, ah
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp + 4]
    add dl, 0xc
    cmp ebx, 3
    je short loc_03e1
    cmp ebx, 3
    jne short loc_03e5
loc_03e1:
    mov al, 1
    jmp short loc_03e7
loc_03e5:
    xor al, al
loc_03e7:
    mov ah, 0x13
    mul ah
    sub dl, al
    mov al, dl
    and eax, 0xff
    lea ebx, [ebp + 6]
    push eax
    mov eax, dword [0x123a0c]
    lea edx, [edi + 0x27]
    push eax
    movsx ecx, word [esi + 0x2ac]
    mov eax, 3
    call 0x13330
    cmp dword [esp], -1
    je short loc_048f
    mov ecx, 0xc8
    mov eax, 0xc4
    mov edx, dword [0x2d6bc4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0x8f
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2d6bc4]
    mov eax, 0xbe
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0x87
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x6eb5e
loc_048f:
    movsx eax, word [esi + 0x2a4]
    test eax, 0x80000
    je short loc_04e3
    cmp byte [esi + 0x3e6], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp + 4]
    add dl, 0xc
    cmp ebx, 0x13
    sete al
    mov ah, 0x12
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0x123a4c]
    and eax, 0xff
    lea ebx, [ebp + 0xc]
    push eax
    lea edx, [edi + 0x27]
    mov eax, 0xe
    push ecx
    movsx ecx, word [esi + 0x2cc]
    jmp short loc_0527
loc_04e3:
    cmp byte [esi + 0x3e1], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp + 4]
    add dl, 0xc
    cmp ebx, 0xe
    sete al
    mov ah, 0x12
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0x123a38]
    and eax, 0xff
    lea ebx, [ebp + 0xc]
    push eax
    lea edx, [edi + 0x27]
    mov eax, 0xe
    push ecx
    movsx ecx, word [esi + 0x2c2]
loc_0527:
    call 0x13330
    test byte [esp + 1], 1
    je near loc_05fc
    cmp dword [esp], -1
    je short loc_05b4
    mov ecx, 0xc8
    mov eax, 0xb8
    mov edx, dword [0x2d6bc4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0xae
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2d6bc4]
    mov eax, 0xb2
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0xa6
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x6eb5e
loc_05b4:
    cmp byte [esi + 0x3e2], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp + 4]
    add dl, 0xc
    cmp ebx, 0xf
    sete al
    mov ah, 0x12
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0x123a3c]
    and eax, 0xff
    lea edx, [edi + 0x46]
    push eax
    mov ebx, ebp
    mov eax, 0xf
    push ecx
    movsx ecx, word [esi + 0x2c4]
    call 0x13330
loc_05fc:
    test byte [esp + 1], 2
    je near loc_06cd
    cmp dword [esp], -1
    je short loc_0684
    mov ecx, 0xc8
    mov eax, 0xbe
    mov edx, dword [0x2d6bc4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0xae
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2d6bc4]
    mov eax, 0xb8
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0xa6
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x6eb5e
loc_0684:
    cmp byte [esi + 0x3e3], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp + 4]
    add dl, 0xc
    cmp ebx, 0x10
    sete al
    mov ah, 0x12
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0x123a40]
    and eax, 0xff
    lea ebx, [ebp + 6]
    push eax
    lea edx, [edi + 0x46]
    mov eax, 0x10
    push ecx
    movsx ecx, word [esi + 0x2c6]
    call 0x13330
loc_06cd:
    test byte [esp + 2], 1
    je near loc_079e
    cmp dword [esp], -1
    je short loc_0755
    mov ecx, 0xc8
    mov eax, 0xc4
    mov edx, dword [0x2d6bc4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0xae
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2d6bc4]
    mov eax, 0xbe
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2d6bc8]
    mov eax, 0xa6
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x6eb5e
loc_0755:
    cmp byte [esi + 0x3e4], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp + 4]
    add dl, 0xc
    cmp ebx, 0x11
    sete al
    mov ah, 0x12
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0x123a44]
    and eax, 0xff
    lea ebx, [ebp + 0xc]
    push eax
    lea edx, [edi + 0x46]
    mov eax, 0xffffffff
    push ecx
    movsx ecx, word [esi + 0x2c8]
    call 0x13330
loc_079e:
    add esp, 8
    pop ebp
    pop edi
    pop esi
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
%else
    push esi
    push edi
    push ebp
    sub esp, 8
    mov esi, eax
    mov ebp, edx
    mov edi, ebx
    mov dword [esp + 4], ecx
    movsx eax, word [eax + 0x312]
    mov dword [esp], eax
    test byte [esp + 4], 4
    je near loc_00d4
    cmp ecx, -1
    je short loc_00a1
    mov ecx, 0xc8
    mov eax, 0xb8
    mov edx, dword [0x2454b4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0x6c
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2454b4]
    mov eax, 0xb2
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0x60
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x7169e
loc_00a1:
    cmp dword [esp], 5
    sete al
    mov ah, 0x14
    mul ah
    mov ah, 0xc
    sub ah, al
    mov al, ah
    mov ecx, dword [0xe700c]
    and eax, 0xff
    mov ebx, edi
    push eax
    mov edx, ebp
    mov eax, 5
    push ecx
    movsx ecx, word [esi + 0x2b0]
    call 0x13600
loc_00d4:
    test byte [esp + 4], 8
    je near loc_01a4
    cmp dword [esp + 4], -1
    je short loc_015d
    mov ecx, 0xc8
    mov eax, 0xbe
    mov edx, dword [0x2454b4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0x6c
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2454b4]
    mov eax, 0xb8
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0x60
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x7169e
loc_015d:
    cmp byte [esi + 0x3d7], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp]
    add dl, 0xc
    cmp ebx, 4
    sete al
    mov ah, 0x12
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0xe7008]
    and eax, 0xff
    lea ebx, [edi + 6]
    push eax
    mov edx, ebp
    mov eax, 4
    push ecx
    movsx ecx, word [esi + 0x2ae]
    call 0x13600
loc_01a4:
    test byte [esp + 4], 0x10
    je near loc_0274
    cmp dword [esp + 4], -1
    je short loc_022d
    mov ecx, 0xc8
    mov eax, 0xc4
    mov edx, dword [0x2454b4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0x6c
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2454b4]
    mov eax, 0xbe
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0x60
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x7169e
loc_022d:
    cmp byte [esi + 0x3d4], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp]
    add dl, 0xc
    cmp ebx, 1
    sete al
    mov ah, 0x12
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0xe6ffc]
    and eax, 0xff
    lea ebx, [edi + 0xc]
    push eax
    mov edx, ebp
    mov eax, 1
    push ecx
    movsx ecx, word [esi + 0x2a8]
    call 0x13600
loc_0274:
    test byte [esp + 4], 0x20
    je near loc_0344
    cmp dword [esp + 4], -1
    je short loc_02fd
    mov ecx, 0xc8
    mov eax, 0xb8
    mov edx, dword [0x2454b4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0x8f
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2454b4]
    mov eax, 0xb2
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0x87
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x7169e
loc_02fd:
    cmp byte [esi + 0x3d6], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp]
    add dl, 0xc
    cmp ebx, 3
    sete al
    mov ah, 0x13
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0xe7004]
    and eax, 0xff
    lea edx, [ebp + 0x27]
    push eax
    mov ebx, edi
    mov eax, 3
    push ecx
    movsx ecx, word [esi + 0x2ac]
    call 0x13350
loc_0344:
    test byte [esp + 4], 0x40
    je near loc_042b
    cmp dword [esp + 4], -1
    je short loc_03cd
    mov ecx, 0xc8
    mov eax, 0xbe
    mov edx, dword [0x2454b4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0x8f
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2454b4]
    mov eax, 0xb8
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0x87
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x7169e
loc_03cd:
    cmp word [esi + 0x2aa], 0
    sete ah
    cmp byte [esi + 0x3d5], 0
    sete al
    or al, ah
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp]
    add dl, 0xc
    cmp ebx, 2
    je short loc_03fa
    cmp ebx, 2
    jne short loc_03fe
loc_03fa:
    mov al, 1
    jmp short loc_0400
loc_03fe:
    xor al, al
loc_0400:
    mov ah, 0x13
    mul ah
    sub dl, al
    mov al, dl
    and eax, 0xff
    lea ebx, [edi + 6]
    push eax
    mov eax, dword [0xe7000]
    lea edx, [ebp + 0x27]
    push eax
    movsx ecx, word [esi + 0x2aa]
    mov eax, 2
    call 0x13350
loc_042b:
    test byte [esp + 4], 0x80
    je near loc_054f
    cmp dword [esp + 4], -1
    je short loc_04b4
    mov ecx, 0xc8
    mov eax, 0xc4
    mov edx, dword [0x2454b4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0x8f
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2454b4]
    mov eax, 0xbe
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0x87
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x7169e
loc_04b4:
    movsx eax, word [esi + 0x2a4]
    test eax, 0x10000
    je short loc_0507
    cmp byte [esi + 0x3e3], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp]
    add dl, 0xc
    cmp ebx, 0x10
    sete al
    mov ah, 0x12
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0xe7038]
    and eax, 0xff
    lea ebx, [edi + 0xc]
    push eax
    lea edx, [ebp + 0x27]
    mov eax, 0xb
    push ecx
    movsx ecx, word [esi + 0x2c6]
    jmp short loc_054a
loc_0507:
    cmp byte [esi + 0x3de], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp]
    add dl, 0xc
    cmp ebx, 0xb
    sete al
    mov ah, 0x12
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0xe7024]
    and eax, 0xff
    lea ebx, [edi + 0xc]
    push eax
    lea edx, [ebp + 0x27]
    mov eax, 0xb
    push ecx
    movsx ecx, word [esi + 0x2bc]
loc_054a:
    call 0x13350
loc_054f:
    test byte [esp + 5], 1
    je near loc_061f
    cmp dword [esp + 4], -1
    je short loc_05d8
    mov ecx, 0xc8
    mov eax, 0xb8
    mov edx, dword [0x2454b4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0xae
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2454b4]
    mov eax, 0xb2
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0xa6
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x7169e
loc_05d8:
    cmp byte [esi + 0x3df], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp]
    add dl, 0xc
    cmp ebx, 0xc
    sete al
    mov ah, 0x12
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0xe7028]
    and eax, 0xff
    lea edx, [ebp + 0x46]
    push eax
    mov ebx, edi
    mov eax, 0xc
    push ecx
    movsx ecx, word [esi + 0x2be]
    call 0x13350
loc_061f:
    test byte [esp + 5], 2
    je near loc_06f0
    cmp dword [esp + 4], -1
    je short loc_06a8
    mov ecx, 0xc8
    mov eax, 0xbe
    mov edx, dword [0x2454b4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0xae
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2454b4]
    mov eax, 0xb8
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0xa6
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x7169e
loc_06a8:
    cmp byte [esi + 0x3e0], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp]
    add dl, 0xc
    cmp ebx, 0xd
    sete al
    mov ah, 0x12
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0xe702c]
    and eax, 0xff
    lea ebx, [edi + 6]
    push eax
    lea edx, [ebp + 0x46]
    mov eax, 0xd
    push ecx
    movsx ecx, word [esi + 0x2c0]
    call 0x13350
loc_06f0:
    test byte [esp + 6], 1
    je near loc_07c1
    cmp dword [esp + 4], -1
    je short loc_0779
    mov ecx, 0xc8
    mov eax, 0xc4
    mov edx, dword [0x2454b4]
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0xae
    imul edx
    idiv ecx
    dec eax
    mov ecx, 0xc8
    push eax
    mov edx, dword [0x2454b4]
    mov eax, 0xbe
    imul edx
    idiv ecx
    mov ecx, 0x140
    push eax
    mov edx, dword [0x2454b8]
    mov eax, 0xa6
    imul edx
    idiv ecx
    push eax
    push 0xda
    push 0
    push 4
    mov ebx, 0x10000
    mov edx, 0xa60000
    push 0x99e
    xor ecx, ecx
    xor eax, eax
    call 0x7169e
loc_0779:
    cmp byte [esi + 0x3e1], 0
    sete al
    mov ah, 9
    mul ah
    mov dl, al
    mov ebx, dword [esp]
    add dl, 0xc
    cmp ebx, 0xe
    sete al
    mov ah, 0x12
    mul ah
    sub dl, al
    mov al, dl
    mov ecx, dword [0xe7030]
    and eax, 0xff
    lea ebx, [edi + 0xc]
    push eax
    lea edx, [ebp + 0x46]
    mov eax, 0xffffffff
    push ecx
    movsx ecx, word [esi + 0x2c2]
    call 0x13350
loc_07c1:
    add esp, 8
    pop ebp
    pop edi
    pop esi
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
%endif
