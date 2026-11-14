; Prepare temporary sprite records for rendering.
bits 32
org START_ADDRESS

    push esi
    push edi
    push ebp
    sub esp, 0x2c
    mov dword [esp + 0xc], eax
    mov dword [esp + 0x10], edx
    mov dword [esp + 0x18], ebx
    mov dword [esp + 0x14], ecx
    xor edx, edx
    mov dword [esp + 0x20], edx
    jmp near loc_0257
loc_0021:
    imul eax, eax, 0x2c
    mov ecx, TSPRITE
    add ecx, eax
    mov di, word [ecx + 0x1e]
    movsx eax, di
    imul eax, eax, 0x2c
    mov esi, SPRITE
    mov dx, word [ecx + 0xe]
    add esi, eax
    cmp dx, 0x416
    jb near loc_011c
    jbe near loc_0253
    cmp dx, 0xc76
    jb short loc_008b
    jbe near loc_01a1
    cmp dx, 0xc8a
    jb short loc_007b
    jbe near loc_01a1
    cmp dx, 0x1125
    je near loc_0198
    jmp near loc_00c3
loc_007b:
    cmp dx, 0xc80
    je near loc_01a1
    jmp near loc_00c3
loc_008b:
    cmp dx, 0x8f8
    jb short loc_00b8
    cmp dx, 0x8fb
    jbe near loc_0207
    cmp dx, 0x942
    jb near loc_00c3
    cmp dx, 0x949
    jbe near loc_00ef
    jmp near loc_00c3
loc_00b8:
    cmp dx, 0x4ca
    je near loc_0198
loc_00c3:
    test byte [ecx + 0xc], 0x10
    jne near loc_0253
    mov eax, ecx
    call LINK_ADDRESS_3
    test ax, ax
    je short loc_00e4
    cmp word [ecx + 0x2a], 0
    jg near loc_0253
loc_00e4:
    cmp word [ecx + 0x1a], 0xa
loc_00e9:
    je near loc_0253
loc_00ef:
    movsx edx, word [ecx + 0x18]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    test byte [eax + LINK_ADDRESS_4], 1
    je near loc_0232
    movsx ebx, byte [eax + LINK_ADDRESS_5]
    jmp near loc_0239
loc_011c:
    cmp dx, 0x2a8
    jb short loc_0168
    jbe near loc_01bd
    cmp dx, 0x3b8
    jb short loc_014d
    jbe near loc_022c
    cmp dx, 0x3ef
    jb short loc_00c3
    cmp dx, 0x3f1
    jbe near loc_0253
    jmp near loc_00c3
loc_014d:
    cmp dx, 0x39d
    jb near loc_00c3
    cmp dx, 0x39e
    jbe near loc_0253
    jmp near loc_00c3
loc_0168:
    cmp dx, 0x226
    jb short loc_0188
    jbe short loc_0198
    cmp dx, 0x2a0
    jb near loc_00c3
    cmp dx, 0x2a2
    jbe short loc_0198
    jmp near loc_00c3
loc_0188:
    cmp dx, 0x222
    jb near loc_00c3
    jmp near loc_022c
loc_0198:
    cmp byte [ecx + 0x10], 0x7f
    jmp near loc_00e9
loc_01a1:
    cmp dword [LINK_ADDRESS_6], 0
    jne near loc_0253
    mov byte [ecx + 0x15], 0
    mov al, byte [ecx + 0x15]
    mov byte [ecx + 0x14], al
    jmp near loc_0253
loc_01bd:
    movsx eax, word [ecx + 0x1c]
    movsx edx, word [esp + 0x18]
    add eax, 0xc80
    sub eax, edx
    and eax, 0x7ff
    sar eax, 8
    and eax, 7
    mov edx, eax
    db 0x66, 0x3d, 0x04, 0x00    ; cmp ax, 4
    jle short loc_01f4
    mov eax, 8
    mov bh, byte [ecx + 0xc]
    sub eax, edx
    or bh, 4
    mov edx, eax
    mov byte [ecx + 0xc], bh
    jmp short loc_01f8
loc_01f4:
    and byte [ecx + 0xc], 0xfb
loc_01f8:
    mov ax, word [esi + 0xe]
    add eax, edx
    mov word [ecx + 0xe], ax
    jmp near loc_00ef
loc_0207:
    cmp dword [LINK_ADDRESS_7], 0
    je short loc_0220
    mov byte [ecx + 0x15], 0
    mov al, byte [ecx + 0x15]
    mov byte [ecx + 0x14], al
    mov byte [ecx + 0x10], 0x10
    jmp short loc_0253
loc_0220:
    cmp byte [ecx + 0x11], 6
    jne short loc_022c
    mov byte [ecx + 0x10], 0x81
    jmp short loc_0253
loc_022c:
    mov byte [ecx + 0x10], 0x10
    jmp short loc_0253
loc_0232:
    movsx ebx, byte [eax + LINK_ADDRESS_8]
loc_0239:
    cmp ebx, -0x7f
    jge short loc_0243
    mov ebx, 0xffffff81
loc_0243:
    cmp ebx, 0x80
    jle short loc_0250
    mov ebx, 0x7f
loc_0250:
    mov byte [ecx + 0x10], bl
loc_0253:
    inc dword [esp + 0x20]
loc_0257:
    movsx eax, word [esp + 0x20]
    cmp eax, dword [SPRITESORTCNT]
    jl near loc_0021
    xor ebx, ebx
    mov dword [esp + 0x20], ebx
    jmp near loc_1b85
loc_0273:
    imul eax, eax, 0x2c
    mov ecx, TSPRITE
    add ecx, eax
    mov di, word [ecx + 0x1e]
    movsx eax, di
    imul eax, eax, 0x2c
    mov esi, SPRITE
    add esi, eax
    mov ax, word [esi + 0xe]
    cmp ax, 0x536
    jb near loc_03f2
    cmp ax, 0x538
    jbe near loc_054d
    cmp ax, 0x11c1
    jb near loc_0356
    jbe near loc_054d
    cmp ax, 0x1302
    jb short loc_0314
    jbe near loc_054d
    cmp ax, 0x131a
    jb short loc_02f1
    jbe near loc_0547
    cmp ax, 0x1352
    jb near loc_055a
    cmp ax, 0x1353
    jbe near loc_054d
    cmp ax, 0x135d
    je near loc_054d
    jmp near loc_055a
loc_02f1:
    cmp ax, 0x1307
    jb near loc_055a
    cmp ax, 0x1308
    jbe near loc_054d
    cmp ax, 0x130a
    je near loc_054d
    jmp near loc_055a
loc_0314:
    cmp ax, 0x11d0
    jb short loc_0347
    cmp ax, 0x11d2
    jbe near loc_054d
    cmp ax, 0x11ef
    jb near loc_055a
    cmp ax, 0x11f0
    jbe near loc_054d
    cmp ax, 0x1300
    je near loc_054d
    jmp near loc_055a
loc_0347:
    cmp ax, 0x11cd
    je near loc_054d
    jmp near loc_055a
loc_0356:
    cmp ax, 0x8fc
    jb short loc_03b4
    cmp ax, 0x901
    jbe near loc_054d
    cmp ax, 0x114b
    jb short loc_0391
    jbe near loc_054d
    cmp ax, 0x1176
    jb near loc_055a
    jbe near loc_054d
    cmp ax, 0x1192
    je near loc_054d
    jmp near loc_055a
loc_0391:
    cmp ax, 0x903
    jb near loc_055a
    cmp ax, 0x905
    jbe near loc_054d
    cmp ax, 0xd7a
    je near loc_054d
    jmp near loc_055a
loc_03b4:
    cmp ax, 0x54e
    jb short loc_03e3
    cmp ax, 0x54f
    jbe near loc_054d
    cmp ax, 0x573
    jb near loc_055a
    jbe near loc_054d
    cmp ax, 0x8ce
    je near loc_054d
    jmp near loc_055a
loc_03e3:
    cmp ax, 0x543
    je near loc_054d
    jmp near loc_055a
loc_03f2:
    cmp ax, 0x365
    jb near loc_04a6
    jbe near loc_054d
    cmp ax, 0x512
    jb short loc_0462
    jbe near loc_054d
    cmp ax, 0x525
    jb short loc_0443
    jbe near loc_054d
    cmp ax, 0x529
    jb near loc_055a
    jbe near loc_054d
    cmp ax, 0x52b
    jb near loc_055a
    cmp ax, 0x52d
    jbe near loc_054d
    jmp near loc_055a
loc_0443:
    cmp ax, 0x51a
    jb near loc_055a
    jbe near loc_054d
    cmp ax, 0x520
    je near loc_054d
    jmp near loc_055a
loc_0462:
    cmp ax, 0x500
    jb short loc_048d
    jbe near loc_054d
    cmp ax, 0x509
    jb near loc_055a
    jbe near loc_054d
    cmp ax, 0x50e
    je near loc_054d
    jmp near loc_055a
loc_048d:
    cmp ax, 0x3c3
    jb near loc_055a
    cmp ax, 0x3c5
    jbe near loc_054d
    jmp near loc_055a
loc_04a6:
    cmp ax, 0x2b5
    jb short loc_04f0
    jbe near loc_054d
    cmp ax, 0x300
    jb short loc_04e1
    cmp ax, 0x301
    jbe near loc_054d
    cmp ax, 0x306
    jb near loc_055a
    jbe near loc_054d
    cmp ax, 0x30b
    je near loc_054d
    jmp near loc_055a
loc_04e1:
    cmp ax, 0x2f1
    je near loc_054d
    jmp near loc_055a
loc_04f0:
    cmp ax, 0x238
    jb short loc_0508
    jbe short loc_054d
    cmp ax, 0x241
    jb short loc_055a
    jbe short loc_054d
    cmp ax, 0x25b
    je short loc_054d
    jmp short loc_055a
loc_0508:
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jne short loc_055a
    cmp word [ecx + 0x26], 0x1b
    jne short loc_053b
    cmp dword [LINK_ADDRESS_10], 1
    jne short loc_053b
    mov eax, dword [TOTALCLOCK]
    sar eax, 3
    mov dh, byte [ecx + 0xc]
    and eax, 1
    or dh, 0x80
    add eax, 0xb
    mov byte [ecx + 0xc], dh
    mov word [ecx + 0xe], ax
    jmp short loc_055a
loc_053b:
    mov byte [ecx + 0x15], 0
    mov al, byte [ecx + 0x15]
    mov byte [ecx + 0x14], al
    jmp short loc_055a
loc_0547:
    mov byte [ecx + 0x10], 0x81
    jmp short loc_055a
loc_054d:
    cmp dword [LINK_ADDRESS_7], 0
    jne near loc_1b77
loc_055a:
    cmp word [ecx + 0x1a], 0x63
    je near loc_1b81
    cmp word [esi + 0x1a], 1
    je near loc_064d
    cmp word [esi + 0xe], 0x214
    jne near loc_064d
    movsx edx, word [esi + 0x22]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    movsx eax, word [edx + LINK_ADDRESS_12]
    cmp eax, -1
    jne near loc_064d
    cmp word [esi + 0x1e], 0
    jl near loc_064d
    mov ebx, 0x10000
    mov eax, dword [edx + LINK_ADDRESS_13]
    mov ebp, dword [edx + LINK_ADDRESS_14]
    mov edx, dword [esp + 0x14]
    sub eax, ebp
    sub ebx, edx
    mov edx, eax
    mov eax, ebx
    imul edx
    shrd eax, edx, 0x10
    sub dword [ecx], eax
    movsx edx, word [esi + 0x22]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [edx + LINK_ADDRESS_15]
    mov ebp, dword [edx + LINK_ADDRESS_16]
    mov edx, eax
    mov eax, ebx
    sub edx, ebp
    imul edx
    shrd eax, edx, 0x10
    sub dword [ecx + 4], eax
    movsx edx, word [esi + 0x22]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    add ebx, ebx
    mov edx, dword [ebx + LINK_ADDRESS_17]
    mov ebp, dword [ebx + LINK_ADDRESS_18]
    mov eax, dword [esp + 0x14]
    sub edx, ebp
    imul edx
    shrd eax, edx, 0x10
    mov edx, eax
    mov eax, dword [ebx + LINK_ADDRESS_18]
    add eax, edx
    mov dword [ecx + 8], eax
    add eax, 0x2800
    mov dword [ecx + 8], eax
    jmp near loc_06e2
loc_064d:
    cmp word [esi + 0x1a], 0
    jne short loc_065c
    cmp word [esi + 0xe], 0x4c5
    jne short loc_067e
loc_065c:
    mov bx, word [esi + 0x1a]
    cmp bx, 0xa
    je short loc_067e
    cmp bx, 6
    je short loc_067e
    cmp bx, 4
    je short loc_067e
    cmp bx, 5
    je short loc_067e
    cmp bx, 1
    jne short loc_06e2
loc_067e:
    movsx edx, di
    lea ebp, [edx*8]
    add ebp, edx
    lea ebp, [ebp*8]
    sub ebp, edx
    mov eax, dword [esi]
    mov edx, dword [ebp + LINK_ADDRESS_19]
    mov ebx, 0x10000
    sub eax, edx
    sub ebx, dword [esp + 0x14]
    mov edx, eax
    mov eax, ebx
    imul edx
    shrd eax, edx, 0x10
    sub dword [ecx], eax
    mov eax, dword [esi + 4]
    mov edx, dword [ebp + LINK_ADDRESS_20]
    sub eax, edx
    mov edx, eax
    mov eax, ebx
    imul edx
    shrd eax, edx, 0x10
    sub dword [ecx + 4], eax
    mov eax, dword [esi + 8]
    mov edx, dword [ebp + LINK_ADDRESS_21]
    sub eax, edx
    mov edx, eax
    mov eax, ebx
    imul edx
    shrd eax, edx, 0x10
    sub dword [ecx + 8], eax
loc_06e2:
    mov ax, word [esi + 0x18]
    movsx edx, di
    mov dword [esp + 0x24], eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [eax + LINK_ADDRESS_22]
    mov ebp, dword [eax + LINK_ADDRESS_23]
    mov dword [esp + 8], edx
    mov edx, dword [eax + LINK_ADDRESS_24]
    mov ax, word [esi + 0xe]
    mov dword [esp], edx
    cmp ax, 0x8a1
    jb near loc_08b8
    jbe near loc_1338
    cmp ax, 0x964
    jb near loc_0828
    jbe near loc_134f
    cmp ax, 0xa06
    jb short loc_07a0
    jbe near loc_1b81
    cmp ax, 0x1125
    jb short loc_0781
    jbe near loc_0a04
    cmp ax, 0x113a
    jb near loc_07d5
    cmp ax, 0x113b
    jbe near loc_0a04
    cmp ax, 0x116c
    jb near loc_07d5
    cmp ax, 0x116d
    jbe near loc_0a04
    jmp near loc_07d5
loc_0781:
    cmp ax, 0xa1e
    jb near loc_07d5
    jbe near loc_0a20
    cmp ax, 0xa2d
    je near loc_0c99
    jmp near loc_07d5
loc_07a0:
    cmp ax, 0x96c
    jb short loc_07cb
    jbe near loc_134f
    cmp ax, 0x970
    jb near loc_07d5
    jbe near loc_134f
    cmp ax, 0x990
    je near loc_0c80
    jmp near loc_07d5
loc_07cb:
    cmp ax, 0x968
    je near loc_134f
loc_07d5:
    movsx edx, word [esp + 0x24]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov dl, byte [eax + LINK_ADDRESS_25]
    test dl, dl
    je short loc_07f7
    mov byte [ecx + 0x11], dl
loc_07f7:
    movsx eax, word [esi + 0xe]
    cmp dword [eax*4 + LINK_ADDRESS_26], 0
    je near loc_15a1
    test ebp, ebp
    je near loc_1594
    mov ebx, dword [ebp + 8]
    lea eax, [ebx - 2]
    cmp eax, 6
    ja near loc_1528
    jmp dword cs:[eax*4 + LINK_ADDRESS_27]
loc_0828:
    cmp ax, 0x8d9
    jb short loc_087e
    jbe near loc_1338
    cmp ax, 0x906
    jb short loc_085f
    jbe near loc_0b0a
    cmp ax, 0x956
    jb short loc_07d5
    cmp ax, 0x95d
    jbe near loc_134f
    cmp ax, 0x960
    je near loc_134f
    jmp near loc_07d5
loc_085f:
    cmp ax, 0x8de
    jb near loc_07d5
    jbe near loc_0b0a
    cmp ax, 0x8ee
    je near loc_1338
    jmp near loc_07d5
loc_087e:
    cmp ax, 0x8ca
    jb short loc_08a9
    jbe near loc_1338
    cmp ax, 0x8cf
    jb near loc_07d5
    jbe near loc_1338
    cmp ax, 0x8d4
    je near loc_1338
    jmp near loc_07d5
loc_08a9:
    cmp ax, 0x8c5
    je near loc_1338
    jmp near loc_07d5
loc_08b8:
    cmp ax, 0x5ee
    jb near loc_0958
    jbe near loc_09ee
    cmp ax, 0x6e8
    jb short loc_091e
    jbe near loc_1338
    cmp ax, 0x7a8
    jb short loc_08ff
    jbe near loc_0cfb
    cmp ax, 0x899
    jb near loc_07d5
    jbe near loc_1338
    cmp ax, 0x89d
    je near loc_1338
    jmp near loc_07d5
loc_08ff:
    cmp ax, 0x6ec
    jb near loc_07d5
    jbe near loc_1338
    cmp ax, 0x6f0
    je near loc_1338
    jmp near loc_07d5
loc_091e:
    cmp ax, 0x5f8
    jb short loc_0949
    jbe near loc_1338
    cmp ax, 0x600
    jb near loc_07d5
    jbe near loc_1338
    cmp ax, 0x66e
    je near loc_0c67
    jmp near loc_07d5
loc_0949:
    cmp ax, 0x5f0
    je near loc_1338
    jmp near loc_07d5
loc_0958:
    cmp ax, 0x214
    jb short loc_09b4
    jbe near loc_0d99
    cmp ax, 0x2a0
    jb short loc_0999
    cmp ax, 0x2a2
    jbe near loc_09fa
    cmp ax, 0x4ca
    jb near loc_07d5
    jbe near loc_09fa
    cmp ax, 0x4d1
    jb near loc_07d5
    cmp ax, 0x4d2
    jbe short loc_0a04
    jmp near loc_07d5
loc_0999:
    cmp ax, 0x226
    jb near loc_07d5
    jbe short loc_09fa
    cmp ax, 0x295
    je near loc_13e0
    jmp near loc_07d5
loc_09b4:
    db 0x66, 0x3d, 0x64, 0x00    ; cmp ax, 0x64
    jb short loc_09df
    jbe near loc_0bdb
    cmp ax, 0x1f3
    jb near loc_07d5
    jbe near loc_0c07
    cmp ax, 0x1f6
    je near loc_0c07
    jmp near loc_07d5
loc_09df:
    db 0x66, 0x3d, 0x2e, 0x00    ; cmp ax, 0x2e
    je near loc_0be7
    jmp near loc_07d5
loc_09ee:
    add dword [ecx + 8], 0x1800
    jmp near loc_07f7
loc_09fa:
    cmp byte [ecx + 0x11], 6
    jne short loc_0a04
    mov byte [ecx + 0x10], 0x81
loc_0a04:
    cmp dword [LINK_ADDRESS_7], 0
    je near loc_07f7
    cmp byte [esi + 0x11], 2
    jne near loc_07f7
    jmp near loc_1b77
loc_0a20:
    cmp word [ecx + 0x1a], 5
    jne near loc_1b81
    movsx ebx, word [esi + 0x1e]
    imul ebx, ebx, 0x2c
    movsx edx, word [LINK_ADDRESS_28]
    mov ebp, edx
    shl ebp, 7
    sub ebp, edx
    lea ebp, [ebp*4]
    sub ebp, edx
    add ebp, ebp
    mov edx, dword [ebx + LINK_ADDRESS_29]
    mov eax, dword [ebx + SPRITE]
    mov edi, dword [ebp + LINK_ADDRESS_15]
    mov ebx, dword [ebp + LINK_ADDRESS_13]
    sub edx, edi
    sub eax, ebx
    call GETANGLE
    movsx ebp, word [esi + 0x1e]
    imul ebp, ebp, 0x2c
    mov ebx, eax
    mov edi, dword [ecx + 4]
    mov edx, dword [ebp + LINK_ADDRESS_29]
    mov eax, dword [ebp + SPRITE]
    mov ebp, dword [ecx]
    sub edx, edi
    sub eax, ebp
    call GETANGLE
    movsx edx, ax
    movsx eax, bx
    call LINK_ADDRESS_31
    cwde
    test eax, eax
    jns short loc_0aa1
    neg eax
loc_0aa1:
    cmp eax, 0x200
    jle near loc_1b81
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov edx, ecx
    add eax, SPRITE
    call LINK_ADDRESS_32
    mov ebp, eax
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov ebx, SPRITE
    movsx edx, word [LINK_ADDRESS_28]
    add ebx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_33]
    imul eax, eax, 0x2c
    mov edx, ebx
    add eax, SPRITE
    call LINK_ADDRESS_32
    cmp ebp, eax
    jge near loc_1b81
    jmp near loc_1b77
loc_0b0a:
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_34], 0xa
    jne near loc_07f7
    cmp byte [LINK_ADDRESS_35], 0
    jne short loc_0b63
    mov bx, word [LINK_ADDRESS_28]
    cmp bx, word [eax + LINK_ADDRESS_36]
    jne short loc_0b63
    movsx edx, word [eax + LINK_ADDRESS_36]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    cmp word [nosplit eax*2 + LINK_ADDRESS_37], 0
    jne short loc_0b63
    mov byte [ecx + 0x14], 0
    jmp near loc_07f7
loc_0b63:
    mov edx, dword [esp + 0x10]
    mov eax, dword [ecx + 4]
    mov ebx, dword [ecx]
    sub edx, eax
    mov eax, dword [esp + 0xc]
    sub eax, ebx
    call GETANGLE
    mov word [ecx + 0x1c], ax
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov eax, dword [eax + SPRITE]
    mov dword [ecx], eax
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov eax, dword [eax + LINK_ADDRESS_29]
    mov dword [ecx + 4], eax
    movsx eax, word [ecx + 0x1c]
    add eax, 0x200
    and eax, 0x7ff
    movsx eax, word [nosplit eax*2 + SINTABLE]
    mov edx, dword [ecx]
    sar eax, 0xa
    add edx, eax
    mov ax, word [ecx + 0x1c]
    and ah, 7
    cwde
    mov dword [ecx], edx
    movsx eax, word [nosplit eax*2 + SINTABLE]
    mov ebx, dword [ecx + 4]
    sar eax, 0xa
    add ebx, eax
    mov dword [ecx + 4], ebx
    jmp near loc_07f7
loc_0bdb:
    sub dword [ecx + 8], 0x400
    jmp near loc_07f7
loc_0be7:
    mov eax, dword [TOTALCLOCK]
    shl eax, 4
    and eax, 0x7ff
    movsx eax, word [nosplit eax*2 + SINTABLE]
    sar eax, 0xa
    mov byte [ecx + 0x10], al
    jmp near loc_1b81
loc_0c07:
    cmp word [LINK_ADDRESS_39], 0
    jl near loc_07f7
    movsx eax, di
    imul eax, eax, 0x2c
    movsx edx, word [eax + LINK_ADDRESS_40]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp dword [eax + LINK_ADDRESS_41], 1
    jne near loc_07f7
    mov word [ecx + 0xe], 0x15f
    call LINK_ADDRESS_42
    xor ah, ah
    mov bx, word [ecx + 0xc]
    and al, 0xc
    or ebx, eax
    mov word [ecx + 0xc], bx
    add byte [ecx + 0x14], 8
    add byte [ecx + 0x15], 8
    jmp near loc_07f7
loc_0c67:
    mov eax, dword [TOTALCLOCK]
    sar eax, 4
    and eax, 3
    add eax, 0x66e
    mov word [ecx + 0xe], ax
    jmp near loc_07f7
loc_0c80:
    mov eax, dword [TOTALCLOCK]
    sar eax, 4
    and eax, 3
    add eax, 0x990
    mov word [ecx + 0xe], ax
    jmp near loc_07f7
loc_0c99:
    mov ebx, dword [esp + 0x10]
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    sub edx, ebx
    sub eax, dword [esp + 0xc]
    call GETANGLE
    movsx edx, word [esi + 0x1c]
    cwde
    add edx, 0xc80
    sub edx, eax
    and edx, 0x7ff
    mov ebx, 0xaa
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov edx, eax
    db 0x66, 0x3d, 0x06, 0x00    ; cmp ax, 6
    jle short loc_0ce8
    mov eax, 0xc
    mov bh, byte [ecx + 0xc]
    sub eax, edx
    or bh, 4
    mov edx, eax
    mov byte [ecx + 0xc], bh
    jmp short loc_0cec
loc_0ce8:
    and byte [ecx + 0xc], 0xfb
loc_0cec:
    add edx, 0xa2d
    mov word [ecx + 0xe], dx
    jmp near loc_07f7
loc_0cfb:
    mov eax, dword [esp + 0x10]
    mov edx, dword [esi + 4]
    mov ebx, dword [esp + 0xc]
    sub edx, eax
    mov eax, dword [esi]
    sub eax, ebx
    call GETANGLE
    mov edx, eax
    movsx eax, di
    mov dword [esp + 4], eax
    mov ebx, dword [esp + 4]
    lea eax, [eax*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    cmp dword [eax + LINK_ADDRESS_41], 4
    movsx eax, word [esi + 0x1c]
    movsx edx, dx
    add eax, 0xc80
    sub eax, edx
    mov edx, eax
    and edx, 0x7ff
    mov ebx, 0xaa
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov edx, eax
    cmp dx, 6
    jle short loc_0d75
    mov eax, 0xc
    mov bh, byte [ecx + 0xc]
    sub eax, edx
    or bh, 4
    mov edx, eax
    mov byte [ecx + 0xc], bh
    jmp short loc_0d79
loc_0d75:
    and byte [ecx + 0xc], 0xfb
loc_0d79:
    mov eax, dword [esp]
    test eax, eax
    jns short loc_0d82
    neg eax
loc_0d82:
    cmp eax, 0x40
    jle short loc_0d8a
    add edx, 7
loc_0d8a:
    add edx, 0x7a8
    mov word [ecx + 0xe], dx
    jmp near loc_07f7
loc_0d99:
    mov ax, word [esi + 0x22]
    mov dword [esp + 0x1c], eax
    cmp byte [ecx + 0x11], 1
    jne short loc_0dae
    sub dword [ecx + 8], 0x1200
loc_0dae:
    movsx edx, word [esp + 0x1c]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + LINK_ADDRESS_37], 0
    jle near loc_0eb0
    cmp word [eax + LINK_ADDRESS_12], 0
    jge near loc_0eb0
    or byte [ecx + 0xc], 2
    mov ax, word [LINK_ADDRESS_28]
    cmp ax, word [MYCONNECTINDEX]
    jne near loc_0eb0
    cmp word [NUMPLAYERS], 2
    jl near loc_0eb0
    mov eax, dword [LINK_ADDRESS_45]
    sub eax, dword [LINK_ADDRESS_46]
    mov edx, dword [esp + 0x14]
    imul edx
    shrd eax, edx, 0x10
    mov edx, eax
    mov eax, dword [LINK_ADDRESS_46]
    add eax, edx
    mov dword [ecx], eax
    mov eax, dword [LINK_ADDRESS_47]
    mov ebx, dword [LINK_ADDRESS_48]
    mov edx, dword [esp + 0x14]
    sub eax, ebx
    imul edx
    shrd eax, edx, 0x10
    mov edx, eax
    mov eax, dword [LINK_ADDRESS_48]
    add eax, edx
    mov dword [ecx + 4], eax
    mov eax, dword [LINK_ADDRESS_49]
    sub eax, dword [LINK_ADDRESS_50]
    mov edx, dword [esp + 0x14]
    imul edx
    shrd eax, edx, 0x10
    add eax, dword [LINK_ADDRESS_50]
    add eax, 0x2800
    mov dword [ecx + 8], eax
    movsx edx, word [LINK_ADDRESS_51]
    movsx eax, word [LINK_ADDRESS_52]
    add edx, 0x400
    sub edx, eax
    mov eax, edx
    and eax, 0x7ff
    mov edx, dword [esp + 0x14]
    sub eax, 0x400
    imul edx
    shrd eax, edx, 0x10
    mov edx, eax
    mov ax, word [LINK_ADDRESS_52]
    add eax, edx
    mov word [ecx + 0x1c], ax
    mov ax, word [LINK_ADDRESS_53]
    mov word [ecx + 0x18], ax
loc_0eb0:
    cmp byte [LINK_ADDRESS_35], 1
    je short loc_0ed3
    mov edx, dword [esp + 0x1c]
    cmp dx, word [LINK_ADDRESS_28]
    jne short loc_0ed3
    movsx eax, word [esi + 0x1e]
    cmp eax, -1
    jne near loc_1094
loc_0ed3:
    cmp dword [LINK_ADDRESS_54], 1
    jle near loc_1094
    cmp byte [LINK_ADDRESS_55], 0
    je near loc_1094
    movsx edx, word [esp + 0x1c]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    movsx edx, word [eax + LINK_ADDRESS_33]
    imul edx, edx, 0x2c
    cmp word [edx + LINK_ADDRESS_56], 0
    jle near loc_1094
    cmp word [eax + LINK_ADDRESS_57], 0
    jle near loc_1094
    imul eax, dword [SPRITESORTCNT], 0x2c
    mov ebx, 0x2c
    add eax, TSPRITE
    mov edx, ecx
    call MEMCPY
    imul eax, dword [SPRITESORTCNT], 0x2c
    mov ebx, 0x63
    xor edx, edx
    mov word [eax + LINK_ADDRESS_59], bx
    mov dl, byte [ecx + 0x15]
    sar edx, 3
    mov byte [eax + LINK_ADDRESS_60], dl
    cmp byte [ecx + 0x15], 4
    jae short loc_0f6d
    mov byte [ecx + 0x15], 4
loc_0f6d:
    imul ebx, dword [SPRITESORTCNT], 0x2c
    mov al, byte [ecx + 0x10]
    mov byte [ebx + LINK_ADDRESS_61], al
    xor eax, eax
    mov word [ebx + LINK_ADDRESS_62], ax
    movsx eax, word [esp + 0x1c]
    mov dword [esp + 4], eax
    mov edx, dword [esp + 4]
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ax, word [nosplit eax*2 + LINK_ADDRESS_57]
    dec eax
%if GAME_UPDATE
    db 0x66, 0x3d, 0x07, 0x00    ; cmp ax, 7
%else
    db 0x66, 0x3d, 0x04, 0x00    ; cmp ax, 4
%endif
    ja short loc_0ff2
    and eax, 0xffff
    jmp dword cs:[eax*4 + LINK_ADDRESS_63]
    mov word [ebx + LINK_ADDRESS_64], 0x278
    jmp short loc_0ff2
    mov word [ebx + LINK_ADDRESS_64], 0x276
    jmp short loc_0ff2
    mov word [ebx + LINK_ADDRESS_64], 0x279
    jmp short loc_0ff2
    mov word [ebx + LINK_ADDRESS_64], 0x277
    jmp short loc_0ff2
    mov word [ebx + LINK_ADDRESS_64], 0x27a
loc_0ff2:
    imul ebx, dword [SPRITESORTCNT], 0x2c
    cmp word [esi + 0x1e], 0
    jl short loc_1023
    movsx edx, word [esp + 0x1c]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov eax, dword [nosplit eax*2 + LINK_ADDRESS_17]
    sub eax, 0xc00
    jmp short loc_102b
loc_1023:
    mov eax, dword [esi + 8]
    sub eax, 0x3300
loc_102b:
    mov dword [ebx + LINK_ADDRESS_65], eax
    movsx edx, word [esp + 0x1c]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, dword [SPRITESORTCNT]
    lea edx, [eax + eax]
    imul eax, ebx, 0x2c
    cmp word [edx + LINK_ADDRESS_57], LINK_ADDRESS_66
    jne short loc_106c
    mov dh, 0xa
    mov byte [eax + LINK_ADDRESS_67], dh
    mov byte [eax + LINK_ADDRESS_60], dh
    jmp short loc_107a
loc_106c:
    mov bh, 0x10
    mov byte [eax + LINK_ADDRESS_67], bh
    mov byte [eax + LINK_ADDRESS_60], bh
loc_107a:
    mov edx, dword [SPRITESORTCNT]
    imul eax, edx, 0x2c
    xor bh, bh
    mov byte [eax + LINK_ADDRESS_68], bh
    lea ebx, [edx + 1]
    mov dword [SPRITESORTCNT], ebx
loc_1094:
    movsx eax, word [esi + 0x1e]
    cmp eax, -1
    jne near loc_11c4
    movsx eax, word [esi + 0x1c]
    movsx edx, word [esp + 0x18]
    add eax, 0xc80
    sub eax, edx
    and eax, 0x7ff
    sar eax, 8
    and eax, 7
    mov edx, eax
    db 0x66, 0x3d, 0x04, 0x00    ; cmp ax, 4
    jle short loc_10d8
    mov eax, 8
    mov bh, byte [ecx + 0xc]
    sub eax, edx
    or bh, 4
    mov edx, eax
    mov byte [ecx + 0xc], bh
    jmp short loc_10dc
loc_10d8:
    and byte [ecx + 0xc], 0xfb
loc_10dc:
    movsx eax, word [ecx + 0x18]
    mov dword [esp + 4], eax
    mov ebx, dword [esp + 4]
    lea eax, [eax*4]
    add eax, ebx
    cmp word [eax*8 + LINK_ADDRESS_69], 2
    jne short loc_1104
    add edx, 0x4ef
    jmp short loc_1134
loc_1104:
    movsx eax, di
    mov dword [esp + 4], eax
    mov ebx, dword [esp + 4]
    lea eax, [eax*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov eax, dword [eax + LINK_ADDRESS_70]
    sub eax, dword [esi + 8]
    cmp eax, 0x4000
    jle short loc_1134
    add edx, 0x3c
loc_1134:
    mov ax, word [ecx + 0xe]
    add eax, edx
    movsx edx, word [esp + 0x1c]
    mov word [ecx + 0xe], ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov al, byte [nosplit eax*2 + LINK_ADDRESS_71]
    mov byte [ecx + 0x11], al
loc_115d:
    movsx edx, word [esp + 0x24]
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov dl, byte [eax + LINK_ADDRESS_25]
    test dl, dl
    je short loc_117f
    mov byte [ecx + 0x11], dl
loc_117f:
    movsx eax, word [esi + 0x1e]
    cmp eax, -1
    je near loc_1b81
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [ecx + 8]
    mov ebx, dword [eax + LINK_ADDRESS_70]
    cmp edx, ebx
    jle near loc_07f7
    cmp byte [ecx + 0x14], 0x20
    jae near loc_07f7
    mov dword [ecx + 8], ebx
    jmp near loc_07f7
loc_11c4:
    movsx edx, word [esp + 0x1c]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    movsx eax, word [edx + LINK_ADDRESS_72]
    cmp eax, -1
    jne near loc_1275
    movsx eax, word [esi + 0x18]
    mov dword [esp + 4], eax
    mov ebx, dword [esp + 4]
    lea eax, [eax*4]
    add eax, ebx
    mov ax, word [eax*8 + LINK_ADDRESS_69]
    and ah, 7
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    je short loc_1275
    movsx edx, word [edx + LINK_ADDRESS_33]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [esi + 8]
    sub eax, dword [edx + LINK_ADDRESS_70]
    lea ebx, [eax + 0x300]
    cmp ebx, 0x400
    jle short loc_1271
    cmp byte [esi + 0x15], 0x20
    jbe short loc_1271
    cmp word [esi + 0x2a], 0
    jle short loc_1271
    xor eax, eax
    mov al, byte [esi + 0x15]
    mov edx, ebx
    lea eax, [eax*4]
    sar edx, 0x1f
    mov dword [esp + 4], eax
    mov eax, ebx
    idiv dword [esp + 4]
    mov byte [esi + 0x17], al
    jmp short loc_1275
loc_1271:
    mov byte [esi + 0x17], 0
loc_1275:
    movsx edx, word [esp + 0x1c]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_12]
    cmp eax, -1
    jle short loc_12ab
    mov eax, dword [LINK_ADDRESS_73]
    xor edx, edx
    mov ebp, dword [eax + 4]
    mov eax, dword [eax + 8]
    mov dword [esp], edx
    mov dword [esp + 8], eax
loc_12ab:
    movsx eax, word [LINK_ADDRESS_74]
    cmp eax, -1
    jne near loc_115d
    movsx edx, word [esp + 0x1c]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    movsx edx, word [eax + LINK_ADDRESS_12]
    cmp edx, -1
    jne near loc_115d
    cmp word [esi + 0x1e], 0
    jl near loc_115d
    cmp byte [LINK_ADDRESS_35], 0
    jne near loc_115d
    cmp word [eax + LINK_ADDRESS_37], 0
    jne near loc_115d
    mov ebx, dword [LINK_ADDRESS_54]
    cmp ebx, 2
    jl short loc_132d
    cmp ebx, 1
    jle near loc_115d
    mov eax, dword [esp + 0x1c]
    cmp ax, word [LINK_ADDRESS_28]
    jne near loc_115d
loc_132d:
    mov word [ecx + 0x1e], 0xffff
    jmp near loc_1b77
loc_1338:
    cmp dword [LINK_ADDRESS_7], 0
    jne near loc_1b77
    cmp byte [ecx + 0x11], 6
    jne short loc_134f
    mov byte [ecx + 0x10], 0x88
loc_134f:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp word [eax + LINK_ADDRESS_75], 0xd48
    jne short loc_1386
    cmp word [ecx + 0xe], 0x960
    jne short loc_1386
    mov dx, word [esi + 0x22]
    test dx, dx
    jl short loc_1386
    mov word [ecx + 0xe], dx
    jmp short loc_13ac
loc_1386:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov bx, word [ecx + 0xe]
    mov ax, word [eax + LINK_ADDRESS_41]
    add ebx, eax
    mov word [ecx + 0xe], bx
loc_13ac:
    movsx edx, word [esp + 0x24]
    lea eax, [edx*4]
    add eax, edx
    mov dl, byte [ecx + 0x10]
    sub dl, 6
    lea eax, [eax*8]
    mov byte [ecx + 0x10], dl
    mov dh, byte [eax + LINK_ADDRESS_25]
    test dh, dh
    je near loc_07f7
    mov byte [ecx + 0x11], dh
    jmp near loc_07f7
loc_13e0:
    movsx edx, word [ecx + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_76], 0xc8
    jne near loc_07d5
    mov byte [ecx + 0x11], 7
    jmp near loc_07f7
    movsx eax, word [esi + 0x1c]
    movsx edx, word [esp + 0x18]
    add eax, 0xc80
    sub eax, edx
    mov edx, eax
    and edx, 0x7ff
    sar edx, 8
    and edx, 1
    jmp near loc_152a
    movsx eax, word [esi + 0x1c]
    movsx edx, word [esp + 0x18]
    add eax, 0xc80
    sub eax, edx
    and eax, 0x7ff
    sar eax, 7
    and eax, 7
    mov edx, eax
    db 0x66, 0x3d, 0x03, 0x00    ; cmp ax, 3
    jle near loc_1522
    or byte [ecx + 0xc], 4
    mov eax, 7
    sub eax, edx
    mov edx, eax
    jmp near loc_152a
    mov eax, dword [esp + 0x10]
    mov edx, dword [esi + 4]
    sub edx, eax
    mov eax, dword [esi]
    sub eax, dword [esp + 0xc]
    call GETANGLE
    movsx edx, word [esi + 0x1c]
    cwde
    mov dword [esp + 4], eax
    lea eax, [edx + 0xc80]
    mov edx, dword [esp + 4]
    sub eax, edx
    mov edx, eax
    and edx, 0x7ff
    sar edx, 8
    and edx, 7
    cmp dx, 4
    jle near loc_1522
    mov eax, 8
    sub eax, edx
    mov edx, eax
    or byte [ecx + 0xc], 4
    jmp near loc_152a
    mov eax, dword [esp + 0x10]
    mov edx, dword [esi + 4]
    sub edx, eax
    mov eax, dword [esi]
    sub eax, dword [esp + 0xc]
    call GETANGLE
    movsx edx, word [esi + 0x1c]
    add edx, 0xc80
    cwde
    sub edx, eax
    mov eax, 0xaa
    and edx, 0x7ff
    mov dword [esp + 4], eax
    mov eax, edx
    sar edx, 0x1f
    idiv dword [esp + 4]
    mov edx, eax
    db 0x66, 0x3d, 0x06, 0x00    ; cmp ax, 6
    jle short loc_1522
    mov eax, 0xc
    sub eax, edx
    mov edx, eax
    or byte [ecx + 0xc], 4
    jmp short loc_152a
    movsx eax, word [esi + 0x1c]
    movsx edx, word [esp + 0x18]
    add eax, 0xc80
    sub eax, edx
    and eax, 0x7ff
    sar eax, 8
    and eax, 7
    mov edx, eax
loc_1522:
    and byte [ecx + 0xc], 0xfb
    jmp short loc_152a
loc_1528:
    xor edx, edx
loc_152a:
    mov ax, word [ebp]
    add eax, edx
    mov dword [esp + 0x28], eax
    mov eax, dword [esp]
    imul eax, ebx
    add eax, dword [esp + 0x28]
    add word [ecx + 0xe], ax
    test ebx, ebx
    jle short loc_1568
loc_1546:
    movsx eax, word [ecx + 0xe]
    cmp word [nosplit eax*2 + TILESIZX], 0
    jne short loc_1568
    mov ax, word [ecx + 0xe]
    test ax, ax
    jle short loc_1568
    mov edx, eax
    sub edx, ebx
    mov word [ecx + 0xe], dx
    jmp short loc_1546
loc_1568:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp word [eax + LINK_ADDRESS_78], 0
    jl short loc_15a1
    mov dx, word [ecx + 0xe]
    mov word [eax + LINK_ADDRESS_78], dx
    jmp short loc_15a1
loc_1594:
    cmp byte [LINK_ADDRESS_35], 1
    jne short loc_15a1
    or byte [ecx + 0xc], 4
loc_15a1:
    cmp word [esi + 0x1a], 0xd
    je short loc_15cb
    mov eax, esi
    call LINK_ADDRESS_3
    test ax, ax
    jne short loc_15cb
    cmp word [esi + 0xe], 0x214
    jne near loc_178c
    cmp word [esi + 0x1e], 0
    jl near loc_178c
loc_15cb:
    cmp word [ecx + 0x1a], 0x63
    je near loc_178c
    mov dx, word [esi + 0xe]
    cmp dx, 0x762
    je near loc_178c
    cmp dx, 0x3d3
    je near loc_178c
    cmp dx, 0x227
    je near loc_178c
    cmp dx, 0x114b
    je near loc_178c
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov bx, word [eax + LINK_ADDRESS_78]
    mov edx, eax
    test bx, bx
    jge short loc_1638
    mov edi, ebx
    inc edi
    mov word [eax + LINK_ADDRESS_78], di
    jmp near loc_1b81
loc_1638:
    cmp dword [LINK_ADDRESS_79], 0
    je near loc_1758
    cmp dword [SPRITESORTCNT], 0x3fe
    jge near loc_1758
    movsx ebx, word [esp + 0x24]
    lea eax, [ebx*4]
    add eax, ebx
    mov ax, word [eax*8 + LINK_ADDRESS_69]
    xor ah, ah
    db 0x66, 0x3d, 0x02, 0x00    ; cmp ax, 2
    jg short loc_1693
    mov ax, word [esi + 0x1a]
    db 0x66, 0x3d, 0x04, 0x00    ; cmp ax, 4
    je short loc_1693
    db 0x66, 0x3d, 0x05, 0x00    ; cmp ax, 5
    je short loc_1693
    mov ax, word [esi + 0xe]
    cmp ax, 0x758
    je short loc_1693
    cmp ax, 0x780
    jne short loc_16aa
loc_1693:
    movsx edx, word [esp + 0x24]
    lea eax, [edx*4]
    add eax, edx
    mov ebp, dword [eax*8 + LINK_ADDRESS_80]
    jmp short loc_16b0
loc_16aa:
    mov ebp, dword [edx + LINK_ADDRESS_70]
loc_16b0:
    mov eax, dword [esi + 8]
    sub eax, ebp
    cmp eax, 0x800
    jge near loc_1758
    movsx edx, word [LINK_ADDRESS_28]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    cmp ebp, dword [nosplit eax*2 + LINK_ADDRESS_17]
    jle short loc_1758
    imul eax, dword [SPRITESORTCNT], 0x2c
    mov edx, ecx
    mov ebx, 0x2c
    add eax, TSPRITE
    call MEMCPY
    imul eax, dword [SPRITESORTCNT], 0x2c
    mov word [eax + LINK_ADDRESS_59], 0x63
    xor edx, edx
    mov dl, byte [ecx + 0x15]
    sar edx, 3
    mov byte [eax + LINK_ADDRESS_60], dl
    cmp byte [ecx + 0x15], 4
    jae short loc_1720
    mov byte [ecx + 0x15], 4
loc_1720:
    imul eax, dword [SPRITESORTCNT], 0x2c
    mov byte [eax + LINK_ADDRESS_61], 0x7f
    mov bl, 4
    mov dword [eax + LINK_ADDRESS_65], ebp
    mov ebp, dword [SPRITESORTCNT]
    mov dh, byte [eax + LINK_ADDRESS_62]
    mov byte [eax + LINK_ADDRESS_68], bl
    inc ebp
    or dh, 2
    mov dword [SPRITESORTCNT], ebp
    mov byte [eax + LINK_ADDRESS_62], dh
loc_1758:
    movsx edx, word [LINK_ADDRESS_28]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + LINK_ADDRESS_81], 0
    jle short loc_178c
    cmp byte [eax + LINK_ADDRESS_82], 0
    je short loc_178c
    mov byte [ecx + 0x11], 6
    mov byte [ecx + 0x10], 0
loc_178c:
    mov dx, word [esi + 0xe]
    cmp dx, 0x58c
    jb short loc_1808
    jbe near loc_18f5
    cmp dx, 0x9e5
    jb short loc_17d7
    jbe near loc_19a6
    cmp dx, 0xa2d
    jb short loc_17c7
    jbe near loc_185f
    cmp dx, 0xfff
    je near loc_1a22
    jmp near loc_1b3e
loc_17c7:
    cmp dx, 0x9e7
    je near loc_19cc
    jmp near loc_1b3e
loc_17d7:
    cmp dx, 0x8de
    jb near loc_1b3e
    cmp dx, 0x8df
    jbe near loc_18a6
    cmp dx, 0x906
    jb near loc_1b3e
    cmp dx, 0x907
    jbe near loc_18a6
    jmp near loc_1b3e
loc_1808:
    cmp dx, 0x27d
    jb short loc_183e
    jbe short loc_185f
    cmp dx, 0x550
    jb short loc_182e
    jbe near loc_18e2
    cmp dx, 0x564
    je near loc_1974
    jmp near loc_1b3e
loc_182e:
    cmp dx, 0x4f3
    je near loc_1af9
    jmp near loc_1b3e
loc_183e:
    cmp dx, 0x242
    jb near loc_1b3e
    jbe near loc_197d
    cmp dx, 0x26d
    je near loc_1af9
    jmp near loc_1b3e
loc_185f:
    cmp word [ecx + 0xe], 0x762
    jne short loc_189d
    movsx edx, word [LINK_ADDRESS_28]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dword [nosplit eax*2 + LINK_ADDRESS_83], 0xffffff81
    mov eax, dword [TOTALCLOCK]
    add eax, 0x20
    mov dword [LINK_ADDRESS_84], eax
    mov byte [LINK_ADDRESS_85], 1
loc_189d:
    mov byte [ecx + 0x10], 0x81
    jmp near loc_1b3e
loc_18a6:
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov si, word [eax + LINK_ADDRESS_86]
    cmp si, 0x38c
    je short loc_18d9
    cmp si, 0x38e
    je short loc_18d9
    movsx edx, word [ecx + 0x18]
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + LINK_ADDRESS_80]
    mov dword [ecx + 8], eax
loc_18d9:
    mov byte [ecx + 0x10], 0x81
    jmp near loc_1b3e
loc_18e2:
    mov byte [ecx + 0x10], 0x81
    movsx edx, byte [esi + 0x10]
    movsx eax, word [ecx + 0xe]
    sar edx, 1
    jmp near loc_1b38
loc_18f5:
    movsx eax, word [ecx + 0x1c]
    movsx edx, word [esp + 0x18]
    add eax, 0xc80
    sub eax, edx
    mov edx, eax
    and edx, 0x7ff
    sar edx, 8
    and edx, 7
    cmp dx, 4
    jle short loc_192d
    mov eax, 8
    mov bh, byte [ecx + 0xc]
    sub eax, edx
    or bh, 4
    mov edx, eax
    mov byte [ecx + 0xc], bh
    jmp short loc_1931
loc_192d:
    and byte [ecx + 0xc], 0xfb
loc_1931:
    movsx ebx, di
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    cmp dword [eax + LINK_ADDRESS_41], 4
    setl al
    xor ah, ah
    imul eax, eax, 5
    add dx, word [esi + 0xe]
    add edx, eax
    mov word [ecx + 0xe], dx
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov al, byte [eax + LINK_ADDRESS_87]
    mov byte [ecx + 0x10], al
    jmp near loc_1b3e
loc_1974:
    mov eax, dword [esp + 8]
    jmp near loc_1b38
loc_197d:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov ax, word [esi + 0xe]
    mov bx, word [edx + LINK_ADDRESS_88]
    add eax, ebx
    jmp near loc_1b3a
loc_19a6:
    movsx ebx, di
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov ax, word [eax + LINK_ADDRESS_41]
    xor ah, ah
    and al, 1
    add edx, eax
    mov word [ecx + 0xe], dx
loc_19cc:
    mov ah, byte [ecx + 0xc]
    or ah, 0xc
    movsx edx, di
    mov byte [ecx + 0xc], ah
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp dword [eax + LINK_ADDRESS_41], 1
    jle short loc_19f7
    and byte [ecx + 0xc], 0xfb
loc_19f7:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    cmp dword [eax + LINK_ADDRESS_41], 2
    jle near loc_1b3e
    and byte [ecx + 0xc], 0xf3
    jmp near loc_1b3e
loc_1a22:
    mov ax, word [esi + 0x1e]
    test ax, ax
    jl near loc_1b3e
    cwde
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_34], 0x400
    jge near loc_1b3e
    cmp word [eax + LINK_ADDRESS_86], 0x214
    jne short loc_1a7d
    movsx edx, word [LINK_ADDRESS_74]
    cmp edx, -1
    jne short loc_1a7d
    mov dx, word [LINK_ADDRESS_28]
    cmp dx, word [eax + LINK_ADDRESS_36]
    jne short loc_1a7d
    cmp byte [LINK_ADDRESS_35], 0
    jne short loc_1a7d
    mov word [ecx + 0x1e], 0xffff
    jmp near loc_1b3e
loc_1a7d:
    movsx edx, word [esi + 0x1e]
    imul eax, edx, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_89]
    test ah, 0x80
    jne near loc_1b3e
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ax, word [eax + LINK_ADDRESS_78]
    mov word [ecx + 0xe], ax
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov al, byte [eax + LINK_ADDRESS_90]
    mov byte [ecx + 0x11], al
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov al, byte [eax + LINK_ADDRESS_87]
    mov byte [ecx + 0x10], al
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov ax, word [eax + LINK_ADDRESS_91]
    mov word [ecx + 0x1c], ax
    movsx eax, word [esi + 0x1e]
    imul eax, eax, 0x2c
    mov ax, word [eax + LINK_ADDRESS_89]
    or al, 2
    mov word [ecx + 0xc], ax
    jmp short loc_1b3e
loc_1af9:
    movsx eax, word [ecx + 0x1c]
    movsx edx, word [esp + 0x18]
    add eax, 0xc80
    sub eax, edx
    and eax, 0x7ff
    sar eax, 8
    and eax, 7
    mov edx, eax
    db 0x66, 0x3d, 0x04, 0x00    ; cmp ax, 4
    jle short loc_1b30
    mov eax, 8
    mov bl, byte [ecx + 0xc]
    sub eax, edx
    or bl, 4
    mov edx, eax
    mov byte [ecx + 0xc], bl
    jmp short loc_1b34
loc_1b30:
    and byte [ecx + 0xc], 0xfb
loc_1b34:
    mov ax, word [esi + 0xe]
loc_1b38:
    add eax, edx
loc_1b3a:
    mov word [ecx + 0xe], ax
loc_1b3e:
    movsx edx, di
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dx, word [ecx + 0xe]
    mov word [eax + LINK_ADDRESS_78], dx
    movsx edx, word [ecx + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_76], 0x230
    jne short loc_1b81
loc_1b77:
    mov byte [ecx + 0x15], 0
    mov al, byte [ecx + 0x15]
    mov byte [ecx + 0x14], al
loc_1b81:
    inc dword [esp + 0x20]
loc_1b85:
    movsx eax, word [esp + 0x20]
    cmp eax, dword [SPRITESORTCNT]
    jl near loc_0273
    add esp, 0x2c
    pop ebp
    pop edi
    pop esi
    ret
    lea eax, [byte eax + 0]
