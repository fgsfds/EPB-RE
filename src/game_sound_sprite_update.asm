; Track and update active sound slots.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    push edx
    xor eax, eax
loc_0003:
    imul edx, eax, 0x2c
    cmp dword [edx + 0x2e64c], 0
    je short loc_0018
    cmp dword [edx + 0x2e670], 0
    je short loc_0023
loc_0018:
    inc eax
    cmp eax, 8
    jl short loc_0003
    mov eax, 0xffffffff
loc_0023:
    pop edx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
loc_0030:
    push edx
    mov edx, 0xffffffff
    xor eax, eax
loc_0038:
    inc eax
    mov dword [eax*4 + 0x26fd4], edx
    mov dword [eax*4 + 0x1efd4], edx
    mov dword [eax*4 + 0x16cd4], edx
    cmp eax, 0x1000
    jl short loc_0038
    pop edx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    call loc_0030
    xor ecx, ecx
    jmp near loc_0658
loc_0072:
    imul eax, ecx, 0x2c
    add eax, 0x2522b4
    mov dx, word [eax + 0xe]
    mov ebx, ecx
    cmp dx, 0x23c
    jb short loc_00a6
    jbe near loc_024c
    cmp dx, 0xea0
    jb near loc_064b
    jbe short loc_00e1
    cmp dx, 0xea3
    je short loc_00c3
    jmp near loc_064b
loc_00a6:
    cmp dx, 0x214
    jb near loc_064b
    jbe short loc_00ff
    cmp dx, 0x23a
    je near loc_04bc
    jmp near loc_064b
loc_00c3:
    mov edx, dword [eax]
    mov dword [0x2e7b8], edx
    mov edx, dword [eax + 4]
    mov dword [0x2e7b4], edx
    mov eax, dword [eax + 8]
    mov dword [0x2e7c4], eax
    jmp near loc_064b
loc_00e1:
    mov edx, dword [eax]
    mov dword [0x2e7bc], edx
    mov edx, dword [eax + 4]
    mov dword [0x2e7c0], edx
    mov eax, dword [eax + 8]
    mov dword [0x2e7b0], eax
    jmp near loc_064b
loc_00ff:
    cmp word [0x2f2924], 2
    jl short loc_0114
    mov word [eax + 0xc], 0xa
    jmp near loc_064b
loc_0114:
    mov dword [0x2e780], 1
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0x2e77c]
    db 0x8b, 0x04, 0x45, 0x34, 0x19, 0x0f, 0x00    ; mov eax, dword [eax*2 + 0xf1934]
    mov dword [edx], eax
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [0x2e77c]
    mov edx, dword [edx + 0xf1938]
    mov dword [eax + 4], edx
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [0x2e77c]
    mov edx, dword [edx + 0xf193c]
    mov dword [eax + 8], edx
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0x2e77c]
    db 0x66, 0x8b, 0x04, 0x45, 0xb8, 0x19, 0x0f, 0x00    ; mov ax, word [eax*2 + 0xf19b8]
    mov esi, 0x214
    mov word [edx + 0x1c], ax
    mov dword [0x2e78c], esi
    mov edx, dword [0x2e77c]
    mov ax, word [0x2e78c]
    mov word [edx + 0xe], ax
    movsx eax, cx
    movsx edx, word [0x2f2926]
    mov dword [0x2e784], eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc7, 0x04, 0x45, 0xb0, 0x19, 0x0f, 0x00, 0x07, 0x00, 0x00, 0x00    ; mov dword [eax*2 + 0xf19b0], 7
    mov eax, dword [0x2e210]
    movsx edx, word [0x2f2926]
    mov dword [0x2e788], eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov si, word [0x2e788]
    mov edi, 1
    db 0x66, 0x89, 0x34, 0x45, 0x32, 0x1a, 0x0f, 0x00    ; mov word [eax*2 + 0xf1a32], si
    mov eax, 0x21
    mov dword [0x2e7a4], edi
    mov dword [0x2e474], eax
    jmp near loc_064b
loc_024c:
    cmp dword [0x7ff8], 7
    je near loc_049d
    cmp dword [0x2dfd8], 0
    je near loc_042e
    mov byte [eax + 0x14], 0xf
    mov byte [eax + 0x15], 0xf
    mov esi, dword [0x7ff8]
    lea edx, [esi*8]
    add edx, esi
    lea edx, [edx*8]
    sub edx, esi
    imul esi, esi, 0x2c
    cmp dword [edx + 0x2e00f], 1
    jne near loc_0367
    cmp byte [edx + 0x2dfdc], 0x41
    jb short loc_02d5
    cmp byte [edx + 0x2dfdc], 0x46
    ja short loc_02d5
    mov edi, 0xa3c
    mov dword [esi + 0x2e658], edi
    mov word [eax + 0xe], di
    mov edx, dword [0x7ff8]
    mov dword [edx*4 + 0x2e458], 0x20
    mov byte [eax + 0x14], 0x14
    mov byte [eax + 0x15], 0x14
    jmp near loc_042e
loc_02d5:
    mov esi, dword [0x7ff8]
    lea edx, [esi*8]
    add edx, esi
    lea edx, [edx*8]
    sub edx, esi
    cmp byte [edx + 0x2dfdc], 0x47
    jb short loc_0331
    cmp byte [edx + 0x2dfdc], 0x50
    ja short loc_0331
    imul edx, esi, 0x2c
    mov ebp, 0xb3c
    mov dword [edx + 0x2e658], ebp
    mov edx, ebp
    mov word [eax + 0xe], dx
    mov edx, dword [0x7ff8]
    mov dword [edx*4 + 0x2e458], 0x1e
    mov byte [eax + 0x14], 0x14
    mov byte [eax + 0x15], 0x14
    jmp near loc_042e
loc_0331:
    imul edx, dword [0x7ff8], 0x2c
    mov ebp, 0xd3c
    mov dword [edx + 0x2e658], ebp
    mov edx, ebp
    mov word [eax + 0xe], dx
    mov edx, dword [0x7ff8]
    mov dword [edx*4 + 0x2e458], 0x1f
    mov byte [eax + 0x14], 0x14
    mov byte [eax + 0x15], 0x14
    jmp near loc_042e
loc_0367:
    cmp byte [edx + 0x2dfdc], 0x41
    jb short loc_03a8
    cmp byte [edx + 0x2dfdc], 0x45
    ja short loc_03a8
    mov ebp, 0xd3c
    mov edx, ebp
    mov dword [esi + 0x2e658], ebp
    mov word [eax + 0xe], dx
    mov edx, dword [0x7ff8]
    mov dword [edx*4 + 0x2e458], 0x1f
    mov byte [eax + 0x14], 0x14
    mov byte [eax + 0x15], 0x14
    jmp near loc_042e
loc_03a8:
    mov esi, dword [0x7ff8]
    lea edx, [esi*8]
    add edx, esi
    lea edx, [edx*8]
    sub edx, esi
    cmp byte [edx + 0x2dfdc], 0x46
    jb short loc_03ff
    cmp byte [edx + 0x2dfdc], 0x50
    ja short loc_03ff
    imul edx, esi, 0x2c
    mov esi, 0x93c
    mov dword [edx + 0x2e658], esi
    mov word [eax + 0xe], si
    mov edx, dword [0x7ff8]
    mov dword [edx*4 + 0x2e458], 0x20
    mov byte [eax + 0x14], 0x14
    mov byte [eax + 0x15], 0x14
    jmp short loc_042e
loc_03ff:
    imul edx, dword [0x7ff8], 0x2c
    mov esi, 0x23c
    mov dword [edx + 0x2e658], esi
    mov word [eax + 0xe], si
    mov edx, dword [0x7ff8]
    mov dword [edx*4 + 0x2e458], 0x21
    mov byte [eax + 0x14], 0xf
    mov byte [eax + 0x15], 0xf
loc_042e:
    mov esi, dword [0x7ff8]
    imul edx, esi, 0x2c
    mov ebp, 1
    xor edi, edi
    mov dword [edx + 0x2e648], eax
    lea eax, [esi*8]
    mov dword [edx + 0x2e670], edi
    add eax, esi
    mov dword [edx + 0x2e64c], ebp
    lea eax, [eax*8]
    movsx edi, bx
    sub eax, esi
    mov dword [edx + 0x2e650], edi
    mov eax, dword [eax + 0x2e01f]
    mov dword [edx + 0x2e654], eax
    lea edx, [esi + ebp]
    mov eax, 0xffffffff
    mov dword [0x7ff8], edx
    mov dword [edi*4 + 0x26fd8], eax
    movsx eax, bx
    xor esi, esi
    mov dword [eax*4 + 0x1acd8], esi
    jmp near loc_064b
loc_049d:
    movsx eax, cx
    call 0x67ff5
    inc dword [0x8000]
    movsx eax, bx
    xor esi, esi
    mov dword [eax*4 + 0x1acd8], esi
    jmp near loc_064b
loc_04bc:
    cmp word [0x2f2924], 2
    jl short loc_04d3
    movsx eax, cx
    call 0x67ff5
    jmp near loc_064b
loc_04d3:
    cmp dword [0x2dfd8], 0
    jne short loc_04ef
    movsx eax, cx
    call 0x67ff5
    inc dword [0x8000]
    jmp near loc_064b
loc_04ef:
    mov esi, dword [0x7ffc]
    lea edx, [esi*8]
    add edx, esi
    lea edx, [edx*8]
    sub edx, esi
    cmp dword [edx + 0x2e247], 1
    jne short loc_0572
    cmp byte [edx + 0x2e214], 0x41
    jb short loc_0535
    cmp byte [edx + 0x2e214], 0x46
    ja short loc_0535
loc_0522:
    mov word [eax + 0xe], 0xd3a
    mov byte [eax + 0x14], 0x14
    mov byte [eax + 0x15], 0x14
    jmp near loc_05dc
loc_0535:
    mov esi, dword [0x7ffc]
    lea edx, [esi*8]
    add edx, esi
    lea edx, [edx*8]
    sub edx, esi
    cmp byte [edx + 0x2e214], 0x47
    jb short loc_0522
    cmp byte [edx + 0x2e214], 0x50
    ja short loc_0522
    mov word [eax + 0xe], 0xb3a
    mov byte [eax + 0x14], 0x14
    mov byte [eax + 0x15], 0x14
    jmp near loc_05dc
loc_0572:
    cmp byte [edx + 0x2e214], 0x41
    jb short loc_0594
    cmp byte [edx + 0x2e214], 0x45
    ja short loc_0594
    mov word [eax + 0xe], 0x93a
    mov byte [eax + 0x14], 0x14
    mov byte [eax + 0x15], 0x14
    jmp short loc_05dc
loc_0594:
    mov esi, dword [0x7ffc]
    lea edx, [esi*8]
    add edx, esi
    lea edx, [edx*8]
    sub edx, esi
    cmp byte [edx + 0x2e214], 0x46
    jb short loc_05ce
    cmp byte [edx + 0x2e214], 0x50
    ja short loc_05ce
    mov word [eax + 0xe], 0x93a
    mov byte [eax + 0x14], 0x14
    mov byte [eax + 0x15], 0x14
    jmp short loc_05dc
loc_05ce:
    mov word [eax + 0xe], 0x23a
    mov byte [eax + 0x14], 0xf
    mov byte [eax + 0x15], 0xf
loc_05dc:
    mov edx, dword [0x7ffc]
    imul esi, edx, 0x2c
    mov dword [esi + 0x2e4ec], 1
    mov edi, edx
    lea edx, [edx*8]
    add edx, edi
    movsx ebp, bx
    lea edx, [edx*8]
    mov dword [esi + 0x2e4e8], eax
    sub edx, edi
    mov dword [esi + 0x2e4f0], ebp
    mov edx, dword [edx + 0x2e257]
    inc edi
    mov dword [esi + 0x2e4f4], edx
    mov edx, 0xffffffff
    xor esi, esi
    mov dword [ebp*4 + 0x26fd8], edx
    mov dword [ebp*4 + 0x1acd8], esi
    mov ebp, dword [0x1261df]
    mov dword [0x7ffc], edi
    cmp ebp, 2
    jl short loc_064b
    mov word [eax + 0xe], 0x214
loc_064b:
    movsx eax, bx
    xor edx, edx
    inc ecx
    mov dword [eax*4 + 0x1acd8], edx
loc_0658:
    cmp ecx, 0x1000
    jl near loc_0072
    mov ecx, 0x1000
    mov eax, dword [0x7ff8]
    xor ebx, ebx
    xor edx, edx
    inc eax
    mov dword [0x7ff8], ebx
    mov dword [0x7c70], eax
    mov eax, dword [0x7ffc]
    mov dword [0x8004], ebx
    mov dword [0x7c74], eax
    mov eax, 0x1acd8
    mov dword [0x7ffc], ebx
    call 0x9fec7
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
%else
    push edx
    xor eax, eax
loc_0003:
    mov edx, eax
    shl edx, 4
    cmp dword [edx + 0x224ac], 0
    jne short loc_001c
    inc eax
    cmp eax, 8
    jl short loc_0003
    mov eax, 0xffffffff
loc_001c:
    pop edx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
loc_0020:
    push edx
    xor eax, eax
loc_0023:
    inc eax
    xor edx, edx
    mov dword [eax*4 + 0x1af34], edx
    mov dword [eax*4 + 0x16f34], edx
    cmp eax, 0x1000
    jl short loc_0023
    pop edx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    call loc_0020
    xor ebp, ebp
    jmp near loc_048d
loc_0052:
    db 0x66, 0x8b, 0x0c, 0x6d, 0xc2, 0x54, 0x24, 0x00    ; mov cx, word [ebp*2 + 0x2454c2]
loc_005a:
    test cx, cx
    jl near loc_048c
    movsx ebx, cx
    imul eax, ebx, 0x2c
    add eax, 0x1c0ba4
    mov dx, word [eax + 0xe]
    db 0x66, 0x8b, 0x3c, 0x5d, 0xa4, 0xf7, 0x1a, 0x00    ; mov di, word [ebx*2 + 0x1af7a4]
    cmp dx, 0x23c
    jb short loc_00a0
    jbe near loc_01d3
    cmp dx, 0xea0
    jb near loc_0485
    jbe short loc_00db
    cmp dx, 0xea3
    je short loc_00bd
    jmp near loc_0485
loc_00a0:
    cmp dx, 0x214
    jb near loc_0485
    jbe short loc_00fb
    cmp dx, 0x23a
    je near loc_033a
    jmp near loc_0485
loc_00bd:
    mov edx, dword [eax]
    mov dword [0x22538], edx
    mov edx, dword [eax + 4]
    mov dword [0x22534], edx
    mov eax, dword [eax + 8]
    mov dword [0x22544], eax
    jmp near loc_0485
loc_00db:
    mov edx, dword [eax]
    mov dword [0x2253c], edx
    mov edx, dword [eax + 4]
    mov dword [0x22540], edx
    mov eax, dword [eax + 8]
    mov dword [0x22530], eax
    mov ecx, edi
    jmp near loc_005a
loc_00fb:
    mov ecx, 1
    mov eax, dword [0x22518]
    mov dword [0x2251c], ecx
    mov word [eax + 0xe], 0x214
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [0x22518]
    mov edx, dword [edx + 0xb5114]
    mov dword [eax], edx
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0x22518]
    db 0x8b, 0x04, 0x45, 0x18, 0x51, 0x0b, 0x00    ; mov eax, dword [eax*2 + 0xb5118]
    mov dword [edx + 4], eax
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0x22518]
    db 0x66, 0x8b, 0x04, 0x45, 0x98, 0x51, 0x0b, 0x00    ; mov ax, word [eax*2 + 0xb5198]
    mov word [edx + 0x1c], ax
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0x22170]
    mov esi, 7
    mov dword [0x22524], edx
    db 0x89, 0x34, 0x45, 0x90, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb5190], esi
    mov dx, word [0x22524]
    mov dword [0x22520], ebx
    db 0x66, 0x89, 0x14, 0x45, 0x12, 0x52, 0x0b, 0x00    ; mov word [eax*2 + 0xb5212], dx
    mov ecx, edi
    jmp near loc_005a
loc_01d3:
    cmp dword [0x7fd0], 7
    je near loc_0485
    cmp dword [0x21f38], 0
    je near loc_0343
    mov byte [eax + 0x14], 0xf
    mov byte [eax + 0x15], 0xf
    mov ebx, dword [0x7fd0]
    lea edx, [ebx*8]
    add edx, ebx
    lea edx, [edx*8]
    sub edx, ebx
    cmp dword [edx + 0x21f6f], 1
    jne short loc_0271
    mov bl, byte [edx + 0x21f3c]
    cmp bl, 0x41
    jb short loc_0239
    cmp bl, 0x46
    ja short loc_0239
    mov word [eax + 0xe], 0xa3c
    mov byte [eax + 0x14], 0x14
    mov byte [eax + 0x15], 0x14
    jmp near loc_02d7
loc_0239:
    mov ebx, dword [0x7fd0]
    lea edx, [ebx*8]
    add edx, ebx
    lea edx, [edx*8]
    sub edx, ebx
    mov bl, byte [edx + 0x21f3c]
    cmp bl, 0x47
    jb short loc_0281
    cmp bl, 0x50
    ja short loc_0281
    mov word [eax + 0xe], 0xb3c
    mov byte [eax + 0x14], 0x14
    mov byte [eax + 0x15], 0x14
    jmp short loc_02d7
loc_0271:
    mov bl, byte [edx + 0x21f3c]
    cmp bl, 0x41
    jb short loc_0291
    cmp bl, 0x45
    ja short loc_0291
loc_0281:
    mov word [eax + 0xe], 0xd3c
    mov byte [eax + 0x14], 0x14
    mov byte [eax + 0x15], 0x14
    jmp short loc_02d7
loc_0291:
    mov ebx, dword [0x7fd0]
    lea edx, [ebx*8]
    add edx, ebx
    lea edx, [edx*8]
    sub edx, ebx
    mov bl, byte [edx + 0x21f3c]
    cmp bl, 0x46
    jb short loc_02c9
    cmp bl, 0x50
    ja short loc_02c9
    mov word [eax + 0xe], 0x93c
    mov byte [eax + 0x14], 0x14
    mov byte [eax + 0x15], 0x14
    jmp short loc_02d7
loc_02c9:
    mov word [eax + 0xe], 0x23c
    mov byte [eax + 0x14], 0xf
    mov byte [eax + 0x15], 0xf
loc_02d7:
    mov edx, dword [0x7fd0]
    shl edx, 4
    mov ebx, dword [0x7fd0]
    mov dword [edx + 0x224a8], eax
    lea eax, [ebx*8]
    mov esi, 1
    add eax, ebx
    movsx ecx, cx
    lea eax, [eax*8]
    mov dword [edx + 0x224b0], ecx
    sub eax, ebx
    mov dword [edx + 0x224ac], esi
    mov eax, dword [eax + 0x21f7f]
    mov dword [edx + 0x224b4], eax
    lea edx, [ebx + esi]
    mov eax, 0x32
    mov dword [0x7fd0], edx
    mov dword [ecx*4 + 0x1af38], eax
    mov ecx, edi
    jmp near loc_005a
loc_033a:
    cmp dword [0x21f38], 0
    jne short loc_0357
loc_0343:
    mov eax, ebx
    call 0x6ab35
    inc dword [0x7fd8]
    mov ecx, edi
    jmp near loc_005a
loc_0357:
    mov ebx, dword [0x7fd4]
    lea edx, [ebx*8]
    add edx, ebx
    lea edx, [edx*8]
    sub edx, ebx
    cmp dword [edx + 0x221a7], 1
    jne short loc_03d3
    mov bl, byte [edx + 0x22174]
    cmp bl, 0x41
    jb short loc_039b
    cmp bl, 0x46
    ja short loc_039b
loc_0388:
    mov word [eax + 0xe], 0xd3a
    mov byte [eax + 0x14], 0x14
    mov byte [eax + 0x15], 0x14
    jmp near loc_0421
loc_039b:
    mov ebx, dword [0x7fd4]
    lea edx, [ebx*8]
    add edx, ebx
    lea edx, [edx*8]
    sub edx, ebx
    mov bl, byte [edx + 0x22174]
    cmp bl, 0x47
    jb short loc_0388
    cmp bl, 0x50
    ja short loc_0388
    mov word [eax + 0xe], 0xb3a
    mov byte [eax + 0x14], 0x14
    mov byte [eax + 0x15], 0x14
    jmp short loc_0421
loc_03d3:
    mov bl, byte [edx + 0x22174]
    cmp bl, 0x41
    jb short loc_03eb
    cmp bl, 0x45
    ja short loc_03eb
    mov word [eax + 0xe], 0x93a
    jmp short loc_0421
loc_03eb:
    mov ebx, dword [0x7fd4]
    lea edx, [ebx*8]
    add edx, ebx
    lea edx, [edx*8]
    sub edx, ebx
    mov bl, byte [edx + 0x22174]
    cmp bl, 0x46
    jb short loc_041b
    cmp bl, 0x50
    ja short loc_041b
    mov word [eax + 0xe], 0x93a
    jmp short loc_0421
loc_041b:
    mov word [eax + 0xe], 0x23a
loc_0421:
    mov ebx, dword [0x7fd4]
    movsx esi, cx
    shl ebx, 4
    mov dword [ebx + 0x2242c], 1
    mov ecx, dword [0x7fd4]
    lea edx, [ecx*8]
    add edx, ecx
    lea edx, [edx*8]
    mov dword [ebx + 0x22428], eax
    sub edx, ecx
    mov dword [ebx + 0x22430], esi
    mov edx, dword [edx + 0x221b7]
    mov dword [ebx + 0x22434], edx
    mov byte [eax + 0x14], 0xf
    mov byte [eax + 0x15], 0xf
    mov edx, dword [0x7fd4]
    xor eax, eax
    inc edx
    mov dword [esi*4 + 0x1af38], eax
    mov dword [0x7fd4], edx
loc_0485:
    mov ecx, edi
    jmp near loc_005a
loc_048c:
    inc ebp
loc_048d:
    cmp ebp, 0xf
    jl near loc_0052
    mov eax, dword [0x7fd0]
    xor edi, edi
    inc eax
    mov dword [0x7fd0], edi
    mov dword [0x7c4c], eax
    mov eax, dword [0x7fd4]
    mov dword [0x7fdc], edi
    mov dword [0x7c50], eax
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
%endif
