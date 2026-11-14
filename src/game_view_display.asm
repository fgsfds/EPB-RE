; Game view and display transitions.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    cmp dword [LINK_ADDRESS_1], 0
    jle short loc_0015
    mov edi, 0x9b
    jmp short loc_001a
loc_0015:
    mov edi, 0xc0
loc_001a:
    mov ebx, dword [LINK_ADDRESS_2]
    cmp edi, ebx
    jle short loc_0028
    mov eax, ebx
    jmp short loc_002a
loc_0028:
    mov eax, edi
loc_002a:
    mov ecx, dword [LINK_ADDRESS_3]
    mov dword [LINK_ADDRESS_2], eax
    cmp edi, ecx
    jle short loc_003d
    mov eax, ecx
    jmp short loc_003f
loc_003d:
    mov eax, edi
loc_003f:
    movsx ebx, word [MYCONNECTINDEX]
    mov dword [LINK_ADDRESS_3], eax
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    test byte [nosplit eax*2 + LINK_ADDRESS_5], 0x10
    je short loc_0068
    sub edi, 8
loc_0068:
    mov dword [LINK_ADDRESS_3], edi
    xor esi, esi
    mov edi, dword [LINK_ADDRESS_2]
    jmp short loc_00b5
loc_0078:
    movsx eax, word [nosplit esi*2 + LINK_ADDRESS_6]
    test eax, eax
    jle short loc_00ba
    mov ebx, esi
    shl ebx, 7
    add ebx, LINK_ADDRESS_7
    cmp eax, 4
    jle short loc_0098
    push 0x1a
    jmp short loc_00a3
loc_0098:
    cmp eax, 2
    jle short loc_00a1
    push 0x1b
    jmp short loc_00a3
loc_00a1:
    push 0x3b
loc_00a3:
    mov eax, 0xa0
    mov edx, edi
    xor ecx, ecx
    call 0x10240
    sub edi, 8
    inc esi
loc_00b5:
    cmp esi, 4
    jl short loc_0078
loc_00ba:
    movsx ebx, word [LINK_ADDRESS_8]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    cmp word [nosplit eax*2 + LINK_ADDRESS_9], 1
    jle near loc_01ed
    cmp dword [LINK_ADDRESS_10], 1
    je near loc_014d
    cmp dword [LINK_ADDRESS_1], 0
    jle near loc_014d
    cmp dword [LINK_ADDRESS_11], 1
    jle short loc_014d
    mov eax, 8
    movsx esi, word [CONNECTHEAD]
    xor edi, edi
    jmp short loc_0121
loc_0113:
    cmp esi, edi
    jle short loc_0119
    mov edi, esi
loc_0119:
    movsx esi, word [nosplit esi*2 + CONNECTPOINT2]
loc_0121:
    test esi, esi
    jge short loc_0113
    cmp edi, 4
    jl short loc_0134
    cmp edi, 8
    jg short loc_0134
    add eax, 8
    jmp short loc_014f
loc_0134:
    cmp edi, 8
    jle short loc_0143
    cmp edi, 0xc
    jg short loc_0143
    add eax, 0x10
    jmp short loc_014f
loc_0143:
    cmp edi, 0xc
    jle short loc_014f
    add eax, 0x18
    jmp short loc_014f
loc_014d:
    xor eax, eax
loc_014f:
    movsx esi, word [LINK_ADDRESS_8]
    mov ebx, esi
    shl ebx, 7
    sub ebx, esi
    lea ebx, [ebx*4]
    sub ebx, esi
    add ebx, ebx
    mov cx, word [ebx + LINK_ADDRESS_14]
    cmp cx, 0x73
    je short loc_017b
    cmp cx, 0x74
    jne short loc_019b
loc_017b:
    mov eax, dword [LINK_ADDRESS_2]
    xor esi, esi
    jmp short loc_0193
loc_0184:
    cmp word [nosplit esi*2 + LINK_ADDRESS_6], 0
    jle short loc_0198
    sub eax, 8
    inc esi
loc_0193:
    cmp esi, 4
    jl short loc_0184
loc_0198:
    sub eax, 4
loc_019b:
    movsx esi, word [LINK_ADDRESS_8]
    mov ebx, esi
    shl ebx, 7
    sub ebx, esi
    lea ebx, [ebx*4]
    sub ebx, esi
    add ebx, ebx
    movsx edi, word [ebx + LINK_ADDRESS_9]
    cmp edi, 4
    jle short loc_01c4
    push 0x1a
    jmp short loc_01cf
loc_01c4:
    cmp edi, 2
    jle short loc_01cd
    push 0x1b
    jmp short loc_01cf
loc_01cd:
    push 0x3b
loc_01cf:
    mov edx, eax
    movsx ebx, word [ebx + LINK_ADDRESS_14]
    xor ecx, ecx
    shl ebx, 6
    mov eax, 0xa0
    add ebx, LINK_ADDRESS_15
    call 0x10240
loc_01ed:
    pop edi
loc_01ee:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
    push ecx
    push edi
    cmp dword [LINK_ADDRESS_16], 1
    jne short loc_0264
    cmp word [edx + 0x32c], 0
    jle short loc_0234
    db 0x66, 0x3d, 0x73, 0x00    ; cmp ax, 0x73
    je short loc_0234
    db 0x66, 0x3d, 0x74, 0x00    ; cmp ax, 0x74
    je short loc_0234
    mov cx, word [edx + 0x32e]
    cmp cx, 0x73
    je short loc_0264
    cmp cx, 0x74
    je short loc_0264
loc_0234:
    mov di, word [edx + 0x32e]
    mov word [edx + 0x32c], 0x64
    cmp ax, di
    jne short loc_024f
    cmp di, 0x1a
    jne short loc_0264
loc_024f:
    mov word [edx + 0x32e], ax
    mov ah, 1
    mov byte [LINK_ADDRESS_17], ah
    mov byte [LINK_ADDRESS_18], ah
loc_0264:
    pop edi
    pop ecx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    mov ecx, dword [YDIM]
    mov ebx, dword [XDIM]
    xor edx, edx
    xor eax, eax
    dec ecx
    dec ebx
    call SETVIEW
    call LINK_ADDRESS_22
    movsx ecx, word [MYCONNECTINDEX]
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    mov edx, PALETTE
    xor esi, esi
    mov dword [nosplit eax*2 + LINK_ADDRESS_24], edx
    jmp short loc_02c8
loc_02b7:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_25
    add esi, 7
loc_02c8:
    cmp si, 0x40
    jl short loc_02b7
    call LINK_ADDRESS_26
    xor eax, eax
    call LINK_ADDRESS_27
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x5a
    push 0
    mov ebx, 0x10000
    push 0
    xor ecx, ecx
    xor edx, edx
    push 0x9c4
    xor eax, eax
    mov esi, 0x3f
    call LINK_ADDRESS_28
    call LINK_ADDRESS_29
    jmp short loc_0324
loc_0313:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_25
    sub esi, 7
loc_0324:
    test si, si
    jg short loc_0313
    xor ebx, ebx
    mov dword [TOTALCLOCK], ebx
loc_0331:
    call LINK_ADDRESS_31
    test eax, eax
    jne near loc_01ee
    cmp dword [TOTALCLOCK], 0x960
    jge near loc_01ee
    call 0x10800
    jmp short loc_0331
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
