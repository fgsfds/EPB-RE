; Sector update and transition routines.
bits 32
org START_ADDRESS

    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
loc_0004:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 8
    cmp byte [LINK_ADDRESS_1], 0xc
    ja short loc_0026
    mov eax, dword [LINK_ADDRESS_2]
    cmp byte [eax], 0
    je short loc_0026
    cmp byte [eax + 1], 0
    jne short loc_002d
loc_0026:
    mov dl, 1
    jmp near LINK_ADDRESS_3
loc_002d:
    call LINK_ADDRESS_4
    mov dl, al
    inc al
    cmp al, 0x76
    ja near LINK_ADDRESS_5
    and eax, 0xff
    jmp dword cs:[eax*4 + LINK_ADDRESS_6]
    mov ecx, dword [LINK_ADDRESS_7]
    sub ecx, 4
    movsx ebx, word [LINK_ADDRESS_8]
    mov dword [LINK_ADDRESS_7], ecx
loc_0061:
    mov edi, dword [LINK_ADDRESS_2]
    inc edi
    mov dword [LINK_ADDRESS_2], edi
    cmp byte [edi], 0xa
    jne short loc_007a
    inc word [LINK_ADDRESS_8]
loc_007a:
    mov eax, dword [LINK_ADDRESS_2]
    mov ch, byte [eax]
    test ch, ch
    jne short loc_00c0
    mov eax, dword [LINK_ADDRESS_9]
    mov edx, dword [LINK_ADDRESS_10]
    shl eax, 6
    add eax, edx
    push eax
    push ebx
    push LINK_ADDRESS_11
    call PRINTF
    mov bl, byte [LINK_ADDRESS_1]
    xor dl, dl
    inc bl
    add esp, 0xc
    mov byte [LINK_ADDRESS_1], bl
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_00c0:
    cmp ch, 0x2a
    jne short loc_0061
    cmp byte [eax + 1], 0x2f
    jne short loc_0061
    add eax, 2
    xor dl, dl
    mov dword [LINK_ADDRESS_2], eax
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp dword [LINK_ADDRESS_13], 0
    jne short loc_0140
    cmp byte [LINK_ADDRESS_14], 0
    jne short loc_0140
    call LINK_ADDRESS_15
    mov eax, dword [LINK_ADDRESS_9]
    mov edx, dword [LINK_ADDRESS_16]
    mov ecx, dword [LINK_ADDRESS_7]
    lea eax, [eax*4]
    sub ecx, 4
    add eax, edx
    mov dword [LINK_ADDRESS_7], ecx
    mov dword [eax], ecx
    mov dl, 1
    mov esi, dword [LINK_ADDRESS_9]
    mov byte [LINK_ADDRESS_14], dl
    inc esi
    xor dl, dl
    mov dword [LINK_ADDRESS_9], esi
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0140:
    call LINK_ADDRESS_15
    xor ecx, ecx
    cmp ecx, 0x76
    jl short loc_0153
    xor ebx, ebx
    jmp near loc_01f6
loc_0153:
    mov eax, dword [LINK_ADDRESS_9]
    mov ebx, dword [LINK_ADDRESS_10]
    shl eax, 6
    mov edx, dword [ecx*4 + LINK_ADDRESS_17]
    add eax, ebx
    call STRCMP
    test eax, eax
    jne short loc_01b5
    mov eax, dword [LINK_ADDRESS_9]
    mov edx, dword [LINK_ADDRESS_10]
    shl eax, 6
    add eax, edx
    push eax
    movsx eax, word [LINK_ADDRESS_8]
    mov bh, byte [LINK_ADDRESS_1]
    push eax
    inc bh
    push LINK_ADDRESS_19
    mov byte [LINK_ADDRESS_1], bh
    xor dl, dl
    call PRINTF
    add esp, 0xc
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_01b5:
    inc ecx
    cmp ecx, 0x76
    jl short loc_0153
    xor ebx, ebx
    jmp short loc_01f6
loc_01bf:
    mov edx, eax
    mov ecx, ebx
    mov eax, dword [LINK_ADDRESS_10]
    shl edx, 6
    shl ecx, 6
    add edx, eax
    add eax, ecx
    call STRCMP
    test eax, eax
    jne short loc_01f5
    mov eax, dword [LINK_ADDRESS_16]
    lea edx, [ebx*4]
    add eax, edx
    mov edx, dword [LINK_ADDRESS_7]
    mov eax, dword [eax]
    mov dword [edx], eax
    jmp short loc_01ff
loc_01f5:
    inc ebx
loc_01f6:
    mov eax, dword [LINK_ADDRESS_9]
    cmp ebx, eax
    jl short loc_01bf
loc_01ff:
    mov edx, dword [LINK_ADDRESS_9]
    cmp ebx, edx
    jne short loc_023a
    mov eax, edx
    mov edx, dword [LINK_ADDRESS_10]
    shl eax, 6
    add eax, edx
    push eax
    movsx eax, word [LINK_ADDRESS_8]
    push eax
    push LINK_ADDRESS_20
    call PRINTF
    mov cl, byte [LINK_ADDRESS_1]
    inc cl
    add esp, 0xc
    mov byte [LINK_ADDRESS_1], cl
loc_023a:
    mov ebx, dword [LINK_ADDRESS_7]
    add ebx, 4
    xor dl, dl
    mov dword [LINK_ADDRESS_7], ebx
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp byte [LINK_ADDRESS_14], 0
    jne short loc_0284
    movsx eax, word [LINK_ADDRESS_8]
    push eax
    mov eax, LINK_ADDRESS_21
    push eax
    call PRINTF
    mov bh, byte [LINK_ADDRESS_1]
    inc bh
    add esp, 8
    mov byte [LINK_ADDRESS_1], bh
loc_0284:
    cmp word [LINK_ADDRESS_22], 0
    jle short loc_02b1
    movsx eax, word [LINK_ADDRESS_8]
    push eax
    push LINK_ADDRESS_23
    call PRINTF
    mov cl, byte [LINK_ADDRESS_1]
    inc cl
    add esp, 8
    mov byte [LINK_ADDRESS_1], cl
loc_02b1:
    cmp word [LINK_ADDRESS_22], 0
    jge short loc_02de
    movsx eax, word [LINK_ADDRESS_8]
    push eax
    push LINK_ADDRESS_24
    call PRINTF
    mov ch, byte [LINK_ADDRESS_1]
    inc ch
    add esp, 8
    mov byte [LINK_ADDRESS_1], ch
loc_02de:
    xor al, al
    xor dl, dl
    mov byte [LINK_ADDRESS_14], al
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    call LINK_ADDRESS_15
    xor ecx, ecx
    cmp ecx, 0x76
    jl short loc_0306
    xor ecx, ecx
    jmp near loc_03c5
loc_0306:
    mov ebx, dword [LINK_ADDRESS_9]
    mov eax, dword [LINK_ADDRESS_10]
    shl ebx, 6
    mov edx, dword [ecx*4 + LINK_ADDRESS_17]
    add eax, ebx
    call STRCMP
    test eax, eax
    jne short loc_0368
    mov eax, dword [LINK_ADDRESS_9]
    mov edx, dword [LINK_ADDRESS_10]
    shl eax, 6
    add eax, edx
    push eax
    movsx eax, word [LINK_ADDRESS_8]
    mov cl, byte [LINK_ADDRESS_1]
    push eax
    inc cl
    push LINK_ADDRESS_25
    mov byte [LINK_ADDRESS_1], cl
    xor dl, dl
    call PRINTF
    add esp, 0xc
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0368:
    inc ecx
    cmp ecx, 0x76
    jl short loc_0306
    xor ecx, ecx
    jmp short loc_03c5
loc_0372:
    mov eax, dword [LINK_ADDRESS_10]
    mov edx, ecx
    mov ebx, esi
    shl edx, 6
    shl ebx, 6
    add edx, eax
    add eax, ebx
    call STRCMP
    test eax, eax
    jne short loc_03c4
    mov eax, dword [LINK_ADDRESS_9]
    mov edx, dword [LINK_ADDRESS_10]
    shl eax, 6
    add eax, edx
    push eax
    movsx eax, word [LINK_ADDRESS_8]
    mov bl, byte [LINK_ADDRESS_26]
    push eax
    inc bl
    push LINK_ADDRESS_27
    mov byte [LINK_ADDRESS_26], bl
    call PRINTF
    add esp, 0xc
    jmp short loc_03cf
loc_03c4:
    inc ecx
loc_03c5:
    mov esi, dword [LINK_ADDRESS_9]
    cmp ecx, esi
    jl short loc_0372
loc_03cf:
    call LINK_ADDRESS_28
    mov edi, dword [LINK_ADDRESS_9]
    cmp ecx, edi
    jne short loc_03ff
    lea edx, [edi*4]
    lea eax, [edi + 1]
    mov ecx, dword [LINK_ADDRESS_7]
    mov dword [LINK_ADDRESS_9], eax
    mov ebx, dword [LINK_ADDRESS_16]
    mov eax, dword [ecx - 4]
    mov dword [edx + ebx], eax
loc_03ff:
    mov ebp, dword [LINK_ADDRESS_7]
    sub ebp, 8
    xor dl, dl
    mov dword [LINK_ADDRESS_7], ebp
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    xor ebx, ebx
    jmp short loc_0430
loc_0420:
    call LINK_ADDRESS_29
    cmp eax, -1
    jne short loc_0435
    call LINK_ADDRESS_28
    inc ebx
loc_0430:
    cmp ebx, 4
    jl short loc_0420
loc_0435:
    cmp ebx, 4
    jge near LINK_ADDRESS_5
    mov eax, dword [LINK_ADDRESS_7]
    mov dword [eax], 0
    mov ecx, dword [LINK_ADDRESS_7]
    add ecx, 4
    inc ebx
    mov dword [LINK_ADDRESS_7], ecx
    jmp short loc_0435
    cmp dword [LINK_ADDRESS_13], 0
    jne short loc_046d
    cmp byte [LINK_ADDRESS_14], 0
    je short loc_04a9
loc_046d:
    call LINK_ADDRESS_28
    xor ebx, ebx
loc_0474:
    call LINK_ADDRESS_29
    cmp eax, -1
    jne short loc_0496
    call LINK_ADDRESS_28
    mov ecx, dword [LINK_ADDRESS_7]
    sub ecx, 4
    mov dword [LINK_ADDRESS_7], ecx
    or ebx, dword [ecx]
    jmp short loc_0474
loc_0496:
    mov eax, dword [LINK_ADDRESS_7]
    mov dword [eax], ebx
    add dword [LINK_ADDRESS_7], 4
    jmp near LINK_ADDRESS_5
loc_04a9:
    mov edi, dword [LINK_ADDRESS_7]
    sub edi, 4
    xor ecx, ecx
    mov dword [LINK_ADDRESS_7], edi
    call LINK_ADDRESS_15
    cmp ecx, 0x76
    jl short loc_04cb
    xor ecx, ecx
    jmp near loc_058a
loc_04cb:
    mov eax, dword [LINK_ADDRESS_9]
    mov ebx, dword [LINK_ADDRESS_10]
    shl eax, 6
    mov edx, dword [ecx*4 + LINK_ADDRESS_17]
    add eax, ebx
    call STRCMP
    test eax, eax
    jne short loc_052d
    mov eax, dword [LINK_ADDRESS_9]
    mov edx, dword [LINK_ADDRESS_10]
    shl eax, 6
    add eax, edx
    push eax
    movsx eax, word [LINK_ADDRESS_8]
    mov bh, byte [LINK_ADDRESS_1]
    push eax
    inc bh
    push LINK_ADDRESS_30
    mov byte [LINK_ADDRESS_1], bh
    xor dl, dl
    call PRINTF
    add esp, 0xc
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_052d:
    inc ecx
    cmp ecx, 0x76
    jl short loc_04cb
    xor ecx, ecx
    jmp short loc_058a
loc_0537:
    mov eax, dword [LINK_ADDRESS_10]
    mov edx, ecx
    mov ebx, ebp
    shl edx, 6
    shl ebx, 6
    add edx, eax
    add eax, ebx
    call STRCMP
    test eax, eax
    jne short loc_0589
    mov eax, dword [LINK_ADDRESS_9]
    mov edx, dword [LINK_ADDRESS_10]
    shl eax, 6
    add eax, edx
    push eax
    movsx eax, word [LINK_ADDRESS_8]
    mov bl, byte [LINK_ADDRESS_26]
    push eax
    inc bl
    push LINK_ADDRESS_31
    mov byte [LINK_ADDRESS_26], bl
    call PRINTF
    add esp, 0xc
    jmp short loc_0594
loc_0589:
    inc ecx
loc_058a:
    mov ebp, dword [LINK_ADDRESS_9]
    cmp ecx, ebp
    jl short loc_0537
loc_0594:
    mov eax, dword [LINK_ADDRESS_9]
    cmp ecx, eax
    jne short loc_05b8
    lea edx, [eax*4]
    inc eax
    mov ebx, dword [LINK_ADDRESS_16]
    mov dword [LINK_ADDRESS_9], eax
    mov eax, dword [LINK_ADDRESS_7]
    mov dword [edx + ebx], eax
loc_05b8:
    xor ebx, ebx
    cmp ebx, 2
    jl short loc_05c3
    mov edi, ebx
    jmp short loc_05f6
loc_05c3:
    call LINK_ADDRESS_29
    test eax, eax
    jge short loc_05d7
    call LINK_ADDRESS_28
    inc ebx
    cmp ebx, 2
    jl short loc_05c3
loc_05d7:
    mov edi, ebx
    jmp short loc_05f6
loc_05db:
    mov eax, dword [LINK_ADDRESS_7]
    mov dword [eax], 0
    mov edx, dword [LINK_ADDRESS_7]
    add edx, 4
    inc edi
    mov dword [LINK_ADDRESS_7], edx
loc_05f6:
    cmp edi, 2
    jl short loc_05db
    xor dl, dl
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    sub dword [LINK_ADDRESS_7], 4
    call LINK_ADDRESS_28
    mov ebx, dword [LINK_ADDRESS_7]
    sub ebx, 4
    xor dl, dl
    mov dword [LINK_ADDRESS_7], ebx
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    sub dword [LINK_ADDRESS_7], 4
    call LINK_ADDRESS_28
    mov esi, dword [LINK_ADDRESS_7]
    sub esi, 4
    mov dword [LINK_ADDRESS_7], esi
    mov edi, dword [esi]
    dec edi
    xor dl, dl
    mov dword [LINK_ADDRESS_32], edi
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    sub dword [LINK_ADDRESS_7], 4
    call LINK_ADDRESS_28
    mov ecx, dword [LINK_ADDRESS_7]
    sub ecx, 4
    mov dword [LINK_ADDRESS_7], ecx
    mov edi, dword [ecx]
    dec edi
    xor dl, dl
    mov dword [LINK_ADDRESS_33], edi
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    sub dword [LINK_ADDRESS_7], 4
    call LINK_ADDRESS_28
    mov ebx, dword [LINK_ADDRESS_7]
    sub ebx, 4
    mov dword [LINK_ADDRESS_7], ebx
    mov edi, dword [ebx]
    dec edi
    test edi, edi
    jl near loc_0765
    xor ecx, ecx
loc_06be:
    call LINK_ADDRESS_29
    cmp eax, -1
    jne near LINK_ADDRESS_5
loc_06cc:
    mov eax, dword [LINK_ADDRESS_2]
    mov al, byte [eax]
    and eax, 0xff
    call LINK_ADDRESS_34
    test al, al
    jne short loc_0705
    mov eax, dword [LINK_ADDRESS_2]
    cmp byte [eax], 0xa
    jne short loc_06f2
    inc word [LINK_ADDRESS_8]
loc_06f2:
    mov ebp, dword [LINK_ADDRESS_2]
    inc ebp
    mov dword [LINK_ADDRESS_2], ebp
    cmp byte [ebp], 0
    jne short loc_06cc
loc_0705:
    xor ebx, ebx
    imul esi, ecx, 0xd
loc_070a:
    mov eax, dword [LINK_ADDRESS_2]
    mov al, byte [ebx + eax]
    and eax, 0xff
    call LINK_ADDRESS_34
    mov byte [esp], al
    lea eax, [edi*8]
    add eax, edi
    shl eax, 4
    sub eax, edi
    add eax, esi
    mov dl, byte [esp]
    add eax, ebx
    test dl, dl
    je short loc_074a
    mov edx, dword [LINK_ADDRESS_2]
    mov dl, byte [edx + ebx]
    inc ebx
    mov byte [eax + LINK_ADDRESS_35], dl
    jmp short loc_070a
loc_074a:
    mov byte [eax + LINK_ADDRESS_35], dl
    add dword [LINK_ADDRESS_2], ebx
    cmp ecx, 9
    jg near LINK_ADDRESS_5
    inc ecx
    jmp near loc_06be
loc_0765:
    xor ecx, ecx
loc_0767:
    call LINK_ADDRESS_29
    cmp eax, -1
    jne near LINK_ADDRESS_5
loc_0775:
    mov eax, dword [LINK_ADDRESS_2]
    mov al, byte [eax]
    and eax, 0xff
    call LINK_ADDRESS_34
    test al, al
    jne short loc_07ad
    mov eax, dword [LINK_ADDRESS_2]
    cmp byte [eax], 0xa
    jne short loc_079b
    inc word [LINK_ADDRESS_8]
loc_079b:
    mov edx, dword [LINK_ADDRESS_2]
    inc edx
    mov dword [LINK_ADDRESS_2], edx
    cmp byte [edx], 0
    jne short loc_0775
loc_07ad:
    xor ebx, ebx
loc_07af:
    mov eax, dword [LINK_ADDRESS_2]
    mov al, byte [ebx + eax]
    imul edx, ecx, 0xd
    and eax, 0xff
    call LINK_ADDRESS_34
    add edx, ebx
    test al, al
    je short loc_07db
    mov eax, dword [LINK_ADDRESS_2]
    mov al, byte [ebx + eax]
    inc ebx
    mov byte [edx + LINK_ADDRESS_36], al
    jmp short loc_07af
loc_07db:
    mov esi, dword [LINK_ADDRESS_2]
    add esi, ebx
    mov byte [edx + LINK_ADDRESS_36], al
    mov dword [LINK_ADDRESS_2], esi
    cmp ecx, 9
    jg near LINK_ADDRESS_5
    inc ecx
    jmp near loc_0767
    sub dword [LINK_ADDRESS_7], 4
loc_0805:
    mov eax, dword [LINK_ADDRESS_2]
    mov al, byte [eax]
    and eax, 0xff
    call LINK_ADDRESS_34
    test al, al
    jne short loc_083d
    mov eax, dword [LINK_ADDRESS_2]
    cmp byte [eax], 0xa
    jne short loc_082b
    inc word [LINK_ADDRESS_8]
loc_082b:
    mov esi, dword [LINK_ADDRESS_2]
    inc esi
    mov dword [LINK_ADDRESS_2], esi
    cmp byte [esi], 0
    jne short loc_0805
loc_083d:
    xor ebx, ebx
loc_083f:
    mov eax, dword [LINK_ADDRESS_2]
    mov al, byte [eax]
    and eax, 0xff
    call LINK_ADDRESS_34
    test al, al
    je short loc_086d
    mov eax, dword [LINK_ADDRESS_2]
    lea edx, [eax + 1]
    mov dword [LINK_ADDRESS_2], edx
    inc ebx
    mov al, byte [eax]
    mov byte [ebx + LINK_ADDRESS_37], al
    jmp short loc_083f
loc_086d:
    xor edx, edx
    mov byte [ebx + LINK_ADDRESS_38], al
    mov eax, LINK_ADDRESS_38
    mov dl, byte [LINK_ADDRESS_39]
    call KOPEN4LOAD
    mov ecx, eax
    test eax, eax
    jne short loc_08cd
    mov edx, dword [LINK_ADDRESS_9]
    mov eax, dword [LINK_ADDRESS_10]
    shl edx, 6
    add eax, edx
    push eax
    movsx eax, word [LINK_ADDRESS_8]
    mov bl, byte [LINK_ADDRESS_1]
    push eax
    inc bl
    push LINK_ADDRESS_41
    mov byte [LINK_ADDRESS_1], bl
    xor dl, dl
    call PRINTF
    add esp, 0xc
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_08cd:
    call KFILELENGTH
    push LINK_ADDRESS_38
    push LINK_ADDRESS_43
    mov ebx, eax
    call PRINTF
    mov al, byte [LINK_ADDRESS_44]
    add esp, 8
    mov esi, 1
    mov byte [esp + 4], al
    xor al, al
    mov edx, dword [LINK_ADDRESS_45]
    mov byte [LINK_ADDRESS_44], al
    mov eax, dword [LINK_ADDRESS_46]
    mov di, word [LINK_ADDRESS_8]
    add edx, eax
    mov word [LINK_ADDRESS_8], si
    mov eax, edx
    mov esi, dword [LINK_ADDRESS_2]
    mov dword [LINK_ADDRESS_2], edx
    mov byte [ebx + eax], 0
    mov edx, dword [LINK_ADDRESS_2]
    mov eax, ecx
    call KREAD
    mov eax, ecx
    call KCLOSE
loc_093c:
    call loc_0004
    test al, al
    je short loc_093c
    mov ax, word [LINK_ADDRESS_8]
    mov dx, word [LINK_ADDRESS_49]
    mov dword [LINK_ADDRESS_2], esi
    mov word [LINK_ADDRESS_8], di
    add edx, eax
    mov al, byte [esp + 4]
    mov word [LINK_ADDRESS_49], dx
    mov byte [LINK_ADDRESS_44], al
    xor dl, dl
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
