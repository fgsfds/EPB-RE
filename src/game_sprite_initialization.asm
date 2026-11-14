; Initialize sprite state based on tile number.
bits 32
org START_ADDRESS

    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x28
    mov word [esp + 0x1c], ax
    mov ebx, edx
    test ax, ax
    jl short loc_0083
    push 0
    movsx esi, ax
    push esi
    imul esi, esi, 0x2c
    push 0
    push 0
    push 0
    push 0
    push 0
    movsx eax, dx
    push 0
    mov ecx, dword [esi + LINK_ADDRESS_1]
    mov ebx, dword [esi + LINK_ADDRESS_2]
    mov edx, dword [esi + SPRITE]
    push eax
    movsx eax, word [esi + LINK_ADDRESS_4]
    call LINK_ADDRESS_5
    movsx edx, ax
    mov edi, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov ax, word [esi + LINK_ADDRESS_6]
    mov word [edx + LINK_ADDRESS_7], ax
    jmp near loc_03b7
loc_0083:
    movsx esi, dx
    mov edi, edx
    imul edx, esi, 0x2c
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov cx, word [edx + LINK_ADDRESS_6]
    mov word [eax + LINK_ADDRESS_7], cx
    mov word [edx + LINK_ADDRESS_8], bx
    mov word [eax + LINK_ADDRESS_9], bx
    xor ecx, ecx
    xor bl, bl
    mov word [eax + LINK_ADDRESS_10], cx
    mov byte [eax + LINK_ADDRESS_11], bl
    mov ecx, dword [edx + SPRITE]
    mov dword [eax + LINK_ADDRESS_12], ecx
    mov ecx, dword [edx + LINK_ADDRESS_2]
    mov dword [eax + LINK_ADDRESS_13], ecx
    mov ecx, dword [edx + LINK_ADDRESS_1]
    mov dword [eax + LINK_ADDRESS_14], ecx
    xor ecx, ecx
    mov esi, 0xffffffff
    mov word [eax + LINK_ADDRESS_15], cx
    xor bh, bh
    mov word [eax + LINK_ADDRESS_16], cx
    movsx ecx, word [edx + LINK_ADDRESS_4]
    mov word [eax + LINK_ADDRESS_17], bx
    lea ebx, [ecx*4]
    mov word [eax + LINK_ADDRESS_18], si
    add ebx, ecx
    mov word [eax + LINK_ADDRESS_19], si
    mov ecx, dword [ebx*8 + LINK_ADDRESS_20]
    mov ebx, dword [ebx*8 + LINK_ADDRESS_21]
    mov dword [eax + LINK_ADDRESS_22], ecx
    mov dword [eax + LINK_ADDRESS_23], ebx
    xor ebx, ebx
    mov dword [eax + LINK_ADDRESS_24], ebx
    mov dword [eax + LINK_ADDRESS_25], ebx
    mov dword [eax + LINK_ADDRESS_26], ebx
    mov dword [eax + LINK_ADDRESS_27], ebx
    mov dword [eax + LINK_ADDRESS_28], ebx
    mov dword [eax + LINK_ADDRESS_29], ebx
    mov dword [eax + LINK_ADDRESS_30], ebx
    mov cx, word [edx + LINK_ADDRESS_6]
    mov dword [eax + LINK_ADDRESS_31], ebx
    cmp cx, 0x112d
    je near loc_0310
    cmp cx, 0x1196
    je near loc_0310
    cmp cx, 0x1109
    je near loc_0310
    cmp cx, 0x1107
    je near loc_0310
    cmp cx, 0xa06
    je near loc_0310
    cmp cx, 0x1f6
    je near loc_0310
    cmp cx, 0x1f3
    je near loc_0310
    test byte [edx + LINK_ADDRESS_32], 0x30
    je near loc_0310
    cmp cx, 0x222
    jl short loc_01e9
    cmp cx, 0x225
    jle near loc_0310
loc_01e9:
    movsx eax, di
    imul edx, eax, 0x2c
    cmp byte [edx + LINK_ADDRESS_33], 0x7f
    je near loc_43cf
    call LINK_ADDRESS_34
    cmp al, 1
    jne near loc_02d5
    test byte [edx + LINK_ADDRESS_32], 0x10
    je near loc_02d5
    mov bx, word [edx + LINK_ADDRESS_6]
    cmp bx, 0x82
    je short loc_027d
    cmp bx, 0xaa
    je short loc_027d
    cmp byte [edx + LINK_ADDRESS_35], 0
    je short loc_027d
    mov ebp, dword [LINK_ADDRESS_36]
    cmp ebp, 2
    jl short loc_024d
    cmp ebp, 1
    jle short loc_027d
    cmp dword [LINK_ADDRESS_37], 1
    jne short loc_027d
loc_024d:
    movsx eax, di
    imul eax, eax, 0x2c
    xor bl, bl
    mov byte [eax + LINK_ADDRESS_38], bl
    xor ecx, ecx
    mov byte [eax + LINK_ADDRESS_39], bl
    mov word [eax + LINK_ADDRESS_40], cx
    mov word [eax + LINK_ADDRESS_41], cx
    mov word [eax + LINK_ADDRESS_32], cx
    jmp near loc_43cf
loc_027d:
    movsx eax, di
    imul eax, eax, 0x2c
    mov si, word [eax + LINK_ADDRESS_32]
    or esi, 0x101
    mov dl, byte [eax + LINK_ADDRESS_35]
    mov word [eax + LINK_ADDRESS_32], si
    test dl, dl
    je near loc_43cf
    mov dx, word [eax + LINK_ADDRESS_6]
    cmp dx, 0x82
    je near loc_43cf
    cmp dx, 0xaa
    je near loc_43cf
    xor dh, dh
    mov byte [eax + LINK_ADDRESS_35], dh
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_02d5:
    movsx eax, di
    imul ebx, eax, 0x2c
    cmp word [ebx + LINK_ADDRESS_40], 0
    je short loc_0310
    mov edx, 0xc
    call LINK_ADDRESS_42
    or word [ebx + LINK_ADDRESS_32], 0x101
    mov ax, word [LINK_ADDRESS_43]
    mov word [ebx + LINK_ADDRESS_44], ax
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_0310:
    movsx eax, di
    imul eax, eax, 0x2c
    mov cl, byte [eax + LINK_ADDRESS_32]
    mov bx, word [eax + LINK_ADDRESS_6]
    test cl, 1
    je short loc_032f
    or byte [eax + LINK_ADDRESS_45], 1
loc_032f:
    movsx eax, bx
    lea eax, [eax*4]
    mov ebx, dword [eax + LINK_ADDRESS_46]
    test ebx, ebx
    je short loc_0396
    mov edx, ebx
    movsx ebx, di
    imul esi, ebx, 0x2c
    mov ax, word [edx]
    mov word [esi + LINK_ADDRESS_44], ax
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov ebx, dword [edx + 4]
    mov dword [eax + LINK_ADDRESS_27], ebx
    mov ebx, dword [edx + 8]
    mov dword [eax + LINK_ADDRESS_30], ebx
    cmp dword [edx + 0xc], 0
    je short loc_03b7
    cmp word [esi + LINK_ADDRESS_40], 0
    jne short loc_03b7
    mov ax, word [edx + 0xc]
    mov word [esi + LINK_ADDRESS_40], ax
    jmp short loc_03b7
loc_0396:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + LINK_ADDRESS_27], ebx
    mov dword [eax + LINK_ADDRESS_30], ebx
loc_03b7:
    movsx eax, di
    imul eax, eax, 0x2c
    mov esi, SPRITE
    add esi, eax
    mov ax, word [esi + 0x18]
    mov dword [esp + 0x10], eax
    mov ax, word [esi + 0xe]
    cmp ax, 0x4d1
    jb near loc_0aae
    jbe near loc_1f91
    cmp ax, 0x866
    jb near loc_077f
    jbe near loc_2874
    cmp ax, 0xa1e
    jb near loc_05ef
    jbe near loc_16b6
    cmp ax, 0x115c
    jb near loc_052e
    jbe near loc_1ad9
    cmp ax, 0x1300
    jb short loc_047c
    jbe near loc_1db9
    cmp ax, 0x1324
    jb short loc_0452
    jbe near loc_1b23
    cmp ax, 0x1330
    jb short loc_0443
    jbe near loc_1b23
    cmp ax, 0x134f
    je near loc_1ad9
    jmp near loc_04da
loc_0443:
    cmp ax, 0x132d
    je near loc_1b23
    jmp near loc_04da
loc_0452:
    cmp ax, 0x131a
    jb short loc_046d
    jbe near loc_14e0
    cmp ax, 0x131d
    je near loc_1f0b
    jmp near loc_04da
loc_046d:
    cmp ax, 0x1302
    je near loc_1db9
    jmp near loc_04da
loc_047c:
    cmp ax, 0x11ad
    jb short loc_04c0
    cmp ax, 0x11b0
    jbe near loc_27c4
    cmp ax, 0x1284
    jb short loc_04a7
    jbe near loc_2866
    cmp ax, 0x1285
    je near loc_2844
    jmp near loc_04da
loc_04a7:
    cmp ax, 0x11e4
    jb near loc_04da
    cmp ax, 0x11e6
    jbe near loc_431e
    jmp near loc_04da
loc_04c0:
    cmp ax, 0x116c
    jb near loc_04da
    jbe near loc_1f91
    cmp ax, 0x1196
    je near loc_2818
loc_04da:
    movsx eax, word [esi + 0xe]
    cmp dword [eax*4 + LINK_ADDRESS_46], 0
    je near loc_43cf
    movsx eax, word [esp + 0x1c]
    cmp eax, -1
    jne near loc_11d0
    mov edx, dword [LINK_ADDRESS_47]
    movsx eax, word [esi + 0x26]
    cmp eax, edx
    jle near loc_11d0
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_052e:
    cmp ax, 0xd7a
    jb short loc_059a
    jbe near loc_1db9
    cmp ax, 0x1107
    jb short loc_0570
    jbe near loc_2818
    cmp ax, 0x1125
    jb short loc_0561
    jbe near loc_174b
    cmp ax, 0x113a
    je near loc_1f91
    jmp near loc_04da
loc_0561:
    cmp ax, 0x1109
    je near loc_2818
    jmp near loc_04da
loc_0570:
    cmp ax, 0xea3
    jb short loc_058b
    jbe near loc_2c94
    cmp ax, 0xfff
    je near loc_15cb
    jmp near loc_04da
loc_058b:
    cmp ax, 0xea0
    je near loc_2c94
    jmp near loc_04da
loc_059a:
    cmp ax, 0xa96
    jb short loc_05d0
    jbe near loc_2866
    cmp ax, 0xc76
    jb short loc_05c1
    jbe near loc_1eae
    cmp ax, 0xd48
    je near loc_1eae
    jmp near loc_04da
loc_05c1:
    cmp ax, 0xac8
    je near loc_2866
    jmp near loc_04da
loc_05d0:
    cmp ax, 0xa46
    jb near loc_04da
    jbe near loc_2866
    cmp ax, 0xa47
    je near loc_2844
    jmp near loc_04da
loc_05ef:
    cmp ax, 0x8f8
    jb near loc_06be
    cmp ax, 0x8fb
    jbe near loc_1998
    cmp ax, 0x942
    jb short loc_066f
    jbe near loc_2866
    cmp ax, 0x9e5
    jb short loc_0645
    jbe near loc_2035
    cmp ax, 0xa06
    jb short loc_0636
    jbe near loc_19f7
    cmp ax, 0xa07
    je near loc_163e
    jmp near loc_04da
loc_0636:
    cmp ax, 0x9e7
    je near loc_2035
    jmp near loc_04da
loc_0645:
    cmp ax, 0x974
    jb short loc_0660
    jbe near loc_2874
    cmp ax, 0x9bb
    je near loc_1e96
    jmp near loc_04da
loc_0660:
    cmp ax, 0x94c
    je near loc_26ac
    jmp near loc_04da
loc_066f:
    cmp ax, 0x906
    jb short loc_06a5
    jbe near loc_2213
    cmp ax, 0x91d
    jb short loc_0696
    jbe near loc_2e01
    cmp ax, 0x938
    je near loc_2866
    jmp near loc_04da
loc_0696:
    cmp ax, 0x919
    je near loc_2213
    jmp near loc_04da
loc_06a5:
    cmp ax, 0x8fc
    jbe near loc_2aa4
    cmp ax, 0x905
    je near loc_2aa4
    jmp near loc_04da
loc_06be:
    cmp ax, 0x8ab
    jb short loc_072a
    jbe near loc_2213
    cmp ax, 0x8d4
    jb short loc_0700
    jbe near loc_1468
    cmp ax, 0x8de
    jb short loc_06f1
    jbe near loc_2213
    cmp ax, 0x8ee
    je near loc_1468
    jmp near loc_04da
loc_06f1:
    cmp ax, 0x8d9
    je near loc_1468
    jmp near loc_04da
loc_0700:
    cmp ax, 0x8ca
    jb short loc_071b
    jbe near loc_1468
    cmp ax, 0x8cf
    je near loc_1468
    jmp near loc_04da
loc_071b:
    cmp ax, 0x8c5
    je near loc_1468
    jmp near loc_04da
loc_072a:
    cmp ax, 0x898
    jb short loc_0760
    jbe near loc_196e
    cmp ax, 0x89d
    jb short loc_0751
    jbe near loc_1468
    cmp ax, 0x8a1
    je near loc_1468
    jmp near loc_04da
loc_0751:
    cmp ax, 0x899
    je near loc_1468
    jmp near loc_04da
loc_0760:
    cmp ax, 0x870
    jb near loc_04da
    jbe near loc_2874
    cmp ax, 0x875
    je near loc_2874
    jmp near loc_04da
loc_077f:
    cmp ax, 0x5ee
    jb near loc_0929
    jbe near loc_1e22
    cmp ax, 0x6e8
    jb near loc_0860
    jbe near loc_1468
    cmp ax, 0x780
    jb short loc_080b
    jbe near loc_2874
    cmp ax, 0x7d1
    jb short loc_07e1
    jbe near loc_2844
    cmp ax, 0x848
    jb short loc_07d2
    jbe near loc_2874
    cmp ax, 0x849
    je near loc_2844
    jmp near loc_04da
loc_07d2:
    cmp ax, 0x7fd
    je near loc_2844
    jmp near loc_04da
loc_07e1:
    cmp ax, 0x7a8
    jb short loc_07fc
    jbe near loc_2b63
    cmp ax, 0x7d0
    je near loc_2874
    jmp near loc_04da
loc_07fc:
    cmp ax, 0x781
    je near loc_2844
    jmp near loc_04da
loc_080b:
    cmp ax, 0x71c
    jb short loc_0841
    jbe near loc_2874
    cmp ax, 0x758
    jb short loc_0832
    jbe near loc_2874
    cmp ax, 0x762
    je near loc_2213
    jmp near loc_04da
loc_0832:
    cmp ax, 0x71d
    je near loc_2844
    jmp near loc_04da
loc_0841:
    cmp ax, 0x6ec
    jb near loc_04da
    jbe near loc_1468
    cmp ax, 0x6f0
    je near loc_1468
    jmp near loc_04da
loc_0860:
    cmp ax, 0x66f
    jb short loc_08d4
    jbe near loc_1480
    cmp ax, 0x6b3
    jb short loc_08a6
    jbe near loc_2874
    cmp ax, 0x6cd
    jb short loc_0897
    cmp ax, 0x6ce
    jbe near loc_2874
    cmp ax, 0x6d0
    je near loc_2874
    jmp near loc_04da
loc_0897:
    cmp ax, 0x6bd
    je near loc_2874
    jmp near loc_04da
loc_08a6:
    cmp ax, 0x690
    jb short loc_08c5
    cmp ax, 0x691
    jbe near loc_2874
    cmp ax, 0x692
    je near loc_2844
    jmp near loc_04da
loc_08c5:
    cmp ax, 0x678
    je near loc_2213
    jmp near loc_04da
loc_08d4:
    cmp ax, 0x600
    jb short loc_090a
    jbe near loc_1468
    cmp ax, 0x654
    jb short loc_08fb
    jbe near loc_1700
    cmp ax, 0x65e
    je near loc_14f5
    jmp near loc_04da
loc_08fb:
    cmp ax, 0x60e
    je near loc_2874
    jmp near loc_04da
loc_090a:
    cmp ax, 0x5f0
    jb near loc_04da
    jbe near loc_1468
    cmp ax, 0x5f8
    je near loc_1468
    jmp near loc_04da
loc_0929:
    cmp ax, 0x52c
    jb near loc_09f8
    jbe near loc_1ddb
    cmp ax, 0x549
    jb short loc_09a9
    jbe near loc_1aa6
    cmp ax, 0x564
    jb short loc_097b
    jbe near loc_1330
    cmp ax, 0x573
    jb short loc_096c
    jbe near loc_1db9
    cmp ax, 0x58c
    je near loc_22d6
    jmp near loc_04da
loc_096c:
    cmp ax, 0x56e
    je near loc_4324
    jmp near loc_04da
loc_097b:
    cmp ax, 0x54e
    jb short loc_099a
    cmp ax, 0x54f
    jbe near loc_1ad9
    cmp ax, 0x550
    je near loc_2213
    jmp near loc_04da
loc_099a:
    cmp ax, 0x54b
    jbe near loc_1ad9
    jmp near loc_04da
loc_09a9:
    cmp ax, 0x538
    jb short loc_09df
    jbe near loc_1db9
    cmp ax, 0x544
    jb short loc_09d0
    jbe near loc_2c94
    cmp ax, 0x548
    je near loc_1ad9
    jmp near loc_04da
loc_09d0:
    cmp ax, 0x542
    je near loc_1e96
    jmp near loc_04da
loc_09df:
    cmp ax, 0x52d
    jbe near loc_1db9
    cmp ax, 0x536
    je near loc_1db9
    jmp near loc_04da
loc_09f8:
    cmp ax, 0x4f3
    jb short loc_0a59
    jbe near loc_2874
    cmp ax, 0x520
    jb short loc_0a3a
    jbe near loc_1db9
    cmp ax, 0x529
    jb short loc_0a2b
    jbe near loc_1db9
    cmp ax, 0x52b
    je near loc_1db9
    jmp near loc_04da
loc_0a2b:
    cmp ax, 0x525
    je near loc_1db9
    jmp near loc_04da
loc_0a3a:
    cmp ax, 0x4f8
    jb near loc_04da
    jbe near loc_2698
    cmp ax, 0x50e
    je near loc_1db9
    jmp near loc_04da
loc_0a59:
    cmp ax, 0x4df
    jb short loc_0a8f
    jbe near loc_4240
    cmp ax, 0x4e7
    jb short loc_0a80
    jbe near loc_2f25
    cmp ax, 0x4ed
    je near loc_14f5
    jmp near loc_04da
loc_0a80:
    cmp ax, 0x4e2
    je near loc_2eea
    jmp near loc_04da
loc_0a8f:
    cmp ax, 0x4d6
    jb near loc_04da
    jbe near loc_4324
    cmp ax, 0x4d8
    je near loc_4324
    jmp near loc_04da
loc_0aae:
    cmp ax, 0x2a6
    jb near loc_0e48
    jbe near loc_1ad9
    cmp ax, 0x3ba
    jb near loc_0c7c
    cmp ax, 0x3bd
    jbe near loc_1ad9
    cmp ax, 0x401
    jb near loc_0ba5
    jbe near loc_1ad9
    cmp ax, 0x440
    jb short loc_0b56
    jbe near loc_2b63
    cmp ax, 0x4c6
    jb short loc_0b28
    jbe near loc_240e
    cmp ax, 0x4cb
    jb short loc_0b19
    cmp ax, 0x4cd
    jbe near loc_4324
    cmp ax, 0x4d0
    je near loc_431e
    jmp near loc_04da
loc_0b19:
    cmp ax, 0x4ca
    je near loc_174b
    jmp near loc_04da
loc_0b28:
    cmp ax, 0x485
    jb short loc_0b47
    cmp ax, 0x48e
    jbe near loc_1ad9
    cmp ax, 0x496
    je near loc_1b63
    jmp near loc_04da
loc_0b47:
    cmp ax, 0x464
    je near loc_1b63
    jmp near loc_04da
loc_0b56:
    cmp ax, 0x423
    jb short loc_0b8c
    jbe near loc_1b63
    cmp ax, 0x42d
    jb short loc_0b7d
    jbe near loc_26cc
    cmp ax, 0x437
    je near loc_4240
    jmp near loc_04da
loc_0b7d:
    cmp ax, 0x426
    je near loc_431e
    jmp near loc_04da
loc_0b8c:
    cmp ax, 0x402
    jbe near loc_4324
    cmp ax, 0x416
    je near loc_144c
    jmp near loc_04da
loc_0ba5:
    cmp ax, 0x3d5
    jb near loc_0c2d
    jbe near loc_1ad9
    cmp ax, 0x3ef
    jb short loc_0bf9
    cmp ax, 0x3f1
    jbe near loc_144c
    cmp ax, 0x3fc
    jb short loc_0be0
    jbe near loc_1f23
    cmp ax, 0x400
    je near loc_1b63
    jmp near loc_04da
loc_0be0:
    cmp ax, 0x3f4
    jb near loc_04da
    cmp ax, 0x3f6
    jbe near loc_1ad9
    jmp near loc_04da
loc_0bf9:
    cmp ax, 0x3de
    jb short loc_0c1e
    jbe near loc_2dce
    cmp ax, 0x3e2
    jb near loc_04da
    cmp ax, 0x3e4
    jbe near loc_1ad9
    jmp near loc_04da
loc_0c1e:
    cmp ax, 0x3dc
    je near loc_1b63
    jmp near loc_04da
loc_0c2d:
    cmp ax, 0x3cf
    jb short loc_0c63
    jbe near loc_1ad9
    cmp ax, 0x3d2
    jb short loc_0c54
    jbe near loc_2dce
    cmp ax, 0x3d3
    je near loc_1ad9
    jmp near loc_04da
loc_0c54:
    cmp ax, 0x3d1
    je near loc_2e7f
    jmp near loc_04da
loc_0c63:
    cmp ax, 0x3cb
    jb near loc_04da
    cmp ax, 0x3cd
    jbe near loc_1ad9
    jmp near loc_1aeb
loc_0c7c:
    cmp ax, 0x33c
    jb near loc_0d69
    jbe near loc_2874
    cmp ax, 0x391
    jb near loc_0d0a
    cmp ax, 0x393
    jbe near loc_1b63
    cmp ax, 0x3ab
    jb short loc_0cd6
    jbe near loc_1ad9
    cmp ax, 0x3b7
    jb short loc_0cc7
    jbe near loc_2dce
    cmp ax, 0x3b8
    je near loc_1f6b
    jmp near loc_04da
loc_0cc7:
    cmp ax, 0x3ac
    je near loc_2e1d
    jmp near loc_04da
loc_0cd6:
    cmp ax, 0x399
    jb short loc_0cfb
    jbe near loc_43be
    cmp ax, 0x39d
    jb near loc_04da
    cmp ax, 0x39e
    jbe near loc_144c
    jmp near loc_04da
loc_0cfb:
    cmp ax, 0x394
    je near loc_428d
    jmp near loc_04da
loc_0d0a:
    cmp ax, 0x388
    jb short loc_0d40
    jbe near loc_4324
    cmp ax, 0x38e
    jb short loc_0d31
    jbe near loc_2dce
    cmp ax, 0x38f
    je near loc_1ad9
    jmp near loc_04da
loc_0d31:
    cmp ax, 0x38c
    je near loc_2dce
    jmp near loc_04da
loc_0d40:
    cmp ax, 0x33e
    jb near loc_04da
    jbe near loc_1b63
    cmp ax, 0x385
    jb near loc_04da
    cmp ax, 0x386
    jbe near loc_1ddb
    jmp near loc_04da
loc_0d69:
    cmp ax, 0x2f1
    jb short loc_0ddf
    jbe near loc_1db9
    cmp ax, 0x306
    jb short loc_0dab
    jbe near loc_1ad9
    cmp ax, 0x318
    jb short loc_0d9c
    jbe near loc_1ad9
    cmp ax, 0x33a
    je near loc_2874
    jmp near loc_04da
loc_0d9c:
    cmp ax, 0x30b
    je near loc_1ad9
    jmp near loc_04da
loc_0dab:
    cmp ax, 0x2fd
    jb short loc_0dd0
    jbe near loc_1ad9
    cmp ax, 0x300
    jb near loc_04da
    cmp ax, 0x301
    jbe near loc_1ad9
    jmp near loc_04da
loc_0dd0:
    cmp ax, 0x2fa
    je near loc_1efb
    jmp near loc_04da
loc_0ddf:
    cmp ax, 0x2b1
    jb short loc_0e1f
    jbe near loc_1ad9
    cmp ax, 0x2b9
    jb short loc_0e06
    jbe near loc_1ad9
    cmp ax, 0x2cc
    je near loc_1ad9
    jmp near loc_04da
loc_0e06:
    cmp ax, 0x2b6
    jb near loc_04da
    cmp ax, 0x2b7
    jbe near loc_1ad9
    jmp near loc_04da
loc_0e1f:
    cmp ax, 0x2a8
    jb near loc_04da
    jbe near loc_1ad9
    cmp ax, 0x2ad
    jb near loc_04da
    cmp ax, 0x2ae
    jbe near loc_1ad9
    jmp near loc_04da
loc_0e48:
    cmp ax, 0x1f6
    jb near loc_1010
    jbe near loc_200d
    cmp ax, 0x253
    jb near loc_0f3b
    jbe near loc_1ad9
    cmp ax, 0x26d
    jb short loc_0edc
    cmp ax, 0x271
    jbe near loc_2e62
    cmp ax, 0x296
    jb short loc_0eb2
    jbe near loc_27a3
    cmp ax, 0x2a0
    jb short loc_0ea3
    cmp ax, 0x2a2
    jbe near loc_1b8b
    cmp ax, 0x2a3
    je near loc_4355
    jmp near loc_04da
loc_0ea3:
    cmp ax, 0x29d
    je near loc_1ad9
    jmp near loc_04da
loc_0eb2:
    cmp ax, 0x294
    jb short loc_0ec3
    jbe near loc_25a7
    jmp near loc_23a3
loc_0ec3:
    cmp ax, 0x27a
    jb near loc_04da
    cmp ax, 0x27d
    jbe near loc_27c4
    jmp near loc_04da
loc_0edc:
    cmp ax, 0x25f
    jb short loc_0f1c
    jbe near loc_1ad9
    cmp ax, 0x268
    jb short loc_0f0d
    jbe near loc_1ad9
    cmp ax, 0x26a
    jb near loc_04da
    cmp ax, 0x26b
    jbe near loc_1ad9
    jmp near loc_04da
loc_0f0d:
    cmp ax, 0x261
    je near loc_1b63
    jmp near loc_04da
loc_0f1c:
    cmp ax, 0x25a
    jb near loc_04da
    jbe near loc_1ad9
    cmp ax, 0x25b
    je near loc_1db9
    jmp near loc_04da
loc_0f3b:
    cmp ax, 0x22a
    jb short loc_0fb1
    jbe near loc_2e62
    cmp ax, 0x23a
    jb short loc_0f7d
    jbe near loc_2874
    cmp ax, 0x241
    jb short loc_0f6e
    jbe near loc_1b00
    cmp ax, 0x242
    je near loc_2b63
    jmp near loc_04da
loc_0f6e:
    cmp ax, 0x23c
    je near loc_2874
    jmp near loc_04da
loc_0f7d:
    cmp ax, 0x233
    jb short loc_0f98
    jbe near loc_2dbf
    cmp ax, 0x238
    je near loc_1b00
    jmp near loc_04da
loc_0f98:
    cmp ax, 0x22c
    jb near loc_04da
    cmp ax, 0x22d
    jbe near loc_1ad9
    jmp near loc_04da
loc_0fb1:
    cmp ax, 0x214
    jb short loc_0fe7
    jbe near loc_2337
    cmp ax, 0x226
    jb short loc_0fd8
    jbe near loc_1b8b
    cmp ax, 0x227
    je near loc_144c
    jmp near loc_04da
loc_0fd8:
    cmp ax, 0x222
    jb near loc_04da
    jmp near loc_428d
loc_0fe7:
    cmp ax, 0x202
    jb near loc_04da
    jbe near loc_1b63
    cmp ax, 0x204
    jb near loc_04da
    cmp ax, 0x205
    jbe near loc_1ad9
    jmp near loc_04da
loc_1010:
    db 0x66, 0x3d, 0x2c, 0x00    ; cmp ax, 0x2c
    jb near loc_10f3
    db 0x66, 0x3d, 0x31, 0x00    ; cmp ax, 0x31
    jbe near loc_2c94
    cmp ax, 0xa0
    jb short loc_109a
    jbe near loc_2a7b
    cmp ax, 0x183
    jb short loc_1066
    jbe near loc_1b63
    cmp ax, 0x197
    jb short loc_1057
    jbe near loc_1ad9
    cmp ax, 0x1f3
    je near loc_200d
    jmp near loc_04da
loc_1057:
    cmp ax, 0x187
    je near loc_1b63
    jmp near loc_04da
loc_1066:
    cmp ax, 0x11d
    jb short loc_108b
    jbe near loc_1b63
    cmp ax, 0x156
    jb near loc_04da
    cmp ax, 0x157
    jbe near loc_1ad9
    jmp near loc_04da
loc_108b:
    cmp ax, 0xff
    je near loc_1b63
    jmp near loc_04da
loc_109a:
    db 0x66, 0x3d, 0x3c, 0x00    ; cmp ax, 0x3c
    jb short loc_10d0
    jbe near loc_2d1d
    db 0x66, 0x3d, 0x64, 0x00    ; cmp ax, 0x64
    jb short loc_10c1
    jbe near loc_2c94
    cmp ax, 0x8e
    je near loc_145a
    jmp near loc_04da
loc_10c1:
    db 0x66, 0x3d, 0x3d, 0x00    ; cmp ax, 0x3d
    je near loc_2c94
    jmp near loc_04da
loc_10d0:
    db 0x66, 0x3d, 0x33, 0x00    ; cmp ax, 0x33
    jb near loc_04da
    db 0x66, 0x3d, 0x39, 0x00    ; cmp ax, 0x39
    jbe near loc_2c94
    db 0x66, 0x3d, 0x3b, 0x00    ; cmp ax, 0x3b
    je near loc_2c94
    jmp near loc_04da
loc_10f3:
    db 0x66, 0x3d, 0x08, 0x00    ; cmp ax, 8
    jb short loc_1158
    jbe near loc_27ef
    db 0x66, 0x3d, 0x1a, 0x00    ; cmp ax, 0x1a
    jb short loc_113f
    jbe near loc_2b40
    db 0x66, 0x3d, 0x25, 0x00    ; cmp ax, 0x25
    jb short loc_1130
    jbe near loc_2c94
    db 0x66, 0x3d, 0x28, 0x00    ; cmp ax, 0x28
    jb near loc_04da
    db 0x66, 0x3d, 0x2a, 0x00    ; cmp ax, 0x2a
    jbe near loc_2c94
    jmp near loc_04da
loc_1130:
    db 0x66, 0x3d, 0x1d, 0x00    ; cmp ax, 0x1d
    jbe near loc_2c94
    jmp near loc_04da
loc_113f:
    db 0x66, 0x3d, 0x09, 0x00    ; cmp ax, 9
    jbe near loc_21be
    db 0x66, 0x3d, 0x15, 0x00    ; cmp ax, 0x15
    jb near loc_04da
    jmp near loc_2c94
loc_1158:
    db 0x66, 0x3d, 0x03, 0x00    ; cmp ax, 3
    jb short loc_1183
    jbe near loc_26ea
    db 0x66, 0x3d, 0x05, 0x00    ; cmp ax, 5
    jb near loc_1193
    jbe near loc_21c4
    db 0x66, 0x3d, 0x06, 0x00    ; cmp ax, 6
    je near loc_2a5a
    jmp near loc_04da
loc_1183:
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jb near loc_04da
    jbe near loc_2f3d
loc_1193:
    mov cx, word [esi + 0xe]
    mov word [esi + 0xc], 0x8000
    cmp cx, 4
    jne short loc_11b8
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    or byte [eax*8 + LINK_ADDRESS_48], 0x40
loc_11b8:
    mov edx, 8
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_11d0:
    cmp byte [esi + 0x14], 0
    je short loc_11dc
    cmp byte [esi + 0x15], 0
    jne short loc_11e6
loc_11dc:
    mov byte [esi + 0x15], 1
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
loc_11e6:
    movsx eax, word [esi + 0xe]
    test byte [eax + LINK_ADDRESS_49], 3
    je near loc_12d6
    cmp dword [LINK_ADDRESS_50], 1
    jne short loc_1222
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1222:
    movsx edx, di
    mov eax, edx
    call LINK_ADDRESS_51
    movsx eax, word [esi + 0xe]
    test byte [eax + LINK_ADDRESS_49], 2
    je short loc_1258
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov ax, word [esi + 0x18]
    mov word [edx + LINK_ADDRESS_19], ax
loc_1258:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    inc byte [nosplit eax*2 + LINK_ADDRESS_53]
    mov edx, dword [esp + 0x1c]
    mov byte [esi + 0x12], 0x50
    test dx, dx
    jl short loc_12cc
    movsx eax, dx
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_6], 9
    jne short loc_12c2
    movsx edx, di
    imul ebx, edx, 0x2c
    mov al, byte [eax + LINK_ADDRESS_35]
    mov byte [ebx + LINK_ADDRESS_35], al
    xor ebx, ebx
    mov bl, al
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov word [eax + LINK_ADDRESS_15], bx
loc_12c2:
    mov edx, 1
    movsx eax, di
    jmp short loc_12e6
loc_12cc:
    mov edx, 2
    movsx eax, di
    jmp short loc_12e6
loc_12d6:
    mov edx, 1
    mov byte [esi + 0x12], 0x28
    movsx eax, di
    mov word [esi + 0x1e], di
loc_12e6:
    call LINK_ADDRESS_42
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    xor ecx, ecx
    mov word [eax + LINK_ADDRESS_10], cx
    mov eax, dword [esp + 0x1c]
    test ax, ax
    jl near loc_43cf
    cwde
    imul eax, eax, 0x2c
    mov ax, word [eax + LINK_ADDRESS_54]
    mov word [esi + 0x1c], ax
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1330:
    mov eax, dword [esp + 0x1c]
    test ax, ax
    jl short loc_1372
    cwde
    imul eax, eax, 0x2c
    movsx edx, word [esp + 0x1c]
    imul edx, edx, 0x2c
    mov ecx, dword [eax + LINK_ADDRESS_1]
    movsx eax, word [esp + 0x1c]
    imul eax, eax, 0x2c
    mov edx, dword [edx + SPRITE]
    mov ebx, dword [eax + LINK_ADDRESS_2]
    movsx eax, di
    call LINK_ADDRESS_55
    call LINK_ADDRESS_56
    and al, 7
    add al, 8
    jmp short loc_137b
loc_1372:
    call LINK_ADDRESS_56
    and al, 0xf
    add al, 0x10
loc_137b:
    mov byte [esi + 0x15], al
    mov byte [esi + 0x14], al
    mov ah, byte [esi + 0xc]
    mov byte [esi + 0x10], 0xf0
    or ah, 0x80
    mov edx, dword [esp + 0x1c]
    mov byte [esi + 0xc], ah
    test dx, dx
    jl near loc_141d
    movsx eax, dx
    imul eax, eax, 0x2c
    movsx edx, word [eax + LINK_ADDRESS_4]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov bx, word [eax + LINK_ADDRESS_57]
    cmp bx, 2
    jne short loc_13f6
    movsx eax, di
    imul eax, eax, 0x2c
    mov ebx, dword [eax + LINK_ADDRESS_2]
    mov edx, dword [eax + SPRITE]
    movsx eax, word [eax + LINK_ADDRESS_4]
    call GETCEILZOFSLOPE
    mov dl, byte [esi + 0xc]
    add eax, 0x1000
    or dl, 8
    mov dword [esi + 8], eax
    mov byte [esi + 0xc], dl
    jmp short loc_141d
loc_13f6:
    cmp bx, 1
    jne short loc_141d
    movsx eax, di
    imul eax, eax, 0x2c
    mov ebx, dword [eax + LINK_ADDRESS_2]
    mov edx, dword [eax + SPRITE]
    movsx eax, word [eax + LINK_ADDRESS_4]
    call GETFLORZOFSLOPE
    mov dword [esi + 8], eax
loc_141d:
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    cmp word [eax + LINK_ADDRESS_60], 0xc8
    je short loc_1448
    cmp word [eax + LINK_ADDRESS_61], 0xc8
    jne short loc_144c
loc_1448:
    mov byte [esi + 0x11], 7
loc_144c:
    cmp word [esi + 0xe], 0x564
    je short loc_145a
    or word [esi + 0xc], 0x101
loc_145a:
    cmp word [esi + 0xe], 0x227
    jne short loc_1468
    or word [esi + 0xc], 0x101
loc_1468:
    mov edx, 5
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1480:
    mov ebx, dword [esp + 0x1c]
    test bx, bx
    jl short loc_149a
    movsx eax, bx
    imul eax, eax, 0x2c
    mov ax, word [eax + LINK_ADDRESS_54]
    mov word [esi + 0x1c], ax
loc_149a:
    sub dword [esi + 8], 0x2600
    call LINK_ADDRESS_56
    mov edx, 0x100
    and ah, 1
    sub edx, eax
    mov word [esi + 0x24], dx
    call LINK_ADDRESS_56
    xor ah, ah
    mov edx, 0x40
    and al, 0x7f
    sub edx, eax
    movsx eax, di
    mov word [esi + 0x20], dx
    mov edx, 4
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_14e0:
    and word [esi + 0xc], 0x7efe
    or byte [esi + 0xd], 0x80
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_14f5:
    movsx eax, word [esp + 0x1c]
    cmp eax, -1
    je near loc_43cf
    imul eax, eax, 0x2c
    cmp word [esi + 0xe], 0x4ed
    jne short loc_1537
    mov byte [esi + 0x14], 0x1f
    mov byte [esi + 0x15], 1
    movsx edx, word [eax + LINK_ADDRESS_4]
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + LINK_ADDRESS_20]
    sub eax, 0x2800
    mov dword [esi + 8], eax
    jmp short loc_1573
loc_1537:
    cmp word [eax + LINK_ADDRESS_62], 4
    jne short loc_154b
    mov byte [esi + 0x14], 8
    mov byte [esi + 0x15], 8
    jmp short loc_1573
loc_154b:
    mov byte [esi + 0x14], 0x30
    mov byte [esi + 0x15], 0x40
    cmp word [eax + LINK_ADDRESS_62], 0xa
    je short loc_156c
    add eax, SPRITE
    call LINK_ADDRESS_63
    test ax, ax
    je short loc_1573
loc_156c:
    sub dword [esi + 8], 0x2000
loc_1573:
    movsx eax, word [esp + 0x1c]
    imul eax, eax, 0x2c
    mov byte [esi + 0x10], 0x81
    mov word [esi + 0xc], 0x82
    mov edx, 5
    mov ax, word [eax + LINK_ADDRESS_54]
    movsx ebp, di
    mov word [esi + 0x1c], ax
    mov eax, ebp
    mov word [esi + 0x20], 0x80
    call LINK_ADDRESS_42
    mov edx, 0x10001
    mov eax, ebp
    call LINK_ADDRESS_64
    mov eax, ebp
    mov ecx, dword [esi + 8]
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    call LINK_ADDRESS_55
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_15cb:
    mov ecx, dword [esp + 0x1c]
    test cx, cx
    jl short loc_161c
    movsx eax, cx
    imul eax, eax, 0x2c
    mov al, byte [eax + LINK_ADDRESS_39]
    mov byte [esi + 0x14], al
    movsx eax, cx
    imul eax, eax, 0x2c
    mov al, byte [eax + LINK_ADDRESS_38]
    mov byte [esi + 0x15], al
    movsx eax, cx
    imul eax, eax, 0x2c
    movsx edx, di
    movsx ebx, word [eax + LINK_ADDRESS_6]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + LINK_ADDRESS_30], ebx
    jmp short loc_1626
loc_161c:
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
loc_1626:
    mov edx, 5
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_163e:
    mov byte [esi + 0x15], 6
    mov byte [esi + 0x14], 0x20
    mov dl, byte [LINK_ADDRESS_65]
    cmp dl, 1
    jne short loc_1659
    mov word [esi + 0xc], 0x12
    jmp short loc_1672
loc_1659:
    test dl, dl
    je short loc_1662
    cmp dl, 2
    jne short loc_166a
loc_1662:
    mov word [esi + 0xc], 0x10
    jmp short loc_1672
loc_166a:
    mov byte [esi + 0x14], 0
    mov byte [esi + 0x15], 0
loc_1672:
    mov eax, dword [esp + 0x1c]
    test ax, ax
    jl short loc_169e
    movsx edx, ax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ax, word [eax + LINK_ADDRESS_26]
    add ah, 2
    mov word [esi + 0x1c], ax
loc_169e:
    mov edx, 5
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_16b6:
    movsx eax, word [esp + 0x1c]
    cmp eax, -1
    jne short loc_16de
    mov edx, 2
    movsx eax, di
    mov word [esi + 0xc], 0x8000
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_16de:
    mov byte [esi + 0x15], 1
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1700:
    mov byte [esi + 0x15], 0x10
    mov ebx, dword [esi + 8]
    mov al, byte [esi + 0x15]
    sub ebx, 0x1a00
    mov byte [esi + 0x14], al
    mov ecx, dword [esp + 0x1c]
    mov dword [esi + 8], ebx
    test cx, cx
    jl short loc_1733
    movsx eax, cx
    imul eax, eax, 0x2c
    mov ch, byte [eax + LINK_ADDRESS_35]
    cmp ch, 6
    jne short loc_1733
    mov byte [esi + 0x11], ch
loc_1733:
    mov edx, 5
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_174b:
    mov ax, word [esi + 0x18]
    mov dword [esp + 0x20], eax
    lea ebx, [esp + 0x20]
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    add edx, 0x6c
    add eax, 0x6c
    call UPDATESECTOR
    cmp word [esp + 0x20], 0
    jl near loc_1899
    movsx edx, word [esi + 0x18]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, word [esp + 0x20]
    lea eax, [edx*4]
    add eax, edx
    lea ebx, [ebx*8]
    mov eax, dword [eax*8 + LINK_ADDRESS_20]
    cmp eax, dword [ebx + LINK_ADDRESS_20]
    jne near loc_1899
    lea ebx, [esp + 0x20]
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    sub edx, 0x6c
    sub eax, 0x6c
    call UPDATESECTOR
    cmp word [esp + 0x20], 0
    jl near loc_1899
    movsx edx, word [esi + 0x18]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, word [esp + 0x20]
    lea eax, [edx*4]
    lea ebx, [ebx*8]
    add eax, edx
    mov ecx, dword [ebx + LINK_ADDRESS_20]
    cmp ecx, dword [eax*8 + LINK_ADDRESS_20]
    jne near loc_1899
    lea ebx, [esp + 0x20]
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    sub edx, 0x6c
    add eax, 0x6c
    call UPDATESECTOR
    mov ecx, dword [esp + 0x20]
    test cx, cx
    jl near loc_1899
    movsx edx, word [esi + 0x18]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, cx
    lea eax, [edx*4]
    lea ebx, [ebx*8]
    add eax, edx
    mov ebp, dword [ebx + LINK_ADDRESS_20]
    cmp ebp, dword [eax*8 + LINK_ADDRESS_20]
    jne short loc_1899
    lea ebx, [esp + 0x20]
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    add edx, 0x6c
    sub eax, 0x6c
    call UPDATESECTOR
    mov eax, dword [esp + 0x20]
    test ax, ax
    jl short loc_18bb
    movsx edx, word [esi + 0x18]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, ax
    lea eax, [edx*4]
    add eax, edx
    lea ebx, [ebx*8]
    mov eax, dword [eax*8 + LINK_ADDRESS_20]
    cmp eax, dword [ebx + LINK_ADDRESS_20]
    je short loc_18bb
loc_1899:
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_18bb:
    movsx ebx, di
    imul edx, ebx, 0x2c
    movsx edx, word [edx + LINK_ADDRESS_4]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_57], 1
    jne short loc_18f3
    mov edx, 5
    mov eax, ebx
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_18f3:
    mov ebx, dword [esp + 0x1c]
    test bx, bx
    jl near loc_196a
    cmp word [esi + 0xe], 0x1125
    je near loc_196a
    movsx eax, bx
    imul eax, eax, 0x2c
    mov bl, byte [eax + LINK_ADDRESS_35]
    cmp bl, 1
    jne short loc_1922
    mov byte [esi + 0x11], bl
    jmp short loc_1953
loc_1922:
    cmp bl, 6
    je short loc_194f
    mov dx, word [eax + LINK_ADDRESS_6]
    cmp dx, 0x4cb
    je short loc_194f
    cmp dx, 0x3de
    je short loc_194f
    cmp dx, 0x898
    jne short loc_1949
    mov byte [esi + 0x11], 7
    jmp short loc_1953
loc_1949:
    mov byte [esi + 0x11], 2
    jmp short loc_1953
loc_194f:
    mov byte [esi + 0x11], 0
loc_1953:
    movsx eax, word [esp + 0x1c]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_6], 0x3de
    jne short loc_196a
    mov byte [esi + 0x10], 0x7f
loc_196a:
    or byte [esi + 0xc], 0x20
loc_196e:
    cmp word [esp + 0x1c], 0
    jl short loc_1980
    mov byte [esi + 0x15], 1
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
loc_1980:
    mov edx, 5
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1998:
    or byte [esi + 0xc], 0x10
    call LINK_ADDRESS_56
    and al, 7
    add al, 7
    mov byte [esi + 0x14], al
    call LINK_ADDRESS_56
    and al, 7
    add al, 7
    mov byte [esi + 0x15], al
    sub dword [esi + 8], 0x1000
    mov eax, dword [esp + 0x1c]
    test ax, ax
    jl short loc_19d6
    cwde
    imul eax, eax, 0x2c
    mov cl, byte [eax + LINK_ADDRESS_35]
    cmp cl, 6
    jne short loc_19d6
    mov byte [esi + 0x11], cl
loc_19d6:
    movsx ebx, di
    mov eax, ebx
    mov edx, 5
    call LINK_ADDRESS_67
    mov eax, ebx
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_19f7:
    mov edx, dword [LINK_ADDRESS_47]
    movsx eax, word [esi + 0x26]
    cmp eax, edx
    jle short loc_1a27
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1a27:
    mov byte [esi + 0x14], 4
    mov byte [esi + 0x15], 5
    mov word [esi + 0x20], 0x10
    mov edx, 0x10001
    mov word [esi + 0x1e], di
    movsx eax, di
    mov word [esi + 0x28], di
    call LINK_ADDRESS_64
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    mov ebx, 0x11
    sub eax, edx
    movsx edx, di
    mov dword [eax + LINK_ADDRESS_31], ebx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    xor ecx, ecx
    sub eax, edx
    movsx edx, di
    mov dword [eax + LINK_ADDRESS_29], ecx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx ebx, word [esi + 0x1c]
    mov dword [eax + LINK_ADDRESS_26], ebx
loc_1aa6:
    cmp word [esi + 0xe], 0x549
    jne short loc_1ac1
    mov ax, word [esi + 0xc]
    mov word [esi + 0x2a], 0x14
    or eax, 0x101
    mov word [esi + 0xc], ax
loc_1ac1:
    mov edx, 2
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1ad9:
    mov cx, word [esi + 0xc]
    mov byte [esi + 0x12], 0x20
    or ecx, 0x101
    mov word [esi + 0xc], cx
loc_1aeb:
    movsx eax, di
    xor edx, edx
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1b00:
    mov cx, word [esi + 0xc]
    movsx eax, di
    and ecx, 0xfffffefe
    xor edx, edx
    mov word [esi + 0xc], cx
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1b23:
    cmp dword [LINK_ADDRESS_36], 2
    jge short loc_1b54
    cmp byte [esi + 0x11], 0
    je short loc_1b54
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1b54:
    mov byte [esi + 0x11], 0
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1b63:
    mov ax, word [esi + 0xc]
    xor ah, ah
    and al, 0x3c
    mov word [esp + 0x1c], ax
    or al, 1
    xor edx, edx
    mov word [esi + 0xc], ax
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1b8b:
    cmp word [esp + 0x1c], 0
    jl near loc_1d5d
    mov ax, word [esi + 0x18]
    mov dword [esp + 0x14], eax
    lea ebx, [esp + 0x14]
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    add edx, 0x54
    add eax, 0x54
    call UPDATESECTOR
    cmp word [esp + 0x14], 0
    jl near loc_1d07
    movsx edx, word [esi + 0x18]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, word [esp + 0x14]
    lea eax, [edx*4]
    lea ebx, [ebx*8]
    add eax, edx
    mov ebp, dword [ebx + LINK_ADDRESS_20]
    cmp ebp, dword [eax*8 + LINK_ADDRESS_20]
    jne near loc_1d07
    lea ebx, [esp + 0x14]
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    sub edx, 0x54
    sub eax, 0x54
    call UPDATESECTOR
    cmp word [esp + 0x14], 0
    jl near loc_1d07
    movsx edx, word [esi + 0x18]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, word [esp + 0x14]
    lea eax, [edx*4]
    add eax, edx
    lea ebx, [ebx*8]
    mov eax, dword [eax*8 + LINK_ADDRESS_20]
    cmp eax, dword [ebx + LINK_ADDRESS_20]
    jne near loc_1d07
    lea ebx, [esp + 0x14]
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    sub edx, 0x54
    add eax, 0x54
    call UPDATESECTOR
    mov ecx, dword [esp + 0x14]
    test cx, cx
    jl near loc_1d07
    movsx edx, word [esi + 0x18]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, cx
    lea eax, [edx*4]
    lea ebx, [ebx*8]
    add eax, edx
    mov ecx, dword [ebx + LINK_ADDRESS_20]
    cmp ecx, dword [eax*8 + LINK_ADDRESS_20]
    jne short loc_1d07
    lea ebx, [esp + 0x14]
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    add edx, 0x54
    sub eax, 0x54
    call UPDATESECTOR
    mov eax, dword [esp + 0x14]
    test ax, ax
    jl short loc_1d1c
    movsx edx, word [esi + 0x18]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, ax
    lea eax, [edx*4]
    lea ebx, [ebx*8]
    add eax, edx
    mov ebp, dword [ebx + LINK_ADDRESS_20]
    cmp ebp, dword [eax*8 + LINK_ADDRESS_20]
    je short loc_1d1c
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1d07:
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1d1c:
    movsx ebx, word [esp + 0x1c]
    imul ebx, ebx, 0x2c
    movsx edx, word [ebx + LINK_ADDRESS_68]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov al, byte [nosplit eax*2 + LINK_ADDRESS_69]
    and al, 1
    xor ah, ah
    shl eax, 2
    db 0x05, 0x20, 0x00, 0x00, 0x00    ; add eax, 0x20
    mov word [esi + 0xc], ax
    mov ax, word [ebx + LINK_ADDRESS_54]
    mov word [esi + 0x1c], ax
loc_1d5d:
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov edx, dword [eax + LINK_ADDRESS_20]
    mov dword [esi + 8], edx
    mov dx, word [eax + LINK_ADDRESS_57]
    cmp dx, 1
    je short loc_1d98
    cmp dx, 2
    je short loc_1d98
    mov byte [esi + 0x15], 0x20
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
loc_1d98:
    movsx ebx, di
    mov eax, ebx
    mov edx, 5
    call LINK_ADDRESS_67
    mov eax, ebx
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1db9:
    mov ax, word [esi + 0x28]
    mov word [esi + 0x22], ax
    mov ax, word [esi + 0xe]
    mov word [esi + 0x28], 0xffff
    cmp ax, 0x50e
    jne short loc_1ddb
    mov dx, word [esi + 0x2a]
    add edx, edx
    mov word [esi + 0x2a], dx
loc_1ddb:
    mov bx, word [esi + 0xe]
    cmp bx, 0x386
    je short loc_1ded
    cmp bx, 0x385
    jne short loc_1df9
loc_1ded:
    mov word [esi + 0xc], 0x100
    mov byte [esi + 0x12], 8
    jmp short loc_1e0a
loc_1df9:
    mov ax, word [esi + 0xc]
    mov byte [esi + 0x12], 0x20
    or eax, 0x101
    mov word [esi + 0xc], ax
loc_1e0a:
    mov edx, 2
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1e22:
    mov eax, dword [esp + 0x1c]
    test ax, ax
    jl short loc_1e96
    cwde
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_6], 0x214
    jne short loc_1e96
    movsx eax, word [esp + 0x1c]
    imul eax, eax, 0x2c
    mov al, byte [eax + LINK_ADDRESS_39]
    mov byte [esi + 0x14], al
    movsx eax, word [esp + 0x1c]
    imul eax, eax, 0x2c
    mov al, byte [eax + LINK_ADDRESS_38]
    mov byte [esi + 0x15], al
    movsx eax, word [esp + 0x1c]
    imul eax, eax, 0x2c
    mov al, byte [eax + LINK_ADDRESS_33]
    mov byte [esi + 0x10], al
    movsx eax, word [esp + 0x1c]
    imul eax, eax, 0x2c
    movsx edx, word [eax + LINK_ADDRESS_68]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov al, byte [nosplit eax*2 + LINK_ADDRESS_70]
    mov byte [esi + 0x11], al
loc_1e96:
    mov word [esi + 0xc], 0
    mov word [esi + 0x2a], 1
    mov word [esi + 0x20], 0x124
    mov word [esi + 0x24], 0x168
loc_1eae:
    cmp word [esi + 0xe], 0xc76
    jne short loc_1ee9
    mov byte [esi + 0x15], 0x18
    mov al, byte [esi + 0x15]
    mov ecx, dword [esp + 0x1c]
    mov byte [esi + 0x14], al
    test cx, cx
    jl short loc_1efb
    movsx edx, cx
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + LINK_ADDRESS_22]
    mov dword [esi + 8], eax
    jmp short loc_1efb
loc_1ee9:
    mov bx, word [esi + 0xc]
    mov byte [esi + 0x12], 0x80
    or ebx, 0x101
    mov word [esi + 0xc], bx
loc_1efb:
    cmp word [esi + 0xe], 0x2fa
    jne short loc_1f0b
    mov ax, word [esi + 0x28]
    mov word [esi + 0x22], ax
loc_1f0b:
    mov edx, 1
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1f23:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [esi]
    mov dword [edx + LINK_ADDRESS_31], eax
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [esi + 4]
    mov dword [eax + LINK_ADDRESS_30], edx
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_1f6b:
    mov byte [esi + 0x15], 3
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
    call LINK_ADDRESS_56
    xor ah, ah
    mov edx, 0x10
    and al, 0xc
    add edx, eax
    movsx eax, di
    mov word [esi + 0xc], dx
    call LINK_ADDRESS_67
loc_1f91:
    mov bx, word [esi + 0xe]
    cmp bx, 0x4d1
    je short loc_1faa
    cmp bx, 0x113a
    je short loc_1faa
    cmp bx, 0x116c
    jne short loc_1ff5
loc_1faa:
    call LINK_ADDRESS_56
    movsx edx, di
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    and ebx, 0x7ff
    mov dword [eax + LINK_ADDRESS_31], ebx
    call LINK_ADDRESS_56
    xor ah, ah
    mov byte [esi + 0x15], 8
    and al, 0xc
    mov word [esi + 0xc], ax
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
    call LINK_ADDRESS_56
    and ah, 7
    mov word [esi + 0x1c], ax
loc_1ff5:
    mov edx, 5
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_200d:
    mov word [esi + 0x26], 1
    mov edx, 6
    mov word [esi + 0x2a], 1
    movsx eax, di
    mov word [esi + 0x1e], di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2035:
    mov edx, dword [esp + 0x1c]
    test dx, dx
    jl near loc_43cf
    movsx eax, dx
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_6], 0x214
    jne near loc_212e
    mov ax, word [eax + LINK_ADDRESS_68]
    movsx edx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    call LINK_ADDRESS_56
    xor ah, ah
    mov bx, word [edx + LINK_ADDRESS_71]
    and al, 0x3f
    movsx ebp, di
    sub ebx, eax
    call LINK_ADDRESS_56
    mov ecx, eax
    lea eax, [ebp*8]
    add eax, ebp
    lea eax, [eax*8]
    sub eax, ebp
    and ecx, 1
    mov dword [eax + LINK_ADDRESS_31], ecx
    mov cx, word [esi + 0xe]
    add ebx, 8
    cmp cx, 0x9e7
    jne short loc_20eb
    movsx eax, word [edx + LINK_ADDRESS_72]
    mov ecx, dword [edx + LINK_ADDRESS_73]
    add ecx, eax
    mov eax, dword [edx + LINK_ADDRESS_74]
    add eax, 0x600
    mov edx, dword [edx + LINK_ADDRESS_75]
    shl ecx, 4
    add edx, eax
    lea eax, [ecx - 0x640]
    sub edx, eax
    mov dword [esi + 8], edx
    jmp short loc_211b
loc_20eb:
    movsx ecx, word [edx + LINK_ADDRESS_72]
    mov ebp, dword [edx + LINK_ADDRESS_73]
    mov eax, dword [edx + LINK_ADDRESS_74]
    add ecx, ebp
    add eax, 0x300
    shl ecx, 4
    mov ebp, dword [edx + LINK_ADDRESS_75]
    sub ecx, 0x640
    add eax, ebp
    sub eax, ecx
    mov dword [esi + 8], eax
loc_211b:
    call LINK_ADDRESS_56
    xor ah, ah
    mov word [esi + 0x24], ax
    neg eax
    mov word [esi + 0x24], ax
    jmp short loc_2140
loc_212e:
    mov eax, dword [eax + LINK_ADDRESS_1]
    sub eax, 0x2300
    mov bx, word [esi + 0x1c]
    mov dword [esi + 8], eax
loc_2140:
    movsx edx, word [esp + 0x1c]
    imul edx, edx, 0x2c
    movsx ecx, bx
    add ecx, 0x200
    and ecx, 0x7ff
    movsx ecx, word [nosplit ecx*2 + SINTABLE]
    sar ecx, 7
    mov eax, dword [edx + SPRITE]
    add eax, ecx
    mov dword [esi], eax
    mov eax, ebx
    and ah, 7
    cwde
    movsx ecx, word [nosplit eax*2 + SINTABLE]
    mov eax, dword [edx + LINK_ADDRESS_2]
    mov byte [esi + 0x10], 0xf8
    mov word [esi + 0x20], 0x14
    sar ecx, 7
    mov byte [esi + 0x15], 4
    add eax, ecx
    mov dword [esi + 4], eax
    sub ebx, 0x200
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    mov word [esi + 0x1c], bx
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_21be:
    mov word [esi + 0x2a], 0x35
loc_21c4:
    cmp dword [LINK_ADDRESS_36], 2
    jge short loc_21f5
    cmp byte [esi + 0x11], 1
    jne short loc_21f5
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_21f5:
    mov edx, 0xb
    movsx eax, di
    mov word [esi + 0xc], 0x8000
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2213:
    mov ecx, dword [esp + 0x1c]
    test cx, cx
    jl short loc_2240
    movsx eax, cx
    imul eax, eax, 0x2c
    mov ax, word [eax + LINK_ADDRESS_54]
    mov byte [esi + 0x10], 0xc0
    mov word [esi + 0x1c], ax
    call LINK_ADDRESS_56
    xor ah, ah
    and al, 4
    or al, 0x80
    mov word [esi + 0xc], ax
loc_2240:
    mov ax, word [esi + 0xe]
    cmp ax, 0x762
    je short loc_2250
    cmp ax, 0x8ab
    jne short loc_2267
loc_2250:
    mov byte [esi + 0x14], 0x30
    mov byte [esi + 0x15], 0x30
    mov dh, byte [esi + 0xc]
    mov byte [esi + 0x10], 0x81
    or dh, 0x80
    mov byte [esi + 0xc], dh
    jmp short loc_229b
loc_2267:
    cmp ax, 0x678
    jne short loc_2277
    mov byte [esi + 0x14], 0x20
    mov byte [esi + 0x15], 0x20
    jmp short loc_229b
loc_2277:
    cmp ax, 0x919
    jne short loc_2287
    mov byte [esi + 0x14], 0x18
    mov byte [esi + 0x15], 0x18
    jmp short loc_229b
loc_2287:
    cmp ax, 0x8de
    je short loc_2293
    cmp ax, 0x906
    jne short loc_229b
loc_2293:
    mov byte [esi + 0x14], 4
    mov byte [esi + 0x15], 4
loc_229b:
    cmp word [esp + 0x1c], 0
    jl short loc_22be
    mov ebx, dword [esi + 4]
    mov edx, dword [esi]
    movsx eax, word [esi + 0x18]
    call GETFLORZOFSLOPE
    sub eax, 0xc00
    cmp eax, dword [esi + 8]
    jge short loc_22be
    mov dword [esi + 8], eax
loc_22be:
    mov edx, 5
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_22d6:
    mov ebx, dword [esp + 0x1c]
    test bx, bx
    jl short loc_231f
    movsx eax, bx
    imul eax, eax, 0x2c
    mov al, byte [eax + LINK_ADDRESS_39]
    mov byte [esi + 0x14], al
    movsx eax, bx
    imul eax, eax, 0x2c
    mov al, byte [eax + LINK_ADDRESS_38]
    movsx edx, word [esi + 0x18]
    mov byte [esi + 0x15], al
    lea eax, [edx*4]
    add eax, edx
    mov word [esi + 0x24], 0x80
    cmp word [eax*8 + LINK_ADDRESS_57], 2
    je short loc_231f
    or byte [esi + 0xd], 0x80
loc_231f:
    mov edx, 0xd
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2337:
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
    mov ax, word [LINK_ADDRESS_37]
    mov word [esp + 0x1c], ax
    db 0x66, 0x3d, 0x02, 0x00    ; cmp ax, 2
    jne short loc_2359
    xor edx, edx
    mov word [esp + 0x1c], dx
loc_2359:
    mov edx, dword [LINK_ADDRESS_36]
    cmp edx, 2
    jl short loc_2373
    cmp edx, 1
    jle short loc_238b
    mov eax, dword [esp + 0x1c]
    cmp ax, word [esi + 0x26]
    je short loc_238b
loc_2373:
    mov edx, 5
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_238b:
    mov edx, 0xa
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_23a3:
    mov ecx, dword [esp + 0x1c]
    test cx, cx
    jl short loc_23c4
    movsx eax, cx
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_6], 0x214
    jne short loc_23c4
    sub dword [esi + 8], 0x1000
loc_23c4:
    cmp word [esi + 0xe], 0x295
    jne short loc_23ec
    mov ecx, dword [esp + 0x1c]
    test cx, cx
    jl short loc_23e6
    movsx eax, cx
    imul eax, eax, 0x2c
    mov ax, word [eax + LINK_ADDRESS_54]
    mov word [esi + 0x1c], ax
loc_23e6:
    mov byte [esi + 0x15], 4
    jmp short loc_23f0
loc_23ec:
    mov byte [esi + 0x15], 0x20
loc_23f0:
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
    mov edx, 5
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_240e:
    movsx edx, word [esp + 0x10]
    mov cx, word [esi + 0xc]
    lea eax, [edx*4]
    or ecx, 0x141
    add eax, edx
    mov dx, word [esi + 0xe]
    mov word [esi + 0xc], cx
    add edx, 2
    mov word [esi + 0xe], dx
    mov eax, dword [eax*8 + LINK_ADDRESS_21]
    add eax, 0x3000
    movsx edx, di
    mov dword [esi + 8], eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [LINK_ADDRESS_77]
    mov dword [edx + LINK_ADDRESS_27], eax
    mov edx, eax
    mov eax, dword [esi]
    mov dword [edx*4 + LINK_ADDRESS_78], eax
    mov eax, dword [esi + 4]
    mov dword [edx*4 + LINK_ADDRESS_79], eax
    mov eax, edx
    lea edx, [eax*4]
    mov eax, dword [esi + 8]
    mov bx, word [HEADSPRITESTAT]
    mov dword [edx + LINK_ADDRESS_81], eax
loc_2494:
    test bx, bx
    jl near loc_256c
    movsx ebp, bx
    imul eax, ebp, 0x2c
    cmp word [eax + LINK_ADDRESS_6], 0x4c5
    jne near loc_2597
    movsx edx, di
    mov dword [esp + 8], edx
    imul edx, edx, 0x2c
    mov cx, word [eax + LINK_ADDRESS_40]
    cmp cx, word [edx + LINK_ADDRESS_40]
    jne near loc_2597
    movsx edx, word [eax + LINK_ADDRESS_4]
    mov ebx, dword [esp + 8]
    mov dword [esp], edx
    lea edx, [ebx*8]
    add edx, ebx
    lea edx, [edx*8]
    sub edx, ebx
    mov ebx, dword [esp]
    mov dword [edx + LINK_ADDRESS_30], ebx
    mov dh, 0x30
    mov ecx, dword [LINK_ADDRESS_77]
    mov byte [eax + LINK_ADDRESS_39], dh
    mov dword [ecx*4 + LINK_ADDRESS_82], ebp
    mov edx, dword [eax + SPRITE]
    mov bl, 0x80
    mov dword [ecx*4 + LINK_ADDRESS_83], edx
    mov edx, dword [eax + LINK_ADDRESS_2]
    mov byte [eax + LINK_ADDRESS_38], bl
    mov dword [ecx*4 + LINK_ADDRESS_84], edx
    mov edx, dword [esi]
    mov dword [eax + SPRITE], edx
    mov edx, dword [esi + 4]
    mov dword [eax + LINK_ADDRESS_2], edx
    mov edx, dword [esi + 8]
    mov dword [eax + LINK_ADDRESS_1], edx
    mov dl, byte [esi + 0x10]
    mov byte [eax + LINK_ADDRESS_33], dl
    mov ebx, dword [eax + LINK_ADDRESS_2]
    mov ecx, dword [eax + LINK_ADDRESS_1]
    mov edx, dword [eax + SPRITE]
    mov eax, ebp
    call LINK_ADDRESS_55
loc_256c:
    add dword [LINK_ADDRESS_77], 3
    mov edx, 6
    mov word [esi + 0x1e], 0xffff
    movsx eax, di
    mov word [esi + 0x2a], 8
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2597:
    movsx ebx, bx
    mov bx, word [nosplit ebx*2 + NEXTSPRITESTAT]
    jmp near loc_2494
loc_25a7:
    mov eax, dword [esp + 0x1c]
    test ax, ax
    jl short loc_25be
    cwde
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_62], 0xa
    je short loc_25d4
loc_25be:
    movsx eax, word [esp + 0x1c]
    imul edx, eax, 0x2c
    cmp word [edx + LINK_ADDRESS_62], 1
    jne near loc_265c
loc_25d4:
    movsx eax, word [esp + 0x1c]
    imul eax, eax, 0x2c
    mov byte [esi + 0x10], 0x20
    cmp byte [eax + LINK_ADDRESS_35], 1
    je short loc_25fb
    mov edx, dword [esi + 8]
    mov byte [esi + 0x11], 2
    sub edx, 0x1200
    mov dword [esi + 8], edx
    jmp short loc_2602
loc_25fb:
    sub dword [esi + 8], 0xd00
loc_2602:
    movsx edx, word [CONNECTHEAD]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    add ebx, ebx
    mov ecx, dword [esi + 4]
    mov ebp, dword [esi]
    mov edx, dword [ebx + LINK_ADDRESS_87]
    mov eax, dword [ebx + LINK_ADDRESS_88]
    sub edx, ecx
    sub eax, ebp
    call GETANGLE
    mov word [esi + 0x1c], ax
    call LINK_ADDRESS_56
    xor ah, ah
    mov edx, 0x30
    and al, 0x1f
    sub edx, eax
    movsx eax, di
    mov word [esi + 0x20], dx
    mov edx, 0x10001
    call LINK_ADDRESS_64
    jmp short loc_2698
loc_265c:
    cmp eax, -1
    jne short loc_2698
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    mov ebp, dword [esi + 8]
    lea eax, [eax*8]
    add ebp, 0x400
    sub eax, edx
    mov dword [esi + 8], ebp
    mov edx, eax
    mov dword [eax + LINK_ADDRESS_31], ebp
    call LINK_ADDRESS_56
    and eax, 0x7f
    mov dword [edx + LINK_ADDRESS_30], eax
loc_2698:
    cmp word [esi + 0xe], 0x294
    je short loc_26ac
    call LINK_ADDRESS_56
    and ah, 7
    mov word [esi + 0x1c], ax
loc_26ac:
    mov edx, 6
    mov byte [esi + 0x14], 0x18
    movsx eax, di
    mov byte [esi + 0x15], 0x18
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_26cc:
    mov edx, 6
    movsx eax, di
    mov word [esi + 0x26], 0x270f
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_26ea:
    movsx edx, word [esp + 0x10]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    lea ebx, [ebx*8]
    mov edx, eax
    mov eax, dword [ebx + LINK_ADDRESS_20]
    mov dword [edx + LINK_ADDRESS_29], eax
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_57], 1
    je short loc_2772
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_57], 2
    je short loc_2772
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov eax, dword [esi + 8]
    mov dword [edx + LINK_ADDRESS_20], eax
loc_2772:
    cmp byte [esi + 0x11], 0
    je short loc_27a3
    cmp dword [LINK_ADDRESS_36], 1
    jle short loc_27a3
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_27a3:
    mov bl, byte [esi + 0xd]
    mov edx, 6
    or bl, 0x80
    movsx eax, di
    mov byte [esi + 0xd], bl
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_27c4:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    xor ebx, ebx
    sub eax, edx
    mov bl, byte [esi + 0x14]
    xor edx, edx
    mov dword [eax + LINK_ADDRESS_31], ebx
    mov dl, byte [esi + 0x15]
    mov dword [eax + LINK_ADDRESS_30], edx
loc_27ef:
    cmp word [esi + 0xe], 8
    jne short loc_27fa
    or byte [esi + 0xd], 0x80
loc_27fa:
    mov edx, 6
    movsx eax, di
    mov word [esi + 0x22], 0
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2818:
    mov edx, 1
    mov bx, word [esi + 0xc]
    mov word [esi + 0x2a], 1
    or ebx, 0x101
    movsx eax, di
    mov word [esi + 0xc], bx
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2844:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov ax, word [esi + 0x18]
    mov word [edx + LINK_ADDRESS_19], ax
loc_2866:
    cmp word [esi + 0xe], 0x942
    jne short loc_2874
    mov word [esi + 0x2a], 1
loc_2874:
    cmp byte [esi + 0x11], 0
    jne short loc_28b0
    mov ax, word [esi + 0xe]
    cmp ax, 0x6bd
    jb short loc_289a
    jbe short loc_28ac
    cmp ax, 0x6cd
    jb short loc_28b0
    cmp ax, 0x6ce
    jbe short loc_28ac
    cmp ax, 0x6d0
    je short loc_28ac
    jmp short loc_28b0
loc_289a:
    cmp ax, 0x690
    jb short loc_28b0
    cmp ax, 0x692
    jbe short loc_28ac
    cmp ax, 0x6b3
    jne short loc_28b0
loc_28ac:
    mov byte [esi + 0x11], 0x16
loc_28b0:
    mov dx, word [esi + 0xe]
    cmp dx, 0x1285
    je short loc_28de
    cmp dx, 0xa46
    je short loc_28de
    cmp dx, 0xa96
    je short loc_28de
    cmp dx, 0xa47
    je short loc_28de
    cmp dx, 0xac8
    je short loc_28de
    cmp dx, 0x1284
    jne short loc_2920
loc_28de:
    mov eax, dword [esp + 0x1c]
    test ax, ax
    jl short loc_28fe
    cwde
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_6], 9
    jne short loc_28fe
    mov al, byte [eax + LINK_ADDRESS_35]
    mov byte [esi + 0x11], al
loc_28fe:
    cmp byte [esi + 0x11], 0
    je short loc_2912
    mov byte [esi + 0x12], 0x50
    mov byte [esi + 0x14], 0x28
    mov byte [esi + 0x15], 0x28
    jmp short loc_2941
loc_2912:
    mov byte [esi + 0x14], 0x50
    mov byte [esi + 0x15], 0x50
    mov byte [esi + 0x12], 0xa4
    jmp short loc_2941
loc_2920:
    cmp dx, 0x60e
    je short loc_2935
    mov byte [esi + 0x14], 0x28
    mov byte [esi + 0x15], 0x28
    mov byte [esi + 0x12], 0x50
    jmp short loc_2941
loc_2935:
    mov byte [esi + 0x14], 0x3c
    mov byte [esi + 0x15], 0x3c
    mov byte [esi + 0x12], 0x28
loc_2941:
    cmp word [esp + 0x1c], 0
    jl short loc_294f
    mov word [esi + 0x26], 0
loc_294f:
    mov edx, dword [LINK_ADDRESS_47]
    movsx eax, word [esi + 0x26]
    cmp eax, edx
    jg short loc_2966
    cmp dword [LINK_ADDRESS_50], 1
    jne short loc_2988
loc_2966:
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2988:
    movsx eax, di
    call LINK_ADDRESS_51
    cmp word [esi + 0xe], 0x4f3
    jne short loc_29b6
    call LINK_ADDRESS_56
    mov byte [esi + 0x15], 0x30
    and ah, 7
    mov word [esi + 0xc], 0
    mov word [esi + 0x1c], ax
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
    jmp short loc_29ec
loc_29b6:
    mov ax, word [esi + 0xc]
    or eax, 0x101
    mov dx, word [esi + 0xe]
    mov word [esi + 0xc], ax
    cmp dx, 0x60e
    je short loc_29ec
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    inc byte [nosplit eax*2 + LINK_ADDRESS_53]
loc_29ec:
    cmp word [esi + 0xe], 0x974
    jne short loc_29f8
    or byte [esi + 0xc], 0x80
loc_29f8:
    cmp word [esp + 0x1c], 0
    jl short loc_2a30
    movsx ebx, di
    mov edx, ebx
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    xor edx, ebx
    mov word [eax + LINK_ADDRESS_10], dx
    mov eax, ebx
    mov edx, 1
    call 0x12ab0
    mov eax, ebx
    jmp short loc_2a38
loc_2a30:
    mov edx, 2
    movsx eax, di
loc_2a38:
    call LINK_ADDRESS_42
    cmp word [esi + 0xe], 0x938
    jne near loc_43cf
    mov word [esi + 0x24], 0
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2a5a:
    mov ah, byte [esi + 0xd]
    or ah, 0x80
    mov edx, 7
    mov byte [esi + 0xd], ah
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2a7b:
    mov ax, word [esi + 0xc]
    or eax, 0x101
    mov edx, 6
    mov word [esi + 0xc], ax
    movsx eax, di
    mov byte [esi + 0x10], 0xf4
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2aa4:
    mov edx, dword [esp + 0x1c]
    mov byte [esi + 0x10], 0xf4
    test dx, dx
    jl short loc_2ace
    movsx eax, dx
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_6], 0x4cb
    jne short loc_2ac6
    mov byte [esi + 0x11], 8
loc_2ac6:
    movsx eax, di
    call LINK_ADDRESS_67
loc_2ace:
    movsx ebx, di
    mov edx, 1
    mov eax, ebx
    call LINK_ADDRESS_42
    mov eax, ebx
    lea edx, [ebx*8]
    add edx, ebx
    lea edx, [edx*8]
    sub edx, ebx
    call LINK_ADDRESS_90
    mov eax, dword [edx + LINK_ADDRESS_22]
    sub eax, dword [edx + LINK_ADDRESS_23]
    sar eax, 9
    mov word [esp + 0x1c], ax
    mov al, byte [esp + 0x1c]
    mov byte [esi + 0x15], al
    movsx eax, word [esp + 0x1c]
    mov edx, 0x19
    sar eax, 1
    sub edx, eax
    mov byte [esi + 0x14], dl
    call LINK_ADDRESS_56
    xor ah, ah
    mov cx, word [esi + 0xc]
    and al, 4
    or ecx, eax
    mov word [esi + 0xc], cx
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2b40:
    mov ecx, dword [esp + 0x1c]
    test cx, cx
    jl short loc_2b4f
    mov word [esi + 0x1e], cx
    jmp short loc_2b53
loc_2b4f:
    mov word [esi + 0x1e], di
loc_2b53:
    mov byte [esi + 0x15], 9
    mov word [esi + 0x22], 4
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
loc_2b63:
    cmp word [esi + 0xe], 0x7a8
    jne near loc_2c14
    mov ecx, dword [LINK_ADDRESS_47]
    movsx eax, word [esi + 0x26]
    cmp eax, ecx
    jle short loc_2b9f
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2b9f:
    movsx edx, word [MYCONNECTINDEX]
    mov ecx, edx
    shl ecx, 7
    movsx ebx, di
    sub ecx, edx
    lea eax, [ebx*8]
    lea ecx, [ecx*4]
    add eax, ebx
    sub ecx, edx
    lea eax, [eax*8]
    add ecx, ecx
    sub eax, ebx
    xor ebp, ebp
    mov dh, byte [ecx + LINK_ADDRESS_53]
    mov dword [eax + LINK_ADDRESS_26], ebp
    inc dh
    mov eax, dword [LINK_ADDRESS_50]
    mov byte [ecx + LINK_ADDRESS_53], dh
    cmp eax, 1
    jne short loc_2c0e
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    mov eax, ebx
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2c0e:
    mov word [esi + 0x2a], 0x82
loc_2c14:
    mov dx, word [esi + 0xe]
    cmp dx, 0x440
    je short loc_2c26
    cmp dx, 0x242
    jne short loc_2c30
loc_2c26:
    mov ax, word [LINK_ADDRESS_43]
    mov word [esi + 0x2a], ax
loc_2c30:
    movsx eax, di
    imul edx, eax, 0x2c
    or word [edx + LINK_ADDRESS_32], 0x101
    cmp dword [LINK_ADDRESS_36], 2
    jge short loc_2c6d
    cmp byte [esi + 0x11], 0
    je short loc_2c6d
    mov byte [esi + 0x15], 0
    mov dl, byte [esi + 0x15]
    mov byte [esi + 0x14], dl
    mov edx, 5
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2c6d:
    movsx eax, di
    imul edx, eax, 0x2c
    mov bh, 0xef
    mov byte [esi + 0x11], 0
    mov byte [edx + LINK_ADDRESS_33], bh
    mov edx, 2
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2c94:
    cmp word [esp + 0x1c], 0
    jl short loc_2cd0
    mov word [esi + 0x26], 0
    mov edx, 0x10001
    mov ebx, dword [esi + 8]
    mov word [esi + 0x24], 0xfc00
    sub ebx, 0x2000
    movsx eax, di
    mov dword [esi + 8], ebx
    call LINK_ADDRESS_64
    call LINK_ADDRESS_56
    xor ah, ah
    and al, 4
    mov word [esi + 0xc], ax
    jmp short loc_2cda
loc_2cd0:
    mov word [esi + 0xc], 0
    mov word [esi + 0x1e], di
loc_2cda:
    cmp dword [LINK_ADDRESS_36], 2
    jge short loc_2ce9
    cmp byte [esi + 0x11], 0
    jne short loc_2cf7
loc_2ce9:
    mov ebp, dword [LINK_ADDRESS_47]
    movsx eax, word [esi + 0x26]
    cmp eax, ebp
    jle short loc_2d19
loc_2cf7:
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2d19:
    mov byte [esi + 0x11], 0
loc_2d1d:
    cmp word [esi + 0xe], 0x64
    jne short loc_2d28
    or byte [esi + 0xc], 0x80
loc_2d28:
    cmp dword [LINK_ADDRESS_36], 1
    jle short loc_2d63
    cmp dword [LINK_ADDRESS_37], 1
    je short loc_2d63
    cmp word [esi + 0xe], 0x3c
    jne short loc_2d63
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2d63:
    cmp word [esi + 0xe], 0x28
    jne short loc_2d70
    mov byte [esi + 0x15], 0x10
    jmp short loc_2d74
loc_2d70:
    mov byte [esi + 0x15], 0x20
loc_2d74:
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
    mov byte [esi + 0x10], 0xef
    cmp word [esp + 0x1c], 0
    jl short loc_2d9e
    mov edx, 1
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2d9e:
    movsx ebx, di
    mov edx, 2
    mov eax, ebx
    call LINK_ADDRESS_42
    mov eax, ebx
    call LINK_ADDRESS_51
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2dbf:
    movsx eax, di
    imul eax, eax, 0x2c
    mov word [eax + LINK_ADDRESS_41], 1
loc_2dce:
    movsx eax, di
    imul edx, eax, 0x2c
    mov ebx, 0x101
    mov ecx, 1
    mov word [edx + LINK_ADDRESS_32], bx
    mov word [edx + LINK_ADDRESS_44], cx
    mov edx, 6
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2e01:
    mov edx, 6
    movsx eax, di
    mov byte [esi + 0x10], 0x81
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2e1d:
    mov byte [esi + 0x15], 0x18
    mov byte [esi + 0x10], 0x81
    mov dx, word [esi + 0xc]
    mov word [esi + 0x1e], di
    or edx, 0x101
    mov al, byte [esi + 0x15]
    mov word [esi + 0xc], dx
    mov byte [esi + 0x14], al
    mov ax, word [LINK_ADDRESS_43]
    shl eax, 2
    mov edx, 2
    mov word [esi + 0x2a], ax
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2e62:
    mov word [esi + 0x2a], 1
    cmp byte [LINK_ADDRESS_91], 0
    je short loc_2e79
    mov word [esi + 0xc], 0x101
    jmp short loc_2e7f
loc_2e79:
    mov word [esi + 0xc], 0
loc_2e7f:
    cmp dword [LINK_ADDRESS_36], 2
    jge short loc_2eb0
    cmp byte [esi + 0x11], 0
    je short loc_2eb0
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2eb0:
    mov ax, word [esi + 0xe]
    mov byte [esi + 0x11], 0
    cmp ax, 0x22a
    je near loc_43cf
    cmp ax, 0x3d1
    je near loc_43cf
    mov edx, 1
    movsx eax, di
    mov word [esi + 0xe], 0x26d
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2eea:
    mov eax, dword [esp + 0x1c]
    test ax, ax
    jl short loc_2f25
    cwde
    imul eax, eax, 0x2c
    mov ax, word [eax + LINK_ADDRESS_54]
    mov word [esi + 0xc], 0x92
    mov byte [esi + 0x15], 1
    mov word [esi + 0x1c], ax
    mov al, byte [esi + 0x15]
    mov edx, 0x10001
    mov byte [esi + 0x14], al
    movsx eax, di
    mov word [esi + 0x20], 0xfff8
    call LINK_ADDRESS_64
loc_2f25:
    mov edx, 6
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_2f3d:
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + LINK_ADDRESS_92]
    mov byte [esi + 0x15], 0
    mov word [esi + 0x22], ax
    mov al, byte [esi + 0x15]
    mov cl, byte [esi + 0xd]
    mov byte [esi + 0x14], al
    or cl, 0x80
    mov ax, word [esi + 0x26]
    mov byte [esi + 0xd], cl
    db 0x66, 0x3d, 0x24, 0x00    ; cmp ax, 0x24
    ja near loc_4138
    and eax, 0xffff
    jmp dword cs:[eax*4 + LINK_ADDRESS_93]
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + LINK_ADDRESS_26], 0x41
    jmp near loc_4138
    cmp word [esi + 0x26], 0x17
    je near loc_3039
    xor ebx, ebx
    mov word [esp + 0x1c], bx
    mov edx, dword [esp + 0x1c]
    cmp dx, 0x1000
    jl short loc_2fcb
    jmp near loc_3046
loc_2fcb:
    movsx eax, dx
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_62], 0x400
    jge short loc_3027
    cmp word [eax + LINK_ADDRESS_6], 1
    jne short loc_3027
    mov dx, word [eax + LINK_ADDRESS_41]
    cmp dx, 7
    je short loc_2ff9
    cmp dx, 0x17
    jne short loc_3027
loc_2ff9:
    mov ecx, dword [esp + 0x1c]
    cmp di, cx
    je short loc_3027
    movsx edx, cx
    imul edx, edx, 0x2c
    movsx eax, di
    imul eax, eax, 0x2c
    mov dx, word [edx + LINK_ADDRESS_40]
    cmp dx, word [eax + LINK_ADDRESS_40]
    jne short loc_3027
    mov word [eax + LINK_ADDRESS_8], cx
    jmp short loc_3046
loc_3027:
    inc word [esp + 0x1c]
    mov edx, dword [esp + 0x1c]
    cmp dx, 0x1000
    jl short loc_2fcb
    jmp short loc_3046
loc_3039:
    movsx eax, di
    imul eax, eax, 0x2c
    mov word [eax + LINK_ADDRESS_8], di
loc_3046:
    movsx edx, word [esp + 0x10]
    lea ebx, [edx*4]
    movsx eax, di
    add ebx, edx
    imul edx, eax, 0x2c
    lea ebx, [ebx*8]
    mov eax, dword [ebx + LINK_ADDRESS_20]
    cmp eax, dword [edx + LINK_ADDRESS_1]
    sete al
    movsx ebx, di
    mov ecx, eax
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    and ecx, 0xff
    mov edx, 9
    mov dword [eax + LINK_ADDRESS_27], ecx
    mov eax, ebx
    mov word [esi + 0xc], 0
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ecx, 1
    mov word [esi + 0x1e], 0xffff
    mov dword [eax + LINK_ADDRESS_31], ecx
    jmp near loc_4138
    cmp word [esi + 0x1c], 0x200
    jne short loc_3143
    movsx edx, word [esp + 0x10]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    lea ebx, [ebx*8]
    sub eax, edx
    mov edx, dword [ebx + LINK_ADDRESS_21]
    mov dword [eax + LINK_ADDRESS_30], edx
    cmp byte [esi + 0x11], 0
    je near loc_319d
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov eax, dword [esi + 8]
    mov dword [edx + LINK_ADDRESS_21], eax
    jmp short loc_319d
loc_3143:
    movsx edx, word [esp + 0x10]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    lea ebx, [ebx*8]
    sub eax, edx
    mov edx, dword [ebx + LINK_ADDRESS_20]
    mov dword [eax + LINK_ADDRESS_30], edx
    cmp byte [esi + 0x11], 0
    je short loc_319d
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov eax, dword [esi + 8]
    mov dword [edx + LINK_ADDRESS_20], eax
loc_319d:
    shl word [esi + 0x28], 2
    jmp near loc_4138
    mov word [esi + 0x1e], 0xffff
    jmp near loc_4138
    movsx edx, word [esp + 0x10]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    lea ebx, [ebx*8]
    mov edx, eax
    mov eax, dword [ebx + LINK_ADDRESS_21]
    mov dword [edx + LINK_ADDRESS_28], eax
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + LINK_ADDRESS_27], 1
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov eax, dword [esi + 8]
    mov dword [edx + LINK_ADDRESS_21], eax
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    mov edx, SECTOR
    lea eax, [eax*8]
    add eax, edx
    add eax, 4
    call LINK_ADDRESS_95
    jmp near loc_4138
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov eax, dword [esi + 8]
    mov dword [edx + LINK_ADDRESS_21], eax
    jmp near loc_4138
    cmp dword [LINK_ADDRESS_96], 1
    jne near loc_4138
    mov byte [esi + 0x15], 0x40
    mov ch, byte [esi + 0xd]
    mov al, byte [esi + 0x15]
    and ch, 0x7f
    mov byte [esi + 0x14], al
    mov byte [esi + 0xd], ch
    jmp near loc_4138
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    movsx edx, di
    movsx ebx, byte [eax*8 + LINK_ADDRESS_97]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx edx, word [esp + 0x10]
    mov dword [eax + LINK_ADDRESS_30], ebx
    lea eax, [edx*4]
    add eax, edx
    movsx edx, di
    movsx ebx, byte [eax*8 + LINK_ADDRESS_98]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + LINK_ADDRESS_29], ebx
    jmp near loc_4138
    movsx edx, word [esp + 0x10]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    lea ebx, [ebx*8]
    mov edx, eax
    mov eax, dword [ebx + LINK_ADDRESS_21]
    mov dword [edx + LINK_ADDRESS_31], eax
    movsx edx, word [esp + 0x10]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    lea ebx, [ebx*8]
    mov edx, eax
    mov eax, dword [ebx + LINK_ADDRESS_20]
    mov dword [edx + LINK_ADDRESS_30], eax
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ecx, dword [esi + 8]
    mov eax, dword [eax + LINK_ADDRESS_31]
    sub eax, ecx
    movsx edx, di
    test eax, eax
    jns short loc_3398
    neg eax
loc_3398:
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ebp, dword [esi + 8]
    mov eax, dword [eax + LINK_ADDRESS_30]
    sub eax, ebp
    test eax, eax
    jns short loc_33bd
    neg eax
loc_33bd:
    cmp ebx, eax
    setl al
    xor ah, ah
    mov dx, word [esi + 0x1c]
    mov word [esi + 0x1e], ax
    cmp dx, 0x200
    jne short loc_3412
    test ax, ax
    je short loc_33f8
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov eax, dword [esi + 8]
    mov dword [edx + LINK_ADDRESS_21], eax
    jmp short loc_3431
loc_33f8:
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [esi + 8]
    mov dword [eax*8 + LINK_ADDRESS_20], edx
    jmp short loc_3431
loc_3412:
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [esi + 8]
    mov dword [eax*8 + LINK_ADDRESS_20], edx
    mov dword [eax*8 + LINK_ADDRESS_21], edx
loc_3431:
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov bl, byte [edx + LINK_ADDRESS_99]
    test bl, 1
    je near loc_4138
    mov bh, bl
    xor bh, 1
    mov byte [edx + LINK_ADDRESS_99], bh
    movsx ebx, di
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov dword [eax + LINK_ADDRESS_28], 1
    cmp word [esi + 0x1e], 0
    jne short loc_349d
    cmp word [esi + 0x1c], 0x200
    jne short loc_349d
    xor byte [edx + LINK_ADDRESS_99], 1
    xor ecx, ecx
    mov dword [eax + LINK_ADDRESS_28], ecx
loc_349d:
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov dl, byte [eax + LINK_ADDRESS_97]
    mov byte [eax + LINK_ADDRESS_98], dl
    cmp word [esi + 0x1c], 0x200
    jne near loc_4138
    mov dx, word [eax + SECTOR]
    mov dword [esp + 0x24], edx
    mov ecx, edx
    mov dx, word [eax + LINK_ADDRESS_100]
    mov eax, dword [esp + 0x24]
    add ecx, edx
    mov word [esp + 0x1c], ax
    mov ebx, dword [esp + 0x1c]
    cmp cx, bx
    jg short loc_34f7
    jmp near loc_4138
loc_34f7:
    movsx eax, bx
    shl eax, 5
    movsx eax, word [eax + LINK_ADDRESS_101]
    test eax, eax
    jl short loc_3552
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    lea eax, [eax*8]
    test byte [eax + LINK_ADDRESS_99], 1
    jne short loc_3552
    movsx ebx, word [esp + 0x10]
    lea edx, [ebx*4]
    add edx, ebx
    mov bx, word [eax + LINK_ADDRESS_61]
    mov word [edx*8 + LINK_ADDRESS_61], bx
    mov al, byte [eax + LINK_ADDRESS_98]
    mov byte [edx*8 + LINK_ADDRESS_98], al
    jmp near loc_4138
loc_3552:
    inc word [esp + 0x1c]
    mov ebx, dword [esp + 0x1c]
    cmp cx, bx
    jg short loc_34f7
    jmp near loc_4138
    movsx edx, word [esp + 0x10]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    lea ebx, [ebx*8]
    mov edx, eax
    mov eax, dword [ebx + LINK_ADDRESS_20]
    mov dword [edx + LINK_ADDRESS_29], eax
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    mov ecx, 0xffffffff
    add eax, edx
    mov ebx, ecx
    mov edx, dword [eax*8 + LINK_ADDRESS_20]
    movsx eax, word [esp + 0x10]
    call LINK_ADDRESS_102
    movsx edx, ax
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, di
    mov word [esp + 0x1c], ax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    lea ebx, [ebx*8]
    sub eax, edx
    mov edx, dword [ebx + LINK_ADDRESS_21]
    mov dword [eax + LINK_ADDRESS_28], edx
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    mov ecx, 1
    add eax, edx
    mov ebx, ecx
    mov edx, dword [eax*8 + LINK_ADDRESS_21]
    movsx eax, word [esp + 0x10]
    call LINK_ADDRESS_102
    movsx edx, ax
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, di
    mov word [esp + 0x1c], ax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    lea ebx, [ebx*8]
    sub eax, edx
    mov edx, dword [ebx + LINK_ADDRESS_20]
    mov dword [eax + LINK_ADDRESS_27], edx
    cmp word [NUMPLAYERS], 2
    jge near loc_4138
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    mov edx, SECTOR
    lea eax, [eax*8]
    add eax, edx
    add eax, 8
    movsx edx, word [esp + 0x10]
    call LINK_ADDRESS_95
    lea eax, [edx*4]
    add edx, eax
    mov eax, SECTOR
    lea edx, [edx*8]
    add eax, edx
    add eax, 4
    call LINK_ADDRESS_95
    jmp near loc_4138
    mov bx, word [esi + 0x22]
    add ebx, ebx
    mov word [esi + 0x22], bx
    jmp near loc_4138
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + SECTOR]
    movsx edx, word [esp + 0x10]
    mov dword [esp + 0x24], eax
    lea eax, [edx*4]
    mov ebx, 0x7fffffff
    add eax, edx
    mov dword [esp + 0xc], ebx
    mov ecx, dword [esp + 0x24]
    mov dx, word [eax*8 + LINK_ADDRESS_100]
    mov ebx, dword [esp + 0x24]
    add ecx, edx
    jmp short loc_373d
loc_370a:
    movsx edx, bx
    shl edx, 5
    mov ebp, dword [esi + 4]
    mov eax, dword [edx + WALL]
    mov edx, dword [edx + LINK_ADDRESS_105]
    sub ebp, edx
    mov edx, ebp
    mov ebp, dword [esi]
    sub ebp, eax
    mov eax, ebp
    call LINK_ADDRESS_106
    cmp eax, dword [esp + 0xc]
    jge short loc_373c
    mov dword [esp + 0xc], eax
    mov dword [esp + 0x18], ebx
loc_373c:
    inc ebx
loc_373d:
    cmp bx, cx
    jl short loc_370a
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx ebx, word [esp + 0x18]
    mov dword [eax + LINK_ADDRESS_30], ebx
    mov eax, 0x7fffffff
    mov ebx, dword [esp + 0x24]
    mov dword [esp + 0xc], eax
    jmp short loc_37d5
loc_3771:
    movsx eax, bx
    mov edx, eax
    mov ebp, dword [esi + 4]
    shl edx, 5
    mov dword [esp + 4], eax
    mov eax, dword [edx + WALL]
    mov edx, dword [edx + LINK_ADDRESS_105]
    sub ebp, edx
    mov edx, ebp
    mov ebp, dword [esi]
    sub ebp, eax
    mov eax, ebp
    call LINK_ADDRESS_106
    mov ebp, dword [esp + 0xc]
    mov edx, eax
    cmp eax, ebp
    jge short loc_37d4
    movsx eax, di
    mov dword [esp], eax
    mov ebp, dword [esp]
    lea eax, [eax*8]
    add eax, ebp
    lea eax, [eax*8]
    sub eax, ebp
    mov ebp, dword [esp + 4]
    cmp ebp, dword [eax + LINK_ADDRESS_30]
    je short loc_37d4
    mov dword [esp + 0xc], edx
    mov dword [esp + 0x18], ebx
loc_37d4:
    inc ebx
loc_37d5:
    cmp bx, cx
    jl short loc_3771
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx ebx, word [esp + 0x18]
    mov dword [eax + LINK_ADDRESS_29], ebx
    jmp near loc_4138
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    movsx edx, di
    movsx ebx, byte [eax*8 + LINK_ADDRESS_97]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx edx, word [esp + 0x10]
    mov dword [eax + LINK_ADDRESS_28], ebx
    lea eax, [edx*4]
    add eax, edx
    mov dl, byte [esi + 0x10]
    mov byte [eax*8 + LINK_ADDRESS_97], dl
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    mov dl, byte [esi + 0x10]
    mov byte [eax*8 + LINK_ADDRESS_98], dl
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    mov al, byte [eax*8 + LINK_ADDRESS_107]
    xor ah, ah
    shl eax, 8
    movsx edx, word [esp + 0x10]
    mov word [esi + 0x1e], ax
    lea eax, [edx*4]
    add eax, edx
    mov al, byte [eax*8 + LINK_ADDRESS_108]
    mov cx, word [esi + 0x1e]
    xor ah, ah
    movsx edx, word [esp + 0x10]
    or ecx, eax
    lea eax, [edx*4]
    add eax, edx
    mov word [esi + 0x1e], cx
    mov ax, word [eax*8 + SECTOR]
    movsx edx, word [esp + 0x10]
    mov dword [esp + 0x24], eax
    lea eax, [edx*4]
    add eax, edx
    mov ecx, dword [esp + 0x24]
    mov dx, word [eax*8 + LINK_ADDRESS_100]
    mov ebx, dword [esp + 0x24]
    add ecx, edx
    cmp bx, cx
    jl short loc_38e3
    jmp near loc_4138
loc_38e3:
    movsx eax, bx
    shl eax, 5
    test byte [eax + LINK_ADDRESS_109], 1
    jne short loc_38fb
    mov dl, byte [esi + 0x10]
    mov byte [eax + LINK_ADDRESS_110], dl
loc_38fb:
    movsx eax, bx
    shl eax, 5
    test byte [eax + LINK_ADDRESS_111], 2
    je short loc_3925
    mov dx, word [eax + LINK_ADDRESS_112]
    test dx, dx
    jl short loc_3925
    movsx eax, dx
    shl eax, 5
    mov dl, byte [esi + 0x10]
    mov byte [eax + LINK_ADDRESS_110], dl
loc_3925:
    inc ebx
    cmp bx, cx
    jl short loc_38e3
    jmp near loc_4138
    movsx edx, word [esp + 0x10]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    lea ebx, [ebx*8]
    mov edx, eax
    mov eax, dword [ebx + LINK_ADDRESS_20]
    mov dword [edx + LINK_ADDRESS_30], eax
    cmp word [esi + 0x1c], 0x600
    je short loc_398e
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov eax, dword [esi + 8]
    mov dword [edx + LINK_ADDRESS_20], eax
loc_398e:
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    mov dx, word [eax*8 + SECTOR]
    mov dword [esp + 0x24], edx
    mov ecx, edx
    mov dx, word [eax*8 + LINK_ADDRESS_100]
    mov ebx, dword [esp + 0x24]
    add ecx, edx
    jmp short loc_39d4
loc_39ba:
    movsx eax, bx
    shl eax, 5
    cmp word [eax + LINK_ADDRESS_109], 0
    jne short loc_39d3
    mov word [eax + LINK_ADDRESS_109], 0x270f
loc_39d3:
    inc ebx
loc_39d4:
    cmp bx, cx
    jl short loc_39ba
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    add eax, SECTOR
    add eax, 8
    call LINK_ADDRESS_95
    jmp near loc_4138
    movsx edx, word [esp + 0x10]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    lea ebx, [ebx*8]
    mov edx, eax
    mov eax, dword [ebx + LINK_ADDRESS_21]
    mov dword [edx + LINK_ADDRESS_30], eax
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx ebx, word [esi + 0x28]
    mov dword [eax + LINK_ADDRESS_29], ebx
    cmp word [esi + 0x1c], 0x600
    je short loc_3a7d
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov eax, dword [esi + 8]
    mov dword [edx + LINK_ADDRESS_21], eax
loc_3a7d:
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    mov dx, word [eax*8 + SECTOR]
    mov dword [esp + 0x24], edx
    mov ecx, edx
    mov dx, word [eax*8 + LINK_ADDRESS_100]
    mov ebx, dword [esp + 0x24]
    add ecx, edx
    jmp short loc_3ac3
loc_3aa9:
    movsx eax, bx
    shl eax, 5
    cmp word [eax + LINK_ADDRESS_109], 0
    jne short loc_3ac2
    mov word [eax + LINK_ADDRESS_109], 0x270f
loc_3ac2:
    inc ebx
loc_3ac3:
    cmp bx, cx
    jl short loc_3aa9
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    add eax, SECTOR
    add eax, 4
    call LINK_ADDRESS_95
    jmp near loc_4138
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    movsx edx, di
    movsx ebx, byte [eax*8 + LINK_ADDRESS_97]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx edx, word [esp + 0x10]
    mov dword [eax + LINK_ADDRESS_29], ebx
    lea eax, [edx*4]
    add eax, edx
    mov ax, word [eax*8 + SECTOR]
    movsx edx, word [esp + 0x10]
    mov dword [esp + 0x24], eax
    lea eax, [edx*4]
    add eax, edx
    mov ecx, dword [esp + 0x24]
    add cx, word [eax*8 + LINK_ADDRESS_100]
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    mov al, byte [eax*8 + LINK_ADDRESS_107]
    xor ah, ah
    shl eax, 8
    movsx edx, word [esp + 0x10]
    mov word [esi + 0x1e], ax
    lea eax, [edx*4]
    add eax, edx
    mov al, byte [eax*8 + LINK_ADDRESS_108]
    mov bx, word [esi + 0x1e]
    xor ah, ah
    or ebx, eax
    mov word [esi + 0x1e], bx
    mov ebx, dword [esp + 0x24]
    cmp bx, cx
    jl short loc_3ba1
    jmp near loc_4138
loc_3ba1:
    movsx eax, bx
    shl eax, 5
    movsx edx, di
    movsx ebp, byte [eax + LINK_ADDRESS_110]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp ebp, dword [eax + LINK_ADDRESS_28]
    jle short loc_3bd1
    mov dword [eax + LINK_ADDRESS_28], ebp
loc_3bd1:
    inc ebx
    cmp bx, cx
    jl short loc_3ba1
    jmp near loc_4138
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_57], 0
    je short loc_3c31
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    mov ebx, dword [esi + 8]
    mov eax, dword [eax*8 + LINK_ADDRESS_21]
    sub eax, ebx
    call LINK_ADDRESS_113
    cmp eax, 0x400
    jle short loc_3c31
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    or byte [eax*8 + LINK_ADDRESS_48], 0x80
loc_3c31:
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    movsx ebx, di
    add edx, eax
    lea eax, [ebx*8]
    add eax, ebx
    lea edx, [edx*8]
    lea eax, [eax*8]
    movsx ecx, byte [edx + LINK_ADDRESS_97]
    sub eax, ebx
    movsx ebx, byte [edx + LINK_ADDRESS_98]
    mov dword [eax + LINK_ADDRESS_31], ecx
    mov dword [eax + LINK_ADDRESS_30], ebx
    mov ax, word [edx + SECTOR]
    mov dword [esp + 0x24], eax
    mov ecx, eax
    mov ax, word [edx + LINK_ADDRESS_100]
    mov ebx, dword [esp + 0x24]
    add ecx, eax
    jmp short loc_3cc2
loc_3c91:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    movsx ebp, bx
    lea eax, [eax*8]
    shl ebp, 5
    sub eax, edx
    movsx ebp, byte [ebp + LINK_ADDRESS_110]
    cmp ebp, dword [eax + LINK_ADDRESS_29]
    jle short loc_3cc1
    mov dword [eax + LINK_ADDRESS_29], ebp
loc_3cc1:
    inc ebx
loc_3cc2:
    cmp bx, cx
    jl short loc_3c91
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + LINK_ADDRESS_28], 1
    jmp near loc_4138
    cmp word [esi + 0x1c], 0x400
    jle short loc_3d14
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + LINK_ADDRESS_28], 2
    jmp short loc_3d33
loc_3d14:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + LINK_ADDRESS_28], 0xfffffffe
loc_3d33:
    cmp word [esi + 0x26], 0
    jne near loc_3e55
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_57], 0x1e
    jne short loc_3db9
    cmp byte [esi + 0x11], 0
    je short loc_3d6c
    movsx eax, di
    imul eax, eax, 0x2c
    mov byte [eax + LINK_ADDRESS_114], 1
    jmp short loc_3d7a
loc_3d6c:
    movsx eax, di
    imul eax, eax, 0x2c
    xor dl, dl
    mov byte [eax + LINK_ADDRESS_114], dl
loc_3d7a:
    movsx edx, word [esp + 0x10]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    lea ebx, [ebx*8]
    mov edx, eax
    mov eax, dword [ebx + LINK_ADDRESS_20]
    mov word [ebx + LINK_ADDRESS_115], di
    mov dword [edx + LINK_ADDRESS_28], eax
loc_3db9:
    xor eax, eax
    mov word [esp + 0x1c], ax
    jmp short loc_3e16
loc_3dc2:
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_62], 0x400
    jge short loc_3e11
    mov dx, word [eax + LINK_ADDRESS_6]
    cmp dx, 1
    jne short loc_3e11
    cmp dx, word [eax + LINK_ADDRESS_41]
    jne short loc_3e11
    mov dx, word [eax + LINK_ADDRESS_40]
    cmp dx, word [esi + 0x28]
    jne short loc_3e11
    cmp word [esi + 0x1c], 0x200
    jne short loc_3e21
    mov edx, dword [eax + SPRITE]
    mov dword [esi], edx
    mov eax, dword [eax + LINK_ADDRESS_2]
    mov dword [esi + 4], eax
    jmp short loc_3e21
loc_3e11:
    inc word [esp + 0x1c]
loc_3e16:
    mov ebx, dword [esp + 0x1c]
    cmp bx, 0x1000
    jl short loc_3dc2
loc_3e21:
    cmp word [esp + 0x1c], 0x1000
    jne short loc_3e4d
    mov ebx, dword [esi + 4]
    push ebx
    mov ecx, dword [esi]
    push ecx
    push LINK_ADDRESS_116
    push LINK_ADDRESS_117
    call SPRINTF
    add esp, 0x10
    mov eax, LINK_ADDRESS_117
    call LINK_ADDRESS_119
loc_3e4d:
    mov eax, dword [esp + 0x1c]
    mov word [esi + 0x1e], ax
loc_3e55:
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    mov dx, word [eax*8 + SECTOR]
    mov dword [esp + 0x24], edx
    mov ecx, edx
    add cx, word [eax*8 + LINK_ADDRESS_100]
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [LINK_ADDRESS_77]
    mov ebx, dword [esp + 0x24]
    mov dword [edx + LINK_ADDRESS_30], eax
    jmp short loc_3f0a
loc_3ea1:
    movsx eax, bx
    shl eax, 5
    mov ebp, dword [esi]
    mov edx, dword [eax + WALL]
    sub edx, ebp
    mov ebp, dword [LINK_ADDRESS_77]
    mov dword [ebp*4 + LINK_ADDRESS_78], edx
    mov edx, dword [eax + LINK_ADDRESS_105]
    sub edx, dword [esi + 4]
    mov dword [ebp*4 + LINK_ADDRESS_79], edx
    lea edx, [ebp + 1]
    mov dword [LINK_ADDRESS_77], edx
    cmp edx, 0x7ff
    jle short loc_3f09
    mov edx, dword [eax + LINK_ADDRESS_105]
    push edx
    mov ebp, dword [eax + WALL]
    push ebp
    push LINK_ADDRESS_120
    push LINK_ADDRESS_117
    call SPRINTF
    add esp, 0x10
    mov eax, LINK_ADDRESS_117
    call LINK_ADDRESS_119
loc_3f09:
    inc ebx
loc_3f0a:
    cmp bx, cx
    jl short loc_3ea1
    mov bx, word [esi + 0x26]
    cmp bx, 0x1e
    je short loc_3f2f
    cmp bx, 6
    je short loc_3f2f
    cmp bx, 0xe
    je short loc_3f2f
    cmp bx, 5
    jne near loc_4048
loc_3f2f:
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add eax, edx
    mov dx, word [eax*8 + SECTOR]
    mov bx, word [eax*8 + LINK_ADDRESS_100]
    mov dword [esp + 0x24], edx
    mov ecx, edx
    movsx eax, word [eax*8 + LINK_ADDRESS_115]
    add ecx, ebx
    cmp eax, -1
    setne al
    xor ah, ah
    movsx edx, word [esp + 0x10]
    mov word [esi + 0x2a], ax
    lea eax, [edx*4]
    add eax, edx
    mov word [eax*8 + LINK_ADDRESS_115], di
    xor eax, eax
    mov ebx, dword [esp + 0x24]
    mov word [esp + 0x1c], ax
    jmp short loc_3fda
loc_3f8c:
    movsx edx, bx
    shl edx, 5
    mov ax, word [edx + LINK_ADDRESS_101]
    test ax, ax
    jl short loc_3fd9
    cwde
    mov dword [esp], eax
    mov ebp, dword [esp]
    lea eax, [eax*4]
    add eax, ebp
    lea eax, [eax*8]
    cmp word [eax + LINK_ADDRESS_115], 0
    jne short loc_3fd9
    cmp word [eax + LINK_ADDRESS_57], 3
    jge short loc_3fd9
    mov bx, word [edx + LINK_ADDRESS_101]
    mov word [esp + 0x1c], 1
    jmp short loc_3fdf
loc_3fd9:
    inc ebx
loc_3fda:
    cmp bx, cx
    jl short loc_3f8c
loc_3fdf:
    cmp word [esp + 0x1c], 0
    jne short loc_400a
    mov eax, dword [esi + 4]
    push eax
    mov edx, dword [esi]
    push edx
    push LINK_ADDRESS_121
    push LINK_ADDRESS_117
    call SPRINTF
    add esp, 0x10
    mov eax, LINK_ADDRESS_117
    call LINK_ADDRESS_119
loc_400a:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx ebx, bx
    mov word [esi + 0x1e], 0xffff
    mov dword [eax + LINK_ADDRESS_31], ebx
    cmp word [esi + 0x26], 0x1e
    je near loc_4138
    movsx edx, word [esi + 0x28]
    mov dword [eax + LINK_ADDRESS_28], edx
    jmp near loc_4138
loc_4048:
    cmp bx, 0x10
    jne short loc_408b
    movsx edx, word [esp + 0x10]
    lea ebx, [edx*4]
    add ebx, edx
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    lea ebx, [ebx*8]
    mov edx, eax
    mov eax, dword [ebx + LINK_ADDRESS_21]
    mov dword [edx + LINK_ADDRESS_28], eax
    jmp near loc_4138
loc_408b:
    cmp bx, 0x1a
    jne short loc_40eb
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [esi]
    mov dword [eax + LINK_ADDRESS_28], edx
    mov edx, dword [esi + 4]
    mov dword [eax + LINK_ADDRESS_27], edx
    movsx edx, word [esp + 0x10]
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov al, byte [esi + 0x10]
    cmp al, byte [edx + LINK_ADDRESS_97]
    jne short loc_40df
    mov word [esi + 0x24], 0xff00
    jmp short loc_40e5
loc_40df:
    mov word [esi + 0x24], 0x100
loc_40e5:
    mov byte [esi + 0x10], 0
    jmp short loc_4138
loc_40eb:
    cmp bx, 2
    jne short loc_4138
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    movsx edx, di
    movsx ebx, word [eax*8 + LINK_ADDRESS_122]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + LINK_ADDRESS_26], ebx
    movsx edx, word [esi + 0x18]
    lea eax, [edx*4]
    add eax, edx
    xor edx, edx
    mov word [eax*8 + LINK_ADDRESS_122], dx
loc_4138:
    mov ax, word [esi + 0x26]
    db 0x66, 0x3d, 0x0b, 0x00    ; cmp ax, 0xb
    jb short loc_4182
    jbe near loc_41e3
    db 0x66, 0x3d, 0x0f, 0x00    ; cmp ax, 0xf
    jb short loc_4177
    db 0x66, 0x3d, 0x10, 0x00    ; cmp ax, 0x10
    jbe near loc_41e3
    db 0x66, 0x3d, 0x1a, 0x00    ; cmp ax, 0x1a
    jb near loc_41eb
    jbe near loc_41e3
    db 0x66, 0x3d, 0x1e, 0x00    ; cmp ax, 0x1e
    je near loc_41d9
    jmp near loc_41eb
loc_4177:
    db 0x66, 0x3d, 0x0e, 0x00    ; cmp ax, 0xe
    je short loc_419a
    jmp near loc_41eb
loc_4182:
    db 0x66, 0x3d, 0x05, 0x00    ; cmp ax, 5
    jb short loc_4192
    jbe short loc_41e3
    db 0x66, 0x3d, 0x06, 0x00    ; cmp ax, 6
    je short loc_419a
    jmp short loc_41eb
loc_4192:
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jbe short loc_41e3
    jmp short loc_41eb
loc_419a:
    movsx eax, word [esp + 0x10]
    movsx edx, di
    call LINK_ADDRESS_123
    mov word [esp + 0x1c], ax
    cwde
    cmp eax, -1
    jne short loc_41b9
    mov word [esp + 0x1c], 0x4b
loc_41b9:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    movsx ebx, word [esp + 0x1c]
    mov dword [eax + LINK_ADDRESS_24], ebx
loc_41d9:
    cmp word [NUMPLAYERS], 1
    jg short loc_41eb
loc_41e3:
    movsx eax, di
    call LINK_ADDRESS_124
loc_41eb:
    movsx eax, di
    imul eax, eax, 0x2c
    mov ax, word [eax + LINK_ADDRESS_41]
    db 0x66, 0x3d, 0x28, 0x00    ; cmp ax, 0x28
    jb short loc_4228
    db 0x66, 0x3d, 0x29, 0x00    ; cmp ax, 0x29
    jbe short loc_4210
    db 0x66, 0x3d, 0x2b, 0x00    ; cmp ax, 0x2b
    jb short loc_4228
    db 0x66, 0x3d, 0x2d, 0x00    ; cmp ax, 0x2d
    ja short loc_4228
loc_4210:
    mov edx, 0xf
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_4228:
    mov edx, 3
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_4240:
    mov ch, byte [esi + 0x14]
    mov byte [esi + 0x10], 0xf0
    cmp ch, 8
    ja short loc_425e
    mov word [esi + 0xc], 0x8000
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
    jmp short loc_4264
loc_425e:
    mov word [esi + 0xc], 0x101
loc_4264:
    mov ax, word [LINK_ADDRESS_43]
    shl eax, 2
    mov edx, 6
    mov word [esi + 0x2a], ax
    movsx eax, di
    mov word [esi + 0x1e], di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_428d:
    cmp word [esi + 0xe], 0x394
    jne short loc_42aa
    mov word [esi + 0xc], 0x101
    mov ax, word [LINK_ADDRESS_43]
    shl eax, 2
    mov word [esi + 0x2a], ax
    jmp short loc_42b9
loc_42aa:
    mov ah, byte [esi + 0xc]
    mov word [esi + 0x2a], 1
    or ah, 0x11
    mov byte [esi + 0xc], ah
loc_42b9:
    cmp dword [LINK_ADDRESS_36], 2
    jge short loc_42ea
    cmp byte [esi + 0x11], 0
    je short loc_42ea
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_42ea:
    mov edx, 6
    movsx ebx, di
    mov byte [esi + 0x11], 0
    mov eax, ebx
    mov word [esi + 0x1e], di
    call LINK_ADDRESS_42
    mov edx, 0x10001
    mov eax, ebx
    mov word [esi + 0x20], 8
    call LINK_ADDRESS_64
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_431e:
    mov word [esi + 0x2a], 0
loc_4324:
    cmp word [esp + 0x1c], 0
    jl short loc_4336
    mov byte [esi + 0x15], 0x20
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], al
loc_4336:
    mov ecx, dword [esp + 0x1c]
    movsx eax, di
    mov byte [esi + 0x12], 0x48
    call LINK_ADDRESS_51
    test cx, cx
    jl short loc_4351
    mov word [esi + 0x1e], cx
    jmp short loc_4355
loc_4351:
    mov word [esi + 0x1e], di
loc_4355:
    cmp dword [LINK_ADDRESS_50], 1
    jne short loc_4388
    cmp word [esi + 0xe], 0x2a3
    jne short loc_4388
    mov byte [esi + 0x15], 0
    mov al, byte [esi + 0x15]
    mov edx, 5
    mov byte [esi + 0x14], al
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_4388:
    cmp word [esi + 0xe], 0x2a3
    jne short loc_4394
    mov byte [esi + 0x12], 0x18
loc_4394:
    call LINK_ADDRESS_56
    xor ah, ah
    and al, 4
    or eax, 0x101
    mov edx, 2
    mov word [esi + 0xc], ax
    movsx eax, di
    call LINK_ADDRESS_42
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
loc_43be:
    mov edx, 6
    movsx eax, di
    mov byte [esi + 0x10], 0xf0
    call LINK_ADDRESS_42
loc_43cf:
    mov eax, edi
    add esp, 0x28
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
