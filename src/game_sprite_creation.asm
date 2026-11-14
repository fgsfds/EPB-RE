; Allocate and initialize new sprite records.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    push ebx
    mov ebx, eax
    xor eax, eax
loc_0005:
    cmp ax, 0x1000
    jge short loc_0030
    movsx edx, ax
    imul edx, edx, 0x2c
    cmp bx, word [edx + 0x2522da]
    jne short loc_002d
    cmp word [edx + 0x2522c2], 6
    jne short loc_002d
    cmp byte [edx + 0x2522c5], 0
    je short loc_0035
loc_002d:
    inc eax
    jmp short loc_0005
loc_0030:
    mov eax, 0xffffffff
loc_0035:
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push esi
    push edi
    mov esi, edx
    mov ecx, 0x30d41
    xor ebx, ebx
    jmp short loc_0096
loc_004f:
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + 0x2522c2], 6
    jne short loc_0095
    mov dl, byte [eax + 0x2522c5]
    cmp dl, 1
    je short loc_006f
    cmp dl, 2
    jne short loc_0095
loc_006f:
    movsx eax, bx
    imul eax, eax, 0x2c
    mov edx, 0x2522b4
    add edx, eax
    movsx eax, si
    imul eax, eax, 0x2c
    add eax, 0x2522b4
    call 0x50a50
    cwde
    cmp ecx, eax
    jle short loc_0095
    mov edi, ebx
    mov ecx, eax
loc_0095:
    inc ebx
loc_0096:
    cmp bx, 0x1000
    jl short loc_004f
    cmp ecx, 0x4e21
    jne short loc_00af
    mov eax, 0xffffffff
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_00af:
    mov eax, edi
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    push esi
    push edi
    push ebp
    sub esp, 4
    mov esi, edx
    movsx edx, byte [esp + 0x34]
    cwde
    call 0x67ea8
    mov word [esp], ax
    test ax, ax
    jge short loc_00e6
    mov eax, 0x2a4
    call 0x15ff0
loc_00e6:
    movsx edi, word [esp]
    lea eax, [edi*8]
    add eax, edi
    lea eax, [eax*8]
    sub eax, edi
    mov dword [eax + 0x8b0db], esi
    mov dword [eax + 0x8b0df], ebx
    mov dword [eax + 0x8b0e3], ecx
    imul eax, edi, 0x2c
    add eax, 0x2522b4
    mov word [eax + 0xc], 0
    mov byte [eax + 0x11], 0
    mov dword [eax], esi
    mov edx, dword [esp + 0x14]
    mov dword [eax + 4], ebx
    mov word [eax + 0xe], dx
    mov dl, byte [esp + 0x18]
    mov byte [eax + 0x10], dl
    mov dl, byte [esp + 0x1c]
    mov byte [eax + 0x14], dl
    mov dl, byte [esp + 0x20]
    mov byte [eax + 0x15], dl
    mov dx, word [eax + 0xe]
    mov dword [eax + 8], ecx
    cmp dx, 0x11
    jne short loc_015d
    mov word [eax + 0x2a], 0x28
    mov byte [eax + 0x14], 0x1e
    mov byte [eax + 0x15], 0x1e
loc_015d:
    mov byte [eax + 0x16], 0
    mov edx, dword [esp + 0x24]
    mov byte [eax + 0x17], 0
    mov word [eax + 0x1c], dx
    mov edx, dword [esp + 0x28]
    mov word [eax + 0x20], dx
    mov edx, dword [esp + 0x2c]
    mov word [eax + 0x24], dx
    mov edx, dword [esp + 0x30]
    mov bx, word [eax + 0xe]
    mov word [eax + 0x1e], dx
    cmp bx, 0x214
    jne short loc_0198
    mov byte [eax + 0x14], 0x1a
    mov byte [eax + 0x15], 0x20
loc_0198:
    movsx ecx, word [esp + 0x30]
    imul esi, ecx, 0x2c
    movsx ebx, word [esp]
    lea edx, [ebx*8]
    mov word [eax + 0x22], 0
    add edx, ebx
    mov byte [eax + 0x12], 0
    lea edx, [edx*8]
    mov byte [eax + 0x11], 0
    sub edx, ebx
    mov edi, 0xffffffff
    mov word [eax + 0x26], 0
    mov word [edx + 0x8b0c5], di
    mov word [edx + 0x8b0bd], di
    mov bx, word [esi + 0x2522c2]
    mov word [edx + 0x8b0b9], bx
    xor ebx, ebx
    xor esi, esi
    mov dword [edx + 0x8b0d3], ebx
    xor esi, ebx
    mov dword [edx + 0x8b0d7], ebx
    mov ebx, dword [esp + 0x30]
    mov word [edx + 0x8b0bf], bx
    xor bl, bl
    mov byte [edx + 0x8b0b8], bl
    xor bh, bh
    xor edi, edi
    mov word [edx + 0x8b0c7], bx
    lea ebx, [ecx*8]
    mov word [edx + 0x8b0c3], di
    add ebx, ecx
    mov word [edx + 0x8b0c9], si
    lea ebx, [ebx*8]
    xor esi, esi
    sub ebx, ecx
    mov word [edx + 0x8b0c1], si
    mov ecx, dword [ebx + 0x8b0cb]
    mov dword [edx + 0x8b0cb], ecx
    mov ebx, dword [ebx + 0x8b0cf]
    xor edi, edi
    mov dword [edx + 0x8b0cf], ebx
    mov dword [edx + 0x8b0fb], edi
    movsx ebx, word [esp + 0x14]
    mov dword [edx + 0x8b0f3], edi
    lea ebx, [ebx*4]
    mov dword [edx + 0x8b0ef], edi
    mov ebp, dword [ebx + 0xea3f8]
    mov dword [edx + 0x8b0e7], edi
    test ebp, ebp
    je short loc_02b6
    mov cx, word [ebp]
    mov word [eax + 0x2a], cx
    mov ebx, dword [ebx + 0xea3f8]
    mov ecx, dword [ebx + 4]
    mov dword [edx + 0x8b0f7], ecx
    mov ecx, dword [ebx + 8]
    mov dword [edx + 0x8b0eb], ecx
    mov dx, word [ebx + 0xc]
    mov word [eax + 0x28], dx
    jmp short loc_02ca
loc_02b6:
    mov dword [edx + 0x8b0f7], edi
    mov dword [edx + 0x8b0eb], edi
    mov word [eax + 0x2a], si
    mov word [eax + 0x28], si
loc_02ca:
    movsx eax, word [esp]
    imul edx, eax, 0x2c
    movsx esi, word [edx + 0x2522cc]
    mov dx, word [edx + 0x2522cc]
    xor dh, dh
    mov ebx, 1
    and dl, 7
    sar eax, 3
    movsx ecx, dx
    sar esi, 3
    shl ebx, cl
    mov cl, byte [esp]
    mov dl, 1
    and cl, 7
    movzx esi, byte [esi + 0x232eb4]
    shl dl, cl
    test esi, ebx
    je short loc_0311
    or byte [eax + 0x248eb4], dl
    jmp short loc_0319
loc_0311:
    not dl
    and byte [eax + 0x248eb4], dl
loc_0319:
    mov eax, dword [esp]
    add esp, 4
    pop ebp
    pop edi
    pop esi
    ret 0x24
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
    cwde
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x2522c2]
    cmp ax, 0x2c8
    jb short loc_039d
    cmp ax, 0x2c9
    jbe near loc_03ca
    cmp ax, 0x462
    jb short loc_0382
    cmp ax, 0x463
    jbe near loc_03ca
    cmp ax, 0x476
    jb near loc_03cd
    cmp ax, 0x477
    jbe near loc_03ca
    cmp ax, 0x483
    jb near loc_03cd
    cmp ax, 0x484
    jbe short loc_03ca
    xor al, al
    ret
loc_0382:
    cmp ax, 0x35c
    jb short loc_03cd
    cmp ax, 0x361
    jbe short loc_03ca
    cmp ax, 0x457
    jb short loc_03cd
    cmp ax, 0x458
    jbe short loc_03ca
    xor al, al
    ret
loc_039d:
    cmp ax, 0x84
    jb short loc_03c4
    cmp ax, 0x8d
    jbe short loc_03ca
    cmp ax, 0x92
    jb short loc_03cd
    cmp ax, 0x95
    jbe short loc_03ca
    cmp ax, 0xa2
    jb short loc_03cd
    cmp ax, 0xaa
    jbe short loc_03ca
    xor al, al
    ret
loc_03c4:
    cmp ax, 0x82
    jne short loc_03cd
loc_03ca:
    mov al, 1
    ret
loc_03cd:
    xor al, al
    ret
%else
    push ebx
    push ecx
    mov ecx, eax
    mov ax, word [0x2454d0]
loc_000a:
    test ax, ax
    jl short loc_0040
    movsx ebx, dx
    cmp ebx, -1
    je short loc_0026
    movsx ebx, ax
    imul ebx, ebx, 0x2c
    cmp dx, word [ebx + 0x1c0bbc]
    jne short loc_0035
loc_0026:
    movsx ebx, ax
    imul ebx, ebx, 0x2c
    cmp cx, word [ebx + 0x1c0bca]
    je short loc_0045
loc_0035:
    cwde
    db 0x66, 0x8b, 0x04, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov ax, word [eax*2 + 0x1af7a4]
    jmp short loc_000a
loc_0040:
    mov eax, 0xffffffff
loc_0045:
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov esi, edx
    movsx edx, byte [esp + 0x34]
    cwde
    call 0x6a9e8
    mov word [esp], ax
    test ax, ax
    jge short loc_0076
    mov eax, 0x2a8
    call 0x16030
loc_0076:
    movsx edi, word [esp]
    lea eax, [edi*8]
    add eax, edi
    lea eax, [eax*8]
    sub eax, edi
    mov dword [eax + 0x4e9fb], esi
    mov dword [eax + 0x4e9ff], ebx
    mov dword [eax + 0x4ea03], ecx
    imul eax, edi, 0x2c
    add eax, 0x1c0ba4
    mov word [eax + 0xc], 0
    mov byte [eax + 0x11], 0
    mov dword [eax], esi
    mov edx, dword [esp + 0x14]
    mov dword [eax + 4], ebx
    mov word [eax + 0xe], dx
    mov dl, byte [esp + 0x18]
    mov byte [eax + 0x10], dl
    mov dl, byte [esp + 0x1c]
    mov byte [eax + 0x14], dl
    mov dl, byte [esp + 0x20]
    mov byte [eax + 0x15], dl
    mov dx, word [eax + 0xe]
    mov dword [eax + 8], ecx
    cmp dx, 0x11
    jne short loc_00ed
    mov word [eax + 0x2a], 0x28
    mov byte [eax + 0x14], 0x1e
    mov byte [eax + 0x15], 0x1e
loc_00ed:
    mov byte [eax + 0x16], 0
    mov edx, dword [esp + 0x24]
    mov byte [eax + 0x17], 0
    mov word [eax + 0x1c], dx
    mov edx, dword [esp + 0x28]
    mov word [eax + 0x20], dx
    mov edx, dword [esp + 0x2c]
    mov word [eax + 0x24], dx
    mov edx, dword [esp + 0x30]
    mov bx, word [eax + 0xe]
    mov word [eax + 0x1e], dx
    cmp bx, 0x214
    jne short loc_0128
    mov byte [eax + 0x14], 0x24
    mov byte [eax + 0x15], 0x2a
loc_0128:
    movsx ecx, word [esp + 0x30]
    imul esi, ecx, 0x2c
    movsx ebx, word [esp]
    lea edx, [ebx*8]
    mov word [eax + 0x22], 0
    add edx, ebx
    mov byte [eax + 0x12], 0
    lea edx, [edx*8]
    mov byte [eax + 0x11], 0
    sub edx, ebx
    mov edi, 0xffffffff
    mov word [eax + 0x26], 0
    mov word [edx + 0x4e9e5], di
    mov word [edx + 0x4e9dd], di
    mov bx, word [esi + 0x1c0bb2]
    mov word [edx + 0x4e9d9], bx
    xor ebx, ebx
    xor esi, esi
    mov dword [edx + 0x4e9f3], ebx
    xor esi, ebx
    mov dword [edx + 0x4e9f7], ebx
    mov ebx, dword [esp + 0x30]
    mov word [edx + 0x4e9df], bx
    xor bl, bl
    mov byte [edx + 0x4e9d8], bl
    xor bh, bh
    xor edi, edi
    mov word [edx + 0x4e9e7], bx
    lea ebx, [ecx*8]
    mov word [edx + 0x4e9e3], di
    add ebx, ecx
    mov word [edx + 0x4e9e9], si
    lea ebx, [ebx*8]
    xor esi, esi
    sub ebx, ecx
    mov word [edx + 0x4e9e1], si
    mov ecx, dword [ebx + 0x4e9eb]
    mov dword [edx + 0x4e9eb], ecx
    mov ebx, dword [ebx + 0x4e9ef]
    xor edi, edi
    mov dword [edx + 0x4e9ef], ebx
    mov dword [edx + 0x4ea1b], edi
    movsx ebx, word [esp + 0x14]
    mov dword [edx + 0x4ea13], edi
    lea ebx, [ebx*4]
    mov dword [edx + 0x4ea0f], edi
    mov ebp, dword [ebx + 0xab198]
    mov dword [edx + 0x4ea07], edi
    test ebp, ebp
    je short loc_0246
    mov cx, word [ebp]
    mov word [eax + 0x2a], cx
    mov ebx, dword [ebx + 0xab198]
    mov ecx, dword [ebx + 4]
    mov dword [edx + 0x4ea17], ecx
    mov ecx, dword [ebx + 8]
    mov dword [edx + 0x4ea0b], ecx
    mov dx, word [ebx + 0xc]
    mov word [eax + 0x28], dx
    jmp short loc_025a
loc_0246:
    mov dword [edx + 0x4ea17], edi
    mov dword [edx + 0x4ea0b], edi
    mov word [eax + 0x2a], si
    mov word [eax + 0x28], si
loc_025a:
    movsx eax, word [esp]
    imul edx, eax, 0x2c
    movsx esi, word [edx + 0x1c0bbc]
    mov dx, word [edx + 0x1c0bbc]
    xor dh, dh
    mov ebx, 1
    and dl, 7
    sar eax, 3
    movsx ecx, dx
    sar esi, 3
    shl ebx, cl
    mov cl, byte [esp]
    mov dl, 1
    and cl, 7
    movzx esi, byte [esi + 0x1a17a4]
    shl dl, cl
    test esi, ebx
    je short loc_02a1
    or byte [eax + 0x1b77a4], dl
    jmp short loc_02a9
loc_02a1:
    not dl
    and byte [eax + 0x1b77a4], dl
loc_02a9:
    mov eax, dword [esp]
    add esp, 4
    pop ebp
    pop edi
    pop esi
    ret 0x24
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
    cwde
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x1c0bb2]
    cmp ax, 0x2c8
    jb short loc_032d
    cmp ax, 0x2c9
    jbe near loc_035a
    cmp ax, 0x462
    jb short loc_0312
    cmp ax, 0x463
    jbe near loc_035a
    cmp ax, 0x476
    jb near loc_035d
    cmp ax, 0x477
    jbe near loc_035a
    cmp ax, 0x483
    jb near loc_035d
    cmp ax, 0x484
    jbe short loc_035a
    xor al, al
    ret
loc_0312:
    cmp ax, 0x35c
    jb short loc_035d
    cmp ax, 0x361
    jbe short loc_035a
    cmp ax, 0x457
    jb short loc_035d
    cmp ax, 0x458
    jbe short loc_035a
    xor al, al
    ret
loc_032d:
    cmp ax, 0x84
    jb short loc_0354
    cmp ax, 0x8d
    jbe short loc_035a
    cmp ax, 0x92
    jb short loc_035d
    cmp ax, 0x95
    jbe short loc_035a
    cmp ax, 0xa2
    jb short loc_035d
    cmp ax, 0xaa
    jbe short loc_035a
    xor al, al
    ret
loc_0354:
    cmp ax, 0x82
    jne short loc_035d
loc_035a:
    mov al, 1
    ret
loc_035d:
    xor al, al
    ret
%endif
