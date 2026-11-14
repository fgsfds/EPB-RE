; Initialize game state and lookup tables.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov edx, dword [0x7c18]
    add edx, 0xfa
    mov ebx, dword [0x2dfd8]
    mov dword [0x7c18], edx
    test ebx, ebx
    je short loc_0027
    cmp ebx, 1
    jne short loc_0031
loc_0027:
    mov edi, 1
    jmp near loc_00c6
loc_0031:
    mov eax, dword [0x2e450]
    mov edx, eax
    mov esi, 0x14
    sar edx, 0x1f
    idiv esi
    mov edx, 0x1350
    mov dword [0x2e450], eax
    mov eax, 0x1344
    call 0xa0223
    mov esi, eax
    test eax, eax
    jne short loc_006a
    mov edi, 0xffffffff
    mov eax, edi
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_006a:
    mov ebx, 0xc
    mov edx, 1
    mov ecx, eax
    mov eax, 0x7c18
    call 0xa06a1
    mov ebx, 4
    mov edx, 1
    mov eax, 0x2e450
    mov ecx, esi
    call 0xa06a1
    call 0x6dc5f
    mov ebx, 4
    mov edx, 1
    mov ebp, dword [0x2e454]
    mov ecx, esi
    and ebp, eax
    mov eax, 0x2e454
    mov dword [0x2e454], ebp
    call 0xa06a1
    mov eax, esi
    call 0x9fcc9
loc_00c6:
    mov eax, edi
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    nop
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov eax, 0x1354
    xor edx, edx
    call 0x77cee
    mov ecx, eax
    cmp eax, -1
    je near loc_024e
    mov ebx, 4
    mov edx, 0x2dfd8
    call 0x77e20
    xor esi, esi
loc_00fd:
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    mov edi, 0x2dfdc
    sub eax, esi
    add edi, eax
    mov ebx, 0x33
    mov edx, edi
    mov eax, ecx
    call 0x77e20
    mov ebx, 4
    lea edx, [edi + 0x33]
    mov eax, ecx
    call 0x77e20
    mov ebx, 4
    lea edx, [edi + 0x37]
    mov eax, ecx
    call 0x77e20
    mov ebx, 4
    lea edx, [edi + 0x3f]
    mov eax, ecx
    call 0x77e20
    mov ebx, 4
    lea edx, [edi + 0x3b]
    mov eax, ecx
    call 0x77e20
    mov ebx, 4
    lea edx, [edi + 0x43]
    mov eax, ecx
    inc esi
    call 0x77e20
    cmp esi, 8
    jl short loc_00fd
    xor esi, esi
loc_0177:
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    mov edi, 0x2e214
    sub eax, esi
    add edi, eax
    mov ebx, 0x33
    mov edx, edi
    mov eax, ecx
    call 0x77e20
    mov ebx, 4
    lea edx, [edi + 0x33]
    mov eax, ecx
    call 0x77e20
    mov ebx, 4
    lea edx, [edi + 0x37]
    mov eax, ecx
    call 0x77e20
    mov ebx, 4
    lea edx, [edi + 0x3f]
    mov eax, ecx
    call 0x77e20
    mov ebx, 4
    lea edx, [edi + 0x3b]
    mov eax, ecx
    call 0x77e20
    mov ebx, 4
    lea edx, [edi + 0x43]
    mov eax, ecx
    inc esi
    call 0x77e20
    cmp esi, 8
    jl short loc_0177
    mov ebx, 4
    mov edx, 0x2e44c
    mov eax, ecx
    call 0x77e20
    mov ebx, 4
    mov edx, 0x2e450
    mov eax, ecx
    call 0x77e20
    mov ebx, 4
    mov edx, 0x2e454
    mov eax, ecx
    call 0x77e20
    mov eax, ecx
    call 0x77fe5
    mov edx, dword [0x2e450]
    cmp edx, 0x32
    jge short loc_0249
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*4]
    mov dword [0x2e450], eax
loc_0249:
    mov eax, 1
loc_024e:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    mov eax, 0x1360
    xor edx, edx
    call 0x77cee
    mov ecx, eax
    cmp eax, -1
    je near loc_044b
    mov ebx, 0x300
    mov edx, 0x2d6d8
    call 0x77e20
    mov eax, ecx
    call 0x77fe5
    xor edx, edx
    mov eax, 0x136c
    call 0x77cee
    mov ecx, eax
    cmp eax, -1
    je near loc_044b
    mov ebx, 0x300
    mov edx, 0x2dcd8
    call 0x77e20
    mov eax, ecx
    call 0x77fe5
    xor edx, edx
    mov eax, 0x1378
    call 0x77cee
    mov ecx, eax
    cmp eax, -1
    je near loc_044b
    mov ebx, 0x300
    mov edx, 0x2c1d8
    call 0x77e20
    mov eax, ecx
    call 0x77fe5
    xor edx, edx
    mov eax, 0x1384
    call 0x77cee
    mov ecx, eax
    cmp eax, -1
    je near loc_044b
    mov ebx, 0x300
    mov edx, 0x2c4d8
    call 0x77e20
    mov eax, ecx
    call 0x77fe5
    xor edx, edx
    mov eax, 0x1390
    call 0x77cee
    mov ecx, eax
    cmp eax, -1
    je near loc_044b
    mov ebx, 0x300
    mov edx, 0x2d3d8
    call 0x77e20
    mov eax, ecx
    call 0x77fe5
    xor edx, edx
    mov eax, 0x139c
    call 0x77cee
    mov ecx, eax
    cmp eax, -1
    je near loc_044b
    mov ebx, 0x300
    mov edx, 0x2c7d8
    call 0x77e20
    mov eax, ecx
    call 0x77fe5
    xor edx, edx
    mov eax, 0x13a8
    call 0x77cee
    mov ecx, eax
    cmp eax, -1
    je near loc_044b
    mov ebx, 0x300
    mov edx, 0x2b2d8
    call 0x77e20
    mov eax, ecx
    call 0x77fe5
    xor edx, edx
    mov eax, 0x13b4
    call 0x77cee
    mov ecx, eax
    cmp eax, -1
    je near loc_044b
    mov ebx, 0x300
    mov edx, 0x2bbd8
    call 0x77e20
    mov eax, ecx
    call 0x77fe5
    xor edx, edx
    mov eax, 0x13c0
    call 0x77cee
    mov ecx, eax
    cmp eax, -1
    je short loc_044b
    mov ebx, 0x300
    mov edx, 0x2b8d8
    call 0x77e20
    mov eax, ecx
    call 0x77fe5
    xor edx, edx
    mov eax, 0x13cc
    call 0x77cee
    mov ecx, eax
    cmp eax, -1
    je short loc_044b
    mov ebx, 0x300
    mov edx, 0x2afd8
    call 0x77e20
    mov eax, ecx
    call 0x77fe5
    xor edx, edx
    mov eax, 0x13d8
    call 0x77cee
    mov ecx, eax
    cmp eax, -1
    je short loc_044b
    mov ebx, 0x300
    mov edx, 0x2b5d8
    call 0x77e20
    mov eax, ecx
    call 0x77fe5
    mov eax, 1
loc_044b:
    pop edx
    pop ecx
    pop ebx
    ret
    add byte [eax], al
    add dword [esi], eax
    or cl, byte [edx + eax]
    add eax, 0x808d
    add byte [eax], al
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push ebx
    mov eax, dword [0x8dd4]
    dec eax
    test eax, eax
    jge short 0x2775d
    pop ebx
    ret
%else
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov edx, dword [0x21f38]
    test edx, edx
    je short loc_0014
    cmp edx, 1
    jne short loc_001b
loc_0014:
    mov edi, 1
    jmp short loc_005a
loc_001b:
    mov edx, 0x1364
    mov eax, 0x1358
    call 0xa2d71
    mov esi, eax
    test eax, eax
    jne short loc_003d
    mov edi, 0xffffffff
    mov eax, edi
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_003d:
    mov ebx, 0x14
    mov edx, 1
    mov ecx, eax
    mov eax, 0x7bf4
    call 0xa31ef
    mov eax, esi
    call 0xa2809
loc_005a:
    mov eax, edi
    pop edi
    pop esi
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
    mov eax, 0x1368
    xor edx, edx
    call 0x7a82e
    mov ecx, eax
    cmp eax, -1
    je near loc_01ce
    mov ebx, 4
    mov edx, 0x21f38
    call 0x7a960
    xor esi, esi
loc_009d:
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    mov edi, 0x21f3c
    sub eax, esi
    add edi, eax
    mov ebx, 0x33
    mov edx, edi
    mov eax, ecx
    call 0x7a960
    mov ebx, 4
    lea edx, [edi + 0x33]
    mov eax, ecx
    call 0x7a960
    mov ebx, 4
    lea edx, [edi + 0x37]
    mov eax, ecx
    call 0x7a960
    mov ebx, 4
    lea edx, [edi + 0x3f]
    mov eax, ecx
    call 0x7a960
    mov ebx, 4
    lea edx, [edi + 0x3b]
    mov eax, ecx
    call 0x7a960
    mov ebx, 4
    lea edx, [edi + 0x43]
    mov eax, ecx
    inc esi
    call 0x7a960
    cmp esi, 8
    jl short loc_009d
    xor esi, esi
loc_0117:
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    mov edi, 0x22174
    sub eax, esi
    add edi, eax
    mov ebx, 0x33
    mov edx, edi
    mov eax, ecx
    call 0x7a960
    mov ebx, 4
    lea edx, [edi + 0x33]
    mov eax, ecx
    call 0x7a960
    mov ebx, 4
    lea edx, [edi + 0x37]
    mov eax, ecx
    call 0x7a960
    mov ebx, 4
    lea edx, [edi + 0x3f]
    mov eax, ecx
    call 0x7a960
    mov ebx, 4
    lea edx, [edi + 0x3b]
    mov eax, ecx
    call 0x7a960
    mov ebx, 4
    lea edx, [edi + 0x43]
    mov eax, ecx
    inc esi
    call 0x7a960
    cmp esi, 8
    jl short loc_0117
    mov ebx, 4
    mov edx, 0x223ac
    mov eax, ecx
    call 0x7a960
    mov ebx, 4
    mov edx, 0x223b0
    mov eax, ecx
    call 0x7a960
    mov ebx, 4
    mov edx, 0x223b4
    mov eax, ecx
    call 0x7a960
    mov eax, ecx
    call 0x7ab25
    mov eax, 1
loc_01ce:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    mov eax, 0x1374
    xor edx, edx
    call 0x7a82e
    mov ecx, eax
    cmp eax, -1
    je near loc_03cb
    mov ebx, 0x300
    mov edx, 0x21338
    call 0x7a960
    mov eax, ecx
    call 0x7ab25
    xor edx, edx
    mov eax, 0x1380
    call 0x7a82e
    mov ecx, eax
    cmp eax, -1
    je near loc_03cb
    mov ebx, 0x300
    mov edx, 0x21c38
    call 0x7a960
    mov eax, ecx
    call 0x7ab25
    xor edx, edx
    mov eax, 0x138c
    call 0x7a82e
    mov ecx, eax
    cmp eax, -1
    je near loc_03cb
    mov ebx, 0x300
    mov edx, 0x1fb38
    call 0x7a960
    mov eax, ecx
    call 0x7ab25
    xor edx, edx
    mov eax, 0x1398
    call 0x7a82e
    mov ecx, eax
    cmp eax, -1
    je near loc_03cb
    mov ebx, 0x300
    mov edx, 0x1fe38
    call 0x7a960
    mov eax, ecx
    call 0x7ab25
    xor edx, edx
    mov eax, 0x13a4
    call 0x7a82e
    mov ecx, eax
    cmp eax, -1
    je near loc_03cb
    mov ebx, 0x300
    mov edx, 0x21038
    call 0x7a960
    mov eax, ecx
    call 0x7ab25
    xor edx, edx
    mov eax, 0x13b0
    call 0x7a82e
    mov ecx, eax
    cmp eax, -1
    je near loc_03cb
    mov ebx, 0x300
    mov edx, 0x20138
    call 0x7a960
    mov eax, ecx
    call 0x7ab25
    xor edx, edx
    mov eax, 0x13bc
    call 0x7a82e
    mov ecx, eax
    cmp eax, -1
    je near loc_03cb
    mov ebx, 0x300
    mov edx, 0x20438
    call 0x7a960
    mov eax, ecx
    call 0x7ab25
    xor edx, edx
    mov eax, 0x13c8
    call 0x7a82e
    mov ecx, eax
    cmp eax, -1
    je near loc_03cb
    mov ebx, 0x300
    mov edx, 0x21638
    call 0x7a960
    mov eax, ecx
    call 0x7ab25
    xor edx, edx
    mov eax, 0x13d4
    call 0x7a82e
    mov ecx, eax
    cmp eax, -1
    je short loc_03cb
    mov ebx, 0x300
    mov edx, 0x1f238
    call 0x7a960
    mov eax, ecx
    call 0x7ab25
    xor edx, edx
    mov eax, 0x13e0
    call 0x7a82e
    mov ecx, eax
    cmp eax, -1
    je short loc_03cb
    mov ebx, 0x300
    mov edx, 0x1f538
    call 0x7a960
    mov eax, ecx
    call 0x7ab25
    xor edx, edx
    mov eax, 0x13ec
    call 0x7a82e
    mov ecx, eax
    cmp eax, -1
    je short loc_03cb
    mov ebx, 0x300
    mov edx, 0x1ef38
    call 0x7a960
    mov eax, ecx
    call 0x7ab25
    mov eax, 1
loc_03cb:
    pop edx
    pop ecx
    pop ebx
    ret
    add byte [eax], al
    add dword [esi], eax
    or cl, byte [edx + eax]
    add eax, 0x5000500
    add byte [esi], al
    add byte [esi], al
    add byte [edi], al
    add byte [edi], al
    add byte [esi], al
    add byte [0x808d00], al
    add byte [eax], al
    add byte [ebx + 0x78a153d2], cl
    lea eax, [eax]
    add byte [eax - 0x7b], cl
    sar byte [ebp + 2], 0x5b
    ret
%endif
