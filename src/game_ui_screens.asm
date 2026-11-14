; Game interface screens and menu actions.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 0x10
    call 0x10800
    cmp dword [LINK_ADDRESS_1], 1
    jne short loc_0069
    cmp dword [CONTROL_MOUSEPRESENT], 0
    je short loc_0069
    cmp word [LINK_ADDRESS_3], 0
    je short loc_005c
    mov cx, word [LINK_ADDRESS_4]
    test cx, cx
    jne short loc_005c
    call MOUSE_GETBUTTONS
    shl eax, 3
    mov dword [ebp - 8], eax
    test ax, ax
    je short loc_0053
    shl eax, 3
    mov word [LINK_ADDRESS_3], ax
    jmp short loc_0072
loc_0053:
    mov word [LINK_ADDRESS_3], cx
    jmp short loc_0072
loc_005c:
    call MOUSE_GETBUTTONS
    mov word [LINK_ADDRESS_3], ax
    jmp short loc_0072
loc_0069:
    xor edx, edx
    mov word [LINK_ADDRESS_3], dx
loc_0072:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov dl, byte [eax + LINK_ADDRESS_7]
    test dl, 1
    jne short loc_00a2
    mov byte [LINK_ADDRESS_8], 1
%if GAME_UPDATE
    jmp near loc_43ae
%else
    jmp near loc_41f1
%endif
loc_00a2:
    mov dh, dl
    and dh, 0xef
    mov byte [eax + LINK_ADDRESS_7], dh
    xor edx, edx
    mov dword [ebp - 8], edx
    mov word [eax + LINK_ADDRESS_9], dx
    mov eax, dword [TOTALCLOCK]
    shl eax, 4
    and eax, 0x7ff
    movsx eax, word [nosplit eax*2 + SINTABLE]
    mov edx, 4
    sar eax, 0xb
    sub edx, eax
    mov ecx, dword [LINK_ADDRESS_12]
    mov word [LINK_ADDRESS_13], dx
    cmp ecx, 0x3e8
    jl short loc_0105
    cmp ecx, 0xbb7
    jg short loc_0105
    cmp ecx, 0x12c
    jl short loc_0105
    cmp ecx, 0x171
    jle short loc_010a
loc_0105:
    call LINK_ADDRESS_14
loc_010a:
%if GAME_UPDATE
    mov eax, dword [0x121ea8]
    cmp eax, 0x15f
    jb near loc_0256
    jbe near loc_2ac9
    cmp eax, 0x25a
    jb near loc_01df
    jbe near loc_3849
    cmp eax, 0x5dc
    jb short loc_0191
    jbe near loc_092c
    cmp eax, 0x2710
    jb short loc_0176
    cmp eax, 0x2711
    jbe near loc_057e
    cmp eax, 0x3a98
    jb near loc_4370
    cmp eax, 0x3a99
    jbe near loc_03d8
    cmp eax, 0x61a8
    je near loc_0343
    jmp near loc_4370
loc_0176:
    cmp eax, 0x7d0
    jb near loc_4370
    cmp eax, 0x7d9
    jbe near loc_0a29
    jmp near loc_4370
loc_0191:
    cmp eax, 0x2bc
    jb short loc_01cf
    jbe near loc_235a
    cmp eax, 0x3de
    jb near loc_4370
    cmp eax, 0x3e5
    jbe near loc_0c3e
    cmp eax, 0x3e8
    jb near loc_4370
    cmp eax, 0x3f1
    jbe near loc_057e
    jmp near loc_4370
loc_01cf:
    cmp eax, 0x25b
    je near loc_3874
    jmp near loc_4370
loc_01df:
    cmp eax, 0x1f3
    jb short loc_0213
    jbe near loc_34d6
    cmp eax, 0x1f5
    jb near loc_356a
    jbe near loc_364d
    cmp eax, 0x258
    jb near loc_4370
    jbe near loc_3c4e
    jmp near loc_3776
loc_0213:
    cmp eax, 0x190
    jb short loc_023b
    cmp eax, 0x191
    jbe near loc_3199
    cmp eax, 0x1f1
    jb near loc_4370
    jbe near loc_3385
    jmp near loc_3433
loc_023b:
    cmp eax, 0x168
    jb near loc_4370
    cmp eax, 0x171
    jbe near loc_2ac9
    jmp near loc_4370
loc_0256:
    cmp eax, 0x97
    jb near loc_02e4
    jbe near loc_14da
    cmp eax, 0xc8
    jb short loc_02b2
    jbe near loc_1db3
    cmp eax, 0x12c
    jb short loc_02a2
    jbe near loc_2ac9
    cmp eax, 0x12f
    jb near loc_4370
    jbe near loc_2af0
%else
    mov edx, dword [0xe54a8]
    test edx, edx
    jle short loc_0165
    cmp edx, 0x1f4
    je short loc_0165
    push 0x2888
    mov edx, 0xd
    mov eax, 0x9b
    xor ecx, ecx
    xor ebx, ebx
    call 0x41930
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ecx, ecx
    db 0x8b, 0x1c, 0x45, 0x8c, 0x51, 0x0b, 0x00    ; mov ebx, dword [eax*2 + 0xb518c]
    mov edx, 0xd
    mov eax, 0x64
    mov ebx, dword [ebx]
    call 0x40e60
loc_0165:
    mov eax, dword [0xe54a8]
%endif
    cmp eax, 0x15e
%if GAME_UPDATE
    je near loc_2a84
    jmp near loc_4370
loc_02a2:
    cmp eax, 0xc9
    je near loc_1e13
    jmp near loc_4370
loc_02b2:
    cmp eax, 0x99
    jb near loc_15ed
    jbe near loc_1700
    cmp eax, 0xa0
    jb near loc_4370
    jbe near loc_1813
%else
    jb near loc_02a0
    jbe near loc_2abb
    cmp eax, 0x25b
    jb near loc_0229
    jbe near loc_36b8
    cmp eax, 0x5dc
    jb short loc_01ec
    jbe near loc_0962
    cmp eax, 0x2710
    jb short loc_01d1
    cmp eax, 0x2711
    jbe near loc_05b3
    cmp eax, 0x3a98
    jb near loc_41b3
    cmp eax, 0x3a99
    jbe near loc_040d
    cmp eax, 0x61a8
    je near loc_0378
    jmp near loc_41b3
loc_01d1:
    cmp eax, 0x7d0
    jb near loc_41b3
    cmp eax, 0x7d9
    jbe near loc_0a5f
    jmp near loc_41b3
loc_01ec:
    cmp eax, 0x3de
    jb short loc_0219
    cmp eax, 0x3e5
    jbe near loc_0c75
    cmp eax, 0x3e8
    jb near loc_41b3
    cmp eax, 0x3f1
    jbe near loc_05b3
    jmp near loc_41b3
loc_0219:
    cmp eax, 0x2bc
    je near loc_238f
    jmp near loc_41b3
loc_0229:
    cmp eax, 0x1f4
    jb short loc_0263
    jbe near loc_33ae
    cmp eax, 0x258
    jb short loc_0253
    jbe near loc_3a92
    cmp eax, 0x259
    jbe near loc_35ba
    jmp near loc_368d
loc_0253:
    cmp eax, 0x1f5
    je near loc_3491
    jmp near loc_41b3
loc_0263:
    cmp eax, 0x168
    jb short loc_0290
    cmp eax, 0x171
    jbe near loc_2b00
    cmp eax, 0x190
    jb near loc_41b3
    cmp eax, 0x191
    jbe near loc_31c2
    jmp near loc_41b3
loc_0290:
    cmp eax, 0x15f
    je near loc_2b00
    jmp near loc_41b3
loc_02a0:
    cmp eax, 0x97
    jb short loc_0319
    jbe near loc_1511
%endif
    cmp eax, 0xaa
%if GAME_UPDATE
    je near loc_1aff
    jmp near loc_4370
loc_02e4:
%else
    jb short loc_02f8
    jbe near loc_1b35
    cmp eax, 0xc9
    jb short loc_02e8
    jbe near loc_1e48
    cmp eax, 0x12c
    jb near loc_41b3
    jbe near loc_2b00
    cmp eax, 0x12f
    je near loc_2b27
    jmp near loc_41b3
loc_02e8:
    cmp eax, 0xc8
    je near loc_1de8
    jmp near loc_41b3
loc_02f8:
    cmp eax, 0x99
    jb near loc_1624
    jbe near loc_1737
    cmp eax, 0xa0
    je near loc_184a
    jmp near loc_41b3
loc_0319:
%endif
    cmp eax, 0x65
%if GAME_UPDATE
    jb short loc_031d
%else
    jb short loc_0352
%endif
%if GAME_UPDATE
    jbe near loc_11ce
%else
    jbe near loc_1205
%endif
    cmp eax, 0x67
%if GAME_UPDATE
    jb near loc_11eb
%else
    jb near loc_1222
%endif
%if GAME_UPDATE
    jbe near loc_12c5
%else
    jbe near loc_12fc
%endif
    cmp eax, 0x6e
%if GAME_UPDATE
    jb near loc_4370
%else
    jb near loc_41b3
%endif
%if GAME_UPDATE
    jbe near loc_1340
%else
    jbe near loc_1377
%endif
    cmp eax, 0x96
%if GAME_UPDATE
    je near loc_13d2
%else
    je near loc_1409
%endif
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_031d:
%else
loc_0352:
%endif
    cmp eax, 0x32
%if GAME_UPDATE
    jb short loc_0336
%else
    jb short loc_036b
%endif
%if GAME_UPDATE
    jbe near loc_0e64
%else
    jbe near loc_0e9b
%endif
    cmp eax, 0x64
%if GAME_UPDATE
    je near loc_1164
%else
    je near loc_119b
%endif
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_0336:
%else
loc_036b:
%endif
    test eax, eax
%if GAME_UPDATE
    je near loc_0d7d
%else
    je near loc_0db4
%endif
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_0343:
%else
loc_0378:
%endif
    push 0x1a
    mov ebx, LINK_ADDRESS_15
    mov edx, 0x5a
    mov eax, 0xa0
    xor ecx, ecx
    call 0x10240
    push 0x1a
    mov ebx, LINK_ADDRESS_16
    mov edx, 0x63
    mov eax, 0xa0
    xor ecx, ecx
    call 0x10240
    mov edx, 0x7c
    mov eax, 0xba
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_17
    cwde
    cmp eax, -1
%if GAME_UPDATE
    jl near loc_4370
%else
    jl near loc_41b3
%endif
    cmp dword [LINK_ADDRESS_18], 2
%if GAME_UPDATE
    jge short loc_03b4
%else
    jge short loc_03e9
%endif
    cmp dword [LINK_ADDRESS_19], 2
%if GAME_UPDATE
    je short loc_03b4
%else
    je short loc_03e9
%endif
    mov bl, 1
    mov eax, dword [LINK_ADDRESS_20]
    mov byte [LINK_ADDRESS_21], bl
    mov dword [TOTALCLOCK], eax
%if GAME_UPDATE
loc_03b4:
%else
loc_03e9:
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    and byte [nosplit eax*2 + LINK_ADDRESS_7], 0xfe
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_03d8:
%else
loc_040d:
%endif
    push 0x1a
    mov ebx, LINK_ADDRESS_22
    mov edx, 0x5a
    mov eax, 0xa0
    xor ecx, ecx
    call 0x10240
    movsx eax, word [LINK_ADDRESS_23]
    imul eax, eax, 0x16
    add eax, LINK_ADDRESS_24
    push eax
    push LINK_ADDRESS_25
    push LINK_ADDRESS_26
    call SPRINTF
    add esp, 0xc
    mov ebx, LINK_ADDRESS_26
    mov edx, 0x63
    push 0x1a
    xor ecx, ecx
    mov eax, 0xa0
    call 0x10240
    push 0x1a
    mov ebx, LINK_ADDRESS_28
    mov edx, 0x6c
    mov eax, 0xa0
    xor ecx, ecx
    call 0x10240
    cmp byte [LINK_ADDRESS_29], 0
%if GAME_UPDATE
    jne short loc_0461
%else
    jne short loc_0496
%endif
    cmp byte [LINK_ADDRESS_30], 0
%if GAME_UPDATE
    jne short loc_0461
%else
    jne short loc_0496
%endif
    test byte [LINK_ADDRESS_3], 2
%if GAME_UPDATE
    je near loc_04e4
%else
    je near loc_0519
%endif
%if GAME_UPDATE
loc_0461:
%else
loc_0496:
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    movsx edx, word [eax + LINK_ADDRESS_31]
    imul edx, edx, 0x2c
    cmp word [edx + LINK_ADDRESS_32], 0
%if GAME_UPDATE
    jg short loc_04a1
%else
    jg short loc_04d6
%endif
    mov eax, 4
    call LINK_ADDRESS_33
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
%if GAME_UPDATE
loc_04a1:
%else
loc_04d6:
%endif
    xor dl, dl
    mov byte [LINK_ADDRESS_30], dl
    mov byte [LINK_ADDRESS_29], dl
    mov bl, byte [eax + LINK_ADDRESS_7]
    and bl, 0xfe
%if GAME_UPDATE
    mov ecx, dword [0x1261df]
%else
    mov edi, dword [0xe97df]
%endif
    mov byte [eax + LINK_ADDRESS_7], bl
%if GAME_UPDATE
    cmp ecx, 2
%else
    cmp edi, 2
%endif
%if GAME_UPDATE
    jge short loc_04e4
%else
    jge short loc_0519
%endif
    cmp dword [LINK_ADDRESS_19], 2
%if GAME_UPDATE
    je short loc_04e4
%else
    je short loc_0519
%endif
    mov bh, 1
    mov eax, dword [LINK_ADDRESS_20]
    mov byte [LINK_ADDRESS_21], bh
    mov dword [TOTALCLOCK], eax
%if GAME_UPDATE
loc_04e4:
%else
loc_0519:
%endif
    cmp byte [LINK_ADDRESS_34], 0
%if GAME_UPDATE
    jne short loc_0511
%else
    jne short loc_0546
%endif
    cmp byte [LINK_ADDRESS_35], 0
%if GAME_UPDATE
    jne short loc_0511
%else
    jne short loc_0546
%endif
    cmp byte [LINK_ADDRESS_36], 0
%if GAME_UPDATE
    jne short loc_0511
%else
    jne short loc_0546
%endif
    cmp byte [LINK_ADDRESS_37], 0
%if GAME_UPDATE
    jne short loc_0511
%else
    jne short loc_0546
%endif
    test byte [LINK_ADDRESS_3], 1
%if GAME_UPDATE
    je short loc_0566
%else
    je short loc_059b
%endif
%if GAME_UPDATE
loc_0511:
%else
loc_0546:
%endif
    call LINK_ADDRESS_38
    call LINK_ADDRESS_39
    cmp dword [LINK_ADDRESS_18], 1
%if GAME_UPDATE
    jle short loc_0536
%else
    jle short loc_056b
%endif
    mov al, 0xff
    sub al, byte [LINK_ADDRESS_23]
    movsx eax, al
    call LINK_ADDRESS_40
%if GAME_UPDATE
    jmp short loc_0547
%else
    jmp short loc_057c
%endif
%if GAME_UPDATE
loc_0536:
%else
loc_056b:
%endif
    movsx eax, byte [LINK_ADDRESS_23]
    call LINK_ADDRESS_40
    test ax, ax
%if GAME_UPDATE
    jne short loc_0566
%else
    jne short loc_059b
%endif
%if GAME_UPDATE
loc_0547:
%else
loc_057c:
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov byte [nosplit eax*2 + LINK_ADDRESS_7], 4
%if GAME_UPDATE
loc_0566:
%else
loc_059b:
%endif
    mov edx, 0x85
    mov eax, 0xba
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_17
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_057e:
%else
loc_05b3:
%endif
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x4a
    push 0
    push 0x10
    mov ebx, 0x10000
    mov edx, 0x640000
    push 0x998
    xor ecx, ecx
    mov eax, 0xa00000
    call LINK_ADDRESS_43
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
    push 0x10
    mov ebx, 0x10000
    mov edx, 0x130000
    push 0x999
    xor ecx, ecx
    mov eax, 0xa00000
    call LINK_ADDRESS_43
    push LINK_ADDRESS_44
    mov edx, 0x18
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_45
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x4e
    push 0
    push -0x20
    mov ecx, 0x200
    mov ebx, 0x10000
    push 0x17fd
    mov edx, 0x610000
    mov eax, 0x650000
    call LINK_ADDRESS_43
    call LINK_ADDRESS_46
%if GAME_UPDATE
    mov esi, dword [0x13bdb8]
%else
    mov eax, dword [0xf31d8]
%endif
%if GAME_UPDATE
    push esi
%else
    push eax
%endif
    push LINK_ADDRESS_47
    push LINK_ADDRESS_26
    call SPRINTF
    add esp, 0xc
    mov ebx, LINK_ADDRESS_26
    mov edx, 0x9e
    push 0x1a
    xor ecx, ecx
    mov eax, 0xa0
    call 0x10240
%if GAME_UPDATE
    mov edi, dword [0x13bdc4]
%else
    mov edx, dword [0xf31e0]
%endif
    mov eax, dword [LINK_ADDRESS_48]
%if GAME_UPDATE
    push edi
%else
    push edx
%endif
    inc eax
    push eax
    mov eax, dword [LINK_ADDRESS_49]
    inc eax
    push eax
    push LINK_ADDRESS_50
    push LINK_ADDRESS_26
    call SPRINTF
    add esp, 0x14
%if GAME_UPDATE
    mov ebx, 0xf88c0
    mov edx, 0xaa
    push 0x1a
%else
    mov ebx, 0xbc0a0
%endif
    xor ecx, ecx
%if GAME_UPDATE
%else
    push 0x1a
    mov edx, 0xaa
%endif
    mov eax, 0xa0
    call 0x10240
    push 0x1a
    mov ebx, LINK_ADDRESS_51
    mov edx, 0x5a
    mov eax, 0xa0
    xor ecx, ecx
    call 0x10240
    mov eax, dword [LINK_ADDRESS_12]
    sub eax, 0x3e8
    imul eax, eax, 0x16
    add eax, LINK_ADDRESS_24
    push eax
    push LINK_ADDRESS_25
    push LINK_ADDRESS_26
    call SPRINTF
    add esp, 0xc
    mov ebx, LINK_ADDRESS_26
    mov edx, 0x63
    push 0x1a
    xor ecx, ecx
    mov eax, 0xa0
    call 0x10240
    push 0x1a
    mov ebx, LINK_ADDRESS_28
    mov edx, 0x6c
    mov eax, 0xa0
    xor ecx, ecx
    call 0x10240
    cmp byte [LINK_ADDRESS_34], 0
%if GAME_UPDATE
    jne short loc_0745
%else
    jne short loc_0779
%endif
    cmp byte [LINK_ADDRESS_35], 0
%if GAME_UPDATE
    jne short loc_0745
%else
    jne short loc_0779
%endif
    cmp byte [LINK_ADDRESS_36], 0
%if GAME_UPDATE
    jne short loc_0745
%else
    jne short loc_0779
%endif
    cmp byte [LINK_ADDRESS_37], 0
%if GAME_UPDATE
    jne short loc_0745
%else
    jne short loc_0779
%endif
    mov al, byte [LINK_ADDRESS_3]
    test al, 1
%if GAME_UPDATE
    je near loc_0884
%else
    je near loc_08b8
%endif
%if GAME_UPDATE
loc_0745:
%else
loc_0779:
%endif
    mov ax, word [LINK_ADDRESS_12]
    db 0x81, 0xe8, 0xe8, 0x03, 0x00, 0x00    ; sub eax, 0x3e8
    mov word [LINK_ADDRESS_23], ax
    call LINK_ADDRESS_38
    cmp dword [LINK_ADDRESS_18], 2
%if GAME_UPDATE
    jge short loc_077f
%else
    jge short loc_07b3
%endif
    cmp dword [LINK_ADDRESS_19], 2
%if GAME_UPDATE
    je short loc_077f
%else
    je short loc_07b3
%endif
    mov byte [LINK_ADDRESS_21], 1
    mov eax, dword [LINK_ADDRESS_20]
    mov dword [TOTALCLOCK], eax
%if GAME_UPDATE
loc_077f:
%else
loc_07b3:
%endif
    cmp dword [LINK_ADDRESS_18], 1
%if GAME_UPDATE
    jle near loc_084b
%else
    jle near loc_087f
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    test byte [nosplit eax*2 + LINK_ADDRESS_7], 4
%if GAME_UPDATE
    je short loc_07e1
%else
    je short loc_0815
%endif
    mov al, 0xff
    sub al, byte [LINK_ADDRESS_23]
    movsx eax, al
    call LINK_ADDRESS_40
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov byte [nosplit eax*2 + LINK_ADDRESS_7], 4
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_07e1:
%else
loc_0815:
%endif
    mov al, byte [LINK_ADDRESS_23]
    mov bl, 0x7e
    mov byte [LINK_ADDRESS_52], al
    mov ax, word [CONNECTHEAD]
    mov byte [LINK_ADDRESS_26], bl
%if GAME_UPDATE
    jmp short loc_0822
%else
    jmp short loc_0856
%endif
%if GAME_UPDATE
loc_07fb:
%else
loc_082f:
%endif
    cmp cx, word [MYCONNECTINDEX]
%if GAME_UPDATE
    je short loc_0816
%else
    je short loc_084a
%endif
    mov ebx, 2
    mov edx, LINK_ADDRESS_26
    movsx eax, cx
    call SENDPACKET
%if GAME_UPDATE
loc_0816:
%else
loc_084a:
%endif
    movsx eax, word [ebp - 8]
    mov ax, word [nosplit eax*2 + CONNECTPOINT2]
%if GAME_UPDATE
loc_0822:
%else
loc_0856:
%endif
    mov dword [ebp - 8], eax
    mov ecx, dword [ebp - 8]
    test cx, cx
%if GAME_UPDATE
    jge short loc_07fb
%else
    jge short loc_082f
%endif
    call 0x10800
    movsx eax, byte [LINK_ADDRESS_23]
    call LINK_ADDRESS_40
    xor ah, ah
    mov byte [LINK_ADDRESS_56], ah
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_084b:
%else
loc_087f:
%endif
    movsx eax, byte [LINK_ADDRESS_23]
    call LINK_ADDRESS_40
    test ax, ax
%if GAME_UPDATE
    jne near loc_4370
%else
    jne near loc_41b3
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov byte [nosplit eax*2 + LINK_ADDRESS_7], 4
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_0884:
%else
loc_08b8:
%endif
    cmp byte [LINK_ADDRESS_30], 0
%if GAME_UPDATE
    jne short loc_089e
%else
    jne short loc_08d2
%endif
    cmp byte [LINK_ADDRESS_29], 0
%if GAME_UPDATE
    jne short loc_089e
%else
    jne short loc_08d2
%endif
    test al, 2
%if GAME_UPDATE
    je near loc_0914
%else
    je near loc_094a
%endif
%if GAME_UPDATE
loc_089e:
%else
loc_08d2:
%endif
    xor bl, bl
    mov byte [LINK_ADDRESS_30], bl
    mov byte [LINK_ADDRESS_29], bl
    mov eax, 0xf3
    call LINK_ADDRESS_57
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov cl, byte [eax + LINK_ADDRESS_7]
    test cl, 2
%if GAME_UPDATE
    je short loc_08e6
%else
    je short loc_091a
%endif
    mov eax, 0x12c
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp short loc_0914
%else
    jmp short loc_094a
%endif
%if GAME_UPDATE
loc_08e6:
%else
loc_091a:
%endif
    mov ch, cl
    and ch, 0xfe
%if GAME_UPDATE
    mov byte [eax + 0xf1ac2], ch
    cmp dword [0x1261df], 2
    jge short loc_0914
    cmp dword [0x1261a7], 2
    je short loc_0914
    mov byte [0x12623a], 1
    mov eax, dword [0x121eac]
    mov dword [0x2d6bbc], eax
loc_0914:
%else
    mov ebx, dword [0xe97df]
    mov byte [eax + 0xb52a2], ch
    cmp ebx, 2
    jge short loc_094a
    cmp dword [0xe97a7], 2
    je short loc_094a
    mov byte [0xe983a], 1
    mov eax, dword [0xe54ac]
    mov dword [0x2454ac], eax
loc_094a:
%endif
    mov edx, 0x85
    mov eax, 0xba
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_17
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_092c:
%else
loc_0962:
%endif
    cmp byte [LINK_ADDRESS_34], 0
%if GAME_UPDATE
    jne short loc_0959
%else
    jne short loc_098f
%endif
    cmp byte [LINK_ADDRESS_35], 0
%if GAME_UPDATE
    jne short loc_0959
%else
    jne short loc_098f
%endif
    cmp byte [LINK_ADDRESS_36], 0
%if GAME_UPDATE
    jne short loc_0959
%else
    jne short loc_098f
%endif
    cmp byte [LINK_ADDRESS_37], 0
%if GAME_UPDATE
    jne short loc_0959
%else
    jne short loc_098f
%endif
    test byte [LINK_ADDRESS_3], 1
%if GAME_UPDATE
    je short loc_0968
%else
    je short loc_099e
%endif
%if GAME_UPDATE
loc_0959:
%else
loc_098f:
%endif
    call LINK_ADDRESS_38
    mov eax, 0x64
    call LINK_ADDRESS_58
%if GAME_UPDATE
loc_0968:
%else
loc_099e:
%endif
    cmp byte [LINK_ADDRESS_30], 0
%if GAME_UPDATE
    jne short loc_0983
%else
    jne short loc_09b9
%endif
    cmp byte [LINK_ADDRESS_29], 0
%if GAME_UPDATE
    jne short loc_0983
%else
    jne short loc_09b9
%endif
    test byte [LINK_ADDRESS_3], 2
%if GAME_UPDATE
    je short loc_09e1
%else
    je short loc_0a17
%endif
%if GAME_UPDATE
loc_0983:
%else
loc_09b9:
%endif
    xor al, al
    mov byte [LINK_ADDRESS_30], al
    mov byte [LINK_ADDRESS_29], al
    cmp dword [LINK_ADDRESS_18], 2
%if GAME_UPDATE
    jge short loc_09b3
%else
    jge short loc_09e9
%endif
    cmp dword [LINK_ADDRESS_19], 2
%if GAME_UPDATE
    je short loc_09b3
%else
    je short loc_09e9
%endif
    mov dl, 1
    mov eax, dword [LINK_ADDRESS_20]
    mov byte [LINK_ADDRESS_21], dl
    mov dword [TOTALCLOCK], eax
%if GAME_UPDATE
loc_09b3:
%else
loc_09e9:
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    and byte [nosplit eax*2 + LINK_ADDRESS_7], 0xfe
    mov eax, 0xf3
    call LINK_ADDRESS_57
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_09e1:
%else
loc_0a17:
%endif
    mov edx, 0x7c
    mov eax, 0xba
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_17
    push 0x1a
    mov ebx, LINK_ADDRESS_59
    mov edx, 0x5a
    mov eax, 0xa0
    xor ecx, ecx
    call 0x10240
    push 0x1a
    mov ebx, LINK_ADDRESS_28
    mov edx, 0x63
    mov eax, 0xa0
    xor ecx, ecx
    call 0x10240
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_0a29:
%else
loc_0a5f:
%endif
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x4a
    push 0
    push 0x10
    mov ebx, 0x10000
    mov edx, 0x640000
    push 0x998
    xor ecx, ecx
    mov eax, 0xa00000
    call LINK_ADDRESS_43
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
    push 0x10
    mov ebx, 0x10000
    mov edx, 0x130000
    push 0x999
    xor ecx, ecx
    mov eax, 0xa00000
    call LINK_ADDRESS_43
    push LINK_ADDRESS_60
    mov edx, 0x18
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_45
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x4e
    push 0
    push -0x20
    mov ecx, 0x200
    mov ebx, 0x10000
    push 0x17fd
    mov edx, 0x610000
    mov eax, 0x650000
    call LINK_ADDRESS_43
%if GAME_UPDATE
    mov eax, dword [0x1261df]
%else
    mov ebx, dword [0xe97df]
%endif
%if GAME_UPDATE
    push eax
%else
    push ebx
%endif
    push LINK_ADDRESS_61
    push LINK_ADDRESS_26
    call SPRINTF
    add esp, 0xc
%if GAME_UPDATE
    mov ebx, 0xf88c0
%else
%endif
    mov edx, 0x9e
%if GAME_UPDATE
%else
    xor ecx, ecx
    push 0x1a
    mov ebx, 0xbc0a0
    mov eax, 0xa0
    call 0x10240
    mov ecx, dword [0xe97e3]
    mov eax, dword [0xe97e7]
    push ecx
    inc eax
    push eax
    mov eax, dword [0xe97eb]
    inc eax
    push eax
    push 0x2990
    push 0xbc0a0
    call 0xa27b9
    add esp, 0x14
    mov ebx, 0xbc0a0
    mov edx, 0xaa
%endif
    push 0x1a
    xor ecx, ecx
    mov eax, 0xa0
    call 0x10240
%if GAME_UPDATE
    mov edx, dword [0x1261e3]
    mov eax, dword [0x1261e7]
    push edx
    inc eax
    push eax
    mov eax, dword [0x1261eb]
    inc eax
    push eax
    push 0x29a0
    push 0xf88c0
    call 0x9fc79
    add esp, 0x14
    mov ebx, 0xf88c0
    xor ecx, ecx
%else
    call 0x41e30
%endif
    push 0x1a
%if GAME_UPDATE
    mov edx, 0xaa
    mov eax, 0xa0
    call 0x10240
    call 0x3f1a0
    push 0x1a
    mov ebx, 0x29cc
%else
    mov ebx, 0x29bc
%endif
    mov edx, 0x5a
    mov eax, 0xa0
    xor ecx, ecx
    call 0x10240
    push 0x1a
    mov ebx, LINK_ADDRESS_28
    mov edx, 0x63
    mov eax, 0xa0
    xor ecx, ecx
    call 0x10240
    cmp byte [LINK_ADDRESS_34], 0
%if GAME_UPDATE
    jne short loc_0bb0
%else
    jne short loc_0be7
%endif
    cmp byte [LINK_ADDRESS_35], 0
%if GAME_UPDATE
    jne short loc_0bb0
%else
    jne short loc_0be7
%endif
    cmp byte [LINK_ADDRESS_36], 0
%if GAME_UPDATE
    jne short loc_0bb0
%else
    jne short loc_0be7
%endif
    cmp byte [LINK_ADDRESS_37], 0
%if GAME_UPDATE
    jne short loc_0bb0
%else
    jne short loc_0be7
%endif
    mov dl, byte [LINK_ADDRESS_3]
    test dl, 1
%if GAME_UPDATE
    je short loc_0bed
%else
    je short loc_0c24
%endif
%if GAME_UPDATE
loc_0bb0:
%else
loc_0be7:
%endif
    call LINK_ADDRESS_38
    mov eax, dword [LINK_ADDRESS_12]
    sub eax, 0x7d0
    imul eax, eax, 0x16
    add eax, LINK_ADDRESS_24
    call STRLEN
    mov byte [LINK_ADDRESS_63], al
    mov ax, word [LINK_ADDRESS_12]
    db 0x81, 0xe8, 0x68, 0x06, 0x00, 0x00    ; sub eax, 0x668
    cwde
    call LINK_ADDRESS_58
    call LINK_ADDRESS_38
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_0bed:
%else
loc_0c24:
%endif
    cmp byte [LINK_ADDRESS_30], 0
%if GAME_UPDATE
    jne short loc_0c04
%else
    jne short loc_0c3b
%endif
    cmp byte [LINK_ADDRESS_29], 0
%if GAME_UPDATE
    jne short loc_0c04
%else
    jne short loc_0c3b
%endif
    test dl, 2
%if GAME_UPDATE
    je short loc_0c26
%else
    je short loc_0c5d
%endif
%if GAME_UPDATE
loc_0c04:
%else
loc_0c3b:
%endif
    xor cl, cl
    mov byte [LINK_ADDRESS_30], cl
    mov byte [LINK_ADDRESS_29], cl
    mov eax, 0x15f
    call LINK_ADDRESS_58
    mov eax, 0xf3
    call LINK_ADDRESS_57
%if GAME_UPDATE
loc_0c26:
%else
loc_0c5d:
%endif
    mov edx, 0x7c
    mov eax, 0xba
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_17
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_0c3e:
%else
loc_0c75:
%endif
    cmp byte [LINK_ADDRESS_29], 0
%if GAME_UPDATE
    je short loc_0c53
%else
    je short loc_0c8a
%endif
%if GAME_UPDATE
loc_0c47:
%else
loc_0c7e:
%endif
    xor eax, eax
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_0c53:
%else
loc_0c8a:
%endif
    cmp byte [LINK_ADDRESS_64], 0
%if GAME_UPDATE
    jne short loc_0c80
%else
    jne short loc_0cb7
%endif
    cmp byte [LINK_ADDRESS_65], 0
%if GAME_UPDATE
    jne short loc_0c80
%else
    jne short loc_0cb7
%endif
    cmp byte [LINK_ADDRESS_66], 0
%if GAME_UPDATE
    jne short loc_0c80
%else
    jne short loc_0cb7
%endif
    cmp byte [LINK_ADDRESS_67], 0
%if GAME_UPDATE
    jne short loc_0c80
%else
    jne short loc_0cb7
%endif
    cmp byte [LINK_ADDRESS_68], 0
%if GAME_UPDATE
    je short loc_0cc8
%else
    je short loc_0cff
%endif
%if GAME_UPDATE
loc_0c80:
%else
loc_0cb7:
%endif
    xor ch, ch
    mov byte [LINK_ADDRESS_64], ch
    mov byte [LINK_ADDRESS_65], ch
    mov byte [LINK_ADDRESS_66], ch
    mov byte [LINK_ADDRESS_67], ch
    mov byte [LINK_ADDRESS_68], ch
%if GAME_UPDATE
    mov ebx, dword [0x121ea8]
%else
    mov esi, dword [0xe54a8]
%endif
%if GAME_UPDATE
    dec ebx
%else
    dec esi
%endif
%if GAME_UPDATE
    mov dword [0x121ea8], ebx
%else
    mov dword [0xe54a8], esi
%endif
%if GAME_UPDATE
    cmp ebx, 0x3de
%else
    cmp esi, 0x3de
%endif
%if GAME_UPDATE
    jge near loc_4370
%else
    jge near loc_41b3
%endif
    mov dword [LINK_ADDRESS_12], 0x3e0
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_0cc8:
%else
loc_0cff:
%endif
    cmp byte [LINK_ADDRESS_69], 0
%if GAME_UPDATE
    jne short loc_0d1d
%else
    jne short loc_0d54
%endif
    cmp byte [LINK_ADDRESS_35], 0
%if GAME_UPDATE
    jne short loc_0d1d
%else
    jne short loc_0d54
%endif
    cmp byte [LINK_ADDRESS_34], 0
%if GAME_UPDATE
    jne short loc_0d1d
%else
    jne short loc_0d54
%endif
    cmp byte [LINK_ADDRESS_36], 0
%if GAME_UPDATE
    jne short loc_0d1d
%else
    jne short loc_0d54
%endif
    cmp byte [LINK_ADDRESS_70], 0
%if GAME_UPDATE
    jne short loc_0d1d
%else
    jne short loc_0d54
%endif
    cmp byte [LINK_ADDRESS_71], 0
%if GAME_UPDATE
    jne short loc_0d1d
%else
    jne short loc_0d54
%endif
    cmp byte [LINK_ADDRESS_72], 0
%if GAME_UPDATE
    jne short loc_0d1d
%else
    jne short loc_0d54
%endif
    cmp byte [LINK_ADDRESS_73], 0
%if GAME_UPDATE
    jne short loc_0d1d
%else
    jne short loc_0d54
%endif
    cmp byte [LINK_ADDRESS_74], 0
%if GAME_UPDATE
    je near loc_4370
%else
    je near loc_41b3
%endif
%if GAME_UPDATE
loc_0d1d:
%else
loc_0d54:
%endif
    xor cl, cl
    mov byte [LINK_ADDRESS_69], cl
    mov byte [LINK_ADDRESS_35], cl
    mov byte [LINK_ADDRESS_70], cl
    mov byte [LINK_ADDRESS_36], cl
    mov byte [LINK_ADDRESS_74], cl
    mov byte [LINK_ADDRESS_73], cl
    mov byte [LINK_ADDRESS_72], cl
    mov byte [LINK_ADDRESS_71], cl
    mov byte [LINK_ADDRESS_34], cl
%if GAME_UPDATE
    mov edi, dword [0x121ea8]
%else
    mov edx, dword [0xe54a8]
%endif
%if GAME_UPDATE
    inc edi
%else
    inc edx
%endif
%if GAME_UPDATE
    mov dword [0x121ea8], edi
%else
    mov dword [0xe54a8], edx
%endif
%if GAME_UPDATE
    cmp edi, 0x3e0
%else
    cmp edx, 0x3e0
%endif
%if GAME_UPDATE
    jle near loc_4370
%else
    jle near loc_41b3
%endif
    mov dword [LINK_ADDRESS_12], 0x3de
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_0d7d:
%else
loc_0db4:
%endif
    mov eax, 0x65
    mov esi, 0xa0
    mov ecx, 7
    mov ebx, 0x10
    mov edx, 0x43
    call LINK_ADDRESS_58
    movsx eax, si
    call LINK_ADDRESS_17
    mov dword [ebp - 8], eax
    test ax, ax
%if GAME_UPDATE
    jl near loc_0e48
%else
    jl near loc_0e7f
%endif
    cmp dword [LINK_ADDRESS_18], 1
%if GAME_UPDATE
    jle short loc_0df2
%else
    jle short loc_0e29
%endif
    test ax, ax
%if GAME_UPDATE
    jne short loc_0df2
%else
    jne short loc_0e29
%endif
    cmp dword [LINK_ADDRESS_19], 2
%if GAME_UPDATE
    je short loc_0df2
%else
    je short loc_0e29
%endif
    cmp byte [LINK_ADDRESS_75], 4
%if GAME_UPDATE
    jne short loc_0de2
%else
    jne short loc_0e19
%endif
    mov ax, word [MYCONNECTINDEX]
    cmp ax, word [CONNECTHEAD]
%if GAME_UPDATE
    jne near loc_4370
%else
    jne near loc_41b3
%endif
%if GAME_UPDATE
loc_0de2:
%else
loc_0e19:
%endif
    xor ebx, ebx
    mov eax, 0x258
    mov word [LINK_ADDRESS_76], bx
%if GAME_UPDATE
    jmp short loc_0e43
%else
    jmp short loc_0e7a
%endif
%if GAME_UPDATE
loc_0df2:
%else
loc_0e29:
%endif
    mov eax, dword [ebp - 8]
    mov word [LINK_ADDRESS_76], ax
    db 0x66, 0x3d, 0x06, 0x00    ; cmp ax, 6
%if GAME_UPDATE
    ja short loc_0e48
%else
    ja short loc_0e7f
%endif
    xor eax, eax
    mov ax, word [ebp - 8]
    jmp dword cs:[eax*4 + LINK_ADDRESS_77]
    mov eax, 0x64
%if GAME_UPDATE
    jmp short loc_0e43
%else
    jmp short loc_0e7a
%endif
    mov eax, 0x65
%if GAME_UPDATE
    jmp short loc_0e43
%else
    jmp short loc_0e7a
%endif
    mov eax, 0xc8
%if GAME_UPDATE
    jmp short loc_0e43
%else
    jmp short loc_0e7a
%endif
    mov eax, 0x12c
%if GAME_UPDATE
    jmp short loc_0e43
%else
    jmp short loc_0e7a
%endif
    call LINK_ADDRESS_38
    mov eax, 0x190
%if GAME_UPDATE
    jmp short loc_0e43
%else
    jmp short loc_0e7a
%endif
    mov eax, 0x3de
%if GAME_UPDATE
    jmp short loc_0e43
%else
    jmp short loc_0e7a
%endif
    mov eax, 0x1f4
%if GAME_UPDATE
loc_0e43:
%else
loc_0e7a:
%endif
    call LINK_ADDRESS_58
%if GAME_UPDATE
loc_0e48:
%else
loc_0e7f:
%endif
    cmp byte [LINK_ADDRESS_78], 0
%if GAME_UPDATE
    je near loc_4370
%else
    je near loc_41b3
%endif
    mov eax, 0x1f4
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_0e64:
%else
loc_0e9b:
%endif
    mov esi, 0xa0
    mov ecx, 7
    mov ebx, 0x10
    mov edx, 0x43
    movsx eax, si
    call LINK_ADDRESS_17
    mov dword [ebp - 8], eax
    inc eax
    db 0x66, 0x3d, 0x07, 0x00    ; cmp ax, 7
%if GAME_UPDATE
    ja near loc_1043
%else
    ja near loc_107a
%endif
    and eax, 0xffff
    jmp dword cs:[eax*4 + LINK_ADDRESS_79]
    cmp byte [LINK_ADDRESS_75], 4
%if GAME_UPDATE
    jne short loc_0eb7
%else
    jne short loc_0eee
%endif
    mov ax, word [MYCONNECTINDEX]
    cmp ax, word [CONNECTHEAD]
%if GAME_UPDATE
    jne near loc_1043
%else
    jne near loc_107a
%endif
%if GAME_UPDATE
loc_0eb7:
%else
loc_0eee:
%endif
    cmp dword [LINK_ADDRESS_18], 2
%if GAME_UPDATE
    jl short loc_0ec9
%else
    jl short loc_0f00
%endif
    cmp dword [LINK_ADDRESS_19], 2
%if GAME_UPDATE
    jne short loc_0ed8
%else
    jne short loc_0f0f
%endif
%if GAME_UPDATE
loc_0ec9:
%else
loc_0f00:
%endif
    mov eax, 0x5dc
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_1043
%else
    jmp near loc_107a
%endif
%if GAME_UPDATE
loc_0ed8:
%else
loc_0f0f:
%endif
    mov eax, 0x258
    xor edi, edi
    call LINK_ADDRESS_58
    mov word [LINK_ADDRESS_80], di
%if GAME_UPDATE
    jmp near loc_1043
%else
    jmp near loc_107a
%endif
    cmp byte [LINK_ADDRESS_75], 4
%if GAME_UPDATE
    jne short loc_0f0c
%else
    jne short loc_0f43
%endif
    mov ax, word [CONNECTHEAD]
    cmp ax, word [MYCONNECTINDEX]
%if GAME_UPDATE
    jne near loc_1043
%else
    jne near loc_107a
%endif
%if GAME_UPDATE
loc_0f0c:
%else
loc_0f43:
%endif
    cmp dword [LINK_ADDRESS_19], 2
%if GAME_UPDATE
    je near loc_1043
%else
    je near loc_107a
%endif
    mov ebx, 1
    mov eax, 0x15e
    xor edx, edx
    mov word [LINK_ADDRESS_80], bx
    call LINK_ADDRESS_58
    mov ecx, dword [YDIM]
    mov ebx, dword [XDIM]
    xor eax, eax
    dec ecx
    dec ebx
    call SETVIEW
%if GAME_UPDATE
    jmp near loc_1043
%else
    jmp near loc_107a
%endif
    cmp byte [LINK_ADDRESS_75], 4
%if GAME_UPDATE
    jne short loc_0f67
%else
    jne short loc_0f9e
%endif
    mov ax, word [CONNECTHEAD]
    cmp ax, word [MYCONNECTINDEX]
%if GAME_UPDATE
    jne near loc_1043
%else
    jne near loc_107a
%endif
%if GAME_UPDATE
loc_0f67:
%else
loc_0f9e:
%endif
    mov word [LINK_ADDRESS_80], 2
    mov eax, 0x12c
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_1043
%else
    jmp near loc_107a
%endif
    mov ecx, 3
    mov eax, 0xc8
    mov word [LINK_ADDRESS_80], cx
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_1043
%else
    jmp near loc_107a
%endif
    mov word [LINK_ADDRESS_80], 4
    call LINK_ADDRESS_38
    mov eax, 0x190
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_1043
%else
    jmp near loc_107a
%endif
    cmp word [NUMPLAYERS], 2
%if GAME_UPDATE
    jge near loc_1043
%else
    jge near loc_107a
%endif
    mov edx, 5
    mov eax, 0x1f5
    mov word [LINK_ADDRESS_80], dx
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp short loc_1043
%else
    jmp short loc_107a
%endif
    mov edi, 6
    mov eax, 0x1f4
    mov word [LINK_ADDRESS_80], di
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp short loc_1043
%else
    jmp short loc_107a
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dl, byte [nosplit eax*2 + LINK_ADDRESS_7]
    and dl, 0xfe
    mov ebx, dword [LINK_ADDRESS_18]
    mov byte [nosplit eax*2 + LINK_ADDRESS_7], dl
    cmp ebx, 2
%if GAME_UPDATE
    jge short loc_1043
%else
    jge short loc_107a
%endif
    cmp dword [LINK_ADDRESS_19], 2
%if GAME_UPDATE
    je short loc_1043
%else
    je short loc_107a
%endif
    mov dh, 1
    mov eax, dword [LINK_ADDRESS_20]
    mov byte [LINK_ADDRESS_21], dh
    mov dword [TOTALCLOCK], eax
%if GAME_UPDATE
loc_1043:
%else
loc_107a:
%endif
    cmp byte [LINK_ADDRESS_78], 0
%if GAME_UPDATE
    je short loc_1056
%else
    je short loc_108d
%endif
    mov eax, 0x1f4
    call LINK_ADDRESS_58
%if GAME_UPDATE
loc_1056:
%else
loc_108d:
%endif
    cmp byte [LINK_ADDRESS_75], 4
%if GAME_UPDATE
    jne short loc_10b4
%else
    jne short loc_10eb
%endif
    mov ax, word [CONNECTHEAD]
    cmp ax, word [MYCONNECTINDEX]
%if GAME_UPDATE
    je short loc_10b4
%else
    je short loc_10eb
%endif
    push LINK_ADDRESS_83
    mov ecx, 1
    mov edx, 0x43
    movsx edi, si
    xor ebx, ebx
    mov eax, edi
    call LINK_ADDRESS_45
    push LINK_ADDRESS_60
    mov ecx, 1
    mov edx, 0x53
    mov eax, edi
    xor ebx, ebx
    call LINK_ADDRESS_45
    push LINK_ADDRESS_44
    mov ecx, 1
    mov edx, 0x63
    mov eax, edi
%if GAME_UPDATE
    jmp short loc_10ef
%else
    jmp short loc_1126
%endif
%if GAME_UPDATE
loc_10b4:
%else
loc_10eb:
%endif
    push LINK_ADDRESS_83
    mov edx, 0x43
    movsx edi, si
    xor ecx, ecx
    xor ebx, ebx
    mov eax, edi
    call LINK_ADDRESS_45
    push LINK_ADDRESS_60
    mov edx, 0x53
    mov eax, edi
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_45
    push LINK_ADDRESS_44
    mov edx, 0x63
    mov eax, edi
    xor ecx, ecx
%if GAME_UPDATE
loc_10ef:
%else
loc_1126:
%endif
    xor ebx, ebx
    call LINK_ADDRESS_45
    push LINK_ADDRESS_84
    mov edx, 0x73
    movsx edi, si
    xor ecx, ecx
    xor ebx, ebx
    mov eax, edi
    call LINK_ADDRESS_45
    push LINK_ADDRESS_85
    mov edx, 0x83
    mov eax, edi
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_45
    cmp word [NUMPLAYERS], 1
%if GAME_UPDATE
    jle short loc_1140
%else
    jle short loc_1177
%endif
    push LINK_ADDRESS_86
    mov ecx, 1
    mov edx, 0x93
    mov eax, edi
%if GAME_UPDATE
    jmp short loc_114e
%else
    jmp short loc_1185
%endif
%if GAME_UPDATE
loc_1140:
%else
loc_1177:
%endif
    push LINK_ADDRESS_86
    mov edx, 0x93
    mov eax, edi
    xor ecx, ecx
%if GAME_UPDATE
loc_114e:
%else
loc_1185:
%endif
    xor ebx, ebx
    call LINK_ADDRESS_45
    push LINK_ADDRESS_87
    mov edx, 0xa3
%if GAME_UPDATE
    jmp near loc_4364
%else
    jmp near loc_41a7
%endif
%if GAME_UPDATE
loc_1164:
%else
loc_119b:
%endif
    mov ecx, 3
    mov ebx, 0x14
    mov edx, 0x3c
    mov eax, 0xa0
    call LINK_ADDRESS_17
    mov dword [ebp - 8], eax
    test ax, ax
%if GAME_UPDATE
    jl near loc_0c47
%else
    jl near loc_0c7e
%endif
    dec eax
    db 0x66, 0x3d, 0x04, 0x00    ; cmp ax, 4
%if GAME_UPDATE
    ja near loc_4370
%else
    ja near loc_41b3
%endif
    and eax, 0xffff
    jmp dword cs:[eax*4 + LINK_ADDRESS_88]
    mov eax, 0x96
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
    mov eax, 0xa0
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
    mov eax, 0xaa
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_11ce:
%else
loc_1205:
%endif
    xor ebx, ebx
    mov eax, 0x6e
    mov dword [LINK_ADDRESS_89], ebx
    mov dword [LINK_ADDRESS_90], ebx
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_11eb:
%else
loc_1222:
%endif
    mov eax, LINK_ADDRESS_91
    mov edx, 0x40
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0x78
    call LINK_ADDRESS_92
    mov edx, 0x4a
    mov eax, 0x28
    xor ebx, ebx
    call LINK_ADDRESS_93
    xor ecx, ecx
    mov eax, LINK_ADDRESS_94
    mov edx, 0x8c
    push eax
    xor ebx, ebx
    mov eax, 0x64
    call LINK_ADDRESS_92
    mov edx, 0x96
    mov eax, 0x28
    call LINK_ADDRESS_95
    xor ecx, ecx
    mov eax, LINK_ADDRESS_96
    xor ebx, ebx
    push eax
    mov edx, 0xb9
    mov eax, 0x46
    call LINK_ADDRESS_92
    mov eax, LINK_ADDRESS_97
    mov edx, 0xb9
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0xf0
    call LINK_ADDRESS_92
    mov ecx, 3
    mov ebx, 0x14
    mov edx, 0x3c
    mov eax, 0xa0
    call LINK_ADDRESS_17
    mov dword [ebp - 8], eax
    test ax, ax
%if GAME_UPDATE
    jl short loc_12b6
%else
    jl short loc_12ed
%endif
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
%if GAME_UPDATE
    jb near loc_4370
%else
    jb near loc_41b3
%endif
%if GAME_UPDATE
    jbe short loc_12a7
%else
    jbe short loc_12de
%endif
    db 0x66, 0x3d, 0x02, 0x00    ; cmp ax, 2
%if GAME_UPDATE
    je short loc_12b6
%else
    je short loc_12ed
%endif
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_12a7:
%else
loc_12de:
%endif
    mov eax, 0x67
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_12b6:
%else
loc_12ed:
%endif
    mov eax, 0x64
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_12c5:
%else
loc_12fc:
%endif
    mov eax, LINK_ADDRESS_98
    mov edx, 0x3c
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0x82
    call LINK_ADDRESS_92
    mov edx, 0x4b
    mov eax, 0x46
    call LINK_ADDRESS_99
    xor ecx, ecx
    mov eax, LINK_ADDRESS_100
    xor ebx, ebx
    push eax
    mov edx, 0xb9
    mov eax, 0x46
    call LINK_ADDRESS_92
    mov ecx, 3
    mov ebx, 0x14
    mov edx, 0x3c
    mov eax, 0xa0
    call LINK_ADDRESS_17
    mov dword [ebp - 8], eax
    test ax, ax
%if GAME_UPDATE
    jl short loc_1331
%else
    jl short loc_1368
%endif
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
%if GAME_UPDATE
    jne near loc_4370
%else
    jne near loc_41b3
%endif
%if GAME_UPDATE
loc_1331:
%else
loc_1368:
%endif
    mov eax, 0x66
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_1340:
%else
loc_1377:
%endif
    movsx eax, word [ebp - 8]
    mov edx, dword [LINK_ADDRESS_89]
    xor ebx, ebx
    inc eax
    mov dword [LINK_ADDRESS_101], ebx
    mov dword [LINK_ADDRESS_102], ebx
    mov dword [LINK_ADDRESS_103], ebx
    mov dword [LINK_ADDRESS_104], ebx
    mov dword [LINK_ADDRESS_105], eax
    mov eax, 1
    mov dword [LINK_ADDRESS_106], ebx
    mov dword [LINK_ADDRESS_18], eax
    cmp edx, 3
%if GAME_UPDATE
    jne short loc_13a7
%else
    jne short loc_13de
%endif
    call LINK_ADDRESS_107
    mov ecx, dword [YDIM]
    mov ebx, dword [XDIM]
    xor edx, edx
    xor eax, eax
    dec ecx
    dec ebx
    call SETVIEW
    xor eax, eax
    call LINK_ADDRESS_108
    call LINK_ADDRESS_109
%if GAME_UPDATE
loc_13a7:
%else
loc_13de:
%endif
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    mov bl, byte [LINK_ADDRESS_105]
    mov dl, byte [LINK_ADDRESS_90]
    mov al, byte [LINK_ADDRESS_89]
    call LINK_ADDRESS_110
    mov eax, 4
    call LINK_ADDRESS_33
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_13d2:
%else
loc_1409:
%endif
    mov eax, LINK_ADDRESS_111
    mov edx, 0xa7
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0xdc
    call LINK_ADDRESS_92
    mov ebx, 0x190
    mov edx, 0xa7
    mov eax, 0xf5
    xor ecx, ecx
    call LINK_ADDRESS_112
    mov ecx, 3
    mov ebx, 0x14
    mov edx, 0x3c
    mov eax, 0xa0
    call LINK_ADDRESS_17
    mov dword [ebp - 8], eax
    test ax, ax
%if GAME_UPDATE
    jl short loc_1483
%else
    jl short loc_14ba
%endif
    dec eax
    db 0x66, 0x3d, 0x03, 0x00    ; cmp ax, 3
%if GAME_UPDATE
    ja short loc_148d
%else
    ja short loc_14c4
%endif
    and eax, 0xffff
    jmp dword cs:[eax*4 + LINK_ADDRESS_113]
    mov eax, 0x99
%if GAME_UPDATE
    jmp short loc_1488
%else
    jmp short loc_14bf
%endif
    mov eax, 0x97
%if GAME_UPDATE
    jmp short loc_1488
%else
    jmp short loc_14bf
%endif
    mov edx, 0x190
    xor eax, eax
    call LINK_ADDRESS_114
    mov dword [LINK_ADDRESS_115], eax
    cmp eax, 1
%if GAME_UPDATE
    jne short loc_1466
%else
    jne short loc_149d
%endif
    mov dword [LINK_ADDRESS_116], LINK_ADDRESS_117
%if GAME_UPDATE
    jmp short loc_148d
%else
    jmp short loc_14c4
%endif
%if GAME_UPDATE
loc_1466:
%else
loc_149d:
%endif
    cmp eax, -1
%if GAME_UPDATE
    jne short loc_1477
%else
    jne short loc_14ae
%endif
    mov dword [LINK_ADDRESS_116], LINK_ADDRESS_118
%if GAME_UPDATE
    jmp short loc_148d
%else
    jmp short loc_14c4
%endif
%if GAME_UPDATE
loc_1477:
%else
loc_14ae:
%endif
    mov dword [LINK_ADDRESS_116], LINK_ADDRESS_119
%if GAME_UPDATE
    jmp short loc_148d
%else
    jmp short loc_14c4
%endif
%if GAME_UPDATE
loc_1483:
%else
loc_14ba:
%endif
    mov eax, 0x64
%if GAME_UPDATE
loc_1488:
%else
loc_14bf:
%endif
    call LINK_ADDRESS_58
%if GAME_UPDATE
loc_148d:
%else
loc_14c4:
%endif
    cmp dword [LINK_ADDRESS_115], 0
%if GAME_UPDATE
    je short loc_14bc
%else
    je short loc_14f3
%endif
    cmp dword [LINK_ADDRESS_120], 0x64
%if GAME_UPDATE
    jg short loc_14bc
%else
    jg short loc_14f3
%endif
    mov edx, 0x64
    mov ecx, dword [LINK_ADDRESS_116]
    xor ebx, ebx
    push ecx
    mov eax, edx
    xor ecx, ecx
    call LINK_ADDRESS_92
    inc dword [LINK_ADDRESS_120]
%if GAME_UPDATE
loc_14bc:
%else
loc_14f3:
%endif
    cmp dword [LINK_ADDRESS_120], 0x64
%if GAME_UPDATE
    jle near loc_4370
%else
    jle near loc_41b3
%endif
    xor eax, eax
    mov dword [LINK_ADDRESS_120], eax
    mov dword [LINK_ADDRESS_115], eax
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_14da:
%else
loc_1511:
%endif
    mov eax, LINK_ADDRESS_111
    mov edx, 0xa7
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0xdc
    call LINK_ADDRESS_92
    mov ebx, 0x1f4
    mov edx, 0xa7
    mov eax, 0xf5
    xor ecx, ecx
    call LINK_ADDRESS_112
    mov ecx, 3
    mov ebx, 0x14
    mov edx, 0x3c
    mov eax, 0xa0
    call LINK_ADDRESS_17
    mov dword [ebp - 8], eax
    test ax, ax
%if GAME_UPDATE
    jl near loc_1596
%else
    jl near loc_15cd
%endif
    dec eax
    db 0x66, 0x3d, 0x03, 0x00    ; cmp ax, 3
%if GAME_UPDATE
    ja near loc_15a0
%else
    ja near loc_15d7
%endif
    and eax, 0xffff
    jmp dword cs:[eax*4 + LINK_ADDRESS_121]
    mov eax, 0x96
%if GAME_UPDATE
    jmp short loc_159b
%else
    jmp short loc_15d2
%endif
    mov eax, 0x98
%if GAME_UPDATE
    jmp short loc_159b
%else
    jmp short loc_15d2
%endif
    mov edx, 0x1f4
    mov eax, 1
    call LINK_ADDRESS_114
    mov dword [LINK_ADDRESS_115], eax
    cmp eax, 1
%if GAME_UPDATE
    jne short loc_1579
%else
    jne short loc_15b0
%endif
    mov dword [LINK_ADDRESS_116], LINK_ADDRESS_117
%if GAME_UPDATE
    jmp short loc_15a0
%else
    jmp short loc_15d7
%endif
%if GAME_UPDATE
loc_1579:
%else
loc_15b0:
%endif
    cmp eax, -1
%if GAME_UPDATE
    jne short loc_158a
%else
    jne short loc_15c1
%endif
    mov dword [LINK_ADDRESS_116], LINK_ADDRESS_118
%if GAME_UPDATE
    jmp short loc_15a0
%else
    jmp short loc_15d7
%endif
%if GAME_UPDATE
loc_158a:
%else
loc_15c1:
%endif
    mov dword [LINK_ADDRESS_116], LINK_ADDRESS_122
%if GAME_UPDATE
    jmp short loc_15a0
%else
    jmp short loc_15d7
%endif
%if GAME_UPDATE
loc_1596:
%else
loc_15cd:
%endif
    mov eax, 0x64
%if GAME_UPDATE
loc_159b:
%else
loc_15d2:
%endif
    call LINK_ADDRESS_58
%if GAME_UPDATE
loc_15a0:
%else
loc_15d7:
%endif
    cmp dword [LINK_ADDRESS_115], 0
%if GAME_UPDATE
    je short loc_15cf
%else
    je short loc_1606
%endif
    cmp dword [LINK_ADDRESS_120], 0x64
%if GAME_UPDATE
    jg short loc_15cf
%else
    jg short loc_1606
%endif
    mov edx, 0x64
    mov ecx, dword [LINK_ADDRESS_116]
    xor ebx, ebx
    push ecx
    mov eax, edx
    xor ecx, ecx
    call LINK_ADDRESS_92
    inc dword [LINK_ADDRESS_120]
%if GAME_UPDATE
loc_15cf:
%else
loc_1606:
%endif
    cmp dword [LINK_ADDRESS_120], 0x64
%if GAME_UPDATE
    jle near loc_4370
%else
    jle near loc_41b3
%endif
    xor eax, eax
    mov dword [LINK_ADDRESS_120], eax
    mov dword [LINK_ADDRESS_115], eax
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_15ed:
%else
loc_1624:
%endif
    mov eax, LINK_ADDRESS_111
    mov edx, 0xa7
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0xdc
    call LINK_ADDRESS_92
    mov ebx, 0x64
    mov edx, 0xa7
    mov eax, 0xf5
    xor ecx, ecx
    call LINK_ADDRESS_112
    mov ecx, 3
    mov ebx, 0x14
    mov edx, 0x3c
    mov eax, 0xa0
    call LINK_ADDRESS_17
    mov dword [ebp - 8], eax
    test ax, ax
%if GAME_UPDATE
    jl near loc_16a9
%else
    jl near loc_16e0
%endif
    dec eax
    db 0x66, 0x3d, 0x03, 0x00    ; cmp ax, 3
%if GAME_UPDATE
    ja near loc_16b3
%else
    ja near loc_16ea
%endif
    and eax, 0xffff
    jmp dword cs:[eax*4 + LINK_ADDRESS_123]
    mov eax, 0x97
%if GAME_UPDATE
    jmp short loc_16ae
%else
    jmp short loc_16e5
%endif
    mov eax, 0x99
%if GAME_UPDATE
    jmp short loc_16ae
%else
    jmp short loc_16e5
%endif
    mov edx, 0x64
    mov eax, 2
    call LINK_ADDRESS_114
    mov dword [LINK_ADDRESS_115], eax
    cmp eax, 1
%if GAME_UPDATE
    jne short loc_168c
%else
    jne short loc_16c3
%endif
    mov dword [LINK_ADDRESS_116], LINK_ADDRESS_117
%if GAME_UPDATE
    jmp short loc_16b3
%else
    jmp short loc_16ea
%endif
%if GAME_UPDATE
loc_168c:
%else
loc_16c3:
%endif
    cmp eax, -1
%if GAME_UPDATE
    jne short loc_169d
%else
    jne short loc_16d4
%endif
    mov dword [LINK_ADDRESS_116], LINK_ADDRESS_118
%if GAME_UPDATE
    jmp short loc_16b3
%else
    jmp short loc_16ea
%endif
%if GAME_UPDATE
loc_169d:
%else
loc_16d4:
%endif
    mov dword [LINK_ADDRESS_116], LINK_ADDRESS_124
%if GAME_UPDATE
    jmp short loc_16b3
%else
    jmp short loc_16ea
%endif
%if GAME_UPDATE
loc_16a9:
%else
loc_16e0:
%endif
    mov eax, 0x64
%if GAME_UPDATE
loc_16ae:
%else
loc_16e5:
%endif
    call LINK_ADDRESS_58
%if GAME_UPDATE
loc_16b3:
%else
loc_16ea:
%endif
    cmp dword [LINK_ADDRESS_115], 0
%if GAME_UPDATE
    je short loc_16e2
%else
    je short loc_1719
%endif
    cmp dword [LINK_ADDRESS_120], 0x64
%if GAME_UPDATE
    jg short loc_16e2
%else
    jg short loc_1719
%endif
    mov edx, 0x64
    mov ecx, dword [LINK_ADDRESS_116]
    xor ebx, ebx
    push ecx
    mov eax, edx
    xor ecx, ecx
    call LINK_ADDRESS_92
    inc dword [LINK_ADDRESS_120]
%if GAME_UPDATE
loc_16e2:
%else
loc_1719:
%endif
    cmp dword [LINK_ADDRESS_120], 0x64
%if GAME_UPDATE
    jle near loc_4370
%else
    jle near loc_41b3
%endif
    xor eax, eax
    mov dword [LINK_ADDRESS_120], eax
    mov dword [LINK_ADDRESS_115], eax
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_1700:
%else
loc_1737:
%endif
    mov eax, LINK_ADDRESS_111
    mov edx, 0xa7
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0xdc
    call LINK_ADDRESS_92
    mov ebx, 0x258
    mov edx, 0xa7
    mov eax, 0xf5
    xor ecx, ecx
    call LINK_ADDRESS_112
    mov ecx, 3
    mov ebx, 0x14
    mov edx, 0x3c
    mov eax, 0xa0
    call LINK_ADDRESS_17
    mov dword [ebp - 8], eax
    test ax, ax
%if GAME_UPDATE
    jl near loc_17bc
%else
    jl near loc_17f3
%endif
    dec eax
    db 0x66, 0x3d, 0x03, 0x00    ; cmp ax, 3
%if GAME_UPDATE
    ja near loc_17c6
%else
    ja near loc_17fd
%endif
    and eax, 0xffff
    jmp dword cs:[eax*4 + LINK_ADDRESS_125]
    mov eax, 0x98
%if GAME_UPDATE
    jmp short loc_17c1
%else
    jmp short loc_17f8
%endif
    mov eax, 0x96
%if GAME_UPDATE
    jmp short loc_17c1
%else
    jmp short loc_17f8
%endif
    mov edx, 0x258
    mov eax, 3
    call LINK_ADDRESS_114
    mov dword [LINK_ADDRESS_115], eax
    cmp eax, 1
%if GAME_UPDATE
    jne short loc_179f
%else
    jne short loc_17d6
%endif
    mov dword [LINK_ADDRESS_116], LINK_ADDRESS_117
%if GAME_UPDATE
    jmp short loc_17c6
%else
    jmp short loc_17fd
%endif
%if GAME_UPDATE
loc_179f:
%else
loc_17d6:
%endif
    cmp eax, -1
%if GAME_UPDATE
    jne short loc_17b0
%else
    jne short loc_17e7
%endif
    mov dword [LINK_ADDRESS_116], LINK_ADDRESS_118
%if GAME_UPDATE
    jmp short loc_17c6
%else
    jmp short loc_17fd
%endif
%if GAME_UPDATE
loc_17b0:
%else
loc_17e7:
%endif
    mov dword [LINK_ADDRESS_116], LINK_ADDRESS_126
%if GAME_UPDATE
    jmp short loc_17c6
%else
    jmp short loc_17fd
%endif
%if GAME_UPDATE
loc_17bc:
%else
loc_17f3:
%endif
    mov eax, 0x64
%if GAME_UPDATE
loc_17c1:
%else
loc_17f8:
%endif
    call LINK_ADDRESS_58
%if GAME_UPDATE
loc_17c6:
%else
loc_17fd:
%endif
    cmp dword [LINK_ADDRESS_115], 0
%if GAME_UPDATE
    je short loc_17f5
%else
    je short loc_182c
%endif
    cmp dword [LINK_ADDRESS_120], 0x64
%if GAME_UPDATE
    jg short loc_17f5
%else
    jg short loc_182c
%endif
    mov edx, 0x64
    mov ecx, dword [LINK_ADDRESS_116]
    xor ebx, ebx
    push ecx
    mov eax, edx
    xor ecx, ecx
    call LINK_ADDRESS_92
    inc dword [LINK_ADDRESS_120]
%if GAME_UPDATE
loc_17f5:
%else
loc_182c:
%endif
    cmp dword [LINK_ADDRESS_120], 0x64
%if GAME_UPDATE
    jle near loc_4370
%else
    jle near loc_41b3
%endif
    xor eax, eax
    mov dword [LINK_ADDRESS_120], eax
    mov dword [LINK_ADDRESS_115], eax
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_1813:
%else
loc_184a:
%endif
    mov eax, LINK_ADDRESS_111
    mov edx, 0x4b
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0xaf
    call LINK_ADDRESS_92
    mov ecx, 1
    mov ebx, 0xa
    mov edx, 0x4b
    mov eax, 0xc8
    call LINK_ADDRESS_112
    mov eax, LINK_ADDRESS_111
    mov edx, 0x75
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0xaf
    call LINK_ADDRESS_92
    mov ecx, 1
    mov ebx, 0xc8
    mov edx, 0x75
    mov eax, ebx
    call LINK_ADDRESS_112
    mov eax, dword [LINK_ADDRESS_127]
    test eax, eax
%if GAME_UPDATE
    je short loc_18b2
%else
    je short loc_18e9
%endif
    cmp dword [LINK_ADDRESS_128], 0
%if GAME_UPDATE
    je short loc_18b2
%else
    je short loc_18e9
%endif
    mov edx, 0x9e
    mov ebx, eax
    xor ecx, ecx
    mov eax, 0x78
    call LINK_ADDRESS_112
    mov edx, 0x9e
    mov eax, 0xb8
    mov ebx, dword [LINK_ADDRESS_128]
    xor ecx, ecx
    call LINK_ADDRESS_112
%if GAME_UPDATE
    jmp short loc_18e2
%else
    jmp short loc_1919
%endif
%if GAME_UPDATE
loc_18b2:
%else
loc_18e9:
%endif
    push LINK_ADDRESS_129
    mov edx, 0x9e
    mov eax, 0x78
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_92
    push LINK_ADDRESS_129
    mov edx, 0x9e
    mov eax, 0xb8
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_92
%if GAME_UPDATE
loc_18e2:
%else
loc_1919:
%endif
    mov ecx, 3
    mov ebx, 0x14
    mov edx, 0x3c
    mov eax, 0xa0
    call LINK_ADDRESS_17
    test ax, ax
%if GAME_UPDATE
    jl near loc_1aa8
%else
    jl near loc_1ade
%endif
    db 0x66, 0x3d, 0x02, 0x00    ; cmp ax, 2
%if GAME_UPDATE
    jb short loc_191f
%else
    jb short loc_1956
%endif
%if GAME_UPDATE
    jbe near loc_1993
%else
    jbe near loc_19c9
%endif
    db 0x66, 0x3d, 0x03, 0x00    ; cmp ax, 3
%if GAME_UPDATE
    je near loc_19bf
%else
    je near loc_19f5
%endif
%if GAME_UPDATE
    jmp near loc_1ab2
%else
    jmp near loc_1ae8
%endif
%if GAME_UPDATE
loc_191f:
%else
loc_1956:
%endif
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
%if GAME_UPDATE
    jne near loc_1ab2
%else
    jne near loc_1ae8
%endif
    mov esi, dword [LINK_ADDRESS_127]
    add esi, 0xa
    mov dword [LINK_ADDRESS_127], esi
    lea eax, [esi*4]
    add eax, esi
    add eax, eax
    movsx edx, word [MYCONNECTINDEX]
    mov dword [LINK_ADDRESS_128], eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
%if GAME_UPDATE
    mov eax, dword [nosplit eax*2 + 0xf19ac]
%else
    mov edx, dword [nosplit eax*2 + 0xb518c]
%endif
%if GAME_UPDATE
    mov edx, dword [0x13bde4]
%else
    mov eax, dword [0xf3200]
%endif
%if GAME_UPDATE
    cmp edx, dword [eax]
%else
    cmp eax, dword [edx]
%endif
%if GAME_UPDATE
    jle near loc_1ab2
%else
    jle near loc_1ae8
%endif
    lea eax, [esi - 0xa]
    mov dword [LINK_ADDRESS_127], eax
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    add eax, eax
    mov dword [LINK_ADDRESS_128], eax
%if GAME_UPDATE
    jmp near loc_1ab2
%else
    jmp near loc_1ae8
%endif
%if GAME_UPDATE
loc_1993:
%else
loc_19c9:
%endif
    mov ebx, dword [LINK_ADDRESS_127]
    test ebx, ebx
%if GAME_UPDATE
    jle near loc_1ab2
%else
    jle near loc_1ae8
%endif
    lea ecx, [ebx - 0xa]
    mov dword [LINK_ADDRESS_127], ecx
    lea eax, [ecx*4]
    add eax, ecx
    add eax, eax
    mov dword [LINK_ADDRESS_128], eax
%if GAME_UPDATE
    jmp near loc_1ab2
%else
    jmp near loc_1ae8
%endif
%if GAME_UPDATE
loc_19bf:
%else
loc_19f5:
%endif
    cmp dword [LINK_ADDRESS_130], 0
%if GAME_UPDATE
    je near loc_1a4d
%else
    je near loc_1a83
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov eax, dword [nosplit eax*2 + LINK_ADDRESS_131]
    mov ecx, dword [LINK_ADDRESS_128]
    mov eax, dword [eax]
    sub eax, ecx
    test eax, eax
%if GAME_UPDATE
    jl short loc_1a4d
%else
    jl short loc_1a83
%endif
    xor eax, eax
    call LINK_ADDRESS_132
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov eax, dword [nosplit eax*2 + LINK_ADDRESS_131]
    mov edx, dword [LINK_ADDRESS_128]
    mov ecx, dword [eax]
    sub ecx, edx
    mov esi, LINK_ADDRESS_117
    mov dword [eax], ecx
    mov edi, 1
    mov dword [LINK_ADDRESS_116], esi
    xor eax, eax
    mov dword [LINK_ADDRESS_115], edi
    mov dword [LINK_ADDRESS_130], eax
    mov dword [LINK_ADDRESS_128], eax
%if GAME_UPDATE
    jmp short loc_1ab2
%else
    jmp short loc_1ae8
%endif
%if GAME_UPDATE
loc_1a4d:
%else
loc_1a83:
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov eax, dword [nosplit eax*2 + LINK_ADDRESS_131]
    mov esi, dword [LINK_ADDRESS_128]
    mov eax, dword [eax]
    sub eax, esi
    test eax, eax
%if GAME_UPDATE
    jge short loc_1a91
%else
    jge short loc_1ac7
%endif
    mov edx, 1
    mov ebx, LINK_ADDRESS_118
    mov dword [LINK_ADDRESS_115], edx
    mov dword [LINK_ADDRESS_116], ebx
%if GAME_UPDATE
    jmp short loc_1ab2
%else
    jmp short loc_1ae8
%endif
%if GAME_UPDATE
loc_1a91:
%else
loc_1ac7:
%endif
    mov edi, 1
    mov eax, LINK_ADDRESS_133
    mov dword [LINK_ADDRESS_115], edi
    mov dword [LINK_ADDRESS_116], eax
%if GAME_UPDATE
    jmp short loc_1ab2
%else
    jmp short loc_1ae8
%endif
%if GAME_UPDATE
loc_1aa8:
%else
loc_1ade:
%endif
    mov eax, 0x64
    call LINK_ADDRESS_58
%if GAME_UPDATE
loc_1ab2:
%else
loc_1ae8:
%endif
    cmp dword [LINK_ADDRESS_115], 0
%if GAME_UPDATE
    je short loc_1ae1
%else
    je short loc_1b17
%endif
    cmp dword [LINK_ADDRESS_120], 0x46
%if GAME_UPDATE
    jg short loc_1ae1
%else
    jg short loc_1b17
%endif
    mov edx, 0x64
    mov ecx, dword [LINK_ADDRESS_116]
    xor ebx, ebx
    push ecx
    mov eax, edx
    xor ecx, ecx
    call LINK_ADDRESS_92
    inc dword [LINK_ADDRESS_120]
%if GAME_UPDATE
loc_1ae1:
%else
loc_1b17:
%endif
    cmp dword [LINK_ADDRESS_120], 0x64
%if GAME_UPDATE
    jle near loc_4370
%else
    jle near loc_41b3
%endif
    xor eax, eax
    mov dword [LINK_ADDRESS_120], eax
    mov dword [LINK_ADDRESS_115], eax
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_1aff:
%else
loc_1b35:
%endif
    mov eax, LINK_ADDRESS_111
    mov edx, 0x4b
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0xaf
    call LINK_ADDRESS_92
    mov ecx, 1
    mov ebx, 0xa
    mov edx, 0x4b
    mov eax, 0xc8
    call LINK_ADDRESS_112
    mov eax, LINK_ADDRESS_111
    mov edx, 0x75
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0xaf
    call LINK_ADDRESS_92
    mov ecx, 1
    mov ebx, 0xc8
    mov edx, 0x75
    mov eax, ebx
    call LINK_ADDRESS_112
    mov ebx, dword [LINK_ADDRESS_130]
    test ebx, ebx
%if GAME_UPDATE
    je short loc_1b9d
%else
    je short loc_1bd3
%endif
    cmp dword [LINK_ADDRESS_134], 0
%if GAME_UPDATE
    je short loc_1b9d
%else
    je short loc_1bd3
%endif
    mov edx, 0x9e
    mov eax, 0x78
    xor ecx, ecx
    call LINK_ADDRESS_112
    mov edx, 0x9e
    mov eax, 0xb8
    mov ebx, dword [LINK_ADDRESS_134]
    xor ecx, ecx
    call LINK_ADDRESS_112
%if GAME_UPDATE
    jmp short loc_1bcd
%else
    jmp short loc_1c03
%endif
%if GAME_UPDATE
loc_1b9d:
%else
loc_1bd3:
%endif
    push LINK_ADDRESS_129
    mov edx, 0x9e
    mov eax, 0x78
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_92
    push LINK_ADDRESS_129
    mov edx, 0x9e
    mov eax, 0xb8
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_92
%if GAME_UPDATE
loc_1bcd:
%else
loc_1c03:
%endif
    mov ecx, 3
    mov ebx, 0x14
    mov edx, 0x3c
    mov eax, 0xa0
    call LINK_ADDRESS_17
    mov edx, eax
    test ax, ax
%if GAME_UPDATE
    jl near loc_1d5a
%else
    jl near loc_1d8f
%endif
    mov ebx, dword [LINK_ADDRESS_127]
    lea eax, [ebx*4]
    add ebx, eax
    add ebx, ebx
    cmp dx, 2
%if GAME_UPDATE
    jb short loc_1c19
%else
    jb short loc_1c4f
%endif
%if GAME_UPDATE
    jbe short loc_1c82
%else
    jbe short loc_1cb7
%endif
    cmp dx, 3
%if GAME_UPDATE
    je near loc_1ca4
%else
    je near loc_1cd9
%endif
%if GAME_UPDATE
    jmp near loc_1d64
%else
    jmp near loc_1d99
%endif
%if GAME_UPDATE
loc_1c19:
%else
loc_1c4f:
%endif
    cmp dx, 1
%if GAME_UPDATE
    jne near loc_1d64
%else
    jne near loc_1d99
%endif
    mov edi, dword [LINK_ADDRESS_130]
    add edi, 0xa
    mov dword [LINK_ADDRESS_130], edi
    lea eax, [edi*4]
    add eax, edi
    add eax, eax
    movsx edx, word [MYCONNECTINDEX]
    mov dword [LINK_ADDRESS_134], eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
%if GAME_UPDATE
    mov eax, dword [nosplit eax*2 + 0xf19ac]
%else
    mov edx, dword [nosplit eax*2 + 0xb518c]
%endif
%if GAME_UPDATE
    mov edx, dword [0x13bdd8]
%else
    mov eax, dword [0xf31f8]
%endif
%if GAME_UPDATE
    cmp edx, dword [eax]
%else
    cmp eax, dword [edx]
%endif
%if GAME_UPDATE
    jle near loc_1d64
%else
    jle near loc_1d99
%endif
    lea esi, [edi - 0xa]
    mov dword [LINK_ADDRESS_134], ebx
    mov dword [LINK_ADDRESS_130], esi
%if GAME_UPDATE
    jmp near loc_1d64
%else
    jmp near loc_1d99
%endif
%if GAME_UPDATE
loc_1c82:
%else
loc_1cb7:
%endif
    mov ecx, dword [LINK_ADDRESS_130]
    test ecx, ecx
%if GAME_UPDATE
    jle near loc_1d64
%else
    jle near loc_1d99
%endif
    lea esi, [ecx - 0xa]
    mov dword [LINK_ADDRESS_134], ebx
    mov dword [LINK_ADDRESS_130], esi
%if GAME_UPDATE
    jmp near loc_1d64
%else
    jmp near loc_1d99
%endif
%if GAME_UPDATE
loc_1ca4:
%else
loc_1cd9:
%endif
    cmp dword [LINK_ADDRESS_130], 0
%if GAME_UPDATE
    je short loc_1d21
%else
    je short loc_1d56
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov eax, dword [nosplit eax*2 + LINK_ADDRESS_131]
    mov edi, dword [LINK_ADDRESS_134]
    mov eax, dword [eax]
    sub eax, edi
    test eax, eax
%if GAME_UPDATE
    jl short loc_1d21
%else
    jl short loc_1d56
%endif
    xor eax, eax
    call LINK_ADDRESS_135
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov eax, dword [nosplit eax*2 + LINK_ADDRESS_131]
    mov edx, dword [LINK_ADDRESS_134]
    mov edi, dword [eax]
    sub edi, edx
    mov edx, 1
    mov dword [eax], edi
    mov eax, LINK_ADDRESS_117
    mov dword [LINK_ADDRESS_115], edx
    mov dword [LINK_ADDRESS_116], eax
%if GAME_UPDATE
    jmp short loc_1d64
%else
    jmp short loc_1d99
%endif
%if GAME_UPDATE
loc_1d21:
%else
loc_1d56:
%endif
    cmp dword [LINK_ADDRESS_130], 0
%if GAME_UPDATE
    je short loc_1d42
%else
    je short loc_1d77
%endif
    mov ecx, 1
    mov esi, LINK_ADDRESS_118
    mov dword [LINK_ADDRESS_115], ecx
    mov dword [LINK_ADDRESS_116], esi
%if GAME_UPDATE
    jmp short loc_1d64
%else
    jmp short loc_1d99
%endif
%if GAME_UPDATE
loc_1d42:
%else
loc_1d77:
%endif
    mov edx, 1
    mov ebx, LINK_ADDRESS_136
    mov dword [LINK_ADDRESS_115], edx
    mov dword [LINK_ADDRESS_116], ebx
%if GAME_UPDATE
    jmp short loc_1d64
%else
    jmp short loc_1d99
%endif
%if GAME_UPDATE
loc_1d5a:
%else
loc_1d8f:
%endif
    mov eax, 0x64
    call LINK_ADDRESS_58
%if GAME_UPDATE
loc_1d64:
%else
loc_1d99:
%endif
    cmp dword [LINK_ADDRESS_115], 0
%if GAME_UPDATE
    je short loc_1d93
%else
    je short loc_1dc8
%endif
    cmp dword [LINK_ADDRESS_120], 0x64
%if GAME_UPDATE
    jg short loc_1d93
%else
    jg short loc_1dc8
%endif
    mov edx, dword [LINK_ADDRESS_116]
    xor ecx, ecx
    push edx
    mov edx, 0x64
    xor ebx, ebx
    mov eax, edx
    call LINK_ADDRESS_92
    inc dword [LINK_ADDRESS_120]
%if GAME_UPDATE
loc_1d93:
%else
loc_1dc8:
%endif
    cmp dword [LINK_ADDRESS_120], 0x64
%if GAME_UPDATE
    jle near loc_4370
%else
    jle near loc_41b3
%endif
    xor esi, esi
    mov dword [LINK_ADDRESS_120], esi
    mov dword [LINK_ADDRESS_115], esi
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_1db3:
%else
loc_1de8:
%endif
    mov eax, LINK_ADDRESS_137
    mov edx, 0x18
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0xa0
    call LINK_ADDRESS_45
    mov ecx, 3
    mov ebx, 0x14
    mov edx, 0x3c
    mov eax, 0xa0
    call LINK_ADDRESS_17
    mov dword [ebp - 8], eax
    test ax, ax
%if GAME_UPDATE
    jl short loc_1e07
%else
    jl short loc_1e3c
%endif
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
%if GAME_UPDATE
    jb near loc_4370
%else
    jb near loc_41b3
%endif
%if GAME_UPDATE
    jbe near loc_4370
%else
    jbe near loc_41b3
%endif
    db 0x66, 0x3d, 0x02, 0x00    ; cmp ax, 2
%if GAME_UPDATE
    jne near loc_4370
%else
    jne near loc_41b3
%endif
%if GAME_UPDATE
loc_1e07:
%else
loc_1e3c:
%endif
    xor eax, eax
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_1e13:
%else
loc_1e48:
%endif
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
    push 0x10
    mov ebx, 0x10000
    mov edx, 0xa0000
    push 0x999
    xor ecx, ecx
    mov eax, 0xa00000
    call LINK_ADDRESS_43
    mov eax, LINK_ADDRESS_84
    mov edx, 0xf
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0xa0
    call LINK_ADDRESS_45
    mov cx, word [LINK_ADDRESS_138]
    mov esi, 0x28
    cmp cx, 3
%if GAME_UPDATE
    je short loc_1e7d
%else
    je short loc_1eb2
%endif
    cmp cx, 4
%if GAME_UPDATE
    je short loc_1e7d
%else
    je short loc_1eb2
%endif
    cmp cx, 5
%if GAME_UPDATE
    jne short loc_1e84
%else
    jne short loc_1eb9
%endif
%if GAME_UPDATE
loc_1e7d:
%else
loc_1eb2:
%endif
    mov eax, 1
%if GAME_UPDATE
    jmp short loc_1e86
%else
    jmp short loc_1ebb
%endif
%if GAME_UPDATE
loc_1e84:
%else
loc_1eb9:
%endif
    xor eax, eax
%if GAME_UPDATE
loc_1e86:
%else
loc_1ebb:
%endif
    mov ecx, 0xa
    mov ebx, 0xf
    mov word [LINK_ADDRESS_4], ax
    movsx eax, si
    mov edx, 0x1f
    add eax, 6
    call LINK_ADDRESS_17
    mov dword [ebp - 8], eax
    cwde
    cmp eax, -1
%if GAME_UPDATE
    jne short loc_1ede
%else
    jne short loc_1f13
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    test byte [nosplit eax*2 + LINK_ADDRESS_7], 4
%if GAME_UPDATE
    je short loc_1ed7
%else
    je short loc_1f0c
%endif
    mov eax, 0x32
%if GAME_UPDATE
    jmp short loc_1ed9
%else
    jmp short loc_1f0e
%endif
%if GAME_UPDATE
loc_1ed7:
%else
loc_1f0c:
%endif
    xor eax, eax
%if GAME_UPDATE
loc_1ed9:
%else
loc_1f0e:
%endif
    call LINK_ADDRESS_58
%if GAME_UPDATE
loc_1ede:
%else
loc_1f13:
%endif
    cmp word [LINK_ADDRESS_4], 0
%if GAME_UPDATE
    jne near loc_1fac
%else
    jne near loc_1fe1
%endif
    mov ebx, dword [ebp - 8]
    cmp bx, 9
%if GAME_UPDATE
    ja near loc_1fac
%else
    ja near loc_1fe1
%endif
    xor eax, eax
    mov ax, bx
    jmp dword cs:[eax*4 + LINK_ADDRESS_139]
    mov eax, 1
    mov edi, dword [LINK_ADDRESS_140]
    sub eax, edi
    mov dword [LINK_ADDRESS_140], eax
%if GAME_UPDATE
    jmp near loc_1fac
%else
    jmp near loc_1fe1
%endif
    mov eax, 1
    mov ecx, dword [LINK_ADDRESS_141]
    sub eax, ecx
    mov dword [LINK_ADDRESS_141], eax
%if GAME_UPDATE
    jmp near loc_1fac
%else
    jmp near loc_1fe1
%endif
    mov eax, 1
    mov ebx, dword [LINK_ADDRESS_142]
    sub eax, ebx
    mov dword [LINK_ADDRESS_142], eax
%if GAME_UPDATE
    jmp short loc_1fac
%else
    jmp short loc_1fe1
%endif
    mov edi, dword [LINK_ADDRESS_1]
    cmp edi, 1
%if GAME_UPDATE
    jne short loc_1fac
%else
    jne short loc_1fe1
%endif
    mov edx, dword [LINK_ADDRESS_143]
    mov eax, edi
    sub eax, edx
    mov dword [LINK_ADDRESS_143], eax
%if GAME_UPDATE
    jmp short loc_1fac
%else
    jmp short loc_1fe1
%endif
    mov eax, 0x2bc
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp short loc_1fac
%else
    jmp short loc_1fe1
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    test byte [nosplit eax*2 + LINK_ADDRESS_7], 4
%if GAME_UPDATE
    je short loc_1f98
%else
    je short loc_1fcd
%endif
    call LINK_ADDRESS_144
%if GAME_UPDATE
    jmp short loc_1fac
%else
    jmp short loc_1fe1
%endif
%if GAME_UPDATE
loc_1f98:
%else
loc_1fcd:
%endif
    cmp dword [LINK_ADDRESS_145], 0
    sete al
    and eax, 0xff
    mov dword [LINK_ADDRESS_145], eax
%if GAME_UPDATE
loc_1fac:
%else
loc_1fe1:
%endif
    cmp dword [LINK_ADDRESS_140], 0
%if GAME_UPDATE
    je short loc_1fbc
%else
    je short loc_1ff1
%endif
    push LINK_ADDRESS_146
%if GAME_UPDATE
    jmp short loc_1fc1
%else
    jmp short loc_1ff6
%endif
%if GAME_UPDATE
loc_1fbc:
%else
loc_1ff1:
%endif
    push LINK_ADDRESS_147
%if GAME_UPDATE
loc_1fc1:
%else
loc_1ff6:
%endif
    mov edx, 0x1f
    movsx eax, si
    xor ecx, ecx
    xor ebx, ebx
    add eax, 0xc8
    call LINK_ADDRESS_45
    cmp dword [LINK_ADDRESS_141], 0
%if GAME_UPDATE
    je short loc_1fe7
%else
    je short loc_201c
%endif
    push LINK_ADDRESS_148
%if GAME_UPDATE
    jmp short loc_1fec
%else
    jmp short loc_2021
%endif
%if GAME_UPDATE
loc_1fe7:
%else
loc_201c:
%endif
    push LINK_ADDRESS_149
%if GAME_UPDATE
loc_1fec:
%else
loc_2021:
%endif
    mov edx, 0x2e
    movsx eax, si
    xor ecx, ecx
    xor ebx, ebx
    add eax, 0xc8
    call LINK_ADDRESS_45
    mov eax, dword [LINK_ADDRESS_142]
    cmp eax, 1
%if GAME_UPDATE
    jb short loc_2015
%else
    jb short loc_204a
%endif
%if GAME_UPDATE
    jbe short loc_2020
%else
    jbe short loc_2055
%endif
    cmp eax, 2
%if GAME_UPDATE
    je short loc_2027
%else
    je short loc_205c
%endif
%if GAME_UPDATE
    jmp short loc_2042
%else
    jmp short loc_2077
%endif
%if GAME_UPDATE
loc_2015:
%else
loc_204a:
%endif
    test eax, eax
%if GAME_UPDATE
    jne short loc_2042
%else
    jne short loc_2077
%endif
    push LINK_ADDRESS_149
%if GAME_UPDATE
    jmp short loc_202c
%else
    jmp short loc_2061
%endif
%if GAME_UPDATE
loc_2020:
%else
loc_2055:
%endif
    push LINK_ADDRESS_148
%if GAME_UPDATE
    jmp short loc_202c
%else
    jmp short loc_2061
%endif
%if GAME_UPDATE
loc_2027:
%else
loc_205c:
%endif
    push LINK_ADDRESS_150
%if GAME_UPDATE
loc_202c:
%else
loc_2061:
%endif
    mov edx, 0x3d
    movsx eax, si
    xor ecx, ecx
    xor ebx, ebx
    add eax, 0xc8
    call LINK_ADDRESS_45
%if GAME_UPDATE
loc_2042:
%else
loc_2077:
%endif
    push LINK_ADDRESS_151
    mov edx, 0x1f
    movsx edi, si
    xor ecx, ecx
    xor ebx, ebx
    mov eax, edi
    call LINK_ADDRESS_45
    push LINK_ADDRESS_152
    mov edx, 0x2e
    mov eax, edi
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_45
    push LINK_ADDRESS_153
    mov edx, 0x3d
    mov eax, edi
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_45
    push LINK_ADDRESS_154
    mov edx, 0x4c
    mov eax, edi
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_45
    push 0
    mov ecx, dword [ebp - 8]
    push 0
    cmp cx, 3
    sete al
    mov ecx, 0xfffffffc
    mov ebx, LINK_ADDRESS_155
    and eax, 0xff
    movsx edi, si
    push eax
    mov edx, 0x4c
    lea eax, [edi + 0xcf]
    call LINK_ADDRESS_156
    push LINK_ADDRESS_157
    mov edx, 0x5b
    mov eax, edi
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_45
    push 0
    mov edi, dword [ebp - 8]
    push 0
    cmp di, 4
    sete al
    mov ecx, 8
    and eax, 0xff
    mov ebx, LINK_ADDRESS_158
    push eax
    movsx eax, si
    mov edx, 0x5b
    add eax, 0xcf
    call LINK_ADDRESS_156
    cmp di, 4
%if GAME_UPDATE
    jne short loc_2140
%else
    jne short loc_2175
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [nosplit eax*2 + LINK_ADDRESS_159]
    mov eax, dword [LINK_ADDRESS_158]
    sar eax, 2
    call SETBRIGHTNESS
%if GAME_UPDATE
loc_2140:
%else
loc_2175:
%endif
    cmp dword [LINK_ADDRESS_1], 1
%if GAME_UPDATE
    jne near loc_21ef
%else
    jne near loc_2224
%endif
    call LINK_ADDRESS_161
    push LINK_ADDRESS_162
    mov edx, 0x6a
    sar eax, 0xa
    xor ecx, ecx
    xor ebx, ebx
    mov dword [ebp - 4], eax
    movsx eax, si
    call LINK_ADDRESS_45
    push 0
    mov ebx, dword [ebp - 8]
    push 0
    cmp bx, 5
    sete al
    mov ecx, 4
    lea ebx, [ebp - 4]
    and eax, 0xff
    movsx edi, si
    push eax
    mov edx, 0x6a
    lea eax, [edi + 0xcf]
    call LINK_ADDRESS_156
    movsx eax, word [ebp - 4]
    mov edx, 0x79
    shl eax, 0xa
    xor ecx, ecx
    call LINK_ADDRESS_163
    push LINK_ADDRESS_164
    xor ebx, ebx
    mov eax, edi
    call LINK_ADDRESS_45
    lea eax, [edi + 0xc8]
    cmp dword [LINK_ADDRESS_143], 0
%if GAME_UPDATE
    je short loc_21de
%else
    je short loc_2213
%endif
    push LINK_ADDRESS_148
    mov edx, 0x79
    xor ecx, ecx
%if GAME_UPDATE
    jmp near loc_2280
%else
    jmp near loc_22b5
%endif
%if GAME_UPDATE
loc_21de:
%else
loc_2213:
%endif
    push LINK_ADDRESS_149
    mov edx, 0x79
    xor ecx, ecx
%if GAME_UPDATE
    jmp near loc_2280
%else
    jmp near loc_22b5
%endif
%if GAME_UPDATE
loc_21ef:
%else
loc_2224:
%endif
    call LINK_ADDRESS_161
    push LINK_ADDRESS_162
    mov ecx, 1
    mov edx, 0x6a
    sar eax, 0xa
    xor ebx, ebx
    mov dword [ebp - 0xc], eax
    movsx eax, si
    call LINK_ADDRESS_45
    push 1
    mov edx, dword [ebp - 8]
    push 0
    cmp dx, 0x63
    sete al
    mov ecx, 4
    lea ebx, [ebp - 0xc]
    and eax, 0xff
    movsx edi, si
    push eax
    mov edx, 0x6a
    lea eax, [edi + 0xcf]
    call LINK_ADDRESS_156
    push LINK_ADDRESS_164
    mov ecx, 1
    mov edx, 0x79
    mov eax, edi
    xor ebx, ebx
    call LINK_ADDRESS_45
    mov ecx, dword [LINK_ADDRESS_143]
    lea eax, [edi + 0xc8]
    test ecx, ecx
%if GAME_UPDATE
    je short loc_2271
%else
    je short loc_22a6
%endif
    push LINK_ADDRESS_148
%if GAME_UPDATE
    jmp short loc_2276
%else
    jmp short loc_22ab
%endif
%if GAME_UPDATE
loc_2271:
%else
loc_22a6:
%endif
    push LINK_ADDRESS_149
%if GAME_UPDATE
loc_2276:
%else
loc_22ab:
%endif
    mov ecx, 1
    mov edx, 0x79
%if GAME_UPDATE
loc_2280:
%else
loc_22b5:
%endif
    xor ebx, ebx
    call LINK_ADDRESS_45
    push LINK_ADDRESS_165
    mov edx, 0x88
    movsx edi, si
    xor ecx, ecx
    xor ebx, ebx
    mov eax, edi
    call LINK_ADDRESS_45
    push LINK_ADDRESS_166
    mov ecx, 1
    mov edx, 0x97
    mov eax, edi
    xor ebx, ebx
    call LINK_ADDRESS_45
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    test byte [nosplit eax*2 + LINK_ADDRESS_7], 4
%if GAME_UPDATE
    je short loc_2313
%else
    je short loc_2348
%endif
    cmp dword [LINK_ADDRESS_145], 1
%if GAME_UPDATE
    je short loc_2313
%else
    je short loc_2348
%endif
    push LINK_ADDRESS_167
    mov ecx, 1
    mov edx, 0xa6
    mov eax, edi
    xor ebx, ebx
    call LINK_ADDRESS_45
    push LINK_ADDRESS_149
    mov ecx, 1
    mov edx, 0xa6
    lea eax, [edi + 0xc8]
%if GAME_UPDATE
    jmp near loc_4369
%else
    jmp near loc_41ac
%endif
%if GAME_UPDATE
loc_2313:
%else
loc_2348:
%endif
    push LINK_ADDRESS_167
    mov edx, 0xa6
    movsx esi, si
    xor ecx, ecx
    xor ebx, ebx
    mov eax, esi
    call LINK_ADDRESS_45
    mov edx, dword [LINK_ADDRESS_145]
    lea eax, [esi + 0xc8]
    cmp edx, 1
%if GAME_UPDATE
    jne short loc_234b
%else
    jne short loc_2380
%endif
    push LINK_ADDRESS_148
    mov edx, 0xa6
%if GAME_UPDATE
    jmp near loc_4367
%else
    jmp near loc_41aa
%endif
%if GAME_UPDATE
loc_234b:
%else
loc_2380:
%endif
    push LINK_ADDRESS_149
    mov edx, 0xa6
%if GAME_UPDATE
    jmp near loc_4367
%else
    jmp near loc_41aa
%endif
%if GAME_UPDATE
loc_235a:
%else
loc_238f:
%endif
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
    push 0x10
    mov ebx, 0x10000
    mov edx, 0x130000
    push 0x999
    xor ecx, ecx
    mov eax, 0xa00000
    call LINK_ADDRESS_43
    mov eax, LINK_ADDRESS_165
    mov edx, 0x18
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0xa0
    call LINK_ADDRESS_45
    mov di, word [LINK_ADDRESS_138]
    mov esi, 0x28
    cmp di, 2
%if GAME_UPDATE
    je short loc_23be
%else
    je short loc_23f3
%endif
    cmp di, 3
%if GAME_UPDATE
    jne short loc_23c5
%else
    jne short loc_23fa
%endif
%if GAME_UPDATE
loc_23be:
%else
loc_23f3:
%endif
    mov eax, 1
%if GAME_UPDATE
    jmp short loc_23c7
%else
    jmp short loc_23fc
%endif
%if GAME_UPDATE
loc_23c5:
%else
loc_23fa:
%endif
    xor eax, eax
%if GAME_UPDATE
loc_23c7:
%else
loc_23fc:
%endif
    mov ecx, 7
    mov ebx, 0x10
    mov edx, 0x32
    mov word [LINK_ADDRESS_4], ax
    movsx eax, si
    call LINK_ADDRESS_17
    mov dword [ebp - 8], eax
    inc eax
    db 0x66, 0x3d, 0x07, 0x00    ; cmp ax, 7
%if GAME_UPDATE
    ja near loc_25ce
%else
    ja near loc_2603
%endif
    and eax, 0xffff
    jmp dword cs:[eax*4 + LINK_ADDRESS_168]
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov cl, byte [eax + LINK_ADDRESS_7]
    test cl, 4
%if GAME_UPDATE
    je short loc_245e
%else
    je short loc_2493
%endif
    mov ch, cl
    and ch, 0xfe
    mov byte [eax + LINK_ADDRESS_7], ch
    cmp dword [LINK_ADDRESS_18], 2
%if GAME_UPDATE
    jge near loc_25d7
%else
    jge near loc_260c
%endif
    cmp dword [LINK_ADDRESS_19], 2
%if GAME_UPDATE
    je near loc_25d7
%else
    je near loc_260c
%endif
    mov byte [LINK_ADDRESS_21], 1
    mov eax, dword [LINK_ADDRESS_20]
    mov dword [TOTALCLOCK], eax
%if GAME_UPDATE
    jmp near loc_25d7
%else
    jmp near loc_260c
%endif
%if GAME_UPDATE
loc_245e:
%else
loc_2493:
%endif
    mov eax, 0xc8
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_25d7
%else
    jmp near loc_260c
%endif
    cmp dword [LINK_ADDRESS_169], 0xd
%if GAME_UPDATE
    je near loc_25d7
%else
    je near loc_260c
%endif
    mov eax, 1
%if GAME_UPDATE
    mov ecx, dword [0x1b8ab8]
%else
    mov edx, dword [0x1273a8]
%endif
%if GAME_UPDATE
    sub eax, ecx
%else
    sub eax, edx
%endif
    mov dword [LINK_ADDRESS_170], eax
%if GAME_UPDATE
    jne short loc_2498
%else
    jne short loc_24cd
%endif
    call LINK_ADDRESS_39
    call LINK_ADDRESS_171
%if GAME_UPDATE
loc_2498:
%else
loc_24cd:
%endif
    xor ebx, ebx
    mov word [LINK_ADDRESS_4], bx
%if GAME_UPDATE
    jmp near loc_25d7
%else
    jmp near loc_260c
%endif
    cmp byte [LINK_ADDRESS_172], 0
%if GAME_UPDATE
    je short loc_24bd
%else
    je short loc_24f2
%endif
    cmp word [NUMPLAYERS], 2
%if GAME_UPDATE
    jge near loc_252b
%else
    jge near loc_2560
%endif
%if GAME_UPDATE
loc_24bd:
%else
loc_24f2:
%endif
    cmp dword [LINK_ADDRESS_173], 0xd
%if GAME_UPDATE
    je short loc_252b
%else
    je short loc_2560
%endif
    mov eax, 1
%if GAME_UPDATE
    mov edi, dword [0x1b8ab4]
%else
    mov edx, dword [0x1273a4]
%endif
%if GAME_UPDATE
    sub eax, edi
%else
    sub eax, edx
%endif
    mov dword [LINK_ADDRESS_174], eax
%if GAME_UPDATE
    jne short loc_24e1
%else
    jne short loc_2516
%endif
    call LINK_ADDRESS_175
%if GAME_UPDATE
    jmp short loc_252b
%else
    jmp short loc_2560
%endif
%if GAME_UPDATE
loc_24e1:
%else
loc_2516:
%endif
    cmp dword [LINK_ADDRESS_19], 2
%if GAME_UPDATE
    je short loc_251c
%else
    je short loc_2551
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    test byte [nosplit eax*2 + LINK_ADDRESS_7], 4
%if GAME_UPDATE
    je short loc_251c
%else
    je short loc_2551
%endif
    xor eax, eax
    mov al, byte [LINK_ADDRESS_176]
    imul eax, eax, 0xd
    add eax, LINK_ADDRESS_177
%if GAME_UPDATE
    jmp short loc_2521
%else
    jmp short loc_2556
%endif
%if GAME_UPDATE
loc_251c:
%else
loc_2551:
%endif
    mov eax, LINK_ADDRESS_178
%if GAME_UPDATE
loc_2521:
%else
loc_2556:
%endif
    call LINK_ADDRESS_179
    call LINK_ADDRESS_180
%if GAME_UPDATE
loc_252b:
%else
loc_2560:
%endif
    xor edx, edx
    mov word [LINK_ADDRESS_4], dx
%if GAME_UPDATE
    jmp near loc_25d7
%else
    jmp near loc_260c
%endif
    cmp dword [LINK_ADDRESS_170], 0
%if GAME_UPDATE
    je short loc_255d
%else
    je short loc_2592
%endif
    cmp dword [LINK_ADDRESS_169], 0xd
%if GAME_UPDATE
    je short loc_255d
%else
    je short loc_2592
%endif
    mov eax, 1
%if GAME_UPDATE
    mov ebx, dword [0x1b8abc]
    sub eax, ebx
    mov dword [0x1b8abc], eax
loc_255d:
    xor edi, edi
    mov word [0x13bfc6], di
    jmp near loc_25d7
    cmp dword [0x1b8ab8], 0
    je short loc_258f
    cmp dword [0x1b8ce8], 0xd
    je short loc_258f
    mov eax, 1
    mov edi, dword [0x1b8ac0]
%else
    mov edi, dword [0x1273ac]
%endif
    sub eax, edi
    mov dword [LINK_ADDRESS_181], eax
%if GAME_UPDATE
loc_258f:
%else
loc_2592:
%endif
%if GAME_UPDATE
    xor ecx, ecx
%else
    xor edi, edi
%endif
%if GAME_UPDATE
    mov word [0x13bfc6], cx
%else
    mov word [0xf33ea], di
%endif
%if GAME_UPDATE
    jmp short loc_25d7
%else
    jmp near loc_260c
%endif
    cmp dword [LINK_ADDRESS_170], 0
%if GAME_UPDATE
    je short loc_25c3
%else
    je short loc_25c4
%endif
    cmp dword [LINK_ADDRESS_169], 0xd
%if GAME_UPDATE
    je short loc_25c3
%else
    je short loc_25c4
%endif
    mov eax, 1
    mov edx, dword [LINK_ADDRESS_182]
    sub eax, edx
%if GAME_UPDATE
    mov dword [0x1b8cb4], eax
    call 0x91c94
loc_25c3:
%else
    mov dword [0x1273b0], eax
loc_25c4:
    xor ecx, ecx
    mov word [0xf33ea], cx
    jmp short loc_260c
    cmp dword [0x1273a8], 0
    je short loc_25f8
    cmp dword [0x1275d8], 0xd
    je short loc_25f8
    mov eax, 1
    mov ecx, dword [0x1275a4]
    sub eax, ecx
    mov dword [0x1275a4], eax
    call 0x947d4
loc_25f8:
%endif
    xor ebx, ebx
    mov word [LINK_ADDRESS_4], bx
%if GAME_UPDATE
    jmp short loc_25d7
%else
    jmp short loc_260c
%endif
%if GAME_UPDATE
loc_25ce:
%else
loc_2603:
%endif
    mov word [LINK_ADDRESS_4], 1
%if GAME_UPDATE
loc_25d7:
%else
loc_260c:
%endif
    cmp dword [LINK_ADDRESS_170], 0
%if GAME_UPDATE
    je short loc_25f2
%else
    je short loc_2627
%endif
%if GAME_UPDATE
    mov ecx, dword [0x1b8ce8]
%else
    mov edx, dword [0x1275d8]
%endif
%if GAME_UPDATE
    cmp ecx, 0xd
%else
    cmp edx, 0xd
%endif
%if GAME_UPDATE
    je short loc_25f2
%else
    je short loc_2627
%endif
    push LINK_ADDRESS_148
%if GAME_UPDATE
    jmp short loc_2600
%else
    jmp short loc_2635
%endif
%if GAME_UPDATE
loc_25f2:
%else
loc_2627:
%endif
%if GAME_UPDATE
    mov edi, dword [0x1b8ce8]
%else
    mov ebx, dword [0x1275d8]
%endif
    push LINK_ADDRESS_149
%if GAME_UPDATE
    cmp edi, 0xd
%else
    cmp ebx, 0xd
%endif
%if GAME_UPDATE
loc_2600:
%else
loc_2635:
%endif
    sete al
    xor ah, ah
    mov edx, 0x32
    movsx ecx, ax
    movsx eax, si
    xor ebx, ebx
    add eax, 0xc8
%if GAME_UPDATE
    call 0x3e980
    cmp dword [0x1b8ab4], 0
    je short loc_2663
    cmp dword [0x1b8ce4], 0xd
    je short loc_2663
    cmp byte [0x7e7c], 0
    je short loc_2641
    cmp word [0x2f2924], 2
    jge short loc_2663
loc_2641:
    mov edx, dword [0x1b8ce4]
    push 0x2bc8
%else
    call 0x41610
    cmp dword [0x1273a4], 0
    je short loc_2698
    cmp dword [0x1275d4], 0xd
    je short loc_2698
    cmp byte [0x7e54], 0
    je short loc_2676
    cmp word [0x261214], 2
    jge short loc_2698
loc_2676:
    mov ebx, dword [0x1275d4]
    push 0x2bb8
    cmp ebx, 0xd
    sete al
    xor ah, ah
    mov edx, 0x42
    movsx ecx, ax
    movsx eax, si
    xor ebx, ebx
    jmp short loc_26b8
loc_2698:
    mov edx, dword [0x1275d4]
    push 0x2bbc
%endif
    cmp edx, 0xd
    sete al
    xor ah, ah
    xor ebx, ebx
    movsx ecx, ax
    movsx eax, si
    mov edx, 0x42
%if GAME_UPDATE
    jmp short loc_2683
loc_2663:
    mov edi, dword [0x1b8ce4]
    push 0x2bcc
    cmp edi, 0xd
    sete al
    xor ah, ah
    mov edx, 0x42
    movsx ecx, ax
    movsx eax, si
    xor ebx, ebx
loc_2683:
%else
loc_26b8:
%endif
    add eax, 0xc8
    call LINK_ADDRESS_45
%if GAME_UPDATE
    mov ebx, dword [0x1b8ce8]
%else
    mov ecx, dword [0x1275d8]
%endif
    push LINK_ADDRESS_183
%if GAME_UPDATE
    cmp ebx, 0xd
%else
    cmp ecx, 0xd
%endif
    sete al
    mov edx, 0x32
    xor ah, ah
    xor ebx, ebx
    movsx ecx, ax
    movsx eax, si
    call LINK_ADDRESS_45
%if GAME_UPDATE
    mov ecx, dword [0x1b8ce8]
%else
    mov edi, dword [0x1275d8]
%endif
    push LINK_ADDRESS_184
%if GAME_UPDATE
    cmp ecx, 0xd
%else
    cmp edi, 0xd
%endif
%if GAME_UPDATE
    je short loc_26cb
%else
    je short loc_2700
%endif
    cmp dword [LINK_ADDRESS_170], 0
%if GAME_UPDATE
    jne short loc_26d2
%else
    jne short loc_2707
%endif
%if GAME_UPDATE
loc_26cb:
%else
loc_2700:
%endif
    mov eax, 1
%if GAME_UPDATE
    jmp short loc_26d4
%else
    jmp short loc_2709
%endif
%if GAME_UPDATE
loc_26d2:
%else
loc_2707:
%endif
    xor eax, eax
%if GAME_UPDATE
loc_26d4:
%else
loc_2709:
%endif
    mov edx, 0x52
    movsx ecx, ax
    xor ebx, ebx
    movsx eax, si
    call LINK_ADDRESS_45
    mov eax, dword [LINK_ADDRESS_185]
    mov dword [ebp - 0x10], eax
%if GAME_UPDATE
    sar eax, 2
    mov edx, dword [0x1b8ab8]
    mov dword [0x1b8cd8], eax
    test edx, edx
    je short loc_2709
    cmp dword [0x1b8ce8], 0xd
    jne short loc_2710
loc_2709:
%else
    mov edx, eax
    sar edx, 2
    mov ebx, dword [0x1273a8]
    mov dword [0x1275c8], edx
    test ebx, ebx
    je short loc_2741
    cmp dword [0x1275d8], 0xd
    jne short loc_2748
loc_2741:
%endif
    mov eax, 1
%if GAME_UPDATE
    jmp short loc_2712
%else
    jmp short loc_274a
%endif
%if GAME_UPDATE
loc_2710:
%else
loc_2748:
%endif
    xor eax, eax
%if GAME_UPDATE
loc_2712:
%else
loc_274a:
%endif
    cwde
    push eax
%if GAME_UPDATE
    mov ecx, dword [0x1b8ce8]
%else
    mov edi, dword [0x1275d8]
%endif
    push 0
%if GAME_UPDATE
    cmp ecx, 0xd
%else
    cmp edi, 0xd
%endif
%if GAME_UPDATE
    je short loc_272c
%else
    je short loc_2764
%endif
    cmp word [ebp - 8], 2
%if GAME_UPDATE
    jne short loc_272c
%else
    jne short loc_2764
%endif
    mov al, 1
%if GAME_UPDATE
    jmp short loc_272e
%else
    jmp short loc_2766
%endif
%if GAME_UPDATE
loc_272c:
%else
loc_2764:
%endif
    xor al, al
%if GAME_UPDATE
loc_272e:
%else
loc_2766:
%endif
    mov ecx, 4
    and eax, 0xff
    mov ebx, LINK_ADDRESS_185
    push eax
    movsx eax, si
    mov edx, 0x52
    add eax, 0xcf
    call LINK_ADDRESS_156
    mov eax, dword [ebp - 0x10]
%if GAME_UPDATE
    mov edi, dword [0x1b8cd8]
%else
    mov edx, dword [0x1275c8]
%endif
%if GAME_UPDATE
    cmp eax, edi
%else
    cmp eax, edx
%endif
%if GAME_UPDATE
    je short loc_2769
%else
    je short loc_27a2
%endif
%if GAME_UPDATE
    lea eax, [edi*4]
%else
    lea ebx, [edx*4]
%endif
%if GAME_UPDATE
    mov dword [0x1b8cd8], eax
%else
    mov dword [0x1275c8], ebx
%endif
%if GAME_UPDATE
loc_2769:
%else
loc_27a2:
%endif
    mov eax, dword [ebp - 0x10]
    cmp eax, dword [LINK_ADDRESS_185]
%if GAME_UPDATE
    je short loc_2780
%else
    je short loc_27b9
%endif
    movsx eax, word [LINK_ADDRESS_185]
    call LINK_ADDRESS_186
%if GAME_UPDATE
loc_2780:
%else
loc_27b9:
%endif
%if GAME_UPDATE
    mov ebx, dword [0x1b8ce4]
%else
    mov edi, dword [0x1275d4]
%endif
    push LINK_ADDRESS_187
%if GAME_UPDATE
    cmp ebx, 0xd
%else
    cmp edi, 0xd
%endif
    sete al
    mov edx, 0x42
    xor ah, ah
    xor ebx, ebx
    movsx ecx, ax
    movsx eax, si
    call LINK_ADDRESS_45
%if GAME_UPDATE
    mov ecx, dword [0x1b8ce4]
%else
    mov eax, dword [0x1275d4]
%endif
    push LINK_ADDRESS_188
%if GAME_UPDATE
    cmp ecx, 0xd
%else
    cmp eax, 0xd
%endif
%if GAME_UPDATE
    je short loc_27d1
%else
    je short loc_2809
%endif
    cmp word [NUMPLAYERS], 1
%if GAME_UPDATE
    jle short loc_27c8
%else
    jle short loc_2800
%endif
    cmp byte [LINK_ADDRESS_172], 0
%if GAME_UPDATE
    jne short loc_27d1
%else
    jne short loc_2809
%endif
%if GAME_UPDATE
loc_27c8:
%else
loc_2800:
%endif
    cmp dword [LINK_ADDRESS_174], 0
%if GAME_UPDATE
    jne short loc_27d8
%else
    jne short loc_2810
%endif
%if GAME_UPDATE
loc_27d1:
%else
loc_2809:
%endif
    mov eax, 1
%if GAME_UPDATE
    jmp short loc_27da
%else
    jmp short loc_2812
%endif
%if GAME_UPDATE
loc_27d8:
%else
loc_2810:
%endif
    xor eax, eax
%if GAME_UPDATE
loc_27da:
%else
loc_2812:
%endif
    mov edx, 0x62
    movsx ecx, ax
    xor ebx, ebx
    movsx eax, si
    call LINK_ADDRESS_45
    mov eax, dword [LINK_ADDRESS_189]
    mov dword [ebp - 0x10], eax
%if GAME_UPDATE
    sar eax, 2
    mov dx, word [0x2f2924]
    mov dword [0x1b8cdc], eax
%else
    mov ebx, eax
    sar ebx, 2
    mov dx, word [0x261214]
    mov dword [0x1275cc], ebx
%endif
    cmp dx, 1
%if GAME_UPDATE
    jle short loc_2812
%else
    jle short loc_284d
%endif
    cmp byte [LINK_ADDRESS_172], 0
%if GAME_UPDATE
    jne short loc_2824
%else
    jne short loc_285f
%endif
%if GAME_UPDATE
loc_2812:
%else
loc_284d:
%endif
    cmp dword [LINK_ADDRESS_174], 0
%if GAME_UPDATE
    je short loc_2824
%else
    je short loc_285f
%endif
    cmp dword [LINK_ADDRESS_173], 0xd
%if GAME_UPDATE
    jne short loc_282b
%else
    jne short loc_2866
%endif
%if GAME_UPDATE
loc_2824:
%else
loc_285f:
%endif
    mov eax, 1
%if GAME_UPDATE
    jmp short loc_282d
%else
    jmp short loc_2868
%endif
%if GAME_UPDATE
loc_282b:
%else
loc_2866:
%endif
    xor eax, eax
%if GAME_UPDATE
loc_282d:
%else
loc_2868:
%endif
    cwde
    push eax
    mov bl, byte [LINK_ADDRESS_172]
    push 0
    test bl, bl
%if GAME_UPDATE
    je short loc_2845
%else
    je short loc_2880
%endif
    cmp word [NUMPLAYERS], 2
%if GAME_UPDATE
    jge short loc_2859
%else
    jge short loc_2894
%endif
%if GAME_UPDATE
loc_2845:
%else
loc_2880:
%endif
    cmp dword [LINK_ADDRESS_173], 0xd
%if GAME_UPDATE
    je short loc_2859
%else
    je short loc_2894
%endif
    cmp word [ebp - 8], 3
%if GAME_UPDATE
    jne short loc_2859
%else
    jne short loc_2894
%endif
    mov al, 1
%if GAME_UPDATE
    jmp short loc_285b
%else
    jmp short loc_2896
%endif
%if GAME_UPDATE
loc_2859:
%else
loc_2894:
%endif
    xor al, al
%if GAME_UPDATE
loc_285b:
%else
loc_2896:
%endif
    mov ecx, 4
    and eax, 0xff
    mov ebx, LINK_ADDRESS_189
    push eax
    movsx eax, si
    mov edx, 0x62
    add eax, 0xcf
    call LINK_ADDRESS_156
%if GAME_UPDATE
    mov edi, dword [0x1b8cdc]
%else
    mov edx, dword [0x1275cc]
%endif
%if GAME_UPDATE
    lea edi, [edi*4]
%else
    lea edx, [edx*4]
%endif
%if GAME_UPDATE
    mov dword [0x1b8cdc], edi
%else
    mov dword [0x1275cc], edx
%endif
%if GAME_UPDATE
    cmp edi, dword [ebp - 0x10]
%else
    cmp edx, dword [ebp - 0x10]
%endif
%if GAME_UPDATE
    je short loc_28a1
%else
    je short loc_28dc
%endif
    movsx eax, word [LINK_ADDRESS_189]
    call LINK_ADDRESS_190
%if GAME_UPDATE
loc_28a1:
%else
loc_28dc:
%endif
%if GAME_UPDATE
    mov ebx, dword [0x1b8ce8]
%else
    mov ecx, dword [0x1275d8]
%endif
    push LINK_ADDRESS_191
%if GAME_UPDATE
    cmp ebx, 0xd
%else
    cmp ecx, 0xd
%endif
%if GAME_UPDATE
    je short loc_28ba
%else
    je short loc_28f5
%endif
    cmp dword [LINK_ADDRESS_170], 0
%if GAME_UPDATE
    jne short loc_28c1
%else
    jne short loc_28fc
%endif
%if GAME_UPDATE
loc_28ba:
%else
loc_28f5:
%endif
    mov eax, 1
%if GAME_UPDATE
    jmp short loc_28c3
%else
    jmp short loc_28fe
%endif
%if GAME_UPDATE
loc_28c1:
%else
loc_28fc:
%endif
    xor eax, eax
%if GAME_UPDATE
loc_28c3:
%else
loc_28fe:
%endif
    mov edx, 0x72
    movsx ecx, ax
    xor ebx, ebx
    movsx eax, si
    call LINK_ADDRESS_45
%if GAME_UPDATE
    mov edi, dword [0x1b8ce8]
%else
    mov eax, dword [0x1275d8]
%endif
    push LINK_ADDRESS_192
%if GAME_UPDATE
    cmp edi, 0xd
%else
    cmp eax, 0xd
%endif
%if GAME_UPDATE
    je short loc_28ee
%else
    je short loc_2928
%endif
    cmp dword [LINK_ADDRESS_170], 0
%if GAME_UPDATE
    jne short loc_28f5
%else
    jne short loc_292f
%endif
%if GAME_UPDATE
loc_28ee:
%else
loc_2928:
%endif
    mov eax, 1
%if GAME_UPDATE
    jmp short loc_28f7
%else
    jmp short loc_2931
%endif
%if GAME_UPDATE
loc_28f5:
%else
loc_292f:
%endif
    xor eax, eax
%if GAME_UPDATE
loc_28f7:
%else
loc_2931:
%endif
    mov edx, 0x82
    movsx ecx, ax
    xor ebx, ebx
    movsx eax, si
    call LINK_ADDRESS_45
%if GAME_UPDATE
    mov edx, dword [0x1b8ce8]
%else
    mov ebx, dword [0x1275d8]
%endif
    push LINK_ADDRESS_193
%if GAME_UPDATE
    cmp edx, 0xd
%else
    cmp ebx, 0xd
%endif
%if GAME_UPDATE
    je short loc_2922
%else
    je short loc_295c
%endif
    cmp dword [LINK_ADDRESS_170], 0
%if GAME_UPDATE
    jne short loc_2929
%else
    jne short loc_2963
%endif
%if GAME_UPDATE
loc_2922:
%else
loc_295c:
%endif
    mov eax, 1
%if GAME_UPDATE
    jmp short loc_292b
%else
    jmp short loc_2965
%endif
%if GAME_UPDATE
loc_2929:
%else
loc_2963:
%endif
    xor eax, eax
%if GAME_UPDATE
loc_292b:
%else
loc_2965:
%endif
    mov edx, 0x92
    movsx ecx, ax
    xor ebx, ebx
    movsx eax, si
    call LINK_ADDRESS_45
    cmp dword [LINK_ADDRESS_194], 0
%if GAME_UPDATE
    je short loc_296a
%else
    je short loc_29a4
%endif
%if GAME_UPDATE
    mov edx, dword [0x1b8ce8]
%else
    mov ebx, dword [0x1275d8]
%endif
    push LINK_ADDRESS_148
%if GAME_UPDATE
    cmp edx, 0xd
%else
    cmp ebx, 0xd
%endif
%if GAME_UPDATE
    je short loc_295f
%else
    je short loc_2999
%endif
    cmp dword [LINK_ADDRESS_170], 0
%if GAME_UPDATE
    jne short loc_2966
%else
    jne short loc_29a0
%endif
%if GAME_UPDATE
loc_295f:
%else
loc_2999:
%endif
    mov eax, 1
%if GAME_UPDATE
    jmp short loc_298c
%else
    jmp short loc_29c5
%endif
%if GAME_UPDATE
loc_2966:
%else
loc_29a0:
%endif
    xor eax, eax
%if GAME_UPDATE
    jmp short loc_298c
%else
    jmp short loc_29c5
%endif
%if GAME_UPDATE
loc_296a:
%else
loc_29a4:
%endif
%if GAME_UPDATE
    mov edi, dword [0x1b8ce8]
%else
    mov eax, dword [0x1275d8]
%endif
    push LINK_ADDRESS_149
%if GAME_UPDATE
    cmp edi, 0xd
%else
    cmp eax, 0xd
%endif
%if GAME_UPDATE
    je short loc_2983
%else
    je short loc_29bc
%endif
    cmp dword [LINK_ADDRESS_170], 0
%if GAME_UPDATE
    jne short loc_298a
%else
    jne short loc_29c3
%endif
%if GAME_UPDATE
loc_2983:
%else
loc_29bc:
%endif
    mov eax, 1
%if GAME_UPDATE
    jmp short loc_298c
%else
    jmp short loc_29c5
%endif
%if GAME_UPDATE
loc_298a:
%else
loc_29c3:
%endif
    xor eax, eax
%if GAME_UPDATE
loc_298c:
%else
loc_29c5:
%endif
    mov edx, 0x72
    movsx ecx, ax
    movsx eax, si
    xor ebx, ebx
    add eax, 0xc8
    call LINK_ADDRESS_45
    cmp dword [LINK_ADDRESS_195], 0
%if GAME_UPDATE
    je short loc_29d0
%else
    je short loc_2a09
%endif
%if GAME_UPDATE
    mov edx, dword [0x1b8ce8]
%else
    mov ebx, dword [0x1275d8]
%endif
    push LINK_ADDRESS_148
%if GAME_UPDATE
    cmp edx, 0xd
%else
    cmp ebx, 0xd
%endif
%if GAME_UPDATE
    je short loc_29c5
%else
    je short loc_29fe
%endif
    cmp dword [LINK_ADDRESS_170], 0
%if GAME_UPDATE
    jne short loc_29cc
%else
    jne short loc_2a05
%endif
%if GAME_UPDATE
loc_29c5:
%else
loc_29fe:
%endif
    mov eax, 1
%if GAME_UPDATE
    jmp short loc_29f2
%else
    jmp short loc_2a2a
%endif
%if GAME_UPDATE
loc_29cc:
%else
loc_2a05:
%endif
    xor eax, eax
%if GAME_UPDATE
    jmp short loc_29f2
%else
    jmp short loc_2a2a
%endif
%if GAME_UPDATE
loc_29d0:
%else
loc_2a09:
%endif
%if GAME_UPDATE
    mov edi, dword [0x1b8ce8]
%else
    mov eax, dword [0x1275d8]
%endif
    push LINK_ADDRESS_149
%if GAME_UPDATE
    cmp edi, 0xd
%else
    cmp eax, 0xd
%endif
%if GAME_UPDATE
    je short loc_29e9
%else
    je short loc_2a21
%endif
    cmp dword [LINK_ADDRESS_170], 0
%if GAME_UPDATE
    jne short loc_29f0
%else
    jne short loc_2a28
%endif
%if GAME_UPDATE
loc_29e9:
%else
loc_2a21:
%endif
    mov eax, 1
%if GAME_UPDATE
    jmp short loc_29f2
%else
    jmp short loc_2a2a
%endif
%if GAME_UPDATE
loc_29f0:
%else
loc_2a28:
%endif
    xor eax, eax
%if GAME_UPDATE
loc_29f2:
%else
loc_2a2a:
%endif
    mov edx, 0x82
    movsx ecx, ax
    movsx eax, si
    xor ebx, ebx
    add eax, 0xc8
    call LINK_ADDRESS_45
    cmp dword [LINK_ADDRESS_196], 0
%if GAME_UPDATE
    je short loc_2a4b
%else
    je short loc_2a83
%endif
%if GAME_UPDATE
    mov edx, dword [0x1b8ce8]
%else
    mov ebx, dword [0x1275d8]
%endif
    push LINK_ADDRESS_148
%if GAME_UPDATE
    cmp edx, 0xd
%else
    cmp ebx, 0xd
%endif
%if GAME_UPDATE
    je short loc_2a2b
%else
    je short loc_2a63
%endif
    cmp dword [LINK_ADDRESS_170], 0
%if GAME_UPDATE
    jne short loc_2a32
%else
    jne short loc_2a6a
%endif
%if GAME_UPDATE
loc_2a2b:
%else
loc_2a63:
%endif
    mov eax, 1
%if GAME_UPDATE
    jmp short loc_2a34
%else
    jmp short loc_2a6c
%endif
%if GAME_UPDATE
loc_2a32:
%else
loc_2a6a:
%endif
    xor eax, eax
%if GAME_UPDATE
loc_2a34:
%else
loc_2a6c:
%endif
    mov edx, 0x92
    movsx ecx, ax
    movsx eax, si
    xor ebx, ebx
    add eax, 0xc8
%if GAME_UPDATE
    jmp near loc_436b
%else
    jmp near loc_41ae
%endif
%if GAME_UPDATE
loc_2a4b:
%else
loc_2a83:
%endif
%if GAME_UPDATE
    mov edi, dword [0x1b8ce8]
%else
    mov eax, dword [0x1275d8]
%endif
    push LINK_ADDRESS_149
%if GAME_UPDATE
    cmp edi, 0xd
%else
    cmp eax, 0xd
%endif
%if GAME_UPDATE
    je short loc_2a64
%else
    je short loc_2a9b
%endif
    cmp dword [LINK_ADDRESS_170], 0
%if GAME_UPDATE
    jne short loc_2a6b
%else
    jne short loc_2aa2
%endif
%if GAME_UPDATE
loc_2a64:
%else
loc_2a9b:
%endif
    mov eax, 1
%if GAME_UPDATE
    jmp short loc_2a6d
%else
    jmp short loc_2aa4
%endif
%if GAME_UPDATE
loc_2a6b:
%else
loc_2aa2:
%endif
    xor eax, eax
%if GAME_UPDATE
loc_2a6d:
%else
loc_2aa4:
%endif
    mov edx, 0x92
    movsx ecx, ax
    movsx eax, si
    xor ebx, ebx
    add eax, 0xc8
%if GAME_UPDATE
    jmp near loc_436b
%else
    jmp near loc_41ae
%endif
%if GAME_UPDATE
loc_2a84:
%else
loc_2abb:
%endif
    mov eax, 0x15f
%if GAME_UPDATE
    mov bl, 1
%else
    mov dh, 1
    call 0x3f2c0
    movsx eax, word [0x261216]
    mov byte [0x22748], dh
%endif
    mov edx, 0x10000
%if GAME_UPDATE
    call 0x3c5f0
    movsx eax, word [0x2f2926]
    mov byte [0x2e9c8], bl
    call 0x18710
%else
%endif
    mov ebx, 0x3e80
%if GAME_UPDATE
    mov eax, 0x2cac
    mov edx, dword [0x248eb0]
    call 0x3c610
    xor bh, bh
    mov byte [0x2e9c8], bh
    jmp near loc_4370
loc_2ac9:
    mov eax, 0x2cb8
%else
    call 0x18420
    mov eax, 0x2c9c
    mov edx, dword [0x1b77a0]
    call 0x3f2e0
    xor bl, bl
    mov byte [0x22748], bl
    jmp near loc_41b3
loc_2b00:
    mov eax, 0x2ca8
%endif
    xor edx, edx
    mov dword [LINK_ADDRESS_197], eax
    mov dword [LINK_ADDRESS_89], edx
    mov eax, 0x6e
    mov dword [LINK_ADDRESS_90], edx
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_2af0:
%else
loc_2b27:
%endif
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x4a
    mov esi, 0xa0
    mov ebx, 0x10000
    push 0
    mov edx, 0x640000
    xor ecx, ecx
    push 0x10
    movsx eax, si
    push 0x998
    shl eax, 0x10
    call LINK_ADDRESS_43
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0xa
    mov ebx, 0x10000
    push 0
    mov edx, 0x130000
    xor ecx, ecx
    push 0x10
    movsx eax, si
    push 0x999
    shl eax, 0x10
    call LINK_ADDRESS_43
    cmp dword [LINK_ADDRESS_12], 0x12c
%if GAME_UPDATE
    jne short loc_2b70
%else
    jne short loc_2ba7
%endif
    mov eax, LINK_ADDRESS_44
%if GAME_UPDATE
    jmp short loc_2b75
%else
    jmp short loc_2bac
%endif
%if GAME_UPDATE
loc_2b70:
%else
loc_2ba7:
%endif
    mov eax, LINK_ADDRESS_60
%if GAME_UPDATE
loc_2b75:
%else
loc_2bac:
%endif
    mov edx, 0x18
    xor ecx, ecx
    xor ebx, ebx
    push eax
    movsx eax, si
    call LINK_ADDRESS_45
    mov eax, dword [LINK_ADDRESS_12]
    cmp eax, 0x168
%if GAME_UPDATE
    jl near loc_2e20
%else
    jl near loc_2e58
%endif
    cmp eax, 0x171
%if GAME_UPDATE
    jg near loc_2e20
%else
    jg near loc_2e58
%endif
    mov edi, dword [LINK_ADDRESS_18]
    push edi
    push LINK_ADDRESS_198
    push LINK_ADDRESS_26
    call SPRINTF
    add esp, 0xc
    mov ebx, LINK_ADDRESS_26
    mov edx, 0x9e
    push 0x1a
    xor ecx, ecx
    mov eax, 0xa0
    call 0x10240
    mov eax, dword [LINK_ADDRESS_199]
    push eax
    mov eax, dword [LINK_ADDRESS_200]
    inc eax
    push eax
    mov eax, dword [LINK_ADDRESS_201]
    inc eax
    push eax
    push LINK_ADDRESS_202
    push LINK_ADDRESS_26
    call SPRINTF
    add esp, 0x14
    mov ebx, LINK_ADDRESS_26
    mov edx, 0xaa
    push 0x1a
    xor ecx, ecx
    mov eax, 0xa0
    call 0x10240
%if GAME_UPDATE
    mov eax, dword [0x121ea8]
%else
    mov ebx, dword [0xe54a8]
%endif
%if GAME_UPDATE
    sub eax, 0x168
%else
    sub ebx, 0x168
%endif
%if GAME_UPDATE
    imul eax, eax, 0x16
%else
    imul ebx, ebx, 0x16
%endif
    push 0x3e7
%if GAME_UPDATE
    mov ebx, 0x125b14
%else
%endif
    mov ecx, 0x13
    mov edx, 0xb8
%if GAME_UPDATE
    add ebx, eax
%else
%endif
    mov eax, 0xa0
%if GAME_UPDATE
    call 0x16080
%else
    add ebx, 0xe9114
    call 0x160c0
%endif
    movsx edx, ax
    cmp edx, -1
%if GAME_UPDATE
    jne short loc_2c99
%else
    jne short loc_2cd1
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov cl, 4
    mov esi, dword [LINK_ADDRESS_18]
    mov byte [nosplit eax*2 + LINK_ADDRESS_7], cl
    cmp esi, 2
%if GAME_UPDATE
    jge near loc_318f
%else
    jge near loc_31b8
%endif
    cmp dword [LINK_ADDRESS_19], 2
%if GAME_UPDATE
    je near loc_318f
%else
    je near loc_31b8
%endif
    mov ch, 1
    mov eax, dword [LINK_ADDRESS_20]
    mov byte [LINK_ADDRESS_21], ch
    mov dword [TOTALCLOCK], eax
%if GAME_UPDATE
    jmp near loc_318f
%else
    jmp near loc_31b8
%endif
%if GAME_UPDATE
loc_2c99:
%else
loc_2cd1:
%endif
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
%if GAME_UPDATE
    jne near loc_2d5a
%else
    jne near loc_2d92
%endif
    mov eax, dword [LINK_ADDRESS_12]
    sub eax, 0x168
    imul eax, eax, 0x16
    cmp byte [eax + LINK_ADDRESS_24], 0
%if GAME_UPDATE
    jne short loc_2ccd
%else
    jne short loc_2d05
%endif
    call LINK_ADDRESS_38
    mov eax, 0x15f
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_2d5a
%else
    jmp near loc_2d92
%endif
%if GAME_UPDATE
loc_2ccd:
%else
loc_2d05:
%endif
    mov al, byte [LINK_ADDRESS_12]
    mov edx, dword [LINK_ADDRESS_18]
    sub al, 0x68
    cmp edx, 1
%if GAME_UPDATE
    jle short loc_2ce8
%else
    jle short loc_2d20
%endif
    mov ah, 0xff
    sub ah, al
    movsx eax, ah
%if GAME_UPDATE
    jmp short loc_2ceb
%else
    jmp short loc_2d23
%endif
%if GAME_UPDATE
loc_2ce8:
%else
loc_2d20:
%endif
    movsx eax, al
%if GAME_UPDATE
loc_2ceb:
%else
loc_2d23:
%endif
    call LINK_ADDRESS_203
    mov ax, word [LINK_ADDRESS_12]
    db 0x81, 0xe8, 0x68, 0x01, 0x00, 0x00    ; sub eax, 0x168
    movsx edx, word [MYCONNECTINDEX]
    mov word [LINK_ADDRESS_23], ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dh, 4
    mov ebx, dword [LINK_ADDRESS_18]
    mov byte [nosplit eax*2 + LINK_ADDRESS_7], dh
    cmp ebx, 2
%if GAME_UPDATE
    jge short loc_2d48
%else
    jge short loc_2d80
%endif
    cmp dword [LINK_ADDRESS_19], 2
%if GAME_UPDATE
    je short loc_2d48
%else
    je short loc_2d80
%endif
    mov bl, 1
    mov eax, dword [LINK_ADDRESS_20]
    mov byte [LINK_ADDRESS_21], bl
    mov dword [TOTALCLOCK], eax
%if GAME_UPDATE
loc_2d48:
%else
loc_2d80:
%endif
    xor bh, bh
    mov byte [LINK_ADDRESS_29], bh
    mov eax, 0xf3
    call LINK_ADDRESS_57
%if GAME_UPDATE
loc_2d5a:
%else
loc_2d92:
%endif
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x4e
    push 0
    push -0x20
    mov ecx, 0x200
    mov ebx, 0x10000
    push 0x17ff
    mov edx, 0x610000
    mov eax, 0x650000
    call LINK_ADDRESS_43
    call LINK_ADDRESS_46
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    mov edx, dword [TOTALCLOCK]
    push eax
    sar edx, 3
    mov ebx, 7
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    push 0
    push 0
    push 0xa
    push 0
    push 0
    add edx, 0xafd
    push edx
    movsx edx, word [LINK_ADDRESS_138]
    lea eax, [edx*4]
    sub eax, edx
%if GAME_UPDATE
    lea edx, [eax*4]
    mov eax, dword [0x121ea8]
%else
    lea eax, [eax*4]
    lea edx, [eax + 0x32]
    mov eax, dword [0xe54a8]
%endif
    sub eax, 0x168
    imul eax, eax, 0x16
%if GAME_UPDATE
    movsx ebx, si
%else
%endif
    xor ecx, ecx
%if GAME_UPDATE
%else
    movsx ebx, si
    add eax, 0xe9114
%endif
    add ebx, 0x43
%if GAME_UPDATE
    add eax, 0x125b14
    add edx, 0x32
    call 0x9fcb0
%else
    call 0xa27f0
%endif
    lea eax, [eax*4]
    shl edx, 0x10
    add eax, ebx
    mov ebx, 0x5800
    shl eax, 0x10
    call LINK_ADDRESS_43
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_2e20:
%else
loc_2e58:
%endif
    mov ecx, 0xa
    mov ax, word [LINK_ADDRESS_138]
    mov ebx, 0xc
    mov word [LINK_ADDRESS_204], ax
    movsx eax, si
    mov edx, 0x36
    add eax, 0x44
    call LINK_ADDRESS_17
    mov ebx, dword [LINK_ADDRESS_12]
    mov dword [ebp - 8], eax
    cmp ebx, 0x12c
%if GAME_UPDATE
    jne near loc_2f4f
%else
    jne near loc_2f87
%endif
    movsx eax, word [LINK_ADDRESS_138]
    imul eax, eax, 0x16
    cmp byte [eax + LINK_ADDRESS_24], 0
%if GAME_UPDATE
    je near loc_2f32
%else
    je near loc_2f6a
%endif
    mov ax, word [LINK_ADDRESS_205]
    cmp ax, word [LINK_ADDRESS_138]
%if GAME_UPDATE
    je short loc_2ead
%else
    je short loc_2ee5
%endif
    push LINK_ADDRESS_206
    mov ecx, LINK_ADDRESS_207
    mov ebx, LINK_ADDRESS_48
    xor eax, eax
    mov edx, LINK_ADDRESS_49
    mov al, byte [LINK_ADDRESS_138]
    call LINK_ADDRESS_208
    mov ax, word [LINK_ADDRESS_138]
    mov word [LINK_ADDRESS_205], ax
%if GAME_UPDATE
loc_2ead:
%else
loc_2ee5:
%endif
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x4e
    push 0
    push -0x20
    mov ecx, 0x200
    mov ebx, 0x10000
    push 0x17fd
    mov edx, 0x610000
    mov eax, 0x650000
    call LINK_ADDRESS_43
    mov edi, dword [LINK_ADDRESS_206]
    push edi
    push LINK_ADDRESS_209
    push LINK_ADDRESS_26
    call SPRINTF
    add esp, 0xc
    mov ebx, LINK_ADDRESS_26
    mov edx, 0x9e
    push 0x1a
    xor ecx, ecx
    mov eax, 0xa0
    call 0x10240
    mov eax, dword [LINK_ADDRESS_207]
    push eax
    mov eax, dword [LINK_ADDRESS_48]
    inc eax
    push eax
    mov eax, dword [LINK_ADDRESS_49]
    inc eax
    push eax
    push LINK_ADDRESS_210
%if GAME_UPDATE
    jmp near loc_3038
%else
    jmp near loc_3070
%endif
%if GAME_UPDATE
loc_2f32:
%else
loc_2f6a:
%endif
    push LINK_ADDRESS_211
    mov edx, 0x46
    mov eax, 0x45
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_45
%if GAME_UPDATE
    jmp near loc_305d
%else
    jmp near loc_3095
%endif
%if GAME_UPDATE
loc_2f4f:
%else
loc_2f87:
%endif
    movsx eax, word [LINK_ADDRESS_138]
    imul eax, eax, 0x16
    cmp byte [eax + LINK_ADDRESS_24], 0
%if GAME_UPDATE
    je short loc_2fd5
%else
    je short loc_300d
%endif
    mov ax, word [LINK_ADDRESS_205]
    cmp ax, word [LINK_ADDRESS_138]
%if GAME_UPDATE
    je short loc_2f91
%else
    je short loc_2fc9
%endif
    push LINK_ADDRESS_206
    mov ecx, LINK_ADDRESS_207
    mov ebx, LINK_ADDRESS_48
    xor eax, eax
    mov edx, LINK_ADDRESS_49
    mov al, byte [LINK_ADDRESS_138]
    call LINK_ADDRESS_208
%if GAME_UPDATE
loc_2f91:
%else
loc_2fc9:
%endif
    mov ax, word [LINK_ADDRESS_138]
    mov word [LINK_ADDRESS_205], ax
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x4e
    push 0
    push -0x20
    mov ecx, 0x200
    mov ebx, 0x10000
    push 0x17fd
    mov edx, 0x610000
    mov eax, 0x650000
    call LINK_ADDRESS_43
%if GAME_UPDATE
    jmp short loc_2fed
%else
    jmp short loc_3025
%endif
%if GAME_UPDATE
loc_2fd5:
%else
loc_300d:
%endif
    push LINK_ADDRESS_211
    mov edx, 0x46
    mov eax, 0x45
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_45
%if GAME_UPDATE
loc_2fed:
%else
loc_3025:
%endif
    mov ecx, dword [LINK_ADDRESS_18]
    push ecx
    push LINK_ADDRESS_212
    push LINK_ADDRESS_26
    call SPRINTF
    add esp, 0xc
    mov ebx, LINK_ADDRESS_26
    mov edx, 0x9e
    push 0x1a
    xor ecx, ecx
    mov eax, 0xa0
    call 0x10240
    mov esi, dword [LINK_ADDRESS_199]
    mov eax, dword [LINK_ADDRESS_200]
    push esi
    inc eax
    push eax
    mov eax, dword [LINK_ADDRESS_201]
    inc eax
    push eax
    push LINK_ADDRESS_213
%if GAME_UPDATE
loc_3038:
%else
loc_3070:
%endif
    push LINK_ADDRESS_26
    call SPRINTF
    add esp, 0x14
    mov ebx, LINK_ADDRESS_26
    mov edx, 0xaa
    push 0x1a
    xor ecx, ecx
    mov eax, 0xa0
    call 0x10240
%if GAME_UPDATE
loc_305d:
%else
loc_3095:
%endif
    mov eax, dword [ebp - 8]
    inc eax
    db 0x66, 0x3d, 0x0a, 0x00    ; cmp ax, 0xa
%if GAME_UPDATE
    ja near loc_318f
%else
    ja near loc_31b8
%endif
    and eax, 0xffff
    jmp dword cs:[eax*4 + LINK_ADDRESS_214]
    cmp dword [LINK_ADDRESS_12], 0x12c
%if GAME_UPDATE
    jne short loc_30c6
%else
    jne short loc_30fe
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov cl, byte [eax + LINK_ADDRESS_7]
    test cl, 4
%if GAME_UPDATE
    jne short loc_30b9
%else
    jne short loc_30f1
%endif
    xor eax, eax
    call LINK_ADDRESS_58
    call LINK_ADDRESS_46
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_30b9:
%else
loc_30f1:
%endif
    mov ch, cl
    and ch, 0xfe
    mov byte [eax + LINK_ADDRESS_7], ch
%if GAME_UPDATE
    jmp short loc_30e5
%else
    jmp short loc_311d
%endif
%if GAME_UPDATE
loc_30c6:
%else
loc_30fe:
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov byte [nosplit eax*2 + LINK_ADDRESS_7], 4
%if GAME_UPDATE
loc_30e5:
%else
loc_311d:
%endif
    cmp dword [LINK_ADDRESS_18], 2
%if GAME_UPDATE
    jge near loc_318f
%else
    jge near loc_31b8
%endif
    cmp dword [LINK_ADDRESS_19], 2
%if GAME_UPDATE
    je near loc_318f
%else
    je near loc_31b8
%endif
    mov byte [LINK_ADDRESS_21], 1
    mov eax, dword [LINK_ADDRESS_20]
    mov dword [TOTALCLOCK], eax
    call LINK_ADDRESS_46
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
    cmp dword [LINK_ADDRESS_12], 0x12c
%if GAME_UPDATE
    jne short loc_314a
%else
    jne short loc_3182
%endif
    movsx eax, word [ebp - 8]
    imul edx, eax, 0x16
    cmp byte [edx + LINK_ADDRESS_24], 0
%if GAME_UPDATE
    je short loc_318f
%else
    je short loc_31b8
%endif
    add eax, 0x3e8
    mov dword [LINK_ADDRESS_12], eax
    call LINK_ADDRESS_46
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_314a:
%else
loc_3182:
%endif
    movsx edx, word [ebp - 8]
    imul ebx, edx, 0x16
%if GAME_UPDATE
    cmp byte [ebx + 0x125b14], 0
    je short loc_3170
%else
    mov ch, byte [ebx + 0xe9114]
    test ch, ch
    je short loc_319b
%endif
    add edx, 0x7d0
%if GAME_UPDATE
    mov dword [0x121ea8], edx
    call 0x3f1a0
    jmp near loc_4370
loc_3170:
    call 0x9c43c
%else
    jmp short loc_31b2
loc_319b:
    call 0x9ef7c
%endif
    add edx, 0x168
%if GAME_UPDATE
    xor ah, ah
    mov dword [0x121ea8], edx
    mov byte [0x7fec], ah
    mov byte [ebx + 0x125b14], ah
loc_318f:
    call 0x3f1a0
    jmp near loc_4370
loc_3199:
    cmp byte [0x353afb], 0
    jne short loc_31c6
    cmp byte [0x353adb], 0
    jne short loc_31c6
    cmp byte [0x353aea], 0
    jne short loc_31c6
    cmp byte [0x353af3], 0
    jne short loc_31c6
    cmp byte [0x353ad8], 0
    je short loc_320e
loc_31c6:
    xor bh, bh
    mov byte [0x353afb], bh
    mov byte [0x353adb], bh
    mov byte [0x353aea], bh
    mov byte [0x353af3], bh
    mov byte [0x353ad8], bh
    mov edx, dword [0x121ea8]
    dec edx
    mov dword [0x121ea8], edx
    cmp edx, 0x190
    jge near loc_32b6
    mov dword [0x121ea8], 0x191
    jmp near loc_32b6
loc_320e:
    cmp byte [0x353af4], 0
    jne short loc_325f
    cmp byte [0x353aac], 0
    jne short loc_325f
    cmp byte [0x353af8], 0
    jne short loc_325f
    cmp byte [0x353afc], 0
    jne short loc_325f
    cmp byte [0x353afa], 0
    jne short loc_325f
    cmp byte [0x353ae0], 0
    jne short loc_325f
    cmp byte [0x353ad9], 0
    jne short loc_325f
    cmp byte [0x353ac9], 0
    jne short loc_325f
    cmp byte [0x353add], 0
    je short loc_32b6
loc_325f:
%else
    mov byte [0x7fc4], ch
    mov byte [ebx + 0xe9114], ch
loc_31b2:
    mov dword [0xe54a8], edx
loc_31b8:
    call 0x41e30
    jmp near loc_41b3
loc_31c2:
    cmp byte [0x2c23eb], 0
    jne short loc_31ef
    cmp byte [0x2c23cb], 0
    jne short loc_31ef
    cmp byte [0x2c23da], 0
    jne short loc_31ef
    cmp byte [0x2c23e3], 0
    jne short loc_31ef
    cmp byte [0x2c23c8], 0
    je short loc_3237
loc_31ef:
%endif
    xor bl, bl
%if GAME_UPDATE
    mov byte [0x353af4], bl
    mov byte [0x353aac], bl
    mov byte [0x353afc], bl
    mov byte [0x353af8], bl
    mov byte [0x353add], bl
    mov byte [0x353ad9], bl
    mov byte [0x353ae0], bl
    mov byte [0x353afa], bl
    mov byte [0x353ac9], bl
    mov esi, dword [0x121ea8]
    inc esi
    mov dword [0x121ea8], esi
    cmp esi, 0x191
    jle short loc_32b6
    mov dword [0x121ea8], 0x190
loc_32b6:
    test byte [0x13bfcc], 2
    je short loc_3303
    movsx edx, word [0x2f2926]
%else
    mov byte [0x2c23eb], bl
    mov byte [0x2c23cb], bl
    mov byte [0x2c23da], bl
    mov byte [0x2c23e3], bl
    mov byte [0x2c23c8], bl
    mov ebx, dword [0xe54a8]
    dec ebx
    mov dword [0xe54a8], ebx
    cmp ebx, 0x190
    jge near loc_32df
    mov dword [0xe54a8], 0x191
    jmp near loc_32df
loc_3237:
    cmp byte [0x2c23e4], 0
    jne short loc_3288
    cmp byte [0x2c239c], 0
    jne short loc_3288
    cmp byte [0x2c23e8], 0
    jne short loc_3288
    cmp byte [0x2c23ec], 0
    jne short loc_3288
    cmp byte [0x2c23ea], 0
    jne short loc_3288
    cmp byte [0x2c23d0], 0
    jne short loc_3288
    cmp byte [0x2c23c9], 0
    jne short loc_3288
    cmp byte [0x2c23b9], 0
    jne short loc_3288
    cmp byte [0x2c23cd], 0
    je short loc_32df
loc_3288:
    xor dh, dh
    mov byte [0x2c23e4], dh
    mov byte [0x2c239c], dh
    mov byte [0x2c23ec], dh
    mov byte [0x2c23e8], dh
    mov byte [0x2c23cd], dh
    mov byte [0x2c23c9], dh
    mov byte [0x2c23d0], dh
    mov byte [0x2c23ea], dh
    mov byte [0x2c23b9], dh
    mov edi, dword [0xe54a8]
    inc edi
    mov dword [0xe54a8], edi
    cmp edi, 0x191
    jle short loc_32df
    mov dword [0xe54a8], 0x190
loc_32df:
    test byte [0xf33f0], 2
    je short loc_332c
    movsx edx, word [0x261216]
%endif
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    test byte [nosplit eax*2 + LINK_ADDRESS_7], 4
%if GAME_UPDATE
    je short loc_32f3
%else
    je short loc_331c
%endif
    mov eax, 0x32
    call LINK_ADDRESS_58
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
%if GAME_UPDATE
loc_32f3:
%else
loc_331c:
%endif
    xor eax, eax
    call LINK_ADDRESS_58
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
%if GAME_UPDATE
loc_3303:
%else
loc_332c:
%endif
    call LINK_ADDRESS_107
    mov eax, dword [LINK_ADDRESS_12]
    cmp eax, 0x190
%if GAME_UPDATE
    jb near loc_4370
%else
    jb near loc_41b3
%endif
    mov ebx, dword [XDIM]
    mov edx, dword [YDIM]
    dec ebx
    dec edx
    cmp eax, 0x190
%if GAME_UPDATE
    jbe short loc_3339
%else
    jbe short loc_3362
%endif
    cmp eax, 0x191
%if GAME_UPDATE
    je short loc_335f
%else
    je short loc_3388
%endif
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_3339:
%else
loc_3362:
%endif
    push edx
    push ebx
    push 0
    push 0
    push 0x5a
    push 0
    push 0
    xor ecx, ecx
    xor eax, eax
    push 0xcd0
    xor edx, edx
    mov ebx, 0x10000
    call LINK_ADDRESS_43
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_335f:
%else
loc_3388:
%endif
    push edx
    push ebx
    push 0
    push 0
    push 0x5a
    push 0
    push 0
    xor ecx, ecx
    xor eax, eax
    push 0x98d
    xor edx, edx
    mov ebx, 0x10000
    call LINK_ADDRESS_43
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_3385:
%else
loc_33ae:
%endif
    mov eax, dword [YDIM]
    dec eax
    push eax
%if GAME_UPDATE
    mov eax, dword [0x2d6bc8]
    dec eax
    push eax
    push 0
    push 0
    push 0xa
    push 0
    push 0x10
    mov ebx, 0x10000
    mov edx, 0x640000
    push 0x32
    xor ecx, ecx
    mov eax, 0xa00000
    call 0x6eb5e
    call 0x9c43c
    mov edx, dword [0x86d8]
    inc edx
    mov dword [0x86d8], edx
    cmp edx, 3
    jl near loc_4370
    call 0x9c3b0
    call 0x167c0
    test eax, eax
    jl short loc_3424
    mov ebx, 1
    movsx edx, word [0x2f2926]
    call 0x477e0
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8a, 0x3c, 0x45, 0xc2, 0x1a, 0x0f, 0x00    ; mov bh, byte [eax*2 + 0xf1ac2]
    xor ecx, ecx
    and bh, 0xfe
    mov dword [0x86d8], ecx
    db 0x88, 0x3c, 0x45, 0xc2, 0x1a, 0x0f, 0x00    ; mov byte [eax*2 + 0xf1ac2], bh
    jmp near loc_4370
loc_3424:
    mov eax, 0x1f2
    call 0x3c5f0
    jmp near loc_4370
loc_3433:
    mov eax, dword [0x2d6bc4]
    dec eax
    push eax
    mov eax, dword [0x2d6bc8]
    dec eax
    push eax
    push 0
    push 0
    push 0xa
    push 0
    push 0x10
    mov ebx, 0x10000
    mov edx, 0x640000
    push 0x33
    xor ecx, ecx
    mov eax, 0xa00000
    call 0x6eb5e
    cmp dword [0x7c14], 7
    jl short loc_3482
    mov eax, 0x2dbc
    mov edx, 0xd
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0xc8
    jmp short loc_3496
loc_3482:
    mov eax, 0x2de8
    mov edx, 0xd
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0x96
loc_3496:
    call 0x3eca0
    xor esi, esi
    jmp short loc_34a0
loc_349f:
    inc esi
loc_34a0:
    cmp si, 0x3e8
    jl short loc_349f
    call 0x9c43c
    mov ecx, dword [0x86d8]
    inc ecx
    mov dword [0x86d8], ecx
    cmp ecx, 3
    jl near loc_4370
    call 0x9c3b0
    mov eax, 0x2e04
    call 0x15ff0
    jmp near loc_4370
loc_34d6:
    mov eax, dword [0x2d6bc4]
    dec eax
    push eax
    mov eax, dword [0x2d6bc8]
    dec eax
    push eax
    push 0
    push 0
    push 0xa
    push 0
    push 0x10
    mov ebx, 0x10000
    mov edx, 0x640000
    push 0x32
    xor ecx, ecx
    mov eax, 0xa00000
    call 0x6eb5e
    cmp dword [0x7c10], 7
    jl short loc_3516
    mov eax, 0x2e08
    jmp short loc_351b
loc_3516:
    mov eax, 0x2e24
loc_351b:
    mov edx, 0xd
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0x96
    call 0x3eca0
    xor esi, esi
    jmp short loc_3534
loc_3533:
    inc esi
loc_3534:
    cmp si, 0x3e8
    jl short loc_3533
    call 0x9c43c
    mov edx, dword [0x86d8]
    inc edx
    mov dword [0x86d8], edx
    cmp edx, 3
    jl near loc_4370
    call 0x9c3b0
    mov eax, 0x2e04
    call 0x15ff0
    jmp near loc_4370
loc_356a:
    mov eax, dword [0x2d6bc4]
    dec eax
    push eax
    mov eax, dword [0x2d6bc8]
%else
    mov eax, dword [0x2454b8]
%endif
    dec eax
    push eax
    push 0
    push 0
    push 0xa
    push 0
    push 0x10
    mov ebx, 0x10000
    mov edx, 0x640000
    push 0x28a
    xor ecx, ecx
    mov eax, LINK_ADDRESS_215
    call LINK_ADDRESS_43
    mov edx, 0x7c
    mov eax, 0xba
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_17
    mov dword [ebp - 8], eax
    cwde
    cmp eax, -1
%if GAME_UPDATE
    je short loc_35cb
%else
    je short loc_340f
%endif
    cmp byte [LINK_ADDRESS_30], 0
%if GAME_UPDATE
    jne short loc_35cb
%else
    jne short loc_340f
%endif
    mov al, byte [LINK_ADDRESS_3]
    test al, 2
%if GAME_UPDATE
    je short loc_3626
%else
    je short loc_346a
%endif
%if GAME_UPDATE
loc_35cb:
%else
loc_340f:
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dh, byte [nosplit eax*2 + LINK_ADDRESS_7]
    and dh, 0xfe
    mov ecx, dword [LINK_ADDRESS_18]
    mov byte [nosplit eax*2 + LINK_ADDRESS_7], dh
    cmp ecx, 2
%if GAME_UPDATE
    jge near loc_4370
%else
    jge near loc_41b3
%endif
    cmp dword [LINK_ADDRESS_19], 2
%if GAME_UPDATE
    je near loc_4370
%else
    je near loc_41b3
%endif
    mov bl, 1
    mov eax, dword [LINK_ADDRESS_20]
    mov byte [LINK_ADDRESS_21], bl
    mov dword [TOTALCLOCK], eax
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_3626:
%else
loc_346a:
%endif
    cmp word [ebp - 8], 1
%if GAME_UPDATE
    je short loc_363e
%else
    je short loc_3482
%endif
    cmp byte [LINK_ADDRESS_37], 0
%if GAME_UPDATE
    jne short loc_363e
%else
    jne short loc_3482
%endif
    test al, 1
%if GAME_UPDATE
    je near loc_4370
%else
    je near loc_41b3
%endif
%if GAME_UPDATE
loc_363e:
%else
loc_3482:
%endif
    mov eax, LINK_ADDRESS_216
    call LINK_ADDRESS_217
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_364d:
%else
loc_3491:
%endif
    mov esi, 0xa0
    mov eax, 0x1a
    mov ebx, LINK_ADDRESS_218
    mov edx, 0x5a
    xor ecx, ecx
    push eax
    movsx eax, si
    call 0x10240
    mov eax, 0x1a
    mov ebx, LINK_ADDRESS_28
    mov edx, 0x63
    xor ecx, ecx
    push eax
    movsx eax, si
    call 0x10240
    cmp byte [LINK_ADDRESS_34], 0
%if GAME_UPDATE
    jne short loc_36b3
%else
    jne short loc_34f7
%endif
    cmp byte [LINK_ADDRESS_35], 0
%if GAME_UPDATE
    jne short loc_36b3
%else
    jne short loc_34f7
%endif
    cmp byte [LINK_ADDRESS_36], 0
%if GAME_UPDATE
    jne short loc_36b3
%else
    jne short loc_34f7
%endif
    cmp byte [LINK_ADDRESS_37], 0
%if GAME_UPDATE
    jne short loc_36b3
%else
    jne short loc_34f7
%endif
    test byte [LINK_ADDRESS_3], 1
%if GAME_UPDATE
    je short loc_36ec
%else
    je short loc_3530
%endif
%if GAME_UPDATE
loc_36b3:
%else
loc_34f7:
%endif
    call LINK_ADDRESS_38
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov byte [nosplit eax*2 + LINK_ADDRESS_7], 2
    cmp dword [LINK_ADDRESS_19], 1
%if GAME_UPDATE
    jne short loc_36e5
%else
    jne short loc_3529
%endif
    call LINK_ADDRESS_144
%if GAME_UPDATE
loc_36e5:
%else
loc_3529:
%endif
    xor eax, eax
    call LINK_ADDRESS_58
%if GAME_UPDATE
loc_36ec:
%else
loc_3530:
%endif
    mov edx, 0x7c
    mov eax, 0xba
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_17
    cwde
    cmp eax, -1
%if GAME_UPDATE
    je short loc_371b
%else
    je short loc_355f
%endif
    cmp byte [LINK_ADDRESS_30], 0
%if GAME_UPDATE
    jne short loc_371b
%else
    jne short loc_355f
%endif
    test byte [LINK_ADDRESS_3], 2
%if GAME_UPDATE
    je near loc_4370
%else
    je near loc_41b3
%endif
%if GAME_UPDATE
loc_371b:
%else
loc_355f:
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov bh, byte [nosplit eax*2 + LINK_ADDRESS_7]
    and bh, 0xfe
    mov edx, dword [LINK_ADDRESS_18]
    mov byte [nosplit eax*2 + LINK_ADDRESS_7], bh
    cmp edx, 2
%if GAME_UPDATE
    jge near loc_4370
%else
    jge near loc_41b3
%endif
    cmp dword [LINK_ADDRESS_19], 2
%if GAME_UPDATE
    je near loc_4370
%else
    je near loc_41b3
%endif
    mov cl, 1
    mov eax, dword [LINK_ADDRESS_20]
    mov byte [LINK_ADDRESS_21], cl
    mov dword [TOTALCLOCK], eax
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_3776:
%else
loc_35ba:
%endif
    call LINK_ADDRESS_219
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
    push 0x10
    mov ebx, 0x10000
    mov edx, 0x1d0000
    push 0x999
    xor ecx, ecx
    mov eax, 0xa00000
    call LINK_ADDRESS_43
%if GAME_UPDATE
    movsx eax, word [0x2f2926]
%else
    movsx edx, word [0x261216]
%endif
%if GAME_UPDATE
    mov edx, 0x125784
%else
    mov eax, 0xe8d84
%endif
%if GAME_UPDATE
    shl eax, 5
%else
    shl edx, 5
%endif
    xor ecx, ecx
    add eax, edx
    xor ebx, ebx
    push eax
    mov edx, 0x22
    mov eax, 0xa0
    call LINK_ADDRESS_45
    mov eax, LINK_ADDRESS_220
    push eax
    mov eax, LINK_ADDRESS_26
    push eax
    mov ebx, LINK_ADDRESS_26
    call SPRINTF
    add esp, 8
    mov eax, 0x1a
    mov edx, 0x32
    push eax
    xor ecx, ecx
    mov eax, 0xa0
    call 0x10240
    mov eax, 0x1a
    mov ebx, LINK_ADDRESS_221
    mov edx, 0x3b
    push eax
    xor ecx, ecx
    mov eax, 0xa0
    call 0x10240
    cmp byte [LINK_ADDRESS_29], 0
%if GAME_UPDATE
    je near loc_4370
%else
    je near loc_41b3
%endif
    xor al, al
    mov byte [LINK_ADDRESS_29], al
    mov eax, 0xf3
    call LINK_ADDRESS_57
    xor eax, eax
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_3849:
%else
loc_368d:
%endif
    cmp byte [LINK_ADDRESS_222], 0
%if GAME_UPDATE
    jne short loc_3874
%else
    jne short loc_36b8
%endif
    mov eax, LINK_ADDRESS_223
    call LINK_ADDRESS_224
    call LINK_ADDRESS_225
    cmp byte [LINK_ADDRESS_222], 0
%if GAME_UPDATE
    jne short loc_3874
%else
    jne short loc_36b8
%endif
    mov eax, 0x258
    call LINK_ADDRESS_58
%if GAME_UPDATE
loc_3874:
%else
loc_36b8:
%endif
    call LINK_ADDRESS_219
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
    mov ebx, 0x10000
    push 0x10
    mov edx, 0x130000
    xor ecx, ecx
    push 0x999
    mov eax, 0xa00000
    xor esi, esi
    call LINK_ADDRESS_43
    push LINK_ADDRESS_226
    mov edx, 0x18
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    mov dword [ebp - 8], esi
    call LINK_ADDRESS_45
%if GAME_UPDATE
    jmp near loc_3965
%else
    jmp near loc_37a9
%endif
%if GAME_UPDATE
loc_38ce:
%else
loc_3712:
%endif
    xor eax, eax
    mov al, byte [LINK_ADDRESS_227]
    cmp ax, di
%if GAME_UPDATE
    jne short loc_391b
%else
    jne short loc_375f
%endif
    movsx ebx, di
    mov esi, LINK_ADDRESS_228
    mov eax, ebx
    mov ecx, 0xf
    shl eax, 4
    mov edx, ebx
    add eax, ebx
    sar edx, 0x1f
    add esi, eax
    mov eax, ebx
    idiv ecx
    lea edx, [edx*8]
    lea edi, [edx + 0x20]
    mov edx, ebx
    mov eax, ebx
    sar edx, 0x1f
    idiv ecx
    imul eax, eax, 0x36
    push 0x1a
    mov ebx, esi
    mov edx, edi
    add eax, ecx
    xor ecx, ecx
%if GAME_UPDATE
    jmp short loc_395d
%else
    jmp short loc_37a1
%endif
%if GAME_UPDATE
loc_391b:
%else
loc_375f:
%endif
    movsx ebx, di
    mov ecx, 0xf
    mov eax, ebx
    mov edi, LINK_ADDRESS_228
    shl eax, 4
    mov edx, ebx
    add eax, ebx
    sar edx, 0x1f
    add edi, eax
    mov eax, ebx
    idiv ecx
    lea edx, [edx*8]
    lea esi, [edx + 0x20]
    mov edx, ebx
    mov eax, ebx
    sar edx, 0x1f
    idiv ecx
    imul eax, eax, 0x36
    push 0x1a
    mov ebx, edi
    mov edx, esi
    add eax, ecx
    mov ecx, 0x10
%if GAME_UPDATE
loc_395d:
%else
loc_37a1:
%endif
    call 0x105c0
    inc dword [ebp - 8]
%if GAME_UPDATE
loc_3965:
%else
loc_37a9:
%endif
    xor eax, eax
    mov edi, dword [ebp - 8]
    mov al, byte [LINK_ADDRESS_222]
    cmp ax, di
%if GAME_UPDATE
    jg near loc_38ce
%else
    jg near loc_3712
%endif
    mov al, byte [LINK_ADDRESS_138]
    mov byte [LINK_ADDRESS_227], al
    cmp byte [LINK_ADDRESS_64], 0
%if GAME_UPDATE
    jne short loc_39a9
%else
    jne short loc_37ed
%endif
    cmp byte [LINK_ADDRESS_65], 0
%if GAME_UPDATE
    jne short loc_39a9
%else
    jne short loc_37ed
%endif
    test byte [LINK_ADDRESS_3], 1
%if GAME_UPDATE
    je short loc_39d7
%else
    je short loc_381b
%endif
    cmp dword [LINK_ADDRESS_229], 0xffffff00
%if GAME_UPDATE
    jge short loc_39d7
%else
    jge short loc_381b
%endif
%if GAME_UPDATE
loc_39a9:
%else
loc_37ed:
%endif
    xor bh, bh
    mov byte [LINK_ADDRESS_64], bh
    mov byte [LINK_ADDRESS_65], bh
    mov ax, word [LINK_ADDRESS_138]
    sub eax, 0xf
    mov word [LINK_ADDRESS_138], ax
    test ax, ax
%if GAME_UPDATE
    jge short loc_39d7
%else
    jge short loc_381b
%endif
    mov ebx, eax
    add ebx, 0xf
    mov word [LINK_ADDRESS_138], bx
%if GAME_UPDATE
loc_39d7:
%else
loc_381b:
%endif
    cmp byte [LINK_ADDRESS_70], 0
%if GAME_UPDATE
    jne short loc_39fe
%else
    jne short loc_3842
%endif
    cmp byte [LINK_ADDRESS_74], 0
%if GAME_UPDATE
    jne short loc_39fe
%else
    jne short loc_3842
%endif
    test byte [LINK_ADDRESS_3], 1
%if GAME_UPDATE
    je short loc_3a35
%else
    je short loc_3879
%endif
    cmp dword [LINK_ADDRESS_229], 0x100
%if GAME_UPDATE
    jle short loc_3a35
%else
    jle short loc_3879
%endif
%if GAME_UPDATE
loc_39fe:
%else
loc_3842:
%endif
    xor dl, dl
    mov byte [LINK_ADDRESS_70], dl
    mov byte [LINK_ADDRESS_74], dl
    mov cx, word [LINK_ADDRESS_138]
    xor eax, eax
    add ecx, 0xf
    mov al, byte [LINK_ADDRESS_222]
    mov word [LINK_ADDRESS_138], cx
    cmp ax, cx
%if GAME_UPDATE
    jg short loc_3a35
%else
    jg short loc_3879
%endif
    mov edi, ecx
    sub edi, 0xf
    mov word [LINK_ADDRESS_138], di
%if GAME_UPDATE
loc_3a35:
%else
loc_3879:
%endif
    xor eax, eax
    xor ecx, ecx
    xor ebx, ebx
    xor edx, edx
    mov cl, byte [LINK_ADDRESS_222]
    mov word [LINK_ADDRESS_4], ax
    xor eax, eax
    call LINK_ADDRESS_17
    movsx edx, ax
    cmp edx, -1
%if GAME_UPDATE
    jne short loc_3a67
%else
    jne short loc_38ab
%endif
    mov eax, 0x258
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_3a67:
%else
loc_38ab:
%endif
    test ax, ax
%if GAME_UPDATE
    jl near loc_4370
%else
    jl near loc_41b3
%endif
    mov bl, 8
    mov al, byte [LINK_ADDRESS_105]
    mov esi, dword [LINK_ADDRESS_199]
    xor ecx, ecx
    mov byte [LINK_ADDRESS_26], bl
    mov dword [LINK_ADDRESS_89], ecx
    inc al
    mov ebx, 6
    mov byte [LINK_ADDRESS_230], al
    xor cl, cl
    mov dword [LINK_ADDRESS_90], ebx
    mov bh, 6
    mov byte [LINK_ADDRESS_231], cl
    mov byte [LINK_ADDRESS_52], bh
    cmp esi, 3
    sete al
    and eax, 0xff
    mov edi, dword [LINK_ADDRESS_232]
    mov dword [LINK_ADDRESS_101], eax
    test edi, edi
    sete al
    and eax, 0xff
    mov dword [LINK_ADDRESS_104], eax
    mov dword [LINK_ADDRESS_106], 1
    mov al, byte [LINK_ADDRESS_103]
    mov byte [LINK_ADDRESS_233], al
    mov al, byte [LINK_ADDRESS_101]
    mov byte [LINK_ADDRESS_234], al
    mov al, byte [LINK_ADDRESS_104]
    mov byte [LINK_ADDRESS_235], al
    mov al, byte [LINK_ADDRESS_106]
    mov byte [LINK_ADDRESS_236], al
    mov al, byte [LINK_ADDRESS_232]
    mov byte [LINK_ADDRESS_237], al
    mov al, byte [LINK_ADDRESS_238]
    movsx edx, word [LINK_ADDRESS_138]
    mov byte [LINK_ADDRESS_239], al
    mov eax, edx
    shl eax, 4
    add eax, edx
    add eax, LINK_ADDRESS_228
    call STRLEN
    movsx ebx, word [LINK_ADDRESS_138]
    mov edx, eax
    mov dword [ebp - 8], eax
    mov eax, ebx
    mov esi, LINK_ADDRESS_228
    shl eax, 4
    mov edi, LINK_ADDRESS_240
    add eax, ebx
    movsx ecx, dx
    add esi, eax
    cmp ecx, 4
%if GAME_UPDATE
    jae short loc_3b64
%else
    jae short loc_39a8
%endif
    test cl, 1
%if GAME_UPDATE
    je short loc_3b5d
%else
    je short loc_39a1
%endif
    db 0xa4    ; movsb byte es:[edi], byte [esi]
%if GAME_UPDATE
loc_3b5d:
%else
loc_39a1:
%endif
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw word es:[edi], word [esi]
%if GAME_UPDATE
    jmp short loc_3b8f
%else
    jmp short loc_39d3
%endif
%if GAME_UPDATE
loc_3b64:
%else
loc_39a8:
%endif
    test edi, 1
%if GAME_UPDATE
    je short loc_3b6e
%else
    je short loc_39b2
%endif
    db 0xa4    ; movsb byte es:[edi], byte [esi]
    dec ecx
%if GAME_UPDATE
loc_3b6e:
%else
loc_39b2:
%endif
    test edi, 2
%if GAME_UPDATE
    je short loc_3b7b
%else
    je short loc_39bf
%endif
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
    sub ecx, 2
%if GAME_UPDATE
loc_3b7b:
%else
loc_39bf:
%endif
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    test bl, 2
%if GAME_UPDATE
    je short loc_3b89
%else
    je short loc_39cd
%endif
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
%if GAME_UPDATE
loc_3b89:
%else
loc_39cd:
%endif
    test bl, 1
%if GAME_UPDATE
    je short loc_3b8f
%else
    je short loc_39d3
%endif
    db 0xa4    ; movsb byte es:[edi], byte [esi]
%if GAME_UPDATE
loc_3b8f:
%else
loc_39d3:
%endif
    movsx ecx, dx
    movsx edx, word [LINK_ADDRESS_138]
    mov eax, edx
    mov esi, LINK_ADDRESS_228
    shl eax, 4
    mov edi, LINK_ADDRESS_241
    add eax, edx
    inc ecx
    add esi, eax
    cmp ecx, 4
%if GAME_UPDATE
    jae short loc_3bbf
%else
    jae short loc_3a03
%endif
    test cl, 1
%if GAME_UPDATE
    je short loc_3bb8
%else
    je short loc_39fc
%endif
    db 0xa4    ; movsb byte es:[edi], byte [esi]
%if GAME_UPDATE
loc_3bb8:
%else
loc_39fc:
%endif
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw word es:[edi], word [esi]
%if GAME_UPDATE
    jmp short loc_3bea
%else
    jmp short loc_3a2e
%endif
%if GAME_UPDATE
loc_3bbf:
%else
loc_3a03:
%endif
    test edi, 1
%if GAME_UPDATE
    je short loc_3bc9
%else
    je short loc_3a0d
%endif
    db 0xa4    ; movsb byte es:[edi], byte [esi]
    dec ecx
%if GAME_UPDATE
loc_3bc9:
%else
loc_3a0d:
%endif
    test edi, 2
%if GAME_UPDATE
    je short loc_3bd6
%else
    je short loc_3a1a
%endif
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
    sub ecx, 2
%if GAME_UPDATE
loc_3bd6:
%else
loc_3a1a:
%endif
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    test bl, 2
%if GAME_UPDATE
    je short loc_3be4
%else
    je short loc_3a28
%endif
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
%if GAME_UPDATE
loc_3be4:
%else
loc_3a28:
%endif
    test bl, 1
%if GAME_UPDATE
    je short loc_3bea
%else
    je short loc_3a2e
%endif
    db 0xa4    ; movsb byte es:[edi], byte [esi]
%if GAME_UPDATE
loc_3bea:
%else
loc_3a2e:
%endif
    mov si, word [CONNECTHEAD]
%if GAME_UPDATE
    jmp short loc_3c1b
%else
    jmp short loc_3a5f
%endif
%if GAME_UPDATE
loc_3bf3:
%else
loc_3a37:
%endif
    cmp si, word [MYCONNECTINDEX]
%if GAME_UPDATE
    je short loc_3c10
%else
    je short loc_3a54
%endif
    movsx ebx, word [ebp - 8]
    mov edx, LINK_ADDRESS_26
    movsx eax, si
    add ebx, 0xa
    call SENDPACKET
%if GAME_UPDATE
loc_3c10:
%else
loc_3a54:
%endif
%if GAME_UPDATE
    movsx eax, si
%else
    movsx esi, si
%endif
%if GAME_UPDATE
    mov si, word [nosplit eax*2 + 0x2f2818]
%else
    mov si, word [nosplit esi*2 + 0x261108]
%endif
%if GAME_UPDATE
loc_3c1b:
%else
loc_3a5f:
%endif
    test si, si
%if GAME_UPDATE
    jge short loc_3bf3
%else
    jge short loc_3a37
%endif
    mov al, byte [LINK_ADDRESS_105]
    xor ebx, ebx
    inc al
    xor edx, edx
    mov bl, al
    xor eax, eax
    mov dl, byte [LINK_ADDRESS_90]
    mov al, byte [LINK_ADDRESS_89]
    call LINK_ADDRESS_110
    mov eax, 4
    call LINK_ADDRESS_33
%if GAME_UPDATE
    jmp near loc_4370
%else
    jmp near loc_41b3
%endif
%if GAME_UPDATE
loc_3c4e:
%else
loc_3a92:
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dl, byte [nosplit eax*2 + LINK_ADDRESS_7]
    mov esi, 0x28
    test dl, 4
%if GAME_UPDATE
    jne short loc_3c7b
%else
    jne short loc_3abf
%endif
    call LINK_ADDRESS_219
%if GAME_UPDATE
loc_3c7b:
%else
loc_3abf:
%endif
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
    push 0x10
    mov ebx, 0x10000
    mov edx, 0x1a0000
    push 0x999
    xor ecx, ecx
    mov eax, 0xa00000
    call LINK_ADDRESS_43
    movsx eax, word [MYCONNECTINDEX]
    shl eax, 5
    mov edx, 0x1f
    add eax, LINK_ADDRESS_242
    xor ecx, ecx
    push eax
    xor ebx, ebx
    mov eax, 0xa0
    call LINK_ADDRESS_45
    mov ecx, 8
    mov ebx, 0x10
    mov edx, 0x31
    movsx eax, si
    call LINK_ADDRESS_17
    inc eax
    db 0x66, 0x3d, 0x08, 0x00    ; cmp ax, 8
%if GAME_UPDATE
    ja near loc_3d3f
%else
    ja near loc_3b85
%endif
    and eax, 0xffff
%if GAME_UPDATE
    jmp dword cs:[eax*4 + 0x2f66c]
    xor edx, edx
    mov dword [0x1261bf], edx
    movsx edx, word [0x2f2926]
%else
    jmp dword cs:[eax*4 + 0x322fc]
    movsx edx, word [0x261216]
%endif
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
%if GAME_UPDATE
    db 0xf6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x04    ; test byte [eax*2 + 0xf1ac2], 4
    je short loc_3d38
%else
    xor ecx, ecx
    db 0x8a, 0x14, 0x45, 0xa2, 0x52, 0x0b, 0x00    ; mov dl, byte [eax*2 + 0xb52a2]
    mov dword [0xe97bf], ecx
    test dl, 4
    je short loc_3b7e
%endif
    mov eax, 0x32
    call LINK_ADDRESS_58
%if GAME_UPDATE
    jmp near loc_3d3f
%else
    jmp near loc_3b85
%endif
%if GAME_UPDATE
loc_3d38:
%else
loc_3b7e:
%endif
    xor eax, eax
    call LINK_ADDRESS_58
%if GAME_UPDATE
loc_3d3f:
%else
loc_3b85:
%endif
%if GAME_UPDATE
    mov ebx, dword [0x125d43]
%else
    mov edi, dword [0xe9343]
%endif
    add esi, 0x28
%if GAME_UPDATE
    cmp ebx, 1
%else
    cmp edi, 1
%endif
%if GAME_UPDATE
    jne near loc_40fb
%else
    jne near loc_3f3e
%endif
    push 0x1a
%if GAME_UPDATE
    mov ebx, 0x2e88
    jmp near loc_4110
    mov ecx, dword [0x125d43]
    inc ecx
    mov dword [0x125d43], ecx
    cmp ecx, 3
    jne short loc_3d3f
    xor eax, eax
    mov dword [0x125d43], eax
    jmp short loc_3d3f
    mov eax, dword [0x1261db]
%else
    mov ebx, 0x2df8
    jmp near loc_3f53
    mov eax, dword [0xe9343]
%endif
    inc eax
%if GAME_UPDATE
    mov dword [0x1261db], eax
    cmp eax, 2
    jle short loc_3d90
    xor ebx, ebx
    mov dword [0x1261db], ebx
loc_3d90:
    mov ecx, dword [0x1261db]
    test ecx, ecx
    jne short loc_3da9
    cmp dword [0x1261d7], 6
    jle short loc_3da9
    mov dword [0x1261d7], ecx
loc_3da9:
    cmp dword [0x1261d7], 0xa
    jle short loc_3d3f
    xor ebx, ebx
    mov dword [0x1261d7], ebx
    jmp short loc_3d3f
    mov edi, dword [0x1261d7]
    inc edi
    mov eax, dword [0x1261db]
    mov dword [0x1261d7], edi
    test eax, eax
    jne short loc_3ddc
    cmp edi, 6
    jle short loc_3ddc
    mov dword [0x1261d7], eax
loc_3ddc:
    cmp dword [0x1261d7], 0xa
    jle near loc_3d3f
    xor edi, edi
    mov dword [0x1261d7], edi
    jmp near loc_3d3f
    cmp dword [0x1261c3], 1
    jne short loc_3e10
    cmp dword [0x1261d3], 0
    jle short loc_3e10
    xor ebx, ebx
    mov dword [0x1261c3], ebx
loc_3e10:
    mov ecx, dword [0x1261c3]
    test ecx, ecx
    jne short loc_3e43
    mov eax, dword [0x1261d3]
    inc eax
    mov dword [0x1261d3], eax
%else
    mov dword [0xe9343], eax
%endif
    cmp eax, 3
%if GAME_UPDATE
    jle near loc_3d3f
    mov dword [0x1261d3], ecx
    mov dword [0x1261c3], 1
    jmp near loc_3d3f
loc_3e43:
%else
    jne short loc_3b85
    xor ebx, ebx
    mov dword [0xe9343], ebx
    jmp short loc_3b85
    mov ebx, dword [0xe97db]
    inc ebx
    mov dword [0xe97db], ebx
    cmp ebx, 2
    jle short loc_3bd7
%endif
    xor edi, edi
%if GAME_UPDATE
    mov dword [0x1261c3], edi
    jmp near loc_3d3f
    cmp dword [0x125d43], 0
    jne near loc_3d3f
    cmp dword [0x1261ef], 0
%else
    mov dword [0xe97db], edi
loc_3bd7:
    mov eax, dword [0xe97db]
    test eax, eax
    jne short loc_3bee
    cmp dword [0xe97d7], 6
    jle short loc_3bee
    mov dword [0xe97d7], eax
loc_3bee:
    cmp dword [0xe97d7], 0xa
    jle short loc_3b85
    xor edi, edi
    mov dword [0xe97d7], edi
    jmp short loc_3b85
    mov edx, dword [0xe97d7]
    inc edx
    mov ebx, dword [0xe97db]
    mov dword [0xe97d7], edx
    test ebx, ebx
    jne short loc_3c23
    cmp edx, 6
    jle short loc_3c23
    mov dword [0xe97d7], ebx
loc_3c23:
    cmp dword [0xe97d7], 0xa
    jle near loc_3b85
    xor edx, edx
    mov dword [0xe97d7], edx
    jmp near loc_3b85
    cmp dword [0xe97c3], 1
    jne short loc_3c57
    cmp dword [0xe97d3], 0
    jle short loc_3c57
    xor edi, edi
    mov dword [0xe97c3], edi
loc_3c57:
    mov eax, dword [0xe97c3]
    test eax, eax
    jne short loc_3c8a
    mov ebx, dword [0xe97d3]
    inc ebx
    mov dword [0xe97d3], ebx
    cmp ebx, 3
    jle near loc_3b85
    mov dword [0xe97d3], eax
    mov dword [0xe97c3], 1
    jmp near loc_3b85
loc_3c8a:
    xor edx, edx
    mov dword [0xe97c3], edx
    jmp near loc_3b85
    cmp dword [0xe9343], 0
    jne near loc_3b85
    cmp dword [0xe97ef], 0
%endif
    sete al
    and eax, 0xff
    mov dword [LINK_ADDRESS_238], eax
%if GAME_UPDATE
    jmp near loc_3d3f
%else
    jmp near loc_3b85
%endif
    cmp dword [LINK_ADDRESS_232], 1
%if GAME_UPDATE
    jne near loc_3d3f
%else
    jne near loc_3b85
%endif
    cmp dword [LINK_ADDRESS_243], 0
    sete al
    and eax, 0xff
    mov dword [LINK_ADDRESS_243], eax
%if GAME_UPDATE
    jmp near loc_3d3f
%else
    jmp near loc_3b85
%endif
    cmp byte [LINK_ADDRESS_241], 0
%if GAME_UPDATE
    je near loc_3d3f
%else
    je near loc_3b85
%endif
    mov bh, 5
%if GAME_UPDATE
    mov eax, 7
%else
    mov edx, 7
%endif
    mov cl, 7
%if GAME_UPDATE
    mov esi, dword [0x1261d3]
    xor edx, edx
    mov byte [0xf88c0], bh
    mov dword [0x1261d7], eax
    mov byte [0xf88c1], cl
    mov dword [0x1261db], edx
    mov dword [0x1261eb], edx
    mov ebx, 7
    xor ch, ch
    mov al, byte [0x1261d3]
    mov byte [0xf88c2], ch
%else
    mov al, byte [0xe97d3]
    mov edi, dword [0xe97d3]
    mov byte [0xbc0a0], bh
    mov dword [0xe97d7], edx
    mov byte [0xbc0a1], cl
%endif
    inc al
%if GAME_UPDATE
    mov dword [0x1261e7], ebx
    mov byte [0xf88c3], al
    cmp esi, 3
%else
    mov dword [0xe97e7], edx
    mov byte [0xbc0a3], al
    xor ebx, ebx
    xor ch, ch
    mov dword [0xe97db], ebx
    mov byte [0xbc0a2], ch
    mov dword [0xe97eb], ebx
    cmp edi, 3
%endif
    sete al
    and eax, 0xff
%if GAME_UPDATE
    mov edi, dword [0x125d43]
%else
    mov edx, dword [0xe9343]
%endif
    mov dword [LINK_ADDRESS_101], eax
%if GAME_UPDATE
    test edi, edi
%else
    test edx, edx
%endif
    sete al
    and eax, 0xff
%if GAME_UPDATE
    mov dword [0x1261b3], eax
    mov dword [0x1261bb], 1
    mov al, byte [0x1261c3]
    mov byte [0xf88c4], al
    mov al, byte [0x1261b7]
    mov byte [0xf88c5], al
    mov al, byte [0x1261b3]
    mov byte [0xf88c6], al
    mov al, byte [0x1261bb]
    mov byte [0xf88c7], al
    mov al, byte [0x125d43]
    mov byte [0xf88c8], al
    mov al, byte [0x1261ef]
    mov byte [0xf88c9], al
    mov al, byte [0x1261cb]
    mov si, word [0x2f2920]
    mov byte [0xf88ca], al
    jmp short loc_3faa
loc_3f74:
%else
    mov dword [0xe97b3], eax
    mov al, byte [0xe97c3]
    mov byte [0xbc0a4], al
    mov al, byte [0xe97b7]
    mov ebx, 1
    mov byte [0xbc0a5], al
    mov al, byte [0xe97b3]
    mov dword [0xe97bb], ebx
    mov byte [0xbc0a6], al
    mov al, byte [0xe97bb]
    mov byte [0xbc0a7], al
    mov al, byte [0xe9343]
    mov byte [0xbc0a8], al
    mov al, byte [0xe97ef]
    mov byte [0xbc0a9], al
    mov al, byte [0xe97cb]
    mov si, word [0x261210]
    mov byte [0xbc0aa], al
    jmp short loc_3dee
loc_3db8:
%endif
    movsx ecx, si
    mov eax, ecx
    call LINK_ADDRESS_244
    mov eax, ecx
    call LINK_ADDRESS_245
    cmp si, word [MYCONNECTINDEX]
%if GAME_UPDATE
    je short loc_3f9f
%else
    je short loc_3de3
%endif
    mov ebx, 0xb
    mov edx, LINK_ADDRESS_26
    mov eax, ecx
    call SENDPACKET
%if GAME_UPDATE
loc_3f9f:
%else
loc_3de3:
%endif
    movsx esi, si
    mov si, word [nosplit esi*2 + CONNECTPOINT2]
%if GAME_UPDATE
loc_3faa:
%else
loc_3dee:
%endif
    test si, si
%if GAME_UPDATE
    jge short loc_3f74
%else
    jge short loc_3db8
%endif
    mov al, byte [LINK_ADDRESS_105]
    xor ebx, ebx
    inc al
    xor edx, edx
    mov bl, al
    xor eax, eax
    mov dl, byte [LINK_ADDRESS_90]
    mov al, byte [LINK_ADDRESS_89]
    call LINK_ADDRESS_110
    mov eax, 4
    call LINK_ADDRESS_33
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov al, byte [LINK_ADDRESS_90]
    mov byte [LINK_ADDRESS_52], al
    mov al, byte [LINK_ADDRESS_89]
    mov dh, 5
    mov byte [LINK_ADDRESS_231], al
    mov al, byte [LINK_ADDRESS_105]
%if GAME_UPDATE
    mov ecx, dword [0x1261d3]
%else
    mov esi, dword [0xe97d3]
%endif
    inc al
    mov byte [LINK_ADDRESS_26], dh
    mov byte [LINK_ADDRESS_230], al
%if GAME_UPDATE
    cmp ecx, 3
%else
    cmp esi, 3
%endif
    sete al
    and eax, 0xff
%if GAME_UPDATE
    mov esi, dword [0x125d43]
%else
    mov edi, dword [0xe9343]
%endif
    mov dword [LINK_ADDRESS_101], eax
%if GAME_UPDATE
    test esi, esi
%else
    test edi, edi
%endif
    sete al
    and eax, 0xff
%if GAME_UPDATE
    mov dword [0x1261b3], eax
    mov al, byte [0x1261c3]
    mov byte [0xf88c4], al
    mov al, byte [0x1261b7]
    mov edi, 1
    mov byte [0xf88c5], al
    mov al, byte [0x1261b3]
    mov dword [0x1261bb], edi
    mov byte [0xf88c6], al
    mov al, byte [0x1261bb]
    mov byte [0xf88c7], al
    mov al, byte [0x125d43]
    mov byte [0xf88c8], al
    mov al, byte [0x1261ef]
    mov byte [0xf88c9], al
    mov al, byte [0x1261cb]
    mov si, word [0x2f2920]
    mov byte [0xf88ca], al
    jmp short loc_40c4
loc_408e:
%else
    mov dword [0xe97b3], eax
    mov dword [0xe97bb], 1
    mov al, byte [0xe97c3]
    mov byte [0xbc0a4], al
    mov al, byte [0xe97b7]
    mov byte [0xbc0a5], al
    mov al, byte [0xe97b3]
    mov byte [0xbc0a6], al
    mov al, byte [0xe97bb]
    mov byte [0xbc0a7], al
    mov al, byte [0xe9343]
    mov byte [0xbc0a8], al
    mov al, byte [0xe97ef]
    mov byte [0xbc0a9], al
    mov al, byte [0xe97cb]
    mov si, word [0x261210]
    mov byte [0xbc0aa], al
    jmp short loc_3f07
loc_3ed1:
%endif
    movsx ecx, si
    mov eax, ecx
    call LINK_ADDRESS_244
    mov eax, ecx
    call LINK_ADDRESS_245
    cmp si, word [MYCONNECTINDEX]
%if GAME_UPDATE
    je short loc_40b9
%else
    je short loc_3efc
%endif
    mov ebx, 0xb
    mov edx, LINK_ADDRESS_26
    mov eax, ecx
    call SENDPACKET
%if GAME_UPDATE
loc_40b9:
%else
loc_3efc:
%endif
    movsx eax, si
    mov si, word [nosplit eax*2 + CONNECTPOINT2]
%if GAME_UPDATE
loc_40c4:
%else
loc_3f07:
%endif
    test si, si
%if GAME_UPDATE
    jge short loc_408e
%else
    jge short loc_3ed1
%endif
    mov al, byte [LINK_ADDRESS_105]
    xor ebx, ebx
    inc al
    xor edx, edx
    mov bl, al
    xor eax, eax
    mov dl, byte [LINK_ADDRESS_90]
    mov al, byte [LINK_ADDRESS_89]
    call LINK_ADDRESS_110
    mov eax, 4
    call LINK_ADDRESS_33
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
%if GAME_UPDATE
loc_40fb:
%else
loc_3f3e:
%endif
%if GAME_UPDATE
    cmp ebx, 2
%else
    cmp edi, 2
%endif
%if GAME_UPDATE
    jne short loc_4109
%else
    jne short loc_3f4c
%endif
    push 0x1a
    mov ebx, LINK_ADDRESS_246
%if GAME_UPDATE
    jmp short loc_4110
%else
    jmp short loc_3f53
%endif
%if GAME_UPDATE
loc_4109:
%else
loc_3f4c:
%endif
    push 0x1a
    mov ebx, LINK_ADDRESS_247
%if GAME_UPDATE
loc_4110:
%else
loc_3f53:
%endif
    mov edx, 0x29
    movsx eax, si
    xor ecx, ecx
    add eax, 0x46
    call 0x10240
    push 0x1a
    mov ebx, LINK_ADDRESS_248
    mov edx, dword [LINK_ADDRESS_89]
    movsx edi, si
    mov eax, edx
    xor ecx, ecx
    shl eax, 5
    add edi, 0x46
    add eax, edx
    mov edx, 0x39
    add ebx, eax
    mov eax, edi
    call 0x10240
    imul eax, dword [LINK_ADDRESS_89], 0xb
    mov edx, dword [LINK_ADDRESS_90]
    add edx, eax
    push 0x1a
    mov eax, edx
    mov ebx, LINK_ADDRESS_249
    shl eax, 5
    xor ecx, ecx
    add eax, edx
    mov edx, 0x49
    add ebx, eax
    mov eax, edi
    call 0x10240
    cmp dword [LINK_ADDRESS_103], 0
%if GAME_UPDATE
    je short loc_418b
%else
    je short loc_3fce
%endif
    cmp dword [LINK_ADDRESS_105], 0
%if GAME_UPDATE
    jle short loc_41b0
%else
    jle short loc_3ff3
%endif
%if GAME_UPDATE
loc_418b:
%else
loc_3fce:
%endif
    mov edx, dword [LINK_ADDRESS_105]
    mov eax, edx
    push 0x1a
    shl eax, 5
    mov ebx, LINK_ADDRESS_250
    add eax, edx
    xor ecx, ecx
    add ebx, eax
    movsx eax, si
    mov edx, 0x59
    add eax, 0x46
%if GAME_UPDATE
    jmp short loc_41c0
%else
    jmp short loc_4003
%endif
%if GAME_UPDATE
loc_41b0:
%else
loc_3ff3:
%endif
    push 0x1a
    mov ebx, LINK_ADDRESS_251
    mov edx, 0x59
    mov eax, edi
    xor ecx, ecx
%if GAME_UPDATE
loc_41c0:
%else
loc_4003:
%endif
    call 0x10240
    cmp dword [LINK_ADDRESS_232], 0
%if GAME_UPDATE
    jne short loc_41f9
%else
    jne short loc_403c
%endif
    cmp dword [LINK_ADDRESS_238], 0
%if GAME_UPDATE
    je short loc_41e0
%else
    je short loc_4023
%endif
    push 0x1a
    mov ebx, LINK_ADDRESS_148
%if GAME_UPDATE
    jmp short loc_41e7
%else
    jmp short loc_402a
%endif
%if GAME_UPDATE
loc_41e0:
%else
loc_4023:
%endif
    push 0x1a
    mov ebx, LINK_ADDRESS_149
%if GAME_UPDATE
loc_41e7:
%else
loc_402a:
%endif
    mov edx, 0x69
    movsx eax, si
    xor ecx, ecx
    add eax, 0x46
    call 0x10240
%if GAME_UPDATE
loc_41f9:
%else
loc_403c:
%endif
    cmp dword [LINK_ADDRESS_232], 1
%if GAME_UPDATE
    jne short loc_422d
%else
    jne short loc_4070
%endif
    cmp dword [LINK_ADDRESS_243], 0
%if GAME_UPDATE
    je short loc_4214
%else
    je short loc_4057
%endif
    push 0x1a
    mov ebx, LINK_ADDRESS_148
%if GAME_UPDATE
    jmp short loc_421b
%else
    jmp short loc_405e
%endif
%if GAME_UPDATE
loc_4214:
%else
loc_4057:
%endif
    push 0x1a
    mov ebx, LINK_ADDRESS_149
%if GAME_UPDATE
loc_421b:
%else
loc_405e:
%endif
    mov edx, 0x79
    movsx eax, si
    xor ecx, ecx
    add eax, 0x46
    call 0x10240
%if GAME_UPDATE
loc_422d:
%else
loc_4070:
%endif
    push LINK_ADDRESS_252
    mov edx, 0x30
    sub esi, 0x2c
    xor ecx, ecx
    movsx edi, si
    xor ebx, ebx
    mov eax, edi
    call LINK_ADDRESS_45
    mov eax, dword [LINK_ADDRESS_89]
    inc eax
    push eax
    push LINK_ADDRESS_253
    push LINK_ADDRESS_26
    call SPRINTF
    add esp, 0xc
    mov edx, 0x40
    xor ecx, ecx
    push LINK_ADDRESS_26
    xor ebx, ebx
    mov eax, edi
    call LINK_ADDRESS_45
    mov eax, dword [LINK_ADDRESS_90]
    inc eax
    push eax
    push LINK_ADDRESS_254
    push LINK_ADDRESS_26
    call SPRINTF
    add esp, 0xc
    mov edx, 0x50
    xor ecx, ecx
    push LINK_ADDRESS_26
    xor ebx, ebx
    mov eax, edi
    call LINK_ADDRESS_45
    push LINK_ADDRESS_255
    mov edx, 0x60
    mov eax, edi
    xor ecx, ecx
    xor ebx, ebx
    call LINK_ADDRESS_45
    mov ecx, dword [LINK_ADDRESS_232]
    test ecx, ecx
%if GAME_UPDATE
    jne short loc_42ca
%else
    jne short loc_410d
%endif
    push LINK_ADDRESS_256
%if GAME_UPDATE
    jmp short loc_42d4
%else
    jmp short loc_4117
%endif
%if GAME_UPDATE
loc_42ca:
%else
loc_410d:
%endif
    push LINK_ADDRESS_256
    mov ecx, 1
%if GAME_UPDATE
loc_42d4:
%else
loc_4117:
%endif
    mov edx, 0x70
    mov eax, edi
    xor ebx, ebx
    call LINK_ADDRESS_45
    cmp dword [LINK_ADDRESS_232], 1
%if GAME_UPDATE
    jne short loc_42fc
%else
    jne short loc_413f
%endif
    push LINK_ADDRESS_257
    mov edx, 0x80
    movsx eax, si
    xor ecx, ecx
%if GAME_UPDATE
    jmp short loc_430e
%else
    jmp short loc_4151
%endif
%if GAME_UPDATE
loc_42fc:
%else
loc_413f:
%endif
    push LINK_ADDRESS_257
    mov ecx, 1
    mov edx, 0x80
    movsx eax, si
%if GAME_UPDATE
loc_430e:
%else
loc_4151:
%endif
    xor ebx, ebx
    call LINK_ADDRESS_45
    push LINK_ADDRESS_258
    mov dh, byte [LINK_ADDRESS_241]
    movsx edi, si
    test dh, dh
    sete al
    xor ebx, ebx
    xor ah, ah
    mov edx, 0x90
    movsx ecx, ax
    mov eax, edi
    call LINK_ADDRESS_45
    cmp byte [LINK_ADDRESS_241], 0
%if GAME_UPDATE
    je short loc_435a
%else
    je short loc_419d
%endif
    push 0x1a
    mov ebx, LINK_ADDRESS_241
    mov edx, 0x89
    lea eax, [edi + 0x72]
    xor ecx, ecx
    call 0x10240
%if GAME_UPDATE
loc_435a:
%else
loc_419d:
%endif
    push LINK_ADDRESS_259
    mov edx, 0xa0
%if GAME_UPDATE
loc_4364:
%else
loc_41a7:
%endif
    movsx eax, si
%if GAME_UPDATE
loc_4367:
%else
loc_41aa:
%endif
    xor ecx, ecx
%if GAME_UPDATE
loc_4369:
%else
loc_41ac:
%endif
    xor ebx, ebx
%if GAME_UPDATE
loc_436b:
%else
loc_41ae:
%endif
    call LINK_ADDRESS_45
%if GAME_UPDATE
loc_4370:
%else
loc_41b3:
%endif
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov al, byte [nosplit eax*2 + LINK_ADDRESS_7]
    and al, 1
    cmp al, 1
%if GAME_UPDATE
    je short loc_43ae
%else
    je short loc_41f1
%endif
    call LINK_ADDRESS_14
    mov eax, dword [TOTALCLOCK]
%if GAME_UPDATE
    mov edi, 0x10000
%else
    mov edx, 0x10000
%endif
    mov dword [LINK_ADDRESS_260], eax
%if GAME_UPDATE
    mov dword [0x7e74], edi
%else
    mov dword [0x7e4c], edx
%endif
%if GAME_UPDATE
loc_43ae:
%else
loc_41f1:
%endif
    mov esp, ebp
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
%if GAME_UPDATE
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
%else
%endif
