; Look up active sounds and their owning sprites.
bits 32
org START_ADDRESS

%if GAME_UPDATE
loc_0000:
    push ebx
    push edx
    mov ebx, eax
    xor eax, eax
    cmp eax, dword [0x7c70]
    jl short loc_0016
    mov eax, 0xffffffff
    pop edx
    pop ebx
    ret
loc_0016:
    imul edx, eax, 0x2c
    cmp ebx, dword [edx + 0x2e650]
    je short loc_002f
    inc eax
    cmp eax, dword [0x7c70]
    jl short loc_0016
    mov eax, 0xffffffff
loc_002f:
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8b, 0xc0    ; mov eax, eax
loc_0040:
    push ebx
    push edx
    mov ebx, eax
    xor eax, eax
    cmp eax, dword [0x7c74]
    jl short loc_0056
    mov eax, 0xffffffff
    pop edx
    pop ebx
    ret
loc_0056:
    imul edx, eax, 0x2c
    cmp ebx, dword [edx + 0x2e4f0]
    je short loc_006f
    inc eax
    cmp eax, dword [0x7c74]
    jl short loc_0056
    mov eax, 0xffffffff
loc_006f:
    pop edx
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
    xor ecx, ecx
    cmp ecx, 0x1000
    jl short loc_0095
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0095:
    movsx eax, cx
    imul eax, eax, 0x2c
    mov ebx, 0x2522b4
    add ebx, eax
    mov ax, word [ebx + 0xe]
    mov esi, ecx
    cmp ax, 0xa3a
    jb short loc_0110
    jbe near loc_01b4
    cmp ax, 0xc3a
    jb short loc_00ea
    jbe near loc_01b4
    cmp ax, 0xd3a
    jb short loc_00db
    jbe near loc_01b4
    cmp ax, 0xd3c
    je near loc_0170
    jmp near loc_01f8
loc_00db:
    cmp ax, 0xc3c
    je near loc_0170
    jmp near loc_01f8
loc_00ea:
    cmp ax, 0xb3a
    jb short loc_0105
    jbe near loc_01b4
    cmp ax, 0xb3c
    je near loc_0170
    jmp near loc_01f8
loc_0105:
    cmp ax, 0xa3c
    je short loc_0170
    jmp near loc_01f8
loc_0110:
    cmp ax, 0x33a
    jb short loc_015a
    jbe near loc_01b4
    cmp ax, 0x93a
    jb short loc_0141
    jbe near loc_01b4
    cmp ax, 0x93c
    je short loc_0170
    inc ecx
    cmp ecx, 0x1000
    jl near loc_0095
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0141:
    cmp ax, 0x33c
    je short loc_0170
    inc ecx
    cmp ecx, 0x1000
    jl near loc_0095
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_015a:
    cmp ax, 0x23a
    jb near loc_01f8
    jbe short loc_01b4
    cmp ax, 0x23c
    jne near loc_01f8
loc_0170:
    movsx edx, si
    mov eax, edx
    call loc_0000
    test eax, eax
    jl short loc_0187
    cmp dword [0x2dfd8], 0
    jne short loc_01a2
loc_0187:
    movsx eax, si
    call 0x67ff5
    inc ecx
    cmp ecx, 0x1000
    jl near loc_0095
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_01a2:
    mov si, word [ebx + 0x24]
    add esi, 0x7d0
    mov eax, edx
    mov word [ebx + 0x24], si
    jmp short loc_01ec
loc_01b4:
    movsx edx, si
    mov eax, edx
    call loc_0040
    test eax, eax
    jge short loc_01dc
    mov eax, edx
    call 0x67ff5
    inc ecx
    cmp ecx, 0x1000
    jl near loc_0095
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_01dc:
    mov di, word [ebx + 0x24]
    add edi, 0x7d0
    mov eax, edx
    mov word [ebx + 0x24], di
loc_01ec:
    call 0x34ce0
    mov eax, edx
    call 0x34ae0
loc_01f8:
    inc ecx
    cmp ecx, 0x1000
    jl near loc_0095
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
%else
    push ebx
    push edx
    mov ebx, eax
    xor eax, eax
    cmp eax, dword [0x7c4c]
    jl short loc_0016
    mov eax, 0xffffffff
    pop edx
    pop ebx
    ret
loc_0016:
    mov edx, eax
    shl edx, 4
    cmp ebx, dword [edx + 0x224b0]
    je short loc_0031
    inc eax
    cmp eax, dword [0x7c4c]
    jl short loc_0016
    mov eax, 0xffffffff
loc_0031:
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push edx
    mov ebx, eax
    xor eax, eax
    cmp eax, dword [0x7c50]
    jl short loc_0056
    mov eax, 0xffffffff
    pop edx
    pop ebx
    ret
loc_0056:
    mov edx, eax
    shl edx, 4
    cmp ebx, dword [edx + 0x22430]
    je short loc_0071
    inc eax
    cmp eax, dword [0x7c50]
    jl short loc_0056
    mov eax, 0xffffffff
loc_0071:
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    xor esi, esi
    cmp esi, 0xf
    jl short loc_0090
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0090:
    db 0x66, 0x8b, 0x14, 0x75, 0xc2, 0x54, 0x24, 0x00    ; mov dx, word [esi*2 + 0x2454c2]
loc_0098:
    test dx, dx
    jl near loc_0160
    movsx ebx, dx
    db 0x66, 0x8b, 0x0c, 0x5d, 0xa4, 0xf7, 0x1a, 0x00    ; mov cx, word [ebx*2 + 0x1af7a4]
    imul ebx, ebx, 0x2c
    add ebx, 0x1c0ba4
    mov ax, word [ebx + 0xe]
    cmp ax, 0xa3a
    jb short loc_0113
    jbe near loc_014b
    cmp ax, 0xc3a
    jb short loc_00fb
    jbe near loc_014b
    cmp ax, 0xd3a
    jb short loc_00ec
    jbe near loc_014b
    cmp ax, 0xd3c
    je near loc_014b
    jmp near loc_0159
loc_00ec:
    cmp ax, 0xc3c
    je near loc_014b
    jmp near loc_0159
loc_00fb:
    cmp ax, 0xb3a
    jb short loc_010b
    jbe short loc_014b
    cmp ax, 0xb3c
    je short loc_014b
    jmp short loc_0159
loc_010b:
    cmp ax, 0xa3c
    je short loc_014b
    jmp short loc_0159
loc_0113:
    cmp ax, 0x33a
    jb short loc_013d
    jbe short loc_014b
    cmp ax, 0x93a
    jb short loc_0130
    jbe short loc_014b
    cmp ax, 0x93c
    je short loc_014b
    mov edx, ecx
    jmp near loc_0098
loc_0130:
    cmp ax, 0x33c
    je short loc_014b
    mov edx, ecx
    jmp near loc_0098
loc_013d:
    cmp ax, 0x23a
    jb short loc_0159
    jbe short loc_014b
    cmp ax, 0x23c
    jne short loc_0159
loc_014b:
    movsx eax, dx
    add word [ebx + 0x24], 0x3e8
    call 0x37770
loc_0159:
    mov edx, ecx
    jmp near loc_0098
loc_0160:
    inc esi
    cmp esi, 0xf
    jl near loc_0090
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    nop
%endif
