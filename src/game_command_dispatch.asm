; Parse and dispatch game commands.
bits 32
org START_ADDRESS

    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov dword [esp], eax
    mov edi, edx
    mov ecx, 1
    mov edx, 1
    xor ah, ah
    xor ebx, ebx
    mov dword [LINK_ADDRESS_1], edx
    mov byte [LINK_ADDRESS_2], ah
    mov dword [LINK_ADDRESS_3], ebx
    mov dword [LINK_ADDRESS_4], ebx
    mov dword [LINK_ADDRESS_5], ebx
    mov eax, 2
    xor dl, dl
    mov ebx, dword [esp]
    mov byte [LINK_ADDRESS_6], dl
    mov dword [LINK_ADDRESS_7], eax
    xor dh, dh
    mov dword [LINK_ADDRESS_8], eax
    mov byte [LINK_ADDRESS_9], dh
    cmp ebx, 1
    jle near loc_0566
loc_0070:
    mov esi, dword [esp]
    movsx ebx, cx
    cmp ebx, esi
    jge near loc_0566
    mov ebx, dword [edi + ebx*4]
    mov al, byte [ebx]
    cmp al, 0x2d
    jne short loc_0097
    cmp byte [ebx + 1], 0x38
    jne short loc_0094
    mov byte [LINK_ADDRESS_10], 1
loc_0094:
    inc ecx
    jmp short loc_0070
loc_0097:
    cmp al, 0x3f
    jne short loc_00ac
    mov eax, edi
    call LINK_ADDRESS_11
    mov eax, 0xffffffff
    call EXIT
loc_00ac:
    cmp byte [ebx], 0x2f
    jne near loc_069a
    mov al, byte [ebx + 1]
    sub al, 0x31
    inc ebx
    cmp al, 0x49
    ja short loc_00cc
    and eax, 0xff
    jmp dword cs:[eax*4 + LINK_ADDRESS_13]
loc_00cc:
    mov eax, edi
    call LINK_ADDRESS_11
    xor eax, eax
    call EXIT
    mov dl, byte [ebx + 1]
    inc ebx
    test dl, dl
    je near loc_069a
    mov eax, LINK_ADDRESS_14
    mov edx, ebx
    call STRCPY
    mov eax, ebx
    call SAFEFILEEXISTS
    test eax, eax
    jne short loc_011e
    push LINK_ADDRESS_14
    push LINK_ADDRESS_17
    call PRINTF
    add esp, 8
    mov eax, 0xffffffff
    call EXIT
    jmp near loc_069a
loc_011e:
    push LINK_ADDRESS_14
    push LINK_ADDRESS_19
    call PRINTF
    add esp, 8
    inc ecx
    jmp near loc_0070
    mov al, byte [ebx + 1]
    inc ebx
    test al, al
    je near loc_069a
    mov edx, 0x2e
    mov eax, ebx
    call LINK_ADDRESS_20
    test eax, eax
    jne short loc_015e
    mov edx, LINK_ADDRESS_21
    mov eax, ebx
    call STRCAT
loc_015e:
    mov eax, ebx
    call LINK_ADDRESS_23
    cwde
    cmp eax, -1
    jne short loc_017f
    push ebx
    push LINK_ADDRESS_24
    call PRINTF
    add esp, 8
    inc ecx
    jmp near loc_0070
loc_017f:
    push ebx
    push LINK_ADDRESS_25
    mov dword [LINK_ADDRESS_26], eax
    call PRINTF
    add esp, 8
    inc ecx
    jmp near loc_0070
    mov ebx, 1
    mov eax, LINK_ADDRESS_27
    mov dword [LINK_ADDRESS_28], ebx
    call LINK_ADDRESS_29
    inc ecx
    jmp near loc_0070
    mov ah, byte [ebx + 1]
    inc ebx
    cmp ah, 0x73
    je short loc_01c1
    cmp ah, 0x53
    jne short loc_01dc
loc_01c1:
    mov ebx, 2
    mov eax, LINK_ADDRESS_30
    mov dword [LINK_ADDRESS_31], ebx
    call LINK_ADDRESS_29
    inc ecx
    jmp near loc_0070
loc_01dc:
    cmp ah, 0x6d
    je short loc_01e6
    cmp ah, 0x4d
    jne short loc_0201
loc_01e6:
    mov edx, 1
    mov eax, LINK_ADDRESS_32
    mov dword [LINK_ADDRESS_33], edx
    call LINK_ADDRESS_29
    inc ecx
    jmp near loc_0070
loc_0201:
    mov eax, edi
    call LINK_ADDRESS_11
    mov eax, 0xffffffff
    call EXIT
    inc ecx
    jmp near loc_0070
    mov ah, byte [ebx + 1]
    inc ebx
    cmp ah, 0x30
    jne short loc_0229
    xor dl, dl
    mov byte [LINK_ADDRESS_34], dl
loc_0229:
    cmp byte [ebx], 0x31
    jne short loc_0235
    mov byte [LINK_ADDRESS_34], 1
loc_0235:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_34]
    push eax
    push LINK_ADDRESS_35
    call PRINTF
    add esp, 8
    inc ecx
    jmp near loc_0070
    mov dh, byte [ebx + 1]
    inc ebx
    cmp dh, 0x31
    je short loc_0263
    cmp dh, 0x32
    je short loc_0263
    cmp dh, 0x33
    jne short loc_0271
loc_0263:
    xor eax, eax
    mov al, byte [ebx]
    sub eax, 0x31
    mov dword [LINK_ADDRESS_36], eax
    jmp short loc_0279
loc_0271:
    xor edx, edx
    mov dword [LINK_ADDRESS_36], edx
loc_0279:
    mov eax, dword [LINK_ADDRESS_36]
    cmp eax, 1
    jb short loc_0290
    jbe short loc_02a8
    cmp eax, 2
    je short loc_02b8
    inc ecx
    jmp near loc_0070
loc_0290:
    test eax, eax
    jne near loc_069a
    mov eax, LINK_ADDRESS_37
    call LINK_ADDRESS_29
    inc ecx
    jmp near loc_0070
loc_02a8:
    mov eax, LINK_ADDRESS_38
    call LINK_ADDRESS_29
    inc ecx
    jmp near loc_0070
loc_02b8:
    mov eax, LINK_ADDRESS_39
    call LINK_ADDRESS_29
    inc ecx
    jmp near loc_0070
    mov byte [LINK_ADDRESS_40], 1
    inc ecx
    jmp near loc_0070
    mov ah, byte [ebx + 1]
    inc ebx
    cmp ah, 0x31
    jne short loc_02e5
    mov byte [LINK_ADDRESS_41], 1
loc_02e5:
    cmp byte [ebx], 0x32
    jne short loc_02f1
    mov byte [LINK_ADDRESS_41], 2
loc_02f1:
    cmp byte [ebx], 0x34
    jne near loc_069a
    mov byte [LINK_ADDRESS_41], 4
    mov edx, 0x3fffffff
    mov eax, edx
    call LINK_ADDRESS_42
    inc ecx
    jmp near loc_0070
    mov ah, byte [ebx + 1]
    inc ebx
    cmp ah, 0x31
    jne short loc_0328
    mov dword [LINK_ADDRESS_4], 1
    jmp short loc_037a
loc_0328:
    cmp ah, 0x32
    jne short loc_0347
    mov dword [LINK_ADDRESS_3], 1
    mov eax, LINK_ADDRESS_43
    call LINK_ADDRESS_29
    inc ecx
    jmp near loc_0070
loc_0347:
    cmp ah, 0x33
    jne short loc_0366
    mov dword [LINK_ADDRESS_5], 1
    mov eax, LINK_ADDRESS_43
    call LINK_ADDRESS_29
    inc ecx
    jmp near loc_0070
loc_0366:
    mov eax, 1
    mov dword [LINK_ADDRESS_4], eax
    mov dword [LINK_ADDRESS_3], eax
    mov dword [LINK_ADDRESS_5], eax
loc_037a:
    mov eax, LINK_ADDRESS_43
    call LINK_ADDRESS_29
    inc ecx
    jmp near loc_0070
    mov ah, byte [ebx + 1]
    cmp ah, 0x61
    je near loc_069a
    cmp ah, 0x41
    je near loc_069a
    mov esi, 1
    mov eax, LINK_ADDRESS_44
    xor ebp, ebp
    mov dword [LINK_ADDRESS_45], esi
    mov dword [LINK_ADDRESS_7], ebp
    mov dword [LINK_ADDRESS_8], ebp
    call LINK_ADDRESS_29
    inc ecx
    jmp near loc_0070
    mov dword [LINK_ADDRESS_46], 1
    inc ecx
    jmp near loc_0070
    mov eax, LINK_ADDRESS_47
    call LINK_ADDRESS_29
    mov al, byte [ebx + 1]
    inc ebx
    test al, al
    jne short loc_03f6
    mov dword [LINK_ADDRESS_48], 1
    jmp short loc_040f
loc_03f6:
    mov eax, ebx
    call ATOL
    mov edx, eax
    mov ebx, 0x11
    sar edx, 0x1f
    idiv ebx
    mov dword [LINK_ADDRESS_48], edx
loc_040f:
    xor edx, edx
    mov esi, 1
    mov dword [LINK_ADDRESS_50], edx
    mov dword [LINK_ADDRESS_36], edx
    mov dword [LINK_ADDRESS_51], esi
    mov dword [LINK_ADDRESS_52], esi
    mov dword [LINK_ADDRESS_53], esi
    mov dword [LINK_ADDRESS_4], esi
    mov dword [LINK_ADDRESS_54], esi
    mov dword [LINK_ADDRESS_3], esi
    mov dword [LINK_ADDRESS_55], esi
    mov dword [LINK_ADDRESS_5], esi
    inc ecx
    jmp near loc_0070
    mov ebp, 1
    mov eax, LINK_ADDRESS_56
    mov dword [LINK_ADDRESS_57], ebp
    call LINK_ADDRESS_29
    inc ecx
    jmp near loc_0070
    inc ebx
    mov edx, 0x2e
    mov eax, ebx
    call LINK_ADDRESS_20
    test eax, eax
    jne short loc_0490
    mov edx, LINK_ADDRESS_58
    mov eax, ebx
    call STRCAT
loc_0490:
    push ebx
    push LINK_ADDRESS_59
    call PRINTF
    add esp, 8
    mov edx, ebx
    mov eax, LINK_ADDRESS_60
    call STRCPY
    inc ecx
    jmp near loc_0070
    mov dh, 1
    lea eax, [ebx + 1]
    mov byte [LINK_ADDRESS_6], dh
    call ATOL
    lea edx, [eax - 1]
    mov ebx, 0xb
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov dword [LINK_ADDRESS_61], edx
    mov dword [LINK_ADDRESS_62], edx
    inc ecx
    jmp near loc_0070
    push LINK_ADDRESS_63
    call PRINTF
    add esp, 4
    xor eax, eax
    call EXIT
    mov byte [LINK_ADDRESS_6], 1
    lea eax, [ebx + 1]
    call ATOL
    dec eax
    mov dword [LINK_ADDRESS_64], eax
    mov dword [LINK_ADDRESS_65], eax
    inc ecx
    jmp near loc_0070
    lea eax, [ebx + 1]
    call ATOL
    mov edx, eax
    mov ebx, 5
    sar edx, 0x1f
    idiv ebx
    mov dword [LINK_ADDRESS_7], edx
    mov dword [LINK_ADDRESS_8], edx
    cmp edx, 4
    jne near loc_069a
    mov ebx, 1
    mov dword [LINK_ADDRESS_53], ebx
    mov dword [LINK_ADDRESS_4], ebx
    inc ecx
    jmp near loc_0070
    xor eax, eax
    mov dword [LINK_ADDRESS_66], eax
    mov eax, LINK_ADDRESS_67
    call LINK_ADDRESS_29
loc_0566:
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    mov dword [LINK_ADDRESS_66], 1
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    mov dword [LINK_ADDRESS_66], 2
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    mov dword [LINK_ADDRESS_66], 3
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    mov dword [LINK_ADDRESS_66], 4
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    mov al, byte [ebx]
    sub al, 0x2e
    mov byte [LINK_ADDRESS_6], al
    inc ecx
    jmp near loc_0070
    mov al, byte [ebx + 1]
    inc ebx
    xor edx, edx
    test al, al
    je short loc_0627
    mov eax, LINK_ADDRESS_68
    call LINK_ADDRESS_29
loc_05de:
    mov al, byte [ebx]
    test al, al
    je short loc_05f8
    movzx esi, al
    inc ebx
    movsx eax, dx
    sub esi, 0x30
    inc edx
    mov dword [eax*4 + LINK_ADDRESS_69], esi
    jmp short loc_05de
loc_05f8:
    mov ebp, 1
    mov esi, 2
loc_0602:
    cmp dx, 0xa
    jge near loc_069a
    cmp dx, 9
    jne short loc_061a
    mov dword [LINK_ADDRESS_70], ebp
    jmp short loc_0624
loc_061a:
    movsx ebx, dx
    mov dword [ebx*4 + LINK_ADDRESS_69], esi
loc_0624:
    inc edx
    jmp short loc_0602
loc_0627:
    mov eax, LINK_ADDRESS_71
    mov edx, 4
    mov ebx, 5
    mov esi, 7
    mov ebp, 8
    call LINK_ADDRESS_29
    mov eax, 3
    mov dword [LINK_ADDRESS_72], edx
    mov dword [LINK_ADDRESS_73], ebx
    mov dword [LINK_ADDRESS_74], esi
    mov dword [LINK_ADDRESS_75], ebp
    mov ebx, 2
    mov esi, 9
    mov ebp, 1
    mov dword [LINK_ADDRESS_69], eax
    xor edx, edx
    mov eax, 6
    mov dword [LINK_ADDRESS_76], edx
    mov dword [LINK_ADDRESS_77], ebx
    mov dword [LINK_ADDRESS_78], esi
    mov dword [LINK_ADDRESS_70], ebp
    mov dword [LINK_ADDRESS_79], eax
loc_069a:
    inc ecx
    jmp near loc_0070
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push esi
    push edi
    sub esp, 4
    mov esi, ebx
    mov byte [esp], cl
    imul edx, edx, 0x50
    add edx, eax
    xor ebx, ebx
    add edx, edx
loc_06bf:
    movsx eax, bx
    add eax, esi
    mov cl, byte [eax]
    test cl, cl
    je short loc_06f1
    movzx edi, byte [esp]
    mov al, cl
    shl edi, 8
    and eax, 0xff
    add eax, edi
    movsx edi, dx
    mov ecx, 1
    add edi, 0xb8000
    inc ebx
    db 0xf3, 0x66, 0xab    ; rep stosw word es:[edi], ax
    add edx, 2
    jmp short loc_06bf
loc_06f1:
    add esp, 4
    pop edi
    pop esi
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
    push ebx
    push ecx
    push edx
    xor ah, ah
    xor edx, edx
    mov byte [LINK_ADDRESS_80], ah
    call LINK_ADDRESS_81
    mov ecx, dword [YDIM]
    mov ebx, dword [XDIM]
    xor eax, eax
    dec ecx
    dec ebx
    call SETVIEW
    xor eax, eax
    mov ecx, 0x3f
    call LINK_ADDRESS_85
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_86
    call LINK_ADDRESS_87
    call LINK_ADDRESS_88
    call LINK_ADDRESS_89
    cmp dword [LINK_ADDRESS_48], 1
    jle short loc_0757
    call LINK_ADDRESS_88
loc_0757:
    call LINK_ADDRESS_90
    call LINK_ADDRESS_87
    xor eax, eax
    call LINK_ADDRESS_85
    call LINK_ADDRESS_88
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, PALETTE
    xor ecx, ecx
    mov dword [nosplit eax*2 + LINK_ADDRESS_93], ebx
    mov eax, 0xd5
    xor edx, edx
    call LINK_ADDRESS_94
    xor ebx, ebx
    xor eax, eax
    call LINK_ADDRESS_86
    xor eax, eax
    call LINK_ADDRESS_85
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
loc_07bc:
    push ebx
    push ecx
    push edx
    sub esp, 0x1f40
    mov eax, LINK_ADDRESS_95
    xor edx, edx
    call KOPEN4LOAD
    mov ecx, eax
    cmp eax, -1
    je short loc_07f6
    call KFILELENGTH
    mov edx, esp
    mov ebx, eax
    mov eax, ecx
    call KREAD
    mov eax, esp
    call LINK_ADDRESS_99
    mov eax, ecx
    call KCLOSE
loc_07f6:
    add esp, 0x1f40
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    call LINK_ADDRESS_101
    call LINK_ADDRESS_102
    call LINK_ADDRESS_103
    call 0x10210
    call LINK_ADDRESS_104
    call LINK_ADDRESS_105
    call LINK_ADDRESS_106
    jmp near LINK_ADDRESS_107
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
loc_083c:
    push ebx
    push ecx
    push edx
    mov edx, LINK_ADDRESS_108
    mov ebx, SECTOR
    mov ecx, SPRITE
    mov eax, LINK_ADDRESS_14
    mov dword [LINK_ADDRESS_111], edx
    mov dword [LINK_ADDRESS_112], ebx
    mov dword [LINK_ADDRESS_113], ecx
    call LINK_ADDRESS_114
    cmp byte [LINK_ADDRESS_115], 0
    je short loc_0890
    push LINK_ADDRESS_116
    call PRINTF
    add esp, 4
    mov eax, LINK_ADDRESS_14
    mov edx, dword [LINK_ADDRESS_111]
    call LINK_ADDRESS_114
loc_0890:
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
loc_089c:
    push ebx
    push ecx
    push edx
    push edi
    mov edx, 0x200
    mov ebx, 0x64
    mov ecx, 1
    mov edi, 0x1f4
    mov eax, 0x9c40
    mov dword [LINK_ADDRESS_117], edx
    mov dword [LINK_ADDRESS_118], ebx
    mov dword [LINK_ADDRESS_119], ecx
    mov dword [LINK_ADDRESS_120], ecx
    mov dword [LINK_ADDRESS_121], edi
    mov dword [LINK_ADDRESS_122], edi
    mov dword [LINK_ADDRESS_123], eax
    mov edx, 0x400
    mov ah, 1
    mov dword [LINK_ADDRESS_124], edx
    mov dword [LINK_ADDRESS_125], edx
    mov dword [LINK_ADDRESS_126], edx
    mov dword [LINK_ADDRESS_127], edx
    mov dword [LINK_ADDRESS_128], edx
    mov dword [LINK_ADDRESS_129], edx
    mov dword [LINK_ADDRESS_130], edx
    mov byte [LINK_ADDRESS_131], ah
    mov edx, 3
    mov byte [LINK_ADDRESS_132], ah
    mov dword [LINK_ADDRESS_133], edx
    mov edx, 0x40
    mov byte [LINK_ADDRESS_134], ah
    mov word [LINK_ADDRESS_135], dx
    pop edi
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
    push esi
    push edi
    mov eax, LINK_ADDRESS_136
    call LINK_ADDRESS_29
    call LINK_ADDRESS_137
    call loc_083c
    call loc_089c
    call LINK_ADDRESS_138
    call LINK_ADDRESS_139
    cmp dword [LINK_ADDRESS_31], 0
    je short loc_0985
    xor ebx, ebx
    mov dword [LINK_ADDRESS_140], ebx
loc_0985:
    cmp dword [LINK_ADDRESS_33], 0
    je short loc_0996
    xor esi, esi
    mov dword [LINK_ADDRESS_141], esi
loc_0996:
    mov ebx, 0x78
    xor eax, eax
    mov edx, LINK_ADDRESS_142
    mov al, byte [LINK_ADDRESS_143]
    call LINK_ADDRESS_144
    call LINK_ADDRESS_145
    call 0x101e0
    mov eax, LINK_ADDRESS_146
    call LINK_ADDRESS_29
    mov eax, LINK_ADDRESS_147
    call LINK_ADDRESS_29
    mov eax, LINK_ADDRESS_148
    mov ecx, 0x10
    call LINK_ADDRESS_149
    mov eax, LINK_ADDRESS_150
    xor edi, edi
    call LINK_ADDRESS_29
    mov eax, LINK_ADDRESS_151
    xor edx, edx
    call LINK_ADDRESS_29
    call LINK_ADDRESS_152
    call LINK_ADDRESS_153
    mov eax, LINK_ADDRESS_150
    xor ebx, ebx
    call LINK_ADDRESS_29
    call LINK_ADDRESS_154
    mov eax, LINK_ADDRESS_155
    mov dword [LINK_ADDRESS_156], edi
    mov word [LINK_ADDRESS_157], dx
    xor edx, edx
    mov word [LINK_ADDRESS_158], bx
    call STOSB
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_160
    cmp word [NUMPLAYERS], 1
    jle short loc_0a4b
    mov eax, LINK_ADDRESS_162
    call LINK_ADDRESS_29
loc_0a4b:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dword [nosplit eax*2 + LINK_ADDRESS_93], PALETTE
    call LINK_ADDRESS_163
    cmp byte [LINK_ADDRESS_34], 0xff
    jne short loc_0a82
    mov byte [LINK_ADDRESS_34], 1
loc_0a82:
    mov eax, LINK_ADDRESS_164
    call LINK_ADDRESS_29
    call LINK_ADDRESS_165
    mov eax, LINK_ADDRESS_166
    call LINK_ADDRESS_29
    call LINK_ADDRESS_167
    mov eax, LINK_ADDRESS_168
    call LINK_ADDRESS_29
    xor eax, eax
    call LINK_ADDRESS_169
    cmp eax, -1
    jne short loc_0acc
    mov eax, LINK_ADDRESS_170
    call LINK_ADDRESS_29
    mov eax, LINK_ADDRESS_171
    call LINK_ADDRESS_172
    jmp short loc_0ad6
loc_0acc:
    mov eax, 0xaac
    call LINK_ADDRESS_29
loc_0ad6:
    call loc_07bc
    mov eax, 0xab4
    call LINK_ADDRESS_29
    call loc_0b2c
    movsx eax, word [MYCONNECTINDEX]
    call LINK_ADDRESS_173
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    push ebx
    push ecx
    push edx
    mov edx, eax
    cmp word [NUMPLAYERS], 1
    jle short loc_0b22
    call STRLEN
    lea ebx, [eax + 1]
    mov ecx, 5
    mov eax, 0xffffffff
    call LINK_ADDRESS_175
loc_0b22:
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
loc_0b2c:
    push ebx
    push ecx
    push edx
    push esi
    xor esi, esi
    jmp short loc_0b66
loc_0b34:
    xor eax, eax
    mov al, byte [ecx + LINK_ADDRESS_176]
    call TOUPPER
    movsx edx, word [MYCONNECTINDEX]
    shl edx, 5
    mov byte [ecx + edx + LINK_ADDRESS_178], al
    xor eax, eax
    mov al, byte [ecx + LINK_ADDRESS_176]
    inc esi
    call TOUPPER
    mov byte [ecx + LINK_ADDRESS_179], al
loc_0b66:
    movsx ecx, si
    mov ah, byte [ecx + LINK_ADDRESS_176]
    test ah, ah
    jne short loc_0b34
    cmp word [NUMPLAYERS], 1
    jle near loc_0cc9
    mov byte [LINK_ADDRESS_180], 6
    mov byte [LINK_ADDRESS_181], 0x75
    add esi, 3
    mov byte [ecx + LINK_ADDRESS_179], ah
    mov cx, word [CONNECTHEAD]
    jmp short loc_0bc5
loc_0ba1:
    cmp cx, word [MYCONNECTINDEX]
    je short loc_0bba
    mov edx, LINK_ADDRESS_180
    movsx ebx, si
    movsx eax, cx
    call SENDPACKET
loc_0bba:
    movsx ecx, cx
    mov cx, word [nosplit ecx*2 + CONNECTPOINT2]
loc_0bc5:
    test cx, cx
    jge short loc_0ba1
    mov esi, 1
    mov bh, 9
    xor ecx, ecx
    mov byte [LINK_ADDRESS_180], bh
    jmp short loc_0c1a
loc_0bdb:
    movsx ebx, word [MYCONNECTINDEX]
    mov eax, ebx
    shl eax, 4
    movsx edx, cx
    add eax, ebx
    lea edx, [edx*4]
    lea eax, [eax*4]
    lea ebx, [eax + edx]
    mov eax, dword [edx + LINK_ADDRESS_69]
    inc ecx
    mov dword [ebx + LINK_ADDRESS_69], eax
    movsx ebx, si
    mov al, byte [edx + LINK_ADDRESS_69]
    inc esi
    mov byte [ebx + LINK_ADDRESS_180], al
loc_0c1a:
    cmp cx, 0xa
    jl short loc_0bdb
    call LINK_ADDRESS_90
    mov cx, word [CONNECTHEAD]
    jmp short loc_0c54
loc_0c2e:
    cmp cx, word [MYCONNECTINDEX]
    je short loc_0c49
    mov ebx, 0xb
    mov edx, LINK_ADDRESS_180
    movsx eax, cx
    call SENDPACKET
loc_0c49:
    movsx ecx, cx
    mov cx, word [nosplit ecx*2 + CONNECTPOINT2]
loc_0c54:
    test cx, cx
    jge short loc_0c2e
    mov al, byte [LINK_ADDRESS_185]
    movsx edx, word [MYCONNECTINDEX]
    mov byte [LINK_ADDRESS_181], al
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov cl, 0xa
    lea edx, [eax + eax]
    mov byte [LINK_ADDRESS_180], cl
    mov eax, dword [LINK_ADDRESS_185]
    mov cx, word [CONNECTHEAD]
    mov dword [edx + LINK_ADDRESS_185], eax
    jmp short loc_0cbf
loc_0c99:
    cmp cx, word [MYCONNECTINDEX]
    je short loc_0cb4
    mov ebx, 2
    mov edx, LINK_ADDRESS_180
    movsx eax, cx
    call SENDPACKET
loc_0cb4:
    movsx eax, cx
    mov cx, word [nosplit eax*2 + CONNECTPOINT2]
loc_0cbf:
    test cx, cx
    jge short loc_0c99
    call 0x10800
loc_0cc9:
    cmp byte [LINK_ADDRESS_186], 1
    jne short loc_0ce6
    cmp word [NUMPLAYERS], 2
    jge short loc_0ce6
    mov eax, 0xad4
    call LINK_ADDRESS_172
loc_0ce6:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    nop
    push esi
    push edi
    push ebp
    mov esi, eax
    mov edi, edx
    mov edx, 0xb0c
    mov eax, 0xb10
    mov ebp, dword [esp + 0x18]
    call FOPEN
    push ebp
    mov edx, eax
    mov eax, dword [esp + 0x18]
    push eax
    mov ebp, dword [esp + 0x18]
    push ebp
    movsx eax, cx
    push eax
    push ebx
    push edi
    push esi
    push 0xb1c
    push edx
    call LINK_ADDRESS_188
    add esp, 0x24
    mov eax, edx
    call FCLOSE
    pop ebp
    pop edi
    pop esi
    ret 0xc
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
loc_0d3c:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x44
    mov esi, eax
    xor eax, eax
    mov edx, 0x1500
    mov al, byte [esi]
    xor ebx, ebx
    call TOUPPER
    mov ecx, eax
    mov word [esp + 0x1c], dx
    mov word [esp + 0x20], bx
    mov ebx, esp
    lea edx, [esp + 0x1c]
    mov eax, 0x2f
    call INT386
    mov edi, dword [esp + 4]
    sub ecx, 0x41
    test di, di
    jne short loc_0d85
    mov al, 1
    jmp near loc_0e49
loc_0d85:
    mov eax, 0x150b
    mov ebx, esp
    xor edx, edx
    mov word [esp + 0x1c], ax
    mov word [esp + 0x20], dx
    lea edx, [esp + 0x1c]
    mov eax, 0x2f
    mov word [esp + 0x24], cx
    call INT386
    cmp word [esp], 0
    je short loc_0dbb
    cmp word [esp + 4], 0xadad
    je short loc_0dc6
loc_0dbb:
    mov al, 1
    add esp, 0x44
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0dc6:
    mov eax, 0x1502
    mov ebx, esp
    mov word [esp + 0x1c], ax
    mov eax, LINK_ADDRESS_180
    mov edx, ds
    mov word [esp + 0x20], ax
    mov eax, 0x2f
    mov word [esp + 0x38], dx
    mov word [esp + 0x24], cx
    lea ecx, [esp + 0x38]
    lea edx, [esp + 0x1c]
    call INT386X
    mov ah, byte [esp]
    test ah, ah
    je short loc_0e06
    cmp ah, 0x1e
    jne short loc_0e11
loc_0e06:
    mov al, 1
    add esp, 0x44
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0e11:
    push 0x100
    push 0
    push esi
    call OPEN
    mov edx, eax
    add esp, 0xc
    test eax, eax
    jge short loc_0e32
    mov al, 1
    add esp, 0x44
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0e32:
    call FILELENGTH
    mov esi, eax
    mov eax, edx
    call CLOSE
    cmp esi, 0x1c9c0004
    setne al
loc_0e49:
    add esp, 0x44
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    push edx
    sub esp, 0x100
    xor ah, ah
    mov edx, 0xb3c
    mov byte [LINK_ADDRESS_186], ah
    mov eax, 0xb40
    call FOPEN
    mov edx, eax
    test eax, eax
    je short loc_0eaf
    mov eax, esp
    push eax
    push 0xb4c
    push edx
    call LINK_ADDRESS_195
    add esp, 0xc
    mov eax, edx
    call FCLOSE
    mov edx, 0xb50
    mov eax, esp
    call STRCAT
    mov eax, esp
    call loc_0d3c
    test al, al
    je short loc_0eb6
loc_0eaf:
    mov byte [LINK_ADDRESS_186], 1
loc_0eb6:
    add esp, 0x100
    pop edx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
