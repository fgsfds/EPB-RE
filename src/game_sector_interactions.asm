; Player interactions with sector and sprite state.
bits 32
org START_ADDRESS

    cmp dword [LINK_ADDRESS_1], 0
    jne short loc_0012
    cmp byte [LINK_ADDRESS_2], 0
    je short loc_0025
loc_0012:
    call LINK_ADDRESS_3
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
loc_0025:
    mov eax, dword [LINK_ADDRESS_4]
    sub eax, 4
    xor ecx, ecx
    mov dword [LINK_ADDRESS_4], eax
    call LINK_ADDRESS_5
    cmp ecx, 0x76
    jl short loc_0045
    xor ecx, ecx
    jmp near loc_0104
loc_0045:
    mov eax, dword [LINK_ADDRESS_6]
    mov ebx, dword [LINK_ADDRESS_7]
    shl eax, 6
    mov edx, dword [ecx*4 + LINK_ADDRESS_8]
    add eax, ebx
    call STRCMP
    test eax, eax
    jne short loc_00a7
    mov eax, dword [LINK_ADDRESS_6]
    mov edx, dword [LINK_ADDRESS_7]
    shl eax, 6
    add eax, edx
    push eax
    movsx eax, word [LINK_ADDRESS_10]
    mov bh, byte [LINK_ADDRESS_11]
    push eax
    inc bh
    push LINK_ADDRESS_12
    mov byte [LINK_ADDRESS_11], bh
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
loc_00a7:
    inc ecx
    cmp ecx, 0x76
    jl short loc_0045
    xor ecx, ecx
    jmp short loc_0104
loc_00b1:
    mov eax, dword [LINK_ADDRESS_7]
    mov edx, ecx
    mov ebx, edi
    shl edx, 6
    shl ebx, 6
    add edx, eax
    add eax, ebx
    call STRCMP
    test eax, eax
    jne short loc_0103
    mov eax, dword [LINK_ADDRESS_6]
    mov edx, dword [LINK_ADDRESS_7]
    shl eax, 6
    add eax, edx
    push eax
    movsx eax, word [LINK_ADDRESS_10]
    mov bl, byte [LINK_ADDRESS_14]
    push eax
    inc bl
    push LINK_ADDRESS_15
    mov byte [LINK_ADDRESS_14], bl
    call PRINTF
    add esp, 0xc
    jmp short loc_010e
loc_0103:
    inc ecx
loc_0104:
    mov edi, dword [LINK_ADDRESS_6]
    cmp ecx, edi
    jl short loc_00b1
loc_010e:
    mov ebp, dword [LINK_ADDRESS_6]
    cmp ecx, ebp
    jne short loc_0138
    lea edx, [ebp*4]
    lea eax, [ebp + 1]
    mov ebx, dword [LINK_ADDRESS_16]
    mov dword [LINK_ADDRESS_6], eax
    lea eax, [ebx + edx]
    mov edx, dword [LINK_ADDRESS_4]
    mov dword [eax], edx
loc_0138:
    xor ebx, ebx
    cmp ebx, 3
    jl short loc_0146
    mov edi, ebx
    jmp near loc_01c4
loc_0146:
    call LINK_ADDRESS_17
    test eax, eax
    jge short loc_01a5
    cmp ebx, 2
    jne short loc_019a
    xor edi, edi
loc_0156:
    call LINK_ADDRESS_17
    cmp eax, -1
    jne short loc_0178
    call LINK_ADDRESS_3
    mov edx, dword [LINK_ADDRESS_4]
    sub edx, 4
    mov dword [LINK_ADDRESS_4], edx
    or edi, dword [edx]
    jmp short loc_0156
loc_0178:
    mov eax, dword [LINK_ADDRESS_4]
    mov dword [eax], edi
    mov eax, dword [LINK_ADDRESS_4]
    add eax, 4
    xor dl, dl
    mov dword [LINK_ADDRESS_4], eax
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_019a:
    call LINK_ADDRESS_3
    inc ebx
    cmp ebx, 3
    jl short loc_0146
loc_01a5:
    mov edi, ebx
    jmp short loc_01c4
loc_01a9:
    mov eax, dword [LINK_ADDRESS_4]
    mov dword [eax], 0
    mov ecx, dword [LINK_ADDRESS_4]
    add ecx, 4
    inc edi
    mov dword [LINK_ADDRESS_4], ecx
loc_01c4:
    cmp edi, 3
    jl short loc_01a9
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
    cmp dword [LINK_ADDRESS_1], 0
    jne short loc_01e9
    cmp byte [LINK_ADDRESS_2], 0
    je short loc_01fc
loc_01e9:
    call LINK_ADDRESS_3
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
loc_01fc:
    mov edx, dword [LINK_ADDRESS_4]
    sub edx, 4
    xor ecx, ecx
    mov dword [LINK_ADDRESS_4], edx
    call LINK_ADDRESS_5
    cmp ecx, 0x76
    jl short loc_021e
    xor ecx, ecx
    jmp near loc_02dd
loc_021e:
    mov ebx, dword [LINK_ADDRESS_6]
    mov eax, dword [LINK_ADDRESS_7]
    shl ebx, 6
    mov edx, dword [ecx*4 + LINK_ADDRESS_8]
    add eax, ebx
    call STRCMP
    test eax, eax
    jne short loc_0280
    mov eax, dword [LINK_ADDRESS_6]
    mov edx, dword [LINK_ADDRESS_7]
    shl eax, 6
    add eax, edx
    push eax
    movsx eax, word [LINK_ADDRESS_10]
    mov ch, byte [LINK_ADDRESS_11]
    push eax
    inc ch
    push LINK_ADDRESS_18
    mov byte [LINK_ADDRESS_11], ch
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
loc_0280:
    inc ecx
    cmp ecx, 0x76
    jl short loc_021e
    xor ecx, ecx
    jmp short loc_02dd
loc_028a:
    mov eax, dword [LINK_ADDRESS_7]
    mov edx, ecx
    mov ebx, esi
    shl edx, 6
    shl ebx, 6
    add edx, eax
    add eax, ebx
    call STRCMP
    test eax, eax
    jne short loc_02dc
    mov eax, dword [LINK_ADDRESS_6]
    mov edx, dword [LINK_ADDRESS_7]
    shl eax, 6
    add eax, edx
    push eax
    movsx eax, word [LINK_ADDRESS_10]
    mov bl, byte [LINK_ADDRESS_14]
    push eax
    inc bl
    push LINK_ADDRESS_19
    mov byte [LINK_ADDRESS_14], bl
    call PRINTF
    add esp, 0xc
    jmp short loc_02e7
loc_02dc:
    inc ecx
loc_02dd:
    mov esi, dword [LINK_ADDRESS_6]
    cmp ecx, esi
    jl short loc_028a
loc_02e7:
    mov edi, dword [LINK_ADDRESS_6]
    cmp ecx, edi
    jne short loc_030e
    lea edx, [edi*4]
    lea eax, [edi + 1]
    mov ebx, dword [LINK_ADDRESS_16]
    mov dword [LINK_ADDRESS_6], eax
    mov eax, dword [LINK_ADDRESS_4]
    mov dword [edx + ebx], eax
loc_030e:
    xor ebx, ebx
    cmp ebx, 5
    jl short loc_0319
    mov edi, ebx
    jmp short loc_034c
loc_0319:
    call LINK_ADDRESS_17
    test eax, eax
    jge short loc_032d
    call LINK_ADDRESS_3
    inc ebx
    cmp ebx, 5
    jl short loc_0319
loc_032d:
    mov edi, ebx
    jmp short loc_034c
loc_0331:
    mov eax, dword [LINK_ADDRESS_4]
    mov dword [eax], 0
    mov ebp, dword [LINK_ADDRESS_4]
    add ebp, 4
    inc edi
    mov dword [LINK_ADDRESS_4], ebp
loc_034c:
    cmp edi, 5
    jl short loc_0331
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
    cmp byte [LINK_ADDRESS_2], 0
    je short loc_038c
    movsx eax, word [LINK_ADDRESS_10]
    push eax
    mov eax, LINK_ADDRESS_20
    push eax
    call PRINTF
    mov dl, byte [LINK_ADDRESS_11]
    inc dl
    add esp, 8
    mov byte [LINK_ADDRESS_11], dl
loc_038c:
    cmp dword [LINK_ADDRESS_1], 0
    je short loc_03b8
    movsx eax, word [LINK_ADDRESS_10]
    push eax
    push LINK_ADDRESS_21
    call PRINTF
    mov dh, byte [LINK_ADDRESS_11]
    inc dh
    add esp, 8
    mov byte [LINK_ADDRESS_11], dh
loc_03b8:
    mov edi, dword [LINK_ADDRESS_4]
    xor ebx, ebx
    sub edi, 4
    mov word [LINK_ADDRESS_22], bx
    mov dword [LINK_ADDRESS_4], edi
    mov dword [LINK_ADDRESS_1], edi
    call LINK_ADDRESS_3
    mov ebp, dword [LINK_ADDRESS_4]
    sub ebp, 4
    mov dword [LINK_ADDRESS_4], ebp
    mov edx, dword [ebp]
    mov eax, dword [LINK_ADDRESS_1]
    xor ebx, ebx
    mov dword [edx*4 + LINK_ADDRESS_23], eax
    jmp near loc_048a
loc_0400:
    mov eax, dword [LINK_ADDRESS_1]
    lea edx, [ebx*4]
    mov dword [edx + eax], 0
    cmp ebx, 3
    jne short loc_044c
    xor ebx, ebx
loc_041a:
    call LINK_ADDRESS_17
    cmp eax, -1
    jne short loc_043c
    call LINK_ADDRESS_3
    mov edi, dword [LINK_ADDRESS_4]
    sub edi, 4
    mov dword [LINK_ADDRESS_4], edi
    or ebx, dword [edi]
    jmp short loc_041a
loc_043c:
    mov eax, dword [LINK_ADDRESS_4]
    mov dword [eax], ebx
    add dword [LINK_ADDRESS_4], 4
    jmp short loc_0493
loc_044c:
    call LINK_ADDRESS_17
    test eax, eax
    jl short loc_0473
    mov eax, 4
    sub eax, ebx
    mov ecx, dword [LINK_ADDRESS_4]
    lea eax, [eax*4]
    add ecx, eax
    mov dword [LINK_ADDRESS_4], ecx
    jmp short loc_0493
loc_0473:
    call LINK_ADDRESS_3
    mov eax, dword [LINK_ADDRESS_4]
    mov ecx, dword [LINK_ADDRESS_1]
    mov eax, dword [eax - 4]
    inc ebx
    mov dword [ecx + edx], eax
loc_048a:
    cmp ebx, 4
    jl near loc_0400
loc_0493:
    xor cl, cl
    xor dl, dl
    mov byte [LINK_ADDRESS_24], cl
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp byte [LINK_ADDRESS_2], 0
    je short loc_04d5
    movsx eax, word [LINK_ADDRESS_10]
    push eax
    push LINK_ADDRESS_25
    call PRINTF
    mov bh, byte [LINK_ADDRESS_11]
    inc bh
    add esp, 8
    mov byte [LINK_ADDRESS_11], bh
loc_04d5:
    cmp dword [LINK_ADDRESS_1], 0
    je short loc_0501
    movsx eax, word [LINK_ADDRESS_10]
    push eax
    push LINK_ADDRESS_26
    call PRINTF
    mov cl, byte [LINK_ADDRESS_11]
    inc cl
    add esp, 8
    mov byte [LINK_ADDRESS_11], cl
loc_0501:
    mov ecx, dword [LINK_ADDRESS_4]
    xor edx, edx
    sub ecx, 4
    mov word [LINK_ADDRESS_22], dx
    mov dword [LINK_ADDRESS_4], ecx
    mov dword [LINK_ADDRESS_1], ecx
    call LINK_ADDRESS_3
    mov esi, dword [LINK_ADDRESS_4]
    sub esi, 4
    mov dword [LINK_ADDRESS_4], esi
    mov ebx, dword [esi]
    call LINK_ADDRESS_3
    mov edi, dword [LINK_ADDRESS_4]
    sub edi, 4
    mov dword [LINK_ADDRESS_4], edi
    mov ecx, dword [edi]
    mov edx, dword [LINK_ADDRESS_1]
    mov dword [ecx*4 + LINK_ADDRESS_23], edx
    mov eax, dword [edi]
    mov byte [eax + LINK_ADDRESS_27], bl
    xor ebx, ebx
    jmp near loc_05f1
loc_0567:
    mov eax, dword [LINK_ADDRESS_1]
    lea edx, [ebx*4]
    mov dword [edx + eax], 0
    cmp ebx, 3
    jne short loc_05b3
    xor ebx, ebx
loc_0581:
    call LINK_ADDRESS_17
    cmp eax, -1
    jne short loc_05a3
    call LINK_ADDRESS_3
    mov edx, dword [LINK_ADDRESS_4]
    sub edx, 4
    mov dword [LINK_ADDRESS_4], edx
    or ebx, dword [edx]
    jmp short loc_0581
loc_05a3:
    mov eax, dword [LINK_ADDRESS_4]
    mov dword [eax], ebx
    add dword [LINK_ADDRESS_4], 4
    jmp short loc_05fa
loc_05b3:
    call LINK_ADDRESS_17
    test eax, eax
    jl short loc_05da
    mov eax, 4
    sub eax, ebx
    mov ebp, dword [LINK_ADDRESS_4]
    lea eax, [eax*4]
    add ebp, eax
    mov dword [LINK_ADDRESS_4], ebp
    jmp short loc_05fa
loc_05da:
    call LINK_ADDRESS_3
    mov eax, dword [LINK_ADDRESS_4]
    mov ecx, dword [LINK_ADDRESS_1]
    mov eax, dword [eax - 4]
    inc ebx
    mov dword [ecx + edx], eax
loc_05f1:
    cmp ebx, 4
    jl near loc_0567
loc_05fa:
    xor bl, bl
    xor dl, dl
    mov byte [LINK_ADDRESS_24], bl
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    call LINK_ADDRESS_3
    call LINK_ADDRESS_3
    call LINK_ADDRESS_3
    call LINK_ADDRESS_3
    call LINK_ADDRESS_3
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
    cmp byte [LINK_ADDRESS_24], 0
    je short loc_0677
    mov bh, byte [LINK_ADDRESS_24]
    mov edx, dword [LINK_ADDRESS_4]
    dec bh
    lea ebp, [edx + 4]
    mov byte [LINK_ADDRESS_24], bh
    mov dword [LINK_ADDRESS_4], ebp
    call LINK_ADDRESS_28
    mov eax, dword [LINK_ADDRESS_4]
    mov dword [edx], eax
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
loc_0677:
    movsx eax, word [LINK_ADDRESS_10]
    mov edi, dword [LINK_ADDRESS_4]
    mov bl, byte [LINK_ADDRESS_11]
    push eax
    sub edi, 4
    mov eax, LINK_ADDRESS_29
    inc bl
    push eax
    mov dword [LINK_ADDRESS_4], edi
    mov byte [LINK_ADDRESS_11], bl
    call PRINTF
    add esp, 8
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
    call LINK_ADDRESS_3
    call LINK_ADDRESS_3
    cmp dl, 0x33
    jne short loc_06f7
    xor ebx, ebx
loc_06c9:
    call LINK_ADDRESS_3
    mov eax, dword [LINK_ADDRESS_4]
    sub eax, 4
    mov dword [LINK_ADDRESS_4], eax
    mov edx, dword [eax]
    call LINK_ADDRESS_17
    or ebx, edx
    cmp eax, -1
    je short loc_06c9
    mov eax, dword [LINK_ADDRESS_4]
    mov dword [eax], ebx
    add dword [LINK_ADDRESS_4], 4
loc_06f7:
    mov edx, dword [LINK_ADDRESS_4]
    lea eax, [edx + 4]
    mov dword [LINK_ADDRESS_4], eax
loc_0705:
    call LINK_ADDRESS_17
    mov ebx, eax
    cmp eax, 0x14
    je short loc_0716
    cmp eax, 0x27
    jne short loc_071b
loc_0716:
    call LINK_ADDRESS_28
loc_071b:
    cmp ebx, 0x14
    je short loc_0705
    cmp ebx, 0x27
    je short loc_0705
    call LINK_ADDRESS_28
    mov eax, dword [LINK_ADDRESS_4]
    mov dword [edx], eax
    mov bh, byte [LINK_ADDRESS_24]
    inc bh
    xor dl, dl
    mov byte [LINK_ADDRESS_24], bh
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    inc word [LINK_ADDRESS_22]
loc_0754:
    call LINK_ADDRESS_28
    test al, al
    je short loc_0754
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
    mov bx, word [LINK_ADDRESS_22]
    dec ebx
    mov word [LINK_ADDRESS_22], bx
    test bx, bx
    jge short loc_07a2
    movsx eax, word [LINK_ADDRESS_10]
    push eax
    push LINK_ADDRESS_30
    call PRINTF
    mov dl, byte [LINK_ADDRESS_11]
    inc dl
    add esp, 8
    mov byte [LINK_ADDRESS_11], dl
loc_07a2:
    mov dl, 1
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov edx, dword [LINK_ADDRESS_4]
    sub edx, 4
    xor ebx, ebx
    mov dword [LINK_ADDRESS_4], edx
loc_07c1:
    mov eax, dword [LINK_ADDRESS_31]
    mov cl, byte [eax]
    cmp cl, 0xa
    je short loc_07dc
    inc ebx
    inc eax
    mov byte [ebx + LINK_ADDRESS_32], cl
    mov dword [LINK_ADDRESS_31], eax
    jmp short loc_07c1
loc_07dc:
    xor ch, ch
    xor dl, dl
    mov byte [ebx + LINK_ADDRESS_33], ch
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    sub dword [LINK_ADDRESS_4], 4
loc_07f9:
    mov eax, dword [LINK_ADDRESS_31]
    cmp byte [eax], 0xa
    je near loc_0ebe
    inc eax
    mov dword [LINK_ADDRESS_31], eax
    jmp short loc_07f9
    sub dword [LINK_ADDRESS_4], 4
    call LINK_ADDRESS_3
    mov edx, dword [LINK_ADDRESS_4]
    sub edx, 4
    mov dword [LINK_ADDRESS_4], edx
    mov ebx, dword [edx]
loc_082c:
    mov ecx, dword [LINK_ADDRESS_31]
    cmp byte [ecx], 0x20
    jne short loc_0840
    inc ecx
    mov dword [LINK_ADDRESS_31], ecx
    jmp short loc_082c
loc_0840:
    xor ecx, ecx
loc_0842:
    mov eax, dword [LINK_ADDRESS_31]
    mov dl, byte [eax]
    cmp dl, 0xa
    je short loc_08b2
    mov al, dl
    and eax, 0xff
    call TOUPPER
    inc ecx
    mov edx, eax
    mov eax, ebx
    mov edi, dword [LINK_ADDRESS_31]
    shl eax, 5
    inc edi
    add eax, ebx
    mov dword [LINK_ADDRESS_31], edi
    mov byte [ecx + eax + LINK_ADDRESS_35], dl
    cmp ecx, 0x20
    jl short loc_0842
    movsx eax, word [LINK_ADDRESS_10]
    push eax
    push LINK_ADDRESS_36
    call PRINTF
    mov dh, byte [LINK_ADDRESS_11]
    inc dh
    add esp, 8
    mov byte [LINK_ADDRESS_11], dh
loc_08a0:
    mov eax, dword [LINK_ADDRESS_31]
    cmp byte [eax], 0xa
    je short loc_08b2
    inc eax
    mov dword [LINK_ADDRESS_31], eax
    jmp short loc_08a0
loc_08b2:
    mov eax, ebx
    shl eax, 5
    add eax, ebx
    xor dh, dh
    mov byte [ecx + eax + LINK_ADDRESS_35], dh
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
    sub dword [LINK_ADDRESS_4], 4
    call LINK_ADDRESS_3
    mov ebp, dword [LINK_ADDRESS_4]
    sub ebp, 4
    mov dword [LINK_ADDRESS_4], ebp
    mov ebx, dword [ebp]
loc_08ee:
    mov ecx, dword [LINK_ADDRESS_31]
    cmp byte [ecx], 0x20
    jne short loc_0902
    inc ecx
    mov dword [LINK_ADDRESS_31], ecx
    jmp short loc_08ee
loc_0902:
    xor ecx, ecx
loc_0904:
    mov eax, dword [LINK_ADDRESS_31]
    mov dl, byte [eax]
    cmp dl, 0xa
    je short loc_0974
    mov al, dl
    and eax, 0xff
    call TOUPPER
    inc ecx
    mov edx, eax
    mov eax, ebx
    mov esi, dword [LINK_ADDRESS_31]
    shl eax, 5
    inc esi
    add eax, ebx
    mov dword [LINK_ADDRESS_31], esi
    mov byte [ecx + eax + LINK_ADDRESS_37], dl
    cmp ecx, 0x20
    jl short loc_0904
    movsx eax, word [LINK_ADDRESS_10]
    push eax
    push LINK_ADDRESS_38
    call PRINTF
    mov dh, byte [LINK_ADDRESS_11]
    inc dh
    add esp, 8
    mov byte [LINK_ADDRESS_11], dh
loc_0962:
    mov eax, dword [LINK_ADDRESS_31]
    cmp byte [eax], 0xa
    je short loc_0974
    inc eax
    mov dword [LINK_ADDRESS_31], eax
    jmp short loc_0962
loc_0974:
    mov eax, ebx
    shl eax, 5
    add eax, ebx
    xor dh, dh
    mov byte [ecx + eax + LINK_ADDRESS_37], dh
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
    sub dword [LINK_ADDRESS_4], 4
    call LINK_ADDRESS_3
    mov edx, dword [LINK_ADDRESS_4]
    sub edx, 4
    mov dword [LINK_ADDRESS_4], edx
    mov ebx, dword [edx]
    call LINK_ADDRESS_3
    mov ecx, dword [LINK_ADDRESS_4]
    sub ecx, 4
    mov dword [LINK_ADDRESS_4], ecx
    mov edi, dword [ecx]
loc_09c5:
    mov ecx, dword [LINK_ADDRESS_31]
    cmp byte [ecx], 0x20
    jne short loc_09d9
    inc ecx
    mov dword [LINK_ADDRESS_31], ecx
    jmp short loc_09c5
loc_09d9:
    xor ecx, ecx
loc_09db:
    mov eax, dword [LINK_ADDRESS_31]
    mov dl, byte [eax]
    cmp dl, 0x20
    je short loc_0a3f
    cmp dl, 0xa
    je short loc_0a3f
    imul edx, ebx, 0xb
    add edx, edi
    shl edx, 7
    inc eax
    lea esi, [edx + ecx]
    inc ecx
    mov dl, byte [eax - 1]
    mov dword [LINK_ADDRESS_31], eax
    mov byte [esi + LINK_ADDRESS_39], dl
    cmp ecx, 0x7f
    jle short loc_09db
    movsx eax, word [LINK_ADDRESS_10]
    push eax
    push LINK_ADDRESS_40
    call PRINTF
    mov al, byte [LINK_ADDRESS_11]
    inc al
    add esp, 8
    mov byte [LINK_ADDRESS_11], al
loc_0a2d:
    mov eax, dword [LINK_ADDRESS_31]
    cmp byte [eax], 0x20
    je short loc_0a3f
    inc eax
    mov dword [LINK_ADDRESS_31], eax
    jmp short loc_0a2d
loc_0a3f:
    imul eax, ebx, 0xb
    lea edx, [eax + edi]
    mov eax, edx
    shl eax, 5
    add eax, edx
    xor dh, dh
    mov byte [ecx + eax + LINK_ADDRESS_41], dh
loc_0a55:
    mov eax, dword [LINK_ADDRESS_31]
    cmp byte [eax], 0x20
    jne short loc_0a67
    inc eax
    mov dword [LINK_ADDRESS_31], eax
    jmp short loc_0a55
loc_0a67:
    xor edx, edx
    mov dl, byte [eax + 3]
    lea ecx, [edx - 0x30]
    lea edx, [ecx*4]
    add ecx, edx
    xor edx, edx
    mov dl, byte [eax + 4]
    add ecx, ecx
    sub edx, 0x30
    add edx, ecx
    imul esi, edx, 0x1a
    xor edx, edx
    mov dl, byte [eax]
    lea ecx, [edx - 0x30]
    lea edx, [ecx*4]
    add edx, ecx
    xor ecx, ecx
    mov cl, byte [eax + 1]
    add edx, edx
    sub ecx, 0x30
    add ecx, edx
    lea edx, [ecx*4]
    sub edx, ecx
    lea edx, [edx*8]
    mov ecx, edx
    shl edx, 6
    add edx, ecx
    add esi, edx
    imul edx, ebx, 0xb
    add eax, 5
    add edx, edi
    mov dword [LINK_ADDRESS_31], eax
    mov dword [edx*4 + LINK_ADDRESS_42], esi
loc_0ad0:
    mov eax, dword [LINK_ADDRESS_31]
    cmp byte [eax], 0x20
    jne short loc_0ae2
    inc eax
    mov dword [LINK_ADDRESS_31], eax
    jmp short loc_0ad0
loc_0ae2:
    xor ecx, ecx
    mov cl, byte [eax + 3]
    sub ecx, 0x30
    lea edx, [ecx*4]
    add ecx, edx
    xor edx, edx
    mov dl, byte [eax + 4]
    add ecx, ecx
    sub edx, 0x30
    add edx, ecx
    imul esi, edx, 0x1a
    xor edx, edx
    mov dl, byte [eax]
    lea ecx, [edx - 0x30]
    lea edx, [ecx*4]
    add ecx, edx
    xor edx, edx
    mov dl, byte [eax + 1]
    add ecx, ecx
    sub edx, 0x30
    add ecx, edx
    lea edx, [ecx*4]
    sub edx, ecx
    lea edx, [edx*8]
    mov ecx, edx
    shl edx, 6
    add edx, ecx
    add esi, edx
    imul edx, ebx, 0xb
    add eax, 5
    add edx, edi
    mov dword [LINK_ADDRESS_31], eax
    mov dword [edx*4 + LINK_ADDRESS_43], esi
loc_0b4b:
    mov ecx, dword [LINK_ADDRESS_31]
    cmp byte [ecx], 0x20
    jne short loc_0b5f
    inc ecx
    mov dword [LINK_ADDRESS_31], ecx
    jmp short loc_0b4b
loc_0b5f:
    xor ecx, ecx
loc_0b61:
    mov eax, dword [LINK_ADDRESS_31]
    mov dl, byte [eax]
    cmp dl, 0xa
    je short loc_0bd5
    mov al, dl
    and eax, 0xff
    call TOUPPER
    mov edx, eax
    imul eax, ebx, 0xb
    lea esi, [eax + edi]
    mov eax, esi
    shl eax, 5
    add eax, esi
    mov byte [ecx + eax + LINK_ADDRESS_44], dl
    mov eax, dword [LINK_ADDRESS_31]
    inc eax
    inc ecx
    mov dword [LINK_ADDRESS_31], eax
    cmp ecx, 0x20
    jl short loc_0b61
    movsx eax, word [LINK_ADDRESS_10]
    push eax
    push LINK_ADDRESS_45
    call PRINTF
    mov dh, byte [LINK_ADDRESS_11]
    inc dh
    add esp, 8
    mov byte [LINK_ADDRESS_11], dh
loc_0bc3:
    mov eax, dword [LINK_ADDRESS_31]
    cmp byte [eax], 0xa
    je short loc_0bd5
    inc eax
    mov dword [LINK_ADDRESS_31], eax
    jmp short loc_0bc3
loc_0bd5:
    imul edx, ebx, 0xb
    add edx, edi
    mov eax, edx
    shl eax, 5
    add eax, edx
    xor dh, dh
    mov byte [ecx + eax + LINK_ADDRESS_41], dh
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
    sub dword [LINK_ADDRESS_4], 4
    call LINK_ADDRESS_3
    mov edi, dword [LINK_ADDRESS_4]
    mov edi, dword [edi - 4]
    cmp edi, 0xc0
    jl short loc_0c3d
    push 0xc0
    movsx eax, word [LINK_ADDRESS_10]
    push eax
    push LINK_ADDRESS_46
    call PRINTF
    mov ch, byte [LINK_ADDRESS_11]
    inc ch
    add esp, 0xc
    mov byte [LINK_ADDRESS_11], ch
loc_0c3d:
    mov eax, dword [LINK_ADDRESS_4]
    sub eax, 4
    xor ecx, ecx
    mov dword [LINK_ADDRESS_4], eax
loc_0c4c:
    mov eax, dword [LINK_ADDRESS_31]
    cmp byte [eax], 0x20
    jne short loc_0c5e
    inc eax
    mov dword [LINK_ADDRESS_31], eax
    jmp short loc_0c4c
loc_0c5e:
    mov eax, dword [LINK_ADDRESS_31]
    cmp byte [eax], 0xa
    je short loc_0cba
    mov edx, edi
    shl edx, 6
    inc eax
    lea ebx, [edx + ecx]
    inc ecx
    mov dl, byte [eax - 1]
    mov dword [LINK_ADDRESS_31], eax
    mov byte [ebx + LINK_ADDRESS_47], dl
    cmp ecx, 0x40
    jl short loc_0c5e
    movsx eax, word [LINK_ADDRESS_10]
    push eax
    push LINK_ADDRESS_48
    call PRINTF
    mov dh, byte [LINK_ADDRESS_11]
    inc dh
    add esp, 8
    mov byte [LINK_ADDRESS_11], dh
loc_0ca8:
    mov eax, dword [LINK_ADDRESS_31]
    cmp byte [eax], 0xa
    je short loc_0cba
    inc eax
    mov dword [LINK_ADDRESS_31], eax
    jmp short loc_0ca8
loc_0cba:
    shl edi, 6
    xor bh, bh
    xor dl, dl
    mov byte [ecx + edi + LINK_ADDRESS_47], bh
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    sub dword [LINK_ADDRESS_4], 4
    call LINK_ADDRESS_3
    mov edi, dword [LINK_ADDRESS_4]
    mov edi, dword [edi - 4]
    cmp edi, 0x1c2
    jl short loc_0d17
    push 0x1c2
    movsx eax, word [LINK_ADDRESS_10]
    push eax
    push LINK_ADDRESS_49
    call PRINTF
    mov al, byte [LINK_ADDRESS_11]
    inc al
    add esp, 0xc
    mov byte [LINK_ADDRESS_11], al
loc_0d17:
    mov ebp, dword [LINK_ADDRESS_4]
    sub ebp, 4
    xor ecx, ecx
    mov dword [LINK_ADDRESS_4], ebp
loc_0d28:
    mov eax, dword [LINK_ADDRESS_31]
    cmp byte [eax], 0x20
    jne short loc_0d3a
    inc eax
    mov dword [LINK_ADDRESS_31], eax
    jmp short loc_0d28
loc_0d3a:
    mov edx, dword [LINK_ADDRESS_31]
    mov bl, byte [edx]
    cmp bl, 0x20
    je short loc_0da5
    lea eax, [edi*8]
    inc edx
    sub eax, edi
    inc ecx
    add eax, eax
    mov dword [LINK_ADDRESS_31], edx
    mov byte [ecx + eax + LINK_ADDRESS_50], bl
    cmp ecx, 0xd
    jl short loc_0d3a
    add eax, LINK_ADDRESS_51
    call LINK_ADDRESS_52
    movsx eax, word [LINK_ADDRESS_10]
    push eax
    push LINK_ADDRESS_53
    call PRINTF
    mov bh, byte [LINK_ADDRESS_11]
    inc bh
    add esp, 8
    mov byte [LINK_ADDRESS_11], bh
loc_0d93:
    mov eax, dword [LINK_ADDRESS_31]
    cmp byte [eax], 0x20
    je short loc_0da5
    inc eax
    mov dword [LINK_ADDRESS_31], eax
    jmp short loc_0d93
loc_0da5:
    lea eax, [edi*8]
    sub eax, edi
    xor dh, dh
    mov byte [ecx + eax*2 + LINK_ADDRESS_51], dh
    call LINK_ADDRESS_3
    mov eax, dword [LINK_ADDRESS_4]
    sub eax, 4
    mov bx, word [eax]
    mov dword [LINK_ADDRESS_4], eax
    mov word [nosplit edi*2 + LINK_ADDRESS_54], bx
    call LINK_ADDRESS_3
    mov eax, dword [LINK_ADDRESS_4]
    sub eax, 4
    mov bx, word [eax]
    mov dword [LINK_ADDRESS_4], eax
    mov word [nosplit edi*2 + LINK_ADDRESS_55], bx
    call LINK_ADDRESS_3
    mov eax, dword [LINK_ADDRESS_4]
    sub eax, 4
    mov bl, byte [eax]
    mov dword [LINK_ADDRESS_4], eax
    mov byte [edi + LINK_ADDRESS_56], bl
    call LINK_ADDRESS_3
    mov eax, dword [LINK_ADDRESS_4]
    sub eax, 4
    mov bl, byte [eax]
    mov dword [LINK_ADDRESS_4], eax
    mov byte [edi + LINK_ADDRESS_57], bl
    call LINK_ADDRESS_3
    mov eax, dword [LINK_ADDRESS_4]
    sub eax, 4
    xor dl, dl
    mov bx, word [eax]
    mov dword [LINK_ADDRESS_4], eax
    mov word [nosplit edi*2 + LINK_ADDRESS_58], bx
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp dword [LINK_ADDRESS_1], 0
    jne short loc_0e7d
    movsx eax, word [LINK_ADDRESS_10]
    push eax
    mov eax, LINK_ADDRESS_59
    push eax
    call PRINTF
    mov ch, byte [LINK_ADDRESS_11]
    inc ch
    add esp, 8
    mov byte [LINK_ADDRESS_11], ch
loc_0e7d:
    cmp word [LINK_ADDRESS_22], 0
    jle short loc_0ea8
    movsx eax, word [LINK_ADDRESS_10]
    push eax
    push LINK_ADDRESS_60
    call PRINTF
    mov al, byte [LINK_ADDRESS_11]
    inc al
    add esp, 8
    mov byte [LINK_ADDRESS_11], al
loc_0ea8:
    xor ecx, ecx
    xor dl, dl
    mov dword [LINK_ADDRESS_1], ecx
    mov al, dl
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0ebe:
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
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push edx
loc_0ed6:
    call LINK_ADDRESS_28
    test al, al
    je short loc_0ed6
    xor edx, edx
    xor eax, eax
    mov dl, byte [LINK_ADDRESS_11]
    mov al, byte [LINK_ADDRESS_14]
    add eax, edx
    cmp eax, 0xc
    jle short loc_0eff
    mov eax, LINK_ADDRESS_61
    call LINK_ADDRESS_52
loc_0eff:
    pop edx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    xor edx, edx
    mov dword [esp], edx
    jmp near loc_0f96
loc_0f18:
    mov edx, 1
    mov eax, dword [ebx*4 + LINK_ADDRESS_62]
    call KOPEN4LOAD
    mov edx, LINK_ADDRESS_64
    mov esi, eax
    mov eax, dword [ebx*4 + LINK_ADDRESS_62]
    call FOPEN
    mov edi, eax
    test esi, esi
    jne short loc_0f49
    cmp eax, -1
    jne short loc_0f93
    jmp short loc_0f8e
loc_0f49:
    cmp eax, -1
    jne short loc_0f5b
    test esi, esi
    jne short loc_0f93
    mov eax, esi
    call KCLOSE
    jmp short loc_0f93
loc_0f5b:
    mov eax, esi
    mov edx, LINK_ADDRESS_67
    call KFILELENGTH
    mov ebp, eax
    mov ebx, eax
    mov eax, esi
    mov ecx, edi
    call KREAD
    mov ebx, 1
    mov eax, LINK_ADDRESS_67
    mov edx, ebp
    call FWRITE
    mov eax, esi
    call KCLOSE
    mov eax, edi
loc_0f8e:
    call FCLOSE
loc_0f93:
    inc dword [esp]
loc_0f96:
    mov ebx, dword [esp]
    cmp ebx, 3
    jl near loc_0f18
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
