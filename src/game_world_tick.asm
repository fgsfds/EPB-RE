; World tick and sprite interactions.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x10
    mov ax, word [LINK_ADDRESS_1]
loc_000f:
    mov dword [esp + 8], eax
    mov edx, dword [esp + 8]
    test dx, dx
    jl near LINK_ADDRESS_2
    movsx ebx, dx
    mov ax, word [nosplit ebx*2 + NEXTSPRITESTAT]
    mov dword [esp + 4], eax
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    imul esi, ebx, 0x2c
    mov edi, LINK_ADDRESS_4
    add esi, SPRITE
    add edi, eax
    mov dx, word [esi + 0x18]
    add edi, 0x2f
    mov dword [esp + 0xc], edx
    test dx, dx
    jl short loc_0067
    cmp byte [esi + 0x14], 0
    jne short loc_0076
loc_0067:
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    jmp near loc_117e
loc_0076:
    mov edx, dword [esi]
    mov dword [eax + LINK_ADDRESS_7], edx
    mov edx, dword [esi + 4]
    mov dword [eax + LINK_ADDRESS_8], edx
    mov edx, dword [esi + 8]
    mov dword [eax + LINK_ADDRESS_9], edx
    mov ax, word [esi + 0xe]
    cmp ax, 0x762
    jb near loc_023d
    jbe near loc_0de9
    cmp ax, 0x8f8
    jb near loc_019c
    cmp ax, 0x8fb
    jbe near loc_03e7
    cmp ax, 0xa34
    jb short loc_0119
    jbe near loc_0de9
    cmp ax, 0x113a
    jb short loc_00fa
    jbe near loc_07ad
    cmp ax, 0x116c
    jb short loc_00eb
    jbe near loc_07ad
    cmp ax, 0x116d
    je near loc_0778
    jmp near loc_015e
loc_00eb:
    cmp ax, 0x113b
    je near loc_0778
    jmp near loc_015e
loc_00fa:
    cmp ax, 0xfff
    jb near loc_015e
    jbe near loc_063d
    cmp ax, 0x1125
    je near loc_0bb4
    jmp near loc_015e
loc_0119:
    cmp ax, 0x9e5
    jb short loc_0144
    jbe near loc_0e0b
    cmp ax, 0x9e7
    jb near loc_015e
    jbe near loc_0e0b
    cmp ax, 0xa1e
    je near loc_04b8
    jmp near loc_015e
loc_0144:
    cmp ax, 0x906
    jb near loc_015e
    jbe near loc_0de9
    cmp ax, 0x919
    je near loc_0de9
loc_015e:
    movsx eax, word [esp + 8]
    imul eax, eax, 0x2c
    mov bx, word [eax + LINK_ADDRESS_10]
    cmp bx, 0x956
    jl near loc_117e
    cmp bx, 0x973
    jg near loc_117e
    mov ax, word [esi + 0x20]
    test ax, ax
    jle near loc_1070
    mov edx, eax
    dec edx
    mov word [esi + 0x20], dx
    jmp near loc_1076
loc_019c:
    cmp ax, 0x8c5
    jb short loc_01f3
    jbe near loc_0922
    cmp ax, 0x8d4
    jb short loc_01d8
    jbe near loc_0922
    cmp ax, 0x8de
    jb short loc_01cc
    jbe near loc_0de9
    cmp ax, 0x8ee
    je near loc_0922
    jmp short loc_015e
loc_01cc:
    cmp ax, 0x8d9
    je near loc_0922
    jmp short loc_015e
loc_01d8:
    cmp ax, 0x8ca
    jb short loc_015e
    jbe near loc_0922
    cmp ax, 0x8cf
    je near loc_0922
    jmp near loc_015e
loc_01f3:
    cmp ax, 0x89d
    jb short loc_021e
    jbe near loc_0922
    cmp ax, 0x8a1
    jb near loc_015e
    jbe near loc_0922
    cmp ax, 0x8ab
    je near loc_0de9
    jmp near loc_015e
loc_021e:
    cmp ax, 0x898
    jb near loc_015e
    jbe near loc_0de9
    cmp ax, 0x899
    je near loc_0922
    jmp near loc_015e
loc_023d:
    cmp ax, 0x5f0
    jb near loc_0302
    jbe near loc_0922
    cmp ax, 0x66f
    jb short loc_02b8
    jbe near loc_075a
    cmp ax, 0x6e8
    jb short loc_0299
    jbe near loc_0922
    cmp ax, 0x6f0
    jb short loc_028a
    jbe near loc_0922
    cmp ax, 0x744
    jb near loc_015e
    cmp ax, 0x745
    jbe near loc_06a4
    jmp near loc_015e
loc_028a:
    cmp ax, 0x6ec
    je near loc_0922
    jmp near loc_015e
loc_0299:
    cmp ax, 0x678
    jb near loc_015e
    jbe near loc_0de9
    cmp ax, 0x687
    je near loc_0de9
    jmp near loc_015e
loc_02b8:
    cmp ax, 0x654
    jb short loc_02e3
    jbe near loc_0de9
    cmp ax, 0x659
    jb near loc_015e
    jbe near loc_0752
    cmp ax, 0x65e
    je near loc_0de9
    jmp near loc_015e
loc_02e3:
    cmp ax, 0x5f8
    jb near loc_015e
    jbe near loc_0922
    cmp ax, 0x600
    je near loc_0922
    jmp near loc_015e
loc_0302:
    cmp ax, 0x416
    jb short loc_0358
    jbe near loc_03b0
    cmp ax, 0x4d2
    jb short loc_0339
    jbe near loc_0778
    cmp ax, 0x4ed
    jb near loc_015e
    jbe near loc_0de9
    cmp ax, 0x564
    je near loc_05ba
    jmp near loc_015e
loc_0339:
    cmp ax, 0x4ca
    jb near loc_015e
    jbe near loc_0bb4
    cmp ax, 0x4d1
    je near loc_07ad
    jmp near loc_015e
loc_0358:
    cmp ax, 0x39d
    jb short loc_038d
    cmp ax, 0x39e
    jbe short loc_03b0
    cmp ax, 0x3ef
    jb near loc_015e
    cmp ax, 0x3f1
    jbe short loc_03b0
    cmp ax, 0x407
    jb near loc_015e
    cmp ax, 0x409
    jbe near loc_0f55
    jmp near loc_015e
loc_038d:
    cmp ax, 0x8e
    jb near loc_015e
    cmp ax, 0x91
    jbe near loc_042d
    cmp ax, 0x295
    je near loc_0de9
    jmp near loc_015e
loc_03b0:
    movsx eax, word [esi + 0x26]
    movsx edx, word [LINK_ADDRESS_11]
    lea ebx, [eax + 1]
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    and eax, 0x1f
    cmp eax, 4
    jle short loc_03da
    mov byte [esi + 0x10], 0x81
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_03da:
    mov byte [esi + 0x10], 0x7f
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_03e7:
    cmp dword [edi], 0xb6
    je near loc_117e
    call LINK_ADDRESS_12
    and eax, 0xf
    mov ecx, dword [esi + 8]
    add eax, 0x10
    add ecx, eax
    mov dword [esi + 8], ecx
    mov ebp, dword [edi]
    inc ebp
    mov ebx, 9
    mov edx, ebp
    mov eax, ebp
    sar edx, 0x1f
    idiv ebx
    mov dword [edi], ebp
    test edx, edx
    jne near loc_117e
    inc byte [esi + 0x15]
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_042d:
    mov eax, dword [edi]
    test eax, eax
    je near loc_117e
    lea edx, [eax + 1]
    mov dword [edi], edx
    cmp edx, 8
    jne short loc_0449
    mov word [esi + 0xe], 0x8f
    jmp short loc_047c
loc_0449:
    cmp edx, 0x10
    jne short loc_047c
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov word [esi + 0xe], 0x90
    movsx edx, word [eax + LINK_ADDRESS_13]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov word [nosplit eax*2 + LINK_ADDRESS_14], 1
loc_047c:
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    movsx edx, word [eax + LINK_ADDRESS_13]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    cmp word [nosplit eax*2 + LINK_ADDRESS_14], 0x1a
    jne near loc_117e
    mov word [esi + 0xe], 0x91
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_04b8:
    xor edx, edx
    mov ecx, dword [edi + 4]
    mov dl, byte [esi + 0x14]
    test ecx, ecx
    jle short loc_04de
    lea ebp, [ecx - 1]
    mov dword [edi + 4], ebp
    test ebp, ebp
    jne short loc_04de
    mov eax, ebx
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_04de:
    movsx ebx, word [esi + 0x1e]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    cmp dword [eax + LINK_ADDRESS_15], 0
    jne short loc_050e
    mov eax, dword [edi]
    cmp eax, 0x40
    jge short loc_051d
    lea ebx, [eax + 1]
    add edx, 3
    mov dword [edi], ebx
    jmp short loc_051d
loc_050e:
    mov ecx, dword [edi]
    cmp ecx, 0x40
    jle short loc_051d
    lea ebp, [ecx - 1]
    sub edx, 3
    mov dword [edi], ebp
loc_051d:
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov eax, dword [eax + SPRITE]
    mov dword [esi], eax
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov eax, dword [eax + LINK_ADDRESS_16]
    mov dword [esi + 4], eax
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov eax, dword [eax + LINK_ADDRESS_17]
    movsx ebx, word [esi + 0x1e]
    mov dword [esi + 8], eax
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov ax, word [eax + LINK_ADDRESS_18]
    add word [esi + 0x1c], ax
    cmp edx, 0x40
    jle short loc_0579
    mov edx, 0x40
    jmp short loc_0583
loc_0579:
    cmp edx, 1
    jge short loc_0583
    mov edx, 1
loc_0583:
    sar edx, 1
    sub edx, 0x30
    mov byte [esi + 0x10], dl
    mov bx, word [edi]
    test bx, bx
    jg short loc_059c
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_059c:
    movsx eax, word [esp + 8]
    mov edx, 0x10001
    call LINK_ADDRESS_19
    dec ebx
    test bx, bx
    jg short loc_059c
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_05ba:
    mov ebp, dword [edi]
    inc ebp
    mov dword [edi], ebp
    cmp ebp, 1
    jne short loc_0621
    movsx edx, word [esp + 0xc]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_20], 1
    je short loc_0609
    movsx edx, word [esp + 0xc]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_20], 2
    je short loc_0609
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0609:
    cmp dword [LINK_ADDRESS_21], 0
    jne short loc_0621
    movsx edx, word [esp + 8]
    mov eax, 0x16
    call LINK_ADDRESS_22
loc_0621:
    cmp dword [edi], 3
    jne short loc_0633
    mov ecx, dword [edi + 4]
    mov dword [edi], 0
    inc ecx
    mov dword [edi + 4], ecx
loc_0633:
    cmp dword [edi + 4], 5
    je near loc_117e
loc_063d:
    cmp word [esi + 0x1e], 0
    jl near loc_117e
    mov eax, dword [edi]
    inc eax
    mov dword [edi], eax
    cmp eax, 7
    jle short loc_0665
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0665:
    cmp eax, 4
    jle short loc_0672
    or word [esi + 0xc], 0x202
    jmp short loc_067b
loc_0672:
    cmp eax, 2
    jle short loc_067b
    or byte [esi + 0xc], 2
loc_067b:
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov al, byte [eax + LINK_ADDRESS_23]
    mov byte [esi + 0x16], al
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov al, byte [eax + LINK_ADDRESS_24]
    mov byte [esi + 0x17], al
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_06a4:
    mov edx, esp
    mov eax, esi
    call LINK_ADDRESS_25
    mov ebx, eax
    cmp dword [esp], 0x200
    jge near loc_0752
    movsx edx, bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dword [nosplit eax*2 + LINK_ADDRESS_26], 0x20
    movsx edx, bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov cl, 0x20
    sub eax, edx
    movsx edx, bx
    mov byte [nosplit eax*2 + LINK_ADDRESS_27], cl
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    xor ch, ch
    sub eax, edx
    movsx edx, bx
    mov byte [nosplit eax*2 + LINK_ADDRESS_28], ch
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, bx
    mov byte [nosplit eax*2 + LINK_ADDRESS_29], ch
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_30]
    imul eax, eax, 0x2c
    sub word [eax + LINK_ADDRESS_31], 4
loc_0752:
    cmp word [esi + 0x2a], 0x3e7
    jne short loc_076d
loc_075a:
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_076d:
    mov word [esi + 0x2a], 0x3e7
    jmp near loc_015e
loc_0778:
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    movsx eax, word [esi + 0x18]
    call GETFLORZOFSLOPE
    movsx edx, word [esp + 8]
    mov ebx, eax
    mov dword [esi + 8], eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + LINK_ADDRESS_33], ebx
    jmp near loc_015e
loc_07ad:
    movsx edx, word [esp + 8]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ebx, dword [eax + LINK_ADDRESS_18]
    and ebx, 0x7ff
    mov edx, eax
    movsx ebx, word [nosplit ebx*2 + SINTABLE]
    call LINK_ADDRESS_12
    sar ebx, 9
    and eax, 7
    add eax, ebx
    mov word [esi + 0x20], ax
    call LINK_ADDRESS_12
    and eax, 0x3f
    mov ebp, dword [edx + LINK_ADDRESS_18]
    add ebp, eax
    mov eax, ebp
    and eax, 0x7ff
    mov dword [edx + LINK_ADDRESS_18], ebp
    cmp eax, 0x200
    jle short loc_085d
    cmp eax, 0x63c
    jge short loc_085d
    movsx edx, word [esp + 0xc]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_20], 2
    jne short loc_0838
    cmp word [esi + 0x24], 0x40
    jge short loc_085d
    jmp short loc_0840
loc_0838:
    cmp word [esi + 0x24], 0x90
    jge short loc_085d
loc_0840:
    call LINK_ADDRESS_12
    mov edx, dword [LINK_ADDRESS_35]
    and eax, 7
    sar edx, 5
    add edx, eax
    movsx eax, word [esi + 0x24]
    add eax, edx
    mov word [esi + 0x24], ax
loc_085d:
    movsx ebp, word [esp + 8]
    mov edx, 0x10001
    mov eax, ebp
    call LINK_ADDRESS_19
    call LINK_ADDRESS_12
    test al, 3
    jne short loc_0886
    mov eax, ebp
    mov ecx, dword [esi + 8]
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    call LINK_ADDRESS_36
loc_0886:
    movsx eax, word [esi + 0x18]
    cmp eax, -1
    jne short loc_08a2
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_08a2:
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    call GETFLORZOFSLOPE
    cmp eax, dword [esi + 8]
    jge near loc_015e
    movsx edx, word [esp + 8]
    mov dword [esi + 8], eax
    mov eax, edx
    imul edx, edx, 0x2c
    call LINK_ADDRESS_37
    mov ax, word [edx + LINK_ADDRESS_10]
    inc eax
    mov bx, word [LINK_ADDRESS_1]
    mov word [edx + LINK_ADDRESS_10], ax
loc_08dd:
    test bx, bx
    jl near loc_015e
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_10], 0x4ca
    jne short loc_0915
    mov edx, SPRITE
    add edx, eax
    mov eax, esi
    call LINK_ADDRESS_38
    cmp eax, 0x15c
    jge short loc_0915
    mov byte [esi + 0x11], 2
    jmp near loc_015e
loc_0915:
    movsx ebx, bx
    mov bx, word [nosplit ebx*2 + NEXTSPRITESTAT]
    jmp short loc_08dd
loc_0922:
    mov cx, word [esi + 0x20]
    test cx, cx
    jle short loc_0934
    mov eax, ecx
    dec eax
    mov word [esi + 0x20], ax
    jmp short loc_093a
loc_0934:
    mov word [esi + 0x20], 0
loc_093a:
    mov ebx, dword [edi + 0x14]
    cmp ebx, 0x12c
    jl short loc_0958
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0958:
    lea ecx, [ebx + 1]
    mov dword [edi + 0x14], ecx
    mov dx, word [esi + 0x24]
    cmp dx, 0x400
    jle short loc_098a
    cmp dx, 0x500
    jge short loc_098a
    movsx eax, word [esp + 8]
    mov ecx, dword [esi + 8]
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    call LINK_ADDRESS_36
    mov ax, word [esi + 0x18]
    mov dword [esp + 0xc], eax
loc_098a:
    movsx ecx, word [esp + 0xc]
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    mov eax, ecx
    call GETFLORZOFSLOPE
    mov ebp, eax
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    mov eax, ecx
    call GETCEILZOFSLOPE
    mov dword [esp], eax
    cmp eax, ebp
    je short loc_09bf
    mov eax, dword [esp + 0xc]
    test ax, ax
    jl short loc_09bf
    cmp ax, 0x400
    jl short loc_09d2
loc_09bf:
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_09d2:
    sub ebp, 0x200
    cmp ebp, dword [esi + 8]
    jle near loc_0af4
    mov edx, dword [edi + 4]
    cmp edx, 2
    jge short loc_09ef
    inc edx
    mov dword [edi + 4], edx
    jmp short loc_0a4a
loc_09ef:
    lea eax, [ecx*4]
    add eax, ecx
    cmp word [eax*8 + LINK_ADDRESS_20], 2
    je short loc_0a4a
    mov dword [edi + 4], 0
    mov ax, word [esi + 0xe]
    cmp ax, 0x600
    je short loc_0a20
    cmp ax, 0x5f0
    je short loc_0a20
    cmp ax, 0x5f8
    jne short loc_0a36
loc_0a20:
    mov ebp, dword [edi]
    cmp ebp, 6
    jle short loc_0a2f
    mov dword [edi], 0
    jmp short loc_0a4a
loc_0a2f:
    lea eax, [ebp + 1]
    mov dword [edi], eax
    jmp short loc_0a4a
loc_0a36:
    mov ebx, dword [edi]
    cmp ebx, 2
    jle short loc_0a45
    mov dword [edi], 0
    jmp short loc_0a4a
loc_0a45:
    lea ecx, [ebx + 1]
    mov dword [edi], ecx
loc_0a4a:
    mov cx, word [esi + 0x24]
    cmp cx, 0x1800
    jge short loc_0a97
    movsx edx, word [esp + 0xc]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_20], 2
    jne short loc_0a86
    cmp cx, 0x400
    jge short loc_0a7e
    add ecx, 0x30
    mov word [esi + 0x24], cx
    jmp short loc_0a97
loc_0a7e:
    mov word [esi + 0x24], 0x400
    jmp short loc_0a97
loc_0a86:
    mov ax, word [LINK_ADDRESS_35]
    mov edx, ecx
    sub eax, 0x32
    add edx, eax
    mov word [esi + 0x24], dx
loc_0a97:
    movsx eax, word [esi + 0x1c]
    add eax, 0x200
    and eax, 0x7ff
    movsx edx, word [nosplit eax*2 + SINTABLE]
    movsx eax, word [esi + 0x20]
    imul eax, edx
    mov ebx, dword [esi]
    sar eax, 0xe
    add ebx, eax
    mov ax, word [esi + 0x1c]
    and ah, 7
    cwde
    mov dword [esi], ebx
    movsx edx, word [nosplit eax*2 + SINTABLE]
    movsx eax, word [esi + 0x20]
    imul eax, edx
    mov ecx, dword [esi + 4]
    sar eax, 0xe
    mov edi, dword [esi + 8]
    add ecx, eax
    movsx eax, word [esi + 0x24]
    mov dword [esi + 4], ecx
    add edi, eax
    mov dword [esi + 8], edi
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0af4:
    cmp dword [edi + 8], 0
    jne short loc_0b3f
    movsx edx, word [esi + 0x18]
    cmp edx, -1
    jne short loc_0b16
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0b16:
    lea eax, [edx*4]
    add eax, edx
    test byte [eax*8 + LINK_ADDRESS_40], 2
    je short loc_0b3c
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0b3c:
    inc dword [edi + 8]
loc_0b3f:
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    movsx eax, word [esi + 0x18]
    call GETFLORZOFSLOPE
    mov word [esi + 0x20], 0
    sub eax, 0x200
    mov bx, word [esi + 0xe]
    mov dword [esi + 8], eax
    cmp bx, 0x8ee
    jne short loc_0b98
    inc dword [edi + 4]
    test byte [edi + 4], 3
    jne short loc_0b7b
    mov esi, dword [edi]
    cmp esi, 7
    jge short loc_0b7b
    lea ebp, [esi + 1]
    mov dword [edi], ebp
loc_0b7b:
    cmp dword [edi + 4], 0x14
    jle near loc_117e
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0b98:
    mov word [esi + 0xe], 0x8ee
    mov dword [edi], 0
loc_0ba4:
    mov dword [edi + 4], 0
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0bb4:
    cmp dword [edi], 0
    jne short loc_0bf4
    movsx edx, word [esp + 0xc]
    lea eax, [edx*4]
    add eax, edx
    mov dword [edi], 1
    test byte [eax*8 + LINK_ADDRESS_40], 2
    je short loc_0bea
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0bea:
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_37
loc_0bf4:
    movsx ecx, word [esp + 8]
    mov eax, ecx
    mov edx, esp
    call LINK_ADDRESS_41
    mov eax, esi
    call LINK_ADDRESS_25
    mov ebx, eax
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov edx, eax
    mov eax, dword [eax + LINK_ADDRESS_33]
    sub eax, 0x100
    mov dword [esi + 8], eax
    mov ecx, dword [edi + 8]
    cmp ecx, 0x20
    jge short loc_0c74
    lea ebp, [ecx + 1]
    mov dword [edi + 8], ebp
    cmp word [edx + LINK_ADDRESS_42], 0x3de
    jne short loc_0c54
    cmp byte [esi + 0x14], 0x40
    jae short loc_0c74
    cmp byte [esi + 0x15], 0x40
    jae short loc_0c74
    jmp short loc_0c60
loc_0c54:
    cmp byte [esi + 0x14], 0x20
    jae short loc_0c74
    cmp byte [esi + 0x15], 0x20
    jae short loc_0c74
loc_0c60:
    call LINK_ADDRESS_12
    and al, 3
    add byte [esi + 0x14], al
    call LINK_ADDRESS_12
    and al, 3
    add byte [esi + 0x15], al
loc_0c74:
    cmp dword [esp], 0x34c
    jge near loc_0ba4
    cmp byte [esi + 0x14], 6
    jbe near loc_0ba4
    cmp byte [esi + 0x15], 6
    jbe near loc_0ba4
    cmp byte [esi + 0x11], 0
    jne near loc_0d4b
    call LINK_ADDRESS_12
    and eax, 0xff
    cmp eax, 0x10
    jge near loc_0d4b
    cmp word [esi + 0xe], 0x1125
    je near loc_0d4b
    movsx edx, bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov dx, word [eax + LINK_ADDRESS_43]
    test dx, dx
    jle short loc_0ce9
    dec edx
    mov word [eax + LINK_ADDRESS_43], dx
    jmp short loc_0d4b
loc_0ce9:
    cmp dword [LINK_ADDRESS_44], 1
    jge short loc_0d03
    movsx edx, word [eax + LINK_ADDRESS_30]
    mov eax, 0xd3
    call LINK_ADDRESS_22
loc_0d03:
    movsx edx, bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [nosplit eax*2 + LINK_ADDRESS_30]
    imul edx, edx, 0x2c
    mov dword [nosplit eax*2 + LINK_ADDRESS_26], 0x20
    mov byte [nosplit eax*2 + LINK_ADDRESS_27], 0x10
    xor cl, cl
    mov byte [nosplit eax*2 + LINK_ADDRESS_28], cl
    mov byte [nosplit eax*2 + LINK_ADDRESS_29], cl
    dec word [edx + LINK_ADDRESS_31]
loc_0d4b:
    cmp dword [edi + 4], 1
    je near loc_117e
    movsx edx, word [esp + 8]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [edi + 4], 1
    cmp word [eax + LINK_ADDRESS_42], 0x3de
    jne short loc_0d9b
    movsx edx, bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov byte [nosplit eax*2 + LINK_ADDRESS_45], 0xa
    jmp short loc_0db6
loc_0d9b:
    movsx edx, bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov byte [nosplit eax*2 + LINK_ADDRESS_45], 3
loc_0db6:
    movsx edx, bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dl, byte [esi + 0x11]
    mov byte [nosplit eax*2 + LINK_ADDRESS_46], dl
    movsx dx, byte [esi + 0x10]
    mov word [nosplit eax*2 + LINK_ADDRESS_47], dx
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0de9:
    mov edx, esp
    mov eax, esi
    call LINK_ADDRESS_25
    mov ebx, dword [esp]
    movsx edx, ax
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_48
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0e0b:
    movsx eax, word [esp + 8]
    mov edx, 0x10001
    mov ecx, dword [esp + 0xc]
    call LINK_ADDRESS_19
    test cx, cx
    jl short loc_0e49
    movsx edx, cx
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov edx, dword [eax + LINK_ADDRESS_49]
    mov ecx, dword [esi + 8]
    add edx, 0x1800
    cmp edx, ecx
    jge short loc_0e5c
loc_0e49:
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0e5c:
    cmp word [eax + LINK_ADDRESS_20], 2
    jne near loc_0ee5
    mov ecx, dword [edi + 4]
    inc ecx
    mov dword [edi + 4], ecx
    cmp ecx, 8
    jle short loc_0e89
    mov eax, dword [edi]
    inc eax
    mov dword [edi + 4], 0
    mov edx, eax
    mov dword [edi], eax
    and edx, 3
    mov dword [edi], edx
loc_0e89:
    mov ax, word [esi + 0x24]
    cmp ax, 0x80
    jge short loc_0eb2
    mov eax, dword [LINK_ADDRESS_35]
    mov edx, eax
    mov ebx, 0xd
    sar edx, 0x1f
    idiv ebx
    mov edx, eax
    movsx eax, word [esi + 0x24]
    add eax, edx
    mov word [esi + 0x24], ax
    jmp short loc_0ebb
loc_0eb2:
    mov edx, eax
    sub edx, 0x40
    mov word [esi + 0x24], dx
loc_0ebb:
    mov bx, word [esi + 0x20]
    test bx, bx
    jle short loc_0ed6
    mov ecx, ebx
    sub ecx, 4
    mov word [esi + 0x20], cx
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0ed6:
    mov word [esi + 0x20], 0
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0ee5:
    mov ebp, dword [edi + 4]
    inc ebp
    mov dword [edi + 4], ebp
    cmp ebp, 3
    jle short loc_0f04
    mov edx, dword [edi]
    inc edx
    mov dword [edi + 4], 0
    mov ebx, edx
    mov dword [edi], edx
    and ebx, 3
    mov dword [edi], ebx
loc_0f04:
    cmp word [esi + 0x24], 0x200
    jge short loc_0f29
    mov eax, dword [LINK_ADDRESS_35]
    mov edx, eax
    mov ebx, 3
    sar edx, 0x1f
    idiv ebx
    mov edx, eax
    movsx eax, word [esi + 0x24]
    add eax, edx
    mov word [esi + 0x24], ax
loc_0f29:
    mov cx, word [esi + 0x20]
    test cx, cx
    jg short loc_0f45
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0f45:
    mov edi, ecx
    dec edi
    mov word [esi + 0x20], di
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0f55:
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_41
    cmp word [esi + 0x24], 0x1000
    jle short loc_0f6d
    mov word [esi + 0x24], 0x1000
loc_0f6d:
    cmp word [esp + 0xc], 0
    jge short loc_0f88
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_0f88:
    movsx edx, word [esp + 8]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + LINK_ADDRESS_33]
    mov edx, dword [esi + 8]
    sub eax, 0x100
    cmp eax, edx
    jne short loc_1019
    cmp dword [edi], 3
    jge short loc_1019
    mov edx, 3
    sub dx, word [edi]
    call LINK_ADDRESS_12
    shl edx, 8
    and ah, 1
    neg edx
    sub edx, eax
    mov word [esi + 0x24], dx
    movsx edx, word [esp + 0xc]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_20], 2
    jne short loc_0fee
    sar word [esi + 0x24], 1
loc_0fee:
    shr byte [esi + 0x14], 1
    shr byte [esi + 0x15], 1
    call LINK_ADDRESS_12
    sar eax, 8
    cmp eax, 0x9f
    jl short loc_1015
    movsx eax, word [esp + 8]
    mov ecx, dword [esi + 8]
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    call LINK_ADDRESS_36
loc_1015:
    inc dword [edi]
    jmp short loc_1031
loc_1019:
    cmp dword [edi], 3
    jne short loc_1031
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_1031:
    mov dx, word [esi + 0x20]
    test dx, dx
    jle short loc_1052
    mov ebx, edx
    sub ebx, 2
    mov eax, ebx
    xor ah, bh
    and al, 3
    mov word [esi + 0x20], bx
    shl eax, 2
    mov word [esi + 0xc], ax
    jmp short loc_1058
loc_1052:
    mov word [esi + 0x20], 0
loc_1058:
    movsx eax, word [esp + 8]
    mov edx, 0x10001
    call LINK_ADDRESS_19
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_1070:
    mov word [esi + 0x20], 0
loc_1076:
    mov bx, word [esi + 0x24]
    cmp bx, 0x400
    jle short loc_10a2
    cmp bx, 0x500
    jge short loc_10a2
    movsx eax, word [esp + 8]
    mov ecx, dword [esi + 8]
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    call LINK_ADDRESS_36
    mov ax, word [esi + 0x18]
    mov dword [esp + 0xc], eax
loc_10a2:
    movsx edx, word [esp + 0xc]
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + LINK_ADDRESS_49]
    mov ebp, dword [esi + 8]
    sub eax, 0x200
    cmp eax, ebp
    jle near loc_1187
    mov eax, dword [edi + 4]
    cmp eax, 1
    jge short loc_10d5
    inc eax
    mov dword [edi + 4], eax
    jmp short loc_110e
loc_10d5:
    mov dword [edi + 4], 0
    cmp word [esi + 0xe], 0x95e
    jge short loc_10fa
    mov ecx, dword [edi]
    cmp ecx, 6
    jle short loc_10f3
    mov dword [edi], 0
    jmp short loc_110e
loc_10f3:
    lea ebp, [ecx + 1]
    mov dword [edi], ebp
    jmp short loc_110e
loc_10fa:
    mov edx, dword [edi]
    cmp edx, 2
    jle short loc_1109
    mov dword [edi], 0
    jmp short loc_110e
loc_1109:
    lea ebx, [edx + 1]
    mov dword [edi], ebx
loc_110e:
    mov cx, word [esi + 0x24]
    cmp cx, 0x1000
    jge short loc_112a
    mov ax, word [LINK_ADDRESS_35]
    mov edi, ecx
    sub eax, 0x32
    add edi, eax
    mov word [esi + 0x24], di
loc_112a:
    movsx eax, word [esi + 0x1c]
    add eax, 0x200
    and eax, 0x7ff
    movsx edx, word [nosplit eax*2 + SINTABLE]
    movsx eax, word [esi + 0x20]
    imul eax, edx
    sar eax, 0xe
    mov edx, dword [esi]
    add edx, eax
    mov ax, word [esi + 0x1c]
    and ah, 7
    mov dword [esi], edx
    cwde
    movsx edx, word [esi + 0x20]
    movsx eax, word [nosplit eax*2 + SINTABLE]
    imul eax, edx
    mov ebx, dword [esi + 4]
    sar eax, 0xe
    mov ecx, dword [esi + 8]
    add ebx, eax
    movsx eax, word [esi + 0x24]
    mov dword [esi + 4], ebx
    add ecx, eax
    mov dword [esi + 8], ecx
loc_117e:
    mov eax, dword [esp + 4]
    jmp near loc_000f
loc_1187:
    cmp word [esi + 0xe], 0x960
    jne short loc_11d1
    mov ax, word [esi + 0x22]
    test ax, ax
    jle short loc_11d1
    movsx edx, ax
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_50
    mov ecx, dword [esi + 8]
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    movsx esi, ax
    mov eax, esi
    call LINK_ADDRESS_36
    mov eax, esi
    imul esi, esi, 0x2c
    xor edx, edx
    call LINK_ADDRESS_51
    mov word [esi + LINK_ADDRESS_52], dx
    mov word [esi + LINK_ADDRESS_53], dx
loc_11d1:
    movsx eax, word [esp + 8]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 4]
    jmp near loc_000f
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x58
    xor edx, edx
    mov ax, word [LINK_ADDRESS_54]
    mov dword [LINK_ADDRESS_55], edx
    mov dword [LINK_ADDRESS_56], edx
loc_120d:
    mov dword [esp + 0x48], eax
    mov edx, dword [esp + 0x48]
    test dx, dx
    jl near LINK_ADDRESS_57
    movsx ebx, dx
    imul ebp, ebx, 0x2c
    add ebp, SPRITE
    mov ax, word [nosplit ebx*2 + NEXTSPRITESTAT]
    movsx edx, word [ebp + 0x18]
    mov dword [esp + 0x44], eax
    lea eax, [edx*4]
    add eax, edx
    mov edx, SECTOR
    lea eax, [eax*8]
    add edx, eax
    movsx eax, word [ebp + 0x26]
    mov dword [esp + 0x20], eax
    mov ax, word [ebp + 0x28]
    mov dword [esp + 0x54], eax
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    add eax, LINK_ADDRESS_4
    mov dword [esp + 0x38], edx
    add eax, 0x2f
    mov ecx, dword [esp + 0x20]
    mov dword [esp + 0x34], eax
    cmp ecx, 0x14
    jb near loc_1351
    jbe near loc_48ff
    cmp ecx, 0x1e
    jb short loc_1308
    jbe near loc_2403
    cmp ecx, 0x23
    jb short loc_12eb
    jbe near LINK_ADDRESS_59
    cmp ecx, 0x80
    jb short loc_12dd
    jbe near LINK_ADDRESS_60
    cmp ecx, 0x82
    jb near LINK_ADDRESS_61
    jbe near LINK_ADDRESS_62
    cmp ecx, 0x83
    je near LINK_ADDRESS_63
    jmp near LINK_ADDRESS_61
loc_12dd:
    cmp ecx, 0x24
    je near LINK_ADDRESS_64
    jmp near LINK_ADDRESS_61
loc_12eb:
    cmp ecx, 0x20
    jb near LINK_ADDRESS_65
    jbe near LINK_ADDRESS_66
    cmp ecx, 0x21
    jbe near LINK_ADDRESS_67
    jmp near LINK_ADDRESS_68
loc_1308:
    cmp ecx, 0x19
    jb short loc_1330
    jbe near LINK_ADDRESS_69
    cmp ecx, 0x1b
    jb near LINK_ADDRESS_70
    jbe near LINK_ADDRESS_71
    cmp ecx, 0x1c
    jbe near LINK_ADDRESS_72
    jmp near LINK_ADDRESS_73
loc_1330:
    cmp ecx, 0x16
    jb near LINK_ADDRESS_74
    jbe near LINK_ADDRESS_75
    cmp ecx, 0x18
    je near LINK_ADDRESS_68
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_1351:
    cmp ecx, 0xa
    jb short loc_13a1
    jbe near loc_354c
    cmp ecx, 0xf
    jb short loc_1384
    jbe near loc_3ce0
    cmp ecx, 0x11
    jb near loc_3d91
    jbe near loc_3e3f
    cmp ecx, 0x12
    jbe near loc_4373
    jmp near loc_4642
loc_1384:
    cmp ecx, 0xc
    jb near loc_3693
    jbe near loc_3881
    cmp ecx, 0xd
    jbe near loc_3a19
    jmp near loc_1be8
loc_13a1:
    cmp ecx, 3
    jb short loc_13d2
    jbe near loc_2d48
    cmp ecx, 5
    jb near loc_2e50
    jbe near loc_2fbf
    cmp ecx, 6
    jbe near loc_1a29
    cmp ecx, 8
    jb near LINK_ADDRESS_61
    jmp near loc_32d6
loc_13d2:
    cmp ecx, 1
    jb short loc_13e2
    jbe near loc_19ce
    jmp near loc_2b0d
loc_13e2:
    test ecx, ecx
    jne near LINK_ADDRESS_61
    movsx esi, word [ebp + 0x1e]
    imul eax, esi, 0x2c
    mov di, word [eax + LINK_ADDRESS_52]
    mov dword [esp + 0x14], ecx
    cmp di, -1
    jne short loc_1415
    movsx eax, word [esp + 0x48]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_1415:
    movsx eax, word [edx + 0x26]
    xor edi, edi
    sar eax, 3
    mov dx, word [edx + 0x22]
    mov dword [esp + 0x2c], eax
    cmp dx, 0x1e
    jne near loc_16ca
    mov ecx, eax
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    sar ecx, 2
    mov dx, word [eax + LINK_ADDRESS_31]
    mov dword [esp + 0x2c], ecx
    cmp dx, 1
    jne near loc_156d
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp word [eax + LINK_ADDRESS_76], 0x100
    jge short loc_14e0
    movsx edx, word [esp + 0x48]
    lea ebx, [edx*8]
    add ebx, edx
    lea ebx, [ebx*8]
    sub ebx, edx
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    mov cx, word [ebx + LINK_ADDRESS_76]
    lea eax, [eax*8]
    add ecx, 4
    sub eax, edx
    mov word [ebx + LINK_ADDRESS_76], cx
    cmp word [eax + LINK_ADDRESS_76], 0x100
    jl short loc_14cc
    movsx edx, word [esp + 0x48]
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_77
loc_14cc:
    cmp byte [ebp + 0x12], 0
    je short loc_14d9
    mov edi, 1
    jmp short loc_1500
loc_14d9:
    mov edi, 0xffffffff
    jmp short loc_1500
loc_14e0:
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov word [eax + LINK_ADDRESS_76], 0x100
loc_1500:
    mov eax, dword [esp + 0x38]
    mov edx, dword [ebp + 8]
    cmp edx, dword [eax + 8]
    jge short loc_1538
    mov eax, dword [esp + 0x38]
    mov edx, dword [eax + 8]
    sub edx, 0x200
    mov dword [eax + 8], edx
    mov ecx, 0xfffffe00
    mov ebx, dword [ebp + 8]
    mov dword [esp + 0x14], ecx
    cmp edx, ebx
    jge near loc_16a9
    mov dword [eax + 8], ebx
    jmp near loc_16a9
loc_1538:
    mov eax, dword [esp + 0x38]
    cmp edx, dword [eax + 8]
    jle near loc_16a9
    mov eax, dword [esp + 0x38]
    mov ecx, 0x200
    mov edx, dword [eax + 8]
    add edx, ecx
    mov dword [eax + 8], edx
    mov ebx, dword [ebp + 8]
    mov dword [esp + 0x14], ecx
    cmp edx, ebx
    jle near loc_16a9
    mov dword [eax + 8], ebx
    jmp near loc_16a9
loc_156d:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_31], 3
    jne near loc_16a9
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp word [eax + LINK_ADDRESS_76], 0
    jle short loc_160f
    movsx edx, word [esp + 0x48]
    lea ebx, [edx*8]
    add ebx, edx
    lea ebx, [ebx*8]
    sub ebx, edx
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    mov cx, word [ebx + LINK_ADDRESS_76]
    lea eax, [eax*8]
    sub ecx, 4
    sub eax, edx
    mov word [ebx + LINK_ADDRESS_76], cx
    cmp word [eax + LINK_ADDRESS_76], 0
    jg short loc_15fb
    movsx edx, word [esp + 0x48]
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_77
loc_15fb:
    cmp byte [ebp + 0x12], 0
    je short loc_1608
    mov edi, 0xffffffff
    jmp short loc_162f
loc_1608:
    mov edi, 1
    jmp short loc_162f
loc_160f:
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    xor edx, edx
    mov word [eax + LINK_ADDRESS_76], dx
loc_162f:
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [esp + 0x38]
    mov ebx, dword [edx + LINK_ADDRESS_78]
    cmp ebx, dword [eax + 8]
    jge short loc_167b
    mov dword [esp + 0x14], 0xfffffe00
    mov eax, dword [esp + 0x38]
    mov ebx, dword [eax + 8]
    sub ebx, 0x200
    mov dword [eax + 8], ebx
    mov ecx, dword [edx + LINK_ADDRESS_78]
    cmp ebx, ecx
    jge short loc_16a9
    jmp short loc_16a6
loc_167b:
    mov eax, dword [esp + 0x38]
    cmp ebx, dword [eax + 8]
    jle short loc_16a9
    mov dword [esp + 0x14], 0x200
    mov eax, dword [esp + 0x38]
    mov ebx, dword [eax + 8]
    add ebx, 0x200
    mov dword [eax + 8], ebx
    mov ecx, dword [edx + LINK_ADDRESS_78]
    cmp ebx, ecx
    jle short loc_16a9
loc_16a6:
    mov dword [eax + 8], ecx
loc_16a9:
    mov eax, dword [esp + 0x2c]
    imul eax, edi
    mov dx, word [ebp + 0x1c]
    add edx, eax
    mov eax, dword [esp + 0x2c]
    imul eax, edi
    mov word [ebp + 0x1c], dx
    mov edx, dword [esp + 0x34]
    jmp near loc_178f
loc_16ca:
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    cmp dword [eax + LINK_ADDRESS_18], 0
    je near LINK_ADDRESS_61
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    cmp dword [eax + LINK_ADDRESS_18], 2
    jne short loc_1717
    movsx eax, word [esp + 0x48]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_1717:
    imul eax, esi, 0x2c
    cmp word [eax + LINK_ADDRESS_79], 0x400
    jle short loc_172c
    mov edi, 0xffffffff
    jmp short loc_1731
loc_172c:
    mov edi, 1
loc_1731:
    mov eax, dword [esp + 0x34]
    cmp dword [eax + 0xc], 0
    jne short loc_1752
    imul edx, esi, 0x2c
    mov eax, ebp
    add edx, SPRITE
    call LINK_ADDRESS_38
    mov edx, dword [esp + 0x34]
    mov dword [edx + 0xc], eax
loc_1752:
    mov eax, dword [esp + 0x34]
    mov ax, word [eax + 0xc]
    mov word [ebp + 0x20], ax
    imul eax, esi, 0x2c
    mov edx, dword [eax + SPRITE]
    mov dword [ebp], edx
    mov eax, dword [eax + LINK_ADDRESS_16]
    mov dword [ebp + 4], eax
    mov eax, dword [esp + 0x2c]
    imul eax, edi
    mov cx, word [ebp + 0x1c]
    add ecx, eax
    mov eax, dword [esp + 0x2c]
    imul eax, edi
    mov edx, dword [esp + 0x34]
    mov word [ebp + 0x1c], cx
loc_178f:
    add dword [edx + 8], eax
    test edi, edi
    je near loc_19bb
    mov eax, dword [esp + 0x38]
    test byte [eax + 0xe], 0x40
    je near loc_19bb
    mov ax, word [CONNECTHEAD]
    jmp near loc_18c2
loc_17b3:
    movsx edx, cx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov dx, word [ebp + 0x18]
    mov dword [esp + 0x30], eax
    cmp dx, word [eax + LINK_ADDRESS_81]
    jne near loc_18b5
    mov eax, dword [esp + 0x30]
    cmp byte [eax + LINK_ADDRESS_82], 1
    jne near loc_18b5
    mov eax, dword [esp + 0x2c]
    imul eax, edi
    mov edx, dword [esp + 0x30]
    add word [edx + LINK_ADDRESS_83], ax
    mov eax, edx
    mov dh, byte [edx + LINK_ADDRESS_84]
    and dh, 7
    mov byte [eax + LINK_ADDRESS_84], dh
    mov edx, dword [esp + 0x30]
    mov eax, dword [esp + 0x14]
    mov ebx, dword [edx + LINK_ADDRESS_85]
    add ebx, eax
    mov eax, esp
    push eax
    lea eax, [esp + 8]
    push eax
    mov eax, dword [esp + 0x34]
    imul eax, edi
    push eax
    imul eax, esi, 0x2c
    mov dword [edx + LINK_ADDRESS_85], ebx
    mov ecx, dword [edx + LINK_ADDRESS_86]
    mov ebx, dword [edx + LINK_ADDRESS_87]
    mov edx, dword [eax + LINK_ADDRESS_16]
    mov eax, dword [eax + SPRITE]
    call LINK_ADDRESS_88
    mov edx, dword [esp + 0x30]
    mov eax, dword [esp + 4]
    mov ecx, dword [edx + LINK_ADDRESS_87]
    mov ebx, dword [edx + LINK_ADDRESS_89]
    sub eax, ecx
    add ebx, eax
    mov ecx, dword [edx + LINK_ADDRESS_86]
    mov dword [edx + LINK_ADDRESS_89], ebx
    mov eax, dword [esp]
    mov ebx, dword [edx + LINK_ADDRESS_90]
    sub eax, ecx
    add ebx, eax
    mov dword [edx + LINK_ADDRESS_90], ebx
    movsx edx, word [edx + LINK_ADDRESS_30]
    imul edx, edx, 0x2c
    cmp word [edx + LINK_ADDRESS_31], 0
    jg short loc_18b5
    mov eax, dword [esp + 4]
    mov dword [edx + SPRITE], eax
    mov eax, dword [esp]
    mov dword [edx + LINK_ADDRESS_16], eax
loc_18b5:
    movsx eax, word [esp + 0x50]
    mov ax, word [nosplit eax*2 + CONNECTPOINT2]
loc_18c2:
    mov dword [esp + 0x50], eax
    mov ecx, dword [esp + 0x50]
    test cx, cx
    jge near loc_17b3
    movsx eax, word [ebp + 0x18]
    mov ax, word [nosplit eax*2 + HEADSPRITESECT]
loc_18df:
    mov dword [esp + 0x50], eax
    mov eax, dword [esp + 0x50]
    test ax, ax
    jl near loc_19bb
    movsx edx, ax
    imul eax, edx, 0x2c
    mov bx, word [eax + LINK_ADDRESS_93]
    cmp bx, 3
    je near loc_19a9
    cmp bx, 4
    je near loc_19a9
    mov bx, word [eax + LINK_ADDRESS_10]
    cmp bx, 0xa07
    je near loc_19a9
    cmp bx, 0x214
    jne short loc_193e
    cmp word [eax + LINK_ADDRESS_94], 0
    jl short loc_193e
    mov ax, word [nosplit edx*2 + NEXTSPRITESECT]
    jmp short loc_18df
loc_193e:
    movsx eax, word [esp + 0x50]
    imul eax, eax, 0x2c
    mov edx, dword [esp + 0x2c]
    imul edx, edi
    add word [eax + LINK_ADDRESS_79], dx
    mov edx, dword [esp + 0x14]
    mov bl, byte [eax + LINK_ADDRESS_96]
    mov ecx, dword [eax + LINK_ADDRESS_17]
    and bl, 7
    add ecx, edx
    mov edx, SPRITE
    mov byte [eax + LINK_ADDRESS_96], bl
    add edx, eax
    mov dword [eax + LINK_ADDRESS_17], ecx
    lea ebx, [edx + 4]
    mov ecx, dword [eax + LINK_ADDRESS_16]
    push ebx
    mov ebx, dword [eax + SPRITE]
    imul eax, esi, 0x2c
    push edx
    mov edx, dword [esp + 0x34]
    imul edx, edi
    push edx
    mov edx, dword [eax + LINK_ADDRESS_16]
    mov eax, dword [eax + SPRITE]
    call LINK_ADDRESS_88
loc_19a9:
    movsx eax, word [esp + 0x50]
    mov ax, word [nosplit eax*2 + NEXTSPRITESECT]
    jmp near loc_18df
loc_19bb:
    movsx eax, word [esp + 0x48]
    call LINK_ADDRESS_97
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_19ce:
    movsx eax, word [ebp + 0x1e]
    cmp eax, -1
    jne near LINK_ADDRESS_61
    mov eax, dword [esp + 0x48]
    mov word [ebp + 0x1e], ax
    mov ebx, dword [esp + 0x54]
    movsx esi, word [LINK_ADDRESS_54]
loc_19ee:
    test esi, esi
    jl near LINK_ADDRESS_61
    imul eax, esi, 0x2c
    cmp word [eax + LINK_ADDRESS_52], 0x13
    jne short loc_1a1f
    cmp bx, word [eax + LINK_ADDRESS_53]
    jne short loc_1a1f
    mov eax, dword [esp + 0x34]
    mov dword [eax], 0
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_1a1f:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESTAT]
    jmp short loc_19ee
loc_1a29:
    mov ax, word [edx + 0x26]
    mov dword [esp + 0x4c], eax
    mov eax, dword [esp + 0x34]
    mov ecx, dword [eax + 0x10]
    test ecx, ecx
    jle near loc_1ad7
    lea esi, [ecx - 1]
    mov dword [eax + 0x10], esi
    movsx eax, word [esp + 0x4c]
    movsx edx, word [esp + 0x4c]
    sar eax, 3
    sub edx, eax
    mov eax, dword [esp + 0x34]
    cmp edx, dword [eax + 0x10]
    jg short loc_1a70
    movsx edx, word [esp + 0x4c]
    movsx eax, word [ebp + 0x20]
    sar edx, 5
    sub eax, edx
    mov word [ebp + 0x20], ax
loc_1a70:
    movsx ebx, word [esp + 0x4c]
    mov eax, ebx
    mov edx, dword [esp + 0x34]
    sar eax, 1
    mov ecx, dword [edx + 0x10]
    dec eax
    cmp eax, ecx
    jge short loc_1a96
    mov eax, ebx
    sar eax, 3
    sub ebx, eax
    cmp ebx, ecx
    jle short loc_1a96
    mov word [ebp + 0x20], 0
loc_1a96:
    movsx ebx, word [esp + 0x4c]
    mov edx, dword [esp + 0x34]
    mov eax, ebx
    mov edi, dword [edx + 0x10]
    sar eax, 1
    cmp eax, edi
    jle short loc_1ab9
    mov edx, ebx
    movsx eax, word [ebp + 0x20]
    sar edx, 5
    add eax, edx
    mov word [ebp + 0x20], ax
loc_1ab9:
    movsx eax, word [esp + 0x4c]
    mov edx, eax
    sar edx, 1
    sar eax, 3
    sub edx, eax
    mov eax, dword [esp + 0x34]
    cmp edx, dword [eax + 0x10]
    jle short loc_1adf
    mov dword [eax + 0x10], 0
loc_1ad7:
    mov eax, dword [esp + 0x4c]
    mov word [ebp + 0x20], ax
loc_1adf:
    movsx esi, word [LINK_ADDRESS_54]
loc_1ae6:
    test esi, esi
    jl near loc_1be3
    imul edx, esi, 0x2c
    cmp word [edx + LINK_ADDRESS_52], 0xe
    jne near loc_1bd6
    mov eax, dword [esp + 0x54]
    cmp ax, word [edx + LINK_ADDRESS_53]
    jne near loc_1bd6
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    mov ecx, dword [esp + 0x34]
    sub eax, esi
    mov edi, dword [ecx]
    mov ebx, eax
    cmp edi, dword [eax + LINK_ADDRESS_18]
    jne near loc_1bd6
    mov ax, word [ebp + 0x20]
    mov word [edx + LINK_ADDRESS_98], ax
    cmp dword [ebx + LINK_ADDRESS_99], 0
    jne short loc_1b5e
    mov eax, SPRITE
    add eax, edx
    mov edx, ebp
    call LINK_ADDRESS_100
    mov dword [ebx + LINK_ADDRESS_99], eax
loc_1b5e:
    lea ebx, [esi*8]
    add ebx, esi
    lea ebx, [ebx*8]
    sub ebx, esi
    imul ecx, esi, 0x2c
    mov eax, SPRITE
    mov edx, ebp
    add eax, ecx
    call LINK_ADDRESS_100
    mov edx, dword [ebx + LINK_ADDRESS_99]
    mov ebx, eax
    sub ebx, edx
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    mov dx, word [ecx + LINK_ADDRESS_31]
    mov dword [esp], eax
    test dx, dx
    je short loc_1baa
    mov ebx, eax
    neg ebx
    mov dword [esp], ebx
loc_1baa:
    mov eax, dword [esp]
    mov bx, word [ebp + 0x20]
    lea edx, [esi*8]
    add ebx, eax
    add edx, esi
    mov eax, dword [esp + 0x34]
    lea edx, [edx*8]
    mov word [ebp + 0x20], bx
    sub edx, esi
    mov eax, dword [eax + 0x10]
    mov dword [edx + LINK_ADDRESS_101], eax
loc_1bd6:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESTAT]
    jmp near loc_1ae6
loc_1be3:
    xor edi, edi
    mov dword [esp], edi
loc_1be8:
    movsx eax, word [ebp + 0x1e]
    cmp eax, -1
    jne short loc_1c09
    mov edx, dword [esp + 0x34]
    mov eax, dword [esp + 0x34]
    movsx edx, word [edx]
    movsx eax, word [eax + 0xc]
    call LINK_ADDRESS_102
    mov word [ebp + 0x1e], ax
loc_1c09:
    movsx eax, word [ebp + 0x1e]
    cmp eax, -1
    jne short loc_1c36
    mov eax, dword [esp + 0x34]
    mov ecx, dword [eax + 0xc]
    push ecx
    push LINK_ADDRESS_103
    push LINK_ADDRESS_104
    call SPRINTF
    add esp, 0xc
    mov eax, LINK_ADDRESS_104
    call LINK_ADDRESS_106
loc_1c36:
    movsx eax, word [ebp + 0x1e]
    imul eax, eax, 0x2c
    mov edx, ebp
    add eax, SPRITE
    call LINK_ADDRESS_38
    cmp eax, 0x400
    jge short loc_1cac
    cmp dword [esp + 0x20], 6
    jne short loc_1c76
    movsx eax, word [ebp + 0x1e]
    imul eax, eax, 0x2c
    test byte [eax + LINK_ADDRESS_53], 1
    je short loc_1c76
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x34]
    movsx eax, word [eax + 0x26]
    mov dword [edx + 0x10], eax
loc_1c76:
    mov eax, dword [esp + 0x34]
    inc dword [eax + 0xc]
    movsx edx, word [eax]
    movsx eax, word [eax + 0xc]
    call LINK_ADDRESS_102
    mov word [ebp + 0x1e], ax
    cwde
    cmp eax, -1
    jne short loc_1cac
    mov eax, dword [esp + 0x34]
    mov dword [eax + 0xc], 0
    movsx edx, word [eax]
    xor eax, eax
    call LINK_ADDRESS_102
    mov word [ebp + 0x1e], ax
loc_1cac:
    cmp word [ebp + 0x20], 0
    je near LINK_ADDRESS_61
    movsx edx, word [ebp + 0x1e]
    imul edx, edx, 0x2c
    mov ebx, dword [ebp + 4]
    mov eax, dword [edx + LINK_ADDRESS_16]
    sub eax, ebx
    mov ecx, dword [ebp]
    mov ebx, eax
    mov eax, dword [edx + SPRITE]
    mov edx, ebx
    sub eax, ecx
    call GETANGLE
    mov dword [esp], eax
    movsx edx, word [esp]
    movsx eax, word [ebp + 0x1c]
    call LINK_ADDRESS_108
    cwde
    mov edx, dword [esp + 0x34]
    sar eax, 3
    mov esi, dword [edx + 8]
    add esi, eax
    mov dword [esp + 0x2c], eax
    mov dword [edx + 8], esi
    mov eax, dword [esp + 0x2c]
    add word [ebp + 0x1c], ax
    mov edx, dword [esp + 0x38]
    mov ax, word [ebp + 0x20]
    cmp ax, word [edx + 0x26]
    jne near loc_1dfb
    test byte [edx + 0xe], 1
    jne short loc_1d6b
    test byte [edx + 0xc], 1
    jne short loc_1d6b
    movsx ebx, word [esp + 0x48]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov esi, dword [eax + LINK_ADDRESS_109]
    mov edx, eax
    imul eax, esi, 0xd
    cmp dword [eax + LINK_ADDRESS_110], 0
    jne near loc_1dfb
    xor eax, eax
    mov ax, word [edx + LINK_ADDRESS_109]
    mov edx, ebx
    call LINK_ADDRESS_22
    jmp near loc_1dfb
loc_1d6b:
    cmp dword [LINK_ADDRESS_111], 0
    jne near loc_1dfb
    mov eax, dword [esp + 0x38]
    cmp byte [eax + 0x1d], 0
    jne near loc_1dfb
    test byte [eax + 0xe], 1
    je short loc_1dfb
    call LINK_ADDRESS_12
    sar eax, 8
    cmp eax, 0xf7
    jl short loc_1dfb
    mov edx, esp
    mov eax, ebp
    call LINK_ADDRESS_25
    cmp dword [esp], 0x5000
    jge short loc_1dfb
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [ebp + 4]
    sub eax, dword [edx + LINK_ADDRESS_86]
    mov ecx, dword [edx + LINK_ADDRESS_87]
    mov ebx, eax
    mov eax, dword [ebp]
    mov edx, ebx
    sub eax, ecx
    movsx esi, word [ebp + 0x1c]
    call GETANGLE
    mov edx, 0xa2d
    mov word [ebp + 0x1c], ax
    movsx eax, word [esp + 0x48]
    call LINK_ADDRESS_112
    mov word [ebp + 0x1c], si
loc_1dfb:
    cmp word [ebp + 0x20], 0x40
    jg short loc_1e35
    mov eax, dword [esp + 0x38]
    test byte [eax + 0xe], 1
    jne short loc_1e35
    test byte [eax + 0xc], 1
    jne short loc_1e35
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx eax, word [eax + LINK_ADDRESS_109]
    call LINK_ADDRESS_113
loc_1e35:
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x38]
    mov eax, dword [eax + 8]
    sub eax, dword [edx + 4]
    cmp eax, 0x6c00
    jge near loc_1f64
    cmp byte [LINK_ADDRESS_114], 0
    jne near loc_1f64
    cmp word [ebp + 0x20], 0xc0
    jl near loc_1f64
    mov ax, word [CONNECTHEAD]
    jmp near loc_1f53
loc_1e72:
    movsx edx, bx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    movsx eax, word [edx + LINK_ADDRESS_30]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_31], 0
    jle near loc_1f46
    mov ax, word [edx + LINK_ADDRESS_81]
    lea ebx, [esp + 0x4c]
    mov dword [esp + 0x4c], eax
    mov eax, dword [edx + LINK_ADDRESS_86]
    mov ecx, dword [edx + LINK_ADDRESS_87]
    mov edx, eax
    mov eax, ecx
    call UPDATESECTOR
    movsx eax, word [esp + 0x4c]
    cmp eax, -1
    jne short loc_1ed7
    cmp byte [LINK_ADDRESS_114], 0
    je short loc_1f03
loc_1ed7:
    mov eax, dword [esp + 0x4c]
    mov si, word [ebp + 0x18]
    cmp ax, si
    jne short loc_1f46
    movsx edx, word [esp + 0x50]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    cmp si, word [nosplit eax*2 + LINK_ADDRESS_81]
    je short loc_1f46
loc_1f03:
    movsx edx, word [esp + 0x50]
    mov esi, edx
    shl esi, 7
    sub esi, edx
    lea esi, [esi*4]
    sub esi, edx
    add esi, esi
    mov ax, word [ebp + 0x18]
    mov word [esi + LINK_ADDRESS_81], ax
    mov ecx, dword [ebp + 8]
    mov ebx, dword [ebp + 4]
    mov edx, dword [ebp]
    movsx eax, word [esi + LINK_ADDRESS_30]
    call LINK_ADDRESS_36
    mov eax, LINK_ADDRESS_116
    add eax, esi
    call LINK_ADDRESS_117
loc_1f46:
    movsx eax, word [esp + 0x50]
    mov ax, word [nosplit eax*2 + CONNECTPOINT2]
loc_1f53:
    mov dword [esp + 0x50], eax
    mov ebx, dword [esp + 0x50]
    test bx, bx
    jge near loc_1e72
loc_1f64:
    movsx eax, word [ebp + 0x1c]
    add eax, 0x200
    and eax, 0x7ff
    movsx edx, word [nosplit eax*2 + SINTABLE]
    movsx eax, word [ebp + 0x20]
    imul eax, edx
    sar eax, 0xe
    mov dword [esp + 4], eax
    mov ax, word [ebp + 0x1c]
    and ah, 7
    cwde
    movsx edx, word [ebp + 0x20]
    movsx eax, word [nosplit eax*2 + SINTABLE]
    imul eax, edx
    sar eax, 0xe
    mov dword [esp], eax
    mov ax, word [CONNECTHEAD]
    jmp near loc_20af
loc_1fb0:
    movsx ebx, ax
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    movsx edx, word [nosplit eax*2 + LINK_ADDRESS_81]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_20], 2
    je near loc_20a2
    mov edx, ebx
    shl edx, 4
    mov bx, word [ebp + 0x18]
    cmp bx, word [edx + LINK_ADDRESS_118]
    jne short loc_2018
    mov eax, dword [esp + 4]
    mov ecx, dword [edx + LINK_ADDRESS_119]
    mov esi, dword [edx + LINK_ADDRESS_120]
    add ecx, eax
    mov eax, dword [esp]
    mov dword [edx + LINK_ADDRESS_119], ecx
    add esi, eax
    mov dword [edx + LINK_ADDRESS_120], esi
loc_2018:
    movsx edx, word [esp + 0x50]
    mov esi, edx
    shl esi, 7
    sub esi, edx
    lea esi, [esi*4]
    sub esi, edx
    add esi, esi
    movsx edx, word [esi + LINK_ADDRESS_30]
    imul edx, edx, 0x2c
    mov ax, word [ebp + 0x18]
    cmp ax, word [edx + LINK_ADDRESS_121]
    jne short loc_20a2
    mov eax, LINK_ADDRESS_116
    add eax, esi
    lea edx, [eax + 0x218]
    push edx
    add eax, 0x214
    mov edi, dword [esp + 0x30]
    push eax
    mov ecx, dword [esi + LINK_ADDRESS_86]
    mov ebx, dword [esi + LINK_ADDRESS_87]
    push edi
    mov edx, dword [ebp + 4]
    mov eax, dword [ebp]
    call LINK_ADDRESS_88
    movsx eax, word [esi + LINK_ADDRESS_30]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_31], 0
    jg short loc_20a2
    mov edx, dword [esi + LINK_ADDRESS_87]
    mov dword [eax + SPRITE], edx
    mov edx, dword [esi + LINK_ADDRESS_86]
    mov dword [eax + LINK_ADDRESS_16], edx
loc_20a2:
    movsx eax, word [esp + 0x50]
    mov ax, word [nosplit eax*2 + CONNECTPOINT2]
loc_20af:
    mov dword [esp + 0x50], eax
    mov eax, dword [esp + 0x50]
    test ax, ax
    jge near loc_1fb0
    movsx eax, word [ebp + 0x18]
    movsx esi, word [nosplit eax*2 + HEADSPRITESECT]
loc_20cc:
    test esi, esi
    jl near loc_21c2
    imul edi, esi, 0x2c
    cmp word [edi + LINK_ADDRESS_93], 0xa
    je near loc_21b5
    movsx edx, word [edi + LINK_ADDRESS_121]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_20], 2
    je near loc_21b5
    mov cx, word [edi + LINK_ADDRESS_10]
    cmp cx, 1
    je near loc_21b5
    cmp cx, 6
    je near loc_21b5
    mov eax, SPRITE
    add eax, edi
    lea edx, [eax + 4]
    push edx
    mov ecx, dword [esp + 0x30]
    push eax
    mov ebx, dword [edi + SPRITE]
    mov edx, dword [ebp + 4]
    push ecx
    mov eax, dword [ebp]
    mov ecx, dword [edi + LINK_ADDRESS_16]
    call LINK_ADDRESS_88
    mov eax, dword [esp + 4]
    mov edx, dword [edi + SPRITE]
    add edx, eax
    mov ebx, dword [edi + LINK_ADDRESS_16]
    mov dword [edi + SPRITE], edx
    mov eax, dword [esp]
    mov dx, word [edi + LINK_ADDRESS_79]
    add ebx, eax
    mov eax, dword [esp + 0x2c]
    mov dword [edi + LINK_ADDRESS_16], ebx
    add edx, eax
    mov bx, word [NUMPLAYERS]
    mov word [edi + LINK_ADDRESS_79], dx
    cmp bx, 1
    jle short loc_21b5
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov edx, dword [edi + SPRITE]
    mov dword [eax + LINK_ADDRESS_7], edx
    mov edx, dword [edi + LINK_ADDRESS_16]
    mov dword [eax + LINK_ADDRESS_8], edx
loc_21b5:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESECT]
    jmp near loc_20cc
loc_21c2:
    movsx esi, word [esp + 0x48]
    mov eax, esi
    call LINK_ADDRESS_97
    mov eax, esi
    mov ecx, dword [ebp + 8]
    mov ebx, dword [ebp + 4]
    mov edx, dword [ebp]
    call LINK_ADDRESS_36
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x38]
    mov eax, dword [eax + 8]
    sub eax, dword [edx + 4]
    cmp eax, 0x6c00
    jge near LINK_ADDRESS_61
    cmp byte [LINK_ADDRESS_114], 0
    jne near loc_232f
    cmp word [ebp + 0x20], 0xc0
    jl near loc_232f
    mov ax, word [CONNECTHEAD]
    jmp near loc_231e
loc_221b:
    movsx edx, cx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    movsx eax, word [edx + LINK_ADDRESS_30]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_31], 0
    jle near loc_2311
    mov ax, word [edx + LINK_ADDRESS_81]
    lea ebx, [esp + 0x4c]
    mov dword [esp + 0x4c], eax
    mov eax, dword [edx + LINK_ADDRESS_86]
    mov ecx, dword [edx + LINK_ADDRESS_87]
    mov edx, eax
    mov eax, ecx
    call UPDATESECTOR
    movsx eax, word [esp + 0x4c]
    cmp eax, -1
    jne short loc_2280
    cmp byte [LINK_ADDRESS_114], 0
    je short loc_22b0
loc_2280:
    mov eax, dword [esp + 0x4c]
    mov di, word [ebp + 0x18]
    cmp ax, di
    jne near loc_2311
    movsx edx, word [esp + 0x50]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    cmp di, word [nosplit eax*2 + LINK_ADDRESS_81]
    je short loc_2311
loc_22b0:
    movsx edx, word [esp + 0x50]
    mov esi, edx
    shl esi, 7
    sub esi, edx
    lea esi, [esi*4]
    sub esi, edx
    add esi, esi
    mov eax, dword [ebp]
    mov dword [esi + LINK_ADDRESS_87], eax
    mov dword [esi + LINK_ADDRESS_123], eax
    mov eax, dword [ebp + 4]
    mov dword [esi + LINK_ADDRESS_86], eax
    mov dword [esi + LINK_ADDRESS_124], eax
    mov ax, word [ebp + 0x18]
    mov word [esi + LINK_ADDRESS_81], ax
    mov ecx, dword [ebp + 8]
    mov ebx, dword [ebp + 4]
    mov edx, dword [ebp]
    movsx eax, word [esi + LINK_ADDRESS_30]
    call LINK_ADDRESS_36
    mov eax, LINK_ADDRESS_116
    add eax, esi
    call LINK_ADDRESS_117
loc_2311:
    movsx eax, word [esp + 0x50]
    mov ax, word [nosplit eax*2 + CONNECTPOINT2]
loc_231e:
    mov dword [esp + 0x50], eax
    mov ecx, dword [esp + 0x50]
    test cx, cx
    jge near loc_221b
loc_232f:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_94]
    imul eax, eax, 0x2c
    movsx esi, word [eax + LINK_ADDRESS_121]
    movsx esi, word [nosplit esi*2 + HEADSPRITESECT]
loc_2350:
    test esi, esi
    jl near LINK_ADDRESS_61
    movsx edi, word [nosplit esi*2 + NEXTSPRITESECT]
    imul esi, esi, 0x2c
    mov bx, word [esi + LINK_ADDRESS_93]
    cmp bx, 1
    jne near loc_23fc
    mov eax, SPRITE
    add eax, esi
    mov dword [esp + 0x18], eax
    call LINK_ADDRESS_125
    test ax, ax
    je near loc_23fc
    mov cx, word [esi + LINK_ADDRESS_10]
    cmp cx, bx
    je short loc_23fc
    cmp cx, 6
    je short loc_23fc
    lea ebx, [esp + 0x4c]
    mov ax, word [esi + LINK_ADDRESS_121]
    mov edx, dword [esi + LINK_ADDRESS_16]
    mov dword [esp + 0x4c], eax
    mov eax, dword [esi + SPRITE]
    call UPDATESECTOR
    cmp word [esi + LINK_ADDRESS_31], 0
    jl short loc_23fc
    mov eax, dword [esp + 0x4c]
    cmp ax, word [ebp + 0x18]
    jne short loc_23fc
    mov ebx, 0x48
    mov edx, 0x8ee
    mov eax, dword [esp + 0x18]
    movsx ecx, word [MYCONNECTINDEX]
    call LINK_ADDRESS_127
    movsx edx, word [esp + 0x48]
    mov eax, 0x45
    call LINK_ADDRESS_22
loc_23fc:
    mov esi, edi
    jmp near loc_2350
loc_2403:
    movsx eax, word [ebp + 0x1e]
    cmp eax, -1
    jne short loc_243b
    mov eax, dword [esp + 0x34]
    cmp dword [eax + 0xc], 0
    sete al
    mov edx, eax
    mov eax, dword [esp + 0x34]
    and edx, 0xff
    mov dword [eax + 0xc], edx
    movsx edx, word [eax]
    movsx eax, word [eax + 0xc]
    call LINK_ADDRESS_102
    mov word [ebp + 0x1e], ax
    jmp near loc_259f
loc_243b:
    mov eax, dword [esp + 0x34]
    cmp dword [eax + 0x10], 1
    jne short loc_24aa
    movsx eax, word [ebp + 0x1e]
    imul eax, eax, 0x2c
    mov ebx, SPRITE
    mov edx, ebp
    add eax, ebx
    call LINK_ADDRESS_38
    cmp eax, 0x780
    jge short loc_246e
    mov eax, dword [esp + 0x34]
    mov dword [eax + 0x10], 2
    jmp short loc_24aa
loc_246e:
    cmp word [ebp + 0x20], 0
    jne short loc_2494
    mov eax, dword [esp + 0x34]
    mov ebx, dword [eax + 0xc]
    mov edx, 0xffffffff
    test ebx, ebx
    sete al
    mov si, word [ebp + 0x28]
    xor ah, ah
    add eax, esi
    cwde
    call LINK_ADDRESS_128
loc_2494:
    mov di, word [ebp + 0x20]
    cmp di, 0x100
    jge short loc_24aa
    mov eax, edi
    db 0x05, 0x10, 0x00, 0x00, 0x00    ; add eax, 0x10
    mov word [ebp + 0x20], ax
loc_24aa:
    mov eax, dword [esp + 0x34]
    cmp dword [eax + 0x10], 2
    jne near loc_259f
    movsx edx, word [ebp + 0x1e]
    imul edx, edx, 0x2c
    mov esi, dword [ebp + 4]
    mov edi, dword [ebp]
    mov ebx, dword [edx + LINK_ADDRESS_16]
    mov eax, dword [edx + SPRITE]
    sub ebx, esi
    sub eax, edi
    mov edx, ebx
    call LINK_ADDRESS_129
    cmp eax, 0x80
    jg short loc_24e9
    mov word [ebp + 0x20], 0
loc_24e9:
    mov dx, word [ebp + 0x20]
    test dx, dx
    jle short loc_2500
    mov ecx, edx
    sub ecx, 0x10
    mov word [ebp + 0x20], cx
    jmp near loc_259f
loc_2500:
    mov word [ebp + 0x20], 0
    mov edx, dword [esp + 0x34]
    mov ax, word [ebp + 0x28]
    add ax, word [edx + 0xc]
    mov edx, 0xffffffff
    cwde
    call LINK_ADDRESS_128
    mov cl, byte [ebp + 0x1d]
    mov word [ebp + 0x1e], 0xffff
    add cl, 4
    mov eax, dword [esp + 0x34]
    mov byte [ebp + 0x1d], cl
    mov dword [eax + 0x10], 0
    movsx eax, word [esp + 0x48]
    movsx edx, word [ebp + 0x28]
    call LINK_ADDRESS_130
    movsx eax, word [ebp + 0x18]
    movsx esi, word [nosplit eax*2 + HEADSPRITESECT]
loc_2551:
    test esi, esi
    jl short loc_259f
    imul edx, esi, 0x2c
    mov cx, word [edx + LINK_ADDRESS_10]
    cmp cx, 1
    je short loc_2595
    cmp cx, 6
    je short loc_2595
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov ebx, dword [edx + SPRITE]
    mov edx, dword [edx + LINK_ADDRESS_16]
    mov dword [eax + LINK_ADDRESS_7], ebx
    mov dword [eax + LINK_ADDRESS_8], edx
loc_2595:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESECT]
    jmp short loc_2551
loc_259f:
    cmp word [ebp + 0x20], 0
    je near LINK_ADDRESS_61
    movsx eax, word [ebp + 0x1c]
    add eax, 0x200
    and eax, 0x7ff
    movsx edi, word [nosplit eax*2 + SINTABLE]
    movsx eax, word [ebp + 0x20]
    imul edi, eax
    mov dx, word [ebp + 0x1c]
    and dh, 7
    movsx edx, dx
    movsx edx, word [nosplit edx*2 + SINTABLE]
    imul eax, edx
    sar eax, 0xe
    mov edx, dword [esp + 0x38]
    mov dword [esp], eax
    mov eax, dword [esp + 0x38]
    mov ebx, dword [edx + 4]
    mov eax, dword [eax + 8]
    sub eax, ebx
    sar edi, 0xe
    cmp eax, 0x6c00
    jge near loc_270a
    cmp byte [LINK_ADDRESS_114], 0
    jne near loc_270a
    mov ax, word [CONNECTHEAD]
    jmp near loc_26f9
loc_2618:
    movsx edx, dx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    movsx eax, word [edx + LINK_ADDRESS_30]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_31], 0
    jle near loc_26ec
    mov ax, word [edx + LINK_ADDRESS_81]
    lea ebx, [esp + 0x4c]
    mov dword [esp + 0x4c], eax
    mov eax, dword [edx + LINK_ADDRESS_86]
    mov ecx, dword [edx + LINK_ADDRESS_87]
    mov edx, eax
    mov eax, ecx
    call UPDATESECTOR
    movsx eax, word [esp + 0x4c]
    cmp eax, -1
    jne short loc_267d
    cmp byte [LINK_ADDRESS_114], 0
    je short loc_26a9
loc_267d:
    mov eax, dword [esp + 0x4c]
    mov cx, word [ebp + 0x18]
    cmp ax, cx
    jne short loc_26ec
    movsx edx, word [esp + 0x50]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    cmp cx, word [nosplit eax*2 + LINK_ADDRESS_81]
    je short loc_26ec
loc_26a9:
    movsx edx, word [esp + 0x50]
    mov esi, edx
    shl esi, 7
    sub esi, edx
    lea esi, [esi*4]
    sub esi, edx
    add esi, esi
    mov ax, word [ebp + 0x18]
    mov word [esi + LINK_ADDRESS_81], ax
    mov ecx, dword [ebp + 8]
    mov ebx, dword [ebp + 4]
    mov edx, dword [ebp]
    movsx eax, word [esi + LINK_ADDRESS_30]
    call LINK_ADDRESS_36
    mov eax, LINK_ADDRESS_116
    add eax, esi
    call LINK_ADDRESS_117
loc_26ec:
    movsx eax, word [esp + 0x50]
    mov ax, word [nosplit eax*2 + CONNECTPOINT2]
loc_26f9:
    mov dword [esp + 0x50], eax
    mov edx, dword [esp + 0x50]
    test dx, dx
    jge near loc_2618
loc_270a:
    mov ax, word [CONNECTHEAD]
    jmp near loc_2802
loc_2715:
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    movsx eax, word [edx + LINK_ADDRESS_30]
    imul eax, eax, 0x2c
    mov bx, word [ebp + 0x18]
    cmp bx, word [eax + LINK_ADDRESS_121]
    jne near loc_27c1
    mov eax, dword [esp]
    mov ecx, dword [edx + LINK_ADDRESS_87]
    mov esi, dword [edx + LINK_ADDRESS_86]
    add ecx, edi
    add esi, eax
    mov dword [edx + LINK_ADDRESS_87], ecx
    mov cx, word [NUMPLAYERS]
    mov dword [edx + LINK_ADDRESS_86], esi
    cmp cx, 1
    jle short loc_278a
    mov eax, dword [edx + LINK_ADDRESS_87]
    mov dword [edx + LINK_ADDRESS_123], eax
    mov eax, dword [edx + LINK_ADDRESS_86]
    mov dword [edx + LINK_ADDRESS_124], eax
loc_278a:
    movsx edx, word [esp + 0x50]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [edx + LINK_ADDRESS_89]
    add eax, edi
    mov ebx, dword [edx + LINK_ADDRESS_90]
    mov dword [edx + LINK_ADDRESS_89], eax
    mov eax, dword [esp]
    add ebx, eax
    mov dword [edx + LINK_ADDRESS_90], ebx
loc_27c1:
    movsx edx, word [esp + 0x50]
    shl edx, 4
    mov si, word [ebp + 0x18]
    cmp si, word [edx + LINK_ADDRESS_118]
    jne short loc_27f5
    mov eax, dword [esp]
    mov ecx, dword [edx + LINK_ADDRESS_119]
    mov esi, dword [edx + LINK_ADDRESS_120]
    add ecx, edi
    add esi, eax
    mov dword [edx + LINK_ADDRESS_119], ecx
    mov dword [edx + LINK_ADDRESS_120], esi
loc_27f5:
    movsx eax, word [esp + 0x50]
    mov ax, word [nosplit eax*2 + CONNECTPOINT2]
loc_2802:
    mov dword [esp + 0x50], eax
    mov eax, dword [esp + 0x50]
    test ax, ax
    jge near loc_2715
    movsx eax, word [ebp + 0x18]
    mov cx, word [NUMPLAYERS]
    movsx esi, word [nosplit eax*2 + HEADSPRITESECT]
loc_2826:
    test esi, esi
    jl near loc_28df
    imul edx, esi, 0x2c
    mov ax, word [edx + LINK_ADDRESS_10]
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    je near loc_28d2
    db 0x66, 0x3d, 0x06, 0x00    ; cmp ax, 6
    je near loc_28d2
    cmp cx, 2
    jge short loc_287c
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov ebx, dword [edx + SPRITE]
    mov edx, dword [edx + LINK_ADDRESS_16]
    mov dword [eax + LINK_ADDRESS_7], ebx
    mov dword [eax + LINK_ADDRESS_8], edx
loc_287c:
    imul edx, esi, 0x2c
    mov eax, dword [edx + SPRITE]
    add eax, edi
    mov ebx, dword [edx + LINK_ADDRESS_16]
    mov dword [edx + SPRITE], eax
    add ebx, dword [esp]
    mov ax, word [NUMPLAYERS]
    mov dword [edx + LINK_ADDRESS_16], ebx
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jle short loc_28d2
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov ebx, dword [edx + SPRITE]
    mov edx, dword [edx + LINK_ADDRESS_16]
    mov dword [eax + LINK_ADDRESS_7], ebx
    mov dword [eax + LINK_ADDRESS_8], edx
loc_28d2:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESECT]
    jmp near loc_2826
loc_28df:
    movsx esi, word [esp + 0x48]
    mov eax, esi
    call LINK_ADDRESS_97
    mov eax, esi
    mov ecx, dword [ebp + 8]
    mov ebx, dword [ebp + 4]
    mov edx, dword [ebp]
    call LINK_ADDRESS_36
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x38]
    mov eax, dword [eax + 8]
    sub eax, dword [edx + 4]
    cmp eax, 0x6c00
    jge near LINK_ADDRESS_61
    cmp byte [LINK_ADDRESS_114], 0
    jne near loc_2a3a
    mov ax, word [CONNECTHEAD]
    jmp near loc_2a29
loc_292c:
    movsx edx, dx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    movsx eax, word [edx + LINK_ADDRESS_30]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_31], 0
    jle near loc_2a1c
    mov ax, word [edx + LINK_ADDRESS_81]
    lea ebx, [esp + 0x4c]
    mov dword [esp + 0x4c], eax
    mov eax, dword [edx + LINK_ADDRESS_86]
    mov ecx, dword [edx + LINK_ADDRESS_87]
    mov edx, eax
    mov eax, ecx
    call UPDATESECTOR
    movsx eax, word [esp + 0x4c]
    cmp eax, -1
    jne short loc_2991
    cmp byte [LINK_ADDRESS_114], 0
    je short loc_29c1
loc_2991:
    mov eax, dword [esp + 0x4c]
    mov cx, word [ebp + 0x18]
    cmp ax, cx
    jne near loc_2a1c
    movsx edx, word [esp + 0x50]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    cmp cx, word [nosplit eax*2 + LINK_ADDRESS_81]
    je short loc_2a1c
loc_29c1:
    movsx edx, word [esp + 0x50]
    mov esi, edx
    shl esi, 7
    sub esi, edx
    lea esi, [esi*4]
    sub esi, edx
    add esi, esi
    mov eax, dword [esi + LINK_ADDRESS_87]
    mov dword [esi + LINK_ADDRESS_123], eax
    mov eax, dword [esi + LINK_ADDRESS_86]
    mov dword [esi + LINK_ADDRESS_124], eax
    mov ax, word [ebp + 0x18]
    mov word [esi + LINK_ADDRESS_81], ax
    mov ecx, dword [ebp + 8]
    mov ebx, dword [ebp + 4]
    mov edx, dword [ebp]
    movsx eax, word [esi + LINK_ADDRESS_30]
    call LINK_ADDRESS_36
    mov eax, LINK_ADDRESS_116
    add eax, esi
    call LINK_ADDRESS_117
loc_2a1c:
    movsx eax, word [esp + 0x50]
    mov ax, word [nosplit eax*2 + CONNECTPOINT2]
loc_2a29:
    mov dword [esp + 0x50], eax
    mov edx, dword [esp + 0x50]
    test dx, dx
    jge near loc_292c
loc_2a3a:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_94]
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_121]
    movsx esi, word [nosplit eax*2 + HEADSPRITESECT]
loc_2a5b:
    test esi, esi
    jl near LINK_ADDRESS_61
    imul ecx, esi, 0x2c
    mov ax, word [ecx + LINK_ADDRESS_93]
    movsx edi, word [nosplit esi*2 + NEXTSPRITESECT]
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jne near loc_2b06
    mov eax, SPRITE
    add eax, ecx
    mov dword [esp + 0x1c], eax
    call LINK_ADDRESS_125
    test ax, ax
    je near loc_2b06
    mov dx, word [ecx + LINK_ADDRESS_10]
    cmp dx, 1
    je short loc_2b06
    cmp dx, 6
    je short loc_2b06
    lea ebx, [esp + 0x4c]
    mov ax, word [ecx + LINK_ADDRESS_121]
    mov edx, dword [ecx + LINK_ADDRESS_16]
    mov dword [esp + 0x4c], eax
    mov eax, dword [ecx + SPRITE]
    call UPDATESECTOR
    cmp word [ecx + LINK_ADDRESS_31], 0
    jl short loc_2b06
    mov eax, dword [esp + 0x4c]
    cmp ax, word [ebp + 0x18]
    jne short loc_2b06
    mov ebx, 0x18
    mov edx, 0x8ee
    mov eax, dword [esp + 0x1c]
    movsx ecx, word [MYCONNECTINDEX]
    call LINK_ADDRESS_127
    mov eax, 0x45
    movsx edx, si
    call LINK_ADDRESS_22
loc_2b06:
    mov esi, edi
    jmp near loc_2a5b
loc_2b0d:
    cmp dword [eax + 0x10], 0
    jle short loc_2b36
    cmp dword [eax], 0
    jne short loc_2b36
    mov edx, dword [esp + 0x34]
    movsx eax, word [esp + 0x54]
    mov esi, dword [edx + 0x10]
    cmp eax, esi
    jle short loc_2b30
    lea edi, [esi + 1]
    mov dword [edx + 0x10], edi
    jmp short loc_2b36
loc_2b30:
    mov dword [edx], 1
loc_2b36:
    mov eax, dword [esp + 0x34]
    mov edx, dword [eax]
    test edx, edx
    jle near LINK_ADDRESS_61
    lea ebx, [edx + 1]
    mov dword [eax], ebx
    mov word [ebp + 0x20], 3
    mov ecx, dword [eax]
    cmp ecx, 0x60
    jle short loc_2b76
    mov dword [eax], 0xffffffff
    mov dword [eax + 0x10], 0xffffffff
    movsx eax, word [esp + 0x48]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_2b76:
    mov eax, ecx
    and eax, 0x1f
    cmp eax, 8
    jne short loc_2bb1
    movsx edx, word [LINK_ADDRESS_131]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov bh, 0x30
    movsx edx, word [nosplit eax*2 + LINK_ADDRESS_30]
    mov eax, 0x51
    mov byte [LINK_ADDRESS_132], bh
    call LINK_ADDRESS_22
loc_2bb1:
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x34]
    movsx eax, word [eax + 0x1a]
    sub eax, dword [edx + 0x14]
    test eax, eax
    jns short loc_2bc6
    neg eax
loc_2bc6:
    cmp eax, 8
    jge short loc_2bd9
    mov ax, word [edx + 0x14]
    mov edx, dword [esp + 0x38]
    mov word [edx + 0x1a], ax
    jmp short loc_2bfc
loc_2bd9:
    mov ebx, dword [esp + 0x38]
    mov eax, dword [edx + 0x14]
    movsx ebx, word [ebx + 0x1a]
    sub eax, ebx
    mov ebx, eax
    mov edx, dword [esp + 0x38]
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    shl eax, 4
    add word [edx + 0x1a], ax
loc_2bfc:
    movsx eax, word [ebp + 0x1c]
    add eax, 0x200
    and eax, 0x7ff
    movsx edx, word [ebp + 0x20]
    movsx eax, word [nosplit eax*2 + SINTABLE]
    imul eax, edx
    sar eax, 0xe
    mov dword [esp + 4], eax
    mov ax, word [ebp + 0x1c]
    and ah, 7
    cwde
    movsx edx, word [ebp + 0x20]
    movsx eax, word [nosplit eax*2 + SINTABLE]
    imul eax, edx
    sar eax, 0xe
    mov dword [esp], eax
    mov ax, word [CONNECTHEAD]
    jmp near loc_2cc7
loc_2c48:
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov di, word [ebp + 0x18]
    cmp di, word [edx + LINK_ADDRESS_81]
    jne short loc_2cba
    cmp byte [edx + LINK_ADDRESS_82], 0
    je short loc_2cba
    mov eax, dword [esp + 4]
    mov ebx, dword [edx + LINK_ADDRESS_87]
    mov ecx, dword [edx + LINK_ADDRESS_86]
    mov esi, dword [edx + LINK_ADDRESS_89]
    mov edi, dword [edx + LINK_ADDRESS_90]
    add ebx, eax
    mov eax, dword [esp]
    mov dword [edx + LINK_ADDRESS_87], ebx
    add ecx, eax
    mov eax, dword [esp + 4]
    mov dword [edx + LINK_ADDRESS_86], ecx
    add esi, eax
    mov eax, dword [esp]
    mov dword [edx + LINK_ADDRESS_89], esi
    add edi, eax
    mov dword [edx + LINK_ADDRESS_90], edi
loc_2cba:
    movsx eax, word [esp + 0x50]
    mov ax, word [nosplit eax*2 + CONNECTPOINT2]
loc_2cc7:
    mov dword [esp + 0x50], eax
    mov esi, dword [esp + 0x50]
    test si, si
    jge near loc_2c48
    movsx esi, word [ebp + 0x18]
    movsx esi, word [nosplit esi*2 + HEADSPRITESECT]
loc_2ce4:
    test esi, esi
    jl near LINK_ADDRESS_133
    imul edx, esi, 0x2c
    mov ax, word [nosplit esi*2 + NEXTSPRITESECT]
    mov dword [esp + 0x40], eax
    cmp word [edx + LINK_ADDRESS_10], 1
    je short loc_2d41
    mov eax, dword [esp + 4]
    mov ebx, dword [edx + SPRITE]
    mov ecx, dword [edx + LINK_ADDRESS_16]
    add ebx, eax
    mov eax, dword [esp]
    mov dword [edx + SPRITE], ebx
    add ecx, eax
    mov dword [edx + LINK_ADDRESS_16], ecx
    mov eax, esi
    mov ecx, dword [edx + LINK_ADDRESS_17]
    mov ebx, dword [edx + LINK_ADDRESS_16]
    mov edx, dword [edx + SPRITE]
    call LINK_ADDRESS_36
loc_2d41:
    movsx esi, word [esp + 0x40]
    jmp short loc_2ce4
loc_2d48:
    cmp dword [eax + 0x10], 0
    je near LINK_ADDRESS_61
    mov edx, esp
    mov eax, ebp
    call LINK_ADDRESS_25
    movsx eax, word [esp + 0x54]
    movsx edx, word [LINK_ADDRESS_11]
    lea ebx, [eax + 1]
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    and eax, 0x1f
    cmp eax, 4
    jge short loc_2db0
    mov eax, dword [esp + 0x34]
    cmp dword [eax + 8], 0
    jne short loc_2db0
    movsx eax, word [ebp + 0x1e]
    mov edx, dword [esp + 0x38]
    sar eax, 8
    mov byte [edx + 0x15], al
    mov al, byte [ebp + 0x1e]
    mov byte [edx + 0x1d], al
    mov ax, word [LINK_ADDRESS_11]
    xor ah, ah
    and al, 0xf
    movsx edx, byte [ebp + 0x10]
    cwde
    add edx, eax
    mov eax, dword [esp + 0x34]
    mov dword [eax], edx
    jmp short loc_2dca
loc_2db0:
    mov edx, dword [esp + 0x38]
    mov al, byte [ebp + 0x11]
    mov byte [edx + 0x15], al
    mov byte [edx + 0x1d], al
    mov eax, dword [esp + 0x34]
    mov edx, dword [esp + 0x34]
    mov eax, dword [eax + 0xc]
    mov dword [edx], eax
loc_2dca:
    mov eax, dword [esp + 0x34]
    mov edx, dword [esp + 0x38]
    mov al, byte [eax]
    mov byte [edx + 0x14], al
    mov eax, dword [esp + 0x34]
    mov al, byte [eax]
    mov byte [edx + 0x1c], al
    movsx eax, word [edx]
    mov edx, WALL
    shl eax, 5
    add edx, eax
    mov eax, dword [esp + 0x38]
    movsx eax, word [eax + 2]
    mov dword [esp], eax
    cmp dword [esp], 0
    jg short loc_2e07
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_2e07:
    cmp word [edx + 0x1c], 1
    je short loc_2e37
    mov eax, dword [esp + 0x34]
    mov al, byte [eax]
    mov ch, byte [edx + 0xe]
    mov byte [edx + 0x14], al
    test ch, 2
    je short loc_2e37
    mov cx, word [edx + 0xa]
    test cx, cx
    jl short loc_2e37
    movsx eax, cx
    shl eax, 5
    mov bl, byte [edx + 0x14]
    mov byte [eax + LINK_ADDRESS_135], bl
loc_2e37:
    mov edi, dword [esp]
    dec edi
    add edx, 0x20
    mov dword [esp], edi
    cmp dword [esp], 0
    jg short loc_2e07
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_2e50:
    movsx eax, word [esp + 0x54]
    movsx edx, word [LINK_ADDRESS_11]
    lea ebx, [eax + 1]
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    and eax, 0x1f
    cmp eax, 4
    jge short loc_2eb5
    mov ax, word [LINK_ADDRESS_11]
    xor ah, ah
    and al, 0xf
    movsx edx, byte [ebp + 0x10]
    cwde
    add edx, eax
    mov eax, dword [esp + 0x34]
    mov dword [eax + 4], edx
    mov ax, word [LINK_ADDRESS_11]
    xor ah, ah
    and al, 0xf
    movsx edx, byte [ebp + 0x10]
    cwde
    add edx, eax
    mov eax, dword [esp + 0x34]
    mov dword [eax], edx
    movsx eax, word [ebp + 0x1e]
    mov edx, dword [esp + 0x38]
    sar eax, 8
    mov byte [edx + 0x15], al
    mov al, byte [ebp + 0x1e]
    mov esi, 1
    jmp short loc_2ed4
loc_2eb5:
    mov eax, dword [esp + 0x34]
    mov edx, dword [esp + 0x34]
    mov eax, dword [eax + 8]
    mov dword [edx + 4], eax
    mov eax, dword [edx + 0xc]
    mov dword [edx], eax
    mov edx, dword [esp + 0x38]
    mov al, byte [ebp + 0x11]
    mov byte [edx + 0x15], al
    xor esi, esi
loc_2ed4:
    mov byte [edx + 0x1d], al
    mov eax, dword [esp + 0x34]
    mov edx, dword [esp + 0x38]
    mov al, byte [eax + 4]
    mov byte [edx + 0x1c], al
    mov eax, dword [esp + 0x34]
    mov al, byte [eax + 4]
    mov byte [edx + 0x14], al
    movsx edx, word [edx]
    mov eax, dword [esp + 0x38]
    shl edx, 5
    movsx eax, word [eax + 2]
    add edx, WALL
    mov dword [esp], eax
    jmp short loc_2f4f
loc_2f08:
    test esi, esi
    je short loc_2f11
    mov al, byte [ebp + 0x1e]
    jmp short loc_2f14
loc_2f11:
    mov al, byte [ebp + 0x11]
loc_2f14:
    mov byte [edx + 0x15], al
    cmp word [edx + 0x1c], 1
    je short loc_2f45
    mov eax, dword [esp + 0x34]
    mov al, byte [eax]
    mov bl, byte [edx + 0xe]
    mov byte [edx + 0x14], al
    test bl, 2
    je short loc_2f45
    mov ax, word [edx + 0xa]
    test ax, ax
    jl short loc_2f45
    cwde
    shl eax, 5
    mov bl, byte [edx + 0x14]
    mov byte [eax + LINK_ADDRESS_135], bl
loc_2f45:
    mov ebx, dword [esp]
    dec ebx
    add edx, 0x20
    mov dword [esp], ebx
loc_2f4f:
    cmp dword [esp], 0
    jg short loc_2f08
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_121]
    movsx esi, word [nosplit eax*2 + HEADSPRITESECT]
loc_2f6c:
    test esi, esi
    jl short loc_2f9e
    imul eax, esi, 0x2c
    test byte [eax + LINK_ADDRESS_136], 0x10
    je short loc_2f94
    mov edx, dword [esp + 0x38]
    test byte [edx + 0xc], 1
    je short loc_2f8b
    mov dl, byte [edx + 0x14]
    jmp short loc_2f8e
loc_2f8b:
    mov dl, byte [edx + 0x1c]
loc_2f8e:
    mov byte [eax + LINK_ADDRESS_137], dl
loc_2f94:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESECT]
    jmp short loc_2f6c
loc_2f9e:
    mov eax, dword [esp + 0x34]
    cmp dword [eax + 0x10], 0
    je near LINK_ADDRESS_61
    movsx eax, word [esp + 0x48]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_2fbf:
    mov edx, esp
    mov eax, ebp
    call LINK_ADDRESS_25
    mov ecx, dword [esp]
    mov dword [esp + 0x50], eax
    cmp ecx, 0x2000
    jge short loc_303d
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov edi, dword [edx + LINK_ADDRESS_86]
    movsx edx, word [esp + 0x50]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [ebp + 4]
    lea edx, [eax + eax]
    sub ebx, edi
    mov eax, dword [ebp]
    mov ecx, dword [edx + LINK_ADDRESS_87]
    mov edx, ebx
    sub eax, ecx
    movsx esi, word [ebp + 0x1c]
    call GETANGLE
    mov edx, 0x659
    mov word [ebp + 0x1c], ax
    movsx eax, word [esp + 0x48]
    call LINK_ADDRESS_112
    mov word [ebp + 0x1c], si
loc_303d:
    movsx eax, word [ebp + 0x1e]
    cmp eax, -1
    jne near loc_30ee
    mov eax, dword [esp + 0x34]
    mov edi, 0x7fffffff
    mov dword [eax + 0x10], 0
loc_305a:
    mov eax, dword [esp + 0x34]
    mov edx, 0xffffffff
    movsx eax, word [eax + 0x10]
    call LINK_ADDRESS_102
    mov word [ebp + 0x1e], ax
    cwde
    cmp eax, -1
    je short loc_30c7
    imul eax, eax, 0x2c
    mov ebx, SPRITE
    movsx edx, word [esp + 0x50]
    add ebx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_30]
    imul eax, eax, 0x2c
    mov edx, ebx
    add eax, SPRITE
    call LINK_ADDRESS_38
    mov dword [esp + 4], eax
    cmp edi, eax
    jle short loc_30be
    movsx edx, word [ebp + 0x1e]
    mov edi, eax
    mov dword [esp + 0x2c], edx
loc_30be:
    mov eax, dword [esp + 0x34]
    inc dword [eax + 0x10]
    jmp short loc_305a
loc_30c7:
    imul ebx, dword [esp + 0x2c], 0x2c
    mov eax, dword [esp + 0x2c]
    mov word [ebp + 0x1e], ax
    mov edi, dword [ebp + 8]
    mov ebx, dword [ebx + LINK_ADDRESS_17]
    sub ebx, edi
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    shl eax, 4
    mov word [ebp + 0x24], ax
loc_30ee:
    movsx eax, word [ebp + 0x1e]
    imul eax, eax, 0x2c
    mov edx, ebp
    add eax, SPRITE
    call LINK_ADDRESS_38
    cmp eax, 0x400
    jge short loc_3151
    movsx edx, word [esp + 0x50]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    add ebx, ebx
    mov esi, dword [ebp + 4]
    mov edi, dword [ebp]
    mov edx, dword [ebx + LINK_ADDRESS_86]
    mov eax, dword [ebx + LINK_ADDRESS_87]
    sub edx, esi
    sub eax, edi
    mov cx, word [ebp + 0x1c]
    call GETANGLE
    mov word [ebp + 0x1e], 0xffff
    mov word [ebp + 0x1c], cx
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_3151:
    movsx edx, word [ebp + 0x1e]
    imul edx, edx, 0x2c
    mov word [ebp + 0x20], 0x100
    mov ebx, dword [ebp + 4]
    mov eax, dword [edx + LINK_ADDRESS_16]
    sub eax, ebx
    mov ecx, dword [ebp]
    mov ebx, eax
    mov eax, dword [edx + SPRITE]
    mov edx, ebx
    sub eax, ecx
    call GETANGLE
    mov dword [esp], eax
    movsx edx, word [esp]
    movsx eax, word [ebp + 0x1c]
    call LINK_ADDRESS_108
    cwde
    sar eax, 3
    mov dword [esp + 0x2c], eax
    mov cx, word [ebp + 0x1c]
    mov eax, dword [esp + 0x2c]
    add ecx, eax
    mov word [ebp + 0x1c], cx
    call LINK_ADDRESS_12
    sar eax, 8
    cmp eax, 0xdf
    jl short loc_31cc
    mov edx, dword [esp + 0x34]
    mov eax, dword [esp + 0x2c]
    mov ecx, dword [edx + 8]
    add ecx, eax
    mov eax, dword [esp + 0x38]
    mov dword [edx + 8], ecx
    mov byte [eax + 0x14], 0x7f
    jmp short loc_322d
loc_31cc:
    movsx edx, word [esp + 0x50]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov esi, dword [ebp + 4]
    mov edi, dword [ebp]
    mov ebx, dword [edx + LINK_ADDRESS_86]
    mov eax, dword [edx + LINK_ADDRESS_87]
    sub ebx, esi
    sub eax, edi
    mov edx, ebx
    call GETANGLE
    movsx edx, ax
    mov eax, dword [esp + 0x34]
    mov ax, word [eax + 8]
    add ah, 2
    cwde
    call LINK_ADDRESS_108
    cwde
    mov edx, dword [esp + 0x34]
    sar eax, 2
    mov ebx, dword [edx + 8]
    add ebx, eax
    mov eax, dword [esp + 0x38]
    mov dword [edx + 8], ebx
    mov byte [eax + 0x14], 0
loc_322d:
    movsx eax, word [esp + 0x48]
    call LINK_ADDRESS_138
    movsx esi, ax
    test esi, esi
    jl short loc_327c
    mov eax, dword [esp + 0x34]
    mov esi, dword [eax + 0xc]
    inc esi
    mov dword [eax + 0xc], esi
    cmp esi, 5
    jne short loc_327c
    add byte [ebp + 0x25], 4
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_116
    add eax, eax
    add edx, eax
    mov eax, 7
    call LINK_ADDRESS_139
loc_327c:
    movsx eax, word [ebp + 0x24]
    add dword [ebp + 8], eax
    mov edx, dword [esp + 0x38]
    movsx eax, word [ebp + 0x24]
    add dword [edx + 4], eax
    mov edx, dword [esp + 0x34]
    mov edx, dword [edx]
    lea eax, [edx*4]
    add eax, edx
    movsx edx, word [ebp + 0x24]
    mov ecx, dword [eax*8 + LINK_ADDRESS_140]
    add ecx, edx
    movsx esi, word [esp + 0x48]
    mov dword [eax*8 + LINK_ADDRESS_140], ecx
    mov eax, esi
    call LINK_ADDRESS_97
    mov eax, esi
    mov ecx, dword [ebp + 8]
    mov ebx, dword [ebp + 4]
    mov edx, dword [ebp]
    call LINK_ADDRESS_36
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_32d6:
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp dword [eax + LINK_ADDRESS_101], 0
    je short loc_3354
    movsx edx, word [esp + 0x48]
    lea ebx, [edx*8]
    add ebx, edx
    lea ebx, [ebx*8]
    sub ebx, edx
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    mov esi, dword [ebx + LINK_ADDRESS_101]
    lea eax, [eax*8]
    inc esi
    sub eax, edx
    mov dword [ebx + LINK_ADDRESS_101], esi
    cmp dword [eax + LINK_ADDRESS_101], 8
    jle short loc_334d
    movsx eax, word [esp + 0x48]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_334d:
    mov esi, 1
    jmp short loc_3362
loc_3354:
    mov eax, dword [esp + 0x38]
    add eax, 4
    call LINK_ADDRESS_141
    mov esi, eax
loc_3362:
    test esi, esi
    jl near LINK_ADDRESS_61
    mov eax, dword [esp + 0x38]
    movsx eax, word [eax + 0x22]
    test ah, 0x80
    jne short loc_3397
    movsx edx, word [esp + 0x48]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp dword [eax + LINK_ADDRESS_101], 0
    je short loc_33a5
loc_3397:
    mov eax, dword [esp + 0x34]
    mov eax, dword [eax + 0xc]
    mov dword [esp], eax
    neg eax
    jmp short loc_33ac
loc_33a5:
    mov eax, dword [esp + 0x34]
    mov eax, dword [eax + 0xc]
loc_33ac:
    mov dword [esp], eax
    cmp dword [esp + 0x20], 9
    jne short loc_33b9
    neg dword [esp]
loc_33b9:
    movsx esi, word [LINK_ADDRESS_54]
loc_33c0:
    test esi, esi
    jl near LINK_ADDRESS_61
    imul eax, esi, 0x2c
    mov ebp, dword [esp + 0x20]
    movsx edx, word [eax + LINK_ADDRESS_52]
    cmp edx, ebp
    jne near loc_353f
    mov edi, dword [esp + 0x54]
    cmp di, word [eax + LINK_ADDRESS_53]
    jne near loc_353f
    mov cx, word [eax + LINK_ADDRESS_121]
    movsx eax, byte [eax + LINK_ADDRESS_137]
    movsx edx, cx
    mov dword [esp + 4], eax
    lea eax, [edx*4]
    add eax, edx
    movsx edx, word [eax*8 + SECTOR]
    shl edx, 5
    movsx edi, word [eax*8 + LINK_ADDRESS_142]
    add edx, WALL
    jmp short loc_3480
loc_3428:
    cmp word [edx + 0x1c], 1
    je short loc_347c
    mov al, byte [esp]
    mov bl, byte [edx + 0x14]
    add bl, al
    mov byte [edx + 0x14], bl
    movsx eax, bl
    cmp eax, dword [esp + 4]
    jge short loc_3449
    mov al, byte [esp + 4]
    jmp short loc_3457
loc_3449:
    cmp eax, dword [ebp + LINK_ADDRESS_143]
    jle short loc_345a
    mov al, byte [ebp + LINK_ADDRESS_143]
loc_3457:
    mov byte [edx + 0x14], al
loc_345a:
    mov bx, word [edx + 0xa]
    test bx, bx
    jl short loc_347c
    movsx eax, bx
    shl eax, 5
    cmp word [eax + LINK_ADDRESS_144], 1
    je short loc_347c
    mov bl, byte [edx + 0x14]
    mov byte [eax + LINK_ADDRESS_135], bl
loc_347c:
    dec edi
    add edx, 0x20
loc_3480:
    lea ebp, [esi*8]
    add ebp, esi
    lea ebp, [ebp*8]
    sub ebp, esi
    test edi, edi
    jg short loc_3428
    movsx eax, cx
    lea edx, [eax*4]
    add edx, eax
    lea edx, [edx*8]
    mov al, byte [esp]
    mov bh, byte [edx + LINK_ADDRESS_145]
    add bh, al
    mov ah, byte [edx + LINK_ADDRESS_146]
    mov byte [edx + LINK_ADDRESS_145], bh
    add ah, al
    mov byte [edx + LINK_ADDRESS_146], ah
    mov ebx, dword [esp + 4]
    movsx eax, byte [edx + LINK_ADDRESS_145]
    cmp eax, ebx
    jge short loc_34dd
    mov al, byte [esp + 4]
    jmp short loc_34eb
loc_34dd:
    cmp eax, dword [ebp + LINK_ADDRESS_18]
    jle short loc_34f1
    mov al, byte [ebp + LINK_ADDRESS_18]
loc_34eb:
    mov byte [edx + LINK_ADDRESS_145], al
loc_34f1:
    movsx edx, cx
    lea ebx, [edx*4]
    add ebx, edx
    lea ebx, [ebx*8]
    mov ebp, dword [esp + 4]
    movsx ecx, byte [ebx + LINK_ADDRESS_146]
    cmp ecx, ebp
    jge short loc_3519
    mov al, byte [esp + 4]
    jmp short loc_3539
loc_3519:
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    cmp ecx, dword [eax + LINK_ADDRESS_15]
    jle short loc_353f
    mov al, byte [eax + LINK_ADDRESS_15]
loc_3539:
    mov byte [ebx + LINK_ADDRESS_146], al
loc_353f:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESTAT]
    jmp near loc_33c0
loc_354c:
    mov ax, word [edx + 0x22]
    xor ah, ah
    db 0x66, 0x3d, 0x1b, 0x00    ; cmp ax, 0x1b
    je short loc_357c
    mov eax, dword [edx + 8]
    cmp eax, dword [edx + 4]
    jle short loc_356c
    mov ax, word [edx + 0x22]
    xor ah, ah
    db 0x66, 0x3d, 0x17, 0x00    ; cmp ax, 0x17
    jne short loc_357c
loc_356c:
    mov eax, dword [esp + 0x38]
    cmp word [eax + 0x22], 0x8017
    jne near loc_3673
loc_357c:
    mov eax, dword [esp + 0x38]
    mov ax, word [eax + 0x22]
    xor ah, ah
    mov esi, 1
    db 0x66, 0x3d, 0x1b, 0x00    ; cmp ax, 0x1b
    je near loc_35fd
    mov ax, word [CONNECTHEAD]
    jmp short loc_35f0
loc_359d:
    mov eax, dword [esp + 0x38]
    mov bx, word [eax + 0x22]
    cmp bx, 0x1e
    je short loc_35e3
    cmp bx, 0x1f
    je short loc_35e3
    test bx, bx
    je short loc_35e3
    movsx edx, dx
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_30]
    imul eax, eax, 0x2c
    mov dx, word [ebp + 0x18]
    cmp dx, word [eax + LINK_ADDRESS_121]
    jne short loc_35e3
    xor esi, esi
loc_35e3:
    movsx eax, word [esp + 0x50]
    mov ax, word [nosplit eax*2 + CONNECTPOINT2]
loc_35f0:
    mov dword [esp + 0x50], eax
    mov edx, dword [esp + 0x50]
    test dx, dx
    jge short loc_359d
loc_35fd:
    cmp esi, 1
    jne near LINK_ADDRESS_61
    mov edx, dword [esp + 0x34]
    movsx eax, word [esp + 0x54]
    mov ecx, dword [edx]
    cmp eax, ecx
    jge short loc_3686
    movsx edx, word [ebp + 0x18]
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + LINK_ADDRESS_20]
    db 0x66, 0x3d, 0x14, 0x00    ; cmp ax, 0x14
    jb short loc_3665
    db 0x66, 0x3d, 0x16, 0x00    ; cmp ax, 0x16
    jbe short loc_363c
    db 0x66, 0x3d, 0x1a, 0x00    ; cmp ax, 0x1a
    jne short loc_3665
loc_363c:
    movsx edx, word [ebp + 0x18]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    add eax, SECTOR
    add eax, 4
    call LINK_ADDRESS_141
    test eax, eax
    jge near LINK_ADDRESS_61
loc_3665:
    movsx edx, word [esp + 0x48]
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_147
loc_3673:
    mov eax, dword [esp + 0x34]
    mov dword [eax], 0
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_3686:
    add esi, ecx
    mov dword [edx], esi
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_3693:
    mov ecx, dword [eax + 0x14]
    test ecx, ecx
    jle short loc_36a9
    lea edi, [ecx - 1]
    mov dword [eax + 0x14], edi
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_36a9:
    cmp dword [eax + 0x10], 0
    je near LINK_ADDRESS_61
    mov ax, word [edx]
    mov di, word [edx + 2]
    movsx esi, ax
    add edi, eax
    jmp near loc_37df
loc_36c4:
    mov ax, word [LINK_ADDRESS_148]
loc_36ca:
    mov dword [esp + 0x4c], eax
    mov eax, dword [esp + 0x4c]
    test ax, ax
    jl short loc_372c
    cwde
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_31], 0
    jle short loc_371d
    add eax, SPRITE
    call LINK_ADDRESS_125
    test ax, ax
    je short loc_371d
    movsx eax, word [esp + 0x4c]
    imul eax, eax, 0x2c
    mov ecx, 0x100
    mov ebx, esi
    mov edx, dword [eax + LINK_ADDRESS_16]
    mov eax, dword [eax + SPRITE]
    call CLIPINSIDEBOX
    cmp eax, 1
    je near LINK_ADDRESS_61
loc_371d:
    movsx eax, word [esp + 0x4c]
    mov ax, word [nosplit eax*2 + NEXTSPRITESTAT]
    jmp short loc_36ca
loc_372c:
    mov ax, word [LINK_ADDRESS_150]
loc_3732:
    mov dword [esp + 0x4c], eax
    mov ebx, dword [esp + 0x4c]
    test bx, bx
    jl near loc_37de
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_94], 0
    jl short loc_37cc
    mov ecx, 0x90
    mov ebx, esi
    mov edx, dword [eax + LINK_ADDRESS_16]
    mov eax, dword [eax + SPRITE]
    call CLIPINSIDEBOX
    cmp eax, 1
    jne short loc_37cc
    mov eax, dword [esp + 0x34]
    movsx esi, word [esp + 0x48]
    mov dword [eax + 0x14], 8
    imul eax, esi, 0x2c
    mov edx, dword [esp + 0x34]
    movsx eax, word [eax + LINK_ADDRESS_13]
    mov ebx, dword [edx + 0xc]
    sar eax, 3
    imul eax, ebx
    mov dword [esp + 0x4c], eax
    cwde
    sub dword [edx + 8], eax
    mov edi, dword [edx + 0x10]
    movsx eax, word [esp + 0x4c]
    sub edi, eax
    mov eax, esi
    mov dword [edx + 0x10], edi
    call LINK_ADDRESS_97
    mov eax, esi
    mov ecx, dword [ebp + 8]
    mov ebx, dword [ebp + 4]
    mov edx, dword [ebp]
    call LINK_ADDRESS_36
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_37cc:
    movsx eax, word [esp + 0x4c]
    mov ax, word [nosplit eax*2 + NEXTSPRITESTAT]
    jmp near loc_3732
loc_37de:
    inc esi
loc_37df:
    movsx eax, di
    cmp esi, eax
    jl near loc_36c4
    movsx esi, word [esp + 0x48]
    imul eax, esi, 0x2c
    mov edx, dword [esp + 0x34]
    movsx eax, word [eax + LINK_ADDRESS_13]
    mov edi, dword [edx + 0xc]
    sar eax, 3
    imul eax, edi
    mov dword [esp + 0x4c], eax
    cwde
    add dword [edx + 8], eax
    mov ecx, dword [edx + 0x10]
    movsx eax, word [esp + 0x4c]
    add ecx, eax
    mov eax, esi
    mov dword [edx + 0x10], ecx
    call LINK_ADDRESS_97
    mov eax, esi
    mov ecx, dword [ebp + 8]
    mov ebx, dword [ebp + 4]
    mov edx, dword [ebp]
    call LINK_ADDRESS_36
    mov eax, dword [esp + 0x34]
    mov esi, dword [eax + 0x10]
    cmp esi, 0xfffffe01
    jle short loc_384d
    cmp esi, 0x200
    jl near LINK_ADDRESS_61
loc_384d:
    mov eax, dword [esp + 0x34]
    mov dword [eax + 0x10], 0
    movsx esi, word [esp + 0x48]
    mov byte [eax + 8], 0
    mov eax, esi
    call LINK_ADDRESS_97
    mov eax, esi
    mov ecx, dword [ebp + 8]
    mov ebx, dword [ebp + 4]
    mov edx, dword [ebp]
    call LINK_ADDRESS_36
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_3881:
    cmp dword [eax], 3
    je short loc_3890
    cmp dword [eax + 0xc], 1
    jne near loc_3958
loc_3890:
    mov eax, dword [esp + 0x38]
    mov byte [eax + 0x1d], 0
    mov byte [eax + 0x15], 0
    mov edx, WALL
    movsx eax, word [eax]
    mov esi, dword [esp + 0x38]
    shl eax, 5
    movsx esi, word [esi + 2]
    add edx, eax
    jmp short loc_38cc
loc_38b3:
    cmp word [edx + 0x1c], 1
    je short loc_38c8
    mov eax, dword [esp + 0x34]
    mov al, byte [eax + 4]
    mov byte [edx + 0x15], 0
    mov byte [edx + 0x14], al
loc_38c8:
    dec esi
    add edx, 0x20
loc_38cc:
    test esi, esi
    jg short loc_38b3
    mov eax, dword [esp + 0x34]
    mov edx, dword [esp + 0x38]
    mov al, byte [eax + 4]
    mov byte [edx + 0x1c], al
    mov eax, dword [esp + 0x34]
    mov al, byte [eax + 8]
    mov byte [edx + 0x14], al
    mov eax, dword [esp + 0x34]
    mov dword [eax], 0
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_121]
    movsx esi, word [nosplit eax*2 + HEADSPRITESECT]
loc_3909:
    test esi, esi
    jl short loc_393b
    imul eax, esi, 0x2c
    test byte [eax + LINK_ADDRESS_136], 0x10
    je short loc_3931
    mov edx, dword [esp + 0x38]
    test byte [edx + 0xc], 1
    je short loc_3928
    mov dl, byte [edx + 0x14]
    jmp short loc_392b
loc_3928:
    mov dl, byte [edx + 0x1c]
loc_392b:
    mov byte [eax + LINK_ADDRESS_137], dl
loc_3931:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESECT]
    jmp short loc_3909
loc_393b:
    mov eax, dword [esp + 0x34]
    cmp dword [eax + 0xc], 1
    jne short loc_3958
    movsx eax, word [esp + 0x48]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_3958:
    mov eax, dword [esp + 0x34]
    cmp dword [eax], 1
    jne near LINK_ADDRESS_61
    mov eax, dword [esp + 0x38]
    mov bh, byte [ebp + 0x10]
    cmp bh, byte [eax + 0x1c]
    jge short loc_39c2
    mov edx, dword [esp + 0x38]
    mov al, byte [ebp + 0x11]
    mov byte [edx + 0x1d], al
    mov cl, byte [edx + 0x1c]
    mov byte [edx + 0x15], al
    sub cl, 2
    mov byte [edx + 0x1c], cl
    mov esi, dword [esp + 0x38]
    mov ch, byte [edx + 0x14]
    movsx eax, word [edx]
    sub ch, 2
    shl eax, 5
    mov byte [edx + 0x14], ch
    mov edx, WALL
    movsx esi, word [esi + 2]
    add edx, eax
    jmp short loc_39bc
loc_39a7:
    cmp word [edx + 0x1c], 1
    je short loc_39b8
    mov al, byte [ebp + 0x11]
    mov byte [edx + 0x15], al
    sub byte [edx + 0x14], 2
loc_39b8:
    dec esi
    add edx, 0x20
loc_39bc:
    test esi, esi
    jg short loc_39a7
    jmp short loc_39cc
loc_39c2:
    mov eax, dword [esp + 0x34]
    mov dword [eax], 2
loc_39cc:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    movsx esi, word [eax + LINK_ADDRESS_121]
    movsx esi, word [nosplit esi*2 + HEADSPRITESECT]
loc_39e3:
    test esi, esi
    jl near LINK_ADDRESS_61
    imul eax, esi, 0x2c
    test byte [eax + LINK_ADDRESS_136], 0x10
    je short loc_3a0f
    mov edx, dword [esp + 0x38]
    test byte [edx + 0xc], 1
    je short loc_3a06
    mov dl, byte [edx + 0x14]
    jmp short loc_3a09
loc_3a06:
    mov dl, byte [edx + 0x1c]
loc_3a09:
    mov byte [eax + LINK_ADDRESS_137], dl
loc_3a0f:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESECT]
    jmp short loc_39e3
loc_3a19:
    cmp dword [eax + 8], 0
    je near loc_3c0f
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_13]
    shl eax, 5
    or al, 1
    mov esi, eax
    cmp word [ebp + 0x1c], 0x200
    jne near loc_3ad6
    cmp word [ebp + 0x1e], 0
    je short loc_3a8d
    mov eax, dword [esp + 0x34]
    mov edx, dword [esp + 0x38]
    mov eax, dword [eax]
    sub eax, dword [edx + 4]
    test eax, eax
    jns short loc_3a5f
    neg eax
loc_3a5f:
    cmp eax, esi
    jl short loc_3a84
    mov eax, dword [esp + 0x34]
    mov ebx, dword [edx + 4]
    mov eax, dword [eax]
    sub eax, ebx
    mov ebx, eax
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul eax, esi
    add dword [edx + 4], eax
    jmp near loc_3b53
loc_3a84:
    mov eax, dword [esp + 0x34]
    jmp near loc_3b4e
loc_3a8d:
    mov eax, dword [esp + 0x34]
    mov edx, dword [esp + 0x38]
    mov eax, dword [eax + 4]
    sub eax, dword [edx + 8]
    test eax, eax
    jns short loc_3aa1
    neg eax
loc_3aa1:
    cmp eax, esi
    jl short loc_3ac7
    mov eax, dword [esp + 0x34]
    mov ebx, dword [edx + 8]
    mov eax, dword [eax + 4]
    sub eax, ebx
    mov ebx, eax
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul eax, esi
    add dword [edx + 8], eax
    jmp near loc_3b53
loc_3ac7:
    mov eax, dword [esp + 0x34]
    mov eax, dword [eax + 4]
    mov dword [edx + 8], eax
    jmp near loc_3b53
loc_3ad6:
    mov eax, dword [esp + 0x34]
    mov edx, dword [esp + 0x38]
    mov eax, dword [eax + 4]
    sub eax, dword [edx + 8]
    test eax, eax
    jns short loc_3aea
    neg eax
loc_3aea:
    cmp eax, esi
    jl short loc_3b0b
    mov ebx, dword [esp + 0x34]
    mov ecx, dword [edx + 8]
    mov ebx, dword [ebx + 4]
    sub ebx, ecx
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul eax, esi
    add dword [edx + 8], eax
    jmp short loc_3b15
loc_3b0b:
    mov eax, dword [esp + 0x34]
    mov eax, dword [eax + 4]
    mov dword [edx + 8], eax
loc_3b15:
    mov eax, dword [esp + 0x34]
    mov edx, dword [esp + 0x38]
    mov eax, dword [eax]
    sub eax, dword [edx + 4]
    test eax, eax
    jns short loc_3b28
    neg eax
loc_3b28:
    cmp eax, esi
    jl short loc_3b46
    mov ebx, dword [esp + 0x34]
    mov ecx, dword [edx + 4]
    mov ebx, dword [ebx]
    sub ebx, ecx
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul eax, esi
    add dword [edx + 4], eax
loc_3b46:
    mov eax, dword [esp + 0x34]
    mov edx, dword [esp + 0x38]
loc_3b4e:
    mov eax, dword [eax]
    mov dword [edx + 4], eax
loc_3b53:
    mov eax, dword [esp + 0x34]
    mov esi, dword [eax + 0xc]
    cmp esi, 1
    jne near loc_3be9
    lea edi, [esi + esi]
    mov dword [eax + 0xc], edi
    mov eax, dword [esp + 0x38]
    xor byte [eax + 0xc], 1
    cmp word [ebp + 0x1c], 0x200
    jne short loc_3be9
    movsx edx, word [eax]
    shl edx, 5
    movsx esi, word [eax + 2]
    add edx, WALL
    jmp short loc_3b95
loc_3b8b:
    add edx, 0x20
    mov al, byte [ebp + 0x10]
    dec esi
    mov byte [edx - 0xc], al
loc_3b95:
    test esi, esi
    jg short loc_3b8b
    mov edx, dword [esp + 0x38]
    mov al, byte [ebp + 0x10]
    mov byte [edx + 0x1c], al
    mov bx, word [LINK_ADDRESS_151]
    test bx, bx
    jl short loc_3be9
    movsx edx, bx
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [esp + 0x38]
    mov ax, word [eax*8 + LINK_ADDRESS_152]
    mov word [edx + 0x10], ax
    movsx edx, word [LINK_ADDRESS_151]
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [esp + 0x38]
    mov al, byte [eax*8 + LINK_ADDRESS_146]
    mov byte [edx + 0x14], al
loc_3be9:
    mov eax, dword [esp + 0x34]
    mov ecx, dword [eax + 8]
    inc ecx
    mov dword [eax + 8], ecx
    cmp ecx, 0x100
    jle short loc_3c0f
    movsx eax, word [esp + 0x48]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_3c0f:
    mov eax, dword [esp + 0x34]
    cmp dword [eax + 8], 4
    jne near LINK_ADDRESS_61
    cmp word [ebp + 0x1c], 0x200
    je near LINK_ADDRESS_61
    xor eax, eax
    mov dword [esp], eax
    cmp dword [esp], 7
    jl short loc_3c3d
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_3c3d:
    push 5
    movsx eax, word [esp + 0x4c]
    push eax
    mov edx, 0xfffffe00
    call LINK_ADDRESS_12
    and eax, 0x7ff
    sub edx, eax
    push edx
    call LINK_ADDRESS_12
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call LINK_ADDRESS_12
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call LINK_ADDRESS_12
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [ebp + 8]
    push eax
    sub ecx, 0x800
    call LINK_ADDRESS_12
    and eax, 0x1fff
    sub ecx, eax
    call LINK_ADDRESS_12
    and eax, 0xff
    mov ebx, dword [ebp + 4]
    add ebx, eax
    call LINK_ADDRESS_12
    and eax, 0xff
    add eax, dword [ebp]
    lea edx, [eax - 0x80]
    sub ebx, 0x80
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_153
    inc dword [esp]
    cmp dword [esp], 7
    jl near loc_3c3d
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_3ce0:
    cmp dword [eax + 0x10], 0
    je near LINK_ADDRESS_61
    mov word [ebp + 0x20], 0x10
    mov ebx, dword [eax + 0x10]
    cmp ebx, 1
    jne short loc_3d3b
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov edx, dword [esp + 0x34]
    movsx eax, word [eax + LINK_ADDRESS_13]
    mov ebx, dword [edx + 0xc]
    sar eax, 3
    cmp eax, ebx
    jg short loc_3d33
    mov dword [edx + 0x10], 0
    movsx edx, word [esp + 0x48]
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_77
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_3d33:
    lea ecx, [ebx + 1]
    mov dword [edx + 0xc], ecx
    jmp short loc_3d6c
loc_3d3b:
    cmp ebx, 2
    jne short loc_3d6c
    mov esi, dword [eax + 0xc]
    cmp esi, 1
    jge short loc_3d66
    mov dword [eax + 0x10], 0
    movsx edx, word [esp + 0x48]
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_77
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_3d66:
    lea edi, [esi - 1]
    mov dword [eax + 0xc], edi
loc_3d6c:
    movsx esi, word [esp + 0x48]
    mov eax, esi
    call LINK_ADDRESS_97
    mov eax, esi
    mov ecx, dword [ebp + 8]
    mov ebx, dword [ebp + 4]
    mov edx, dword [ebp]
    call LINK_ADDRESS_36
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_3d91:
    add dword [eax + 8], 0x20
    mov eax, dword [edx + 8]
    mov esi, dword [edx + 4]
    cmp eax, esi
    jge short loc_3da5
    mov byte [ebp + 0x10], 0
    jmp short loc_3dfc
loc_3da5:
    mov edx, dword [esp + 0x34]
    cmp esi, dword [edx + 0xc]
    jge short loc_3dfc
    movsx eax, word [ebp + 0x18]
    movsx esi, word [nosplit eax*2 + HEADSPRITESECT]
loc_3dba:
    test esi, esi
    jl short loc_3de0
    imul eax, esi, 0x2c
    mov di, word [eax + LINK_ADDRESS_10]
    cmp di, 0x440
    je short loc_3de0
    cmp di, 0x242
    je short loc_3de0
    movsx esi, word [nosplit esi*2 + NEXTSPRITESECT]
    jmp short loc_3dba
loc_3de0:
    cmp esi, -1
    jne short loc_3df8
loc_3de5:
    movsx eax, word [esp + 0x48]
    call LINK_ADDRESS_6
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_3df8:
    mov byte [ebp + 0x10], 1
loc_3dfc:
    cmp byte [ebp + 0x10], 0
    je short loc_3e0f
    mov eax, dword [esp + 0x38]
    add dword [eax + 4], 0x400
    jmp short loc_3e1a
loc_3e0f:
    mov eax, dword [esp + 0x38]
    sub dword [eax + 4], 0x200
loc_3e1a:
    movsx esi, word [esp + 0x48]
    mov eax, esi
    call LINK_ADDRESS_97
    mov eax, esi
    mov ecx, dword [ebp + 8]
    mov ebx, dword [ebp + 4]
    mov edx, dword [ebp]
    call LINK_ADDRESS_36
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_3e3f:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov edx, dword [esp + 0x34]
    movsx eax, word [eax + LINK_ADDRESS_13]
    mov edx, dword [edx]
    lea eax, [eax*4]
    imul edx, eax
    mov dword [esp + 0x2c], edx
    mov eax, edx
    mov edx, dword [esp + 0x38]
    mov edi, dword [edx + 4]
    mov ebx, dword [edx + 8]
    add edi, eax
    add ebx, eax
    mov dword [edx + 4], edi
    mov dword [edx + 8], ebx
    movsx eax, word [ebp + 0x18]
    movsx esi, word [nosplit eax*2 + HEADSPRITESECT]
loc_3e84:
    test esi, esi
    jl near loc_3fb3
    imul eax, esi, 0x2c
    cmp word [eax + LINK_ADDRESS_93], 0xa
    jne near loc_3f42
    cmp word [eax + LINK_ADDRESS_94], 0
    jl near loc_3f42
    mov ax, word [eax + LINK_ADDRESS_13]
    mov cx, word [NUMPLAYERS]
    mov dword [esp + 0x50], eax
    cmp cx, 2
    jge short loc_3ee4
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [nosplit eax*2 + LINK_ADDRESS_85]
    mov dword [nosplit eax*2 + LINK_ADDRESS_154], edx
loc_3ee4:
    movsx edx, word [esp + 0x50]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov edx, dword [esp + 0x2c]
    mov edi, dword [eax + LINK_ADDRESS_85]
    mov ebx, dword [eax + LINK_ADDRESS_155]
    mov ecx, dword [eax + LINK_ADDRESS_156]
    add edi, edx
    add ebx, edx
    mov dword [eax + LINK_ADDRESS_85], edi
    add ecx, edx
    mov dword [eax + LINK_ADDRESS_155], ebx
    mov di, word [NUMPLAYERS]
    mov dword [eax + LINK_ADDRESS_156], ecx
    cmp di, 1
    jle short loc_3f42
    mov edx, dword [eax + LINK_ADDRESS_85]
    mov dword [eax + LINK_ADDRESS_154], edx
loc_3f42:
    imul edx, esi, 0x2c
    cmp word [edx + LINK_ADDRESS_93], 3
    je short loc_3f7a
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov ebx, dword [edx + LINK_ADDRESS_17]
    mov dword [eax + LINK_ADDRESS_9], ebx
    mov eax, dword [esp + 0x2c]
    lea edi, [ebx + eax]
    mov dword [edx + LINK_ADDRESS_17], edi
loc_3f7a:
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    mov edx, dword [esp + 0x38]
    sub eax, esi
    mov edx, dword [edx + 8]
    mov dword [eax + LINK_ADDRESS_33], edx
    mov edx, dword [esp + 0x38]
    mov edx, dword [edx + 4]
    movsx esi, word [nosplit esi*2 + NEXTSPRITESECT]
    mov dword [eax + LINK_ADDRESS_157], edx
    jmp near loc_3e84
loc_3fb3:
    mov eax, dword [esp + 0x34]
    mov edi, dword [eax]
    test edi, edi
    je near LINK_ADDRESS_61
    je near LINK_ADDRESS_61
    movsx esi, word [esp + 0x48]
    imul edx, esi, 0x2c
    mov eax, dword [esp + 0x38]
    mov ebx, dword [esp + 0x34]
    mov eax, dword [eax + 8]
    sub eax, dword [ebx + 8]
    movsx edx, word [edx + LINK_ADDRESS_13]
    test eax, eax
    jns short loc_3fea
    neg eax
loc_3fea:
    cmp eax, edx
    jg short loc_4000
    mov eax, esi
    xor edx, edx
    call LINK_ADDRESS_158
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_4000:
    cmp dword [ebx], -1
    jne short loc_4017
    mov eax, dword [esp + 0x38]
    mov ebx, dword [ebx + 0xc]
    cmp ebx, dword [eax + 8]
    jl near LINK_ADDRESS_61
    jmp short loc_4027
loc_4017:
    mov eax, dword [esp + 0x38]
    mov edi, dword [ebx + 0x10]
    cmp edi, dword [eax + 4]
    jg near LINK_ADDRESS_61
loc_4027:
    mov eax, dword [esp + 0x34]
    cmp dword [eax + 4], 0
    je near LINK_ADDRESS_61
    mov dword [eax + 4], 0
    movsx esi, word [LINK_ADDRESS_54]
loc_4043:
    test esi, esi
    jl short loc_40a0
    movsx eax, word [esp + 0x48]
    cmp eax, esi
    je short loc_4096
    imul edx, esi, 0x2c
    cmp word [edx + LINK_ADDRESS_52], 0x11
    jne short loc_4096
    movsx ebx, word [edx + LINK_ADDRESS_121]
    lea eax, [ebx*4]
    add eax, ebx
    mov ecx, dword [esp + 0x34]
    movsx ebx, word [eax*8 + LINK_ADDRESS_159]
    mov eax, dword [esp + 0x38]
    mov edi, dword [ecx]
    movsx eax, word [eax + 0x24]
    sub eax, edi
    cmp eax, ebx
    jne short loc_4096
    mov eax, dword [esp + 0x54]
    cmp ax, word [edx + LINK_ADDRESS_53]
    je short loc_40a0
loc_4096:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESTAT]
    jmp short loc_4043
loc_40a0:
    cmp esi, -1
    je near LINK_ADDRESS_61
    movsx eax, word [ebp + 0x18]
    mov ax, word [nosplit eax*2 + HEADSPRITESECT]
loc_40b5:
    mov dword [esp + 0x4c], eax
    mov edi, dword [esp + 0x4c]
    test di, di
    jl near LINK_ADDRESS_61
    movsx ecx, di
    mov ax, word [nosplit ecx*2 + NEXTSPRITESECT]
    mov dword [esp + 0x3c], eax
    imul eax, ecx, 0x2c
    cmp word [eax + LINK_ADDRESS_93], 0xa
    jne near loc_4248
    cmp word [eax + LINK_ADDRESS_94], 0
    jl near loc_4248
    imul ebx, esi, 0x2c
    mov ax, word [eax + LINK_ADDRESS_13]
    mov dword [esp + 0x50], eax
    cwde
    mov edi, eax
    shl edi, 7
    sub edi, eax
    lea edi, [edi*4]
    mov edx, dword [ebp]
    sub edi, eax
    mov eax, dword [ebx + SPRITE]
    sub eax, edx
    add dword [nosplit edi*2 + LINK_ADDRESS_87], eax
    mov eax, dword [ebx + LINK_ADDRESS_16]
    sub eax, dword [ebp + 4]
    mov edx, dword [nosplit edi*2 + LINK_ADDRESS_86]
    add edx, eax
    movsx eax, word [ebx + LINK_ADDRESS_121]
    mov dword [nosplit edi*2 + LINK_ADDRESS_86], edx
    mov dword [esp + 0x10], eax
    mov dword [esp + 8], eax
    mov edx, dword [esp + 0x10]
    lea eax, [eax*4]
    add eax, edx
    lea eax, [eax*8]
    mov dword [esp + 0xc], eax
    mov eax, dword [esp + 0x38]
    mov edx, dword [nosplit edi*2 + LINK_ADDRESS_85]
    mov eax, dword [eax + 8]
    sub eax, edx
    mov dword [esp + 0x10], eax
    mov eax, dword [esp + 0xc]
    mov edx, dword [esp + 0x10]
    mov eax, dword [eax + LINK_ADDRESS_49]
    sub eax, edx
    mov dword [nosplit edi*2 + LINK_ADDRESS_85], eax
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov dword [esp + 0x10], eax
    mov eax, dword [esp + 0xc]
    mov edx, dword [esp + 0x10]
    mov eax, dword [eax + LINK_ADDRESS_49]
    mov dword [edx + LINK_ADDRESS_33], eax
    mov eax, dword [esp + 0xc]
    mov eax, dword [eax + LINK_ADDRESS_140]
    mov dword [edx + LINK_ADDRESS_157], eax
    mov eax, dword [nosplit edi*2 + LINK_ADDRESS_87]
    mov dword [nosplit edi*2 + LINK_ADDRESS_123], eax
    mov dword [nosplit edi*2 + LINK_ADDRESS_89], eax
    mov eax, dword [nosplit edi*2 + LINK_ADDRESS_86]
    mov dword [nosplit edi*2 + LINK_ADDRESS_124], eax
    mov dword [nosplit edi*2 + LINK_ADDRESS_90], eax
    mov eax, dword [nosplit edi*2 + LINK_ADDRESS_85]
    mov dword [nosplit edi*2 + LINK_ADDRESS_154], eax
    mov eax, dword [edx + LINK_ADDRESS_33]
    mov dword [nosplit edi*2 + LINK_ADDRESS_155], eax
    mov eax, dword [edx + LINK_ADDRESS_157]
    mov dword [nosplit edi*2 + LINK_ADDRESS_156], eax
    xor eax, eax
    mov edx, dword [esp + 8]
    mov dword [nosplit edi*2 + LINK_ADDRESS_160], eax
    mov eax, ecx
    call CHANGESPRITESECT
    mov ax, word [ebx + LINK_ADDRESS_121]
    mov word [nosplit edi*2 + LINK_ADDRESS_81], ax
    mov eax, dword [esp + 0x3c]
    jmp near loc_40b5
loc_4248:
    movsx ebx, word [esp + 0x4c]
    imul eax, ebx, 0x2c
    cmp word [eax + LINK_ADDRESS_93], 3
    je near loc_436a
    imul edi, esi, 0x2c
    mov ecx, dword [ebp]
    mov edx, dword [edi + SPRITE]
    sub edx, ecx
    add dword [eax + SPRITE], edx
    mov edx, dword [edi + LINK_ADDRESS_16]
    sub edx, dword [ebp + 4]
    add dword [eax + LINK_ADDRESS_16], edx
    movsx edx, word [edi + LINK_ADDRESS_121]
    mov dword [esp + 0x10], edx
    mov ecx, dword [esp + 0x10]
    lea edx, [edx*4]
    add ecx, edx
    mov edx, dword [esp + 0x38]
    mov edx, dword [edx + 8]
    sub edx, dword [eax + LINK_ADDRESS_17]
    lea ecx, [ecx*8]
    mov dword [esp + 0x10], edx
    mov edx, dword [ecx + LINK_ADDRESS_49]
    sub edx, dword [esp + 0x10]
    mov dword [eax + LINK_ADDRESS_17], edx
    lea edx, [ebx*8]
    add edx, ebx
    lea edx, [edx*8]
    sub edx, ebx
    mov ecx, dword [eax + SPRITE]
    mov dword [edx + LINK_ADDRESS_7], ecx
    mov ecx, dword [eax + LINK_ADDRESS_16]
    mov eax, dword [eax + LINK_ADDRESS_17]
    mov dword [edx + LINK_ADDRESS_8], ecx
    mov dword [edx + LINK_ADDRESS_9], eax
    mov eax, ebx
    movsx edx, word [edi + LINK_ADDRESS_121]
    call CHANGESPRITESECT
    movsx eax, word [esp + 0x4c]
    imul edx, eax, 0x2c
    mov ecx, dword [edx + LINK_ADDRESS_17]
    mov ebx, dword [edx + LINK_ADDRESS_16]
    mov edx, dword [edx + SPRITE]
    call LINK_ADDRESS_36
    movsx edx, word [edi + LINK_ADDRESS_121]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, word [esp + 0x4c]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    lea ebx, [ebx*8]
    sub eax, edx
    mov edx, dword [ebx + LINK_ADDRESS_49]
    mov dword [eax + LINK_ADDRESS_33], edx
    mov edx, dword [ebx + LINK_ADDRESS_140]
    mov dword [eax + LINK_ADDRESS_157], edx
loc_436a:
    mov eax, dword [esp + 0x3c]
    jmp near loc_40b5
loc_4373:
    cmp dword [eax], 0
    je near LINK_ADDRESS_61
    cmp byte [ebp + 0x11], 0
    je near loc_44d6
    cmp word [ebp + 0x1c], 0x200
    jne short loc_43cb
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x38]
    movsx eax, word [eax + 0x26]
    mov ecx, dword [edx + 4]
    sub ecx, eax
    mov dword [edx + 4], ecx
    mov edx, dword [esp + 0x34]
    mov esi, dword [edx + 4]
    cmp ecx, esi
    jg near loc_4614
    mov edx, dword [esp + 0x38]
    movsx eax, word [esp + 0x48]
    mov dword [edx + 4], esi
    call LINK_ADDRESS_6
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_43cb:
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x38]
    movsx eax, word [eax + 0x26]
    add dword [edx + 8], eax
    movsx esi, word [ebp + 0x18]
    movsx esi, word [nosplit esi*2 + HEADSPRITESECT]
loc_43e6:
    test esi, esi
    jl near loc_44a6
    imul eax, esi, 0x2c
    cmp word [eax + LINK_ADDRESS_10], 0x214
    jne short loc_443e
    cmp word [eax + LINK_ADDRESS_94], 0
    jl short loc_443e
    movsx edx, word [eax + LINK_ADDRESS_13]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp byte [eax + LINK_ADDRESS_82], 1
    jne short loc_443e
    mov edx, dword [esp + 0x38]
    mov edi, dword [eax + LINK_ADDRESS_85]
    movsx edx, word [edx + 0x26]
    add edi, edx
    mov dword [eax + LINK_ADDRESS_85], edi
loc_443e:
    imul edx, esi, 0x2c
    cmp word [edx + LINK_ADDRESS_162], 0
    jne short loc_4499
    mov di, word [edx + LINK_ADDRESS_93]
    cmp di, 3
    je short loc_4499
    cmp di, 4
    je short loc_4499
    mov eax, dword [esp + 0x38]
    mov ebx, dword [edx + LINK_ADDRESS_17]
    movsx eax, word [eax + 0x26]
    add ebx, eax
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov dword [edx + LINK_ADDRESS_17], ebx
    mov edx, dword [esp + 0x38]
    mov dword [eax + LINK_ADDRESS_9], ebx
    mov edx, dword [edx + 8]
    mov dword [eax + LINK_ADDRESS_33], edx
loc_4499:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESECT]
    jmp near loc_43e6
loc_44a6:
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x34]
    mov eax, dword [eax + 8]
    mov ecx, dword [edx + 4]
    cmp eax, ecx
    jl near loc_4614
    mov edx, dword [esp + 0x38]
    movsx eax, word [esp + 0x48]
    mov dword [edx + 8], ecx
    call LINK_ADDRESS_6
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_44d6:
    cmp word [ebp + 0x1c], 0x200
    jne short loc_4513
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x38]
    movsx eax, word [eax + 0x26]
    mov esi, dword [edx + 4]
    add esi, eax
    mov dword [edx + 4], esi
    mov edi, dword [ebp + 8]
    cmp esi, edi
    jl near loc_4614
    movsx eax, word [esp + 0x48]
    mov dword [edx + 4], edi
    call LINK_ADDRESS_6
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_4513:
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x38]
    movsx eax, word [eax + 0x26]
    sub dword [edx + 8], eax
    movsx esi, word [ebp + 0x18]
    movsx esi, word [nosplit esi*2 + HEADSPRITESECT]
loc_452e:
    test esi, esi
    jl near loc_45ee
    imul eax, esi, 0x2c
    cmp word [eax + LINK_ADDRESS_10], 0x214
    jne short loc_4586
    cmp word [eax + LINK_ADDRESS_94], 0
    jl short loc_4586
    movsx edx, word [eax + LINK_ADDRESS_13]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp byte [eax + LINK_ADDRESS_82], 1
    jne short loc_4586
    mov edx, dword [esp + 0x38]
    mov edi, dword [eax + LINK_ADDRESS_85]
    movsx edx, word [edx + 0x26]
    sub edi, edx
    mov dword [eax + LINK_ADDRESS_85], edi
loc_4586:
    imul edx, esi, 0x2c
    cmp word [edx + LINK_ADDRESS_162], 0
    jne short loc_45e1
    mov cx, word [edx + LINK_ADDRESS_93]
    cmp cx, 3
    je short loc_45e1
    cmp cx, 4
    je short loc_45e1
    mov eax, dword [esp + 0x38]
    mov ebx, dword [edx + LINK_ADDRESS_17]
    movsx eax, word [eax + 0x26]
    sub ebx, eax
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov dword [edx + LINK_ADDRESS_17], ebx
    mov edx, dword [esp + 0x38]
    mov dword [eax + LINK_ADDRESS_9], ebx
    mov edx, dword [edx + 8]
    mov dword [eax + LINK_ADDRESS_33], edx
loc_45e1:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESECT]
    jmp near loc_452e
loc_45ee:
    mov eax, dword [esp + 0x38]
    mov esi, dword [ebp + 8]
    cmp esi, dword [eax + 8]
    jl short loc_4614
    mov edx, dword [esp + 0x38]
    movsx eax, word [esp + 0x48]
    mov dword [edx + 8], esi
    call LINK_ADDRESS_6
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_4614:
    mov eax, dword [esp + 0x34]
    inc dword [eax + 8]
    mov edx, dword [esp + 0x34]
    movsx eax, word [ebp + 0x28]
    cmp eax, dword [edx + 8]
    jg near LINK_ADDRESS_61
    mov dword [edx + 8], 0
    mov dword [edx], 0
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_4642:
    mov edi, dword [eax]
    test edi, edi
    je near loc_47d1
    cmp edi, 1
    jne near loc_46e3
    lea edx, [edi + edi]
    mov dword [eax], edx
    mov eax, dword [esp + 0x38]
    movsx eax, word [eax]
    mov dword [esp], eax
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp]
    movsx eax, word [eax + 2]
    add edx, eax
    mov esi, dword [esp]
    mov dword [esp + 0x2c], edx
    jmp short loc_46dd
loc_467a:
    mov eax, esi
    shl eax, 5
    cmp word [eax + LINK_ADDRESS_163], 0xe6
    jne short loc_46dc
    mov dx, word [eax + LINK_ADDRESS_164]
    xor ebx, ebx
    xor dh, dh
    mov word [eax + LINK_ADDRESS_163], bx
    and dl, 0xae
    mov cx, word [eax + LINK_ADDRESS_165]
    mov word [eax + LINK_ADDRESS_164], dx
    test cx, cx
    jl short loc_46dc
    movsx edx, cx
    shl edx, 5
    mov word [edx + LINK_ADDRESS_163], bx
    movsx eax, word [eax + LINK_ADDRESS_165]
    shl eax, 5
    mov dx, word [eax + LINK_ADDRESS_164]
    xor dh, dh
    and dl, 0xae
    mov word [eax + LINK_ADDRESS_164], dx
loc_46dc:
    inc esi
loc_46dd:
    cmp esi, dword [esp + 0x2c]
    jl short loc_467a
loc_46e3:
    mov eax, dword [esp + 0x38]
    mov edx, dword [esp + 0x38]
    mov eax, dword [eax + 4]
    mov ebp, dword [edx + 8]
    cmp eax, ebp
    jl near loc_47b1
    mov dword [edx + 4], ebp
    movsx esi, word [LINK_ADDRESS_54]
loc_4703:
    test esi, esi
    jl near loc_3de5
    imul edx, esi, 0x2c
    cmp word [edx + LINK_ADDRESS_52], 0
    jne near loc_47a4
    mov ecx, dword [esp + 0x54]
    cmp cx, word [edx + LINK_ADDRESS_53]
    jne short loc_47a4
    movsx ecx, word [edx + LINK_ADDRESS_94]
    imul eax, ecx, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_121]
    mov dword [esp + 0x2c], eax
    mov ebx, eax
    lea eax, [eax*4]
    movsx edx, word [edx + LINK_ADDRESS_121]
    add ebx, eax
    lea eax, [edx*4]
    lea ebx, [ebx*8]
    add eax, edx
    mov dl, byte [ebx + LINK_ADDRESS_166]
    mov byte [eax*8 + LINK_ADDRESS_167], dl
    mov byte [eax*8 + LINK_ADDRESS_166], dl
    mov dl, byte [ebx + LINK_ADDRESS_145]
    mov byte [eax*8 + LINK_ADDRESS_146], dl
    mov byte [eax*8 + LINK_ADDRESS_145], dl
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov dword [eax + LINK_ADDRESS_18], 2
loc_47a4:
    movsx esi, word [nosplit esi*2 + NEXTSPRITESTAT]
    jmp near loc_4703
loc_47b1:
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov ebx, dword [edx + 4]
    movsx eax, word [eax + LINK_ADDRESS_13]
    add ebx, eax
    mov dword [edx + 4], ebx
    mov eax, dword [esp + 0x44]
    jmp near loc_120d
loc_47d1:
    movsx eax, word [ebp + 0x18]
    call LINK_ADDRESS_168
    movsx esi, ax
    test esi, esi
    jl near LINK_ADDRESS_61
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_116
    add eax, eax
    add edx, eax
    mov eax, 8
    mov esi, dword [esp + 0x54]
    call LINK_ADDRESS_139
    movsx edi, word [LINK_ADDRESS_54]
loc_481a:
    test edi, edi
    jl near LINK_ADDRESS_61
    imul edx, edi, 0x2c
    mov ax, word [edx + LINK_ADDRESS_52]
    and ah, 0x7f
    cwde
    mov dword [esp], eax
    cmp eax, 1
    jb short loc_4853
    jbe near loc_48b2
    cmp eax, 0xc
    jb near loc_48f2
    jbe short loc_48b2
    cmp eax, 0x13
    je short loc_48b2
    jmp near loc_48f2
loc_4853:
    test eax, eax
    jne near loc_48f2
    cmp si, word [edx + LINK_ADDRESS_53]
    jne near loc_48f2
    movsx ebx, word [edx + LINK_ADDRESS_94]
    imul ebx, ebx, 0x2c
    movsx eax, word [edx + LINK_ADDRESS_121]
    mov dword [esp + 0x2c], eax
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    mov dl, byte [ebx + LINK_ADDRESS_137]
    mov byte [eax*8 + LINK_ADDRESS_146], dl
    mov byte [eax*8 + LINK_ADDRESS_145], dl
    mov dl, byte [ebx + LINK_ADDRESS_169]
    mov byte [eax*8 + LINK_ADDRESS_167], dl
    mov byte [eax*8 + LINK_ADDRESS_166], dl
    jmp short loc_48f2
loc_48b2:
    imul ebx, edi, 0x2c
    mov eax, dword [esp + 0x54]
    cmp ax, word [ebx + LINK_ADDRESS_53]
    jne short loc_48f2
    lea eax, [edi*8]
    add eax, edi
    lea eax, [eax*8]
    sub eax, edi
    cmp dword [eax + LINK_ADDRESS_18], 0
    jne short loc_48f2
    mov dword [eax + LINK_ADDRESS_18], 1
    mov eax, dword [esp + 0x48]
    mov word [ebx + LINK_ADDRESS_94], ax
loc_48f2:
    movsx edi, word [nosplit edi*2 + NEXTSPRITESTAT]
    jmp near loc_481a
loc_48ff:
    mov ecx, dword [eax]
    test ecx, ecx
    je near LINK_ADDRESS_61
    cmp ecx, 1
    jne short loc_4916
    mov word [ebp + 0x20], 8
    jmp short loc_491c
loc_4916:
    mov word [ebp + 0x20], 0xfff8
loc_491c:
    mov cx, word [ebp + 0x20]
    test cx, cx
    je near LINK_ADDRESS_61
    movsx eax, word [ebp + 0x1c]
    add eax, 0x200
    and eax, 0x7ff
    movsx edx, cx
    movsx eax, word [nosplit eax*2 + SINTABLE]
    imul eax, edx
    sar eax, 0xe
    mov dword [esp], eax
    mov ax, word [ebp + 0x1c]
    and ah, 7
    cwde
    movsx edi, word [nosplit eax*2 + SINTABLE]
    movsx eax, word [ebp + 0x20]
    imul edi, eax
    mov edx, dword [esp + 0x34]
    add dword [edx + 0xc], eax
    mov ecx, dword [ebp]
    mov esi, dword [ebp + 4]
    mov eax, dword [esp]
    sar edi, 0xe
    add ecx, eax
    add esi, edi
    mov dword [ebp], ecx
    mov dword [ebp + 4], esi
    cmp dword [edx + 0xc], 0
    jle short LINK_ADDRESS_170
    movsx eax, word [esp + 0x48]
    imul eax, eax, 0x2c
    mov edx, dword [esp + 0x34]
    mov edx, dword [edx + 0xc]
    movsx eax, word [eax + LINK_ADDRESS_13]
    sar edx, 6
    sar eax, 6
    cmp edx, eax
    jl short LINK_ADDRESS_171
