; Update player-associated sprite and sound effects.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edi, 0xf1720
    add eax, eax
    mov edx, dword [0x8008]
    add edi, eax
    cmp edx, 5
    jg short loc_003b
    lea eax, [edx + 1]
    mov dword [0x8008], eax
    jmp short loc_005f
loc_003b:
    xor ebx, ebx
    mov ecx, dword [0x800c]
    mov dword [0x8008], ebx
    test ecx, ecx
    je short loc_0055
    mov dword [0x800c], ebx
    jmp short loc_005f
loc_0055:
    mov dword [0x800c], 1
loc_005f:
    cmp dword [0x2dfd8], 0
    jne short loc_0075
    cmp dword [0x8000], 0
    jne near loc_0481
loc_0075:
    cmp word [0x2f2924], 1
    jg near loc_0481
    cmp dword [0x8004], 0
    je short loc_0091
    call 0x16820
loc_0091:
    xor esi, esi
    jmp near loc_045c
loc_0098:
    movsx eax, si
    imul ebp, eax, 0x2c
    push -2
    mov edx, dword [0x7ff4]
    xor ecx, ecx
    push 4
    movsx ebx, word [eax*4 + 0x2e458]
    mov eax, dword [0x7ff0]
    call 0x13050
    cmp dword [ebp + 0x2e670], 0
    je near loc_01bc
    mov edx, 1
    mov ebx, dword [0x800c]
    mov dword [ebp + 0x2e64c], edx
    test ebx, ebx
    jne short loc_00e7
    push -2
    mov ebx, 0xb
    jmp short loc_00ee
loc_00e7:
    push -2
    mov ebx, 0xc
loc_00ee:
    mov edx, dword [0x7ff4]
    push 4
    mov eax, dword [0x7ff0]
    xor ecx, ecx
    call 0x13050
    mov edx, dword [0x7ff4]
    mov eax, dword [0x7ff0]
    movsx ebx, si
    xor ecx, ecx
    inc ebx
    add edx, 0xf
    call 0x3e190
    mov ecx, dword [0x7ff0]
    add ecx, 0x1e
    mov eax, dword [0x2e7bc]
    mov dword [0x7ff0], ecx
    sub eax, 0x96
    mov ebp, dword [edi + 0x214]
    cmp eax, ebp
    jg near loc_01bc
    mov eax, dword [0x2e7bc]
    add eax, 0x96
    cmp eax, ebp
    jl short loc_01bc
    mov eax, dword [0x2e7c0]
    mov ebx, dword [edi + 0x218]
    sub eax, 0x96
    cmp eax, ebx
    jg short loc_01bc
    mov eax, dword [0x2e7c0]
    add eax, 0x96
    cmp eax, ebx
    jl short loc_01bc
    mov eax, dword [0x7c1c]
    mov ebp, dword [0x7c18]
    add eax, 0x258
    add ebp, 0x3e8
    mov dword [0x7c1c], eax
    mov eax, 0x1f3
    mov dword [0x7c18], ebp
    call 0x3c5f0
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x01    ; mov byte [eax*2 + 0xf1ac2], 1
loc_01bc:
    movsx eax, si
    imul eax, eax, 0x2c
    mov eax, dword [eax + 0x2e658]
    cmp eax, 0x93c
    jb short loc_01ff
    jbe short loc_0224
    cmp eax, 0xb3c
    jb short loc_01f3
    jbe short loc_0224
    cmp eax, 0xc3c
    jb near loc_0345
    jbe short loc_0224
    cmp eax, 0xd3c
    je short loc_0224
    jmp near loc_0345
loc_01f3:
    cmp eax, 0xa3c
    je short loc_0224
    jmp near loc_0345
loc_01ff:
    cmp eax, 0x23c
    jb short loc_0214
    jbe short loc_0224
    cmp eax, 0x33c
    je short loc_0224
    jmp near loc_0345
loc_0214:
    cmp eax, 0x214
    je near loc_0367
    jmp near loc_0345
loc_0224:
    movsx eax, si
    imul ebp, eax, 0x2c
    mov edx, dword [0x8010]
    add edx, 0xa
    mov ebx, dword [ebp + 0x2e64c]
    mov dword [0x8010], edx
    test ebx, ebx
    je short loc_025d
    mov edx, dword [0x7ff4]
    lea ebx, [eax + 1]
    xor ecx, ecx
    mov eax, dword [0x7ff0]
    add edx, 0xf
    call 0x3e190
    jmp short loc_0283
loc_025d:
    push 2
    mov ebx, 0x27b
    mov edx, dword [0x7ff4]
    push 4
    mov eax, dword [0x7ff0]
    xor ecx, ecx
    call 0x13050
    mov eax, dword [ebp + 0x2e650]
    call 0x67ff5
loc_0283:
    movsx eax, si
    imul eax, eax, 0x2c
    mov ecx, dword [0x7ff0]
    add ecx, 0x1e
    mov edx, dword [eax + 0x2e648]
    mov dword [0x7ff0], ecx
    mov byte [edx + 0x11], 0
    mov edx, dword [0x2e7bc]
    mov eax, dword [eax + 0x2e648]
    sub edx, 0x15e
    mov ebp, dword [eax]
    cmp edx, ebp
    jg near loc_0367
    mov edx, dword [0x2e7bc]
    add edx, 0x15e
    cmp edx, ebp
    jl near loc_0367
    mov edx, dword [0x2e7c0]
    mov ecx, dword [eax + 4]
    sub edx, 0x15e
    cmp edx, ecx
    jg near loc_0367
    mov edx, dword [0x2e7c0]
    add edx, 0x15e
    cmp edx, ecx
    jl short loc_0367
    mov eax, dword [0x7c18]
    mov edx, dword [0x7c1c]
    add eax, 0x3e8
    add edx, 0x258
    mov dword [0x7c18], eax
    mov eax, 0x1f3
    mov dword [0x7c1c], edx
    call 0x3c5f0
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x01    ; mov byte [eax*2 + 0xf1ac2], 1
    jmp short loc_0367
loc_0345:
    push 2
    mov ebx, 0x27b
    mov edx, dword [0x7ff4]
    push 4
    mov eax, dword [0x7ff0]
    xor ecx, ecx
    call 0x13050
    add dword [0x7ff0], 0x1e
loc_0367:
    movsx eax, si
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x2e4f0]
    cwde
    imul eax, eax, 0x2c
    add eax, 0x2522b4
    mov ax, word [eax + 0xe]
    cmp ax, 0xa3a
    jb short loc_03a7
    jbe short loc_03c4
    cmp ax, 0xc3a
    jb short loc_039c
    jbe short loc_03c4
    cmp ax, 0xd3a
    je short loc_03c4
    jmp near loc_045b
loc_039c:
    cmp ax, 0xb3a
    je short loc_03c4
    jmp near loc_045b
loc_03a7:
    cmp ax, 0x33a
    jb short loc_03ba
    jbe short loc_03c4
    cmp ax, 0x93a
    je short loc_03c4
    jmp near loc_045b
loc_03ba:
    cmp ax, 0x23a
    jne near loc_045b
loc_03c4:
    movsx eax, si
    imul eax, eax, 0x2c
    mov edx, dword [eax + 0x2e4e8]
    mov byte [edx + 0x11], 2
    mov edx, dword [0x2e7b8]
    mov eax, dword [eax + 0x2e4e8]
    sub edx, 0x15e
    mov ecx, dword [eax]
    cmp edx, ecx
    jg short loc_045b
    mov edx, dword [0x2e7b8]
    add edx, 0x15e
    cmp edx, ecx
    jl short loc_045b
    mov edx, dword [0x2e7b4]
    mov ebx, dword [eax + 4]
    sub edx, 0x15e
    cmp edx, ebx
    jg short loc_045b
    mov edx, dword [0x2e7b4]
    add edx, 0x15e
    cmp edx, ebx
    jl short loc_045b
    mov eax, 0x1f2
    call 0x3c5f0
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    mov ebp, dword [0x7c20]
    lea eax, [eax*4]
    add ebp, 0x258
    sub eax, edx
    mov bl, 1
    mov dword [0x7c20], ebp
    db 0x88, 0x1c, 0x45, 0xc2, 0x1a, 0x0f, 0x00    ; mov byte [eax*2 + 0xf1ac2], bl
loc_045b:
    inc esi
loc_045c:
    cmp si, 8
    jl near loc_0098
    mov esi, 0x32
    mov edi, 0x50
    mov dword [0x7ff0], esi
    mov dword [0x8010], edi
    call 0x16f90
loc_0481:
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
%else
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edi, 0xb4f00
    add eax, eax
    mov edx, dword [0x21f38]
    add edi, eax
    test edx, edx
    jne short loc_003d
    cmp dword [0x7fd8], 0
    jne near loc_03e7
loc_003d:
    cmp dword [0x7fdc], 0
    je short loc_004b
    call 0x16840
loc_004b:
    xor esi, esi
    jmp near loc_03ce
loc_0052:
    movsx ebp, si
    shl ebp, 4
    mov ax, word [ebp + 0x224b0]
    cwde
    imul eax, eax, 0x2c
    mov edx, 0x1c0ba4
    add edx, eax
    mov ax, word [edx + 0xe]
    cmp ax, 0x93c
    jb short loc_00b4
    jbe near loc_01ba
    cmp ax, 0xb3c
    jb short loc_00a5
    jbe near loc_01ba
    cmp ax, 0xc3c
    jb near loc_030c
    jbe near loc_01ba
    cmp ax, 0xd3c
    je near loc_01ba
    jmp near loc_030c
loc_00a5:
    cmp ax, 0xa3c
    je near loc_01ba
    jmp near loc_030c
loc_00b4:
    cmp ax, 0x23c
    jb short loc_00cf
    jbe near loc_01ba
    cmp ax, 0x33c
    je near loc_01ba
    jmp near loc_030c
loc_00cf:
    cmp ax, 0x214
    jne near loc_030c
    push -2
    mov ebx, 0x21
    mov edx, dword [0x7fcc]
    push 4
    mov eax, dword [0x7fc8]
    xor ecx, ecx
    call 0x13070
    cmp dword [ebp + 0x224ac], 0
    jne short loc_0118
    push 2
    mov ebx, 0x27b
    mov edx, dword [0x7fcc]
    push 4
    mov eax, dword [0x7fc8]
    xor ecx, ecx
    call 0x13070
loc_0118:
    mov edx, dword [0x7fcc]
    mov eax, dword [0x7fc8]
    movsx ebx, si
    xor ecx, ecx
    inc ebx
    add edx, 0xf
    call 0x40e60
    mov ebx, dword [0x7fc8]
    add ebx, 0x1e
    mov eax, dword [0x2253c]
    mov dword [0x7fc8], ebx
    sub eax, 0x64
    mov ecx, dword [edi + 0x214]
    cmp eax, ecx
    jg near loc_030c
    mov eax, dword [0x2253c]
    add eax, 0x64
    cmp eax, ecx
    jl near loc_030c
    mov eax, dword [0x22540]
    mov edx, dword [edi + 0x218]
    sub eax, 0x64
    cmp eax, edx
    jg near loc_030c
    mov eax, dword [0x22540]
    add eax, 0x64
    cmp eax, edx
    jl near loc_030c
    mov eax, 0x1b0
    mov ecx, dword [0x7bf4]
    mov ebp, dword [0x7bf8]
    add ecx, 0x3e8
    add ebp, 0x258
    mov dword [0x7bf4], ecx
    mov dword [0x7bf8], ebp
    jmp near loc_0307
loc_01ba:
    mov bx, word [edx + 0xe]
    cmp bx, 0x23c
    jne short loc_01d1
    push -2
    mov ebx, 0x21
    jmp near loc_022f
loc_01d1:
    cmp bx, 0x33c
    jne short loc_01e1
    push -2
    mov ebx, 0x20
    jmp short loc_022f
loc_01e1:
    cmp bx, 0x93c
    jne short loc_01f1
    push -2
    mov ebx, 0x20
    jmp short loc_022f
loc_01f1:
    cmp bx, 0xa3c
    jne short loc_0201
    push -2
    mov ebx, 0x1e
    jmp short loc_022f
loc_0201:
    cmp bx, 0xb3c
    jne short loc_0211
    push -2
    mov ebx, 0x22
    jmp short loc_022f
loc_0211:
    cmp bx, 0xc3c
    jne short loc_0221
    push -2
    mov ebx, 0x22
    jmp short loc_022f
loc_0221:
    cmp bx, 0xd3c
    jne short loc_0243
    push -2
    mov ebx, 0x1f
loc_022f:
    mov edx, dword [0x7fcc]
    push 4
    mov eax, dword [0x7fc8]
    xor ecx, ecx
    call 0x13070
loc_0243:
    movsx eax, si
    shl eax, 4
    cmp dword [eax + 0x224ac], 0
    jne short loc_026d
    push 2
    mov ebx, 0x27b
    mov edx, dword [0x7fcc]
    push 4
    mov eax, dword [0x7fc8]
    xor ecx, ecx
    call 0x13070
loc_026d:
    mov edx, dword [0x7fcc]
    mov eax, dword [0x7fc8]
    movsx ebp, si
    xor ecx, ecx
    lea ebx, [ebp + 1]
    add edx, 0xf
    call 0x40e60
    mov edx, ebp
    mov ebx, dword [0x7fc8]
    shl edx, 4
    add ebx, 0x1e
    mov eax, dword [edx + 0x224a8]
    mov dword [0x7fc8], ebx
    mov byte [eax + 0x11], 0
    mov eax, dword [0x2253c]
    mov edx, dword [edx + 0x224a8]
    sub eax, 0x64
    mov ecx, dword [edx]
    cmp eax, ecx
    jg short loc_030c
    mov eax, dword [0x2253c]
    add eax, 0x64
    cmp eax, ecx
    jl short loc_030c
    mov eax, dword [0x22540]
    mov ebx, dword [edx + 4]
    sub eax, 0x64
    cmp eax, ebx
    jg short loc_030c
    mov eax, dword [0x22540]
    add eax, 0x64
    cmp eax, ebx
    jl short loc_030c
    mov eax, dword [0x7bf8]
    mov ebp, dword [0x7bf4]
    add eax, 0x258
    add ebp, 0x3e8
    mov dword [0x7bf8], eax
    mov eax, 0x1b0
    mov dword [0x7bf4], ebp
loc_0307:
    call 0x16030
loc_030c:
    movsx eax, si
    shl eax, 4
    mov ax, word [eax + 0x22430]
    cwde
    imul eax, eax, 0x2c
    mov edx, 0x1c0ba4
    mov ax, word [edx + eax + 0xe]
    cmp ax, 0xa3a
    jb short loc_034d
    jbe short loc_0366
    cmp ax, 0xc3a
    jb short loc_0342
    jbe short loc_0366
    cmp ax, 0xd3a
    je short loc_0366
    jmp near loc_03cd
loc_0342:
    cmp ax, 0xb3a
    je short loc_0366
    jmp near loc_03cd
loc_034d:
    cmp ax, 0x33a
    jb short loc_0360
    jbe short loc_0366
    cmp ax, 0x93a
    je short loc_0366
    jmp near loc_03cd
loc_0360:
    cmp ax, 0x23a
    jne short loc_03cd
loc_0366:
    movsx edx, si
    shl edx, 4
    mov eax, dword [edx + 0x22428]
    mov byte [eax + 0x11], 2
    mov eax, dword [0x22538]
    mov edx, dword [edx + 0x22428]
    sub eax, 0x64
    mov ebx, dword [edx]
    cmp eax, ebx
    jg short loc_03cd
    mov eax, dword [0x22538]
    add eax, 0x64
    cmp eax, ebx
    jg short loc_03cd
    mov eax, dword [0x22534]
    mov ebp, dword [edx + 4]
    sub eax, 0x64
    cmp eax, ebp
    jg short loc_03cd
    mov eax, dword [0x22534]
    add eax, 0x64
    cmp eax, ebp
    jg short loc_03cd
    mov ecx, dword [0x7bfc]
    add ecx, 0x258
    mov eax, 0x1b0
    mov dword [0x7bfc], ecx
    call 0x16030
loc_03cd:
    inc esi
loc_03ce:
    cmp si, 8
    jl near loc_0052
    mov dword [0x7fc8], 0x32
    call 0x16de0
loc_03e7:
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
%endif
