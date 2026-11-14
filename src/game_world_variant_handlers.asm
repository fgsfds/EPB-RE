; Version-specific world update handlers.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    push ebx
    push ecx
    push edx
    push esi
    sub esp, 4
    xor ecx, ecx
    cmp cx, 0x1000
    jl short loc_0018
    add esp, 4
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0018:
    movsx edx, cx
    imul ebx, edx, 0x2c
    add ebx, 0x2522b4
    mov esi, ecx
    mov ax, word [ebx + 0x18]
    cmp byte [ebx + 0x14], 0
    je short loc_003b
    test ax, ax
    jl short loc_003b
    cmp ax, 0x400
    jl short loc_0045
loc_003b:
    movsx eax, si
    call 0x67ff5
    jmp short loc_0071
loc_0045:
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [ebx]
    mov dword [eax + 0x8b0db], edx
    mov edx, dword [ebx + 4]
    mov dword [eax + 0x8b0df], edx
    mov edx, dword [ebx + 8]
    mov dword [eax + 0x8b0e3], edx
loc_0071:
    mov edx, esp
    mov eax, ebx
    call 0x50ab0
    mov ebx, dword [esp]
    movsx edx, ax
    movsx eax, si
    inc ecx
    call 0x3bca0
    cmp cx, 0x1000
    jl short loc_0018
    add esp, 4
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
%else
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x30
    mov ax, word [0x2454c4]
loc_001b:
    mov dword [esp + 0x24], eax
    mov edx, dword [esp + 0x24]
    test dx, dx
    jl short 0x2dbc5
    movsx eax, dx
    imul ebp, eax, 0x2c
    db 0x66, 0x8b, 0x14, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov dx, word [eax*2 + 0x1af7a4]
    add ebp, 0x1c0ba4
    mov dword [esp + 0x2c], edx
    mov dl, byte [ebp + 0x14]
    mov si, word [ebp + 0x18]
    test dl, dl
    je short loc_0057
    test si, si
    jl short loc_0057
    cmp si, 0x400
    jl short loc_0066
loc_0057:
    movsx eax, word [esp + 0x24]
    call 0x6ab35
    jmp near loc_304e
loc_0066:
    mov edx, eax
    lea eax, [eax*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, 0x4e9d8
    add edx, eax
    add edx, 0x2f
    mov dword [esp + 0x18], edx
    mov edx, dword [ebp]
    mov dword [eax + 0x4e9fb], edx
    mov edx, dword [ebp + 4]
    mov dword [eax + 0x4e9ff], edx
    mov edx, dword [ebp + 8]
    mov dword [eax + 0x4ea03], edx
    mov ax, word [ebp + 0xe]
    cmp ax, 0x672
    jb near loc_0191
    jbe near loc_2218
    cmp ax, 0xa1e
    jb short loc_010d
    jbe near loc_0997
    cmp ax, 0xc8a
    jb short loc_00ee
    jbe near loc_0316
    cmp ax, 0x1107
    jb near loc_0156
    jbe near loc_0214
    cmp ax, 0x1109
    je near loc_0214
    jmp near loc_0156
loc_00ee:
    cmp ax, 0xc76
    jb near loc_0156
    jbe near loc_0316
    cmp ax, 0xc80
    je near loc_0316
    jmp near loc_0156
loc_010d:
    cmp ax, 0x905
    jb short loc_013c
    jbe near loc_13a3
    cmp ax, 0x942
    jb near loc_0156
    cmp ax, 0x949
    jbe near loc_143b
    cmp ax, 0x9bb
    je near loc_03c5
    jmp near loc_0156
loc_013c:
    cmp ax, 0x7a8
    jb near loc_0156
    jbe near loc_0b63
    cmp ax, 0x8fc
    je near loc_13a3
loc_0156:
    cmp dword [0xe97df], 2
    jge near loc_3032
    mov eax, ebp
    call 0x12be0
    test ax, ax
    je near loc_3032
    mov dh, byte [0x7fb1]
    cmp dh, 1
    jne near loc_3027
    mov word [ebp + 0xc], 0x8000
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_0191:
    cmp ax, 0x385
    jb short loc_01e0
    cmp ax, 0x386
    jbe near loc_05be
    cmp ax, 0x448
    jb short loc_01c5
    jbe near loc_304e
    cmp ax, 0x4f3
    jb short loc_0156
    jbe near loc_04dd
    cmp ax, 0x542
    je near loc_03c5
    jmp short loc_0156
loc_01c5:
    cmp ax, 0x3ac
    jb short loc_0156
    jbe near loc_2218
    cmp ax, 0x440
    je near loc_2a16
    jmp near loc_0156
loc_01e0:
    cmp ax, 0x242
    jb short loc_0205
    jbe near loc_2a16
    cmp ax, 0x243
    jbe near loc_304e
    cmp ax, 0x26d
    je near loc_2eb5
    jmp near loc_0156
loc_0205:
    db 0x66, 0x3d, 0x1a, 0x00    ; cmp ax, 0x1a
    je near loc_2246
    jmp near loc_0156
loc_0214:
    test byte [ebp + 0xc], 0x20
    je short loc_0247
    mov eax, dword [esp + 0x18]
    mov edx, dword [eax]
    inc edx
    mov dword [eax], edx
    cmp edx, 0x3c
    jle near loc_304e
    mov dword [eax], 0
    mov word [ebp + 0xc], 0x191
    mov word [ebp + 0x2a], 1
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_0247:
    movsx eax, word [esp + 0x24]
    call 0x29210
    test ax, ax
    jl near loc_304e
    mov word [ebp + 0xc], 0xa0
    mov ax, word [0x2454c4]
    mov ebx, 1
loc_026b:
    mov word [esp + 0x28], ax
    mov ecx, dword [esp + 0x28]
    test cx, cx
    jl near loc_02de
    movsx eax, cx
    imul eax, eax, 0x2c
    mov si, word [ebp + 0x26]
    cmp si, word [eax + 0x1c0bca]
    jne short loc_02cf
    mov dx, word [eax + 0x1c0bb2]
    cmp dx, word [ebp + 0xe]
    jne short loc_02cf
    cmp word [eax + 0x1c0bcc], 0
    je short loc_02b0
    test byte [eax + 0x1c0bb0], 0x20
    je short loc_02cb
loc_02b0:
    movsx eax, word [esp + 0x28]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bcc], 0
    jne short loc_02cf
    test byte [eax + 0x1c0bb0], 0x20
    je short loc_02cf
loc_02cb:
    xor ebx, ebx
    jmp short loc_02de
loc_02cf:
    movsx eax, word [esp + 0x28]
    db 0x66, 0x8b, 0x04, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov ax, word [eax*2 + 0x1af7a4]
    jmp short loc_026b
loc_02de:
    cmp bx, 1
    jne near loc_304e
    mov edx, 0xffffffff
    movsx eax, word [ebp + 0x26]
    call 0x55040
    movsx eax, word [esp + 0x24]
    movsx edx, word [ebp + 0x26]
    call 0x553e0
    movsx eax, word [ebp + 0x26]
    call 0x55390
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_0316:
    movsx edx, word [esp + 0x24]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ecx, dword [eax + 0x4ea07]
    inc ecx
    mov esi, dword [0x8d38]
    mov dword [eax + 0x4ea07], ecx
    cmp ecx, esi
    jle short loc_0354
    mov eax, edx
    call 0x6ab35
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_0354:
    mov ebx, esi
    sar ebx, 1
    cmp ebx, ecx
    jg short loc_0379
    mov ecx, esi
    sar ecx, 2
    add ebx, ecx
    cmp ebx, dword [eax + 0x4ea07]
    jle short loc_0379
    imul edx, edx, 0x2c
    mov word [edx + 0x1c0bb2], 0xc80
    jmp short loc_03b6
loc_0379:
    movsx ebx, word [esp + 0x24]
    mov edx, dword [0x8d38]
    lea ecx, [ebx*8]
    mov eax, dword [0x8d38]
    add ecx, ebx
    sar edx, 1
    lea ecx, [ecx*8]
    sar eax, 2
    sub ecx, ebx
    add eax, edx
    cmp eax, dword [ecx + 0x4ea07]
    jge short loc_03b6
    imul ebx, ebx, 0x2c
    mov word [ebx + 0x1c0bb2], 0xc8a
loc_03b6:
    movsx eax, word [esp + 0x24]
    call 0x37770
    jmp near loc_0156
loc_03c5:
    movsx eax, word [ebp + 0x24]
    mov esi, dword [ebp + 8]
    add esi, eax
    mov eax, dword [esp + 0x18]
    mov dword [ebp + 8], esi
    mov edi, dword [eax]
    inc edi
    mov dword [eax], edi
    cmp edi, 0xd0
    jle near loc_04b5
    mov eax, 9
    xor esi, esi
    call 0x5aa80
    mov word [esp + 0x28], si
    jmp near loc_048e
loc_03fc:
    push 5
    movsx eax, word [esp + 0x28]
    push eax
    mov edx, 0xfffffe00
    call 0x7079f
    and eax, 0x7ff
    sub edx, eax
    push edx
    call 0x7079f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x7079f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x7079f
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [ebp + 8]
    push eax
    sub ecx, 0x800
    call 0x7079f
    and eax, 0x1fff
    sub ecx, eax
    call 0x7079f
    and eax, 0xff
    mov ebx, dword [ebp + 4]
    add ebx, eax
    call 0x7079f
    and eax, 0xff
    add eax, dword [ebp]
    lea edx, [eax - 0x80]
    sub ebx, 0x80
    movsx eax, word [ebp + 0x18]
    call 0x18f70
    inc word [esp + 0x28]
loc_048e:
    cmp word [esp + 0x28], 0x20
    jl near loc_03fc
    mov ch, 0x10
    movsx eax, word [esp + 0x24]
    mov byte [0xe9832], ch
    call 0x6ab35
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_04b5:
    test byte [eax], 3
    jne short loc_04c9
    movsx eax, word [esp + 0x24]
    mov edx, 0x762
    call 0x19320
loc_04c9:
    movsx eax, word [esp + 0x24]
    mov edx, 0x10001
    call 0x28740
    jmp near loc_0156
loc_04dd:
    movsx eax, word [esp + 0x24]
    mov edx, 0x10001
    call 0x37770
    movsx eax, word [esp + 0x24]
    call 0x28740
    test ax, ax
    je short loc_052a
    mov edx, dword [esp + 0x18]
    mov edx, dword [edx]
    shl edx, 8
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    call 0x7079f
    and eax, 0x1f
    sar edx, 0xb
    sub eax, 0xf
    add edx, eax
    movsx eax, word [ebp + 0x1c]
    add eax, edx
    jmp short loc_0589
loc_052a:
    movsx edx, word [esp + 0x24]
    lea ebx, [edx*8]
    add ebx, edx
    lea ebx, [ebx*8]
    sub ebx, edx
    movsx edx, word [esp + 0x24]
    lea eax, [edx*8]
    add eax, edx
    mov ecx, dword [ebx + 0x4ea07]
    lea eax, [eax*8]
    inc ecx
    sub eax, edx
    mov dword [ebx + 0x4ea07], ecx
    cmp dword [eax + 0x4ea07], 1
    jle short loc_0581
    movsx eax, word [esp + 0x24]
    call 0x6ab35
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_0581:
    call 0x7079f
    and ah, 7
loc_0589:
    mov word [ebp + 0x1c], ax
    mov di, word [ebp + 0x20]
    cmp di, 0x80
    jge short loc_05a3
    mov eax, edi
    db 0x05, 0x02, 0x00, 0x00, 0x00    ; add eax, 2
    mov word [ebp + 0x20], ax
loc_05a3:
    call 0x7079f
    xor ah, ah
    and al, 3
    mov dx, word [ebp + 0x1c]
    sub eax, 6
    add edx, eax
    mov word [ebp + 0x1c], dx
    jmp near loc_0156
loc_05be:
    cmp word [ebp + 0x20], 0
    je near loc_0752
    mov ax, word [0x2454c2]
    mov word [esp + 0x28], ax
loc_05d4:
    mov ecx, dword [esp + 0x28]
    test cx, cx
    jl short loc_0621
    movsx eax, cx
    db 0x66, 0x8b, 0x1c, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [eax*2 + 0x1af7a4]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x387
    jne short loc_061a
    add eax, 0x1c0ba4
    mov edx, ebp
    call 0x536a0
    cmp eax, 0x34
    jge short loc_061a
    movsx eax, word [esp + 0x24]
    call 0x6ab35
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_061a:
    mov word [esp + 0x28], bx
    jmp short loc_05d4
loc_0621:
    mov ax, word [ebp + 0x1c]
    and ah, 7
    cwde
    db 0x0f, 0xbf, 0x14, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [eax*2 + 0x1b7fa4]
    movsx eax, word [ebp + 0x20]
    imul edx, eax
    push 0x1000040
    push 0x400
    push 0x400
    sar edx, 0xe
    push 0x18
    shl edx, 0xd
    push edx
    movsx edx, word [ebp + 0x1c]
    add edx, 0x200
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    imul eax, edx
    lea ecx, [ebp + 0x18]
    sar eax, 0xe
    lea ebx, [ebp + 8]
    shl eax, 0xd
    lea edx, [ebp + 4]
    push eax
    mov eax, ebp
    call 0x6cb75
    movsx edx, ax
    test dh, 0xc0
    je near loc_0705
    and edx, 0xc000
    cmp edx, 0x8000
    jne short loc_06e8
    and ah, 0x1f
    movsx edx, ax
    shl edx, 5
    movsx ecx, word [edx + 0x1ecdac]
    mov word [esp + 0x28], ax
    shl ecx, 5
    mov edi, dword [edx + 0x1ecda8]
    mov ebx, dword [ecx + 0x1ecda8]
    mov eax, dword [ecx + 0x1ecda4]
    sub ebx, edi
    mov ecx, dword [edx + 0x1ecda4]
    mov edx, ebx
    sub eax, ecx
    call 0x65698
    mov si, word [ebp + 0x1c]
    add eax, eax
    sub eax, esi
    and ah, 7
    mov word [ebp + 0x1c], ax
    jmp short loc_0705
loc_06e8:
    cmp edx, 0xc000
    jne short loc_0705
    and ah, 0xf
    mov word [esp + 0x28], ax
    movsx edx, ax
    movsx eax, word [esp + 0x24]
    call 0x56c90
loc_0705:
    mov di, word [ebp + 0x20]
    dec edi
    mov word [ebp + 0x20], di
    test di, di
    jge short loc_0719
    mov word [ebp + 0x20], 0
loc_0719:
    cmp word [ebp + 0xe], 0x385
    jne near loc_0156
    mov ax, word [ebp + 0x20]
    mov word [ebp + 0xc], 0x101
    xor ah, ah
    mov bx, word [ebp + 0xc]
    and al, 4
    or ebx, eax
    mov ax, word [ebp + 0x20]
    xor ah, ah
    mov ecx, ebx
    and al, 8
    mov word [ebp + 0xc], bx
    or ecx, eax
    mov word [ebp + 0xc], cx
    jmp near loc_0156
loc_0752:
    lea edx, [esp + 0x14]
    mov eax, ebp
    call 0x53700
    mov dword [esp + 0x20], eax
    cmp dword [esp + 0x14], 0x63c
    jge near loc_0934
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [ebp + 4]
    sub eax, dword [edx + 0xb5118]
    movsx edx, word [esp + 0x20]
    mov ebx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [ebp]
    mov ecx, dword [edx + 0xb5114]
    mov edx, ebx
    sub eax, ecx
    call 0x65698
    movsx edx, word [esp + 0x20]
    movsx ebx, ax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, ebx
    db 0x0f, 0xbf, 0x04, 0x45, 0x98, 0x51, 0x0b, 0x00    ; movsx eax, word [eax*2 + 0xb5198]
    call 0x374b0
    mov word [esp + 0x28], ax
    cwde
    cmp eax, -0x40
    jle near loc_0934
    cmp word [esp + 0x28], 0x40
    jge near loc_0934
    movsx edx, word [esp + 0x20]
    lea eax, [edx*4]
    add eax, edx
    db 0xf6, 0x04, 0x45, 0x69, 0x02, 0x0e, 0x00, 0x20    ; test byte [eax*2 + 0xe0269], 0x20
    je near loc_0934
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x80, 0x3c, 0x45, 0xe9, 0x52, 0x0b, 0x00, 0x01    ; cmp byte [eax*2 + 0xb52e9], 1
    jne near loc_0934
    mov bx, word [0x2454c4]
loc_0844:
    test bx, bx
    jl near loc_08ef
    movsx eax, bx
    imul eax, eax, 0x2c
    mov si, word [eax + 0x1c0bb2]
    cmp si, 0x386
    je short loc_086c
    cmp si, 0x385
    jne near loc_08df
loc_086c:
    movsx ecx, bx
    imul ecx, ecx, 0x2c
    movsx edx, word [esp + 0x20]
    mov esi, edx
    shl esi, 7
    sub esi, edx
    lea esi, [esi*4]
    sub esi, edx
    add esi, esi
    mov edx, dword [ecx + 0x1c0ba8]
    mov edi, dword [esi + 0xb5118]
    mov eax, dword [ecx + 0x1c0ba4]
    sub edx, edi
    sub eax, dword [esi + 0xb5114]
    call 0x65698
    movsx edx, ax
    movsx eax, word [esi + 0xb5198]
    call 0x374b0
    movsx edx, ax
    cmp edx, -0x40
    jle short loc_08df
    db 0x66, 0x3d, 0x40, 0x00    ; cmp ax, 0x40
    jge short loc_08df
    mov eax, 0x1c0ba4
    lea edx, [esp + 0x10]
    add eax, ecx
    call 0x53700
    mov eax, dword [esp + 0x14]
    cmp eax, dword [esp + 0x10]
    jg short loc_08ef
loc_08df:
    movsx ebx, bx
    db 0x66, 0x8b, 0x1c, 0x5d, 0xa4, 0xf7, 0x1a, 0x00    ; mov bx, word [ebx*2 + 0x1af7a4]
    jmp near loc_0844
loc_08ef:
    movsx eax, bx
    cmp eax, -1
    jne short loc_0934
    cmp byte [ebp + 0x11], 0xc
    jne short loc_0905
    mov word [ebp + 0x20], 0xa4
    jmp short loc_090b
loc_0905:
    mov word [ebp + 0x20], 0x8c
loc_090b:
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0x8b, 0x14, 0x45, 0x98, 0x51, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb5198]
    mov word [ebp + 0x1c], dx
    db 0xc6, 0x04, 0x45, 0xe9, 0x52, 0x0b, 0x00, 0x02    ; mov byte [eax*2 + 0xb52e9], 2
loc_0934:
    cmp dword [esp + 0x14], 0x200
    jge near loc_0156
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ax, word [ebp + 0x18]
    cmp ax, word [edx + 0xb519e]
    jne near loc_0156
    mov ebx, dword [ebp + 4]
    mov ecx, dword [edx + 0xb5118]
    mov eax, dword [ebp]
    mov esi, dword [edx + 0xb5114]
    sub ebx, ecx
    sub eax, esi
    mov edx, ebx
    call 0x65698
    mov word [ebp + 0x20], 0x31
    mov word [ebp + 0x1c], ax
    jmp near loc_0156
loc_0997:
    cmp word [ebp + 0x22], 0
    jne near loc_0a70
    mov edi, 0x200
    mov word [ebp + 0x22], 1
    mov dword [esp + 0x10], edi
    jmp near loc_0a62
loc_09b6:
    xor edi, edi
    mov word [esp + 0x28], di
    jmp near loc_0a4d
loc_09c2:
    movsx eax, word [esp + 0x24]
    mov edx, 0xa1e
    call 0x19320
    and eax, 0xffff
    imul eax, eax, 0x2c
    mov word [eax + 0x1c0bb0], 0x181
    mov edx, dword [esp + 0x28]
    mov word [eax + 0x1c0bc0], dx
    mov edx, dword [esp + 0x10]
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    sar edx, 5
    mov word [eax + 0x1c0bc8], dx
    mov edx, dword [esp + 0x10]
    add edx, 0x200
    mov bl, 0x40
    and edx, 0x7ff
    mov byte [eax + 0x1c0bb6], bl
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    mov ebx, dword [esp + 0x28]
    sar edx, 9
    add ebx, 0x80
    mov word [eax + 0x1c0bc4], dx
    mov edx, dword [esp + 0x24]
    mov word [esp + 0x28], bx
    mov word [eax + 0x1c0bc2], dx
loc_0a4d:
    cmp word [esp + 0x28], 0x800
    jl near loc_09c2
    add dword [esp + 0x10], 0x80
loc_0a62:
    cmp dword [esp + 0x10], 0x600
    jl near loc_09b6
loc_0a70:
    mov eax, dword [esp + 0x18]
    cmp dword [eax + 0xc], 0
    jle short loc_0ae1
    mov cx, word [ebp + 0x24]
    cmp cx, 0x1800
    jge short loc_0a91
    mov edi, ecx
    add edi, 0xc0
    mov word [ebp + 0x24], di
loc_0a91:
    movsx eax, word [ebp + 0x24]
    mov edi, dword [ebp + 8]
    movsx edx, si
    add edi, eax
    lea eax, [edx*4]
    add eax, edx
    lea eax, [eax*8]
    mov dword [ebp + 8], edi
    mov ebx, dword [eax + 0x2385ac]
    cmp edi, ebx
    jle short loc_0abd
    mov dword [ebp + 8], ebx
loc_0abd:
    mov eax, dword [esp + 0x18]
    mov ecx, dword [eax + 0xc]
    dec ecx
    mov dword [eax + 0xc], ecx
    jne near loc_304e
    movsx eax, word [esp + 0x24]
    call 0x6ab35
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_0ae1:
    cmp dword [eax + 8], 0xa
    jle near loc_304e
    mov ax, word [0x2454cc]
    mov ecx, dword [esp + 0x24]
loc_0af5:
    mov word [esp + 0x28], ax
    mov eax, dword [esp + 0x28]
    test ax, ax
    jl short loc_0b4f
    movsx edx, ax
    imul eax, edx, 0x2c
    cmp cx, word [eax + 0x1c0bc2]
    jne short loc_0b40
    cmp word [eax + 0x1c0bb2], 0xa1e
    jne short loc_0b40
    call 0x7079f
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    and ebx, 0x3f
    sub eax, edx
    inc ebx
    mov dword [eax + 0x4ea0b], ebx
loc_0b40:
    movsx eax, word [esp + 0x28]
    db 0x66, 0x8b, 0x04, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov ax, word [eax*2 + 0x1af7a4]
    jmp short loc_0af5
loc_0b4f:
    mov eax, dword [esp + 0x18]
    mov dword [eax + 0xc], 0x40
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_0b63:
    movsx eax, word [esp + 0x24]
    call 0x37570
    movsx edx, word [ebp + 0x18]
    lea eax, [edx*4]
    add eax, edx
    test byte [eax*8 + 0x2385b0], 1
    je short loc_0b9b
    movsx edx, word [ebp + 0x18]
    lea eax, [edx*4]
    add eax, edx
    movsx edx, byte [eax*8 + 0x2385b8]
    jmp short loc_0bb0
loc_0b9b:
    movsx edx, word [ebp + 0x18]
    lea eax, [edx*4]
    add eax, edx
    movsx edx, byte [eax*8 + 0x2385c0]
loc_0bb0:
    movsx eax, byte [ebp + 0x10]
    sub edx, eax
    sar edx, 1
    movsx eax, byte [ebp + 0x10]
    add eax, edx
    mov byte [ebp + 0x10], al
    movsx edx, si
    lea eax, [edx*4]
    add eax, edx
    mov eax, dword [eax*8 + 0x2385a8]
    mov edx, dword [ebp + 8]
    add eax, 0x2000
    cmp eax, edx
    jle short loc_0be3
    mov dword [ebp + 8], eax
loc_0be3:
    cmp dword [0xe97df], 2
    jge short loc_0c11
    mov bl, byte [0x7fb1]
    cmp bl, 1
    jne short loc_0c06
    mov word [ebp + 0xc], 0x8000
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_0c06:
    cmp bl, 2
    jne short loc_0c11
    mov word [ebp + 0xc], 0x101
loc_0c11:
    movsx eax, word [esp + 0x24]
    call 0x29210
    test ax, ax
    jl near loc_0cd9
    cmp word [ebp + 0x2a], 0
    jge short loc_0c40
    mov eax, dword [esp + 0x18]
    cmp dword [eax], -1
    je short loc_0c40
    mov dword [eax], 0xffffffff
    mov word [ebp + 0x2a], 0
loc_0c40:
    movsx ebx, word [esp + 0x24]
    mov eax, 0x80
    mov edx, ebx
    call 0x5aca0
    push 5
    push ebx
    mov edx, 0xfffffe00
    call 0x7079f
    and eax, 0x7ff
    sub edx, eax
    push edx
    call 0x7079f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x7079f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x7079f
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [ebp + 8]
    push eax
    sub ecx, 0x800
    call 0x7079f
    and eax, 0x1fff
    sub ecx, eax
    call 0x7079f
    and eax, 0xff
    mov ebx, dword [ebp + 4]
    add ebx, eax
    call 0x7079f
    and eax, 0xff
    add eax, dword [ebp]
    lea edx, [eax - 0x80]
    sub ebx, 0x80
    movsx eax, word [ebp + 0x18]
    call 0x18f70
loc_0cd9:
    mov eax, dword [esp + 0x18]
    cmp dword [eax], -1
    jne near loc_0e4b
    add dword [ebp + 8], 0x400
    mov eax, dword [esp + 0x18]
    inc dword [eax + 8]
    test byte [eax + 8], 3
    jne short loc_0d09
    movsx eax, word [esp + 0x24]
    mov edx, 0x762
    call 0x19320
loc_0d09:
    movsx ebx, word [esp + 0x24]
    mov eax, ebx
    mov edx, 0x10001
    call 0x37570
    mov cx, word [ebp + 0x1c]
    mov word [ebp + 0x20], 0x80
    add ecx, 0x60
    mov eax, ebx
    mov word [ebp + 0x1c], cx
    call 0x28740
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jne short loc_0d59
    lea edx, [ebx*8]
    add edx, ebx
    lea edx, [edx*8]
    sub edx, ebx
    mov eax, dword [ebp + 8]
    cmp eax, dword [edx + 0x4e9eb]
    jle near loc_304e
loc_0d59:
    xor ecx, ecx
    mov dword [esp + 0x10], ecx
    jmp near loc_0df5
loc_0d64:
    push 5
    movsx eax, word [esp + 0x28]
    push eax
    mov edx, 0xfffffe00
    call 0x7079f
    and eax, 0x7ff
    sub edx, eax
    push edx
    call 0x7079f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x7079f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x7079f
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [ebp + 8]
    push eax
    sub ecx, 0x800
    call 0x7079f
    and eax, 0x1fff
    sub ecx, eax
    call 0x7079f
    and eax, 0xff
    mov ebx, dword [ebp + 4]
    add ebx, eax
    call 0x7079f
    and eax, 0xff
    add eax, dword [ebp]
    lea edx, [eax - 0x80]
    sub ebx, 0x80
    movsx eax, word [ebp + 0x18]
    call 0x18f70
    inc dword [esp + 0x10]
loc_0df5:
    cmp dword [esp + 0x10], 0x10
    jl near loc_0d64
    movsx ebx, word [esp + 0x24]
    mov eax, 0x11
    mov edx, ebx
    call 0x5aca0
    mov edx, 0x7d0
    mov eax, ebx
    call 0x19320
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xfe, 0x04, 0x45, 0xf4, 0x52, 0x0b, 0x00    ; inc byte [eax*2 + 0xb52f4]
    mov eax, ebx
    call 0x6ab35
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_0e4b:
    movsx edx, word [esp + 0x24]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + 0x4e9eb]
    mov edx, dword [ebp + 8]
    sub eax, 0x3100
    cmp eax, edx
    jge short loc_0e77
    mov dword [ebp + 8], eax
loc_0e77:
    lea edx, [esp + 0x14]
    mov eax, ebp
    call 0x53700
    mov dword [esp + 0x20], eax
    mov ax, word [ebp + 0x1e]
    mov word [esp + 0x28], ax
    mov eax, dword [esp + 0x18]
    mov ebx, dword [eax]
    cmp ebx, 4
    jl near loc_0fc0
    inc dword [eax + 8]
    test byte [eax + 8], 0xf
    jne short loc_0ee9
    movsx ecx, word [esp + 0x24]
    mov edx, ecx
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov ax, word [eax + 0x4e9e3]
    mov bx, word [ebp + 0x1c]
    mov word [ebp + 0x1c], ax
    mov eax, 0x7f
    call 0x5aca0
    mov edx, 0x659
    mov eax, ecx
    call 0x48740
    mov word [ebp + 0x1c], bx
loc_0ee9:
    mov eax, dword [esp + 0x18]
    cmp dword [eax + 8], 0x4e
    jg short loc_0f43
    movsx edx, word [esp + 0x20]
    mov esi, edx
    shl esi, 7
    sub esi, edx
    lea esi, [esi*4]
    sub esi, edx
    add esi, esi
    movsx eax, word [esi + 0xb519e]
    mov edi, dword [esi + 0xb511c]
    push eax
    movsx ecx, word [ebp + 0x18]
    push edi
    mov eax, dword [esi + 0xb5118]
    mov ebx, dword [ebp + 8]
    push eax
    mov edx, dword [esi + 0xb5114]
    sub ebx, 0x1000
    push edx
    mov eax, dword [ebp]
    mov edx, dword [ebp + 4]
    call 0x6ae4d
    test eax, eax
    jne short loc_0f59
loc_0f43:
    mov eax, dword [esp + 0x18]
    mov dword [eax], 0
    mov dword [eax + 8], 0
    jmp near loc_1145
loc_0f59:
    movsx edx, word [esp + 0x24]
    lea ebx, [edx*8]
    add ebx, edx
    mov ecx, dword [ebp + 4]
    lea ebx, [ebx*8]
    mov eax, dword [esi + 0xb5114]
    sub ebx, edx
    mov edx, dword [esi + 0xb5118]
    mov esi, dword [ebp]
    sub edx, ecx
    sub eax, esi
    call 0x65698
    movsx edx, ax
    movsx eax, word [ebx + 0x4e9e3]
    call 0x374b0
    movsx edx, ax
    mov ecx, 3
    mov eax, edx
    sar edx, 0x1f
    idiv ecx
    mov edx, eax
    movsx eax, word [ebx + 0x4e9e3]
    add eax, edx
    mov word [ebx + 0x4e9e3], ax
    jmp near loc_1145
loc_0fc0:
    cmp ebx, 2
    je short loc_0fce
    cmp ebx, 3
    jne near loc_1145
loc_0fce:
    mov eax, dword [esp + 0x18]
    mov dword [eax + 0xc], 0
    mov di, word [ebp + 0x20]
    test di, di
    jle short loc_0fed
    mov eax, edi
    sub eax, 0x10
    mov word [ebp + 0x20], ax
    jmp short loc_0ff3
loc_0fed:
    mov word [ebp + 0x20], 0
loc_0ff3:
    mov eax, dword [esp + 0x18]
    cmp dword [eax], 2
    jne short loc_105c
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ebx, dword [ebp + 8]
    mov eax, dword [edx + 0xb511c]
    sub eax, ebx
    mov dword [esp + 0x10], eax
    test eax, eax
    jns short loc_1029
    neg eax
loc_1029:
    cmp eax, 0x3100
    jge short loc_103f
    mov eax, dword [esp + 0x18]
    mov dword [eax], 3
    jmp near loc_10f4
loc_103f:
    mov ebx, dword [edx + 0xb511c]
    sub ebx, dword [ebp + 8]
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    shl eax, 0xa
    add dword [ebp + 8], eax
    jmp near loc_10f4
loc_105c:
    mov edx, dword [eax + 8]
    inc edx
    mov dword [eax + 8], edx
    cmp edx, 0x4e
    jg short loc_10ba
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x9e, 0x51, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb519e]
    mov ebx, dword [ebp + 8]
    push edx
    db 0x8b, 0x0c, 0x45, 0x1c, 0x51, 0x0b, 0x00    ; mov ecx, dword [eax*2 + 0xb511c]
    sub ebx, 0x1000
    push ecx
    db 0x8b, 0x34, 0x45, 0x18, 0x51, 0x0b, 0x00    ; mov esi, dword [eax*2 + 0xb5118]
    db 0x8b, 0x3c, 0x45, 0x14, 0x51, 0x0b, 0x00    ; mov edi, dword [eax*2 + 0xb5114]
    push esi
    mov eax, dword [ebp]
    mov edx, dword [ebp + 4]
    push edi
    movsx ecx, word [ebp + 0x18]
    call 0x6ae4d
    test eax, eax
    jne short loc_10cd
loc_10ba:
    mov eax, dword [esp + 0x18]
    mov dword [eax], 1
    mov dword [eax + 8], 0
    jmp short loc_10f4
loc_10cd:
    mov eax, dword [esp + 0x18]
    test byte [eax + 8], 0xf
    jne short loc_10f4
    movsx ebx, word [esp + 0x24]
    mov eax, 0x7f
    mov edx, ebx
    call 0x5aca0
    mov edx, 0x659
    mov eax, ebx
    call 0x48740
loc_10f4:
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov edi, dword [ebp + 4]
    mov ebx, dword [edx + 0xb5118]
    mov eax, dword [edx + 0xb5114]
    mov edx, dword [ebp]
    sub ebx, edi
    sub eax, edx
    mov edx, ebx
    call 0x65698
    movsx edx, ax
    movsx eax, word [ebp + 0x1c]
    call 0x374b0
    cwde
    mov edx, eax
    sar edx, 2
    movsx eax, word [ebp + 0x1c]
    add eax, edx
    mov word [ebp + 0x1c], ax
loc_1145:
    mov eax, dword [esp + 0x18]
    mov edi, dword [eax]
    cmp edi, 2
    je near loc_1373
    cmp edi, 3
    je near loc_1373
    movsx ebx, word [esp + 0x28]
    imul ebx, ebx, 0x2c
    mov eax, 0x1c0ba4
    mov edx, ebp
    add eax, ebx
    call 0x536a0
    mov dword [esp + 0x10], eax
    cmp eax, 0x5f4
    jg short loc_118f
    mov dx, word [ebp + 0x20]
    sar dx, 1
    mov bx, word [ebp + 0x1c]
    mov word [ebp + 0x20], dx
    jmp short loc_11ac
loc_118f:
    mov edx, dword [ebx + 0x1c0ba8]
    mov ecx, dword [ebp + 4]
    mov eax, dword [ebx + 0x1c0ba4]
    mov esi, dword [ebp]
    sub edx, ecx
    sub eax, esi
    call 0x65698
    mov ebx, eax
loc_11ac:
    mov eax, dword [esp + 0x18]
    mov edi, dword [eax]
    cmp edi, 1
    je short loc_11c0
    cmp edi, 4
    jne near loc_128d
loc_11c0:
    movsx eax, word [esp + 0x28]
    imul eax, eax, 0x2c
    mov edx, ebp
    add eax, 0x1c0ba4
    call 0x536d0
    mov dword [esp + 0x10], eax
    cmp eax, 0x5f4
    jg short loc_11f8
    mov eax, dword [esp + 0x18]
    cmp dword [eax], 1
    jne short loc_11f0
    mov dword [eax], 0
    jmp short loc_122c
loc_11f0:
    mov dword [eax], 5
    jmp short loc_122c
loc_11f8:
    jle short loc_1212
    mov di, word [ebp + 0x20]
    cmp di, 0x100
    jge short loc_122c
    mov eax, edi
    db 0x05, 0x20, 0x00, 0x00, 0x00    ; add eax, 0x20
    mov word [ebp + 0x20], ax
    jmp short loc_122c
loc_1212:
    mov cx, word [ebp + 0x20]
    test cx, cx
    jle short loc_1226
    mov esi, ecx
    sub esi, 0x10
    mov word [ebp + 0x20], si
    jmp short loc_122c
loc_1226:
    mov word [ebp + 0x20], 0
loc_122c:
    mov eax, dword [esp + 0x18]
    cmp dword [eax], 2
    jge short loc_1238
    inc dword [eax + 8]
loc_1238:
    cmp dword [esp + 0x14], 0x1800
    jge short loc_128d
    mov eax, dword [esp + 0x18]
    cmp dword [eax], 2
    jge short loc_128d
    cmp dword [eax + 8], 0x68
    jle short loc_128d
    call 0x7079f
    and eax, 2
    mov edx, dword [esp + 0x18]
    add eax, 2
    mov dword [edx + 8], 0
    mov dword [edx], eax
    movsx edx, word [esp + 0x24]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov ax, word [ebp + 0x1c]
    mov word [edx + 0x4e9e3], ax
loc_128d:
    mov eax, dword [esp + 0x18]
    mov esi, dword [eax]
    test esi, esi
    je short loc_12a0
    cmp esi, 5
    jne near loc_1329
loc_12a0:
    mov eax, dword [esp + 0x18]
    cmp dword [eax], 0
    jne short loc_12b1
    mov dword [eax], 1
    jmp short loc_12b7
loc_12b1:
    mov dword [eax], 4
loc_12b7:
    mov edx, 0xffffffff
    movsx eax, word [ebp + 0x28]
    call 0x18f20
    mov word [esp + 0x28], ax
    mov word [ebp + 0x1e], ax
    cwde
    cmp eax, -1
    jne short loc_1325
    movsx ecx, word [esp + 0x24]
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov ax, word [eax + 0x4ea1b]
    mov edx, 0xffffffff
    mov word [esp + 0x28], ax
    mov word [ebp + 0x28], ax
    cwde
    call 0x18f20
    mov word [esp + 0x28], ax
    mov word [ebp + 0x1e], ax
    cwde
    cmp eax, -1
    jne short loc_1329
    mov eax, ecx
    call 0x6ab35
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_1325:
    inc word [ebp + 0x28]
loc_1329:
    movsx edx, bx
    movsx eax, word [ebp + 0x1c]
    call 0x374b0
    mov edx, dword [esp + 0x18]
    cwde
    mov dword [edx + 0xc], eax
    mov edx, eax
    sar edx, 3
    movsx eax, word [ebp + 0x1c]
    add eax, edx
    mov word [ebp + 0x1c], ax
    movsx eax, word [esp + 0x28]
    imul edx, eax, 0x2c
    mov eax, dword [ebp + 8]
    cmp eax, dword [edx + 0x1c0bac]
    jge short loc_136a
    lea esi, [eax + 0x400]
    mov dword [ebp + 8], esi
    jmp short loc_1373
loc_136a:
    lea ecx, [eax - 0x400]
    mov dword [ebp + 8], ecx
loc_1373:
    cmp dword [0xe7c32], 0
    jne short loc_138b
    movsx edx, word [esp + 0x24]
    mov eax, 0x7d
    call 0x5aca0
loc_138b:
    movsx eax, word [esp + 0x24]
    mov edx, 0x10001
    call 0x28740
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_13a3:
    movsx edx, word [esp + 0x24]
    mov eax, edx
    call 0x37570
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [eax + 0x4e9eb]
    sub eax, dword [edx + 0x4e9ef]
    sar eax, 9
    mov word [esp + 0x28], ax
    cmp ax, 0xff
    jle short loc_13e4
    mov word [esp + 0x28], 0xff
loc_13e4:
    movsx eax, word [esp + 0x28]
    mov edx, 0x19
    sar eax, 1
    sub edx, eax
    mov dword [esp + 0x14], edx
    cmp edx, 8
    jge short loc_1405
    mov dword [esp + 0x14], 8
    jmp short loc_1412
loc_1405:
    cmp edx, 0x31
    jle short loc_1412
    mov dword [esp + 0x14], 0x30
loc_1412:
    movsx edx, word [esp + 0x24]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + 0x4e9eb]
    mov dword [ebp + 8], eax
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_143b:
    cmp dword [0xe97df], 2
    jge short loc_1469
    mov bl, byte [0x7fb1]
    cmp bl, 1
    jne short loc_145e
    mov word [ebp + 0xc], 0x8000
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_145e:
    cmp bl, 2
    jne short loc_1469
    mov word [ebp + 0xc], 0x101
loc_1469:
    movsx edx, si
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [esp + 0x18]
    add dword [edx + 4], 0x80
    test byte [eax*8 + 0x2385b2], 1
    je short loc_149d
    movsx eax, word [esp + 0x24]
    call 0x6ab35
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_149d:
    lea edx, [esp + 0x14]
    mov eax, ebp
    call 0x53700
    mov ecx, dword [esp + 0x14]
    mov dword [esp + 0x20], eax
    cmp ecx, 0x5000
    jle short loc_1503
    movsx ebx, word [esp + 0x24]
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov dx, word [eax + 0x4e9e9]
    inc edx
    mov word [eax + 0x4e9e9], dx
    cmp dx, 0x600
    jle short loc_1503
    xor edx, edx
    mov word [eax + 0x4e9e9], dx
    mov edx, 2
    mov eax, ebx
    call 0x6ad3e
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_1503:
    mov eax, dword [esp + 0x18]
    cmp dword [eax], -5
    jne near loc_16c8
    mov edx, dword [eax + 0xc]
    inc edx
    mov dword [eax + 0xc], edx
    cmp edx, 0x118
    jle short loc_1532
    mov byte [ebp + 0x11], 0
    mov dword [eax], 0
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_1532:
    movsx edx, word [esp + 0x24]
    mov eax, edx
    call 0x37770
    mov word [ebp + 0xc], 0x101
    mov word [ebp + 0xe], 0x944
    mov word [ebp + 0x2a], 1
    mov eax, edx
    mov byte [ebp + 0x11], 1
    call 0x29210
    test ax, ax
    jl near loc_1637
    cmp ax, 0x669
    je near loc_304e
    mov word [esp + 0x28], 0x10
    jmp near loc_160a
loc_157a:
    push 5
    movsx ebx, word [esp + 0x28]
    push ebx
    mov edx, 0x400
    call 0x7079f
    and eax, 0x3ff
    sub edx, eax
    push edx
    call 0x7079f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x20, 0x00, 0x00, 0x00    ; add eax, 0x20
    cwde
    push eax
    call 0x7079f
    and ah, 7
    mov ecx, 3
    cwde
    movsx edx, word [esp + 0x38]
    push eax
    mov eax, edx
    sar edx, 0x1f
    idiv ecx
    push 0x24
    push 0x24
    add edx, 0x407
    push -0x20
    movsx eax, dx
    push eax
    imul eax, ebx, 0x2c
    mov ecx, dword [eax + 0x1c0bac]
    mov ebx, dword [eax + 0x1c0ba8]
    mov edx, dword [eax + 0x1c0ba4]
    movsx eax, word [eax + 0x1c0bbc]
    call 0x18f70
    and eax, 0xffff
    imul eax, eax, 0x2c
    mov edx, dword [esp + 0x28]
    dec edx
    mov bh, 1
    mov word [esp + 0x28], dx
    mov byte [eax + 0x1c0bb5], bh
loc_160a:
    cmp word [esp + 0x28], 0
    jge near loc_157a
    movsx ebx, word [esp + 0x24]
    mov eax, 0x13
    mov edx, ebx
    call 0x5aca0
    mov eax, ebx
    call 0x6ab35
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_1637:
    cmp dword [esp + 0x14], 0x400
    jge near loc_304e
    movsx ebx, word [esp + 0x20]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea ebx, [eax + eax]
    cmp word [ebx + 0xb5252], 0
    jne near loc_304e
    imul edx, edx, 0x2c
    mov esi, dword [ebx + 0xb5118]
    mov edi, dword [ebx + 0xb5114]
    mov ecx, dword [edx + 0x1c0ba8]
    mov eax, dword [edx + 0x1c0ba4]
    sub ecx, esi
    sub eax, edi
    mov edx, ecx
    call 0x65698
    movsx edx, ax
    movsx eax, word [ebx + 0xb5198]
    call 0x374b0
    movsx edx, ax
    cmp edx, -0x80
    jle near loc_304e
    cmp ax, 0x80
    jge near loc_304e
    mov word [ebx + 0xb5252], 0xe
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_16c8:
    cmp dword [esp + 0x14], 0x63c
    jge short loc_16da
    mov word [ebp + 0xc], 0
    jmp short loc_16e0
loc_16da:
    mov word [ebp + 0xc], 0x101
loc_16e0:
    mov eax, dword [esp + 0x18]
    cmp dword [eax], -4
    jne near loc_1b05
    movsx eax, word [esp + 0x20]
    mov edi, eax
    shl edi, 7
    sub edi, eax
    lea edi, [edi*4]
    sub edi, eax
    add edi, edi
    mov dword [esp + 0x1c], eax
    movsx eax, word [edi + 0xb5240]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bce], 1
    jge short loc_172f
    mov eax, dword [esp + 0x18]
    mov dword [eax], 0
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_172f:
    movsx eax, word [esp + 0x24]
    mov ecx, dword [ebp + 8]
    mov ebx, dword [ebp + 4]
    mov edx, dword [ebp]
    call 0x6a826
    mov ax, word [edi + 0xb5198]
    mov edx, dword [esp + 0x1c]
    mov word [ebp + 0x1c], ax
    lea eax, [edx*4]
    add eax, edx
    db 0xf6, 0x04, 0x45, 0x66, 0x02, 0x0e, 0x00, 0x04    ; test byte [eax*2 + 0xe0266], 4
    jne short loc_1772
    cmp word [edi + 0xb5252], 0
    jle near loc_18f9
loc_1772:
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    movsx edx, word [eax + 0xb5240]
    imul edx, edx, 0x2c
    cmp word [edx + 0x1c0bce], 0
    jle near loc_18f9
    cmp word [eax + 0xb5252], 0
    jg short loc_17e2
    mov dx, word [eax + 0xb5212]
    cmp dx, 0xf
    je near loc_18f9
    cmp dx, 0xa
    je near loc_18f9
    cmp dx, 0xd
    je near loc_18f9
    movsx edx, dx
    cmp word [eax + edx*2 + 0xb51a6], 0
    jl near loc_18f9
loc_17e2:
    xor edi, edi
    mov dword [esp + 0x14], edi
    jmp short loc_185e
loc_17ea:
    push 5
    movsx eax, word [esp + 0x28]
    push eax
    movsx edx, word [ebp + 0x24]
    call 0x7079f
    and eax, 0xfff
    sar edx, 2
    neg eax
    sub eax, edx
    push eax
    call 0x7079f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x7079f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x7079f
    xor ah, ah
    mov ecx, dword [ebp + 8]
    and al, 3
    mov ebx, dword [ebp + 4]
    add eax, 0x968
    mov edx, dword [ebp]
    cwde
    sub ecx, 0x800
    push eax
    movsx eax, si
    call 0x18f70
    cwde
    imul eax, eax, 0x2c
    mov byte [eax + 0x1c0bb5], 6
    inc dword [esp + 0x14]
loc_185e:
    cmp dword [esp + 0x14], 8
    jl short loc_17ea
    movsx ebx, word [esp + 0x24]
    mov eax, 0x95
    mov edx, ebx
    call 0x5aca0
    mov eax, 0x45
    mov edx, ebx
    call 0x5aca0
    call 0x7079f
    and eax, 0xff
    cmp eax, 0x20
    jge short loc_18a9
    mov edx, 0x4ca
    mov eax, ebx
    call 0x19320
    cwde
    imul eax, eax, 0x2c
    xor dl, dl
    mov byte [eax + 0x1c0bb5], dl
loc_18a9:
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    inc byte [eax + 0xb52f4]
    mov edx, dword [esp + 0x18]
    mov dword [edx], 0xfffffffd
    mov esi, dword [esp + 0x24]
    cmp si, word [eax + 0xb523c]
    jne short loc_18e6
    mov word [eax + 0xb523c], 0xffff
loc_18e6:
    movsx eax, word [esp + 0x24]
    call 0x6ab35
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_18f9:
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x14, 0x45, 0x1c, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb511c]
    db 0x03, 0x14, 0x45, 0x44, 0x51, 0x0b, 0x00    ; add edx, dword [eax*2 + 0xb5144]
    mov ebx, dword [esp + 0x18]
    sub edx, dword [ebx + 8]
    add edx, 0x800
    mov dword [ebp + 8], edx
    mov edx, 0x64
    db 0x8b, 0x34, 0x45, 0x20, 0x51, 0x0b, 0x00    ; mov esi, dword [eax*2 + 0xb5120]
    mov eax, edx
    sub eax, esi
    mov edi, dword [ebp + 8]
    shl eax, 4
    add edi, eax
    mov dword [ebp + 8], edi
    mov edx, dword [ebx + 8]
    cmp edx, 0x200
    jle short loc_195a
    mov eax, ebx
    lea ebx, [edx - 0x80]
    mov dword [eax + 8], ebx
loc_195a:
    mov eax, dword [esp + 0x18]
    mov ecx, dword [eax + 8]
    cmp ecx, 0x15c
    jge short loc_1972
    lea esi, [ecx + 0x80]
    mov dword [eax + 8], esi
loc_1972:
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xb521e], 0
    jl short loc_19da
    add eax, 0xb4f00
    call 0x47d00
    mov ax, word [0x2454c4]
loc_19a3:
    mov word [esp + 0x28], ax
    mov edi, dword [esp + 0x28]
    test di, di
    jl short loc_19da
    movsx eax, di
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x26d
    jne short loc_19cb
    xor ebx, ebx
    mov word [eax + 0x1c0bc6], bx
loc_19cb:
    movsx eax, word [esp + 0x28]
    db 0x66, 0x8b, 0x04, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov ax, word [eax*2 + 0x1af7a4]
    jmp short loc_19a3
loc_19da:
    mov eax, dword [esp + 0x18]
    cmp dword [eax + 0xc], 0
    jle near loc_1a77
    mov edi, esp
    mov esi, 0x17388
    db 0xa5    ; movsd dword es:[edi], dword [esi]
    db 0xa5    ; movsd dword es:[edi], dword [esi]
    db 0xa5    ; movsd dword es:[edi], dword [esi]
    db 0xa5    ; movsd dword es:[edi], dword [esi]
    mov eax, dword [eax + 0xc]
    mov ax, word [esp + eax*2]
    add eax, 0x942
    mov word [ebp + 0xe], ax
    mov eax, dword [esp + 0x18]
    cmp dword [eax + 0xc], 5
    jne short loc_1a5a
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5240]
    imul edx, edx, 0x2c
    call 0x7079f
    xor ah, ah
    and al, 3
    db 0x05, 0x05, 0x00, 0x00, 0x00    ; add eax, 5
    mov cx, word [edx + 0x1c0bce]
    sub ecx, eax
    mov eax, 0x22
    mov word [edx + 0x1c0bce], cx
    movsx edx, word [esp + 0x24]
    call 0x5aca0
loc_1a5a:
    mov eax, dword [esp + 0x18]
    mov ecx, dword [eax + 0xc]
    cmp ecx, 7
    jge short loc_1a6e
    lea esi, [ecx + 1]
    mov dword [eax + 0xc], esi
    jmp short loc_1a97
loc_1a6e:
    mov dword [eax + 0xc], 0
    jmp short loc_1a97
loc_1a77:
    mov word [ebp + 0xe], 0x947
    call 0x7079f
    sar eax, 8
    cmp eax, 0xdf
    jl short loc_1a97
    mov eax, dword [esp + 0x18]
    mov dword [eax + 0xc], 1
loc_1a97:
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x98, 0x51, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5198]
    add edx, 0x200
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x1c, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx ebx, word [edx*2 + 0x1b7fa4]
    sar ebx, 7
    db 0x8b, 0x14, 0x45, 0x14, 0x51, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb5114]
    add edx, ebx
    mov dword [ebp], edx
    db 0x66, 0x8b, 0x14, 0x45, 0x98, 0x51, 0x0b, 0x00    ; mov dx, word [eax*2 + 0xb5198]
    and dh, 7
    movsx edx, dx
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    db 0x8b, 0x04, 0x45, 0x18, 0x51, 0x0b, 0x00    ; mov eax, dword [eax*2 + 0xb5118]
    sar edx, 7
    add eax, edx
    mov dword [ebp + 4], eax
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_1b05:
    cmp word [ebp + 0x20], 0x40
    jge short loc_1b72
    cmp dword [esp + 0x14], 0x300
    jge short loc_1b72
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    movsx edx, word [eax + 0xb523c]
    cmp edx, -1
    jne short loc_1b72
    mov edx, dword [esp + 0x24]
    mov word [eax + 0xb523c], dx
    mov eax, dword [esp + 0x18]
    mov ecx, dword [eax]
    cmp ecx, 3
    je short loc_1b54
    cmp ecx, 2
    jne short loc_1b61
loc_1b54:
    mov eax, dword [esp + 0x18]
    mov dword [eax + 8], 0xc00
    jmp short loc_1b68
loc_1b61:
    mov dword [eax + 8], 0xfffff300
loc_1b68:
    mov eax, dword [esp + 0x18]
    mov dword [eax], 0xfffffffc
loc_1b72:
    movsx edx, word [esp + 0x24]
    mov eax, edx
    call 0x29210
    mov word [esp + 0x28], ax
    test ax, ax
    jl near loc_1cda
    mov eax, 0x95
    call 0x5aca0
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov cl, byte [eax + 0xb52f4]
    mov ebx, dword [esp + 0x24]
    inc cl
    mov dx, word [eax + 0xb523c]
    mov byte [eax + 0xb52f4], cl
    cmp dx, bx
    jne short loc_1bd4
    mov word [eax + 0xb523c], 0xffff
loc_1bd4:
    cmp word [esp + 0x28], 0x669
    jne short loc_1c06
    movsx edx, word [esp + 0x24]
    mov eax, 0x12f
    call 0x5aca0
    mov eax, dword [esp + 0x18]
    mov dword [eax], 0xfffffffb
    mov dword [eax + 0xc], 0
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_1c06:
    call 0x7079f
    and eax, 0xff
    cmp eax, 0x20
    jge short loc_1c30
    movsx eax, word [esp + 0x24]
    mov edx, 0x4ca
    call 0x19320
    cwde
    imul eax, eax, 0x2c
    xor ch, ch
    mov byte [eax + 0x1c0bb5], ch
loc_1c30:
    xor edi, edi
    mov dword [esp + 0x14], edi
    jmp short loc_1cb2
loc_1c38:
    push 5
    movsx eax, word [esp + 0x28]
    push eax
    movsx edx, word [ebp + 0x24]
    call 0x7079f
    and eax, 0xfff
    sar edx, 2
    neg eax
    sub eax, edx
    push eax
    call 0x7079f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x7079f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x7079f
    xor ah, ah
    mov ecx, dword [ebp + 8]
    and al, 3
    mov ebx, dword [ebp + 4]
    add eax, 0x968
    mov edx, dword [ebp]
    cwde
    sub ecx, 0x800
    push eax
    movsx eax, si
    call 0x18f70
    cwde
    imul eax, eax, 0x2c
    mov edi, dword [esp + 0x14]
    inc edi
    mov ch, 6
    mov dword [esp + 0x14], edi
    mov byte [eax + 0x1c0bb5], ch
loc_1cb2:
    cmp dword [esp + 0x14], 8
    jl near loc_1c38
    mov eax, dword [esp + 0x18]
    mov dword [eax], 0xfffffffd
    movsx eax, word [esp + 0x24]
    call 0x6ab35
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_1cda:
    mov eax, dword [esp + 0x18]
    mov ebx, dword [eax]
    cmp ebx, -1
    jne short loc_1d04
    mov eax, edx
    call 0x37770
    mov bh, byte [ebp + 0xc]
    mov word [ebp + 0xe], 0x946
    and bh, 0xf7
    mov byte [ebp + 0xc], bh
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_1d04:
    cmp ebx, -2
    je short loc_1d10
    mov eax, edx
    call 0x37570
loc_1d10:
    mov eax, dword [esp + 0x18]
    cmp dword [eax], -2
    jne near loc_1e38
    movsx eax, word [esp + 0x24]
    call 0x37770
    mov eax, dword [esp + 0x18]
    imul eax, dword [eax + 0x14], 0x2c
    xor edx, edx
    mov word [eax + 0x1c0bc4], dx
    mov eax, dword [esp + 0x18]
    imul eax, dword [eax + 0x14], 0x2c
    movsx eax, word [eax + 0x1c0bc0]
    mov dword [esp + 0x10], eax
    mov eax, dword [esp + 0x18]
    imul eax, dword [eax + 0x14], 0x2c
    mov eax, dword [eax + 0x1c0bac]
    mov dword [ebp + 8], eax
    mov eax, dword [esp + 0x18]
    imul eax, dword [eax + 0x14], 0x2c
    mov edx, dword [esp + 0x10]
    add edx, 0x200
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    sar edx, 0xb
    mov eax, dword [eax + 0x1c0ba4]
    add eax, edx
    mov dword [ebp], eax
    mov eax, dword [esp + 0x18]
    imul ebx, dword [eax + 0x14], 0x2c
    mov eax, dword [esp + 0x10]
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [eax*2 + 0x1b7fa4]
    sar edx, 0xb
    mov eax, dword [ebx + 0x1c0ba8]
    add eax, edx
    mov dword [ebp + 4], eax
    mov ax, word [0xe8cca]
    xor ah, ah
    and al, 1
    add eax, 0x944
    mov ch, byte [ebp + 0x15]
    mov word [ebp + 0xe], ax
    cmp ch, 0x40
    jae short loc_1ddd
    mov bl, ch
    add bl, 2
    mov byte [ebp + 0x15], bl
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_1ddd:
    mov al, byte [ebp + 0x14]
    cmp al, 0x20
    jae short loc_1df5
    mov dh, al
    add dh, 4
    mov byte [ebp + 0x14], dh
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_1df5:
    mov eax, dword [esp + 0x18]
    imul edx, dword [eax + 0x14], 0x2c
    mov dword [eax], 0xffffffff
    mov eax, ebp
    add edx, 0x1c0ba4
    call 0x536a0
    mov dword [esp + 0x14], eax
    cmp eax, 0x300
    jge near loc_304e
    mov eax, dword [esp + 0x18]
    imul eax, dword [eax + 0x14], 0x2c
    xor dl, dl
    mov byte [eax + 0x1c0bb8], dl
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_1e38:
    call 0x7079f
    sar eax, 8
    cmp eax, 0xdf
    jl near loc_1ef5
    movsx eax, si
    db 0x66, 0x8b, 0x04, 0x45, 0xc4, 0x5c, 0x24, 0x00    ; mov ax, word [eax*2 + 0x245cc4]
loc_1e56:
    mov word [esp + 0x28], ax
    mov edi, dword [esp + 0x28]
    test di, di
    jl near loc_1ef5
    movsx eax, di
    imul eax, eax, 0x2c
    mov ax, word [eax + 0x1c0bb2]
    cmp ax, 0x7d0
    jb short loc_1e8d
    jbe short loc_1e93
    cmp ax, 0x848
    jb short loc_1ee3
    jbe short loc_1e93
    cmp ax, 0x1202
    je short loc_1e93
    jmp short loc_1ee3
loc_1e8d:
    cmp ax, 0x690
    jne short loc_1ee3
loc_1e93:
    movsx ecx, word [esp + 0x28]
    imul ebx, ecx, 0x2c
    mov edx, 0x1c0ba4
    mov eax, ebp
    add edx, ebx
    call 0x536a0
    cmp eax, 0x300
    jge short loc_1ee3
    mov eax, dword [ebp + 8]
    sub eax, dword [ebx + 0x1c0bac]
    test eax, eax
    jns short loc_1ebf
    neg eax
loc_1ebf:
    cmp eax, 0x2000
    jge short loc_1ee3
    mov eax, dword [esp + 0x18]
    mov dword [eax], 0xfffffffe
    mov dword [eax + 4], 0
    mov dword [eax + 0x14], ecx
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_1ee3:
    movsx eax, word [esp + 0x28]
    db 0x66, 0x8b, 0x04, 0x45, 0xa4, 0xc8, 0x1b, 0x00    ; mov ax, word [eax*2 + 0x1bc8a4]
    jmp near loc_1e56
loc_1ef5:
    mov eax, dword [esp + 0x18]
    mov edx, dword [eax]
    test edx, edx
    je short loc_1f08
    cmp edx, 2
    jne near loc_20d0
loc_1f08:
    mov word [ebp + 0xe], 0x942
    call 0x7079f
    test ax, 0x1ff
    jne short loc_1f28
    movsx edx, word [esp + 0x24]
    mov eax, 0xa3
    call 0x5aca0
loc_1f28:
    mov eax, dword [esp + 0x18]
    cmp dword [eax], 2
    jne short loc_1f9d
    mov al, byte [ebp + 0xc]
    and al, 0xf7
    movsx edx, si
    mov byte [ebp + 0xc], al
    lea eax, [edx*4]
    add eax, edx
    mov word [ebp + 0x24], 0
    test byte [eax*8 + 0x2385b0], 1
    jne short loc_1f7e
    movsx edx, word [esp + 0x24]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + 0x4e9ef]
    mov edi, dword [ebp + 8]
    add eax, 0x1800
    cmp eax, edi
    jge short loc_1fb0
loc_1f7e:
    mov ebx, dword [ebp + 8]
    add ebx, 0x800
    mov eax, dword [esp + 0x18]
    mov dword [ebp + 8], ebx
    mov dword [eax], 3
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_1f9d:
    mov ch, byte [ebp + 0xc]
    or ch, 8
    movsx eax, word [esp + 0x24]
    mov byte [ebp + 0xc], ch
    call 0x37770
loc_1fb0:
    test byte [0xe9827], 1
    je short loc_1fc8
    movsx eax, word [esp + 0x24]
    mov edx, 0x10001
    call 0x28740
loc_1fc8:
    mov ax, word [ebp + 0x20]
    db 0x66, 0x3d, 0x60, 0x00    ; cmp ax, 0x60
    jle short loc_1fe4
    mov esi, eax
    sub esi, 2
    mov word [ebp + 0x20], si
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_1fe4:
    db 0x66, 0x3d, 0x20, 0x00    ; cmp ax, 0x20
    jge short loc_1ff3
    mov ebx, eax
    add ebx, 4
    mov word [ebp + 0x20], bx
loc_1ff3:
    mov eax, dword [esp + 0x18]
    mov eax, dword [eax + 4]
    add eax, 0x200
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    mov edx, 0x40
    sar eax, 9
    sub edx, eax
    mov word [ebp + 0x20], dx
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ebx, dword [ebp + 4]
    mov eax, dword [edx + 0xb5118]
    sub eax, ebx
    mov ecx, dword [ebp]
    mov ebx, eax
    mov eax, dword [edx + 0xb5114]
    mov edx, ebx
    sub eax, ecx
    call 0x65698
    movsx edx, ax
    movsx eax, word [ebp + 0x1c]
    call 0x374b0
    cwde
    mov edx, eax
    sar edx, 3
    movsx eax, word [ebp + 0x1c]
    add eax, edx
    mov word [ebp + 0x1c], ax
    call 0x7079f
    sar eax, 8
    cmp eax, 0xfb
    jl short loc_20d0
    movsx edx, si
    lea eax, [edx*4]
    add eax, edx
    test byte [eax*8 + 0x2385b0], 1
    jne short loc_20d0
    movsx edx, word [esp + 0x24]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [eax + 0x4e9eb]
    sub eax, dword [edx + 0x4e9ef]
    test eax, eax
    jns short loc_20bd
    neg eax
loc_20bd:
    cmp eax, 0xc000
    jge short loc_20d0
    mov eax, dword [esp + 0x18]
    mov word [ebp + 0x24], 0
    inc dword [eax]
loc_20d0:
    mov eax, dword [esp + 0x18]
    cmp dword [eax], 1
    jne near loc_2158
    mov bh, byte [ebp + 0x15]
    mov word [ebp + 0xe], 0x942
    cmp bh, 0x28
    jae short loc_20f3
    mov cl, bh
    add cl, 8
    mov byte [ebp + 0x15], cl
loc_20f3:
    mov ch, byte [ebp + 0x14]
    cmp ch, 8
    jbe short loc_2102
    mov al, ch
    sub al, 4
    mov byte [ebp + 0x14], al
loc_2102:
    movsx eax, word [ebp + 0x24]
    cmp eax, 0xfffff400
    jle short loc_2113
    sub word [ebp + 0x24], 0x15c
loc_2113:
    movsx eax, word [ebp + 0x24]
    mov ebx, dword [ebp + 8]
    movsx edx, word [esp + 0x24]
    add ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [ebp + 8], ebx
    mov eax, dword [eax + 0x4e9ef]
    add eax, 0x1000
    cmp eax, ebx
    jle short loc_2158
    mov dword [ebp + 8], eax
    mov eax, dword [esp + 0x18]
    mov word [ebp + 0x20], 0
    mov dword [eax], 2
loc_2158:
    mov eax, dword [esp + 0x18]
    cmp dword [eax], 3
    jne near loc_304e
    movsx edx, word [esp + 0x24]
    mov eax, edx
    mov word [ebp + 0xe], 0x943
    call 0x37770
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + 0x4e9eb]
    mov edi, dword [ebp + 8]
    sub eax, 0x800
    cmp eax, edi
    jge short loc_21af
    mov bh, byte [ebp + 0x15]
    mov cl, byte [ebp + 0x14]
    sub bh, 4
    add cl, 2
    mov byte [ebp + 0x15], bh
    mov byte [ebp + 0x14], cl
    jmp short loc_21cf
loc_21af:
    mov ah, byte [ebp + 0x15]
    cmp ah, 0x24
    jae short loc_21bf
    mov dl, ah
    add dl, 8
    mov byte [ebp + 0x15], dl
loc_21bf:
    mov dh, byte [ebp + 0x14]
    cmp dh, 8
    jbe short loc_21cf
    mov bl, dh
    sub bl, 4
    mov byte [ebp + 0x14], bl
loc_21cf:
    movsx edx, word [esp + 0x24]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov eax, dword [eax + 0x4e9eb]
    mov edx, dword [ebp + 8]
    sub eax, 0x800
    cmp eax, edx
    jge near loc_304e
    mov dword [ebp + 8], eax
    mov eax, dword [esp + 0x18]
    mov dword [eax], 0
    mov word [ebp + 0x20], 0
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_2218:
    movsx eax, word [esp + 0x24]
    mov edx, 0xfff
    call 0x19320
    movsx edx, ax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + 0x4ea07], 3
loc_2246:
    movsx eax, word [ebp + 0xc]
    test ah, 0x80
    je short loc_228e
    mov eax, dword [esp + 0x18]
    mov ebx, dword [eax + 8]
    dec ebx
    mov dword [eax + 8], ebx
    test ebx, ebx
    jg near loc_304e
    movsx ebx, word [esp + 0x24]
    mov eax, 0x46
    mov edx, ebx
    call 0x5aca0
    mov edx, 0x65e
    mov eax, ebx
    call 0x19320
    mov word [ebp + 0xc], 0x101
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_228e:
    lea edx, [esp + 0x14]
    mov eax, ebp
    call 0x53700
    mov dword [esp + 0x20], eax
    cmp dword [esp + 0x14], 0x4c4
    jge short loc_22af
    and word [ebp + 0xc], 0xfefe
    jmp short loc_22b5
loc_22af:
    or word [ebp + 0xc], 0x101
loc_22b5:
    mov eax, dword [esp + 0x18]
    mov edx, dword [eax + 0xc]
    test edx, edx
    jne short loc_22ec
    movsx eax, word [esp + 0x24]
    call 0x29210
    test ax, ax
    jl short loc_22ec
    mov eax, dword [esp + 0x18]
    mov dword [eax + 0xc], 1
    mov dword [eax + 0x10], edx
    mov dword [esp + 0x10], edx
    mov word [ebp + 0x20], 0
    jmp near loc_25d7
loc_22ec:
    cmp word [ebp + 0xe], 0x3ac
    je near loc_23e2
    movsx edx, word [esp + 0x24]
    mov eax, edx
    movsx ebx, si
    call 0x37770
    lea eax, [ebx*4]
    add ebx, eax
    lea ebx, [ebx*8]
    cmp word [ebx + 0x2385c6], 1
    je near loc_23af
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [eax + 0x4e9eb]
    mov ecx, dword [ebp + 8]
    sub edx, 0x100
    cmp edx, ecx
    jg short loc_23af
    mov di, word [ebp + 0x22]
    cmp di, 3
    jge short loc_23af
    test di, di
    jg short loc_2369
    jne short loc_2378
    mov eax, dword [eax + 0x4e9eb]
    cmp eax, dword [ebx + 0x2385ac]
    jne short loc_2378
loc_2369:
    movsx edx, word [esp + 0x24]
    mov eax, 0xd
    call 0x5aca0
loc_2378:
    mov eax, 4
    sub ax, word [ebp + 0x22]
    shl eax, 8
    mov word [ebp + 0x24], ax
    neg eax
    movsx edx, word [ebp + 0x18]
    mov word [ebp + 0x24], ax
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385c6], 2
    jne short loc_23ab
    sar word [ebp + 0x24], 2
loc_23ab:
    inc word [ebp + 0x22]
loc_23af:
    movsx edx, word [esp + 0x24]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [ebp + 8]
    mov ebx, dword [eax + 0x4e9ef]
    cmp edx, ebx
    jge short loc_23e2
    lea eax, [ebx + 0x300]
    mov word [ebp + 0x24], 0
    mov dword [ebp + 8], eax
loc_23e2:
    mov ax, word [ebp + 0x1c]
    and ah, 7
    cwde
    db 0x0f, 0xbf, 0x1c, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx ebx, word [eax*2 + 0x1b7fa4]
    movsx eax, word [ebp + 0x20]
    imul ebx, eax
    movsx edx, word [ebp + 0x1c]
    add edx, 0x200
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    imul edx, eax
    push 0x10001
    movsx edi, word [esp + 0x28]
    movsx ecx, word [ebp + 0x24]
    sar ebx, 0xe
    sar edx, 0xe
    mov eax, edi
    call 0x28220
    mov word [esp + 0x28], ax
    imul eax, edi, 0x2c
    movsx edx, word [eax + 0x1c0bbc]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385c6], 1
    jne short loc_2484
    cmp word [ebp + 0x24], 0
    jne short loc_2484
    mov ecx, dword [ebp + 8]
    add ecx, 0x2000
    mov eax, dword [esp + 0x18]
    mov dword [ebp + 8], ecx
    cmp dword [eax + 0x14], 0
    jne short loc_248f
    mov edx, 0x564
    mov dword [eax + 0x14], 1
    mov eax, edi
    call 0x19320
    jmp short loc_248f
loc_2484:
    mov eax, dword [esp + 0x18]
    mov dword [eax + 0x14], 0
loc_248f:
    mov eax, dword [esp + 0x18]
    cmp dword [eax + 0xc], 0
    jne short loc_24e0
    mov cx, word [ebp + 0xe]
    cmp cx, 0x3ac
    je short loc_24ab
    cmp cx, 0x672
    jne short loc_24e0
loc_24ab:
    cmp word [esp + 0x28], 0
    jne short loc_24bd
    cmp dword [esp + 0x14], 0x34c
    jge short loc_24e0
loc_24bd:
    mov eax, dword [esp + 0x18]
    mov dword [eax + 0xc], 1
    xor esi, esi
    mov dword [eax + 0x10], 0
    mov dword [esp + 0x10], esi
    mov word [ebp + 0x20], 0
    jmp near loc_25d7
loc_24e0:
    movsx eax, word [ebp + 0x1e]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x214
    jne short loc_24ff
    movsx eax, word [eax + 0x1c0bc6]
    mov dword [esp + 0x10], eax
    jmp short loc_2507
loc_24ff:
    mov dword [esp + 0x10], 0xffffffff
loc_2507:
    mov bx, word [ebp + 0x20]
    test bx, bx
    jle short loc_2550
    movsx edx, si
    mov ecx, ebx
    lea eax, [edx*4]
    sub ecx, 5
    add eax, edx
    mov word [ebp + 0x20], cx
    cmp word [eax*8 + 0x2385c6], 2
    jne short loc_2539
    mov edi, ecx
    sub edi, 0xa
    mov word [ebp + 0x20], di
loc_2539:
    cmp word [ebp + 0x20], 0
    jge short loc_2546
    mov word [ebp + 0x20], 0
loc_2546:
    test byte [ebp + 0x20], 8
    je short loc_2550
    xor byte [ebp + 0xc], 4
loc_2550:
    movsx eax, word [esp + 0x28]
    and eax, 0xc000
    cmp eax, 0x8000
    jne short loc_25d7
    mov al, byte [esp + 0x29]
    mov ecx, dword [ebp + 4]
    and al, 0x1f
    mov ebx, dword [ebp]
    mov byte [esp + 0x29], al
    movsx eax, word [ebp + 0xe]
    movsx esi, word [esp + 0x28]
    push eax
    mov eax, dword [ebp + 8]
    mov edx, esi
    push eax
    movsx eax, word [esp + 0x2c]
    shl esi, 5
    call 0x56340
    movsx edx, word [esi + 0x1ecdac]
    shl edx, 5
    mov ebx, dword [esi + 0x1ecda8]
    mov eax, dword [edx + 0x1ecda8]
    sub eax, ebx
    mov ecx, dword [esi + 0x1ecda4]
    mov ebx, eax
    mov eax, dword [edx + 0x1ecda4]
    mov edx, ebx
    sub eax, ecx
    call 0x65698
    mov dx, word [ebp + 0x1c]
    add eax, eax
    mov bx, word [ebp + 0x20]
    sub eax, edx
    sar bx, 1
    and ah, 7
    mov word [ebp + 0x20], bx
    mov word [ebp + 0x1c], ax
loc_25d7:
    mov eax, dword [esp + 0x10]
    test eax, eax
    jl short loc_25f9
    mov edx, eax
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x80, 0x3c, 0x45, 0xa5, 0x52, 0x0b, 0x00, 0x00    ; cmp byte [eax*2 + 0xb52a5], 0
    je short loc_2607
loc_25f9:
    mov eax, dword [esp + 0x18]
    cmp dword [eax + 0xc], 1
    jne near loc_27bc
loc_2607:
    mov eax, dword [esp + 0x18]
    mov esi, dword [eax + 0x10]
    inc esi
    mov dword [eax + 0x10], esi
    cmp esi, 2
    jne near loc_2749
    movsx eax, word [ebp + 0x2a]
    mov dword [esp + 0x14], eax
    mov ax, word [ebp + 0xe]
    xor edx, edx
    cmp ax, 0x3ac
    jb short loc_2639
    jbe short loc_264f
    cmp ax, 0x672
    je short loc_2647
    jmp short loc_2655
loc_2639:
    db 0x66, 0x3d, 0x1a, 0x00    ; cmp ax, 0x1a
    jne short loc_2655
    mov edx, dword [0xe431c]
    jmp short loc_2655
loc_2647:
    mov edx, dword [0xe4328]
    jmp short loc_2655
loc_264f:
    mov edx, dword [0xe4304]
loc_2655:
    mov eax, dword [esp + 0x14]
    mov ebx, eax
    mov ecx, dword [esp + 0x14]
    sar ebx, 2
    push eax
    sub eax, ebx
    movsx esi, word [esp + 0x28]
    push eax
    sar ecx, 1
    mov eax, esi
    call 0x279e0
    mov edx, 0x762
    mov eax, esi
    call 0x19320
    cmp word [ebp + 0x24], 0
    jne short loc_2693
    mov edx, 0x8ab
    mov eax, esi
    call 0x19320
loc_2693:
    movsx edx, word [esp + 0x24]
    mov eax, 0xe
    call 0x5aca0
    xor edx, edx
    mov dword [esp + 0x14], edx
    jmp near loc_273e
loc_26ad:
    push 5
    movsx eax, word [esp + 0x28]
    push eax
    mov edx, 0xfffffe00
    call 0x7079f
    and eax, 0x7ff
    sub edx, eax
    push edx
    call 0x7079f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x7079f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x7079f
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [ebp + 8]
    push eax
    sub ecx, 0x800
    call 0x7079f
    and eax, 0x1fff
    sub ecx, eax
    call 0x7079f
    and eax, 0xff
    mov ebx, dword [ebp + 4]
    add ebx, eax
    call 0x7079f
    and eax, 0xff
    add eax, dword [ebp]
    lea edx, [eax - 0x80]
    sub ebx, 0x80
    movsx eax, word [ebp + 0x18]
    call 0x18f70
    inc dword [esp + 0x14]
loc_273e:
    cmp dword [esp + 0x14], 8
    jl near loc_26ad
loc_2749:
    cmp byte [ebp + 0x15], 0
    je short loc_275c
    mov byte [ebp + 0x15], 0
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_275c:
    mov eax, dword [esp + 0x18]
    cmp dword [eax + 0x10], 0x14
    jle near loc_29f9
    mov ecx, dword [esp + 0x24]
    cmp cx, word [ebp + 0x1e]
    jne short loc_277d
    cmp dword [0xe979f], 0
    jne short loc_2790
loc_277d:
    movsx eax, word [esp + 0x24]
    call 0x6ab35
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_2790:
    mov edx, dword [esp + 0x18]
    mov eax, dword [0x8d38]
    mov dword [edx + 8], eax
    mov edx, 0xc76
    movsx eax, cx
    call 0x19320
    mov word [ebp + 0xc], 0x8000
    mov byte [ebp + 0x15], 9
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_27bc:
    cmp word [ebp + 0xe], 0x1a
    jne near loc_29f9
    cmp dword [esp + 0x14], 0x314
    jge near loc_29f9
    cmp dword [eax], 7
    jle near loc_29f9
    cmp word [ebp + 0x20], 0
    jne near loc_29f9
    movsx edx, word [esp + 0x20]
    mov esi, edx
    shl esi, 7
    sub esi, edx
    lea esi, [esi*4]
    sub esi, edx
    add esi, esi
    movsx eax, word [esi + 0xb519e]
    mov edi, dword [esi + 0xb511c]
    push eax
    movsx ecx, word [ebp + 0x18]
    push edi
    mov eax, dword [esi + 0xb5118]
    mov ebx, dword [ebp + 8]
    push eax
    mov edx, dword [esi + 0xb5114]
    sub ebx, 0x800
    push edx
    mov eax, dword [ebp]
    mov edx, dword [ebp + 4]
    call 0x6ae4d
    test eax, eax
    je near loc_29f9
    mov ebx, dword [0xe7020]
    movsx eax, word [esi + 0xb51ba]
    cmp eax, ebx
    jge near loc_29f9
    cmp dword [0xe9347], 1
    jl near loc_28d6
    mov edi, dword [esp + 0x24]
    mov ax, word [ebp + 0x1e]
    cmp ax, di
    jne short loc_28d6
    xor eax, edi
    mov word [esp + 0x28], ax
    jmp short loc_288f
loc_2875:
    movsx edx, dx
    mov ax, word [eax + edx*2 + 0xb525c]
    cmp ax, word [ebp + 0xe]
    je near loc_304e
    inc word [esp + 0x28]
loc_288f:
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov edx, dword [esp + 0x28]
    mov si, word [eax + 0xb527c]
    cmp dx, si
    jl short loc_2875
    cmp si, 0xff
    jge short loc_28d6
    mov edx, esi
    inc edx
    mov word [eax + 0xb527c], dx
    movsx ebx, si
    mov dx, word [ebp + 0xe]
    mov word [eax + ebx*2 + 0xb525c], dx
loc_28d6:
    movsx edx, word [esp + 0x20]
    mov ecx, edx
    shl ecx, 7
    sub ecx, edx
    lea ecx, [ecx*4]
    mov ebx, 1
    sub ecx, edx
    mov edx, 0xb4f00
    add ecx, ecx
    mov eax, 0xa
    add edx, ecx
    call 0x275d0
    mov eax, 0xd2
    movsx edx, word [ecx + 0xb5240]
    call 0x5aca0
    cmp byte [ecx + 0xb52dd], 0
    je short loc_292a
    mov ax, word [ebp + 0x1e]
    cmp ax, word [ecx + 0xb5240]
    jne short loc_2950
loc_292a:
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov edx, 0xa
    add eax, 0xb4f00
    call 0x27620
loc_2950:
    movsx eax, word [ebp + 0x1e]
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 0x214
    je short loc_299b
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor cl, cl
    mov esi, 0x20
    db 0x88, 0x0c, 0x45, 0xf0, 0x52, 0x0b, 0x00    ; mov byte [eax*2 + 0xb52f0], cl
    db 0x89, 0x34, 0x45, 0x74, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb5174], esi
    db 0xc6, 0x04, 0x45, 0xf1, 0x52, 0x0b, 0x00, 0x20    ; mov byte [eax*2 + 0xb52f1], 0x20
    db 0x88, 0x0c, 0x45, 0xf2, 0x52, 0x0b, 0x00    ; mov byte [eax*2 + 0xb52f2], cl
loc_299b:
    mov edx, dword [esp + 0x24]
    cmp dx, word [ebp + 0x1e]
    jne short loc_29ae
    cmp dword [0xe979f], 0
    jne short loc_29d8
loc_29ae:
    mov ebx, dword [esp + 0x24]
    cmp bx, word [ebp + 0x1e]
    jne short loc_29c5
    cmp dword [0xe9347], 1
    jge near loc_304e
loc_29c5:
    movsx eax, word [esp + 0x24]
    call 0x6ab35
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_29d8:
    mov edx, dword [esp + 0x18]
    mov eax, dword [0x8d38]
    mov dword [edx + 8], eax
    movsx eax, word [esp + 0x24]
    mov edx, 0xc76
    call 0x19320
    mov word [ebp + 0xc], 0x8000
loc_29f9:
    mov eax, dword [esp + 0x18]
    mov edi, dword [eax]
    cmp edi, 8
    jge near loc_304e
    lea ebp, [edi + 1]
    mov dword [eax], ebp
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_2a16:
    mov eax, dword [esp + 0x18]
    cmp dword [eax + 0x10], 1
    jne near loc_2adb
    mov edi, 0x243
    movsx eax, si
    mov ecx, 0x448
    db 0x66, 0x8b, 0x04, 0x45, 0xc4, 0x5c, 0x24, 0x00    ; mov ax, word [eax*2 + 0x245cc4]
    mov esi, 0xffff8000
loc_2a3e:
    mov word [esp + 0x28], ax
    mov ebx, dword [esp + 0x28]
    test bx, bx
    jl near loc_304e
    movsx edx, bx
    imul edx, edx, 0x2c
    mov ax, word [edx + 0x1c0bb2]
    cmp ax, 0x244
    jb short loc_2a79
    jbe short loc_2aba
    cmp ax, 0x440
    jb near loc_2ac9
    jbe short loc_2aa8
    cmp ax, 0x444
    je short loc_2aba
    jmp short loc_2ac9
loc_2a79:
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jb short loc_2ac9
    jbe short loc_2a89
    cmp ax, 0x242
    je short loc_2ab1
    jmp short loc_2ac9
loc_2a89:
    cmp word [edx + 0x1c0bca], 1
    jne short loc_2ac9
    mov ebx, 0xffffffff
    mov word [edx + 0x1c0bca], bx
    mov word [edx + 0x1c0bcc], bx
    jmp short loc_2ac9
loc_2aa8:
    mov word [edx + 0x1c0bb2], cx
    jmp short loc_2ac9
loc_2ab1:
    mov word [edx + 0x1c0bb2], di
    jmp short loc_2ac9
loc_2aba:
    movsx eax, word [esp + 0x28]
    imul eax, eax, 0x2c
    mov word [eax + 0x1c0bb0], si
loc_2ac9:
    movsx eax, word [esp + 0x28]
    db 0x66, 0x8b, 0x04, 0x45, 0xa4, 0xc8, 0x1b, 0x00    ; mov ax, word [eax*2 + 0x1bc8a4]
    jmp near loc_2a3e
loc_2adb:
    cmp dword [eax + 4], 0x14
    jl short loc_2af1
    mov dword [eax + 0x10], 1
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_2af1:
    lea edx, [esp + 0x14]
    mov eax, ebp
    call 0x53700
    mov dword [esp + 0x20], eax
    mov eax, dword [esp + 0x18]
    mov ecx, dword [eax + 8]
    inc ecx
    mov dword [eax + 8], ecx
    cmp ecx, 4
    jne short loc_2b17
    mov dword [eax + 8], 0
loc_2b17:
    cmp dword [esp + 0x14], 0x1000
    jge near loc_2be9
    call 0x7079f
    and eax, 0xff
    cmp eax, 0x10
    jge near loc_2bcb
    cmp dword [0xe8090], 1
    jge short loc_2b68
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5240]
    mov eax, 0xd3
    call 0x5aca0
loc_2b68:
    movsx edx, word [esp + 0x24]
    mov eax, 0x15
    call 0x5aca0
    movsx edx, word [esp + 0x20]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x0f, 0xbf, 0x14, 0x45, 0x40, 0x52, 0x0b, 0x00    ; movsx edx, word [eax*2 + 0xb5240]
    imul edx, edx, 0x2c
    mov ebx, 0x20
    mov ch, 0x20
    db 0x89, 0x1c, 0x45, 0x74, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb5174], ebx
    db 0x88, 0x2c, 0x45, 0xf0, 0x52, 0x0b, 0x00    ; mov byte [eax*2 + 0xb52f0], ch
    xor bl, bl
    mov di, word [edx + 0x1c0bce]
    db 0x88, 0x1c, 0x45, 0xf1, 0x52, 0x0b, 0x00    ; mov byte [eax*2 + 0xb52f1], bl
    dec edi
    db 0x88, 0x1c, 0x45, 0xf2, 0x52, 0x0b, 0x00    ; mov byte [eax*2 + 0xb52f2], bl
    mov word [edx + 0x1c0bce], di
loc_2bcb:
    mov eax, dword [esp + 0x18]
    mov ecx, dword [eax]
    add ecx, 0x80
    mov edi, dword [eax + 0xc]
    mov dword [eax], ecx
    test edi, edi
    jne short loc_2bf4
    mov dword [eax + 0xc], 1
    jmp short loc_2bf4
loc_2be9:
    mov eax, dword [esp + 0x18]
    mov dword [eax + 0xc], 0
loc_2bf4:
    mov eax, dword [esp + 0x18]
    mov edx, dword [eax + 4]
    test edx, edx
    je near loc_2dd9
    lea ecx, [edx + 1]
    mov dword [eax + 4], ecx
    mov edx, dword [esp + 0x18]
    mov eax, dword [ebp + 8]
    mov dword [edx + 0x10], eax
    movsx edx, si
    lea ebx, [edx*4]
    add ebx, edx
    lea ebx, [ebx*8]
    mov ecx, dword [ebx + 0x2385ac]
    mov edi, dword [ebx + 0x2385a8]
    call 0x7079f
    mov edx, eax
    sub ecx, edi
    sar edx, 0x1f
    idiv ecx
    mov eax, dword [ebx + 0x2385ac]
    sub eax, edx
    mov dword [ebp + 8], eax
    mov eax, dword [esp + 0x18]
    mov eax, dword [eax + 4]
    sub eax, 3
    cmp eax, 0xc
    ja near loc_2d14
    jmp dword cs:[eax*4 + 0x1dbd0]
    mov ebx, dword [0xe703c]
    lea ebx, [ebx*4]
    push ebx
    movsx eax, word [esp + 0x28]
    push ebx
    mov edx, 0x1000
    mov ecx, ebx
    call 0x279e0
    mov ax, word [0x2454ce]
loc_2c8c:
    mov word [esp + 0x28], ax
    mov ebx, dword [esp + 0x28]
    test bx, bx
    jl near loc_2d14
    movsx eax, bx
    imul eax, eax, 0x2c
    cmp word [eax + 0x1c0bb2], 8
    jne short loc_2cce
    mov dx, word [eax + 0x1c0bcc]
    cmp dx, word [ebp + 0x28]
    jne short loc_2cce
    cmp word [eax + 0x1c0bc6], 0
    jne short loc_2cce
    mov word [eax + 0x1c0bc6], 1
loc_2cce:
    movsx eax, word [esp + 0x28]
    db 0x66, 0x8b, 0x04, 0x45, 0xa4, 0xf7, 0x1a, 0x00    ; mov ax, word [eax*2 + 0x1af7a4]
    jmp short loc_2c8c
    movsx eax, si
    db 0x66, 0x8b, 0x04, 0x45, 0xc4, 0x5c, 0x24, 0x00    ; mov ax, word [eax*2 + 0x245cc4]
    mov edx, dword [esp + 0x24]
loc_2cec:
    mov word [esp + 0x28], ax
    mov eax, dword [esp + 0x28]
    test ax, ax
    jl short loc_2d14
    cwde
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0xc8, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1bc8a4]
    mov dword [esp + 0x10], eax
    cmp dx, word [esp + 0x28]
    jne short loc_2d14
    mov eax, dword [esp + 0x10]
    jmp short loc_2cec
loc_2d14:
    xor edi, edi
    mov dword [esp + 0x14], edi
    jmp near loc_2db0
loc_2d1f:
    push 5
    movsx eax, word [esp + 0x28]
    push eax
    mov edx, 0xfffffe00
    call 0x7079f
    and eax, 0x7ff
    sub edx, eax
    push edx
    call 0x7079f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x7079f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x7079f
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [ebp + 8]
    push eax
    sub ecx, 0x800
    call 0x7079f
    and eax, 0x1fff
    sub ecx, eax
    call 0x7079f
    and eax, 0xff
    mov ebx, dword [ebp + 4]
    add ebx, eax
    call 0x7079f
    and eax, 0xff
    add eax, dword [ebp]
    lea edx, [eax - 0x80]
    sub ebx, 0x80
    movsx eax, word [ebp + 0x18]
    call 0x18f70
    inc dword [esp + 0x14]
loc_2db0:
    cmp dword [esp + 0x14], 0x10
    jl near loc_2d1f
    mov eax, dword [esp + 0x18]
    mov eax, dword [eax + 0x10]
    mov dword [ebp + 8], eax
    mov eax, dword [esp + 0x18]
    mov dword [eax + 0x10], 0
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_2dd9:
    movsx eax, word [esp + 0x24]
    call 0x29210
    test ax, ax
    jl near loc_304e
    mov dword [esp + 0x14], edx
    jmp near loc_2e8b
loc_2df5:
    push 5
    movsx eax, word [esp + 0x28]
    push eax
    mov edx, 0xfffffe00
    call 0x7079f
    and eax, 0x7ff
    sub edx, eax
    push edx
    call 0x7079f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x7079f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x7079f
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [ebp + 8]
    push eax
    sub ecx, 0x800
    call 0x7079f
    and eax, 0x1fff
    sub ecx, eax
    call 0x7079f
    and eax, 0xff
    mov ebx, dword [ebp + 4]
    add ebx, eax
    call 0x7079f
    and eax, 0xff
    mov edx, dword [ebp]
    add edx, eax
    sub ebx, 0x80
    sub edx, 0x80
    movsx eax, word [ebp + 0x18]
    call 0x18f70
    inc dword [esp + 0x14]
loc_2e8b:
    cmp dword [esp + 0x14], 0x20
    jl near loc_2df5
    cmp word [ebp + 0x2a], 0
    jge near loc_304e
    mov eax, dword [esp + 0x18]
    mov dword [eax + 4], 1
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_2eb5:
    mov eax, dword [esp + 0x18]
    mov esi, dword [eax]
    test esi, esi
    jne near loc_304e
    add dword [eax + 4], 8
    cmp byte [0xe982c], 0
    je near loc_2fb0
    movsx eax, word [esp + 0x24]
    call 0x29210
    mov word [esp + 0x28], ax
    test ax, ax
    jl near loc_2fb0
    mov eax, dword [esp + 0x18]
    mov dword [eax], 1
    mov word [ebp + 0xc], 0x8000
    mov dword [esp + 0x14], esi
    cmp dword [esp + 0x14], 5
    jl short loc_2f10
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_2f10:
    push 5
    movsx eax, word [esp + 0x28]
    push eax
    mov edx, 0xfffffe00
    call 0x7079f
    and eax, 0x7ff
    sub edx, eax
    push edx
    call 0x7079f
    xor ah, ah
    and al, 0x3f
    db 0x05, 0x40, 0x00, 0x00, 0x00    ; add eax, 0x40
    cwde
    push eax
    call 0x7079f
    and ah, 7
    cwde
    push eax
    push 0x30
    push 0x30
    push -8
    call 0x7079f
    xor ah, ah
    and al, 0xf
    add eax, 0x956
    cwde
    mov ecx, dword [ebp + 8]
    push eax
    sub ecx, 0x800
    call 0x7079f
    and eax, 0x1fff
    sub ecx, eax
    call 0x7079f
    and eax, 0xff
    add eax, dword [ebp + 4]
    lea ebx, [eax - 0x80]
    call 0x7079f
    and eax, 0xff
    add eax, dword [ebp]
    lea edx, [eax - 0x80]
    movsx eax, word [ebp + 0x18]
    call 0x18f70
    inc dword [esp + 0x14]
    cmp dword [esp + 0x14], 5
    jl near loc_2f10
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_2fb0:
    mov di, word [ebp + 0x28]
    test di, di
    jle near loc_304e
    mov eax, dword [esp + 0x18]
    movsx edx, di
    cmp edx, dword [eax + 4]
    jle short loc_2fd7
    add word [ebp + 0x1c], 8
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_2fd7:
    mov ebx, dword [esp + 0x18]
    lea eax, [edx*4]
    mov ecx, dword [ebx + 4]
    sub eax, edx
    cmp eax, ecx
    jle short loc_2ff9
    sub word [ebp + 0x1c], 8
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_2ff9:
    lea edx, [edx*4]
    cmp edx, ecx
    jle short loc_3012
    add word [ebp + 0x1c], 8
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_3012:
    mov dword [ebx + 4], 8
    add word [ebp + 0x1c], 0x10
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
loc_3027:
    cmp dh, 2
    jne short loc_3032
    mov word [ebp + 0xc], 0x101
loc_3032:
    lea edx, [esp + 0x14]
    mov eax, ebp
    call 0x53700
    mov ebx, dword [esp + 0x14]
    movsx edx, ax
    movsx eax, word [esp + 0x24]
    call 0x3e970
loc_304e:
    mov eax, dword [esp + 0x2c]
    jmp near loc_001b
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
%endif
