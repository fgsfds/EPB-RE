; Menu screens, input, and rendering.
bits 32
org START_ADDRESS

    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0xdc
    mov byte [esp + 0xd8], al
    mov ecx, 0x14
    lea edi, [esp + 0x78]
    mov esi, 0x100
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    mov ecx, 0x1e
    mov edi, esp
    mov esi, 0x150
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    xor edi, edi
    xor esi, esi
    jmp short loc_0050
loc_003f:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_1
    add esi, 7
loc_0050:
    cmp si, 0x40
    jl short loc_003f
    mov ecx, dword [YDIM]
    mov ebx, dword [XDIM]
    xor edx, edx
    xor eax, eax
    dec ecx
    dec ebx
    call SETVIEW
    xor eax, eax
    call LINK_ADDRESS_5
    call LINK_ADDRESS_6
    call LINK_ADDRESS_7
    call LINK_ADDRESS_8
    call LINK_ADDRESS_9
    xor eax, eax
    call LINK_ADDRESS_10
    cmp byte [esp + 0xd8], 0
    jne near loc_0963
    cmp word [NUMPLAYERS], 2
    jge near loc_0963
    cmp byte [LINK_ADDRESS_12], 0
    je near loc_0963
    cmp word [LINK_ADDRESS_13], 0
    jne near loc_0963
    mov eax, dword [LINK_ADDRESS_14]
    cmp eax, 3
    ja near loc_0963
    jmp dword cs:[eax*4 + LINK_ADDRESS_15]
    mov ebp, dword [LINK_ADDRESS_16]
    test ebp, ebp
    jne near loc_03dd
    xor eax, eax
    call LINK_ADDRESS_5
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push ebp
    push ebp
    push 0xda
    push ebp
    push ebp
    mov ebx, 0x10000
    mov edx, 0x320000
    push 0xcbc
    xor ecx, ecx
    xor eax, eax
    call LINK_ADDRESS_17
    call LINK_ADDRESS_6
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_19
    mov esi, 0x3f
    mov dword [nosplit eax*2 + LINK_ADDRESS_20], edx
    jmp short loc_015e
loc_014f:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_1
    dec esi
loc_015e:
    test si, si
    jge short loc_014f
    call LINK_ADDRESS_21
    xor eax, eax
    mov dword [TOTALCLOCK], eax
loc_016f:
    xor eax, eax
    call LINK_ADDRESS_5
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xda
    push 0
    push 0
    mov ebx, 0x10000
    mov edx, 0x320000
    push 0xcbc
    xor ecx, ecx
    xor eax, eax
    call LINK_ADDRESS_17
    cmp dword [TOTALCLOCK], 0x186
    jle near loc_0285
    cmp dword [TOTALCLOCK], 0x30c
    jge near loc_0285
    xor esi, esi
    jmp near loc_027b
loc_01d0:
    movsx ecx, si
    lea ecx, [ecx*4]
    cmp dword [esp + ecx + 8], 0
    je near loc_0278
    mov ebp, 0x186
    mov eax, dword [TOTALCLOCK]
    mov edx, dword [TOTALCLOCK]
    sar edx, 0x1f
    idiv ebp
    cmp edx, dword [esp + ecx]
    jle near loc_0278
    mov eax, dword [TOTALCLOCK]
    mov edx, dword [TOTALCLOCK]
    sar edx, 0x1f
    idiv ebp
    cmp edx, dword [esp + ecx + 4]
    jg short loc_0278
    cmp si, 0xa
    jne short loc_023b
    cmp di, 1
    jne short loc_023b
    mov eax, 0x6d
    call LINK_ADDRESS_23
    mov eax, 0x45
    add edi, edi
    call LINK_ADDRESS_23
loc_023b:
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    mov ebx, 0x10000
    push 0xda
    movsx eax, si
    push 0
    mov ecx, dword [esp + eax*4 + 0x20]
    mov edx, dword [esp + eax*4 + 0x28]
    push 0
    shl edx, 0x10
    mov eax, dword [esp + eax*4 + 0x28]
    push ecx
    shl eax, 0x10
    xor ecx, ecx
    call LINK_ADDRESS_17
loc_0278:
    add esi, 5
loc_027b:
    cmp si, 0x23
    jl near loc_01d0
loc_0285:
    cmp dword [TOTALCLOCK], 0x1c2
    jl short loc_02a1
    cmp dword [TOTALCLOCK], 0x2ee
    jl near loc_03c6
loc_02a1:
    cmp dword [TOTALCLOCK], 0x2ee
    jl short loc_0300
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xda
    push 0
    push 0
    mov ebx, 0x10000
    mov edx, 0x3b0000
    push 0xcc4
    xor ecx, ecx
    mov eax, 0x560000
    call LINK_ADDRESS_17
    cmp dword [TOTALCLOCK], 0x2ee
    jl short loc_0300
    cmp di, 2
    jne short loc_0300
    mov eax, 0x38
    call LINK_ADDRESS_23
    inc edi
loc_0300:
    xor esi, esi
    jmp near loc_03bc
loc_0307:
    movsx ecx, si
    lea ecx, [ecx*4]
    cmp dword [esp + ecx + 0x80], 0
    je near loc_03b9
    mov ebp, 0x78
    mov eax, dword [TOTALCLOCK]
    mov edx, dword [TOTALCLOCK]
    sar edx, 0x1f
    idiv ebp
    cmp edx, dword [esp + ecx + 0x78]
    jle near loc_03b9
    mov ebp, 0x78
    mov eax, dword [TOTALCLOCK]
    mov edx, dword [TOTALCLOCK]
    sar edx, 0x1f
    idiv ebp
    cmp edx, dword [esp + ecx + 0x7c]
    jg short loc_03b9
    cmp si, 5
    jne short loc_0373
    test di, di
    jne short loc_0373
    mov eax, 0xe6
    mov edi, 1
    call LINK_ADDRESS_23
loc_0373:
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xda
    mov ebx, 0x10000
    push 0
    movsx eax, si
    push 0
    mov edx, dword [esp + eax*4 + 0x9c]
    xor ecx, ecx
    push edx
    mov edx, dword [esp + eax*4 + 0xa8]
    mov eax, dword [esp + eax*4 + 0xa4]
    shl edx, 0x10
    shl eax, 0x10
    call LINK_ADDRESS_17
loc_03b9:
    add esi, 5
loc_03bc:
    cmp si, 0x14
    jl near loc_0307
loc_03c6:
    call 0x10800
    call LINK_ADDRESS_6
    call LINK_ADDRESS_24
    test eax, eax
    je near loc_016f
loc_03dd:
    xor esi, esi
    jmp short loc_03f0
loc_03e1:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_1
    inc esi
loc_03f0:
    cmp si, 0x40
    jl short loc_03e1
    call LINK_ADDRESS_21
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dword [nosplit eax*2 + LINK_ADDRESS_20], PALETTE
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
    xor ecx, ecx
    push 0
    xor edx, edx
    mov ebx, 0x10000
    push 0xcdc
    xor eax, eax
    mov esi, 0x3f
    call LINK_ADDRESS_17
    call LINK_ADDRESS_6
    jmp short loc_0465
loc_0456:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_1
    dec esi
loc_0465:
    test si, si
    jg short loc_0456
loc_046a:
    call LINK_ADDRESS_24
    test eax, eax
    jne short loc_047a
    call 0x10800
    jmp short loc_046a
loc_047a:
    xor esi, esi
    jmp short loc_048d
loc_047e:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_1
    inc esi
loc_048d:
    cmp si, 0x40
    jl short loc_047e
    call LINK_ADDRESS_26
    call LINK_ADDRESS_8
    call LINK_ADDRESS_9
    jmp near loc_0963
    call LINK_ADDRESS_26
    xor eax, eax
    call LINK_ADDRESS_5
    call LINK_ADDRESS_6
    cmp dword [LINK_ADDRESS_16], 0
    jne short loc_04e1
    mov edx, 1
    mov eax, LINK_ADDRESS_27
    call LINK_ADDRESS_28
    call LINK_ADDRESS_21
    xor eax, eax
    call LINK_ADDRESS_5
    call LINK_ADDRESS_6
loc_04e1:
    mov eax, 0xe
    call LINK_ADDRESS_23
    xor esi, esi
    jmp short loc_04fe
loc_04ef:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_1
    inc esi
loc_04fe:
    cmp si, 0x40
    jl short loc_04ef
    mov ecx, dword [YDIM]
    mov ebx, dword [XDIM]
    xor edx, edx
    xor eax, eax
    dec ecx
    dec ebx
    call SETVIEW
    call LINK_ADDRESS_21
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dword [nosplit eax*2 + LINK_ADDRESS_20], PALETTE
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
    push 0xcdd
    xor eax, eax
    mov esi, 0x3f
    call LINK_ADDRESS_17
    call LINK_ADDRESS_6
    jmp short loc_058a
loc_057b:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_1
    dec esi
loc_058a:
    test si, si
    jg short loc_057b
loc_058f:
    call LINK_ADDRESS_24
    test eax, eax
    jne short loc_059f
    call 0x10800
    jmp short loc_058f
loc_059f:
    xor esi, esi
    cmp si, 0x40
    jl short loc_05ac
    jmp near loc_0963
loc_05ac:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_1
    inc esi
    cmp si, 0x40
    jl short loc_05ac
    jmp near loc_0963
    mov ecx, dword [YDIM]
    mov ebx, dword [XDIM]
    xor edx, edx
    xor eax, eax
    dec ecx
    dec ebx
    call SETVIEW
    call LINK_ADDRESS_26
    xor eax, eax
    call LINK_ADDRESS_5
    call LINK_ADDRESS_6
    cmp dword [LINK_ADDRESS_16], 0
    jne short loc_064d
    call LINK_ADDRESS_21
    mov edx, 8
    mov eax, LINK_ADDRESS_29
    call LINK_ADDRESS_28
    xor eax, eax
    mov edx, 0xa
    call LINK_ADDRESS_5
    call LINK_ADDRESS_6
    mov eax, LINK_ADDRESS_30
    call LINK_ADDRESS_28
    xor eax, eax
    mov edx, 0xb
    call LINK_ADDRESS_5
    call LINK_ADDRESS_6
    mov eax, LINK_ADDRESS_31
    call LINK_ADDRESS_28
    xor eax, eax
    call LINK_ADDRESS_5
    call LINK_ADDRESS_6
loc_064d:
    call LINK_ADDRESS_8
    call LINK_ADDRESS_9
    mov eax, 0x120
    call LINK_ADDRESS_23
    call LINK_ADDRESS_21
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov ebx, PALETTE
    sub eax, edx
    mov ecx, 0x3f
    xor edx, edx
    mov dword [nosplit eax*2 + LINK_ADDRESS_20], ebx
    xor ebx, ebx
    xor eax, eax
    call LINK_ADDRESS_1
    xor eax, eax
    mov edx, 0x3c
    call LINK_ADDRESS_5
    xor ecx, ecx
    push LINK_ADDRESS_32
    xor ebx, ebx
    mov eax, 0xa0
    call LINK_ADDRESS_33
    push LINK_ADDRESS_34
    mov edx, 0x4c
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_33
    push LINK_ADDRESS_35
    mov edx, 0x5c
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_33
    push LINK_ADDRESS_36
    mov edx, 0x76
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_33
    push LINK_ADDRESS_37
    mov edx, 0x86
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    mov esi, 0x3f
    call LINK_ADDRESS_33
    call LINK_ADDRESS_6
    jmp short loc_0735
loc_0724:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_1
    sub esi, 3
loc_0735:
    test si, si
    jg short loc_0724
    call LINK_ADDRESS_21
loc_073f:
    call LINK_ADDRESS_24
    test eax, eax
    jne short loc_074f
    call 0x10800
    jmp short loc_073f
loc_074f:
    xor esi, esi
    jmp short loc_0764
loc_0753:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_1
    add esi, 3
loc_0764:
    cmp si, 0x40
    jl short loc_0753
    xor eax, eax
    mov edx, 4
    call LINK_ADDRESS_5
    call LINK_ADDRESS_6
    mov eax, LINK_ADDRESS_38
    call LINK_ADDRESS_28
    call LINK_ADDRESS_21
loc_078a:
    call LINK_ADDRESS_24
    test eax, eax
    jne short loc_079a
    call 0x10800
    jmp short loc_078a
loc_079a:
    xor eax, eax
    mov ecx, 0x3f
    call LINK_ADDRESS_5
    call LINK_ADDRESS_6
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_1
    call LINK_ADDRESS_8
    call LINK_ADDRESS_9
    call LINK_ADDRESS_21
    jmp near loc_0963
    call LINK_ADDRESS_26
    xor eax, eax
    call LINK_ADDRESS_5
    call LINK_ADDRESS_6
    cmp dword [LINK_ADDRESS_16], 0
    jne short loc_084c
    mov esi, 0x3f
    jmp short loc_07fa
loc_07eb:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_1
    dec esi
loc_07fa:
    test si, si
    jge short loc_07eb
    mov edx, 2
    mov eax, LINK_ADDRESS_39
    call LINK_ADDRESS_28
    call LINK_ADDRESS_21
    mov eax, dword [TOTALCLOCK]
    add eax, 0xc8
    mov dword [LINK_ADDRESS_40], eax
loc_0822:
    mov eax, dword [TOTALCLOCK]
    cmp eax, dword [LINK_ADDRESS_40]
    jge short loc_0836
    call 0x10800
    jmp short loc_0822
loc_0836:
    xor eax, eax
    call LINK_ADDRESS_5
    call LINK_ADDRESS_6
    call LINK_ADDRESS_8
    call LINK_ADDRESS_9
loc_084c:
    mov edx, 3
    mov eax, LINK_ADDRESS_41
    call LINK_ADDRESS_28
    cmp dword [LINK_ADDRESS_16], 0
    jne near loc_0927
    call LINK_ADDRESS_24
    test eax, eax
    jne near loc_0927
    mov eax, 0x121
    call LINK_ADDRESS_23
loc_087f:
    cmp byte [LINK_ADDRESS_42], 0xc8
    jb short loc_088f
    call 0x10800
    jmp short loc_087f
loc_088f:
    call LINK_ADDRESS_24
    test eax, eax
    jne near loc_094d
    mov eax, 0x122
    call LINK_ADDRESS_23
loc_08a6:
    cmp byte [LINK_ADDRESS_43], 0xc8
    jb short loc_08b6
    call 0x10800
    jmp short loc_08a6
loc_08b6:
    call LINK_ADDRESS_24
    test eax, eax
    jne near loc_094d
    mov eax, 0x123
    call LINK_ADDRESS_23
loc_08cd:
    cmp byte [LINK_ADDRESS_44], 0xc8
    jb short loc_08dd
    call 0x10800
    jmp short loc_08cd
loc_08dd:
    call LINK_ADDRESS_24
    test eax, eax
    jne near loc_094d
    mov eax, 0x124
    call LINK_ADDRESS_23
loc_08f4:
    cmp byte [LINK_ADDRESS_45], 0xc8
    jb short loc_0904
    call 0x10800
    jmp short loc_08f4
loc_0904:
    call LINK_ADDRESS_24
    test eax, eax
    jne short loc_094d
    mov eax, 0x125
    call LINK_ADDRESS_23
loc_0917:
    cmp byte [LINK_ADDRESS_46], 0xc8
    jb short loc_0927
    call 0x10800
    jmp short loc_0917
loc_0927:
    xor esi, esi
    call LINK_ADDRESS_21
    mov dword [TOTALCLOCK], esi
loc_0934:
    call LINK_ADDRESS_24
    test eax, eax
    jne short loc_094d
    cmp dword [TOTALCLOCK], 0x78
    jge short loc_094d
    call 0x10800
    jmp short loc_0934
loc_094d:
    call LINK_ADDRESS_8
    call LINK_ADDRESS_9
    call LINK_ADDRESS_21
    xor eax, eax
    call LINK_ADDRESS_5
loc_0963:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ecx, PALETTE
    xor esi, esi
    mov dword [nosplit eax*2 + LINK_ADDRESS_20], ecx
    call LINK_ADDRESS_21
    mov dword [TOTALCLOCK], esi
    call LINK_ADDRESS_26
    call LINK_ADDRESS_8
    call LINK_ADDRESS_9
    cmp byte [LINK_ADDRESS_47], 1
    jbe near loc_0ea4
    cmp dword [LINK_ADDRESS_48], 1
    je near loc_0ea4
    cmp dword [LINK_ADDRESS_49], 0
    je short loc_09d8
    cmp dword [LINK_ADDRESS_50], 0xd
    je short loc_09d8
    mov eax, 0xf9
    call LINK_ADDRESS_23
loc_09d8:
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
    push 0x10
    mov ebx, 0x10000
    xor ecx, ecx
    push 0x998
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_17
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xa
    push 0
    push 0
    mov ebx, 0x10000
    mov edx, 0x220000
    push 0x9c3
    xor ecx, ecx
    mov eax, 0xa00000
    call LINK_ADDRESS_17
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xa
    push 0
    push 0
    mov ebx, 0x10000
    mov edx, 0x240000
    push 0x9c7
    xor ecx, ecx
    mov eax, 0x1040000
    call LINK_ADDRESS_17
    push 0x1a
    mov ebx, LINK_ADDRESS_51
    mov edx, 0x3c
    mov eax, 0xa0
    xor ecx, ecx
    call 0x10240
    imul edx, dword [LINK_ADDRESS_14], 0xb
    movsx eax, word [LINK_ADDRESS_52]
    add eax, edx
    lea edx, [eax - 1]
    push 0x1a
    mov eax, edx
    xor ecx, ecx
    shl eax, 5
    mov ebx, LINK_ADDRESS_53
    add eax, edx
    mov edx, 0x44
    add ebx, eax
    mov eax, 0xa0
    call 0x10240
    push 0x1a
    mov ebx, LINK_ADDRESS_54
    mov edx, 0xa5
    mov eax, 0xa0
    xor ecx, ecx
    call 0x10240
    xor esi, esi
    push 0x9a
    mov ecx, 8
    mov ebx, LINK_ADDRESS_55
    mov edx, 0x50
    mov eax, 0x17
    xor ebp, ebp
    call 0x105c0
    jmp short loc_0b39
loc_0af3:
    lea edi, [ebp + 1]
    push edi
    push LINK_ADDRESS_56
    push LINK_ADDRESS_57
    mov ecx, 3
    call SPRINTF
    lea eax, [ebp*4]
    add esp, 0xc
    sub eax, ebp
    mov ebx, LINK_ADDRESS_57
    lea eax, [eax*8]
    push 0x9a
    sub eax, ebp
    mov edx, 0x50
    add eax, 0x5c
    call 0x105c0
    mov ebp, edi
loc_0b39:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_47]
    cmp ebp, eax
    jl short loc_0af3
    xor ebp, ebp
    jmp near loc_0d4f
loc_0b4b:
    lea eax, [ebp + 1]
    push eax
    push LINK_ADDRESS_59
    xor ecx, ecx
    push LINK_ADDRESS_57
    movsx edi, si
    mov dword [esp + 0xdc], ecx
    call SPRINTF
    add esp, 0xc
    mov ebx, LINK_ADDRESS_57
    add edi, 0x5a
    push 0x9a
    mov edx, edi
    mov eax, 0x1e
    call 0x105c0
    mov eax, ebp
    push 0x9a
    shl eax, 7
    mov ebx, ebp
    sub eax, ebp
    mov edx, edi
    lea eax, [eax*4]
    shl ebx, 5
    sub eax, ebp
    xor ecx, ecx
    add ebx, LINK_ADDRESS_60
    mov cl, byte [nosplit eax*2 + LINK_ADDRESS_61]
    mov eax, 0x26
    xor edi, edi
    call 0x105c0
    jmp near loc_0d03
loc_0bc2:
    lea eax, [edi*4]
    sub eax, edi
    lea eax, [eax*8]
    sub eax, edi
    add eax, 0x5c
    mov dword [esp + 0xcc], eax
    cmp ebp, edi
    jne short loc_0c56
    mov eax, edi
    shl eax, 7
    sub eax, edi
    lea eax, [eax*4]
    sub eax, edi
    add eax, eax
    mov dword [esp + 0xc8], eax
    movsx eax, word [eax + LINK_ADDRESS_62]
    push eax
    push LINK_ADDRESS_56
    push LINK_ADDRESS_57
    mov ecx, 2
    mov ebx, LINK_ADDRESS_57
    call SPRINTF
    add esp, 0xc
    movsx edx, si
    push 0x9a
    add edx, 0x5a
    mov eax, dword [esp + 0xd0]
    call 0x105c0
    mov eax, dword [esp + 0xc8]
    mov ebx, dword [esp + 0xd0]
    movsx eax, word [eax + LINK_ADDRESS_62]
    sub ebx, eax
    mov dword [esp + 0xd0], ebx
    jmp short loc_0cc1
loc_0c56:
    mov eax, ebp
    db 0x8d, 0x14, 0x7d, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edi*2]
    shl eax, 5
    add eax, edx
    mov dword [esp + 0xc8], eax
    movsx eax, word [eax + LINK_ADDRESS_63]
    push eax
    push LINK_ADDRESS_56
    push LINK_ADDRESS_57
    mov ebx, LINK_ADDRESS_57
    xor ecx, ecx
    call SPRINTF
    add esp, 0xc
    movsx edx, si
    push 0x9a
    add edx, 0x5a
    mov eax, dword [esp + 0xd0]
    call 0x105c0
    mov eax, dword [esp + 0xc8]
    mov edx, dword [esp + 0xd0]
    movsx eax, word [eax + LINK_ADDRESS_63]
    add edx, eax
    mov dword [esp + 0xd0], edx
loc_0cc1:
    mov ax, word [MYCONNECTINDEX]
    cmp ax, word [CONNECTHEAD]
    jne short loc_0d02
    mov edx, ebp
    shl edx, 5
    movsx eax, word [edx + edi*2 + LINK_ADDRESS_63]
    push eax
    lea eax, [edi + 1]
    push eax
    lea eax, [ebp + 1]
    push eax
    push LINK_ADDRESS_65
    push LINK_ADDRESS_57
    call SPRINTF
    add esp, 0x14
    mov eax, LINK_ADDRESS_57
    call LINK_ADDRESS_66
loc_0d02:
    inc edi
loc_0d03:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_47]
    cmp edi, eax
    jl near loc_0bc2
    mov edi, dword [esp + 0xd0]
    push edi
    push LINK_ADDRESS_56
    mov ecx, 2
    mov ebx, LINK_ADDRESS_57
    push LINK_ADDRESS_57
    movsx edx, si
    call SPRINTF
    add esp, 0xc
    inc ebp
    add edx, 0x5a
    push 0x9a
    mov eax, 0x11d
    add esi, 7
    call 0x105c0
loc_0d4f:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_47]
    cmp ebp, eax
    jl near loc_0b4b
    xor edi, edi
    jmp near loc_0de6
loc_0d65:
    xor ecx, ecx
    xor ebp, ebp
    jmp short loc_0d99
loc_0d6b:
    cmp ebp, edi
    jne short loc_0d89
    mov eax, edi
    shl eax, 7
    sub eax, edi
    lea eax, [eax*4]
    sub eax, edi
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_62]
    add ecx, eax
loc_0d89:
    mov eax, ebp
    shl eax, 5
    movsx eax, word [eax + edi*2 + LINK_ADDRESS_63]
    inc ebp
    add ecx, eax
loc_0d99:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_47]
    cmp ebp, eax
    jl short loc_0d6b
    push ecx
    push LINK_ADDRESS_56
    push LINK_ADDRESS_57
    mov ebx, LINK_ADDRESS_57
    call SPRINTF
    lea eax, [edi*4]
    add esp, 0xc
    sub eax, edi
    mov edx, 0x98
    lea eax, [eax*8]
    push 0x9a
    sub eax, edi
    mov ecx, 2
    add eax, 0x5c
    call 0x105c0
    inc edi
loc_0de6:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_47]
    cmp edi, eax
    jl near loc_0d65
    push 0x9a
    mov ecx, 8
    mov ebx, LINK_ADDRESS_67
    mov edx, 0x98
    mov eax, 0x2d
    call 0x105c0
    call LINK_ADDRESS_6
    xor esi, esi
    jmp short loc_0e36
loc_0e1c:
    mov eax, 0x3f
    movsx ecx, si
    xor ebx, ebx
    sub eax, ecx
    xor edx, edx
    mov ecx, eax
    xor eax, eax
    add esi, 7
    call LINK_ADDRESS_1
loc_0e36:
    cmp si, 0x40
    jl short loc_0e1c
    call LINK_ADDRESS_21
loc_0e41:
    call LINK_ADDRESS_24
    test eax, eax
    jne short loc_0e51
    call 0x10800
    jmp short loc_0e41
loc_0e51:
    cmp byte [LINK_ADDRESS_68], 0
    je short loc_0e6e
    xor dl, dl
    mov byte [LINK_ADDRESS_68], dl
    mov eax, LINK_ADDRESS_69
    xor edx, edx
    call LINK_ADDRESS_70
loc_0e6e:
    cmp byte [esp + 0xd8], 0
    jne near loc_1767
    cmp dword [LINK_ADDRESS_71], 1
    jg near loc_1767
    xor esi, esi
    jmp short loc_0e9e
loc_0e8d:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_1
    add esi, 7
loc_0e9e:
    cmp si, 0x40
    jl short loc_0e8d
loc_0ea4:
    cmp byte [esp + 0xd8], 0
    jne near loc_1767
    cmp dword [LINK_ADDRESS_71], 1
    jg near loc_1767
    mov eax, dword [LINK_ADDRESS_14]
    cmp eax, 1
    jne short loc_0ed6
    mov dword [esp + 0xd4], 5
    jmp short loc_0edf
loc_0ed6:
    xor esi, esi
    mov dword [esp + 0xd4], esi
loc_0edf:
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xda
    mov ebx, 0x10000
    push 0
    movsx eax, word [esp + 0xec]
    push 0
    add eax, 0xca8
    xor ecx, ecx
    push eax
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_17
    imul edx, dword [LINK_ADDRESS_14], 0xb
    movsx eax, word [LINK_ADDRESS_52]
    add edx, eax
    dec edx
    mov eax, edx
    shl eax, 5
    add eax, edx
    xor ecx, ecx
    add eax, LINK_ADDRESS_53
    xor ebx, ebx
    push eax
    mov edx, 0xe
    mov eax, 0xa0
    call LINK_ADDRESS_33
    push LINK_ADDRESS_72
    mov edx, 0x1e
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_33
    push 0x1a
    mov ecx, 0x10
    mov ebx, LINK_ADDRESS_54
    mov edx, 0xc0
    mov eax, 0xa0
    call 0x10240
    cmp dword [LINK_ADDRESS_49], 0
    je short loc_0f98
    cmp dword [LINK_ADDRESS_50], 0xd
    je short loc_0f98
    mov eax, 0xf9
    call LINK_ADDRESS_23
loc_0f98:
    call LINK_ADDRESS_6
    call LINK_ADDRESS_21
    xor esi, esi
    jmp short loc_0fbe
loc_0fa6:
    mov eax, 0x3f
    movsx ecx, si
    xor ebx, ebx
    sub eax, ecx
    xor edx, edx
    mov ecx, eax
    xor eax, eax
    inc esi
    call LINK_ADDRESS_1
loc_0fbe:
    cmp si, 0x40
    jl short loc_0fa6
    xor edi, edi
    xor edx, edx
    mov dword [TOTALCLOCK], edx
loc_0fce:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    test byte [nosplit eax*2 + LINK_ADDRESS_73], 8
    je near loc_1767
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xda
    mov ebx, 0x10000
    push 0
    movsx eax, word [esp + 0xec]
    push 0
    add eax, 0xca8
    xor ecx, ecx
    push eax
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_17
    cmp dword [TOTALCLOCK], 0x3b9aca00
    jle near loc_112d
    cmp dword [TOTALCLOCK], 0x3b9acb40
    jge near loc_112d
    mov edx, dword [TOTALCLOCK]
    sar edx, 4
    mov ebx, 0xf
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    cmp edx, 5
    ja near loc_11c9
    jmp dword cs:[edx*4 + LINK_ADDRESS_74]
    cmp di, 6
    jne short loc_10b7
    mov eax, 0xa9
    call LINK_ADDRESS_23
    call LINK_ADDRESS_75
    and eax, 3
    inc edi
    cmp eax, 3
    ja short loc_10b7
    jmp dword cs:[eax*4 + LINK_ADDRESS_76]
    mov eax, 0xc3
    jmp short loc_10b2
    mov eax, 0xc4
    jmp short loc_10b2
    mov eax, 0xc5
    jmp short loc_10b2
    mov eax, 0xc7
loc_10b2:
    call LINK_ADDRESS_23
loc_10b7:
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xda
    mov ebx, 0x10000
    push 0
    movsx eax, word [esp + 0xec]
    push 0
    add eax, 0xcab
    jmp near loc_11b7
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xda
    mov ebx, 0x10000
    push 0
    movsx eax, word [esp + 0xec]
    push 0
    add eax, 0xcac
    mov edx, 0x1f0000
    push eax
    xor ecx, ecx
    mov eax, 0xc70000
    call LINK_ADDRESS_17
    jmp near loc_11c9
loc_112d:
    cmp dword [TOTALCLOCK], 0x2878
    jg near loc_1767
    mov eax, dword [TOTALCLOCK]
    sar eax, 5
    and eax, 3
    cmp eax, 2
    jb short loc_1156
    jbe short loc_118a
    cmp eax, 3
    je short loc_115b
    jmp short loc_11c9
loc_1156:
    cmp eax, 1
    jne short loc_11c9
loc_115b:
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xda
    mov ebx, 0x10000
    push 0
    movsx eax, word [esp + 0xec]
    push 0
    add eax, 0xca9
    jmp short loc_11b7
loc_118a:
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xda
    mov ebx, 0x10000
    push 0
    movsx eax, word [esp + 0xec]
    push 0
    add eax, 0xcaa
loc_11b7:
    mov edx, 0x1f0000
    push eax
    xor ecx, ecx
    mov eax, 0xc70000
    call LINK_ADDRESS_17
loc_11c9:
    imul eax, dword [LINK_ADDRESS_14], 0xb
    movsx edx, word [LINK_ADDRESS_52]
    add edx, eax
    dec edx
    mov eax, edx
    shl eax, 5
    add eax, edx
    xor ecx, ecx
    add eax, LINK_ADDRESS_53
    xor ebx, ebx
    push eax
    mov edx, 0xe
    mov eax, 0xa0
    call LINK_ADDRESS_33
    push LINK_ADDRESS_72
    mov edx, 0x1e
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_33
    push 0x1a
    mov ecx, 0x10
    mov ebx, LINK_ADDRESS_54
    mov edx, 0xc0
    mov eax, 0xa0
    call 0x10240
    cmp dword [TOTALCLOCK], 0xb4
    jle near loc_142b
    push 0x1a
    mov ebx, LINK_ADDRESS_77
    mov edx, 0x44
    mov eax, 0xa
    xor ecx, ecx
    call 0x10240
    push 0x1a
    mov ebx, LINK_ADDRESS_78
    mov edx, 0x4e
    mov eax, 0xa
    xor ecx, ecx
    call 0x10240
    push 0x1a
    mov ebx, LINK_ADDRESS_79
    mov edx, 0x57
    mov eax, 0xa
    xor ecx, ecx
    call 0x10240
    test di, di
    jne short loc_128f
    mov edi, 1
loc_128f:
    cmp dword [TOTALCLOCK], 0xf0
    jle near loc_142b
    cmp di, 1
    jne short loc_12b1
    mov eax, 0xe
    call LINK_ADDRESS_23
    add edi, edi
loc_12b1:
    movsx edx, word [MYCONNECTINDEX]
    mov ecx, edx
    shl ecx, 7
    sub ecx, edx
    lea ecx, [ecx*4]
    sub ecx, edx
    add ecx, ecx
    mov eax, dword [ecx + LINK_ADDRESS_80]
    mov edx, eax
    mov ebx, 0x1a
    sar edx, 0x1f
    idiv ebx
    mov edx, eax
    mov ebx, 0x3c
    sar edx, 0x1f
    idiv ebx
    mov eax, dword [ecx + LINK_ADDRESS_80]
    push edx
    mov edx, eax
    mov ebx, 0x618
    sar edx, 0x1f
    idiv ebx
    mov edx, eax
    mov ebx, 0x3c
    sar edx, 0x1f
    idiv ebx
    push edx
    push LINK_ADDRESS_81
    push LINK_ADDRESS_57
    call SPRINTF
    add esp, 0x10
    xor ecx, ecx
    mov ebx, LINK_ADDRESS_57
    push 0x1a
    mov edx, 0x45
    mov eax, 0x97
    call 0x10240
    imul eax, dword [LINK_ADDRESS_14], 0xb
    movsx edx, word [LINK_ADDRESS_52]
    add eax, edx
    lea ecx, [eax*4]
    mov eax, dword [ecx + LINK_ADDRESS_82]
    mov edx, eax
    mov ebx, 0x1a
    sar edx, 0x1f
    idiv ebx
    mov edx, eax
    mov ebx, 0x3c
    sar edx, 0x1f
    idiv ebx
    mov eax, dword [ecx + LINK_ADDRESS_82]
    push edx
    mov edx, eax
    mov ebx, 0x618
    sar edx, 0x1f
    idiv ebx
    mov edx, eax
    mov ebx, 0x3c
    sar edx, 0x1f
    idiv ebx
    push edx
    push LINK_ADDRESS_81
    push LINK_ADDRESS_57
    call SPRINTF
    add esp, 0x10
    xor ecx, ecx
    mov ebx, LINK_ADDRESS_57
    push 0x1a
    mov edx, 0x4e
    mov eax, 0x97
    call 0x10240
    imul eax, dword [LINK_ADDRESS_14], 0xb
    movsx ecx, word [LINK_ADDRESS_52]
    add ecx, eax
    mov eax, dword [ecx*4 + LINK_ADDRESS_83]
    mov edx, eax
    mov ebx, 0x1a
    sar edx, 0x1f
    idiv ebx
    mov edx, eax
    mov ebx, 0x3c
    sar edx, 0x1f
    idiv ebx
    mov eax, dword [ecx*4 + LINK_ADDRESS_83]
    push edx
    mov edx, eax
    mov ebx, 0x618
    sar edx, 0x1f
    idiv ebx
    mov edx, eax
    mov ebx, 0x3c
    sar edx, 0x1f
    idiv ebx
    push edx
    push LINK_ADDRESS_81
    push LINK_ADDRESS_57
    call SPRINTF
    add esp, 0x10
    xor ecx, ecx
    mov ebx, LINK_ADDRESS_57
    push 0x1a
    mov edx, 0x57
    mov eax, 0x97
    call 0x10240
loc_142b:
    cmp dword [TOTALCLOCK], 0x168
    jle near loc_157e
    push 0x1a
    mov ebx, LINK_ADDRESS_84
    mov edx, 0x67
    mov eax, 0xa
    xor ecx, ecx
    call 0x10240
    push 0x1a
    mov ebx, LINK_ADDRESS_85
    mov edx, 0x70
    mov eax, 0xa
    xor ecx, ecx
    call 0x10240
    cmp di, 2
    jne short loc_147c
    mov eax, 0xf4
    inc edi
    call LINK_ADDRESS_23
loc_147c:
    cmp dword [TOTALCLOCK], 0x1a4
    jle near loc_157e
    cmp di, 3
    jne short loc_149d
    mov eax, 0xe
    inc edi
    call LINK_ADDRESS_23
loc_149d:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov al, byte [nosplit eax*2 + LINK_ADDRESS_86]
    and eax, 0xff
    push eax
    push LINK_ADDRESS_87
    push LINK_ADDRESS_57
    call SPRINTF
    add esp, 0xc
    mov ebx, LINK_ADDRESS_57
    mov edx, 0x66
    push 0x1a
    xor ecx, ecx
    mov eax, 0x96
    call 0x10240
    cmp dword [LINK_ADDRESS_88], 3
    jle short loc_151b
    push LINK_ADDRESS_89
    push LINK_ADDRESS_57
    call SPRINTF
    add esp, 8
    mov ebx, LINK_ADDRESS_57
    mov edx, 0x70
    push 0x1a
    xor ecx, ecx
    mov eax, 0x96
    jmp short loc_1579
loc_151b:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor edx, edx
    mov dl, byte [nosplit eax*2 + LINK_ADDRESS_90]
    mov al, byte [nosplit eax*2 + LINK_ADDRESS_86]
    and eax, 0xff
    sub edx, eax
    mov eax, edx
    test edx, edx
    jge short loc_1553
    push 0
    jmp short loc_1554
loc_1553:
    push edx
loc_1554:
    push LINK_ADDRESS_87
    push LINK_ADDRESS_57
    call SPRINTF
    add esp, 0xc
    push 0x1a
    mov ebx, LINK_ADDRESS_57
    mov edx, 0x70
    mov eax, 0x96
    xor ecx, ecx
loc_1579:
    call 0x10240
loc_157e:
    cmp dword [TOTALCLOCK], 0x21c
    jle near loc_16d9
    push 0x1a
    mov ebx, LINK_ADDRESS_91
    mov edx, 0x81
    mov eax, 0xa
    xor ecx, ecx
    call 0x10240
    push 0x1a
    mov ebx, LINK_ADDRESS_92
    mov edx, 0x8b
    mov eax, 0xa
    xor ecx, ecx
    call 0x10240
    cmp di, 4
    jne short loc_15c5
    inc edi
loc_15c5:
    cmp dword [TOTALCLOCK], 0x258
    jle near loc_16d9
    cmp di, 5
    jne short loc_15e6
    mov eax, 0xe
    inc edi
    call LINK_ADDRESS_23
loc_15e6:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov al, byte [nosplit eax*2 + LINK_ADDRESS_93]
    and eax, 0xff
    push eax
    push LINK_ADDRESS_87
    push LINK_ADDRESS_57
    call SPRINTF
    add esp, 0xc
    mov ebx, LINK_ADDRESS_57
    mov edx, 0x81
    push 0x1a
    xor ecx, ecx
    mov eax, 0x96
    call 0x10240
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov cl, byte [eax + LINK_ADDRESS_93]
    test cl, cl
    jbe short loc_1680
    xor edx, edx
    mov dl, cl
    imul edx, edx, 0x64
    xor ebx, ebx
    mov bl, byte [eax + LINK_ADDRESS_94]
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    push eax
    push LINK_ADDRESS_95
    push LINK_ADDRESS_57
    call SPRINTF
    add esp, 0xc
loc_1680:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor edx, edx
    mov dl, byte [nosplit eax*2 + LINK_ADDRESS_94]
    mov al, byte [nosplit eax*2 + LINK_ADDRESS_93]
    and eax, 0xff
    sub edx, eax
    push edx
    push LINK_ADDRESS_87
    push LINK_ADDRESS_57
    call SPRINTF
    add esp, 0xc
    mov ebx, LINK_ADDRESS_57
    xor ecx, ecx
    push 0x1a
    mov edx, 0x8b
    mov eax, 0x96
    call 0x10240
loc_16d9:
    cmp dword [TOTALCLOCK], 0x2800
    jle short loc_16fb
    cmp dword [TOTALCLOCK], 0x5000
    jge short loc_16fb
    mov dword [TOTALCLOCK], 0x400
loc_16fb:
    call LINK_ADDRESS_24
    test eax, eax
    je short loc_175d
    cmp dword [TOTALCLOCK], 0x78
    jle short loc_175d
    cmp byte [LINK_ADDRESS_68], 0
    je short loc_1729
    xor al, al
    mov byte [LINK_ADDRESS_68], al
    mov eax, LINK_ADDRESS_69
    xor edx, edx
    call LINK_ADDRESS_70
loc_1729:
    cmp dword [TOTALCLOCK], 0x30c
    jge short loc_1747
    mov esi, 0x30c
    call LINK_ADDRESS_21
    mov dword [TOTALCLOCK], esi
    jmp short loc_175d
loc_1747:
    cmp dword [TOTALCLOCK], 0x3b9aca00
    jge short loc_175d
    mov dword [TOTALCLOCK], 0x3b9aca00
loc_175d:
    call LINK_ADDRESS_6
    jmp near loc_0fce
loc_1767:
    add esp, 0xdc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
