; Sprite tile classification and positioning.
bits 32
org START_ADDRESS

    push edx
    mov edx, eax
    mov ax, word [eax + 0xe]
    cmp ax, 0x758
    jb near loc_010f
    jbe near loc_01ad
    cmp ax, 0x875
    jb short loc_0087
    jbe near loc_01ad
    cmp ax, 0xa46
    jb short loc_0059
    jbe near loc_01ad
    cmp ax, 0xac8
    jb short loc_004a
    jbe near loc_01ad
    cmp ax, 0x1284
    je near loc_01ad
    jmp near loc_00f6
loc_004a:
    cmp ax, 0xa96
    je near loc_01ad
    jmp near loc_00f6
loc_0059:
    cmp ax, 0x942
    jb short loc_0078
    cmp ax, 0x949
    jbe near loc_01ad
    cmp ax, 0x974
    je near loc_01ad
    jmp near loc_00f6
loc_0078:
    cmp ax, 0x938
    je near loc_01ad
    jmp near loc_00f6
loc_0087:
    cmp ax, 0x7fd
    jb short loc_00bd
    jbe near loc_01ad
    cmp ax, 0x866
    jb short loc_00ae
    jbe near loc_01ad
    cmp ax, 0x870
    je near loc_01ad
    jmp near loc_00f6
loc_00ae:
    cmp ax, 0x848
    je near loc_01ad
    jmp near loc_00f6
loc_00bd:
    cmp ax, 0x7a8
    jb short loc_00e2
    jbe near loc_01ad
    cmp ax, 0x7d0
    jb near loc_00f6
    cmp ax, 0x7d1
    jbe near loc_01ad
    jmp near loc_00f6
loc_00e2:
    cmp ax, 0x780
    jb near loc_00f6
    cmp ax, 0x781
    jbe near loc_01ad
loc_00f6:
    movsx edx, word [edx + 0xe]
    mov ah, byte [edx + LINK_ADDRESS_1]
    test ah, ah
    je near loc_01b4
    mov eax, 1
    pop edx
    ret
loc_010f:
    cmp ax, 0x4f3
    jb near loc_0171
    jbe near loc_01ad
    cmp ax, 0x6bd
    jb short loc_0155
    jbe near loc_01ad
    cmp ax, 0x6d0
    jb short loc_0143
    jbe near loc_01ad
    cmp ax, 0x71c
    je near loc_01ad
    jmp short loc_00f6
loc_0143:
    cmp ax, 0x6cd
    jb short loc_00f6
    cmp ax, 0x6ce
    jbe near loc_01ad
    jmp short loc_00f6
loc_0155:
    cmp ax, 0x690
    jb short loc_0169
    cmp ax, 0x692
    jbe short loc_01ad
    cmp ax, 0x6b3
    je short loc_01ad
    jmp short loc_00f6
loc_0169:
    cmp ax, 0x60e
    je short loc_01ad
    jmp short loc_00f6
loc_0171:
    cmp ax, 0x2a3
    jb short loc_0197
    jbe short loc_01ad
    cmp ax, 0x33a
    jb short loc_018c
    jbe short loc_01ad
    cmp ax, 0x33c
    je short loc_01ad
    jmp near loc_00f6
loc_018c:
    cmp ax, 0x300
    je short loc_01ad
    jmp near loc_00f6
loc_0197:
    cmp ax, 0x23a
    jb near loc_00f6
    jbe short loc_01ad
    cmp ax, 0x23c
    jne near loc_00f6
loc_01ad:
    mov eax, 1
    pop edx
    ret
loc_01b4:
    xor al, al
    pop edx
    ret
    lea eax, [dword eax + 0]
    db 0x8b, 0xd2    ; mov edx, edx
    push edx
    mov edx, eax
    cmp ax, 0x780
    jb near loc_02b6
    cmp ax, 0x781
    jbe near loc_0358
    cmp ax, 0x875
    jb short loc_0247
    jbe near loc_0358
    cmp ax, 0xa46
    jb short loc_0219
    jbe near loc_0358
    cmp ax, 0xac8
    jb short loc_020a
    jbe near loc_0358
    cmp ax, 0x1284
    je near loc_0358
    jmp near loc_02a1
loc_020a:
    cmp ax, 0xa96
    je near loc_0358
    jmp near loc_02a1
loc_0219:
    cmp ax, 0x942
    jb short loc_0238
    cmp ax, 0x949
    jbe near loc_0358
    cmp ax, 0x974
    je near loc_0358
    jmp near loc_02a1
loc_0238:
    cmp ax, 0x938
    je near loc_0358
    jmp near loc_02a1
loc_0247:
    cmp ax, 0x7fd
    jb short loc_027d
    jbe near loc_0358
    cmp ax, 0x866
    jb short loc_026e
    jbe near loc_0358
    cmp ax, 0x870
    je near loc_0358
    jmp near loc_02a1
loc_026e:
    cmp ax, 0x848
    je near loc_0358
    jmp near loc_02a1
loc_027d:
    cmp ax, 0x7a8
    jb near loc_02a1
    jbe near loc_0358
    cmp ax, 0x7d0
    jb near loc_02a1
    cmp ax, 0x7d1
    jbe near loc_0358
loc_02a1:
    cwde
    cmp byte [eax + LINK_ADDRESS_1], 0
    je near loc_035f
    mov eax, 1
    pop edx
    ret
loc_02b6:
    cmp ax, 0x60e
    jb near loc_031c
    jbe near loc_0358
    cmp ax, 0x6cd
    jb short loc_02fa
    cmp ax, 0x6ce
    jbe near loc_0358
    cmp ax, 0x71c
    jb short loc_02ee
    jbe near loc_0358
    cmp ax, 0x758
    je near loc_0358
    jmp short loc_02a1
loc_02ee:
    cmp ax, 0x6d0
    je near loc_0358
    jmp short loc_02a1
loc_02fa:
    cmp ax, 0x6b3
    jb short loc_030e
    jbe near loc_0358
    cmp ax, 0x6bd
    je short loc_0358
    jmp short loc_02a1
loc_030e:
    cmp ax, 0x690
    jb short loc_02a1
    cmp ax, 0x692
    jbe short loc_0358
    jmp short loc_02a1
loc_031c:
    cmp ax, 0x2a3
    jb short loc_0342
    jbe short loc_0358
    cmp ax, 0x33c
    jb short loc_0337
    jbe short loc_0358
    cmp ax, 0x4f3
    je short loc_0358
    jmp near loc_02a1
loc_0337:
    cmp ax, 0x33a
    je short loc_0358
    jmp near loc_02a1
loc_0342:
    cmp ax, 0x23a
    jb near loc_02a1
    jbe short loc_0358
    cmp ax, 0x23c
    jne near loc_02a1
loc_0358:
    mov eax, 1
    pop edx
    ret
loc_035f:
    xor eax, eax
    pop edx
    ret
    lea eax, [dword eax + 0]
    lea edx, [dword edx + 0]
    nop
    push esi
    push edi
    push ebp
    sub esp, 4
    mov edi, eax
    mov esi, edx
    mov byte [esp], cl
    test byte [esp + 0x14], 4
    je short loc_038b
    mov ecx, 0x400
    jmp short loc_038d
loc_038b:
    xor ecx, ecx
loc_038d:
    movsx edx, word [LINK_ADDRESS_2]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [nosplit eax*2 + LINK_ADDRESS_3]
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [WINDOWY2]
    mov al, byte [eax*8 + LINK_ADDRESS_5]
    push edx
    mov ebp, dword [WINDOWX2]
    mov ah, byte [esp + 0x18]
    push ebp
    mov edx, dword [WINDOWY1]
    or ah, 2
    push edx
    mov ebp, dword [WINDOWX1]
    xor edx, edx
    push ebp
    mov dl, ah
    push edx
    and eax, 0xff
    movsx ecx, cx
    push eax
    movsx eax, byte [esp + 0x18]
    mov edx, esi
    push eax
    movsx eax, bx
    shl edx, 0x10
    push eax
    mov eax, edi
    mov ebx, 0x10000
    shl eax, 0x10
    call LINK_ADDRESS_9
    add esp, 4
    pop ebp
    pop edi
    pop esi
    ret 4
    lea eax, [dword eax + 0]
    lea edx, [dword edx + 0]
