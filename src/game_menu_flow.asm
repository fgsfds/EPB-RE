; Game menu and screen transitions.
bits 32
org START_ADDRESS

loc_0000:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov ebx, LINK_ADDRESS_1
    cmp al, 0xa
    jne short loc_001b
    mov byte [LINK_ADDRESS_2], 0x78
    jmp short loc_0026
loc_001b:
    mov ah, al
    add ah, 0x30
    mov byte [LINK_ADDRESS_2], ah
loc_0026:
    xor edx, edx
    mov dword [LINK_ADDRESS_3], edx
    cmp al, 1
    jne short loc_005e
    cmp byte [LINK_ADDRESS_4], 0
    je short loc_005e
    xor edx, edx
    mov eax, LINK_ADDRESS_4
    mov dl, byte [LINK_ADDRESS_5]
    call KOPEN4LOAD
    mov dword [LINK_ADDRESS_7], eax
    cmp eax, -1
    jne short loc_007e
    xor al, al
    jmp near loc_029d
loc_005e:
    xor edx, edx
    mov eax, ebx
    mov dl, byte [LINK_ADDRESS_5]
    call KOPEN4LOAD
    mov dword [LINK_ADDRESS_7], eax
    cmp eax, -1
    jne short loc_007e
    xor al, al
    jmp near loc_029d
loc_007e:
    mov ebx, 4
    mov edx, LINK_ADDRESS_3
    mov eax, dword [LINK_ADDRESS_7]
    call KREAD
    mov ebx, 1
    mov edx, esp
    mov eax, dword [LINK_ADDRESS_7]
    call KREAD
    cmp byte [esp], 0x75
    je short loc_00bf
    mov eax, dword [LINK_ADDRESS_7]
    call KCLOSE
    xor al, al
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_00bf:
    mov ebx, 1
    mov edx, LINK_ADDRESS_10
    mov eax, dword [LINK_ADDRESS_7]
    call KREAD
    mov ebx, 1
    mov edx, LINK_ADDRESS_11
    mov eax, dword [LINK_ADDRESS_7]
    call KREAD
    mov ebx, 1
    mov edx, LINK_ADDRESS_12
    mov eax, dword [LINK_ADDRESS_7]
    call KREAD
    mov ebx, 1
    mov edx, LINK_ADDRESS_13
    mov eax, dword [LINK_ADDRESS_7]
    call KREAD
    mov ebx, 1
    mov edx, LINK_ADDRESS_14
    mov eax, dword [LINK_ADDRESS_7]
    call KREAD
    mov ebx, 2
    mov edx, LINK_ADDRESS_15
    mov eax, dword [LINK_ADDRESS_7]
    call KREAD
    mov ebx, 2
    mov edx, LINK_ADDRESS_16
    mov eax, dword [LINK_ADDRESS_7]
    call KREAD
    mov ebx, 4
    mov edx, LINK_ADDRESS_17
    mov eax, dword [LINK_ADDRESS_7]
    call KREAD
    mov ebx, 4
    mov edx, LINK_ADDRESS_18
    mov eax, dword [LINK_ADDRESS_7]
    call KREAD
    mov ebx, 4
    mov edx, LINK_ADDRESS_19
    mov eax, dword [LINK_ADDRESS_7]
    call KREAD
    mov ebx, 4
    mov edx, LINK_ADDRESS_20
    mov eax, dword [LINK_ADDRESS_7]
    mov ecx, 1
    call KREAD
    mov ebx, 0x200
    mov edx, LINK_ADDRESS_21
    mov eax, dword [LINK_ADDRESS_7]
    call KREAD
    mov ebx, 4
    mov edx, LINK_ADDRESS_22
    mov eax, dword [LINK_ADDRESS_7]
    call KREAD
    mov ebx, 0x80
    mov edx, LINK_ADDRESS_23
    mov eax, dword [LINK_ADDRESS_7]
    call KREAD
    cmp byte [LINK_ADDRESS_23], 0
    je short loc_01f8
    mov ebx, 7
    xor ecx, ecx
    mov dword [LINK_ADDRESS_24], ebx
    mov dword [LINK_ADDRESS_25], ecx
loc_01f8:
    xor esi, esi
    jmp short loc_022d
loc_01fc:
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov ecx, 1
    sub eax, edx
    mov edx, LINK_ADDRESS_26
    add eax, eax
    mov ebx, ecx
    add edx, eax
    mov eax, dword [LINK_ADDRESS_7]
    add edx, 0x280
    inc esi
    call KREAD
loc_022d:
    mov edi, dword [LINK_ADDRESS_15]
    movsx edx, si
    cmp edx, edi
    jl short loc_01fc
    xor bh, bh
    xor dl, dl
    xor eax, eax
    xor ebp, ebp
    mov al, byte [LINK_ADDRESS_10]
    mov byte [LINK_ADDRESS_27], bh
    mov byte [LINK_ADDRESS_28], bh
    mov byte [LINK_ADDRESS_29], bh
    mov byte [LINK_ADDRESS_30], bh
    mov byte [LINK_ADDRESS_31], bh
    mov byte [LINK_ADDRESS_32], bh
    mov byte [LINK_ADDRESS_33], bh
    xor dh, dh
    mov byte [LINK_ADDRESS_34], bh
    mov word [LINK_ADDRESS_35], dx
    xor ebx, ebx
    xor edx, edx
    mov bl, byte [LINK_ADDRESS_12]
    mov dl, byte [LINK_ADDRESS_11]
    mov dword [LINK_ADDRESS_22], ebp
    call LINK_ADDRESS_36
    mov al, 1
loc_029d:
    add esp, 4
    pop ebp
    pop edi
    pop esi
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
    sub esp, 8
    mov ecx, LINK_ADDRESS_37
    xor edx, edx
    mov ebx, dword [LINK_ADDRESS_38]
    mov dword [esp], edx
    cmp ebx, 2
    jne short loc_02d6
    mov eax, dword [LINK_ADDRESS_7]
    call KCLOSE
loc_02d6:
    mov ah, 0x75
    mov edx, LINK_ADDRESS_39
    mov byte [esp + 4], ah
    mov eax, ecx
    call FOPEN
    mov dword [LINK_ADDRESS_41], eax
    test eax, eax
    je near loc_04c4
    mov ebx, 1
    mov edx, 4
    mov ecx, eax
    mov eax, esp
    call FWRITE
    mov ebx, 1
    lea eax, [esp + 4]
    mov ecx, dword [LINK_ADDRESS_41]
    mov edx, ebx
    call FWRITE
    mov ebx, 1
    mov eax, LINK_ADDRESS_10
    mov ecx, dword [LINK_ADDRESS_41]
    mov edx, ebx
    call FWRITE
    mov ebx, 1
    mov eax, LINK_ADDRESS_11
    mov ecx, dword [LINK_ADDRESS_41]
    mov edx, ebx
    call FWRITE
    mov ebx, 1
    mov eax, LINK_ADDRESS_12
    mov ecx, dword [LINK_ADDRESS_41]
    mov edx, ebx
    call FWRITE
    mov ebx, 1
    mov eax, LINK_ADDRESS_13
    mov ecx, dword [LINK_ADDRESS_41]
    mov edx, ebx
    call FWRITE
    mov ebx, 1
    mov eax, LINK_ADDRESS_14
    mov ecx, dword [LINK_ADDRESS_41]
    mov edx, ebx
    call FWRITE
    mov ebx, 1
    mov edx, 2
    mov eax, LINK_ADDRESS_15
    mov ecx, dword [LINK_ADDRESS_41]
    call FWRITE
    mov ebx, 1
    mov edx, 2
    mov eax, LINK_ADDRESS_16
    mov ecx, dword [LINK_ADDRESS_41]
    call FWRITE
    mov ebx, 1
    mov edx, 4
    mov eax, LINK_ADDRESS_17
    mov ecx, dword [LINK_ADDRESS_41]
    call FWRITE
    mov ebx, 1
    mov edx, 4
    mov eax, LINK_ADDRESS_18
    mov ecx, dword [LINK_ADDRESS_41]
    call FWRITE
    mov ebx, 1
    mov edx, 4
    mov eax, LINK_ADDRESS_19
    mov ecx, dword [LINK_ADDRESS_41]
    call FWRITE
    mov ebx, 1
    mov edx, 4
    mov eax, LINK_ADDRESS_20
    mov ecx, dword [LINK_ADDRESS_41]
    call FWRITE
    mov ebx, 1
    mov edx, 0x200
    mov eax, LINK_ADDRESS_21
    mov ecx, dword [LINK_ADDRESS_41]
    call FWRITE
    mov ebx, 1
    mov edx, 4
    mov eax, LINK_ADDRESS_22
    mov ecx, dword [LINK_ADDRESS_41]
    call FWRITE
    mov ebx, 1
    mov edx, 0x80
    mov eax, LINK_ADDRESS_23
    mov ecx, dword [LINK_ADDRESS_41]
    xor esi, esi
    jmp short loc_04a4
loc_047a:
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, 1
    add eax, eax
    mov ecx, dword [LINK_ADDRESS_41]
    add eax, LINK_ADDRESS_26
    mov edx, ebx
    add eax, 0x280
    inc esi
loc_04a4:
    call FWRITE
    mov ecx, dword [LINK_ADDRESS_15]
    movsx edx, si
    cmp edx, ecx
    jl short loc_047a
    xor esi, esi
    mov dword [LINK_ADDRESS_43], esi
    mov dword [LINK_ADDRESS_3], esi
loc_04c4:
    add esp, 8
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
loc_04d0:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 4
    mov dx, word [CONNECTHEAD]
    jmp near loc_05b4
loc_04e4:
    mov ebx, dword [LINK_ADDRESS_3]
    lea edx, [ebx*4]
    add edx, ebx
    mov edi, LINK_ADDRESS_45
    add edx, edx
    movsx ebx, word [esp]
    add edi, edx
    lea edx, [ebx*4]
    add edx, ebx
    mov esi, LINK_ADDRESS_46
    add edx, edx
    mov ecx, 0xa
    add esi, edx
    cmp ecx, 4
    jae short loc_0529
    test cl, 1
    je short loc_0522
    db 0xa4    ; movsb byte es:[edi], byte [esi]
loc_0522:
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw word es:[edi], word [esi]
    jmp short loc_0554
loc_0529:
    test edi, 1
    je short loc_0533
    db 0xa4    ; movsb byte es:[edi], byte [esi]
    dec ecx
loc_0533:
    test edi, 2
    je short loc_0540
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
    sub ecx, 2
loc_0540:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    test bl, 2
    je short loc_054e
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
loc_054e:
    test bl, 1
    je short loc_0554
    db 0xa4    ; movsb byte es:[edi], byte [esi]
loc_0554:
    mov edx, dword [LINK_ADDRESS_3]
    mov ebx, dword [LINK_ADDRESS_43]
    inc edx
    inc ebx
    mov dword [LINK_ADDRESS_3], edx
    mov dword [LINK_ADDRESS_43], ebx
    cmp edx, 0x9d8
    jl short loc_05a8
    mov esi, dword [LINK_ADDRESS_15]
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    mov ecx, dword [LINK_ADDRESS_41]
    lea edx, [esi*4]
    mov ebx, eax
    add edx, esi
    mov eax, LINK_ADDRESS_45
    add edx, edx
    xor edi, edi
    call LINK_ADDRESS_47
    mov dword [LINK_ADDRESS_3], edi
loc_05a8:
    movsx edx, word [esp]
    mov dx, word [nosplit edx*2 + CONNECTPOINT2]
loc_05b4:
    mov dword [esp], edx
    cmp word [esp], 0
    jge near loc_04e4
    add esp, 4
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    db 0x8b, 0xc9    ; mov ecx, ecx
loc_05d0:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    cmp dword [LINK_ADDRESS_38], 1
    jne short loc_0654
    mov ebx, dword [LINK_ADDRESS_3]
    test ebx, ebx
    jle short loc_064a
    mov esi, dword [LINK_ADDRESS_15]
    mov edx, ebx
    mov eax, ebx
    sar edx, 0x1f
    idiv esi
    mov ecx, dword [LINK_ADDRESS_41]
    lea edx, [esi*4]
    mov ebx, eax
    add edx, esi
    mov eax, LINK_ADDRESS_45
    add edx, edx
    call LINK_ADDRESS_47
    mov eax, dword [LINK_ADDRESS_41]
    xor ebx, ebx
    xor edx, edx
    call FSEEK
    mov ebx, 1
    mov edx, 4
    mov eax, LINK_ADDRESS_43
    mov ecx, dword [LINK_ADDRESS_41]
    xor edi, edi
    call FWRITE
    mov dword [LINK_ADDRESS_50], edi
    mov dword [LINK_ADDRESS_38], edi
loc_064a:
    mov eax, dword [LINK_ADDRESS_41]
    call FCLOSE
loc_0654:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x20
    mov ah, byte [LINK_ADDRESS_52]
    test ah, ah
    je short loc_067a
    xor eax, eax
    jmp near loc_0bce
loc_067a:
    mov byte [esp + 0x1c], ah
loc_067e:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov al, byte [nosplit eax*2 + LINK_ADDRESS_54]
    mov dh, 1
    and al, 1
    mov byte [LINK_ADDRESS_55], dh
    mov byte [LINK_ADDRESS_56], dh
    mov byte [LINK_ADDRESS_57], al
    call LINK_ADDRESS_58
    cmp word [NUMPLAYERS], 2
    jge short loc_06d0
    xor eax, eax
    mov al, byte [LINK_ADDRESS_60]
    call loc_0000
    mov byte [esp + 0x1c], al
loc_06d0:
    cmp byte [esp + 0x1c], 0
    jne near loc_075d
    cmp byte [LINK_ADDRESS_60], 1
    jbe short loc_06ed
    mov byte [LINK_ADDRESS_60], 1
    jmp short loc_067e
loc_06ed:
    xor esi, esi
    jmp short loc_0701
loc_06f1:
    mov ecx, esi
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_61
    add esi, 7
loc_0701:
    cmp esi, 0x3f
    jl short loc_06f1
    call LINK_ADDRESS_62
    call LINK_ADDRESS_63
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ebx, PALETTE
    mov esi, 0x3f
    mov dword [nosplit eax*2 + LINK_ADDRESS_65], ebx
    call LINK_ADDRESS_66
    jmp short loc_074f
loc_073f:
    mov ecx, esi
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_61
    sub esi, 7
loc_074f:
    test esi, esi
    jg short loc_073f
    xor ecx, ecx
    mov dword [LINK_ADDRESS_3], ecx
    jmp short loc_078c
loc_075d:
    mov cl, byte [LINK_ADDRESS_60]
    mov edx, 2
    inc cl
    mov dword [LINK_ADDRESS_38], edx
    mov byte [LINK_ADDRESS_60], cl
    cmp cl, 0xa
    jne short loc_0782
    mov byte [LINK_ADDRESS_60], 1
loc_0782:
    mov eax, 2
    call LINK_ADDRESS_67
loc_078c:
    cmp byte [esp + 0x1c], 0
    je short loc_07af
    cmp byte [LINK_ADDRESS_57], 0
    jne short loc_07af
    call LINK_ADDRESS_68
    test eax, eax
    jne short loc_07af
    cmp word [NUMPLAYERS], 1
    jle short loc_07d8
loc_07af:
    call LINK_ADDRESS_69
    call LINK_ADDRESS_70
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    or byte [nosplit eax*2 + LINK_ADDRESS_54], 1
loc_07d8:
    xor cl, cl
    xor esi, esi
    mov byte [LINK_ADDRESS_52], cl
    mov dword [esp + 0x18], esi
    call LINK_ADDRESS_71
loc_07eb:
    cmp dword [LINK_ADDRESS_3], 0
    jg short loc_07ff
    cmp byte [esp + 0x1c], 0
    jne near loc_0b9a
loc_07ff:
    cmp byte [esp + 0x1c], 0
    je near loc_094d
loc_080a:
    mov eax, dword [LINK_ADDRESS_72]
    add eax, 4
    cmp eax, dword [TOTALCLOCK]
    jg near loc_094d
    mov eax, dword [esp + 0x18]
    test eax, eax
    je short loc_082d
    cmp eax, 0x9d8
    jl short loc_0875
loc_082d:
    xor ebx, ebx
    mov ecx, dword [LINK_ADDRESS_3]
    mov dword [esp + 0x18], ebx
    cmp ecx, 0x9d8
    jge short loc_0845
    mov edx, ecx
    jmp short loc_084a
loc_0845:
    mov edx, 0x9d8
loc_084a:
    mov esi, dword [LINK_ADDRESS_15]
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    mov ebx, eax
    lea eax, [esi*4]
    mov ecx, dword [LINK_ADDRESS_7]
    lea edx, [esi + eax]
    mov eax, LINK_ADDRESS_45
    add edx, edx
    call LINK_ADDRESS_74
loc_0875:
    movsx edx, word [CONNECTHEAD]
    test edx, edx
    jge short loc_0887
    call loc_1e60
    jmp short loc_080a
loc_0887:
    lea ebp, [edx*4]
    mov ebx, dword [ebp + LINK_ADDRESS_75]
    and ebx, 0xff
    lea eax, [ebx*4]
    add eax, ebx
    mov edi, LINK_ADDRESS_76
    shl eax, 5
    add edi, eax
    lea eax, [edx*4]
    add eax, edx
    add eax, eax
    mov ebx, dword [esp + 0x18]
    add edi, eax
    lea eax, [ebx*4]
    add eax, ebx
    mov esi, LINK_ADDRESS_45
    add eax, eax
    mov ecx, 0xa
    add esi, eax
    cmp ecx, 4
    jae short loc_08e7
    test cl, 1
    je short loc_08e0
    db 0xa4    ; movsb byte es:[edi], byte [esi]
loc_08e0:
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw word es:[edi], word [esi]
    jmp short loc_0912
loc_08e7:
    test edi, 1
    je short loc_08f1
    db 0xa4    ; movsb byte es:[edi], byte [esi]
    dec ecx
loc_08f1:
    test edi, 2
    je short loc_08fe
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
    sub ecx, 2
loc_08fe:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    test bl, 2
    je short loc_090c
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
loc_090c:
    test bl, 1
    je short loc_0912
    db 0xa4    ; movsb byte es:[edi], byte [esi]
loc_0912:
    mov edi, dword [ebp + LINK_ADDRESS_75]
    mov eax, dword [LINK_ADDRESS_3]
    inc edi
    movsx edx, word [nosplit edx*2 + CONNECTPOINT2]
    mov dword [ebp + LINK_ADDRESS_75], edi
    mov ebp, dword [esp + 0x18]
    dec eax
    inc ebp
    mov dword [LINK_ADDRESS_3], eax
    mov dword [esp + 0x18], ebp
    test edx, edx
    jge near loc_0887
    call loc_1e60
    jmp near loc_080a
loc_094d:
    cmp byte [esp + 0x1c], 0
    jne short loc_095e
    call LINK_ADDRESS_62
    jmp near loc_09fb
loc_095e:
    call LINK_ADDRESS_77
    mov eax, dword [TOTALCLOCK]
    mov edx, dword [LINK_ADDRESS_72]
    sub eax, edx
    shl eax, 0xe
    test eax, eax
    jle short loc_0983
    mov eax, dword [TOTALCLOCK]
    sub eax, edx
    shl eax, 0xe
    jmp short loc_0985
loc_0983:
    xor eax, eax
loc_0985:
    cmp eax, 0x10000
    jge short loc_09b2
    mov eax, dword [TOTALCLOCK]
    mov ecx, dword [LINK_ADDRESS_72]
    sub eax, ecx
    shl eax, 0xe
    test eax, eax
    jle short loc_09ac
    mov eax, dword [TOTALCLOCK]
    sub eax, ecx
    shl eax, 0xe
    jmp short loc_09ae
loc_09ac:
    xor eax, eax
loc_09ae:
    mov ebx, eax
    jmp short loc_09b7
loc_09b2:
    mov ebx, 0x10000
loc_09b7:
    movsx eax, word [LINK_ADDRESS_78]
    mov edx, ebx
    call LINK_ADDRESS_79
    mov eax, ebx
    call LINK_ADDRESS_80
    cmp dword [LINK_ADDRESS_15], 1
    jle short loc_09fb
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    cmp byte [nosplit eax*2 + LINK_ADDRESS_54], 0
    je short loc_09fb
    call 0x10800
loc_09fb:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov cl, byte [eax + LINK_ADDRESS_54]
    test cl, 1
    je short loc_0a28
    test cl, 8
    jne near loc_067e
loc_0a28:
    cmp byte [LINK_ADDRESS_81], 0
    je short loc_0a67
    xor ah, ah
    mov byte [LINK_ADDRESS_81], ah
    call LINK_ADDRESS_69
    call LINK_ADDRESS_70
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    or byte [nosplit eax*2 + LINK_ADDRESS_54], 1
    call LINK_ADDRESS_82
loc_0a67:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    test byte [nosplit eax*2 + LINK_ADDRESS_54], 0x10
    je short loc_0ab8
    call LINK_ADDRESS_83
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    test byte [eax + LINK_ADDRESS_54], 0x10
    jne short loc_0b19
    mov byte [eax + LINK_ADDRESS_54], 1
    jmp short loc_0b19
loc_0ab8:
    call LINK_ADDRESS_63
    cmp dword [LINK_ADDRESS_15], 1
    jle short loc_0b19
    mov eax, esp
    call LINK_ADDRESS_84
    mov eax, dword [CONTROL_BUTTONSTATE2]
    shr eax, 5
    test al, 1
    je short loc_0b19
    call LINK_ADDRESS_71
    mov eax, 0x25
    call LINK_ADDRESS_86
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov bl, 0x10
    xor ecx, ecx
    mov byte [nosplit eax*2 + LINK_ADDRESS_54], bl
    xor bh, bh
    mov word [LINK_ADDRESS_87], cx
    mov byte [LINK_ADDRESS_88], bh
loc_0b19:
    call LINK_ADDRESS_89
    mov ax, word [LINK_ADDRESS_90]
    mov si, word [LINK_ADDRESS_91]
    cmp ax, si
    je short loc_0b46
    mov word [LINK_ADDRESS_90], si
    mov eax, dword [TOTALCLOCK]
    add eax, 0xf0
    mov dword [LINK_ADDRESS_92], eax
loc_0b46:
    call 0x10800
    call LINK_ADDRESS_66
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov dl, byte [eax + LINK_ADDRESS_54]
    cmp dl, 0x80
    je short loc_0b7d
    cmp dl, 4
    jne near loc_07eb
loc_0b7d:
    cmp byte [esp + 0x1c], 0
    je short loc_0b8e
    mov eax, dword [LINK_ADDRESS_7]
    call KCLOSE
loc_0b8e:
    xor eax, eax
    add esp, 0x20
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0b9a:
    mov eax, dword [LINK_ADDRESS_7]
    call KCLOSE
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    test byte [nosplit eax*2 + LINK_ADDRESS_54], 1
    jne near loc_067e
    mov eax, 1
loc_0bce:
    add esp, 0x20
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    push ebx
    push ecx
    push edx
    push esi
    push edi
    cmp word [NUMPLAYERS], 1
    jle short loc_0c11
loc_0bef:
    movsx eax, word [MYCONNECTINDEX]
    lea edx, [eax*4]
    mov eax, dword [LINK_ADDRESS_93]
    cmp eax, dword [edx + LINK_ADDRESS_75]
    jge short loc_0c11
    call loc_0e60
    jmp short loc_0bef
loc_0c11:
    call 0x10800
    cmp word [NUMPLAYERS], 2
    jge short loc_0c28
    xor ecx, ecx
    mov dword [LINK_ADDRESS_94], ecx
loc_0c28:
    movsx eax, word [MYCONNECTINDEX]
    mov esi, dword [LINK_ADDRESS_95]
    mov eax, dword [eax*4 + LINK_ADDRESS_75]
    mov edi, dword [LINK_ADDRESS_94]
    sub eax, esi
    cmp eax, edi
    jle short loc_0c7d
    movsx eax, word [CONNECTHEAD]
    mov ebx, dword [LINK_ADDRESS_95]
    jmp short loc_0c68
loc_0c57:
    cmp ebx, dword [eax*4 + LINK_ADDRESS_75]
    je short loc_0c6c
    movsx eax, word [nosplit eax*2 + CONNECTPOINT2]
loc_0c68:
    test eax, eax
    jge short loc_0c57
loc_0c6c:
    test eax, eax
    jge short loc_0c7d
    call loc_1e60
    test al, al
    je short loc_0c28
    mov al, 1
    jmp short loc_0c7f
loc_0c7d:
    xor al, al
loc_0c7f:
    pop edi
loc_0c80:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
loc_0c90:
    push ebx
    push ecx
    push edx
    push esi
    cmp word [NUMPLAYERS], 2
    jl short loc_0c80
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    mov ebx, dword [LINK_ADDRESS_95]
    lea eax, [eax*4]
    dec ebx
    sub eax, edx
    and ebx, 0xff
    add eax, eax
    lea edx, [ebx*4]
    add eax, LINK_ADDRESS_26
    mov esi, dword [edx + LINK_ADDRESS_96]
    cmp esi, dword [eax + 0x214]
    jne short loc_0d1d
    mov ecx, dword [eax + 0x218]
    cmp ecx, dword [edx + LINK_ADDRESS_97]
    jne short loc_0d1d
    mov ecx, dword [eax + 0x21c]
    cmp ecx, dword [edx + LINK_ADDRESS_98]
    jne short loc_0d1d
    mov ecx, dword [eax + 0x220]
    cmp ecx, dword [edx + LINK_ADDRESS_99]
    jne short loc_0d1d
    mov dx, word [eax + 0x298]
    cmp dx, word [nosplit ebx*2 + LINK_ADDRESS_100]
    je near loc_0c80
loc_0d1d:
    mov edx, dword [eax + 0x214]
    mov dword [LINK_ADDRESS_101], edx
    mov edx, dword [eax + 0x238]
    mov dword [LINK_ADDRESS_102], edx
    mov edx, dword [eax + 0x24c]
    mov dword [LINK_ADDRESS_103], edx
    mov edx, dword [eax + 0x218]
    mov dword [LINK_ADDRESS_104], edx
    mov edx, dword [eax + 0x23c]
    mov dword [LINK_ADDRESS_105], edx
    mov edx, dword [eax + 0x250]
    mov dword [LINK_ADDRESS_106], edx
    mov edx, dword [eax + 0x21c]
    mov dword [LINK_ADDRESS_107], edx
    mov edx, dword [eax + 0x240]
    mov dword [LINK_ADDRESS_108], edx
    mov edx, dword [eax + 0x254]
    mov dword [LINK_ADDRESS_109], edx
    mov dx, word [eax + 0x298]
    mov word [LINK_ADDRESS_110], dx
    mov dx, word [eax + 0x29a]
    mov word [LINK_ADDRESS_111], dx
    mov dx, word [eax + 0x29e]
    mov word [LINK_ADDRESS_112], dx
    mov dx, word [eax + 0x220]
    mov word [LINK_ADDRESS_113], dx
    mov dx, word [eax + 0x224]
    mov word [LINK_ADDRESS_114], dx
    mov dx, word [eax + 0x318]
    mov word [LINK_ADDRESS_115], dx
    mov dx, word [eax + 0x228]
    mov word [LINK_ADDRESS_116], dx
    mov dx, word [eax + 0x324]
    mov word [LINK_ADDRESS_117], dx
    mov dl, byte [eax + 0x3a6]
    mov byte [LINK_ADDRESS_118], dl
    mov dl, byte [eax + 0x3a8]
    mov byte [LINK_ADDRESS_119], dl
    mov dl, byte [eax + 0x3ed]
    mov byte [LINK_ADDRESS_120], dl
    mov al, byte [eax + 0x3f5]
    mov byte [LINK_ADDRESS_121], al
    mov eax, dword [LINK_ADDRESS_95]
    mov dword [LINK_ADDRESS_93], eax
loc_0e32:
    movsx eax, word [MYCONNECTINDEX]
    lea edx, [eax*4]
    mov eax, dword [LINK_ADDRESS_93]
    cmp eax, dword [edx + LINK_ADDRESS_75]
    jge near loc_0c80
    call loc_0e60
    jmp short loc_0e32
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
loc_0e60:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x48
    mov edx, dword [LINK_ADDRESS_93]
    and edx, 0xff
    lea eax, [edx*4]
    add eax, edx
    mov ebp, LINK_ADDRESS_76
    shl eax, 5
    movsx edx, word [MYCONNECTINDEX]
    add ebp, eax
    lea eax, [edx*4]
    add eax, edx
    add eax, eax
    add ebp, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov esi, LINK_ADDRESS_26
    add eax, eax
    add esi, eax
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov dx, word [eax + LINK_ADDRESS_122]
    mov dword [esp + 0x3c], edx
    and edx, 0xfffffefe
    mov word [eax + LINK_ADDRESS_122], dx
    mov eax, dword [ebp + 6]
    mov dword [esp + 0x30], eax
    mov ax, word [LINK_ADDRESS_112]
    movsx edx, ax
    mov dword [esp + 0x38], eax
    lea eax, [edx*4]
    add eax, edx
    mov di, word [eax*8 + LINK_ADDRESS_123]
    xor ah, ah
    mov byte [esp + 0x44], ah
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    cmp byte [eax + LINK_ADDRESS_124], 0x20
    setb al
    mov dh, byte [LINK_ADDRESS_33]
    mov byte [esp + 0x40], al
    test dh, dh
    jne short loc_0f64
    movsx edx, word [esp + 0x38]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + LINK_ADDRESS_125], 0x230
    je short loc_0f4e
    mov ebx, dword [esp + 0x38]
    test bx, bx
    jl short loc_0f4e
    cmp bx, 0x400
    jl short loc_0f64
loc_0f4e:
    mov eax, dword [LINK_ADDRESS_102]
    mov dword [LINK_ADDRESS_101], eax
    mov eax, dword [LINK_ADDRESS_105]
    mov dword [LINK_ADDRESS_104], eax
    jmp short loc_0f78
loc_0f64:
    mov eax, dword [LINK_ADDRESS_101]
    mov dword [LINK_ADDRESS_102], eax
    mov eax, dword [LINK_ADDRESS_104]
    mov dword [LINK_ADDRESS_105], eax
loc_0f78:
    mov ax, word [LINK_ADDRESS_113]
    mov word [LINK_ADDRESS_114], ax
    mov ax, word [LINK_ADDRESS_115]
    mov word [LINK_ADDRESS_116], ax
    mov eax, dword [LINK_ADDRESS_107]
    push 0x10001
    mov dword [LINK_ADDRESS_108], eax
    mov ax, word [LINK_ADDRESS_110]
    push 0xa3
    mov word [LINK_ADDRESS_111], ax
    lea eax, [esp + 8]
    push eax
    lea eax, [esp + 0x18]
    push eax
    lea eax, [esp + 0x14]
    push eax
    lea eax, [esp + 0x1c]
    push eax
    movsx eax, word [esp + 0x50]
    mov ebx, dword [LINK_ADDRESS_107]
    mov dword [esp + 0x28], eax
    mov edx, dword [LINK_ADDRESS_104]
    mov ecx, dword [esp + 0x28]
    mov eax, dword [LINK_ADDRESS_101]
    call LINK_ADDRESS_126
    mov eax, dword [esp + 0x10]
    mov ebx, dword [LINK_ADDRESS_104]
    mov edx, dword [LINK_ADDRESS_101]
    call GETFLORZOFSLOPE
    mov edx, dword [esp]
    and edx, 0xc000
    mov dword [esp + 0x2c], eax
    cmp edx, 0x4000
    jne short loc_1030
    cmp di, 1
    jne short loc_1030
    mov edx, dword [LINK_ADDRESS_107]
    sub edx, eax
    mov eax, edx
    test eax, eax
    jns short loc_1027
    neg eax
loc_1027:
    cmp eax, 0x3600
    jle short loc_1030
    xor edi, edi
loc_1030:
    cmp dword [esi + 0x280], 0
    jne near loc_1137
    cmp byte [LINK_ADDRESS_119], 0
    je near loc_1137
    cmp di, 2
    je near loc_1137
    movsx eax, word [esp + 0x38]
    mov dword [esp + 0x18], eax
    mov edx, eax
    lea eax, [eax*4]
    add eax, edx
    test byte [eax*8 + LINK_ADDRESS_128], 2
    je near loc_1137
    movsx eax, word [LINK_ADDRESS_110]
    add eax, 0x200
    and eax, 0x7ff
    movsx eax, word [nosplit eax*2 + SINTABLE]
    mov ecx, dword [LINK_ADDRESS_101]
    sar eax, 5
    add ecx, eax
    mov ax, word [LINK_ADDRESS_110]
    and ah, 7
    cwde
    movsx eax, word [nosplit eax*2 + SINTABLE]
    mov edx, dword [LINK_ADDRESS_104]
    sar eax, 5
    add edx, eax
    mov eax, dword [esp + 0x38]
    lea ebx, [esp + 0x34]
    mov dword [esp + 0x34], eax
    mov eax, ecx
    mov dword [esp + 0x28], edx
    call UPDATESECTOR
    cmp word [esp + 0x34], 0
    jl short loc_1137
    mov ebx, dword [esp + 0x28]
    mov eax, dword [esp + 0x18]
    mov edx, ecx
    call GETFLORZOFSLOPE
    mov dword [esp + 0x24], eax
    mov eax, dword [esp + 0x2c]
    sub eax, dword [esp + 0x24]
    mov edx, dword [esp + 0x34]
    mov dword [esp + 0x20], eax
    cmp dx, word [esp + 0x38]
    je short loc_1121
    mov ebx, dword [esp + 0x28]
    movsx eax, dx
    mov edx, ecx
    mov ecx, dword [esp + 0x24]
    call GETFLORZOFSLOPE
    sub eax, ecx
    test eax, eax
    jns short loc_111a
    neg eax
loc_111a:
    cmp eax, 0x400
    jg short loc_1137
loc_1121:
    mov edx, 0xa0
    mov eax, dword [esp + 0x20]
    imul edx
    shrd eax, edx, 0x10
    add word [LINK_ADDRESS_115], ax
loc_1137:
    mov ax, word [LINK_ADDRESS_115]
    test ax, ax
    jle short loc_114d
    cwde
    mov edx, eax
    sar edx, 3
    inc edx
    sub eax, edx
    jmp short loc_115a
loc_114d:
    jge short loc_1160
    cwde
    mov edx, eax
    neg edx
    sar edx, 3
    inc edx
    add eax, edx
loc_115a:
    mov word [LINK_ADDRESS_115], ax
loc_1160:
    mov eax, dword [esp + 4]
    test eax, eax
    jl short loc_11b9
    and eax, 0xc000
    cmp eax, 0xc000
    jne short loc_11b9
    mov edx, dword [esp + 4]
    and edx, 0xfff
    mov dword [esp + 4], edx
    imul eax, edx, 0x2c
    cmp word [eax + LINK_ADDRESS_131], 1
    jne short loc_11b9
    cmp word [eax + LINK_ADDRESS_132], 0
    jl short loc_11b9
    movsx eax, word [esp + 0x38]
    mov ebx, dword [LINK_ADDRESS_104]
    xor ecx, ecx
    mov edx, dword [LINK_ADDRESS_101]
    mov dword [esp + 4], ecx
    call GETCEILZOFSLOPE
    mov dword [esp + 8], eax
loc_11b9:
    mov eax, dword [esp]
    test eax, eax
    jl near loc_12b0
    and eax, 0xc000
    cmp eax, 0xc000
    jne near loc_12b0
    mov eax, dword [esp]
    and eax, 0xfff
    mov dword [esp + 0x2c], eax
    imul eax, eax, 0x2c
    mov ax, word [eax + LINK_ADDRESS_122]
    xor ah, ah
    and al, 0x21
    db 0x66, 0x3d, 0x21, 0x00    ; cmp ax, 0x21
    jne short loc_11fc
    mov cl, 1
    xor edi, edi
    mov byte [esp + 0x44], cl
loc_11fc:
    imul edx, dword [esp + 0x2c], 0x2c
    mov eax, SPRITE
    add eax, edx
    call LINK_ADDRESS_135
    test ax, ax
    je near loc_12b0
    cmp byte [edx + LINK_ADDRESS_136], 0x18
    jbe near loc_12b0
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov ecx, dword [edx + LINK_ADDRESS_137]
    mov eax, dword [eax + LINK_ADDRESS_137]
    sub eax, ecx
    test eax, eax
    jns short loc_1241
    neg eax
loc_1241:
    cmp eax, 0x5400
    jge short loc_12b0
    mov ebx, dword [LINK_ADDRESS_104]
    mov eax, dword [edx + LINK_ADDRESS_138]
    sub eax, ebx
    mov ecx, dword [LINK_ADDRESS_101]
    mov ebx, eax
    mov eax, dword [edx + SPRITE]
    mov edx, ebx
    sub eax, ecx
    call GETANGLE
    lea edx, [eax + 0x200]
    mov ebx, dword [LINK_ADDRESS_103]
    and edx, 0x7ff
    mov ecx, dword [LINK_ADDRESS_106]
    and eax, 0x7ff
    movsx edx, word [nosplit edx*2 + SINTABLE]
    movsx eax, word [nosplit eax*2 + SINTABLE]
    shl edx, 4
    shl eax, 4
    sub ebx, edx
    sub ecx, eax
    mov dword [LINK_ADDRESS_103], ebx
    mov dword [LINK_ADDRESS_106], ecx
loc_12b0:
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_132], 0
    jg near loc_1386
    cmp di, 2
    jne short loc_132a
    cmp byte [esi + 0x3a3], 0
    jne short loc_12f9
    mov edx, dword [esp + 0xc]
    mov eax, dword [LINK_ADDRESS_107]
    sub eax, edx
    test eax, eax
    jns short loc_12e8
    neg eax
loc_12e8:
    cmp eax, 0x1300
    jle short loc_12f9
    add dword [LINK_ADDRESS_107], 0x15c
loc_12f9:
    push 0x10001
    push 0x400
    push 0x400
    push 0xa4
    push 0
    mov ecx, LINK_ADDRESS_112
    mov ebx, LINK_ADDRESS_107
    push 0
    mov edx, LINK_ADDRESS_104
    mov eax, LINK_ADDRESS_101
    call LINK_ADDRESS_140
loc_132a:
    mov ebx, LINK_ADDRESS_112
    mov edx, dword [LINK_ADDRESS_104]
    mov eax, dword [LINK_ADDRESS_101]
    call UPDATESECTOR
    push 0x10001
    push 0x1400
    mov ecx, LINK_ADDRESS_112
    push 0x400
    mov ebx, LINK_ADDRESS_107
    mov edx, LINK_ADDRESS_104
    push 0x80
    mov eax, LINK_ADDRESS_101
    xor edi, edi
    call LINK_ADDRESS_141
    mov ecx, 0x64
    mov word [LINK_ADDRESS_115], di
    mov word [LINK_ADDRESS_113], cx
    jmp near loc_1dd5
loc_1386:
    mov bx, word [esi + 0x33e]
    mov ecx, 4
    test bx, bx
    jge near loc_1b77
    cmp word [esi + 0x34a], 0
    jge short loc_13ae
    add word [LINK_ADDRESS_110], 0x80
loc_13ae:
    mov edx, 0x28
    cmp di, 2
    jne near loc_14f0
    xor eax, eax
    mov dh, byte [esp + 0x30]
    mov word [LINK_ADDRESS_117], ax
    test dh, 1
    je short loc_1408
    cmp dword [LINK_ADDRESS_109], 0
    jle short loc_13df
    xor ebx, ebx
    mov dword [LINK_ADDRESS_109], ebx
loc_13df:
    mov eax, dword [LINK_ADDRESS_109]
    sub eax, 0x15c
    mov dword [LINK_ADDRESS_109], eax
    cmp eax, 0xfffffa00
    jge near loc_1485
    mov dword [LINK_ADDRESS_109], 0xfffffa00
    jmp near loc_1485
loc_1408:
    test dh, 2
    je short loc_1443
    cmp dword [LINK_ADDRESS_109], 0
    jge short loc_141d
    xor eax, eax
    mov dword [LINK_ADDRESS_109], eax
loc_141d:
    mov edx, dword [LINK_ADDRESS_109]
    add edx, 0x15c
    mov dword [LINK_ADDRESS_109], edx
    cmp edx, 0x600
    jle short loc_1485
    mov dword [LINK_ADDRESS_109], 0x600
    jmp short loc_1485
loc_1443:
    mov eax, dword [LINK_ADDRESS_109]
    test eax, eax
    jge short loc_1463
    lea edx, [eax + 0x100]
    mov dword [LINK_ADDRESS_109], edx
    test edx, edx
    jle short loc_1463
    xor eax, eax
    mov dword [LINK_ADDRESS_109], eax
loc_1463:
    mov edx, dword [LINK_ADDRESS_109]
    test edx, edx
    jle short loc_1485
    lea ebx, [edx - 0x100]
    mov dword [LINK_ADDRESS_109], ebx
    test ebx, ebx
    jge short loc_1485
    xor edx, edx
    mov dword [LINK_ADDRESS_109], edx
loc_1485:
    mov eax, dword [LINK_ADDRESS_109]
    cmp eax, 0x800
    jle short loc_149b
    mov edx, eax
    sar edx, 1
    mov dword [LINK_ADDRESS_109], edx
loc_149b:
    mov eax, dword [LINK_ADDRESS_109]
    mov ebx, dword [LINK_ADDRESS_107]
    add ebx, eax
    mov eax, dword [esp + 0xc]
    sub eax, 0xf00
    mov dword [LINK_ADDRESS_107], ebx
    cmp eax, ebx
    jge short loc_14c8
    sub eax, ebx
    sar eax, 1
    lea edx, [ebx + eax]
    mov dword [LINK_ADDRESS_107], edx
loc_14c8:
    mov eax, dword [esp + 8]
    mov ebx, dword [LINK_ADDRESS_107]
    add eax, 0x400
    cmp eax, ebx
    jle near loc_1912
    mov dword [LINK_ADDRESS_107], eax
    xor eax, eax
    mov dword [LINK_ADDRESS_109], eax
    jmp near loc_1912
loc_14f0:
    cmp byte [esi + 0x3cb], 0
    je near loc_15ce
    xor dl, dl
    xor ebx, ebx
    mov byte [LINK_ADDRESS_119], dl
    xor dh, dh
    mov word [LINK_ADDRESS_117], bx
    mov byte [LINK_ADDRESS_120], dh
    mov bl, byte [esi + 0x3cb]
    cmp bl, 0xb
    jae short loc_1536
    xor eax, eax
    mov al, bl
    mov edx, dword [LINK_ADDRESS_107]
    shl eax, 7
    sub edx, eax
    mov dword [LINK_ADDRESS_107], edx
loc_1536:
    cmp byte [esp + 0x40], 0
    je short loc_1547
    mov dword [esp + 0x2c], 0x200
    jmp short loc_154f
loc_1547:
    mov dword [esp + 0x2c], 0x800
loc_154f:
    test byte [esp + 0x30], 1
    je short loc_1560
    mov eax, dword [esp + 0x2c]
    sub dword [LINK_ADDRESS_107], eax
loc_1560:
    test byte [esp + 0x30], 2
    je short loc_1571
    mov eax, dword [esp + 0x2c]
    add dword [LINK_ADDRESS_107], eax
loc_1571:
    cmp byte [esp + 0x40], 0
    jne short loc_158a
    test di, di
    je short loc_1583
    cmp di, 2
    jne short loc_158a
loc_1583:
    mov edx, 0x20
    jmp short loc_158f
loc_158a:
    mov edx, 0x10
loc_158f:
    mov eax, edx
    mov edx, dword [esp + 0xc]
    shl eax, 8
    sub edx, eax
    mov eax, edx
    mov edx, dword [LINK_ADDRESS_107]
    cmp eax, edx
    jge short loc_15b2
    sub eax, edx
    sar eax, 1
    add edx, eax
    mov dword [LINK_ADDRESS_107], edx
loc_15b2:
    mov eax, dword [esp + 8]
    mov ebx, dword [LINK_ADDRESS_107]
    add eax, 0x1200
    cmp eax, ebx
    jle near loc_1912
    jmp near loc_190d
loc_15ce:
    cmp di, 2
    je near loc_1912
    cmp di, 1
    jne short loc_15fa
    cmp byte [esi + 0x3cc], 0
    jne short loc_15fa
    cmp byte [esp + 0x40], 0
    jne short loc_15f5
    mov edx, 0x22
    jmp short loc_15fa
loc_15f5:
    mov edx, 0xc
loc_15fa:
    mov eax, edx
    shl eax, 8
    mov dword [esp + 0x1c], eax
    mov eax, dword [esp + 0xc]
    sub eax, dword [esp + 0x1c]
    cmp eax, dword [LINK_ADDRESS_107]
    jle near loc_16be
    movsx ebx, word [esp + 0x38]
    mov eax, ebx
    call LINK_ADDRESS_142
    mov dword [esp + 0x10], eax
    mov eax, ebx
    call LINK_ADDRESS_143
    mov dword [esp + 0x14], eax
    mov eax, dword [esp + 0x10]
    or eax, dword [esp + 0x14]
    jne near loc_16be
    test byte [esp + 0x30], 3
    jne short loc_1685
    cmp byte [LINK_ADDRESS_119], 0
    je short loc_1685
    lea eax, [ebx*4]
    add eax, ebx
    test byte [eax*8 + LINK_ADDRESS_128], 2
    je short loc_1685
    mov eax, dword [esp + 0xc]
    sub eax, dword [esp + 0x1c]
    mov ebx, dword [LINK_ADDRESS_107]
    lea edx, [eax - 0x1000]
    cmp edx, ebx
    jg short loc_1685
    mov dword [LINK_ADDRESS_107], eax
    jmp near loc_180d
loc_1685:
    xor dh, dh
    mov eax, dword [LINK_ADDRESS_144]
    mov byte [LINK_ADDRESS_119], dh
    add eax, 0x50
    mov edx, dword [LINK_ADDRESS_109]
    add edx, eax
    mov dword [LINK_ADDRESS_109], edx
    cmp edx, 0x1800
    jl near loc_180d
    mov dword [LINK_ADDRESS_109], 0x1800
    jmp near loc_180d
loc_16be:
    cmp di, 1
    je short loc_16eb
    cmp di, 2
    je short loc_16eb
    cmp byte [LINK_ADDRESS_119], 0
    jne short loc_16eb
    mov ebx, dword [LINK_ADDRESS_109]
    cmp ebx, 0xc00
    jle short loc_16eb
    mov eax, ebx
    sar eax, 0xa
    mov byte [LINK_ADDRESS_120], al
loc_16eb:
    mov byte [LINK_ADDRESS_119], 1
    cmp edx, 0x28
    jne short loc_173e
    mov eax, dword [esp + 0xc]
    shl edx, 8
    sub eax, edx
    sub eax, dword [LINK_ADDRESS_107]
    sar eax, 1
    mov edx, eax
    test eax, eax
    jns short loc_1710
    neg eax
loc_1710:
    cmp eax, 0x100
    jge short loc_1719
    xor edx, edx
loc_1719:
    mov ebx, dword [LINK_ADDRESS_107]
    mov eax, dword [LINK_ADDRESS_109]
    add ebx, edx
    sub eax, 0x300
    mov dword [LINK_ADDRESS_107], ebx
    mov dword [LINK_ADDRESS_109], eax
    test eax, eax
    jge short loc_178d
    xor ebx, ebx
    jmp short loc_1787
loc_173e:
    cmp word [LINK_ADDRESS_117], 0
    jne short loc_178d
    mov eax, dword [esp + 0xc]
    shl edx, 7
    sub eax, edx
    mov edx, dword [LINK_ADDRESS_107]
    sub eax, edx
    sar eax, 1
    lea ebx, [edx + eax]
    mov dword [LINK_ADDRESS_107], ebx
    cmp byte [esi + 0x3a3], 0
    jne short loc_178d
    mov eax, dword [esp + 0xc]
    sub eax, 0x1000
    cmp eax, ebx
    jge short loc_178d
    mov ebx, dword [LINK_ADDRESS_109]
    sar ebx, 1
    mov dword [LINK_ADDRESS_107], eax
loc_1787:
    mov dword [LINK_ADDRESS_109], ebx
loc_178d:
    test byte [esp + 0x30], 2
    je short loc_179e
    add dword [LINK_ADDRESS_107], 0xb00
loc_179e:
    test byte [esp + 0x30], 1
    jne short loc_17b8
    cmp byte [LINK_ADDRESS_118], 1
    jne short loc_17b8
    xor ah, ah
    mov byte [LINK_ADDRESS_118], ah
    jmp short loc_17f4
loc_17b8:
    test byte [esp + 0x30], 1
    je short loc_17f4
    cmp byte [LINK_ADDRESS_118], 0
    jne short loc_17f4
    cmp word [LINK_ADDRESS_117], 0
    jne short loc_17f4
    mov eax, dword [esp + 0xc]
    sub eax, dword [esp + 8]
    cmp eax, 0x3800
    jle short loc_17f4
    mov edx, 1
    mov al, 1
    mov word [LINK_ADDRESS_117], dx
    mov byte [LINK_ADDRESS_118], al
loc_17f4:
    cmp word [LINK_ADDRESS_117], 0
    je short loc_180d
    test byte [esp + 0x30], 1
    jne short loc_180d
    xor eax, eax
    mov word [LINK_ADDRESS_117], ax
loc_180d:
    cmp word [LINK_ADDRESS_117], 0
    je near loc_18ba
    test byte [esp + 0x30], 1
    jne short loc_1832
    cmp byte [LINK_ADDRESS_118], 1
    jne short loc_1832
    xor al, al
    mov byte [LINK_ADDRESS_118], al
loc_1832:
    mov bx, word [LINK_ADDRESS_117]
    cmp bx, 0x500
    jge short loc_18aa
    cmp di, 1
    jne short loc_1861
    cmp bx, 0x300
    jle short loc_1861
    xor eax, eax
    mov word [LINK_ADDRESS_117], ax
    mov dword [LINK_ADDRESS_109], 0xfffffe00
    jmp short loc_18ba
loc_1861:
    movsx eax, word [LINK_ADDRESS_117]
    add eax, 0x780
    and eax, 0x7ff
    movsx edx, word [nosplit eax*2 + SINTABLE]
    mov ebx, 0xc
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    sub dword [LINK_ADDRESS_109], eax
    mov bx, word [LINK_ADDRESS_117]
    xor ah, ah
    add ebx, 0xb4
    mov byte [LINK_ADDRESS_119], ah
    mov word [LINK_ADDRESS_117], bx
    jmp short loc_18ba
loc_18aa:
    xor eax, eax
    xor edx, edx
    mov word [LINK_ADDRESS_117], ax
    mov dword [LINK_ADDRESS_109], edx
loc_18ba:
    mov eax, dword [LINK_ADDRESS_109]
    mov edx, dword [LINK_ADDRESS_107]
    add edx, eax
    mov eax, dword [esp + 8]
    add eax, 0x400
    mov dword [LINK_ADDRESS_107], edx
    cmp eax, edx
    jle short loc_1912
    xor edx, edx
    mov eax, dword [LINK_ADDRESS_109]
    mov word [LINK_ADDRESS_117], dx
    test eax, eax
    jge short loc_18fa
    xor edx, edx
    mov dword [LINK_ADDRESS_106], edx
    mov dword [LINK_ADDRESS_103], edx
loc_18fa:
    mov dword [LINK_ADDRESS_109], 0x80
    mov eax, dword [esp + 8]
    add eax, 0x400
loc_190d:
    mov dword [LINK_ADDRESS_107], eax
loc_1912:
    cmp word [esi + 0x348], 0
    jne short loc_1960
    cmp word [esi + 0x396], 2
    jg short loc_1960
    cmp byte [LINK_ADDRESS_120], 0
    jne short loc_1960
    cmp word [esi + 0x32a], 0
    jg short loc_1960
    cmp word [esi + 0x328], 0
    jg short loc_1960
    cmp word [esi + 0x312], LINK_ADDRESS_145
    jne short loc_1970
    mov ax, word [esi + 0x334]
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    jle short loc_1970
    db 0x66, 0x3d, 0x04, 0x00    ; cmp ax, 4
    jge short loc_1970
loc_1960:
    xor ecx, ecx
    mov dword [LINK_ADDRESS_103], ecx
    mov dword [LINK_ADDRESS_106], ecx
    jmp short loc_19c4
loc_1970:
    mov al, byte [ebp]
    test al, al
    je short loc_19c4
    movsx edx, al
    add edx, edx
    cmp di, 2
    jne short loc_19a8
    mov eax, edx
    sar eax, 3
    mov ebx, ecx
    sub edx, eax
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul edx, eax
    movsx eax, word [LINK_ADDRESS_110]
    add eax, edx
    mov word [LINK_ADDRESS_110], ax
    jmp short loc_19bd
loc_19a8:
    mov ebx, ecx
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc eax, 0
    imul eax, edx
    add word [LINK_ADDRESS_110], ax
loc_19bd:
    and byte [LINK_ADDRESS_146], 7
loc_19c4:
    cmp dword [LINK_ADDRESS_103], 0
    jne short loc_19e8
    cmp dword [LINK_ADDRESS_106], 0
    jne short loc_19e8
    cmp word [ebp + 2], 0
    jne short loc_19e8
    cmp word [ebp + 4], 0
    je near loc_1b77
loc_19e8:
    mov bx, word [esi + 0x38a]
    test bx, bx
    jle short loc_19fd
    cmp bx, 0x190
    jge short loc_19fd
    add ecx, ecx
loc_19fd:
    movsx eax, word [ebp + 2]
    imul eax, ecx
    mov ebx, dword [LINK_ADDRESS_103]
    shl eax, 6
    add ebx, eax
    mov dword [LINK_ADDRESS_103], ebx
    movsx eax, word [ebp + 4]
    imul eax, ecx
    mov ecx, dword [LINK_ADDRESS_106]
    shl eax, 6
    add ecx, eax
    mov dword [LINK_ADDRESS_106], ecx
    cmp word [esi + 0x312], 0
    jne short loc_1a4a
    cmp word [esi + 0x334], 0xa
    jle short loc_1a4a
    cmp byte [LINK_ADDRESS_119], 0
    jne short loc_1a5a
loc_1a4a:
    cmp byte [LINK_ADDRESS_119], 0
    je short loc_1a89
    test byte [esp + 0x30], 2
    je short loc_1a89
loc_1a5a:
    mov edx, dword [LINK_ADDRESS_147]
    mov eax, dword [LINK_ADDRESS_103]
    sub edx, 0x2000
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [LINK_ADDRESS_147]
    mov dword [LINK_ADDRESS_103], eax
    mov eax, dword [LINK_ADDRESS_106]
    sub edx, 0x2000
    jmp short loc_1adf
loc_1a89:
    cmp di, 2
    jne short loc_1abe
    mov edx, dword [LINK_ADDRESS_147]
    mov eax, dword [LINK_ADDRESS_103]
    sub edx, 0x1400
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [LINK_ADDRESS_147]
    mov dword [LINK_ADDRESS_103], eax
    mov eax, dword [LINK_ADDRESS_106]
    sub edx, 0x1400
    jmp short loc_1adf
loc_1abe:
    mov edx, dword [LINK_ADDRESS_147]
    mov eax, dword [LINK_ADDRESS_103]
    imul edx
    shrd eax, edx, 0x10
    mov edx, dword [LINK_ADDRESS_147]
    mov dword [LINK_ADDRESS_103], eax
    mov eax, dword [LINK_ADDRESS_106]
loc_1adf:
    imul edx
    shrd eax, edx, 0x10
    mov dword [LINK_ADDRESS_106], eax
    mov eax, dword [LINK_ADDRESS_103]
    call LINK_ADDRESS_148
    cmp eax, 0x800
    jge short loc_1b18
    mov eax, dword [LINK_ADDRESS_106]
    call LINK_ADDRESS_148
    cmp eax, 0x800
    jge short loc_1b18
    xor eax, eax
    mov dword [LINK_ADDRESS_106], eax
    mov dword [LINK_ADDRESS_103], eax
loc_1b18:
    cmp byte [esp + 0x40], 0
    je short loc_1b77
    mov eax, dword [LINK_ADDRESS_147]
    mov edx, dword [LINK_ADDRESS_147]
    sar eax, 1
    sub edx, eax
    mov eax, edx
    mov edx, dword [LINK_ADDRESS_147]
    sar edx, 2
    add edx, eax
    mov eax, dword [LINK_ADDRESS_103]
    imul edx
    shrd eax, edx, 0x10
    mov dword [LINK_ADDRESS_103], eax
    mov eax, dword [LINK_ADDRESS_147]
    mov edx, dword [LINK_ADDRESS_147]
    sar eax, 1
    sub edx, eax
    mov eax, edx
    mov edx, dword [LINK_ADDRESS_147]
    sar edx, 2
    add edx, eax
    mov eax, dword [LINK_ADDRESS_106]
    imul edx
    shrd eax, edx, 0x10
    mov dword [LINK_ADDRESS_106], eax
loc_1b77:
    cmp di, 1
    je short loc_1b84
    cmp byte [esp + 0x44], 1
    jne short loc_1b8b
loc_1b84:
    mov edx, 0x400
    jmp short loc_1b90
loc_1b8b:
    mov edx, 0x1400
loc_1b90:
    push 0x10001
    push edx
    push 0x400
    push 0xa4
    mov ebx, dword [LINK_ADDRESS_106]
    mov eax, LINK_ADDRESS_101
    push ebx
    mov ecx, dword [LINK_ADDRESS_103]
    mov edx, LINK_ADDRESS_104
    push ecx
    mov ebx, LINK_ADDRESS_107
    mov ecx, LINK_ADDRESS_112
    call LINK_ADDRESS_140
    push 0x10001
    push 0x400
    push 0x400
    mov ecx, LINK_ADDRESS_112
    mov ebx, LINK_ADDRESS_107
    push 0xa4
    mov edx, LINK_ADDRESS_104
    mov eax, LINK_ADDRESS_101
    call LINK_ADDRESS_141
    cmp byte [esi + 0x3cb], 0
    jne short loc_1c1a
    cmp di, 1
    je short loc_1c1a
    cmp di, 2
    je short loc_1c1a
    cmp byte [esp + 0x40], 0
    je short loc_1c1a
    add dword [LINK_ADDRESS_107], 0x1e00
loc_1c1a:
    test byte [esp + 0x32], 4
    jne short loc_1c2a
    cmp byte [LINK_ADDRESS_120], 0
    je short loc_1c31
loc_1c2a:
    mov byte [LINK_ADDRESS_121], 9
loc_1c31:
    mov ax, word [LINK_ADDRESS_113]
    mov bl, byte [esp + 0x31]
    db 0x05, 0x06, 0x00, 0x00, 0x00    ; add eax, 6
    test bl, 0x20
    je short loc_1c63
    mov byte [LINK_ADDRESS_121], 9
    test byte [esp + 0x30], 0x20
    je short loc_1c59
    mov word [LINK_ADDRESS_113], ax
loc_1c59:
    add word [LINK_ADDRESS_113], 6
    jmp short loc_1cc0
loc_1c63:
    mov dx, word [LINK_ADDRESS_113]
    sub edx, 6
    test bl, 0x40
    je short loc_1c89
    mov byte [LINK_ADDRESS_121], 9
    test byte [esp + 0x30], 0x20
    je short loc_1cb8
    mov word [LINK_ADDRESS_113], dx
    jmp short loc_1cb8
loc_1c89:
    mov cl, byte [esp + 0x30]
    test cl, 8
    je short loc_1ca7
    test cl, 0x20
    je short loc_1c9d
    mov word [LINK_ADDRESS_113], ax
loc_1c9d:
    add word [LINK_ADDRESS_113], 6
    jmp short loc_1cc0
loc_1ca7:
    test cl, 0x10
    je short loc_1cc0
    test cl, 0x20
    je short loc_1cb8
    mov word [LINK_ADDRESS_113], dx
loc_1cb8:
    sub word [LINK_ADDRESS_113], 6
loc_1cc0:
    cmp byte [LINK_ADDRESS_121], 0
    jbe short loc_1d02
    mov ah, byte [esp + 0x31]
    test ah, 0x20
    jne short loc_1d02
    test ah, 0x40
    jne short loc_1d02
    movsx ecx, word [LINK_ADDRESS_113]
    mov ebx, 3
    mov edx, ecx
    mov eax, ecx
    sar edx, 0x1f
    idiv ebx
    dec byte [LINK_ADDRESS_121]
    mov edx, 0x21
    sub edx, eax
    add ecx, edx
    mov word [LINK_ADDRESS_113], cx
loc_1d02:
    cmp dword [esi + 0x280], 0
    je short loc_1d22
    movsx edx, byte [ebp + 1]
    movsx eax, word [LINK_ADDRESS_113]
    sar edx, 1
    add eax, edx
    mov word [LINK_ADDRESS_113], ax
    jmp short loc_1d5d
loc_1d22:
    mov bx, word [LINK_ADDRESS_113]
    cmp bx, 0x5f
    jle short loc_1d3e
    cmp bx, 0x69
    jge short loc_1d3e
    mov word [LINK_ADDRESS_113], 0x64
loc_1d3e:
    movsx eax, word [LINK_ADDRESS_115]
    cmp eax, -5
    jle short loc_1d5d
    cmp word [LINK_ADDRESS_115], 5
    jge short loc_1d5d
    xor edx, edx
    mov word [LINK_ADDRESS_115], dx
loc_1d5d:
    mov bl, byte [LINK_ADDRESS_120]
    test bl, bl
    jbe short loc_1d88
    mov bh, bl
    dec bh
    xor eax, eax
    mov byte [LINK_ADDRESS_120], bh
    mov al, bh
    mov bx, word [LINK_ADDRESS_113]
    shl eax, 4
    sub ebx, eax
    mov word [LINK_ADDRESS_113], bx
loc_1d88:
    mov cx, word [LINK_ADDRESS_113]
    cmp cx, 0x12b
    jle short loc_1da1
    mov word [LINK_ADDRESS_113], 0x12b
    jmp short loc_1db2
loc_1da1:
    movsx eax, cx
    cmp eax, -0x63
    jge short loc_1db2
    mov word [LINK_ADDRESS_113], 0xff9d
loc_1db2:
    cmp word [esi + 0x328], 0
    jle short loc_1dd5
    mov bx, word [LINK_ADDRESS_113]
    mov cl, 9
    sub ebx, 0x30
    mov byte [LINK_ADDRESS_121], cl
    mov word [LINK_ADDRESS_113], bx
loc_1dd5:
    mov edx, dword [LINK_ADDRESS_93]
    and edx, 0xff
    lea eax, [edx*4]
    mov ebx, dword [LINK_ADDRESS_101]
    mov dword [eax + LINK_ADDRESS_96], ebx
    mov ebx, dword [LINK_ADDRESS_104]
    mov dword [eax + LINK_ADDRESS_97], ebx
    mov ebx, dword [LINK_ADDRESS_107]
    mov dword [eax + LINK_ADDRESS_98], ebx
    db 0x8d, 0x1c, 0x55, 0x00, 0x00, 0x00, 0x00    ; lea ebx, [edx*2]
    mov ecx, dword [LINK_ADDRESS_93]
    mov dx, word [LINK_ADDRESS_110]
    inc ecx
    mov word [ebx + LINK_ADDRESS_100], dx
    movsx edx, word [LINK_ADDRESS_113]
    mov dword [LINK_ADDRESS_93], ecx
    mov dword [eax + LINK_ADDRESS_99], edx
    movsx eax, word [esi + 0x340]
    imul eax, eax, 0x2c
    mov edx, dword [esp + 0x3c]
    mov word [eax + LINK_ADDRESS_122], dx
    add esp, 0x48
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
loc_1e60:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov dx, word [CONNECTHEAD]
    jmp near loc_2021
loc_1e72:
    movsx ebx, dx
    lea eax, [ebx*4]
    add eax, ebx
    add eax, eax
    test byte [eax + LINK_ADDRESS_149], 2
    je near loc_2016
    mov bh, 2
    mov byte [LINK_ADDRESS_150], dl
    mov byte [LINK_ADDRESS_151], bh
    mov ebx, dword [eax + LINK_ADDRESS_152]
    mov eax, dword [eax + LINK_ADDRESS_152]
    shr ebx, 0x12
    shr eax, 0x13
    and ebx, 1
    and eax, 0xf
    mov byte [LINK_ADDRESS_153], bl
    mov byte [LINK_ADDRESS_154], al
    test bl, bl
    je near loc_1f80
    movsx eax, al
    call LINK_ADDRESS_155
    xor al, al
    mov bx, word [MYCONNECTINDEX]
    mov byte [LINK_ADDRESS_151], al
    movsx ax, byte [LINK_ADDRESS_150]
    cmp ax, bx
    je short loc_1f42
    movsx eax, byte [LINK_ADDRESS_150]
    mov edx, LINK_ADDRESS_21
    shl eax, 5
    add edx, eax
    mov eax, LINK_ADDRESS_156
    call STRCPY
    mov edx, LINK_ADDRESS_158
    mov eax, LINK_ADDRESS_156
    call STRCAT
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_26
    add eax, eax
    add edx, eax
    mov eax, 0x7a
    call LINK_ADDRESS_160
    jmp near loc_202a
loc_1f42:
    mov edx, LINK_ADDRESS_161
    mov eax, LINK_ADDRESS_156
    call STRCPY
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_26
    add eax, eax
    add edx, eax
    mov eax, 0x7a
    call LINK_ADDRESS_160
    jmp near loc_202a
loc_1f80:
    movsx eax, al
    call LINK_ADDRESS_162
    mov byte [LINK_ADDRESS_151], bl
    test ax, ax
    jne near loc_2016
    movsx ax, byte [LINK_ADDRESS_150]
    cmp ax, word [MYCONNECTINDEX]
    je short loc_1fd4
    movsx eax, byte [LINK_ADDRESS_150]
    mov edx, LINK_ADDRESS_21
    shl eax, 5
    add edx, eax
    mov eax, LINK_ADDRESS_156
    call STRCPY
    mov edx, LINK_ADDRESS_163
    mov eax, LINK_ADDRESS_156
    call STRCAT
    jmp short loc_1fe3
loc_1fd4:
    mov edx, LINK_ADDRESS_164
    mov eax, LINK_ADDRESS_156
    call STRCPY
loc_1fe3:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_26
    add eax, eax
    add edx, eax
    mov eax, 0x7a
    call LINK_ADDRESS_160
    mov al, 1
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_2016:
    movsx eax, dx
    mov dx, word [nosplit eax*2 + CONNECTPOINT2]
loc_2021:
    test dx, dx
    jge near loc_1e72
loc_202a:
    mov ecx, 0xffffffff
    mov edx, dword [LINK_ADDRESS_72]
    mov ah, byte [LINK_ADDRESS_165]
    add edx, 4
    mov word [LINK_ADDRESS_91], cx
    mov dword [LINK_ADDRESS_72], edx
    test ah, ah
    jbe short loc_2059
    mov dl, ah
    dec dl
    mov byte [LINK_ADDRESS_165], dl
loc_2059:
    mov dh, byte [LINK_ADDRESS_166]
    test dh, dh
    jbe short loc_206d
    mov bl, dh
    dec bl
    mov byte [LINK_ADDRESS_166], bl
loc_206d:
    xor edx, edx
    jmp short loc_2097
loc_2071:
    movsx eax, dx
    add eax, eax
    mov si, word [eax + LINK_ADDRESS_167]
    test si, si
    je short loc_2096
    mov edi, esi
    dec di
    mov word [eax + LINK_ADDRESS_167], di
    jne short loc_2096
    mov byte [LINK_ADDRESS_55], 1
loc_2096:
    inc edx
loc_2097:
    cmp dx, 4
    jl short loc_2071
    mov eax, dword [LINK_ADDRESS_168]
    sub eax, dword [LINK_ADDRESS_169]
    test eax, eax
    jns short loc_20ae
    neg eax
loc_20ae:
    cmp eax, 0x10
    jg short loc_20d8
    cmp dword [LINK_ADDRESS_170], 8
    jg short loc_20d8
    mov ebx, dword [LINK_ADDRESS_168]
    sub ebx, dword [LINK_ADDRESS_169]
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    add dword [LINK_ADDRESS_169], eax
    jmp short loc_20e2
loc_20d8:
    mov eax, dword [LINK_ADDRESS_168]
    mov dword [LINK_ADDRESS_169], eax
loc_20e2:
    mov ebp, dword [LINK_ADDRESS_171]
    test ebp, ebp
    jle short loc_2106
    lea eax, [ebp - 1]
    mov dword [LINK_ADDRESS_171], eax
    test eax, eax
    jne short loc_2106
    mov bh, 1
    mov byte [LINK_ADDRESS_56], bh
    mov byte [LINK_ADDRESS_55], bh
loc_2106:
    mov ch, byte [LINK_ADDRESS_172]
    inc ch
    mov dx, word [CONNECTHEAD]
    mov byte [LINK_ADDRESS_172], ch
    jmp near loc_219e
loc_2120:
    mov edi, LINK_ADDRESS_46
    mov ebx, dword [LINK_ADDRESS_95]
    mov ecx, 0xa
    and ebx, 0xff
    movsx edx, dx
    lea eax, [ebx*4]
    lea esi, [edx*4]
    add eax, ebx
    add esi, edx
    shl eax, 5
    add esi, esi
    add eax, LINK_ADDRESS_76
    add edi, esi
    add esi, eax
    cmp ecx, 4
    jae short loc_216b
    test cl, 1
    je short loc_2164
    db 0xa4    ; movsb byte es:[edi], byte [esi]
loc_2164:
    shr ecx, 1
    db 0xf3, 0x66, 0xa5    ; rep movsw word es:[edi], word [esi]
    jmp short loc_2196
loc_216b:
    test edi, 1
    je short loc_2175
    db 0xa4    ; movsb byte es:[edi], byte [esi]
    dec ecx
loc_2175:
    test edi, 2
    je short loc_2182
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
    sub ecx, 2
loc_2182:
    mov ebx, ecx
    shr ecx, 2
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    test bl, 2
    je short loc_2190
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
loc_2190:
    test bl, 1
    je short loc_2196
    db 0xa4    ; movsb byte es:[edi], byte [esi]
loc_2196:
    mov dx, word [nosplit edx*2 + CONNECTPOINT2]
loc_219e:
    test dx, dx
    jge near loc_2120
    mov ebx, dword [LINK_ADDRESS_95]
    inc ebx
    mov ecx, 0xffffffff
    mov dword [LINK_ADDRESS_95], ebx
    call LINK_ADDRESS_173
    mov dx, word [CONNECTHEAD]
    jmp near loc_231e
loc_21ca:
    movsx ebx, dx
    lea eax, [ebx*4]
    add eax, ebx
    test byte [nosplit eax*2 + LINK_ADDRESS_174], 4
    jne short loc_21e7
    mov ecx, edx
    jmp near loc_2313
loc_21e7:
    call loc_05d0
    cmp dx, word [MYCONNECTINDEX]
    jne short loc_21ff
    mov eax, 0xf8
    call LINK_ADDRESS_175
loc_21ff:
    mov di, word [LINK_ADDRESS_78]
    cmp dx, di
    jne short loc_222d
    movsx eax, di
    mov ax, word [nosplit eax*2 + CONNECTPOINT2]
    mov word [LINK_ADDRESS_78], ax
    test ax, ax
    jge short loc_222d
    mov ax, word [CONNECTHEAD]
    mov word [LINK_ADDRESS_78], ax
loc_222d:
    mov bx, word [CONNECTHEAD]
    cmp dx, bx
    jne short loc_224c
    movsx eax, bx
    mov ax, word [nosplit eax*2 + CONNECTPOINT2]
    mov word [CONNECTHEAD], ax
    jmp short loc_2268
loc_224c:
    movsx eax, dx
    db 0x8d, 0x1c, 0x45, 0x00, 0x00, 0x00, 0x00    ; lea ebx, [eax*2]
    movsx eax, cx
    mov bx, word [ebx + CONNECTPOINT2]
    mov word [nosplit eax*2 + CONNECTPOINT2], bx
loc_2268:
    dec word [NUMPLAYERS]
    mov esi, dword [LINK_ADDRESS_15]
    dec esi
    mov di, word [NUMPLAYERS]
    mov dword [LINK_ADDRESS_15], esi
    cmp di, 2
    jge short loc_2293
    mov eax, 0xb1
    call LINK_ADDRESS_176
loc_2293:
    mov bh, 1
    mov byte [LINK_ADDRESS_55], bh
    mov byte [LINK_ADDRESS_56], bh
    movsx ebx, dx
    call LINK_ADDRESS_177
    mov eax, ebx
    shl eax, 5
    add eax, LINK_ADDRESS_21
    push eax
    push LINK_ADDRESS_178
    push LINK_ADDRESS_179
    call SPRINTF
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea ebx, [eax + eax]
    mov eax, LINK_ADDRESS_26
    add esp, 0xc
    add eax, ebx
    call LINK_ADDRESS_181
    movsx eax, word [ebx + LINK_ADDRESS_182]
    call LINK_ADDRESS_183
    mov eax, LINK_ADDRESS_179
    call 0x107a0
    test cx, cx
    jge short loc_2313
    cmp byte [LINK_ADDRESS_184], 0
    jne short loc_2313
    mov eax, LINK_ADDRESS_185
    call LINK_ADDRESS_175
loc_2313:
    movsx eax, dx
    mov dx, word [nosplit eax*2 + CONNECTPOINT2]
loc_231e:
    test dx, dx
    jge near loc_21ca
    cmp word [NUMPLAYERS], 2
    jl near loc_23d3
    mov eax, dword [LINK_ADDRESS_95]
    and eax, 7
    cmp eax, 7
    jne near loc_23d3
    mov cl, byte [RANDOMSEED]
    mov dx, word [CONNECTHEAD]
    jmp short loc_239d
loc_2355:
    movsx edi, dx
    mov eax, edi
    shl eax, 7
    sub eax, edi
    lea eax, [eax*4]
    sub eax, edi
    mov dl, byte [nosplit eax*2 + LINK_ADDRESS_187]
    mov dh, byte [nosplit eax*2 + LINK_ADDRESS_188]
    mov bl, byte [nosplit eax*2 + LINK_ADDRESS_189]
    add dl, dh
    add dl, bl
    mov bh, byte [nosplit eax*2 + LINK_ADDRESS_190]
    mov al, byte [nosplit eax*2 + LINK_ADDRESS_191]
    add dl, bh
    add al, dl
    mov dx, word [nosplit edi*2 + CONNECTPOINT2]
    add cl, al
loc_239d:
    test dx, dx
    jge short loc_2355
    movsx edx, word [MYCONNECTINDEX]
    lea eax, [edx*4]
    mov ebx, dword [eax + LINK_ADDRESS_192]
    mov edi, dword [eax + LINK_ADDRESS_192]
    and ebx, 0xff
    shl edx, 8
    inc edi
    mov byte [edx + ebx + LINK_ADDRESS_193], cl
    mov dword [eax + LINK_ADDRESS_192], edi
loc_23d3:
    cmp dword [LINK_ADDRESS_38], 1
    jne short loc_23e1
    call loc_04d0
loc_23e1:
    cmp word [LINK_ADDRESS_35], 0
    jne short loc_23fb
    call LINK_ADDRESS_194
    mov word [LINK_ADDRESS_195], ax
    call LINK_ADDRESS_196
loc_23fb:
    mov dx, word [CONNECTHEAD]
    jmp short loc_2431
loc_2404:
    movsx ebx, dx
    mov eax, ebx
    call LINK_ADDRESS_197
    cmp word [LINK_ADDRESS_35], 0
    jne short loc_2426
    mov eax, ebx
    call LINK_ADDRESS_198
    mov eax, ebx
    call LINK_ADDRESS_199
loc_2426:
    movsx edx, dx
    mov dx, word [nosplit edx*2 + CONNECTPOINT2]
loc_2431:
    test dx, dx
    jge short loc_2404
    cmp word [LINK_ADDRESS_35], 0
    jne short loc_2477
    call LINK_ADDRESS_200
    call LINK_ADDRESS_201
    call LINK_ADDRESS_202
    call LINK_ADDRESS_203
    call LINK_ADDRESS_204
    call LINK_ADDRESS_205
    call LINK_ADDRESS_206
    call LINK_ADDRESS_207
    call LINK_ADDRESS_208
    call LINK_ADDRESS_209
    call LINK_ADDRESS_210
loc_2477:
    call loc_0c90
    test byte [LINK_ADDRESS_172], 1
    jne short loc_2494
    call LINK_ADDRESS_211
    call LINK_ADDRESS_212
    call LINK_ADDRESS_213
loc_2494:
    xor al, al
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea eax, [byte eax + 0]
