; Game packet dispatch and match-state updates.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x20
    cmp byte [LINK_ADDRESS_1], 0
    jne short loc_003f
    cmp byte [LINK_ADDRESS_2], 0
    je short loc_003f
    cmp byte [LINK_ADDRESS_3], 0
    je short loc_003f
    cmp byte [LINK_ADDRESS_4], 0
    je short loc_003f
    mov bh, 1
    mov eax, 0x8c
    mov byte [LINK_ADDRESS_1], bh
    call LINK_ADDRESS_5
loc_003f:
    cmp word [NUMPLAYERS], 2
    jl near loc_10da
loc_004d:
    mov edx, LINK_ADDRESS_7
    lea eax, [esp + 0x1c]
    call LINK_ADDRESS_8
    mov edx, eax
    mov dword [esp + 0x18], eax
    test ax, ax
    jle near loc_10da
    mov al, byte [LINK_ADDRESS_7]
    cmp al, 8
    jb short loc_00b1
    jbe near loc_0b84
    cmp al, 0x7e
    jb short loc_0093
    jbe short loc_00df
    cmp al, 0xfa
    jb short loc_004d
    jbe near loc_10bb
    cmp al, 0xff
    je near loc_10cb
    jmp short loc_004d
loc_0093:
    cmp al, 0x10
    jb short loc_00a7
    jbe near loc_0cd4
    cmp al, 0x11
    je near loc_0d01
    jmp short loc_004d
loc_00a7:
    cmp al, 9
    je near loc_0ab7
    jmp short loc_004d
loc_00b1:
    cmp al, 4
    jb short loc_00ce
    jbe near loc_092c
    cmp al, 6
    jb near loc_096f
    jbe near loc_0a6f
    jmp near loc_0af5
loc_00ce:
    test al, al
    jbe short loc_0116
    cmp al, 1
    je near loc_05bc
    jmp near loc_004d
loc_00df:
    xor al, al
    mov byte [LINK_ADDRESS_9], al
    mov al, byte [esp + 0x1c]
    mov byte [LINK_ADDRESS_10], al
    mov al, byte [LINK_ADDRESS_11]
    mov ch, 2
    mov byte [LINK_ADDRESS_12], al
    movsx eax, al
    mov byte [LINK_ADDRESS_13], ch
    call LINK_ADDRESS_14
    xor ah, ah
    mov byte [LINK_ADDRESS_13], ah
    jmp near loc_004d
loc_0116:
    movsx eax, word [esp + 0x1c]
    mov bh, byte [eax*4 + LINK_ADDRESS_15]
    mov ebp, 1
    test bh, 0x1f
    jne short loc_016a
    movsx eax, word [CONNECTHEAD]
    movsx edx, word [nosplit eax*2 + CONNECTPOINT2]
    jmp short loc_0166
loc_013d:
    cmp byte [edx + LINK_ADDRESS_18], 0
    je short loc_015e
    movsx eax, word [MYCONNECTINDEX]
    cmp edx, eax
    jne short loc_015d
    movsx eax, byte [ebp + LINK_ADDRESS_7]
    mov dword [LINK_ADDRESS_20], eax
loc_015d:
    inc ebp
loc_015e:
    movsx edx, word [nosplit edx*2 + CONNECTPOINT2]
loc_0166:
    test edx, edx
    jge short loc_013d
loc_016a:
    movsx ecx, word [CONNECTHEAD]
    mov ebx, dword [ecx*4 + LINK_ADDRESS_15]
    dec ebx
    and ebx, 0xff
    lea eax, [ebx*4]
    mov edx, dword [ecx*4 + LINK_ADDRESS_15]
    add eax, ebx
    mov ebx, LINK_ADDRESS_21
    shl eax, 5
    and edx, 0xff
    add ebx, eax
    lea eax, [edx*4]
    add eax, edx
    mov edx, LINK_ADDRESS_21
    shl eax, 5
    mov dword [esp + 8], ebp
    add edx, eax
    mov dword [esp + 0xc], ebx
    mov dword [esp + 0x14], edx
    mov edx, ecx
    test edx, edx
    jge short loc_01d0
    movsx edx, word [CONNECTHEAD]
    jmp near loc_0474
loc_01d0:
    xor eax, eax
    mov al, byte [edx + LINK_ADDRESS_18]
    movsx edx, word [nosplit edx*2 + CONNECTPOINT2]
    add ebp, eax
    test edx, edx
    jge short loc_01d0
    movsx edx, word [CONNECTHEAD]
    jmp near loc_0474
loc_01f2:
    cmp byte [edx + LINK_ADDRESS_18], 0
    je near loc_046c
    mov ebx, dword [esp + 8]
    xor eax, eax
    mov al, byte [ebx + LINK_ADDRESS_7]
    lea ecx, [ebx + 1]
    mov dword [esp + 4], eax
    movsx eax, word [MYCONNECTINDEX]
    mov dword [esp + 8], ecx
    cmp edx, eax
    jne short loc_0284
    mov ebx, dword [esp + 4]
    mov eax, dword [esp + 4]
    and ebx, 1
    and eax, 2
    add ebx, ebx
    add ebx, eax
    mov eax, dword [esp + 4]
    and eax, 4
    sar eax, 2
    add eax, ebx
    mov ebx, dword [esp + 4]
    and ebx, 8
    sar ebx, 3
    add ebx, eax
    mov eax, dword [esp + 4]
    and eax, 0x10
    sar eax, 4
    add ebx, eax
    mov eax, dword [esp + 4]
    and eax, 0x20
    sar eax, 5
    add ebx, eax
    mov eax, dword [esp + 4]
    and eax, 0x40
    sar eax, 6
    add ebx, eax
    mov eax, dword [esp + 4]
    and eax, 0x80
    sar eax, 7
    add eax, ebx
    add ebp, eax
    jmp near loc_046c
loc_0284:
    lea eax, [edx*4]
    mov ebx, dword [esp + 0x14]
    add eax, edx
    mov esi, dword [esp + 0xc]
    add eax, eax
    mov ecx, 0xa
    add ebx, eax
    add esi, eax
    mov edi, ebx
    mov dword [esp + 0x10], ebx
    cmp ecx, 4
    jae short loc_02b8
    test cl, 1
    je short loc_02b1
    movsb
loc_02b1:
    shr ecx, 1
    db 0xf3
    movsw
    jmp short loc_02e3
loc_02b8:
    test edi, 1
    je short loc_02c2
    movsb
    dec ecx
loc_02c2:
    test edi, 2
    je short loc_02cf
    movsw
    sub ecx, 2
loc_02cf:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_02dd
    movsw
loc_02dd:
    test bl, 1
    je short loc_02e3
    movsb
loc_02e3:
    test byte [esp + 4], 1
    je short loc_030a
    xor eax, eax
    xor ebx, ebx
    mov al, byte [ebp + LINK_ADDRESS_11]
    mov bl, byte [ebp + LINK_ADDRESS_7]
    shl eax, 8
    add eax, ebx
    mov ebx, dword [esp + 0x10]
    add ebp, 2
    mov word [ebx + 2], ax
loc_030a:
    test byte [esp + 4], 2
    je short loc_033e
    xor eax, eax
    xor ecx, ecx
    mov al, byte [ebp + LINK_ADDRESS_11]
    mov cl, byte [ebp + LINK_ADDRESS_7]
    shl eax, 8
    add ecx, eax
    lea eax, [edx*4]
    add eax, edx
    mov esi, dword [esp + 0x14]
    add eax, eax
    add eax, esi
    add ebp, 2
    mov word [eax + 4], cx
loc_033e:
    test byte [esp + 4], 4
    je short loc_0361
    lea eax, [edx*4]
    add eax, edx
    mov ebx, dword [esp + 0x14]
    add eax, eax
    mov ecx, ebp
    add ebx, eax
    mov al, byte [ecx + LINK_ADDRESS_7]
    inc ebp
    mov byte [ebx], al
loc_0361:
    test byte [esp + 4], 8
    je short loc_038e
    mov ebx, edx
    lea eax, [edx*4]
    add eax, edx
    mov edi, dword [esp + 0x14]
    add eax, eax
    add eax, edi
    xor ebx, edx
    mov ecx, dword [eax + 6]
    mov bl, byte [ebp + LINK_ADDRESS_7]
    xor cl, cl
    or ebx, ecx
    inc ebp
    mov dword [eax + 6], ebx
loc_038e:
    test byte [esp + 4], 0x10
    je short loc_03bc
    lea eax, [edx*4]
    add eax, edx
    mov ebx, dword [esp + 0x14]
    add eax, eax
    add eax, ebx
    xor ebx, ebx
    mov ecx, dword [eax + 6]
    mov bl, byte [ebp + LINK_ADDRESS_7]
    xor ch, ch
    shl ebx, 8
    or ebx, ecx
    inc ebp
    mov dword [eax + 6], ebx
loc_03bc:
    test byte [esp + 4], 0x20
    je short loc_03f0
    mov ebx, edx
    lea eax, [edx*4]
    add eax, edx
    mov ecx, dword [esp + 0x14]
    add eax, eax
    xor ebx, edx
    add eax, ecx
    mov bl, byte [ebp + LINK_ADDRESS_7]
    mov ecx, dword [eax + 6]
    shl ebx, 0x10
    and ecx, 0xff00ffff
    or ebx, ecx
    inc ebp
    mov dword [eax + 6], ebx
loc_03f0:
    test byte [esp + 4], 0x40
    je short loc_0422
    lea eax, [edx*4]
    add eax, edx
    mov esi, dword [esp + 0x14]
    add eax, eax
    xor ecx, ecx
    add eax, esi
    mov cl, byte [ebp + LINK_ADDRESS_7]
    mov ebx, dword [eax + 6]
    shl ecx, 0x18
    and ebx, 0xffffff
    or ebx, ecx
    inc ebp
    mov dword [eax + 6], ebx
loc_0422:
    test byte [esp + 4], 0x80
    je short loc_0446
    lea eax, [edx*4]
    add eax, edx
    mov ebx, dword [esp + 0x14]
    add eax, eax
    mov ecx, ebp
    add ebx, eax
    mov al, byte [ecx + LINK_ADDRESS_7]
    inc ebp
    mov byte [ebx + 1], al
loc_0446:
    lea eax, [edx*4]
    add eax, edx
    mov edi, dword [esp + 0x14]
    add eax, eax
    add eax, edi
    test byte [eax + 9], 4
    je short loc_0465
    xor ch, ch
    mov byte [edx + LINK_ADDRESS_18], ch
loc_0465:
    inc dword [edx*4 + LINK_ADDRESS_15]
loc_046c:
    movsx edx, word [nosplit edx*2 + CONNECTPOINT2]
loc_0474:
    test edx, edx
    jge near loc_01f2
loc_047c:
    movsx eax, word [esp + 0x18]
    cmp ebp, eax
    je short loc_04cf
    movsx edx, word [CONNECTHEAD]
    movsx eax, word [MYCONNECTINDEX]
    jmp short loc_04c8
loc_0495:
    cmp edx, eax
    je short loc_04c0
    mov ebx, dword [edx*4 + LINK_ADDRESS_22]
    mov esi, edx
    and ebx, 0xff
    shl esi, 8
    add esi, ebx
    mov bl, byte [ebp + LINK_ADDRESS_7]
    mov byte [esi + LINK_ADDRESS_23], bl
    inc dword [edx*4 + LINK_ADDRESS_22]
loc_04c0:
    movsx edx, word [nosplit edx*2 + CONNECTPOINT2]
loc_04c8:
    test edx, edx
    jge short loc_0495
    inc ebp
    jmp short loc_047c
loc_04cf:
    movsx edx, word [CONNECTHEAD]
    jmp near loc_059a
loc_04db:
    movsx eax, word [MYCONNECTINDEX]
    cmp edx, eax
    je near loc_0592
    mov ebp, 1
    jmp near loc_0583
loc_04f4:
    lea eax, [edx*4]
    mov esi, dword [eax + LINK_ADDRESS_15]
    and esi, 0xff
    mov dword [esp], eax
    lea eax, [esi*4]
    add eax, esi
    mov edi, LINK_ADDRESS_21
    shl eax, 5
    add edi, eax
    lea eax, [edx*4]
    add eax, edx
    mov ecx, 0xa
    add eax, eax
    mov esi, dword [esp + 0x14]
    add edi, eax
    add esi, eax
    cmp ecx, 4
    jae short loc_0547
    test cl, 1
    je short loc_0540
    movsb
loc_0540:
    shr ecx, 1
    db 0xf3
    movsw
    jmp short loc_0572
loc_0547:
    test edi, 1
    je short loc_0551
    movsb
    dec ecx
loc_0551:
    test edi, 2
    je short loc_055e
    movsw
    sub ecx, 2
loc_055e:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_056c
    movsw
loc_056c:
    test bl, 1
    je short loc_0572
    movsb
loc_0572:
    mov eax, dword [esp]
    mov esi, dword [eax + LINK_ADDRESS_15]
    inc esi
    inc ebp
    mov dword [eax + LINK_ADDRESS_15], esi
loc_0583:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_24]
    cmp ebp, eax
    jl near loc_04f4
loc_0592:
    movsx edx, word [nosplit edx*2 + CONNECTPOINT2]
loc_059a:
    test edx, edx
    jge near loc_04db
    xor eax, eax
    mov ecx, dword [LINK_ADDRESS_25]
    mov al, byte [LINK_ADDRESS_24]
    add ecx, eax
    mov dword [LINK_ADDRESS_25], ecx
    jmp near loc_004d
loc_05bc:
    movsx edx, word [esp + 0x1c]
    mov edx, dword [edx*4 + LINK_ADDRESS_15]
    xor eax, eax
    dec edx
    mov al, byte [LINK_ADDRESS_11]
    and edx, 0xff
    mov dword [esp + 8], eax
    lea eax, [edx*4]
    add eax, edx
    mov edx, LINK_ADDRESS_21
    shl eax, 5
    add edx, eax
    movsx eax, word [esp + 0x1c]
    mov dword [esp + 0xc], edx
    mov edx, dword [eax*4 + LINK_ADDRESS_15]
    and edx, 0xff
    lea eax, [edx*4]
    add eax, edx
    mov edx, LINK_ADDRESS_21
    shl eax, 5
    add edx, eax
    mov dword [esp + 0x14], edx
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    mov edi, dword [esp + 0x14]
    add eax, eax
    movsx edx, word [esp + 0x1c]
    add edi, eax
    lea eax, [edx*4]
    add eax, edx
    mov esi, dword [esp + 0xc]
    add eax, eax
    mov ecx, 0xa
    add esi, eax
    cmp ecx, 4
    jae short loc_065d
    test cl, 1
    je short loc_0656
    movsb
loc_0656:
    shr ecx, 1
    db 0xf3
    movsw
    jmp short loc_0688
loc_065d:
    test edi, 1
    je short loc_0667
    movsb
    dec ecx
loc_0667:
    test edi, 2
    je short loc_0674
    movsw
    sub ecx, 2
loc_0674:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_0682
    movsw
loc_0682:
    test bl, 1
    je short loc_0688
    movsb
loc_0688:
    mov bh, byte [esp + 8]
    mov ebp, 2
    test bh, 1
    je short loc_06c7
    xor eax, eax
    xor ebx, ebx
    mov al, byte [ebp + LINK_ADDRESS_11]
    mov bl, byte [ebp + LINK_ADDRESS_7]
    shl eax, 8
    movsx edx, word [esp + 0x1c]
    add ebx, eax
    lea eax, [edx*4]
    add eax, edx
    mov esi, dword [esp + 0x14]
    add eax, eax
    add eax, esi
    add ebp, ebp
    mov word [eax + 2], bx
loc_06c7:
    test byte [esp + 8], 2
    je short loc_0702
    xor eax, eax
    xor edx, edx
    mov al, byte [ebp + LINK_ADDRESS_11]
    mov dl, byte [ebp + LINK_ADDRESS_7]
    shl eax, 8
    mov ebx, edx
    movsx edx, word [esp + 0x1c]
    add ebx, eax
    lea eax, [edx*4]
    add eax, edx
    mov edi, dword [esp + 0x14]
    add eax, eax
    add eax, edi
    add ebp, 2
    mov word [eax + 4], bx
loc_0702:
    test byte [esp + 8], 4
    je short loc_072a
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [esp + 0x14]
    add eax, eax
    mov ebx, ebp
    add edx, eax
    mov al, byte [ebx + LINK_ADDRESS_7]
    inc ebp
    mov byte [edx], al
loc_072a:
    test byte [esp + 8], 8
    je short loc_075a
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [esp + 0x14]
    add eax, eax
    add eax, edx
    xor edx, edx
    mov ebx, dword [eax + 6]
    mov dl, byte [ebp + LINK_ADDRESS_7]
    xor bl, bl
    or edx, ebx
    inc ebp
    mov dword [eax + 6], edx
loc_075a:
    test byte [esp + 8], 0x10
    je short loc_078d
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    mov ebx, dword [esp + 0x14]
    add eax, eax
    xor edx, edx
    add eax, ebx
    mov dl, byte [ebp + LINK_ADDRESS_7]
    mov ebx, dword [eax + 6]
    shl edx, 8
    xor bh, bh
    or edx, ebx
    inc ebp
    mov dword [eax + 6], edx
loc_078d:
    test byte [esp + 8], 0x20
    je short loc_07c4
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    mov ecx, dword [esp + 0x14]
    add eax, eax
    xor edx, edx
    add eax, ecx
    mov dl, byte [ebp + LINK_ADDRESS_7]
    mov ebx, dword [eax + 6]
    shl edx, 0x10
    and ebx, 0xff00ffff
    or edx, ebx
    inc ebp
    mov dword [eax + 6], edx
loc_07c4:
    test byte [esp + 8], 0x40
    je short loc_07fb
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    mov esi, dword [esp + 0x14]
    add eax, eax
    xor edx, edx
    add eax, esi
    mov dl, byte [ebp + LINK_ADDRESS_7]
    mov ebx, dword [eax + 6]
    shl edx, 0x18
    and ebx, 0xffffff
    or edx, ebx
    inc ebp
    mov dword [eax + 6], edx
loc_07fb:
    test byte [esp + 8], 0x80
    je short loc_0824
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [esp + 0x14]
    add eax, eax
    mov ebx, ebp
    add edx, eax
    mov al, byte [ebx + LINK_ADDRESS_7]
    inc ebp
    mov byte [edx + 1], al
loc_0824:
    movsx eax, word [esp + 0x1c]
    inc dword [eax*4 + LINK_ADDRESS_15]
loc_0830:
    movsx eax, word [esp + 0x18]
    cmp ebp, eax
    je short loc_0873
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    mov esi, dword [eax + LINK_ADDRESS_22]
    mov edi, ebp
    and esi, 0xff
    shl edx, 8
    mov bl, byte [edi + LINK_ADDRESS_7]
    mov byte [edx + esi + LINK_ADDRESS_23], bl
    mov edx, dword [eax + LINK_ADDRESS_22]
    inc edx
    inc ebp
    mov dword [eax + LINK_ADDRESS_22], edx
    jmp short loc_0830
loc_0873:
    mov edx, 1
    xor eax, eax
    mov al, byte [LINK_ADDRESS_24]
    cmp edx, eax
    jl short loc_0888
    jmp near loc_004d
loc_0888:
    movsx edi, word [esp + 0x1c]
    mov esi, dword [edi*4 + LINK_ADDRESS_15]
    and esi, 0xff
    lea eax, [esi*4]
    add eax, esi
    mov ebp, LINK_ADDRESS_21
    shl eax, 5
    add ebp, eax
    lea eax, [edi*4]
    add eax, edi
    mov ecx, 0xa
    add eax, eax
    mov esi, dword [esp + 0x14]
    lea edi, [eax + ebp]
    add esi, eax
    cmp ecx, 4
    jae short loc_08d8
    test cl, 1
    je short loc_08d1
    movsb
loc_08d1:
    shr ecx, 1
    db 0xf3
    movsw
    jmp short loc_0903
loc_08d8:
    test edi, 1
    je short loc_08e2
    movsb
    dec ecx
loc_08e2:
    test edi, 2
    je short loc_08ef
    movsw
    sub ecx, 2
loc_08ef:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_08fd
    movsw
loc_08fd:
    test bl, 1
    je short loc_0903
    movsb
loc_0903:
    movsx eax, word [esp + 0x1c]
    mov ebx, dword [eax*4 + LINK_ADDRESS_15]
    inc ebx
    inc edx
    mov dword [eax*4 + LINK_ADDRESS_15], ebx
    xor eax, eax
    mov al, byte [LINK_ADDRESS_24]
    cmp edx, eax
    jl near loc_0888
    jmp near loc_004d
loc_092c:
    mov edx, LINK_ADDRESS_11
    mov eax, LINK_ADDRESS_26
    call STRCPY
    movsx eax, word [esp + 0x18]
    xor dl, dl
    mov byte [eax + LINK_ADDRESS_28], dl
    mov eax, LINK_ADDRESS_26
    call 0x107a0
    mov eax, 0xf3
    mov dh, 1
    call LINK_ADDRESS_29
    mov byte [LINK_ADDRESS_30], dh
    mov byte [LINK_ADDRESS_31], dh
    jmp near loc_004d
loc_096f:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_11]
    mov dword [LINK_ADDRESS_32], eax
    mov dword [LINK_ADDRESS_33], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_34]
    mov dword [LINK_ADDRESS_35], eax
    mov dword [LINK_ADDRESS_36], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_37]
    mov dword [LINK_ADDRESS_38], eax
    mov dword [LINK_ADDRESS_39], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_40]
    mov dword [LINK_ADDRESS_41], eax
    mov dword [LINK_ADDRESS_42], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_43]
    mov dword [LINK_ADDRESS_44], eax
    mov dword [LINK_ADDRESS_45], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_46]
    mov dword [LINK_ADDRESS_47], eax
    mov dword [LINK_ADDRESS_48], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_49]
    mov dword [LINK_ADDRESS_50], eax
    mov dword [LINK_ADDRESS_51], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_52]
    mov dword [LINK_ADDRESS_53], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_54]
    mov dword [LINK_ADDRESS_55], eax
    mov dword [LINK_ADDRESS_56], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_57]
    movsx edx, word [CONNECTHEAD]
    mov dword [LINK_ADDRESS_58], eax
    mov dword [LINK_ADDRESS_59], eax
    jmp short loc_0a36
loc_0a1d:
    movsx ebp, dx
    mov eax, ebp
    call LINK_ADDRESS_60
    mov eax, ebp
    call LINK_ADDRESS_61
    movsx edx, word [nosplit edx*2 + CONNECTPOINT2]
loc_0a36:
    test edx, edx
    jge short loc_0a1d
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    mov bl, byte [LINK_ADDRESS_38]
    mov dl, byte [LINK_ADDRESS_32]
    mov al, byte [LINK_ADDRESS_35]
    call LINK_ADDRESS_62
    mov eax, dword [LINK_ADDRESS_53]
    mov dword [LINK_ADDRESS_63], eax
    mov eax, 4
    call LINK_ADDRESS_64
    jmp near loc_004d
loc_0a6f:
    cmp byte [LINK_ADDRESS_11], 0x75
    je short loc_0a82
    mov eax, 0x98
    call LINK_ADDRESS_5
loc_0a82:
    mov edx, 2
    jmp short loc_0a99
loc_0a89:
    movsx eax, word [esp + 0x1c]
    inc edx
    shl eax, 5
    mov byte [edx + eax + LINK_ADDRESS_65], cl
loc_0a99:
    mov cl, byte [edx + LINK_ADDRESS_7]
    test cl, cl
    jne short loc_0a89
    movsx eax, word [esp + 0x1c]
    shl eax, 5
    mov byte [edx + eax + LINK_ADDRESS_66], cl
    jmp near loc_004d
loc_0ab7:
    mov edx, 1
    movsx esi, word [esp + 0x1c]
    movsx eax, word [esp + 0x18]
    cmp edx, eax
    jl short loc_0acf
    jmp near loc_004d
loc_0acf:
    mov ebx, esi
    shl ebx, 4
    add ebx, esi
    inc edx
    lea ebx, [ebx*4]
    movzx edi, byte [edx + LINK_ADDRESS_67]
    mov dword [ebx + edx*4 + LINK_ADDRESS_68], edi
    cmp edx, eax
    jl short loc_0acf
    jmp near loc_004d
loc_0af5:
    cmp dword [LINK_ADDRESS_69], 0
    je near loc_004d
    cmp dword [LINK_ADDRESS_70], 0
    je near loc_004d
    cmp dword [LINK_ADDRESS_68], 1
    je near loc_004d
    cmp dword [LINK_ADDRESS_71], 0xd
    je near loc_004d
    xor eax, eax
    mov al, byte [LINK_ADDRESS_11]
    dec eax
    call LINK_ADDRESS_72
    mov dword [LINK_ADDRESS_73], eax
    cmp byte [eax], 0x43
    jne short loc_0b5d
    xor edx, edx
    mov dl, byte [LINK_ADDRESS_11]
    neg edx
    push edx
    xor ecx, ecx
    push 0xff
    xor ebx, ebx
    xor edx, edx
    call LINK_ADDRESS_74
    jmp short loc_0b78
loc_0b5d:
    xor edx, edx
    mov dl, byte [LINK_ADDRESS_11]
    neg edx
    push edx
    xor ecx, ecx
    push 0xff
    xor ebx, ebx
    xor edx, edx
    call LINK_ADDRESS_75
loc_0b78:
    mov byte [LINK_ADDRESS_76], 7
    jmp near loc_004d
loc_0b84:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_11]
    mov dword [LINK_ADDRESS_32], eax
    mov dword [LINK_ADDRESS_33], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_34]
    mov dword [LINK_ADDRESS_35], eax
    mov dword [LINK_ADDRESS_36], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_37]
    mov dword [LINK_ADDRESS_38], eax
    mov dword [LINK_ADDRESS_39], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_40]
    mov dword [LINK_ADDRESS_41], eax
    mov dword [LINK_ADDRESS_42], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_43]
    mov dword [LINK_ADDRESS_44], eax
    mov dword [LINK_ADDRESS_45], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_46]
    mov dword [LINK_ADDRESS_47], eax
    mov dword [LINK_ADDRESS_48], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_49]
    mov dword [LINK_ADDRESS_50], eax
    mov dword [LINK_ADDRESS_51], eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_52]
    mov dword [LINK_ADDRESS_63], eax
    mov dword [LINK_ADDRESS_53], eax
    xor eax, eax
    mov edi, LINK_ADDRESS_77
    mov al, byte [LINK_ADDRESS_54]
    mov esi, LINK_ADDRESS_57
    mov dword [LINK_ADDRESS_55], eax
    mov dword [LINK_ADDRESS_56], eax
    xor eax, eax
    movsx edx, dx
    mov al, byte [LINK_ADDRESS_57]
    lea ecx, [edx - 0xb]
    mov dword [LINK_ADDRESS_58], eax
    mov dword [LINK_ADDRESS_59], eax
    cmp ecx, 4
    jae short loc_0c50
    test cl, 1
    je short loc_0c49
    movsb
loc_0c49:
    shr ecx, 1
    db 0xf3
    movsw
    jmp short loc_0c7b
loc_0c50:
    test edi, 1
    je short loc_0c5a
    movsb
    dec ecx
loc_0c5a:
    test edi, 2
    je short loc_0c67
    movsw
    sub ecx, 2
loc_0c67:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_0c75
    movsw
loc_0c75:
    test bl, 1
    je short loc_0c7b
    movsb
loc_0c7b:
    xor bl, bl
    mov byte [edx + LINK_ADDRESS_78], bl
    movsx edx, word [CONNECTHEAD]
    jmp short loc_0ca5
loc_0c8c:
    movsx ebp, dx
    mov eax, ebp
    call LINK_ADDRESS_60
    mov eax, ebp
    call LINK_ADDRESS_61
    movsx edx, word [nosplit edx*2 + CONNECTPOINT2]
loc_0ca5:
    test edx, edx
    jge short loc_0c8c
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    mov bl, byte [LINK_ADDRESS_38]
    mov dl, byte [LINK_ADDRESS_32]
    mov al, byte [LINK_ADDRESS_35]
    call LINK_ADDRESS_62
    mov eax, 4
    call LINK_ADDRESS_64
    jmp near loc_004d
loc_0cd4:
    xor edx, edx
    movsx eax, word [esp + 0x1c]
    mov dword [LINK_ADDRESS_79], edx
    mov dword [LINK_ADDRESS_25], edx
    mov dword [LINK_ADDRESS_80], edx
    mov dword [LINK_ADDRESS_81], edx
    mov dword [eax*4 + LINK_ADDRESS_15], edx
    mov dword [eax*4 + LINK_ADDRESS_22], edx
loc_0d01:
    movsx eax, word [esp + 0x1c]
    mov dl, byte [eax*4 + LINK_ADDRESS_15]
    mov ebp, 1
    test dl, 0x1f
    jne short loc_0d58
    mov eax, dword [esp + 0x1c]
    mov bx, word [CONNECTHEAD]
    cmp ax, bx
    jne short loc_0d58
    movsx eax, bx
    movsx edx, word [nosplit eax*2 + CONNECTPOINT2]
    jmp short loc_0d54
loc_0d34:
    movsx eax, word [MYCONNECTINDEX]
    cmp edx, eax
    jne short loc_0d4b
    movsx eax, byte [ebp + LINK_ADDRESS_7]
    mov dword [LINK_ADDRESS_20], eax
loc_0d4b:
    inc ebp
    movsx edx, word [nosplit edx*2 + CONNECTPOINT2]
loc_0d54:
    test edx, edx
    jge short loc_0d34
loc_0d58:
    movsx edx, word [esp + 0x1c]
    mov ebx, dword [edx*4 + LINK_ADDRESS_15]
    dec ebx
    and ebx, 0xff
    lea eax, [ebx*4]
    add eax, ebx
    mov ebx, LINK_ADDRESS_21
    shl eax, 5
    add ebx, eax
    mov dword [esp + 0xc], ebx
    mov ebx, dword [edx*4 + LINK_ADDRESS_15]
    and ebx, 0xff
    lea eax, [ebx*4]
    add eax, ebx
    mov ebx, LINK_ADDRESS_21
    shl eax, 5
    add ebx, eax
    lea eax, [edx*4]
    mov ecx, 0xa
    add eax, edx
    mov esi, dword [esp + 0xc]
    add eax, eax
    mov dword [esp + 0x14], ebx
    lea edi, [ebx + eax]
    add esi, eax
    cmp ecx, 4
    jae short loc_0dd1
    test cl, 1
    je short loc_0dca
    movsb
loc_0dca:
    shr ecx, 1
    db 0xf3
    movsw
    jmp short loc_0dfc
loc_0dd1:
    test edi, 1
    je short loc_0ddb
    movsb
    dec ecx
loc_0ddb:
    test edi, 2
    je short loc_0de8
    movsw
    sub ecx, 2
loc_0de8:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_0df6
    movsw
loc_0df6:
    test bl, 1
    je short loc_0dfc
    movsb
loc_0dfc:
    xor eax, eax
    mov al, byte [ebp + LINK_ADDRESS_7]
    mov dword [esp + 8], eax
    mov cl, byte [esp + 8]
    inc ebp
    test cl, 1
    je short loc_0e46
    xor eax, eax
    xor edx, edx
    mov al, byte [ebp + LINK_ADDRESS_11]
    mov dl, byte [ebp + LINK_ADDRESS_7]
    shl eax, 8
    mov ebx, edx
    movsx edx, word [esp + 0x1c]
    add ebx, eax
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [esp + 0x14]
    add eax, eax
    add eax, edx
    add ebp, 2
    mov word [eax + 2], bx
loc_0e46:
    test byte [esp + 8], 2
    je short loc_0e81
    xor eax, eax
    xor edx, edx
    mov al, byte [ebp + LINK_ADDRESS_11]
    mov dl, byte [ebp + LINK_ADDRESS_7]
    shl eax, 8
    mov ebx, edx
    movsx edx, word [esp + 0x1c]
    add ebx, eax
    lea eax, [edx*4]
    add eax, edx
    mov ecx, dword [esp + 0x14]
    add eax, eax
    add eax, ecx
    add ebp, 2
    mov word [eax + 4], bx
loc_0e81:
    test byte [esp + 8], 4
    je short loc_0ea9
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [esp + 0x14]
    add eax, eax
    mov ebx, ebp
    add edx, eax
    mov al, byte [ebx + LINK_ADDRESS_7]
    inc ebp
    mov byte [edx], al
loc_0ea9:
    test byte [esp + 8], 8
    je short loc_0ed9
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    mov esi, dword [esp + 0x14]
    add eax, eax
    add eax, esi
    xor edx, edx
    mov ebx, dword [eax + 6]
    mov dl, byte [ebp + LINK_ADDRESS_7]
    xor bl, bl
    or edx, ebx
    inc ebp
    mov dword [eax + 6], edx
loc_0ed9:
    test byte [esp + 8], 0x10
    je short loc_0f0c
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    mov edi, dword [esp + 0x14]
    add eax, eax
    xor edx, edx
    add eax, edi
    mov dl, byte [ebp + LINK_ADDRESS_7]
    mov ebx, dword [eax + 6]
    shl edx, 8
    xor bh, bh
    or edx, ebx
    inc ebp
    mov dword [eax + 6], edx
loc_0f0c:
    test byte [esp + 8], 0x20
    je short loc_0f43
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [esp + 0x14]
    add eax, eax
    xor ebx, ebx
    add eax, edx
    mov bl, byte [ebp + LINK_ADDRESS_7]
    mov edx, dword [eax + 6]
    shl ebx, 0x10
    and edx, 0xff00ffff
    or edx, ebx
    inc ebp
    mov dword [eax + 6], edx
loc_0f43:
    test byte [esp + 8], 0x40
    je short loc_0f7a
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    mov ebx, dword [esp + 0x14]
    add eax, eax
    xor edx, edx
    add eax, ebx
    mov dl, byte [ebp + LINK_ADDRESS_7]
    mov ebx, dword [eax + 6]
    shl edx, 0x18
    and ebx, 0xffffff
    or edx, ebx
    inc ebp
    mov dword [eax + 6], edx
loc_0f7a:
    test byte [esp + 8], 0x80
    je short loc_0fa3
    movsx edx, word [esp + 0x1c]
    lea eax, [edx*4]
    add eax, edx
    mov edx, dword [esp + 0x14]
    add eax, eax
    mov ebx, ebp
    add edx, eax
    mov al, byte [ebx + LINK_ADDRESS_7]
    inc ebp
    mov byte [edx + 1], al
loc_0fa3:
    movsx eax, word [esp + 0x1c]
    mov edx, 1
    add dword [eax*4 + LINK_ADDRESS_15], edx
    jmp near loc_1049
loc_0fb9:
    movsx edi, word [esp + 0x1c]
    mov esi, dword [edi*4 + LINK_ADDRESS_15]
    and esi, 0xff
    lea eax, [esi*4]
    add eax, esi
    mov ebx, LINK_ADDRESS_21
    shl eax, 5
    add ebx, eax
    lea eax, [edi*4]
    add eax, edi
    mov ecx, 0xa
    add eax, eax
    mov esi, dword [esp + 0x14]
    lea edi, [ebx + eax]
    add esi, eax
    cmp ecx, 4
    jae short loc_1009
    test cl, 1
    je short loc_1002
    movsb
loc_1002:
    shr ecx, 1
    db 0xf3
    movsw
    jmp short loc_1034
loc_1009:
    test edi, 1
    je short loc_1013
    movsb
    dec ecx
loc_1013:
    test edi, 2
    je short loc_1020
    movsw
    sub ecx, 2
loc_1020:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_102e
    movsw
loc_102e:
    test bl, 1
    je short loc_1034
    movsb
loc_1034:
    movsx eax, word [esp + 0x1c]
    mov esi, dword [eax*4 + LINK_ADDRESS_15]
    inc esi
    inc edx
    mov dword [eax*4 + LINK_ADDRESS_15], esi
loc_1049:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_24]
    cmp edx, eax
    jl near loc_0fb9
    movsx eax, word [esp + 0x18]
    cmp ebp, eax
    jle short loc_1073
    mov edx, ebp
    sub edx, eax
    push edx
    push 0xc8
    call PRINTF
    add esp, 8
loc_1073:
    movsx eax, word [esp + 0x18]
    cmp ebp, eax
    je near loc_004d
    movsx edx, word [esp + 0x1c]
    mov esi, ebp
    lea eax, [edx*4]
    inc ebp
    shl edx, 8
    mov ebx, dword [eax + LINK_ADDRESS_22]
    mov edi, dword [eax + LINK_ADDRESS_22]
    and ebx, 0xff
    inc edi
    add ebx, edx
    mov dl, byte [esi + LINK_ADDRESS_7]
    mov dword [eax + LINK_ADDRESS_22], edi
    mov byte [ebx + LINK_ADDRESS_23], dl
    jmp short loc_1073
loc_10bb:
    movsx eax, word [esp + 0x1c]
    inc byte [eax + LINK_ADDRESS_83]
    jmp near loc_004d
loc_10cb:
    mov eax, 0xf8
    call LINK_ADDRESS_5
    jmp near loc_004d
loc_10da:
    add esp, 0x20
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea eax, [dword eax + 0]
    lea edx, [dword edx + 0]
