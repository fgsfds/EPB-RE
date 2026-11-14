; Game interface text and input display.
bits 32
org START_ADDRESS

    push esi
    push edi
    push ebp
    call LINK_ADDRESS_1
    mov ebx, LINK_ADDRESS_2
    mov edx, dword [LINK_ADDRESS_3]
    mov esi, 0x64
    cmp edx, 1
    jne short loc_0037
    cmp dword [CONTROL_MOUSEPRESENT], 0
    je short loc_0037
    mov edx, LINK_ADDRESS_5
    mov eax, LINK_ADDRESS_6
    call LINK_ADDRESS_7
    jmp short loc_0045
loc_0037:
    xor edi, edi
    mov dword [LINK_ADDRESS_8], edi
    mov dword [LINK_ADDRESS_9], edi
loc_0045:
    mov eax, dword [LINK_ADDRESS_10]
    test eax, eax
    jne near loc_0151
    mov ecx, dword [LINK_ADDRESS_6]
    cmp ecx, 0x4b
    jl short loc_007c
    cmp ecx, 0x64
    jg short loc_007c
    mov ebp, dword [LINK_ADDRESS_5]
    cmp ebp, 0x64
    jl short loc_007c
    cmp ebp, 0x96
    jg short loc_007c
    mov ebx, LINK_ADDRESS_11
    xor esi, esi
loc_007c:
    mov edx, dword [LINK_ADDRESS_6]
    cmp edx, 5
    jl short loc_00ac
    cmp edx, 0x46
    jg short loc_00ac
    mov edi, dword [LINK_ADDRESS_5]
    cmp edi, 0xa5
    jl short loc_00ac
    cmp edi, 0xc8
    jg short loc_00ac
    mov ebx, LINK_ADDRESS_12
    mov esi, 1
loc_00ac:
    mov eax, dword [LINK_ADDRESS_6]
    cmp eax, 0xeb
    jl short loc_00dc
    cmp eax, 0x113
    jg short loc_00dc
    mov ecx, dword [LINK_ADDRESS_5]
    cmp ecx, 0x7d
    jl short loc_00dc
    cmp ecx, 0xaf
    jg short loc_00dc
    mov ebx, LINK_ADDRESS_13
    mov esi, 2
loc_00dc:
    mov ebp, dword [LINK_ADDRESS_6]
    cmp ebp, 0xcd
    jl short loc_010c
    cmp ebp, 0x11d
    jg short loc_010c
    mov edx, dword [LINK_ADDRESS_5]
    cmp edx, 0x2d
    jl short loc_010c
    cmp edx, 0x4b
    jg short loc_010c
    mov ebx, LINK_ADDRESS_14
    mov esi, 3
loc_010c:
    mov edi, dword [LINK_ADDRESS_6]
    cmp edi, 0x69
    jl near loc_0636
    cmp edi, 0xc8
    jg near loc_0636
    mov eax, dword [LINK_ADDRESS_5]
    cmp eax, 0x9b
    jl near loc_0636
    cmp eax, 0xb4
    jg near loc_0636
    mov ebx, LINK_ADDRESS_15
    mov esi, 4
    jmp near loc_0636
loc_0151:
    cmp eax, 0x64
    jne near loc_0258
    mov ecx, dword [LINK_ADDRESS_6]
    cmp ecx, 0x23
    jl short loc_0184
    cmp ecx, 0x5a
    jg short loc_0184
    mov ebp, dword [LINK_ADDRESS_5]
    cmp ebp, 0x28
    jl short loc_0184
    cmp ebp, 0x46
    jg short loc_0184
    mov ebx, LINK_ADDRESS_16
    mov esi, 1
loc_0184:
    mov edx, dword [LINK_ADDRESS_6]
    cmp edx, 0x23
    jl short loc_01ae
    cmp edx, 0x55
    jg short loc_01ae
    mov edi, dword [LINK_ADDRESS_5]
    cmp edi, 0x50
    jl short loc_01ae
    cmp edi, 0x69
    jg short loc_01ae
    mov ebx, LINK_ADDRESS_17
    mov esi, 2
loc_01ae:
    mov eax, dword [LINK_ADDRESS_6]
    cmp eax, 0x9b
    jl short loc_01e1
    cmp eax, 0x118
    jg short loc_01e1
    mov ecx, dword [LINK_ADDRESS_5]
    cmp ecx, 0x8c
    jl short loc_01e1
    cmp ecx, 0xc8
    jg short loc_01e1
    mov ebx, LINK_ADDRESS_18
    mov esi, 3
loc_01e1:
    mov ebp, dword [LINK_ADDRESS_6]
    cmp ebp, 0x8c
    jl short loc_0214
    cmp ebp, 0xa9
    jg short loc_0214
    mov edx, dword [LINK_ADDRESS_5]
    cmp edx, 0x3c
    jl short loc_0214
    cmp edx, 0xa5
    jg short loc_0214
    mov ebx, LINK_ADDRESS_19
    mov esi, 4
loc_0214:
    mov edi, dword [LINK_ADDRESS_6]
    cmp edi, 0xe6
    jl near loc_0636
    cmp edi, 0x122
    jg near loc_0636
    mov eax, dword [LINK_ADDRESS_5]
    cmp eax, 0x3c
    jl near loc_0636
    cmp eax, 0x7d
    jg near loc_0636
    mov ebx, LINK_ADDRESS_20
    mov esi, 5
    jmp near loc_0636
loc_0258:
    cmp eax, 0x66
    jne near loc_02d9
    mov ebp, dword [LINK_ADDRESS_6]
    cmp ebp, 0x1e
    jl short loc_0291
    cmp ebp, 0x73
    jg short loc_0291
    mov edx, dword [LINK_ADDRESS_5]
    cmp edx, 0xaf
    jl short loc_0291
    cmp edx, 0xb9
    jg short loc_0291
    mov ebx, LINK_ADDRESS_21
    mov esi, 1
loc_0291:
    mov edi, dword [LINK_ADDRESS_6]
    cmp edi, 0xd2
    jl near loc_0636
    cmp edi, 0x113
    jg near loc_0636
    mov eax, dword [LINK_ADDRESS_5]
    cmp eax, 0xaf
    jl near loc_0636
    cmp eax, 0xb9
    jg near loc_0636
    mov ebx, LINK_ADDRESS_22
    mov esi, 2
    jmp near loc_0636
loc_02d9:
    cmp eax, 0x67
    jne short loc_0322
    mov eax, dword [LINK_ADDRESS_6]
    cmp eax, 0x1e
    jl near loc_0636
    cmp eax, 0x73
    jg near loc_0636
    mov ecx, dword [LINK_ADDRESS_5]
    cmp ecx, 0xaf
    jl near loc_0636
    cmp ecx, 0xb9
    jg near loc_0636
    mov ebx, LINK_ADDRESS_23
    mov esi, 1
    jmp near loc_0636
loc_0322:
    cmp eax, 0xc8
    jne near loc_03a5
    mov ecx, dword [LINK_ADDRESS_6]
    cmp ecx, 0x2d
    jl short loc_035d
    cmp ecx, 0x64
    jg short loc_035d
    mov ebp, dword [LINK_ADDRESS_5]
    cmp ebp, 0x82
    jl short loc_035d
    cmp ebp, 0x9b
    jg short loc_035d
    mov ebx, LINK_ADDRESS_24
    mov esi, 1
loc_035d:
    mov edx, dword [LINK_ADDRESS_6]
    cmp edx, 0xaa
    jl near loc_0636
    cmp edx, 0x12c
    jg near loc_0636
    mov edi, dword [LINK_ADDRESS_5]
    cmp edi, 0x28
    jl near loc_0636
    cmp edi, 0xc8
    jg near loc_0636
    mov ebx, LINK_ADDRESS_20
    mov esi, 2
    jmp near loc_0636
loc_03a5:
    cmp eax, 0x96
    jl near loc_048c
    cmp eax, 0x99
    jg near loc_048c
    mov edx, dword [LINK_ADDRESS_6]
    cmp edx, 0xa
    jl short loc_03eb
    cmp edx, 0x14
    jg short loc_03eb
    mov edi, dword [LINK_ADDRESS_5]
    cmp edi, 0x96
    jl short loc_03eb
    cmp edi, 0xa5
    jg short loc_03eb
    mov ebx, LINK_ADDRESS_25
    mov esi, 1
loc_03eb:
    mov eax, dword [LINK_ADDRESS_6]
    cmp eax, 0x78
    jl short loc_041c
    cmp eax, 0x82
    jg short loc_041c
    mov ecx, dword [LINK_ADDRESS_5]
    cmp ecx, 0x96
    jl short loc_041c
    cmp ecx, 0xa5
    jg short loc_041c
    mov ebx, LINK_ADDRESS_26
    mov esi, 2
loc_041c:
    mov ebp, dword [LINK_ADDRESS_6]
    cmp ebp, 5
    jl short loc_044c
    cmp ebp, 0x23
    jg short loc_044c
    mov edx, dword [LINK_ADDRESS_5]
    cmp edx, 0xaa
    jl short loc_044c
    cmp edx, 0xbe
    jg short loc_044c
    mov ebx, LINK_ADDRESS_27
    mov esi, 3
loc_044c:
    mov edi, dword [LINK_ADDRESS_6]
    cmp edi, 5
    jl near loc_0636
    cmp edi, 0x78
    jg near loc_0636
    mov eax, dword [LINK_ADDRESS_5]
    cmp eax, 0x1e
    jl near loc_0636
    cmp eax, 0x8c
    jg near loc_0636
    mov ebx, LINK_ADDRESS_28
    mov esi, 4
    jmp near loc_0636
loc_048c:
    mov ecx, dword [LINK_ADDRESS_10]
    cmp ecx, 0xa0
    jne near loc_0569
    mov eax, dword [LINK_ADDRESS_6]
    cmp eax, 0x5f
    jl short loc_04ca
    cmp eax, 0x69
    jg short loc_04ca
    mov ecx, dword [LINK_ADDRESS_5]
    cmp ecx, 0x73
    jl short loc_04ca
    cmp ecx, 0x87
    jg short loc_04ca
    mov ebx, LINK_ADDRESS_29
    mov esi, 1
loc_04ca:
    mov ebp, dword [LINK_ADDRESS_6]
    cmp ebp, 0xbe
    jl short loc_04fd
    cmp ebp, 0xc8
    jg short loc_04fd
    mov edx, dword [LINK_ADDRESS_5]
    cmp edx, 0x73
    jl short loc_04fd
    cmp edx, 0x87
    jg short loc_04fd
    mov ebx, LINK_ADDRESS_30
    mov esi, 2
loc_04fd:
    mov edi, dword [LINK_ADDRESS_6]
    cmp edi, 0x6e
    jl short loc_052b
    cmp edi, 0xb9
    jg short loc_052b
    mov eax, dword [LINK_ADDRESS_5]
    cmp eax, 0x73
    jl short loc_052b
    cmp eax, 0x87
    jg short loc_052b
    mov ebx, LINK_ADDRESS_31
    mov esi, 3
loc_052b:
    mov ecx, dword [LINK_ADDRESS_6]
    cmp ecx, 0x6e
    jl near loc_0636
    cmp ecx, 0xb9
    jg near loc_0636
    mov ebp, dword [LINK_ADDRESS_5]
    cmp ebp, 0xa0
    jl near loc_0636
    cmp ebp, 0xaa
    jg near loc_0636
    jmp near loc_062c
loc_0569:
    cmp ecx, 0xaa
    jne near loc_0636
    mov ebp, dword [LINK_ADDRESS_6]
    cmp ebp, 0x5f
    jl short loc_05a2
    cmp ebp, 0x69
    jg short loc_05a2
    mov edx, dword [LINK_ADDRESS_5]
    cmp edx, 0x73
    jl short loc_05a2
    cmp edx, 0x87
    jg short loc_05a2
    mov ebx, LINK_ADDRESS_29
    mov esi, 1
loc_05a2:
    mov edi, dword [LINK_ADDRESS_6]
    cmp edi, 0xbe
    jl short loc_05d3
    cmp edi, 0xc8
    jg short loc_05d3
    mov eax, dword [LINK_ADDRESS_5]
    cmp eax, 0x73
    jl short loc_05d3
    cmp eax, 0x87
    jg short loc_05d3
    mov ebx, LINK_ADDRESS_30
    mov esi, 2
loc_05d3:
    mov ecx, dword [LINK_ADDRESS_6]
    cmp ecx, 0x6e
    jl short loc_0603
    cmp ecx, 0xb9
    jg short loc_0603
    mov ebp, dword [LINK_ADDRESS_5]
    cmp ebp, 0x73
    jl short loc_0603
    cmp ebp, 0x87
    jg short loc_0603
    mov ebx, LINK_ADDRESS_31
    mov esi, 3
loc_0603:
    mov edx, dword [LINK_ADDRESS_6]
    cmp edx, 0x6e
    jl short loc_0636
    cmp edx, 0xb9
    jg short loc_0636
    mov edi, dword [LINK_ADDRESS_5]
    cmp edi, 0xa0
    jl short loc_0636
    cmp edi, 0xaa
    jg short loc_0636
loc_062c:
    mov ebx, LINK_ADDRESS_32
    mov esi, 3
loc_0636:
    mov edx, 0xc5
    mov eax, 0x96
    push ebx
    xor ecx, ecx
    xor ebx, ebx
    call loc_09b0
    call LINK_ADDRESS_33
    xor ah, ah
    mov byte [LINK_ADDRESS_34], ah
    mov dl, byte [LINK_ADDRESS_35]
    test dl, 1
    jne short loc_067c
    test dl, 2
    jne short loc_0670
    cmp byte [LINK_ADDRESS_34], 0
    je short loc_0677
loc_0670:
    mov esi, 0xffffffff
    jmp short loc_067c
loc_0677:
    mov esi, 0x64
loc_067c:
    mov eax, esi
    pop ebp
    pop edi
    pop esi
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8b, 0xc0    ; mov eax, eax
    push esi
    push edi
    push ebp
    sub esp, 0xc
    mov esi, dword [esp + 0x1c]
    mov edi, eax
    mov dword [esp], edx
    mov dword [esp + 4], ebx
    mov dword [esp + 8], ecx
    mov ecx, dword [esp]
    xor ebx, ebx
    sub ecx, 0xc
    xor edx, edx
    mov dword [esp], ecx
    cmp eax, 0xa0
    jne near loc_084b
loc_06bf:
    movsx eax, dx
    add eax, esi
    mov cl, byte [eax]
    test cl, cl
    je near loc_084b
    cmp cl, 0x20
    jne short loc_06d9
    add ebx, 5
    inc edx
    jmp short loc_06bf
loc_06d9:
    cmp cl, 0x30
    jb short loc_06f1
    cmp cl, 0x39
    ja short loc_06f1
    mov al, cl
    xor ah, ah
    add eax, 0x3c7
    jmp near loc_0839
loc_06f1:
    movsx eax, dx
    add eax, esi
    mov cl, byte [eax]
    cmp cl, 0x61
    jb short loc_0722
    cmp cl, 0x7a
    ja short loc_0722
    mov al, cl
    and eax, 0xff
    call TOUPPER
    add eax, 0x3c0
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    dec eax
    inc edx
    add ebx, eax
    jmp short loc_06bf
loc_0722:
    movsx eax, dx
    add eax, esi
    mov cl, byte [eax]
    cmp cl, 0x41
    jb short loc_074e
    cmp cl, 0x5a
    ja short loc_074e
    mov al, cl
    xor ah, ah
    add eax, 0x3c0
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    dec eax
    inc edx
    add ebx, eax
    jmp near loc_06bf
loc_074e:
    movsx eax, dx
    mov al, byte [esi + eax]
    cmp al, 0x2d
    jb short loc_078a
    jbe short loc_07aa
    cmp al, 0x3a
    jb short loc_077d
    jbe near loc_0834
    cmp al, 0x3b
    jbe near loc_0834
    cmp al, 0x3f
    je near loc_081d
    add ebx, 5
    inc edx
    jmp near loc_06bf
loc_077d:
    cmp al, 0x2e
    je short loc_07c1
    add ebx, 5
    inc edx
    jmp near loc_06bf
loc_078a:
    cmp al, 0x27
    jb short loc_079d
    jbe short loc_07d8
    cmp al, 0x2c
    je short loc_07ef
    add ebx, 5
    inc edx
    jmp near loc_06bf
loc_079d:
    cmp al, 0x21
    je short loc_0806
    add ebx, 5
    inc edx
    jmp near loc_06bf
loc_07aa:
    mov eax, 0x3f6
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    dec eax
    inc edx
    add ebx, eax
    jmp near loc_06bf
loc_07c1:
    mov eax, 0xbba
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    dec eax
    inc edx
    add ebx, eax
    jmp near loc_06bf
loc_07d8:
    mov eax, 0xbce
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    dec eax
    inc edx
    add ebx, eax
    jmp near loc_06bf
loc_07ef:
    mov eax, 0xbbb
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    dec eax
    inc edx
    add ebx, eax
    jmp near loc_06bf
loc_0806:
    mov eax, 0xbbc
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    dec eax
    inc edx
    add ebx, eax
    jmp near loc_06bf
loc_081d:
    mov eax, 0xbbd
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    dec eax
    inc edx
    add ebx, eax
    jmp near loc_06bf
loc_0834:
    mov eax, 0xbbe
loc_0839:
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    dec eax
    inc edx
    add ebx, eax
    jmp near loc_06bf
loc_084b:
    test bx, bx
    je short loc_085f
    mov edi, 0x140
    movsx eax, bx
    sub edi, eax
    sub edi, 0xa
    sar edi, 1
loc_085f:
    mov al, byte [esi]
    test al, al
    je near loc_099a
    cmp al, 0x20
    jne short loc_0873
    add edi, 5
    inc esi
    jmp short loc_085f
loc_0873:
    cmp al, 0x30
    jb short loc_0889
    cmp al, 0x39
    ja short loc_0889
    xor eax, eax
    mov al, byte [esi]
    add eax, 0x3c7
    jmp near loc_094c
loc_0889:
    mov bl, byte [esi]
    cmp bl, 0x61
    jb short loc_08a8
    cmp bl, 0x7a
    ja short loc_08a8
    xor eax, eax
    mov al, bl
    call TOUPPER
    add eax, 0x3c0
    jmp near loc_094c
loc_08a8:
    mov cl, byte [esi]
    cmp cl, 0x41
    jb short loc_08c2
    cmp cl, 0x5a
    ja short loc_08c2
    xor eax, eax
    mov al, cl
    add eax, 0x3c0
    jmp near loc_094c
loc_08c2:
    mov al, byte [esi]
    cmp al, 0x2d
    jb short loc_08f6
    jbe short loc_0916
    cmp al, 0x3a
    jb short loc_08e9
    jbe near loc_0947
    cmp al, 0x3b
    jbe near loc_0940
    cmp al, 0x3f
    je short loc_0939
    add edi, 5
    inc esi
    jmp near loc_085f
loc_08e9:
    cmp al, 0x2e
    je short loc_091d
    add edi, 5
    inc esi
    jmp near loc_085f
loc_08f6:
    cmp al, 0x27
    jb short loc_0909
    jbe short loc_0932
    cmp al, 0x2c
    je short loc_0924
    add edi, 5
    inc esi
    jmp near loc_085f
loc_0909:
    cmp al, 0x21
    je short loc_092b
    add edi, 5
    inc esi
    jmp near loc_085f
loc_0916:
    mov eax, 0x3f6
    jmp short loc_094c
loc_091d:
    mov eax, 0xbba
    jmp short loc_094c
loc_0924:
    mov eax, 0xbbb
    jmp short loc_094c
loc_092b:
    mov eax, 0xbbc
    jmp short loc_094c
loc_0932:
    mov eax, 0xbce
    jmp short loc_094c
loc_0939:
    mov eax, 0xbbd
    jmp short loc_094c
loc_0940:
    mov eax, 0xbbe
    jmp short loc_094c
loc_0947:
    mov eax, 0xbbf
loc_094c:
    mov edx, dword [YDIM]
    dec edx
    push edx
    mov edx, dword [XDIM]
    dec edx
    push edx
    push 0
    mov ebx, 0x10000
    push 0
    movsx ebp, ax
    push 0x1a
    movsx edx, word [esp + 0x1c]
    xor ecx, ecx
    push edx
    movsx edx, word [esp + 0x1c]
    mov eax, edi
    push edx
    shl eax, 0x10
    mov edx, dword [esp + 0x1c]
    push ebp
    shl edx, 0x10
    call LINK_ADDRESS_40
    movsx eax, word [nosplit ebp*2 + TILESIZX]
    inc esi
    add edi, eax
    jmp near loc_085f
loc_099a:
    mov eax, edi
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    ret 4
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
loc_09b0:
    push esi
    push edi
    push ebp
    sub esp, 0xc
    mov esi, dword [esp + 0x1c]
    mov edi, eax
    mov dword [esp], edx
    mov dword [esp + 4], ebx
    mov dword [esp + 8], ecx
    sub edx, 0xc
    xor ecx, ecx
    xor ebx, ebx
    mov dword [esp], edx
loc_09d1:
    movsx edx, bx
    add edx, esi
    mov ah, byte [edx]
    test ah, ah
    je near loc_0b63
    cmp ah, 0x20
    jne short loc_09e9
    inc ecx
    inc ebx
    jmp short loc_09d1
loc_09e9:
    xor eax, eax
    cmp byte [edx], 0x30
    jb short loc_0a00
    cmp byte [edx], 0x39
    ja short loc_0a00
    mov dl, byte [edx]
    xor dh, dh
    mov eax, edx
    add eax, 0x4ea
loc_0a00:
    movsx edx, bx
    add edx, esi
    cmp byte [edx], 0x41
    jb short loc_0a1f
    cmp byte [edx], 0x5a
    ja short loc_0a1f
    mov dl, byte [edx]
    xor dh, dh
    mov eax, edx
    add eax, 0x4bf
    jmp near loc_0b51
loc_0a1f:
    mov dl, byte [esi]
    cmp dl, 0x2d
    jb short loc_0a72
    jbe near loc_0b4c
    cmp dl, 0x3a
    jb short loc_0a5b
    jbe near loc_0b1e
    cmp dl, 0x3b
    jbe near loc_0b07
    cmp dl, 0x3f
    je near loc_0af0
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    inc eax
    inc ebx
    add ecx, eax
    jmp near loc_09d1
loc_0a5b:
    cmp dl, 0x2e
    je short loc_0aab
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    inc eax
    inc ebx
    add ecx, eax
    jmp near loc_09d1
loc_0a72:
    cmp dl, 0x24
    jb short loc_0a94
    jbe near loc_0b35
    cmp dl, 0x2c
    je short loc_0ac2
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    inc eax
    inc ebx
    add ecx, eax
    jmp near loc_09d1
loc_0a94:
    cmp dl, 0x21
    je short loc_0ad9
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    inc eax
    inc ebx
    add ecx, eax
    jmp near loc_09d1
loc_0aab:
    mov eax, 0xbba
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    inc eax
    inc ebx
    add ecx, eax
    jmp near loc_09d1
loc_0ac2:
    mov eax, 0xbbb
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    inc eax
    inc ebx
    add ecx, eax
    jmp near loc_09d1
loc_0ad9:
    mov eax, 0xbbc
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    inc eax
    inc ebx
    add ecx, eax
    jmp near loc_09d1
loc_0af0:
    mov eax, 0xbbd
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    inc eax
    inc ebx
    add ecx, eax
    jmp near loc_09d1
loc_0b07:
    mov eax, 0xbbe
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    inc eax
    inc ebx
    add ecx, eax
    jmp near loc_09d1
loc_0b1e:
    mov eax, LINK_ADDRESS_41
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    inc eax
    inc ebx
    add ecx, eax
    jmp near loc_09d1
loc_0b35:
    mov eax, 0x528
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    inc eax
    inc ebx
    add ecx, eax
    jmp near loc_09d1
loc_0b4c:
    mov eax, 0x49b
loc_0b51:
    cwde
    mov ax, word [nosplit eax*2 + TILESIZX]
    inc eax
    inc ebx
    add ecx, eax
    jmp near loc_09d1
loc_0b63:
    movsx eax, cx
    sar eax, 1
    sub edi, eax
loc_0b6a:
    mov ah, byte [esi]
    test ah, ah
    je near loc_099a
    cmp ah, 0x20
    jne short loc_0b7f
    add edi, 5
    inc esi
    jmp short loc_0b6a
loc_0b7f:
    mov dh, byte [esi]
    xor eax, eax
    cmp dh, 0x30
    jb short loc_0b94
    cmp dh, 0x39
    ja short loc_0b94
    mov al, dh
    add eax, 0x4ea
loc_0b94:
    mov bh, byte [esi]
    cmp bh, 0x41
    jb short loc_0ba9
    cmp bh, 0x5a
    ja short loc_0ba9
    xor eax, eax
    mov al, bh
    add eax, 0x4bf
loc_0ba9:
    mov dl, byte [esi]
    cmp dl, 0x2d
    jb short loc_0bd7
    jbe near loc_0c1d
    cmp dl, 0x3a
    jb short loc_0bd0
    jbe near loc_0c0f
    cmp dl, 0x3b
    jbe short loc_0c08
    cmp dl, 0x3f
    je short loc_0c01
    jmp near loc_0c22
loc_0bd0:
    cmp dl, 0x2e
    je short loc_0bec
    jmp short loc_0c22
loc_0bd7:
    cmp dl, 0x24
    jb short loc_0be5
    jbe short loc_0c16
    cmp dl, 0x2c
    je short loc_0bf3
    jmp short loc_0c22
loc_0be5:
    cmp dl, 0x21
    je short loc_0bfa
    jmp short loc_0c22
loc_0bec:
    mov eax, 0xbba
    jmp short loc_0c22
loc_0bf3:
    mov eax, 0xbbb
    jmp short loc_0c22
loc_0bfa:
    mov eax, 0xbbc
    jmp short loc_0c22
loc_0c01:
    mov eax, 0xbbd
    jmp short loc_0c22
loc_0c08:
    mov eax, 0xbbe
    jmp short loc_0c22
loc_0c0f:
    mov eax, LINK_ADDRESS_41
    jmp short loc_0c22
loc_0c16:
    mov eax, 0x528
    jmp short loc_0c22
loc_0c1d:
    mov eax, 0x49b
loc_0c22:
    mov edx, dword [YDIM]
    dec edx
    push edx
    mov edx, dword [XDIM]
    dec edx
    push edx
    push 0
    mov ebx, 0x10000
    push 0
    movsx ebp, ax
    push 0x1a
    movsx edx, word [esp + 0x1c]
    xor ecx, ecx
    push edx
    movsx edx, word [esp + 0x1c]
    mov eax, edi
    push edx
    shl eax, 0x10
    mov edx, dword [esp + 0x1c]
    push ebp
    shl edx, 0x10
    call LINK_ADDRESS_40
    movsx eax, word [nosplit ebp*2 + TILESIZX]
    inc eax
    inc esi
    add edi, eax
    jmp near loc_0b6a
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push esi
    push edi
    push ebp
    sub esp, 0xc
    mov edi, eax
    mov esi, edx
    test cx, cx
    jge short loc_0c99
    mov dl, 1
    neg ecx
    mov byte [esp + 8], dl
    jmp short loc_0c9f
loc_0c99:
    xor ah, ah
    mov byte [esp + 8], ah
loc_0c9f:
    mov dh, byte [esp + 0x1c]
    sub esi, 2
    test dh, dh
    je near loc_0de6
    cmp byte [esp + 8], 0
    jne near loc_0d59
    cmp byte [LINK_ADDRESS_42], 0
    jne short loc_0ce0
    cmp byte [LINK_ADDRESS_43], 0
    jne short loc_0ce0
    test byte [LINK_ADDRESS_35], 1
    je short loc_0d00
    cmp dword [LINK_ADDRESS_8], 0xffffff00
    jge short loc_0d00
loc_0ce0:
    xor dl, dl
    mov byte [LINK_ADDRESS_42], dl
    mov byte [LINK_ADDRESS_43], dl
    mov ax, word [ebx]
    sub eax, ecx
    mov word [ebx], ax
    test ax, ax
    jge short loc_0d00
    mov word [ebx], 0
loc_0d00:
    cmp byte [LINK_ADDRESS_44], 0
    jne short loc_0d2f
    cmp byte [LINK_ADDRESS_45], 0
    jne short loc_0d2f
    test byte [LINK_ADDRESS_35], 1
    je near loc_0de6
    cmp dword [LINK_ADDRESS_8], 0x100
    jle near loc_0de6
loc_0d2f:
    xor dh, dh
    mov byte [LINK_ADDRESS_44], dh
    mov byte [LINK_ADDRESS_45], dh
    mov ax, word [ebx]
    add eax, ecx
    mov word [ebx], ax
    db 0x66, 0x3d, 0x3f, 0x00    ; cmp ax, 0x3f
    jle near loc_0de6
    mov word [ebx], 0x3f
    jmp near loc_0de6
loc_0d59:
    cmp byte [LINK_ADDRESS_44], 0
    jne short loc_0d80
    cmp byte [LINK_ADDRESS_45], 0
    jne short loc_0d80
    test byte [LINK_ADDRESS_35], 1
    je short loc_0d9e
    cmp dword [LINK_ADDRESS_8], 0x100
    jle short loc_0d9e
loc_0d80:
    xor al, al
    mov byte [LINK_ADDRESS_44], al
    mov byte [LINK_ADDRESS_45], al
    mov dx, word [ebx]
    sub edx, ecx
    mov word [ebx], dx
    test dx, dx
    jge short loc_0d9e
    mov word [ebx], 0
loc_0d9e:
    cmp byte [LINK_ADDRESS_42], 0
    jne short loc_0dc5
    cmp byte [LINK_ADDRESS_43], 0
    jne short loc_0dc5
    test byte [LINK_ADDRESS_35], 1
    je short loc_0de6
    cmp dword [LINK_ADDRESS_8], 0xffffff00
    jge short loc_0de6
loc_0dc5:
    xor ah, ah
    mov byte [LINK_ADDRESS_42], ah
    mov byte [LINK_ADDRESS_43], ah
    mov dx, word [ebx]
    add edx, ecx
    mov word [ebx], dx
    cmp dx, 0x40
    jle short loc_0de6
    mov word [ebx], 0x40
loc_0de6:
    mov ax, word [ebx]
    mov dword [esp + 4], eax
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    movsx ebp, word [esp + 0x30]
    lea edx, [esi - 3]
    push 0
    xor ecx, ecx
    mov ebx, 0x10000
    push 0xa
    movsx eax, word [esp + 0x34]
    push ebp
    shl edx, 0x10
    push eax
    mov dword [esp + 0x1c], eax
    lea eax, [edi + 0x16]
    push 0x9b9
    shl eax, 0x10
    call LINK_ADDRESS_40
    mov cl, byte [esp + 8]
    mov ebx, dword [XDIM]
    mov eax, dword [YDIM]
    lea edx, [esi + 1]
    dec ebx
    dec eax
    shl edx, 0x10
    test cl, cl
    jne short loc_0e72
    push eax
    push ebx
    push 0
    push 0
    mov esi, dword [esp + 0x10]
    push 0xa
    movsx eax, word [esp + 0x18]
    push ebp
    xor ecx, ecx
    add edi, eax
    push esi
    mov ebx, 0x10000
    lea eax, [edi + 1]
    push 0x9ba
    shl eax, 0x10
    jmp short loc_0e9e
loc_0e72:
    push eax
    push ebx
    push 0
    push 0
    movsx eax, word [esp + 0x14]
    mov ebx, 0x41
    push 0xa
    sub ebx, eax
    push ebp
    mov ecx, dword [esp + 0x18]
    lea eax, [ebx + edi]
    push ecx
    mov ebx, 0x10000
    push 0x9ba
    shl eax, 0x10
    xor ecx, ecx
loc_0e9e:
    call LINK_ADDRESS_40
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    ret 0xc
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov edi, 0xe0
    xor esi, esi
    jmp short loc_0ef0
loc_0ebe:
    push eax
    push edx
    push 0
    mov ebx, 0x10000
    xor ecx, ecx
    push 0
    movsx eax, di
    push 0xa
    movsx edx, si
    push 0
    add eax, 0x1b
    add edx, 0x38
    push 0x18
    shl eax, 0x10
    push 0x9bf
    shl edx, 0x10
    add esi, 0xc
    call LINK_ADDRESS_40
loc_0ef0:
    mov edx, dword [XDIM]
    mov eax, dword [YDIM]
    dec edx
    dec eax
    cmp si, 0x6c
    jle short loc_0ebe
    push eax
    push edx
    push 0
    push 0
    push 0xa
    push 0
    push 0x18
    mov ebx, 0x10000
    xor ecx, ecx
    push 0x9c0
    mov eax, 0x160000
    mov edx, 0x610000
    call LINK_ADDRESS_40
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
    push 0x18
    mov ecx, 0x400
    mov ebx, 0x10000
    push 0x9c0
    mov edx, 0x610000
    mov eax, 0xb40000
    call LINK_ADDRESS_40
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
    push 0x18
    mov ecx, 0x200
    mov ebx, 0x10000
    push 0x9be
    mov edx, 0x320000
    mov eax, 0x630000
    call LINK_ADDRESS_40
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
    mov ecx, 0x600
    mov ebx, 0x10000
    push 0x18
    mov edx, 0x900000
    mov eax, 0x670000
    push 0x9be
    movsx esi, di
    call LINK_ADDRESS_40
    push 0x1a
    mov ecx, 2
    mov ebx, LINK_ADDRESS_46
    mov edx, 0x30
    mov eax, esi
    call 0x105c0
    push 0x1a
    mov ecx, 2
    mov ebx, LINK_ADDRESS_47
    mov edx, 0x3c
    mov eax, esi
    call 0x105c0
    push 0x1a
    mov ecx, 2
    mov ebx, LINK_ADDRESS_48
    mov edx, 0x48
    mov eax, esi
    call 0x105c0
    push 0x1a
    mov ecx, 2
    mov ebx, LINK_ADDRESS_49
    mov edx, 0x54
    mov eax, esi
    call 0x105c0
    push 0x1a
    mov ecx, 2
    mov ebx, LINK_ADDRESS_50
    mov edx, 0x60
    mov eax, esi
    call 0x105c0
    push 0x1a
    mov ecx, 2
    mov ebx, LINK_ADDRESS_51
    mov edx, 0x6c
    mov eax, esi
    call 0x105c0
    push 0x1a
    mov ecx, 2
    mov ebx, LINK_ADDRESS_52
    mov edx, 0x78
    mov eax, esi
    call 0x105c0
    push 0x1a
    mov ecx, 2
    mov ebx, LINK_ADDRESS_53
    mov edx, 0x84
    mov eax, esi
    call 0x105c0
    push 0x1a
    mov ecx, 2
    mov ebx, LINK_ADDRESS_54
    mov edx, 0x90
    mov eax, esi
    call 0x105c0
    push 0x1a
    mov ecx, 2
    mov ebx, LINK_ADDRESS_55
    mov edx, 0x9c
    mov eax, esi
    call 0x105c0
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
    push ebx
    push ecx
    push edx
    sub esp, 0x120
    mov ecx, eax
    mov edx, LINK_ADDRESS_56
    call STRCMP
    test eax, eax
    jne short loc_1118
    mov edx, LINK_ADDRESS_58
    mov eax, ecx
    mov ebx, esp
    call STRCPY
    mov edx, 0x10
    mov eax, ecx
    call LINK_ADDRESS_60
    test eax, eax
    je short loc_1111
    mov eax, 0xffffffff
    jmp near loc_119d
loc_1111:
    mov ebx, 1
    jmp short loc_1138
loc_1118:
    mov ebx, esp
    mov eax, ecx
    xor edx, edx
    call LINK_ADDRESS_60
    test eax, eax
    je short loc_1136
    mov eax, 0xffffffff
    add esp, 0x120
    pop edx
    pop ecx
    pop ebx
    ret
loc_1136:
    xor ebx, ebx
loc_1138:
    test bx, bx
    je short loc_1147
    mov al, byte [esp + 0x15]
    and al, 0x10
    test al, al
    jbe short loc_1190
loc_1147:
    cmp byte [esp + 0x1e], 0x2e
    jne short loc_1155
    cmp byte [esp + 0x1f], 0
    je short loc_1190
loc_1155:
    xor edx, edx
    mov dl, byte [LINK_ADDRESS_61]
    mov eax, edx
    shl eax, 4
    add eax, edx
    lea edx, [esp + 0x1e]
    add eax, LINK_ADDRESS_62
    call STRCPY
    xor edx, edx
    mov dl, byte [LINK_ADDRESS_61]
    mov eax, edx
    shl eax, 4
    mov byte [edx + eax + LINK_ADDRESS_63], bl
    mov dh, dl
    inc dh
    mov byte [LINK_ADDRESS_61], dh
loc_1190:
    mov eax, esp
    call LINK_ADDRESS_64
    test eax, eax
    je short loc_1138
    xor eax, eax
loc_119d:
    add esp, 0x120
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x14
    mov edi, 1
    jmp near loc_125f
loc_11c3:
    xor esi, esi
    jmp near loc_1256
loc_11ca:
    xor edx, edx
loc_11cc:
    mov eax, edi
    shl eax, 4
    add eax, edi
    lea ecx, [eax + edx]
    mov eax, esi
    shl eax, 4
    add eax, esi
    add eax, edx
    mov bl, byte [ecx + LINK_ADDRESS_62]
    mov bh, byte [eax + LINK_ADDRESS_62]
    cmp bl, bh
    jne short loc_11ff
    cmp byte [ecx + LINK_ADDRESS_62], 0
    je short loc_11ff
    test bh, bh
    je short loc_11ff
    inc edx
    jmp short loc_11cc
loc_11ff:
    mov ebp, edi
    shl ebp, 4
    mov ecx, esi
    add ebp, edi
    shl ecx, 4
    lea eax, [edx + ebp]
    add ecx, esi
    mov al, byte [eax + LINK_ADDRESS_62]
    cmp al, byte [ecx + edx + LINK_ADDRESS_62]
    jae short loc_1255
    mov ebx, 0x11
    add ebp, LINK_ADDRESS_62
    mov eax, esp
    mov edx, ebp
    add ecx, LINK_ADDRESS_62
    call MEMCPY
    mov ebx, 0x11
    mov edx, ecx
    mov eax, ebp
    call MEMCPY
    mov ebx, 0x11
    mov edx, esp
    mov eax, ecx
    call MEMCPY
loc_1255:
    inc esi
loc_1256:
    cmp esi, edi
    jl near loc_11ca
    inc edi
loc_125f:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_61]
    cmp edi, eax
    jl near loc_11c3
    add esp, 0x14
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
