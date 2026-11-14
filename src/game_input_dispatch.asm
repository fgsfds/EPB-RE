; Input handling and dispatch.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 0x1c
    cmp dword [LINK_ADDRESS_1], 2
    jne short loc_0018
    mov eax, esp
    call LINK_ADDRESS_2
loc_0018:
    cmp byte [LINK_ADDRESS_3], 0
    je short loc_005f
    xor dl, dl
    mov byte [LINK_ADDRESS_3], dl
    mov eax, LINK_ADDRESS_4
    xor edx, edx
    call LINK_ADDRESS_5
    movsx ebx, word [MYCONNECTINDEX]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov edx, LINK_ADDRESS_7
    add eax, eax
    add edx, eax
    mov eax, 0x67
    call LINK_ADDRESS_8
loc_005f:
    movsx ebx, word [MYCONNECTINDEX]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    add eax, eax
    cmp word [eax + LINK_ADDRESS_9], 1
    je near loc_087d
    test byte [eax + LINK_ADDRESS_10], 0x11
    jne near loc_087d
    mov eax, dword [CONTROL_BUTTONSTATE2]
    shr eax, 0xd
    test al, 1
    je short loc_00e9
    cmp dword [LINK_ADDRESS_12], 1
    je short loc_00b1
    cmp dword [LINK_ADDRESS_1], 2
    jne short loc_00e9
loc_00b1:
    mov eax, 0x2d
    call LINK_ADDRESS_13
    movsx eax, word [LINK_ADDRESS_14]
    mov ax, word [nosplit eax*2 + CONNECTPOINT2]
    mov word [LINK_ADDRESS_14], ax
    cwde
    cmp eax, -1
    jne short loc_00e2
    mov ax, word [CONNECTHEAD]
    mov word [LINK_ADDRESS_14], ax
loc_00e2:
    mov byte [LINK_ADDRESS_17], 1
loc_00e9:
    cmp dword [LINK_ADDRESS_18], 1
    jle short loc_014b
    mov eax, dword [CONTROL_BUTTONSTATE2]
    shr eax, 0xb
    test al, 1
    je short loc_014b
    mov eax, 0x2b
    call LINK_ADDRESS_13
    mov al, 1
    sub al, byte [LINK_ADDRESS_19]
    movsx ebx, word [LINK_ADDRESS_14]
    mov byte [LINK_ADDRESS_19], al
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov edx, LINK_ADDRESS_7
    add eax, eax
    add edx, eax
    xor eax, eax
    mov ebx, 0x52
    mov al, byte [LINK_ADDRESS_19]
    sub ebx, eax
    movsx eax, bx
    call LINK_ADDRESS_8
loc_014b:
    mov eax, dword [CONTROL_BUTTONSTATE2]
    shr eax, 0xf
    test al, 1
    je short loc_01a5
    mov eax, 0x2f
    call LINK_ADDRESS_13
    mov eax, 1
    sub eax, dword [LINK_ADDRESS_20]
    movsx ebx, word [LINK_ADDRESS_14]
    mov dword [LINK_ADDRESS_20], eax
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov edx, LINK_ADDRESS_7
    add eax, eax
    mov bx, word [LINK_ADDRESS_20]
    add edx, eax
    mov eax, 0x15
    sub eax, ebx
    cwde
    call LINK_ADDRESS_8
loc_01a5:
    cmp byte [LINK_ADDRESS_21], 0
    jne short loc_01cd
    cmp byte [LINK_ADDRESS_22], 0
    jne short loc_01cd
    cmp byte [LINK_ADDRESS_23], 0
    jne short loc_01cd
    cmp byte [LINK_ADDRESS_24], 0
    je near loc_055d
loc_01cd:
    xor ecx, ecx
    mov word [esp + 0x18], cx
    cmp byte [LINK_ADDRESS_25], 0
    je short loc_01ec
    xor dh, dh
    mov byte [LINK_ADDRESS_25], dh
    mov word [esp + 0x18], 1
loc_01ec:
    cmp byte [LINK_ADDRESS_26], 0
    je short loc_0204
    xor bh, bh
    mov byte [LINK_ADDRESS_26], bh
    mov word [esp + 0x18], 2
loc_0204:
    cmp byte [LINK_ADDRESS_27], 0
    je short loc_021c
    xor ch, ch
    mov byte [LINK_ADDRESS_27], ch
    mov word [esp + 0x18], 3
loc_021c:
    cmp byte [LINK_ADDRESS_28], 0
    je short loc_0234
    xor ah, ah
    mov byte [LINK_ADDRESS_28], ah
    mov word [esp + 0x18], 4
loc_0234:
    cmp byte [LINK_ADDRESS_29], 0
    je short loc_024c
    xor dh, dh
    mov byte [LINK_ADDRESS_29], dh
    mov word [esp + 0x18], 5
loc_024c:
    cmp byte [LINK_ADDRESS_30], 0
    je short loc_0264
    xor bh, bh
    mov byte [LINK_ADDRESS_30], bh
    mov word [esp + 0x18], 6
loc_0264:
    cmp byte [LINK_ADDRESS_31], 0
    je short loc_027c
    xor ch, ch
    mov byte [LINK_ADDRESS_31], ch
    mov word [esp + 0x18], 7
loc_027c:
    cmp byte [LINK_ADDRESS_32], 0
    je short loc_0294
    xor ah, ah
    mov byte [LINK_ADDRESS_32], ah
    mov word [esp + 0x18], 8
loc_0294:
    cmp byte [LINK_ADDRESS_33], 0
    je short loc_02ac
    xor dh, dh
    mov byte [LINK_ADDRESS_33], dh
    mov word [esp + 0x18], 9
loc_02ac:
    cmp byte [LINK_ADDRESS_34], 0
    je short loc_02c4
    xor bh, bh
    mov byte [LINK_ADDRESS_34], bh
    mov word [esp + 0x18], 0xa
loc_02c4:
    cmp word [esp + 0x18], 0
    je near loc_055d
    cmp byte [LINK_ADDRESS_21], 0
    jne short loc_02e6
    cmp byte [LINK_ADDRESS_22], 0
    je near loc_045b
loc_02e6:
    cmp word [esp + 0x18], 5
    jne near loc_03b8
    movsx ebx, word [MYCONNECTINDEX]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    add eax, eax
    cmp word [eax + LINK_ADDRESS_35], 0
    jle near loc_03b8
    cmp word [eax + LINK_ADDRESS_36], 0x1a
    jne near loc_03b8
    mov dh, byte [LINK_ADDRESS_37]
    inc dh
    mov byte [LINK_ADDRESS_37], dh
    cmp dh, 0x2c
    jne short loc_0342
    xor bh, bh
    mov byte [LINK_ADDRESS_37], bh
loc_0342:
    mov edx, LINK_ADDRESS_38
    mov eax, LINK_ADDRESS_39
    call STRCPY
    xor eax, eax
    mov al, byte [LINK_ADDRESS_37]
    imul eax, eax, 0xd
    mov edx, LINK_ADDRESS_41
    add edx, eax
    mov eax, LINK_ADDRESS_39
    call STRCAT
    mov eax, LINK_ADDRESS_43
    mov edx, LINK_ADDRESS_39
    call LINK_ADDRESS_44
    mov eax, LINK_ADDRESS_45
    call STRCPY
    movsx ebx, word [MYCONNECTINDEX]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov edx, LINK_ADDRESS_7
    add eax, eax
    add edx, eax
    mov eax, 0x1a
    call LINK_ADDRESS_8
    add esp, 0x1c
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_03b8:
    movsx eax, word [esp + 0x18]
    lea edx, [eax - 1]
    lea eax, [edx*4]
    add eax, edx
    mov ebx, LINK_ADDRESS_46
    lea eax, [eax*8]
    add ebx, eax
    mov eax, ebx
    xor dl, dl
    call 0x107a0
    mov ah, 4
    mov byte [LINK_ADDRESS_47], dl
    mov byte [LINK_ADDRESS_39], ah
    mov edx, ebx
    mov eax, LINK_ADDRESS_47
    call STRCAT
    mov eax, ebx
    call STRLEN
    inc eax
    mov edx, dword [LINK_ADDRESS_18]
    mov word [esp + 0x18], ax
    cmp edx, 1
    jle short loc_0446
    mov cx, word [CONNECTHEAD]
    jmp short loc_0441
loc_041b:
    cmp cx, word [MYCONNECTINDEX]
    je short loc_0436
    movsx ebx, word [esp + 0x18]
    mov edx, LINK_ADDRESS_39
    movsx eax, cx
    call SENDPACKET
loc_0436:
    movsx ecx, cx
    mov cx, word [nosplit ecx*2 + CONNECTPOINT2]
loc_0441:
    test cx, cx
    jge short loc_041b
loc_0446:
    mov al, 1
    mov byte [LINK_ADDRESS_50], al
    mov byte [LINK_ADDRESS_51], al
    add esp, 0x1c
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_045b:
    cmp dword [LINK_ADDRESS_52], 0
    jne near loc_055d
    cmp dword [LINK_ADDRESS_53], 0
    je near loc_055d
    cmp byte [LINK_ADDRESS_23], 0
    jne short loc_048b
    cmp byte [LINK_ADDRESS_24], 0
    je near loc_055d
loc_048b:
    call LINK_ADDRESS_54
    test eax, eax
    jle near loc_055d
    cmp byte [LINK_ADDRESS_55], 0
    jne near loc_055d
    cmp dword [LINK_ADDRESS_56], 0
    je near loc_055d
    movsx ebx, word [esp + 0x18]
    lea eax, [ebx - 1]
    call LINK_ADDRESS_57
    mov dword [LINK_ADDRESS_58], eax
    cmp byte [eax], 0x43
    jne short loc_04de
    neg ebx
    push ebx
    xor ecx, ecx
    push 0xff
    xor edx, edx
    xor ebx, ebx
    call LINK_ADDRESS_59
    jmp short loc_04f1
loc_04de:
    neg ebx
    push ebx
    xor ecx, ecx
    push 0xff
    xor edx, edx
    xor ebx, ebx
    call LINK_ADDRESS_60
loc_04f1:
    mov ch, 7
    mov eax, dword [LINK_ADDRESS_18]
    mov byte [LINK_ADDRESS_55], ch
    cmp eax, 1
    jle short loc_0546
    mov al, byte [esp + 0x18]
    mov byte [LINK_ADDRESS_39], ch
    mov cx, word [CONNECTHEAD]
    mov byte [LINK_ADDRESS_47], al
    jmp short loc_0541
loc_051b:
    cmp cx, word [MYCONNECTINDEX]
    je short loc_0536
    mov ebx, 2
    mov edx, LINK_ADDRESS_39
    movsx eax, cx
    call SENDPACKET
loc_0536:
    movsx eax, cx
    mov cx, word [nosplit eax*2 + CONNECTPOINT2]
loc_0541:
    test cx, cx
    jge short loc_051b
loc_0546:
    mov cl, 1
    mov byte [LINK_ADDRESS_50], cl
    mov byte [LINK_ADDRESS_51], cl
    add esp, 0x1c
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_055d:
    cmp byte [LINK_ADDRESS_23], 0
    jne short loc_0576
    cmp byte [LINK_ADDRESS_24], 0
    jne short loc_0576
    mov eax, 1
    jmp short loc_0578
loc_0576:
    xor eax, eax
loc_0578:
    test eax, eax
    je near loc_0667
    cmp byte [LINK_ADDRESS_21], 0
    jne short loc_0599
    cmp byte [LINK_ADDRESS_22], 0
    jne short loc_0599
    mov eax, 1
    jmp short loc_059b
loc_0599:
    xor eax, eax
loc_059b:
    test eax, eax
    je near loc_0667
    cmp dword [LINK_ADDRESS_18], 1
    jle short loc_05f6
    mov eax, dword [CONTROL_BUTTONSTATE2]
    shr eax, 5
    test al, 1
    je short loc_05f6
    call LINK_ADDRESS_61
    mov eax, 0x25
    call LINK_ADDRESS_13
    movsx ebx, word [MYCONNECTINDEX]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    or byte [nosplit eax*2 + LINK_ADDRESS_10], 0x10
    xor al, al
    xor ecx, ecx
    mov byte [LINK_ADDRESS_62], al
    mov word [LINK_ADDRESS_63], cx
loc_05f6:
    cmp byte [LINK_ADDRESS_34], 0
    je short loc_0667
    xor dl, dl
    mov byte [LINK_ADDRESS_34], dl
    mov eax, 0x1f4
    call LINK_ADDRESS_64
    call LINK_ADDRESS_65
    call LINK_ADDRESS_66
    movsx ebx, word [MYCONNECTINDEX]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov dh, byte [nosplit eax*2 + LINK_ADDRESS_10]
    or dh, 1
    mov ecx, dword [LINK_ADDRESS_18]
    mov byte [nosplit eax*2 + LINK_ADDRESS_10], dh
    cmp ecx, 2
    jge short loc_0667
    cmp dword [LINK_ADDRESS_1], 2
    je short loc_0667
    mov eax, dword [LINK_ADDRESS_67]
    mov byte [LINK_ADDRESS_68], dl
    mov dword [TOTALCLOCK], eax
loc_0667:
    cmp byte [LINK_ADDRESS_70], 0
    je short loc_06c0
    mov cl, byte [LINK_ADDRESS_71]
    test cl, cl
    je short loc_06c0
    movsx ebx, word [MYCONNECTINDEX]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_72]
    cmp eax, -1
    jne short loc_06c0
    xor ch, ch
    mov byte [LINK_ADDRESS_70], ch
    mov al, cl
    mov byte [LINK_ADDRESS_73], cl
    xor al, cl
    mov byte [LINK_ADDRESS_74], ch
    mov byte [LINK_ADDRESS_71], al
    call LINK_ADDRESS_75
loc_06c0:
    mov eax, dword [CONTROL_BUTTONSTATE1]
    shr eax, 8
    test al, 1
    je short loc_0717
    mov eax, 8
    call LINK_ADDRESS_13
    mov eax, 1
    sub eax, dword [LINK_ADDRESS_77]
    movsx ebx, word [MYCONNECTINDEX]
    mov dword [LINK_ADDRESS_77], eax
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov edx, LINK_ADDRESS_7
    add eax, eax
    add edx, eax
    mov ax, word [LINK_ADDRESS_77]
    db 0x05, 0x55, 0x00, 0x00, 0x00    ; add eax, 0x55
    cwde
    call LINK_ADDRESS_8
loc_0717:
    mov eax, dword [CONTROL_BUTTONSTATE2]
    shr eax, 6
    test al, 1
    je short loc_077e
    mov eax, 0x26
    call LINK_ADDRESS_13
    mov al, byte [LINK_ADDRESS_73]
    cmp al, byte [LINK_ADDRESS_71]
    je short loc_074d
    test al, al
    je short loc_074d
    xor ch, ch
    mov byte [LINK_ADDRESS_71], al
    mov byte [LINK_ADDRESS_73], ch
    jmp short loc_0772
loc_074d:
    mov bl, byte [LINK_ADDRESS_71]
    inc bl
    mov byte [LINK_ADDRESS_71], bl
    cmp bl, 3
    jne short loc_0768
    xor cl, cl
    mov byte [LINK_ADDRESS_71], cl
loc_0768:
    mov al, byte [LINK_ADDRESS_71]
    mov byte [LINK_ADDRESS_73], al
loc_0772:
    mov byte [LINK_ADDRESS_17], 1
    call LINK_ADDRESS_75
loc_077e:
    cmp byte [LINK_ADDRESS_78], 0
    je near loc_087d
    xor dl, dl
    mov byte [LINK_ADDRESS_78], dl
    cmp byte [LINK_ADDRESS_21], 0
    jne short loc_07a5
    cmp byte [LINK_ADDRESS_22], 0
    je short loc_07ae
loc_07a5:
    sub dword [LINK_ADDRESS_79], 4
    jmp short loc_07b5
loc_07ae:
    add dword [LINK_ADDRESS_79], 4
loc_07b5:
    mov edx, dword [LINK_ADDRESS_79]
    cmp edx, 0x1c
    jle short loc_07ca
    xor esi, esi
    mov dword [LINK_ADDRESS_79], esi
    jmp short loc_07d8
loc_07ca:
    test edx, edx
    jge short loc_07d8
    mov dword [LINK_ADDRESS_79], 0x1c
loc_07d8:
    movsx ebx, word [MYCONNECTINDEX]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov edx, dword [nosplit eax*2 + LINK_ADDRESS_80]
    mov eax, dword [LINK_ADDRESS_79]
    sar eax, 2
    call SETBRIGHTNESS
    mov edx, dword [LINK_ADDRESS_79]
    mov edi, dword [LINK_ADDRESS_79]
    sar edx, 2
    cmp edi, 0x14
    jge short loc_084b
    movsx ebx, word [MYCONNECTINDEX]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    mov ebx, LINK_ADDRESS_7
    add eax, eax
    add ebx, eax
    lea eax, [edx + 0x1d]
    cwde
    mov edx, ebx
    call LINK_ADDRESS_8
    add esp, 0x1c
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_084b:
    cmp edi, 0x28
    jge short loc_087d
    movsx ebx, word [MYCONNECTINDEX]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    add eax, eax
    add edx, 0x5b
    add eax, LINK_ADDRESS_7
    movsx ebx, dx
    mov edx, eax
    mov eax, ebx
    call LINK_ADDRESS_8
loc_087d:
    add esp, 0x1c
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    push edx
    mov edx, dword [eax]
    push edx
    push LINK_ADDRESS_82
    call PRINTF
    add esp, 8
    mov eax, LINK_ADDRESS_84
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_86
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_87
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_88
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_89
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_90
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_91
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_92
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_93
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_94
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_95
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_96
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_97
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_98
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_99
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_100
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_101
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_102
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_103
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_104
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_105
    call LINK_ADDRESS_85
    mov eax, LINK_ADDRESS_106
    call LINK_ADDRESS_85
    push LINK_ADDRESS_107
    call PRINTF
    add esp, 4
    pop edx
    ret
