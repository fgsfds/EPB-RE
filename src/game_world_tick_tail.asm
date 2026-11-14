; Complete the world tick and sprite interaction pass.
bits 32
org START_ADDRESS

    mov eax, dword [esp]
    mov ebx, dword [ebp]
    mov ecx, dword [ebp + 4]
    sub ebx, eax
    sub ecx, edi
    mov dword [ebp], ebx
    mov eax, dword [esp + 0x34]
    mov dword [ebp + 4], ecx
    mov dword [eax], 0
    movsx edx, word [esp + 0x48]
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_1
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
    movsx esi, word [ebp + 0x18]
    movsx esi, word [nosplit esi*2 + HEADSPRITESECT]
loc_0040:
    test esi, esi
    jl near loc_00f0
    mov ax, word [nosplit esi*2 + NEXTSPRITESECT]
    mov dword [esp + 0x40], eax
    imul eax, esi, 0x2c
    mov dx, word [eax + LINK_ADDRESS_5]
    mov dword [esp + 0x24], eax
    cmp dx, 3
    je near loc_00e6
    cmp word [eax + LINK_ADDRESS_6], 0
    jne short loc_00e6
    mov edx, dword [esp + 0x24]
    mov eax, dword [esp]
    mov ebx, dword [edx + SPRITE]
    mov ecx, dword [edx + LINK_ADDRESS_8]
    add ebx, eax
    add ecx, edi
    mov dword [edx + SPRITE], ebx
    mov dword [edx + LINK_ADDRESS_8], ecx
    mov eax, esi
    mov ecx, dword [edx + LINK_ADDRESS_9]
    mov ebx, dword [edx + LINK_ADDRESS_8]
    mov edx, dword [edx + SPRITE]
    call LINK_ADDRESS_10
    mov edx, dword [esp + 0x24]
    movsx edx, word [edx + LINK_ADDRESS_11]
    lea eax, [edx*4]
    add eax, edx
    test byte [eax*8 + LINK_ADDRESS_12], 2
    je short loc_00e6
    mov eax, dword [esp + 0x24]
    cmp word [eax + LINK_ADDRESS_5], 2
    jne short loc_00e6
    movsx eax, si
    call LINK_ADDRESS_13
loc_00e6:
    movsx esi, word [esp + 0x40]
    jmp near loc_0040
loc_00f0:
    mov eax, dword [esp + 0x34]
    mov eax, dword [eax + 4]
    shl eax, 5
    mov esi, dword [esp]
    mov ebx, dword [eax + LINK_ADDRESS_14]
    mov edx, dword [eax + WALL]
    mov eax, dword [esp + 0x34]
    add ebx, edi
    add edx, esi
    movsx eax, word [eax + 4]
    call LINK_ADDRESS_16
    mov eax, dword [esp + 0x34]
    mov eax, dword [eax + 8]
    shl eax, 5
    mov ebx, dword [eax + LINK_ADDRESS_14]
    mov edx, dword [eax + WALL]
    add edx, dword [esp]
    mov eax, dword [esp + 0x34]
    add ebx, edi
    movsx eax, word [eax + 8]
    call LINK_ADDRESS_16
    mov ax, word [CONNECTHEAD]
    jmp near loc_01de
loc_014d:
    movsx eax, si
    mov edx, eax
    shl edx, 7
    sub edx, eax
    lea edx, [edx*4]
    sub edx, eax
    add edx, edx
    mov bx, word [ebp + 0x18]
    cmp bx, word [edx + LINK_ADDRESS_18]
    jne short loc_01d1
    cmp byte [edx + LINK_ADDRESS_19], 0
    je short loc_01d1
    mov eax, dword [esp]
    mov esi, dword [edx + LINK_ADDRESS_20]
    add esi, eax
    mov eax, dword [edx + LINK_ADDRESS_21]
    mov dword [edx + LINK_ADDRESS_20], esi
    add eax, edi
    mov dword [edx + LINK_ADDRESS_21], eax
    mov eax, dword [edx + LINK_ADDRESS_20]
    mov ecx, dword [edx + LINK_ADDRESS_22]
    mov dword [edx + LINK_ADDRESS_23], eax
    add ecx, 0x2600
    mov eax, dword [edx + LINK_ADDRESS_21]
    mov esi, dword [edx + LINK_ADDRESS_20]
    mov dword [edx + LINK_ADDRESS_24], eax
    mov ebx, eax
    movsx eax, word [edx + LINK_ADDRESS_25]
    mov edx, esi
    call LINK_ADDRESS_10
loc_01d1:
    movsx eax, word [esp + 0x50]
    mov ax, word [nosplit eax*2 + CONNECTPOINT2]
loc_01de:
    mov dword [esp + 0x50], eax
    mov esi, dword [esp + 0x50]
    test si, si
    jge near loc_014d
    mov edx, dword [esp]
    mov ebx, dword [esp + 0x38]
    xor eax, eax
    sar edx, 3
    mov al, byte [ebx + 0x1e]
    sub eax, edx
    mov byte [ebx + 0x1e], al
    xor eax, eax
    sar edi, 3
    mov al, byte [ebx + 0x1f]
    sub eax, edi
    mov byte [ebx + 0x1f], al
    mov edx, dword [esp]
    xor eax, eax
    sar edx, 3
    mov al, byte [ebx + 0x16]
    sub eax, edx
    mov byte [ebx + 0x16], al
    xor eax, eax
    mov al, byte [ebx + 0x17]
    sub eax, edi
    mov byte [ebx + 0x17], al
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
    cmp dword [eax], 0
    je near loc_1df9
    cmp word [ebp + 0x1c], 0x600
    jne short loc_024d
    mov edi, dword [esp + 0x38]
    add edi, 4
    jmp short loc_0254
loc_024d:
    mov edi, dword [esp + 0x38]
    add edi, 8
loc_0254:
    mov eax, dword [esp + 0x34]
    cmp dword [eax], 1
    jne short loc_028b
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov ebx, dword [ebp + 8]
    mov ecx, dword [edi]
    mov dx, word [eax + LINK_ADDRESS_27]
    sub ebx, ecx
    shl edx, 4
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    imul eax, edx
    mov word [ebp + 0x24], ax
    mov eax, dword [esp + 0x34]
    inc dword [eax]
loc_028b:
    mov eax, dword [esp + 0x38]
    mov dx, word [eax + 0x26]
    test dx, dx
    jne short loc_02d0
    movsx eax, word [ebp + 0x24]
    mov edx, dword [edi]
    add edx, eax
    mov dword [edi], edx
    mov eax, edx
    sub eax, dword [ebp + 8]
    test eax, eax
    jns short loc_02ad
    neg eax
loc_02ad:
    cmp eax, 0x400
    jge near loc_1df9
    mov eax, dword [ebp + 8]
    mov dword [edi], eax
    movsx eax, word [esp + 0x48]
    call LINK_ADDRESS_28
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_02d0:
    mov ebx, edx
    dec ebx
    mov word [eax + 0x26], bx
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
    cmp dword [eax + 4], 0
    je near loc_1df9
    mov edx, dword [eax]
    lea eax, [edx*4]
    add edx, eax
    mov eax, SECTOR
    lea edx, [edx*8]
    add eax, edx
    add eax, 4
    call LINK_ADDRESS_30
    test eax, eax
    jl short loc_0330
    mov edx, dword [esp + 0x38]
    movsx edx, word [edx + 0x26]
    lea eax, [edx*8]
    add eax, edx
    mov edx, dword [esp + 0x38]
    add dword [edx + 4], eax
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_0330:
    mov eax, dword [esp + 0x34]
    mov dword [eax + 4], 0
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
    mov eax, dword [esp + 0x34]
    cmp dword [eax + 0x10], 0
    jne near loc_1df9
    movsx eax, word [ebp + 0x1c]
    add eax, 0x200
    and eax, 0x7ff
    movsx edx, word [nosplit eax*2 + SINTABLE]
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_27]
    imul edx, eax
    sar edx, 0x12
    mov dword [esp], edx
    mov dx, word [ebp + 0x1c]
    and dh, 7
    movsx edx, dx
    mov edi, eax
    movsx edx, word [nosplit edx*2 + SINTABLE]
    imul edi, edx
    xor esi, esi
    mov dword [esp + 0x4c], esi
    movsx eax, word [ebp + 0x18]
    movsx esi, word [nosplit eax*2 + HEADSPRITESECT]
    sar edi, 0x12
loc_03ac:
    test esi, esi
    jl near loc_05cc
    imul edx, esi, 0x2c
    mov ax, word [nosplit esi*2 + NEXTSPRITESECT]
    mov cx, word [edx + LINK_ADDRESS_6]
    mov dword [esp + 0x40], eax
    test cx, cx
    jl near loc_05c2
    mov ax, word [edx + LINK_ADDRESS_5]
    db 0x66, 0x3d, 0x05, 0x00    ; cmp ax, 5
    jb short loc_03f1
    jbe short loc_0400
    db 0x66, 0x3d, 0x06, 0x00    ; cmp ax, 6
    je near loc_0462
    jmp near loc_05c2
loc_03f1:
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jbe near loc_0474
    jmp near loc_05c2
loc_0400:
    mov ax, word [edx + LINK_ADDRESS_32]
    cmp ax, 0x4ca
    jb short loc_042d
    jbe short loc_0447
    cmp ax, 0xa07
    jb short loc_041f
    jbe short loc_0458
    cmp ax, 0x1125
    je short loc_0447
    jmp short loc_0462
loc_041f:
    cmp ax, 0x8f8
    jb short loc_0462
    cmp ax, 0x8fb
    jbe short loc_0447
    jmp short loc_0462
loc_042d:
    cmp ax, 0x2a0
    jb short loc_0441
    cmp ax, 0x2a2
    jbe short loc_0447
    cmp ax, 0x3b8
    je short loc_0447
    jmp short loc_0462
loc_0441:
    cmp ax, 0x226
    jne short loc_0462
loc_0447:
    imul esi, esi, 0x2c
    xor ch, ch
    mov byte [esi + LINK_ADDRESS_33], ch
    mov byte [esi + LINK_ADDRESS_34], ch
loc_0458:
    movsx esi, word [esp + 0x40]
    jmp near loc_03ac
loc_0462:
    imul eax, esi, 0x2c
    cmp word [eax + LINK_ADDRESS_32], 0xa06
    je near loc_05c2
loc_0474:
    imul edx, esi, 0x2c
    mov bx, word [edx + LINK_ADDRESS_32]
    cmp bx, 0x27a
    je near loc_05c2
    cmp bx, 0x27b
    je near loc_05c2
    cmp bx, 0x27c
    je near loc_05c2
    cmp bx, 0x27d
    je near loc_05c2
    cmp bx, 0x11ad
    je near loc_05c2
    cmp bx, 0x11ae
    je near loc_05c2
    cmp bx, 0x11af
    je near loc_05c2
    cmp bx, 0x11b0
    je near loc_05c2
    movsx eax, si
    call LINK_ADDRESS_35
    test al, al
    jne near loc_05c2
    mov ax, word [edx + LINK_ADDRESS_32]
    cmp ax, 0x4c6
    jl short loc_04fd
    cmp ax, 0x4c9
    jle near loc_05c2
loc_04fd:
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    imul ebx, esi, 0x2c
    mov edx, dword [eax + LINK_ADDRESS_36]
    sub edx, 0x1000
    mov ecx, dword [ebx + LINK_ADDRESS_9]
    mov dword [esp + 0x28], ebx
    cmp edx, ecx
    jge near loc_05c2
    mov edx, dword [ebx + SPRITE]
    mov dword [eax + LINK_ADDRESS_37], edx
    mov edx, dword [ebx + LINK_ADDRESS_8]
    mov dword [eax + LINK_ADDRESS_38], edx
    mov eax, dword [esp]
    mov edx, ebx
    sar eax, 2
    mov ebx, dword [ebx + SPRITE]
    add ebx, eax
    mov eax, edi
    mov ecx, dword [edx + LINK_ADDRESS_8]
    sar eax, 2
    mov dword [edx + SPRITE], ebx
    add ecx, eax
    mov ebx, edx
    mov dword [edx + LINK_ADDRESS_8], ecx
    mov ecx, edx
    mov eax, esi
    mov ebx, dword [ebx + LINK_ADDRESS_8]
    mov ecx, dword [ecx + LINK_ADDRESS_9]
    mov edx, dword [edx + SPRITE]
    call LINK_ADDRESS_10
    mov edx, dword [esp + 0x28]
    movsx edx, word [edx + LINK_ADDRESS_11]
    lea eax, [edx*4]
    add eax, edx
    test byte [eax*8 + LINK_ADDRESS_12], 2
    je short loc_05c2
    mov eax, dword [esp + 0x28]
    cmp word [eax + LINK_ADDRESS_5], 2
    jne short loc_05c2
    movsx eax, si
    call LINK_ADDRESS_13
loc_05c2:
    movsx esi, word [esp + 0x40]
    jmp near loc_03ac
loc_05cc:
    mov ax, word [MYCONNECTINDEX]
    movsx edx, ax
    mov dword [esp + 0x50], eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov bx, word [ebp + 0x18]
    cmp bx, word [edx + LINK_ADDRESS_18]
    jne short loc_0646
    cmp byte [edx + LINK_ADDRESS_19], 0
    je short loc_0646
    mov eax, dword [edx + LINK_ADDRESS_22]
    sub eax, dword [edx + LINK_ADDRESS_40]
    test eax, eax
    jns short loc_0614
    neg eax
loc_0614:
    cmp eax, 0x2f00
    jge short loc_0646
    mov eax, dword [esp]
    mov ebp, dword [LINK_ADDRESS_41]
    lea eax, [eax*8]
    lea edi, [edi*8]
    add ebp, eax
    mov eax, dword [LINK_ADDRESS_42]
    add eax, edi
    mov dword [LINK_ADDRESS_41], ebp
    mov dword [LINK_ADDRESS_42], eax
loc_0646:
    movsx edx, word [esp + 0x48]
    imul edx, edx, 0x2c
    mov ebx, dword [esp + 0x38]
    xor eax, eax
    movsx edx, word [edx + LINK_ADDRESS_27]
    mov al, byte [ebx + 0x1e]
    sar edx, 7
    add eax, edx
    mov byte [ebx + 0x1e], al
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
    mov eax, dword [edx + 4]
    cmp eax, dword [ebp + 8]
    jle near loc_071d
    movsx edi, word [esp + 0x48]
    xor esi, esi
    jmp near loc_0714
loc_0687:
    call LINK_ADDRESS_43
    and ah, 1
    mov dx, word [ebp + 0x1c]
    add edx, eax
    mov eax, edi
    mov word [ebp + 0x1c], dx
    mov edx, 0x919
    call LINK_ADDRESS_44
    mov dword [esp + 0x4c], eax
    call LINK_ADDRESS_43
    mov edx, eax
    xor dh, ah
    movsx eax, word [esp + 0x4c]
    imul ebx, eax, 0x2c
    and dl, 0x7f
    add edx, 0x60
    mov word [ebx + LINK_ADDRESS_45], dx
    mov edx, 0x10001
    call LINK_ADDRESS_46
    movsx eax, word [esp + 0x4c]
    mov dword [esp + 0x10], eax
    imul eax, eax, 0x2c
    mov ecx, dword [eax + LINK_ADDRESS_9]
    mov ebx, dword [eax + LINK_ADDRESS_8]
    mov edx, dword [eax + SPRITE]
    mov eax, dword [esp + 0x10]
    call LINK_ADDRESS_10
    call LINK_ADDRESS_43
    sar eax, 8
    cmp eax, 0xef
    jl short loc_0713
    mov edx, 0x762
    mov eax, edi
    call LINK_ADDRESS_44
loc_0713:
    inc esi
loc_0714:
    cmp esi, 8
    jl near loc_0687
loc_071d:
    mov eax, dword [esp + 0x34]
    mov eax, dword [eax]
    test eax, eax
    jbe short loc_0735
    cmp eax, 1
    je short loc_0773
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_0735:
    mov edx, dword [esp + 0x38]
    movsx eax, word [ebp + 0x22]
    mov esi, dword [edx + 4]
    add esi, eax
    mov edi, dword [edx + 8]
    mov dword [edx + 4], esi
    cmp esi, edi
    jle short loc_074f
    mov dword [edx + 8], esi
loc_074f:
    mov eax, dword [ebp + 8]
    mov edx, dword [esp + 0x38]
    add eax, 0x2000
    cmp eax, dword [edx + 4]
    jge near loc_1df9
    mov eax, dword [esp + 0x34]
    inc dword [eax]
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_0773:
    movsx eax, word [ebp + 0x22]
    mov edx, dword [esp + 0x38]
    lea eax, [eax*4]
    mov ebx, dword [edx + 4]
    sub ebx, eax
    mov dword [edx + 4], ebx
    mov edx, dword [esp + 0x34]
    mov ecx, dword [edx + 0x10]
    cmp ebx, ecx
    jge near loc_1df9
    mov edx, dword [esp + 0x38]
    mov eax, dword [esp + 0x34]
    mov dword [edx + 4], ecx
    mov dword [eax], 0
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
    cmp dword [eax + 0x10], 0
    je near loc_1df9
    mov eax, dword [edx + 8]
    mov edi, dword [edx + 4]
    cmp eax, edi
    jg short loc_07cd
    mov byte [ebp + 0x10], 0
    jmp short loc_07da
loc_07cd:
    mov edx, dword [esp + 0x34]
    cmp edi, dword [edx + 0xc]
    jg short loc_07da
    mov byte [ebp + 0x10], 1
loc_07da:
    cmp byte [ebp + 0x10], 0
    je short loc_0815
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov edx, dword [esp + 0x38]
    movsx eax, word [eax + LINK_ADDRESS_27]
    mov edi, dword [edx + 4]
    shl eax, 4
    add edi, eax
    mov ebp, dword [edx + 8]
    mov dword [edx + 4], edi
    cmp edi, ebp
    jle near loc_1df9
    mov dword [edx + 4], ebp
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_0815:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov edx, dword [esp + 0x38]
    movsx eax, word [eax + LINK_ADDRESS_27]
    mov ecx, dword [edx + 4]
    shl eax, 4
    sub ecx, eax
    mov dword [edx + 4], ecx
    mov edx, dword [esp + 0x34]
    mov esi, dword [edx + 0xc]
    cmp ecx, esi
    jge near loc_1df9
    mov edx, dword [esp + 0x38]
    mov dword [edx + 4], esi
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
    movsx edi, word [ebp + 0x1c]
    add edi, 0x200
    mov word [ebp + 0x20], 0x20
    and edi, 0x7ff
    movsx edx, word [ebp + 0x20]
    movsx edi, word [nosplit edi*2 + SINTABLE]
    imul edi, edx
    mov ax, word [ebp + 0x1c]
    and ah, 7
    cwde
    movsx eax, word [nosplit eax*2 + SINTABLE]
    movsx edx, word [ebp + 0x20]
    imul eax, edx
    sar eax, 0xe
    mov dword [esp], eax
    mov al, byte [ebp + 0x10]
    inc al
    sar edi, 0xe
    mov byte [ebp + 0x10], al
    cmp al, 7
    jle short loc_08d7
    mov eax, dword [esp + 0x34]
    mov eax, dword [eax + 0xc]
    mov dword [ebp], eax
    mov eax, dword [esp + 0x34]
    mov eax, dword [eax + 0x10]
    mov dword [ebp + 4], eax
    movsx edx, word [ebp + 0x24]
    movsx eax, byte [ebp + 0x10]
    imul edx, eax
    movsx eax, word [ebp + 0x24]
    sub edx, eax
    mov eax, edx
    mov edx, dword [esp + 0x38]
    sub dword [edx + 8], eax
    mov byte [ebp + 0x10], 0
    jmp short loc_08e2
loc_08d7:
    mov edx, dword [esp + 0x38]
    movsx eax, word [ebp + 0x24]
    add dword [edx + 8], eax
loc_08e2:
    movsx eax, word [ebp + 0x18]
    movsx esi, word [nosplit eax*2 + HEADSPRITESECT]
loc_08ee:
    test esi, esi
    jl near loc_0992
    imul edx, esi, 0x2c
    mov ax, word [nosplit esi*2 + NEXTSPRITESECT]
    mov dword [esp + 0x40], eax
    mov ax, word [edx + LINK_ADDRESS_5]
    db 0x66, 0x3d, 0x03, 0x00    ; cmp ax, 3
    je short loc_0988
    db 0x66, 0x3d, 0x0a, 0x00    ; cmp ax, 0xa
    je short loc_0988
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov ebx, dword [edx + SPRITE]
    mov dword [eax + LINK_ADDRESS_37], ebx
    mov ebx, dword [edx + LINK_ADDRESS_8]
    mov ecx, dword [edx + LINK_ADDRESS_8]
    mov dword [eax + LINK_ADDRESS_38], ebx
    mov ebx, dword [edx + SPRITE]
    mov eax, dword [esp]
    add ebx, edi
    add ecx, eax
    mov dword [edx + SPRITE], ebx
    mov dword [edx + LINK_ADDRESS_8], ecx
    movsx eax, word [ebp + 0x24]
    mov ebx, dword [edx + LINK_ADDRESS_9]
    add ebx, eax
    mov ecx, ebx
    mov dword [edx + LINK_ADDRESS_9], ebx
    mov eax, esi
    mov ebx, dword [edx + LINK_ADDRESS_8]
    mov edx, dword [edx + SPRITE]
    call LINK_ADDRESS_10
loc_0988:
    movsx esi, word [esp + 0x40]
    jmp near loc_08ee
loc_0992:
    mov ax, word [MYCONNECTINDEX]
    movsx edx, ax
    mov dword [esp + 0x50], eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    movsx eax, word [edx + LINK_ADDRESS_25]
    imul eax, eax, 0x2c
    mov cx, word [ebp + 0x18]
    cmp cx, word [eax + LINK_ADDRESS_11]
    jne short loc_09f5
    cmp byte [edx + LINK_ADDRESS_19], 0
    je short loc_09f5
    mov eax, dword [LINK_ADDRESS_41]
    shl edi, 5
    add eax, edi
    mov dword [LINK_ADDRESS_41], eax
    mov eax, dword [esp]
    mov edx, dword [LINK_ADDRESS_42]
    shl eax, 5
    add edx, eax
    mov dword [LINK_ADDRESS_42], edx
loc_09f5:
    mov ax, word [CONNECTHEAD]
    jmp short loc_0a49
loc_09fd:
    movsx edx, cx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    movsx edx, word [eax + LINK_ADDRESS_25]
    imul edx, edx, 0x2c
    mov si, word [ebp + 0x18]
    cmp si, word [edx + LINK_ADDRESS_11]
    jne short loc_0a3c
    cmp byte [eax + LINK_ADDRESS_19], 0
    je short loc_0a3c
    movsx edx, word [ebp + 0x24]
    add dword [eax + LINK_ADDRESS_22], edx
loc_0a3c:
    movsx eax, word [esp + 0x50]
    mov ax, word [nosplit eax*2 + CONNECTPOINT2]
loc_0a49:
    mov dword [esp + 0x50], eax
    mov ecx, dword [esp + 0x50]
    test cx, cx
    jge short loc_09fd
    movsx esi, word [esp + 0x48]
    mov eax, esi
    call LINK_ADDRESS_47
    mov eax, esi
    mov ecx, dword [ebp + 8]
    mov ebx, dword [ebp + 4]
    mov edx, dword [ebp]
    call LINK_ADDRESS_10
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
    cmp dword [LINK_ADDRESS_48], 0
    je near loc_1df9
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov ax, word [ebp + 0x1c]
    mov word [edx + LINK_ADDRESS_49], ax
    mov edx, esp
    mov eax, ebp
    call LINK_ADDRESS_50
    movsx edx, ax
    mov dword [esp + 0x50], eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_25]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_51], 0
    jle near loc_1df9
    mov ax, word [MYCONNECTINDEX]
    cmp ax, word [LINK_ADDRESS_52]
    jne near loc_1df9
    mov eax, dword [esp + 0x34]
    cmp dword [eax], 0
    jge short loc_0b1a
    mov eax, dword [esp + 0x48]
    mov word [LINK_ADDRESS_53], ax
    mov eax, dword [esp + 0x34]
    inc dword [eax]
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_0b1a:
    cmp dword [LINK_ADDRESS_48], 2
    jne near loc_1df9
    movsx edx, word [esp + 0x50]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_54]
    cmp eax, -1
    jne near loc_1df9
    movsx edx, word [esp + 0x50]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_18]
    movsx edx, word [esp + 0x50]
    push eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [nosplit eax*2 + LINK_ADDRESS_22]
    push edx
    movsx edx, word [esp + 0x58]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [esp + 0x58]
    mov ebx, dword [nosplit eax*2 + LINK_ADDRESS_21]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ecx, dword [nosplit eax*2 + LINK_ADDRESS_20]
    movsx eax, word [esp + 0x50]
    imul eax, eax, 0x2c
    push ebx
    mov ebx, dword [ebp + 8]
    mov edx, dword [ebp + 4]
    push ecx
    movsx ecx, word [eax + LINK_ADDRESS_11]
    mov eax, dword [ebp]
    call LINK_ADDRESS_55
    test eax, eax
    je near loc_0cfc
    movsx eax, word [esp + 0x54]
    cmp eax, dword [esp]
    jbe near loc_0cb6
    movsx edx, word [esp + 0x50]
    mov ebx, edx
    shl ebx, 7
    mov eax, dword [esp + 0x48]
    sub ebx, edx
    mov word [LINK_ADDRESS_53], ax
    lea ebx, [ebx*4]
    mov eax, dword [esp + 0x34]
    sub ebx, edx
    movsx edx, word [esp + 0x50]
    mov dword [eax], 0x3e7
    mov eax, edx
    shl eax, 7
    sub eax, edx
    mov ecx, dword [ebp + 4]
    lea eax, [eax*4]
    mov ebx, dword [nosplit ebx*2 + LINK_ADDRESS_21]
    sub eax, edx
    mov esi, dword [ebp]
    sub ebx, ecx
    mov eax, dword [nosplit eax*2 + LINK_ADDRESS_20]
    mov edx, ebx
    sub eax, esi
    call GETANGLE
    movsx edx, ax
    movsx eax, word [ebp + 0x1c]
    call LINK_ADDRESS_57
    cwde
    mov edx, eax
    sar edx, 3
    movsx eax, word [ebp + 0x1c]
    add eax, edx
    movsx edx, word [esp + 0x50]
    mov word [ebp + 0x1c], ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [ebp + 8]
    sub edx, dword [nosplit eax*2 + LINK_ADDRESS_22]
    mov ebx, 0x101
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    add eax, 0x64
    mov edx, eax
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov word [eax + LINK_ADDRESS_27], dx
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_0cb6:
    mov eax, dword [esp + 0x34]
    cmp dword [eax], 0x3e7
    jne near loc_1df9
    mov ecx, dword [esp + 0x48]
    cmp cx, word [LINK_ADDRESS_53]
    jne short loc_0cdf
    mov eax, dword [esp + 0x34]
    mov dword [eax], 0
    jmp short loc_0ce9
loc_0cdf:
    mov eax, dword [esp + 0x34]
    mov dword [eax], 0xfffffff6
loc_0ce9:
    mov eax, dword [esp + 0x48]
    mov word [LINK_ADDRESS_53], ax
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_0cfc:
    movsx edx, word [esp + 0x50]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    movsx edx, word [esp + 0x50]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    mov esi, dword [ebp + 4]
    lea eax, [eax*4]
    mov ebx, dword [nosplit ebx*2 + LINK_ADDRESS_21]
    sub eax, edx
    mov edi, dword [ebp]
    sub ebx, esi
    mov eax, dword [nosplit eax*2 + LINK_ADDRESS_20]
    mov edx, ebx
    sub eax, edi
    call GETANGLE
    mov word [ebp + 0x1c], ax
    mov eax, dword [esp + 0x34]
    cmp dword [eax], 0x3e7
    jne near loc_1df9
    mov ebx, dword [esp + 0x48]
    cmp bx, word [LINK_ADDRESS_53]
    jne short loc_0d72
    mov eax, dword [esp + 0x34]
    mov dword [eax], 0
    jmp short loc_0d7c
loc_0d72:
    mov eax, dword [esp + 0x34]
    mov dword [eax], 0xffffffec
loc_0d7c:
    mov eax, dword [esp + 0x48]
    mov word [LINK_ADDRESS_53], ax
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
    mov edx, dword [eax + 0x14]
    test edx, edx
    jle short loc_0da5
    lea ecx, [edx - 1]
    mov dword [eax + 0x14], ecx
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_0da5:
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp dword [eax + LINK_ADDRESS_58], 0
    jne near loc_0e55
    mov edx, esp
    mov eax, ebp
    call LINK_ADDRESS_50
    cmp dword [esp], 0x3c8c
    jg near loc_1df9
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + LINK_ADDRESS_58], 1
    call LINK_ADDRESS_43
    movsx edx, word [esp + 0x48]
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    and ebx, 0x1ff
    lea eax, [eax*8]
    add ebx, 0x40
    sub eax, edx
    movsx edx, word [esp + 0x48]
    mov dword [eax + LINK_ADDRESS_59], ebx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    xor ebx, ebx
    mov dword [eax + LINK_ADDRESS_60], ebx
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_0e55:
    movsx edx, word [esp + 0x48]
    lea ebx, [edx*8]
    add ebx, edx
    lea ebx, [ebx*8]
    sub ebx, edx
    movsx edx, word [esp + 0x48]
    lea ecx, [edx*8]
    add ecx, edx
    lea ecx, [ecx*8]
    sub ecx, edx
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    mov esi, dword [ebx + LINK_ADDRESS_60]
    lea eax, [eax*8]
    inc esi
    sub eax, edx
    mov dword [ebx + LINK_ADDRESS_60], esi
    mov edx, eax
    mov eax, dword [ecx + LINK_ADDRESS_60]
    cmp eax, dword [edx + LINK_ADDRESS_59]
    jle short loc_0f04
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    xor ebp, ebp
    sub eax, edx
    movsx edx, word [LINK_ADDRESS_52]
    mov dword [eax + LINK_ADDRESS_58], ebp
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [LINK_ADDRESS_61]
    mov dword [edx + LINK_ADDRESS_62], eax
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_0f04:
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx edx, word [esp + 0x48]
    mov ebx, dword [eax + LINK_ADDRESS_59]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    sar ebx, 1
    cmp ebx, dword [eax + LINK_ADDRESS_60]
    jne short loc_0f5a
    movsx edx, word [esp + 0x48]
    mov eax, 0x160
    call LINK_ADDRESS_63
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_0f5a:
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx edx, word [esp + 0x48]
    mov ebx, dword [eax + LINK_ADDRESS_59]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    sar ebx, 3
    cmp ebx, dword [eax + LINK_ADDRESS_60]
    jne short loc_0fb1
    movsx edx, word [esp + 0x48]
    mov eax, 0x15f
    call LINK_ADDRESS_63
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_0fb1:
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx edx, word [esp + 0x48]
    mov ebx, dword [eax + LINK_ADDRESS_59]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    sar ebx, 2
    cmp ebx, dword [eax + LINK_ADDRESS_60]
    jne short loc_102b
    movsx esi, word [HEADSPRITESTAT]
loc_0ff7:
    test esi, esi
    jl near loc_1df9
    imul eax, esi, 0x2c
    cmp word [eax + LINK_ADDRESS_32], 0x131a
    jne short loc_1021
    mov dx, word [eax + LINK_ADDRESS_65]
    cmp dx, word [ebp + 0x28]
    jne short loc_1021
    or byte [eax + LINK_ADDRESS_66], 0x80
loc_1021:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESTAT]
    jmp short loc_0ff7
loc_102b:
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx edx, word [esp + 0x48]
    mov ebx, dword [eax + LINK_ADDRESS_59]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    sar ebx, 3
    cmp ebx, dword [eax + LINK_ADDRESS_60]
    jge near loc_1df9
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx edx, word [esp + 0x48]
    mov ebx, dword [eax + LINK_ADDRESS_59]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    sar ebx, 2
    cmp ebx, dword [eax + LINK_ADDRESS_60]
    jle near loc_1df9
    movsx edx, word [LINK_ADDRESS_52]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_18]
    movsx edx, word [LINK_ADDRESS_52]
    push eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [LINK_ADDRESS_52]
    mov ebx, dword [nosplit eax*2 + LINK_ADDRESS_22]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [LINK_ADDRESS_52]
    mov ecx, dword [nosplit eax*2 + LINK_ADDRESS_21]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    push ebx
    sub eax, edx
    mov ebx, dword [ebp + 8]
    push ecx
    mov esi, dword [nosplit eax*2 + LINK_ADDRESS_20]
    movsx ecx, word [ebp + 0x18]
    push esi
    mov edx, dword [ebp + 4]
    mov eax, dword [ebp]
    call LINK_ADDRESS_55
    test eax, eax
    setne al
    movzx esi, al
    call LINK_ADDRESS_43
    sar eax, 8
    cmp eax, 0x3f
    jl short loc_119b
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    test byte [eax + LINK_ADDRESS_60], 1
    je short loc_119b
    test esi, esi
    je short loc_11c4
    movsx edx, word [LINK_ADDRESS_52]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor edi, edi
    mov dword [nosplit eax*2 + LINK_ADDRESS_62], edi
    jmp short loc_11c4
loc_119b:
    test esi, esi
    je short loc_11c4
    movsx edx, word [LINK_ADDRESS_52]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [LINK_ADDRESS_61]
    mov dword [edx + LINK_ADDRESS_62], eax
loc_11c4:
    movsx esi, word [HEADSPRITESTAT]
loc_11cb:
    test esi, esi
    jl near loc_1df9
    imul ebx, esi, 0x2c
    cmp word [ebx + LINK_ADDRESS_32], 0x131a
    jne near loc_1333
    mov ax, word [ebx + LINK_ADDRESS_65]
    cmp ax, word [ebp + 0x28]
    jne near loc_1333
    call LINK_ADDRESS_43
    sar eax, 8
    cmp eax, 0xdf
    jl near loc_1329
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    test byte [eax + LINK_ADDRESS_60], 1
    je near loc_1329
    mov cl, byte [ebx + LINK_ADDRESS_66]
    mov edx, 0x919
    and cl, 0x7f
    movsx eax, si
    mov byte [ebx + LINK_ADDRESS_66], cl
    call LINK_ADDRESS_44
    mov edx, esp
    mov eax, ebp
    call LINK_ADDRESS_50
    movsx edx, ax
    mov ecx, edx
    shl ecx, 7
    sub ecx, edx
    lea ecx, [ecx*4]
    sub ecx, edx
    add ecx, ecx
    mov dword [esp + 0x50], eax
    movsx eax, word [ecx + LINK_ADDRESS_25]
    imul eax, eax, 0x2c
    add ebx, SPRITE
    mov edx, ebx
    add eax, SPRITE
    call LINK_ADDRESS_68
    mov dword [esp], eax
    cmp eax, 0x300
    jge near loc_1df9
    cmp dword [LINK_ADDRESS_69], 1
    jge short loc_12af
    mov eax, 0xd3
    movsx edx, word [ecx + LINK_ADDRESS_25]
    call LINK_ADDRESS_63
loc_12af:
    movsx edx, word [esp + 0x50]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    add ebx, ebx
    mov eax, 0x15
    movsx edx, word [ebx + LINK_ADDRESS_25]
    call LINK_ADDRESS_63
    movsx edx, word [ebx + LINK_ADDRESS_25]
    imul edx, edx, 0x2c
    call LINK_ADDRESS_43
    xor ah, ah
    and al, 7
    mov edi, 0x20
    db 0x05, 0x08, 0x00, 0x00, 0x00    ; add eax, 8
    mov cx, word [edx + LINK_ADDRESS_51]
    mov dword [ebx + LINK_ADDRESS_70], edi
    sub ecx, eax
    xor al, al
    mov word [edx + LINK_ADDRESS_51], cx
    mov byte [ebx + LINK_ADDRESS_71], al
    mov ch, 0x10
    mov byte [ebx + LINK_ADDRESS_72], al
    mov byte [ebx + LINK_ADDRESS_73], ch
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_1329:
    imul eax, esi, 0x2c
    or byte [eax + LINK_ADDRESS_66], 0x80
loc_1333:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESTAT]
    jmp near loc_11cb
    mov si, word [ebp + 0x28]
    add esi, 0x40
    mov eax, esi
    and ah, 7
    cwde
    mov word [ebp + 0x28], si
    mov ax, word [nosplit eax*2 + SINTABLE]
    movsx ebx, word [ebp + 0x22]
    movsx edx, ax
    mov eax, ebx
    imul edx
    shrd eax, edx, 0xc
    mov edi, eax
    mov eax, dword [ebp + 8]
    mov edx, dword [esp + 0x38]
    add eax, edi
    mov dword [edx + 8], eax
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
    mov edi, dword [eax]
    cmp edi, 1
    jne near loc_1df9
    mov edx, dword [eax + 0xc]
    test edx, edx
    jle short loc_13a0
    lea edi, [edx - 1]
    mov dword [eax + 0xc], edi
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_13a0:
    cmp edi, dword [eax + 8]
    jne near loc_163f
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_74], 0x600
    je near loc_14fe
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    movsx edx, word [eax + LINK_ADDRESS_27]
    mov eax, dword [esp + 0x38]
    mov ebx, dword [ebp + 8]
    mov eax, dword [eax + 8]
    sub eax, ebx
    test eax, eax
    jns short loc_13e1
    neg eax
loc_13e1:
    cmp eax, edx
    jge short loc_1422
    mov edx, dword [esp + 0x38]
    mov eax, dword [ebp + 8]
    mov dword [edx + 8], eax
    mov eax, dword [esp + 0x34]
    mov dword [eax + 8], 0
    mov dword [eax], 0
    mov edx, dword [esp + 0x34]
    movsx eax, word [ebp + 0x28]
    mov dword [edx + 0xc], eax
    movsx edx, word [esp + 0x48]
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_1
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_1422:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov edx, dword [esp + 0x38]
    mov ebx, dword [ebp + 8]
    sub ebx, dword [edx + 8]
    movsx edi, word [eax + LINK_ADDRESS_27]
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul edi, eax
    add dword [edx + 8], edi
    movsx eax, word [ebp + 0x18]
    movsx esi, word [nosplit eax*2 + HEADSPRITESECT]
loc_1456:
    test esi, esi
    jl near loc_1df9
    imul eax, esi, 0x2c
    cmp word [eax + LINK_ADDRESS_32], 0x214
    jne short loc_149e
    cmp word [eax + LINK_ADDRESS_75], 0
    jl short loc_149e
    movsx edx, word [eax + LINK_ADDRESS_27]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp byte [eax + LINK_ADDRESS_19], 1
    jne short loc_149e
    add dword [eax + LINK_ADDRESS_22], edi
loc_149e:
    imul edx, esi, 0x2c
    cmp word [edx + LINK_ADDRESS_6], 0
    jne short loc_14f1
    mov ax, word [edx + LINK_ADDRESS_5]
    db 0x66, 0x3d, 0x03, 0x00    ; cmp ax, 3
    je short loc_14f1
    db 0x66, 0x3d, 0x04, 0x00    ; cmp ax, 4
    je short loc_14f1
    lea eax, [esi*8]
    add eax, esi
    mov ebp, dword [edx + LINK_ADDRESS_9]
    lea eax, [eax*8]
    add ebp, edi
    sub eax, esi
    mov dword [edx + LINK_ADDRESS_9], ebp
    mov edx, dword [esp + 0x38]
    mov dword [eax + LINK_ADDRESS_76], ebp
    mov edx, dword [edx + 8]
    mov dword [eax + LINK_ADDRESS_36], edx
loc_14f1:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESECT]
    jmp near loc_1456
loc_14fe:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov ebx, dword [esp + 0x34]
    movsx edx, word [eax + LINK_ADDRESS_27]
    mov eax, dword [esp + 0x38]
    mov ecx, dword [ebx + 4]
    mov eax, dword [eax + 8]
    sub eax, ecx
    test eax, eax
    jns short loc_1523
    neg eax
loc_1523:
    cmp eax, edx
    jge short loc_155c
    mov edx, dword [esp + 0x38]
    mov eax, dword [ebx + 4]
    mov dword [edx + 8], eax
    movsx edx, word [esp + 0x48]
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_1
    mov dword [ebx + 8], 0
    mov dword [ebx], 0
    movsx eax, word [ebp + 0x28]
    mov dword [ebx + 0xc], eax
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_155c:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov edx, dword [esp + 0x38]
    mov ebx, dword [ebx + 4]
    sub ebx, dword [edx + 8]
    movsx edi, word [eax + LINK_ADDRESS_27]
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul edi, eax
    mov eax, edx
    mov edx, dword [edx + 8]
    add edx, edi
    mov dword [eax + 8], edx
    movsx eax, word [ebp + 0x18]
    movsx esi, word [nosplit eax*2 + HEADSPRITESECT]
loc_1597:
    test esi, esi
    jl near loc_1df9
    imul eax, esi, 0x2c
    cmp word [eax + LINK_ADDRESS_32], 0x214
    jne short loc_15df
    cmp word [eax + LINK_ADDRESS_75], 0
    jl short loc_15df
    movsx edx, word [eax + LINK_ADDRESS_27]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp byte [eax + LINK_ADDRESS_19], 1
    jne short loc_15df
    add dword [eax + LINK_ADDRESS_22], edi
loc_15df:
    imul edx, esi, 0x2c
    cmp word [edx + LINK_ADDRESS_6], 0
    jne short loc_1632
    mov cx, word [edx + LINK_ADDRESS_5]
    cmp cx, 3
    je short loc_1632
    cmp cx, 4
    je short loc_1632
    lea eax, [esi*8]
    add eax, esi
    mov ebx, dword [edx + LINK_ADDRESS_9]
    lea eax, [eax*8]
    add ebx, edi
    sub eax, esi
    mov dword [edx + LINK_ADDRESS_9], ebx
    mov edx, dword [esp + 0x38]
    mov dword [eax + LINK_ADDRESS_76], ebx
    mov edx, dword [edx + 8]
    mov dword [eax + LINK_ADDRESS_36], edx
loc_1632:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESECT]
    jmp near loc_1597
loc_163f:
    mov ax, word [ebp + 0x1c]
    and ah, 7
    cmp ax, 0x600
    jne near loc_1785
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov ebx, dword [esp + 0x38]
    mov ecx, dword [ebx + 8]
    movsx edx, word [eax + LINK_ADDRESS_27]
    mov eax, dword [ebp + 8]
    sub eax, ecx
    test eax, eax
    jns short loc_1671
    neg eax
loc_1671:
    cmp eax, edx
    jge short loc_16a4
    movsx edx, word [esp + 0x48]
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_1
    mov eax, dword [esp + 0x34]
    mov dword [eax], 0
    mov dword [eax + 8], edi
    mov edx, dword [esp + 0x34]
    movsx eax, word [ebp + 0x28]
    mov dword [edx + 0xc], eax
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_16a4:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov edx, dword [esp + 0x38]
    mov ebx, dword [ebp + 8]
    sub ebx, dword [edx + 8]
    movsx edi, word [eax + LINK_ADDRESS_27]
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul edi, eax
    mov eax, edx
    mov edx, dword [edx + 8]
    add edx, edi
    mov dword [eax + 8], edx
    movsx eax, word [ebp + 0x18]
    movsx esi, word [nosplit eax*2 + HEADSPRITESECT]
loc_16df:
    test esi, esi
    jl near loc_1df9
    imul eax, esi, 0x2c
    cmp word [eax + LINK_ADDRESS_32], 0x214
    jne short loc_1727
    cmp word [eax + LINK_ADDRESS_75], 0
    jl short loc_1727
    movsx edx, word [eax + LINK_ADDRESS_27]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp byte [eax + LINK_ADDRESS_19], 1
    jne short loc_1727
    add dword [eax + LINK_ADDRESS_22], edi
loc_1727:
    imul edx, esi, 0x2c
    cmp word [edx + LINK_ADDRESS_6], 0
    jne short loc_1778
    mov ax, word [edx + LINK_ADDRESS_5]
    db 0x66, 0x3d, 0x03, 0x00    ; cmp ax, 3
    je short loc_1778
    db 0x66, 0x3d, 0x04, 0x00    ; cmp ax, 4
    je short loc_1778
    add dword [edx + LINK_ADDRESS_9], edi
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov edx, dword [edx + LINK_ADDRESS_9]
    mov dword [eax + LINK_ADDRESS_76], edx
    mov edx, dword [esp + 0x38]
    mov edx, dword [edx + 8]
    mov dword [eax + LINK_ADDRESS_36], edx
loc_1778:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESECT]
    jmp near loc_16df
loc_1785:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov ebx, dword [esp + 0x34]
    movsx edx, word [eax + LINK_ADDRESS_27]
    mov eax, dword [esp + 0x38]
    mov ecx, dword [ebx + 4]
    mov eax, dword [eax + 8]
    sub eax, ecx
    test eax, eax
    jns short loc_17aa
    neg eax
loc_17aa:
    cmp eax, edx
    jge short loc_17d5
    mov dword [ebx], 0
    movsx edx, word [esp + 0x48]
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_1
    mov dword [ebx + 8], edi
    movsx eax, word [ebp + 0x28]
    mov dword [ebx + 0xc], eax
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_17d5:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov edx, dword [esp + 0x34]
    mov ebx, dword [ebp + 8]
    sub ebx, dword [edx + 4]
    movsx edi, word [eax + LINK_ADDRESS_27]
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul edi, eax
    mov eax, dword [esp + 0x38]
    sub dword [eax + 8], edi
    movsx esi, word [ebp + 0x18]
    movsx esi, word [nosplit esi*2 + HEADSPRITESECT]
loc_180d:
    test esi, esi
    jl near loc_1df9
    imul eax, esi, 0x2c
    cmp word [eax + LINK_ADDRESS_32], 0x214
    jne short loc_1855
    cmp word [eax + LINK_ADDRESS_75], 0
    jl short loc_1855
    movsx edx, word [eax + LINK_ADDRESS_27]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp byte [eax + LINK_ADDRESS_19], 1
    jne short loc_1855
    sub dword [eax + LINK_ADDRESS_22], edi
loc_1855:
    imul edx, esi, 0x2c
    cmp word [edx + LINK_ADDRESS_6], 0
    jne short loc_18a8
    mov bx, word [edx + LINK_ADDRESS_5]
    cmp bx, 3
    je short loc_18a8
    cmp bx, 4
    je short loc_18a8
    lea eax, [esi*8]
    add eax, esi
    mov ecx, dword [edx + LINK_ADDRESS_9]
    lea eax, [eax*8]
    sub ecx, edi
    sub eax, esi
    mov dword [edx + LINK_ADDRESS_9], ecx
    mov edx, dword [esp + 0x38]
    mov dword [eax + LINK_ADDRESS_76], ecx
    mov edx, dword [edx + 8]
    mov dword [eax + LINK_ADDRESS_36], edx
loc_18a8:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESECT]
    jmp near loc_180d
    mov edi, dword [eax]
    cmp edi, 1
    jne near loc_1df9
    cmp edi, dword [eax + 8]
    jne near loc_1a0e
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_74], 0x600
    je near loc_1977
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_27]
    db 0x8d, 0x14, 0x45, 0x00, 0x00, 0x00, 0x00    ; lea edx, [eax*2]
    mov eax, dword [esp + 0x38]
    mov ebx, dword [ebp + 8]
    mov eax, dword [eax + 4]
    sub eax, ebx
    test eax, eax
    jns short loc_1908
    neg eax
loc_1908:
    cmp eax, edx
    jge short loc_193e
    mov edx, dword [esp + 0x38]
    mov eax, dword [ebp + 8]
    mov dword [edx + 4], eax
    movsx edx, word [esp + 0x48]
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_1
    mov eax, dword [esp + 0x34]
    mov dword [eax + 8], 0
    mov dword [eax], 0
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_193e:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov ebx, dword [esp + 0x38]
    movsx edx, word [eax + LINK_ADDRESS_27]
    mov eax, dword [ebp + 8]
    mov ecx, dword [ebx + 4]
    mov ebx, eax
    sub ebx, ecx
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul eax, edx
    mov edx, dword [esp + 0x38]
    add dword [edx + 4], eax
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_1977:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_27]
    db 0x8d, 0x14, 0x45, 0x00, 0x00, 0x00, 0x00    ; lea edx, [eax*2]
    mov ebx, dword [esp + 0x34]
    mov eax, dword [esp + 0x38]
    mov ecx, dword [ebx + 4]
    mov eax, dword [eax + 4]
    sub eax, ecx
    test eax, eax
    jns short loc_19a3
    neg eax
loc_19a3:
    cmp eax, edx
    jge short loc_19d5
    mov edx, dword [esp + 0x38]
    mov eax, dword [ebx + 4]
    mov dword [edx + 4], eax
    movsx edx, word [esp + 0x48]
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_1
    mov dword [ebx + 8], 0
    mov dword [ebx], 0
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_19d5:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    movsx edx, word [eax + LINK_ADDRESS_27]
    mov eax, dword [ebx + 4]
    mov ebx, dword [esp + 0x38]
    mov esi, dword [ebx + 4]
    mov ebx, eax
    sub ebx, esi
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul eax, edx
    mov edx, dword [esp + 0x38]
    add dword [edx + 4], eax
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_1a0e:
    mov ax, word [ebp + 0x1c]
    and ah, 7
    cmp ax, 0x600
    jne short loc_1a8d
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_27]
    db 0x8d, 0x14, 0x45, 0x00, 0x00, 0x00, 0x00    ; lea edx, [eax*2]
    mov eax, dword [esp + 0x38]
    mov ebx, dword [ebp + 8]
    mov eax, dword [eax + 4]
    sub eax, ebx
    test eax, eax
    jns short loc_1a43
    neg eax
loc_1a43:
    cmp eax, edx
    jge near loc_193e
    mov eax, dword [esp + 0x34]
    mov edi, dword [eax + 8]
    mov dword [eax], 0
    test edi, edi
    sete al
    mov edx, eax
    mov eax, dword [esp + 0x34]
    and edx, 0xff
    mov dword [eax + 8], edx
    movsx edx, word [esp + 0x48]
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_1
    mov edx, dword [esp + 0x38]
    mov eax, dword [ebp + 8]
    mov dword [edx + 4], eax
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_1a8d:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_27]
    db 0x8d, 0x14, 0x45, 0x00, 0x00, 0x00, 0x00    ; lea edx, [eax*2]
    mov ebx, dword [esp + 0x34]
    mov eax, dword [esp + 0x38]
    mov ecx, dword [ebx + 4]
    mov eax, dword [eax + 4]
    sub eax, ecx
    test eax, eax
    jns short loc_1ab9
    neg eax
loc_1ab9:
    cmp eax, edx
    jge short loc_1aed
    mov edx, dword [ebx + 8]
    mov dword [ebx], 0
    test edx, edx
    sete al
    mov edx, eax
    and edx, 0xff
    mov dword [ebx + 8], edx
    movsx edx, word [esp + 0x48]
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_1
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_1aed:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    movsx edx, word [eax + LINK_ADDRESS_27]
    mov eax, dword [ebp + 8]
    mov esi, dword [ebx + 4]
    mov ebx, eax
    sub ebx, esi
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul eax, edx
    mov edx, dword [esp + 0x38]
    sub dword [edx + 4], eax
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
    cmp byte [LINK_ADDRESS_77], 0
    jbe near loc_1df9
    call LINK_ADDRESS_43
    test al, 7
    jne near loc_1df9
    mov eax, 5
    push eax
    movsx eax, word [esp + 0x4c]
    push eax
    mov edx, 0xfffffe00
    call LINK_ADDRESS_43
    and eax, 0x7ff
    sub edx, eax
    push edx
    call LINK_ADDRESS_43
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call LINK_ADDRESS_43
    and ah, 7
    cwde
    push eax
    mov eax, 0x30
    push eax
    push eax
    mov eax, 0xfffffff8
    push eax
    call LINK_ADDRESS_43
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [ebp + 8]
    push eax
    sub ecx, 0x800
    call LINK_ADDRESS_43
    and eax, 0x1fff
    sub ecx, eax
    call LINK_ADDRESS_43
    and eax, 0xff
    add eax, dword [ebp + 4]
    lea ebx, [eax - 0x80]
    call LINK_ADDRESS_43
    and eax, 0xff
    add eax, dword [ebp]
    lea edx, [eax - 0x80]
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_78
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
    mov esi, dword [eax]
    test esi, esi
    je near loc_1df9
    cmp esi, 1
    jne short loc_1bf4
    mov eax, ebx
    movsx edx, word [edx + 0x26]
    call LINK_ADDRESS_79
    jmp short loc_1c02
loc_1bf4:
    cmp esi, 0x82
    jne short loc_1c02
    mov dword [eax], 0
loc_1c02:
    mov eax, dword [esp + 0x34]
    inc dword [eax]
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
    mov edx, dword [eax + 8]
    shl edx, 5
    add edx, WALL
    mov ax, word [edx + 0xe]
    or al, 0x20
    test ax, ax
    je near loc_1df9
    mov bx, word [edx + 0xe]
    xor bh, bh
    and bl, 0xcf
    mov word [edx + 0xe], bx
    mov ah, byte [edx + 0xe]
    or ah, 0x10
    mov cx, word [edx + 0xa]
    mov byte [edx + 0xe], ah
    test cx, cx
    jl short loc_1c68
    movsx eax, cx
    shl eax, 5
    and word [eax + LINK_ADDRESS_80], 0xdf
    movsx eax, word [edx + 0xa]
    shl eax, 5
    or byte [eax + LINK_ADDRESS_80], 0x10
loc_1c68:
    mov di, word [edx + 0x12]
    inc edi
    mov ax, word [edx + 0xa]
    mov word [edx + 0x12], di
    test ax, ax
    jl short loc_1c85
    cwde
    shl eax, 5
    inc word [eax + LINK_ADDRESS_81]
loc_1c85:
    mov eax, dword [esp + 0x34]
    mov ebx, dword [esp + 0x34]
    mov eax, dword [eax]
    cmp eax, dword [ebx + 4]
    jl short loc_1ccc
    mov cx, word [edx + 0xe]
    xor ch, ch
    and cl, 0xae
    mov si, word [edx + 0xa]
    mov word [edx + 0xe], cx
    test si, si
    jl short loc_1cb9
    movsx eax, si
    shl eax, 5
    and word [eax + LINK_ADDRESS_80], 0xae
loc_1cb9:
    movsx eax, word [esp + 0x48]
    call LINK_ADDRESS_28
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_1ccc:
    inc dword [ebx]
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
    mov edx, dword [eax]
    cmp edx, 0x50
    jle short loc_1cee
    mov eax, ebx
    call LINK_ADDRESS_28
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_1cee:
    lea ecx, [edx + 1]
    mov edx, dword [esp + 0x38]
    mov dword [eax], ecx
    mov eax, dword [esp + 0x38]
    mov esi, dword [edx + 4]
    mov eax, dword [eax + 8]
    sub eax, esi
    mov dword [esp], eax
    call LINK_ADDRESS_43
    sar eax, 8
    cmp eax, 0xbf
    jl near loc_1df9
    mov edx, 0x762
    mov eax, ebx
    call LINK_ADDRESS_44
    mov dword [esp + 0x4c], eax
    call LINK_ADDRESS_43
    mov edx, eax
    mov edi, dword [esp]
    sar edx, 0x1f
    idiv edi
    jmp short loc_1d93
    mov ecx, dword [eax]
    cmp ecx, 0x28
    jle short loc_1d51
    mov eax, ebx
    call LINK_ADDRESS_28
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
loc_1d51:
    lea esi, [ecx + 1]
    mov dword [eax], esi
    mov eax, dword [edx + 8]
    mov edi, dword [edx + 4]
    sub eax, edi
    mov dword [esp], eax
    call LINK_ADDRESS_43
    sar eax, 8
    cmp eax, 0xdf
    jl near loc_1df9
    mov edx, 0x762
    mov eax, ebx
    call LINK_ADDRESS_44
    mov dword [esp + 0x4c], eax
    call LINK_ADDRESS_43
    mov edx, eax
    mov ebp, dword [esp]
    sar edx, 0x1f
    idiv ebp
loc_1d93:
    movsx ebx, word [esp + 0x4c]
    imul ebx, ebx, 0x2c
    mov eax, dword [esp + 0x38]
    mov eax, dword [eax + 8]
    sub eax, edx
    mov dword [ebx + LINK_ADDRESS_9], eax
    call LINK_ADDRESS_43
    mov edx, eax
    mov ecx, 0x1ff
    sar edx, 0x1f
    idiv ecx
    mov eax, 0x100
    sub eax, edx
    mov edx, eax
    movsx eax, word [ebx + LINK_ADDRESS_74]
    add eax, edx
    mov word [ebx + LINK_ADDRESS_74], ax
    call LINK_ADDRESS_43
    mov edx, eax
    xor dh, ah
    movsx eax, word [esp + 0x4c]
    imul ebx, eax, 0x2c
    and dl, 0x7f
    mov word [ebx + LINK_ADDRESS_45], dx
    mov edx, 0x10001
    call LINK_ADDRESS_46
loc_1df9:
    mov eax, dword [esp + 0x44]
    jmp near LINK_ADDRESS_2
    mov ax, word [LINK_ADDRESS_82]
    jmp near loc_1e86
loc_1e0d:
    movsx eax, bx
    imul eax, eax, 0x2c
    mov ebp, SPRITE
    add ebp, eax
    cmp word [ebp + 0x26], 0x1d
    jne short loc_1e79
    movsx esi, word [ebp + 0x18]
    lea eax, [esi*4]
    add eax, esi
    mov edx, SECTOR
    lea eax, [eax*8]
    add edx, eax
    mov di, word [edx + 2]
    mov dword [esp + 0x38], edx
    cmp di, 4
    jne short loc_1e79
    movsx eax, word [edx]
    shl eax, 5
    lea edx, [eax + 0x40]
    add edx, WALL
    movsx ebx, word [edx + 0xc]
    lea eax, [ebx*4]
    add eax, ebx
    mov ecx, dword [eax*8 + LINK_ADDRESS_83]
    mov ebx, dword [edx + 4]
    mov eax, esi
    mov edx, dword [edx]
    call LINK_ADDRESS_84
loc_1e79:
    movsx eax, word [esp + 0x48]
    mov ax, word [nosplit eax*2 + NEXTSPRITESTAT]
loc_1e86:
    mov dword [esp + 0x48], eax
    mov ebx, dword [esp + 0x48]
    test bx, bx
    jge near loc_1e0d
    add esp, 0x58
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
